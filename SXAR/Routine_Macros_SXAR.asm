
;#############################################################################################################
;#############################################################################################################

macro SXARBank00Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

CODE_008000:
	CLC
	XCE
	SEP.b #$30
	STZ.w $4200
	SEI
	REP.b #$10
	LDX.w #$01FF
	TXS
	REP.b #$20
	LDA.w #$0000
	PHA
	PLD
	SEP.b #$30
	LDA.b #MainDataBank01>>16
	PHA
	PLB
	JSL.l CODE_028D8F
	JSR.w CODE_0088D6
	REP.b #$30
	LDA.w #$464D
	STA.w $0141
	SEP.b #$30
	LDA.b #$F1
	STA.w $4200
	CLI
	SEP.b #$30
	LDX.b #$BE
CODE_008036:
	STZ.w !RAM_SXAR_Global_CurrentLivesLo,x
	DEX
	BPL.b CODE_008036
	JSR.w CODE_00972F
CODE_00803F:
	SEP.b #$30
	STZ.w $4200
	LDA.b #$80
	STA.w $2100
	JSL.l CODE_0295BF
	JSR.w CODE_0097E4
	JSR.w CODE_0082B3
	REP.b #$30
	LDA.w #$0000
	JSL.l CODE_02A54F
CODE_00805C:
	LDA.w #!Define_SXAR_LevelID_IntroLevel
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BPL.b CODE_00806D
	JMP.w CODE_008115

CODE_00806D:
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_00805C
	REP.b #$30
	LDA.w #$0000
	JSR.w CODE_00A2B9
CODE_00807A:
	JSR.w CODE_009DED
	LDA.w $159A
	BNE.b CODE_008091
CODE_008082:
	JSR.w CODE_008123
	BNE.b CODE_008082
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BPL.b CODE_00808F
	JMP.w CODE_008115

CODE_00808F:
	BRA.b CODE_00807A

CODE_008091:
	LDA.w #!Define_SXAR_LevelID_Cyclops3
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BMI.b CODE_008115
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_008091
CODE_0080A4:
	LDA.w #!Define_SXAR_LevelID_Wolverine3
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BMI.b CODE_008115
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_0080A4
CODE_0080B7:
	LDA.w #!Define_SXAR_LevelID_Gambit3
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BMI.b CODE_008115
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_0080B7
CODE_0080CA:
	LDA.w #!Define_SXAR_LevelID_Storm3
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BMI.b CODE_008115
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_0080CA
CODE_0080DD:
	LDA.w #!Define_SXAR_LevelID_SpiderMan3
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BMI.b CODE_008115
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_0080DD
CODE_0080F0:
	LDA.w #!Define_SXAR_LevelID_FinalBoss
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w CODE_008123
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	BMI.b CODE_008115
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	BEQ.b CODE_0080F0
	REP.b #$30
	LDA.w #$0001
	JSR.w CODE_00A2B9
	LDA.w #$0001
	JSL.l CODE_02A54F
	JSR.w CODE_00A1E3
CODE_008115:
	JSR.w CODE_0082F6
	CLI
	SEP.b #$30
	LDA.b #$F1
	STA.w $4200
	JMP.w CODE_00803F

CODE_008123:
	REP.b #$30
	PHB
	JSR.w CODE_008181
	LDA.w #$FEDC
	STA.w $01BD
	PLB
	REP.b #$30
	STZ.w $0102
	STZ.w $0104
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	CLI
	LDA.b #$F1
	STA.w $4200
	JSL.l CODE_028EB6
	JSL.l CODE_028D8F
	JSL.l CODE_028E91
	JSL.l CODE_0295BF
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	REP.b #$30
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	LDA.w !RAM_SXAR_Global_LevelClearFlags
	STA.w !RAM_SXAR_Global_LevelClearFlags,x
	BEQ.b CODE_008178
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BNE.b CODE_00817C
	LDA.w #!Define_SXAR_LevelID_Cyclops2Boss
	STA.w !RAM_SXAR_Global_CurrentLevelLo
	RTS

CODE_008178:
	LDA.w #$0000
	RTS

CODE_00817C:
	JSR.w CODE_009D0D
	BRA.b CODE_008178

CODE_008181:
	JSL.l CODE_028EB6
	SEP.b #$20
	STZ.w $4200
	SEI
	REP.b #$20
	LDY.w !RAM_SXAR_Global_CurrentLevelLo
	LDA.w DATA_01DAFE,y
	STA.w $0102
	STA.w $0104
	STZ.w !RAM_SXAR_Global_LevelClearFlags
	JSL.l CODE_028D8F
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	JMP.w (DATA_0081A6,x)

DATA_0081A6:
	dw $0000
	dw CODE_00B61C
	dw CODE_00B61C
	dw CODE_00D443
	dw CODE_00D443
	dw CODE_00EF4C
	dw CODE_00EF4C
	dw CODE_0081D5
	dw CODE_0081EC
	dw CODE_008203
	dw CODE_00821A
	dw CODE_008231
	dw CODE_008248
	dw CODE_00D443
	dw CODE_00825F
	dw CODE_00D443
	dw CODE_00EF4C
	dw CODE_00828D
	dw CODE_008276

CODE_0081CC:
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	RTS

CODE_0081D5:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_SpiderManLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_188000
	RTS

CODE_0081EC:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_SpiderManLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_188009
	RTS

CODE_008203:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_SpiderManLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_188012
	RTS

CODE_00821A:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_FinalLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_18801B
	RTS

CODE_008231:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_GambitLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_138000
	RTS

CODE_008248:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_GambitLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_138009
	RTS

CODE_00825F:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_StormLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_138012
	RTS

CODE_008276:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_GambitLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_13801B
	RTS

CODE_00828D:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_SpiderManLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSL.l CODE_188024
	RTS

CODE_0082A4:
	LDY.w #$0000
CODE_0082A7:
	NOP
	DEY
	BNE.b CODE_0082A7
	LDA.w #$0201
	JSL.l CODE_028B1F
	RTS

CODE_0082B3:
	PHP
	REP.b #$30
	STZ.w $159A
	LDA.w #!Define_SXAR_InitialStartingLives
	STA.w !RAM_SXAR_Global_CurrentLivesLo
	STZ.w $0110
	STZ.w $0112
	STZ.w $0114
	STZ.w $0115
	LDX.w #$0024
CODE_0082CE:
	STZ.w !RAM_SXAR_Global_LevelClearFlags,x
	DEX
	DEX
	BPL.b CODE_0082CE
	LDA.w #$0001
	LDA.w #$0001
	STA.w $0106
	STA.w $0108
	STA.w $010A
	STA.w $010E
	STA.w $010C
	LDA.w #!Define_SXAR_CharSelect_SpiderMan
	STA.w !RAM_SXAR_CharSelect_CurrentScreenLo
	STA.b $06
	INC.b $09
	PLP
	RTS

CODE_0082F6:
	SEP.b #$30
	LDA.b #$F0
	STA.w $2100
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_GameOver
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	LDA.w #$0001
	STA.w $0102
	STA.w $0104
	STZ.w $136E
	JSL.l CODE_0295A6
	JSL.l CODE_02953D
	JSL.l CODE_029573
	JSL.l CODE_02A044
	JSL.l CODE_029F7C
	SEP.b #$30
	LDA.b #$10
	STA.w $212C
	LDA.b #$0F
	STA.w $2100
	JSL.l CODE_0295A6
	REP.b #$30
	JSL.l CODE_028D04
	LDA.w #$0001
	JSL.l CODE_02995B
	JSL.l CODE_029718
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	JSL.l CODE_02953D
	JSL.l CODE_029573
	JSL.l CODE_028E91
	JSL.l CODE_0295A6
	SEI
	REP.b #$20
	STZ.w $013D
	SEP.b #$30
	LDA.b #$80
	STA.w $2100
	JSL.l CODE_028EB6
	STZ.b $16
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_TitleScreen
	JSL.l CODE_028000
	JSL.l CODE_0295A6
	LDA.w #$0201
	JSL.l CODE_028B1F
	JSL.l CODE_028D8F
	RTS

CODE_00839D:
	PHP
	SEP.b #$20
	PLP
	RTS

CODE_0083A2:
	JSL.l CODE_0295A6
	JSL.l CODE_02951C
	LDA.b $56
	ORA.b $58
	AND.w #$1000
	BNE.b CODE_0083A2
	RTS

CODE_0083B4:
	RTS

CODE_0083B5:
	LDA.b $56
	AND.w #$2040
	CMP.w #$2040
	BNE.b CODE_0083C3
	JSL.l CODE_02A2F7
CODE_0083C3:
	RTS

CODE_0083C4:
	REP.b #$30
	LDA.b $56
	BIT.w #$8000
	BEQ.b CODE_0083D0
	JSR.w CODE_0083D0
CODE_0083D0:
	LDA.b $56
	BIT.w #$0200
	BEQ.b CODE_0083DA
	JSR.w CODE_008412
CODE_0083DA:
	LDA.b $56
	BIT.w #$0100
	BEQ.b CODE_0083E4
	JSR.w CODE_00841D
CODE_0083E4:
	LDA.b $56
	BIT.w #$0800
	BEQ.b CODE_0083EE
	JSR.w CODE_008428
CODE_0083EE:
	LDA.b $56
	BIT.w #$0400
	BEQ.b CODE_0083F8
	JSR.w CODE_008433
CODE_0083F8:
	JSR.w CODE_00949C
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STA.b $96
	JSR.w CODE_00B241
	STA.w $1594
	JSR.w CODE_00B2A7
	STA.w $1592
	RTS

CODE_008412:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w #$0002
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	RTS

CODE_00841D:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CLC
	ADC.w #$0002
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	RTS

CODE_008428:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w #$0002
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	RTS

CODE_008433:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CLC
	ADC.w #$0002
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	RTS

CODE_00843E:
	RTS

CODE_00843F:
	PHP
	REP.b #$20
	STZ.w $2102
	LDA.w #$0200
	STA.w $4302
	LDA.w #$0220
	STA.w $4305
	SEP.b #$20
	LDA.b #$01
	STA.w $420B
	REP.b #$20
	LDA.w #$81C0
	STA.w $2102
	PLP
	RTS

CODE_008462:
	PHP
	REP.b #$20
	STZ.w $2102
	LDA.w #$0200
	STA.w $4302
	LDA.w #$0220
	STA.w $4305
	SEP.b #$20
	LDA.b #$01
	STA.w $420B
	REP.b #$20
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_00848D
	LDA.w #$8180
	STA.w $2102
	PLP
	RTS

CODE_00848D:
	LDA.w #$800C
	STA.w $2102
	PLP
	RTS

CODE_008495:
	PHP
	SEP.b #$20
	LDA.b $14
	BNE.b CODE_00849F
	JMP.w CODE_00851B

CODE_00849F:
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	STZ.w $4317
	LDA.w $128C
	STA.w $4314
	REP.b #$20
	SEP.b #$10
	LDY.b #$02
	LDA.w $1498
	BEQ.b CODE_00851D
	LDA.w $1562
	BNE.b CODE_00851D
	LDA.w $129C
	STA.w $4312
	LDA.w #$0100
	STA.w $4315
	LDA.w #$6000
	STA.w $2116
	STY.w $420B
	LDA.w $12AC
	STA.w $4312
	LDA.w #$0100
	STA.w $4315
	LDA.w #$6100
	STA.w $2116
	STY.w $420B
	LDA.w $12BC
	STA.w $4312
	LDA.w #$0100
	STA.w $4315
	LDA.w #$6200
	STA.w $2116
	STY.w $420B
	LDA.w $12CC
	STA.w $4312
	LDA.w #$0100
	STA.w $4315
	LDA.w #$6300
	STA.w $2116
	STY.w $420B
CODE_00851B:
	PLP
	RTS

CODE_00851D:
	LDA.w $129C
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6000
	STA.w $2116
	STY.w $420B
	LDA.w $12AC
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6100
	STA.w $2116
	STY.w $420B
	LDA.w $12BC
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6200
	STA.w $2116
	STY.w $420B
	LDA.w $12CC
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6300
	STA.w $2116
	STY.w $420B
	LDA.w $12DC
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6400
	STA.w $2116
	STY.w $420B
	LDA.w $12EC
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6500
	STA.w $2116
	STY.w $420B
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine1
	BEQ.b CODE_0085BF
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_0085BF
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_0085BF
	CMP.w #!Define_SXAR_LevelID_Cyclops1
	BEQ.b CODE_0085BF
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BEQ.b CODE_0085BF
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BEQ.b CODE_0085BF
	JMP.w CODE_008645

CODE_0085BF:
	LDA.w $1598
	BEQ.b CODE_0085C7
	JMP.w CODE_008647

CODE_0085C7:
	LDA.w $129E
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6040
	STA.w $2116
	STY.w $420B
	LDA.w $12AE
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6140
	STA.w $2116
	STY.w $420B
	LDA.w $12BE
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6240
	STA.w $2116
	STY.w $420B
	LDA.w $12CE
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6340
	STA.w $2116
	STY.w $420B
	LDA.w $12DE
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6440
	STA.w $2116
	STY.w $420B
	LDA.w $12EE
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6540
	STA.w $2116
	STY.w $420B
CODE_008645:
	PLP
	RTS

CODE_008647:
	LDA.b $0E
	AND.w #$0006
	TAX
	LDA.w DATA_01CFEF,x
	STA.w $4312
	LDA.w #$0400
	STA.w $4315
	LDA.w DATA_01CFF7,x
	STA.w $2116
	STY.w $420B
	BRA.b CODE_008645

CODE_008664:
	RTS

CODE_008665:
	PHP
	REP.b #$30
	LDA.w $0426
	ASL
	TAX
	JSR.w (DATA_008672,x)
	PLP
	RTS

DATA_008672:
	dw CODE_008664
	dw CODE_008664
	dw CODE_008686
	dw CODE_008664
	dw CODE_008664
	dw CODE_008664
	dw CODE_008664
	dw CODE_008664
	dw CODE_008664
	dw CODE_008664

CODE_008686:
	PHP
	SEP.b #$20
	LDA.w $1294
	STA.w $4314
	REP.b #$20
	LDA.w $12A4
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6680
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.w $12B4
	STA.w $4312
	LDA.w #$0080
	STA.w $4315
	LDA.w #$6780
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	PLP
	RTS

CODE_0086C7:
	DEC.b $4A
	PLP
	RTS

CODE_0086CB:
	PHP
	REP.b #$30
	LDA.w $14F8
	BNE.b CODE_0086C7
	LDX.w #$0002
	INC.w $149A
	LDA.w $149A
	CMP.w #$0008
	BNE.b CODE_0086E7
	LDA.w #$0000
	STA.w $149A
CODE_0086E7:
	ASL
	TAY
	LDA.w DATA_01F9E8,y
	STA.b $80
	LDY.w #$0000
	SEP.b #$30
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	STZ.w $4317
	LDA.b #$7F
	STA.w $4314
	REP.b #$20
	LDA.b ($80),y
	STA.w $4312
	LDA.w DATA_01FA38,y
	STA.w $4315
	LDA.w DATA_01FA40,y
	STA.w $2116
	INY
	INY
	STX.w $420B
	LDA.b ($80),y
	STA.w $4312
	LDA.w DATA_01FA38,y
	STA.w $4315
	LDA.w DATA_01FA40,y
	STA.w $2116
	INY
	INY
	STX.w $420B
	LDA.b ($80),y
	STA.w $4312
	LDA.w DATA_01FA38,y
	STA.w $4315
	LDA.w DATA_01FA40,y
	STA.w $2116
	INY
	INY
	STX.w $420B
	LDA.b ($80),y
	STA.w $4312
	LDA.w DATA_01FA38,y
	STA.w $4315
	LDA.w DATA_01FA40,y
	STA.w $2116
	INY
	INY
	STX.w $420B
	PLP
	RTS

CODE_008766:
	REP.b #$30
	PHA
	PHX
	PHY
	PHB
	SEP.b #$20
	LDA.w $4210
	REP.b #$20
	LDA.w $0141
	CMP.w #$464D
	BNE.b CODE_008785
	LDA.w $0102
	ASL
	TAX
	JSR.w CODE_00878A
	REP.b #$30
CODE_008785:
	PLB
	PLY
	PLX
	PLA
CODE_008789:
	RTI

CODE_00878A:
	JMP.w (DATA_00878D,x)

DATA_00878D:
	dw CODE_0087A9
	dw CODE_0087AC
	dw CODE_0087AF
	dw CODE_0087B2
	dw CODE_0087B5
	dw CODE_0087B8
	dw CODE_0087BD
	dw CODE_0087C2
	dw CODE_0087C7
	dw CODE_0087CC
	dw CODE_0087D1
	dw CODE_0087D6
	dw CODE_0087DB
	dw CODE_0087E0

CODE_0087A9:
	JMP.w CODE_0087E5

CODE_0087AC:
	JMP.w CODE_008809

CODE_0087AF:
	JMP.w CODE_008820

CODE_0087B2:
	JMP.w CODE_008856

CODE_0087B5:
	JMP.w CODE_00888C

CODE_0087B8:
	JSL.l CODE_188003
	RTS

CODE_0087BD:
	JSL.l CODE_18800C
	RTS

CODE_0087C2:
	JSL.l CODE_188015
	RTS

CODE_0087C7:
	JSL.l CODE_18801E
	RTS

CODE_0087CC:
	JSL.l CODE_138003
	RTS

CODE_0087D1:
	JSL.l CODE_13800C
	RTS

CODE_0087D6:
	JSL.l CODE_138015
	RTS

CODE_0087DB:
	JSL.l CODE_188027
	RTS

CODE_0087E0:
	JSL.l CODE_13801E
	RTS

CODE_0087E5:
	SEP.b #$20
	LDA.b #MainDataBank01>>16
	PHA
	PLB
	INC.b $0C
CODE_0087ED:
	LDA.w $4212
	AND.b #$01
	BNE.b CODE_0087ED
	REP.b #$30
	LDA.b $56
	STA.b $5A
	LDA.w $4218
	STA.b $56
	LDA.b $58
	STA.b $5C
	LDA.w $421A
	STA.b $58
	RTS

CODE_008809:
	SEP.b #$20
	LDA.b #MainDataBank01>>16
	PHA
	PLB
	REP.b #$20
	JSR.w CODE_00843F
	LDA.w $158E
	BEQ.b CODE_00881D
	JSL.l CODE_029424
CODE_00881D:
	JMP.w CODE_0087E5

CODE_008820:
	SEP.b #$20
	LDA.b #MainDataBank01>>16
	PHA
	PLB
	REP.b #$20
	JSR.w CODE_008462
	JSR.w CODE_008495
	JSR.w CODE_008665
	JSR.w CODE_008AA2
	JSR.w CODE_00F8E1
	JSR.w CODE_0089A3
	SEP.b #$20
	LDA.w $14F8
	INC
	CMP.b #$03
	BNE.b CODE_008846
	LDA.b #$00
CODE_008846:
	STA.w $14F8
	LDA.b $1A
	STA.w $2100
	LDA.b #$00
	STA.w $420C
	JMP.w CODE_0087E5

CODE_008856:
	SEP.b #$20
	LDA.b #MainDataBank01>>16
	PHA
	PLB
	REP.b #$20
	JSR.w CODE_00843F
	JSR.w CODE_008495
	JSR.w CODE_0086CB
	JSR.w CODE_008AA2
	JSR.w CODE_00C735
	JSR.w CODE_0089A3
	SEP.b #$20
	LDA.w $14F8
	INC
	CMP.b #$03
	BNE.b CODE_00887C
	LDA.b #$00
CODE_00887C:
	STA.w $14F8
	LDA.b $1A
	STA.w $2100
	LDA.b #$00
	STA.w $420C
	JMP.w CODE_0087E5

CODE_00888C:
	SEP.b #$20
	LDA.b #MainDataBank01>>16
	PHA
	PLB
	REP.b #$20
	JSR.w CODE_00843F
	JSR.w CODE_008495
	JSR.w CODE_00EE63
	JSR.w CODE_008AA2
	JSR.w CODE_00DC9A
	JSR.w CODE_0089A3
	SEP.b #$20
	LDA.w $14F8
	INC
	CMP.b #$03
	BNE.b CODE_0088B2
	LDA.b #$00
CODE_0088B2:
	STA.w $14F8
	LDA.b $1A
	STA.w $2100
	LDA.b #$00
	STA.w $420C
	JMP.w CODE_0087E5

CODE_0088C2:
	PHP
	REP.b #$30
	LDA.w #$0000
	STX.w $2116
	LDX.w #$03FF
CODE_0088CE:
	STA.w $2118
	DEX
	BPL.b CODE_0088CE
	PLP
	RTS

CODE_0088D6:
	REP.b #$10
	SEP.b #$20
	PLY
	LDA.b #$00
	LDX.w #$0000
CODE_0088E0:
	STA.l $7E0000,x
	STA.l $7F0000,x
	INX
	BNE.b CODE_0088E0
	PHY
	RTS

CODE_0088ED:
	JSR.w CODE_0088F1
	RTL

CODE_0088F1:
	REP.b #$30
	LDX.w #$0000
	JSR.w CODE_0088C2
	LDX.w #$0400
	JSR.w CODE_0088C2
	LDX.w #$0800
	JSR.w CODE_0088C2
	RTS

CODE_008906:
	PHP
	REP.b #$20
	LDA.b $0C
	ORA.w #$0002
	STA.b $06
	PLP
	RTS

CODE_008912:
	PHP
	REP.b #$30
	ASL
	ASL
	TAX
	LDA.w DATA_01E7BD,x
	STA.b $64
	LDA.w DATA_01E7BD+$02,x
	STA.b $66
	LDA.w #$00002E>>16
	STA.b $6A
	LDA.w #$00002E
	STA.b $68
	LDY.w #$0020
	JSR.w CODE_00B4D0
	PLP
	RTS

CODE_008934:
	PHP
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$17
	STA.w $212C
	STA.w $212E
	LDA.b #$13
	STA.w $212D
	STZ.w $212F
	LDA.b #$54
	STA.w $2131
	LDA.b #$02
	STA.w $2130
	PLP
	RTS

CODE_008957:
	PHP
	SEP.b #$20
	LDA.b #$02
	STA.w $2130
	LDA.b #$1B
	STA.w $212E
	LDA.b #$03
	STA.w $212D
	STZ.w $2132
	PLP
	RTS

CODE_00896E:
	PHP
	REP.b #$20
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_008994
	SEP.b #$20
	LDA.b #$00
	STA.w $2130
	LDA.b #$82
	STA.w $2131
	LDA.b #$2D
	STA.w $2132
	LDA.b #$4D
	STA.w $2132
	LDA.b #$8C
	STA.w $2132
CODE_008994:
	LDA.b #$1B
	STA.w $212E
	LDA.b #$03
	STA.w $212D
	STZ.w $2132
	PLP
	RTS

CODE_0089A3:
	PHP
	SEP.b #$20
	LDA.b $0C
	AND.b #$07
	BNE.b CODE_0089C1
	LDA.w $1562
	BNE.b CODE_0089C1
	LDA.b $1A
	BMI.b CODE_0089BE
	AND.b #$0F
	CMP.b #$0F
	BEQ.b CODE_0089C1
	INC
	STA.b $1A
CODE_0089BE:
	STA.w $2100
CODE_0089C1:
	PLP
	RTS

CODE_0089C3:
	PHP
	SEP.b #$20
	LDA.w $14F8
	BNE.b CODE_0089D6
	LDA.b $1A
	BMI.b CODE_0089D2
	DEC
	BPL.b CODE_0089D4
CODE_0089D2:
	LDA.b #$80
CODE_0089D4:
	STA.b $1A
CODE_0089D6:
	PLP
	RTS

CODE_0089D8:
	JSR.w CODE_0089E1
	JMP.w CODE_0089E4

CODE_0089DE:
	JSR.w CODE_0089E1
CODE_0089E1:
	JSR.w CODE_0089E4
CODE_0089E4:
	PHP
	REP.b #$20
	LDA.b $2E
	CMP.w $1564
	BCS.b CODE_008A03
	INC.b $3E
	INC.b $2E
	INC.b $42
	LDA.b $3E
	CMP.w #$0004
	BCC.b CODE_008A01
	STZ.b $3E
	INC.b $46
	INC.b $4A
CODE_008A01:
	PLP
	RTS

CODE_008A03:
	LDA.w #$FFFF
	STA.w $1376
	BRA.b CODE_008A01

CODE_008A0B:
	JSR.w CODE_008A14
	JMP.w CODE_008A17

CODE_008A11:
	JSR.w CODE_008A14
CODE_008A14:
	JSR.w CODE_008A17
CODE_008A17:
	PHP
	REP.b #$20
	LDA.b $2E
	BEQ.b CODE_008A33
	DEC.b $3E
	DEC.b $2E
	DEC.b $42
	LDA.b $3E
	BPL.b CODE_008A31
	LDA.w #$0003
	STA.b $3E
	DEC.b $46
	DEC.b $4A
CODE_008A31:
	PLP
	RTS

CODE_008A33:
	STZ.w $1376
	BRA.b CODE_008A31

CODE_008A38:
	JSR.w CODE_008A4A
CODE_008A3B:
	JSR.w CODE_008A4A
	JMP.w CODE_008A4D

CODE_008A41:
	JSR.w CODE_008A4D
CODE_008A44:
	JSR.w CODE_008A4A
CODE_008A47:
	JSR.w CODE_008A4A
CODE_008A4A:
	JSR.w CODE_008A4D
CODE_008A4D:
	PHP
	REP.b #$20
	LDA.b $30
	CMP.w $1566
	BCS.b CODE_008A6A
	INC.b $40
	INC.b $30
	INC.b $44
	LDA.b $40
	CMP.w #$0004
	BCC.b CODE_008A6A
	STZ.b $40
	INC.b $48
	INC.b $4C
CODE_008A6A:
	PLP
	RTS

CODE_008A6C:
	JSR.w CODE_008A7E
CODE_008A6F:
	JSR.w CODE_008A7E
	JMP.w CODE_008A81

CODE_008A75:
	JSR.w CODE_008A81
	JSR.w CODE_008A7E
CODE_008A7B:
	JSR.w CODE_008A7E
CODE_008A7E:
	JSR.w CODE_008A81
CODE_008A81:
	PHP
	REP.b #$20
	LDA.b $30
	BEQ.b CODE_008AA0
	DEC.b $40
	DEC.b $30
	DEC.b $44
	LDA.b $40
	LSR
	BCC.b CODE_008AA0
	LDA.b $40
	BPL.b CODE_008AA0
	LDA.w #$0003
	STA.b $40
	DEC.b $48
	DEC.b $4C
CODE_008AA0:
	PLP
	RTS

CODE_008AA2:
	PHP
	REP.b #$30
	INC.w !RAM_SXAR_WolverineCyclopsSwimStorm_TileAnimationFrameCounterLo
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_TileAnimationFrameCounterLo
	AND.w #$0003
	ASL
	STA.b $80
	LDA.w $0102
	ASL
	ASL
	ASL
	CLC
	ADC.b $80
	TAX
	JSR.w (DATA_008AC3,x)
	JSR.w CODE_008AEB
	PLP
	RTS

DATA_008AC3:
	dw CODE_008B32
	dw CODE_008E54
	dw CODE_008B32
	dw CODE_008E54

	dw CODE_008B32
	dw CODE_008E54
	dw CODE_008B32
	dw CODE_008E54

	dw CODE_008B32
	dw CODE_008E54
	dw CODE_008B32
	dw CODE_008E54

	dw CODE_009174
	dw CODE_008B32
	dw CODE_009174
	dw CODE_008E54

	dw CODE_008B32
	dw CODE_008E54
	dw CODE_008B32
	dw CODE_008E54

CODE_008AEB:
	PHP
	SEP.b #$20
	LDA.b $42
	CLC
	ADC.b #$20
	STA.w $210D
	STZ.w $210D
	LDA.b $46
	CLC
	ADC.b #$20
	STA.w $210F
	STZ.w $210F
	LDA.b $4A
	CLC
	ADC.b #$20
	STA.w $2111
	STZ.w $2111
	LDA.b $44
	CLC
	ADC.b #$20
	STA.w $210E
	STZ.w $210E
	LDA.b $48
	CLC
	ADC.b #$20
	STA.w $2110
	STZ.w $2110
	LDA.b $4C
	CLC
	ADC.b #$20
	STA.w $2112
	STZ.w $2112
	PLP
	RTS

CODE_008B32:
	PHP
	REP.b #$30
	LDA.b $42
	BMI.b CODE_008B48
	CMP.w #$0010
	BCC.b CODE_008B50
	SEC
	SBC.w #$0010
	STA.b $42
	INC.b $32
	BRA.b CODE_008B50

CODE_008B48:
	CLC
	ADC.w #$0010
	STA.b $42
	DEC.b $32
CODE_008B50:
	LDA.b $44
	BMI.b CODE_008B63
	CMP.w #$0010
	BCC.b CODE_008B6B
	SEC
	SBC.w #$0010
	STA.b $44
	INC.b $34
	BRA.b CODE_008B6B

CODE_008B63:
	CLC
	ADC.w #$0010
	STA.b $44
	DEC.b $34
CODE_008B6B:
	REP.b #$20
	LDA.b $4F
	LSR
	SEP.b #$20
	STA.w $4202
	LDA.b $34
	STA.w $4203
	REP.b #$20
	NOP #4
	LDA.w $4216
	ASL
	ASL
	CLC
	ADC.b $32
	CLC
	ADC.b $32
	CLC
	ADC.w $1508
	STA.b $80
	SEP.b #$20
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	STZ.w $4317
	LDA.b #$7E
	STA.w $4314
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0000
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0020
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0040
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0060
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0080
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$00A0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$00C0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$00E0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0100
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0120
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0140
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0160
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0180
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$01A0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$01C0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$01E0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0200
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0220
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0240
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0260
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	PLP
	RTS

CODE_008E54:
	PHP
	REP.b #$30
	LDA.b $46
	BMI.b CODE_008E6A
	CMP.w #$0010
	BCC.b CODE_008E72
	SEC
	SBC.w #$0010
	STA.b $46
	INC.b $36
	BRA.b CODE_008E72

CODE_008E6A:
	CLC
	ADC.w #$0010
	STA.b $46
	DEC.b $36
CODE_008E72:
	LDA.b $48
	BMI.b CODE_008E85
	CMP.w #$0010
	BCC.b CODE_008E8D
	SEC
	SBC.w #$0010
	STA.b $48
	INC.b $38
	BRA.b CODE_008E8D

CODE_008E85:
	CLC
	ADC.w #$0010
	STA.b $48
	DEC.b $38
CODE_008E8D:
	SEP.b #$20
	LDA.b $38
	STA.w $4202
	LDA.b $51
	LSR
	STA.w $4203
	REP.b #$20
	NOP #4
	LDA.w $4216
	ASL
	ASL
	CLC
	ADC.b $36
	CLC
	ADC.b $36
	CLC
	ADC.w $150A
	STA.b $80
	SEP.b #$20
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	STZ.w $4317
	LDA.b #$7E
	STA.w $4314
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0400
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0420
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0440
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0460
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0480
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$04A0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$04C0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$04E0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0500
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0520
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0540
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0560
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0580
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$05A0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$05C0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$05E0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0600
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0620
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0640
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $51
	CLC
	ADC.b $51
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0660
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	PLP
	RTS

CODE_009174:
	PHP
	REP.b #$30
	LDA.b $4A
	BMI.b CODE_00918A
	CMP.w #$0010
	BCC.b CODE_009192
	SEC
	SBC.w #$0010
	STA.b $4A
	INC.b $3A
	BRA.b CODE_009192

CODE_00918A:
	CLC
	ADC.w #$0010
	STA.b $4A
	DEC.b $3A
CODE_009192:
	LDA.b $4C
	BMI.b CODE_0091A5
	CMP.w #$0010
	BCC.b CODE_0091AD
	SEC
	SBC.w #$0010
	STA.b $4C
	INC.b $3C
	BRA.b CODE_0091AD

CODE_0091A5:
	CLC
	ADC.w #$0010
	STA.b $4C
	DEC.b $3C
CODE_0091AD:
	LDA.w $1498
	BEQ.b CODE_0091B5
	JSR.w CODE_00BB5E
CODE_0091B5:
	SEP.b #$20
	LDA.b $3C
	STA.w $4202
	LDA.b $53
	LSR
	STA.w $4203
	REP.b #$20
	NOP #4
	LDA.w $4216
	ASL
	ASL
	CLC
	ADC.b $3A
	CLC
	ADC.b $3A
	CLC
	ADC.w $150C
	STA.b $80
	SEP.b #$20
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	STZ.w $4317
	LDA.b #$7E
	STA.w $4314
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0800
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0820
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0840
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0860
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0880
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$08A0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$08C0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$08E0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0900
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0920
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0940
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0960
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0980
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$09A0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$09C0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$09E0
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0A00
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0A20
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0A40
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	LDA.b $80
	STA.w $4312
	CLC
	ADC.b $53
	CLC
	ADC.b $53
	STA.b $80
	LDA.w #$0028
	STA.w $4315
	LDA.w #$0A60
	STA.w $2116
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	PLP
	RTS

CODE_00949C:
	PHP
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BEQ.b CODE_0094B7
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_0094B4
	CMP.w #!Define_SXAR_LevelID_Storm3
	BCS.b CODE_0094B4
	JSR.w CODE_00953A
CODE_0094B4:
	JSR.w CODE_0094CD
CODE_0094B7:
	JSR.w CODE_0094BC
	PLP
	RTS

CODE_0094BC:
	LDA.b $30
	CLC
	ADC.w #$0020
	STA.w $133E
	CLC
	ADC.w #$00E0
	STA.w $1340
	RTS

CODE_0094CD:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.b $2E
	SEC
	SBC.w #$0020
	LSR
	LSR
	LSR
	AND.w #$001E
	TAX
	LDA.w $150E
	BEQ.b CODE_0094EB
	LDA.w $1520
	BIT.w #$0004
	BRA.b CODE_0094F1

CODE_0094EB:
	LDA.w $0A9E
	BIT.w #$4000
CODE_0094F1:
	BNE.b CODE_009516
	JMP.w (DATA_0094F6,x)

DATA_0094F6:
	dw CODE_008A14
	dw CODE_008A14
	dw CODE_008A17
	dw CODE_008A17
	dw CODE_009539
	dw CODE_009539
	dw CODE_0089E4
	dw CODE_0089E1
	dw CODE_0089E1
	dw CODE_0089E1
	dw CODE_0089D8
	dw CODE_0089D8
	dw CODE_0089DE
	dw CODE_0089DE
	dw CODE_0089DE
	dw CODE_0089DE

CODE_009516:
	JMP.w (DATA_009519,x)

DATA_009519:
	dw CODE_008A11
	dw CODE_008A11
	dw CODE_008A11
	dw CODE_008A11
	dw CODE_008A0B
	dw CODE_008A0B
	dw CODE_008A14
	dw CODE_008A14
	dw CODE_008A14
	dw CODE_008A17
	dw CODE_009539
	dw CODE_009539
	dw CODE_0089E4
	dw CODE_0089E4
	dw CODE_0089E1
	dw CODE_0089E1

CODE_009539:
	RTS

CODE_00953A:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $30
	SEC
	SBC.w #$0020
	LSR
	LSR
	LSR
	AND.w #$001E
	TAX
	LDA.w $150E
	BNE.b CODE_009580
	LDA.w $0D50
	CMP.w #$0020
	BEQ.b CODE_009580
	CMP.w #$0021
	BEQ.b CODE_0095A3
	JMP.w (DATA_009560,x)

DATA_009560:
	dw CODE_008A6C
	dw CODE_008A7B
	dw CODE_008A6F
	dw CODE_008A6F
	dw CODE_008A7E
	dw CODE_008A81
	dw CODE_009539
	dw CODE_008A4A
	dw CODE_008A4A
	dw CODE_008A47
	dw CODE_008A47
	dw CODE_008A47
	dw CODE_008A47
	dw CODE_008A44
	dw CODE_008A44
	dw CODE_008A44

CODE_009580:
	JMP.w (DATA_009583,x)

DATA_009583:
	dw CODE_008A6C
	dw CODE_008A6C
	dw CODE_008A6C
	dw CODE_008A6C
	dw CODE_008A6C
	dw CODE_008A7B
	dw CODE_008A6F
	dw CODE_008A6F
	dw CODE_008A7E
	dw CODE_008A81
	dw CODE_009539
	dw CODE_008A4D
	dw CODE_008A4A
	dw CODE_008A3B
	dw CODE_008A47
	dw CODE_008A38

CODE_0095A3:
	JMP.w (DATA_0095A6,x)

DATA_0095A6:
	dw CODE_008A6F
	dw CODE_008A7E
	dw CODE_008A4D
	dw CODE_009539
	dw CODE_008A4D
	dw CODE_008A4A
	dw CODE_008A3B
	dw CODE_008A3B
	dw CODE_008A47
	dw CODE_008A38
	dw CODE_008A38
	dw CODE_008A38
	dw CODE_008A38
	dw CODE_008A38
	dw CODE_008A38
	dw CODE_008A38

CODE_0095C6:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $30
	CMP.w $1516
	BEQ.b CODE_0095DA
	BCS.b CODE_0095D9
	STZ.w $1330
	JSR.w CODE_008A7E
CODE_0095D9:
	RTS

CODE_0095DA:
	JMP.w CODE_008A81

CODE_0095DD:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $30
	CMP.w $1518
	BEQ.b CODE_0095FF
	BCC.b CODE_0095FE
	STZ.w $1330
	PHA
	JSR.w CODE_008A4A
	PLA
	SEC
	SBC.w #$0010
	CMP.w $1518
	BCC.b CODE_0095FE
	JSR.w CODE_008A4A
CODE_0095FE:
	RTS

CODE_0095FF:
	JMP.w CODE_008A4D

CODE_009602:
	PHP
	SEP.b #$20
	JSL.l CODE_0295A6
	STZ.w $420C
	JSL.l CODE_0295A6
	PLP
	RTS

CODE_009612:
	JSR.w CODE_009616
	RTL

CODE_009616:
	PHP
	REP.b #$30
	PHX
	STA.b $64
	LDA.w #$FFFF
	STA.b $20
	LDX.w $01B5
CODE_009624:
	LDA.w $0426,x
	BEQ.b CODE_009633
	INX
	INX
	CPX.w $01B7
	BNE.b CODE_009624
	JMP.w CODE_0096E7

CODE_009633:
	LDY.w #$0000
	LDA.b ($64),y
	STA.w $0426,x
	INY
	INY
	LDA.b ($64),y
	STA.w $04B0,x
	INY
	INY
	LDA.b ($64),y
	STA.w $053A,x
	INY
	INY
	LDA.b ($64),y
	BNE.b CODE_009651
	LDA.b $74
CODE_009651:
	STA.w $05C4,x
	INY
	INY
	LDA.b ($64),y
	STA.w $064E,x
	INY
	INY
	LDA.b ($64),y
	STA.w $06D8,x
	INY
	INY
	LDA.b ($64),y
	BNE.b CODE_00966A
	LDA.b $68
CODE_00966A:
	STA.w $0762,x
	INY
	INY
	LDA.b ($64),y
	BNE.b CODE_009675
	LDA.b $6C
CODE_009675:
	STA.w $07EC,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0876,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0900,x
	INY
	INY
	LDA.b ($64),y
	STA.w $098A,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0A14,x
	INY
	INY
	LDA.b ($64),y
	BNE.b CODE_00969C
	LDA.b $70
CODE_00969C:
	STA.w $0A9E,x
	INY
	INY
	LDA.b ($64),y
	CMP.w #$FFFF
	BEQ.b CODE_0096AA
	LDA.b $78
CODE_0096AA:
	STA.w $0EEE,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0B28,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0BB2,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0C3C,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0CC6,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0D50,x
	INY
	INY
	LDA.b ($64),y
	STA.w $0DDA,x
	INY
	INY
	LDA.w #$FFFF
	STA.w $0E64,x
	STZ.w $0F78,x
	STZ.w $1002,x
	STX.b $20
CODE_0096E7:
	PLX
	PLP
	RTS

CODE_0096EA:
	PHP
	REP.b #$30
	STA.b $64
	PHX
	JMP.w CODE_009633

CODE_0096F3:
	PHP
	REP.b #$30
	PHX
	STA.b $64
	LDA.w $01B5
	SEC
	SBC.w #$0002
	STA.b $8C
	LDA.w #$FFFF
	STA.b $20
	LDX.w $01B7
	DEX
	DEX
CODE_00970C:
	LDA.w $0426,x
	BEQ.b CODE_00971A
	DEX
	DEX
	CPX.b $8C
	BNE.b CODE_00970C
	JMP.w CODE_0096E7

CODE_00971A:
	JMP.w CODE_009633

CODE_00971D:
	LDY.w $01B7
	DEY
	DEY
CODE_009722:
	CMP.w $0426,y
	BEQ.b CODE_00972D
	DEY
	DEY
	BPL.b CODE_009722
	CLC
	RTS

CODE_00972D:
	SEC
	RTS

CODE_00972F:
	PHP
	REP.b #$30
	LDA.w #DATA_01E5FE>>16
	STA.b $66
	LDA.w #$000145>>16
	STA.b $6A
	LDA.w #DATA_01E5FE
	STA.b $64
	LDA.w #$000145
	STA.b $68
	LDY.w #$0048
	JSR.w CODE_00B4D0
	REP.b #$30
	LDA.w #DATA_01E646>>16
	STA.b $66
	LDA.w #$00018D>>16
	STA.b $6A
	LDA.w #DATA_01E646
	STA.b $64
	LDA.w #$00018D
	STA.b $68
	LDY.w #$0024
	JSR.w CODE_00B4D0
	REP.b #$30
	LDA.w #DATA_01E67C>>16
	STA.b $66
	LDA.w #$0001B1>>16
	STA.b $6A
	LDA.w #DATA_01E67C
	STA.b $64
	LDA.w #$0001B1
	STA.b $68
	LDY.w #$0004
	JSR.w CODE_00B4D0
	PLP
	RTS

CODE_009786:
	REP.b #$30
	LDA.w #($01E023-$BCDE)>>16
	STA.b $66
	LDA.w #($073578-$BCDE)>>16
	STA.b $6A
	LDA.w #$01E023-$BCDE
	STA.b $64
	LDA.w #$073578-$BCDE
	STA.b $68
	LDY.w #$BCDE
	JSR.w CODE_00B4D0
	NOP #2
	JSR.w CODE_009616
	RTL

CODE_0097A8:
	JSR.w CODE_00B241
	RTL

CODE_0097AC:
	JSR.w CODE_009616
	RTL

CODE_0097B0:
	JSL.l CODE_028EFA
	RTS

CODE_0097B5:
	JSL.l CODE_028F4C
	RTS

CODE_0097BA:
	JSL.l CODE_028F6A
	RTS

CODE_0097BF:
	JSL.l CODE_028F84
	RTS

CODE_0097C4:
	JSL.l CODE_028FB8
	RTS

CODE_0097C9:
	JSL.l CODE_028FED
	RTS

CODE_0097CE:
	JSL.l CODE_029009
	RTS

CODE_0097D3:
	JSL.l CODE_02902E
	RTS

CODE_0097D8:
	JSR.w CODE_00C951
	RTL

CODE_0097DC:
	JSR.w CODE_00C960
	RTL

CODE_0097E0:
	JSR.w CODE_00AC88
	RTL

CODE_0097E4:
	REP.b #$30
	TSX
	STX.w $10B8
	JSR.w CODE_009847
	LDA.w $01B9
	BNE.b CODE_0097F5
	JSR.w CODE_0098AA
CODE_0097F5:
	REP.b #$30
	STZ.w $01BB
CODE_0097FA:
	REP.b #$30
	JSR.w CODE_009847
	JSR.w CODE_00A0D3
	JSR.w CODE_009827
	REP.b #$30
	LDA.w $01BB
	INC
	AND.w #$0003
	STA.w $01BB
	BNE.b CODE_009819
	JSR.w CODE_00A227
	JSR.w CODE_009827
CODE_009819:
	JSR.w CODE_009A90
	JSR.w CODE_009827
	JSR.w CODE_009A05
	JSR.w CODE_009827
	BRA.b CODE_0097FA

CODE_009827:
	PHP
	REP.b #$30
	PHA
	PHX
	PHY
	LDA.b $56
	AND.w #$D0C0
	BNE.b CODE_009836
	BEQ.b CODE_00983E
CODE_009836:
	INC.w $01B9
	LDX.w $10B8
	TXS
	RTS

CODE_00983E:
	PLY
	PLX
	PLA
	PLP
	RTS

CODE_009843:
	JSR.w CODE_009847
	RTL

CODE_009847:
	SEP.b #$20
	STZ.w $420B
	STZ.w $420C
	LDA.b #$1F
	STA.w $212C
	STA.w $212E
	STZ.w $2123
	STZ.w $2124
	STZ.w $2125
	LDA.b #$80
	STA.w $2100
	LDA.b #$07
	STA.w $2105
	JSL.l CODE_029573
	JSR.w CODE_009898
	STZ.w $01B5
	LDA.b #$45
	ASL
	STA.w $01B7
	LDA.b #$63
	STA.w $2101
	LDA.b #$10
	STA.w $13A4
	LDA.b #$20
	STA.w $13A6
	LDA.b #$01
	STA.w $0102
	STA.w $0104
	LDA.b #$20
	STZ.b $2E
	STZ.b $2F
	RTS

CODE_009898:
	PHP
	REP.b #$10
	SEP.b #$20
	LDX.w #$0004
CODE_0098A0:
	LDA.w DATA_01983A+$0D,x
	STA.b $06,x
	DEX
	BPL.b CODE_0098A0
	PLP
	RTS

CODE_0098AA:
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	LDA.b #$81
	STA.w $4200
	REP.b #$20
	LDA.w #DATA_03ABB2
	STA.b $78
	LDA.w #DATA_03ABB2>>16
	STA.b $7A
	LDA.w #$7EBA72
	STA.b $64
	LDA.w #DATA_039FBA
	STA.b $68
	SEP.b #$20
	LDA.b #$7EBA72>>16
	STA.b $66
	LDA.b #DATA_039FBA>>16
	STA.b $6A
	LDA.b #$01
	STA.b $6C
	STA.b $70
	JSL.l CODE_029ED9
	JSL.l CODE_029F13
	REP.b #$20
	LDA.w #DATA_01D8D7
	JSL.l CODE_029914
	JSL.l CODE_029F3D
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_SoftwareCreationsLogo
	LDX.w #$6600
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_SplashScreenAndSpiderManLogo
	LDX.w #$0000
	JSL.l CODE_028000
	LDA.w #DATA_0180C8
	JSR.w CODE_009616
	REP.b #$20
	LDA.w #DATA_0180F0
	JSR.w CODE_009616
	LDX.b $20
	LDA.w #DATA_019BCE
	STA.w $05C4,x
	LDA.w #$FF94
	STA.w $04B0,x
	LDA.w #$0120
	STA.w $053A,x
	LDA.w #DATA_0180F0
	JSR.w CODE_009616
	LDX.b $20
	LDA.w #DATA_019BBC
	STA.w $05C4,x
	LDA.w #$FFA0
	STA.w $04B0,x
	LDA.w #$0114
	STA.w $053A,x
	LDA.w #DATA_0180F0
	JSR.w CODE_009616
	LDX.b $20
	LDA.w #DATA_019BAA
	STA.w $05C4,x
	LDA.w #$FFAC
	STA.w $04B0,x
	LDA.w #$0108
	STA.w $053A,x
	SEP.b #$20
	LDA.b #$FB
	STA.w $108C
	JSL.l CODE_029B0C
	JSL.l CODE_0295A6
	LDA.b #$0F
	STA.w $2100
CODE_00997C:
	JSL.l CODE_0295A6
	JSL.l CODE_029B62
	REP.b #$20
	LDA.w $108C
	SEC
	SBC.w #$0008
	STA.w $108C
	CMP.w #$0043
	BNE.b CODE_00997C
	JSL.l CODE_029E89
	REP.b #$20
	STZ.b $0E
CODE_00999D:
	JSL.l CODE_0295A6
	JSR.w CODE_0099D1
	JSL.l CODE_02A044
	REP.b #$20
	INC.b $0E
	LDA.b $0E
	CMP.w #$0030
	BNE.b CODE_00999D
	JSL.l CODE_0294A9
	REP.b #$20
	LDA.w #$0002
	JSL.l CODE_02995B
	JSL.l CODE_0299A8
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	LDA.b #$81
	STA.w $4200
	RTS

CODE_0099D1:
	REP.b #$30
	LDA.b $0E
	LDX.w #$0006
	CMP.w #$0010
	BCC.b CODE_0099EE
	LDX.w #$0004
	CMP.w #$0020
	BCC.b CODE_0099EE
	LDX.w #$0002
	CMP.w #$0030
	BCC.b CODE_0099EE
	RTS

CODE_0099EE:
	REP.b #$20
	LDA.w $04B0,x
	CLC
	ADC.w #$0008
	STA.w $04B0,x
	LDA.w $053A,x
	SEC
	SBC.w #$0008
	STA.w $053A,x
	RTS

CODE_009A05:
	JSL.l CODE_02A504
	SEP.b #$20
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$25
	STA.w $108C
	JSL.l CODE_029B0C
	SEP.b #$20
	LDA.b #$80
	STA.w $210D
	STA.w $109C
	LDA.b #$FE
	STA.w $210D
	STA.w $109D
	LDA.b #$30
	STA.w $210E
	STA.w $109E
	LDA.b #$08
	STA.w $210E
	STA.w $109F
	STZ.b $AC
	STZ.b $AD
	JSL.l CODE_0295F1
	JSL.l CODE_0295A6
	JSL.l CODE_029B62
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	STA.w $136C
CODE_009A56:
	JSL.l CODE_0295A6
	REP.b #$20
	LDA.w $109C
	CLC
	ADC.w #$0008
	STA.w $109C
	CMP.w #$0490
	BEQ.b CODE_009A8F
	SEP.b #$20
	LDA.w $109C
	STA.w $210D
	LDA.w $109D
	STA.w $210D
	LDA.w $109E
	STA.w $210E
	LDA.w $109F
	STA.w $210E
	JSL.l CODE_02A044
	JSR.w CODE_009827
	JMP.w CODE_009A56

CODE_009A8F:
	RTS

CODE_009A90:
	JSL.l CODE_02A504
	REP.b #$20
	LDA.w #DATA_01DA27
	JSL.l CODE_029914
	JSL.l CODE_029F3D
	JSL.l CODE_02953D
	JSL.l CODE_029573
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_SpiderManLogo
	LDX.w #$7000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_SplashScreenAndSpiderManLogo
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #DATA_018118
	JSR.w CODE_009616
	SEP.b #$20
	LDA.b #$63
	STA.w $2101
	LDA.b #$10
	STA.w $13A4
	LDA.b #$20
	STA.w $13A6
	LDA.b #$FF
	STA.w $108C
	JSL.l CODE_029B0C
	LDA.b #$B4
	STA.w $108E
	JSL.l CODE_029B62
	STZ.b $82
CODE_009AF7:
	JSL.l CODE_0295A6
	JSL.l CODE_029B62
	JSR.w CODE_009B79
	JSL.l CODE_02A044
	SEP.b #$20
	LDA.b #$0F
	INC.b $82
	BMI.b CODE_009B13
	LDA.b $82
	LSR
	LSR
	LSR
CODE_009B13:
	LDA.b #$0E
	STA.w $2100
	JSR.w CODE_009827
	DEC.w $108E
	DEC.w $108C
	LDA.w $108C
	CMP.b #$4B
	BNE.b CODE_009AF7
	JSL.l CODE_029E89
	REP.b #$20
	LDA.w #$0005
	JSL.l CODE_02995B
	JSL.l CODE_02953D
	JSL.l CODE_029573
CODE_009B3D:
	JSL.l CODE_0295A6
	JSL.l CODE_029B62
	JSL.l CODE_02A044
	JSR.w CODE_009827
	SEP.b #$20
	DEC.w $108E
	DEC.w $108C
	LDA.w $108C
	CMP.b #$01
	BNE.b CODE_009B3D
	SEP.b #$20
	LDA.b #$78
	STA.b $82
CODE_009B61:
	JSL.l CODE_0295A6
	LDA.b $82
	LSR
	LSR
	LSR
	STA.w $2100
	JSL.l CODE_02A044
	JSR.w CODE_009827
	DEC.b $82
	BNE.b CODE_009B61
	RTS

CODE_009B79:
	PHP
	SEP.b #$30
	LDA.w $108E
	CMP.b #$10
	BEQ.b CODE_009B85
	BCS.b CODE_009BA3
CODE_009B85:
	LDY.b #$7F
	JSL.l CODE_02946D
	SEC
	SBC.b #$78
	STA.w $053A
	LDA.w $108E
	LDY.b #$7F
	JSL.l CODE_029474
	REP.b #$20
	CLC
	ADC.w #$0110
	STA.w $04B0
CODE_009BA3:
	PLP
	RTS

CODE_009BA5:
	PHP
	SEP.b #$30
	LDA.b #$F0
	STA.w $2100
	LDA.b #$10
	STA.w $212C
	STZ.w $0102
	STZ.w $0104
	STZ.w $136E
	JSL.l CODE_0295A6
	JSL.l CODE_02953D
	JSL.l CODE_02A044
	JSL.l CODE_029F7C
	SEP.b #$30
	LDA.b #$01
	STA.w $0102
	STA.w $0104
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #$0014
	ASL
	STA.w $01B7
	STZ.w $01B5
	STZ.b $68
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	LDA.w DATA_01D4EE,x
	STA.b $64
	LDA.w #$0004
	STA.b $68
	JSL.l CODE_02933D
	REP.b #$30
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w (DATA_009CE7,x)
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_WellDoneText
	LDX.w #$0080
	JSL.l CODE_028000
	JSL.l CODE_02A044
	JSL.l CODE_0295A6
	SEP.b #$20
	JSL.l CODE_029986
	PLP
	RTS

CODE_009C1F:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_CyclopsPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_CyclopsPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #DATA_0181E0
	JSR.w CODE_009616
	RTS

CODE_009C47:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_StormPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_StormPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #DATA_018208
	JSR.w CODE_009616
	RTS

CODE_009C6F:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_WolverinePortrait
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_WolverinePortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #DATA_018230
	JSR.w CODE_009616
	RTS

CODE_009C97:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_GambitPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_GambitPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #DATA_018258
	JSR.w CODE_009616
	RTS

CODE_009CBF:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_SpiderManPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_SpiderManPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #DATA_018280
	JSR.w CODE_009616
	RTS

DATA_009CE7:
	dw $0000
	dw CODE_009C47
	dw CODE_009C47
	dw CODE_009C1F
	dw CODE_009C1F
	dw CODE_009C6F
	dw CODE_009C6F
	dw CODE_009CBF
	dw CODE_009CBF
	dw CODE_009CBF
	dw CODE_009CBF
	dw CODE_009C97
	dw CODE_009C97
	dw CODE_009C1F
	dw CODE_009C47
	dw CODE_009C1F
	dw CODE_009C6F
	dw CODE_009CBF
	dw CODE_009C97

CODE_009D0D:
	PHP
	SEP.b #$30
	LDA.b #$F0
	STA.w $2100
	LDA.b #$10
	STA.w $212C
	STZ.w $0102
	STZ.w $0104
	STZ.w $136E
	JSL.l CODE_0295A6
	JSL.l CODE_02953D
	JSL.l CODE_02A044
	JSL.l CODE_029F7C
	SEP.b #$30
	LDA.b #$01
	STA.w $0102
	STA.w $0104
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #$0014
	ASL
	STA.w $01B7
	STZ.w $01B5
	STZ.b $68
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	CPX.w #!Define_SXAR_LevelID_Storm3
	BCS.b CODE_009D8E
	LDA.w DATA_01D55B,x
	STA.b $64
	LDA.w #$0004
	STA.b $68
	JSL.l CODE_02933D
	REP.b #$30
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	JSR.w (DATA_009CE7,x)
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_WellDoneText
	LDX.w #$0080
	JSL.l CODE_028000
	JSL.l CODE_02A044
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	JSR.w CODE_00A1E3
CODE_009D8E:
	PLP
	RTS

CODE_009D90:
	LDA.w !RAM_SXAR_CharSelect_CurrentScreenLo
	CMP.w #!Define_SXAR_CharSelect_Cyclops
	BEQ.b CODE_009DAC
	CMP.w #!Define_SXAR_CharSelect_SpiderMan
	BEQ.b CODE_009DD7
	CMP.w #!Define_SXAR_CharSelect_Gambit
	BEQ.b CODE_009DD2
	CMP.w #!Define_SXAR_CharSelect_Storm
	BEQ.b CODE_009DCD
	CMP.w #!Define_SXAR_CharSelect_Wolverine
	BEQ.b CODE_009DC8
CODE_009DAC:
	LDX.w #!Define_SXAR_LevelID_Cyclops1
	LDA.w !RAM_SXAR_Global_LevelClearFlags,x
	BEQ.b CODE_009DE8
	INX
	INX
	LDA.w !RAM_SXAR_Global_LevelClearFlags,x
	BNE.b CODE_009DE6
	LDX.w #!Define_SXAR_LevelID_Cyclops2
	LDA.w !RAM_SXAR_Global_LevelClearFlags,x
	BEQ.b CODE_009DE8
	LDX.w #!Define_SXAR_LevelID_Cyclops2Boss
	BRA.b CODE_009DE8

CODE_009DC8:
	LDX.w #!Define_SXAR_LevelID_Wolverine1
	BRA.b CODE_009DDA

CODE_009DCD:
	LDX.w #!Define_SXAR_LevelID_Storm1
	BRA.b CODE_009DDA

CODE_009DD2:
	LDX.w #!Define_SXAR_LevelID_Gambit1
	BRA.b CODE_009DDA

CODE_009DD7:
	LDX.w #!Define_SXAR_LevelID_SpiderMan1
CODE_009DDA:
	LDA.w !RAM_SXAR_Global_LevelClearFlags,x
	BEQ.b CODE_009DE8
	INX
	INX
	LDA.w !RAM_SXAR_Global_LevelClearFlags,x
	BEQ.b CODE_009DE8
CODE_009DE6:
	CLC
	RTS

CODE_009DE8:
	STX.w !RAM_SXAR_Global_CurrentLevelLo
	SEC
	RTS

CODE_009DED:
	PHP
	JSL.l CODE_028EB6
	REP.b #$20
	JSL.l CODE_028D8F
	JSR.w CODE_009847
	REP.b #$30
	JSR.w CODE_009E11
CODE_009E00:
	JSR.w CODE_009E7D
	BCC.b CODE_009E00
	LDA.w $159A
	BNE.b CODE_009E0F
	JSR.w CODE_009D90
	BCC.b CODE_009E00
CODE_009E0F:
	PLP
	RTS

CODE_009E11:
	REP.b #$30
	STZ.w $0102
	STZ.w $0104
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Layer1_CharacterBioFont
	LDX.w #$2000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Credits
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_Briefing
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_LargeFont
	LDX.w #$7000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #$0201
	JSL.l CODE_028B1F
	JSL.l CODE_02A4AB
	REP.b #$30
	LDA.w #$0000
	LDX.w #$07FE
CODE_009E6E:
	STA.l $7F0000,x
	DEX
	DEX
	BPL.b CODE_009E6E
	INC.w !RAM_SXAR_CharSelect_CurrentScreenLo
	JSR.w CODE_009EFE
	RTS

CODE_009E7D:
	SEP.b #$20
	LDA.b #$F0
	STA.w $2100
	LDA.b #$F1
	STA.w $4200
	REP.b #$30
	JSR.w CODE_0088F1
	STZ.w $0102
	STZ.w $0104
	JSL.l CODE_02953D
	JSL.l CODE_029573
	JSR.w CODE_009FED
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_CharacterSelect
	LDX.w #$00D0
	JSL.l CODE_028000
	LDA.w #$0001
	STA.w $0102
	STA.w $0104
	LDA.w #$0010
	STA.w $04B6
	JSR.w CODE_009F6F
	JSR.w CODE_009F1E
	JSL.l CODE_02A044
	JSL.l CODE_0295A6
	JSL.l CODE_029424
	LDA.w $159A
	BNE.b CODE_009EFC
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	REP.b #$30
CODE_009EDD:
	JSL.l CODE_0295A6
	LDA.b $56
	BIT.w #$2000
	BNE.b CODE_009EF3
	BIT.w #$1000
	BNE.b CODE_009EFC
	JSL.l CODE_02A044
	BRA.b CODE_009EDD

CODE_009EF3:
	JSR.w CODE_009EFE
	JSL.l CODE_02A42A
	CLC
	RTS

CODE_009EFC:
	SEC
	RTS

CODE_009EFE:
	STZ.b $8C
CODE_009F00:
	DEC.w !RAM_SXAR_CharSelect_CurrentScreenLo
	BNE.b CODE_009F0B
	LDA.w #!Define_SXAR_CharSelect_Storm
	STA.w !RAM_SXAR_CharSelect_CurrentScreenLo
CODE_009F0B:
	INC.b $8C
	LDA.b $8C
	CMP.w #$000A
	BEQ.b CODE_009F1A
	JSR.w CODE_009D90
	BCC.b CODE_009F00
	RTS

CODE_009F1A:
	DEC.w $159A
	RTS

CODE_009F1E:
	LDA.w !RAM_SXAR_CharSelect_CurrentScreenLo
	ASL
	TAX
	LDA.w DATA_01C36E,x
	STA.b $B6
	JSR.w CODE_009F37
	LDA.b $B6
	CLC
	ADC.w #$0006
	STA.b $B6
	JSR.w CODE_009F37
	RTS

CODE_009F37:
	LDX.b $B6
	LDA.w DATA_01C332,x
	LDA.w #DATA_0181B8
	JSR.w CODE_009616
	LDX.b $B6
	LDY.b $20
	LDA.w DATA_01C332,x
	STA.w $04B0,y
	LDA.w DATA_01C332+$02,x
	STA.w $053A,y
	LDA.w DATA_01C332+$04,x
	STA.b $8C
	LDA.b ($8C)
	BEQ.b CODE_009F6E
	CMP.w #$FFF0
	BEQ.b CODE_009F68
	LDA.w #DATA_01AA22
	STA.w $05C4,y
	BRA.b CODE_009F6E

CODE_009F68:
	LDA.w #DATA_01AA24
	STA.w $05C4,y
CODE_009F6E:
	RTS

CODE_009F6F:
	REP.b #$30
	LDA.w !RAM_SXAR_CharSelect_CurrentScreenLo
	ASL
	TAX
	LDA.w DATA_01CC13,x
	LDX.w #$0152
	LDY.w #$1400
	JSR.w CODE_009FBE
	LDA.w #DATA_01C3A2
	LDX.w #$0152
	LDY.w #$0000
	JSR.w CODE_009FBE
	LDA.w #DATA_01C37A
	LDX.w #$0612
	LDY.w #$0000
	JSR.w CODE_009FBE
	LDA.w #DATA_01C385
	LDX.w #$0686
	LDY.w #$0400
	JSR.w CODE_009FBE
	LDA.w #$0008
	STA.b $68
	LDA.w !RAM_SXAR_CharSelect_CurrentScreenLo
	ASL
	TAX
	LDA.w DATA_01CC1F,x
	STA.b $64
	JSL.l CODE_02933D
	RTS

CODE_009FBA:
	JSR.w CODE_009FBE
	RTL

CODE_009FBE:
	STA.b $8C
	STY.b $64
	STX.b $8E
	LDY.w #$0000
CODE_009FC7:
	LDA.b ($8C),y
	INY
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b CODE_009FEC
	CMP.w #$00FE
	BEQ.b CODE_009FE1
	ORA.b $64
	STA.l $7F0000,x
	INX
	INX
	BRA.b CODE_009FC7

CODE_009FE1:
	LDA.b $8E
	CLC
	ADC.w #$0040
	STA.b $8E
	TAX
	BRA.b CODE_009FC7

CODE_009FEC:
	RTS

CODE_009FED:
	LDA.w !RAM_SXAR_CharSelect_CurrentScreenLo
	ASL
	TAX
	JMP.w (DATA_009FF5,x)

DATA_009FF5:
	dw $0000
	dw CODE_00A001
	dw CODE_00A02B
	dw CODE_00A055
	dw CODE_00A07F
	dw CODE_00A0A9

CODE_00A001:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_CyclopsPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_CyclopsPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	LDX.w #$0006
	LDA.w #DATA_0181E0
	JMP.w CODE_0096EA

CODE_00A02B:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_WolverinePortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_WolverinePortrait
	LDX.w #$0080
	JSL.l CODE_028000
	LDX.w #$0006
	LDA.w #DATA_018230
	JMP.w CODE_0096EA

CODE_00A055:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_SpiderManPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_SpiderManPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	LDX.w #$0006
	LDA.w #DATA_018280
	JMP.w CODE_0096EA

CODE_00A07F:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_GambitPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_GambitPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	LDX.w #$0006
	LDA.w #DATA_018258
	JMP.w CODE_0096EA

CODE_00A0A9:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_StormPortrait
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_StormPortrait
	LDX.w #$0080
	JSL.l CODE_028000
	LDX.w #$0006
	LDA.w #DATA_018208
	JMP.w CODE_0096EA

CODE_00A0D3:
	PHP
	REP.b #$30
	JSL.l CODE_02A504
	REP.b #$30
	JSL.l CODE_028EB6
	REP.b #$30
	JSL.l CODE_028D8F
	JSR.w CODE_009847
	REP.b #$30
	JSR.w CODE_00A132
	JSR.w CODE_00A20B
	JSL.l CODE_02A044
	JSR.w CODE_00A206
	LDA.w #DATA_018140
	JSR.w CODE_009616
	LDA.w #$0020
	STA.w $04B2
	LDA.w #$0080
	STA.w $053C
	LDA.w #DATA_018168
	JSR.w CODE_009616
	LDA.w #$0030
	STA.w $04B4
	LDA.w #$00C0
	STA.w $053E
	LDA.w #DATA_01992A
	JSR.w CODE_009616
	JSL.l CODE_02A044
	JSR.w CODE_00A1E3
	SEP.b #$20
	LDA.b #$07
	STA.w $2105
	PLP
	RTS

CODE_00A132:
	JSR.w CODE_0088F1
	JSL.l CODE_02953D
	JSL.l CODE_029573
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Layer1_TitleScreenCharacters
	LDX.w #$2000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Tilemap_Layer1_TitleScreenCharacters
	LDX.w #$0040
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_XMenLogo
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_SpiderManLogo
	LDX.w #$7000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_TitleScreenCharacters
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_TitleScreenXMenLogo
	LDX.w #$00A0
	JSL.l CODE_028000
	JSL.l CODE_02A4AB
	REP.b #$30
	LDA.w #DATA_018118
	JSR.w CODE_009616
	LDA.w #$0020
	STA.w $04B0
	LDA.w #$0010
	STA.w $053A
	SEP.b #$20
	LDA.b #$63
	STA.w $2101
	LDA.b #$10
	STA.w $13A4
	LDA.b #$20
	STA.w $13A6
	REP.b #$30
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	REP.b #$30
	RTS

CODE_00A1E3:
	PHP
	REP.b #$30
	LDX.w #$00B4
CODE_00A1E9:
	JSL.l CODE_0295A6
	LDA.b $56
	BIT.w #$9000
	BNE.b CODE_00A1F7
	DEX
	BNE.b CODE_00A1E9
CODE_00A1F7:
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	REP.b #$20
	PLP
	RTS

CODE_00A206:
	LDX.w #$0028
	BRA.b CODE_00A20E

CODE_00A20B:
	LDX.w #$00B4
CODE_00A20E:
	PHP
	REP.b #$30
CODE_00A211:
	JSL.l CODE_0295A6
	LDA.b $56
	BIT.w #$9000
	BNE.b CODE_00A21F
	DEX
	BNE.b CODE_00A211
CODE_00A21F:
	JSL.l CODE_0295A6
	REP.b #$20
	PLP
	RTS

CODE_00A227:
	PHP
	JSL.l CODE_02A504
	JSL.l CODE_028EB6
	REP.b #$30
	JSL.l CODE_028D8F
	JSR.w CODE_009847
	REP.b #$30
	JSR.w CODE_00A24D
	LDX.w #$0258
	JSR.w CODE_00A20E
	SEP.b #$20
	LDA.b #$07
	STA.w $2105
	PLP
	RTS

CODE_00A24D:
	JSR.w CODE_0088F1
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Layer1_CharacterBioFont
	LDX.w #$2000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Credits
	LDX.w #$0000
	JSL.l CODE_028000
	JSL.l CODE_02A4AB
	LDA.w #DATA_039BFC
	LDX.w #$00C0
	LDY.w #$1400
	JSL.l CODE_02A477
	LDA.w #DATA_039C75
	LDX.w #$0200
	LDY.w #$0000
	JSL.l CODE_02A477
	LDA.w #DATA_039E07
	LDX.w #$0200
	LDY.w #$0400
	JSL.l CODE_02A477
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	JSL.l CODE_0295A6
	JSL.l CODE_029424
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	REP.b #$30
	RTS

CODE_00A2B9:
	PHP
	REP.b #$30
	STA.w $1590
	JSL.l CODE_02A504
	JSR.w CODE_0088F1
	JSL.l CODE_028EB6
	REP.b #$30
	JSL.l CODE_028D8F
	JSR.w CODE_009847
	REP.b #$30
	LDY.w #$7F1000
	STZ.b $64
	LDA.w #$7F1000>>16
	STA.b $66
	LDA.w #$0000
	JSR.w CODE_00B4B6
	JSR.w CODE_00A2F2
	JSL.l CODE_02A436
	JSL.l CODE_0299A8
	PLP
	RTS

CODE_00A2F2:
	REP.b #$30
	JSL.l CODE_02953D
	JSL.l CODE_029573
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Layer1_ArcadeBriefingCutscene
	LDX.w #$2000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w $1590
	BNE.b CODE_00A357
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Layer1_ArcadeBriefingCutscene1
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Tilemap_Layer2_TopRowsOfArcadeBriefingCutscene
	LDX.w #$0420
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Tilemap_Layer2_ArcadeBriefingCutscene1
	LDX.w #$0480
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_Briefing
	JSL.l CODE_028000
	BRA.b CODE_00A399

CODE_00A357:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Layer1_ArcadeBriefingCutscene2
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Tilemap_Layer2_TopRowsOfArcadeBriefingCutscene
	LDX.w #$0420
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Tilemap_Layer2_ArcadeBriefingCutscene2
	LDX.w #$0480
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_Ending
	JSL.l CODE_028000
CODE_00A399:
	JSR.w CODE_0082A4
	JSL.l CODE_02A4AB
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	LDA.b #$13
	STA.w $212C
	STA.w $212E
	JSL.l CODE_0295A6
	JSL.l CODE_029986
	REP.b #$30
	RTS

CODE_00A3BA:
	LDA.w $0762,x
	SEC
	SBC.b $2E
	CMP.w #$FFF0
	BCS.b CODE_00A3CA
	CMP.w #$0110
	BCS.b CODE_00A3DC
CODE_00A3CA:
	LDA.w $07EC,x
	SEC
	SBC.b $30
	CMP.w #$FFF0
	BCS.b CODE_00A3DA
	CMP.w #$0100
	BCS.b CODE_00A3DC
CODE_00A3DA:
	CLC
	RTS

CODE_00A3DC:
	SEC
	RTS

CODE_00A3DE:
	PHP
	REP.b #$30
	LDX.w #$0000
CODE_00A3E4:
	LDA.w $0426,x
	BEQ.b CODE_00A3FB
	STX.b $2C
	JSR.w CODE_00A414
	BCC.b CODE_00A3FB
	JSR.w CODE_00A404
	LDX.b $2C
	INC.w $0F78,x
	INC.w $1002,x
CODE_00A3FB:
	INX
	INX
	CPX.w $01B7
	BNE.b CODE_00A3E4
	PLP
	RTS

CODE_00A404:
	LDA.w $0426,x
	ASL
	TAX
	LDA.l DATA_039AA0,x
	STA.b $8C
	LDX.b $2C
	JMP.w ($008C)

CODE_00A414:
	LDA.w $1357
	CLC
	ADC.w #$0002
	CMP.w $01B7
	BCC.b CODE_00A423
	LDA.w #$0002
CODE_00A423:
	STA.w $1357
	CPX.w $1357
	BNE.b CODE_00A461
	LDA.b $2E
	SEC
	SBC.w #$0040
	BPL.b CODE_00A436
	LDA.w #$0010
CODE_00A436:
	CMP.w $0762,x
	BEQ.b CODE_00A43D
	BCS.b CODE_00A463
CODE_00A43D:
	CLC
	ADC.w #$01C0
	CMP.w $0762,x
	BCC.b CODE_00A463
	LDA.b $30
	SEC
	SBC.w #$0040
	BPL.b CODE_00A451
	LDA.w #$0000
CODE_00A451:
	CMP.w $07EC,x
	BEQ.b CODE_00A458
	BCS.b CODE_00A463
CODE_00A458:
	CLC
	ADC.w #$01C0
	CMP.w $07EC,x
	BCC.b CODE_00A463
CODE_00A461:
	SEC
	RTS

CODE_00A463:
	LDA.w $0A9E,x
	BIT.w #$0040
	BNE.b CODE_00A461
	JSR.w CODE_00AC88
	CLC
	RTS

CODE_00A470:							; Note: Cyclops sprite
	JSR.w CODE_00B14B
	JSR.w CODE_00AA1A
	JSR.w CODE_00A65B
	JSR.w CODE_00ACBA
	JSR.w CODE_00A5FE
	JSR.w CODE_00AE99
	JSR.w CODE_00AD1B
	JSR.w CODE_00B13F
	JSR.w CODE_00A4AB
	JSR.w CODE_00A493
	JSL.l CODE_028C4D
	RTS

CODE_00A493:
	LDA.w $1320
	CMP.w $1548
	STA.w $1548
	BEQ.b CODE_00A4AA
	BIT.w #$0001
	BEQ.b CODE_00A4AA
	LDA.w #$1602
	JSL.l CODE_028B1F
CODE_00A4AA:
	RTS

CODE_00A4AB:
	LDA.w #$0000
	LDY.w $0D50,x
	CPY.w #$0000
	BEQ.b CODE_00A4D3
	CPY.w #$0018
	BEQ.b CODE_00A4D3
	CPY.w #$000C
	BEQ.b CODE_00A4D3
	LDA.w #$0002
	CPY.w #$0021
	BEQ.b CODE_00A4D3
	LDA.w #$800A
	CPY.w #$0020
	BEQ.b CODE_00A4D3
	JMP.w CODE_00A56C

CODE_00A4D3:
	STA.b $AC
	LDA.b $56,x
	AND.w #$4000
	BNE.b CODE_00A4DF
	JMP.w CODE_00A56C

CODE_00A4DF:
	LDA.b $14
	BNE.b CODE_00A4E6
	JMP.w CODE_00A56C

CODE_00A4E6:
	LDA.w $0B28,x
	CMP.w #$2000
	BCS.b CODE_00A4F6
	LDA.w $0F78
	AND.w #$000F
	BNE.b CODE_00A56C
CODE_00A4F6:
	LDA.w $0428
	BNE.b CODE_00A56C
	TYA
	ASL
	TAY
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00A50F
	LDA.w $0762,x
	CLC
	ADC.w DATA_01DB24,y
	BRA.b CODE_00A516

CODE_00A50F:
	LDA.w $0762,x
	SEC
	SBC.w DATA_01DB24,y
CODE_00A516:
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w DATA_01DB68,y
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4004
	ORA.w #$2001
	ORA.b $AC
	STA.b $70
	LDX.w #$0002
	LDA.w #DATA_018CD2
	JSR.w CODE_0096EA
	LDA.b $20
	BMI.b CODE_00A56C
	LDA.b $AC
	BEQ.b CODE_00A54B
	LDA.w #DATA_01A29C
	STA.w $05C4,x
	LDA.w #$0010
	STA.w $0900,x
CODE_00A54B:
	LDA.w #$0F02
	JSL.l CODE_028B1F
	LDX.w #$0000
	LDA.w $14F2
	BEQ.b CODE_00A56C
	DEC.w $14F2
	BNE.b CODE_00A562
	JSR.w CODE_00D8E3
CODE_00A562:
	LDY.b $20
	BMI.b CODE_00A56C
	LDA.w #$3600
	STA.w $0C3C,y
CODE_00A56C:
	RTS

CODE_00A56D:							; Note: Wolverine sprite code.
	JSR.w CODE_00B14B
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00A5A7
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.w #$0011
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0010
	STA.b $96
	JSR.w CODE_00B228
	ORA.w $1308
	STA.w $1308
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0018
	STA.b $96
	JSR.w CODE_00B228
	ORA.w $1308
	STA.w $1308
	BRA.b CODE_00A5D4

CODE_00A5A7:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CLC
	ADC.w #$0010
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0010
	STA.b $96
	JSR.w CODE_00B228
	ORA.w $1310
	STA.w $1310
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0018
	STA.b $96
	JSR.w CODE_00B228
	ORA.w $1310
	STA.w $1310
CODE_00A5D4:
	JSR.w CODE_00AA1A
	JSR.w CODE_00A65B
	JSR.w CODE_00A6A0
	JSR.w CODE_00ACBA
	JSR.w CODE_00A5FE
	JSR.w CODE_00AE91
	JSR.w CODE_00AD1B
	JSR.w CODE_00B13F
	JSR.w CODE_00A493
	JSL.l CODE_028C4D
	JSR.w CODE_00A6F2
	JSL.l CODE_028BCD
	JSR.w CODE_00FEFA
	RTS

CODE_00A5FE:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm3
	BCC.b CODE_00A65A
	LDA.w $159E
	BNE.b CODE_00A61F
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CMP.w #$07C4
	BCC.b CODE_00A65A
	STZ.w $0D50,x
	STZ.w $0DDA,x
	STZ.w $0CC6,x
	INC.w $0CC6,x
CODE_00A61F:
	STZ.b $56
	INC.w $0CC6,x
	INC.w $159E
	LDA.w $159E
	CMP.w #$0050
	BEQ.b CODE_00A63B
	CMP.w #$00A0
	BEQ.b CODE_00A649
	CMP.w #$00F0
	BEQ.b CODE_00A657
	BRA.b CODE_00A65A

CODE_00A63B:
	LDA.w #$000C
	STA.w $0D50,x
	LDA.w #$000C
	STA.w $0DDA,x
	BRA.b CODE_00A65A

CODE_00A649:
	LDA.w #$0017
	STA.w $0D50,x
	LDA.w #$0017
	STA.w $0DDA,x
	BRA.b CODE_00A65A

CODE_00A657:
	INC.w $1522
CODE_00A65A:
	RTS

CODE_00A65B:
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_00A670
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_00A670
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BEQ.b CODE_00A670
CODE_00A66F:
	RTS

CODE_00A670:
	LDA.w #$0128
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BEQ.b CODE_00A67A
	BCS.b CODE_00A66F
CODE_00A67A:
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STZ.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
CODE_00A680:
	LDA.w $0A9E
	BIT.w #$0100
	BNE.b CODE_00A69F
	ORA.w #$0120
	STA.w $0A9E
	STZ.w $0B28
	STZ.w $0F78
	PHX
	LDX.w #$0000
	LDA.w #$8000
	JSR.w CODE_00ABE0
	PLX
CODE_00A69F:
	RTS

CODE_00A6A0:
	LDA.w $1320
	BIT.w #$0080
	BEQ.b CODE_00A6E7
	LDA.w $0762,x
	STA.b $68
	LDA.w #$0000
	CLC
	ADC.w $07EC,x
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_009616
	LDA.w #$0D02
	JSL.l CODE_028B1F
	LDA.w $0762,x
	SEC
	SBC.w #$0004
	STA.b $94
	LDA.w $07EC,x
	CLC
	ADC.w #$0001
	STA.b $96
	JSR.w CODE_00B236
	CMP.w #$00FF
	BEQ.b CODE_00A6E1
	INC.b $8C
	INC.b $8C
CODE_00A6E1:
	LDA.w #$0000
	STA.b [$8C]
CODE_00A6E6:
	RTS

CODE_00A6E7:
	BIT.w #$0010
	BEQ.b CODE_00A6E6
	STZ.w $0A14
	JMP.w CODE_00A680

CODE_00A6F2:
	LDA.b $56,x
	AND.w #$0080
	BEQ.b CODE_00A716
	LDA.b $5A,x
	AND.w #$0080
	BNE.b CODE_00A716
	LDA.b $14
	BEQ.b CODE_00A716
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	EOR.w #$FFFF
	STA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BEQ.b CODE_00A716
	LDA.w #$1202
	JSL.l CODE_028B1F
CODE_00A716:
	RTS

ADDR_00A717:
	STZ.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	RTS

CODE_00A71B:
	LDA.w $1002,x
	BEQ.b CODE_00A723
	JMP.w CODE_00AC88

CODE_00A723:
	RTS

CODE_00A724:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BNE.b CODE_00A737
	LDA.w $07EC,x
	STA.w $15A6
	LDA.w #$0800
	BRA.b CODE_00A73A

CODE_00A737:
	LDA.w #$1000
CODE_00A73A:
	STA.b $64
	LDA.w #$0520
	STA.b $66
	LDA.w #$0001
	STA.b $68
	LDA.w #$0001
	STA.b $6C
	LDY.w #$0004
	JSR.w CODE_00AB46
	BCS.b CODE_00A756
CODE_00A753:
	JMP.w CODE_00AC88

CODE_00A756:
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BNE.b CODE_00A794
	LDA.w $05C4,x
	CMP.w #DATA_019C7C
	BEQ.b CODE_00A78D
	LDA.w $0426,y
	CMP.w #$00A6
	BEQ.b CODE_00A779
	CMP.w #$00A7
	BEQ.b CODE_00A779
	LDA.w #$1302
	JSL.l CODE_028B1F
	BRA.b CODE_00A794

CODE_00A779:
	LDA.w $15A8
	BNE.b CODE_00A78B
	LDA.w #$000C
	STA.w $15A8
	LDA.w #$1302
	JSL.l CODE_028B1F
CODE_00A78B:
	BRA.b CODE_00A753

CODE_00A78D:
	LDA.w #$1402
	JSL.l CODE_028B1F
CODE_00A794:
	LDA.w #$000C
	STA.w $0426,x
	LDA.w #DATA_019C68
	STA.w $05C4,x
	LDA.w $0C3C,x
	JSR.w CODE_00ABD4
	LDA.w #$0001
	STA.w $0A9E,x
	JSR.w CODE_00AAA7
	RTS

CODE_00A7B0:
	LDA.w $0A9E,x
	BIT.w #$0400
	BNE.b CODE_00A7F4
	BIT.w #$0001
	BNE.b CODE_00A7D0
	ORA.w #$0001
	STA.w $0A9E,x
	LDA.w #$0010
	STA.b $68
	LDA.w #$0014
	STA.b $6C
	JSR.w CODE_00A883
CODE_00A7D0:
	JSR.w CODE_00A8DE
	LDA.w $053A,x
	CMP.w #$0014
	BEQ.b CODE_00A7DD
	BCS.b CODE_00A7F4
CODE_00A7DD:
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JSR.w CODE_00AC88
	PHX
	LDX.w #$0000
	LDA.w #$2000
	JSR.w CODE_00AC6C
	PLX
CODE_00A7F4:
	RTS

CODE_00A7F5:
	LDA.w $0A9E,x
	BIT.w #$0400
	BNE.b CODE_00A851
	BIT.w #$0001
	BNE.b CODE_00A815
	ORA.w #$0001
	STA.w $0A9E,x
	LDA.w #$00DE
	STA.b $68
	LDA.w #$000C
	STA.b $6C
	JSR.w CODE_00A883
CODE_00A815:
	JSR.w CODE_00A8DE
	LDA.w $053A,x
	CMP.w #$000C
	BEQ.b CODE_00A822
	BCS.b CODE_00A850
CODE_00A822:
	INC.w !RAM_SXAR_Global_CurrentLivesLo
	JSR.w CODE_00D85A
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BNE.b CODE_00A833
	LDA.w #$0006
CODE_00A833:
	SEC
	SBC.w #$0002
	LSR
	TAY
	LDA.w $0106,y
	BEQ.b CODE_00A844
	BMI.b CODE_00A844
	DEC
	STA.w $0106,y
CODE_00A844:
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JSR.w CODE_00AC88
CODE_00A850:
	RTS

CODE_00A851:
	LDA.b $0E
	AND.w #$0007
	BNE.b CODE_00A86C
	LDA.w $0A9E,x
	EOR.w #$4000
	STA.w $0A9E,x
	LDA.w $1498
	BEQ.b CODE_00A86C
	LDA.w #DATA_01AA12
	STA.w $05C4,x
CODE_00A86C:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BNE.b CODE_00A877
	LDA.w #$0006
CODE_00A877:
	SEC
	SBC.w #$0002
	LSR
	TAY
	LDA.w $0106,y
	BEQ.b CODE_00A844
	RTS

CODE_00A883:
	STZ.b $8C
	STZ.b $8E
	LDA.b $68
	SEC
	SBC.w $04B0,x
	BPL.b CODE_00A895
	INC.b $8C
	EOR.w #$FFFF
	INC
CODE_00A895:
	STA.b $90
	LDA.b $6C
	SEC
	SBC.w $053A,x
	BPL.b CODE_00A8A7
	INC.b $8C
	INC.b $8C
	EOR.w #$FFFF
	INC
CODE_00A8A7:
	STA.b $92
	CMP.b $90
	BCC.b CODE_00A8BB
	LDA.b $92
	STA.b $94
	LDA.b $90
	STA.b $96
	INC.b $8E
	INC.b $8E
	BRA.b CODE_00A8C3

CODE_00A8BB:
	LDA.b $90
	STA.b $94
	LDA.b $92
	STA.b $96
CODE_00A8C3:
	LDA.b $94
	STA.w $0D50,x
	LSR
	STA.w $0CC6,x
	LDA.b $96
	STA.w $0DDA,x
	LDA.b $8C
	ASL
	ASL
	ORA.b $8E
	ORA.w $0A9E,x
	STA.w $0A9E,x
	RTS

CODE_00A8DE:
	LDA.w $0CC6,x
	CLC
	ADC.w $0DDA,x
	STA.w $0CC6,x
	CMP.w $0D50,x
	BCC.b CODE_00A909
	SEC
	SBC.w $0D50,x
	STA.w $0CC6,x
	LDA.w $0A9E,x
	EOR.w #$0002
	STA.w $0A9E,x
	JSR.w CODE_00A909
	LDA.w $0A9E,x
	EOR.w #$0002
	STA.w $0A9E,x
CODE_00A909:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00A92C
	BIT.w #$0004
	BNE.b CODE_00A921
	LDA.w $04B0,x
	CLC
	ADC.w #$0004
	STA.w $04B0,x
	RTS

CODE_00A921:
	LDA.w $04B0,x
	SEC
	SBC.w #$0004
	STA.w $04B0,x
	RTS

CODE_00A92C:
	BIT.w #$0008
	BNE.b CODE_00A93C
	LDA.w $053A,x
	CLC
	ADC.w #$0004
	STA.w $053A,x
	RTS

CODE_00A93C:
	LDA.w $053A,x
	SEC
	SBC.w #$0004
	STA.w $053A,x
	RTS

CODE_00A947:
	LDA.w $0426,y
	CMP.w #$0073
	BEQ.b CODE_00A9C8
	CMP.w #$0092
	BNE.b CODE_00A957
	JMP.w CODE_00A9F6

CODE_00A957:
	CMP.w #$000F
	BEQ.b CODE_00A9A7
	CMP.w #$0034
	BEQ.b CODE_00A9DC
	CMP.w #$004D
	BEQ.b CODE_00A9B4
	CMP.w #$006B
	BEQ.b CODE_00A9E9
	CMP.w #$007D
	BEQ.b CODE_00A993
	CMP.w #$009B
	BEQ.b CODE_00A9B4
	CMP.w #$00A4
	BEQ.b CODE_00A980
	CMP.w #$0068
	BEQ.b CODE_00A9E5
	RTS

CODE_00A980:
	LDA.w $0A9E,y
	AND.w #$FFDF
	ORA.w #$0002
	STA.w $0A9E,y
	LDA.w #$0000
	STA.w $1002,y
	RTS

CODE_00A993:
	LDA.w #$0080
	STA.w $0A9E,y
	LDA.w #$0000
	STA.w $1002,y
	LDA.w #$2702
	JSL.l CODE_028B1F
	RTS

CODE_00A9A7:
	JSR.w CODE_00A9B4
	LDA.w #$000A
	STA.w $14F2
	JSR.w CODE_00D8DC
	RTS

CODE_00A9B4:
	LDA.w #$0080
	STA.w $0A9E,y
	LDA.w #$0000
	STA.w $1002,y
	LDA.w #$2202
	JSL.l CODE_028B1F
	RTS

CODE_00A9C8:
	LDA.w #$0081
	STA.w $0A9E,y
	LDA.w #$0000
	STA.w $1002,y
	LDA.w #$2202
	JSL.l CODE_028B1F
	RTS

CODE_00A9DC:
	LDA.w #$0800
	JSR.w CODE_00AC6C
	JMP.w CODE_00AC81

CODE_00A9E5:
	INC.w $1522
	RTS

CODE_00A9E9:
	INC.w $1432
	LDA.w $0A9E,y
	ORA.w #$0002
	STA.w $0A9E,y
	RTS

CODE_00A9F6:
	LDA.w $0BB2,y
	STA.w $154E
	LDA.w #$2202
	JSL.l CODE_028B1F
	PHY
	BIT.w $1596
	BMI.b CODE_00AA16
	LDA.w #DATA_0198DA
	JSR.w CODE_009616
	LDY.b $20
	BMI.b CODE_00AA16
	DEC.w $1596
CODE_00AA16:
	PLY
	JMP.w CODE_00AC81

CODE_00AA1A:
	LDA.w $1526
	BNE.b CODE_00AA44
	LDA.w $0A9E,x
	AND.w #$0120
	BNE.b CODE_00AA43
	LDA.w #$1000
	STA.b $64
	LDA.w #$0120
	STA.b $66
	LDA.w #$0008
	STA.b $68
	LDA.w #$0008
	STA.b $6C
	LDY.w #$0004
	JSR.w CODE_00AB46
	BCS.b CODE_00AA52
CODE_00AA43:
	RTS

CODE_00AA44:
	LDA.w $1528
	BEQ.b CODE_00AA43
	DEC.w $1528
	BNE.b CODE_00AA43
	STZ.w $1526
	RTS

CODE_00AA52:
	LDA.w $0A9E,y
	AND.w #$0400
	BEQ.b CODE_00AA5D
	JMP.w CODE_00A947

CODE_00AA5D:
	LDA.w $1498
	BEQ.b CODE_00AA65
	JMP.w CODE_00CD83

CODE_00AA65:
	LDA.w $0C3C,y
	JSR.w CODE_00ABE0
	LDA.w #$0028
	STA.w $1528
	INC.w $1526
	LDA.w $150E
	BNE.b CODE_00AA7C
	JSR.w CODE_00AAD7
CODE_00AA7C:
	LDA.w $0C3C,x
	JSR.w CODE_00ABD4
	LDA.w #$2002
	JSL.l CODE_028B1F
	LDA.w $150E
	BNE.b CODE_00AAA6
	STZ.b $68
	STZ.b $6C
	LDA.w #$0003
	STA.b $AC
CODE_00AA97:
	JSR.w CODE_00AB43
	BCC.b CODE_00AAA6
	JSR.w CODE_00AAD7
	JSR.w CODE_00AAA7
	DEC.b $AC
	BPL.b CODE_00AA97
CODE_00AAA6:
	RTS

CODE_00AAA7:
	LDA.w $0426,y
	CMP.w #$0094
	BEQ.b CODE_00AAD6
	CMP.w #$0095
	BEQ.b CODE_00AAD6
	CMP.w #$00A7
	BEQ.b CODE_00AAD6
	CMP.w #$00A6
	BEQ.b CODE_00AAD6
	PHX
	TYX
	PLY
	LDA.w $0762,x
	CMP.w $0762,y
	BEQ.b CODE_00AACB
	BCS.b CODE_00AAD0
CODE_00AACB:
	JSR.w CODE_00AAEF
	BRA.b CODE_00AAD3

CODE_00AAD0:
	JSR.w CODE_00AB1B
CODE_00AAD3:
	PHX
	TYX
	PLY
CODE_00AAD6:
	RTS

CODE_00AAD7:
	LDA.w #$FF00
	STA.w $0A14,x
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CMP.w $0762,y
	BEQ.b CODE_00AAE7
	BCS.b CODE_00AB13
CODE_00AAE7:
	LDA.w $1308
	AND.w #$0002
	BNE.b CODE_00AB0A
CODE_00AAEF:
	LDA.w $1498
	BNE.b CODE_00AB0B
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	STA.b $8C
	SEC
	SBC.w #$0003
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CMP.w $152C
	BCS.b CODE_00AB0A
	LDA.b $8C
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
CODE_00AB0A:
	RTS

CODE_00AB0B:
	LDA.w #$0006
	STA.b $8C
	JMP.w CODE_00C951

CODE_00AB13:
	LDA.w $1310
	AND.w #$0002
	BNE.b CODE_00AB36
CODE_00AB1B:
	LDA.w $1498
	BNE.b CODE_00AB37
	LDA.w $0762,x
	STA.b $8C
	CLC
	ADC.w #$0003
	STA.w $0762,x
	CMP.w $152E
	BCC.b CODE_00AB36
	LDA.b $8C
	STA.w $0762,x
CODE_00AB36:
	RTS

CODE_00AB37:
	LDA.w #$0006
	STA.b $8C
	JMP.w CODE_00C960

CODE_00AB3F:
	INY
	INY
	BRA.b CODE_00AB46

CODE_00AB43:
	LDY.w #$0000
CODE_00AB46:
	LDA.w $0426,y
	BEQ.b CODE_00ABC8
	CMP.w $0426,x
	BEQ.b CODE_00ABC8
	LDA.w $0A9E,y
	AND.b $66
	BNE.b CODE_00ABC8
	LDA.w $0A9E,y
	AND.b $64
	CMP.b $64
	BNE.b CODE_00ABC8
	LDA.w $0876,x
	LSR
	CLC
	ADC.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.b $68
	STA.b $8C
	LDA.w $0876,y
	LSR
	STA.b $8E
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,y
	SEC
	SBC.b $8E
	CLC
	ADC.b $68
	CMP.b $8C
	BEQ.b CODE_00AB82
	BCS.b CODE_00ABC8
CODE_00AB82:
	LDA.w $0876,y
	LSR
	CLC
	ADC.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,y
	SEC
	SBC.b $68
	STA.b $8C
	LDA.w $0876,x
	LSR
	STA.b $8E
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.b $8E
	CLC
	ADC.b $68
	CMP.b $8C
	BEQ.b CODE_00ABA4
	BCS.b CODE_00ABC8
CODE_00ABA4:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w $0900,x
	CLC
	ADC.b $6C
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,y
	BEQ.b CODE_00ABB5
	BCS.b CODE_00ABC8
CODE_00ABB5:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,y
	SEC
	SBC.w $0900,y
	CLC
	ADC.b $6C
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	BEQ.b CODE_00ABC6
	BCS.b CODE_00ABC8
CODE_00ABC6:
	SEC
	RTS

CODE_00ABC8:
	INY
	INY
	CPY.w $01B7
	BEQ.b CODE_00ABD2
	JMP.w CODE_00AB46

CODE_00ABD2:
	CLC
	RTS

CODE_00ABD4:
	PHA
	PHX
	TYX
	PLY
	PLA
	JSR.w CODE_00ABE0
	PHX
	TYX
	PLY
	RTS

CODE_00ABE0:
	PHA
	LDA.w $0A9E,x
	BIT.w #$0120
	BNE.b CODE_00ABFA
	ORA.w #$0020
	STA.w $0A9E,x
	STZ.w $0CC6,x
	STZ.w $0F78,x
	PLA
	JSR.w CODE_00AC19
	RTS

CODE_00ABFA:
	PLA
	RTS

ADDR_00ABFC:
	STA.b $8C
	LDA.w $0B28,x
	SEC
	SBC.b $8C
	BPL.b ADDR_00AC15
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	STZ.w $0F78,x
	LDA.w #$0000
ADDR_00AC15:
	STA.w $0B28,x
	RTS

CODE_00AC19:
	STA.b $8C
	LDA.w $0B28,x
	SEC
	SBC.b $8C
	BEQ.b CODE_00AC25
	BPL.b CODE_00AC3C
CODE_00AC25:
	LDA.w $0A9E,y
	AND.w #$2000
	BNE.b CODE_00AC40
CODE_00AC2D:
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	STZ.w $0F78,x
	LDA.w #$0000
CODE_00AC3C:
	STA.w $0B28,x
	RTS

CODE_00AC40:
	SEP.b #$20
	LDA.w $0BB2,x
	STZ.w $0BB2,x
	CLC
	ADC.w $154F
	CMP.b #$09
	BEQ.b CODE_00AC58
	BCC.b CODE_00AC58
	SEC
	SBC.b #$0A
	INC.w $154E
CODE_00AC58:
	STA.w $154F
	LDA.w $0BB3,x
	STZ.w $0BB3,x
	CLC
	ADC.w $154E
	STA.w $154E
	REP.b #$20
	BRA.b CODE_00AC2D

CODE_00AC6C:
	STA.b $82
	LDA.w $0B28,x
	BMI.b CODE_00AC7B
	CLC
	ADC.b $82
	BPL.b CODE_00AC7B
	LDA.w #$7FFF
CODE_00AC7B:
	STA.w $0B28,x
	RTS

CODE_00AC7F:
	REP.b #$30
CODE_00AC81:
	PHX
	TYX
	JSR.w CODE_00AC8A
	PLX
	RTS

CODE_00AC88:
	LDX.b $2C
CODE_00AC8A:
	JSR.w CODE_00B59B
	PHP
	STZ.w $0426,x
	STZ.w $0BB2,x
	LDA.w #$0180
	STA.w $04B0,x
	LDA.w #$00F0
	STA.w $053A,x
	LDA.w #$FF00
	STA.w $0762,x
	STA.w $07EC,x
	LDA.w #DATA_019B0A
	STA.w $05C4,x
	LDA.w #$0001
	STA.w $064E,x
	STA.w $06D8,x
	PLP
	RTS

CODE_00ACBA:
	LDA.w $0A9E,x
	AND.w #$0120
	BEQ.b CODE_00ACFA
	AND.w #$0100
	BEQ.b CODE_00ACFB
	STZ.b $56
	LDA.w $0F78
	CMP.w #$0001
	BEQ.b CODE_00ACE5
	CMP.w #$008C
	BCC.b CODE_00ACE1
	LDA.w $135B
	BNE.b CODE_00ACFA
	INC.w $135B
	DEC.w !RAM_SXAR_Global_CurrentLivesLo
CODE_00ACE1:
	STZ.w $0B28
	RTS

CODE_00ACE5:
	LDA.w $0426
	CMP.w #!Define_SXAR_SpriteID_PlayerStorm
	BEQ.b CODE_00ACF5
	LDA.w #$2802
	JSL.l CODE_028B1F
	RTS

CODE_00ACF5:
	JSL.l CODE_028BB9
	RTS

CODE_00ACFA:
	RTS

CODE_00ACFB:
	LDA.w $0F78,x
	CMP.w #$0012
	BEQ.b CODE_00AD05
	BCS.b CODE_00AD10
CODE_00AD05:
	CMP.w #$0008
	BEQ.b CODE_00AD0C
	BCS.b CODE_00ACFA
CODE_00AD0C:
	STZ.b $56,x
	BRA.b CODE_00ACFA

CODE_00AD10:
	LDA.w $0A9E
	AND.w #$FFDF
	STA.w $0A9E
	BRA.b CODE_00ACFA

CODE_00AD1B:
	PHP
	REP.b #$30
	LDX.w #$0000
	LDA.w $14FA
	BEQ.b CODE_00AD2B
	DEC.w $0CC6,x
	BMI.b CODE_00AD2E
CODE_00AD2B:
	JMP.w CODE_00ADAF

CODE_00AD2E:
	LDA.w $0426,x
	ASL
	TAY
	LDA.w DATA_01DE80,y
	STA.b $90
	LDA.w $0D50,x
	ASL
	TAY
	LDA.b ($90),y
	STA.b $8C
	LDY.w #$0000
CODE_00AD44:
	INY
	INY
	INY
	INY
	LDA.b ($8C),y
	STA.b $8E
	CMP.w #$0004
	BEQ.b CODE_00ADCC
	CMP.w #$0005
	BNE.b CODE_00AD59
	JMP.w CODE_00ADDF

CODE_00AD59:
	CMP.w #$0006
	BNE.b CODE_00AD61
	JMP.w CODE_00ADEC

CODE_00AD61:
	CMP.w #$0007
	BNE.b CODE_00AD69
	JMP.w CODE_00AE0C

CODE_00AD69:
	BIT.w #$0001
	BEQ.b CODE_00AD71
	JMP.w CODE_00AE32

CODE_00AD71:
	BIT.w #$0002
	BEQ.b CODE_00AD79
	JMP.w CODE_00AE60

CODE_00AD79:
	CMP.w #$0008
	BNE.b CODE_00AD81
	JMP.w CODE_00AE01

CODE_00AD81:
	LDA.b $56,x
	AND.w #$FFF0
	AND.b $8E
	CMP.b $8E
	BNE.b CODE_00AD44
CODE_00AD8C:
	INY
	INY
	LDA.b ($8C),y
	CMP.w #$00FF
	BNE.b CODE_00AD98
	JSR.w CODE_00ADB1
CODE_00AD98:
	STA.w $0D50,x
	ASL
	TAY
	LDA.b ($90),y
	STA.b $8C
	LDA.b ($8C)
	STA.w $0DDA,x
	INC.b $8C
	INC.b $8C
	LDA.b ($8C)
	STA.w $0CC6,x
CODE_00ADAF:
	PLP
	RTS

CODE_00ADB1:
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	LDA.w $0E64,x
	STZ.w $0E64,x
	DEC.w $0E64,x
	BIT.w #$FFFF
	BPL.b CODE_00ADCB
	LDA.w #$0000
CODE_00ADCB:
	RTS

CODE_00ADCC:
	LDA.w $0A9E,x
	AND.w #$0020
	BNE.b CODE_00ADD7
	JMP.w CODE_00AD44

CODE_00ADD7:
	LDA.w $0D50,x
	STA.w $0E64,x
	BRA.b CODE_00AD8C

CODE_00ADDF:
	LDA.w $0A9E,x
	AND.w #$0100
	BNE.b CODE_00ADEA
	JMP.w CODE_00AD44

CODE_00ADEA:
	BRA.b CODE_00AD8C

CODE_00ADEC:
	LDA.b $56
	BIT.w #$0080
	BEQ.b CODE_00ADFE
	LDA.w $133A
	AND.w $1338
	BEQ.b CODE_00ADFE
	JMP.w CODE_00AD8C

CODE_00ADFE:
	JMP.w CODE_00AD44

CODE_00AE01:
	LDA.w $150E
	BEQ.b CODE_00AE09
	JMP.w CODE_00AD8C

CODE_00AE09:
	JMP.w CODE_00AD44

CODE_00AE0C:
	LDA.b $0E
	AND.w #$007F
	BEQ.b CODE_00AE16
	JMP.w CODE_00AD44

CODE_00AE16:
	LDA.b $56
	AND.w #$FFF0
	BEQ.b CODE_00AE20
	JMP.w CODE_00AD44

CODE_00AE20:
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CLC
	ADC.w #$0004
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCS.b CODE_00AE2F
	JMP.w CODE_00AD44

CODE_00AE2F:
	JMP.w CODE_00AD8C

CODE_00AE32:
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00AE44
	LDA.b $56,x
	AND.w #$0100
	BNE.b CODE_00AE4E
	JMP.w CODE_00AD44

CODE_00AE44:
	LDA.b $56,x
	AND.w #$0200
	BNE.b CODE_00AE4E
	JMP.w CODE_00AD44

CODE_00AE4E:
	LDA.b $8E
	CMP.w #$0001
	BNE.b CODE_00AE58
	JMP.w CODE_00AD8C

CODE_00AE58:
	AND.w #$FFF0
	STA.b $8E
	JMP.w CODE_00AD81

CODE_00AE60:
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00AE7B
	LDA.b $56,x
	AND.w #$0100
	BEQ.b CODE_00AE8E
	LDA.w $0A9E,x
	AND.w #$BFFF
	STA.w $0A9E,x
	JMP.w CODE_00AE4E

CODE_00AE7B:
	LDA.b $56,x
	AND.w #$0200
	BEQ.b CODE_00AE8E
	LDA.w $0A9E,x
	ORA.w #$4000
	STA.w $0A9E,x
	JMP.w CODE_00AE4E

CODE_00AE8E:
	JMP.w CODE_00AD44

CODE_00AE91:
	JSR.w CODE_00B07E
	JSR.w CODE_00AF7C
	RTS

CODE_00AE98:
	RTS

CODE_00AE99:
	JSR.w CODE_00AF14
	BCS.b CODE_00AEAA
	JSR.w CODE_00B104
	BCS.b CODE_00AE98
	JSR.w CODE_00B07E
	JSR.w CODE_00AF7C
	RTS

CODE_00AEAA:
	LDA.w #$0002
	STA.w $1308
	STA.w $1310
	LDA.w #$0001
	STA.w $1320
	STZ.w $1318
	JSR.w CODE_00B07E
	LDY.w $150E
	LDA.w $0A9E,y
	STA.w $1520
	LDA.w $0762,y
	STA.w $0762,x
	LDA.w $07EC,y
	SEC
	SBC.w #$0022
	STA.w $07EC,x
	LDA.w $0D50,x
	CMP.w #$0018
	BNE.b CODE_00AEE9
	STZ.w $0A14,x
	STZ.w $0CC6
	STZ.w $0D50
CODE_00AEE9:
	LDA.b $56
	BIT.w #$8000
	BEQ.b CODE_00AF13
	LDA.b $5A
	BIT.w #$8000
	BNE.b CODE_00AF13
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w #$0009
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	LDA.w #$FB80
	STA.w $0A14
	LDA.w $0A9E
	ORA.w #$0008
	STA.w $0A9E
	JSR.w CODE_00B01D
CODE_00AF13:
	RTS

CODE_00AF14:
	STZ.w $150E
	LDA.w $0A9E
	BIT.w #$0100
	BNE.b CODE_00AF4A
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w #$000C
	LDX.w #$0004
CODE_00AF29:
	LDY.w $0426,x
	CPY.w #!Define_SXAR_SpriteID_MovingMinecart
	BNE.b CODE_00AF43
	CMP.w $0762,x
	BEQ.b CODE_00AF38
	BCS.b CODE_00AF43
CODE_00AF38:
	CLC
	ADC.w #$0018
	CMP.w $0762,x
	BEQ.b CODE_00AF43
	BCS.b CODE_00AF58
CODE_00AF43:
	INX
	INX
	CPX.w $01B7
	BNE.b CODE_00AF29
CODE_00AF4A:
	LDX.w #$0000
	CLC
	RTS

CODE_00AF4F:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w #$000C
	BRA.b CODE_00AF43

CODE_00AF58:
	LDA.w $07EC,x
	SEC
	SBC.w #$001F
	STA.b $8E
	SEC
	SBC.w #$0008
	STA.b $8C
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CMP.b $8C
	BCC.b CODE_00AF4F
	CMP.b $8E
	BEQ.b CODE_00AF74
	BCS.b CODE_00AF4F
CODE_00AF74:
	STX.w $150E
	LDX.w #$0000
	SEC
	RTS

CODE_00AF7C:
	PHP
	REP.b #$30
	STZ.b $8C
	LDA.w $0D50,x
	CMP.w #$0018
	BCC.b CODE_00AF92
	CMP.w #$001A
	BEQ.b CODE_00AF90
	BCS.b CODE_00AF92
CODE_00AF90:
	INC.b $8C
CODE_00AF92:
	LDA.w $0A14,x
	BMI.b CODE_00B00B
	LDA.w $1318
	BIT.w #$0001
	BNE.b CODE_00AFFE
	LDA.w $1320
	BIT.w #$0001
	BNE.b CODE_00AFC6
	LDA.w $1510
	BNE.b CODE_00AFC6
	LDA.w $0A14,x
	CMP.w #$04FF
	BCS.b CODE_00AFBE
	LDA.w $0A14,x
	CLC
	ADC.w #$0040
	STA.w $0A14,x
CODE_00AFBE:
	JSR.w CODE_00B01D
	JSR.w CODE_00B03C
	BRA.b CODE_00B01B

CODE_00AFC6:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo				; Optimization: Junk
	LDA.w $0A9E
	AND.w #$FFF7
	STA.w $0A9E
	STZ.w $0A14
	LDA.b $8C
	BEQ.b CODE_00AFDF
	STZ.w $0CC6
	STZ.w $0D50
CODE_00AFDF:
	LDA.b $5A
	BIT.w #$8000
	BNE.b CODE_00B01B
	LDA.b $56
	BIT.w #$8000
	BEQ.b CODE_00B01B
	LDA.w $0A9E
	ORA.w #$0008
	STA.w $0A9E
	LDA.w #!Define_SXAR_WolverineAndCyclopsJumpSpeed
	STA.w $0A14
	BRA.b CODE_00B01B

CODE_00AFFE:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	INC
	AND.w #$FFF0
	DEC
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BRA.b CODE_00B01B

CODE_00B00B:
	JSR.w CODE_00B01D
	JSR.w CODE_00B03C
	LDA.w $0A14
	CLC
	ADC.w #$0040
	STA.w $0A14
CODE_00B01B:
	PLP
	RTS

CODE_00B01D:
	LDA.w $0F78
	CMP.w #$0013
	BCC.b CODE_00B03B
	LDA.w $0D50
	CMP.w #$0019
	BEQ.b CODE_00B03B
	CMP.w #$001A
	BEQ.b CODE_00B03B
	STZ.w $0CC6
	LDA.w #$0018
	STA.w $0D50
CODE_00B03B:
	RTS

CODE_00B03C:
	LDA.w $0A14,x
	BMI.b CODE_00B04D
	XBA
	AND.w #$00FF
	CLC
	ADC.w $07EC,x
	STA.w $07EC,x
	RTS

CODE_00B04D:
	XBA
	AND.w #$00FF
	ORA.w #$FF00
	CLC
	ADC.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	RTS

CODE_00B05C:
	LDA.w $098A,x
	BMI.b CODE_00B06D
	XBA
	AND.w #$00FF
	CLC
	ADC.w $0762,x
	STA.w $0762,x
	RTS

CODE_00B06D:
	XBA
	AND.w #$00FF
	ORA.w #$FF00
	CLC
	ADC.w $0762,x
	STA.w $0762,x
	RTS

CODE_00B07C:
	PLP
	RTS

CODE_00B07E:
	PHP
	REP.b #$20
	LDA.w #$0002
	STA.b $64
	LDA.w $0DDA,x
	BEQ.b CODE_00B07C
	CMP.w #$0018
	BEQ.b CODE_00B0A3
	CMP.w #$0019
	BEQ.b CODE_00B0A3
	CMP.w #$001A
	BEQ.b CODE_00B0A3
	CMP.w #$000A
	BEQ.b CODE_00B0A1
	BCS.b CODE_00B07C
CODE_00B0A1:
	BRA.b CODE_00B0A6

CODE_00B0A3:
	JMP.w CODE_00B0E8

CODE_00B0A6:
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00B0CA
	LDA.w $1308
	AND.w #$0002
	BNE.b CODE_00B0C7
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CMP.w $152C
	BCC.b CODE_00B0C7
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.b $64
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
CODE_00B0C7:
	JMP.w CODE_00B07C

CODE_00B0CA:
	LDA.w $1310
	AND.w #$0002
	BNE.b CODE_00B0E5
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CMP.w $152E
	BEQ.b CODE_00B0DC
	BCS.b CODE_00B0E5
CODE_00B0DC:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CLC
	ADC.b $64
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
CODE_00B0E5:
	JMP.w CODE_00B07C

CODE_00B0E8:
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00B0FA
	LDA.b $56,x
	AND.w #$0100
	BEQ.b CODE_00B0E5
	JMP.w CODE_00B0A6

CODE_00B0FA:
	LDA.b $56,x
	AND.w #$0200
	BEQ.b CODE_00B0E5
	JMP.w CODE_00B0A6

CODE_00B104:
	LDA.w $1320
	ORA.w $1318
	BIT.w #$0010
	BEQ.b CODE_00B13D
	LDA.w $0A9E
	BIT.w #$0100
	BNE.b CODE_00B12D
	LDA.w #$8000
	JSR.w CODE_00ABE0
	LDA.w #$0022
	STA.w $0D50
	STZ.w $0CC6
	LDA.w #$0802
	JSL.l CODE_028B1F
CODE_00B12D:
	LDA.b $0E
	AND.w #$001F
	BNE.b CODE_00B13B
	LDA.w #$0802
	JSL.l CODE_028B1F
CODE_00B13B:
	SEC
	RTS

CODE_00B13D:
	CLC
	RTS

CODE_00B13F:
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01E55E,y
	STA.w $0900,x
	RTS

CODE_00B14B:
	PHP
	REP.b #$30
	PHX
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.w #$0004
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0000
	STA.b $96
	JSR.w CODE_00B228
	STA.b $98
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CLC
	ADC.w #$0004
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0000
	STA.b $96
	JSR.w CODE_00B228
	ORA.b $98
	STA.w $1318
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00B1B4
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.w #$0011
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0000
	STA.b $96
	JSR.w CODE_00B228
	STA.w $1308
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0008
	STA.b $96
	JSR.w CODE_00B228
	ORA.w $1308
	STA.w $1308
	BRA.b CODE_00B1DE

CODE_00B1B4:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CLC
	ADC.w #$0010
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0000
	STA.b $96
	JSR.w CODE_00B228
	STA.w $1310
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.w #$0008
	STA.b $96
	JSR.w CODE_00B228
	ORA.w $1310
	STA.w $1310
CODE_00B1DE:
	STZ.b $98
	JSR.w CODE_00B1EE
	JSR.w CODE_00B20B
	LDA.b $98
	STA.w $1320
	PLX
	PLP
	RTS

CODE_00B1EE:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.w #$0004
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	CLC
	ADC.w #$0001
	STA.b $96
	JSR.w CODE_00B228
	STA.w $1338
	ORA.b $98
	STA.b $98
	RTS

CODE_00B20B:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	CLC
	ADC.w #$0004
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	CLC
	ADC.w #$0001
	STA.b $96
	JSR.w CODE_00B228
	STA.w $133A
	ORA.b $98
	STA.b $98
	RTS

CODE_00B228:
	PHP
	REP.b #$30
	JSR.w CODE_00B241
	JSR.w CODE_00B2A7
	JSR.w CODE_00B2B8
	PLP
	RTS

CODE_00B236:
	PHP
	REP.b #$30
	JSR.w CODE_00B241
	JSR.w CODE_00B2A7
	PLP
	RTS

CODE_00B241:
	LDA.b $94
	LSR
	LSR
	LSR
	LSR
	ASL
	STA.b $8C
	LDA.b $4F
	BIT.w #$0100
	BNE.b CODE_00B279
	LDA.b $96
	LSR
	LSR
	LSR
	LSR
	ORA.b $4E
	STA.w $4202
	NOP #8
	LDA.w $4216
	ASL
	CLC
	ADC.b $8C
	CLC
	ADC.w $1508
	STA.b $8C
	LDA.w #$007E
	STA.b $8E
	LDA.b [$8C]
	RTS

CODE_00B279:
	LSR
	STA.b $84
	STZ.b $82
	LDA.b $96
	LSR
	LSR
	LSR
	LSR
	ORA.b $83
	STA.w $4202
	NOP #8
	LDA.w $4216
	ASL
	ASL
	CLC
	ADC.b $8C
	CLC
	ADC.w $1508
	STA.b $8C
	LDA.w #$007E
	STA.b $8E
	LDA.b [$8C]
	RTS

CODE_00B2A7:
	LSR
	STA.b $90
	AND.w #$0007
	STA.b $92
	LDA.b $90
	AND.w #$01F8
	LSR
	ORA.b $92
	RTS

CODE_00B2B8:
	STA.b $82
	LDA.w #DATA_0382DC>>16
	STA.b $9C
	LDY.w !RAM_SXAR_Global_CurrentLevelLo
	LDA.w DATA_01CE7B,y
	STA.b $9A
	LDY.b $82
	LDA.b [$9A],y
	AND.w #$00FF
	ASL
	ASL
	TAY
	LDA.b $96
	BIT.w #$0008
	BNE.b CODE_00B2ED
	LDA.b $94
	BIT.w #$0008
	BNE.b CODE_00B2E6
	LDA.w DATA_01CC7B,y
	AND.w #$00FF
	RTS

CODE_00B2E6:
	LDA.w DATA_01CC7B+$01,y
	AND.w #$00FF
	RTS

CODE_00B2ED:
	LDA.b $94
	BIT.w #$0008
	BNE.b CODE_00B2FB
	LDA.w DATA_01CC7B+$02,y
	AND.w #$00FF
	RTS

CODE_00B2FB:
	LDA.w DATA_01CC7B+$03,y
	AND.w #$00FF
	RTS

CODE_00B302:
	REP.b #$30
CODE_00B304:
	LDY.w $0F78,x
	CPY.w #$001E
	BCC.b CODE_00B31A
	AND.w #$FFDF
	STA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00B31A
	JMP.w CODE_00AC88

CODE_00B31A:
	RTS

CODE_00B31B:
	LDY.w $0F78,x
	CPY.w #$000F
	BCC.b CODE_00B334
	AND.w #$FFDF
	STA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00B334
	JSR.w CODE_00E0D2
	JMP.w CODE_00AC88

CODE_00B334:
	RTS

CODE_00B335:
	LDA.w $0F78,x
	CMP.w #$0010
	BNE.b CODE_00B340
	JMP.w CODE_00B410

CODE_00B340:
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00B357
	LDA.w $0762,x
	STA.w $1502
	SEC
	SBC.w #$0010
	STA.w $0762,x
	BRA.b CODE_00B364

CODE_00B357:
	LDA.w $0762,x
	STA.w $1502
	CLC
	ADC.w #$0010
	STA.w $0762,x
CODE_00B364:
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00B387
	BIT.w #$0008
	BEQ.b CODE_00B37D
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.w $07EC,x
	BRA.b CODE_00B387

CODE_00B37D:
	LDA.w $07EC,x
	CLC
	ADC.w #$0010
	STA.w $07EC,x
CODE_00B387:
	LDA.w #$0800
	STA.b $64
	LDA.w #$0120
	STA.b $66
	LDA.w #$0004
	STA.b $68
	LDA.w #$0004
	STA.b $6C
	JSR.w CODE_00AB43
	BCC.b CODE_00B3B0
	LDA.w $0426,y
	CMP.w #$0004
	BEQ.b CODE_00B3E4
	LDA.w $0C3C,x
	JSR.w CODE_00ABD4
	BRA.b CODE_00B3CA

CODE_00B3B0:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BEQ.b CODE_00B3E3
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	AND.w #$0002
	BEQ.b CODE_00B3E3
CODE_00B3CA:
	LDA.w $07EC,x
	CLC
	ADC.w #$0006
	STA.w $07EC,x
	LDA.w #$0055
	STA.w $0426,x
	LDA.w #DATA_01A2A4
	STA.w $05C4,x
	STZ.w $0F78,x
CODE_00B3E3:
	RTS

CODE_00B3E4:
	LDA.w #$006E
	STA.w $0426,x
	LDA.w $0762,y
	STA.w $0762,x
	LDA.w $07EC,y
	SEC
	SBC.w #$0027
	STA.w $07EC,x
	LDA.w $0A9E,y
	AND.w #$4004
	ORA.w #$1001
	STA.w $0A9E,x
	STZ.w $0F78,x
	LDA.w #DATA_019B3A
	STA.w $05C4,x
	RTS

CODE_00B410:
	JMP.w CODE_00AC88

CODE_00B413:
	LDA.w $0F78,x
	CMP.w #$0003
	BCC.b CODE_00B41E
	JMP.w CODE_00AC88

CODE_00B41E:
	CMP.w #$0002
	BCC.b CODE_00B429
	LDA.w #DATA_01A2A8
	STA.w $05C4,x
CODE_00B429:
	RTS

CODE_00B42A:
	REP.b #$30
	PHA
	PHX
	PHY
	PHB
	SEP.b #$20
	LDA.w $4211
	REP.b #$20
	LDA.w $0141
	CMP.w #$464D
	BNE.b CODE_00B447
	LDA.w $0104
	ASL
	TAX
	JSR.w CODE_00B44E
CODE_00B447:
	REP.b #$30
	PLB
	PLY
	PLX
	PLA
	RTI

CODE_00B44E:
	JMP.w (DATA_00B45E,x)

CODE_00B451:
	SEP.b #$30
	LDA.w $4211
	LDA.w $013D
	BEQ.b CODE_00B45B
CODE_00B45B:
	REP.b #$30
CODE_00B45D:
	RTS

DATA_00B45E:
	dw CODE_00B47A
	dw CODE_00B47D
	dw CODE_00B480
	dw CODE_00B483
	dw CODE_00B486
	dw CODE_00B489
	dw CODE_00B48E
	dw CODE_00B493
	dw CODE_00B498
	dw CODE_00B49D
	dw CODE_00B4A2
	dw CODE_00B4A7
	dw CODE_00B4AC
	dw CODE_00B4B1

CODE_00B47A:
	JMP.w CODE_00B45D

CODE_00B47D:
	JMP.w CODE_00B45D

CODE_00B480:
	JMP.w CODE_00B451

CODE_00B483:
	JMP.w CODE_00B451

CODE_00B486:
	JMP.w CODE_00B451

CODE_00B489:
	JSL.l CODE_188006
	RTS

CODE_00B48E:
	JSL.l CODE_18800F
	RTS

CODE_00B493:
	JSL.l CODE_188018
	RTS

CODE_00B498:
	JSL.l CODE_188021
	RTS

CODE_00B49D:
	JSL.l CODE_138006
	RTS

CODE_00B4A2:
	JSL.l CODE_13800F
	RTS

CODE_00B4A7:
	JSL.l CODE_138018
	RTS

CODE_00B4AC:
	JSL.l CODE_18802A
	RTS

CODE_00B4B1:
	JSL.l CODE_138021
	RTS

CODE_00B4B6:
	PHP
	REP.b #$30
	DEY
	DEY
CODE_00B4BB:
	STA.b [$64],y
	DEY
	DEY
	BPL.b CODE_00B4BB
	PLP
	RTS

ADDR_00B4C3:
	PHP
	SEP.b #$20
	REP.b #$10
	DEY
ADDR_00B4C9:
	STA.b [$64],y
	DEY
	BPL.b ADDR_00B4C9
	PLP
	RTS

CODE_00B4D0:
	PHP
	SEP.b #$20
	REP.b #$10
	DEY
CODE_00B4D6:
	LDA.b [$64],y
	STA.b [$68],y
	DEY
	BPL.b CODE_00B4D6
	PLP
	RTS

ADDR_00B4DF:
	PHP
	REP.b #$20
ADDR_00B4E2:
	LDA.b $56
	AND.w #$FFF0
	BNE.b ADDR_00B4E2
	PLP
	RTS

CODE_00B4EB:
	PHP
	SEP.b #$20
CODE_00B4EE:
	JSR.w CODE_0089C3
	JSL.l CODE_0295D2
	JSL.l CODE_0295A6
	LDA.b $1A
	BPL.b CODE_00B4EE
	PLP
	RTS

CODE_00B4FF:
	RTS

CODE_00B500:
	PHP
	REP.b #$30
	LDA.w #$0007
	STA.b $AC
CODE_00B508:
	JSR.w CODE_00B511
	DEC.b $AC
	BPL.b CODE_00B508
	PLP
	RTS

CODE_00B511:
	LDA.b [$24]
	BEQ.b CODE_00B562
	AND.w #$0300
	BNE.b CODE_00B551
	LDY.w #$0002
	LDA.b [$24],y
	STA.b $68
	LDY.w #$0004
	LDA.b [$24],y
	STA.b $6C
	JSR.w CODE_00B569
	BCC.b CODE_00B551
	LDA.b [$24]
	AND.w #$FF00
	STA.b $70
	LDA.b $24
	STA.b $78
	LDA.b [$24]
	ORA.w #$0200
	STA.b [$24]
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_039944,x
	JSR.w CODE_0096F3
	STZ.b $AC
	LDX.b $20
	BMI.b CODE_00B55A
CODE_00B551:
	LDA.b $24
	CLC
	ADC.w #$0008
	STA.b $24
	RTS

CODE_00B55A:
	LDA.b [$24]
	AND.w #$FDFF
	STA.b [$24]
	RTS

CODE_00B562:
	LDA.w #$F000
	STA.b $24
	BRA.b CODE_00B511

CODE_00B569:
	LDA.b $2E
	SEC
	SBC.w #$0020
	BPL.b CODE_00B574
	LDA.w #$0000
CODE_00B574:
	CMP.b $68
	BCS.b CODE_00B599
	CLC
	ADC.w #$0180
	CMP.b $68
	BCC.b CODE_00B599
	LDA.b $30
	SEC
	SBC.w #$0020
	BPL.b CODE_00B58B
	LDA.w #$0000
CODE_00B58B:
	CMP.b $6C
	BCS.b CODE_00B599
	CLC
	ADC.w #$0180
	CMP.b $6C
	BCC.b CODE_00B599
	SEC
	RTS

CODE_00B599:
	CLC
	RTS

CODE_00B59B:
	LDA.w $0EEE,x
	INC
	BEQ.b CODE_00B5E5
	DEC
	STA.b $8C
	LDA.w #$007E
	STA.b $8E
	LDA.w $0EEE,x
	STA.b $8C
	LDA.w $0A9E,x
	AND.w #$4100
	STA.b $90
	LDA.b [$8C]
	AND.w #$BCFF
	ORA.b $90
	STA.b [$8C]
	LDA.b $8C
	CLC
	ADC.w #$0006
	STA.b $8C
	LDA.b [$8C]
	BIT.w #$0002
	BNE.b CODE_00B5E9
	BIT.w #$0001
	BNE.b CODE_00B5E5
CODE_00B5D3:
	DEC.b $8C
	DEC.b $8C
	LDA.w $07EC,x
	STA.b [$8C]
	DEC.b $8C
	DEC.b $8C
	LDA.w $0762,x
	STA.b [$8C]
CODE_00B5E5:
	CLC
	RTS

CODE_00B5E7:
	SEC
	RTS

CODE_00B5E9:
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00B5D3
	LDA.b $8C
	SEC
	SBC.w #$0006
	STA.b $92
	LDA.w #$007E
	STA.b $94
	LDA.b [$92]
	ORA.w #$0100
	STA.b [$92]
	BRA.b CODE_00B5D3

CODE_00B607:
	PHP
	SEP.b #$30
	LDY.b #$1C
	LDA.b #$F0
CODE_00B60E:
	STA.w $03E1,y
	DEY
	DEY
	DEY
	DEY
	BPL.b CODE_00B60E
	STZ.w $041F
	PLP
	RTS

CODE_00B61C:
	PHP
	REP.b #$30
	JSL.l CODE_028D8F
	JSR.w CODE_00B827
CODE_00B626:
	REP.b #$30
	JSL.l CODE_0295A6
	JSL.l CODE_02951C
	JSR.w CODE_00BB7A
	JSL.l CODE_0295D2
	JSR.w CODE_00B4FF
	JSL.l CODE_029A32
	JSR.w CODE_00B500
	JSR.w CODE_00B7DD
	JSL.l CODE_0299C0
	JSR.w CODE_00C0C9
	JSR.w CODE_00BC76
	JSR.w CODE_00BCA8
	JSL.l CODE_0294FD
	JSR.w CODE_00B6C5
	JSR.w CODE_00A3DE
	JSR.w CODE_00CFAC
	JSL.l CODE_02A044
	JSR.w CODE_0083B4
	LDA.w #$00FF
	TSB.w $14FA
	BNE.b CODE_00B670
	JSR.w CODE_00B6A4
CODE_00B670:
	LDA.w $135B
	BNE.b CODE_00B693
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CMP.w #$0462
	BEQ.b CODE_00B67F
	BCS.b CODE_00B69C
CODE_00B67F:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm2
	BNE.b CODE_00B691
	LDA.w $1506
	CMP.w #$012C
	BEQ.b CODE_00B691
	BCS.b CODE_00B69C
CODE_00B691:
	BRA.b CODE_00B626

CODE_00B693:
	STZ.w $1498
	JSL.l CODE_0295A6
	PLP
	RTS

CODE_00B69C:
	INC.w !RAM_SXAR_Global_LevelClearFlags
	INC.w !RAM_SXAR_Global_LevelClearFlags
	BRA.b CODE_00B693

CODE_00B6A4:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F3400>>16)
	LDX.w #$7F3400
	LDY.w #!Define_SXAR_Graphics_Player_SwimmingStorm
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FF400>>16)
	LDX.w #$7FF400
	LDY.w #!Define_SXAR_Graphics_Sprite_PausedText
	JSL.l CODE_028000
	INC.b $14
	RTS

CODE_00B6C5:
	PHP
	REP.b #$30
	LDA.b $56
	ORA.b $58
	AND.w #$1000
	BEQ.b CODE_00B716
	LDA.w $14FA
	BEQ.b CODE_00B716
	LDA.w #$0005
	STA.b $1A
	JSR.w CODE_00B718
	INC.w $1562
	JSL.l CODE_0295A6
	JSR.w CODE_00B77D
	JSR.w CODE_00B7B2
	JSR.w CODE_0083A2
CODE_00B6EE:
	JSL.l CODE_0295A6
	LDA.w #$0003
	STA.b $0C
	JSL.l CODE_02951C
	LDA.b $56
	ORA.b $58
	AND.w #$1000
	BEQ.b CODE_00B6EE
	JSR.w CODE_0083A2
	LDA.w #$000F
	STA.b $1A
	JSL.l CODE_0295A6
	JSR.w CODE_00B75E
	STZ.w $1562
CODE_00B716:
	PLP
	RTS

CODE_00B718:
	LDA.w $0426
	STA.w $1558
	LDA.w $064E
	STA.w $155A
	LDA.w $06D8
	STA.w $155C
	LDA.w $0A9E
	STA.w $155E
	LDA.w $05C4
	STA.w $1560
	LDA.w #$0006
	STA.w $064E
	LDA.w #$0001
	STA.w $06D8
	LDA.w #$0081
	STA.w $0A9E
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	LDA.w DATA_01AE5E,x
	STA.w $05C4
	LDA.w #$0060
	STA.w $04B0
	LDA.w #$0060
	STA.w $053A
	RTS

CODE_00B75E:
	LDA.w $1558
	STA.w $0426
	LDA.w $155A
	STA.w $064E
	LDA.w $155C
	STA.w $06D8
	LDA.w $155E
	STA.w $0A9E
	LDA.w $1560
	STA.w $05C4
	RTS

CODE_00B77D:
	PHP
	REP.b #$30
	LDX.w #$0000
	LDA.w #$F400
	STA.w $129C,x
	CLC
	ADC.w #$0200
	STA.w $12AC,x
	CLC
	ADC.w #$0200
	STA.w $12BC,x
	CLC
	ADC.w #$0200
	STA.w $12CC,x
	CLC
	ADC.w #$0200
	STA.w $12DC,x
	CLC
	ADC.w #$0200
	STA.w $12EC,x
	CLC
	ADC.w #$0200
	PLP
	RTS

CODE_00B7B2:
	JSL.l CODE_02A044
	LDA.w $1558
	CMP.w #$0001
	BEQ.b CODE_00B7C7
	LDA.w $1558
	CMP.w #$0002
	BEQ.b CODE_00B7C7
	RTS

CODE_00B7C7:
	LDA.w #$0060
	STA.w $0362
	STA.w $0366
	STA.w $036A
	STA.w $036E
	STA.w $0372
	STA.w $0376
	RTS

CODE_00B7DD:
	PHP
	REP.b #$30
	LDA.b $0E
	AND.w #$0007
	BNE.b CODE_00B806
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w #$0060
	BEQ.b CODE_00B806
	BCC.b CODE_00B806
	LDA.w $14E0
	BMI.b CODE_00B806
	DEC.w $14E0
	DEC.w $14E0
	DEC.w !RAM_SXAR_SwimStorm_WaterYPosLo
	DEC.w !RAM_SXAR_SwimStorm_WaterYPosLo
	INC.b $4C
	INC.b $4C
CODE_00B806:
	LDA.b $30
	CLC
	ADC.w #$0030
	STA.b $8C
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	SEC
	SBC.b $8C
	BMI.b CODE_00B822
	CMP.w #$00E0
	BEQ.b CODE_00B81D
	BCS.b CODE_00B822
CODE_00B81D:
	STA.w $14DE
	BRA.b CODE_00B825

CODE_00B822:
	STZ.w $14DE
CODE_00B825:
	PLP
	RTS

CODE_00B827:
	PHP
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	CLI
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_StormLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSR.w CODE_009BA5
	REP.b #$20
	JSL.l CODE_0295A6
	INC.w $1498
	STZ.w $0102
	STZ.w $0104
	SEP.b #$20
	JSR.w CODE_00CA31
	JSL.l CODE_028EB6
	REP.b #$20
	STZ.w $14FA
	STZ.w $135B
	STZ.w $10BC
	INC.w $136E
	LDA.w #$0000
	STA.w $14F2
	STZ.w $1596
	LDA.w #$0004
	STA.w $01B5
	LDA.w #$0014
	ASL
	STA.w $01B7
	SEP.b #$20
	LDA.b #$39
	STA.w $2105
	LDA.b #$03
	STA.w $2101
	LDA.b #$00
	STA.w $2107
	LDA.b #$04
	STA.w $2108
	LDA.b #$08
	STA.w $2109
	LDA.b #$22
	STA.w $210B
	LDA.b #$01
	STA.w $210C
	LDA.b #$08
	STA.w $13A4
	LDA.b #$10
	STA.w $13A6
	JSL.l CODE_028EB6
	JSR.w CODE_0088F1
	REP.b #$30
	JSL.l CODE_0293E8
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBGSprite_Storm1
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.w #$7F0000
	LDY.w #!Define_SXAR_Graphics_Layer3_Water
	JSL.l CODE_028000
	JSL.l CODE_028CCA
	JSR.w CODE_00D238
	JSR.w CODE_00B970
	JSL.l CODE_0299F3
	JSR.w CODE_008906
	REP.b #$30
	LDA.w #$0001
	JSR.w CODE_008912
	JSR.w CODE_008934
	STZ.w $1526
	LDA.w #$0800
	STA.b $62
	LDA.w #$0670
	STA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	STZ.w $14E0
	STZ.w $1506
	LDA.w #$04B0
	STA.w $14FE
	STA.w $14FC
	STZ.w $1500
	STZ.w $1357
	SEP.b #$30
	LDA.b #$64
	STA.w $4209
	STZ.w $420A
	LDA.b #$A1
	STA.w $4200
	CLI
	REP.b #$30
	INC.b $16
	INC.w $14F0
	JSL.l CODE_02953D
	JSL.l CODE_029573
	JSR.w CODE_00B9AE
	REP.b #$30
	LDX.w #$0000
	LDA.w #DATA_0180A0
	JSR.w CODE_0096EA
	JSL.l CODE_02A044
	INC.w $013D
	LDA.w #$8080
	STA.b $1A
	LDA.w #$0003
	STA.w $0102
	STA.w $0104
	JSL.l CODE_0295A6
	JSL.l CODE_0295A6
	JSL.l CODE_0295A6
	JSL.l CODE_0295A6
	STZ.b $1A
	PLP
	RTS

CODE_00B970:
	PHP
	REP.b #$30
	LDA.w #$2000
	STA.w $1508
	LDA.w #$7000
	STA.w $150A
	LDA.w #$9000
	STA.w $150C
	LDA.w #$0048
	STA.b $4F
	LDA.w #$0034
	STA.b $51
	LDA.w #$0030
	STA.b $53
	LDA.w #$00B8
	STA.w $1512
	LDA.w #$00C0
	STA.w $1514
	LDA.w #$0080
	STA.w $1516
	LDA.w #$00B0
	STA.w $1518
	PLP
	RTS

CODE_00B9AE:
	PHP
	REP.b #$30
	LDA.w #$7F00
	STA.w $0B28
	LDX.w #$007C
CODE_00B9BA:
	LDA.w DATA_01F897+$02,x
	STA.w $0382,x
	LDA.w DATA_01F897,x
	STA.w $0380,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_00B9BA
	REP.b #$30
	JSR.w CODE_00D85A
	LDX.w #$001E
CODE_00B9D4:
	LDA.w DATA_01F91B,x
	STA.w $0400,x
	DEX
	DEX
	BPL.b CODE_00B9D4
	PLP
	RTS

CODE_00B9E0:
	PHP
	REP.b #$30
	PHX
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	STA.w $1502
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STA.w $1504
	JSR.w CODE_00B9F9
	JSR.w CODE_00BA9A
	PLX
	PLP
	RTS

CODE_00B9F9:
	LDA.w #$0002
	STA.b $AC
	LDA.b $56
	AND.w #$0200
	BEQ.b CODE_00BA08
	JSR.w CODE_00BA33
CODE_00BA08:
	LDA.b $56
	AND.w #$0100
	BEQ.b CODE_00BA12
	JSR.w CODE_00BA4B
CODE_00BA12:
	LDA.b $56
	AND.w #$0800
	BEQ.b CODE_00BA1C
	JSR.w CODE_00BA63
CODE_00BA1C:
	LDA.b $56
	AND.w #$0400
	BEQ.b CODE_00BA26
	JSR.w CODE_00BA82
CODE_00BA26:
	LSR.b $AC
	LDA.b $56
	AND.w #$0F00
	BNE.b CODE_00BA32
	JSR.w CODE_00BA63
CODE_00BA32:
	RTS

CODE_00BA33:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CMP.w #$0080
	BCC.b CODE_00BA4A
	SEC
	SBC.b $AC
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w $0A9E
	ORA.w #$4004
	STA.w $0A9E
CODE_00BA4A:
	RTS

CODE_00BA4B:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CMP.w #$0488
	BCS.b CODE_00BA62
	CLC
	ADC.b $AC
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w $0A9E
	AND.w #$BFFB
	STA.w $0A9E
CODE_00BA62:
	RTS

CODE_00BA63:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w #$0004
	CMP.w !RAM_SXAR_SwimStorm_WaterYPosLo
	BCC.b CODE_00BA81
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $AC
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	LDA.w $0A9E
	ORA.w #$0008
	STA.w $0A9E
CODE_00BA81:
	RTS

CODE_00BA82:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CMP.w #$0728
	BCS.b CODE_00BA99
	CLC
	ADC.b $AC
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	LDA.w $0A9E
	AND.w #$FFF7
	STA.w $0A9E
CODE_00BA99:
	RTS

CODE_00BA9A:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STA.b $96
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w #$001A
	STA.b $94
	JSR.w CODE_00B228
	STA.b $98
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CLC
	ADC.w #$001A
	STA.b $94
	JSR.w CODE_00B228
	ORA.b $98
	STA.b $98
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w #$0018
	STA.b $96
	JSR.w CODE_00B228
	ORA.b $98
	STA.b $98
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w #$0018
	STA.b $94
	JSR.w CODE_00B228
	ORA.b $98
	STA.b $98
	BIT.w #$0002
	BNE.b CODE_00BB10
	LDA.b $0E
	AND.w #$000E
	TAY
	LDA.w DATA_01D1B8,y
	CLC
	ADC.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CLC
	ADC.b $82
	AND.w #$FFF8
	CLC
	ADC.w #$0003
	STA.b $94
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w #$000C
	STA.b $96
	JSR.w CODE_00B228
	ORA.b $98
	LDA.b $98
	BIT.w #$0002
	BEQ.b CODE_00BB1D
CODE_00BB10:
	LDA.w $1502
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w $1504
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
CODE_00BB1C:
	RTS

CODE_00BB1D:
	BIT.w #$0010
	BEQ.b CODE_00BB3D
CODE_00BB22:
	LDA.w $1526
	BNE.b CODE_00BB1C
	LDA.w $0A9E
	AND.w #$0120
	BNE.b CODE_00BB1C
	LDA.w #$1000
	JSR.w CODE_00ABE0
	LDA.w #$0802
	JSL.l CODE_028B1F
	RTS

CODE_00BB3D:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	STA.b $94
	LDA.b $0E
	AND.w #$000F
	CLC
	ADC.w #$0001
	EOR.w #$FFFF
	INC
	CLC
	ADC.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0010
	BNE.b CODE_00BB22
	RTS

CODE_00BB5E:
	REP.b #$20
	LDA.b $3A
	BMI.b CODE_00BB6C
	CMP.w #$001B
	BEQ.b CODE_00BB6B
	BCS.b CODE_00BB73
CODE_00BB6B:
	RTS

CODE_00BB6C:
	CLC
	ADC.w #$001C
	STA.b $3A
	RTS

CODE_00BB73:
	SEC
	SBC.w #$001C
	STA.b $3A
	RTS

CODE_00BB7A:
	PHP
	REP.b #$30
	JSR.w CODE_00BB8E
	JSR.w CODE_00BB9D
	JSR.w CODE_00BBAC
	JSR.w CODE_00BBBB
	JSR.w CODE_0094BC
	PLP
	RTS

CODE_00BB8E:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.b $2E
	CMP.w $1512
	BCS.b CODE_00BB9C
	JSR.w CODE_00BBCA
CODE_00BB9C:
	RTS

CODE_00BB9D:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.b $2E
	CMP.w $1514
	BCC.b CODE_00BBAB
	JSR.w CODE_00BBF2
CODE_00BBAB:
	RTS

CODE_00BBAC:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $30
	CMP.w $1516
	BCS.b CODE_00BBBA
	JSR.w CODE_00BC1F
CODE_00BBBA:
	RTS

CODE_00BBBB:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $30
	CMP.w $1518
	BCC.b CODE_00BBC9
	JSR.w CODE_00BC49
CODE_00BBC9:
	RTS

CODE_00BBCA:
	JSR.w CODE_00C228
	JSR.w CODE_00BBD6
	JSR.w CODE_00BBD6
	JSR.w CODE_00BBD6
CODE_00BBD6:
	PHP
	REP.b #$20
	LDA.b $2E
	BEQ.b CODE_00BBF0
	DEC.b $3E
	LDA.b $3E
	LSR
	BCC.b CODE_00BBF0
	DEC.b $2E
	DEC.b $42
	LDA.b $3E
	LSR
	LSR
	BCC.b CODE_00BBF0
	DEC.b $46
CODE_00BBF0:
	PLP
	RTS

CODE_00BBF2:
	JSR.w CODE_00C201
	JSR.w CODE_00BBFE
	JSR.w CODE_00BBFE
	JSR.w CODE_00BBFE
CODE_00BBFE:
	PHP
	REP.b #$20
	LDA.b $2E
	CMP.w #$0340
	BEQ.b CODE_00BC1D
	INC.b $4A
	INC.b $3E
	LDA.b $3E
	LSR
	BCC.b CODE_00BC1D
	INC.b $2E
	INC.b $42
	LDA.b $3E
	LSR
	LSR
	BCC.b CODE_00BC1D
	INC.b $46
CODE_00BC1D:
	PLP
	RTS

CODE_00BC1F:
	JSR.w CODE_00C276
	JSR.w CODE_00BC2B
	JSR.w CODE_00BC2B
	JSR.w CODE_00BC2B
CODE_00BC2B:
	PHP
	REP.b #$20
	LDA.b $30
	BEQ.b CODE_00BC47
	DEC.b $40
	LDA.b $40
	LSR
	BCC.b CODE_00BC47
	DEC.b $30
	DEC.b $44
	DEC.b $4C
	LDA.b $40
	LSR
	LSR
	BCC.b CODE_00BC47
	DEC.b $48
CODE_00BC47:
	PLP
	RTS

CODE_00BC49:
	JSR.w CODE_00C24F
	JSR.w CODE_00BC55
	JSR.w CODE_00BC55
	JSR.w CODE_00BC55
CODE_00BC55:
	PHP
	REP.b #$20
	LDA.b $30
	CMP.w #$0640
	BEQ.b CODE_00BC74
	INC.b $40
	LDA.b $40
	LSR
	BCC.b CODE_00BC74
	INC.b $30
	INC.b $44
	INC.b $4C
	LDA.b $40
	LSR
	LSR
	BCC.b CODE_00BC74
	INC.b $48
CODE_00BC74:
	PLP
	RTS

CODE_00BC76:
	PHP
	SEP.b #$20
	REP.b #$10
	STZ.b $8C
	LDY.w #$0000
	LDX.w #$0190
CODE_00BC83:
	LDA.w $0110,y
	BEQ.b CODE_00BC8F
	CLC
	ADC.b #$F6
	INC.b $8C
	BRA.b CODE_00BC99

CODE_00BC8F:
	LDA.b $8C
	BNE.b CODE_00BC97
	LDA.b #$E0
	BRA.b CODE_00BC99

CODE_00BC97:
	LDA.b #$F6
CODE_00BC99:
	STA.w $0202,x
	INX
	INX
	INX
	INX
	INY
	CPY.w #$0007
	BNE.b CODE_00BC83
	PLP
	RTS

CODE_00BCA8:
	PHP
	SEP.b #$20
	REP.b #$10
	PHX
	LDA.b $10
	BEQ.b CODE_00BCB7
	JSR.w CODE_00BCBD
	BRA.b CODE_00BCBA

CODE_00BCB7:
	JSR.w CODE_00BD10
CODE_00BCBA:
	PLX
	PLP
	RTS

CODE_00BCBD:
	LDX.w #$01AC
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_CurrentHP
	BPL.b CODE_00BCCD
	LDA.b #$00
	STA.w $0B28
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_CurrentHP
CODE_00BCCD:
	LSR
	LSR
	LSR
	LSR
	STA.b $8C
	BEQ.b CODE_00BCE2
	LDA.b #$4C
CODE_00BCD7:
	STA.w $0202,x
	INX
	INX
	INX
	INX
	DEC.b $8C
	BNE.b CODE_00BCD7
CODE_00BCE2:
	LDA.b #$00
	XBA
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_CurrentHP
	CMP.b #$7F
	BEQ.b CODE_00BD0C
	LSR
	LSR
	AND.b #$03
	TAY
	LDA.w DATA_01F93B,y
CODE_00BCF4:
	STA.w $0202,x
	INX
	INX
	INX
	INX
	LDA.b #$68
CODE_00BCFD:
	CPX.w #$01CC
	BEQ.b CODE_00BD0B
	STA.w $0202,x
	INX
	INX
	INX
	INX
	BRA.b CODE_00BCFD

CODE_00BD0B:
	RTS

CODE_00BD0C:
	LDA.b #$4C
	BRA.b CODE_00BCF4

CODE_00BD10:
	REP.b #$30
	LDX.w #$01E8
	LDA.w $14F2
	STA.b $8C
CODE_00BD1A:
	LDA.w #$3B26
	DEC.b $8C
	BPL.b CODE_00BD24
	LDA.w #$0088
CODE_00BD24:
	STA.w $0202,x
	DEX
	DEX
	DEX
	DEX
	CPX.w #$01E0
	BNE.b CODE_00BD1A
	RTS

CODE_00BD31:
	JSR.w CODE_00BD67
	LDA.w $0F78,x
	CMP.w #$0056
	BCC.b CODE_00BD66
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w $0CC6,x
	STA.b $B6
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	LDA.w #DATA_018348
	JSR.w CODE_0096F3
	LDY.b $20
	BMI.b CODE_00BD63
	LDA.b $B6
	STA.w $0CC6,y
CODE_00BD63:
	JMP.w CODE_00AC88

CODE_00BD66:
	RTS

CODE_00BD67:
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BCC.b CODE_00BD72
	JMP.w CODE_00AC88

CODE_00BD72:
	RTS

CODE_00BD73:
	LDA.w $0F78,x
	CMP.w #$0008
	BCC.b CODE_00BDA1
	LDA.w $0762,x
	CLC
	ADC.w #$0000
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0012
	STA.b $6C
	LDA.w $0CC6,x
	STA.b $B6
	LDA.w #DATA_018370
	JSR.w CODE_0096EA
	LDY.b $20
	BMI.b CODE_00BDA1
	LDA.b $B6
	STA.w $0CC6,y
CODE_00BDA1:
	RTS

CODE_00BDA2:
	LDA.w $0F78,x
	CMP.w #$000A
	BCC.b CODE_00BDD0
	LDA.w $0762,x
	CLC
	ADC.w #$0008
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0000
	STA.b $6C
	LDA.w $0CC6,x
	STA.b $B6
	LDA.w #DATA_018398
	JSR.w CODE_0096EA
	LDY.b $20
	BMI.b CODE_00BDD0
	LDA.b $B6
	STA.w $0CC6,y
CODE_00BDD0:
	RTS

CODE_00BDD1:
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	LDA.w $0F78,x
	CMP.w $0CC6,x
	BCC.b CODE_00BDF7
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0000
	STA.b $6C
	LDA.w #DATA_0183C0
	JSR.w CODE_0096EA
	LDY.b $20
	BMI.b CODE_00BDF7
CODE_00BDF7:
	RTS

CODE_00BDF8:
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	LDA.w $0F78,x
	CMP.w #$0008
	BCC.b CODE_00BE49
	LDA.w $04B0,x
	CMP.w #$0180
	BEQ.b CODE_00BE27
	CLC
	ADC.w #$0009
	STA.b $68
	LDA.w $053A,x
	CMP.w #$00D0
	CLC
	ADC.w #$0004
	STA.b $6C
	BEQ.b CODE_00BE24
	BCS.b CODE_00BE27
CODE_00BE24:
	JSR.w CODE_00C1AA
CODE_00BE27:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0001
	STA.b $6C
	LDA.w $0A14,x
	STA.b $B6
	LDA.w #DATA_0183E8
	JSR.w CODE_0096EA
	LDY.b $20
	BMI.b CODE_00BE49
	LDA.b $B6
	STA.w $0A14,y
CODE_00BE49:
	RTS

CODE_00BE4A:
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	LDA.w $0F78,x
	CMP.w #$0008
	BCC.b CODE_00BE7A
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0001
	STA.b $6C
	LDA.w $0A14,x
	STA.b $B6
	LDA.w #DATA_018410
	JSR.w CODE_0096EA
	LDY.b $20
	BMI.b CODE_00BE7A
	LDA.b $B6
	STA.w $0A14,y
CODE_00BE7A:
	RTS

CODE_00BE7B:
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00BE86
	JMP.w CODE_00BF0C

CODE_00BE86:
	BIT.w #$0120
	BNE.b CODE_00BEFD
	LDA.w $0F78,x
	CMP.w #$0010
	BEQ.b CODE_00BEF5
	CMP.w #$0180
	BEQ.b CODE_00BEED
	CMP.w #$0200
	BEQ.b CODE_00BEFD
	CMP.w #$0014
	BCC.b CODE_00BEB8
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BNE.b CODE_00BEFD
CODE_00BEB8:
	LDA.w $0A9E,x
	AND.w #$0008
	STA.b $8E
	JSR.w CODE_00BF46
	LDA.w $0DDA,x
	BNE.b CODE_00BEE0
	LDA.w $0A9E,x
	AND.w #$0008
	CMP.b $8E
	BEQ.b CODE_00BEE0
	LDA.w $0F78,x
	CMP.w #$0032
	BCC.b CODE_00BEE0
	DEC.w $0DDA,x
	JSR.w CODE_00BF2E
CODE_00BEE0:
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	RTS

CODE_00BEED:
	LDA.w #DATA_019CE2
	STA.w $05C4,x
	BRA.b CODE_00BEB8

CODE_00BEF5:
	LDA.w #DATA_019CDA
	STA.w $05C4,x
	BRA.b CODE_00BEB8

CODE_00BEFD:
	LDA.w $0A9E,x
	ORA.w #$0102
	STA.w $0A9E,x
	PHX
	JSR.w CODE_00C5AD
	PLX
	RTS

CODE_00BF0C:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0010
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_0096EA
	LDA.w #$000C
	STA.w $14EE
	LDA.w #$0D02
	JSL.l CODE_028B1F
	RTS

CODE_00BF2E:
	LDA.w $0762,x
	SEC
	SBC.w #$000C
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$000C
	STA.b $6C
	LDA.w #DATA_018692
	JMP.w CODE_009616

CODE_00BF46:
	REP.b #$30
	LDA.w $0A9E,x
	AND.w #$FFF7
	STA.b $8C
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BEQ.b CODE_00BF5A
	BCS.b CODE_00BF61
CODE_00BF5A:
	LDA.b $8C
	ORA.w #$0008
	STA.b $8C
CODE_00BF61:
	LDA.b $8C
	STA.w $0A9E,x
	RTS

CODE_00BF67:
	LDA.w $07EC,x
	SEC
	SBC.w $0900,x
	CLC
	ADC.w #$0020
	CMP.w !RAM_SXAR_SwimStorm_WaterYPosLo
	BEQ.b CODE_00BF79
	BCS.b CODE_00BF83
CODE_00BF79:
	LDA.w $0A9E,x
	AND.w #$FFF7
	STA.w $0A9E,x
	CLC
CODE_00BF83:
	RTS

CODE_00BF84:						; Note: Swimming storm sprite.
	JSR.w CODE_00BF46
	JSR.w CODE_00AA1A
	JSR.w CODE_00ACBA
	JSR.w CODE_00B9E0
	JSR.w CODE_00AD1B
	JSL.l CODE_028C0D
	JSR.w CODE_00BFA7
	JSR.w CODE_00C037
	JSR.w CODE_00BFD0
	JSR.w CODE_00CC50
	JSR.w CODE_00D39B
	RTS

CODE_00BFA7:
	LDA.w $0DDA
	ASL
	TAY
	LDA.w DATA_019D12,y
	STA.w $064E
	ASL
	ASL
	ASL
	STA.w $0876
	LDA.w DATA_019D2A,y
	STA.w $06D8
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0008
	STA.w $0900
	LDA.w DATA_019D42,y
	STA.w $05C4
	RTS

CODE_00BFCF:
	RTS

CODE_00BFD0:
	LDA.b $56,x
	AND.w #$4000
	BEQ.b CODE_00BFCF
	LDA.b $5A,x
	AND.w #$4000
	BNE.b CODE_00BFCF
	LDA.w $0428
	BNE.b CODE_00BFCF
	LDA.w $0DDA
	ASL
	TAY
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CLC
	ADC.w #$0018
	STA.b $68
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CLC
	ADC.w DATA_01DBCC,y
	STA.b $6C
	LDX.w #$0002
	LDA.w #DATA_018578
	JSR.w CODE_0096EA
	LDY.w #$0008
	LDA.w $0A9E
	AND.w #$4000
	BEQ.b CODE_00C01A
	INY
	INY
	LDA.w $0764
	SEC
	SBC.w #$0030
	STA.w $0764
CODE_00C01A:
	LDA.w DATA_01D282,y
	STA.w $0CC8
	LDA.w DATA_01D292,y
	STA.w $0D52
	LDA.w DATA_01A224,y
	STA.w $05C6
	LDA.w #$0502
	JSL.l CODE_028B1F
	DEC.w $14E4
	RTS

CODE_00C037:
	REP.b #$30
	LDA.w $0B28
	BEQ.b CODE_00C05A
	BMI.b CODE_00C05A
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CLC
	ADC.w #$0004
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCC.b CODE_00C070
	LDA.w $0B28
	CLC
	ADC.w #$0040
	BPL.b CODE_00C07C
	LDA.w #$7FFE
	BRA.b CODE_00C07C

CODE_00C05A:
	LDA.w $0A9E
	BIT.w #$0100
	BNE.b CODE_00C0C8
	ORA.w #$0100
	STA.w $0A9E
	STZ.w $0F78
	JSL.l CODE_028BB9
	RTS

CODE_00C070:
	LDA.w $0B28
	SEC
	SBC.w #$0008
	BPL.b CODE_00C07C
	LDA.w #$0000
CODE_00C07C:
	STA.w $0B28
	BEQ.b CODE_00C083
	BPL.b CODE_00C08B
CODE_00C083:
	LDA.w $1506
	BEQ.b CODE_00C08B
	INC.w $0B28
CODE_00C08B:
	LDA.b $0E
	AND.w #$007F
	BNE.b CODE_00C0C8
	LDA.w $0A9E
	BIT.w #$0100
	BNE.b CODE_00C0C8
	STZ.b $8C
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00C0A9
	LDA.w #$0004
	STA.b $8C
CODE_00C0A9:
	LDA.w $064E
	ASL
	ASL
	ASL
	CLC
	ADC.b $8C
	TAY
	LDA.w DATA_019CEA,y
	CLC
	ADC.w $04B0
	STA.b $68
	LDA.w DATA_019CEA+$02,y
	CLC
	ADC.w $053A
	STA.b $6C
	JMP.w CODE_00C17C

CODE_00C0C8:
	RTS

CODE_00C0C9:
	PHP
	REP.b #$30
	LDA.w #$00AA
	STA.w $0416
	STA.w $0417
	REP.b #$10
	SEP.b #$20
	LDX.w #$0000
	LDY.w #$0160
CODE_00C0DF:
	LDA.w $149C,x
	BEQ.b CODE_00C0F7
	JSR.w CODE_00C142
	JSR.w CODE_00C104
CODE_00C0EA:
	INY
	INY
	INY
	INY
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_00C0DF
	PLP
	RTS

CODE_00C0F7:
	REP.b #$20
	LDA.w #$F0F0
	STA.w $14AC,x
	STA.w $0200,y
	BRA.b CODE_00C0EA

CODE_00C104:
	PHP
	REP.b #$20
	DEC.w $14CC,x
	BPL.b CODE_00C140
	SEP.b #$20
	LDA.w $14AD,x
	CMP.w $14DE
	BCC.b CODE_00C16C
	SEC
	SBC.w $14BD,x
	STA.w $14AD,x
	BCC.b CODE_00C16C
	REP.b #$20
	LDA.w $14BC,x
	CLC
	ADC.w #$0017
	STA.w $14BC,x
	LDA.w $14CC,x
	LSR
	LSR
	AND.w #$0003
	STA.b $90
	LDA.w $14AC,x
	AND.w #$FFFC
	ORA.b $90
	STA.w $0200,y
CODE_00C140:
	PLP
	RTS

CODE_00C142:
	PHP
	REP.b #$20
	LDA.w $14CC,x
	BPL.b CODE_00C15D
	LDA.b $0E
	AND.w #$0007
	BNE.b CODE_00C15D
	LDA.w $149C,x
	CMP.w #$0007
	BEQ.b CODE_00C15D
	INC
	STA.w $149C,x
CODE_00C15D:
	PHX
	LDA.w $149C,x
	ASL
	TAX
	LDA.w DATA_01FA48,x
	PLX
	STA.w $0202,y
CODE_00C16A:
	PLP
	RTS

CODE_00C16C:
	REP.b #$20
	STZ.w $149C,x
	LDA.w #$F0F0
	STA.w $14AC,x
	STA.w $0200,y
	BRA.b CODE_00C16A

CODE_00C17C:
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CLC
	ADC.w #$0005
	CMP.w $07EC,x
	BEQ.b CODE_00C18A
	BCS.b CODE_00C1A1
CODE_00C18A:
	LDA.w #$0102
	JSL.l CODE_028B1F
CODE_00C191:
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BEQ.b CODE_00C19B
	BCS.b CODE_00C1A1
CODE_00C19B:
	LDY.w #$0000
	BRA.b CODE_00C1C1

CODE_00C1A0:
	RTS

CODE_00C1A1:
	LDA.w #$1F02
	JSL.l CODE_028B1F
	BRA.b CODE_00C191

CODE_00C1AA:
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BEQ.b CODE_00C1B4
	BCS.b CODE_00C1C0
CODE_00C1B4:
	LDA.w #$0402
	JSL.l CODE_028B1F
	LDY.w #$0008
	BRA.b CODE_00C1C1

CODE_00C1C0:
	RTS

CODE_00C1C1:
	LDA.w $14A2,y
	BNE.b CODE_00C200
	LDA.b $68
	AND.w #$00FF
	STA.b $8C
	LDA.b $6B
	AND.w #$FF00
	ORA.b $8C
	STA.b $8C
	STZ.b $8E
CODE_00C1D8:
	LDA.w #$0001
	STA.w $149C,y
	LDA.w #$0000
	STA.w $14BC,y
	LDA.b $8C
	STA.w $14AC,y
	LDA.b $8E
	STA.w $14CC,y
	CLC
	ADC.w #$0007
	STA.b $8E
	INY
	INY
	CPY.w #$0008
	BEQ.b CODE_00C200
	CPY.w #$0010
	BNE.b CODE_00C1D8
CODE_00C200:
	RTS

CODE_00C201:
	PHP
	SEP.b #$30
	LDY.b #$08
CODE_00C206:
	LDA.w $149C,y
	BEQ.b CODE_00C220
	LDA.w $14AC,y
	SEC
	SBC.b #$01
	STA.w $14AC,y
	BCS.b CODE_00C220
	LDA.b #$00
	STA.w $149C,y
	LDA.b #$F0
	STA.w $14AD,y
CODE_00C220:
	INY
	INY
	CPY.b #$10
	BNE.b CODE_00C206
	PLP
	RTS

CODE_00C228:
	PHP
	SEP.b #$30
	LDY.b #$08
CODE_00C22D:
	LDA.w $149C,y
	BEQ.b CODE_00C247
	LDA.w $14AC,y
	CLC
	ADC.b #$01
	STA.w $14AC,y
	BCC.b CODE_00C247
	LDA.b #$00
	STA.w $149C,y
	LDA.b #$F0
	STA.w $14AD,y
CODE_00C247:
	INY
	INY
	CPY.b #$10
	BNE.b CODE_00C22D
	PLP
	RTS

CODE_00C24F:
	PHP
	SEP.b #$30
	LDY.b #$08
CODE_00C254:
	LDA.w $149C,y
	BEQ.b CODE_00C26E
	LDA.w $14AD,y
	SEC
	SBC.b #$01
	STA.w $14AD,y
	BCS.b CODE_00C26E
	LDA.b #$00
	STA.w $149C,y
	LDA.b #$F0
	STA.w $14AD,y
CODE_00C26E:
	INY
	INY
	CPY.b #$10
	BNE.b CODE_00C254
	PLP
	RTS

CODE_00C276:
	PHP
	SEP.b #$30
	LDY.b #$08
CODE_00C27B:
	LDA.w $149C,y
	BEQ.b CODE_00C295
	LDA.w $14AD,y
	CLC
	ADC.b #$01
	STA.w $14AD,y
	BCC.b CODE_00C295
	LDA.b #$00
	STA.w $149C,y
	LDA.b #$F0
	STA.w $14AD,y
CODE_00C295:
	INY
	INY
	CPY.b #$10
	BNE.b CODE_00C27B
	PLP
	RTS

CODE_00C29D:
	JSR.w CODE_00CD72
	JSR.w CODE_00C34E
	BCS.b CODE_00C306
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00C2B0
	JSR.w CODE_00B304
CODE_00C2B0:
	STZ.b $AC
	LDA.w $0F78,x
	CMP.w #$0007
	BCC.b CODE_00C2DE
	AND.w #$00FF
	BEQ.b CODE_00C2C6
	LDA.b $06
	AND.w #$001F
	BNE.b CODE_00C2DE
CODE_00C2C6:
	STZ.w $0CC6,x
	LDA.w $0A9E,x
	AND.w #$4000
	STA.b $AC
	JSR.w CODE_0097C4
	LDA.w $0A9E,x
	AND.w #$4000
	EOR.b $AC
	STA.b $AC
CODE_00C2DE:
	JSR.w CODE_0097D3
	JSR.w CODE_00BF67
	JSR.w CODE_00C3A8
	LDA.w $0762,x
	STA.w $1502
	LDA.w $07EC,x
	STA.w $1504
	JSR.w CODE_0097B0
	JSR.w CODE_00C331
	BNE.b CODE_00C307
	JSR.w CODE_0097B5
	JSR.w CODE_00C331
	BNE.b CODE_00C317
	JSR.w CODE_00C331
CODE_00C306:
	RTS

CODE_00C307:
	LDA.w $0A9E,x
	EOR.w #$4004
	STA.w $0A9E,x
	LDA.w $1502
	STA.w $0762,x
	RTS

CODE_00C317:
	LDA.w $0A9E,x
	EOR.w #$0008
	STA.w $0A9E,x
	LDA.w $1504
	STA.w $07EC,x
	RTS

CODE_00C327:
	LDA.w $0A9E,x
	EOR.w #$0004
	STA.w $0A9E,x
	RTS

CODE_00C331:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$0000
	STA.b $96
	JSR.w CODE_00B228
	AND.w #$0002
	BEQ.b CODE_00C34D
	STZ.w $0F78,x
	INC.w $0F78,x
CODE_00C34D:
	RTS

CODE_00C34E:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00C383
	AND.w #$3FFF
	STA.w $0A9E,x
	LDA.w #DATA_019F5C
	STA.w $05C4,x
	LDA.w $0F78,x
	BEQ.b CODE_00C37A
	CMP.w #$000A
	BCC.b CODE_00C378
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JMP.w CODE_00AC88

CODE_00C378:
	SEC
	RTS

CODE_00C37A:
	LDA.w #$0B02
	JSL.l CODE_028B1F
	BRA.b CODE_00C378

CODE_00C383:
	CLC
	RTS

CODE_00C385:
	LDA.w $07EC,x
	SEC
	SBC.w $0900,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BEQ.b CODE_00C393
	BCS.b CODE_00C3A7
CODE_00C393:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w $0900
	CMP.w $07EC,x
	BEQ.b CODE_00C3A1
	BCS.b CODE_00C3A7
CODE_00C3A1:
	LDA.w #$000C
	STA.b $8C
	RTS

CODE_00C3A7:
	RTS

CODE_00C3A8:
	STZ.b $8C
	LDA.b $AC
	BNE.b CODE_00C3D7
	JSR.w CODE_00C385
	DEC.w $0CC6,x
	BPL.b CODE_00C3D5
	LDA.w #$000B
	STA.w $0CC6,x
	LDA.w $0D50,x
	INC
	AND.w #$0003
	STA.w $0D50,x
	CLC
	ADC.w $0DDA,x
	CLC
	ADC.b $8C
	ASL
	TAY
	LDA.w DATA_019F0E,y
	STA.w $05C4,x
CODE_00C3D5:
	RTS

CODE_00C3D6:
	RTS

CODE_00C3D7:
	LDA.w #$0003
	STA.w $0CC6,x
	LDA.w $0DDA,x
	CLC
	ADC.w #$0002
	ASL
	TAY
	LDA.w DATA_019F3E,y
	STA.w $05C4,x
	RTS

CODE_00C3ED:
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	LDA.w $0F78,x
	CMP.w #$0001
	BEQ.b CODE_00C41D
CODE_00C3FE:
	CMP.w #$0020
	BCC.b CODE_00C408
	BEQ.b CODE_00C408
	JMP.w CODE_00AC88

CODE_00C408:
	CMP.w #$0010
	BEQ.b CODE_00C436
	CMP.w #$0011
	BEQ.b CODE_00C436
	CMP.w #$0012
	BEQ.b CODE_00C436
	CMP.w #$0013
	BEQ.b CODE_00C436
	RTS

CODE_00C41D:
	LDY.w !RAM_SXAR_Global_CurrentLevelLo
	CPY.w #!Define_SXAR_LevelID_Cyclops1
	BCC.b CODE_00C3FE
	LDA.w #DATA_019F84
	STA.w $05C4,x
	LDA.w #$0800
	STA.w $0C3C,x
	LDA.w $0F78,x
	BRA.b CODE_00C3FE

CODE_00C436:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_00C470
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.b $6C
	LDA.w #DATA_0184D8
	JSR.w CODE_009616
	LDY.b $20
	BMI.b CODE_00C470
	PHX
	LDA.w $14EC
	INC
	AND.w #$0007
	STA.w $14EC
	ASL
	TAX
	LDA.w DATA_01D2C2,x
	STA.w $0CC6,y
	LDA.w DATA_01D2D2,x
	STA.w $0D50,y
	PLX
CODE_00C470:
	RTS

CODE_00C471:
	LDA.w $0F78,x
	BEQ.b CODE_00C4A5
CODE_00C476:
	CMP.w #$0030
	BNE.b CODE_00C47E
	JMP.w CODE_00AC88

CODE_00C47E:
	LSR
	LSR
	AND.w #$0006
	TAY
	LDA.w $0A9E,x
	AND.w #$3FFF
	ORA.w DATA_01FD6A,y
	STA.w $0A9E,x
	LDA.w $0762,x
	CLC
	ADC.w $0CC6,x
	STA.w $0762,x
	LDA.w $07EC,x
	CLC
	ADC.w $0D50,x
	STA.w $07EC,x
	RTS

CODE_00C4A5:
	LDY.w !RAM_SXAR_Global_CurrentLevelLo
	CPY.w #!Define_SXAR_LevelID_Cyclops1
	BCC.b CODE_00C476
	LDA.w $0A9E,x
	AND.w #$EFFF
	STA.w $0A9E,x
	LDA.w #DATA_019FC4
	STA.w $05C4,x
	LDA.w $0F78,x
	BRA.b CODE_00C476

CODE_00C4C1:
	JSR.w CODE_00C4CE
	JSR.w CODE_00C4FB
	JSR.w CODE_00C511
	JSR.w CODE_00C58F
	RTS

CODE_00C4CE:
	LDA.w $0762,x
	CLC
	ADC.w $0CC6,x
	STA.w $0762,x
	LDA.w $07EC,x
	CLC
	ADC.w $0D50,x
	STA.w $07EC,x
	RTS

CODE_00C4E3:
	LDA.w $0F78,x
	LSR
	LSR
	AND.w #$0003
	ROR
	ROR
	STA.b $8C
	LDA.w $0A9E,x
	AND.w #$3FFF
	ORA.b $8C
	STA.w $0A9E,x
	RTS

CODE_00C4FB:
	LDA.w $0F78,x
	CMP.w #$0024
	BEQ.b CODE_00C505
	BCS.b CODE_00C50D
CODE_00C505:
	LDA.w $04B0,x
	CMP.w #$0180
	BNE.b CODE_00C510
CODE_00C50D:
	JMP.w CODE_00AC88

CODE_00C510:
	RTS

CODE_00C511:
	LDA.w $0F78,x
	CMP.w #$0003
	BCC.b CODE_00C53A
	LDA.w $0A9E,x
	AND.w #$0120
	BNE.b CODE_00C53A
	LDA.w #$0800
	STA.b $64
	LDA.w #$0120
	STA.b $66
	LDA.w #$0001
	STA.b $68
	LDA.w #$0001
	STA.b $6C
	JSR.w CODE_00AB43
	BCS.b CODE_00C53B
CODE_00C53A:
	RTS

CODE_00C53B:
	LDA.w $0C3C,x
	JSR.w CODE_00ABD4
	LDA.w $0A9E,y
	BIT.w #$0100
	BNE.b CODE_00C54C
	JMP.w CODE_00AC88

CODE_00C54C:
	LDA.w $0762,y
	STA.b $68
	LDA.w $0900,y
	LSR
	STA.b $8C
	LDA.w $07EC,y
	SEC
	SBC.b $8C
	SEC
	SBC.w #$0008
	STA.b $6C
	LDA.w #DATA_0185C8
	JSR.w CODE_0096EA
	LDA.w $14EA
	INC
	AND.w #$0007
	STA.w $14EA
	ASL
	TAY
	LDA.w DATA_01A10A,y
	STA.w $0DDA,x
	LDA.w DATA_01D2A2,y
	STA.w $0CC6,x
	LDA.w DATA_01D2B2,y
	STA.w $0D50,x
	LDA.w #$0502
	JSL.l CODE_028B1F
	RTS

CODE_00C58F:
	LDA.w $1002,x
	CMP.w #$0003
	BCC.b CODE_00C5AC
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	AND.w #$0002
	BEQ.b CODE_00C5AC
	JMP.w CODE_00AC88

CODE_00C5AC:
	RTS

CODE_00C5AD:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0008
	STA.b $6C
	STZ.b $AC
CODE_00C5BD:
	LDA.w #DATA_0185A0
	JSR.w CODE_009616
	LDY.b $20
	BMI.b CODE_00C5E4
	PHX
	LDX.b $AC
	LDA.w DATA_01A006,x
	STA.w $0DDA,y
	LDA.w DATA_01A006+$02,x
	STA.w $0D50,y
	TXA
	CLC
	ADC.w #$0004
	STA.b $AC
	PLX
CODE_00C5DE:
	CMP.w #$0020
	BNE.b CODE_00C5BD
	RTS

CODE_00C5E4:
	LDA.b $AC
	CLC
	ADC.w #$0004
	STA.b $AC
	BRA.b CODE_00C5DE

CODE_00C5EE:
	LDA.w $0F78,x
	CMP.w #$0020
	BNE.b CODE_00C5F9
	JMP.w CODE_00AC88

CODE_00C5F9:
	LDA.w $0762,x
	CLC
	ADC.w $0DDA,x
	STA.w $0762,x
	LDA.w $07EC,x
	CLC
	ADC.w $0D50,x
	STA.w $07EC,x
	RTS

CODE_00C60E:
	LDA.w $0F78,x
	CMP.w #$0001
	BEQ.b CODE_00C626
	CMP.w #$0028
	BNE.b CODE_00C61E
	JMP.w CODE_00AC88

CODE_00C61E:
	CMP.w #$0018
	BEQ.b CODE_00C625
	BCS.b CODE_00C640
CODE_00C625:
	RTS

CODE_00C626:
	LDA.w $07EC,x
	CLC
	ADC.w #$0008
	STA.w $07EC,x
	LDA.w #$0002
	STA.w $064E,x
	STA.w $06D8,x
	LDA.w $0DDA,x
	STA.w $05C4,x
	RTS

CODE_00C640:
	LDA.w $0762,x
	CLC
	ADC.w $0CC6,x
	STA.w $0762,x
	LDA.w $07EC,x
	CLC
	ADC.w $0D50,x
	STA.w $07EC,x
	RTS

CODE_00C655:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00C660
	JSR.w CODE_00B304
CODE_00C660:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00C688
	LDA.w $0762,x
	CLC
	ADC.w #$0000
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0018
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_0096EA
	LDA.w #$0202
	JSL.l CODE_028B1F
	RTS

CODE_00C688:
	JSR.w CODE_00C727
	JSR.w CODE_0097C4
	JSR.w CODE_00BF67
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	JSR.w CODE_00C6AE
	LDA.w #DATA_01A0FA
	STA.w $05C4,x
	LDA.b $0E
	AND.w #$0002
	BEQ.b CODE_00C6AD
	LDA.w #DATA_01A102
	STA.w $05C4,x
CODE_00C6AD:
	RTS

CODE_00C6AE:
	LDA.w $1002,x
	AND.w #$007F
	BNE.b CODE_00C6D6
	LDA.w $0762,x
	SEC
	SBC.w #$0008
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4004
	ORA.w #$1800
	STA.b $70
	LDA.w #DATA_018AA2
	JSR.w CODE_009616
	RTS

CODE_00C6D6:
	AND.w #$001F
	BNE.b CODE_00C6FE
	LDA.w $0762,x
	SEC
	SBC.w #$000C
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0008
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4004
	ORA.w #$5804
	STA.b $70
	LDA.w #DATA_018B1A
	JMP.w CODE_009616

CODE_00C6FE:
	RTS

CODE_00C6FF:
	LDA.w $0F78,x
	AND.w #$003F
	BNE.b CODE_00C726
	LDA.w $06D8,x
	CMP.w #$0009
	BEQ.b CODE_00C726
	INC.w $06D8,x
	LDA.w $07EC,x
	CLC
	ADC.w #$0010
	STA.w $07EC,x
	LDA.w $0900,x
	CLC
	ADC.w #$0010
	STA.w $0900,x
CODE_00C726:
	RTS

CODE_00C727:
	LDA.w $07EC,x
	CMP.w !RAM_SXAR_SwimStorm_WaterYPosLo
	BEQ.b CODE_00C731
	BCS.b CODE_00C734
CODE_00C731:
	JMP.w CODE_00AC88

CODE_00C734:
	RTS

CODE_00C735:
	PHP
	REP.b #$30
	LDA.w $14F0
	BNE.b CODE_00C740
	JMP.w CODE_00C7BB

CODE_00C740:
	LDA.w $14EE
	INC
	CMP.w #$0023
	BNE.b CODE_00C74C
	LDA.w #$0000
CODE_00C74C:
	STA.w $14EE
	ASL
	ASL
	ASL
	ASL
	TAY
	SEP.b #$20
	LDA.b #$B0
	STA.w $2121
	LDA.w DATA_01FA9A,y
	STA.w $2122
	LDA.w DATA_01FA9A+$01,y
	STA.w $2122
	LDA.w DATA_01FA9A+$02,y
	STA.w $2122
	LDA.w DATA_01FA9A+$03,y
	STA.w $2122
	LDA.w DATA_01FA9A+$04,y
	STA.w $2122
	LDA.w DATA_01FA9A+$05,y
	STA.w $2122
	LDA.w DATA_01FA9A+$06,y
	STA.w $2122
	LDA.w DATA_01FA9A+$07,y
	STA.w $2122
	LDA.w DATA_01FA9A+$08,y
	STA.w $2122
	LDA.w DATA_01FA9A+$09,y
	STA.w $2122
	LDA.w DATA_01FA9A+$0A,y
	STA.w $2122
	LDA.w DATA_01FA9A+$0B,y
	STA.w $2122
	LDA.w DATA_01FA9A+$0C,y
	STA.w $2122
	LDA.w DATA_01FA9A+$0D,y
	STA.w $2122
	LDA.w DATA_01FA9A+$0E,y
	STA.w $2122
	LDA.w DATA_01FA9A+$0F,y
	STA.w $2122
CODE_00C7BB:
	PLP
	RTS

CODE_00C7BD:
	LDA.w $0A9E,x
	BIT.w #$0020
	BNE.b CODE_00C7E4
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BCC.b CODE_00C7D2
	BEQ.b CODE_00C7D2
	JMP.w CODE_00C7E4

CODE_00C7D2:
	LDA.w $0F78,x
	CMP.w #$001F
	BCC.b CODE_00C81E
CODE_00C7DA:
	JSR.w CODE_0097B0
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	RTS

CODE_00C7E4:
	LDA.w $05C4,x
	CMP.w #DATA_01A128
	BEQ.b CODE_00C7F4
	CMP.w #DATA_01A17A
	BEQ.b CODE_00C817
	JMP.w CODE_00AC88

CODE_00C7F4:
	LDA.w #DATA_01A17A
	STA.w $05C4,x
	LDA.w #$0002
	STA.w $064E,x
	STA.w $06D8,x
	LDA.w $0A9E,x
	AND.w #$3FFE
	STA.w $0A9E,x
	LDA.w $07EC,x
	SEC
	SBC.w #$0008
	STA.w $07EC,x
	RTS

CODE_00C817:
	LDA.w #DATA_01A182
	STA.w $05C4,x
	RTS

CODE_00C81E:
	LSR
	AND.w #$000E
	TAY
	LDA.w DATA_01A12A,y
	STA.w $05C4,x
	BRA.b CODE_00C7DA

CODE_00C82B:
	LDA.w $0F78,x
	CMP.w #$0001
	BEQ.b CODE_00C839
	AND.w #$003F
	BEQ.b CODE_00C844
CODE_00C838:
	RTS

CODE_00C839:
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BCC.b CODE_00C838
	JMP.w CODE_00AC88

CODE_00C844:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #DATA_018640
	JSR.w CODE_009616
	RTS

CODE_00C855:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00C860
	JSR.w CODE_00B304
CODE_00C860:
	LDA.w $1002,x
	BNE.b CODE_00C868
	JSR.w CODE_00C8FC
CODE_00C868:
	JSR.w CODE_00F42A
	CMP.w #$00A8
	BEQ.b CODE_00C872
	BCS.b CODE_00C8A8
CODE_00C872:
	JSR.w CODE_0097C4
	LDA.w $0A9E,x
	BIT.w #$0008
	BEQ.b CODE_00C887
	LDA.w $07EC,x
	CMP.w $0DDA,x
	BCC.b CODE_00C8A0
	BRA.b CODE_00C891

CODE_00C887:
	LDA.w $07EC,x
	CMP.w $0D50,x
	BEQ.b CODE_00C891
	BCS.b CODE_00C8A0
CODE_00C891:
	JSR.w CODE_0097D3
	JSR.w CODE_00C8A9
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	JSR.w CODE_0097BA
CODE_00C8A0:
	LDA.w $1002,x
	AND.w #$001F
	BEQ.b CODE_00C8C1
CODE_00C8A8:
	RTS

CODE_00C8A9:
	LDA.w $07EC,x
	SEC
	SBC.w #$0018
	CMP.w !RAM_SXAR_SwimStorm_WaterYPosLo
	BEQ.b CODE_00C8B7
	BCS.b CODE_00C8A8
CODE_00C8B7:
	LDA.w $0A9E,x
	AND.w #$FFF7
	STA.w $0A9E,x
	RTS

CODE_00C8C1:
	LDA.w #$0C02
	JSL.l CODE_028B1F
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00C8D9
	LDA.w $0762,x
	CLC
	ADC.w #$0018
	BRA.b CODE_00C8E0

CODE_00C8D9:
	LDA.w $0762,x
	SEC
	SBC.w #$0018
CODE_00C8E0:
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0008
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4004
	ORA.w #$1001
	STA.b $70
	LDA.w #DATA_018B42
	JMP.w CODE_009616

CODE_00C8FC:
	LDA.w $07EC,x
	STA.w $0D50,x
	SEC
	SBC.w #$0040
	STA.w $0DDA,x
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm2
	BNE.b CODE_00C917
	LDA.w #$1000
	STA.w $0B28,x
CODE_00C917:
	RTS

CODE_00C918:
	LDA.w $0A9E,x
	AND.w #$3FFF
	STA.w $0A9E,x
	LDA.w $0F78,x
	CMP.w #$000A
	BEQ.b CODE_00C93C
	CMP.w #$0014
	BEQ.b CODE_00C943
	CMP.w #$001E
	BEQ.b CODE_00C94A
	CMP.w #$0028
	BNE.b CODE_00C93B
	JMP.w CODE_00AC88

CODE_00C93B:
	RTS

CODE_00C93C:
	LDA.w #DATA_01A192
	STA.w $05C4,x
	RTS

CODE_00C943:
	LDA.w #DATA_01A19A
	STA.w $05C4,x
	RTS

CODE_00C94A:
	LDA.w #DATA_01A1A2
	STA.w $05C4,x
	RTS

CODE_00C951:
	LDA.w $0762,x
	SEC
	SBC.b $8C
	BPL.b CODE_00C95C
	LDA.w #$0000
CODE_00C95C:
	STA.w $0762,x
	RTS

CODE_00C960:
	LDA.w $0762,x
	CLC
	ADC.b $8C
	CMP.w #$043F
	BCC.b CODE_00C977
	LDA.w $0A9E,x
	ORA.w #$0004
	STA.w $0A9E,x
	LDA.w #$043E
CODE_00C977:
	STA.w $0762,x
	RTS

CODE_00C97B:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00C986
	JSR.w CODE_00B304
CODE_00C986:
	LDA.w $1002,x
	BNE.b CODE_00C9A4
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm2
	BNE.b CODE_00C9A4
	LDA.w $0426,x
	SEC
	SBC.w #$0037
	BMI.b CODE_00C9A4
	ASL
	TAY
	LDA.w DATA_01FD72,y
	STA.w $0C3C,x
CODE_00C9A4:
	LDA.w $0A9E,x
	BIT.w #$0100
	BNE.b CODE_00C9DB
	BIT.w #$0020
	BNE.b CODE_00C9B8
	LDA.w #DATA_019B0A
	STA.w $05C4,x
	RTS

CODE_00C9B8:
	LDA.w $0F78,x
	BEQ.b CODE_00C9D2
	CMP.w #$0014
	BEQ.b CODE_00C9C4
	BCS.b CODE_00C9CB
CODE_00C9C4:
	LDA.w #DATA_01A026
	STA.w $05C4,x
	RTS

CODE_00C9CB:
	LDA.w #DATA_01A02E
	STA.w $05C4,x
	RTS

CODE_00C9D2:
	LDA.w #$0A02
	JSL.l CODE_028B1F
	BRA.b CODE_00C9C4

CODE_00C9DB:
	LDA.w $04B0,x
	CMP.w #$0180
	BEQ.b CODE_00C9FF
	STA.b $68
	LDA.w $053A,x
	CMP.w #$00D0
	CLC
	ADC.w #$0004
	STA.b $6C
	BEQ.b CODE_00C9F5
	BCS.b CODE_00C9FF
CODE_00C9F5:
	JSR.w CODE_00C1AA
	LDA.w #$0202
	JSL.l CODE_028B1F
CODE_00C9FF:
	LDA.w $0C3C,x
	CLC
	ADC.w $14E0
	STA.w $14E0
	LDY.w $0DDA,x
	LDA.w #$0001
	STA.w $1430,y
	LDA.w $0762,x
	CLC
	ADC.w #$0000
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0018
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_0096EA
	LDA.w #$000C
	STA.w $14EE
	RTS

CODE_00CA31:
	PHP
	REP.b #$30
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC000>>16)
	LDX.w #$7FC000
	LDY.w #!Define_SXAR_Graphics_Sprite_SwimmingStormEnemies
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E7000>>16)
	LDX.w #$7E7000
	LDY.w #!Define_SXAR_LevelBG_Storm1
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E9000>>16)
	LDX.w #$7E9000
	LDY.w #!Define_SXAR_Tilemap_Layer3_Water
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_SwimmingStormLevel
	JSL.l CODE_028000
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm2
	BEQ.b CODE_00CA89
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Storm1
	JSL.l CODE_028000
	BRA.b CODE_00CA98

CODE_00CA89:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Storm2
	JSL.l CODE_028000
CODE_00CA98:
	PLP
	RTS

CODE_00CA9A:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00CAA5
	JSR.w CODE_00B304
CODE_00CAA5:
	LDA.w $1002,x
	BNE.b CODE_00CAAD
	JSR.w CODE_00CACA
CODE_00CAAD:
	LDA.w $0F78,x
	CMP.w #$0032
	BEQ.b CODE_00CB1A
CODE_00CAB5:
	JSR.w CODE_0097D3
	JSR.w CODE_00BF67
	LDA.w $0A9E,x
	BIT.w #$0120
	BNE.b CODE_00CAC6
	JSR.w CODE_0097B0
CODE_00CAC6:
	JSR.w CODE_00CAE1
	RTS

CODE_00CACA:
	LDA.w $0762,x
	STA.w $0DDA,x
	SEC
	SBC.w #$00D0
	STA.w $0D50,x
	LDA.w $0A9E,x
	ORA.w #$0004
	STA.w $0A9E,x
	RTS

CODE_00CAE1:
	LDA.w $1002,x
	AND.w #$000F
	BNE.b CODE_00CAEC
	JMP.w CODE_00CB72

CODE_00CAEC:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00CAF7
	JMP.w CODE_00CB63

CODE_00CAF7:
	BIT.w #$0004
	BEQ.b CODE_00CB05
	LDA.w $0762,x
	CMP.w $0D50,x
	BCC.b CODE_00CB10
	RTS

CODE_00CB05:
	LDA.w $0762,x
	CMP.w $0DDA,x
	BEQ.b CODE_00CB0F
	BCS.b CODE_00CB10
CODE_00CB0F:
	RTS

CODE_00CB10:
	LDA.w $0A9E,x
	EOR.w #$4004
	STA.w $0A9E,x
	RTS

CODE_00CB1A:
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	LDA.w #$0101
	STA.w $098A,x
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00CB3A
	LDA.w $0762,x
	CLC
	ADC.w #$0020
	BRA.b CODE_00CB41

CODE_00CB3A:
	LDA.w $0762,x
	SEC
	SBC.w #$0040
CODE_00CB41:
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4004
	ORA.w #$1800
	STA.b $70
	LDA.w #DATA_018AA2
	JSR.w CODE_009616
	LDA.w #$1002
	JSL.l CODE_028B1F
	JMP.w CODE_00CAB5

CODE_00CB63:
	PHA
	LDA.w $0F78,x
	BNE.b CODE_00CB70
	LDA.w #$0602
	JSL.l CODE_028B1F
CODE_00CB70:
	PLA
CODE_00CB71:
	RTS

CODE_00CB72:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00CB7D
	JMP.w CODE_00CB63

CODE_00CB7D:
	BIT.w #$0004
	BEQ.b CODE_00CB8B
	LDA.w $0762,x
	SEC
	SBC.w #$0012
	BRA.b CODE_00CB92

CODE_00CB8B:
	LDA.w $0762,x
	CLC
	ADC.w #$0012
CODE_00CB92:
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BEQ.b CODE_00CB71
	JMP.w CODE_00CB10

CODE_00CBA4:
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00CBAF
	JMP.w CODE_00CC01

CODE_00CBAF:
	LDA.b $0E
	AND.w #$007F
	BNE.b CODE_00CBC0
	LDA.w $0D50,x
	LSR
	ORA.w #$001F
	STA.w $0D50,x
CODE_00CBC0:
	LDA.w $0F78,x
	AND.w $0D50,x
	BNE.b CODE_00CBCB
	JSR.w CODE_0097C4
CODE_00CBCB:
	JSR.w CODE_0097D3
	JSR.w CODE_00BF67
	BCS.b CODE_00CBD9
	LDA.w #$0100
	STA.w $0A14,x
CODE_00CBD9:
	JSR.w CODE_0097B0
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	LDA.w $0F78,x
	AND.w #$0001
	BEQ.b CODE_00CC15
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$0005
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BNE.b CODE_00CC01
	RTS

CODE_00CC01:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0008
	STA.b $6C
	LDA.w #DATA_018ACA
	JMP.w CODE_0096EA

CODE_00CC15:
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00CC26
	LDA.w $0762,x
	SEC
	SBC.w #$000A
	BRA.b CODE_00CC2D

CODE_00CC26:
	LDA.w $0762,x
	CLC
	ADC.w #$0010
CODE_00CC2D:
	STA.b $68
	LDA.w $07EC,x
	DEC
	STA.b $6C
	LDA.w #DATA_018AF2
	JMP.w CODE_009616

CODE_00CC3B:
	LDA.w $0F78,x
	CMP.w #$0023
	BNE.b CODE_00CC46
	JMP.w CODE_00AC88

CODE_00CC46:
	RTS

CODE_00CC47:
	LDA.w $0F78,x
	BEQ.b CODE_00CC4F
	JMP.w CODE_00AC88

CODE_00CC4F:
	RTS

CODE_00CC50:
	LDA.w $14F2
	BNE.b CODE_00CC58
	JMP.w CODE_00CD12

CODE_00CC58:
	LDA.b $56,x
	AND.w #$0080
	BNE.b CODE_00CC62
	JMP.w CODE_00CD15

CODE_00CC62:
	LDA.b $5A,x
	AND.w #$0080
	BEQ.b CODE_00CC6C
	JMP.w CODE_00CD15

CODE_00CC6C:
	LDA.w $0428
	BEQ.b CODE_00CC74
	JMP.w CODE_00CD15

CODE_00CC74:
	STZ.b $8C
	LDX.w #$0002
CODE_00CC79:
	LDA.w $0426,x
	BNE.b CODE_00CC80
	INC.b $8C
CODE_00CC80:
	INX
	INX
	CPX.w $01B7
	BNE.b CODE_00CC79
	LDA.b $8C
	CMP.w #$0008
	BCS.b CODE_00CCB1
	LDX.w $01B5
CODE_00CC91:
	LDA.w $0426,x
	BEQ.b CODE_00CCA1
	LDA.w $04B0,x
	CMP.w #$0180
	BNE.b CODE_00CCAA
	STZ.w $0426,x
CODE_00CCA1:
	INC.b $8C
	LDA.b $8C
	CMP.w #$0008
	BEQ.b CODE_00CCB1
CODE_00CCAA:
	INX
	INX
	CPX.w $01B7
	BNE.b CODE_00CC91
CODE_00CCB1:
	LDA.w #$0002
	STA.w $01B5
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	STA.b $68
	LDA.w $0DDA
	ASL
	TAY
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CLC
	ADC.w DATA_01DBCC,y
	STA.b $6C
	LDX.w #$0007
CODE_00CCCD:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	STA.b $68
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STA.b $6C
	LDA.w #DATA_018B6A
	JSR.w CODE_009616
	PHX
	TXA
	ASL
	TAX
	LDY.b $20
	BMI.b CODE_00CCF7
	LDA.w DATA_01D282,x
	STA.w $0CC6,y
	LDA.w DATA_01D292,x
	STA.w $0D50,y
	LDA.w DATA_01A224,x
	STA.w $05C4,y
CODE_00CCF7:
	PLX
	DEX
	BPL.b CODE_00CCCD
	LDA.w #$0004
	STA.w $01B5
	LDA.w $14F2
	SEC
	SBC.w #$0001
	STA.w $14F2
	LDA.w #$0702
	JSL.l CODE_028B1F
CODE_00CD12:
	DEC.w $14E4
CODE_00CD15:
	RTS

CODE_00CD16:
	LDA.w $0F78,x
	CMP.w #$0030
	BNE.b CODE_00CD21
	JMP.w CODE_00AC88

CODE_00CD21:
	LDA.w $0762,x
	CLC
	ADC.w $0CC6,x
	STA.w $0762,x
	LDA.w $07EC,x
	CLC
	ADC.w $0D50,x
	STA.w $07EC,x
	LDA.w $0F78,x
	AND.w #$0001
	BNE.b CODE_00CD5C
	LDA.w #$0800
	STA.b $64
	LDA.w #$0120
	STA.b $66
	LDA.w #$0001
	STA.b $68
	LDA.w #$0001
	STA.b $6C
	JSR.w CODE_00AB43
	BCC.b CODE_00CD5C
	LDA.w $0C3C,x
	JSR.w CODE_00ABD4
CODE_00CD5C:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	AND.w #$0002
	BEQ.b CODE_00CD71
	JMP.w CODE_00AC88

CODE_00CD71:
	RTS

CODE_00CD72:
	LDA.w $1002,x
	BNE.b CODE_00CD82
	LDA.w !RAM_SXAR_SwimStorm_WaterYPosLo
	CMP.w $07EC,x
	BCC.b CODE_00CD82
	JMP.w CODE_00AC88

CODE_00CD82:
	RTS

CODE_00CD83:
	LDA.w $0C3C,y
	JSR.w CODE_00ABE0
	LDA.w $0C3C,x
	JSR.w CODE_00ABD4
	LDA.w #$1B02
	JSL.l CODE_028B1F
	RTS

CODE_00CD97:
	REP.b #$30
	LDA.w $1002,x
	CMP.w #$0040
	BCC.b CODE_00CDA6
	BEQ.b CODE_00CDA6
	JMP.w CODE_00AC88

CODE_00CDA6:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BEQ.b CODE_00CDBB
	JMP.w CODE_00AC88

CODE_00CDBB:
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00CDC6
	JMP.w CODE_00AC88

CODE_00CDC6:
	BIT.w #$0004
	BNE.b CODE_00CDD6
	LDA.w $0762,x
	CLC
	ADC.w #$0004
	STA.w $0762,x
	RTS

CODE_00CDD6:
	LDA.w $0762,x
	SEC
	SBC.w #$0004
	STA.w $0762,x
	RTS

CODE_00CDE1:
	REP.b #$30
	LDA.w $1002,x
	CMP.w #$0040
	BCC.b CODE_00CDF0
	BEQ.b CODE_00CDF0
	JMP.w CODE_00AC88

CODE_00CDF0:
	AND.w #$0003
	BNE.b CODE_00CDFE
	LDA.w $0A9E,x
	EOR.w #$8000
	STA.w $0A9E,x
CODE_00CDFE:
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00CE09
	JMP.w CODE_00AC88

CODE_00CE09:
	BIT.w #$0004
	BNE.b CODE_00CE1A
	LDA.w $0762,x
	CLC
	ADC.w #$0004
	STA.w $0762,x
	BRA.b CODE_00CE24

CODE_00CE1A:
	LDA.w $0762,x
	SEC
	SBC.w #$0004
	STA.w $0762,x
CODE_00CE24:
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BEQ.b CODE_00CE36
	JMP.w CODE_00AC88

CODE_00CE36:
	RTS

CODE_00CE37:
	LDA.w $0A9E,x
	BIT.w #$0400
	BNE.b CODE_00CE73
	BIT.w #$0001
	BNE.b CODE_00CE57
	ORA.w #$0001
	STA.w $0A9E,x
	LDA.w #$0080
	STA.b $68
	LDA.w #$0020
	STA.b $6C
	JSR.w CODE_00A883
CODE_00CE57:
	JSR.w CODE_00A8DE
	LDA.w $053A,x
	CMP.w #$0020
	BEQ.b CODE_00CE64
	BCS.b CODE_00CE73
CODE_00CE64:
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JSR.w CODE_00AC88
	INC.w $14F2
CODE_00CE73:
	RTS

CODE_00CE74:
	REP.b #$30
	STA.b $8C
	LDA.w $0762,x
	CLC
	ADC.b $68
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.b $6C
	STA.b $AC
	STA.b $6C
	LDA.w #$1001
	STA.b $70
	LDA.b $8C
	JSR.w CODE_0096F3
	LDY.b $20
	BMI.b CODE_00CF03
	STZ.b $8C
	STZ.b $8E
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w $0762,x
	BPL.b CODE_00CEAB
	INC.b $8C
	EOR.w #$FFFF
	INC
CODE_00CEAB:
	STA.b $90
	LDA.w $0900
	LSR
	EOR.w #$FFFF
	INC
	CLC
	ADC.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.b $AC
	BPL.b CODE_00CEC6
	INC.b $8C
	INC.b $8C
	EOR.w #$FFFF
	INC
CODE_00CEC6:
	STA.b $92
	CMP.b $90
	BCC.b CODE_00CEDA
	LDA.b $92
	STA.b $94
	LDA.b $90
	STA.b $96
	INC.b $8E
	INC.b $8E
	BRA.b CODE_00CEE2

CODE_00CEDA:
	LDA.b $90
	STA.b $94
	LDA.b $92
	STA.b $96
CODE_00CEE2:
	LDA.b $94
	STA.w $0D50,y
	LSR
	STA.w $0CC6,y
	LDA.b $96
	STA.w $0DDA,y
	LDA.b $8C
	ASL
	ASL
	ORA.b $8E
	ORA.w $0A9E,y
	STA.w $0A9E,y
	LDA.w #$1002
	JSL.l CODE_028B1F
CODE_00CF03:
	RTS

CODE_00CF04:
	LDA.w #$0002
	STA.b $64
CODE_00CF09:
	JSR.w CODE_00CF8C
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00CF17
	JMP.w CODE_00AC88

CODE_00CF17:
	LDA.w $1002,x
	AND.w #$FF00
	BEQ.b CODE_00CF22
	JMP.w CODE_00AC88

CODE_00CF22:
	LDA.w $0CC6,x
	CLC
	ADC.w $0DDA,x
	STA.w $0CC6,x
	CMP.w $0D50,x
	BCC.b CODE_00CF4D
	SEC
	SBC.w $0D50,x
	STA.w $0CC6,x
	LDA.w $0A9E,x
	EOR.w #$0002
	STA.w $0A9E,x
	JSR.w CODE_00CF4D
	LDA.w $0A9E,x
	EOR.w #$0002
	STA.w $0A9E,x
CODE_00CF4D:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00CF70
	BIT.w #$0004
	BNE.b CODE_00CF65
	LDA.w $0762,x
	CLC
	ADC.b $64
	STA.w $0762,x
	BRA.b CODE_00CF89

CODE_00CF65:
	LDA.w $0762,x
	SEC
	SBC.b $64
	STA.w $0762,x
	BRA.b CODE_00CF89

CODE_00CF70:
	BIT.w #$0008
	BNE.b CODE_00CF80
	LDA.w $07EC,x
	CLC
	ADC.b $64
	STA.w $07EC,x
	BRA.b CODE_00CF89

CODE_00CF80:
	LDA.w $07EC,x
	SEC
	SBC.b $64
	STA.w $07EC,x
CODE_00CF89:
	JMP.w CODE_00F446

CODE_00CF8C:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$0006
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BEQ.b CODE_00CFAB
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
CODE_00CFAB:
	RTS

CODE_00CFAC:
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm2
	BNE.b CODE_00CFFF
	LDA.b $10
	BEQ.b CODE_00CFFF
	LDA.w #$0000
	LDX.w #$0040
CODE_00CFC0:
	ORA.w $1430,x
	INX
	INX
	INX
	INX
	CPX.w #$0068
	BNE.b CODE_00CFC0
	ORA.w #$0000
	BNE.b CODE_00CFFF
	LDA.w $1506
	INC.w $1506
	AND.w #$00FF
	BIT.w #$000F
	BNE.b CODE_00CFFF
	LSR
	LSR
	AND.w #$003C
	TAY
	LDA.w DATA_01FD82,y
	STA.b $68
	LDA.w DATA_01FD82+$02,y
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_009616
	LDA.w #$0D02
	JSL.l CODE_028B1F
	INC.w $1526
CODE_00CFFF:
	RTS

CODE_00D000:
	LDA.w $1002,x
	BNE.b CODE_00D008
	JMP.w CODE_00D0A1

CODE_00D008:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00D013
	JSR.w CODE_00B304
CODE_00D013:
	JSR.w CODE_00D042
	JSR.w CODE_00D0AE
	JSR.w CODE_00D01D
	RTS

CODE_00D01D:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00D038
	LDA.w $0F78,x
	BEQ.b CODE_00D039
	CMP.w #$0020
	BNE.b CODE_00D032
	JMP.w CODE_00AC88

CODE_00D032:
	LDA.w #DATA_019F64
	STA.w $05C4,x
CODE_00D038:
	RTS

CODE_00D039:
	LDA.w #$0602
	JSL.l CODE_028B1F
	BRA.b CODE_00D032

CODE_00D042:
	LDA.w $1002,x
	AND.w #$00FF
	STA.b $64
	LDY.w #$000A
	STY.b $68
	LDY.w #$0028
	STY.b $6C
	BRA.b CODE_00D06A

CODE_00D056:
	LDA.w $1002,x
	ASL
	ASL
	AND.w #$00FF
	STA.b $64
	LDY.w #$000A
	STY.b $68
	LDY.w #$000A
	STY.b $6C
CODE_00D06A:
	LDY.b $68
	LDA.b $64
	SEP.b #$30
	JSL.l CODE_029474
	REP.b #$30
	BIT.w #$0080
	BEQ.b CODE_00D07E
	ORA.w #$FF00
CODE_00D07E:
	CLC
	ADC.w $0DDA,x
	STA.w $0762,x
	LDY.b $6C
	LDA.b $64
	SEP.b #$30
	JSL.l CODE_02946D
	REP.b #$30
	BIT.w #$0080
	BEQ.b CODE_00D099
	ORA.w #$FF00
CODE_00D099:
	CLC
	ADC.w $0D50,x
	STA.w $07EC,x
	RTS

CODE_00D0A1:
	LDA.w $0762,x
	STA.w $0DDA,x
	LDA.w $07EC,x
	STA.w $0D50,x
	RTS

CODE_00D0AE:
	LDA.w $0F78,x
	AND.w #$003F
	BNE.b CODE_00D0C3
	STZ.b $68
	LDA.w #$FFE0
	STA.b $6C
	LDA.w #DATA_018C82
	JSR.w CODE_00CE74
CODE_00D0C3:
	RTS

CODE_00D0C4:
	LDA.b $0E
	AND.w #$0007
	BNE.b CODE_00D0D4
	LDA.w $0A9E,x
	EOR.w #$4000
	STA.w $0A9E,x
CODE_00D0D4:
	JMP.w CODE_00CF04

CODE_00D0D7:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00D0E2
	JSR.w CODE_00B304
CODE_00D0E2:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00D0ED
	JMP.w CODE_00D1CE

CODE_00D0ED:
	BIT.w #$0020
	BEQ.b CODE_00D0F5
	JMP.w CODE_00D1AB

CODE_00D0F5:
	LDA.w #DATA_019B0A
	STA.w $05C4,x
	LDY.w $0D50,x
	LDA.w $13A8,y
	BEQ.b CODE_00D106
	JMP.w CODE_00D21A

CODE_00D106:
	LDA.w $0F78,x
	BIT.w #$0003
	BEQ.b CODE_00D111
	JMP.w CODE_00D219

CODE_00D111:
	JSR.w CODE_0097C4
	JSR.w CODE_00F438
	CMP.w #$0030
	BEQ.b CODE_00D11E
	BCS.b CODE_00D160
CODE_00D11E:
	LDA.w $0A9E,x
	AND.w #$000C
	TAY
	LDA.w DATA_01D8B7,y
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.w DATA_01D8B7+$02,y
	CLC
	ADC.w $07EC,x
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$F7FF
	ORA.w #$1000
	STA.b $70
	LDA.w #DATA_01965A
	JSR.w CODE_009616
	LDY.b $20
	BPL.b CODE_00D14F
	JMP.w CODE_00D219

CODE_00D14F:
	LDA.w #$0002
	STA.w $064E,y
	LDA.w #$0010
	STA.w $0900,y
	LDA.w #DATA_01AEEC
	BRA.b CODE_00D1A0

CODE_00D160:
	LDA.w $0A9E,x
	AND.w #$000C
	TAY
	LDA.w DATA_01D8C7,y
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.w DATA_01D8C7+$02,y
	CLC
	ADC.w $07EC,x
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$F7FF
	ORA.w #$1003
	STA.b $70
	LDA.w #DATA_01965A
	JSR.w CODE_009616
	LDY.b $20
	BPL.b CODE_00D191
	JMP.w CODE_00D219

CODE_00D191:
	LDA.w #$0002
	STA.w $06D8,y
	LDA.w #$0010
	STA.w $0876,y
	LDA.w #DATA_01AEFC
CODE_00D1A0:
	STA.w $05C4,y
	LDA.w #$0502
	JSL.l CODE_028B1F
	RTS

CODE_00D1AB:
	LDA.w $0F78,x
	BEQ.b CODE_00D1C5
	CMP.w #$0014
	BEQ.b CODE_00D1B7
	BCS.b CODE_00D1BE
CODE_00D1B7:
	LDA.w #DATA_01A026
	STA.w $05C4,x
	RTS

CODE_00D1BE:
	LDA.w #DATA_01A02E
	STA.w $05C4,x
	RTS

CODE_00D1C5:
	LDA.w #$0A02
	JSL.l CODE_028B1F
	BRA.b CODE_00D1B7

CODE_00D1CE:
	LDA.w $04B0,x
	CMP.w #$0180
	BEQ.b CODE_00D1F2
	STA.b $68
	LDA.w $053A,x
	CMP.w #$00D0
	CLC
	ADC.w #$0004
	STA.b $6C
	BEQ.b CODE_00D1E8
	BCS.b CODE_00D1F2
CODE_00D1E8:
	JSR.w CODE_00C1AA
	LDA.w #$0202
	JSL.l CODE_028B1F
CODE_00D1F2:
	LDY.w $0DDA,x
	LDA.w #$0000
	STA.w $1430,y
	LDA.w #$0001
	STA.w $1432,y
	LDA.w $0762,x
	CLC
	ADC.w #$0000
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0014
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_0096EA
CODE_00D219:
	RTS

CODE_00D21A:
	CMP.w #$0001
	BEQ.b CODE_00D22E
	CMP.w #$0006
	BNE.b CODE_00D219
	LDA.w $0A9E,x
	AND.w #$F7FF
	STA.w $0A9E,x
	RTS

CODE_00D22E:
	LDA.w $0A9E,x
	ORA.w #$0800
	STA.w $0A9E,x
	RTS

CODE_00D238:
	PHP
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm2
	BNE.b CODE_00D265
	LDX.w #$0040
CODE_00D246:
	INC.w $1430,x
	INX
	INX
	INX
	INX
	CPX.w #$0068
	BNE.b CODE_00D246
	LDA.w #$0000
	LDX.w #$0024
CODE_00D258:
	CLC
	ADC.w #$0006
	STA.w $1408,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_00D258
CODE_00D265:
	PLP
	RTS

CODE_00D267:
	LDA.w $1002,x
	CMP.w #$0040
	BNE.b CODE_00D272
	JMP.w CODE_00AC88

CODE_00D272:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$000C
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BEQ.b CODE_00D28B
	JMP.w CODE_00AC88

CODE_00D28B:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00D2AE
	BIT.w #$0004
	BEQ.b CODE_00D2A3
	LDA.w $0762,x
	SEC
	SBC.w #$0002
	STA.w $0762,x
	RTS

CODE_00D2A3:
	LDA.w $0762,x
	CLC
	ADC.w #$0002
	STA.w $0762,x
	RTS

CODE_00D2AE:
	BIT.w #$0008
	BEQ.b CODE_00D2BE
	LDA.w $07EC,x
	SEC
	SBC.w #$0002
	STA.w $07EC,x
	RTS

CODE_00D2BE:
	LDA.w $07EC,x
	CLC
	ADC.w #$0002
	STA.w $07EC,x
	RTS

CODE_00D2C9:
	LDA.w $1506
	BNE.b CODE_00D303
	LDA.w $1002,x
	BIT.w #$007F
	BNE.b CODE_00D302
	LDA.w $0CC6,x
	INC
	AND.w #$0007
	STA.w $0CC6,x
	ASL
	TAY
	LDA.w DATA_01D897,y
	STA.b $68
	LDA.w DATA_01D8A7,y
	STA.b $6C
	LDA.w #DATA_018C0A
	JSR.w CODE_00CE74
	LDY.b $20
	BMI.b CODE_00D302
	LDA.w #$0010
	STA.w $0876,y
	LDA.w #$0020
	STA.w $0900,y
CODE_00D302:
	RTS

CODE_00D303:
	LDA.w #DATA_019B0A
	STA.w $05C4,x
	RTS

CODE_00D30A:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00D328
	ORA.w #$4000
	STA.w $0A9E,x
	LDA.w $0F78,x
	BEQ.b CODE_00D338
	CMP.w #$000A
	BEQ.b CODE_00D36C
	CMP.w #$000B
	BEQ.b CODE_00D380
CODE_00D327:
	RTS

CODE_00D328:
	LDA.w $07EC,x
	ROR
	BCC.b CODE_00D327
	LDA.w $0A9E,x
	ORA.w #$8000
	STA.w $0A9E,x
	RTS

CODE_00D338:
	LDA.w $04B0,x
	CMP.w #$0180
	BEQ.b CODE_00D355
	STA.b $68
	LDA.w $053A,x
	CMP.w #$00D0
	CLC
	ADC.w #$0004
	STA.b $6C
	BEQ.b CODE_00D352
	BCS.b CODE_00D355
CODE_00D352:
	JSR.w CODE_00C1AA
CODE_00D355:
	LDA.w #$0202
	JSL.l CODE_028B1F
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #DATA_018ACA
	JMP.w CODE_009616

CODE_00D36C:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.b $6C
	LDA.w $0D50,x
	JMP.w CODE_009616

CODE_00D380:
	JSR.w CODE_00D36C
	LDY.b $20
	BMI.b CODE_00D327
	LDA.w $0A9E,y
	ORA.w #$4004
	STA.w $0A9E,y
	RTS

CODE_00D391:
	JSR.w CODE_0097BF
	JSR.w CODE_0097BA
	JSR.w CODE_0097B0
	RTS

CODE_00D39B:
	BIT.w $1596
	BPL.b CODE_00D3D9
	LDA.b $56
	BIT.w #$8000
	BEQ.b CODE_00D3D9
	STZ.w $1596
	LDA.w #$00A1
	JSR.w CODE_00971D
	BCC.b CODE_00D3D9
	PHX
	TYX
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CLC
	ADC.w #$0030
	STA.b $68
	LDA.w $0A9E
	BIT.w #$4000
	BEQ.b CODE_00D3CD
	LDA.b $68
	SEC
	SBC.w #$0060
	STA.b $68
CODE_00D3CD:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	STA.b $6C
	LDA.w #DATA_019902
	JSR.w CODE_0096EA
	PLX
CODE_00D3D9:
	RTS

CODE_00D3DA:
	RTS

CODE_00D3DB:
	LDA.w $1002,x
	BNE.b CODE_00D3E3
	JSR.w CODE_00D0A1
CODE_00D3E3:
	CMP.w #$0300
	BNE.b CODE_00D3EB
	JMP.w CODE_00AC88

CODE_00D3EB:
	LDA.b $12
	BNE.b CODE_00D3F8
	LDA.w $0A9E,x
	EOR.w #$4000
	STA.w $0A9E,x
CODE_00D3F8:
	JSR.w CODE_00D056
	JSR.w CODE_00D3FF
	RTS

CODE_00D3FF:
	LDA.b $0E
	ASL
	TAY
	LDA.w DATA_01D1C8,y
	LDA.w #$1000
	STA.b $64
	LDA.w #$0520
	STA.b $66
	LDA.w #$0001
	STA.b $68
	LDA.w #$0001
	STA.b $6C
	LDY.w #$0004
	JSR.w CODE_00AB46
	BCS.b CODE_00D423
CODE_00D422:
	RTS

CODE_00D423:
	PHY
	LDA.b $0E
	AND.w #$0003
	ASL
	TAY
	LDA.w DATA_01D1C8,y
	PLY
	CMP.w $0426,y
	BNE.b CODE_00D422
	LDA.w $0A9E,y
	EOR.w #$0004
	STA.w $0A9E,y
	RTS

CODE_00D43E:
	JSL.l CODE_028CE3
	RTS

CODE_00D443:
	PHP
	REP.b #$30
	JSL.l CODE_028D8F
	JSR.w CODE_00D4F1
CODE_00D44D:
	REP.b #$30
	JSL.l CODE_0295A6
	JSL.l CODE_02951C
	LDA.w #$000F
	JSR.w CODE_00839D
	JSL.l CODE_0295D2
	JSR.w CODE_00B4FF
	JSL.l CODE_029A32
	JSR.w CODE_00B500
	JSL.l CODE_0299C0
	JSR.w CODE_00E8B0
	JSR.w CODE_00BC76
	JSR.w CODE_00D86D
	JSL.l CODE_0294FD
	JSR.w CODE_00B6C5
	JSR.w CODE_00EBF0
	JSR.w CODE_00A3DE
	JSL.l CODE_029062
	JSR.w CODE_00949C
	JSL.l CODE_029FBA
	LDA.w #$000A
	JSR.w CODE_00839D
	JSR.w CODE_0083B4
	LDA.w #$00FF
	TSB.w $14FA
	BNE.b CODE_00D4A4
	JSR.w CODE_00D4C1
CODE_00D4A4:
	LDA.w $1522
	BNE.b CODE_00D4B6
	LDA.w $135B
	BNE.b CODE_00D4B0
	BRA.b CODE_00D44D

CODE_00D4B0:
	JSL.l CODE_0295A6
	PLP
	RTS

CODE_00D4B6:
	STZ.w $1522
	INC.w !RAM_SXAR_Global_LevelClearFlags
	INC.w !RAM_SXAR_Global_LevelClearFlags
	BRA.b CODE_00D4B0

CODE_00D4C1:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F3400>>16)
	LDX.w #$7F3400
	LDY.w #!Define_SXAR_Graphics_Player_Cyclops
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F9400>>16)
	LDX.w #$7F9400
	LDY.w #!Define_SXAR_Graphics_Sprite_WeirdAlienCaveCreature
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FF400>>16)
	LDX.w #$7FF400
	LDY.w #!Define_SXAR_Graphics_Sprite_PausedText
	JSL.l CODE_028000
	INC.b $14
	RTS

CODE_00D4F1:
	PHP
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	CLI
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_CyclopsLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSR.w CODE_009BA5
	REP.b #$20
	JSL.l CODE_0295A6
	STZ.w $0102
	STZ.w $0104
	SEP.b #$20
	JSR.w CODE_00D8F9
	JSL.l CODE_028EB6
	REP.b #$20
	STZ.w $14FA
	STZ.w $135B
	STZ.w $1522
	STZ.w $10BC
	INC.w $136E
	LDA.w #$0000
	STA.w $14F2
	LDA.w #$0004
	STA.w $01B5
	LDA.w #$0014
	ASL
	STA.w $01B7
	SEP.b #$20
	LDA.b #$39
	STA.w $2105
	LDA.b #$03
	STA.w $2101
	LDA.b #$00
	STA.w $2107
	LDA.b #$04
	STA.w $2108
	LDA.b #$08
	STA.w $2109
	LDA.b #$22
	STA.w $210B
	LDA.b #$01
	STA.w $210C
	LDA.b #$08
	STA.w $13A4
	LDA.b #$10
	STA.w $13A6
	JSL.l CODE_028EB6
	JSR.w CODE_0088F1
	REP.b #$30
	JSL.l CODE_0293E8
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BEQ.b CODE_00D5DB
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BNE.b CODE_00D594
	JMP.w CODE_00D61A

CODE_00D594:
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BNE.b CODE_00D59C
	JMP.w CODE_00D667

CODE_00D59C:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Cyclops1
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Cyclops1
	LDX.w #$0080
	JSL.l CODE_028000
	LDA.w #$0002
	JSR.w CODE_008912
	LDA.w #$0040
	STA.w $152C
	LDA.w #$0930
	STA.w $152E
	LDA.w #$0820
	STA.w $1564
	LDA.w #$0860
	STA.w $1566
	JMP.w CODE_00D6B2

CODE_00D5DB:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Cyclops2Boss
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Cyclops1
	LDX.w #$0080
	JSL.l CODE_028000
	LDA.w #$0003
	JSR.w CODE_008912
	LDA.w #$0038
	STA.w $152C
	LDA.w #$0110
	STA.w $152E
	LDA.w #$0820
	STA.w $1564
	LDA.w #$0860
	STA.w $1566
	JMP.w CODE_00D6B2

CODE_00D61A:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Cyclops1
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_BG_Cyclops2
	LDX.w #$0070
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Cyclops1
	LDX.w #$0080
	JSL.l CODE_028000
	LDA.w #$0006
	JSR.w CODE_008912
	LDA.w #$0040
	STA.w $152C
	LDA.w #$15B0
	STA.w $152E
	LDA.w #$14A0
	STA.w $1564
	LDA.w #$0300
	STA.w $1566
	BRA.b CODE_00D6B2

CODE_00D667:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Cyclops3
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Cyclops1
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_DrainBeam
	LDX.w #$00D0
	JSL.l CODE_028000
	LDA.w #$0005
	JSR.w CODE_008912
	LDA.w #$0050
	STA.w $152C
	LDA.w #$07C8
	STA.w $152E
	LDA.w #$06D0
	STA.w $1564
	LDA.w #$0000
	STA.w $1566
CODE_00D6B2:
	JSL.l CODE_028CCA
	JSR.w CODE_00D73D
	JSL.l CODE_0299F3
	JSR.w CODE_008906
	REP.b #$30
	JSR.w CODE_008957
	STZ.w $1357
	STZ.w $1526
	LDA.w #$0A00
	STA.b $62
	LDA.w #$0708
	STA.w $152A
	SEP.b #$30
	LDA.b #$64
	STA.w $4209
	STZ.w $420A
	LDA.b #$A1
	STA.w $4200
	LDA.b #$1B
	STA.w $212C
	STA.w $212E
	CLI
	REP.b #$30
	INC.b $16
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	STA.w $14F0
	JSL.l CODE_02953D
	JSL.l CODE_029573
	JSR.w CODE_00D828
	REP.b #$30
	LDX.w #$0000
	LDA.w #DATA_018050
	JSR.w CODE_0096EA
	JSR.w CODE_00EB94
	INC.w $013D
	LDA.w #$8080
	STA.b $1A
	LDA.w #$0004
	STA.w $0102
	STA.w $0104
	LDX.w #$0004
CODE_00D725:
	PHX
	JSL.l CODE_0295A6
	LDA.w #$8080
	STA.b $1A
	JSL.l CODE_029A32
	INC.b $0E
	PLX
	DEX
	BPL.b CODE_00D725
	STZ.b $1A
	PLP
	RTS

CODE_00D73D:
	PHP
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BEQ.b CODE_00D790
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BEQ.b CODE_00D7B3
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BNE.b CODE_00D755
	JMP.w CODE_00D7EE

CODE_00D755:
	LDA.w #$2000
	STA.w $1508
	LDA.w #$D000
	STA.w $150A
	LDA.w #$E000
	STA.w $150C
	LDA.w #$0096
	STA.b $4F
	LDA.w #$0020
	STA.b $51
	LDA.w #$0020
	STA.b $53
	LDA.w #$00D0
	STA.w $1512
	LDA.w #$0070
	STA.w $1514
	LDA.w #$0080
	STA.w $1516
	LDA.w #$0090
	STA.w $1518
	BRA.b CODE_00D7F1

CODE_00D790:
	LDA.w #$2000
	STA.w $1508
	LDA.w #$3000
	STA.w $150A
	LDA.w #$E000
	STA.w $150C
	LDA.w #$0012
	STA.b $4F
	LDA.w #$0022
	STA.b $51
	LDA.w #$0020
	STA.b $53
	BRA.b CODE_00D7F1

CODE_00D7B3:
	LDA.w #$2000
	STA.w $1508
	LDA.w #$D000
	STA.w $150A
	LDA.w #$E000
	STA.w $150C
	LDA.w #$015E
	STA.b $4F
	LDA.w #$0020
	STA.b $51
	LDA.w #$0020
	STA.b $53
	LDA.w #$00D0
	STA.w $1512
	LDA.w #$0070
	STA.w $1514
	LDA.w #$0080
	STA.w $1516
	LDA.w #$0090
	STA.w $1518
	BRA.b CODE_00D7F1

CODE_00D7EE:
	JSR.w CODE_00D7F3
CODE_00D7F1:
	PLP
	RTS

CODE_00D7F3:
	LDA.w #$2000
	STA.w $1508
	LDA.w #$7000
	STA.w $150A
	LDA.w #$9000
	STA.w $150C
	LDA.w #$0080
	STA.b $4F
	LDA.w #$0050
	STA.b $51
	LDA.w #$00C0
	STA.w $1512
	LDA.w #$00C0
	STA.w $1514
	LDA.w #$0080
	STA.w $1516
	LDA.w #$00B0
	STA.w $1518
	RTS

CODE_00D828:
	PHP
	REP.b #$30
	LDA.w #$7F00
	STA.w $0B28
	LDX.w #$007C
CODE_00D834:
	LDA.w DATA_01F93F+$02,x
	STA.w $0382,x
	LDA.w DATA_01F93F,x
	STA.w $0380,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_00D834
	REP.b #$30
	JSR.w CODE_00D85A
	LDX.w #$001E
CODE_00D84E:
	LDA.w DATA_01F9BF,x
	STA.w $0400,x
	DEX
	DEX
	BPL.b CODE_00D84E
	PLP
	RTS

CODE_00D85A:
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	CMP.w #$0009
	BCC.b CODE_00D865
	LDA.w #$0009
CODE_00D865:
	CLC
	ADC.w #$31F6
	STA.w $03F2
	RTS

CODE_00D86D:
	PHP
	REP.b #$30
	PHX
	LDA.w #$00FF
	STA.b $AC
	LDA.b $0E
	AND.w #$0008
	BNE.b CODE_00D88A
	LDA.w $0B28
	CMP.w #$2000
	BCS.b CODE_00D88A
	LDA.w #$00E0
	STA.b $AC
CODE_00D88A:
	SEP.b #$20
	JSR.w CODE_00D892
	PLX
	PLP
	RTS

CODE_00D892:
	LDX.w #$01AC
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_CurrentHP
	LSR
	LSR
	LSR
	STA.b $8C
	BEQ.b CODE_00D8AE
	LDA.b #$E8
	AND.b $AC
CODE_00D8A3:
	STA.w $0202,x
	INX
	INX
	INX
	INX
	DEC.b $8C
	BNE.b CODE_00D8A3
CODE_00D8AE:
	LDA.b #$00
	XBA
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_CurrentHP
	CMP.b #$7F
	BEQ.b CODE_00D8D8
	AND.b #$07
	TAY
	LDA.w DATA_01F9DF,y
CODE_00D8BE:
	AND.b $AC
	STA.w $0202,x
	INX
	INX
	INX
	INX
	LDA.b #$E0
CODE_00D8C9:
	CPX.w #$01EC
	BEQ.b CODE_00D8D7
	STA.w $0202,x
	INX
	INX
	INX
	INX
	BRA.b CODE_00D8C9

CODE_00D8D7:
	RTS

CODE_00D8D8:
	LDA.b #$E8
	BRA.b CODE_00D8BE

CODE_00D8DC:
	PHP
	SEP.b #$20
	LDA.b #$3F
	BRA.b CODE_00D8E8

CODE_00D8E3:
	PHP
	SEP.b #$20
	LDA.b #$31
CODE_00D8E8:
	LDY.w #$01AF
CODE_00D8EB:
	STA.w $0200,y
	INY
	INY
	INY
	INY
	CPY.w #$01EF
	BNE.b CODE_00D8EB
	PLP
	RTS

CODE_00D8F9:
	PHP
	REP.b #$30
	LDX.w #$0000
	JSR.w CODE_0088C2
	LDX.w #$0400
	JSR.w CODE_0088C2
	LDX.w #$0800
	JSR.w CODE_0088C2
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC000>>16)
	LDX.w #$7FC000
	LDY.w #!Define_SXAR_Graphics_Sprite_CyclopsGlobalSpritesAndEnemies
	JSL.l CODE_028000
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BEQ.b CODE_00D968
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BEQ.b CODE_00D998
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BNE.b CODE_00D932
	JMP.w CODE_00D9DC

CODE_00D932:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_CyclopsLevel
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Cyclops1
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7ED000>>16)
	LDX.w #$7ED000
	LDY.w #!Define_SXAR_LevelBG_Cyclops1
	JSL.l CODE_028000
	LDA.w #$1C00
	JSR.w CODE_00DA2B
	JMP.w CODE_00DA29

CODE_00D968:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_MasterMold
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Cyclops2Boss
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E3000>>16)
	LDX.w #$7E3000
	LDY.w #!Define_SXAR_Tilemap_Unknown3
	JSL.l CODE_028000
	JMP.w CODE_00DA29

CODE_00D998:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FE000>>16)
	LDX.w #$7FE000
	LDY.w #!Define_SXAR_Graphics_Sprite_MiniMasterMoldAndEnemyShip
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_CyclopsLevel
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Cyclops2
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7ED000>>16)
	LDX.w #$7ED000
	LDY.w #!Define_SXAR_LevelBG_Cyclops1
	JSL.l CODE_028000
	LDA.w #$1C00
	JSR.w CODE_00DA2B
	BRA.b CODE_00DA29

CODE_00D9DC:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC940>>16)
	LDX.w #$7FC940
	LDY.w #!Define_SXAR_Graphics_Sprite_DrainBeam1
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FCB40>>16)
	LDX.w #$7FCB40
	LDY.w #!Define_SXAR_Graphics_Sprite_DrainBeam2
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_WolverineCyclopsFinalLevel
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Cyclops3
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E7000>>16)
	LDX.w #$7E7000
	LDY.w #!Define_SXAR_LevelBG_Cyclops3
	JSL.l CODE_028000
	BRA.b CODE_00DA29

CODE_00DA29:
	PLP
	RTS

CODE_00DA2B:
	STA.b $68
	LDA.w #$7ED000
	STA.b $64
	LDA.w #$7ED000>>16
	STA.b $66
	LDY.w #$0FFE
CODE_00DA3A:
	LDA.b [$64],y
	AND.w #$E3FF
	ORA.b $68
	STA.b [$64],y
	DEY
	DEY
	BPL.b CODE_00DA3A
	RTS

CODE_00DA48:
	JSR.w CODE_00DA5A
	JSR.w CODE_00DAC8
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00DA59
	JSR.w CODE_00B31B
CODE_00DA59:
	RTS

CODE_00DA5A:
	JSR.w CODE_00DAEF
	LDA.w $0F78,x
	CLC
	ADC.w #$003C
	AND.w #$007F
	BEQ.b CODE_00DA84
	STZ.w $0D50,x
	LDA.w $1002,x
	CMP.w #$00F0
	BCC.b CODE_00DA83
	CMP.w #$012C
	BEQ.b CODE_00DA7B
	BCS.b CODE_00DA80
CODE_00DA7B:
	LDA.w $0428
	BEQ.b CODE_00DA83
CODE_00DA80:
	INC.w $0D50,x
CODE_00DA83:
	RTS

CODE_00DA84:
	LDA.w #$1002
	JSL.l CODE_028B1F
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00DA9C
	LDA.w $0762,x
	CLC
	ADC.w #$0012
	BRA.b CODE_00DAA3

CODE_00DA9C:
	LDA.w $0762,x
	SEC
	SBC.w #$0012
CODE_00DAA3:
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$000D
	LDY.w $0D50,x
	BNE.b CODE_00DAB5
	SEC
	SBC.w #$0013
CODE_00DAB5:
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4004
	ORA.w #$1000
	STA.b $70
	LDA.w #DATA_018D4A
	JMP.w CODE_009616

CODE_00DAC8:
	LDA.w #$002E
	STA.w $0900,x
	LDY.w #DATA_01A2DC
	LDA.w $0A9E,x
	BIT.w #$0120
	BNE.b CODE_00DAEA
	LDY.w #DATA_01A2AC
	LDA.w $0D50,x
	BEQ.b CODE_00DAEA
	LDA.w #$0024
	STA.w $0900,x
	LDY.w #DATA_01A2C4
CODE_00DAEA:
	TYA
	STA.w $05C4,x
	RTS

CODE_00DAEF:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CMP.w $0762,x
	BCC.b CODE_00DB01
	LDA.w $0A9E,x
	AND.w #$BFFB
	STA.w $0A9E,x
	RTS

CODE_00DB01:
	LDA.w $0A9E,x
	ORA.w #$4004
	STA.w $0A9E,x
	RTS

CODE_00DB0B:
	LDA.w $1002,x
	CMP.w #$0040
	BCC.b CODE_00DB18
	BEQ.b CODE_00DB18
	JMP.w CODE_00AC88

CODE_00DB18:
	LDA.w $0A9E,x
	EOR.w #$C000
	STA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00DB29
	JMP.w CODE_00AC88

CODE_00DB29:
	BIT.w #$0004
	BNE.b CODE_00DB39
	LDA.w $0762,x
	CLC
	ADC.w #$0003
	STA.w $0762,x
	RTS

CODE_00DB39:
	LDA.w $0762,x
	SEC
	SBC.w #$0003
	STA.w $0762,x
	RTS

CODE_00DB44:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00DB4F
	JSR.w CODE_00B31B
CODE_00DB4F:
	JSR.w CODE_00DAEF
	JSR.w CODE_00DB56
	RTS

CODE_00DB56:
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00DB61
	JMP.w CODE_00DC02

CODE_00DB61:
	DEC.w $0CC6,x
	BMI.b CODE_00DB69
	JMP.w CODE_00DC02

CODE_00DB69:
	LDA.w #$0064
	STA.w $0CC6,x
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CLC
	ADC.w #$0040
	CMP.w $07EC,x
	BCS.b CODE_00DB7E
	JMP.w CODE_00DC02

CODE_00DB7E:
	LDA.w $0A9E,x
	LDY.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	STY.b $AC
	BIT.w #$0040
	BEQ.b CODE_00DBA5
	LDA.w $0A9E
	BIT.w #$4000
	BNE.b CODE_00DB9D
	LDA.b $AC
	CLC
	ADC.w #$0040
	STA.b $AC
	BRA.b CODE_00DBA5

CODE_00DB9D:
	LDA.b $AC
	SEC
	SBC.w #$0040
	STA.b $AC
CODE_00DBA5:
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00DBBB
	LDA.w $0762,x
	SEC
	SBC.w #$0010
	STA.b $68
	SEC
	SBC.b $AC
	BRA.b CODE_00DBC9

CODE_00DBBB:
	LDA.w $0762,x
	CLC
	ADC.w #$0010
	STA.b $68
	LDA.b $AC
	SEC
	SBC.b $68
CODE_00DBC9:
	ASL
	ASL
	ASL
	ASL
	CMP.w #$0300
	BCC.b CODE_00DC02
	EOR.w #$FFFF
	INC
	STA.b $AC
	LDA.w $07EC,x
	SEC
	SBC.w #$001A
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$4801
	ORA.w #$8000
	STA.b $70
	LDA.w #DATA_018D9A
	JSR.w CODE_009616
	LDY.b $20
	BMI.b CODE_00DC02
	LDA.b $AC
	STA.w $0A14,y
	LDA.w #$1502
	JSL.l CODE_028B1F
CODE_00DC02:
	RTS

CODE_00DC03:
	JSR.w CODE_00DC0A
	JSR.w CODE_00DC5E
	RTS

CODE_00DC0A:
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00DC1E
	LDA.w $0762,x
	SEC
	SBC.w $098A,x
	STA.w $0762,x
	BRA.b CODE_00DC28

CODE_00DC1E:
	LDA.w $0762,x
	CLC
	ADC.w $098A,x
	STA.w $0762,x
CODE_00DC28:
	LDA.w $0A14,x
	BMI.b CODE_00DC36
	LDA.w $0A9E,x
	AND.w #$7FFF
	STA.w $0A9E,x
CODE_00DC36:
	LDA.w #$0040
	CLC
	ADC.w $0A14,x
	STA.w $0A14,x
	BPL.b CODE_00DC47
	ORA.w #$00FF
	BRA.b CODE_00DC55

CODE_00DC47:
	CMP.w #$0800
	BCC.b CODE_00DC52
	LDA.w #$0800
	STA.w $0A14,x
CODE_00DC52:
	AND.w #$FF00
CODE_00DC55:
	XBA
	CLC
	ADC.w $07EC,x
	STA.w $07EC,x
	RTS

CODE_00DC5E:
	LDA.w $0A9E,x
	AND.w #$0120
	BNE.b CODE_00DC7E
	LDA.w $0A14,x
	BMI.b CODE_00DC7D
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	AND.w #$0001
	BNE.b CODE_00DC7E
CODE_00DC7D:
	RTS

CODE_00DC7E:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0008
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_0096EA
	LDA.w #$0D02
	JSL.l CODE_028B1F
	RTS

CODE_00DC9A:
	PHP
	REP.b #$30
	LDA.w $14F0
	BNE.b CODE_00DCA5
	JMP.w CODE_00DD15

CODE_00DCA5:
	BMI.b CODE_00DD19
	LDA.b $0E
	ASL
	AND.w #$0030
	TAY
	SEP.b #$20
	LDA.b #$96
	STA.w $2121
	LDA.w DATA_01FCCA,y
	STA.w $2122
	LDA.w DATA_01FCCA+$01,y
	STA.w $2122
	LDA.w DATA_01FCCA+$02,y
	STA.w $2122
	LDA.w DATA_01FCCA+$03,y
	STA.w $2122
	LDA.w DATA_01FCCA+$04,y
	STA.w $2122
	LDA.w DATA_01FCCA+$05,y
	STA.w $2122
	LDA.w DATA_01FCCA+$06,y
	STA.w $2122
	LDA.w DATA_01FCCA+$07,y
	STA.w $2122
	LDA.w DATA_01FCCA+$08,y
	STA.w $2122
	LDA.w DATA_01FCCA+$09,y
	STA.w $2122
	LDA.w DATA_01FCCA+$0A,y
	STA.w $2122
	LDA.w DATA_01FCCA+$0B,y
	STA.w $2122
	LDA.w DATA_01FCCA+$0C,y
	STA.w $2122
	LDA.w DATA_01FCCA+$0D,y
	STA.w $2122
	LDA.w DATA_01FCCA+$0E,y
	STA.w $2122
	LDA.w DATA_01FCCA+$0F,y
	STA.w $2122
CODE_00DD15:
	PLP
	RTS

CODE_00DD17:
	REP.b #$20
CODE_00DD19:
	LDA.b $0E
	ASL
	ASL
	AND.w #$0020
	TAY
	SEP.b #$20
	LDA.b #$20
	STA.w $2121
	LDA.w DATA_01FD0A,y
	STA.w $2122
	LDA.w DATA_01FD0A+$01,y
	STA.w $2122
	LDA.w DATA_01FD0A+$02,y
	STA.w $2122
	LDA.w DATA_01FD0A+$03,y
	STA.w $2122
	LDA.w DATA_01FD0A+$04,y
	STA.w $2122
	LDA.w DATA_01FD0A+$05,y
	STA.w $2122
	LDA.w DATA_01FD0A+$06,y
	STA.w $2122
	LDA.w DATA_01FD0A+$07,y
	STA.w $2122
	LDA.w DATA_01FD0A+$08,y
	STA.w $2122
	LDA.w DATA_01FD0A+$09,y
	STA.w $2122
	LDA.w DATA_01FD0A+$0A,y
	STA.w $2122
	LDA.w DATA_01FD0A+$0B,y
	STA.w $2122
	LDA.w DATA_01FD0A+$0C,y
	STA.w $2122
	LDA.w DATA_01FD0A+$0D,y
	STA.w $2122
	LDA.w DATA_01FD0A+$0E,y
	STA.w $2122
	LDA.w DATA_01FD0A+$0F,y
	STA.w $2122
	LDA.w DATA_01FD0A+$10,y
	STA.w $2122
	LDA.w DATA_01FD0A+$11,y
	STA.w $2122
	LDA.w DATA_01FD0A+$12,y
	STA.w $2122
	LDA.w DATA_01FD0A+$13,y
	STA.w $2122
	LDA.w DATA_01FD0A+$14,y
	STA.w $2122
	LDA.w DATA_01FD0A+$15,y
	STA.w $2122
	LDA.w DATA_01FD0A+$16,y
	STA.w $2122
	LDA.w DATA_01FD0A+$17,y
	STA.w $2122
	LDA.w DATA_01FD0A+$18,y
	STA.w $2122
	LDA.w DATA_01FD0A+$19,y
	STA.w $2122
	LDA.w DATA_01FD0A+$1A,y
	STA.w $2122
	LDA.w DATA_01FD0A+$1B,y
	STA.w $2122
	LDA.w DATA_01FD0A+$1C,y
	STA.w $2122
	LDA.w DATA_01FD0A+$1D,y
	STA.w $2122
	LDA.w DATA_01FD0A+$1E,y
	STA.w $2122
	LDA.w DATA_01FD0A+$1F,y
	STA.w $2122
	PLP
	RTS

CODE_00DDEA:
	REP.b #$20
CODE_00DDEC:
	LDA.w #DATA_0190E2
	STA.b $8C
	BRA.b CODE_00DDF8

CODE_00DDF3:
	LDA.w #DATA_018DC2
	STA.b $8C
CODE_00DDF8:
	LDA.w $1002,x
	AND.w #$00FF
	BNE.b CODE_00DE75
	LDA.w $0D50
	CMP.w #$0022
	BCS.b CODE_00DE75
	LDA.w $0A9E,x
	BIT.w #$0001
	BEQ.b CODE_00DE75
	LDY.w #$0004
	LDA.w $0C3C,x
CODE_00DE16:
	CMP.w $0BB2,y
	BEQ.b CODE_00DE75
	INY
	INY
	CPY.w $01B7
	BNE.b CODE_00DE16
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$0007
	ORA.w #$0400
	STA.b $70
	LDA.b $8C
	JSR.w CODE_009616
	LDY.b $20
	BMI.b CODE_00DE75
	LDA.w $0D50,x
	STA.w $0D50,y
	LDA.w $0C3C,x
	STA.w $0BB2,y
	LDA.w $0426,y
	CMP.w #$0064
	BNE.b CODE_00DE75
	LDA.w #DATA_01910A
	JSR.w CODE_009616
	LDA.w #DATA_019132
	JSR.w CODE_009616
	LDA.w $0762,x
	STA.w $151C
	LDA.w $07EC,x
	STA.w $151E
	LDA.w $0A9E,x
	AND.w #$FFFE
	STA.w $0A9E,x
CODE_00DE75:
	RTS

CODE_00DE76:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00DE81
	JSR.w CODE_00B304
CODE_00DE81:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00DE97
	PHX
	LDX.w #$0000
	LDA.w #$5000
	JSR.w CODE_00AC6C
	PLX
	JMP.w CODE_00DC7E

CODE_00DE97:
	RTS

CODE_00DE98:
	LDA.w $1524
	INC
	AND.w #$0007
	STA.w $1524
	LDA.w $0762,x
	STA.w $151C
	LDA.w $07EC,x
	STA.w $151E
CODE_00DEAE:
	STZ.b $B6						; Note: Moving minecart sprite.
	JSR.w CODE_00DEEA
	JSR.w CODE_00DEC1
	LDA.b $B6
	BEQ.b CODE_00DEC0
	JSR.w CODE_00DEEA
	JSR.w CODE_00DEC1
CODE_00DEC0:
	RTS

CODE_00DEC1:
	LDA.b $AC
	BNE.b CODE_00DEE3
	LDA.w $0A9E,x
	BIT.w #$0004
	BNE.b CODE_00DED2
	INC.w $0762,x
	BRA.b CODE_00DED5

CODE_00DED2:
	DEC.w $0762,x
CODE_00DED5:
	LDA.b $0E
	AND.w #$007F
	BNE.b CODE_00DEE3
	LDA.w #$1E02
	JSL.l CODE_028B1F
CODE_00DEE3:
	RTS

CODE_00DEE4:
	LDA.w #$0001
	STA.b $AC
	RTS

CODE_00DEEA:
	LDA.w $0DDA,x
	BEQ.b CODE_00DEE4
	STZ.b $AC
	DEC.w $0CC6,x
	BPL.b CODE_00DF27
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00DF0A
	LDA.w $0D50,x
	CLC
	ADC.w #$0002
	STA.w $0D50,x
	BRA.b CODE_00DF14

CODE_00DF0A:
	LDA.w $0D50,x
	SEC
	SBC.w #$0002
	STA.w $0D50,x
CODE_00DF14:
	STA.b $8C
	LDA.b ($8C)
	XBA
	AND.w #$00FF
	STA.w $0CC6,x
	LDA.b ($8C)
	AND.w #$0007
	STA.w $0DDA,x
CODE_00DF27:
	LDA.w $0DDA,x
	STA.b $8E
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00DF3C
	LDA.b $8E
	CLC
	ADC.w #$0008
	STA.b $8E
CODE_00DF3C:
	LDA.b $8E
	ASL
	TAX
	JMP.w (DATA_00DF43,x)

DATA_00DF43:
	dw CODE_00DF67
	dw CODE_00DF70
	dw CODE_00DF7D
	dw CODE_00DF8E
	dw CODE_00DF9F
	dw CODE_00DFB8
	dw CODE_00DFCD
	dw CODE_00DFDF
	dw CODE_00DF67
	dw CODE_00DFB8
	dw CODE_00DF9F
	dw CODE_00DF8E
	dw CODE_00DF7D
	dw CODE_00DF70
	dw CODE_00DFCD
	dw CODE_00DFDF

CODE_00DF63:
	STA.w $05C4,x
	RTS

CODE_00DF67:
	INC.b $AC
	LDX.b $2C
	LDA.w #DATA_01A31C
	BRA.b CODE_00DF63

CODE_00DF70:
	LDX.b $2C
	JSR.w CODE_00DFF4
	DEC.w $07EC,x
	LDA.w #DATA_01A364
	BRA.b CODE_00DF63

CODE_00DF7D:
	LDX.b $2C
	JSR.w CODE_00DFF4
	LDA.b $10
	BNE.b CODE_00DF89
	DEC.w $07EC,x
CODE_00DF89:
	LDA.w #DATA_01A340
	BRA.b CODE_00DF63

CODE_00DF8E:
	LDX.b $2C
	LDA.w $098A,x
	BMI.b CODE_00DF9A
	DEC.w $098A,x
	INC.b $B6
CODE_00DF9A:
	LDA.w #DATA_01A31C
	BRA.b CODE_00DF63

CODE_00DF9F:
	LDX.b $2C
	JSR.w CODE_00E006
	INC.w $098A,x
	LDA.b $B6
	INC.b $B6
	AND.w #$00FF
	BEQ.b CODE_00DFB3
	INC.w $07EC,x
CODE_00DFB3:
	LDA.w #DATA_01A340
	BRA.b CODE_00DF63

CODE_00DFB8:
	LDX.b $2C
	JSR.w CODE_00E006
	INC.w $098A,x
	INC.w $098A,x
	INC.w $07EC,x
	INC.b $B6
	LDA.w #DATA_01A364
	BRA.b CODE_00DF63

CODE_00DFCD:
	INC.b $AC
	LDX.b $2C
	LDA.w $0A9E,x
	EOR.w #$0006
	STA.w $0A9E,x
	LDA.w #DATA_01A31C
	BRA.b CODE_00DF63

CODE_00DFDF:
	LDX.b $2C
	LDA.w $0A14,x
	CLC
	ADC.w #$0028
	STA.w $0A14,x
	JSR.w CODE_00B03C
	LDA.w #DATA_01A364
	JMP.w CODE_00DF63

CODE_00DFF4:
	LDA.w $0A9E,x
	AND.w #$BFFF
	BIT.w #$0004
	BNE.b CODE_00E002
	ORA.w #$4000
CODE_00E002:
	STA.w $0A9E,x
	RTS

CODE_00E006:
	LDA.w $0A9E,x
	AND.w #$BFFF
	BIT.w #$0004
	BEQ.b CODE_00E014
	ORA.w #$4000
CODE_00E014:
	STA.w $0A9E,x
	RTS

CODE_00E018:
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00E02E
	BIT.w #$0020
	BEQ.b CODE_00E028
	JMP.w CODE_00E089

CODE_00E028:
	ORA.w #$0002
	STA.w $0A9E,x
CODE_00E02E:
	BIT.w #$0002
	BNE.b CODE_00E060
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CMP.w $07EC,x
	BCC.b CODE_00E05F
	LDA.w $0762,x
	SEC
	SBC.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BPL.b CODE_00E048
	EOR.w #$FFFF
	INC
CODE_00E048:
	CMP.w #$0010
	BEQ.b CODE_00E04F
	BCS.b CODE_00E05F
CODE_00E04F:
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	LDA.w #$1702
	JSL.l CODE_028B1F
CODE_00E05F:
	RTS

CODE_00E060:
	LDA.b $30
	CLC
	ADC.w #$00F8
	CMP.w $07EC,x
	BCC.b CODE_00E07D
	LDA.w $0A14,x
	CMP.w #$04FF
	BCS.b CODE_00E07A
	CLC
	ADC.w #$0040
	STA.w $0A14,x
CODE_00E07A:
	JMP.w CODE_00B03C

CODE_00E07D:
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JMP.w CODE_00AC88

CODE_00E089:
	LDA.w $0F78,x
	BEQ.b CODE_00E0B6
	CMP.w #$0010
	BEQ.b CODE_00E07D
	CMP.w #$0008
	BEQ.b CODE_00E0BE
	CMP.w #$000C
	BEQ.b CODE_00E0C8
	LDA.w $0A9E,x
	ORA.w #$0001
	STA.w $0A9E,x
	LDA.w #$0001
	STA.w $064E,x
	STA.w $06D8,x
	LDA.w #DATA_019C70
	STA.w $05C4,x
	RTS

CODE_00E0B6:
	LDA.w #$2602
	JSL.l CODE_028B1F
	RTS

CODE_00E0BE:
	LDA.w $0A9E,x
	ORA.w #$4000
	STA.w $0A9E,x
	RTS

CODE_00E0C8:
	LDA.w $0A9E,x
	ORA.w #$8000
	STA.w $0A9E,x
	RTS

CODE_00E0D2:
	LDA.w $0762,x
	STA.b $68
	LDA.w $0900,x
	LSR
	STA.b $8C
	LDA.w $07EC,x
	SEC
	SBC.b $8C
	CLC
	ADC.w #$0008
	STA.b $6C
CODE_00E0E9:
	LDA.w #DATA_019272
	JSR.w CODE_009616
	LDA.w #$2602
	JSL.l CODE_028B1F
	RTS

CODE_00E0F7:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00E102
	JSR.w CODE_00B304
CODE_00E102:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00E10D
	JMP.w CODE_00E1E8

CODE_00E10D:
	AND.w #$7FFF
	STA.w $0A9E,x
	LDA.w #DATA_01A42E
	STA.w $05C4,x
	LDA.w #$0003
	STA.w $064E,x
	STA.w $06D8,x
	LDA.w $0CC6,x
	BPL.b CODE_00E177
	LDA.w $1002,x
	BIT.w #$003F
	BNE.b CODE_00E132
	JSR.w CODE_00E13E
CODE_00E132:
	AND.w #$007F
	BEQ.b CODE_00E164
	SEC
	SBC.w #$0040
	BEQ.b CODE_00E156
	RTS

CODE_00E13E:
	PHA
	BIT.w #$007F
	BEQ.b CODE_00E14D
	LDA.w #$1102
	JSL.l CODE_028B1F
	BRA.b CODE_00E154

CODE_00E14D:
	LDA.w #$1802
	JSL.l CODE_028B1F
CODE_00E154:
	PLA
	RTS

CODE_00E156:
	STZ.b $68
	LDA.w #$FFF8
	STA.b $6C
	LDA.w #DATA_019042
	JSR.w CODE_00CE74
	RTS

CODE_00E164:
	JSR.w CODE_0097C4
	LDA.w $0A9E,x
	EOR.w #$0002
	STA.w $0A9E,x
	LDA.w #$0014
	STA.w $0CC6,x
	RTS

CODE_00E177:
	DEC.w $0CC6,x
	LDA.w $0A9E,x
	EOR.w #$4000
	STA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00E1B8
	LDA.w #$0004
	STA.w $064E,x
	LDA.w $0A9E,x
	BIT.w #$0004
	BNE.b CODE_00E1A7
	LDA.w $0762,x
	CLC
	ADC.w #$0003
	STA.w $0762,x
	LDA.w #DATA_01A482
	STA.w $05C4,x
	RTS

CODE_00E1A7:
	LDA.w $0762,x
	SEC
	SBC.w #$0003
	STA.w $0762,x
	LDA.w #DATA_01A452
	STA.w $05C4,x
	RTS

CODE_00E1B8:
	LDA.w #$0004
	STA.w $06D8,x
	LDA.w $0A9E,x
	BIT.w #$0008
	BNE.b CODE_00E1D7
	LDA.w $07EC,x
	CLC
	ADC.w #$0003
	STA.w $07EC,x
	LDA.w #DATA_01A4E2
	STA.w $05C4,x
	RTS

CODE_00E1D7:
	LDA.w $07EC,x
	SEC
	SBC.w #$0003
	STA.w $07EC,x
	LDA.w #DATA_01A4B2
	STA.w $05C4,x
	RTS

CODE_00E1E8:
	LDA.w #$0D02
	JSL.l CODE_028B1F
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	CLC
	ADC.w #$0014
	STA.b $6C
	LDA.w #DATA_0184B0
	JMP.w CODE_0096EA

CODE_00E203:
	JSR.w CODE_00E248
	BCS.b CODE_00E21F
	LDA.w $151C
	SEC
	SBC.w #$0006
	STA.w $0762,x
	LDA.w $151E
	SEC
	SBC.w #$0020
	STA.w $07EC,x
	JMP.w CODE_00DA48

CODE_00E21F:
	RTS

CODE_00E220:
	LDX.b $2C
	JSR.w CODE_00E248
	BCS.b CODE_00E247
	LDA.w $151C
	CLC
	ADC.w #$0006
	STA.w $0762,x
	LDA.w $151E
	SEC
	SBC.w #$0020
	STA.w $07EC,x
	LDA.w $1002,x
	ORA.w #$1000
	STA.w $1002,x
	JMP.w CODE_00DA48

CODE_00E247:
	RTS

CODE_00E248:
	LDA.w $1524
	CMP.w $0DDA,x
	BNE.b CODE_00E255
	JSR.w CODE_00AC88
	SEC
	RTS

CODE_00E255:
	STA.w $0DDA,x
	CLC
	RTS

CODE_00E25A:
	RTS

CODE_00E25B:
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00E292
	AND.w #$FFFD
	STA.w $0A9E,x
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine1
	BEQ.b CODE_00E2A2
	LDA.w $13A8
	CMP.w #$0004
	BNE.b CODE_00E285
	PHX
	LDX.w #$0000
	LDA.w #$8000
	JSR.w CODE_00ABE0
	PLX
CODE_00E284:
	RTS

CODE_00E285:
	BIT.w #$0003
	BEQ.b CODE_00E284
	LDA.w #$1902
	JSL.l CODE_028B1F
	RTS

CODE_00E292:
	LDA.w $1002,x
	AND.w #$00FF
	BNE.b CODE_00E284
	LDA.w #$0902
	JSL.l CODE_028B1F
	RTS

CODE_00E2A2:
	LDA.w #$FFFF
	STA.w $1598
	RTS

CODE_00E2A9:
	LDY.w $1002,x
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00E2B7
	JMP.w CODE_00E3F9

CODE_00E2B7:
	BIT.w #$0002
	BEQ.b CODE_00E2BF
	JMP.w CODE_00E33F

CODE_00E2BF:
	LDA.w $0F78,x
	AND.w #$0007
	BNE.b CODE_00E300
	LDA.w $0A9E,x
	BIT.w #$0004
	BNE.b CODE_00E2D8
	LDA.w $0762,x
	CLC
	ADC.w #$0010
	BRA.b CODE_00E2DF

CODE_00E2D8:
	LDA.w $0762,x
	SEC
	SBC.w #$0010
CODE_00E2DF:
	STA.b $94
	LDA.w $07EC,x
	INC
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0001
	BNE.b CODE_00E300
	LDA.w $0A9E,x
	EOR.w #$4004
	STA.w $0A9E,x
	LDA.w #$0001
	STA.w $0F78,x
	BRA.b CODE_00E300

CODE_00E300:
	LDA.w $0F78,x
	AND.w #$00FF
	BNE.b CODE_00E322
	JSR.w CODE_00DAEF
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	LDA.w #$0008
	STA.w $0DDA,x
	LDA.w #$0014
	STA.w $0CC6,x
	BRA.b CODE_00E344

CODE_00E322:
	JSR.w CODE_0097B0
	DEC.w $0CC6,x
	BPL.b CODE_00E33A
	LDA.w #$0007
	STA.w $0CC6,x
	LDA.w $0DDA,x
	INC
	AND.w #$0007
	STA.w $0DDA,x
CODE_00E33A:
	JSL.l CODE_028C8D
	RTS

CODE_00E33F:
	DEC.w $0CC6,x
	BPL.b CODE_00E33A
CODE_00E344:
	LDA.w #$0014
	STA.w $0CC6,x
	INC.w $0DDA,x
	LDA.w $0DDA,x
	STX.b $8C
	SEC
	SBC.w #$0009
	BMI.b CODE_00E36C
	CMP.w #$0003
	BEQ.b CODE_00E35F
	BCS.b CODE_00E36C
CODE_00E35F:
	ASL
	TAX
	JMP.w (DATA_00E364,x)

DATA_00E364:
	dw CODE_00E37A
	dw CODE_00E396
	dw CODE_00E3BC
	dw CODE_00E3D3

CODE_00E36C:
	LDA.w $0A9E,x
	AND.w #$FFFD
	STA.w $0A9E,x
	STZ.w $0DDA,x
	BRA.b CODE_00E33A

CODE_00E37A:
	LDX.b $8C
	LDA.w #$0004
	STA.w $06D8,x
	LDA.w #DATA_01A532
	STA.w $05C4,x
	LDA.w #$0009
	STA.w $0DDA,x
	LDA.w #$000A
	STA.w $0CC6,x
	BRA.b CODE_00E33A

CODE_00E396:
	LDX.b $8C
	LDA.w #$0003
	STA.w $06D8,x
	LDA.w #$0003
	STA.w $064E,x
	LDA.w #DATA_01A552
	STA.w $05C4,x
	LDA.w #$000A
	STA.w $0DDA,x
	LDA.w #$0008
	STA.w $0CC6,x
	JSR.w CODE_00E457
	JMP.w CODE_00E33A

CODE_00E3BC:
	LDX.b $8C
	LDA.w #DATA_01A576
	STA.w $05C4,x
	LDA.w #$000B
	STA.w $0DDA,x
	LDA.w #$001E
	STA.w $0CC6,x
	JMP.w CODE_00E33A

CODE_00E3D3:
	LDX.b $8C
	LDA.w #$0002
	STA.w $064E,x
	LDA.w #DATA_01A51A
	STA.w $05C4,x
	LDA.w $0A9E,x
	AND.w #$FFFD
	STA.w $0A9E,x
	LDA.w #$0000
	STA.w $0DDA,x
	STZ.w $0CC6,x
	JMP.w CODE_00E33A

CODE_00E3F6:
	JMP.w CODE_00E33A

CODE_00E3F9:
	BIT.w #$0100
	BNE.b CODE_00E43C
	LDA.w #$0008
	STA.w $0DDA,x
	LDA.w #$0002
	STA.w $064E,x
	LDA.w #$0003
	STA.w $06D8,x
	LDA.w #DATA_01A51A
	STA.w $05C4,x
	LDA.w $0A9E,x
	AND.w #$FFFD
	STA.w $0A9E,x
	LDA.w $0F78,x
	CMP.w #$001A
	BNE.b CODE_00E3F6
	LDA.w $0A9E,x
	AND.w #$FFDF
	EOR.w #$4004
	STA.w $0A9E,x
	STZ.w $0DDA,x
	STZ.w $0CC6,x
	JMP.w CODE_00E33A

CODE_00E43C:
	JSR.w CODE_00E0D2
	JMP.w CODE_00AC88

CODE_00E442:
	LDA.w #$1001
	STA.w $1002,x
	LDA.w #$0013
	STA.w $0DDA,x
	LDA.w #$0008
	STA.w $0CC6,x
	JMP.w CODE_00E33A

CODE_00E457:
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00E464
	LDA.w #$0024
	BRA.b CODE_00E467

CODE_00E464:
	LDA.w #$FFDC
CODE_00E467:
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0018
	STA.b $6C
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.b $70
	LDA.w #DATA_0191D2
	JSR.w CODE_009616
	RTS

CODE_00E485:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BNE.b CODE_00E4AD
	JSR.w CODE_00FC0E
	BCS.b CODE_00E4AC
	JSR.w CODE_0097B0
	LDA.w $0A14,x
	CLC
	ADC.w #$0010
	STA.w $0A14,x
	JSR.w CODE_0097BA
CODE_00E4AC:
	RTS

CODE_00E4AD:
	LDA.w #$3602
	JSL.l CODE_028B1F
	JMP.w CODE_00AC88

CODE_00E4B7:							; Note: Obnoxio spawner sprite.
	LDA.w $0F78,x
	AND.w #$00FF
	BNE.b CODE_00E4E2
	LDY.w #$0004
CODE_00E4C2:
	LDA.w $0426,y
	CMP.w #!Define_SXAR_SpriteID_Obnoxio
	BEQ.b CODE_00E4E1
	INY
	INY
	CPY.w $01B7
	BNE.b CODE_00E4C2
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #DATA_0196FA
	JSR.w CODE_009616
CODE_00E4E1:
	RTS

CODE_00E4E2:
	LDA.w $1002,x
	CMP.w #$1000
	BCC.b CODE_00E4E1
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JMP.w CODE_00AC88

CODE_00E4F6:
	LDA.w $0F78,x
	CMP.w #$0010
	BNE.b CODE_00E501
	JMP.w CODE_00AC88

CODE_00E501:
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00E515
	LDA.w $0762,x
	SEC
	SBC.w #$0010
	STA.w $0762,x
	BRA.b CODE_00E51F

CODE_00E515:
	LDA.w $0762,x
	CLC
	ADC.w #$0010
	STA.w $0762,x
CODE_00E51F:
	LDA.w #DATA_01A59E
	STA.w $05C4,x
	RTS

CODE_00E526:
	JSR.w CODE_00E58C
	BCS.b CODE_00E5A5
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00E536
	JMP.w CODE_00E5B8

CODE_00E536:
	BIT.w #$0020
	BEQ.b CODE_00E53E
	JSR.w CODE_00E5A6
CODE_00E53E:
	LDA.w $1002,x
	LSR
	LSR
	LSR
	LSR
	AND.w #$003E
	TAX
	JMP.w (DATA_00E54C,x)

DATA_00E54C:
	dw CODE_00E6DC
	dw CODE_00E6DC
	dw CODE_00E6F3
	dw CODE_00E70D
	dw CODE_00E70D
	dw CODE_00E71E
	dw CODE_00E6DC
	dw CODE_00E732
	dw CODE_00E758
	dw CODE_00E758
	dw CODE_00E779
	dw CODE_00E779
	dw CODE_00E779
	dw CODE_00E779
	dw CODE_00E779
	dw CODE_00E779
	dw CODE_00E790
	dw CODE_00E7AA
	dw CODE_00E7AA
	dw CODE_00E790
	dw CODE_00E7BE
	dw CODE_00E7BE
	dw CODE_00E7F0
	dw CODE_00E6DC
	dw CODE_00E6F3
	dw CODE_00E70D
	dw CODE_00E70D
	dw CODE_00E71E
	dw CODE_00E6F3
	dw CODE_00E70D
	dw CODE_00E70D
	dw CODE_00E71E

CODE_00E58C:
	LDA.w #$0708
	STA.w $152A
	LDA.w $07EC,x
	SEC
	SBC.w #$0060
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCC.b CODE_00E5A3
	JSR.w CODE_00AC88
	SEC
	RTS

CODE_00E5A3:
	CLC
	RTS

CODE_00E5A5:
	RTS

CODE_00E5A6:
	LDY.w $0F78,x
	CPY.w #$003C
	BCC.b CODE_00E5A5
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	RTS

CODE_00E5B8:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2
	BEQ.b CODE_00E5C3
	INC.w $1526
CODE_00E5C3:
	INC.w $1434
	LDA.w $0F78,x
	CMP.w #$00C8
	BEQ.b CODE_00E5D0
	BCS.b CODE_00E601
CODE_00E5D0:
	AND.w #$003F
	BNE.b CODE_00E5A5
	LDA.b $0C
	AND.w #$001F
	SEC
	SBC.w #$000F
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.b $0E
	AND.w #$003F
	EOR.w #$FFFF
	INC
	CLC
	ADC.w $07EC,x
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_009616
	LDA.w #$0D02
	JSL.l CODE_028B1F
	RTS

CODE_00E601:
	STZ.w $1526
	JMP.w CODE_00AC88

CODE_00E607:
	LDA.w $0A9E,x
	BIT.w #$0020
	BNE.b CODE_00E61B
CODE_00E60F:
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01A9AE,y
	STA.w $05C4,x
	RTS

CODE_00E61B:
	LDA.w $0F78,x
	CMP.w #$000E
	BEQ.b CODE_00E625
	BCS.b CODE_00E60F
CODE_00E625:
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01A9B8,y
	STA.w $05C4,x
	RTS

CODE_00E631:
	LDA.w $1002,x
	AND.w #$007F
	BNE.b CODE_00E646
	STZ.b $68
	LDA.w #$FFCE
	STA.b $6C
	LDA.w #DATA_019042
	JMP.w CODE_00CE74

CODE_00E646:
	RTS

CODE_00E647:
	LDA.w $07EC,x
	AND.w #$FFF8
	STA.b $8C
	LDA.b $0E
	LSR
	AND.w #$000E
	TAY
	LDA.w DATA_01DAEE,y
	ORA.b $8C
	STA.w $07EC,x
	RTS

CODE_00E65F:
	LDA.w $0762,x
	SEC
	SBC.w #$0010
	STA.b $68
	LDA.b $10
	BMI.b CODE_00E674
	LDA.b $68
	CLC
	ADC.w #$0020
	STA.b $68
CODE_00E674:
	LDA.w $07EC,x
	CLC
	ADC.w #$000A
	STA.b $6C
	LDA.w #DATA_0192C2
	JMP.w CODE_009616

CODE_00E683:
	RTS

CODE_00E684:
	DEC.w $0CC6,x
	BPL.b CODE_00E6BF
	LDA.w #$0003
	STA.w $0CC6,x
	LDA.w #$FFC6
	STA.b $6C
	LDA.w #$FFCF
	STA.b $68
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00E6A6
	LDA.w #$0031
	STA.b $68
CODE_00E6A6:
	LDA.w #DATA_01929A
	JSR.w CODE_00CE74
	LDY.b $20
	BMI.b CODE_00E6BF
	LDA.w #DATA_01A59E
	STA.w $05C4,y
	LDA.w $0A9E,y
	ORA.w #$0001
	STA.w $0A9E,y
CODE_00E6BF:
	RTS

CODE_00E6C0:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops1
	BNE.b CODE_00E6D4
	LDA.w $0B28,x
	CLC
	ADC.w #$0028
	BMI.b CODE_00E6D4
	STA.w $0B28,x
CODE_00E6D4:
	RTS

CODE_00E6D5:
	LDA.w #$0200
	STA.w $0C3E
	RTS

CODE_00E6DC:
	LDX.b $2C
	JSR.w CODE_00E6D5
	JSR.w CODE_00E631
	JSR.w CODE_00DAEF
	LDA.w #$0000
	STA.w $0DDA,x
	JSR.w CODE_00E6C0
	JMP.w CODE_00E607

CODE_00E6F3:
	LDX.b $2C
	JSR.w CODE_00E631
	JSR.w CODE_00E6D5
	JSR.w CODE_00DAEF
	LDA.w #$0004
	STA.w $0DDA,x
	LDA.w #$0032
	STA.w $0CC6,x
	JMP.w CODE_00E607

CODE_00E70D:
	LDX.b $2C
	JSR.w CODE_00DAEF
	LDA.w #$0003
	STA.w $0DDA,x
	JSR.w CODE_00E684
	JMP.w CODE_00E607

CODE_00E71E:
	LDX.b $2C
	JSR.w CODE_00E631
	JSR.w CODE_00E6D5
	JSR.w CODE_00DAEF
	LDA.w #$0004
	STA.w $0DDA,x
	JMP.w CODE_00E607

CODE_00E732:
	LDX.b $2C
	LDA.w $1002,x
	AND.w #$001F
	BNE.b CODE_00E743
	LDA.w #$1A02
	JSL.l CODE_028B1F
CODE_00E743:
	JSR.w CODE_00E631
	JSR.w CODE_00E6D5
	JSR.w CODE_00DAEF
	STZ.w $0A14,x
	LDA.w #$0002
	STA.w $0DDA,x
	JMP.w CODE_00E607

CODE_00E758:
	LDX.b $2C
	JSR.w CODE_00E631
	JSR.w CODE_00DAEF
	JSR.w CODE_00B03C
	LDA.w $0A14,x
	SEC
	SBC.w #$0007
	STA.w $0A14,x
	JSR.w CODE_00E65F
	LDA.w #$0000
	STA.w $0DDA,x
	JMP.w CODE_00E607

CODE_00E779:
	LDX.b $2C
	JSR.w CODE_00E631
	JSR.w CODE_00DAEF
	JSR.w CODE_00E6D5
	JSR.w CODE_00E6C0
	JSR.w CODE_00E647
	JSR.w CODE_00E65F
	JMP.w CODE_00E607

CODE_00E790:
	LDX.b $2C
	JSR.w CODE_00E6D5
	JSR.w CODE_00E647
	JSR.w CODE_00E65F
	LDA.w #$0004
	STA.w $0DDA,x
	LDA.w #$0032
	STA.w $0CC6,x
	JMP.w CODE_00E607

CODE_00E7AA:
	LDX.b $2C
	JSR.w CODE_00E647
	JSR.w CODE_00E65F
	LDA.w #$0003
	STA.w $0DDA,x
	JSR.w CODE_00E684
	JMP.w CODE_00E607

CODE_00E7BE:
	LDX.b $2C
	JSR.w CODE_00E631
	JSR.w CODE_00B03C
	LDA.w $0A14,x
	CLC
	ADC.w #$001E
	STA.w $0A14,x
	JSR.w CODE_00F466
	SEC
	SBC.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BPL.b CODE_00E7DD
	EOR.w #$FFFF
	INC
CODE_00E7DD:
	CMP.w #$00F4
	BEQ.b CODE_00E7E4
	BCS.b CODE_00E7E7
CODE_00E7E4:
	JSR.w CODE_0097B0
CODE_00E7E7:
	LDA.w #$0001
	STA.w $0DDA,x
	JMP.w CODE_00E607

CODE_00E7F0:
	LDX.b $2C
	JSR.w CODE_00E631
	JSR.w CODE_00DAEF
	LDA.w #$0002
	STA.w $0DDA,x
	JMP.w CODE_00E607

CODE_00E801:
	LDX.b $2C
	DEC.w $0CC6,x
	BPL.b CODE_00E830
	LDA.w #$0002
	STA.w $0CC6,x
	LDA.w $0A9E,x
	CLC
	ADC.w #$4000
	STA.w $0A9E,x
	LDA.w $1002,x
	CMP.w #$001E
	BCC.b CODE_00E825
	BEQ.b CODE_00E825
	JMP.w CODE_00AC88

CODE_00E825:
	CMP.w #$0016
	BCC.b CODE_00E830
	LDA.w #DATA_01A5A6
	STA.w $05C4,x
CODE_00E830:
	RTS

CODE_00E831:
	LDA.w #$0004
	STA.b $64
	JMP.w CODE_00CF09

CODE_00E839:
	LDA.w $0F78,x
	CMP.w #$0004
	BNE.b CODE_00E844
	JMP.w CODE_00AC88

CODE_00E844:
	ASL
	TAY
	LDA.w DATA_01DAE6,y
	STA.w $0A9E,x
	RTS

CODE_00E84D:
	LDA.w $0A9E,x
	BIT.w #$0400
	BNE.b CODE_00E89A
	BIT.w #$0001
	BEQ.b CODE_00E86D
	AND.w #$FFFE
	STA.w $0A9E,x
	LDA.w #$0010
	STA.b $68
	LDA.w #$0014
	STA.b $6C
	JSR.w CODE_00A883
CODE_00E86D:
	JSR.w CODE_00A8DE
	LDA.w $053A,x
	CMP.w #$001C
	BEQ.b CODE_00E87A
	BCS.b CODE_00E899
CODE_00E87A:
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JSR.w CODE_00AC88
	PHX
	LDX.w #$0000
	LDA.w #$0800
	JSR.w CODE_00AC6C
	PLX
	LDA.w $1550
	BNE.b CODE_00E899
	INC.w $1550
CODE_00E899:
	RTS

CODE_00E89A:
	LDA.b $2E
	XBA
	ASL
	ASL
	AND.w #$4000
	STA.b $8C
	LDA.w $0A9E,x
	AND.w #$BFFF
	ORA.b $8C
	STA.w $0A9E,x
	RTS

CODE_00E8B0:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BEQ.b CODE_00E8ED
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BEQ.b CODE_00E8ED
	LDA.w $150E
	BNE.b CODE_00E8ED
	LDA.w $0A14,x
	BNE.b CODE_00E8ED
	LDA.b $56
	AND.w #$0300
	BNE.b CODE_00E8ED
	DEC.w $152A
	BPL.b CODE_00E8ED
	LDA.w #$0258
	STA.w $152A
	LDA.b $0E
	AND.w #$00FF
	CLC
	ADC.b $2E
	STA.b $68
	LDA.b $30
	STA.b $6C
	LDA.w #DATA_01901A
	JMP.w CODE_009616

CODE_00E8ED:
	RTS

CODE_00E8EE:
	JSR.w CODE_00E0F7
	LDA.w $1002,x
	CMP.w #$0800
	BCC.b CODE_00E8FC
	STA.w $0CC6,x
CODE_00E8FC:
	RTS

CODE_00E8FD:
	STX.w $153E
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00E90B
	JSR.w CODE_00B304
CODE_00E90B:
	JSR.w CODE_00EA04
	JSR.w CODE_00EA10
	LDA.w $1530
	SEC
	SBC.w #$0044
	STA.w $0762,x
	LDA.w $1532
	SEC
	SBC.w #$0080
	STA.w $07EC,x
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00E943
	LDA.w $1530
	SEC
	SBC.w #$0020
	STA.w $0762,x
	LDA.w $1532
	SEC
	SBC.w #$0038
	STA.w $07EC,x
	BRA.b CODE_00E958

CODE_00E943:
	DEC.w $0DDA,x
	BPL.b CODE_00E958
	LDA.w #$0028
	STA.w $0DDA,x
	STZ.b $68
	STZ.b $6C
	LDA.w #DATA_018C0A
	JMP.w CODE_00CE74

CODE_00E958:
	LDY.w #$0000
	JSR.w CODE_00E9BB
	RTS

CODE_00E95F:
	STX.w $1540
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00E96D
	JSR.w CODE_00B304
CODE_00E96D:
	JSR.w CODE_00EA04
	LDA.w $1530
	STA.w $0762,x
	LDA.w $1532
	SEC
	SBC.w #$0088
	STA.w $07EC,x
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00E9B4
	LDA.w $0F78,x
	AND.w #$0001
	BNE.b CODE_00E9B4
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #DATA_0193B2
	JSR.w CODE_009616
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LSR
	LSR
	LSR
	AND.w #$001E
	TAY
	LDA.w DATA_01C292,y
	LDY.b $20
	BMI.b CODE_00E9B4
	STA.w $098A,y
CODE_00E9B4:
	LDY.w #$0002
	JSR.w CODE_00E9BB
	RTS

CODE_00E9BB:
	LDA.w $0A9E,x
	BIT.w #$0100
	BNE.b CODE_00E9C9
	BIT.w #$0020
	BNE.b CODE_00E9EF
	RTS

CODE_00E9C9:
	LDA.w #$FF00
	STA.w $153E,y
	INC.w $1538
	JSR.w CODE_00DC7E
	LDA.w $153E
	ORA.w $1540
	ORA.w $1542
	AND.w #$00FF
	BNE.b CODE_00E9EE
	LDA.w #$0010
	STA.w $153A
	STZ.w $153C
	STZ.b $0E
CODE_00E9EE:
	RTS

CODE_00E9EF:
	LDA.w $0F78,x
	BEQ.b CODE_00E9FD
	CMP.w #$0018
	BNE.b CODE_00E9EE
	STZ.w $1546
	RTS

CODE_00E9FD:
	LDA.w #$0020
	STA.w $1546
	RTS

CODE_00EA04:
	LDY.w $1542
	BMI.b CODE_00EA0F
	LDA.w #$7000
	STA.w $0B28,y
CODE_00EA0F:
	RTS

CODE_00EA10:
	LDY.w $1540
	BMI.b CODE_00EA1B
	LDA.w #$5000
	STA.w $0B28,y
CODE_00EA1B:
	RTS

CODE_00EA1C:
	STX.w $1542
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00EA2A
	JSR.w CODE_00B304
CODE_00EA2A:
	LDA.w $1530
	STA.w $0762,x
	LDA.w $1532
	SEC
	SBC.w #$0068
	STA.w $07EC,x
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00EA4A
	LDA.w $1002,x
	AND.w #$001F
	BEQ.b CODE_00EA7F
CODE_00EA4A:
	LDA.w $1002,x
	BIT.w #$00FF
	BEQ.b CODE_00EA7F
	LDA.b $0E
	AND.w #$00FF
	BEQ.b CODE_00EA60
	LDY.w #$0004
	JSR.w CODE_00E9BB
	RTS

CODE_00EA60:
	STZ.b $68
	LDA.w #$0018
	STA.b $6C
	LDA.w #DATA_018C0A
	JSR.w CODE_00CE74
	LDY.b $20
	BMI.b CODE_00EA9B
	LDA.w #DATA_01AA16
	STA.w $05C4,y
	LDA.w #$0502
	JSL.l CODE_028B1F
	RTS

CODE_00EA7F:
	LDA.w #$2102
	JSL.l CODE_028B1F
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	CMP.w #$00A7
	BNE.b CODE_00EA9B
	LDA.w #DATA_0193DA
	JSR.w CODE_009616
CODE_00EA9B:
	RTS

CODE_00EA9C:
	STX.w $1544
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00EAAA
	JSR.w CODE_00B304
CODE_00EAAA:
	LDA.w $1530
	STA.w $0762,x
	LDA.w $1532
	STA.w $07EC,x
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00EAE9
	LDA.w $0F78,x
	AND.w #$0001
	BNE.b CODE_00EAD1
	LDA.w $0762,x
	SEC
	SBC.w #$0016
	STA.b $68
	BRA.b CODE_00EADA

CODE_00EAD1:
	LDA.w $0762,x
	CLC
	ADC.w #$0016
	STA.b $68
CODE_00EADA:
	LDA.w $07EC,x
	CLC
	ADC.w #$0010
	STA.b $6C
	LDA.w #DATA_01942A
	JSR.w CODE_009616
CODE_00EAE9:
	RTS

CODE_00EAEA:
	JSR.w CODE_0097BA
	LDA.w $0A14,x
	CLC
	ADC.w #$0020
	STA.w $0A14,x
	JSR.w CODE_0097B0
	LDA.w $07EC,x
	CMP.w #$0110
	BCC.b CODE_00EB07
	BEQ.b CODE_00EB07
	JMP.w CODE_00AC88

CODE_00EB07:
	JMP.w CODE_00F446

CODE_00EB0A:
	DEC.w $0762,x
	LDA.w $0A9E,x
	EOR.w #$4000
	STA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00EB1E
	JMP.w CODE_00EB6B

CODE_00EB1E:
	BIT.w #$0002
	BNE.b CODE_00EB4F
	DEC.w $0762,x
	DEC.w $0762,x
	LDA.w $0762,x
	SEC
	SBC.w #$0050
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BEQ.b CODE_00EB37
	BCS.b CODE_00EB52
CODE_00EB37:
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	LDA.w #DATA_01A9E2
	STA.w $05C4,x
	LDA.w #$0003
	STA.w $064E,x
	STA.w $06D8,x
CODE_00EB4F:
	INC.w $07EC,x
CODE_00EB52:
	LDA.w $1002,x
	INC
	AND.w #$007F
	BNE.b CODE_00EB68
	STZ.b $68
	LDA.w #$FFF8
	STA.b $6C
	LDA.w #DATA_019042
	JSR.w CODE_00CE74
CODE_00EB68:
	JMP.w CODE_00F446

CODE_00EB6B:
	JSR.w CODE_00E0D2
	JMP.w CODE_00AC88

CODE_00EB71:
	DEC.w $0CC6,x
	BPL.b CODE_00EB93
	LDA.w #$0001
	STA.w $0CC6,x
	INC.w $0D50,x
	LDA.w $0D50,x
	CMP.w #$0002
	BNE.b CODE_00EB8A
	JMP.w CODE_00AC88

CODE_00EB8A:
	ASL
	ASL
	CLC
	ADC.w #DATA_01AA06
	STA.w $05C4,x
CODE_00EB93:
	RTS

CODE_00EB94:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BEQ.b CODE_00EBB0
	CMP.w #!Define_SXAR_LevelID_Cyclops3
	BNE.b CODE_00EBEF
	LDA.w #$005A
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w #$00BF
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	JMP.w CODE_00EBEF

CODE_00EBB0:
	INC.w $1432
	LDA.w #$00F0
	STA.w $1530
	LDA.w #$010F
	STA.w $1532
	STZ.w $1534
	LDA.w #$1234
	STA.w $1536
	STZ.w $1538
	STZ.w $153A
	STZ.w $153C
	LDA.w #$FFFF
	STA.w $153E
	STA.w $1540
	STA.w $1542
	STA.w $1544
	STZ.w $1546
	LDA.w #$0041
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w #$00DF
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
CODE_00EBEF:
	RTS

CODE_00EBF0:
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BNE.b CODE_00EBFE
	JSR.w CODE_00EC23
	JSR.w CODE_00EBFF
CODE_00EBFE:
	RTS

CODE_00EBFF:
	LDA.w $1534
	ASL
	ASL
	ORA.w $1538
	CMP.w $1536
	BEQ.b CODE_00EC22
	STA.w $1536
	LDX.w #$0020
CODE_00EC12:
	STZ.w $1430,x
	DEX
	DEX
	BNE.b CODE_00EC12
	ASL
	CLC
	ADC.w #$0002
	TAX
	INC.w $1430,x
CODE_00EC22:
	RTS

CODE_00EC23:
	LDA.w #$0600
	STA.w $0C3E
	INC.w $153C
	LDA.w $153A
	ASL
	TAX
	JMP.w (DATA_00EC34,x)

DATA_00EC34:
	dw CODE_00EC83
	dw CODE_00EC83
	dw CODE_00ECCB
	dw CODE_00EC83
	dw CODE_00ECCB
	dw CODE_00ECFF
	dw CODE_00ED78
	dw CODE_00EC83
	dw CODE_00ECCB
	dw CODE_00ECCB
	dw CODE_00EC83
	dw CODE_00ED78
	dw CODE_00EC83
	dw CODE_00ECCB
	dw CODE_00EC83
	dw CODE_00ECCB
	dw CODE_00ED26

CODE_00EC56:
	CPX.w #$FF00
	BEQ.b CODE_00EC5C
	RTS

CODE_00EC5C:
	LDA.w $153A
	CMP.w #$0010
	BEQ.b CODE_00EC6E
	INC
	AND.w #$000F
	STA.w $153A
	STZ.w $153C
CODE_00EC6E:
	RTS

CODE_00EC6F:
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	RTS

CODE_00EC79:
	LDA.w $0A9E,x
	AND.w #$FFFD
	STA.w $0A9E,x
	RTS

CODE_00EC83:
	LDY.w $153C
	LDX.w $153E
	BMI.b CODE_00EC56
	CPY.w #$0020
	BEQ.b CODE_00ECAF
	CPY.w #$0028
	BEQ.b CODE_00ECB6
	CPY.w #$0048
	BEQ.b CODE_00EC6F
	CPY.w #$00B0
	BEQ.b CODE_00EC79
	CPY.w #$00A7
	BEQ.b CODE_00ECBD
	CPY.w #$00AF
	BEQ.b CODE_00ECC4
	CPY.w #$00FF
	BEQ.b CODE_00EC5C
	RTS

CODE_00ECAF:
	LDA.w #$0002
	STA.w $1534
	RTS

CODE_00ECB6:
	LDA.w #$0003
	STA.w $1534
	RTS

CODE_00ECBD:
	LDA.w #$0002
	STA.w $1534
	RTS

CODE_00ECC4:
	LDA.w #$0000
	STA.w $1534
	RTS

CODE_00ECCB:
	STZ.w $1534
	LDY.w $153C
	LDX.w $1540
	BPL.b CODE_00ECD9
	JMP.w CODE_00EC56

CODE_00ECD9:
	CPY.w #$0040
	BNE.b CODE_00ECE1
	JMP.w CODE_00EC6F

CODE_00ECE1:
	CPY.w #$0041
	BEQ.b CODE_00ECF7
	CPY.w #$0060
	BNE.b CODE_00ECEE
	JMP.w CODE_00EC79

CODE_00ECEE:
	CPY.w #$00FF
	BNE.b CODE_00ECF6
	JMP.w CODE_00EC5C

CODE_00ECF6:
	RTS

CODE_00ECF7:
	LDA.w #$0C02
	JSL.l CODE_028B1F
	RTS

CODE_00ECFF:
	STZ.w $1534
	LDY.w $153C
	LDX.w $1542
	BPL.b CODE_00ED0D
	JMP.w CODE_00EC56

CODE_00ED0D:
	CPY.w #$0001
	BNE.b CODE_00ED15
	JSR.w CODE_00EC6F
CODE_00ED15:
	CPY.w #$0090
	BNE.b CODE_00ED1D
	JSR.w CODE_00EC79
CODE_00ED1D:
	CPY.w #$00FF
	BNE.b CODE_00ED25
	JMP.w CODE_00EC5C

CODE_00ED25:
	RTS

CODE_00ED26:
	LDA.w #$FFFF
	STA.w $14F0
	INC.w $1526
	LDA.b $0E
	CMP.w #$0190
	BEQ.b CODE_00ED38
	BCS.b CODE_00ED74
CODE_00ED38:
	AND.w #$001F
	BNE.b CODE_00ED6E
	LDA.b $0C
	AND.w #$003F
	SEC
	SBC.w #$001F
	CLC
	ADC.w $1530
	STA.b $68
	LDA.b $0E
	AND.w #$007F
	EOR.w #$FFFF
	INC
	CLC
	ADC.w $1532
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_009616
	LDA.w #$0D02
	JSL.l CODE_028B1F
	LDA.w #$0020
	STA.w $1546
CODE_00ED6E:
	LDA.b $0E
	CMP.w #$017C
	RTS

CODE_00ED74:
	INC.w $1522
	RTS

CODE_00ED78:
	LDX.w $1544
	LDY.w $153C
	CPY.w #$0001
	BEQ.b CODE_00EDD6
	CPY.w #$0010
	BEQ.b CODE_00EDE6
	CPY.w #$0018
	BNE.b CODE_00ED90
	JSR.w CODE_00EC6F
CODE_00ED90:
	CPY.w #$0019
	BNE.b CODE_00ED98
	JSR.w CODE_00EDDE
CODE_00ED98:
	CPY.w #$0020
	BEQ.b CODE_00EDED
	CPY.w #$0120
	BNE.b CODE_00EDA5
	JSR.w CODE_00EDE6
CODE_00EDA5:
	CPY.w #$0130
	BNE.b CODE_00EDAD
	JSR.w CODE_00EC79
CODE_00EDAD:
	CPY.w #$014E
	BEQ.b CODE_00EDED
	CPY.w #$00A0
	BNE.b CODE_00EDBA
	JSR.w CODE_00EDE6
CODE_00EDBA:
	CPY.w #$00B0
	BNE.b CODE_00EDC2
	JSR.w CODE_00EDED
CODE_00EDC2:
	CPY.w #$016F
	BNE.b CODE_00EDCA
	JMP.w CODE_00EC5C

CODE_00EDCA:
	CPY.w #$0030
	BCC.b CODE_00EDDD
	CPY.w #$0130
	BCS.b CODE_00EDDD
	BRA.b CODE_00EDF4

CODE_00EDD6:
	LDA.w #$2F02
	JSL.l CODE_028B1F
CODE_00EDDD:
	RTS

CODE_00EDDE:
	LDA.w #$1C02
	JSL.l CODE_028B1F
	RTS

CODE_00EDE6:
	LDA.w #$0001
	STA.w $1534
	RTS

CODE_00EDED:
	LDA.w #$0000
	STA.w $1534
	RTS

CODE_00EDF4:
	TYA
	SEC
	SBC.w #$0030
	LSR
	TAX
	LDA.w DATA_01C2B2,x
	BIT.w #$0001
	BEQ.b CODE_00EE06
	JSR.w CODE_00EE42
CODE_00EE06:
	BIT.w #$0002
	BEQ.b CODE_00EE0E
	JSR.w CODE_00EE4B
CODE_00EE0E:
	BIT.w #$0004
	BEQ.b CODE_00EE16
	JSR.w CODE_00EE54
CODE_00EE16:
	BIT.w #$0008
	BEQ.b CODE_00EE1E
	JSR.w CODE_00EE5D
CODE_00EE1E:
	BIT.w #$0010
	BEQ.b CODE_00EE26
	JSR.w CODE_00EE3F
CODE_00EE26:
	BIT.w #$0020
	BEQ.b CODE_00EE2E
	JSR.w CODE_00EE48
CODE_00EE2E:
	BIT.w #$0040
	BEQ.b CODE_00EE36
	JSR.w CODE_00EE51
CODE_00EE36:
	BIT.w #$0080
	BEQ.b CODE_00EE3E
	JSR.w CODE_00EE5A
CODE_00EE3E:
	RTS

CODE_00EE3F:
	JSR.w CODE_00EE42
CODE_00EE42:
	INC.b $46
	DEC.w $1530
	RTS

CODE_00EE48:
	JSR.w CODE_00EE4B
CODE_00EE4B:
	DEC.b $46
	INC.w $1530
	RTS

CODE_00EE51:
	JSR.w CODE_00EE54
CODE_00EE54:
	INC.b $48
	DEC.w $1532
	RTS

CODE_00EE5A:
	JSR.w CODE_00EE5D
CODE_00EE5D:
	DEC.b $48
	INC.w $1532
	RTS

CODE_00EE63:
	PHP
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Cyclops2Boss
	BNE.b CODE_00EE81
	SEP.b #$20
	LDA.w $1546
	BEQ.b CODE_00EE7E
	LDA.b $10
	BMI.b CODE_00EE7E
	LDA.b #$12
	STA.w $2106
	BRA.b CODE_00EE81

CODE_00EE7E:
	STZ.w $2106
CODE_00EE81:
	PLP
	RTS

ADDR_00EE83:
	REP.b #$30
CODE_00EE85:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00EE90
	JSR.w CODE_00B304
CODE_00EE90:
	JSR.w CODE_0097B0
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00EE9E
	JMP.w CODE_00E1E8

CODE_00EE9E:
	BIT.w #$0002
	BNE.b CODE_00EEE0
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CMP.w $0762,x
	BMI.b CODE_00EEE6
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	LDA.w $0762,x
	CLC
	ADC.w #$0020
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #$D801
	STA.b $70
	LDA.w #DATA_018D9A
	JSR.w CODE_009616
	LDY.b $20
	BMI.b CODE_00EEE6
	LDA.w #$0000
	STA.w $0A14,y
	LDA.w #$1502
	JSL.l CODE_028B1F
	BRA.b CODE_00EEE6

CODE_00EEE0:
	LDA.w #$0300
	STA.w $098A,x
CODE_00EEE6:
	RTS

CODE_00EEE7:
	LDA.w #$1C00
	STA.b $8C
	LDA.b $0E
	AND.w #$0003
	BNE.b CODE_00EEF8
	LDA.w #$5C00
	STA.b $8C
CODE_00EEF8:
	LDA.w $0A9E,x
	EOR.b $8C
	STA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00EF0C
	BIT.w #$0020
	BNE.b CODE_00EF22
	BRA.b CODE_00EF21

CODE_00EF0C:
	LDY.w $150E
	BEQ.b CODE_00EF14
	JSR.w CODE_00AC81
CODE_00EF14:
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.w $07EC,x
	JSR.w CODE_00DC7E
CODE_00EF21:
	RTS

CODE_00EF22:
	JSR.w CODE_00EF14
	LDA.w $0A9E,x
	AND.w #$EFFF
	STA.w $0A9E,x
	RTS

CODE_00EF2F:
	LDA.w $159E
	BEQ.b CODE_00EF4B
	LDA.w $0A9E,x
	EOR.w #$4000
	STA.w $0A9E,x
	LDA.b $0E
	AND.w #$0003
	BNE.b CODE_00EF4B
	LDA.w #$0502
	JSL.l CODE_028B1F
CODE_00EF4B:
	RTS

CODE_00EF4C:
	PHP
	REP.b #$30
	JSL.l CODE_028D8F
	JSR.w CODE_00F02A
CODE_00EF56:
	REP.b #$30
	JSL.l CODE_0295A6
	JSL.l CODE_02951C
	LDA.w #$000F
	JSR.w CODE_00839D
	JSL.l CODE_0295D2
	JSR.w CODE_00B4FF
	JSL.l CODE_029A32
	JSR.w CODE_00B500
	JSL.l CODE_0299C0
	JSR.w CODE_00BC76
	JSR.w CODE_00D86D
	JSL.l CODE_0294FD
	JSR.w CODE_00B6C5
	JSR.w CODE_00A3DE
	JSL.l CODE_029062
	JSR.w CODE_00949C
	JSL.l CODE_02A044
	REP.b #$30
	LDX.w #$0000
	JSL.l CODE_02919D
	LDA.w #$000A
	JSR.w CODE_00839D
	JSR.w CODE_0083B4
	LDA.w #$00FF
	TSB.w $14FA
	BNE.b CODE_00EFB0
	JSR.w CODE_00EFDC
CODE_00EFB0:
	LDA.w $1522
	BNE.b CODE_00EFD1
	LDA.w $135B
	BNE.b CODE_00EFC6
	LDA.w $1506
	CMP.w #$012C
	BEQ.b CODE_00EFC4
	BCS.b CODE_00EFD1
CODE_00EFC4:
	BRA.b CODE_00EF56

CODE_00EFC6:
	REP.b #$30
	STZ.w $1598
	JSL.l CODE_0295A6
	PLP
	RTS

CODE_00EFD1:
	STZ.w $1522
	INC.w !RAM_SXAR_Global_LevelClearFlags
	INC.w !RAM_SXAR_Global_LevelClearFlags
	BRA.b CODE_00EFC6

CODE_00EFDC:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F3400>>16)
	LDX.w #$7F3400
	LDY.w #!Define_SXAR_Graphics_Player_Wolverine
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F9400>>16)
	LDX.w #$7F9400
	LDY.w #!Define_SXAR_Graphics_Sprite_Obnoxio
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FD400>>16)
	LDX.w #$7FD400
	LDY.w #!Define_SXAR_Graphics_Player_WolverineClaws
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FF400>>16)
	LDX.w #$7FF400
	LDY.w #!Define_SXAR_Graphics_Sprite_PausedText
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FCC00>>16)
	LDX.w #$7FCC00
	LDY.w #!Define_SXAR_Graphics_Sprite_Apocalypse
	JSL.l CODE_028000
	INC.b $14
	RTS

CODE_00F02A:
	PHP
	SEP.b #$20
	LDA.b #$F1
	STA.w $4200
	CLI
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_WolverineLevel
	JSL.l CODE_028000
	JSR.w CODE_0082A4
	JSR.w CODE_009BA5
	REP.b #$20
	JSL.l CODE_0295A6
	STZ.w $0102
	STZ.w $0104
	SEP.b #$20
	JSR.w CODE_00F2D8
	JSL.l CODE_028EB6
	REP.b #$20
	STZ.w $14FA
	STZ.w $135B
	STZ.w $1522
	STZ.w $10BC
	INC.w $136E
	LDA.w #$0000
	STA.w $14F2
	STZ.w !RAM_SXAR_Wolverine_SelfHealingFrameCounterLo
	STZ.w !RAM_SXAR_Wolverine_SelfHealingCounterLo
	LDA.w #$0004
	STA.w $01B5
	LDA.w #$0014
	ASL
	STA.w $01B7
	SEP.b #$20
	LDA.b #$39
	STA.w $2105
	LDA.b #$03
	STA.w $2101
	LDA.b #$00
	STA.w $2107
	LDA.b #$04
	STA.w $2108
	LDA.b #$08
	STA.w $2109
	LDA.b #$22
	STA.w $210B
	LDA.b #$01
	STA.w $210C
	LDA.b #$08
	STA.w $13A4
	LDA.b #$10
	STA.w $13A6
	JSL.l CODE_028EB6
	JSR.w CODE_0088F1
	REP.b #$30
	JSL.l CODE_0293E8
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_00F10F
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_00F14D
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Wolverine1
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Wolverine1
	LDX.w #$0080
	JSL.l CODE_028000
	LDA.w #$0004
	JSR.w CODE_008912
	LDA.w #$0040
	STA.w $152C
	LDA.w #$0460
	STA.w $152E
	LDA.w #$0360
	STA.w $1564
	LDA.w #$0614
	STA.w $1566
	JMP.w CODE_00F198

CODE_00F10F:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Wolverine2
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Wolverine2
	LDX.w #$0080
	JSL.l CODE_028000
	LDA.w #$0005
	JSR.w CODE_008912
	LDA.w #$0040
	STA.w $152C
	LDA.w #$1F10
	STA.w $152E
	LDA.w #$4F00
	STA.w $1564
	LDA.w #$0300
	STA.w $1566
	BRA.b CODE_00F198

CODE_00F14D:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_FGBG_Cyclops3
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_Wolverine1
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_DrainBeam
	LDX.w #$00D0
	JSL.l CODE_028000
	LDA.w #$0005
	JSR.w CODE_008912
	LDA.w #$0050
	STA.w $152C
	LDA.w #$07C8
	STA.w $152E
	LDA.w #$06D0
	STA.w $1564
	LDA.w #$0000
	STA.w $1566
CODE_00F198:
	JSL.l CODE_028CCA
	JSR.w CODE_00F24D
	JSL.l CODE_0299F3
	JSR.w CODE_008906
	REP.b #$30
	JSR.w CODE_00896E
	STZ.w $1357
	STZ.w $1526
	LDA.w #$0A00
	STA.b $62
	LDA.w #$0708
	STA.w $152A
	SEP.b #$30
	LDA.b #$64
	STA.w $4209
	STZ.w $420A
	LDA.b #$A1
	STA.w $4200
	LDA.b #$1B
	STA.w $212C
	STA.w $212E
	CLI
	REP.b #$30
	INC.b $16
	INC.w $14F0
	JSL.l CODE_02953D
	JSL.l CODE_029573
	JSR.w CODE_00D828
	REP.b #$30
	LDX.w #$0000
	LDA.w #DATA_018078
	JSR.w CODE_0096EA
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine1
	BEQ.b CODE_00F221
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_00F215
	LDA.w #$00C4
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w #$00CF
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	DEC.w $0B28
	STZ.w $14F0
	DEC.w $159C
	BRA.b CODE_00F221

CODE_00F215:
	LDA.w #$005A
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	LDA.w #$00AF
	STA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
CODE_00F221:
	INC.w $013D
	LDA.w #$8080
	STA.b $1A
	LDA.w #$0002
	STA.w $0102
	STA.w $0104
	LDX.w #$0004
CODE_00F235:
	PHX
	JSL.l CODE_0295A6
	LDA.w #$8080
	STA.b $1A
	JSL.l CODE_029A32
	INC.b $0E
	PLX
	DEX
	BPL.b CODE_00F235
	STZ.b $1A
	PLP
	RTS

CODE_00F24D:
	PHP
	REP.b #$30
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_00F298
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_00F2D3
	LDA.w #$2000
	STA.w $1508
	LDA.w #$7000
	STA.w $150A
	LDA.w #$9000
	STA.w $150C
	LDA.w #$0048
	STA.b $4F
	LDA.w #$0034
	STA.b $51
	LDA.w #$0030
	STA.b $53
	LDA.w #$00C0
	STA.w $1512
	LDA.w #$00C0
	STA.w $1514
	LDA.w #$0080
	STA.w $1516
	LDA.w #$00B0
	STA.w $1518
	BRA.b CODE_00F2D6

CODE_00F298:
	LDA.w #$2000
	STA.w $1508
	LDA.w #$7000
	STA.w $150A
	LDA.w #$9000
	STA.w $150C
	LDA.w #$01F4
	STA.b $4F
	LDA.w #$00DE
	STA.b $51
	LDA.w #$0030
	STA.b $53
	LDA.w #$00C0
	STA.w $1512
	LDA.w #$00C0
	STA.w $1514
	LDA.w #$0080
	STA.w $1516
	LDA.w #$00B0
	STA.w $1518
	BRA.b CODE_00F2D6

CODE_00F2D3:
	JSR.w CODE_00D7F3
CODE_00F2D6:
	PLP
	RTS

CODE_00F2D8:
	PHP
	REP.b #$30
	LDX.w #$0000
	JSR.w CODE_0088C2
	LDX.w #$0400
	JSR.w CODE_0088C2
	LDX.w #$0800
	JSR.w CODE_0088C2
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Wolverine2
	BEQ.b CODE_00F339
	CMP.w #!Define_SXAR_LevelID_Wolverine3
	BEQ.b CODE_00F378
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC000>>16)
	LDX.w #$7FC000
	LDY.w #!Define_SXAR_Graphics_Sprite_WolverineLevel1EnemiesAndGlobalSprites
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_WolverineLevel
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Wolverine1
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E7000>>16)
	LDX.w #$7E7000
	LDY.w #!Define_SXAR_LevelBG_Wolverine1
	JSL.l CODE_028000
	JMP.w CODE_00F3D2

CODE_00F339:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC000>>16)
	LDX.w #$7FC000
	LDY.w #!Define_SXAR_Graphics_Sprite_WolverineLevel2EnemiesAndGlobalSprites
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_WolverineLevel
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Wolverine2
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E7000>>16)
	LDX.w #$7E7000
	LDY.w #!Define_SXAR_LevelBG_Wolverine2
	JSL.l CODE_028000
	JMP.w CODE_00F3D2

CODE_00F378:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC000>>16)
	LDX.w #$7FC000
	LDY.w #!Define_SXAR_Graphics_Sprite_WolverineLevel1EnemiesAndGlobalSprites
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FC940>>16)
	LDX.w #$7FC940
	LDY.w #!Define_SXAR_Graphics_Sprite_DrainBeam1
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7FCB40>>16)
	LDX.w #$7FCB40
	LDY.w #!Define_SXAR_Graphics_Sprite_DrainBeam2
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F4000>>16)
	LDX.w #$7F4000
	LDY.w #!Define_SXAR_Graphics_FGBG_WolverineCyclopsFinalLevel
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w #!Define_SXAR_LevelData_Wolverine3
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E7000>>16)
	LDX.w #$7E7000
	LDY.w #!Define_SXAR_LevelBG_Cyclops3
	JSL.l CODE_028000
CODE_00F3D2:
	PLP
	RTS

CODE_00F3D4:
	DEC.w $0CC6,x
	BPL.b CODE_00F3FC
	LDA.w $0DDA,x
	CLC
	ADC.w #$0004
CODE_00F3E0:
	STA.w $0DDA,x
	TAY
	LDA.w $0D50,x
	STA.b $8C
	LDA.b ($8C),y
	BNE.b CODE_00F3F2
	LDA.w #$0000
	BRA.b CODE_00F3E0

CODE_00F3F2:
	STA.w $05C4,x
	INY
	INY
	LDA.b ($8C),y
	STA.w $0CC6,x
CODE_00F3FC:
	RTS

CODE_00F3FD:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00F429
	LDA.w #$2602
	JSL.l CODE_028B1F
	LDA.w $0762,x
	STA.b $68
	LDA.w $0900,x
	LSR
	STA.b $8C
	LDA.w $07EC,x
	SEC
	SBC.b $8C
	CLC
	ADC.w #$0008
	STA.b $6C
	LDA.w #DATA_019272
	JSR.w CODE_0096EA
CODE_00F429:
	RTS

CODE_00F42A:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w $0762,x
	BPL.b CODE_00F437
	EOR.w #$FFFF
	INC
CODE_00F437:
	RTS

CODE_00F438:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	SEC
	SBC.w $07EC,x
	BPL.b CODE_00F445
	EOR.w #$FFFF
	INC
CODE_00F445:
	RTS

CODE_00F446:
	LDA.w $0762,x
	SEC
	SBC.w $0876,x
	BEQ.b CODE_00F452
	BMI.b CODE_00F452
	RTS

CODE_00F452:
	JMP.w CODE_00AC88

CODE_00F455:
	LDA.w $0EEE,x
	CLC
	ADC.w #$0004
	STA.b $8C
	LDA.w #$007E
	STA.b $8E
	LDA.b [$8C]
	RTS

CODE_00F466:
	LDA.w $0EEE,x
	CLC
	ADC.w #$0002
	STA.b $8C
	LDA.w #$007E
	STA.b $8E
	LDA.b [$8C]
	RTS

CODE_00F477:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00F482
	JSR.w CODE_00B31B
CODE_00F482:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00F4A6
	JSR.w CODE_00F42A
	CMP.w #$0014
	BEQ.b CODE_00F494
	BCS.b CODE_00F4A5
CODE_00F494:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CMP.w $07EC,x
	BCS.b CODE_00F4A5
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
CODE_00F4A5:
	RTS

CODE_00F4A6:
	LDA.w $07EC,x
	SEC
	SBC.w #$0020
	CMP.w !RAM_SXAR_SwimStorm_WaterYPosLo
	BCC.b CODE_00F4B6
	DEC.w $07EC,x
	RTS

CODE_00F4B6:
	LDA.w $0F78,x
	AND.w #$0003
	BNE.b CODE_00F4A5
	INC.w $07EC,x
	RTS

CODE_00F4C2:
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00F4CD
	JSR.w CODE_00F537
CODE_00F4CD:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00F4D8
	JSR.w CODE_00B31B
CODE_00F4D8:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00F50D
	LDA.w $07EC,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCC.b CODE_00F505
	JSR.w CODE_00F42A
	CMP.w #$0068
	BEQ.b CODE_00F4F2
	BCS.b CODE_00F506
CODE_00F4F2:
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	STZ.w $1002,x
	LDA.w #$3302
	JSL.l CODE_028B1F
CODE_00F505:
	RTS

CODE_00F506:
	JSR.w CODE_0097C9
	JSR.w CODE_0097D3
	RTS

CODE_00F50D:
	LDA.w $1002,x
	CMP.w #$0004
	BNE.b CODE_00F518
	JSR.w CODE_00F52C
CODE_00F518:
	DEC
	CMP.w #$0028
	BCS.b CODE_00F54D
	LSR
	ASL
	TAY
	LDA.w DATA_01D230,y
	CLC
	ADC.w $07EC,x
	STA.w $07EC,x
	RTS

CODE_00F52C:
	STA.b $8C
	LDA.w #DATA_01B088
	STA.w $05C4,x
	LDA.b $8C
	RTS

CODE_00F537:
	LDA.w $0F78,x
	BNE.b CODE_00F505
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.b $6C
	JMP.w CODE_00F9B5

CODE_00F54D:
	JSR.w CODE_00F42A
	CMP.w #$00A0
	BEQ.b CODE_00F557
	BCS.b CODE_00F505
CODE_00F557:
	JSR.w CODE_00F3D4
	LDA.w $0F78,x
	CMP.w #$0014
	BCC.b CODE_00F506
	LDA.w $0CC6,x
	BEQ.b CODE_00F56E
	CMP.w #$0001
	BEQ.b CODE_00F5B2
	BRA.b CODE_00F506

CODE_00F56E:
	LDA.w $05C4,x
	CMP.w #DATA_01B0B8
	BNE.b CODE_00F505
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00F583
	LDA.w #$0018
	BRA.b CODE_00F586

CODE_00F583:
	LDA.w #$FFE8
CODE_00F586:
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.w #$FFFA
	CLC
	ADC.w $07EC,x
	STA.b $6C
	LDA.w $0A9E,x
	AND.w #$0004
	ORA.w #$1000
	STA.b $70
	LDA.w #DATA_01983A
	JSR.w CODE_0096F3
	LDA.b $20
	BMI.b CODE_00F5B1
	LDA.w #$2E02
	JSL.l CODE_028B1F
CODE_00F5B1:
	RTS

CODE_00F5B2:
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_00F5BF
	LDA.w #$001B
	BRA.b CODE_00F5C2

CODE_00F5BF:
	LDA.w #$FFE5
CODE_00F5C2:
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.w #$FFFB
	CLC
	ADC.w $07EC,x
	STA.b $6C
	STZ.b $70
	LDA.w #DATA_019812
	JSR.w CODE_009616
	RTS

CODE_00F5DA:
	LDA.w $1002,x
	CMP.w #$0002
	BEQ.b CODE_00F5EB
	CMP.w #$0004
	BNE.b CODE_00F5EA
	JMP.w CODE_00AC88

CODE_00F5EA:
	RTS

CODE_00F5EB:
	LDA.w #DATA_01B206
	STA.w $05C4,x
	RTS

CODE_00F5F2:
	LDA.w $1002,x
	CMP.w #$0034
	BCC.b CODE_00F5FF
	BEQ.b CODE_00F5FF
	JMP.w CODE_00AC88

CODE_00F5FF:
	CMP.w #$0014
	BCC.b CODE_00F607
	JSR.w CODE_00F3D4
CODE_00F607:
	INC.w $07EC,x
	LDA.w $0A9E,x
	BIT.w #$0120
	BEQ.b CODE_00F615
	JMP.w CODE_00AC88

CODE_00F615:
	BIT.w #$0004
	BNE.b CODE_00F625
	LDA.w $0762,x
	CLC
	ADC.w #$0003
	STA.w $0762,x
	RTS

CODE_00F625:
	LDA.w $0762,x
	SEC
	SBC.w #$0003
	STA.w $0762,x
	JMP.w CODE_00F446

CODE_00F632:
	LDA.w #$7777
	STA.w $0B28,x
	LDA.w $0A9E,x
	AND.w #$FEDF
	STA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00F671
	JSR.w CODE_00A3BA
	BCS.b CODE_00F670
	LDA.w $07EC,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCC.b CODE_00F670
	JSR.w CODE_00F42A
	CMP.w #$0068
	BEQ.b CODE_00F65D
	BCS.b CODE_00F670
CODE_00F65D:
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	STZ.w $1002,x
	LDA.w #$3E02
	JSL.l CODE_028B1F
CODE_00F670:
	RTS

CODE_00F671:
	LDA.w $1002,x
	BIT.w #$0001
	BNE.b CODE_00F670
	BIT.w #$0040
	BNE.b CODE_00F687
	BIT.w #$007F
	BEQ.b CODE_00F68B
CODE_00F683:
	DEC.w $07EC,x
	RTS

CODE_00F687:
	INC.w $07EC,x
	RTS

CODE_00F68B:
	LDA.w #$3E02
	JSL.l CODE_028B1F
	BRA.b CODE_00F683

CODE_00F694:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00F69F
	JSR.w CODE_00B31B
CODE_00F69F:
	LDA.w $1002,x
	AND.w #$0007
	BNE.b CODE_00F6E1
	LDA.w $0A9E,x
	BIT.w #$0004
	BNE.b CODE_00F6B8
	LDA.w $0762,x
	CLC
	ADC.w #$0012
	BRA.b CODE_00F6BF

CODE_00F6B8:
	LDA.w $0762,x
	SEC
	SBC.w #$0012
CODE_00F6BF:
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0002
	BNE.b CODE_00F6D8
	INC.b $96
	JSR.w CODE_00B228
	BIT.w #$0001
	BNE.b CODE_00F6E1
CODE_00F6D8:
	LDA.w $0A9E,x
	EOR.w #$4004
	STA.w $0A9E,x
CODE_00F6E1:
	LDA.w $07EC,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BNE.b CODE_00F72C
	JSR.w CODE_00F42A
	CMP.w #$0040
	BEQ.b CODE_00F6F3
	BCS.b CODE_00F72C
CODE_00F6F3:
	LDA.w #DATA_01B196
	CMP.w $0D50,x
	BEQ.b CODE_00F725
	STA.w $0D50,x
	LDA.w #$0003
	STA.w $064E,x
	STZ.w $0CC6,x
	LDA.w #$1000
	STA.w $0C3C,x
	LDA.w #$0107
	STA.w $098A,x
	JSR.w CODE_00F3D4
	LDA.w $0F78,x
	AND.w #$000F
	BNE.b CODE_00F725
	JSR.w CODE_0097C4
	JSR.w CODE_0097D3
	RTS

CODE_00F725:
	JSR.w CODE_0097B0
	JSR.w CODE_00F3D4
	RTS

CODE_00F72C:
	LDA.w #DATA_01B1A8
	CMP.w $0D50,x
	BEQ.b CODE_00F725
	STA.w $0D50,x
	LDA.w #$0002
	STA.w $064E,x
	STZ.w $0CC6,x
	LDA.w #$0500
	STA.w $0C3C,x
	LDA.w #$0001
	STA.w $098A,x
	BRA.b CODE_00F725

CODE_00F74E:						; Note: Obnoxio sprite
	LDA.w $1002,x
	BEQ.b CODE_00F766
	LDA.w $0A9E,x
	BIT.w #$0100
	BEQ.b CODE_00F75E
	JMP.w CODE_00F881

CODE_00F75E:
	LDA.w $0D50,x
	BEQ.b CODE_00F76E
	JMP.w CODE_00F80A

CODE_00F766:
	LDA.w #$3202
	JSL.l CODE_028B1F
	RTS

CODE_00F76E:
	DEC.w $0CC6,x
	BPL.b CODE_00F788
	LDA.w #$0004
	STA.w $0CC6,x
	LDA.w $0DDA,x
	INC
	CMP.w #$000B
	BNE.b CODE_00F785
	LDA.w #$0001
CODE_00F785:
	STA.w $0DDA,x
CODE_00F788:
	LDA.w $0762,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BCC.b CODE_00F7B4
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	CLC
	ADC.w #$004E
	AND.w #$FFF0
	STA.b $8C
	LDA.w $0762,x
	AND.w #$FFF0
	CMP.b $8C
	BEQ.b CODE_00F7F9
	BEQ.b CODE_00F7AA
	BCS.b CODE_00F7AF
CODE_00F7AA:
	JSR.w CODE_00F8CD
	BRA.b CODE_00F7D4

CODE_00F7AF:
	JSR.w CODE_00F8D7
	BRA.b CODE_00F7D4

CODE_00F7B4:
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	SEC
	SBC.w #$004E
	AND.w #$FFF0
	STA.b $8C
	LDA.w $0762,x
	AND.w #$FFF0
	CMP.b $8C
	BEQ.b CODE_00F7F9
	BCC.b CODE_00F7D1
	JSR.w CODE_00F8D7
	BRA.b CODE_00F7D4

CODE_00F7D1:
	JSR.w CODE_00F8CD
CODE_00F7D4:
	JSR.w CODE_00F8A6
	ORA.w #$0000
	BNE.b CODE_00F7F9
	LDA.w $07EC,x
	INC
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0001
	BNE.b CODE_00F7F1
	JSR.w CODE_00A3BA
	BCS.b CODE_00F7F1
	BRA.b CODE_00F7F9

CODE_00F7F1:
	JSR.w CODE_0097B0
CODE_00F7F4:
	JSL.l CODE_028C8D
	RTS

CODE_00F7F9:
	LDA.w #$0001
	STA.w $0D50,x
	STZ.w $0CC6,x
	STZ.w $0DDA,x
	STZ.w $1002,x
	BRA.b CODE_00F7F4

CODE_00F80A:
	LDA.w $1002,x
	CMP.w #$0001
	BEQ.b CODE_00F82B
	CMP.w #$0004
	BEQ.b CODE_00F83A
	CMP.w #$0015
	BEQ.b CODE_00F84C
	CMP.w #$0014
	BEQ.b CODE_00F86B
	CMP.w #$0034
	BEQ.b CODE_00F878
	JSL.l CODE_029044
	RTS

CODE_00F82B:
	LDA.b $06
	AND.w #$000F
	BEQ.b CODE_00F7F4
	STZ.w $1002,x
	STZ.w $0DDA,x
	BRA.b CODE_00F878

CODE_00F83A:
	JSR.w CODE_0097C9
	JSR.w CODE_0097D3
	LDA.w #$000C
	STA.w $0DDA,x
	JSL.l CODE_029044
	BRA.b CODE_00F7F4

CODE_00F84C:
	JSR.w CODE_00E457
	LDY.b $20
	BMI.b CODE_00F7F4
	LDA.w $07EC,y
	CLC
	ADC.w #$0008
	STA.w $07EC,y
	LDA.w #DATA_01B286
	STA.w $05C4,y
	LDA.w #$1000
	STA.w $0C3C,y
	BRA.b CODE_00F7F4

CODE_00F86B:
	LDA.w #$000D
	STA.w $0DDA,x
	JSL.l CODE_029044
	JMP.w CODE_00F7F4

CODE_00F878:
	STZ.w $0D50,x
	STZ.w $0DDA,x
	JMP.w CODE_00F7F4

CODE_00F881:
	LDA.w $0F78,x
	CMP.w #$000A
	BNE.b CODE_00F88C
	JMP.w CODE_00E0D2

CODE_00F88C:
	CMP.w #$0020
	BNE.b CODE_00F894
	JMP.w CODE_00AC88

CODE_00F894:
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	LDA.w #$000B
	STA.w $0DDA,x
	JMP.w CODE_00F7F4

CODE_00F8A6:
	LDA.w $0A9E,x
	BIT.w #$0004
	BNE.b CODE_00F8B7
	LDA.w $0762,x
	CLC
	ADC.w #$0010
	BRA.b CODE_00F8BE

CODE_00F8B7:
	LDA.w $0762,x
	SEC
	SBC.w #$0010
CODE_00F8BE:
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$000F
	STA.b $96
	JSR.w CODE_00B228
	RTS

CODE_00F8CD:
	LDA.w $0A9E,x
	AND.w #$BFFB
	STA.w $0A9E,x
	RTS

CODE_00F8D7:
	LDA.w $0A9E,x
	ORA.w #$4004
	STA.w $0A9E,x
	RTS

CODE_00F8E1:
	PHP
	REP.b #$30
	LDA.w $14F0
	BNE.b CODE_00F8EC
	JMP.w CODE_00F930

CODE_00F8EC:
	BIT.w $1598
	BMI.b CODE_00F934
	LDA.b $0E
	ASL
	ASL
	AND.w #$0018
	TAY
	SEP.b #$20
	LDA.b #$EA
	STA.w $2121
	LDA.w DATA_01D1D0,y
	STA.w $2122
	LDA.w DATA_01D1D0+$01,y
	STA.w $2122
	LDA.w DATA_01D1D0+$02,y
	STA.w $2122
	LDA.w DATA_01D1D0+$03,y
	STA.w $2122
	LDA.w DATA_01D1D0+$04,y
	STA.w $2122
	LDA.w DATA_01D1D0+$05,y
	STA.w $2122
	LDA.w DATA_01D1D0+$06,y
	STA.w $2122
	LDA.w DATA_01D1D0+$07,y
	STA.w $2122
CODE_00F930:
	PLP
	RTS

CODE_00F932:
	REP.b #$30
CODE_00F934:
	SEP.b #$30
	LDA.b #$A0
	STA.w $2121
	LDY.b #$00
CODE_00F93D:
	LDA.w DATA_01FD4A,y
	STA.w $2122
	INY
	CPY.b #$20
	BNE.b CODE_00F93D
	BRA.b CODE_00F930

CODE_00F94A:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00F955
	JSR.w CODE_00B31B
CODE_00F955:
	JSR.w CODE_00F3D4
	LDA.w $0F78,x
	BIT.w #$001F
	BNE.b CODE_00F96E
	BIT.w #$007F
	BNE.b CODE_00F968
	JSR.w CODE_00F9A3
CODE_00F968:
	JSR.w CODE_0097C9
	JSR.w CODE_0097D3
CODE_00F96E:
	LDA.w $0762,x
	CLC
	ADC.w #$0018
	STA.b $94
	LDA.w $0A9E,x
	AND.w #$4000
	BEQ.b CODE_00F988
	LDA.w $0762,x
	SEC
	SBC.w #$0018
	STA.b $94
CODE_00F988:
	LDA.w $07EC,x
	INC
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0001
	BNE.b CODE_00F99F
	LDA.w $0A9E,x
	EOR.w #$4004
	STA.w $0A9E,x
CODE_00F99F:
	JSR.w CODE_0097B0
	RTS

CODE_00F9A3:
	LDA.w #$3102
	JSL.l CODE_028B1F
	RTS

CODE_00F9AB:
	JSR.w CODE_0097BA
	JSR.w CODE_0097BF
	JSR.w CODE_00DC5E
	RTS

CODE_00F9B5:
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BNE.b CODE_00F9C5
	LDA.w #$1401
	STA.b $70
	LDA.w #DATA_019862
	JSR.w CODE_009616
CODE_00F9C5:
	RTS

CODE_00F9C6:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00F9D1
	JSR.w CODE_00B31B
CODE_00F9D1:
	LDA.w $1002,x
	BIT.w #$007F
	BNE.b CODE_00F9DC
	JSR.w CODE_00FA02
CODE_00F9DC:
	LDA.w $0F78,x
	AND.w #$000F
	BNE.b CODE_00F9FB
	JSR.w CODE_00F8A6
	JSR.w CODE_00B236
	ORA.w #$0000
	BEQ.b CODE_00F9FB
	LDA.w $0A9E,x
	EOR.w #$0004
	STA.w $0A9E,x
	JSR.w CODE_0097D3
CODE_00F9FB:
	JSR.w CODE_0097B0
	JSR.w CODE_00F3D4
	RTS

CODE_00FA02:
	LDA.w $07EC,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCS.b CODE_00FA23
	STA.b $6C
	LDA.w $0762,x
	STA.b $68
	JSR.w CODE_00A3BA
	BCS.b CODE_00FA23
	LDA.w #DATA_01988A
	JSR.w CODE_009616
	LDA.w #$3102
	JSL.l CODE_028B1F
CODE_00FA23:
	RTS

CODE_00FA24:
	LDA.w $1598
	BEQ.b CODE_00FA35
	STZ.w $0C3C
	JSR.w CODE_00FA54
	JSR.w CODE_00FB29
	JSR.w CODE_00FA36
CODE_00FA35:
	RTS

CODE_00FA36:
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01B51A,y
	STA.w $05C4,x
	LDA.w DATA_01B526,y
	STA.w $064E,x
	LDA.w DATA_01B532,y
	STA.w $06D8,x
	LDA.w DATA_01B53E,y
	STA.w $0876,x
	RTS

CODE_00FA54:
	LDA.w $1506
	BNE.b CODE_00FA35
	LDA.w $0D50,x
	BNE.b CODE_00FA61
	JMP.w CODE_00FAEA

CODE_00FA61:
	CMP.w #$0001
	BEQ.b CODE_00FA9C
	LDA.w #$0015
	STA.w $0F78,x
	DEC.w $0CC6,x
	BPL.b CODE_00FA88
	INC.w $0DDA,x
	LDA.w $0DDA,x
	CMP.w #$0006
	BEQ.b CODE_00FA89
	LDA.w #$0007
	STA.w $0CC6,x
	LDA.w #$1F00
	STA.w $0C3C,x
CODE_00FA88:
	RTS

CODE_00FA89:
	LDA.w #$0028
	STA.w $0CC6,x
	STZ.w $0D50,x
	STZ.w $0DDA,x
	LDA.w #$1000
	STA.w $0C3C,x
	RTS

CODE_00FA9C:
	LDA.w #$0001
	STA.w $0DDA,x
	LDA.w $0762,x
	CMP.w #$0460
	BEQ.b CODE_00FAAC
	BCS.b CODE_00FAD4
CODE_00FAAC:
	CMP.w #$0322
	BCC.b CODE_00FADF
CODE_00FAB1:
	JSR.w CODE_00FB7C
	BEQ.b CODE_00FAD3
	STZ.w $0D50,x
	LDA.w #$0032
	STA.w $0CC6,x
	LDA.w $07EC,x
	AND.w #$FFF0
	SEC
	SBC.w #$0002
	STA.w $07EC,x
	LDA.w #$1602
	JSL.l CODE_028B1F
CODE_00FAD3:
	RTS

CODE_00FAD4:
	LDA.w $0A9E,x
	ORA.w #$4004
	STA.w $0A9E,x
	BRA.b CODE_00FAB1

CODE_00FADF:
	LDA.w $0A9E,x
	AND.w #$BFFB
	STA.w $0A9E,x
	BRA.b CODE_00FAB1

CODE_00FAEA:
	STZ.w $0DDA,x
	DEC.w $0CC6,x
	BPL.b CODE_00FB22
	LDA.w #$0008
	STA.w $0CC6,x
	JSR.w CODE_00F42A
	CMP.w #$0040
	BEQ.b CODE_00FB02
	BCS.b CODE_00FB10
CODE_00FB02:
	LDA.b $06
	AND.w #$0003
	BEQ.b CODE_00FB10
	LDA.w #$0002
	STA.w $0D50,x
	RTS

CODE_00FB10:
	LDA.b $09
	AND.w #$0006
	TAY
	LDA.w DATA_01B54A,y
	STA.w $0A14,x
	LDA.w #$0001
	STA.w $0D50,x
CODE_00FB22:
	JSR.w CODE_0097C4
	JSR.w CODE_0097D3
	RTS

CODE_00FB29:
	LDA.w $0F78,x
	CMP.w #$0014
	BCC.b CODE_00FB3F
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	BIT.w #$0100
	BNE.b CODE_00FB40
CODE_00FB3F:
	RTS

CODE_00FB40:
	DEC.w $1526
	INC.w $1506
	LDA.w $1506
	AND.w #$001F
	BNE.b CODE_00FB7B
	JSL.l CODE_0299C0
	AND.w #$001F
	SEC
	SBC.w #$000F
	CLC
	ADC.w $0762,x
	STA.b $68
	LDA.b $08
	AND.w #$001F
	SEC
	SBC.w #$000F
	CLC
	ADC.w $07EC,x
	STA.b $6C
	LDA.w #DATA_0184B0
	JSR.w CODE_009616
	LDA.w #$0D02
	JSL.l CODE_028B1F
CODE_00FB7B:
	RTS

CODE_00FB7C:
	JSR.w CODE_00DC0A
	LDA.w $0A14,x
	BPL.b CODE_00FB87
	JMP.w CODE_00FB98

CODE_00FB87:
	LDA.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	STA.b $96
	JSR.w CODE_00B228
	AND.w #$0001
	RTS

CODE_00FB98:
	LDA.w #$0000
	RTS

CODE_00FB9C:
	LDA.w $0F78,x
	LSR
	BCS.b CODE_00FBC0
	CMP.w #$0006
	BCS.b CODE_00FBB8
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #DATA_0199A2
	JSR.w CODE_009616
	RTS

CODE_00FBB8:
	CMP.w #$001E
	BCC.b CODE_00FBC0
	STZ.w $0F78,x
CODE_00FBC0:
	RTS

CODE_00FBC1:
	JSR.w CODE_00FC0E
	BCS.b CODE_00FC04
	JSR.w CODE_00F3D4
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00FBED
	JSR.w CODE_00FB7C
	BEQ.b CODE_00FBEC
	STZ.w $0CC6,x
	LDA.w $07EC,x
	AND.w #$FFF0
	DEC
	STA.w $07EC,x
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
CODE_00FBEC:
	RTS

CODE_00FBED:
	LDA.w $05C4,x
	CMP.w #DATA_019B0A
	BEQ.b CODE_00FC01
	CMP.w #DATA_01B578
	BEQ.b CODE_00FC00
	LDA.w #$0002
	STA.w $064E,x
CODE_00FC00:
	RTS

CODE_00FC01:
	JMP.w CODE_00AC88

CODE_00FC04:
	LDA.w $0A9E,x
	AND.w #$FEFF
	STA.w $0A9E,x
	RTS

CODE_00FC0E:
	LDA.w $0A9E,x
	BIT.w #$0020
	BEQ.b CODE_00FC24
	LDA.w #$000C
	STA.w $0426,x
	LDA.w #DATA_019C68
	STA.w $05C4,x
	SEC
	RTS

CODE_00FC24:
	CLC
	RTS

CODE_00FC26:
	STX.w $15A4
	STZ.w $0C3C
	JSR.w CODE_00FD59
	LDA.w $1506
	BEQ.b CODE_00FC37
	JMP.w CODE_00FD28

CODE_00FC37:
	JSR.w CODE_00FD48
	JSR.w CODE_00FD8A
	LDA.w $0A9E,x
	BIT.w #$0002
	BEQ.b CODE_00FC48
	JMP.w CODE_00FD29

CODE_00FC48:
	LDA.w #$0101
	STA.w $098A,x
	LDA.w $0F78,x
	CMP.w #$008C
	BEQ.b CODE_00FC58
	BCS.b CODE_00FC5E
CODE_00FC58:
	LDA.w #$0001
	STA.w $098A,x
CODE_00FC5E:
	JSR.w CODE_0097B0
	JSR.w CODE_00F3D4
	LDA.w $0762,x
	CLC
	ADC.w #$0020
	STA.b $94
	LDA.w $07EC,x
	INC
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0001
	BNE.b CODE_00FCB0
	LDA.w $0762,x
	CLC
	ADC.w #$0020
	STA.b $94
	LDA.b $96
	CLC
	ADC.w #$0010
	STA.b $96
	JSR.w CODE_00B228
	BIT.w #$0001
	BEQ.b CODE_00FC99
	LDA.w #$0400
	BRA.b CODE_00FC9C

CODE_00FC99:
	LDA.w #$FA00
CODE_00FC9C:
	STA.w $0A14,x
	LDA.w #DATA_01B5C6
	STA.w $05C4,x
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
	BRA.b CODE_00FD28

CODE_00FCB0:
	LDA.w $0762,x
	CLC
	ADC.w #$0020
	STA.b $94
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0004
	STA.b $96
	STA.b $6C
	JSR.w CODE_00B228
	BIT.w #$0002
	BEQ.b CODE_00FD28
	BIT.w #$0080
	BEQ.b CODE_00FCF1
	LDA.w #$0000
	STA.b [$8C]
	LDA.w #DATA_0184B0
	JSR.w CODE_009616
	LDA.w #$0D02
	JSL.l CODE_028B1F
	LDA.w $0762,x
	SEC
	SBC.w #$0010
	STA.w $0762,x
	BRA.b CODE_00FD28

CODE_00FCF1:
	LDA.w $0762,x
	SEC
	SBC.w #$0006
	STA.w $0762,x
	LDA.b $8C
	PHA
	SEC
	SBC.w #$0BB8
	STA.b $8C
	LDY.w #$07D0
	LDA.b [$8C],y
	AND.w #$03FF
	BEQ.b CODE_00FD1D
	LDA.w #$08E0
	STA.b [$8C]
	LDA.w #$0000
	STA.b [$8C],y
	LDY.w #$03E8
	STA.b [$8C],y
CODE_00FD1D:
	PLA
	STA.b $8C
	LDA.w #$0000
	STA.b [$8C]
	JSR.w CODE_00E0E9
CODE_00FD28:
	RTS

CODE_00FD29:
	LDA.w #$0002
	STA.w $098A,x
	JSR.w CODE_00FB7C
	BEQ.b CODE_00FD47
	LDA.w $07EC,x
	AND.w #$FFF0
	DEC
	STA.w $07EC,x
	LDA.w $0A9E,x
	AND.w #$FFFD
	STA.w $0A9E,x
CODE_00FD47:
	RTS

CODE_00FD48:
	LDA.w $0762,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BCC.b CODE_00FD28
	LDA.w #$00AC
	STA.w $0426,x
	JMP.w CODE_00A680

CODE_00FD59:
	LDA.w $0F78,x
	CMP.w #$001E
	BCC.b CODE_00FD28
	LDA.w $0A9E,x
	BIT.w #$0100
	BNE.b CODE_00FD75
	BIT.w #$0020
	BEQ.b CODE_00FD89
	AND.w #$FFDF
	STA.w $0A9E,x
	RTS

CODE_00FD75:
	LDA.w $159C
	INC
	BEQ.b CODE_00FD7E
	JMP.w CODE_00FB40

CODE_00FD7E:
	AND.w #$FEDF
	STA.w $0A9E,x
	BRK.b #$00							; Glitch: Random BRK in the middle of this code.
	STZ.w $0B28,x
CODE_00FD89:
	RTS

CODE_00FD8A:
	LDA.w $0762,x
	CMP.w #$1750
	BCC.b CODE_00FD89
	DEC.w $159C
	RTS

CODE_00FD96:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00FDBC
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	CMP.w $07EC,x
	BCS.b CODE_00FDBB
	LDA.w #$FA00
	STA.w $0A14,x
	LDA.w #DATA_01B5C6
	STA.w $05C4,x
	LDA.w $0A9E,x
	ORA.w #$0002
	STA.w $0A9E,x
CODE_00FDBB:
	RTS

CODE_00FDBC:
	STZ.w $098A,x
	JSR.w CODE_00FB7C
	BEQ.b CODE_00FDBB
	LDA.w $07EC,x
	AND.w #$FFF0
	DEC
	STA.w $07EC,x
	LDA.w $0A9E,x
	AND.w #$FFFD
	STA.w $0A9E,x
CODE_00FDD7:
	RTS

CODE_00FDD8:
	LDA.w $0A9E,x
	BIT.w #$0002
	BNE.b CODE_00FE23
	BIT.w #$0020
	BNE.b CODE_00FDE8
	JMP.w CODE_00FDD7

CODE_00FDE8:
	LDA.w $07EC,x
	SEC
	SBC.w #$0010
	STA.b $8C
	LDA.w $15A6
	SEC
	SBC.w #$0010
	CMP.b $8C
	BCC.b CODE_00FE01
	BEQ.b CODE_00FE01
	JMP.w CODE_00FEA3

CODE_00FE01:
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	LDY.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BEQ.b CODE_00FDD7
	AND.w #$E7DF
	ORA.w #$2002
	STA.w $0A9E,x
	STZ.w $1002,x
	LDA.w $0BB2,x
	STA.w $1550
	BRA.b CODE_00FEA2

CODE_00FE23:
	LDA.w $1002,x
	CMP.w $0DDA,x
	BCC.b CODE_00FEA2
	LDA.w $098A,x
	BMI.b CODE_00FE4B
	JSR.w CODE_00FB7C
	BEQ.b CODE_00FE4B
	LDA.w #$FFFF
	STA.w $098A,x
	LDA.w $0C3C,x
	LSR
	LSR
	LSR
	STA.w $0C3C,x
	LDA.w #$0A02
	JSL.l CODE_028B1F
CODE_00FE4B:
	LDA.w #$0040
	STA.b $64
	LDA.w #$0120
	STA.b $66
	LDA.w #$0004
	STA.b $68
	LDA.w #$0004
	STA.b $6C
	JSR.w CODE_00AB43
	BCC.b CODE_00FEA2
	LDA.w $0426,y
	CMP.w #!Define_SXAR_SpriteID_Juggernaut
	BNE.b CODE_00FEA2
	LDA.w $0B28,y
	SEC
	SBC.w $0C3C,x
	BCC.b CODE_00FE7A
	CMP.w #$0200
	BCS.b CODE_00FE83
CODE_00FE7A:
	LDA.w $0B28,y
	SEC
	SBC.w #$0200
	BRA.b CODE_00FE86

CODE_00FE83:
	LDA.w $0C3C,x
CODE_00FE86:
	JSR.w CODE_00ABD4
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	JSR.w CODE_00E0E9
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JMP.w CODE_00AC88

CODE_00FEA2:
	RTS

CODE_00FEA3:
	LDA.w $0A9E,x
	AND.w #$FFDF
	STA.w $0A9E,x
	RTS

CODE_00FEAD:
	LDA.w $0A9E,x
	BIT.w #$0020
	BNE.b CODE_00FEE5
	JSR.w CODE_00F3D4
	LDA.w $0DDA,x
	BNE.b CODE_00FEE4
	LDA.w $0CC6,x
	CMP.w #$0011
	BNE.b CODE_00FEE4
	LDA.w $0762,x
	CLC
	ADC.w #$0006
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$0006
	STA.b $6C
	LDA.w #DATA_019A92
	JSR.w CODE_009616
	LDA.w #$3102
	JSL.l CODE_028B1F
CODE_00FEE4:
	RTS

CODE_00FEE5:
	LDA.w $0BB2,x
	STA.w $154F
	JSR.w CODE_00E0D2
	LDA.w $0A9E,x
	ORA.w #$0100
	STA.w $0A9E,x
	JMP.w CODE_00AC88

CODE_00FEFA:
	LDA.w $15A8
	BEQ.b CODE_00FF02
	DEC.w $15A8
CODE_00FF02:
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BNE.b CODE_00FF29
	LDA.w !RAM_SXAR_Wolverine_SelfHealingCounterLo
	CMP.w #$000A
	BEQ.b CODE_00FF29
	LDA.w !RAM_SXAR_Wolverine_SelfHealingFrameCounterLo
	INC.w !RAM_SXAR_Wolverine_SelfHealingFrameCounterLo
	AND.w #$00FF
	BNE.b CODE_00FF29
	LDA.w $0B28
	CLC
	ADC.w #$0800
	BMI.b CODE_00FF29
	INC.w !RAM_SXAR_Wolverine_SelfHealingCounterLo
	STA.w $0B28
CODE_00FF29:
	RTS

	%InsertGarbageData($00FF2A, incbin, DATA_00FF2A.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank01Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

MainDataBank01:

DATA_018000:
	dw $0000,$0000,$0000,DATA_019B0A,$0001,$0001,$0000,$0000,$0020,$0030,$0002,$0000,$0000,$FFFF,$0000,$0000,$0004,$0000,$0000,$0000
	dw $0000,$0000,$0000,DATA_019B3A,$0001,$0001,$0000,$0000,$0020,$0030,$0002,$0000,$0000,$FFFF,$0000,$0000,$0004,$0000,$0000,$0000

DATA_018050:
	dw $0001,$0040,$0040,DATA_019CA0,$0002,$0003,$0080,$008F,$0028,$0010,$0002,$0000,$0001,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_018078:
	dw $0002,$0040,$0040,DATA_019CA0,$0002,$0003,$004C,$06FF,$0020,$0010,$0002,$0000,$0001,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_0180A0:
	dw $0005,$0040,$0040,DATA_019D5A,$0004,$0002,$0218,$067C,$0040,$001C,$0002,$0000,$0001,$FFFF,$7FFF,$0000,$0400,$0000,$0000,$0000

DATA_0180C8:
	dw $0100,$0040,$0098,DATA_019B8A,$0008,$0002,$0018,$001E,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_0180F0:
	dw $0100,$00A0,$00A0,DATA_019BAA,$0003,$0003,$0018,$001E,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018118:
	dw $0100,$0100,$0078,DATA_019BE0,$0010,$0004,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018140:
	dw $0100,$0020,$0078,DATA_01B28A,$000D,$0004,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018168:
	dw $0100,$0010,$0018,DATA_01B2F2,$0005,$0001,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000
	dw $0100,$0010,$00B8,DATA_01AA18,$0002,$0002,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$FFFF,$0000,$0000

DATA_0181B8:
	dw $0100,$0010,$00B8,DATA_01AA20,$0001,$0001,$0018,$0002,$0005,$0005,$0003,$0000,$0083,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_0181E0:
	dw $0100,$0018,$0028,DATA_01AA26,$0006,$0012,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018208:
	dw $0100,$0018,$0028,DATA_01ABD6,$0006,$0012,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018230:
	dw $0100,$0018,$0028,DATA_01AAFE,$0006,$0012,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018258:
	dw $0100,$0018,$0028,DATA_01ACAE,$0006,$0012,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_018280:
	dw $0100,$0018,$0028,DATA_01AD86,$0006,$0012,$0018,$0002,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_0182A8:
	dw $000B,$0000,$0000,$0000,$0001,$0001,$0000,$0000,$0018,$0010,$0002,$0000,$0000,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_0182D0:
	dw $0010,$0000,$0000,DATA_019CA0,$0001,$0001,$0000,$0000,$0010,$0010,$0010,$0000,$0000,$FFFF,$0000,$0000,$0100,$0000,$0000,$0000

DATA_0182F8:
	dw $000F,$0000,$0000,DATA_01A1DE,$0001,$0001,$0000,$0000,$0020,$0014,$0001,$0100,$1401,$0000,$7FFF,$0000,$1000,$0000,$0000,$0000
	dw $001C,$0180,$00E0,DATA_019CB8,$0001,$0001,$0000,$0000,$0008,$0008,$0000,$0000,$0001,$FFFF,$0000,$0002,$0800,$0000,$0000,$0000

DATA_018348:
	dw $001D,$0180,$00E0,DATA_019CBA,$0001,$0001,$0000,$0000,$0008,$0008,$0000,$0000,$0001,$FFFF,$0000,$0002,$0800,$0000,$0000,$0000

DATA_018370:
	dw $001E,$0180,$00E0,DATA_019CBA,$0001,$0002,$0000,$0000,$0008,$0010,$0000,$0000,$0001,$FFFF,$0000,$0002,$0800,$0000,$0000,$0000

DATA_018398:
	dw $001F,$0180,$00E0,DATA_019CC2,$0002,$0002,$0000,$0000,$0010,$0010,$0000,$0000,$0001,$FFFF,$0000,$0002,$0800,$0000,$0000,$0000

DATA_0183C0:
	dw $0020,$0180,$00E0,DATA_019CCA,$0002,$0002,$0000,$0000,$0010,$0010,$0000,$FFFF,$0001,$FFFF,$0000,$0002,$0800,$0000,$0000,$0000

DATA_0183E8:
	dw $0021,$0180,$00E0,DATA_019CD2,$0002,$0002,$0000,$0000,$0010,$0010,$0000,$FFFF,$0001,$FFFF,$0000,$0002,$0800,$0000,$0000,$0000

DATA_018410:
	dw $0022,$0020,$0000,DATA_019CDA,$0002,$0002,$0000,$0000,$0030,$0020,$0001,$FFFF,$1801,$FFFF,$0999,$0002,$0400,$0000,$0000,$0000

DATA_018438:
	dw $001C,$0148,$00F0,DATA_019CB8,$0001,$0001,$0000,$0000,$0008,$0008,$0000,$0000,$0001,$0000,$0000,$0002,$0800,$0020,$000A,$0000

DATA_018460:
	dw $001C,$0148,$00F0,DATA_019CB8,$0001,$0001,$0000,$0000,$0008,$0008,$0000,$0000,$0001,$0000,$0000,$0002,$0800,$0060,$000B,$0000

DATA_018488:
	dw $001C,$0148,$00F0,DATA_019CB8,$0001,$0001,$0000,$0000,$0008,$0008,$0000,$0000,$0001,$0000,$0000,$0002,$0800,$00A0,$000C,$0000

DATA_0184B0:
	dw $000E,$0148,$003F,DATA_019F64,$0004,$0004,$0000,$0000,$0040,$0040,$0000,$0000,$1001,$FFFF,$0000,$0000,$2000,$00F0,$000D,$0000

DATA_0184D8:
	dw $001B,$0180,$00E0,DATA_019FA4,$0002,$0002,$0000,$0000,$0020,$0020,$0000,$0000,$1001,$FFFF,$0000,$0000,$0100,$00F0,$000D,$0000

DATA_018500:
	dw $0023,$0148,$009F,DATA_019E0A,$0002,$0002,$0000,$0000,$0020,$0020,$0107,$0001,$1801,$0000,$0500,$0004,$0400,$0000,$0000,$0000

DATA_018528:
	dw $0024,$0148,$009F,DATA_019E76,$0002,$0002,$0000,$0000,$0020,$0020,$0103,$0001,$1801,$0000,$0200,$0003,$0800,$0000,$0000,$0004

DATA_018550:
	dw $0025,$0148,$009F,DATA_019EE2,$0002,$0002,$0000,$0000,$0020,$0020,$0100,$0001,$1801,$0000,$0200,$0002,$0600,$0000,$0000,$0008

DATA_018578:
	dw $0027,$0040,$00F0,DATA_019FE4,$0002,$0002,$0000,$0000,$0040,$0010,$0101,$0000,$2001,$FFFF,$0000,$0000,$0400,$0000,$0000,$000C

DATA_0185A0:
	dw $0028,$0148,$003F,DATA_01A004,$0001,$0001,$0000,$0000,$0008,$0008,$0101,$0000,$1800,$FFFF,$0000,$0000,$1000,$0000,$0000,$000C

DATA_0185C8:
	dw $0026,$0188,$00F0,DATA_01A038,$0001,$0001,$0000,$0000,$0008,$0008,$0101,$0000,$0101,$FFFF,$0000,$0000,$1000,$0000,$0000,$0000

DATA_0185F0:
	dw $0012,$0188,$00F0,DATA_01A0FA,$0002,$0002,$0000,$0000,$0020,$0030,$0101,$0100,$1801,$0000,$4000,$0190,$7FFF,$0000,$0000,$0000

DATA_018618:
	dw $0033,$0188,$00F0,DATA_01A13A,$0003,$0002,$0000,$0000,$0028,$0018,$0001,$FFFF,$1801,$0000,$0800,$0100,$1000,$0000,$0000,$0000

DATA_018640:
	dw $0034,$0188,$00F0,DATA_01A11A,$0001,$0001,$0000,$0000,$0038,$0020,$0001,$0100,$1409,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_018668:
	dw $0035,$0188,$00F0,DATA_019B0A,$0001,$0001,$0000,$0000,$0008,$0008,$0101,$0000,$0002,$0000,$0000,$0000,$0000,$0000,$0000,$0000

UNK_018690:
	dw $7FFF

DATA_018692:
	dw $0036,$0188,$00F0,DATA_01A18A,$0004,$0001,$0000,$0000,$0020,$0008,$0101,$0000,$0002,$FFFF,$0000,$0000,$1000,$0000,$0000,$0000

DATA_0186BA:
	dw $0029,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$0000,$0002

DATA_0186E2:
	dw $002A,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$0002,$0004

DATA_01870A:
	dw $002B,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$0004,$0006

DATA_018732:
	dw $002C,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$0006,$0008

DATA_01875A:
	dw $002D,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$0008,$000A

DATA_018782:
	dw $002E,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$000A,$000C

DATA_0187AA:
	dw $002F,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$000C,$000E

DATA_0187D2:
	dw $0030,$0188,$00F0,DATA_01A13A,$0002,$0002,$0000,$0000,$0010,$0010,$0101,$0000,$0801,$0000,$1000,$0200,$0000,$0000,$000E,$0010

DATA_0187FA:
	dw $0037,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$0010,$0016

DATA_018822:
	dw $0038,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$0012,$0018

DATA_01884A:
	dw $0039,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$0014,$001A

DATA_018872:
	dw $003A,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$005A,$0000,$0016,$001C

DATA_01889A:
	dw $003B,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$009A,$0000,$0018,$001E

DATA_0188C2:
	dw $003C,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$001A,$0020

DATA_0188EA:
	dw $003D,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$007A,$0000,$001C,$0022

DATA_018912:
	dw $003E,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$001E,$0024

DATA_01893A:
	dw $003F,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$0114,$0000,$0020,$0026

DATA_018962:
	dw $0040,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$00DF,$0000,$0022,$0028

DATA_01898A:
	dw $0041,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$0024,$002A

DATA_0189B2:
	dw $0042,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$0052,$0000,$0026,$002C

DATA_0189DA:
	dw $0043,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$006A,$0000,$0028,$002E

DATA_018A02:
	dw $0044,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$0042,$0000,$002A,$0030

DATA_018A2A:
	dw $0045,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$0052,$0000,$002C,$0032

DATA_018A52:
	dw $0046,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0400,$0009,$0052,$0000,$002E,$0034

DATA_018A7A:
	dw $0047,$0188,$00F0,DATA_01A1BE,$0004,$0001,$0000,$0000,$0040,$0010,$0107,$0100,$1801,$0000,$0500,$0305,$1000,$0000,$0000,$0000

DATA_018AA2:
	dw $0048,$0188,$00F0,DATA_01A1CE,$0002,$0001,$0000,$0000,$001C,$0018,$0101,$0100,$0000,$FFFF,$0000,$0010,$1000,$0000,$003F,$0000

DATA_018ACA:
	dw $0049,$0188,$00F0,DATA_019F5C,$0002,$0002,$0000,$0000,$0010,$0010,$0100,$0100,$1001,$FFFF,$0000,$0010,$1000,$0000,$0000,$0000

DATA_018AF2:
	dw $004A,$0188,$00F0,DATA_01A1D6,$0002,$0001,$0000,$0000,$0018,$0008,$0100,$0100,$0002,$FFFF,$0000,$0005,$1000,$0000,$0000,$0000

DATA_018B1A:
	dw $004C,$0188,$00F0,DATA_01A234,$0002,$0001,$0000,$0000,$0018,$0008,$0100,$0100,$0000,$FFFF,$0000,$0001,$1000,$0000,$0000,$0000

DATA_018B42:
	dw $0090,$0188,$00F0,DATA_01A16A,$0002,$0001,$0000,$0000,$0018,$0008,$0100,$0100,$0000,$FFFF,$0000,$0001,$1000,$0000,$0000,$0000

DATA_018B6A:
	dw $004B,$0040,$00F0,DATA_01A1E4,$0002,$0002,$0000,$0000,$0020,$0020,$0101,$0000,$2001,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$000C

DATA_018B92:
	dw $004D,$0188,$00F0,DATA_01A1E0,$0001,$0001,$0000,$0000,$0020,$0014,$0001,$0100,$1401,$0000,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_018BBA:
	dw $004E,$0188,$00F0,DATA_01A1E0,$0001,$0001,$0000,$0000,$0020,$0024,$0001,$0100,$1801,$0000,$2800,$0500,$1000,$0000,$0000,$0000

DATA_018BE2:
	dw $0051,$0188,$00F0,DATA_01A1E0,$0001,$0001,$0000,$0000,$0020,$0024,$0001,$0100,$5801,$0000,$2800,$0500,$1000,$0000,$0000,$0000

DATA_018C0A:
	dw $004F,$0188,$00F0,DATA_01A1E2,$0001,$0001,$0000,$0000,$0005,$0005,$0001,$0100,$1001,$FFFF,$F000,$0000,$1800,$0000,$0000,$0000

DATA_018C32:
	dw $0050,$0188,$00F0,DATA_019B0A,$0001,$0001,$0000,$0000,$0020,$0024,$0001,$0100,$1800,$0000,$2000,$0500,$1000,$0000,$0000,$0000

DATA_018C5A:
	dw $0052,$0188,$00F0,DATA_01A274,$0004,$0004,$0000,$0000,$0040,$0020,$0001,$0100,$1801,$0000,$0600,$0200,$1000,$0000,$0000,$0000

DATA_018C82:
	dw $0053,$0188,$00F0,DATA_01A294,$0001,$0001,$0000,$0000,$0020,$0020,$0001,$0100,$1801,$FFFF,$F000,$0000,$1800,$0000,$0000,$0000

DATA_018CAA:
	dw $000C,$0188,$00F0,DATA_019C68,$0001,$0001,$0000,$0000,$0020,$0020,$0001,$0100,$0101,$FFFF,$7FFF,$0010,$1000,$0000,$0000,$0000

DATA_018CD2:
	dw $0054,$0188,$00F0,DATA_01A298,$0001,$0001,$0000,$0000,$0010,$0002,$0001,$0100,$0000,$FFFF,$F000,$0000,$1800,$0000,$0000,$0000

DATA_018CFA:
	dw $0055,$0188,$00F0,DATA_01A2A4,$0001,$0001,$0000,$0000,$0020,$0020,$0001,$0100,$2001,$FFFF,$F000,$0000,$1800,$0000,$0000,$0000

DATA_018D22:
	dw $000D,$0188,$00F0,DATA_01A2AC,$0002,$0003,$0000,$0000,$0010,$002E,$0001,$0100,$1801,$0000,$2600,$0006,$2000,$0000,$0000,$0000

DATA_018D4A:
	dw $000A,$0188,$00F0,DATA_01A30C,$0001,$0001,$0000,$0000,$0009,$0008,$0001,$0100,$0000,$FFFF,$F000,$0000,$1400,$0000,$0000,$0000

DATA_018D72:
	dw $0011,$0188,$00F0,DATA_01A2F4,$0002,$0003,$0000,$0000,$0020,$0024,$0001,$0000,$1801,$0000,$0600,$0003,$2000,$0032,$0000,$0000

DATA_018D9A:
	dw $0056,$0188,$00F0,DATA_01A314,$0001,$0001,$0000,$0000,$0008,$0008,$0002,$F800,$0000,$FFFF,$F000,$0000,$0000,$0000,$0000,$0000

DATA_018DC2:
	dw $0013,$0188,$00F0,DATA_01A31C,$0003,$0003,$0000,$0000,$0002,$0020,$0001,$0100,$0000,$FFFF,$F000,$0000,$1800,$0000,$0000,$0003

DATA_018DEA:
	dw $0014,$0188,$00F0,DATA_01A388,$0003,$0004,$0000,$0000,$0030,$0030,$0001,$0100,$0801,$0000,$9000,$0500,$0000,$0000,$0000,$0000

DATA_018E12:
	dw $0057,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0001,$0000,$1000,$0000,$EE00,$0000,DATA_01FDC2,$0000

DATA_018E3A:
	dw $0058,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$4005,$0000,$1000,$0000,$EE01,$0000,DATA_01FDCE,$0000

DATA_018E62:
	dw $0059,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0001,$0000,$1000,$0000,$EE02,$0000,DATA_01FDF0,$0000

DATA_018E8A:
	dw $005A,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$4005,$0000,$1000,$0000,$EE03,$0000,DATA_01FDFE,$0000

DATA_018EB2:
	dw $005B,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0001,$0000,$1000,$0000,$EE04,$0000,DATA_01FE40,$0000

DATA_018EDA:
	dw $005C,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$4005,$0000,$1000,$0000,$EE05,$0000,DATA_01FE96,$0000

DATA_018F02:
	dw $005D,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0003,$0000,$1000,$0000,$EE03,$0000,DATA_01FE26,$0000

DATA_018F2A:
	dw $005E,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0003,$0000,$1000,$0000,$EE01,$0000,DATA_01FDE2,$0000

DATA_018F52:
	dw $005F,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$4005,$0000,$1000,$0000,$EE05,$0000,DATA_01FEA8,$0000

DATA_018F7A:
	dw $0060,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0001,$0000,$1000,$0000,$EE08,$0000,DATA_01FEBE,$0000

DATA_018FA2:
	dw $0061,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$4005,$0000,$1000,$0000,$EE01,$0000,DATA_01FDD6,$0000

DATA_018FCA:
	dw $0015,$0188,$00F0,DATA_01A428,$0001,$0003,$0000,$0000,$0010,$0040,$0001,$0000,$1800,$0000,$1600,$0001,$1000,$0000,$0000,$0000

DATA_018FF2:
	dw $006F,$0188,$00F0,DATA_01A42E,$0003,$0003,$0000,$0000,$0018,$0018,$0001,$0000,$1800,$0000,$0600,$0100,$2000,$0000,$0000,$0000

DATA_01901A:
	dw $0075,$0188,$00F0,DATA_01A4E2,$0003,$0004,$0000,$0000,$0018,$0018,$0001,$0000,$5800,$FFFF,$0600,$0100,$3000,$0014,$0000,$0000

DATA_019042:
	dw $0062,$0188,$00F0,DATA_01A512,$0001,$0001,$0000,$0000,$0008,$0008,$0001,$0100,$1000,$FFFF,$F000,$0000,$1000,$0000,$0000,$0000

DATA_01906A:
	dw $0063,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$4005,$0000,$1000,$0000,$EE10,$0000,DATA_01FEC6,$0000

DATA_019092:
	dw $0067,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0003,$0000,$1000,$0000,$EE11,$0000,DATA_01FEE2,$0000

DATA_0190BA:
	dw $0069,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0101,$0000,$0001,$0000,$1000,$0000,$EE12,$0000,DATA_01FE6E,$0000

DATA_0190E2:
	dw $0064,$0188,$00F0,DATA_01A31C,$0003,$0003,$0000,$0000,$0002,$0020,$0001,$0100,$0000,$FFFF,$F000,$0000,$1800,$0000,$0000,$0003

DATA_01910A:
	dw $0065,$0188,$00F0,DATA_01A2AC,$0002,$0003,$0000,$0000,$0010,$002E,$0001,$0100,$1801,$FFFF,$2600,$0004,$1000,$0000,$0000,$FEDC

DATA_019132:
	dw $0066,$0188,$00F0,DATA_01A2AC,$0002,$0003,$0000,$0000,$0010,$002E,$0001,$0100,$1801,$FFFF,$2600,$0004,$1000,$0000,$0000,$FEDC

DATA_01915A:
	dw $0068,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0030,$0030,$0101,$0000,$1401,$0000,$1000,$0000,$0000,$0000,$0000,$0000

DATA_019182:
	dw $006B,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0090,$0030,$0101,$0000,$1401,$0000,$1000,$0000,$0000,$0000,$0000,$0000

DATA_0191AA:
	dw $0004,$0188,$00F0,DATA_01A51A,$0002,$0003,$0000,$0000,$0010,$002E,$0001,$0100,$1801,$0000,$5600,$0200,$1000,$0000,$0000,$0000

DATA_0191D2:
	dw $006C,$0188,$00F0,DATA_01A59A,$0001,$0001,$0000,$0000,$0010,$0010,$0203,$FF40,$0000,$FFFF,$F000,$0000,$2000,$0000,$0000,$0000

DATA_0191FA:
	dw $006D,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$002E,$0001,$0100,$0001,$0000,$5600,$0000,$0500,$0022,$0000,$000C

DATA_019222:
	dw $006E,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0203,$FF40,$0000,$FFFF,$F000,$0000,$0530,$0000,$0000,$0000

DATA_01924A:
	dw $0009,$0188,$00F0,DATA_01A62A,$0005,$0005,$0000,$0000,$0020,$0050,$0101,$0100,$1801,$0000,$7FFF,$A000,$4500,$0000,$0000,$0000

DATA_019272:
	dw $0070,$0188,$00F0,DATA_019FC4,$0002,$0002,$0000,$0000,$0008,$0008,$0101,$0000,$0101,$FFFF,$0000,$0000,$1000,$0000,$0000,$0000

DATA_01929A:
	dw $0071,$0188,$00F0,DATA_01A59E,$0001,$0001,$0000,$0000,$0008,$0002,$0203,$FF40,$0000,$FFFF,$F000,$0000,$1000,$0000,$0000,$0000

DATA_0192C2:
	dw $0072,$0188,$00F0,DATA_01A9C2,$0001,$0001,$0000,$0000,$0009,$0008,$0001,$0100,$0002,$FFFF,$F000,$0000,$0500,$0000,$0000,$0000

DATA_0192EA:
	dw $0073,$0000,$0000,DATA_01A9CA,$0001,$0001,$0000,$0000,$0008,$0008,$0001,$0100,$1400,$0000,$7FFF,$0001,$1000,$0000,$0000,$0000

DATA_019312:
	dw $0074,$0188,$00F0,DATA_01A2AC,$0002,$0003,$0000,$0000,$0010,$002E,$0001,$0100,$1801,$0000,$0600,$0004,$1000,$0000,$0000,$0000

DATA_01933A:
	dw $0076,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0020,$0024,$0001,$0100,$1801,$0000,$4800,$0500,$1000,$0000,$0000,$0000

DATA_019362:
	dw $0077,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0020,$0024,$0001,$0100,$1801,$0000,$5800,$0600,$1000,$0000,$0000,$0000

DATA_01938A:
	dw $0078,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0020,$0024,$0001,$0100,$1801,$0000,$7800,$0900,$1000,$0000,$0000,$0000

DATA_0193B2:
	dw $0079,$0188,$00F0,DATA_01A9D2,$0001,$0001,$0000,$0000,$0005,$0008,$0100,$FF00,$1004,$FFFF,$F000,$0000,$0400,$0000,$0000,$0000

DATA_0193DA:
	dw $007A,$0188,$00F0,DATA_01A9D6,$0003,$0001,$0000,$0000,$0018,$0018,$0203,$FF40,$5804,$FFFF,$F000,$0005,$0830,$0000,$0000,$0000

DATA_019402:
	dw $007B,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0020,$0020,$0203,$FF40,$1000,$0000,$7000,$0005,$1000,$0000,$0000,$0000

DATA_01942A:
	dw $007C,$0188,$00F0,DATA_01AA06,$0001,$0001,$0000,$0000,$0009,$0008,$0001,$0100,$1001,$FFFF,$F000,$0000,$0500,$0000,$0000,$0000

DATA_019452:
	dw $007D,$0188,$00F0,DATA_01AA0E,$0001,$0001,$0000,$0000,$0018,$0010,$0001,$0100,$1401,$0000,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_01947A:
	dw $0082,$0188,$00F0,DATA_01A152,$0002,$0003,$0000,$0000,$0020,$0028,$0203,$FF40,$1801,$0000,$0400,$0006,$1000,$0000,$0000,$0000

DATA_0194A2:
	dw $0083,$0188,$00F0,DATA_01AEB0,$0005,$0003,$0000,$0000,$0050,$0030,$0101,$0000,$5805,$0000,$3000,$000A,$5000,$0000,$0000,$0000

DATA_0194CA:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0060,$0040

DATA_0194F2:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0064,$0044

DATA_01951A:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0068,$0048

DATA_019542:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$006C,$004C

DATA_01956A:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0070,$0050

DATA_019592:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0074,$0054

DATA_0195BA:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0078,$0058

DATA_0195E2:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$007C,$005C

DATA_01960A:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0080,$0060

DATA_019632:
	dw $0084,$0188,$00F0,DATA_019B0A,$0002,$0002,$0000,$0000,$0010,$0012,$0101,$0000,$0801,$0000,$0800,$0009,$006A,$0000,$0084,$0064

DATA_01965A:
	dw $008E,$0188,$00F0,DATA_01AEEC,$0001,$0001,$0000,$0000,$0020,$0020,$0100,$FF00,$0000,$FFFF,$0000,$0001,$1000,$0000,$0000,$0000

DATA_019682:
	dw $008F,$0188,$00F0,DATA_019B0A,$0001,$0001,$0000,$0000,$0010,$0012,$0101,$0000,$0041,$0000,$1000,$0009,$006A,$0000,$0000,$0000

DATA_0196AA:
	dw $0091,$0188,$00F0,DATA_01AF0C,$0004,$0002,$0000,$0000,$0040,$0020,$0203,$FF40,$0801,$0000,$0000,$0001,$0000,$0000,DATA_0196D2,$0000

DATA_0196D2:
	dw $0092,$0188,$00F0,DATA_01AF8C,$0001,$0001,$0000,$0000,$0020,$0018,$0001,$FE40,$1401,$FFFF,$0000,$0005,$0000,$0000,$0000,$0000

DATA_0196FA:
	dw $0003,$0188,$00F0,DATA_01B26E,$0002,$0003,$0000,$0000,$0020,$002E,$0100,$0100,$1001,$0000,$0000,$0100,$1000,$0000,$0000,$0000

DATA_019722:
	dw $0093,$0188,$00F0,DATA_01AFA6,$0003,$0003,$0000,$0000,$0020,$0030,$020F,$0100,$1801,$0000,$5600,$0003,$1000,$0000,DATA_01AF94,$0000

DATA_01974A:
	dw $0094,$0188,$00F0,DATA_01B0E8,$0003,$0004,$0000,$0000,$0018,$0030,$0001,$0100,$1801,$0000,$5600,$0004,$1000,$0000,DATA_01B036,$0000

DATA_019772:
	dw $0095,$0188,$00F0,DATA_01B118,$0004,$0002,$0000,$0000,$0044,$0018,$0001,$0100,$1801,$0000,$7777,$0200,$1000,$0000,$0000,$0000

DATA_01979A:
	dw $0096,$0188,$00F0,DATA_01B1D2,$0002,$0003,$0000,$0000,$001C,$0028,$0001,$0100,$1801,$0000,$1000,$0001,$1000,$0000,DATA_01B1A8,$0000

DATA_0197C2:
	dw $0098,$0148,$009F,DATA_019E0A,$0002,$0002,$0000,$0000,$0020,$0020,$0107,$0001,$1801,$FFFF,$0500,$0004,$0400,$0000,$0000,$0000

DATA_0197EA:
	dw $0097,$0188,$00F0,DATA_01AF4C,$0004,$0002,$0000,$0000,$0040,$0020,$0203,$FF40,$0801,$0000,$0000,$0002,$0000,$0000,DATA_0197C2,$0000

DATA_019812:
	dw $0099,$0188,$00F0,DATA_01B202,$0001,$0001,$0000,$0000,$0009,$0008,$0001,$0100,$0002,$FFFF,$F000,$0000,$0500,$0000,$0000,$0000

DATA_01983A:
	dw $009A,$0188,$00F0,DATA_01A30C,$0001,$0001,$0000,$0000,$0009,$0008,$0001,$0100,$0000,$FFFF,$F000,$0000,$0800,$0000,DATA_01B20A,$0000

DATA_019862:
	dw $009B,$0000,$0000,DATA_01B26C,$0001,$0001,$0000,$0000,$0020,$0014,$0001,$0100,$1401,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$0000

DATA_01988A:
	dw $009F,$0188,$00F0,DATA_01B30A,$0001,$0002,$0000,$0000,$0008,$0010,$0002,$0000,$1000,$FFFF,$F000,$0000,$0000,$0000,$0000,$0000

DATA_0198B2:
	dw $00A0,$0188,$00F0,DATA_01B318,$0004,$0002,$0000,$0000,$0030,$0020,$0001,$0100,$1801,$0000,$5600,$0005,$1000,$0000,DATA_01B30E,$0000

DATA_0198DA:
	dw $00A1,$00A0,$0008,DATA_01B438,$0002,$0002,$0018,$001E,$0005,$0005,$0003,$0000,$00C3,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_019902:
	dw $00A2,$0040,$00F0,DATA_01B440,$0002,$0002,$0000,$0000,$0020,$0020,$0101,$0000,$2001,$FFFF,$0000,$0000,$0400,$0000,$0000,$000C

DATA_01992A:
	dw $0100,$00D0,$0078,DATA_01B450,$0001,$0001,$0018,$001E,$0005,$0005,$0003,$0000,$0082,$FFFF,$0000,$0000,$0800,$0000,$0000,$0000

DATA_019952:
	dw $00A4,$0040,$00F0,DATA_01B452,$0001,$0001,$0000,$0000,$0020,$0028,$0101,$0000,$1401,$0000,$0000,$0000,$0400,$0000,$0000,$000C

DATA_01997A:
	dw $0008,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0030,$0030,$0002,$0100,$1801,$0000,$3000,$A000,$1000,$0000,$0000,$0000

DATA_0199A2:
	dw $00A5,$0000,$0000,DATA_01B56C,$0001,$0001,$0000,$0000,$0010,$0010,$0003,$FC00,$1001,$FFFF,$F000,$0000,$0800,$0008,DATA_01B552,$0000

DATA_0199CA:
	dw $00AB,$0188,$00F0,DATA_019B3A,$0001,$0001,$0000,$0000,$0010,$0010,$0000,$0000,$0000,$0000,$0000,$0000,$0800,$0000,$0000,$0000

DATA_0199F2:
	dw $0006,$0188,$00F0,DATA_01B596,$0004,$0003,$0000,$0000,$0030,$0020,$0101,$0000,$1841,$0000,$2000,$0003,$2600,$0000,DATA_01B584,$0000

DATA_019A1A:
	dw $00A6,$0188,$00F0,DATA_01B5F8,$0003,$0002,$0000,$0000,$0030,$0020,$0000,$0000,$0801,$0000,$0000,$0003,$0200,$0000,$0000,$0014

DATA_019A42:
	dw $00A7,$0188,$00F0,DATA_01B604,$0003,$0002,$0000,$0000,$0030,$0020,$0000,$0000,$0801,$0000,$0000,$0005,$0400,$0000,$0000,$000A

DATA_019A6A:
	dw $00A8,$0188,$00F0,DATA_01B622,$0003,$0004,$0000,$0000,$0020,$0020,$0203,$FF00,$1801,$0000,$1000,$0005,$1000,$0000,DATA_01B610,$0000

DATA_019A92:
	dw $00A9,$0188,$00F0,DATA_01B66A,$0002,$0001,$0000,$0000,$0008,$0008,$0001,$0000,$1001,$FFFF,$F000,$0000,$1000,$0000,$0000,$0000

DATA_019ABA:
	dw $00AA,$0180,$00E0,DATA_01B67A,$0002,$0003,$0000,$0000,$0008,$0008,$0000,$0000,$0001,$0000,$0000,$0002,$0800,$0000,$0000,$0000

DATA_019AE2:
	dw $00AD,$0040,$00F0,DATA_01B692,$0002,$0002,$0000,$0000,$0020,$0020,$0101,$0000,$0001,$FFFF,$7FFF,$0000,$1000,$0000,$0000,$000C

DATA_019B0A:
	dw $0088,$0088,$0088,$0088,$0088,$0088,$0088,$0088
	dw $0088,$0088,$0088,$0088,$0088,$0088,$0088,$0088
	dw $0088,$0088,$0088,$0088,$0088,$0088,$0088,$0088

DATA_019B3A:
	dw $0060,$0060,$0060,$0060,$0060,$0060,$0060,$0060
	dw $0060,$0060,$0060,$0060,$0060,$0060,$0060,$0060
	dw $0060,$0060,$0060,$0060,$0060,$0060,$0060,$0060
	dw $0060,$0060,$0060,$0060,$2000,$2002,$2020,$2022
	dw $2040,$2042,$6002,$6000,$6022,$6020,$6042,$6040

DATA_019B8A:
	dw $2260,$2262,$2264,$2266,$2268,$226A,$226C,$226E
	dw $2280,$2282,$2284,$2286,$2288,$228A,$228C,$228E

DATA_019BAA:
	dw $26A0,$26A2,$26A4,$26A6,$26A8,$26AA,$2660,$26AC
	dw $2660

DATA_019BBC:
	dw $24A0,$24A2,$24A4,$24A6,$24A8,$24AA,$2460,$24AC
	dw $2460

DATA_019BCE:
	dw $22A0,$22A2,$22A4,$22A6,$22A8,$22AA,$2260,$22AC
	dw $2260

DATA_019BE0:
	dw $2100,$2102,$2104,$2106,$2108,$210A,$210C,$210E
	dw $2180,$2182,$2184,$2186,$2188,$21E8,$2100,$2100
	dw $2120,$2122,$2124,$2126,$2128,$212A,$212C,$212E
	dw $21A0,$21A2,$21A4,$21A6,$21A8,$2100,$2100,$2100
	dw $2140,$2142,$2144,$2146,$2148,$214A,$214C,$214E
	dw $21C0,$21C2,$21C4,$21C6,$21C8,$2100,$2100,$2100
	dw $2160,$2162,$2164,$2166,$2168,$216A,$216C,$216E
	dw $21E0,$21E2,$21E4,$21E6,$2100,$2100,$2100,$2100
	dw $0060,$0060,$0000,$4000

DATA_019C68:
	dw $2F6E,$6F6E,$AF6E,$EF6E

DATA_019C70:
	dw $2D6E,$2DC4,$2FC4,$2FC4

DATA_019C78:
	dw $2062,$6062

DATA_019C7C:							; Note: Related to Wolverine's extended fists
	dw $2064,$6064

DATA_019C80:
	dw $2066,$6066

DATA_019C84:
	dw $0060,$4060

DATA_019C88:
	dw $2060,$6060

DATA_019C8C:
	dw $2062,$6062,$2060,$6060,$2060,$6060

DATA_019C98:
	dw $246E,$646E

DATA_019C9C:
	dw $2466,$6466

DATA_019CA0:
	dw $2000,$2002,$2020,$2022,$2040,$2042

DATA_019CAC:
	dw $6002,$6000,$6022,$6020,$6042,$6040

DATA_019CB8:
	dw $2488

DATA_019CBA:
	dw $2488,$2488,$2488,$2488

DATA_019CC2:
	dw $246C,$246E,$248C,$248E

DATA_019CCA:
	dw $2464,$2466,$2484,$2486

DATA_019CD2:
	dw $2560,$2562,$2580,$2582

DATA_019CDA:
	dw $2460,$2462,$2480,$2482

DATA_019CE2:
	dw $2460,$2662,$2680,$2682

DATA_019CEA:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0014,$FFFC,$FFF8,$FFFC,$0000,$0000,$0000,$0000
	dw $0034,$0004,$FFF8,$0004

DATA_019D12:
	dw $0004,$0004,$0004,$0004,$0004,$0004,$0004,$0004
	dw $0004,$0002,$0004,$0004

DATA_019D2A:
	dw $0002,$0002,$0002,$0002,$0002,$0002,$0002,$0002
	dw $0002,$0004,$0002,$0002

DATA_019D42:
	dw DATA_019D5A,DATA_019D5A,DATA_019D5A,DATA_019D5A,DATA_019D5A,DATA_019D5A,DATA_019D5A,DATA_019D5A
	dw DATA_019D5A,DATA_019D7A,DATA_019D5A,DATA_019D5A

DATA_019D5A:
	dw $2E00,$2E02,$2E04,$2E06,$2E20,$2E22,$2E24,$2E26
	dw $6E06,$6E04,$6E02,$6E00,$6E26,$6E24,$6E22,$6E20

DATA_019D7A:
	dw $2E00,$2E02,$2E20,$2E22,$2E04,$2E06,$2E24,$2E26
	dw $6E02,$6E00,$6E22,$6E20,$6E06,$6E04,$6E26,$6E24
	dw $0088,$2E00,$2E02,$0088,$2E20,$2E22,$0088,$2E04
	dw $2E06,$2E26,$2E24,$0088,$6E02,$6E00,$0088,$6E22
	dw $6E20,$0088,$6E06,$6E04,$0088,$0088,$6E24,$6E26

DATA_019DCA:
	dw $24A0,$24A2,$24C0,$24C2,$64A2,$64A0,$64C2,$64C0

DATA_019DDA:
	dw $24A4,$24A6,$24C4,$24C6,$64A6,$64A4,$64C6,$64C4

DATA_019DEA:
	dw $24A8,$24AA,$24C8,$24CA,$64AA,$64A8,$64CA,$64C8

DATA_019DFA:
	dw $2500,$2502,$2520,$2522,$6502,$6500,$6522,$6520

DATA_019E0A:
	dw $24E4,$24E4

DATA_019E0E:
	dw $24E0,$24E2,$24E0,$24E2

DATA_019E16:
	dw $24AC,$24AE,$24CC,$24CE,$24AC,$24AE,$24CC,$24CE
	dw $24AC,$24AE,$24CC,$24CE,$24AC,$24AE,$24CC,$24CE

DATA_019E36:
	dw $2CA0,$2CA2,$2CC0,$2CC2,$6CA2,$6CA0,$6CC2,$6CC0

DATA_019E46:
	dw $2CA4,$2CA6,$2CC4,$2CC6,$6CA6,$6CA4,$6CC6,$6CC4

DATA_019E56:
	dw $2CA8,$2CAA,$2CC8,$2CCA,$6CAA,$6CA8,$6CCA,$6CC8

DATA_019E66:
	dw $2D00,$2D02,$2D20,$2D22,$6D02,$6D00,$6D22,$6D20

DATA_019E76:
	dw $2CE4,$2CE4

DATA_019E7A:
	dw $2CE0,$2CE2,$2CE0,$2CE2

DATA_019E82:
	dw $2CAC,$2CAE,$2CCC,$2CCE,$2CAC,$2CAE,$2CCC,$2CCE
	dw $2CAC,$2CAE,$2CCC,$2CCE,$2CAC,$2CAE,$2CCC,$2CCE

DATA_019EA2:
	dw $28A0,$28A2,$28C0,$28C2,$68A2,$68A0,$68C2,$68C0

DATA_019EB2:
	dw $28A4,$28A6,$28C4,$28C6,$68A6,$68A4,$68C6,$68C4

DATA_019EC2:
	dw $28A8,$28AA,$28C8,$28CA,$68AA,$68A8,$68CA,$68C8

DATA_019ED2:
	dw $2900,$2902,$2920,$2922,$6902,$6900,$6922,$6920

DATA_019EE2:
	dw $28E4,$28E4

DATA_019EE6:
	dw $28E0,$28E2,$28E0,$28E2

DATA_019EEE:
	dw $28AC,$28AE,$28CC,$28CE,$28AC,$28AE,$28CC,$28CE
	dw $28AC,$28AE,$28CC,$28CE,$28AC,$28AE,$28CC,$28CE

DATA_019F0E:
	dw DATA_019DDA,DATA_019DCA,DATA_019DEA,DATA_019DCA,DATA_019E46,DATA_019E36,DATA_019E56,DATA_019E36
	dw DATA_019EB2,DATA_019EA2,DATA_019EC2,DATA_019EA2,DATA_019DDA,DATA_019DFA,DATA_019DEA,DATA_019DFA
	dw DATA_019E46,DATA_019E66,DATA_019E56,DATA_019E66,DATA_019EB2,DATA_019ED2,DATA_019EC2,DATA_019ED2

DATA_019F3E:
	dw DATA_019E0A,DATA_019E0E,DATA_019E16,$0000,DATA_019E76,DATA_019E7A,DATA_019E82,$0000
	dw DATA_019EE2,DATA_019EE6,DATA_019EEE

UNK_019F54:
	dw $0000,$0022,$002D,$003F

DATA_019F5C:
	dw $378E,$778E,$B78E,$F78E

DATA_019F64:
	dw $376A,$376C,$776C,$776A,$378A,$378C,$778C,$778A
	dw $B78A,$B78C,$F78C,$F78A,$B76A,$B76C,$F76C,$F76A

DATA_019F84:
	dw $3D6A,$3D6C,$7D6C,$7D6A,$3D8A,$3D8C,$7D8C,$7D8A
	dw $BD8A,$BD8C,$FD8C,$FD8A,$BD6A,$BD6C,$FD6C,$FD6A

DATA_019FA4:
	dw $2BA8,$2BAA,$2BC8,$2BCA,$2BAC,$2BAE,$2BCC,$2BCE
	dw $EBCA,$EBC8,$EBAA,$EBA8,$EBCE,$EBCC,$EBAE,$EBAC

DATA_019FC4:
	dw $2FA8,$2FAA,$2FC8,$2FCA,$2FAC,$2FAE,$2FCC,$2FCE
	dw $EFCA,$EFC8,$EFAA,$EFA8,$EFCE,$EFCC,$EFAE,$EFAC

DATA_019FE4:
	dw $2BC0,$2BC2,$2BC2,$6BC0,$2BC0,$6BC2,$6BC2,$6BC0
	dw $ABC0,$ABC2,$ABC2,$EBC0,$ABC0,$EBC2,$EBC2,$6BC0

DATA_01A004:
	dw $2FE5

DATA_01A006:
	dw $0004,$0000,$FFFC,$0000,$0000,$0004,$0000,$FFFC
	dw $0004,$0004,$FFFC,$0004,$0004,$FFFC,$FFFC,$FFFC

DATA_01A026:
	dw $3CE6,$7CE6,$BCE6,$FCE6

DATA_01A02E:
	dw $3D6E,$7D6E,$BD6E,$FD6E,$3EE6

DATA_01A038:
	dw $3CE6

DATA_01A03A:
	dw $3D08,$3D0A,$3D28,$3D2A,$7D0A,$7D08,$7D2A,$7D28
	dw $BD28,$BD2A,$BD08,$BD0A,$FD2A,$FD28,$FD0A,$FD08

DATA_01A05A:
	dw $3908,$390A,$3928,$392A,$790A,$7908,$792A,$7928
	dw $B928,$B92A,$B908,$B90A,$F92A,$F928,$F90A,$F908

DATA_01A07A:
	dw $390C,$390E,$392C,$392E,$790E,$790C,$792E,$792C
	dw $B92C,$B92E,$B90C,$B90E,$F92E,$F92C,$F90E,$F90C

DATA_01A09A:
	dw $3D0C,$3D0E,$3D2C,$3D2E,$7D0E,$7D0C,$7D2E,$7D2C
	dw $BD2C,$BD2E,$BD0C,$BD0E,$FD2E,$FD2C,$FD0E,$FD0C
	dw $3F08,$3F0A,$3F28,$3F2A,$7F0A,$7F08,$7F2A,$7F28
	dw $BF28,$BF2A,$BF08,$BF0A,$FF2A,$FF28,$FF0A,$FF08
	dw $3D0C,$3D0E,$3D2C,$3D2E,$7D0E,$7D0C,$7D2E,$7D2C
	dw $BD2C,$BD2E,$BD0C,$BD0E,$FD2E,$FD2C,$FD0E,$FD0C

DATA_01A0FA:
	dw $2668,$266A,$E66A,$E668

DATA_01A102:
	dw $26E0,$26E2,$E6E2,$E6E0

DATA_01A10A:
	dw DATA_01A03A,DATA_01A07A,DATA_01A05A,DATA_01A09A,DATA_01A03A,DATA_01A07A,DATA_01A05A,DATA_01A09A

DATA_01A11A:
	dw $2D40

DATA_01A11C:
	dw $2D42

DATA_01A11E:
	dw $2D44

DATA_01A120:
	dw $2D46

DATA_01A122:
	dw $2D48

DATA_01A124:
	dw $2D4A

DATA_01A126:
	dw $2D4C

DATA_01A128:
	dw $2D4C

DATA_01A12A:
	dw DATA_01A11A,DATA_01A11C,DATA_01A11E,DATA_01A120,DATA_01A122,DATA_01A124,DATA_01A126,DATA_01A128

DATA_01A13A:
	dw $2408,$240A,$2428,$A408,$A40A,$A428,$6428,$640A
	dw $6408,$E428,$E40A,$E408

DATA_01A152:
	dw $2444,$6444,$2446,$6446,$242A,$642A,$2444,$6444
	dw $2446,$6446,$242A,$642A

DATA_01A16A:
	dw $284A,$284C,$684C,$684A,$A84A,$A84C,$E84C,$E84A

DATA_01A17A:
	dw $2DEC,$2DED,$ADEC,$ADED

DATA_01A182:
	dw $2DEE,$2DEF,$ADEE,$ADEF

DATA_01A18A:
	dw $2DE0,$2DE6,$6DE6,$2DE0

DATA_01A192:
	dw $2DE7,$2DE8,$6DE8,$6DE7

DATA_01A19A:
	dw $2DE9,$2DEA,$6DEA,$6DE9

DATA_01A1A2:
	dw $2DE0,$2DED,$6DED,$2DE0,$2DA0,$2DA2,$2DA4,$2DA6
	dw $2DC6,$6DC6,$6DA6,$6DA4,$6DA2,$6DA0

DATA_01A1BE:
	dw $2DA0,$2DA2,$2DA4,$2DA6,$6DA6,$6DA4,$6DA2,$6DA0

DATA_01A1CE:
	dw $2D66,$2D67,$6D67,$6D66

DATA_01A1D6:
	dw $2964,$2965,$6965,$6964

DATA_01A1DE:
	dw $2726

DATA_01A1E0:
	dw $2726

DATA_01A1E2:
	dw $27C4

DATA_01A1E4:
	dw $2AEC,$0088,$AAEC,$0088

DATA_01A1EC:
	dw $AB24,$6B04,$6B06,$6B24

DATA_01A1F4:
	dw $2BC0,$6BC0,$0088,$0088

DATA_01A1FC:
	dw $2B04,$EB24,$2B24,$2B06

DATA_01A204:
	dw $2AEC,$0088,$AAEC,$0088

DATA_01A20C:
	dw $AB24,$6B04,$6B06,$6B24

DATA_01A214:
	dw $2BC0,$6BC0,$0088,$0088

DATA_01A21C:
	dw $2B04,$EB24,$2B24,$2B06

DATA_01A224:
	dw DATA_01A1EC,DATA_01A21C,DATA_01A1FC,DATA_01A20C,DATA_01A1F4,DATA_01A214,DATA_01A1E4,DATA_01A204

DATA_01A234:
	dw $2164,$2165,$6165,$6164,$2240,$6240,$2242,$6242
	dw $2244,$6244,$2384,$6384,$2386,$6386,$2388,$6388
	dw $A23C,$A240,$A244,$A240,$A248,$A24C,$A250,$A24C
	dw $0151,$0156,$015F,$0156,$0151,$0156,$015F,$0156

DATA_01A274:
	dw $200C,$200E,$600E,$600C,$202C,$202E,$602E,$602C
	dw $A02C,$A02E,$E02E,$E02C,$A00C,$A00E,$E00E,$E00C

DATA_01A294:
	dw $27C4,$27C4

DATA_01A298:
	dw $2E68,$6E68

DATA_01A29C:
	dw $2E6A,$6E6A,$AE6A,$EE6A

DATA_01A2A4:
	dw $2E6C,$6E6C

DATA_01A2A8:
	dw $2E6E,$6E6E

DATA_01A2AC:
	dw $2480,$2482,$24A0,$24A2,$24C0,$24C2,$6482,$6480
	dw $64A2,$64A0,$64C2,$64C0

DATA_01A2C4:
	dw $2488,$248A,$24A8,$24AA,$24C8,$24CA,$648A,$6488
	dw $64AA,$64A8,$64CA,$64C8

DATA_01A2DC:
	dw $248C,$248E,$24AC,$24AE,$24CC,$24CE,$648E,$648C
	dw $64AE,$64AC,$64CE,$64CC

DATA_01A2F4:
	dw $2484,$2486,$24A4,$24A6,$24C4,$24C6,$6486,$6484
	dw $64A6,$64A4,$64C6,$64C4

DATA_01A30C:
	dw $2FED,$6FED,$AFED,$EFED

DATA_01A314:
	dw $24E2,$64E2,$A4E2,$E4E2

DATA_01A31C:
	dw $23A2,$23A4,$23A6,$2306,$2324,$6306,$2364,$23C2
	dw $6364,$23A2,$23A4,$23A6,$2306,$2324,$6306,$2364
	dw $23C2,$6364

DATA_01A340:
	dw $23A2,$23A4,$23A6,$6344,$6342,$6340,$0060,$6362
	dw $6360,$23A2,$23A4,$23A6,$2340,$2342,$2344,$2360
	dw $2362,$0060

DATA_01A364:
	dw $23A2,$23A4,$23A6,$6304,$6302,$6300,$0060,$6322
	dw $6320,$23A2,$23A4,$23A6,$2300,$2302,$2304,$2320
	dw $2322,$0060

DATA_01A388:
	dw $2382,$2384,$6382,$23A2,$23A4,$23A6,$2306,$2324
	dw $6306,$2364,$23C2,$6364,$2382,$2384,$6382,$23A2
	dw $23A4,$23A6,$2306,$2324,$6306,$2364,$23C2,$6364
	dw $2382,$2384,$6382,$23A2,$23A4,$23A6,$2340,$2342
	dw $2344,$2360,$2362,$0060,$2382,$2384,$6382,$23A2
	dw $23A4,$23A6,$6344,$6342,$6340,$0060,$6362,$6360
	dw $2382,$2384,$6382,$23A2,$23A4,$23A6,$2300,$2302
	dw $2304,$2320,$2322,$0060,$2382,$2384,$6382,$23A2
	dw $23A4,$23A6,$6304,$6302,$6300,$0060,$6322,$6320
	dw $A31C,$A340,$A364,$A340,$A388,$A3B8,$A3E8,$A3B8

DATA_01A428:
	dw $2DE9,$2DEA,$2DEB

DATA_01A42E:
	dw $25C0,$25C1,$65C0,$25D0,$25D1,$65D0,$A5C0,$A5C1
	dw $E5C0,$25C0,$25C1,$65C0,$25D0,$25D1,$65D0,$A5C0
	dw $A5C1,$E5C0

DATA_01A452:
	dw $25C0,$25C1,$65C0,$0060,$25D0,$25D1,$65D0,$2FA1
	dw $A5C0,$A5C1,$E5C0,$0060,$25C0,$25C1,$65C0,$0060
	dw $25D0,$25D1,$65D0,$2FB1,$A5C0,$A5C1,$E5C0,$0060

DATA_01A482:
	dw $0060,$25C0,$25C1,$65C0,$6FA1,$25D0,$25D1,$65D0
	dw $0060,$A5C0,$A5C1,$E5C0,$0060,$25C0,$25C1,$65C0
	dw $2FB1,$25D0,$25D1,$65D0,$0060,$A5C0,$A5C1,$E5C0

DATA_01A4B2:
	dw $25C0,$25C1,$65C0,$25D0,$25D1,$65D0,$A5C0,$A5C1
	dw $E5C0,$0060,$2FA0,$0060,$25C0,$25C1,$65C0,$25D0
	dw $25D1,$65D0,$A5C0,$A5C1,$E5C0,$0060,$2FB0,$0060

DATA_01A4E2:
	dw $0060,$AFA0,$0060,$25C0,$25C1,$65C0,$25D0,$25D1
	dw $65D0,$A5C0,$A5C1,$E5C0,$0060,$AFB0,$0060,$25C0
	dw $25C1,$65C0,$25D0,$25D1,$65D0,$A5C0,$A5C1,$E5C0

DATA_01A512:
	dw $2FEE,$2FEE,$2FEE,$2FEE

DATA_01A51A:
	dw $2604,$2606,$2624,$2626,$2644,$2646,$6606,$6604
	dw $6626,$6624,$6646,$6644

DATA_01A532:
	dw $2746,$0060,$2604,$2606,$2624,$2626,$2644,$2646
	dw $0060,$2746,$6606,$6604,$6626,$6624,$6646,$6644

DATA_01A552:
	dw $2604,$2606,$2748,$2624,$2626,$0060,$2644,$2646
	dw $0060,$6748,$6606,$6604,$0060,$6626,$6624,$0060
	dw $6646,$6644

DATA_01A576:
	dw $0060,$2604,$2606,$274A,$2624,$2626,$0060,$2644
	dw $2646,$6606,$6604,$0060,$6626,$6624,$674A,$6646
	dw $6644,$0060

DATA_01A59A:
	dw $274C,$674C

DATA_01A59E:
	dw $2388,$2388,$2388,$2388

DATA_01A5A6:
	dw $2D8E,$6D8E,$AD8E,$ED8E,$2F8E,$6F8E,$AF8E,$EF8E
	dw $2D8E,$6D8E,$AD8E,$ED8E,$278E,$678E,$A78E,$E78E

DATA_01A5C6:
	dw $0060,$0060,$6808,$0060,$0060,$0060,$280A,$680C
	dw $680A,$0060,$0060,$280E,$6828,$680E,$0060,$0060
	dw $282A,$682C,$682A,$0060,$0060,$282E,$6848,$682E
	dw $0060,$0060,$0060,$6808,$0060,$0060,$0060,$280A
	dw $680C,$680A,$0060,$0060,$280E,$6828,$680E,$0060
	dw $0060,$282A,$682C,$682A,$0060,$0060,$282E,$6848
	dw $682E,$0060

DATA_01A62A:
	dw $0060,$0060,$6808,$0060,$0060,$0060,$280A,$680C
	dw $680A,$0060,$0060,$280E,$6828,$680E,$0060,$0060
	dw $282A,$682C,$284A,$0060,$0060,$282E,$284C,$284E
	dw $0060,$0060,$0060,$6808,$0060,$0060,$0060,$280A
	dw $680C,$680A,$0060,$0060,$280E,$6828,$680E,$0060
	dw $0060,$684A,$282C,$682A,$0060,$0060,$684E,$684C
	dw $682E,$0060

DATA_01A68E:
	dw $0060,$0060,$68E4,$0060,$0060,$0060,$28E6,$68E8
	dw $68E6,$0060,$0060,$28EA,$68EC,$68EA,$0060,$0060
	dw $28EE,$6908,$68EE,$0060,$0060,$282E,$6848,$682E
	dw $0060,$0060,$0060,$28E4,$0060,$0060,$0060,$28E6
	dw $28E8,$68E6,$0060,$0060,$28EA,$28EC,$68EA,$0060
	dw $0060,$28EE,$2908,$68EE,$0060,$0060,$282E,$2848
	dw $682E,$0060

DATA_01A6F2:
	dw $0060,$292C,$0060,$0060,$0060,$280A,$692E,$690E
	dw $690C,$690A,$280E,$6828,$0060,$0060,$0060,$282A
	dw $682C,$6986,$0060,$0060,$282E,$6848,$682E,$0060
	dw $0060,$0060,$0060,$0060,$292C,$0060,$290A,$290C
	dw $290E,$292E,$680A,$0060,$0060,$0060,$2828,$680E
	dw $0060,$0060,$2986,$282C,$682A,$0060,$0060,$282E
	dw $2848,$682E

DATA_01A756:
	dw $0060,$292C,$0060,$0060,$0060,$280A,$692E,$6966
	dw $694E,$0060,$280E,$6828,$6968,$692A,$6928,$282A
	dw $682C,$6986,$0060,$0060,$282E,$6848,$682E,$0060
	dw $0060,$0060,$0060,$0060,$292C,$0060,$0060,$294E
	dw $2966,$292E,$680A,$2928,$292A,$2968,$2828,$680E
	dw $0060,$0060,$2986,$282C,$682A,$0060,$0060,$282E
	dw $2848,$682E

DATA_01A7BA:
	dw $0060,$0060,$6E08,$0060,$0060,$0060,$2E0A,$6E0C
	dw $6E0A,$0060,$0060,$2E0E,$6E28,$6E0E,$0060,$0060
	dw $2E2A,$6E2C,$6E2A,$0060,$0060,$2E2E,$6E48,$6E2E
	dw $0060,$0060,$0060,$6E08,$0060,$0060,$0060,$2E0A
	dw $6E0C,$6E0A,$0060,$0060,$2E0E,$6E28,$6E0E,$0060
	dw $0060,$2E2A,$6E2C,$6E2A,$0060,$0060,$2E2E,$6E48
	dw $6E2E,$0060

DATA_01A81E:
	dw $0060,$0060,$6E08,$0060,$0060,$0060,$2E0A,$6E0C
	dw $6E0A,$0060,$0060,$2E0E,$6E28,$6E0E,$0060,$0060
	dw $2E2A,$6E2C,$2E4A,$0060,$0060,$2E2E,$2E4C,$2E4E
	dw $0060,$0060,$0060,$6E08,$0060,$0060,$0060,$2E0A
	dw $6E0C,$6E0A,$0060,$0060,$2E0E,$6E28,$6E0E,$0060
	dw $0060,$6E4A,$2E2C,$6E2A,$0060,$0060,$6E4E,$6E4C
	dw $6E2E,$0060

DATA_01A882:
	dw $0060,$0060,$6EE4,$0060,$0060,$0060,$2EE6,$6EE8
	dw $6EE6,$0060,$0060,$2EEA,$6EEC,$6EEA,$0060,$0060
	dw $2EEE,$6F08,$6EEE,$0060,$0060,$2E2E,$6E48,$6E2E
	dw $0060,$0060,$0060,$2EE4,$0060,$0060,$0060,$2EE6
	dw $2EE8,$6EE6,$0060,$0060,$2EEA,$2EEC,$6EEA,$0060
	dw $0060,$2EEE,$2F08,$6EEE,$0060,$0060,$2E2E,$2E48
	dw $6E2E,$0060

DATA_01A8E6:
	dw $0060,$2F2C,$0060,$0060,$0060,$2E0A,$6F2E,$6F0E
	dw $6F0C,$6F0A,$2E0E,$6E28,$0060,$0060,$0060,$2E2A
	dw $6E2C,$6F86,$0060,$0060,$2E2E,$6E48,$6E2E,$0060
	dw $0060,$0060,$0060,$0060,$2F2C,$0060,$2F0A,$2F0C
	dw $2F0E,$2F2E,$6E0A,$0060,$0060,$0060,$2E28,$6E0E
	dw $0060,$0060,$2F86,$2E2C,$6E2A,$0060,$0060,$2E2E
	dw $2E48,$6E2E

DATA_01A94A:
	dw $0060,$2F2C,$0060,$0060,$0060,$2E0A,$6F2E,$6F66
	dw $6F4E,$0060,$2E0E,$6E28,$6F68,$6F2A,$6F28,$2E2A
	dw $6E2C,$6F86,$0060,$0060,$2E2E,$6E48,$6E2E,$0060
	dw $0060,$0060,$0060,$0060,$2F2C,$0060,$0060,$2F4E
	dw $2F66,$2F2E,$6E0A,$2F28,$2F2A,$2F68,$2E28,$6E0E
	dw $0060,$0060,$2F86,$2E2C,$6E2A,$0060,$0060,$2E2E
	dw $2E48,$6E2E

DATA_01A9AE:
	dw DATA_01A5C6,DATA_01A62A,DATA_01A68E,DATA_01A6F2,DATA_01A756

DATA_01A9B8:
	dw DATA_01A7BA,DATA_01A81E,DATA_01A882,DATA_01A8E6,DATA_01A94A

DATA_01A9C2:
	dw $2FA0,$2FB0,$6FA0,$6FB0

DATA_01A9CA:
	dw $25EC,$27EC,$25EC,$27EC

DATA_01A9D2:
	dw $2DEE,$2DEE

DATA_01A9D6:
	dw $7015,$7014,$3FA1,$7015,$7014,$3FB1

DATA_01A9E2:
	dw $0060,$0060,$7E36,$7025,$7024,$0060,$7035,$7034
	dw $0060,$0060,$0060,$7E37,$7025,$7024,$0060,$7035
	dw $7034,$0060

DATA_01AA06:
	dw $2E44,$2E46,$6E44,$6E46

DATA_01AA0E:
	dw $21C6,$0060

DATA_01AA12:
	dw $6FC6,$0060

DATA_01AA16:
	dw $366C

DATA_01AA18:
	dw $3DC2,$7DC2,$3DC4,$7DC4

DATA_01AA20:
	dw $2BC2

DATA_01AA22:
	dw $2BC4

DATA_01AA24:
	dw $2BC2

DATA_01AA26:
	dw $2E00,$2E01,$2E02,$2E03,$2E04,$2E05,$2E06,$2E07
	dw $2E08,$2E09,$2E0A,$2E0B,$2E0C,$2E0D,$2E0E,$2E0F
	dw $2E10,$2E11,$2E12,$2E13,$2E14,$2E15,$2E16,$2E17
	dw $2418,$2419,$241A,$241B,$241C,$241D,$261E,$261F
	dw $2620,$2621,$2622,$2623,$2624,$2625,$2626,$2627
	dw $2628,$2629,$282A,$282B,$282C,$282D,$282E,$282F
	dw $2830,$2831,$2832,$2833,$2834,$2835,$2836,$2837
	dw $2838,$2839,$283A,$283B,$283C,$283D,$283E,$283F
	dw $2840,$2841,$2842,$2843,$2844,$2845,$2846,$2847
	dw $2848,$2849,$284A,$284B,$284C,$284D,$284E,$284F
	dw $2850,$2851,$2852,$2853,$2854,$2855,$2856,$2857
	dw $2858,$2859,$285A,$285B,$285C,$285D,$285E,$285F
	dw $2860,$2861,$2862,$2863,$2864,$2865,$2866,$2867
	dw $2868,$2869,$286A,$286B

DATA_01AAFE:
	dw $2200,$2201,$2202,$2203,$2204,$2205,$2206,$2207
	dw $2208,$2209,$220A,$220B,$220C,$220D,$220E,$220F
	dw $2210,$2211,$2212,$2213,$2214,$2215,$2216,$2217
	dw $2218,$2219,$221A,$221B,$221C,$221D,$221E,$221F
	dw $2220,$2221,$2222,$2223,$2424,$2425,$2426,$2427
	dw $2428,$2429,$242A,$242B,$242C,$242D,$242E,$242F
	dw $2430,$2431,$2432,$2433,$2434,$2435,$2436,$2437
	dw $2438,$2439,$243A,$243B,$243C,$243D,$243E,$243F
	dw $2440,$2441,$2442,$2443,$2444,$2445,$2446,$2447
	dw $2448,$2449,$244A,$244B,$244C,$244D,$244E,$244F
	dw $2450,$2451,$2452,$2453,$2454,$2455,$2456,$2457
	dw $2458,$2459,$245A,$245B,$245C,$245D,$245E,$245F
	dw $2460,$2461,$2462,$2463,$2464,$2465,$2466,$2467
	dw $2468,$2469,$246A,$246B

DATA_01ABD6:
	dw $2200,$2201,$2202,$2203,$2204,$2205,$2206,$2207
	dw $2208,$2209,$220A,$220B,$220C,$220D,$220E,$220F
	dw $2210,$2211,$2212,$2213,$2214,$2215,$2216,$2217
	dw $2218,$2219,$221A,$221B,$221C,$221D,$221E,$221F
	dw $2220,$2221,$2222,$2223,$2224,$2225,$2226,$2227
	dw $2228,$2229,$222A,$222B,$222C,$222D,$222E,$222F
	dw $2230,$2231,$2232,$2233,$2234,$2235,$2436,$2437
	dw $2438,$2439,$243A,$243B,$243C,$243D,$243E,$243F
	dw $2440,$2441,$2442,$2443,$2444,$2445,$2446,$2447
	dw $2448,$2449,$244A,$244B,$244C,$244D,$244E,$244F
	dw $2450,$2451,$2452,$2453,$2454,$2455,$2456,$2457
	dw $2458,$2459,$245A,$245B,$245C,$245D,$245E,$245F
	dw $2460,$2461,$2462,$2463,$2464,$2465,$2466,$2467
	dw $2468,$2469,$246A,$246B

DATA_01ACAE:
	dw $2400,$2401,$2402,$2403,$2404,$2405,$2406,$2407
	dw $2408,$2409,$240A,$240B,$240C,$240D,$240E,$240F
	dw $2410,$2411,$2412,$2413,$2414,$2415,$2416,$2417
	dw $2418,$2419,$241A,$241B,$241C,$241D,$221E,$241F
	dw $2420,$2421,$2422,$2223,$2224,$2425,$2426,$2427
	dw $2428,$2229,$222A,$222B,$242C,$242D,$222E,$222F
	dw $2230,$2231,$2232,$2233,$2234,$2235,$2236,$2237
	dw $2238,$2239,$223A,$223B,$223C,$223D,$223E,$223F
	dw $2240,$2241,$2242,$2243,$2244,$2245,$2246,$2247
	dw $2248,$2249,$224A,$224B,$224C,$224D,$224E,$224F
	dw $2250,$2251,$2252,$2253,$2254,$2255,$2256,$2257
	dw $2258,$2259,$225A,$225B,$225C,$225D,$225E,$225F
	dw $2260,$2261,$2262,$2263,$2264,$2265,$2266,$2267
	dw $2268,$2269,$226A,$226B

DATA_01AD86:
	dw $2200,$2201,$2202,$2203,$2204,$2205,$2206,$2207
	dw $2208,$2209,$220A,$220B,$220C,$220D,$220E,$220F
	dw $2210,$2211,$2212,$2213,$2214,$2215,$2216,$2217
	dw $2218,$2219,$221A,$221B,$221C,$221D,$221E,$221F
	dw $2220,$2221,$2222,$2223,$2224,$2225,$2226,$2227
	dw $2228,$2229,$222A,$222B,$222C,$222D,$222E,$222F
	dw $2230,$2231,$2232,$2233,$2234,$2235,$2236,$2237
	dw $2238,$2239,$223A,$223B,$223C,$223D,$223E,$223F
	dw $2240,$2241,$2242,$2243,$2244,$2245,$2246,$2247
	dw $2248,$2249,$224A,$224B,$224C,$224D,$224E,$224F
	dw $2250,$2251,$2252,$2253,$2254,$2255,$2256,$2257
	dw $2258,$2259,$225A,$225B,$225C,$225D,$225E,$225F
	dw $2260,$2261,$2262,$2263,$2264,$2265,$2266,$2267
	dw $2268,$2269,$226A,$226B

DATA_01AE5E:
	dw $0000,DATA_01AE80,DATA_01AE80,DATA_01AE8C,DATA_01AE8C,DATA_01AE8C,DATA_01AE8C
	dw $1AA8,$BAA3,$AEAA,$AAAA,$8AAA,$AA87,DATA_01AE8C,DATA_01AE80
	dw DATA_01AE8C,DATA_01AE8C

DATA_01AE80:
	dw $3400,$3402,$3420,$3422,$3440,$3488

DATA_01AE8C:
	dw $3000,$3002,$3020,$3022,$3040,$3060,$0060,$2360
	dw $6360,$0060,$0060,$2362,$6362,$0060,$2380,$2382
	dw $6382,$6380

DATA_01AEB0:
	dw $2500,$2502,$2504,$2526,$0060,$2540,$2542,$2544
	dw $2520,$2522,$A500,$A502,$2560,$2562,$0060,$0060
	dw $6526,$6504,$6502,$6500,$6522,$6520,$6544,$6542
	dw $6540,$0060,$6562,$6560,$E502,$E500

DATA_01AEEC:
	dw $21C0,$61C0,$21C0,$61C0,$21C0,$61C0,$21C0,$61C0

DATA_01AEFC:
	dw $20EC,$A0EC,$20EC,$A0EC,$20EC,$A0EC,$20EC,$A0EC

DATA_01AF0C:
	dw $28E8,$28EA,$68EA,$68E8,$2984,$2986,$6986,$6984
	dw $2888,$2888,$6888,$6888,$2984,$2986,$6986,$6984
	dw $22E8,$22EA,$62EA,$62E8,$2384,$2386,$6386,$6384
	dw $2288,$2288,$6888,$6288,$2384,$2386,$6386,$6384

DATA_01AF4C:
	dw $20E8,$20EA,$60EA,$60E8,$2184,$2186,$6186,$6184
	dw $2088,$2088,$6088,$6088,$2184,$2186,$6186,$6184
	dw $20E8,$20EA,$60EA,$60E8,$2184,$2186,$6186,$6184
	dw $2088,$2088,$6088,$6088,$2184,$2186,$6186,$6184

DATA_01AF8C:
	dw $2C48,$2248,$2848,$2048

DATA_01AF94:
	dw DATA_01AFA6,$0005
	dw DATA_01AFCA,$0005
	dw DATA_01AFEE,$0005
	dw DATA_01B012,$0005
	dw $0000

DATA_01AFA6:
	dw $290A,$290C,$290E,$292A,$292C,$292E,$2808,$280A
	dw $2860,$690E,$690C,$690A,$692E,$692C,$692A,$0060
	dw $680A,$6808

DATA_01AFCA:
	dw $290A,$290C,$290E,$292A,$292C,$292E,$280C,$280E
	dw $2860,$690E,$690C,$690A,$692E,$692C,$692A,$0060
	dw $680E,$680C

DATA_01AFEE:
	dw $290A,$290C,$290E,$292A,$292C,$292E,$2828,$282A
	dw $2860,$690E,$690C,$690A,$692E,$692C,$692A,$0060
	dw $682A,$6828

DATA_01B012:
	dw $290A,$290C,$290E,$292A,$292C,$292E,$282C,$282E
	dw $2860,$690E,$690C,$690A,$692E,$692C,$692A,$0060
	dw $682E,$682C

DATA_01B036:
	dw DATA_01B088,$0040
	dw DATA_01B088,$000E
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$0036
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$007C
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw DATA_01B088,$0003
	dw DATA_01B0B8,$0003
	dw $0000

DATA_01B088:
	dw $2660,$268C,$268E,$2686,$2688,$268A,$2680,$2682
	dw $2684,$26AA,$26AC,$26AE,$668E,$668C,$6660,$668A
	dw $6688,$6686,$6684,$6682,$6680,$66AE,$66AC,$66AA

DATA_01B0B8:
	dw $2660,$26A6,$26A8,$26A0,$26A2,$26A4,$26C4,$26C6
	dw $26C8,$2660,$26C0,$26C2,$66A8,$66A6,$6660,$66A4
	dw $66A2,$66A0,$66C8,$66C6,$66C4,$66C2,$66C0,$6660

DATA_01B0E8:
	dw $2660,$26A6,$26A8,$26A0,$26A2,$26A4,$2660,$2660
	dw $2660,$2660,$2660,$2660,$66A8,$66A6,$6660,$66A4
	dw $66A2,$66A0,$6660,$6660,$6660,$6660,$6660,$6660

DATA_01B118:
	dw $2C60,$2C4A,$2C4C,$2C60,$2C48,$2C4E,$2CCE,$2D80

DATA_01B128:
	dw $2900,$2902,$0060,$2960,$2962,$2964,$2940,$2942
	dw $0060,$0060,$6902,$6900,$6964,$6962,$6960,$6860
	dw $6942,$0060,$6940

DATA_01B14E:
	dw $2904,$2906,$0060,$2960,$2962,$2964,$2944,$2946
	dw $0060,$0060,$6906,$6904,$6964,$6962,$6960,$0060
	dw $6946,$6944

DATA_01B172:
	dw $2900,$2902,$0060,$2960,$2962,$2964,$2948,$294A
	dw $0060,$0060,$6902,$6900,$6964,$6962,$6960,$0060
	dw $694A,$6948

DATA_01B196:
	dw DATA_01B128,$0004
	dw DATA_01B14E,$0004
	dw DATA_01B172,$0004
	dw DATA_01B14E,$0004
	dw $0000

DATA_01B1A8:
	dw DATA_01B1BA,$0007
	dw DATA_01B1D2,$0007
	dw DATA_01B1EA,$0007
	dw DATA_01B1D2,$0007
	dw $0000

DATA_01B1BA:
	dw $2900,$2902,$2920,$2922,$2940,$2942,$6902,$6900
	dw $6922,$6920,$6942,$6940

DATA_01B1D2:
	dw $2904,$2906,$2924,$2926,$2944,$2946,$6906,$6904
	dw $6926,$6924,$6946,$6944

DATA_01B1EA:
	dw $2900,$2902,$2920,$2922,$2948,$294A,$6902,$6900
	dw $6922,$6920,$694A,$6948

DATA_01B202:
	dw $2FA1,$6FA1

DATA_01B206:
	dw $2FB1,$6FB1

DATA_01B20A:
	dw DATA_01B22C,$0003
	dw DATA_01B234,$0003
	dw DATA_01B23C,$0003
	dw DATA_01B244,$0003
	dw DATA_01B24C,$0003
	dw DATA_01B254,$0003
	dw DATA_01B25C,$0003
	dw DATA_01B264,$0003
	dw $0000

DATA_01B22C:
	dw $2D4C,$2D4C,$2D4C,$2D4C

DATA_01B234:
	dw $2D4D,$2D4D,$2D4D,$2D4D

DATA_01B23C:
	dw $2D4E,$2D4E,$2D4E,$2D4E

DATA_01B244:
	dw $2D4F,$2D4F,$2D4F,$2D4F

DATA_01B24C:
	dw $2D5C,$2D5C,$2D5C,$2D5C

DATA_01B254:
	dw $2D5D,$2D5D,$2D5D,$2D5D

DATA_01B25C:
	dw $2D5E,$2D5E,$2D5E,$2D5E

DATA_01B264:
	dw $2D5F,$2D5F,$2D5F,$2D5F

DATA_01B26C:
	dw $2182

DATA_01B26E:
	dw $2404,$2406,$2424,$2426,$2444,$2446,$6406,$6404
	dw $6426,$6424,$6446,$6444

DATA_01B286:						; Note: Tile/Prop of Obnoxio's thrown pies. Should be $25C4,$65C4
	dw $23C4,$63C4

DATA_01B28A:
	dw $2400,$2402,$2404,$2406,$2408,$240A,$240C,$240E
	dw $2420,$2422,$2424,$2426,$2428,$242A,$242C,$242E
	dw $2440,$2442,$2444,$2446,$2448,$244A,$244C,$244E
	dw $2460,$2462,$2428,$2464,$2466,$2468,$246A,$246C
	dw $246E,$2480,$2482,$2484,$2486,$2488,$248A,$2428
	dw $248C,$248E,$24A0,$24A2,$24A4,$24A6,$24A8,$24AA
	dw $24AC,$2428,$2428,$2428

DATA_01B2F2:
	dw $24AE,$24C0,$2428,$24C2,$2428,$2428,$2428,$2428
	dw $2428,$2428,$2428,$2428

DATA_01B30A:
	dw $37B2,$37B3

DATA_01B30E:
	dw DATA_01B318,$0003
	dw DATA_01B338,$0003
	dw $0000

DATA_01B318:
	dw $35C0,$3566,$3568,$3584,$0060,$3586,$3588,$35C2
	dw $7584,$7568,$7566,$75C0,$75C2,$7588,$7586,$0060

DATA_01B338:
	dw $35C0,$3566,$3568,$34E6,$0060,$3586,$3588,$34E8
	dw $74E6,$7568,$7566,$75C0,$74E8,$7588,$7586,$0060

DATA_01B358:
	dw $3000,$3002,$3004,$3020,$3022,$3024

DATA_01B364:
	dw $3006,$3008,$300A,$3026,$3028,$302A

DATA_01B370:
	dw $300C,$300E,$302C,$302E

DATA_01B378:
	dw $3040,$3042,$3044,$3046,$3060,$3062,$3064,$3066

DATA_01B388:
	dw $3048,$304A,$304C,$304E,$3068,$306A,$306C,$306E

DATA_01B398:
	dw $3088,$308A,$308C,$308E,$3080,$3082,$3084,$3086

DATA_01B3A8:
	dw $30A0,$30A2,$30A4,$30A6,$30A8,$30AA,$30AC,$30C0
	dw $30C2,$30C4,$30C6,$30C8,$30CA,$30CC

DATA_01B3C4:
	dw $30E0,$30E2,$30E4,$30E6,$30E8,$30EA,$30EC,$30EE
	dw $3000,$3002,$3004,$3006,$3020,$3022,$3024,$3026
	dw $3008,$300A,$300C,$300E,$3028,$302A,$302C,$302E

DATA_01B3F4:
	dw $3080,$3082,$3084,$3086,$30A0,$30A2,$30A4,$30A6

DATA_01B404:
	dw $34CC,$34CE,$0180,$0180,$34EC,$34EE,$348E,$34AE

DATA_01B414:
	dw $3088,$308A,$308C,$30A8,$30AA,$30AC

DATA_01B420:
	dw $30C0,$30C2,$30C4,$30E0,$30E2,$30E4

DATA_01B42C:
	dw $30C6,$30C8,$30CA,$30E6,$30E8,$30EA

DATA_01B438:
	dw $384E,$388A,$38E4,$3988

DATA_01B440:
	dw $284E,$288A,$28E4,$2988,$688A,$684E,$6988,$68E4

DATA_01B450:
	dw $21E8

DATA_01B452:
	dw $2780,$2180

DATA_01B456:
	dw $2480,$2482,$2484,$2486,$2488,$248A,$248C,$248E
	dw $24A0,$6484,$6482,$6480,$648A,$6488,$6486,$64A0
	dw $648E,$648C

DATA_01B47A:
	dw $24A2,$24A4,$24A6,$24A8,$24AA,$24AC,$24AE,$24C0
	dw $64A4,$64A2,$64A8,$64A6,$64AC,$64AA,$64C0,$64AE

DATA_01B49A:
	dw $2460,$24C2,$24C4,$24C6,$24C8,$24CA,$24CC,$2460
	dw $64C6,$64C4,$64C2,$6460,$6460,$64CC,$64CA,$64C8

DATA_01B4BA:
	dw $2460,$24CE,$24E0,$24E2,$24E4,$24E6,$64E0,$64CE
	dw $6460,$64E6,$64E4,$64E2

DATA_01B4D2:
	dw $2460,$24E8,$24EA,$24EC,$24EE,$2508,$2528,$2460
	dw $64EC,$64EA,$64E8,$6460,$6460,$6528,$6508,$64EE

DATA_01B4F2:
	dw $2460,$24E8,$24EA,$25A6,$24EC,$24EE,$2508,$2528
	dw $2460,$0060,$64EC,$65A6,$64EA,$64E8,$6460,$0060
	dw $6460,$6528,$6508,$64EE

DATA_01B51A:
	dw DATA_01B456,DATA_01B47A,DATA_01B49A,DATA_01B4BA,DATA_01B4D2,DATA_01B4F2

DATA_01B526:
	dw $0003,$0002,$0004,$0003,$0004,$0005

DATA_01B532:
	dw $0003,$0004,$0002,$0002,$0002,$0002

DATA_01B53E:
	dw $0030,$0020,$0040,$0060,$0040,$0080

DATA_01B54A:
	dw $FC40,$FB40,$FC00,$FA80

DATA_01B552:
	dw DATA_01B56C,$0008
	dw DATA_01B570,$0008
	dw DATA_01B574,$0063
	dw DATA_01B578,$0007
	dw DATA_01B57C,$0009
	dw DATA_019B0A,$001E
	dw $0000

DATA_01B56C:
	dw $A6E2,$E6E2

DATA_01B570:
	dw $26E4,$40E4

DATA_01B574:
	dw $26E2,$40E2

DATA_01B578:
	dw $26E0,$40E0

DATA_01B57C:
	dw $26EA,$26EC,$66EC,$66EA

DATA_01B584:
	dw DATA_01B596,$0006
	dw DATA_01B5AE,$0006
	dw DATA_01B5C6,$0006
	dw DATA_01B5DE,$0006
	dw $0000

DATA_01B596:
	dw $2660,$2660,$2680,$2682,$2660,$2684,$2686,$2688
	dw $268A,$268C,$268E,$26A0

DATA_01B5AE:
	dw $2660,$2660,$26A2,$26A4,$2660,$26A6,$26A8,$26AA
	dw $2660,$26AC,$26AE,$26C0

DATA_01B5C6:
	dw $2660,$2660,$26C2,$26C4,$2660,$26C6,$26C8,$26CA
	dw $26CC,$26CE,$26E0,$26E2

DATA_01B5DE:
	dw $2660,$2660,$26E4,$26E6,$2660,$26E8,$26EA,$26EC
	dw $2660,$26EE,$2708,$2728,$0000

DATA_01B5F8:
	dw $2208,$220A,$220C,$2228,$222A,$222C

DATA_01B604:
	dw $2C0E,$2C2E,$2C48,$2C4A,$2C4C,$2C4E

DATA_01B610:
	dw DATA_01B622,$0019
	dw DATA_01B63A,$0005
	dw DATA_01B652,$005A
	dw DATA_01B63A,$0006
	dw $0000

DATA_01B622:
	dw $2860,$2904,$2906,$2926,$2900,$2902,$2860,$2922
	dw $2924,$2860,$2920,$2860

DATA_01B63A:
	dw $2946,$2948,$294A,$2940,$2942,$2944,$2960,$2962
	dw $2964,$2860,$2860,$2860

DATA_01B652:
	dw $290A,$290C,$290E,$292A,$292C,$292E,$294C,$294E
	dw $2860,$2860,$2860,$2860

DATA_01B66A:
	dw $2D66,$2D68,$0060,$0060,$0060,$0060,$0060,$0060

DATA_01B67A:
	dw $0060,$0060,$0060,$0060,$0060,$0060,$3A4A,$7A4A
	dw $3A4C,$7A4C,$3A4E,$7A4E

DATA_01B692:
	dw $26EC,$0088,$A6EC,$0088

DATA_01B69A:
	dw $A724,$6704,$6706,$6724

DATA_01B6A2:
	dw $27C0,$67C0,$0088,$0088

DATA_01B6AA:
	dw $2704,$E724,$2724,$2706

DATA_01B6B2:
	dw $26EC,$0088,$A6EC,$0088

DATA_01B6BA:
	dw $A724,$6704,$6706,$6724

DATA_01B6C2:
	dw $27C0,$67C0,$0088,$0088

DATA_01B6CA:
	dw $2704,$E724,$2724,$2706

UNK_01B6D2:
	dw DATA_01B69A,DATA_01B6CA,DATA_01B6AA,DATA_01B6BA,DATA_01B6A2,DATA_01B6C2,DATA_01B692,DATA_01B6B2

	%DATATABLE_SXAR_UnsortedDataBlock1($01B6E2)

DATA_01BA4A:
	dw $8000,$C040,$A020,$E060,$9010,$D050,$B030,$F070
	dw $8808,$C848,$A828,$E868,$9818,$D858,$B838,$F878
	dw $8404,$C444,$A424,$E464,$9414,$D454,$B434,$F474
	dw $8C0C,$CC4C,$AC2C,$EC6C,$9C1C,$DC5C,$BC3C,$FC7C
	dw $8202,$C242,$A222,$E262,$9212,$D252,$B232,$F272
	dw $8A0A,$CA4A,$AA2A,$EA6A,$9A1A,$DA5A,$BA3A,$FA7A
	dw $8606,$C646,$A626,$E666,$9616,$D656,$B636,$F676
	dw $8E0E,$CE4E,$AE2E,$EE6E,$9E1E,$DE5E,$BE3E,$FE7E
	dw $8101,$C141,$A121,$E161,$9111,$D151,$B131,$F171
	dw $8909,$C949,$A929,$E969,$9919,$D959,$B939,$F979
	dw $8505,$C545,$A525,$E565,$9515,$D555,$B535,$F575
	dw $8D0D,$CD4D,$AD2D,$ED6D,$9D1D,$DD5D,$BD3D,$FD7D
	dw $8303,$C343,$A323,$E363,$9313,$D353,$B333,$F373
	dw $8B0B,$CB4B,$AB2B,$EB6B,$9B1B,$DB5B,$BB3B,$FB7B
	dw $8707,$C747,$A727,$E767,$9717,$D757,$B737,$F777
	dw $8F0F,$CF4F,$AF2F,$EF6F,$9F1F,$DF5F,$BF3F,$FF7F

DATA_01BB4A:
	dw $2800,$2800,$2800,$2800,$2A2A,$2802,$2800,$2800
	dw $2800,$2800,$2800,$2804,$2806,$2808,$6804,$2800
	dw $2800,$2800,$2800,$280A,$280C,$680C,$680A,$2800
	dw $2800,$2800,$280E,$2820,$2822,$6822,$6820,$680E
	dw $2800,$2800,$2824,$2826,$2828,$6828,$6826,$6824
	dw $2800,$2800,$282A,$282C,$282E,$682E,$682C,$682A
	dw $2800,$2800,$2840,$2842,$2844,$6844,$6842,$6840
	dw $2800,$2800,$2800,$2846,$2848,$6848,$6846,$2800
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BBEC:
	dw $2800,$2800,$2800,$2800,$2A2A,$2802,$2800,$2800
	dw $2800,$2800,$2800,$2BA6,$2806,$2808,$6804,$2800
	dw $2800,$2800,$2800,$2BAC,$280C,$2864,$680A,$2800
	dw $2800,$2800,$2BAE,$2BC0,$2868,$6822,$6820,$680E
	dw $2800,$2800,$2BC2,$2BC4,$286C,$6828,$6826,$6824
	dw $2800,$2800,$2800,$2800,$282E,$2880,$682C,$682A
	dw $2800,$2800,$2800,$2AE6,$2844,$6844,$6842,$6840
	dw $2800,$2800,$2800,$2846,$2848,$6848,$6846,$2800
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BC8E:
	dw $2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800
	dw $2800,$2800,$2800,$2BA6,$2BA8,$2BAA,$6804,$2800
	dw $2800,$2800,$2800,$2BAC,$280C,$288C,$680A,$2800
	dw $2800,$2800,$2BAE,$2BC0,$288E,$28A0,$6820,$680E
	dw $2800,$2800,$2BC2,$2BC4,$28A2,$28A4,$6826,$6824
	dw $2800,$2800,$2800,$2800,$28A6,$28A8,$682C,$682A
	dw $2800,$2800,$2800,$2AE6,$28AC,$28AE,$28C0,$6840
	dw $2800,$2800,$2800,$2846,$2848,$6848,$6846,$2800
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BD30:
	dw $2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800
	dw $2800,$2800,$2800,$2BA6,$2BA8,$2BAA,$6804,$2800
	dw $2800,$2800,$2800,$2BAC,$28C6,$28C8,$680A,$2800
	dw $2800,$2800,$2BAE,$2BC0,$28CA,$28CC,$6820,$680E
	dw $2800,$2800,$2BC2,$2BC4,$28CE,$28E0,$6826,$6824
	dw $2800,$2800,$2800,$2800,$28E2,$28E4,$682C,$682A
	dw $2800,$2800,$2800,$2AE6,$28E8,$28EA,$28EC,$6840
	dw $2800,$2800,$2800,$2846,$2900,$2902,$2904,$2800
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BDD2:
	dw $2800,$2800,$2800,$2800,$2906,$2908,$2800,$2800
	dw $2800,$2800,$2800,$2800,$290A,$290C,$2800,$2800
	dw $2800,$2800,$2800,$290E,$2920,$2922,$2924,$2800
	dw $2800,$2800,$2926,$2928,$292A,$692A,$6928,$6926
	dw $2800,$2800,$292C,$292E,$2940,$6940,$692E,$692C
	dw $2800,$2800,$2942,$2944,$2946,$6946,$6944,$6942
	dw $2800,$2800,$2948,$294A,$294C,$694C,$694A,$6948
	dw $2800,$2800,$294E,$2960,$2A60,$6A60,$6960,$694E
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BE74:
	dw $2800,$2800,$2800,$2800,$2906,$2908,$2800,$2800
	dw $2800,$2800,$2800,$2800,$290A,$290C,$2800,$2800
	dw $2800,$2800,$0800,$2BCC,$2920,$2922,$2924,$2800
	dw $2800,$2800,$2926,$2BE2,$292A,$2962,$6928,$6926
	dw $2800,$2800,$2BE4,$2BE6,$2964,$6940,$692E,$692C
	dw $2800,$2800,$2800,$2800,$2968,$6946,$6944,$6942
	dw $2800,$2800,$2800,$2A48,$294C,$296E,$694A,$6948
	dw $2800,$2800,$2800,$2A4A,$2A60,$6A60,$6960,$694E
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BF16:
	dw $2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800
	dw $2800,$2800,$2800,$2800,$2BE8,$2BEA,$2800,$2800
	dw $2800,$2800,$0800,$2BCC,$2BCE,$2BE0,$690E,$2800
	dw $2800,$2800,$2926,$2BE2,$2980,$2982,$6928,$6926
	dw $2800,$2800,$2BE4,$2BE6,$2984,$2986,$692E,$692C
	dw $2800,$2800,$2800,$2800,$2988,$298A,$6944,$6942
	dw $2800,$2800,$2800,$2A48,$296C,$296E,$694A,$6948
	dw $2800,$2800,$2800,$2A4C,$2A8E,$2A62,$2AA2,$694E
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01BFB8:
	dw $2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800
	dw $2800,$2800,$2800,$2800,$2BE8,$2BEA,$2800,$2800
	dw $2800,$2800,$0800,$2BCC,$2BCE,$2BE0,$690E,$2800
	dw $2800,$2800,$2926,$2BE2,$2A66,$2A68,$6928,$6926
	dw $2800,$2800,$2BE4,$2BE6,$2A6A,$2A6C,$692E,$692C
	dw $2800,$2800,$2800,$2800,$2A82,$2A84,$6944,$6942
	dw $2800,$2800,$2800,$2A48,$2A86,$2A88,$694A,$6948
	dw $2800,$2800,$2800,$2BEC,$2A8E,$2AA0,$2AA2,$694E
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01C05A:
	dw $2800,$2800,$2800,$2800,$2A2A,$2802,$2800,$2800
	dw $2800,$2800,$2800,$2AA4,$2806,$2808,$6804,$2800
	dw $2AA6,$2AA8,$2AAA,$2AAC,$280C,$680C,$680A,$2800
	dw $2AAE,$2AC0,$2AC2,$2AE8,$2822,$6822,$6820,$680E
	dw $2800,$2800,$2800,$2800,$2828,$6828,$6826,$6824
	dw $2800,$2800,$2800,$2800,$282E,$682E,$682C,$682A
	dw $2800,$2800,$2800,$2AE6,$2844,$6844,$6842,$6840
	dw $2800,$2800,$2800,$2846,$2848,$6848,$6846,$2800
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01C0FC:
	dw $2800,$2800,$2800,$2800,$2A2A,$2802,$2800,$2800
	dw $2AC6,$2AC8,$2ACA,$2ACC,$2806,$2808,$6804,$2800
	dw $2800,$2ACE,$2AE2,$2AE4,$280C,$680C,$680A,$2800
	dw $2800,$2800,$2800,$2AE8,$2822,$6822,$6820,$680E
	dw $2800,$2800,$2800,$2800,$2828,$6828,$6826,$6824
	dw $2800,$2800,$2800,$2800,$282E,$682E,$682C,$682A
	dw $2800,$2800,$2800,$2AE6,$2844,$6844,$6842,$6840
	dw $2800,$2800,$2800,$2846,$2848,$6848,$6846,$2800
	dw $2800,$2800,$2800,$284A,$284C,$684C,$684A,$2800
	dw $2800,$2800,$284E,$2860,$2862,$6862,$6860,$684E
	dw $0001

DATA_01C19E:
	dw $0DCE,$0DE0,$0DE2,$0DE4,$0DE6,$0DE8,$0DEA,$0DEC
	dw $0DEE,$0E00,$0E02,$0E04,$0E06,$0E08,$0E0A,$0E0C
	dw $0E0E,$0E20,$0E22,$0E24,$0E26,$0400,$0E28,$0400
	dw $0400,$0400,$0F84,$0400,$0001

DATA_01C1D8:
	dw $0DCE,$0DE0,$0DE2,$0DE4,$0DE6,$0DE8,$0DEA,$0DEC
	dw $0DEE,$0E00,$0E02,$0E04,$0E06,$0E08,$0E0A,$0E0C
	dw $0E2A,$0E2C,$0E2E,$0E24,$0E26,$0400,$0E28,$0400
	dw $0400,$0400,$0F84,$0400,$0001

DATA_01C212:
	dw $0DCE,$0DE0,$0DE2,$0DE4,$0DE6,$0DE8,$0DEA,$0DEC
	dw $0DEE,$0E00,$0E02,$0E04,$0E06,$0E08,$0E0A,$0E0C
	dw $0E40,$0E42,$0E44,$0E24,$0E26,$0400,$0E28,$0000
	dw $0E48,$0400,$0F84,$0400,$0001

DATA_01C24C:
	dw $0DCE,$0DE0,$0DE2,$0DE4,$0DE6,$0DE8,$0DEA,$0DEC
	dw $0DEE,$0E00,$0E02,$0E04,$0E06,$0E08,$0E0A,$0E0C
	dw $0E4A,$0E4C,$0E4E,$0E24,$0E26,$0400,$0E28,$0E68
	dw $0E6A,$0400,$0F84,$0400,$0001

DATA_01C286:
	dw $0120,$0001

DATA_01C28A:
	dw $0246,$0001

DATA_01C28E:
	dw $028E,$0001

DATA_01C292:
	dw $010F,$010F,$010F,$0300,$0200,$0201,$0201,$0203
	dw $0100,$0103,$0107,$010F,$010F,$010F,$010F,$010F

DATA_01C2B2:
	dw $0404,$0404,$4040,$4040,$4040,$4040,$4141,$4141
	dw $5050,$5050,$5050,$5050,$1414,$1414,$1111,$1111
	dw $1010,$1010,$1818,$1818,$9090,$8190,$8181,$8181
	dw $8080,$8888,$8888,$8888,$8080,$0808,$0000,$0000
	dw $0404,$0404,$4040,$4040,$4040,$4040,$4242,$4242
	dw $6060,$6060,$6060,$6060,$2424,$2424,$2222,$2222
	dw $2020,$2020,$2828,$2828,$A0A0,$82A0,$8282,$8282
	dw $8080,$8888,$8888,$8888,$8080,$0808,$0000,$0000

DATA_01C332:
	dw $00A0,$00BB,$0119,$00C0,$00BB,$011B,$00A0,$00BB
	dw $011D,$00C0,$00BB,$011F,$00A0,$00BB,$0121,$00C0
	dw $00BB,$0123,$00A0,$00BB,$0125,$00C0,$00BB,$0127
	dw $00A0,$00BB,$012D,$00C0,$00BB,$012F

DATA_01C36E:
	dw $0000,$000C,$0018,$0024,$0030,$0000

table "Tables/Fonts/Credits.txt"

DATA_01C37A:
	db "PROGRESS-"
	dw $FFFF

DATA_01C385:
	db "SELECT- CHOOSE, START- PLAY"
	dw $FFFF

DATA_01C3A2:
	db "REAL NAME-",$FE
	db $FE
	db $FE
	db "OCCUPATION-",$FE
	db $FE
	db $FE
	db "GROUP AFFILIATION-",$FE
	db $FE
	db $FE
	db "SUPERHUMAN ABILITIES- ",$FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	dw $FFFF

DATA_01C3F3:
	db "REAL NAME-            ",$FE
	db "SCOTT 'SLIM' SUMMERS  ",$FE
	db "                      ",$FE
	db "OCCUPATION-           ",$FE
	db "ADVENTURER            ",$FE
	db "                      ",$FE
	db "GROUP AFFILIATION-    ",$FE
	db "X-MEN                 ",$FE
	db "                      ",$FE
	db "SUPERHUMAN ABILITIES- ",$FE
	db "THE  POWER  TO PROJECT",$FE
	db "A BEAM OF RUBY-COLORED",$FE
	db "CONCUSSIVE FORCE  FROM",$FE
	db "HIS EYES. HE IS UNABLE",$FE
	db "TO CONTROL  THIS  BEAM",$FE
	db "PROPERLY  WITHOUT  THE",$FE
	db "USE OF  A  VISOR  MADE",$FE
	db "FROM RUBY QUARTZ.     ",$FE
	dw $FFFF

DATA_01C593:
	db "REAL NAME-            ",$FE
	db "PETER PARKER          ",$FE
	db "                      ",$FE
	db "OCCUPATION-           ",$FE
	db "FREELANCE PHOTOGRAPHER",$FE
	db "                      ",$FE
	db "GROUP AFFILIATION-    ",$FE
	db "NONE                  ",$FE
	db "                      ",$FE
	db "SUPERHUMAN ABILITIES- ",$FE
	db "SUPER STRENGTH,BALANCE",$FE
	db "AND REFLEXES, AND  THE",$FE
	db "ABILITY TO CAUSE PARTS",$FE
	db "OF  HIS  BODY TO STICK",$FE
	db "TO MOST SURFACES.  HAS",$FE
	db "PREMONITIONAL 'SPIDER-",$FE
	db "SENSE'.  ALSO USES HIS",$FE
	db "TRUSTY 'WEB-SHOOTERS'.",$FE
	dw $FFFF

DATA_01C733:
	db "REAL NAME-            ",$FE
	db "LOGAN                 ",$FE
	db "                      ",$FE
	db "OCCUPATION-           ",$FE
	db "ADVENTURER            ",$FE
	db "                      ",$FE
	db "GROUP AFFILIATION-    ",$FE
	db "X-MEN                 ",$FE
	db "                      ",$FE
	db "SUPERHUMAN ABILITIES- ",$FE
	db "POSSESSES THE POWER OF",$FE
	db "SELF-HEALING     WHICH",$FE
	db "REGENERATES    DAMAGED",$FE
	db "TISSUE AT GREAT SPEED.",$FE
	db "UNBREAKABLE ADAMANTIUM",$FE
	db "CLAWS   AND   INTERNAL",$FE
	db "SKELETAL SUPPORT MAKES",$FE
	db "HIM INCREDIBLY TOUGH. ",$FE
	dw $FFFF

DATA_01C8D3:
	db "REAL NAME-            ",$FE
	db "ORORO MUNROE          ",$FE
	db "                      ",$FE
	db "OCCUPATION-           ",$FE
	db "ADVENTURER            ",$FE
	db "                      ",$FE
	db "GROUP AFFILIATION-    ",$FE
	db "X-MEN                 ",$FE
	db "                      ",$FE
	db "SUPERHUMAN ABILITIES- ",$FE
	db "SHE  HAS  CONTROL OVER",$FE
	db "MANIFESTATIONS      OF",$FE
	db "WEATHER - FOR EXAMPLE,",$FE
	db "SHE  CAN CREATE  BOLTS",$FE
	db "OF LIGHTNING, OR CAUSE",$FE
	db "WHIRLWINDS  TO  APPEAR",$FE
	db "AROUND HER.           ",$FE
	db "                      ",$FE
	dw $FFFF

DATA_01CA73:
	db "REAL NAME-            ",$FE
	db "REMY BEAUDREAUX       ",$FE
	db "                      ",$FE
	db "OCCUPATION-           ",$FE
	db "ADVENTURER            ",$FE
	db "                      ",$FE
	db "GROUP AFFILIATION-    ",$FE
	db "X-MEN                 ",$FE
	db "                      ",$FE
	db "SUPERHUMAN ABILITIES- ",$FE
	db "POSESSES THE  POWER TO",$FE
	db "CHARGE ANY OBJECT WITH",$FE
	db "KINETIC ENERGY. WHEN A",$FE
	db "CHARGED OBJECT IMPACTS",$FE
	db "AFTER BEING THROWN, IT",$FE
	db "WILL EXPLODE.   GAMBIT",$FE
	db "USES A PACK OF PLAYING",$FE
	db "CARDS FOR AMMUNITION. ",$FE
	dw $FFFF

DATA_01CC13:
	dw $0000,DATA_01C3F3,DATA_01C733,DATA_01C593,DATA_01CA73,DATA_01C8D3

DATA_01CC1F:
	dw $0000,DATA_01CC2B,DATA_01CC3B,DATA_01CC6B,DATA_01CC5B,DATA_01CC4B

DATA_01CC2B:
	db $81,$06,$02,$82,$C0
	db " CYCLOPS  ",$80

DATA_01CC3B:
	db $81,$07,$02,$82,$C0
	db "WOLVERINE ",$80

DATA_01CC4B:
	db $81,$06,$02,$82,$C0
	db "  STORM   ",$80

DATA_01CC5B:
	db $81,$06,$02,$82,$C0
	db "  GAMBIT  ",$80

DATA_01CC6B:
	db $81,$06,$02,$82,$C0
	db "SPIDER@MAN",$80

cleartable

DATA_01CC7B:
	db $00,$00,$00,$00
	db $01,$00,$00,$00
	db $00,$01,$00,$00
	db $00,$00,$01,$00
	db $00,$00,$00,$01
	db $01,$01,$00,$00
	db $00,$00,$01,$01
	db $01,$00,$01,$00
	db $00,$01,$00,$01
	db $00,$01,$01,$00
	db $01,$00,$00,$01
	db $01,$01,$01,$00
	db $01,$01,$00,$01
	db $00,$01,$01,$01
	db $01,$00,$01,$01
	db $01,$01,$01,$01
	db $00,$00,$00,$00
	db $02,$00,$00,$00
	db $00,$02,$00,$00
	db $00,$00,$02,$00
	db $00,$00,$00,$02
	db $02,$02,$00,$00
	db $00,$00,$02,$02
	db $02,$00,$02,$00
	db $00,$02,$00,$02
	db $00,$02,$02,$00
	db $02,$00,$00,$02
	db $02,$02,$02,$00
	db $02,$02,$00,$02
	db $00,$02,$02,$02
	db $02,$00,$02,$02
	db $02,$02,$02,$02
	db $00,$00,$00,$00
	db $03,$00,$00,$00
	db $00,$03,$00,$00
	db $00,$00,$03,$00
	db $00,$00,$00,$03
	db $03,$03,$00,$00
	db $00,$00,$03,$03
	db $03,$00,$03,$00
	db $00,$03,$00,$03
	db $00,$03,$03,$00
	db $03,$00,$00,$03
	db $03,$03,$03,$00
	db $03,$03,$00,$03
	db $00,$03,$03,$03
	db $03,$00,$03,$03
	db $03,$03,$03,$03
	db $00,$00,$00,$00
	db $08,$00,$00,$00
	db $00,$08,$00,$00
	db $00,$00,$05,$00
	db $00,$00,$00,$09
	db $08,$04,$00,$00
	db $00,$00,$08,$09
	db $09,$00,$03,$00
	db $00,$08,$00,$09
	db $00,$09,$09,$00
	db $05,$00,$00,$05
	db $08,$08,$08,$00
	db $08,$08,$00,$08
	db $08,$09,$09,$00
	db $05,$04,$00,$05
	db $08,$04,$09,$05
	db $00,$00,$00,$00
	db $10,$00,$00,$00
	db $00,$10,$00,$00
	db $00,$00,$10,$00
	db $00,$00,$00,$10
	db $10,$10,$00,$00
	db $00,$00,$10,$10
	db $10,$00,$10,$00
	db $00,$10,$00,$10
	db $00,$10,$10,$00
	db $10,$00,$00,$10
	db $10,$10,$10,$00
	db $10,$10,$00,$10
	db $00,$10,$10,$10
	db $10,$00,$10,$10
	db $10,$10,$10,$10
	db $00,$00,$00,$00
	db $11,$00,$00,$00
	db $00,$11,$00,$00
	db $00,$00,$11,$00
	db $00,$00,$00,$11
	db $11,$11,$00,$00
	db $00,$00,$11,$11
	db $11,$00,$11,$00
	db $00,$11,$00,$11
	db $00,$11,$11,$00
	db $11,$00,$00,$11
	db $11,$11,$11,$00
	db $11,$11,$00,$11
	db $00,$11,$11,$11
	db $11,$00,$11,$11
	db $11,$11,$11,$11
	db $00,$00,$00,$00
	db $03,$00,$00,$00
	db $00,$03,$00,$00
	db $00,$00,$02,$00
	db $00,$00,$00,$02
	db $03,$03,$00,$00
	db $00,$00,$02,$02
	db $03,$00,$02,$00
	db $00,$03,$00,$02
	db $00,$03,$02,$00
	db $03,$00,$00,$02
	db $03,$03,$02,$00
	db $03,$03,$00,$02
	db $00,$03,$02,$02
	db $03,$00,$02,$02
	db $03,$03,$02,$02
	db $00,$00,$00,$00
	db $83,$00,$00,$00
	db $00,$83,$00,$00
	db $00,$00,$83,$00
	db $00,$00,$00,$83
	db $83,$83,$00,$00
	db $00,$00,$83,$83
	db $83,$00,$83,$00
	db $00,$83,$00,$83
	db $00,$83,$83,$00
	db $83,$00,$00,$83
	db $83,$83,$83,$00
	db $83,$83,$00,$83
	db $00,$83,$83,$83
	db $83,$00,$83,$83
	db $83,$83,$83,$83

DATA_01CE7B:
	dw $0000,DATA_0382DC,DATA_0382DC,DATA_0383DC,DATA_0384DC,DATA_0385DC,DATA_0385DC
	dw $5555,$5554,$5555,$D555,$5D55,$55D5,DATA_0383DC,$0000
	dw DATA_0386DC,DATA_0386DC

DATA_01CE9D:
	dw DATA_01CEBB,DATA_01CEC7,DATA_01CED3,DATA_01CEDF,DATA_01CEEB,DATA_01CEF7,$0000

DATA_01CEAB:
	dw DATA_01CF03,DATA_01CF0D,DATA_01CF17,DATA_01CF21,DATA_01CF2B,$0000

DATA_01CEB7:
	dw $0005,$0004

DATA_01CEBB:
	dw DATA_01CF41,DATA_01CF47,DATA_01CF4D,DATA_01CF53,DATA_01CF59,$0000

DATA_01CEC7:
	dw DATA_01CF3B,DATA_01CF47,DATA_01CF4D,DATA_01CF53,DATA_01CF59,$0000

DATA_01CED3:
	dw DATA_01CF3B,DATA_01CF41,DATA_01CF4D,DATA_01CF53,DATA_01CF59,$0000

DATA_01CEDF:
	dw DATA_01CF3B,DATA_01CF41,DATA_01CF47,DATA_01CF53,DATA_01CF59,$0000

DATA_01CEEB:
	dw DATA_01CF3B,DATA_01CF41,DATA_01CF47,DATA_01CF4D,DATA_01CF59,$0000

DATA_01CEF7:
	dw DATA_01CF3B,DATA_01CF41,DATA_01CF47,DATA_01CF4D,DATA_01CF53,$0000

DATA_01CF03:
	dw DATA_01CF6B,DATA_01CF7D,DATA_01CF83,DATA_01CF89,$0000

DATA_01CF0D:
	dw DATA_01CF65,DATA_01CF7D,DATA_01CF83,DATA_01CF89,$0000

DATA_01CF17:
	dw DATA_01CF65,DATA_01CF6B,DATA_01CF83,DATA_01CF89,$0000

DATA_01CF21:
	dw DATA_01CF65,DATA_01CF6B,DATA_01CF7D,DATA_01CF89,$0000

DATA_01CF2B:
	dw DATA_01CF65,DATA_01CF6B,DATA_01CF7D,DATA_01CF83,$0000

UNK_01CF35:
	dw $5555,$5571,$7555

DATA_01CF3B:
	dw $001C,$0009,$0004

DATA_01CF41:
	dw $000F,$0006,$0240

DATA_01CF47:
	dw $000F,$0006,$025E

DATA_01CF4D:
	dw $0010,$000A,$03C0

DATA_01CF53:
	dw $0004,$000A,$03E0

DATA_01CF59:
	dw $000C,$000A,$03E8,$175D,$5D57,$5DD5

DATA_01CF65:
	dw $000A,$000F,$0000

DATA_01CF6B:
	dw $0013,$000F,$0014,$000A,$0006,$0240,$0014,$0006
	dw $0254

DATA_01CF7D:
	dw $000C,$000A,$03C0

DATA_01CF83:
	dw $0009,$000A,$03D8

DATA_01CF89:
	dw $0009,$000A,$03EA

DATA_01CF8F:
	dw $0400,$0400,$08AC,$0400,$08A6,$08AE,$08C0,$08A6
	dw $08A2,$08C2,$08C4,$08C6,$08C8,$08CA,$08CC,$08CE
	dw $08E0,$0400,$0400,$08E2,$0000,$0000,$0000,$0000

DATA_01CFBF:
	dw $0400,$0400,$08AC,$0400,$08A6,$08E4,$08E6,$08A6
	dw $08A6,$08E8,$08EA,$08EC,$08A6,$08EE,$0900,$0902
	dw $08E0,$0400,$0400,$08E2,$0000,$0000,$0000,$0000

DATA_01CFEF:
	dw $7FCC00,$7FD000,$7FD400,$7FD800

DATA_01CFF7:
	dw $6800,$6A00,$6C00,$6E00

DATA_01CFFF:
	dw $0005,$0004

DATA_01D003:
	dw DATA_01D007,DATA_01D0F3

table "Tables/Fonts/ArcadeText.txt"

DATA_01D007:
	db "WELCOME ONE AND",$FE
	db "  WELCOME ALL. "
	db $FE
	db $FE
	dw $FFFF
	db "I'M SO GLAD YOU",$FE
	db "COULD  MAKE IT,",$FE
	db "  SPIDER-MAN.  ",$FE
	dw $FFFF
	db " YOUR PRESENCE ",$FE
	db "HERE IS A BONUS",$FE
	db " I DIDN'T PLAN.",$FE
	dw $FFFF
	db " STILL, THERE'S",$FE
	db "PLENTY  OF  FUN",$FE
	db " FOR EVERYONE, ",$FE
	dw $FFFF
	db "LET  THE  GAMES",$FE
	db "    BEGIN...   ",$FE
	db "               ",$FE
	db $FE
	dw $FFFF

DATA_01D0F3:
	db "WELL DONE.  YOU",$FE
	db " HAVE EXCELLED",$FE
	db "  YOURSELVES.",$FE
	dw $FFFF
	db "OBVIOUSLY  THAT",$FE
	db "WASN'T ME- MORE",$FE
	db " OF MY ROBOTS. ",$FE
	dw $FFFF
	db " NOW I'VE GOT  ",$FE
	db "JUST  ONE  MORE",$FE
	db "   SURPRISE.   ",$FE
	dw $FFFF
	db "I'LL GIVE YOU A",$FE
	db "CLUE. 5..4..3..",$FE
	db "               ",$FE
	dw $FFFF

cleartable

DATA_01D1B8:
	dw $FFEE,$FFF2,$FFF8,$FFFC,$0004,$0008,$000E,$0012

DATA_01D1C8:
	dw $0090,$008E,$0048,$004C

DATA_01D1D0:
	dw $2108,$3DEF,$5EF7,$6F7B,$6F7B,$2108,$3DEF,$5EF7
	dw $5EF7,$6F7B,$2108,$3DEF,$3DEF,$5EF7,$6F7B,$2108
	dw $FFFE,$FFFE,$FFFE,$FFFE,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001
	dw $0001,$0001,$0001,$0001,$0002,$0002,$0002,$0002

DATA_01D230:
	dw $FFF8,$FFF8,$FFF8,$FFF8,$0000,$0004,$FFFC,$FFFC
	dw $0000,$0004,$0004,$0000,$FFFE,$FFFE,$0000,$0002
	dw $0002,$0000,$FFFE,$FFFE,$0008,$0008,$0008,$0008
	dw $0008,$0008,$0008,$0008,$0004,$0004,$0004,$0004
	dw $0008,$0008,$0008,$0008,$0008,$0008,$0000,$000C
	dw $000E

DATA_01D282:
	dw $0004,$FFFC,$0004,$FFFC,$0006,$FFFA,$0000,$0000

DATA_01D292:
	dw $FFFC,$FFFC,$0004,$0004,$0000,$0000,$FFFA,$0006

DATA_01D2A2:
	dw $0004,$000C,$FFFC,$FFF4,$0008,$0008,$FFF8,$FFF8

DATA_01D2B2:
	dw $FFF4,$0004,$000C,$FFFC,$FFF8,$0008,$0008,$FFF8

DATA_01D2C2:
	dw $0003,$FFFD,$0006,$FFFA,$0004,$FFFC,$0004,$FFFC

DATA_01D2D2:
	dw $FFFA,$0006,$0002,$FFFE,$FFFC,$0004,$0004,$FFFC

DATA_01D2E2:
	db $00,$24,$47,$6A,$8B,$AB,$C8,$E2,$F8,$0B,$19,$23,$28,$26,$1F,$11
	db $FB,$DE,$BA,$8C,$56,$17,$CE,$7A,$1C,$B4,$3F,$BF,$33,$9B,$F5,$42
	db $82,$B4,$D7,$EC,$F2,$E8,$CF,$A6,$6D,$24,$CA,$5F,$E2,$55,$B5,$04
	db $41,$6C,$84,$8A,$7D,$5D,$29,$E3,$8A,$1D,$9D,$09,$62,$A7,$D8,$F6
	db $FF,$F6,$D8,$A7,$62,$09,$9D,$1D,$8A,$E3,$29,$5D,$7D,$8A,$84,$6C
	db $41,$04,$B5,$55,$E2,$5F,$CA,$24,$6D,$A6,$CF,$E8,$F2,$EC,$D7,$B4
	db $82,$42,$F5,$9B,$33,$BF,$3F,$B4,$1C,$7A,$CE,$17,$56,$8C,$BA,$DE
	db $FB,$11,$1F,$26,$28,$23,$19,$0B,$F8,$E2,$C8,$AB,$8B,$6A,$47,$24
	db $00,$DB,$B8,$95,$74,$54,$37,$1D,$07,$F4,$E6,$DC,$D7,$D9,$E0,$EE
	db $04,$21,$45,$73,$A9,$E8,$31,$85,$E3,$4B,$C0,$40,$CC,$64,$0A,$BD
	db $7D,$4B,$28,$13,$0D,$17,$30,$59,$92,$DB,$35,$A0,$1D,$AA,$4A,$FB
	db $BE,$93,$7B,$75,$82,$A2,$D6,$1C,$75,$E2,$62,$F6,$9D,$58,$27,$09
	db $00,$09,$27,$58,$9D,$F6,$62,$E2,$75,$1C,$D6,$A2,$82,$75,$7B,$93
	db $BE,$FB,$4A,$AA,$1D,$A0,$35,$DB,$92,$59,$30,$17,$0D,$13,$28,$4B
	db $7D,$BD,$0A,$64,$CC,$40,$C0,$4B,$E3,$85,$31,$E8,$A9,$73,$45,$21
	db $04,$EE,$E0,$D9,$D7,$DC,$E6,$F4,$07,$1D,$37,$54,$74,$95,$B8,$DC

DATA_01D3E2:
	db $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1C,$1F,$22,$25,$28,$2B,$2E
	db $30,$33,$36,$39,$3C,$3F,$41,$44,$47,$49,$4C,$4E,$51,$53,$55,$58
	db $5A,$5C,$5E,$60,$62,$64,$66,$68,$6A,$6C,$6D,$6F,$70,$72,$73,$75
	db $76,$77,$78,$79,$7A,$7B,$7C,$7C,$7D,$7E,$7E,$7F,$7F,$7F,$7F,$7F
	db $7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7A,$79,$78,$77
	db $76,$75,$73,$72,$70,$6F,$6D,$6C,$6A,$68,$66,$64,$62,$60,$5E,$5C
	db $5A,$58,$55,$53,$51,$4E,$4C,$49,$47,$44,$41,$3F,$3C,$39,$36,$33
	db $30,$2E,$2B,$28,$25,$22,$1F,$1C,$18,$15,$12,$0F,$0C,$09,$06,$03
	db $00,$FC,$F9,$F6,$F3,$F0,$ED,$EA,$E7,$E3,$E0,$DD,$DA,$D7,$D4,$D1
	db $CF,$CC,$C9,$C6,$C3,$C0,$BE,$BB,$B8,$B6,$B3,$B1,$AE,$AC,$AA,$A7
	db $A5,$A3,$A1,$9F,$9D,$9B,$99,$97,$95,$93,$92,$90,$8F,$8D,$8C,$8A
	db $89,$88,$87,$86,$85,$84,$83,$83,$82,$81,$81,$80,$80,$80,$80,$80
	db $80,$80,$80,$80,$80,$80,$81,$81,$82,$83,$83,$84,$85,$86,$87,$88
	db $89,$8A,$8C,$8D,$8F,$90,$92,$93,$95,$97,$99,$9B,$9D,$9F,$A1,$A3
	db $A5,$A7,$AA,$AC,$AE,$B1,$B3,$B6,$B8,$BB,$BE,$C0,$C3,$C6,$C9,$CC
	db $CF,$D1,$D4,$D7,$DA,$DD,$E0,$E3,$E7,$EA,$ED,$F0,$F3,$F6,$F9,$FC

table "Tables/Fonts/Credits.txt"

DATA_01D4E2:
	db $81,$21,$0A
	db "GAMEOVER",$80

DATA_01D4EE:
	dw $0000,DATA_01D510,DATA_01D510,DATA_01D527,DATA_01D527,DATA_01D540,DATA_01D540
	dw $4455,$5646,$5555,$5555,$5555,$1754,DATA_01D527,DATA_01D510
	dw DATA_01D527,DATA_01D540

DATA_01D510:
	db $82,$C0,$81,$0B,$0A
	db "GET READY"
	db $81,$0B,$0E
	db "STORM",$80

DATA_01D527:
	db $82,$C0,$81,$0B,$0A
	db "GET READY"
	db $81,$0B,$0E
	db "CYCLOPS",$80

DATA_01D540:
	db $82,$C0,$81,$0B,$0A
	db "GET READY"
	db $81,$0B,$0E
	db "WOLVERINE",$80

DATA_01D55B:
	dw $0000,DATA_01D577,DATA_01D577,DATA_01D58F,DATA_01D58F,DATA_01D5A9,DATA_01D5A9,DATA_01D5DE
	dw DATA_01D5DE,DATA_01D5DE,DATA_01D5DE,DATA_01D5C5,DATA_01D5C5,DATA_01D58F

DATA_01D577:
	db $82,$C0,$81,$0B,$09
	db "WELL DONE"
	db $81,$0B,$0D
	db "STORM!",$80

DATA_01D58F:
	db $82,$C0,$81,$0B,$09
	db "WELL DONE"
	db $81,$0B,$0D
	db "CYCLOPS!",$80

DATA_01D5A9:
	db $82,$C0,$81,$0B,$09
	db "WELL DONE"
	db $81,$0B,$0D
	db "WOLVERINE!",$80

DATA_01D5C5:
	db $82,$C0,$81,$0B,$09
	db "WELL DONE"
	db $81,$0B,$0D
	db "GAMBIT!",$80

DATA_01D5DE:
	db $82,$C0,$81,$0B,$09
	db "WELL DONE"
	db $81,$0B,$0D
	db "SPIDEY!",$80

cleartable

DATA_01D5F7:
	dw $3B00,$3B02,$3B04,$3B06,$3B08,$3B0A,$3B0C,$3B0E
	dw $3B20,$3B22,$3B24,$3B26,$3B28,$3B2A,$3B2C,$3B2E
	dw $3B40,$3B42,$3B44,$3B46,$3B48,$3B4A,$3B4C,$3B4E
	dw $3B60,$3B62,$3B64,$3B66,$3B68,$3B6A,$3B6C,$3B6E
	dw $3B80,$3B82,$3B84,$3B86,$3B88,$3B8A,$3B8C,$3B8E
	dw $3BA0,$3BA2,$3BA4,$3BA6,$3BA8,$3BAA,$3BAC,$3BAE
	dw $3F00,$3F02,$3F04,$3F06,$3F08,$3F0A,$3F0C,$3F0E
	dw $3F20,$3F22,$3F24,$3F26,$3F28,$3F2A,$3F2C,$3F2E
	dw $3F40,$3F42,$3F44,$3F46,$3F48,$3F4A,$3F4C,$3F4E
	dw $3F60,$3F62,$3F64,$3F66,$3F68,$3F6A,$3F6C,$3F6E
	dw $3F80,$3F82,$3F84,$3F86,$3F88,$3F8A,$3F8C,$3F8E
	dw $3FA0,$3FA2,$3FA4,$3FA6,$3FA8,$3FAA,$3FAC,$3FAE
	dw $3100,$3102,$3104,$3106,$3108,$310A,$310C,$310E
	dw $3120,$3122,$3124,$3126,$3128,$312A,$312C,$312E
	dw $3140,$3142,$3144,$3146,$3148,$314A,$314C,$314E
	dw $3160,$3162,$3164,$3166,$3168,$316A,$316C,$316E
	dw $3180,$3182,$3184,$3186,$3188,$318A,$318C,$318E
	dw $31A0,$31A2,$31A4,$31A6,$31A8,$31AA,$31AC,$31AE

DATA_01D717:
	dw DATA_01D5F7+$0000,DATA_01D5F7+$0002,DATA_01D5F7+$0004,DATA_01D5F7+$0006,DATA_01D5F7+$0008,DATA_01D5F7+$000A,DATA_01D5F7+$000C,DATA_01D5F7+$000E
	dw DATA_01D5F7+$0010,DATA_01D5F7+$0012,DATA_01D5F7+$0014,DATA_01D5F7+$0016,DATA_01D5F7+$0018,DATA_01D5F7+$001A,DATA_01D5F7+$001C,DATA_01D5F7+$001E
	dw DATA_01D5F7+$0020,DATA_01D5F7+$0022,DATA_01D5F7+$0024,DATA_01D5F7+$0026,DATA_01D5F7+$0028,DATA_01D5F7+$002A,DATA_01D5F7+$002C,DATA_01D5F7+$002E
	dw DATA_01D5F7+$0030,DATA_01D5F7+$0032,DATA_01D5F7+$0034,DATA_01D5F7+$0036,DATA_01D5F7+$0038,DATA_01D5F7+$003A,DATA_01D5F7+$003C,DATA_01D5F7+$003E
	dw DATA_01D5F7+$0040,DATA_01D5F7+$0042,DATA_01D5F7+$0044,DATA_01D5F7+$0046,DATA_01D5F7+$0048,DATA_01D5F7+$004A,DATA_01D5F7+$004C,DATA_01D5F7+$004E
	dw DATA_01D5F7+$0050,DATA_01D5F7+$0052,DATA_01D5F7+$0054,DATA_01D5F7+$0056,DATA_01D5F7+$0058,DATA_01D5F7+$005A,DATA_01D5F7+$005C,DATA_01D5F7+$005E
	dw DATA_01D5F7+$0060,DATA_01D5F7+$0062,DATA_01D5F7+$0064,DATA_01D5F7+$0066,DATA_01D5F7+$0068,DATA_01D5F7+$006A,DATA_01D5F7+$006C,DATA_01D5F7+$006E
	dw DATA_01D5F7+$0070,DATA_01D5F7+$0072,DATA_01D5F7+$0074,DATA_01D5F7+$0076,DATA_01D5F7+$0078,DATA_01D5F7+$007A,DATA_01D5F7+$007C,DATA_01D5F7+$007E
	dw DATA_01D5F7+$0080,DATA_01D5F7+$0082,DATA_01D5F7+$0084,DATA_01D5F7+$0086,DATA_01D5F7+$0088,DATA_01D5F7+$008A,DATA_01D5F7+$008C,DATA_01D5F7+$008E
	dw DATA_01D5F7+$0090,DATA_01D5F7+$0092,DATA_01D5F7+$0094,DATA_01D5F7+$0096,DATA_01D5F7+$0098,DATA_01D5F7+$009A,DATA_01D5F7+$009C,DATA_01D5F7+$009E
	dw DATA_01D5F7+$00A0,DATA_01D5F7+$00A2,DATA_01D5F7+$00A4,DATA_01D5F7+$00A6,DATA_01D5F7+$00A8,DATA_01D5F7+$00AA,DATA_01D5F7+$00AC,DATA_01D5F7+$00AE
	dw DATA_01D5F7+$00B0,DATA_01D5F7+$00B2,DATA_01D5F7+$00B4,DATA_01D5F7+$00B6,DATA_01D5F7+$00B8,DATA_01D5F7+$00BA,DATA_01D5F7+$00BC,DATA_01D5F7+$00BE
	dw DATA_01D5F7+$00C0,DATA_01D5F7+$00C2,DATA_01D5F7+$00C4,DATA_01D5F7+$00C6,DATA_01D5F7+$00C8,DATA_01D5F7+$00CA,DATA_01D5F7+$00CC,DATA_01D5F7+$00CE
	dw DATA_01D5F7+$00D0,DATA_01D5F7+$00D2,DATA_01D5F7+$00D4,DATA_01D5F7+$00D6,DATA_01D5F7+$00D8,DATA_01D5F7+$00DA,DATA_01D5F7+$00DC,DATA_01D5F7+$00DE
	dw DATA_01D5F7+$00E0,DATA_01D5F7+$00E2,DATA_01D5F7+$00E4,DATA_01D5F7+$00E6,DATA_01D5F7+$00E8,DATA_01D5F7+$00EA,DATA_01D5F7+$00EC,DATA_01D5F7+$00EE
	dw DATA_01D5F7+$00F0,DATA_01D5F7+$00F2,DATA_01D5F7+$00F4,DATA_01D5F7+$00F6,DATA_01D5F7+$00F8,DATA_01D5F7+$00FA,DATA_01D5F7+$00FC,DATA_01D5F7+$00FE
	dw DATA_01D5F7+$0100,DATA_01D5F7+$0102,DATA_01D5F7+$0104,DATA_01D5F7+$0106,DATA_01D5F7+$0108,DATA_01D5F7+$010A,DATA_01D5F7+$010C,DATA_01D5F7+$010E
	dw DATA_01D5F7+$0110,DATA_01D5F7+$0112,DATA_01D5F7+$0114,DATA_01D5F7+$0116,DATA_01D5F7+$0118,DATA_01D5F7+$011A,DATA_01D5F7+$011C,DATA_01D5F7+$011E
	dw DATA_01D5F7+$0120,DATA_01D5F7+$0122,DATA_01D5F7+$0124,DATA_01D5F7+$0126,DATA_01D5F7+$0128,DATA_01D5F7+$012A,DATA_01D5F7+$012C,DATA_01D5F7+$012E
	dw DATA_01D5F7+$0130,DATA_01D5F7+$0132,DATA_01D5F7+$0134,DATA_01D5F7+$0136,DATA_01D5F7+$0138,DATA_01D5F7+$013A,DATA_01D5F7+$013C,DATA_01D5F7+$013E
	dw DATA_01D5F7+$0140,DATA_01D5F7+$0142,DATA_01D5F7+$0144,DATA_01D5F7+$0146,DATA_01D5F7+$0148,DATA_01D5F7+$014A,DATA_01D5F7+$014C,DATA_01D5F7+$014E
	dw DATA_01D5F7+$0150,DATA_01D5F7+$0152,DATA_01D5F7+$0154,DATA_01D5F7+$0156,DATA_01D5F7+$0158,DATA_01D5F7+$015A,DATA_01D5F7+$015C,DATA_01D5F7+$015E
	dw DATA_01D5F7+$0160,DATA_01D5F7+$0162,DATA_01D5F7+$0164,DATA_01D5F7+$0166,DATA_01D5F7+$0168,DATA_01D5F7+$016A,DATA_01D5F7+$016C,DATA_01D5F7+$016E
	dw DATA_01D5F7+$0170,DATA_01D5F7+$0172,DATA_01D5F7+$0174,DATA_01D5F7+$0176,DATA_01D5F7+$0178,DATA_01D5F7+$017A,DATA_01D5F7+$017C,DATA_01D5F7+$017E

DATA_01D897:
	dw $0000,$FFD8,$FFD8,$FFD8,$0000,$0028,$0028,$0028

DATA_01D8A7:
	dw $FFD0,$FFF0,$0000,$0010,$0030,$0010,$0000,$FFF0

DATA_01D8B7:
	dw $0030,$FFF8,$FFD0,$FFF8,$0030,$FFF8,$FFD0,$FFF8

DATA_01D8C7:
	dw $0000,$0030,$0000,$0030,$0000,$FFD0,$0000,$FFD0

table "Tables/Fonts/SplashScreen.txt"

DATA_01D8D7:
	db $81 : dw $3330							;\ Note: Unused. This gets overwritten by the first line of text on the splash screen.
	db "------MNOPQRSTUVWXYZ,.!-@",$2A,$2B,"'&",$2E,"--"			;/
	db $81 : dw $3330
	db "       SPIDER-MAN",$2E," X-MEN",$2E,"       "
	db $81 : dw $3430
	db "       ARCADE'S  REVENGE",$2E,"       "
	db $81 : dw $3630
	db "         @1992 LJN, LTD.        "
	db $81 : dw $3930
	db "        ",$2E," & @ 1992 MARVEL"
	db $81 : dw $3A30
	db "    ENTERTAINMENT GROUP, INC."
	db $81 : dw $3C30
	db "       ALL RIGHTS RESERVED."
	db $81 : dw $4030
	db "          PROGRAMMED BY         "
	db $81 : dw $4830
	db "           LICENSED  BY         "
	db $81 : dw $4A30
	db "             NINTENDO           "
	db $80

cleartable

DATA_01DA27:
	db $80,$00,$00,$F8,$FF,$FC,$FF,$FE,$FF,$F0,$FF,$10,$00,$02,$00,$04
	db $00,$08,$00,$10,$00,$02,$00,$04,$00,$08,$00,$F8,$FF,$FC,$FF,$FE
	db $FF,$F0,$FF

DATA_01DA4A:
	db $00,$06,$0D,$13,$19,$1F,$26,$2C,$32,$38,$3E,$44,$4A,$50,$56,$5C
	db $62,$68,$6D,$73,$79,$7E,$84,$89,$8E,$93,$98,$9D,$A2,$A7,$AC,$B1
	db $B5,$B9,$BE,$C2,$C6,$CA,$CE,$D1,$D5,$D8,$DC,$DF,$E2,$E5,$E7,$EA
	db $ED,$EF,$F1,$F3,$F5,$F7,$F8,$FA,$FB,$FC,$FD,$FE,$FE,$FF,$FF,$FF
	db $81,$00,$00,$00,$80,$82,$14,$81,$00,$1E,$2D,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$82,$1C,$81,$00,$1E,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$81,$06,$1E,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$81,$04,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$81,$04,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$81,$0C,$1E,$00,$00,$00,$00,$00,$00,$80

DATA_01DAE6:
	dw $1000,$5000,$9000,$D000

DATA_01DAEE:
	dw $0000,$0001,$0002,$0003,$0004,$0003,$0002,$0001

DATA_01DAFE:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0005
	dw $0006,$0007,$0008,$0009,$000A,$0000,$000B,$0000
	dw $0000,$000C,$000D

DATA_01DB24:
	dw $FFF8,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $FFF8,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $FFF8,$0000

DATA_01DB68:
	dw $FFD9,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$FFE4,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $FFE4,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $FFE7,$FFE1,$FFFD,$FFD9,$0003,$FFD9,$FFFB,$FFE4
	dw $0005,$FFE4,$FFED,$FFE5,$0013,$FFE5,$FFED,$FFE5
	dw $0013,$FFE5

DATA_01DBCC:
	dw $0008,$0008,$0008,$0008,$0008,$0008,$0008,$0008
	dw $0000,$0000,$0008,$0000,$0008,$0009,$000A,$000B
	dw $0000

DATA_01DBEE:
	dw $3400,$3480,$3500,$3580,$4000,$4080,$4100,$4180
	dw $4C00,$4C80,$4D00,$4D80,$5800,$5880,$5900,$5980
	dw $6400,$6480,$6500,$6580,$7000,$7080,$7100,$7180
	dw $7C00,$7C80,$7D00,$7D80,$8800,$8880,$8900,$8980
	dw $9400,$9480,$9500,$9580,$A000,$A080,$A100,$A180
	dw $AC00,$AC80,$AD00,$AD80

DATA_01DC46:
	dw $3400,$3500,$3C00,$3D00,$4400,$4500,$4C00,$4D00
	dw $5400,$5500,$5C00,$5D00

DATA_01DC5E:
	dw $9400,$9480,$9500,$9580,$A000,$A080,$A100,$A180
	dw $AC00,$AC80,$AD00,$AD80,$B800,$B880,$B900,$B980
	dw $C400,$C480,$C500,$C580,$D000,$D080,$D100,$D180
	dw $DC00,$DC80,$DD00,$DD80,$E800,$E880,$E900,$E980
	dw $F400,$F480,$F500,$F580,$0000,$0080,$0100,$0180
	dw $0C00,$0C80,$0D00,$0D80

DATA_01DCB6:
	dw $0000,$0000
	dw DATA_01DCE2,DATA_01DE40
	dw DATA_01DD22,DATA_01DE40
	dw DATA_01DD5A,DATA_01DE40
	dw DATA_01DE04,DATA_01DE40
	dw DATA_01DDCA,DATA_01DDEC
	dw $0000,$0000
	dw $0000,$0000
	dw DATA_01DE34,DATA_01DE40
	dw DATA_01DDE2,DATA_01DE40
	dw $0000,$0000

DATA_01DCE2:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0006,$0000,$FFFE,$0000,$0000,$0000,$0005
	dw $0000,$0000,$0007,$0000,$0000,$0000,$0000,$0000

DATA_01DD22:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0007
	dw $0000,$0002,$0002,$0000,$0001,$0000,$0000,$0007
	dw $0000,$0000,$0008,$0000

DATA_01DD5A:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0001,$0000,$0000,$0000,$0000,$0001,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0006,$0000,$0000,$0000,$0002

DATA_01DDCA:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000

DATA_01DDE2:
	dw $0000,$0000,$0000,$0010,$0010

DATA_01DDEC:
	dw $0000,$0000,$0001,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000

DATA_01DE04:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0008,$FFF8,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_01DE34:
	dw $0000,$0000,$0000,$FFF8,$0000,$0008

DATA_01DE40:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_01DE80:
	dw $0000,DATA_01E110,DATA_01DE8C,DATA_01DE8C,DATA_01E3D8,DATA_01E3D8

DATA_01DE8C:
	dw DATA_01DECC,DATA_01DEF0,DATA_01DF08,DATA_01DF20,DATA_01DF38,DATA_01DF50,DATA_01DF68,DATA_01DF80
	dw DATA_01DF98,DATA_01DFB0,DATA_01DFC8,DATA_01DFE0,DATA_01DFEC,DATA_01E00C,DATA_01E018,DATA_01E024
	dw DATA_01E038,DATA_01E044,DATA_01E050,DATA_01E064,DATA_01E070,DATA_01E07C,DATA_01E090,DATA_01E09C
	dw DATA_01E0A4,DATA_01E0BC,DATA_01E0C8,DATA_01E0D4,DATA_01E0E0,DATA_01E0EC,DATA_01E0EC,DATA_01E0F4

DATA_01DECC:
	dw $0000,$0000,$0004,$0016,$0400,$000B,$4000,$0010
	dw $0040,$0013,$0002,$0000,$0008,$0000,$0001,$0001
	dw $0000,$0000

DATA_01DEF0:
	dw $0001,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0002,$0000,$0000

DATA_01DF08:
	dw $0002,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0003,$0000,$0000

DATA_01DF20:
	dw $0003,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0004,$0000,$0000

DATA_01DF38:
	dw $0004,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0005,$0000,$0000

DATA_01DF50:
	dw $0005,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0006,$0000,$0000

DATA_01DF68:
	dw $0006,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0007,$0000,$0000

DATA_01DF80:
	dw $0007,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0008,$0000,$0000

DATA_01DF98:
	dw $0008,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0009,$0000,$0000

DATA_01DFB0:
	dw $0009,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$000A,$0000,$0000

DATA_01DFC8:
	dw $000A,$0003,$0004,$0016,$4000,$0010,$0040,$0013
	dw $0001,$0001,$0000,$0000

DATA_01DFE0:
	dw $000B,$0002,$0004,$0016,$0000,$000C

DATA_01DFEC:
	dw $000C,$0000,$0004,$001B,$0800,$001C,$0040,$000D
	dw $4000,$000D,$0400,$000C,$0002,$000C,$0000,$001C

DATA_01E00C:
	dw $000D,$0006,$0004,$001B,$0000,$000E

DATA_01E018:
	dw $000E,$0003,$0004,$001B,$0000,$000F

DATA_01E024:
	dw $000F,$0006,$0004,$001B,$0040,$000D,$4000,$000D
	dw $0000,$000C

DATA_01E038:
	dw $0010,$0002,$0004,$0016,$0000,$0011

DATA_01E044:
	dw $0011,$0003,$0004,$0016,$0000,$0012

DATA_01E050:
	dw $0012,$0004,$0004,$0016,$4000,$001F,$0040,$001F
	dw $0000,$0000

DATA_01E064:
	dw $0013,$0006,$0004,$0016,$0000,$0014

DATA_01E070:
	dw $0014,$0003,$0004,$0016,$0000,$0015

DATA_01E07C:
	dw $0015,$0006,$0004,$0016,$4000,$001F,$0040,$001F
	dw $0000,$0000

DATA_01E090:
	dw $0016,$000F,$0005,$001D,$0000,$00FF

DATA_01E09C:
	dw $0017,$001E,$0000,$0017

DATA_01E0A4:
	dw $0018,$0000,$0004,$0016,$0040,$0019,$4000,$0019
	dw $0002,$0018,$0000,$0018

DATA_01E0BC:
	dw $0019,$0003,$0004,$0016,$0000,$001A

DATA_01E0C8:
	dw $001A,$0006,$0004,$0016,$0000,$0018

DATA_01E0D4:
	dw $001B,$000F,$0005,$0017,$0000,$00FF

DATA_01E0E0:
	dw $000B,$0002,$0004,$0016,$0000,$0000

DATA_01E0EC:
	dw $000B,$0005,$0000,$0017

DATA_01E0F4:
	dw $0000,$0003,$0004,$0016,$0002,$001F,$0040,$001F
	dw $4000,$001F,$0001,$0001,$0000,$0000

DATA_01E110:
	dw DATA_01E158,DATA_01E184,DATA_01E19C,DATA_01E1B4,DATA_01E1CC,DATA_01E1E4,DATA_01E1FC,DATA_01E214
	dw DATA_01E22C,DATA_01E244,DATA_01E25C,DATA_01E274,DATA_01E280,DATA_01E2A4,DATA_01E2B0,DATA_01E2BC
	dw DATA_01E2D0,DATA_01E2DC,DATA_01E2E8,DATA_01E2FC,DATA_01E308,DATA_01E314,DATA_01E328,DATA_01E334
	dw DATA_01E33C,DATA_01E354,DATA_01E360,DATA_01E36C,DATA_01E378,DATA_01E384,DATA_01E384,DATA_01E38C
	dw DATA_01E3A4,DATA_01E3B8,DATA_01E3C8,DATA_01E3D0

DATA_01E158:
	dw $0000,$0000,$0004,$0016,$0400,$000B,$0800,$0020
	dw $0006,$0010,$0040,$0013,$0002,$0000,$0008,$0000
	dw $4000,$0000,$0001,$0001,$0000,$0000

DATA_01E184:
	dw $0001,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0002,$0000,$0000

DATA_01E19C:
	dw $0002,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0003,$0000,$0000

DATA_01E1B4:
	dw $0003,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0004,$0000,$0000

DATA_01E1CC:
	dw $0004,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0005,$0000,$0000

DATA_01E1E4:
	dw $0005,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0006,$0000,$0000

DATA_01E1FC:
	dw $0006,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0007,$0000,$0000

DATA_01E214:
	dw $0007,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0008,$0000,$0000

DATA_01E22C:
	dw $0008,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0009,$0000,$0000

DATA_01E244:
	dw $0009,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$000A,$0000,$0000

DATA_01E25C:
	dw $000A,$0003,$0004,$0016,$0040,$0013,$4000,$0000
	dw $0001,$0001,$0000,$0000

DATA_01E274:
	dw $000B,$0003,$0004,$0016,$0000,$000C

DATA_01E280:
	dw $000C,$0000,$0004,$001B,$0800,$001C,$0400,$0021
	dw $0040,$000D,$0080,$000D,$0400,$000C,$0002,$000C
	dw $0000,$000C

DATA_01E2A4:
	dw $000D,$0006,$0004,$001B,$0000,$000E

DATA_01E2B0:
	dw $000E,$0003,$0004,$001B,$0000,$000F

DATA_01E2BC:
	dw $000F,$0006,$0004,$001B,$0040,$000D,$0080,$000D
	dw $0000,$000C

DATA_01E2D0:
	dw $0010,$0005,$0004,$0016,$0000,$0011

DATA_01E2DC:
	dw $0011,$0003,$0004,$0016,$0000,$0012

DATA_01E2E8:
	dw $0012,$000C,$0004,$0016,$0080,$001F,$0040,$001F
	dw $0000,$0000

DATA_01E2FC:
	dw $0013,$0006,$0004,$0016,$0000,$0014

DATA_01E308:
	dw $0014,$0003,$0004,$0016,$0000,$0015

DATA_01E314:
	dw $0015,$0006,$0004,$0016,$0080,$001F,$0040,$001F
	dw $0000,$0000

DATA_01E328:
	dw $0016,$000F,$0005,$001D,$0000,$00FF

DATA_01E334:
	dw $0017,$001E,$0000,$0017

DATA_01E33C:
	dw $0018,$0000,$0004,$0016,$0040,$0019,$0080,$0019
	dw $0002,$0018,$0000,$0018

DATA_01E354:
	dw $0019,$0003,$0004,$0016,$0000,$001A

DATA_01E360:
	dw $001A,$0006,$0004,$0016,$0000,$0018

DATA_01E36C:
	dw $001B,$000F,$0005,$0017,$0000,$00FF

DATA_01E378:
	dw $000B,$0003,$0004,$0016,$0000,$0000

DATA_01E384:
	dw $000B,$0005,$0000,$0017

DATA_01E38C:
	dw $0000,$0003,$0004,$0016,$0002,$001F,$0040,$001F
	dw $0080,$001F,$0000,$0000

DATA_01E3A4:
	dw $001C,$0000,$0004,$0016,$0002,$0020,$0800,$0020
	dw $0000,$0000

DATA_01E3B8:
	dw $001D,$0000,$0004,$0016,$0400,$0021,$0000,$000C

DATA_01E3C8:
	dw $001E,$0003,$0000,$0023

DATA_01E3D0:
	dw $001F,$0006,$0000,$0022

DATA_01E3D8:
	dw DATA_01E41A,DATA_01E184,DATA_01E19C,DATA_01E43A,DATA_01E456,DATA_01E472,DATA_01E48E,DATA_01E4AA
	dw DATA_01E4C6,DATA_01E4E2,DATA_01E4FA,DATA_01E50E,DATA_01E522,DATA_01E536,DATA_01E2B0,DATA_01E2BC
	dw DATA_01E2D0,DATA_01E2DC,DATA_01E2E8,DATA_01E2FC,DATA_01E308,DATA_01E314,DATA_01E54A,DATA_01E556
	dw DATA_01E33C,DATA_01E354,DATA_01E360,DATA_01E36C,DATA_01E378,DATA_01E384,DATA_01E384,DATA_01E38C
	dw DATA_01E3A4

DATA_01E41A:
	dw $0000,$0000,$0004,$0016,$0800,$000A,$0400,$000C
	dw $0001,$0003,$0002,$0000,$0007,$0009,$0000,$0000

DATA_01E43A:
	dw $0000,$0006,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0004,$0007,$0009,$0000,$0000

DATA_01E456:
	dw $0001,$0006,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0005,$0007,$0009,$0000,$0000

DATA_01E472:
	dw $0002,$0006,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0006,$0007,$0009,$0000,$0000

DATA_01E48E:
	dw $0003,$0006,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0007,$0007,$0009,$0000,$0000

DATA_01E4AA:
	dw $0004,$0006,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0008,$0007,$0009,$0000,$0000

DATA_01E4C6:
	dw $0005,$0006,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0003,$0007,$0009,$0000,$0000

DATA_01E4E2:
	dw $0006,$003B,$0004,$0016,$0400,$000C,$0800,$000A
	dw $0001,$0003,$0000,$0000

DATA_01E4FA:
	dw $0008,$0006,$0004,$0016,$0800,$000B,$0001,$0003
	dw $0000,$0000

DATA_01E50E:
	dw $000B,$0006,$0004,$0016,$0800,$000A,$0001,$0003
	dw $0000,$0000

DATA_01E522:
	dw $0007,$0006,$0004,$0016,$0400,$000D,$0001,$0003
	dw $0000,$0000

DATA_01E536:
	dw $000A,$0006,$0004,$0016,$0400,$000C,$0001,$0003
	dw $0000,$0000

DATA_01E54A:
	dw $0009,$0011,$0005,$001D,$0000,$00FF

DATA_01E556:
	dw $0000,$000F,$0000,$0017

DATA_01E55E:
	dw $0030,$0030,$0030,$0030,$0030,$0030,$0030,$0030
	dw $0030,$0030,$0030,$0028,$0020,$0020,$0020,$0020
	dw $0030,$0030,$0030,$0030,$0030,$0030,$0030,$0030
	dw $0020,$0020,$0020,$0020,$0030,$0020,$0030,$0030

DATA_01E59E:
	dw $0000,DATA_01E5A8,DATA_01E5CA,DATA_01E5EC,$0000

DATA_01E5A8:
	dw $000F,DATA_019C78,$0024,$0020,$0012,DATA_019C7C,$0028,$001E
	dw $0015,DATA_019C80,$0028,$0017,$001A,DATA_019C84,$0024,$0022
	dw $0000

DATA_01E5CA:
	dw $000F,DATA_019C88,$0024,$0028,$0012,DATA_019C8C,$0028,$0020
	dw $0015,DATA_019C88,$0024,$0020,$001A,DATA_019C88,$0026,$0020
	dw $0000

DATA_01E5EC:
	dw $000C,DATA_019C9C,$0008,$0000,$000D,DATA_019C98,$0028,$0020
	dw $0000

DATA_01E5FE:
	dw $0000,$0307,$0900,$0000,$0000,$0006,$0202,$0009
	dw $0000,$0502,$0602,$0007,$0000,$0401,$0304,$0008
	dw $0000,$0900,$0402,$0004,$0000,$0800,$0305,$0007
	dw $0000,$0800,$0208,$0004,$0000,$0500,$0104,$0002
	dw $0000,$0000,$0000,$0000

DATA_01E646:
	db $1D,$1E,$0F,$80,$17,$1D,$10,$80,$11,$17,$10,$80,$15,$0F,$20,$80
	db $0B,$18,$1E,$80,$1A,$13,$0F,$80,$1E,$13,$0F,$80,$20,$21,$22,$80
	db $23,$24,$00,$80,$07,$80,$06,$80,$05,$80,$05,$80,$05,$80,$04,$80
	db $04,$80,$03,$80,$03,$80

DATA_01E67C:
	db $81,$00,$00,$80

DATA_01E680:
	db $02,$80,$03,$80,$04,$80,$05,$80,$06,$80

table "Tables/Fonts/Credits.txt"

DATA_01E68A:
	db $81,$08,$03,"HI@SCORES",$80

cleartable

DATA_01E697:
	db $81,$0C,$03,$18,$0B,$17,$0F,$2F,$80

DATA_01E6A0:
	db $01,$80,$81,$02,$17,$18,$0B,$17,$0F,$2F,$80,$F8,$FF,$04,$00,$08
	db $00,$04,$00,$F8,$FF,$F4,$FF,$08,$00,$F4,$FF

DATA_01E6BB:
	dw $0000,DATA_0387DC,DATA_038A0C,DATA_038C6C,DATA_0391EC,DATA_0394D4,DATA_039704,$4AAF
	dw $EAAA,$AACA,$ACAA,$D62E,$ABEA,DATA_03924C,$0000,DATA_0398AC
	dw DATA_03982C

DATA_01E6DD:
	dw $18F8,$1808,$DC80,$DCC0,$1008,$0000,$E500,$0000
	dw $1008,$0000,$E540,$0000,$1000,$1010,$E580,$E5C0
	dw $10F8,$0810,$E800,$E840,$1000,$1010,$F000,$F040
	dw $1008,$0000,$E8C0,$0000,$1008,$0000,$E900,$0000
	dw $0810,$0000,$E940,$0000,$10F8,$0010,$E980,$E9C0
	dw $1010,$0000,$EC00,$0000,$20F8,$0000,$EC40,$0000
	dw $2008,$0000,$DD00,$0000,$18F8,$1808,$DD40,$DD80
	dw $1808,$0000,$DDC0,$0000,$1010,$0000,$E000,$0000
	dw $1808,$0000,$E040,$0000,$1800,$0810,$E080,$E0C0
	dw $18F8,$0820,$E100,$E140,$20F8,$0810,$E180,$E1C0
	dw $0810,$0000,$E400,$0000,$F808,$0000,$E440,$0000
	dw $18F8,$1808,$E480,$E4C0,$0000,$0000,$0000,$0000
	dw $1800,$0810,$EC80,$ECC0,$0800,$0000,$ED00,$0000
	dw $1010,$0000,$ED40,$0000,$20F8,$2010,$ED80,$EDC0

DATA_01E7BD:
	dd DATA_01E7D9
	dd DATA_01E7D9
	dd DATA_01E7F9
	dd DATA_01E819
	dd DATA_01E839
	dd DATA_01E859
	dd DATA_01E819

DATA_01E7D9:
	dw $0160,$05D0,$0016,$005D,$0013,$002E,$0000,$0068
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_01E7F9:
	dw $0000,$0000,$0000,$0000,$0000,$0001,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_01E819:
	dw $0000,$0030,$0000,$0003,$0000,$0001,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_01E839:
	dw $0000,$0610,$0000,$0061,$0000,$002E,$0000,$0068
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_01E859:
	dw $0000,$0000,$0000,$0000,$0000,$0001,$0000,$0000
	dw $0000,$0000,$0000,$0000

DATA_01E871:
	dw $0000,$0000,$0000,$0000

DATA_01E879:
	dw $0000,$0070,$00E0,$0150,$01C0,$0248,$02D0,$0358
	dw $03E0,$03E8,$03F0,$03F8,$0400,$0420,$0440,$0460
	dw $0480,$0490,$04A0,$04B0,$04C0,$04C8,$04D0,$04D8
	dw $04E0,$AB3B,$ABA8,$ADAA,$04E0,$EA3E,$BBA2,$EE8A
	dw $04E0,$9AAA,$5BAA,$FE2A,$04E0,$DABB,$AC9B,$6229
	dw $04E0,$A7EB,$AAAE,$28CA,$04E0,$BAAA,$AAAB,$AE8A
	dw $04E0,$04E8,$04F0,$04F8,$0500

DATA_01E8E3:						; Note: Tile Animation related.
	dw $8100,$027E,$241E,DATA_01EFC5
	dw $8200,$027E,$44AA,DATA_01EFC5
	dw $8300,$027E,$4EF0,DATA_01EFC5
	dw $8400,$027E,$2BAA,DATA_01EFC5
	dw $8500,$027E,$4F08,DATA_01EFC5
	dw $8600,$027E,$5D82,DATA_01EFC5
	dw $8700,$027E,$5DB2,DATA_01EFC5
	dw $8800,$027E,$3874,DATA_01EFC5
	dw $8B03,$027E,$2206,DATA_01EFCD
	dw $8C03,$027E,$2B7E,DATA_01EFC9
	dw $8D03,$027E,$2C2C,DATA_01EFC9
	dw $8E03,$027E,$32E2,DATA_01EFCD
	dw $8F03,$027E,$3212,DATA_01EFC9
	dw $9003,$027E,$330C,DATA_01EFC9
	dw $9103,$027E,$3B76,DATA_01EFC9
	dw $9203,$027E,$455C,DATA_01EFC9
	dw $9303,$027E,$4598,DATA_01EFC9
	dw $9403,$027E,$4F8C,DATA_01EFC9
	dw $9503,$027E,$50D8,DATA_01EFC9
	dw $9603,$027E,$59A2,DATA_01EFC9
	dw $9703,$027E,$5DE2,DATA_01EFC9
	dw $9803,$027E,$38F0,DATA_01EFC9
	dw $9903,$027E,$5E54,DATA_01EFC9
	dw $9A03,$027E,$5E60,DATA_01EFC9
	dw $0000,$01FE,$7300,DATA_01EDE3
	dw $0001,$01FE,$72AC,DATA_01EDE3
	dw $0003,$01FE,$72BC,DATA_01EDE3
	dw $0007,$01FE,$74CE,DATA_01EDE3
	dw $0000,$01FE,$7664,DATA_01EDE3
	dw $0001,$01FE,$77D8,DATA_01EDE3
	dw $0007,$01FE,$79B8,DATA_01EDE3
	dw $0003,$01FE,$7A46,DATA_01EDE3
	dw $0000,$01FE,$7A5C,DATA_01EDE3
	dw $0001,$01FE,$7DCA,DATA_01EDE3
	dw $0003,$01FE,$7E6E,DATA_01EDE3
	dw $0003,$01FE,$7F2A,DATA_01EDE3
	dw $0000,$01FE,$8004,DATA_01EDE3
	dw $0001,$01FE,$822E,DATA_01EDE3
	dw $0007,$01FE,$82D8,DATA_01EDE3
	dw $0007,$01FE,$83B4,DATA_01EDE3
	dw $0000,$01FE,$8446,DATA_01EDE3
	dw $0001,$01FE,$8626,DATA_01EDE3
	dw $0007,$01FE,$86EC,DATA_01EDE3
	dw $0007,$01FE,$8706,DATA_01EDE3
	dw $0000,$01FE,$878A,DATA_01EDE3
	dw $0001,$01FE,$8882,DATA_01EDE3
	dw $0007,$01FE,$88A2,DATA_01EDE3
	dw $0007,$01FE,$88EC,DATA_01EDE3
	dw $0001,$017E,$5488,DATA_01EEAF
	dw $0001,$017E,$549C,DATA_01EEAF
	dw $0001,$087E,$4936,DATA_01EF27
	dw $0001,$087E,$4D26,DATA_01EF27
	dw $0001,$0A7E,$363A,DATA_01EEE9
	dw $0001,$017E,$2ACE,DATA_01EF65
	dw $0001,$017E,$2AE8,DATA_01EF65
	dw $0001,$017E,$2AF4,DATA_01EF65
	dw $8100,$027E,$5114,DATA_01EFC5
	dw $8200,$027E,$5120,DATA_01EFC5
	dw $8300,$027E,$512C,DATA_01EFC5
	dw $8400,$027E,$5144,DATA_01EFC5
	dw $8500,$027E,$5150,DATA_01EFC5
	dw $8600,$027E,$5DA8,DATA_01EFC5
	dw $8700,$027E,$3AA2,DATA_01EFC5
	dw $8800,$027E,$3AB6,DATA_01EFC5
	dw $8B03,$027E,$2F8C,DATA_01EFC9
	dw $8C03,$027E,$3B76,DATA_01EFC9
	dw $8D03,$027E,$4548,DATA_01EFC9
	dw $8E03,$027E,$459E,DATA_01EFC9
	dw $8F03,$027E,$51C8,DATA_01EFC9
	dw $9003,$027E,$51EA,DATA_01EFC9
	dw $9103,$027E,$5DFE,DATA_01EFC9
	dw $9203,$027E,$5E5A,DATA_01EFC9
	dw $0000,$01FE,$7300,DATA_01EDE3
	dw $0001,$01FE,$72AC,DATA_01EDE3
	dw $0003,$01FE,$72BC,DATA_01EDE3
	dw $0007,$01FE,$74CE,DATA_01EDE3
	dw $0000,$01FE,$7664,DATA_01EDE3
	dw $0001,$01FE,$77D8,DATA_01EDE3
	dw $0007,$01FE,$79B8,DATA_01EDE3
	dw $0003,$01FE,$7A46,DATA_01EDE3
	dw $0001,$017E,$5D90,DATA_01EF65
	dw $0001,$017E,$5DB8,DATA_01EF65
	dw $0001,$087E,$4BF2,DATA_01EF27
	dw $0001,$087E,$36B6,DATA_01EF27
	dw $0001,$087E,$33E6,DATA_01EF27
	dw $0001,$017E,$514A,DATA_01EF65
	dw $0001,$087E,$4032,DATA_01EF27
	dw $0001,$087E,$5036,DATA_01EF27
	dw $0000,$01FE,$7A5C,DATA_01EDE3
	dw $0001,$01FE,$7DCA,DATA_01EDE3
	dw $0003,$01FE,$7E6E,DATA_01EDE3
	dw $0003,$01FE,$7F2A,DATA_01EDE3
	dw $0000,$01FE,$8004,DATA_01EDE3
	dw $0001,$01FE,$822E,DATA_01EDE3
	dw $0007,$01FE,$82D8,DATA_01EDE3
	dw $0007,$01FE,$83B4,DATA_01EDE3
	dw $0000,$01FE,$8446,DATA_01EDE3
	dw $0001,$01FE,$8626,DATA_01EDE3
	dw $0007,$01FE,$86EC,DATA_01EDE3
	dw $0007,$01FE,$8706,DATA_01EDE3
	dw $0000,$01FE,$878A,DATA_01EDE3
	dw $0001,$01FE,$8882,DATA_01EDE3
	dw $0007,$01FE,$88A2,DATA_01EDE3
	dw $0007,$01FE,$88EC,DATA_01EDE3
	dw $2000,$037E,$26FC,DATA_01EE2B
	dw $A100,$037E,$26FC,DATA_01EEAB
	dw $2200,$037E,$2798,DATA_01EE2B
	dw $A300,$037E,$2798,DATA_01EEAB
	dw $2400,$037E,$2A70,DATA_01EE2B
	dw $A500,$037E,$2A70,DATA_01EEAB
	dw $2600,$037E,$2D40,DATA_01EE2B
	dw $A700,$037E,$2D40,DATA_01EEAB
	dw $2800,$037E,$2F78,DATA_01EE2B
	dw $A900,$037E,$2F78,DATA_01EEAB
	dw $2A00,$037E,$2FFC,DATA_01EE2B
	dw $AB00,$037E,$2FFC,DATA_01EEAB
	dw $2C00,$037E,$2F60,DATA_01EE2B
	dw $AD00,$037E,$2F60,DATA_01EEAB
	dw $2E00,$037E,$2D18,DATA_01EE2B
	dw $AF00,$037E,$2D18,DATA_01EEAB
	dw $3000,$037E,$2A48,DATA_01EE2B
	dw $B100,$037E,$2A48,DATA_01EEAB
	dw $3200,$037E,$2780,DATA_01EE2B
	dw $B300,$037E,$2780,DATA_01EEAB
	dw $8100,$0D7E,$6250,DATA_01F27B
	dw $8201,$037E,$C1AA,DATA_01F289
	dw $0007,$01FE,$2000,DATA_01EDE3
	dw $0007,$01FE,$2000,DATA_01EDE3
	dw $8100,$08FE,$3168,DATA_01F28F
	dw $8200,$08FE,$3168,DATA_01F293
	dw $8300,$08FE,$3168,DATA_01F297
	dw $8400,$08FE,$3168,DATA_01F29B
	dw $8500,$08FE,$3168,DATA_01F29F
	dw $8600,$08FE,$3168,DATA_01F2A3
	dw $8700,$08FE,$3168,DATA_01F2A7
	dw $8800,$08FE,$3168,DATA_01F2AB
	dw $8900,$08FE,$3168,DATA_01F2AF
	dw $8A00,$08FE,$3168,DATA_01F2B3
	dw $8B00,$08FE,$3168,DATA_01F2B7
	dw $8C00,$08FE,$3168,DATA_01F2BB
	dw $8D00,$08FE,$3168,DATA_01F2BF
	dw $8E00,$08FE,$3168,DATA_01F2C3
	dw $8F00,$08FE,$3168,DATA_01F2C7
	dw $9000,$08FE,$3168,DATA_01F2CB
	dw $0001,$07FE,$84C2,DATA_01EFD1
	dw $0001,$07FE,$7FFA,DATA_01EFD1
	dw $0001,$07FE,$796C,DATA_01EFD1
	dw $0001,$07FE,$71D0,DATA_01EFD1
	dw $0001,$077E,$3BF8,DATA_01EFDF
	dw $0001,$077E,$4576,DATA_01EFDF
	dw $0001,$077E,$2000,DATA_01EFDF
	dw $0001,$077E,$2000,DATA_01EFDF
	dw $8100,$0D7E,$B9D0,DATA_01F27B
	dw $8201,$037E,$97BA,DATA_01F289
	dw $0007,$017E,$2000,DATA_01EDE3
	dw $0007,$017E,$2000,DATA_01EDE3
	dw $8100,$0D7E,$B9D0,DATA_01F27B
	dw $8201,$037E,$872A,DATA_01F289
	dw $0007,$01FE,$2000,DATA_01EDE3
	dw $0007,$01FE,$2000,DATA_01EDE3

DATA_01EDE3:
	dw DATA_01EE01,DATA_01EE07,DATA_01EE0D,DATA_01EE13,DATA_01EE19,DATA_01EE1F,DATA_01EE25,DATA_01EE25
	dw DATA_01EE1F,DATA_01EE19,DATA_01EE13,DATA_01EE0D,DATA_01EE07,DATA_01EE01,$0000

DATA_01EE01:
	dw $1648,$9648,$0001

DATA_01EE07:
	dw $164A,$964A,$0001

DATA_01EE0D:
	dw $164C,$964C,$0001

DATA_01EE13:
	dw $164E,$964E,$0001

DATA_01EE19:
	dw $1660,$9660,$0001

DATA_01EE1F:
	dw $1662,$9662,$0001

DATA_01EE25:
	dw $1264,$9264,$0001

DATA_01EE2B:
	dw DATA_01F253,DATA_01F23F,DATA_01F22B,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F22B,DATA_01F217
	dw DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217
	dw DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217
	dw DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217
	dw DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217
	dw DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217
	dw DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F217,DATA_01F22B
	dw DATA_01F217,DATA_01F22B,DATA_01F22B,DATA_01F217,DATA_01F217,DATA_01F22B,DATA_01F23F,$0000

DATA_01EEAB:
	dw DATA_01F267,$0000

DATA_01EEAF:
	dw DATA_01EFE9,DATA_01EFE9,DATA_01F007,DATA_01F007,DATA_01F025,DATA_01F025,DATA_01F043,DATA_01F043
	dw DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F
	dw DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F
	dw DATA_01F061,DATA_01F07F,DATA_01F061,DATA_01F07F,$0000

DATA_01EEE9:
	dw DATA_01F109,DATA_01F109,DATA_01F109,DATA_01F109,DATA_01F11F,DATA_01F11F,DATA_01F135,DATA_01F135
	dw DATA_01F14B,DATA_01F14B,DATA_01F161,DATA_01F177,DATA_01F161,DATA_01F177,DATA_01F161,DATA_01F177
	dw DATA_01F161,DATA_01F177,DATA_01F161,DATA_01F177,DATA_01F109,DATA_01F109,DATA_01F109,DATA_01F109
	dw DATA_01F11F,DATA_01F11F,DATA_01F135,DATA_01F135,DATA_01F14B,DATA_01F14B,$0000

DATA_01EF27:
	dw DATA_01F09D,DATA_01F0AF,DATA_01F0AF,DATA_01F0C1,DATA_01F0C1,DATA_01F0C1,DATA_01F0D3,DATA_01F0D3
	dw DATA_01F0D3,DATA_01F0D3,DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7
	dw DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7
	dw DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7,DATA_01F0E5,DATA_01F0F7,$0000

DATA_01EF65:
	dw DATA_01F18D,DATA_01F19B,DATA_01F19B,DATA_01F1A9,DATA_01F1A9,DATA_01F1A9,DATA_01F1B7,DATA_01F1C5
	dw DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5
	dw DATA_01F1D3,DATA_01F18D,DATA_01F18D,DATA_01F19B,DATA_01F19B,DATA_01F1A9,DATA_01F1A9,DATA_01F1B7
	dw DATA_01F1B7,DATA_01F1B7,DATA_01F1B7,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5
	dw DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5
	dw DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,DATA_01F1C5,DATA_01F1D3,$0000

DATA_01EFC5:
	dw DATA_01F1E1,$0000

DATA_01EFC9:
	dw DATA_01F1FB,$0000

DATA_01EFCD:
	dw DATA_01F209,$0000

DATA_01EFD1:
	dw DATA_01C19E,DATA_01C1D8,DATA_01C212,DATA_01C24C,DATA_01C212,DATA_01C1D8,$0000

DATA_01EFDF:
	dw DATA_01C286,DATA_01C28A,DATA_01C28E,DATA_01C28A,$0000

DATA_01EFE9:
	dw $0ACE,$32E4,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$B2E4,$0ACE,$0001

DATA_01F007:
	dw $0A28,$32E4,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$B2E4,$0A28,$0001

DATA_01F025:
	dw $0A2A,$32E4,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$B2E4,$0A2A,$0001

DATA_01F043:
	dw $0A2C,$32E4,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$B2E4,$0A2C,$0001

DATA_01F061:
	dw $0A2C,$32E4,$2AE8,$2AEC,$2AEA,$2AEC,$2AEA,$2AEC
	dw $2AEA,$6AEC,$2AEA,$AAE8,$B2E4,$0A2C,$0001

DATA_01F07F:
	dw $0A2C,$32E4,$6AE8,$6AEC,$6AEA,$6AEC,$6AEA,$6AEC
	dw $6AEA,$2AEC,$6AEA,$EAE8,$B2E4,$0A2C,$0001

DATA_01F09D:
	dw $4CE4,$692C,$0000,$0000,$0000,$0000,$292C,$0CE4
	dw $0001

DATA_01F0AF:
	dw $4DE0,$692C,$0000,$0000,$0000,$0000,$292C,$0DE0
	dw $0001

DATA_01F0C1:
	dw $4DE2,$692C,$0000,$0000,$0000,$0000,$292C,$0DE2
	dw $0001

DATA_01F0D3:
	dw $4DE4,$692C,$0000,$0000,$0000,$0000,$292C,$0DE4
	dw $0001

DATA_01F0E5:
	dw $4DE4,$692C,$6D40,$2D42,$2D44,$2D40,$292C,$0DE4
	dw $0001

DATA_01F0F7:
	dw $4DE4,$692C,$ED40,$AD42,$AD44,$AD40,$292C,$0DE4
	dw $0001

DATA_01F109:
	dw $50E4,$6D2C,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2D2C,$10E4,$0001

DATA_01F11F:
	dw $51E0,$6D2C,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2D2C,$11E0,$0001

DATA_01F135:
	dw $51E2,$6D2C,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2D2C,$11E2,$0001

DATA_01F14B:
	dw $51E4,$6D2C,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2D2C,$11E4,$0001

DATA_01F161:
	dw $51E4,$6D2C,$D140,$9142,$9144,$9142,$9144,$9140
	dw $2D2C,$11E4,$0001

DATA_01F177:
	dw $51E4,$6D2C,$5140,$1142,$1144,$1142,$1144,$1140
	dw $2D2C,$11E4,$0001

DATA_01F18D:
	dw $0ACE,$2EE4,$0000,$0000,$AEE4,$8ACE,$0001

DATA_01F19B:
	dw $0A28,$2EE4,$0000,$0000,$AEE4,$8A28,$0001

DATA_01F1A9:
	dw $0A2A,$2EE4,$0000,$0000,$AEE4,$8A2A,$0001

DATA_01F1B7:
	dw $0A2C,$2EE4,$0000,$0000,$AEE4,$8A2C,$0001

DATA_01F1C5:
	dw $0A2C,$2EE4,$2EE8,$AEE8,$AEE4,$8A2C,$0001

DATA_01F1D3:
	dw $0A2C,$2EE4,$6EE8,$EEE8,$AEE4,$8A2C,$0001

DATA_01F1E1:
	dw $13E4,$13E6,$13E8,$13EA,$13EC,$13EE,$93EE,$93EC
	dw $93EA,$93E8,$93E6,$93E4,$0001

DATA_01F1FB:
	dw $0EE2,$0EE6,$0EEE,$0F00,$0B02,$0B04,$0001

DATA_01F209:
	dw $8B02,$8B04,$8EEE,$8F00,$8EE2,$8EE6,$0001

DATA_01F217:
	dw $0AAE,$0AC0,$0AC2,$0AC4,$1B24,$0B06,$0B0A,$0B0C
	dw $0B0E,$0001

DATA_01F22B:
	dw $0AAE,$0AC0,$0AC2,$0AC4,$0B08,$0B06,$0B0A,$0B0C
	dw $0B0E,$0001

DATA_01F23F:
	dw $0AAE,$094E,$0B22,$0962,$0964,$096E,$0980,$09A6
	dw $09A8,$0001

DATA_01F253:
	dw $0AAE,$0984,$0986,$0988,$098A,$098C,$098E,$0908
	dw $090A,$0001

DATA_01F267:
	dw $0960,$09CC,$09E8,$0A6C,$0A6E,$0AC6,$0AC8,$0B20
	dw $0BAE,$0001

DATA_01F27B:
	dw DATA_01F2CF,DATA_01F3BB,DATA_01F4A7,DATA_01F593,DATA_01F67F,DATA_01F76B,$0000

DATA_01F289:
	dw DATA_01F857,DATA_01F877,$0000

DATA_01F28F:
	dw DATA_01BB4A,$0000

DATA_01F293:
	dw DATA_01BBEC,$0000

DATA_01F297:
	dw DATA_01BC8E,$0000

DATA_01F29B:
	dw DATA_01BD30,$0000

DATA_01F29F:
	dw DATA_01BDD2,$0000

DATA_01F2A3:
	dw DATA_01BE74,$0000

DATA_01F2A7:
	dw DATA_01BF16,$0000

DATA_01F2AB:
	dw DATA_01BFB8,$0000

DATA_01F2AF:
	dw DATA_01C05A,$0000

DATA_01F2B3:
	dw DATA_01C0FC,$0000

DATA_01F2B7:
	dw DATA_01C0FC,$0000

DATA_01F2BB:
	dw DATA_01C0FC,$0000

DATA_01F2BF:
	dw DATA_01C0FC,$0000

DATA_01F2C3:
	dw DATA_01C0FC,$0000

DATA_01F2C7:
	dw DATA_01C0FC,$0000

DATA_01F2CB:
	dw DATA_01C0FC,$0000

DATA_01F2CF:
	dw $2402,$2404,$2404,$2404,$2404,$2404,$2404,$2404
	dw $2404,$2404,$2404,$2404,$4402,$244C,$244E,$2460
	dw $24A0,$24A2,$24A4,$24A6,$24A8,$24AA,$24AC,$4460
	dw $444E,$444C,$2462,$2464,$2466,$24C0,$24C2,$24C4
	dw $24C6,$24C8,$24CA,$24CC,$4466,$4464,$4462,$2468
	dw $246A,$246C,$24E0,$24E2,$24E4,$24E6,$24E8,$24EA
	dw $24EC,$446C,$446A,$4468,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$0001

DATA_01F3BB:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$2402,$2404,$2404
	dw $2404,$2404,$2404,$2404,$2404,$2404,$2404,$2404
	dw $2404,$4402,$244C,$244E,$2460,$24A0,$24A2,$24A4
	dw $24A6,$24A8,$24AA,$24AC,$4460,$444E,$444C,$2462
	dw $2464,$2466,$24C0,$24C2,$24C4,$24C6,$24C8,$24CA
	dw $24CC,$4466,$4464,$4462,$2468,$246A,$246C,$24E0
	dw $24E2,$24E4,$24E6,$24E8,$24EA,$24EC,$446C,$446A
	dw $4468,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$0001

DATA_01F4A7:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$2402,$2404,$2404,$2404,$2404,$2404
	dw $2404,$2404,$2404,$2404,$2404,$2404,$4402,$244C
	dw $244E,$2460,$24A0,$24A2,$24A4,$24A6,$24A8,$24AA
	dw $24AC,$4460,$444E,$444C,$2462,$2464,$2466,$24C0
	dw $24C2,$24C4,$24C6,$24C8,$24CA,$24CC,$4466,$4464
	dw $4462,$2468,$246A,$246C,$24E0,$24E2,$24E4,$24E6
	dw $24E8,$24EA,$24EC,$446C,$446A,$4468,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$0001

DATA_01F593:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$2402
	dw $2404,$2404,$2404,$2404,$2404,$2404,$2404,$2404
	dw $2404,$2404,$2404,$4402,$244C,$244E,$2460,$24A0
	dw $24A2,$24A4,$24A6,$24A8,$24AA,$24AC,$4460,$444E
	dw $444C,$2462,$2464,$2466,$24C0,$24C2,$24C4,$24C6
	dw $24C8,$24CA,$24CC,$4466,$4464,$4462,$2468,$246A
	dw $246C,$24E0,$24E2,$24E4,$24E6,$24E8,$24EA,$24EC
	dw $446C,$446A,$4468,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$0001

DATA_01F67F:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$2402,$2404,$2404,$2404
	dw $2404,$2404,$2404,$2404,$2404,$2404,$2404,$2404
	dw $4402,$244C,$244E,$2460,$24A0,$24A2,$24A4,$24A6
	dw $24A8,$24AA,$24AC,$4460,$444E,$444C,$2462,$2464
	dw $2466,$24C0,$24C2,$24C4,$24C6,$24C8,$24CA,$24CC
	dw $4466,$4464,$4462,$2468,$246A,$246C,$24E0,$24E2
	dw $24E4,$24E6,$24E8,$24EA,$24EC,$446C,$446A,$4468
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$0001

DATA_01F76B:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$2402,$2404,$2404,$2404,$2404,$2404,$2404
	dw $2404,$2404,$2404,$2404,$2404,$6402,$244C,$244E
	dw $2460,$24A0,$24A2,$24A4,$24A6,$24A8,$24AA,$24AC
	dw $6460,$644E,$644C,$2462,$2464,$2466,$24C0,$24C2
	dw $24C4,$24C6,$24C8,$24CA,$24CC,$6466,$6464,$6462
	dw $2468,$246A,$246C,$24E0,$24E2,$24E4,$24E6,$24E8
	dw $24EA,$24EC,$646C,$646A,$6468,$0001

DATA_01F857:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$05E8,$05EA,$45E8,$0001

DATA_01F877:
	dw $05E8,$05EA,$45E8,$1000,$05EC,$1000,$1000,$05EC
	dw $1000,$1000,$05EC,$1000,$1000,$05EC,$1000,$0001

DATA_01F897:
	dw $0F10,$31F0,$0F18,$31F1,$0F20,$31F2,$0F28,$31F3
	dw $0F38,$3BE0,$0F40,$3BE0,$0F48,$3BE0,$0F50,$3BE0
	dw $0F58,$3BE0,$0F60,$3BE0,$0F68,$3BE0,$1710,$394C
	dw $1720,$394C,$1730,$394C,$1740,$394C,$1750,$394C
	dw $1760,$394C,$1770,$394C,$1780,$394C,$FE10,$0C88
	dw $FE18,$0C88,$FE20,$0C88,$FE28,$0C88,$FE30,$0C88
	dw $FE38,$0C88,$0878,$0A88,$0888,$0A88,$0ADA,$7FC6
	dw $0BEC,$31F6,$0F70,$31F6,$0F30,$31F4,$F040,$31E0
	dw $F040,$31E0

DATA_01F91B:
	dw $5555,$5555,$5555,$5555,$5555,$5555,$5555,$5555
	dw $5555,$5555,$5555,$FAAA,$0000,$AA80,$556A,$40AA

DATA_01F93B:
	dw $4268,$4A46

DATA_01F93F:
	dw $0F10,$31F0,$0F18,$31F1,$0F20,$31F2,$0F28,$31F3
	dw $0F38,$31E0,$0F40,$31E0,$0F48,$31E0,$0F50,$31E0
	dw $0F58,$31E0,$0F60,$31E0,$0F68,$31E0,$1710,$31E4
	dw $1718,$31E4,$1720,$31E4,$1728,$31E4,$1730,$31E4
	dw $1738,$31E4,$1740,$31E4,$1748,$31E4,$1750,$31E4
	dw $1758,$31E4,$1760,$31E4,$1768,$31E4,$1770,$31E4
	dw $1778,$31E4,$1780,$31E4,$1788,$31E4,$10DA,$31C6
	dw $10EC,$31F6,$0F70,$31F6,$0F30,$31F4,$F040,$31E0

DATA_01F9BF:
	dw $5555,$5555,$5555,$5555,$5555,$5555,$5555,$5555
	dw $5555,$5555,$5555,$FFFF,$0000,$0000,$0000,$C080

DATA_01F9DF:
	db $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8

DATA_01F9E8:
	dw DATA_01F9F8,DATA_01FA00,DATA_01FA08,DATA_01FA10,DATA_01FA18,DATA_01FA20,DATA_01FA28,DATA_01FA30

DATA_01F9F8:
	dw $0200,$0400,$0300,$0500

DATA_01FA00:
	dw $0600,$0800,$0700,$0900

DATA_01FA08:
	dw $0A00,$0C00,$0B00,$0D00

DATA_01FA10:
	dw $0E00,$1000,$0F00,$1100

DATA_01FA18:
	dw $1200,$1400,$1300,$1500

DATA_01FA20:
	dw $1600,$1800,$1700,$1900

DATA_01FA28:
	dw $1A00,$1C00,$1B00,$1D00

DATA_01FA30:
	dw $1E00,$2000,$1F00,$2100

DATA_01FA38:
	dw $0100,$0080,$0100,$0080

DATA_01FA40:
	dw $1100,$1200,$1180,$1280

DATA_01FA48:
	dw $0088,$2940,$2942,$2944,$2946,$2948,$294A,$294C
	dw $294E,$8528,$8528,$8528,$8528,$8550,$8550,$8550
	dw $8550,$8500,$8500,$8500,$8500,$8500,$8528,$8550
	dw $8550,$0804,$0010,$1014,$0810,$0804,$0010,$1014
	dw $0810,$0804,$0010,$1014,$0810,$0804,$0010,$1014
	dw $0810

DATA_01FA9A:
	dw $01A0,$0000,$0004,$002A,$006F,$04F4,$0D9A,$169F
	dw $01A0,$0000,$0004,$002A,$006F,$04F4,$0D9A,$169F
	dw $01A0,$0000,$0004,$002A,$006F,$04F4,$0D9A,$169F
	dw $01A0,$0000,$0004,$002A,$006F,$04F4,$0D9A,$169F
	dw $01A0,$0000,$0004,$002A,$006F,$04F4,$0D9A,$169F
	dw $01A0,$0000,$0004,$002A,$006F,$04F4,$0D9A,$169F
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$002A,$006F
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$002A,$006F
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$002A,$006F
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$0000,$002A
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$0000,$002A
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$0000,$002A
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$0000,$002A
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$002A,$006F
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$002A,$006F
	dw $01A0,$0000,$0000,$0000,$0000,$0000,$002A,$006F
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0000,$0000,$002A,$006F,$04F4
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A
	dw $01A0,$0000,$0000,$0004,$002A,$006F,$04F4,$0D9A

DATA_01FCCA:
	dw $2C35,$3898,$38FC,$55DD,$6ADE,$0000,$6E60,$51C0
	dw $3898,$38FC,$55DD,$6ADE,$2C35,$0000,$51C0,$6E60
	dw $38FC,$55DD,$6ADE,$2C35,$3898,$0000,$6E60,$51C0
	dw $55DD,$6ADE,$2C35,$3898,$38FC,$0000,$51C0,$6E60

DATA_01FD0A:
	dw $0300,$0000,$1084,$1CE7,$2D6B,$3DEF,$4E73,$5EF7
	dw $6F7B,$7FFF,$6ED6,$5DEF,$4D29,$3C84,$2C21,$1C00
	dw $0300,$0011,$0053,$0095,$0116,$0198,$021A,$029C
	dw $035D,$1C76,$0C57,$08D9,$057A,$063C,$02FD,$03FF

DATA_01FD4A:
	dw $02B9,$15D5,$00AB,$7E20,$58C0,$3400,$42DF,$25B4
	dw $0CA9,$7FC0,$6318,$4210,$2529,$03DF,$023F,$0000

DATA_01FD6A:
	dw $0000,$4000,$8000,$C000

DATA_01FD72:
	dw $0088,$0098,$0080,$0212,$0078,$00B8,$006C,$00A8

DATA_01FD82:
	dw $01E7,$0160,$0200,$0150,$01E0,$0140,$01F0,$0130
	dw $01D0,$0181,$0200,$0183,$01D8,$0184,$0208,$0185
	dw $01E0,$0185,$0208,$0186,$01D8,$0187,$0218,$0188
	dw $01C8,$0157,$0203,$0156,$01EC,$0155,$01F0,$0154

DATA_01FDC2:
	dw $0006,$F003,$F003,$F003,$6403,$0000

DATA_01FDCE:
	dw $0006,$D403,$F003,$F003

DATA_01FDD6:
	dw $1003,$8002,$8003,$8004,$F003,$8004

DATA_01FDE2:
	dw $F003,$5803,$8004,$4A03,$1E05,$5003,$0000

DATA_01FDF0:
	dw $0000,$4803,$8004,$C803,$8002,$E003,$0000

DATA_01FDFE:
	dw $0006,$B403,$3005,$3403,$2004,$2203,$3D04,$3C03
	dw $4002,$2003,$4004,$8003,$4004,$3203,$4002,$F003
	dw $9803,$4004,$3403,$4002

DATA_01FE26:
	dw $4803,$8004,$5003,$4004,$9003,$0000,$0006,$4803
	dw $8004,$C803,$8002,$E003,$0006

DATA_01FE40:
	dw $0006,$C403,$3E02,$4003,$3F02,$F003,$2003,$4002
	dw $6003,$8004,$B803,$4002,$5603,$7E04,$5A03,$4002
	dw $6003,$4004,$F003,$7003,$A002,$0803,$0000

DATA_01FE6E:
	dw $B803,$4002,$5603,$7E04,$5A03,$4002,$6003,$4004
	dw $F003,$7003,$A002,$3003,$0000,$0000,$1003,$3E04
	dw $9003,$5001,$0C03,$7C02

DATA_01FE96:
	dw $9603,$4004,$F003,$CC03,$4001,$0C03,$4002,$7003
	dw $8003

DATA_01FEA8:
	dw $7003,$7003,$0006,$0000,$6003,$8004,$0803,$3E05
	dw $F003,$F003,$6003

DATA_01FEBE:
	dw $3003,$6004,$2803,$0006

DATA_01FEC6:
	dw $0006,$D803,$8004,$4A03,$1E05,$A803,$F007,$F007
	dw $0000,$F007,$F007,$3003,$4004,$7003

DATA_01FEE2:
	%InsertGarbageData($01FEE2, incbin, DATA_01FEE2.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank02Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

CODE_028000:
	JSR.w CODE_028AE7
	SEP.b #$20
	STZ.w $15C3
	STZ.w $15C4
	LDX.b $9A
	JSR.w (DATA_0287C1,x)
	LDX.w $15CF
	JSR.w (DATA_028048,x)
	LDX.b $9A
	JSR.w (DATA_028820,x)
	REP.b #$30
	RTL

CODE_02801E:
	JSR.w CODE_028AE7
	SEP.b #$20
	LDA.b #$01
	STA.w $15C3
	STZ.w $15C4
	LDX.b $9A
	JSR.w (DATA_0287C1,x)
	LDX.w $15CF
	JSR.w (DATA_028048,x)
	REP.b #$30
	RTL

CODE_028039:
	SEP.b #$10
	LDX.w $15CF
	JSR.w (DATA_028054,x)
	RTL

CODE_028042:
	JSR.w CODE_028B04
	LDX.b $8C
	RTL

DATA_028048:
	dw CODE_028060
	dw CODE_0280FC
	dw CODE_02819B
	dw CODE_0285D4
	dw CODE_02862F
	dw CODE_028754

DATA_028054:
	dw CODE_028060
	dw CODE_0280FC
	dw CODE_0281BD
	dw CODE_0285D4
	dw CODE_02862F
	dw CODE_028754

CODE_028060:
	SEP.b #$30
	LDY.b #$20
	LDX.b #$00
CODE_028066:
	LDA.b [$8C]
	STA.b $94
	LDA.b #$08
	STA.b $95
CODE_02806E:
	LDA.b #$00
	LSR.b $94
	BCC.b CODE_028075
	DEC
CODE_028075:
	STA.l $0015E3,x
	INX
	DEC.b $95
	BNE.b CODE_02806E
	INC.b $8C
	BNE.b CODE_028091
	INC.b $8D
	BNE.b CODE_028091
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028091:
	DEY
	BNE.b CODE_028066
	REP.b #$20
	LDA.b $98
	SEC
	SBC.w #$0020
	STA.b $98
	SEP.b #$30
CODE_0280A0:
	LDA.b [$8C]
	TAX
	INC.b $8C
	BNE.b CODE_0280B6
	INC.b $8D
	BNE.b CODE_0280B6
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0280B6:
	LDA.l $0015E3,x
	BPL.b CODE_0280ED
	STX.b $94
	LDA.b [$8C]
	TAY
	INC.b $8C
	BNE.b CODE_0280D4
	INC.b $8D
	BNE.b CODE_0280D4
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0280D4:
	LDX.b $9A
CODE_0280D6:
	LDA.b $94
	JSR.w (DATA_028854,x)
	DEY
	BNE.b CODE_0280D6
	REP.b #$20
	LDA.b $98
	SEC
	SBC.w #$0002
	STA.b $98
	SEP.b #$20
	BNE.b CODE_0280A0
	RTS

CODE_0280ED:
	TXA
	LDX.b $9A
	JSR.w (DATA_028854,x)
	REP.b #$20
	DEC.b $98
	SEP.b #$20
	BNE.b CODE_0280A0
	RTS

CODE_0280FC:
	SEP.b #$30
	LDA.b [$8C]
	STA.b $96
	INC.b $8C
	BNE.b CODE_028115
	INC.b $8D
	BNE.b CODE_028115
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028115:
	REP.b #$20
	DEC.b $98
	SEP.b #$20
CODE_02811B:
	LDA.b [$8C]
	CMP.b $96
	BNE.b CODE_02817A
	INC.b $8C
	BNE.b CODE_028134
	INC.b $8D
	BNE.b CODE_028134
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028134:
	LDA.b [$8C]
	STA.b $94
	INC.b $8C
	BNE.b CODE_02814B
	INC.b $8D
	BNE.b CODE_02814B
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02814B:
	LDA.b [$8C]
	TAY
	INC.b $8C
	BNE.b CODE_028161
	INC.b $8D
	BNE.b CODE_028161
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028161:
	LDX.b $9A
CODE_028163:
	LDA.b $94
	JSR.w (DATA_028854,x)
	DEY
	BNE.b CODE_028163
	REP.b #$20
	LDA.b $98
	SEC
	SBC.w #$0003
	STA.b $98
	SEP.b #$20
	BNE.b CODE_02811B
	RTS

CODE_02817A:
	LDX.b $9A
	JSR.w (DATA_028854,x)
	INC.b $8C
	BNE.b CODE_028192
	INC.b $8D
	BNE.b CODE_028192
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028192:
	REP.b #$20
	DEC.b $98
	SEP.b #$20
	BNE.b CODE_02811B
	RTS

CODE_02819B:
	REP.b #$30
	LDA.b $8C
	STA.w $15C5
	LDA.b $8E
	STA.w $15C7
	LDA.b $98
	CLC
	ADC.b $8C
	ORA.w #$8000
	STA.w $15C9
	LDA.b $8E
	ADC.w #$0000
	STA.w $15CB
	STZ.w $15D4
CODE_0281BD:
	SEP.b #$30
	LDA.b [$8C]
	STA.w $15D2
	INC.b $8C
	BNE.b CODE_0281D7
	INC.b $8D
	BNE.b CODE_0281D7
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0281D7:
	LDA.w $15D2
	BIT.b #$40
	BNE.b CODE_0281E1
	JMP.w CODE_0282C5

CODE_0281E1:
	STZ.b $A0
	BIT.b #$20
	BEQ.b CODE_028218
	STZ.b $94
	LDA.b [$8C]
	STA.b $9C
	ORA.b $A0
	STA.b $A0
	LDX.b #$00
	LDA.b $94
CODE_0281F5:
	LSR.b $9C
	BCC.b CODE_0281FD
	STA.l $0015E3,x
CODE_0281FD:
	INX
	CPX.b #$08
	BNE.b CODE_0281F5
	INC.b $8C
	BNE.b CODE_028215
	INC.b $8D
	BNE.b CODE_028215
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028215:
	LDA.w $15D2
CODE_028218:
	BIT.b #$10
	BEQ.b CODE_02824F
	LDA.b #$FF
	STA.b $94
	LDA.b [$8C]
	STA.b $9C
	ORA.b $A0
	STA.b $A0
	LDX.b #$00
	LDA.b $94
CODE_02822C:
	LSR.b $9C
	BCC.b CODE_028234
	STA.l $0015E3,x
CODE_028234:
	INX
	CPX.b #$08
	BNE.b CODE_02822C
	INC.b $8C
	BNE.b CODE_02824C
	INC.b $8D
	BNE.b CODE_02824C
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02824C:
	LDA.w $15D2
CODE_02824F:
	LDX.b #$00
CODE_028251:
	LSR.b $A0
	BCS.b CODE_02826E
	LDA.b [$8C]
	STA.l $0015E3,x
	INC.b $8C
	BNE.b CODE_02826E
	INC.b $8D
	BNE.b CODE_02826E
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02826E:
	INX
	CPX.b #$08
	BNE.b CODE_028251
	LDX.w $15D2
	TXA
	LSR
	ROR
	TAX
	AND.b #$80
	STA.b $9C
	TXA
	ROR
	TAX
	AND.b #$80
	STA.b $9D
	TXA
	ROR
	TAX
	AND.b #$80
	STA.b $9E
	TXA
	ROR
	AND.b #$80
	STA.b $9F
	LDX.b #$07
CODE_028294:
	SEP.b #$20
	LDA.l $0015E3,x
	STA.b $94
	LDY.b #$08
	REP.b #$20
	LDA.w #$0000
CODE_0282A3:
	LSR
	LSR.b $94
	BCC.b CODE_0282AF
	ORA.b $9E
	DEY
	BNE.b CODE_0282A3
	BRA.b CODE_0282B4

CODE_0282AF:
	ORA.b $9C
	DEY
	BNE.b CODE_0282A3
CODE_0282B4:
	PHA
	TXY
	TXA
	ASL
	TAX
	PLA
	STA.l $0015E3,x
	TYX
	DEX
	BPL.b CODE_028294
	JMP.w CODE_02844D

CODE_0282C5:
	BIT.b #$30
	BEQ.b CODE_028337
	LDA.b [$8C]
	STA.b $94
	INC.b $8C
	BNE.b CODE_0282E0
	INC.b $8D
	BNE.b CODE_0282E0
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0282E0:
	LDA.b [$8C]
	STA.b $95
	INC.b $8C
	BNE.b CODE_0282F7
	INC.b $8D
	BNE.b CODE_0282F7
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0282F7:
	REP.b #$10
	LDX.w $15D4
	LDA.w $15D2
	STA.l $001603,x
	LDA.b $8C
	STA.l $001604,x
	LDA.b $8D
	STA.l $001605,x
	LDA.b $8E
	STA.l $001606,x
	REP.b #$20
	LDA.w $15D4
	CLC
	ADC.w #$0004
	STA.w $15D4
	LDA.w $15C5
	CLC
	ADC.b $94
	ORA.w #$8000
	STA.b $8C
	LDA.w $15C7
	ADC.w #$0000
	STA.b $8E
	JMP.w CODE_0281BD

CODE_028337:
	REP.b #$20
	STZ.b $9C
	STZ.b $9E
	STZ.b $A0
	SEP.b #$20
	BIT.b #$04
	BEQ.b CODE_028376
	LDA.b [$8C]
	STA.b $9C
	INC.b $8C
	BNE.b CODE_02835C
	INC.b $8D
	BNE.b CODE_02835C
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02835C:
	LDA.b [$8C]
	STA.b $9D
	INC.b $8C
	BNE.b CODE_028373
	INC.b $8D
	BNE.b CODE_028373
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028373:
	LDA.w $15D2
CODE_028376:
	BIT.b #$02
	BEQ.b CODE_0283AB
	LDA.b [$8C]
	STA.b $9E
	INC.b $8C
	BNE.b CODE_028391
	INC.b $8D
	BNE.b CODE_028391
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028391:
	LDA.b [$8C]
	STA.b $9F
	INC.b $8C
	BNE.b CODE_0283A8
	INC.b $8D
	BNE.b CODE_0283A8
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0283A8:
	LDA.w $15D2
CODE_0283AB:
	LSR
	BCC.b CODE_0283F3
	LDA.b [$8C]
	STA.b $94
	INC.b $8C
	BNE.b CODE_0283C5
	INC.b $8D
	BNE.b CODE_0283C5
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0283C5:
	LDA.b [$8C]
	STA.b $A0
	INC.b $8C
	BNE.b CODE_0283DC
	INC.b $8D
	BNE.b CODE_0283DC
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0283DC:
	LDA.b [$8C]
	STA.b $A1
	INC.b $8C
	BNE.b CODE_0283F3
	INC.b $8D
	BNE.b CODE_0283F3
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0283F3:
	REP.b #$20
	LDX.b #$00
CODE_0283F7:
	LSR.b $9C
	BCC.b CODE_02840B
	SEP.b #$20
	LDA.b #$00
	STA.l $0015E3,x
	REP.b #$20
	LSR.b $9E
	LSR.b $A0
	BRA.b CODE_028448

CODE_02840B:
	LSR.b $9E
	BCC.b CODE_02841D
	SEP.b #$20
	LDA.b #$FF
	STA.l $0015E3,x
	REP.b #$20
	LSR.b $A0
	BRA.b CODE_028448

CODE_02841D:
	LSR.b $A0
	BCC.b CODE_02842B
	SEP.b #$20
	LDA.b $94
	STA.l $0015E3,x
	BRA.b CODE_028446

CODE_02842B:
	SEP.b #$20
	LDA.b [$8C]
	STA.l $0015E3,x
	INC.b $8C
	BNE.b CODE_028446
	INC.b $8D
	BNE.b CODE_028446
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028446:
	REP.b #$20
CODE_028448:
	INX
	CPX.b #$10
	BNE.b CODE_0283F7
CODE_02844D:
	SEP.b #$30
	BIT.w $15D2
	BPL.b CODE_028457
	JSR.w CODE_028576
CODE_028457:
	REP.b #$10
	LDX.w $15D4
	BNE.b CODE_028461
	JMP.w CODE_02854E

CODE_028461:
	DEX
	DEX
	DEX
	DEX
	LDA.l $001603,x
	STA.w $15D2
	LDA.l $001604,x
	STA.b $8C
	LDA.l $001605,x
	STA.b $8D
	LDA.l $001606,x
	STA.b $8E
	STX.w $15D4
	SEP.b #$10
	LDA.w $15D2
	BIT.b #$20
	BEQ.b CODE_0284DE
	LDA.b [$8C]
	STA.b $9C
	INC.b $8C
	BNE.b CODE_0284A1
	INC.b $8D
	BNE.b CODE_0284A1
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0284A1:
	LDA.b [$8C]
	STA.b $9D
	INC.b $8C
	BNE.b CODE_0284B8
	INC.b $8D
	BNE.b CODE_0284B8
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0284B8:
	LDX.b #$00
CODE_0284BA:
	LSR.b $9D
	ROR.b $9C
	BCC.b CODE_0284D9
	LDA.b [$8C]
	STA.l $0015E3,x
	INC.b $8C
	BNE.b CODE_0284D9
	INC.b $8D
	BNE.b CODE_0284D9
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0284D9:
	INX
	CPX.b #$10
	BNE.b CODE_0284BA
CODE_0284DE:
	LDA.w $15D2
	BIT.b #$01
	BEQ.b CODE_028534
	REP.b #$30
	LDA.l $0015E3
	TAX
	LDA.l $0015F1
	STA.l $0015E3
	TXA
	STA.l $0015F1
	LDA.l $0015E5
	TAX
	LDA.l $0015EF
	STA.l $0015E5
	TXA
	STA.l $0015EF
	LDA.l $0015E7
	TAX
	LDA.l $0015ED
	STA.l $0015E7
	TXA
	STA.l $0015ED
	LDA.l $0015E9
	TAX
	LDA.l $0015EB
	STA.l $0015E9
	TXA
	STA.l $0015EB
	SEP.b #$30
	LDA.w $15D2
CODE_028534:
	BIT.b #$02
	BEQ.b CODE_02854B
	LDX.b #$00
CODE_02853A:
	LDA.l $0015E3,x
	TAY
	LDA.w DATA_01BA4A,y
	STA.l $0015E3,x
	INX
	CPX.b #$10
	BNE.b CODE_02853A
CODE_02854B:
	JMP.w CODE_02844D

CODE_02854E:
	SEP.b #$30
	LDX.b $9A
	JSR.w (DATA_0288D9,x)
	LDA.w $15C4
	BNE.b CODE_028572
	REP.b #$30
	LDA.b $8C
	CMP.w $15C9
	LDA.b $8E
	SBC.w $15CB
	BCS.b CODE_028572
	SEP.b #$20
	LDA.w $15C3
	BNE.b CODE_028574
	JMP.w CODE_0281BD

CODE_028572:
	SEC
	RTS

CODE_028574:
	CLC
	RTS

CODE_028576:
	SEP.b #$30
	LDX.b #$0F
	LDA.b #$00
CODE_02857C:
	STA.l $0015F3,x
	DEX
	BPL.b CODE_02857C
	STZ.b $94
	LDA.b #$80
	STA.b $95
CODE_028589:
	LDX.b $94
	LDA.l $0015E3,x
	STA.b $96
	LDA.l $0015E4,x
	STA.b $97
	INX
	INX
	STX.b $94
	LDX.b #$0E
CODE_02859D:
	ASL.b $96
	BCC.b CODE_0285AB
	LDA.l $0015F3,x
	ORA.b $95
	STA.l $0015F3,x
CODE_0285AB:
	ASL.b $97
	BCC.b CODE_0285B9
	LDA.l $0015F4,x
	ORA.b $95
	STA.l $0015F4,x
CODE_0285B9:
	DEX
	DEX
	BPL.b CODE_02859D
	LSR.b $95
	BCC.b CODE_028589
	LDX.b #$0E
	REP.b #$20
CODE_0285C5:
	LDA.l $0015F3,x
	STA.l $0015E3,x
	DEX
	DEX
	BPL.b CODE_0285C5
	SEP.b #$30
	RTS

CODE_0285D4:
	REP.b #$10
	SEP.b #$20
	LDX.b $9A
	LDY.b $98
	BEQ.b CODE_0285F9
CODE_0285DE:
	LDA.b [$8C]
	JSR.w (DATA_028854,x)
	INC.b $8C
	BNE.b CODE_0285F6
	INC.b $8D
	BNE.b CODE_0285F6
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0285F6:
	DEY
	BNE.b CODE_0285DE
CODE_0285F9:
	RTS

CODE_0285FA:
	LDX.b $9A
	JSR.w (DATA_028854,x)
	INC.b $8C
	BNE.b CODE_028612
	INC.b $8D
	BNE.b CODE_028612
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028612:
	LDA.b [$8C]
	JSR.w (DATA_028854,x)
	INC.b $8C
	BNE.b CODE_02862A
	INC.b $8D
	BNE.b CODE_02862A
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02862A:
	DEY
	DEY
	BNE.b CODE_028665
	RTS

CODE_02862F:
	SEP.b #$20
	REP.b #$10
	LDA.b [$8C]
	STA.b $96
	INC.b $8C
	BNE.b CODE_02864A
	INC.b $8D
	BNE.b CODE_02864A
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02864A:
	LDA.b [$8C]
	STA.b $97
	INC.b $8C
	BNE.b CODE_028661
	INC.b $8D
	BNE.b CODE_028661
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028661:
	LDY.b $98
	DEY
	DEY
CODE_028665:
	LDA.b [$8C]
	CMP.b $96
	BNE.b CODE_0285FA
	STA.b $94
	INC.b $8C
	BNE.b CODE_028680
	INC.b $8D
	BNE.b CODE_028680
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028680:
	LDA.b [$8C]
	CMP.b $97
	BNE.b CODE_0286FD
	INC.b $8C
	BNE.b CODE_028699
	INC.b $8D
	BNE.b CODE_028699
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028699:
	LDA.b [$8C]
	STA.b $94
	INC.b $8C
	BNE.b CODE_0286B0
	INC.b $8D
	BNE.b CODE_0286B0
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0286B0:
	LDA.b [$8C]
	STA.b $95
	INC.b $8C
CODE_0286B6:
	BNE.b CODE_0286C7
	INC.b $8D
	BNE.b CODE_0286C7
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0286C7:
	PHY
	LDA.b [$8C]
	SEP.b #$10
	TAY
	INC.b $8C
	BNE.b CODE_0286E0
	INC.b $8D
	BNE.b CODE_0286E0
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_0286E0:
	LDX.b $9A
CODE_0286E2:
	LDA.b $94
	JSR.w (DATA_028854,x)
	LDA.b $95
	JSR.w (DATA_028854,x)
	DEY
	BNE.b CODE_0286E2
	REP.b #$10
	PLY
	DEY
	DEY
	DEY
	DEY
	DEY
	BEQ.b CODE_0286FC
	JMP.w CODE_028665

CODE_0286FC:
	RTS

CODE_0286FD:
	PHA
	LDA.b $94
	LDX.b $9A
	JSR.w (DATA_028854,x)
	PLA
	JSR.w (DATA_028854,x)
	INC.b $8C
	BNE.b CODE_02871C
	INC.b $8D
	BNE.b CODE_02871C
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02871C:
	DEY
	DEY
	BEQ.b CODE_0286FC
	JMP.w CODE_028665

CODE_028723:
	STY.b $96
	SEP.b #$10
	LDA.b [$8C]
	TAY
	INC.b $8C
	BNE.b CODE_02873D
	INC.b $8D
	BNE.b CODE_02873D
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02873D:
	LDA.b $94
	JSR.w (DATA_028854,x)
	LDA.b $95
	JSR.w (DATA_028854,x)
	DEY
	BNE.b CODE_02873D
	REP.b #$10
	LDY.b $96
	DEY
	DEY
	DEY
	BNE.b CODE_02875C
	RTS

CODE_028754:
	SEP.b #$20
	REP.b #$10
	LDX.b $9A
	LDY.b $98
CODE_02875C:
	LDA.b [$8C]
	STA.b $96
	INC.b $8C
	BNE.b CODE_028773
	INC.b $8D
	BNE.b CODE_028773
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_028773:
	LDA.b [$8C]
	STA.b $95
	INC.b $8C
	BNE.b CODE_02878A
	INC.b $8D
	BNE.b CODE_02878A
	REP.b #$20
	LDA.w #$8000
	STA.b $8C
	INC.b $8E
	SEP.b #$20
CODE_02878A:
	LDA.b $96
	AND.b #$EE
	STA.b $94
	CMP.b $96
	BEQ.b CODE_0287B2
	LDA.b $96
	BIT.b #$10
	BEQ.b CODE_028723
	BIT.b #$01
	BEQ.b CODE_0287A8
	LDA.b $94
	JSR.w (DATA_028854,x)
	LDA.b $95
	JSR.w (DATA_028854,x)
CODE_0287A8:
	LDA.b $94
	JSR.w (DATA_028854,x)
	LDA.b $95
	JSR.w (DATA_028854,x)
CODE_0287B2:
	LDA.b $94
	JSR.w (DATA_028854,x)
	LDA.b $95
	JSR.w (DATA_028854,x)
	DEY
	DEY
	BNE.b CODE_02875C
	RTS

DATA_0287C1:
	dw CODE_0287E5
	dw CODE_0287CD
	dw CODE_0287D3
	dw CODE_0287CD
	dw CODE_0287F6
	dw CODE_028818

CODE_0287CD:
	SEP.b #$20
	LDA.b #$80
	BRA.b CODE_0287D7

CODE_0287D3:
	SEP.b #$20
	LDA.b #$00
CODE_0287D7:
	STA.w $2115
	STZ.w $15D1
	REP.b #$20
	LDA.b $90
	STA.w $2116
	RTS

CODE_0287E5:
	REP.b #$20
	LDA.b $90
	STA.w $2181
	SEP.b #$20
	LDA.b $92
	AND.b #$01
	STA.w $2183
	RTS

CODE_0287F6:
	SEP.b #$20
	LDA.l $001FC0
	STA.l $001FC2
	LDA.b #$55
	STA.w $2141
	REP.b #$20
	LDA.w #$BBAA
CODE_02880A:
	CMP.w $2140
	BNE.b CODE_02880A
	LDA.w #$0004
	STA.w $15D6
	STZ.b $92
	RTS

CODE_028818:
	SEP.b #$20
	LDA.b $90
	STA.w $2121
	RTS

DATA_028820:
	dw CODE_02882C
	dw CODE_02882C
	dw CODE_02882C
	dw CODE_02882C
	dw CODE_02882D
	dw CODE_02882C

CODE_02882C:
	RTS

CODE_02882D:
	REP.b #$20
	LDA.b $90
	BNE.b CODE_028836
	LDA.w #$FFC0
CODE_028836:
	PHA
	STA.w $2142
	SEP.b #$20
	STZ.w $2141
	LDA.b $92
	CLC
	ADC.b #$03
	STA.w $2140
	REP.b #$20
	PLA
	CMP.w #$FFC0
	BEQ.b CODE_028853
	JSL.l CODE_028B99
CODE_028853:
	RTS

DATA_028854:
	dw CODE_028860
	dw CODE_02887C
	dw CODE_028891
	dw CODE_028895
	dw CODE_028899
	dw CODE_0288D5

CODE_028860:
	STA.w $2180
	RTS

CODE_028864:
	STA.b [$90]
	INC.b $90
	BEQ.b CODE_02886B
	RTS

CODE_02886B:
	INC.b $91
	BEQ.b CODE_028870
	RTS

CODE_028870:
	REP.b #$20
	LDA.w #$8000
	STA.b $90
	INC.b $92
	SEP.b #$20
	RTS

CODE_02887C:
	BIT.w $15D1
	BPL.b CODE_028888
	STA.w $2119
	STZ.w $15D1
	RTS

CODE_028888:
	STA.w $2118
	LDA.b #$80
	STA.w $15D1
	RTS

CODE_028891:
	STA.w $2118
	RTS

CODE_028895:
	STA.w $2119
	RTS

CODE_028899:
	LSR.w $15D6
	BEQ.b CODE_0288C5
	PHP
	REP.b #$10
	PHX
	PHA
	LDX.w #$0000
	LDA.w $15D6
	LSR
	BCC.b CODE_0288AD
	INX
CODE_0288AD:
	PLA
	STA.w $2142,x
	BCC.b CODE_0288C2
	LDA.b #$01
	STA.w $2141
CODE_0288B8:
	LDA.b #$CC
	STA.w $2140
	CMP.w $2140
	BNE.b CODE_0288B8
CODE_0288C2:
	PLX
	PLP
	RTS

CODE_0288C5:
	STA.w $2141
	LDA.b $92
	STA.w $2140
CODE_0288CD:
	CMP.w $2140
	BNE.b CODE_0288CD
	INC.b $92
	RTS

CODE_0288D5:
	STA.w $2122
	RTS

DATA_0288D9:
	dw CODE_0288E5
	dw CODE_028956
	dw CODE_028993
	dw CODE_028A04
	dw CODE_028A75
	dw CODE_028A76

CODE_0288E5:
	LDA.l $0015E3
	STA.w $2180
	LDA.l $0015E4
	STA.w $2180
	LDA.l $0015E5
	STA.w $2180
	LDA.l $0015E6
	STA.w $2180
	LDA.l $0015E7
	STA.w $2180
	LDA.l $0015E8
	STA.w $2180
	LDA.l $0015E9
	STA.w $2180
	LDA.l $0015EA
	STA.w $2180
	LDA.l $0015EB
	STA.w $2180
	LDA.l $0015EC
	STA.w $2180
	LDA.l $0015ED
	STA.w $2180
	LDA.l $0015EE
	STA.w $2180
	LDA.l $0015EF
	STA.w $2180
	LDA.l $0015F0
	STA.w $2180
	LDA.l $0015F1
	STA.w $2180
	LDA.l $0015F2
	STA.w $2180
	RTS

CODE_028956:
	REP.b #$20
	LDA.l $0015E3
	STA.w $2118
	LDA.l $0015E5
	STA.w $2118
	LDA.l $0015E7
	STA.w $2118
	LDA.l $0015E9
	STA.w $2118
	LDA.l $0015EB
	STA.w $2118
	LDA.l $0015ED
	STA.w $2118
	LDA.l $0015EF
	STA.w $2118
	LDA.l $0015F1
	STA.w $2118
	SEP.b #$20
	RTS

CODE_028993:
	LDA.l $0015E3
	STA.w $2118
	LDA.l $0015E4
	STA.w $2118
	LDA.l $0015E5
	STA.w $2118
	LDA.l $0015E6
	STA.w $2118
	LDA.l $0015E7
	STA.w $2118
	LDA.l $0015E8
	STA.w $2118
	LDA.l $0015E9
	STA.w $2118
	LDA.l $0015EA
	STA.w $2118
	LDA.l $0015EB
	STA.w $2118
	LDA.l $0015EC
	STA.w $2118
	LDA.l $0015ED
	STA.w $2118
	LDA.l $0015EE
	STA.w $2118
	LDA.l $0015EF
	STA.w $2118
	LDA.l $0015F0
	STA.w $2118
	LDA.l $0015F1
	STA.w $2118
	LDA.l $0015F2
	STA.w $2118
	RTS

CODE_028A04:
	LDA.l $0015E3
	STA.w $2119
	LDA.l $0015E4
	STA.w $2119
	LDA.l $0015E5
	STA.w $2119
	LDA.l $0015E6
	STA.w $2119
	LDA.l $0015E7
	STA.w $2119
	LDA.l $0015E8
	STA.w $2119
	LDA.l $0015E9
	STA.w $2119
	LDA.l $0015EA
	STA.w $2119
	LDA.l $0015EB
	STA.w $2119
	LDA.l $0015EC
	STA.w $2119
	LDA.l $0015ED
	STA.w $2119
	LDA.l $0015EE
	STA.w $2119
	LDA.l $0015EF
	STA.w $2119
	LDA.l $0015F0
	STA.w $2119
	LDA.l $0015F1
	STA.w $2119
	LDA.l $0015F2
	STA.w $2119
	RTS

CODE_028A75:
	RTS

CODE_028A76:
	LDA.l $0015E3
	STA.w $2122
	LDA.l $0015E4
	STA.w $2122
	LDA.l $0015E5
	STA.w $2122
	LDA.l $0015E6
	STA.w $2122
	LDA.l $0015E7
	STA.w $2122
	LDA.l $0015E8
	STA.w $2122
	LDA.l $0015E9
	STA.w $2122
	LDA.l $0015EA
	STA.w $2122
	LDA.l $0015EB
	STA.w $2122
	LDA.l $0015EC
	STA.w $2122
	LDA.l $0015ED
	STA.w $2122
	LDA.l $0015EE
	STA.w $2122
	LDA.l $0015EF
	STA.w $2122
	LDA.l $0015F0
	STA.w $2122
	LDA.l $0015F1
	STA.w $2122
	LDA.l $0015F2
	STA.w $2122
	RTS

CODE_028AE7:
	STX.b $90
	STY.w $15CD
	TAX
	XBA
	AND.w #$00FE
	STA.b $9A
	TXA
	AND.w #$00FF
	STA.b $92
	LDA.w SXAR_UnsortedDataBlock1_DATA_01B6E2,y
	STA.w $15CF
	LDA.w SXAR_UnsortedDataBlock1_DataBlockSize,y
	STA.b $98
CODE_028B04:
	TYA
	ASL
	TAY
	LDA.w SXAR_UnsortedDataBlock1_Ptrs,y
	CLC
	ADC.w #SXAR_UnsortedDataBlock1_Main&$8000
	ORA.w #SXAR_UnsortedDataBlock1_Main&$8000
	STA.b $8C
	PHP
	LDA.w SXAR_UnsortedDataBlock1_Ptrs+$02,y
	ASL
	PLP
	ADC.w #SXAR_UnsortedDataBlock1_Main>>16
	STA.b $8E
	RTS

CODE_028B1F:
	PHP
	REP.b #$30
	PHX
	PHY
	PHA
	SEP.b #$30
	LDA.l $001FC2
	TAX
	INC
	AND.b #$0F
	CMP.l $001FC0
	BEQ.b CODE_028B4D
	PLA
	STA.l $001FD6,x
	PLA
	STA.l $001FC6,x
	INX
	TXA
	AND.b #$0F
	STA.l $001FC2
	REP.b #$30
	PLY
	PLX
	PLP
	RTL

CODE_028B4D:
	REP.b #$30
	PLA
	PLY
	PLX
	PLP
	RTL

CODE_028B54:
	PHP
	SEP.b #$30
	LDA.l $001FC4
	CMP.w $2140
	BNE.b CODE_028B96
	LDA.l $001FC0
	CMP.l $001FC2
	BEQ.b CODE_028B96
	TAX
	LDA.l $001FC6,x
	PHA
	LDA.l $001FD6,x
	PHA
	TXA
	INC
	AND.b #$0F
	STA.l $001FC0
	REP.b #$20
	PLA
	STA.w $2142
	SEP.b #$20
	LDA.l $001FC4
CODE_028B89:
	INC
CODE_028B8A:
	BEQ.b CODE_028B89
	STA.l $001FC4
	STA.w $2140
	PLP
	CLC
	RTL

CODE_028B96:
	PLP
	SEC
	RTL

CODE_028B99:
	PHP
	SEP.b #$20
	LDA.b #$FA
CODE_028B9E:
	CMP.w $2140
	BNE.b CODE_028B9E
	STA.l $001FC4
	STA.w $2140
	REP.b #$20
	LDA.w #$0001
	STA.l $001FC0
	STA.l $001FC2
	PLP
	RTL

CODE_028BB9:
	REP.b #$30
	LDX.w #$0003
CODE_028BBE:
	JSL.l CODE_0295A6
	DEX
	BPL.b CODE_028BBE
	LDA.w #$2A02
	JSL.l CODE_028B1F
	RTL

CODE_028BCD:
	PHP
	REP.b #$30
	LDX.w #$0000
	LDA.w #$007F
	STA.w $128C,x
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01DBEE,y
	STA.w $129C,x
	CLC
	ADC.w #$0200
	STA.w $12AC,x
	CLC
	ADC.w #$0200
	STA.w $12BC,x
	CLC
	ADC.w #$0200
	STA.w $12CC,x
	CLC
	ADC.w #$0200
	STA.w $12DC,x
	CLC
	ADC.w #$0200
	STA.w $12EC,x
	CLC
	ADC.w #$0200
	PLP
	RTL

CODE_028C0D:
	PHP
	REP.b #$30
	LDX.w #$0000
	LDA.w #$007F
	STA.w $128C,x
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01DC46,y
	STA.w $129C,x
	CLC
	ADC.w #$0200
	STA.w $12AC,x
	CLC
	ADC.w #$0200
	STA.w $12BC,x
	CLC
	ADC.w #$0200
	STA.w $12CC,x
	CLC
	ADC.w #$0200
	STA.w $12DC,x
	CLC
	ADC.w #$0200
	STA.w $12EC,x
	CLC
	ADC.w #$0200
	PLP
	RTL

CODE_028C4D:
	PHP
	REP.b #$30
	LDX.w #$0000
	LDA.w #$007F
	STA.w $128C,x
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01DBEE,y
	STA.w $129C,x
	CLC
	ADC.w #$0200
	STA.w $12AC,x
	CLC
	ADC.w #$0200
	STA.w $12BC,x
	CLC
	ADC.w #$0200
	STA.w $12CC,x
	CLC
	ADC.w #$0200
	STA.w $12DC,x
	CLC
	ADC.w #$0200
	STA.w $12EC,x
	CLC
	ADC.w #$0200
	PLP
	RTL

CODE_028C8D:
	PHP
	REP.b #$30
	LDA.w #$007F
	STA.w $128E
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w DATA_01DC5E,y
	STA.w $129E
	CLC
	ADC.w #$0200
	STA.w $12AE
	CLC
	ADC.w #$0200
	STA.w $12BE
	CLC
	ADC.w #$0200
	STA.w $12CE
	CLC
	ADC.w #$0200
	STA.w $12DE
	CLC
	ADC.w #$0200
	STA.w $12EE
	CLC
	ADC.w #$0200
	PLP
	RTL

CODE_028CCA:
	PHP
	REP.b #$30
	LDX.w #$0086
CODE_028CD0:
	STZ.w $13A8,x
	DEX
	DEX
	BPL.b CODE_028CD0
	LDX.w #$0066
CODE_028CDA:
	STZ.w $1430,x
	DEX
	DEX
	BPL.b CODE_028CDA
	PLP
	RTL

CODE_028CE3:
	REP.b #$30
	LDA.w $0F78,x
	CMP.w #$0014
	BCC.b CODE_028CF1
	JSL.l CODE_0097E0
CODE_028CF1:
	RTL

CODE_028CF2:
	LDA.w $0762,x
	STA.b $68
	LDA.w $07EC,x
	STA.b $6C
	LDA.w #DATA_019AE2
	JSL.l CODE_0097AC
	RTL

CODE_028D04:
	REP.b #$30
	LDA.w #DATA_01D4E2
	STA.b $64
	LDA.w #$0004
	STA.b $68
	JSL.l CODE_02933D
	STZ.b $0E
	LDA.w #$0000
	STA.b $AC
	LDA.w #$004F
	STA.b $AE
CODE_028D20:
	JSL.l CODE_0295A6
	JSL.l CODE_02951C
	JSR.w CODE_028D3B
	JSL.l CODE_02A044
	JSL.l CODE_0295D2
	LDA.b $0E
	CMP.w #$0057
	BNE.b CODE_028D20
	RTL

CODE_028D3B:
	PHP
	SEP.b #$30
	LDX.b #$12
	LDA.b $AC
	STA.b $8C
CODE_028D44:
	LDA.b $8C
	LDY.b #$3F
	PHX
	JSL.l CODE_029474
	PLX
	CLC
	ADC.b #$80
	CPX.b #$0C
	BCS.b CODE_028D58
	SEC
	SBC.b #$20
CODE_028D58:
	STA.w $04B0,x
	STZ.w $04B1,x
	LDA.b $8C
	LDY.b $AE
	PHX
	JSL.l CODE_02946D
	PLX
	CLC
	ADC.b #$60
	STA.w $053A,x
	LDA.b $8C
	CLC
	ADC.b #$0A
	STA.b $8C
	DEX
	DEX
	CPX.b #$02
	BNE.b CODE_028D44
	LDA.b $AC
	CLC
	ADC.b #$04
	STA.b $AC
	LDA.b $AE
	SEC
	SBC.b #$01
	BCS.b CODE_028D8B
	LDA.b #$00
CODE_028D8B:
	STA.b $AE
	PLP
	RTS

CODE_028D8F:
	PHP
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	STZ.w $2101
	STZ.w $2102
	STZ.w $2103
	STZ.w $2104
	STZ.w $2105
	STZ.w $2106
	STZ.w $2107
	STZ.w $2108
	STZ.w $2109
	STZ.w $210A
	STZ.w $210B
	STZ.w $210C
	STZ.w $210D
	STZ.w $210D
	STZ.w $210F
	STZ.w $210F
	STZ.w $2111
	STZ.w $2111
	STZ.w $2113
	STZ.w $2113
	STZ.w $210E
	STZ.w $210E
	STZ.w $2110
	STZ.w $2110
	STZ.w $2112
	STZ.w $2112
	STZ.w $2114
	STZ.w $2114
	LDA.b #$80
	STA.w $2115
	STZ.w $2116
	STZ.w $2117
	STZ.w $211A
	LDA.b #$01
	STZ.w $211B
	STA.w $211B
	STZ.w $211C
	STZ.w $211C
	STZ.w $211D
	STZ.w $211D
	STZ.w $211E
	STA.w $211E
	STZ.w $211F
	STZ.w $211F
	STZ.w $2120
	STZ.w $2120
	STZ.w $2121
	STZ.w $2122
	STZ.w $2122
	STZ.w $2123
	STZ.w $2124
	STZ.w $2125
	STZ.w $2126
	STZ.w $2127
	STZ.w $2128
	STZ.w $2129
	STZ.w $212A
	STZ.w $212B
	STZ.w $212C
	STZ.w $212D
	STZ.w $212E
	STZ.w $212F
	LDA.b #$30
CODE_028E51:
	STA.w $2130
	STZ.w $2131
	LDA.b #$E0
	STA.w $2132
	STZ.w $2133
	STZ.w $4200
	LDA.b #$FF
	STA.w $4201
	STZ.w $4202
	STZ.w $4203
	STZ.w $4204
	STZ.w $4205
	STZ.w $4206
	STZ.w $4207
	STZ.w $4208
	STZ.w $4209
	STZ.w $420A
	STZ.w $420B
	STZ.w $420C
	STZ.w $420D
	JSL.l CODE_0295BF
	PLP
	RTL

CODE_028E91:
	PHP
	REP.b #$10
	SEP.b #$20
	LDA.b #$00
	LDX.w #$0000
CODE_028E9B:
	STA.l $7F0000,x
	INX
	BNE.b CODE_028E9B
	LDX.w #$00FF
CODE_028EA5:
	STZ.b $00,x
	DEX
	BPL.b CODE_028EA5
	LDX.w #$0200
CODE_028EAD:
	STA.l $7E0000,x
	INX
	BNE.b CODE_028EAD
	PLP
	RTL

CODE_028EB6:
	PHP
	REP.b #$20
	STZ.w $013D
	SEP.b #$20
	JSL.l CODE_0295A6
	LDA.b #$80
	STA.b $1A
	LDA.b #$80
	STA.w $2100
	STZ.w $420B
	STZ.w $420C
	JSL.l CODE_0295A6
	LDA.b #$17
	STA.w $212C
	STA.w $212E
	STZ.b $14
	STZ.b $16
	STZ.w $2123
	STZ.w $2124
	STZ.w $2125
	JSL.l CODE_029573
	JSL.l CODE_02953D
	JSL.l CODE_0295BF
	PLP
	RTL

CODE_028EF8:
	REP.b #$30
CODE_028EFA:
	LDA.w $098A,x
	XBA
	AND.w #$00FF
	STA.b $8C
	LDA.w $098A,x
	AND.w #$00FF
	STA.b $8E
	LDA.b $0E
	AND.w #$00FF
	AND.b $8E
	BNE.b CODE_028F16
	INC.b $8C
CODE_028F16:
	LDA.w $0A9E,x
	AND.w #$0004
	BEQ.b CODE_028F30
	LDA.w $1498
	BEQ.b CODE_028F26
	JMP.w CODE_028F42

CODE_028F26:
	LDA.w $0762,x
	SEC
	SBC.b $8C
	STA.w $0762,x
	RTL

CODE_028F30:
	LDA.w $1498
	BEQ.b CODE_028F38
	JMP.w CODE_028F47

CODE_028F38:
	LDA.w $0762,x
	CLC
	ADC.b $8C
	STA.w $0762,x
	RTL

CODE_028F42:
	JSL.l CODE_0097D8
	RTL

CODE_028F47:
	JSL.l CODE_0097DC
	RTL

CODE_028F4C:
	LDA.w $0A9E,x
	AND.w #$0008
	BEQ.b CODE_028F5F
	LDA.w $07EC,x
	SEC
	SBC.w $0A14,x
	STA.w $07EC,x
	RTL

CODE_028F5F:
	LDA.w $07EC,x
	CLC
	ADC.w $0A14,x
	STA.w $07EC,x
	RTL

CODE_028F6A:
	LDA.w $0A14,x
	BMI.b CODE_028F7B
	XBA
	AND.w #$00FF
CODE_028F73:
	CLC
	ADC.w $07EC,x
	STA.w $07EC,x
	RTL

CODE_028F7B:
	XBA
	AND.w #$00FF
	ORA.w #$FF00
	BRA.b CODE_028F73

CODE_028F84:
	LDA.w $0A9E,x
	AND.w #$0008
	BNE.b CODE_028FA1
	LDA.w $0A14,x
	CLC
	ADC.w #$0010
	BMI.b CODE_028F9D
	CMP.w #$0120
	BCC.b CODE_028F9D
	LDA.w #$0120
CODE_028F9D:
	STA.w $0A14,x
	RTL

CODE_028FA1:
	LDA.w $0A14,x
	SEC
	SBC.w #$0010
	BPL.b CODE_028FB4
	CMP.w #$FEE0
	BEQ.b CODE_028FB1
	BCS.b CODE_028FB4
CODE_028FB1:
	LDA.w #$FEE0
CODE_028FB4:
	STA.w $0A14,x
	RTL

CODE_028FB8:
	LDA.w $0A9E,x
	AND.w #$FFF3
	STA.b $8C
	LDA.w $0762,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BCC.b CODE_028FCF
	LDA.b $8C
	ORA.w #$0004
	STA.b $8C
CODE_028FCF:
	LDA.w $0900,x
	LSR
	STA.b $8E
	LDA.w $07EC,x
	SEC
	SBC.b $8E
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCC.b CODE_028FE7
	LDA.b $8C
	ORA.w #$0008
	STA.b $8C
CODE_028FE7:
	LDA.b $8C
	STA.w $0A9E,x
	RTL

CODE_028FED:
	LDA.w $0762,x
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo
	BCC.b CODE_028FFF
	LDA.w $0A9E,x
	ORA.w #$0004
	STA.w $0A9E,x
	RTL

CODE_028FFF:
	LDA.w $0A9E,x
	AND.w #$FFFB
	STA.w $0A9E,x
	RTL

CODE_029009:
	LDA.w $0900,x
	LSR
	STA.b $8E
	LDA.w $07EC,x
	SEC
	SBC.b $8E
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo
	BCC.b CODE_029024
	LDA.w $0A9E,x
	ORA.w #$0008
	STA.w $0A9E,x
	RTL

CODE_029024:
	LDA.w $0A9E,x
	AND.w #$FFF7
	STA.w $0A9E,x
	RTL

CODE_02902E:
	LDA.w $0A9E,x
	BIT.w #$0004
	BEQ.b CODE_02903D
	ORA.w #$4000
	STA.w $0A9E,x
	RTL

CODE_02903D:
	AND.w #$BFFF
	STA.w $0A9E,x
	RTL

CODE_029044:
	REP.b #$30
	JSL.l CODE_029067
	LDA.w $0DDA,x
	CMP.w #$000C
	BEQ.b CODE_029057
	CMP.w #$000D
	BNE.b CODE_029061
CODE_029057:
	LDY.b $20
	BMI.b CODE_029061
	LDA.w #$009E
	STA.w $0426,y
CODE_029061:
	RTL

CODE_029062:
	REP.b #$30
	LDX.w #$0000
CODE_029067:
	LDA.w $0426,x
	CMP.w #!Define_SXAR_SpriteID_PlayerCyclops
	BEQ.b CODE_02907A
	CMP.w #!Define_SXAR_SpriteID_PlayerWolverine
	BEQ.b CODE_02907A
	CMP.w #!Define_SXAR_SpriteID_Obnoxio
	BEQ.b CODE_02907A
	RTL

CODE_02907A:
	ASL
	TAY
	LDA.w DATA_01E59E,y
	STA.b $8C
	LDY.w #$0000
CODE_029084:
	LDA.b ($8C),y
	BEQ.b CODE_0290E8
	CMP.w $0DDA,x
	BEQ.b CODE_029095
	TYA
	CLC
	ADC.w #$0008
	TAY
	BRA.b CODE_029084

CODE_029095:
	INY
	INY
	LDA.b ($8C),y
	STA.b $74
	INY
	INY
	LDA.b ($8C),y
	STA.b $AC
	INY
	INY
	LDA.b ($8C),y
	STA.b $AE
	LDA.w $0A9E,x
	AND.w #$6001
	ORA.w #$2000
	STA.b $70
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_0290BD
	JMP.w CODE_029162

CODE_0290BD:
	LDA.w $0762,x
	CLC
	ADC.w #$0010
	SEC
	SBC.b $AC
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$002F
	CLC
	ADC.b $AE
	STA.b $6C
	LDA.w #DATA_0182A8
	JSL.l CODE_0097AC
	LDY.b $20
	BMI.b CODE_0290E8
CODE_0290E0:
	LDA.w $0426,x
	CMP.w #!Define_SXAR_SpriteID_PlayerWolverine
	BEQ.b CODE_0290F6
CODE_0290E8:
	RTL

CODE_0290E9:
	LDA.w $1598
	BEQ.b CODE_0290E8
	LDA.w #$0100
	STA.w $0C3C,y
	BRA.b CODE_0290E8

CODE_0290F6:
	LDA.w $159C
	BMI.b CODE_029136
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BEQ.b CODE_0290E9
	LDA.w $0CC6
	CMP.w #$0003
	BNE.b CODE_02910F
	LDA.w #$1D02
	JSL.l CODE_028B1F
CODE_02910F:
	LDA.w $1598
	BNE.b CODE_02912E
	LDA.w $0C3C,y
	ASL
	ASL
	STA.w $0C3C,y
CODE_02911C:
	LDA.w #$001C
	STA.w $0876,y
	LDA.w #$0010
	STA.w $0900,y
	JSL.l CODE_029281
	BRA.b CODE_0290E8

CODE_02912E:
	LDA.w #$0200
	STA.w $0C3C,y
	BRA.b CODE_02911C

CODE_029136:
	INC
	BNE.b CODE_029155
CODE_029139:
	LDA.w #$0000
	STA.w $0C3C,y
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BEQ.b CODE_02911C
CODE_029144:
	LDA.w $0CC6
	CMP.w #$0003
	BNE.b CODE_029153
	LDA.w #$1D02
	JSL.l CODE_028B1F
CODE_029153:
	BRA.b CODE_02911C

CODE_029155:
	LDA.w #$0100
	STA.w $0C3C,y
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BEQ.b CODE_029139
	BRA.b CODE_029144

CODE_029162:
	LDA.w $0762,x
	SEC
	SBC.w #$0010
	CLC
	ADC.b $AC
	STA.b $68
	LDA.w $07EC,x
	SEC
	SBC.w #$002F
	CLC
	ADC.b $AE
	STA.b $6C
	LDA.w #DATA_0182A8
	JSL.l CODE_0097AC
	LDY.b $20
	BPL.b CODE_029188
	JMP.w CODE_0290E8

CODE_029188:
	LDA.w $04B0,x
	CLC
	ADC.b $AC
	STA.w $04B0,y
	LDA.w $053A,x
	CLC
	ADC.b $AE
	STA.w $053A,y
	JMP.w CODE_0290E0

CODE_02919D:
	PHP
	REP.b #$30
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BNE.b CODE_0291A8
	JMP.w CODE_029278

CODE_0291A8:
	LDA.w $0DDA,x
	ASL
	ASL
	ASL
	TAY
	SEP.b #$20
	LDA.w DATA_01E6DD,y
	STA.b $8C
	ORA.w DATA_01E6DD+$01,y
	BNE.b CODE_0291BE
	JMP.w CODE_029278

CODE_0291BE:
	LDA.w DATA_01E6DD+$02,y
	STA.b $9C
	STZ.b $8F
	STZ.b $9F
	LDA.w $0A9F,x
	AND.b #$40
	BEQ.b CODE_0291E2
	LDA.b #$40
	STA.b $8F
	STA.b $9F
	LDA.b $8C
	EOR.b #$FF
	INC
	STA.b $8C
	LDA.b $9C
	EOR.b #$FF
	INC
	STA.b $9C
CODE_0291E2:
	LDA.w $04B0,x
	CLC
	ADC.b #$08
	CLC
	ADC.b $8C
	STA.b $8C
	LDA.w $04B0,x
	CLC
	ADC.b #$08
	CLC
	ADC.b $9C
	STA.b $9C
	LDA.w $053A,x
	CLC
	ADC.w DATA_01E6DD+$01,y
	STA.b $8D
	LDA.w $053A,x
	CLC
	ADC.w DATA_01E6DD+$03,y
	STA.b $9D
	LDA.b #$20
	CPX.w #$0000
	BEQ.b CODE_029213
	LDA.b #$22
CODE_029213:
	PHA
	ORA.b $8F
	STA.b $8F
	PLA
	ORA.b $9F
	STA.b $9F
	REP.b #$20
	LDA.w DATA_01E6DD+$04,y
	STA.w $12A4
	CLC
	ADC.w #$0200
	STA.w $12B4
	SEP.b #$20
	LDA.b #$7F
	STA.w $1294
	LDA.b #$68
	STA.b $8E
	LDA.b #$6A
	STA.b $9E
	LDA.w DATA_01E6DD+$02,y
	STA.b $96
	LDA.b $8C
	STA.w $0360
	LDA.b $8D
	STA.w $0361
	LDA.b $8E
	STA.w $0362
	LDA.b $8F
	STA.w $0363
	LDA.b #$FE
	STA.w $0416
	LDA.b $96
	BEQ.b CODE_029276
	LDA.b $9C
	STA.w $0364
	LDA.b $9D
	STA.w $0365
	LDA.b $9E
	STA.w $0366
	LDA.b $9F
	STA.w $0367
	LDA.b #$FA
	STA.w $0416
CODE_029276:
	PLP
	RTL

CODE_029278:
	SEP.b #$20
	LDA.b #$FF
	STA.w $0416
	BRA.b CODE_029276

CODE_029281:
	PHP
	REP.b #$30
	LDA.w !RAM_SXAR_Wolverine_ClawsOutFlagLo
	BEQ.b CODE_0292CD
	LDA.w $0D50
	CMP.w #$001A
	BEQ.b CODE_029296
	CMP.w #$0015
	BNE.b CODE_0292CD
CODE_029296:
	LDA.w $0CC6
	BNE.b CODE_0292CD
	LDA.w $0A9E
	BIT.w #$4000
	BNE.b CODE_0292B9
	LDA.w #$0018
	LDY.w #DATA_01CFBF
	JSR.w CODE_0292CF
	BCS.b CODE_0292CD
	LDA.w #$0018
	LDY.w #DATA_01CF8F
	JSR.w CODE_0292CF
	BRA.b CODE_0292CD

CODE_0292B9:
	LDA.w #$FFE8
	LDY.w #DATA_01CF8F
	JSR.w CODE_0292CF
	BCS.b CODE_0292CD
	LDA.w #$FFE8
	LDY.w #DATA_01CFBF
	JSR.w CODE_0292CF
CODE_0292CD:
	PLP
	RTL

CODE_0292CF:
	STY.b $AE
	CLC
	ADC.w $0762,x
	STA.b $94
	LDA.w $07EC,x
	SEC
	SBC.w #$0018
	STA.b $96
	JSL.l CODE_0097A8
	STA.b $AC
	LDY.w #$FFFC
CODE_0292E9:
	TYA
	CLC
	ADC.w #$0008
	TAY
	LDA.b ($AE),y
	BEQ.b CODE_02933B
	CMP.b $AC
	BNE.b CODE_0292E9
	TYA
	CLC
	ADC.w #$0008
	TAY
	LDA.b ($AE),y
	BEQ.b CODE_02933B
	STA.b [$8C]
	LDA.b $8C
	STA.b $82
	CLC
	ADC.b $4F
	CLC
	ADC.b $4F
	STA.b $8C
	INY
	INY
	LDA.b ($AE),y
	STA.b [$8C]
	TYA
	SEC
	SBC.w #$0004
	TAY
	LDA.b $82
	SEC
	SBC.b $4F
	SEC
	SBC.b $4F
	STA.b $8C
	LDA.b ($AE),y
	STA.b [$8C]
	DEY
	DEY
	LDA.b $8C
	SEC
	SBC.b $4F
	SEC
	SBC.b $4F
	STA.b $8C
	LDA.b ($AE),y
	STA.b [$8C]
	SEC
	RTS

CODE_02933B:
	CLC
	RTS

CODE_02933D:
	PHP
	REP.b #$30
	STZ.w $1361
	SEP.b #$20
	LDA.b #$03
	STA.w $2101
	LDA.b #$08
	STA.w $13A4
	LDA.b #$10
	STA.w $13A6
	LDY.w #$0000
	LDX.b $68
CODE_029359:
	REP.b #$20
	STY.b $90
	LDA.w #$0000
	SEP.b #$20
	LDA.b ($64),y
	BPL.b CODE_029372
	CMP.b #$80
	BEQ.b CODE_0293B6
	CMP.b #$81
	BEQ.b CODE_0293BA
	CMP.b #$82
	BEQ.b CODE_0293D9
CODE_029372:
	REP.b #$20
	AND.w #$007F
	ASL
	CLC
	ADC.w $1361
	TAY
	LDA.w DATA_01D717,y
	LDY.b $90
	STA.w $05C4,x
	LDA.w #$0081
	STA.w $0A9E,x
	LDA.w $135D
	STA.w $04B0,x
	CLC
	ADC.w #$0010
	STA.w $135D
	LDA.w $135F
	STA.w $053A,x
	LDA.w #$0001
	STA.w $064E,x
	STA.w $06D8,x
	LDA.w #$0100
	STA.w $0426,x
	INC.b $68
	INC.b $68
	INY
	INX
	INX
	BRA.b CODE_029359

CODE_0293B6:
	REP.b #$20
	PLP
	RTL

CODE_0293BA:
	REP.b #$20
	INY
	LDA.b ($64),y
	REP.b #$20
	AND.w #$00FF
	ASL
	ASL
	ASL
	STA.w $135D
	INY
	LDA.b ($64),y
	AND.w #$00FF
	ASL
	ASL
	ASL
	STA.w $135F
	INY
	BRA.b CODE_029359

CODE_0293D9:
	REP.b #$20
	INY
	LDA.b ($64),y
	AND.w #$00FF
	STA.w $1361
	INY
	JMP.w CODE_029359

CODE_0293E8:
	PHP
	REP.b #$30
	PHP
	SEP.b #$20
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	PLP
	PHP
	REP.b #$20
	LDA.w #$0000
	STA.w $4312
	LDA.w #$0000
CODE_02940A:
	STA.w $2116
	LDA.w #$0000
	STA.w $4315
	SEP.b #$20
	LDA.b #$7F
	STA.w $4314
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	PLP
	PLP
	RTL

CODE_029424:						; Note: Related to the cutscene where Arcade introduces himself.
	PHP
	REP.b #$30
	PHP
	SEP.b #$20
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	PLP
	PHP
	REP.b #$20
	LDA.w #$7F0000
	STA.w $4312
	LDA.w #$0000
	STA.w $2116
	LDA.w #$0800
	STA.w $4315
	SEP.b #$20
	LDA.b #$7F0000>>16
	STA.w $4314
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	PLP
	PLP
	RTL

CODE_029460:
	SEP.b #$30
	STX.w $4202
	STY.w $4203
	NOP #4
	RTS

CODE_02946D:
	SEP.b #$30
	EOR.b #$FF
	SEC
	ADC.b #$40
CODE_029474:
	SEP.b #$30
	STY.b $2A
	STA.b $2B
	AND.b #$40
	BEQ.b CODE_029480
	LDA.b #$FF
CODE_029480:
	EOR.b $2B
	AND.b #$3F
	STX.b $29
	TAX
	LDA.w DATA_01DA4A,x
	STA.b $27
	LDA.b #$00
	STA.b $28
	LDX.b $27
	LDY.b $2A
CODE_029494:
	JSR.w CODE_029460
	LDA.w $4217
	BIT.b $2B
	BPL.b CODE_0294A3
	EOR.b #$FF
	LDX.b $29
	RTL

CODE_0294A3:
	CLC
	ADC.b #$01
	LDX.b $29
	RTL

CODE_0294A9:
	PHP
	REP.b #$30							; Optimization: Repeated instruction
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0000
	LDY.w #!Define_SXAR_SPC700_EngineLoc
	JSL.l CODE_028000
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0000
	LDY.w #!Define_SXAR_SPC700_SampleBankLoc
	JSL.l CODE_028000
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0000
	LDY.w #!Define_SXAR_Music_CopyOfBriefing
	JSL.l CODE_028000
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_TitleScreen
	JSL.l CODE_028000
	LDA.w #$0201
	JSL.l CODE_028B1F
	PLP
	RTL

CODE_0294FD:
	PHP
	SEP.b #$30
	LDX.b #$06
	CLC
CODE_029503:
	LDA.w $0110,x
	ADC.w $154A,x
	STZ.w $154A,x
	STA.w $0110,x
	SEC
	SBC.b #$0A
	BCC.b CODE_029517
	STA.w $0110,x
CODE_029517:
	DEX
	BPL.b CODE_029503
	PLP
	RTL

CODE_02951C:
	PHP
	SEP.b #$20
	SEI
	LDA.b #$01
	STZ.w $4207
	STA.w $4208
	LDA.b #$D3
	STA.w $4209
	STZ.w $420A
	LDA.b #$F1
	STA.w $4200
	LDA.b #$F9
	STA.w $2105
	PLP
	CLI
	RTL

CODE_02953D:
	PHP
	REP.b #$30
	LDX.w #$0000
CODE_029543:
	STZ.w $0426,x
	STZ.w $0BB2,x
	STZ.w $0C3C,x
	LDA.w #$0180
	STA.w $04B0,x
	LDA.w #$00E0
	STA.w $053A,x
	LDA.w #$0001
	STA.w $064E,x
	LDA.w #$0001
	STA.w $06D8,x
	LDA.w #DATA_019B0A
	STA.w $05C4,x
	INX
	INX
	CPX.w #$008A
	BNE.b CODE_029543
	PLP
	RTL

CODE_029573:
	PHP
	SEP.b #$20
	REP.b #$10
	LDX.w #$007F
	LDY.w #$01FC
CODE_02957E:
	LDA.b #$80
	STA.w $0200,y
	LDA.b #$F0
	STA.w $0201,y
	LDA.b #$00
	STA.w $0202,y
	LDA.b #$21
	STA.w $0203,y
	DEY
	DEY
	DEY
	DEY
	DEX
	BPL.b CODE_02957E
	LDX.w #$001F
	LDA.b #$55
CODE_02959E:
	STA.w $0400,x
	DEX
	BPL.b CODE_02959E
	PLP
	RTL

CODE_0295A6:
	PHP
	REP.b #$10
	PHX
	PHY
	SEP.b #$20
	PHA
	LDA.b $0C
CODE_0295B0:
	PHA
	JSL.l CODE_028B54
	PLA
	CMP.b $0C
	BEQ.b CODE_0295B0
	PLA
	PLY
	PLX
	PLP
	RTL

CODE_0295BF:
	PHP
	SEP.b #$30
	LDA.b #$04
	STA.w $4301
	STZ.w $4300
	STZ.w $4304
	STZ.w $4307
	PLP
	RTL

CODE_0295D2:
	PHP
	REP.b #$20
	INC.b $0E
	STZ.b $10
	LDA.b $0E
	LSR
	ROR.b $10
	LDA.b $10
	XBA
	SEP.b #$20
	STA.b $10
	INC.b $12
	LDA.b $12
	CMP.b #$03
	BNE.b CODE_0295EF
	STZ.b $12
CODE_0295EF:
	PLP
	RTL

CODE_0295F1:
	PHP
	JSL.l CODE_029F7C
	REP.b #$30
	LDA.w #$0045
	ASL
	STA.w $01B7
	STZ.w $01B5
	STZ.b $68
	JSR.w CODE_029648
	JSR.w CODE_029612
	JSR.w CODE_029680
	JSR.w CODE_029701
	PLP
	RTL

CODE_029612:
	LDA.w #$0603
	STA.w $01B2
	LDX.w #$0000
CODE_02961B:
	PHX
	LDA.w #$01B1
	STA.b $64
	JSL.l CODE_02933D
	PLX
	PHX
	TXA
	CLC
	ADC.w #DATA_01E680
	STA.b $64
	JSL.l CODE_02933D
	SEP.b #$20
	LDA.w $01B3
	CLC
	ADC.b #$04
	STA.w $01B3
	REP.b #$20
	PLX
	INX
	INX
	CPX.w #$000A
	BNE.b CODE_02961B
	RTS

CODE_029648:
	LDA.w #$0607
	STA.w $01B2
	LDX.w #$0000
CODE_029651:
	PHX
	LDA.w #$01B1
	STA.b $64
	JSL.l CODE_02933D
	PLX
	PHX
	TXA
	CLC
	ADC.w #$018D
	STA.b $64
	JSL.l CODE_02933D
	SEP.b #$20
	LDA.w $01B3
	CLC
	ADC.b #$04
	STA.w $01B3
	REP.b #$20
	PLX
	INX
	INX
	INX
	INX
	CPX.w #$0014
	BNE.b CODE_029651
	RTS

CODE_029680:
	LDA.w #$060F
	STA.w $01B2
	LDA.w #$0145
	STA.b $74
	LDX.w #$0000
CODE_02968E:
	PHX
	LDA.w #$01B1
	STA.b $64
	JSL.l CODE_02933D
	JSR.w CODE_0296BF
	SEP.b #$20
	LDA.w $01B3
	CLC
	ADC.b #$04
	STA.w $01B3
	REP.b #$20
	LDA.b $74
	CLC
	ADC.w #$0008
	STA.b $74
	PLX
	INX
	INX
	INX
	INX
	INX
	INX
	INX
	INX
	CPX.w #$0028
	BNE.b CODE_02968E
	RTS

CODE_0296BF:
	PHP
	REP.b #$30
	STZ.b $8C
	LDA.w #$8001
	STA.w $1369
	SEP.b #$30
	LDY.b #$00
CODE_0296CE:
	LDA.b ($74),y
	AND.b #$0F
	BEQ.b CODE_0296D8
	INC.b $8C
	BRA.b CODE_0296E2

CODE_0296D8:
	LDA.b $8C
	BNE.b CODE_0296E0
	LDA.b #$FF
	BRA.b CODE_0296E2

CODE_0296E0:
	LDA.b #$00
CODE_0296E2:
	INC
	STA.w $1363,y
	INY
	CPY.b #$07
	BNE.b CODE_0296CE
	REP.b #$20
	LDA.w #$1363
	STA.b $64
	JSL.l CODE_02933D
	LDA.w #DATA_01E6A0
	STA.b $64
	JSL.l CODE_02933D
	PLP
	RTS

CODE_029701:
	PHP
	REP.b #$30
	LDA.b $AC
	BEQ.b CODE_02970D
	LDA.w #DATA_01E697
	BRA.b CODE_029710

CODE_02970D:
	LDA.w #DATA_01E68A
CODE_029710:
	STA.b $64
	JSL.l CODE_02933D
	PLP
	RTS

CODE_029718:
	PHP
	REP.b #$30
	LDA.w #$0056
	STA.b $B2
	LDA.w #$005A
	STA.b $B4
	JSR.w CODE_02972A
	PLP
	RTL

CODE_02972A:
	PHP
	REP.b #$30
	JSL.l CODE_0295A6
	JSR.w CODE_02974B
	BCC.b CODE_029749
	JSL.l CODE_0295F1
	JSL.l CODE_02A044
	JSL.l CODE_029986
	JSR.w CODE_0297E4
	JSL.l CODE_0299A8
CODE_029749:
	PLP
	RTS

CODE_02974B:
	REP.b #$30
	LDA.w #$0145
	STA.b $8C
	LDA.w #$0000
	STA.b $8E
	LDA.w #$0005
	STA.b $94
CODE_02975C:
	SEP.b #$30
	LDY.b #$00
	BRA.b CODE_029767

CODE_029762:
	INY
	CPY.b #$06
	BEQ.b CODE_029782
CODE_029767:
	LDA.w $0110,y
	CMP.b [$8C],y
	BEQ.b CODE_029762
	BEQ.b CODE_029772
	BCS.b CODE_029782
CODE_029772:
	REP.b #$20
	LDA.b $8C
	CLC
	ADC.w #$0008
	STA.b $8C
	DEC.b $94
	BNE.b CODE_02975C
	CLC
	RTS

CODE_029782:
	REP.b #$30
	LDA.b $94
	ASL
	ASL
	ASL
	TAY
	DEY
	LDA.b $8C
	STA.b $90
	CLC
	ADC.w #$0008
	STA.b $92
	SEP.b #$20
CODE_029797:
	LDA.b ($90),y
	STA.b ($92),y
	DEY
	BPL.b CODE_029797
	LDY.w #$0007
	LDA.b #$80
	STA.b [$8C],y
	DEY
CODE_0297A6:
	LDA.w $0110,y
	STA.b [$8C],y
	DEY
	BPL.b CODE_0297A6
	REP.b #$30
	LDA.b $94
	ASL
	ASL
	TAY
	DEY
	LDA.b $8C
	SEC
	SBC.w #$0145
	LSR
	CLC
	ADC.w #$018D
	STA.b $90
	STA.b $B0
	CLC
	ADC.w #$0004
	STA.b $92
	SEP.b #$20
CODE_0297CD:
	LDA.b ($90),y
	STA.b ($92),y
	DEY
	BPL.b CODE_0297CD
	LDA.b #$00
	LDY.w #$0002
CODE_0297D9:
	STA.b ($90),y
	DEY
	BPL.b CODE_0297D9
	LDA.b $94
	STA.b $B6
	SEC
	RTS

CODE_0297E4:
	PHP
	REP.b #$30
	STZ.w $1376
	LDA.w #$0005
	SEP.b #$20
	SEC
	SBC.b $B6
	REP.b #$20
	STA.b $AC
	ASL
	CLC
	ADC.b $AC
	ASL
	TAX
	STZ.b $AE
	LDA.w #$1363
	STA.b $AC
	LDA.w #$000B
	STA.w $1363
	STA.w $1365
	STA.w $1367
	PHX
	JSL.l CODE_0295A6
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_HighScore
	JSL.l CODE_028000
	JSL.l CODE_0295A6
	LDA.w #$0201
	JSL.l CODE_028B1F
	PLX
CODE_02982F:
	PHX
	JSL.l CODE_0295A6
	JSL.l CODE_02A044
	PLX
	INC.b $0E
	JSR.w CODE_02984C
	JSR.w CODE_02987F
	JSR.w CODE_0298AB
	BCC.b CODE_02982F
	JSL.l CODE_02A044
	PLP
	RTS

CODE_02984C:
	LDA.b $0E
	AND.w #$0007
	BNE.b CODE_02987E
	LDA.b ($B2)
	AND.w #$2800
	BEQ.b CODE_02986A
	LDA.b ($AC)
	CLC
	ADC.w #$0001
	CMP.w #$0028
	BNE.b CODE_02987C
	LDA.w #$0000
	BRA.b CODE_02987C

CODE_02986A:
	LDA.b ($B2)
	AND.w #$0400
	BEQ.b CODE_02987E
	LDA.b ($AC)
	SEC
	SBC.w #$0001
	BPL.b CODE_02987C
	LDA.w #$0027
CODE_02987C:
	STA.b ($AC)
CODE_02987E:
	RTS

CODE_02987F:
	LDA.b ($AC)
	ASL
	TAY
	LDA.w DATA_01D717,y
	STA.w $05C4,x
	LDA.b ($B2)
	AND.w #$2C00
	BNE.b CODE_0298A1
	LDA.b $0E
	AND.w #$0007
	BNE.b CODE_0298A0
	LDA.w $04B0,x
	EOR.w #$0100
	STA.w $04B0,x
CODE_0298A0:
	RTS

CODE_0298A1:
	LDA.w $04B0,x
	AND.w #$00FF
	STA.w $04B0,x
	RTS

CODE_0298AB:
	LDA.b ($B4)
	AND.w #$FFF0
	BNE.b CODE_0298EF
	LDA.b ($B2)
	AND.w #$D1C0
	BNE.b CODE_0298D7
	LDA.b ($B2)
	AND.w #$0200
	BEQ.b CODE_0298EF
	LDA.w $04B0,x
	AND.w #$00FF
	STA.w $04B0,x
	LDA.b $AE
	BEQ.b CODE_0298EF
	DEC.b $AE
	DEC.b $AC
	DEC.b $AC
	DEX
	DEX
	BRA.b CODE_0298EF

CODE_0298D7:
	LDA.w $04B0,x
	AND.w #$00FF
	STA.w $04B0,x
	LDA.b $AE
	CMP.w #$0002
	BEQ.b CODE_0298F1
	INC.b $AE
	INC.b $AC
	INC.b $AC
	INX
	INX
CODE_0298EF:
	CLC
	RTS

CODE_0298F1:
	JSR.w CODE_0298A1
	DEX
	DEX
	JSR.w CODE_0298A1
	DEX
	DEX
	JSR.w CODE_0298A1
	LDY.w #$0002
	LDX.w #$0004
	SEP.b #$20
CODE_029906:
	LDA.w $1363,x
	STA.b ($B0),y
	DEX
	DEX
	DEY
	BPL.b CODE_029906
	REP.b #$20
	SEC
	RTS

CODE_029914:
	PHP
	REP.b #$30
	STA.b $64
	LDA.w #$7E8000
	STA.b $8C
	SEP.b #$20
	LDA.b #$7E8000>>16
	STA.b $8E
	LDY.w #$0000
CODE_029927:
	SEP.b #$20
	LDA.b ($64),y
	BPL.b CODE_029935
	CMP.b #$80
	BEQ.b CODE_029940
	CMP.b #$81
	BEQ.b CODE_029944
CODE_029935:
	STA.b [$8C]
	REP.b #$20
	INC.b $8C
	INC.b $8C
	INY
	BRA.b CODE_029927

CODE_029940:
	REP.b #$20
	PLP
	RTL

CODE_029944:
	SEP.b #$20
	INY
	LDA.b ($64),y
	AND.b #$7F
	ASL
	XBA
	INY
	LDA.b ($64),y
	XBA
	REP.b #$20
	ORA.w #$8000
	STA.b $8C
	INY
	BRA.b CODE_029927

CODE_02995B:
	PHP
	SEP.b #$20
	STA.w $4202
	LDA.b #$3C
	STA.w $4203
	NOP #4
	REP.b #$20
	LDA.w $4216
CODE_02996F:
	PHA
	JSL.l CODE_0295A6
	LDA.b $56
	ORA.b $58
	AND.w #$1000
	BNE.b CODE_029983
	PLA
	DEC
	BNE.b CODE_02996F
	PLP
	RTL

CODE_029983:
	PLA
	PLP
	RTL

CODE_029986:
	PHP
	SEP.b #$20
	STZ.w $2106
	LDA.b #$80
	STA.w $2100
	LDA.b #$00
CODE_029993:
	PHA
	LDA.b #$02
CODE_029996:
	JSL.l CODE_0295A6
	DEC
	BPL.b CODE_029996
	PLA
	INC
	STA.w $2100
	CMP.b #$0F
	BNE.b CODE_029993
	PLP
	RTL

CODE_0299A8:
	PHP
	SEP.b #$20
	LDA.b #$0F
CODE_0299AD:
	PHA
	LDA.b #$02
CODE_0299B0:
	JSL.l CODE_0295A6
	DEC
	BPL.b CODE_0299B0
	PLA
	DEC
	STA.w $2100
	BNE.b CODE_0299AD
	PLP
	RTL

CODE_0299C0:
	PHP
	SEP.b #$30
	PHX
	PHY
	ROR.b $0A
	LDA.b $09
	PHA
	ROR
	STA.b $0A
	LDA.b $08
	TAX
	ASL
	ASL
	ASL
	ASL
	STA.b $09
	LDA.b $07
	STA.b $08
	LSR
	LSR
	LSR
	LSR
	ORA.b $09
	EOR.b $0A
	STX.b $09
	LDX.b $06
	STX.b $07
	STA.b $06
	PLA
	STA.b $0A
	PLY
	PLX
	LDA.b $06
	PLP
	RTL

CODE_0299F3:
	PHP
	REP.b #$30
CODE_0299F6:
	LDX.w !RAM_SXAR_Global_CurrentLevelLo
	LDA.w #DATA_0387DC>>16
	STA.b $66
	LDA.w DATA_01E6BB,x
	STA.b $64
	LDA.w #$7EF000
	STA.b $24
	STA.b $68
	LDA.w #$7EF000>>16
	STA.b $26
	STA.b $6A
	LDY.w #$0000
CODE_029A14:
	LDA.b [$64],y
	STA.b [$68],y
	BEQ.b CODE_029A30
	INY
	INY
	LDA.b [$64],y
	STA.b [$68],y
	INY
	INY
	LDA.b [$64],y
	STA.b [$68],y
	INY
	INY
	LDA.b [$64],y
	STA.b [$68],y
	INY
	INY
	BRA.b CODE_029A14

CODE_029A30:
	PLP
	RTL

CODE_029A32:
	PHP
	REP.b #$30
	LDA.b $0E
	LSR
	LSR
	STA.b $9A
	LDA.b $0E
	AND.w #$0003
	ASL
	STA.b $82
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	CMP.w #!Define_SXAR_LevelID_Storm3
	BEQ.b CODE_029A4D
	BCS.b CODE_029A82
CODE_029A4D:
	ASL
	ASL
	CLC
	ADC.b $82
	TAX
	LDA.w DATA_01E871+$02,x
	STA.b $98
	LDA.w DATA_01E871,x
	TAX
	LDA.w !RAM_SXAR_Global_CurrentLevelLo
	SEC
	SBC.w #$0002
	ASL
	ASL
	TAY
	LDA.w DATA_01E879,y
	STA.b $9E
CODE_029A6B:
	LDA.w DATA_01E8E3,x
	AND.w #$000F
	AND.b $9A
CODE_029A73:
	BNE.b CODE_029A78
	JSR.w CODE_029A84
CODE_029A78:
	TXA
	CLC
	ADC.w #$0008
	TAX
	CMP.b $98
	BNE.b CODE_029A6B
CODE_029A82:
	PLP
	RTL

CODE_029A84:
	LDA.w DATA_01E8E3,x
	AND.w #$FF00
	STA.b $8C
	BEQ.b CODE_029A99
	XBA
	AND.w #$007F
	ASL
	TAY
	LDA.w $1430,y
	BEQ.b CODE_029B0B
CODE_029A99:
	PHX
	LDA.w DATA_01E8E3+$02,x
	XBA
	AND.w #$00FF
	STA.b $96
	LDA.w DATA_01E8E3+$02,x
	AND.w #$00FF
	LDY.b $4F
	CMP.w #$007E
	BEQ.b CODE_029AB2
	LDY.b $51
CODE_029AB2:
	STY.b $9C
	AND.w #$007F
	STA.b $92
	LDA.w DATA_01E8E3+$04,x
	STA.b $90
	LDA.w DATA_01E8E3+$06,x
	STA.b $94
	TXA
	SEC
	SBC.b $9E
	LSR
	LSR
	TAX
	INC.w $13A8,x
	LDA.w $13A8,x
	ASL
	TAY
	LDA.b ($94),y
	BNE.b CODE_029AE8
	LDA.b $8C
	BPL.b CODE_029AE3
	DEC.w $13A8,x
	DEY
	DEY
	LDA.b ($94),y
	BRA.b CODE_029AE8

CODE_029AE3:
	STZ.w $13A8,x
	LDA.b ($94)
CODE_029AE8:
	STA.b $94
	LDY.w #$0000
CODE_029AED:
	LDX.b $96
CODE_029AEF:
	LDA.b ($94),y
	CMP.w #$0001
	BEQ.b CODE_029B0A
	STA.b [$90],y
	INY
	INY
	DEX
	BNE.b CODE_029AEF
	LDA.b $9C
	SEC
	SBC.b $96
	ASL
	CLC
	ADC.b $90
	STA.b $90
	BRA.b CODE_029AED

CODE_029B0A:
	PLX
CODE_029B0B:
	RTS

CODE_029B0C:
	PHP
	SEP.b #$20
	LDA.b #$80
	STA.w $210D
	STA.w $109C
	LDA.b #$01
	STA.w $210D
	STA.w $109D
	LDA.b #$80
	STA.w $210E
	STA.w $109E
	LDA.b #$01
	STA.w $210E
	STA.w $109F
	LDA.b #$80
	STA.w $211A
	LDA.b #$00
	STA.w $211F
	LDA.b #$02
	STA.w $211F
	LDA.b #$00
	STA.w $2120
	LDA.b #$02
	STA.w $2120
	REP.b #$30
	STZ.w $108E
	LDA.w #$0202
	STA.w $1090
	STA.w $1092
	SEP.b #$20
	LDX.w #$000F
CODE_029B5B:
	STZ.w $10A0,x
	DEX
	BPL.b CODE_029B5B
	PLP
CODE_029B62:
	PHP
	REP.b #$30
	LDA.w $108C
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_038000,x
	STA.w $1090
	STA.w $1092
	SEP.b #$30
	LDX.w $108E
	LDA.w DATA_01D2E2,x
	STA.w $1094
	STA.w $1098
	LDA.w DATA_01D3E2,x
	STA.w $1095
	STA.w $1099
	BPL.b CODE_029B9C
	REP.b #$20
	LDA.w $1094
	EOR.w #$FFFF
	INC
	STA.w $1098
CODE_029B9C:
	SEP.b #$20
	LDA.w $108E
	CLC
	ADC.b #$40
	TAX
	LDA.w DATA_01D2E2,x
	STA.w $1096
	STA.w $109A
	LDA.w DATA_01D3E2,x
	STA.w $1097
	STA.w $109B
	BPL.b CODE_029BC5
	REP.b #$20
	LDA.w $1096
	EOR.w #$FFFF
	INC
	STA.w $109A
CODE_029BC5:
	SEP.b #$20
	SEP.b #$20
	LDA.w $1090
	STA.w $4202
	LDA.w $109A
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A0
	LDA.w $4217
	STA.w $10A1
	LDA.w $109B
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A5
	LDA.w $4217
	STA.w $10A6
	LDA.w $1091
	STA.w $4202
	LDA.w $109A
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A9
	LDA.w $4217
	STA.w $10AA
	LDA.w $109B
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10AE
	LDA.w $4217
	STA.w $10AF
	REP.b #$20
	LDA.w $10A0
	CLC
	ADC.w $10A4
	STA.b $8C
	LDA.w $10A2
	ADC.w $10A6
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10A8
	STA.b $8C
	LDA.b $8E
	ADC.w $10AA
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10AC
	LDA.b $8E
	ADC.w $10AE
	SEP.b #$20
	BIT.w $1097
	BPL.b CODE_029C67
	REP.b #$20
	EOR.w #$FFFF
	INC
CODE_029C67:
	SEP.b #$20
	STA.w $211B
	XBA
	STA.w $211B
	STA.w $10B1
	XBA
	STA.w $10B0
	SEP.b #$20
	LDA.w $1090
	STA.w $4202
	LDA.w $1098
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A0
	LDA.w $4217
	STA.w $10A1
	LDA.w $1099
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A5
	LDA.w $4217
	STA.w $10A6
	LDA.w $1091
	STA.w $4202
	LDA.w $1098
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A9
	LDA.w $4217
	STA.w $10AA
	LDA.w $1099
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10AE
	LDA.w $4217
	STA.w $10AF
	REP.b #$20
	LDA.w $10A0
	CLC
	ADC.w $10A4
	STA.b $8C
	LDA.w $10A2
	ADC.w $10A6
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10A8
	STA.b $8C
	LDA.b $8E
	ADC.w $10AA
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10AC
	LDA.b $8E
	ADC.w $10AE
	SEP.b #$20
	BIT.w $1095
	BPL.b CODE_029D17
	REP.b #$20
	EOR.w #$FFFF
	INC
CODE_029D17:
	SEP.b #$20
	STA.w $211C
	XBA
	STA.w $211C
	STA.w $10B3
	XBA
	STA.w $10B2
	SEP.b #$20
	LDA.w $1092
	STA.w $4202
	LDA.w $1098
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A0
	LDA.w $4217
	STA.w $10A1
	LDA.w $1099
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A5
	LDA.w $4217
	STA.w $10A6
	LDA.w $1093
	STA.w $4202
	LDA.w $1098
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A9
	LDA.w $4217
	STA.w $10AA
	LDA.w $1099
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10AE
	LDA.w $4217
	STA.w $10AF
	REP.b #$20
	LDA.w $10A0
	CLC
	ADC.w $10A4
	STA.b $8C
	LDA.w $10A2
	ADC.w $10A6
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10A8
	STA.b $8C
	LDA.b $8E
	ADC.w $10AA
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10AC
	LDA.b $8E
	ADC.w $10AE
	SEP.b #$20
	BIT.w $1095
	BMI.b CODE_029DC7
	REP.b #$20
	EOR.w #$FFFF
	INC
CODE_029DC7:
	SEP.b #$20
	STA.w $211D
	XBA
	STA.w $211D
	STA.w $10B5
	XBA
	STA.w $10B4
	SEP.b #$20
	LDA.w $1092
	STA.w $4202
	LDA.w $109A
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A0
	LDA.w $4217
	STA.w $10A1
	LDA.w $109B
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A5
	LDA.w $4217
	STA.w $10A6
	LDA.w $1093
	STA.w $4202
	LDA.w $109A
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10A9
	LDA.w $4217
	STA.w $10AA
	LDA.w $109B
	STA.w $4203
	NOP #4
	LDA.w $4216
	STA.w $10AE
	LDA.w $4217
	STA.w $10AF
	REP.b #$20
	LDA.w $10A0
	CLC
	ADC.w $10A4
	STA.b $8C
	LDA.w $10A2
	ADC.w $10A6
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10A8
	STA.b $8C
	LDA.b $8E
	ADC.w $10AA
	STA.b $8E
	LDA.b $8C
	CLC
	ADC.w $10AC
	LDA.b $8E
	ADC.w $10AE
	SEP.b #$20
	BIT.w $1097
	BPL.b CODE_029E77
	REP.b #$20
	EOR.w #$FFFF
	INC
CODE_029E77:
	SEP.b #$20
	STA.w $211E
	XBA
	STA.w $211E
	STA.w $10B7
	XBA
	STA.w $10B6
	PLP
	RTL

CODE_029E89:
	PHP
	JSL.l CODE_0295A6
	SEP.b #$20
	STZ.w $211B
	LDA.b #$01
	STA.w $211B
	STZ.w $211C
	STZ.w $211C
	STZ.w $211D
	STZ.w $211D
	STZ.w $211E
	LDA.b #$01
	STA.w $211E
	PLP
	RTL

CODE_029EAE:
	PHP
	JSL.l CODE_0295A6
	SEP.b #$20
	STZ.w $211B
	LDA.b #$01
	STZ.w $211B
	STZ.b $82
	STZ.b $83
	LDA.b #$FF
	STA.w $211C
	STA.w $211C
	STZ.w $211D
	STZ.w $211D
	STZ.w $211E
	LDA.b #$01
	STA.w $211E
	PLP
	RTL

CODE_029ED9:
	REP.b #$30
	LDA.w #DATA_039FF2
	STA.b $8C
	LDA.w #DATA_039FF2>>16
	STA.b $8E
	LDX.w #$0000
	LDY.w #$0000
CODE_029EEB:
	LDA.b [$8C],y
	XBA
	AND.w #$FF00
	STA.l $7E8000,x
	INX
	INX
	INY
	CPX.w #$1780
	BNE.b CODE_029EEB
	LDY.w #$0000
CODE_029F00:
	LDA.b [$78],y
	XBA
	AND.w #$FF00
	STA.l $7E8000,x
	INX
	INX
	INY
	CPX.w #$8000
	BNE.b CODE_029F00
	RTL

CODE_029F13:
	PHP
	REP.b #$10
	SEP.b #$20
	LDA.b $6C
	ASL
	STA.b $6C
	STZ.b $6D
	DEC.b $70
	LDX.w #$0000
CODE_029F24:
	LDY.w #$0000
CODE_029F27:
	PHY
	TXY
	LDA.b [$68],y
	PLY
	STA.b [$64],y
	INX
	INY
	INY
	CPY.b $6C
	BNE.b CODE_029F27
	INC.b $65
	DEC.b $70
	BPL.b CODE_029F24
	PLP
	RTL

CODE_029F3D:
	PHP
	SEP.b #$30
	STZ.w $420C
	PHP
	SEP.b #$20
	LDA.b #$18
	STA.w $4311
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	PLP
	PHP
	REP.b #$20
	LDA.w #$7E8000
	STA.w $4312
	LDA.w #$0000
	STA.w $2116
	LDA.w #$8000
	STA.w $4315
	SEP.b #$20
	LDA.b #$7E8000>>16
	STA.w $4314
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	PLP
	PLP
	RTL

CODE_029F7C:
	PHP
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.w $0102
	PHA
	STZ.w $0102
	STZ.b $14
	LDA.b #$80
	STA.w $2100
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_SplashScreenAndSpiderManLogo
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_LargeFont
	LDX.w #$7000
	JSL.l CODE_028000
	LDA.w $15C4
	SEP.b #$20
	PLA
	STA.w $0102
	PLP
	RTL

CODE_029FBA:
	PHP
	REP.b #$30
	JSL.l CODE_029FC6
	JSR.w CODE_029FCD
	PLP
	RTL

CODE_029FC6:
	PHP
	LDX.w #$0002
	JMP.w CODE_02A04A

CODE_029FCD:
	STZ.b $86
	STZ.b $88
	DEC.b $88
	LDA.w $0A9E
	STA.b $8E
	BIT.w #$0020
	BEQ.b CODE_029FEF
	BIT.w #$0100
	BNE.b CODE_029FEF
	LDX.b $12
	BNE.b CODE_029FEF
	LDA.b $62
	STA.b $86
	LDA.w #$F1FF
	STA.b $88
CODE_029FEF:
	LDX.w #$0000
	LDY.w #$0160
	STY.b $96
	STZ.b $82
	LDA.w $05C4
	STA.b $98
	LDA.w $06D8
	STA.b $90
	BIT.w #$0080
	BNE.b CODE_02A00B
	JSR.w CODE_02A1A2
CODE_02A00B:
	LDA.w $04B0
	CMP.w #$0180
	BEQ.b CODE_02A043
	STA.b $9C
	LDA.w $053A
	STA.b $9A
	LDA.w $064E
	STA.b $92
	LDA.w #$0010
	STA.b $A2
	LDA.b $8E
	BIT.w #$4000
	BEQ.b CODE_02A030
	LDA.w #DATA_019CAC
	BRA.b CODE_02A033

CODE_02A030:
	LDA.w #DATA_019CA0
CODE_02A033:
	CLC
	ADC.b $82
	STA.b $98
	JSR.w CODE_02A147
	REP.b #$30
	LDA.w #$FAAA
	STA.w $0416
CODE_02A043:
	RTS

CODE_02A044:
	PHP
	REP.b #$30
	LDX.w #$0000
CODE_02A04A:
	LDY.w #$0000
	LDA.w #$0400
	STA.b $A0
	LDA.w #$0008
	STA.b $96
	LDA.w #$FFFF
	STA.b $8C
CODE_02A05C:
	LDA.w $0426,x
	BNE.b CODE_02A064
	JMP.w CODE_02A0F8

CODE_02A064:
	STZ.b $82
	LDA.w $05C4,x
	STA.b $98
	LDA.w $06D8,x
	STA.b $90
	STA.b $84
	LDA.w $0A9E,x
	STA.b $8E
	BIT.w #$0080
	BNE.b CODE_02A07F
	JSR.w CODE_02A1A2
CODE_02A07F:
	STZ.b $86
	STZ.b $88
	DEC.b $88
	LDA.b $8E
	BIT.w #$0020
	BEQ.b CODE_02A0A1
	LDA.w $0A9E
	BIT.w #$0100
	BNE.b CODE_02A0A1
	LDA.b $12
	BNE.b CODE_02A0A1
	LDA.b $62
	STA.b $86
	LDA.w #$F1FF
	STA.b $88
CODE_02A0A1:
	LDA.w $04B0,x
	CMP.w #$0180
	BEQ.b CODE_02A0F8
	STA.b $9C
	LDA.w $053A,x
	STA.b $9A
	LDA.b $84
	ASL
	STA.w $4202
	LDA.w $064E,x
	STA.w $4203
	STA.b $92
	PHP
	BIT.b $8E
	BVC.b CODE_02A0CB
	LDA.b $98
	CLC
	ADC.w $4216
	STA.b $98
CODE_02A0CB:
	BIT.b $8E
	BPL.b CODE_02A0DB
	LDA.b $98
	CLC
	ADC.w $4216
	CLC
	ADC.w $4216
	STA.b $98
CODE_02A0DB:
	LDA.b $98
	CLC
	ADC.b $82
	STA.b $98
	LDA.w $0A9E,x
	AND.w #$0001
	BEQ.b CODE_02A0EF
	LDA.w $13A6
	BRA.b CODE_02A0F2

CODE_02A0EF:
	LDA.w $13A4
CODE_02A0F2:
	STA.b $A2
	JSR.w CODE_02A147
	PLP
CODE_02A0F8:
	INX
	INX
	CPX.w $01B7
	BEQ.b CODE_02A102
	JMP.w CODE_02A05C

CODE_02A102:
	LDA.b $96
	CMP.w #$0008
	BEQ.b CODE_02A116
CODE_02A109:
	SEC
	ROR.b $8C
	CLC
	ROR.b $8C
	DEC
	BNE.b CODE_02A109
	LDA.b $8C
	STA.b ($A0)
CODE_02A116:
	LDA.w $136E
	BNE.b CODE_02A131
	CPY.w #$0200
	BCS.b CODE_02A12F
	LDA.w #$E080
CODE_02A123:
	STA.w $0200,y
	INY
	INY
	INY
	INY
	CPY.w #$0200
	BNE.b CODE_02A123
CODE_02A12F:
	PLP
	RTL

CODE_02A131:
	CPY.w #$0160
	BCS.b CODE_02A12F
	LDA.w #$E080
CODE_02A139:
	STA.w $0200,y
	INY
	INY
	INY
	INY
	CPY.w #$0160
	BNE.b CODE_02A139
	BRA.b CODE_02A12F

CODE_02A147:
	REP.b #$20
	LDA.b $9C
	STA.b $9E
	LDA.b $92
	STA.b $94
CODE_02A151:
	LDA.b $9E
	SEP.b #$20
	STA.w $0200,y
	LDA.b $9A
	STA.w $0201,y
	REP.b #$20
	XBA
	ROR
	ROR.b $8C
	LDA.w $0A9E,x
	ROR
	ROR.b $8C
	DEC.b $96
	BNE.b CODE_02A17A
	LDA.w #$0008
	STA.b $96
	LDA.b $8C
	STA.b ($A0)
	INC.b $A0
	INC.b $A0
CODE_02A17A:
	LDA.b ($98)
	AND.b $88
	ORA.b $86
	STA.w $0202,y
	INC.b $98
	INC.b $98
	LDA.b $9E
	CLC
	ADC.b $A2
	STA.b $9E
	INY
	INY
	INY
	INY
	DEC.b $94
	BNE.b CODE_02A151
	LDA.b $9A
	CLC
	ADC.b $A2
	STA.b $9A
	DEC.b $90
	BNE.b CODE_02A147
	RTS

CODE_02A1A2:
	PHP
	REP.b #$30
	LDA.w $064E,x
	JSR.w CODE_02A2A2
	LSR
	STA.b $A6
	LDA.w $06D8,x
	JSR.w CODE_02A2A2
	DEC
	STA.b $A8
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_XPosLo,x
	SEC
	SBC.b $A6
	SEC
	SBC.w #$0020
	SEC
	SBC.b $2E
	STA.w $04B0,x
	JSR.w CODE_02A1E4
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.b $A8
	STA.b $A8
	SEC
	SBC.w #$0020
	SEC
	SBC.b $30
	STA.w $053A,x
	JSR.w CODE_02A1F7
	JSR.w CODE_02A2B3
	PLP
	RTS

CODE_02A1E4:
	CLC
	ADC.w #$0040
	BMI.b CODE_02A1F0
	CMP.w #$0140
	BCS.b CODE_02A1F0
	RTS

CODE_02A1F0:
	LDA.w #$0180
	STA.w $04B0,x
	RTS

CODE_02A1F7:
	LDA.b $30
	CLC
	ADC.w #$0020
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	BEQ.b CODE_02A204
	BCS.b CODE_02A1F0
CODE_02A204:
	CLC
	ADC.w #$00F0
	STA.b $AA
	CMP.b $A8
	BCC.b CODE_02A1F0
	LDA.b $8E
	BIT.w #$0001
	BEQ.b CODE_02A22F
	LDA.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	SEC
	SBC.b $AA
	BMI.b CODE_02A248
	JSR.w CODE_02A291
	STA.b $A6
	LDA.b $90
	SEC
	SBC.b $A6
	BEQ.b CODE_02A290
	BMI.b CODE_02A290
	STA.b $90
	BRA.b CODE_02A290

CODE_02A22F:
	LDA.b $30
	CLC
	ADC.w #$0020
	CMP.w !RAM_SXAR_WolverineCyclopsSwimStorm_YPosLo,x
	BEQ.b CODE_02A23C
	BCS.b CODE_02A1F0
CODE_02A23C:
	CLC
	ADC.w #$00E0
	STA.b $AA
	CMP.b $A8
	BCC.b CODE_02A1F0
	BRA.b CODE_02A290

CODE_02A248:
	LDA.b $30
	CLC
	ADC.w #$0020
	STA.b $AA
	SEC
	SBC.b $A8
	BMI.b CODE_02A290
	JSR.w CODE_02A291
	STA.b $A6
	STA.w $4202
	LDA.w $064E,x
	STA.w $4203
	LDA.b $90
	SEC
	SBC.b $A6
	BEQ.b CODE_02A290
	BMI.b CODE_02A290
	STA.b $90
	STA.b $84
	LDA.w $4216
	ASL
	STA.b $82
	LDA.b $8E
	BIT.w #$4000
	BEQ.b CODE_02A27F
	ASL.b $82
CODE_02A27F:
	LDA.w $07EC,x
	SEC
	SBC.b $AA
	AND.w #$000F
	ORA.w #$00F0
	STA.w $053A,x
	BRA.b CODE_02A290

CODE_02A290:
	RTS

CODE_02A291:
	ROR.b $8E
	BCS.b CODE_02A29B
	ROL.b $8E
	LSR
	LSR
	LSR
	RTS

CODE_02A29B:
	ROL.b $8E
	LSR
	LSR
	LSR
	LSR
	RTS

CODE_02A2A2:
	ROR.b $8E
	BCS.b CODE_02A2AC
	ROL.b $8E
	ASL
	ASL
	ASL
	RTS

CODE_02A2AC:
	ROL.b $8E
	ASL
	ASL
	ASL
	ASL
	RTS

CODE_02A2B3:
	PHY
	LDA.w $0426,x
	CMP.w #$000A
	BCS.b CODE_02A2EA
	ASL
	ASL
	TAY
	LDA.w DATA_01DCB6,y
	BEQ.b CODE_02A2EA
	STA.b $A6
	LDA.w DATA_01DCB6+$02,y
	STA.b $A8
	LDA.w $0DDA,x
	ASL
	TAY
	LDA.w $053A,x
	CLC
	ADC.b ($A8),y
	STA.w $053A,x
	LDA.w $0A9E,x
	AND.w #$4000
	BNE.b CODE_02A2EC
	LDA.w $04B0,x
	CLC
	ADC.b ($A6),y
	STA.w $04B0,x
CODE_02A2EA:
	PLY
	RTS

CODE_02A2EC:
	LDA.w $04B0,x
	SEC
	SBC.b ($A6),y
	STA.w $04B0,x
	BRA.b CODE_02A2EA

CODE_02A2F7:
	PHP
	JSL.l CODE_0295A6
	JSR.w CODE_02A304
	JSR.w CODE_02A368
	PLP
	RTL

CODE_02A304:
	REP.b #$30
	STZ.b $8C
	STZ.b $8E
	LDA.w #$3000
	STA.b $90
	SEP.b #$20
	LDA.b #$63
	STA.w $2101
	STA.b $92
	LDX.w #$001F
	LDA.b #$00
CODE_02A31D:
	STA.w $0400,x
	DEX
	BPL.b CODE_02A31D
	LDX.w #$0000
CODE_02A326:
	LDA.b $8E
	STA.w $0201,x
	REP.b #$20
	LDA.b $90
	STA.w $0202,x
	CLC
	ADC.w #$0002
	STA.b $90
	SEP.b #$20
	LDA.b $8C
	STA.w $0200,x
	CLC
	ADC.b #$10
	AND.b #$7F
	STA.b $8C
	BNE.b CODE_02A35C
	LDA.b $8E
	CLC
	ADC.b #$10
	STA.b $8E
	REP.b #$20
	LDA.b $90
	AND.w #$FFE0
	CLC
	ADC.w #$0020
	STA.b $90
CODE_02A35C:
	SEP.b #$20
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_02A326
	RTS

CODE_02A368:
	JSL.l CODE_0295A6
	JSR.w CODE_02A386
	JSR.w CODE_02A3E1
	JSR.w CODE_02A3FD
	REP.b #$20
	LDA.b $56
	AND.w #$1000
	BEQ.b CODE_02A368
	SEP.b #$20
	LDA.b #$03
	STA.w $2101
	RTS

CODE_02A386:
	REP.b #$30
	LDA.b $56
	AND.w #$0800
	BNE.b CODE_02A3A5
	LDA.b $56
	AND.w #$0400
	BNE.b CODE_02A3B4
	LDA.b $56
	AND.w #$0200
	BNE.b CODE_02A3C3
	LDA.b $56
	AND.w #$0100
	BNE.b CODE_02A3D2
	RTS

CODE_02A3A5:
	SEP.b #$20
	LDX.w #$01FC
CODE_02A3AA:
	DEC.w $0201,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_02A3AA
	RTS

CODE_02A3B4:
	SEP.b #$20
	LDX.w #$01FC
CODE_02A3B9:
	INC.w $0201,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_02A3B9
	RTS

CODE_02A3C3:
	SEP.b #$20
	LDX.w #$01FC
CODE_02A3C8:
	DEC.w $0200,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_02A3C8
	RTS

CODE_02A3D2:
	SEP.b #$20
	LDX.w #$01FC
CODE_02A3D7:
	INC.w $0200,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_02A3D7
	RTS

CODE_02A3E1:
	REP.b #$20
	LDA.b $56
	AND.w #$4000
	BEQ.b CODE_02A3FC
	JSL.l CODE_02A42A
	SEP.b #$20
	LDA.b $92
	INC
	AND.b #$03
	ORA.b #$60
	STA.b $92
	STA.w $2101
CODE_02A3FC:
	RTS

CODE_02A3FD:
	REP.b #$20
	LDA.b $56
	AND.w #$0080
	BEQ.b CODE_02A429
	JSL.l CODE_02A42A
	SEP.b #$20
	LDX.w #$01FC
CODE_02A40F:
	LDA.w $0203,x
	CLC
	ADC.b #$02
	AND.b #$0E
	STA.b $8C
	LDA.w $0203,x
	AND.b #$F1
	ORA.b $8C
	STA.w $0203,x
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_02A40F
CODE_02A429:
	RTS

CODE_02A42A:
	PHP
	REP.b #$20
CODE_02A42D:
	LDA.b $56
	AND.w #$FFF0
	BNE.b CODE_02A42D
	PLP
	RTL

CODE_02A436:
	REP.b #$30
	STZ.b $AC
	LDA.w $1590
	ASL
	TAX
	LDA.w DATA_01CFFF,x
	STA.b $AE
	LDA.w DATA_01D003,x
	STA.b $68
CODE_02A449:
	LDA.b $68
	LDX.w #$00D0
	LDY.w #$3C00
	JSL.l CODE_009FBA
	DEC.w $158E
	JSL.l CODE_0295A6
	STZ.w $158E
	LDX.w #$012C
	JSR.w CODE_02A797
	BCS.b CODE_02A476
	INY
	TYA
	CLC
	ADC.b $68
	STA.b $68
	INC.b $AC
	LDA.b $AC
	CMP.b $AE
	BNE.b CODE_02A449
CODE_02A476:
	RTL

CODE_02A477:
	STA.b $8C
	LDA.w #DATA_039BFC>>16
	STA.b $8E
	STY.b $64
	STX.b $90
	LDY.w #$0000
CODE_02A485:
	LDA.b [$8C],y
	INY
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b CODE_02A4AA
	CMP.w #$00FE
	BEQ.b CODE_02A49F
	ORA.b $64
	STA.l $7F0000,x
	INX
	INX
	BRA.b CODE_02A485

CODE_02A49F:
	LDA.b $90
	CLC
	ADC.w #$0040
	STA.b $90
	TAX
	BRA.b CODE_02A485

CODE_02A4AA:
	RTL

CODE_02A4AB:
	PHP
	SEP.b #$20
	LDA.b #$01
	STA.w $2105
	STZ.w $2107
	LDA.b #$11
	STA.w $212C
	STA.w $212E
	STZ.w $212D
	STZ.w $212F
	LDA.b #$00
	STA.w $2107
	LDA.b #$04
	STA.w $2108
	LDA.b #$08
	STA.w $2109
	LDA.b #$22
	STA.w $210B
	LDA.b #$01
	STA.w $210C
	LDA.b #$03
	STA.w $2101
	LDA.b #$08
	STA.w $13A4
	LDA.b #$10
	STA.w $13A6
	REP.b #$30
	LDA.w #$0028
	ASL
	STA.w $01B7
	STZ.w $01B5
	STZ.b $68
	JSL.l CODE_02953D
	JSL.l CODE_029573
	PLP
	RTL

CODE_02A504:
	SEP.b #$20
	LDA.b #$80
	STA.w $2100
	LDA.b #$81
	STA.w $4200
	REP.b #$20
	LDA.w #DATA_039FF2				;\ Optimization: This just gets overwritten immediately after.
	STA.b $78					;|
	LDA.w #DATA_039FF2>>16				;|
	STA.b $7A					;/
	LDA.w #DATA_03ABB2
	STA.b $78
	LDA.w #DATA_03ABB2>>16
	STA.b $7A
	LDA.w #$7EBB66
	STA.b $64
	LDA.w #DATA_039E4E
	STA.b $68
	SEP.b #$20
	LDA.b #$7EBB66>>16
	STA.b $66
	LDA.b #DATA_039E4E>>16
	STA.b $6A
	LDA.b #$1A
	STA.b $6C
	LDA.b #$0E
	STA.b $70
	JSL.l CODE_029ED9
	JSL.l CODE_029F13
	JSL.l CODE_029F3D
	RTL

CODE_02A54F:
	PHP
	REP.b #$20
	STA.w $1590
	JSL.l CODE_028EB6
	JSL.l CODE_028D8F
	JSL.l CODE_009843
	REP.b #$30
	JSR.w CODE_02A56B
	JSR.w CODE_02A69B
	PLP
	RTL

CODE_02A56B:
	REP.b #$30
	STZ.w $0102
	STZ.w $0104
	JSL.l CODE_0088ED
	LDA.w #$FFF8
	SEP.b #$20
	STA.w $210E
	STA.w $210E
	REP.b #$20
	LDA.w $1590
	CMP.w #$0001
	BEQ.b CODE_02A5F5
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0800>>16)
	LDX.w #$7F0800
	LDY.w #!Define_SXAR_Tilemap_IntroComicBook
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Layer1_ComicBookIntroCutscene
	LDX.w #$2000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Layer1_IntroComicBook
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_IntroComicBook
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToSPC700
	LDX.w #$0400
	LDY.w #!Define_SXAR_Music_Briefing
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_ComicBookIntroCutscene
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
	LDA.w #$0201
	JSL.l CODE_028B1F
	BRA.b CODE_02A646

CODE_02A5F5:
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0800>>16)
	LDX.w #$7F0800
	LDY.w #!Define_SXAR_Tilemap_ComicBookEndingCutscene
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Layer1_ComicBookEndingCutscene
	LDX.w #$2000
	JSL.l CODE_028000
	LDA.w $15C4
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Layer1_EndingComicBook
	LDX.w #$0000
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToCGRAM
	LDY.w #!Define_SXAR_Palette_Sprite_IntroComicBook
	LDX.w #$0080
	JSL.l CODE_028000
	REP.b #$30
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDY.w #!Define_SXAR_Graphics_Sprite_ComicBookEndingCutscene
	LDX.w #$6000
	JSL.l CODE_028000
	LDA.w $15C4
CODE_02A646:
	JSL.l CODE_02A4AB
	SEP.b #$20
	LDA.b #$F8
	STA.w $210E
	LDA.b #$FF
	STA.w $210E
	REP.b #$30
	LDA.w #DATA_0181B8
	JSL.l CODE_009612
	LDA.w #DATA_0181B8
	JSL.l CODE_009612
	RTS

CODE_02A667:
	REP.b #$30
	LDX.w #$07FE
CODE_02A66C:
	LDA.l $7F0800,x
	STA.l $7F0000,x
	DEX
	DEX
	BPL.b CODE_02A66C
	RTS

CODE_02A679:
	REP.b #$30
CODE_02A67B:
	LDY.b $68
	STX.b $8C
CODE_02A67F:
	LDA.l $7F0000,x
	ORA.w #$1C00
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_02A67F
	LDA.b $8C
	CLC
	ADC.w #$0040
	TAX
	DEC.b $6C
	BNE.b CODE_02A67B
	RTS

CODE_02A69B:
	SEP.b #$20
	LDA.b #$F0
	STA.w $2100
	LDA.b #$F1
	STA.w $4200
	REP.b #$30
	LDA.w #$0001
	STA.w $0102
	STA.w $0104
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	REP.b #$30
	STZ.b $AC
CODE_02A6C1:
	JSR.w CODE_02A667
	JSR.w CODE_02A717
	JSR.w CODE_02A74C
	JSR.w CODE_02A6F2
	BNE.b CODE_02A6C1
	LDA.w $1590
	BEQ.b CODE_02A6F1
	JSL.l CODE_0295A6
	SEP.b #$20
	LDA.b #$01
	STA.w $212C
	REP.b #$30
	JSR.w CODE_02A667
	DEC.w $158E
	LDA.w #$001E
	JSL.l CODE_02995B
	STZ.w $158E
CODE_02A6F1:
	RTS

CODE_02A6F2:
	DEC.w $158E
	JSL.l CODE_02A42A
	LDX.w #$011D
	JSR.w CODE_02A797
	BCS.b CODE_02A713
	STZ.w $158E
	LDA.w $1590
	ASL
	TAX
	LDA.w DATA_01CEB7,x
	CMP.b $AC
	BEQ.b CODE_02A712
	INC.b $AC
CODE_02A712:
	RTS

CODE_02A713:
	LDA.w #$0000
	RTS

CODE_02A717:
	LDA.b $AC
	ASL
	TAX
	LDA.w $1590
	BEQ.b CODE_02A725
	LDA.w DATA_01CEAB,x
	BRA.b CODE_02A728

CODE_02A725:
	LDA.w DATA_01CE9D,x
CODE_02A728:
	STA.b $8E
CODE_02A72A:
	LDA.b ($8E)
	BEQ.b CODE_02A74B
	INC.b $8E
	INC.b $8E
	LDY.w #$0000
	STA.b $90
	LDA.b ($90),y
	INY
	INY
	STA.b $68
	LDA.b ($90),y
	INY
	INY
	STA.b $6C
	LDA.b ($90),y
	TAX
	JSR.w CODE_02A679
	BRA.b CODE_02A72A

CODE_02A74B:
	RTS

CODE_02A74C:
	LDA.b $AC
	ASL
	ASL
	LDX.w $1590
	BEQ.b CODE_02A759
	CLC
	ADC.w #$0018
CODE_02A759:
	TAY
	LDX.w #$0000
	JSR.w CODE_02A76D
	INY
	INY
	LDX.w #$0002
	JSR.w CODE_02A76D
	JSL.l CODE_02A044
	RTS

CODE_02A76D:
	PHX
	TYX
	PLY
	LDA.l DATA_038200,x
	STA.w $04B0,y
	LDA.l DATA_03822C,x
	STA.w $053A,y
	LDA.l DATA_038258,x
	STA.w $064E,y
	LDA.l DATA_038284,x
	STA.w $06D8,y
	LDA.l DATA_0382B0,x
	STA.w $05C4,y
	PHX
	TYX
	PLY
	RTS

CODE_02A797:
	JSL.l CODE_0295A6
	LDA.w $1590
	CMP.w #$0001
	BEQ.b CODE_02A7AF
	LDA.b $56
	BIT.w #$1000
	BNE.b CODE_02A7BE
	BIT.w #$C0C0
	BNE.b CODE_02A7B4
CODE_02A7AF:
	DEX
	BNE.b CODE_02A797
	BRA.b CODE_02A7BC

CODE_02A7B4:
	JSL.l CODE_0295A6
	BIT.b $56
	BNE.b CODE_02A7B4
CODE_02A7BC:
	CLC
	RTS

CODE_02A7BE:
	SEC
	RTS

	%InsertGarbageData($02A7C0, incbin, DATA_02A7C0.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank03Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

DATA_038000:
	dw $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
	dw $0008,$0009,$000A,$000B,$000C,$000D,$000E,$000F
	dw $0010,$0011,$0012,$0013,$0014,$0015,$0016,$0017
	dw $0018,$0019,$001A,$001C,$001E,$0020,$0022,$0024
	dw $0026,$0029,$002C,$002F,$0032,$0035,$0039,$003D
	dw $0041,$0045,$004A,$004F,$0054,$005A,$0060,$0066
	dw $006D,$0074,$007C,$0084,$008D,$0096,$00A0,$00AA
	dw $00B5,$00C0,$00CC,$00D8,$00E5,$00F3,$0101,$0110
	dw $0120,$0131,$0142,$0154,$0167,$017B,$0190,$01A5
	dw $01BB,$01D2,$01E8,$0200,$021C,$0238,$0254,$0271
	dw $0290,$02B0,$02D1,$02F3,$0316,$033B,$0361,$0388
	dw $03B1,$03DB,$0407,$0434,$0462,$0492,$04C4,$04F7
	dw $052C,$0563,$059B,$05D5,$0611,$064F,$068E,$06CF
	dw $0712,$0757,$079E,$07E7,$0832,$087F,$08CF,$0921
	dw $0975,$09CB,$0A24,$0A7F,$0ADC,$0B3C,$0B9E,$0C03
	dw $0C6A,$0CD4,$0D41,$0DB0,$0E22,$0E97,$0F0F,$0F8A
	dw $1008,$1089,$110D,$1194,$121E,$12AB,$133B,$13CE
	dw $1465,$14FF,$159C,$163D,$16E1,$1789,$1835,$18E4
	dw $1997,$1A4E,$1B09,$1BC7,$1C89,$1D4F,$1E19,$1EE7
	dw $1FBA,$2091,$216C,$224B,$232F,$2417,$2504,$25F5
	dw $26EB,$27E6,$28E5,$29E9,$2AF2,$2C00,$2D13,$2E2B
	dw $2F48,$306A,$3191,$32BD,$33EF,$3526,$3663,$37A5
	dw $38ED,$3A3A,$3B8D,$3CE6,$3E45,$3FA9,$4113,$4283
	dw $43FA,$4577,$46FA,$4883,$4A13,$4BA9,$4D46,$4EE9
	dw $5093,$5244,$53FB,$55B9,$577E,$594A,$5B1D,$5CF7
	dw $5ED8,$60C1,$62B1,$64A9,$66A8,$68AF,$6ABD,$6CD3
	dw $6EF1,$7117,$7345,$757B,$77B9,$79FF,$7C4D,$7EA4
	dw $8103,$836B,$85DB,$8854,$8AD6,$8D60,$8FF3,$928F
	dw $9534,$97E3,$9A9B,$9D5C,$A026,$A2FA,$A5D7,$A8BE
	dw $ABAF,$AEAA,$B1AF,$B4BE,$B7D7,$BAFA,$BE27,$C15E
	dw $C4A0,$C7EC,$CB43,$CEA5,$D211,$D588,$D90A,$DC97
	dw $E02F,$E3D2,$E781,$EB3B,$EF01,$F2D2,$F6AF,$FA98

DATA_038200:
	dw $0018,$00A0,$0030,$0180,$00B0,$0180,$0020,$0180
	dw $0090,$0180,$0070,$00B8,$0030,$0180,$0055,$0180
	dw $0036,$0180,$0086,$0180,$00D0,$0180

DATA_03822C:
	dw $0000,$0028,$0038,$0008,$0040,$0008,$00A0,$0008
	dw $0068,$0008,$0078,$00A0,$0050,$0008,$005C,$0008
	dw $0078,$0008,$00A8,$0008,$00B0,$0008

DATA_038258:
	dw $0008,$0003,$0004,$0001,$0003,$0001,$0007,$0001
	dw $0002,$0001,$0004,$0004,$0004,$0001,$0004,$0001
	dw $0003,$0001,$0003,$0001,$0003,$0001

DATA_038284:
	dw $0001,$0002,$0002,$0001,$0002,$0001,$0002,$0001
	dw $0002,$0001,$0002,$0002,$0002,$0001,$0002,$0001
	dw $0002,$0001,$0002,$0001,$0002,$0001

DATA_0382B0:
	dw DATA_01B3C4,DATA_01B358,DATA_01B378,DATA_019B0A,DATA_01B364,DATA_019B0A,DATA_01B3A8,DATA_019B0A
	dw DATA_01B370,DATA_019B0A,DATA_01B388,DATA_01B398,DATA_01B3F4,DATA_019B0A,DATA_01B404,DATA_019B0A
	dw DATA_01B414,DATA_019B0A,DATA_01B420,DATA_019B0A,DATA_01B42C,DATA_019B0A

DATA_0382DC:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$1F00
	dw $001F,$0000,$0000,$0000,$0000,$0000,$1F00,$001F
	dw $0000,$0000,$0000,$1F00,$1F1F,$1F00,$1F00,$0000
	dw $0000,$0000,$1F00,$001F,$0000,$001F,$1F1F,$0000
	dw $0000,$0000,$0000,$1F00,$1F1F,$1F1F,$001F,$1F00
	dw $4545,$0045,$0000,$0000,$0000,$0000,$0000,$0000
	dw $1F00,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$1F1F,$1F00,$1F1F,$1F1F,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$1F1F,$001F
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$1F1F,$1F1F,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$1F1F,$001F,$0000,$4F4F,$004F
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$1F1F
	dw $1F1F,$1F1F,$0000,$1F1F,$1F1F,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$1F1F,$0000,$0000

DATA_0383DC:
	dw $2500,$0025,$0000,$0000,$0000,$0000,$1500,$1515
	dw $151C,$1715,$1515,$1515,$1715,$1515,$1F15,$1515
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$1515,$151E,$1515,$1E1E
	dw $1200,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$2525,$2F22,$002C,$0000,$0000
	dw $0000,$0000,$0000,$0000,$5656,$5353,$5353,$5656
	dw $5653,$5353,$5400,$0053,$5356,$5300,$2525,$0000
	dw $0000,$5600,$5656,$0056,$0556,$0005,$5656,$5656
	dw $5600,$0056,$5656,$0000,$0015,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_0384DC:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0500
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_0385DC:
	dw $0500,$0505,$0005,$6F6F,$2F6F,$2F2F,$2F2F,$002F
	dw $0000,$6F6F,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$6F6F,$1F1F,$1F1F,$6F1F,$1F1F
	dw $1F1F,$1F1F,$1F1F,$1F1F,$001F,$1F1F,$1F1F,$1F1F
	dw $1F1F,$001F,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0005,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0505,$0000,$005F,$0000,$0000,$0000
	dw $0000,$0000,$5F00,$0000,$5F00,$0000,$0000,$7F00

DATA_0386DC:
	dw $0000,$0000,$0000,$6F00,$0000,$0000,$0000,$0000
	dw $6F00,$6F6F,$6F6F,$6F6F,$0000,$0000,$0000,$6F6F
	dw $0000,$0000,$0000,$6F6F,$6F6F,$0000,$0000,$0000
	dw $0000,$0000,$0000,$6F00,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_0387DC:
	dw $001D,$0088,$00DB,$0000,$001D,$02E8,$00EB,$0000
	dw $001D,$0158,$01BB,$0000,$001D,$0278,$02BB,$0000
	dw $001D,$02B8,$02BB,$0000,$001D,$0088,$036B,$0000
	dw $001D,$0358,$048B,$0000,$001D,$0438,$048B,$0000
	dw $0029,$0180,$00AA,$0000,$002A,$00E0,$044A,$0000
	dw $002B,$0212,$056A,$0000,$002C,$0360,$017A,$0000
	dw $002D,$02D2,$056A,$0000,$002E,$01A0,$070A,$0000
	dw $002F,$0320,$070A,$0000,$0030,$0230,$02EA,$0000
	dw $0037,$3B00,$0068,$0000,$0038,$0200,$0158,$0000
	dw $0039,$3B30,$0168,$0000,$003A,$02A0,$0248,$0000
	dw $003B,$00A0,$0218,$0000,$003C,$3C30,$0228,$0000
	dw $003D,$03C0,$0318,$0000,$003E,$01F0,$0438,$0000
	dw $003F,$03D0,$0438,$0000,$0040,$0270,$0558,$0000
	dw $0041,$03D0,$0578,$0000,$0042,$0220,$0678,$0000
	dw $0043,$0020,$06F8,$0000,$0044,$0190,$02D8,$0000
	dw $0045,$03B0,$06F8,$0000,$0046,$0410,$06F8,$0000
	dw $0024,$0136,$0674,$0000,$0024,$00E8,$06F4,$0000
	dw $0033,$0382,$0717,$0001,$0033,$0092,$0454,$0001
	dw $0033,$0168,$0240,$0001,$0033,$0090,$0180,$0001
	dw $0023,$018C,$0546,$0000,$0047,$01F0,$02F0,$0000
	dw $0047,$0212,$00A7,$0000,$0047,$0202,$00B7,$0000
	dw $0047,$0418,$031B,$0000,$0012,$0448,$00F0,$0000
	dw $0035,$0360,$05A8,$0000,$0023,$02BE,$0325,$0000
	dw $0024,$02AE,$0315,$0000,$0025,$02CE,$0335,$0000
	dw $0035,$0219,$0464,$0000,$004D,$042C,$0333,$0000
	dw $004D,$0386,$064E,$0000,$0025,$03EE,$0175,$0000
	dw $0023,$03BE,$0105,$0000,$0025,$03DE,$0135,$0000
	dw $0023,$03EE,$0125,$0000,$0025,$03CE,$0135,$0000
	dw $0023,$03DE,$0145,$0000,$0024,$03EE,$0155,$0000
	dw $0023,$03CE,$0165,$0000,$0091,$02BE,$06A0,$0000
	dw $0091,$02AE,$071E,$0000,$0091,$0362,$059F,$0000
	dw $0091,$0220,$045F,$0000,$0091,$02BE,$033E,$0000
	dw $0091,$02FC,$018E,$0000,$0082,$02D4,$0192,$0002
	dw $0082,$02F4,$0192,$0002,$0082,$0314,$0192,$0002
	dw $007D,$022C,$016B,$0000,$0000,$0000,$0000,$0000

DATA_038A0C:
	dw $004D,$0234,$0506,$0000,$004D,$0296,$029F,$0000
	dw $0091,$01E0,$071E,$0000,$0091,$03AC,$071E,$0000
	dw $0097,$02EC,$051F,$0000,$0097,$028C,$0339,$0000
	dw $0091,$0426,$0341,$0000,$001D,$0148,$02CB,$0000
	dw $001D,$01E8,$02CB,$0000,$001D,$0288,$02CB,$0000
	dw $001D,$01D8,$047B,$0000,$001D,$0398,$063B,$0000
	dw $001D,$03D8,$063B,$0000,$001D,$0418,$063B,$0000
	dw $001D,$02D8,$012B,$0000,$0029,$0130,$05AA,$0000
	dw $002A,$0190,$05AA,$0000,$002B,$01F2,$05AA,$0000
	dw $002C,$02B0,$05AA,$0000,$002D,$0312,$05AA,$0000
	dw $002E,$02D0,$070A,$0000,$002F,$01A0,$032A,$0000
	dw $0030,$0240,$032A,$0000,$0037,$02F0,$01D8,$0000
	dw $0038,$03C0,$0318,$0000,$0039,$0150,$0438,$0000
	dw $003A,$0400,$0438,$0000,$003B,$0250,$0598,$0000
	dw $003C,$0360,$0598,$0000,$003D,$0100,$06F8,$0000
	dw $003E,$03E0,$06F8,$0000,$0035,$0424,$0354,$0000
	dw $0052,$027C,$0702,$0001,$0052,$036E,$0505,$0001
	dw $0052,$0380,$0430,$0001,$0047,$0370,$0710,$0000
	dw $0047,$0406,$01F9,$0000,$0047,$03AC,$0437,$0000
	dw $0047,$03CC,$0456,$0000,$0025,$0104,$01DE,$0000
	dw $0023,$0100,$01EE,$0000,$0024,$0107,$01FE,$0000
	dw $0023,$03C0,$0450,$0000,$0025,$0100,$06C9,$0000
	dw $0024,$0100,$06D9,$0000,$0023,$0100,$06E9,$0000
	dw $0025,$03EE,$06A9,$0000,$0024,$03F0,$06A9,$0000
	dw $0024,$03E4,$06B9,$0000,$0024,$03E3,$06C9,$0000
	dw $0023,$03D0,$06C9,$0000,$0033,$00DA,$05BB,$0001
	dw $0033,$01E2,$0518,$0001,$0033,$01E2,$033E,$0001
	dw $0033,$0280,$033E,$0001,$0024,$03A8,$02AD,$0000
	dw $0023,$03B8,$02BD,$0000,$0025,$03C8,$02CD,$0000
	dw $0024,$03D8,$02DD,$0000,$0023,$03E8,$02ED,$0000
	dw $0025,$03A8,$02FD,$0000,$0024,$03B8,$02FD,$0000
	dw $0084,$01F8,$00E6,$0000,$0085,$0258,$00F6,$0000
	dw $0086,$0298,$0146,$0000,$0087,$0298,$0196,$0000
	dw $0088,$0258,$01D6,$0000,$0089,$01F8,$01E6,$0000
	dw $008A,$0198,$01D6,$0000,$008B,$0158,$0196,$0000
	dw $008C,$0158,$0146,$0000,$008D,$0198,$00F6,$0000
	dw $0082,$0422,$033B,$0002,$0082,$03C0,$033C,$0002
	dw $008F,$01F8,$015E,$0040,$0000,$0000,$0000,$0000

DATA_038C6C:
	dw $00A4,$02F4,$0196,$0000,$00A4,$049A,$0246,$0000
	dw $00A4,$07E2,$0246,$0000,$00A4,$0670,$05A6,$0000
	dw $00A4,$0498,$05A6,$0000,$00A4,$05EE,$07F6,$0000
	dw $00A4,$03FA,$07F6,$0000,$00A4,$046A,$0936,$0000
	dw $00A4,$05A9,$0206,$0000,$00A4,$06D1,$0246,$0000
	dw $00A4,$0525,$05A6,$0000,$00A4,$03B5,$06C6,$0000
	dw $00A4,$04CB,$07F6,$0000,$00A4,$0169,$0936,$0000
	dw $00A4,$0207,$0916,$0000,$00A4,$0529,$0916,$0000
	dw $00A4,$0603,$0956,$0000,$0073,$01B3,$014A,$0000
	dw $0073,$067A,$0200,$0000,$0073,$081C,$0525,$0000
	dw $0073,$06A2,$0550,$0000,$0073,$06A8,$0550,$0000
	dw $0073,$064E,$0548,$0000,$0073,$0538,$0550,$0000
	dw $0073,$040C,$0550,$0000,$0073,$0282,$0585,$0000
	dw $0073,$020E,$0671,$0000,$0073,$0214,$0673,$0000
	dw $0073,$050E,$01D3,$0000,$0073,$0398,$0225,$0000
	dw $0073,$022C,$042F,$0000,$0073,$024C,$0425,$0000
	dw $0073,$0408,$069D,$0000,$0073,$043E,$06B7,$0000
	dw $0073,$0690,$06B1,$0000,$0073,$06A0,$06B4,$0000
	dw $0073,$047C,$07A5,$0000,$0073,$036A,$075D,$0000
	dw $0073,$03C8,$08D1,$0000,$0073,$0452,$08F3,$0000
	dw $0073,$0502,$08B8,$0000,$0073,$0626,$08F3,$0000
	dw $0009,$07A0,$08EF,$0001,$0004,$0104,$06BF,$0000
	dw $0004,$0538,$06DF,$0000,$0004,$07BE,$063F,$0000
	dw $0004,$090E,$074F,$0000,$0004,$0778,$07FF,$0000
	dw $006B,$05E0,$040F,$0000,$0068,$0944,$087D,$0000
	dw $006F,$01FC,$038F,$0000,$006F,$03FC,$0310,$0000
	dw $006F,$0590,$037B,$0000,$006F,$0816,$03BB,$0000
	dw $0074,$0498,$06FF,$0000,$0074,$05EF,$06FF,$0000
	dw $0074,$05D1,$06FF,$0000,$0074,$0840,$021F,$0000
	dw $0074,$084A,$075F,$0000,$0074,$08B0,$074F,$0000
	dw $0074,$02B8,$074F,$0000,$0074,$027C,$08EF,$0000
	dw $0074,$029C,$08EF,$0000,$0074,$02C6,$08EF,$0000
	dw $0074,$06AE,$090F,$0000,$0074,$02F6,$044F,$0000
	dw $0074,$0298,$044F,$0000,$0074,$023D,$05BF,$0000
	dw $0074,$01A9,$05DF,$0000,$0074,$010C,$02BF,$0000
	dw $0074,$016A,$028F,$0000,$000D,$0756,$063F,$0000
	dw $000D,$005C,$07FF,$0000,$000D,$00AC,$082F,$0000
	dw $000D,$08D6,$045F,$0000,$000D,$08A6,$045F,$0000
	dw $000D,$03B6,$042F,$0000,$000D,$08D8,$037F,$0000
	dw $000D,$0900,$039F,$0000,$000D,$0857,$0311,$0000
	dw $000D,$0877,$0311,$0000,$000D,$0150,$014F,$0000
	dw $000D,$028D,$014F,$0000,$000D,$0416,$016F,$0000
	dw $000D,$062A,$019F,$0000,$000D,$092F,$013F,$0000
	dw $000D,$042C,$009F,$0000,$000D,$0454,$009F,$0000
	dw $000D,$047C,$009F,$0000,$000D,$070C,$009F,$0000
	dw $000D,$077C,$009F,$0000,$000D,$085C,$009F,$0000
	dw $000D,$048C,$009F,$0000,$000D,$005E,$020F,$0000
	dw $000D,$00EC,$039F,$0000,$000D,$02B8,$03CF,$0000
	dw $000D,$03DC,$034F,$0000,$000D,$0426,$08CF,$0000
	dw $000D,$05E8,$08EF,$0000,$0004,$023A,$08BF,$0000
	dw $0004,$0456,$08CF,$0000,$0011,$0156,$089F,$0000
	dw $0011,$01BE,$089F,$0000,$0011,$0542,$08AF,$0000
	dw $0011,$068C,$031F,$0000,$0011,$069C,$031F,$0000
	dw $0011,$0867,$0311,$0000,$0011,$03BC,$034F,$0000
	dw $0011,$0648,$009F,$0000,$0011,$0896,$015F,$0000
	dw $0011,$047A,$019F,$0000,$0011,$075C,$01FF,$0000
	dw $0011,$00CE,$024F,$0000,$000F,$0406,$00A0,$0000
	dw $000F,$03A8,$0350,$0000,$007D,$065C,$0310,$0000
	dw $000F,$0690,$0640,$0000,$000F,$026E,$08BF,$0000
	dw $0015,$0386,$0213,$0000,$0015,$01A6,$0352,$0000
	dw $0015,$0212,$0350,$0000,$0015,$02BC,$030F,$0000
	dw $0015,$03A5,$03D1,$0000,$0015,$03E0,$030D,$0000
	dw $0015,$0854,$02A3,$0000,$0015,$06A4,$02A3,$0000
	dw $0015,$0798,$0523,$0000,$0015,$05FA,$0557,$0000
	dw $0015,$0652,$0549,$0000,$0015,$05D2,$0551,$0000
	dw $0015,$0364,$053D,$0000,$0015,$032C,$0541,$0000
	dw $0015,$02F8,$053F,$0000,$0015,$02B0,$0547,$0000
	dw $0015,$020C,$0553,$0000,$0015,$0124,$046B,$0000
	dw $0015,$014A,$0465,$0000,$0015,$0164,$0461,$0000
	dw $0015,$0196,$0465,$0000,$0015,$01CC,$045F,$0000
	dw $0015,$0168,$0671,$0000,$0015,$01D0,$066D,$0000
	dw $0015,$023A,$066D,$0000,$0015,$026C,$066D,$0000
	dw $0015,$02AC,$0663,$0000,$0015,$02E2,$065D,$0000
	dw $0015,$0320,$0653,$0000,$0015,$034E,$0649,$0000
	dw $0015,$0680,$06A1,$0000,$0015,$06A8,$069F,$0000
	dw $0015,$06E4,$069B,$0000,$0015,$0754,$06A1,$0000
	dw $0015,$0676,$07C1,$0000,$0015,$0586,$07CD,$0000
	dw $0015,$0456,$0789,$0000,$0015,$035C,$0867,$0000
	dw $0015,$0694,$08DB,$0000,$0015,$05A6,$087D,$0000
	dw $0015,$0514,$087D,$0000,$0057,$0014,$019B,$0000
	dw $0058,$0930,$024B,$0000,$0059,$0030,$048B,$0000
	dw $005A,$0930,$054B,$0000,$005B,$0030,$095B,$0000
	dw $005C,$0654,$070D,$0000,$005D,$033A,$05AC,$0000
	dw $005E,$0373,$028C,$0000,$005F,$0264,$06CB,$0000
	dw $0060,$0646,$07FB,$0000,$0061,$0668,$024B,$0000
	dw $0063,$0300,$028B,$0000,$0067,$07E9,$079C,$0000
	dw $0069,$04A4,$093F,$0000,$0014,$01B0,$06CC,$0000
	dw $0014,$024A,$077C,$0000,$0000,$0000,$0000,$0000

DATA_0391EC:
	dw $0077,$0120,$0088,$0000,$0076,$0120,$0098,$0000
	dw $0078,$0120,$00A8,$0000,$007B,$0120,$00A8,$0000
	dw $000F,$7000,$7000,$0000,$000F,$7000,$7000,$0000
	dw $000F,$7000,$7000,$0000,$000F,$7000,$7000,$0000
	dw $000F,$7000,$7000,$0000,$000F,$7000,$7000,$0000
	dw $000F,$7000,$7000,$0000,$0000,$0000,$0000,$0000

DATA_03924C:
	dw $0015,$0450,$004A,$0000,$0015,$04A0,$004D,$0000
	dw $0015,$0670,$006F,$0000,$0015,$06D0,$006D,$0000
	dw $0015,$0846,$0043,$0000,$0015,$12D0,$02EF,$0000
	dw $0015,$1364,$02EB,$0000,$007D,$0467,$009F,$0000
	dw $006F,$0997,$0089,$0000,$006F,$1443,$0329,$0000
	dw $006F,$1599,$0373,$0000,$0083,$0B19,$0195,$0000
	dw $0083,$0DEE,$01D9,$0000,$0083,$1112,$025F,$0000
	dw $0083,$126A,$030B,$0000,$0083,$159C,$0331,$0000
	dw $0083,$1524,$0331,$0000,$0068,$15CC,$03C5,$0000
	dw $0009,$0EF3,$026F,$0001,$0014,$07B2,$019B,$0000
	dw $0014,$0D44,$02BB,$0000,$000D,$016C,$008F,$0000
	dw $000D,$01E2,$00DF,$0000,$000D,$0288,$00DF,$0000
	dw $000D,$0276,$00DF,$0000,$000D,$0330,$011F,$0000
	dw $000D,$0450,$018F,$0000,$000D,$058E,$018F,$0000
	dw $000D,$0597,$00BF,$0000,$000D,$05E6,$00EF,$0000
	dw $000D,$04F0,$009F,$0000,$000D,$04E2,$009F,$0000
	dw $000D,$043A,$009F,$0000,$0004,$074C,$009F,$0000
	dw $0004,$0DB5,$026F,$0000,$0004,$12AF,$037F,$0000
	dw $0004,$0367,$011F,$0000,$000D,$0784,$009F,$0000
	dw $000D,$0709,$018F,$0000,$000D,$0734,$018F,$0000
	dw $000D,$0759,$018F,$0000,$000D,$0929,$00AF,$0000
	dw $000D,$0954,$013F,$0000,$000D,$0AA2,$019F,$0000
	dw $0011,$09FF,$019F,$0000,$0011,$0B4C,$01AF,$0000
	dw $000D,$0A58,$01DF,$0000,$000D,$0B14,$01DF,$0000
	dw $000D,$0BC8,$019F,$0000,$000D,$0C70,$01DF,$0000
	dw $000D,$0DCA,$026F,$0000,$000D,$0EA6,$026F,$0000
	dw $000D,$0EC6,$026F,$0000,$000D,$123E,$034F,$0000
	dw $000D,$12E8,$037F,$0000,$000D,$13C0,$037F,$0000
	dw $000D,$14A4,$037F,$0000,$000D,$154D,$03BF,$0000
	dw $000D,$1552,$03BF,$0000,$000D,$156E,$03BF,$0000
	dw $000D,$157F,$03BF,$0000,$0073,$0414,$0113,$0000
	dw $0073,$055C,$00E3,$0000,$0073,$043E,$0055,$0000
	dw $0073,$0522,$0055,$0000,$0073,$08DA,$0111,$0000
	dw $0073,$08DF,$0114,$0000,$0073,$09C0,$0147,$0000
	dw $0073,$0A36,$0197,$0000,$0073,$0B2A,$0197,$0000
	dw $0073,$0B7C,$0197,$0000,$0073,$0CE4,$01FD,$0000
	dw $0073,$0CE8,$01FE,$0000,$0073,$0CF0,$01FF,$0000
	dw $0073,$1084,$029F,$0000,$0073,$1088,$02A7,$0000
	dw $0073,$11A0,$0300,$0000,$0073,$1225,$0337,$0000
	dw $0073,$144C,$036F,$0000,$0073,$144F,$0377,$0000
	dw $0000,$0000,$0000,$0000

DATA_0394D4:
	dw $007D,$0040,$042F,$0000,$0094,$0158,$0710,$0001
	dw $0094,$0278,$0680,$0001,$0094,$0258,$0650,$0001
	dw $0094,$0068,$0610,$0001,$0094,$0158,$0590,$0001
	dw $0094,$0408,$0580,$0001,$0094,$01E8,$0480,$0001
	dw $0094,$0098,$0440,$0001,$0094,$01A8,$03F0,$0001
	dw $0094,$0288,$03F0,$0001,$0094,$0268,$0370,$0001
	dw $0094,$0188,$0370,$0001,$0094,$01F8,$02E0,$0001
	dw $0094,$0308,$02E0,$0001,$0094,$0118,$0180,$0001
	dw $0094,$0218,$0160,$0001,$0094,$0188,$00E0,$0001
	dw $0095,$0100,$059C,$0001,$0095,$0240,$051C,$0001
	dw $0095,$0220,$051C,$0001,$0095,$0270,$048C,$0001
	dw $0095,$0380,$02EC,$0001,$0096,$01A6,$05FF,$0000
	dw $0096,$03C4,$068F,$0000,$0096,$0344,$068F,$0000
	dw $0096,$00FE,$05FF,$0000,$0096,$0224,$058F,$0000
	dw $0096,$023F,$058F,$0000,$0096,$0346,$05CF,$0000
	dw $0096,$03CE,$04AF,$0000,$0096,$03E0,$04AF,$0000
	dw $0096,$03F0,$04AF,$0000,$0096,$032A,$048F,$0000
	dw $0096,$0348,$03DF,$0000,$0096,$0388,$03DF,$0000
	dw $0096,$0138,$02CF,$0000,$0096,$0158,$02CF,$0000
	dw $0096,$0178,$02CF,$0000,$0096,$0198,$02CF,$0000
	dw $0096,$0132,$01FF,$0000,$0096,$028E,$01AF,$0000
	dw $0096,$00AD,$057F,$0000,$0096,$0081,$050F,$0000
	dw $0096,$0125,$04CF,$0000,$0096,$0335,$04FF,$0000
	dw $0096,$0355,$04FF,$0000,$0096,$0375,$04FF,$0000
	dw $0096,$00E1,$045F,$0000,$0096,$0122,$03DF,$0000
	dw $0096,$0162,$03DF,$0000,$0096,$029F,$02CF,$0000
	dw $006D,$03E0,$06FF,$0000,$006D,$02E0,$035F,$0000
	dw $00A0,$0440,$0423,$0001,$00A0,$041B,$0203,$0001
	dw $00A0,$00FA,$006C,$0001,$00A0,$0144,$042B,$0001
	dw $006B,$0330,$00CF,$0000,$0008,$0445,$00BF,$0040
	dw $0093,$03D9,$062F,$0000,$0093,$030A,$024F,$0000
	dw $0093,$01EA,$024F,$0000,$0093,$0134,$024F,$0000
	dw $0093,$019C,$01DF,$0000,$0093,$0098,$013F,$0000
	dw $0093,$00AE,$00EF,$0000,$00AB,$0396,$0324,$0000
	dw $00AB,$0304,$0432,$0000,$0000,$0000,$0000,$0000

DATA_039704:
	dw $0006,$0001,$00CF,$0040,$00A6,$01C8,$009F,$0000
	dw $00A6,$0488,$008F,$0000,$00A6,$04D8,$0089,$0000
	dw $00A6,$0678,$006B,$0000,$00A6,$07B8,$0089,$0000
	dw $00A6,$0888,$0089,$0000,$00A6,$0B78,$00CB,$0000
	dw $00A6,$0DC8,$00A7,$0000,$00A6,$0E38,$0087,$0000
	dw $00A6,$0F28,$0087,$0000,$00A6,$1408,$008F,$0000
	dw $00A6,$1598,$0097,$0000,$00A6,$1458,$0097,$0000
	dw $00A6,$15C8,$0097,$0000,$00A7,$0208,$009E,$0000
	dw $00A7,$0338,$008E,$0000,$00A7,$0438,$008E,$0000
	dw $00A7,$0818,$007E,$0000,$00A7,$0908,$0077,$0000
	dw $00A7,$0B28,$00BE,$0000,$00A7,$0C48,$00DB,$0000
	dw $00A7,$0D68,$00B9,$0000,$00A7,$0F78,$0079,$0000
	dw $00A7,$1308,$0087,$0000,$00A7,$1548,$007E,$0000
	dw $00A7,$1668,$009E,$0000,$00A7,$13A8,$008B,$0000
	dw $00A7,$1628,$009B,$0000,$006D,$0CD6,$009F,$0000
	dw $006D,$115C,$002F,$0000,$00A8,$0597,$008F,$0000
	dw $00A8,$0C86,$00BF,$0000,$00A8,$1074,$004F,$0000
	dw $00A8,$121A,$004F,$0000,$00A8,$168E,$005F,$0000
	dw $0000,$0000,$0000,$0000

DATA_03982C:
	dw $00AA,$07C7,$007F,$0040,$0096,$015A,$00EF,$0000
	dw $0096,$022E,$008F,$0000,$0096,$027E,$008F,$0000
	dw $0096,$039E,$00AF,$0000,$0096,$04AC,$009F,$0000
	dw $0096,$04F6,$00DF,$0000,$0096,$0592,$009F,$0000
	dw $0093,$023E,$008F,$0000,$0093,$0348,$00AF,$0000
	dw $0093,$0426,$00AF,$0000,$0096,$0640,$00CF,$0000
	dw $0096,$06D9,$00CF,$0000,$2003,$06A6,$007F,$0000
	dw $00A0,$0502,$0062,$0000,$0000,$0000,$0000,$0000

DATA_0398AC:
	dw $00AA,$07C7,$00EF,$0040,$000D,$013E,$00AF,$0000
	dw $000D,$013E,$00EF,$0000,$000D,$0215,$009F,$0000
	dw $000D,$0245,$009F,$0000,$000D,$02E1,$00EF,$0000
	dw $000D,$0359,$00EF,$0000,$000D,$044F,$00CF,$0000
	dw $000D,$0521,$008F,$0000,$000D,$056B,$00EF,$0000
	dw $000D,$0641,$00AF,$0000,$000D,$0687,$00EF,$0000
	dw $000D,$035B,$007F,$0000,$000D,$06F5,$00AF,$0000
	dw $0011,$02C2,$007F,$0000,$0011,$03C1,$007F,$0000
	dw $00A4,$06BE,$00D8,$0000,$0004,$03B5,$00AF,$0000
	dw $0000,$0000,$0000,$0000

DATA_039944:
	dw $0000,DATA_018050,DATA_018078,DATA_0196FA,DATA_0191AA,DATA_0180A0,DATA_0199F2,$0000
	dw DATA_01997A,DATA_01924A,DATA_018D4A,DATA_0182A8,DATA_018CAA,DATA_018D22,DATA_0184B0,DATA_0182F8
	dw DATA_0182D0,DATA_018D72,DATA_0185F0,DATA_018DC2,DATA_018DEA,DATA_018FCA,$0000,$0000
	dw $0000,$0000,$0000,$0000,DATA_018438,DATA_018460,DATA_018488,$0000
	dw DATA_018000,DATA_018000,DATA_018410,DATA_018500,DATA_018528,DATA_018550,DATA_0185C8,DATA_018578
	dw DATA_0185A0,DATA_0186BA,DATA_0186E2,DATA_01870A,DATA_018732,DATA_01875A,DATA_018782,DATA_0187AA
	dw DATA_0187D2,$0000,$0000,DATA_018618,DATA_018640,DATA_018668,DATA_018692,DATA_0187FA
	dw DATA_018822,DATA_01884A,DATA_018872,DATA_01889A,DATA_0188C2,DATA_0188EA,DATA_018912,DATA_01893A
	dw DATA_018962,DATA_01898A,DATA_0189B2,DATA_0189DA,DATA_018A02,DATA_018A2A,DATA_018A52,DATA_018A7A
	dw DATA_018AA2,DATA_018ACA,DATA_018AF2,DATA_018B6A,DATA_018B1A,DATA_018B92,DATA_018BBA,DATA_018C0A
	dw DATA_018C32,DATA_018BE2,DATA_018C5A,DATA_018C82,DATA_018CD2,DATA_018CFA,DATA_018D9A,DATA_018E12
	dw DATA_018E3A,DATA_018E62,DATA_018E8A,DATA_018EB2,DATA_018EDA,DATA_018F02,DATA_018F2A,DATA_018F52
	dw DATA_018F7A,DATA_018FA2,DATA_019042,DATA_01906A,DATA_0190E2,DATA_01910A,DATA_019132,DATA_019092
	dw DATA_01915A,DATA_0190BA,DATA_0190BA,DATA_019182,DATA_0191D2,DATA_0191FA,DATA_019222,DATA_018FF2
	dw DATA_019272,DATA_01929A,DATA_0192C2,DATA_0192EA,DATA_019312,DATA_01901A,DATA_01933A,DATA_019362
	dw DATA_01938A,DATA_0193B2,DATA_0193DA,DATA_019402,DATA_01942A,DATA_019452,$0000,$0000
	dw $0000,$0000,DATA_01947A,DATA_0194A2,DATA_0194CA,DATA_0194F2,DATA_01951A,DATA_019542
	dw DATA_01956A,DATA_019592,DATA_0195BA,DATA_0195E2,DATA_01960A,DATA_019632,DATA_01965A,DATA_019682
	dw DATA_018B42,DATA_0196AA,DATA_0196D2,DATA_019722,DATA_01974A,DATA_019772,DATA_01979A,DATA_0197EA
	dw DATA_0197C2,DATA_019812,DATA_01983A,DATA_019862,DATA_018140,DATA_018168,DATA_0182A8,DATA_01988A
	dw DATA_0198B2,DATA_0198DA,DATA_019902,DATA_01992A,DATA_019952,DATA_0199A2,DATA_019A1A,DATA_019A42
	dw DATA_019A6A,DATA_019A92,DATA_019ABA,DATA_0199CA,$0000,DATA_019AE2

DATA_039AA0:
	dw CODE_00AC88,CODE_00A470,CODE_00A56D,CODE_00F74E,CODE_00E2A9,CODE_00BF84,CODE_00FC26,CODE_00AC88
	dw CODE_00FA24,CODE_00E526,CODE_00DB0B,CODE_00A724,CODE_00AC88,CODE_00DA48,CODE_00C3ED,CODE_00A7B0
	dw $0000,CODE_00DB44,CODE_00C655,CODE_00DEAE,CODE_00DE76,CODE_00E018,$0010,$0011
	dw $0012,$0013,$001A,CODE_00C471,CODE_00BD31,CODE_00BD73,CODE_00BDA2,CODE_00BDD1
	dw CODE_00BDF8,CODE_00BE4A,CODE_00BE7B,CODE_00C29D,CODE_00C29D,CODE_00C29D,CODE_00C60E,CODE_00C4C1
	dw CODE_00C5EE,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B
	dw CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C855,CODE_00C7BD,CODE_00C82B,CODE_00C918,CODE_00C97B
	dw CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B
	dw CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00C97B,CODE_00CA9A
	dw CODE_00CBA4,CODE_00CC3B,CODE_00CC47,CODE_00CD16,CODE_00CD97,CODE_00CE37,$0000,CODE_00CF04
	dw $0000,$0000,CODE_00D000,CODE_00D0C4,CODE_00B335,CODE_00B413,CODE_00DC03,CODE_00DDF3
	dw CODE_00DDF3,CODE_00DDF3,CODE_00DDF3,CODE_00DDF3,CODE_00DDF3,CODE_00DDF3,CODE_00DDF3,CODE_00DDF3
	dw CODE_00DDF3,CODE_00DDF3,CODE_00CF04,CODE_00DDEC,CODE_00DE98,CODE_00E203,CODE_00E220,CODE_00DDEC
	dw CODE_00E25A,CODE_00DDEC,CODE_00DDEC,CODE_00E25B,CODE_00E485,CODE_00E4B7,CODE_00E4F6,CODE_00E0F7
	dw CODE_00E801,CODE_00E831,CODE_00E839,CODE_00E84D,CODE_00DA48,CODE_00E8EE,CODE_00E8FD,CODE_00E95F
	dw CODE_00EA1C,CODE_00EAEA,CODE_00EB0A,CODE_00EA9C,CODE_00EB71,CODE_00A7F5,CODE_00F3FD,CODE_00F3FD
	dw CODE_00F3FD,CODE_00F3FD,CODE_00F477,CODE_00EE85,CODE_00D0D7,CODE_00D0D7,CODE_00D0D7,CODE_00D0D7
	dw CODE_00D0D7,CODE_00D0D7,CODE_00D0D7,CODE_00D0D7,CODE_00D0D7,CODE_00D0D7,CODE_00D267,CODE_00D2C9
	dw CODE_00CDE1,CODE_00D30A,CODE_00D391,CODE_00F94A,CODE_00F4C2,CODE_00F632,CODE_00F694,CODE_00D30A
	dw CODE_00C29D,CODE_00F5DA,CODE_00F5F2,CODE_00A7B0,$009C,$009D,CODE_00A71B,CODE_00F9AB
	dw CODE_00F9C6,CODE_00D3DA,CODE_00D3DB,$0000,CODE_00EEE7,CODE_00FBC1,CODE_00FDD8,CODE_00FDD8
	dw CODE_00FEAD,CODE_00DC03,CODE_00EF2F,CODE_00FB9C,CODE_00FD96,CODE_00D43E

table "Tables/Fonts/Credits.txt"

DATA_039BFC:
	db "    SOFTWARE         ACCLAIM",$FE
	db "   CREATIONS       DEVELOPMENT",$FE
	db "  DEVELOPMENT          BY",$FE
	db "     TEAM       ",$2B,"THE BLACK TEAM",$2B,$FE
	dw $FFFF

DATA_039C75:
	db "  PROGRAMMING   PAUL PROVENZANO",$FE
	db "  MIKE FOLLIN    BILLY PIDGEON",$FE
	db " KEVIN EDWARDS   MICHAEL ARKIN",$FE
	db " STEPHEN RUDDY   CAROL  ALBERT",$FE
	db "   MIKE WEBB    JOSEPH MAZIOTTO",$FE
	db "                  JAMES  FINK",$FE
	db $FE
	db "    ARTWORK      SPECIAL THANKS",$FE
	db "  ANT ANDERSON   GLORIA BIRULIN",$FE
	db " CRAIG  HOUSTON    C.P. MCBEE  ",$FE
	db " DAVE MCLACHLAN  ERIC  SAMULSKI",$FE
	db "  JAMES CLARKE",$FE
	db "  JOFFA  SMITH",$FE
	db "  STE PICKFORD",$FE
	db $FE
	db "    MUSIC",$FE
	db " GEOFF FOLLIN",$FE
	db "  TIM  FOLLIN",$FE
	dw $FFFF

DATA_039E07:
	db "  PROGRAMMING",$FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db "    ARTWORK      SPECIAL THANKS",$FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db $FE
	db "    MUSIC",$FE
	dw $FFFF

cleartable

DATA_039E4E:
	dw $0000,$0000,$0000,$0000,$0B00,$0E18,$0000,$121E
	dw $000F,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2E00,$0000,$7574,$7776,$7800,$7A79,$7C7B,$7E7D
	dw $807F,$8281,$7979,$8483,$8685,$0087,$0000,$8988
	dw $8B8A,$8D8C,$8F8E,$9190,$7D92,$9493,$9579,$9796
	dw $9998,$9A79,$9C9B,$0000,$9D00,$9F9E,$A1A0,$00A2
	dw $A4A3,$797C,$A6A5,$8179,$79A7,$A9A8,$AA84,$AB92
	dw $0000,$0000,$ADAC,$79AE,$B0AF,$B2B1,$92B3,$79B4
	dw $96B5,$9695,$B7B6,$B9B8,$BBBA,$00BC,$0000,$BD00
	dw $BFBE,$C1C0,$C3C2,$7C89,$C5C4,$C6B5,$A781,$C779
	dw $C9C8,$CBCA,$00CC,$0000,$CD00,$CFCE,$D1D0,$D3D2
	dw $91D4,$D6D5,$D8D7,$DAD9,$DCDB,$DEDD,$00DF,$0000
	dw $0000,$E000,$E179,$89E2,$E4E3,$E6E5,$E8E7,$EAE9
	dw $ECEB,$0000,$0000,$0000,$0000,$0000,$BEED,$8FEE
	dw $EF00,$F1F0,$F3F2,$00F4,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$F6F5,$00F7,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $00F8,$0000,$0000,$0000,$0000,$0000,$1813,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$6200
	dw $0000,$6300,$0064,$6665,$0000,$0000,$0000,$002E
	dw $0000,$0000,$0000,$0000,$6765,$6968,$6B6A,$6D6C
	dw $6E65,$706F,$716F,$7372,$0000,$0000

DATA_039FBA:
	dw $2F00,$3130,$3332,$3534,$3736,$3938,$2A3A,$3C3B
	dw $3E3D,$403F,$4241,$4443,$4645,$0047,$4948,$4B4A
	dw $4D4C,$4F4E,$5150,$5352,$0054,$5655,$5857,$5A59
	dw $5C5B,$5E5D,$605F,$0061

DATA_039FF2:
	incbin "Graphics/GFX_Mode7_SplashScreenFont.bin"

DATA_03ABB2:
	incbin "Graphics/GFX_Mode7_AcclaimAndXMenLogos.bin"

	%InsertGarbageData($03DE32, incbin, DATA_03DE32.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank13Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

CODE_138000:
	JMP.w CODE_138024

CODE_138003:
	JMP.w CODE_13DB46

CODE_138006:
	JMP.w CODE_13DB38

CODE_138009:
	JMP.w CODE_13802B

CODE_13800C:
	JMP.w CODE_13DB46

CODE_13800F:
	JMP.w CODE_13DB38

CODE_138012:
	JMP.w CODE_138039

CODE_138015:
	JMP.w CODE_13DB46

CODE_138018:
	JMP.w CODE_13DB38

CODE_13801B:
	JMP.w CODE_138032

CODE_13801E:
	JMP.w CODE_13DB46

CODE_138021:
	JMP.w CODE_13DB38

CODE_138024:
	REP.b #$20
	LDA.w #$0000
	BRA.b CODE_138040

CODE_13802B:
	REP.b #$20
	LDA.w #$0002
	BRA.b CODE_138040

CODE_138032:
	REP.b #$20
	LDA.w #$0004
	BRA.b CODE_138040

CODE_138039:
	REP.b #$20
	LDA.w #$0006
	BRA.b CODE_138040

CODE_138040:
	STA.w $11E2
	LDA.w #$0000
	TCD
	SEP.b #$30
	LDA.b #MainDataBank02>>16
	PHA
	PLB
	REP.b #$30
	JSR.w CODE_13DA3C
	JSR.w CODE_13DAE2
	JSR.w CODE_13D8E9
	SEP.b #$20
	LDA.b #$81
	STA.w $11B2
	STA.w $4200
	REP.b #$20
	JSR.w CODE_13D8BD
	JSR.w CODE_13854A
	JSR.w CODE_138077
	JSR.w CODE_13D8F5
	JSR.w CODE_13D8BD
	STZ.w $4200
	RTL

CODE_138077:
	JSR.w CODE_13D8BD
	JSR.w CODE_13D963
	STZ.w !RAM_SXAR_Global_LevelClearFlags
	JSR.w CODE_138551
	JSR.w CODE_13856A
	JSR.w CODE_138A34
	JSR.w CODE_138A55
	JSR.w CODE_1387A6
	LDA.w #$F800
	STA.b $04
	LDA.w #$003F
	STA.w $119C
	STZ.b $08
	JSR.w CODE_13ABCB
	LDX.w #$0002
	LDY.w #$0003
	JSR.w CODE_13D9C8
CODE_1380A8:
	JSR.w CODE_13D8F5
	JSR.w CODE_138129
	INC.b $02
	JSR.w CODE_13810E
	LDA.b $1D
	BIT.w #$4000
	BEQ.b CODE_1380E0
	INC.w !RAM_SXAR_Global_LevelClearFlags
	LDA.w $11E2
	BNE.b CODE_1380C8
	LDA.w #$3502
	JSR.w CODE_13A43F
CODE_1380C8:
	LDX.w #$0004
	LDY.w #$0004
	JSR.w CODE_13D9E5
	LDA.w $11E2
	CMP.w #$0002
	BNE.b CODE_1380DF
	JSR.w CODE_13D8F5
	JSR.w CODE_13DB27
CODE_1380DF:
	RTS

CODE_1380E0:
	BIT.w #$8000
	BEQ.b CODE_1380A8
	LDA.w $11E2
	BNE.b CODE_1380F0
	LDA.w #$3502
	JSR.w CODE_13A43F
CODE_1380F0:
	LDX.w #$0000
	LDY.w #$0001
	JSR.w CODE_13D9E5
	LDA.w $11E2
	CMP.w #$0002
	BNE.b CODE_138104
	JSR.w CODE_13DB27
CODE_138104:
	DEC.w !RAM_SXAR_Global_CurrentLivesLo
	RTS

CODE_138108:
	STZ.w $11C2
	STZ.w $11C6
CODE_13810E:
	JSR.w CODE_1381CF
	JSR.w CODE_138197
	JSR.w CODE_1387A6
	LDX.w $11E2
	JSR.w (DATA_138121,x)
	JSR.w CODE_13AC1D
	RTS

DATA_138121:
	dw CODE_138A5C
	dw CODE_138A5C
	dw CODE_138A5C
	dw CODE_138AE2

CODE_138129:
	LDA.w $11C6
	BIT.w #$1000
	BEQ.b CODE_13816B
	LDA.w $11E2
	BNE.b CODE_138142
	LDA.w #$0109
	JSR.w CODE_13A43F
	LDA.w #$7F0A
	JSR.w CODE_13A43F
CODE_138142:
	LDA.w #$0008
	STA.w $11B0
	JSR.w CODE_13D8F5
	LDX.w #DATA_14AC0E
	JSR.w CODE_139B6D
CODE_138151:
	JSR.w CODE_13D8F5
	LDA.w $11C6
	BIT.w #$1000
	BEQ.b CODE_138151
	LDA.w #$000F
	STA.w $11B0
	JSR.w CODE_13D8F5
	LDX.w #DATA_14AC1B
	JSR.w CODE_139B6D
CODE_13816B:
	RTS

CODE_13816C:
	INC.b $25
	LDX.w #$0003
	JSR.w CODE_13D8EE
	LDX.w #$01C6
CODE_138177:
	LDA.l $7E3398,x
	LDY.b $25
	BEQ.b CODE_138186
CODE_13817F:
	LSR
	AND.w #$3DEF
	DEY
	BNE.b CODE_13817F
CODE_138186:
	STA.w $0438,x
	DEX
	DEX
	BPL.b CODE_138177
	LDA.b $04
	ORA.w #$1000
	STA.b $04
	INX
	INX
	RTS

CODE_138197:							; Note: Something related to Gambit's levels.
	LDX.w $11E2
	JSR.w (DATA_1381C7,x)
	LDA.w $1204
	STA.w $1206
	STZ.w $1204
	LDA.w $120A
	STA.w $120C
	STZ.w $120A
	LDY.w #$0026
CODE_1381B2:
	LDX.w DATA_148000,y
	LDA.b $00,x
	BPL.b CODE_1381C2
	STY.b $5B
	STX.b $5D
	JSR.w ($0000,x)
	LDY.b $5B
CODE_1381C2:
	DEY
	DEY
	BPL.b CODE_1381B2
	RTS

DATA_1381C7:
	dw CODE_1396F1
	dw CODE_1397EC
	dw CODE_13988C
	dw CODE_139884

CODE_1381CF:
	LDX.w $11E2
	JMP.w (DATA_1381D5,x)

DATA_1381D5:
	dw CODE_1381DD
	dw CODE_13821B
	dw CODE_1381DD
	dw CODE_1381DD

CODE_1381DD:
	LDX.w #$0000
	LDA.w $0630
	SEC
	SBC.b $74
	CMP.w #$0060
	BCC.b CODE_1381F3
	SEC
	SBC.w #$00A0
	BCS.b CODE_1381F7
	BRA.b CODE_138217

CODE_1381F3:
	SEC
	SBC.w #$0060
CODE_1381F7:
	CLC
	ADC.b $74
	CMP.w $11D0
	BCS.b CODE_138217
	CMP.b $74
	BCS.b CODE_138215
	PHA
	LDA.b $1D
	BIT.w #$2000
	BEQ.b CODE_138214
	LDA.b $74
	CMP.w #$16E0
	BCS.b CODE_138214
	PLA
	RTS

CODE_138214:
	PLA
CODE_138215:
	STA.b $74
CODE_138217:
	JSR.w CODE_138D30
	RTS

CODE_13821B:
	JSR.w CODE_139912
	LDA.b $76
	BEQ.b CODE_138225
	JSR.w CODE_138D30
CODE_138225:
	RTS

CODE_138226:
	JSR.w CODE_13996D
	STZ.b $47
	STZ.b $49
	STZ.b $4B
	STZ.b $4D
	STZ.b $4F
	STZ.b $51
	STZ.b $53
	STZ.b $55
	STZ.b $57
	STZ.b $59
	JSR.w CODE_13839F
	LDA.b $74
	SEC
	SBC.w #$00D0
	STA.w $11FA
	LDA.w #$FFFF
	STA.w $1202
	STZ.w $11F8
	STZ.w $11FC
	STZ.w $11FE
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $86
	LDY.w #!Define_SXAR_LevelData_Gambit1
	JSR.w CODE_13CC80
	STZ.w $1C30
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($001C54>>16)
	LDX.w #$001C54
	LDY.w #!Define_SXAR_Graphics_Layer2_KingCardBG
	JSR.w CODE_13CC80
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7EB180>>16)
	LDX.w #$7EB180
	LDY.w #!Define_SXAR_Graphics_Layer2_DescendingWall
	JSR.w CODE_13CC80
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7EA580>>16)
	LDX.w #$7EA580
	LDY.w #!Define_SXAR_Graphics_Sprite_KingCard
	JSR.w CODE_13CC80
	LDA.w #CODE_13938B
	STA.b $11
	LDA.w #$0002
	STA.b $23
	LDX.w #$03BE
CODE_138297:
	LDA.w DATA_14C770,x
	STA.l $7E2B80,x
	DEX
	DEX
	BPL.b CODE_138297
	LDX.w #$7FA800
	LDY.w #!Define_SXAR_Graphics_Layer2_GiantSpikeBall
	JSR.w CODE_138776
	LDA.w #$3402
	JSR.w CODE_13A43F
	RTS

CODE_1382B2:
	JSR.w CODE_13839F
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $86
	LDY.w #!Define_SXAR_LevelData_Gambit2
	JSR.w CODE_13CC80
	LDY.w $11D4
	LDA.w $11CC
	LSR
	CLC
	ADC.w #$0008
	TAX
	JSR.w CODE_139B48
	JSR.w CODE_139CE7
	STA.b $8A
	LDA.w #$007F
	STA.b $8C
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $8A
	LDY.w #!Define_SXAR_LevelBG_Gambit2
	JSR.w CODE_13CC80
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7EA580>>16)
	LDX.w #$7EA580
	LDY.w #!Define_SXAR_Graphics_Sprite_GambitLevelGlobalSprites_BlackQueen
	JSR.w CODE_13CC80
	LDA.w #CODE_1390FD
	STA.b $11
	LDA.w #$0020
	STA.b $92
	LDA.w #$0004
	STA.b $23
	LDA.w $0632
	DEC
	STA.w $11FA
	LDA.w #$00EF
	STA.w $11F8
	LDA.w #$0003
	STA.w $1200
	LDA.w #$00B4
	STA.w $11FE
	JSR.w CODE_13A3C6
	LDX.w #$7FA800
	LDY.w #!Define_SXAR_Graphics_FG_BlackQueenThrone
	JSR.w CODE_138776
	RTS

CODE_138325:
	JSR.w CODE_13839F
	LDA.b $14,x
	ORA.w #$4000
	STA.b $14,x
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $86
	LDY.w #!Define_SXAR_LevelData_Gambit3
	JSR.w CODE_13CC80
	LDA.w #$0A00
	JSR.w CODE_139CE7
	STA.b $8A
	LDA.w #$007F
	STA.b $8C
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $8A
	LDY.w #!Define_SXAR_LevelBG_Gambit3
	JSR.w CODE_13CC80
	LDA.w #CODE_1390FD
	STA.b $11
	LDA.w #$00A0
	STA.b $92
	LDA.w #$0004
	STA.b $23
	RTS

CODE_138362:
	JSR.w CODE_1383D6
	LDA.b $14,x
	ORA.w #$4000
	STA.b $14,x
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $86
	LDY.w #!Define_SXAR_LevelData_Storm3
	JSR.w CODE_13CC80
	LDA.w #$0A00
	JSR.w CODE_139CE7
	STA.b $8A
	LDA.w #$007F
	STA.b $8C
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	LDX.b $8A
	LDY.w #!Define_SXAR_LevelBG_Gambit3
	JSR.w CODE_13CC80
	LDA.w #CODE_1390FD
	STA.b $11
	LDA.w #$00A0
	STA.b $92
	LDA.w #$0004
	STA.b $23
	RTS

CODE_13839F:
	LDX.w #$0620
	JSR.w CODE_13851D
	LDA.w #CODE_13A4B9
	STA.b $00,x
	LDA.w #$0002
	STA.b $16,x
	LDA.w #$2E00
	STA.b $14,x
	LDA.w #$0068
	STA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	LDA.w #$0034
	STA.w $11A0
	LDA.w #$0002
	STA.w $11A2
	STZ.w !RAM_SXAR_Gambit_CurrentStarCountLo
	STZ.w $11F2
	STZ.w $1216
	STZ.w $11F4
	STZ.w $120A
	RTS

CODE_1383D6:
	JSR.w CODE_13839F
	LDA.w #CODE_13A4B9
	STA.b $00,x
	LDA.w #$0008
	STA.b $0E,x
	RTS

CODE_1383E4:
	STA.b $18,x
	LDA.w #$0001
	STA.b $1A,x
	RTS

ADDR_1383EC:
	STA.b $16,x
	STZ.b $18,x
	RTS

CODE_1383F1:
	LDY.b $18,x
	BEQ.b CODE_138415
	DEC.b $1A,x
	BNE.b CODE_138415
CODE_1383F9:
	LDA.w $0000,y
	BPL.b CODE_138408
	STA.b $25
	INY
	INY
	JSR.w CODE_1386F1
	JMP.w CODE_1383F9

CODE_138408:
	STA.b $16,x
	INY
	INY
	LDA.w $0000,y
	STA.b $1A,x
	INY
	INY
	STY.b $18,x
CODE_138415:
	RTS

CODE_138416:
	LDA.w $0000,y
	PHY
	JSR.w CODE_13AACB
	PLY
	INY
	INY
	RTS

CODE_138421:
	LDA.w $0000,y
	STA.b $18,x
	TAY
	RTS

CODE_138428:
	LDA.w $0000,y
	STA.b $1A,x
	INY
	INY
	STY.b $18,x
	PLA
	RTS

CODE_138433:
	LDA.w $0000,y
	STA.b $14,x
	INY
	INY
	RTS

CODE_13843B:
	LDA.b $14,x
	AND.w #$C000
	ORA.w $0000,y
	STA.b $14,x
	INY
	INY
	RTS

CODE_138448:
	PLA
	STZ.b $18,x
	RTS

CODE_13844C:
	LDA.w $0000,y
	AND.b $0C,x
	STA.b $0C,x
	INY
	INY
	RTS

CODE_138456:
	LDA.w $0000,y
	ORA.b $0C,x
	STA.b $0C,x
	INY
	INY
	RTS

CODE_138460:
	LDA.w $0000,y
	XBA
	ORA.w #$0002
	JSR.w CODE_13A43F
	INY
	INY
	RTS

CODE_13846D:
	LDA.w $0000,y
	PHY
	TAY
	JSR.w CODE_13C9B7
	PLY
	INY
	INY
	RTS

CODE_138479:
	LDA.w $0000,y
	STA.b $1A,x
	INY
	INY
	STY.b $18,x
	LDA.w $11C2
	BIT.w #$0C00
	BEQ.b CODE_138499
	LDY.w #$002E
	BIT.w #$0800
	BNE.b CODE_138495
	LDY.w #$0030
CODE_138495:
	STY.b $16,x
	PLA
	RTS

CODE_138499:
	LDA.b $1E,x
	XBA
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_1384B1
	EOR.w #$00FF
	INC
	ASL
	TAY
	LDA.w DATA_14AF03,y
	STA.b $16,x
	PLA
	RTS

CODE_1384B1:
	ASL
	TAY
	LDA.w DATA_14AEF1,y
	STA.b $16,x
	PLA
	RTS

CODE_1384BA:
	LDA.w $0000,y
	STA.b $1A,x
	INY
	INY
	STY.b $18,x
	LDA.b $1E,x
	XBA
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_1384DB
	EOR.w #$00FF
	INC
	ASL
	TAY
	LDA.w DATA_14AF25,y
	STA.b $16,x
	PLA
	RTS

CODE_1384DB:
	ASL
	TAY
	LDA.w DATA_14AF13,y
	STA.b $16,x
	PLA
	RTS

CODE_1384E4:
	LSR
	LSR
	AND.w #$FFFE
	STA.b $7E
	TYA
	CLC
	ADC.w #$0040
	LSR
	LSR
	AND.w #$FFFE
	TAY
	LDA.w $1230,y
	CLC
	ADC.b $7E
	TAY
	LDA.b [$8E],y
	RTS

CODE_138500:
	JSR.w CODE_1384E4
	DEX
CODE_138504:
	INY
	INY
	ORA.b [$8E],y
	DEX
	BNE.b CODE_138504
	RTS

CODE_13850C:
	JSR.w CODE_1384E4
	DEX
CODE_138510:
	PHA
	TYA
	CLC
	ADC.b $82
	TAY
	PLA
	ORA.b [$8E],y
	DEX
	BNE.b CODE_138510
	RTS

CODE_13851D:
	LDA.w #$3000
	STA.b $14,x
	STZ.b $0E,x
	STZ.b $00,x
	STZ.b $16,x
	STZ.b $18,x
	STZ.b $1A,x
	STZ.b $1C,x
	STZ.b $08,x
	STZ.b $0C,x
	STZ.b $06,x
	RTS

CODE_138535:
	STZ.b $14,x
	STZ.b $16,x
	STZ.b $04,x
	STZ.b $0C,x
	STZ.b $06,x
	STZ.b $02,x
	STZ.b $26,x
	STZ.b $28,x
	STZ.b $22,x
	STZ.b $24,x
	RTS

CODE_13854A:
	LDA.w #$FFFF
	STA.w $11C0
	RTS

CODE_138551:
	LDA.w #$FFFF
	STA.b $7A
	STZ.b $1D
	LDY.w #$0026
CODE_13855B:
	LDX.w DATA_148000,y
	JSR.w CODE_13851D
	DEY
	DEY
	BPL.b CODE_13855B
	STZ.b $74
	STZ.b $76
	RTS

CODE_13856A:
	JSR.w CODE_139CE1
	JSR.w CODE_1386F4
	LDX.w $11E2
	LDA.w DATA_14AC79,x
	STA.w $11A8
	LDA.w DATA_14AC89,x
	STA.w $11AC
	LDY.w DATA_14AC51,x
	CPY.w $11C0
	BEQ.b CODE_138593
	STY.w $11C0
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E3580>>16)
	LDX.w #$7E3580
	JSR.w CODE_13CC80
CODE_138593:
	LDA.w #CODE_138E80
	STA.b $0F
	LDX.w $11E2
	LDA.w DATA_1482E8,x
	STA.b $27
	LDY.w #$0000
	LDA.b ($27),y
	INY
	INY
	STA.w $11C8
	ASL
	STA.w $11D4
	ASL
	ASL
	ASL
	STA.w $11CA
	SEC
	SBC.w #$0100
	STA.w $11D0
	LDA.b ($27),y
	INY
	INY
	STA.w $11CC
	ASL
	ASL
	ASL
	ASL
	STA.w $11CE
	SEC
	SBC.w #$00E0
	STA.w $11D2
	LDA.b ($27),y
	INY
	INY
	STA.w $11D6
	LDA.b ($27),y
	INY
	INY
	STA.w $11DC
	LDA.b ($27),y
	INY
	INY
	STA.b $74
	LDA.b ($27),y
	INY
	INY
	STA.b $76
	STA.b $78
	LDA.b ($27),y
	INY
	INY
	STA.w $0630
	LDA.b ($27),y
	INY
	INY
	STA.w $0632
	LDA.b ($27),y
	INY
	INY
	STA.b $1F
	LDA.b ($27),y
	INY
	INY
	STA.w $0992
	LDA.b ($27),y
	INY
	INY
	STA.w $0994
	LDA.b ($27),y
	STA.b $29
	INY
	INY
	LDA.b ($27),y
	STA.b $2B
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000420>>16)
	LDX.w #$000420
	LDY.b $29
	JSR.w CODE_13CC80
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000520>>16)
	LDX.w #$000520
	LDY.b $2B
	JSR.w CODE_13CC80
	LDX.w $11D4
	LDY.w $11CC
	CPX.w $11CC
	BCS.b CODE_13863C
	PHX
	TYX
	PLY
CODE_13863C:
	JSR.w CODE_139B48
	PHA
	JSR.w CODE_139CE7
	STA.b $86
	LDA.w #$007F
	STA.b $88
	STA.b $90
	LDX.w #$07FE
	LDA.w #$0000
CODE_138652:
	STA.l $7E2B80,x
	DEX
	DEX
	BPL.b CODE_138652
	LDA.b $1F
	STA.b $25
	JSR.w CODE_1386F1
	JSR.w CODE_138767
	LDY.w $11E2
	LDX.w DATA_14AC71,y
	LDY.w #$001E
CODE_13866D:
	LDA.w DATA_14AC91,x
	STA.w $0600,y
	DEX
	DEX
	DEY
	DEY
	BPL.b CODE_13866D
	LDY.w #$0400
	LDX.w #$0000
	LDA.w #$2000
CODE_138682:
	STA.l $7E2380,x
	INX
	INX
	DEY
	BNE.b CODE_138682
	LDX.w #$0000
	LDY.w #$0001
	JSR.w CODE_13D9E5
	JSR.w CODE_138782
	PLA
	ASL
	ASL
	JSR.w CODE_139CE7
	STA.b $8E
	JSR.w CODE_139CF5
	LDA.w $11CC
	ASL
	STA.b $25
	LDX.w #$0000
	TXA
CODE_1386AC:
	STA.w $1240,x
	CLC
	ADC.b $82
	INX
	INX
	DEC.b $25
	BNE.b CODE_1386AC
	SEC
	SBC.b $82
	STA.w $1242,x
	STA.w $1246,x
	STA.w $124A,x
	STA.w $124E,x
	SEC
	SBC.b $82
	STA.w $1240,x
	STA.w $1244,x
	STA.w $1248,x
	STA.w $124C,x
	STZ.w $1230
	STZ.w $1234
	STZ.w $1238
	STZ.w $123C
	LDA.b $82
	STA.w $1232
	STA.w $1236
	STA.w $123A
	STA.w $123E
	RTS

CODE_1386F1:
	JMP.w ($0025)

CODE_1386F4:
	JSR.w CODE_139E7C
	LDY.w #!Define_SXAR_Graphics_Layer3_GambitLevelSmallAndLargeFont
	LDX.w #$6000
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	JSR.w CODE_13CC80
	LDX.w $11E2
	LDY.w DATA_14AC29,x
	LDX.w #$2000
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	JSR.w CODE_13CC80
	LDX.w $11E2
	LDY.w DATA_14AC31,x
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000420>>16)
	LDX.w #$000420
	PHY
	JSR.w CODE_13CC80
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000520>>16)
	LDX.w #$000520
	PLY
	JSR.w CODE_13CC80
	JSR.w CODE_13D91B
	JSR.w CODE_1389DD
	SEP.b #$20
	LDA.b #$06
	STA.w $212C
	LDA.b #$74
	STA.w $2108
	REP.b #$20
	JSR.w CODE_13DA1A
	LDY.w $11E2
	LDX.w DATA_14AC41,y
	JSR.w CODE_139B6D
	LDY.w $11E2
	LDX.w DATA_14AC39,y
	JSR.w CODE_139B6D
	LDA.w #$9800
	STA.b $04
	LDX.w #$0000
	LDY.w #$0003
	JSR.w CODE_13D9C8
	JSR.w CODE_13DAF0
	RTS

CODE_138767:
	LDX.w #$7F0000
	LDY.w $11DC
	JSR.w CODE_138776
	LDX.w #$7F4000
	LDY.w $11D6
CODE_138776:
	TXA
	CLC
	ADC.b $84
	TAX
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0000>>16)
	JSR.w CODE_13CC80
	RTS

CODE_138782:
	LDA.b $84
	STA.b $25
	LDA.w #$007F
	STA.b $27
	LDA.w #$0000
	STA.b $29
	LDA.w #$C000
	STA.b $2B
	LDX.w #$0025
	JSR.w CODE_139E4B
	RTS

CODE_13879C:
	PHP
	SEP.b #$20
	LDA.b #$00
	STA.w $2101
	PLP
	RTS

CODE_1387A6:
	STZ.b $6A
	STZ.b $6C
	STZ.w $0400
	STZ.w $0402
	STZ.w $0404
	STZ.w $0406
	STZ.w $0408
	STZ.w $040A
	STZ.w $040C
	STZ.w $040E
	STZ.w $0410
	STZ.w $0412
	STZ.w $0414
	STZ.w $0416
	STZ.w $0418
	STZ.w $041A
	STZ.w $041C
	STZ.w $041E
	LDX.w $11E2
	LDA.w DATA_14AC59,x
	STA.b $25
	JSR.w CODE_1386F1
	LDA.b $1D
	BIT.w #$0001
	BNE.b CODE_1387F5
	LDY.w #$0000
	LDX.w #$0620
	JSR.w CODE_138842
CODE_1387F5:
	LDA.w $1216
	BEQ.b CODE_138806
	LDA.w $1222
	PHA
	JSR.w CODE_139F9C
	PLA
	INC
	STA.w $1222
CODE_138806:
	LDY.w #$0026
CODE_138809:
	LDX.w DATA_148000,y
	LDA.b $00,x
	BPL.b CODE_138817
	STY.b $5B
	JSR.w CODE_13886F
	LDY.b $5B
CODE_138817:
	DEY
	DEY
	BNE.b CODE_138809
	LDA.b $1D
	BIT.w #$0001
	BEQ.b CODE_13882B
	LDY.w #$0000
	LDX.w #$0620
	JSR.w CODE_138842
CODE_13882B:
	LDX.b $6A
	CPX.w #$0200
	BEQ.b CODE_138841
	LDA.w #$E020
CODE_138835:
	STA.w $0200,x
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_138835
CODE_138841:
	RTS

CODE_138842:
	LDA.b $10,x
	SEC
	SBC.b $74
	STA.b $5F
	LDA.b $12,x
	SEC
	SBC.b $76
	STA.b $65
	LDA.b $14,x
	STA.b $67
	LDA.w $11E2
	CMP.w #$0006
	BEQ.b CODE_138864
	JSR.w CODE_13C91F
	LDY.b $16,x
	JMP.w CODE_1388A1

CODE_138864:
	JSR.w CODE_13C954
	LDY.b $16,x
	LDA.w DATA_14B07E,y
	BRA.b CODE_1388A4

CODE_13886E:
	RTS

CODE_13886F:
	LDA.b $0C,x
	BIT.w #$4000
	BEQ.b CODE_138880
	LDA.b $10,x
	STA.b $5F
	LDA.b $12,x
	STA.b $65
	BRA.b CODE_138896

CODE_138880:
	BIT.w #$2000
	BEQ.b CODE_138888
	JMP.w ($0016,x)

CODE_138888:
	LDA.b $10,x
	SEC
	SBC.b $74
	STA.b $5F
	LDA.b $12,x
	SEC
	SBC.b $76
	STA.b $65
CODE_138896:
	JSR.w CODE_13C91F
	LDA.b $14,x
	STA.b $67
	LDY.b $16,x
	BEQ.b CODE_13886E
CODE_1388A1:
	LDA.w DATA_148B24,y
CODE_1388A4:
	STA.b $27
	LDY.w #$0000
	LDA.b ($27),y
	BIT.b $67
	BVC.b CODE_1388B3
	EOR.w #$FFFF
	INC
CODE_1388B3:
	CLC
	ADC.b $5F
	STA.b $5F
	INY
	INY
	LDA.b ($27),y
	CLC
	ADC.b $65
	STA.b $65
	INY
	INY
	LDX.b $6A
	CPX.w #$0200
	BCS.b CODE_13886E
	BIT.b $67
	BVC.b CODE_1388D5
	JMP.w CODE_138952

CODE_1388D1:
	INY
	INY
CODE_1388D3:
	INY
	INY
CODE_1388D5:
	LDA.b ($27),y
	BMI.b CODE_13894B
	INY
	INY
	XBA
	STA.b $69
	LDA.b ($27),y
	INY
	INY
	CLC
	ADC.b $5F
	CMP.w #$0100
	BCC.b CODE_1388F2
	CMP.w #$FFC0
	BCC.b CODE_1388D1
	ORA.w #$0100
CODE_1388F2:
	STA.b $61
	AND.w #$00FF
	STA.b $63
	LDA.b ($27),y
	INY
	INY
	CLC
	ADC.b $65
	CMP.w #$00E0
	BCC.b CODE_13890D
	CMP.w #$FFE0
	BCC.b CODE_1388D3
	AND.w #$00FF
CODE_13890D:
	XBA
	ORA.b $63
	STA.w $0200,x
	LDA.b ($27),y
	EOR.b $67
	STA.w $0202,x
	STX.b $6E
	STY.b $70
	SEP.b #$30
	LDX.b $6C
	LDY.w DATA_148128,x
	LDA.b $62
	BEQ.b CODE_13892C
	LDA.w DATA_1481A8,x
CODE_13892C:
	BIT.b $6A
	BPL.b CODE_138933
	ORA.w DATA_148228,x
CODE_138933:
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $6C
	REP.b #$30
	LDX.b $6E
	LDY.b $70
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BCC.b CODE_1388D3
CODE_13894B:
	STX.b $6A
	RTS

CODE_13894E:
	INY
	INY
CODE_138950:
	INY
	INY
CODE_138952:
	LDA.b ($27),y
	BMI.b CODE_13894B
	INY
	INY
	XBA
	STA.b $69
	LDA.b ($27),y
	INY
	INY
	EOR.w #$FFFF
	SEC
	SBC.w #$0008
	BIT.b $69
	BPL.b CODE_13896E
	SEC
	SBC.w #$0008
CODE_13896E:
	CLC
	ADC.b $5F
	CMP.w #$0100
	BCC.b CODE_13897E
	CMP.w #$FFC0
	BCC.b CODE_13894E
	ORA.w #$0100
CODE_13897E:
	STA.b $61
	AND.w #$00FF
	STA.b $63
	LDA.b ($27),y
	INY
	INY
	CLC
	ADC.b $65
	CMP.w #$00E0
	BCC.b CODE_138999
	CMP.w #$FFE0
	BCC.b CODE_138950
	AND.w #$00FF
CODE_138999:
	XBA
	ORA.b $63
	STA.w $0200,x
	LDA.b ($27),y
	EOR.b $67
	STA.w $0202,x
	STX.b $6E
	STY.b $70
	SEP.b #$30
	LDX.b $6C
	LDY.w DATA_148128,x
	LDA.b $62
	BEQ.b CODE_1389B8
	LDA.w DATA_1481A8,x
CODE_1389B8:
	BIT.b $6A
	BPL.b CODE_1389BF
	ORA.w DATA_148228,x
CODE_1389BF:
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $6C
	REP.b #$30
	LDX.b $6E
	LDY.b $70
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BCS.b CODE_1389DA
	JMP.w CODE_138950

CODE_1389DA:
	STX.b $6A
	RTS

CODE_1389DD:
	SEP.b #$20
	LDA.b #$19
	STA.w $2105
	LDA.b #$75
	STA.w $2108
	BRA.b CODE_138A00

CODE_1389EB:
	LDX.w #DATA_14AB0B
	JSR.w CODE_139B6D
	JSR.w CODE_13DB00
CODE_1389F4:
	SEP.b #$20
	LDA.b #$39
	STA.w $2105
	LDA.b #$74
	STA.w $2108
CODE_138A00:
	STZ.w $2106
	LDA.b #$70
	STA.w $2107
	LDA.b #$7C
	STA.w $2109
	LDA.b #$70
	STA.w $210A
	LDA.b #$22
	STA.w $210B
	LDA.b #$06
	STA.w $210C
	LDA.b #$00
	STA.w $2101
	LDA.b #$17
	STA.w $212C
	LDA.b #$03
	STA.w $212D
	STZ.w $212E
	STZ.w $212F
	REP.b #$20
	RTS

CODE_138A34:
	LDY.w $11E2
	LDX.w DATA_14AC49,y
	JSR.w CODE_139B6D
	LDX.w $11E2
	JSR.w (DATA_138A4D,x)
	LDA.w #$0004
	STA.w $11B8
	JSR.w CODE_138D1A
	RTS

DATA_138A4D:
	dw CODE_1389DD
	dw CODE_1389EB
	dw CODE_1389F4
	dw CODE_1389F4

CODE_138A55:
	JSR.w CODE_1393BB
	JSR.w CODE_1393F8
	RTS

CODE_138A5C:
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	CMP.w #$001A
	BCS.b CODE_138A90
	LDA.b $02
	AND.w #$0008
	BNE.b CODE_138A76
	LDA.w $119C
	ORA.w #$0002
	STA.w $119C
	BRA.b CODE_138A90

CODE_138A76:
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	PHA
	STZ.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	JSR.w CODE_138BBE
	PLA
	STA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	LDA.w $119C
	AND.w #$FFFD
	ORA.w #$8000
	STA.w $119C
CODE_138A90:
	LDA.w $119C
	BEQ.b CODE_138A9C
	LDA.b $04
	ORA.w #$0800
	STA.b $04
CODE_138A9C:
	LSR.w $119C
	BCC.b CODE_138AA4
	JSR.w CODE_138B90
CODE_138AA4:
	LSR.w $119C
	BCC.b CODE_138AAC
	JSR.w CODE_138BBE
CODE_138AAC:
	LSR.w $119C
	BCC.b CODE_138AB4
	JSR.w CODE_138BB5
CODE_138AB4:
	LSR.w $119C
	BCC.b CODE_138AC2
	LDX.w #$00F0
	LDA.w $11A2
	JSR.w CODE_138B61
CODE_138AC2:
	LSR.w $119C
	BCC.b CODE_138AD0
	LDX.w #$00E6
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	JSR.w CODE_138B61
CODE_138AD0:
	LSR.w $119C
	BCC.b CODE_138ADE
	LDX.w #$00FA
	LDA.w !RAM_SXAR_Gambit_CurrentStarCountLo
	JSR.w CODE_138B61
CODE_138ADE:
	STZ.w $119C
	RTS

CODE_138AE2:
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	CMP.w #$001A
	BCS.b CODE_138B1C
	LDA.b $02
	AND.w #$0008
	BNE.b CODE_138AFC
	LDA.w $119C
	ORA.w #$0002
	STA.w $119C
	BRA.b CODE_138B1C

CODE_138AFC:
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	PHA
	STZ.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	LDX.w #$0104
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	JSR.w CODE_138BC4
	PLA
	STA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	LDA.w $119C
	AND.w #$FFFD
	ORA.w #$8000
	STA.w $119C
CODE_138B1C:
	LDA.w $119C
	BEQ.b CODE_138B28
	LDA.b $04
	ORA.w #$0800
	STA.b $04
CODE_138B28:
	LSR.w $119C
	BCC.b CODE_138B30
	JSR.w CODE_138B90
CODE_138B30:
	LSR.w $119C
	BCC.b CODE_138B3E
	LDX.w #$0104
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	JSR.w CODE_138BC4
CODE_138B3E:
	LSR.w $119C
	LSR.w $119C
	BCC.b CODE_138B4F
	LDX.w #$00F4
	LDA.w $11A2
	JSR.w CODE_138B61
CODE_138B4F:
	LSR.w $119C
	BCC.b CODE_138B5D
	LDX.w #$00E8
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
	JSR.w CODE_138B61
CODE_138B5D:
	STZ.w $119C
	RTS

CODE_138B61:
	SEP.b #$20
	LDY.w #$0000
CODE_138B66:
	CMP.b #$0A
	BCC.b CODE_138B6F
	INY
	SBC.b #$0A
	BCS.b CODE_138B66
CODE_138B6F:
	PHA
	TYA
	BEQ.b CODE_138B81
	INC
	STA.l $7E2380,x
	PLA
	INC
	STA.l $7E2382,x
	REP.b #$20
	RTS

CODE_138B81:
	PLA
	INC
	STA.l $7E2380,x
	LDA.b #$00
	STA.l $7E2382,x
	REP.b #$20
	RTS

CODE_138B90:
	LDX.w #$0000
	LDY.w #$0000
	STZ.b $25
	SEP.b #$20
CODE_138B9A:
	LDA.w $0110,y
	BNE.b CODE_138BA3
	BIT.b $25
	BPL.b CODE_138BAA
CODE_138BA3:
	DEC.b $25
	INC
	STA.l $7E2450,x
CODE_138BAA:
	INY
	INX
	INX
	CPY.w #$0007
	BNE.b CODE_138B9A
	REP.b #$20
	RTS

CODE_138BB5:
	LDX.w #$0164
	LDA.w $11A0
	ASL
	BRA.b CODE_138BC4

CODE_138BBE:
	LDX.w #$0144
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
CODE_138BC4:
	STA.b $27
	LDY.w #$000D
	STY.b $25
	LSR
	LSR
	LSR
	TAY
	SEP.b #$20
	BEQ.b CODE_138BE4
	LDA.b #$31
CODE_138BD5:
	STA.l $7E2380,x
	INX
	INX
	DEC.b $25
	DEY
	BNE.b CODE_138BD5
	LDA.b $25
	BEQ.b CODE_138C01
CODE_138BE4:
	LDA.b $27
	AND.b #$07
	CLC
	ADC.b #$29
	STA.l $7E2380,x
	INX
	INX
	LDY.b $25
	DEY
	BEQ.b CODE_138C01
	LDA.b #$29
CODE_138BF8:
	STA.l $7E2380,x
	INX
	INX
	DEY
	BNE.b CODE_138BF8
CODE_138C01:
	REP.b #$20
	RTS

CODE_138C04:
	LDA.w #$0001
	ORA.w $119C
	STA.w $119C
	PHX
	SEP.b #$20
	LDX.w #$0006
	CLC
CODE_138C14:
	LDA.w $0110,x
	ADC.w $0000,y
	CMP.b #$0A
	BCC.b CODE_138C20
	SBC.b #$0A
CODE_138C20:
	STA.w $0110,x
	DEY
	DEX
	BPL.b CODE_138C14
	REP.b #$20
	PLX
	RTS

CODE_138C2B:
	CMP.w #$8000
	BCC.b CODE_138C45
	PHY
	LDY.w $11F4
	BNE.b CODE_138C8D
	LDY.w #$0008
	CMP.w #$FFEC
	BCS.b CODE_138C41
	LDY.w #$0046
CODE_138C41:
	STY.w $11F4
	PLY
CODE_138C45:
	CLC
	ADC.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	BEQ.b CODE_138C4D
	BPL.b CODE_138C78
CODE_138C4D:
	PHX
	LDX.w #$0620
	LDA.w #CODE_13A4EA
	CMP.b $00,x
	BEQ.b CODE_138C74
	STA.b $00,x
	LDY.b $0E,x
	LDA.w DATA_14898E,y
	JSR.w CODE_1383E4
	LDY.w $11E2
	LDA.w DATA_14AC61,y
	JSR.w CODE_13A43F
	TYA
	BNE.b CODE_138C74
	LDA.w #$01F4
	STA.w $11F8
CODE_138C74:
	PLX
	LDA.w #$0000
CODE_138C78:
	CMP.w #$0069
	BCC.b CODE_138C80
	LDA.w #$0068
CODE_138C80:
	STA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	LDA.w #$0002
	ORA.w $119C
	STA.w $119C
	RTS

CODE_138C8D:
	PLA
	RTS

CODE_138C8F:
	CLC
	ADC.w $11A0
	BPL.b CODE_138C98
	LDA.w #$0000
CODE_138C98:
	CMP.w #$0035
	BCC.b CODE_138CA0
	LDA.w #$0034
CODE_138CA0:
	STA.w $11A0
	LDA.w #$0004
	ORA.w $119C
	STA.w $119C
	RTS

CODE_138CAD:
	LDX.w #$7400
	STX.w $2116
	LDA.w #$0000
	LDX.w #$0800
CODE_138CB9:
	STA.w $2118
	DEX
	BNE.b CODE_138CB9
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #DATA_14C2F0>>16
	STA.w $4314
	LDA.b #$18
	STA.b $27
	LDX.w #$7806
	LDY.w #DATA_14C2F0
CODE_138CDF:
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0030
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0030
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	DEC.b $27
	BNE.b CODE_138CDF
	REP.b #$20
	LDA.b $04
	AND.w #$DFFF
	STA.b $04
	LDX.w #$FFE0
	LDY.w #$FFEC
	STX.w $11B6
	STY.w $11BC
	RTS

CODE_138D1A:
	STZ.b $72
	JSR.w CODE_138D30
	JSR.w CODE_138E80
	LDA.w $11E2
	BEQ.b CODE_138D2D
	JSR.w CODE_138D30
	JMP.w CODE_1390FD

CODE_138D2D:
	JMP.w CODE_138CAD

CODE_138D30:
	LDX.w $11E2
	JMP.w (DATA_138D36,x)

DATA_138D36:
	dw CODE_138D3E
	dw CODE_138D67
	dw CODE_138D8B
	dw CODE_138D8B

CODE_138D3E:
	LDA.b $78
	SEC
	SBC.b $74
	STA.b $7C
	LDA.b $74
	STA.b $78
	LDA.w $11B4
	SEC
	SBC.b $7C
	STA.w $11B4
	LDA.w $11B6
	SEC
	SBC.b $7C
	STA.w $11B6
	LDA.b $72
	BEQ.b CODE_138DB3
	LDA.b $04
	ORA.w #$2000
	STA.b $04
	RTS

CODE_138D67:
	LDA.b $78
	SEC
	SBC.b $76
	STA.b $7C
	LDA.b $76
	STA.b $78
	LDA.w $11BA
	SEC
	SBC.b $7C
	STA.w $11BA
	LSR.b $7C
	LDA.w $11BC
	SEC
	SBC.b $7C
	STA.w $11BC
	LDX.b $72
	JMP.w (DATA_138DAF,x)

CODE_138D8B:
	LDA.b $78
	SEC
	SBC.b $74
	STA.b $7C
	LDA.b $74
	STA.b $78
	LDA.w $11B4
	SEC
	SBC.b $7C
	STA.w $11B4
	LSR.b $7C
	LDA.w $11B6
	SEC
	SBC.b $7C
	STA.w $11B6
	LDX.b $72
	JMP.w (DATA_138DAF,x)

DATA_138DAF:
	dw CODE_138DB3
	dw CODE_138DC7

CODE_138DB3:
	LDX.b $74
	LDY.b $76
	JSR.w CODE_138DE5
	CLC
	ADC.b $86
	STA.b $7A
	STX.w $11B4
	STY.w $11BA
	BRA.b CODE_138DDD

CODE_138DC7:
	LDA.b $74
	LSR
	TAX
	LDA.b $76
	LSR
	TAY
	JSR.w CODE_138DE5
	CLC
	ADC.b $8A
	STA.b $7A
	STX.w $11B6
	STY.w $11BC
CODE_138DDD:
	LDA.b $04
	ORA.w #$2000
	STA.b $04
	RTS

CODE_138DE5:
	STX.b $27
	STY.b $29
	LDA.w #$0020
	STA.b $2B
	STA.b $2D
	LDA.b $29
	SEC
	SBC.w #$0020
	BCS.b CODE_138DFC
	LDA.b $29
	STZ.b $2D
CODE_138DFC:
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.w $11D4
	CPX.w #$0100
	BCS.b CODE_138E0C
	PHX
	TAX
	PLA
CODE_138E0C:
	SEP.b #$20
	STA.w $211B
	XBA
	STA.w $211B
	TXA
	STA.w $211C
	STA.w $211C
	REP.b #$20
	LDA.b $27
	SEC
	SBC.w #$0020
	BCS.b CODE_138E2A
	LDA.b $27
	STZ.b $2B
CODE_138E2A:
	LSR
	LSR
	LSR
	AND.w #$FFFE
	CLC
	ADC.w $2134
	PHA
	LDA.b $27
	AND.w #$000F
	ORA.b $2B
	TAX
	LDA.b $29
	AND.w #$000F
	ORA.b $2D
	TAY
	PLA
	RTS

CODE_138E47:
	STX.b $27
	STY.b $29
	LDA.w #$0020
	STA.b $2B
	STA.b $2D
	LDA.b $29
	SEC
	SBC.w #$0020
	BCS.b CODE_138E5E
	LDA.b $29
	STZ.b $2D
CODE_138E5E:
	LDA.b $27
	SEC
	SBC.w #$0020
	BCS.b CODE_138E6A
	LDA.b $27
	STZ.b $2B
CODE_138E6A:
	LDA.b $27
	AND.w #$000F
	ORA.b $2B
	TAX
	LDA.b $29
	AND.w #$000F
	ORA.b $2D
	TAY
	RTS

CODE_138E7B:
	LDX.b $72
	JMP.w ($000F,x)

CODE_138E80:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7F
	STA.w $4314
	LDX.w #$7000
	LDY.b $7A
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $11D4
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
CODE_1390ED:
	LDA.b $72
	CLC
	ADC.b #$02
	CMP.b $23
	BCC.b CODE_1390F8
	LDA.b #$00
CODE_1390F8:
	STA.b $72
	REP.b #$20
	RTS

CODE_1390FD:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7F
	STA.w $4314
	LDX.w #$7400
	LDY.b $7A
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.b $92
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	JMP.w CODE_1390ED

CODE_13935B:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7E
	STA.w $4314
	LDX.w #$7C00
	LDY.w #$2380
	STX.w $2116
	STY.w $4312
	LDX.w #$0800
	STX.w $4315
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	RTS

CODE_13938B:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7E
	STA.w $4314
	LDX.w #$7400
	LDY.w #$2B80
	STX.w $2116
	STY.w $4312
	LDX.w #$0800
	STX.w $4315
	LDA.b #$02
	STA.w $420B
	JMP.w CODE_1390ED

CODE_1393BB:
	LDA.w $0636
	SEC
	SBC.w #$0002
	TAY
	LDA.w DATA_1482A8,y
	CLC
	ADC.w #$3580
	STA.w $11E4
	CLC
	ADC.w #$0200
	STA.w $11E6
	CLC
	ADC.w #$0200
	STA.w $11E8
	CLC
	ADC.w #$0200
	STA.w $11EA
	CLC
	ADC.w #$0200
	STA.w $11EC
	CLC
	ADC.w #$0200
	STA.w $11EE
	LDA.b $04
	ORA.w #$4000
	STA.b $04
	RTS

CODE_1393F8:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7E
	STA.w $4314
	LDA.b #$02
	LDX.w #$0000
	STX.w $2116
	LDY.w $11E4
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	LDX.w #$0100
	STX.w $2116
	LDY.w $11E6
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	LDX.w #$0200
	STX.w $2116
	LDY.w $11E8
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	LDX.w #$0300
	STX.w $2116
	LDY.w $11EA
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	LDX.w #$0040
	STX.w $2116
	LDY.w $11EC
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	LDX.w #$0140
	STX.w $2116
	LDY.w $11EE
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	REP.b #$20
	RTS

CODE_139491:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b $17
	STA.w $4314
	LDX.b $19
	LDY.b $15
	STX.w $2116
	STY.w $4312
	LDX.b $1B
	STX.w $4315
	LDA.b #$02
	STA.w $420B
	REP.b #$20
CODE_1394BD:
	RTS

CODE_1394BE:
	LDA.b $1D
	BIT.w #$2000
	BEQ.b CODE_1394C8
	JMP.w CODE_139575

CODE_1394C8:
	BIT.w #$8000
	BNE.b CODE_1394E4
	LDA.w $0630
	SEC
	SBC.w $11FA
	BMI.b CODE_1394DB
	CMP.w #$00A0
	BCS.b CODE_1394E2
CODE_1394DB:
	LDA.w #$8000
	ORA.b $1D
	STA.b $1D
CODE_1394E2:
	LDA.b $1D
CODE_1394E4:
	LDA.b $74
	CMP.w #$1640
	BCC.b CODE_1394BD
	SEP.b #$20
	LDA.b #$74
	STA.w $2108
	LDA.b #$39
	STA.w $2105
	REP.b #$20
	LDA.w #$0100
	STA.w $11BC
	LDA.w #$00F8
	STA.w $11FE
	LDA.w #$1640
	STA.w $11FA
	LDA.w #$0008
	STA.b $45
	LDA.w #$0004
	STA.b $23
	LDX.w #$01FF
	LDA.b $74
	CLC
	ADC.w #$0030
	SEC
	SBC.w $11FA
	CMP.w #$0100
	BCS.b CODE_13952B
	ORA.w #$0100
	TAX
CODE_13952B:
	STX.w $11F6
	STX.w $11B6
	LDX.w #$001E
CODE_139534:
	LDA.w $0440,x
	STA.w $1C32,x
	STZ.w $0480,x
	DEX
	DEX
	BPL.b CODE_139534
	LDA.w #$000E
	STA.w $1C52
	LDA.w #$007E
	STA.b $17
	LDA.w #$B180
	STA.b $15
	LDA.w #$3C00
	STA.b $19
	LDA.w #$07C0
	STA.b $1B
	LDA.w #CODE_139491
	STA.b $06
	LDA.b $04
	ORA.w #$1400
	STA.b $04
	LDA.w #$3502
	JSR.w CODE_13A43F
	LDA.w #$2000
	ORA.b $1D
	STA.b $1D
	RTS

CODE_139575:
	BIT.w #$1000
	BNE.b CODE_1395F7
	LDA.w #$0100
	SEC
	SBC.w $11BC
	CMP.w $0632
	BCC.b CODE_139599
	LDA.w $0630
	CMP.w #$16BE
	BCC.b CODE_139599
	CMP.w #$171C
	BCS.b CODE_139599
	LDA.w #$FFF1
	JSR.w CODE_138C45
CODE_139599:
	LDA.w $11FE
	BEQ.b CODE_1395F6
	LDA.w $11BC
	DEC
	AND.w #$01FF
	STA.w $11BC
	DEC.w $11FE
	BNE.b CODE_1395F6
	LDA.w #$0202
	JSR.w CODE_13A43F
	LDA.w #$0170
	STA.b $25
	LDA.w #$0005
	STA.b $27
	LDA.w #$05C8
	STA.b $29
	LDA.w #$8000
	STA.b $2B
	JSR.w CODE_139650
	INC.b $27
	JSR.w CODE_139650
	INC.b $27
	JSR.w CODE_139650
	INC.b $27
	JSR.w CODE_139650
	INC.b $27
	JSR.w CODE_139650
	LDA.w #$A580
	STA.b $13
	LDA.w #CODE_13968E
	STA.b $06
	LDA.w #$1000
	ORA.b $1D
	STA.b $1D
	LDA.w #$0400
	ORA.b $04
	STA.b $04
CODE_1395F6:
	RTS

CODE_1395F7:
	BIT.w #$0800
	BNE.b CODE_13964C
	LDA.b $04
	BIT.w #$0400
	BNE.b CODE_1395F6
	LDY.w $11FE
	CPY.w #$0030
	BCS.b CODE_13961F
	ORA.w #$0400
	STA.b $04
	LDA.b $1D
	BIT.w #$0400
	BEQ.b CODE_1395F6
	LDA.w #CODE_13968E
	STA.b $06
	JMP.w CODE_13A2EA

CODE_13961F:
	LDA.b $1D
	ORA.w #$0800
	STA.b $1D
	BIT.w #$0400
	BNE.b CODE_13964C
	LDX.w #$064A
	JSR.w CODE_138535
	LDA.w #DATA_14945A
	JSR.w CODE_1383E4
	LDA.w #$0038
	STA.b $08,x
	LDA.w #CODE_13BA6B
	STA.b $00,x
	LDA.w #$17F8
	STA.b $10,x
	LDA.w #$005F
	STA.b $12,x
	RTS

CODE_13964C:
	JSR.w CODE_13A2EA
	RTS

CODE_139650:
	LDA.b $27
	LDX.w $11D4
	CMP.w $11D4
	BCC.b CODE_13965D
	TAY
	TXA
	TYX
CODE_13965D:
	TAY
	JSR.w CODE_139B48
	STA.b $2D
	LDA.b $25
	ASL
	STA.b $2F
	ADC.b $2D
	TAY
	LDA.b $29
	STA.b [$86],y
	LDA.b $2D
	ASL
	ASL
	ADC.b $2F
	ADC.b $2F
	TAY
	LDA.b $2B
	STA.b [$8E],y
	INY
	INY
	STA.b [$8E],y
	TYA
	CLC
	ADC.b $82
	TAY
	LDA.b $2B
	STA.b [$8E],y
	DEY
	DEY
	STA.b [$8E],y
	RTS

CODE_13968E:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7E
	STA.w $4314
	REP.b #$20
	LDY.w $11FE
	LDX.w DATA_14CB30,y
	LDY.b $13
	TYA
	CLC
	ADC.w #$0080
	STA.b $13
	STX.w $2116
	STY.w $4312
	LDA.w #$0040
	STA.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	TXA
	CLC
	ADC.w #$0100
	STA.w $2116
	TYA
	CLC
	ADC.w #$0040
	STA.w $4312
	LDA.w #$0040
	STA.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	CLC
	ADC.w $11FE
	STA.w $11FE
	REP.b #$20
	RTS

CODE_1396F1:
	LDA.b $1D
	AND.w #$2000
	BNE.b CODE_139734
	JSR.w CODE_139DF6
	JSR.w CODE_139DC9
	LDX.w #$01FF
	LDA.b $74
	CLC
	ADC.w #$0030
	SEC
	SBC.w $11FA
	CMP.w #$0100
	BCS.b CODE_139714
	ORA.w #$0100
	TAX
CODE_139714:
	STX.w $11F6
	STX.w $11B6
	LDA.w $11FA
	BMI.b CODE_139724
	CMP.w #$155A
	BCS.b CODE_139734
CODE_139724:
	LDA.w $11F8
	BEQ.b CODE_13972E
	DEC.w $11F8
	BNE.b CODE_139734
CODE_13972E:
	LDX.w $11FC
	JSR.w (DATA_139738,x)
CODE_139734:
	JSR.w CODE_1394BE
	RTS

DATA_139738:
	dw CODE_139740
	dw CODE_139776
	dw CODE_139790
	dw CODE_1397BA

CODE_139740:
	LDA.w $11FA
	CMP.w #$FFA0
	BCS.b CODE_139750
	INC.w $11FA
	LDA.w #$FFFF
	BRA.b CODE_13975C

CODE_139750:
	LDA.w $11FE
	CMP.w #$0080
	BCS.b CODE_139765
	INC.w $11FE
	RTS

CODE_13975C:
	CLC
	ADC.b $45
	AND.w #$01FF
	STA.b $45
	RTS

CODE_139765:
	LDA.w #$0002
	CLC
	ADC.w $11FC
	STA.w $11FC
	LDA.w #$0100
	STA.w $11FE
	RTS

CODE_139776:
	LDA.w $11FA
	INC
	STA.w $11FA
	DEC.w $11FE
	BNE.b CODE_13978B
	JSR.w CODE_139765
	LDA.w #$001F
	STA.w $1200
CODE_13978B:
	LDA.w #$FFFF
	BRA.b CODE_13975C

CODE_139790:
	LDA.w $11FA
	INC
	STA.w $11FA
	LDX.w #$FFFF
	AND.w $1200
	BNE.b CODE_1397A3
	INC.w $11FA
	DEX
CODE_1397A3:
	DEC.w $11FE
	BNE.b CODE_1397B7
	LDA.w #$01F4
	STA.w $11FE
	LDA.w $1200
	LSR
	BEQ.b CODE_1397B7
	STA.w $1200
CODE_1397B7:
	TXA
	BRA.b CODE_13975C

CODE_1397BA:
	DEC.w $11FE
	BNE.b CODE_1397D1
	LDA.w #$FFFF
	STA.w $1202
	LDA.w #$0002
	STA.w $11FC
	LDA.w #$0100
	STA.w $11FE
CODE_1397D1:
	DEC.w $11FA
	LDA.w #$0001
	BRA.b CODE_13975C

CODE_1397D9:
	LDA.w #$0006
	STA.w $11FC
	LDA.w #$0190
	STA.w $11FE
	LDA.w #$03E0
	STA.w $1202
	RTS

CODE_1397EC:
	LDA.b $1D
	BIT.w #$0800
	BEQ.b CODE_139819
	LDX.w $1212
	LDY.w $1214
	LDA.w #$0015
	STA.b $25
CODE_1397FE:
	LDA.b $00,x
	PHA
	LDA.w $0000,y
	STA.b $00,x
	PLA
	STA.w $0000,y
	INX
	INX
	INY
	INY
	DEC.b $25
	BNE.b CODE_1397FE
	LDA.b $1D
	AND.w #$F7FF
	STA.b $1D
CODE_139819:
	BIT.w #$2000
	BNE.b CODE_139858
	LDY.b $76
	CPY.w #$00C0
	BCS.b CODE_139857
	BIT.w #$1000
	BNE.b CODE_139859
	LDA.w #$1000
	ORA.b $1D
	STA.b $1D
	LDA.w #$007E
	STA.b $17
	LDA.w #$A580
	STA.b $15
	LDA.w #$0000
	STA.b $19
	LDA.w #$04E0
	STA.b $1B
	LDA.w #CODE_139491
	STA.b $06
	LDA.b $04
	ORA.w #$4400
	STA.b $04
	LDA.w #$0007
	STA.w $120E
CODE_139857:
	RTS

CODE_139858:
	RTS

CODE_139859:
	LDA.w #$04E0
	STA.b $1B
	CLC
	ADC.b $15
	STA.b $15
	LDA.w #$0270
	CLC
	ADC.b $19
	STA.b $19
	LDA.w #CODE_139491
	STA.b $06
	LDA.b $04
	ORA.w #$4400
	STA.b $04
	DEC.w $120E
	BNE.b CODE_139883
	LDA.w #$2000
	ORA.b $1D
	STA.b $1D
CODE_139883:
	RTS

CODE_139884:
	LDA.w #DATA_148A8C
	LDY.w #$0040
	BRA.b CODE_139892

CODE_13988C:
	LDA.w #DATA_148A6C
	LDY.w #$00D0
CODE_139892:
	STA.b $25
	STY.b $27
	LDX.w #$0620
	LDA.b $10,x
	CMP.w #$0028
	BCS.b CODE_1398C0
	LDA.b $0E,x
	BEQ.b CODE_1398A9
	CMP.w #$0008
	BNE.b CODE_1398C0
CODE_1398A9:
	LDA.w #CODE_13A661
	CMP.b $00,x
	BEQ.b CODE_1398C0
	STA.b $00,x
	LDA.b $25
	JSR.w CODE_1383E4
	LDA.w #$0026
	STA.b $10,x
	LDA.b $27
	STA.b $12,x
CODE_1398C0:
	RTS

CODE_1398C1:
	LDA.w #$008C
	STA.b $5F
	LDA.w #$0010
	STA.b $65
	LDA.w $11A8
	JSR.w CODE_139A71
	LDA.w #$00B0
	STA.b $5F
	LDA.w #$000C
	STA.b $65
	LDA.w #$398C
	JSR.w CODE_139A71
	LDA.w #$00C0
	STA.b $5F
	LDA.w #$000C
	STA.b $65
	LDA.w #$398E
	JSR.w CODE_139A71
	LDA.w #$00B0
	STA.b $5F
	LDA.w #$001C
	STA.b $65
	LDA.w #$39AC
	JSR.w CODE_139A71
	LDA.w #$00C0
	STA.b $5F
	LDA.w #$001C
	STA.b $65
	LDA.w #$39AE
	JSR.w CODE_139A71
	RTS

CODE_139912:
	JSR.w CODE_13A3D0
	DEC.w $11FE
	BNE.b CODE_139931
	LDA.w $1200
	STA.w $11FE
	LDA.b $76
	BEQ.b CODE_139926
	DEC.b $76
CODE_139926:
	LDA.w $11FA
	CMP.w #$00B1
	BCC.b CODE_139956
	DEC.w $11FA
CODE_139931:
	LDX.w #$00EC
	LDA.w $11FA
	SEC
	SBC.b $76
	SEC
	SBC.w #$00B0
	BCC.b CODE_13994E
	CMP.w #$0030
	BCS.b CODE_13994E
	EOR.w #$FFFF
	INC
	CLC
	ADC.w #$010F
	TAX
CODE_13994E:
	STX.w $11F8
	LDA.b $76
	BEQ.b CODE_139956
	RTS

CODE_139956:
	STZ.b $72
	LDX.b $74
	LDY.b $76
	JSR.w CODE_138DE5
	CLC
	ADC.b $86
	STA.b $7A
	STX.w $11B4
	STY.w $11BA
	JMP.w CODE_138DDD

CODE_13996D:
	LDX.w #$0000
CODE_139970:
	PHX
	TXA
	LSR
	LDY.w #$0063
	JSR.w CODE_139ADD
	PLX
	STA.w $1650,x
	PHX
	TXA
	LSR
	LDY.w #$0061
	JSR.w CODE_139AD6
	PLX
	STA.w $1850,x
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_139970
	LDX.w #$01E0
CODE_139994:
	STZ.w $1A4E,x
	DEX
	DEX
	BNE.b CODE_139994
	LDA.w #$0070
	STA.b $25
	LDA.w $1850,x
	CLC
	ADC.b $25
	STA.b $27
	LDA.w $1650,x
	STA.b $2B
	INX
	INX
CODE_1399AF:
	LDA.w $1850,x
	CLC
	ADC.b $25
	CMP.b $27
	PHP
	LDY.b $27
	STA.b $27
	ASL
	STA.b $29
	TYA
	ASL
	TAY
	LDA.b $2B
CODE_1399C4:
	STA.w $1A50,y
	DEY
	DEY
	CPY.b $29
	BCS.b CODE_1399C4
	LDA.w $1650,x
	STA.b $2B
	INX
	INX
	PLP
	BEQ.b CODE_1399AF
	BCC.b CODE_1399AF
CODE_1399D9:
	RTS

CODE_1399DA:
	JSR.w CODE_139AC6
	LDA.b $1D
	AND.w #$2000
	BNE.b CODE_1399D9
	LDA.w $11FA
	CLC
	ADC.w #$0056
	SEC
	SBC.b $74
	STA.b $27
	LDA.w #$006A
	STA.b $29
	LDA.w $0630
	SEC
	SBC.w #$000C
	SEC
	SBC.b $74
	STA.b $2B
	LDA.w $0632
	SEC
	SBC.w #$000C
	SEC
	SBC.b $76
	STA.b $2D
	LDA.b $45
	LSR
	TAX
	LDY.w #$0020
CODE_139A14:
	PHY
	TXA
	ASL
	TAY
	LDA.w $1850,y
	CLC
	ADC.b $29
	STA.b $65
	LDA.w $1650,y
	CLC
	ADC.b $27
	STA.b $5F
	BMI.b CODE_139A56
	LDA.b $2D
	SEC
	SBC.b $65
	CMP.w #$0028
	BCS.b CODE_139A56
	LDA.b $2B
	SEC
	SBC.b $5F
	BCC.b CODE_139A40
	CMP.w #$0014
	BCS.b CODE_139A56
CODE_139A40:
	LDA.w $11FA
	BMI.b CODE_139A56
	LDA.w $11F4
	BNE.b CODE_139A50
	LDA.w #$0008
	STA.w $11F4
CODE_139A50:
	LDA.w #$FFFE
	JSR.w CODE_138C45
CODE_139A56:
	TXA
	AND.w #$00FE
	TAY
	LDA.w DATA_14CB60,y
	PHX
	JSR.w CODE_139A71
	PLX
	PLY
	TXA
	CLC
	ADC.w #$0008
	AND.w #$00FF
	TAX
	DEY
	BNE.b CODE_139A14
	RTS

CODE_139A71:
	LDX.b $6A
	CPX.w #$0200
	BCS.b CODE_139AC5
	STA.w $0202,x
	LDA.b $5F
	CMP.w #$0100
	BCC.b CODE_139A87
	CMP.w #$FFF0
	BCC.b CODE_139AC5
CODE_139A87:
	STA.b $61
	AND.w #$00FF
	STA.b $63
	LDA.b $65
	CMP.w #$00E0
	BCC.b CODE_139A9D
	CMP.w #$FFF0
	BCC.b CODE_139AC5
	AND.w #$00FF
CODE_139A9D:
	XBA
	ORA.b $63
	STA.w $0200,x
	INX
	INX
	INX
	INX
	STX.b $6A
	SEP.b #$30
	LDX.b $6C
	LDY.w DATA_148128,x
	LDA.b $62
	BEQ.b CODE_139AB7
	LDA.w DATA_1481A8,x
CODE_139AB7:
	ORA.w DATA_148228,x
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $6C
	REP.b #$30
CODE_139AC5:
	RTS

CODE_139AC6:
	LDA.w #$0084
	STA.b $5F
	LDA.w #$0010
	STA.b $65
	LDA.w $11A8
	JMP.w CODE_139A71

CODE_139AD6:
	SEP.b #$30
	EOR.b #$FF
	SEC
	ADC.b #$40
CODE_139ADD:
	SEP.b #$30
	STY.b $41
	STA.b $42
	AND.b #$40
	BEQ.b CODE_139AE9
	LDA.b #$FF
CODE_139AE9:
	EOR.b $42
	AND.b #$3F
	TAX
	LDA.w DATA_14CC60,x
	TAX
	LDY.b $41
	JSR.w CODE_139B1C
	LDA.b $44
	BIT.b $42
	BPL.b CODE_139B0D
	EOR.b #$FF
	REP.b #$30
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_139B0C
	ORA.w #$FF00
CODE_139B0C:
	RTS

CODE_139B0D:
	INC
	REP.b #$30
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_139B1B
	ORA.w #$FF00
CODE_139B1B:
	RTS

CODE_139B1C:
	STX.w $4202
	STY.w $4203
	NOP #4
	LDA.w $4216
	STA.b $43
	LDA.w $4217
	STA.b $44
	RTS

CODE_139B31:
	SEP.b #$30
	STX.w $4202
	STY.w $4203
	NOP #4
	LDA.w $4216
	XBA
	LDA.w $4217
	XBA
	REP.b #$30
	RTS

CODE_139B48:
	TXA
	SEP.b #$20
	SEP.b #$20
	STA.w $211B
	XBA
	STA.w $211B
	TYA
	STA.w $211C
	STA.w $211C
	REP.b #$20
	LDA.w $2134
	RTS

ADDR_139B61:
	PLA
	INC
	TAX
	LDY.w #$0013
	JSR.w CODE_139B70
	JMP.w ($0096)

CODE_139B6D:
	LDY.w #DATA_14A9FC>>16
CODE_139B70:
	PHP
	STX.b $96
	LDA.w #$0000
	STA.b $9C
	STA.b $9E
	LDA.w #$7E2380
	STA.b $99
	LDA.w #$7E2380>>16
	STA.b $9B
	SEP.b #$30
	STY.b $98
CODE_139B88:
	LDA.b [$96]
	BMI.b CODE_139BC5
	JSR.w CODE_139CD2
	LDX.b #$20
	LDY.b $95
	JSR.w CODE_139B1C
	REP.b #$30
	LDA.b $94
	AND.w #$00FF
	CLC
	ADC.b $43
	ASL
	TAY
	LDA.b $9E
	BEQ.b CODE_139BAB
	STA.b $25
	JMP.w ($0025)

CODE_139BAB:
	LDA.b $A2
	STA.b [$99],y
	LDA.w #$0001
CODE_139BB2:
	INC.b $96
	SEP.b #$30
	CLC
	ADC.b $94
	CMP.b #$20
	BCC.b CODE_139BC1
	INC.b $95
	LDA.b #$00
CODE_139BC1:
	STA.b $94
	BRA.b CODE_139B88

CODE_139BC5:
	LDY.b #$01
	ASL
	TAX
	JSR.w (DATA_139BDC,x)
	JSR.w CODE_139BD1
	BRA.b CODE_139B88

CODE_139BD1:
	TYA
	CLC
	ADC.b $96
	STA.b $96
	BCC.b CODE_139BDB
	INC.b $97
CODE_139BDB:
	RTS

DATA_139BDC:
	dw CODE_139BF0
	dw CODE_139C00
	dw CODE_139C0B
	dw CODE_139C16
	dw CODE_139C21
	dw CODE_139C64
	dw CODE_139C80
	dw CODE_139C7B
	dw CODE_139C31
	dw CODE_139C3E

CODE_139BF0:
	PLA
	PLA
	JSR.w CODE_139BD1
	PLP
	REP.b #$20
	LDA.b $04
	ORA.w #$0800
	STA.b $04
	RTS

CODE_139C00:
	LDA.b [$96],y
	STA.b $94
	INY
	LDA.b [$96],y
	STA.b $95
	INY
	RTS

CODE_139C0B:
	LDA.b [$96],y
	STA.b $A0
	INY
	LDA.b [$96],y
	STA.b $A1
	INY
	RTS

CODE_139C16:
	LDA.b [$96],y
	STA.b $9C
	INY
	LDA.b [$96],y
	STA.b $9D
	INY
	RTS

CODE_139C21:
	LDA.b [$96],y
	STA.b $99
	INY
	LDA.b [$96],y
	STA.b $9A
	INY
	LDA.b [$96],y
	STA.b $9B
	INY
	RTS

CODE_139C31:
	LDA.b $84
	STA.b $99
	LDA.b $85
	STA.b $9A
	LDA.w #$857F
	TXY
	RTS

CODE_139C3E:
	REP.b #$20
	LDA.b [$96],y
	STA.b $29
	INY
	INY
	LDA.b [$96],y
	STA.b $2B
	INY
	INY
	PHY
	REP.b #$10
	LDA.b $99
	STA.b $25
	LDA.b $9B
	STA.b $27
	LDX.w #$0025
	JSR.w CODE_13D8F5
	JSR.w CODE_139E4B
	SEP.b #$30
	PLY
	RTS

CODE_139C64:
	PHY
	REP.b #$30
	LDA.b [$96],y
	LDY.w #$0000
CODE_139C6C:
	STA.b [$99],y
	INY
	INY
	CPY.w #$0780
	BNE.b CODE_139C6C
	SEP.b #$30
	PLY
	INY
	INY
	RTS

CODE_139C7B:
	STZ.b $9E
	STZ.b $9F
	RTS

CODE_139C80:
	REP.b #$20
	LDA.w #CODE_139C8A
	STA.b $9E
	SEP.b #$20
	RTS

CODE_139C8A:
	LDA.b $A2
	AND.w #$00FF
	BEQ.b CODE_139CB6
	DEC
	ASL
	ASL
	ADC.w #$0032
	ORA.b $A0
	STA.b [$99],y
	INC
	INY
	INY
	STA.b [$99],y
	INC
	PHA
	TYA
	CLC
	ADC.w #$003E
	TAY
	PLA
	STA.b [$99],y
	INC
	INY
	INY
	STA.b [$99],y
	LDA.w #$0002
	JMP.w CODE_139BB2

CODE_139CB6:
	LDA.b $A2
	STA.b [$99],y
	INY
	INY
	STA.b [$99],y
	TYA
	CLC
	ADC.w #$003E
	TAY
	LDA.b $A2
	STA.b [$99],y
	INY
	INY
	STA.b [$99],y
	LDA.w #$0002
	JMP.w CODE_139BB2

CODE_139CD2:
	REP.b #$20
	AND.w #$00FF
	CLC
	ADC.b $9C
	ORA.b $A0
	STA.b $A2
	SEP.b #$20
	RTS

CODE_139CE1:
	LDA.w #$0000
	STA.b $84
	RTS

CODE_139CE7:
	CLC
	ADC.b $84
	BCS.b CODE_139CF2
	LDX.b $84
	STA.b $84
	TXA
	RTS

CODE_139CF2:
	JMP.w CODE_13D8E0

CODE_139CF5:
	LDX.w $11E2
	LDA.w DATA_14AC81,x
	STA.b $33
	LDA.b $86
	STA.b $25
	LDA.b $88
	STA.b $27
	LDA.b $8E
	STA.b $29
	LDA.b $90
	STA.b $2B
	LDA.w $11CC
	STA.b $31
	LDA.w $11D4
	ASL
	STA.b $82
CODE_139D18:
	LDA.w $11C8
	STA.b $2F
CODE_139D1D:
	LDA.b [$25]
	TAX
	AND.w #$000E
	STA.b $2D
	TXA
	AND.w #$03F0
	LSR
	ORA.b $2D
	ASL
	ASL
	ADC.b $33
	STA.b $35
	ADC.w #$0002
	STA.b $37
	ADC.w #$0002
	STA.b $39
	ADC.w #$0002
	STA.b $3B
	LDA.b [$25]
	BMI.b CODE_139D93
	ASL
	BMI.b CODE_139D7A
	LDA.b ($35)
	STA.b [$29]
	LDY.w #$0002
	LDA.b ($37)
	STA.b [$29],y
	LDY.b $82
	LDA.b ($39)
	STA.b [$29],y
	INY
	INY
	LDA.b ($3B)
	STA.b [$29],y
CODE_139D5F:
	LDA.b $29
	CLC
	ADC.w #$0004
	STA.b $29
	INC.b $25
	INC.b $25
	DEC.b $2F
	BNE.b CODE_139D1D
	LDA.b $82
	ADC.b $29
	STA.b $29
	DEC.b $31
	BNE.b CODE_139D18
	RTS

CODE_139D7A:
	LDA.b ($37)
	STA.b [$29]
	LDY.w #$0002
	LDA.b ($35)
	STA.b [$29],y
	LDY.b $82
	LDA.b ($3B)
	STA.b [$29],y
	INY
	INY
	LDA.b ($39)
	STA.b [$29],y
	BRA.b CODE_139D5F

CODE_139D93:
	ASL
	BMI.b CODE_139DAF
	LDA.b ($39)
	STA.b [$29]
	LDY.w #$0002
	LDA.b ($3B)
	STA.b [$29],y
	LDY.b $82
	LDA.b ($35)
	STA.b [$29],y
	INY
	INY
	LDA.b ($37)
	STA.b [$29],y
	BRA.b CODE_139D5F

CODE_139DAF:
	LDA.b ($3B)
	STA.b [$29]
	LDY.w #$0002
	LDA.b ($39)
	STA.b [$29],y
	LDY.b $82
	LDA.b ($37)
	STA.b [$29],y
	INY
	INY
	LDA.b ($35)
	STA.b [$29],y
	JMP.w CODE_139D5F

CODE_139DC9:
	LDA.b $04
	ORA.w #$1000
	STA.b $04
	LDY.w #DATA_14ACD1
	LDA.b $45
	LSR
	LSR
	LSR
	BCS.b CODE_139DDD
	LDY.w #DATA_14ACF1
CODE_139DDD:
	LDX.w #$0000
CODE_139DE0:
	LDA.w $0000,y
	AND.w $1202
	STA.w $0440,x
	STA.w $0520,x
	INY
	INY
	INX
	INX
	CPX.w #$0020
	BNE.b CODE_139DE0
	RTS

CODE_139DF6:
	LDA.w $11FA
	BMI.b CODE_139E00
	CMP.w #$155A
	BCS.b CODE_139E12
CODE_139E00:
	LDA.w $11FC
	BNE.b CODE_139E0D
	LDA.w $11FA
	CMP.w #$FFA0
	BCS.b CODE_139E12
CODE_139E0D:
	LDA.w $11F8
	BEQ.b CODE_139E17
CODE_139E12:
	LDA.w #$0100
	BRA.b CODE_139E3A

CODE_139E17:
	LDA.b $74
	CLC
	ADC.w #$0080
	SEC
	SBC.w $11FA
	BPL.b CODE_139E26
	LDA.w #$0001
CODE_139E26:
	LSR
	LSR
	LSR
	LSR
	CMP.w #$0080
	BCC.b CODE_139E32
	LDA.w #$007F
CODE_139E32:
	EOR.w #$007F
	INC
	AND.w #$007F
	XBA
CODE_139E3A:
	ORA.w #$0009
	JSR.w CODE_13A43F
	LSR
	AND.w #$3F00
	ORA.w #$400A
	JSR.w CODE_13A43F
	RTS

CODE_139E4B:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b $02,x
	STA.w $4314
	REP.b #$20
	LDA.b $04,x
	STA.w $2116
	LDA.b $00,x
	STA.w $4312
	LDA.b $06,x
	STA.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	RTS

CODE_139E7C:
	PHP
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$09
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$00
	STA.w $4314
	REP.b #$30
	LDA.w #$0000
	STA.w $2116
	STA.b $27
	LDA.w #$0027
	STA.w $4312
	LDX.w #$0000
	STX.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	PLP
	RTS

CODE_139EB2:
	LDA.b $10,x
	SEC
	SBC.b $74
	STA.b $25
	LDA.b $12,x
	SEC
	SBC.b $76
	ORA.b $25
	CMP.w #$0100
	BCS.b CODE_139ECA
	JSR.w CODE_139ECC
	CLC
	RTS

CODE_139ECA:
	SEC
	RTS

CODE_139ECC:
	LDA.w #$0000
	STA.b $2D
	LDA.b $27
	SEC
	SBC.b $10,x
	BCS.b CODE_139EDF
	INC.b $2D
	LDA.b $10,x
	SEC
	SBC.b $27
CODE_139EDF:
	STA.b $2F
	LDA.b $29
	SEC
	SBC.b $12,x
	BCS.b CODE_139EF4
	LDA.b $2D
	ORA.w #$0002
	STA.b $2D
	LDA.b $12,x
	SEC
	SBC.b $29
CODE_139EF4:
	STA.b $31
	LDA.b $31
	CMP.b $2F
	BCS.b CODE_139F0B
	LDA.b $2D
	STA.b $1E,x
	LDA.b $31
	STA.b $04,x
	LDA.b $2F
	STA.b $20,x
	STA.b $02,x
	RTS

CODE_139F0B:
	LDA.b $2D
	ORA.w #$8000
	STA.b $1E,x
	LDA.b $2F
	STA.b $04,x
	LDA.b $31
	STA.b $20,x
	STA.b $02,x
	RTS

CODE_139F1D:
	LDA.w #$0002
CODE_139F20:
	STA.b $25
	EOR.w #$FFFF
	INC
	STA.b $27
	LDA.b $1E,x
	BPL.b CODE_139F3F
	JSR.w CODE_139F45
	JSR.w CODE_139F53
CODE_139F32:
	LSR
	LDA.b $25
	BCC.b CODE_139F39
	LDA.b $27
CODE_139F39:
	CLC
	ADC.b $10,x
	STA.b $10,x
	RTS

CODE_139F3F:
	JSR.w CODE_139F32
	JSR.w CODE_139F53
CODE_139F45:
	LSR
	LSR
	LDA.b $25
	BCC.b CODE_139F4D
	LDA.b $27
CODE_139F4D:
	CLC
	ADC.b $12,x
	STA.b $12,x
	RTS

CODE_139F53:
	LDA.b $20,x
	SEC
	SBC.b $04,x
	STA.b $20,x
	BCS.b CODE_139F63
	ADC.b $02,x
	STA.b $20,x
	LDA.b $1E,x
	RTS

CODE_139F63:
	PLA
	RTS

CODE_139F65:
	DEC.w $1216
	STZ.w $1218
	STZ.w $121A
	LDA.w #$FFEC
	STA.w $121C
	LDA.w #$FFD8
	STA.w $121E
	LDA.w #$0001
	STA.w $122A
	STA.w $122C
	STA.w $122E
	STZ.w $1224
	STZ.w $1226
	STZ.w $1228
	LDA.w #$0003
	STA.w $1220
	LDA.w #$3902
	JSR.w CODE_13A43F
	RTS

CODE_139F9C:
	JMP.w ($11AC)

CODE_139F9F:
	DEC.w $1220
	BNE.b CODE_139FB7
	LDA.w #$0005
	STA.w $1220
	LDA.w $1218
	CLC
	ADC.w #$0002
	AND.w #$0007
	STA.w $1218
CODE_139FB7:
	LDY.w $1218
	LDA.w #$2800
	STA.w $097C
	LDA.w DATA_14AD45,y
	STA.w $097E
	LDA.w #$0014
	STA.w $098E
	STA.w $0990
	STZ.w $0974
	LDX.w #$0004
CODE_139FD5:
	LDA.w $121A,x
	LSR
	LSR
	LSR
	INC
	CLC
	ADC.w $1224,x
	STA.w $1224,x
	LDA.w $122A,x
	BEQ.b CODE_13A009
	CLC
	ADC.w $121A,x
	STA.w $121A,x
	BNE.b CODE_139FFE
	LDA.w $122A,x
	BPL.b CODE_13A009
	LDA.w #$0000
	STA.w $122A,x
	BRA.b CODE_13A009

CODE_139FFE:
	CMP.w #$0040
	BNE.b CODE_13A009
	LDA.w #$FFFF
	STA.w $122A,x
CODE_13A009:
	DEX
	DEX
	BPL.b CODE_139FD5
	LDA.w $122A
	ORA.w $122C
	ORA.w $122E
	BEQ.b CODE_13A068
	LDX.w $1224
	LDY.w $121A
	JSR.w CODE_13A030
	LDX.w $1226
	LDY.w $121C
	JSR.w CODE_13A030
	LDX.w $1228
	LDY.w $121E
CODE_13A030:
	BEQ.b CODE_13A067
	CPY.w #$0040
	BCS.b CODE_13A067
	STY.w $11A6
	STX.w $11A4
	JSR.w CODE_13A075
	LDA.w $11A4
	CLC
	ADC.w #$0040
	STA.w $11A4
	JSR.w CODE_13A075
	LDA.w $11A4
	CLC
	ADC.w #$0040
	STA.w $11A4
	JSR.w CODE_13A075
	LDA.w $11A4
	CLC
	ADC.w #$0040
	STA.w $11A4
	JSR.w CODE_13A075
CODE_13A067:
	RTS

CODE_13A068:
	STZ.w $1216
	STZ.w $121A
	STZ.w $121C
	STZ.w $121E
	RTS

CODE_13A075:
	STZ.w $0974
	LDA.w $11A4
	LDY.w $11A6
	JSR.w CODE_139ADD
	CLC
	ADC.w $0630
	STA.w $0978
	SEC
	SBC.w #$000A
	STA.w $098A
	LDA.w $11A4
	LDY.w $11A6
	JSR.w CODE_139AD6
	CLC
	ADC.w $0632
	STA.w $097A
	SEC
	SBC.w #$0014
	STA.w $098C
	LDA.w $11A4
	SEC
	SBC.w #$0020
	LSR
	LSR
	LSR
	AND.w #$0006
	TAY
	LDA.w #$2800
	STA.w $097C
	LDA.w DATA_14AD45,y
	STA.w $097E
	LDX.w #$0968
	STX.b $5D
	LDA.w $1222
	AND.w #$0007
	BNE.b CODE_13A137
	JSR.w CODE_13BA08
	LDA.b $12,x
	SEC
	SBC.w #$0010
	TAY
	LDA.b $10,x
	CMP.w $11CA
	BCS.b CODE_13A137
	SEC
	SBC.w #$0010
	BMI.b CODE_13A137
	JSR.w CODE_1384E4
	BIT.w #$1000
	BEQ.b CODE_13A0F5
	PHY
	LDA.w #$FFF0
	TAY
	JSR.w CODE_13A13E
	PLY
CODE_13A0F5:
	INY
	INY
	INY
	INY
	LDA.b [$8E],y
	BIT.w #$1000
	BEQ.b CODE_13A10B
	PHY
	LDA.w #$0000
	LDY.w #$FFF0
	JSR.w CODE_13A13E
	PLY
CODE_13A10B:
	TYA
	CLC
	ADC.b $82
	CLC
	ADC.b $82
	TAY
	LDA.b [$8E],y
	BIT.w #$1000
	BEQ.b CODE_13A123
	PHY
	LDA.w #$0000
	TAY
	JSR.w CODE_13A13E
	PLY
CODE_13A123:
	DEY
	DEY
	DEY
	DEY
	LDA.b [$8E],y
	BIT.w #$1000
	BEQ.b CODE_13A137
	LDA.w #$FFF0
	LDY.w #$0000
	JSR.w CODE_13A13E
CODE_13A137:
	JSR.w CODE_13886F
	INC.w $1222
	RTS

CODE_13A13E:
	CLC
	ADC.b $10,x
	LSR
	LSR
	LSR
	AND.w #$FFFE
	STA.b $25
	TYA
	CLC
	ADC.b $12,x
	LSR
	LSR
	LSR
	LSR
	LDX.w $11D4
	CMP.w $11D4
	BCC.b CODE_13A15C
	PHA
	TXA
	PLX
CODE_13A15C:
	TAY
	JSR.w CODE_139B48
	STA.b $27
	CLC
	ADC.b $25
	TAY
	LDA.b [$86],y
	CLC
	ADC.w #$0002
	TAX
	AND.w #$03FF
	CMP.w #$034C
	BEQ.b CODE_13A17C
	TXA
	STA.b [$86],y
	LDX.b $5D
	CLC
	RTS

CODE_13A17C:
	JMP.w CODE_13B0C1

CODE_13A17F:
	DEC.w $1216
	STZ.w $1218
	STZ.w $121A
	LDA.w #$FFE4
	STA.w $121C
	LDA.w #$FFC8
	STA.w $121E
	LDA.w #$0005
	STA.w $122A
	STA.w $122C
	STA.w $122E
	STZ.w $1224
	LDA.w #$0055
	STA.w $1226
	ASL
	STA.w $1228
	LDA.w #$0003
	STA.w $1220
	LDA.w #$0702
	JSR.w CODE_13A43F
	LDA.w #$0902
	JSR.w CODE_13A43F
	RTS

CODE_13A1C0:
	DEC.w $1220
	BNE.b CODE_13A1D8
	LDA.w #$0005
	STA.w $1220
	LDA.w $1218
	CLC
	ADC.w #$0002
	AND.w #$0007
	STA.w $1218
CODE_13A1D8:
	LDY.w $1218
	LDA.w DATA_14AD35,y
	STA.w $097C
	LDA.w DATA_14AD3D,y
	STA.w $097E
	LDA.w #$0014
	STA.w $098E
	STA.w $0990
	STZ.w $0974
	LDX.w #$0004
CODE_13A1F6:
	LDA.w $1224,x
	CLC
	ADC.w #$0007
	STA.w $1224,x
	LDA.w $121A,x
	CLC
	ADC.w #$0003
	BMI.b CODE_13A219
	CMP.w #$0054
	BCC.b CODE_13A219
	LDA.w #$0000
	DEC.w $122A,x
	BNE.b CODE_13A219
	LDA.w #$8000
CODE_13A219:
	STA.w $121A,x
	DEX
	DEX
	BPL.b CODE_13A1F6
	LDA.w $122A
	ORA.w $122C
	ORA.w $122E
	BEQ.b CODE_13A27B
	LDX.w $1224
	LDY.w $121A
	JSR.w CODE_13A243
	LDX.w $1226
	LDY.w $121C
	JSR.w CODE_13A243
	LDX.w $1228
	LDY.w $121E
CODE_13A243:
	BEQ.b CODE_13A27A
	CPY.w #$0100
	BCS.b CODE_13A27A
	STY.w $11A6
	STX.w $11A4
	JSR.w CODE_13A288
	LDA.w $11A4
	CLC
	ADC.w #$0040
	STA.w $11A4
	JSR.w CODE_13A288
	LDA.w $11A4
	CLC
	ADC.w #$0040
	STA.w $11A4
	JSR.w CODE_13A288
	LDA.w $11A4
	CLC
	ADC.w #$0040
	STA.w $11A4
	JSR.w CODE_13A288
CODE_13A27A:
	RTS

CODE_13A27B:
	STZ.w $1216
	STZ.w $121A
	STZ.w $121C
	STZ.w $121E
	RTS

CODE_13A288:
	STZ.w $0974
	LDA.w $11A4
	LDY.w $11A6
	JSR.w CODE_139ADD
	CLC
	ADC.w $0630
	STA.w $0978
	SEC
	SBC.w #$000A
	STA.w $098A
	LDA.w $11A4
	LDY.w $11A6
	JSR.w CODE_139AD6
	CLC
	ADC.w $0632
	STA.w $097A
	SEC
	SBC.w #$0014
	STA.w $098C
	LDA.w $11A4
	SEC
	SBC.w #$0020
	LSR
	LSR
	LSR
	AND.w #$0006
	TAY
	LDA.w DATA_14AD35,y
	STA.w $097C
	LDA.w DATA_14AD3D,y
	STA.w $097E
	LDX.w #$0968
	STX.b $5D
	LDA.w $1222
	AND.w #$0007
	BNE.b CODE_13A2E3
	JSR.w CODE_13BA08
CODE_13A2E3:
	JSR.w CODE_13886F
	INC.w $1222
	RTS

CODE_13A2EA:
	INC.w $1C30
	LDA.w $1C30
	CMP.w #$0002
	BEQ.b CODE_13A30A
	CMP.w #$0003
	BCC.b CODE_13A309
	STZ.w $1C30
	LDA.w #CODE_13A381
	STA.b $06
	LDA.b $04
	ORA.w #$0400
	STA.b $04
CODE_13A309:
	RTS

CODE_13A30A:
	LDX.w #$1C54
CODE_13A30D:
	LDY.b $8E,x
	LDA.b $8C,x
	STA.b $8E,x
	LDA.b $8A,x
	STA.b $8C,x
	LDA.b $88,x
	STA.b $8A,x
	LDA.b $86,x
	STA.b $88,x
	LDA.b $84,x
	STA.b $86,x
	LDA.b $82,x
	STA.b $84,x
	LDA.b $80,x
	STA.b $82,x
	LDA.b $0E,x
	STA.b $80,x
	LDA.b $0C,x
	STA.b $0E,x
	LDA.b $0A,x
	STA.b $0C,x
	LDA.b $08,x
	STA.b $0A,x
	LDA.b $06,x
	STA.b $08,x
	LDA.b $04,x
	STA.b $06,x
	LDA.b $02,x
	STA.b $04,x
	LDA.b $00,x
	STA.b $02,x
	STY.b $00,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	CPX.w #$1CD4
	BNE.b CODE_13A30D
	LDA.w $1C52
	BEQ.b CODE_13A379
	DEC.w $1C52
	LDX.w #$001E
CODE_13A363:
	LDA.w $1C32,x
	LDY.w $1C52
	BEQ.b CODE_13A372
CODE_13A36B:
	LSR
	AND.w #$3DEF
	DEY
	BNE.b CODE_13A36B
CODE_13A372:
	STA.w $0480,x
	DEX
	DEX
	BNE.b CODE_13A363
CODE_13A379:
	LDA.b $04
	ORA.w #$1000
	STA.b $04
	RTS

CODE_13A381:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$00
	STA.w $4314
	LDA.b #$02
	LDX.w #$52C0
	LDY.w #$1C54
	STX.w $2116
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	LDX.w #$53C0
	LDY.w #$1CD4
	STX.w $2116
	STY.w $4312
	LDX.w #$0080
	STX.w $4315
	STA.w $420B
	REP.b #$20
	RTS

CODE_13A3C6:
	STZ.w $1D54
	LDA.w #$0000
	STA.w $1D56
	RTS

CODE_13A3D0:
	LDA.w !RAM_SXAR_GambitWalkingStorm_CurrentHPLo
	CMP.w $1D58
	BEQ.b CODE_13A3EB
	STA.w $1D58
	BCS.b CODE_13A3EB
	LDA.w #$0018
	CMP.w $1D56
	BEQ.b CODE_13A3EB
	STA.w $1D56
	STZ.w $1D54
CODE_13A3EB:
	LDA.w $1D56
	BMI.b CODE_13A43E
	LDX.w $1D54
	LDY.w DATA_14AE47,x
	BNE.b CODE_13A407
	STZ.w $1D54
	LDA.w $1D56
	SEC
	SBC.w #$0018
	STA.w $1D56
	BRA.b CODE_13A3EB

CODE_13A407:
	LDA.w DATA_14AE47+$02,x
	INX
	INX
	INX
	INX
	STX.w $1D54
	CLC
	ADC.w $1D56
	TAX
	JSR.w CODE_13A41F
	JSR.w CODE_13A41F
	JSR.w CODE_13A41F
CODE_13A41F:
	LDA.w DATA_14AE91,x
	STA.b [$8A],y
	INY
	INY
	LDA.w DATA_14AE91+$02,x
	STA.b [$8A],y
	INY
	INY
	LDA.w DATA_14AE91+$04,x
	STA.b [$8A],y
	TYA
	CLC
	ADC.w #$001C
	TAY
	TXA
	CLC
	ADC.w #$0006
	TAX
CODE_13A43E:
	RTS

CODE_13A43F:
	PHP
	REP.b #$30
	PHX
	PHY
	PHA
	SEP.b #$30
	LDA.l $001FC2
	TAX
	INC
	AND.b #$0F
	CMP.l $001FC0
	BEQ.b CODE_13A46D
	PLA
	STA.l $001FD6,x
	PLA
	STA.l $001FC6,x
	INX
	TXA
	AND.b #$0F
	STA.l $001FC2
	REP.b #$30
	PLY
	PLX
	PLP
	RTS

CODE_13A46D:
	REP.b #$30
	PLA
	PLY
	PLX
	PLP
	RTS

CODE_13A474:
	PHP
	SEP.b #$30
	LDA.l $001FC4
	CMP.w $2140
	BNE.b CODE_13A4B6
	LDA.l $001FC0
	CMP.l $001FC2
	BEQ.b CODE_13A4B6
	TAX
	LDA.l $001FC6,x
	PHA
	LDA.l $001FD6,x
	PHA
	TXA
	INC
	AND.b #$0F
	STA.l $001FC0
	REP.b #$20
	PLA
	STA.w $2142
	SEP.b #$20
	LDA.l $001FC4
CODE_13A4A9:
	INC
	BEQ.b CODE_13A4A9
	STA.l $001FC4
	STA.w $2140
	PLP
	CLC
	RTS

CODE_13A4B6:
	PLP
	SEC
	RTS

CODE_13A4B9:
	LDY.b $0E,x
	LDA.w DATA_14897E,y
	STA.b $25
	JSR.w CODE_1386F1
	JSR.w CODE_1383F1
	LDA.w $11F4
	BEQ.b CODE_13A4E3
	DEC.w $11F4
	LSR
	LSR
	LDA.w #$2E00
	BCC.b CODE_13A4D8
	LDA.w #$2200
CODE_13A4D8:
	STA.b $25
	LDA.b $14,x
	AND.w #$C000
	ORA.b $25
	STA.b $14,x
CODE_13A4E3:
	JSR.w CODE_1393BB
	JSR.w CODE_13A51A
	RTS

CODE_13A4EA:
	JSR.w CODE_1383F1
	LDA.b $14,x
	AND.w #$F000
	ORA.w #$0E00
	STA.b $14,x
	LDA.w $11E2
	CMP.w #$0002
	BNE.b CODE_13A50B
	LDA.b $12,x
	CMP.w $11FA
	BCC.b CODE_13A50B
	LDA.w $11FA
	STA.b $12,x
CODE_13A50B:
	LDA.b $18,x
	BNE.b CODE_13A516
	LDA.w #$8000
	ORA.b $1D
	STA.b $1D
CODE_13A516:
	JSR.w CODE_1393BB
	RTS

CODE_13A51A:
	LDX.w #$0620
	LDA.b $10,x
	SEC
	SBC.w #$0010
	BCC.b CODE_13A592
	ADC.w #$001F
	CMP.w $11CA
	BCS.b CODE_13A592
	LDA.w #$FFF0
	LDY.w #$FFE0
	JSR.w CODE_13AB52
	BIT.w #$0100
	BEQ.b CODE_13A548
	STA.b $3D
	PHY
	LDA.w #$FFF0
	LDY.w #$FFE0
	JSR.w CODE_13A593
	PLY
CODE_13A548:
	INY
	INY
	INY
	INY
	LDA.b [$8E],y
	BIT.w #$0100
	BEQ.b CODE_13A560
	STA.b $3D
	PHY
	LDA.w #$0000
	LDY.w #$FFE0
	JSR.w CODE_13A593
	PLY
CODE_13A560:
	TYA
	CLC
	ADC.b $82
	CLC
	ADC.b $82
	TAY
	LDA.b [$8E],y
	BIT.w #$0100
	BEQ.b CODE_13A57C
	STA.b $3D
	PHY
	LDA.w #$0000
	LDY.w #$FFF0
	JSR.w CODE_13A593
	PLY
CODE_13A57C:
	DEY
	DEY
	DEY
	DEY
	LDA.b [$8E],y
	BIT.w #$0100
	BEQ.b CODE_13A592
	STA.b $3D
	LDA.w #$FFF0
	LDY.w #$FFF0
	JSR.w CODE_13A593
CODE_13A592:
	RTS

CODE_13A593:
	CLC
	ADC.b $10,x
	STA.b $31
	LSR
	LSR
	LSR
	AND.w #$FFFE
	STA.b $25
	TYA
	CLC
	ADC.b $12,x
	STA.b $33
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_13B0AC
	PHX
	LDA.b $3D
	AND.w #$00FF
	TAX
	JSR.w (DATA_13A5B9,x)
	PLX
	RTS

DATA_13A5B9:
	dw CODE_13A5C3
	dw CODE_13A5E4
	dw CODE_13A61C
	dw CODE_13A634
	dw CODE_13A640

CODE_13A5C3:
	LDA.w #$0002
	STA.w $11A2
	LDA.w #$0034
	STA.w $11A0
	LDA.w #$2702
	JSR.w CODE_13A43F
	LDA.w #$000C
	ORA.w $119C
	STA.w $119C
	LDY.w #DATA_14AF81
	JMP.w CODE_138C04

CODE_13A5E4:
	INC.w !RAM_SXAR_Gambit_CurrentStarCountLo
	LDA.w #$3702
	JSR.w CODE_13A43F
	LDA.w !RAM_SXAR_Gambit_CurrentStarCountLo
	CMP.w #$0064
	BNE.b CODE_13A604
	STZ.w !RAM_SXAR_Gambit_CurrentStarCountLo
	INC.w !RAM_SXAR_Global_CurrentLivesLo
	LDA.w #$0010
	ORA.w $119C
	STA.w $119C
CODE_13A604:
	LDX.w #$0620
	LDY.w #$0010
	JSR.w CODE_13C9B7
	LDA.w #$0020
	ORA.w $119C
	STA.w $119C
	LDY.w #DATA_14AF49
	JMP.w CODE_138C04

CODE_13A61C:
	LDA.w #$3802
	JSR.w CODE_13A43F
	JSR.w CODE_1397D9
	LDX.w #$0620
	LDY.w #$000E
	JSR.w CODE_13C9B7
	LDY.w #DATA_14AF6C
	JMP.w CODE_138C04

CODE_13A634:
	LDA.w #$2702
	JSR.w CODE_13A43F
	LDY.w #DATA_14AF81
	JMP.w CODE_138C04

CODE_13A640:
	LDA.w #$3802
	JSR.w CODE_13A43F
	LDA.w #$001A
	JSR.w CODE_138C8F
	LDA.w #$0034
	JSR.w CODE_138C2B
	LDX.w #$0620
	LDY.w #$0012
	JSR.w CODE_13C9B7
	LDY.w #DATA_14AF9D
	JMP.w CODE_138C04

CODE_13A661:
	JSR.w CODE_1383F1
	LDA.b $02
	AND.w #$0003
	BNE.b CODE_13A671
	LDA.w #$0502
	JSR.w CODE_13A43F
CODE_13A671:
	LDA.b $16,x
	CMP.w #$003E
	BEQ.b CODE_13A67A
	STA.b $06,x
CODE_13A67A:
	LDA.b $0C,x
	BEQ.b CODE_13A687
	STZ.b $0C,x
	LDA.w #$4000
	ORA.b $1D
	STA.b $1D
CODE_13A687:
	LDA.b $1A,x
	LSR
	LDY.w #$6E00
	LDA.b $06,x
	BCC.b CODE_13A697
	LDY.w #$6200
	LDA.w #$003E
CODE_13A697:
	STY.b $14,x
	STA.b $16,x
	JSR.w CODE_1393BB
	RTS

CODE_13A69F:
	LDA.w $11C6
	BIT.w #$8000
	BEQ.b CODE_13A6CD
	LDA.w #$FFF4
	LDY.w #$FFD8
	JSR.w CODE_13AB52
	INY
	INY
	ORA.b [$8E],y
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$8000
	BNE.b CODE_13A6CD
	LDA.w #$FA00
	STA.b $1E,x
	LDA.w #$0096
	STA.b $20,x
	LDA.w #$0004
	JMP.w CODE_13A76A

CODE_13A6CD:
	LDA.w $11E2
	CMP.w #$0002
	BNE.b CODE_13A707
	LDA.b $12,x
	CMP.w $11FA
	BCC.b CODE_13A707
	LDA.w #$FFF8
	LDY.w #$FFD8
	JSR.w CODE_13AB52
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$8000
	BEQ.b CODE_13A700
	LDA.w $11F4
	BNE.b CODE_13A6F9
	LDA.w #$0008
	STA.w $11F4
CODE_13A6F9:
	LDA.w #$FFFC
	JSR.w CODE_138C45
	RTS

CODE_13A700:
	LDA.w $11FA
	STA.b $12,x
	BRA.b CODE_13A71B

CODE_13A707:
	JSR.w CODE_13ABA1
	BCS.b CODE_13A71B
	LDA.w #$0200
	STA.b $1E,x
	LDA.w #$0028
	STA.b $20,x
	LDA.w #$0002
	BRA.b CODE_13A76A

CODE_13A71B:
	JSR.w CODE_13A9AF
	BCC.b CODE_13A729
	LDA.w #$0000
	LDY.w #$0000
	JMP.w CODE_13AA26

CODE_13A729:
	LDA.w #DATA_1489A4
	LDY.b $16,x
	CPY.w #$0024
	BNE.b CODE_13A736
	LDA.w #DATA_1489C0
CODE_13A736:
	LDY.w #$FFFF
	JSR.w CODE_13AA26
	LDA.w $11C2
	BIT.w #$0400
	BEQ.b CODE_13A749
	LDA.w #$0006
	BRA.b CODE_13A76A

CODE_13A749:
	LDA.b $0C,x
	BIT.w #$0001
	BNE.b CODE_13A769
	LDA.b $16,x
	CMP.w #$0026
	BEQ.b CODE_13A769
	LDY.w #DATA_14899E
	LDA.w $11C2
	BIT.w #$0800
	BEQ.b CODE_13A765
	LDY.w #DATA_1489BA
CODE_13A765:
	TYA
	JSR.w CODE_1383E4
CODE_13A769:
	RTS

CODE_13A76A:
	STA.b $0E,x
	TAY
	LDA.w DATA_14896E,y
	JSR.w CODE_1383E4
	RTS

CODE_13A774:
	LDA.w $11CE
	SEC
	SBC.b $12,x
	BCS.b CODE_13A77E
	BMI.b CODE_13A7CE
CODE_13A77E:
	CMP.w #$0011
	BCC.b CODE_13A795
	LDA.w #$0000
	LDY.w #$0002
	JSR.w CODE_13AA26
	LDA.w #$0004
	STA.b $29
	DEC
	JSR.w CODE_13A9B4
CODE_13A795:
	JSR.w CODE_13AA9C
	TAY
	CLC
	ADC.b $12,x
	STA.b $12,x
	TYA
	BMI.b CODE_13A7DC
	LDA.w $11E2
	CMP.w #$0002
	BNE.b CODE_13A7B5
	LDA.b $12,x
	CMP.w $11FA
	BCC.b CODE_13A7B5
	LDA.w $11FA
	BRA.b CODE_13A7BF

CODE_13A7B5:
	JSR.w CODE_13AB9D
	BCC.b CODE_13A7CD
	LDA.b $12,x
	AND.w #$FFF8
CODE_13A7BF:
	STA.b $12,x
	LDA.w #$0000
	JSR.w CODE_13A76A
	LDA.w #DATA_148A56
	JMP.w CODE_1383E4

CODE_13A7CD:
	RTS

CODE_13A7CE:
	LDA.w #$2802
	JSR.w CODE_13A43F
	LDA.b $1D
	ORA.w #$8000
	STA.b $1D
	RTS

CODE_13A7DC:
	LDA.w #$FFF4
	LDY.w #$FFDC
	JSR.w CODE_13AB52
	INY
	INY
	ORA.b [$8E],y
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$8000
	BEQ.b CODE_13A7F7
	LDA.w #$0000
	STA.b $1E,x
CODE_13A7F7:
	RTS

CODE_13A7F8:
	LDA.w $11C2
	AND.w #$8B00
	BEQ.b CODE_13A809
	LDA.w #$0000
	JSR.w CODE_13A76A
	JMP.w CODE_13A69F

CODE_13A809:
	LDA.w $11E2
	CMP.w #$0002
	BNE.b CODE_13A840
	LDA.b $12,x
	CMP.w $11FA
	BCC.b CODE_13A840
	LDA.w #$FFF8
	LDY.w #$FFE8
	JSR.w CODE_13AB52
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$8000
	BEQ.b CODE_13A83B
	LDA.w $11F4
	BNE.b CODE_13A835
	LDA.w #$0008
	STA.w $11F4
CODE_13A835:
	LDA.w #$FFFC
	JMP.w CODE_138C45

CODE_13A83B:
	LDA.w $11FA
	STA.b $12,x
CODE_13A840:
	LDA.w #DATA_148A10
	LDY.w #$FFFF
	JSR.w CODE_13AA26
	RTS

CODE_13A84A:
	LDA.w $11C6
	BIT.w #$8000
	BEQ.b CODE_13A878
	LDA.w #$FFF4
	LDY.w #$FFD8
	JSR.w CODE_13AB52
	INY
	INY
	ORA.b [$8E],y
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$8000
	BNE.b CODE_13A878
	LDA.w #$FA00
	STA.b $1E,x
	LDA.w #$0096
	STA.b $20,x
	LDA.w #$000C
	JMP.w CODE_13A76A

CODE_13A878:
	JSR.w CODE_13AB6D
	BCS.b CODE_13A88D
	LDA.w #$0200
	STA.b $1E,x
	LDA.w #$0028
	STA.b $20,x
	LDA.w #$000A
	JMP.w CODE_13A76A

CODE_13A88D:
	LDA.w #DATA_148AA6
	LDY.w #$FFFF
	JSR.w CODE_13A946
	LDA.b $0C,x
	BIT.w #$0001
	BNE.b CODE_13A8B6
	JSR.w CODE_13A9AF
	BCS.b CODE_13A8B6
	LDA.w $11C2
	BIT.w #$0400
	BEQ.b CODE_13A8B0
	LDA.w #$000E
	JMP.w CODE_13A76A

CODE_13A8B0:
	LDA.w #DATA_148A86
	JSR.w CODE_1383E4
CODE_13A8B6:
	RTS

CODE_13A8B7:
	LDA.w $11C2
	BIT.w #$8000
	BEQ.b CODE_13A8DF
	LDA.b $12,x
	BMI.b CODE_13A8DF
	LDA.w #$0028
	BIT.b $1E,x
	BMI.b CODE_13A8CD
	LDA.w #$000A
CODE_13A8CD:
	STA.b $25
	LDA.b $20,x
	SEC
	SBC.w #$000A
	BCC.b CODE_13A8DF
	CMP.b $25
	BCS.b CODE_13A8DD
	LDA.b $25
CODE_13A8DD:
	STA.b $20,x
CODE_13A8DF:
	LDA.w $11CE
	SEC
	SBC.b $12,x
	BCS.b CODE_13A8EC
	CMP.w #$FFEF
	BCS.b CODE_13A922
CODE_13A8EC:
	CMP.w #$0011
	BCC.b CODE_13A903
	LDA.w #$0000
	LDY.w #$0022
	JSR.w CODE_13A946
	LDA.w #$0004
	STA.b $29
	DEC
	JSR.w CODE_13A9B4
CODE_13A903:
	JSR.w CODE_13AA9C
	TAY
	CLC
	ADC.b $12,x
	STA.b $12,x
	TYA
	BMI.b CODE_13A92A
	JSR.w CODE_13AB5F
	BCC.b CODE_13A921
	LDA.b $12,x
	AND.w #$FFF8
	STA.b $12,x
	LDA.w #$0008
	JMP.w CODE_13A76A

CODE_13A921:
	RTS

CODE_13A922:
	LDA.b $1D
	ORA.w #$8000
	STA.b $1D
	RTS

CODE_13A92A:
	LDA.w #$FFF4
	LDY.w #$FFDC
	JSR.w CODE_13AB52
	INY
	INY
	ORA.b [$8E],y
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$8000
	BEQ.b CODE_13A945
	LDA.w #$0000
	STA.b $1E,x
CODE_13A945:
	RTS

CODE_13A946:
	STA.b $25
	LDA.w $120C
	CMP.w #$0009
	BCS.b CODE_13A96D
	LDA.w $11C6
	BIT.w #$4000
	BEQ.b CODE_13A96D
	LDA.b $25
	BEQ.b CODE_13A964
	JSR.w CODE_1383E4
	LDA.w #$0001
	STA.b $0C,x
CODE_13A964:
	TYA
	BMI.b CODE_13A96A
	JSR.w CODE_13C9B7
CODE_13A96A:
	LDA.w $11C6
CODE_13A96D:
	BIT.w #$0040
	BEQ.b CODE_13A991
	LDA.w $1216
	BNE.b CODE_13A991
	LDA.w $11A2
	BEQ.b CODE_13A991
	DEC.w $11A2
	LDA.w #$0008
	ORA.w $119C
	STA.w $119C
	JSR.w CODE_13A17F
	LDA.w #$00A0
	STA.w $11F4
CODE_13A991:
	RTS

CODE_13A992:
	LDA.w $11C2
	AND.w #$8B00
	BEQ.b CODE_13A9A5
	STZ.b $0C,x
	LDA.w #$0008
	JSR.w CODE_13A76A
	JMP.w CODE_13A84A

CODE_13A9A5:
	LDA.w #DATA_148ABC
	LDY.w #$FFFF
	JSR.w CODE_13A946
	RTS

CODE_13A9AF:
	LDA.w #$0005
	STA.b $29
CODE_13A9B4:
	ASL
	ASL
	ASL
	STA.b $2B
	LDA.w $11C2
	BIT.w #$0200
	BEQ.b CODE_13A9D0
	LDA.b $10,x
	CMP.w #$0010
	BCC.b CODE_13A9D0
	LDA.w #$FFFE
	LDY.w #$FFF2
	BRA.b CODE_13A9E6

CODE_13A9D0:
	BIT.w #$0100
	BEQ.b CODE_13AA24
	LDA.w $11CA
	SEC
	SBC.w #$0004
	CMP.b $10,x
	BCC.b CODE_13AA24
	LDA.w #$0002
	LDY.w #$000A
CODE_13A9E6:
	STA.b $25
	STY.b $27
	CLC
	ADC.b $10,x
	CLC
	ADC.b $27
	PHA
	LDA.b $12,x
	SEC
	SBC.b $2B
	BIT.w #$0007
	BEQ.b CODE_13A9FE
	SBC.w #$0007
CODE_13A9FE:
	TAY
	PLA
	LDX.b $29
	JSR.w CODE_13850C
	LDX.b $5D
	BIT.w #$8000
	BNE.b CODE_13AA24
	LDA.b $25
	JSR.w CODE_13AA77
	LDA.b $0C,x
	BIT.w #$0001
	BNE.b CODE_13AA1C
	LDA.b $18,x
	BNE.b CODE_13AA22
CODE_13AA1C:
	LDA.w #DATA_1489D6
	JSR.w CODE_1383E4
CODE_13AA22:
	SEC
	RTS

CODE_13AA24:
	CLC
	RTS

CODE_13AA26:
	STA.b $25
	LDA.w $120C
	CMP.w #$0009
	BCS.b CODE_13AA4F
	LDA.w $11A0
	BEQ.b CODE_13AA4F
	LDA.w $11C6
	AND.w #$4000
	BEQ.b CODE_13AA4F
	LDA.b $25
	BEQ.b CODE_13AA49
	JSR.w CODE_1383E4
	LDA.w #$0001
	STA.b $0C,x
CODE_13AA49:
	TYA
	BMI.b CODE_13AA4F
	JSR.w CODE_13C9B7
CODE_13AA4F:
	LDA.w $11C6
	AND.w #$0040
	BEQ.b CODE_13AA76
	LDA.w $1216
	BNE.b CODE_13AA76
	LDA.w $11A2
	BEQ.b CODE_13AA76
	DEC.w $11A2
	LDA.w #$0008
	ORA.w $119C
	STA.w $119C
	JSR.w CODE_139F65
	LDA.w #$00A0
	STA.w $11F4
CODE_13AA76:
	RTS

CODE_13AA77:
	TAY
	BPL.b CODE_13AA88
	LDA.b $14,x
	BIT.w #$4000
	BEQ.b CODE_13AA96
	TYA
	CLC
	ADC.b $10,x
	STA.b $10,x
	RTS

CODE_13AA88:
	LDA.b $14,x
	BIT.w #$4000
	BNE.b CODE_13AA96
	TYA
	CLC
	ADC.b $10,x
	STA.b $10,x
	RTS

CODE_13AA96:
	EOR.w #$4000
	STA.b $14,x
	RTS

CODE_13AA9C:
	LDA.b $1E,x
	BMI.b CODE_13AAAD
	CMP.w #$0800
	BCS.b CODE_13AABE
	LDA.b $20,x
	CLC
	ADC.w #$000A
	STA.b $20,x
CODE_13AAAD:
	LDA.b $20,x
	CMP.w #$0028
	BCC.b CODE_13AAB9
	SBC.w #$0008
	STA.b $20,x
CODE_13AAB9:
	CLC
	ADC.b $1E,x
	STA.b $1E,x
CODE_13AABE:
	XBA
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_13AACA
	ORA.w #$FF00
CODE_13AACA:
	RTS

CODE_13AACB:
	BIT.b $14,x
	BVC.b CODE_13AAD3
	EOR.w #$FFFF
	INC
CODE_13AAD3:
	CLC
	ADC.b $10,x
	STA.b $10,x
	RTS

CODE_13AAD9:
	LDY.w #$0000
	LDA.b $10,x
	CMP.w $0630
	BCC.b CODE_13AAE6
	LDY.w #$4000
CODE_13AAE6:
	LDA.b $14,x
	AND.w #$BFFF
	STY.b $3D
	ORA.b $3D
	STA.b $14,x
	RTS

CODE_13AAF2:
	LDA.w #$0000
	LDY.b $10,x
	CPY.w $0630
	BCC.b CODE_13AAFF
	LDA.w #$4000
CODE_13AAFF:
	STA.b $3D
	LDA.b $14,x
	AND.w #$4000
	CMP.b $3D
	RTS

CODE_13AB09:
	LDA.b $12,x
	SEC
	SBC.w $0632
	LDY.w #$0000
	CLC
	ADC.w #$0080
	BMI.b CODE_13AB28
	CMP.w #$0055
	BCC.b CODE_13AB28
	LDY.w #$0006
	CMP.w #$00AA
	BCC.b CODE_13AB28
	LDY.w #$000C
CODE_13AB28:
	STY.b $25
	LDA.b $10,x
	SEC
	SBC.w $0630
	LDY.w #$0000
	CLC
	ADC.w #$0080
	BMI.b CODE_13AB49
	CMP.w #$0055
	BCC.b CODE_13AB49
	LDY.w #$0002
	CMP.w #$00AA
	BCC.b CODE_13AB49
	LDY.w #$0004
CODE_13AB49:
	TYA
	CLC
	ADC.b $25
	TAY
	LDA.w DATA_14AE35,y
	RTS

CODE_13AB52:
	CLC
	ADC.b $10,x
	PHA
	TYA
	CLC
	ADC.b $12,x
	TAY
	PLA
	JMP.w CODE_1384E4

CODE_13AB5F:
	LDA.b $10,x
	AND.w #$0007
	CMP.w #$0004
	BCS.b CODE_13AB9D
	LDY.b $12,x
	BRA.b CODE_13AB7A

CODE_13AB6D:
	LDA.b $10,x
	AND.w #$0007
	CMP.w #$0004
	BCS.b CODE_13ABA1
	LDY.b $12,x
	INY
CODE_13AB7A:
	LDA.w $11CE
	SEC
	SBC.b $12,x
	BCC.b CODE_13AB99
	CMP.w #$0007
	BCC.b CODE_13AB99
	LDA.b $10,x
	SEC
	SBC.w #$0008
	JSR.w CODE_1384E4
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$4000
	BNE.b CODE_13AB9B
CODE_13AB99:
	CLC
	RTS

CODE_13AB9B:
	SEC
	RTS

CODE_13AB9D:
	LDY.b $12,x
	BRA.b CODE_13ABA4

CODE_13ABA1:
	LDY.b $12,x
	INY
CODE_13ABA4:
	LDA.w $11CE
	SEC
	SBC.b $12,x
	BCC.b CODE_13ABC7
	CMP.w #$0007
	BCC.b CODE_13ABC7
	LDA.b $10,x
	SEC
	SBC.w #$000C
	JSR.w CODE_1384E4
	INY
	INY
	ORA.b [$8E],y
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$4000
	BNE.b CODE_13ABC9
CODE_13ABC7:
	CLC
	RTS

CODE_13ABC9:
	SEC
	RTS

CODE_13ABCB:
	LDX.w #$01FE
	LDA.w #$0000
CODE_13ABD1:
	STA.w $0D9C,x
	DEX
	DEX
	BPL.b CODE_13ABD1
	LDA.w $0994
	STA.b $25
	LDY.w $0992
	LDX.w #$0000
CODE_13ABE3:
	LDA.w $0000,y
	STA.w $099C,x
	LDA.w $0002,y
	STA.w $0B9C,x
	LDA.w $0004,y
	STA.w $0D9C,x
	LDA.w $0006,y
	STA.w $0F9C,x
	INX
	INX
	TYA
	CLC
	ADC.w #$0008
	TAY
	DEC.b $25
	BNE.b CODE_13ABE3
	LDA.w $0994
	LSR
	LSR
	LSR
	INC
	STA.w $099A
	LDA.w $0994
	DEC
	ASL
	STA.w $0996
	STA.w $0998
	RTS

CODE_13AC1D:
	LDY.w #$0026
	LDA.w #$0000
CODE_13AC23:
	LDX.w DATA_148000,y
	BIT.b $00,x
	BMI.b CODE_13AC2B
	INC
CODE_13AC2B:
	DEY
	DEY
	BNE.b CODE_13AC23
	STA.b $29
	LDA.b $74
	SEC
	SBC.w #$0080
	STA.b $2D
	LDA.b $76
	SEC
	SBC.w #$0080
	STA.b $2F
	LDA.w $099A
	STA.b $2B
	LDY.w $0998
CODE_13AC49:
	LDA.w $0D9C,y
	BPL.b CODE_13AC7D
	LDA.b $29
	BEQ.b CODE_13AC7D
	LDA.w $099C,y
	SEC
	SBC.b $2D
	CMP.w #$0200
	BCS.b CODE_13AC7D
	STA.b $31
	LDA.w $0B9C,y
	SEC
	SBC.b $2F
	CMP.w #$0200
	BCS.b CODE_13AC7D
	STA.b $33
	LDA.w $0D9C,y
	STA.b $25
	LDA.w $0F9C,y
	STA.b $27
	STY.b $3F
	JSR.w CODE_1386F1
	LDY.b $3F
CODE_13AC7D:
	DEY
	DEY
	BPL.b CODE_13AC84
	LDY.w $0996
CODE_13AC84:
	DEC.b $2B
	BNE.b CODE_13AC49
	STY.w $0998
	RTS

CODE_13AC8C:
	LDY.w #$0026
CODE_13AC8F:
	LDX.w DATA_148000,y
	BIT.b $00,x
	BPL.b CODE_13AC9C
	DEY
	DEY
	BNE.b CODE_13AC8F
	SEC
	RTS

CODE_13AC9C:
	CLC
	RTS

CODE_13AC9E:
	LDY.b $3F
	LDA.w $099C,y
	STA.b $10,x
	LDA.w $0B9C,y
	STA.b $12,x
	STY.b $0E,x
	LDA.w $0D9C,y
	AND.w #$7FFF
	STA.w $0D9C,y
	DEC.b $29
	RTS

CODE_13ACB8:
	JSR.w CODE_13AC8C
	JSR.w CODE_138535
	LDY.b $27
	LDA.w $0000,y
	STA.b $00,x
	LDA.w $0002,y
	JSR.w CODE_1383E4
	LDA.w $0004,y
	STA.b $08,x
	LDA.w $0006,y
	STA.b $1E,x
	LDA.w $0008,y
	STA.b $20,x
	JMP.w CODE_13AC9E

CODE_13ACDD:
	LDA.b $31
	SEC
	SBC.w #$0080
	CMP.w #$0100
	BCS.b CODE_13ACF3
	LDA.b $33
	SEC
	SBC.w #$0080
	CMP.w #$00F0
	BCC.b CODE_13AD18
CODE_13ACF3:
	JSR.w CODE_13AC8C
	JSR.w CODE_138535
	LDY.b $27
	LDA.w $0000,y
	STA.b $00,x
	LDA.w $0002,y
	JSR.w CODE_1383E4
	LDA.w $0004,y
	STA.b $08,x
	LDA.w $0006,y
	STA.b $06,x
	LDA.w $0008,y
	STA.b $04,x
	JMP.w CODE_13AC9E

CODE_13AD18:
	RTS

CODE_13AD19:
	LDA.b $0E,x
	JSR.w CODE_1383F1
	JSR.w CODE_13C989
	BCS.b CODE_13AD26
	JMP.w CODE_13C8D3

CODE_13AD26:
	LDA.b $10,x
	SEC
	SBC.b $74
	STA.b $10,x
	LDA.b $12,x
	SEC
	SBC.b $76
	STA.b $12,x
	LDA.b $0C,x
	ORA.w #$4000
	STA.b $0C,x
	LDA.b $20,x
	BPL.b CODE_13AD4C
	LDA.w #CODE_13AD7F
	STA.b $00,x
	LDA.w #$0090
	LDY.w #$0030
	BRA.b CODE_13AD57

CODE_13AD4C:
	LDA.w #CODE_13AD6D
	STA.b $00,x
	LDA.w #$0020
	LDY.w #$0030
CODE_13AD57:
	STA.b $27
	STY.b $29
	LDA.w #$2702
	JSR.w CODE_13A43F
	LDA.b $20,x
	SEP.b #$20
	STA.b $0C,x
	REP.b #$20
	JSR.w CODE_139ECC
	RTS

CODE_13AD6D:
	JSR.w CODE_13AD91
	SEP.b #$20
	LDA.b $0C,x
	REP.b #$20
	AND.w #$00FF
	JSR.w CODE_138C2B
	JMP.w CODE_13851D

CODE_13AD7F:
	JSR.w CODE_13AD91
	SEP.b #$20
	LDA.b $0C,x
	REP.b #$20
	AND.w #$00FF
	JSR.w CODE_138C8F
	JMP.w CODE_13851D

CODE_13AD91:
	JSR.w CODE_1383F1
	LDA.w #$0004
	JSR.w CODE_139F20
	LDA.b $12,x
	CMP.w #$0030
	BCC.b CODE_13ADA2
	PLA
CODE_13ADA2:
	RTS

CODE_13ADA3:
	JSR.w CODE_1383F1
	LDA.b $04,x
	AND.w #$0003
	BNE.b CODE_13ADAF
	DEC.b $12,x
CODE_13ADAF:
	DEC.b $04,x
	BNE.b CODE_13ADB6
	JMP.w CODE_13851D

CODE_13ADB6:
	JSR.w CODE_13C989
	BCC.b CODE_13ADC3
	LDA.w #$8007
	STA.b $20,x
	JMP.w CODE_13AD26

CODE_13ADC3:
	RTS

CODE_13ADC4:
	ORA.w #$8000
	STA.b $20,x
	LDA.w #$0078
	STA.b $04,x
	LDA.w #CODE_13ADA3
	STA.b $00,x
	LDA.w #DATA_14A888
	JSR.w CODE_1383E4
	RTS

CODE_13ADDA:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13ADEA
	LDA.w #CODE_13AE47
	LDY.w #DATA_14AF57
	JMP.w CODE_13AFE7

CODE_13ADEA:
	JSR.w CODE_13AAF2
	BNE.b CODE_13AE1C
	LDA.b $12,x
	SEC
	SBC.w $0632
	CMP.w #$FFE0
	BCS.b CODE_13ADFF
	CMP.w #$0020
	BCS.b CODE_13AE1C
CODE_13ADFF:
	LDA.b $16,x
	CMP.w #$005E
	BNE.b CODE_13AE1C
	LDA.b $0C,x
	AND.w #$0003
	BNE.b CODE_13AE1C
	LDY.w #$0006
	JSR.w CODE_13C9B7
	BCS.b CODE_13AE1C
	LDA.w #$0003
	ORA.b $0C,x
	STA.b $0C,x
CODE_13AE1C:
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	BCS.b CODE_13AE44
	LDA.b $0C,x
	AND.w #$0001
	BNE.b CODE_13AE44
	JSR.w CODE_1383F1
	LDA.w #$0001
	JSR.w CODE_13AACB
	DEC.b $20,x
	BNE.b CODE_13AE44
	LDA.b $1E,x
	ASL
	STA.b $20,x
	LDA.b $14,x
	EOR.w #$4000
	STA.b $14,x
CODE_13AE44:
	JMP.w CODE_13C8D3

CODE_13AE47:
	LDA.w #CODE_13ADDA
	STA.b $00,x
	LDA.w #DATA_14A7D2
	JSR.w CODE_1383E4
	RTS

CODE_13AE53:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13AE63
	LDA.w #CODE_13AE53
	LDY.w #DATA_14AF57
	JMP.w CODE_13AFE7

CODE_13AE63:
	JSR.w CODE_1383F1
	JSR.w CODE_13AAF2
	BEQ.b CODE_13AEAE
	LDA.b $10,x
	SEC
	SBC.w $0630
	BCS.b CODE_13AE77
	EOR.w #$FFFF
	INC
CODE_13AE77:
	CMP.w #$0048
	BCS.b CODE_13AE83
	LDA.b $12,x
	CMP.w $0632
	BNE.b CODE_13AEAE
CODE_13AE83:
	LDA.b $14,x
	STA.b $25
	JSR.w CODE_13AAD9
	LDY.w #$0000
	LDA.w #$0010
	BIT.b $14,x
	BVC.b CODE_13AE97
	LDA.w #$FFF0
CODE_13AE97:
	JSR.w CODE_13AB52
	AND.w #$4000
	BEQ.b CODE_13AEAA
	LDA.w #CODE_13AF11
	STA.b $00,x
	LDA.w #DATA_14A7D2
	JMP.w CODE_1383E4

CODE_13AEAA:
	LDA.b $25
	STA.b $14,x
CODE_13AEAE:
	LDA.b $18,x
	BNE.b CODE_13AEBE
	LDY.w #$0006
	JSR.w CODE_13C9B7
	LDA.w #DATA_14A7EA
	JSR.w CODE_1383E4
CODE_13AEBE:
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	LDA.b $16,x
	CMP.w #$0060
	BNE.b CODE_13AF0E
	LDA.b $18,x
	CMP.w #DATA_14A7FA
	BNE.b CODE_13AF0E
	JSR.w CODE_13AAF2
	BNE.b CODE_13AF0E
	LDA.w $0632
	SEC
	SBC.b $12,x
	CMP.w #$0020
	BCC.b CODE_13AF0E
	CMP.w #$00C8
	BCS.b CODE_13AF0E
	STA.b $25
	BIT.b $14,x
	BVS.b CODE_13AEF5
	LDA.w $0630
	SEC
	SBC.b $10,x
	BRA.b CODE_13AEFB

CODE_13AEF5:
	LDA.b $10,x
	SEC
	SBC.w $0630
CODE_13AEFB:
	SEC
	SBC.b $25
	CMP.w #$FFE0
	BCS.b CODE_13AF08
	CMP.w #$0020
	BCS.b CODE_13AF0E
CODE_13AF08:
	LDA.w #DATA_14A7FE
	JSR.w CODE_1383E4
CODE_13AF0E:
	JMP.w CODE_13C8D3

CODE_13AF11:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13AF21
	LDA.w #CODE_13AF11
	LDY.w #DATA_14AF57
	JMP.w CODE_13AFE7

CODE_13AF21:
	LDY.w #$0000
	LDA.w #$0010
	BIT.b $14,x
	BVC.b CODE_13AF2E
	LDA.w #$FFF0
CODE_13AF2E:
	JSR.w CODE_13AB52
	AND.w #$4000
	BEQ.b CODE_13AF48
	JSR.w CODE_1383F1
	LDA.w #$0003
	JSR.w CODE_13AACB
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	JMP.w CODE_13C8D3

CODE_13AF48:
	LDA.w #DATA_14A7F6
	JSR.w CODE_1383E4
	LDA.w #CODE_13AE53
	STA.b $00,x
	RTS

CODE_13AF54:
	JSR.w CODE_1383F1
	LDA.b $18,x
	BNE.b CODE_13AF7A
	LDA.w #$0002
	LDY.w #$FFFE
	JSR.w CODE_13B058
	LDY.b $0E,x
	LDA.w $0000,y
	CMP.w #CODE_13ADDA
	BNE.b CODE_13AF77
	LDA.w $000C,y
	AND.w #$FFFE
	STA.w $000C,y
CODE_13AF77:
	JMP.w CODE_13851D

CODE_13AF7A:
	RTS

CODE_13AF7B:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13AF8B
	LDA.w #CODE_13AFDB
	LDY.w #DATA_14AF57
	JMP.w CODE_13AFE7

CODE_13AF8B:
	JSR.w CODE_13AAF2
	BNE.b CODE_13AFB7
	LDA.b $12,x
	SEC
	SBC.w $0632
	CMP.w #$FFC0
	BCS.b CODE_13AFA0
	CMP.w #$0040
	BCS.b CODE_13AFB7
CODE_13AFA0:
	LDA.b $16,x
	CMP.w #$0064
	BNE.b CODE_13AFB7
	LDA.b $02
	AND.w #$000F
	BNE.b CODE_13AFB7
	LDA.w #$0007
	LDY.w #$FFEE
	JSR.w CODE_13B058
CODE_13AFB7:
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	BCS.b CODE_13AFD8
	JSR.w CODE_1383F1
	LDA.w #$0001
	JSR.w CODE_13AACB
	DEC.b $20,x
	BNE.b CODE_13AFD8
	LDA.b $1E,x
	ASL
	STA.b $20,x
	LDA.b $14,x
	EOR.w #$4000
	STA.b $14,x
CODE_13AFD8:
	JMP.w CODE_13C8D3

CODE_13AFDB:
	LDA.w #CODE_13AF7B
	STA.b $00,x
	LDA.w #DATA_14A7BA
	JSR.w CODE_1383E4
	RTS

CODE_13AFE7:
	STA.b $02,x
	STY.b $0A,x
CODE_13AFEB:
	LDA.b $08,x
	BNE.b CODE_13B00C
	LDY.b $0A,x
	JSR.w CODE_138C04
	STZ.b $06,x
	LDA.b $24,x
	CLC
	ADC.w #$0020
	STA.b $12,x
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.w #CODE_13B9EC
	STA.b $00,x
	JMP.w CODE_1383F1

CODE_13B00C:
	LDY.w #DATA_14AF3B
	JSR.w CODE_138C04
	LDA.w #$0A02
	JSR.w CODE_13A43F
	LDA.w #CODE_13B02F
	CMP.b $00,x
	BEQ.b CODE_13B025
	STA.b $00,x
	LDA.b $14,x
	STA.b $04,x
CODE_13B025:
	STZ.b $1A,x
	LDA.b $0C,x
	AND.w #$7FFF
	STA.b $0C,x
	RTS

CODE_13B02F:
	LDA.b $0C,x
	AND.w #$8000
	BNE.b CODE_13AFEB
	INC.b $1A,x
	LDY.b $1A,x
	TYA
	LSR
	LSR
	LSR
	LDA.b $04,x
	BCC.b CODE_13B048
	AND.w #$C000
	ORA.w #$2200
CODE_13B048:
	STA.b $14,x
	CPY.w #$0010
	BCC.b CODE_13B057
	LDA.b $02,x
	STA.b $00,x
	LDA.b $04,x
	STA.b $14,x
CODE_13B057:
	RTS

CODE_13B058:
	BIT.b $14,x
	BVC.b CODE_13B060
	EOR.w #$FFFF
	INC
CODE_13B060:
	STA.b $27
	STY.b $29
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13B099
	LDA.w #$0502
	JSR.w CODE_13A43F
	TYX
	LDA.b $10,x
	CLC
	ADC.b $27
	STA.b $10,x
	LDA.b $12,x
	CLC
	ADC.b $29
	STA.b $12,x
	LDA.w $0630
	STA.b $27
	LDA.w $0632
	SEC
	SBC.w #$0018
	STA.b $29
	JSR.w CODE_139EB2
	BCS.b CODE_13B099
	LDA.w #CODE_13B6F0
	STA.b $00,x
CODE_13B099:
	LDX.b $5D
	RTS

CODE_13B09C:
	LDA.b $10,x
	LSR
	LSR
	LSR
	AND.w #$FFFE
	STA.b $25
	LDA.b $12,x
	LSR
	LSR
	LSR
	LSR
CODE_13B0AC:
	LDX.w $11D4
	CMP.w $11D4
	BCC.b CODE_13B0B7
	PHA
	TXA
	PLX
CODE_13B0B7:
	TAY
	JSR.w CODE_139B48
	STA.b $27
	CLC
	ADC.b $25
	TAY
CODE_13B0C1:
	LDA.w #$0000
	STA.b [$86],y
	LDA.b $27
	ASL
	ASL
	ADC.b $25
	ADC.b $25
	TAY
	LDA.w #$0000
	STA.b [$8E],y
	INY
	INY
	STA.b [$8E],y
	TYA
	CLC
	ADC.b $82
	TAY
	LDA.w #$0000
	STA.b [$8E],y
	DEY
	DEY
	STA.b [$8E],y
	LDX.b $5D
	SEC
	RTS

CODE_13B0EA:
	LDA.b $10,x
	LSR
	LSR
	LSR
	AND.w #$FFFE
	STA.b $25
	LDA.b $12,x
	LSR
	LSR
	LSR
	LSR
	LDX.w $11D4
	CMP.w $11D4
	BCC.b CODE_13B105
	PHA
	TXA
	PLX
CODE_13B105:
	TAY
	JSR.w CODE_139B48
	STA.b $27
	CLC
	ADC.b $25
	TAY
	LDA.b [$86],y
	CLC
	ADC.w #$0002
	TAX
	AND.w #$03FF
	CMP.w #$034C
	BEQ.b CODE_13B0C1
	LDA.w #$0A02
	JSR.w CODE_13A43F
	TXA
	STA.b [$86],y
	LDX.b $5D
	CLC
	RTS

CODE_13B12B:
	PHA
	JSR.w CODE_13C989
	PLA
	BCC.b CODE_13B146
	JSR.w CODE_138C2B
	STZ.b $0C,x
	STZ.b $06,x
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.w #CODE_13B9EC
	STA.b $00,x
	SEC
	RTS

CODE_13B146:
	CLC
	RTS

CODE_13B148:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13B158
	LDA.w #CODE_13B148
	LDY.w #DATA_14AF5E
	JMP.w CODE_13AFE7

CODE_13B158:
	JSR.w CODE_1383F1
	LDA.b $18,x
	BNE.b CODE_13B185
	JSR.w CODE_13AAF2
	BEQ.b CODE_13B174
	LDA.w #DATA_14A742
	BIT.b $14,x
	BVC.b CODE_13B16E
	LDA.w #DATA_14A750
CODE_13B16E:
	JSR.w CODE_1383E4
	JMP.w CODE_13B185

CODE_13B174:
	DEC.b $20,x
	BNE.b CODE_13B185
	LDA.b $1E,x
	STA.b $20,x
	LDA.w #$0006
	LDY.w #$FFF2
	JSR.w CODE_13B058
CODE_13B185:
	LDA.w #$FFEC
	JSR.w CODE_13B12B
	JMP.w CODE_13C8D3

CODE_13B18E:
	STZ.b $16,x
	DEC.b $04,x
	BNE.b CODE_13B199
	LDA.w #CODE_13B19A
	STA.b $00,x
CODE_13B199:
	RTS

CODE_13B19A:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13B1AA
	LDA.w #CODE_13B19A
	LDY.w #DATA_14AF49
	JMP.w CODE_13AFE7

CODE_13B1AA:
	JSR.w CODE_1383F1
	LDA.w #$FFEC
	JSR.w CODE_13B12B
	LDA.b $02,x
	BEQ.b CODE_13B1BC
	JSR.w ($0002,x)
	BRA.b CODE_13B226

CODE_13B1BC:
	LDY.b $12,x
	INY
	LDA.b $10,x
	SEC
	SBC.w #$0008
	JSR.w CODE_1384E4
	INY
	INY
	ORA.b [$8E],y
	BIT.w #$4000
	BNE.b CODE_13B1D6
	JSR.w CODE_13B25A
	BRA.b CODE_13B226

CODE_13B1D6:
	LDY.w #$0000
	LDA.w #$0008
	BIT.b $06,x
	BVC.b CODE_13B1E3
	LDA.w #$FFF8
CODE_13B1E3:
	JSR.w CODE_13AB52
	AND.w #$4000
	BNE.b CODE_13B1EE
	JSR.w CODE_13B230
CODE_13B1EE:
	LDA.b $10,x
	SEC
	SBC.b $74
	BCC.b CODE_13B226
	CMP.w #$0100
	BCS.b CODE_13B226
	BIT.b $06,x
	BPL.b CODE_13B205
	CMP.w #$0020
	BCC.b CODE_13B20A
	BCS.b CODE_13B226
CODE_13B205:
	CMP.w #$00E0
	BCC.b CODE_13B226
CODE_13B20A:
	LDA.w $1206
	BEQ.b CODE_13B212
	JMP.w CODE_13B2CB

CODE_13B212:
	LDA.w #CODE_13B392
	STA.b $00,x
	LDA.w #$0004
	STA.b $08,x
	LDA.w #DATA_14A786
	JSR.w CODE_1383E4
	JSR.w CODE_13AAD9
	RTS

CODE_13B226:
	LDA.b $06,x
	CLC
	ADC.b $10,x
	STA.b $10,x
	JMP.w CODE_13C8D3

CODE_13B230:
	LDA.w $0632
	SEC
	SBC.b $12,x
	BCC.b CODE_13B23D
	CMP.w #$0028
	BCS.b CODE_13B259
CODE_13B23D:
	LDA.w #$0000
	LDY.b $28,x
	JSR.w CODE_13AB52
	BIT.w #$8000
	BNE.b CODE_13B259
	LDA.w #$FD00
	STA.b $1E,x
	LDA.w #$0050
	STA.b $20,x
	LDA.w #CODE_13B288
	STA.b $02,x
CODE_13B259:
	RTS

CODE_13B25A:
	LDA.w #$0200
	STA.b $1E,x
	LDA.w #$0028
	STA.b $20,x
	LDA.w #CODE_13B26A
	STA.b $02,x
	RTS

CODE_13B26A:
	JSR.w CODE_13B288
	LDA.b $02,x
	BNE.b CODE_13B284
	LDA.w #$0001
	LDY.b $10,x
	CPY.w $0630
	BCC.b CODE_13B27E
	LDA.w #$FFFF
CODE_13B27E:
	CMP.b $06,x
	BEQ.b CODE_13B284
	STA.b $06,x
CODE_13B284:
	PLA
	JMP.w CODE_13C8D3

CODE_13B288:
	JSR.w CODE_13AA9C
	TAY
	CLC
	ADC.b $12,x
	STA.b $12,x
	TYA
	BMI.b CODE_13B2B7
	LDA.b $12,x
	SEC
	SBC.b $76
	BCC.b CODE_13B2A8
	CMP.w #$0100
	BCC.b CODE_13B2A8
	LDA.b $74
	SEC
	SBC.w #$0200
	STA.b $10,x
CODE_13B2A8:
	JSR.w CODE_13AB9D
	BCC.b CODE_13B2B6
	LDA.b $12,x
	AND.w #$FFF8
	STA.b $12,x
	STZ.b $02,x
CODE_13B2B6:
	RTS

CODE_13B2B7:
	LDA.w #$0000
	LDY.w #$FFD8
	JSR.w CODE_13AB52
	BIT.w #$8000
	BEQ.b CODE_13B2CA
	LDA.w #$0200
	STA.b $1E,x
CODE_13B2CA:
	RTS

CODE_13B2CB:
	LDA.w #CODE_13B2FF
	STA.b $00,x
	STZ.b $04,x
	JSR.w CODE_13D998
	AND.w #$000E
	STA.b $06,x
	LDA.w #$0003
	STA.b $08,x
	LDA.w #DATA_14A776
	JSR.w CODE_1383E4
	JSR.w CODE_13B75A
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13B2FE
	TYX
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDX.b $5D
CODE_13B2FE:
	RTS

CODE_13B2FF:
	JSR.w CODE_1383F1
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13B312
	LDA.w #CODE_13B382
	LDY.w #DATA_14AF49
	JMP.w CODE_13AFE7

CODE_13B312:
	LDA.w #$FFEC
	JSR.w CODE_13B12B
	INC.b $04,x
	LDA.b $04,x
	BIT.w #$0007
	BNE.b CODE_13B32F
	LSR
	LSR
	AND.w #$003E
	TAY
	LDA.w DATA_14AD85,y
	CLC
	ADC.b $10,x
	STA.b $10,x
CODE_13B32F:
	LDA.b $04,x
	AND.w #$003F
	SEC
	SBC.w #$0038
	BCC.b CODE_13B346
	LSR
	LSR
	LDA.w #$2800
	BCS.b CODE_13B344
	LDA.w #$2C00
CODE_13B344:
	STA.b $14,x
CODE_13B346:
	LDA.b $04,x
	BIT.w #$003F
	BNE.b CODE_13B360
	LDY.w #$FFF8
	AND.w #$0040
	BEQ.b CODE_13B35D
	LDA.w #$0000
	JSR.w CODE_13B79B
	BRA.b CODE_13B360

CODE_13B35D:
	JSR.w CODE_13B7EA
CODE_13B360:
	LDY.b $06,x
	LDA.b $04,x
	AND.w DATA_14AD75,y
	BNE.b CODE_13B37F
	DEC.b $12,x
	LDA.w #$FFFF
	LDY.b $10,x
	CPY.w $0630
	BEQ.b CODE_13B37F
	BCS.b CODE_13B37A
	LDA.w #$0001
CODE_13B37A:
	CLC
	ADC.b $10,x
	STA.b $10,x
CODE_13B37F:
	JMP.w CODE_13C8D3

CODE_13B382:
	STZ.b $04,x
	LDA.w #CODE_13B2FF
	STA.b $00,x
	LDA.w #$2800
	STA.b $14,x
	RTS

CODE_13B38F:
	JMP.w CODE_13851D

CODE_13B392:
	JSR.w CODE_13B572
	LDA.w #CODE_13B3A0
	STA.b $00,x
	JSR.w CODE_13B500
	STZ.w $1208
CODE_13B3A0:
	INC.w $1204
	INC.b $04,x
	JSR.w CODE_1383F1
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13B3B8
	LDA.w #CODE_13B3C7
	LDY.w #DATA_14AF73
	JMP.w CODE_13AFE7

CODE_13B3B8:
	JSR.w CODE_13B4AE
	JSR.w ($0002,x)
	LDA.w #$FFD8
	JSR.w CODE_13B12B
	JMP.w CODE_13C8D3

CODE_13B3C7:
	LDA.w #DATA_14A786
	JSR.w CODE_1383E4
	LDA.w #CODE_13B392
	STA.b $00,x
	STZ.b $02,x
	STZ.b $04,x
	JSR.w CODE_1383F1
	JSR.w CODE_13AAD9
	JSR.w CODE_13B552
	RTS

CODE_13B3E0:
	JSR.w CODE_13B572
	BEQ.b CODE_13B3E8
	JMP.w CODE_13B500

CODE_13B3E8:
	JSR.w CODE_13AAD9
	LDY.w #$0001
	LDA.b $04,x
	LSR
	BCS.b CODE_13B3F4
	INY
CODE_13B3F4:
	TYA
	JSR.w CODE_13AACB
	RTS

CODE_13B3F9:
	LDA.w #$0000
	TAY
	JSR.w CODE_13AB52
	BIT.w #$C000
	BEQ.b CODE_13B40E
	LDA.b $12,x
	AND.w #$FFF8
	STA.b $12,x
	BRA.b CODE_13B41F

CODE_13B40E:
	LDA.b $12,x
	SEC
	SBC.w $0632
	BCS.b CODE_13B41A
	EOR.w #$FFFF
	INC
CODE_13B41A:
	CMP.w #$0010
	BCC.b CODE_13B427
CODE_13B41F:
	JSR.w CODE_13B572
	BEQ.b CODE_13B427
	JMP.w CODE_13B500

CODE_13B427:
	DEC.b $20,x
	BMI.b CODE_13B43E
	LDY.b $1E,x
	LDA.b $10,x
	CLC
	ADC.w DATA_14ADD9,y
	STA.b $10,x
	LDA.b $12,x
	CLC
	ADC.w DATA_14ADE9,y
	STA.b $12,x
	RTS

CODE_13B43E:
	JSR.w CODE_13B572
	JMP.w CODE_13B500

CODE_13B444:
	LDA.b $04,x
	LSR
	BCC.b CODE_13B451
	LDA.b $1E,x
	CLC
	ADC.b $12,x
	STA.b $12,x
	RTS

CODE_13B451:
	AND.w #$000F
	BNE.b CODE_13B469
	STZ.b $1E,x
	LDA.w #$FFFF
	LDY.b $12,x
	CPY.w $0632
	BEQ.b CODE_13B469
	BCS.b CODE_13B467
	LDA.w #$0001
CODE_13B467:
	STA.b $1E,x
CODE_13B469:
	RTS

CODE_13B46A:
	JSR.w CODE_13AA9C
	CLC
	ADC.b $12,x
	STA.b $12,x
	LDA.b $12,x
	SEC
	SBC.b $76
	BCC.b CODE_13B484
	CMP.w #$0100
	BCC.b CODE_13B484
	LDY.w #$0006
	JMP.w CODE_13B500

CODE_13B484:
	JSR.w CODE_13AB9D
	BCC.b CODE_13B496
	LDA.b $12,x
	AND.w #$FFF8
	STA.b $12,x
	JSR.w CODE_13B572
	JSR.w CODE_13B500
CODE_13B496:
	RTS

CODE_13B497:
	JSR.w CODE_13B572
	BEQ.b CODE_13B49F
	JMP.w CODE_13B500

CODE_13B49F:
	LDY.w #$0001
	LDA.b $04,x
	LSR
	BCS.b CODE_13B4A8
	INY
CODE_13B4A8:
	TYA
	JSR.w CODE_13AACB
	RTS

CODE_13B4AD:
	RTS

CODE_13B4AE:
	INC.w $1208
	LDA.w $1208
	SEC
	SBC.w #$0060
	BCC.b CODE_13B4FB
	CMP.w #$0031
	BCS.b CODE_13B4FC
	AND.w #$000F
	BNE.b CODE_13B4FB
	LDY.w #$000A
	JSR.w CODE_13C9B7
	BCS.b CODE_13B4FB
	LDA.w #$2602
	JSR.w CODE_13A43F
	TYX
	LDA.b $12,x
	SEC
	SBC.w #$0010
	STA.b $12,x
	LDA.w #$000C
	JSR.w CODE_13AACB
	LDA.w #$0000
	BIT.b $14,x
	BVC.b CODE_13B4E9
	INC
CODE_13B4E9:
	STA.b $1E,x
	STZ.b $04,x
	LDA.w #$0014
	STA.b $20,x
	STA.b $02,x
	LDA.w #CODE_13B6F7
	STA.b $00,x
	LDX.b $5D
CODE_13B4FB:
	RTS

CODE_13B4FC:
	STZ.w $1208
	RTS

CODE_13B500:
	LDA.w DATA_14ADC5,y
	STA.b $02,x
	LDA.w DATA_14ADCF,y
	STA.b $25
	JMP.w ($0025)

CODE_13B50D:
	JSR.w CODE_13B552
	STZ.b $04,x
	JMP.w CODE_13AAD9

CODE_13B515:
	JSR.w CODE_13B552
	LDA.w #$0200
	STA.b $1E,x
	LDA.w #$0028
	STA.b $20,x
	RTS

CODE_13B523:
	JSR.w CODE_13B552
	LDA.w #$0002
	STA.b $1E,x
	JMP.w CODE_13AAD9

CODE_13B52E:
	LDA.b $0C,x
	AND.w #$0100
	BNE.b CODE_13B538
	JSR.w CODE_13B6E9
CODE_13B538:
	LDA.w #$0010
	STA.b $20,x
	JSR.w CODE_13AB09
	ASL
	STA.b $1E,x
	JMP.w CODE_13AAD9

CODE_13B546:
	JSR.w CODE_13D998
	AND.w #$000F
	ORA.w #$0020
	STA.b $04,x
	RTS

CODE_13B552:
	LDA.b $0C,x
	AND.w #$0100
	BEQ.b CODE_13B571
	LDA.b $06,x
	TAX
	LDA.b $00,x
	CMP.w #CODE_13B6C6
	BNE.b CODE_13B566
	JSR.w CODE_13851D
CODE_13B566:
	LDX.b $5D
	STZ.b $06,x
	LDA.b $0C,x
	AND.w #$FEFF
	STA.b $0C,x
CODE_13B571:
	RTS

CODE_13B572:
	STZ.b $25
	LDA.b $12,x
	CMP.w $0632
	BCS.b CODE_13B58C
	LDA.w #$0004
	STA.b $25
	JSR.w CODE_13AB9D
	BCC.b CODE_13B598
	LDA.w #$0002
	STA.b $25
	BRA.b CODE_13B598

CODE_13B58C:
	BNE.b CODE_13B593
	JSR.w CODE_13AB9D
	BCS.b CODE_13B598
CODE_13B593:
	LDA.w #$0006
	STA.b $25
CODE_13B598:
	LDY.b $25
	LDA.w DATA_14ADC5,y
	CMP.b $02,x
	RTS

CODE_13B5A0:
	JSR.w CODE_1383F1
	LDA.b $0C,x
	BIT.w #$8000
	BEQ.b CODE_13B5B3
	LDA.w #CODE_13B659
	LDY.w #DATA_14AF73
	JMP.w CODE_13AFE7

CODE_13B5B3:
	BIT.w #$0100
	BNE.b CODE_13B5BB
	JSR.w CODE_13B6E9
CODE_13B5BB:
	LDA.b $04,x
	BNE.b CODE_13B5EE
	INC.b $06,x
	LDA.b $06,x
	LSR
	BCS.b CODE_13B5D5
	LDA.w #CODE_13B66C
	STA.b $02,x
	LDA.w #$0020
	STA.b $04,x
	JSR.w CODE_13B68E
	BRA.b CODE_13B64B

CODE_13B5D5:
	LDA.b $20,x
	SEC
	SBC.b $10,x
	CMP.w #$0003
	BCS.b CODE_13B5F1
	JSR.w CODE_13D998
	LSR
	LDA.w #$0004
	BCS.b CODE_13B5EB
	LDA.w #$0006
CODE_13B5EB:
	JMP.w CODE_13B63B

CODE_13B5EE:
	JMP.w CODE_13B64B

CODE_13B5F1:
	LDA.b $10,x
	SEC
	SBC.w $0630
	STA.b $25
	LDA.b $12,x
	SEC
	SBC.w $0632
	STA.b $27
	SEC
	SBC.b $25
	BCS.b CODE_13B60A
	EOR.w #$FFFF
	INC
CODE_13B60A:
	CMP.w #$0020
	BCS.b CODE_13B622
	LDA.w #$0008
	LDY.b $25
	BPL.b CODE_13B619
	ORA.w #$0002
CODE_13B619:
	LDY.b $27
	BPL.b CODE_13B63B
	ORA.w #$0004
	BRA.b CODE_13B63B

CODE_13B622:
	LDY.w #$0000
	LDA.b $25
	BPL.b CODE_13B62C
	LDY.w #$0002
CODE_13B62C:
	CMP.b $27
	BCS.b CODE_13B63A
	LDY.w #$0004
	LDA.b $27
	BPL.b CODE_13B63A
	LDY.w #$0006
CODE_13B63A:
	TYA
CODE_13B63B:
	SEP.b #$20
	STA.b $0C,x
	REP.b #$20
	LDA.w #$0010
	STA.b $04,x
	LDA.w #CODE_13B66F
	STA.b $02,x
CODE_13B64B:
	JSR.w ($0002,x)
	DEC.b $04,x
	LDA.w #$FFD8
	JSR.w CODE_13B12B
	JMP.w CODE_13C8D3

CODE_13B659:
	LDA.w #DATA_14A79E
	JSR.w CODE_1383E4
	JSR.w CODE_13B552
	LDA.w #CODE_13B5A0
	STA.b $00,x
	STZ.b $04,x
	JSR.w CODE_1383F1
CODE_13B66C:
	JMP.w CODE_13AAD9

CODE_13B66F:
	LDA.b $0C,x
	AND.w #$00FF
	TAY
	LDA.w DATA_14ADF9,y
	CLC
	ADC.b $10,x
	CMP.b $1E,x
	BCC.b CODE_13B685
	CMP.b $20,x
	BCS.b CODE_13B685
	STA.b $10,x
CODE_13B685:
	LDA.w DATA_14AE09,y
	CLC
	ADC.b $12,x
	STA.b $12,x
	RTS

CODE_13B68E:
	LDY.w #$0014
	JSR.w CODE_13C9B7
	BCS.b CODE_13B6C5
	LDA.w #$1002
	JSR.w CODE_13A43F
	TYX
	LDA.b $12,x
	SEC
	SBC.w #$0009
	STA.b $12,x
	LDA.w #$000C
	JSR.w CODE_13AACB
	LDA.w #$0000
	BIT.b $14,x
	BVC.b CODE_13B6B3
	INC
CODE_13B6B3:
	STA.b $1E,x
	STZ.b $04,x
	LDA.w #$0014
	STA.b $20,x
	STA.b $02,x
	LDA.w #CODE_13B6F7
	STA.b $00,x
	LDX.b $5D
CODE_13B6C5:
	RTS

CODE_13B6C6:
	LDY.b $0E,x
	LDA.b $06,x
	CMP.w $0000,y
	BEQ.b CODE_13B6D5
	TXA
	CMP.w $0006,y
	BNE.b CODE_13B6E6
CODE_13B6D5:
	LDA.w $0010,y
	STA.b $10,x
	LDA.w $0012,y
	CLC
	ADC.w #$0010
	STA.b $12,x
	JMP.w CODE_1383F1

CODE_13B6E6:
	JMP.w CODE_13851D

CODE_13B6E9:
	LDY.w #$0008
	JSR.w CODE_13C9B7
	RTS

CODE_13B6F0:
	LDA.b $14,x
	AND.w #$3FFF
	STA.b $14,x
CODE_13B6F7:
	JSR.w CODE_1383F1
	LDA.b $10,x
	LDY.b $12,x
	JSR.w CODE_1384E4
	BIT.w #$8000
	BNE.b CODE_13B72D
	JSR.w CODE_13C989
	BCC.b CODE_13B71C
	LDY.w $11E2
	LDA.w DATA_14AC69,y
	JSR.w CODE_13A43F
	LDA.w #$FFFE
	JSR.w CODE_138C2B
	BRA.b CODE_13B721

CODE_13B71C:
	JSR.w CODE_13B738
	BCC.b CODE_13B724
CODE_13B721:
	JMP.w CODE_13851D

CODE_13B724:
	LDA.b $0C,x
	AND.w #$00FF
	JSR.w CODE_139F20
	RTS

CODE_13B72D:
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDA.w #DATA_14A826
	JMP.w CODE_1383E4

CODE_13B738:
	LDA.b $10,x
	SEC
	SBC.b $74
	CMP.w #$FFF0
	BCS.b CODE_13B747
	CMP.w #$0110
	BCS.b CODE_13B756
CODE_13B747:
	LDA.b $12,x
	SEC
	SBC.b $76
	CMP.w #$FFF0
	BCS.b CODE_13B758
	CMP.w #$0110
	BCC.b CODE_13B758
CODE_13B756:
	SEC
	RTS

CODE_13B758:
	CLC
	RTS

CODE_13B75A:
	LDA.w #$0702
	JSR.w CODE_13A43F
	LDX.w #$000E
CODE_13B763:
	PHX
	LDX.b $5D
	LDY.w #$0004
	JSR.w CODE_13C9B7
	PLX
	BCS.b CODE_13B798
	LDA.w $0012,y
	SEC
	SBC.w #$0010
	STA.w $0012,y
	LDA.w DATA_14AD4D,x
	STA.w $001E,y
	LDA.w DATA_14AD5D,x
	STA.w $0004,y
	LDA.w #$0014
	STA.w $0020,y
	STA.w $0002,y
	LDA.w #CODE_13B6F0
	STA.w $0000,y
	DEX
	DEX
	BPL.b CODE_13B763
CODE_13B798:
	LDX.b $5D
	RTS

CODE_13B79B:
	STA.b $3D
	STY.b $3F
	LDA.w #$0702
	JSR.w CODE_13A43F
	LDX.w #$000E
CODE_13B7A8:
	PHX
	LDX.b $5D
	LDY.w #$0004
	JSR.w CODE_13C9B7
	PLX
	BCS.b CODE_13B7E7
	LDA.w $0010,y
	CLC
	ADC.b $3D
	STA.w $0010,y
	LDA.w $0012,y
	CLC
	ADC.b $3F
	STA.w $0012,y
	LDA.w DATA_14AD4D,x
	STA.w $001E,y
	LDA.w DATA_14AD5D,x
	STA.w $0004,y
	LDA.w #$0014
	STA.w $0020,y
	STA.w $0002,y
	LDA.w #CODE_13B6F0
	STA.w $0000,y
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_13B7A8
CODE_13B7E7:
	LDX.b $5D
	RTS

CODE_13B7EA:
	STA.b $3D
	STY.b $3F
	LDA.w #$0702
	JSR.w CODE_13A43F
	LDX.w #$000C
CODE_13B7F7:
	PHX
	LDX.b $5D
	LDY.w #$0004
	JSR.w CODE_13C9B7
	PLX
	BCS.b CODE_13B836
	LDA.w $0010,y
	CLC
	ADC.b $3D
	STA.w $0010,y
	LDA.w $0012,y
	CLC
	ADC.b $3F
	STA.w $0012,y
	LDA.w DATA_14AD4D,x
	STA.w $001E,y
	LDA.w DATA_14AD5D,x
	STA.w $0004,y
	LDA.w #$0014
	STA.w $0020,y
	STA.w $0002,y
	LDA.w #CODE_13B6F0
	STA.w $0000,y
	DEX
	DEX
	DEX
	DEX
	BPL.b CODE_13B7F7
CODE_13B836:
	LDX.b $5D
	RTS

CODE_13B839:
	INC.w $120A
	JSR.w CODE_13AA9C
	STA.b $27
	CLC
	ADC.b $12,x
	STA.b $12,x
	LDY.w $11E2
	LDA.w DATA_14AD6D,y
	STA.b $25
	JSR.w CODE_1386F1
	LDA.b $1C,x
	JSR.w CODE_13AACB
	INC.b $18,x
	LDA.b $18,x
	AND.w #$0006
	CLC
	ADC.w #$0096
	STA.b $16,x
	LDA.b $1A,x
	BNE.b CODE_13B887
	LDA.w $11C2
	BIT.w #$4000
	BEQ.b CODE_13B885
	LDA.b $18,x
	AND.w #$0001
	BNE.b CODE_13B887
	LDA.b $20,x
	SEC
	SBC.w #$003C
	BCS.b CODE_13B881
	LDA.w #$0014
CODE_13B881:
	STA.b $20,x
	BRA.b CODE_13B887

CODE_13B885:
	DEC.b $1A,x
CODE_13B887:
	LDA.b $10,x
	SEC
	SBC.b $74
	BCC.b CODE_13B898
	CMP.w #$FFF0
	BCS.b CODE_13B898
	CMP.w #$0110
	BCS.b CODE_13B8A4
CODE_13B898:
	LDA.b $12,x
	SEC
	SBC.b $76
	BMI.b CODE_13B8A8
	CMP.w #$0110
	BCC.b CODE_13B8A8
CODE_13B8A4:
	JSR.w CODE_13851D
	RTS

CODE_13B8A8:
	JSR.w CODE_13BA08
	BCC.b CODE_13B8C8
	LDY.b $3F
	LDA.w $0008,y
	BNE.b CODE_13B90A
	LDA.w $0010,y
	STA.b $10,x
	LDA.w $0012,y
	SEC
	SBC.w #$0010
	STA.b $12,x
	LDA.w #$0007
	JMP.w CODE_13ADC4

CODE_13B8C8:
	LDA.b $10,x
	LDY.b $12,x
	JSR.w CODE_1384E4
	BIT.w #$1000
	BEQ.b CODE_13B8F6
	JSR.w CODE_13B0EA
	BCC.b CODE_13B90A
	LDA.b $10,x
	AND.w #$FFF0
	ORA.w #$0008
	STA.b $10,x
	LDA.b $12,x
	AND.w #$FFF0
	CLC
	ADC.w #$0010
	STA.b $12,x
	LDY.w #CODE_13B9EC
	LDA.w #DATA_14A91A
	BRA.b CODE_13B910

CODE_13B8F6:
	BIT.w #$8000
	BNE.b CODE_13B904
	LDY.b $27
	BMI.b CODE_13B91A
	BIT.w #$4000
	BEQ.b CODE_13B91A
CODE_13B904:
	LDA.w #$3602
	JSR.w CODE_13A43F
CODE_13B90A:
	LDY.w #CODE_13B9EC
CODE_13B90D:
	LDA.w #DATA_14A82A
CODE_13B910:
	STY.b $00,x
	JSR.w CODE_1383E4
	LDA.w #$2C00
	STA.b $14,x
CODE_13B91A:
	RTS

CODE_13B91B:
	LDA.b $12,x
	CMP.w $11FA
	BCC.b CODE_13B92F
	PLA
	LDA.w #$3602
	JSR.w CODE_13A43F
	LDY.w #CODE_13B9F7
	JMP.w CODE_13B90D

CODE_13B92F:
	RTS

CODE_13B930:
	LDA.w $11FA
	BPL.b CODE_13B93A
	CMP.w #$FFA0
	BCC.b CODE_13B971
CODE_13B93A:
	LDA.b $12,x
	SEC
	SBC.b $76
	BCC.b CODE_13B971
	CMP.w #$00F0
	BCS.b CODE_13B971
	ASL
	TAY
	LDA.w $1A50,y
	CLC
	ADC.w $11FA
	CLC
	ADC.w #$0060
	CMP.b $10,x
	BCC.b CODE_13B971
	LDA.w #$003C
	CLC
	ADC.w $11F8
	STA.w $11F8
	PLA
	LDA.w #$3602
	JSR.w CODE_13A43F
	LDY.w #CODE_13B9EC
	LDA.w #DATA_14A826
	JMP.w CODE_13B910

CODE_13B971:
	RTS

CODE_13B972:
	INC.w $120A
	JSR.w CODE_1383F1
	LDA.b $06,x
	CLC
	ADC.b $12,x
	STA.b $12,x
	LDA.w #$0004
	JSR.w CODE_13AACB
	LDA.b $10,x
	SEC
	SBC.b $74
	BCC.b CODE_13B996
	CMP.w #$FFF0
	BCS.b CODE_13B996
	CMP.w #$0110
	BCS.b CODE_13B9A2
CODE_13B996:
	LDA.b $12,x
	SEC
	SBC.b $76
	BMI.b CODE_13B9A5
	CMP.w #$0110
	BCC.b CODE_13B9A5
CODE_13B9A2:
	JMP.w CODE_13851D

CODE_13B9A5:
	JSR.w CODE_13BA08
	BCC.b CODE_13B9C0
	LDY.b $3F
	LDA.w $0008,y
	BNE.b CODE_13B9DB
	LDA.w $0010,y
	STA.b $10,x
	LDA.w $0012,y
	SEC
	SBC.w #$0010
	STA.b $12,x
	RTS

CODE_13B9C0:
	LDA.b $10,x
	LDY.b $12,x
	JSR.w CODE_1384E4
	BIT.w #$8000
	BNE.b CODE_13B9D5
	LDY.b $27
	BMI.b CODE_13B9EB
	BIT.w #$4000
	BEQ.b CODE_13B9EB
CODE_13B9D5:
	LDA.w #$3602
	JSR.w CODE_13A43F
CODE_13B9DB:
	LDY.w #CODE_13B9EC
	LDA.w #DATA_14A82A
	STY.b $00,x
	JSR.w CODE_1383E4
	LDA.w #$2C00
	STA.b $14,x
CODE_13B9EB:
	RTS

CODE_13B9EC:
	JSR.w CODE_1383F1
	LDA.b $18,x
	BNE.b CODE_13B9F6
	JSR.w CODE_13851D
CODE_13B9F6:
	RTS

CODE_13B9F7:
	LDA.w $11FA
	INC
	STA.b $12,x
	JSR.w CODE_1383F1
	LDA.b $18,x
	BNE.b CODE_13BA07
	JSR.w CODE_13851D
CODE_13BA07:
	RTS

CODE_13BA08:
	LDY.w #$0026
CODE_13BA0B:
	PHY
	LDA.w DATA_148000,y
	TAY
	LDA.w $0000,y
	BPL.b CODE_13BA62
	LDA.w $000C,y
	BIT.w #$8000
	BNE.b CODE_13BA62
	LDA.w $0008,y
	BEQ.b CODE_13BA62
	LDX.b $5D
	LDA.w $0022,y
	SEC
	SBC.b $22,x
	BCS.b CODE_13BA31
	TYX
	EOR.w #$FFFF
	INC
CODE_13BA31:
	CMP.b $26,x
	BCS.b CODE_13BA62
	LDX.b $5D
	LDA.w $0024,y
	SEC
	SBC.b $24,x
	BCS.b CODE_13BA44
	TYX
	EOR.w #$FFFF
	INC
CODE_13BA44:
	CMP.b $28,x
	BCS.b CODE_13BA62
	STY.b $3F
	LDA.w $0008,y
	SEC
	SBC.w #$0001
	STA.w $0008,y
	LDA.w $000C,y
	ORA.w #$8000
	STA.w $000C,y
	PLY
	LDX.b $5D
	SEC
	RTS

CODE_13BA62:
	PLY
	DEY
	DEY
	BNE.b CODE_13BA0B
	LDX.b $5D
	CLC
	RTS

CODE_13BA6B:
	JSR.w CODE_1383F1
	STZ.w $120E
	LDA.w #$0208
	STA.w $1210
	LDA.b $0C,x
	ORA.w #$8000
	STA.b $0C,x
	LDA.w #CODE_13BABA
	STA.b $00,x
	LDA.w #$00CE
	STA.b $04,x
	LDA.w #$017E
	STA.b $25
	LDA.w #$0002
	STA.b $27
	STZ.b $29
	STZ.b $2B
	LDY.w #$0002
CODE_13BA99:
	STY.b $27
	LDX.w #$017E
CODE_13BA9E:
	STX.b $25
	JSR.w CODE_139650
	LDX.b $25
	INX
	CPX.w #$0181
	BNE.b CODE_13BA9E
	LDY.b $27
	INY
	CPY.w #$0006
	BNE.b CODE_13BA99
	LDA.w #$0802
	JSR.w CODE_13A43F
	RTS

CODE_13BABA:
	DEC.b $04,x
	BEQ.b CODE_13BB28
	LDA.b $04,x
	AND.w #$001F
	BNE.b CODE_13BACB
	LDA.w #$0802
	JSR.w CODE_13A43F
CODE_13BACB:
	LDA.b $04,x
	LSR
	BCS.b CODE_13BADA
	AND.w #$0003
	ASL
	TAY
	LDA.w DATA_14947E,y
	STA.b $14,x
CODE_13BADA:
	JSR.w CODE_13D998
	AND.w #$0007
	BNE.b CODE_13BB27
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13BB27
	TYX
	LDA.w #DATA_14A826
	JSR.w CODE_1383E4
	JSR.w CODE_13D998
	AND.w #$003F
	EOR.w #$FFFF
	INC
	CLC
	ADC.b $12,x
	STA.b $12,x
	JSR.w CODE_13D998
	AND.w #$003F
	LSR
	BCS.b CODE_13BB0D
	EOR.w #$FFFF
	INC
CODE_13BB0D:
	CLC
	ADC.b $10,x
	STA.b $10,x
	LDA.w #CODE_13B9EC
	STA.b $00,x
	JSR.w CODE_13D998
	AND.w #$0007
	BNE.b CODE_13BB25
	LDA.w #$1902
	JSR.w CODE_13A43F
CODE_13BB25:
	LDX.b $5D
CODE_13BB27:
	RTS

CODE_13BB28:
	LDA.w #CODE_13BB4B
	STA.b $00,x
	LDA.b $1D
	ORA.w #$0001
	STA.b $1D
	LDA.w #$2A00
	STA.b $14,x
	STZ.b $06,x
	LDA.w #$0028
	STA.b $04,x
	LDA.b $0C,x
	AND.w #$7F00
	ORA.w #$0030
	STA.b $0C,x
	RTS

CODE_13BB4B:
	JSR.w CODE_13BC47
	JSR.w CODE_1383F1
	LDA.b $06,x
	BEQ.b CODE_13BB72
	BMI.b CODE_13BB88
	DEC.b $04,x
	BNE.b CODE_13BBCE
	LDA.w #$0000
	LSR.b $06,x
	BCS.b CODE_13BB63
	DEC
CODE_13BB63:
	STA.b $06,x
	ASL
	LDA.w #$0028
	BCC.b CODE_13BB6E
	LDA.w #$0010
CODE_13BB6E:
	STA.b $04,x
	BRA.b CODE_13BBCE

CODE_13BB72:
	LDA.b $10,x
	CMP.w $0630
	BEQ.b CODE_13BB9C
	LDA.w #$0001
	BCC.b CODE_13BB81
	LDA.w #$FFFF
CODE_13BB81:
	CLC
	ADC.b $10,x
	STA.b $10,x
	BRA.b CODE_13BB9C

CODE_13BB88:
	LDA.b $12,x
	CMP.w $0632
	BEQ.b CODE_13BB9C
	LDA.w #$0001
	BCC.b CODE_13BB97
	LDA.w #$FFFF
CODE_13BB97:
	CLC
	ADC.b $12,x
	STA.b $12,x
CODE_13BB9C:
	DEC.b $04,x
	BNE.b CODE_13BBCE
	LDA.b $06,x
	AND.w #$0001
	ORA.w #$0100
	STA.b $06,x
	LDA.w #DATA_149464
	JSR.w CODE_1383E4
	JSR.w CODE_13B75A
	LDA.b $0C,x
	AND.w #$00FF
	STA.b $04,x
	SEC
	SBC.w #$0004
	CMP.w #$0008
	BCC.b CODE_13BBCE
	STA.b $25
	LDA.b $0C,x
	AND.w #$FF00
	ORA.b $25
	STA.b $0C,x
CODE_13BBCE:
	RTS

CODE_13BBCF:
	JSR.w CODE_13851D
	LDA.b $1D
	ORA.w #$4000
	STA.b $1D
	RTS

CODE_13BBDA:
	DEC.b $04,x
	BEQ.b CODE_13BBCF
	LDA.b $04,x
	CMP.w #$0028
	BCC.b CODE_13BBFD
	BNE.b CODE_13BBEE
	STZ.w $11FE
	STZ.b $16,x
	BRA.b CODE_13BBFD

CODE_13BBEE:
	LDA.b $04,x
	LSR
	BCS.b CODE_13BBFD
	AND.w #$0003
	ASL
	TAY
	LDA.w DATA_14947E,y
	STA.b $14,x
CODE_13BBFD:
	JSR.w CODE_13D998
	AND.w #$0003
	BEQ.b CODE_13BC46
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13BC46
	TYX
	JSR.w CODE_13D998
	AND.w #$0006
	TAY
	LDA.w DATA_149486,y
	JSR.w CODE_1383E4
	JSR.w CODE_13D998
	AND.w #$003F
	EOR.w #$FFFF
	INC
	ADC.w #$000A
	CLC
	ADC.b $12,x
	STA.b $12,x
	JSR.w CODE_13D998
	AND.w #$001F
	LSR
	BCS.b CODE_13BC3A
	EOR.w #$FFFF
	INC
CODE_13BC3A:
	CLC
	ADC.b $10,x
	STA.b $10,x
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDX.b $5D
CODE_13BC46:
	RTS

CODE_13BC47:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13BC8E
	LDA.w #$3F02
	JSR.w CODE_13A43F
	LDA.b $08,x
	BNE.b CODE_13BC8F
CODE_13BC58:
	LDY.w #DATA_14AF96
	JSR.w CODE_138C04
	LDA.w #CODE_13BBDA
	STA.b $00,x
	LDA.w #$00F0
	STA.b $04,x
	LDY.w #$0026
CODE_13BC6B:
	LDX.w DATA_148000,y
	LDA.b $00,x
	BPL.b CODE_13BC88
	CPX.b $5D
	BEQ.b CODE_13BC88
	CMP.w #CODE_13B9EC
	BEQ.b CODE_13BC88
	STZ.b $06,x
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.w #CODE_13B9EC
	STA.b $00,x
CODE_13BC88:
	DEY
	DEY
	BNE.b CODE_13BC6B
	LDX.b $5D
CODE_13BC8E:
	RTS

CODE_13BC8F:
	LDA.w #$000E
	STA.b $04,x
	LDA.w #CODE_13BCC8
	STA.b $00,x
	LDY.w #DATA_14AF49
	JSR.w CODE_138C04
	LDA.b $08,x
	AND.w #$0007
	BNE.b CODE_13BCC1
	LDA.w #DATA_14946E
	JSR.w CODE_1383E4
	LDA.w #$0080
	STA.b $20,x
	LDA.w #$0064
	STA.b $1E,x
	LDA.w #CODE_13BD02
	STA.b $00,x
	LDA.w #$2A00
	STA.b $14,x
	RTS

CODE_13BCC1:
	LDA.b $0C,x
	AND.w #$7FFF
	STA.b $0C,x
CODE_13BCC8:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13BCDC
	LDA.w #$3F02
	JSR.w CODE_13A43F
	LDA.b $08,x
	BNE.b CODE_13BC8F
	JMP.w CODE_13BC58

CODE_13BCDC:
	DEC.b $04,x
	BEQ.b CODE_13BCED
	LDA.b $04,x
	LSR
	AND.w #$0006
	TAY
	LDA.w DATA_14947E,y
	STA.b $14,x
	RTS

CODE_13BCED:
	LDA.w #$0010
	STA.b $04,x
	LDA.w #$FFFF
	STA.b $06,x
	LDA.w #CODE_13BB4B
	STA.b $00,x
	LDA.w #$2A00
	STA.b $14,x
	RTS

CODE_13BD02:
	INC.b $47
	LDA.b $20,x
	LDY.b $1E,x
	JSR.w CODE_139ADD
	LDX.b $5D
	CLC
	ADC.w $0630
	STA.b $25
	LDA.b $20,x
	LDY.b $1E,x
	JSR.w CODE_139AD6
	LDX.b $5D
	CLC
	ADC.w $0632
	STA.b $27
	JSR.w CODE_13BD37
	BCC.b CODE_13BD36
	LDA.w #CODE_13BD84
	STA.b $00,x
	LDA.w #$0004
	STA.b $06,x
	LDA.w #$0010
	STA.b $04,x
CODE_13BD36:
	RTS

CODE_13BD37:
	LDY.w #$FFFE
	LDA.b $10,x
	SEC
	SBC.b $25
	BCS.b CODE_13BD4B
	CMP.w #$FFFA
	BCS.b CODE_13BD5A
	LDA.w #$0005
	BRA.b CODE_13BD53

CODE_13BD4B:
	CMP.w #$0006
	BCC.b CODE_13BD5A
	LDA.w #$FFFB
CODE_13BD53:
	CLC
	ADC.b $10,x
	STA.b $10,x
	BRA.b CODE_13BD5B

CODE_13BD5A:
	INY
CODE_13BD5B:
	LDA.b $12,x
	SEC
	SBC.b $27
	BCS.b CODE_13BD70
	CMP.w #$FFFA
	BCS.b CODE_13BD7F
	LDA.b $27
	BMI.b CODE_13BD75
	LDA.w #$0005
	BRA.b CODE_13BD78

CODE_13BD70:
	CMP.w #$0006
	BCC.b CODE_13BD7F
CODE_13BD75:
	LDA.w #$FFFB
CODE_13BD78:
	CLC
	ADC.b $12,x
	STA.b $12,x
CODE_13BD7D:
	CLC
	RTS

CODE_13BD7F:
	INY
	BNE.b CODE_13BD7D
	SEC
	RTS

CODE_13BD84:
	LDA.b $20,x
	LDY.b $1E,x
	JSR.w CODE_139ADD
	LDX.b $5D
	CLC
	ADC.w $0630
	STA.b $10,x
	LDA.b $20,x
	LDY.b $1E,x
	JSR.w CODE_139AD6
	LDX.b $5D
	CLC
	ADC.w $0632
	STA.b $12,x
	LDA.b $20,x
	CLC
	ADC.b $06,x
	AND.w #$00FF
	STA.b $20,x
	AND.w #$003F
	BNE.b CODE_13BDBE
	DEC.b $04,x
	BEQ.b CODE_13BDBF
	LDA.b $04,x
	AND.w #$0003
	BNE.b CODE_13BDBE
	ASL.b $06,x
CODE_13BDBE:
	RTS

CODE_13BDBF:
	LDA.w #CODE_13BDC7
	STA.b $00,x
	STZ.b $04,x
CODE_13BDC6:
	RTS

CODE_13BDC7:
	INC.b $04,x
	LDA.b $04,x
	AND.w #$000F
	BNE.b CODE_13BDD9
	LDA.w #$0000
	LDY.w #$FFE2
	JSR.w CODE_13B060
CODE_13BDD9:
	LDA.w #$17F8
	STA.b $25
	LDA.w #$005F
	STA.b $27
	JSR.w CODE_13BD37
	BCC.b CODE_13BDC6
	LDA.b $0C,x
	ORA.w #$8000
	STA.b $0C,x
	LDA.w #CODE_13BE89
	STA.b $00,x
	LDA.w #DATA_149474
	JSR.w CODE_1383E4
	LDA.b $08,x
	CMP.w #$000A
	BCS.b CODE_13BE04
	JSR.w CODE_13B75A
CODE_13BE04:
	LDA.w $1210
	STA.b $04,x
	SEC
	SBC.w #$0064
	BCS.b CODE_13BE12
	LDA.w #$0014
CODE_13BE12:
	STA.w $1210
	LDA.b $08,x
	CMP.w #$000A
	BCS.b CODE_13BE21
	JSR.w CODE_13BE2A
	BRA.b CODE_13BE40

CODE_13BE21:
	INC.w $120E
	LDA.w $120E
	LSR
	BCS.b CODE_13BE40
CODE_13BE2A:
	LDA.w #$0080
	STA.b $29
	LDA.w #$17B0
	LDY.w #$FFF0
	JSR.w CODE_13BE54
	LDA.w #$1840
	LDY.w #$0010
	BRA.b CODE_13BE54

CODE_13BE40:
	LDA.w #$0050
	STA.b $29
	LDA.w #$1760
	LDY.w #$FFF0
	JSR.w CODE_13BE54
	LDA.w #$1890
	LDY.w #$0010
CODE_13BE54:
	STA.b $27
	STY.b $2B
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13BE86
	TYX
	LDA.w #DATA_14A8D0
	JSR.w CODE_1383E4
	LDA.b $10,x
	CLC
	ADC.b $2B
	STA.b $10,x
	LDA.b $12,x
	SEC
	SBC.w #$0028
	STA.b $12,x
	LDA.b $27
	STA.b $06,x
	LDA.b $29
	STA.b $0A,x
	JSR.w CODE_139ECC
	LDA.w #CODE_13BEA2
	STA.b $00,x
CODE_13BE86:
	LDX.b $5D
	RTS

CODE_13BE89:
	JSR.w CODE_1383F1
	DEC.b $04,x
	BNE.b CODE_13BEA1
	LDA.w #CODE_13BCED
	STA.b $00,x
	LDA.w #$2A00
	STA.b $14,x
	LDA.b $0C,x
	AND.w #$7FFF
	STA.b $0C,x
CODE_13BEA1:
	RTS

CODE_13BEA2:
	JSR.w CODE_1383F1
	JSR.w CODE_139F1D
	LDA.b $10,x
	CMP.w #$1800
	BCS.b CODE_13BEB4
	CMP.b $06,x
	BCC.b CODE_13BEB8
CODE_13BEB3:
	RTS

CODE_13BEB4:
	CMP.b $06,x
	BCC.b CODE_13BEB3
CODE_13BEB8:
	STA.b $10,x
	LDA.b $0A,x
	STA.b $12,x
	LDA.w #CODE_13BECC
	STA.b $00,x
	STZ.b $04,x
	LDA.w #DATA_14A84C
	JSR.w CODE_1383E4
	RTS

CODE_13BECC:
	JSR.w CODE_1383F1
	LDA.b $10,x
	SEC
	SBC.b $74
	CMP.w #$FF90
	BCS.b CODE_13BEDE
	CMP.w #$0170
	BCS.b CODE_13BF0C
CODE_13BEDE:
	INC.b $04,x
	LDA.b $04,x
	CMP.w #$0080
	BEQ.b CODE_13BF0D
	AND.w #$001F
	BNE.b CODE_13BF0C
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13BF0C
	TYX
	LDA.w #$0000
	STA.b $0E,x
	INC
	STA.b $04,x
	STA.b $08,x
	STA.b $06,x
	LDA.w #DATA_14A75E
	JSR.w CODE_1383E4
	LDA.w #CODE_13B18E
	STA.b $00,x
CODE_13BF0C:
	RTS

CODE_13BF0D:
	JMP.w CODE_13851D

CODE_13BF10:
	JSR.w CODE_13AA9C
	CLC
	ADC.b $04,x
	STA.b $04,x
	CMP.w #$0080
	BCC.b CODE_13BF20
	JMP.w CODE_13851D

CODE_13BF20:
	RTS

CODE_13BF21:
	LDA.b $10,x
	STA.b $25
	LDA.b $12,x
	STA.b $27
	LDA.b $04,x
	STA.b $29
	LDA.b $06,x
	CLC
	ADC.w #$0002
	AND.w #$00FF
	STA.b $06,x
	STA.b $2F
	LDA.w #$39CE
	STA.b $2B
	LDA.w #$0004
	STA.b $2D
CODE_13BF44:
	LDA.b $29
	LDY.b $2F
	JSR.w CODE_139ADD
	STA.b $31
	LDA.b $29
	LDY.b $2F
	JSR.w CODE_139AD6
	STA.b $33
	JSR.w CODE_13BF99
	LDA.b $29
	CLC
	ADC.w #$0040
	AND.w #$00FF
	LDY.b $2F
	JSR.w CODE_139ADD
	STA.b $31
	LDA.b $29
	CLC
	ADC.w #$0040
	AND.w #$00FF
	LDY.b $2F
	JSR.w CODE_139AD6
	STA.b $33
	JSR.w CODE_13BF99
	LDA.b $29
	SEC
	SBC.w #$0004
	BCC.b CODE_13BF98
	STA.b $29
	LDA.b $2D
	EOR.b $02
	AND.w #$0007
	ASL
	XBA
	ORA.w #$31EC
	STA.b $2B
	DEC.b $2D
	BNE.b CODE_13BF44
CODE_13BF98:
	RTS

CODE_13BF99:
	LDA.b $25
	CLC
	ADC.b $31
	TAX
	LDA.b $27
	CLC
	ADC.b $33
	TAY
	JSR.w CODE_13C02F
	LDA.b $25
	SEC
	SBC.b $31
	TAX
	LDA.b $27
	SEC
	SBC.b $33
	TAY
	JMP.w CODE_13C02F

CODE_13BFB7:
	LDA.b $10,x
	STA.b $25
	LDA.b $12,x
	STA.b $27
	LDA.b $04,x
	STA.b $29
	LDA.w #$39CE
	STA.b $2B
	LDA.w #$0004
	STA.b $2D
CODE_13BFCD:
	LDX.b $25
	LDA.b $27
	SEC
	SBC.b $29
	TAY
	JSR.w CODE_13C02F
	LDA.b $25
	SEC
	SBC.b $29
	TAX
	LDA.b $29
	LSR
	LSR
	EOR.w #$FFFF
	INC
	CLC
	ADC.b $27
	TAY
	PHY
	JSR.w CODE_13C02F
	LDA.b $25
	CLC
	ADC.b $29
	TAX
	PLY
	JSR.w CODE_13C02F
	LDA.b $25
	SEC
	SBC.b $29
	TAX
	LDA.b $27
	CLC
	ADC.b $29
	TAY
	PHY
	JSR.w CODE_13C02F
	LDA.b $25
	CLC
	ADC.b $29
	TAX
	PLY
	JSR.w CODE_13C02F
	LDA.b $29
	SEC
	SBC.w #$0004
	BCC.b CODE_13C02E
	STA.b $29
	LDA.b $2D
	EOR.b $02
	AND.w #$0007
	ASL
	XBA
	ORA.w #$31EC
	STA.b $2B
	DEC.b $2D
	BNE.b CODE_13BFCD
CODE_13C02E:
	RTS

CODE_13C02F:
	TXA
	SEC
	SBC.b $74
	STA.b $5F
	TYA
	SEC
	SBC.b $76
	STA.b $65
	LDA.b $2B
	JMP.w CODE_139A71

CODE_13C040:
	JSR.w CODE_1383F1
	LDA.b $18,x
	BNE.b CODE_13C04A
	JMP.w CODE_13851D

CODE_13C04A:
	RTS

CODE_13C04B:
	INC.b $04,x
	LDA.b $04,x
	AND.w #$007F
	BNE.b CODE_13C062
	LDY.w #$0016
	JSR.w CODE_13C9B7
	BCS.b CODE_13C062
	LDA.w #$1502
	JSR.w CODE_13A43F
CODE_13C062:
	JMP.w CODE_13C8D3

CODE_13C065:
	LDA.w #$FFD8
	JSR.w CODE_13B12B
	BCS.b CODE_13C083
	JSR.w CODE_13AA9C
	STA.b $06,x
	CLC
	ADC.b $12,x
	STA.b $12,x
	BIT.b $06,x
	BMI.b CODE_13C083
	CMP.w #$0100
	BCC.b CODE_13C083
	JMP.w CODE_13851D

CODE_13C083:
	RTS

CODE_13C084:
	LDY.w #$00B8
	JSR.w CODE_13C921
	LDA.b $10,x
	SEC
	SBC.w #$0008
	STA.b $25
	LDA.b $12,x
	SEC
	SBC.w #$0010
	STA.b $27
	LDA.b $06,x
	STA.b $29
	INC.b $04,x
	LDA.b $04,x
	LSR
	AND.w #$0006
	TAY
	LDA.w DATA_14AE19,y
	STA.b $2B
	LDX.b $25
	LDY.b $27
	JSR.w CODE_13C02F
	LDA.b $29
	BPL.b CODE_13C0BE
	EOR.w #$FFFF
	CLC
	ADC.w #$0003
CODE_13C0BE:
	CMP.w #$0004
	BCC.b CODE_13C0F2
	SEC
	SBC.w #$0003
	STA.b $2D
	LDA.w #$000C
	BIT.b $29
	BPL.b CODE_13C0D3
	LDA.w #$FFF4
CODE_13C0D3:
	STA.b $29
CODE_13C0D5:
	JSR.w CODE_13D998
	XBA
	AND.w #$C600
	ORA.w #$29A4
	STA.b $2B
	LDX.b $25
	LDA.b $27
	SEC
	SBC.b $29
	STA.b $27
	TAY
	JSR.w CODE_13C02F
	DEC.b $2D
	BNE.b CODE_13C0D5
CODE_13C0F2:
	RTS

CODE_13C0F3:
	LDY.w #$0006
	TXA
	CMP.w DATA_148000,y
	BEQ.b CODE_13C10D
	STX.w $1212
	LDA.w DATA_148000,y
	STA.w $1214
	LDA.b $1D
	ORA.w #$0800
	STA.b $1D
	RTS

CODE_13C10D:
	LDA.w #CODE_13C114
	STA.b $00,x
	STZ.b $0A,x
CODE_13C114:
	LDA.b $16,x
	CMP.b $06,x
	BEQ.b CODE_13C11E
	STZ.b $0A,x
	STA.b $06,x
CODE_13C11E:
	LDA.w $1206
	BNE.b CODE_13C162
	LDA.b $1A,x
	CMP.w #$0023
	BCC.b CODE_13C12D
	LSR
	STA.b $1A,x
CODE_13C12D:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13C162
	LDA.b $08,x
	BNE.b CODE_13C14F
	LDA.w #$2A02
	JSR.w CODE_13A43F
	LDA.w #CODE_13C1F9
	STA.b $00,x
	LDY.w #DATA_14AF9D
	JSR.w CODE_138C04
	LDA.w #$00F0
	STA.b $04,x
	RTS

CODE_13C14F:
	LDA.w #CODE_13C1D5
	STA.b $00,x
	STZ.b $04,x
	LDA.w #$3F02
	JSR.w CODE_13A43F
	LDY.w #DATA_14AF49
	JMP.w CODE_138C04

CODE_13C162:
	JSR.w CODE_1383F1
	LDA.b $1A,x
	CMP.w #$0019
	BCS.b CODE_13C1D4
	LDA.b $16,x
	LDY.w $1206
	CPY.w #$0002
	BEQ.b CODE_13C17D
	CMP.w #$013E
	BEQ.b CODE_13C199
	BNE.b CODE_13C1D4
CODE_13C17D:
	CMP.w #$013E
	BEQ.b CODE_13C1D4
	LDY.w $0630
	CPY.w #$0040
	BCS.b CODE_13C18F
	CMP.w #$0140
	BEQ.b CODE_13C199
CODE_13C18F:
	CPY.w #$00C0
	BCC.b CODE_13C1D4
	CMP.w #$0142
	BNE.b CODE_13C1D4
CODE_13C199:
	LDA.b $0A,x
	BNE.b CODE_13C1D4
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13C1D4
	DEC.b $0A,x
	TYX
	LDA.w #DATA_14A84C
	JSR.w CODE_1383E4
	LDA.w #$1002
	JSR.w CODE_13A43F
	LDA.b $12,x
	CLC
	ADC.w #$000C
	STA.b $12,x
	LDA.w $0630
	STA.b $27
	LDA.w $0632
	SEC
	SBC.w #$0018
	STA.b $29
	JSR.w CODE_139ECC
	LDA.w #CODE_13C25B
	STA.b $00,x
	LDX.b $5D
CODE_13C1D4:
	RTS

CODE_13C1D5:
	LDA.b $02
	AND.w #$0003
	BNE.b CODE_13C1F8
	INC.b $04,x
	LDA.b $14,x
	EOR.w #$0400
	STA.b $14,x
	LDA.b $04,x
	CMP.w #$0004
	BCC.b CODE_13C1F8
	LDA.w #CODE_13C114
	STA.b $00,x
	LDA.b $0C,x
	AND.w #$7FFF
	STA.b $0C,x
CODE_13C1F8:
	RTS

CODE_13C1F9:
	DEC.b $04,x
	BNE.b CODE_13C204
	LDA.b $1D
	ORA.w #$4000
	STA.b $1D
CODE_13C204:
	LDA.b $04,x
	LSR
	BCS.b CODE_13C213
	AND.w #$0003
	ASL
	TAY
	LDA.w DATA_14947E,y
	STA.b $14,x
CODE_13C213:
	JSR.w CODE_13D998
	AND.w #$0007
	BEQ.b CODE_13C25A
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13C25A
	TYX
	JSR.w CODE_13D998
	AND.w #$0006
	TAY
	LDA.w DATA_149486,y
	JSR.w CODE_1383E4
	JSR.w CODE_13D998
	AND.w #$003F
	EOR.w #$FFFF
	INC
	ADC.w #$009C
	STA.b $12,x
	JSR.w CODE_13D998
	AND.w #$003F
	LSR
	BCS.b CODE_13C24D
	EOR.w #$FFFF
	INC
CODE_13C24D:
	CLC
	ADC.w #$0080
	STA.b $10,x
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDX.b $5D
CODE_13C25A:
	RTS

CODE_13C25B:
	JSR.w CODE_1383F1
	JSR.w CODE_13C989
	BCC.b CODE_13C26B
	LDA.w #$FFEC
	JSR.w CODE_138C2B
	BRA.b CODE_13C270

CODE_13C26B:
	JSR.w CODE_13B738
	BCC.b CODE_13C273
CODE_13C270:
	JMP.w CODE_13851D

CODE_13C273:
	LDA.w #$0002
	JSR.w CODE_139F20
	RTS

CODE_13C27A:
	LDA.b $0C,x
	ORA.w #$8000
	STA.b $0C,x
	INC.w $1204
	LDY.w #$0002
	BIT.b $14,x
	BVC.b CODE_13C28D
	INY
	INY
CODE_13C28D:
	TXA
	CMP.w DATA_148000,y
	BEQ.b CODE_13C2A3
	STX.w $1212
	LDA.w DATA_148000,y
	STA.w $1214
	LDA.b $1D
	ORA.w #$0800
	STA.b $1D
CODE_13C2A3:
	JSR.w CODE_1383F1
	JSR.w CODE_13C359
	LDA.b $76
	BNE.b CODE_13C2C2
	LDA.b $16,x
	CMP.w #$013C
	BEQ.b CODE_13C2C2
	LDA.b $00,x
	CMP.w #CODE_13C27A
	BNE.b CODE_13C2C2
	LDA.b $0C,x
	BIT.w #$0001
	BNE.b CODE_13C2C3
CODE_13C2C2:
	RTS

CODE_13C2C3:
	LDA.b $16,x
	CMP.b $04,x
	BEQ.b CODE_13C2C2
	STA.b $04,x
	JSR.w CODE_13B738
	BCS.b CODE_13C2C2
	LDY.w #$001E
	JSR.w CODE_13C9B7
	BCS.b CODE_13C2C2
	LDA.b $16,x
	SEC
	SBC.w #$012A
	TYX
	TAY
	LDA.w DATA_149500,y
	CLC
	ADC.b $12,x
	STA.b $12,x
	LDA.b $14,x
	EOR.w #$4000
	STA.b $14,x
	ASL
	ASL
	LDA.w DATA_1494EE,y
	BCS.b CODE_13C2FD
	EOR.w #$FFFF
	SEC
	SBC.w #$000F
CODE_13C2FD:
	CLC
	ADC.b $10,x
	STA.b $10,x
	LDA.b $10,x
	SEC
	SBC.w $0630
	BCS.b CODE_13C30E
	EOR.w #$FFFF
	INC
CODE_13C30E:
	LSR
	AND.w #$FFFE
	CMP.w #$0040
	BCC.b CODE_13C31A
	LDA.w #$003E
CODE_13C31A:
	TAY
	LDA.w DATA_149512,y
	STA.b $06,x
	TAY
	LDA.w #$00B0
	SEC
	SBC.b $12,x
	STA.w $4204
	LDA.w DATA_14948E,y
	SEP.b #$20
	STA.w $4206
	REP.b #$20
	NOP #2
	LDA.b $10,x
	BIT.b $14,x
	BVS.b CODE_13C346
	CLC
	ADC.w DATA_1494A6,y
	CLC
	ADC.w $4214
	BRA.b CODE_13C34E

CODE_13C346:
	SEC
	SBC.w DATA_1494A6,y
	SEC
	SBC.w $4214
CODE_13C34E:
	STA.b $0A,x
	LDA.w #$3D02
	JSR.w CODE_13A43F
	LDX.b $5D
	RTS

CODE_13C359:
	LDA.b $14,x
	STA.b $29
	ASL
	ASL
	LDA.w #$0090
	BCC.b CODE_13C367
	LDA.w #$0030
CODE_13C367:
	STA.b $2B
	LDA.b $16,x
	SEC
	SBC.w #$012A
	XBA
	LSR
	LSR
	STA.b $27
	LDY.w #$0026
CODE_13C377:
	LDX.w DATA_148000,y
	LDA.b $00,x
	CMP.w #CODE_13B839
	BNE.b CODE_13C3B8
	LDA.b $10,x
	SEC
	SBC.b $2B
	CMP.w #$0040
	BCS.b CODE_13C3B8
	LSR
	LSR
	LSR
	BIT.b $29
	BVC.b CODE_13C399
	EOR.w #$0007
	INC
	AND.w #$0007
CODE_13C399:
	STA.b $25
	LDA.b $12,x
	SEC
	SBC.w #$002E
	CMP.w #$0040
	BCS.b CODE_13C3B8
	AND.w #$FFF8
	STY.b $2F
	ORA.b $25
	ASL
	ADC.b $27
	TAY
	LDA.w DATA_14B448,y
	BNE.b CODE_13C3BF
	LDY.b $2F
CODE_13C3B8:
	DEY
	DEY
	BNE.b CODE_13C377
	LDX.b $5D
	RTS

CODE_13C3BF:
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDA.w #$3F02
	JSR.w CODE_13A43F
	LDA.w #DATA_14A82A
	JSR.w CODE_1383E4
	LDA.w #$2C00
	STA.b $14,x
	LDX.b $5D
	STZ.b $04,x
	DEC.b $08,x
	BEQ.b CODE_13C3E3
	LDA.w #CODE_13C3FB
	STA.b $00,x
	RTS

CODE_13C3E3:
	LDA.w #CODE_13C41F
	STA.b $00,x
	LDA.b $16,x
	STA.b $0A,x
	SEC
	SBC.w #$012A
	XBA
	LSR
	LSR
	STA.b $06,x
	LDA.w #DATA_1492A4
	JMP.w CODE_1383E4

CODE_13C3FB:
	INC.w $1204
	LDA.b $02
	AND.w #$0003
	BNE.b CODE_13C41E
	INC.b $04,x
	LDA.b $14,x
	EOR.w #$0400
	STA.b $14,x
	LDA.b $04,x
	CMP.w #$0004
	BCC.b CODE_13C41E
	LDA.w #CODE_13C27A
	STA.b $00,x
	LDA.b $16,x
	STA.b $04,x
CODE_13C41E:
	RTS

CODE_13C41F:
	LDA.b $04,x
	CMP.w #$003C
	BCS.b CODE_13C492
	INC.b $04,x
	AND.w #$0003
	BNE.b CODE_13C492
	LDA.w #$0006
	STA.b $25
CODE_13C432:
	JSR.w CODE_13D998
	AND.w #$007E
	STA.b $31
	CLC
	ADC.b $06,x
	TAY
	LDA.w DATA_14B448,y
	BNE.b CODE_13C449
	DEC.b $25
	BNE.b CODE_13C432
	BEQ.b CODE_13C492
CODE_13C449:
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13C492
	LDA.b $14,x
	STA.b $2F
	TYX
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.b $31
	AND.w #$000F
	ASL
	ASL
	BIT.b $2F
	BVC.b CODE_13C46B
	EOR.w #$FFFF
	INC
CODE_13C46B:
	CLC
	ADC.b $10,x
	STA.b $10,x
	LDA.b $31
	AND.w #$00F0
	LSR
	CLC
	ADC.b $12,x
	SEC
	SBC.w #$0020
	STA.b $12,x
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDX.b $5D
	LDA.b $0A,x
	STA.b $16,x
	LDA.b $14,x
	EOR.w #$0400
	STA.b $14,x
	RTS

CODE_13C492:
	JMP.w CODE_1383F1

CODE_13C495:
	LDA.w #$0090
	STA.b $25
	LDA.w #$002E
	STA.b $27
	LDA.b $06,x
	STA.b $31
	LDA.w #$0008
	STA.b $2B
CODE_13C4A8:
	LDA.b $25
	STA.b $2D
	LDA.w #$0008
	STA.b $29
CODE_13C4B1:
	LDA.b $2D
	SEC
	SBC.b $74
	STA.b $5F
	CLC
	ADC.w #$0008
	STA.b $2D
	LDA.b $27
	SEC
	SBC.b $76
	STA.b $65
	LDY.b $31
	LDA.w DATA_14B448,y
	BNE.b CODE_13C4D1
	LDA.w #$3FAA
	BRA.b CODE_13C4D4

CODE_13C4D1:
	LDA.w #$33AA
CODE_13C4D4:
	JSR.w CODE_139A71
	INC.b $31
	INC.b $31
	DEC.b $29
	BNE.b CODE_13C4B1
	LDA.b $27
	CLC
	ADC.w #$0008
	STA.b $27
	DEC.b $2B
	BNE.b CODE_13C4A8
	RTS

CODE_13C4EC:
	LDA.b $02
	AND.w #$0003
	BNE.b CODE_13C521
	LDA.b $0C,x
	BIT.w #$0001
	BEQ.b CODE_13C51F
	LDY.b $06,x
	BIT.b $14,x
	BVC.b CODE_13C508
	LDA.b $10,x
	SEC
	SBC.w DATA_1494D6,y
	BRA.b CODE_13C50E

CODE_13C508:
	LDA.b $10,x
	CLC
	ADC.w DATA_1494D6,y
CODE_13C50E:
	STA.b $10,x
	LDA.b $12,x
	CLC
	ADC.w DATA_1494E2,y
	STA.b $12,x
	DEC.b $04,x
	BNE.b CODE_13C521
	JMP.w CODE_13851D

CODE_13C51F:
	INC.b $04,x
CODE_13C521:
	LDA.b $04,x
	ASL
	ASL
	ASL
	ASL
	STA.b $25
	LDA.w $0632
	SEC
	SBC.b $12,x
	SEC
	SBC.w #$0020
	BCS.b CODE_13C538
	LDA.w #$0000
CODE_13C538:
	CMP.b $25
	BCS.b CODE_13C5A6
	LDA.w #$0030
	LDY.w $062E
	CPY.w #$0006
	BNE.b CODE_13C54A
	LDA.w #$001C
CODE_13C54A:
	STA.b $28,x
	EOR.w #$FFFF
	INC
	CLC
	ADC.w $0632
	STA.b $24,x
	SEC
	SBC.b $12,x
	BCC.b CODE_13C5A6
	STA.w $4204
	LDY.b $06,x
	LDA.w DATA_14948E,y
	SEP.b #$20
	STA.w $4206
	REP.b #$20
	NOP #2
	LDA.b $10,x
	BIT.b $14,x
	BVS.b CODE_13C57C
	CLC
	ADC.w DATA_1494B2,y
	CLC
	ADC.w $4214
	BRA.b CODE_13C588

CODE_13C57C:
	CLC
	ADC.w DATA_1494BE,y
	SEC
	SBC.w $4214
	SEC
	SBC.w DATA_14949A,y
CODE_13C588:
	STA.b $22,x
	LDA.w DATA_14949A,y
	STA.b $26,x
	JSR.w CODE_13C989
	BCC.b CODE_13C5A6
	LDA.w #$0002
	STA.w $11F4
	LDA.w #$FFFE
	JSR.w CODE_138C45
	LDA.w #$0802
	JSR.w CODE_13A43F
CODE_13C5A6:
	RTS

CODE_13C5A7:
	STX.b $5D
	LDA.b $10,x
	SEC
	SBC.b $74
	STA.b $25
	LDA.b $12,x
	SEC
	SBC.b $76
	STA.b $27
	LDA.b $04,x
	STA.b $29
	LDA.b $06,x
	STA.b $2B
	LDA.b $14,x
	AND.w #$4000
	STA.b $2D
	LDA.b $0C,x
	BIT.w #$0001
	BEQ.b CODE_13C5DE
	LDA.b $0A,x
	STA.b $5F
	LDA.w #$00A8
	STA.b $65
	LDA.w #$28E2
	ORA.b $2D
	JSR.w CODE_139A71
CODE_13C5DE:
	LDX.b $2B
	LDA.b $25
	STA.b $5F
	BIT.b $2D
	BVC.b CODE_13C5EE
	SEC
	SBC.w DATA_1494D6,x
	BRA.b CODE_13C5F2

CODE_13C5EE:
	CLC
	ADC.w DATA_1494D6,x
CODE_13C5F2:
	STA.b $25
	LDA.b $27
	STA.b $65
	CLC
	ADC.w DATA_1494E2,x
	STA.b $27
	LDA.w DATA_1494CA,x
	ORA.b $2D
	JSR.w CODE_139A71
	LDX.b $2B
	BNE.b CODE_13C61E
	LDA.b $25
	STA.b $5F
	LDA.b $27
	SEC
	SBC.w DATA_1494E2,x
	STA.b $65
	LDA.w #$22C6
	ORA.b $2D
	JSR.w CODE_139A71
CODE_13C61E:
	LDA.b $27
	CMP.w #$00B0
	BCS.b CODE_13C62A
	DEC.b $29
	BNE.b CODE_13C5DE
	RTS

CODE_13C62A:
	LDX.b $5D
	LDA.b $0C,x
	ORA.w #$0001
	STA.b $0C,x
	RTS

CODE_13C634:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13C63E
	JMP.w CODE_13C691

CODE_13C63E:
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	BCS.b CODE_13C68E
	JSR.w CODE_1383F1
	LDA.b $0C,x
	BIT.w #$0001
	BNE.b CODE_13C674
	LDA.b $10,x
	LDY.b $20,x
	BIT.b $14,x
	BVC.b CODE_13C65F
	CMP.w DATA_14B1BE,y
	BCC.b CODE_13C664
	BCS.b CODE_13C66D
CODE_13C65F:
	CMP.w DATA_14B1C8,y
	BCC.b CODE_13C66D
CODE_13C664:
	LDA.b $14,x
	EOR.w #$4000
	STA.b $14,x
	BRA.b CODE_13C68B

CODE_13C66D:
	LDA.b $1E,x
	JSR.w CODE_13AACB
	BRA.b CODE_13C68B

CODE_13C674:
	BIT.w #$0002
	BEQ.b CODE_13C68E
	LDA.w #$0010
	LDY.w #$FFE0
	JSR.w CODE_13C879
	LDA.b $0C,x
	AND.w #$FFFD
	STA.b $0C,x
	BRA.b CODE_13C68E

CODE_13C68B:
	JSR.w CODE_13C71F
CODE_13C68E:
	JMP.w CODE_13C900

CODE_13C691:
	LDA.b $08,x
	BNE.b CODE_13C6C7
	LDY.w #DATA_14AF57
	JSR.w CODE_138C04
	LDY.w #$0004
	JSR.w CODE_13C9B7
	BCS.b CODE_13C6B1
	TYX
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.w #CODE_13B9EC
	STA.b $00,x
	LDX.b $5D
CODE_13C6B1:
	LDA.b $12,x
	SEC
	SBC.w #$0018
	STA.b $12,x
	LDA.w #DATA_14A91A
	JSR.w CODE_1383E4
	LDA.w #CODE_13B9EC
	STA.b $00,x
	JMP.w CODE_1383F1

CODE_13C6C7:
	LDY.w #DATA_14AF3B
	JSR.w CODE_138C04
	LDA.w #$0A02
	JSR.w CODE_13A43F
	LDA.w #CODE_13C6E2
	STA.b $00,x
	STZ.b $1A,x
	LDA.b $0C,x
	AND.w #$7FFF
	STA.b $0C,x
	RTS

CODE_13C6E2:
	LDA.b $0C,x
	AND.w #$8000
	BNE.b CODE_13C691
	INC.b $1A,x
	LDA.b $14,x
	AND.w #$F000
	STA.b $25
	LDY.b $1A,x
	TYA
	LSR
	LSR
	LSR
	LDA.w #$0400
	BCC.b CODE_13C700
	LDA.w #$0200
CODE_13C700:
	ORA.b $25
	STA.b $14,x
	CPY.w #$0010
	BCC.b CODE_13C71E
	LDA.w #CODE_13C634
	STA.b $00,x
	LDA.w #DATA_14A970
	JSR.w CODE_1383E4
	LDA.b $0C,x
	AND.w #$FF00
	STA.b $0C,x
	JSR.w CODE_13AAD9
CODE_13C71E:
	RTS

CODE_13C71F:
	JSR.w CODE_13B738
	BCS.b CODE_13C745
	LDA.b $12,x
	SEC
	SBC.w $0632
	BCS.b CODE_13C730
	EOR.w #$FFFF
	INC
CODE_13C730:
	CMP.w #$0020
	BCS.b CODE_13C745
	LDA.b $0C,x
	ORA.w #$0001
	STA.b $0C,x
	JSR.w CODE_13AAD9
	LDA.w #DATA_14A9A0
	JSR.w CODE_1383E4
CODE_13C745:
	RTS

CODE_13C746:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13C756
	LDA.w #CODE_13C77E
	LDY.w #DATA_14AF57
	JMP.w CODE_13AFE7

CODE_13C756:
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	BCS.b CODE_13C77B
	JSR.w CODE_1383F1
	JSR.w CODE_13AAF2
	BNE.b CODE_13C77B
	INC.b $04,x
	LDA.b $04,x
	AND.w #$003F
	BNE.b CODE_13C77B
	LDA.w #$1502
	JSR.w CODE_13A43F
	LDY.w #$001C
	JSR.w CODE_13C9B7
CODE_13C77B:
	JMP.w CODE_13C8D3

CODE_13C77E:
	LDA.w #CODE_13C746
	STA.b $00,x
	LDA.w #DATA_14A9BC
	JSR.w CODE_1383E4
	RTS

CODE_13C78A:
	LDA.w #$0002
	JSR.w CODE_13AACB
	JSR.w CODE_13AA9C
	STA.b $25
	CLC
	ADC.b $12,x
	STA.b $12,x
	TAY
	LDA.b $10,x
	JSR.w CODE_1384E4
	BIT.w #$8000
	BNE.b CODE_13C7ED
	BIT.b $25
	BMI.b CODE_13C7AE
	BIT.w #$4000
	BNE.b CODE_13C7ED
CODE_13C7AE:
	LDA.b $25
	BMI.b CODE_13C7B7
	CMP.w #$0002
	BCS.b CODE_13C7C4
CODE_13C7B7:
	JSR.w CODE_13C989
	BCC.b CODE_13C7C4
	LDA.w #$FFEC
	JSR.w CODE_138C2B
	BRA.b CODE_13C7EA

CODE_13C7C4:
	LDY.w #$0004
	LDA.b $25
	BPL.b CODE_13C7D2
	LDY.w #$0000
	EOR.w #$FFFF
	INC
CODE_13C7D2:
	CMP.w #$0002
	BCS.b CODE_13C7DA
	LDY.w #$0002
CODE_13C7DA:
	LDA.b $14,x
	AND.w #$7FFF
	ORA.w DATA_14AE29,y
	STA.b $14,x
	LDA.w DATA_14AE2F,y
	STA.b $16,x
	RTS

CODE_13C7EA:
	JMP.w CODE_13851D

CODE_13C7ED:
	LDA.w #CODE_13C809
	STA.b $00,x
	LDA.b $12,x
	AND.w #$FFF8
	CLC
	ADC.w #$0008
	STA.b $12,x
	LDA.w #$0006
	JSR.w CODE_13AACB
	LDA.w #DATA_14A8E8
	JMP.w CODE_1383E4

CODE_13C809:
	JSR.w CODE_1383F1
	LDA.b $18,x
	BNE.b CODE_13C813
	JMP.w CODE_13851D

CODE_13C813:
	JSR.w CODE_13C989
	BCC.b CODE_13C81E
	LDA.w #$FFE2
	JSR.w CODE_138C2B
CODE_13C81E:
	RTS

CODE_13C81F:
	LDA.b $0C,x
	AND.w #$8000
	BEQ.b CODE_13C82F
	LDA.w #CODE_13C871
	LDY.w #DATA_14AF57
	JMP.w CODE_13AFE7

CODE_13C82F:
	LDA.w #$FFE0
	JSR.w CODE_13B12B
	BCS.b CODE_13C86E
	JSR.w CODE_1383F1
	JSR.w CODE_13B738
	BCS.b CODE_13C86E
	LDA.b $12,x
	SEC
	SBC.w #$000D
	SEC
	SBC.w $0632
	BCS.b CODE_13C84F
	EOR.w #$FFFF
	INC
CODE_13C84F:
	CMP.w #$0010
	BCS.b CODE_13C86E
	JSR.w CODE_13AAF2
	BNE.b CODE_13C86E
	LDA.b $18,x
	BNE.b CODE_13C86E
	LDA.w #$000A
	LDY.w #$FFF3
	JSR.w CODE_13C879
	BCS.b CODE_13C86E
	LDA.w #DATA_14A9DA
	JSR.w CODE_1383E4
CODE_13C86E:
	JMP.w CODE_13C8D3

CODE_13C871:
	LDA.w #CODE_13C81F
	STA.b $00,x
	STZ.b $18,x
	RTS

CODE_13C879:
	PHA
	PHY
	LDY.w #$0004
	JSR.w CODE_13C9B7
	PLA
	STA.b $27
	PLA
	STA.b $25
	BCS.b CODE_13C8D2
	PHY
	LDA.b $14,x
	STA.w $0014,y
	LDY.w #$0002
	ASL
	BPL.b CODE_13C898
	LDY.w #$000A
CODE_13C898:
	PLX
	LDA.b $12,x
	CLC
	ADC.b $27
	STA.b $12,x
	LDA.b $25
	JSR.w CODE_13AACB
	LDA.w DATA_14AD4D,y
	STA.b $1E,x
	LDA.w DATA_14AD5D,y
	STA.b $04,x
	LDA.w #$0014
	STA.b $20,x
	STA.b $02,x
	LDA.w #DATA_14A9EC
	JSR.w CODE_1383E4
	LDA.w #CODE_13B6F7
	STA.b $00,x
	SEP.b #$20
	LDA.b #$03
	STA.b $0C,x
	REP.b #$20
	LDA.w #$0F02
	JSR.w CODE_13A43F
	LDX.b $5D
	CLC
CODE_13C8D2:
	RTS

CODE_13C8D3:
	LDA.b $10,x
	SEC
	SBC.b $74
	CMP.w #$FF70
	BCS.b CODE_13C8E2
	CMP.w #$0190
	BCS.b CODE_13C8F1
CODE_13C8E2:
	LDA.b $12,x
	SEC
	SBC.b $76
	CMP.w #$FF70
	BCS.b CODE_13C8FF
	CMP.w #$0190
	BCC.b CODE_13C8FF
CODE_13C8F1:
	LDY.b $0E,x
	LDA.w $0D9C,y
	ORA.w #$8000
	STA.w $0D9C,y
	JSR.w CODE_13851D
CODE_13C8FF:
	RTS

CODE_13C900:
	LDA.b $10,x
	SEC
	SBC.b $74
	CMP.w #$FF10
	BCS.b CODE_13C90F
	CMP.w #$01F0
	BCS.b CODE_13C8F1
CODE_13C90F:
	LDA.b $12,x
	SEC
	SBC.b $76
	CMP.w #$FF70
	BCS.b CODE_13C8FF
	CMP.w #$0190
	BCS.b CODE_13C8F1
	RTS

CODE_13C91F:
	LDY.b $16,x
CODE_13C921:
	LDA.b $10,x
	BIT.b $14,x
	BVS.b CODE_13C935
	SEC
	SBC.w DATA_148C68,y
	STA.b $22,x
	LDA.b $10,x
	CLC
	ADC.w DATA_148DAC,y
	BRA.b CODE_13C941

CODE_13C935:
	SEC
	SBC.w DATA_148DAC,y
	STA.b $22,x
	LDA.b $10,x
	CLC
	ADC.w DATA_148C68,y
CODE_13C941:
	SEC
	SBC.b $22,x
	STA.b $26,x
	LDA.b $12,x
	SEC
	SBC.w DATA_148EF0,y
	STA.b $24,x
	LDA.w DATA_149034,y
	STA.b $28,x
	RTS

CODE_13C954:
	LDY.b $16,x
	LDA.b $10,x
	BIT.b $14,x
	BVS.b CODE_13C96A
	SEC
	SBC.w DATA_14B0BE,y
	STA.b $22,x
	LDA.b $10,x
	CLC
	ADC.w DATA_14B0FE,y
	BRA.b CODE_13C976

CODE_13C96A:
	SEC
	SBC.w DATA_14B0FE,y
	STA.b $22,x
	LDA.b $10,x
	CLC
	ADC.w DATA_14B0BE,y
CODE_13C976:
	SEC
	SBC.b $22,x
	STA.b $26,x
	LDA.b $12,x
	SEC
	SBC.w DATA_14B13E,y
	STA.b $24,x
	LDA.w DATA_14B17E,y
	STA.b $28,x
	RTS

CODE_13C989:
	LDY.w #$0620
	LDA.b $22,x
	SEC
	SBC.w $0022,y
	BCS.b CODE_13C999
	TXY
	EOR.w #$FFFF
	INC
CODE_13C999:
	CMP.w $0026,y
	BCS.b CODE_13C9B5
	LDY.w #$0620
	LDA.b $24,x
	SEC
	SBC.w $0024,y
	BCS.b CODE_13C9AE
	TXY
	EOR.w #$FFFF
	INC
CODE_13C9AE:
	CMP.w $0028,y
	BCS.b CODE_13C9B5
	SEC
	RTS

CODE_13C9B5:
	CLC
	RTS

CODE_13C9B7:
	LDA.w DATA_14AD11,y
	STA.b $25
	JSR.w CODE_13AC8C
	BCS.b CODE_13C9DF
	JSR.w CODE_138535
	LDY.b $5D
	LDA.w $0010,y
	STA.b $10,x
	LDA.w $0012,y
	STA.b $12,x
	LDA.w $0014,y
	AND.w #$C000
	STA.b $14,x
	STY.b $0E,x
	JSR.w CODE_1386F1
	TXY
	CLC
CODE_13C9DF:
	LDX.b $5D
	RTS

CODE_13C9E2:
	LDA.b $12,x
	SEC
	SBC.w #$0008
	STA.b $12,x
	LDA.w #$000C
	JSR.w CODE_13AACB
	BRA.b CODE_13CA00

CODE_13C9F2:
	LDA.b $12,x
	CLC
	ADC.w #$0004
	STA.b $12,x
	LDA.w #$000F
	JSR.w CODE_13AACB
CODE_13CA00:
	LDA.w #$FFFF
	JSR.w CODE_138C8F
	LDA.b $14,x
	ORA.w #$3800
	STA.b $14,x
	LDA.w #CODE_13B839
	STA.b $00,x
	LDA.w #$0096
	STA.b $16,x
	STZ.b $1A,x
	STZ.b $18,x
	LDA.w $11C2
	BIT.w #$0800
	BNE.b CODE_13CA45
	LDY.w #$00C8
	BIT.w #$0400
	BEQ.b CODE_13CA30
	DEC.b $1A,x
	LDY.w #$00B4
CODE_13CA30:
	LDA.w #$0004
	STA.b $1C,x
	LDA.w #$FD18
	STA.b $1E,x
	STY.b $20,x
	LDA.b $12,x
	SEC
	SBC.w #$0010
	STA.b $12,x
	RTS

CODE_13CA45:
	STZ.b $1C,x
	LDA.w #$FA00
	STA.b $1E,x
	LDA.w #$006E
	STA.b $20,x
	LDA.w #$0007
	JSR.w CODE_13AACB
	LDA.b $12,x
	SEC
	SBC.w #$0026
	STA.b $12,x
	DEC.b $1A,x
	RTS

CODE_13CA62:
	LDA.w #$FFFF
	JSR.w CODE_138C8F
	LDA.b $14,x
	ORA.w #$3800
	STA.b $14,x
	LDA.w #CODE_13B839
	STA.b $00,x
	LDA.w #$0096
	STA.b $16,x
	LDA.w #$0000
	STA.b $1A,x
	STA.b $18,x
	LDA.w $11C2
	BIT.w #$0800
	BNE.b CODE_13CAB6
	BIT.w #$0400
	BNE.b CODE_13CADE
	LDA.w #$0004
	STA.b $1C,x
	LDA.w #$FD00
	STA.b $1E,x
	LDA.w #$00C8
	STA.b $20,x
	LDA.w #$0004
	JSR.w CODE_13AACB
	LDA.b $12,x
	SEC
	SBC.w #$0018
	STA.b $12,x
	PHX
	LDX.w #$0620
	LDA.w #DATA_148A3A
	JSR.w CODE_1383E4
	PLX
	RTS

CODE_13CAB6:
	STZ.b $1C,x
	LDA.w #$FB00
	STA.b $1E,x
	LDA.w #$006E
	STA.b $20,x
	LDA.w #$0007
	JSR.w CODE_13AACB
	LDA.b $12,x
	SEC
	SBC.w #$0026
	STA.b $12,x
	DEC.b $1A,x
	PHX
	LDX.w #$0620
	LDA.w #DATA_148A42
	JSR.w CODE_1383E4
	PLX
	RTS

CODE_13CADE:
	STZ.b $1C,x
	LDA.w #$0300
	STA.b $1E,x
	LDA.w #$0064
	STA.b $20,x
	LDA.w #$0009
	JSR.w CODE_13AACB
	LDA.b $12,x
	SEC
	SBC.w #$0010
	STA.b $12,x
	DEC.b $1A,x
	PHX
	LDX.w #$0620
	LDA.w #DATA_148A4A
	JSR.w CODE_1383E4
	PLX
	RTS

CODE_13CB06:
	LDA.w #$2000
	STA.b $14,x
	LDA.w #$0002
	STA.b $0C,x
	LDA.w #DATA_14A708
	JMP.w CODE_1383E4

CODE_13CB16:
	LDA.w #$0004
	STA.b $0C,x
	LDA.w #DATA_14A718
	JMP.w CODE_1383E4

CODE_13CB21:
	LDA.w #$0003
	STA.b $0C,x
	LDA.w #DATA_14A728
	JMP.w CODE_1383E4

CODE_13CB2C:
	LDA.w #$0000
	STA.b $16,x
	LDA.b $14,x
	ORA.w #$2800
	STA.b $14,x
	LDA.w #DATA_14A818
	JSR.w CODE_1383E4
	LDA.w #$0017
	JSR.w CODE_13AACB
	LDA.b $12,x
	SEC
	SBC.w #$0002
	STA.b $12,x
	LDA.w #CODE_13AF54
	STA.b $00,x
	RTS

CODE_13CB52:
	STX.b $06,y
	LDA.w $000C,y
	ORA.w #$0100
	STA.w $000C,y
	LDA.w $0000,y
	STA.b $06,x
	LDA.w #DATA_14A864
	JSR.w CODE_1383E4
	LDA.w #CODE_13B6C6
	STA.b $00,x
	RTS

CODE_13CB6E:
	LDA.w #CODE_13BF21
	BRA.b CODE_13CB76

CODE_13CB73:
	LDA.w #CODE_13BFB7
CODE_13CB76:
	STA.b $16,x
	LDA.b $0C,x
	ORA.w #$2000
	STA.b $0C,x
	LDA.w #CODE_13BF10
	STA.b $00,x
	LDA.b $31
	AND.w #$FFF0
	STA.b $10,x
	LDA.b $33
	AND.w #$FFF0
	STA.b $12,x
	LDA.w #$0200
	STA.b $1E,x
	LDA.w #$0028
	STA.b $20,x
	RTS

CODE_13CB9D:
	LDA.w #CODE_13C065
	STA.b $00,x
	LDA.w #CODE_13C084					;\ Glitch: This is somehow used as an index for the fireball sprite drawing when you get hit by one.
	STA.b $16,x						;/ It results in an open bus read at $154BA8
	LDA.w #$2000
	STA.b $0C,x
	LDA.w $001E,y
	TAY
	LDA.w DATA_14AE25,y
	STA.b $20,x
	LDA.w DATA_14AE21,y
	STA.b $1E,x
	RTS

CODE_13CBBB:
	LDA.w #CODE_13C040
	STA.b $00,x
	LDA.w #DATA_14A6FA
	JSR.w CODE_1383E4
	LDA.w #$2800
	STA.b $14,x
	LDA.w #$00CA
	STA.b $16,x
	LDA.b $31
	AND.w #$FFF0
	ORA.w #$0008
	STA.b $10,x
	LDA.b $33
	AND.w #$FFF0
	CLC
	ADC.w #$000F
	STA.b $12,x
	RTS

CODE_13CBE6:
	LDA.w #$FFE6
	LDY.w #$000A
	BRA.b CODE_13CBFC

CODE_13CBEE:
	LDA.w #$FFF3
	LDY.w #$0012
	BRA.b CODE_13CBFC

CODE_13CBF6:
	LDA.w #$FFE2
	LDY.w #$000C
CODE_13CBFC:
	CLC
	ADC.b $12,x
	STA.b $12,x
	TYA
	JSR.w CODE_13AACB
	LDA.b $14,x
	ORA.w #$2E00
	STA.b $14,x
	LDA.w #CODE_13B972
	STA.b $00,x
	LDA.w #$1102
	JSR.w CODE_13A43F
	LDY.w #$0000
	LDA.w $11C2
	BIT.w #$0800
	BEQ.b CODE_13CC25
	LDY.w #$FFFC
CODE_13CC25:
	BIT.w #$0400
	BEQ.b CODE_13CC2D
	LDY.w #$0004
CODE_13CC2D:
	STY.b $06,x
	LDA.w #DATA_14A944
	CPY.w #$0000
	BNE.b CODE_13CC3A
	LDA.w #DATA_14A958
CODE_13CC3A:
	JSR.w CODE_1383E4
	RTS

CODE_13CC3E:
	LDA.b $14,x
	AND.w #$4000
	ORA.w #$A400
	STA.b $14,x
	LDA.w #CODE_13C78A
	STA.b $00,x
	LDA.w #$0100
	STA.b $16,x
	LDA.w #$FC00
	STA.b $1E,x
	LDA.w #$0028
	STA.b $20,x
	LDA.b $12,x
	SEC
	SBC.w #$000F
	STA.b $12,x
	LDA.w #$0009
	JSR.w CODE_13AACB
	RTS

CODE_13CC6B:
	LDA.w #CODE_13C4EC
	STA.b $00,x
	LDA.w #CODE_13C5A7
	STA.b $16,x
	LDA.w #$2000
	STA.b $0C,x
	LDA.w #$0001
	STA.b $04,x
	RTS

CODE_13CC80:
	JSR.w CODE_13D87C
	SEP.b #$20
	STZ.w $1F80
	STZ.w $1F81
	LDX.b $F6
	JSR.w (DATA_13D5FB,x)
	LDX.w $1F8C
	JSR.w (DATA_13CCC8,x)
	LDX.b $F6
	JSR.w (DATA_13D652,x)
	REP.b #$30
	RTS

ADDR_13CC9E:
	JSR.w CODE_13D87C
	SEP.b #$20
	LDA.b #$01
	STA.w $1F80
	STZ.w $1F81
	LDX.b $F6
	JSR.w (DATA_13D5FB,x)
	LDX.w $1F8C
	JSR.w (DATA_13CCC8,x)
	REP.b #$30
	RTS

ADDR_13CCB9:
	SEP.b #$10
	LDX.w $1F8C
	JSR.w (DATA_13CCD4,x)
	RTS

ADDR_13CCC2:
	JSR.w CODE_13D899
	LDX.b $E8
	RTS

DATA_13CCC8:
	dw CODE_13CCE0
	dw CODE_13CD6D
	dw CODE_13CDF3
	dw CODE_13D454
	dw CODE_13D4A0
	dw CODE_13D598

DATA_13CCD4:
	dw CODE_13CCE0
	dw CODE_13CD6D
	dw CODE_13CE15
	dw CODE_13D454
	dw CODE_13D4A0
	dw CODE_13D598

CODE_13CCE0:
	SEP.b #$30
	LDY.b #$20
	LDX.b #$00
CODE_13CCE6:
	LDA.b [$E8]
	STA.b $F0
	LDA.b #$08
	STA.b $F1
CODE_13CCEE:
	LDA.b #$00
	LSR.b $F0
	BCC.b CODE_13CCF5
	DEC
CODE_13CCF5:
	STA.l $7E2000,x
	INX
	DEC.b $F1
	BNE.b CODE_13CCEE
	INC.b $E8
	BNE.b CODE_13CD0C
	INC.b $E9
	BNE.b CODE_13CD0C
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CD0C:
	DEY
	BNE.b CODE_13CCE6
	REP.b #$20
	LDA.b $F4
	SEC
	SBC.w #$0020
	STA.b $F4
	SEP.b #$30
CODE_13CD1B:
	LDA.b [$E8]
	TAX
	INC.b $E8
	BNE.b CODE_13CD2C
	INC.b $E9
	BNE.b CODE_13CD2C
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CD2C:
	LDA.l $7E2000,x
	BPL.b CODE_13CD5E
	STX.b $F0
	LDA.b [$E8]
	TAY
	INC.b $E8
	BNE.b CODE_13CD45
	INC.b $E9
	BNE.b CODE_13CD45
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CD45:
	LDX.b $F6
CODE_13CD47:
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	DEY
	BNE.b CODE_13CD47
	REP.b #$20
	LDA.b $F4
	SEC
	SBC.w #$0002
	STA.b $F4
	SEP.b #$20
	BNE.b CODE_13CD1B
	RTS

CODE_13CD5E:
	TXA
	LDX.b $F6
	JSR.w (DATA_13D679,x)
	REP.b #$20
	DEC.b $F4
	SEP.b #$20
	BNE.b CODE_13CD1B
	RTS

CODE_13CD6D:
	SEP.b #$30
	LDA.b [$E8]
	STA.b $F2
	INC.b $E8
	BNE.b CODE_13CD81
	INC.b $E9
	BNE.b CODE_13CD81
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CD81:
	REP.b #$20
	DEC.b $F4
	SEP.b #$20
CODE_13CD87:
	LDA.b [$E8]
	CMP.b $F2
	BNE.b CODE_13CDD7
	INC.b $E8
	BNE.b CODE_13CD9B
	INC.b $E9
	BNE.b CODE_13CD9B
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CD9B:
	LDA.b [$E8]
	STA.b $F0
	INC.b $E8
	BNE.b CODE_13CDAD
	INC.b $E9
	BNE.b CODE_13CDAD
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CDAD:
	LDA.b [$E8]
	TAY
	INC.b $E8
	BNE.b CODE_13CDBE
	INC.b $E9
	BNE.b CODE_13CDBE
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CDBE:
	LDX.b $F6
CODE_13CDC0:
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	DEY
	BNE.b CODE_13CDC0
	REP.b #$20
	LDA.b $F4
	SEC
	SBC.w #$0003
	STA.b $F4
	SEP.b #$20
	BNE.b CODE_13CD87
	RTS

CODE_13CDD7:
	LDX.b $F6
	JSR.w (DATA_13D679,x)
	INC.b $E8
	BNE.b CODE_13CDEA
	INC.b $E9
	BNE.b CODE_13CDEA
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CDEA:
	REP.b #$20
	DEC.b $F4
	SEP.b #$20
	BNE.b CODE_13CD87
	RTS

CODE_13CDF3:
	REP.b #$30
	LDA.b $E8
	STA.w $1F82
	LDA.b $EA
	STA.w $1F84
	LDA.b $F4
	CLC
	ADC.b $E8
	ORA.w #$8000
	STA.w $1F86
	LDA.b $EA
	ADC.w #$0000
	STA.w $1F88
	STZ.w $1F91
CODE_13CE15:
	SEP.b #$30
	LDA.b [$E8]
	STA.w $1F8F
	INC.b $E8
	BNE.b CODE_13CE2A
	INC.b $E9
	BNE.b CODE_13CE2A
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CE2A:
	LDA.w $1F8F
	BIT.b #$40
	BNE.b CODE_13CE34
	JMP.w CODE_13CFD8

CODE_13CE34:
	STZ.b $FC
	BIT.b #$20
	BEQ.b CODE_13CE87
	STZ.b $F0
	LDA.b [$E8]
	STA.b $F8
	ORA.b $FC
	STA.b $FC
	LDA.b $F0
	LSR.b $F8
	BCC.b CODE_13CE4C
	STA.b $D8
CODE_13CE4C:
	LSR.b $F8
	BCC.b CODE_13CE52
	STA.b $D9
CODE_13CE52:
	LSR.b $F8
	BCC.b CODE_13CE58
	STA.b $DA
CODE_13CE58:
	LSR.b $F8
	BCC.b CODE_13CE5E
	STA.b $DB
CODE_13CE5E:
	LSR.b $F8
	BCC.b CODE_13CE64
	STA.b $DC
CODE_13CE64:
	LSR.b $F8
	BCC.b CODE_13CE6A
	STA.b $DD
CODE_13CE6A:
	LSR.b $F8
	BCC.b CODE_13CE70
	STA.b $DE
CODE_13CE70:
	LSR.b $F8
	BCC.b CODE_13CE76
	STA.b $DF
CODE_13CE76:
	INC.b $E8
	BNE.b CODE_13CE84
	INC.b $E9
	BNE.b CODE_13CE84
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CE84:
	LDA.w $1F8F
CODE_13CE87:
	BIT.b #$10
	BEQ.b CODE_13CEDA
	LDA.b #$FF
	STA.b $F0
	LDA.b [$E8]
	STA.b $F8
	ORA.b $FC
	STA.b $FC
	LDA.b $F0
	LSR.b $F8
	BCC.b CODE_13CE9F
	STA.b $D8
CODE_13CE9F:
	LSR.b $F8
	BCC.b CODE_13CEA5
	STA.b $D9
CODE_13CEA5:
	LSR.b $F8
	BCC.b CODE_13CEAB
	STA.b $DA
CODE_13CEAB:
	LSR.b $F8
	BCC.b CODE_13CEB1
	STA.b $DB
CODE_13CEB1:
	LSR.b $F8
	BCC.b CODE_13CEB7
	STA.b $DC
CODE_13CEB7:
	LSR.b $F8
	BCC.b CODE_13CEBD
	STA.b $DD
CODE_13CEBD:
	LSR.b $F8
	BCC.b CODE_13CEC3
	STA.b $DE
CODE_13CEC3:
	LSR.b $F8
	BCC.b CODE_13CEC9
	STA.b $DF
CODE_13CEC9:
	INC.b $E8
	BNE.b CODE_13CED7
	INC.b $E9
	BNE.b CODE_13CED7
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CED7:
	LDA.w $1F8F
CODE_13CEDA:
	LSR.b $FC
	BCS.b CODE_13CEF0
	LDA.b [$E8]
	STA.b $D8
	INC.b $E8
	BNE.b CODE_13CEF0
	INC.b $E9
	BNE.b CODE_13CEF0
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CEF0:
	LSR.b $FC
	BCS.b CODE_13CF06
	LDA.b [$E8]
	STA.b $D9
	INC.b $E8
	BNE.b CODE_13CF06
	INC.b $E9
	BNE.b CODE_13CF06
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF06:
	LSR.b $FC
	BCS.b CODE_13CF1C
	LDA.b [$E8]
	STA.b $DA
	INC.b $E8
	BNE.b CODE_13CF1C
	INC.b $E9
	BNE.b CODE_13CF1C
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF1C:
	LSR.b $FC
	BCS.b CODE_13CF32
	LDA.b [$E8]
	STA.b $DB
	INC.b $E8
	BNE.b CODE_13CF32
	INC.b $E9
	BNE.b CODE_13CF32
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF32:
	LSR.b $FC
	BCS.b CODE_13CF48
	LDA.b [$E8]
	STA.b $DC
	INC.b $E8
	BNE.b CODE_13CF48
	INC.b $E9
	BNE.b CODE_13CF48
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF48:
	LSR.b $FC
	BCS.b CODE_13CF5E
	LDA.b [$E8]
	STA.b $DD
	INC.b $E8
	BNE.b CODE_13CF5E
	INC.b $E9
	BNE.b CODE_13CF5E
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF5E:
	LSR.b $FC
	BCS.b CODE_13CF74
	LDA.b [$E8]
	STA.b $DE
	INC.b $E8
	BNE.b CODE_13CF74
	INC.b $E9
	BNE.b CODE_13CF74
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF74:
	LSR.b $FC
	BCS.b CODE_13CF8A
	LDA.b [$E8]
	STA.b $DF
	INC.b $E8
	BNE.b CODE_13CF8A
	INC.b $E9
	BNE.b CODE_13CF8A
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CF8A:
	LDX.w $1F8F
	TXA
	LSR
	ROR
	TAX
	AND.b #$80
	STA.b $F8
	TXA
	ROR
	TAX
	AND.b #$80
	STA.b $F9
	TXA
	ROR
	TAX
	AND.b #$80
	STA.b $FA
	TXA
	ROR
	AND.b #$80
	STA.b $FB
	LDX.b #$07
CODE_13CFAB:
	SEP.b #$20
	LDA.b $D8,x
	STA.b $F0
	LDY.b #$08
	REP.b #$20
	LDA.w #$0000
CODE_13CFB8:
	LSR
	LSR.b $F0
	BCC.b CODE_13CFC4
	ORA.b $FA
	DEY
	BNE.b CODE_13CFB8
	BRA.b CODE_13CFC9

CODE_13CFC4:
	ORA.b $F8
	DEY
	BNE.b CODE_13CFB8
CODE_13CFC9:
	PHA
	TXY
	TXA
	ASL
	TAX
	PLA
	STA.b $D8,x
	TYX
	DEX
	BPL.b CODE_13CFAB
	JMP.w CODE_13D14B

CODE_13CFD8:
	BIT.b #$30
	BEQ.b CODE_13D03E
	LDA.b [$E8]
	STA.b $F0
	INC.b $E8
	BNE.b CODE_13CFEE
	INC.b $E9
	BNE.b CODE_13CFEE
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13CFEE:
	LDA.b [$E8]
	STA.b $F1
	INC.b $E8
	BNE.b CODE_13D000
	INC.b $E9
	BNE.b CODE_13D000
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D000:
	REP.b #$10
	LDX.w $1F91
	LDA.w $1F8F
	STA.l $7E2010,x
	LDA.b $E8
	STA.l $7E2011,x
	LDA.b $E9
	STA.l $7E2012,x
	LDA.b $EA
	STA.l $7E2013,x
	REP.b #$20
	TXA
	CLC
	ADC.w #$0004
	STA.w $1F91
	LDA.w $1F82
	CLC
	ADC.b $F0
	ORA.w #$8000
	STA.b $E8
	LDA.w $1F84
	ADC.w #$0000
	STA.b $EA
	JMP.w CODE_13CE15

CODE_13D03E:
	REP.b #$20
	STZ.b $F8
	STZ.b $FA
	STZ.b $FC
	SEP.b #$20
	BIT.b #$04
	BEQ.b CODE_13D073
	LDA.b [$E8]
	STA.b $F8
	INC.b $E8
	BNE.b CODE_13D05E
	INC.b $E9
	BNE.b CODE_13D05E
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D05E:
	LDA.b [$E8]
	STA.b $F9
	INC.b $E8
	BNE.b CODE_13D070
	INC.b $E9
	BNE.b CODE_13D070
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D070:
	LDA.w $1F8F
CODE_13D073:
	BIT.b #$02
	BEQ.b CODE_13D09E
	LDA.b [$E8]
	STA.b $FA
	INC.b $E8
	BNE.b CODE_13D089
	INC.b $E9
	BNE.b CODE_13D089
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D089:
	LDA.b [$E8]
	STA.b $FB
	INC.b $E8
	BNE.b CODE_13D09B
	INC.b $E9
	BNE.b CODE_13D09B
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D09B:
	LDA.w $1F8F
CODE_13D09E:
	LSR
	BCC.b CODE_13D0D7
	LDA.b [$E8]
	STA.b $F0
	INC.b $E8
	BNE.b CODE_13D0B3
	INC.b $E9
	BNE.b CODE_13D0B3
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D0B3:
	LDA.b [$E8]
	STA.b $FC
	INC.b $E8
	BNE.b CODE_13D0C5
	INC.b $E9
	BNE.b CODE_13D0C5
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D0C5:
	LDA.b [$E8]
	STA.b $FD
	INC.b $E8
	BNE.b CODE_13D0D7
	INC.b $E9
	BNE.b CODE_13D0D7
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D0D7:
	LDX.b #$00
CODE_13D0D9:
	LSR.b $F8
	BCC.b CODE_13D0E5
	STZ.b $D8,x
	LSR.b $FA
	LSR.b $FC
	BRA.b CODE_13D10D

CODE_13D0E5:
	LSR.b $FA
	BCC.b CODE_13D0F1
	LDA.b #$FF
	STA.b $D8,x
	LSR.b $FC
	BRA.b CODE_13D10D

CODE_13D0F1:
	LSR.b $FC
	BCC.b CODE_13D0FB
	LDA.b $F0
	STA.b $D8,x
	BRA.b CODE_13D10D

CODE_13D0FB:
	LDA.b [$E8]
	STA.b $D8,x
	INC.b $E8
	BNE.b CODE_13D10D
	INC.b $E9
	BNE.b CODE_13D10D
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D10D:
	INX
	CPX.b #$08
	BNE.b CODE_13D0D9
CODE_13D112:
	LSR.b $F9
	BCC.b CODE_13D11E
	STZ.b $D8,x
	LSR.b $FB
	LSR.b $FD
	BRA.b CODE_13D146

CODE_13D11E:
	LSR.b $FB
	BCC.b CODE_13D12A
	LDA.b #$FF
	STA.b $D8,x
	LSR.b $FD
	BRA.b CODE_13D146

CODE_13D12A:
	LSR.b $FD
	BCC.b CODE_13D134
	LDA.b $F0
	STA.b $D8,x
	BRA.b CODE_13D146

CODE_13D134:
	LDA.b [$E8]
	STA.b $D8,x
	INC.b $E8
	BNE.b CODE_13D146
	INC.b $E9
	BNE.b CODE_13D146
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D146:
	INX
	CPX.b #$10
	BNE.b CODE_13D112
CODE_13D14B:
	SEP.b #$30
	BIT.w $1F8F
	BPL.b CODE_13D155
	JSR.w CODE_13D3FC
CODE_13D155:
	REP.b #$10
	LDX.w $1F91
	BNE.b CODE_13D15F
	JMP.w CODE_13D3D4

CODE_13D15F:
	DEX
	DEX
	DEX
	DEX
	LDA.l $7E2010,x
	STA.w $1F8F
	LDA.l $7E2011,x
	STA.b $E8
	LDA.l $7E2012,x
	STA.b $E9
	LDA.l $7E2013,x
	STA.b $EA
	STX.w $1F91
	SEP.b #$10
	LDA.w $1F8F
	BIT.b #$20
	BNE.b CODE_13D18B
	JMP.w CODE_13D32F

CODE_13D18B:
	LDA.b [$E8]
	STA.b $F8
	INC.b $E8
	BNE.b CODE_13D19D
	INC.b $E9
	BNE.b CODE_13D19D
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D19D:
	LDA.b [$E8]
	STA.b $F9
	INC.b $E8
	BNE.b CODE_13D1AF
	INC.b $E9
	BNE.b CODE_13D1AF
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D1AF:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D1C7
	LDA.b [$E8]
	STA.b $D8
	INC.b $E8
	BNE.b CODE_13D1C7
	INC.b $E9
	BNE.b CODE_13D1C7
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D1C7:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D1DF
	LDA.b [$E8]
	STA.b $D9
	INC.b $E8
	BNE.b CODE_13D1DF
	INC.b $E9
	BNE.b CODE_13D1DF
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D1DF:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D1F7
	LDA.b [$E8]
	STA.b $DA
	INC.b $E8
	BNE.b CODE_13D1F7
	INC.b $E9
	BNE.b CODE_13D1F7
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D1F7:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D20F
	LDA.b [$E8]
	STA.b $DB
	INC.b $E8
	BNE.b CODE_13D20F
	INC.b $E9
	BNE.b CODE_13D20F
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D20F:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D227
	LDA.b [$E8]
	STA.b $DC
	INC.b $E8
	BNE.b CODE_13D227
	INC.b $E9
	BNE.b CODE_13D227
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D227:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D23F
	LDA.b [$E8]
	STA.b $DD
	INC.b $E8
	BNE.b CODE_13D23F
	INC.b $E9
	BNE.b CODE_13D23F
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D23F:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D257
	LDA.b [$E8]
	STA.b $DE
	INC.b $E8
	BNE.b CODE_13D257
	INC.b $E9
	BNE.b CODE_13D257
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D257:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D26F
	LDA.b [$E8]
	STA.b $DF
	INC.b $E8
	BNE.b CODE_13D26F
	INC.b $E9
	BNE.b CODE_13D26F
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D26F:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D287
	LDA.b [$E8]
	STA.b $E0
	INC.b $E8
	BNE.b CODE_13D287
	INC.b $E9
	BNE.b CODE_13D287
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D287:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D29F
	LDA.b [$E8]
	STA.b $E1
	INC.b $E8
	BNE.b CODE_13D29F
	INC.b $E9
	BNE.b CODE_13D29F
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D29F:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D2B7
	LDA.b [$E8]
	STA.b $E2
	INC.b $E8
	BNE.b CODE_13D2B7
	INC.b $E9
	BNE.b CODE_13D2B7
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D2B7:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D2CF
	LDA.b [$E8]
	STA.b $E3
	INC.b $E8
	BNE.b CODE_13D2CF
	INC.b $E9
	BNE.b CODE_13D2CF
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D2CF:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D2E7
	LDA.b [$E8]
	STA.b $E4
	INC.b $E8
	BNE.b CODE_13D2E7
	INC.b $E9
	BNE.b CODE_13D2E7
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D2E7:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D2FF
	LDA.b [$E8]
	STA.b $E5
	INC.b $E8
	BNE.b CODE_13D2FF
	INC.b $E9
	BNE.b CODE_13D2FF
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D2FF:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D317
	LDA.b [$E8]
	STA.b $E6
	INC.b $E8
	BNE.b CODE_13D317
	INC.b $E9
	BNE.b CODE_13D317
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D317:
	LSR.b $F9
	ROR.b $F8
	BCC.b CODE_13D32F
	LDA.b [$E8]
	STA.b $E7
	INC.b $E8
	BNE.b CODE_13D32F
	INC.b $E9
	BNE.b CODE_13D32F
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D32F:
	LDA.w $1F8F
	BIT.b #$01
	BEQ.b CODE_13D35D
	REP.b #$30
	LDX.b $D8
	LDA.b $E6
	STA.b $D8
	STX.b $E6
	LDX.b $DA
	LDA.b $E4
	STA.b $DA
	STX.b $E4
	LDX.b $DC
	LDA.b $E2
	STA.b $DC
	STX.b $E2
	LDX.b $DE
	LDA.b $E0
	STA.b $DE
	STX.b $E0
	SEP.b #$30
	LDA.w $1F8F
CODE_13D35D:
	BIT.b #$02
	BEQ.b CODE_13D3D1
	LDY.b $D8
	LDA.w DATA_14B348,y
	STA.b $D8
	LDY.b $D9
	LDA.w DATA_14B348,y
	STA.b $D9
	LDY.b $DA
	LDA.w DATA_14B348,y
	STA.b $DA
	LDY.b $DB
	LDA.w DATA_14B348,y
	STA.b $DB
	LDY.b $DC
	LDA.w DATA_14B348,y
	STA.b $DC
	LDY.b $DD
	LDA.w DATA_14B348,y
	STA.b $DD
	LDY.b $DE
	LDA.w DATA_14B348,y
	STA.b $DE
	LDY.b $DF
	LDA.w DATA_14B348,y
	STA.b $DF
	LDY.b $E0
	LDA.w DATA_14B348,y
	STA.b $E0
	LDY.b $E1
	LDA.w DATA_14B348,y
	STA.b $E1
	LDY.b $E2
	LDA.w DATA_14B348,y
	STA.b $E2
	LDY.b $E3
	LDA.w DATA_14B348,y
	STA.b $E3
	LDY.b $E4
	LDA.w DATA_14B348,y
	STA.b $E4
	LDY.b $E5
	LDA.w DATA_14B348,y
	STA.b $E5
	LDY.b $E6
	LDA.w DATA_14B348,y
	STA.b $E6
	LDY.b $E7
	LDA.w DATA_14B348,y
	STA.b $E7
CODE_13D3D1:
	JMP.w CODE_13D14B

CODE_13D3D4:
	SEP.b #$30
	LDX.b $F6
	JSR.w (DATA_13D6FE,x)
	LDA.w $1F81
	BNE.b CODE_13D3F8
	REP.b #$30
	LDA.b $E8
	CMP.w $1F86
	LDA.b $EA
	SBC.w $1F88
	BCS.b CODE_13D3F8
	SEP.b #$20
	LDA.w $1F80
	BNE.b CODE_13D3FA
	JMP.w CODE_13CE15

CODE_13D3F8:
	SEC
	RTS

CODE_13D3FA:
	CLC
	RTS

CODE_13D3FC:
	SEP.b #$30
	LDX.b #$0F
	LDA.b #$00
CODE_13D402:
	STA.l $7E2000,x
	DEX
	BPL.b CODE_13D402
	STZ.b $F0
	LDA.b #$80
	STA.b $F1
CODE_13D40F:
	LDX.b $F0
	LDA.b $D8,x
	STA.b $F2
	LDA.b $D9,x
	STA.b $F3
	INX
	INX
	STX.b $F0
	LDX.b #$0E
CODE_13D41F:
	ASL.b $F2
	BCC.b CODE_13D42D
	LDA.l $7E2000,x
	ORA.b $F1
	STA.l $7E2000,x
CODE_13D42D:
	ASL.b $F3
	BCC.b CODE_13D43B
	LDA.l $7E2001,x
	ORA.b $F1
	STA.l $7E2001,x
CODE_13D43B:
	DEX
	DEX
	BPL.b CODE_13D41F
	LSR.b $F1
	BCC.b CODE_13D40F
	LDX.b #$0E
	REP.b #$20
CODE_13D447:
	LDA.l $7E2000,x
	STA.b $D8,x
	DEX
	DEX
	BPL.b CODE_13D447
	SEP.b #$30
	RTS

CODE_13D454:
	REP.b #$10
	SEP.b #$20
	LDX.b $F6
	LDY.b $F4
	BEQ.b CODE_13D474
CODE_13D45E:
	LDA.b [$E8]
	JSR.w (DATA_13D679,x)
	INC.b $E8
	BNE.b CODE_13D471
	INC.b $E9
	BNE.b CODE_13D471
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D471:
	DEY
	BNE.b CODE_13D45E
CODE_13D474:
	RTS

CODE_13D475:
	LDX.b $F6
	JSR.w (DATA_13D679,x)
	INC.b $E8
	BNE.b CODE_13D488
	INC.b $E9
	BNE.b CODE_13D488
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D488:
	LDA.b [$E8]
	JSR.w (DATA_13D679,x)
	INC.b $E8
	BNE.b CODE_13D49B
	INC.b $E9
	BNE.b CODE_13D49B
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D49B:
	DEY
	DEY
	BNE.b CODE_13D4CC
	RTS

CODE_13D4A0:
	SEP.b #$20
	REP.b #$10
	LDA.b [$E8]
	STA.b $F2
	INC.b $E8
	BNE.b CODE_13D4B6
	INC.b $E9
	BNE.b CODE_13D4B6
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D4B6:
	LDA.b [$E8]
	STA.b $F3
	INC.b $E8
	BNE.b CODE_13D4C8
	INC.b $E9
	BNE.b CODE_13D4C8
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D4C8:
	LDY.b $F4
	DEY
	DEY
CODE_13D4CC:
	LDA.b [$E8]
	CMP.b $F2
	BNE.b CODE_13D475
	STA.b $F0
	INC.b $E8
	BNE.b CODE_13D4E2
	INC.b $E9
	BNE.b CODE_13D4E2
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D4E2:
	LDA.b [$E8]
	CMP.b $F3
	BNE.b CODE_13D54B
	INC.b $E8
	BNE.b CODE_13D4F6
	INC.b $E9
	BNE.b CODE_13D4F6
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D4F6:
	LDA.b [$E8]
	STA.b $F0
	INC.b $E8
	BNE.b CODE_13D508
	INC.b $E9
	BNE.b CODE_13D508
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D508:
	LDA.b [$E8]
	STA.b $F1
	INC.b $E8
	BNE.b CODE_13D51A
	INC.b $E9
	BNE.b CODE_13D51A
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D51A:
	PHY
	LDA.b [$E8]
	SEP.b #$10
	TAY
	INC.b $E8
	BNE.b CODE_13D52E
	INC.b $E9
	BNE.b CODE_13D52E
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D52E:
	LDX.b $F6
CODE_13D530:
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	LDA.b $F1
	JSR.w (DATA_13D679,x)
	DEY
	BNE.b CODE_13D530
	REP.b #$10
	PLY
	DEY
	DEY
	DEY
	DEY
	DEY
	BEQ.b CODE_13D54A
	JMP.w CODE_13D4CC

CODE_13D54A:
	RTS

CODE_13D54B:
	PHA
	LDA.b $F0
	LDX.b $F6
	JSR.w (DATA_13D679,x)
	PLA
	JSR.w (DATA_13D679,x)
	INC.b $E8
	BNE.b CODE_13D565
	INC.b $E9
	BNE.b CODE_13D565
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D565:
	DEY
	DEY
	BEQ.b CODE_13D54A
	JMP.w CODE_13D4CC

CODE_13D56C:
	STY.b $F2
	SEP.b #$10
	LDA.b [$E8]
	TAY
	INC.b $E8
	BNE.b CODE_13D581
	INC.b $E9
	BNE.b CODE_13D581
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D581:
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	LDA.b $F1
	JSR.w (DATA_13D679,x)
	DEY
	BNE.b CODE_13D581
	REP.b #$10
	LDY.b $F2
	DEY
	DEY
	DEY
	BNE.b CODE_13D5A0
	RTS

CODE_13D598:
	SEP.b #$20
	REP.b #$10
	LDX.b $F6
	LDY.b $F4
CODE_13D5A0:
	LDA.b [$E8]
	STA.b $F2
	INC.b $E8
	BNE.b CODE_13D5B2
	INC.b $E9
	BNE.b CODE_13D5B2
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D5B2:
	LDA.b [$E8]
	STA.b $F1
	INC.b $E8
	BNE.b CODE_13D5C4
	INC.b $E9
	BNE.b CODE_13D5C4
	LDA.b #$80
	STA.b $E9
	INC.b $EA
CODE_13D5C4:
	LDA.b $F2
	AND.b #$EE
	STA.b $F0
	CMP.b $F2
	BEQ.b CODE_13D5EC
	LDA.b $F2
	BIT.b #$10
	BEQ.b CODE_13D56C
	BIT.b #$01
	BEQ.b CODE_13D5E2
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	LDA.b $F1
	JSR.w (DATA_13D679,x)
CODE_13D5E2:
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	LDA.b $F1
	JSR.w (DATA_13D679,x)
CODE_13D5EC:
	LDA.b $F0
	JSR.w (DATA_13D679,x)
	LDA.b $F1
	JSR.w (DATA_13D679,x)
	DEY
	DEY
	BNE.b CODE_13D5A0
	RTS

DATA_13D5FB:
	dw CODE_13D61F
	dw CODE_13D607
	dw CODE_13D60D
	dw CODE_13D607
	dw CODE_13D630
	dw CODE_13D64A

CODE_13D607:
	SEP.b #$20
	LDA.b #$80
	BRA.b CODE_13D611

CODE_13D60D:
	SEP.b #$20
	LDA.b #$00
CODE_13D611:
	STA.w $2115
	STZ.w $1F8E
	REP.b #$20
	LDA.b $EC
	STA.w $2116
	RTS

CODE_13D61F:
	REP.b #$20
	LDA.b $EC
	STA.w $2181
	SEP.b #$20
	LDA.b $EE
	AND.b #$01
	STA.w $2183
	RTS

CODE_13D630:
	SEP.b #$20
	LDA.b #$55
	STA.w $2141
	REP.b #$20
	LDA.w #$BBAA
CODE_13D63C:
	CMP.w $2140
	BNE.b CODE_13D63C
	LDA.w #$0004
	STA.w $1F93
	STZ.b $EE
	RTS

CODE_13D64A:
	SEP.b #$20
	LDA.b $EC
	STA.w $2121
	RTS

DATA_13D652:
	dw CODE_13D65E
	dw CODE_13D65E
	dw CODE_13D65E
	dw CODE_13D65E
	dw CODE_13D65F
	dw CODE_13D65E

CODE_13D65E:
	RTS

CODE_13D65F:
	REP.b #$20
	LDA.b $EC
	BNE.b CODE_13D668
	LDA.w #$FFC0
CODE_13D668:
	STA.w $2142
	SEP.b #$20
	STZ.w $2141
	LDA.b $EE
	CLC
	ADC.b #$03
	STA.w $2140
	RTS

DATA_13D679:
	dw CODE_13D685
	dw CODE_13D6A1
	dw CODE_13D6B6
	dw CODE_13D6BA
	dw CODE_13D6BE
	dw CODE_13D6FA

CODE_13D685:
	STA.w $2180
	RTS

CODE_13D689:
	STA.b [$EC]
	INC.b $EC
	BEQ.b CODE_13D690
	RTS

CODE_13D690:
	INC.b $ED
	BEQ.b CODE_13D695
	RTS

CODE_13D695:
	REP.b #$20
	LDA.w #$8000
	STA.b $EC
	INC.b $EE
	SEP.b #$20
	RTS

CODE_13D6A1:
	BIT.w $1F8E
	BPL.b CODE_13D6AD
	STA.w $2119
	STZ.w $1F8E
	RTS

CODE_13D6AD:
	STA.w $2118
	LDA.b #$80
	STA.w $1F8E
	RTS

CODE_13D6B6:
	STA.w $2118
	RTS

CODE_13D6BA:
	STA.w $2119
	RTS

CODE_13D6BE:
	LSR.w $1F93
	BEQ.b CODE_13D6EA
	PHP
	REP.b #$10
	PHX
	PHA
	LDX.w #$0000
	LDA.w $1F93
	LSR
	BCC.b CODE_13D6D2
	INX
CODE_13D6D2:
	PLA
	STA.w $2142,x
	BCC.b CODE_13D6E7
	LDA.b #$01
	STA.w $2141
CODE_13D6DD:
	LDA.b #$CC
	STA.w $2140
	CMP.w $2140
	BNE.b CODE_13D6DD
CODE_13D6E7:
	PLX
	PLP
	RTS

CODE_13D6EA:
	STA.w $2141
	LDA.b $EE
	STA.w $2140
CODE_13D6F2:
	CMP.w $2140
	BNE.b CODE_13D6F2
	INC.b $EE
	RTS

CODE_13D6FA:
	STA.w $2122
	RTS

DATA_13D6FE:
	dw CODE_13D70A
	dw CODE_13D75B
	dw CODE_13D788
	dw CODE_13D7D9
	dw CODE_13D82A
	dw CODE_13D82B

CODE_13D70A:
	LDA.b $D8
	STA.w $2180
	LDA.b $D9
	STA.w $2180
	LDA.b $DA
	STA.w $2180
	LDA.b $DB
	STA.w $2180
	LDA.b $DC
	STA.w $2180
	LDA.b $DD
	STA.w $2180
	LDA.b $DE
	STA.w $2180
	LDA.b $DF
	STA.w $2180
	LDA.b $E0
	STA.w $2180
	LDA.b $E1
	STA.w $2180
	LDA.b $E2
	STA.w $2180
	LDA.b $E3
	STA.w $2180
	LDA.b $E4
	STA.w $2180
	LDA.b $E5
	STA.w $2180
	LDA.b $E6
	STA.w $2180
	LDA.b $E7
	STA.w $2180
	RTS

CODE_13D75B:
	REP.b #$20
	LDA.b $D8
	STA.w $2118
	LDA.b $DA
	STA.w $2118
	LDA.b $DC
	STA.w $2118
	LDA.b $DE
	STA.w $2118
	LDA.b $E0
	STA.w $2118
	LDA.b $E2
	STA.w $2118
	LDA.b $E4
	STA.w $2118
	LDA.b $E6
	STA.w $2118
	SEP.b #$20
	RTS

CODE_13D788:
	LDA.b $D8
	STA.w $2118
	LDA.b $D9
	STA.w $2118
	LDA.b $DA
	STA.w $2118
	LDA.b $DB
	STA.w $2118
	LDA.b $DC
	STA.w $2118
	LDA.b $DD
	STA.w $2118
	LDA.b $DE
	STA.w $2118
	LDA.b $DF
	STA.w $2118
	LDA.b $E0
	STA.w $2118
	LDA.b $E1
	STA.w $2118
	LDA.b $E2
	STA.w $2118
	LDA.b $E3
	STA.w $2118
	LDA.b $E4
	STA.w $2118
	LDA.b $E5
	STA.w $2118
	LDA.b $E6
	STA.w $2118
	LDA.b $E7
	STA.w $2118
	RTS

CODE_13D7D9:
	LDA.b $D8
	STA.w $2119
	LDA.b $D9
	STA.w $2119
	LDA.b $DA
	STA.w $2119
	LDA.b $DB
	STA.w $2119
	LDA.b $DC
	STA.w $2119
	LDA.b $DD
	STA.w $2119
	LDA.b $DE
	STA.w $2119
	LDA.b $DF
	STA.w $2119
	LDA.b $E0
	STA.w $2119
	LDA.b $E1
	STA.w $2119
	LDA.b $E2
	STA.w $2119
	LDA.b $E3
	STA.w $2119
	LDA.b $E4
	STA.w $2119
	LDA.b $E5
	STA.w $2119
	LDA.b $E6
	STA.w $2119
	LDA.b $E7
	STA.w $2119
	RTS

CODE_13D82A:
	RTS

CODE_13D82B:
	LDA.b $D8
	STA.w $2122
	LDA.b $D9
	STA.w $2122
	LDA.b $DA
	STA.w $2122
	LDA.b $DB
	STA.w $2122
	LDA.b $DC
	STA.w $2122
	LDA.b $DD
	STA.w $2122
	LDA.b $DE
	STA.w $2122
	LDA.b $DF
	STA.w $2122
	LDA.b $E0
	STA.w $2122
	LDA.b $E1
	STA.w $2122
	LDA.b $E2
	STA.w $2122
	LDA.b $E3
	STA.w $2122
	LDA.b $E4
	STA.w $2122
	LDA.b $E5
	STA.w $2122
	LDA.b $E6
	STA.w $2122
	LDA.b $E7
	STA.w $2122
	RTS

CODE_13D87C:
	STX.b $EC
	STY.w $1F8A
	TAX
	XBA
	AND.w #$00FE
	STA.b $F6
	TXA
	AND.w #$00FF
	STA.b $EE
	LDA.w SXAR_UnsortedDataBlock2_DATA_14AF9E,y
	STA.w $1F8C
	LDA.w SXAR_UnsortedDataBlock2_DataBlockSize,y
	STA.b $F4
CODE_13D899:
	TYA
	ASL
	TAY
	LDA.w SXAR_UnsortedDataBlock2_Ptrs,y
	CLC
	ADC.w #SXAR_UnsortedDataBlock2_Main&$8000
	ORA.w #SXAR_UnsortedDataBlock2_Main&$8000
	STA.b $E8
	PHP
	LDA.w SXAR_UnsortedDataBlock2_Ptrs+$02,y
	ASL
	PLP
	ADC.w #SXAR_UnsortedDataBlock2_Main>>16
	STA.b $EA
	RTS

CODE_13D8B4:
	LDX.w #$0000
	LDY.w #$0003
	JSR.w CODE_13D9E5
CODE_13D8BD:
	PHP
	JSR.w CODE_13D90E
	JSR.w CODE_13DA1A
	JSR.w CODE_13DAF0
	JSR.w CODE_13DA3C
	REP.b #$20
	STZ.w $11B4
	STZ.w $11B6
	STZ.w $11B8
	STZ.w $11BA
	STZ.w $11BC
	STZ.w $11BE
	PLP
	RTS

CODE_13D8E0:
	JSR.w CODE_13D94F
	JSR.w CODE_13D959
	JMP.w CODE_13D8E0

CODE_13D8E9:
	STZ.b $04
	STZ.b $1D
	RTS

CODE_13D8EE:
	JSR.w CODE_13D8F5
	DEX
	BNE.b CODE_13D8EE
	RTS

CODE_13D8F5:
	LDA.b $00
CODE_13D8F7:
	PHA
	PHX
	JSR.w CODE_13A474
	PLX
	PLA
	CMP.b $00
	BEQ.b CODE_13D8F7
	RTS

CODE_13D903:
	PHP
	SEP.b #$20
	STZ.w $11B0
	JSR.w CODE_13D8F5
	PLP
	RTS

CODE_13D90E:
	PHP
	SEP.b #$20
	LDA.b #$80
	STA.w $11B0
	JSR.w CODE_13D8F5
	PLP
	RTS

CODE_13D91B:
	LDA.w #$0420
	STA.w $4302
	LDA.w #$0200
	STA.w $4305
	SEP.b #$20
	LDA.b #$22
	STA.w $4301
	STZ.w $2121
	STZ.w $4300
	STZ.w $4307
	STZ.w $4304
	LDA.b #$01
	STA.w $420B
	REP.b #$20
	RTS

CODE_13D942:
	PHP
	SEP.b #$20
	LDA.w $11B0
	EOR.b #$08
	STA.w $11B0
	PLP
	RTS

CODE_13D94F:
	PHP
	SEP.b #$20
	LDA.b #$08
	STA.w $2100
	PLP
	RTS

CODE_13D959:
	PHP
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	PLP
	RTS

CODE_13D963:						; Note: I don't think these absolute address instructions are meant to point to bank 14.
	LDX.w #$0000
CODE_13D966:
	LDA.b $0A
	SEC
	SBC.b $00,x
	EOR.w $148000,x
	CLC
	ADC.w $14E800,x
	STA.b $0A
	LDA.b $0C
	CLC
	ADC.b $00,x
	EOR.w $14E000,x
	LSR
	EOR.w $148000,x
	STA.b $0C
	LDA.b $0E
	EOR.b $00,x
	CLC
	ADC.w $144000,x
	SEC
	SBC.w $148000,x
	STA.b $0E
	INX
	INX
	CPX.w #$0800
	BNE.b CODE_13D966
	RTS

CODE_13D998:
	PHX
	PHY
	SEP.b #$30
	ROR.b $0E
	LDA.b $0D
	TAY
	ROR
	STA.b $0E
	LDA.b $0C
	TAX
	ASL
	ASL
	ASL
	ASL
	STA.b $0D
	LDA.b $0B
	STA.b $0C
	LSR
	LSR
	LSR
	LSR
	ORA.b $0D
	EOR.b $0E
	STX.b $0D
	LDX.b $0A
	STX.b $0B
	STA.b $0A
	STY.b $0E
	REP.b #$30
	PLY
	PLX
	RTS

CODE_13D9C8:
	PHP
	JSR.w CODE_13D903
	SEP.b #$20
	LDA.b #$00
	STA.w $11AE
CODE_13D9D3:
	JSR.w CODE_13DA00
	INC.w $11AE
	LDA.w $11AE
	STA.w $11B0
	CMP.b #$0F
	BNE.b CODE_13D9D3
	PLP
	RTS

CODE_13D9E5:
	PHP
	SEP.b #$20
	LDA.b #$0F
	STA.w $11AE
CODE_13D9ED:
	JSR.w CODE_13DA00
	LDA.w $11AE
	STA.w $11B0
	DEC.w $11AE
	BPL.b CODE_13D9ED
	JSR.w CODE_13D90E
	PLP
CODE_13D9FF:
	RTS

CODE_13DA00:
	PHP
	PHY
	REP.b #$20
CODE_13DA04:
	PHY
	PHX
	JSR.w CODE_13D8F5
	JSR.w (DATA_13DA14,x)
	PLX
	PLY
	DEY
	BNE.b CODE_13DA04
	PLY
	PLP
	RTS

DATA_13DA14:
	dw CODE_13D9FF
	dw CODE_13810E
	dw CODE_138108

CODE_13DA1A:
	PHP
	REP.b #$30
	LDA.w #$E020
	LDX.w #$00FE
CODE_13DA23:
	STA.w $0200,x
	STA.w $0300,x
	DEX
	DEX
	BPL.b CODE_13DA23
	LDX.w #$001E
	LDA.w #$FFFF
CODE_13DA33:
	STA.w $0400,x
	DEX
	DEX
	BPL.b CODE_13DA33
	PLP
	RTS

CODE_13DA3C:
	PHP
	SEP.b #$20
	LDA.b #$8F
	STA.w $11B0
	STA.w $2100
	STZ.w $2101
	STZ.w $2102
	STZ.w $2103
	STZ.w $2104
	STZ.w $2105
	STZ.w $2106
	STZ.w $2107
	STZ.w $2108
	STZ.w $2109
	STZ.w $210A
	STZ.w $210B
	STZ.w $210C
	STZ.w $210D
	STZ.w $210D
	STZ.w $210E
	STZ.w $210E
	STZ.w $210F
	STZ.w $210F
	STZ.w $2110
	STZ.w $2110
	STZ.w $2111
	STZ.w $2111
	STZ.w $2112
	STZ.w $2112
	STZ.w $2113
	STZ.w $2113
	STZ.w $2114
	STZ.w $2114
	LDA.b #$80
	STA.w $2115
	STZ.w $2116
	STZ.w $2117
	STZ.w $211A
	STZ.w $2123
	STZ.w $2124
	STZ.w $2125
	STZ.w $2126
	STZ.w $2127
	STZ.w $2128
	STZ.w $2129
	STZ.w $212A
	STZ.w $212B
	STZ.w $212C
	STZ.w $212D
	STZ.w $212E
	STZ.w $212F
	LDA.b #$30
	STA.w $2130
	STZ.w $2131
	LDA.b #$E0
	STA.w $2132
	STZ.w $2133
	PLP
	RTS

CODE_13DAE2:
	PHP
	SEP.b #$20
	STZ.w $420B
	STZ.w $420C
	STZ.w $420D
	PLP
	RTS

CODE_13DAF0:
	LDA.b $04
	AND.w #$7FFF
	STA.b $04
	RTS

CODE_13DAF8:
	LDA.b $04
	ORA.w #$8000
	STA.b $04
	RTS

CODE_13DB00:
	PHP
	SEI
	SEP.b #$20
	LDA.w $11B2
	AND.b #$CF
	STA.w $11B2
	STA.w $4200
	REP.b #$20
	LDA.w #$00B0
	STA.w $4209
	SEP.b #$20
	LDA.w $11B2
	ORA.b #$20
	STA.w $11B2
	STA.w $4200
	PLP
	CLI
	RTS

CODE_13DB27:
	PHP
	SEI
	SEP.b #$20
	LDA.w $11B2
	AND.b #$CF
	STA.w $11B2
	STA.w $4200
	PLP
	RTS

CODE_13DB38:
	PHP
	SEP.b #$20
	LDA.w $11F8
	STA.w $2112
	STZ.w $2112
	PLP
	RTL

CODE_13DB46:
	PHP
	REP.b #$30
	LDA.b $04
	BIT.w #$8000
	BEQ.b CODE_13DBC5
	STZ.w $2102
	LDA.w #$0200
	STA.w $4302
	LDA.w #$0220
	STA.w $4305
	SEP.b #$20
	LDA.b #$04
	STA.w $4301
	STZ.w $4300
	STZ.w $4307
	STZ.w $4304
	LDA.b #$01
	STA.w $420B
	REP.b #$20
	LDA.b $04
	BIT.w #$2000
	BEQ.b CODE_13DB87
	JSR.w CODE_138E7B
	LDA.b $04
	EOR.w #$2000
	STA.b $04
CODE_13DB87:
	BIT.w #$0400
	BEQ.b CODE_13DB98
	JSR.w CODE_13DC34
	LDA.b $04
	EOR.w #$0400
	STA.b $04
	BRA.b CODE_13DBB6

CODE_13DB98:
	BIT.w #$1000
	BEQ.b CODE_13DBA7
	JSR.w CODE_13D91B
	LDA.b $04
	EOR.w #$1000
	STA.b $04
CODE_13DBA7:
	BIT.w #$0800
	BEQ.b CODE_13DBB6
	JSR.w CODE_13935B
	LDA.b $04
	EOR.w #$0800
	STA.b $04
CODE_13DBB6:
	BIT.w #$4000
	BEQ.b CODE_13DBC5
	JSR.w CODE_1393F8
	LDA.b $04
	EOR.w #$4000
	STA.b $04
CODE_13DBC5:
	SEP.b #$20
	LDA.w $11B0
	STA.w $2100
	LDA.w $11B4
	STA.w $210D
	LDA.w $11B5
	STA.w $210D
	LDA.w $11BA
	STA.w $210E
	LDA.w $11BB
	STA.w $210E
	LDA.w $11B6
	STA.w $210F
	LDA.w $11B7
	STA.w $210F
	LDA.w $11BC
	STA.w $2110
	LDA.w $11BD
	STA.w $2110
	LDA.w $11B8
	STA.w $2111
	LDA.w $11B9
	STA.w $2111
	LDA.w $11BE
	STA.w $2112
	LDA.w $11BF
	STA.w $2112
	REP.b #$20
	INC.b $00
	LDA.w $11C2
	STA.w $11C4
	LDA.w $4218
	STA.w $11C2
	LDA.w $11C4
	EOR.w #$FFFF
	AND.w $11C2
	STA.w $11C6
	PLP
	RTL

ADDR_13DC33:
	RTI

CODE_13DC34:
	JMP.w ($0006)

	%InsertGarbageData($13DC37, incbin, DATA_13DC37.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank14Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

MainDataBank02:

DATA_148000:
	dw $0620,$064A,$0674,$069E,$06C8,$06F2,$071C,$0746
	dw $0770,$079A,$07C4,$07EE,$0818,$0842,$086C,$0896
	dw $08C0,$08EA,$0914,$093E

UNK_148028:
	dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E
	dw $0020,$0022,$0024,$0026,$0028,$002A,$002C,$002E
	dw $0040,$0042,$0044,$0046,$0048,$004A,$004C,$004E
	dw $0060,$0062,$0064,$0066,$0068,$006A,$006C,$006E
	dw $0080,$0082,$0084,$0086,$0088,$008A,$008C,$008E
	dw $00A0,$00A2,$00A4,$00A6,$00A8,$00AA,$00AC,$00AE
	dw $00C0,$00C2,$00C4,$00C6,$00C8,$00CA,$00CC,$00CE
	dw $00E0,$00E2,$00E4,$00E6,$00E8,$00EA,$00EC,$00EE
	dw $0100,$0102,$0104,$0106,$0108,$010A,$010C,$010E
	dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E
	dw $0140,$0142,$0144,$0146,$0148,$014A,$014C,$014E
	dw $0160,$0162,$0164,$0166,$0168,$016A,$016C,$016E
	dw $0180,$0182,$0184,$0186,$0188,$018A,$018C,$018E
	dw $01A0,$01A2,$01A4,$01A6,$01A8,$01AA,$01AC,$01AE
	dw $01C0,$01C2,$01C4,$01C6,$01C8,$01CA,$01CC,$01CE
	dw $01E0,$01E2,$01E4,$01E6,$01E8,$01EA,$01EC,$01EE

DATA_148128:
	db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02,$03,$03,$03,$03
	db $04,$04,$04,$04,$05,$05,$05,$05,$06,$06,$06,$06,$07,$07,$07,$07
	db $08,$08,$08,$08,$09,$09,$09,$09,$0A,$0A,$0A,$0A,$0B,$0B,$0B,$0B
	db $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F
	db $10,$10,$10,$10,$11,$11,$11,$11,$12,$12,$12,$12,$13,$13,$13,$13
	db $14,$14,$14,$14,$15,$15,$15,$15,$16,$16,$16,$16,$17,$17,$17,$17
	db $18,$18,$18,$18,$19,$19,$19,$19,$1A,$1A,$1A,$1A,$1B,$1B,$1B,$1B
	db $1C,$1C,$1C,$1C,$1D,$1D,$1D,$1D,$1E,$1E,$1E,$1E,$1F,$1F,$1F,$1F

DATA_1481A8:
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40

DATA_148228:
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80

DATA_1482A8:
	dw $0000,$0080,$0100,$0180,$0C00,$0C80,$0D00,$0D80
	dw $1800,$1880,$1900,$1980,$2400,$2480,$2500,$2580
	dw $3000,$3080,$3100,$3180,$3C00,$3C80,$3D00,$3D80
	dw $4800,$4880,$4900,$4980,$5400,$5480,$5500,$5580

DATA_1482E8:
	dw DATA_1482F0,DATA_14830A,DATA_148324,DATA_14833E

DATA_1482F0:
	dw $018A,$0010,!Define_SXAR_Graphics_FGBG_GambitLevel,!Define_SXAR_Graphics_Sprite_GambitLevelEnemies,$0000,$0000,$0080,$0080
	dw CODE_138226,DATA_148358,$0037,!Define_SXAR_Palette_FGBG_Gambit1,!Define_SXAR_Palette_Sprite_Gambit1

DATA_14830A:
	dw $0010,$0100,!Define_SXAR_Graphics_FGBG_GambitLevel,!Define_SXAR_Graphics_Sprite_GambitLevelEnemies,$0000,$0F20,$0080,$0FF0
	dw CODE_1382B2,DATA_148510,$0031,!Define_SXAR_Palette_FGBG_Gambit2,!Define_SXAR_Palette_Sprite_Gambit1

DATA_148324:
	dw $0080,$0010,!Define_SXAR_Graphics_FGBG_FinalGambitLevel,!Define_SXAR_Graphics_Sprite_GambitLevelEnemies,$06FE,$0000,$07E6,$00A0
	dw CODE_138325,DATA_148698,$0015,!Define_SXAR_Palette_FGBG_FinalGambit,!Define_SXAR_Palette_Sprite_Gambit1

DATA_14833E:
	dw $0080,$0010,!Define_SXAR_Graphics_FGBG_FinalGambitLevel,!Define_SXAR_Graphics_Sprite_WalkingStormEnemiesAndGlobalSprites,$06FE,$0000,$07D8,$0080
	dw CODE_138362,DATA_148740,$0010,!Define_SXAR_Palette_FGBG_FinalGambit,!Define_SXAR_Palette_Sprite_Storm3

DATA_148358:
	dw $0248,$00D0,CODE_13ACB8,DATA_14884C
	dw $056E,$00A0,CODE_13ACB8,DATA_14889C
	dw $0BFE,$0060,CODE_13ACB8,DATA_14889C
	dw $10AE,$0088,CODE_13ACB8,DATA_14889C
	dw $1518,$0068,CODE_13ACB8,DATA_14889C
	dw $05EE,$0040,CODE_13ACB8,DATA_148892
	dw $06EC,$0080,CODE_13ACB8,DATA_1488B0
	dw $0770,$0050,CODE_13ACB8,DATA_148892
	dw $0770,$0080,CODE_13ACB8,DATA_148892
	dw $080E,$00D0,CODE_13ACB8,DATA_148860
	dw $08AC,$0060,CODE_13ACDD,DATA_1488C4
	dw $08AC,$0060,CODE_13ACDD,DATA_1488CE
	dw $08AC,$0060,CODE_13ACDD,DATA_1488D8
	dw $08AC,$0060,CODE_13ACB8,DATA_1488B0
	dw $0A0C,$0030,CODE_13ACDD,DATA_1488C4
	dw $0A0C,$0030,CODE_13ACDD,DATA_1488CE
	dw $0A0C,$0030,CODE_13ACDD,DATA_1488D8
	dw $0B92,$0020,CODE_13ACDD,DATA_1488C4
	dw $0B92,$0020,CODE_13ACDD,DATA_1488CE
	dw $0B92,$0020,CODE_13ACDD,DATA_1488D8
	dw $0D10,$00D0,CODE_13ACB8,DATA_14886A
	dw $0D70,$00D0,CODE_13ACB8,DATA_148860
	dw $032A,$00D0,CODE_13ACB8,DATA_1488B0
	dw $04A4,$00B0,CODE_13ACB8,DATA_1488B0
	dw $01D0,$0050,CODE_13ACB8,DATA_148892
	dw $02F0,$0050,CODE_13ACB8,DATA_148888
	dw $01C0,$00D0,CODE_13ACDD,DATA_1488C4
	dw $01C0,$00D0,CODE_13ACDD,DATA_1488CE
	dw $01C0,$00D0,CODE_13ACDD,DATA_1488D8
	dw $0AA4,$0040,CODE_13ACB8,DATA_1488BA
	dw $0A44,$0080,CODE_13ACB8,DATA_1488BA
	dw $0B04,$00C0,CODE_13ACB8,DATA_1488BA
	dw $0D70,$0040,CODE_13ACB8,DATA_148888
	dw $0DA0,$0040,CODE_13ACB8,DATA_148860
	dw $0E14,$0090,CODE_13ACB8,DATA_148842
	dw $0F70,$0050,CODE_13ACB8,DATA_148888
	dw $1168,$0030,CODE_13ACB8,DATA_1488B0
	dw $1168,$00D0,CODE_13ACB8,DATA_1488B0
	dw $1290,$00D0,CODE_13ACB8,DATA_14884C
	dw $19BA,$0060,CODE_13ACB8,DATA_1488B0
	dw $12D0,$0060,CODE_13ACDD,DATA_1488C4
	dw $12D0,$0060,CODE_13ACDD,DATA_1488CE
	dw $12D0,$0060,CODE_13ACDD,DATA_1488D8
	dw $1330,$0070,CODE_13ACB8,DATA_148888
	dw $1350,$0060,CODE_13ACB8,DATA_148888
	dw $1208,$0100,CODE_13ACB8,DATA_14882E
	dw $1370,$0100,CODE_13ACB8,DATA_14882E
	dw $13C8,$0100,CODE_13ACB8,DATA_148838
	dw $1428,$0100,CODE_13ACB8,DATA_148838
	dw $14D0,$00D0,CODE_13ACB8,DATA_14884C
	dw $15C0,$00A0,CODE_13ACDD,DATA_1488C4
	dw $15C0,$00A0,CODE_13ACDD,DATA_1488CE
	dw $15C0,$00A0,CODE_13ACDD,DATA_1488D8
	dw $1520,$0080,CODE_13ACB8,DATA_14886A
	dw $1630,$0080,CODE_13ACB8,DATA_1488B0

DATA_148510:
	dw $00F4,$0EC0,CODE_13ACDD,DATA_1488E2
	dw $00F4,$0EC0,CODE_13ACDD,DATA_1488EC
	dw $00F4,$0EC0,CODE_13ACDD,DATA_1488F6
	dw $0070,$0EA0,CODE_13ACB8,DATA_1488B0
	dw $0088,$0E40,CODE_13ACB8,DATA_148888
	dw $001C,$0D24,CODE_13ACDD,DATA_14893C
	dw $001C,$0D24,CODE_13ACDD,DATA_148946
	dw $001C,$0D24,CODE_13ACDD,DATA_148950
	dw $00F4,$0C90,CODE_13ACDD,DATA_1488E2
	dw $00F4,$0C90,CODE_13ACDD,DATA_1488EC
	dw $00F4,$0C90,CODE_13ACDD,DATA_1488F6
	dw $00EC,$0C70,CODE_13ACB8,DATA_1488B0
	dw $00C0,$0BF0,CODE_13ACB8,DATA_1488B0
	dw $009E,$0B70,CODE_13ACB8,DATA_1488B0
	dw $0066,$0B20,CODE_13ACB8,DATA_148888
	dw $00F4,$0AD0,CODE_13ACDD,DATA_1488E2
	dw $00F4,$0AD0,CODE_13ACDD,DATA_1488EC
	dw $00F4,$0AD0,CODE_13ACDD,DATA_1488F6
	dw $0030,$09D0,CODE_13ACDD,DATA_14895A
	dw $0030,$09D0,CODE_13ACDD,DATA_148964
	dw $00D0,$09D0,CODE_13ACDD,DATA_148900
	dw $00D0,$09D0,CODE_13ACDD,DATA_14890A
	dw $0036,$09D0,CODE_13ACB8,DATA_148888
	dw $00C4,$09D0,CODE_13ACB8,DATA_148888
	dw $002E,$07C8,CODE_13ACB8,DATA_148888
	dw $00AC,$0758,CODE_13ACDD,DATA_148900
	dw $00AC,$0758,CODE_13ACDD,DATA_14890A
	dw $00AC,$0758,CODE_13ACDD,DATA_148914
	dw $00AC,$0758,CODE_13ACDD,DATA_14891E
	dw $00AC,$0758,CODE_13ACDD,DATA_148928
	dw $00AC,$0758,CODE_13ACDD,DATA_148932
	dw $001E,$06E8,CODE_13ACB8,DATA_1488B0
	dw $0080,$06E8,CODE_13ACB8,DATA_1488B0
	dw $00EE,$0607,CODE_13ACDD,DATA_1488C4
	dw $00EE,$0607,CODE_13ACDD,DATA_1488CE
	dw $00B0,$0548,CODE_13ACB8,DATA_1488B0
	dw $00B8,$0510,CODE_13ACB8,DATA_148874
	dw $0050,$0470,CODE_13ACB8,DATA_148860
	dw $00B0,$0470,CODE_13ACB8,DATA_148860
	dw $0058,$03B8,CODE_13ACDD,DATA_14893C
	dw $0058,$03B8,CODE_13ACDD,DATA_148946
	dw $0058,$03B8,CODE_13ACDD,DATA_148950
	dw $0072,$03B8,CODE_13ACB8,DATA_148888
	dw $0030,$02D0,CODE_13ACB8,DATA_14887E
	dw $00C0,$0218,CODE_13ACB8,DATA_1488B0
	dw $00B0,$01C0,CODE_13ACB8,DATA_14887E
	dw $0090,$0072,CODE_13ACB8,DATA_1487F2
	dw $0071,$0072,CODE_13ACB8,DATA_1487FC
	dw $0080,$004A,CODE_13ACB8,DATA_148806

DATA_148698:
	dw $0700,$0070,CODE_13ACB8,DATA_148888
	dw $0670,$0050,CODE_13ACB8,DATA_148860
	dw $0530,$003A,CODE_13ACDD,DATA_1488C4
	dw $0530,$003A,CODE_13ACDD,DATA_1488CE
	dw $0530,$003A,CODE_13ACDD,DATA_1488D8
	dw $04B8,$00D0,CODE_13ACB8,DATA_148874
	dw $0418,$0060,CODE_13ACB8,DATA_1488B0
	dw $0380,$0070,CODE_13ACB8,DATA_1488B0
	dw $037C,$00D0,CODE_13ACB8,DATA_148856
	dw $0238,$0080,CODE_13ACB8,DATA_148856
	dw $0110,$006A,CODE_13ACDD,DATA_1488C4
	dw $0110,$006A,CODE_13ACDD,DATA_1488CE
	dw $0110,$006A,CODE_13ACDD,DATA_1488D8
	dw $01B0,$0070,CODE_13ACB8,DATA_1488B0
	dw $01C0,$00D0,CODE_13ACB8,DATA_148860
	dw $0250,$00D0,CODE_13ACB8,DATA_148860
	dw $0208,$00D0,CODE_13ACB8,DATA_148860
	dw $0174,$0070,CODE_13ACB8,DATA_1488B0
	dw $0094,$0030,CODE_13ACB8,DATA_1488B0
	dw $0078,$00D0,CODE_13ACB8,DATA_14884C
	dw $00EF,$0063,CODE_13ACB8,DATA_148888

DATA_148740:
	dw $0768,$0060,CODE_13ACB8,DATA_14881A
	dw $06A0,$0070,CODE_13ACB8,DATA_148810
	dw $0542,$00B0,CODE_13ACB8,DATA_148824
	dw $04E2,$0080,CODE_13ACB8,DATA_148810
	dw $047E,$0070,CODE_13ACB8,DATA_148824
	dw $0360,$00D0,CODE_13ACB8,DATA_148810
	dw $0430,$0060,CODE_13ACB8,DATA_14881A
	dw $0214,$0080,CODE_13ACB8,DATA_148824
	dw $013E,$0090,CODE_13ACB8,DATA_14881A
	dw $00B2,$0090,CODE_13ACB8,DATA_148810
	dw $0050,$0040,CODE_13ACB8,DATA_148824
	dw $0618,$00D0,CODE_13ACB8,DATA_1487C0
	dw $0474,$00D0,CODE_13ACB8,DATA_1487CA
	dw $0252,$00D0,CODE_13ACB8,DATA_1487D4
	dw $0178,$0050,CODE_13ACB8,DATA_1487DE
	dw $0068,$00D0,CODE_13ACB8,DATA_1487E8

DATA_1487C0:
	dw CODE_13C634,DATA_14A96C,$0004,$0001,$0000

DATA_1487CA:
	dw CODE_13C634,DATA_14A96C,$0004,$0001,$0002

DATA_1487D4:
	dw CODE_13C634,DATA_14A96C,$0004,$0001,$0004

DATA_1487DE:
	dw CODE_13C634,DATA_14A96C,$0004,$0001,$0006

DATA_1487E8:
	dw CODE_13C634,DATA_14A96C,$0004,$0001,$0008

DATA_1487F2:
	dw CODE_13C27A,DATA_149198,$0012,$0000,$0000

DATA_1487FC:
	dw CODE_13C27A,DATA_149294,$0012,$0000,$0000

DATA_148806:
	dw CODE_13C0F3,DATA_149178,$002C,$0000,$0000

DATA_148810:
	dw CODE_13C746,DATA_14A9BC,$0004,$0000,$0000

DATA_14881A:
	dw CODE_13C81F,DATA_14A9C6,$0004,$0000,$0000

DATA_148824:
	dw CODE_13C81F,DATA_14A9D0,$0004,$0000,$0000

DATA_14882E:
	dw CODE_13C04B,DATA_14A738,$0000,$0000,$0000

DATA_148838:
	dw CODE_13C04B,DATA_14A738,$0000,$0002,$0000

DATA_148842:
	dw CODE_13B2CB,DATA_148A34,$0000,$0000,$0000

DATA_14884C:
	dw CODE_13ADDA,DATA_14A7CE,$0004,$0050,$0050

DATA_148856:
	dw CODE_13ADDA,DATA_14A7CE,$0004,$0040,$0040

DATA_148860:
	dw CODE_13AF7B,DATA_14A7B6,$0003,$0040,$0040

DATA_14886A:
	dw CODE_13AF7B,DATA_14A7B6,$0003,$0050,$0050

DATA_148874:
	dw CODE_13AF7B,DATA_14A7B6,$0003,$0030,$0030

DATA_14887E:
	dw CODE_13AF7B,DATA_14A7B6,$0003,$0018,$0018

DATA_148888:
	dw CODE_13AE53,DATA_14A808,$0004,$0000,$0000

DATA_148892:
	dw CODE_13AE53,DATA_14A810,$0004,$0000,$0000

DATA_14889C:
	dw CODE_13AD19,DATA_14A874,$0002,$0000,$0010

UNK_1488A6:
	dw CODE_13AD19,DATA_14A84C,$0002,$0000,$FF06

DATA_1488B0:
	dw CODE_13B148,DATA_14A738,$0003,$0028,$001E

DATA_1488BA:
	dw CODE_13B5A0,DATA_14A79E,$0006,$09C0,$0BC0

DATA_1488C4:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$0001

DATA_1488CE:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$0019

DATA_1488D8:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$0031

DATA_1488E2:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$0190

DATA_1488EC:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$01A8

DATA_1488F6:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$01C0

DATA_148900:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$012C

DATA_14890A:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$0144

DATA_148914:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$015C

DATA_14891E:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$0174

DATA_148928:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$018C

DATA_148932:
	dw CODE_13B18E,DATA_14A75E,$0001,$FFFF,$01A4

DATA_14893C:
	dw CODE_13B18E,DATA_14A75E,$0001,$0001,$0190

DATA_148946:
	dw CODE_13B18E,DATA_14A75E,$0001,$0001,$01A8

DATA_148950:
	dw CODE_13B18E,DATA_14A75E,$0001,$0001,$01C0

DATA_14895A:
	dw CODE_13B18E,DATA_14A75E,$0001,$0001,$012C

DATA_148964:
	dw CODE_13B18E,DATA_14A75E,$0001,$0001,$0144

DATA_14896E:
	dw DATA_14899E,DATA_148A60,DATA_148A4E,DATA_148A06,DATA_148A86,DATA_148B08,DATA_148B08,DATA_148AFE

DATA_14897E:
	dw CODE_13A69F
	dw CODE_13A774
	dw CODE_13A774
	dw CODE_13A7F8
	dw CODE_13A84A
	dw CODE_13A8B7
	dw CODE_13A8B7
	dw CODE_13A992

DATA_14898E:
	dw DATA_148A26,DATA_148A34,DATA_148A34,DATA_148A2E,DATA_148B10,DATA_148B1E,DATA_148B1E,DATA_148B18

DATA_14899E:
	dw $0002,$0001,CODE_138448

DATA_1489A4:
	dw $001C,$0002,CODE_13846D,$0020,$001C,$0005,$0002,$0001
	dw CODE_13844C,$0000,CODE_138448

DATA_1489BA:
	dw $0024,$0001,CODE_138448

DATA_1489C0:
	dw $0028,$0002,CODE_13846D,$0000,$0028,$0005,$0024,$0001
	dw CODE_13844C,$0000,CODE_138448

DATA_1489D6:
	dw CODE_13844C,$0000,$0004,$0005,$0006,$0005,$0008,$0005
	dw $000A,$0005,$000C,$0005,$000E,$0005,$0010,$0005
	dw $0012,$0005,$0014,$0005,$0016,$0005,CODE_138421,DATA_1489D6

DATA_148A06:
	dw $002A,$0003,$0018,$0003,CODE_138448

DATA_148A10:
	dw $001A,$0002,CODE_13846D,$000C,$001A,$0005,$0018,$0001
	dw CODE_13844C,$0000,CODE_138448

DATA_148A26:
	dw $002A,$0006,$0018,$0009

DATA_148A2E:
	dw $002C,$0046,CODE_138448

DATA_148A34:
	dw CODE_138428,$0028,CODE_138448

DATA_148A3A:
	dw $001E,$0007,CODE_138421,DATA_148A4E

DATA_148A42:
	dw $0020,$0007,CODE_138421,DATA_148A4E

DATA_148A4A:
	dw $0022,$0007

DATA_148A4E:
	dw CODE_138479,$0001,CODE_138421,DATA_148A4E

DATA_148A56:
	dw $0026,$0003,$0002,$0001,CODE_138448

DATA_148A60:
	dw $0038,$0007

DATA_148A64:
	dw $003A,$0001,CODE_138421,DATA_148A64

DATA_148A6C:
	dw CODE_13844C,$0000,$0002,$0050,$002A,$0050,$0018,$0050
	dw CODE_138456,$00FF,$0018,$07D0,CODE_138448

DATA_148A86:
	dw $0002,$0001,CODE_138448

DATA_148A8C:
	dw CODE_13844C,$0000,$0002,$0050,$0018,$0050,$001A,$0050
	dw CODE_138456,$00FF,$001A,$07D0,CODE_138448

DATA_148AA6:
	dw $0026,$0002,CODE_13846D,$0018,$0026,$0005,$0002,$0001
	dw CODE_13844C,$0000,CODE_138448

DATA_148ABC:
	dw $002A,$0002,CODE_13846D,$001A,$002A,$0005,$001A,$0001
	dw CODE_13844C,$0000,CODE_138448

DATA_148AD2:
	dw $0004,$0005,$0006,$0005,$0008,$0005,$000A,$0005,$000C
	dw $0005,$000E,$0005,$0010,$0005,$0012,$0005,$0014,$0005
	dw $0016,$0005,CODE_138421,DATA_148AD2

DATA_148AFE:
	dw $0018,$0003,$001A,$0003,CODE_138448

DATA_148B08:
	dw CODE_1384BA,$0001,CODE_138421,DATA_148B08

DATA_148B10:
	dw $0018,$0006,$001A,$0009

DATA_148B18:
	dw $001C,$0046,CODE_138448

DATA_148B1E:
	dw CODE_138428,$0028,CODE_138448

DATA_148B24:
	dw DATA_1492B0,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6
	dw DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492EC,DATA_1492EC,DATA_1492B6,DATA_149322
	dw DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6
	dw DATA_1492B6,DATA_149322,DATA_149322,DATA_149322,DATA_149322,DATA_149322,DATA_149358,DATA_1492B6
	dw DATA_149552,DATA_149560,DATA_14956E,DATA_14957C,DATA_14958A,DATA_149598,DATA_1495A6,DATA_1495B4
	dw DATA_1495C2,DATA_1495E8,DATA_14960E,DATA_149634,DATA_14965A,DATA_149680,DATA_1496A6,DATA_1496CC
	dw DATA_1496F2,DATA_149718,DATA_14973E,DATA_149764,DATA_14978A,DATA_1497B0,DATA_1497D6,DATA_1497FC
	dw DATA_149822,DATA_149848,DATA_14986E,DATA_149884,DATA_14989A,DATA_1498B0,DATA_1498D6,DATA_1498FC
	dw DATA_149922,DATA_149930,DATA_14993E,DATA_1499F4,DATA_149A0A,DATA_14994C,DATA_14995A,DATA_149A18
	dw DATA_149A26,DATA_149968,DATA_149976,DATA_149984,DATA_149992,DATA_1499A0,DATA_1499AE,DATA_1499BC
	dw DATA_1499CA,DATA_1499D8,DATA_1499E6,DATA_149A34,DATA_149A4A,DATA_149A60,DATA_149A6E,DATA_149A7C
	dw DATA_149A92,DATA_149AA8,DATA_149AB6,DATA_149AC4,DATA_149AD2,DATA_149AE0,DATA_149AEE,DATA_149AFC
	dw DATA_149B0A,DATA_14A0E6,DATA_14A0F4,DATA_14938E,DATA_1493F4,DATA_14A102,DATA_14A110,DATA_14A11E
	dw DATA_149B18,DATA_149B26,DATA_149B34,DATA_149B42,DATA_149B50,DATA_149B5E,DATA_149B74,DATA_149B82
	dw DATA_149B90,DATA_149B9E,DATA_149BD4,DATA_149C0A,DATA_149C40,DATA_149C76,DATA_149CAC,DATA_149CE2
	dw DATA_149D18,DATA_149D4E,DATA_149D84,DATA_149DBA,DATA_149DF0,DATA_149E26,DATA_149E5C,DATA_149E92
	dw DATA_149EA0,DATA_149EAE,DATA_149ED4,DATA_149EFA,DATA_149F20,DATA_149F46,DATA_149F6C,DATA_149F92
	dw DATA_149FB8,DATA_149FDE,DATA_14A004,DATA_14A02A,DATA_14A050,DATA_14A076,DATA_14A084,DATA_14A092
	dw DATA_14A0A0,DATA_14A0AE,DATA_14A0BC,DATA_14A0CA,DATA_14A0D8,DATA_14A12C,DATA_14A1A2,DATA_14A228
	dw DATA_14A2B6,DATA_14A33C,DATA_14A3D2,DATA_14A470,DATA_14A4EE,DATA_14A57C,DATA_14A602,DATA_14A658
	dw DATA_14A68E,DATA_14A6C4

DATA_148C68:
	dw $0000,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$0008,$0008,$0008,$000C,$000C,$000C
	dw $0000,$0000,$0000,$0004,$0004,$0008,$0008,$0004
	dw $0004,$0004,$0004,$0008,$0008,$0008,$0008,$0006
	dw $0006,$0006,$0006,$0004,$0004,$0004,$0004,$0004
	dw $0004,$0004,$0004,$0004,$0006,$0006,$0006,$0000
	dw $0000,$0008,$0008,$0018,$0018,$0000,$0000,$0000
	dw $0006,$0006,$0006,$0008,$0008,$0004,$0004,$0004
	dw $0004,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$0008
	dw $0008,$0010,$0010,$0010,$0010,$0010,$0010,$0010
	dw $0010,$0010,$0010,$000C,$000C,$0008,$0008,$0008
	dw $0008,$0008,$0008,$0008,$0008,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0014
	dw $0014,$0014

DATA_148DAC:
	dw $0000,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$0008,$0008,$0008,$000C,$000C,$000C
	dw $0000,$0000,$0000,$0004,$0004,$0008,$0008,$0004
	dw $0004,$0004,$0004,$0008,$0008,$0008,$0008,$0006
	dw $0006,$0006,$0006,$0004,$0004,$0004,$0004,$0004
	dw $0004,$0004,$0004,$0004,$0006,$0006,$0006,$0000
	dw $0000,$0008,$0008,$0018,$0018,$0000,$0000,$0000
	dw $0006,$0006,$0006,$0008,$0008,$0004,$0004,$0004
	dw $0004,$000C,$000C,$000C,$000C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$0008
	dw $0008,$0010,$0010,$0010,$0010,$0010,$0010,$0010
	dw $0010,$0010,$0010,$000C,$000C,$0008,$0008,$0008
	dw $0008,$0008,$0008,$0008,$0008,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0014
	dw $0014,$0014

DATA_148EF0:
	dw $0000,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0028,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0028,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0028,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0020,$0020
	dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0020,$0020,$0014,$0014,$0014,$0020,$0020,$0020
	dw $0000,$0000,$0000,$000C,$000C,$0010,$0010,$000C
	dw $000C,$000C,$000C,$0010,$0010,$0010,$0010,$000C
	dw $000C,$000C,$000C,$0010,$0010,$0010,$0010,$0010
	dw $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0000
	dw $0000,$0010,$0010,$0040,$0040,$0000,$0000,$0000
	dw $0010,$0010,$0010,$0010,$0010,$000C,$000C,$000C
	dw $000C,$0030,$0030,$0030,$0030,$0030,$0030,$0030
	dw $0030,$0030,$0030,$0030,$0018,$0018,$0024,$000C
	dw $000C,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0020,$0020,$0020,$001C,$001C,$000C,$000C,$000C
	dw $000C,$000C,$000C,$000C,$000C,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$001C
	dw $001C,$001C

DATA_149034:
	dw $0000,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0028,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0028,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0028,$0028,$0028,$0028,$0028,$0028,$0028,$0028
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0020,$0020
	dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0020,$0020,$0014,$0014,$0014,$0020,$0020,$0020
	dw $0000,$0000,$0000,$0008,$0008,$0010,$0010,$0008
	dw $0008,$0008,$0008,$0010,$0010,$0010,$0010,$0008
	dw $0008,$0008,$0008,$0010,$0010,$0010,$0010,$0010
	dw $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0000
	dw $0000,$0010,$0010,$0040,$0040,$0000,$0000,$0000
	dw $0010,$0010,$0010,$0010,$0010,$0008,$0008,$0008
	dw $0008,$0030,$0030,$0030,$0030,$0030,$0030,$0030
	dw $0030,$0030,$0030,$0030,$0018,$0018,$0024,$0008
	dw $0008,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0020,$0020,$0020,$0018,$0018,$0008,$0008,$0008
	dw $0008,$0008,$0008,$0008,$0008,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$001C
	dw $001C,$001C

DATA_149178:
	dw CODE_138433,$2600,CODE_138456,$8000,$013E,$0320

DATA_149184:
	dw $0140,$003C,$013E,$0028,$0142,$003C,$013E,$0028
	dw CODE_138421,DATA_149184

DATA_149198:
	dw CODE_138433,$2600,$012A,$0190

DATA_1491A0:
	dw $012A,$0014,$0132,$0014,$0136,$0005,CODE_138456,$0001
	dw $0136,$001E,CODE_13844C,$FFFE,$0132,$0014,$012E,$0014
	dw $012C,$0005,CODE_138456,$0001,$012C,$001E,CODE_13844C,$FFFE
	dw $0132,$0014,$013A,$0014,$0138,$0005,CODE_138456,$0001
	dw $0138,$001E,CODE_13844C,$FFFE

DATA_1491E8:
	dw $0132,$0014,$012E,$0014,$0134,$0005,CODE_138456,$0001
	dw $0134,$001E,CODE_13844C,$FFFE,$013A,$0014,$0138,$0014
	dw $0136,$0005,CODE_138456,$0001,$0136,$001E,CODE_13844C,$FFFE
	dw $0138,$0014,$0130,$0014,$012A,$0005,CODE_138456,$0001
	dw $012A,$001E,CODE_13844C,$FFFE,$0136,$0014,$0132,$0014
	dw $012E,$0005,CODE_138456,$0001,$012E,$001E,CODE_13844C,$FFFE
	dw $0134,$0014,$013A,$0014,$0132,$0005,CODE_138456,$0001
	dw $0132,$001E,CODE_13844C,$FFFE,$0130,$0014,$0138,$0014
	dw $013A,$0005,CODE_138456,$0001,$013A,$001E,CODE_13844C,$FFFE
	dw $0138,$0014,$0136,$0014,$0130,$0005,CODE_138456,$0001
	dw $0130,$001E,CODE_13844C,$FFFE,CODE_138421,DATA_1491A0

DATA_149294:
	dw CODE_138433,$6600,$012A,$0190,$0130,$0015,CODE_138421,DATA_1491E8

DATA_1492A4:
	dw CODE_13843B,$2600,$013C,$0004,CODE_138421,DATA_1492A4

DATA_1492B0:
	dw $0000,$0000,$8000

DATA_1492B6:
	dw $FFFE,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0004,$00FF,$0000
	dw $FFF0,$0006,$8000

DATA_1492EC:
	dw $0003,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0004,$00FF,$0000
	dw $FFF0,$0006,$8000

DATA_149322:
	dw $FFFB,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0004,$00FF,$0000
	dw $FFF0,$0006,$8000

DATA_149358:
	dw $0006,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0004,$00FF,$0000
	dw $FFF0,$0006,$8000

DATA_14938E:
	dw $0000,$0000,$00FF,$FFE8,$FFC0,$000C,$00FF,$FFF8
	dw $FFC0,$000E,$00FF,$0008,$FFC0,$002C,$00FF,$FFE8
	dw $FFD0,$002E,$00FF,$FFF8,$FFD0,$0048,$00FF,$0008
	dw $FFD0,$004A,$00FF,$FFE8,$FFE0,$004C,$00FF,$FFF8
	dw $FFE0,$004E,$00FF,$0008,$FFE0,$0068,$00FF,$FFE8
	dw $FFF0,$006A,$00FF,$FFF8,$FFF0,$006C,$00FF,$0008
	dw $FFF0,$006E,$8000

DATA_1493F4:
	dw $0000,$0000,$00FF,$FFE8,$FFC0,$0080,$00FF,$FFF8
	dw $FFC0,$0082,$00FF,$0008,$FFC0,$0084,$00FF,$FFE8
	dw $FFD0,$0086,$00FF,$FFF8,$FFD0,$00A0,$00FF,$0008
	dw $FFD0,$00A2,$00FF,$FFE8,$FFE0,$00A4,$00FF,$FFF8
	dw $FFE0,$00A6,$00FF,$0008,$FFE0,$00C0,$00FF,$FFE8
	dw $FFF0,$00C2,$00FF,$FFF8,$FFF0,$00E0,$00FF,$0008
	dw $FFF0,$00E2,$8000

DATA_14945A:
	dw CODE_138433,$2A00,$00C8,$0002,CODE_138448

DATA_149464:
	dw $00C6,$0007,$00C8,$0002,CODE_138448

DATA_14946E:
	dw $00C6,$0001,CODE_138448

DATA_149474:
	dw CODE_138433,$2600,$00C8,$0002,CODE_138448

DATA_14947E:
	dw $2A00,$2E00,$2A00,$2200

DATA_149486:
	dw DATA_14A91A,DATA_14A826,DATA_14A91A,DATA_14A826

DATA_14948E:
	dw $0001,$0002,$0003,$0004,$0008,$FFFF

DATA_14949A:
	dw $0010,$0008,$0005,$0004,$0002,$0001

DATA_1494A6:
	dw $FFF6,$FFF7,$FFF8,$FFF8,$FFF8,$FFF8

DATA_1494B2:
	dw $0004,$0000,$0000,$0000,$0000,$0000

DATA_1494BE:
	dw $0014,$0010,$0013,$0010,$0014,$0010

DATA_1494CA:
	dw $22C4,$22C8,$22CA,$22CC,$22CE,$22E0

DATA_1494D6:
	dw $0010,$0008,$0005,$0004,$0002,$0000

DATA_1494E2:
	dw $0010,$0010,$000F,$0010,$0010,$0010

DATA_1494EE:
	dw $FFFD,$0003,$0007,$0006,$0010,$0014,$000A,$000F
	dw $0016

DATA_149500:
	dw $FFE0,$FFDB,$FFD7,$FFE4,$FFE0,$FFDB,$FFF7,$FFF3
	dw $FFEF

DATA_149512:
	dw $000A,$000A,$0008,$0008,$0008,$0006,$0006,$0006
	dw $0006,$0004,$0004,$0004,$0004,$0004,$0002,$0002
	dw $0002,$0002,$0002,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_149552:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$0028,$8000

DATA_149560:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$0029,$8000

DATA_14956E:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$0038,$8000

DATA_14957C:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$0039,$8000

DATA_14958A:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$002A,$8000

DATA_149598:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$002B,$8000

DATA_1495A6:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$003A,$8000

DATA_1495B4:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$003B,$8000

DATA_1495C2:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0024,$00FF,$0000
	dw $FFE0,$0026,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_1495E8:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0060,$00FF,$0000
	dw $FFE0,$0062,$00FF,$FFF0,$FFF0,$0044,$00FF,$0000
	dw $FFF0,$0046,$8000

DATA_14960E:
	dw $0000,$0000,$00FF,$0000,$FFF0,$C024,$00FF,$FFF0
	dw $FFF0,$C026,$00FF,$0000,$FFE0,$C040,$00FF,$FFF0
	dw $FFE0,$C042,$8000

DATA_149634:
	dw $0000,$0000,$00FF,$0000,$FFF0,$C060,$00FF,$FFF0
	dw $FFF0,$C062,$00FF,$0000,$FFE0,$C044,$00FF,$FFF0
	dw $FFE0,$C046,$8000

DATA_14965A:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0064,$00FF,$0000
	dw $FFE0,$4064,$00FF,$FFF0,$FFF0,$0066,$00FF,$0000
	dw $FFF0,$4066,$8000

DATA_149680:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0008,$00FF,$0000
	dw $FFE0,$4008,$00FF,$FFF0,$FFF0,$000A,$00FF,$0000
	dw $FFF0,$400A,$8000

DATA_1496A6:
	dw $0000,$0000,$00FF,$0000,$FFE0,$40C4,$00FF,$FFF0
	dw $FFE0,$40C6,$00FF,$0000,$FFF0,$40E4,$00FF,$FFF0
	dw $FFF0,$40E6,$8000

DATA_1496CC:
	dw $0000,$0000,$00FF,$0000,$FFE0,$4088,$00FF,$FFF0
	dw $FFE0,$408A,$00FF,$0000,$FFF0,$40E4,$00FF,$FFF0
	dw $FFF0,$40A8,$8000

DATA_1496F2:
	dw $0000,$0000,$00FF,$0000,$FFE0,$40AA,$00FF,$FFF0
	dw $FFE0,$408C,$00FF,$0000,$FFF0,$40E4,$00FF,$FFF0
	dw $FFF0,$408E,$8000

DATA_149718:
	dw $0000,$0000,$00FF,$0000,$FFE0,$40AC,$00FF,$FFF0
	dw $FFE0,$40AE,$00FF,$0000,$FFF0,$40C8,$00FF,$FFF0
	dw $FFF0,$40CA,$8000

DATA_14973E:
	dw $0000,$0000,$00FF,$0000,$FFE0,$40E8,$00FF,$FFF0
	dw $FFE0,$40EA,$00FF,$0000,$FFF0,$40CC,$00FF,$FFF0
	dw $FFF0,$40CE,$8000

DATA_149764:
	dw $0000,$0000,$00FF,$0000,$FFE0,$40EC,$00FF,$FFF0
	dw $FFE0,$40EE,$00FF,$0000,$FFF0,$4100,$00FF,$FFF0
	dw $FFF0,$4102,$8000

DATA_14978A:
	dw $0000,$0000,$00FF,$0000,$FFE0,$4120,$00FF,$FFF0
	dw $FFE0,$4122,$00FF,$0000,$FFF0,$4104,$00FF,$FFF0
	dw $FFF0,$4106,$8000

DATA_1497B0:
	dw $0000,$0000,$00FF,$0000,$FFE0,$4124,$00FF,$FFF0
	dw $FFE0,$4126,$00FF,$0000,$FFF0,$4140,$00FF,$FFF0
	dw $FFF0,$4142,$8000

DATA_1497D6:
	dw $0000,$0000,$00FF,$0000,$FFE0,$4160,$00FF,$FFF0
	dw $FFE0,$4122,$00FF,$0000,$FFF0,$4162,$00FF,$FFF0
	dw $FFF0,$4106,$8000

DATA_1497FC:
	dw $0003,$0000,$00FF,$0000,$FFE0,$4144,$00FF,$FFF0
	dw $FFE0,$4146,$00FF,$0000,$FFF0,$4164,$00FF,$FFF0
	dw $FFF0,$4166,$8000

DATA_149822:
	dw $0003,$0000,$00FF,$0000,$FFE0,$4108,$00FF,$FFF0
	dw $FFE0,$410A,$00FF,$0000,$FFF0,$4128,$00FF,$FFF0
	dw $FFF0,$412A,$8000

DATA_149848:
	dw $0003,$0000,$00FF,$0000,$FFE0,$410C,$00FF,$FFF0
	dw $FFE0,$410E,$00FF,$0000,$FFF0,$412C,$00FF,$FFF0
	dw $FFF0,$412E,$8000

DATA_14986E:
	dw $0000,$0000,$00FF,$FFF4,$FFE5,$4148,$00FF,$FFF8
	dw $FFF0,$414A,$8000

DATA_149884:
	dw $0000,$0000,$00FF,$FFF6,$FFE4,$4148,$00FF,$FFF8
	dw $FFF0,$4168,$8000

DATA_14989A:
	dw $0000,$0000,$00FF,$FFF8,$FFE5,$4148,$00FF,$FFF8
	dw $FFF0,$416A,$8000

DATA_1498B0:
	dw $0000,$0000,$00FF,$0000,$FFE0,$414C,$00FF,$FFF0
	dw $FFE0,$414E,$00FF,$0000,$FFF0,$416C,$00FF,$FFF0
	dw $FFF0,$416E,$8000

DATA_1498D6:
	dw $0000,$0000,$00FF,$0000,$FFE0,$4180,$00FF,$FFF0
	dw $FFE0,$4182,$00FF,$0000,$FFF0,$416C,$00FF,$FFF0
	dw $FFF0,$416E,$8000

DATA_1498FC:
	dw $0000,$0000,$00FF,$FFEF,$FFE0,$01A0,$00FF,$FFFF
	dw $FFE0,$01A2,$00FF,$FFEF,$FFF0,$016C,$00FF,$FFFF
	dw $FFF0,$016E,$8000

DATA_149922:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$4184,$8000

DATA_149930:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$4186,$8000

DATA_14993E:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41A4,$8000

DATA_14994C:
	dw $0000,$FFFE,$00FF,$FFF8,$FFF0,$41A6,$8000

DATA_14995A:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41C0,$8000

DATA_149968:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41C2,$8000

DATA_149976:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41E0,$8000

DATA_149984:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41E2,$8000

DATA_149992:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41C4,$8000

DATA_1499A0:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41C6,$8000

DATA_1499AE:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01C4,$8000

DATA_1499BC:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41E4,$8000

DATA_1499CA:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$41E6,$8000

DATA_1499D8:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$4188,$8000

DATA_1499E6:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$418A,$8000

DATA_1499F4:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$41A9,$0000,$0004
	dw $FFF8,$41A8,$8000

DATA_149A0A:
	dw $0000,$0000,$0000,$0004,$FFF8,$41A8,$8000

DATA_149A18:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$41B8,$8000

DATA_149A26:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$41B9,$8000

DATA_149A34:
	dw $0000,$0000,$0000,$FFFC,$FFF0,$01AA,$0000,$FFFC
	dw $FFF8,$01AB,$8000

DATA_149A4A:
	dw $0000,$0001,$0000,$FFFC,$FFF0,$01BA,$0000,$FFFC
	dw $FFF8,$01BB,$8000

DATA_149A60:
	dw $0000,$FFFA,$0000,$FFFC,$FFF8,$018C,$8000

DATA_149A6E:
	dw $0000,$FFFB,$0000,$FFFC,$FFF8,$018D,$8000

DATA_149A7C:
	dw $0000,$0000,$0000,$FFFC,$FFF0,$019C,$0000,$FFFC
	dw $FFF8,$019D,$8000

DATA_149A92:
	dw $0000,$0001,$0000,$FFFC,$FFF0,$018E,$0000,$FFFC
	dw $FFF8,$01BB,$8000

DATA_149AA8:
	dw $0000,$FFFA,$0000,$FFFC,$FFF8,$018F,$8000

DATA_149AB6:
	dw $0000,$FFFB,$0000,$FFFC,$FFF8,$019E,$8000

DATA_149AC4:
	dw $0000,$FFFC,$0000,$FFFC,$FFF8,$019F,$8000

DATA_149AD2:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01AC,$8000

DATA_149AE0:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01AE,$8000

DATA_149AEE:
	dw $0000,$0000,$00FF,$FFF7,$FFF1,$01C8,$8000

DATA_149AFC:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CA,$8000

DATA_149B0A:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01E8,$8000

DATA_149B18:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$000C,$8000

DATA_149B26:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$000E,$8000

DATA_149B34:
	dw $0000,$0000,$00FF,$FFF7,$FFF1,$002C,$8000

DATA_149B42:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$002E,$8000

DATA_149B50:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$002E,$8000

DATA_149B5E:
	dw $0000,$0000,$0000,$0002,$FFF8,$0048,$0000,$FFFE
	dw $FFF8,$0049,$8000

DATA_149B74:
	dw $0000,$0000,$0000,$0002,$FFF8,$0048,$8000

DATA_149B82:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$4058,$8000

DATA_149B90:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$4059,$8000

DATA_149B9E:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$004A,$00FF,$0000
	dw $FFD0,$0068,$00FF,$FFF0,$FFE0,$006A,$00FF,$0000
	dw $FFE0,$004C,$00FF,$FFF0,$FFF0,$004E,$00FF,$0000
	dw $FFF0,$006C,$8000

DATA_149BD4:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$006E,$00FF,$0000
	dw $FFD0,$0080,$00FF,$FFF0,$FFE0,$0082,$00FF,$0000
	dw $FFE0,$00A0,$00FF,$FFF0,$FFF0,$00A2,$00FF,$0000
	dw $FFF0,$0084,$8000

DATA_149C0A:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$006E,$00FF,$0000
	dw $FFD0,$0080,$00FF,$FFF0,$FFE0,$0086,$00FF,$0000
	dw $FFE0,$00A4,$00FF,$FFF0,$FFF0,$00A6,$00FF,$0000
	dw $FFF0,$00C0,$8000

DATA_149C40:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$00C2,$00FF,$0000
	dw $FFD0,$00E0,$00FF,$FFF0,$FFE0,$00E2,$00FF,$0000
	dw $FFE0,$00C4,$00FF,$FFF0,$FFF0,$00C6,$00FF,$0000
	dw $FFF0,$00E4,$8000

DATA_149C76:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$00E6,$00FF,$0000
	dw $FFD0,$0088,$00FF,$FFF0,$FFE0,$008A,$00FF,$0000
	dw $FFE0,$00A8,$00FF,$FFF0,$FFF0,$00AA,$00FF,$0000
	dw $FFF0,$008C,$8000

DATA_149CAC:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$00C2,$00FF,$0000
	dw $FFD0,$00E0,$00FF,$FFF0,$FFE0,$008E,$00FF,$0000
	dw $FFE0,$00AC,$00FF,$FFF0,$FFF0,$00AE,$00FF,$0000
	dw $FFF0,$00C8,$8000

DATA_149CE2:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$006E,$00FF,$0000
	dw $FFD0,$0080,$00FF,$FFF0,$FFE0,$0082,$00FF,$0000
	dw $FFE0,$00CA,$00FF,$FFF0,$FFF0,$00E8,$00FF,$0000
	dw $FFF0,$00EA,$8000

DATA_149D18:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$006E,$00FF,$0000
	dw $FFD0,$0080,$00FF,$FFF0,$FFE0,$00CC,$00FF,$0000
	dw $FFE0,$00CE,$00FF,$FFF0,$FFF0,$00EC,$00FF,$0000
	dw $FFF0,$00EE,$8000

DATA_149D4E:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$00C2,$00FF,$0000
	dw $FFD0,$00E0,$00FF,$FFF0,$FFE0,$0100,$00FF,$0000
	dw $FFE0,$0102,$00FF,$FFF0,$FFF0,$0120,$00FF,$0000
	dw $FFF0,$0122,$8000

DATA_149D84:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$00E6,$00FF,$0000
	dw $FFD0,$0088,$00FF,$FFF0,$FFE0,$0104,$00FF,$0000
	dw $FFE0,$0106,$00FF,$FFF0,$FFF0,$0124,$00FF,$0000
	dw $FFF0,$0126,$8000

DATA_149DBA:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$00C2,$00FF,$0000
	dw $FFD0,$00E0,$00FF,$FFF0,$FFE0,$0140,$00FF,$0000
	dw $FFE0,$0142,$00FF,$FFF0,$FFF0,$0160,$00FF,$0000
	dw $FFF0,$0162,$8000

DATA_149DF0:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0144,$00FF,$0000
	dw $FFD0,$0146,$00FF,$FFF0,$FFE0,$0164,$00FF,$0000
	dw $FFE0,$0166,$00FF,$FFF0,$FFF0,$0108,$00FF,$0000
	dw $FFF0,$010A,$8000

DATA_149E26:
	dw $0003,$0000,$00FF,$FFF0,$FFD0,$0128,$00FF,$0000
	dw $FFD0,$012A,$00FF,$FFF0,$FFE0,$010C,$00FF,$0000
	dw $FFE0,$010E,$00FF,$FFF0,$FFF0,$012C,$00FF,$0000
	dw $FFF0,$012E,$8000

DATA_149E5C:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0148,$00FF,$0000
	dw $FFD0,$014A,$00FF,$FFF0,$FFE0,$0168,$00FF,$0000
	dw $FFE0,$016A,$00FF,$FFF0,$FFF0,$014C,$00FF,$0000
	dw $FFF0,$014E,$8000

DATA_149E92:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$016C,$8000

DATA_149EA0:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$016E,$8000

DATA_149EAE:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0180,$00FF,$0000
	dw $FFE0,$4180,$00FF,$FFF0,$FFF0,$0182,$00FF,$0000
	dw $FFF0,$4182,$8000

DATA_149ED4:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01A0,$00FF,$0000
	dw $FFE0,$41A0,$00FF,$FFF0,$FFF0,$01A2,$00FF,$0000
	dw $FFF0,$41A2,$8000

DATA_149EFA:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0184,$00FF,$0000
	dw $FFE0,$4184,$00FF,$FFF0,$FFF0,$0186,$00FF,$0000
	dw $FFF0,$4186,$8000

DATA_149F20:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01A4,$00FF,$0000
	dw $FFE0,$41A4,$00FF,$FFF0,$FFF0,$01A6,$00FF,$0000
	dw $FFF0,$41A6,$8000

DATA_149F46:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01C0,$00FF,$0000
	dw $FFE0,$41C0,$00FF,$FFF0,$FFF0,$01C2,$00FF,$0000
	dw $FFF0,$41C2,$8000

DATA_149F6C:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01E0,$00FF,$0000
	dw $FFE0,$41E0,$00FF,$FFF0,$FFF0,$01E2,$00FF,$0000
	dw $FFF0,$41E2,$8000

DATA_149F92:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01C4,$00FF,$0000
	dw $FFE0,$41C4,$00FF,$FFF0,$FFF0,$01C6,$00FF,$0000
	dw $FFF0,$41C6,$8000

DATA_149FB8:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01E4,$00FF,$0000
	dw $FFE0,$41E4,$00FF,$FFF0,$FFF0,$01E6,$00FF,$0000
	dw $FFF0,$41E6,$8000

DATA_149FDE:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0188,$00FF,$0000
	dw $FFE0,$4188,$00FF,$FFF0,$FFF0,$018A,$00FF,$0000
	dw $FFF0,$418A,$8000

DATA_14A004:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$01A8,$00FF,$0000
	dw $FFE0,$41A8,$00FF,$FFF0,$FFF0,$01AA,$00FF,$0000
	dw $FFF0,$41AA,$8000

DATA_14A02A:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$018C,$00FF,$0000
	dw $FFE0,$018E,$00FF,$FFF0,$FFF0,$01AC,$00FF,$0000
	dw $FFF0,$01AE,$8000

DATA_14A050:
	dw $0000,$0000,$00FF,$FFF0,$FFF0,$818C,$00FF,$0000
	dw $FFF0,$818E,$00FF,$FFF0,$FFE0,$81AC,$00FF,$0000
	dw $FFE0,$81AE,$8000

DATA_14A076:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01C8,$8000

DATA_14A084:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CA,$8000

DATA_14A092:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01E8,$8000

DATA_14A0A0:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01EA,$8000

DATA_14A0AE:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CC,$8000

DATA_14A0BC:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CE,$8000

DATA_14A0CA:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01EC,$8000

DATA_14A0D8:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01EE,$8000

DATA_14A0E6:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01EA,$8000

DATA_14A0F4:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CC,$8000

DATA_14A102:
	dw $0000,$FFFF,$00FF,$FFF8,$FFF0,$01CE,$8000

DATA_14A110:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01EC,$8000

DATA_14A11E:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01EE,$8000

DATA_14A12C:
	dw $FFFF,$0003,$0000,$0000,$FFD8,$000C,$0000,$0008
	dw $FFD8,$000D,$0000,$0010,$FFD8,$000E,$0000,$0000
	dw $FFE0,$000F,$0000,$0008,$FFE0,$001C,$0000,$0010
	dw $FFE0,$001D,$0000,$0000,$FFE8,$001E,$0000,$0008
	dw $FFE8,$001F,$0000,$0010,$FFE8,$002C,$0000,$0000
	dw $FFF0,$002D,$0000,$0008,$FFF0,$002E,$0000,$0010
	dw $FFF0,$002F,$0000,$0008,$FFF8,$003C,$0000,$0010
	dw $FFF8,$003D,$8000

DATA_14A1A2:
	dw $FFFF,$FFFB,$0000,$0010,$FFD8,$003E,$0000,$0000
	dw $FFE0,$000C,$0000,$0008,$FFE0,$003F,$0000,$0010
	dw $FFE0,$0048,$0000,$0018,$FFE0,$0049,$0000,$0000
	dw $FFE8,$004A,$0000,$0008,$FFE8,$004B,$0000,$0010
	dw $FFE8,$004C,$0000,$0018,$FFE8,$004D,$0000,$0000
	dw $FFF0,$004E,$0000,$0008,$FFF0,$004F,$0000,$0010
	dw $FFF0,$0058,$0000,$0018,$FFF0,$0059,$0000,$0008
	dw $FFF8,$005A,$0000,$0010,$FFF8,$005B,$0000,$0018
	dw $FFF8,$005C,$8000

DATA_14A228:
	dw $FFFF,$FFFB,$0000,$0010,$FFD8,$005D,$0000,$0018
	dw $FFD8,$005E,$0000,$0000,$FFE0,$005F,$0000,$0008
	dw $FFE0,$0068,$0000,$0010,$FFE0,$0069,$0000,$0018
	dw $FFE0,$006A,$0000,$0020,$FFE0,$006B,$0000,$0000
	dw $FFE8,$006C,$0000,$0008,$FFE8,$006D,$0000,$0010
	dw $FFE8,$006E,$0000,$0018,$FFE8,$006F,$0000,$0000
	dw $FFF0,$0078,$0000,$0008,$FFF0,$0079,$0000,$0010
	dw $FFF0,$007A,$0000,$0018,$FFF0,$007B,$0000,$0010
	dw $FFF8,$007C,$0000,$0018,$FFF8,$007D,$8000

DATA_14A2B6:
	dw $FFFF,$0003,$0000,$0000,$FFD8,$000C,$0000,$0008
	dw $FFD8,$0068,$0000,$0010,$FFD8,$007E,$0000,$0000
	dw $FFE0,$007F,$0000,$0008,$FFE0,$0080,$0000,$0010
	dw $FFE0,$0081,$0000,$0018,$FFE0,$0082,$0000,$0000
	dw $FFE8,$0083,$0000,$0008,$FFE8,$0084,$0000,$0010
	dw $FFE8,$0085,$0000,$0018,$FFE8,$0086,$0000,$0000
	dw $FFF0,$003D,$0000,$0008,$FFF0,$0087,$0000,$0010
	dw $FFF0,$0088,$0000,$0008,$FFF8,$0089,$0000,$0010
	dw $FFF8,$008A,$8000

DATA_14A33C:
	dw $FFFF,$FFFB,$0000,$0000,$FFE0,$000C,$0000,$0008
	dw $FFE0,$0068,$0000,$0018,$FFE0,$008B,$0000,$0020
	dw $FFE0,$008C,$0000,$0028,$FFE0,$008D,$0000,$0000
	dw $FFE8,$004A,$0000,$0008,$FFE8,$008E,$0000,$0018
	dw $FFE8,$008F,$0000,$0020,$FFE8,$0090,$0000,$0028
	dw $FFE8,$0091,$0000,$0000,$FFF0,$004E,$0000,$0008
	dw $FFF0,$004F,$0000,$0010,$FFF0,$0092,$0000,$0018
	dw $FFF0,$0093,$0000,$0020,$FFF0,$0094,$0000,$0008
	dw $FFF8,$005A,$0000,$0010,$FFF8,$0095,$0000,$0018
	dw $FFF8,$0096,$8000

DATA_14A3D2:
	dw $FFFF,$FFFB,$0000,$0020,$FFD8,$403E,$0000,$0000
	dw $FFE0,$005F,$0000,$0008,$FFE0,$0068,$0000,$0018
	dw $FFE0,$0097,$0000,$0020,$FFE0,$0098,$0000,$0028
	dw $FFE0,$0099,$0000,$0000,$FFE8,$006C,$0000,$0008
	dw $FFE8,$006D,$0000,$0010,$FFE8,$009A,$0000,$0018
	dw $FFE8,$009B,$0000,$0020,$FFE8,$009C,$0000,$0028
	dw $FFE8,$009D,$0000,$0000,$FFF0,$0078,$0000,$0008
	dw $FFF0,$0079,$0000,$0010,$FFF0,$009E,$0000,$0018
	dw $FFF0,$009F,$0000,$0020,$FFF0,$00A0,$0000,$0010
	dw $FFF8,$007C,$0000,$0018,$FFF8,$00A1,$8000

DATA_14A470:
	dw $FFFF,$000B,$0000,$0000,$FFD0,$000C,$0000,$0008
	dw $FFD0,$0068,$0000,$0000,$FFD8,$007F,$0000,$0008
	dw $FFD8,$00A2,$0000,$0000,$FFE0,$0083,$0000,$0008
	dw $FFE0,$00A3,$0000,$0000,$FFE8,$002D,$0000,$0008
	dw $FFE8,$00A4,$0000,$0010,$FFE8,$00A5,$0000,$0018
	dw $FFE8,$00A6,$0000,$0020,$FFE8,$00A7,$0000,$0008
	dw $FFF0,$00A8,$0000,$0010,$FFF0,$00A9,$0000,$0018
	dw $FFF0,$00AA,$0000,$0020,$FFF0,$00AB,$8000

DATA_14A4EE:
	dw $FFFF,$0003,$0000,$0000,$FFD8,$000C,$0000,$0008
	dw $FFD8,$0068,$0000,$0000,$FFE0,$004A,$0000,$0008
	dw $FFE0,$008E,$0000,$0000,$FFE8,$004E,$0000,$0008
	dw $FFE8,$004F,$0000,$0010,$FFE8,$00AC,$0000,$0018
	dw $FFE8,$00AD,$0000,$0020,$FFE8,$00AE,$0000,$0008
	dw $FFF0,$005A,$0000,$0010,$FFF0,$00AF,$0000,$0018
	dw $FFF0,$00B0,$0000,$0020,$FFF0,$00B1,$0000,$0028
	dw $FFF0,$00B2,$0000,$0010,$FFF8,$00B3,$0000,$0018
	dw $FFF8,$00B4,$0000,$0020,$FFF8,$00B5,$8000

DATA_14A57C:
	dw $FFFF,$FFFB,$0000,$0000,$FFE0,$005F,$0000,$0008
	dw $FFE0,$0068,$0000,$0000,$FFE8,$006C,$0000,$0008
	dw $FFE8,$006D,$0000,$0010,$FFE8,$009A,$0000,$0020
	dw $FFE8,$00B6,$0000,$0000,$FFF0,$0078,$0000,$0008
	dw $FFF0,$0079,$0000,$0010,$FFF0,$00B7,$0000,$0018
	dw $FFF0,$00B8,$0000,$0020,$FFF0,$00B9,$0000,$0028
	dw $FFF0,$00BA,$0000,$0010,$FFF8,$007C,$0000,$0018
	dw $FFF8,$00BB,$0000,$0020,$FFF8,$00BC,$0000,$0028
	dw $FFF8,$00BD,$8000

DATA_14A602:
	dw $FFFF,$FFFB,$0000,$0000,$FFE0,$000C,$0000,$0008
	dw $FFE0,$0068,$0000,$0000,$FFE8,$004A,$0000,$0008
	dw $FFE8,$00BE,$0000,$0010,$FFE8,$00BF,$0000,$0000
	dw $FFF0,$004E,$0000,$0008,$FFF0,$00C0,$0000,$0010
	dw $FFF0,$00C1,$0000,$0008,$FFF8,$00C2,$0000,$0010
	dw $FFF8,$00C3,$8000

DATA_14A658:
	dw $0000,$0000,$00FF,$FFE8,$FFF0,$00E4,$00FF,$FFF8
	dw $FFF0,$00E6,$00FF,$0008,$FFF0,$00E8,$00FF,$FFE8
	dw $0000,$00EA,$00FF,$FFF8,$0000,$00EC,$00FF,$0008
	dw $0000,$00EE,$8000

DATA_14A68E:
	dw $0000,$0000,$00FF,$FFE8,$FFF0,$0100,$00FF,$FFF8
	dw $FFF0,$0102,$00FF,$0008,$FFF0,$0104,$00FF,$FFE8
	dw $0000,$0106,$00FF,$FFF8,$0000,$0108,$00FF,$0008
	dw $0000,$010A,$8000

DATA_14A6C4:
	dw $0000,$0000,$00FF,$FFE8,$FFF0,$010C,$00FF,$FFF8
	dw $FFF0,$010E,$00FF,$0008,$FFF0,$0120,$00FF,$FFE8
	dw $0000,$0122,$00FF,$FFF8,$0000,$0124,$00FF,$0008
	dw $0000,$0126,$8000

DATA_14A6FA:
	dw CODE_138433,$2800,$00CC,$0003,$00CE,$0003,CODE_138448

DATA_14A708:
	dw CODE_138433,$2800

DATA_14A70C:
	dw $008E,$0003,$0090,$0003,CODE_138421,DATA_14A70C

DATA_14A718:
	dw CODE_13843B,$2800

DATA_14A71C:
	dw $0086,$0003,$0088,$0003,CODE_138421,DATA_14A71C

DATA_14A728:
	dw CODE_13843B,$2800

DATA_14A72C:
	dw $0092,$0003,$0094,$0003,CODE_138421,DATA_14A72C

DATA_14A738:
	dw CODE_138433,$2800,$007A,$0005,CODE_138448

DATA_14A742:
	dw $007C,$0009,CODE_138433,$6800,$007E,$0007,CODE_138448

DATA_14A750:
	dw CODE_138433,$2800,$007C,$0009,$007A,$0007,CODE_138448

DATA_14A75E:
	dw CODE_138433,$2800

DATA_14A762:
	dw $0074,$0007,$0076,$0007,$0078,$0007,$0076,$0007
	dw CODE_138421,DATA_14A762

DATA_14A776:
	dw CODE_138433,$2800

DATA_14A77A:
	dw $008A,$0007,$008C,$0007,CODE_138421,DATA_14A77A

DATA_14A786:
	dw CODE_138433,$2800

DATA_14A78A:
	dw $0068,$0007,$006A,$0007,$006C,$0007,$006A,$0007
	dw CODE_138421,DATA_14A78A

DATA_14A79E:
	dw CODE_138433,$2800

DATA_14A7A2:
	dw $006E,$0007,$0070,$0007,$0072,$0007,$0070,$0007
	dw CODE_138421,DATA_14A7A2

DATA_14A7B6:
	dw CODE_138433,$2800

DATA_14A7BA:
	dw $0062,$0007,$0064,$0007,$0066,$0007,$0064,$0007
	dw CODE_138421,DATA_14A7BA

DATA_14A7CE:
	dw CODE_138433,$2800

DATA_14A7D2:
	dw $005E,$0007,$005C,$0007,$0060,$0007,$005C,$0007
	dw CODE_13844C,$FFFD,CODE_138421,DATA_14A7D2

DATA_14A7EA:
	dw $005E,$0014,$005C,$0007,$0060,$0004

DATA_14A7F6:
	dw $0060,$00C8

DATA_14A7FA:
	dw CODE_138421,DATA_14A7F6

DATA_14A7FE:
	dw $005C,$0007,$005E,$0001,CODE_138448

DATA_14A808:
	dw CODE_138433,$2800,CODE_138421,DATA_14A7F6

DATA_14A810:
	dw CODE_138433,$6800,CODE_138421,DATA_14A7F6

DATA_14A818:
	dw $0080,$0007,$0082,$0007,$0084,$0007,CODE_138448

DATA_14A826:
	dw CODE_138433,$3C00

DATA_14A82A:
	dw $0040,$0003,$0042,$0003,$0044,$0003,$0046,$0003
	dw $0048,$0003,$004A,$0003,$004C,$0003,$004E,$0003
	dw CODE_138448

DATA_14A84C:
	dw CODE_138433,$2C00

DATA_14A850:
	dw $00B8,$0004,$00BC,$0004,$00BA,$0004,$00BC,$0004
	dw CODE_138421,DATA_14A850

DATA_14A864:
	dw CODE_138433,$2C00

DATA_14A868:
	dw $00BE,$0003,$00C0,$0003,CODE_138421,DATA_14A868

DATA_14A874:
	dw CODE_138433,$2C00,$00C2,$0007,CODE_138433,$2200,$00C2,$0003
	dw CODE_138421,DATA_14A874

DATA_14A888:
	dw CODE_138433,$2800

DATA_14A88C:
	dw $00A6,$0001,$00A8,$0003,$00AA,$0005,$00AC,$0006
	dw $00B6,$0005,$00B4,$0006,$00B2,$0005,$00B0,$0003
	dw $00AE,$0001,$00B0,$0003,$00B2,$0005,$00B4,$0006
	dw $00B6,$0005,$00AC,$0006,$00AA,$0005,$00A8,$0003
	dw CODE_138421,DATA_14A88C

DATA_14A8D0:
	dw CODE_138433,$2800

DATA_14A8D4:
	dw $009E,$0003,$00A0,$0003,$00A2,$0003,$00A4,$0003
	dw CODE_138421,DATA_14A8D4

DATA_14A8E8:
	dw CODE_138433,$2C00,CODE_138460,$0019,$0102,$0004,$0104,$0004
	dw $0106,$0003,$0108,$0003,$010A,$0003,$010C,$0003
	dw $010E,$0003,$0110,$0003,$0112,$0004,$0114,$0004
	dw CODE_138448

DATA_14A91A:
	dw CODE_138433,$2C00,$0050,$0003,CODE_138460,$0006,$0052,$0003
	dw $0054,$0003,$0056,$0003,$0050,$0003,$0052,$0003
	dw $0058,$0004,$005A,$0004,CODE_138448

DATA_14A944:
	dw $011A,$0003,$011C,$0003,$011E,$0003,$0120,$0003
	dw CODE_138421,DATA_14A944

DATA_14A958:
	dw $0122,$0005,$0124,$0005,$0126,$0005,$0128,$0005
	dw CODE_138421,DATA_14A958

DATA_14A96C:
	dw CODE_138433,$2400

DATA_14A970:
	dw CODE_13843B,$2400

DATA_14A974:
	dw $00E4,$0005

DATA_14A978:
	dw $00E6,$0005,$00E8,$0005,$00EA,$0005,$00EC,$0005
	dw $00EE,$0005,$00F0,$0005,$00F2,$0005,$00F4,$0005
	dw $00F6,$0005,CODE_138421,DATA_14A974

DATA_14A9A0:
	dw $00E2,$0005,$00FA,$0003,CODE_138456,$0002,$00FA,$0009
	dw CODE_13844C,$FF00,$00E4,$0005,CODE_138421,DATA_14A978

DATA_14A9BC:
	dw CODE_13843B,$2400,$00FC,$0001,CODE_138448

DATA_14A9C6:
	dw CODE_138433,$6400,$00F8,$0001,CODE_138448

DATA_14A9D0:
	dw CODE_138433,$2400,$00F8,$0001,CODE_138448

DATA_14A9DA:
	dw CODE_138416,$FFFE,$00F8,$0004,CODE_138416,$0002,$00F8,$0008
	dw CODE_138448

DATA_14A9EC:
	dw CODE_13843B,$2800

DATA_14A9F0:
	dw $00DA,$0003,$00DC,$0003,CODE_138421,DATA_14A9F0

DATA_14A9FC:
	db $82,$00,$20,$85,$00,$00,$81,$02,$03,$1D,$0D,$19,$1C,$0F,$00,$00
	db $00,$00,$00,$00,$00,$00,$01,$81,$13,$03,$01,$01,$81,$18,$03,$01
	db $01,$81,$1D,$03,$01,$01,$81,$02,$05,$29,$29,$29,$29,$29,$29,$29
	db $29,$29,$29,$29,$29,$29,$81,$12,$05,$29,$29,$29,$29,$29,$29,$29
	db $29,$29,$29,$29,$29,$29,$83,$80,$00,$81,$01,$04,$52,$53,$54,$55
	db $56,$57,$57,$57,$57,$57,$57,$57,$57,$57,$82,$00,$60,$52,$81,$0F
	db $05,$58,$82,$00,$20,$81,$01,$05,$58,$82,$00,$A0,$81,$01,$06,$52
	db $57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$82,$00,$E0
	db $52,$82,$00,$20,$83,$80,$00,$81,$11,$04,$52,$57,$57,$57,$57,$57
	db $57,$57,$57,$57,$59,$5A,$5B,$5C,$82,$00,$60,$52,$81,$1F,$05,$58
	db $82,$00,$20,$81,$11,$05,$58,$82,$00,$A0,$81,$11,$06,$52,$57,$57
	db $57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$82,$00,$E0,$52,$82
	db $00,$20,$81,$16,$02,$83,$E6,$00,$00,$01,$81,$16,$03,$02,$03,$81
	db $1B,$02,$83,$E6,$00,$04,$05,$81,$1B,$03,$06,$07,$80

DATA_14AAD9:
	db $82,$00,$20,$85,$00,$00,$81,$02,$03,$1D,$0D,$19,$1C,$0F,$00,$00
	db $00,$00,$00,$00,$00,$00,$01,$81,$14,$03,$01,$01,$81,$1A,$03,$01
	db $01,$81,$02,$04,$29,$29,$29,$29,$29,$29,$29,$29,$29,$29,$29,$29
	db $29,$80

DATA_14AB0B:
	db $83,$80,$00,$82,$00,$2C,$81,$00,$18,$5D,$5E,$5D,$5E,$5D,$5E,$5D
	db $5E,$5D,$5E,$5D,$5E,$5D,$5E,$5D,$5E,$5D,$5E,$5D,$5E,$5D,$5E,$5D
	db $5E,$5D,$5E,$5D,$5E,$5D,$5E,$5D,$5E,$5F,$60,$5F,$60,$5F,$60,$5F
	db $60,$5F,$60,$5F,$60,$5F,$60,$5F,$60,$5F,$60,$5F,$60,$5F,$60,$5F
	db $60,$5F,$60,$5F,$60,$5F,$60,$5F,$60,$61,$62,$61,$62,$61,$62,$61
	db $62,$61,$62,$61,$62,$61,$62,$61,$62,$61,$62,$61,$62,$61,$62,$61
	db $62,$61,$62,$61,$62,$61,$62,$61,$62,$63,$62,$64,$65,$63,$62,$64
	db $65,$63,$62,$64,$65,$63,$62,$64,$65,$63,$62,$64,$65,$63,$62,$64
	db $65,$63,$62,$64,$65,$63,$62,$64,$65,$64,$65,$63,$62,$64,$65,$63
	db $62,$64,$65,$63,$62,$64,$65,$63,$62,$64,$65,$63,$62,$64,$65,$63
	db $62,$64,$65,$63,$62,$64,$65,$63,$62,$63,$62,$64,$65,$63,$62,$64
	db $65,$63,$62,$64,$65,$63,$62,$64,$65,$63,$62,$64,$65,$63,$62,$64
	db $65,$63,$62,$64,$65,$63,$62,$64,$65,$80

table "Tables/Fonts/Credits.txt"

DATA_14ABD5:
	db $82,$00,$20,$85,$00,$00,$86,$81,$0B,$0A
	db "GET READY"
	db $81,$0B,$0E
	db "GAMBIT",$80

DATA_14ABF2:
	db $82,$00,$20,$85,$00,$00,$86,$81,$0B,$0A
	db "GET READY"
	db $81,$0B,$0E
	db "STORM",$80

DATA_14AC0E:
	db $82,$00,$20,$86,$81,$0B,$0C
	db "PAUSE",$80

cleartable

DATA_14AC1B:
	dw $0082,$8620,$0A81,$000C,$0000,$0000,$8000

DATA_14AC29:
	dw !Define_SXAR_Graphics_Sprite_CopyOfGambitPortrait,!Define_SXAR_Graphics_Sprite_CopyOfGambitPortrait,!Define_SXAR_Graphics_Sprite_CopyOfGambitPortrait,!Define_SXAR_Graphics_Sprite_CopyOfStormPortrait

DATA_14AC31:
	dw !Define_SXAR_Palette_CopyOfGambitPortrait,!Define_SXAR_Palette_CopyOfGambitPortrait,!Define_SXAR_Palette_CopyOfGambitPortrait,!Define_SXAR_Palette_CopyOfStormPortrait

DATA_14AC39:
	dw DATA_14B1D2,DATA_14B1D2,DATA_14B1D2,DATA_14B296

DATA_14AC41:
	dw DATA_14ABD5,DATA_14ABD5,DATA_14ABD5,DATA_14ABF2

DATA_14AC49:
	dw DATA_14A9FC,DATA_14A9FC,DATA_14A9FC,DATA_14AAD9

DATA_14AC51:
	dw !Define_SXAR_Graphics_Player_Gambit,!Define_SXAR_Graphics_Player_Gambit,!Define_SXAR_Graphics_Player_Gambit,!Define_SXAR_Graphics_Player_WalkingStorm

DATA_14AC59:
	dw CODE_1399DA
	dw CODE_139AC6
	dw CODE_139AC6
	dw CODE_1398C1

DATA_14AC61:
	dw $2802,$2802,$2802,$2A02

DATA_14AC69:
	dw $2002,$2002,$2002,$1B02

DATA_14AC71:
	dw $001E,$001E,$001E,$003E

DATA_14AC79:
	dw $3FCC,$3FCC,$3FCC,$302E

DATA_14AC81:
	dw DATA_14B8C8,DATA_14B8C8,DATA_14C0C8,DATA_14C0C8

DATA_14AC89:
	dw CODE_139F9F,CODE_139F9F,CODE_139F9F,CODE_13A1C0

DATA_14AC91:
	dw $30CB,$0000,$7FFF,$1409,$200D,$2C12,$3817,$1DF7
	dw $0069,$10ED,$35D2,$4E76,$30C0,$4941,$5DA1,$1153
	dw $5095,$0000,$633C,$008C,$008F,$1112,$04F7,$3A10
	dw $016B,$02B5,$03FF,$3CA5,$654A,$6631,$7F5A,$7FFF

DATA_14ACD1:							; Note: Spike ball palette related
	dw $2C80,$0421,$0C63,$18C6,$2108,$294A,$318C,$39CE
	dw $4210,$4A52,$5294,$5EF7,$6739,$6F7B,$77BD,$7FFF

DATA_14ACF1:
	dw $2C80,$0421,$0C63,$14A5,$1CE7,$294A,$318C,$39CE
	dw $4210,$4631,$4A52,$5294,$56B5,$5AD6,$5EF7,$6739

DATA_14AD11:
	dw CODE_13CA00
	dw CODE_13CA62
	dw CODE_13CB06
	dw CODE_13CB2C
	dw CODE_13CB52
	dw CODE_13CB16
	dw CODE_13C9F2
	dw CODE_13CB73
	dw CODE_13CBBB
	dw CODE_13CB6E
	dw CODE_13CB21
	dw CODE_13CB9D
	dw CODE_13CBF6
	dw CODE_13CBEE
	dw CODE_13CC3E
	dw CODE_13CC6B
	dw CODE_13C9E2
	dw CODE_13CBE6

DATA_14AD35:
	dw $2800,$6800,$2800,$6800

DATA_14AD3D:
	dw $0116,$0118,$0116,$0118

DATA_14AD45:
	dw $0050,$0052,$0054,$0056

DATA_14AD4D:
	dw $8000,$0000,$8002,$8002,$8003,$0001,$8001,$8000

DATA_14AD5D:
	dw $0014,$0000,$0014,$0000,$0014,$0000,$0014,$0000

DATA_14AD6D:
	dw CODE_13B930
	dw CODE_13B91B
	dw CODE_13D9FF
	dw CODE_13D9FF

DATA_14AD75:
	dw $0001,$0003,$0007,$0000,$0001,$0003,$0003,$0001

DATA_14AD85:
	dw $FFFD,$FFFD,$FFFD,$FFFE,$FFFE,$FFFE,$FFFF,$0000
	dw $0000,$0001,$0002,$0002,$0002,$0003,$0003,$0003
	dw $0003,$0003,$0003,$0002,$0002,$0002,$0001,$0000
	dw $0000,$FFFF,$FFFE,$FFFE,$FFFE,$FFFD,$FFFD,$FFFD

DATA_14ADC5:
	dw CODE_13B3E0
	dw CODE_13B497
	dw CODE_13B46A
	dw CODE_13B3F9
	dw CODE_13B4AD

DATA_14ADCF:
	dw CODE_13B50D
	dw CODE_13B523
	dw CODE_13B515
	dw CODE_13B52E
	dw CODE_13B546

DATA_14ADD9:
	dw $0000,$0001,$0001,$0001,$0000,$FFFF,$FFFF,$FFFF

DATA_14ADE9:
	dw $FFFF,$FFFF,$0000,$0001,$0001,$0001,$0000,$FFFF

DATA_14ADF9:
	dw $FFFE,$0002,$0000,$0000,$FFFE,$0002,$FFFE,$0002

DATA_14AE09:
	dw $0000,$0000,$FFFE,$0002,$FFFE,$FFFE,$0002,$0002

DATA_14AE19:
	dw $2DAC,$2DC8,$2DAE,$2DC8

DATA_14AE21:
	dw $F800,$FA00

DATA_14AE25:
	dw $0064,$0064

DATA_14AE29:
	dw $8000,$0000,$0000

DATA_14AE2F:
	dw $0100,$00FE,$0100

DATA_14AE35:
	dw $0003,$0004,$0005,$0002,$0000,$0006,$0001,$0000
	dw $0007

DATA_14AE47:
	dw $020A,$0000,$0210,$0030,$0542,$0000,$07CA,$0030
	dw $064A,$0000,$0950,$0030,$06C2,$0000,$0A4C,$0030
	dw $074C,$0000,$06D4,$0030,$07D6,$0000,$0DD6,$0030
	dw $0842,$0000,$0E42,$0030,$0944,$0000,$05CC,$0030
	dw $0B54,$0000,$0D46,$0000,$0000

DATA_14AE91:
	dw $08C2,$08C4,$08C6,$08C8,$08CA,$08CC,$08CE,$08E0
	dw $08E2,$08E4,$08E6,$08E8,$0A28,$0A2A,$0A2C,$084E
	dw $0860,$0862,$0A4E,$088E,$0966,$0A8E,$0866,$09C2
	dw $08EA,$08EC,$08EE,$0900,$0902,$0904,$0906,$0908
	dw $090A,$090C,$090E,$0920,$09C4,$09C6,$09C8,$09CA
	dw $09CC,$0A0E,$0A20,$0A22,$0A24,$0848,$084A,$084C

DATA_14AEF1:
	dw $0036,$0038,$003A,$003A,$003A,$003A,$003A,$003A
	dw $003A

DATA_14AF03:
	dw $0036,$0034,$0034,$0034,$0032,$0032,$0032,$0032

DATA_14AF13:
	dw $0022,$0022,$0024,$0024,$0024,$0024,$0024,$0024
	dw $0024

DATA_14AF25:
	dw $0022,$0020,$0020,$0020,$001E,$001E,$001E,$001E
	dw $0000,$0000,$0000

DATA_14AF3B:
	dw $0001,$0000,$0000,$0300,$0000,$0000,$0000

DATA_14AF49:
	dw $0005,$0000,$0000,$0700,$0000,$0000,$0100

DATA_14AF57:
	db $00,$00,$00,$00,$00,$00,$01

DATA_14AF5E:
	db $05,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$02

DATA_14AF6C:
	db $05,$00,$00,$00,$00,$00,$03

DATA_14AF73:
	db $00,$00,$00,$00,$00,$00,$03,$05,$00,$00,$00,$00,$00,$05

DATA_14AF81:
	db $00,$00,$00,$00,$00,$00,$07,$00,$00,$00,$00,$00,$00,$08,$00,$00
	db $00,$00,$00,$01,$00

DATA_14AF96:
	db $00,$00,$00,$00,$00,$05,$00

DATA_14AF9D:
	db $00

	%DATATABLE_SXAR_UnsortedDataBlock2($14AF9E)

DATA_14B07E:
	dw DATA_1492B0,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6
	dw DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492EC,DATA_1492EC,DATA_1492EC,DATA_1492B6
	dw DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_149358,DATA_1492B6,DATA_1492B6
	dw DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6,DATA_1492B6

DATA_14B0BE:
	dw $0000,$000A,$000A,$000A,$000A,$000A,$000A,$000A
	dw $000A,$000A,$000A,$000A,$000A,$000A,$0000,$000A
	dw $000A,$000A,$000A,$000A,$000A,$000A,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_14B0FE:
	dw $0000,$000A,$000A,$000A,$000A,$000A,$000A,$000A
	dw $000A,$000A,$000A,$000A,$000A,$000A,$0000,$000A
	dw $000A,$000A,$000A,$000A,$000A,$000A,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_14B13E:
	dw $0000,$002C,$002C,$002C,$002C,$002C,$002C,$002C
	dw $002C,$002C,$002C,$002C,$0018,$0018,$0000,$0018
	dw $0018,$0018,$0018,$002C,$0020,$0018,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_14B17E:
	dw $0000,$002C,$002C,$002C,$002C,$002C,$002C,$002C
	dw $002C,$002C,$002C,$002C,$0018,$0018,$0000,$0018
	dw $0018,$0018,$0018,$002C,$0020,$0018,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_14B1BE:
	dw $0610,$0434,$020E,$0148,$0060

DATA_14B1C8:
	dw $06C4,$04F0,$02B4,$01DE,$0148

DATA_14B1D2:
	dw $8588,$0000,$0381,$8205,$0800,$0201,$0403,$0605
	dw $0381,$0706,$0908,$0B0A,$810C,$0703,$0E0D,$0F0F
	dw $1110,$0381,$1208,$1413,$1615,$8117,$0903,$1918
	dw $1B1A,$1D1C,$0381,$820A,$0400,$821E,$0800,$201F
	dw $2221,$0082,$2304,$0381,$240B,$0082,$2508,$2726
	dw $8228,$0400,$8129,$0C03,$822A,$0800,$2C2B,$2E2D
	dw $0082,$2F04,$0381,$300D,$0031,$3332,$8134,$0E03
	dw $3635,$3837,$3A39,$0381,$3B0F,$3D3C,$3F3E,$8140
	dw $1003,$4241,$4443,$4645,$0381,$4711,$4948,$4B4A
	dw $814C,$1203,$4E4D,$504F,$5251,$0381,$5313,$5554
	dw $5756,$8158,$1403,$5A59,$5C5B,$5E5D,$0381,$5F15
	dw $6160,$6362,$8164,$1603,$6665,$6867,$6A69,$0089
	dw $0074,$8008

DATA_14B296:
	dw $8588,$0000,$0381,$8205,$0400,$0201,$0403,$0605
	dw $0381,$0706,$0908,$0B0A,$810C,$0703,$0E0D,$100F
	dw $1211,$0381,$1308,$1514,$1716,$8118,$0903,$1A19
	dw $1C1B,$1E1D,$0381,$1F0A,$2120,$2322,$8124,$0B03
	dw $2625,$2827,$2A29,$0381,$2B0C,$2D2C,$2F2E,$8130
	dw $0D03,$3231,$3433,$3635,$0381,$820E,$0800,$3837
	dw $3A39,$3C3B,$0381,$3D0F,$3F3E,$4140,$8142,$1003
	dw $4443,$4645,$4847,$0381,$4911,$4B4A,$4D4C,$8148
	dw $1203,$4F4E,$5150,$5352,$0381,$5413,$5655,$5857
	dw $8159,$1403,$5B5A,$5D5C,$5F5E,$0381,$6015,$6261
	dw $6463,$8165,$1603,$6766,$6968,$6B6A,$0089,$0074
	dw $8008

DATA_14B348:
	db $00,$80,$40,$C0,$20,$A0,$60,$E0,$10,$90,$50,$D0,$30,$B0,$70,$F0
	db $08,$88,$48,$C8,$28,$A8,$68,$E8,$18,$98,$58,$D8,$38,$B8,$78,$F8
	db $04,$84,$44,$C4,$24,$A4,$64,$E4,$14,$94,$54,$D4,$34,$B4,$74,$F4
	db $0C,$8C,$4C,$CC,$2C,$AC,$6C,$EC,$1C,$9C,$5C,$DC,$3C,$BC,$7C,$FC
	db $02,$82,$42,$C2,$22,$A2,$62,$E2,$12,$92,$52,$D2,$32,$B2,$72,$F2
	db $0A,$8A,$4A,$CA,$2A,$AA,$6A,$EA,$1A,$9A,$5A,$DA,$3A,$BA,$7A,$FA
	db $06,$86,$46,$C6,$26,$A6,$66,$E6,$16,$96,$56,$D6,$36,$B6,$76,$F6
	db $0E,$8E,$4E,$CE,$2E,$AE,$6E,$EE,$1E,$9E,$5E,$DE,$3E,$BE,$7E,$FE
	db $01,$81,$41,$C1,$21,$A1,$61,$E1,$11,$91,$51,$D1,$31,$B1,$71,$F1
	db $09,$89,$49,$C9,$29,$A9,$69,$E9,$19,$99,$59,$D9,$39,$B9,$79,$F9
	db $05,$85,$45,$C5,$25,$A5,$65,$E5,$15,$95,$55,$D5,$35,$B5,$75,$F5
	db $0D,$8D,$4D,$CD,$2D,$AD,$6D,$ED,$1D,$9D,$5D,$DD,$3D,$BD,$7D,$FD
	db $03,$83,$43,$C3,$23,$A3,$63,$E3,$13,$93,$53,$D3,$33,$B3,$73,$F3
	db $0B,$8B,$4B,$CB,$2B,$AB,$6B,$EB,$1B,$9B,$5B,$DB,$3B,$BB,$7B,$FB
	db $07,$87,$47,$C7,$27,$A7,$67,$E7,$17,$97,$57,$D7,$37,$B7,$77,$F7
	db $0F,$8F,$4F,$CF,$2F,$AF,$6F,$EF,$1F,$9F,$5F,$DF,$3F,$BF,$7F,$FF

DATA_14B448:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$00FF,$00FF,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$00FF,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$00FF,$00FF,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$0000,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$00FF,$0000,$0000,$0000
	dw $0000,$0000,$0000,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$00FF,$00FF,$00FF,$0000,$0000,$0000,$0000
	dw $0000,$0000,$00FF,$00FF,$00FF,$00FF,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_14B8C8:
	dw $0000,$0000,$0000,$0000,$0106,$0106,$0106,$0106
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0104,$0104,$0104,$0104
	dw $0108,$0108,$0108,$0108,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$C000,$C000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0100,$0100,$0100,$0100
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$C000,$C000,$0000,$8000
	dw $C000,$C000,$8000,$8000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$C000
	dw $0000,$0000,$C000,$C000,$0000,$8000,$0000,$8000
	dw $8000,$8000,$8000,$C000,$C000,$C000,$0000,$0000
	dw $8000,$0000,$8000,$0000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $4000,$C000,$0000,$0000,$C000,$C000,$0000,$0000
	dw $C000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$C000,$C000
	dw $D000,$D000,$D000,$D000,$D000,$D000,$D000,$D000
	dw $D000,$D000,$D000,$D000,$D000,$D000,$D000,$D000
	dw $0102,$0102,$0102,$0102,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$8000,$8000,$8000,$8000

DATA_14C0C8:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$C000,$C000,$8000,$8000
	dw $C000,$C000,$8000,$8000,$0000,$0000,$0000,$0000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000

DATA_14C2F0:
	dw $274E,$274E,$274E,$274E,$274E,$274E,$274E,$274F
	dw $275E,$275F,$2760,$2761,$2762,$2763,$2764,$2765
	dw $2766,$274E,$274E,$274E,$274E,$274E,$274E,$274E
	dw $274E,$274E,$274E,$274E,$274E,$2767,$2768,$2769
	dw $276A,$276B,$276C,$276D,$276E,$276F,$2770,$6770
	dw $2771,$2772,$2773,$274E,$274E,$274E,$274E,$274E
	dw $274E,$274E,$274E,$274E,$2774,$2775,$2776,$2777
	dw $2778,$2779,$277A,$277B,$277C,$277D,$277E,$677E
	dw $677D,$677C,$277F,$2780,$274E,$274E,$274E,$274E
	dw $274E,$274E,$274E,$2781,$2782,$2783,$2784,$2785
	dw $2786,$2787,$2788,$2789,$278A,$278B,$278C,$678C
	dw $678B,$678A,$6789,$278D,$278E,$274E,$274E,$274E
	dw $274E,$274E,$278F,$2782,$2782,$2790,$2791,$2792
	dw $2793,$2794,$2795,$2796,$2797,$2798,$2799,$6799
	dw $6798,$6797,$6796,$6795,$279A,$279B,$274E,$274E
	dw $274E,$279C,$279D,$2782,$279E,$279F,$27A0,$27A1
	dw $27A2,$27A3,$27A4,$27A5,$27A6,$27A7,$27A8,$67A8
	dw $67A7,$67A6,$67A5,$67A4,$67A3,$27A9,$27AA,$274E
	dw $274E,$27AB,$2782,$2782,$27AC,$27AD,$27AE,$27AF
	dw $27B0,$27B1,$27B2,$27B3,$27B4,$27B5,$27B6,$67B6
	dw $67B5,$67B4,$67B3,$67B2,$67B1,$67B0,$27B7,$274E
	dw $27B8,$27B9,$2782,$2782,$27BA,$27BB,$27BC,$27BD
	dw $27BE,$27BF,$27C0,$27C1,$27C2,$27C3,$27C4,$67C4
	dw $67C3,$67C2,$67C1,$67C0,$67BF,$67BE,$27C5,$27C6
	dw $27C7,$2782,$2782,$2782,$27C8,$27C9,$27CA,$27CB
	dw $27CC,$27CD,$27CE,$27CF,$27D0,$27D1,$27D2,$67D2
	dw $67D1,$67D0,$67CF,$67CE,$67CD,$67CC,$67CB,$27D3
	dw $27D4,$2782,$2782,$2782,$A7C8,$A7C9,$A7CA,$A7CB
	dw $A7CC,$A7CD,$A7CE,$A7CF,$A7D0,$A7D1,$A7D2,$E7D2
	dw $E7D1,$E7D0,$E7CF,$E7CE,$E7CD,$E7CC,$E7CB,$27D5
	dw $27D6,$2782,$2782,$2782,$A7BA,$A7BB,$A7BC,$A7BD
	dw $A7BE,$A7BF,$A7C0,$A7C1,$A7C2,$A7C3,$A7C4,$E7C4
	dw $E7C3,$E7C2,$E7C1,$E7C0,$E7BF,$E7BE,$E7BD,$27D7
	dw $2782,$2782,$2782,$2782,$A7AC,$A7AD,$A7AE,$A7AF
	dw $A7B0,$A7B1,$A7B2,$A7B3,$A7B4,$A7B5,$A7B6,$E7B6
	dw $E7B5,$E7B4,$E7B3,$E7B2,$E7B1,$E7B0,$E7AF,$27D8
	dw $2782,$2782,$2782,$2782,$A79E,$A79F,$A7A0,$A7A1
	dw $A7A2,$A7A3,$A7A4,$A7A5,$A7A6,$A7A7,$A7A8,$E7A8
	dw $E7A7,$E7A6,$E7A5,$E7A4,$E7A3,$E7A2,$E7A1,$27D9
	dw $A7D6,$2782,$2782,$2782,$2782,$A790,$A791,$A792
	dw $A793,$A794,$A795,$A796,$A797,$A798,$A799,$E799
	dw $E798,$E797,$E796,$E795,$E794,$E793,$E792,$27DA
	dw $A7D4,$2782,$2782,$2782,$2782,$A783,$A784,$A785
	dw $A786,$A787,$A788,$A789,$A78A,$A78B,$A78C,$E78C
	dw $E78B,$E78A,$E789,$E788,$E787,$E786,$E785,$27DB
	dw $A7C7,$2782,$2782,$2782,$2782,$2782,$A776,$A777
	dw $A778,$A779,$A77A,$A77B,$A77C,$A77D,$A77E,$E77E
	dw $E77D,$E77C,$E77B,$E77A,$E779,$E778,$E777,$27DC
	dw $A7B8,$A7B9,$2782,$2782,$2782,$2782,$27DD,$27DE
	dw $A76A,$A76B,$A76C,$A76D,$A76E,$A76F,$A770,$E770
	dw $E76F,$E76E,$E76D,$E76C,$E76B,$E76A,$27DF,$27E0
	dw $274E,$A7AB,$2782,$2782,$2782,$2782,$2782,$27E1
	dw $27E2,$27E3,$27E4,$27E5,$27E6,$27E7,$27E8,$67E8
	dw $67E7,$67E6,$67E5,$67E4,$67E3,$67E2,$27E9,$274E
	dw $274E,$A79C,$A79D,$2782,$2782,$2782,$2782,$2782
	dw $2782,$27EA,$27EB,$27EC,$27ED,$27EE,$27EF,$67EF
	dw $67EE,$67ED,$67EC,$67EB,$67EA,$E79D,$E79C,$274E
	dw $274E,$274E,$A78F,$2782,$2782,$2782,$2782,$2782
	dw $2782,$2782,$2782,$27F0,$27F1,$27F2,$27F3,$67F3
	dw $67F2,$67F1,$67F0,$2782,$2782,$E78F,$274E,$274E
	dw $274E,$274E,$274E,$A781,$2782,$2782,$2782,$2782
	dw $2782,$2782,$2782,$2782,$2782,$2782,$2782,$2782
	dw $2782,$2782,$2782,$2782,$E781,$274E,$274E,$274E
	dw $274E,$274E,$274E,$274E,$A774,$A775,$2782,$2782
	dw $2782,$2782,$2782,$2782,$2782,$2782,$2782,$2782
	dw $2782,$2782,$E775,$E774,$274E,$274E,$274E,$274E
	dw $274E,$274E,$274E,$274E,$274E,$A767,$27F4,$A7B9
	dw $2782,$2782,$2782,$2782,$2782,$2782,$2782,$2782
	dw $E7B9,$67F4,$E767,$274E,$274E,$274E,$274E,$274E
	dw $274E,$274E,$274E,$274E,$274E,$274E,$274E,$27F5
	dw $27F6,$27F7,$27F8,$2782,$2782,$67F8,$67F7,$67F6
	dw $67F5,$274E,$274E,$274E,$274E,$274E,$274E,$274E

DATA_14C770:
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$05C0,$05C2,$05C4,$05C6,$05C8
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$05CA,$05CC,$05CE,$05E0,$05E2
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E,$8F2C,$0F2E
	dw $8F2C,$0F2E,$8F2C,$0400,$05E4,$05E6,$05E8,$0400
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E,$0F2C,$8F2E
	dw $0F2C,$8F2E,$0F2C,$0400,$0400,$05EA,$0400,$0400

DATA_14CB30:
	dw $00C0,$00E0,$02C0,$02E0,$0480,$04A0,$04C0,$04E0
	dw $0680,$06A0,$06C0,$06E0,$0800,$0820,$0840,$0860
	dw $0A00,$0A20,$0A40,$0A60,$0C00,$0C20,$0E00,$0E20

DATA_14CB60:
	dw $A00C,$A00E,$A02C,$A02C,$A02E,$A048,$A04A,$A04A
	dw $A068,$A06A,$A04C,$A04C,$A04E,$A06C,$A06E,$A06E
	dw $A080,$A082,$A0A0,$A0A0,$A0A2,$A084,$A086,$A086
	dw $A0A4,$A0A6,$A0C0,$A0C0,$A0C2,$A0E0,$A0E2,$A0E2
	dw $20E2,$20E2,$20E0,$20C2,$20C0,$20C0,$20A6,$20A4
	dw $2086,$2086,$2084,$20A2,$20A0,$20A0,$2082,$2080
	dw $206E,$206E,$206C,$204E,$204C,$204C,$206A,$2068
	dw $204A,$204A,$2048,$202E,$202C,$202C,$200E,$200C
	dw $600C,$600E,$602C,$602C,$602E,$6048,$604A,$604A
	dw $6068,$606A,$604C,$604C,$604E,$606C,$606E,$606E
	dw $6080,$6082,$60A0,$60A0,$60A2,$6084,$6086,$6086
	dw $60A4,$60A6,$60C0,$60C0,$60C2,$60E0,$60E2,$60E2
	dw $E0E2,$E0E2,$E0E0,$E0C2,$E0C0,$E0C0,$E0A6,$E0A4
	dw $E086,$E086,$E084,$E0A2,$E0A0,$E0A0,$E082,$E080
	dw $E06E,$E06E,$E06C,$E04E,$E04C,$E04C,$E06A,$E068
	dw $E04A,$E04A,$E048,$E02E,$E02C,$E02C,$E00E,$E00C

DATA_14CC60:
	dw $0600,$130D,$1F19,$2C26,$3832,$443E,$504A,$5C56
	dw $6862,$736D,$7E79,$8984,$938E,$9D98,$A7A2,$B1AC
	dw $B9B5,$C2BE,$CAC6,$D1CE,$D8D5,$DFDC,$E5E2,$EAE7
	dw $EFED,$F3F1,$F7F5,$FAF8,$FCFB,$FEFD,$FFFE,$FFFF

	%InsertGarbageData($14CCA0, incbin, DATA_14CCA0.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank18Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

CODE_188000:
	JMP.w CODE_18802D

CODE_188003:
	JMP.w CODE_18DD2E

CODE_188006:
	JMP.w CODE_18DD16

CODE_188009:
	JMP.w CODE_188034

CODE_18800C:
	JMP.w CODE_18DD2E

CODE_18800F:
	JMP.w CODE_18DD16

CODE_188012:
	JMP.w CODE_18803B

CODE_188015:
	JMP.w CODE_18DD2E

CODE_188018:
	JMP.w CODE_18DD16

CODE_18801B:
	JMP.w CODE_188049

CODE_18801E:
	JMP.w CODE_18DD2E

CODE_188021:
	JMP.w CODE_18DD16

CODE_188024:
	JMP.w CODE_188042

CODE_188027:
	JMP.w CODE_18DD2E

CODE_18802A:
	JMP.w CODE_18DD16

CODE_18802D:
	REP.b #$20
	LDA.w #$0000
	BRA.b CODE_18804E

CODE_188034:
	REP.b #$20
	LDA.w #$0002
	BRA.b CODE_18804E

CODE_18803B:
	REP.b #$20
	LDA.w #$0004
	BRA.b CODE_18804E

CODE_188042:
	REP.b #$20
	LDA.w #$0006
	BRA.b CODE_18804E

CODE_188049:
	REP.b #$20
	LDA.w #$0008
CODE_18804E:
	STA.w $0CD6
	SEI
	CLD
	REP.b #$20
	LDA.w #$0000
	TCD
	SEP.b #$30
	LDA.b #MainDataBank03>>16
	PHA
	PLB
	JSR.w CODE_18DBE1
	JSR.w CODE_18DC87
	JSR.w CODE_18D922
	REP.b #$10
	LDX.w #$0000
	STX.b $02
	LDA.b #$81
	STA.w $0C92
	STA.w $4200
	JSR.w CODE_18D8F1
	JSR.w CODE_18B23F
	JSR.w CODE_18D8AC
	JSR.w CODE_1880AC
	JSR.w CODE_18D8EE
	REP.b #$20
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BMI.b CODE_18809E
	DEC.w !RAM_SXAR_Global_CurrentLivesLo
	JSR.w CODE_18D932
	SEP.b #$20
	STZ.w $0C92
	STZ.w $4200
	REP.b #$30
	RTL

CODE_18809E:
	JSR.w CODE_18D932
	SEP.b #$20
	STZ.w $0C92
	STZ.w $4200
	REP.b #$30
	RTL

CODE_1880AC:
	REP.b #$30
	STZ.w !RAM_SXAR_Global_LevelClearFlags
	JSR.w CODE_18D8F1
	JSR.w CODE_18B24A
	JSR.w CODE_18BC51
	JSR.w CODE_18B321
	JSR.w CODE_18D8EE
	JSR.w CODE_18BD92
	JSR.w CODE_18BDE7
	JSR.w CODE_18B641
	JSR.w CODE_18B4B2
	REP.b #$30
	LDA.w #$0002
	STA.b $02
	JSR.w CODE_18DC9C
	JSR.w CODE_18D97F
	JSR.w CODE_18D94D
CODE_1880DC:
	JSR.w CODE_18D932
	REP.b #$30
	INC.b $39
	JSR.w CODE_188162
	JSR.w CODE_1882D5
	JSR.w CODE_18B056
	JSR.w CODE_189B18
	JSR.w CODE_189010
	JSR.w CODE_1892FB
	JSR.w CODE_18820A
	JSR.w CODE_189A86
	JSR.w CODE_189985
	JSR.w CODE_18C3A0
	JSR.w CODE_18B901
	JSR.w CODE_18BA37
	JSR.w CODE_18B641
	JSR.w CODE_18BE28
	REP.b #$30
	LDA.w $0620
	LSR
	BCC.b CODE_188134
	LDA.w $10FA
	CMP.w #$0064
	BNE.b CODE_188123
	LDA.w #$2802
	JSR.w CODE_18D832
CODE_188123:
	DEC.w $10FA
	BNE.b CODE_1880DC
CODE_188128:
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BPL.b CODE_188133
	LDA.w #$0001
	STA.w $010C
CODE_188133:
	RTS

CODE_188134:
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BPL.b CODE_1880DC
	LDA.w $0CD6
	CMP.w #$0008
	BNE.b CODE_188157
	BIT.w $11FE
	BPL.b CODE_18814C
	LDA.w #$0026
	STA.w $11FE
CODE_18814C:
	BIT.w $1204
	BPL.b CODE_188157
	LDA.w #$0026
	STA.w $1204
CODE_188157:
	LDA.w $114A
	BEQ.b CODE_188128
	DEC.w $114A
	JMP.w CODE_1880DC

CODE_188162:
	PHP
	REP.b #$30
	LDA.b $1D
	BIT.w #$1000
	BEQ.b CODE_1881B5
	SEP.b #$20
	LDA.b #$0A
	STA.w $0C91
	REP.b #$30
	LDX.w #$0316
	LDY.w #DATA_198A85
	JSR.w CODE_18BD44
	LDA.w #$FFFF
	STA.w $10FC
	LDA.w $062C
	AND.w #$F1FF
	STA.w $062C
	JSR.w CODE_18D932
	JSR.w CODE_18B641
CODE_188193:
	JSR.w CODE_18D932
	LDA.b $1D
	BIT.w #$1000
	BEQ.b CODE_188193
	SEP.b #$20
	LDA.b #$0F
	STA.w $0C91
	REP.b #$30
	LDX.w #$0316
	LDY.w #DATA_198A8B
	JSR.w CODE_18BD44
	LDA.w #$FFFF
	STA.w $10FC
CODE_1881B5:
	PLP
	RTS

CODE_1881B7:
	PHP
	JMP.w CODE_188208

CODE_1881BB:
	SEP.b #$20
	LDA.b #$01
	STA.w $2126
	LDA.b #$01
	STA.w $2127
	LDA.b #$A0
	STA.w $2128
	LDA.b #$D0
	STA.w $2129
	LDA.b #$00
	STA.w $212A
	LDA.b #$00
	STA.w $212B
	LDA.b #$1F
	STA.w $212C
	LDA.b #$02
	STA.w $212D
	LDA.b #$1F
	STA.w $212E
	LDA.b #$00
	STA.w $212F
	LDA.b #$02
	STA.w $2130
	LDA.b #$73
	STA.w $2131
	LDA.b #$8C
	STA.w $2132
	LDA.b #$4C
	STA.w $2132
	LDA.b #$2C
	STA.w $2132
CODE_188208:
	PLP
	RTS

CODE_18820A:
	PHP
	REP.b #$30
	LDA.b $58
	CLC
	ADC.w #$0078
	STA.b $25
	LDA.b $58
	CLC
	ADC.w #$0088
	STA.b $27
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	BIT.b $62
	BPL.b CODE_18822A
	CMP.b $25
	BCC.b CODE_188230
	BCS.b CODE_18822E
CODE_18822A:
	CMP.b $27
	BCS.b CODE_188230
CODE_18822E:
	STZ.b $62
CODE_188230:
	LDA.b $27
	CLC
	ADC.w #$0010
	CMP.w !RAM_SXAR_SpiderMan_XPosLo
	BCS.b CODE_188243
	LDA.b $62
	CLC
	ADC.w #$0002
	STA.b $62
CODE_188243:
	LDA.b $25
	SEC
	SBC.w #$0010
	CMP.w !RAM_SXAR_SpiderMan_XPosLo
	BCC.b CODE_188256
	LDA.b $62
	SEC
	SBC.w #$0002
	STA.b $62
CODE_188256:
	LDA.b $5C
	CLC
	ADC.w #$0070
	STA.b $25
	LDA.b $5C
	CLC
	ADC.w #$0090
	STA.b $27
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	BIT.b $64
	BPL.b CODE_188273
	CMP.b $25
	BCC.b CODE_188279
	BCS.b CODE_188277
CODE_188273:
	CMP.b $27
	BCS.b CODE_188279
CODE_188277:
	STZ.b $64
CODE_188279:
	LDA.w $0CB2
	ASL
	ASL
	ASL
	ASL
	SEC
	SBC.w #$0100
	STA.b $25
	LDA.w $0CB8
	ASL
	ASL
	ASL
	ASL
	SEC
	SBC.w #$00E0
	STA.b $27
	LDA.b $62
	CLC
	ADC.b $58
	CMP.b $25
	BCS.b CODE_1882A0
	STA.b $58
	BRA.b CODE_1882A2

CODE_1882A0:
	STZ.b $62
CODE_1882A2:
	LDA.b $64
	CLC
	ADC.b $5C
	CMP.b $27
	BCS.b CODE_1882AF
	STA.b $5C
	BRA.b CODE_1882B1

CODE_1882AF:
	STZ.b $64
CODE_1882B1:
	JSR.w CODE_18BFFA
	STZ.w $1200
	STZ.w $1202
	LDX.w $11FE
	BMI.b CODE_1882CA
	LDA.w DATA_198B26,x
	STA.w $1200
	DEX
	DEX
	STX.w $11FE
CODE_1882CA:
	PLP
	RTS

CODE_1882CC:
	STZ.b $62
	STZ.b $64
	JSR.w CODE_18BFFA
	PLP
	RTS

CODE_1882D5:
	PHP
	REP.b #$30
	STZ.b $87
	STZ.b $89
	STZ.w $0630
	STZ.w $0632
	STZ.b $9F
	STZ.b $62
	STZ.b $64
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	CMP.w #$0081
	BCC.b CODE_1882F6
	LDA.w #$0080
	STA.w !RAM_SXAR_SpiderMan_CurrentHPLo
CODE_1882F6:
	LDX.w #$0620
	STX.b $3D
	JSR.w CODE_188D00
	JSR.w CODE_18AF32
	JSR.w CODE_188B6F
	JSR.w CODE_188D69
	LDX.w $0624
	LDY.w $0626
	JSR.w (DATA_18832C,x)
	JSR.w CODE_188B15
	JSR.w CODE_18AF1E
	LDA.w $0CE6
	CMP.w #$0006
	BNE.b CODE_188321
	JSR.w CODE_188EE9
CODE_188321:
	JSR.w CODE_18CBB5
	JSR.w CODE_18CBE9
	JSR.w CODE_188A96
	PLP
	RTS

DATA_18832C:
	dw CODE_188348
	dw CODE_1883DC
	dw CODE_1883E9
	dw CODE_18849E
	dw CODE_1885A0
	dw CODE_1885C9
	dw CODE_1885F9
	dw CODE_1886B8
	dw CODE_18885C
	dw CODE_1888B0
	dw CODE_18896E
	dw CODE_188A11
	dw CODE_188A3C
	dw CODE_188A86

CODE_188348:
	BPL.b CODE_188350
	LDA.w #$0002
	JSR.w CODE_1896FC
CODE_188350:
	LDX.w #$0620
	LDA.b $00,x
	LSR
	BCC.b CODE_18835E
	LDA.w #$001A
	JMP.w CODE_188DD4

CODE_18835E:
	LDA.b $1D
	BIT.w #$4000
	BEQ.b CODE_188387
	LDX.w #$000B
	LDY.w #$FFE4
	JSR.w CODE_189263
	BCC.b CODE_188387
	JSR.w CODE_1892E0
	STZ.b $87
	JSR.w CODE_188C55
	BCS.b CODE_188386
	LDA.w #$001E
	JSR.w CODE_189700
	LDA.w #$000A
	JMP.w CODE_188DD4

CODE_188386:
	RTS

CODE_188387:
	LDA.b $1D
	BIT.w #$0040
	BEQ.b CODE_18839F
	BIT.w $0CD8
	BMI.b CODE_18839F
	LDA.w #$0C02
	JSR.w CODE_18D832
	LDA.w #$000C
	JMP.w CODE_188DD4

CODE_18839F:
	LDA.b $0D
	BIT.w #$0400
	BEQ.b CODE_1883B1
	JSR.w CODE_188E2D
	BCC.b CODE_1883B1
	LDA.w #$0014
	JMP.w CODE_188DD4

CODE_1883B1:
	JSR.w CODE_188DBB
	BIT.b $97
	BMI.b CODE_1883C5
	LDA.w #$0200
	STA.b $16,x
	LDA.w #$0002
	JSR.w CODE_188DD4
	BRA.b CODE_1883C8

CODE_1883C5:
	JSR.w CODE_188C55
CODE_1883C8:
	LDX.w #$0620
	JSR.w CODE_18AD03
	BCC.b CODE_1883D2
	STZ.b $87
CODE_1883D2:
	BIT.b $97
	BPL.b CODE_1883D9
	JSR.w CODE_18987D
CODE_1883D9:
	JMP.w CODE_188D17

CODE_1883DC:
	BPL.b CODE_1883F4
	STZ.w $0638
	LDA.w #$0022
	JSR.w CODE_1896FC
	BRA.b CODE_1883F4

CODE_1883E9:
	BPL.b CODE_1883F4
	STZ.w $0638
	LDA.w #$0024
	JSR.w CODE_1896FC
CODE_1883F4:
	LDX.w #$0620
	LDA.b $04,x
	CMP.w #$0018
	BEQ.b CODE_188425
	LDA.b $1D
	BIT.w #$4000
	BEQ.b CODE_188425
	LDX.w #$0009
	LDY.w #$FFE6
	JSR.w CODE_189263
	BCC.b CODE_188425
	JSR.w CODE_1892E0
	LDA.w #$002E
	BIT.b $16,x
	BPL.b CODE_18841D
	LDA.w #$0026
CODE_18841D:
	JSR.w CODE_189700
	LDA.w #$000F
	STA.b $18,x
CODE_188425:
	LDA.w $0620
	LSR
	BCC.b CODE_18842F
	STZ.b $87
	BRA.b CODE_18844A

CODE_18842F:
	LDA.b $04,x
	CMP.w #$0018
	BEQ.b CODE_18844A
	BIT.w $114C
	BPL.b CODE_18844A
	LDA.b $87
	LDY.w $1150
	BEQ.b CODE_18844A
	BMI.b CODE_188447
	INC
	BRA.b CODE_188448

CODE_188447:
	DEC
CODE_188448:
	STA.b $87
CODE_18844A:
	JSR.w CODE_188D2A
	JSR.w CODE_188DBB
	JSR.w CODE_188C76
	LDA.b $04,x
	CMP.w #$0018
	BEQ.b CODE_18847F
	LDA.b $18,x
	BEQ.b CODE_188462
	DEC.b $18,x
	BRA.b CODE_18847F

CODE_188462:
	LDA.b $89
	BEQ.b CODE_18847F
	LDA.b $04,x
	CMP.w #$0010
	BEQ.b CODE_188479
	CMP.w #$0002
	BEQ.b CODE_188479
	LDA.w #$0024
	LDY.b $16,x
	BMI.b CODE_18847C
CODE_188479:
	LDA.w #$0022
CODE_18847C:
	JSR.w CODE_189700
CODE_18847F:
	LDA.w #$0008
	CMP.b $91
	BNE.b CODE_18849D
	JSR.w CODE_188BFE
	BCC.b CODE_18849D
	LDA.w #$1402
	JSR.w CODE_18D832
	LDA.w #$0006
	JSR.w CODE_188DD4
	LDA.w #$0034
	JSR.w CODE_189700
CODE_18849D:
	RTS

CODE_18849E:
	BPL.b CODE_1884AB
	LDX.w #$0620
	STZ.b $16,x
	LDA.w #$0038
	JMP.w CODE_1896FC

CODE_1884AB:
	LDX.w #$0620
	LDA.b $1D
	BIT.w #$0040
	BEQ.b CODE_1884C6
	BIT.w $0CD8
	BMI.b CODE_1884C6
	LDA.w #$0C02
	JSR.w CODE_18D832
	LDA.w #$0012
	JMP.w CODE_188DD4

CODE_1884C6:
	LDA.b $1D
	BIT.w #$4000
	BEQ.b CODE_1884F9
	LDA.b $0C,x
	PHA
	EOR.w #$4000
	STA.b $0C,x
	LDX.w #$000C
	LDY.w #$FFE8
	JSR.w CODE_189263
	PLA
	STA.b $0C,x
	BCC.b CODE_1884F9
	LDA.b $0C,x
	EOR.w #$4000
	JSR.w CODE_1892E2
	STZ.b $87
	LDA.w #$003A
	JSR.w CODE_189700
	LDA.w #$0016
	JMP.w CODE_188DD4

CODE_1884F9:
	LDY.w $0CD6
	CPY.w #$0008
	BEQ.b CODE_188506
	BIT.w $11FE
	BPL.b CODE_188551
CODE_188506:
	LDA.b $1D
	BIT.w #$8000
	BEQ.b CODE_188555
	LDA.b $0D
	BIT.w #$0400
	BNE.b CODE_18853F
	BIT.b $0C,x
	BVC.b CODE_18851F
	BIT.w #$0100
	BEQ.b CODE_188555
	BRA.b CODE_188524

CODE_18851F:
	BIT.w #$0200
	BEQ.b CODE_188555
CODE_188524:
	JMP.w CODE_188587

CODE_188527:
	LDA.w #$FE00
	STA.b $16,x
CODE_18852C:
	LDA.b $0C,x
	EOR.w #$4000
	STA.b $0C,x
	LDA.w #$0022
	JSR.w CODE_189700
	LDA.w #$0002
	JMP.w CODE_188DD4

CODE_18853F:
	LDA.b $0D
	BIT.b $0C,x
	BVC.b CODE_18854C
	BIT.w #$0200
	BNE.b CODE_188555
	BRA.b CODE_188551

CODE_18854C:
	BIT.w #$0100
	BNE.b CODE_188555
CODE_188551:
	STZ.b $16,x
	BRA.b CODE_18852C

CODE_188555:
	STZ.b $87
	JSR.w CODE_188D98
	JSR.w CODE_188C02
	BCS.b CODE_188563
	STZ.b $89
	BRA.b CODE_18856A

CODE_188563:
	JSR.w CODE_188C76
	LDA.b $89
	BNE.b CODE_188572
CODE_18856A:
	LDA.w #$0038
	JSR.w CODE_189700
	BRA.b CODE_18857F

CODE_188572:
	BPL.b CODE_188579
	LDA.w #$0006
	BRA.b CODE_18857C

CODE_188579:
	LDA.w #$0008
CODE_18857C:
	JSR.w CODE_18988B
CODE_18857F:
	RTS

CODE_188580:
	LDA.b $1D
	BIT.w #$8000
	BEQ.b CODE_18859F
CODE_188587:
	LDA.w #$FAC0
	STA.b $16,x
	LDA.b $0C,x
	EOR.w #$4000
	STA.b $0C,x
	LDA.w #$0024
	JSR.w CODE_189700
	LDA.w #$0008
	JMP.w CODE_188DD4

CODE_18859F:
	RTS

CODE_1885A0:
	BPL.b CODE_1885B9
	LDX.w #$0620
	STZ.b $18,x
	LDA.w #$0002
	BIT.b $0C,x
	BVC.b CODE_1885B1
	LDA.w #$FFFE
CODE_1885B1:
	STA.b $14,x
	LDA.w #$0024
	JMP.w CODE_1896FC

CODE_1885B9:
	LDX.w #$0620
	LDA.b $87
	BEQ.b CODE_1885C2
	STA.b $14,x
CODE_1885C2:
	LDA.b $14,x
	STA.b $87
	JMP.w CODE_1883F4

CODE_1885C9:
	BPL.b CODE_1885D9
	LDX.w #$0620
	LDA.w #$0007
	STA.b $18,x
	LDA.w #$001E
	JSR.w CODE_1896FC
CODE_1885D9:
	LDX.w #$0620
	JSR.w CODE_188C55
	BCS.b CODE_1885F8
	LDA.b $18,x
	CMP.w #$0002
	BCS.b CODE_1885EE
	LDA.w #$0002
	JSR.w CODE_189700
CODE_1885EE:
	DEC.b $18,x
	BNE.b CODE_1885F8
	LDA.w #$0000
	JMP.w CODE_188DD4

CODE_1885F8:
	RTS

CODE_1885F9:
	BPL.b CODE_18863E
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$002C
	STA.w $0CE4
	STA.w $0CDC
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	BIT.w $062C
	BVC.b CODE_188619
	LDX.w #$0040
	SEC
	SBC.w #$0010
	BRA.b CODE_188620

CODE_188619:
	LDX.w #$0000
	CLC
	ADC.w #$000E
CODE_188620:
	STA.w $0CE2
	STA.w $0CDA
	STX.w $0CDE
	STZ.w $0CE0
	LDA.w #$8000
	STA.w $0CD8
	LDA.w #$0002
	STA.w $0CE6
	LDA.w #$0020
	JMP.w CODE_1896FC

CODE_18863E:
	LDX.w $0CDA
	LDY.w $0CDC
	BMI.b CODE_1886A6
	JSR.w CODE_18AE20
	BIT.w #$A000
	BEQ.b CODE_188677
	BIT.w #$2000
	BEQ.b CODE_1886A6
	LDA.w $0CE0
	CMP.w #$0016
	BCC.b CODE_1886A6
	LDX.b $3D
	LDA.w #$0002
	BIT.w $062C
	BVC.b CODE_188668
	LDA.w #$FFFE
CODE_188668:
	STA.w $0CE8
	LDA.w #$1702
	JSR.w CODE_18D832
	LDA.w #$000E
	JMP.w CODE_188DD4

CODE_188677:
	LDA.w $0CE0
	CLC
	ADC.w #$0006
	CMP.w #$0096
	BCS.b CODE_1886A6
	STA.w $0CE0
	LDA.w $0CDC
	SEC
	SBC.w #$0006
	STA.w $0CDC
	LDA.w $0CDA
	BIT.w $062C
	BVC.b CODE_18869E
	SEC
	SBC.w #$0006
	BRA.b CODE_1886A2

CODE_18869E:
	CLC
	ADC.w #$0006
CODE_1886A2:
	STA.w $0CDA
	RTS

CODE_1886A6:
	STZ.w $0CD8
	LDA.w #$0000
	STA.w $0CE6
	LDX.b $3D
	LDA.w #$0000
	JMP.w CODE_188DD4

CODE_1886B7:
	RTS

CODE_1886B8:
	BMI.b CODE_1886BD
	JMP.w CODE_18876C

CODE_1886BD:
	LDA.w $0CDC
	AND.w #$FFF8
	ORA.w #$0004
	STA.w $0CDC
	LDX.w #$0620
	LDA.w $0CE8
	JSR.w CODE_188DC1
	SEP.b #$30
	LDY.w $0CE0
	LDA.b #$09
	STA.w $4202
	STY.w $4203
	NOP #4
	LDA.w $4217
	STA.b $25
	STZ.b $26
	LDA.b #$6A
	STA.w $4202
	STY.w $4203
	NOP #4
	REP.b #$30
	LDA.w $4216
	CLC
	ADC.b $25
	XBA
	AND.w #$00FF
	CLC
	ADC.w $0CE0
	STA.w $0CE0
	LDA.w #$0004
	STA.w $0CE6
	JSR.w CODE_188EE9
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	STA.w $110C
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	STA.w $110E
	JSR.w CODE_1887D7
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.w $110C
	STA.b $87
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w $110E
	STA.b $89
	LDX.w !RAM_SXAR_SpiderMan_XPosLo
	LDY.w !RAM_SXAR_SpiderMan_YPosLo
	LDA.w $110C
	STA.w !RAM_SXAR_SpiderMan_XPosLo
	LDA.w $110E
	STA.w !RAM_SXAR_SpiderMan_YPosLo
	STX.w $110C
	STY.w $110E
	JSR.w CODE_18883C
	STZ.b $87
	STZ.b $89
	STZ.w $0630
	STZ.w $0632
	BCS.b CODE_188773
	LDA.w $110C
	STA.w !RAM_SXAR_SpiderMan_XPosLo
	LDA.w $110E
	STA.w !RAM_SXAR_SpiderMan_YPosLo
	LDA.w #$0028
	JMP.w CODE_1896FC

CODE_18876C:
	LDA.b $1D
	BIT.w #$0040
	BEQ.b CODE_18878C
CODE_188773:
	LDX.b $3D
	LDA.w #$FCE0
	STA.b $16,x
CODE_18877A:
	LDA.w #$0010
	JSR.w CODE_188DD4
	LDA.w #$0006
	STA.w $0CE6
	LDY.w $0626
	JMP.w CODE_18885C

CODE_18878C:
	LDA.b $0D
	BIT.w #$0800
	BEQ.b CODE_1887A2
	LDA.w $0CE0
	SEC
	SBC.w #$0003
	CMP.w #$0028
	BCC.b CODE_1887A2
	STA.w $0CE0
CODE_1887A2:
	LDA.b $0D
	BIT.w #$0400
	BEQ.b CODE_1887B8
	LDA.w $0CE0
	CLC
	ADC.w #$0002
	CMP.w #$00D2
	BCS.b CODE_1887B8
	STA.w $0CE0
CODE_1887B8:
	LDX.w $0CE2
	LDY.w $0CE4
	JSR.w CODE_188825
	BCC.b CODE_1887C9
	LDX.b $3D
	STZ.b $16,x
	BRA.b CODE_18877A

CODE_1887C9:
	LDA.w $0624
	CMP.w #$0010
	BNE.b CODE_1887D7
	LDY.w $0626
	JMP.w CODE_18885C

CODE_1887D7:
	LDA.w $0CE2
	BIT.w $062C
	BVC.b CODE_1887E5
	CLC
	ADC.w #$0004
	BRA.b CODE_1887E9

CODE_1887E5:
	SEC
	SBC.w #$0002
CODE_1887E9:
	STA.w !RAM_SXAR_SpiderMan_XPosLo
	LDA.w $0CE4
	CLC
	ADC.w #$0021
	STA.w !RAM_SXAR_SpiderMan_YPosLo
	LDY.w $0CDE
	LDA.w #$0028
	BIT.w $062C
	BVC.b CODE_188810
	CPY.w #$0032
	BCS.b CODE_188820
	LDA.w #$002A
	CPY.w #$001A
	BCS.b CODE_188820
	BCC.b CODE_18881D
CODE_188810:
	CPY.w #$001A
	BCC.b CODE_188820
	LDA.w #$002A
	CPY.w #$0032
	BCC.b CODE_188820
CODE_18881D:
	LDA.w #$002C
CODE_188820:
	LDX.b $3D
	JMP.w CODE_189700

CODE_188825:
	STX.b $29
	STY.b $2B
	JSR.w CODE_188EE9
	LDA.w $0CE2
	SEC
	SBC.b $29
	STA.b $87
	LDA.w $0CE4
	SEC
	SBC.b $2B
	STA.b $89
CODE_18883C:
	LDX.b $3D
	JSR.w CODE_18AC4B
	BCS.b CODE_188854
	JSR.w CODE_18AD03
	BCS.b CODE_188854
	LDA.b $87
	STA.w $0630
	LDA.b $89
	STA.w $0632
	CLC
	RTS

CODE_188854:
	LDA.w #$3F02
	JSR.w CODE_18D832
	SEC
	RTS

CODE_18885C:
	BPL.b CODE_188875
	LDX.w #$0620
	LDA.w #$0300
	BIT.b $0C,x
	BVC.b CODE_18886B
	LDA.w #$FD00
CODE_18886B:
	STA.b $14,x
	STZ.b $18,x
	LDA.w #$0022
	JSR.w CODE_1896FC
CODE_188875:
	LDX.w #$0620
	LDA.b $14,x
	BEQ.b CODE_1888AD
	BPL.b CODE_18888F
	CLC
	ADC.w #$0020
	BCS.b CODE_1888AB
	STA.b $14,x
	XBA
	AND.w #$00FF
	ORA.w #$FF00
	BRA.b CODE_18889C

CODE_18888F:
	SEC
	SBC.w #$0020
	BCC.b CODE_1888AB
	STA.b $14,x
	XBA
	AND.w #$00FF
	INC
CODE_18889C:
	STA.b $25
	LDA.b $87
	CMP.w #$8000
	ROR
	CLC
	ADC.b $25
	STA.b $87
	BRA.b CODE_1888AD

CODE_1888AB:
	STZ.b $14,x
CODE_1888AD:
	JMP.w CODE_1883F4

CODE_1888B0:
	BPL.b CODE_1888F5
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$001D
	STA.w $0CE4
	STA.w $0CDC
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	BIT.w $062C
	BVS.b CODE_1888D0
	LDX.w #$0040
	SEC
	SBC.w #$0015
	BRA.b CODE_1888D7

CODE_1888D0:
	LDX.w #$0000
	CLC
	ADC.w #$0013
CODE_1888D7:
	STA.w $0CE2
	STA.w $0CDA
	STX.w $0CDE
	STZ.w $0CE0
	LDA.w #$8000
	STA.w $0CD8
	LDA.w #$0002
	STA.w $0CE6
	LDA.w #$003A
	JMP.w CODE_1896FC

CODE_1888F5:
	LDX.w $0CDA
	LDY.w $0CDC
	BMI.b CODE_188912
	JSR.w CODE_18AE20
	BIT.w #$A000
	BEQ.b CODE_18893F
	BIT.w #$2000
	BEQ.b CODE_188912
	LDA.w $0CE0
	CMP.w #$0016
	BCS.b CODE_188923
CODE_188912:
	STZ.w $0CD8
	LDA.w #$0000
	STA.w $0CE6
	LDX.b $3D
	LDA.w #$0006
	JMP.w CODE_188DD4

CODE_188923:
	LDX.b $3D
	LDA.w #$0002
	BIT.w $062C
	BVS.b CODE_188930
	LDA.w #$FFFE
CODE_188930:
	STA.w $0CE8
	LDA.w #$1702
	JSR.w CODE_18D832
	LDA.w #$000E
	JMP.w CODE_188DD4

CODE_18893F:
	LDA.w $0CE0
	CLC
	ADC.w #$0006
	CMP.w #$0096
	BCS.b CODE_188912
	STA.w $0CE0
	LDA.w $0CDC
	SEC
	SBC.w #$0006
	STA.w $0CDC
	LDA.w $0CDA
	BIT.w $062C
	BVS.b CODE_188966
	SEC
	SBC.w #$0006
	BRA.b CODE_18896A

CODE_188966:
	CLC
	ADC.w #$0006
CODE_18896A:
	STA.w $0CDA
	RTS

CODE_18896E:
	BPL.b CODE_18897D
	LDX.w #$0620
	STZ.b $18,x
	STZ.b $16,x
	LDA.w #$0018
	JMP.w CODE_1896FC

CODE_18897D:
	LDX.w #$0620
	TYA
	BEQ.b CODE_188986
	JMP.w CODE_188A0A

CODE_188986:
	LDA.b $1D
	BIT.w #$0040
	BEQ.b CODE_18899E
	BIT.w $0CD8
	BMI.b CODE_18899E
	LDA.w #$0C02
	JSR.w CODE_18D832
	LDA.w #$000C
	JMP.w CODE_188DD4

CODE_18899E:
	JSR.w CODE_188C55
	BCS.b CODE_1889F9
	JSR.w CODE_188DBB
	LDA.b $0D
	LDY.w #$0001
	BIT.w #$0400
	BNE.b CODE_1889B3
	LDY.w #$FFFF
CODE_1889B3:
	STY.b $16,x
	BIT.b $16,x
	BPL.b CODE_1889C7
	LDY.b $18,x
	BNE.b CODE_1889C3
	LDA.w #$0000
	JMP.w CODE_188DD4

CODE_1889C3:
	DEC.b $18,x
	BRA.b CODE_1889C9

CODE_1889C7:
	INC.b $18,x
CODE_1889C9:
	LDY.b $18,x
	CPY.w #$0003
	BCC.b CODE_1889FC
	LDA.w #$0003
	STA.b $18,x
	LDA.b $1D
	BIT.w #$4000
	BEQ.b CODE_1889FC
	LDX.w #$000F
	LDY.w #$FFF0
	JSR.w CODE_189263
	BCC.b CODE_1889FA
	JSR.w CODE_1892E0
	STZ.b $87
	LDA.w #$001C
	JSR.w CODE_189700
	INC.b $06,x
	LDA.w #$0008
	STA.b $24,x
CODE_1889F9:
	RTS

CODE_1889FA:
	LDY.b $18,x
CODE_1889FC:
	LDA.w #$001A
	CPY.w #$0002
	BCS.b CODE_188A07
	LDA.w #$0018
CODE_188A07:
	JMP.w CODE_189700

CODE_188A0A:
	DEC.b $24,x
	BNE.b CODE_188A10
	STZ.b $06,x
CODE_188A10:
	RTS

CODE_188A11:
	BPL.b CODE_188A21
	LDX.w #$0620
	LDA.w #$0009
	STA.b $18,x
	LDA.w #$003A
	JSR.w CODE_1896FC
CODE_188A21:
	LDX.w #$0620
	LDA.b $18,x
	CMP.w #$0003
	BCS.b CODE_188A31
	LDA.w #$0038
	JSR.w CODE_189700
CODE_188A31:
	DEC.b $18,x
	BNE.b CODE_188A3B
	LDA.w #$0006
	JMP.w CODE_188DD4

CODE_188A3B:
	RTS

CODE_188A3C:
	BPL.b CODE_188A4F
	LDX.w #$0620
	STZ.b $18,x
	LDA.w #$0014
	STA.w $1148
	LDA.w #$0022
	JMP.w CODE_1896FC

CODE_188A4F:
	LDX.w #$0620
	LDA.w $1148
	BNE.b CODE_188A66
	LDA.b $87
	BEQ.b CODE_188A69
	LDA.w #$0002
	JSR.w CODE_188DD4
	LDY.b $06,x
	JMP.w CODE_1883F4

CODE_188A66:
	DEC.w $1148
CODE_188A69:
	LDA.b $14,x
	STA.b $87
	JSR.w CODE_1883F4
	LDA.b $04,x
	CMP.w #$0006
	BEQ.b CODE_188A85
	LDA.b $14,x
	BEQ.b CODE_188A85
	EOR.w #$FFFF
	JSR.w CODE_188DC1
	LDA.b $87
	STA.b $14,x
CODE_188A85:
	RTS

CODE_188A86:
	LDX.w #$0620
	LDY.b $06,x
	BPL.b CODE_188A93
	LDA.w #$0026
	JMP.w CODE_189716

CODE_188A93:
	JMP.w CODE_189724

CODE_188A96:
	PHP
	REP.b #$30
	LDX.w #$0620
	LDA.b $00,x
	BPL.b CODE_188AC5
	LSR
	BCS.b CODE_188AC5
	LDA.b $0A,x
	SEC
	SBC.w #$0020
	TAY
	LDA.b $08,x
	TAX
	JSR.w CODE_188AC7
	LDA.b $0A,x
	SEC
	SBC.w #$0010
	TAY
	LDA.b $08,x
	TAX
	JSR.w CODE_188AC7
	LDY.b $0A,x
	LDA.b $08,x
	TAX
	JSR.w CODE_188AC7
CODE_188AC5:
	PLP
	RTS

CODE_188AC7:
	JSR.w CODE_18AE20
	BIT.w #$1000
	BEQ.b CODE_188B11
	LDA.w #$0000
	STA.l $7E2000,x
	LDA.w #$2202
	JSR.w CODE_18D832
	LDA.b $67
	AND.w #$03FF
	TAY
	CPY.w #$01C2
	BNE.b CODE_188AF6
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	CLC
	ADC.w #$0003
	STA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	LDA.w #$0004
	BRA.b CODE_188B0E

CODE_188AF6:
	LDA.w #$0002
	CPY.w #$01C4
	BEQ.b CODE_188B0E
	LDA.w #$0014
	CPY.w #$01C6
	BEQ.b CODE_188B0E
	LDA.w #$0004
	CPY.w #$01C8
	BNE.b CODE_188B11
CODE_188B0E:
	JSR.w CODE_18C121
CODE_188B11:
	LDX.w #$0620
	RTS

CODE_188B15:
	REP.b #$30
	LDA.w $10FE
	BEQ.b CODE_188B2D
	DEC.w $10FE
	LDA.w $10FE
	AND.w #$001F
	BNE.b CODE_188B2D
	LDA.w #$0802
	JSR.w CODE_18D832
CODE_188B2D:
	LDX.w #$0620
	LDA.b $62
	CLC
	ADC.b $10,x
	STA.b $62
	LDA.b $64
	CLC
	ADC.b $12,x
	STA.b $64
	LDA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BEQ.b CODE_188B65
	LDA.b $00
	AND.w #$0003
	TAY
	LDA.w $062C
	AND.w #$F1FF
	CPY.w #$0001
	BCS.b CODE_188B57
	ORA.w #$0200
CODE_188B57:
	STA.w $062C
	LDA.w $0620
	LSR
	BCS.b CODE_188B6E
	DEC.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BNE.b CODE_188B6E
CODE_188B65:
	LDA.w $062C
	AND.w #$F1FF
	STA.w $062C
CODE_188B6E:
	RTS

CODE_188B6F:
	LDX.w #$0620
	LDA.b $00,x
	BPL.b CODE_188BAB
	LSR
	BCS.b CODE_188BAB
	LDA.w $0CD6
	CMP.w #$0004
	BNE.b CODE_188BAC
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.w #$02F8
	BCS.b CODE_188B8E
	EOR.w #$FFFF
	INC
CODE_188B8E:
	CMP.w #$0005
	BCS.b CODE_188BAC
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$056F
	BCS.b CODE_188BA0
	EOR.w #$FFFF
	INC
CODE_188BA0:
	CMP.w #$0011
	BCS.b CODE_188BAC
CODE_188BA5:
	LDA.w #$FFFF
	STA.w !RAM_SXAR_Global_LevelClearFlags
CODE_188BAB:
	RTS

CODE_188BAC:
	LDA.b $0A,x
	CMP.w $0CBC
	BCC.b CODE_188BC8
	CMP.w #$FF80
	BCS.b CODE_188BC8
	BIT.w $0CD8
	BMI.b CODE_188BC8
	LDA.w $0CD6
	CMP.w #$0006
	BEQ.b CODE_188BA5
	JMP.w CODE_18AF79

CODE_188BC8:
	LDA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BNE.b CODE_188BAB
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	BEQ.b CODE_188BAB
	LDA.b $04,x
	CMP.w #$0000
	BNE.b CODE_188BAB
	JSR.w CODE_188E2D
	BCC.b CODE_188BAB
	LDA.b $58
	STA.w $1102
	LDA.b $5C
	STA.w $1104
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	STA.w $1106
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	STA.w $1108
	LDA.w $062C
	AND.w #$4000
	STA.w $110A
	RTS

CODE_188BFE:
	LDA.b $0A,x
	BRA.b CODE_188C07

CODE_188C02:
	LDA.b $0A,x
	CLC
	ADC.b $89
CODE_188C07:
	STA.b $27
	SEC
	SBC.w #$002F
	TAY
	LDA.b $00,x
	LSR
	BCS.b CODE_188C51
	LDA.b $08,x
	BIT.b $0C,x
	BVC.b CODE_188C1F
	SEC
	SBC.w #$000A
	BRA.b CODE_188C23

CODE_188C1F:
	CLC
	ADC.w #$000A
CODE_188C23:
	STA.b $25
	TAX
	JSR.w CODE_18AE20
	AND.w #$07FF
	CMP.w #$0008
	BNE.b CODE_188C51
	LDX.b $25
	LDY.b $27
	JSR.w CODE_18AE20
	AND.w #$07FF
	CMP.w #$0008
	BNE.b CODE_188C51
	LDY.w $0CD6
	CPY.w #$0008
	BEQ.b CODE_188C4D
	BIT.w $11FE
	BPL.b CODE_188C51
CODE_188C4D:
	LDX.b $3D
	SEC
	RTS

CODE_188C51:
	LDX.b $3D
	CLC
	RTS

CODE_188C55:
	LDA.w $0620
	LSR
	BCS.b CODE_188C74
	LDA.b $1D
	BIT.w #$8000
	BEQ.b CODE_188C74
	JSR.w CODE_188DDC
	BCS.b CODE_188C74
	LDA.w #$FB40
	STA.b $16,x
	LDA.w #$0004
	JSR.w CODE_188DD4
	SEC
	RTS

CODE_188C74:
	CLC
	RTS

CODE_188C76:
	STZ.b $8F
	STZ.b $91
	STZ.b $93
	STZ.b $95
	LDA.b $0A,x
	CLC
	ADC.b $89
	JSR.w CODE_18AC4B
	BCC.b CODE_188CD0
	LDX.b $3D
	STZ.b $16,x
	LDA.b $89
	BMI.b CODE_188CB8
	BEQ.b CODE_188CD0
	LDA.b $0A,x
	CLC
	ADC.b $89
	SEC
	SBC.w #$0008
	ORA.w #$0007
	STA.b $0A,x
	STZ.b $89
	CPX.w #$0620
	BNE.b CODE_188CD0
	SEC
	ROR.b $97
	LDA.w #$1602
	JSR.w CODE_18D832
	LDA.w #$0000
	JSR.w CODE_188DD4
	BRA.b CODE_188CD0

CODE_188CB8:
	LDA.b $0A,x
	CLC
	ADC.b $89
	SEC
	SBC.w #$002F
	AND.w #$FFF8
	CLC
	ADC.w #$0008
	CLC
	ADC.w #$002F
	STA.b $0A,x
	STZ.b $89
CODE_188CD0:
	LDX.b $3D
	LDA.b $0A,x
	CLC
	ADC.b $89
	STA.b $0A,x
	LDA.b $08,x
	CLC
	ADC.b $87
	CMP.w $0CB6
	BCC.b CODE_188CE5
	STZ.b $87
CODE_188CE5:
	JSR.w CODE_18AD03
	BCC.b CODE_188CEC
	STZ.b $87
CODE_188CEC:
	LDX.b $3D
	LDA.b $08,x
	CLC
	ADC.b $87
	STA.b $08,x
	LDA.b $87
	STA.b $10,x
	LDA.b $89
	STA.b $12,x
	JMP.w CODE_188DBF

CODE_188D00:
	JSR.w CODE_188E04
	ROR.b $97
	LDA.b $99
	AND.w #$8000
	ORA.b $97
	STA.b $97
	LDA.b $8B
	STA.b $9B
	LDA.b $8D
	STA.b $9D
	RTS

CODE_188D17:
	LDA.b $87
	STA.b $10,x
	CLC
	ADC.b $08,x
	STA.b $08,x
	LDA.b $89
	STA.b $12,x
	CLC
	ADC.b $0A,x
	STA.b $0A,x
	RTS

CODE_188D2A:
	CPX.w #$0620
	BNE.b CODE_188D3F
	LDA.b $16,x
	BPL.b CODE_188D3F
	LDA.b $0D
	BIT.w #$8000
	BEQ.b CODE_188D3F
	LDA.w #$0032
	BRA.b CODE_188D42

CODE_188D3F:
	LDA.w #$0052
CODE_188D42:
	STA.b $85
	LDA.b $16,x
	BMI.b CODE_188D5D
	CLC
	ADC.b $85
	CMP.w #$0700
	BCS.b CODE_188D52
CODE_188D50:
	STA.b $16,x
CODE_188D52:
	LDA.b $16,x
	BPL.b CODE_188D62
	XBA
	ORA.w #$FF00
	STA.b $89
	RTS

CODE_188D5D:
	CLC
	ADC.b $85
	BRA.b CODE_188D50

CODE_188D62:
	XBA
	AND.w #$00FF
	STA.b $89
	RTS

CODE_188D69:
	PHP
	REP.b #$30
	LDA.w $0620
	BPL.b CODE_188D74
	LSR
	BCC.b CODE_188D78
CODE_188D74:
	STZ.b $87
	PLP
	RTS

CODE_188D78:
	LDA.b $0D
	BIT.w #$0100
	BEQ.b CODE_188D87
	LDA.b $87
	CLC
	ADC.w #$0002
	STA.b $87
CODE_188D87:
	LDA.b $0D
	BIT.w #$0200
	BEQ.b CODE_188D96
	LDA.b $87
	SEC
	SBC.w #$0002
	STA.b $87
CODE_188D96:
	PLP
	RTS

CODE_188D98:
	PHP
	REP.b #$30
	LDA.b $0D
	BIT.w #$0400
	BEQ.b CODE_188DAA
	LDA.b $89
	CLC
	ADC.w #$0001
	STA.b $89
CODE_188DAA:
	LDA.b $0D
	BIT.w #$0800
	BEQ.b CODE_188DB9
	LDA.b $89
	SEC
	SBC.w #$0001
	STA.b $89
CODE_188DB9:
	PLP
	RTS

CODE_188DBB:
	LDA.b $87
	BRA.b CODE_188DC1

CODE_188DBF:
	LDA.b $10,x
CODE_188DC1:
	STA.b $25
	BEQ.b CODE_188DD3
	LDA.b $0C,x
	AND.w #$BFFF
	BIT.b $25
	BPL.b CODE_188DD1
	ORA.w #$4000
CODE_188DD1:
	STA.b $0C,x
CODE_188DD3:
	RTS

CODE_188DD4:
	STA.b $04,x
	LDA.w #$FFFF
	STA.b $06,x
	RTS

CODE_188DDC:
	LDA.b $0A,x
	SEC
	SBC.w #$002F
	AND.w #$FFF8
	SEC
	SBC.w #$0008
	TAY
	LDA.b $08,x
	TAX
	LDA.w #$0007
	JSR.w CODE_18AC97
	LDX.b $3D
	BIT.w #$8000
	BNE.b CODE_188DFC
	CLC
	RTS

CODE_188DFC:
	SEC
	RTS

CODE_188DFE:
	LDY.b $0A,x
	LDA.b $08,x
	BRA.b CODE_188E09

CODE_188E04:
	LDY.b $0A,x
	INY
	LDA.b $08,x
CODE_188E09:
	TAX
	LDA.w #$0007
	JSR.w CODE_18AC97
	LDX.b $3D
	BIT.w #$8000
	BNE.b CODE_188E2B
	LDY.w $0CD6
	CPY.w #$0008
	BEQ.b CODE_188E24
	BIT.w $11FE
	BPL.b CODE_188E29
CODE_188E24:
	BIT.w #$4000
	BNE.b CODE_188E2B
CODE_188E29:
	CLC
	RTS

CODE_188E2B:
	SEC
	RTS

CODE_188E2D:
	LDY.b $0A,x
	INY
	LDA.b $08,x
	CLC
	ADC.w #$0005
	TAX
	JSR.w CODE_18AE20
	BIT.w #$C000
	BEQ.b CODE_188E57
	LDX.b $3D
	LDY.b $0A,x
	INY
	LDA.b $08,x
	SEC
	SBC.w #$0005
	TAX
	JSR.w CODE_18AE20
	BIT.w #$C000
	BEQ.b CODE_188E57
	LDX.b $3D
	SEC
	RTS

CODE_188E57:
	LDX.b $3D
	CLC
	RTS

CODE_188E5B:
	PHP
	SEP.b #$30
	LDA.b #$80
	STA.w $2115
	REP.b #$20
	LDA.w #$0060
	STA.w $2116
	LDX.b #$02
CODE_188E6D:
	LDA.w #$FFFF
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	LDA.w #$FFFF
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	DEX
	BNE.b CODE_188E6D
	LDA.w #$0160
	STA.w $2116
	LDX.b #$02
CODE_188EAE:
	LDA.w #$FFFF
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	LDA.w #$FFFF
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	STA.w $2118
	DEX
	BNE.b CODE_188EAE
	PLP
	RTS

CODE_188EE9:
	PHP
	REP.b #$30
	BIT.w $0CD8
	BPL.b CODE_188EF7
	LDX.w $0CE6
	JSR.w (DATA_188EF9,x)
CODE_188EF7:
	PLP
	RTS

DATA_188EF9:
	dw CODE_188F1F
	dw CODE_188F1F
	dw CODE_188F01
	dw CODE_188F45

CODE_188F01:
	JSR.w CODE_188F20
	BCC.b CODE_188F1C
	LDA.w #$0006
	STA.w $0CE6
	LDX.w #$0620
	LDA.w #$FCE0
	STA.b $16,x
	LDA.w #$0010
	JSR.w CODE_188DD4
	BRA.b CODE_188F1F

CODE_188F1C:
	JMP.w CODE_188F69

CODE_188F1F:
	RTS

CODE_188F20:
	LDA.w $0CDE
	BIT.w $0CE8
	BPL.b CODE_188F2E
	SEC
	SBC.w #$0002
	BRA.b CODE_188F32

CODE_188F2E:
	CLC
	ADC.w #$0002
CODE_188F32:
	CMP.w #$0042
	BCC.b CODE_188F41
	LDA.w $0CE8
	EOR.w #$FFFF
	STA.w $0CE8
	RTS

CODE_188F41:
	STA.w $0CDE
	RTS

CODE_188F45:
	LDA.w $0CE0
	SEC
	SBC.w #$0004
	STA.w $0CE0
	BCC.b CODE_188F5F
	LDX.w #$0001
CODE_188F54:
	JSR.w CODE_188F20
	BCS.b CODE_188F54
	DEX
	BNE.b CODE_188F54
	JMP.w CODE_188F69

CODE_188F5F:
	STZ.w $0CD8
	LDA.w #$0000
	STA.w $0CE6
	RTS

CODE_188F69:
	PHP
	REP.b #$30
	LDA.w $0CDE
	CMP.w #$0022
	BCC.b CODE_188F80
	SEC
	SBC.w #$0022
	STA.b $25
	LDA.w #$001E
	SEC
	SBC.b $25
CODE_188F80:
	TAX
	CPX.w #$0020
	BNE.b CODE_188F8B
	LDA.w $0CE0
	BRA.b CODE_188FBD

CODE_188F8B:
	SEP.b #$20
	LDY.w $0CE0
	LDA.w DATA_19B058,x
	STA.w $4202
	STY.w $4203
	NOP #4
	LDA.w $4217
	STA.b $25
	STZ.b $26
	LDA.w DATA_19B058+$01,x
	STA.w $4202
	STY.w $4203
	NOP #4
	REP.b #$20
	LDA.w $4216
	CLC
	ADC.b $25
	XBA
	AND.w #$00FF
CODE_188FBD:
	CLC
	ADC.w $0CDC
	STA.w $0CE4
	SEP.b #$20
	LDA.w DATA_19B036,x
	STA.w $4202
	STY.w $4203
	NOP #4
	LDA.w $4217
	STA.b $25
	STZ.b $26
	LDA.w DATA_19B036+$01,x
	STA.w $4202
	STY.w $4203
	NOP #4
	REP.b #$20
	LDA.w $4216
	CLC
	ADC.b $25
	XBA
	AND.w #$00FF
	STA.w $0CE2
	LDX.w $0CDE
	CPX.w #$0022
	BCS.b CODE_189007
	LDA.w $0CDA
	SEC
	SBC.w $0CE2
	BRA.b CODE_18900B

CODE_189007:
	CLC
	ADC.w $0CDA
CODE_18900B:
	STA.w $0CE2
	PLP
	RTS

CODE_189010:
	PHP
	REP.b #$30
	LDY.w #$0000
CODE_189016:
	STY.b $3B
	LDX.w DATA_198CB5,y
	LDA.b $00,x
	BMI.b CODE_189022
	JMP.w CODE_1890B0

CODE_189022:
	STX.b $3D
	LDY.b $06,x
	LDA.w DATA_198980,y
	STA.b $25
	JSR.w CODE_189B8F
	LDA.b $00,x
	BPL.b CODE_1890AE
	BIT.w $1208
	BPL.b CODE_18905E
	PHX
	LDA.b $04,x
	SEC
	SBC.w $120C
	SEC
	SBC.w #$0004
	TAY
	LDA.b $02,x
	SEC
	SBC.w $120A
	TAX
	JSR.w CODE_18ADD2
	BIT.w #$8000
	BEQ.b CODE_18905D
	PLX
	STZ.b $00,x
	LDA.w #$2102
	JSR.w CODE_18D832
	BRA.b CODE_1890AE

CODE_18905D:
	PLX
CODE_18905E:
	PHX
	LDA.b $0C,x
	CMP.w #$008C
	BCS.b CODE_1890AA
	LDA.b $04,x
	SEC
	SBC.w #$0004
	TAY
	LDA.b $02,x
	TAX
	JSR.w CODE_18AE20
	BIT.w #$8000
	BEQ.b CODE_1890AA
	BIT.w #$0800
	BEQ.b CODE_18909F
	LDA.w #$0000
	STA.l $7E2000,x
	PLX
	PHX
	LDA.b $04,x
	ORA.w #$000F
	CLC
	ADC.w #$0008
	TAY
	LDA.b $02,x
	AND.w #$FFF0
	ORA.w #$0007
	TAX
	LDA.w #$0000
	JSR.w CODE_18B0C8
CODE_18909F:
	PLX
	STZ.b $00,x
	LDA.w #$2102
	JSR.w CODE_18D832
	BRA.b CODE_1890AE

CODE_1890AA:
	PLX
	JSR.w CODE_1890C0
CODE_1890AE:
	LDY.b $3B
CODE_1890B0:
	TYA
	CLC
	ADC.w #$0002
	TAY
	CPY.w #$0010
	BCS.b CODE_1890BE
	JMP.w CODE_189016

CODE_1890BE:
	PLP
	RTS

CODE_1890C0:
	LDA.b $0E,x
	ASL
	ASL
	TAY
	LDA.w DATA_199623+$04,y
	STA.b $29
	LDA.w DATA_199623+$06,y
	STA.b $2D
	LDA.w DATA_199623,y
	BIT.b $10,x
	BVC.b CODE_1890DA
	EOR.w #$FFFF
	INC
CODE_1890DA:
	CLC
	ADC.b $02,x
	STA.b $25
	LDA.w DATA_199623,y
	LDA.b $04,x
	CLC
	ADC.w DATA_199623+$02,y
	STA.b $27
	LDX.w #$085C
CODE_1890ED:
	LDA.b $00,x
	BPL.b CODE_18914E
	LSR
	BCS.b CODE_18914E
	BIT.w #$0400
	BEQ.b CODE_18910C
	LDA.b $08,x
	SEC
	SBC.b $58
	BCS.b CODE_189107
	CMP.w #$FFE0
	BCC.b CODE_18914E
	BRA.b CODE_18910C

CODE_189107:
	CMP.w #$0120
	BCS.b CODE_18914E
CODE_18910C:
	LDA.b $29
	CLC
	ADC.b $1E,x
	STA.b $2B
	LDA.b $0E,x
	BEQ.b CODE_18914E
	ASL
	ASL
	TAY
	LDA.w DATA_199623,y
	BIT.b $0C,x
	BVC.b CODE_189125
	EOR.w #$FFFF
	INC
CODE_189125:
	CLC
	ADC.b $08,x
	SEC
	SBC.b $25
	BCS.b CODE_189131
	EOR.w #$FFFF
	INC
CODE_189131:
	CMP.b $2B
	BCS.b CODE_18914E
	LDA.w DATA_199623+$02,y
	CLC
	ADC.b $0A,x
	SEC
	SBC.b $27
	BCS.b CODE_18914A
	EOR.w #$FFFF
	INC
	CMP.b $2D
	BCS.b CODE_18914E
	BRA.b CODE_18915A

CODE_18914A:
	CMP.b $20,x
	BCC.b CODE_18915A
CODE_18914E:
	TXA
	SEC
	SBC.w #$0034
	TAX
	CPX.w #$0620
	BNE.b CODE_1890ED
	RTS

CODE_18915A:
	PHX
	LDX.b $3D
	STZ.b $00,x
	PLX
	LDY.b $04,x
	LDA.w DATA_198882,y
	STA.b $25
	JMP.w ($0025)

CODE_18916A:
	LDA.w #$1102
	JSR.w CODE_18D832
	RTS

CODE_189171:
	LDA.b $02,x
	CLC
	ADC.b $08,x
	STA.b $02,x
	LDA.b $04,x
	CLC
	ADC.b $0A,x
	STA.b $04,x
	INC.b $0C,x
	LDY.b $0C,x
	LDA.w #$0005
	CPY.w #$0003
	BCC.b CODE_189196
	LDA.w #$0004
	CPY.w #$0008
	BCC.b CODE_189196
	LDA.w #$0003
CODE_189196:
	BIT.b $08,x
	BPL.b CODE_18919E
	EOR.w #$FFFF
	INC
CODE_18919E:
	STA.b $08,x
	LDA.b $02,x
	CLC
	ADC.b $08,x
	STA.b $02,x
	LDA.b $04,x
	CLC
	ADC.b $0A,x
	STA.b $04,x
	LDA.w #$003E
	CPY.w #$0003
	BCC.b CODE_1891C1
	LDA.w #$0040
	CPY.w #$000A
	BCC.b CODE_1891C1
	LDA.w #$0042
CODE_1891C1:
	STA.b $0E,x
	LDA.b $00
	AND.w #$0001
	BNE.b CODE_1891D1
	LDA.b $10,x
	EOR.w #$8000
	STA.b $10,x
CODE_1891D1:
	CPY.w #$0028
	BCC.b CODE_1891D8
CODE_1891D6:
	STZ.b $00,x
CODE_1891D8:
	RTS

CODE_1891D9:
	LDA.w #$0F02
	JSR.w CODE_18D832
	LDA.w #$00AA
	STA.b $0E,x
	LDA.w #$000A
	STA.b $08,x
	LDA.w #$0096
	STA.b $0C,x
	RTS

CODE_1891EF:
	DEC.b $0C,x
	BEQ.b CODE_1891D6
	LDA.b $02,x
	CLC
	ADC.b $08,x
	STA.b $02,x
	RTS

CODE_1891FB:
	LDA.w #$1102
	JSR.w CODE_18D832
	LDA.w #$00AC
	STA.b $0E,x
	LDA.w #$0004
	STA.b $08,x
	LDA.w #$0096
	STA.b $0C,x
	LDA.w #$FD80
	STA.b $0A,x
	RTS

CODE_189216:
	DEC.b $0C,x
	BEQ.b CODE_1891D6
	LDA.b $39
	AND.w #$0006
	CLC
	ADC.w #$00AC
	STA.b $0E,x
	JSR.w CODE_1895C2
	CLC
	ADC.b $04,x
	STA.b $04,x
	LDA.b $02,x
	CLC
	ADC.b $08,x
	STA.b $02,x
	RTS

CODE_189235:
	LDA.w #$1102
	JSR.w CODE_18D832
	LDA.w #$00B4
	STA.b $0E,x
	LDA.w #$0005
	STA.b $08,x
	LDA.w #$0096
	STA.b $0C,x
	RTS

CODE_18924B:
	DEC.b $0C,x
	BEQ.b CODE_1891D6
	LDA.b $39
	LSR
	AND.w #$0006
	CLC
	ADC.w #$00B4
	STA.b $0E,x
	LDA.b $02,x
	CLC
	ADC.b $08,x
	STA.b $02,x
	RTS

CODE_189263:
	LDA.w #$0000
CODE_189266:
	STA.b $29
	STX.b $25
	STY.b $27
	LDX.w #$0890
	LDY.w #$0004
	CMP.w #$0000
	BEQ.b CODE_18927F
	LDX.w #$08D8
	LDY.w #$0004
	BRA.b CODE_189285

CODE_18927F:
	LDA.w $0620
	LSR
	BCS.b CODE_189292
CODE_189285:
	LDA.b $00,x
	BPL.b CODE_189296
	TXA
	CLC
	ADC.w #$0012
	TAX
	DEY
	BNE.b CODE_189285
CODE_189292:
	CLC
	LDX.b $3D
	RTS

CODE_189296:
	JSR.w CODE_1892C5
	LDY.b $29
	STY.b $06,x
	LDA.w DATA_198978,y
	STA.b $29
	JSR.w CODE_1892C2
	TXY
	LDX.b $3D
	LDA.b $25
	BIT.b $0C,x
	BVC.b CODE_1892B2
	EOR.w #$FFFF
	INC
CODE_1892B2:
	CLC
	ADC.b $08,x
	STA.w $0002,y
	LDA.b $0A,x
	CLC
	ADC.b $27
	STA.w $0004,y
	SEC
	RTS

CODE_1892C2:
	JMP.w ($0029)

CODE_1892C5:
	LDA.w #$8000
	STA.b $00,x
	LDA.w #$003E
	STA.b $0E,x
	LDA.w #$0004
	STA.b $08,x
	STZ.b $0A,x
	STZ.b $06,x
	STZ.b $0C,x
	LDA.w #$2000
	STA.b $10,x
	RTS

CODE_1892E0:
	LDA.b $0C,x
CODE_1892E2:
	BIT.w #$4000
	BEQ.b CODE_1892FA
	LDA.w $0010,y
	ORA.w #$4000
	STA.w $0010,y
	LDA.w $0008,y
	EOR.w #$FFFF
	INC
	STA.w $0008,y
CODE_1892FA:
	RTS

CODE_1892FB:
	PHP
	REP.b #$30
	LDY.w #$0000
CODE_189301:
	STY.b $3B
	LDX.w DATA_198CC5,y
	LDA.b $12,x
	BPL.b CODE_189331
	STX.b $3D
	LDY.b $18,x
	LDA.w DATA_198944,y
	STA.b $25
	JSR.w CODE_189B8F
	LDX.b $3D
	LDA.b $12,x
	BPL.b CODE_18932F
	LDA.w $0620
	LSR
	BCS.b CODE_18932F
	LDA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BNE.b CODE_18932F
	JSR.w CODE_18B007
	BCC.b CODE_18932F
	JSR.w CODE_18AA5C
CODE_18932F:
	LDY.b $3B
CODE_189331:
	TYA
	CLC
	ADC.w #$0002
	TAY
	CPY.w #$0010
	BCC.b CODE_189301
	PLP
	RTS

CODE_18933E:
	LDA.w #$00BC
	STA.b $22,x
	LDA.w #$0502
	JSR.w CODE_18D832
	LDA.w #$0003
	BRA.b CODE_18935C

CODE_18934E:
	LDA.w #$0088
	STA.b $22,x
	LDA.w #$0502
	JSR.w CODE_18D832
CODE_189359:
	LDA.w #$0004
CODE_18935C:
	STA.b $1A,x
	LDA.w #$004B
	STA.b $1E,x
	RTS

CODE_189364:
	LDA.w #$0054
	STA.b $22,x
	STZ.b $1E,x
	LDA.w #$0300
	STA.b $1C,x
	RTS

CODE_189371:
	LDA.w #$0054
	STA.b $22,x
	LDA.w #$000A
	STA.b $1E,x
	LDA.w #$0003
	STA.b $1A,x
	RTS

CODE_189381:
	LDA.w #$0003
	STA.b $1C,x
	LDA.w #$0046
	STA.b $22,x
	RTS

CODE_18938C:
	LDA.w #$0078
	STA.b $22,x
	LDA.w #$0005
	STA.b $1A,x
	STZ.b $1E,x
	LDA.w #$0702
	JSR.w CODE_18D832
	RTS

CODE_18939F:
	LDA.w #$0702
	JSR.w CODE_18D832
	LDA.w #$0080
	BRA.b CODE_1893AD

CODE_1893AA:
	LDA.w #$0046
CODE_1893AD:
	STA.b $22,x
	JMP.w CODE_1895FA

CODE_1893B2:
	LDA.w #$0000
	STA.b $1C,x
	BRA.b CODE_1893BE

CODE_1893B9:
	LDA.w #$FB00
	STA.b $1C,x
CODE_1893BE:
	LDA.w #$1D02
	JSR.w CODE_18D832
	LDA.w #$0098
	STA.b $22,x
	LDA.w #$0004
	STA.b $1A,x
	LDA.w #$0064
	STA.b $1E,x
	RTS

CODE_1893D4:
	LDA.w #$008E
	STA.b $22,x
	LDA.w #$0014
	STA.b $1E,x
	RTS

CODE_1893DF:
	JSR.w CODE_1895EC
	BEQ.b CODE_1893EC
	LDA.w #$1602
	JSR.w CODE_18D832
	BRA.b CODE_1893FE

CODE_1893EC:
	LDA.b $14,x
	CLC
	ADC.b $1A,x
	STA.b $14,x
	LDA.b $16,x
	CLC
	ADC.b $1C,x
	STA.b $16,x
	DEC.b $1E,x
	BNE.b CODE_189400
CODE_1893FE:
	STZ.b $12,x
CODE_189400:
	RTS

CODE_189401:
	INC.b $1E,x
	LDA.b $1E,x
	CMP.w #$0078
	BCS.b CODE_1893FE
	LDA.b $1C,x
	CLC
	ADC.w #$0030
	STA.b $1C,x
	CMP.w #$0800
	BCC.b CODE_18941A
	LDA.w #$07FF
CODE_18941A:
	XBA
	AND.w #$00FF
	CLC
	ADC.b $16,x
	STA.b $16,x
	LDA.b $1E,x
	CMP.w #$000A
	BCC.b CODE_18945D
	JSR.w CODE_1895EC
	BIT.w #$C000
	BEQ.b CODE_18945D
	LDA.w #$2102
	JSR.w CODE_18D832
	LDY.w #$0016
	STY.b $18,x
	LDA.w DATA_19892A,y
	STA.b $25
	JSR.w CODE_189B8F
	LDY.b $16,x
	LDA.b $14,x
	TAX
	LDA.w #$0002
	JSR.w CODE_18B0C8
	LDX.b $3D
	LDA.b $16,x
	SEC
	SBC.w #$0008
	ORA.w #$0007
	STA.b $16,x
CODE_18945D:
	RTS

CODE_18945E:
	INC.b $1E,x
	LDA.b $1E,x
	CMP.w #$0078
	BCS.b CODE_1893FE
	LDA.b $1A,x
	CLC
	ADC.b $14,x
	STA.b $14,x
	LDA.b $1E,x
	CMP.w #$000A
	BCC.b CODE_18945D
	JSR.w CODE_1895EC
	BEQ.b CODE_18945D
	JMP.w CODE_189551

CODE_18947D:
	JSR.w CODE_1895EC
	BEQ.b CODE_189495
	LDA.w #$2602
	JSR.w CODE_18D832
	STZ.b $12,x
	LDY.b $16,x
	LDA.b $14,x
	TAX
	LDA.w #$0000
	JMP.w CODE_18B0C8

CODE_189495:
	LDA.b $14,x
	CLC
	ADC.b $1A,x
	STA.b $14,x
	LDA.b $16,x
	CLC
	ADC.b $1C,x
	STA.b $16,x
	DEC.b $1E,x
	BNE.b CODE_1894A9
	STZ.b $12,x
CODE_1894A9:
	RTS

CODE_1894AA:
	LDA.b $24,x
	EOR.w #$8000
	STA.b $24,x
	LDA.b $1E,x
	CMP.w #$000C
	BCS.b CODE_1894C4
	LSR
	LSR
	ASL
	CLC
	ADC.w #$0078
	STA.b $22,x
	INC.b $1E,x
	RTS

CODE_1894C4:
	INC.b $1E,x
	LDA.b $1E,x
	CMP.w #$0032
	BCC.b CODE_1894D0
CODE_1894CD:
	STZ.b $12,x
	RTS

CODE_1894D0:
	PHX
	LDY.b $16,x
	LDA.b $14,x
	BIT.b $24,x
	BVC.b CODE_1894DF
	SEC
	SBC.w #$0010
	BRA.b CODE_1894E3

CODE_1894DF:
	CLC
	ADC.w #$0010
CODE_1894E3:
	TAX
	JSR.w CODE_18AE20
	PLX
	BIT.w #$8000
	BNE.b CODE_1894CD
	LDA.b $1A,x
	CLC
	ADC.b $14,x
	STA.b $14,x
	RTS

CODE_1894F5:
	LDA.w #$0003
	BRA.b CODE_189504

CODE_1894FA:
	LDA.b $24,x
	EOR.w #$0200
	STA.b $24,x
	LDA.w #$0004
CODE_189504:
	STA.b $2B
CODE_189506:
	JSR.w CODE_189512
	BIT.b $12,x
	BPL.b CODE_189511
	DEC.b $2B
	BNE.b CODE_189506
CODE_189511:
	RTS

CODE_189512:
	DEC.b $1E,x
	BNE.b CODE_189519
CODE_189516:
	STZ.b $12,x
	RTS

CODE_189519:
	JSR.w CODE_1895EC
	BNE.b CODE_189516
	LDA.b $1A,x
	BIT.b $26,x
	BPL.b CODE_18952B
	CLC
	ADC.b $16,x
	STA.b $16,x
	BRA.b CODE_189530

CODE_18952B:
	CLC
	ADC.b $14,x
	STA.b $14,x
CODE_189530:
	LDA.b $20,x
	SEC
	SBC.b $2A,x
	BCS.b CODE_18954E
	CLC
	ADC.b $28,x
	STA.b $20,x
	LDA.b $1C,x
	BIT.b $26,x
	BMI.b CODE_189548
	CLC
	ADC.b $16,x
	STA.b $16,x
	RTS

CODE_189548:
	CLC
	ADC.b $14,x
	STA.b $14,x
	RTS

CODE_18954E:
	STA.b $20,x
	RTS

CODE_189551:
	LDA.w #$0702
	JSR.w CODE_18D832
	STZ.b $12,x
	LDA.b $16,x
	CLC
	ADC.w #$0008
	TAY
	LDA.b $14,x
	TAX
	LDA.w #$0006
	JMP.w CODE_18B0C8

CODE_189569:
	DEC.b $1E,x
	BEQ.b CODE_189582
	JSR.w CODE_1895EC
	BNE.b CODE_189582
	JSR.w CODE_189598
	CLC
	ADC.b $16,x
	STA.b $16,x
	LDA.b $1A,x
	CLC
	ADC.b $14,x
	STA.b $14,x
	RTS

CODE_189582:
	LDA.w #$2102
	JSR.w CODE_18D832
	JMP.w CODE_189551

CODE_18958B:
	DEC.b $1E,x
	BNE.b CODE_189597
	LDA.w #$2102
	JSR.w CODE_18D832
	STZ.b $12,x
CODE_189597:
	RTS

CODE_189598:
	LDA.w #$0032
	STA.b $85
	LDA.b $1C,x
	BMI.b CODE_1895B6
	CLC
	ADC.b $85
	CMP.w #$0700
	BCS.b CODE_1895AB
CODE_1895A9:
	STA.b $1C,x
CODE_1895AB:
	LDA.b $1C,x
	BPL.b CODE_1895BB
	XBA
	ORA.w #$FF00
	STA.b $89
	RTS

CODE_1895B6:
	CLC
	ADC.b $85
	BRA.b CODE_1895A9

CODE_1895BB:
	XBA
	AND.w #$00FF
	STA.b $89
	RTS

CODE_1895C2:
	LDA.w #$0032
	STA.b $85
	LDA.b $0A,x
	BMI.b CODE_1895E0
	CLC
	ADC.b $85
	CMP.w #$0700
	BCS.b CODE_1895D5
CODE_1895D3:
	STA.b $0A,x
CODE_1895D5:
	LDA.b $0A,x
	BPL.b CODE_1895E5
	XBA
	ORA.w #$FF00
	STA.b $89
	RTS

CODE_1895E0:
	CLC
	ADC.b $85
	BRA.b CODE_1895D3

CODE_1895E5:
	XBA
	AND.w #$00FF
	STA.b $89
	RTS

CODE_1895EC:
	PHX
	LDY.b $16,x
	LDA.b $14,x
	TAX
	JSR.w CODE_18AE20
	PLX
	BIT.w #$8000
	RTS

CODE_1895FA:
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$0014
	STA.b $25
	LDY.w #$0001
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.b $14,x
	BPL.b CODE_189615
	EOR.w #$FFFF
	INC
	LDY.w #$FFFF
CODE_189615:
	STA.b $28,x
	TYA
	STA.b $1A,x
	LDY.w #$0001
	LDA.b $25
	SEC
	SBC.b $16,x
	BPL.b CODE_18962B
	EOR.w #$FFFF
	INC
	LDY.w #$FFFF
CODE_18962B:
	STA.b $2A,x
	TYA
	STA.b $1C,x
	LDA.b $28,x
	CMP.b $2A,x
	LDA.w #$0000
	BCS.b CODE_18964C
	LDY.b $28,x
	LDA.b $2A,x
	STY.b $2A,x
	STA.b $28,x
	LDY.b $1A,x
	LDA.b $1C,x
	STY.b $1C,x
	STA.b $1A,x
	LDA.w #$8000
CODE_18964C:
	STA.b $26,x
	LDA.w #$00B4
	STA.b $1E,x
	LDA.b $28,x
	STA.b $20,x
	RTS

CODE_189658:
	STA.b $25
	STX.b $27
	STY.b $29
	LDY.w #$0008
	LDX.w #$0920
CODE_189664:
	LDA.b $12,x
	BPL.b CODE_189675
	TXA
	CLC
	ADC.w #$002C
	TAX
	DEY
	BNE.b CODE_189664
	CLC
	LDX.b $3D
	RTS

CODE_189675:
	JSR.w CODE_1896C6
	LDY.b $25
	STY.b $18,x
	TXY
	LDX.b $3D
	LDA.b $04,x
	CMP.w #$0010
	BEQ.b CODE_18968B
	CMP.w #$000A
	BNE.b CODE_189693
CODE_18968B:
	LDA.b $27
	EOR.w #$FFFF
	INC
	STA.b $27
CODE_189693:
	LDA.b $27
	BIT.b $0C,x
	BVC.b CODE_18969D
	EOR.w #$FFFF
	INC
CODE_18969D:
	CLC
	ADC.b $08,x
	STA.w $0014,y
	LDA.b $0A,x
	CLC
	ADC.b $29
	STA.w $0016,y
	LDA.b $0C,x
	AND.w #$7000
	ORA.w $0024,y
	STA.w $0024,y
	TYX
	LDY.b $18,x
	LDA.w DATA_19892A,y
	STA.b $25
	JSR.w CODE_189B8F
	TXY
	LDX.b $3D
	SEC
	RTS

CODE_1896C6:
	LDA.w #$8000
	STA.b $12,x
	LDA.w #$0044
	STA.b $22,x
	STZ.b $1A,x
	STZ.b $1C,x
	STZ.b $18,x
	LDA.w #$008C
	STA.b $1E,x
	LDA.w #$2000
	STA.b $24,x
	RTS

CODE_1896E1:
	LDA.b $0C,x
	BIT.w #$4000
	BEQ.b CODE_1896FB
	LDA.w $0024,y
	ORA.w #$4000
	STA.w $0024,y
	LDA.w $001A,y
	EOR.w #$FFFF
	INC
	STA.w $001A,y
CODE_1896FB:
	RTS

CODE_1896FC:
	LDX.b $3D
	STZ.b $06,x
CODE_189700:
	STA.b $0E,x
	STZ.b $26,x
	STZ.b $22,x
CODE_189706:
	PHY
	ASL
	ASL
	TAY
	LDA.w DATA_199623+$04,y
	STA.b $1E,x
	LDA.w DATA_199623+$06,y
	STA.b $20,x
	PLY
	RTS

CODE_189716:
	LDX.b $3D
	STZ.b $06,x
CODE_18971A:
	STA.b $26,x
	TAY
	LDA.w DATA_1991C5,y
	STA.b $22,x
	STZ.b $24,x
CODE_189724:
	LDA.b $22,x
	BEQ.b CODE_189787
	LDA.b $24,x
	BNE.b CODE_189785
	LDA.b $00,x
	BIT.w #$0800
	BEQ.b CODE_18974D
	LDA.w $120E
	BEQ.b CODE_18974D
CODE_189738:
	DEC.w $120E
	LDA.b $10,x
	CLC
	ADC.b $08,x
	STA.b $08,x
	LDA.b $12,x
	CLC
	ADC.b $0A,x
	STA.b $0A,x
	JSR.w CODE_189823
	RTS

CODE_18974D:
	LDA.b $22,x
	STA.b $25
	LDY.w #$0002
	LDA.b ($25)
	BMI.b CODE_18976B
	STA.b $24,x
	LDA.b ($25),y
	STA.b $0E,x
	JSR.w CODE_189706
	INY
	INY
	TYA
	CLC
	ADC.b $25
	STA.b $22,x
	BRA.b CODE_189785

CODE_18976B:
	CMP.w #$8001
	BEQ.b CODE_189789
	ASL
	TAY
	LDA.w DATA_198990,y
	STA.b $27
	LDY.w #$0002
	JSR.w CODE_18980A
	TYA
	CLC
	ADC.b $22,x
	STA.b $22,x
	BRA.b CODE_189724

CODE_189785:
	DEC.b $24,x
CODE_189787:
	CLC
	RTS

CODE_189789:
	SEC
	RTS

CODE_18978B:
	LDA.b ($25),y
	STA.b $22,x
	LDY.w #$0000
	RTS

CODE_189793:
	LDA.b ($25),y
	PHA
	INY
	INY
	LDA.b ($25),y
	TAX
	INY
	INY
	LDA.b ($25),y
	TAY
	PLA
	JSR.w CODE_189658
	BCC.b CODE_1897B6
	LDA.w $0018,y
	CMP.w #$000A
	BEQ.b CODE_1897B6
	CMP.w #$000C
	BEQ.b CODE_1897B6
	JSR.w CODE_1896E1
CODE_1897B6:
	LDY.w #$0008
	RTS

CODE_1897BA:
	LDA.b ($25),y
	PHA
	INY
	INY
	LDA.b ($25),y
	TAX
	INY
	INY
	LDA.b ($25),y
	TAY
	PLA
	JSR.w CODE_189895
	LDY.w #$0008
	RTS

CODE_1897CF:
	LDA.b ($25),y
	PHA
	INY
	INY
	LDA.b ($25),y
	TAX
	INY
	INY
	LDA.b ($25),y
	TAY
	PLA
	JSR.w CODE_189266
	BCC.b CODE_1897E5
	JSR.w CODE_1892E0
CODE_1897E5:
	LDY.w #$0008
	RTS

CODE_1897E9:
	PHX
	LDA.b ($25),y
	PHA
	INY
	INY
	LDA.b ($25),y
	STA.b $27
	INY
	INY
	LDA.b ($25),y
	CLC
	ADC.b $0A,x
	TAY
	LDA.b $27
	CLC
	ADC.b $08,x
	TAX
	PLA
	JSR.w CODE_18B0C8
	PLX
	LDY.w #$0008
	RTS

CODE_18980A:
	JMP.w ($0027)

CODE_18980D:
	LDA.b ($25),y
	STA.w $120E
	INY
	INY
	LDA.b ($25),y
	STA.b $10,x
	INY
	INY
	LDA.b ($25),y
	STA.b $12,x
	INY
	INY
	JMP.w CODE_189738

CODE_189823:
	PHY
	LDA.b $10,x
	BEQ.b CODE_18985B
	LDA.b $39
	AND.w #$0001
	BNE.b CODE_18985B
	BIT.b $0C,x
	BVC.b CODE_189839
	BIT.b $10,x
	BPL.b CODE_18985D
	BRA.b CODE_18983D

CODE_189839:
	BIT.b $10,x
	BMI.b CODE_18985D
CODE_18983D:
	LDY.w $049C
	LDA.w $049A
	STA.w $049C
	LDA.w $0498
	STA.w $049A
	LDA.w $0496
	STA.w $0498
	LDA.w $0494
	STA.w $0496
	STY.w $0494
CODE_18985B:
	PLY
	RTS

CODE_18985D:
	LDY.w $0494
	LDA.w $0496
	STA.w $0494
	LDA.w $0498
	STA.w $0496
	LDA.w $049A
	STA.w $0498
	LDA.w $049C
	STA.w $049A
	STY.w $049C
	PLY
	RTS

CODE_18987D:
	LDA.b $87
	ORA.b $89
	BNE.b CODE_189888
	LDA.w #$0002
	BRA.b CODE_18988F

CODE_189888:
	LDA.w #$0004
CODE_18988B:
	CMP.b $26,x
	BEQ.b CODE_189892
CODE_18988F:
	JSR.w CODE_18971A
CODE_189892:
	JMP.w CODE_189724

CODE_189895:
	STX.b $6F
	STY.b $71
	JSR.w CODE_189A5E
	BCC.b CODE_1898BF
	LDX.b $3D
	LDA.b $0C,x
	STA.w $000C,y
	LDA.b $71
	CLC
	ADC.b $0A,x
	STA.w $000A,y
	LDA.b $6F
	BIT.b $0C,x
	BVC.b CODE_1898B7
	EOR.w #$FFFF
	INC
CODE_1898B7:
	CLC
	ADC.b $08,x
	STA.w $0008,y
	SEC
	RTS

CODE_1898BF:
	LDX.b $3D
	RTS

CODE_1898C2:
	TAY
	LDA.w DATA_1991C5,y
	STA.b $3E,x
	STZ.b $40,x
CODE_1898CA:
	LDA.b $3E,x
	BEQ.b CODE_18990B
	LDA.b $40,x
	BNE.b CODE_189909
	LDA.b $3E,x
	STA.b $25
	LDY.w #$0002
	LDA.b ($25)
	BMI.b CODE_1898ED
	STA.b $40,x
	LDA.b ($25),y
	STA.b $3A,x
	LDA.b $25
	CLC
	ADC.w #$0004
	STA.b $3E,x
	BRA.b CODE_189909

CODE_1898ED:
	CMP.w #$8001
	BEQ.b CODE_189907
	ASL
	TAY
	LDA.w DATA_19899E,y
	STA.b $27
	LDY.w #$0002
	JSR.w CODE_18980A
	TYA
	CLC
	ADC.b $3E,x
	STA.b $3E,x
	BRA.b CODE_1898CA

CODE_189907:
	SEC
	RTS

CODE_189909:
	DEC.b $40,x
CODE_18990B:
	CLC
	RTS

CODE_18990D:
	LDA.b ($25),y
	STA.b $3E,x
	LDY.w #$0000
	RTS

CODE_189915:
	LDA.b $0C,x
	AND.w #$3FFF
	ORA.b ($25),y
	STA.b $0C,x
	INY
	INY
	RTS

CODE_189921:
	PHP
	REP.b #$30
	STZ.w $10EE
	LDX.w $0CD6
	LDA.w DATA_198000,x
	STA.b $25
	LDY.w #$0000
	TYX
CODE_189933:
	LDA.b ($25),y
	STA.w $0D6E,x
	CMP.w #$DDDD
	BEQ.b CODE_18996D
	INY
	INY
	LDA.b ($25),y
	STA.w $0DEE,x
	INY
	INY
	LDA.b ($25),y
	STA.w $0E6E,x
	INY
	INY
	LDA.b ($25),y
	STA.w $0EEE,x
	INY
	INY
	LDA.b ($25),y
	STA.w $0F6E,x
	INY
	INY
	LDA.b ($25),y
	STA.w $0FEE,x
	INY
	INY
	LDA.b ($25),y
	STA.w $106E,x
	INY
	INY
	INX
	INX
	BRA.b CODE_189933

CODE_18996D:
	LDX.w #$007E
CODE_189970:
	LDA.w $0CEE,x
	BIT.w #$0002
	BNE.b CODE_18997B
	STZ.w $0CEE,x
CODE_18997B:
	DEX
	DEX
	BPL.b CODE_189970
	PLP
	RTS

CODE_189981:
	PHP
	SEC
	BRA.b CODE_189987

CODE_189985:
	PHP
	CLC
CODE_189987:
	REP.b #$30
	ROR.b $27
	LDA.b $58
	CLC
	ADC.w #$01A0
	STA.b $29
	LDA.b $5C
	CLC
	ADC.w #$01A0
	STA.b $2B
	LDA.w #$000A
	STA.b $2D
CODE_1899A0:
	LDX.w $10EE
	LDA.w $0D6E,x
	CMP.w #$DDDD
	BNE.b CODE_1899B4
	STZ.w $10EE
	BIT.b $27
	BMI.b CODE_1899EF
	BRA.b CODE_1899A0

CODE_1899B4:
	BIT.w $0CEE,x
	BMI.b CODE_1899DD
	CLC
	ADC.w #$0050
	CMP.b $58
	BCC.b CODE_1899D4
	CMP.b $29
	BCS.b CODE_1899D4
	LDA.w $0DEE,x
	CLC
	ADC.w #$0050
	CMP.b $5C
	BCC.b CODE_1899D4
	CMP.b $2B
	BCC.b CODE_1899F1
CODE_1899D4:
	LDA.w $0CEE,x
	AND.w #$FFFE
	STA.w $0CEE,x
CODE_1899DD:
	LDA.w $10EE
	CLC
	ADC.w #$0002
	STA.w $10EE
	DEC.b $2D
	BNE.b CODE_1899A0
	BIT.b $27
	BMI.b CODE_1899A0
CODE_1899EF:
	PLP
	RTS

CODE_1899F1:
	LDA.w $0E6E,x
	BIT.w #$0010
	BNE.b CODE_189A01
	LDA.w $0CEE,x
	BIT.w #$0001
	BNE.b CODE_1899DD
CODE_189A01:
	LDY.w #$0016
CODE_189A04:
	STY.b $3B
	LDX.w DATA_198C9D,y
	LDA.b $00,x
	BPL.b CODE_189A13
	DEY
	DEY
	BNE.b CODE_189A04
	BRA.b CODE_1899DD

CODE_189A13:
	JSR.w CODE_18B201
	LDY.w $10EE
	LDA.w $0CEE,y
	ORA.w #$8001
	STA.w $0CEE,y
	TYA
	STA.b $02,x
	LDA.w $0D6E,y
	STA.b $08,x
	LDA.w $0DEE,y
	STA.b $0A,x
	LDA.w $0F6E,y
	STA.b $04,x
	LDA.w $0FEE,y
	STA.b $28,x
	LDA.w $106E,y
	STA.b $2A,x
	LDA.w $0EEE,y
	AND.w #$FE00
	STA.b $0C,x
	LDA.w #$0002
	BIT.b $0C,x
	BVC.b CODE_189A50
	LDA.w #$FFFE
CODE_189A50:
	STA.b $10,x
	LDY.b $04,x
	LDA.b $00,x
	ORA.w DATA_198804,y
	STA.b $00,x
	JMP.w CODE_1899DD

CODE_189A5E:
	PHX
	STA.b $25
	LDY.w #$0016
CODE_189A64:
	LDX.w DATA_198C9D,y
	BIT.b $00,x
	BPL.b CODE_189A72
	DEY
	DEY
	BNE.b CODE_189A64
	PLX
	CLC
	RTS

CODE_189A72:
	JSR.w CODE_18B201
	LDY.b $25
	STY.b $04,x
	LDA.b $00,x
	ORA.w DATA_198804,y
	STA.b $00,x
	TXY
	PLX
	SEC
	RTS

CODE_189A84:
	PLP
	RTS

CODE_189A86:
	PHP
	REP.b #$30
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BMI.b CODE_189A84
	LDA.b $58
	CLC
	ADC.w #$01C0
	STA.b $29
	LDA.b $5C
	CLC
	ADC.w #$01C0
	STA.b $2B
	LDY.w #$0016
CODE_189AA1:
	STY.b $3B
	LDX.w DATA_198C9D,y
	LDA.b $00,x
	BPL.b CODE_189B10
	LDA.b $04,x
	CMP.w #$0026
	BEQ.b CODE_189B10
	CMP.w #$0014
	BEQ.b CODE_189B10
	LDA.b $08,x
	CLC
	ADC.w #$0060
	CMP.b $58
	BCC.b CODE_189AD2
	CMP.b $29
	BCS.b CODE_189AD2
	LDA.b $0A,x
	CLC
	ADC.w #$0060
	CMP.b $5C
	BCC.b CODE_189AD2
	CMP.b $2B
	BCC.b CODE_189B10
CODE_189AD2:
	LDY.b $02,x
	LDA.w $0E6E,y
	BIT.w #$0004
	BNE.b CODE_189B10
	JSR.w CODE_18AA29
	STZ.b $00,x
	BIT.w #$0008
	BNE.b CODE_189AF7
	PHA
	LDA.b $08,x
	STA.w $0D6E,y
	LDA.b $0A,x
	STA.w $0DEE,y
	LDA.b $0C,x
	STA.w $0EEE,y
	PLA
CODE_189AF7:
	BIT.w #$0020
	BEQ.b CODE_189B07
	LDA.w $0CEE,y
	ORA.w #$0002
	STA.w $0CEE,y
	BRA.b CODE_189B10

CODE_189B07:
	LDA.w $0CEE,y
	AND.w #$7FFF
	STA.w $0CEE,y
CODE_189B10:
	LDY.b $3B
	DEY
	DEY
	BNE.b CODE_189AA1
	PLP
	RTS

CODE_189B18:
	PHP
	REP.b #$30
	LDA.w #$FFFF
	STA.w $1100
	LDY.w #$0016
CODE_189B24:
	STY.b $3B
	LDX.w DATA_198C9D,y
	BIT.b $00,x
	BPL.b CODE_189B69
	STX.b $3D
	JSR.w CODE_189B71
	LDX.b $3D
	BIT.b $00,x
	BPL.b CODE_189B69
	JSR.w CODE_18A9C7
	LDA.b $00,x
	BIT.w #$4000
	BNE.b CODE_189B61
	BIT.w #$2000
	BNE.b CODE_189B69
	LSR
	BCS.b CODE_189B69
	LDA.w $0620
	LSR
	BCS.b CODE_189B69
	LDA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BNE.b CODE_189B69
	LDA.b $00,x
	BIT.w #$0800
	BEQ.b CODE_189B61
	JSR.w CODE_18AD8F
	BCS.b CODE_189B66
CODE_189B61:
	JSR.w CODE_18AFB5
	BCC.b CODE_189B69
CODE_189B66:
	JSR.w CODE_18AA6C
CODE_189B69:
	LDY.b $3B
	DEY
	DEY
	BNE.b CODE_189B24
	PLP
	RTS

CODE_189B71:
	LDY.b $04,x
	BIT.b $06,x
	BPL.b CODE_189B88
	PHY
	LDA.w DATA_19882E,y
	STA.b $25
	JSR.w CODE_189B8F
	STZ.b $06,x
	PLY
	BIT.b $00,x
	BMI.b CODE_189B88
	RTS

CODE_189B88:
	LDA.w DATA_198858,y
	STA.b $25
	LDY.b $06,x
CODE_189B8F:
	JMP.w ($0025)

CODE_189B92:
	LDA.w #$0001
	STA.b $1A,x
	LDA.w #$0004
	JMP.w CODE_18971A

CODE_189B9D:
	LDA.b $1C,x
	BEQ.b CODE_189BA2
	RTS

CODE_189BA2:
	JSR.w CODE_189724
	LDA.b $00
	AND.w #$001F
	BNE.b CODE_189BBD
	LDA.w #$0000
	LDX.w #$0004
	LDY.w #$FFEC
	JSR.w CODE_189658
	BCC.b CODE_189BBD
	JSR.w CODE_1896E1
CODE_189BBD:
	JMP.w CODE_18A9A5

CODE_189BC0:
	RTS

CODE_189BC1:
	LDA.w #$04B0
	STA.b $18,x
	LDA.w #$0082
	JMP.w CODE_189700

CODE_189BCC:
	DEC.b $18,x
	BNE.b CODE_189BDF
	LDA.w #$2602
	JSR.w CODE_18D832
	LDA.w #$0006
	JSR.w CODE_18B0AE
	JMP.w CODE_18ABCB

CODE_189BDF:
	LDA.b $0C,x
	EOR.w #$0600
	STA.b $0C,x
	RTS

CODE_189BE7:
	LDA.w #$0048
	JMP.w CODE_189700

CODE_189BED:
	RTS

CODE_189BEE:
	LDA.w $010C
	BNE.b CODE_189BF6
	JMP.w CODE_18ABCB

CODE_189BF6:
	LDA.w #$004A
	JMP.w CODE_189700

CODE_189BFC:
	RTS

CODE_189BFD:
	LDA.w #$0004
	STA.b $1A,x
	LDA.w #$000A
	BIT.b $28,x
	BPL.b CODE_189C0C
	LDA.w #$000C
CODE_189C0C:
	JMP.w CODE_18971A

CODE_189C0F:
	JSR.w CODE_189724
	BCC.b CODE_189C2D
	JSR.w CODE_18A95C
	BIT.b $28,x
	BMI.b CODE_189C23
	LDY.w #$000A
	CMP.w #$0040
	BCS.b CODE_189C26
CODE_189C23:
	LDY.w #$000C
CODE_189C26:
	TYA
	JSR.w CODE_18971A
	JMP.w CODE_18A969

CODE_189C2D:
	RTS

CODE_189C2E:
	LDA.w #$000E
	JMP.w CODE_18971A

CODE_189C34:
	JMP.w CODE_189724

CODE_189C37:
	LDA.b $0C,x
	AND.w #$F1FF
	ORA.w #$0A00
	STA.b $0C,x
	LDA.w #$0006
	BRA.b CODE_189C49

CODE_189C46:
	LDA.w #$0004
CODE_189C49:
	STA.b $1A,x
	STZ.b $18,x
	LDA.w #$0012
	JMP.w CODE_18971A

CODE_189C53:
	LDA.b $04,x
	CMP.w #$0010
	BEQ.b CODE_189C61
	LDA.b $39
	AND.w #$0003
	BNE.b CODE_189CB4
CODE_189C61:
	LDA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BNE.b CODE_189CB4
	JSR.w CODE_18A98B
	CPY.w #$0000
	BEQ.b CODE_189C7B
	CLC
	ADC.b $0A,x
	CMP.b $28,x
	BCC.b CODE_189C7B
	CMP.b $2A,x
	BCS.b CODE_189C7B
	STA.b $0A,x
CODE_189C7B:
	CPY.w #$0050
	BCS.b CODE_189CB4
	LDA.b $18,x
	BNE.b CODE_189CB4
	LDA.w #$0000
	LDX.w #$0016
	LDY.w #$FFF4
	JSR.w CODE_189658
	BCC.b CODE_189CB4
	JSR.w CODE_1896E1
	LDA.w $001A,y
	EOR.w #$FFFF
	INC
	STA.w $001A,y
	LDA.w #$002D
	LDY.b $04,x
	CPY.w #$0010
	BEQ.b CODE_189CAC
	LDA.w #$0050
CODE_189CAC:
	STA.b $18,x
	LDA.w #$0502
	JSR.w CODE_18D832
CODE_189CB4:
	LDA.b $18,x
	BEQ.b CODE_189CBA
	DEC.b $18,x
CODE_189CBA:
	JMP.w CODE_189724

CODE_189CBD:
	LDA.b $0C,x
	AND.w #$F1FF
	ORA.w #$0A00
	STA.b $0C,x
	LDA.w #$0004
	STA.b $1A,x
CODE_189CCC:
	STZ.b $18,x
	STZ.b $14,x
	LDA.w #$0014
	JMP.w CODE_18971A

CODE_189CD6:
	LDA.b $18,x
	BEQ.b CODE_189CDE
	DEC.b $18,x
	BRA.b CODE_189D10

CODE_189CDE:
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.b $08,x
	BNE.b CODE_189CED
	LDA.w #$0032
	STA.b $18,x
	BRA.b CODE_189D10

CODE_189CED:
	BMI.b CODE_189CF3
	CLC
	ADC.w #$0010
CODE_189CF3:
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	CLC
	ADC.b $08,x
	CMP.b $28,x
	BCC.b CODE_189D10
	CMP.b $2A,x
	BCS.b CODE_189D10
	STA.b $08,x
CODE_189D10:
	LDA.b $14,x
	BEQ.b CODE_189D18
	DEC.b $14,x
	BRA.b CODE_189D41

CODE_189D18:
	JSR.w CODE_18A97D
	TYA
	BMI.b CODE_189D3C
	LDA.w #$000A
	LDY.b $04,x
	CPY.w #$000C
	BEQ.b CODE_189D2B
	LDA.w #$000E
CODE_189D2B:
	LDX.w #$0001
	LDY.w #$0003
	JSR.w CODE_189658
	BCC.b CODE_189D41
	LDA.w #$0502
	JSR.w CODE_18D832
CODE_189D3C:
	LDA.w #$0046
	STA.b $14,x
CODE_189D41:
	JMP.w CODE_189724

CODE_189D44:
	LDA.w #$00F0
	LDY.w $0CD6
	CPY.w #$0002
	BEQ.b CODE_189D52
	LDA.w #$01E0
CODE_189D52:
	STA.w $114A
	LDA.w #$FFFF
	STA.w !RAM_SXAR_Global_LevelClearFlags
	LDA.w #$001C
	JMP.w CODE_18971A

CODE_189D61:
	LDA.b $39
	AND.w #$001F
	BNE.b CODE_189D6E
	LDA.w #$0702
	JSR.w CODE_18D832
CODE_189D6E:
	JSR.w CODE_189724
	BCC.b CODE_189D76
	JMP.w CODE_18ABCB

CODE_189D76:
	RTS

CODE_189D77:
	BIT.b $28,x
	BPL.b CODE_189D80
	LDA.w #$FFFF
	BRA.b CODE_189D83

CODE_189D80:
	LDA.w #$0001
CODE_189D83:
	STA.w $114E
	BIT.w $114C
	BMI.b CODE_189D91
	EOR.w #$FFFF
	STA.w $11FC
CODE_189D91:
	LDA.w #$8000
	STA.w $114C
	LDA.w #$0380
	STA.w $1154
	RTS

CODE_189D9E:
	RTS

CODE_189D9F:
	LDA.w #$0004
	STA.b $1A,x
	LDA.b $10,x
	CMP.w #$8000
	ROR
	STA.b $10,x
	LDA.w #$0084
	JMP.w CODE_189700

CODE_189DB2:
	INC.b $18,x
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.b $0A,x
	BCC.b CODE_189DD7
	LDA.b $18,x
	AND.w #$007F
	BNE.b CODE_189DD7
	LDA.w #$001E
	LDX.w #$0000
	LDY.w #$0003
	JSR.w CODE_189895
	BCC.b CODE_189DD7
	LDA.w #$0502
	JSR.w CODE_18D832
CODE_189DD7:
	LDA.b $0C,x
	PHA
	JSR.w CODE_18A9A5
	PLA
	STA.b $0C,x
	RTS

CODE_189DE1:
	LDA.w #$0096
	STA.b $18,x
	LDA.w #$0001
	STA.b $1A,x
	LDA.b $0C,x
	AND.w #$BFFF
	STA.b $0C,x
	LDA.w #$0086
	JMP.w CODE_189700

CODE_189DF8:
	DEC.b $18,x
	BEQ.b CODE_189E44
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$0008
	STA.b $25
	LDA.w #$FFFF
	LDY.b $0A,x
	CPY.b $25
	BEQ.b CODE_189E18
	BCS.b CODE_189E13
	LDA.w #$0001
CODE_189E13:
	CLC
	ADC.b $0A,x
	STA.b $0A,x
CODE_189E18:
	LDA.w #$FFFF
	LDY.b $08,x
	CPY.w !RAM_SXAR_SpiderMan_XPosLo
	BEQ.b CODE_189E2C
	BCS.b CODE_189E27
	LDA.w #$0001
CODE_189E27:
	CLC
	ADC.b $08,x
	STA.b $08,x
CODE_189E2C:
	LDA.b $18,x
	CMP.w #$008C
	BCS.b CODE_189E38
	CMP.w #$001E
	BCS.b CODE_189E3F
CODE_189E38:
	LDA.b $0C,x
	EOR.w #$0600
	STA.b $0C,x
CODE_189E3F:
	JSR.w CODE_18A932
	BEQ.b CODE_189E5D
CODE_189E44:
	LDA.w #$2602
	JSR.w CODE_18D832
	JSR.w CODE_18ABCB
	LDA.b $0A,x
	CLC
	ADC.w #$0008
	TAY
	LDA.b $08,x
	TAX
	LDA.w #$0006
	JMP.w CODE_18B0C8

CODE_189E5D:
	RTS

CODE_189E5E:
	LDA.b $02,x
	INC
	INC
	LSR
	CMP.w $121A
	BNE.b CODE_189E6B
	JSR.w CODE_18A921
CODE_189E6B:
	LDA.w #$008A
	JMP.w CODE_189700

CODE_189E71:
	LDA.b $02,x
	INC
	INC
	LSR
	CMP.w $121A
	BNE.b CODE_189E88
	JSR.w CODE_18A8A9
	LDY.w #$008C
	LDA.b $39
	AND.w #$0004
	BNE.b CODE_189E8B
CODE_189E88:
	LDY.w #$008A
CODE_189E8B:
	TYA
	JMP.w CODE_189700

CODE_189E8F:
	STZ.b $18,x
	LDY.b $28,x
	LDA.w DATA_198BD8,y
	JMP.w CODE_189700

CODE_189E99:
	BNE.b CODE_189F06
	LDA.b $18,x
	BEQ.b CODE_189ECB
	LDY.b $28,x
	LDA.w DATA_198BE0,y
	TAY
	LDA.b $39
	AND.w #$0002
	BNE.b CODE_189EB1
	LDA.w #$03F8
	BRA.b CODE_189EB4

CODE_189EB1:
	LDA.w #$0000
CODE_189EB4:
	STA.w $0420,y
	DEC.b $18,x
	BNE.b CODE_189F05
	LDA.w #$0000
	STA.w $0420,y
	INC.b $06,x
	LDY.b $28,x
	LDA.w DATA_198BE8,y
	JMP.w CODE_18971A

CODE_189ECB:
	LDY.b $28,x
	LDA.w DATA_198BE0,y
	TAY
	LDA.w #$03F8
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BPL.b CODE_189EDC
	LDA.w #$0000
CODE_189EDC:
	STA.w $0420,y
	LDA.b $08,x
	SEC
	SBC.b $58
	BCC.b CODE_189F05
	CMP.w #$0100
	BCS.b CODE_189F05
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BMI.b CODE_189F05
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	CMP.w #$007F
	BCC.b CODE_189F05
	JSR.w CODE_18D8BB
	AND.w #$003F
	BNE.b CODE_189F05
	LDA.w #$0050
	STA.b $18,x
CODE_189F05:
	RTS

CODE_189F06:
	JSR.w CODE_189724
	BCC.b CODE_189F05
	STZ.b $06,x
	RTS

CODE_189F0E:
	LDA.w #$0002
	STA.b $1A,x
	LDA.b $0C,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $0C,x
	LDA.w #$0014
	STA.b $1C,x
	LDA.w #$009E
	JMP.w CODE_189700

CODE_189F28:
	LDA.w DATA_1987FE,y
	STA.b $25
	JMP.w ($0025)

CODE_189F30:
	JSR.w CODE_18A969
	INC.b $18,x
	JSR.w CODE_18A940
	BNE.b CODE_189F65
	STZ.b $16,x
CODE_189F3C:
	JSR.w CODE_18A94F
	LDA.w #$0002
	BCS.b CODE_189F47
	LDA.w #$FFFE
CODE_189F47:
	STA.b $10,x
	JSR.w CODE_18D8BB
	AND.w #$0003
	BNE.b CODE_189F59
	LDA.b $10,x
	EOR.w #$FFFF
	INC
	STA.b $10,x
CODE_189F59:
	LDA.w #$00A0
	JSR.w CODE_189700
	LDA.w #$0004
	STA.b $06,x
	RTS

CODE_189F65:
	LDA.w #$009A
	JSR.w CODE_189700
	LDA.b $1C,x
	BEQ.b CODE_189F7A
	CMP.w #$0012
	BCS.b CODE_189F9A
	CMP.w #$0001
	BEQ.b CODE_189FA8
	RTS

CODE_189F7A:
	JSR.w CODE_18D8BB
	AND.w #$001F
	BNE.b CODE_189FBF
	JSR.w CODE_18A95C
	CMP.w #$0020
	BCS.b CODE_189F92
	JSR.w CODE_18A94F
	CMP.w #$0050
	BCC.b CODE_189FA8
CODE_189F92:
	JSR.w CODE_18D8BB
	AND.w #$0001
	BNE.b CODE_189FA8
CODE_189F9A:
	JSR.w CODE_18D8BB
	AND.w #$00FF
	CLC
	ADC.w #$F940
	STA.b $16,x
	BRA.b CODE_189F3C

CODE_189FA8:
	LDA.b $08,x
	SEC
	SBC.b $58
	BCC.b CODE_189FBF
	CMP.w #$0100
	BCS.b CODE_189FBF
	LDA.w #$0032
	JSR.w CODE_18971A
	LDA.w #$0002
	STA.b $06,x
CODE_189FBF:
	RTS

CODE_189FC0:
	LDA.b $1C,x
	BNE.b CODE_189FC9
	JSR.w CODE_189724
	BCC.b CODE_189FD0
CODE_189FC9:
	LDA.w #$0000
	STA.b $06,x
	STZ.b $18,x
CODE_189FD0:
	RTS

CODE_189FD1:
	JSR.w CODE_18A969
	LDA.b $08,x
	STA.w $110C
	LDA.b $0A,x
	STA.w $110E
	LDA.b $08,x
	CLC
	ADC.b $10,x
	STA.b $08,x
	CMP.w $0CB6
	BCS.b CODE_189FF9
	CMP.w #$0038
	BCC.b CODE_189FF9
	CMP.w #$01C8
	BCS.b CODE_189FF9
	JSR.w CODE_18A932
	BEQ.b CODE_189FFE
CODE_189FF9:
	LDA.w $110C
	STA.b $08,x
CODE_189FFE:
	JSR.w CODE_188D2A
	LDA.b $89
	CLC
	ADC.b $0A,x
	STA.b $0A,x
	JSR.w CODE_18A932
	BIT.w #$8000
	BNE.b CODE_18A023
	BIT.b $16,x
	BMI.b CODE_18A03F
	BIT.w #$4000
	BEQ.b CODE_18A03F
	LDA.b $0A,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BEQ.b CODE_18A023
	BCC.b CODE_18A03F
CODE_18A023:
	STZ.b $16,x
	BIT.b $89
	BPL.b CODE_18A031
	LDA.w $110E
	STA.b $0A,x
	JMP.w CODE_189FC9

CODE_18A031:
	LDA.b $0A,x
	SEC
	SBC.w #$0008
	ORA.w #$0007
	STA.b $0A,x
	JMP.w CODE_189FC9

CODE_18A03F:
	LDA.b $0A,x
	CMP.w #$0048
	BCS.b CODE_18A04D
	LDA.w $110E
	STA.b $0A,x
	STZ.b $16,x
CODE_18A04D:
	RTS

CODE_18A04E:
	LDA.b $1C,x
	BNE.b CODE_18A088
	LDA.b $0E,x
	CMP.w #$00A0
	BEQ.b CODE_18A088
	LDA.b $08,x
	SEC
	SBC.b $58
	CMP.w #$0100
	BCS.b CODE_18A088
	DEC.b $1A,x
	BNE.b CODE_18A07D
	LDA.w #$2602
	JSR.w CODE_18D832
	LDA.w #$0000
	JSR.w CODE_18B0AE
	LDY.b $04,x
	LDA.w DATA_1988D6,y
	STA.b $25
	JMP.w ($0025)

CODE_18A07D:
	LDA.w #$0A02
	JSR.w CODE_18D832
	LDA.w #$0005
	STA.b $1C,x
CODE_18A088:
	RTS

CODE_18A089:
	DEC.w $1216
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	JMP.w CODE_18ABCB

CODE_18A097:
	LDA.w #$0018
	STA.b $1A,x
	LDA.w #$0028
	STA.w $1212
	LDA.w #$0028
	JMP.w CODE_18971A

CODE_18A0A8:
	TYA
	BNE.b CODE_18A0B4
	JSR.w CODE_18A969
	JSR.w CODE_18A2D0
	JMP.w CODE_189724

CODE_18A0B4:
	CPY.w #$0001
	BEQ.b CODE_18A0BC
	JMP.w CODE_18A17F

CODE_18A0BC:
	JSR.w CODE_18A969
	JSR.w CODE_18A2D0
	LDA.w $1210
	BEQ.b CODE_18A0CA
	JMP.w CODE_18A164

CODE_18A0CA:
	JSR.w CODE_18A2AE
	LDA.w $1212
	BNE.b CODE_18A0D8
	LDA.w #$0078
	STA.w $1212
CODE_18A0D8:
	DEC.w $1212
	CMP.w #$000E
	BCS.b CODE_18A102
	PHA
	LDA.w #$00FA
	JSR.w CODE_189700
	PLA
	CMP.w #$0006
	BNE.b CODE_18A108
	LDY.w #$0000
	LDA.b $0A,x
	CLC
	ADC.w #$0040
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BCS.b CODE_18A0FF
	LDY.w #$0020
CODE_18A0FF:
	JSR.w CODE_18A276
CODE_18A102:
	LDA.w #$00F8
	JSR.w CODE_189700
CODE_18A108:
	JSR.w CODE_188D2A
	CLC
	ADC.b $0A,x
	CMP.w #$0078
	BCS.b CODE_18A117
	STZ.b $16,x
	BRA.b CODE_18A163

CODE_18A117:
	CMP.w #$0110
	BCC.b CODE_18A13B
	LDA.w #$010F
CODE_18A11F:
	STA.b $0A,x
	STZ.b $16,x
	LDA.w #$00F6
	JSR.w CODE_189700
	LDA.w #$0001
	STA.w $1210
	LDA.w #$001E
	STA.b $18,x
	LDA.w #$1902
	JSR.w CODE_18D832
	RTS

CODE_18A13B:
	STA.b $0A,x
	JSR.w CODE_18A932
	BIT.w #$8000
	BNE.b CODE_18A155
	BIT.b $89
	BMI.b CODE_18A163
	LDY.b $0A,x
	CPY.w !RAM_SXAR_SpiderMan_YPosLo
	BCC.b CODE_18A163
	BIT.w #$4000
	BEQ.b CODE_18A163
CODE_18A155:
	LDA.b $0A,x
	SEC
	SBC.w #$0008
	AND.w #$FFF8
	ORA.w #$0007
	BNE.b CODE_18A11F
CODE_18A163:
	RTS

CODE_18A164:
	DEC.b $18,x
	BEQ.b CODE_18A171
	LDA.b $18,x
	CMP.w #$0005
	BCC.b CODE_18A179
	BRA.b CODE_18A163

CODE_18A171:
	LDA.w #$F840
	STA.b $16,x
	STZ.w $1210
CODE_18A179:
	LDA.w #$00F8
	JMP.w CODE_189700

CODE_18A17F:
	CPY.w #$0002
	BNE.b CODE_18A1C0
	JSR.w CODE_18A969
	LDA.b $39
	AND.w #$007F
	BNE.b CODE_18A194
	LDY.w #$004A
	JSR.w CODE_18A276
CODE_18A194:
	JSR.w CODE_18A2D0
	LDA.b $0A,x
	CMP.w #$010F
	BCS.b CODE_18A1A7
	CLC
	ADC.w #$0004
	ORA.w #$0001
	BRA.b CODE_18A1AD

CODE_18A1A7:
	JSR.w CODE_18A2AE
	LDA.w #$010F
CODE_18A1AD:
	STA.b $0A,x
	LDY.w #$00FC
	LDA.b $39
	AND.w #$0002
	BNE.b CODE_18A1BC
	LDY.w #$00FE
CODE_18A1BC:
	TYA
	JMP.w CODE_189700

CODE_18A1C0:
	JSR.w CODE_18A2D0
	BIT.w !RAM_SXAR_Global_LevelClearFlags
	BMI.b CODE_18A1EC
	LDA.w $1218
	ORA.w $1216
	BNE.b CODE_18A1DF
	LDA.w #$0078
	STA.w $114A
	LDA.w #$FFFF
	STA.w !RAM_SXAR_Global_LevelClearFlags
	JMP.w CODE_18A652

CODE_18A1DF:
	LDA.w $1218
	BEQ.b CODE_18A1EC
	LDA.w $1214
	BEQ.b CODE_18A1ED
	DEC.w $1214
CODE_18A1EC:
	RTS

CODE_18A1ED:
	LDA.w #$003C
	STA.w $1214
	LDA.w $1216
	CMP.w #$0003
	BCS.b CODE_18A20F
	LDA.w #$0026
	LDX.w #$0000
	LDY.w #$0000
	JSR.w CODE_189895
	BCC.b CODE_18A20F
	DEC.w $1218
	INC.w $1216
CODE_18A20F:
	RTS

CODE_18A210:
	LDA.w #$0026
	STA.w $1204
	LDA.w #$0A02
	JSR.w CODE_18D832
	DEC.b $1A,x
	BNE.b CODE_18A275
	JSR.w CODE_18A2F8
	STZ.w $1210
	INC.b $06,x
	LDA.b $06,x
	CMP.w #$0002
	BCS.b CODE_18A23C
	LDA.w #$0010
	STA.b $1A,x
	LDA.w #$0001
	STA.b $10,x
	JMP.w CODE_18A171

CODE_18A23C:
	BNE.b CODE_18A24E
	LDA.w #$0002
	STA.b $10,x
	LDA.w #$000C
	STA.b $1A,x
	LDA.w #$00FC
	JMP.w CODE_189700

CODE_18A24E:
	LDA.b $00,x
	ORA.w #$2001
	STA.b $00,x
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	LDA.w #$000A
	STA.w $1218
	LDA.w #$0032
	STA.w $1214
	STZ.w $1216
	LDA.w #$0100
	JSR.w CODE_189700
	JMP.w CODE_18A47F

CODE_18A275:
	RTS

CODE_18A276:
	STY.b $2D
	LDA.w DATA_198B6E,y
	BMI.b CODE_18A2A7
	PHA
	LDX.w DATA_198B6E+$02,y
	LDA.w DATA_198B6E+$04,y
	TAY
	PLA
	JSR.w CODE_189658
	BCC.b CODE_18A2A7
	PHX
	LDX.b $2D
	LDA.w DATA_198B6E+$06,x
	STA.w $001A,y
	LDA.w DATA_198B6E+$08,x
	STA.w $001C,y
	PLX
	JSR.w CODE_1896E1
	LDA.b $2D
	CLC
	ADC.w #$000A
	TAY
	BRA.b CODE_18A276

CODE_18A2A7:
	LDA.w #$0702
	JSR.w CODE_18D832
	RTS

CODE_18A2AE:
	LDA.b $08,x
	CLC
	ADC.b $10,x
	BIT.b $10,x
	BPL.b CODE_18A2BE
	CMP.w #$0050
	BCS.b CODE_18A2CD
	BRA.b CODE_18A2C3

CODE_18A2BE:
	CMP.w #$01B0
	BCC.b CODE_18A2CD
CODE_18A2C3:
	LDA.b $10,x
	EOR.w #$FFFF
	INC
	STA.b $10,x
	BRA.b CODE_18A2CF

CODE_18A2CD:
	STA.b $08,x
CODE_18A2CF:
	RTS

CODE_18A2D0:
	PHP
	BIT.w $1204
	BMI.b CODE_18A2E7
	SEP.b #$20
	STZ.w $2130
	LDA.b #$82
	STA.w $2131
	LDA.b #$EC
	STA.w $2132
	PLP
	RTS

CODE_18A2E7:
	SEP.b #$20
	LDA.b #$30
	STA.w $2130
	STZ.w $2131
	LDA.b #$E0
	STA.w $2132
	PLP
	RTS

CODE_18A2F8:
	PHX
	LDA.b $08,x
	STA.b $6B
	LDA.b $0A,x
	STA.b $6D
	LDY.w #$000E
CODE_18A304:
	STY.b $2D
	LDA.w DATA_198B4E,y
	CLC
	ADC.b $6B
	TAX
	LDA.w DATA_198B5E,y
	CLC
	ADC.b $6D
	TAY
	LDA.w #$0000
	JSR.w CODE_18B0C8
	LDY.b $2D
	DEY
	DEY
	BPL.b CODE_18A304
	LDA.w #$0D02
	JSR.w CODE_18D832
	PLX
	RTS

CODE_18A328:
	LDA.b $0E,x
	SEC
	SBC.w #$00EE
	BCC.b CODE_18A372
	ASL
	TAY
	LDA.b $58
	SEC
	SBC.b $08,x
	CLC
	ADC.w DATA_19B1D6,y
	STA.w $0C95
	LDA.b $5C
	SEC
	SBC.b $0A,x
	CLC
	ADC.w DATA_19B1D6+$02,y
	DEC
	STA.w $0C9D
	LDA.b $08,x
	SEC
	SBC.w DATA_19B1D6,y
	STA.w $120A
	LDA.b $0A,x
	SEC
	SBC.w DATA_19B1D6+$02,y
	INC
	STA.w $120C
	LDY.w $1204
	BMI.b CODE_18A372
	LDA.w DATA_198B26,y
	CLC
	ADC.w $0C95
	STA.w $0C95
	DEY
	DEY
	STY.w $1204
CODE_18A372:
	RTS

CODE_18A373:
	LDA.w #$0001
	JSR.w CODE_18A9CE
	BCS.b CODE_18A38E
	LDA.w #$0018
	STA.b $1A,x
	STZ.b $12,x
	LDA.w #$0002
	JSR.w CODE_18A634
	LDA.w #$0022
	JMP.w CODE_18971A

CODE_18A38E:
	JMP.w CODE_18ABCB

CODE_18A391:
	LDA.b $00,x
	LSR
	BCC.b CODE_18A3A4
	LDA.b $0C,x
	EOR.w #$0400
	STA.b $0C,x
	DEC.b $18,x
	BNE.b CODE_18A3F0
	JMP.w CODE_18ABCB

CODE_18A3A4:
	LDA.b $12,x
	BEQ.b CODE_18A3B0
	JSR.w CODE_189724
	DEC.b $12,x
	BNE.b CODE_18A3F0
	RTS

CODE_18A3B0:
	JSR.w CODE_189724
	LDA.b $10,x
	CLC
	ADC.b $08,x
	STA.b $08,x
	LDY.b $0A,x
	LDA.w #$0014
	BIT.b $0C,x
	BVC.b CODE_18A3C7
	EOR.w #$FFFF
	INC
CODE_18A3C7:
	CLC
	ADC.b $08,x
	TAX
	JSR.w CODE_18AE20
	LDX.b $3D
	BIT.w #$8000
	BEQ.b CODE_18A3F0
	LDA.b $0C,x
	EOR.w #$4000
	STA.b $0C,x
	LDA.b $10,x
	EOR.w #$FFFF
	INC
	STA.b $10,x
	LDA.w #$0026
	STA.w $11FE
	LDA.w #$0702
	JSR.w CODE_18D832
CODE_18A3F0:
	RTS

CODE_18A3F1:
	JSR.w CODE_18A94F
	BCS.b CODE_18A3FB
	BIT.b $0C,x
	BVS.b CODE_18A3FF
	RTS

CODE_18A3FB:
	BIT.b $0C,x
	BVS.b CODE_18A404
CODE_18A3FF:
	LDA.w #$0007
	STA.b $12,x
CODE_18A404:
	RTS

CODE_18A405:
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	LDA.b $00,x
	ORA.w #$0001
	STA.b $00,x
	LDA.w #$0001
	STA.b $12,x
	LDA.w #$008C
	STA.b $18,x
	LDA.w #$0002
	JSR.w CODE_18A63B
	LDA.w #$2802
	JSR.w CODE_18D832
	JSR.w CODE_18A47F
	JMP.w CODE_18ABCB

CODE_18A430:
	LDA.w #$0001
	JSR.w CODE_18A9CE
	BCS.b CODE_18A44C
	JSR.w CODE_18A921
	LDA.w #$0019
	STA.b $1A,x
	LDA.w #$0001
	JSR.w CODE_18A634
	LDA.w #$00CC
	JMP.w CODE_189700

CODE_18A44C:
	JMP.w CODE_18ABCB

CODE_18A44F:
	JSR.w CODE_18A8A9
	LDA.b $28,x
	STA.b $A9
	LDA.w DATA_1987F6,y
	STA.b $25
	JMP.w ($0025)

CODE_18A45E:
	LDA.b $26,x
	CMP.w #$0024
	BEQ.b CODE_18A46B
	LDA.w #$0024
	JSR.w CODE_18971A
CODE_18A46B:
	JSR.w CODE_189724
	BCC.b CODE_18A49A
	JSR.w CODE_18ABCB
	LDA.w #$2602
	JSR.w CODE_18D832
	LDA.w #$0006
	JSR.w CODE_18B0AE
CODE_18A47F:
	LDA.w #$0014
	JSR.w CODE_189A5E
	BCC.b CODE_18A49A
	LDA.b $0C,x
	STA.w $000C,y
	LDA.b $08,x
	STA.w $0008,y
	LDA.b $0A,x
	SEC
	SBC.w #$0030
	STA.w $000A,y
CODE_18A49A:
	RTS

CODE_18A49B:
	INC.b $18,x
	JSR.w CODE_18A940
	BNE.b CODE_18A4D5
	JSR.w CODE_18A969
	STZ.b $16,x
CODE_18A4A7:
	JSR.w CODE_18A94F
	LDA.w #$0002
	BCS.b CODE_18A4B2
	LDA.w #$FFFE
CODE_18A4B2:
	STA.b $10,x
	JSR.w CODE_18D8BB
	BIT.w #$0003
	BNE.b CODE_18A4C9
	AND.w #$0004
	BEQ.b CODE_18A4C7
	LDA.b $10,x
	EOR.w #$FFFF
	INC
CODE_18A4C7:
	STA.b $10,x
CODE_18A4C9:
	LDA.w #$00D8
	JSR.w CODE_189700
	LDA.w #$0004
	STA.b $06,x
	RTS

CODE_18A4D5:
	LDA.b $00,x
	LSR
	BCS.b CODE_18A45E
	JSR.w CODE_18A969
	LDA.w #$00CC
	JSR.w CODE_189700
	JSR.w CODE_18A95C
	CMP.w #$0020
	BCS.b CODE_18A4F3
	JSR.w CODE_18A94F
	CMP.w #$0080
	BCC.b CODE_18A508
CODE_18A4F3:
	JSR.w CODE_18D8BB
	AND.w #$0003
	BNE.b CODE_18A508
	LDA.b $39
	AND.w #$007F
	CLC
	ADC.w #$F840
	STA.b $16,x
	BRA.b CODE_18A4A7

CODE_18A508:
	JSR.w CODE_18D8BB
	AND.w #$0007
	BNE.b CODE_18A51B
	LDA.w #$001E
	JSR.w CODE_18971A
	LDA.w #$0002
	STA.b $06,x
CODE_18A51B:
	RTS

CODE_18A51C:
	JSR.w CODE_189724
	BCC.b CODE_18A528
CODE_18A521:
	LDA.w #$0000
	STA.b $06,x
	STZ.b $18,x
CODE_18A528:
	RTS

CODE_18A529:
	JSR.w CODE_18A969
	LDA.b $08,x
	STA.w $110C
	LDA.b $0A,x
	STA.w $110E
	LDA.b $08,x
	CLC
	ADC.b $10,x
	STA.b $08,x
	CMP.w $0CB6
	BCS.b CODE_18A555
	LDY.w #$0000
	CMP.b ($A9),y
	BCC.b CODE_18A555
	LDY.w #$0002
	CMP.b ($A9),y
	BCS.b CODE_18A555
	JSR.w CODE_18A932
	BEQ.b CODE_18A569
CODE_18A555:
	LDA.w $110C
	STA.b $08,x
	LDA.b $06,x
	CMP.w #$0006
	BNE.b CODE_18A569
	LDA.b $10,x
	EOR.w #$FFFF
	INC
	STA.b $10,x
CODE_18A569:
	JSR.w CODE_188D2A
	LDA.b $89
	CLC
	ADC.b $0A,x
	STA.b $0A,x
	JSR.w CODE_18A932
	BIT.w #$8000
	BNE.b CODE_18A595
	BIT.b $16,x
	BMI.b CODE_18A5B1
	BIT.w #$4000
	BEQ.b CODE_18A5B1
	LDA.b $06,x
	CMP.w #$0006
	BEQ.b CODE_18A595
	LDA.b $0A,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BEQ.b CODE_18A595
	BCC.b CODE_18A5B1
CODE_18A595:
	STZ.b $16,x
	BIT.b $89
	BPL.b CODE_18A5A3
	LDA.w $110E
	STA.b $0A,x
	JMP.w CODE_18A521

CODE_18A5A3:
	LDA.b $0A,x
	SEC
	SBC.w #$0008
	ORA.w #$0007
	STA.b $0A,x
	JMP.w CODE_18A521

CODE_18A5B1:
	BIT.b $16,x
	BMI.b CODE_18A5BB
	LDA.w #$00D8
	JSR.w CODE_189700
CODE_18A5BB:
	LDA.b $0A,x
	LDY.w #$0004
	CMP.b ($A9),y
	BCS.b CODE_18A5CB
	LDA.w $110E
	STA.b $0A,x
	STZ.b $16,x
CODE_18A5CB:
	RTS

CODE_18A5CC:
	JMP.w CODE_18A529

CODE_18A5CF:
	RTS

CODE_18A5D0:
	LDA.b $06,x
	CMP.w #$0006
	BEQ.b CODE_18A5CF
	DEC.b $1A,x
	BNE.b CODE_18A5F1
	LDA.w #$2602
	JSR.w CODE_18D832
	LDA.w #$0000
	JSR.w CODE_18B0AE
	LDY.b $04,x
	LDA.w DATA_1988D6,y
	STA.b $25
	JMP.w ($0025)

CODE_18A5F1:
	LDA.w #$0006
	STA.b $06,x
	LDA.w #$F900
	STA.b $16,x
	LDA.w #$3F02
	JSR.w CODE_18D832
	LDA.w #$0003
	BIT.b $0C,x
	BVS.b CODE_18A60B
	LDA.w #$FFFD
CODE_18A60B:
	STA.b $10,x
	LDA.w #$00DA
	JMP.w CODE_189700

CODE_18A613:
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	LDA.b $00,x
	ORA.w #$0001
	STA.b $00,x
	LDA.w #$0001
	JSR.w CODE_18A63B
	LDA.w #$2802
	JSR.w CODE_18D832
	LDA.w #$0024
	JMP.w CODE_18971A

CODE_18A634:
	ORA.w $1206
	STA.w $1206
	RTS

CODE_18A63B:
	EOR.w #$FFFF
	AND.w $1206
	STA.w $1206
	BNE.b CODE_18A670
	LDA.w #$00F0
	STA.w $114A
	LDA.w #$FFFF
	STA.w !RAM_SXAR_Global_LevelClearFlags
CODE_18A652:
	LDA.b $04,x
	CMP.w #$001C
	BEQ.b CODE_18A670
	LDA.w #$0016
	JSR.w CODE_189A5E
	BCC.b CODE_18A670
	LDA.b $0C,x
	STA.w $000C,y
	LDA.b $08,x
	STA.w $0008,y
	LDA.b $0A,x
	STA.w $000A,y
CODE_18A670:
	RTS

CODE_18A671:
	LDA.w #$0002
	JSR.w CODE_18A9CE
	BCS.b CODE_18A68C
	JSR.w CODE_18A921
	LDA.w #$001E
	STA.b $1A,x
	LDA.w #$003C
	STA.b $18,x
	LDA.w #$0010
	JMP.w CODE_18971A

CODE_18A68C:
	JMP.w CODE_18ABCB

CODE_18A68F:
	JSR.w CODE_18A8A9
	LDA.b $28,x
	STA.b $A9
	LDA.w DATA_1987F0,y
	STA.b $25
	JMP.w ($0025)

CODE_18A69E:
	JSR.w CODE_18A969
	LDA.b $1C,x
	BNE.b CODE_18A6AE
	LDA.b $18,x
	BEQ.b CODE_18A6AE
	DEC.b $18,x
	JMP.w CODE_189724

CODE_18A6AE:
	LDA.w #$000C
	LDX.w #$0000
	LDY.w #$FFF8
	JSR.w CODE_189658
	BCC.b CODE_18A6C7
	LDA.w #$0023
	STA.b $18,x
	LDA.w #$0004
	STA.b $06,x
	RTS

CODE_18A6C7:
	LDA.w #$0002
	STA.b $06,x
	JSR.w CODE_18A94F
	LDA.w #$0400
	BCS.b CODE_18A6D7
	LDA.w #$FC00
CODE_18A6D7:
	STA.b $10,x
	JSR.w CODE_18A95C
	LDA.w #$0400
	BCS.b CODE_18A6E4
	LDA.w #$FC00
CODE_18A6E4:
	STA.b $12,x
	RTS

CODE_18A6E7:
	JSR.w CODE_18A969
	JSR.w CODE_189724
	LDA.b $12,x
	JSR.w CODE_18A740
	STY.b $12,x
	STA.b $25
	CLC
	ADC.b $0A,x
	LDY.w #$0004
	CMP.b ($A9),y
	BCC.b CODE_18A709
	LDY.w #$0006
	CMP.b ($A9),y
	BCS.b CODE_18A709
	STA.b $0A,x
CODE_18A709:
	LDA.b $10,x
	JSR.w CODE_18A740
	STY.b $10,x
	STA.b $27
	CLC
	ADC.b $08,x
	LDY.w #$0000
	CMP.b ($A9),y
	BCC.b CODE_18A725
	LDY.w #$0002
	CMP.b ($A9),y
	BCS.b CODE_18A725
	STA.b $08,x
CODE_18A725:
	LDA.b $25
	ORA.b $27
	BEQ.b CODE_18A735
CODE_18A72B:
	RTS

CODE_18A72C:
	JSR.w CODE_189724
	DEC.b $18,x
	BNE.b CODE_18A72B
	BRA.b CODE_18A6C7

CODE_18A735:
	LDA.w #$0033
	STA.b $18,x
	LDA.w #$0000
	STA.b $06,x
	RTS

CODE_18A740:
	BPL.b CODE_18A74C
	CLC
	ADC.w #$0014
	BEQ.b CODE_18A754
	BCC.b CODE_18A757
	BRA.b CODE_18A754

CODE_18A74C:
	SEC
	SBC.w #$0014
	BEQ.b CODE_18A754
	BCS.b CODE_18A757
CODE_18A754:
	LDA.w #$0000
CODE_18A757:
	TAY
	BPL.b CODE_18A75F
	XBA
	ORA.w #$FF00
	RTS

CODE_18A75F:
	XBA
	AND.w #$00FF
	RTS

CODE_18A764:
	LDA.w #$0001
	JSR.w CODE_18A9CE
	BCS.b CODE_18A77A
	JSR.w CODE_18A921
	LDA.w #$000C
	STA.b $1A,x
	LDA.w #$00C4
	JMP.w CODE_189700

CODE_18A77A:
	JMP.w CODE_18ABCB

CODE_18A77D:
	JSR.w CODE_18A8A9
	LDA.b $28,x
	STA.b $A9
	LDA.w DATA_1987EA,y
	STA.b $25
	JMP.w ($0025)

CODE_18A78C:
	JSR.w CODE_18A969
	INC.b $18,x
	JSR.w CODE_18A940
	BNE.b CODE_18A7B1
	STZ.b $16,x
CODE_18A798:
	JSR.w CODE_18A94F
	LDA.w #$0003
	BCS.b CODE_18A7A3
	LDA.w #$FFFD
CODE_18A7A3:
	STA.b $10,x
	LDA.w #$00C6
	JSR.w CODE_189700
	LDA.w #$0004
	STA.b $06,x
	RTS

CODE_18A7B1:						; Note: Related to Shocker.
	LDA.w #$00C4
	JSR.w CODE_189700
	JSR.w CODE_18A95C
	CMP.w #$0030
	BCS.b CODE_18A7C7
	JSR.w CODE_18A94F
	CMP.w #$0070
	BCC.b CODE_18A806
CODE_18A7C7:
	LDA.b $18,x
	AND.w #$0007
	BNE.b CODE_18A806
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	LDY.w #$0000
	CMP.b ($A9),y
	BCC.b CODE_18A7F6
	LDY.w #$0002
	CMP.b ($A9),y
	BCS.b CODE_18A7F6
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	LDY.w #$0004
	CMP.b ($A9),y
	BCC.b CODE_18A7F6
CODE_18A7E9:
	LDA.b $00
	AND.w #$003F
	CLC
	ADC.w #$F940
	STA.b $16,x
	BRA.b CODE_18A798

CODE_18A7F6:
	JSR.w CODE_18A95C
	CMP.w #$0038
	BCC.b CODE_18A806
	JSR.w CODE_18D8BB
	AND.w #$0003
	BEQ.b CODE_18A7E9
CODE_18A806:
	LDA.b $18,x
	AND.w #$001F
	BNE.b CODE_18A818
	LDA.w #$0018
	JSR.w CODE_18971A
	LDA.w #$0002
	STA.b $06,x
CODE_18A818:
	RTS

CODE_18A819:
	JSR.w CODE_189724
	BCC.b CODE_18A825
CODE_18A81E:
	LDA.w #$0000
	STA.b $06,x
	STZ.b $18,x
CODE_18A825:
	RTS

CODE_18A826:
	JSR.w CODE_18A969
	LDA.b $08,x
	STA.w $110C
	LDA.b $0A,x
	STA.w $110E
	LDA.b $08,x
	CLC
	ADC.b $10,x
	STA.b $08,x
	CMP.w $0CB6
	BCS.b CODE_18A852
	LDY.w #$0000
	CMP.b ($A9),y
	BCC.b CODE_18A852
	LDY.w #$0002
	CMP.b ($A9),y
	BCS.b CODE_18A852
	JSR.w CODE_18A932
	BEQ.b CODE_18A857
CODE_18A852:
	LDA.w $110C
	STA.b $08,x
CODE_18A857:
	JSR.w CODE_188D2A
	LDA.b $89
	CLC
	ADC.b $0A,x
	STA.b $0A,x
	JSR.w CODE_18A932
	BIT.w #$8000
	BNE.b CODE_18A87C
	BIT.b $16,x
	BMI.b CODE_18A898
	BIT.w #$4000
	BEQ.b CODE_18A898
	LDA.b $0A,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BEQ.b CODE_18A87C
	BCC.b CODE_18A898
CODE_18A87C:
	STZ.b $16,x
	BIT.b $89
	BPL.b CODE_18A88A
	LDA.w $110E
	STA.b $0A,x
	JMP.w CODE_18A81E

CODE_18A88A:
	LDA.b $0A,x
	SEC
	SBC.w #$0008
	ORA.w #$0007
	STA.b $0A,x
	JMP.w CODE_18A81E

CODE_18A898:
	LDA.b $0A,x
	LDY.w #$0004
	CMP.b ($A9),y
	BCS.b CODE_18A8A8
	LDA.w $110E
	STA.b $0A,x
	STZ.b $16,x
CODE_18A8A8:
	RTS

CODE_18A8A9:
	PHY
	STZ.b $25
	LDA.b $0A,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BCS.b CODE_18A8EB
	EOR.w #$FFFF
	INC
	STA.b $25
	LDY.w #$0000
	LDA.b $08,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_XPosLo
	BCS.b CODE_18A8DA
	EOR.w #$FFFF
	INC
	CMP.w #$0010
	BCC.b CODE_18A91C
	LDY.w #$000C
	CMP.b $25
	BCS.b CODE_18A91C
	LDY.w #$000E
	BRA.b CODE_18A91C

CODE_18A8DA:
	CMP.w #$0010
	BCC.b CODE_18A91C
	LDY.w #$0004
	CMP.b $25
	BCS.b CODE_18A91C
	LDY.w #$0002
	BRA.b CODE_18A91C

CODE_18A8EB:
	LDY.w #$0008
	STA.b $25
	LDA.b $08,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_XPosLo
	BCS.b CODE_18A90D
	EOR.w #$FFFF
	INC
	CMP.w #$0010
	BCC.b CODE_18A91C
	LDY.w #$000C
	CMP.b $25
	BCS.b CODE_18A91C
	LDY.w #$000A
	BRA.b CODE_18A91C

CODE_18A90D:
	CMP.w #$0010
	BCC.b CODE_18A91C
	LDY.w #$0004
	CMP.b $25
	BCS.b CODE_18A91C
	LDY.w #$0006
CODE_18A91C:
	STY.w $1100
	PLY
	RTS

CODE_18A921:
	PHP
	REP.b #$20
	LDA.w #$00B4
	STA.w $10FE
	LDA.w #$0802
	JSR.w CODE_18D832
	PLP
	RTS

CODE_18A932:
	LDY.b $0A,x
	LDA.b $08,x
	TAX
	JSR.w CODE_18AE20
	LDX.b $3D
	BIT.w #$8000
	RTS

CODE_18A940:
	LDY.b $0A,x
	INY
	LDA.b $08,x
	TAX
	JSR.w CODE_18AE20
	LDX.b $3D
	BIT.w #$C000
	RTS

CODE_18A94F:
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.b $08,x
	BCS.b CODE_18A95B
	EOR.w #$FFFF
	INC
CODE_18A95B:
	RTS

CODE_18A95C:
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.b $0A,x
	BCS.b CODE_18A968
	EOR.w #$FFFF
	INC
CODE_18A968:
	RTS

CODE_18A969:
	LDA.b $0C,x
	AND.w #$BFFF
	TAY
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	CMP.b $08,x
	TYA
	BCS.b CODE_18A97A
	ORA.w #$4000
CODE_18A97A:
	STA.b $0C,x
	RTS

CODE_18A97D:
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.b $0A,x
	TAY
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.b $08,x
	RTS

CODE_18A98B:
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$0010
	SEC
	SBC.b $0A,x
	BCS.b CODE_18A9A0
	EOR.w #$FFFF
	INC
	TAY
	LDA.w #$FFFF
	RTS

CODE_18A9A0:
	TAY
	LDA.w #$0001
	RTS

CODE_18A9A5:
	LDA.b $10,x
	CLC
	ADC.b $08,x
	STA.b $08,x
	CMP.b $28,x
	BCC.b CODE_18A9BA
	CMP.b $2A,x
	BCC.b CODE_18A9C4
	LDA.b $10,x
	BMI.b CODE_18A9C4
	BPL.b CODE_18A9BE
CODE_18A9BA:
	LDA.b $10,x
	BPL.b CODE_18A9C4
CODE_18A9BE:
	EOR.w #$FFFF
	INC
	STA.b $10,x
CODE_18A9C4:
	JMP.w CODE_188DBF

CODE_18A9C7:
	LDA.b $1C,x
	BEQ.b CODE_18A9CD
	DEC.b $1C,x
CODE_18A9CD:
	RTS

CODE_18A9CE:
	CMP.w #$0002
	BCS.b CODE_18A9F3
	LDY.w #$001E
CODE_18A9D6:
	LDA.w $1114,y
	BMI.b CODE_18A9E1
	DEY
	DEY
	BPL.b CODE_18A9D6
	SEC
	RTS

CODE_18A9E1:
	TYA
	STA.b $2E,x
	STA.b $30,x
	LDA.w #$0000
	STA.w $1114,y
	LDA.w #$8000
	STA.b $2C,x
	CLC
	RTS

CODE_18A9F3:
	LDY.w #$0018
CODE_18A9F6:
	LDA.w $1114,y
	AND.w $1116,y
	AND.w $1118,y
	AND.w $111A,y
	BMI.b CODE_18AA0A
	DEY
	DEY
	BPL.b CODE_18A9F6
	SEC
	RTS

CODE_18AA0A:
	TYA
	STA.b $2E,x
	CLC
	ADC.w #$0004
	STA.b $30,x
	LDA.w #$0000
	STA.w $1114,y
	STA.w $1116,y
	STA.w $1118,y
	STA.w $111A,y
	LDA.w #$C000
	STA.b $2C,x
	CLC
	RTS

CODE_18AA29:
	PHA
	PHY
	BIT.b $2C,x
	BPL.b CODE_18AA4E
	LDY.b $2E,x
	BMI.b CODE_18AA4E
	LDA.w #$FFFF
	STA.w $1114,y
	BIT.b $2C,x
	BVC.b CODE_18AA40
	STA.w $1116,y
CODE_18AA40:
	LDY.b $30,x
	BMI.b CODE_18AA4E
	STA.w $1114,y
	BIT.b $2C,x
	BVC.b CODE_18AA4E
	STA.w $1116,y
CODE_18AA4E:
	CPX.w $1136
	BNE.b CODE_18AA59
	LDA.w #$FFFF
	STA.w $1136
CODE_18AA59:
	PLY
	PLA
	RTS

CODE_18AA5C:
	STZ.b $12,x
	LDY.b $18,x
	LDA.w DATA_19895E,y
	STA.b $25
	JMP.w ($0025)

CODE_18AA68:
	LDA.b $14,x
	BRA.b CODE_18AA91

CODE_18AA6C:
	LDA.b $1C,x
	BEQ.b CODE_18AA71
	RTS

CODE_18AA71:
	LDA.w $0624
	CMP.w #$000E
	BNE.b CODE_18AA85
	LDA.b $00,x
	BIT.w #$1000
	BEQ.b CODE_18AA85
	DEC.b $1A,x
	JMP.w CODE_18AB89

CODE_18AA85:
	LDY.b $04,x
	LDA.w DATA_1988AC,y
	STA.b $25
	JMP.w ($0025)

CODE_18AA8F:
	LDA.b $08,x
CODE_18AA91:
	STA.b $25
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	SEC
	SBC.w #$000C
	BEQ.b CODE_18AA9E
	BCS.b CODE_18AAA3
CODE_18AA9E:
	JSR.w CODE_18AF79
	BRA.b CODE_18AAAC

CODE_18AAA3:
	STA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	LDA.w #$003C
	STA.w !RAM_SXAR_SpiderMan_HurtTimerLo
CODE_18AAAC:
	LDA.w #$FB40
	STA.w $0636
	LDA.w #$2002
	JSR.w CODE_18D832
	LDA.w $0624
	CMP.w #$0006
	BEQ.b CODE_18AACA
	CMP.w #$0012
	BEQ.b CODE_18AACA
	CMP.w #$0016
	BNE.b CODE_18AADA
CODE_18AACA:
	STZ.w $0636
	BIT.w $062C
	LDA.w #$FFFD
	BVC.b CODE_18AAE8
	LDA.w #$0003
	BRA.b CODE_18AAE8

CODE_18AADA:
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.b $25
	LDA.w #$FFFD
	BCC.b CODE_18AAE8
	LDA.w #$0003
CODE_18AAE8:
	LDX.w #$0620
	STA.b $14,x
	JSR.w CODE_188F5F
	LDA.w #$0018
	JMP.w CODE_188DD4

CODE_18AAF6:
	RTS

CODE_18AAF7:
	LDA.b $02,x
	INC
	INC
	LSR
	CMP.w $121A
	BNE.b CODE_18AB4F
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	JSR.w CODE_18ABCB
	DEC.w $121A
	BNE.b CODE_18AB50
	LDA.w #$2202
	JSR.w CODE_18D832
	PHX
	LDX.w #$02E0
	LDY.w #$0540
	JSR.w CODE_18AE20
	LDA.w #$0000
	STA.l $7E2000,x
	STA.l $7E2002,x
	TXA
	CLC
	ADC.w $0CBE
	TAX
	LDA.w #$0000
	STA.l $7E2000,x
	STA.l $7E2002,x
	TXA
	CLC
	ADC.w $0CBE
	TAX
	LDA.w #$0000
	STA.l $7E2000,x
	STA.l $7E2002,x
	PLX
CODE_18AB4F:
	RTS

CODE_18AB50:
	LDA.w #$2702
	JSR.w CODE_18D832
	RTS

CODE_18AB57:
	RTS

CODE_18AB58:
	LDA.w #$0030
	BRA.b CODE_18AB60

CODE_18AB5D:
	LDA.w #$0014
CODE_18AB60:
	CLC
	ADC.w !RAM_SXAR_SpiderMan_CurrentHPLo
	STA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	LDA.w #$2702
	JSR.w CODE_18D832
	BRA.b CODE_18ABCB

CODE_18AB6F:
	RTS

CODE_18AB70:
	INC.w !RAM_SXAR_Global_CurrentLivesLo
	DEC.w $010C
	LDA.w #$2702
	JSR.w CODE_18D832
	BRA.b CODE_18ABCB

CODE_18AB7E:
	RTS

CODE_18AB7F:
	PHX
	JSR.w CODE_189E44
	PLX
	LDA.b $08,x
	JMP.w CODE_18AA91

CODE_18AB89:
	LDA.b $1A,x
	BEQ.b CODE_18AB91
	DEC.b $1A,x
	BNE.b CODE_18ABA7
CODE_18AB91:
	LDA.w #$2602
	JSR.w CODE_18D832
	LDA.w #$0000
	JSR.w CODE_18B0AE
	LDY.b $04,x
	LDA.w DATA_1988D6,y
	STA.b $25
	JMP.w ($0025)

CODE_18ABA7:
	LDA.w #$000A
	STA.b $1C,x
	LDA.w #$0A02
	JSR.w CODE_18D832
	LDA.b $04,x
	CMP.w #$0008
	BNE.b CODE_18ABCA
	PHX
	PHY
	LDA.b $0A,x
	SEC
	SBC.w #$0008
	TAY
	LDA.b $08,x
	TAX
	JSR.w CODE_18AEF8
	PLY
	PLX
CODE_18ABCA:
	RTS

CODE_18ABCB:
	LDA.b $00,x
	BIT.w #$0800
	BEQ.b CODE_18ABD5
	JSR.w CODE_18B551
CODE_18ABD5:
	STZ.b $00,x
	JSR.w CODE_18AA29
	LDY.b $02,x
	BMI.b CODE_18AC02
	LDA.w $0CEE,y
	ORA.w #$0001
	STA.w $0CEE,y
	LDA.w $0E6E,y
	BIT.w #$0002
	BEQ.b CODE_18ABF9
	LDA.w $0CEE,y
	ORA.w #$0002
	STA.w $0CEE,y
	RTS

CODE_18ABF9:
	LDA.w $0CEE,y
	AND.w #$7FFF
	STA.w $0CEE,y
CODE_18AC02:
	RTS

CODE_18AC03:
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	JMP.w CODE_18ABCB

CODE_18AC0E:
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	JSR.w CODE_18ABCB
	LDA.b $0C,x
	PHA
	JSR.w CODE_18B201
	PLA
	STA.b $0C,x
	LDA.w #$0014
	STA.b $04,x
	RTS

CODE_18AC28:
	LDY.b $04,x
	LDA.w DATA_198900,y
	JSR.w CODE_18C121
	LDA.w #$0004
	JSR.w CODE_18B0AE
	JSR.w CODE_18ABCB
	LDA.b $0C,x
	PHA
	JSR.w CODE_18B201
	PLA
	STA.b $0C,x
	LDA.w #$0016
	STA.b $04,x
	RTS

CODE_18AC48:
	JMP.w CODE_18ACF9

CODE_18AC4B:
	LDA.b $89
	BEQ.b CODE_18AC48
	JSR.w CODE_18AC83
	LDX.b $3D
	BIT.w #$8000
	BNE.b CODE_18AC81
	BIT.w #$4000
	BEQ.b CODE_18AC7C
	LDY.w $0624
	CPY.w #$000E
	BEQ.b CODE_18AC7C
	CPY.w #$0006
	BEQ.b CODE_18AC7C
	LDY.w $0CD6
	CPY.w #$0008
	BEQ.b CODE_18AC78
	BIT.w $11FE
	BPL.b CODE_18AC7C
CODE_18AC78:
	BIT.b $89
	BPL.b CODE_18AC81
CODE_18AC7C:
	JSR.w CODE_18AF0E
	CLC
	RTS

CODE_18AC81:
	SEC
	RTS

CODE_18AC83:
	LDY.b $08,x
	LDA.b $0A,x
	CLC
	ADC.b $89
	BIT.b $89
	BPL.b CODE_18AC92
	SEC
	SBC.w #$002F
CODE_18AC92:
	TYX
	TAY
	LDA.w #$0007
CODE_18AC97:
	STY.b $27
	STA.b $29
	TXA
	SEC
	SBC.b $29
	BCS.b CODE_18ACA4
	LDA.w #$0000
CODE_18ACA4:
	AND.w #$FFF8
	STA.b $2B
	TXA
	CLC
	ADC.b $29
	CMP.w $0CB6
	BCC.b CODE_18ACB6
	LDA.w $0CB6
	DEC
CODE_18ACB6:
	AND.w #$FFF8
	TAX
	SEC
	SBC.b $2B
	LSR
	LSR
	LSR
	INC
	STA.b $2B
	STZ.b $8B
	STZ.b $8D
CODE_18ACC7:
	STX.b $25
	LDY.b $27
	JSR.w CODE_18AE20
	ORA.b $8B
	STA.b $8B
	TYA
	AND.w #$07FF
	CMP.b $8D
	BCC.b CODE_18ACDC
	STA.b $8D
CODE_18ACDC:
	LDA.b $25
	SEC
	SBC.w #$0008
	TAX
	DEC.b $2B
	BNE.b CODE_18ACC7
CODE_18ACE7:
	LDY.b $8D
	STY.b $95
	LDA.b $8B
	STA.b $93
	RTS

CODE_18ACF0:
	LDA.w #$8000
	STA.b $8B
	STZ.b $8D
	BRA.b CODE_18ACE7

CODE_18ACF9:
	STZ.b $8B
	STZ.b $8D
	LDA.w #$0000
	TAY
	CLC
	RTS

CODE_18AD03:
	LDA.b $87
	BEQ.b CODE_18ACF9
	JSR.w CODE_18AD1B
	LDX.b $3D
	BIT.w #$8000
	BNE.b CODE_18AD16
	JSR.w CODE_18AF0E
	CLC
	RTS

CODE_18AD16:
	JSR.w CODE_18AF0E
	SEC
	RTS

CODE_18AD1B:
	LDY.b $0A,x
	LDA.b $08,x
	CLC
	ADC.b $87
	CMP.w $0CB6
	BCS.b CODE_18AD86
	BIT.b $87
	BPL.b CODE_18AD31
	SEC
	SBC.w #$0007
	BRA.b CODE_18AD35

CODE_18AD31:
	CLC
	ADC.w #$0007
CODE_18AD35:
	TAX
	LDA.w #$002F
	STX.b $2D
	STA.b $29
	TYA
	SEC
	SBC.b $29
	BCS.b CODE_18AD46
	LDA.w #$0000
CODE_18AD46:
	AND.w #$FFF8
	STA.b $2B
	TYA
	AND.w #$FFF8
	TAY
	SEC
	SBC.b $2B
	LSR
	LSR
	LSR
	INC
	STA.b $2B
	STZ.b $8B
	STZ.b $8D
CODE_18AD5D:
	STY.b $27
	LDX.b $2D
	JSR.w CODE_18AE20
	ORA.b $8B
	STA.b $8B
	TYA
	AND.w #$07FF
	CMP.b $8D
	BCC.b CODE_18AD72
	STA.b $8D
CODE_18AD72:
	LDA.b $27
	SEC
	SBC.w #$0008
	TAY
	DEC.b $2B
	BNE.b CODE_18AD5D
CODE_18AD7D:
	LDY.b $8D
	STY.b $91
	LDA.b $8B
	STA.b $8F
	RTS

CODE_18AD86:
	LDA.w #$8000
	STA.b $8B
	STZ.b $8D
	BRA.b CODE_18AD7D

CODE_18AD8F:
	LDA.b $0E,x
	CMP.w #$0100
	BEQ.b CODE_18ADCA
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w $120C
	TAY
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.w $120A
	TAX
	JSR.w CODE_18ADD2
	BIT.w #$8000
	BNE.b CODE_18ADCE
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	SEC
	SBC.w #$002F
	SEC
	SBC.w $120C
	TAY
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	SEC
	SBC.w $120A
	TAX
	JSR.w CODE_18ADD2
	BIT.w #$8000
	BNE.b CODE_18ADCE
CODE_18ADCA:
	LDX.b $3D
	CLC
	RTS

CODE_18ADCE:
	LDX.b $3D
	SEC
	RTS

CODE_18ADD2:
	REP.b #$20
	CPX.w #$0200
	BCS.b CODE_18AE14
	CPY.w #$0200
	BCS.b CODE_18AE14
	STX.b $6F
	STY.b $71
	TXA
	LSR
	LSR
	LSR
	LSR
	STA.b $6B
	TYA
	LSR
	LSR
	LSR
	LSR
	STA.b $6D
	LDA.w #$0040
	SEP.b #$20
	STA.w $211B
	XBA
	STA.w $211B
	LDA.b $6D
	STA.w $211C
	STA.w $211C
	REP.b #$20
	LDA.b $6B
	ASL
	CLC
	ADC.w $2134
	TAX
	LDA.l $7EC000,x
	BRA.b CODE_18AE60

CODE_18AE14:
	LDA.w #$0000
	TAY
	STA.b $69
	STA.b $67
	LDX.w #$0000
	RTS

CODE_18AE20:
	REP.b #$20
	CPX.w $0CB6
	BCS.b CODE_18AE14
	CPY.w $0CBC
	BCS.b CODE_18AE14
	STX.b $6F
	STY.b $71
	TXA
	LSR
	LSR
	LSR
	LSR
	STA.b $6B
	TYA
	LSR
	LSR
	LSR
	LSR
	STA.b $6D
	LDA.w $0CBE
	SEP.b #$20
	STA.w $211B
	XBA
	STA.w $211B
	LDA.b $6D
	STA.w $211C
	STA.w $211C
	REP.b #$20
	LDA.b $6B
	ASL
	CLC
	ADC.w $2134
	TAX
	LDA.l $7E2000,x
CODE_18AE60:
	STA.b $67
	AND.w #$000E
	STA.b $73
	LDA.b $67
	AND.w #$03E0
	LSR
	ORA.b $73
	STA.b $69
	ASL
	ASL
	TAY
	BIT.b $67
	BMI.b CODE_18AEB8
	BVS.b CODE_18AE99
	LDA.w #$0008
	BIT.b $71
	BNE.b CODE_18AE8D
	BIT.b $6F
	BNE.b CODE_18AE89
	LDA.b ($A1),y
	TAY
	RTS

CODE_18AE89:
	LDA.b ($A3),y
	TAY
	RTS

CODE_18AE8D:
	BIT.b $6F
	BNE.b CODE_18AE95
	LDA.b ($A5),y
	TAY
	RTS

CODE_18AE95:
	LDA.b ($A7),y
	TAY
	RTS

CODE_18AE99:
	LDA.w #$0008
	BIT.b $71
	BNE.b CODE_18AEAC
	BIT.b $6F
	BNE.b CODE_18AEA8
	LDA.b ($A3),y
	TAY
	RTS

CODE_18AEA8:
	LDA.b ($A1),y
	TAY
	RTS

CODE_18AEAC:
	BIT.b $6F
	BNE.b CODE_18AEB4
	LDA.b ($A7),y
	TAY
	RTS

CODE_18AEB4:
	LDA.b ($A5),y
	TAY
	RTS

CODE_18AEB8:
	BVS.b CODE_18AED9
	LDA.w #$0008
	BIT.b $71
	BEQ.b CODE_18AECD
	BIT.b $6F
	BNE.b CODE_18AEC9
	LDA.b ($A1),y
	TAY
	RTS

CODE_18AEC9:
	LDA.b ($A3),y
	TAY
	RTS

CODE_18AECD:
	BIT.b $6F
	BNE.b CODE_18AED5
	LDA.b ($A5),y
	TAY
	RTS

CODE_18AED5:
	LDA.b ($A7),y
	TAY
	RTS

CODE_18AED9:
	LDA.w #$0008
	BIT.b $71
	BEQ.b CODE_18AEEC
	BIT.b $6F
	BNE.b CODE_18AEE8
	LDA.b ($A3),y
	TAY
	RTS

CODE_18AEE8:
	LDA.b ($A1),y
	TAY
	RTS

CODE_18AEEC:
	BIT.b $6F
	BNE.b CODE_18AEF4
	LDA.b ($A7),y
	TAY
	RTS

CODE_18AEF4:
	LDA.b ($A5),y
	TAY
	RTS

CODE_18AEF8:
	LDA.w #$35C2
	PHA
	JSR.w CODE_18AE20
	LDA.b $67
	AND.w #$03FF
	BNE.b CODE_18AF0C
	PLA
	STA.l $7E2000,x
	RTS

CODE_18AF0C:
	PLA
	RTS

CODE_18AF0E:
	PHA
	CPX.w #$0620
	BNE.b CODE_18AF1C
	LDA.b $8D
	CMP.b $9F
	BCC.b CODE_18AF1C
	STA.b $9F
CODE_18AF1C:
	PLA
	RTS

CODE_18AF1E:
	PHP
	REP.b #$30
	LDA.w $0620
	BPL.b CODE_18AF30
	LSR
	BCS.b CODE_18AF30
	LDA.b $9F
	ASL
	TAX
	JSR.w (DATA_18AF46,x)
CODE_18AF30:
	PLP
	RTS

CODE_18AF32:
	PHP
	REP.b #$30
	LDA.w $0620
	BPL.b CODE_18AF44
	LSR
	BCS.b CODE_18AF30
	LDA.b $9D
	ASL
	TAX
	JSR.w (DATA_18AF46,x)
CODE_18AF44:
	PLP
	RTS

DATA_18AF46:
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF8F
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF78
	dw CODE_18AF79

CODE_18AF78:
	RTS

CODE_18AF79:
	LDA.w $0620
	ORA.w #$0001
	STA.w $0620
	LDA.w #$0064
	STA.w $10FA
	STZ.w !RAM_SXAR_SpiderMan_CurrentHPLo
	STZ.w !RAM_SXAR_SpiderMan_HurtTimerLo
	RTS

CODE_18AF8F:
	LDA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	BNE.b CODE_18AFB4
	LDA.w $0620
	LSR
	BCS.b CODE_18AFB4
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	SEC
	SBC.w #$0006
	BEQ.b CODE_18AF79
	BCC.b CODE_18AF79
	STA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	LDA.w #$2002
	JSR.w CODE_18D832
	LDA.w #$0019
	STA.w !RAM_SXAR_SpiderMan_HurtTimerLo
CODE_18AFB4:
	RTS

CODE_18AFB5:
	LDA.w $0620
	BPL.b CODE_18B005
	LSR
	BCS.b CODE_18B005
	LDA.b $1E,x
	CLC
	ADC.w $063E
	STA.b $25
	LDA.b $0E,x
	BEQ.b CODE_18B005
	ASL
	ASL
	TAY
	LDA.w DATA_199623,y
	BIT.b $0C,x
	BVC.b CODE_18AFD7
	EOR.w #$FFFF
	INC
CODE_18AFD7:
	CLC
	ADC.b $08,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_XPosLo
	BCS.b CODE_18AFE4
	EOR.w #$FFFF
	INC
CODE_18AFE4:
	CMP.b $25
	BCS.b CODE_18B005
	LDA.b $0A,x
	CLC
	ADC.w DATA_199623+$02,y
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BCS.b CODE_18AFFF
	EOR.w #$FFFF
	INC
	CMP.w $0640
	BCC.b CODE_18B003
	BRA.b CODE_18B005

CODE_18AFFF:
	CMP.b $20,x
	BCS.b CODE_18B005
CODE_18B003:
	SEC
	RTS

CODE_18B005:
	CLC
	RTS

CODE_18B007:
	BIT.w $0620
	BPL.b CODE_18B005
	LDA.b $22,x
	BEQ.b CODE_18B005
	ASL
	ASL
	TAY
	LDA.w DATA_199623+$04,y
	CLC
	ADC.w $063E
	STA.b $25
	LDA.w DATA_199623,y
	BIT.b $24,x
	BVC.b CODE_18B027
	EOR.w #$FFFF
	INC
CODE_18B027:
	CLC
	ADC.b $14,x
	SEC
	SBC.w !RAM_SXAR_SpiderMan_XPosLo
	BCS.b CODE_18B034
	EOR.w #$FFFF
	INC
CODE_18B034:
	CMP.b $25
	BCS.b CODE_18B005
	LDA.b $16,x
	CLC
	ADC.w DATA_199623+$02,y
	SEC
	SBC.w !RAM_SXAR_SpiderMan_YPosLo
	BCS.b CODE_18B04F
	EOR.w #$FFFF
	INC
	CMP.w $0640
	BCS.b CODE_18B005
	BRA.b CODE_18B054

CODE_18B04F:
	CMP.w DATA_199623+$06,y
	BCS.b CODE_18B005
CODE_18B054:
	SEC
	RTS

CODE_18B056:
	PHP
	REP.b #$30
	LDY.w #$000E
CODE_18B05C:
	STY.b $3B
	LDX.w DATA_198CD5,y
	BIT.b $2C,x
	BPL.b CODE_18B071
	STX.b $3D
	LDY.b $32,x
	LDA.w DATA_198988,y
	STA.b $25
	JSR.w CODE_189B8F
CODE_18B071:
	LDY.b $3B
	DEY
	DEY
	BPL.b CODE_18B05C
	PLP
	RTS

CODE_18B079:
	PHY
	LDY.w #$000E
CODE_18B07D:
	LDX.w DATA_198CD5,y
	LDA.b $2C,x
	BPL.b CODE_18B08B
	DEY
	DEY
	BPL.b CODE_18B07D
	PLY
	CLC
	RTS

CODE_18B08B:
	PLY
	SEC
	RTS

CODE_18B08E:
	LDA.w #$8000
	STA.b $2C,x
	LDA.b $6F
	STA.b $2E,x
	LDA.b $71
	STA.b $30,x
	LDA.w #$3000
	STA.b $3C,x
	LDA.w $10F0
	STA.b $32,x
	STZ.b $3A,x
	STZ.b $34,x
	STZ.b $36,x
	STZ.b $38,x
	RTS

CODE_18B0AE:
	PHX
	PHY
	STA.w $10F0
	STX.w $10F2
	TXY
	TAX
	LDA.w $0008,y
	STA.b $6F
	LDA.w $000A,y
	STA.b $71
	JSR.w (DATA_18B0D8,x)
	PLY
	PLX
	RTS

CODE_18B0C8:
	PHX
	PHY
	STA.w $10F0
	STX.b $6F
	STY.b $71
	TAX
	JSR.w (DATA_18B0D8,x)
	PLY
	PLX
	RTS

DATA_18B0D8:
	dw CODE_18B0E0
	dw CODE_18B179
	dw CODE_18B1A4
	dw CODE_18B1EA

CODE_18B0E0:
	LDA.w $0CD6
	CMP.w #$0008
	BEQ.b CODE_18B0EF
	LDA.b $39
	AND.w #$0003
	BNE.b CODE_18B106
CODE_18B0EF:
	JSR.w CODE_18B079
	BCC.b CODE_18B147
	JSR.w CODE_18B08E
	LDA.w #$0023
	STA.b $38,x
	STZ.b $34,x
	STZ.b $36,x
	LDA.w #$0016
	JMP.w CODE_1898C2

CODE_18B106:
	JSR.w CODE_18B079
	BCC.b CODE_18B147
	JSR.w CODE_18B08E
	LDA.w #$0037
	STA.b $38,x
	LDA.w #$FFFC
	STA.b $34,x
	LDA.w #$F800
	STA.b $36,x
	LDA.w #$0016
	JSR.w CODE_1898C2
	JSR.w CODE_18B079
	BCC.b CODE_18B147
	JSR.w CODE_18B08E
	LDA.w #$0037
	STA.b $38,x
	LDA.w #$0004
	STA.b $34,x
	LDA.w #$F800
	STA.b $36,x
	LDA.b $3C,x
	ORA.w #$4000
	STA.b $3C,x
	LDA.w #$0016
	JSR.w CODE_1898C2
CODE_18B147:
	RTS

CODE_18B148:
	JSR.w CODE_1898CA
	BCS.b CODE_18B176
	LDA.b $34,x
	BEQ.b CODE_18B172
	CLC
	ADC.b $2E,x
	STA.b $2E,x
	LDA.b $36,x
	CLC
	ADC.w #$00A0
	STA.b $36,x
	BPL.b CODE_18B169
	XBA
	AND.w #$00FF
	ORA.w #$FF00
	BRA.b CODE_18B16D

CODE_18B169:
	XBA
	AND.w #$00FF
CODE_18B16D:
	CLC
	ADC.b $30,x
	STA.b $30,x
CODE_18B172:
	DEC.b $38,x
	BNE.b CODE_18B178
CODE_18B176:
	STZ.b $2C,x
CODE_18B178:
	RTS

CODE_18B179:
	JSR.w CODE_18B079
	BCC.b CODE_18B19B
	JSR.w CODE_18B08E
	LDA.b $71
	SEC
	SBC.w #$0008
	AND.w #$FFF8
	ORA.w #$0007
	STA.b $30,x
	LDA.w #$0702
	JSR.w CODE_18D832
	LDA.w #$000E
	JMP.w CODE_1898C2

CODE_18B19B:
	RTS

CODE_18B19C:
	JSR.w CODE_1898CA
	BCC.b CODE_18B1A3
	STZ.b $2C,x
CODE_18B1A3:
	RTS

CODE_18B1A4:
	JSR.w CODE_18B079
	BCC.b CODE_18B1C1
	JSR.w CODE_18B08E
	LDA.b $2E,x
	SEC
	SBC.w #$0040
	STA.b $2E,x
	LDA.b $30,x
	SEC
	SBC.w #$0020
	STA.b $30,x
	LDA.w #$012C
	STA.b $38,x
CODE_18B1C1:
	RTS

CODE_18B1C2:
	LDA.b $38,x
	BEQ.b CODE_18B1CF
	DEC.b $38,x
	LDA.b $38,x
	AND.w #$0007
	BEQ.b CODE_18B1D0
CODE_18B1CF:
	RTS

CODE_18B1D0:
	PHX
	JSR.w CODE_18D8BB
	AND.w #$003F
	CLC
	ADC.b $30,x
	TAY
	JSR.w CODE_18D8BB
	AND.w #$007F
	CLC
	ADC.b $2E,x
	TAX
	JSR.w CODE_18AEF8
	PLX
	RTS

CODE_18B1EA:
	JSR.w CODE_18B079
	BCC.b CODE_18B1F8
	JSR.w CODE_18B08E
	LDA.w #$0020
	JMP.w CODE_1898C2

CODE_18B1F8:
	RTS

CODE_18B1F9:
	JSR.w CODE_1898CA
	BCC.b CODE_18B1F8
	STZ.b $2C,x
	RTS

CODE_18B201:
	PHP
	REP.b #$20
	LDA.w #$8000
	STA.b $00,x
	LDA.w #$FFFF
	STA.b $06,x
	STA.b $2E,x
	STA.b $30,x
	LDA.w #$2000
	STA.b $0C,x
	LDA.w #$0002
	STA.b $1A,x
	LDA.w #$FFFF
	STA.b $02,x
	STZ.b $04,x
	STZ.b $0E,x
	STZ.b $32,x
	STZ.b $14,x
	STZ.b $16,x
	STZ.b $10,x
	STZ.b $12,x
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	STZ.b $1C,x
	STZ.b $28,x
	STZ.b $2A,x
	STZ.b $2C,x
	PLP
	RTS

CODE_18B23F:
	PHP
	REP.b #$30
	LDA.w #$FFFF
	STA.w $10F4
	PLP
	RTS

CODE_18B24A:
	PHP
	SEP.b #$20
	STZ.b $66
	REP.b #$30
	STZ.b $97
	STZ.b $99
	STZ.w $0CD8
	STZ.w $0CE6
	STZ.w $10FA
	STZ.w $10FC
	STZ.w $113C
	STZ.w $10FE
	STZ.w $1148
	STZ.w $114A
	STZ.w $114C
	STZ.w $1150
	STZ.w $1152
	STZ.w $11F6
	STZ.w $1154
	STZ.w $11FC
	STZ.w $1200
	STZ.w $1202
	STZ.w $1206
	STZ.w $121A
	STZ.w $1208
	STZ.w $120E
	LDA.w #$0080
	STA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	LDA.w #$0000
	BIT.w $10F4
	BMI.b CODE_18B2A2
	LDA.w #$0050
CODE_18B2A2:
	STA.w !RAM_SXAR_SpiderMan_HurtTimerLo
	LDA.w #$FFFF
	STA.b $60
	LDA.w #$0016
	STA.w $1134
	LDA.w #$FFFF
	STA.w $1136
	STA.w $1100
	STA.w $11FE
	STA.w $1204
	LDX.w #$0620
	LDY.w #$000C
CODE_18B2C5:
	STZ.b $00,x
	TXA
	CLC
	ADC.w #$0034
	TAX
	DEY
	BNE.b CODE_18B2C5
	LDX.w #$0890
	LDY.w #$0008
CODE_18B2D6:
	STZ.b $00,x
	TXA
	CLC
	ADC.w #$0012
	TAX
	DEY
	BNE.b CODE_18B2D6
	LDX.w #$0920
	LDY.w #$0008
CODE_18B2E7:
	STZ.b $12,x
	TXA
	CLC
	ADC.w #$002C
	TAX
	DEY
	BNE.b CODE_18B2E7
	LDX.w #$0A80
	LDY.w #$0008
CODE_18B2F8:
	STZ.b $2C,x
	TXA
	CLC
	ADC.w #$0042
	TAX
	DEY
	BNE.b CODE_18B2F8
	LDX.w #$0000
CODE_18B306:
	STZ.w $1114,x
	INX
	INX
	CPX.w #$0020
	BNE.b CODE_18B306
	LDA.w #$FFFF
	STA.w $112C
	STA.w $112E
	STA.w $1130
	STA.w $1132
	PLP
	RTS

CODE_18B321:
	PHP
	REP.b #$30
	LDX.w $0CD6
	CPX.w #$0002
	BNE.b CODE_18B332
	LDA.w #$FFFF
	STA.w $114C
CODE_18B332:
	CPX.w #$0004
	BNE.b CODE_18B33D
	LDA.w #$0014
	STA.w $121A
CODE_18B33D:
	CPX.w #$0008
	BNE.b CODE_18B348
	LDA.w #$FFFF
	STA.w $1208
CODE_18B348:
	LDA.w DATA_1989A4,x
	STA.b $25
	LDY.w #$0000
	LDA.b ($25),y
	STA.w $0CB2
	ASL
	STA.w $0CBE
	ASL
	ASL
	ASL
	STA.w $0CB6
	INY
	INY
	LDA.b ($25),y
	STA.w $0CB8
	ASL
	ASL
	ASL
	ASL
	STA.w $0CBC
	INY
	INY
	LDA.b ($25),y
	STA.w $0CB4
	ASL
	STA.w $0CC0
	INY
	INY
	LDA.b ($25),y
	STA.w $0CBA
	INY
	INY
	LDA.b ($25),y
	STA.w $0CC2
	INY
	INY
	LDA.b ($25),y
	STA.w $0CC4
	INY
	INY
	LDA.b ($25),y
	STA.w $0CC6
	INY
	INY
	LDA.b ($25),y
	STA.w $0CC8
	INY
	INY
	LDA.b ($25),y
	STA.w $0CCA
	INY
	INY
	LDA.b ($25),y
	STA.w $0CCC
	INY
	INY
	LDA.b ($25),y
	STA.b $58
	INY
	INY
	LDA.b ($25),y
	STA.b $5C
	INY
	INY
	LDA.b ($25),y
	STA.w !RAM_SXAR_SpiderMan_XPosLo
	INY
	INY
	LDA.b ($25),y
	STA.w !RAM_SXAR_SpiderMan_YPosLo
	INY
	INY
	LDA.b ($25),y
	STA.w $062C
	INY
	INY
	LDA.b ($25),y
	STA.b $A1
	INC
	INC
	STA.b $A3
	INC
	INC
	STA.b $A5
	INC
	INC
	STA.b $A7
	INY
	INY
	LDA.b ($25),y
	STA.w $0CCE
	INY
	INY
	LDA.b ($25),y
	STA.w $0CD0
	BIT.w $10F4
	BPL.b CODE_18B442
	STZ.w $10F4
	LDX.w #$007E
CODE_18B3F5:
	STZ.w $0CEE,x
	DEX
	DEX
	BPL.b CODE_18B3F5
	LDA.b $58
	STA.w $1102
	LDA.b $5C
	STA.w $1104
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	STA.w $1106
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	STA.w $1108
	LDA.w $062C
	STA.w $110A
	LDY.w #!Define_SXAR_Graphics_Sprite_GlobalSpiderManLevelSprites
	LDX.w #$7F9300
	JSR.w CODE_18B517
	LDY.w $0CC2
	LDX.w #$7F1300
	JSR.w CODE_18B517
	LDY.w $0CC8
	LDX.w #$7F9F00
	JSR.w CODE_18B517
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F0B00>>16)
	LDX.w #$7F0B00
	LDY.w #!Define_SXAR_Graphics_Sprite_WebSwing
	JSL.l CODE_18CD28
	BRA.b CODE_18B45E

CODE_18B442:
	LDA.w $1102
	STA.b $58
	LDA.w $1104
	STA.b $5C
	LDA.w $1106
	STA.w !RAM_SXAR_SpiderMan_XPosLo
	LDA.w $1108
	STA.w !RAM_SXAR_SpiderMan_YPosLo
	LDX.w #$0032
	JSR.w CODE_18D946
CODE_18B45E:
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7E2000>>16)
	LDX.w #$7E2000
	LDY.w $0CCE
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7EC000>>16)
	LDX.w #$7EC000
	LDY.w $0CD0
	BEQ.b CODE_18B47C
	JSL.l CODE_18CD28
	BRA.b CODE_18B489

CODE_18B47C:
	LDA.w #$0000
	LDX.w #$3FFE
CODE_18B482:
	STA.l $7EC000,x
	DEX
	BPL.b CODE_18B482
CODE_18B489:
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDX.w #$6000
	LDY.w #!Define_SXAR_Graphics_Layer3_SmallAndLargeFont
	JSL.l CODE_18CD28
	JSR.w CODE_18B49B
	PLP
	RTS

CODE_18B49B:
	PHP
	REP.b #$30
	LDY.w #$0400
	LDX.w #$0000
	LDA.w #$2000
CODE_18B4A7:
	STA.l $7F0300,x
	INX
	INX
	DEY
	BNE.b CODE_18B4A7
	PLP
	RTS

CODE_18B4B2:
	PHP
	REP.b #$30
	LDA.w #$8000
	LDX.w #$7F1300
	LDY.w #$2000
	JSR.w CODE_18B524
	LDA.w #$4000
	LDX.w #$7F9300
	LDY.w #$0000
	JSR.w CODE_18B524
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000420>>16)
	LDX.w #$000420
	LDY.w #!Define_SXAR_Palette_GetReadySpiderMan
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($00440>>16)
	LDX.w #$000440
	LDY.w $0CCA
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000520>>16)
	LDX.w #$000520
	LDY.w #!Define_SXAR_Palette_SpiderMan
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000540>>16)
	LDX.w #$000540
	LDY.w $0CCC
	JSL.l CODE_18CD28
	LDA.w $0CD6
	CMP.w #$0008
	BNE.b CODE_18B50F
	LDA.w #$0000
	STA.w $0420
CODE_18B50F:
	LDA.w $0420
	STA.w $053E
	PLP
	RTS

CODE_18B517:
	CPY.w #$8000
	BCS.b CODE_18B523
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($7F9300>>16)
	JSL.l CODE_18CD28
CODE_18B523:
	RTS

CODE_18B524:
	PHA
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7F1300>>16
	STA.w $4314
	REP.b #$20
	PLA
	STY.w $2116
	STX.w $4312
	STA.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$20
	RTS

CODE_18B551:
	PHX
	PHY
	LDX.w #$001E
	LDA.w #$0000
CODE_18B559:
	STA.l $7EC000,x
	STA.l $7EC040,x
	STA.l $7EC080,x
	STA.l $7EC0C0,x
	STA.l $7EC100,x
	STA.l $7EC140,x
	STA.l $7EC180,x
	STA.l $7EC1C0,x
	STA.l $7EC200,x
	STA.l $7EC240,x
	STA.l $7EC280,x
	STA.l $7EC2C0,x
	STA.l $7EC300,x
	STA.l $7EC340,x
	STA.l $7EC380,x
	STA.l $7EC3C0,x
	DEX
	DEX
	BPL.b CODE_18B559
	PLY
	PLX
	RTS

CODE_18B5A0:
	JSR.w CODE_18A328
	LDY.b $0E,x
	BEQ.b CODE_18B551
	CPY.w #$00EE
	BCC.b CODE_18B60C
	LDA.w DATA_199A2B,y
	STA.b $25
	LDY.w #$0000
	LDA.b ($25),y
	LDA.w #$0008
	STA.b $41
	LDY.w #$0002
	LDA.b ($25),y
	LDA.w #$0009
	STA.b $47
	LDX.w #$0000
	BIT.w $1204
	BMI.b CODE_18B5D0
	LDX.w #$0012
CODE_18B5D0:
	SEP.b #$10
	REP.b #$10
	LDY.w #$0000
	BIT.b $4B
	BVS.b CODE_18B60D
	LDA.b $41
	ASL
	SEC
	SBC.w #$0002
	TAX
CODE_18B5E3:
	STX.b $45
	LDA.b $41
	STA.b $43
CODE_18B5E9:
	LDA.b ($25),y
	EOR.w #$4000
	CLC
	ADC.w #$0100
	ORA.w #$2000
	STA.l $7EC000,x
	INY
	INY
	DEX
	DEX
	DEC.b $43
	BNE.b CODE_18B5E9
	LDA.b $45
	CLC
	ADC.w #$0040
	TAX
	DEC.b $47
	BNE.b CODE_18B5E3
CODE_18B60C:
	RTS

CODE_18B60D:
	LDX.w #$0000
CODE_18B610:
	STX.b $45
	LDA.b $41
	STA.b $43
CODE_18B616:
	LDA.b ($25),y
	CLC
	ADC.w #$0100
	ORA.w #$2000
	STA.l $7EC000,x
	INY
	INY
	INX
	INX
	DEC.b $43
	BNE.b CODE_18B616
	LDA.b $45
	CLC
	ADC.w #$0040
	TAX
	DEC.b $47
	BNE.b CODE_18B610
	RTS

CODE_18B637:
	PHP
	SEP.b #$20
	LDA.b #$00
	STA.w $2101
	PLP
	RTS

CODE_18B641:
	PHP
	REP.b #$30
	STZ.b $4E
	STZ.b $50
	STZ.w $0400
	STZ.w $0402
	STZ.w $0404
	STZ.w $0406
	STZ.w $0408
	STZ.w $040A
	STZ.w $040C
	STZ.w $040E
	STZ.w $0410
	STZ.w $0412
	STZ.w $0414
	STZ.w $0416
	STZ.w $0418
	STZ.w $041A
	STZ.w $041C
	STZ.w $041E
	LDA.w #$00D0
	STA.b $41
	LDA.w #$000E
	STA.b $47
	LDA.w #$3026
	STA.b $4B
	JSR.w CODE_18BB7A
	JSR.w CODE_18B9F9
	LDX.w #$0620
	JSR.w CODE_18B75A
	LDY.w #$0000
CODE_18B696:
	STY.b $3B
	LDX.w DATA_198CC5,y
	LDA.b $12,x
	BPL.b CODE_18B6B8
	LDA.b $14,x
	SEC
	SBC.b $58
	STA.b $41
	LDA.b $16,x
	SEC
	SBC.b $5C
	STA.b $47
	LDA.b $24,x
	STA.b $4B
	LDY.b $22,x
	JSR.w CODE_18B7A5
	LDY.b $3B
CODE_18B6B8:
	TYA
	CLC
	ADC.w #$0002
	TAY
	CPY.w #$0010
	BCC.b CODE_18B696
	LDY.w #$0002
CODE_18B6C6:
	STY.b $3B
	LDX.w DATA_198C9D,y
	LDA.b $00,x
	BPL.b CODE_18B6D4
	JSR.w CODE_18B75A
	LDY.b $3B
CODE_18B6D4:
	TYA
	CLC
	ADC.w #$0002
	TAY
	CPY.w #$0018
	BCC.b CODE_18B6C6
	JSR.w CODE_18BAD9
	LDY.w #$0000
CODE_18B6E5:
	STY.b $3B
	LDX.w DATA_198CD5,y
	LDA.b $2C,x
	BPL.b CODE_18B707
	LDA.b $2E,x
	SEC
	SBC.b $58
	STA.b $41
	LDA.b $30,x
	SEC
	SBC.b $5C
	STA.b $47
	LDA.b $3C,x
	STA.b $4B
	LDY.b $3A,x
	JSR.w CODE_18B7A5
	LDY.b $3B
CODE_18B707:
	TYA
	CLC
	ADC.w #$0002
	TAY
	CPY.w #$0010
	BCC.b CODE_18B6E5
	LDY.w #$0000
CODE_18B715:
	STY.b $3B
	LDX.w DATA_198CB5,y
	LDA.b $00,x
	BPL.b CODE_18B737
	LDA.b $02,x
	SEC
	SBC.b $58
	STA.b $41
	LDA.b $04,x
	SEC
	SBC.b $5C
	STA.b $47
	LDA.b $10,x
	STA.b $4B
	LDY.b $0E,x
	JSR.w CODE_18B7A5
	LDY.b $3B
CODE_18B737:
	TYA
	CLC
	ADC.w #$0002
	TAY
	CPY.w #$0010
	BCC.b CODE_18B715
	LDX.b $4E
	CPX.w #$0200
	BEQ.b CODE_18B758
	LDA.w #$E020
CODE_18B74C:
	STA.w $0200,x
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_18B74C
CODE_18B758:
	PLP
CODE_18B759:
	RTS

CODE_18B75A:
	LDA.b $0A,x
	SEC
	SBC.b $5C
	STA.b $47
	LDA.b $08,x
	SEC
	SBC.b $58
	SEC
	SBC.w $1200
	STA.b $41
	LDA.w #$0000
	LDY.b $1C,x
	BEQ.b CODE_18B776
	LDA.w #$0200
CODE_18B776:
	EOR.b $0C,x
	STA.b $4B
	LDA.b $00,x
	BIT.w #$0800
	BNE.b CODE_18B79E
	BIT.b $2C,x
	BPL.b CODE_18B7A1
	LDY.b $30,x
	BMI.b CODE_18B78E
	LDA.w DATA_1991A5,y
	STA.b $49
CODE_18B78E:
	LDY.b $32,x
	BEQ.b CODE_18B759
	CPY.w #$00BE
	BCC.b CODE_18B7A5
	CPY.w #$00EE
	BCS.b CODE_18B79E
	BRA.b CODE_18B7A7

CODE_18B79E:
	JMP.w CODE_18B5A0

CODE_18B7A1:
	LDY.b $0E,x
	BEQ.b CODE_18B759
CODE_18B7A5:
	STZ.b $49
CODE_18B7A7:
	LDA.w DATA_199A2B,y
	STA.b $25
	LDY.w #$0000
	LDA.b ($25),y
	BIT.b $4B
	BVC.b CODE_18B7B9
	EOR.w #$FFFF
	INC
CODE_18B7B9:
	CLC
	ADC.b $41
	STA.b $41
	INY
	INY
	LDA.b ($25),y
	CLC
	ADC.b $47
	STA.b $47
	INY
	INY
	LDX.b $4E
	CPX.w #$0200
	BCS.b CODE_18B759
	BIT.b $4B
	BVC.b CODE_18B7DB
	JMP.w CODE_18B85B

CODE_18B7D7:
	INY
	INY
CODE_18B7D9:
	INY
	INY
CODE_18B7DB:
	LDA.b ($25),y
	BMI.b CODE_18B854
	INY
	INY
	XBA
	STA.b $4D
	LDA.b ($25),y
	INY
	INY
	CLC
	ADC.b $41
	CMP.w #$0100
	BCC.b CODE_18B7F8
	CMP.w #$FFC0
	BCC.b CODE_18B7D7
	ORA.w #$0100
CODE_18B7F8:
	STA.b $43
	AND.w #$00FF
	STA.b $45
	LDA.b ($25),y
	INY
	INY
	CLC
	ADC.b $47
	CMP.w #$00E0
	BCC.b CODE_18B813
	CMP.w #$FFE0
	BCC.b CODE_18B7D9
	AND.w #$00FF
CODE_18B813:
	XBA
	ORA.b $45
	STA.w $0200,x
	LDA.b ($25),y
	EOR.b $4B
	CLC
	ADC.b $49
	STA.w $0202,x
	STX.b $52
	STY.b $54
	SEP.b #$30
	LDX.b $50
	LDY.w DATA_198DE5,x
	LDA.b $44
	BEQ.b CODE_18B835
	LDA.w DATA_198E65,x
CODE_18B835:
	BIT.b $4E
	BPL.b CODE_18B83C
	ORA.w DATA_198EE5,x
CODE_18B83C:
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $50
	REP.b #$30
	LDX.b $52
	LDY.b $54
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BCC.b CODE_18B7D9
CODE_18B854:
	STX.b $4E
	RTS

CODE_18B857:
	INY
	INY
CODE_18B859:
	INY
	INY
CODE_18B85B:
	LDA.b ($25),y
	BMI.b CODE_18B854
	INY
	INY
	XBA
	STA.b $4D
	LDA.b ($25),y
	INY
	INY
	EOR.w #$FFFF
	SEC
	SBC.w #$0008
	BIT.b $4D
	BPL.b CODE_18B877
	SEC
	SBC.w #$0008
CODE_18B877:
	CLC
	ADC.b $41
	CMP.w #$0100
	BCC.b CODE_18B887
	CMP.w #$FFC0
	BCC.b CODE_18B857
	ORA.w #$0100
CODE_18B887:
	STA.b $43
	AND.w #$00FF
	STA.b $45
	LDA.b ($25),y
	INY
	INY
	CLC
	ADC.b $47
	CMP.w #$00E0
	BCC.b CODE_18B8A2
	CMP.w #$FFE0
	BCC.b CODE_18B859
	AND.w #$00FF
CODE_18B8A2:
	XBA
	ORA.b $45
	STA.w $0200,x
	LDA.b ($25),y
	EOR.b $4B
	CLC
	ADC.b $49
	STA.w $0202,x
	STX.b $52
	STY.b $54
	SEP.b #$30
	LDX.b $50
	LDY.w DATA_198DE5,x
	LDA.b $44
	BEQ.b CODE_18B8C4
	LDA.w DATA_198E65,x
CODE_18B8C4:
	BIT.b $4E
	BPL.b CODE_18B8CB
	ORA.w DATA_198EE5,x
CODE_18B8CB:
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $50
	REP.b #$30
	LDX.b $52
	LDY.b $54
	INX
	INX
	INX
	INX
	CPX.w #$0200
	BCS.b CODE_18B8E6
	JMP.w CODE_18B859

CODE_18B8E6:
	STX.b $4E
	RTS

CODE_18B8E9:
	PHP
	REP.b #$30
	LDX.w #$0026
CODE_18B8EF:
	STZ.w $1156,x
	DEX
	DEX
	BPL.b CODE_18B8EF
	STZ.w $114C
	STZ.w $114E
	STZ.w $1152
CODE_18B8FF:
	PLP
	RTS

CODE_18B901:
	PHP
	REP.b #$30
	BIT.w $114C
	BPL.b CODE_18B8FF
	INC.w $1154
	LDA.w $1154
	LSR
	LSR
	XBA
	AND.w #$FF00
	BMI.b CODE_18B91E
	CMP.w #$6000
	BCS.b CODE_18B923
	BRA.b CODE_18B926

CODE_18B91E:
	CMP.w #$E000
	BCC.b CODE_18B926
CODE_18B923:
	LDA.w #$0000
CODE_18B926:
	STA.w $1150
	LDA.w $1152
	BEQ.b CODE_18B933
	DEC.w $1152
	BRA.b CODE_18B990

CODE_18B933:
	LDX.w #$0026
	LDA.w $114E
	BEQ.b CODE_18B990
	BPL.b CODE_18B962
	STZ.b $25
CODE_18B93F:
	LDA.w $1156,x
	BPL.b CODE_18B955
	INC.b $25
	LDA.w $11A6,x
	CMP.w #$0100
	BCC.b CODE_18B955
	STZ.w $1156,x
	DEC.b $25
	BRA.b CODE_18B98A

CODE_18B955:
	DEX
	DEX
	BPL.b CODE_18B93F
	LDA.b $25
	BNE.b CODE_18B990
	STZ.w $114C
	BRA.b CODE_18B990

CODE_18B962:
	LDA.w $1156,x
	BMI.b CODE_18B984
	LDA.w #$8000
	STA.w $1156,x
	TXA
	LSR
	AND.w #$0007
	CLC
	ADC.w #$0005
	STA.w $11CE,x
	JSR.w CODE_18D8BB
	STA.w $117E,x
	STZ.w $11A6,x
	BRA.b CODE_18B98A

CODE_18B984:
	DEX
	DEX
	BPL.b CODE_18B962
	BRA.b CODE_18B990

CODE_18B98A:
	LDA.w #$0020
	STA.w $1152
CODE_18B990:
	LDX.w #$0026
	BIT.w $1150
	BPL.b CODE_18B9C6
CODE_18B998:
	BIT.w $1156,x
	BPL.b CODE_18B9C0
	LDA.w $117E,x
	SEC
	SBC.w $11CE,x
	STA.w $117E,x
	LDA.w $11A6,x
	CLC
	ADC.w $11CE,x
	STA.w $11A6,x
	SEC
	SBC.w #$0140
	BCC.b CODE_18B9C0
	STA.w $11A6,x
	JSR.w CODE_18D8BB
	STA.w $117E,x
CODE_18B9C0:
	DEX
	DEX
	BPL.b CODE_18B998
	PLP
	RTS

CODE_18B9C6:
	BIT.w $1156,x
	BPL.b CODE_18B9F3
	LDA.w $1150
	BEQ.b CODE_18B9DA
	LDA.w $117E,x
	CLC
	ADC.w $11CE,x
	STA.w $117E,x
CODE_18B9DA:
	LDA.w $11A6,x
	CLC
	ADC.w $11CE,x
	STA.w $11A6,x
	SEC
	SBC.w #$0140
	BCC.b CODE_18B9F3
	STA.w $11A6,x
	JSR.w CODE_18D8BB
	STA.w $117E,x
CODE_18B9F3:
	DEX
	DEX
	BPL.b CODE_18B9C6
	PLP
	RTS

CODE_18B9F9:
	PHP
	REP.b #$30
	BIT.w $114C
	BPL.b CODE_18BA35
	LDA.w #$3044
	LDY.w $1150
	BEQ.b CODE_18BA10
	BPL.b CODE_18BA13
	EOR.w #$4000
	BRA.b CODE_18BA13

CODE_18BA10:
	LDA.w #$3120
CODE_18BA13:
	STA.b $4B
	LDX.w #$0026
CODE_18BA18:
	BIT.w $1156,x
	BPL.b CODE_18BA31
	STX.b $3B
	LDA.w $117E,x
	AND.w #$00FF
	STA.b $41
	LDA.w $11A6,x
	STA.b $47
	JSR.w CODE_18BB7A
	LDX.b $3B
CODE_18BA31:
	DEX
	DEX
	BPL.b CODE_18BA18
CODE_18BA35:
	PLP
	RTS

CODE_18BA37:
	PHP
	REP.b #$30
	LDA.w $0CD6
	CMP.w #$0002
	BNE.b CODE_18BAA9
	LDA.w $11F6
	BEQ.b CODE_18BAAB
	DEC.w $11F6
	BNE.b CODE_18BA5A
	LDA.w #$2F02
	JSR.w CODE_18D832
	LDA.w $11F8
	LDX.w $11FA
	BRA.b CODE_18BAA3

CODE_18BA5A:
	CMP.w #$0014
	BEQ.b CODE_18BA6F
	BCC.b CODE_18BA78
	LDX.w #$0000
	AND.w #$0002
	BNE.b CODE_18BA6C
	LDX.w #$7FFF
CODE_18BA6C:
	TXA
	BRA.b CODE_18BAA3

CODE_18BA6F:
	LDA.w #$3DEF
	STA.w $04FE
	STA.w $051E
CODE_18BA78:
	LDA.w $04FE
	CMP.w $11F8
	BEQ.b CODE_18BA8C
	SEC
	SBC.w #$0421
	BCS.b CODE_18BA89
	LDA.w $11F8
CODE_18BA89:
	STA.w $04FE
CODE_18BA8C:
	LDA.w $051E
	CMP.w $11FA
	BEQ.b CODE_18BAA9
	SEC
	SBC.w #$0421
	TAX
	BCS.b CODE_18BA9E
	LDA.w $11FA
CODE_18BA9E:
	STA.w $051E
	BRA.b CODE_18BAA9

CODE_18BAA3:
	STA.w $04FE
	STX.w $051E
CODE_18BAA9:
	PLP
	RTS

CODE_18BAAB:
	BIT.w $11FC
	BMI.b CODE_18BABC
	LDA.b $39
	AND.w #$01FF
	BNE.b CODE_18BAA9
	JSR.w CODE_18D8BB
	BPL.b CODE_18BAA9
CODE_18BABC:
	STZ.w $11FC
	LDA.w #$0020
	STA.w $11F6
	LDA.w $04FE
	STA.w $11F8
	LDA.w $051E
	STA.w $11FA
	LDA.w #$7FFF
	TAX
	BRA.b CODE_18BAA3

CODE_18BAD7:
	PLP
	RTS

CODE_18BAD9:
	PHP
	REP.b #$30
	BIT.w $0CD8
	BPL.b CODE_18BAD7
	LDX.w $0CDE
	LDA.w $0CDA
	LDY.w #$6000
	CPX.w #$0022
	BCS.b CODE_18BAF6
	SEC
	SBC.w #$000F
	LDY.w #$2000
CODE_18BAF6:
	SEC
	SBC.b $58
	STA.b $41
	STY.b $4B
	LDA.w $0CDC
	SEC
	SBC.b $5C
	STA.b $47
	LDA.w #$0024
	ORA.b $4B
	STA.b $4B
	LDA.w $0CE4
	SEC
	SBC.w $0CDC
	BCC.b CODE_18BAD7
	BEQ.b CODE_18BAD7
	TAX
	AND.w #$000F
	STA.b $27
	TXA
	LDX.b $27
	BEQ.b CODE_18BB26
	CLC
	ADC.w #$0010
CODE_18BB26:
	LSR
	LSR
	LSR
	LSR
	STA.b $25
	BEQ.b CODE_18BB35
CODE_18BB2E:
	LDA.b $25
	CMP.w #$0001
	BNE.b CODE_18BB5E
CODE_18BB35:
	LDA.b $27
	BEQ.b CODE_18BB58
	LDX.b $41
	PHX
	LDX.b $47
	PHX
	LDX.b $4B
	PHX
	CLC
	ADC.b $47
	STA.b $47
	LDA.w #$0006
	STA.b $4B
	JSR.w CODE_18BB7A
	PLA
	STA.b $4B
	PLA
	STA.b $47
	PLA
	STA.b $41
CODE_18BB58:
	JSR.w CODE_18BB7A
	JMP.w CODE_18BB78

CODE_18BB5E:
	JSR.w CODE_18BB7A
	LDX.w $0CDE
	LDA.w DATA_19B0BC,x
	CLC
	ADC.b $41
	STA.b $41
	LDA.b $47
	CLC
	ADC.w #$0010
	STA.b $47
	DEC.b $25
	BNE.b CODE_18BB2E
CODE_18BB78:
	PLP
	RTS

CODE_18BB7A:
	LDX.b $4E
	CPX.w #$0200
	BCS.b CODE_18BBD3
	LDA.b $41
	CMP.w #$0100
	BCC.b CODE_18BB90
	CMP.w #$FFC0
	BCC.b CODE_18BBD3
	ORA.w #$0100
CODE_18BB90:
	STA.b $43
	AND.w #$00FF
	STA.b $45
	LDA.b $47
	CMP.w #$00E0
	BCC.b CODE_18BBA6
	CMP.w #$FFE0
	BCC.b CODE_18BBD3
	AND.w #$00FF
CODE_18BBA6:
	XBA
	ORA.b $45
	STA.w $0200,x
	LDA.b $4B
	STA.w $0202,x
	INX
	INX
	INX
	INX
	STX.b $4E
	SEP.b #$30
	LDX.b $50
	LDY.w DATA_198DE5,x
	LDA.b $44
	BEQ.b CODE_18BBC5
	LDA.w DATA_198E65,x
CODE_18BBC5:
	ORA.w DATA_198EE5,x
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $50
	REP.b #$30
CODE_18BBD3:
	RTS

CODE_18BBD4:
	LDX.b $4E
	CPX.w #$0200
	BCS.b CODE_18BC50
	LDA.b ($25)
	BIT.b $4B
	BVC.b CODE_18BBE6
	EOR.w #$FFFF
	INC
	INC
CODE_18BBE6:
	CLC
	ADC.b $41
	CMP.w #$0100
	BCC.b CODE_18BBF6
	CMP.w #$FFC0
	BCC.b CODE_18BC48
	ORA.w #$0100
CODE_18BBF6:
	STA.b $43
	AND.w #$00FF
	STA.b $45
	LDY.w #$0002
	LDA.b ($25),y
	CLC
	ADC.b $47
	CMP.w #$00E0
	BCC.b CODE_18BC12
	CMP.w #$FFE0
	BCC.b CODE_18BC48
	AND.w #$00FF
CODE_18BC12:
	XBA
	ORA.b $45
	STA.w $0200,x
	LDY.w #$0004
	LDA.b ($25),y
	EOR.b $4B
	STA.w $0202,x
	INX
	INX
	INX
	INX
	STX.b $4E
	SEP.b #$30
	LDX.b $50
	LDY.w DATA_198DE5,x
	LDA.b $44
	BEQ.b CODE_18BC36
	LDA.w DATA_198E65,x
CODE_18BC36:
	BIT.b $4D
	BPL.b CODE_18BC3D
	ORA.w DATA_198EE5,x
CODE_18BC3D:
	ORA.w $0400,y
	STA.w $0400,y
	INX
	STX.b $50
	REP.b #$30
CODE_18BC48:
	LDA.b $25
	CLC
	ADC.w #$0006
	STA.b $25
CODE_18BC50:
	RTS

CODE_18BC51:
	PHP
	JSR.w CODE_18D8F1
	JSR.w CODE_18BDA9
	SEP.b #$20
	LDA.b #$09
	STA.w $2105
	LDA.b #$05
	STA.w $212C
	STZ.w $212D
	JSR.w CODE_18B49B
	REP.b #$30
	LDX.w #$0296
	LDY.w #DATA_198A66
	BIT.w $10F4
	BMI.b CODE_18BC7A
	LDY.w #DATA_198A70
CODE_18BC7A:
	JSR.w CODE_18BD44
	LDX.w #$0396
	LDY.w #DATA_198A7A
	JSR.w CODE_18BD44
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDX.w #$6000
	LDY.w #!Define_SXAR_Graphics_Layer3_SmallAndLargeFont
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToVRAM
	LDX.w #$2000
	LDY.w #!Define_SXAR_Graphics_Sprite_CopyOfSpiderManPortrait
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000420>>16)
	LDX.w #$000420
	LDY.w #!Define_SXAR_Palette_GetReadySpiderMan
	JSL.l CODE_18CD28
	LDA.w #!Define_SXAR_DataUploadType_TransferToWRAM|($000460>>16)
	LDX.w #$000460
	LDY.w #!Define_SXAR_Palette_CopyOfSpiderManPortrait
	JSL.l CODE_18CD28
	JSL.l CODE_18BCD9	: dw DATA_19B0FE,$70A3,$0800,$0006,$0012
	JSR.w CODE_18CB7A
	JSR.w CODE_18DA36
	JSR.w CODE_18D9A2
	JSR.w CODE_18D97F
	JSR.w CODE_18D94D
	PLP
	RTS

CODE_18BCD9:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	PLA
	CLC
	ADC.b #$01
	STA.b $25
	PLA
	ADC.b #$00
	STA.b $26
	PLA
	STA.b $27
	REP.b #$30
	LDY.w #$0000
	LDA.b [$25],y
	STA.b $2F
	INY
	INY
	LDA.b [$25],y
	STA.b $29
	INY
	INY
	LDA.b [$25],y
	STA.b $31
	INY
	INY
	LDA.b [$25],y
	STA.b $2B
	INY
	INY
	LDA.b [$25],y
	STA.b $2D
	INY
	TYA
	CLC
	ADC.b $25
	STA.b $25
	LDY.w #$0000
CODE_18BD19:
	LDX.b $2B
	LDA.b $29
	STA.w $2116
CODE_18BD20:
	LDA.b ($2F),y
	CLC
	ADC.b $31
	INY
	INY
	STA.w $2118
	DEX
	BNE.b CODE_18BD20
	LDA.b $29
	CLC
	ADC.w #$0020
	STA.b $29
	DEC.b $2D
	BNE.b CODE_18BD19
	SEP.b #$20
	LDA.b $27
	PHA
	REP.b #$30
	LDA.b $25
	PHA
	RTL

CODE_18BD44:
	PHP
	REP.b #$30
	STY.b $25
CODE_18BD49:
	LDA.b ($25)
	AND.w #$00FF
	BNE.b CODE_18BD62
	STA.l $7F0300,x
	STA.l $7F0302,x
	STA.l $7F0340,x
	STA.l $7F0342,x
	BRA.b CODE_18BD6A

CODE_18BD62:
	CMP.w #$00FF
	BEQ.b CODE_18BD72
	JSR.w CODE_18BD74
CODE_18BD6A:
	INC.b $25
	INX
	INX
	INX
	INX
	BRA.b CODE_18BD49

CODE_18BD72:
	PLP
	RTS

CODE_18BD74:
	DEC
	ASL
	ASL
	CLC
	ADC.w #$0031
	ORA.w #$2000
	STA.l $7F0300,x
	INC
	STA.l $7F0302,x
	INC
	STA.l $7F0340,x
	INC
	STA.l $7F0342,x
	RTS

CODE_18BD92:
	PHP
	JSR.w CODE_18BDA9
	JSR.w CODE_18BFE0
	JSR.w CODE_18BE17
	REP.b #$20
	STZ.w $0CD2
	LDA.w #$0010
	STA.w $0CD4
	PLP
	RTS

CODE_18BDA9:
	PHP
	SEP.b #$20
	LDA.b #$39
	STA.w $2105
	STZ.w $2106
	LDA.b #$70
	STA.w $2107
	LDA.b #$74
	STA.w $2108
	LDA.b #$78
	STA.w $2109
	LDA.b #$70
	STA.w $210A
	LDA.b #$22
	STA.w $210B
	LDA.b #$06
	STA.w $210C
	LDA.b #$17
	STA.w $212C
	LDA.b #$01
	STA.w $212D
	STZ.w $212E
	STZ.w $212F
	JSR.w CODE_18DB97
	PLP
	RTS

CODE_18BDE7:
	PHP
	JSR.w CODE_18B637
	REP.b #$30
	LDX.w #$0620
	JSR.w CODE_18B201
	LDA.b $0C,x
	ORA.w $110A
	STA.b $0C,x
	LDA.w #$0002
	JSR.w CODE_189700
	JSR.w CODE_18CBB5
	JSR.w CODE_18CC0A
	JSR.w CODE_188E5B
	JSR.w CODE_189921
	JSR.w CODE_189981
	JSR.w CODE_189B18
	JSR.w CODE_18B8E9
	PLP
	RTS

CODE_18BE17:
	PHP
	REP.b #$30
	LDX.w #DATA_19AD97
	LDY.w #DATA_19AD97>>16
	JSR.w CODE_18C16B
	JSR.w CODE_18BE28
	PLP
	RTS

CODE_18BE28:
	PHP
	REP.b #$30
	JSR.w CODE_18BF03
	JSR.w CODE_18BF31
	JSR.w CODE_18BF71
	JSR.w CODE_18BE83
	JSR.w CODE_18BE52
	PLP
	RTS

CODE_18BE3C:
	PHP
	REP.b #$30
	LDA.w $0CD6
	CMP.w #$0004
	BNE.b CODE_18BE50
	LDX.w #$00AC
	LDA.w $121A
	JMP.w CODE_18BF3A

CODE_18BE50:
	PLP
	RTS

CODE_18BE52:
	PHP
	REP.b #$30
	LDA.w $1100
	BMI.b CODE_18BE5F
	ASL
	ASL
	TAY
	BRA.b CODE_18BE62

CODE_18BE5F:
	LDY.w #$0040
CODE_18BE62:
	LDX.w #$00AC
	LDA.w DATA_198A96,y
	STA.l $7F0300,x
	LDA.w DATA_198A96+$02,y
	STA.l $7F0302,x
	LDA.w DATA_198A96+$04,y
	STA.l $7F0340,x
	LDA.w DATA_198A96+$06,y
	STA.l $7F0342,x
	PLP
	RTS

CODE_18BE83:
	PHP
	REP.b #$30
	LDY.w #$0018
	LDA.w $10FE
	BEQ.b CODE_18BE98
	LDA.b $39
	AND.w #$0008
	BEQ.b CODE_18BE98
	LDY.w #$0000
CODE_18BE98:
	LDA.w DATA_198AF6,y
	STA.l $7F0372
	LDA.w DATA_198AF6+$02,y
	STA.l $7F0374
	LDA.w DATA_198AF6+$04,y
	STA.l $7F0376
	LDA.w DATA_198AF6+$06,y
	STA.l $7F0378
	LDA.w DATA_198AF6+$08,y
	STA.l $7F03B2
	LDA.w DATA_198B04,y
	STA.l $7F03B8
	LDA.w DATA_198B04+$02,y
	STA.l $7F03F2
	LDA.w DATA_198B0C,y
	STA.l $7F03F8
	REP.b #$10
	SEP.b #$20
	LDX.w #$0116
	LDY.w #$000B
	LDA.w $10FE
	ORA.w $10FF
	BEQ.b CODE_18BEF6
	LDA.b $00
	AND.b #$04
	BNE.b CODE_18BEF6
CODE_18BEE8:
	LDA.w DATA_198BF0,y
	STA.l $7F0300,x
	INX
	INX
	DEY
	BPL.b CODE_18BEE8
	PLP
	RTS

CODE_18BEF6:
	LDA.b #$00
CODE_18BEF8:
	STA.l $7F0300,x
	INX
	INX
	DEY
	BPL.b CODE_18BEF8
	PLP
	RTS

CODE_18BF03:
	PHP
	REP.b #$10
	SEP.b #$20
	LDX.w #$0090
	LDY.w #$0000
	STZ.b $25
CODE_18BF10:
	LDA.w $0110,y
	BNE.b CODE_18BF19
	BIT.b $25
	BPL.b CODE_18BF1D
CODE_18BF19:
	SEC
	ROR.b $25
	INC
CODE_18BF1D:
	STA.l $7F0300,x
	INX
	INX
	INY
	CPY.w #$0007
	BNE.b CODE_18BF10
	LDA.b #$01
	STA.l $7F0300,x
	PLP
	RTS

CODE_18BF31:
	PHP
	REP.b #$30
	LDX.w #$00BA
	LDA.w !RAM_SXAR_Global_CurrentLivesLo
CODE_18BF3A:
	LDY.w #$0000
	CMP.w #$0064
	BCC.b CODE_18BF45
	LDA.w #$0063
CODE_18BF45:
	CMP.w #$000A
	BCC.b CODE_18BF51
	SBC.w #$000A
	INY
	BRA.b CODE_18BF45

CODE_18BF50:
	INY
CODE_18BF51:
	PHA
	TYA
	BEQ.b CODE_18BF5F
	INC
	ORA.w #$2000
	STA.l $7F0300,x
	INX
	INX
CODE_18BF5F:
	PLA
	INC
	ORA.w #$2000
	STA.l $7F0300,x
	LDA.w #$2000
	STA.l $7F0302,x
	PLP
	RTS

CODE_18BF71:
	LDX.w #$00C4
	LDY.w #$2000
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
	CMP.w #$0020
	BCS.b CODE_18BF97
	LDA.b $00
	AND.w #$0008
	BNE.b CODE_18BF94
	TYA
	LDY.w #$0010
CODE_18BF8A:
	STA.l $7F0300,x
	INX
	INX
	DEY
	BNE.b CODE_18BF8A
	RTS

CODE_18BF94:
	LDA.w !RAM_SXAR_SpiderMan_CurrentHPLo
CODE_18BF97:
	STY.b $25
	LDY.w #$0000
CODE_18BF9C:
	CMP.w #$0008
	BCC.b CODE_18BFBA
	SEC
	SBC.w #$0008
	PHA
	LDA.w #$0030
	ORA.b $25
	STA.l $7F0300,x
	PLA
	INX
	INX
	INY
	CPY.w #$0010
	BCS.b CODE_18BFDF
	BRA.b CODE_18BF9C

CODE_18BFBA:
	AND.w #$0007
	BEQ.b CODE_18BFD1
	CLC
	ADC.w #$0028
	ORA.b $25
	STA.l $7F0300,x
	INX
	INX
	INY
	CPY.w #$0010
	BCS.b CODE_18BFD1
CODE_18BFD1:
	LDA.b $25
CODE_18BFD3:
	STA.l $7F0300,x
	INX
	INX
	INY
	CPY.w #$0010
	BCC.b CODE_18BFD3
CODE_18BFDF:
	RTS

CODE_18BFE0:
	PHP
	REP.b #$30
	STZ.b $62
	STZ.b $64
	STZ.b $56
	JSR.w CODE_18BFFA
	JSR.w CODE_18C464
	JSR.w CODE_18BFFA
	JSR.w CODE_18C6E3
	JSR.w CODE_18CB81
	PLP
	RTS

CODE_18BFFA:
	PHP
	JSR.w CODE_18C047
	SEP.b #$10
	LDX.b $56
	JMP.w (DATA_18C005,x)

DATA_18C005:
	dw CODE_18C009
	dw CODE_18C023

CODE_18C009:
	REP.b #$30
	LDA.w $0CBE
	LDX.b $58
	LDY.b $5C
	JSR.w CODE_18C0C8
	CLC
	ADC.w #$2000
	STA.b $60
	STX.w $0C93
	STY.w $0C9B
	BRA.b CODE_18C040

CODE_18C023:
	REP.b #$30
	BIT.w $1208
	BMI.b CODE_18C040
	LDA.w $0CC0
	LDX.b $5A
	LDY.b $5E
	JSR.w CODE_18C0C8
	CLC
	ADC.w #$C000
	STA.b $60
	STX.w $0C95
	STY.w $0C9D
CODE_18C040:
	LDA.w #$00FF
	STA.b $66
	PLP
	RTS

CODE_18C047:
	PHP
	REP.b #$30
	LDA.b $62
	CLC
	ADC.w $0C93
	STA.w $0C93
	LDA.b $64
	CLC
	ADC.w $0C9B
	STA.w $0C9B
	SEP.b #$30
	LDA.b #$80
	LDX.b $58
	LDY.b $59
	JSR.w CODE_18C09A
	BIT.w $1208
	BMI.b CODE_18C07A
	PHA
	SEC
	SBC.b $5A
	CLC
	ADC.w $0C95
	STA.w $0C95
	PLA
	STA.b $5A
CODE_18C07A:
	SEP.b #$30
	LDA.b #$80
	LDX.b $5C
	LDY.b $5D
	JSR.w CODE_18C09A
	BIT.w $1208
	BMI.b CODE_18C098
	PHA
	SEC
	SBC.b $5E
	CLC
	ADC.w $0C9D
	STA.w $0C9D
	PLA
	STA.b $5E
CODE_18C098:
	PLP
	RTS

CODE_18C09A:
	ORA.b #$00
	BEQ.b CODE_18C0C2
	STA.w $4202
	STX.w $4203
	NOP #4
	LDX.w $4217
	STX.b $25
	STZ.b $26
	STA.w $4202
	STY.w $4203
	NOP #4
	REP.b #$20
	LDA.w $4216
	CLC
	ADC.b $25
	RTS

CODE_18C0C2:
	TYA
	XBA
	TXA
	REP.b #$20
	RTS

CODE_18C0C8:
	STX.b $25
	STY.b $27
	SEP.b #$20
	STA.w $211B
	XBA
	STA.w $211B
	REP.b #$20
	LDA.w #$0020
	STA.b $29
	STA.b $2B
	LDA.b $27
	SEC
	SBC.w #$0020
	BCS.b CODE_18C0EA
	LDA.b $27
	STZ.b $2B
CODE_18C0EA:
	LSR
	LSR
	LSR
	LSR
	SEP.b #$20
	STA.w $211C
	STA.w $211C
	REP.b #$30
	LDA.b $25
	SEC
	SBC.w #$0020
	BCS.b CODE_18C104
	LDA.b $25
	STZ.b $29
CODE_18C104:
	LSR
	LSR
	LSR
	AND.w #$FFFE
	CLC
	ADC.w $2134
	PHA
	LDA.b $25
	AND.w #$000F
	ORA.b $29
	TAX
	LDA.b $27
	AND.w #$000F
	ORA.b $2B
	TAY
	PLA
	RTS

CODE_18C121:
	PHX
	PHY
	PHP
	REP.b #$30
	TAX
	LDA.w DATA_198BFC,x
	STA.b $25
	SEP.b #$30
	LDY.b #$06
	CLC
CODE_18C131:
	LDA.w $0110,y
	ADC.b ($25),y
	CMP.b #$0A
	BCC.b CODE_18C13D
	SEC
	SBC.b #$0A
CODE_18C13D:
	STA.w $0110,y
	DEY
	BPL.b CODE_18C131
	PLP
	PLY
	PLX
	RTS

CODE_18C147:
	REP.b #$30
	PLA
	INC
	STA.b $33
	SEP.b #$20
	PLA
	STA.b $35
	STZ.w $0CA3
	REP.b #$20
	JSR.w CODE_18C188
CODE_18C15A:
	JSR.w CODE_18C1DB
	BCC.b CODE_18C15A
	SEP.b #$20
	LDA.b $35
	PHA
	LDA.b $34
	PHA
	LDA.b $33
	PHA
	RTL

CODE_18C16B:
	STX.b $33
	SEP.b #$30
	STY.b $35
	STZ.w $0CA3
	JSR.w CODE_18C188
CODE_18C177:
	JSR.w CODE_18C1DB
	BCC.b CODE_18C177
	RTS

CODE_18C17D:
	STX.b $33
	SEP.b #$30
	STY.b $35
	LDA.b #$80
	STA.w $0CA3
CODE_18C188:
	PHP
	REP.b #$20
	LDA.b [$33]
	STA.b $36
	STZ.w $0CA4
	SEP.b #$30
	LDY.b #$02
	LDA.b [$33],y
	STA.b $38
	INY
	LDA.b [$33],y
	STA.w $0CA9
	INY
	LDA.b [$33],y
	STA.w $0CAE
	INY
	LDA.b [$33],y
	STA.w $0CB0
	INY
	TYA
	CLC
	ADC.b $33
	STA.b $33
	BCC.b CODE_18C1B7
	INC.b $34
CODE_18C1B7:
	STZ.w $0CAF
	STZ.w $0CB1
	STZ.w $0CA6
	STZ.w $0CA7
	STZ.w $0CA8
	STZ.w $0CAD
	PLP
	RTS

CODE_18C1CB:
	PHP
	SEP.b #$20
	SEC
	BIT.w $0CA3
	BPL.b CODE_18C1D9
	BVS.b CODE_18C1D9
	JSR.w CODE_18C1DB
CODE_18C1D9:
	PLP
	RTS

CODE_18C1DB:
	SEP.b #$30
	LDA.w $0CA6
	BEQ.b CODE_18C1E7
	DEC.w $0CA6
	BRA.b CODE_18C1F4

CODE_18C1E7:
	LDA.w $0CA8
	BEQ.b CODE_18C1FE
	LDA.b #$3C
	STA.w $0CA6
	DEC.w $0CA8
CODE_18C1F4:
	BIT.w $0CA3
	BMI.b CODE_18C1FC
	JSR.w CODE_18D932
CODE_18C1FC:
	CLC
	RTS

CODE_18C1FE:
	LDY.b #$00
	TYA
	XBA
	LDA.b [$33]
	BPL.b CODE_18C225
	ASL
	TAX
	BEQ.b CODE_18C21C
	INY
	JSR.w (DATA_18C28C,x)
	SEP.b #$30
	TYA
	CLC
	ADC.b $33
	STA.b $33
	BCC.b CODE_18C282
	INC.b $34
	BRA.b CODE_18C282

CODE_18C21C:
	SEP.b #$20
	LDA.b #$C0
	STA.w $0CA3
	SEC
	RTS

CODE_18C225:
	SEP.b #$30
	BIT.w $0CA9
	BMI.b CODE_18C233
	REP.b #$30
	AND.w #$00FF
	BRA.b CODE_18C23D

CODE_18C233:
	REP.b #$30
	AND.w #$00FF
	ASL
	TAY
	LDA.w DATA_198CE5,y
CODE_18C23D:
	ORA.w $0CA4
	TAX
	LDA.w $0CB0
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w $0CAE
	ASL
	TAY
	TXA
	STA.b [$36],y
	INC.b $33
	SEP.b #$30
	LDA.w $0CAE
	INC
	CMP.b #$20
	BCC.b CODE_18C26D
	LDA.b #$00
	LDX.w $0CB0
	INX
	CPX.b #$20
	BCC.b CODE_18C26A
	LDX.b #$00
CODE_18C26A:
	STX.w $0CB0
CODE_18C26D:
	STA.w $0CAE
	LDX.w $0CA7
	BEQ.b CODE_18C282
	BIT.w $0CA3
	BPL.b CODE_18C27F
	STX.w $0CA6
	BRA.b CODE_18C282

CODE_18C27F:
	JSR.w CODE_18D946
CODE_18C282:
	BIT.w $0CAD
	BPL.b CODE_18C28A
	JMP.w CODE_18C1DB

CODE_18C28A:
	CLC
	RTS

DATA_18C28C:
	dw $0000
	dw CODE_18C2B0
	dw CODE_18C2BD
	dw CODE_18C2C4
	dw CODE_18C2D1
	dw CODE_18C2DB
	dw CODE_18C2E2
	dw CODE_18C2E9
	dw CODE_18C2F0
	dw CODE_18C2FE
	dw CODE_18C313
	dw CODE_18C325
	dw CODE_18C32B
	dw CODE_18C32F
	dw CODE_18C33F
	dw CODE_18C35A
	dw CODE_18C36D
	dw CODE_18C38D

CODE_18C2B0:
	LDA.b [$33],y
	INY
	STA.w $0CA4
	LDA.b [$33],y
	INY
	STA.w $0CA5
	RTS

CODE_18C2BD:
	LDA.b [$33],y
	INY
	STA.w $0CAE
	RTS

CODE_18C2C4:
	LDA.b [$33],y
	INY
	STA.w $0CAE
	LDA.b [$33],y
	INY
	STA.w $0CB0
	RTS

CODE_18C2D1:
	LDA.b [$33],y
	INY
	STA.w $0CAE
	INC.w $0CB0
	RTS

CODE_18C2DB:
	LDA.b [$33],y
	INY
	STA.w $0CA6
	RTS

CODE_18C2E2:
	LDA.b [$33],y
	INY
	STA.w $0CA8
	RTS

CODE_18C2E9:
	LDA.b [$33],y
	INY
	STA.w $0CA7
	RTS

CODE_18C2F0:
	LDA.b [$33],y
	INY
	TAX
	LDA.b [$33],y
	INY
	STA.b $34
	STX.b $33
	LDY.b #$00
	RTS

CODE_18C2FE:
	LDA.b [$33],y
	INY
	STA.w $0CAA
	TYA
	CLC
	ADC.b $33
	STA.w $0CAB
	LDA.b $34
	ADC.b #$00
	STA.w $0CAC
	RTS

CODE_18C313:
	DEC.w $0CAA
	BEQ.b CODE_18C324
	LDA.w $0CAB
	STA.b $33
	LDA.w $0CAC
	STA.b $34
	LDY.b #$00
CODE_18C324:
	RTS

CODE_18C325:
	LDA.b #$FF
	STA.w $0CAD
	RTS

CODE_18C32B:
	STZ.w $0CAD
	RTS

CODE_18C32F:
	LDA.b [$33],y
	INY
	STA.b $25
	LDA.b [$33],y
	INY
	STA.b $26
	LDA.b [$33],y
	INY
	STA.b ($25)
	RTS

CODE_18C33F:
	LDA.b [$33],y
	INY
	STA.b $25
	LDA.b [$33],y
	INY
	STA.b $26
	LDA.b [$33],y
	INY
	STA.b ($25)
	INC.b $25
	BNE.b CODE_18C354
	INC.b $26
CODE_18C354:
	LDA.b [$33],y
	INY
	STA.b ($25)
	RTS

CODE_18C35A:
	LDA.b [$33],y
	INY
	STA.b $25
	LDA.b [$33],y
	INY
	STA.b $26
	LDA.b [$33],y
	INY
	CLC
	ADC.b ($25)
	STA.b ($25)
	RTS

CODE_18C36D:
	LDA.b [$33],y
	INY
	STA.b $25
	LDA.b [$33],y
	INY
	STA.b $26
	LDA.b [$33],y
	INY
	CLC
	ADC.b ($25)
	STA.b ($25)
	INC.b $25
	BNE.b CODE_18C385
	INC.b $26
CODE_18C385:
	LDA.b [$33],y
	INY
	ADC.b ($25)
	STA.b ($25)
	RTS

CODE_18C38D:
	REP.b #$30
	LDY.w #$07FE
	LDA.w #$0000
CODE_18C395:
	STA.b [$36],y
	DEY
	DEY
	BPL.b CODE_18C395
	SEP.b #$30
	LDY.b #$01
	RTS

CODE_18C3A0:						; Note: Related to shocker.
	PHP
	REP.b #$30
	LDX.w $1136
	BMI.b CODE_18C3CE
	LDY.b $2E,x
	BMI.b CODE_18C3C6
	INY
	INY
	JSR.w CODE_18C429
	LDA.w #$FFFF
	STA.w $1136
CODE_18C3B7:
	LDA.b $2E,x
	LDY.b $30,x
	STY.b $2E,x
	STA.b $30,x
	LDA.w $113A
	STA.b $32,x
	PLP
	RTS

CODE_18C3C6:
	LDA.w #$FFFF
	STA.w $1136
	PLP
	RTS

CODE_18C3CE:
	LDA.w #$000B
	STA.b $29
	LDY.w $1134
CODE_18C3D6:
	TYA
	SEC
	SBC.w #$0002
	BNE.b CODE_18C3E0
	LDA.w #$0016
CODE_18C3E0:
	TAY
	STY.w $1134
	LDX.w DATA_198C9D,y
	LDA.b $00,x
	BPL.b CODE_18C423
	BIT.b $2C,x
	BPL.b CODE_18C423
	LDA.b $0E,x
	BEQ.b CODE_18C423
	CMP.b $32,x
	BEQ.b CODE_18C423
	CMP.w #$00EE
	BCS.b CODE_18C423
	STA.w $113A
	SEC
	SBC.w #$00BE
	BCC.b CODE_18C423
	ASL
	TAY
	LDA.w DATA_1995C3,y
	CLC
	ADC.w #DATA_1A8000
	STA.w $1138
	LDA.w DATA_1995C3+$02,y
	STA.w $113E
	LDY.b $2E,x
	JSR.w CODE_18C429
	BIT.b $2C,x
	BVC.b CODE_18C3B7
	STX.w $1136
CODE_18C423:
	DEC.b $29
	BNE.b CODE_18C3D6
	PLP
	RTS

CODE_18C429:
	LDA.w $1138
	STA.w $1140
	CLC
	ADC.w $113E
	STA.w $1142
	LDA.w DATA_199185,y
	CLC
	ADC.w #$0000
	STA.w $1144
	CLC
	ADC.w #$0100
	STA.w $1146
	LDA.w $113E
	ASL
	CLC
	ADC.w $1138
	STA.w $1138
	LDA.w #$FFFF
	STA.w $113C
	RTS

CODE_18C459:
	SEP.b #$30
	LDX.b $56
	JMP.w (DATA_18C460,x)

DATA_18C460:
	dw CODE_18C464
	dw CODE_18C6E3

CODE_18C464:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7E
	STA.w $4314
	REP.b #$30
	LDX.w #$7000
	LDY.b $60
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CBE
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	STZ.b $66
CODE_18C6D5:
	LDA.b $56
	CLC
	ADC.b #$02
	CMP.b #$04
	BCC.b CODE_18C6E0
	LDA.b #$00
CODE_18C6E0:
	STA.b $56
	RTS

CODE_18C6E3:
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7EC000>>16
	STA.w $4314
	REP.b #$30
	BIT.w $1208
	BPL.b CODE_18C703
	JMP.w CODE_18C95F

CODE_18C703:
	LDX.w #$7400
	LDY.b $60
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0028
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w $0CC0
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	STZ.b $66
	JMP.w CODE_18C6D5

CODE_18C95F:
	LDX.w #$7400
	LDY.w #$7EC000
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	REP.b #$30
	STX.w $2116
	STY.w $4312
	LDA.w #$0020
	STA.w $4315
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	CLC
	ADC.w #$0040
	TAY
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	STZ.b $66
	JMP.w CODE_18C6D5

CODE_18CB7A:
	REP.b #$20
	LDA.w #$0800
	BRA.b CODE_18CB86

CODE_18CB81:
	REP.b #$20
	LDA.w #$0140
CODE_18CB86:
	SEP.b #$10
	LDX.b #$80
	STX.w $2115
	LDX.b #$01
	STX.w $4310
	LDX.b #$18
	STX.w $4311
	LDX.b #$7F
	STX.w $4314
	REP.b #$10
	LDX.w #$7800
	LDY.w #$0300
	STX.w $2116
	STY.w $4312
	STA.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	RTS

CODE_18CBB5:
	PHP
	REP.b #$30
	LDA.w $062E
	SEC
	SBC.w #$0002
	TAY
	LDA.w DATA_198F65,y
	CLC
	ADC.w #$8000
	STA.b $79
	CLC
	ADC.w #$0200
	STA.b $7B
	CLC
	ADC.w #$0200
	STA.b $7D
	CLC
	ADC.w #$0200
	STA.b $7F
	CLC
	ADC.w #$0200
	STA.b $81
	CLC
	ADC.w #$0200
	STA.b $83
	PLP
	RTS

CODE_18CBE9:
	PHP
	REP.b #$30
	BIT.w $0CD8
	BPL.b CODE_18CC08
	LDX.w $0CDE
	LDY.w DATA_19B07A,x
	LDA.w #$0B00
	CLC
	ADC.w DATA_199165,y
	STA.w $0CEA
	CLC
	ADC.w #$0200
	STA.w $0CEC
CODE_18CC08:
	PLP
	RTS

CODE_18CC0A:
	PHP
	SEP.b #$20
	REP.b #$10
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #DATA_1B8000>>16
	STA.w $4314
	LDA.b #$02
	LDY.w #$0080
	LDX.w #$0000
	STX.w $2116
	LDX.b $79
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w #$0100
	STX.w $2116
	LDX.b $7B
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w #$0200
	STX.w $2116
	LDX.b $7D
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w #$0300
	STX.w $2116
	LDX.b $7F
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w #$0400
	STX.w $2116
	LDX.b $81
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w #$0500
	STX.w $2116
	LDX.b $83
	STX.w $4312
	STY.w $4315
	STA.w $420B
	PLP
	RTS

CODE_18CC90:
	PHP
	SEP.b #$20
	REP.b #$10
	LDX.w $0CD8
	BPL.b CODE_18CCD7
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$7F
	STA.w $4314
	LDA.b #$02
	LDY.w #$0040
	LDX.w #$0240
	STX.w $2116
	LDX.w $0CEA
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w #$0340
	STX.w $2116
	LDX.w $0CEC
	STX.w $4312
	STY.w $4315
	STA.w $420B
CODE_18CCD7:
	PLP
	RTS

CODE_18CCD9:
	PHP
	SEP.b #$20
	REP.b #$10
	LDX.w $113C
	BPL.b CODE_18CD26
	LDA.b #$80
	STA.w $2115
	LDA.b #$01
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #DATA_1A8000>>16
	STA.w $4314
	LDA.b #$02
	LDY.w $113E
	LDX.w $1144
	STX.w $2116
	LDX.w $1140
	STX.w $4312
	STY.w $4315
	STA.w $420B
	LDX.w $1146
	STX.w $2116
	LDX.w $1142
	STX.w $4312
	STY.w $4315
	STA.w $420B
	STZ.w $113C
	STZ.w $113D
CODE_18CD26:
	PLP
	RTS

CODE_18CD28:
	JSR.w CODE_18D7FA
	SEP.b #$20
	STZ.w $1F44
	STZ.w $1F45
	LDX.b $F0
	JSR.w (DATA_18D4E9,x)
	LDX.w $1F50
	JSR.w (DATA_18CD70,x)
	LDX.b $F0
	JSR.w (DATA_18D540,x)
	REP.b #$30
	RTL

ADDR_18CD46:
	JSR.w CODE_18D7FA
	SEP.b #$20
	LDA.b #$01
	STA.w $1F44
	STZ.w $1F45
	LDX.b $F0
	JSR.w (DATA_18D4E9,x)
	LDX.w $1F50
	JSR.w (DATA_18CD70,x)
	REP.b #$30
	RTL

ADDR_18CD61:
	SEP.b #$10
	LDX.w $1F50
	JSR.w (DATA_18CD7C,x)
	RTL

ADDR_18CD6A:
	JSR.w CODE_18D817
	LDX.b $E2
	RTL

DATA_18CD70:
	dw CODE_18CD88
	dw CODE_18CE24
	dw CODE_18CEC3
	dw CODE_18D2FC
	dw CODE_18D357
	dw CODE_18D47C

DATA_18CD7C:
	dw CODE_18CD88
	dw CODE_18CE24
	dw CODE_18CEE5
	dw CODE_18D2FC
	dw CODE_18D357
	dw CODE_18D47C

CODE_18CD88:
	SEP.b #$30
	LDY.b #$20
	LDX.b #$00
CODE_18CD8E:
	LDA.b [$E2]
	STA.b $EA
	LDA.b #$08
	STA.b $EB
CODE_18CD96:
	LDA.b #$00
	LSR.b $EA
	BCC.b CODE_18CD9D
	DEC
CODE_18CD9D:
	STA.l $7F0000,x
	INX
	DEC.b $EB
	BNE.b CODE_18CD96
	INC.b $E2
	BNE.b CODE_18CDB9
	INC.b $E3
	BNE.b CODE_18CDB9
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CDB9:
	DEY
	BNE.b CODE_18CD8E
	REP.b #$20
	LDA.b $EE
	SEC
	SBC.w #$0020
	STA.b $EE
	SEP.b #$30
CODE_18CDC8:
	LDA.b [$E2]
	TAX
	INC.b $E2
	BNE.b CODE_18CDDE
	INC.b $E3
	BNE.b CODE_18CDDE
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CDDE:
	LDA.l $7F0000,x
	BPL.b CODE_18CE15
	STX.b $EA
	LDA.b [$E2]
	TAY
	INC.b $E2
	BNE.b CODE_18CDFC
	INC.b $E3
	BNE.b CODE_18CDFC
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CDFC:
	LDX.b $F0
CODE_18CDFE:
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	DEY
	BNE.b CODE_18CDFE
	REP.b #$20
	LDA.b $EE
	SEC
	SBC.w #$0002
	STA.b $EE
	SEP.b #$20
	BNE.b CODE_18CDC8
	RTS

CODE_18CE15:
	TXA
	LDX.b $F0
	JSR.w (DATA_18D567,x)
	REP.b #$20
	DEC.b $EE
	SEP.b #$20
	BNE.b CODE_18CDC8
	RTS

CODE_18CE24:
	SEP.b #$30
	LDA.b [$E2]
	STA.b $EC
	INC.b $E2
	BNE.b CODE_18CE3D
	INC.b $E3
	BNE.b CODE_18CE3D
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CE3D:
	REP.b #$20
	DEC.b $EE
	SEP.b #$20
CODE_18CE43:
	LDA.b [$E2]
	CMP.b $EC
	BNE.b CODE_18CEA2
	INC.b $E2
	BNE.b CODE_18CE5C
	INC.b $E3
	BNE.b CODE_18CE5C
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CE5C:
	LDA.b [$E2]
	STA.b $EA
	INC.b $E2
	BNE.b CODE_18CE73
	INC.b $E3
	BNE.b CODE_18CE73
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CE73:
	LDA.b [$E2]
	TAY
	INC.b $E2
	BNE.b CODE_18CE89
	INC.b $E3
	BNE.b CODE_18CE89
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CE89:
	LDX.b $F0
CODE_18CE8B:
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	DEY
	BNE.b CODE_18CE8B
	REP.b #$20
	LDA.b $EE
	SEC
	SBC.w #$0003
	STA.b $EE
	SEP.b #$20
	BNE.b CODE_18CE43
	RTS

CODE_18CEA2:
	LDX.b $F0
	JSR.w (DATA_18D567,x)
	INC.b $E2
	BNE.b CODE_18CEBA
	INC.b $E3
	BNE.b CODE_18CEBA
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CEBA:
	REP.b #$20
	DEC.b $EE
	SEP.b #$20
	BNE.b CODE_18CE43
	RTS

CODE_18CEC3:
	REP.b #$30
	LDA.b $E2
	STA.w $1F46
	LDA.b $E4
	STA.w $1F48
	LDA.b $EE
	CLC
	ADC.b $E2
	ORA.w #$8000
	STA.w $1F4A
	LDA.b $E4
	ADC.w #$0000
	STA.w $1F4C
	STZ.w $1F55
CODE_18CEE5:
	SEP.b #$30
	LDA.b [$E2]
	STA.w $1F53
	INC.b $E2
	BNE.b CODE_18CEFF
	INC.b $E3
	BNE.b CODE_18CEFF
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CEFF:
	LDA.w $1F53
	BIT.b #$40
	BNE.b CODE_18CF09
	JMP.w CODE_18CFED

CODE_18CF09:
	STZ.b $F6
	BIT.b #$20
	BEQ.b CODE_18CF40
	STZ.b $EA
	LDA.b [$E2]
	STA.b $F2
	ORA.b $F6
	STA.b $F6
	LDX.b #$00
	LDA.b $EA
CODE_18CF1D:
	LSR.b $F2
	BCC.b CODE_18CF25
	STA.l $7F0000,x
CODE_18CF25:
	INX
	CPX.b #$08
	BNE.b CODE_18CF1D
	INC.b $E2
	BNE.b CODE_18CF3D
	INC.b $E3
	BNE.b CODE_18CF3D
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CF3D:
	LDA.w $1F53
CODE_18CF40:
	BIT.b #$10
	BEQ.b CODE_18CF77
	LDA.b #$FF
	STA.b $EA
	LDA.b [$E2]
	STA.b $F2
	ORA.b $F6
	STA.b $F6
	LDX.b #$00
	LDA.b $EA
CODE_18CF54:
	LSR.b $F2
	BCC.b CODE_18CF5C
	STA.l $7F0000,x
CODE_18CF5C:
	INX
	CPX.b #$08
	BNE.b CODE_18CF54
	INC.b $E2
	BNE.b CODE_18CF74
	INC.b $E3
	BNE.b CODE_18CF74
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CF74:
	LDA.w $1F53
CODE_18CF77:
	LDX.b #$00
CODE_18CF79:
	LSR.b $F6
	BCS.b CODE_18CF96
	LDA.b [$E2]
	STA.l $7F0000,x
	INC.b $E2
	BNE.b CODE_18CF96
	INC.b $E3
	BNE.b CODE_18CF96
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18CF96:
	INX
	CPX.b #$08
	BNE.b CODE_18CF79
	LDX.w $1F53
	TXA
	LSR
	ROR
	TAX
	AND.b #$80
	STA.b $F2
	TXA
	ROR
	TAX
	AND.b #$80
	STA.b $F3
	TXA
	ROR
	TAX
	AND.b #$80
	STA.b $F4
	TXA
	ROR
	AND.b #$80
	STA.b $F5
	LDX.b #$07
CODE_18CFBC:
	SEP.b #$20
	LDA.l $7F0000,x
	STA.b $EA
	LDY.b #$08
	REP.b #$20
	LDA.w #$0000
CODE_18CFCB:
	LSR
	LSR.b $EA
	BCC.b CODE_18CFD7
	ORA.b $F4
	DEY
	BNE.b CODE_18CFCB
	BRA.b CODE_18CFDC

CODE_18CFD7:
	ORA.b $F2
	DEY
	BNE.b CODE_18CFCB
CODE_18CFDC:
	PHA
	TXY
	TXA
	ASL
	TAX
	PLA
	STA.l $7F0000,x
	TYX
	DEX
	BPL.b CODE_18CFBC
	JMP.w CODE_18D175

CODE_18CFED:
	BIT.b #$30
	BEQ.b CODE_18D05F
	LDA.b [$E2]
	STA.b $EA
	INC.b $E2
	BNE.b CODE_18D008
	INC.b $E3
	BNE.b CODE_18D008
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D008:
	LDA.b [$E2]
	STA.b $EB
	INC.b $E2
	BNE.b CODE_18D01F
	INC.b $E3
	BNE.b CODE_18D01F
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D01F:
	REP.b #$10
	LDX.w $1F55
	LDA.w $1F53
	STA.l $7F0020,x
	LDA.b $E2
	STA.l $7F0021,x
	LDA.b $E3
	STA.l $7F0022,x
	LDA.b $E4
	STA.l $7F0023,x
	REP.b #$20
	LDA.w $1F55
	CLC
	ADC.w #$0004
	STA.w $1F55
	LDA.w $1F46
	CLC
	ADC.b $EA
	ORA.w #$8000
	STA.b $E2
	LDA.w $1F48
	ADC.w #$0000
	STA.b $E4
	JMP.w CODE_18CEE5

CODE_18D05F:
	REP.b #$20
	STZ.b $F2
	STZ.b $F4
	STZ.b $F6
	SEP.b #$20
	BIT.b #$04
	BEQ.b CODE_18D09E
	LDA.b [$E2]
	STA.b $F2
	INC.b $E2
	BNE.b CODE_18D084
	INC.b $E3
	BNE.b CODE_18D084
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D084:
	LDA.b [$E2]
	STA.b $F3
	INC.b $E2
	BNE.b CODE_18D09B
	INC.b $E3
	BNE.b CODE_18D09B
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D09B:
	LDA.w $1F53
CODE_18D09E:
	BIT.b #$02
	BEQ.b CODE_18D0D3
	LDA.b [$E2]
	STA.b $F4
	INC.b $E2
	BNE.b CODE_18D0B9
	INC.b $E3
	BNE.b CODE_18D0B9
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D0B9:
	LDA.b [$E2]
	STA.b $F5
	INC.b $E2
	BNE.b CODE_18D0D0
	INC.b $E3
	BNE.b CODE_18D0D0
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D0D0:
	LDA.w $1F53
CODE_18D0D3:
	LSR
	BCC.b CODE_18D11B
	LDA.b [$E2]
	STA.b $EA
	INC.b $E2
	BNE.b CODE_18D0ED
	INC.b $E3
	BNE.b CODE_18D0ED
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D0ED:
	LDA.b [$E2]
	STA.b $F6
	INC.b $E2
	BNE.b CODE_18D104
	INC.b $E3
	BNE.b CODE_18D104
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D104:
	LDA.b [$E2]
	STA.b $F7
	INC.b $E2
	BNE.b CODE_18D11B
	INC.b $E3
	BNE.b CODE_18D11B
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D11B:
	REP.b #$20
	LDX.b #$00
CODE_18D11F:
	LSR.b $F2
	BCC.b CODE_18D133
	SEP.b #$20
	LDA.b #$00
	STA.l $7F0000,x
	REP.b #$20
	LSR.b $F4
	LSR.b $F6
	BRA.b CODE_18D170

CODE_18D133:
	LSR.b $F4
	BCC.b CODE_18D145
	SEP.b #$20
	LDA.b #$FF
	STA.l $7F0000,x
	REP.b #$20
	LSR.b $F6
	BRA.b CODE_18D170

CODE_18D145:
	LSR.b $F6
	BCC.b CODE_18D153
	SEP.b #$20
	LDA.b $EA
	STA.l $7F0000,x
	BRA.b CODE_18D16E

CODE_18D153:
	SEP.b #$20
	LDA.b [$E2]
	STA.l $7F0000,x
	INC.b $E2
	BNE.b CODE_18D16E
	INC.b $E3
	BNE.b CODE_18D16E
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D16E:
	REP.b #$20
CODE_18D170:
	INX
	CPX.b #$10
	BNE.b CODE_18D11F
CODE_18D175:
	SEP.b #$30
	BIT.w $1F53
	BPL.b CODE_18D17F
	JSR.w CODE_18D29E
CODE_18D17F:
	REP.b #$10
	LDX.w $1F55
	BNE.b CODE_18D189
	JMP.w CODE_18D276

CODE_18D189:
	DEX
	DEX
	DEX
	DEX
	LDA.l $7F0020,x
	STA.w $1F53
	LDA.l $7F0021,x
	STA.b $E2
	LDA.l $7F0022,x
	STA.b $E3
	LDA.l $7F0023,x
	STA.b $E4
	STX.w $1F55
	SEP.b #$10
	LDA.w $1F53
	BIT.b #$20
	BEQ.b CODE_18D206
	LDA.b [$E2]
	STA.b $F2
	INC.b $E2
	BNE.b CODE_18D1C9
	INC.b $E3
	BNE.b CODE_18D1C9
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D1C9:
	LDA.b [$E2]
	STA.b $F3
	INC.b $E2
	BNE.b CODE_18D1E0
	INC.b $E3
	BNE.b CODE_18D1E0
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D1E0:
	LDX.b #$00
CODE_18D1E2:
	LSR.b $F3
	ROR.b $F2
	BCC.b CODE_18D201
	LDA.b [$E2]
	STA.l $7F0000,x
	INC.b $E2
	BNE.b CODE_18D201
	INC.b $E3
	BNE.b CODE_18D201
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D201:
	INX
	CPX.b #$10
	BNE.b CODE_18D1E2
CODE_18D206:
	LDA.w $1F53
	BIT.b #$01
	BEQ.b CODE_18D25C
	REP.b #$30
	LDA.l $7F0000
	TAX
	LDA.l $7F000E
	STA.l $7F0000
	TXA
	STA.l $7F000E
	LDA.l $7F0002
	TAX
	LDA.l $7F000C
	STA.l $7F0002
	TXA
	STA.l $7F000C
	LDA.l $7F0004
	TAX
	LDA.l $7F000A
	STA.l $7F0004
	TXA
	STA.l $7F000A
	LDA.l $7F0006
	TAX
	LDA.l $7F0008
	STA.l $7F0006
	TXA
	STA.l $7F0008
	SEP.b #$30
	LDA.w $1F53
CODE_18D25C:
	BIT.b #$02
	BEQ.b CODE_18D273
	LDX.b #$00
CODE_18D262:
	LDA.l $7F0000,x
	TAY
	LDA.w DATA_19AE36,y
	STA.l $7F0000,x
	INX
	CPX.b #$10
	BNE.b CODE_18D262
CODE_18D273:
	JMP.w CODE_18D175

CODE_18D276:
	SEP.b #$30
	LDX.b $F0
	JSR.w (DATA_18D5EC,x)
	LDA.w $1F45
	BNE.b CODE_18D29A
	REP.b #$30
	LDA.b $E2
	CMP.w $1F4A
	LDA.b $E4
	SBC.w $1F4C
	BCS.b CODE_18D29A
	SEP.b #$20
	LDA.w $1F44
	BNE.b CODE_18D29C
	JMP.w CODE_18CEE5

CODE_18D29A:
	SEC
	RTS

CODE_18D29C:
	CLC
	RTS

CODE_18D29E:
	SEP.b #$30
	LDX.b #$0F
	LDA.b #$00
CODE_18D2A4:
	STA.l $7F0010,x
	DEX
	BPL.b CODE_18D2A4
	STZ.b $EA
	LDA.b #$80
	STA.b $EB
CODE_18D2B1:
	LDX.b $EA
	LDA.l $7F0000,x
	STA.b $EC
	LDA.l $7F0001,x
	STA.b $ED
	INX
	INX
	STX.b $EA
	LDX.b #$0E
CODE_18D2C5:
	ASL.b $EC
	BCC.b CODE_18D2D3
	LDA.l $7F0010,x
	ORA.b $EB
	STA.l $7F0010,x
CODE_18D2D3:
	ASL.b $ED
	BCC.b CODE_18D2E1
	LDA.l $7F0011,x
	ORA.b $EB
	STA.l $7F0011,x
CODE_18D2E1:
	DEX
	DEX
	BPL.b CODE_18D2C5
	LSR.b $EB
	BCC.b CODE_18D2B1
	LDX.b #$0E
	REP.b #$20
CODE_18D2ED:
	LDA.l $7F0010,x
	STA.l $7F0000,x
	DEX
	DEX
	BPL.b CODE_18D2ED
	SEP.b #$30
	RTS

CODE_18D2FC:
	REP.b #$10
	SEP.b #$20
	LDX.b $F0
	LDY.b $EE
	BEQ.b CODE_18D321
CODE_18D306:
	LDA.b [$E2]
	JSR.w (DATA_18D567,x)
	INC.b $E2
	BNE.b CODE_18D31E
	INC.b $E3
	BNE.b CODE_18D31E
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D31E:
	DEY
	BNE.b CODE_18D306
CODE_18D321:
	RTS

CODE_18D322:
	LDX.b $F0
	JSR.w (DATA_18D567,x)
	INC.b $E2
	BNE.b CODE_18D33A
	INC.b $E3
	BNE.b CODE_18D33A
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D33A:
	LDA.b [$E2]
	JSR.w (DATA_18D567,x)
	INC.b $E2
	BNE.b CODE_18D352
	INC.b $E3
	BNE.b CODE_18D352
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D352:
	DEY
	DEY
	BNE.b CODE_18D38D
	RTS

CODE_18D357:
	SEP.b #$20
	REP.b #$10
	LDA.b [$E2]
	STA.b $EC
	INC.b $E2
	BNE.b CODE_18D372
	INC.b $E3
	BNE.b CODE_18D372
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D372:
	LDA.b [$E2]
	STA.b $ED
	INC.b $E2
	BNE.b CODE_18D389
	INC.b $E3
	BNE.b CODE_18D389
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D389:
	LDY.b $EE
	DEY
	DEY
CODE_18D38D:
	LDA.b [$E2]
	CMP.b $EC
	BNE.b CODE_18D322
	STA.b $EA
	INC.b $E2
	BNE.b CODE_18D3A8
	INC.b $E3
	BNE.b CODE_18D3A8
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D3A8:
	LDA.b [$E2]
	CMP.b $ED
	BNE.b CODE_18D425
	INC.b $E2
	BNE.b CODE_18D3C1
	INC.b $E3
	BNE.b CODE_18D3C1
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D3C1:
	LDA.b [$E2]
	STA.b $EA
	INC.b $E2
	BNE.b CODE_18D3D8
	INC.b $E3
	BNE.b CODE_18D3D8
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D3D8:
	LDA.b [$E2]
	STA.b $EB
	INC.b $E2
	BNE.b CODE_18D3EF
	INC.b $E3
	BNE.b CODE_18D3EF
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D3EF:
	PHY
	LDA.b [$E2]
	SEP.b #$10
	TAY
	INC.b $E2
	BNE.b CODE_18D408
	INC.b $E3
	BNE.b CODE_18D408
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D408:
	LDX.b $F0
CODE_18D40A:
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	LDA.b $EB
	JSR.w (DATA_18D567,x)
	DEY
	BNE.b CODE_18D40A
	REP.b #$10
	PLY
	DEY
	DEY
	DEY
	DEY
	DEY
	BEQ.b CODE_18D424
	JMP.w CODE_18D38D

CODE_18D424:
	RTS

CODE_18D425:
	PHA
	LDA.b $EA
	LDX.b $F0
	JSR.w (DATA_18D567,x)
	PLA
	JSR.w (DATA_18D567,x)
	INC.b $E2
	BNE.b CODE_18D444
	INC.b $E3
	BNE.b CODE_18D444
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D444:
	DEY
	DEY
	BEQ.b CODE_18D424
	JMP.w CODE_18D38D

CODE_18D44B:
	STY.b $EC
	SEP.b #$10
	LDA.b [$E2]
	TAY
	INC.b $E2
	BNE.b CODE_18D465
	INC.b $E3
	BNE.b CODE_18D465
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D465:
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	LDA.b $EB
	JSR.w (DATA_18D567,x)
	DEY
	BNE.b CODE_18D465
	REP.b #$10
	LDY.b $EC
	DEY
	DEY
	DEY
	BNE.b CODE_18D484
	RTS

CODE_18D47C:
	SEP.b #$20
	REP.b #$10
	LDX.b $F0
	LDY.b $EE
CODE_18D484:
	LDA.b [$E2]
	STA.b $EC
	INC.b $E2
	BNE.b CODE_18D49B
	INC.b $E3
	BNE.b CODE_18D49B
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D49B:
	LDA.b [$E2]
	STA.b $EB
	INC.b $E2
	BNE.b CODE_18D4B2
	INC.b $E3
	BNE.b CODE_18D4B2
	REP.b #$20
	LDA.w #$8000
	STA.b $E2
	INC.b $E4
	SEP.b #$20
CODE_18D4B2:
	LDA.b $EC
	AND.b #$EE
	STA.b $EA
	CMP.b $EC
	BEQ.b CODE_18D4DA
	LDA.b $EC
	BIT.b #$10
	BEQ.b CODE_18D44B
	BIT.b #$01
	BEQ.b CODE_18D4D0
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	LDA.b $EB
	JSR.w (DATA_18D567,x)
CODE_18D4D0:
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	LDA.b $EB
	JSR.w (DATA_18D567,x)
CODE_18D4DA:
	LDA.b $EA
	JSR.w (DATA_18D567,x)
	LDA.b $EB
	JSR.w (DATA_18D567,x)
	DEY
	DEY
	BNE.b CODE_18D484
	RTS

DATA_18D4E9:
	dw CODE_18D50D
	dw CODE_18D4F5
	dw CODE_18D4FB
	dw CODE_18D4F5
	dw CODE_18D51E
	dw CODE_18D538

CODE_18D4F5:
	SEP.b #$20
	LDA.b #$80
	BRA.b CODE_18D4FF

CODE_18D4FB:
	SEP.b #$20
	LDA.b #$00
CODE_18D4FF:
	STA.w $2115
	STZ.w $1F52
	REP.b #$20
	LDA.b $E6
	STA.w $2116
	RTS

CODE_18D50D:
	REP.b #$20
	LDA.b $E6
	STA.w $2181
	SEP.b #$20
	LDA.b $E8
	AND.b #$01
	STA.w $2183
	RTS

CODE_18D51E:
	SEP.b #$20
	LDA.b #$55
	STA.w $2141
	REP.b #$20
	LDA.w #$BBAA
CODE_18D52A:
	CMP.w $2140
	BNE.b CODE_18D52A
	LDA.w #$0004
	STA.w $1F57
	STZ.b $E8
	RTS

CODE_18D538:
	SEP.b #$20
	LDA.b $E6
	STA.w $2121
	RTS

DATA_18D540:
	dw CODE_18D54C
	dw CODE_18D54C
	dw CODE_18D54C
	dw CODE_18D54C
	dw CODE_18D54D
	dw CODE_18D54C

CODE_18D54C:
	RTS

CODE_18D54D:
	REP.b #$20
	LDA.b $E6
	BNE.b CODE_18D556
	LDA.w #$FFC0
CODE_18D556:
	STA.w $2142
	SEP.b #$20
	STZ.w $2141
	LDA.b $E8
	CLC
	ADC.b #$03
	STA.w $2140
	RTS

DATA_18D567:
	dw CODE_18D573
	dw CODE_18D58F
	dw CODE_18D5A4
	dw CODE_18D5A8
	dw CODE_18D5AC
	dw CODE_18D5E8

CODE_18D573:
	STA.w $2180
	RTS

CODE_18D577:
	STA.b [$E6]
	INC.b $E6
	BEQ.b CODE_18D57E
	RTS

CODE_18D57E:
	INC.b $E7
	BEQ.b CODE_18D583
	RTS

CODE_18D583:
	REP.b #$20
	LDA.w #$8000
	STA.b $E6
	INC.b $E8
	SEP.b #$20
	RTS

CODE_18D58F:
	BIT.w $1F52
	BPL.b CODE_18D59B
	STA.w $2119
	STZ.w $1F52
	RTS

CODE_18D59B:
	STA.w $2118
	LDA.b #$80
	STA.w $1F52
	RTS

CODE_18D5A4:
	STA.w $2118
	RTS

CODE_18D5A8:
	STA.w $2119
	RTS

CODE_18D5AC:
	LSR.w $1F57
	BEQ.b CODE_18D5D8
	PHP
	REP.b #$10
	PHX
	PHA
	LDX.w #$0000
	LDA.w $1F57
	LSR
	BCC.b CODE_18D5C0
	INX
CODE_18D5C0:
	PLA
	STA.w $2142,x
	BCC.b CODE_18D5D5
	LDA.b #$01
	STA.w $2141
CODE_18D5CB:
	LDA.b #$CC
	STA.w $2140
	CMP.w $2140
	BNE.b CODE_18D5CB
CODE_18D5D5:
	PLX
	PLP
	RTS

CODE_18D5D8:
	STA.w $2141
	LDA.b $E8
	STA.w $2140
CODE_18D5E0:
	CMP.w $2140
	BNE.b CODE_18D5E0
	INC.b $E8
	RTS

CODE_18D5E8:
	STA.w $2122
	RTS

DATA_18D5EC:
	dw CODE_18D5F8
	dw CODE_18D669
	dw CODE_18D6A6
	dw CODE_18D717
	dw CODE_18D788
	dw CODE_18D789

CODE_18D5F8:
	LDA.l $7F0000
	STA.w $2180
	LDA.l $7F0001
	STA.w $2180
	LDA.l $7F0002
	STA.w $2180
	LDA.l $7F0003
	STA.w $2180
	LDA.l $7F0004
	STA.w $2180
	LDA.l $7F0005
	STA.w $2180
	LDA.l $7F0006
	STA.w $2180
	LDA.l $7F0007
	STA.w $2180
	LDA.l $7F0008
	STA.w $2180
	LDA.l $7F0009
	STA.w $2180
	LDA.l $7F000A
	STA.w $2180
	LDA.l $7F000B
	STA.w $2180
	LDA.l $7F000C
	STA.w $2180
	LDA.l $7F000D
	STA.w $2180
	LDA.l $7F000E
	STA.w $2180
	LDA.l $7F000F
	STA.w $2180
	RTS

CODE_18D669:
	REP.b #$20
	LDA.l $7F0000
	STA.w $2118
	LDA.l $7F0002
	STA.w $2118
	LDA.l $7F0004
	STA.w $2118
	LDA.l $7F0006
	STA.w $2118
	LDA.l $7F0008
	STA.w $2118
	LDA.l $7F000A
	STA.w $2118
	LDA.l $7F000C
	STA.w $2118
	LDA.l $7F000E
	STA.w $2118
	SEP.b #$20
	RTS

CODE_18D6A6:
	LDA.l $7F0000
	STA.w $2118
	LDA.l $7F0001
	STA.w $2118
	LDA.l $7F0002
	STA.w $2118
	LDA.l $7F0003
	STA.w $2118
	LDA.l $7F0004
	STA.w $2118
	LDA.l $7F0005
	STA.w $2118
	LDA.l $7F0006
	STA.w $2118
	LDA.l $7F0007
	STA.w $2118
	LDA.l $7F0008
	STA.w $2118
	LDA.l $7F0009
	STA.w $2118
	LDA.l $7F000A
	STA.w $2118
	LDA.l $7F000B
	STA.w $2118
	LDA.l $7F000C
	STA.w $2118
	LDA.l $7F000D
	STA.w $2118
	LDA.l $7F000E
	STA.w $2118
	LDA.l $7F000F
	STA.w $2118
	RTS

CODE_18D717:
	LDA.l $7F0000
	STA.w $2119
	LDA.l $7F0001
	STA.w $2119
	LDA.l $7F0002
	STA.w $2119
	LDA.l $7F0003
	STA.w $2119
	LDA.l $7F0004
	STA.w $2119
	LDA.l $7F0005
	STA.w $2119
	LDA.l $7F0006
	STA.w $2119
	LDA.l $7F0007
	STA.w $2119
	LDA.l $7F0008
	STA.w $2119
	LDA.l $7F0009
	STA.w $2119
	LDA.l $7F000A
	STA.w $2119
	LDA.l $7F000B
	STA.w $2119
	LDA.l $7F000C
	STA.w $2119
	LDA.l $7F000D
	STA.w $2119
	LDA.l $7F000E
	STA.w $2119
	LDA.l $7F000F
	STA.w $2119
	RTS

CODE_18D788:
	RTS

CODE_18D789:
	LDA.l $7F0000
	STA.w $2122
	LDA.l $7F0001
	STA.w $2122
	LDA.l $7F0002
	STA.w $2122
	LDA.l $7F0003
	STA.w $2122
	LDA.l $7F0004
	STA.w $2122
	LDA.l $7F0005
	STA.w $2122
	LDA.l $7F0006
	STA.w $2122
	LDA.l $7F0007
	STA.w $2122
	LDA.l $7F0008
	STA.w $2122
	LDA.l $7F0009
	STA.w $2122
	LDA.l $7F000A
	STA.w $2122
	LDA.l $7F000B
	STA.w $2122
	LDA.l $7F000C
	STA.w $2122
	LDA.l $7F000D
	STA.w $2122
	LDA.l $7F000E
	STA.w $2122
	LDA.l $7F000F
	STA.w $2122
	RTS

CODE_18D7FA:
	STX.b $E6
	STY.w $1F4E
	TAX
	XBA
	AND.w #$00FE
	STA.b $F0
	TXA
	AND.w #$00FF
	STA.b $E8
	LDA.w SXAR_UnsortedDataBlock3_DATA_19C79E,y
	STA.w $1F50
	LDA.w SXAR_UnsortedDataBlock3_DataBlockSize,y
	STA.b $EE
CODE_18D817:
	TYA
	ASL
	TAY
	LDA.w SXAR_UnsortedDataBlock3_Ptrs,y
	CLC
	ADC.w #SXAR_UnsortedDataBlock3_Main&$8000
	ORA.w #SXAR_UnsortedDataBlock3_Main&$8000
	STA.b $E2
	PHP
	LDA.w SXAR_UnsortedDataBlock3_Ptrs+$02,y
	ASL
	PLP
	ADC.w #SXAR_UnsortedDataBlock3_Main>>16
	STA.b $E4
	RTS

CODE_18D832:
	PHP
	REP.b #$30
	PHX
	PHY
	PHA
	SEP.b #$30
	LDA.l $001FC2
	TAX
	INC
	AND.b #$0F
	CMP.l $001FC0
	BEQ.b CODE_18D860
	PLA
	STA.l $001FD6,x
	PLA
	STA.l $001FC6,x
	INX
	TXA
	AND.b #$0F
	STA.l $001FC2
	REP.b #$30
	PLY
	PLX
	PLP
	RTS

CODE_18D860:
	REP.b #$30
	PLA
	PLY
	PLX
	PLP
	RTS

CODE_18D867:
	PHP
	SEP.b #$30
	LDA.l $001FC4
	CMP.w $2140
	BNE.b CODE_18D8A9
	LDA.l $001FC0
	CMP.l $001FC2
	BEQ.b CODE_18D8A9
	TAX
	LDA.l $001FC6,x
	PHA
	LDA.l $001FD6,x
	PHA
	TXA
	INC
	AND.b #$0F
	STA.l $001FC0
	REP.b #$20
	PLA
	STA.w $2142
	SEP.b #$20
	LDA.l $001FC4
CODE_18D89C:
	INC
	BEQ.b CODE_18D89C
	STA.l $001FC4
	STA.w $2140
	PLP
	CLC
	RTS

CODE_18D8A9:
	PLP
	SEC
	RTS

CODE_18D8AC:
	PHP
	SEP.b #$30
	LDX.b #$04
CODE_18D8B1:
	LDA.w DATA_198A91,x
	STA.b $AB,x
	DEX
	BPL.b CODE_18D8B1
	PLP
	RTS

CODE_18D8BB:
	PHX
	PHY
	PHP
	SEP.b #$30
	ROR.b $AF
	LDA.b $AE
	PHA
	ROR
	STA.b $AF
	LDA.b $AD
	TAX
	ASL
	ASL
	ASL
	ASL
	STA.b $AE
	LDA.b $AC
	STA.b $AD
	LSR
	LSR
	LSR
	LSR
	ORA.b $AE
	EOR.b $AF
	STX.b $AE
	LDX.b $AB
	STX.b $AC
	STA.b $AB
	PLA
	STA.b $AF
	PLP
	PLY
	PLX
	LDA.b $AB
	RTS

CODE_18D8EE:
	JSR.w CODE_18D967
CODE_18D8F1:
	PHP
	JSR.w CODE_18D98A
	JSR.w CODE_18DA15
	JSR.w CODE_18DC95
	JSR.w CODE_18DBE1
	REP.b #$20
	STZ.b $02
	STZ.w $0C93
	STZ.w $0C95
	STZ.w $0C97
	STZ.w $0C99
	STZ.w $0C9B
	STZ.w $0C9D
	STZ.w $0C9F
	STZ.w $0CA1
	STZ.w $1200
	STZ.w $1202
	PLP
	RTS

CODE_18D922:
	PHP
	SEP.b #$20
	STZ.b $04
	PLP
	RTS

CODE_18D929:
	JSR.w CODE_18DA01
	JSR.w CODE_18DA0B
	JMP.w CODE_18D929

CODE_18D932:
	PHP
	REP.b #$30
	LDA.b $00
CODE_18D937:
	PHA
	PHX
	PHY
	JSR.w CODE_18D867
	PLY
	PLX
	PLA
	CMP.b $00
	BEQ.b CODE_18D937
	PLP
	RTS

CODE_18D946:
	JSR.w CODE_18D932
	DEX
	BNE.b CODE_18D946
	RTS

CODE_18D94D:
	PHP
	SEP.b #$20
	LDA.b #$00
	STA.w $0C90
CODE_18D955:
	JSR.w CODE_18D932
	INC.w $0C90
	LDA.w $0C90
	STA.w $0C91
	CMP.b #$0F
	BNE.b CODE_18D955
	PLP
	RTS

CODE_18D967:
	PHP
	SEP.b #$20
	LDA.b #$0F
	STA.w $0C90
CODE_18D96F:
	JSR.w CODE_18D932
	LDA.w $0C90
	STA.w $0C91
	DEC.w $0C90
	BPL.b CODE_18D96F
	PLP
	RTS

CODE_18D97F:
	PHP
	SEP.b #$20
	STZ.w $0C91
	JSR.w CODE_18D932
	PLP
	RTS

CODE_18D98A:
	PHP
	SEP.b #$30
	LDA.b #$80
	STA.w $0C91
	JSR.w CODE_18D932
	LDX.b #$00
CODE_18D997:
	STZ.w $0420,x
	STZ.w $0520,x
	DEX
	BNE.b CODE_18D997
	PLP
	RTS

CODE_18D9A2:
	PHP
	REP.b #$20
	LDA.w #$0420
	STA.w $4302
	LDA.w #$0200
	STA.w $4305
	SEP.b #$20
	LDA.b #$22
	STA.w $4301
	STZ.w $2121
	STZ.w $4300
	STZ.w $4307
	STZ.w $4304
	LDA.b #$01
	STA.w $420B
	PLP
	RTS

CODE_18D9CB:
	PHP
	REP.b #$30
	LDA.w DATA_198A62+$02,y
	STA.b $05
	SEP.b #$20
	LDA.w DATA_198A62,y
	ASL
	STA.b $09
	LDA.b #$00
	ADC.b #$00
	STA.b $0A
	LDA.w DATA_198A62+$01,y
	STA.b $07
	REP.b #$10
	LDX.b $09
	LDY.w #$0000
CODE_18D9ED:
	LDA.b ($05),y
	STA.w $0420,x
	INY
	INX
	LDA.b ($05),y
	STA.w $0420,x
	INY
	INX
	DEC.b $07
	BNE.b CODE_18D9ED
	PLP
	RTS

CODE_18DA01:
	PHP
	SEP.b #$20
	LDA.b #$08
	STA.w $2100
	PLP
	RTS

CODE_18DA0B:
	PHP
	SEP.b #$20
	LDA.b #$0F
	STA.w $2100
	PLP
	RTS

CODE_18DA15:
	PHP
	REP.b #$30
	LDA.w #$E020
	LDX.w #$00FE
CODE_18DA1E:
	STA.w $0200,x
	STA.w $0300,x
	DEX
	DEX
	BPL.b CODE_18DA1E
	LDX.w #$001E
	LDA.w #$FFFF
CODE_18DA2E:
	STA.w $0400,x
	DEX
	BPL.b CODE_18DA2E
	PLP
	RTS

CODE_18DA36:
	PHP
	REP.b #$20
	STZ.w $2102
	LDA.w #$0200
	STA.w $4302
	LDA.w #$0220
	STA.w $4305
	SEP.b #$20
	LDA.b #$04
	STA.w $4301
	STZ.w $4300
	STZ.w $4307
	STZ.w $4304
	LDA.b #$01
	STA.w $420B
	PLP
	RTS

CODE_18DA5F:
	PHP
	JSR.w CODE_18DA15
	REP.b #$30
	LDA.w #$0000
	STA.b $05
	LDA.w #$1040
	STA.b $2D
	LDA.w #$0000
	STA.b $2F
CODE_18DA74:
	JSR.w CODE_18D932
	SEP.b #$20
	LDA.b $05
	STA.w $2101
	REP.b #$20
	LDA.w #$AAAA
	STA.w $0400
	STA.w $0402
	STA.w $0404
	STA.w $0406
	STA.w $0408
	STA.w $040A
	STA.w $040C
	STA.w $040E
	STA.w $0410
	STA.w $0412
	STA.w $0414
	STA.w $0416
	STA.w $0418
	STA.w $041A
	STA.w $041C
	STA.w $041E
	LDX.w #$0000
	LDY.w #$0000
	LDA.b $2D
	STA.b $25
	LDA.w #$0010
	STA.b $2B
CODE_18DAC2:
	LDA.w #$0008
	STA.b $29
CODE_18DAC7:
	LDA.b $25
	STA.w $0200,x
	LDA.w DATA_198CE5,y
	ORA.w #$3000
	ORA.b $2F
	STA.w $0202,x
	INY
	INY
	INX
	INX
	INX
	INX
	SEP.b #$20
	LDA.b $25
	CLC
	ADC.b #$10
	STA.b $25
	REP.b #$20
	DEC.b $29
	BNE.b CODE_18DAC7
	SEP.b #$20
	LDA.b $2D
	STA.b $25
	LDA.b $26
	CLC
	ADC.b #$10
	STA.b $26
	REP.b #$20
	DEC.b $2B
	BNE.b CODE_18DAC2
	LDA.b $0D
	BIT.w #$0800
	BEQ.b CODE_18DB0E
	LDA.b $2D
	SEC
	SBC.w #$0200
	STA.b $2D
CODE_18DB0E:
	LDA.b $0D
	BIT.w #$0400
	BEQ.b CODE_18DB1D
	LDA.b $2D
	CLC
	ADC.w #$0200
	STA.b $2D
CODE_18DB1D:
	LDA.b $0D
	BIT.w #$0200
	BEQ.b CODE_18DB2A
	SEP.b #$20
	DEC.b $2D
	REP.b #$20
CODE_18DB2A:
	LDA.b $0D
	BIT.w #$0100
	BEQ.b CODE_18DB37
	SEP.b #$20
	INC.b $2D
	REP.b #$20
CODE_18DB37:
	LDA.b $1D
	BIT.w #$3000
	BNE.b CODE_18DB90
	BIT.w #$0040
	BEQ.b CODE_18DB45
	STZ.b $05
CODE_18DB45:
	LDA.b $0D
	BIT.w #$4000
	BEQ.b CODE_18DB51
	LDA.w #$0001
	STA.b $05
CODE_18DB51:
	LDA.b $0D
	BIT.w #$0080
	BEQ.b CODE_18DB5D
	LDA.w #$0002
	STA.b $05
CODE_18DB5D:
	LDA.b $0D
	BIT.w #$8000
	BEQ.b CODE_18DB69
	LDA.w #$0003
	STA.b $05
CODE_18DB69:
	LDA.b $1D
	BIT.w #$0020
	BEQ.b CODE_18DB7B
	LDA.b $2F
	SEC
	SBC.w #$0200
	AND.w #$0E00
	STA.b $2F
CODE_18DB7B:
	LDA.b $1D
	BIT.w #$0010
	BEQ.b CODE_18DB8D
	LDA.b $2F
	CLC
	ADC.w #$0200
	AND.w #$0E00
	STA.b $2F
CODE_18DB8D:
	JMP.w CODE_18DA74

CODE_18DB90:
	SEP.b #$20
	STZ.w $2101
	PLP
	RTS

CODE_18DB97:
	PHP
	REP.b #$10
	LDX.w #$7000
	JSR.w CODE_18DBAE
	LDX.w #$7400
	JSR.w CODE_18DBAE
	LDX.w #$7800
	JSR.w CODE_18DBAE
	PLP
	RTS

CODE_18DBAE:
	PHP
	SEP.b #$20
	LDA.b #$80
	STA.w $2115
	LDA.b #$09
	STA.w $4310
	LDA.b #$18
	STA.w $4311
	LDA.b #$000025>>16
	STA.w $4314
	REP.b #$30
	STX.w $2116
	STZ.b $25
	LDA.w #$000025
	STA.w $4312
	LDX.w #$0800
	STX.w $4315
	SEP.b #$20
	LDA.b #$02
	STA.w $420B
	PLP
	RTS

CODE_18DBE1:
	PHP
	SEP.b #$20
	LDA.b #$8F
	STA.w $0C91
	STA.w $2100
	STZ.w $2101
	STZ.w $2102
	STZ.w $2103
	STZ.w $2104
	STZ.w $2105
	STZ.w $2106
	STZ.w $2107
	STZ.w $2108
	STZ.w $2109
	STZ.w $210A
	STZ.w $210B
	STZ.w $210C
	STZ.w $210D
	STZ.w $210D
	STZ.w $210F
	STZ.w $210F
	STZ.w $2111
	STZ.w $2111
	STZ.w $2113
	STZ.w $2113
	STZ.w $210E
	STZ.w $210E
	STZ.w $2110
	STZ.w $2110
	STZ.w $2112
	STZ.w $2112
	STZ.w $2114
	STZ.w $2114
	LDA.b #$80
	STA.w $2115
	STZ.w $2116
	STZ.w $2117
	STZ.w $211A
	STZ.w $2123
	STZ.w $2124
	STZ.w $2125
	STZ.w $2126
	STZ.w $2127
	STZ.w $2128
	STZ.w $2129
	STZ.w $212A
	STZ.w $212B
	STZ.w $212C
	STZ.w $212D
	STZ.w $212E
	STZ.w $212F
	LDA.b #$30
	STA.w $2130
	STZ.w $2131
	LDA.b #$E0
	STA.w $2132
	STZ.w $2133
	PLP
	RTS

CODE_18DC87:
	PHP
	SEP.b #$20
	STZ.w $420B
	STZ.w $420C
	STZ.w $420D
	PLP
	RTS

CODE_18DC95:
	PHP
	SEP.b #$20
	STZ.b $04
	PLP
	RTS

CODE_18DC9C:
	PHP
	SEP.b #$20
	LDA.b #$80
	STA.b $04
	PLP
	RTS

CODE_18DCA5:
	SEI
	PHP
	SEP.b #$20
	LDA.w $0C92
	AND.b #$CF
	STA.w $0C92
	STA.w $4200
	REP.b #$20
	LDA.w #$0100
	STA.w $4207
	LDA.w #$00CE
	STA.w $4209
	SEP.b #$20
	LDA.w $0C92
	ORA.b #$30
	STA.w $0C92
	STA.w $4200
	PLP
	CLI
	RTS

CODE_18DCD2:
	SEI
	PHP
	LDA.w $0C92
	AND.b #$CF
	STA.w $0C92
	STA.w $4200
	PLP
	RTS

CODE_18DCE1:
	PHP
	SEP.b #$30
	STZ.w $420C
	LDA.b #$4B
	STA.w $4370
	LDA.b #$11
	STA.w $4371
	LDA.b #DATA_198C8C
	STA.w $4372
	LDA.b #DATA_198C8C>>8
	STA.w $4373
	LDA.b #DATA_198C8C>>16
	STA.w $4374
	LDA.b #$99
	STA.w $4375
	LDA.b #$8C
	STA.w $4376
	LDA.b #DATA_198C8C>>16
	STA.w $4377
	LDA.b #$80
	STA.w $420C
	PLP
	RTS

CODE_18DD16:
	REP.b #$30
	CLD
	PHA
	PHX
	PHY
	SEP.b #$20
	BIT.w $4211
	BPL.b CODE_18DD28
	LDA.b #$80
	STA.w $2100
CODE_18DD28:
	REP.b #$30
	PLY
	PLX
	PLA
	RTL

CODE_18DD2E:
	REP.b #$30
	CLD
	PHA
	PHX
	PHY
	SEP.b #$20
	BIT.b $04
	BPL.b CODE_18DD47
	JSR.w CODE_18DA36
	JSR.w CODE_18D9A2
	REP.b #$10
	LDX.b $02
	JSR.w (DATA_18DE0F,x)
CODE_18DD47:
	SEP.b #$20
	LDA.w $0C91
	STA.w $2100
	LDA.w $0C93
	CLC
	ADC.w $1200
	STA.w $210D
	LDA.w $0C94
	ADC.w $1201
	STA.w $210D
	LDA.w $0C9B
	CLC
	ADC.w $1202
	STA.w $210E
	LDA.w $0C9C
	ADC.w $1203
	STA.w $210E
	LDA.w $0C95
	STA.w $210F
	LDA.w $0C96
	STA.w $210F
	LDA.w $0C9D
	STA.w $2110
	LDA.w $0C9E
	STA.w $2110
	LDA.w $0C97
	STA.w $2111
	LDA.w $0C98
	STA.w $2111
	LDA.w $0C9F
	STA.w $2112
	LDA.w $0CA0
	STA.w $2112
	LDA.w $0C99
	STA.w $2113
	LDA.w $0C9A
	STA.w $2113
	LDA.w $0CA1
	STA.w $2114
	LDA.w $0CA2
	STA.w $2114
	REP.b #$20
	INC.b $00
	LDA.b $0D
	STA.b $15
	LDA.b $0F
	STA.b $17
	LDA.b $11
	STA.b $19
	LDA.b $13
	STA.b $1B
	LDA.w $4218
	STA.b $0D
	LDA.w $421A
	STA.b $0F
	LDA.w $421C
	STA.b $11
	LDA.w $421E
	STA.b $13
	LDA.b $15
	EOR.w #$FFFF
	AND.b $0D
	STA.b $1D
	LDA.b $17
	EOR.w #$FFFF
	AND.b $0F
	STA.b $1F
	LDA.b $19
	EOR.w #$FFFF
	AND.b $11
	STA.b $21
	LDA.b $1B
	EOR.w #$FFFF
	AND.b $13
	STA.b $23
	REP.b #$30
	PLY
	PLX
	PLA
	RTL

DATA_18DE0F:
	dw CODE_18DE13
	dw CODE_18DE14

CODE_18DE13:
	RTS

CODE_18DE14:
	JSR.w CODE_18CC0A
	SEP.b #$20
	BIT.b $66
	BPL.b CODE_18DE20
	JSR.w CODE_18C459
CODE_18DE20:
	BIT.w $10FC
	BPL.b CODE_18DE2E
	STZ.w $10FC
	JSR.w CODE_18CCD9
	JMP.w CODE_18CB7A

CODE_18DE2E:
	JSR.w CODE_18CB81
	JSR.w CODE_18CC90
	JMP.w CODE_18CCD9

CODE_18DE37:
	PHP
	SEP.b #$20
	REP.b #$10
	LDA.b #$80
	STA.w $2115
	LDX.w #$786C
	STX.w $2116
	LDA.w !RAM_SXAR_SpiderMan_XPosHi
	JSR.w CODE_18DE76
	LDA.w !RAM_SXAR_SpiderMan_XPosLo
	JSR.w CODE_18DE76
	STZ.w $2119
	LDA.w !RAM_SXAR_SpiderMan_YPosHi
	JSR.w CODE_18DE76
	LDA.w !RAM_SXAR_SpiderMan_YPosLo
	JSR.w CODE_18DE76
	STZ.w $2119
	LDA.w $1111
	JSR.w CODE_18DE76
	LDA.w $1110
	JSR.w CODE_18DE76
	STZ.w $2119
	PLP
	RTS

CODE_18DE76:
	PHA
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_18DE81
	PLA
	AND.b #$0F
CODE_18DE81:
	CLC
	ADC.b #$01
	STA.w $2118
	LDA.b #$20
	STA.w $2119
	RTS

	%InsertGarbageData($18DE8D, incbin, DATA_18DE8D.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank19Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

MainDataBank03:

DATA_198000:
	dw DATA_1984E2,DATA_1982F6,DATA_19815E,DATA_198052,DATA_19800A

DATA_19800A:
	dw $0010,$00B7,$0004,$3000,$0028,$0000,$0000
	dw $0010,$00EF,$0004,$3000,$0028,$0006,$0000
	dw $01F0,$00B7,$0004,$7000,$0028,$0002,$0000
	dw $01F0,$00EF,$0004,$7000,$0028,$0004,$0000
	dw $01B0,$010F,$0007,$3000,$0024,$0000,$0000
	dw $DDDD

DATA_198052:
	dw $0020,$0220,$0002,$6000,$0010,$0210,$0278
	dw $0020,$0330,$0002,$6000,$0010,$0320,$0378
	dw $0020,$028F,$0003,$2000,$0002,$0000,$0000
	dw $0038,$00F0,$0003,$2000,$0002,$0000,$0000
	dw $0040,$0170,$0002,$6000,$000A,$0168,$0188
	dw $0048,$012F,$0002,$7000,$0006,$0000,$0000
	dw $0074,$04AF,$0002,$7000,$0006,$8000,$0000
	dw $00AD,$01DF,$0002,$7000,$0006,$8000,$0000
	dw $00EF,$021F,$0003,$2000,$0002,$0000,$0000
	dw $00F0,$03D4,$0003,$2000,$0002,$0000,$0000
	dw $00F8,$034F,$0002,$7000,$0006,$0000,$0000
	dw $0130,$041F,$0002,$7000,$0006,$0000,$0000
	dw $0154,$028F,$0002,$7000,$0006,$0000,$0000
	dw $0150,$014F,$0002,$7000,$0006,$0000,$0000
	dw $01B0,$008F,$0002,$7000,$0006,$0000,$0000
	dw $01B0,$018F,$0002,$7000,$0006,$0000,$0000
	dw $01B6,$04AF,$0002,$7000,$0006,$8000,$0000
	dw $01C0,$0270,$0002,$2000,$000A,$0260,$02C0
	dw $01C0,$0310,$0002,$2000,$000A,$02E0,$0348
	dw $DDDD

DATA_19815E:
	dw $02AE,$055F,$0003,$3000,$0022,$0000,$0000
	dw $0080,$03E4,$0003,$3000,$0022,$0000,$0000
	dw $00AC,$0490,$0003,$3000,$0022,$0000,$0000
	dw $0039,$05A4,$0003,$3000,$0022,$0000,$0000
	dw $01C0,$057F,$0003,$3000,$0022,$0000,$0000
	dw $00F8,$057F,$0003,$3000,$0022,$0000,$0000
	dw $00F0,$0470,$0003,$3000,$0022,$0000,$0000
	dw $01A0,$036F,$0003,$3000,$0022,$0000,$0000
	dw $0150,$03CF,$0003,$3000,$0022,$0000,$0000
	dw $02D0,$0300,$0003,$3000,$0022,$0000,$0000
	dw $02D0,$0180,$0003,$3000,$0022,$0000,$0000
	dw $02D0,$00E0,$0003,$3000,$0022,$0000,$0000
	dw $0130,$0098,$0003,$3000,$0022,$0000,$0000
	dw $0168,$00DF,$0003,$3000,$0022,$0000,$0000
	dw $0270,$011F,$0003,$3000,$0022,$0000,$0000
	dw $0289,$02DF,$0003,$3000,$0022,$0000,$0000
	dw $024F,$01BF,$0003,$3000,$0022,$0000,$0000
	dw $01BF,$022F,$0003,$3000,$0022,$0000,$0000
	dw $0154,$02DF,$0003,$3000,$0022,$0000,$0000
	dw $0070,$01F8,$0003,$3000,$0022,$0000,$0000
	dw $0030,$0350,$0002,$6000,$000A,$0344,$0370
	dw $003C,$05DF,$0003,$2000,$0002,$0000,$0000
	dw $0090,$0064,$0002,$7000,$000C,$0090,$00D0
	dw $00F0,$0498,$0002,$6000,$000A,$0490,$04AC
	dw $0130,$0050,$0003,$2000,$0002,$0000,$0000
	dw $0140,$03A0,$0002,$6000,$000A,$0390,$03C8
	dw $0160,$02A0,$0002,$2000,$000A,$0280,$02C8
	dw $0240,$05A0,$0002,$2000,$0010,$0588,$05A8
	dw $0270,$03C8,$0002,$7000,$000C,$0260,$0288
	dw $DDDD

DATA_1982F6:
	dw $0088,$008F,$0002,$7000,$0006,$8000,$0000
	dw $00C0,$014F,$0002,$7000,$0006,$0000,$0000
	dw $00D0,$00D0,$0003,$2000,$0002,$0000,$0000
	dw $01D0,$00BE,$0002,$3000,$001A,$01B0,$01F0
	dw $0204,$01EF,$0003,$2000,$0002,$0000,$0000
	dw $0240,$0100,$0000,$7000,$0018,$0000,$0000
	dw $0260,$013E,$0002,$3000,$001A,$0238,$0288
	dw $0334,$004F,$0003,$2000,$0002,$0000,$0000
	dw $0368,$013F,$0002,$7000,$0006,$0000,$0000
	dw $03A8,$01BF,$0002,$7000,$0006,$8000,$0000
	dw $0438,$00FF,$0003,$2000,$0002,$0000,$0000
	dw $0530,$013F,$0002,$7000,$0006,$0000,$0000
	dw $0538,$006F,$0002,$7000,$0006,$0000,$0000
	dw $0680,$0100,$0000,$7000,$0018,$FFFF,$0000
	dw $06E0,$00EF,$0002,$7000,$0006,$0000,$0000
	dw $06F0,$01AF,$0003,$2000,$0002,$0000,$0000
	dw $0700,$01DF,$0002,$7000,$0006,$8000,$0000
	dw $0710,$01AF,$0003,$2000,$0002,$0000,$0000
	dw $0728,$012F,$0002,$7000,$0006,$0000,$0000
	dw $0880,$0100,$0000,$7000,$0018,$0000,$0000
	dw $08A0,$00E7,$0002,$3000,$001A,$0890,$08C0
	dw $08D4,$005F,$0002,$7000,$0006,$0000,$0000
	dw $09C4,$00BF,$0002,$7000,$0006,$8000,$0000
	dw $0A40,$0160,$0002,$6000,$000A,$0150,$01E0
	dw $0A60,$0080,$0002,$7000,$0012,$0A50,$0A80
	dw $0B48,$01DF,$0003,$2000,$0002,$0000,$0000
	dw $0D88,$015F,$0002,$7000,$0006,$0000,$0000
	dw $0F58,$005F,$0002,$7000,$0006,$0000,$0000
	dw $0FC0,$005F,$0003,$2000,$0002,$0000,$0000
	dw $10B0,$009F,$0002,$7000,$0012,$10A0,$1100
	dw $1108,$01DF,$0003,$2000,$0004,$0000,$0000
	dw $1168,$005F,$0002,$7000,$0006,$0000,$0000
	dw $1260,$005F,$0002,$7000,$0006,$8000,$0000
	dw $13A8,$01DF,$0006,$7000,$0020,$0000,$0000
	dw $13A8,$01DF,$0006,$7000,$001C,DATA_1987E2,$0000
	dw $DDDD

DATA_1984E2:
	dw $0030,$0108,$0002,$6000,$0010,$00D8,$0158
	dw $0030,$0218,$0002,$6000,$0010,$01E8,$0228
	dw $0038,$0050,$0003,$2000,$0002,$0000,$0000
	dw $0047,$043F,$0002,$7000,$0006,$0000,$0000
	dw $00D0,$0480,$0002,$6000,$000A,$0400,$04A0
	dw $00E7,$02DF,$0002,$3000,$0006,$8000,$0000
	dw $0160,$0088,$0002,$7000,$0012,$0148,$01C4
	dw $0188,$03AF,$0003,$2000,$0002,$0000,$0000
	dw $0200,$02D8,$0002,$7000,$000C,$0198,$0220
	dw $0220,$04A0,$0003,$2000,$0002,$0000,$0000
	dw $0270,$0430,$0002,$7000,$0006,$0000,$0000
	dw $02C0,$0060,$0002,$2000,$000A,$0050,$0078
	dw $02C0,$0248,$0002,$6000,$000A,$0220,$0258
	dw $0350,$013F,$0002,$6000,$000E,DATA_1987D2,$0000
	dw $0300,$0080,$0002,$6000,$0010,$0050,$00A0
	dw $0314,$02DF,$0002,$3000,$0006,$0000,$0000
	dw $0320,$042F,$0002,$7000,$0006,$0000,$0000
	dw $03A0,$01A8,$0002,$7000,$000C,$0390,$03E0
	dw $03E8,$033F,$0002,$3000,$0006,$0000,$0000
	dw $03E4,$046F,$0002,$7000,$0006,$0000,$0000
	dw $0410,$007F,$0003,$2000,$0002,$0000,$0000
	dw $0460,$007F,$0003,$2000,$0002,$0000,$0000
	dw $0480,$018F,$0003,$2000,$0002,$0000,$0000
	dw $04D0,$0040,$0002,$7000,$0012,$04B0,$0540
	dw $04A8,$018F,$0003,$2000,$0002,$0000,$0000
	dw $049A,$041F,$0002,$7000,$0006,$0000,$0000
	dw $04D0,$007F,$0003,$2000,$0002,$0000,$0000
	dw $04E8,$033F,$0003,$2000,$0002,$0000,$0000
	dw $04F0,$03CF,$0002,$7000,$0006,$0000,$0000
	dw $052C,$02DF,$0002,$7000,$0006,$8000,$0000
	dw $0532,$013F,$0003,$2000,$0002,$0000,$0000
	dw $0540,$0400,$0002,$7000,$000C,$0530,$0580
	dw $0568,$00F0,$0002,$6000,$0010,$00D0,$0100
	dw $0640,$0430,$0002,$2000,$000A,$0410,$04A8
	dw $066A,$033F,$0002,$7000,$0006,$8000,$0000
	dw $0680,$0440,$0002,$6000,$000A,$0428,$0470
	dw $0686,$047F,$0003,$2000,$0002,$0000,$0000
	dw $06E0,$02A0,$0002,$7000,$000C,$0690,$07D0
	dw $06F8,$013F,$0002,$7000,$0006,$8000,$0000
	dw $0700,$020F,$0002,$6000,$000E,DATA_1987CA,$0000
	dw $0750,$0048,$0002,$7000,$0012,$0740,$0790
	dw $07D0,$0430,$0002,$7000,$000C,$07A0,$0830
	dw $07D8,$0444,$0003,$2000,$0002,$0000,$0000
	dw $0815,$020F,$0003,$2000,$0004,$0000,$0000
	dw $084F,$020F,$0003,$2000,$0002,$0000,$0000
	dw $0870,$03D0,$0002,$2000,$000A,$02D0,$03FC
	dw $0900,$0264,$0002,$6000,$000C,$08F0,$0950
	dw $0930,$0380,$0002,$6000,$000A,$0370,$0388
	dw $0930,$038F,$0003,$2000,$0002,$0000,$0000
	dw $0940,$0198,$0002,$6000,$000C,$0930,$0970
	dw $0946,$04AF,$0002,$7000,$0006,$8000,$0000
	dw $0980,$00BA,$0006,$7000,$0008,DATA_1987DA,$0000
	dw $09A0,$0400,$0002,$6000,$000A,$03E0,$0420
	dw $DDDD

DATA_1987CA:
	dw $0658,$0790,$0188,$020F

DATA_1987D2:
	dw $0270,$03E0,$00E0,$0140

DATA_1987DA:
	dw $0888,$09A0,$0060,$0130

DATA_1987E2:
	dw $11F0,$13C8,$00C8,$01E0

DATA_1987EA:
	dw CODE_18A78C
	dw CODE_18A819
	dw CODE_18A826

DATA_1987F0:
	dw CODE_18A69E
	dw CODE_18A6E7
	dw CODE_18A72C

DATA_1987F6:
	dw CODE_18A49B
	dw CODE_18A51C
	dw CODE_18A529
	dw CODE_18A5CC

DATA_1987FE:
	dw CODE_189F30
	dw CODE_189FC0
	dw CODE_189FD1

DATA_198804:
	dw $8000,$C000,$C000,$9000,$8000,$9000,$9000,$9000
	dw $9000,$9000,$C000,$C000,$C000,$9000,$9000,$9000
	dw $9000,$C000,$8800,$9000,$A000

DATA_19882E:
	dw CODE_189B92
	dw CODE_189BE7
	dw CODE_189BEE
	dw CODE_189BFD
	dw CODE_18A671
	dw CODE_189C46
	dw CODE_189CCC
	dw CODE_18A764
	dw CODE_189C37
	dw CODE_189CBD
	dw CODE_189BC1
	dw CODE_189D44
	dw CODE_189D77
	dw CODE_189D9F
	dw CODE_18A430
	dw CODE_189DE1
	dw CODE_18A373
	dw CODE_189E5E
	dw CODE_18A097
	dw CODE_189F0E
	dw CODE_189E8F

DATA_198858:
	dw CODE_189B9D
	dw CODE_189BED
	dw CODE_189BFC
	dw CODE_189C0F
	dw CODE_18A68F
	dw CODE_189C53
	dw CODE_189CD6
	dw CODE_18A77D
	dw CODE_189C53
	dw CODE_189CD6
	dw CODE_189BCC
	dw CODE_189D61
	dw CODE_189D9E
	dw CODE_189DB2
	dw CODE_18A44F
	dw CODE_189DF8
	dw CODE_18A391
	dw CODE_189E71
	dw CODE_18A0A8
	dw CODE_189F28
	dw CODE_189E99

DATA_198882:
	dw CODE_18AB89
	dw CODE_18AB57
	dw CODE_18AB6F
	dw CODE_18AB89
	dw CODE_18AB89
	dw CODE_18AB89
	dw CODE_18AB89
	dw CODE_18AB89
	dw CODE_18AB89
	dw CODE_18AB89
	dw CODE_18AB57
	dw CODE_18AB7E
	dw CODE_189D9E
	dw CODE_18AB89
	dw CODE_18A5D0
	dw CODE_18AB89
	dw CODE_18A3F1
	dw CODE_18AAF6
	dw CODE_18A210
	dw CODE_18A04E
	dw CODE_18AB89

DATA_1988AC:
	dw CODE_18AA8F
	dw CODE_18AB5D
	dw CODE_18AB70
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AB58
	dw CODE_18AB7E
	dw CODE_189D9E
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AB7F
	dw CODE_18AA8F
	dw CODE_18AAF7
	dw CODE_18AA8F
	dw CODE_18AA8F
	dw CODE_18AA8F

DATA_1988D6:
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC28
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC0E
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18A613
	dw CODE_18AC03
	dw CODE_18A405
	dw CODE_18AC03
	dw CODE_18AC03
	dw CODE_18A089
	dw CODE_18AC03

DATA_198900:
	dw $0000,$0000,$0000,$000A,$001C,$000C,$0010,$001A
	dw $0014,$0014,$0000,$0000,$0000,$000C,$001C,$0000
	dw $001A,$0004,$001E,$0014,$0000

DATA_19892A:
	dw CODE_189359
	dw CODE_189364
	dw CODE_189371
	dw CODE_189381
	dw CODE_18938C
	dw CODE_1893AA
	dw CODE_18939F
	dw CODE_1893AA
	dw CODE_18934E
	dw CODE_1893B9
	dw CODE_1893B2
	dw CODE_1893D4
	dw CODE_18933E

DATA_198944:
	dw CODE_1893DF
	dw CODE_189401
	dw CODE_18945E
	dw CODE_18947D
	dw CODE_1894AA
	dw CODE_189512
	dw CODE_1894FA
	dw CODE_1894F5
	dw CODE_1893DF
	dw CODE_189569
	dw CODE_189569
	dw CODE_18958B
	dw CODE_1893DF

DATA_19895E:
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68
	dw CODE_18AA68

DATA_198978:
	dw CODE_18916A
	dw CODE_1891D9
	dw CODE_1891FB
	dw CODE_189235

DATA_198980:
	dw CODE_189171
	dw CODE_1891EF
	dw CODE_189216
	dw CODE_18924B

DATA_198988:
	dw CODE_18B148
	dw CODE_18B19C
	dw CODE_18B1C2
	dw CODE_18B1F9

DATA_198990:
	dw CODE_18978B
	dw CODE_189789
	dw CODE_189793
	dw CODE_1897E9
	dw CODE_1897BA
	dw CODE_18980D
	dw CODE_1897CF

DATA_19899E:
	dw CODE_18990D
	dw CODE_189907
	dw CODE_189915

DATA_1989A4:									; Note: Something related to Spider Man's levels.
	dw DATA_1989AE,DATA_1989D2,DATA_1989F6,DATA_198A1A,DATA_198A3E

DATA_1989AE:
	dw $00A0,$004C,$0060,$0036,!Define_SXAR_Graphics_FGBG_City,$FFFF,$0006,!Define_SXAR_Graphics_Sprite_IntroLevelEnemies
	dw !Define_SXAR_Palette_FGBG_SpiderMan1,!Define_SXAR_Palette_Sprite_IntroLevel,$0000,$03DF,$0020,$04AF,$0000,$BF9E
	dw !Define_SXAR_LevelData_SpiderMan1,!Define_SXAR_LevelBG_SpiderMan1

DATA_1989D2:
	dw $0140,$0020,$00B0,$0020,!Define_SXAR_Graphics_FGBG_City,$FFFF,$0006,!Define_SXAR_Graphics_Sprite_SpiderManLevelEnemies
	dw !Define_SXAR_Palette_FGBG_IntroLevel,!Define_SXAR_Palette_Sprite_SpiderMan2,$0000,$0118,$0048,$01DF,$0000,$BF9E
	dw !Define_SXAR_LevelData_SpiderMan2,!Define_SXAR_LevelBG_SpiderMan2

DATA_1989F6:
	dw $0030,$0060,$0028,$0040,!Define_SXAR_Graphics_FGBG_City,$FFFF,$0006,!Define_SXAR_Graphics_Sprite_IntroLevelEnemies
	dw !Define_SXAR_Palette_FGBG_IntroLevel,!Define_SXAR_Palette_Sprite_IntroLevel,$0000,$021D,$0024,$02AF,$0000,$BF9E
	dw !Define_SXAR_LevelData_IntroLevel,!Define_SXAR_LevelBG_IntroLevel

DATA_198A1A:
	dw $001E,$0050,$001E,$0038,!Define_SXAR_Graphics_FGBG_FinalBoss,$FFFF,$0006,!Define_SXAR_Graphics_Sprite_IntroLevelEnemies
	dw !Define_SXAR_Palette_FGBG_SpiderMan3,!Define_SXAR_Palette_Sprite_IntroLevel,$00DE,$0000,$01B0,$004F,$4000,$B79E
	dw !Define_SXAR_LevelData_SpiderMan3,!Define_SXAR_LevelBG_SpiderMan3

DATA_198A3E:
	dw $0020,$0012,$0020,$0012,!Define_SXAR_Graphics_FGBG_FinalBoss,$FFFF,$0006,!Define_SXAR_Graphics_Sprite_FinalBoss
	dw !Define_SXAR_Palette_FGBG_FinalBoss,!Define_SXAR_Palette_Sprite_FinalBoss,$0086,$0000,$010C,$004F,$0000,$B79E
	dw !Define_SXAR_LevelData_FinalBoss,$0000

DATA_198A62:
	dw $8080,$AF36

table "Tables/Fonts/Credits.txt"

DATA_198A66:
	db "GET READY",$FF

DATA_198A70:
	db "TRY AGAIN",$FF

DATA_198A7A:
	db "SPIDER-MAN",$FF

DATA_198A85:
	db "PAUSE",$FF

DATA_198A8B:
	db "     ",$FF

cleartable

DATA_198A91:
	db $55,$AA,$23,$F3,$3C

DATA_198A96:
	dw $20ED,$20EE,$20EF,$20F0,$20F1,$20F2,$20F3,$20F4
	dw $20F5,$20F6,$20F7,$20F8,$A0F3,$A0F4,$A0F1,$A0F2
	dw $A0EF,$A0F0,$A0ED,$A0EE,$E0F4,$E0F3,$E0F2,$E0F1
	dw $60F6,$60F5,$60F8,$60F7,$60F2,$60F1,$60F4,$60F3
	dw $0000,$0000,$0000,$0000,$08ED,$00EE,$00EF,$00F0
	dw $08F1,$00F2,$08F3,$00F4,$08F5,$00F6,$00F7,$00F8

DATA_198AF6:
	dw $20F9,$20FA,$20FB,$20FC,$20FD,$20FE,$20FF

DATA_198B04:
	dw $2100,$2101,$2102,$2103

DATA_198B0C:
	dw $2104,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000

DATA_198B26:
	dw $0000,$FFFC,$FFFE,$0002,$0005,$0002,$FFFE,$FFFB
	dw $FFFD,$FFFF,$0000,$FFFC,$FFFE,$0002,$0005,$0002
	dw $FFFE,$FFFB,$FFFD,$FFFF

DATA_198B4E:
	dw $FFE0,$0000,$0020,$FFF0,$FFE0,$0000,$0020,$0010

DATA_198B5E:
	dw $0000,$0000,$0000,$FFD0,$FFE8,$FFE8,$FFE8,$FFD0

DATA_198B6E:
	dw $0012,$0013,$FFB5,$0002,$FD00,$0012,$FFDE,$FFB5
	dw $FFFE,$FD00,$0014,$0002,$FFC6,$0004,$FE40,$FFFF
	dw $0014,$001F,$FFD8,$0002,$0300,$0014,$0016,$FFE2
	dw $0002,$0300,$0014,$FFDC,$FFE2,$FFFE,$0300,$0014
	dw $FFD4,$FFD8,$FFFE,$0300,$FFFF,$0012,$0016,$FFD4
	dw $0003,$FC00,$0012,$FFE8,$FFD6,$FFFD,$FC00,$0014
	dw $0008,$FFED,$0005,$FE40,$FFFF

DATA_198BD8:
	dw $0090,$0092,$0094,$0096

DATA_198BE0:
	dw $01BE,$01DE,$017E,$01FE

DATA_198BE8:
	dw $002A,$002E,$0030,$002C

DATA_198BF0:
	dw $1D0F,$0F18,$281D,$0F1C,$130E,$1D1A

DATA_198BFC:
	dw DATA_198C1C,DATA_198C23,DATA_198C2A,DATA_198C31,DATA_198C38,DATA_198C3F,DATA_198C46,DATA_198C4D
	dw DATA_198C54,DATA_198C5B,DATA_198C62,DATA_198C69,DATA_198C70,DATA_198C77,DATA_198C7E,DATA_198C85

DATA_198C1C:
	db $00,$00,$00,$00,$00,$00,$00

DATA_198C23:
	db $00,$00,$00,$00,$00,$00,$05

DATA_198C2A:
	db $00,$00,$00,$00,$00,$01,$00

DATA_198C31:
	db $00,$00,$00,$00,$00,$01,$05

DATA_198C38:
	db $00,$00,$00,$00,$00,$02,$00

DATA_198C3F:
	db $00,$00,$00,$00,$00,$02,$05

DATA_198C46:
	db $00,$00,$00,$00,$00,$03,$00

DATA_198C4D:
	db $00,$00,$00,$00,$00,$03,$05

DATA_198C54:
	db $00,$00,$00,$00,$00,$04,$00

DATA_198C5B:
	db $00,$00,$00,$00,$00,$04,$05

DATA_198C62:
	db $00,$00,$00,$00,$00,$05,$00

DATA_198C69:
	db $00,$00,$00,$00,$00,$07,$05

DATA_198C70:
	db $00,$00,$00,$00,$01,$00,$00

DATA_198C77:
	db $00,$00,$00,$00,$01,$05,$00

DATA_198C7E:
	db $00,$00,$00,$00,$02,$00,$00

DATA_198C85:
	db $00,$00,$00,$00,$05,$00,$00

DATA_198C8C:
	db $1F,$97,$0C,$78,$D2,$0C,$27,$D2,$0C,$01,$99,$8C,$00,$00,$00,$61
	db $03

DATA_198C9D:
	dw $0620,$0654,$0688,$06BC,$06F0,$0724,$0758,$078C
	dw $07C0,$07F4,$0828,$085C

DATA_198CB5:
	dw $0890,$08A2,$08B4,$08C6,$08D8,$08EA,$08FC,$090E

DATA_198CC5:
	dw $0920,$094C,$0978,$09A4,$09D0,$09FC,$0A28,$0A54

DATA_198CD5:
	dw $0A80,$0AC2,$0B04,$0B46,$0B88,$0BCA,$0C0C,$0C4E

DATA_198CE5:
	dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E
	dw $0020,$0022,$0024,$0026,$0028,$002A,$002C,$002E
	dw $0040,$0042,$0044,$0046,$0048,$004A,$004C,$004E
	dw $0060,$0062,$0064,$0066,$0068,$006A,$006C,$006E
	dw $0080,$0082,$0084,$0086,$0088,$008A,$008C,$008E
	dw $00A0,$00A2,$00A4,$00A6,$00A8,$00AA,$00AC,$00AE
	dw $00C0,$00C2,$00C4,$00C6,$00C8,$00CA,$00CC,$00CE
	dw $00E0,$00E2,$00E4,$00E6,$00E8,$00EA,$00EC,$00EE
	dw $0100,$0102,$0104,$0106,$0108,$010A,$010C,$010E
	dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E
	dw $0140,$0142,$0144,$0146,$0148,$014A,$014C,$014E
	dw $0160,$0162,$0164,$0166,$0168,$016A,$016C,$016E
	dw $0180,$0182,$0184,$0186,$0188,$018A,$018C,$018E
	dw $01A0,$01A2,$01A4,$01A6,$01A8,$01AA,$01AC,$01AE
	dw $01C0,$01C2,$01C4,$01C6,$01C8,$01CA,$01CC,$01CE
	dw $01E0,$01E2,$01E4,$01E6,$01E8,$01EA,$01EC,$01EE

DATA_198DE5:
	db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02,$03,$03,$03,$03
	db $04,$04,$04,$04,$05,$05,$05,$05,$06,$06,$06,$06,$07,$07,$07,$07
	db $08,$08,$08,$08,$09,$09,$09,$09,$0A,$0A,$0A,$0A,$0B,$0B,$0B,$0B
	db $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F
	db $10,$10,$10,$10,$11,$11,$11,$11,$12,$12,$12,$12,$13,$13,$13,$13
	db $14,$14,$14,$14,$15,$15,$15,$15,$16,$16,$16,$16,$17,$17,$17,$17
	db $18,$18,$18,$18,$19,$19,$19,$19,$1A,$1A,$1A,$1A,$1B,$1B,$1B,$1B
	db $1C,$1C,$1C,$1C,$1D,$1D,$1D,$1D,$1E,$1E,$1E,$1E,$1F,$1F,$1F,$1F

DATA_198E65:
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40
	db $01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40,$01,$04,$10,$40

DATA_198EE5:
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80
	db $02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80,$02,$08,$20,$80

DATA_198F65:
	dw (DATA_1B8000-$8000)+$0000,(DATA_1B8000-$8000)+$0080,(DATA_1B8000-$8000)+$0100,(DATA_1B8000-$8000)+$0180
	dw (DATA_1B8000-$8000)+$0C00,(DATA_1B8000-$8000)+$0C80,(DATA_1B8000-$8000)+$0D00,(DATA_1B8000-$8000)+$0D80
	dw (DATA_1B8000-$8000)+$1800,(DATA_1B8000-$8000)+$1880,(DATA_1B8000-$8000)+$1900,(DATA_1B8000-$8000)+$1980
	dw (DATA_1B8000-$8000)+$2400,(DATA_1B8000-$8000)+$2480,(DATA_1B8000-$8000)+$2500,(DATA_1B8000-$8000)+$2580
	dw (DATA_1B8000-$8000)+$3000,(DATA_1B8000-$8000)+$3080,(DATA_1B8000-$8000)+$3100,(DATA_1B8000-$8000)+$3180
	dw (DATA_1B8000-$8000)+$3C00,(DATA_1B8000-$8000)+$3C80,(DATA_1B8000-$8000)+$3D00,(DATA_1B8000-$8000)+$3D80
	dw (DATA_1B8000-$8000)+$4800,(DATA_1B8000-$8000)+$4880,(DATA_1B8000-$8000)+$4900,(DATA_1B8000-$8000)+$4980
	dw (DATA_1B8000-$8000)+$5400,(DATA_1B8000-$8000)+$5480,(DATA_1B8000-$8000)+$5500,(DATA_1B8000-$8000)+$5580
	dw (DATA_1B8000-$8000)+$6000,(DATA_1B8000-$8000)+$6080,(DATA_1B8000-$8000)+$6100,(DATA_1B8000-$8000)+$6180
	dw (DATA_1B8000-$8000)+$6C00,(DATA_1B8000-$8000)+$6C80,(DATA_1B8000-$8000)+$6D00,(DATA_1B8000-$8000)+$6D80
	dw (DATA_1B8000-$8000)+$7800,(DATA_1B8000-$8000)+$7880,(DATA_1B8000-$8000)+$7900,(DATA_1B8000-$8000)+$7980

UNK_198FBD:
	dw $8400,$8480,$8500,$8580,$9000,$9080,$9100,$9180
	dw $9C00,$9C80,$9D00,$9D80,$A800,$A880,$A900,$A980
	dw $B400,$B480,$B500,$B580,$C000,$C080,$C100,$C180
	dw $CC00,$CC80,$CD00,$CD80,$D800,$D880,$D900,$D980
	dw $E400,$E480,$E500,$E580,$F000,$F080,$F100,$F180
	dw $FC00,$FC80,$FD00,$FD80,$0800,$0880,$0900,$0980
	dw $1400,$1480,$1500,$1580,$2000,$2080,$2100,$2180
	dw $2C00,$2C80,$2D00,$2D80,$3800,$3880,$3900,$3980
	dw $4400,$4480,$4500,$4580,$5000,$5080,$5100,$5180
	dw $5C00,$5C80,$5D00,$5D80,$6800,$6880,$6900,$6980
	dw $7400,$7480,$7500,$7580,$8000,$8080,$8100,$8180
	dw $8C00,$8C80,$8D00,$8D80,$9800,$9880,$9900,$9980
	dw $A400,$A480,$A500,$A580,$B000,$B080,$B100,$B180
	dw $BC00,$BC80,$BD00,$BD80,$C800,$C880,$C900,$C980
	dw $D400,$D480,$D500,$D580,$E000,$E080,$E100,$E180
	dw $EC00,$EC80,$ED00,$ED80,$F800,$F880,$F900,$F980
	dw $0400,$0480,$0500,$0580,$1000,$1080,$1100,$1180
	dw $1C00,$1C80,$1D00,$1D80,$2800,$2880,$2900,$2980
	dw $3400,$3480,$3500,$3580,$4000,$4080,$4100,$4180
	dw $4C00,$4C80,$4D00,$4D80,$5800,$5880,$5900,$5980
	dw $6400,$6480,$6500,$6580,$7000,$7080,$7100,$7180
	dw $7C00,$7C80,$7D00,$7D80,$8800,$8880,$8900,$8980
	dw $9400,$9480,$9500,$9580,$A000,$A080,$A100,$A180
	dw $AC00,$AC80,$AD00,$AD80,$B800,$B880,$B900,$B980
	dw $C400,$C480,$C500,$C580,$D000,$D080,$D100,$D180
	dw $DC00,$DC80,$DD00,$DD80,$E800,$E880,$E900,$E980
	dw $F400,$F480,$F500,$F580

DATA_199165:
	dw $0000,$0040,$0080,$00C0,$0100,$0140,$0180,$01C0
	dw $0400,$0440,$0480,$04C0,$0500,$0540,$0580,$05C0

DATA_199185:
	dw $0000,$0200,$0400,$0600,$0800,$0A00,$0C00,$0E00
	dw $1000,$1200,$1400,$1600,$1800,$1A00,$1C00,$1E00

DATA_1991A5:
	dw $0000,$0020,$0040,$0060,$0080,$00A0,$00C0,$00E0
	dw $0100,$0120,$0140,$0160,$0180,$01A0,$01C0,$01E0

DATA_1991C5:
	dw $0000,DATA_199567,DATA_19956F,DATA_19959B,DATA_1995AF,DATA_199533,DATA_19954D,DATA_19951D
	dw DATA_199509,DATA_1994F9,DATA_1994E5,DATA_1994CF,DATA_199499,DATA_19948F,DATA_19944D,DATA_199427
	dw DATA_199421,DATA_19940D,DATA_1993F3,DATA_1993E7,DATA_199273,DATA_199217,DATA_199229,DATA_19923F
	dw DATA_199259,DATA_1991F9

DATA_1991F9:
	dw $0001,$009C,$8002,$0018,$0020,$FFE4,$0006,$009C
	dw $0004,$009E,$0006,$009C,$000A,$009A,$8001

DATA_199217:
	dw $0028,$0090,$8006,$0002,$0003,$FFE2,$0014,$0090
	dw $8001

DATA_199229:
	dw $0028,$0096,$000A,$00A4,$000A,$00A6,$0008,$00A4
	dw $0014,$0096,$8001

DATA_19923F:
	dw $0028,$0092,$0005,$00A2,$8006,$0004,$000F,$FFE5
	dw $000F,$00A2,$0014,$0092,$8001

DATA_199259:
	dw $0028,$0094,$0005,$00A8,$8006,$0006,$000C,$FFE2
	dw $000F,$00A8,$0014,$0094,$8001

DATA_199273:
	dw $000A,$00EE,$8005,$00B0,$FFFF,$0000,$0004,$00F0
	dw $8002,$0012,$0035,$FFBB,$8002,$0012,$0003,$FFBB
	dw $0004,$00F0,$0004,$00EE,$8005,$00B0,$FFFF,$0000
	dw $8005,$00B0,$0001,$0000,$0004,$00F0,$8002,$0012
	dw $0035,$FFBB,$8002,$0012,$0003,$FFBB,$0004,$00F0
	dw $0004,$00EE,$8005,$00B0,$0001,$0000,$0004,$00F0
	dw $8002,$0012,$0035,$FFBB,$8002,$0012,$0003,$FFBB
	dw $0004,$00F0,$0004,$00EE,$001E,$00F2,$8005,$0080
	dw $FFFE,$0000,$0004,$00F0,$8002,$0012,$0035,$FFBB
	dw $8002,$0012,$0003,$FFBB,$0004,$00F0,$0004,$00EE
	dw $8005,$0030,$FFFE,$0000,$8005,$0030,$0002,$0000
	dw $0004,$00F0,$8002,$0012,$0035,$FFBB,$8002,$0012
	dw $0003,$FFBB,$0004,$00F0,$0004,$00EE,$8005,$0080
	dw $0002,$0000,$0004,$00F0,$8002,$0012,$0035,$FFBB
	dw $8002,$0012,$0003,$FFBB,$0004,$00F0,$0004,$00EE
	dw $8005,$001E,$0000,$0000,$0004,$00F4,$8002,$0014
	dw $0037,$FFD6,$8002,$0014,$0004,$FFD6,$0004,$00F4
	dw $0004,$00F2,$8005,$0014,$FFFF,$0000,$8005,$0028
	dw $FFFE,$0000,$8005,$0028,$FFFD,$0000,$8005,$0018
	dw $FFFC,$0000,$8005,$0014,$0001,$0000,$8005,$0028
	dw $0002,$0000,$8005,$0028,$0003,$0000,$8005,$0018
	dw $0004,$0000,$0004,$00F0,$8002,$0012,$0035,$FFBB
	dw $8002,$0012,$0003,$FFBB,$0004,$00F0,$0004,$00EE
	dw $8000,DATA_199273

DATA_1993E7:
	dw $0008,$001A
DATA_1993EB:
	dw $000A,$003C,$8000,DATA_1993EB

DATA_1993F3:
	dw $0019,$00DA,$0014,$00DC,$0014,$00DE,$0014,$00E0
	dw $0014,$00E2,$001E,$00E4,$8001

DATA_19940D:
	dw $0007,$00E6,$0007,$00E8,$0007,$00EA,$0007,$00EC
	dw $8000,DATA_19940D

DATA_199421:
	dw $000A,$0076,$8001

DATA_199427:
	dw $0006,$00CE,$0004,$00D0,$0004,$00D2,$0004,$00D4
	dw $0004,$00D6,$8002,$0010,$0019,$FFE9,$0005,$00D6
	dw $0014,$00CC,$8001

DATA_19944D:
	dw $0009,$0000,$8003,$0000,$0010,$FFF0,$0007,$0000
	dw $8003,$0000,$0000,$0000,$0005,$0000,$8003,$0000
	dw $FFE8,$0008,$0009,$0000,$8003,$0000,$0008,$FFF8
	dw $0007,$0000,$8003,$0000,$FFF0,$FFF0,$8000,DATA_19944D
	dw $8001

DATA_19948F:
	dw $8002,$000C,$0000,$FFF8,$8001

DATA_199499:
	dw $000E,$00C8,$0002,$00C8,$0002,$00CA,$0002,$00C8
	dw $0002,$00CA,$8002,$0008,$0010,$FFEE,$0002,$00C8
	dw $0002,$00CA,$0002,$00C8,$0002,$00CA,$000C,$00C8
	dw $0023,$00C4,$8001

DATA_1994CF:
	dw $0003,$006E,$0003,$0070,$0003,$0072,$0003,$0074
	dw $0005,$0076,$8001

DATA_1994E5:
	dw $0006,$0060,$0006,$0062,$0006,$0064,$0006,$0066
	dw $8000,DATA_1994E5

DATA_1994F9:
	dw $0006,$0068,$0006,$006A,$0006,$006C,$8000,DATA_1994F9

DATA_199509:
	dw $0009,$00BE,$0004,$00C0,$0009,$00C2,$0006,$00C0
	dw $8000,DATA_199509

DATA_19951D:
	dw $0005,$0056,$0006,$0058,$0003,$0056,$0006,$0058
	dw $0003,$0056,$8001

DATA_199533:
	dw $0024,$004E,$0002,$0050,$8002,$0002,$FFFD,$0010
	dw $000E,$0050,$001E,$004E,$8001

DATA_19954D:
	dw $001E,$004E,$0002,$0052,$8002,$0004,$0019,$FFF5
	dw $000E,$0052,$0019,$004E,$8001

DATA_199567:
	dw $000A,$0002,$8000,DATA_199567

DATA_19956F:
	dw $0005,$0004,$0004,$0006,$0005,$0008,$0004,$000A
	dw $0005,$000C,$0004,$000E,$0005,$0010,$0004,$0012
	dw $0005,$0014,$0004,$0016,$8000,DATA_19956F

DATA_19959B:
	dw $0008,$0032,$0008,$0034,$0008,$0036,$0008,$0038
	dw $8000,DATA_19959B

DATA_1995AF:
	dw $0008,$0036,$0008,$0034,$0008,$0032,$0008,$0038
	dw $8000,DATA_1995AF

DATA_1995C3:
	dw (DATA_1A8000+$0000)-DATA_1A8000,$0200
	dw (DATA_1A8000+$0800)-DATA_1A8000,$0200
	dw (DATA_1A8000+$1000)-DATA_1A8000,$0200
	dw (DATA_1A9800+$0000)-DATA_1A8000,$0200
	dw (DATA_1A9800+$0400)-DATA_1A8000,$0200
	dw (DATA_1A9800+$0800)-DATA_1A8000,$0200
	dw (DATA_1A9800+$0C00)-DATA_1A8000,$0200
	dw (DATA_1AA800+$0000)-DATA_1A8000,$0180
	dw (DATA_1AA800+$0300)-DATA_1A8000,$0180
	dw (DATA_1AA800+$0600)-DATA_1A8000,$0180
	dw (DATA_1AA800+$0900)-DATA_1A8000,$0180
	dw (DATA_1AA800+$0C00)-DATA_1A8000,$0180
	dw (DATA_1AA800+$0F00)-DATA_1A8000,$0180
	dw (DATA_1AA800+$1200)-DATA_1A8000,$0180
	dw (DATA_1AA800+$1500)-DATA_1A8000,$0180
	dw (DATA_1AA800+$1800)-DATA_1A8000,$0180
	dw (DATA_1AA800+$1B00)-DATA_1A8000,$0180
	dw (DATA_1AA800+$1E00)-DATA_1A8000,$0180
	dw (DATA_1AA800+$2100)-DATA_1A8000,$0180
	dw (DATA_1AA800+$2400)-DATA_1A8000,$0180
	dw (DATA_1ACF00+$0000)-DATA_1A8000,$0200
	dw (DATA_1ACF00+$0400)-DATA_1A8000,$0200
	dw (DATA_1ACF00+$0800)-DATA_1A8000,$0200
	dw (DATA_1ACF00+$0C00)-DATA_1A8000,$0200

DATA_199623:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$0023,$0000,$0000,$0007,$001F
	dw $0000,$0000,$0007,$001F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0007,$002F
	dw $0000,$0000,$0007,$002F,$0000,$0000,$0003,$0003
	dw $0000,$0001,$0005,$0008,$0000,$0003,$0007,$000C
	dw $0000,$0000,$0004,$0007,$0000,$0000,$0008,$0007
	dw $0000,$0000,$0004,$000C,$0000,$0000,$0004,$000C
	dw $0000,$0000,$0009,$001C,$0000,$0000,$000E,$0026
	dw $0000,$0000,$000E,$0014,$0000,$0000,$000E,$0014
	dw $0000,$FFFD,$0006,$000C,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$FFFD,$000C,$0015,$0000,$FFFD,$000C,$0015
	dw $0000,$FFFD,$000C,$0015,$0000,$FFFD,$000C,$0015
	dw $0000,$0000,$000C,$001C,$0000,$0000,$000C,$001C
	dw $0000,$0000,$000C,$001C,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0008,$000E,$0008,$0000,$0010,$000E
	dw $0010,$0000,$0018,$000E,$0020,$0000,$0020,$000E
	dw $0000,$0000,$0008,$000C,$0000,$0000,$0010,$0020
	dw $0000,$FFFA,$000C,$0016,$0000,$FFFE,$0006,$0006
	dw $0000,$0000,$0006,$0008,$0000,$0000,$0006,$000E
	dw $0000,$0000,$0006,$000E,$0000,$0000,$001C,$0004
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$FFFE,$0006,$0006,$0000,$0000,$0012,$0028
	dw $0000,$0000,$0012,$0028,$0000,$0000,$0012,$0028
	dw $0000,$0000,$000F,$0032,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0008,$0005
	dw $0000,$0000,$0005,$000C,$0000,$0000,$0005,$000C
	dw $0000,$0000,$0005,$000C,$0000,$0000,$0005,$000C
	dw $0000,$0000,$0008,$0006,$0000,$0000,$0008,$0006
	dw $0000,$0000,$0008,$0006,$0000,$0000,$0008,$0006
	dw $0000,$0000,$0003,$0006,$0000,$0000,$0017,$0028
	dw $0000,$0000,$0017,$0028,$0000,$0000,$0017,$0028
	dw $0000,$0000,$000C,$0016,$0000,$0000,$000C,$0024
	dw $0000,$0000,$000C,$0020,$0000,$0000,$000C,$0020
	dw $0000,$0000,$000C,$002C,$0000,$0000,$000C,$002C
	dw $0000,$0000,$000C,$002C,$0000,$0000,$000C,$002C
	dw $0000,$0000,$000C,$002C,$0000,$0000,$000C,$002C
	dw $0000,$0000,$000C,$002C,$0000,$0000,$000C,$002C
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0010,$002A
	dw $0000,$0000,$0010,$002A,$0000,$0000,$0010,$002A
	dw $0000,$0000,$0010,$002A,$0000,$FF98,$0018,$0020
	dw $0000,$FF98,$0018,$0020,$0000,$FF98,$0018,$0020
	dw $0000,$FF98,$0018,$0020,$0000,$FFB0,$000A,$001C
	dw $0000,$FFB0,$000A,$001C,$0000,$FFB0,$000A,$001C
	dw $0000,$FFD0,$000A,$001C,$0000,$FFD0,$000A,$001C
	dw $0000,$0000,$0000,$0000

DATA_199A2B:
	dw DATA_199B2D,DATA_199B33,DATA_199B69,DATA_199B9F,DATA_199BD5,DATA_199C0B,DATA_199C41,DATA_199C77
	dw DATA_199CAD,DATA_199CE3,DATA_199D19,DATA_199D4F,DATA_199D85,DATA_199DBB,DATA_199DF1,DATA_199E27
	dw DATA_199E5D,DATA_199E93,DATA_199EC9,DATA_199EFF,DATA_199F35,DATA_199F6B,DATA_199FA1,DATA_19A005
	dw DATA_199FCF,DATA_19A03B,DATA_19A071,DATA_19A0AF,DATA_19A0E5,DATA_19A123,DATA_19A159,DATA_19A1B5
	dw DATA_19A1C3,DATA_19A1D1,DATA_19A1DF,DATA_19A1FD,DATA_19A20B,DATA_19A219,DATA_19A18F,DATA_19A227
	dw DATA_19A275,DATA_19A2B3,DATA_19A2E9,DATA_19A2F7,DATA_19A30D,DATA_19A353,DATA_19A371,DATA_19A397
	dw DATA_19A3CD,DATA_19A3F3,DATA_19A419,DATA_19A43F,DATA_19A465,DATA_19A48B,DATA_19A4B1,DATA_19A4D7
	dw DATA_19A4FD,DATA_19A523,DATA_19A549,DATA_19A56F,DATA_19A595,DATA_19A5A3,DATA_19A5B9,DATA_19A5D7
	dw DATA_19A5FD,DATA_19A60B,DATA_19A639,DATA_19A66D,DATA_19A65F,DATA_19A67B,DATA_19A689,DATA_19A697
	dw DATA_19A69D,DATA_19A6D3,DATA_19A709,DATA_19A73F,DATA_19A775,DATA_19A783,DATA_19A7C9,DATA_19A80F
	dw DATA_19A845,DATA_19A88B,DATA_19A8C1,DATA_19A8EF,DATA_19A925,DATA_19A95B,DATA_19A971,DATA_19A97F
	dw DATA_19A98D,DATA_19A99B,DATA_19A9A9,DATA_19A9B7,DATA_19A9C5,DATA_19A9D3,DATA_19A9E1,DATA_19A9EF
	dw DATA_19AA85,DATA_19AB0B,DATA_19AB91,DATA_19AB91,DATA_19AB91,DATA_19AB91,DATA_19ABD7,DATA_19AC0D
	dw DATA_19AC0D,DATA_19AC0D,DATA_19AC0D,DATA_19AC0D,DATA_19AC43,DATA_19AC79,DATA_19ACAF,DATA_19ACAF
	dw DATA_19ACE5,DATA_19AD1B,DATA_19AD1B,DATA_19AD51,DATA_19AD51,DATA_19AD51,DATA_19AD51,DATA_19B1FE
	dw DATA_19B28E,DATA_19B31E,DATA_19B3AE,DATA_19B43E,DATA_19B4CE,DATA_19B55E,DATA_19B5EE,DATA_19B67E
	dw DATA_19B70E

DATA_199B2D:
	dw $0000,$0000,$8000

DATA_199B33:
	dw $FFFA,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199B69:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199B9F:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199BD5:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199C0B:
	dw $FFFE,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199C41:
	dw $FFFF,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199C77:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199CAD:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199CE3:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199D19:
	dw $FFFE,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199D4F:
	dw $FFFF,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199D85:
	dw $FFFC,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199DBB:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199DF1:
	dw $0007,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199E27:
	dw $0002,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199E5D:
	dw $0002,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199E93:
	dw $0002,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199EC9:
	dw $FFFE,$0003,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199EFF:
	dw $0001,$0003,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199F35:
	dw $0000,$0000,$00FF,$0000,$FFD0,$0002,$00FF,$FFF0
	dw $FFE0,$0020,$00FF,$0000,$FFE0,$0022,$00FF,$FFF0
	dw $FFF0,$0040,$00FF,$0000,$FFF0,$0042,$00FF,$0010
	dw $FFF0,$0000,$8000

DATA_199F6B:
	dw $0003,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_199FA1:
	dw $0008,$0007,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$0010,$FFD0,$0040,$8000

DATA_199FCF:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_19A005:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_19A03B:
	dw $FFFD,$FFFC,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_19A071:
	dw $FFFD,$FFFC,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$00FF,$FFFC,$0000,$0004,$8000

DATA_19A0AF:
	dw $FFFD,$FFFC,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_19A0E5:
	dw $FFFD,$FFFC,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$00FF,$FFFC,$0000,$0004,$8000

DATA_19A123:
	dw $FFFD,$0004,$00FF,$FFE0,$FFD8,$0040,$00FF,$FFF0
	dw $FFD0,$0000,$00FF,$0000,$FFD0,$0002,$00FF,$FFF0
	dw $FFE0,$0020,$00FF,$0000,$FFE0,$0022,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_19A159:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0000,$00FF,$0000
	dw $FFD0,$0002,$00FF,$FFF0,$FFE0,$0020,$00FF,$0000
	dw $FFE0,$0022,$00FF,$FFF0,$FFF0,$0040,$00FF,$0000
	dw $FFF0,$0042,$8000

DATA_19A18F:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$06A2,$00FF,$0000
	dw $FFE0,$46A2,$00FF,$FFF0,$FFF0,$86A2,$00FF,$0000
	dw $FFF0,$C6A2,$8000

DATA_19A1B5:
	dw $0000,$0000,$00FF,$FFFA,$FFF4,$0008,$8000

DATA_19A1C3:
	dw $0000,$0000,$00FF,$FFFA,$FFF4,$000A,$8000

DATA_19A1D1:
	dw $0000,$0000,$00FF,$FFFA,$FFF4,$000C,$8000

DATA_19A1DF:
	dw $0000,$0000,$0000,$FFF8,$FFF8,$0228,$0000,$0000
	dw $FFF8,$0228,$0000,$0008,$FFF8,$0228,$8000

DATA_19A1FD:
	dw $0000,$0000,$0000,$FFFC,$FFF8,$0239,$8000

DATA_19A20B:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$000E,$8000

DATA_19A219:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$0026,$8000

DATA_19A227:
	dw $0000,$0000,$00FF,$FFE8,$FFD0,$0260,$00FF,$FFF8
	dw $FFD0,$0262,$00FF,$0008,$FFD0,$0264,$00FF,$FFE8
	dw $FFE0,$0266,$00FF,$FFF8,$FFE0,$0268,$00FF,$0008
	dw $FFE0,$026A,$00FF,$FFE8,$FFF0,$026C,$00FF,$FFF8
	dw $FFF0,$026E,$00FF,$0008,$FFF0,$0280,$8000

DATA_19A275:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0282,$00FF,$0000
	dw $FFE0,$0284,$00FF,$FFE8,$FFF0,$0286,$00FF,$FFF8
	dw $FFF0,$0288,$00FF,$0008,$FFF0,$0280,$00FF,$FFEC
	dw $0000,$028A,$00FF,$FFFD,$0000,$428A,$8000

DATA_19A2B3:
	dw $0000,$0000,$00FF,$FFF8,$FFE0,$028C,$00FF,$0008
	dw $FFE0,$028E,$00FF,$FFE8,$FFF0,$02A2,$00FF,$FFF8
	dw $FFF0,$02A4,$00FF,$0008,$FFF0,$02A6,$00FF,$0018
	dw $FFE8,$02A0,$8000

DATA_19A2E9:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$02A8,$8000

DATA_19A2F7:
	dw $0000,$0000,$00FF,$FFF0,$FFF0,$090E,$00FF,$0000
	dw $FFF0,$490E,$8000

DATA_19A30D:
	dw $0000,$0000,$00FF,$FFE0,$FFE0,$0906,$00FF,$FFF0
	dw $FFE0,$0908,$00FF,$0000,$FFE0,$4908,$00FF,$0010
	dw $FFE0,$4906,$00FF,$FFE0,$FFF0,$090A,$00FF,$FFF0
	dw $FFF0,$090C,$00FF,$0000,$FFF0,$490C,$00FF,$0010
	dw $FFF0,$490A,$8000

DATA_19A353:
	dw $0000,$0000,$00FF,$FFE8,$FFF0,$02A4,$00FF,$FFF8
	dw $FFF0,$02A6,$00FF,$0008,$FFF0,$42A4,$8000

DATA_19A371:
	dw $0000,$0000,$00FF,$FFF8,$FFE0,$0284,$00FF,$FFE8
	dw $FFF0,$02A8,$00FF,$FFF8,$FFF0,$02AA,$00FF,$0008
	dw $FFF0,$42A8,$8000

DATA_19A397:
	dw $0000,$0000,$00FF,$FFE8,$FFE0,$02C0,$00FF,$FFF8
	dw $FFE0,$02C2,$00FF,$0008,$FFE0,$42C0,$00FF,$FFE8
	dw $FFF0,$02AC,$00FF,$FFF8,$FFF0,$02AE,$00FF,$0008
	dw $FFF0,$42AC,$8000

DATA_19A3CD:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$036C,$00FF,$0000
	dw $FFE0,$036E,$00FF,$FFF0,$FFF0,$0340,$00FF,$0000
	dw $FFF0,$0342,$8000

DATA_19A3F3:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$036C,$00FF,$0000
	dw $FFE0,$036E,$00FF,$FFF0,$FFF0,$0344,$00FF,$0000
	dw $FFF0,$0346,$8000

DATA_19A419:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$036C,$00FF,$0000
	dw $FFE0,$036E,$00FF,$FFF0,$FFF0,$0348,$00FF,$0000
	dw $FFF0,$034A,$8000

DATA_19A43F:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$036C,$00FF,$0000
	dw $FFE0,$036E,$00FF,$FFF0,$FFF0,$034C,$00FF,$0000
	dw $FFF0,$034E,$8000

DATA_19A465:
	dw $0002,$0000,$00FF,$FFF0,$FFE0,$0360,$00FF,$0000
	dw $FFE0,$0362,$00FF,$FFF0,$FFF0,$0364,$00FF,$0000
	dw $FFF0,$0366,$8000

DATA_19A48B:
	dw $0002,$0000,$00FF,$FFF0,$FFE0,$0360,$00FF,$0000
	dw $FFE0,$0362,$00FF,$FFF0,$FFF0,$0364,$00FF,$0000
	dw $FFF0,$0368,$8000

DATA_19A4B1:
	dw $0002,$0000,$00FF,$FFF0,$FFE0,$0360,$00FF,$0000
	dw $FFE0,$0362,$00FF,$FFF0,$FFF0,$0364,$00FF,$0000
	dw $FFF0,$036A,$8000

DATA_19A4D7:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$022A,$00FF,$0000
	dw $FFE0,$022C,$00FF,$FFF0,$FFF0,$024A,$00FF,$0000
	dw $FFF0,$024C,$8000

DATA_19A4FD:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0246,$00FF,$0000
	dw $FFE0,$0248,$00FF,$FFF0,$FFF0,$024E,$00FF,$0000
	dw $FFF0,$022E,$8000

DATA_19A523:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$C24C,$00FF,$0000
	dw $FFE0,$C24A,$00FF,$FFF0,$FFF0,$C22C,$00FF,$0000
	dw $FFF0,$C22A,$8000

DATA_19A549:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$C22E,$00FF,$0000
	dw $FFE0,$C24E,$00FF,$FFF0,$FFF0,$C248,$00FF,$0000
	dw $FFF0,$C246,$8000

DATA_19A56F:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$090E,$00FF,$0000
	dw $FFE0,$490E,$00FF,$FFF0,$FFF0,$890E,$00FF,$0000
	dw $FFF0,$C90E,$8000

DATA_19A595:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$032E,$8000

DATA_19A5A3:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$032E,$00FF,$0008
	dw $FFF0,$032E,$8000

DATA_19A5B9:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$032E,$00FF,$0008
	dw $FFF0,$032E,$00FF,$0018,$FFF0,$032E,$8000

DATA_19A5D7:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$032E,$00FF,$0008
	dw $FFF0,$032E,$00FF,$0018,$FFF0,$032E,$00FF,$0028
	dw $FFF0,$032E,$8000

DATA_19A5FD:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$052C,$8000

DATA_19A60B:
	dw $0000,$0000,$00FF,$FFF8,$FFE8,$000E,$00FF,$FFF0
	dw $FFE0,$000E,$00FF,$0000,$FFE0,$000E,$00FF,$FFF0
	dw $FFF0,$000E,$00FF,$0000,$FFF0,$000E,$8000

DATA_19A639:
	dw $0000,$0000,$00FF,$FFF0,$FFE0,$0B24,$00FF,$0000
	dw $FFE0,$0B26,$00FF,$FFF0,$FFF0,$0B28,$00FF,$0000
	dw $FFF0,$0B2A,$8000

DATA_19A65F:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$052C,$8000

DATA_19A66D:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$0B22,$8000

DATA_19A67B:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$0F04,$8000

DATA_19A689:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$0F02,$8000

DATA_19A697:
	dw $0000,$0000,$8000

DATA_19A69D:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0AEC,$00FF,$0000
	dw $FFD0,$0AEE,$00FF,$FFF0,$FFE0,$0B00,$00FF,$0000
	dw $FFE0,$0B02,$00FF,$FFF0,$FFF0,$0B04,$00FF,$0000
	dw $FFF0,$0B20,$8000

DATA_19A6D3:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0CC8,$00FF,$0000
	dw $FFD0,$0CCA,$00FF,$FFF0,$FFE0,$0CCC,$00FF,$0000
	dw $FFE0,$0CCE,$00FF,$FFF0,$FFF0,$0CE0,$00FF,$0000
	dw $FFF0,$0CE2,$8000

DATA_19A709:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$06AC,$00FF,$0000
	dw $FFD0,$06AE,$00FF,$FFF0,$FFE0,$06C0,$00FF,$0000
	dw $FFE0,$06C2,$00FF,$FFF0,$FFF0,$06C4,$00FF,$0000
	dw $FFF0,$06C6,$8000

DATA_19A73F:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0F24,$00FF,$0000
	dw $FFD0,$0F26,$00FF,$FFF0,$FFE0,$0F28,$00FF,$0000
	dw $FFE0,$0F2A,$00FF,$FFF0,$FFF0,$0F2C,$00FF,$0000
	dw $FFF0,$0F2E,$8000

DATA_19A775:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$0322,$8000

DATA_19A783:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0460,$00FF,$0000
	dw $FFD0,$0462,$00FF,$0010,$FFD0,$0464,$00FF,$FFF0
	dw $FFE0,$0466,$00FF,$0000,$FFE0,$0468,$00FF,$0010
	dw $FFE0,$046A,$00FF,$FFF0,$FFF0,$046C,$00FF,$0000
	dw $FFF0,$046E,$8000

DATA_19A7C9:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0460,$00FF,$0000
	dw $FFD0,$0462,$00FF,$0010,$FFD0,$0480,$00FF,$FFF0
	dw $FFE0,$0466,$00FF,$0000,$FFE0,$0482,$00FF,$0010
	dw $FFE0,$0484,$00FF,$FFF0,$FFF0,$046C,$00FF,$0000
	dw $FFF0,$046E,$8000

DATA_19A80F:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0460,$00FF,$0000
	dw $FFD0,$0486,$00FF,$FFF0,$FFE0,$0466,$00FF,$0000
	dw $FFE0,$0488,$00FF,$FFF0,$FFF0,$046C,$00FF,$0000
	dw $FFF0,$046E,$8000

DATA_19A845:
	dw $0000,$0000,$00FF,$FFF0,$FFC0,$048A,$00FF,$0000
	dw $FFC0,$048C,$00FF,$FFF0,$FFD0,$048E,$00FF,$0000
	dw $FFD0,$04A0,$00FF,$FFF0,$FFE0,$04A2,$00FF,$0000
	dw $FFE0,$04A6,$00FF,$FFF0,$FFF0,$04A8,$00FF,$0000
	dw $FFF0,$04AA,$8000

DATA_19A88B:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0CE4,$00FF,$0000
	dw $FFD0,$0CE6,$00FF,$FFF0,$FFE0,$0CE8,$00FF,$0000
	dw $FFE0,$0CEA,$00FF,$FFF0,$FFF0,$0CE0,$00FF,$0000
	dw $FFF0,$0CE2,$8000

DATA_19A8C1:
	dw $0000,$0000,$00FF,$0000,$FFD0,$0F40,$00FF,$FFF0
	dw $FFE0,$0F42,$00FF,$0000,$FFE0,$0F44,$00FF,$FFF0
	dw $FFF0,$0F46,$00FF,$0000,$FFF0,$0F48,$8000

DATA_19A8EF:
	dw $0000,$0000,$00FF,$0000,$FFD0,$0F4A,$00FF,$FFF0
	dw $FFE0,$0F4C,$00FF,$0000,$FFE0,$0F4E,$00FF,$0010
	dw $FFE0,$0F60,$00FF,$FFF0,$FFF0,$0F46,$00FF,$0000
	dw $FFF0,$0F48,$8000

DATA_19A925:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0762,$00FF,$0000
	dw $FFD0,$0764,$00FF,$FFF0,$FFE0,$0766,$00FF,$0000
	dw $FFE0,$0768,$00FF,$FFF0,$FFF0,$076A,$00FF,$0000
	dw $FFF0,$076C,$8000

DATA_19A95B:
	dw $0000,$0000,$0000,$FFF8,$FFF0,$0BCE,$0000,$0000
	dw $FFF0,$0BCF,$8000

DATA_19A971:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01C6,$8000

DATA_19A97F:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01C8,$8000

DATA_19A98D:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CA,$8000

DATA_19A99B:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$01CC,$8000

DATA_19A9A9:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$07A6,$8000

DATA_19A9B7:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$07A8,$8000

DATA_19A9C5:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$07AA,$8000

DATA_19A9D3:
	dw $0000,$0000,$00FF,$FFF8,$FFF0,$07AC,$8000

DATA_19A9E1:
	dw $0000,$0000,$0000,$FFF8,$FFF8,$0229,$8000

DATA_19A9EF:
	dw $0000,$0000,$00FF,$0008,$FFA0,$0400,$00FF,$FFE8
	dw $FFA0,$4400,$00FF,$0010,$FFB0,$0402,$00FF,$0000
	dw $FFB0,$0404,$00FF,$FFF0,$FFB0,$4404,$00FF,$FFE0
	dw $FFB0,$4402,$00FF,$0010,$FFC0,$0406,$00FF,$0000
	dw $FFC0,$0408,$00FF,$FFF0,$FFC0,$040A,$00FF,$FFE0
	dw $FFC0,$4406,$00FF,$0010,$FFD0,$040C,$00FF,$0000
	dw $FFD0,$040E,$00FF,$FFF0,$FFD0,$0420,$00FF,$FFE0
	dw $FFD0,$440C,$00FF,$0000,$FFE0,$0422,$00FF,$FFF0
	dw $FFE0,$0424,$00FF,$0000,$FFF0,$0426,$00FF,$FFF0
	dw $FFF0,$0428,$8000

DATA_19AA85:
	dw $0000,$0000,$00FF,$0000,$FFC0,$0400,$00FF,$FFF0
	dw $FFC0,$0402,$00FF,$0030,$FFD8,$0404,$00FF,$0020
	dw $FFD0,$0406,$00FF,$0010,$FFD0,$0408,$00FF,$0000
	dw $FFD0,$040A,$00FF,$FFF0,$FFD0,$040C,$00FF,$FFE0
	dw $FFD0,$4408,$00FF,$FFD0,$FFD0,$4406,$00FF,$FFC0
	dw $FFD8,$4404,$00FF,$0020,$FFE0,$040E,$00FF,$0000
	dw $FFE0,$0420,$00FF,$FFF0,$FFE0,$0422,$00FF,$FFD0
	dw $FFE0,$440E,$00FF,$0000,$FFF0,$0424,$00FF,$FFF0
	dw $FFF0,$0426,$8000

DATA_19AB0B:
	dw $0000,$0000,$00FF,$0000,$FFC0,$0400,$00FF,$FFF0
	dw $FFC0,$0402,$00FF,$0010,$FFD0,$0404,$00FF,$0000
	dw $FFD0,$0406,$00FF,$FFF0,$FFD0,$0408,$00FF,$FFE0
	dw $FFD0,$4404,$00FF,$0020,$FFE0,$040A,$00FF,$0010
	dw $FFE0,$040C,$00FF,$0000,$FFE0,$040E,$00FF,$FFF0
	dw $FFE0,$0420,$00FF,$FFE0,$FFE0,$440C,$00FF,$FFD0
	dw $FFE0,$440A,$00FF,$0010,$FFF0,$0422,$00FF,$0000
	dw $FFF0,$0424,$00FF,$FFF0,$FFF0,$4424,$00FF,$FFE0
	dw $FFF0,$4422,$8000

DATA_19AB91:
	dw $0000,$0010,$00FF,$FFF0,$FFC0,$0600,$00FF,$0000
	dw $FFC0,$0602,$00FF,$FFF0,$FFD0,$0604,$00FF,$0000
	dw $FFD0,$0606,$00FF,$FFF0,$FFE0,$0608,$00FF,$0000
	dw $FFE0,$060A,$00FF,$FFF0,$FFF0,$060C,$00FF,$0000
	dw $FFF0,$060E,$8000

DATA_19ABD7:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0400,$00FF,$0000
	dw $FFD0,$0402,$00FF,$FFF0,$FFE0,$0404,$00FF,$0000
	dw $FFE0,$0406,$00FF,$FFF0,$FFF0,$0408,$00FF,$0000
	dw $FFF0,$040A,$8000

DATA_19AC0D:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0400,$00FF,$0000
	dw $FFD0,$0402,$00FF,$FFF8,$FFE0,$0406,$00FF,$0010
	dw $FFD8,$0404,$00FF,$FFF0,$FFF0,$0408,$00FF,$0000
	dw $FFF0,$040A,$8000

DATA_19AC43:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0400,$00FF,$0000
	dw $FFD0,$0402,$00FF,$FFF0,$FFE0,$0404,$00FF,$0000
	dw $FFE0,$0406,$00FF,$FFF0,$FFF0,$0408,$00FF,$0000
	dw $FFF0,$040A,$8000

DATA_19AC79:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0400,$00FF,$0000
	dw $FFD0,$0402,$00FF,$FFF0,$FFE0,$0404,$00FF,$0000
	dw $FFE0,$0406,$00FF,$FFF0,$FFF0,$0408,$00FF,$0000
	dw $FFF0,$040A,$8000

DATA_19ACAF:
	dw $0000,$0000,$00FF,$FFF0,$FFD0,$0400,$00FF,$0000
	dw $FFD0,$0402,$00FF,$FFF0,$FFE0,$0404,$00FF,$0000
	dw $FFE0,$0406,$00FF,$FFF0,$FFF0,$0408,$00FF,$0000
	dw $FFF0,$040A,$8000

DATA_19ACE5:
	dw $FFF0,$0000,$00FF,$FFF0,$FFD0,$0400,$00FF,$0000
	dw $FFD0,$0402,$00FF,$FFF0,$FFE0,$0404,$00FF,$0000
	dw $FFE0,$0406,$00FF,$0000,$FFF0,$0408,$00FF,$0010
	dw $FFF0,$040A,$8000

DATA_19AD1B:
	dw $FFF0,$0010,$00FF,$FFE8,$FFE0,$0400,$00FF,$FFF8
	dw $FFE0,$0402,$00FF,$0008,$FFE0,$0404,$00FF,$FFE8
	dw $FFF0,$0406,$00FF,$FFF8,$FFF0,$0408,$00FF,$0008
	dw $FFF0,$040A,$8000

DATA_19AD51:
	dw $0000,$0000,$00FF,$FFF8,$FFD0,$0C0C,$00FF,$0008
	dw $FFD0,$0C0E,$00FF,$FFE8,$FFE0,$0C06,$00FF,$FFF8
	dw $FFE0,$0C08,$00FF,$0008,$FFE0,$0C0A,$00FF,$FFE0
	dw $FFF0,$0C00,$00FF,$FFF0,$FFF0,$0C02,$00FF,$0000
	dw $FFF0,$0C04,$8000

DATA_19AD97:
	db $00,$03,$7F,$00,$00,$00,$81,$00,$20,$83,$02,$02,$1D,$0D,$19,$1C
	db $0F,$80,$00,$03,$7F,$FF,$03,$03,$83,$03,$03,$81,$00,$20,$89,$04
	db $87,$02,$12,$0F,$16,$16,$19,$00,$21,$19,$1C,$16,$0E,$86,$01,$87
	db $00,$8B,$84,$03,$12,$0F,$16,$16,$19,$00,$0B,$11,$0B,$13,$18,$8C
	db $86,$01,$84,$03,$91,$90,$A4,$0C,$00,$04,$8A,$81,$00,$20,$89,$14
	db $8B,$83,$06,$06,$22,$17,$0F,$18,$8C,$85,$06,$91,$85,$02,$8A,$87
	db $00,$83,$00,$00,$89,$10,$8B,$22,$17,$0F,$18,$22,$17,$0F,$18,$22
	db $17,$0F,$18,$22,$17,$0F,$18,$8C,$84,$00,$8A,$83,$00,$0F,$89,$10
	db $8B,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$8C,$8F,$B0,$0C,$FF,$8D,$AE,$0C,$00,$8A,$88,$AF,$AD,$80

DATA_19AE36:
	db $00,$80,$40,$C0,$20,$A0,$60,$E0,$10,$90,$50,$D0,$30,$B0,$70,$F0
	db $08,$88,$48,$C8,$28,$A8,$68,$E8,$18,$98,$58,$D8,$38,$B8,$78,$F8
	db $04,$84,$44,$C4,$24,$A4,$64,$E4,$14,$94,$54,$D4,$34,$B4,$74,$F4
	db $0C,$8C,$4C,$CC,$2C,$AC,$6C,$EC,$1C,$9C,$5C,$DC,$3C,$BC,$7C,$FC
	db $02,$82,$42,$C2,$22,$A2,$62,$E2,$12,$92,$52,$D2,$32,$B2,$72,$F2
	db $0A,$8A,$4A,$CA,$2A,$AA,$6A,$EA,$1A,$9A,$5A,$DA,$3A,$BA,$7A,$FA
	db $06,$86,$46,$C6,$26,$A6,$66,$E6,$16,$96,$56,$D6,$36,$B6,$76,$F6
	db $0E,$8E,$4E,$CE,$2E,$AE,$6E,$EE,$1E,$9E,$5E,$DE,$3E,$BE,$7E,$FE
	db $01,$81,$41,$C1,$21,$A1,$61,$E1,$11,$91,$51,$D1,$31,$B1,$71,$F1
	db $09,$89,$49,$C9,$29,$A9,$69,$E9,$19,$99,$59,$D9,$39,$B9,$79,$F9
	db $05,$85,$45,$C5,$25,$A5,$65,$E5,$15,$95,$55,$D5,$35,$B5,$75,$F5
	db $0D,$8D,$4D,$CD,$2D,$AD,$6D,$ED,$1D,$9D,$5D,$DD,$3D,$BD,$7D,$FD
	db $03,$83,$43,$C3,$23,$A3,$63,$E3,$13,$93,$53,$D3,$33,$B3,$73,$F3
	db $0B,$8B,$4B,$CB,$2B,$AB,$6B,$EB,$1B,$9B,$5B,$DB,$3B,$BB,$7B,$FB
	db $07,$87,$47,$C7,$27,$A7,$67,$E7,$17,$97,$57,$D7,$37,$B7,$77,$F7
	db $0F,$8F,$4F,$CF,$2F,$AF,$6F,$EF,$1F,$9F,$5F,$DF,$3F,$BF,$7F,$FF
	db $EB,$60,$FF,$7F,$17,$6B,$51,$56,$AB,$41,$FF,$03,$1F,$03,$1B,$02
	db $1F,$00,$18,$00,$11,$00,$DF,$7D,$38,$7D,$8D,$7C,$00,$7C,$00,$00
	db $EB,$60,$FF,$7F,$FF,$03,$74,$03,$CC,$02,$45,$02,$A1,$01,$5F,$7E
	db $5F,$7E,$70,$2E,$CC,$25,$57,$56,$71,$39,$BB,$6C,$11,$48,$00,$00
	db $EB,$60,$FF,$7F,$5F,$67,$DF,$4E,$5F,$36,$DC,$21,$77,$11,$13,$05
	db $CE,$00,$17,$6B,$51,$56,$1F,$00,$1A,$00,$FF,$03,$3A,$03,$00,$00
	db $EB,$60,$FF,$7F,$5A,$73,$D6,$6A,$52,$5E,$EF,$55,$8B,$49,$29,$41
	db $E6,$34,$AE,$7E,$40,$7D,$1F,$42,$1F,$00,$77,$11,$CE,$00,$00,$00
	db $EB,$60,$FF,$7F,$5A,$7F,$B5,$7E,$EF,$7D,$4A,$7D,$A5,$7C,$21,$5C
	db $00,$3C,$FF,$33,$3B,$2B,$96,$26,$F2,$1D,$6E,$15,$EA,$10,$00,$00
	db $EB,$60,$FF,$7F,$7F,$47,$DB,$32,$57,$22,$D3,$15,$4F,$09,$EB,$00
	db $87,$00,$3D,$7E,$98,$71,$13,$61,$8E,$54,$29,$44,$06,$38,$00,$00
	db $EB,$60,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E
	db $5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$00,$00
	db $EB,$60,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E
	db $5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$5F,$7E,$00,$00

DATA_19B036:
	db $04,$B5,$16,$AF,$93,$A8,$6E,$A1,$99,$99,$08,$91,$AE,$87,$81,$7D
	db $7C,$72,$9C,$66,$E3,$59,$5B,$4C,$16,$3E,$2D,$2F,$C0,$1F,$F8,$0F
	db $00,$00

DATA_19B058:
	db $04,$B5,$C2,$BA,$A8,$C0,$AF,$C6,$CC,$CC,$F4,$D2,$16,$D9,$1F,$DF
	db $F9,$E4,$89,$EA,$B3,$EF,$58,$F4,$5B,$F8,$9D,$FB,$05,$FE,$80,$FF
	db $00,$00

DATA_19B07A:
	dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E
	dw $0010,$0012,$0014,$0016,$0018,$001A,$001C,$001C
	dw $001E,$001C,$001C,$001A,$0018,$0016,$0014,$0012
	dw $0010,$000E,$000C,$000A,$0008,$0006,$0004,$0002
	dw $0000

DATA_19B0BC:
	dw $FFF0,$FFF1,$FFF2,$FFF3,$FFF4,$FFF5,$FFF6,$FFF7
	dw $FFF8,$FFF9,$FFFA,$FFFB,$FFFC,$FFFD,$FFFE,$FFFF
	dw $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
	dw $0008,$0009,$000A,$000B,$000C,$000D,$000E,$000F
	dw $0010

DATA_19B0FE:
	dw $0401,$0402,$0403,$0404,$0405,$0406,$0407,$0408
	dw $0409,$040A,$040B,$040C,$040D,$040E,$040F,$0410
	dw $0411,$0412,$0413,$0414,$0415,$0416,$0417,$0418
	dw $0419,$041A,$041B,$041C,$041D,$041E,$041F,$0420
	dw $0421,$0422,$0423,$0424,$0425,$0426,$0427,$0428
	dw $0429,$042A,$042B,$042C,$042D,$042E,$042F,$0430
	dw $0431,$0432,$0433,$0434,$0435,$0436,$0437,$0438
	dw $0439,$043A,$043B,$043C,$043D,$043E,$043F,$0440
	dw $0441,$0442,$0443,$0444,$0445,$0446,$0447,$0448
	dw $0449,$044A,$044B,$044C,$044D,$044E,$044F,$0450
	dw $0451,$0452,$0453,$0454,$0455,$0456,$0457,$0458
	dw $0459,$045A,$045B,$045C,$045D,$045E,$045F,$0460
	dw $0461,$0462,$0463,$0464,$0465,$0466,$0467,$0468
	dw $0469,$046A,$046B,$046C

DATA_19B1D6:
	dw $0040,$0090,$0040,$0090,$0040,$0090,$0040,$0090
	dw $0040,$008B,$0040,$008B,$0040,$008B,$0040,$008F
	dw $0040,$008F,$0040,$008F

DATA_19B1FE:
	dw $1000,$1000,$1002,$1004,$1006,$1008,$1000,$1000
	dw $1000,$1000,$100A,$100C,$100E,$1020,$1000,$1000
	dw $1000,$1000,$1000,$1022,$1024,$1026,$1000,$1000
	dw $0828,$082A,$082C,$042E,$0440,$0842,$0844,$1000
	dw $0846,$0848,$084A,$084C,$084E,$0860,$0862,$1000
	dw $1000,$0864,$0866,$0868,$086A,$086C,$086E,$1000
	dw $1000,$1000,$0880,$0882,$0884,$0886,$0888,$1000
	dw $1000,$1000,$1000,$088A,$088C,$088E,$1000,$1000
	dw $1000,$0CA0,$0CA2,$0CA4,$0CA6,$0CA8,$0E66,$0CAA

DATA_19B28E:
	dw $1000,$1000,$1002,$1004,$1006,$1008,$1000,$1000
	dw $1000,$1000,$100A,$100C,$100E,$1020,$1000,$1000
	dw $1000,$1000,$1000,$1022,$1024,$1026,$1000,$1000
	dw $09E8,$09EA,$09EC,$05EE,$0600,$0A02,$0844,$1000
	dw $0A04,$0A06,$0A08,$0A0A,$0A0C,$0A0E,$0862,$1000
	dw $1000,$0864,$0866,$0868,$086A,$086C,$086E,$1000
	dw $1000,$1000,$0880,$0882,$0884,$0886,$0888,$1000
	dw $1000,$1000,$1000,$088A,$088C,$088E,$1000,$1000
	dw $1000,$0CA0,$0CA2,$0CA4,$0CA6,$0CA8,$0E66,$0CAA

DATA_19B31E:
	dw $1000,$1000,$1002,$1004,$1006,$1008,$1000,$1000
	dw $1000,$1000,$100A,$100C,$100E,$1020,$1000,$1000
	dw $1000,$1000,$1000,$1022,$1024,$1026,$1000,$1000
	dw $1000,$08AC,$08AE,$04C0,$04C2,$08C4,$0844,$1000
	dw $08C6,$08C8,$08CA,$08CC,$08CE,$08E0,$08E2,$1000
	dw $08E4,$08E6,$08E8,$08EA,$08EC,$08EE,$0900,$1000
	dw $0902,$0904,$0880,$0882,$0884,$0886,$0888,$1000
	dw $1000,$1000,$1000,$088A,$088C,$088E,$1000,$1000
	dw $1000,$0CA0,$0CA2,$0CA4,$0CA6,$0CA8,$0E66,$0CAA

DATA_19B3AE:
	dw $1000,$1000,$1002,$1004,$1006,$1008,$1000,$1000
	dw $1000,$1000,$100A,$100C,$100E,$1020,$1000,$1000
	dw $1000,$1000,$1000,$1022,$1024,$1026,$1000,$1000
	dw $1000,$08AC,$08AE,$04C0,$04C2,$08C4,$0844,$1000
	dw $08C6,$0A20,$0A22,$08CC,$0A2A,$0A2C,$08E2,$1000
	dw $0A24,$0A26,$08E8,$0A2E,$0A40,$0A42,$0900,$1000
	dw $0A28,$0904,$0880,$0A44,$0884,$0886,$0888,$1000
	dw $1000,$1000,$1000,$088A,$088C,$088E,$1000,$1000
	dw $1000,$0CA0,$0CA2,$0CA4,$0CA6,$0CA8,$0E66,$0CAA

DATA_19B43E:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$110A,$1000,$1000,$1000
	dw $1000,$1000,$1000,$110C,$110E,$1120,$1000,$1000
	dw $1000,$1000,$1000,$1122,$1124,$1126,$1000,$1000
	dw $1000,$1000,$0928,$052A,$052C,$052E,$0940,$1000
	dw $1000,$1000,$0942,$0944,$0946,$0948,$094A,$1000
	dw $1000,$1000,$094C,$094E,$0960,$0962,$0964,$1000
	dw $1000,$1000,$0966,$0968,$096A,$096C,$096E,$1000
	dw $1000,$1000,$1000,$0980,$0982,$0984,$1000,$1000

DATA_19B4CE:
	dw $1000,$1000,$1000,$1000,$110A,$1000,$1000,$1000
	dw $1000,$1000,$1000,$110C,$110E,$1120,$1000,$1000
	dw $1000,$1000,$1000,$1122,$1124,$1126,$1000,$1000
	dw $1000,$1000,$0928,$052A,$052C,$052E,$0940,$1000
	dw $1000,$1000,$0942,$0944,$0946,$0948,$094A,$1000
	dw $1000,$1000,$094C,$094E,$0960,$0962,$0964,$1000
	dw $1000,$1000,$0966,$0968,$0986,$096C,$096E,$1000
	dw $1000,$1000,$1000,$1000,$0988,$1000,$1000,$1000
	dw $1000,$1000,$1000,$0980,$0982,$0984,$1000,$1000

DATA_19B55E:
	dw $1000,$1000,$1000,$1000,$110A,$1000,$1000,$1000
	dw $1000,$1000,$1000,$110C,$110E,$1120,$1000,$1000
	dw $1000,$1000,$1000,$1122,$1124,$1126,$1000,$1000
	dw $1000,$1000,$0928,$052A,$052C,$052E,$0940,$1000
	dw $1000,$1000,$0942,$0944,$0946,$0948,$094A,$1000
	dw $1000,$1000,$0A46,$0A48,$0960,$0A4E,$0A60,$1000
	dw $1000,$1000,$0A4A,$0A4C,$0986,$0A62,$0A64,$1000
	dw $1000,$1000,$1000,$1000,$0988,$1000,$1000,$1000
	dw $1000,$1000,$1000,$0980,$0982,$0984,$1000,$1000

DATA_19B5EE:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$118A,$118C,$118E,$1000,$1000
	dw $1000,$1000,$09A0,$11A2,$11A4,$09A6,$1000,$1000
	dw $1000,$1000,$09A8,$05AA,$05AC,$09AE,$1000,$1000
	dw $1000,$1000,$1000,$09C0,$09C2,$09C4,$1000,$1000
	dw $1000,$1000,$1000,$09C6,$09C8,$09CA,$1000,$1000

DATA_19B67E:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$118A,$118C,$118E,$1000,$1000
	dw $1000,$1000,$09A0,$11A2,$11A4,$09A6,$1000,$1000
	dw $1000,$1000,$09A8,$05AA,$05AC,$09AE,$1000,$1000
	dw $1000,$1000,$1000,$09CC,$09CE,$09E0,$1000,$1000
	dw $1000,$1000,$1000,$09E2,$09E4,$09E6,$1000,$1000

DATA_19B70E:
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$0668,$066A,$0A6C,$0A6E,$1000,$1000
	dw $1000,$1000,$0680,$0682,$0A84,$0A86,$1000,$1000

DATA_19B79E:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$8000,$8000,$8000,$8000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$A000,$A000,$A000,$A000
	dw $A000,$A000,$A000,$A000,$A000,$A000,$A000,$A000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$8000,$8000,$8000,$8000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$8010,$8010,$0000,$0000,$8010,$8010
	dw $0000,$0000,$0000,$0000,$4000,$4000,$2000,$2000
	dw $4000,$4000,$2000,$2000,$4000,$4000,$2000,$2000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$8000,$8000,$0000,$0000,$8000,$8000
	dw $0000,$0000,$8000,$8000,$0000,$0000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
	dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000

DATA_19BF9E:
	dw $0000,$0000,$0000,$0000,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$A000,$A000,$A000,$A000
	dw $A000,$A000,$A000,$A000,$A000,$A000,$A000,$A000
	dw $A000,$A000,$A000,$A000,$A000,$A000,$A000,$A000
	dw $A000,$A000,$A000,$A000,$A000,$A000,$A000,$A000
	dw $A000,$A000,$A000,$A000,$0000,$0000,$0000,$0000
	dw $0000,$8010,$0000,$8010,$0000,$0000,$0000,$0000
	dw $0000,$8010,$0000,$8010,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0010,$0010
	dw $0000,$0000,$0010,$0010,$A000,$A000,$A000,$A000
	dw $A000,$A000,$A000,$A000,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A000,$A000,$A000,$A000,$A008,$A008,$A008,$A008
	dw $A000,$A000,$A000,$A000,$A008,$A008,$A008,$A008
	dw $0000,$A000,$0000,$A000,$2000,$2000,$0000,$0000
	dw $A000,$A000,$A000,$A000,$A000,$A000,$A000,$A000
	dw $0000,$0000,$0000,$0000,$2000,$2000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$2000,$2000,$0000,$0000
	dw $2000,$2000,$0000,$0000,$2000,$2000,$0000,$2000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$8000,$0000,$8000
	dw $0000,$8000,$0000,$8000,$8010,$8010,$0000,$0000
	dw $8010,$8010,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$8000,$0000,$8000,$6000,$6000,$2000,$2000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$8000,$8000,$8000,$8000
	dw $A008,$A008,$A008,$A008,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
	dw $1000,$1000,$1000,$1000,$A000,$A000,$2000,$2000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$8008,$8008,$8008,$8008
	dw $8008,$8008,$8008,$8008,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$6000,$6000,$2000,$2000
	dw $0000,$0000,$2000,$2000,$0000,$0000,$2000,$2000
	dw $6000,$6000,$0000,$0000,$6000,$6000,$0000,$0000
	dw $6000,$6000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $6000,$6000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$4000,$4000,$0000,$0000
	dw $4000,$4000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $A008,$A000,$A008,$A000,$A000,$A000,$A000,$A000
	dw $A000,$A008,$A000,$A008,$2000,$A000,$0000,$2000
	dw $8000,$8000,$A000,$A000,$A000,$2000,$2000,$0000
	dw $A008,$8000,$A008,$8000,$8000,$8000,$8000,$8000
	dw $A008,$A008,$A008,$A008,$A008,$A008,$A008,$A008
	dw $8000,$A008,$8000,$A008,$0000,$0000,$0000,$0000
	dw $2000,$A000,$0000,$2000,$A000,$2000,$2000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

	%DATATABLE_SXAR_UnsortedDataBlock3($19C79E)
	%InsertGarbageData($19C886, incbin, DATA_19C886.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank1AMacros(StartBank, EndBank)
%BANK_START(<StartBank>)

DATA_1A8000:
	incbin "Graphics/GFX_Sprite_Nastirh.bin"

DATA_1A9800:
	incbin "Graphics/GFX_Sprite_Shocker.bin"

DATA_1AA800:
	incbin "Graphics/GFX_Sprite_Carnage.bin"

DATA_1ACF00:
	incbin "Graphics/GFX_Sprite_Rhino.bin"

	%InsertGarbageData($1ADF00, incbin, DATA_1ADF00.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SXARBank1BMacros(StartBank, EndBank)
%BANK_START(<StartBank>)

DATA_1B8000:
	incbin "Graphics/GFX_Player_SpiderMan.bin"

	%InsertGarbageData($1BE000, incbin, DATA_1BE000.bin)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro DATATABLE_SXAR_UnsortedDataBlock1(Address)
%InsertMacroAtXPosition(<Address>)
namespace SXAR_UnsortedDataBlock1

!Define_SXAR_UnsortedDataIndex #= $0000					; Note: Do not touch this!

DATA_01B6E2:
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_FGBG_Wolverine2, "Palettes/FGBG_Wolverine2.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_FGBG_SwimmingStormLevel, "Graphics/Compressed/GFX_FGBG_SwimmingStormLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_SwimmingStormEnemies, "Graphics/Compressed/GFX_Sprite_SwimmingStormEnemies.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Player_SwimmingStorm, "Graphics/Compressed/GFX_Player_SwimmingStorm.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Player_Wolverine, "Graphics/Compressed/GFX_Player_Wolverine.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Player_WolverineClaws, "Graphics/Compressed/GFX_Player_WolverineClaws.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_CyclopsGlobalSpritesAndEnemies, "Graphics/Compressed/GFX_Sprite_CyclopsGlobalSpritesAndEnemies.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Player_Cyclops, "Graphics/Compressed/GFX_Player_Cyclops.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_FGBG_CyclopsLevel, "Graphics/Compressed/GFX_FGBG_CyclopsLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_WeirdAlienCaveCreature, "Graphics/Compressed/GFX_Sprite_WeirdAlienCaveCreature.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_FGBG_MasterMold, "Graphics/Compressed/GFX_FGBG_MasterMold.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_StormPortrait, "Graphics/Compressed/GFX_Sprite_StormPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_CyclopsPortrait, "Graphics/Compressed/GFX_Sprite_CyclopsPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_WolverinePortrait, "Graphics/Compressed/GFX_Sprite_WolverinePortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_GambitPortrait, "Graphics/Compressed/GFX_Sprite_GambitPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_SpiderManPortrait, "Graphics/Compressed/GFX_Sprite_SpiderManPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_WolverineLevel1EnemiesAndGlobalSprites, "Graphics/Compressed/GFX_Sprite_WolverineLevel1EnemiesAndGlobalSprites.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Layer1_CharacterBioFont, "Graphics/Compressed/GFX_Layer1_CharacterBioFont.bin")
	%SXAR_UnsortedDataTableEntry($0000, Block1, Graphics_Sprite_PausedText, "Graphics/Compressed/GFX_Sprite_PausedText.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_FGBG_WolverineLevel, "Graphics/Compressed/GFX_FGBG_WolverineLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_MiniMasterMoldAndEnemyShip, "Graphics/Compressed/GFX_Sprite_MiniMasterMoldAndEnemyShip.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_Obnoxio, "Graphics/Compressed/GFX_Sprite_Obnoxio.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_XMenLogo, "Graphics/Compressed/GFX_Sprite_XMenLogo.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Layer1_ComicBookIntroCutscene, "Graphics/Compressed/GFX_Layer1_ComicBookIntroCutscene.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Layer1_ComicBookEndingCutscene, "Graphics/Compressed/GFX_Layer1_ComicBookEndingCutscene.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_ComicBookIntroCutscene, "Graphics/Compressed/GFX_Sprite_ComicBookIntroCutscene.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_ComicBookEndingCutscene, "Graphics/Compressed/GFX_Sprite_ComicBookEndingCutscene.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_Apocalypse, "Graphics/Compressed/GFX_Sprite_Apocalypse.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_WolverineLevel2EnemiesAndGlobalSprites, "Graphics/Compressed/GFX_Sprite_WolverineLevel2EnemiesAndGlobalSprites.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Layer1_ArcadeBriefingCutscene, "Graphics/Compressed/GFX_Layer1_ArcadeBriefingCutscene.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_FGBG_WolverineCyclopsFinalLevel, "Graphics/Compressed/GFX_FGBG_WolverineCyclopsFinalLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_DrainBeam1, "Graphics/Compressed/GFX_Sprite_DrainBeam1.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block1, Graphics_Sprite_DrainBeam2, "Graphics/Compressed/GFX_Sprite_DrainBeam2.bin")
	%SXAR_UnsortedDataTableEntry($0008, Block1, Graphics_Layer3_Water, "Graphics/Compressed/GFX_Layer3_Water.bin")
	%SXAR_UnsortedDataTableEntry($0002, Block1, Tilemap_Unknown1, "Tilemaps/Unknown1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Tilemap_Unknown2, "Tilemaps/Unknown2.bin")
	%SXAR_UnsortedDataTableEntry($0002, Block1, Tilemap_IntroComicBook, "Tilemaps/IntroComicBook.bin")
	%SXAR_UnsortedDataTableEntry($0008, Block1, Tilemap_ComicBookEndingCutscene, "Tilemaps/ComicBookEndingCutscene.bin")
	%SXAR_UnsortedDataTableEntry($0008, Block1, Tilemap_Layer2_ArcadeBriefingCutscene1, "Tilemaps/Layer2_ArcadeBriefingCutscene1.bin")
	%SXAR_UnsortedDataTableEntry($0008, Block1, Tilemap_Layer2_ArcadeBriefingCutscene2, "Tilemaps/Layer2_ArcadeBriefingCutscene2.bin")
	%SXAR_UnsortedDataTableEntry($0008, Block1, Tilemap_Layer2_TopRowsOfArcadeBriefingCutscene, "Tilemaps/Layer2_TopRowsOfArcadeBriefingCutscene.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, Tilemap_Layer3_Water, "Tilemaps/Layer3_Water.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelBG_Storm1, "Tilemaps/LevelBackgrounds/Storm1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelBG_Cyclops1, "Tilemaps/LevelBackgrounds/Cyclops1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, Tilemap_Unknown3, "Tilemaps/Unknown3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Storm1, "LevelData/Storm1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Storm2, "LevelData/Storm2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Cyclops1, "LevelData/Cyclops1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Cyclops2Boss, "LevelData/Cyclops2Boss.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Wolverine1, "LevelData/Wolverine1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelBG_Wolverine1, "Tilemaps/LevelBackgrounds/Wolverine1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Cyclops2, "LevelData/Cyclops2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Wolverine2, "LevelData/Wolverine2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelBG_Wolverine2, "Tilemaps/LevelBackgrounds/Wolverine2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Wolverine3, "LevelData/Wolverine3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelData_Cyclops3, "LevelData/Cyclops3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block1, LevelBG_Cyclops3, "Tilemaps/LevelBackgrounds/Cyclops3.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Unknown1, "Palettes/Unknown1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Unknown2, "Palettes/Unknown2.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Unknown3, "Palettes/Unknown3.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Unknown4, "Palettes/Unknown4.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Unknown5, "Palettes/Unknown5.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_FGBGSprite_Storm1, "Palettes/FGBGSprite_Storm1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_SplashScreenAndSpiderManLogo, "Palettes/SplashScreenAndSpiderManLogo.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Sprite_Cyclops1, "Palettes/Sprite_Cyclops1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_FGBG_Cyclops1, "Palettes/FGBG_Cyclops1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_FGBG_Cyclops2Boss, "Palettes/FGBG_Cyclops2Boss.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_StormPortrait, "Palettes/StormPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_CyclopsPortrait, "Palettes/CyclopsPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_WolverinePortrait, "Palettes/WolverinePortrait.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_GambitPortrait, "Palettes/GambitPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_SpiderManPortrait, "Palettes/SpiderManPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Credits, "Palettes/Credits.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Sprite_Wolverine1, "Palettes/Sprite_Wolverine1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Sprite_CharacterSelect, "Palettes/Sprite_CharacterSelect.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_FGBG_Wolverine1, "Palettes/FGBG_Wolverine1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_WellDoneText, "Palettes/WellDoneText.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_TitleScreenCharacters, "Palettes/TitleScreenCharacters.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_BG_Cyclops2, "Palettes/BG_Cyclops2.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_TitleScreenXMenLogo, "Palettes/TitleScreenXMenLogo.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Layer1_IntroComicBook, "Palettes/Layer1_IntroComicBook.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Layer1_EndingComicBook, "Palettes/Layer1_EndingComicBook.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Sprite_IntroComicBook, "Palettes/Sprite_IntroComicBook.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Sprite_Wolverine2, "Palettes/Sprite_Wolverine2.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Layer1_ArcadeBriefingCutscene1, "Palettes/Layer1_ArcadeBriefingCutscene1.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Layer1_ArcadeBriefingCutscene2, "Palettes/Layer1_ArcadeBriefingCutscene2.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_FGBG_Cyclops3, "Palettes/FGBG_Cyclops3.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Palette_Sprite_DrainBeam, "Palettes/Sprite_DrainBeam.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Graphics_Layer1_TitleScreenCharacters, "Graphics/GFX_Layer1_TitleScreenCharacters.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Tilemap_Layer1_TitleScreenCharacters, "Tilemaps/Layer1_TitleScreenCharacters.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Graphics_Sprite_LargeFont, "Graphics/GFX_Sprite_LargeFont.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Graphics_UnknownItalicFont, "Graphics/GFX_UnknownItalicFont.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Graphics_Mode7_CopyOfAcclaimAndXMenLogos, "Graphics/GFX_Mode7_CopyOfAcclaimAndXMenLogos.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Graphics_Sprite_SpiderManLogo, "Graphics/GFX_Sprite_SpiderManLogo.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Graphics_Sprite_SoftwareCreationsLogo, "Graphics/GFX_Sprite_SoftwareCreationsLogo.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, SPCEngine, "SPC700/SPC700_Engine_SXAR.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, SPCSampleBank, "SPC700/SPCSampleBank.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_CopyOfBriefing, "SPC700/Music/CopyOfBriefing.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_SpiderManLevel, "SPC700/Music/SpiderManLevel.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_StormLevel, "SPC700/Music/StormLevel.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_CyclopsLevel, "SPC700/Music/CyclopsLevel.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_TitleScreen, "SPC700/Music/TitleScreen.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_WolverineLevel, "SPC700/Music/WolverineLevel.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_GambitLevel, "SPC700/Music/GambitLevel.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_HighScore, "SPC700/Music/HighScore.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_Briefing, "SPC700/Music/Briefing.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_Ending, "SPC700/Music/Ending.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_FinalLevel, "SPC700/Music/FinalLevel.bin")
	%SXAR_UnsortedDataTableEntry($0006, Block1, Music_GameOver, "SPC700/Music/GameOver.bin")

	%SXAR_GenerateUnsortedDataPointersAndSize()
namespace off
endmacro

macro DATATABLE_SXAR_UnsortedDataBlock2(Address)
%InsertMacroAtXPosition(<Address>)
namespace SXAR_UnsortedDataBlock2

!Define_SXAR_UnsortedDataIndex #= $0000					; Note: Do not touch this!

DATA_14AF9E:
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Layer3_GambitLevelSmallAndLargeFont, "Graphics/Compressed/GFX_Layer3_GambitLevelSmallAndLargeFont.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Sprite_CopyOfGambitPortrait, "Graphics/Compressed/GFX_Sprite_CopyOfGambitPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Sprite_CopyOfStormPortrait, "Graphics/Compressed/GFX_Sprite_CopyOfStormPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Sprite_KingCard, "Graphics/Compressed/GFX_Sprite_KingCard.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Layer2_KingCardBG, "Graphics/Compressed/GFX_Layer2_KingCardBG.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Layer2_DescendingWall, "Graphics/Compressed/GFX_Layer2_DescendingWall.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Sprite_WalkingStormEnemiesAndGlobalSprites, "Graphics/Compressed/GFX_Sprite_WalkingStormEnemiesAndGlobalSprites.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Sprite_GambitLevelGlobalSprites_BlackQueen, "Graphics/Compressed/GFX_Sprite_GambitLevelGlobalSprites_BlackQueen.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_FGBG_FinalGambitLevel, "Graphics/Compressed/GFX_FGBG_FinalGambitLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_FGBG_GambitLevel, "Graphics/Compressed/GFX_FGBG_GambitLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Layer2_GiantSpikeBall, "Graphics/Compressed/GFX_Layer2_GiantSpikeBall.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_FG_BlackQueenThrone, "Graphics/Compressed/GFX_FG_BlackQueenThrone.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_FGBG_Gambit1, "Palettes/FGBG_Gambit1.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_FGBG_Gambit2, "Palettes/FGBG_Gambit2.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_Sprite_Gambit1, "Palettes/Sprite_Gambit1.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_CopyOfGambitPortrait, "Palettes/CopyOfGambitPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_CopyOfStormPortrait, "Palettes/CopyOfStormPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_Sprite_Storm3, "Palettes/Sprite_Storm3.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Palette_FGBG_FinalGambit, "Palettes/FGBG_FinalGambit.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Player_Gambit, "Graphics/Compressed/GFX_Player_Gambit.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Player_WalkingStorm, "Graphics/Compressed/GFX_Player_WalkingStorm.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block2, Graphics_Sprite_GambitLevelEnemies, "Graphics/Compressed/GFX_Sprite_GambitLevelEnemies.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block2, LevelData_Gambit1, "LevelData/Gambit1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block2, LevelData_Gambit2, "LevelData/Gambit2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block2, LevelBG_Gambit2, "Tilemaps/LevelBackgrounds/Gambit2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block2, LevelData_Gambit3, "LevelData/Gambit3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block2, LevelBG_Gambit3, "Tilemaps/LevelBackgrounds/Gambit3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block2, LevelData_Storm3, "LevelData/Storm3.bin")

	%SXAR_GenerateUnsortedDataPointersAndSize()
namespace off
endmacro

macro DATATABLE_SXAR_UnsortedDataBlock3(Address)
%InsertMacroAtXPosition(<Address>)
namespace SXAR_UnsortedDataBlock3

!Define_SXAR_UnsortedDataIndex #= $0000					; Note: Do not touch this!

DATA_19C79E:
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_FGBG_City, "Graphics/Compressed/GFX_FGBG_City.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_FGBG_SpiderMan1, "Palettes/FGBG_SpiderMan1.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_FGBG_IntroLevel, "Palettes/FGBG_IntroLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Layer3_SmallAndLargeFont, "Graphics/Compressed/GFX_Layer3_SmallAndLargeFont.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_GetReadySpiderMan, "Palettes/GetReadySpiderMan.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_SpiderMan, "Palettes/SpiderMan.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Sprite_WebSwing, "Graphics/Compressed/GFX_Sprite_WebSwing.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_Unknown6, "Palettes/Unknown6.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Sprite_CopyOfSpiderManPortrait, "Graphics/Compressed/GFX_Sprite_CopyOfSpiderManPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_CopyOfSpiderManPortrait, "Palettes/CopyOfSpiderManPortrait.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_FGBG_FinalBoss, "Graphics/Compressed/GFX_FGBG_FinalBoss.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_FGBG_SpiderMan3, "Palettes/FGBG_SpiderMan3.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_FGBG_FinalBoss, "Palettes/FGBG_FinalBoss.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Sprite_GlobalSpiderManLevelSprites, "Graphics/Compressed/GFX_Sprite_GlobalSpiderManLevelSprites.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Sprite_IntroLevelEnemies, "Graphics/Compressed/GFX_Sprite_IntroLevelEnemies.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_Sprite_IntroLevel, "Palettes/Sprite_IntroLevel.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Sprite_SpiderManLevelEnemies, "Graphics/Compressed/GFX_Sprite_SpiderManLevelEnemies.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_Sprite_SpiderMan2, "Palettes/Sprite_SpiderMan2.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Graphics_Sprite_FinalBoss, "Graphics/Compressed/GFX_Sprite_FinalBoss.bin")
	%SXAR_UnsortedDataTableEntry($0004, Block3, Palette_Sprite_FinalBoss, "Palettes/Sprite_FinalBoss.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelData_SpiderMan1, "LevelData/SpiderMan1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelBG_SpiderMan1, "Tilemaps/LevelBackgrounds/SpiderMan1.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelData_SpiderMan2, "LevelData/SpiderMan2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelBG_SpiderMan2, "Tilemaps/LevelBackgrounds/SpiderMan2.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelData_IntroLevel, "LevelData/IntroLevel.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelBG_IntroLevel, "Tilemaps/LevelBackgrounds/IntroLevel.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelData_SpiderMan3, "LevelData/SpiderMan3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelBG_SpiderMan3, "Tilemaps/LevelBackgrounds/SpiderMan3.bin")
	%SXAR_UnsortedDataTableEntry($000A, Block3, LevelData_FinalBoss, "LevelData/FinalBoss.bin")

	%SXAR_GenerateUnsortedDataPointersAndSize()
namespace off
endmacro

;#############################################################################################################
;#############################################################################################################
