#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%

; ========================================
; 配置区域
; ========================================
global NOTE_FILE_PATH := "C:\Users\ZYX\Documents\我的坚果云\zyx2021\1nbox\"

; ========================================
; 核心功能函数
; ========================================

; 保存笔记到文件
SaveNoteToFile(content) {
    ; 生成时间戳和文件名
    FormatTime, timestamp,, yyyy-MM-dd HH:mm
    FormatTime, currentDate,, yyMMdd
    
    ; 处理换行符，统一为Windows格式
    content := RegExReplace(content, "`r`n|`r|`n", "`r`n")
    
    ; 格式化内容并保存
    formattedContent := "[" . timestamp . "] " . content
    fileName := currentDate . ".md"
    fullPath := NOTE_FILE_PATH . fileName
    
    ; 使用Windows换行符格式保存
    FileAppend, `r`n`r`n%formattedContent%, %fullPath%, UTF-8
}

; 打开当天日志文件
OpenTodayLog() {
    FormatTime, currentDate,, yyMMdd
    fileName := currentDate . ".md"
    fullPath := NOTE_FILE_PATH . fileName
    
    ; 如果文件不存在则创建
    if (!FileExist(fullPath)) {
        FileAppend, `r`n, %fullPath%, UTF-8
    }
    Run, %fullPath%
}

; ========================================
; 热键绑定
; ========================================

; Win+A: 打开快速添加对话框
#a::
    Gui, QuickAdd:New, +AlwaysOnTop +ToolWindow -Caption
    Gui, QuickAdd:Add, Edit, x5 y5 w390 h160 vNoteContent -HScroll -VScroll, 
    Gui, QuickAdd:Show, w400 h170, zQuickAdd
    GuiControl, QuickAdd:Focus, NoteContent
return

; Win+V: 直接保存剪贴板内容
#v::
    if (Clipboard != "") {
        SaveNoteToFile(Clipboard)
    }
return

; Alt+Down: 打开当天日志
!Down::OpenTodayLog()

; ========================================
; 对话框事件处理
; ========================================

#IfWinActive, zQuickAdd
    ; Ctrl+Enter: 保存并关闭
    ^Enter::
        Gui, QuickAdd:Submit, NoHide
        if (NoteContent != "") {
            SaveNoteToFile(NoteContent)
        }
        Gui, QuickAdd:Destroy   
    return
    
    ; Esc: 取消并关闭
    Esc::Gui, QuickAdd:Destroy
#IfWinActive