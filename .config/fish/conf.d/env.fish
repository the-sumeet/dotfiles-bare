fish_add_path ~/.local/bin

# Go
set -gx GOPATH ~/go
fish_add_path /usr/local/go/bin $GOPATH/bin

# Ruby
fish_add_path ~/.local/share/gem/ruby/3.0.0/bin

# Flutter
fish_add_path ~/flutter/bin ~/flutter/bin

# Homebrew & libpq
fish_add_path /opt/homebrew/bin /opt/homebrew/opt/libpq/bin
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libpq/lib/pkgconfig"

# DuckDB
fish_add_path ~/.duckdb/cli/latest

# Compilers
set -gx LDFLAGS "-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/libpq/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/libpq/include"

# XDG Data Dirs (Fish uses spaces for arrays)
set -gx XDG_DATA_DIRS $XDG_DATA_DIRS /var/lib/flatpak/exports/share /home/sumeet/.local/share/flatpak/exports/share