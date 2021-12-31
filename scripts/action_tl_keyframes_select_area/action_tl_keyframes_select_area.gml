/// action_tl_keyframes_select_area(starttimeline, endtimeline, startposition, endposition)
/// @arg starttimeline
/// @arg endtimeline
/// @arg startposition
/// @arg endposition

if (history_undo)
{
	with (history_data)
		history_restore_tl_select()
}
else if (history_redo)
{
	with (history_data)
		history_restore_tl_select_new()
}
else
{
	var stl, etl, spos, epos, hobj;
	stl = argument0
	etl = argument1
	spos = argument2
	epos = argument3
	hobj = history_set(action_tl_keyframes_select_area)
	
	with (hobj)
		history_save_tl_select()
	
	for (var t = stl; t <= etl; t++)
	{
		var tl = tree_visible_list[|t];
		
		if (tl.lock)
			continue
		
		for (var k = 0; k < ds_list_size(tl.keyframe_list); k++)
		{
			var kf, len;
			kf = tl.keyframe_list[|k]
			len = tl_keyframe_length(kf)
			
			if (kf.selected || kf.position + len < spos)
				continue
				
			if (kf.position > epos)
				break
				
			tl_keyframe_select(kf)
		}
	}
	
	with (hobj)
		history_save_tl_select_new()
}

app_update_tl_edit()
