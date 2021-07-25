#NoEnv
#WinActivateForce
SetTitleMatchMode, 3
SetWinDelay, -1

;https://github.com/0x464e/slayer-screen-setups

ClientHWNDs := {main: 0, alt1: 0, alt2: 0, alt3: 0, alt4: 0, alt5: 0}
ActiveScreenSetup := "AllClients"
GUIVisible := true

Gui, % "-SysMenu +AlwaysOnTop"
Gui, Add, Tab2, % "x0 y0 w265 h165 +0x4000000 +0x2000000", % "Launch Clients|Screen Setups"
Gui, Tab, % "Launch Clients"
Gui, Add, Checkbox, % "x35 y45 w100 h20 Checked vMainAcc", % "Main"
Gui, Add, Checkbox, % "x35 y65 w100 h20 Checked vCatacomb1", % "Catacomb 1"
Gui, Add, Checkbox, % "x35 y85 w100 h20 Checked vCatacomb2", % "Catacomb 2"
Gui, Add, Checkbox, % "x135 y45 w100 h20 Checked vTzHaar1", % "TzHaar 1"
Gui, Add, Checkbox, % "x135 y65 w100 h20 Checked vTzHaar2", % "TzHaar 2"
Gui, Add, Checkbox, % "x135 y85 w100 h20 Checked vSmokeDevilClient", % "Smoke Devil"
Gui, Add, Button, % "x30 y115 w20 h20 gCloseClients", % "×"
Gui, Add, Button, % "x65 y110 w100 h30 gLaunchClients", % "Launch Clients"
Gui, Add, Button, % "x180 y115 w20 h20 gRefreshClientHWNDs", % "↻"
Gui, Tab, % "Screen Setups"
Gui, Add, Radio, % "x35 y45 w100 h20 gScreenSetups vAbbysNechs", % "Abbys + Nechs"
Gui, Add, Radio, % "x35 y65 w100 h20 gScreenSetups vTzHaar", % "TzHaar"
Gui, Add, Radio, % "x35 y85 w100 h20 gScreenSetups vBloodveld", % "Bloodveld"
Gui, Add, Radio, % "x35 y105 w100 h20 gScreenSetups vDustDevil", % "Dust Devil"
Gui, Add, Radio, % "x160 y45 w100 h20 gScreenSetups vSmokeDevil", % "Smoke Devil"
Gui, Add, Radio, % "x160 y65 w100 h20 gScreenSetups vAllClients", % "All Clients"
Gui, Add, Radio, % "x160 y85 w100 h20 gScreenSetups vBlowpipe", % "Blowpipe"
Gui, Add, Text, % "x20 y48 w15 h15", % "1"
Gui, Add, Text, % "x20 y68 w15 h15", % "2"
Gui, Add, Text, % "x20 y88 w15 h15", % "3"
Gui, Add, Text, % "x20 y108 w15 h15", % "4"
Gui, Add, Text, % "x145 y48 w15 h15", % "5"
Gui, Add, Text, % "x145 y68 w15 h15", % "6"
Gui, Add, Text, % "x145 y88 w15 h15", % "7"
Gui, Show, % "Center w260 h160", % "Slayer Screen Setups"

;hotkey keys 1-7 to activate different screensetups when the
;main window is shown
Loop, 7
   Hotkey, % "*" A_Index, % "GuiHotkeys", On
Return

;esc to close the main window and deactivate hotkeys 1-7
~*ESC::
   if(GUIVisible)
   {
      Gui, Hide
      Loop, 7
         Hotkey, % "*" A_Index, Off
      GUIVisible := false
   }
return

