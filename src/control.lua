
function round(num, numDecimalPlaces)
  local mult = 10 ^ (numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

--


script.on_event(defines.events.on_selected_entity_changed, function(event)
  local player = game.get_player(event.player_index)
  local entity = player.selected

  if entity and entity.name == "se-core-miner-drill" then


    game.print(entity.name)
    game.print(entity.type)

    local core_miners_on_this_surface = #entity.surface.find_entities_filtered({name = "se-core-miner-drill"})

    -- game.print(serpent.block(entity.mining_target))

    -- print(serpent.block( entity.get_recipe() ))

    -- print(entity.get_or_create_control_behavior())
    -- print(entity.get_or_create_control_behavior().type)
    -- print(#entity.get_or_create_control_behavior().resource_read_targets)

    print( entity.mining_target.amount )

    -- local fragment_name = remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = entity.surface.index}).fragment_name
    local fragment_name = entity.mining_target.prototype.mineable_properties.products[1].name

    local fragments_per_second = (entity.prototype.mining_speed / entity.mining_target.prototype.mineable_properties.mining_time) * entity.mining_target.amount / entity.mining_target.prototype.normal_resource_amount
    -- game.print(fragments_per_second)

    -- game.print(entity.force.mining_drill_productivity_bonus)

    local human = round(fragments_per_second * (1 + entity.force.mining_drill_productivity_bonus) * core_miners_on_this_surface, 2)
    -- game.print(surface_fragments_per_second)

    -- game.print(entity.mining_target.prototype.mineable_properties.products[1].name)

    -- for k, v in pairs(entity.get_or_create_control_behavior()) do
    --   print(serpent.block(k))
    --   -- game.print(serpent.block(v))
    -- end

    entity.surface.create_entity{name = "flying-text", position = entity.position, text = "[item="..fragment_name.."] " .. human .. "/s"}


    -- local drill_prototype = entity.prototype
    -- local seam_prototype = 

    -- print(serpent.block({
    --   mining_speed = entity.prototype.mining_speed,
    --   mining_time = entity.mining_target.prototype.mineable_properties.mining_time,
    --   amount = entity.mining_target.amount,
    --   normal = entity.mining_target.prototype.normal_resource_amount,
    -- }))
  end

end)

---
