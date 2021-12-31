/// file_dialog_save_movie_gif(filename)
/// @arg filename

return file_dialog_save(text_get("filedialogsavemoviegif") + " (*.gif)|*.gif", filename_get_valid(argument0), project_folder, text_get("filedialogsavemoviecaption"))
