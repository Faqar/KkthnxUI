KkthnxUIConfigLocalization = {}
-- Localization for zhTW

local Locale = GetLocale()
if (Locale ~= "zhTW") then
	return
end

local PerformanceSlight = "\n|cffFF0000Disabling this may slightly increase performance|r" -- For semi-high CPU options
local ToggleOffReminder = "\n|cffFF0000Turn this off to manually input your bar numbers|r"

-- Actionbar
KkthnxUIConfigLocalization.ActionBarBottomBars = "Number of bars on the bottom (1, 2 or 3)"
KkthnxUIConfigLocalization.ActionBarButtonSize = "Buttons size"
KkthnxUIConfigLocalization.ActionBarButtonSpace = "Buttons space"
KkthnxUIConfigLocalization.ActionBarEnable = "Enable action bars"
KkthnxUIConfigLocalization.ActionBarEquipBorder = "Display green border on equipped items"
KkthnxUIConfigLocalization.ActionBarGrid = "Show empty action bar buttons"
KkthnxUIConfigLocalization.ActionBarHideHighlight = "Hide proc highlight"
KkthnxUIConfigLocalization.ActionBarHotkey = "Show hotkey on buttons"
KkthnxUIConfigLocalization.ActionBarMacro = "Show macro name on buttons"
KkthnxUIConfigLocalization.ActionBarOutOfMana = "Out of mana color"
KkthnxUIConfigLocalization.ActionBarOutOfRange = "Out of range color"
KkthnxUIConfigLocalization.ActionBarPetBarHide = "Hide pet bar"
KkthnxUIConfigLocalization.ActionBarPetBarHorizontal = "Enable horizontal pet bar"
KkthnxUIConfigLocalization.ActionBarPetBarMouseover = "Petbar on mouseover (only for horizontal petbar)"
KkthnxUIConfigLocalization.ActionBarRightBars = "Number of action bars on right (0, 1, 2 or 3)"
KkthnxUIConfigLocalization.ActionBarRightBarsMouseover = "Right bars on mouseover"
KkthnxUIConfigLocalization.ActionBarSelfCast = "Always self-cast on right-click (regardless of current target)"
KkthnxUIConfigLocalization.ActionBarSplitBars = "Split the fifth bar on two bars on 6 buttons"
KkthnxUIConfigLocalization.ActionBarStanceBarHide = "Hide stance bar"
KkthnxUIConfigLocalization.ActionBarStanceBarHorizontal = "Enable horizontal stance bar"
KkthnxUIConfigLocalization.ActionBarStanceBarMouseover = "Stance bar on mouseover"
KkthnxUIConfigLocalization.ActionBarToggleMode = "Enable toggle mode"..ToggleOffReminder

-- Announcements
KkthnxUIConfigLocalization.Announcements = "Announcements"
KkthnxUIConfigLocalization.AnnouncementsBadGear = "Check for bad gear in instances"
KkthnxUIConfigLocalization.AnnouncementsInterrupt = "Announce in party/raid when you interrupt others"
KkthnxUIConfigLocalization.AnnouncementsPullCountdown = "Simple script to aid in creating a pull countdown announce. /pc"
KkthnxUIConfigLocalization.AnnouncementsSaySapped = "Instantly says Sapped to alert those around you whenever |cFFFFF569Rogues|r sap you."
KkthnxUIConfigLocalization.AnnouncementsSpells = "Announce in party/raid when you cast some spells"
KkthnxUIConfigLocalization.AnnouncementsSpellsFromAll = "Check spells cast from all members"

-- Automation
KkthnxUIConfigLocalization.Automation = "Automation"
KkthnxUIConfigLocalization.AutomationAutoInvite = "Auto accept invites (friends/guild) only"
KkthnxUIConfigLocalization.AutomationAutoCollapse = "Auto collapse objective tracker in instances"
KkthnxUIConfigLocalization.AutomationDeclineDuel = "Auto decline all duels"
KkthnxUIConfigLocalization.AutomationLoggingCombat = "Auto enables combat log text file in raid instances"
KkthnxUIConfigLocalization.AutomationNoBanner = "Auto hide the 'Boss Banner' loot frame"
KkthnxUIConfigLocalization.AutomationResurrection = "Auto resurrection in battlegrounds"
KkthnxUIConfigLocalization.AutomationScreenShot = "Take screenshot when player gets an achievement"
KkthnxUIConfigLocalization.AutomationTabBinder = "Auto change tab key to only target enemy players"

