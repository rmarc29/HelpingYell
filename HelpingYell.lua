local yell = CreateFrame("Frame")
yell:RegisterEvent("UNIT_HEALTH")

local hasYelled = {}

yell:SetScript("OnEvent", function(self, event, unit)
    if unit ~= "player" and not string.find(unit,"party") then return end

    local health = UnitHealth(unit)
    local maxHealth = UnitHealthMax(unit)
    local name = UnitName(unit)

    local inRange = UnitInRange(unit)
    if inRange == false then return end

    if maxHealth > 0 and (health / maxHealth) <= 0.15 then
        if not hasYelled[unit] then
            SendChatMessage("Please HELP !" .. name .. "is low HP", "YELL")
            hasYelled[unit] = true
        end
    else
        hasYelled[unit] = false -- Reset if health goes back up
    end
end)
