#!/usr/bin/env bash


# Adwaita Tint Theme Uninstall Script

THEME_DIR="$HOME/.themes/adwaita-tint-theme"
GTK4_DIR="$HOME/.config/gtk-4.0"

echo "Uninstalling Adwaita Tint Theme..."

# Remove gnome-shell theme directory (no restore needed)
if [ -d "$THEME_DIR/gnome-shell" ]; then
    rm -rf "$THEME_DIR/gnome-shell"
    echo "✓ Removed gnome-shell theme"
fi

# Restore gtk.css from backup if exists
if [ -f "$GTK4_DIR/gtk.css.backup" ]; then
    echo "Restoring backed up gtk.css..."
    mv "$GTK4_DIR/gtk.css.backup" "$GTK4_DIR/gtk.css"
else
    # No backup, just remove
    if [ -f "$GTK4_DIR/gtk.css" ]; then
        rm "$GTK4_DIR/gtk.css"
        echo "✓ Removed gtk.css (no backup to restore)"
    fi
fi

# Clean up empty directories
rmdir "$THEME_DIR/gnome-shell" 2>/dev/null
rmdir "$THEME_DIR" 2>/dev/null

echo ""
echo "Uninstallation complete!"
