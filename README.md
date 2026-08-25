# TWRP Device Tree for Redmi Note 9 5G (cannon)

## Device Specifications

| Feature | Specification |
|---------|--------------|
| Codename | cannon |
| Model | Redmi Note 9 5G |
| Chipset | MediaTek Dimensity 800U (MT6853) |
| CPU | Octa-core (2x2.4 GHz Cortex-A76 + 6x2.0 GHz Cortex-A55) |
| GPU | Mali-G57 MC3 |
| Memory | 4/6/8 GB RAM |
| Storage | 128/256 GB UFS 2.1 |
| Display | 6.53" 1080x2340 IPS LCD |
| Battery | 5000 mAh |
| Android | 10 (MIUI 12) -> 14 (OriginOS 4.0 port) |

## Features

- [x] TWRP 3.6.1 / 3.7.x (twrp-12.1 branch)
- [x] FBE v2 decryption (Android 14)
- [x] Virtual A/B support
- [x] Dynamic partitions (super)
- [x] Metadata partition
- [x] F2FS / EXT4 support
- [x] MTP / ADB Sideload
- [x] fastbootd

## Build Instructions

### Method 1: GitHub Actions (Recommended - No local build environment needed)

1. Fork this repository to your GitHub account
2. Go to the **Actions** tab
3. Select **Build TWRP for Redmi Note 9 5G (cannon)**
4. Click **Run workflow**
5. Wait for the build to complete (~30-60 minutes)
6. Download the `twrp-cannon-twrp-12.1` artifact from the build summary

### Method 2: Local Build

```bash
# Install dependencies (Ubuntu 22.04)
sudo apt-get install -y git-core gnupg flex bison build-essential zip curl \
  zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev \
  x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils \
  xsltproc unzip fontconfig python3

# Install repo
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH

# Initialize TWRP source
mkdir -p ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc --all) --force-sync

# Clone this device tree
git clone https://github.com/YOUR_USERNAME/twrp_device_xiaomi_cannon.git device/xiaomi/cannon

# Build
source build/envsetup.sh
lunch twrp_cannon-eng
mka recoveryimage -j$(nproc --all)

# Output
# out/target/product/cannon/recovery.img
```

## Flashing

### Temporary boot (test first)
```bash
fastboot boot recovery.img
```

### Permanent flash
```bash
fastboot flash recovery recovery.img
```

## Decryption Notes

This device tree is configured for **FBE v2** (file-based encryption v2), which is used by Android 13+. If you're running an older ROM with FBE v1, you may need to modify `recovery/fstab.mt6853` and change `:v2` to `:v1` on the userdata line.

## Credits

- TeamWin for TWRP
- Minimal Manifest TWRP for the build manifest
- Original TWRP porters for cannon
- OriginOS / 渡江OS team for the Android 14 port

## Disclaimer

```
/*
 * Your warranty is now void.
 *
 * I am not responsible for bricked devices, dead SD cards,
 * thermonuclear war, or you getting fired because the alarm app failed. Please
 * do some research if you have any concerns about features included in this ROM
 * before flashing it! YOU are choosing to make these modifications, and if
 * you point the finger at me for messing up your device, I will laugh at you.
 */
```
