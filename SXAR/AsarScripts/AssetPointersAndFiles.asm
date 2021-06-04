; Note: This file is used by the ExtractAssets.bat batch script to define where each file is, how large they are, and their filenames.

lorom
;!ROMVer = $0000						; Note: This is set within the batch script
!SXAR_U = $0001
!SXAR_E = $0002

org $008000
MainPointerTableStart:
	dl MainPointerTableStart,MainPointerTableEnd-MainPointerTableStart
	dl UncompressedGFXPointersStart,(UncompressedGFXPointersEnd-UncompressedGFXPointersStart)/$0C
	dl CompressedGFXPointersStart,(CompressedGFXPointersEnd-CompressedGFXPointersStart)/$0C
	dl TilemapPointersStart,(TilemapPointersEnd-TilemapPointersStart)/$0C
	dl LevelBackgroundPointersStart,(LevelBackgroundPointersEnd-LevelBackgroundPointersStart)/$0C
	dl LevelDataPointersStart,(LevelDataPointersEnd-LevelDataPointersStart)/$0C
	dl PalettePointersStart,(PalettePointersEnd-PalettePointersStart)/$0C
	dl GarbageDataPointersStart,(GarbageDataPointersEnd-GarbageDataPointersStart)/$0C
	dl MusicPointersStart,(MusicPointersEnd-MusicPointersStart)/$0C
	dl BRRPointersStart,(BRRPointersEnd-BRRPointersStart)/$0C
MainPointerTableEnd:

;--------------------------------------------------------------------

UncompressedGFXPointersStart:
	dl $039FF2,$03ABB2,GFX_Mode7_SplashScreenFont,GFX_Mode7_SplashScreenFontEnd
	dl $03ABB2,$03DE32,GFX_Mode7_AcclaimAndXMenLogos,GFX_Mode7_AcclaimAndXMenLogosEnd
	dl $0DEB71,$0EA7F1,GFX_Layer1_TitleScreenCharacters,GFX_Layer1_TitleScreenCharactersEnd
	dl $0EAE31,$0ECA31,GFX_Sprite_LargeFont,GFX_Sprite_LargeFontEnd
	dl $0ECA31,$0ECDB1,GFX_UnknownItalicFont,GFX_UnknownItalicFontEnd
	dl $0ECDB1,$0F8C31,GFX_Mode7_CopyOfAcclaimAndXMenLogos,GFX_Mode7_CopyOfAcclaimAndXMenLogosEnd
	dl $0F8C31,$0FAC31,GFX_Sprite_SpiderManLogo,GFX_Sprite_SpiderManLogoEnd
	dl $0FAC31,$0FB831,GFX_Sprite_SoftwareCreationsLogo,GFX_Sprite_SoftwareCreationsLogoEnd
	dl $1A8000,$1A9800,GFX_Sprite_Nastirh,GFX_Sprite_NastirhEnd
	dl $1A9800,$1AA800,GFX_Sprite_Shocker,GFX_Sprite_ShockerEnd
	dl $1AA800,$1ACF00,GFX_Sprite_Carnage,GFX_Sprite_CarnageEnd
	dl $1ACF00,$1ADF00,GFX_Sprite_Rhino,GFX_Sprite_RhinoEnd
	dl $1B8000,$1BE000,GFX_Player_SpiderMan,GFX_Player_SpiderManEnd
UncompressedGFXPointersEnd:

;--------------------------------------------------------------------

