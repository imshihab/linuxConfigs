# Linux Configs

This repository holds reusable Linux terminal configuration for a fresh machine setup.

The idea is to keep a clean, versioned base config for Zsh, Starship, and Fastfetch, then apply it to a new computer with a simple copy or symlink.

## Apply the shell config on a new computer

From this repo folder:

```bash
cp .zshrc ~/.zshrc
```

Or, if you want the file to stay linked to this repo:

```bash
ln -sf "$(pwd)/.zshrc" ~/.zshrc
```

Then reload it:

```bash
source ~/.zshrc
```

## What the config includes

The `.zshrc` file is purposely kept simple and reusable. It includes:

- better shell history behavior
- autocompletion setup
- zsh autosuggestions and syntax highlighting
- Starship initialization when installed
- zoxide initialization when installed
- useful aliases for listing files, git commands, and logs
- helper functions such as `mkcd` and `extract`

## Important: keep it portable

This is meant to be a generic template, not a machine-specific profile.

Do not keep personal paths or tool-specific exports inside the repo version of `.zshrc` unless they are meant to be shared. For example, remove things like:

- custom user home paths
- personal tool directories
- CLI-specific environment variables
- duplicate PATH exports
- one-off app install locations

Instead, add those lines to your personal shell config only on the machine where they are needed.

## Example of a machine-specific addition

```bash
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
```

These should stay in a local `.zshrc` file, not in the shared repo version.

## VS Code configurations

### Use Ptyxis as the external terminal

VS Code's `terminal.external.linuxExec` setting does not pass command-line arguments. Because Ptyxis uses DBus for single-instance behavior, it can open in the home directory instead of the current project folder.

Use a wrapper script to capture the current directory and pass it to Ptyxis with `--new-window` and `-d`:

1. Create the wrapper script:

   ```bash
   mkdir -p ~/.local/bin
   touch ~/.local/bin/ptyxis-vscode
   ```

2. Add this code to `~/.local/bin/ptyxis-vscode`:

   ```bash
   #!/bin/bash
   exec ptyxis --new-window -d "$(pwd)"
   ```

3. Make the script executable:

   ```bash
   chmod +x ~/.local/bin/ptyxis-vscode
   ```

4. Add this setting to VS Code's `settings.json`:

   ```json
   "terminal.external.linuxExec": "/home/YOUR_USERNAME/.local/bin/ptyxis-vscode"
   ```

Replace `YOUR_USERNAME` with your actual Linux username. VS Code does not always expand `~` in this setting.

## Repo contents

```text
.
├── README.md
├── .zshrc
├── starship.toml
├── terminal.md
├── fastfetch/
│   ├── config.jsonc
│   └── logo.txt
```

## Setup flow for a new machine

1. Install the needed tools:
   - `starship`
   - `fastfetch`
   - `zoxide`
   - `eza`
   - `bat`
2. Copy or symlink this repo's `.zshrc` to `~/.zshrc`
3. Reload the shell with `source ~/.zshrc`
4. Add any machine-specific PATH or app config lines separately
5. Continue with the Starship and Fastfetch setup in `terminal.md`

## Goal

Keep one clean, reusable shell configuration that can be applied quickly to any Linux machine without carrying over local-only environment details.
