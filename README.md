<div align="center">

# 🐉 Kali BSPWM Installation Guide 🐉

</div>

<p align="center">
  <a href="#-english-installation">🇺🇸 English</a> |
  <a href="#-instalación-en-español">🇲🇽 Español</a>
</p>

---

<details>
<summary><h1>🇺🇸 English Installation</h1></summary>

# 🇺🇸 English Installation

Welcome to my Kali Linux customization auto-install repository.  
This project installs and configures my custom BSPWM environment automatically.

## 1. Update your system

```bash
sudo apt update -y
```
```bash
sudo apt upgrade -y
```

## 2. Clone the repository

```bash
git clone https://github.com/ZLCube/KaliAutobspwm.git && cd KaliAutobspwm
```

## 3. Give execution permissions to the installer

```bash
chmod +x Autoinstall.sh
```

## 4. Run the installer

```bash
./Autoinstall.sh
```

## 5. Restart your session

```bash
kill -9 -1
```

</details>

---

<details>
<summary><h1>🇲🇽 Instalación en Español</h1></summary>

# 🇲🇽 Instalación en Español

Bienvenido a mi repositorio de auto instalación para personalización de Kali Linux.  
Este proyecto instala y configura automáticamente mi entorno personalizado de BSPWM.

## 1. Actualiza tu sistema

```bash
sudo apt update -y
```
```
sudo apt upgrade -y
```

## 2. Clona el repositorio

```bash
git clone https://github.com/ZLCube/KaliAutobspwm.git && cd KaliAutobspwm
```

## 3. Asigna permisos de ejecución

```bash
chmod +x Autoinstall.sh
```

## 4. Ejecuta el instalador

```bash
./Autoinstall.sh
```

## 5. Reinicia tu sesión

```bash
kill -9 -1
```

</details>

---

# Showcase

Environment demo

![Preview](./Showcase/base.png)

Polybar & EWW bars

![Preview](./Showcase/bars.png)

EWW widgets

![Preview](./Showcase/eww.png)

User and Root shells

![Preview](./Showcase/shells.png)

Rofi app search bar theme

![Preview](./Showcase/rofi.png)

Shell image preview plugin

![Preview](./Showcase/plugins.png)

Starship folder git status

![Preview](./Showcase/repostat.png)

Just a funny plugin for audio track

![Preview](./Showcase/cava_audio_waves.png)

---

# Features & Dependencies

| Dependency | Description | Repository |
|---|---|---|
| BSPWM | Binary space partitioning window manager | [bspwm](https://github.com/baskerville/bspwm) |
| SXHKD | Simple X hotkey daemon for keyboard shortcuts | [sxhkd](https://github.com/baskerville/sxhkd) |
| Picom | Compositor for transparency, blur and animations | [picom](https://github.com/yshui/picom) |
| EWW | ElKowars Wacky Widgets for desktop widgets | [eww](https://github.com/elkowar/eww) |
| Rofi Network Manager | NetworkManager menu integration for Rofi | [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu) |
| Starship | Cross-shell customizable prompt | [starship](https://github.com/starship/starship) |

---

# Shortcuts

```
  ____   _____ _______          ____  __    _____ _                _             _       
 |  _ \ / ____|  __ \ \        / /  \/  |  / ____| |              | |           | |      
 | |_) | (___ | |__) \ \  /\  / /| \  / | | (___ | |__   ___  _ __| |_ ___ _   _| |_ ___ 
 |  _ < \___ \|  ___/ \ \/  \/ / | |\/| |  \___ \| '_ \ / _ \| '__| __/ __| | | | __/ __|
 | |_) |____) | |      \  /\  /  | |  | |  ____) | | | | (_) | |  | || (__| |_| | |_\__ \
 |____/|_____/|_|       \/  \/   |_|  |_| |_____/|_| |_|\___/|_|   \__\___|\__,_|\__|___/
                                                                                         

windows + enter abre terminal 
windows + w cierra terminal
windows + d abre el buscador de aplicaciones
windows hold mover libremente la ventana
windows clic derecho reescalar libremente la ventana
windows + alt + flechas escalar ventana
windows + ctrl + flechas mover ventana
control + shift + t abre pestaña en terminal
control shift alt t renombrar pestaña de terminal
control shift w cerrar pestaña de terminal
windows + "1,2,3,4,5,6,7,8,9,0" cambiar de escritorio
windows + shift + "1,2,3,4,5,6,7,8,9,0" cambiar de escritorio la ventana actual al escritorio seleccionado


Los dot files los puedes modificar en las siguientes rutas.

~/.config/bspwm/bspwmrc
~/.config/polybar/
~/.config/picom/picom.conf
~/.config/sxhkd/sxhkdrc
```
# Credits

Huge thanks to all the developers and projects that made this customization possible.
    
