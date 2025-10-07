# Whisper Transcription CLI

A self-contained command-line tool for macOS to easily transcribe video files using Whisper.cpp. It can process a single video file or batch-process an entire directory, generating both an `.srt` subtitle file and a new video file with embedded soft subtitles.

## Features

-   **Transcribe or Translate**: Transcribes audio from video files into English text. If the source language is not English, it will translate it to English.
-   **SRT and Subtitled Video Output**: For each video, it generates a `.srt` subtitle file and a `_subbed.mp4` file with embedded, selectable soft subtitles.
-   **Automatic Language Detection**: Automatically detects the language of the audio.
-   **Manual Language Override**: Provides an option to manually specify the source language for transcription or translation.
-   **Smart Processing**: Skips videos that already have a corresponding `.srt` file or are `_subbed` versions.
-   **Self-Contained**: Includes all necessary binaries (`ffmpeg`, `whisper-cli`) and scripts.

## Prerequisites

-   macOS

## Installation & Setup

The project is designed to be easy to set up. Follow these steps in order:

1.  **Allow Execution**: Double-click on `1-Allow-Run.command`. This script will make all the necessary scripts and binaries executable. You may need to grant permission in System Settings.

2.  **Download the Model**: Double-click on `2-Download-Model.command`. This will download the `ggml-large-v2.bin` Whisper model (approximately 2.9 GB) from Hugging Face and place it in the `models/` directory.

## Usage

1.  **Place Videos**: Add your video files (e.g., `.mp4`, `.mov`) into the `video/` directory.

2.  **Run Transcription**: Double-click `Transcribe.command`.
    -   By default, it will scan the `video/` directory and transcribe any videos that do not already have an `.srt` file.
    -   Alternatively, you can drag and drop a single video file or a folder onto the `Transcribe.command` icon to process just that item.

3.  **Find Output**: The output files (`.srt` and `_subbed.mp4`) will be created in the same directory as the source video files.

### Command-Line Usage (Advanced)

You can also run the main script from the terminal for more control.

```bash
# Transcribe all videos in the default video/ directory
./Transcribe.command

# Transcribe a specific file
./Transcribe.command /path/to/your/video.mp4

# Transcribe all videos in a specific directory
./Transcribe.command /path/to/your/folder/

# Force transcription for a specific language (e.g., Spanish 'es')
./Transcribe.command -l es /path/to/your/video.mp4
```

## How It Works

The transcription process follows these steps for each video file:

1.  **Audio Extraction**: `ffmpeg` extracts the audio from the video file into a temporary 16kHz mono WAV file.
2.  **Language Detection**: `whisper-cli` analyzes the audio to auto-detect the spoken language.
3.  **Transcription/Translation**: `whisper-cli` processes the audio using the downloaded model to generate subtitles. If the detected language is English, it transcribes it. If it's another language, it translates it to English.
4.  **Subtitle Embedding**: `ffmpeg` creates a new MP4 file (`<video_name>_subbed.mp4`) by copying the original video and audio streams and embedding the newly generated `.srt` file as a soft subtitle track (mov_text).

## Folder Structure

```
/
├── 1-Allow-Run.command     # Makes scripts and binaries executable.
├── 2-Download-Model.command# Downloads the Whisper ASR model.
├── Transcribe.command      # The main script to run transcriptions.
├── bin/                    # Contains required binaries and scripts.
│   ├── ffmpeg
│   └── whisper-cli
├── models/                 # Stores the downloaded Whisper model.
└── video/                  # Default directory for your video files.
```

## Dependencies

This project bundles the following open-source tools:

-   [Whisper.cpp](https://github.com/ggerganov/whisper.cpp) (`whisper-cli`)
-   [ffmpeg](https://ffmpeg.org/)

## License

This project is released under the MIT License.
