# 🎬 Easily Add Subtitles to Your Videos ##
(For M1,2,3,4,5 Mac Silicon Only, not older Intel-based Macs)

This simple tool lets you **automatically create subtitles** for your videos — even if the video is in a foreign language. It generates:

- ✅ A `.srt` subtitles file (usable in most video players)  
- ✅ A new video file with subtitles already embedded, called soft subtitle track that can be enabled inside the video player.

Everything runs locally on your Mac for your privacy — no internet paid transcription services required.  

**Why This Exists?** 

Many videos don’t have subtitles. This tool makes it easy for anyone, **especially Deaf people**, to generate their own accurate subtitles quickly and for free, entirely on their Mac.

---

## 🚨 First-Time Setup (Do only once)

## >> Download the zip file from the **Releases** located on the right side of this page then unzip it. ##

The first time you run `1-Allow-Run.command`, macOS may block it because it’s not from an Apple-signed developer.  
To allow it to run:

1. Open **System Settings → Privacy & Security**.  
2. Scroll to the bottom. You’ll see a message that `1-Allow-Run.command` was blocked.  
3. Click **“Allow Anyway”**.  
4. Run `1-Allow-Run.command` again.  
5. When asked, enter your Mac password to approve it.

After this, you won’t need to repeat these steps.

---

## ✨ What It Can Do

- 📝 **Transcribe or Translate** — Converts spoken audio into English text. If the audio is in another language, it automatically translates it to English.  
- 🧠 **Automatic Language Detection** — No need to manually specify the language.  
- 💬 **Generates Two Files** — A `.srt` file and a `_subbed.mp4` file with subtitles embedded.  
- 🧼 **Smart Skipping** — Videos that already have subtitles won’t be processed again.  
- 💻 **No Installation Required** — All tools are included. You only need to download the model once.

---

## 🧠 Before You Start

You’ll need:

- A Mac running macOS  
- At least **3 GB** of free space (to store the model)  
- A video file (e.g., `.mp4`, `.mov`) to transcribe

---

## 🛠️ Setup (One-Time)

Follow these steps to prepare everything:

1. **Allow the Scripts to Run**  
   👉 Double-click `1-Allow-Run.command`.  
   This removes macOS security restrictions and sets the correct file permissions.

2. **Download the Whisper Model**  
   👉 Double-click `2-Download-Model.command`.  
   This will download the `ggml-large-v2.bin` model (~2.9 GB) into the `models/` folder.  
   This may take a few minutes — be patient.

---

## ▶️ How to Use

1. **Add Your Videos**  
   Drop any `.mp4`, `.mov`, or similar files into the `video/` folder.

2. **Run the Transcriber**  
   👉 Double-click `Transcribe.command`.  
   It will scan the `video/` folder and process any videos that don’t already have subtitles.

3. **Get Your Results**  
   - You’ll get a `.srt` file next to the original video.  
   - You’ll also get a `<filename>_subbed.mp4` file with the subtitles embedded.  
   You can open it in **QuickTime** or **VLC** to view subtitles.

**Note:** There is a test.mp4 in the video directory you can use to test the transcribing.

---

## 🧠 What Happens Behind the Scenes

For each video:

1. 🎧 **Audio Extraction** — `ffmpeg` extracts audio into a temporary file.  
2. 🌍 **Language Detection** — `whisper-cli` figures out which language is spoken.  
3. ✍️ **Transcription / Translation** — Whisper generates English subtitles.  
4. 💬 **Subtitle Embedding** — `ffmpeg` creates a `_subbed.mp4` file with soft subtitles.

---

## 📁 Folder Overview
```
/
├── 1-Allow-Run.command       # Step 1: Allow scripts to run
├── 2-Download-Model.command  # Step 2: Download the Whisper model
├── Transcribe.command        # Step 3: Transcribe your videos
├── bin/                      # Tools (ffmpeg, whisper-cli, scripts)
├── models/                   # Whisper model file
└── video/                    # Place your videos here
```
---

## 🧩 Included Tools

This project bundles these open-source tools:

- [Whisper.cpp](https://github.com/ggerganov/whisper.cpp) — for transcription & translation  
- [ffmpeg](https://ffmpeg.org/) — for audio extraction & video processing

---

## 💡 Tips

- You can run the transcriber multiple times; it will **skip any videos already processed**.  
- In **VLC** and **QuickTime**, select the subtitle track manually if needed.

---
