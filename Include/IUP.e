--IUP Wrapper for OpenEuphoria
--Written by Andy P. (Icy_Viking)
--Icy Viking Games
--Wrapper Copyright (c) 2023

include std/ffi.e
include std/machine.e

--Global variable to load shared library
public atom iup = 0

include iupkey.e --key definitions
include iupdef.e --iup definitions

--IUP Defines
public constant IUP_NAME = "IUP - Portable User Interface"
public constant IUP_DESCRIPTION = "Multi-platform Toolkit for Building Graphical User Interfaces"
public constant IUP_COPYRIGHT = "Copyright (c) 1994-2020 Tecgraf/PUC-Rio"
public constant IUP_VERSION = "3.30"
public constant IUP_VERSION_NUMBER = 330000
public constant IUP_VERSION_DATE = "2020/07/30"

--OS Check
ifdef WINDOWS then
	iup = open_dll("iup.dll")
	elsifdef LINUX or FREEBSD then
	iup = open_dll("libiup.so")
	elsifdef OSX then
	iup = open_dll("libiup.dylib")
end ifdef

if iup = -1 then
	puts(1,"Failed to load IUP library!\n")
	abort(0)
end if

--Main API

public constant xIupOpen = define_c_func(iup,"+IupOpen",{C_POINTER,C_POINTER},C_INT),
				xIupClose = define_c_proc(iup,"+IupClose",{}),
				xIupIsOpened = define_c_func(iup,"+IupIsOpened",{},C_INT)
				
public function IupOpen(atom argc,atom argv)
	return c_func(xIupOpen,{argc,argv})
end function

public procedure IupClose()
	c_proc(xIupClose,{})
end procedure

public function IupIsOpened()
	return c_func(xIupIsOpened,{})
end function

public constant xIupImageLibOpen = define_c_proc(iup,"+IupImageLibOpen",{})

public procedure IupImageLibOpen()
	c_proc(xIupImageLibOpen,{})
end procedure

public constant xIupMainLoop = define_c_func(iup,"+IupMainLoop",{},C_INT),
				xIupLoopStep = define_c_func(iup,"+IupLoopStep",{},C_INT),
				xIupLoopStepWait = define_c_func(iup,"+IupLoopStepWait",{},C_INT),
				xIupMainLoopLevel = define_c_func(iup,"+IupMainLoopLevel",{},C_INT),
				xIupFlush = define_c_proc(iup,"+IupFlush",{}),
				xIupExitLoop = define_c_proc(iup,"+IupExitLoop",{}),
				xIupPostMessage = define_c_proc(iup,"+IupPostMessage",{C_POINTER,C_STRING,C_INT,C_DOUBLE,C_POINTER})
				
public function IupMainLoop()
	return c_func(xIupMainLoop,{})
end function

public function IupLoopStep()
	return c_func(xIupLoopStep,{})
end function

public function IupLoopStepWait()
	return c_func(xIupLoopStepWait,{})
end function

public function IupMainLoopLevel()
	return c_func(xIupMainLoopLevel,{})
end function

public procedure IupFlush()
	c_proc(xIupFlush,{})
end procedure

public procedure IupExitLoop()
	c_proc(xIupExitLoop,{})
end procedure

public procedure IupPostMessage(atom h,sequence s,atom i,atom d,atom p)
	c_proc(xIupPostMessage,{h,s,i,d,p})
end procedure

public constant xIupRecordInput = define_c_func(iup,"+IupRecordInput",{C_STRING,C_INT},C_INT),
				xIupPlayInput = define_c_func(iup,"+IupPlayInput",{C_STRING},C_INT)
				
public function IupRecordInput(sequence fname,atom mode)
	return c_func(xIupRecordInput,{fname,mode})
end function

public function IupPlayInput(sequence fname)
	return c_func(xIupPlayInput,{fname})
end function

public constant xIupUpdate = define_c_proc(iup,"+IupUpdate",{C_POINTER}),
				xIupUpdateChildren = define_c_proc(iup,"+IupUpdateChildren",{C_POINTER}),
				xIupRedraw = define_c_proc(iup,"+IupRedraw",{C_POINTER,C_INT}),
				xIupRefresh = define_c_proc(iup,"+IupRefresh",{C_POINTER}),
				xIupRefreshChildren = define_c_proc(iup,"+IupRefreshChildren",{C_POINTER})
				
public procedure IupUpdate(atom ih)
	c_proc(xIupUpdate,{ih})
end procedure

public procedure IupUpdateChildren(atom ih)
	c_proc(xIupUpdateChildren,{ih})
end procedure

public procedure IupRedraw(atom ih,atom children)
	c_proc(xIupRedraw,{ih,children})
end procedure

public procedure IupRefresh(atom ih)
	c_proc(xIupRefresh,{ih})
end procedure

public procedure IupRefreshChildren(atom ih)
	c_proc(xIupRefreshChildren,{ih})
end procedure

public constant xIupExecute = define_c_func(iup,"+IupExecute",{C_STRING,C_STRING},C_INT),
				xIupExecuteWait = define_c_func(iup,"+IupExecuteWait",{C_STRING,C_STRING},C_INT),
				xIupHelp = define_c_func(iup,"+IupHelp",{C_STRING},C_INT),
				xIupLog = define_c_proc(iup,"+IupLog",{C_STRING,C_STRING})
				
public function IupExecute(sequence fname,sequence parameters)
	return c_func(xIupExecute,{fname,parameters})
end function

public function IupExecuteWait(sequence fname,sequence parameters)
	return c_func(xIupExecuteWait,{fname,parameters})
end function

public function IupHelp(sequence url)
	return c_func(xIupHelp,{url})
end function

public procedure IupLog(sequence xtype,sequence format)
	c_proc(xIupLog,{xtype,format})
end procedure

public constant xIupLoad = define_c_func(iup,"+IupLoad",{C_STRING},C_POINTER),
				xIupLoadBuffer = define_c_func(iup,"+IupLoadBuffer",{C_STRING},C_POINTER)
				
public function IupLoad(sequence fname)
	return c_func(xIupLoad,{fname})
end function

public function IupLoadBuffer(sequence buffer)
	return c_func(xIupLoadBuffer,{buffer})
end function

public constant xIupVersion = define_c_func(iup,"+IupVersion",{},C_POINTER),
				xIupVersionDate = define_c_func(iup,"+IupVersionDate",{},C_POINTER),
				xIupVersionNumber = define_c_func(iup,"+IupVersionNumber",{},C_INT),
				xIupVersionShow = define_c_proc(iup,"+IupVersionShow",{})
				
public function IupVersion()
	return c_func(xIupVersion,{})
end function

public function IupVersionDate()
	return c_func(xIupVersionDate,{})
end function

public function IupVersionNumber()
	return c_func(xIupVersionNumber,{})
end function

public procedure IupVersionShow()
	c_proc(xIupVersionShow,{})
end procedure

public constant xIupSetLanguage = define_c_proc(iup,"+IupSetLanguage",{C_STRING}),
				xIupGetLanguage = define_c_func(iup,"+IupGetLanguage",{},C_POINTER),
				xIupSetLanguageString = define_c_proc(iup,"+IupSetLanguageString",{C_STRING,C_STRING}),
				xIupStoreLanguageString = define_c_proc(iup,"+IupStoreLanguageString",{C_STRING,C_STRING}),
				xIupGetLanguageString = define_c_func(iup,"+IupGetLanguageString",{C_STRING},C_POINTER),
				xIupSetLanguagePack = define_c_proc(iup,"+IupSetLanguagePack",{C_POINTER})
				
public procedure IupSetLanguage(sequence lng)
	c_proc(xIupSetLanguage,{lng})
end procedure

public function IupGetLanguage()
	return c_func(xIupGetLanguage,{})
end function

public procedure IupSetLanguageString(sequence name,sequence str)
	c_proc(xIupSetLanguageString,{name,str})
