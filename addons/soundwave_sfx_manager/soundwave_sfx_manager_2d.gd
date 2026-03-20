extends Node2D
class_name  SoundwaveSfx2D

@export var songs: Dictionary[String, AudioStream]

func play_song(song_name):
    if songs[song_name]:
        var audio_player = AudioStreamPlayer2D.new()
        add_child(audio_player)
        audio_player.bus = "sfx"
        audio_player.stream = songs[song_name]
        audio_player.play()
        audio_player.finished.connect(audio_player.queue_free)