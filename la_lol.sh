cat << 'EOF' > play_and_save.sh
#!/bin/bash
# 1. System setup and dependency checks
sudo apt update && sudo apt install -y wine steam vlc python3-pip
pip3 install --break-system-packages yt-dlp

# 2. Pick a random video ID
VIDEO_ID=$(yt-dlp --playlist-end 50 --flat-playlist --print id "https://youtube.com_" | shuf -n 1)

# 3. Permanently download the video asset to the current folder
yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" -o "saby404_video_%(id)s.mp4" "https://youtube.com{VIDEO_ID}"

# 4. Open with VLC and close the player process right after completion
vlc --play-and-exit "saby404_video_${VIDEO_ID}.mp4"
EOF
chmod +x play_and_save.sh && ./play_and_save.sh
