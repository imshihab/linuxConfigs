# Linux terminal setup

This guide shows how to install Starship and Fastfetch and use the configurations from this workspace.

## 1) Install icon font support (required)

Starship uses many special symbols. Install a Nerd Font first, then select that font in your terminal profile.

Example install (JetBrainsMono Nerd Font):

```bash
mkdir -p ~/.local/share/fonts
cd /tmp
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
```

After this, open your terminal settings and set the font to a Nerd Font (for example: `JetBrainsMono Nerd Font`).

## 2) Install Starship

Recommended (official installer):

```bash
curl -sS https://starship.rs/install.sh | sh -s -- -y
```

If you prefer distro packages (can be older):

```bash
# Ubuntu/Debian
sudo apt install starship

# Fedora
sudo dnf install starship

# Arch
sudo pacman -S starship
```

## 3) Put this config in ~/.config

From this repository folder:

```bash
mkdir -p ~/.config
cp ./starship.toml ~/.config/starship.toml
```

Or keep it linked to this repo so updates apply automatically:

```bash
mkdir -p ~/.config
ln -sf "$(pwd)/starship.toml" ~/.config/starship.toml
```

## 4) Enable Starship in your shell

### Bash

```bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc
source ~/.bashrc
```

### Zsh

```bash
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc
```

### Fish

```bash
echo 'starship init fish | source' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
```

## 5) Verify

```bash
starship --version
```

Then open a new terminal tab/window. You should see the prompt style from this config.

## 6) Troubleshooting

- If prompt does not change, make sure your shell startup file was updated (`~/.bashrc`, `~/.zshrc`, or Fish config).
- Make sure `~/.config/starship.toml` exists.
- Restart the terminal after setup.

## Fastfetch

Fastfetch displays system information when a terminal starts. This repository includes a JSONC configuration and a text logo that Fastfetch loads from `~/.config/fastfetch`.

### 1) Install Fastfetch

Use your distribution's package manager:

```bash
# Fedora
sudo dnf install fastfetch

# Arch
sudo pacman -S fastfetch

# Ubuntu/Debian
sudo apt install fastfetch
```

If your distribution does not provide a recent package, follow the installation instructions on the [Fastfetch repository](https://github.com/fastfetch-cli/fastfetch).

### 2) Install the configuration

From this repository folder, copy both Fastfetch files:

```bash
mkdir -p ~/.config/fastfetch
cp ./fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
cp ./fastfetch/logo.txt ~/.config/fastfetch/logo.txt
```

To keep the installed files linked to this repository instead, use:

```bash
mkdir -p ~/.config/fastfetch
ln -sf "$(pwd)/fastfetch/config.jsonc" ~/.config/fastfetch/config.jsonc
ln -sf "$(pwd)/fastfetch/logo.txt" ~/.config/fastfetch/logo.txt
```

The `logo.source` setting in `config.jsonc` points to `~/.config/fastfetch/logo.txt`, so keep the logo at that path.

### 3) Verify

```bash
fastfetch --config ~/.config/fastfetch/config.jsonc
```

You should see the custom logo and hardware, software, uptime, and system-age sections.

### 4) Run Fastfetch when a shell starts (optional)

Add this line to the startup file for the shell you use:

```bash
fastfetch
```

For Bash, add it to `~/.bashrc`; for Zsh, add it to `~/.zshrc`; for Fish, add it to `~/.config/fish/config.fish`. Open a new terminal after saving the file.

### Fastfetch troubleshooting

- Make sure both `~/.config/fastfetch/config.jsonc` and `~/.config/fastfetch/logo.txt` exist.
- If the logo is missing, verify that `logo.source` points to `~/.config/fastfetch/logo.txt`.
- If icons appear as boxes, select a Nerd Font in your terminal profile and confirm the font is installed.
