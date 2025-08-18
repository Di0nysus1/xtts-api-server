call venv\Scripts\activate

REM das Argument gibt an, welcher Lautsprecher das ganze ausgeben soll.
REM Du kannst dir alle Audio Devices anschauen mit: call list_AudioDevices.bat
REM Auskommentieren, um das Standart Gerät zu benutzen.
REM set AUDIO_DEVICE=13




REM usage: xtts_api_server [-h] [-hs HOST] [-p PORT] [-sf SPEAKER_FOLDER] [-o OUTPUT] [-t TUNNEL_URL] [-ms MODEL_SOURCE] [--listen] [--use-cache] [--lowvram] [--deepspeed] [--streaming-mode] [--stream-play-sync]
REM 
REM 
REM options:
REM   -h, --help show this help message and exit
REM   -hs HOST, --host HOST
REM   -p PORT, --port PORT
REM   -d DEVICE, --device DEVICE `cpu` or `cuda`, you can specify which video card to use, for example, `cuda:0`
REM   -sf SPEAKER_FOLDER, --speaker-folder The folder where you get the samples for tts
REM   -o OUTPUT, --output Output folder
REM   -mf MODELS_FOLDERS, --model-folder Folder where models for XTTS will be stored, finetuned models should be stored in this folder
REM   -t TUNNEL_URL, --tunnel URL of tunnel used (e.g: ngrok, localtunnel)
REM   -ms MODEL_SOURCE, --model-source ["api","apiManual","local"]
REM   -v MODEL_VERSION, --version You can download the official model or your own model, official version you can find [here](https://huggingface.co/coqui/XTTS-v2/tree/main)  the model version name is the same as the branch name [v2.0.2,v2.0.3, main] etc. Or you can load your model, just put model in models folder
REM   --listen Allows the server to be used outside the local computer, similar to -hs 0.0.0.0
REM   --use-cache Enables caching of results, your results will be saved and if there will be a repeated request, you will get a file instead of generation
REM   --lowvram The mode in which the model will be stored in RAM and when the processing will move to VRAM, the difference in speed is small
REM   --deepspeed allows you to speed up processing by several times, automatically downloads the necessary libraries
REM   --streaming-mode Enables streaming mode, currently has certain limitations, as described below.
REM   --streaming-mode-improve Enables streaming mode, includes an improved streaming mode that consumes 2gb more VRAM and uses a better tokenizer and more context.
REM   --stream-play-sync Additional flag for streaming mod that allows you to play all audio one at a time without interruption

python -m xtts_api_server --lowvram --streaming-mode-improve --stream-play-sync --deepspeed -sf speakers -d cuda:0 -v thorsten.medium --listen
pause
