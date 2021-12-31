/// file_dialog_open_sound()
/// @desc Opens a dialog box for selecting a sound.

return file_dialog_open(text_get("filedialogopensound") + " (*.mp3; *.wav; *.ogg; *.flac; *.wma; *.m4a; *.aac)|*.mp3;*.wav;*.ogg;*.flac;*.wma;*.m4a; .aac;", "", "", text_get("filedialogopensoundcaption"))
