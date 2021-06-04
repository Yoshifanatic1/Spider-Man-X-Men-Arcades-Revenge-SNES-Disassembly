
macro SXAR_GameSpecificAssemblySettings()
	!ROM_SXAR_U = $0001							;\ These defines assign each ROM version with a different bit so version difference checks will work. Do not touch them!
	!ROM_SXAR_E = $0002							;/

	%SetROMToAssembleForHack(SXAR_U, !ROMID)
endmacro

macro SXAR_LoadGameSpecificMainSNESFiles()
	incsrc ../Misc_Defines_SXAR.asm
	incsrc ../RAM_Map_SXAR.asm
	incsrc ../Routine_Macros_SXAR.asm
	incsrc ../SNES_Macros_SXAR.asm
	%LoadExtraRAMFile("SRAM_Map_SXAR.asm", !GameID, SXAR)
endmacro

macro SXAR_LoadGameSpecificMainSPC700Files()
	incsrc ../SPC700/ARAM_Map_SXAR.asm
	incsrc ../Misc_Defines_SXAR.asm
	incsrc ../SPC700/SPC700_Macros_SXAR.asm
endmacro

macro SXAR_LoadGameSpecificMainExtraHardwareFiles()
endmacro

macro SXAR_LoadGameSpecificMSU1Files()
endmacro

macro SXAR_GlobalAssemblySettings()
	!Define_Global_ApplyAsarPatches = !FALSE
	!Define_Global_InsertRATSTags = !TRUE
	!Define_Global_IgnoreCodeAlignments = !FALSE
	!Define_Global_IgnoreOriginalFreespace = !FALSE
	!Define_Global_CompatibleControllers = !Controller_StandardJoypad
	!Define_Global_DisableROMMirroring = !FALSE
	!Define_Global_CartridgeHeaderVersion = $00
	!Define_Global_FixIncorrectChecksumHack = !FALSE
	!Define_Global_ROMFrameworkVer = 1
	!Define_Global_ROMFrameworkSubVer = 1
	!Define_Global_ROMFrameworkSubSubVer = 0
	!Define_Global_AsarChecksum = $0000
	!Define_Global_LicenseeName = "LJN"
	!Define_Global_DeveloperName = "Software Creations"
	!Define_Global_ReleaseDate = "November 1992"
	!Define_Global_BaseROMMD5Hash = "9d59f3def2b1a8d87f7e97cef41a04c0"

	!Define_Global_MakerCode = "51"
	!Define_Global_GameCode = "SXAR  "
	!Define_Global_ReservedSpace = $00,$00,$00,$00,$00,$00
	!Define_Global_ExpansionFlashSize = !ExpansionMemorySize_0KB
	!Define_Global_ExpansionRAMSize = !ExpansionMemorySize_0KB
	!Define_Global_IsSpecialVersion = $00
	!Define_Global_InternalName = "X-MEN                "
	!Define_Global_ROMLayout = !ROMLayout_LoROM
	!Define_Global_ROMType = !ROMType_ROM
	!Define_Global_CustomChip = !Chip_None
	!Define_Global_ROMSize1 = !ROMSize_1MB
	!Define_Global_ROMSize2 = !ROMSize_0KB
	!Define_Global_SRAMSize = !SRAMSize_0KB
	!Define_Global_Region = !Region_NorthAmerica
	!Define_Global_LicenseeID = $51
	!Define_Global_VersionNumber = $00
	!Define_Global_ChecksumCompliment = !Define_Global_Checksum^$FFFF
	!Define_Global_Checksum = $C5F0
	!UnusedNativeModeVector1 = $A8AE
	!UnusedNativeModeVector2 = $BAAA
	!NativeModeCOPVector = $7FAA
	!NativeModeBRKVector = CODE_00B42A
	!NativeModeAbortVector = CODE_00B42A
	!NativeModeNMIVector = CODE_008766
	!NativeModeResetVector = CODE_008789
	!NativeModeIRQVector = CODE_00B42A
	!UnusedEmulationModeVector1 = CODE_008789
	!UnusedEmulationModeVector2 = CODE_008789
	!EmulationModeCOPVector = CODE_008789
	!EmulationModeBRKVector = CODE_008789
	!EmulationModeAbortVector = CODE_008789
	!EmulationModeNMIVector = CODE_008789
	!EmulationModeResetVector = CODE_008000
	!EmulationModeIRQVector = CODE_008789
