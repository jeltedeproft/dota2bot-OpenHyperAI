-- aba_item_inventory.lua
--
-- Inventory slot management functions for the Item module.
-- Extracted from aba_item.lua to keep that file a manageable size.
--
-- Usage (called automatically by aba_item.lua):
--   require(GetScriptDirectory()..'/FunLib/aba_item_inventory')(Item)

local Role = require( GetScriptDirectory()..'/FunLib/aba_role' )

local function populate(Item)

function Item.GetMainInvLessValItemSlot( bot )

	local minPrice = 10000
	local minSlot = - 1
	for i = 0, 5
	do
		local item = bot:GetItemInSlot( i )

		if item == nil
		then
			return i
		end

		if item ~= nil
			and not Item.IsCanNotSwitchItem( item:GetName() )
		then
			local cost = GetItemCost( item:GetName() )
			if cost < minPrice then
				minPrice = cost
				minSlot = i
			end
		end
	end

	return minSlot

end

function Item.GetBodyInvLessValItemSlot( bot )
	local minPrice = 10000
	local minSlot = - 1
	for i = 0, 8
	do
		local item = bot:GetItemInSlot( i )

		if item == nil
		then
			return i, -1
		end

		if item ~= nil
			and not Item.IsCanNotSwitchItem( item:GetName() )
		then
			local cost = GetItemCost( item:GetName() )
			if cost < minPrice then
				minPrice = cost
				minSlot = i
			end
		end
	end

	return minSlot, minPrice

end


function Item.GetItemCharges( bot, itemName )

	local charges = 0
	for i = 0, 16
	do
		local item = bot:GetItemInSlot( i )
		if item ~= nil and item:GetName() == itemName
		then
			charges = charges + item:GetCurrentCharges()
		end
	end

	return charges

end


function Item.GetNeutralItemCount( bot )

	local amount = 0
	local nSlotList = { 6, 7, 8, 16 }
	for _, i in pairs( nSlotList )
	do
		local item = bot:GetItemInSlot( i )
		if item ~= nil
		then
			local itemName = item:GetName()
			if Item.IsNeutralItem( itemName )
				and not Item.IsConsumableItem( itemName )
			then
				amount = amount + 1
			end
		end
	end

	return amount

end


function Item.GetEmptyInventoryAmount( bot )

	local amount = 0
	for i = 0, 8
	do
		local item = bot:GetItemInSlot( i )
		if item == nil
		then
			amount = amount + 1
		end
	end

	return amount

end

function Item.GetEmptyNonBackpackInventoryAmount( bot )

	local amount = 0
	for i = 0, 5
	do
		local item = bot:GetItemInSlot( i )
		if item == nil
		then
			amount = amount + 1
		end
	end

	return amount

end


function Item.GetEmptyNeutralBackpackAmount( bot )

	local amount = ( bot:GetItemInSlot( 16 ) == nil and 1 or 0 )

	for i = 6, 8
	do
		local item = bot:GetItemInSlot( i )
		if item == nil
		then
			amount = amount + 1
		end
	end

	return amount

end

function Item.GetEmptyBackpackSlot( bot )
	for i = 6, 8
	do
		if bot:GetItemInSlot( i ) == nil
		then
			return i
		end
	end
	return -1
end

function Item.GetItemCount( unit, itemName )

	local count = 0
	for i = 0, 16
	do
		local item = unit:GetItemInSlot( i )
		if item ~= nil and item:GetName() == itemName
		then
			count = count + 1
		end
	end

	return count

end


function Item.GetItemCountInSolt( unit, itemName, nSlotMin, nSlotMax )

	local count = 0
	for i = nSlotMin, nSlotMax
	do
		local item = unit:GetItemInSlot( i )
		if item ~= nil and item:GetName() == itemName
		then
			count = count + 1
		end
	end

	return count

end


function Item.HasBasicItem( bot )

	local basicItemSlot = - 1

	for i = 1, #Item['sBasicItems']
	do
		basicItemSlot = bot:FindItemSlot( Item['sBasicItems'][i] )
		if basicItemSlot >= 0 and basicItemSlot <= 5
		then
			return true
		end
	end

	return false
end


function Item.HasBuyBoots( bot )

	local bootsSlot = - 1

	for i = 1, #Item['tEarlyBoots']
	do
		bootsSlot = bot:FindItemSlot( Item['tEarlyBoots'][i] )
		if bootsSlot >= 0
		then
			return true
		end
	end

	return false

end


