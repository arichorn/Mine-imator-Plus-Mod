/// action_setting_fps_values(fps_values)
/// @arg fps_values

if (argument0)
{
	if (!question(text_get("questionfpsvalues")))
		return 0
	else
		alert_show(text_get("alertrestartprogramtitle"), text_get("alertrestartprogramtext"), null, "", "", 240)
}

setting_fps_values = argument0