endmacro

macro SXAR_LoadROMMap()
	%SXARBank00Macros(!BANK_00, !BANK_00)
	%SXARBank01Macros(!BANK_01, !BANK_01)
	%SXARBank02Macros(!BANK_02, !BANK_02)
	%SXARBank03Macros(!BANK_03, !BANK_03)

%BANK_START(!BANK_04)
namespace SXAR_UnsortedDataBlock1
check bankcross off

Main:
	%SXAR_InsertUnsortedData($048000, incbin, Palette_FGBG_Wolverine2)
	%SXAR_InsertUnsortedData($048100, incbin, Graphics_FGBG_SwimmingStormLevel)
	%SXAR_InsertUnsortedData($04C442, incbin, Graphics_Sprite_SwimmingStormEnemies)
	%SXAR_InsertUnsortedData($04E4FB, incbin, Graphics_Player_SwimmingStorm)
	%SXAR_InsertUnsortedData($04F76F, incbin, Graphics_Player_Wolverine)
	%SXAR_InsertUnsortedData($0597CC, incbin, Graphics_Player_WolverineClaws)
	%SXAR_InsertUnsortedData($05A2C1, incbin, Graphics_Sprite_CyclopsGlobalSpritesAndEnemies)
	%SXAR_InsertUnsortedData($05C59C, incbin, Graphics_Player_Cyclops)
	%SXAR_InsertUnsortedData($05EE90, incbin, Graphics_FGBG_CyclopsLevel)
	%SXAR_InsertUnsortedData($06AE04, incbin, Graphics_Sprite_WeirdAlienCaveCreature)
	%SXAR_InsertUnsortedData($06C0FB, incbin, Graphics_FGBG_MasterMold)
	%SXAR_InsertUnsortedData($0784CD, incbin, Graphics_Sprite_StormPortrait)
	%SXAR_InsertUnsortedData($078EDF, incbin, Graphics_Sprite_CyclopsPortrait)
	%SXAR_InsertUnsortedData($0797BB, incbin, Graphics_Sprite_WolverinePortrait)
	%SXAR_InsertUnsortedData($07A085, incbin, Graphics_Sprite_GambitPortrait)
	%SXAR_InsertUnsortedData($07AA4F, incbin, Graphics_Sprite_SpiderManPortrait)
	%SXAR_InsertUnsortedData($07B3E7, incbin, Graphics_Sprite_WolverineLevel1EnemiesAndGlobalSprites)
	%SXAR_InsertUnsortedData($07D7F6, incbin, Graphics_Layer1_CharacterBioFont)
	%SXAR_InsertUnsortedData($07D9F8, incbin, Graphics_Sprite_PausedText)
	%SXAR_InsertUnsortedData($07DBD2, incbin, Graphics_FGBG_WolverineLevel)
	%SXAR_InsertUnsortedData($08A84E, incbin, Graphics_Sprite_MiniMasterMoldAndEnemyShip)
	%SXAR_InsertUnsortedData($08B046, incbin, Graphics_Sprite_Obnoxio)
	%SXAR_InsertUnsortedData($08CBB9, incbin, Graphics_Sprite_XMenLogo)
	%SXAR_InsertUnsortedData($08D6DC, incbin, Graphics_Layer1_ComicBookIntroCutscene)
	%SXAR_InsertUnsortedData($08F656, incbin, Graphics_Layer1_ComicBookEndingCutscene)
	%SXAR_InsertUnsortedData($09916B, incbin, Graphics_Sprite_ComicBookIntroCutscene)
	%SXAR_InsertUnsortedData($099C89, incbin, Graphics_Sprite_ComicBookEndingCutscene)
	%SXAR_InsertUnsortedData($09A70D, incbin, Graphics_Sprite_Apocalypse)
	%SXAR_InsertUnsortedData($09B113, incbin, Graphics_Sprite_WolverineLevel2EnemiesAndGlobalSprites)
	%SXAR_InsertUnsortedData($09D6A6, incbin, Graphics_Layer1_ArcadeBriefingCutscene)
	%SXAR_InsertUnsortedData($0A8866, incbin, Graphics_FGBG_WolverineCyclopsFinalLevel)
	%SXAR_InsertUnsortedData($0A9714, incbin, Graphics_Sprite_DrainBeam1)
	%SXAR_InsertUnsortedData($0A9754, incbin, Graphics_Sprite_DrainBeam2)
	%SXAR_InsertUnsortedData($0A97A4, incbin, Graphics_Layer3_Water)
	%SXAR_InsertUnsortedData($0AAB4F, incbin, Tilemap_Unknown1)
	%SXAR_InsertUnsortedData($0AAC3C, incbin, Tilemap_Unknown2)
	%SXAR_InsertUnsortedData($0AAC74, incbin, Tilemap_IntroComicBook)
	%SXAR_InsertUnsortedData($0AB1D7, incbin, Tilemap_ComicBookEndingCutscene)
	%SXAR_InsertUnsortedData($0AB692, incbin, Tilemap_Layer2_ArcadeBriefingCutscene1)
	%SXAR_InsertUnsortedData($0ABB7C, incbin, Tilemap_Layer2_ArcadeBriefingCutscene2)
	%SXAR_InsertUnsortedData($0AC073, incbin, Tilemap_Layer2_TopRowsOfArcadeBriefingCutscene)
	%SXAR_InsertUnsortedData($0AC0FC, incbin, Tilemap_Layer3_Water)
	%SXAR_InsertUnsortedData($0AEADE, incbin, LevelBG_Storm1)
	%SXAR_InsertUnsortedData($0AFD10, incbin, LevelBG_Cyclops1)
	%SXAR_InsertUnsortedData($0B8726, incbin, Tilemap_Unknown3)
	%SXAR_InsertUnsortedData($0B8735, incbin, LevelData_Storm1)
	%SXAR_InsertUnsortedData($0BBD02, incbin, LevelData_Storm2)
	%SXAR_InsertUnsortedData($0BF409, incbin, LevelData_Cyclops1)
	%SXAR_InsertUnsortedData($0CC118, incbin, LevelData_Cyclops2Boss)
	%SXAR_InsertUnsortedData($0CC331, incbin, LevelData_Wolverine1)
	%SXAR_InsertUnsortedData($0CEE08, incbin, LevelBG_Wolverine1)
	%SXAR_InsertUnsortedData($0CF5C5, incbin, LevelData_Cyclops2)
	%SXAR_InsertUnsortedData($0D8AF8, incbin, LevelData_Wolverine2)
	%SXAR_InsertUnsortedData($0DA829, incbin, LevelBG_Wolverine2)
	%SXAR_InsertUnsortedData($0DB5E6, incbin, LevelData_Wolverine3)
	%SXAR_InsertUnsortedData($0DBD07, incbin, LevelData_Cyclops3)
	%SXAR_InsertUnsortedData($0DC44F, incbin, LevelBG_Cyclops3)
	%SXAR_InsertUnsortedData($0DCE31, incbin, Palette_Unknown1)
	%SXAR_InsertUnsortedData($0DCF31, incbin, Palette_Unknown2)
	%SXAR_InsertUnsortedData($0DD131, incbin, Palette_Unknown3)
	%SXAR_InsertUnsortedData($0DD331, incbin, Palette_Unknown4)
	%SXAR_InsertUnsortedData($0DD351, incbin, Palette_Unknown5)
	%SXAR_InsertUnsortedData($0DD3B1, incbin, Palette_FGBGSprite_Storm1)
	%SXAR_InsertUnsortedData($0DD5B1, incbin, Palette_SplashScreenAndSpiderManLogo)
	%SXAR_InsertUnsortedData($0DD7B1, incbin, Palette_Sprite_Cyclops1)
	%SXAR_InsertUnsortedData($0DD8B1, incbin, Palette_FGBG_Cyclops1)
	%SXAR_InsertUnsortedData($0DD9B1, incbin, Palette_FGBG_Cyclops2Boss)
	%SXAR_InsertUnsortedData($0DDAB1, incbin, Palette_StormPortrait)
	%SXAR_InsertUnsortedData($0DDBB1, incbin, Palette_CyclopsPortrait)
	%SXAR_InsertUnsortedData($0DDCB1, incbin, Palette_WolverinePortrait)
	%SXAR_InsertUnsortedData($0DDDB1, incbin, Palette_GambitPortrait)
	%SXAR_InsertUnsortedData($0DDEB1, incbin, Palette_SpiderManPortrait)
	%SXAR_InsertUnsortedData($0DDFB1, incbin, Palette_Credits)
	%SXAR_InsertUnsortedData($0DE0B1, incbin, Palette_Sprite_Wolverine1)
	%SXAR_InsertUnsortedData($0DE1B1, incbin, Palette_Sprite_CharacterSelect)
	%SXAR_InsertUnsortedData($0DE1F1, incbin, Palette_FGBG_Wolverine1)
	%SXAR_InsertUnsortedData($0DE2F1, incbin, Palette_WellDoneText)
	%SXAR_InsertUnsortedData($0DE311, incbin, Palette_TitleScreenCharacters)
	%SXAR_InsertUnsortedData($0DE411, incbin, Palette_BG_Cyclops2)
	%SXAR_InsertUnsortedData($0DE431, incbin, Palette_TitleScreenXMenLogo)
	%SXAR_InsertUnsortedData($0DE451, incbin, Palette_Layer1_IntroComicBook)
	%SXAR_InsertUnsortedData($0DE551, incbin, Palette_Layer1_EndingComicBook)
	%SXAR_InsertUnsortedData($0DE651, incbin, Palette_Sprite_IntroComicBook)
	%SXAR_InsertUnsortedData($0DE751, incbin, Palette_Sprite_Wolverine2)
	%SXAR_InsertUnsortedData($0DE851, incbin, Palette_Layer1_ArcadeBriefingCutscene1)
	%SXAR_InsertUnsortedData($0DE951, incbin, Palette_Layer1_ArcadeBriefingCutscene2)
	%SXAR_InsertUnsortedData($0DEA51, incbin, Palette_FGBG_Cyclops3)
	%SXAR_InsertUnsortedData($0DEB51, incbin, Palette_Sprite_DrainBeam)
	%SXAR_InsertUnsortedData($0DEB71, incbin, Graphics_Layer1_TitleScreenCharacters)
	%SXAR_InsertUnsortedData($0EA7F1, incbin, Tilemap_Layer1_TitleScreenCharacters)
	%SXAR_InsertUnsortedData($0EAE31, incbin, Graphics_Sprite_LargeFont)
	%SXAR_InsertUnsortedData($0ECA31, incbin, Graphics_UnknownItalicFont)
	%SXAR_InsertUnsortedData($0ECDB1, incbin, Graphics_Mode7_CopyOfAcclaimAndXMenLogos)
	%SXAR_InsertUnsortedData($0F8C31, incbin, Graphics_Sprite_SpiderManLogo)
	%SXAR_InsertUnsortedData($0FAC31, incbin, Graphics_Sprite_SoftwareCreationsLogo)
	%SXAR_InsertUnsortedData($0FB831, incbin, SPCEngine)
	%SXAR_InsertUnsortedData($0FC73D, incbin, SPCSampleBank)
	%SXAR_InsertUnsortedData($118EF5, incbin, Music_CopyOfBriefing)
	%SXAR_InsertUnsortedData($1198F8, incbin, Music_SpiderManLevel)
	%SXAR_InsertUnsortedData($11AB10, incbin, Music_StormLevel)
	%SXAR_InsertUnsortedData($11BAE6, incbin, Music_CyclopsLevel)
	%SXAR_InsertUnsortedData($11D0E5, incbin, Music_TitleScreen)
	%SXAR_InsertUnsortedData($11D9BE, incbin, Music_WolverineLevel)
	%SXAR_InsertUnsortedData($11E9C6, incbin, Music_GambitLevel)
	%SXAR_InsertUnsortedData($11F6D8, incbin, Music_HighScore)
	%SXAR_InsertUnsortedData($11FE5F, incbin, Music_Briefing)
	%SXAR_InsertUnsortedData($1284D6, incbin, Music_Ending)
	%SXAR_InsertUnsortedData($12914B, incbin, Music_FinalLevel)
	%SXAR_InsertUnsortedData($129761, incbin, Music_GameOver)