-- Bag
KkthnxUIConfigLocalization.Bags = "Bags"
KkthnxUIConfigLocalization.BagsBagFilter = "Automatically delete useless items from your bags when looted"
KkthnxUIConfigLocalization.BagsButtonSize = "Set a size for bag slots"
KkthnxUIConfigLocalization.BagsEnable = "Enable Bags"
KkthnxUIConfigLocalization.BagsInsertLeftToRight = "Set the loot to the left most bag first"
KkthnxUIConfigLocalization.BagsItemsPerRow = "Set how many slots are on each row of the bags"
KkthnxUIConfigLocalization.BagsPulseNewItem = "New items in your bags will have a flash animation"
KkthnxUIConfigLocalization.BagsSortRightToLeft = "Sort bags right to left, bottom to top"
KkthnxUIConfigLocalization.BagsSpacing = "Set the spacing between bag slots"

-- Blizzard
KkthnxUIConfigLocalization.Blizzard = "Blizzard"
KkthnxUIConfigLocalization.BlizzardClassColor = "Colorize player names by their class in friend list, who list, guild list, etc.."
KkthnxUIConfigLocalization.BlizzardColorTextures = "Change most UI texture hue colors."
KkthnxUIConfigLocalization.BlizzardEasyDelete = "Delete |CFF0080ffBlues|r/|CFFb048f8Epics|r without having to type delete"
KkthnxUIConfigLocalization.BlizzardReplaceBlizzardFonts = "Replaces the default |cff00B4FFBlizzard fonts|r on various panels and frames from |cff3c9bedKkthnxUI|r."
KkthnxUIConfigLocalization.BlizzardReputationGain = "Display a message which shows how much reputation you gained"
KkthnxUIConfigLocalization.BlizzardTexturesColor = "UI texture hue color. (Default is Classcolor)"
KkthnxUIConfigLocalization.BlizzardVehicleMouseover = "Vehicle frame on mouseover"

-- DataBars
KkthnxUIConfigLocalization.DataBars = "DataBars"
KkthnxUIConfigLocalization.DataBarsArtifactColor = "Artifact bar color"
KkthnxUIConfigLocalization.DataBarsArtifactEnable = "Enable Artifact bar"
KkthnxUIConfigLocalization.DataBarsArtifactFade = "Fade Artifact bar"
KkthnxUIConfigLocalization.DataBarsArtifactHeight = "Artifact bar height"
KkthnxUIConfigLocalization.DataBarsArtifactWidth = "Artifact bar width"
KkthnxUIConfigLocalization.DataBarsExperienceColor = "Experience bar color"
KkthnxUIConfigLocalization.DataBarsExperienceEnable = "Enable Experience bar"
KkthnxUIConfigLocalization.DataBarsExperienceFade = "Fade Experience bar"
KkthnxUIConfigLocalization.DataBarsExperienceHeight = "Experience bar height"
KkthnxUIConfigLocalization.DataBarsExperienceRestedColor = "Experience bar rest color"
KkthnxUIConfigLocalization.DataBarsExperienceWidth = "Experience bar width"
KkthnxUIConfigLocalization.DataBarsHonorColor = "Honor bar color"
KkthnxUIConfigLocalization.DataBarsHonorEnable = "Enable Honor bar"
KkthnxUIConfigLocalization.DataBarsHonorFade = "Fade Honor bar"
KkthnxUIConfigLocalization.DataBarsHonorHeight = "Honor bar height"
KkthnxUIConfigLocalization.DataBarsHonorWidth = "Honor bar width"
KkthnxUIConfigLocalization.DataBarsReputationEnable = "Enable Reputation bar"
KkthnxUIConfigLocalization.DataBarsReputationFade = "Fade Reputation bar"
KkthnxUIConfigLocalization.DataBarsReputationHeight = "Reputation bar height"
KkthnxUIConfigLocalization.DataBarsReputationWidth = "Reputation bar width"

