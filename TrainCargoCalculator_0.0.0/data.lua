-- define local constants
local MARGIN = 4
local PADDING = 3
local MAX_WIDTH = 150



-- Basic Style "Sheet" for the GUI
local styles = data.raw["gui-style"].default

styles["tcc_window_caption"] = {
    type = "button_style",
    horizontal_align = "center",
    margin_right = MARGIN,
    margin_left = MARGIN
}

styles["tcc_calc_frame"] = {
    type = "frame_style",
    parent = "inside_shallow_frame",
    margin = MARGIN,
    padding = PADDING
}

styles["tcc_general_flow"] = {
	type = "horizontal_flow_style",
	horizontal_align = "center",
	vertical_align = "center",
	horizontal_spacing = MARGIN,
    padding = PADDING
}

styles["tcc_separation_flow"] = {
	type = "horizontal_flow_style",
	horizontal_align = "center",
    margin = MARGIN
}

styles["tcc_textbox"] = {
    type = "textbox_style",
    parent = "other_settings_gui_textbox",
    maximal_width = MAX_WIDTH
}
