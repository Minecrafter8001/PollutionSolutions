require "util"

------------
-- Entity --
------------

local pollutioncollector = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])
pollutioncollector.name = "pollutioncollector"
pollutioncollector.order = "z"
pollutioncollector.minable.result = "pollutioncollector"
pollutioncollector.crafting_categories = {"pollution"}
pollutioncollector.icon = "__PollutionSolutions__/graphics/icons/pollution-collector.png"
pollutioncollector.icon_size = 64
pollutioncollector.pictures.picture.sheets[1] = {
	filename = "__PollutionSolutions__/graphics/entity/pollution-collector/hr-pollution-collector.png",
	frames = 2,
	size = {215,215},
	line_length = 2,
	scale = 0.5,
}
pollutioncollector.fluid_box.filter = "polluted-air"
for i=1, #pollutioncollector.fluid_box.pipe_connections, 1 do
	pollutioncollector.fluid_box.pipe_connections[i].flow_direction = "input-output"
end
pollutioncollector.fluid_box.volume = 1000

----------
-- Item --
----------

local pollutioncollector_item = util.table.deepcopy(data.raw['item']['steam-turbine'])
pollutioncollector_item.name = "pollutioncollector"
pollutioncollector_item.place_result = "pollutioncollector"
pollutioncollector_item.stack_size = 50
pollutioncollector_item.icon = "__PollutionSolutions__/graphics/icons/pollution-collector.png"
pollutioncollector_item.icon_size = 64



------------
-- Extend --
------------

data:extend({
	pollutioncollector,
	pollutioncollector_item,
	{
		type = "recipe",
		name = "pollutioncollector",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{type="item", name="red-xenomass", amount=10},
			{type="item", name="electronic-circuit", amount=5},
			{type="item", name="iron-gear-wheel", amount=50},
			{type="item", name="pipe", amount=50},
		},
		results = {{type="item", name="pollutioncollector", amount=1}}
	},
})