-- Auras
KkthnxUIConfigLocalization.AURAS = "Auras"
KkthnxUIConfigLocalization.AurasAnimation = "Show a 'pop in' animation on auras"..PerformanceSlight
KkthnxUIConfigLocalization.AurasBuffsPerRow = "Set the number of buffs to show before creating a new row"
KkthnxUIConfigLocalization.AurasCastBy = "Show who cast an aura in its tooltip"
KkthnxUIConfigLocalization.AurasConsolidate = "Consolidate Auras"
KkthnxUIConfigLocalization.AurasEnable = "Enable Auras"
KkthnxUIConfigLocalization.AurasFlash = "Flash auras when their duration is low"..PerformanceSlight
KkthnxUIConfigLocalization.AurasHideBuffs = "Disable buff display"
KkthnxUIConfigLocalization.AurasHideDebuffs = "Disable debuff display"

-- Chat
KkthnxUIConfigLocalization.ChatFading = "Enable chat fading"
KkthnxUIConfigLocalization.ChatDamageMeterSpam = "Merge damage meter spam in one line-link"
KkthnxUIConfigLocalization.ChatEnable = "Enable chat"
KkthnxUIConfigLocalization.ChatFilter = "Removing some players spam"
KkthnxUIConfigLocalization.ChatHeight = "Height of the Chatframe"
KkthnxUIConfigLocalization.ChatLinkBrackets = "Display URL links wrapped in brackets"
KkthnxUIConfigLocalization.ChatLinkColor = "Set a color to display URL links in"
KkthnxUIConfigLocalization.ChatOutline = "Apply an outline to the chat font"
KkthnxUIConfigLocalization.ChatScrollByX = "Set the number of lines that the chat will jump when scrolling"
KkthnxUIConfigLocalization.ChatSpam = "Removing some systems spam('Player1' won duel 'Player2')"
KkthnxUIConfigLocalization.ChatTabsMouseover = "Chat tabs on mouseover"
KkthnxUIConfigLocalization.ChatTabsOutline = "Apply an outline to the chat tabs font"
KkthnxUIConfigLocalization.ChatWhispSound = "Play sound when receiving whispers"
KkthnxUIConfigLocalization.ChatWidth = "Width of the Chatframe"

-- DataText
KkthnxUIConfigLocalization.DataText = "DataText"
KkthnxUIConfigLocalization.DataTextBattleground = "Enable data text displaying battleground information"
KkthnxUIConfigLocalization.DataTextBottomBar = "Enable DataTextBar under your Actionbars"
KkthnxUIConfigLocalization.DataTextLocalTime = "Use local time in the Time data text, rather than realm time"
KkthnxUIConfigLocalization.DataTextLocation = "Enable location data text on the minimap at the top"
KkthnxUIConfigLocalization.DataTextSystem = "Enable system data text under the minimap displaying FPS & MS"
KkthnxUIConfigLocalization.DataTextTime = "Enable clock data text displaying time information at the bottom of the minimap"
KkthnxUIConfigLocalization.DataTextTime24Hr = "Set the Time data text to 24 hour format"

-- Cooldown
KkthnxUIConfigLocalization.Cooldown = "Cooldown"
KkthnxUIConfigLocalization.CooldownEnable = "Enable UI cooldown module"
KkthnxUIConfigLocalization.CooldownFontSize = "Cooldown font size"
KkthnxUIConfigLocalization.CooldownThreshold = "Cooldown threshold number"

-- Filger
KkthnxUIConfigLocalization.Filger = "Filger"
KkthnxUIConfigLocalization.FilgerBuffsSize = "Buffs size"
KkthnxUIConfigLocalization.FilgerCooldownSize = "Cooldowns size"
KkthnxUIConfigLocalization.FilgerDisableCD = "Disable cooldowns"
KkthnxUIConfigLocalization.FilgerEnable = "Enable Filger"
KkthnxUIConfigLocalization.FilgerMaxTestIcon = "The number of icons to the test"
KkthnxUIConfigLocalization.FilgerPvPSize = "PvP debuffs size"
KkthnxUIConfigLocalization.FilgerShowTooltip = "Show tooltip"
KkthnxUIConfigLocalization.FilgerTestMode = "Test icon mode"