CompressedGFXPointersStart:
	dl $048100,$04C442,GFX_FGBG_SwimmingStormLevel,GFX_FGBG_SwimmingStormLevelEnd
	dl $04C442,$04E4FB,GFX_Sprite_SwimmingStormEnemies,GFX_Sprite_SwimmingStormEnemiesEnd
	dl $04E4FB,$04F76F,GFX_Player_SwimmingStorm,GFX_Player_SwimmingStormEnd
	dl $04F76F,$0597CC,GFX_Player_Wolverine,GFX_Player_WolverineEnd
	dl $0597CC,$05A2C1,GFX_Player_WolverineClaws,GFX_Player_WolverineClawsEnd
	dl $05A2C1,$05C59C,GFX_Sprite_CyclopsGlobalSpritesAndEnemies,GFX_Sprite_CyclopsGlobalSpritesAndEnemiesEnd
	dl $05C59C,$05EE90,GFX_Player_Cyclops,GFX_Player_CyclopsEnd
	dl $05EE90,$06AE04,GFX_FGBG_CyclopsLevel,GFX_FGBG_CyclopsLevelEnd
	dl $06AE04,$06C0FB,GFX_Sprite_WeirdAlienCaveCreature,GFX_Sprite_WeirdAlienCaveCreatureEnd
	dl $06C0FB,$0784CD,GFX_FGBG_MasterMold,GFX_FGBG_MasterMoldEnd
	dl $0784CD,$078EDF,GFX_Sprite_StormPortrait,GFX_Sprite_StormPortraitEnd
	dl $078EDF,$0797BB,GFX_Sprite_CyclopsPortrait,GFX_Sprite_CyclopsPortraitEnd
	dl $0797BB,$07A085,GFX_Sprite_WolverinePortrait,GFX_Sprite_WolverinePortraitEnd
	dl $07A085,$07AA4F,GFX_Sprite_GambitPortrait,GFX_Sprite_GambitPortraitEnd
	dl $07AA4F,$07B3E7,GFX_Sprite_SpiderManPortrait,GFX_Sprite_SpiderManPortraitEnd
	dl $07B3E7,$07D7F6,GFX_Sprite_WolverineLevel1EnemiesAndGlobalSprites,GFX_Sprite_WolverineLevel1EnemiesAndGlobalSpritesEnd
	dl $07D7F6,$07D9F8,GFX_Layer1_CharacterBioFont,GFX_Layer1_CharacterBioFontEnd
	dl $07D9F8,$07DBD2,GFX_Sprite_PausedText,GFX_Sprite_PausedTextEnd
	dl $07DBD2,$08A84E,GFX_FGBG_WolverineLevel,GFX_FGBG_WolverineLevelEnd
	dl $08A84E,$08B046,GFX_Sprite_MiniMasterMoldAndEnemyShip,GFX_Sprite_MiniMasterMoldAndEnemyShipEnd
	dl $08B046,$08CBB9,GFX_Sprite_Obnoxio,GFX_Sprite_ObnoxioEnd
	dl $08CBB9,$08D6DC,GFX_Sprite_XMenLogo,GFX_Sprite_XMenLogoEnd
	dl $08D6DC,$08F656,GFX_Layer1_ComicBookIntroCutscene,GFX_Layer1_ComicBookIntroCutsceneEnd
	dl $08F656,$09916B,GFX_Layer1_ComicBookEndingCutscene,GFX_Layer1_ComicBookEndingCutsceneEnd
	dl $09916B,$099C89,GFX_Sprite_ComicBookIntroCutscene,GFX_Sprite_ComicBookIntroCutsceneEnd
	dl $099C89,$09A70D,GFX_Sprite_ComicBookEndingCutscene,GFX_Sprite_ComicBookEndingCutsceneEnd
	dl $09A70D,$09B113,GFX_Sprite_Apocalypse,GFX_Sprite_ApocalypseEnd
	dl $09B113,$09D6A6,GFX_Sprite_WolverineLevel2EnemiesAndGlobalSprites,GFX_Sprite_WolverineLevel2EnemiesAndGlobalSpritesEnd
	dl $09D6A6,$0A8866,GFX_Layer1_ArcadeBriefingCutscene,GFX_Layer1_ArcadeBriefingCutsceneEnd
	dl $0A8866,$0A9714,GFX_FGBG_WolverineCyclopsFinalLevel,GFX_FGBG_WolverineCyclopsFinalLevelEnd
	dl $0A9714,$0A9754,GFX_Sprite_DrainBeam1,GFX_Sprite_DrainBeam1End
	dl $0A9754,$0A97A4,GFX_Sprite_DrainBeam2,GFX_Sprite_DrainBeam2End
	dl $0A97A4,$0AAB4F,GFX_Layer3_Water,GFX_Layer3_WaterEnd
	dl $158000,$158628,GFX_Layer3_GambitLevelSmallAndLargeFont,GFX_Layer3_GambitLevelSmallAndLargeFontEnd
	dl $158628,$158EFE,GFX_Sprite_CopyOfGambitPortrait,GFX_Sprite_CopyOfGambitPortraitEnd
	dl $158EFE,$159852,GFX_Sprite_CopyOfStormPortrait,GFX_Sprite_CopyOfStormPortraitEnd
	dl $159852,$159DD8,GFX_Sprite_KingCard,GFX_Sprite_KingCardEnd
	dl $159DD8,$159E3E,GFX_Layer2_KingCardBG,GFX_Layer2_KingCardBGEnd
	dl $159E3E,$15A208,GFX_Layer2_DescendingWall,GFX_Layer2_DescendingWallEnd
	dl $15A208,$15C112,GFX_Sprite_WalkingStormEnemiesAndGlobalSprites,GFX_Sprite_WalkingStormEnemiesAndGlobalSpritesEnd
	dl $15C112,$15D1E0,GFX_Sprite_GambitLevelGlobalSprites_BlackQueen,GFX_Sprite_GambitLevelGlobalSprites_BlackQueenEnd
	dl $15D1E0,$15E15D,GFX_FGBG_FinalGambitLevel,GFX_FGBG_FinalGambitLevelEnd
	dl $15E15D,$1697F6,GFX_FGBG_GambitLevel,GFX_FGBG_GambitLevelEnd
	dl $1697F6,$169F62,GFX_Layer2_GiantSpikeBall,GFX_Layer2_GiantSpikeBallEnd
	dl $169F62,$16AD13,GFX_FG_BlackQueenThrone,GFX_FG_BlackQueenThroneEnd
	dl $16B230,$16D524,GFX_Player_Gambit,GFX_Player_GambitEnd
	dl $16D524,$16F52E,GFX_Player_WalkingStorm,GFX_Player_WalkingStormEnd
	dl $16F52E,$17947D,GFX_Sprite_GambitLevelEnemies,GFX_Sprite_GambitLevelEnemiesEnd
	dl $1C8000,$1CCDB2,GFX_FGBG_City,GFX_FGBG_CityEnd
	dl $1CCF59,$1CD61C,GFX_Layer3_SmallAndLargeFont,GFX_Layer3_SmallAndLargeFontEnd
	dl $1CD64C,$1CD9BE,GFX_Sprite_WebSwing,GFX_Sprite_WebSwingEnd
	dl $1CD9FD,$1CE399,GFX_Sprite_CopyOfSpiderManPortrait,GFX_Sprite_CopyOfSpiderManPortraitEnd
	dl $1CE3D5,$1DA32D,GFX_FGBG_FinalBoss,GFX_FGBG_FinalBossEnd
	dl $1DA4B7,$1DA9CA,GFX_Sprite_GlobalSpiderManLevelSprites,GFX_Sprite_GlobalSpiderManLevelSpritesEnd
	dl $1DA9CA,$1DBCFA,GFX_Sprite_IntroLevelEnemies,GFX_Sprite_IntroLevelEnemiesEnd
	dl $1DBDCD,$1DCFFC,GFX_Sprite_SpiderManLevelEnemies,GFX_Sprite_SpiderManLevelEnemiesEnd
	dl $1DD0CE,$1DEB0B,GFX_Sprite_FinalBoss,GFX_Sprite_FinalBossEnd
CompressedGFXPointersEnd:

;--------------------------------------------------------------------

TilemapPointersStart:
	dl $0AAB4F,$0AAC3C,TM_Unknown1,TM_Unknown1End
	dl $0AAC3C,$0AAC74,TM_Unknown2,TM_Unknown2End
	dl $0AAC74,$0AB1D7,TM_IntroComicBook,TM_IntroComicBookEnd
	dl $0AB1D7,$0AB692,TM_ComicBookEndingCutscene,TM_ComicBookEndingCutsceneEnd
	dl $0AB692,$0ABB7C,TM_Layer2_ArcadeBriefingCutscene1,TM_Layer2_ArcadeBriefingCutscene1End
	dl $0ABB7C,$0AC073,TM_Layer2_ArcadeBriefingCutscene2,TM_Layer2_ArcadeBriefingCutscene2End
	dl $0AC073,$0AC0FC,TM_Layer2_TopRowsOfArcadeBriefingCutscene,TM_Layer2_TopRowsOfArcadeBriefingCutsceneEnd
	dl $0AC0FC,$0AEADE,TM_Layer3_Water,TM_Layer3_WaterEnd
	dl $0B8726,$0B8735,TM_Unknown3,TM_Unknown3End
	dl $0EA7F1,$0EAE31,TM_Layer1_TitleScreenCharacters,TM_Layer1_TitleScreenCharactersEnd