check bankcross on
	%InsertGarbageData($129A3D, incbin, DATA_129A3D.bin)
namespace off
%BANK_END(!BANK_12)

	%SXARBank13Macros(!BANK_13, !BANK_13)
	%SXARBank14Macros(!BANK_14, !BANK_14)

%BANK_START(!BANK_15)
namespace SXAR_UnsortedDataBlock2
check bankcross off

Main:
	%SXAR_InsertUnsortedData($158000, incbin, Graphics_Layer3_GambitLevelSmallAndLargeFont)
	%SXAR_InsertUnsortedData($158628, incbin, Graphics_Sprite_CopyOfGambitPortrait)
	%SXAR_InsertUnsortedData($158EFE, incbin, Graphics_Sprite_CopyOfStormPortrait)
	%SXAR_InsertUnsortedData($159852, incbin, Graphics_Sprite_KingCard)
	%SXAR_InsertUnsortedData($159DD8, incbin, Graphics_Layer2_KingCardBG)
	%SXAR_InsertUnsortedData($159E3E, incbin, Graphics_Layer2_DescendingWall)
	%SXAR_InsertUnsortedData($15A208, incbin, Graphics_Sprite_WalkingStormEnemiesAndGlobalSprites)
	%SXAR_InsertUnsortedData($15C112, incbin, Graphics_Sprite_GambitLevelGlobalSprites_BlackQueen)
	%SXAR_InsertUnsortedData($15D1E0, incbin, Graphics_FGBG_FinalGambitLevel)
	%SXAR_InsertUnsortedData($15E15D, incbin, Graphics_FGBG_GambitLevel)
	%SXAR_InsertUnsortedData($1697F6, incbin, Graphics_Layer2_GiantSpikeBall)
	%SXAR_InsertUnsortedData($169F62, incbin, Graphics_FG_BlackQueenThrone)
	%SXAR_InsertUnsortedData($16AD13, incbin, Palette_FGBG_Gambit1)
	%SXAR_InsertUnsortedData($16AE06, incbin, Palette_FGBG_Gambit2)
	%SXAR_InsertUnsortedData($16AEEE, incbin, Palette_Sprite_Gambit1)
	%SXAR_InsertUnsortedData($16AFD6, incbin, Palette_CopyOfGambitPortrait)
	%SXAR_InsertUnsortedData($16B029, incbin, Palette_CopyOfStormPortrait)
	%SXAR_InsertUnsortedData($16B081, incbin, Palette_Sprite_Storm3)
	%SXAR_InsertUnsortedData($16B14E, incbin, Palette_FGBG_FinalGambit)
	%SXAR_InsertUnsortedData($16B230, incbin, Graphics_Player_Gambit)
	%SXAR_InsertUnsortedData($16D524, incbin, Graphics_Player_WalkingStorm)
	%SXAR_InsertUnsortedData($16F52E, incbin, Graphics_Sprite_GambitLevelEnemies)
	%SXAR_InsertUnsortedData($17947D, incbin, LevelData_Gambit1)
	%SXAR_InsertUnsortedData($17B249, incbin, LevelData_Gambit2)
	%SXAR_InsertUnsortedData($17C416, incbin, LevelBG_Gambit2)
	%SXAR_InsertUnsortedData($17D1DE, incbin, LevelData_Gambit3)
	%SXAR_InsertUnsortedData($17D96A, incbin, LevelBG_Gambit3)
	%SXAR_InsertUnsortedData($17E11F, incbin, LevelData_Storm3)
