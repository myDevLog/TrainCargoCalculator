require "gui"
require "calculate_c_wagon_cap"

local calculator_frame = nil

script.on_event(defines.events.on_gui_opened,
    function(event)
        local selected_entity = event.entity

        if selected_entity == nil then
            return nil, "TCC-on_gui_opened: selected_entity is nil"
        end

        if selected_entity.name ~= "locomotive" then
            return nil, "TCC-on_gui_opened: selected_entity is not a locomotive"
        end
		
        if calculator_frame ~= nil then
            return nil, "TCC-on_gui_opened: gui has already been built"
        end
        
        calculator_frame = build_gui(event.player_index)

        if calculator_frame == nil then
            return nil, "TCC-on_gui_opened: build_gui() has returned a nil value"
        end
    end
)



script.on_event(defines.events.on_gui_click,
    function(event)

        if event.element.valid ~= true then
            return nil, "TCC-on_gui_click: gui-element is not valid"
        end

        if event.element.name == "tcc_window_caption" then
            -- not using intermediate variable for caption, because event.element is reference 
            if event.element.caption[1] == ({"titleFull"})[1] then
                event.element.caption = {"titleShort"}
                calculator_frame.visible = false
            else
                event.element.caption = {"titleFull"}
                calculator_frame.visible = true
            end
        end

        if event.element.name == "calculated_cargo_output" or event.element.name == "calculated_fluid_output" then
            event.element.select_all()
        end
    end
)


script.on_event(defines.events.on_gui_elem_changed,
    function(event)
        
    end
)