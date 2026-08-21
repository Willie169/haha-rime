# haha-rime

This repository provides an installation script for **[哈哈倉頡](https://ejsoon.vip/haha)** on Linux using one of the following Rime input method frontends:

本儲存庫提供安裝腳本以在 Linux 上透過以下 Rime 輸入法前端安裝[哈哈倉頡](https://ejsoon.vip/haha)：

本储存库提供安装脚本以在 Linux 上透过以下 Rime 输入法前端安装[哈哈仓颉](https://ejsoon.vip/haha)：

* [fcitx5-rime](https://github.com/fcitx/fcitx5-rime)
* [ibus-rime](https://github.com/rime/ibus-rime)
* [fcitx-rime](https://github.com/fcitx/fcitx-rime)

This project is licensed under the [MIT License](LICENSE.txt).

本專案採用 [MIT License](LICENSE.txt) 授權。

本专案采用 [MIT License](LICENSE.txt) 授权。

## Installation 安裝 安装

Install your preferred Rime input method frontend with your package manager. Take Ubuntu for example:

使用軟體包管理器安裝您偏好的 Rime 輸入法前端。以 Ubuntu 為例：

使用软件包管理器安装您偏好的 Rime 输入法前端。以 Ubuntu 为例：

```bash
# Fcitx 5
sudo apt install fcitx5-rime

# IBus
sudo apt install ibus-rime

# Fcitx
sudo apt install fcitx-rime
```

Download the installation script and make it executable:

下載安裝腳本並賦予執行權限：

下载安装脚本并赋予执行权限：

```bash
wget https://raw.githubusercontent.com/Willie169/haha-rime/refs/heads/main/install.sh
chmod +x install.sh
```

Then run the script according to your Rime input method frontend:

然後根據所使用的 Rime 輸入法前端執行安裝腳本：

然后根据所使用的 Rime 输入法前端执行安装脚本：

```bash
# Fcitx 5
./install.sh

# IBus
./install.sh -i

# Fcitx
./install.sh -f
```

## Activation 啟用 启用

After running the installation script:

執行安裝腳本後：

执行安装脚本后：

1. Select **Rime** as your input method in your desktop environment's input method settings, which can usually be accessed from the input method menu that can be expanded by clicking the input method icon at the bottom-right corner of the screen.

    在桌面環境的輸入法設定中選擇 **Rime** 作為輸入法，通常可以透過點擊螢幕右下角的輸入法圖示展開輸入法選單來存取該設定。

    在桌面环境的输入法设定中选择 **Rime** 作为输入法，通常可以透过点击萤幕右下角的输入法图示展开输入法选单来存取该设定。
2. Open the Rime configuration menu, which is usually beside the Rime option in the input method menu when Rime is selected.


    開啟 Rime 配置選單，該選單通常在選擇 Rime 時位於輸入法選單中 Rime 選項的旁邊。

    开启 Rime 配置选单，该选单通常在选择 Rime 时位于输入法选单中 Rime 选项的旁边。
3. **Synchronize** and **Deploy** **哈哈倉頡**.

    **Synchronize** 和 **Deploy** **哈哈倉頡**.

    **Synchronize** 和 **Deploy** **哈哈仓颉**.

