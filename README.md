# home-server

To run the apps:

```bash
docker compose up -d
```

## Install `yt-dlp`

Install `pipx` to manage Python applications:

```bash
sudo apt update
sudo apt install pipx python3-venv -y
pipx ensurepath
source ~/.bashrc

# install yt-dlp
pipx install yt-dlp

# check yt-dlp version
yt-dlp --version

# nstall `ffmpeg` for better video format support:
sudo apt install ffmpeg -y
```

## Set Up Disk Usage Script in MOTD

```bash
sudo cp ./scripts/99-disk-usage /etc/update-motd.d/
sudo chmod +x /etc/update-motd.d/99-disk-usage
```

## Configure Shell Path and Prompt

```bash
cp ./scripts/.shell-aliases ~/
echo "source ~/.bash_profile" >> ~/.bashrc
echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> ~/.bashrc
```

```bash
cat <<EOL > ~/.bash_profile
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
source ~/.shell-aliases
EOL
```

```bash
source ~/.bashrc
```
