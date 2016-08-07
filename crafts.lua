
local S = foodchain.intllib

-- name tag
minetest.register_craftitem("foodchain:nametag", {
	description = "Nametag",
	inventory_image = "mobs_nametag.png",
})

core.register_craft({
	type = "shapeless",
	output = "foodchain:nametag",
	recipe = {"default:paper", "dye:black", "farming:string"},
})

-- leather
minetest.register_craftitem("foodchain:leather", {
	description = "Leather",
	inventory_image = "mobs_leather.png",
})

-- raw meat
minetest.register_craftitem("foodchain:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
	on_use = minetest.item_eat(3),
})

-- cooked meat
minetest.register_craftitem("foodchain:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "foodchain:meat",
	recipe = "foodchain:meat_raw",
	cooktime = 5,
})

-- golden lasso
minetest.register_tool("foodchain:magic_lasso", {
	description = "Magic Lasso (right-click animal to put in inventory)",
	inventory_image = "mobs_magic_lasso.png",
})

minetest.register_craft({
	output = "foodchain:magic_lasso",
	recipe = {
		{"farming:string", "default:gold_lump", "farming:string"},
		{"default:gold_lump", "default:diamondblock", "default:gold_lump"},
		{"farming:string", "default:gold_lump", "farming:string"},
	}
})

-- net
minetest.register_tool("foodchain:net", {
	description = "Net (right-click animal to put in inventory)",
	inventory_image = "mobs_net.png",
})

minetest.register_craft({
	output = "foodchain:net",
	recipe = {
		{"default:stick", "", "default:stick"},
		{"default:stick", "", "default:stick"},
		{"farming:string", "default:stick", "farming:string"},
	}
})

-- shears (right click to shear animal)
minetest.register_tool("foodchain:shears", {
	description = "Steel Shears (right-click to shear)",
	inventory_image = "mobs_shears.png",
})

minetest.register_craft({
	output = 'foodchain:shears',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'', 'group:stick', 'default:steel_ingot'},
	}
})