-- General
KkthnxUIConfigLocalization.GeneralAutoScale = "Auto UI Scale"
KkthnxUIConfigLocalization.GeneralBubbleBackdrop = "Remove the chat bubble backdrop."
KkthnxUIConfigLocalization.GeneralBubbleFontSize = "Chat bubble font size"
KkthnxUIConfigLocalization.GeneralCustomLagTolerance = "Automatically update the Blizzard Custom Lag Tolerance option to your latency"
KkthnxUIConfigLocalization.GeneralShowConfigButton = "Show config button on minimap"
KkthnxUIConfigLocalization.GeneralTranslateMessage = "Popup to gain help for GUI translation."
KkthnxUIConfigLocalization.GeneralUIScale = "UI Scale (if auto-scale is disabled)"
KkthnxUIConfigLocalization.GeneralWelcomeMessage = "Welcome message in chat."

-- Loot
KkthnxUIConfigLocalization.LootConfirmDisenchant = "Auto confirm disenchant"
KkthnxUIConfigLocalization.LootAutoGreed = "Enable auto-greed & disenchant for green items at max level"
KkthnxUIConfigLocalization.LootLootFilter = "Filter party & raid members loot messages, based on item rarity"
KkthnxUIConfigLocalization.LootEnable = "Enable loot frame"
KkthnxUIConfigLocalization.LootIconSize = "Icon size"
KkthnxUIConfigLocalization.LootGroupLoot = "Enable group loot frame"
KkthnxUIConfigLocalization.LootWidth = "Loot frame width"

-- Minimap
KkthnxUIConfigLocalization.Minimap = "Minimap"
KkthnxUIConfigLocalization.MinimapCollectButtons = "Collect some minimap buttons in one line"
KkthnxUIConfigLocalization.MinimapEnable = "Enable minimap & make it square"
KkthnxUIConfigLocalization.MinimapFadeButtons = "Fade addon button when collected next to minimap"
KkthnxUIConfigLocalization.MinimapGarrison = "Garrison icon is shown on minimap"
KkthnxUIConfigLocalization.MinimapSize = "Minimap size - Default is 150"
KkthnxUIConfigLocalization.MinimapPing = "Displays a message when someone pings the minimap. |cffff0000*|r |ccfabd473Kkthnx|r |cffff0000*|r"

-- Misc
KkthnxUIConfigLocalization.Misc = "Miscellaneous"
KkthnxUIConfigLocalization.MiscAlreadyKnown = "Colorizes recipes, mounts & pets that are already known"
KkthnxUIConfigLocalization.MiscArmory = "Add Armory link in UnitPopupMenus (It can break UnitPopupMenus)"
KkthnxUIConfigLocalization.MiscAutoRepair = "When visiting a repair merchant, automatically repair our gear"
KkthnxUIConfigLocalization.MiscAutoSellGrays = "When visiting a vendor, automatically sell gray quality items"
KkthnxUIConfigLocalization.MiscColorPicker = "Improved color picker"
KkthnxUIConfigLocalization.MiscEnhancedMail = "Adds a take all button to your mail frame."
KkthnxUIConfigLocalization.MiscErrors = "Filters out messages from the UIErrorsFrame."
KkthnxUIConfigLocalization.MiscBGSpam = "Remove Boss Emote spam during BG"
KkthnxUIConfigLocalization.MiscInviteKeyword = "Short keyword for invite (/ainv)"
KkthnxUIConfigLocalization.MiscItemLevel = "Item level on character slot buttons"
KkthnxUIConfigLocalization.MiscMoveBlizzard = "Move some Blizzard frames"
KkthnxUIConfigLocalization.MiscSellMisc = "Automatically sells useless items that are not gray quality"
KkthnxUIConfigLocalization.MiscSlotDurability = "Durability on character slot buttons"
KkthnxUIConfigLocalization.MiscAFKCamera = "Spin camera while AFK"
KkthnxUIConfigLocalization.MiscUseGuildRepair = "When using 'Auto Repair', use funds from the guild bank"

