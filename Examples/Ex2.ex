include std/ffi.e

include IUP.e

IupOpen(NULL,NULL)

atom lab = IupLabel("Hello World")
atom dlg = IupDialog(IupVbox(lab,NULL))
IupSetAttribute(dlg,"TITLE","Hello World Again")

IupShowXY(dlg,IUP_CENTER,IUP_CENTER)

IupMainLoop()

IupClose()
­7.32