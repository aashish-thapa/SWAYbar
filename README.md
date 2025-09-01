# Waybar Config for UBUNTU Inspired by Meechabar
<img width="1928" height="38" alt="image" src="https://github.com/user-attachments/assets/05824ee3-6a86-4ca3-8faf-bf8f00eb2419" />

## 1. Overview

This repository contains my personalized configuration for **Waybar**, a customizable status bar designed for Wayland compositors (Sway, Hyprland, etc.). Your setup includes customized modules, layouts, and styling, along with supporting scripts and themes for a tailored experience.

The structure includes:

* `config.jsonc` — your custom configuration file
* `style.css`, `theme.css`, `waybar-style.css` — custom styling
* `scripts/` and `themes/` directories with additional resources

---

## 2. Prerequisites (Ubuntu)

Ensure your system is updated and install the following **build tools and dependencies**:

```bash
sudo apt update
sudo apt install -y \
  clang-tidy \
  cmake \
  meson \
  ninja-build \
  scdoc \
  wayland-protocols \
  pkg-config
```

### Required Libraries

These match the official Waybar dependencies and ensure compatibility with your configuration:

```bash
sudo apt install -y \
  libdbusmenu-gtk3-dev \
  libevdev-dev \
  libfmt-dev \
  libgirepository1.0-dev \
  libgtk-3-dev \
  libgtkmm-3.0-dev \
  libinput-dev \
  libjsoncpp-dev \
  libmpdclient-dev \
  libnl-3-dev \
  libnl-genl-3-dev \
  libpulse-dev \
  libsigc++-2.0-dev \
  libspdlog-dev \
  libwayland-dev \
  libxkbregistry-dev \
  gobject-introspection \
  upower
```

These are the same dependencies used by the core Waybar project on Ubuntu ([GitHub][1]).

---

## 3. Clone & Build the Core Waybar (if not already installed)

If you haven’t already, clone the official Waybar source and build it:

```bash
git clone https://github.com/Alexays/Waybar.git
cd Waybar
meson setup build
ninja -C build
./build/waybar  # test it
sudo ninja -C build install
```

This ensures compatibility before applying your custom configuration ([GitHub][1]).

---

## 4. Integrate Your Custom Configuration

### Directory Setup

Place your repository content into a configuration directory:

```bash
mkdir -p ~/.config/waybar
cp /path/to/aashish-thapa/waybar/config.jsonc ~/.config/waybar/config
cp /path/to/aashish-thapa/waybar/*.css ~/.config/waybar/
mkdir -p ~/.config/waybar/scripts ~/.config/waybar/themes
cp -r /path/to/aashish-thapa/waybar/scripts/* ~/.config/waybar/scripts/
cp -r /path/to/aashish-thapa/waybar/themes/* ~/.config/waybar/themes/
```

### Launch Waybar with Customization

Run Waybar with your custom config:

```bash
waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css
```

Or simply:

```bash
waybar
```

Waybar will auto-detect `~/.config/waybar/config` and uses CSS files in the same folder.

---

## 5. Styling Guidelines

Your repository includes multiple CSS files:

* `style.css`
* `theme.css`
* `waybar-style.css`

Use one or combine them as needed according to your theming strategy—modular CSS allows layered styling, just like modules configuration in Waybar.

---

## 6. Auto-Start Waybar in Your Compositor

In your compositor configuration (e.g., Sway or Hyprland), add:

```bash
exec waybar
```

This ensures Waybar runs automatically on session start.

---

## 7. Troubleshooting Tips

* If encountering GTK-related errors, ensure `GDK_BACKEND` is unset:

  ```bash
  unset GDK_BACKEND
  ```
* Confirm all referenced modules in `config.jsonc` are installed and available.
* Use Waybar’s logs to debug issues:

  ```bash
  waybar --log-level debug
  ```

---

## 8. Summary Table

| Step                    | Description                                              |
| ----------------------- | -------------------------------------------------------- |
| 1. Install Dependencies | Install build tools and libraries                        |
| 2. Build Waybar Core    | Clone & compile Waybar if not installed                  |
| 3. Deploy Custom Config | Copy your config and styles into `~/.config/waybar/`     |
| 4. Launch Waybar        | Run `waybar` to apply custom setup                       |
| 5. Autostart Setup      | Add `exec waybar` to compositor config                   |
| 6. Debug & Troubleshoot | Enable debug logs and ensure environment variables unset |

---


[1]: https://github.com/Alexays/Waybar?utm_source=chatgpt.com "Alexays/Waybar: Highly customizable Wayland bar for ... - GitHub"
