

### Vista previa de la imagen 


<img width="1928" height="38" alt="image" src="https://github.com/user-attachments/assets/05824ee3-6a86-4ca3-8faf-bf8f00eb2419" />



## 1. Descripción general
Este repositorio contiene mi configuración personalizada para **Waybar**, una barra de estado personalizable diseñada para compositores Wayland (Sway, Hyprland, etc.). Tu configuración incluye módulos, diseños y estilos personalizados, junto con scripts y temas de apoyo para una experiencia a medida.

La estructura incluye:

* `config.jsonc` — tu archivo de configuración personalizado
* `style.css`, `theme.css`, `waybar-style.css` — estilos personalizados
* Directorios `scripts/` y `themes/` con recursos adicionales

---

## 2. Requisitos previos (Ubuntu)

Asegúrate de que tu sistema esté actualizado e instala las siguientes **herramientas de compilación y dependencias**:

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

### Bibliotecas requeridas

Estas coinciden con las dependencias oficiales de Waybar y garantizan la compatibilidad con tu configuración:

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

Estas son las mismas dependencias utilizadas por el proyecto principal de Waybar en Ubuntu ([GitHub][1]).

---

## 3. Clonar y compilar Waybar principal (si aún no está instalado)

Si aún no lo has hecho, clona el código fuente oficial de Waybar y compílalo:

```bash
git clone https://github.com/Alexays/Waybar.git
cd Waybar
meson setup build
ninja -C build
./build/waybar  # test it
sudo ninja -C build install
```

Esto garantiza la compatibilidad antes de aplicar tu configuración personalizada ([GitHub][1]).

---

## 4. Integrar tu configuración personalizada

### Configuración del directorio

Coloca el contenido de tu repositorio en un directorio de configuración:

```bash
mkdir -p ~/.config/waybar
cp /path/to/aashish-thapa/waybar/config.jsonc ~/.config/waybar/config
cp /path/to/aashish-thapa/waybar/*.css ~/.config/waybar/
mkdir -p ~/.config/waybar/scripts ~/.config/waybar/themes
cp -r /path/to/aashish-thapa/waybar/scripts/* ~/.config/waybar/scripts/
cp -r /path/to/aashish-thapa/waybar/themes/* ~/.config/waybar/themes/
```

### Iniciar Waybar con personalización

Ejecuta Waybar con tu configuración personalizada:

```bash
waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css
```

O simplemente:

```bash
waybar
```

Waybar detectará automáticamente `~/.config/waybar/config` y utilizará los archivos CSS en la misma carpeta.

---

## 5. Directrices de estilo

Tu repositorio incluye varios archivos CSS:

* `style.css`
* `theme.css`
* `waybar-style.css`

Utiliza uno o combínalos según sea necesario de acuerdo con tu estrategia de temas: el CSS modular permite un estilo en capas, al igual que la configuración de módulos en Waybar.

---

## 6. Inicio automático de Waybar en tu compositor

En la configuración de tu compositor (por ejemplo, Sway o Hyprland), agrega:

```bash
exec waybar
```

Esto garantiza que Waybar se ejecute automáticamente al iniciar la sesión.

---

## 7. Consejos para solucionar problemas

* Si encuentras errores relacionados con GTK, asegúrate de que `GDK_BACKEND` no esté definido:

  ```bash
  unset GDK_BACKEND
  ```
* Confirma que todos los módulos mencionados en `config.jsonc` estén instalados y disponibles.
* Utiliza los registros de Waybar para depurar problemas:

  ```bash
  waybar --log-level debug
  ```

---
