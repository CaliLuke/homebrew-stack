class Stack < Formula
  desc "Terminal dashboard for running a multi-service development stack"
  homepage "https://github.com/CaliLuke/autok-stack"
  url "https://github.com/CaliLuke/autok-stack/releases/download/v0.1.0/autok-stack-0.1.0.tar.gz"
  sha256 "0fd40863932c57e21b27e1117953579431ecfc123983578c21c93e0f967be837"
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