TilemapPointersEnd:

;--------------------------------------------------------------------

LevelBackgroundPointersStart:
	dl $0AEADE,$0AFD10,TM_Storm1,TM_Storm1End
	dl $0AFD10,$0B8726,TM_Cyclops1,TM_Cyclops1End
	dl $0CEE08,$0CF5C5,TM_Wolverine1,TM_Wolverine1End
	dl $0DA829,$0DB5E6,TM_Wolverine2,TM_Wolverine2End
	dl $0DC44F,$0DCE31,TM_Cyclops3,TM_Cyclops3End
	dl $17C416,$17D1DE,TM_Gambit2,TM_Gambit2End
	dl $17D96A,$17E11F,TM_Gambit3,TM_Gambit3End
	dl $1E9F65,$1EC055,TM_SpiderMan1,TM_SpiderMan1End
	dl $1EE5CD,$1F8327,TM_SpiderMan2,TM_SpiderMan2End
	dl $1F95C9,$1F9C8B,TM_IntroLevel,TM_IntroLevelEnd
	dl $1FA62C,$1FB2DA,TM_SpiderMan3,TM_SpiderMan3End
LevelBackgroundPointersEnd:

;--------------------------------------------------------------------

LevelDataPointersStart:
	dl $0B8735,$0BBD02,LD_Storm1,LD_Storm1End
	dl $0BBD02,$0BF409,LD_Storm2,LD_Storm2End
	dl $0BF409,$0CC118,LD_Cyclops1,LD_Cyclops1End
	dl $0CC118,$0CC331,LD_Cyclops2Boss,LD_Cyclops2BossEnd
	dl $0CC331,$0CEE08,LD_Wolverine1,LD_Wolverine1End
	dl $0CF5C5,$0D8AF8,LD_Cyclops2,LD_Cyclops2End
	dl $0D8AF8,$0DA829,LD_Wolverine2,LD_Wolverine2End
	dl $0DB5E6,$0DBD07,LD_Wolverine3,LD_Wolverine3End
	dl $0DBD07,$0DC44F,LD_Cyclops3,LD_Cyclops3End
	dl $17947D,$17B249,LD_Gambit1,LD_Gambit1End
	dl $17B249,$17C416,LD_Gambit2,LD_Gambit2End
	dl $17D1DE,$17D96A,LD_Gambit3,LD_Gambit3End
	dl $17E11F,$17E840,LD_Storm3,LD_Storm3End
	dl $1DEBD5,$1E9F65,LD_SpiderMan1,LD_SpiderMan1End
	dl $1EC055,$1EE5CD,LD_SpiderMan2,LD_SpiderMan2End
	dl $1F8327,$1F95C9,LD_IntroLevel,LD_IntroLevelEnd
	dl $1F9C8B,$1FA62C,LD_SpiderMan3,LD_SpiderMan3End
	dl $1FB2DA,$1FB62D,LD_FinalBoss,LD_FinalBossEnd
LevelDataPointersEnd:

;--------------------------------------------------------------------