function Item.HasBootsInMainSolt( bot )

	local bootsSlot = - 1

	for i = 1, #Item['tEarlyBoots']
	do
		bootsSlot = bot:FindItemSlot( Item['tEarlyBoots'][i] )
		if bootsSlot >= 0 and bootsSlot <= 8
		then
			return true
		end
	end

	return false

end

function Item.GetItemTotalWorthInSlots(unit)
	local totalValue = 0
	for i = 0, 16
	do
		local item = unit:GetItemInSlot( i )
		if item ~= nil
		then
			totalValue = totalValue + GetItemCost(item:GetName())
		end
	end
	return totalValue
end

function Item.GetTheItemSolt( bot, nSlotMin, nSlotMax, bMaxCost )

	if bMaxCost
	then
		local nMaxCost = - 9999
		local idx = - 1
		for i = nSlotMin, nSlotMax
		do
			if bot:GetItemInSlot( i ) ~= nil
			then
				local sItem = bot:GetItemInSlot( i ):GetName()
				if GetItemCost( sItem ) > nMaxCost
				then
					nMaxCost = GetItemCost( sItem )
					idx = i
				end
			end
		end

		return idx
	end

	local nMinCost = 99999
	local idx = - 1
	for i = nSlotMin, nSlotMax
	do
		if bot:GetItemInSlot( i ) ~= nil
		then
			local sItem = bot:GetItemInSlot( i ):GetName()
			if GetItemCost( sItem ) < nMinCost
			then
				nMinCost = GetItemCost( sItem )
				idx = i
			end
		end
	end

	return idx

end

function Item.GetOutfitType( bot )
	local sOutfitTypeList = {
		[1] = 'outfit_mid',
		[2] = 'outfit_tank',
		[3] = 'outfit_carry',
		[4] = 'outfit_mage',
		[5] = 'outfit_priest',
	}
	local nTeamPlayerIDs = GetTeamPlayers( GetTeam() )
	for i = 1, #GetTeamPlayers( GetTeam() )
	do
		local memberID = nTeamPlayerIDs[i]
		if bot:GetPlayerID() == memberID
		then
			return sOutfitTypeList[i]
		end
	end
	return 'outfit_carry'
end

-- returns pos_1, pos_2, pos_3, depends on the roles...
function Item.GetRoleItemsBuyList( bot )
	return 'pos_'..tostring(Role.GetPosition(bot))
end

function Item.HasTargetItemCompositByItems(bot, items)
	local purchased = {}
	for i = 0, 8
	do
		local item = bot:GetItemInSlot( i )
		if item ~= nil
		then
			local basicItems = Item.GetBasicItems( {item:GetName()} )
			local intersection, built = Item.GetIntersection(items, basicItems)
			if built then
				purchased = Item.MergeLists(purchased, intersection)
			end
		end
	end
	return purchased
end

function Item.GetReducedPurchaseList(bot, items)
	local purchasedList = Item.HasTargetItemCompositByItems(bot, items)
	return Item.RemoveIntersectedItems(items, purchasedList)
end

-- Returns the intersection of list1 and list2, and whether list2 is fully contained in list1.
function Item.GetIntersection(list1, list2)
	local set1 = {}
	for _, value in ipairs(list1) do
		set1[value] = true
	end

	local intersection = {}
	local containsAll = true

	for _, value in ipairs(list2) do
		if set1[value] then
			table.insert(intersection, value)
		else
			containsAll = false
		end
	end

	return intersection, containsAll
end

function Item.MergeLists(list1, list2)
	local merged = {}
	for _, value in ipairs(list1) do
		table.insert(merged, value)
	end
	for _, value in ipairs(list2) do
		table.insert(merged, value)
	end
	return merged
end

-- Remove all elements of list2 from list1.
function Item.RemoveIntersectedItems(list1, list2)
	local set2 = {}
	for _, value in ipairs(list2) do
		set2[value] = true
	end

	local result = {}
	for _, value in ipairs(list1) do
		if not set2[value] then
			table.insert(result, value)
		end
	end

	return result
end


function Item.GetItemWardSolt()

	local bot = GetBot()

	local sWardTypeList = {
		'item_ward_observer',
		'item_ward_sentry',
		'item_ward_dispenser',
	}

	for _, sType in pairs( sWardTypeList )
	do
		local nWardSolt = bot:FindItemSlot( sType )
		if nWardSolt ~= - 1
		then
			return nWardSolt
		end
	end

	return - 1

end

end

return populate