-- Nameplates
KkthnxUIConfigLocalization.Nameplates = "Nameplates"
KkthnxUIConfigLocalization.NameplatesAdditionalHeight = "Additional height for selected nameplate"
KkthnxUIConfigLocalization.NameplatesAdditionalWidth = "Additional width for selected nameplate"
KkthnxUIConfigLocalization.NameplatesAurasSize = "Debuffs size"
KkthnxUIConfigLocalization.NameplatesBadColor = "Bad threat color, varies depending if your a tank or dps/heal"
KkthnxUIConfigLocalization.NameplatesCastbarName = "Show castbar name"
KkthnxUIConfigLocalization.NameplatesClassIcons = "Icons by class in PvP"
KkthnxUIConfigLocalization.NameplatesCombat = "Automatically show nameplates in combat"
KkthnxUIConfigLocalization.NameplatesEnable = "Enable nameplates"
KkthnxUIConfigLocalization.NameplatesEnhancedThreat = "Enable threat feature, automatically changes by your role"
KkthnxUIConfigLocalization.NameplatesGoodColor = "Good threat color, varies depending if your a tank or dps/heal"
KkthnxUIConfigLocalization.NameplatesHealerIcon = "Show icon above enemy healers nameplate in battlegrounds"
KkthnxUIConfigLocalization.NameplatesHealthValue = "Numeral health value"
KkthnxUIConfigLocalization.NameplatesHeight = "Nameplates height"
KkthnxUIConfigLocalization.NameplatesNameAbbreviate = "Abbreviate names longer than 18 characters"
KkthnxUIConfigLocalization.NameplatesNearColor = "Losing/Gaining threat color"
KkthnxUIConfigLocalization.NameplatesTrackAuras = "Show debuffs (from the list)"
KkthnxUIConfigLocalization.NameplatesWidth = "Nameplates width"

-- PulseCD
KkthnxUIConfigLocalization.PulseCD = "Pulse Cooldowns"
KkthnxUIConfigLocalization.PulseCDAnimationScale = "Animation scaling"
KkthnxUIConfigLocalization.PulseCDEnable = "Show cooldowns pulse"
KkthnxUIConfigLocalization.PulseCDHoldTime = "Max opacity hold time"
KkthnxUIConfigLocalization.PulseCDSize = "Cooldowns pulse icon size"
KkthnxUIConfigLocalization.PulseCDSound = "Warning sound notification"
KkthnxUIConfigLocalization.PulseCDThreshold = "Minimal threshold time"

-- RaidCD
KkthnxUIConfigLocalization.RaidCD = "Raid Cooldowns"
KkthnxUIConfigLocalization.RaidCDEnable = "Enable raid cooldowns"
KkthnxUIConfigLocalization.RaidCDHeight = "Raid cooldowns bars height"
KkthnxUIConfigLocalization.RaidCDWidth = "Raid cooldowns bars width (if the icon is enabled, width+28)"
KkthnxUIConfigLocalization.RaidCDUpWards = "Raid cooldowns sort upwards bars"
KkthnxUIConfigLocalization.RaidCDExpiration = "Sort by expiration time"
KkthnxUIConfigLocalization.RaidCDShowSelf = "Show self cooldowns"
KkthnxUIConfigLocalization.RaidCDShowIcon = "Raid cooldowns icons"
KkthnxUIConfigLocalization.RaidCDShowInRaid = "Show raid cooldowns in raid zone"
KkthnxUIConfigLocalization.RaidCDShowInParty = "Show raid cooldowns in party zone"
KkthnxUIConfigLocalization.RaidCDShowInArena = "Show raid cooldowns in arena zone"

-- Config GUI Buttons
KkthnxUIConfigLocalization.ConfigApplyButton = "Apply"
KkthnxUIConfigLocalization.ConfigButtonReset = "Total UI Reset"
KkthnxUIConfigLocalization.ConfigCloseButton = "Close"