PalettePointersStart:
	dl $048000,$048100,PAL_FGBG_Wolverine2,PAL_FGBG_Wolverine2End
	dl $0DCE31,$0DCF31,PAL_Unknown1,PAL_Unknown1End
	dl $0DCF31,$0DD131,PAL_Unknown2,PAL_Unknown2End
	dl $0DD131,$0DD331,PAL_Unknown3,PAL_Unknown3End
	dl $0DD331,$0DD351,PAL_Unknown4,PAL_Unknown4End
	dl $0DD351,$0DD3B1,PAL_Unknown5,PAL_Unknown5End
	dl $0DD3B1,$0DD5B1,PAL_FGBGSprite_Storm1,PAL_FGBGSprite_Storm1End
	dl $0DD5B1,$0DD7B1,PAL_SplashScreenAndSpiderManLogo,PAL_SplashScreenAndSpiderManLogoEnd
	dl $0DD7B1,$0DD8B1,PAL_Sprite_Cyclops1,PAL_Sprite_Cyclops1End
	dl $0DD8B1,$0DD9B1,PAL_FGBG_Cyclops1,PAL_FGBG_Cyclops1End
	dl $0DD9B1,$0DDAB1,PAL_FGBG_Cyclops2Boss,PAL_FGBG_Cyclops2BossEnd
	dl $0DDAB1,$0DDBB1,PAL_StormPortrait,PAL_StormPortraitEnd
	dl $0DDBB1,$0DDCB1,PAL_CyclopsPortrait,PAL_CyclopsPortraitEnd
	dl $0DDCB1,$0DDDB1,PAL_WolverinePortrait,PAL_WolverinePortraitEnd
	dl $0DDDB1,$0DDEB1,PAL_GambitPortrait,PAL_GambitPortraitEnd
	dl $0DDEB1,$0DDFB1,PAL_SpiderManPortrait,PAL_SpiderManPortraitEnd
	dl $0DDFB1,$0DE0B1,PAL_Credits,PAL_CreditsEnd
	dl $0DE0B1,$0DE1B1,PAL_Sprite_Wolverine1,PAL_Sprite_Wolverine1End
	dl $0DE1B1,$0DE1F1,PAL_Sprite_CharacterSelect,PAL_Sprite_CharacterSelectEnd
	dl $0DE1F1,$0DE2F1,PAL_FGBG_Wolverine1,PAL_FGBG_Wolverine1End
	dl $0DE2F1,$0DE311,PAL_WellDoneText,PAL_WellDoneTextEnd
	dl $0DE311,$0DE411,PAL_TitleScreenCharacters,PAL_TitleScreenCharactersEnd
	dl $0DE411,$0DE431,PAL_BG_Cyclops2,PAL_BG_Cyclops2End
	dl $0DE431,$0DE451,PAL_TitleScreenXMenLogo,PAL_TitleScreenXMenLogoEnd
	dl $0DE451,$0DE551,PAL_Layer1_IntroComicBook,PAL_Layer1_IntroComicBookEnd
	dl $0DE551,$0DE651,PAL_Layer1_EndingComicBook,PAL_Layer1_EndingComicBookEnd
	dl $0DE651,$0DE751,PAL_Sprite_IntroComicBook,PAL_Sprite_IntroComicBookEnd
	dl $0DE751,$0DE851,PAL_Sprite_Wolverine2,PAL_Sprite_Wolverine2End
	dl $0DE851,$0DE951,PAL_Layer1_ArcadeBriefingCutscene1,PAL_Layer1_ArcadeBriefingCutscene1End
	dl $0DE951,$0DEA51,PAL_Layer1_ArcadeBriefingCutscene2,PAL_Layer1_ArcadeBriefingCutscene2End
	dl $0DEA51,$0DEB51,PAL_FGBG_Cyclops3,PAL_FGBG_Cyclops3End
	dl $0DEB51,$0DEB71,PAL_Sprite_DrainBeam,PAL_Sprite_DrainBeamEnd
	dl $16AD13,$16AE06,PAL_FGBG_Gambit1,PAL_FGBG_Gambit1End
	dl $16AE06,$16AEEE,PAL_FGBG_Gambit2,PAL_FGBG_Gambit2End
	dl $16AEEE,$16AFD6,PAL_Sprite_Gambit1,PAL_Sprite_Gambit1End
	dl $16AFD6,$16B029,PAL_CopyOfGambitPortrait,PAL_CopyOfGambitPortraitEnd
	dl $16B029,$16B081,PAL_CopyOfStormPortrait,PAL_CopyOfStormPortraitEnd
	dl $16B081,$16B14E,PAL_Sprite_Storm3,PAL_Sprite_Storm3End
	dl $16B14E,$16B230,PAL_FGBG_FinalGambit,PAL_FGBG_FinalGambitEnd
	dl $1CCDB2,$1CCE81,PAL_FGBG_SpiderMan1,PAL_FGBG_SpiderMan1End
	dl $1CCE81,$1CCF59,PAL_FGBG_IntroLevel,PAL_FGBG_IntroLevelEnd
	dl $1CD61C,$1CD62F,PAL_GetReadySpiderMan,PAL_GetReadySpiderManEnd
	dl $1CD62F,$1CD64C,PAL_SpiderMan,PAL_SpiderManEnd
	dl $1CD9BE,$1CD9FD,PAL_Unknown6,PAL_Unknown6End
	dl $1CE399,$1CE3D5,PAL_CopyOfSpiderManPortrait,PAL_CopyOfSpiderManPortraitEnd
	dl $1DA32D,$1DA3F4,PAL_FGBG_SpiderMan3,PAL_FGBG_SpiderMan3End
	dl $1DA3F4,$1DA4B7,PAL_FGBG_FinalBoss,PAL_FGBG_FinalBossEnd
	dl $1DBCFA,$1DBDCD,PAL_Sprite_IntroLevel,PAL_Sprite_IntroLevelEnd
	dl $1DCFFC,$1DD0CE,PAL_Sprite_SpiderMan2,PAL_Sprite_SpiderMan2End
	dl $1DEB0B,$1DEBD5,PAL_Sprite_FinalBoss,PAL_Sprite_FinalBossEnd
PalettePointersEnd:

;--------------------------------------------------------------------

GarbageDataPointersStart:
	dl $00FF2A,$00FFC0,DATA_00FF2A,DATA_00FF2AEnd
	dl $01FEE2,$028000,DATA_01FEE2,DATA_01FEE2End
	dl $02A7C0,$038000,DATA_02A7C0,DATA_02A7C0End
	dl $03DE32,$048000,DATA_03DE32,DATA_03DE32End
	dl $129A3D,$138000,DATA_129A3D,DATA_129A3DEnd
	dl $13DC37,$148000,DATA_13DC37,DATA_13DC37End
	dl $14CCA0,$158000,DATA_14CCA0,DATA_14CCA0End
	dl $17E840,$188000,DATA_17E840,DATA_17E840End
	dl $18DE8D,$198000,DATA_18DE8D,DATA_18DE8DEnd
	dl $19C886,$1A8000,DATA_19C886,DATA_19C886End
	dl $1ADF00,$1B8000,DATA_1ADF00,DATA_1ADF00End
	dl $1BE000,$1C8000,DATA_1BE000,DATA_1BE000End
	dl $1FB62D,$208000,DATA_1FB62D,DATA_1FB62DEnd
GarbageDataPointersEnd:

;--------------------------------------------------------------------

MusicPointersStart:
	dl $118EF5,$1198F8,Music_CopyOfBriefing,Music_CopyOfBriefingEnd
	dl $1198F8,$11AB10,Music_SpiderManLevel,Music_SpiderManLevelEnd
	dl $11AB10,$11BAE6,Music_StormLevel,Music_StormLevelEnd
	dl $11BAE6,$11D0E5,Music_CyclopsLevel,Music_CyclopsLevelEnd
	dl $11D0E5,$11D9BE,Music_TitleScreen,Music_TitleScreenEnd
	dl $11D9BE,$11E9C6,Music_WolverineLevel,Music_WolverineLevelEnd
	dl $11E9C6,$11F6D8,Music_GambitLevel,Music_GambitLevelEnd
	dl $11F6D8,$11FE5F,Music_HighScore,Music_HighScoreEnd
	dl $11FE5F,$1284D6,Music_Briefing,Music_BriefingEnd
	dl $1284D6,$12914B,Music_Ending,Music_EndingEnd
	dl $12914B,$129761,Music_FinalLevel,Music_FinalLevelEnd
	dl $129761,$129A3D,Music_GameOver,Music_GameOverEnd
MusicPointersEnd:

;--------------------------------------------------------------------

BRRPointersStart:
	dl $0FC73D,$118EF5,SPCSampleBank,SPCSampleBankEnd
BRRPointersEnd:

;--------------------------------------------------------------------

GFX_Mode7_SplashScreenFont:
	db "GFX_Mode7_SplashScreenFont.bin"
GFX_Mode7_SplashScreenFontEnd:
GFX_Mode7_AcclaimAndXMenLogos:
	db "GFX_Mode7_AcclaimAndXMenLogos.bin"
