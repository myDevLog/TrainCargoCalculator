-- file to calculate the capacity for a given item of one Cargo-Wagon

function calculate_c_wagon_cap(item, wagon)
    if item == nil then
        return nil, "TCC-calculate_c_wagon_cap - Argument #1: should have been an item-string, got a nil"
    end
    
    
    if wagon ~= nil then
        local wagon_size = game.entity_prototypes["cargo-wagon"].inventory_size
        game.print(wagon_size)
    end

    local max_cap = game.item_prototypes[item].stack_size
    game.print(max_cap)

    return nil
end