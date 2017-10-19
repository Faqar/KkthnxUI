local K, C, L = unpack(select(2, ...))

-- oUF_Kkthnx Nameplates
local _, ns = ...
local oUF = ns.oUF

-- Lua API
local _G = _G
local math_abs = math.abs
local math_floor = math.floor
local math_huge = math.huge
local string_format = string.format
local table_insert = table.insert
local unpack = unpack

-- Wow API
local CreateFrame = _G.CreateFrame
local GetArenaOpponentSpec = _G.GetArenaOpponentSpec
local GetBattlefieldScore = _G.GetBattlefieldScore
local GetCVarDefault = _G.GetCVarDefault
local GetNumBattlefieldScores = _G.GetNumBattlefieldScores
local GetNumGroupMembers = _G.GetNumGroupMembers
local GetSpecializationInfoByID = _G.GetSpecializationInfoByID
local GetTime = _G.GetTime
local InCombatLockdown = _G.InCombatLockdown
local IsInGroup = _G.IsInGroup
local IsInInstance = _G.IsInInstance
local IsInRaid = _G.IsInRaid
local SetCVar = _G.SetCVar
local UnitAffectingCombat = _G.UnitAffectingCombat
local UnitCanAttack = _G.UnitCanAttack
local UnitClass = _G.UnitClass
local UnitDebuff = _G.UnitDebuff
local UnitDetailedThreatSituation = _G.UnitDetailedThreatSituation
local UnitExists = _G.UnitExists
local UnitFactionGroup = _G.UnitFactionGroup
local UnitGroupRolesAssigned = _G.UnitGroupRolesAssigned
local UnitHealth = _G.UnitHealth
local UnitHealthMax = _G.UnitHealthMax
local UnitIsFriend = _G.UnitIsFriend
local UnitIsPlayer = _G.UnitIsPlayer
local UnitIsPVPSanctuary = _G.UnitIsPVPSanctuary
local UnitIsTapDenied = _G.UnitIsTapDenied
local UnitIsUnit = _G.UnitIsUnit
local UnitName = _G.UnitName
local UnitReaction = _G.UnitReaction
local UnitSelectionColor = _G.UnitSelectionColor

local CVarUpdate = {
	-- important, strongly recommend to set these to 1
	nameplateGlobalScale = 1,
	NamePlateHorizontalScale = 1,
	NamePlateVerticalScale = 1,
	-- optional, you may use any values
	nameplateLargerScale = 1,
	nameplateMaxDistance = C["Nameplates"].Distance or 40,
	nameplateMaxScale = 1,
	nameplateMinScale = 1,
	nameplateOtherBottomInset = C["Nameplates"].Clamp and 0.1 or -1,
	nameplateOtherTopInset = C["Nameplates"].Clamp and 0.08 or -1,
	nameplateSelfScale = 1,
	nameplateSelectedScale = C["Nameplates"].SelectedScale,
}

local NameplateFont = K.GetFont(C["General"].Font)
local NameplateTexture = K.GetTexture(C["General"].Texture)

local healList, exClass, healerSpecs = {}, {}, {}
local testing = false

