# Homebrew tap for stack

[stack](https://github.com/CaliLuke/autok-stack) runs a multi-service development stack in a terminal dashboard.

## Install

```sh
brew install caliluke/stack/stack
stack --version
```

Homebrew builds the release from source and installs Go as a build dependency.
Run `stack` inside a repository with a `stack.toml` file.
See the [configuration reference](https://github.com/CaliLuke/autok-stack#config--stacktoml) for service definitions.

## Update

```sh
brew update
brew upgrade caliluke/stack/stack
```

If an older `~/.local/bin/stack` appears first on your `PATH`, your shell will use that binary.
Run `which -a stack` to check the command paths.

## Publish an update

1. Publish a tagged release and its source archive in `CaliLuke/autok-stack`.
2. Update the archive URL and SHA-256 checksum in `Formula/stack.rb`.
3. Run `brew reinstall --build-from-source caliluke/stack/stack` and `brew test caliluke/stack/stack`.
4. Commit and push the formula change.