;F13 (which is mapped to one my keyboard's custom macro keys)
;toggles the visibility and hotkeys related to the main window
*F13::
   if(GUIVisible:=!GUIVisible)
   {
      Gui, Show, % "x1524 y333 NA"
      Loop, 7
         Hotkey, % "*" A_Index, % "GuiHotkeys", On
   }
   else
   {
      Gui, Hide
      Loop, 7
         Hotkey, % "*" A_Index, Off
   }
return

;F14 (which is mapped to one my keyboard's custom macro keys)
;re-sets the currently active screen setup
*F14::ScreenSetups()

;sets my screensetups and hotkeys related to screensetups
ScreenSetups(setup = "")
{
   global ClientHWNDs, ActiveScreenSetup, GUIVisible
   if(!setup)
      setup := ActiveScreenSetup
   else
   {
      Gui, Submit
      if(A_GuiControl)
         setup := A_GuiControl
      Hotkey, % "å", % "OnTopToggle", Off
      Hotkey, IfWinActive, % "ahk_exe javaw.exe"
      Hotkey, % "Tab", % "TzHaarClientMove", Off
      Hotkey, IfWinActive
      if(ClientHWNDs.alt2)
         WinSet, AlwaysOnTop, Off, % ClientHWNDs.alt2
      GUIVisible := false
      ActiveScreenSetup := setup
      Loop, 7
         Hotkey, % "*" A_Index, Off
      ToolTip, % setup
      SetTimer, % "ClearToolTip", -2000
   } 

   Switch (setup)
   {
      case "AbbysNechs":
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinActivate, % ClientHWNDs.alt1
         WinMove, % ClientHWNDs.alt1, , 1815, 509, , 534
         WinMove, % "ahk_exe mpc-be64.exe", , -8, 0, 1833, 1407
      case "TzHaar":
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinActivate, % ClientHWNDs.alt4
         WinMove, % ClientHWNDs.alt4, , 1815, 963, , 534
         WinActivate, % ClientHWNDs.alt3
         WinMove, % ClientHWNDs.alt3, , 1815, 509, , 534
         WinMove, % "ahk_exe mpc-be64.exe", , -8, 0, 1833, 1407
         Hotkey, IfWinActive, % "ahk_exe javaw.exe"
         Hotkey, % "Tab", % "TzHaarClientMove", On
         Hotkey, IfWinActive
      case "Bloodveld":
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinActivate, % ClientHWNDs.alt2
         WinMove, % ClientHWNDs.alt2, , 1815, 499, , 534
         WinActivate, % ClientHWNDs.alt1
         WinMove, % ClientHWNDs.alt1, , 1815, 963, , 534
         WinMove, % "ahk_exe mpc-be64.exe", , -8, 0, 1833, 1407
         Hotkey, % "å", % "OnTopToggle", On
      case "DustDevil":
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinActivate, % ClientHWNDs.alt2
         WinMove, % ClientHWNDs.alt2, , 1815, 509, , 534
         WinMove, % "ahk_exe mpc-be64.exe", , -8, 0, 1833, 1407
      case "SmokeDevil":
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinActivate, % ClientHWNDs.alt5
         WinMove, % ClientHWNDs.alt5, , 1815, 509, , 534
         WinMove, % "ahk_exe mpc-be64.exe", , -8, 0, 1833, 1407
      case "AllClients":
         ControlSend, , % "p", % "ahk_exe mpc-be64.exe"
         WinActivate, % ClientHWNDs.alt3
         WinMove, % ClientHWNDs.alt3, , 277, -22, , 534
         WinActivate, % ClientHWNDs.alt4
         WinMove, % ClientHWNDs.alt4, , 277, 509, , 534
         WinActivate, % ClientHWNDs.alt1
         WinMove, % ClientHWNDs.alt1, , 1046, -22, , 534
         WinActivate, % ClientHWNDs.alt2
         WinMove, % ClientHWNDs.alt2, , 1046, 509, , 534
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinActivate, % ClientHWNDs.alt5
         WinMove, % ClientHWNDs.alt5, , 1815, 509, , 534
      case "Blowpipe":
         WinActivate, % ClientHWNDs.main
         WinMove, % ClientHWNDs.main, , 1815, -22, , 534
         WinMove, % "ahk_exe mpc-be64.exe", , -8, 0, 1833, 1407
   }
}

;launches my build of runelite and passes arguments to the client
;(my build of runelite gets passed which account the client belong to, 
;so the client can behave however it's supposed to for that specific account)
LaunchClients()
{
   global
   static accnames := ["main", "alt1", "alt2", "alt3", "alt4", "alt5"]
   Gui, Submit, NoHide
   
   if (!(PluginhubVersion := GetPluginhubVersion()))
   {
      MsgBox, % "Failed to get pluginhub version!"
      return
   }
   
   for each, client in [MainAcc, Catacomb1, Catacomb2, TzHaar1, TzHaar2, SmokeDevilClient]
   {
      if(client)
      {
         Run, % "C:\path\to\jdk\javaw.exe -Drunelite.pluginhub.version=" PluginhubVersion " -jar -ea ""C:\path\to\runelite\client.jar"" --developer-mode --acc=" accnames[A_Index] "", , , PID
         fn := Func("WaitForClient").Bind(accnames[A_Index], PID)
         SetTimer, % fn, -0
      }
   }
}

GetPluginhubVersion()
{
   whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   whr.Open("GET", "https://raw.githubusercontent.com/runelite/plugin-hub/master/runelite.version", true)
   whr.Send()
   whr.WaitForResponse()
   asd := whr.ResponseText
   return whr.ResponseText
}

WaitForClient(acc, PID)
{
   global ClientHWNDs
   WinWait, % "RuneLite - " acc, , 90
   if(ErrorLevel)
      MsgBox, % "Timed out on waiting for client: " acc
   ClientHWNDs[acc] := "ahk_id " WinExist("ahk_pid " PID)
}

OnTopToggle()
{
   global
   WinSet, AlwaysOnTop, Toggle, % ClientHWNDs.alt2
}

TzHaarClientMove()
{
   global ClientHWNDs
   WinGetPos, x1, y1, , , % ClientHWNDs.alt3
   WinGetPos, x2, y2, , , % ClientHWNDs.alt4
   WinMove, % ClientHWNDs.alt3, , % x2, % y2
   WinMove, % ClientHWNDs.alt4, , % x1, % y1
}

;gets ran for any of hotkeys 1-7
GuiHotkeys()
{
   static _ScreenSetups := ["AbbysNechs", "TzHaar", "Bloodveld", "DustDevil", "SmokeDevil", "AllClients", "Blowpipe"]
   ScreenSetup := _ScreenSetups[SubStr(A_ThisHotkey, 2)]
   GuiControl, , % ScreenSetup, 1
   ScreenSetups(ScreenSetup)
}

;need to refresh hwnds if clients were closed and reopened
;my build of runelite will have the rsn (e.g main_rsn), 
;or custom identifier (e.g alt3) in its title
RefreshClientHWNDs()
{
   global ClientHWNDs
   static clientNames := ["main_rsn|main", "alt1_rsn|alt1", "alt2_rsn|alt2", "alt3_rsn|alt3", "alt4_rsn|alt4", "alt5_rsn|alt5"]
   UpdatedHWNDs := ""
   for each, client in clientNames
      for each, name in split := StrSplit(client, "|")
         if(hwnd := WinExist("RuneLite - " name))
         {
            ClientHWNDs[split[2]] := "ahk_id " hwnd
            UpdatedHWNDs .= name ", "
            break
         }

   ToolTip, % "Updated HWNDs:`n" RTrim(UpdatedHWNDs, ", ")
   SetTimer, % "ClearToolTip", -3000
}

CloseClients()
{
   global
   static accnames := ["main", "alt1", "alt2", "alt3", "alt4", "alt5"]
   Gui, Submit, NoHide
   for each, client in [MainAcc, Catacomb1, Catacomb2, TzHaar1, TzHaar2, SmokeDevilClient]
      if (client && ClientHWNDs[accnames[A_Index]])
         WinClose, % ClientHWNDs[accnames[A_Index]]
}

ClearToolTip()
{
   ToolTip
}

GuiClose()
{
   ExitApp
}

*XButton1::Suspend