end procedure

public procedure IupStoreLanguageString(sequence name,sequence str)
	c_proc(xIupStoreLanguageString,{name,str})
end procedure

public function IupGetLanguageString(sequence name)
	return c_func(xIupGetLanguageString,{name})
end function

public procedure IupSetLanguagePack(atom ih)
	c_proc(xIupSetLanguagePack,{ih})
end procedure

public constant xIupDestroy = define_c_proc(iup,"+IupDestroy",{C_POINTER}),
				xIupDetach = define_c_proc(iup,"+IupDetach",{C_POINTER}),
				xIupAppend = define_c_func(iup,"+IupAppend",{C_POINTER,C_POINTER},C_POINTER),
				xIupInsert = define_c_func(iup,"+IupInsert",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xIupGetChild = define_c_func(iup,"+IupGetChild",{C_POINTER,C_INT},C_POINTER),
				xIupGetChildPos = define_c_func(iup,"+IupGetChildPos",{C_POINTER,C_POINTER},C_INT),
				xIupGetChildCount = define_c_func(iup,"+IupGetChildCount",{C_POINTER},C_INT),
				xIupGetNextChild = define_c_func(iup,"+IupGetNextChild",{C_POINTER,C_POINTER},C_POINTER),
				xIupGetBrother = define_c_func(iup,"+IupGetBrother",{C_POINTER},C_POINTER),
				xIupGetParent = define_c_func(iup,"+IupGetParent",{C_POINTER},C_POINTER),
				xIupGetDialog = define_c_func(iup,"+IupGetDialog",{C_POINTER},C_POINTER),
				xIupGetDialogChild = define_c_func(iup,"+IupGetDialogChild",{C_POINTER,C_STRING},C_POINTER),
				xIupReparent = define_c_func(iup,"+IupReparent",{C_POINTER,C_POINTER,C_POINTER},C_INT)
				
public procedure IupDestroy(atom ih)
	c_proc(xIupDestroy,{ih})
end procedure

public procedure IupDetach(atom child)
	c_proc(xIupDetach,{child})
end procedure

public function IupAppend(atom ih,atom child)
	return c_func(xIupAppend,{ih,child})
end function

public function IupInsert(atom ih,atom ref_child,atom child)
	return c_func(xIupInsert,{ih,ref_child,child})
end function

public function IupGetChild(atom ih,atom pos)
	return c_func(xIupGetChild,{ih,pos})
end function

public function IupGetChildPos(atom ih,atom child)
	return c_func(xIupGetChildPos,{ih,child})
end function

public function IupGetChildCount(atom ih)
	return c_func(xIupGetChildCount,{ih})
end function

public function IupGetNextChild(atom ih,atom child)
	return c_func(xIupGetNextChild,{ih,child})
end function

public function IupGetBrother(atom ih)
	return c_func(xIupGetBrother,{ih})
end function

public function IupGetParent(atom ih)
	return c_func(xIupGetParent,{ih})
end function

public function IupGetDialog(atom ih)
	return c_func(xIupGetDialog,{ih})
end function

public function IupGetDialogChild(atom ih,sequence name)
	return c_func(xIupGetDialogChild,{ih,name})
end function

public function IupReparent(atom ih,atom new_parent,atom ref_child)
	return c_func(xIupReparent,{ih,new_parent,ref_child})
end function

public constant xIupPopup = define_c_func(iup,"+IupPopup",{C_POINTER,C_INT,C_INT},C_INT),
				xIupShow = define_c_func(iup,"+IupShow",{C_POINTER},C_INT),
				xIupShowXY = define_c_func(iup,"+IupShowXY",{C_POINTER,C_INT,C_INT},C_INT),
				xIupHide = define_c_func(iup,"+IupHide",{C_POINTER},C_INT),
				xIupMap = define_c_func(iup,"+IupMap",{C_POINTER},C_INT),
				xIupUnmap = define_c_proc(iup,"+IupUnmap",{C_POINTER})
				
public function IupPopup(atom ih,atom x,atom y)
	return c_func(xIupPopup,{ih,x,y})
end function

public function IupShow(atom ih)
	return c_func(xIupShow,{ih})
end function

public function IupShowXY(atom ih,atom x,atom y)
	return c_func(xIupShowXY,{ih,x,y})
end function

public function IupHide(atom ih)
	return c_func(xIupHide,{ih})
end function

public function IupMap(atom ih)
	return c_func(xIupMap,{ih})
end function

public procedure IupUnmap(atom ih)
	c_proc(xIupUnmap,{ih})
end procedure

public constant xIupResetAttribute = define_c_proc(iup,"+IupResetAttribute",{C_POINTER,C_STRING}),
				xIupGetAllAttributes = define_c_func(iup,"+IupGetAllAttributes",{C_POINTER,C_POINTER,C_INT},C_INT),
				xIupCopyAttributes = define_c_proc(iup,"+IupCopyAttributes",{C_POINTER,C_POINTER}),
				xIupSetAtt = define_c_func(iup,"+IupSetAtt",{C_STRING,C_POINTER,C_STRING},C_POINTER),
				xIupSetAttributes = define_c_func(iup,"+IupSetAttributes",{C_POINTER,C_STRING},C_POINTER),
				xIupGetAttributes = define_c_func(iup,"+IupGetAttributes",{C_POINTER},C_POINTER)
				
public procedure IupResetAttribute(atom ih,sequence name)
	c_proc(xIupResetAttribute,{ih,name})
end procedure

public function IupGetAllAttributes(atom ih,sequence names,atom n)
	return c_func(xIupGetAllAttributes,{ih,names,n})
end function

public procedure IupCopyAttributes(atom src_ih,atom dst_ih)
	c_proc(xIupCopyAttributes,{src_ih,dst_ih})
end procedure

public function IupSetAtt(sequence handle_name,atom ih,sequence name)
	return c_func(xIupSetAtt,{handle_name,ih,name})
end function

public function IupSetAttributes(atom ih,sequence str)
	return c_func(xIupSetAttributes,{ih,str})
end function

public function IupGetAttributes(atom ih)
	return c_func(xIupGetAttributes,{ih})
end function

public constant xIupSetAttribute = define_c_proc(iup,"+IupSetAttribute",{C_POINTER,C_STRING,C_STRING}),
				xIupSetStrAttribute = define_c_proc(iup,"+IupSetStrAttribute",{C_POINTER,C_STRING,C_STRING}),
				xIupSetStrf = define_c_proc(iup,"+IupSetStrf",{C_POINTER,C_STRING,C_STRING}),
				xIupSetInt = define_c_proc(iup,"+IupSetInt",{C_POINTER,C_STRING,C_INT}),
				xIupSetFloat = define_c_proc(iup,"+IupSetFloat",{C_POINTER,C_STRING,C_FLOAT}),
				xIupSetDouble = define_c_proc(iup,"+IupSetDouble",{C_POINTER,C_STRING,C_DOUBLE}),
				xIupSetRGB = define_c_proc(iup,"+IupSetRGB",{C_POINTER,C_STRING,C_UCHAR,C_UCHAR,C_UCHAR}),
				xIupSetRGBA = define_c_proc(iup,"+IupSetRGBA",{C_POINTER,C_STRING,C_UCHAR,C_UCHAR,C_UCHAR,C_UCHAR})
				
public procedure IupSetAttribute(atom ih,sequence name,sequence val)
	c_proc(xIupSetAttribute,{ih,name,val})
end procedure

public procedure IupSetStrAttribute(atom ih,sequence name,sequence val)
	c_proc(xIupSetStrAttribute,{ih,name,val})
end procedure

public procedure IupSetStrf(atom ih,sequence name,sequence format)
	c_proc(xIupSetStrf,{ih,name,format})
end procedure

public procedure IupSetInt(atom ih,sequence name,atom val)
	c_proc(xIupSetInt,{ih,name,val})
end procedure

public procedure IupSetFloat(atom ih,sequence name,atom val)
	c_proc(xIupSetFloat,{ih,name,val})
end procedure

public procedure IupSetDouble(atom ih,sequence name,atom val)
	c_proc(xIupSetDouble,{ih,name,val})
end procedure

public procedure IupSetRGB(atom ih,sequence name,atom r,atom g,atom b)
	c_proc(xIupSetRGB,{ih,name,r,g,b})
end procedure

public procedure IupSetRGBA(atom ih,sequence name,atom r,atom g,atom b,atom a)
	c_proc(xIupSetRGBA,{ih,name,r,g,b,a})
end procedure

public constant xIupGetAttribute = define_c_func(iup,"+IupGetAttribute",{C_POINTER,C_STRING},C_POINTER),
				xIupGetInt = define_c_func(iup,"+IupGetInt",{C_POINTER,C_STRING},C_INT),
				xIupGetInt2 = define_c_func(iup,"+IupGetInt2",{C_POINTER,C_STRING},C_INT),
				xIupGetIntInt = define_c_func(iup,"+IupGetIntInt",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_INT),
				xIupGetFloat = define_c_func(iup,"+IupGetFloat",{C_POINTER,C_STRING},C_FLOAT),
				xIupGetDouble = define_c_func(iup,"+IupGetDouble",{C_POINTER,C_STRING},C_DOUBLE),
				xIupGetRGB = define_c_proc(iup,"+IupGetRGB",{C_POINTER,C_STRING,C_POINTER,C_POINTER,C_POINTER}),
				xIupGetRGBA = define_c_proc(iup,"+IupGetRGBA",{C_POINTER,C_STRING,C_POINTER,C_POINTER,C_POINTER,C_POINTER})
				
public function IupGetAttribute(atom ih,sequence name)
	return c_func(xIupGetAttribute,{ih,name})
end function

public function IupGetInt(atom ih,sequence name)
	return c_func(xIupGetInt,{ih,name})
end function

public function IupGetInt2(atom ih,sequence name)
	return c_func(xIupGetInt2,{ih,name})
end function

public function IupGetIntInt(atom ih,sequence name,atom i,atom i2)
	return c_func(xIupGetIntInt,{ih,name,i,i2})
end function

public function IupGetFloat(atom ih,sequence name)
	return c_func(xIupGetFloat,{ih,name})
end function

public function IupGetDouble(atom ih,sequence name)
	return c_func(xIupGetDouble,{ih,name})
end function

public procedure IupGetRGB(atom ih,sequence name,atom r,atom g,atom b)
	c_proc(xIupGetRGB,{ih,name,r,g,b})
end procedure

public procedure IupGetRGBA(atom ih,sequence name,atom r,atom g,atom b,atom a)
	c_proc(xIupGetRGBA,{ih,name,r,g,b,a})
end procedure

public constant xIupSetAttributeId = define_c_proc(iup,"+IupSetAttributeId",{C_POINTER,C_STRING,C_INT,C_STRING}),
				xIupSetStrAttributeId = define_c_proc(iup,"+IupSetStrAttributeId",{C_POINTER,C_STRING,C_INT,C_STRING}),
				xIupSetStrfId = define_c_proc(iup,"+IupSetStrfId",{C_POINTER,C_STRING,C_INT,C_STRING}),
				xIupSetIntId = define_c_proc(iup,"+IupSetIntId",{C_POINTER,C_STRING,C_INT,C_INT}),
				xIupSetFloatId = define_c_proc(iup,"+IupSetFloatId",{C_POINTER,C_STRING,C_INT,C_FLOAT}),
				xIupSetDoubleId = define_c_proc(iup,"+IupSetDoubleId",{C_POINTER,C_STRING,C_INT,C_DOUBLE}),
				xIupSetRGBId = define_c_proc(iup,"+IupSetRGBId",{C_POINTER,C_STRING,C_INT,C_UCHAR,C_UCHAR,C_UCHAR})
				
public procedure IupSetAttributeId(atom ih,sequence name,atom id,sequence val)
	c_proc(xIupSetAttributeId,{ih,name,id,val})
end procedure

public procedure IupSetStrAttributeId(atom ih,sequence name,atom id,sequence val)
	c_proc(xIupSetStrAttributeId,{ih,name,id,val})
end procedure

public procedure IupSetStrfId(atom ih,sequence name,atom id,sequence format)
	c_proc(xIupSetStrfId,{ih,name,id,format})
end procedure

public procedure IupSetIntId(atom ih,sequence name,atom id,atom val)
	c_proc(xIupSetIntId,{ih,name,id,val})
end procedure

public procedure IupSetFloatId(atom ih,sequence name,atom id,atom val)
	c_proc(xIupSetFloatId,{ih,name,id,val})
end procedure

public procedure IupSetDoubleId(atom ih,sequence name,atom id,atom val)
	c_proc(xIupSetDoubleId,{ih,name,id,val})
end procedure

public procedure IupSetRGBId(atom ih,sequence name,atom id,atom r,atom g,atom b)
	c_proc(xIupSetRGBId,{ih,name,id,r,g,b})
end procedure

public constant xIupGetAttributeId = define_c_func(iup,"+IupGetAttributeId",{C_POINTER,C_STRING,C_INT},C_POINTER),
				xIupGetIntId = define_c_func(iup,"+IupGetIntId",{C_POINTER,C_STRING,C_INT},C_INT),
				xIupGetFloatId = define_c_func(iup,"+IupGetFloatId",{C_POINTER,C_STRING,C_INT},C_FLOAT),
				xIupGetDoubleId = define_c_func(iup,"+IupGetDoubleId",{C_POINTER,C_STRING,C_INT},C_DOUBLE),
				xIupGetRGBId = define_c_proc(iup,"+IupGetRGBId",{C_POINTER,C_STRING,C_INT,C_POINTER,C_POINTER,C_POINTER})
				
public function IupGetAttributeId(atom ih,sequence name,atom id)
	return c_func(xIupGetAttributeId,{ih,name,id})
end function

public function IupGetIntId(atom ih,sequence name,atom id)
	return c_func(xIupGetIntId,{ih,name,id})
end function

public function IupGetFloatId(atom ih,sequence name,atom id)
	return c_func(xIupGetFloatId,{ih,name,id})
end function

public function IupGetDoubleId(atom ih,sequence name,atom id)
	return c_func(xIupGetDoubleId,{ih,name,id})
end function

public procedure IupGetRGBId(atom ih,sequence name,atom id,atom r,atom g,atom b)
	c_proc(xIupGetRGBId,{ih,name,id,r,g,b})
end procedure

public constant xIupSetAttributeId2 = define_c_proc(iup,"+IupSetAttributeId2",{C_POINTER,C_STRING,C_INT,C_INT,C_STRING}),
				xIupSetStrAttributeId2 = define_c_proc(iup,"+IupSetStrAttributeId2",{C_POINTER,C_STRING,C_INT,C_INT,C_STRING}),
				xIupSetStrfId2 = define_c_proc(iup,"+IupSetStrfId2",{C_POINTER,C_STRING,C_INT,C_INT,C_STRING}),
				xIupSetIntId2 = define_c_proc(iup,"+IupSetIntId2",{C_POINTER,C_STRING,C_INT,C_INT,C_INT}),
				xIupSetFloatId2 = define_c_proc(iup,"+IupSetFloatId2",{C_POINTER,C_STRING,C_INT,C_INT,C_FLOAT}),
				xIupSetDoubleId2 = define_c_proc(iup,"+IupSetDoubleId2",{C_POINTER,C_STRING,C_INT,C_INT,C_DOUBLE}),
				xIupSetRGBId2 = define_c_proc(iup,"+IupSetRGBId2",{C_POINTER,C_STRING,C_INT,C_INT,C_UCHAR,C_UCHAR,C_UCHAR})
				
public procedure IupSetAttributeId2(atom ih,sequence name,atom lin,atom col,sequence val)
	c_proc(xIupSetAttributeId2,{ih,name,lin,col,val})
end procedure

public procedure IupSetStrAttributeId2(atom ih,sequence name,atom lin,atom col,sequence val)
	c_proc(xIupSetStrAttributeId2,{ih,name,lin,col,val})
end procedure

public procedure IupSetStrfId2(atom ih,sequence name,atom lin,atom col,sequence format)
	c_proc(xIupSetStrfId2,{ih,name,lin,col,format})
end procedure

public procedure IupSetIntId2(atom ih,sequence name,atom lin,atom col,atom val)
	c_proc(xIupSetIntId2,{ih,name,lin,col,val})
end procedure

public procedure IupSetFloatId2(atom ih,sequence name,atom lin,atom col,atom val)
	c_proc(xIupSetFloatId2,{ih,name,lin,col,val})
end procedure

public procedure IupSetDoubleId2(atom ih,sequence name,atom lin,atom col,atom val)
	c_proc(xIupSetDoubleId2,{ih,name,lin,col,val})
end procedure

public procedure IupSetRGBId2(atom ih,sequence name,atom lin,atom col,atom r,atom g,atom b)
	c_proc(xIupSetRGBId2,{ih,name,lin,col,r,g,b})
end procedure

public constant xIupGetAttributeId2 = define_c_func(iup,"+IupGetAttributeId2",{C_POINTER,C_STRING,C_INT,C_INT},C_POINTER),
				xIupGetIntId2 = define_c_func(iup,"+IupGetIntId2",{C_POINTER,C_STRING,C_INT,C_INT},C_INT),
				xIupGetFloatId2 = define_c_func(iup,"+IupGetFloatId2",{C_POINTER,C_STRING,C_INT,C_INT},C_FLOAT),
				xIupGetDoubleId2 = define_c_func(iup,"+IupGetDoubleId2",{C_POINTER,C_STRING,C_INT,C_INT},C_DOUBLE),
				xIupGetRGBId2 = define_c_proc(iup,"+IupGetRGBId2",{C_POINTER,C_STRING,C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER})
				
public function IupGetAttributeId2(atom ih,sequence name,atom lin,atom col)
	return c_func(xIupGetAttributeId2,{ih,name,lin,col})
end function

public function IupGetIntId2(atom ih,sequence name,atom lin,atom col)
	return c_func(xIupGetIntId2,{ih,name,lin,col})
end function

public function IupGetFloatId2(atom ih,sequence name,atom lin,atom col)
	return c_func(xIupGetFloatId2,{ih,name,lin,col})
end function

public function IupGetDoubleId2(atom ih,sequence name,atom lin,atom col)
	return c_func(xIupGetDoubleId2,{ih,name,lin,col})
end function

public procedure IupGetRGBId2(atom ih,sequence name,atom lin,atom col,atom r,atom g,atom b)
	c_proc(xIupGetRGBId2,{ih,name,lin,col,r,g,b})
end procedure

public constant xIupSetGlobal = define_c_proc(iup,"+IupSetGlobal",{C_STRING,C_STRING}),
				xIupSetStrGlobal = define_c_proc(iup,"+IupSetStrGlobal",{C_STRING,C_STRING}),
				xIupGetGlobal = define_c_func(iup,"+IupGetGlobal",{C_STRING},C_POINTER)
				
public procedure IupSetGlobal(sequence name,sequence val)
	c_proc(xIupSetGlobal,{name,val})
end procedure

public procedure IupSetStrGlobal(sequence name,sequence val)
	c_proc(xIupSetStrGlobal,{name,val})
end procedure

public function IupGetGlobal(sequence name)
	return c_func(xIupGetGlobal,{name})
end function

public constant xIupSetFocus = define_c_func(iup,"+IupSetFocus",{C_POINTER},C_POINTER),
				xIupGetFocus = define_c_func(iup,"+IupGetFocus",{},C_POINTER),
				xIupPreviousField = define_c_func(iup,"+IupPreviousField",{C_POINTER},C_POINTER),
				xIupNextField = define_c_func(iup,"+IupNextField",{C_POINTER},C_POINTER)
				
public function IupSetFocus(atom ih)
	return c_func(xIupSetFocus,{ih})
end function

public function IupGetFocus()
	return c_func(xIupGetFocus,{})
end function

public function IupPreviousField(atom ih)
	return c_func(xIupPreviousField,{ih})
end function

public function IupNextField(atom ih)
	return c_func(xIupNextField,{ih})
end function

public constant xIupGetCallback = define_c_func(iup,"+IupGetCallback",{C_POINTER,C_STRING},C_POINTER),
				xIupSetCallback = define_c_func(iup,"+IupSetCallback",{C_POINTER,C_STRING,C_POINTER},C_POINTER),
				xIupSetCallbacks = define_c_func(iup,"+IupSetCallbacks",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_POINTER)
				
public function IupGetCallback(atom ih,sequence name)
	return c_func(xIupGetCallback,{ih,name})
end function

public function IupSetCallback(atom ih,sequence name,object func)
	return c_func(xIupSetCallback,{ih,name,func})
end function

public function IupSetCallbacks(atom ih,sequence name,atom func,atom x)
	return c_func(xIupSetCallbacks,{ih,name,func,x})
end function

public constant xIupGetFunction = define_c_func(iup,"+IupGetFunction",{C_STRING},C_POINTER),
				xIupSetFunction = define_c_func(iup,"+IupSetFunction",{C_STRING,C_POINTER},C_POINTER)
				
public function IupGetFunction(sequence name)
	return c_func(xIupGetFunction,{name})
end function

public function IupSetFunction(sequence name,atom func)
	return c_func(xIupSetFunction,{name,func})
end function

public constant xIupGetHandle = define_c_func(iup,"+IupGetHandle",{C_STRING},C_POINTER),
				xIupSetHandle = define_c_func(iup,"+IupSetHandle",{C_STRING,C_POINTER},C_POINTER),
				xIupGetAllNames = define_c_func(iup,"+IupGetAllNames",{C_POINTER,C_INT},C_INT),
				xIupGetAllDialogs = define_c_func(iup,"+IupGetAllDialogs",{C_POINTER,C_INT},C_INT),
				xIupGetName = define_c_func(iup,"+IupGetName",{C_POINTER},C_POINTER)
				
public function IupGetHandle(sequence name)
	return c_func(xIupGetHandle,{name})
end function

public function IupSetHandle(sequence name,atom ih)
	return c_func(xIupSetHandle,{name,ih})
end function

public function IupGetAllNames(sequence names,atom n)
	return c_func(xIupGetAllNames,{names,n})
end function

public function IupGetAllDialogs(sequence names,atom n)
	return c_func(xIupGetAllDialogs,{names,n})
end function

public function IupGetName(atom ih)
	return c_func(xIupGetName,{ih})
end function

public constant xIupSetAttributeHandle = define_c_proc(iup,"+IupSetAttributeHandle",{C_POINTER,C_STRING,C_POINTER}),
				xIupGetAttributeHandle = define_c_func(iup,"+IupGetAttributeHandle",{C_POINTER,C_STRING},C_POINTER),
				xIupSetAttributeHandleId = define_c_proc(iup,"+IupSetAttributeHandleId",{C_POINTER,C_STRING,C_INT,C_POINTER}),
				xIupGetAttributeHandleId = define_c_func(iup,"+IupGetAttributeHandleId",{C_POINTER,C_STRING,C_INT},C_POINTER),
				xIupSetAttributeHandleId2 = define_c_proc(iup,"+IupSetAttributeHandleId2",{C_POINTER,C_STRING,C_INT,C_INT,C_POINTER}),
				xIupGetAttributeHandleId2 = define_c_func(iup,"+IupGetAttributeHandleId2",{C_POINTER,C_STRING,C_INT,C_INT},C_POINTER)
				
public procedure IupSetAttributeHandle(atom ih,sequence name,atom ih_named)
	c_proc(xIupSetAttributeHandle,{ih,name,ih_named})
end procedure

public function IupGetAttributeHandle(atom ih,sequence name)
	return c_func(xIupGetAttributeHandle,{ih,name})
end function

public procedure IupSetAttributeHandleId(atom ih,sequence name,atom id,atom ih_named)
	c_proc(xIupSetAttributeHandleId,{ih,name,id,ih_named})
end procedure

public function IupGetAttributeHandleId(atom ih,sequence name,atom id)
	return c_func(xIupGetAttributeHandleId,{ih,name,id})
end function

public procedure IupSetAttributeHandleId2(atom ih,sequence name,atom lin,atom col,atom ih_named)
	c_proc(xIupSetAttributeHandleId2,{ih,name,lin,col,ih_named})
end procedure

public function IupGetAttributeHandleId2(atom ih,sequence name,atom lin,atom col)
	return c_func(xIupGetAttributeHandleId2,{ih,name,lin,col})
end function

public constant xIupGetClassName = define_c_func(iup,"+IupGetClassName",{C_POINTER},C_POINTER),
				xIupGetClassType = define_c_func(iup,"+IupGetClassType",{C_POINTER},C_POINTER),
				xIupGetAllClasses = define_c_func(iup,"+IupGetAllClasses",{C_POINTER,C_INT},C_INT),
				xIupGetClassAttributes = define_c_func(iup,"+IupGetClassAttributes",{C_STRING,C_POINTER,C_INT},C_INT),
				xIupGetClassCallbacks = define_c_func(iup,"+IupGetClassCallbacks",{C_STRING,C_POINTER,C_INT},C_INT),
				xIupSaveClassAttributes = define_c_proc(iup,"+IupSaveClassAttributes",{C_POINTER}),
				xIupCopyClassAttributes = define_c_proc(iup,"+IupCopyClassAttributes",{C_POINTER,C_POINTER}),
				xIupSetClassDefaultAttribute = define_c_proc(iup,"+IupSetClassDefaultAttribute",{C_STRING,C_STRING,C_STRING}),
				xIupClassMatch = define_c_func(iup,"+IupClassMatch",{C_POINTER,C_STRING},C_INT)
				
public function IupGetClassName(atom ih)
	return c_func(xIupGetClassName,{ih})
end function

public function IupGetClassType(atom ih)
	return c_func(xIupGetClassType,{ih})
end function

public function IupGetAllClasses(sequence names,atom n)
	return c_func(xIupGetAllClasses,{names,n})
end function

public function IupGetClassAttributes(sequence name,sequence names,atom n)
	return c_func(xIupGetClassAttributes,{name,names,n})
end function

public function IupGetClassCallbacks(sequence name,sequence names,atom n)
	return c_func(xIupGetClassCallbacks,{name,names,n})
end function

public procedure IupSaveClassAttributes(atom ih)
	c_proc(xIupSaveClassAttributes,{ih})
end procedure

public procedure IupCopyClassAttributes(atom src,atom dst)
	c_proc(xIupCopyClassAttributes,{src,dst})
end procedure

public procedure IupSetClassDefaultAttribute(sequence name,sequence n,sequence val)
	c_proc(xIupSetClassDefaultAttribute,{name,n,val})
end procedure

public function IupClassMatch(atom ih,sequence name)
	return c_func(xIupClassMatch,{ih,name})
end function

public constant xIupCreate = define_c_func(iup,"+IupCreate",{C_STRING},C_POINTER),
				xIupCreatev = define_c_func(iup,"+IupCreatev",{C_STRING,C_POINTER},C_POINTER),
				xIupCreatep = define_c_func(iup,"+IupCreatep",{C_STRING,C_POINTER},C_POINTER)
				
public function IupCreate(sequence name)
	return c_func(xIupCreate,{name})
end function

public function IupCreatev(sequence name,atom parms)
	return c_func(xIupCreatev,{name,parms})
end function

public function IupCreatep(sequence name,atom first)
	return c_func(xIupCreatep,{name,first})
end function

--Elements

public constant xIupFill = define_c_func(iup,"+IupFill",{},C_POINTER),
				xIupSpace = define_c_func(iup,"+IupSpace",{},C_POINTER)
				
public function IupFill()
	return c_func(xIupFill,{})
end function

public function IupSpace()
	return c_func(xIupSpace,{})
end function

public constant xIupRadio = define_c_func(iup,"+IupRadio",{C_POINTER},C_POINTER),
				xIupVbox = define_c_func(iup,"+IupVbox",{C_POINTER,C_POINTER},C_POINTER),
				xIupVboxv = define_c_func(iup,"+IupVboxv",{C_POINTER},C_POINTER),
				xIupZbox = define_c_func(iup,"+IupZbox",{C_POINTER},C_POINTER),
				xIupZboxv = define_c_func(iup,"+IupZboxv",{C_POINTER},C_POINTER),
				xIupHbox = define_c_func(iup,"+IupHbox",{C_POINTER},C_POINTER),
				xIupHboxv = define_c_func(iup,"+IupHboxv",{C_POINTER},C_POINTER)
				
public function IupRadio(atom child)
	return c_func(xIupRadio,{child})
end function

public function IupVbox(atom child,atom x)
	return c_func(xIupVbox,{child,x})
end function

public function IupVboxv(atom children)
	return c_func(xIupVboxv,{children})
end function

public function IupZbox(atom child)
	return c_func(xIupZbox,{child})
end function

public function IupZboxv(atom children)
	return c_func(xIupZboxv,{children})
end function

public function IupHbox(atom child)
	return c_func(xIupHbox,{child})
end function

public function IupHboxv(atom children)
	return c_func(xIupHboxv,{children})
end function

public constant xIupNormalizer = define_c_func(iup,"+IupNormalizer",{C_POINTER},C_POINTER),
				xIupNormalizerv = define_c_func(iup,"+IupNormalizerv",{C_POINTER},C_POINTER)
				
public function IupNormalizer(atom ih)
	return c_func(xIupNormalizer,{ih})
end function

public function IupNormalizerv(atom ih)
	return c_func(xIupNormalizerv,{ih})
end function

public constant xIupCbox = define_c_func(iup,"+IupCbox",{C_POINTER},C_POINTER),
				xIupCboxv = define_c_func(iup,"+IupCboxv",{C_POINTER},C_POINTER),
				xIupSbox = define_c_func(iup,"+IupSbox",{C_POINTER},C_POINTER),
				xIupSplit = define_c_func(iup,"+IupSplit",{C_POINTER,C_POINTER},C_POINTER),
				xIupScrollBox = define_c_func(iup,"+IupScrollBox",{C_POINTER},C_POINTER),
				xIupFlatScrollBox = define_c_func(iup,"+IupFlatScrollBox",{C_POINTER},C_POINTER),
				xIupGridBox = define_c_func(iup,"+IupGridBox",{C_POINTER},C_POINTER),
				xIupGridBoxv = define_c_func(iup,"+IupGridBoxv",{C_POINTER},C_POINTER),
				xIupMultiBox = define_c_func(iup,"+IupMultiBox",{C_POINTER},C_POINTER),
				xIupMultiBoxv = define_c_func(iup,"+IupMultiBoxv",{C_POINTER},C_POINTER),
				xIupExpander = define_c_func(iup,"+IupExpander",{C_POINTER},C_POINTER),
				xIupDetachBox = define_c_func(iup,"+IupDetachBox",{C_POINTER},C_POINTER),
				xIupBackgroundBox = define_c_func(iup,"+IupBackgroundBox",{C_POINTER},C_POINTER)
				
public function IupCbox(atom child)
	return c_func(xIupCbox,{child})
end function

public function IupCboxv(atom children)
	return c_func(xIupCboxv,{children})
end function

public function IupSbox(atom child)
	return c_func(xIupSbox,{child})
end function

public function IupSplit(atom child,atom child2)
	return c_func(xIupSplit,{child,child2})
end function

public function IupScrollBox(atom child)
	return c_func(xIupScrollBox,{child})
end function

public function IupFlatScrollBox(atom child)
	return c_func(xIupFlatScrollBox,{child})
end function

public function IupGridBox(atom child)
	return c_func(xIupGridBox,{child})
end function

public function IupMultiBox(atom child)
	return c_func(xIupMultiBox,{child})
end function

public function IupMultiBoxv(atom children)
	return c_func(xIupMultiBoxv,{children})
end function

public function IupExpander(atom child)
	return c_func(xIupExpander,{child})
end function

public function IupDetachBox(atom child)
	return c_func(xIupDetachBox,{child})
end function

public function IupBackgroundBox(atom child)
	return c_func(xIupBackgroundBox,{child})
end function

public constant xIupFrame = define_c_func(iup,"+IupFrame",{C_POINTER},C_POINTER),
				xIupFlatFrame = define_c_func(iup,"+IupFlatFrame",{C_POINTER},C_POINTER)
				
public function IupFrame(atom child)
	return c_func(xIupFrame,{child})
end function

public function IupFlatFrame(atom child)
	return c_func(xIupFlatFrame,{child})
end function

public constant xIupImage = define_c_func(iup,"+IupImage",{C_INT,C_INT,C_POINTER},C_POINTER),
				xIupImageRGB = define_c_func(iup,"+IupImageRGB",{C_INT,C_INT,C_POINTER},C_POINTER),
				xIupImageRGBA = define_c_func(iup,"+IupImageRGBA",{C_INT,C_INT,C_POINTER},C_POINTER)
				
public function IupImage(atom w,atom h,atom pixels)
	return c_func(xIupImage,{w,h,pixels})
end function

public function IupImageRGB(atom w,atom h,atom pixels)
	return c_func(xIupImageRGB,{w,h,pixels})
end function

public function IupImageRGBA(atom w,atom h,atom pixels)
	return c_func(xIupImageRGBA,{w,h,pixels})
end function

public constant xIupItem = define_c_func(iup,"+IupItem",{C_STRING,C_STRING},C_POINTER),
				xIupSubmenu = define_c_func(iup,"+IupSubmenu",{C_STRING,C_POINTER},C_POINTER),
				xIupSeparator = define_c_func(iup,"+IupSeparator",{},C_POINTER),
				xIupMenu = define_c_func(iup,"+IupMenu",{C_POINTER},C_POINTER),
				xIupMenuv = define_c_func(iup,"+IupMenuv",{C_POINTER},C_POINTER)
				
public function IupItem(sequence title,sequence action)
	return c_func(xIupItem,{title,action})
end function

public function IupSubmenu(sequence title,atom child)
	return c_func(xIupSubmenu,{title,child})
end function

public function IupSeparator()
	return c_func(xIupSeparator,{})
end function

public function IupMenu(atom child)
	return c_func(xIupMenu,{child})
end function

public function IupMenuv(atom children)
	return c_func(xIupMenuv,{children})
end function

public constant xIupButton = define_c_func(iup,"+IupButton",{C_STRING,C_STRING},C_POINTER),
				xIupFlatButton = define_c_func(iup,"+IupFlatButton",{C_STRING},C_POINTER),
				xIupFlatToggle = define_c_func(iup,"+IupFlatToggle",{C_STRING},C_POINTER),
				xIupDropButton = define_c_func(iup,"+IupDropButton",{C_POINTER},C_POINTER),
				xIupFlatLabel = define_c_func(iup,"+IupFlatLabel",{C_STRING},C_POINTER),
				xIupFlatSeparator = define_c_func(iup,"+IupFlatSeparator",{},C_POINTER),
				xIupCanvas = define_c_func(iup,"+IupCanvas",{C_STRING},C_POINTER),
				xIupDialog = define_c_func(iup,"+IupDialog",{C_POINTER},C_POINTER),
				xIupUser = define_c_func(iup,"+IupUser",{},C_POINTER),
				xIupThread = define_c_func(iup,"+IupThread",{},C_POINTER),
				xIupLabel = define_c_func(iup,"+IupLabel",{C_STRING},C_POINTER),
				xIupList = define_c_func(iup,"+IupList",{C_STRING},C_POINTER),
				xIupFlatList = define_c_func(iup,"+IupFlatList",{},C_POINTER),
				xIupText = define_c_func(iup,"+IupText",{C_STRING},C_POINTER),
				xIupMultiLine = define_c_func(iup,"+IupMultiLine",{C_STRING},C_POINTER),
				xIupToggle = define_c_func(iup,"+IupToggle",{C_STRING,C_STRING},C_POINTER),
				xIupTimer = define_c_func(iup,"+IupTimer",{},C_POINTER),
				xIupClipboard = define_c_func(iup,"+IupClipboard",{},C_POINTER),
				xIupProgressBar = define_c_func(iup,"+IupProgressBar",{},C_POINTER),
				xIupVal = define_c_func(iup,"+IupVal",{C_STRING},C_POINTER),
				xIupFlatVal = define_c_func(iup,"+IupFlatVal",{C_STRING},C_POINTER),
				xIupFlatTree = define_c_func(iup,"+IupFlatTree",{},C_POINTER),
				xIupTabs = define_c_func(iup,"+IupTabs",{C_POINTER},C_POINTER),
				xIupTabsv = define_c_func(iup,"+IupTabsv",{C_POINTER},C_POINTER),
				xIupFlatTabs = define_c_func(iup,"+IupFlatTabs",{C_POINTER},C_POINTER),
				xIupFlatTabsv = define_c_func(iup,"+IupFlatTabsv",{C_POINTER},C_POINTER),
				xIupTree = define_c_func(iup,"+IupTree",{},C_POINTER),
				xIupLink = define_c_func(iup,"+IupLink",{C_STRING,C_STRING},C_POINTER),
				xIupAnimatedLabel = define_c_func(iup,"+IupAnimatedLabel",{C_POINTER},C_POINTER),
				xIupDatePick = define_c_func(iup,"+IupDatePick",{},C_POINTER),
				xIupCalendar = define_c_func(iup,"+IupCalendar",{},C_POINTER),
				xIupColorbar = define_c_func(iup,"+IupColorbar",{},C_POINTER),
				xIupGauge = define_c_func(iup,"+IupGauge",{},C_POINTER),
				xIupDial = define_c_func(iup,"+IupDial",{C_STRING},C_POINTER),
				xIupColorBrowser = define_c_func(iup,"+IupColorBrowser",{},C_POINTER)
				
public function IupButton(sequence title,sequence action)
	return c_func(xIupButton,{title,action})
end function

public function IupFlatButton(sequence title)
	return c_func(xIupFlatButton,{title})
end function

public function IupFlatToggle(sequence title)
	return c_func(xIupFlatToggle,{title})
end function

public function IupDropButton(atom child)
	return c_func(xIupDropButton,{child})
end function

public function IupFlatLabel(sequence title)
	return c_func(xIupFlatLabel,{title})
end function

public function IupFlatSeparator()
	return c_func(xIupFlatSeparator,{})
end function

public function IupCanvas(sequence action)
	return c_func(xIupCanvas,{action})
end function

public function IupDialog(atom child)
	return c_func(xIupDialog,{child})
end function

public function IupUser()
	return c_func(xIupUser,{})
end function

public function IupThread()
	return c_func(xIupThread,{})
end function

public function IupLabel(sequence title)
	return c_func(xIupLabel,{title})
end function

public function IupList(sequence action)
	return c_func(xIupList,{action})
end function

public function IupFlatList()
	return c_func(xIupFlatList,{})
end function

public function IupText(sequence action)
	return c_func(xIupText,{action})
end function

public function IupMultiLine(sequence action)
	return c_func(xIupMultiLine,{action})
end function

public function IupToggle(sequence title,sequence action)
	return c_func(xIupToggle,{title,action})
end function

public function IupTimer()
	return c_func(xIupTimer,{})
end function

public function IupClipboard()
	return c_func(xIupClipboard,{})
end function

public function IupProgressBar()
	return c_func(xIupProgressBar,{})
end function

public function IupVal(sequence xtype)
	return c_func(xIupVal,{xtype})
end function

public function IupFlatVal(sequence xtype)
	return c_func(xIupFlatVal,{xtype})
end function

public function IupFlatTree()
	return c_func(xIupFlatTree,{})
end function

public function IupTabs(atom child)
	return c_func(xIupTabs,{child})
end function

public function IupTabsv(atom children)
	return c_func(xIupTabsv,{children})
end function

public function IupFlatTabs(atom first)
	return c_func(xIupFlatTabs,{first})
end function

public function IupFlatTabsv(atom children)
	return c_func(xIupFlatTabsv,{children})
end function

public function IupTree()
	return c_func(xIupTree,{})
end function

public function IupLink(sequence url,sequence title)
	return c_func(xIupLink,{url,title})
end function

public function IupAnimatedLabel(atom animation)
	return c_func(xIupAnimatedLabel,{animation})
end function

public function IupDatePick()
	return c_func(xIupDatePick,{})
end function

public function IupCalendar()
	return c_func(xIupCalendar,{})
end function

public function IupColorbar()
	return c_func(xIupColorbar,{})
end function

public function IupGauge()
	return c_func(xIupGauge,{})
end function

public function IupDial(sequence xtype)
	return c_func(xIupDial,{xtype})
end function

public function IupColorBrowser()
	return c_func(xIupColorBrowser,{})
end function

public constant xIupSpin = define_c_func(iup,"+IupSpin",{},C_POINTER),
				xIupSpinbox = define_c_func(iup,"+IupSpinbox",{C_POINTER},C_POINTER)
				
public function IupSpin()
	return c_func(xIupSpin,{})
end function

public function IupSpinbox(atom child)
	return c_func(xIupSpinbox,{child})
end function

--Utilities

public constant xIupStringCompare = define_c_func(iup,"+IupStringCompare",{C_STRING,C_STRING,C_INT,C_INT},C_INT)

public function IupStringCompare(sequence str,sequence str2,atom caseSen,atom lexi)
	return c_func(xIupStringCompare,{str,str2,caseSen,lexi})
end function

public constant xIupSaveImageAsText = define_c_func(iup,"+IupSaveImageAsText",{C_POINTER,C_STRING,C_STRING,C_STRING},C_INT),
				xIupImageGetHandle = define_c_func(iup,"+IupImageGetHandle",{C_STRING},C_POINTER)
				
public function IupSaveImageAsText(atom ih,sequence fname,sequence format,sequence name)
	return c_func(xIupSaveImageAsText,{ih,fname,format,name})
end function

public function IupImageGetHandle(sequence name)
	return c_func(xIupImageGetHandle,{name})
end function

public constant xIupTextConvertLinColToPos = define_c_proc(iup,"+IupTextConvertLinColToPos",{C_POINTER,C_INT,C_INT,C_POINTER}),
				xIupTextConvertPosToLinCol = define_c_proc(iup,"+IupTextConvertPosToLinCol",{C_POINTER,C_INT,C_POINTER,C_POINTER})
				
public procedure IupTextConvertLinColToPos(atom ih,atom lin,atom col,atom pos)
	c_proc(xIupTextConvertLinColToPos,{ih,lin,col,pos})
end procedure

public procedure IupTextConvertPosToLinCol(atom ih,atom pos,atom lin,atom col)
	c_proc(xIupTextConvertPosToLinCol,{ih,pos,lin,col})
end procedure

public constant xIupConvertXYToPos = define_c_func(iup,"+IupConvertXYToPos",{C_POINTER,C_INT,C_INT},C_INT)

public function IupConvertXYToPos(atom ih,atom x,atom y)
	return c_func(xIupConvertXYToPos,{ih,x,y})
end function

public constant xIupStoreGlobal = define_c_proc(iup,"+IupStoreGlobal",{C_STRING,C_STRING}),
				xIupStoreAttribute = define_c_proc(iup,"+IupStoreAttribute",{C_POINTER,C_STRING,C_STRING}),
				xIupSetfAttribute = define_c_proc(iup,"+IupSetfAttribute",{C_POINTER,C_STRING,C_STRING}),
				xIupStoreAttributeId = define_c_proc(iup,"+IupStoreAttributeId",{C_POINTER,C_STRING,C_INT,C_STRING}),
				xIupSetfAttributeId = define_c_proc(iup,"+IupSetfAttributeId",{C_POINTER,C_STRING,C_INT,C_STRING}),
				xIupStoreAttributeId2 = define_c_proc(iup,"+IupStoreAttributeId2",{C_POINTER,C_STRING,C_INT,C_INT,C_STRING}),
				xIupSetfAttributeId2 = define_c_proc(iup,"+IupSetfAttributeId2",{C_POINTER,C_STRING,C_INT,C_INT,C_STRING})
				
public procedure IupStoreGlobal(sequence name,sequence val)
	c_proc(xIupStoreGlobal,{name,val})
end procedure

public procedure IupStoreAttribute(atom ih,sequence name,sequence val)
	c_proc(xIupStoreAttribute,{ih,name,val})
end procedure

public procedure IupSetfAttribute(atom ih,sequence name,sequence format)
	c_proc(xIupSetfAttribute,{ih,name,format})
end procedure

public procedure IupStoreAttributeId(atom ih,sequence name,atom id,sequence val)
	c_proc(xIupStoreAttributeId,{ih,name,id,val})
end procedure

public procedure IupSetfAttributeId(atom ih,sequence name,atom id,sequence f)
	c_proc(xIupSetfAttributeId,{ih,name,id,f})
end procedure

public procedure IupStoreAttributeId2(atom ih,sequence name,atom lin,atom col,sequence val)
	c_proc(xIupStoreAttributeId2,{ih,name,lin,col,val})
end procedure

public procedure IupSetfAttributeId2(atom ih,sequence name,atom lin,atom col,sequence format)
	c_proc(xIupSetfAttributeId2,{ih,name,lin,col,format})
end procedure

public constant xIupTreeSetUserId = define_c_func(iup,"+IupTreeSetUserId",{C_POINTER,C_INT,C_POINTER},C_INT),
				xIupTreeGetUserId = define_c_func(iup,"+IupTreeGetUserId",{C_POINTER,C_INT},C_POINTER),
				xIupTreeGetId = define_c_func(iup,"+IupTreeGetId",{C_POINTER,C_POINTER},C_INT),
				xIupTreeSetAttributeHandle = define_c_proc(iup,"+IupTreeSetAttributeHandle",{C_POINTER,C_STRING,C_INT,C_POINTER})
				
public function IupTreeSetUserId(atom ih,atom id,atom user)
	return c_func(xIupTreeSetUserId,{ih,id,user})
end function

public function IupTreeGetUserId(atom ih,atom id)
	return c_func(xIupTreeGetUserId,{ih,id})
end function

public function IupTreeGetId(atom ih,atom id)
	return c_func(xIupTreeGetId,{ih,id})
end function

public procedure IupTreeSetAttributeHandle(atom ih,sequence name,atom id,atom ih_named)
	c_proc(xIupTreeSetAttributeHandle,{ih,name,id,ih_named})
end procedure

--Pre-defined dialogs

public constant xIupFileDlg = define_c_func(iup,"+IupFileDlg",{},C_POINTER),
				xIupMessageDlg = define_c_func(iup,"+IupMessageDlg",{},C_POINTER),
				xIupColorDlg = define_c_func(iup,"+IupColorDlg",{},C_POINTER),
				xIupFontDlg = define_c_func(iup,"+IupFontDlg",{},C_POINTER),
				xIupProgressDlg = define_c_func(iup,"+IupProgressDlg",{},C_POINTER)
				
public function IupFileDlg()
	return c_func(xIupFileDlg,{})
end function

public function IupMessageDlg()
	return c_func(xIupMessageDlg,{})
end function

public function IupColorDlg()
	return c_func(xIupColorDlg,{})
end function

public function IupFontDlg()
	return c_func(xIupFontDlg,{})
end function

public function IupProgressDlg()
	return c_func(xIupProgressDlg,{})
end function

public constant xIupGetFile = define_c_func(iup,"+IupGetFile",{C_POINTER},C_INT),
				xIupMessage = define_c_proc(iup,"+IupMessage",{C_STRING,C_STRING}),
				xIupMessagef = define_c_proc(iup,"+IupMessagef",{C_STRING,C_STRING}),
				xIupMessageError = define_c_proc(iup,"+IupMessageError",{C_POINTER,C_STRING}),
				xIupMessageAlarm = define_c_func(iup,"+IupMessageAlarm",{C_POINTER,C_STRING,C_STRING,C_STRING},C_INT),
				xIupAlarm = define_c_func(iup,"+IupAlarm",{C_STRING,C_STRING,C_STRING,C_STRING,C_STRING},C_INT),
				xIupScanf = define_c_func(iup,"+IupScanf",{C_STRING},C_INT),
				xIupListDialog = define_c_func(iup,"+IupListDialog",{C_INT,C_STRING,C_INT,C_STRING,C_INT,C_INT,C_INT,C_POINTER},C_INT),
				xIupGetText = define_c_func(iup,"+IupGetText",{C_STRING,C_POINTER,C_INT},C_INT),
				xIupGetColor = define_c_func(iup,"+IupGetColor",{C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER},C_INT),
				xIupGetParam = define_c_func(iup,"+IupGetParam",{C_STRING,C_POINTER,C_POINTER,C_STRING},C_INT),
				xIupGetParamv = define_c_func(iup,"+IupGetParamv",{C_STRING,C_POINTER,C_POINTER,C_STRING,C_INT,C_INT,C_POINTER},C_INT),
				xIupParam = define_c_func(iup,"+IupParam",{C_STRING},C_POINTER),
				xIupParamBox = define_c_func(iup,"+IupParamBox",{C_POINTER},C_POINTER),
				xIupParamBoxv = define_c_func(iup,"+IupParamBoxv",{C_POINTER},C_POINTER)
				
public function IupGetFile(sequence arg)
	return c_func(xIupGetFile,{arg})
end function

public procedure IupMessage(sequence title,sequence msg)
	c_proc(xIupMessage,{title,msg})
end procedure

public procedure IupMessagef(sequence title,sequence format)
	c_proc(xIupMessagef,{title,format})
end procedure

public procedure IupMessageError(atom parent,sequence msg)
	c_proc(xIupMessageError,{parent,msg})
end procedure

public function IupMessageAlarm(atom parent,sequence title,sequence msg,sequence btn)
	return c_func(xIupMessageAlarm,{parent,title,msg,btn})
end function

public function IupAlarm(sequence title,sequence msg,sequence b,sequence b2,sequence b3)
	return c_func(xIupAlarm,{title,msg,b,b2,b3})
end function

public function IupScanf(sequence format)
	return c_func(xIupScanf,{format})
end function

public function IupListDialog(atom xtype,sequence title,atom size,sequence list,atom op,atom col,atom lin,atom marks)
	return c_func(xIupListDialog,{xtype,title,size,list,op,col,lin,marks})
end function

public function IupGetText(sequence title,sequence text,atom size)
	return c_func(xIupGetText,{title,text,size})
end function

public function IupGetColor(atom x,atom y,atom r,atom g,atom b)
	return c_func(xIupGetColor,{x,y,r,g,b})
end function

public function IupGetParam(sequence title,atom action,atom ud,sequence format)
	return c_func(xIupGetParam,{title,action,ud,format})
end function

public function IupGetParamv(sequence title,atom action,atom ud,sequence format,atom count,atom extra,atom data)
	return c_func(xIupGetParamv,{title,action,ud,format,count,extra,data})
end function

public function IupParam(sequence format)
	return c_func(xIupParam,{format})
end function

public function IupParamBox(atom param)
	return c_func(xIupParamBox,{param})
end function

public function IupParamBoxv(atom parm)
	return c_func(xIupParamBoxv,{parm})
end function

public constant xIupLayoutDialog = define_c_func(iup,"+IupLayoutDialog",{C_POINTER},C_POINTER),
				xIupElementPropertiesDialog = define_c_func(iup,"+IupElementPropertiesDialog",{C_POINTER,C_POINTER},C_POINTER),
				xIupGlobalsDialog = define_c_func(iup,"+IupGlobalsDialog",{},C_POINTER),
				xIupClassInfoDialog = define_c_func(iup,"+IupClassInfoDialog",{C_POINTER},C_POINTER)
				
public function IupLayoutDialog(atom dialog)
	return c_func(xIupLayoutDialog,{dialog})
end function

public function IupElementPropertiesDialog(atom parent,atom elm)
	return c_func(xIupElementPropertiesDialog,{parent,elm})
end function

public function IupGlobalsDialog()
	return c_func(xIupGlobalsDialog,{})
end function

public function IupClassInfoDialog(atom parent)
	return c_func(xIupClassInfoDialog,{parent})
end function

--Flags
public constant IUP_ERROR = 1,
				IUP_NOERROR = 0,
				IUP_OPENED = -1,
				IUP_INVALID = -1,
				IUP_INVALID_ID = -10
				
public constant IUP_IGNORE = -1,
				IUP_DEFAULT = -2,
				IUP_CLOSE = -3,
				IUP_CONTINUE = -4
				
public constant IUP_CENTER = 65535,
				IUP_LEFT = 65534,
				IUP_RIGHT = 65533,
				IUP_MOUSEPOS = 65532,
				IUP_CURRENT = 65531,
				IUP_CENTERPARENT = 65530,
				IUP_LEFTPARENT = 65529,
				IUP_RIGHTPARENT = 65528,
				IUP_TOP = IUP_LEFT,
				IUP_BOTTOM = IUP_RIGHT,
				IUP_TOPPARENT = IUP_LEFTPARENT,
				IUP_BOTTOMPARENT = IUP_RIGHTPARENT
				
public enum IUP_SHOW = 0,
			IUP_RESTORE,
			IUP_MINIMIZE,
			IUP_MAXIMIZE,
			IUP_HIDE
			
public enum IUP_SBUP = 0,
			IUP_SBDN,
			IUP_SBPGUP,
			IUP_SBPGDN,
			IUP_SBPOSV,
			IUP_SBDRAGV,
			IUP_SBLEFT,
			IUP_SBRIGHT,
			IUP_SBPGLEFT,
			IUP_SBPGRIGHT,
			IUP_SBPOSH,
			IUP_SBDRAGH
			
public constant IUP_BUTTON1 = "1",
				IUP_BUTTON2 = "2",
				IUP_BUTTON3 = "3",
				IUP_BUTTON4 = "4",
				IUP_BUTTON5 = "5"
				
public constant IUP_GETPARAM_BUTTON1 = -1,
				IUP_GETPARAM_INIT = -2,
				IUP_GETPARAM_BUTTON2 = -3,
				IUP_GETPARAM_BUTTON3 = -4,
				IUP_GETPARAM_CLOSE = -5,
				IUP_GETPARAM_MAP = -6,
				IUP_GETPARAM_OK = IUP_GETPARAM_BUTTON1,
				IUP_GETPARAM_CANCEL = IUP_GETPARAM_BUTTON2,
				IUP_GETPARAM_HELP = IUP_GETPARAM_BUTTON3
				
public constant IUP_PRIMARY = -1,
				IUP_SECONDARY = -2
				
public enum IUP_RECBINARY = 0, IUP_RECTEXT
