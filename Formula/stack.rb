class Stack < Formula
  desc "Terminal dashboard for running a multi-service development stack"
  homepage "https://github.com/CaliLuke/autok-stack"
  url "https://github.com/CaliLuke/autok-stack/releases/download/v0.2.0/autok-stack-0.2.0.tar.gz"
  sha256 "a1b4ef60a6a59b2f6cc327201d3caa0aa1384e4ea445791f58c4a205dbc8e46e"
  license "MIT"

  depends_on "go" => :build

  on_linux do
    depends_on "lsof"
    depends_on "procps"
  end

  conflicts_with "haskell-stack", because: "both install a stack executable"

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "."
  end

  test do
    assert_match "stack #{version}", shell_output("#{bin}/stack --version")
    assert_match "stack.toml", shell_output("#{bin}/stack --help 2>&1")
    (testpath/"stack.toml").write("[stack]\ntitle = \"Homebrew test\"\n")
    assert_match "declares no [[service]] blocks", shell_output("#{bin}/stack 2>&1", 1)
  end
end
