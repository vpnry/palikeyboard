﻿#Requires AutoHotkey v2.0

; Pāḷi Keyboard AHK v1.0 - for Windows
; https://github.com/vpnry/palikeyboard

; Author: code snippets generated by ChatGPT & AHK Manual
; Mostly follow Velthuis transliteration


; -----------------------------
; Show Tray tip
; https://www.autohotkey.com/docs/v2/lib/TrayTip.htm
; -----------------------------
A_IconTip := "Pāḷi Keyboard AHK"

TrayTip "Pāḷi Keyboard AHK is started.`nHow to type: Right click on its icon > About.`n`nSukhi hotu!"
Sleep 3000   ; Let it display for 3 seconds.
HideTrayTip
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        A_IconHidden := true
        Sleep 200  ; It"" may be necessary to adjust this sleep.
        A_IconHidden := false
    }
}

; -----------------------------
; Show About in the A_TrayMenu
; -----------------------------

A_TrayMenu.Add()
A_TrayMenu.Add("About", ShowAbout)
HowtoString := "
(
    Pāḷi Keyboard AHK v1.0
    Source code etc.: https://github.com/vpnry/palikeyboard

    --- VOWELS ---
    aa => ā, ii => ī, uu => ū

    --- UNDER DOTS ---
    .m => ṃ
    .n => ṇ
    .d => ḍ
    .l => ḷ
    .r => ṛ
    .s => ṣ
    .t => ṭ

    --- UPPER DOTS/TILDE ---
    m.. => ṁ
    n.. => ṅ
    s.. => ś
    ,,n => ñ
)"
ShowAbout(*) {
    MsgBox(HowtoString, "About")
    return
}


; -------------------------------------
; Main input replacements here
; Similar: https://tipitakapali.org
; -------------------------------------

; Define hotstring triggers for Pali characters
:*?:aa::ā
:*?:ii::ī
:*?:uu::ū
:*?:m..::ṁ
:*?:.m::ṃ
:*?:.n::ṇ
:*?:.d::ḍ
:*?:.l::ḷ
:*?:.r::ṛ
:*?:.s::ṣ
:*?:s..::ś
:*?:.t::ṭ
:*?:,,n::ñ
:*?:n..::ṅ
:*?:AA::Ā
:*?:II::Ī
:*?:UU::Ū
:*?:M..::Ṁ
:*?:.M::Ṃ
:*?:.N::Ṇ
:*?:.D::Ḍ
:*?:.L::Ḷ
:*?:.R::Ṛ
:*?:.S::Ṣ
:*?:S..::Ś
:*?:.T::Ṭ
:*?:,,N::Ñ
:*?:N..::Ṅ

; Keep the script running
return