-- Config Static Popups
KkthnxUIConfigLocalization.ConfigPerChar = "Are you sure you want to change to or from 'Per Char Settings'?"
KkthnxUIConfigLocalization.ConfigResetAll = "Are you sure you want to reset all settings for |cff3c9bedKkthnxUI|r."
KkthnxUIConfigLocalization.ConfigResetChar = "Are you sure you want to reset your character's settings for|r?"
KkthnxUIConfigLocalization.ConfigSetSavedSettings = "Set settings Per-Character"

-- Skins
KkthnxUIConfigLocalization.Skins = "AddOn Skins"
KkthnxUIConfigLocalization.SkinsBigWigs = "BigWigs"
KkthnxUIConfigLocalization.SkinsChatBubble = "Blizzard chat bubbles"
KkthnxUIConfigLocalization.SkinsDBM = "DeadlyBossMods"
KkthnxUIConfigLocalization.SkinsDBMMove = "Allow to move DBM bars"
KkthnxUIConfigLocalization.SkinsMinimapButtons = "Minimap buttons"
KkthnxUIConfigLocalization.SkinsRecount = "Recount"
KkthnxUIConfigLocalization.SkinsSkada = "Skada"
KkthnxUIConfigLocalization.SkinsSpy = "Spy"
KkthnxUIConfigLocalization.SkinsWeakAuras = "WeakAuras"

-- Tooltip
KkthnxUIConfigLocalization.Tooltip = "Tooltip"
KkthnxUIConfigLocalization.TooltipAchievements = "Comparing achievements in tooltip"
KkthnxUIConfigLocalization.TooltipCursor = "Tooltip above cursor"
KkthnxUIConfigLocalization.TooltipEnable = "Enable tooltip"
KkthnxUIConfigLocalization.TooltipHealthValue = "Numeral health value"
KkthnxUIConfigLocalization.TooltipHyperLink = "Display the hyperlink tooltip while hovering over a hyperlink."
KkthnxUIConfigLocalization.TooltipInstanceLock = "Your instance lock status in tooltip"
KkthnxUIConfigLocalization.TooltipItemCount = "Item count"
KkthnxUIConfigLocalization.TooltipItemIcon = "Item icon in tooltip"
KkthnxUIConfigLocalization.TooltipShowSpec = "Display player specialization tooltip"
KkthnxUIConfigLocalization.TooltipSpellID = "Spell ID"

-- Unitframe
KkthnxUIConfigLocalization.Unitframe = "Unit Frames"
KkthnxUIConfigLocalization.UnitframeCastbars = "Enable uniframe castbars"
KkthnxUIConfigLocalization.UnitframeCastbarSafeZoneColor = "Player castbar safezone color"
KkthnxUIConfigLocalization.UnitframeClassColor = "Classcolor the uniframe healthbars."
KkthnxUIConfigLocalization.UnitframeClassPortraits = "Enable old class portraits"
KkthnxUIConfigLocalization.UnitframeCombatText = "Show Combat Feedback"
KkthnxUIConfigLocalization.UnitframeEnable = "Enable unit frames"
KkthnxUIConfigLocalization.UnitframeFlatClassPortraits = "Enable new class portraits"
KkthnxUIConfigLocalization.UnitframeFocusCastbarHeight = "Focus castbar Height"
KkthnxUIConfigLocalization.UnitframeFocusCastbarWidth = "Focus castbar width"
KkthnxUIConfigLocalization.UnitframeIconPlayer = "Set player castbar icon 'LEFT OR RIGHT'"
KkthnxUIConfigLocalization.UnitframeIconTarget = "Set target castbar icon 'LEFT OR RIGHT'"
KkthnxUIConfigLocalization.UnitframeParty = "Enable party frames."
KkthnxUIConfigLocalization.UnitframePlayerCastbarHeight = "Player castbar height"
KkthnxUIConfigLocalization.UnitframePlayerCastbarWidth = "Player castbar width"
KkthnxUIConfigLocalization.UnitframePlayerDebuffsOnly = "Only color player debuffs"
KkthnxUIConfigLocalization.UnitframePortraitTimer = "Show Portrait Timers"
KkthnxUIConfigLocalization.UnitframePowerPredictionBar = "Power prediction bar (Display estimated cost of spells when casting)"
KkthnxUIConfigLocalization.UnitframeScale = "Scale some of the uniframes."
KkthnxUIConfigLocalization.UnitframeShowArena = "Enable arena frames"
KkthnxUIConfigLocalization.UnitframeShowBoss = "Enable boss frames"
KkthnxUIConfigLocalization.UnitframeShowPlayer = "Show yourself in the party"
KkthnxUIConfigLocalization.UnitframeStyle = "Style the uniframes look 'fat or normal'"
KkthnxUIConfigLocalization.UnitframeTargetCastbarHeight = "Target castbar height"
KkthnxUIConfigLocalization.UnitframeTargetCastbarWidth = "Target castbar width"
KkthnxUIConfigLocalization.UnitframeTargetDebuffsTop = "Display Target debuffs ontop of the frame."
KkthnxUIConfigLocalization.UnitframeTextHealthColor = "Health text color"
KkthnxUIConfigLocalization.UnitframeTextNameColor = "Name text color"
KkthnxUIConfigLocalization.UnitframeTextPowerColor = "Power text color"
KkthnxUIConfigLocalization.UnitframeThreatGlow = "Threat glow around unitframes"
KkthnxUIConfigLocalization.UnitframeThreatValue = "Visual threat text on the player frame"

