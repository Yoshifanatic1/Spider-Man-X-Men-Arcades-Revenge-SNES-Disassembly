
;--------------------------------------------------------------------

macro SXAR_InsertUnsortedData(Address, Command, Label)
	;%InsertMacroAtXPosition(<Address>)
	%SXAR_GetUnsortedDataDefine(TEMP1, <Label>, "")
	%SXAR_GetUnsortedDataDefine(TEMP2, FilePath, !{TEMP1})
;print "(",hex(SXAR_UnsortedData_DATA_01B7BC_<Label>-SXAR_UnsortedDataBlock1_DATA_01B7BC),") <Label> was inserted at $",pc
<Label>:
	<Command> "!TEMP2"
<Label>End:
endmacro

;--------------------------------------------------------------------

macro SXAR_UnsortedDataTableEntry(Parameter, BlockID, Label, FilePath)
.<Label>:
	dw <Parameter>

%SXAR_CreateUnsortedDataDefine(Define_SXAR_UnsortedData<Label>, !Define_SXAR_UnsortedDataIndex, "")
%SXAR_CreateUnsortedDataDefine(Define_SXAR_UnsortedDataPointer, (((SXAR_UnsortedData<BlockID>_<Label>-SXAR_UnsortedData<BlockID>_Main)/2)&$FF8000)|(SXAR_UnsortedData<BlockID>_<Label>&$007FFF), !Define_SXAR_UnsortedDataIndex)
%SXAR_CreateUnsortedDataDefine(Define_SXAR_UnsortedDataFilePath, "<FilePath>", !Define_SXAR_UnsortedDataIndex)
%SXAR_CreateUnsortedDataDefine(Define_SXAR_UnsortedDataSize, filesize("<FilePath>"), !Define_SXAR_UnsortedDataIndex)
;print <Label>'s data pointer is index ",hex(!Define_SXAR_UnsortedDataIndex)

!Define_SXAR_UnsortedDataIndex #= !Define_SXAR_UnsortedDataIndex+$02
endmacro

;--------------------------------------------------------------------

macro SXAR_GenerateUnsortedDataPointersAndSize()
!LoopCounter #= 0
Ptrs:						;$01B7BC/$14AFD6/$19C7D8
while !LoopCounter < !Define_SXAR_UnsortedDataIndex
	%SXAR_GetUnsortedDataDefine(TEMP1, Pointer, !LoopCounter)
	dd !TEMP1
	!LoopCounter #= !LoopCounter+2
endif
!LoopCounter #= 0
DataBlockSize:					;$01B970/$14B046/$19C84C
while !LoopCounter < !Define_SXAR_UnsortedDataIndex
	%SXAR_GetUnsortedDataDefine(TEMP1, Size, !LoopCounter)
	dw !TEMP1
	!LoopCounter #= !LoopCounter+2
endif
endmacro

;--------------------------------------------------------------------

macro SXAR_CreateUnsortedDataDefine(Define, Data, Index)
	!<Define><Index> = <Data>
	;print hex(!<Define>_<Label>)
endmacro

;--------------------------------------------------------------------

macro SXAR_GetUnsortedDataDefine(Var, Param, Index)
	!<Var> = !Define_SXAR_UnsortedData<Param><Index>
endmacro
 
;--------------------------------------------------------------------
