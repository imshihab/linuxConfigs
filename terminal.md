# Use this starship.toml on Linux

This guide shows how to install Starship and use the `starship.toml` file from this workspace.

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