check bankcross on
	%InsertGarbageData($17E840, incbin, DATA_17E840.bin)
namespace off
%BANK_END(!BANK_17)

	%SXARBank18Macros(!BANK_18, !BANK_18)
	%SXARBank19Macros(!BANK_19, !BANK_19)
	%SXARBank1AMacros(!BANK_1A, !BANK_1A)
	%SXARBank1BMacros(!BANK_1B, !BANK_1B)

%BANK_START(!BANK_1C)
namespace SXAR_UnsortedDataBlock3
check bankcross off

Main:
	%SXAR_InsertUnsortedData($1C8000, incbin, Graphics_FGBG_City)
	%SXAR_InsertUnsortedData($1CCDB2, incbin, Palette_FGBG_SpiderMan1)
	%SXAR_InsertUnsortedData($1CCE81, incbin, Palette_FGBG_IntroLevel)
	%SXAR_InsertUnsortedData($1CCF59, incbin, Graphics_Layer3_SmallAndLargeFont)
	%SXAR_InsertUnsortedData($1CD61C, incbin, Palette_GetReadySpiderMan)
	%SXAR_InsertUnsortedData($1CD62F, incbin, Palette_SpiderMan)
	%SXAR_InsertUnsortedData($1CD64C, incbin, Graphics_Sprite_WebSwing)
	%SXAR_InsertUnsortedData($1CD9BE, incbin, Palette_Unknown6)
	%SXAR_InsertUnsortedData($1CD9FD, incbin, Graphics_Sprite_CopyOfSpiderManPortrait)
	%SXAR_InsertUnsortedData($1CE399, incbin, Palette_CopyOfSpiderManPortrait)
	%SXAR_InsertUnsortedData($1CE3D5, incbin, Graphics_FGBG_FinalBoss)
	%SXAR_InsertUnsortedData($1DA32D, incbin, Palette_FGBG_SpiderMan3)
	%SXAR_InsertUnsortedData($1DA3F4, incbin, Palette_FGBG_FinalBoss)
	%SXAR_InsertUnsortedData($1DA4B7, incbin, Graphics_Sprite_GlobalSpiderManLevelSprites)
	%SXAR_InsertUnsortedData($1DA9CA, incbin, Graphics_Sprite_IntroLevelEnemies)
	%SXAR_InsertUnsortedData($1DBCFA, incbin, Palette_Sprite_IntroLevel)
	%SXAR_InsertUnsortedData($1DBDCD, incbin, Graphics_Sprite_SpiderManLevelEnemies)
	%SXAR_InsertUnsortedData($1DCFFC, incbin, Palette_Sprite_SpiderMan2)
	%SXAR_InsertUnsortedData($1DD0CE, incbin, Graphics_Sprite_FinalBoss)
	%SXAR_InsertUnsortedData($1DEB0B, incbin, Palette_Sprite_FinalBoss)
	%SXAR_InsertUnsortedData($1DEBD5, incbin, LevelData_SpiderMan1)
	%SXAR_InsertUnsortedData($1E9F65, incbin, LevelBG_SpiderMan1)
	%SXAR_InsertUnsortedData($1EC055, incbin, LevelData_SpiderMan2)
	%SXAR_InsertUnsortedData($1EE5CD, incbin, LevelBG_SpiderMan2)
	%SXAR_InsertUnsortedData($1F8327, incbin, LevelData_IntroLevel)
	%SXAR_InsertUnsortedData($1F95C9, incbin, LevelBG_IntroLevel)
	%SXAR_InsertUnsortedData($1F9C8B, incbin, LevelData_SpiderMan3)
	%SXAR_InsertUnsortedData($1FA62C, incbin, LevelBG_SpiderMan3)
	%SXAR_InsertUnsortedData($1FB2DA, incbin, LevelData_FinalBoss)

check bankcross on
	%InsertGarbageData($1FB62D, incbin, DATA_1FB62D.bin)
namespace off
%BANK_END(!BANK_1F)

endmacro