exClass.DEATHKNIGHT = true
exClass.MAGE = true
exClass.ROGUE = true
exClass.WARLOCK = true
exClass.WARRIOR = true
if C["Nameplates"].HealerIcon == true then
	local t = CreateFrame("Frame")

	t.factions = {
		["Horde"] = 1,
		["Alliance"] = 0,
	}

	local healerSpecIDs = {
		105, -- Druid Restoration
		270, -- Monk Mistweaver
		65, -- Paladin Holy
		256, -- Priest Discipline
		257, -- Priest Holy
		264, -- Shaman Restoration
	}

	for _, specID in pairs(healerSpecIDs) do
		local _, name = GetSpecializationInfoByID(specID)
		if name and not healerSpecs[name] then
			healerSpecs[name] = true
		end
	end

	local lastCheck = 20
	local function CheckHealers(self, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			healList = {}
			for i = 1, GetNumBattlefieldScores() do
				local name, _, _, _, _, faction, _, _, _, _, _, _, _, _, _, talentSpec = GetBattlefieldScore(i)

				if name and healerSpecs[talentSpec] and t.factions[UnitFactionGroup("player")] == faction then
					name = name:match("(.+)%-.+") or name
					healList[name] = talentSpec
				end
			end
		end
	end

	local function CheckArenaHealers(self, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			healList = {}
			for i = 1, 5 do
				local specID = GetArenaOpponentSpec(i)
				if specID and specID > 0 then
					local name = UnitName(string_format("arena%d", i))
					local _, talentSpec = GetSpecializationInfoByID(specID)
					if name and healerSpecs[talentSpec] then
						healList[name] = talentSpec
					end
				end
			end
		end
	end

	local function CheckLoc(self, event)
		if event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_ENTERING_BATTLEGROUND" then
			local _, instanceType = IsInInstance()
			if instanceType == "pvp" then
				t:SetScript("OnUpdate", CheckHealers)
			elseif instanceType == "arena" then
				t:SetScript("OnUpdate", CheckArenaHealers)
			else
				healList = {}
				t:SetScript("OnUpdate", nil)
			end
		end
	end

	t:RegisterEvent("PLAYER_ENTERING_WORLD")
	t:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND")
	t:SetScript("OnEvent", CheckLoc)
end

local totemData = {
	[GetSpellInfo(192058)] = "Interface\\Icons\\spell_nature_brilliance", -- Lightning Surge Totem
	[GetSpellInfo(98008)] = "Interface\\Icons\\spell_shaman_spiritlink", -- Spirit Link Totem
	[GetSpellInfo(192077)] = "Interface\\Icons\\ability_shaman_windwalktotem", -- Wind Rush Totem
	[GetSpellInfo(204331)] = "Interface\\Icons\\spell_nature_wrathofair_totem", -- Counterstrike Totem
	[GetSpellInfo(204332)] = "Interface\\Icons\\spell_nature_windfury", -- Windfury Totem
	[GetSpellInfo(204336)] = "Interface\\Icons\\spell_nature_groundingtotem", -- Grounding Totem
	-- Water
	[GetSpellInfo(157153)] = "Interface\\Icons\\ability_shaman_condensationtotem", -- Cloudburst Totem
	[GetSpellInfo(5394)] = "Interface\\Icons\\INV_Spear_04", -- Healing Stream Totem
	[GetSpellInfo(108280)] = "Interface\\Icons\\ability_shaman_healingtide", -- Healing Tide Totem
	-- Earth
	[GetSpellInfo(207399)] = "Interface\\Icons\\spell_nature_reincarnation", -- Ancestral Protection Totem
	[GetSpellInfo(198838)] = "Interface\\Icons\\spell_nature_stoneskintotem", -- Earthen Shield Totem
	[GetSpellInfo(51485)] = "Interface\\Icons\\spell_nature_stranglevines", -- Earthgrab Totem
	[GetSpellInfo(61882)] = "Interface\\Icons\\spell_shaman_earthquake", -- Earthquake Totem
	[GetSpellInfo(196932)] = "Interface\\Icons\\spell_totem_wardofdraining", -- Voodoo Totem
	-- Fire
	[GetSpellInfo(192222)] = "Interface\\Icons\\spell_shaman_spewlava", -- Liquid Magma Totem
	[GetSpellInfo(204330)] = "Interface\\Icons\\spell_fire_totemofwrath", -- Skyfury Totem
	-- Totem Mastery
	[GetSpellInfo(202188)] = "Interface\\Icons\\spell_nature_stoneskintotem", -- Resonance Totem
	[GetSpellInfo(210651)] = "Interface\\Icons\\spell_shaman_stormtotem", -- Storm Totem
	[GetSpellInfo(210657)] = "Interface\\Icons\\spell_fire_searingtotem", -- Ember Totem
	[GetSpellInfo(210660)] = "Interface\\Icons\\spell_nature_invisibilitytotem", -- Tailwind Totem
}

local function CreateVirtualFrame(frame, point)
	if point == nil then point = frame end
	if point.backdrop then return end

	frame.backdrop = CreateFrame("Frame", nil , frame)
	frame.backdrop:SetAllPoints()
	frame.backdrop:SetBackdrop({
		bgFile = C["Media"].Blank,
		edgeFile = C["Media"].Glow,
		edgeSize = 3 * K.NoScaleMult,
		insets = {top = 3 * K.NoScaleMult, left = 3 * K.NoScaleMult, bottom = 3 * K.NoScaleMult, right = 3 * K.NoScaleMult}
	})
	frame.backdrop:SetPoint("TOPLEFT", point, -3 * K.NoScaleMult, 3 * K.NoScaleMult)
	frame.backdrop:SetPoint("BOTTOMRIGHT", point, 3 * K.NoScaleMult, -3 * K.NoScaleMult)
	frame.backdrop:SetBackdropColor(C["Media"].BackdropColor[1], C["Media"].BackdropColor[2], C["Media"].BackdropColor[3], C["Media"].BackdropColor[4])
	frame.backdrop:SetBackdropBorderColor(0, 0, 0)

	if frame:GetFrameLevel() - 1 > 0 then
		frame.backdrop:SetFrameLevel(frame:GetFrameLevel() - 1)
	else
		frame.backdrop:SetFrameLevel(0)
	end
end

local function SetVirtualBorder(frame, r, g, b)
	frame.backdrop:SetBackdropBorderColor(r, g, b)
end

local CreateAuraTimer = function(self, elapsed)
	if self.timeLeft then
		self.elapsed = (self.elapsed or 0) + elapsed
		if self.elapsed >= .1 then
			if not self.first then
				self.timeLeft = self.timeLeft - self.elapsed
			else
				self.timeLeft = self.timeLeft - GetTime()
				self.first = false
			end
			if self.timeLeft > 0 then
				local time = K.FormatTime(self.timeLeft)
				self.remaining:SetText(time)
				if self.timeLeft <= 2.5 then
					self.remaining:SetTextColor(1, 0, 0)
				else
					self.remaining:SetTextColor(1, 1, 0)
				end
			else
				self.remaining:Hide()
				self:SetScript("OnUpdate", nil)
			end
			self.elapsed = 0
		end
	end
end

local function CreateAuraIcon(parent)
	local button = CreateFrame("Frame", nil, parent)
	button:SetSize(C["Nameplates"].AurasSize, C["Nameplates"].AurasSize)
	button:SetScale(K.NoScaleMult)

	button.backdrop = CreateFrame("Frame", nil , button)
	button.backdrop:SetFrameLevel(0)
	button.backdrop:SetBackdrop({
		bgFile = C["Media"].Blank,
		edgeFile = C["Media"].Glow,
		edgeSize = 4 * K.NoScaleMult,
		insets = {top = 4 * K.NoScaleMult, left = 4 * K.NoScaleMult, bottom = 4 * K.NoScaleMult, right = 4 * K.NoScaleMult}
	})
	button.backdrop:SetPoint("TOPLEFT", -2 * K.NoScaleMult, 2 * K.NoScaleMult)
	button.backdrop:SetPoint("BOTTOMRIGHT", 2 * K.NoScaleMult, -2 * K.NoScaleMult)
	button.backdrop:SetBackdropColor(C["Media"].BackdropColor[1], C["Media"].BackdropColor[2], C["Media"].BackdropColor[3], C["Media"].BackdropColor[4])
	button.backdrop:SetBackdropBorderColor(0, 0, 0)

	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetPoint("TOPLEFT", 2, -2)
	button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	button.cd = CreateFrame("Cooldown", "$parentCooldown", button, "CooldownFrameTemplate")
	button.cd:SetDrawEdge(false)
	button.cd:SetReverse(true)
	button.cd:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
	button.cd:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
	button.cd.noOCC = true
	button.cd.noCooldownCount = true

	button.remaining = K.SetFontString(button, C["Media"].Font, C["Nameplates"].FontSize, C["Nameplates"].Outline and "OUTLINE" or "", "CENTER")
	button.remaining:SetShadowOffset(C["Nameplates"].Outline and 0 or 1, C["Nameplates"].Outline and -0 or -1)
	button.remaining:SetPoint("CENTER", button, "CENTER", 1, 1)
	button.remaining:SetJustifyH("CENTER")

	button.count = button:CreateFontString(nil, "OVERLAY")
	button.count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, 0)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(C["Media"].Font, C["Nameplates"].FontSize, C["Nameplates"].Outline and "OUTLINE" or "")
	button.count:SetShadowOffset(C["Nameplates"].Outline and 0 or 1, C["Nameplates"].Outline and -0 or -1)

	button.parent = CreateFrame("Frame", nil, button)
	button.parent:SetFrameLevel(button.cd:GetFrameLevel() + 1)
	button.count:SetParent(button.parent)
	button.remaining:SetParent(button.parent)

	return button
end

local function UpdateAuraIcon(button, unit, index, filter)
	local name, _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitAura(unit, index, filter)

	button:SetSize(C["Nameplates"].AurasSize, C["Nameplates"].AurasSize)
	button.icon:SetTexture(icon)
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	button.cd:SetCooldown(expirationTime - duration, duration)
	button.cd:Show()

	local color = DebuffTypeColor[debuffType] or DebuffTypeColor.none
	if (name == "Unstable Affliction" or name == "Vampiric Touch") and K.Class ~= "WARLOCK" then
		button.backdrop:SetBackdropBorderColor(0.05, 0.85, 0.94)
	else
		button.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
	end

	if count and count > 1 then
		button.count:SetText(count)
	else
		button.count:SetText("")
	end

	if duration and duration > 0 then
		button.remaining:Show()
		button.timeLeft = expirationTime
		button:SetScript("OnUpdate", CreateAuraTimer)
	else
		button.remaining:Hide()
		button.timeLeft = math_huge
		button:SetScript("OnUpdate", nil)
	end
	button.first = true

	button:Show()
end

local function DebuffFilter(name, caster, spellId, nameplateShowPersonal, nameplateShowAll, unit)
	if caster == "player" then
		if ((nameplateShowPersonal or nameplateShowAll) and not K.DebuffBlackList[name]) then
			return true
		elseif K.DebuffWhiteList[name] then
			return true
		end
	end

	return false
end

local function UpdateAuras(self)
	if not C["Nameplates"].TrackAuras or UnitIsUnit(self.unit, "player") then return end
	local i = 1
	local r, g, b

	for index = 1, 40 do
		if i > C["Nameplates"].Width / C["Nameplates"].AurasSize then return end
		local name, _, _, _, _, _, _, caster, _, nameplateShowPersonal, spellId, _, _, _, nameplateShowAll = UnitAura(self.unit, index, "HARMFUL")

		local allow, boss = DebuffFilter(name, caster, spellId, nameplateShowPersonal, nameplateShowAll, self.unit)
		if name and allow then
			if not self.DebuffIcons[i] then
				self.DebuffIcons[i] = CreateAuraIcon(self)
			end
			UpdateAuraIcon(self.DebuffIcons[i], self.unit, index, "HARMFUL")
			if boss then
				self.DebuffIcons[i].icon:SetVertexColor(r, g, b)
			else
				self.DebuffIcons[i].icon:SetVertexColor(1, 1, 1)
			end
			if i == 1 then
				self.DebuffIcons[i]:SetPoint("BOTTOMLEFT", self.DebuffIcons, "BOTTOMLEFT")
			elseif i ~= 1 then
				self.DebuffIcons[i]:SetPoint("LEFT", self.DebuffIcons[i-1], "RIGHT", 2, 0)
			end
			i = i + 1
		end
	end

	for index = i, #self.DebuffIcons do
		self.DebuffIcons[index]:Hide()
	end
end

local function ThreatColor(self, forced)
	if UnitIsPlayer(self.unit) then return end
	local combat = UnitAffectingCombat("player")
	local _, threatStatus = UnitDetailedThreatSituation("player", self.unit)

	if C["Nameplates"].EnhancedThreat ~= true then
		SetVirtualBorder(self.Health, 0, 0, 0)
	end

	if UnitIsTapDenied(self.unit) then
		self.Health:SetStatusBarColor(0.6, 0.6, 0.6)
	elseif combat then
		if threatStatus == 3 then -- securely tanking, highest threat
			if K.GetPlayerRole() == "TANK" then
				if C["Nameplates"].EnhancedThreat == true then
					self.Health:SetStatusBarColor(unpack(C["Nameplates"].GoodColor))
				else
					SetVirtualBorder(self.Health, unpack(C["Nameplates"].BadColor))
				end
			else
				if C["Nameplates"].EnhancedThreat == true then
					self.Health:SetStatusBarColor(unpack(C["Nameplates"].BadColor))
				else
					SetVirtualBorder(self.Health, unpack(C["Nameplates"].BadColor))
				end
			end
		elseif threatStatus == 2 then -- insecurely tanking, another unit have higher threat but not tanking
			if C["Nameplates"].EnhancedThreat == true then
				self.Health:SetStatusBarColor(unpack(C["Nameplates"].NearColor))
			else
				SetVirtualBorder(self.Health, unpack(C["Nameplates"].NearColor))
			end
		elseif threatStatus == 1 then -- not tanking, higher threat than tank
			if C["Nameplates"].EnhancedThreat == true then
				self.Health:SetStatusBarColor(unpack(C["Nameplates"].NearColor))
			else
				SetVirtualBorder(self.Health, unpack(C["Nameplates"].NearColor))
			end
		elseif threatStatus == 0 then -- not tanking, lower threat than tank
			if C["Nameplates"].EnhancedThreat == true then
				if K.GetPlayerRole() == "TANK" then
					self.Health:SetStatusBarColor(unpack(C["Nameplates"].BadColor))
					if IsInGroup() or IsInRaid() then
						for i = 1, GetNumGroupMembers() do
							if UnitExists("raid"..i) and not UnitIsUnit("raid"..i, "player") then
								local isTanking = UnitDetailedThreatSituation("raid"..i, self.unit)
								if isTanking and UnitGroupRolesAssigned("raid"..i) == "TANK" then
									self.Health:SetStatusBarColor(unpack(C["Nameplates"].OffTankColor))
								end
							end
						end
					end
				else
					self.Health:SetStatusBarColor(unpack(C["Nameplates"].GoodColor))
				end
			end
		end
	elseif (not forced and self.Health.ForceUpdate) then
		self.Health:ForceUpdate()
	end
end

local function UpdateTarget(self)
	if UnitIsUnit(self.unit, "target") and not UnitIsUnit(self.unit, "player") then
		self:SetAlpha(1)
	else
		self:SetSize(C["Nameplates"].Width * K.NoScaleMult, C["Nameplates"].Height * K.NoScaleMult)
		self.Castbar.Icon:SetSize(C["Nameplates"].Height * 2 * K.NoScaleMult + 3, C["Nameplates"].Height * 2 * K.NoScaleMult + 3)
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Health, "TOPRIGHT", 4, 0)
		if (UnitExists("target") and not UnitIsUnit(self.unit, "player")) then
			self:SetAlpha(C.UnitframePlugins.OORAlpha)
		else
			self:SetAlpha(1)
		end
	end