GFX_Mode7_AcclaimAndXMenLogosEnd:
GFX_Layer1_TitleScreenCharacters:
	db "GFX_Layer1_TitleScreenCharacters.bin"
GFX_Layer1_TitleScreenCharactersEnd:
GFX_Sprite_LargeFont:
	db "GFX_Sprite_LargeFont.bin"
GFX_Sprite_LargeFontEnd:
GFX_UnknownItalicFont:
	db "GFX_UnknownItalicFont.bin"
GFX_UnknownItalicFontEnd:
GFX_Mode7_CopyOfAcclaimAndXMenLogos:
	db "GFX_Mode7_CopyOfAcclaimAndXMenLogos.bin"
GFX_Mode7_CopyOfAcclaimAndXMenLogosEnd:
GFX_Sprite_SpiderManLogo:
	db "GFX_Sprite_SpiderManLogo.bin"
GFX_Sprite_SpiderManLogoEnd:
GFX_Sprite_SoftwareCreationsLogo:
	db "GFX_Sprite_SoftwareCreationsLogo.bin"
GFX_Sprite_SoftwareCreationsLogoEnd:
GFX_Sprite_Nastirh:
	db "GFX_Sprite_Nastirh.bin"
GFX_Sprite_NastirhEnd:
GFX_Sprite_Shocker:
	db "GFX_Sprite_Shocker.bin"
GFX_Sprite_ShockerEnd:
GFX_Sprite_Carnage:
	db "GFX_Sprite_Carnage.bin"
GFX_Sprite_CarnageEnd:
GFX_Sprite_Rhino:
	db "GFX_Sprite_Rhino.bin"
GFX_Sprite_RhinoEnd:
GFX_Player_SpiderMan:
	db "GFX_Player_SpiderMan.bin"
GFX_Player_SpiderManEnd:

;--------------------------------------------------------------------

GFX_FGBG_SwimmingStormLevel:
	db "GFX_FGBG_SwimmingStormLevel.bin"
GFX_FGBG_SwimmingStormLevelEnd:
GFX_Sprite_SwimmingStormEnemies:
	db "GFX_Sprite_SwimmingStormEnemies.bin"
GFX_Sprite_SwimmingStormEnemiesEnd:
GFX_Player_SwimmingStorm:
	db "GFX_Player_SwimmingStorm.bin"
GFX_Player_SwimmingStormEnd:
GFX_Player_Wolverine:
	db "GFX_Player_Wolverine.bin"
GFX_Player_WolverineEnd:
GFX_Player_WolverineClaws:
	db "GFX_Player_WolverineClaws.bin"
GFX_Player_WolverineClawsEnd:
GFX_Sprite_CyclopsGlobalSpritesAndEnemies:
	db "GFX_Sprite_CyclopsGlobalSpritesAndEnemies.bin"
GFX_Sprite_CyclopsGlobalSpritesAndEnemiesEnd:
GFX_Player_Cyclops:
	db "GFX_Player_Cyclops.bin"
GFX_Player_CyclopsEnd:
GFX_FGBG_CyclopsLevel:
	db "GFX_FGBG_CyclopsLevel.bin"
GFX_FGBG_CyclopsLevelEnd:
GFX_Sprite_WeirdAlienCaveCreature:
	db "GFX_Sprite_WeirdAlienCaveCreature.bin"
GFX_Sprite_WeirdAlienCaveCreatureEnd:
GFX_FGBG_MasterMold:
	db "GFX_FGBG_MasterMold.bin"
GFX_FGBG_MasterMoldEnd:
GFX_Sprite_StormPortrait:
	db "GFX_Sprite_StormPortrait.bin"
GFX_Sprite_StormPortraitEnd:
GFX_Sprite_CyclopsPortrait:
	db "GFX_Sprite_CyclopsPortrait.bin"
GFX_Sprite_CyclopsPortraitEnd:
GFX_Sprite_WolverinePortrait:
	db "GFX_Sprite_WolverinePortrait.bin"
GFX_Sprite_WolverinePortraitEnd:
GFX_Sprite_GambitPortrait:
	db "GFX_Sprite_GambitPortrait.bin"
GFX_Sprite_GambitPortraitEnd:
GFX_Sprite_SpiderManPortrait:
	db "GFX_Sprite_SpiderManPortrait.bin"
GFX_Sprite_SpiderManPortraitEnd:
GFX_Sprite_WolverineLevel1EnemiesAndGlobalSprites:
	db "GFX_Sprite_WolverineLevel1EnemiesAndGlobalSprites.bin"
GFX_Sprite_WolverineLevel1EnemiesAndGlobalSpritesEnd:
GFX_Layer1_CharacterBioFont:
	db "GFX_Layer1_CharacterBioFont.bin"
GFX_Layer1_CharacterBioFontEnd:
GFX_Sprite_PausedText:
	db "GFX_Sprite_PausedText.bin"
GFX_Sprite_PausedTextEnd:
GFX_FGBG_WolverineLevel:
	db "GFX_FGBG_WolverineLevel.bin"
GFX_FGBG_WolverineLevelEnd:
GFX_Sprite_MiniMasterMoldAndEnemyShip:
	db "GFX_Sprite_MiniMasterMoldAndEnemyShip.bin"
GFX_Sprite_MiniMasterMoldAndEnemyShipEnd:
GFX_Sprite_Obnoxio:
	db "GFX_Sprite_Obnoxio.bin"
GFX_Sprite_ObnoxioEnd:
GFX_Sprite_XMenLogo:
	db "GFX_Sprite_XMenLogo.bin"
GFX_Sprite_XMenLogoEnd:
GFX_Layer1_ComicBookIntroCutscene:
	db "GFX_Layer1_ComicBookIntroCutscene.bin"
GFX_Layer1_ComicBookIntroCutsceneEnd:
GFX_Layer1_ComicBookEndingCutscene:
	db "GFX_Layer1_ComicBookEndingCutscene.bin"
GFX_Layer1_ComicBookEndingCutsceneEnd:
GFX_Sprite_ComicBookIntroCutscene:
	db "GFX_Sprite_ComicBookIntroCutscene.bin"
GFX_Sprite_ComicBookIntroCutsceneEnd:
GFX_Sprite_ComicBookEndingCutscene:
	db "GFX_Sprite_ComicBookEndingCutscene.bin"
