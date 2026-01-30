
# PopOS‑Mod

A Pop!_OS customization script focused on COSMIC Desktop Environment.  
Designed for optimal setups on laptops and touch devices.
Automates essential package installation, COSMIC configuration, and system tweaks for an enhanced Pop!_OS experience.



## 📦 Features

- Optimized for Pop!_OS with COSMIC DE
- Lightweight and fast, perfect for laptops and touch devices
- Optional Microsoft Surface kernel support
- Touch-friendly configuration (3-finger workspace gestures)
- Applies [Piercing‑Dots](https://github.com/PiercingXX/piercing-dots) minimal dotfiles



## 🚀 Quick Start

```bash
git clone https://github.com/PiercingXX/PopOS-Mod
cd PopOS-Mod
chmod -R u+x scripts/
./popos-mod.sh
```



## 🛠️ Usage

Run `./popos-mod.sh` and follow the prompts.  



## Linux on NuVision 8" Tablet TM800W610L
Wi-Fi and bluetooth drivers are not found in linux kernel by default. I ripped the wifi driver out of the windows install but the bluetooth driver was a royal pain. Had to rebuild it from binary...4 hours of my life gone.
    - Wi-Fi and Bluetooth both work perfectly now.

Audio is also non-functional out of the box.

Screen orientation is rotated 90° and does not auto-rotate until you install the Wi-Fi driver.

**How to fix:**

Just run the `nuvision-tablet-drivers.sh` script. This script is also included in the menu of the main `popos-mod.sh` installer.

Check the [README](https://github.com/Piercingxx/PopOS-Mod/blob/main/resources/NuVision-8in-tablet/README.md) for more information.




## 🔧 Optional Scripts

| Script                | Purpose                                 |
|-----------------------|-----------------------------------------|
| `scripts/step-1.sh`   | Core system setup and dependencies      |
| `kootigers-drivers.sh` | Copies drivers and applies patch       |
| `nuvision-tablet-drivers.sh` | Copies drivers and applies patch |
| `scripts/surface-kernel-setup.sh` | Installs Microsoft Surface kernel |

---

## 📄 License

MIT © PiercingXX  
See the LICENSE file for details.

---

## 🤝 Contributing

Fork, branch, and PR welcome.  

---

## 📞 Support & Contact

    Email: Don’t

    Open an issue in the relevant repo instead. If it’s a rant make it entertaining.