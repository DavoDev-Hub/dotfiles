#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${REPO_DIR:-$PWD}"
TARGET_HOME="${TARGET_HOME:-$HOME}"

# Carpetas que linkearemos (ajústalas a tu repo)
DIRS=("i3" "i3blocks" "picom" "kitty" "nvim" "tmux" "rofi" "dunst" "nitrogen")

backup() {
  local path="$1"
  if [ -e "$path" ] && [ ! -L "$path" ]; then
    local bkp="${path}.backup.$(date +%Y%m%d%H%M%S)"
    echo "  ↪ Backup: $path -> $bkp"
    mv "$path" "$bkp"
  fi
}

link_dir() {
  local src="$1"
  local dst="$2"
  if [ -L "$dst" ] || [ -e "$dst" ]; then
    backup "$dst"
    rm -rf "$dst"
  fi
  ln -s "$src" "$dst"
  echo "  ✓ Link: $dst -> $src"
}

echo "== Dotfiles installer =="
echo "Repo: $REPO_DIR"
echo "Home: $TARGET_HOME"

mkdir -p "$TARGET_HOME/.config"

# 1) Symlinks de config
for d in "${DIRS[@]}"; do
  SRC="$REPO_DIR/$d"
  DST="$TARGET_HOME/.config/$d"
  if [ -d "$SRC" ]; then
    link_dir "$SRC" "$DST"
  else
    echo "  ⚠ Skipping: $SRC (no existe)"
  fi
done

# 2) Fuentes (si las tienes en repo/fonts)
if [ -d "$REPO_DIR/fonts" ]; then
  echo "== Instalando fuentes de usuario =="
  mkdir -p "$TARGET_HOME/.local/share/fonts"
  cp -r "$REPO_DIR/fonts/"* "$TARGET_HOME/.local/share/fonts/" 2>/dev/null || true
  fc-cache -f
fi

# 3) Temas e iconos (opcional)
if [ -d "$REPO_DIR/gtk" ]; then
  echo "== Temas GTK =="
  mkdir -p "$TARGET_HOME/.themes"
  cp -r "$REPO_DIR/gtk/"* "$TARGET_HOME/.themes/" 2>/dev/null || true
fi
if [ -d "$REPO_DIR/icons" ]; then
  echo "== Iconos =="
  mkdir -p "$TARGET_HOME/.icons"
  cp -r "$REPO_DIR/icons/"* "$TARGET_HOME/.icons/" 2>/dev/null || true
fi

# 4) Paquetes (opcional)
if [ -f "$REPO_DIR/packages/manual_packages.txt" ] && command -v apt >/dev/null 2>&1; then
  echo "== (Opcional) Instalación de paquetes manuales =="
  echo "   sudo apt update && xargs -a packages/manual_packages.txt sudo apt install -y"
fi

echo "== Listo. Reinicia i3 (Mod+Shift+R) =="