GFX_Sprite_ComicBookEndingCutsceneEnd:
GFX_Sprite_Apocalypse:
	db "GFX_Sprite_Apocalypse.bin"
GFX_Sprite_ApocalypseEnd:
GFX_Sprite_WolverineLevel2EnemiesAndGlobalSprites:
	db "GFX_Sprite_WolverineLevel2EnemiesAndGlobalSprites.bin"
GFX_Sprite_WolverineLevel2EnemiesAndGlobalSpritesEnd:
GFX_Layer1_ArcadeBriefingCutscene:
	db "GFX_Layer1_ArcadeBriefingCutscene.bin"
GFX_Layer1_ArcadeBriefingCutsceneEnd:
GFX_FGBG_WolverineCyclopsFinalLevel:
	db "GFX_FGBG_WolverineCyclopsFinalLevel.bin"
GFX_FGBG_WolverineCyclopsFinalLevelEnd:
GFX_Sprite_DrainBeam1:
	db "GFX_Sprite_DrainBeam1.bin"
GFX_Sprite_DrainBeam1End:
GFX_Sprite_DrainBeam2:
	db "GFX_Sprite_DrainBeam2.bin"
GFX_Sprite_DrainBeam2End:
GFX_Layer3_Water:
	db "GFX_Layer3_Water.bin"
GFX_Layer3_WaterEnd:
GFX_Layer3_GambitLevelSmallAndLargeFont:
	db "GFX_Layer3_GambitLevelSmallAndLargeFont.bin"
GFX_Layer3_GambitLevelSmallAndLargeFontEnd:
GFX_Sprite_CopyOfGambitPortrait:
	db "GFX_Sprite_CopyOfGambitPortrait.bin"
GFX_Sprite_CopyOfGambitPortraitEnd:
GFX_Sprite_CopyOfStormPortrait:
	db "GFX_Sprite_CopyOfStormPortrait.bin"
GFX_Sprite_CopyOfStormPortraitEnd:
GFX_Sprite_KingCard:
	db "GFX_Sprite_KingCard.bin"
GFX_Sprite_KingCardEnd:
GFX_Layer2_KingCardBG:
	db "GFX_Layer2_KingCardBG.bin"
GFX_Layer2_KingCardBGEnd:
GFX_Layer2_DescendingWall:
	db "GFX_Layer2_DescendingWall.bin"
GFX_Layer2_DescendingWallEnd:
GFX_Sprite_WalkingStormEnemiesAndGlobalSprites:
	db "GFX_Sprite_WalkingStormEnemiesAndGlobalSprites.bin"
GFX_Sprite_WalkingStormEnemiesAndGlobalSpritesEnd:
GFX_Sprite_GambitLevelGlobalSprites_BlackQueen:
	db "GFX_Sprite_GambitLevelGlobalSprites_BlackQueen.bin"
GFX_Sprite_GambitLevelGlobalSprites_BlackQueenEnd:
GFX_FGBG_FinalGambitLevel:
	db "GFX_FGBG_FinalGambitLevel.bin"
GFX_FGBG_FinalGambitLevelEnd:
GFX_FGBG_GambitLevel:
	db "GFX_FGBG_GambitLevel.bin"
GFX_FGBG_GambitLevelEnd:
GFX_Layer2_GiantSpikeBall:
	db "GFX_Layer2_GiantSpikeBall.bin"
GFX_Layer2_GiantSpikeBallEnd:
GFX_FG_BlackQueenThrone:
	db "GFX_FG_BlackQueenThrone.bin"
GFX_FG_BlackQueenThroneEnd:
GFX_Player_Gambit:
	db "GFX_Player_Gambit.bin"
GFX_Player_GambitEnd:
GFX_Player_WalkingStorm:
	db "GFX_Player_WalkingStorm.bin"
GFX_Player_WalkingStormEnd:
GFX_Sprite_GambitLevelEnemies:
	db "GFX_Sprite_GambitLevelEnemies.bin"
GFX_Sprite_GambitLevelEnemiesEnd:
GFX_FGBG_City:
	db "GFX_FGBG_City.bin"
GFX_FGBG_CityEnd:
GFX_Layer3_SmallAndLargeFont:
	db "GFX_Layer3_SmallAndLargeFont.bin"
GFX_Layer3_SmallAndLargeFontEnd:
GFX_Sprite_WebSwing:
	db "GFX_Sprite_WebSwing.bin"
GFX_Sprite_WebSwingEnd:
GFX_Sprite_CopyOfSpiderManPortrait:
	db "GFX_Sprite_CopyOfSpiderManPortrait.bin"
GFX_Sprite_CopyOfSpiderManPortraitEnd:
GFX_FGBG_FinalBoss:
	db "GFX_FGBG_FinalBoss.bin"
GFX_FGBG_FinalBossEnd:
GFX_Sprite_GlobalSpiderManLevelSprites:
	db "GFX_Sprite_GlobalSpiderManLevelSprites.bin"
GFX_Sprite_GlobalSpiderManLevelSpritesEnd:
GFX_Sprite_IntroLevelEnemies:
	db "GFX_Sprite_IntroLevelEnemies.bin"
GFX_Sprite_IntroLevelEnemiesEnd:
GFX_Sprite_SpiderManLevelEnemies:
	db "GFX_Sprite_SpiderManLevelEnemies.bin"
GFX_Sprite_SpiderManLevelEnemiesEnd:
GFX_Sprite_FinalBoss:
	db "GFX_Sprite_FinalBoss.bin"
GFX_Sprite_FinalBossEnd:

;--------------------------------------------------------------------

TM_Unknown1:
	db "Unknown1.bin"
TM_Unknown1End:
TM_Unknown2:
	db "Unknown2.bin"
TM_Unknown2End:
TM_IntroComicBook:
	db "IntroComicBook.bin"
TM_IntroComicBookEnd:
TM_ComicBookEndingCutscene:
	db "ComicBookEndingCutscene.bin"
TM_ComicBookEndingCutsceneEnd:
TM_Layer2_ArcadeBriefingCutscene1:
	db "Layer2_ArcadeBriefingCutscene1.bin"
TM_Layer2_ArcadeBriefingCutscene1End:
TM_Layer2_ArcadeBriefingCutscene2:
	db "Layer2_ArcadeBriefingCutscene2.bin"
