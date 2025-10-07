# Easily create subtitles file and a subbed video file.

A tool for macOS to easily transcribe video files using Whisper from OpenAI. It can batch-process an entire directory, generating both an `.srt` subtitle file and a new video file with embedded soft subtitles.

**Special Note:** The first time you run **1-Allow-Run.command**, your Mac may block it because it’s not from an Apple-signed developer.  

To allow it to run:

1. Open **System Settings → Privacy & Security**.  
2. Scroll to the bottom and look for a message about **1-Allow-Run.command** being blocked.  
3. Click **“Allow Anyway”**, then run the file again.  
4. When prompted, enter your Mac password to confirm.

After this, the script will run normally.

## Features

-   **Transcribe or Translate**: Transcribes audio from video files into English text. If the source language is not English, it will translate it to English.
-   **SRT and Subtitled Video Output**: For each video, it generates a `.srt` subtitle file and a `_subbed.mp4` file with embedded soft subtitles.
-   **Automatic Language Detection**: Automatically detects the language of the audio.
-   **Smart Processing**: Skips videos that already have a corresponding `.srt` file or are `_subbed` versions.
-   **Self-Contained**: Includes all necessary binaries (`ffmpeg`, `whisper-cli`) and scripts.  Only the model needs to be download.

## Prerequisites

-   macOS

## Installation & Setup

The project is designed to be easy to set up and to get started with. Follow these steps in order:

1.  **Allow Execution**: Double-click on `1-Allow-Run.command`. This script will make all the necessary scripts and binaries executable. You may need to grant permission in System Settings -> Privacy & Security.

2.  **Download the Model**: Double-click on `2-Download-Model.command`. This will download the `ggml-large-v2.bin` Whisper model (approximately 2.9 GB) and place it in the `models/` directory.  This will take a while, be patient.

## Usage

1.  **Add Videos**: Add your video files (e.g., `.mp4`, `.mov`) into the `video/` directory.

2.  **Run Transcription**: Simply double-click `Transcribe.command`.
    -   It will scan the `video/` directory and transcribe any videos that do not already have an `.srt` file.

3.  **Find Output Files**: The output files (`.srt` and `_subbed.mp4`) will be created in the same directory as the source video files.

## How It Works

The transcription process follows these steps for each video file:

1.  **Audio Extraction**: `ffmpeg` extracts the audio from the video file into a temporary 16kHz mono WAV file.
2.  **Language Detection**: `whisper-cli` analyzes the audio to auto-detect the spoken language.
3.  **Transcription/Translation**: `whisper-cli` processes the audio using the downloaded model to generate subtitles. If the detected language is English, it transcribes it. If it's another language, it translates it to English.
4.  **Subtitle Embedding**: `ffmpeg` creates a new MP4 file (`<video_name>_subbed.mp4`) by copying the original video and audio streams and embedding the newly generated `.srt` file as a soft subtitle track. Quicktime player and VLC allows you to select the English subtitles track to be displayed on video.

## Folder Structure

```
/
├── 1-Allow-Run.command      # Makes scripts and binaries executable.
├── 2-Download-Model.command # Downloads the Whisper model.
├── Transcribe.command       # The main script to run transcriptions.
├── bin/                     
│   └── ffmpeg, whisper-cli, & shell scripts.
├── models/                  # Whisper model                  
└── video/                   # Directory for your video files.
```

## Dependencies

This project bundles the following open-source tools:

-   [Whisper.cpp](https://github.com/ggerganov/whisper.cpp) (`whisper-cli`)
-   [ffmpeg](https://ffmpeg.org/)