-- Raidframe
KkthnxUIConfigLocalization.Raidframe = "Raid Frames"
KkthnxUIConfigLocalization.RaidframeAuraWatch = "Display timers for class specific buffs in the corners of the raid frames"
KkthnxUIConfigLocalization.RaidframeAuraWatchTimers = "Display a timer on debuff icons created by Debuff Watch"
KkthnxUIConfigLocalization.RaidframeDeficitThreshold = "Health deficit threshold"
KkthnxUIConfigLocalization.RaidframeEnable = "Enable raid frames"
KkthnxUIConfigLocalization.RaidframeHeight = "Height of raid frames"
KkthnxUIConfigLocalization.RaidframeHorizontalHealthBars = "Display the healthbars horizontal"
KkthnxUIConfigLocalization.RaidframeIconSize = "Size of debuff icons diplayed on raid frames."
KkthnxUIConfigLocalization.RaidframeIndicatorSize = "Size of indicators on raid frames"
KkthnxUIConfigLocalization.RaidframeMainTankFrames = "Enable the use of main tank/assist frames in a raid."
KkthnxUIConfigLocalization.RaidframeManabarHorizontal = "Display the manabar horizontal"
KkthnxUIConfigLocalization.RaidframeManabarShow = "Display Manabar"
KkthnxUIConfigLocalization.RaidframeMaxUnitPerColumn = "How many units per raid column"
KkthnxUIConfigLocalization.RaidframeRaidAsParty = "Display raid frames instead of party frames"
KkthnxUIConfigLocalization.RaidframeScale = "Scale of raid frames"
KkthnxUIConfigLocalization.RaidframeShowMouseoverHighlight = "Show a highlight texture on mouseover"
KkthnxUIConfigLocalization.RaidframeShowNotHereTimer = "Show AFK/Offline timers"
KkthnxUIConfigLocalization.RaidframeShowResurrectText = "Display resurrection text"
KkthnxUIConfigLocalization.RaidframeShowRolePrefix = "Display role prefixes"
KkthnxUIConfigLocalization.RaidframeShowThreatText = "Show threat text"
KkthnxUIConfigLocalization.RaidframeWidth = "Width of raid frames"

-- WorldMap
KkthnxUIConfigLocalization.WorldMap = "World Map"
KkthnxUIConfigLocalization.WorldMapAlphaWhenMoving = "Alpha of the world map when you are moving."
KkthnxUIConfigLocalization.WorldMapCoordinates = "Put coordinates on the world map."
KkthnxUIConfigLocalization.WorldMapFadeWhenMoving = "Fade the world map when you are moving."
KkthnxUIConfigLocalization.WorldMapFogOfWar = "Remove fog of war on World Map"
KkthnxUIConfigLocalization.WorldMapSmallWorldMap = "Make the world map smaller."