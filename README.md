# Linux Configs

A personal Linux configuration repository.

This repo is meant to keep Linux setup files in one place so they are easy to reuse, version, and share across machines.

## What this repo contains

Right now:

- `starship.toml`: Starship prompt configuration
- `fastfetch/`: Fastfetch configuration and custom logo
- `terminal.md`: Linux setup guide for installing and using Starship and Fastfetch

Over time, this repo can include other Linux configs such as:

- Shell configs (`.bashrc`, `.zshrc`, Fish config)
- Terminal emulator configs
- Git config snippets
- Editor/tooling configs
- Theme and prompt settings

## Current structure

```text
.
├── README.md
├── starship.toml
├── terminal.md
└── fastfetch/
	├── config.jsonc
	└── logo.txt
```

## Usage

For the current Starship and Fastfetch setup, follow the steps in `terminal.md`.

## Goal

Build a single source of truth for Linux environment configuration so new machine setup is faster and consistent.
