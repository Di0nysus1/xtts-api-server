import pyaudio
import sys

def safe_str(value):
    try:
        # Versuche die Kodierung als utf-8 und ignoriere fehlerhafte Zeichen
        return value.encode('latin1', errors='ignore').decode('utf-8')
    except UnicodeDecodeError:
        # Falls eine UnicodeDecodeError auftritt, gib den Originalwert zurück
        return value

p = pyaudio.PyAudio()

seen_devices = set()
for i in range(p.get_device_count()):
    info = p.get_device_info_by_index(i)
    if info['maxOutputChannels'] > 0 and info['name'] not in seen_devices:
        # Sicherstellen, dass der Gerätename korrekt angezeigt wird
        device_name = safe_str(info['name'])
        print(f"Device {i}: {device_name} - Max Output Channels: {info['maxOutputChannels']}")
        seen_devices.add(device_name)
print("")