TM_Layer2_ArcadeBriefingCutscene2End:
TM_Layer2_TopRowsOfArcadeBriefingCutscene:
	db "Layer2_TopRowsOfArcadeBriefingCutscene.bin"
TM_Layer2_TopRowsOfArcadeBriefingCutsceneEnd:
TM_Layer3_Water:
	db "Layer3_Water.bin"
TM_Layer3_WaterEnd:
TM_Unknown3:
	db "Unknown3.bin"
TM_Unknown3End:
TM_Layer1_TitleScreenCharacters:
	db "Layer1_TitleScreenCharacters.bin"
TM_Layer1_TitleScreenCharactersEnd:

;--------------------------------------------------------------------

TM_Storm1:
	db "Storm1.bin"
TM_Storm1End:
TM_Cyclops1:
	db "Cyclops1.bin"
TM_Cyclops1End:
TM_Wolverine1:
	db "Wolverine1.bin"
TM_Wolverine1End:
TM_Wolverine2:
	db "Wolverine2.bin"
TM_Wolverine2End:
TM_Cyclops3:
	db "Cyclops3.bin"
TM_Cyclops3End:
TM_Gambit2:
	db "Gambit2.bin"
TM_Gambit2End:
TM_Gambit3:
	db "Gambit3.bin"
TM_Gambit3End:
TM_SpiderMan1:
	db "SpiderMan1.bin"
TM_SpiderMan1End:
TM_SpiderMan2:
	db "SpiderMan2.bin"
TM_SpiderMan2End:
TM_IntroLevel:
	db "IntroLevel.bin"
TM_IntroLevelEnd:
TM_SpiderMan3:
	db "SpiderMan3.bin"
TM_SpiderMan3End:

;--------------------------------------------------------------------

LD_Storm1:
	db "Storm1.bin"
LD_Storm1End:
LD_Storm2:
	db "Storm2.bin"
LD_Storm2End:
LD_Cyclops1:
	db "Cyclops1.bin"
LD_Cyclops1End:
LD_Cyclops2Boss:
	db "Cyclops2Boss.bin"
LD_Cyclops2BossEnd:
LD_Wolverine1:
	db "Wolverine1.bin"
LD_Wolverine1End:
LD_Cyclops2:
	db "Cyclops2.bin"
LD_Cyclops2End:
LD_Wolverine2:
	db "Wolverine2.bin"
LD_Wolverine2End:
LD_Wolverine3:
	db "Wolverine3.bin"
LD_Wolverine3End:
LD_Cyclops3:
	db "Cyclops3.bin"
LD_Cyclops3End:
LD_Gambit1:
	db "Gambit1.bin"
LD_Gambit1End:
LD_Gambit2:
	db "Gambit2.bin"
LD_Gambit2End:
LD_Gambit3:
	db "Gambit3.bin"
LD_Gambit3End:
LD_Storm3:
	db "Storm3.bin"
LD_Storm3End:
LD_SpiderMan1:
	db "SpiderMan1.bin"
LD_SpiderMan1End:
LD_SpiderMan2:
	db "SpiderMan2.bin"
LD_SpiderMan2End:
LD_IntroLevel:
	db "IntroLevel.bin"
LD_IntroLevelEnd:
LD_SpiderMan3:
	db "SpiderMan3.bin"
LD_SpiderMan3End:
LD_FinalBoss:
	db "FinalBoss.bin"
LD_FinalBossEnd:

;--------------------------------------------------------------------

PAL_FGBG_Wolverine2:
	db "FGBG_Wolverine2.bin"
PAL_FGBG_Wolverine2End:
PAL_Unknown1:
	db "Unknown1.bin"
PAL_Unknown1End:
PAL_Unknown2:
	db "Unknown2.bin"
PAL_Unknown2End:
PAL_Unknown3:
	db "Unknown3.bin"
PAL_Unknown3End:
PAL_Unknown4:
	db "Unknown4.bin"
PAL_Unknown4End:
PAL_Unknown5:
	db "Unknown5.bin"
PAL_Unknown5End:
PAL_FGBGSprite_Storm1:
	db "FGBGSprite_Storm1.bin"
PAL_FGBGSprite_Storm1End:
PAL_SplashScreenAndSpiderManLogo:
	db "SplashScreenAndSpiderManLogo.bin"
PAL_SplashScreenAndSpiderManLogoEnd:
PAL_Sprite_Cyclops1:
	db "Sprite_Cyclops1.bin"
PAL_Sprite_Cyclops1End:
PAL_FGBG_Cyclops1:
	db "FGBG_Cyclops1.bin"
PAL_FGBG_Cyclops1End:
PAL_FGBG_Cyclops2Boss:
	db "FGBG_Cyclops2Boss.bin"
PAL_FGBG_Cyclops2BossEnd:
PAL_StormPortrait:
	db "StormPortrait.bin"
PAL_StormPortraitEnd:
PAL_CyclopsPortrait:
	db "CyclopsPortrait.bin"
PAL_CyclopsPortraitEnd:
PAL_WolverinePortrait:
	db "WolverinePortrait.bin"
PAL_WolverinePortraitEnd:
PAL_GambitPortrait:
	db "GambitPortrait.bin"
PAL_GambitPortraitEnd:
PAL_SpiderManPortrait:
	db "SpiderManPortrait.bin"
PAL_SpiderManPortraitEnd:
PAL_Credits:
	db "Credits.bin"
PAL_CreditsEnd:
PAL_Sprite_Wolverine1:
	db "Sprite_Wolverine1.bin"
PAL_Sprite_Wolverine1End:
PAL_Sprite_CharacterSelect:
	db "Sprite_CharacterSelect.bin"
PAL_Sprite_CharacterSelectEnd:
PAL_FGBG_Wolverine1:
	db "FGBG_Wolverine1.bin"
PAL_FGBG_Wolverine1End:
PAL_WellDoneText:
	db "WellDoneText.bin"
PAL_WellDoneTextEnd:
PAL_TitleScreenCharacters:
	db "TitleScreenCharacters.bin"
PAL_TitleScreenCharactersEnd:
PAL_BG_Cyclops2:
	db "BG_Cyclops2.bin"
PAL_BG_Cyclops2End:
PAL_TitleScreenXMenLogo:
	db "TitleScreenXMenLogo.bin"
