-- contains the function to build the gui for the specified player

-- temporary
require "calculate_c_wagon_cap"

function build_gui(player_index)
    player = game.get_player(player_index)

    -- check if player is valid, else exit
    if not player.valid then
        return nil, "TCC-build_gui - Argument #1: expected a player, parsed nil"
    end
    

    player.gui.relative.add{type="button", name="tcc_window_caption", caption={"titleShort"}, anchor={gui=defines.relative_gui_type.train_gui, position=defines.relative_gui_position.left}, style="tcc_window_caption"}
    
    calculator_frame = player.gui.relative.add{type="frame", name="calc_frame", direction="vertical", visible=false, anchor={gui=defines.relative_gui_type.train_gui, position=defines.relative_gui_position.left}, style="tcc_calc_frame"}
    
    -- GUI-Element for Calculating the Cargo
    local cargo_flow = calculator_frame.add{type="flow", name="cargo_flow", style="tcc_general_flow"}
    cargo_flow.add{type="choose-elem-button", name="cargo_elem_button", elem_type="item"}
	cargo_flow.cargo_elem_button.elem_value = "iron-ore"
    local item_cap = calculate_c_wagon_cap(cargo_flow.cargo_elem_button.elem_value, nil)
	cargo_flow.add{type="text-box", name="calculated_cargo_output", text=item_cap, style="tcc_textbox"}
    cargo_flow.calculated_cargo_output.read_only = true

    -- Line for separation cargo from fluid calculator
    local separaton_flow = calculator_frame.add{type="flow", name="separator_flow", style="tcc_separation_flow"}
    separaton_flow.add{type="line", name="separation_line"}

    -- GUI-Element for calculating the Fluid
    local fluid_flow = calculator_frame.add{type="flow", name="fluid_flow", style="tcc_general_flow"}
    fluid_flow.add{type="choose-elem-button", name="fluid_elem_button", elem_type="fluid", tooltip={"fluid_button_tooltip"}}
    fluid_flow.fluid_elem_button.elem_value = "water"
    fluid_flow.fluid_elem_button.locked = true
    fluid_flow.add{type="text-box", name="calculated_fluid_output", text="1000000", style="tcc_textbox"}
    fluid_flow.calculated_fluid_output.read_only = true

    return calculator_frame
end