end

local function UpdateName(self)
	if C["Nameplates"].HealerIcon == true then
		local name = UnitName(self.unit)
		if name then
			if testing then
				self.HealerIcon:Show()
			else
				if healList[name] then
					if exClass[healList[name]] then
						self.HealerIcon:Hide()
					else
						self.HealerIcon:Show()
					end
				else
					self.HealerIcon:Hide()
				end
			end
		end
	end

	if C["Nameplates"].TotemIcons == true then
		local name = UnitName(self.unit)
		if name then
			if totemData[name] then
				self.Totem.Icon:SetTexture(totemData[name])
				self.Totem.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				self.Totem:Show()
			else
				self.Totem:Hide()
			end
		end
	end
end

local function PostCastInterruptible(self, unit)
	if unit == "vehicle" or unit == "player" then return end

	local colors = K.Colors
	local r, g, b = colors.castColor[1], colors.castColor[2], colors.castColor[3]

	local t
	if C["Nameplates"].CastUnitReaction and UnitReaction(unit, 'player') then
		t = K.Colors.reaction[UnitReaction(unit, "player")]
	end

	if(t) then
		r, g, b = t[1], t[2], t[3]
	end

	if self.notInterruptible and UnitCanAttack("player", unit) then
		r, g, b = colors.castNoInterrupt[1], colors.castNoInterrupt[2], colors.castNoInterrupt[3]
	end

	self:SetStatusBarColor(r, g, b)
