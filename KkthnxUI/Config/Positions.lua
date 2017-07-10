local K, C, L = unpack(select(2, ...))

-- If you're saving frame positions, use "UIParent", not UIParent
C["Position"] = {
	["Alerts"] = {"TOP", "UIParent", "TOP", 0, -22},
	["AltPowerBar"] = {"TOP", "UIParent", "TOP", 0, -100},
	["Attempt"] = {"TOP", "UIParent", "TOP", -85, -25},
	["Bag"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -4, 204},
	["Bank"] = {"BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 4, 204},
	["BGScore"] = {"TOPLEFT", "UIParent", "TOPLEFT", 0, -4},
	["BnetPopup"] = {"BOTTOMLEFT", "ChatFrame1", "TOPLEFT", 4, 62},
	["CaptureBar"] = {"TOP", "UIParent", "TOP", 0, -170},
	["Chat"] = {"BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 3, 3},
	["ExtraButton"] = {"BOTTOMLEFT", "ActionButton12", "BOTTOMRIGHT", 5, 1},
	["Ghost"] = {"TOP", "UIParent", "TOP", 0, -100},
	["GroupLoot"] = {"BOTTOM", "UIParent", "BOTTOM", -238, 700},
	["Loot"] = {"TOPLEFT", "UIParent", "TOPLEFT", 245, -220},
	["Minimap"] = {"TOPRIGHT", "UIParent", "TOPRIGHT", -4, -4},
	["ObjectiveTracker"] = {"TOPRIGHT", "UIParent", "TOPRIGHT", -135, -300},
	["PetHorizontal"] = {"BOTTOMRIGHT", "UIParent", "BOTTOM", -175, 167},
	["PlayerBuffs"] = {"TOPRIGHT", "Minimap", "TOPLEFT", -30, 2},
	["RaidUtility"] = {"TOP", "UIParent", "TOP", -280, -4},
	["RightBars"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -5, 330},
	["StanceBar"] = {"BOTTOMRIGHT", "UIParent", "BOTTOM", -202, 167},
	["SystemDT"] = {"CENTER", "KkthnxUIMinimapStats", "CENTER", 0, 0.5},
	["TalkingHead"] = {"TOP", "UIParent", "TOP", 0, -21},
	["Ticket"] = {"TOPLEFT", "UIParent", "TOPLEFT", 250, -6},
	["Tooltip"] = {"BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -2, 2},
	["UIError"] = {"TOP", "UIParent", "TOP", 0, -80},
	["Vehicle"] = {"TOP", "Minimap", "BOTTOM", 0, -18},
	["VehicleBar"] = {"BOTTOMRIGHT", "ActionButton1", "BOTTOMLEFT", -3, 0},
	["WorldMap"] = {"CENTER", "UIParent", "CENTER", 0, 100},
	["ZoneAbility"] = {"BOTTOMLEFT", "ActionButton12", "BOTTOMRIGHT", 5, 1},
	-- Unitframe positions
	UnitFrames = {
		["Arena"] = {"BOTTOMRIGHT", "UIParent", "RIGHT", -140, 140},
		["Boss"] = {"BOTTOMRIGHT", "UIParent", "RIGHT", -140, 140},
		["Focus"] = {"BOTTOMRIGHT", "oUF_KkthnxPlayer", "TOPLEFT", -60, 30},
		["FocusCastbar"] = {"BOTTOM", "oUF_KkthnxFocus", "TOP", 12, 50},
		["FocusTarget"] = {"TOPLEFT", "oUF_KkthnxFocus", "BOTTOMRIGHT", -78, -16},
		["Party"] = {"TOPLEFT", "UIParent", "TOPLEFT", 12, -200},
		["Pet"] = {"TOPLEFT", "oUF_KkthnxPlayer", "BOTTOMLEFT", 43, -20},
		["Player"] = {"BOTTOMRIGHT", "ActionBarAnchor", "TOPLEFT", -10, 200},
		["PlayerCastbar"] = {"BOTTOM", "ActionBarAnchor", "TOP", 0, 200},
		["Raid"] = {"TOPLEFT", "UIParent", "TOPLEFT", 8, -200},
		["Target"] = {"BOTTOMLEFT", "ActionBarAnchor", "TOPRIGHT", 10, 200},
		["TargetCastbar"] = {"BOTTOM", "oUF_KkthnxPlayer_Castbar", "TOP", 0, 8},
		["TargetTarget"] = {"TOPLEFT", "oUF_KkthnxTarget", "BOTTOMRIGHT", -78, -16},
	},
}