#!/usr/bin/env bash

# Adwaita Tint Theme Install Script

THEME_DIR="$HOME/.themes/adwaita-tint-theme"
GTK4_DIR="$HOME/.config/gtk-4.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Adwaita Tint Theme..."

# Create directories
mkdir -p "$THEME_DIR"
mkdir -p "$GTK4_DIR"

# Backup existing gtk.css if exists
if [ -f "$GTK4_DIR/gtk.css" ]; then
    echo "Backing up existing gtk.css..."
    cp "$GTK4_DIR/gtk.css" "$GTK4_DIR/gtk.css.backup"
fi

# Install gnome-shell directory (no backup needed)
cp -r "$SCRIPT_DIR/gnome-shell" "$THEME_DIR/"
echo "✓ Installed gnome-shell directory to $THEME_DIR/"

# Install gtk-4.0/gtk.css
cp "$SCRIPT_DIR/gtk-4.0/gtk.css" "$GTK4_DIR/gtk.css"
echo "✓ Installed gtk.css to $GTK4_DIR/"

echo ""
echo "Installation complete!"
if [ -f "$GTK4_DIR/gtk.css.backup" ]; then
    echo "Backup saved to: $GTK4_DIR/gtk.css.backup"
fi
echo "Please use user-theme extension to set this theme."