end

local function PostCastNotInterruptible(self)
	local colors = K.Colors
	self:SetStatusBarColor(colors.castNoInterrupt[1], colors.castNoInterrupt[2], colors.castNoInterrupt[3])
end

local function CustomCastDelayText(self, duration)
	if self.channeling then
		self.Time:SetText(("%.1f |cffaf5050%.1f|r"):format(duration, self.delay))
	else
		self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(math_abs(duration - self.max), "+", self.delay))
	end
end

local function CustomTimeText(self, duration)
	if self.channeling then
		self.Time:SetText(("%.1f"):format(duration))
	else
		self.Time:SetText(("%.1f"):format(math_abs(duration - self.max)))
	end
end

local function CallbackUpdate(self, event, unit)
	local unit = unit or "target"
	local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
	if not nameplate then return end
	local self = nameplate.ouf

	local name = UnitName(unit)
	if name and K.PlateBlacklist[name] then
		self:Hide()
	else
		self:Show()
	end

	if UnitIsUnit(unit, "player") then
		self.Power:Show()
		self.Name:Hide()
		self.Castbar:SetAlpha(0)
		self.RaidIcon:SetAlpha(0)
	else
		self.Power:Hide()
		self.Name:Show()
		self.Castbar:SetAlpha(1)
		self.RaidIcon:SetAlpha(1)
	end