PAL_TitleScreenXMenLogoEnd:
PAL_Layer1_IntroComicBook:
	db "Layer1_IntroComicBook.bin"
PAL_Layer1_IntroComicBookEnd:
PAL_Layer1_EndingComicBook:
	db "Layer1_EndingComicBook.bin"
PAL_Layer1_EndingComicBookEnd:
PAL_Sprite_IntroComicBook:
	db "Sprite_IntroComicBook.bin"
PAL_Sprite_IntroComicBookEnd:
PAL_Sprite_Wolverine2:
	db "Sprite_Wolverine2.bin"
PAL_Sprite_Wolverine2End:
PAL_Layer1_ArcadeBriefingCutscene1:
	db "Layer1_ArcadeBriefingCutscene1.bin"
PAL_Layer1_ArcadeBriefingCutscene1End:
PAL_Layer1_ArcadeBriefingCutscene2:
	db "Layer1_ArcadeBriefingCutscene2.bin"
PAL_Layer1_ArcadeBriefingCutscene2End:
PAL_FGBG_Cyclops3:
	db "FGBG_Cyclops3.bin"
PAL_FGBG_Cyclops3End:
PAL_Sprite_DrainBeam:
	db "Sprite_DrainBeam.bin"
PAL_Sprite_DrainBeamEnd:
PAL_FGBG_Gambit1:
	db "FGBG_Gambit1.bin"
PAL_FGBG_Gambit1End:
PAL_FGBG_Gambit2:
	db "FGBG_Gambit2.bin"
PAL_FGBG_Gambit2End:
PAL_Sprite_Gambit1:
	db "Sprite_Gambit1.bin"
PAL_Sprite_Gambit1End:
PAL_CopyOfGambitPortrait:
	db "CopyOfGambitPortrait.bin"
PAL_CopyOfGambitPortraitEnd:
PAL_CopyOfStormPortrait:
	db "CopyOfStormPortrait.bin"
PAL_CopyOfStormPortraitEnd:
PAL_Sprite_Storm3:
	db "Sprite_Storm3.bin"
PAL_Sprite_Storm3End:
PAL_FGBG_FinalGambit:
	db "FGBG_FinalGambit.bin"
PAL_FGBG_FinalGambitEnd:
PAL_FGBG_SpiderMan1:
	db "FGBG_SpiderMan1.bin"
PAL_FGBG_SpiderMan1End:
PAL_FGBG_IntroLevel:
	db "FGBG_IntroLevel.bin"
PAL_FGBG_IntroLevelEnd:
PAL_GetReadySpiderMan:
	db "GetReadySpiderMan.bin"
PAL_GetReadySpiderManEnd:
PAL_SpiderMan:
	db "SpiderMan.bin"
PAL_SpiderManEnd:
PAL_Unknown6:
	db "Unknown6.bin"
PAL_Unknown6End:
PAL_CopyOfSpiderManPortrait:
	db "CopyOfSpiderManPortrait.bin"
PAL_CopyOfSpiderManPortraitEnd:
PAL_FGBG_SpiderMan3:
	db "FGBG_SpiderMan3.bin"
PAL_FGBG_SpiderMan3End:
PAL_FGBG_FinalBoss:
	db "FGBG_FinalBoss.bin"
PAL_FGBG_FinalBossEnd:
PAL_Sprite_IntroLevel:
	db "Sprite_IntroLevel.bin"
PAL_Sprite_IntroLevelEnd:
PAL_Sprite_SpiderMan2:
	db "Sprite_SpiderMan2.bin"
PAL_Sprite_SpiderMan2End:
PAL_Sprite_FinalBoss:
	db "Sprite_FinalBoss.bin"
PAL_Sprite_FinalBossEnd:

;--------------------------------------------------------------------

DATA_00FF2A:
	db "DATA_00FF2A.bin"
DATA_00FF2AEnd:
DATA_01FEE2:
	db "DATA_01FEE2.bin"
DATA_01FEE2End:
DATA_02A7C0:
	db "DATA_02A7C0.bin"
DATA_02A7C0End:
DATA_03DE32:
	db "DATA_03DE32.bin"
DATA_03DE32End:
DATA_129A3D:
	db "DATA_129A3D.bin"
DATA_129A3DEnd:
DATA_13DC37:
	db "DATA_13DC37.bin"
DATA_13DC37End:
DATA_14CCA0:
	db "DATA_14CCA0.bin"
DATA_14CCA0End:
DATA_17E840:
	db "DATA_17E840.bin"
DATA_17E840End:
DATA_18DE8D:
	db "DATA_18DE8D.bin"
DATA_18DE8DEnd:
DATA_19C886:
	db "DATA_19C886.bin"
DATA_19C886End:
DATA_1ADF00:
	db "DATA_1ADF00.bin"
DATA_1ADF00End:
DATA_1BE000:
	db "DATA_1BE000.bin"
DATA_1BE000End:
DATA_1FB62D:
	db "DATA_1FB62D.bin"
DATA_1FB62DEnd:

;--------------------------------------------------------------------

Music_CopyOfBriefing:
	db "CopyOfBriefing.bin"
Music_CopyOfBriefingEnd:
Music_SpiderManLevel:
	db "SpiderManLevel.bin"
Music_SpiderManLevelEnd:
Music_StormLevel:
	db "StormLevel.bin"
Music_StormLevelEnd:
Music_CyclopsLevel:
	db "CyclopsLevel.bin"
Music_CyclopsLevelEnd:
Music_TitleScreen:
	db "TitleScreen.bin"
Music_TitleScreenEnd:
Music_WolverineLevel:
	db "WolverineLevel.bin"
Music_WolverineLevelEnd:
Music_GambitLevel:
	db "GambitLevel.bin"
Music_GambitLevelEnd:
Music_HighScore:
	db "HighScore.bin"
Music_HighScoreEnd:
Music_Briefing:
	db "Briefing.bin"
Music_BriefingEnd:
Music_Ending:
	db "Ending.bin"
Music_EndingEnd:
Music_FinalLevel:
	db "FinalLevel.bin"
Music_FinalLevelEnd:
Music_GameOver:
	db "GameOver.bin"
Music_GameOverEnd:

;--------------------------------------------------------------------

SPCSampleBank:
	db "SPCSampleBank.bin"
SPCSampleBankEnd:

;--------------------------------------------------------------------