end

local function StyleUpdate(self, unit)
	local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
	local main = self
	nameplate.ouf = self
	self.unit = unit
	self:SetPoint("CENTER", nameplate, "CENTER")
	self:SetSize(C["Nameplates"].Width * K.NoScaleMult, C["Nameplates"].Height * K.NoScaleMult)

	-- Health Bar
	self.Health = CreateFrame("StatusBar", "$parentHealthBar", self)
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture(NameplateTexture)

	self.Health.colorTapping = true
	self.Health.colorDisconnected = true
	self.Health.colorClass = true
	self.Health.colorReaction = true
	self.Health.colorHealth = true
	self.Health.Smooth = C["Nameplates"].Smooth
	self.Health.SmoothSpeed = C["Nameplates"].SmoothSpeed * 10
	self.Health.frequentUpdates = true
	CreateVirtualFrame(self.Health)

	-- Create Health Text
	if C["Nameplates"].HealthValue == true then
		self.Health.value = self.Health:CreateFontString(nil, "OVERLAY")
		self.Health.value:SetFont(C["Media"].Font, C["Nameplates"].FontSize * K.NoScaleMult, C["Nameplates"].Outline and "OUTLINE" or "")
		self.Health.value:SetShadowOffset(C["Nameplates"].Outline and 0 or 1, C["Nameplates"].Outline and -0 or -1)
		self.Health.value:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
		self:Tag(self.Health.value, "[KkthnxUI:NameplateHealth]")
	end

	-- Create Player Power bar
	self.Power = CreateFrame("StatusBar", "$parentPowerBar", self)
	self.Power:SetStatusBarTexture(NameplateTexture)
	self.Power:ClearAllPoints()
	self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
	self.Power:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, -3-(C["Nameplates"].Height * K.NoScaleMult / 2))
	self.Power.frequentUpdates = true
	self.Power.colorPower = true
	self.Power.Smooth = C["Nameplates"].Smooth
	self.Power.SmoothSpeed = C["Nameplates"].SmoothSpeed * 10
	CreateVirtualFrame(self.Power)

	-- Create Name Text
	self.Name = self:CreateFontString(nil, "OVERLAY")
	self.Name:SetFont(C["Media"].Font, C["Nameplates"].FontSize * K.NoScaleMult, C["Nameplates"].Outline and "OUTLINE" or "")
	self.Name:SetShadowOffset(C["Nameplates"].Outline and 0 or 1, C["Nameplates"].Outline and -0 or -1)
	self.Name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", -3, 4)
	self.Name:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 3, 4)

	self.Name.Shade = self:CreateTexture()
	self.Name.Shade:SetDrawLayer("ARTWORK")
	self.Name.Shade:SetTexture(K.MediaPath.."Textures\\Shader")
	self.Name.Shade:SetPoint("TOPLEFT", self.Name, "TOPLEFT", -6, 6)
	self.Name.Shade:SetPoint("BOTTOMRIGHT", self.Name, "BOTTOMRIGHT", 6, -6)
	self.Name.Shade:SetVertexColor(C["Media"].BackdropColor[1], C["Media"].BackdropColor[2], C["Media"].BackdropColor[3])
	self.Name.Shade:SetAlpha(.5)

	if C["Nameplates"].NameAbbreviate == true then
		self:Tag(self.Name, "[KkthnxUI:NameplateNameColor][KkthnxUI:NameAbbreviateMedium]")
	else
		self:Tag(self.Name, "[KkthnxUI:NameplateNameColor][KkthnxUI:NameLong]")
	end

	-- Create Level
	self.Level = self:CreateFontString(nil, "OVERLAY")
	self.Level:SetFont(C["Media"].Font, C["Nameplates"].FontSize * K.NoScaleMult, C["Nameplates"].Outline and "OUTLINE" or "")
	self.Level:SetShadowOffset(C["Nameplates"].Outline and 0 or 1, C["Nameplates"].Outline and -0 or -1)
	self.Level:SetPoint("RIGHT", self.Health, "LEFT", -4, 0)
	self:Tag(self.Level, "[KkthnxUI:DifficultyColor][KkthnxUI:NameplateSmartLevel][KkthnxUI:ClassificationColor][shortclassification]")

	self.Level.Shade = self:CreateTexture()
	self.Level.Shade:SetDrawLayer("ARTWORK")
	self.Level.Shade:SetTexture(K.MediaPath.."Textures\\Shader")
	self.Level.Shade:SetPoint("TOPLEFT", self.Level, "TOPLEFT", -6, 6)
	self.Level.Shade:SetPoint("BOTTOMRIGHT", self.Level, "BOTTOMRIGHT", 6, -6)
	self.Level.Shade:SetVertexColor(C["Media"].BackdropColor[1], C["Media"].BackdropColor[2], C["Media"].BackdropColor[3])
	self.Level.Shade:SetAlpha(.5)

	-- Create Cast Bar
	self.Castbar = CreateFrame("StatusBar", nil, self)
	self.Castbar:SetFrameLevel(3)
	self.Castbar:SetStatusBarTexture(NameplateTexture)
	self.Castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
	self.Castbar:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, -3-(C["Nameplates"].Height * K.NoScaleMult))
	CreateVirtualFrame(self.Castbar)

	self.Castbar.Spark = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.Spark:SetSize(14, self:GetHeight() * 3.2)
	self.Castbar.Spark:SetTexture(C["Media"].Spark)
	self.Castbar.Spark:SetBlendMode("ADD")

	-- Create Cast Time Text
	self.Castbar.Time = self.Castbar:CreateFontString(nil, "ARTWORK")
	self.Castbar.Time:SetPoint("RIGHT", self.Castbar, "RIGHT", 0, 0)
	self.Castbar.Time:SetFont(C["Media"].Font, C["Nameplates"].FontSize * K.NoScaleMult, C["Nameplates"].Outline and "OUTLINE" or "")

	self.Castbar.CustomDelayText = CustomCastDelayText
	self.Castbar.CustomTimeText = CustomTimeText
	self.Castbar.PostCastInterruptible = PostCastInterruptible
	self.Castbar.PostCastNotInterruptible = PostCastNotInterruptible
	self.Castbar.PostCastStart = PostCastInterruptible
	self.Castbar.PostChannelStart = PostCastInterruptible

	self.Castbar.timeToHold = 0.4

	-- Create Cast Name Text
	if C["Nameplates"].CastbarName == true then
		self.Castbar.Text = self.Castbar:CreateFontString(nil, "OVERLAY")
		self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 3, 0)
		self.Castbar.Text:SetPoint("RIGHT", self.Castbar.Time, "LEFT", -1, 0)
		self.Castbar.Text:SetFont(C["Media"].Font, C["Nameplates"].FontSize * K.NoScaleMult, C["Nameplates"].Outline and "OUTLINE" or "")
		self.Castbar.Text:SetShadowOffset(C["Nameplates"].Outline and 0 or 1, C["Nameplates"].Outline and -0 or -1)
		self.Castbar.Text:SetHeight(C["Media"].FontSize)
		self.Castbar.Text:SetJustifyH("LEFT")
	end

	-- Create CastBar Icon
	self.Castbar.Icon = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	self.Castbar.Icon:SetDrawLayer("ARTWORK")
	self.Castbar.Icon:SetSize(C["Nameplates"].Height * 2 * K.NoScaleMult + 3, C["Nameplates"].Height * 2 * K.NoScaleMult + 3)
	self.Castbar.Icon:SetPoint("TOPLEFT", self.Health, "TOPRIGHT", 4, 0)
	CreateVirtualFrame(self.Castbar, self.Castbar.Icon)

	self.Castbar.Shield = self.Castbar:CreateTexture(nil, "OVERLAY")
	self.Castbar.Shield:SetTexture[[Interface\AddOns\KkthnxUI\Media\Textures\CastBorderShield]]
	self.Castbar.Shield:SetSize(40, 40)
	self.Castbar.Shield:SetPoint("RIGHT", self.Castbar, "LEFT", 18, 8)

	-- Raid Icon
	self.RaidIcon = self:CreateTexture(nil, "OVERLAY", nil, 7)
	self.RaidIcon:SetSize((C["Nameplates"].Height * 2 * K.NoScaleMult) + 8, (C["Nameplates"].Height * 2 * K.NoScaleMult) + 8)
	self.RaidIcon:SetPoint("BOTTOM", self.Health, "TOP", 0, C["Nameplates"].TrackAuras == true and 38 or 16)

	-- Create Totem Icon
	if C["Nameplates"].TotemIcons == true then
		self.Totem = CreateFrame("Frame", nil, self)
		self.Totem.Icon = self.Totem:CreateTexture(nil, "OVERLAY")
		self.Totem.Icon:SetSize((C["Nameplates"].Height * 2 * K.NoScaleMult) + 8, (C["Nameplates"].Height * 2 * K.NoScaleMult) + 8)
		self.Totem.Icon:SetPoint("BOTTOM", self.Health, "TOP", 0, 16)
		CreateVirtualFrame(self.Totem, self.Totem.Icon)
	end

	-- Create Healer Icon
	if C["Nameplates"].HealerIcon == true then
		self.HealerIcon = self.Health:CreateTexture(nil, "OVERLAY")
		self.HealerIcon:SetPoint("RIGHT", self.Health, "LEFT", -6, 0)
		self.HealerIcon:SetSize(32, 32)
		self.HealerIcon:SetTexture([[Interface\AddOns\KkthnxUI\Media\Nameplates\HealerIcon.tga]])
	end

	-- Aura tracking
	if C["Nameplates"].TrackAuras == true then
		self.DebuffIcons = CreateFrame("Frame", nil, self)
		self.DebuffIcons:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0 * K.NoScaleMult, C["Media"].FontSize + 7)
		self.DebuffIcons:SetSize(20 + C["Nameplates"].Width, C["Nameplates"].AurasSize)
	end

	self.HealthPrediction = K.CreateHealthPrediction(self)

	self.Health:RegisterEvent("PLAYER_REGEN_DISABLED")
	self.Health:RegisterEvent("PLAYER_REGEN_ENABLED")
	self.Health:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE")
	self.Health:RegisterEvent("UNIT_THREAT_LIST_UPDATE")

	self.Health:SetScript("OnEvent", function(self, event)
		ThreatColor(main)
	end)

	self.Health.PostUpdate = function(self, unit, min, max)
		local perc = 0
		if max and max > 0 then
			perc = min / max
		end

		local r, g, b
		local unitReaction = UnitReaction(unit, "player")
		if not UnitIsUnit("player", unit) and UnitIsPlayer(unit) and (unitReaction and unitReaction >= 5) then
			r, g, b = unpack(K.Colors.power["MANA"])
			self:SetStatusBarColor(r, g, b)
		elseif not UnitIsTapDenied(unit) and not UnitIsPlayer(unit) then
			local reaction = K.Colors.reaction[unitReaction]
			if reaction then
				r, g, b = reaction[1], reaction[2], reaction[3]
			else
				r, g, b = UnitSelectionColor(unit, true)
			end

			self:SetStatusBarColor(r, g, b)
		end

		if UnitIsPlayer(unit) then
			if perc <= 0.5 and perc >= 0.2 then
				SetVirtualBorder(self, 1, 1, 0)
			elseif perc < 0.2 then
				SetVirtualBorder(self, 1, 0, 0)
			else
				SetVirtualBorder(self, 0, 0, 0)
			end
		elseif not UnitIsPlayer(unit) and C["Nameplates"].EnhancedThreat == true then
			SetVirtualBorder(self, 0, 0, 0)
		end

		ThreatColor(main, true)
	end

	-- Every event should be register with this
	table_insert(self.__elements, UpdateName)
	self:RegisterEvent("UNIT_NAME_UPDATE", UpdateName)

	table_insert(self.__elements, UpdateTarget)
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateTarget)

	table_insert(self.__elements, UpdateAuras)
	self:RegisterEvent("UNIT_AURA", UpdateAuras)
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateAuras)
end

oUF:RegisterStyle("KkthnxUINamePlates", StyleUpdate)
oUF:SetActiveStyle("KkthnxUINamePlates")
oUF:SpawnNamePlates("KkthnxUINamePlates", CallbackUpdate, CVarUpdate)