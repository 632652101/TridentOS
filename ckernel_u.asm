; Disassembly of file: ckernel.o
; Mon Feb 15 16:19:53 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global CMain: function
global set_cursor: function
global isSpecialKey: function
global transferScanCode: function
global launch_console: function
global kill_process: function
global cmd_dir: function
global cmd_type: function
global cmd_mem: function
global cmd_cls: function
global cmd_execute_program: function
global cmd_start: function
global cmd_ncst: function
global console_task: function
global cons_putstr: function
global api_linewin: function
global handle_keyboard: function
global close_constask: function
global close_console: function
global cmd_exit: function
global kernel_api: function
global cons_putchar: function
global cons_newline: function
global init_screen8: function
global computeMousePosition: function
global showString: function
global show_mouse_info: function
global initBootInfo: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showFont8: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global mouse_decode: function
global showMemoryInfo: function
global message_box: function
global make_window8: function
global make_wtitle8: function
global make_textbox8: function
global file_loadfile: function
global intHandlerForStackOverFlow: function
global intHandlerForException: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refreshsub: function
global sheet_refreshmap: function
global sheet_free: function
global init_pit: function
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerForTimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global strcmp: function
global set_segmdesc: function
global get_taskctl: function
global init_task_level: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global task_now: function
global task_add: function
global task_remove: function
global task_switchsub: function
global send_message: function
global memman
global KEY_CONTROL
global show_console_window
global console_pos
global key_shift
global caps_lock
global first_task_cons_selector
global current_console
global console_count

extern task_timer                                       ; dword
extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern start_app                                        ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern asm_end_app                                      ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000014(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000014(d)
        mov     dword [ebp-18H], eax                    ; 001B _ 89. 45, E8
        movzx   eax, word [?_448]                       ; 001E _ 0F B7. 05, 00000018(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_449]                       ; 002B _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000140(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000012C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000110(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0066 _ 89. 45, E4
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-1CH]                    ; 0079 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 007C _ 89. 04 24
        call    timer_init                              ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0084 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-1CH]                    ; 008C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 008F _ 89. 04 24
        call    timer_settime                           ; 0092 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0097 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 009C _ 89. 45, E0
        mov     dword [esp+8H], 2                       ; 009F _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-20H]                    ; 00AF _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00B2 _ 89. 04 24
        call    timer_init                              ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 00BA _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-20H]                    ; 00C2 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00C5 _ 89. 04 24
        call    timer_settime                           ; 00C8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 00CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00D2 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 00D5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 00E5 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 00F8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000060(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 0000001C(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000038(d)
        call    fifo8_init                              ; 0146 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 014B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0150 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0155 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 015A _ 89. 45, D8
        call    get_adr_buffer                          ; 015D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0162 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 0165 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 016A _ 89. 04 24
        call    memman_init                             ; 016D _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0172 _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0177 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 16809984                ; 017F _ C7. 44 24, 04, 01008000
        mov     dword [esp], eax                        ; 0187 _ 89. 04 24
        call    memman_free                             ; 018A _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 018F _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0195 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 019B _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 01A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 01A4 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 01A8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 01AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01AF _ 89. 04 24
        call    shtctl_init                             ; 01B2 _ E8, FFFFFFFC(rel)
        mov     dword [shtctl], eax                     ; 01B7 _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 01BC _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01C1 _ 89. 04 24
        call    sheet_alloc                             ; 01C4 _ E8, FFFFFFFC(rel)
        mov     dword [sht_back], eax                   ; 01C9 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 01CE _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01D3 _ 89. 04 24
        call    sheet_alloc                             ; 01D6 _ E8, FFFFFFFC(rel)
        mov     dword [sht_mouse], eax                  ; 01DB _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01E0 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01E6 _ A1, 00000140(d)
        imul    edx, eax                                ; 01EB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01EE _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 01F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 01FA _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 01FF _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 0204 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 020A _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 0210 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 0216 _ A1, 00000268(d)
        mov     dword [esp+10H], 99                     ; 021B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ebx                    ; 0223 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0227 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 022B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 022F _ 89. 04 24
        call    sheet_setbuf                            ; 0232 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sht_mouse]                  ; 0237 _ A1, 0000026C(d)
        mov     dword [esp+10H], 99                     ; 023C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0244 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 024C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0254 _ C7. 44 24, 04, 00000160(d)
        mov     dword [esp], eax                        ; 025C _ 89. 04 24
        call    sheet_setbuf                            ; 025F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0264 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 026A _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0270 _ A1, 00000144(d)
        mov     dword [esp+8H], ecx                     ; 0275 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0279 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        call    init_screen8                            ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0285 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 028D _ C7. 04 24, 00000160(d)
        call    init_mouse_cursor                       ; 0294 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_back]                   ; 0299 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 029F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B8 _ 89. 04 24
        call    sheet_slide                             ; 02BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 02C0 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 02C5 _ 83. E8, 10
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 02D6 _ A1, 00000140(d)
        sub     eax, 44                                 ; 02DB _ 83. E8, 2C
        mov     edx, eax                                ; 02DE _ 89. C2
        shr     edx, 31                                 ; 02E0 _ C1. EA, 1F
        add     eax, edx                                ; 02E3 _ 01. D0
        sar     eax, 1                                  ; 02E5 _ D1. F8
        mov     dword [my], eax                         ; 02E7 _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 02EC _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 02F2 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 02F8 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02FE _ A1, 00000264(d)
        mov     dword [esp+0CH], ebx                    ; 0303 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0307 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 030B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030F _ 89. 04 24
        call    sheet_slide                             ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 8                      ; 0317 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 031E _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 0325 _ A1, 00000264(d)
        mov     dword [esp+4H], ?_418                   ; 032A _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    message_box                             ; 0335 _ E8, FFFFFFFC(rel)
        mov     dword [shtMsgBox], eax                  ; 033A _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 033F _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0345 _ A1, 00000264(d)
        mov     dword [esp+8H], 0                       ; 034A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0356 _ 89. 04 24
        call    sheet_updown                            ; 0359 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_mouse]                  ; 035E _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0364 _ A1, 00000264(d)
        mov     dword [esp+8H], 4                       ; 0369 _ C7. 44 24, 08, 00000004
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000100(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1827], eax                ; 039B _ A3, 0000027C(d)
        mov     eax, dword [task_a.1827]                ; 03A0 _ A1, 0000027C(d)
        mov     dword [?_450], eax                      ; 03A5 _ A3, 00000034(d)
        mov     eax, dword [task_a.1827]                ; 03AA _ A1, 0000027C(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1827]                ; 03B4 _ A1, 0000027C(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        mov     dword [esp], 0                          ; 03D1 _ C7. 04 24, 00000000
        call    launch_console                          ; 03D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 03DD _ 89. 45, D0
        mov     eax, dword [console_count]              ; 03E0 _ A1, 00000000(d)
        add     eax, 1                                  ; 03E5 _ 83. C0, 01
        mov     dword [console_count], eax              ; 03E8 _ A3, 00000000(d)
        mov     eax, dword [shtctl]                     ; 03ED _ A1, 00000264(d)
        mov     dword [esp+0CH], 2                      ; 03F2 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 03FA _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-30H]                    ; 0402 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0405 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0409 _ 89. 04 24
        call    sheet_slide                             ; 040C _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0411 _ A1, 00000264(d)
        mov     dword [esp+8H], 2                       ; 0416 _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-30H]                    ; 041E _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0421 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0425 _ 89. 04 24
        call    sheet_updown                            ; 0428 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 042D _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 0                      ; 0434 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 043B _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 0442 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 0449 _ C7. 45, BC, 00000000
        mov     dword [ebp-14H], 0                      ; 0450 _ C7. 45, EC, 00000000
        mov     dword [ebp-48H], 0                      ; 0457 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 045E _ C7. 45, B4, 00000000
?_001:  mov     dword [esp], keyinfo                    ; 0465 _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 046C _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0471 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0473 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 047A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 047F _ 01. C3
        mov     dword [esp], timerinfo                  ; 0481 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 0488 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 048D _ 01. D8
        test    eax, eax                                ; 048F _ 85. C0
        jnz     ?_002                                   ; 0491 _ 75, 0A
        call    io_sti                                  ; 0493 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0498 _ E9, 00000412

?_002:  mov     dword [esp], keyinfo                    ; 049D _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 04A4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04A9 _ 85. C0
        je      ?_013                                   ; 04AB _ 0F 84, 000003CD
        call    io_sti                                  ; 04B1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04B6 _ C7. 04 24, 0000001C(d)
        call    fifo8_get                               ; 04BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 04C2 _ 89. 45, CC
        mov     eax, dword [key_shift]                  ; 04C5 _ A1, 00000000(d)
        test    eax, eax                                ; 04CA _ 85. C0
        jz      ?_003                                   ; 04CC _ 74, 63
        cmp     dword [ebp-34H], 17                     ; 04CE _ 83. 7D, CC, 11
        jnz     ?_003                                   ; 04D2 _ 75, 5D
        mov     eax, dword [console_count]              ; 04D4 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 04D9 _ 89. 04 24
        call    launch_console                          ; 04DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 04E1 _ 89. 45, D0
        mov     eax, dword [shtctl]                     ; 04E4 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 04E9 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 04F1 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-30H]                    ; 04F9 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 04FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0500 _ 89. 04 24
        call    sheet_slide                             ; 0503 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0508 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 050D _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-30H]                    ; 0515 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0518 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 051C _ 89. 04 24
        call    sheet_updown                            ; 051F _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 0524 _ A1, 00000000(d)
        add     eax, 1                                  ; 0529 _ 83. C0, 01
        mov     dword [console_count], eax              ; 052C _ A3, 00000000(d)
?_003:  cmp     dword [ebp-34H], 255                    ; 0531 _ 81. 7D, CC, 000000FF
        jnz     ?_004                                   ; 0538 _ 75, 1B
        mov     eax, dword [current_console_task]       ; 053A _ A1, 00000278(d)
        test    eax, eax                                ; 053F _ 85. C0
        jz      ?_004                                   ; 0541 _ 74, 12
        mov     eax, dword [current_console_task]       ; 0543 _ A1, 00000278(d)
        mov     dword [esp], eax                        ; 0548 _ 89. 04 24
        call    close_console                           ; 054B _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0550 _ E9, 00000449

?_004:  mov     eax, dword [ebp-34H]                    ; 0555 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0558 _ 89. 04 24
        call    transferScanCode                        ; 055B _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 16                     ; 0560 _ 83. 7D, CC, 10
        jnz     ?_005                                   ; 0564 _ 75, 28
        mov     eax, dword [shtctl]                     ; 0566 _ A1, 00000264(d)
        mov     eax, dword [eax+10H]                    ; 056B _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 056E _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 0571 _ A1, 00000264(d)
        mov     edx, dword [eax+18H]                    ; 0576 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 0579 _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 057E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0582 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0586 _ 89. 04 24
        call    sheet_updown                            ; 0589 _ E8, FFFFFFFC(rel)
?_005:  cmp     dword [ebp-34H], 15                     ; 058E _ 83. 7D, CC, 0F
        jne     ?_011                                   ; 0592 _ 0F 85, 000001B1
        mov     dword [ebp-50H], -1                     ; 0598 _ C7. 45, B0, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 059F _ 83. 7D, EC, 00
        jne     ?_009                                   ; 05A3 _ 0F 85, 000000B3
        mov     dword [ebp-14H], 1                      ; 05A9 _ C7. 45, EC, 00000001
        mov     eax, dword [current_console]            ; 05B0 _ A1, 00000000(d)
        cmp     eax, 1                                  ; 05B5 _ 83. F8, 01
        jnz     ?_006                                   ; 05B8 _ 75, 0C
        mov     dword [current_console], 0              ; 05BA _ C7. 05, 00000000(d), 00000000
        jmp     ?_007                                   ; 05C4 _ EB, 0A

?_006:  mov     dword [current_console], 1              ; 05C6 _ C7. 05, 00000000(d), 00000001
?_007:  mov     edx, dword [shtMsgBox]                  ; 05D0 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05D6 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 05DB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_419                   ; 05E3 _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 05EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05EF _ 89. 04 24
        call    make_wtitle8                            ; 05F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 05F7 _ A1, 00000278(d)
        test    eax, eax                                ; 05FC _ 85. C0
        jz      ?_008                                   ; 05FE _ 74, 2C
        mov     eax, dword [current_console_task]       ; 0600 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0605 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 060B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0610 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_420                   ; 0618 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0620 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0624 _ 89. 04 24
        call    make_wtitle8                            ; 0627 _ E8, FFFFFFFC(rel)
?_008:  mov     edx, dword [shtMsgBox]                  ; 062C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0632 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0637 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 063F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0647 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 064A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 064E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0652 _ 89. 04 24
        call    set_cursor                              ; 0655 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 065A _ EB, 63

?_009:  mov     dword [ebp-14H], 0                      ; 065C _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 0663 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0669 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 066E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_419                   ; 0676 _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 067E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0682 _ 89. 04 24
        call    make_wtitle8                            ; 0685 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 068A _ A1, 00000278(d)
        test    eax, eax                                ; 068F _ 85. C0
        jz      ?_010                                   ; 0691 _ 74, 2C
        mov     eax, dword [current_console_task]       ; 0693 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0698 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 069E _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 06A3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 06AB _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 06B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B7 _ 89. 04 24
        call    make_wtitle8                            ; 06BA _ E8, FFFFFFFC(rel)
?_010:  mov     eax, dword [shtMsgBox]                  ; 06BF _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 06C4 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 06C7 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06CD _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 06D2 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 06DA _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 06DE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 06E6 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 06EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06F2 _ 89. 04 24
        call    sheet_refresh                           ; 06F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 06FA _ A1, 00000278(d)
        test    eax, eax                                ; 06FF _ 85. C0
        jz      ?_011                                   ; 0701 _ 74, 46
        mov     eax, dword [current_console_task]       ; 0703 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0708 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 070E _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0711 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0716 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 071C _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 0721 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 0729 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 072D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0735 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 073D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0741 _ 89. 04 24
        call    sheet_refresh                           ; 0744 _ E8, FFFFFFFC(rel)
?_011:  cmp     dword [ebp-14H], 0                      ; 0749 _ 83. 7D, EC, 00
        jne     ?_012                                   ; 074D _ 0F 85, 000000D9
        mov     eax, dword [ebp-34H]                    ; 0753 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0756 _ 89. 04 24
        call    transferScanCode                        ; 0759 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 075E _ 84. C0
        je      ?_014                                   ; 0760 _ 0F 84, 00000149
        cmp     dword [ebp-0CH], 143                    ; 0766 _ 81. 7D, F4, 0000008F
        jg      ?_014                                   ; 076D _ 0F 8F, 0000013C
        mov     edx, dword [shtMsgBox]                  ; 0773 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0779 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 077E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0786 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 078E _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0791 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0795 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0799 _ 89. 04 24
        call    set_cursor                              ; 079C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 07A1 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 07A4 _ 89. 04 24
        call    transferScanCode                        ; 07A7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 07AC _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 07AF _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 07B3 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 07B6 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 07BA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07C0 _ A1, 00000264(d)
        lea     ecx, [ebp-66H]                          ; 07C5 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 07C8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 07CC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 07D4 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 07DC _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 07DF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E7 _ 89. 04 24
        call    showString                              ; 07EA _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 07EF _ 83. 45, F4, 08
        mov     dword [ebp-44H], 1                      ; 07F3 _ C7. 45, BC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 07FA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0800 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0805 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0808 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 080C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0814 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0817 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 081B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 081F _ 89. 04 24
        call    set_cursor                              ; 0822 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0827 _ E9, 00000083

?_012:  mov     eax, dword [ebp-34H]                    ; 082C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 082F _ 89. 04 24
        call    isSpecialKey                            ; 0832 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0837 _ 85. C0
        jnz     ?_014                                   ; 0839 _ 75, 74
        mov     eax, dword [current_console_task]       ; 083B _ A1, 00000278(d)
        test    eax, eax                                ; 0840 _ 85. C0
        jz      ?_014                                   ; 0842 _ 74, 6B
        mov     eax, dword [ebp-34H]                    ; 0844 _ 8B. 45, CC
        movzx   eax, al                                 ; 0847 _ 0F B6. C0
        mov     edx, dword [current_console_task]       ; 084A _ 8B. 15, 00000278(d)
        add     edx, 16                                 ; 0850 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0853 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0857 _ 89. 14 24
        call    fifo8_put                               ; 085A _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 085F _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 0866 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 086B _ 85. C0
        jnz     ?_014                                   ; 086D _ 75, 40
        mov     eax, dword [task_a.1827]                ; 086F _ A1, 0000027C(d)
        mov     dword [esp], eax                        ; 0874 _ 89. 04 24
        call    task_sleep                              ; 0877 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 087C _ EB, 31

?_013:  mov     dword [esp], mouseinfo                  ; 087E _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 0885 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 088A _ 85. C0
        jz      ?_014                                   ; 088C _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 088E _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 0894 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 089A _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 089F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08A3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A7 _ 89. 04 24
        call    show_mouse_info                         ; 08AA _ E8, FFFFFFFC(rel)
?_014:  mov     dword [esp], timerinfo                  ; 08AF _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 08B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08BB _ 85. C0
        je      ?_018                                   ; 08BD _ 0F 84, 000000DB
        call    io_sti                                  ; 08C3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 08C8 _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 08CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 08D4 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 08D7 _ 83. 7D, A8, 00
        jz      ?_015                                   ; 08DB _ 74, 24
        mov     dword [esp+8H], 0                       ; 08DD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 08E5 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 08ED _ 8B. 45, DC
        mov     dword [esp], eax                        ; 08F0 _ 89. 04 24
        call    timer_init                              ; 08F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 08F8 _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 08FF _ EB, 22

?_015:  mov     dword [esp+8H], 1                       ; 0901 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 0909 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 0911 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0914 _ 89. 04 24
        call    timer_init                              ; 0917 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 091C _ C7. 45, F0, 00000007
?_016:  mov     dword [esp+4H], 50                      ; 0923 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 092B _ 8B. 45, DC
        mov     dword [esp], eax                        ; 092E _ 89. 04 24
        call    timer_settime                           ; 0931 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0936 _ 83. 7D, EC, 00
        jnz     ?_017                                   ; 093A _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 093C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0942 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0947 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 094A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 094E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0956 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0959 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 095D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0961 _ 89. 04 24
        call    set_cursor                              ; 0964 _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0969 _ EB, 33

?_017:  mov     edx, dword [shtMsgBox]                  ; 096B _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0971 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0976 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 097E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0986 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0989 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 098D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0991 _ 89. 04 24
        call    set_cursor                              ; 0994 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0999 _ E9, FFFFFAC7

?_018:  jmp     ?_001                                   ; 099E _ E9, FFFFFAC2
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 09A3 _ 55
        mov     ebp, esp                                ; 09A4 _ 89. E5
        push    esi                                     ; 09A6 _ 56
        push    ebx                                     ; 09A7 _ 53
        sub     esp, 32                                 ; 09A8 _ 83. EC, 20
        cmp     dword [ebp+0CH], 0                      ; 09AB _ 83. 7D, 0C, 00
        jnz     ?_019                                   ; 09AF _ 75, 02
        jmp     ?_020                                   ; 09B1 _ EB, 77

?_019:  mov     eax, dword [ebp+14H]                    ; 09B3 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 09B6 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 09B9 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 09BC _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 09BF _ 8B. 45, 18
        movzx   ecx, al                                 ; 09C2 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 09C5 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09C8 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09CE _ 8B. 00
        mov     dword [esp+18H], esi                    ; 09D0 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 09D4 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 09D8 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 09DB _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 09DF _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 09E2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 09E6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09EA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09EE _ 89. 04 24
        call    boxfill8                                ; 09F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 09F6 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 09F9 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 09FC _ 8B. 45, 10
        add     eax, 8                                  ; 09FF _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 0A02 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0A06 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0A0A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0A0D _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0A11 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0A14 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A18 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A1B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A1F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A22 _ 89. 04 24
        call    sheet_refresh                           ; 0A25 _ E8, FFFFFFFC(rel)
?_020:  add     esp, 32                                 ; 0A2A _ 83. C4, 20
        pop     ebx                                     ; 0A2D _ 5B
        pop     esi                                     ; 0A2E _ 5E
        pop     ebp                                     ; 0A2F _ 5D
        ret                                             ; 0A30 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0A31 _ 55
        mov     ebp, esp                                ; 0A32 _ 89. E5
        sub     esp, 24                                 ; 0A34 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0A37 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A3A _ 89. 04 24
        call    transferScanCode                        ; 0A3D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0A42 _ 83. 7D, 08, 3A
        jz      ?_021                                   ; 0A46 _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0A48 _ 83. 7D, 08, 1D
        jz      ?_021                                   ; 0A4C _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0A4E _ 81. 7D, 08, 000000BA
        jz      ?_021                                   ; 0A55 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0A57 _ 83. 7D, 08, 2A
        jz      ?_021                                   ; 0A5B _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0A5D _ 83. 7D, 08, 36
        jz      ?_021                                   ; 0A61 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 0A63 _ 81. 7D, 08, 000000AA
        jz      ?_021                                   ; 0A6A _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0A6C _ 81. 7D, 08, 000000B6
        jnz     ?_022                                   ; 0A73 _ 75, 07
?_021:  mov     eax, 1                                  ; 0A75 _ B8, 00000001
        jmp     ?_023                                   ; 0A7A _ EB, 05

?_022:  mov     eax, 0                                  ; 0A7C _ B8, 00000000
?_023:  leave                                           ; 0A81 _ C9
        ret                                             ; 0A82 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 0A83 _ 55
        mov     ebp, esp                                ; 0A84 _ 89. E5
        sub     esp, 16                                 ; 0A86 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0A89 _ 83. 7D, 08, 2A
        jnz     ?_024                                   ; 0A8D _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A8F _ A1, 00000000(d)
        or      eax, 01H                                ; 0A94 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0A97 _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 54                      ; 0A9C _ 83. 7D, 08, 36
        jnz     ?_025                                   ; 0AA0 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AA2 _ A1, 00000000(d)
        or      eax, 02H                                ; 0AA7 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0AAA _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 170                     ; 0AAF _ 81. 7D, 08, 000000AA
        jnz     ?_026                                   ; 0AB6 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AB8 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0ABD _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 0AC0 _ A3, 00000000(d)
?_026:  cmp     dword [ebp+8H], 182                     ; 0AC5 _ 81. 7D, 08, 000000B6
        jnz     ?_027                                   ; 0ACC _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0ACE _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0AD3 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0AD6 _ A3, 00000000(d)
?_027:  cmp     dword [ebp+8H], 58                      ; 0ADB _ 83. 7D, 08, 3A
        jnz     ?_029                                   ; 0ADF _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0AE1 _ A1, 00000000(d)
        test    eax, eax                                ; 0AE6 _ 85. C0
        jnz     ?_028                                   ; 0AE8 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0AEA _ C7. 05, 00000000(d), 00000001
        jmp     ?_029                                   ; 0AF4 _ EB, 0A

?_028:  mov     dword [caps_lock], 0                    ; 0AF6 _ C7. 05, 00000000(d), 00000000
?_029:  cmp     dword [ebp+8H], 42                      ; 0B00 _ 83. 7D, 08, 2A
        jz      ?_030                                   ; 0B04 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0B06 _ 83. 7D, 08, 36
        jz      ?_030                                   ; 0B0A _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0B0C _ 81. 7D, 08, 000000AA
        jz      ?_030                                   ; 0B13 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0B15 _ 81. 7D, 08, 000000B6
        jz      ?_030                                   ; 0B1C _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0B1E _ 83. 7D, 08, 53
        jg      ?_030                                   ; 0B22 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0B24 _ 83. 7D, 08, 3A
        jnz     ?_031                                   ; 0B28 _ 75, 0A
?_030:  mov     eax, 0                                  ; 0B2A _ B8, 00000000
        jmp     ?_036                                   ; 0B2F _ E9, 00000089

?_031:  mov     byte [ebp-1H], 0                        ; 0B34 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0B38 _ A1, 00000000(d)
        test    eax, eax                                ; 0B3D _ 85. C0
        jnz     ?_033                                   ; 0B3F _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0B41 _ 83. 7D, 08, 53
        jg      ?_033                                   ; 0B45 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0B47 _ 8B. 45, 08
        add     eax, keytable                           ; 0B4A _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B4F _ 0F B6. 00
        test    al, al                                  ; 0B52 _ 84. C0
        jz      ?_033                                   ; 0B54 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0B56 _ 8B. 45, 08
        add     eax, keytable                           ; 0B59 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B5E _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0B61 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0B64 _ 80. 7D, FF, 40
        jle     ?_032                                   ; 0B68 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0B6A _ 80. 7D, FF, 5A
        jg      ?_032                                   ; 0B6E _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0B70 _ A1, 00000000(d)
        test    eax, eax                                ; 0B75 _ 85. C0
        jnz     ?_032                                   ; 0B77 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0B79 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0B7D _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0B80 _ 88. 45, FF
        jmp     ?_035                                   ; 0B83 _ EB, 34

?_032:  jmp     ?_035                                   ; 0B85 _ EB, 32

?_033:  mov     eax, dword [key_shift]                  ; 0B87 _ A1, 00000000(d)
        test    eax, eax                                ; 0B8C _ 85. C0
        jz      ?_034                                   ; 0B8E _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0B90 _ 83. 7D, 08, 7F
        jg      ?_034                                   ; 0B94 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0B96 _ 8B. 45, 08
        add     eax, keytable1                          ; 0B99 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B9E _ 0F B6. 00
        test    al, al                                  ; 0BA1 _ 84. C0
        jz      ?_034                                   ; 0BA3 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0BA5 _ 8B. 45, 08
        add     eax, keytable1                          ; 0BA8 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0BAD _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0BB0 _ 88. 45, FF
        jmp     ?_035                                   ; 0BB3 _ EB, 04

?_034:  mov     byte [ebp-1H], 0                        ; 0BB5 _ C6. 45, FF, 00
?_035:  movzx   eax, byte [ebp-1H]                      ; 0BB9 _ 0F B6. 45, FF
?_036:  leave                                           ; 0BBD _ C9
        ret                                             ; 0BBE _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0BBF _ 55
        mov     ebp, esp                                ; 0BC0 _ 89. E5
        push    esi                                     ; 0BC2 _ 56
        push    ebx                                     ; 0BC3 _ 53
        sub     esp, 160                                ; 0BC4 _ 81. EC, 000000A0
        mov     dword [ebp-0CH], 0                      ; 0BCA _ C7. 45, F4, 00000000
        mov     eax, dword [shtctl]                     ; 0BD1 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0BD6 _ 89. 04 24
        call    sheet_alloc                             ; 0BD9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0BDE _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0BE1 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0BE6 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0BEE _ 89. 04 24
        call    memman_alloc_4k                         ; 0BF1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0BF6 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0BF9 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0C01 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0C09 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0C11 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0C14 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0C18 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C1B _ 89. 04 24
        call    sheet_setbuf                            ; 0C1E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0C23 _ 83. 7D, 08, 00
        jle     ?_037                                   ; 0C27 _ 7E, 26
        mov     eax, dword [shtctl]                     ; 0C29 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0C2E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_420                   ; 0C36 _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C3E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C41 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C45 _ 89. 04 24
        call    make_window8                            ; 0C48 _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0C4D _ EB, 24

?_037:  mov     eax, dword [shtctl]                     ; 0C4F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0C54 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 0C5C _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C64 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C67 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C6B _ 89. 04 24
        call    make_window8                            ; 0C6E _ E8, FFFFFFFC(rel)
?_038:  mov     eax, dword [ebp-0CH]                    ; 0C73 _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0C76 _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0C79 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0C7C _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0C7F _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 0C84 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0C88 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0C8C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0C94 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 0C9C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C9F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CA3 _ 89. 04 24
        call    sheet_refresh                           ; 0CA6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0CAB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0CB3 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0CBB _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0CC3 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0CCB _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0CD3 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CD6 _ 89. 04 24
        call    make_textbox8                           ; 0CD9 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0CDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0CE3 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0CE6 _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0CE9 _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0CEC _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0CF2 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0CF5 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0CF8 _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0CFB _ A1, 00000278(d)
        test    eax, eax                                ; 0D00 _ 85. C0
        jz      ?_039                                   ; 0D02 _ 74, 7C
        mov     eax, dword [current_console_task]       ; 0D04 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D09 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D0F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0D14 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 0D1C _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0D24 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D28 _ 89. 04 24
        call    make_wtitle8                            ; 0D2B _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 0D30 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D35 _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0D3B _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0D3E _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D43 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0D49 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0D4C _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D51 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D57 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 0D5C _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0D60 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0D64 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0D6C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0D74 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D78 _ 89. 04 24
        call    sheet_refresh                           ; 0D7B _ E8, FFFFFFFC(rel)
?_039:  mov     eax, dword [ebp-14H]                    ; 0D80 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0D83 _ A3, 00000278(d)
        call    get_code32_addr                         ; 0D88 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D8D _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0D90 _ 8B. 45, E8
        neg     eax                                     ; 0D93 _ F7. D8
        add     eax, console_task                       ; 0D95 _ 05, 00000000(d)
        mov     edx, eax                                ; 0D9A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0D9C _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0D9F _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0DA2 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0DA5 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DAC _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0DAF _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0DB6 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0DB9 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0DC0 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0DC3 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0DCD _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0DD0 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DDA _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0DDD _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0DE7 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 0DEC _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 0DF4 _ 89. 04 24
        call    memman_alloc_4k                         ; 0DF7 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 0DFC _ 8B. 55, EC
        mov     dword [edx+0B8H], eax                   ; 0DFF _ 89. 82, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0E05 _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0E08 _ 8B. 80, 000000B8
        lea     edx, [eax+0FFF4H]                       ; 0E0E _ 8D. 90, 0000FFF4
        mov     eax, dword [ebp-14H]                    ; 0E14 _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0E17 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0E1A _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E1D _ 8B. 40, 64
        add     eax, 4                                  ; 0E20 _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0E23 _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0E26 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0E28 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E2B _ 8B. 40, 64
        add     eax, 8                                  ; 0E2E _ 83. C0, 08
        mov     ebx, eax                                ; 0E31 _ 89. C3
        mov     eax, dword [memman]                     ; 0E33 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0E38 _ 89. 04 24
        call    memman_total                            ; 0E3B _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0E40 _ 89. 03
        mov     eax, dword [memman]                     ; 0E42 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0E47 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 0E4F _ 89. 04 24
        call    memman_alloc                            ; 0E52 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0E57 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0E5A _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0E5D _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 0E60 _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 0E63 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 0E67 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 0E6A _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 0E6E _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 0E76 _ 89. 14 24
        call    fifo8_init                              ; 0E79 _ E8, FFFFFFFC(rel)
        mov     dword [ebp+8H], 0                       ; 0E7E _ C7. 45, 08, 00000000
        jmp     ?_041                                   ; 0E85 _ EB, 1E

?_040:  mov     edx, dword [ebp+8H]                     ; 0E87 _ 8B. 55, 08
        mov     eax, edx                                ; 0E8A _ 89. D0
        add     eax, eax                                ; 0E8C _ 01. C0
        add     eax, edx                                ; 0E8E _ 01. D0
        shl     eax, 2                                  ; 0E90 _ C1. E0, 02
        lea     esi, [ebp-8H]                           ; 0E93 _ 8D. 75, F8
        add     eax, esi                                ; 0E96 _ 01. F0
        sub     eax, 116                                ; 0E98 _ 83. E8, 74
        mov     dword [eax], 0                          ; 0E9B _ C7. 00, 00000000
        add     dword [ebp+8H], 1                       ; 0EA1 _ 83. 45, 08, 01
?_041:  cmp     dword [ebp+8H], 7                       ; 0EA5 _ 83. 7D, 08, 07
        jle     ?_040                                   ; 0EA9 _ 7E, DC
        mov     eax, dword [ebp-14H]                    ; 0EAB _ 8B. 45, EC
        lea     edx, [ebp-7CH]                          ; 0EAE _ 8D. 55, 84
        mov     dword [eax+0CCH], edx                   ; 0EB1 _ 89. 90, 000000CC
        mov     dword [esp+8H], 5                       ; 0EB7 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0EBF _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0EC7 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0ECA _ 89. 04 24
        call    task_run                                ; 0ECD _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0ED2 _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0ED6 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0ED8 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0EDB _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0EDD _ A3, 00000000(d)
?_042:  mov     eax, dword [ebp-0CH]                    ; 0EE2 _ 8B. 45, F4
        add     esp, 160                                ; 0EE5 _ 81. C4, 000000A0
        pop     ebx                                     ; 0EEB _ 5B
        pop     esi                                     ; 0EEC _ 5E
        pop     ebp                                     ; 0EED _ 5D
        ret                                             ; 0EEE _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0EEF _ 55
        mov     ebp, esp                                ; 0EF0 _ 89. E5
        sub     esp, 40                                 ; 0EF2 _ 83. EC, 28
        call    task_now                                ; 0EF5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0EFA _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0EFD _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0F00 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0F06 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0F09 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0F0F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F13 _ 89. 04 24
        call    cons_newline                            ; 0F16 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0F1B _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0F1E _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0F24 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0F27 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0F2A _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0F30 _ 8B. 45, F4
        add     eax, 48                                 ; 0F33 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0F36 _ 89. 04 24
        call    asm_end_app                             ; 0F39 _ E8, FFFFFFFC(rel)
        leave                                           ; 0F3E _ C9
        ret                                             ; 0F3F _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0F40 _ 55
        mov     ebp, esp                                ; 0F41 _ 89. E5
        push    ebx                                     ; 0F43 _ 53
        sub     esp, 68                                 ; 0F44 _ 83. EC, 44
        call    task_now                                ; 0F47 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0F4C _ 89. 45, E8
        mov     dword [ebp-0CH], 88064                  ; 0F4F _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 0F56 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0F5B _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0F63 _ 89. 04 24
        call    memman_alloc                            ; 0F66 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0F6B _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0F6E _ 8B. 45, E4
        add     eax, 12                                 ; 0F71 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F74 _ C6. 00, 00
        jmp     ?_050                                   ; 0F77 _ E9, 0000013C

?_043:  mov     dword [ebp-10H], 0                      ; 0F7C _ C7. 45, F0, 00000000
        jmp     ?_046                                   ; 0F83 _ EB, 2C

?_044:  mov     edx, dword [ebp-0CH]                    ; 0F85 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0F88 _ 8B. 45, F0
        add     eax, edx                                ; 0F8B _ 01. D0
        movzx   eax, byte [eax]                         ; 0F8D _ 0F B6. 00
        test    al, al                                  ; 0F90 _ 84. C0
        jz      ?_045                                   ; 0F92 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0F94 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F97 _ 8B. 45, E4
        add     edx, eax                                ; 0F9A _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F9C _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0F9F _ 8B. 45, F0
        add     eax, ecx                                ; 0FA2 _ 01. C8
        movzx   eax, byte [eax]                         ; 0FA4 _ 0F B6. 00
        mov     byte [edx], al                          ; 0FA7 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0FA9 _ 83. 45, F0, 01
        jmp     ?_046                                   ; 0FAD _ EB, 02

?_045:  jmp     ?_047                                   ; 0FAF _ EB, 06

?_046:  cmp     dword [ebp-10H], 7                      ; 0FB1 _ 83. 7D, F0, 07
        jle     ?_044                                   ; 0FB5 _ 7E, CE
?_047:  mov     dword [ebp-14H], 0                      ; 0FB7 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0FBE _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0FC1 _ 8B. 45, E4
        add     eax, edx                                ; 0FC4 _ 01. D0
        mov     byte [eax], 46                          ; 0FC6 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0FC9 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0FCD _ C7. 45, EC, 00000000
        jmp     ?_049                                   ; 0FD4 _ EB, 1E

?_048:  mov     edx, dword [ebp-10H]                    ; 0FD6 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0FD9 _ 8B. 45, E4
        add     edx, eax                                ; 0FDC _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0FDE _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0FE1 _ 8B. 45, EC
        add     eax, ecx                                ; 0FE4 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0FE6 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0FEA _ 88. 02
        add     dword [ebp-10H], 1                      ; 0FEC _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0FF0 _ 83. 45, EC, 01
?_049:  cmp     dword [ebp-14H], 2                      ; 0FF4 _ 83. 7D, EC, 02
        jle     ?_048                                   ; 0FF8 _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0FFA _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0FFD _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 1003 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1006 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 100C _ A1, 00000264(d)
        mov     ebx, dword [ebp-1CH]                    ; 1011 _ 8B. 5D, E4
        mov     dword [esp+14H], ebx                    ; 1014 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1018 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1020 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 1024 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 102C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1030 _ 89. 04 24
        call    showString                              ; 1033 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 136                    ; 1038 _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 103F _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 1042 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 1045 _ 89. 04 24
        call    intToHexStr                             ; 1048 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 104D _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 1050 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 1053 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 1059 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 105C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1062 _ A1, 00000264(d)
        mov     ebx, dword [ebp-24H]                    ; 1067 _ 8B. 5D, DC
        mov     dword [esp+14H], ebx                    ; 106A _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 106E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1076 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-20H]                    ; 107A _ 8B. 4D, E0
        mov     dword [esp+8H], ecx                     ; 107D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1081 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1085 _ 89. 04 24
        call    showString                              ; 1088 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 108D _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1090 _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 1096 _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 1099 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 109F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10A3 _ 89. 04 24
        call    cons_newline                            ; 10A6 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-18H]                    ; 10AB _ 8B. 55, E8
        mov     dword [edx+9CH], eax                    ; 10AE _ 89. 82, 0000009C
        add     dword [ebp-0CH], 32                     ; 10B4 _ 83. 45, F4, 20
?_050:  mov     eax, dword [ebp-0CH]                    ; 10B8 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 10BB _ 0F B6. 00
        test    al, al                                  ; 10BE _ 84. C0
        jne     ?_043                                   ; 10C0 _ 0F 85, FFFFFEB6
        mov     edx, dword [ebp-1CH]                    ; 10C6 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 10C9 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 10CE _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 10D6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10DA _ 89. 04 24
        call    memman_free                             ; 10DD _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 10E2 _ 83. C4, 44
        pop     ebx                                     ; 10E5 _ 5B
        pop     ebp                                     ; 10E6 _ 5D
        ret                                             ; 10E7 _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 10E8 _ 55
        mov     ebp, esp                                ; 10E9 _ 89. E5
        push    esi                                     ; 10EB _ 56
        push    ebx                                     ; 10EC _ 53
        sub     esp, 96                                 ; 10ED _ 83. EC, 60
        call    task_now                                ; 10F0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 10F5 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 10F8 _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 10FB _ 8B. 80, 00000094
        test    eax, eax                                ; 1101 _ 85. C0
        jnz     ?_051                                   ; 1103 _ 75, 05
        jmp     ?_073                                   ; 1105 _ E9, 00000385

?_051:  mov     eax, dword [memman]                     ; 110A _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 110F _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 1117 _ 89. 04 24
        call    memman_alloc                            ; 111A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 111F _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 1122 _ 8B. 45, D8
        add     eax, 12                                 ; 1125 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 1128 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 112B _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 1132 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 1139 _ C7. 45, F0, 00000005
        jmp     ?_054                                   ; 1140 _ EB, 30

?_052:  mov     edx, dword [ebp-10H]                    ; 1142 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 1145 _ 8B. 45, 08
        add     eax, edx                                ; 1148 _ 01. D0
        movzx   eax, byte [eax]                         ; 114A _ 0F B6. 00
        test    al, al                                  ; 114D _ 84. C0
        jz      ?_053                                   ; 114F _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 1151 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 1154 _ 8B. 45, D8
        add     edx, eax                                ; 1157 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 1159 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 115C _ 8B. 45, 08
        add     eax, ecx                                ; 115F _ 01. C8
        movzx   eax, byte [eax]                         ; 1161 _ 0F B6. 00
        mov     byte [edx], al                          ; 1164 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1166 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 116A _ 83. 45, F0, 01
        jmp     ?_054                                   ; 116E _ EB, 02

?_053:  jmp     ?_055                                   ; 1170 _ EB, 06

?_054:  cmp     dword [ebp-10H], 16                     ; 1172 _ 83. 7D, F0, 10
        jle     ?_052                                   ; 1176 _ 7E, CA
?_055:  mov     edx, dword [ebp-0CH]                    ; 1178 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 117B _ 8B. 45, D8
        add     eax, edx                                ; 117E _ 01. D0
        mov     byte [eax], 0                           ; 1180 _ C6. 00, 00
        mov     dword [ebp-14H], 88064                  ; 1183 _ C7. 45, EC, 00015800
        jmp     ?_071                                   ; 118A _ E9, 000002A2

?_056:  mov     byte [ebp-31H], 0                       ; 118F _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 1193 _ C7. 45, E8, 00000000
        jmp     ?_059                                   ; 119A _ EB, 2C

?_057:  mov     edx, dword [ebp-14H]                    ; 119C _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 119F _ 8B. 45, E8
        add     eax, edx                                ; 11A2 _ 01. D0
        movzx   eax, byte [eax]                         ; 11A4 _ 0F B6. 00
        test    al, al                                  ; 11A7 _ 84. C0
        jz      ?_058                                   ; 11A9 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 11AB _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 11AE _ 8B. 45, E8
        add     eax, edx                                ; 11B1 _ 01. D0
        movzx   eax, byte [eax]                         ; 11B3 _ 0F B6. 00
        lea     ecx, [ebp-3DH]                          ; 11B6 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11B9 _ 8B. 55, E8
        add     edx, ecx                                ; 11BC _ 01. CA
        mov     byte [edx], al                          ; 11BE _ 88. 02
        add     dword [ebp-18H], 1                      ; 11C0 _ 83. 45, E8, 01
        jmp     ?_059                                   ; 11C4 _ EB, 02

?_058:  jmp     ?_060                                   ; 11C6 _ EB, 06

?_059:  cmp     dword [ebp-18H], 7                      ; 11C8 _ 83. 7D, E8, 07
        jle     ?_057                                   ; 11CC _ 7E, CE
?_060:  mov     dword [ebp-1CH], 0                      ; 11CE _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 11D5 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 11D8 _ 8B. 45, E8
        add     eax, edx                                ; 11DB _ 01. D0
        mov     byte [eax], 46                          ; 11DD _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 11E0 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 11E4 _ C7. 45, E4, 00000000
        jmp     ?_062                                   ; 11EB _ EB, 1E

?_061:  mov     edx, dword [ebp-14H]                    ; 11ED _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 11F0 _ 8B. 45, E4
        add     eax, edx                                ; 11F3 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 11F5 _ 0F B6. 40, 08
        lea     ecx, [ebp-3DH]                          ; 11F9 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11FC _ 8B. 55, E8
        add     edx, ecx                                ; 11FF _ 01. CA
        mov     byte [edx], al                          ; 1201 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1203 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 1207 _ 83. 45, E4, 01
?_062:  cmp     dword [ebp-1CH], 2                      ; 120B _ 83. 7D, E4, 02
        jle     ?_061                                   ; 120F _ 7E, DC
        lea     eax, [ebp-3DH]                          ; 1211 _ 8D. 45, C3
        mov     dword [esp+4H], eax                     ; 1214 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1218 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 121B _ 89. 04 24
        call    strcmp                                  ; 121E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1223 _ 83. F8, 01
        jne     ?_070                                   ; 1226 _ 0F 85, 00000201
        mov     dword [ebp-2CH], 97280                  ; 122C _ C7. 45, D4, 00017C00
        mov     eax, dword [ebp-14H]                    ; 1233 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 1236 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 123A _ 0F B7. C0
        shl     eax, 9                                  ; 123D _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 1240 _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 1243 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 1246 _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 1249 _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 124C _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 1253 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1256 _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 1260 _ C7. 45, E0, 00000000
        jmp     ?_069                                   ; 1267 _ E9, 000001B2

?_063:  mov     edx, dword [ebp-20H]                    ; 126C _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 126F _ 8B. 45, D4
        add     eax, edx                                ; 1272 _ 01. D0
        movzx   eax, byte [eax]                         ; 1274 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 1277 _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 127A _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 127E _ 0F B6. 45, C1
        cmp     al, 9                                   ; 1282 _ 3C, 09
        jne     ?_066                                   ; 1284 _ 0F 85, 000000A7
?_064:  mov     eax, dword [ebp-24H]                    ; 128A _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 128D _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1293 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1296 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 129C _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 129F _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 12A5 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_421                  ; 12AA _ C7. 44 24, 14, 00000017(d)
        mov     dword [esp+10H], 7                      ; 12B2 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 12BA _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 12BE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 12C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12C6 _ 89. 04 24
        call    showString                              ; 12C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 12CE _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12D1 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 12D7 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 12DA _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 12DD _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 12E3 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12E6 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 12EC _ 3D, 000000F8
        jnz     ?_065                                   ; 12F1 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 12F3 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 12F6 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 1300 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1303 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1309 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 130C _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1312 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1316 _ 89. 04 24
        call    cons_newline                            ; 1319 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 131E _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1321 _ 89. 82, 0000009C
        jmp     ?_064                                   ; 1327 _ E9, FFFFFF5E

?_065:  jmp     ?_064                                   ; 132C _ E9, FFFFFF59

?_066:  movzx   eax, byte [ebp-3FH]                     ; 1331 _ 0F B6. 45, C1
        cmp     al, 10                                  ; 1335 _ 3C, 0A
        jnz     ?_067                                   ; 1337 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 1339 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 133C _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 1346 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1349 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 134F _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1352 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1358 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 135C _ 89. 04 24
        call    cons_newline                            ; 135F _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1364 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1367 _ 89. 82, 0000009C
        jmp     ?_068                                   ; 136D _ E9, 000000A8

?_067:  movzx   eax, byte [ebp-3FH]                     ; 1372 _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1376 _ 3C, 0D
        je      ?_068                                   ; 1378 _ 0F 84, 0000009C
        mov     eax, dword [ebp-24H]                    ; 137E _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1381 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1387 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 138A _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1390 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1393 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1399 _ A1, 00000264(d)
        lea     esi, [ebp-3FH]                          ; 139E _ 8D. 75, C1
        mov     dword [esp+14H], esi                    ; 13A1 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 13A5 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 13AD _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 13B1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 13B5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13B9 _ 89. 04 24
        call    showString                              ; 13BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 13C1 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 13C4 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 13CA _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 13CD _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 13D0 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 13D6 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 13D9 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 13DF _ 3D, 000000F8
        jnz     ?_068                                   ; 13E4 _ 75, 34
        mov     eax, dword [ebp-24H]                    ; 13E6 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 13E9 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 13F3 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 13F6 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 13FC _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 13FF _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1405 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1409 _ 89. 04 24
        call    cons_newline                            ; 140C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1411 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1414 _ 89. 82, 0000009C
?_068:  add     dword [ebp-20H], 1                      ; 141A _ 83. 45, E0, 01
?_069:  mov     eax, dword [ebp-20H]                    ; 141E _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 1421 _ 3B. 45, D0
        jl      ?_063                                   ; 1424 _ 0F 8C, FFFFFE42
        nop                                             ; 142A _ 90
        jmp     ?_072                                   ; 142B _ EB, 12

?_070:  add     dword [ebp-14H], 32                     ; 142D _ 83. 45, EC, 20
?_071:  mov     eax, dword [ebp-14H]                    ; 1431 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 1434 _ 0F B6. 00
        test    al, al                                  ; 1437 _ 84. C0
        jne     ?_056                                   ; 1439 _ 0F 85, FFFFFD50
?_072:  mov     eax, dword [ebp-24H]                    ; 143F _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1442 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1448 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 144B _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1451 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1455 _ 89. 04 24
        call    cons_newline                            ; 1458 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 145D _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1460 _ 89. 82, 0000009C
        mov     edx, dword [ebp-28H]                    ; 1466 _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 1469 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 146E _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1476 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 147A _ 89. 04 24
        call    memman_free                             ; 147D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1482 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1485 _ C7. 80, 00000098, 00000010
?_073:  add     esp, 96                                 ; 148F _ 83. C4, 60
        pop     ebx                                     ; 1492 _ 5B
        pop     esi                                     ; 1493 _ 5E
        pop     ebp                                     ; 1494 _ 5D
        ret                                             ; 1495 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1496 _ 55
        mov     ebp, esp                                ; 1497 _ 89. E5
        push    ebx                                     ; 1499 _ 53
        sub     esp, 52                                 ; 149A _ 83. EC, 34
        call    task_now                                ; 149D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 14A2 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 14A5 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 14A8 _ 8B. 80, 00000094
        test    eax, eax                                ; 14AE _ 85. C0
        jnz     ?_074                                   ; 14B0 _ 75, 05
        jmp     ?_075                                   ; 14B2 _ E9, 000000FF

?_074:  mov     eax, dword [ebp+8H]                     ; 14B7 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 14BA _ 8D. 90, 000003FF
        test    eax, eax                                ; 14C0 _ 85. C0
        cmovs   eax, edx                                ; 14C2 _ 0F 48. C2
        sar     eax, 10                                 ; 14C5 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 14C8 _ 89. 04 24
        call    intToHexStr                             ; 14CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 14D0 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 14D3 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 14D6 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 14DC _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 14DF _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14E5 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_422                  ; 14EA _ C7. 44 24, 14, 00000019(d)
        mov     dword [esp+10H], 7                      ; 14F2 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 14FA _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 14FE _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 1506 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 150A _ 89. 04 24
        call    showString                              ; 150D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1512 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1515 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 151B _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 151E _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1524 _ A1, 00000264(d)
        mov     ebx, dword [ebp-10H]                    ; 1529 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 152C _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1530 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1538 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 153C _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1544 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1548 _ 89. 04 24
        call    showString                              ; 154B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1550 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1553 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1559 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 155C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1562 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_423                  ; 1567 _ C7. 44 24, 14, 0000001F(d)
        mov     dword [esp+10H], 7                      ; 156F _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1577 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 157B _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1583 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1587 _ 89. 04 24
        call    showString                              ; 158A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 158F _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1592 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1598 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 159B _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 15A1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15A5 _ 89. 04 24
        call    cons_newline                            ; 15A8 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 15AD _ 8B. 55, F4
        mov     dword [edx+9CH], eax                    ; 15B0 _ 89. 82, 0000009C
?_075:  add     esp, 52                                 ; 15B6 _ 83. C4, 34
        pop     ebx                                     ; 15B9 _ 5B
        pop     ebp                                     ; 15BA _ 5D
        ret                                             ; 15BB _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 15BC _ 55
        mov     ebp, esp                                ; 15BD _ 89. E5
        sub     esp, 56                                 ; 15BF _ 83. EC, 38
        call    task_now                                ; 15C2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 15C7 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 15CA _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15CD _ 8B. 80, 00000094
        test    eax, eax                                ; 15D3 _ 85. C0
        jnz     ?_076                                   ; 15D5 _ 75, 05
        jmp     ?_081                                   ; 15D7 _ E9, 000000E2

?_076:  mov     dword [ebp-0CH], 8                      ; 15DC _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 15E3 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 15EA _ C7. 45, F0, 0000001C
        jmp     ?_080                                   ; 15F1 _ EB, 41

?_077:  mov     dword [ebp-0CH], 8                      ; 15F3 _ C7. 45, F4, 00000008
        jmp     ?_079                                   ; 15FA _ EB, 2B

?_078:  mov     eax, dword [ebp-14H]                    ; 15FC _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15FF _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 1605 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1607 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 160A _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 1610 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1613 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1617 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1619 _ 8B. 45, F4
        add     eax, ecx                                ; 161C _ 01. C8
        add     eax, edx                                ; 161E _ 01. D0
        mov     byte [eax], 0                           ; 1620 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1623 _ 83. 45, F4, 01
?_079:  cmp     dword [ebp-0CH], 247                    ; 1627 _ 81. 7D, F4, 000000F7
        jle     ?_078                                   ; 162E _ 7E, CC
        add     dword [ebp-10H], 1                      ; 1630 _ 83. 45, F0, 01
?_080:  cmp     dword [ebp-10H], 155                    ; 1634 _ 81. 7D, F0, 0000009B
        jle     ?_077                                   ; 163B _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 163D _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1640 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1646 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 164B _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1653 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 165B _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1663 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 166B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 166F _ 89. 04 24
        call    sheet_refresh                           ; 1672 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1677 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 167A _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1684 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1687 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 168D _ A1, 00000264(d)
        mov     dword [esp+14H], ?_424                  ; 1692 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 169A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 16A2 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 16AA _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 16B2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16B6 _ 89. 04 24
        call    showString                              ; 16B9 _ E8, FFFFFFFC(rel)
?_081:  leave                                           ; 16BE _ C9
        ret                                             ; 16BF _ C3
; cmd_cls End of function

cmd_execute_program:; Function begin
        push    ebp                                     ; 16C0 _ 55
        mov     ebp, esp                                ; 16C1 _ 89. E5
        push    ebx                                     ; 16C3 _ 53
        sub     esp, 68                                 ; 16C4 _ 83. EC, 44
        call    io_cli                                  ; 16C7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 16CC _ A1, 00000000(d)
        mov     dword [esp+4H], 16                      ; 16D1 _ C7. 44 24, 04, 00000010
        mov     dword [esp], eax                        ; 16D9 _ 89. 04 24
        call    memman_alloc                            ; 16DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16E1 _ 89. 45, F0
        call    task_now                                ; 16E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 16E9 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 16EC _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 16EF _ 8B. 55, F0
        mov     dword [eax+0B0H], edx                   ; 16F2 _ 89. 90, 000000B0
        mov     eax, dword [ebp-10H]                    ; 16F8 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1702 _ 89. 04 24
        call    file_loadfile                           ; 1705 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 170A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 170F _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 1712 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 1715 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 1717 _ A1, 00000000(d)
        sub     edx, eax                                ; 171C _ 29. C2
        mov     eax, edx                                ; 171E _ 89. D0
        lea     edx, [eax+7H]                           ; 1720 _ 8D. 50, 07
        test    eax, eax                                ; 1723 _ 85. C0
        cmovs   eax, edx                                ; 1725 _ 0F 48. C2
        sar     eax, 3                                  ; 1728 _ C1. F8, 03
        add     eax, 21                                 ; 172B _ 83. C0, 15
        mov     dword [ebp-1CH], eax                    ; 172E _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 1731 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 1734 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 1736 _ A1, 00000000(d)
        sub     edx, eax                                ; 173B _ 29. C2
        mov     eax, edx                                ; 173D _ 89. D0
        lea     edx, [eax+7H]                           ; 173F _ 8D. 50, 07
        test    eax, eax                                ; 1742 _ 85. C0
        cmovs   eax, edx                                ; 1744 _ 0F 48. C2
        sar     eax, 3                                  ; 1747 _ C1. F8, 03
        add     eax, 30                                 ; 174A _ 83. C0, 1E
        mov     dword [ebp-20H], eax                    ; 174D _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 1750 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1753 _ 8B. 00
        mov     edx, dword [ebp-14H]                    ; 1755 _ 8B. 55, EC
        add     edx, 188                                ; 1758 _ 81. C2, 000000BC
        mov     dword [esp+0CH], 16634                  ; 175E _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 1766 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 176A _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 1772 _ 89. 14 24
        call    set_segmdesc                            ; 1775 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 177A _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 177F _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 1787 _ 89. 04 24
        call    memman_alloc_4k                         ; 178A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 178F _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 1792 _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 1795 _ 8B. 55, DC
        mov     dword [eax+4H], edx                     ; 1798 _ 89. 50, 04
        mov     eax, dword [ebp-24H]                    ; 179B _ 8B. 45, DC
        mov     edx, dword [ebp-14H]                    ; 179E _ 8B. 55, EC
        add     edx, 196                                ; 17A1 _ 81. C2, 000000C4
        mov     dword [esp+0CH], 16626                  ; 17A7 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 17AF _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 17B3 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 17BB _ 89. 14 24
        call    set_segmdesc                            ; 17BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 17C3 _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 17C6 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 17CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 17D2 _ 8B. 45, EC
        add     eax, 48                                 ; 17D5 _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 17D8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 12                     ; 17DC _ C7. 44 24, 0C, 0000000C
        mov     dword [esp+8H], 65536                   ; 17E4 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 4                       ; 17EC _ C7. 44 24, 04, 00000004
        mov     dword [esp], 0                          ; 17F4 _ C7. 04 24, 00000000
        call    start_app                               ; 17FB _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 1800 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1805 _ C7. 45, F4, 00000000
        mov     dword [ebp-0CH], 0                      ; 180C _ C7. 45, F4, 00000000
        jmp     ?_084                                   ; 1813 _ E9, 0000008A

?_082:  mov     eax, dword [ebp-14H]                    ; 1818 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 181B _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 1821 _ 8B. 55, F4
        mov     eax, edx                                ; 1824 _ 89. D0
        add     eax, eax                                ; 1826 _ 01. C0
        add     eax, edx                                ; 1828 _ 01. D0
        shl     eax, 2                                  ; 182A _ C1. E0, 02
        add     eax, ecx                                ; 182D _ 01. C8
        mov     eax, dword [eax]                        ; 182F _ 8B. 00
        test    eax, eax                                ; 1831 _ 85. C0
        jz      ?_083                                   ; 1833 _ 74, 69
        mov     eax, dword [ebp-14H]                    ; 1835 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1838 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 183E _ 8B. 55, F4
        mov     eax, edx                                ; 1841 _ 89. D0
        add     eax, eax                                ; 1843 _ 01. C0
        add     eax, edx                                ; 1845 _ 01. D0
        shl     eax, 2                                  ; 1847 _ C1. E0, 02
        add     eax, ecx                                ; 184A _ 01. C8
        mov     eax, dword [eax+4H]                     ; 184C _ 8B. 40, 04
        mov     ecx, eax                                ; 184F _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 1851 _ 8B. 45, EC
        mov     ebx, dword [eax+0CCH]                   ; 1854 _ 8B. 98, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 185A _ 8B. 55, F4
        mov     eax, edx                                ; 185D _ 89. D0
        add     eax, eax                                ; 185F _ 01. C0
        add     eax, edx                                ; 1861 _ 01. D0
        shl     eax, 2                                  ; 1863 _ C1. E0, 02
        add     eax, ebx                                ; 1866 _ 01. D8
        mov     eax, dword [eax]                        ; 1868 _ 8B. 00
        mov     edx, eax                                ; 186A _ 89. C2
        mov     eax, dword [memman]                     ; 186C _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1871 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1875 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1879 _ 89. 04 24
        call    memman_free_4k                          ; 187C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1881 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1884 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 188A _ 8B. 55, F4
        mov     eax, edx                                ; 188D _ 89. D0
        add     eax, eax                                ; 188F _ 01. C0
        add     eax, edx                                ; 1891 _ 01. D0
        shl     eax, 2                                  ; 1893 _ C1. E0, 02
        add     eax, ecx                                ; 1896 _ 01. C8
        mov     dword [eax], 0                          ; 1898 _ C7. 00, 00000000
?_083:  add     dword [ebp-0CH], 1                      ; 189E _ 83. 45, F4, 01
?_084:  cmp     dword [ebp-0CH], 7                      ; 18A2 _ 83. 7D, F4, 07
        jle     ?_082                                   ; 18A6 _ 0F 8E, FFFFFF6C
        mov     eax, dword [ebp-10H]                    ; 18AC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 18AF _ 8B. 40, 08
        mov     ecx, eax                                ; 18B2 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 18B4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 18B7 _ 8B. 00
        mov     edx, eax                                ; 18B9 _ 89. C2
        mov     eax, dword [memman]                     ; 18BB _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 18C0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 18C4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18C8 _ 89. 04 24
        call    memman_free_4k                          ; 18CB _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 18D0 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 18D3 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 18D8 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 18E0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18E4 _ 89. 04 24
        call    memman_free_4k                          ; 18E7 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 18EC _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 18EF _ A1, 00000000(d)
        mov     dword [esp+8H], 16                      ; 18F4 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 18FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1900 _ 89. 04 24
        call    memman_free                             ; 1903 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1908 _ 8B. 45, EC
        mov     dword [eax+0B0H], 0                     ; 190B _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 1915 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 191A _ 83. C4, 44
        pop     ebx                                     ; 191D _ 5B
        pop     ebp                                     ; 191E _ 5D
        ret                                             ; 191F _ C3
; cmd_execute_program End of function

cmd_start:; Function begin
        push    ebp                                     ; 1920 _ 55
        mov     ebp, esp                                ; 1921 _ 89. E5
        sub     esp, 40                                 ; 1923 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 1926 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 192B _ 89. 04 24
        call    launch_console                          ; 192E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1933 _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 1936 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 193B _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 1943 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-10H]                    ; 194B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 194E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1952 _ 89. 04 24
        call    sheet_slide                             ; 1955 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 195A _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 195F _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-10H]                    ; 1967 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 196A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 196E _ 89. 04 24
        call    sheet_updown                            ; 1971 _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 1976 _ A1, 00000000(d)
        add     eax, 1                                  ; 197B _ 83. C0, 01
        mov     dword [console_count], eax              ; 197E _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 1983 _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 1986 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 1989 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 198C _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 198F _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 1996 _ C7. 45, F4, 00000006
        jmp     ?_086                                   ; 199D _ EB, 24

?_085:  mov     edx, dword [ebp-0CH]                    ; 199F _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 19A2 _ 8B. 45, 08
        add     eax, edx                                ; 19A5 _ 01. D0
        movzx   eax, byte [eax]                         ; 19A7 _ 0F B6. 00
        movzx   eax, al                                 ; 19AA _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 19AD _ 8B. 55, EC
        add     edx, 16                                 ; 19B0 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 19B3 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 19B7 _ 89. 14 24
        call    fifo8_put                               ; 19BA _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 19BF _ 83. 45, F4, 01
?_086:  mov     edx, dword [ebp-0CH]                    ; 19C3 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 19C6 _ 8B. 45, 08
        add     eax, edx                                ; 19C9 _ 01. D0
        movzx   eax, byte [eax]                         ; 19CB _ 0F B6. 00
        test    al, al                                  ; 19CE _ 84. C0
        jnz     ?_085                                   ; 19D0 _ 75, CD
        mov     eax, dword [ebp-14H]                    ; 19D2 _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 19D5 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 19D8 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 19DB _ 8B. 45, EC
        add     eax, 16                                 ; 19DE _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 19E1 _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 19E9 _ 89. 04 24
        call    fifo8_put                               ; 19EC _ E8, FFFFFFFC(rel)
        leave                                           ; 19F1 _ C9
        ret                                             ; 19F2 _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 19F3 _ 55
        mov     ebp, esp                                ; 19F4 _ 89. E5
        sub     esp, 40                                 ; 19F6 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 19F9 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 19FE _ 89. 04 24
        call    launch_console                          ; 1A01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 1A06 _ A1, 00000000(d)
        add     eax, 1                                  ; 1A0B _ 83. C0, 01
        mov     dword [console_count], eax              ; 1A0E _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 1A13 _ A1, 00000278(d)
        mov     dword [ebp-10H], eax                    ; 1A18 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1A1B _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 1A1E _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 1A25 _ C7. 45, F4, 00000005
        mov     dword [ebp-14H], 0                      ; 1A2C _ C7. 45, EC, 00000000
        jmp     ?_088                                   ; 1A33 _ EB, 24

?_087:  mov     edx, dword [ebp-0CH]                    ; 1A35 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1A38 _ 8B. 45, 08
        add     eax, edx                                ; 1A3B _ 01. D0
        movzx   eax, byte [eax]                         ; 1A3D _ 0F B6. 00
        movzx   eax, al                                 ; 1A40 _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 1A43 _ 8B. 55, F0
        add     edx, 16                                 ; 1A46 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 1A49 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 1A4D _ 89. 14 24
        call    fifo8_put                               ; 1A50 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 1A55 _ 83. 45, F4, 01
?_088:  mov     edx, dword [ebp-0CH]                    ; 1A59 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1A5C _ 8B. 45, 08
        add     eax, edx                                ; 1A5F _ 01. D0
        movzx   eax, byte [eax]                         ; 1A61 _ 0F B6. 00
        test    al, al                                  ; 1A64 _ 84. C0
        jnz     ?_087                                   ; 1A66 _ 75, CD
        mov     eax, dword [ebp-10H]                    ; 1A68 _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 1A6B _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 1A6E _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 1A71 _ 8B. 45, F0
        add     eax, 16                                 ; 1A74 _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 1A77 _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 1A7F _ 89. 04 24
        call    fifo8_put                               ; 1A82 _ E8, FFFFFFFC(rel)
        leave                                           ; 1A87 _ C9
        ret                                             ; 1A88 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 1A89 _ 55
        mov     ebp, esp                                ; 1A8A _ 89. E5
        push    esi                                     ; 1A8C _ 56
        push    ebx                                     ; 1A8D _ 53
        sub     esp, 112                                ; 1A8E _ 83. EC, 70
        call    task_now                                ; 1A91 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1A96 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1A99 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1AA0 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1AA7 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 1AAE _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1AB3 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 1ABB _ 89. 04 24
        call    memman_alloc                            ; 1ABE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1AC3 _ 89. 45, E4
        mov     dword [ebp-20H], 96                     ; 1AC6 _ C7. 45, E0, 00000060
        mov     dword [ebp-24H], 176                    ; 1ACD _ C7. 45, DC, 000000B0
        mov     eax, dword [ebp-10H]                    ; 1AD4 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1AD7 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1ADA _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 1AE0 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1AE3 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 1AED _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1AF0 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1AFA _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 1AFD _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 1B07 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1B0C _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 1B0F _ 8B. 45, F0
        add     eax, 16                                 ; 1B12 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B15 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1B1D _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1B21 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B24 _ 89. 04 24
        call    timer_init                              ; 1B27 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1B2C _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1B34 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B37 _ 89. 04 24
        call    timer_settime                           ; 1B3A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B3F _ 8B. 45, F0
        mov     edx, dword [ebp-28H]                    ; 1B42 _ 8B. 55, D8
        mov     dword [eax+0A8H], edx                   ; 1B45 _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 1B4B _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 1B4E _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 1B51 _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 1B57 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_424                  ; 1B5C _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 1B64 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1B6C _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1B74 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1B7C _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1B7F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B83 _ 89. 04 24
        call    showString                              ; 1B86 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], 88064                  ; 1B8B _ C7. 45, D4, 00015800
        mov     dword [ebp-30H], 0                      ; 1B92 _ C7. 45, D0, 00000000
?_089:  call    io_cli                                  ; 1B99 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1B9E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1BA3 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1BA6 _ 8B. 45, F0
        add     eax, 16                                 ; 1BA9 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1BAC _ 89. 04 24
        call    fifo8_status                            ; 1BAF _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1BB4 _ 85. C0
        jnz     ?_090                                   ; 1BB6 _ 75, 0A
        call    io_sti                                  ; 1BB8 _ E8, FFFFFFFC(rel)
        jmp     ?_108                                   ; 1BBD _ E9, 000004F9

?_090:  mov     eax, dword [ebp-10H]                    ; 1BC2 _ 8B. 45, F0
        add     eax, 16                                 ; 1BC5 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1BC8 _ 89. 04 24
        call    fifo8_get                               ; 1BCB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1BD0 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 1BD3 _ 83. 7D, CC, 01
        jg      ?_093                                   ; 1BD7 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1BD9 _ 83. 7D, F4, 00
        js      ?_093                                   ; 1BDD _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 1BDF _ 83. 7D, CC, 00
        jz      ?_091                                   ; 1BE3 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1BE5 _ 8B. 45, F0
        add     eax, 16                                 ; 1BE8 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1BEB _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1BF3 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1BF7 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1BFA _ 89. 04 24
        call    timer_init                              ; 1BFD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1C02 _ C7. 45, F4, 00000007
        jmp     ?_092                                   ; 1C09 _ EB, 24

?_091:  mov     eax, dword [ebp-10H]                    ; 1C0B _ 8B. 45, F0
        add     eax, 16                                 ; 1C0E _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1C11 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1C19 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1C1D _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C20 _ 89. 04 24
        call    timer_init                              ; 1C23 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1C28 _ C7. 45, F4, 00000000
?_092:  mov     dword [esp+4H], 50                      ; 1C2F _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1C37 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C3A _ 89. 04 24
        call    timer_settime                           ; 1C3D _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1C42 _ E9, 00000426

?_093:  cmp     dword [ebp-34H], 87                     ; 1C47 _ 83. 7D, CC, 57
        jnz     ?_094                                   ; 1C4B _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 1C4D _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 1C54 _ 8B. 45, F0
        add     eax, 16                                 ; 1C57 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1C5A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1C62 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1C66 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C69 _ 89. 04 24
        call    timer_init                              ; 1C6C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1C71 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1C79 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C7C _ 89. 04 24
        call    timer_settime                           ; 1C7F _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1C84 _ E9, 000003E4

?_094:  cmp     dword [ebp-34H], 88                     ; 1C89 _ 83. 7D, CC, 58
        jnz     ?_095                                   ; 1C8D _ 75, 6A
        mov     eax, dword [ebp-10H]                    ; 1C8F _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C92 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C98 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C9B _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1CA1 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1CA6 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1CAE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1CB2 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1CB6 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1CB9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CBD _ 89. 04 24
        call    set_cursor                              ; 1CC0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1CC5 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1CCC _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 1CD1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1CD9 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1CE1 _ 89. 04 24
        call    task_run                                ; 1CE4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CE9 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1CEC _ 89. 04 24
        call    task_sleep                              ; 1CEF _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1CF4 _ E9, 00000374

?_095:  cmp     dword [ebp-34H], 28                     ; 1CF9 _ 83. 7D, CC, 1C
        jne     ?_105                                   ; 1CFD _ 0F 85, 0000020D
        mov     eax, dword [ebp-10H]                    ; 1D03 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1D06 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1D0C _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1D0F _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1D15 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1D1A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1D22 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1D26 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1D2A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1D2D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D31 _ 89. 04 24
        call    set_cursor                              ; 1D34 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D39 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D3C _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D42 _ 8D. 50, 07
        test    eax, eax                                ; 1D45 _ 85. C0
        cmovs   eax, edx                                ; 1D47 _ 0F 48. C2
        sar     eax, 3                                  ; 1D4A _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1D4D _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1D50 _ 8B. 45, E4
        add     eax, edx                                ; 1D53 _ 01. D0
        mov     byte [eax], 0                           ; 1D55 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1D58 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D5B _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D61 _ 8D. 50, 07
        test    eax, eax                                ; 1D64 _ 85. C0
        cmovs   eax, edx                                ; 1D66 _ 0F 48. C2
        sar     eax, 3                                  ; 1D69 _ C1. F8, 03
        sub     eax, 2                                  ; 1D6C _ 83. E8, 02
        mov     byte [ebp+eax-55H], 0                   ; 1D6F _ C6. 44 05, AB, 00
        mov     eax, dword [ebp-10H]                    ; 1D74 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1D77 _ 8B. 80, 0000009C
        mov     edx, dword [ebp+8H]                     ; 1D7D _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1D80 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D84 _ 89. 04 24
        call    cons_newline                            ; 1D87 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1D8C _ 8B. 55, F0
        mov     dword [edx+9CH], eax                    ; 1D8F _ 89. 82, 0000009C
        mov     dword [esp+4H], ?_425                   ; 1D95 _ C7. 44 24, 04, 00000025(d)
        mov     eax, dword [ebp-1CH]                    ; 1D9D _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DA0 _ 89. 04 24
        call    strcmp                                  ; 1DA3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DA8 _ 83. F8, 01
        jnz     ?_096                                   ; 1DAB _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1DAD _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1DB0 _ 89. 04 24
        call    cmd_mem                                 ; 1DB3 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1DB8 _ E9, 00000141

?_096:  mov     dword [esp+4H], ?_426                   ; 1DBD _ C7. 44 24, 04, 00000029(d)
        mov     eax, dword [ebp-1CH]                    ; 1DC5 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DC8 _ 89. 04 24
        call    strcmp                                  ; 1DCB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DD0 _ 83. F8, 01
        jnz     ?_097                                   ; 1DD3 _ 75, 0A
        call    cmd_cls                                 ; 1DD5 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1DDA _ E9, 0000011F

?_097:  mov     dword [esp+4H], ?_427                   ; 1DDF _ C7. 44 24, 04, 0000002D(d)
        mov     eax, dword [ebp-1CH]                    ; 1DE7 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DEA _ 89. 04 24
        call    strcmp                                  ; 1DED _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DF2 _ 83. F8, 01
        jnz     ?_098                                   ; 1DF5 _ 75, 11
        mov     dword [esp], ?_428                      ; 1DF7 _ C7. 04 24, 00000031(d)
        call    cmd_execute_program                     ; 1DFE _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E03 _ E9, 000000F6

?_098:  mov     dword [esp+4H], ?_429                   ; 1E08 _ C7. 44 24, 04, 00000039(d)
        mov     eax, dword [ebp-1CH]                    ; 1E10 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E13 _ 89. 04 24
        call    strcmp                                  ; 1E16 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1E1B _ 83. F8, 01
        jnz     ?_099                                   ; 1E1E _ 75, 0A
        call    cmd_dir                                 ; 1E20 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E25 _ E9, 000000D4

?_099:  mov     dword [esp+4H], ?_430                   ; 1E2A _ C7. 44 24, 04, 0000003D(d)
        mov     eax, dword [ebp-1CH]                    ; 1E32 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E35 _ 89. 04 24
        call    strcmp                                  ; 1E38 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1E3D _ 83. F8, 01
        jnz     ?_100                                   ; 1E40 _ 75, 10
        mov     eax, dword [ebp-10H]                    ; 1E42 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1E45 _ 89. 04 24
        call    cmd_exit                                ; 1E48 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E4D _ E9, 000000AC

?_100:  mov     eax, dword [ebp-1CH]                    ; 1E52 _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1E55 _ 0F B6. 00
        cmp     al, 116                                 ; 1E58 _ 3C, 74
        jnz     ?_101                                   ; 1E5A _ 75, 34
        mov     eax, dword [ebp-1CH]                    ; 1E5C _ 8B. 45, E4
        add     eax, 1                                  ; 1E5F _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1E62 _ 0F B6. 00
        cmp     al, 121                                 ; 1E65 _ 3C, 79
        jnz     ?_101                                   ; 1E67 _ 75, 27
        mov     eax, dword [ebp-1CH]                    ; 1E69 _ 8B. 45, E4
        add     eax, 2                                  ; 1E6C _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1E6F _ 0F B6. 00
        cmp     al, 112                                 ; 1E72 _ 3C, 70
        jnz     ?_101                                   ; 1E74 _ 75, 1A
        mov     eax, dword [ebp-1CH]                    ; 1E76 _ 8B. 45, E4
        add     eax, 3                                  ; 1E79 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1E7C _ 0F B6. 00
        cmp     al, 101                                 ; 1E7F _ 3C, 65
        jnz     ?_101                                   ; 1E81 _ 75, 0D
        mov     eax, dword [ebp-1CH]                    ; 1E83 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E86 _ 89. 04 24
        call    cmd_type                                ; 1E89 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E8E _ EB, 6E

?_101:  mov     dword [esp+4H], ?_431                   ; 1E90 _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-1CH]                    ; 1E98 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E9B _ 89. 04 24
        call    strcmp                                  ; 1E9E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1EA3 _ 83. F8, 01
        jnz     ?_102                                   ; 1EA6 _ 75, 0D
        lea     eax, [ebp-55H]                          ; 1EA8 _ 8D. 45, AB
        mov     dword [esp], eax                        ; 1EAB _ 89. 04 24
        call    cmd_start                               ; 1EAE _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1EB3 _ EB, 49

?_102:  mov     dword [esp+4H], ?_432                   ; 1EB5 _ C7. 44 24, 04, 00000048(d)
        mov     eax, dword [ebp-1CH]                    ; 1EBD _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1EC0 _ 89. 04 24
        call    strcmp                                  ; 1EC3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1EC8 _ 83. F8, 01
        jnz     ?_103                                   ; 1ECB _ 75, 0D
        lea     eax, [ebp-55H]                          ; 1ECD _ 8D. 45, AB
        mov     dword [esp], eax                        ; 1ED0 _ 89. 04 24
        call    cmd_ncst                                ; 1ED3 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1ED8 _ EB, 24

?_103:  mov     dword [esp+4H], ?_433                   ; 1EDA _ C7. 44 24, 04, 0000004D(d)
        mov     eax, dword [ebp-1CH]                    ; 1EE2 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1EE5 _ 89. 04 24
        call    strcmp                                  ; 1EE8 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1EED _ 83. F8, 01
        jnz     ?_104                                   ; 1EF0 _ 75, 0C
        mov     dword [esp], ?_434                      ; 1EF2 _ C7. 04 24, 00000053(d)
        call    cmd_execute_program                     ; 1EF9 _ E8, FFFFFFFC(rel)
?_104:  mov     eax, dword [ebp-10H]                    ; 1EFE _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1F01 _ C7. 80, 00000098, 00000010
        jmp     ?_107                                   ; 1F0B _ E9, 0000015D

?_105:  cmp     dword [ebp-34H], 14                     ; 1F10 _ 83. 7D, CC, 0E
        jne     ?_106                                   ; 1F14 _ 0F 85, 00000098
        mov     eax, dword [ebp-10H]                    ; 1F1A _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F1D _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1F23 _ 83. F8, 08
        jle     ?_106                                   ; 1F26 _ 0F 8E, 00000086
        mov     eax, dword [ebp-10H]                    ; 1F2C _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1F2F _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1F35 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1F38 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1F3E _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1F43 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1F4B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1F4F _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1F53 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1F56 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F5A _ 89. 04 24
        call    set_cursor                              ; 1F5D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1F62 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F65 _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1F6B _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1F6E _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1F71 _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1F77 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1F7A _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1F80 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1F83 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1F89 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1F8E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1F96 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1F9A _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1F9E _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1FA1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FA5 _ 89. 04 24
        call    set_cursor                              ; 1FA8 _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1FAD _ E9, 000000BB

?_106:  mov     eax, dword [ebp-34H]                    ; 1FB2 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1FB5 _ 89. 04 24
        call    transferScanCode                        ; 1FB8 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1FBD _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1FC0 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1FC3 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1FC9 _ 3D, 000000EF
        jg      ?_107                                   ; 1FCE _ 0F 8F, 00000099
        cmp     byte [ebp-35H], 0                       ; 1FD4 _ 80. 7D, CB, 00
        je      ?_107                                   ; 1FD8 _ 0F 84, 0000008F
        mov     eax, dword [ebp-10H]                    ; 1FDE _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1FE1 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1FE7 _ 8D. 50, 07
        test    eax, eax                                ; 1FEA _ 85. C0
        cmovs   eax, edx                                ; 1FEC _ 0F 48. C2
        sar     eax, 3                                  ; 1FEF _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1FF2 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1FF5 _ 8B. 45, E4
        add     edx, eax                                ; 1FF8 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1FFA _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1FFE _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 2000 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 2003 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 2009 _ 8D. 50, 07
        test    eax, eax                                ; 200C _ 85. C0
        cmovs   eax, edx                                ; 200E _ 0F 48. C2
        sar     eax, 3                                  ; 2011 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 2014 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 2017 _ 8B. 45, E4
        add     eax, edx                                ; 201A _ 01. D0
        mov     byte [eax], 0                           ; 201C _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 201F _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 2022 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 2028 _ 8D. 50, 07
        test    eax, eax                                ; 202B _ 85. C0
        cmovs   eax, edx                                ; 202D _ 0F 48. C2
        sar     eax, 3                                  ; 2030 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2033 _ 8D. 50, FE
        mov     eax, dword [ebp-34H]                    ; 2036 _ 8B. 45, CC
        mov     byte [ebp+edx-55H], al                  ; 2039 _ 88. 44 15, AB
        mov     eax, dword [ebp-10H]                    ; 203D _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 2040 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 2046 _ 8D. 50, 07
        test    eax, eax                                ; 2049 _ 85. C0
        cmovs   eax, edx                                ; 204B _ 0F 48. C2
        sar     eax, 3                                  ; 204E _ C1. F8, 03
        sub     eax, 1                                  ; 2051 _ 83. E8, 01
        mov     byte [ebp+eax-55H], 0                   ; 2054 _ C6. 44 05, AB, 00
        movsx   eax, byte [ebp-35H]                     ; 2059 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 205D _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 2065 _ 89. 04 24
        call    cons_putchar                            ; 2068 _ E8, FFFFFFFC(rel)
?_107:  cmp     dword [ebp-0CH], 0                      ; 206D _ 83. 7D, F4, 00
        js      ?_108                                   ; 2071 _ 78, 48
        mov     eax, dword [ebp-10H]                    ; 2073 _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 2076 _ 8B. 80, 00000094
        test    eax, eax                                ; 207C _ 85. C0
        jz      ?_108                                   ; 207E _ 74, 3B
        mov     eax, dword [ebp-10H]                    ; 2080 _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 2083 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 2089 _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 208C _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 2092 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 2095 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 209B _ A1, 00000264(d)
        mov     esi, dword [ebp-0CH]                    ; 20A0 _ 8B. 75, F4
        mov     dword [esp+10H], esi                    ; 20A3 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 20A7 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 20AB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 20AF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20B3 _ 89. 04 24
        call    set_cursor                              ; 20B6 _ E8, FFFFFFFC(rel)
?_108:  call    io_sti                                  ; 20BB _ E8, FFFFFFFC(rel)
        jmp     ?_089                                   ; 20C0 _ E9, FFFFFAD4
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 20C5 _ 55
        mov     ebp, esp                                ; 20C6 _ 89. E5
        sub     esp, 24                                 ; 20C8 _ 83. EC, 18
        jmp     ?_110                                   ; 20CB _ EB, 1D

?_109:  mov     eax, dword [ebp+8H]                     ; 20CD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 20D0 _ 0F B6. 00
        movsx   eax, al                                 ; 20D3 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 20D6 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 20DE _ 89. 04 24
        call    cons_putchar                            ; 20E1 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 20E6 _ 83. 45, 08, 01
?_110:  mov     eax, dword [ebp+8H]                     ; 20EA _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 20ED _ 0F B6. 00
        test    al, al                                  ; 20F0 _ 84. C0
        jnz     ?_109                                   ; 20F2 _ 75, D9
        nop                                             ; 20F4 _ 90
        leave                                           ; 20F5 _ C9
        ret                                             ; 20F6 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 20F7 _ 55
        mov     ebp, esp                                ; 20F8 _ 89. E5
        sub     esp, 32                                 ; 20FA _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 20FD _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2100 _ 8B. 55, 14
        sub     edx, eax                                ; 2103 _ 29. C2
        mov     eax, edx                                ; 2105 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2107 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 210A _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 210D _ 8B. 55, 18
        sub     edx, eax                                ; 2110 _ 29. C2
        mov     eax, edx                                ; 2112 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2114 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 2117 _ 8B. 45, 0C
        shl     eax, 10                                 ; 211A _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 211D _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 2120 _ 8B. 45, 10
        shl     eax, 10                                 ; 2123 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 2126 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 2129 _ 83. 7D, EC, 00
        jns     ?_111                                   ; 212D _ 79, 03
        neg     dword [ebp-14H]                         ; 212F _ F7. 5D, EC
?_111:  cmp     dword [ebp-18H], 0                      ; 2132 _ 83. 7D, E8, 00
        jns     ?_112                                   ; 2136 _ 79, 03
        neg     dword [ebp-18H]                         ; 2138 _ F7. 5D, E8
?_112:  mov     eax, dword [ebp-14H]                    ; 213B _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 213E _ 3B. 45, E8
        jl      ?_116                                   ; 2141 _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 2143 _ 8B. 45, EC
        add     eax, 1                                  ; 2146 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 2149 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 214C _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 214F _ 3B. 45, 14
        jle     ?_113                                   ; 2152 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 2154 _ C7. 45, EC, FFFFFC00
        jmp     ?_114                                   ; 215B _ EB, 07

?_113:  mov     dword [ebp-14H], 1024                   ; 215D _ C7. 45, EC, 00000400
?_114:  mov     eax, dword [ebp+10H]                    ; 2164 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 2167 _ 3B. 45, 18
        jg      ?_115                                   ; 216A _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 216C _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 216F _ 8B. 55, 18
        sub     edx, eax                                ; 2172 _ 29. C2
        mov     eax, edx                                ; 2174 _ 89. D0
        add     eax, 1                                  ; 2176 _ 83. C0, 01
        shl     eax, 10                                 ; 2179 _ C1. E0, 0A
        cdq                                             ; 217C _ 99
        idiv    dword [ebp-10H]                         ; 217D _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 2180 _ 89. 45, E8
        jmp     ?_120                                   ; 2183 _ EB, 72

?_115:  mov     eax, dword [ebp+10H]                    ; 2185 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 2188 _ 8B. 55, 18
        sub     edx, eax                                ; 218B _ 29. C2
        mov     eax, edx                                ; 218D _ 89. D0
        sub     eax, 1                                  ; 218F _ 83. E8, 01
        shl     eax, 10                                 ; 2192 _ C1. E0, 0A
        cdq                                             ; 2195 _ 99
        idiv    dword [ebp-10H]                         ; 2196 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 2199 _ 89. 45, E8
        jmp     ?_120                                   ; 219C _ EB, 59

?_116:  mov     eax, dword [ebp-18H]                    ; 219E _ 8B. 45, E8
        add     eax, 1                                  ; 21A1 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 21A4 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 21A7 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 21AA _ 3B. 45, 18
        jle     ?_117                                   ; 21AD _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 21AF _ C7. 45, E8, FFFFFC00
        jmp     ?_118                                   ; 21B6 _ EB, 07

?_117:  mov     dword [ebp-18H], 1024                   ; 21B8 _ C7. 45, E8, 00000400
?_118:  mov     eax, dword [ebp+0CH]                    ; 21BF _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 21C2 _ 3B. 45, 14
        jg      ?_119                                   ; 21C5 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 21C7 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 21CA _ 8B. 55, 14
        sub     edx, eax                                ; 21CD _ 29. C2
        mov     eax, edx                                ; 21CF _ 89. D0
        add     eax, 1                                  ; 21D1 _ 83. C0, 01
        shl     eax, 10                                 ; 21D4 _ C1. E0, 0A
        cdq                                             ; 21D7 _ 99
        idiv    dword [ebp-10H]                         ; 21D8 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 21DB _ 89. 45, EC
        jmp     ?_120                                   ; 21DE _ EB, 17

?_119:  mov     eax, dword [ebp+0CH]                    ; 21E0 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 21E3 _ 8B. 55, 14
        sub     edx, eax                                ; 21E6 _ 29. C2
        mov     eax, edx                                ; 21E8 _ 89. D0
        sub     eax, 1                                  ; 21EA _ 83. E8, 01
        shl     eax, 10                                 ; 21ED _ C1. E0, 0A
        cdq                                             ; 21F0 _ 99
        idiv    dword [ebp-10H]                         ; 21F1 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 21F4 _ 89. 45, EC
?_120:  mov     dword [ebp-4H], 0                       ; 21F7 _ C7. 45, FC, 00000000
        jmp     ?_122                                   ; 21FE _ EB, 35

?_121:  mov     eax, dword [ebp+8H]                     ; 2200 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2203 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2205 _ 8B. 45, F4
        sar     eax, 10                                 ; 2208 _ C1. F8, 0A
        mov     ecx, eax                                ; 220B _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 220D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2210 _ 8B. 40, 04
        imul    eax, ecx                                ; 2213 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 2216 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 2219 _ C1. F9, 0A
        add     eax, ecx                                ; 221C _ 01. C8
        add     edx, eax                                ; 221E _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 2220 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 2223 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 2225 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 2228 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 222B _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 222E _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 2231 _ 83. 45, FC, 01
?_122:  mov     eax, dword [ebp-4H]                     ; 2235 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 2238 _ 3B. 45, F0
        jl      ?_121                                   ; 223B _ 7C, C3
        leave                                           ; 223D _ C9
        ret                                             ; 223E _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 223F _ 55
        mov     ebp, esp                                ; 2240 _ 89. E5
        sub     esp, 56                                 ; 2242 _ 83. EC, 38
?_123:  call    io_cli                                  ; 2245 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 224A _ 8B. 45, 08
        add     eax, 16                                 ; 224D _ 83. C0, 10
        mov     dword [esp], eax                        ; 2250 _ 89. 04 24
        call    fifo8_status                            ; 2253 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2258 _ 85. C0
        jnz     ?_125                                   ; 225A _ 75, 2B
        call    io_sti                                  ; 225C _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 2261 _ 83. 7D, 0C, 00
        jz      ?_124                                   ; 2265 _ 74, 05
        jmp     ?_129                                   ; 2267 _ E9, 000000DC

?_124:  call    io_sti                                  ; 226C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2271 _ 8B. 45, 10
        add     eax, 28                                 ; 2274 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 2277 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 227D _ B8, 00000000
        jmp     ?_130                                   ; 2282 _ E9, 000000C6

?_125:  mov     eax, dword [ebp+8H]                     ; 2287 _ 8B. 45, 08
        add     eax, 16                                 ; 228A _ 83. C0, 10
        mov     dword [esp], eax                        ; 228D _ 89. 04 24
        call    fifo8_get                               ; 2290 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2295 _ 89. 45, F4
        call    io_sti                                  ; 2298 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 229D _ 81. 7D, F4, 000000FF
        jle     ?_126                                   ; 22A4 _ 7E, 37
        mov     edx, dword [sht_back]                   ; 22A6 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 22AC _ A1, 00000264(d)
        mov     dword [esp+14H], ?_435                  ; 22B1 _ C7. 44 24, 14, 0000005D(d)
        mov     dword [esp+10H], 7                      ; 22B9 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 22C1 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 22C9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 22D1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22D5 _ 89. 04 24
        call    showString                              ; 22D8 _ E8, FFFFFFFC(rel)
?_126:  cmp     dword [ebp-0CH], 1                      ; 22DD _ 83. 7D, F4, 01
        jg      ?_127                                   ; 22E1 _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 22E3 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 22E6 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 22E9 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 22EC _ 8B. 80, 000000A8
        mov     dword [esp+8H], 1                       ; 22F2 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 22FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22FE _ 89. 04 24
        call    timer_init                              ; 2301 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2306 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 2309 _ 8B. 80, 000000A8
        mov     dword [esp+4H], 50                      ; 230F _ C7. 44 24, 04, 00000032
        mov     dword [esp], eax                        ; 2317 _ 89. 04 24
        call    timer_settime                           ; 231A _ E8, FFFFFFFC(rel)
        jmp     ?_129                                   ; 231F _ EB, 27

?_127:  cmp     dword [ebp-0CH], 2                      ; 2321 _ 83. 7D, F4, 02
        jnz     ?_128                                   ; 2325 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 2327 _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 232A _ C7. 80, 000000A0, 00000007
        jmp     ?_129                                   ; 2334 _ EB, 12

?_128:  mov     eax, dword [ebp+10H]                    ; 2336 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 2339 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 233C _ 8B. 45, F4
        mov     dword [edx], eax                        ; 233F _ 89. 02
        mov     eax, 0                                  ; 2341 _ B8, 00000000
        jmp     ?_130                                   ; 2346 _ EB, 05

?_129:  jmp     ?_123                                   ; 2348 _ E9, FFFFFEF8

?_130:  leave                                           ; 234D _ C9
        ret                                             ; 234E _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 234F _ 55
        mov     ebp, esp                                ; 2350 _ 89. E5
        sub     esp, 24                                 ; 2352 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2355 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2358 _ 89. 04 24
        call    task_sleep                              ; 235B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2360 _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2363 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 2369 _ 89. C2
        mov     eax, dword [memman]                     ; 236B _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 2370 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 2378 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 237C _ 89. 04 24
        call    memman_free_4k                          ; 237F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2384 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2387 _ 8B. 40, 10
        mov     edx, eax                                ; 238A _ 89. C2
        mov     eax, dword [memman]                     ; 238C _ A1, 00000000(d)
        mov     dword [esp+8H], 128                     ; 2391 _ C7. 44 24, 08, 00000080
        mov     dword [esp+4H], edx                     ; 2399 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 239D _ 89. 04 24
        call    memman_free                             ; 23A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23A5 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 23A8 _ 8B. 80, 000000AC
        mov     edx, eax                                ; 23AE _ 89. C2
        mov     eax, dword [memman]                     ; 23B0 _ A1, 00000000(d)
        mov     dword [esp+8H], 30                      ; 23B5 _ C7. 44 24, 08, 0000001E
        mov     dword [esp+4H], edx                     ; 23BD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23C1 _ 89. 04 24
        call    memman_free                             ; 23C4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23C9 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 23CC _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 23D3 _ C7. 05, 00000278(d), 00000000
        leave                                           ; 23DD _ C9
        ret                                             ; 23DE _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 23DF _ 55
        mov     ebp, esp                                ; 23E0 _ 89. E5
        sub     esp, 40                                 ; 23E2 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 23E5 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 23E8 _ 8B. 80, 000000A8
        mov     dword [esp], eax                        ; 23EE _ 89. 04 24
        call    timer_free                              ; 23F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23F6 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 23F9 _ 8B. 80, 000000B4
        test    eax, eax                                ; 23FF _ 85. C0
        jz      ?_131                                   ; 2401 _ 74, 40
        mov     eax, dword [ebp+8H]                     ; 2403 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 2406 _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 240C _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 240F _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 2412 _ 8B. 00
        mov     edx, eax                                ; 2414 _ 89. C2
        mov     eax, dword [memman]                     ; 2416 _ A1, 00000000(d)
        mov     dword [esp+8H], 42240                   ; 241B _ C7. 44 24, 08, 0000A500
        mov     dword [esp+4H], edx                     ; 2423 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2427 _ 89. 04 24
        call    memman_free_4k                          ; 242A _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 242F _ A1, 00000264(d)
        mov     edx, dword [ebp-0CH]                    ; 2434 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2437 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 243B _ 89. 04 24
        call    sheet_free                              ; 243E _ E8, FFFFFFFC(rel)
?_131:  mov     eax, dword [ebp+8H]                     ; 2443 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2446 _ 89. 04 24
        call    close_constask                          ; 2449 _ E8, FFFFFFFC(rel)
        leave                                           ; 244E _ C9
        ret                                             ; 244F _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 2450 _ 55
        mov     ebp, esp                                ; 2451 _ 89. E5
        sub     esp, 24                                 ; 2453 _ 83. EC, 18
        call    io_cli                                  ; 2456 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 255                     ; 245B _ C7. 44 24, 04, 000000FF
        mov     dword [esp], keyinfo                    ; 2463 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 246A _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 246F _ E8, FFFFFFFC(rel)
        leave                                           ; 2474 _ C9
        ret                                             ; 2475 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 2476 _ 55
        mov     ebp, esp                                ; 2477 _ 89. E5
        push    esi                                     ; 2479 _ 56
        push    ebx                                     ; 247A _ 53
        sub     esp, 80                                 ; 247B _ 83. EC, 50
        call    task_now                                ; 247E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2483 _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 2486 _ C7. 45, EC, 00000000
        lea     eax, [ebp+24H]                          ; 248D _ 8D. 45, 24
        add     eax, 4                                  ; 2490 _ 83. C0, 04
        mov     dword [ebp-18H], eax                    ; 2493 _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 2496 _ C7. 45, F4, 00000000
        mov     dword [ebp-1CH], 0                      ; 249D _ C7. 45, E4, 00000000
        cmp     dword [ebp+1CH], 1                      ; 24A4 _ 83. 7D, 1C, 01
        jnz     ?_132                                   ; 24A8 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 24AA _ 8B. 45, 24
        movsx   eax, al                                 ; 24AD _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 24B0 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 24B8 _ 89. 04 24
        call    cons_putchar                            ; 24BB _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 24C0 _ E9, 00000675

?_132:  cmp     dword [ebp+1CH], 2                      ; 24C5 _ 83. 7D, 1C, 02
        jnz     ?_133                                   ; 24C9 _ 75, 1D
        mov     eax, dword [ebp-10H]                    ; 24CB _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 24CE _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 24D4 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 24D6 _ 8B. 45, 18
        add     eax, edx                                ; 24D9 _ 01. D0
        mov     dword [esp], eax                        ; 24DB _ 89. 04 24
        call    cons_putstr                             ; 24DE _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 24E3 _ E9, 00000652

?_133:  cmp     dword [ebp+1CH], 4                      ; 24E8 _ 83. 7D, 1C, 04
        jnz     ?_134                                   ; 24EC _ 75, 15
        mov     eax, dword [ebp-10H]                    ; 24EE _ 8B. 45, F0
        mov     dword [eax+34H], 0                      ; 24F1 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-10H]                    ; 24F8 _ 8B. 45, F0
        add     eax, 48                                 ; 24FB _ 83. C0, 30
        jmp     ?_167                                   ; 24FE _ E9, 0000063C

?_134:  cmp     dword [ebp+1CH], 5                      ; 2503 _ 83. 7D, 1C, 05
        jne     ?_135                                   ; 2507 _ 0F 85, 00000124
        mov     eax, dword [shtctl]                     ; 250D _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 2512 _ 89. 04 24
        call    sheet_alloc                             ; 2515 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 251A _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 251D _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 2520 _ 8B. 55, F0
        mov     dword [eax+20H], edx                    ; 2523 _ 89. 50, 20
        mov     eax, dword [ebp-14H]                    ; 2526 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 2529 _ 8B. 40, 1C
        or      eax, 10H                                ; 252C _ 83. C8, 10
        mov     edx, eax                                ; 252F _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2531 _ 8B. 45, EC
        mov     dword [eax+1CH], edx                    ; 2534 _ 89. 50, 1C
        mov     eax, dword [ebp+0CH]                    ; 2537 _ 8B. 45, 0C
        imul    eax, dword [ebp+8H]                     ; 253A _ 0F AF. 45, 08
        mov     edx, eax                                ; 253E _ 89. C2
        mov     eax, dword [memman]                     ; 2540 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 2545 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2549 _ 89. 04 24
        call    memman_alloc                            ; 254C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2551 _ 89. 45, E0
        mov     eax, dword [ebp+24H]                    ; 2554 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 2557 _ 8B. 55, F0
        mov     edx, dword [edx+0B0H]                   ; 255A _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 2560 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 2563 _ 8B. 55, 18
        add     edx, ecx                                ; 2566 _ 01. CA
        mov     dword [esp+10H], eax                    ; 2568 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 256C _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 256F _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 2573 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 2576 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 257A _ 89. 54 24, 04
        mov     eax, dword [ebp-14H]                    ; 257E _ 8B. 45, EC
        mov     dword [esp], eax                        ; 2581 _ 89. 04 24
        call    sheet_setbuf                            ; 2584 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2589 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 258C _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 2592 _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 2594 _ 8B. 45, 20
        add     edx, eax                                ; 2597 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2599 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 259E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 25A6 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 25AA _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 25AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25B1 _ 89. 04 24
        call    make_window8                            ; 25B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 25B9 _ A1, 00000264(d)
        mov     eax, dword [eax+0CH]                    ; 25BE _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 25C1 _ 2B. 45, 08
        mov     edx, eax                                ; 25C4 _ 89. C2
        shr     edx, 31                                 ; 25C6 _ C1. EA, 1F
        add     eax, edx                                ; 25C9 _ 01. D0
        sar     eax, 1                                  ; 25CB _ D1. F8
        mov     ecx, eax                                ; 25CD _ 89. C1
        mov     eax, dword [shtctl]                     ; 25CF _ A1, 00000264(d)
        mov     eax, dword [eax+8H]                     ; 25D4 _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 25D7 _ 2B. 45, 0C
        mov     edx, eax                                ; 25DA _ 89. C2
        shr     edx, 31                                 ; 25DC _ C1. EA, 1F
        add     eax, edx                                ; 25DF _ 01. D0
        sar     eax, 1                                  ; 25E1 _ D1. F8
        mov     edx, eax                                ; 25E3 _ 89. C2
        mov     eax, dword [shtctl]                     ; 25E5 _ A1, 00000264(d)
        mov     dword [esp+0CH], ecx                    ; 25EA _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 25EE _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 25F2 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 25F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25F9 _ 89. 04 24
        call    sheet_slide                             ; 25FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 2601 _ A1, 00000264(d)
        mov     edx, dword [eax+10H]                    ; 2606 _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 2609 _ A1, 00000264(d)
        mov     dword [esp+8H], edx                     ; 260E _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2612 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 2615 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2619 _ 89. 04 24
        call    sheet_updown                            ; 261C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2621 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2624 _ 8D. 50, 1C
        mov     eax, dword [ebp-14H]                    ; 2627 _ 8B. 45, EC
        mov     dword [edx], eax                        ; 262A _ 89. 02
        jmp     ?_166                                   ; 262C _ E9, 00000509

?_135:  cmp     dword [ebp+1CH], 6                      ; 2631 _ 83. 7D, 1C, 06
        jne     ?_136                                   ; 2635 _ 0F 85, 0000008C
        mov     eax, dword [ebp+18H]                    ; 263B _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 263E _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 2641 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2644 _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 264A _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 264D _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2650 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 2653 _ 8B. 45, 24
        movsx   edx, al                                 ; 2656 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 2659 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 265E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2662 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 2666 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2669 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 266D _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2670 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2674 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 2677 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 267B _ 89. 04 24
        call    showString                              ; 267E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2683 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 2686 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 2689 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 268C _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2693 _ 8B. 45, 0C
        add     edx, eax                                ; 2696 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2698 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 269D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 26A1 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 26A5 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 26A8 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 26AC _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 26AF _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 26B3 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 26B6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26BA _ 89. 04 24
        call    sheet_refresh                           ; 26BD _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 26C2 _ E9, 00000473

?_136:  cmp     dword [ebp+1CH], 7                      ; 26C7 _ 83. 7D, 1C, 07
        jnz     ?_137                                   ; 26CB _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 26CD _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 26D0 _ 89. 45, EC
        mov     ebx, dword [ebp+24H]                    ; 26D3 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 26D6 _ 8B. 45, 10
        movzx   ecx, al                                 ; 26D9 _ 0F B6. C8
        mov     eax, dword [ebp-14H]                    ; 26DC _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 26DF _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 26E2 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 26E5 _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 26E7 _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 26EA _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 26EE _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 26F1 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 26F5 _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 26F8 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 26FC _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2700 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2704 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2708 _ 89. 04 24
        call    boxfill8                                ; 270B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2710 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 2713 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 2716 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 2719 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 271C _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 271F _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 2724 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2728 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 272C _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 272F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2733 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2737 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 273A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 273E _ 89. 04 24
        call    sheet_refresh                           ; 2741 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2746 _ E9, 000003EF

?_137:  cmp     dword [ebp+1CH], 11                     ; 274B _ 83. 7D, 1C, 0B
        jnz     ?_138                                   ; 274F _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 2751 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2754 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2757 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 275A _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 275C _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 275F _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 2762 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 2766 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 2768 _ 8B. 45, 0C
        add     eax, ecx                                ; 276B _ 01. C8
        add     edx, eax                                ; 276D _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 276F _ 8B. 45, 24
        mov     byte [edx], al                          ; 2772 _ 88. 02
        jmp     ?_166                                   ; 2774 _ E9, 000003C1

?_138:  cmp     dword [ebp+1CH], 12                     ; 2779 _ 83. 7D, 1C, 0C
        jnz     ?_139                                   ; 277D _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 277F _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2782 _ 89. 45, EC
        mov     edx, dword [ebp+24H]                    ; 2785 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2788 _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 278D _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 2790 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 2794 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 2797 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 279B _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 279E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 27A2 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 27A6 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 27A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 27AD _ 89. 04 24
        call    sheet_refresh                           ; 27B0 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 27B5 _ E9, 00000380

?_139:  cmp     dword [ebp+1CH], 13                     ; 27BA _ 83. 7D, 1C, 0D
        jnz     ?_140                                   ; 27BE _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 27C0 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 27C3 _ 89. 45, EC
        mov     eax, dword [ebp+24H]                    ; 27C6 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 27C9 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 27CC _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 27D0 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 27D3 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 27D7 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 27DA _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 27DE _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 27E1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 27E5 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 27E9 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 27EC _ 89. 04 24
        call    api_linewin                             ; 27EF _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 27F4 _ E9, 00000341

?_140:  cmp     dword [ebp+1CH], 14                     ; 27F9 _ 83. 7D, 1C, 0E
        jnz     ?_141                                   ; 27FD _ 75, 32
        mov     edx, dword [ebp+18H]                    ; 27FF _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 2802 _ A1, 00000264(d)
        mov     dword [esp+4H], edx                     ; 2807 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 280B _ 89. 04 24
        call    sheet_free                              ; 280E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2813 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2816 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 281C _ 8B. 40, 04
        add     eax, 291                                ; 281F _ 05, 00000123
        mov     dword [esp], eax                        ; 2824 _ 89. 04 24
        call    cons_putstr                             ; 2827 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 282C _ E9, 00000309

?_141:  cmp     dword [ebp+1CH], 15                     ; 2831 _ 83. 7D, 1C, 0F
        jnz     ?_142                                   ; 2835 _ 75, 1E
        mov     eax, dword [ebp+24H]                    ; 2837 _ 8B. 45, 24
        mov     edx, dword [ebp-18H]                    ; 283A _ 8B. 55, E8
        mov     dword [esp+8H], edx                     ; 283D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2841 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 2845 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2848 _ 89. 04 24
        call    handle_keyboard                         ; 284B _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2850 _ E9, 000002E5

?_142:  cmp     dword [ebp+1CH], 16                     ; 2855 _ 83. 7D, 1C, 10
        jnz     ?_143                                   ; 2859 _ 75, 12
        mov     eax, dword [ebp-18H]                    ; 285B _ 8B. 45, E8
        lea     ebx, [eax+1CH]                          ; 285E _ 8D. 58, 1C
        call    timer_alloc                             ; 2861 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2866 _ 89. 03
        jmp     ?_166                                   ; 2868 _ E9, 000002CD

?_143:  cmp     dword [ebp+1CH], 17                     ; 286D _ 83. 7D, 1C, 11
        jnz     ?_144                                   ; 2871 _ 75, 24
        mov     eax, dword [ebp+24H]                    ; 2873 _ 8B. 45, 24
        movzx   edx, al                                 ; 2876 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2879 _ 8B. 45, F0
        lea     ecx, [eax+10H]                          ; 287C _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 287F _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 2882 _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 2886 _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 288A _ 89. 04 24
        call    timer_init                              ; 288D _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2892 _ E9, 000002A3

?_144:  cmp     dword [ebp+1CH], 18                     ; 2897 _ 83. 7D, 1C, 12
        jnz     ?_145                                   ; 289B _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 289D _ 8B. 45, 24
        mov     edx, eax                                ; 28A0 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 28A2 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 28A5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 28A9 _ 89. 04 24
        call    timer_settime                           ; 28AC _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 28B1 _ E9, 00000284

?_145:  cmp     dword [ebp+1CH], 19                     ; 28B6 _ 83. 7D, 1C, 13
        jnz     ?_146                                   ; 28BA _ 75, 10
        mov     eax, dword [ebp+18H]                    ; 28BC _ 8B. 45, 18
        mov     dword [esp], eax                        ; 28BF _ 89. 04 24
        call    timer_free                              ; 28C2 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 28C7 _ E9, 0000026E

?_146:  cmp     dword [ebp+1CH], 21                     ; 28CC _ 83. 7D, 1C, 15
        jne     ?_152                                   ; 28D0 _ 0F 85, 000000C5
        mov     dword [ebp-0CH], 0                      ; 28D6 _ C7. 45, F4, 00000000
        jmp     ?_149                                   ; 28DD _ EB, 23

?_147:  mov     eax, dword [ebp-10H]                    ; 28DF _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 28E2 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 28E8 _ 8B. 55, F4
        mov     eax, edx                                ; 28EB _ 89. D0
        add     eax, eax                                ; 28ED _ 01. C0
        add     eax, edx                                ; 28EF _ 01. D0
        shl     eax, 2                                  ; 28F1 _ C1. E0, 02
        add     eax, ecx                                ; 28F4 _ 01. C8
        mov     eax, dword [eax]                        ; 28F6 _ 8B. 00
        test    eax, eax                                ; 28F8 _ 85. C0
        jnz     ?_148                                   ; 28FA _ 75, 02
        jmp     ?_150                                   ; 28FC _ EB, 0A

?_148:  add     dword [ebp-0CH], 1                      ; 28FE _ 83. 45, F4, 01
?_149:  cmp     dword [ebp-0CH], 7                      ; 2902 _ 83. 7D, F4, 07
        jle     ?_147                                   ; 2906 _ 7E, D7
?_150:  mov     eax, dword [ebp-10H]                    ; 2908 _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 290B _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 2911 _ 8B. 55, F4
        mov     eax, edx                                ; 2914 _ 89. D0
        add     eax, eax                                ; 2916 _ 01. C0
        add     eax, edx                                ; 2918 _ 01. D0
        shl     eax, 2                                  ; 291A _ C1. E0, 02
        add     eax, ecx                                ; 291D _ 01. C8
        mov     dword [ebp-1CH], eax                    ; 291F _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 2922 _ 8B. 45, E8
        add     eax, 28                                 ; 2925 _ 83. C0, 1C
        mov     dword [eax], 0                          ; 2928 _ C7. 00, 00000000
        cmp     dword [ebp-0CH], 7                      ; 292E _ 83. 7D, F4, 07
        jg      ?_166                                   ; 2932 _ 0F 8F, 00000202
        mov     dword [ebp-30H], 0                      ; 2938 _ C7. 45, D0, 00000000
        mov     eax, dword [ebp-10H]                    ; 293F _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2942 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 2948 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 294A _ 8B. 45, 18
        add     eax, edx                                ; 294D _ 01. D0
        mov     dword [ebp-24H], eax                    ; 294F _ 89. 45, DC
        lea     eax, [ebp-30H]                          ; 2952 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 2955 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 2959 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 295C _ 89. 04 24
        call    file_loadfile                           ; 295F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-30H]                    ; 2964 _ 8B. 45, D0
        test    eax, eax                                ; 2967 _ 85. C0
        jz      ?_151                                   ; 2969 _ 74, 2B
        mov     eax, dword [ebp-18H]                    ; 296B _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 296E _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2971 _ 8B. 45, E4
        mov     dword [edx], eax                        ; 2974 _ 89. 02
        mov     edx, dword [ebp-30H]                    ; 2976 _ 8B. 55, D0
        mov     eax, dword [ebp-1CH]                    ; 2979 _ 8B. 45, E4
        mov     dword [eax], edx                        ; 297C _ 89. 10
        mov     edx, dword [ebp-28H]                    ; 297E _ 8B. 55, D8
        mov     eax, dword [ebp-1CH]                    ; 2981 _ 8B. 45, E4
        mov     dword [eax+4H], edx                     ; 2984 _ 89. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 2987 _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 298A _ C7. 40, 08, 00000000
        jmp     ?_166                                   ; 2991 _ E9, 000001A4

?_151:  jmp     ?_166                                   ; 2996 _ E9, 0000019F

?_152:  cmp     dword [ebp+1CH], 22                     ; 299B _ 83. 7D, 1C, 16
        jnz     ?_153                                   ; 299F _ 75, 38
        mov     eax, dword [ebp+24H]                    ; 29A1 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 29A4 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 29A7 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 29AA _ 8B. 40, 04
        mov     ecx, eax                                ; 29AD _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 29AF _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 29B2 _ 8B. 00
        mov     edx, eax                                ; 29B4 _ 89. C2
        mov     eax, dword [memman]                     ; 29B6 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 29BB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 29BF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29C3 _ 89. 04 24
        call    memman_free_4k                          ; 29C6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 29CB _ 8B. 45, E4
        mov     dword [eax], 0                          ; 29CE _ C7. 00, 00000000
        jmp     ?_166                                   ; 29D4 _ E9, 00000161

?_153:  cmp     dword [ebp+1CH], 23                     ; 29D9 _ 83. 7D, 1C, 17
        jne     ?_158                                   ; 29DD _ 0F 85, 00000080
        mov     eax, dword [ebp+24H]                    ; 29E3 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 29E6 _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 29E9 _ 83. 7D, 20, 00
        jnz     ?_154                                   ; 29ED _ 75, 0B
        mov     eax, dword [ebp-1CH]                    ; 29EF _ 8B. 45, E4
        mov     edx, dword [ebp+18H]                    ; 29F2 _ 8B. 55, 18
        mov     dword [eax+8H], edx                     ; 29F5 _ 89. 50, 08
        jmp     ?_156                                   ; 29F8 _ EB, 30

?_154:  cmp     dword [ebp+20H], 1                      ; 29FA _ 83. 7D, 20, 01
        jnz     ?_155                                   ; 29FE _ 75, 13
        mov     eax, dword [ebp-1CH]                    ; 2A00 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2A03 _ 8B. 50, 08
        mov     eax, dword [ebp+18H]                    ; 2A06 _ 8B. 45, 18
        add     edx, eax                                ; 2A09 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2A0B _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2A0E _ 89. 50, 08
        jmp     ?_156                                   ; 2A11 _ EB, 17

?_155:  cmp     dword [ebp+20H], 2                      ; 2A13 _ 83. 7D, 20, 02
        jnz     ?_156                                   ; 2A17 _ 75, 11
        mov     eax, dword [ebp-1CH]                    ; 2A19 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 2A1C _ 8B. 50, 04
        mov     eax, dword [ebp+18H]                    ; 2A1F _ 8B. 45, 18
        add     edx, eax                                ; 2A22 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2A24 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2A27 _ 89. 50, 08
?_156:  mov     eax, dword [ebp-1CH]                    ; 2A2A _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2A2D _ 8B. 40, 08
        test    eax, eax                                ; 2A30 _ 85. C0
        jns     ?_157                                   ; 2A32 _ 79, 0A
        mov     eax, dword [ebp-1CH]                    ; 2A34 _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 2A37 _ C7. 40, 08, 00000000
?_157:  mov     eax, dword [ebp-1CH]                    ; 2A3E _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2A41 _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 2A44 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2A47 _ 8B. 40, 04
        cmp     edx, eax                                ; 2A4A _ 39. C2
        jle     ?_166                                   ; 2A4C _ 0F 8E, 000000E8
        mov     eax, dword [ebp-1CH]                    ; 2A52 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 2A55 _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 2A58 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2A5B _ 89. 50, 08
        jmp     ?_166                                   ; 2A5E _ E9, 000000D7

?_158:  cmp     dword [ebp+1CH], 24                     ; 2A63 _ 83. 7D, 1C, 18
        jnz     ?_161                                   ; 2A67 _ 75, 5C
        mov     eax, dword [ebp+24H]                    ; 2A69 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2A6C _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 2A6F _ 83. 7D, 20, 00
        jnz     ?_159                                   ; 2A73 _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 2A75 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2A78 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2A7B _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2A7E _ 8B. 40, 04
        mov     dword [edx], eax                        ; 2A81 _ 89. 02
        jmp     ?_166                                   ; 2A83 _ E9, 000000B2

?_159:  cmp     dword [ebp+20H], 1                      ; 2A88 _ 83. 7D, 20, 01
        jnz     ?_160                                   ; 2A8C _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 2A8E _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2A91 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2A94 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2A97 _ 8B. 40, 08
        mov     dword [edx], eax                        ; 2A9A _ 89. 02
        jmp     ?_166                                   ; 2A9C _ E9, 00000099

?_160:  cmp     dword [ebp+20H], 2                      ; 2AA1 _ 83. 7D, 20, 02
        jne     ?_166                                   ; 2AA5 _ 0F 85, 0000008F
        mov     eax, dword [ebp-18H]                    ; 2AAB _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2AAE _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2AB1 _ 8B. 45, E4
        mov     ecx, dword [eax+8H]                     ; 2AB4 _ 8B. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 2AB7 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2ABA _ 8B. 40, 04
        sub     ecx, eax                                ; 2ABD _ 29. C1
        mov     eax, ecx                                ; 2ABF _ 89. C8
        mov     dword [edx], eax                        ; 2AC1 _ 89. 02
        jmp     ?_166                                   ; 2AC3 _ EB, 75

?_161:  cmp     dword [ebp+1CH], 25                     ; 2AC5 _ 83. 7D, 1C, 19
        jnz     ?_166                                   ; 2AC9 _ 75, 6F
        mov     eax, dword [ebp+24H]                    ; 2ACB _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2ACE _ 89. 45, E4
        mov     dword [ebp-0CH], 0                      ; 2AD1 _ C7. 45, F4, 00000000
        jmp     ?_164                                   ; 2AD8 _ EB, 4D

?_162:  mov     eax, dword [ebp-1CH]                    ; 2ADA _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2ADD _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 2AE0 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2AE3 _ 8B. 40, 04
        cmp     edx, eax                                ; 2AE6 _ 39. C2
        jnz     ?_163                                   ; 2AE8 _ 75, 02
        jmp     ?_165                                   ; 2AEA _ EB, 43

?_163:  mov     eax, dword [ebp-10H]                    ; 2AEC _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2AEF _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 2AF5 _ 8B. 40, 04
        mov     ecx, dword [ebp+18H]                    ; 2AF8 _ 8B. 4D, 18
        mov     edx, dword [ebp-0CH]                    ; 2AFB _ 8B. 55, F4
        add     edx, ecx                                ; 2AFE _ 01. CA
        add     edx, eax                                ; 2B00 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2B02 _ 8B. 45, E4
        mov     ecx, dword [eax]                        ; 2B05 _ 8B. 08
        mov     eax, dword [ebp-1CH]                    ; 2B07 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2B0A _ 8B. 40, 08
        add     eax, ecx                                ; 2B0D _ 01. C8
        movzx   eax, byte [eax]                         ; 2B0F _ 0F B6. 00
        mov     byte [edx], al                          ; 2B12 _ 88. 02
        mov     eax, dword [ebp-1CH]                    ; 2B14 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2B17 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2B1A _ 8D. 50, 01
        mov     eax, dword [ebp-1CH]                    ; 2B1D _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2B20 _ 89. 50, 08
        add     dword [ebp-0CH], 1                      ; 2B23 _ 83. 45, F4, 01
?_164:  mov     eax, dword [ebp-0CH]                    ; 2B27 _ 8B. 45, F4
        cmp     eax, dword [ebp+20H]                    ; 2B2A _ 3B. 45, 20
        jl      ?_162                                   ; 2B2D _ 7C, AB
?_165:  mov     eax, dword [ebp-18H]                    ; 2B2F _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2B32 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 2B35 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 2B38 _ 89. 02
?_166:  mov     eax, 0                                  ; 2B3A _ B8, 00000000
?_167:  add     esp, 80                                 ; 2B3F _ 83. C4, 50
        pop     ebx                                     ; 2B42 _ 5B
        pop     esi                                     ; 2B43 _ 5E
        pop     ebp                                     ; 2B44 _ 5D
        ret                                             ; 2B45 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 2B46 _ 55
        mov     ebp, esp                                ; 2B47 _ 89. E5
        push    esi                                     ; 2B49 _ 56
        push    ebx                                     ; 2B4A _ 53
        sub     esp, 48                                 ; 2B4B _ 83. EC, 30
        mov     edx, dword [ebp+8H]                     ; 2B4E _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 2B51 _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 2B54 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 2B57 _ 88. 45, E0
        call    task_now                                ; 2B5A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2B5F _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2B62 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2B65 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2B6B _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2B6E _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2B74 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2B77 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2B7D _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 2B82 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2B8A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2B8E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B92 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B96 _ 89. 04 24
        call    set_cursor                              ; 2B99 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2B9E _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 2BA1 _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 2BA5 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2BAB _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 2BAE _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 2BB5 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 2BB8 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2BBE _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2BC1 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2BC7 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2BCA _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2BD0 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2BD3 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2BD9 _ A1, 00000264(d)
        mov     dword [esp+14H], esi                    ; 2BDE _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 2BE2 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 2BEA _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2BEE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2BF2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BF6 _ 89. 04 24
        call    showString                              ; 2BF9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2BFE _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 2C01 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2C07 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2C0A _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 2C0D _ 89. 90, 00000098
        add     esp, 48                                 ; 2C13 _ 83. C4, 30
        pop     ebx                                     ; 2C16 _ 5B
        pop     esi                                     ; 2C17 _ 5E
        pop     ebp                                     ; 2C18 _ 5D
        ret                                             ; 2C19 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2C1A _ 55
        mov     ebp, esp                                ; 2C1B _ 89. E5
        push    ebx                                     ; 2C1D _ 53
        sub     esp, 52                                 ; 2C1E _ 83. EC, 34
        cmp     dword [ebp+0CH], 0                      ; 2C21 _ 83. 7D, 0C, 00
        jnz     ?_168                                   ; 2C25 _ 75, 06
        nop                                             ; 2C27 _ 90
        jmp     ?_179                                   ; 2C28 _ E9, 00000127

?_168:  cmp     dword [ebp+8H], 139                     ; 2C2D _ 81. 7D, 08, 0000008B
        jg      ?_169                                   ; 2C34 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2C36 _ 83. 45, 08, 10
        jmp     ?_178                                   ; 2C3A _ E9, 000000DF

?_169:  mov     dword [ebp-10H], 28                     ; 2C3F _ C7. 45, F0, 0000001C
        jmp     ?_173                                   ; 2C46 _ EB, 52

?_170:  mov     dword [ebp-0CH], 8                      ; 2C48 _ C7. 45, F4, 00000008
        jmp     ?_172                                   ; 2C4F _ EB, 3C

?_171:  mov     eax, dword [ebp+0CH]                    ; 2C51 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2C54 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2C56 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C59 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2C5C _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2C60 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2C62 _ 8B. 45, F4
        add     eax, ecx                                ; 2C65 _ 01. C8
        add     edx, eax                                ; 2C67 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2C69 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2C6C _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2C6E _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2C71 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2C74 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C77 _ 8B. 40, 04
        imul    ebx, eax                                ; 2C7A _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2C7D _ 8B. 45, F4
        add     eax, ebx                                ; 2C80 _ 01. D8
        add     eax, ecx                                ; 2C82 _ 01. C8
        movzx   eax, byte [eax]                         ; 2C84 _ 0F B6. 00
        mov     byte [edx], al                          ; 2C87 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 2C89 _ 83. 45, F4, 01
?_172:  cmp     dword [ebp-0CH], 247                    ; 2C8D _ 81. 7D, F4, 000000F7
        jle     ?_171                                   ; 2C94 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2C96 _ 83. 45, F0, 01
?_173:  cmp     dword [ebp-10H], 139                    ; 2C9A _ 81. 7D, F0, 0000008B
        jle     ?_170                                   ; 2CA1 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2CA3 _ C7. 45, F0, 0000008C
        jmp     ?_177                                   ; 2CAA _ EB, 35

?_174:  mov     dword [ebp-0CH], 8                      ; 2CAC _ C7. 45, F4, 00000008
        jmp     ?_176                                   ; 2CB3 _ EB, 1F

?_175:  mov     eax, dword [ebp+0CH]                    ; 2CB5 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2CB8 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2CBA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2CBD _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2CC0 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2CC4 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2CC6 _ 8B. 45, F4
        add     eax, ecx                                ; 2CC9 _ 01. C8
        add     eax, edx                                ; 2CCB _ 01. D0
        mov     byte [eax], 0                           ; 2CCD _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2CD0 _ 83. 45, F4, 01
?_176:  cmp     dword [ebp-0CH], 247                    ; 2CD4 _ 81. 7D, F4, 000000F7
        jle     ?_175                                   ; 2CDB _ 7E, D8
        add     dword [ebp-10H], 1                      ; 2CDD _ 83. 45, F0, 01
?_177:  cmp     dword [ebp-10H], 155                    ; 2CE1 _ 81. 7D, F0, 0000009B
        jle     ?_174                                   ; 2CE8 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 2CEA _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 2CEF _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2CF7 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2CFF _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2D07 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2D0F _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2D12 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D16 _ 89. 04 24
        call    sheet_refresh                           ; 2D19 _ E8, FFFFFFFC(rel)
?_178:  mov     eax, dword [shtctl]                     ; 2D1E _ A1, 00000264(d)
        mov     dword [esp+14H], ?_424                  ; 2D23 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 2D2B _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 2D33 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2D36 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2D3A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2D42 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2D45 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D49 _ 89. 04 24
        call    showString                              ; 2D4C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2D51 _ 8B. 45, 08
?_179:  add     esp, 52                                 ; 2D54 _ 83. C4, 34
        pop     ebx                                     ; 2D57 _ 5B
        pop     ebp                                     ; 2D58 _ 5D
        ret                                             ; 2D59 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 2D5A _ 55
        mov     ebp, esp                                ; 2D5B _ 89. E5
        push    ebx                                     ; 2D5D _ 53
        sub     esp, 36                                 ; 2D5E _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 2D61 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2D64 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 2D67 _ 8B. 45, 0C
        sub     eax, 1                                  ; 2D6A _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 2D6D _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 2D71 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 2D75 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2D7D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 2D85 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+0CH]                    ; 2D8D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D90 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D94 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D97 _ 89. 04 24
        call    boxfill8                                ; 2D9A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2D9F _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2DA2 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 2DA5 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2DA8 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2DAB _ 8B. 45, 10
        sub     eax, 28                                 ; 2DAE _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2DB1 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2DB5 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2DB9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2DBD _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2DC5 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2DCD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2DD0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DD4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DD7 _ 89. 04 24
        call    boxfill8                                ; 2DDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2DDF _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2DE2 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2DE5 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2DE8 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2DEB _ 8B. 45, 10
        sub     eax, 27                                 ; 2DEE _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 2DF1 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2DF5 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2DF9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2DFD _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 2E05 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2E0D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E10 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E14 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E17 _ 89. 04 24
        call    boxfill8                                ; 2E1A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E1F _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2E22 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2E25 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2E28 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2E2B _ 8B. 45, 10
        sub     eax, 26                                 ; 2E2E _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 2E31 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2E35 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2E39 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2E3D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2E45 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2E4D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E50 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E54 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E57 _ 89. 04 24
        call    boxfill8                                ; 2E5A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E5F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2E62 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2E65 _ 8B. 45, 10
        sub     eax, 24                                 ; 2E68 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2E6B _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2E6F _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2E77 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2E7B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2E83 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2E8B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E8E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E92 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E95 _ 89. 04 24
        call    boxfill8                                ; 2E98 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E9D _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2EA0 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2EA3 _ 8B. 45, 10
        sub     eax, 24                                 ; 2EA6 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2EA9 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 2EAD _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2EB5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2EB9 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2EC1 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2EC9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2ECC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2ED0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2ED3 _ 89. 04 24
        call    boxfill8                                ; 2ED6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2EDB _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2EDE _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2EE1 _ 8B. 45, 10
        sub     eax, 4                                  ; 2EE4 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 2EE7 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2EEB _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2EF3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2EF7 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 2EFF _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2F07 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F0A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F0E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F11 _ 89. 04 24
        call    boxfill8                                ; 2F14 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2F19 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2F1C _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2F1F _ 8B. 45, 10
        sub     eax, 23                                 ; 2F22 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 2F25 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2F29 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2F31 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 2F35 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 2F3D _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2F45 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F48 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F4C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F4F _ 89. 04 24
        call    boxfill8                                ; 2F52 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2F57 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2F5A _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2F5D _ 8B. 45, 10
        sub     eax, 3                                  ; 2F60 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2F63 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2F67 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2F6F _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2F73 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 2F7B _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2F83 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F86 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F8A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F8D _ 89. 04 24
        call    boxfill8                                ; 2F90 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2F95 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2F98 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2F9B _ 8B. 45, 10
        sub     eax, 24                                 ; 2F9E _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2FA1 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2FA5 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 2FAD _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2FB1 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2FB9 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2FC1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FC4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FC8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FCB _ 89. 04 24
        call    boxfill8                                ; 2FCE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2FD3 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2FD6 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2FD9 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2FDC _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2FDF _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2FE2 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2FE5 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2FE8 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2FEB _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2FEF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2FF3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2FF7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 2FFB _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 3003 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3006 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 300A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 300D _ 89. 04 24
        call    boxfill8                                ; 3010 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3015 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 3018 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 301B _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 301E _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 3021 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 3024 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 3027 _ 8B. 45, 0C
        sub     eax, 47                                 ; 302A _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 302D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3031 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3035 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3039 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 303D _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 3045 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3048 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 304C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 304F _ 89. 04 24
        call    boxfill8                                ; 3052 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3057 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 305A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 305D _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 3060 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 3063 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 3066 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3069 _ 8B. 45, 0C
        sub     eax, 47                                 ; 306C _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 306F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3073 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3077 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 307B _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 307F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 3087 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 308A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 308E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3091 _ 89. 04 24
        call    boxfill8                                ; 3094 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3099 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 309C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 309F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 30A2 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 30A5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 30A8 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 30AB _ 8B. 45, 0C
        sub     eax, 3                                  ; 30AE _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 30B1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 30B5 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 30B9 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 30BD _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 30C1 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 30C9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 30CC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30D3 _ 89. 04 24
        call    boxfill8                                ; 30D6 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 30DB _ 83. C4, 24
        pop     ebx                                     ; 30DE _ 5B
        pop     ebp                                     ; 30DF _ 5D
        ret                                             ; 30E0 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 30E1 _ 55
        mov     ebp, esp                                ; 30E2 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 30E4 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 30E7 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 30EA _ A1, 00000134(d)
        add     eax, edx                                ; 30EF _ 01. D0
        mov     dword [mx], eax                         ; 30F1 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 30F6 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 30F9 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 30FC _ A1, 00000138(d)
        add     eax, edx                                ; 3101 _ 01. D0
        mov     dword [my], eax                         ; 3103 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 3108 _ A1, 00000134(d)
        test    eax, eax                                ; 310D _ 85. C0
        jns     ?_180                                   ; 310F _ 79, 0A
        mov     dword [mx], 0                           ; 3111 _ C7. 05, 00000134(d), 00000000
?_180:  mov     eax, dword [my]                         ; 311B _ A1, 00000138(d)
        test    eax, eax                                ; 3120 _ 85. C0
        jns     ?_181                                   ; 3122 _ 79, 0A
        mov     dword [my], 0                           ; 3124 _ C7. 05, 00000138(d), 00000000
?_181:  mov     eax, dword [xsize]                      ; 312E _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 3133 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 3136 _ A1, 00000134(d)
        cmp     edx, eax                                ; 313B _ 39. C2
        jge     ?_182                                   ; 313D _ 7D, 0D
        mov     eax, dword [xsize]                      ; 313F _ A1, 0000013C(d)
        sub     eax, 1                                  ; 3144 _ 83. E8, 01
        mov     dword [mx], eax                         ; 3147 _ A3, 00000134(d)
?_182:  mov     eax, dword [ysize]                      ; 314C _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 3151 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 3154 _ A1, 00000138(d)
        cmp     edx, eax                                ; 3159 _ 39. C2
        jge     ?_183                                   ; 315B _ 7D, 0D
        mov     eax, dword [ysize]                      ; 315D _ A1, 00000140(d)
        sub     eax, 1                                  ; 3162 _ 83. E8, 01
        mov     dword [my], eax                         ; 3165 _ A3, 00000138(d)
?_183:  pop     ebp                                     ; 316A _ 5D
        ret                                             ; 316B _ C3
; computeMousePosition End of function

showString:; Function begin
        push    ebp                                     ; 316C _ 55
        mov     ebp, esp                                ; 316D _ 89. E5
        push    ebx                                     ; 316F _ 53
        sub     esp, 52                                 ; 3170 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 3173 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 3176 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 3179 _ 83. 7D, 08, 00
        jz      ?_184                                   ; 317D _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 317F _ 83. 7D, 0C, 00
        jnz     ?_185                                   ; 3183 _ 75, 05
?_184:  jmp     ?_188                                   ; 3185 _ E9, 00000095

?_185:  mov     eax, dword [ebp+10H]                    ; 318A _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 318D _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 3190 _ C7. 45, F0, 00000000
        jmp     ?_187                                   ; 3197 _ EB, 4B

?_186:  mov     eax, dword [ebp+1CH]                    ; 3199 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 319C _ 0F B6. 00
        movzx   eax, al                                 ; 319F _ 0F B6. C0
        shl     eax, 4                                  ; 31A2 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 31A5 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 31AB _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 31AF _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 31B2 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 31B5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31B8 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 31BA _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 31BE _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 31C2 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 31C5 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 31C9 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 31CC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 31D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31D4 _ 89. 04 24
        call    showFont8                               ; 31D7 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 31DC _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 31E0 _ 83. 45, 1C, 01
?_187:  mov     eax, dword [ebp+1CH]                    ; 31E4 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 31E7 _ 0F B6. 00
        test    al, al                                  ; 31EA _ 84. C0
        jnz     ?_186                                   ; 31EC _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 31EE _ 8B. 45, 14
        add     eax, 16                                 ; 31F1 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 31F4 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 31F8 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 31FB _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 31FF _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 3202 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3206 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3209 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 320D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3210 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3214 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3217 _ 89. 04 24
        call    sheet_refresh                           ; 321A _ E8, FFFFFFFC(rel)
?_188:  add     esp, 52                                 ; 321F _ 83. C4, 34
        pop     ebx                                     ; 3222 _ 5B
        pop     ebp                                     ; 3223 _ 5D
        ret                                             ; 3224 _ C3
; showString End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 3225 _ 55
        mov     ebp, esp                                ; 3226 _ 89. E5
        sub     esp, 72                                 ; 3228 _ 83. EC, 48
        mov     eax, dword [buf_back]                   ; 322B _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 3230 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 3233 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 3237 _ C7. 45, E8, 00000000
        call    io_sti                                  ; 323E _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 3243 _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 324A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 324F _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 3252 _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 3256 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 325A _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 3261 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 3266 _ 85. C0
        je      ?_200                                   ; 3268 _ 0F 84, 00000386
        mov     dword [esp+8H], mdec                    ; 326E _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 3276 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3279 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 327D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3280 _ 89. 04 24
        call    computeMousePosition                    ; 3283 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 3288 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 328E _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 3293 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 3297 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 329B _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 329E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32A2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32A5 _ 89. 04 24
        call    sheet_slide                             ; 32A8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_451]                      ; 32AD _ A1, 0000010C(d)
        and     eax, 01H                                ; 32B2 _ 83. E0, 01
        test    eax, eax                                ; 32B5 _ 85. C0
        je      ?_199                                   ; 32B7 _ 0F 84, 0000032D
        mov     eax, dword [mmx]                        ; 32BD _ A1, 00000118(d)
        test    eax, eax                                ; 32C2 _ 85. C0
        jns     ?_198                                   ; 32C4 _ 0F 89, 000002AF
        mov     eax, dword [ebp+8H]                     ; 32CA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 32CD _ 8B. 40, 10
        sub     eax, 1                                  ; 32D0 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 32D3 _ 89. 45, F4
        jmp     ?_196                                   ; 32D6 _ E9, 00000290

?_189:  mov     eax, dword [ebp+8H]                     ; 32DB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 32DE _ 8B. 55, F4
        add     edx, 4                                  ; 32E1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 32E4 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 32E8 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 32EB _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 32F1 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 32F4 _ 8B. 40, 0C
        sub     edx, eax                                ; 32F7 _ 29. C2
        mov     eax, edx                                ; 32F9 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 32FB _ 89. 45, E4
        mov     edx, dword [my]                         ; 32FE _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 3304 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 3307 _ 8B. 40, 10
        sub     edx, eax                                ; 330A _ 29. C2
        mov     eax, edx                                ; 330C _ 89. D0
        mov     dword [ebp-20H], eax                    ; 330E _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 3311 _ 83. 7D, E4, 00
        js      ?_195                                   ; 3315 _ 0F 88, 0000024C
        mov     eax, dword [ebp-18H]                    ; 331B _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 331E _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 3321 _ 3B. 45, E4
        jle     ?_195                                   ; 3324 _ 0F 8E, 0000023D
        cmp     dword [ebp-20H], 0                      ; 332A _ 83. 7D, E0, 00
        js      ?_195                                   ; 332E _ 0F 88, 00000233
        mov     eax, dword [ebp-18H]                    ; 3334 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 3337 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 333A _ 3B. 45, E0
        jle     ?_195                                   ; 333D _ 0F 8E, 00000224
        mov     eax, dword [ebp-18H]                    ; 3343 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 3346 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 3348 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 334B _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 334E _ 0F AF. 45, E0
        mov     ecx, eax                                ; 3352 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 3354 _ 8B. 45, E4
        add     eax, ecx                                ; 3357 _ 01. C8
        add     eax, edx                                ; 3359 _ 01. D0
        movzx   eax, byte [eax]                         ; 335B _ 0F B6. 00
        movzx   edx, al                                 ; 335E _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 3361 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 3364 _ 8B. 40, 14
        cmp     edx, eax                                ; 3367 _ 39. C2
        je      ?_195                                   ; 3369 _ 0F 84, 000001F8
        mov     eax, dword [current_console_task]       ; 336F _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3374 _ 8B. 80, 000000B4
        test    eax, eax                                ; 337A _ 85. C0
        jz      ?_190                                   ; 337C _ 74, 68
        mov     eax, dword [current_console_task]       ; 337E _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3383 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 0                      ; 3389 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 3391 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 3399 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 339D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33A0 _ 89. 04 24
        call    make_wtitle8                            ; 33A3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 33A8 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 33AB _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 33AE _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 33B1 _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 33B4 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 33B9 _ 8B. 80, 000000B4
        mov     dword [esp+14H], ecx                    ; 33BF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 33C3 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 33C7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 33CF _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 33D7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33DB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33DE _ 89. 04 24
        call    sheet_refresh                           ; 33E1 _ E8, FFFFFFFC(rel)
?_190:  mov     eax, dword [ebp-18H]                    ; 33E6 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 33E9 _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 33EC _ A3, 00000278(d)
        mov     eax, dword [current_console_task]       ; 33F1 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 33F6 _ 8B. 80, 000000B4
        test    eax, eax                                ; 33FC _ 85. C0
        jnz     ?_191                                   ; 33FE _ 75, 32
        mov     dword [esp+14H], ?_436                  ; 3400 _ C7. 44 24, 14, 00000066(d)
        mov     dword [esp+10H], 7                      ; 3408 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 96                     ; 3410 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 0                       ; 3418 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 3420 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3423 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3427 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 342A _ 89. 04 24
        call    showString                              ; 342D _ E8, FFFFFFFC(rel)
?_191:  mov     eax, dword [current_console_task]       ; 3432 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3437 _ 8B. 80, 000000B4
        test    eax, eax                                ; 343D _ 85. C0
        jz      ?_192                                   ; 343F _ 74, 60
        mov     eax, dword [current_console_task]       ; 3441 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3446 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 1                      ; 344C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_420                   ; 3454 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 345C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3460 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3463 _ 89. 04 24
        call    make_wtitle8                            ; 3466 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 346B _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 346E _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 3471 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 3474 _ 8B. 40, 04
        mov     dword [esp+14H], edx                    ; 3477 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 347B _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 347F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3487 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 348F _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3492 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3496 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3499 _ 89. 04 24
        call    sheet_refresh                           ; 349C _ E8, FFFFFFFC(rel)
?_192:  mov     eax, dword [ebp+8H]                     ; 34A1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 34A4 _ 8B. 40, 10
        sub     eax, 1                                  ; 34A7 _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 34AA _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 34AE _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 34B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 34B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 34B8 _ 89. 04 24
        call    sheet_updown                            ; 34BB _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 34C0 _ 83. 7D, E4, 02
        jle     ?_193                                   ; 34C4 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 34C6 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 34C9 _ 8B. 40, 04
        sub     eax, 3                                  ; 34CC _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 34CF _ 3B. 45, E4
        jle     ?_193                                   ; 34D2 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 34D4 _ 83. 7D, E0, 02
        jle     ?_193                                   ; 34D8 _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 34DA _ 83. 7D, E0, 14
        jg      ?_193                                   ; 34DE _ 7F, 1C
        mov     eax, dword [mx]                         ; 34E0 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 34E5 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 34EA _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 34EF _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 34F4 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 34F7 _ A3, 00000270(d)
?_193:  mov     eax, dword [ebp-18H]                    ; 34FC _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 34FF _ 8B. 40, 04
        sub     eax, 21                                 ; 3502 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 3505 _ 3B. 45, E4
        jg      ?_194                                   ; 3508 _ 7F, 5B
        mov     eax, dword [ebp-18H]                    ; 350A _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 350D _ 8B. 40, 04
        sub     eax, 5                                  ; 3510 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 3513 _ 3B. 45, E4
        jle     ?_194                                   ; 3516 _ 7E, 4D
        cmp     dword [ebp-20H], 4                      ; 3518 _ 83. 7D, E0, 04
        jle     ?_194                                   ; 351C _ 7E, 47
        cmp     dword [ebp-20H], 18                     ; 351E _ 83. 7D, E0, 12
        jg      ?_194                                   ; 3522 _ 7F, 41
        mov     eax, dword [ebp-18H]                    ; 3524 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 3527 _ 8B. 40, 20
        test    eax, eax                                ; 352A _ 85. C0
        jz      ?_194                                   ; 352C _ 74, 37
        call    io_cli                                  ; 352E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 3533 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3536 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 353A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 353D _ 89. 04 24
        call    sheet_free                              ; 3540 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 3545 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 354A _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 354D _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 3550 _ 8B. 40, 20
        mov     edx, kill_process                       ; 3553 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 3558 _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 355B _ 89. 50, 4C
        call    io_sti                                  ; 355E _ E8, FFFFFFFC(rel)
        jmp     ?_197                                   ; 3563 _ EB, 12

?_194:  jmp     ?_197                                   ; 3565 _ EB, 10

?_195:  sub     dword [ebp-0CH], 1                      ; 3567 _ 83. 6D, F4, 01
?_196:  cmp     dword [ebp-0CH], 0                      ; 356B _ 83. 7D, F4, 00
        jg      ?_189                                   ; 356F _ 0F 8F, FFFFFD66
        jmp     ?_200                                   ; 3575 _ EB, 7D

?_197:  jmp     ?_200                                   ; 3577 _ EB, 7B

?_198:  mov     edx, dword [mx]                         ; 3579 _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 357F _ A1, 00000118(d)
        sub     edx, eax                                ; 3584 _ 29. C2
        mov     eax, edx                                ; 3586 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 3588 _ 89. 45, E4
        mov     edx, dword [my]                         ; 358B _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 3591 _ A1, 0000011C(d)
        sub     edx, eax                                ; 3596 _ 29. C2
        mov     eax, edx                                ; 3598 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 359A _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 359D _ A1, 00000270(d)
        mov     edx, dword [eax+10H]                    ; 35A2 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 35A5 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 35A8 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 35AB _ A1, 00000270(d)
        mov     edx, dword [eax+0CH]                    ; 35B0 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 35B3 _ 8B. 45, E4
        add     edx, eax                                ; 35B6 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 35B8 _ A1, 00000270(d)
        mov     dword [esp+0CH], ecx                    ; 35BD _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 35C1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 35C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35CC _ 89. 04 24
        call    sheet_slide                             ; 35CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 35D4 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 35D9 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 35DE _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 35E3 _ A3, 0000011C(d)
        jmp     ?_200                                   ; 35E8 _ EB, 0A

?_199:  mov     dword [mmx], -1                         ; 35EA _ C7. 05, 00000118(d), FFFFFFFF
?_200:  leave                                           ; 35F4 _ C9
        ret                                             ; 35F5 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 35F6 _ 55
        mov     ebp, esp                                ; 35F7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 35F9 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 35FC _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 3602 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 3605 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 360B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 360E _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 3614 _ 5D
        ret                                             ; 3615 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 3616 _ 55
        mov     ebp, esp                                ; 3617 _ 89. E5
        sub     esp, 696                                ; 3619 _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2132          ; 361F _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 3627 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 362F _ C7. 04 24, 00000000
        call    set_palette                             ; 3636 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 363B _ C7. 45, EC, 00000000
        jmp     ?_206                                   ; 3642 _ E9, 000000EF

?_201:  mov     dword [ebp-10H], 0                      ; 3647 _ C7. 45, F0, 00000000
        jmp     ?_205                                   ; 364E _ E9, 000000D5

?_202:  mov     dword [ebp-0CH], 0                      ; 3653 _ C7. 45, F4, 00000000
        jmp     ?_204                                   ; 365A _ E9, 000000BB

?_203:  mov     edx, dword [ebp-10H]                    ; 365F _ 8B. 55, F0
        mov     eax, edx                                ; 3662 _ 89. D0
        add     eax, eax                                ; 3664 _ 01. C0
        add     eax, edx                                ; 3666 _ 01. D0
        add     eax, eax                                ; 3668 _ 01. C0
        mov     edx, eax                                ; 366A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 366C _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 366F _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3672 _ 8B. 55, EC
        mov     eax, edx                                ; 3675 _ 89. D0
        shl     eax, 3                                  ; 3677 _ C1. E0, 03
        add     eax, edx                                ; 367A _ 01. D0
        shl     eax, 2                                  ; 367C _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 367F _ 8D. 14 01
        mov     eax, edx                                ; 3682 _ 89. D0
        add     eax, eax                                ; 3684 _ 01. C0
        add     edx, eax                                ; 3686 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 3688 _ 8B. 45, F4
        mov     ecx, 51                                 ; 368B _ B9, 00000033
        imul    eax, ecx                                ; 3690 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3693 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 369A _ 8B. 55, F0
        mov     eax, edx                                ; 369D _ 89. D0
        add     eax, eax                                ; 369F _ 01. C0
        add     eax, edx                                ; 36A1 _ 01. D0
        add     eax, eax                                ; 36A3 _ 01. C0
        mov     edx, eax                                ; 36A5 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 36A7 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 36AA _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 36AD _ 8B. 55, EC
        mov     eax, edx                                ; 36B0 _ 89. D0
        shl     eax, 3                                  ; 36B2 _ C1. E0, 03
        add     eax, edx                                ; 36B5 _ 01. D0
        shl     eax, 2                                  ; 36B7 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 36BA _ 8D. 14 01
        mov     eax, edx                                ; 36BD _ 89. D0
        add     eax, eax                                ; 36BF _ 01. C0
        add     eax, edx                                ; 36C1 _ 01. D0
        lea     edx, [eax+1H]                           ; 36C3 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 36C6 _ 8B. 45, F0
        mov     ecx, 51                                 ; 36C9 _ B9, 00000033
        imul    eax, ecx                                ; 36CE _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 36D1 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 36D8 _ 8B. 55, F0
        mov     eax, edx                                ; 36DB _ 89. D0
        add     eax, eax                                ; 36DD _ 01. C0
        add     eax, edx                                ; 36DF _ 01. D0
        add     eax, eax                                ; 36E1 _ 01. C0
        mov     edx, eax                                ; 36E3 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 36E5 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 36E8 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 36EB _ 8B. 55, EC
        mov     eax, edx                                ; 36EE _ 89. D0
        shl     eax, 3                                  ; 36F0 _ C1. E0, 03
        add     eax, edx                                ; 36F3 _ 01. D0
        shl     eax, 2                                  ; 36F5 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 36F8 _ 8D. 14 01
        mov     eax, edx                                ; 36FB _ 89. D0
        add     eax, eax                                ; 36FD _ 01. C0
        add     eax, edx                                ; 36FF _ 01. D0
        lea     edx, [eax+2H]                           ; 3701 _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 3704 _ 8B. 45, EC
        mov     ecx, 51                                 ; 3707 _ B9, 00000033
        imul    eax, ecx                                ; 370C _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 370F _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 3716 _ 83. 45, F4, 01
?_204:  cmp     dword [ebp-0CH], 5                      ; 371A _ 83. 7D, F4, 05
        jle     ?_203                                   ; 371E _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 3724 _ 83. 45, F0, 01
?_205:  cmp     dword [ebp-10H], 5                      ; 3728 _ 83. 7D, F0, 05
        jle     ?_202                                   ; 372C _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 3732 _ 83. 45, EC, 01
?_206:  cmp     dword [ebp-14H], 5                      ; 3736 _ 83. 7D, EC, 05
        jle     ?_201                                   ; 373A _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 3740 _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 3746 _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 374A _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 3752 _ C7. 04 24, 00000010
        call    set_palette                             ; 3759 _ E8, FFFFFFFC(rel)
        nop                                             ; 375E _ 90
        leave                                           ; 375F _ C9
        ret                                             ; 3760 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 3761 _ 55
        mov     ebp, esp                                ; 3762 _ 89. E5
        sub     esp, 40                                 ; 3764 _ 83. EC, 28
        call    io_load_eflags                          ; 3767 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 376C _ 89. 45, F0
        call    io_cli                                  ; 376F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3774 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 3777 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 377B _ C7. 04 24, 000003C8
        call    io_out8                                 ; 3782 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3787 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 378A _ 89. 45, F4
        jmp     ?_208                                   ; 378D _ EB, 62

?_207:  mov     eax, dword [ebp+10H]                    ; 378F _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 3792 _ 0F B6. 00
        shr     al, 2                                   ; 3795 _ C0. E8, 02
        movzx   eax, al                                 ; 3798 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 379B _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 379F _ C7. 04 24, 000003C9
        call    io_out8                                 ; 37A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 37AB _ 8B. 45, 10
        add     eax, 1                                  ; 37AE _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 37B1 _ 0F B6. 00
        shr     al, 2                                   ; 37B4 _ C0. E8, 02
        movzx   eax, al                                 ; 37B7 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 37BA _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 37BE _ C7. 04 24, 000003C9
        call    io_out8                                 ; 37C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 37CA _ 8B. 45, 10
        add     eax, 2                                  ; 37CD _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 37D0 _ 0F B6. 00
        shr     al, 2                                   ; 37D3 _ C0. E8, 02
        movzx   eax, al                                 ; 37D6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 37D9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 37DD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 37E4 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 37E9 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 37ED _ 83. 45, F4, 01
?_208:  mov     eax, dword [ebp-0CH]                    ; 37F1 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 37F4 _ 3B. 45, 0C
        jle     ?_207                                   ; 37F7 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 37F9 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 37FC _ 89. 04 24
        call    io_store_eflags                         ; 37FF _ E8, FFFFFFFC(rel)
        nop                                             ; 3804 _ 90
        leave                                           ; 3805 _ C9
        ret                                             ; 3806 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 3807 _ 55
        mov     ebp, esp                                ; 3808 _ 89. E5
        sub     esp, 20                                 ; 380A _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 380D _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 3810 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 3813 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 3816 _ 89. 45, F8
        jmp     ?_212                                   ; 3819 _ EB, 33

?_209:  mov     eax, dword [ebp+14H]                    ; 381B _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 381E _ 89. 45, FC
        jmp     ?_211                                   ; 3821 _ EB, 1F

?_210:  mov     eax, dword [ebp-8H]                     ; 3823 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 3826 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 382A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 382C _ 8B. 45, FC
        add     eax, edx                                ; 382F _ 01. D0
        mov     edx, eax                                ; 3831 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3833 _ 8B. 45, 08
        add     edx, eax                                ; 3836 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3838 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 383C _ 88. 02
        add     dword [ebp-4H], 1                       ; 383E _ 83. 45, FC, 01
?_211:  mov     eax, dword [ebp-4H]                     ; 3842 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 3845 _ 3B. 45, 1C
        jle     ?_210                                   ; 3848 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 384A _ 83. 45, F8, 01
?_212:  mov     eax, dword [ebp-8H]                     ; 384E _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 3851 _ 3B. 45, 20
        jle     ?_209                                   ; 3854 _ 7E, C5
        leave                                           ; 3856 _ C9
        ret                                             ; 3857 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 3858 _ 55
        mov     ebp, esp                                ; 3859 _ 89. E5
        sub     esp, 20                                 ; 385B _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 385E _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 3861 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3864 _ C7. 45, FC, 00000000
        jmp     ?_222                                   ; 386B _ E9, 0000016C

?_213:  mov     edx, dword [ebp-4H]                     ; 3870 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 3873 _ 8B. 45, 1C
        add     eax, edx                                ; 3876 _ 01. D0
        movzx   eax, byte [eax]                         ; 3878 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 387B _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 387E _ 80. 7D, FB, 00
        jns     ?_214                                   ; 3882 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 3884 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3887 _ 8B. 55, 14
        add     eax, edx                                ; 388A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 388C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3890 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3892 _ 8B. 45, 10
        add     eax, edx                                ; 3895 _ 01. D0
        mov     edx, eax                                ; 3897 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3899 _ 8B. 45, 08
        add     edx, eax                                ; 389C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 389E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 38A2 _ 88. 02
?_214:  movsx   eax, byte [ebp-5H]                      ; 38A4 _ 0F BE. 45, FB
        and     eax, 40H                                ; 38A8 _ 83. E0, 40
        test    eax, eax                                ; 38AB _ 85. C0
        jz      ?_215                                   ; 38AD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 38AF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 38B2 _ 8B. 55, 14
        add     eax, edx                                ; 38B5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 38B7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 38BB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 38BD _ 8B. 45, 10
        add     eax, edx                                ; 38C0 _ 01. D0
        lea     edx, [eax+1H]                           ; 38C2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 38C5 _ 8B. 45, 08
        add     edx, eax                                ; 38C8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 38CA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 38CE _ 88. 02
?_215:  movsx   eax, byte [ebp-5H]                      ; 38D0 _ 0F BE. 45, FB
        and     eax, 20H                                ; 38D4 _ 83. E0, 20
        test    eax, eax                                ; 38D7 _ 85. C0
        jz      ?_216                                   ; 38D9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 38DB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 38DE _ 8B. 55, 14
        add     eax, edx                                ; 38E1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 38E3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 38E7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 38E9 _ 8B. 45, 10
        add     eax, edx                                ; 38EC _ 01. D0
        lea     edx, [eax+2H]                           ; 38EE _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 38F1 _ 8B. 45, 08
        add     edx, eax                                ; 38F4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 38F6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 38FA _ 88. 02
?_216:  movsx   eax, byte [ebp-5H]                      ; 38FC _ 0F BE. 45, FB
        and     eax, 10H                                ; 3900 _ 83. E0, 10
        test    eax, eax                                ; 3903 _ 85. C0
        jz      ?_217                                   ; 3905 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3907 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 390A _ 8B. 55, 14
        add     eax, edx                                ; 390D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 390F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3913 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3915 _ 8B. 45, 10
        add     eax, edx                                ; 3918 _ 01. D0
        lea     edx, [eax+3H]                           ; 391A _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 391D _ 8B. 45, 08
        add     edx, eax                                ; 3920 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3922 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3926 _ 88. 02
?_217:  movsx   eax, byte [ebp-5H]                      ; 3928 _ 0F BE. 45, FB
        and     eax, 08H                                ; 392C _ 83. E0, 08
        test    eax, eax                                ; 392F _ 85. C0
        jz      ?_218                                   ; 3931 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3933 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3936 _ 8B. 55, 14
        add     eax, edx                                ; 3939 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 393B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 393F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3941 _ 8B. 45, 10
        add     eax, edx                                ; 3944 _ 01. D0
        lea     edx, [eax+4H]                           ; 3946 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3949 _ 8B. 45, 08
        add     edx, eax                                ; 394C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 394E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3952 _ 88. 02
?_218:  movsx   eax, byte [ebp-5H]                      ; 3954 _ 0F BE. 45, FB
        and     eax, 04H                                ; 3958 _ 83. E0, 04
        test    eax, eax                                ; 395B _ 85. C0
        jz      ?_219                                   ; 395D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 395F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3962 _ 8B. 55, 14
        add     eax, edx                                ; 3965 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3967 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 396B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 396D _ 8B. 45, 10
        add     eax, edx                                ; 3970 _ 01. D0
        lea     edx, [eax+5H]                           ; 3972 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 3975 _ 8B. 45, 08
        add     edx, eax                                ; 3978 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 397A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 397E _ 88. 02
?_219:  movsx   eax, byte [ebp-5H]                      ; 3980 _ 0F BE. 45, FB
        and     eax, 02H                                ; 3984 _ 83. E0, 02
        test    eax, eax                                ; 3987 _ 85. C0
        jz      ?_220                                   ; 3989 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 398B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 398E _ 8B. 55, 14
        add     eax, edx                                ; 3991 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3993 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3997 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3999 _ 8B. 45, 10
        add     eax, edx                                ; 399C _ 01. D0
        lea     edx, [eax+6H]                           ; 399E _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 39A1 _ 8B. 45, 08
        add     edx, eax                                ; 39A4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 39A6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 39AA _ 88. 02
?_220:  movsx   eax, byte [ebp-5H]                      ; 39AC _ 0F BE. 45, FB
        and     eax, 01H                                ; 39B0 _ 83. E0, 01
        test    eax, eax                                ; 39B3 _ 85. C0
        jz      ?_221                                   ; 39B5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 39B7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 39BA _ 8B. 55, 14
        add     eax, edx                                ; 39BD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 39BF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 39C3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 39C5 _ 8B. 45, 10
        add     eax, edx                                ; 39C8 _ 01. D0
        lea     edx, [eax+7H]                           ; 39CA _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 39CD _ 8B. 45, 08
        add     edx, eax                                ; 39D0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 39D2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 39D6 _ 88. 02
?_221:  add     dword [ebp-4H], 1                       ; 39D8 _ 83. 45, FC, 01
?_222:  cmp     dword [ebp-4H], 15                      ; 39DC _ 83. 7D, FC, 0F
        jle     ?_213                                   ; 39E0 _ 0F 8E, FFFFFE8A
        leave                                           ; 39E6 _ C9
        ret                                             ; 39E7 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 39E8 _ 55
        mov     ebp, esp                                ; 39E9 _ 89. E5
        sub     esp, 20                                 ; 39EB _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 39EE _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 39F1 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 39F4 _ C7. 45, F8, 00000000
        jmp     ?_229                                   ; 39FB _ E9, 000000B1

?_223:  mov     dword [ebp-4H], 0                       ; 3A00 _ C7. 45, FC, 00000000
        jmp     ?_228                                   ; 3A07 _ E9, 00000097

?_224:  mov     eax, dword [ebp-8H]                     ; 3A0C _ 8B. 45, F8
        shl     eax, 4                                  ; 3A0F _ C1. E0, 04
        mov     edx, eax                                ; 3A12 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A14 _ 8B. 45, FC
        add     eax, edx                                ; 3A17 _ 01. D0
        add     eax, cursor.2192                        ; 3A19 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3A1E _ 0F B6. 00
        cmp     al, 42                                  ; 3A21 _ 3C, 2A
        jnz     ?_225                                   ; 3A23 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3A25 _ 8B. 45, F8
        shl     eax, 4                                  ; 3A28 _ C1. E0, 04
        mov     edx, eax                                ; 3A2B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A2D _ 8B. 45, FC
        add     eax, edx                                ; 3A30 _ 01. D0
        mov     edx, eax                                ; 3A32 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A34 _ 8B. 45, 08
        add     eax, edx                                ; 3A37 _ 01. D0
        mov     byte [eax], 0                           ; 3A39 _ C6. 00, 00
?_225:  mov     eax, dword [ebp-8H]                     ; 3A3C _ 8B. 45, F8
        shl     eax, 4                                  ; 3A3F _ C1. E0, 04
        mov     edx, eax                                ; 3A42 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A44 _ 8B. 45, FC
        add     eax, edx                                ; 3A47 _ 01. D0
        add     eax, cursor.2192                        ; 3A49 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3A4E _ 0F B6. 00
        cmp     al, 79                                  ; 3A51 _ 3C, 4F
        jnz     ?_226                                   ; 3A53 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3A55 _ 8B. 45, F8
        shl     eax, 4                                  ; 3A58 _ C1. E0, 04
        mov     edx, eax                                ; 3A5B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A5D _ 8B. 45, FC
        add     eax, edx                                ; 3A60 _ 01. D0
        mov     edx, eax                                ; 3A62 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A64 _ 8B. 45, 08
        add     eax, edx                                ; 3A67 _ 01. D0
        mov     byte [eax], 7                           ; 3A69 _ C6. 00, 07
?_226:  mov     eax, dword [ebp-8H]                     ; 3A6C _ 8B. 45, F8
        shl     eax, 4                                  ; 3A6F _ C1. E0, 04
        mov     edx, eax                                ; 3A72 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A74 _ 8B. 45, FC
        add     eax, edx                                ; 3A77 _ 01. D0
        add     eax, cursor.2192                        ; 3A79 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3A7E _ 0F B6. 00
        cmp     al, 46                                  ; 3A81 _ 3C, 2E
        jnz     ?_227                                   ; 3A83 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 3A85 _ 8B. 45, F8
        shl     eax, 4                                  ; 3A88 _ C1. E0, 04
        mov     edx, eax                                ; 3A8B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A8D _ 8B. 45, FC
        add     eax, edx                                ; 3A90 _ 01. D0
        mov     edx, eax                                ; 3A92 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A94 _ 8B. 45, 08
        add     edx, eax                                ; 3A97 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3A99 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3A9D _ 88. 02
?_227:  add     dword [ebp-4H], 1                       ; 3A9F _ 83. 45, FC, 01
?_228:  cmp     dword [ebp-4H], 15                      ; 3AA3 _ 83. 7D, FC, 0F
        jle     ?_224                                   ; 3AA7 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 3AAD _ 83. 45, F8, 01
?_229:  cmp     dword [ebp-8H], 15                      ; 3AB1 _ 83. 7D, F8, 0F
        jle     ?_223                                   ; 3AB5 _ 0F 8E, FFFFFF45
        leave                                           ; 3ABB _ C9
        ret                                             ; 3ABC _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 3ABD _ 55
        mov     ebp, esp                                ; 3ABE _ 89. E5
        sub     esp, 16                                 ; 3AC0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3AC3 _ C7. 45, F8, 00000000
        jmp     ?_233                                   ; 3ACA _ EB, 50

?_230:  mov     dword [ebp-4H], 0                       ; 3ACC _ C7. 45, FC, 00000000
        jmp     ?_232                                   ; 3AD3 _ EB, 3B

?_231:  mov     eax, dword [ebp-8H]                     ; 3AD5 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 3AD8 _ 8B. 55, 1C
        add     eax, edx                                ; 3ADB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3ADD _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 3AE1 _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 3AE4 _ 8B. 4D, 18
        add     edx, ecx                                ; 3AE7 _ 01. CA
        add     eax, edx                                ; 3AE9 _ 01. D0
        mov     edx, eax                                ; 3AEB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3AED _ 8B. 45, 08
        add     edx, eax                                ; 3AF0 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3AF2 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 3AF5 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 3AF9 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3AFB _ 8B. 45, FC
        add     eax, ecx                                ; 3AFE _ 01. C8
        mov     ecx, eax                                ; 3B00 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3B02 _ 8B. 45, 20
        add     eax, ecx                                ; 3B05 _ 01. C8
        movzx   eax, byte [eax]                         ; 3B07 _ 0F B6. 00
        mov     byte [edx], al                          ; 3B0A _ 88. 02
        add     dword [ebp-4H], 1                       ; 3B0C _ 83. 45, FC, 01
?_232:  mov     eax, dword [ebp-4H]                     ; 3B10 _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 3B13 _ 3B. 45, 10
        jl      ?_231                                   ; 3B16 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 3B18 _ 83. 45, F8, 01
?_233:  mov     eax, dword [ebp-8H]                     ; 3B1C _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 3B1F _ 3B. 45, 14
        jl      ?_230                                   ; 3B22 _ 7C, A8
        leave                                           ; 3B24 _ C9
        ret                                             ; 3B25 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 3B26 _ 55
        mov     ebp, esp                                ; 3B27 _ 89. E5
        sub     esp, 40                                 ; 3B29 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 3B2C _ A1, 00000014(d)
        mov     dword [ebp-0CH], eax                    ; 3B31 _ 89. 45, F4
        movzx   eax, word [?_448]                       ; 3B34 _ 0F B7. 05, 00000018(d)
        cwde                                            ; 3B3B _ 98
        mov     dword [ebp-10H], eax                    ; 3B3C _ 89. 45, F0
        movzx   eax, word [?_449]                       ; 3B3F _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 3B46 _ 98
        mov     dword [ebp-14H], eax                    ; 3B47 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 3B4A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3B52 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3B59 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 3B5E _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 3B62 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3B69 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 3B6E _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 3B71 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 3B75 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 3B79 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 3B80 _ E8, FFFFFFFC(rel)
        nop                                             ; 3B85 _ 90
        leave                                           ; 3B86 _ C9
        ret                                             ; 3B87 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 3B88 _ 55
        mov     ebp, esp                                ; 3B89 _ 89. E5
        sub     esp, 4                                  ; 3B8B _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 3B8E _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 3B91 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3B94 _ 80. 7D, FC, 09
        jle     ?_234                                   ; 3B98 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 3B9A _ 0F B6. 45, FC
        add     eax, 55                                 ; 3B9E _ 83. C0, 37
        jmp     ?_235                                   ; 3BA1 _ EB, 07

?_234:  movzx   eax, byte [ebp-4H]                      ; 3BA3 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3BA7 _ 83. C0, 30
?_235:  leave                                           ; 3BAA _ C9
        ret                                             ; 3BAB _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 3BAC _ 55
        mov     ebp, esp                                ; 3BAD _ 89. E5
        sub     esp, 24                                 ; 3BAF _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3BB2 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3BB5 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3BB8 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3BBF _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3BC3 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3BC6 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3BC9 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 3BCD _ 89. 04 24
        call    charToHexVal                            ; 3BD0 _ E8, FFFFFFFC(rel)
        mov     byte [?_447], al                        ; 3BD5 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 3BDA _ 0F B6. 45, EC
        shr     al, 4                                   ; 3BDE _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3BE1 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3BE4 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3BE8 _ 0F BE. C0
        mov     dword [esp], eax                        ; 3BEB _ 89. 04 24
        call    charToHexVal                            ; 3BEE _ E8, FFFFFFFC(rel)
        mov     byte [?_446], al                        ; 3BF3 _ A2, 00000112(d)
        mov     eax, keyval                             ; 3BF8 _ B8, 00000110(d)
        leave                                           ; 3BFD _ C9
        ret                                             ; 3BFE _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3BFF _ 55
        mov     ebp, esp                                ; 3C00 _ 89. E5
        sub     esp, 16                                 ; 3C02 _ 83. EC, 10
        mov     byte [str.2240], 48                     ; 3C05 _ C6. 05, 00000374(d), 30
        mov     byte [?_452], 88                        ; 3C0C _ C6. 05, 00000375(d), 58
        mov     byte [?_453], 0                         ; 3C13 _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 3C1A _ C7. 45, FC, 00000002
        jmp     ?_237                                   ; 3C21 _ EB, 0F

?_236:  mov     eax, dword [ebp-4H]                     ; 3C23 _ 8B. 45, FC
        add     eax, str.2240                           ; 3C26 _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 3C2B _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 3C2E _ 83. 45, FC, 01
?_237:  cmp     dword [ebp-4H], 9                       ; 3C32 _ 83. 7D, FC, 09
        jle     ?_236                                   ; 3C36 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3C38 _ C7. 45, F8, 00000009
        jmp     ?_241                                   ; 3C3F _ EB, 40

?_238:  mov     eax, dword [ebp+8H]                     ; 3C41 _ 8B. 45, 08
        and     eax, 0FH                                ; 3C44 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 3C47 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3C4A _ 8B. 45, 08
        shr     eax, 4                                  ; 3C4D _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3C50 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 3C53 _ 83. 7D, F4, 09
        jle     ?_239                                   ; 3C57 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 3C59 _ 8B. 45, F4
        add     eax, 55                                 ; 3C5C _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3C5F _ 8B. 55, F8
        add     edx, str.2240                           ; 3C62 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 3C68 _ 88. 02
        jmp     ?_240                                   ; 3C6A _ EB, 11

?_239:  mov     eax, dword [ebp-0CH]                    ; 3C6C _ 8B. 45, F4
        add     eax, 48                                 ; 3C6F _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 3C72 _ 8B. 55, F8
        add     edx, str.2240                           ; 3C75 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 3C7B _ 88. 02
?_240:  sub     dword [ebp-8H], 1                       ; 3C7D _ 83. 6D, F8, 01
?_241:  cmp     dword [ebp-8H], 1                       ; 3C81 _ 83. 7D, F8, 01
        jle     ?_242                                   ; 3C85 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 3C87 _ 83. 7D, 08, 00
        jnz     ?_238                                   ; 3C8B _ 75, B4
?_242:  mov     eax, str.2240                           ; 3C8D _ B8, 00000374(d)
        leave                                           ; 3C92 _ C9
        ret                                             ; 3C93 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3C94 _ 55
        mov     ebp, esp                                ; 3C95 _ 89. E5
        sub     esp, 24                                 ; 3C97 _ 83. EC, 18
?_243:  mov     dword [esp], 100                        ; 3C9A _ C7. 04 24, 00000064
        call    io_in8                                  ; 3CA1 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 3CA6 _ 83. E0, 02
        test    eax, eax                                ; 3CA9 _ 85. C0
        jnz     ?_244                                   ; 3CAB _ 75, 02
        jmp     ?_245                                   ; 3CAD _ EB, 02

?_244:  jmp     ?_243                                   ; 3CAF _ EB, E9

?_245:  leave                                           ; 3CB1 _ C9
        ret                                             ; 3CB2 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3CB3 _ 55
        mov     ebp, esp                                ; 3CB4 _ 89. E5
        sub     esp, 24                                 ; 3CB6 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3CB9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 3CBE _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 3CC6 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3CCD _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3CD2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3CD7 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 3CDF _ C7. 04 24, 00000060
        call    io_out8                                 ; 3CE6 _ E8, FFFFFFFC(rel)
        nop                                             ; 3CEB _ 90
        leave                                           ; 3CEC _ C9
        ret                                             ; 3CED _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3CEE _ 55
        mov     ebp, esp                                ; 3CEF _ 89. E5
        sub     esp, 24                                 ; 3CF1 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3CF4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3CF9 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3D01 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3D08 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3D0D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3D12 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3D1A _ C7. 04 24, 00000060
        call    io_out8                                 ; 3D21 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3D26 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3D29 _ C6. 40, 03, 00
        nop                                             ; 3D2D _ 90
        leave                                           ; 3D2E _ C9
        ret                                             ; 3D2F _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 3D30 _ 55
        mov     ebp, esp                                ; 3D31 _ 89. E5
        sub     esp, 40                                 ; 3D33 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3D36 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3D3E _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3D45 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3D4A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3D52 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3D59 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3D5E _ C7. 04 24, 00000060
        call    io_in8                                  ; 3D65 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3D6A _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3D6D _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 3D71 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3D75 _ C7. 04 24, 00000038(d)
        call    fifo8_put                               ; 3D7C _ E8, FFFFFFFC(rel)
        leave                                           ; 3D81 _ C9
        ret                                             ; 3D82 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 3D83 _ 55
        mov     ebp, esp                                ; 3D84 _ 89. E5
        sub     esp, 4                                  ; 3D86 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3D89 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3D8C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3D8F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3D92 _ 0F B6. 40, 03
        test    al, al                                  ; 3D96 _ 84. C0
        jnz     ?_247                                   ; 3D98 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3D9A _ 80. 7D, FC, FA
        jnz     ?_246                                   ; 3D9E _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 3DA0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3DA3 _ C6. 40, 03, 01
?_246:  mov     eax, 0                                  ; 3DA7 _ B8, 00000000
        jmp     ?_254                                   ; 3DAC _ E9, 0000010F

?_247:  mov     eax, dword [ebp+8H]                     ; 3DB1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3DB4 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3DB8 _ 3C, 01
        jnz     ?_249                                   ; 3DBA _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3DBC _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3DC0 _ 25, 000000C8
        cmp     eax, 8                                  ; 3DC5 _ 83. F8, 08
        jnz     ?_248                                   ; 3DC8 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3DCA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3DCD _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 3DD1 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3DD3 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3DD6 _ C6. 40, 03, 02
?_248:  mov     eax, 0                                  ; 3DDA _ B8, 00000000
        jmp     ?_254                                   ; 3DDF _ E9, 000000DC

?_249:  mov     eax, dword [ebp+8H]                     ; 3DE4 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3DE7 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3DEB _ 3C, 02
        jnz     ?_250                                   ; 3DED _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3DEF _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3DF2 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3DF6 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3DF9 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3DFC _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3E00 _ B8, 00000000
        jmp     ?_254                                   ; 3E05 _ E9, 000000B6

?_250:  mov     eax, dword [ebp+8H]                     ; 3E0A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3E0D _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3E11 _ 3C, 03
        jne     ?_253                                   ; 3E13 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3E19 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3E1C _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3E20 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3E23 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3E26 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3E2A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3E2D _ 0F B6. 00
        movzx   eax, al                                 ; 3E30 _ 0F B6. C0
        and     eax, 07H                                ; 3E33 _ 83. E0, 07
        mov     edx, eax                                ; 3E36 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E38 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3E3B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3E3E _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3E41 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3E45 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3E48 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3E4B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E4E _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3E51 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3E55 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3E58 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3E5B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3E5E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3E61 _ 0F B6. 00
        movzx   eax, al                                 ; 3E64 _ 0F B6. C0
        and     eax, 10H                                ; 3E67 _ 83. E0, 10
        test    eax, eax                                ; 3E6A _ 85. C0
        jz      ?_251                                   ; 3E6C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3E6E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E71 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 3E74 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3E79 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E7B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3E7E _ 89. 50, 04
?_251:  mov     eax, dword [ebp+8H]                     ; 3E81 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3E84 _ 0F B6. 00
        movzx   eax, al                                 ; 3E87 _ 0F B6. C0
        and     eax, 20H                                ; 3E8A _ 83. E0, 20
        test    eax, eax                                ; 3E8D _ 85. C0
        jz      ?_252                                   ; 3E8F _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3E91 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3E94 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3E97 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3E9C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E9E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3EA1 _ 89. 50, 08
?_252:  mov     eax, dword [ebp+8H]                     ; 3EA4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3EA7 _ 8B. 40, 08
        neg     eax                                     ; 3EAA _ F7. D8
        mov     edx, eax                                ; 3EAC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3EAE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3EB1 _ 89. 50, 08
        mov     eax, 1                                  ; 3EB4 _ B8, 00000001
        jmp     ?_254                                   ; 3EB9 _ EB, 05

?_253:  mov     eax, 4294967295                         ; 3EBB _ B8, FFFFFFFF
?_254:  leave                                           ; 3EC0 _ C9
        ret                                             ; 3EC1 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3EC2 _ 55
        mov     ebp, esp                                ; 3EC3 _ 89. E5
        sub     esp, 72                                 ; 3EC5 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3EC8 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3ECF _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3ED6 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3EDD _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3EE4 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 3EEA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3EED _ 8B. 00
        mov     dword [esp+8H], edx                     ; 3EEF _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 3EF3 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3EF6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3EFA _ 89. 04 24
        call    init_screen8                            ; 3EFD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 3F02 _ 8B. 45, 20
        movsx   eax, al                                 ; 3F05 _ 0F BE. C0
        mov     dword [esp+14H], ?_437                  ; 3F08 _ C7. 44 24, 14, 00000070(d)
        mov     dword [esp+10H], eax                    ; 3F10 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3F14 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3F17 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3F1B _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3F1E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3F22 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F25 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F29 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F2C _ 89. 04 24
        call    showString                              ; 3F2F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 3F34 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3F37 _ 89. 04 24
        call    intToHexStr                             ; 3F3A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3F3F _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 3F42 _ 8B. 45, 20
        movsx   eax, al                                 ; 3F45 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 3F48 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 3F4B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3F4F _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3F53 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3F56 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3F5A _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3F5D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3F61 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F64 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F68 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F6B _ 89. 04 24
        call    showString                              ; 3F6E _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3F73 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3F77 _ 8B. 45, 20
        movsx   eax, al                                 ; 3F7A _ 0F BE. C0
        mov     dword [esp+14H], ?_438                  ; 3F7D _ C7. 44 24, 14, 0000007A(d)
        mov     dword [esp+10H], eax                    ; 3F85 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3F89 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3F8C _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3F90 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3F93 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3F97 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F9A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F9E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FA1 _ 89. 04 24
        call    showString                              ; 3FA4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3FA9 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 3FAC _ 8B. 00
        mov     dword [esp], eax                        ; 3FAE _ 89. 04 24
        call    intToHexStr                             ; 3FB1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3FB6 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3FB9 _ 8B. 45, 20
        movsx   eax, al                                 ; 3FBC _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 3FBF _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 3FC2 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3FC6 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3FCA _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3FCD _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3FD1 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3FD4 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3FD8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3FDB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FDF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FE2 _ 89. 04 24
        call    showString                              ; 3FE5 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3FEA _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3FEE _ 8B. 45, 20
        movsx   eax, al                                 ; 3FF1 _ 0F BE. C0
        mov     dword [esp+14H], ?_439                  ; 3FF4 _ C7. 44 24, 14, 00000086(d)
        mov     dword [esp+10H], eax                    ; 3FFC _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 4000 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 4003 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4007 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 400A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 400E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4011 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4015 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4018 _ 89. 04 24
        call    showString                              ; 401B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4020 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 4023 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 4026 _ 89. 04 24
        call    intToHexStr                             ; 4029 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 402E _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 4031 _ 8B. 45, 20
        movsx   eax, al                                 ; 4034 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 4037 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 403A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 403E _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 4042 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 4045 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 4049 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 404C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4050 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4053 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4057 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 405A _ 89. 04 24
        call    showString                              ; 405D _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 4062 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 4066 _ 8B. 45, 20
        movsx   eax, al                                 ; 4069 _ 0F BE. C0
        mov     dword [esp+14H], ?_440                  ; 406C _ C7. 44 24, 14, 00000092(d)
        mov     dword [esp+10H], eax                    ; 4074 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 4078 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 407B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 407F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4082 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4086 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4089 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 408D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4090 _ 89. 04 24
        call    showString                              ; 4093 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4098 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 409B _ 8B. 40, 08
        mov     dword [esp], eax                        ; 409E _ 89. 04 24
        call    intToHexStr                             ; 40A1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 40A6 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 40A9 _ 8B. 45, 20
        movsx   eax, al                                 ; 40AC _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 40AF _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 40B2 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 40B6 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 40BA _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 40BD _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 40C1 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 40C4 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 40C8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 40CB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40CF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40D2 _ 89. 04 24
        call    showString                              ; 40D5 _ E8, FFFFFFFC(rel)
        leave                                           ; 40DA _ C9
        ret                                             ; 40DB _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 40DC _ 55
        mov     ebp, esp                                ; 40DD _ 89. E5
        sub     esp, 56                                 ; 40DF _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 40E2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40E5 _ 89. 04 24
        call    sheet_alloc                             ; 40E8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 40ED _ 89. 45, F4
        mov     eax, dword [memman]                     ; 40F0 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 40F5 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 40FD _ 89. 04 24
        call    memman_alloc_4k                         ; 4100 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4105 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 4108 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 4110 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 4118 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 4120 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4123 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 4127 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 412A _ 89. 04 24
        call    sheet_setbuf                            ; 412D _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 4132 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 413A _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 413D _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 4141 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 4144 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4148 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 414B _ 89. 04 24
        call    make_window8                            ; 414E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 4153 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 415B _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 4163 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 416B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 4173 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 417B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 417E _ 89. 04 24
        call    make_textbox8                           ; 4181 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 4186 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 418E _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 4196 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 4199 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 419D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41A0 _ 89. 04 24
        call    sheet_slide                             ; 41A3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 41A8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 41B0 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 41B3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41B7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41BA _ 89. 04 24
        call    sheet_updown                            ; 41BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 41C2 _ 8B. 45, F4
        leave                                           ; 41C5 _ C9
        ret                                             ; 41C6 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 41C7 _ 55
        mov     ebp, esp                                ; 41C8 _ 89. E5
        push    ebx                                     ; 41CA _ 53
        sub     esp, 52                                 ; 41CB _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 41CE _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 41D1 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 41D4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 41D7 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 41DA _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 41DD _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 41E0 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 41E3 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 41E6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 41E9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 41EC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 41EF _ 8B. 00
        mov     dword [esp+18H], 0                      ; 41F1 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 41F9 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 41FD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 4205 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 420D _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 4215 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4218 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 421C _ 89. 04 24
        call    boxfill8                                ; 421F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4224 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 4227 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 422A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 422D _ 8B. 00
        mov     dword [esp+18H], 1                      ; 422F _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 4237 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 423B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 4243 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 424B _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 4253 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4256 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 425A _ 89. 04 24
        call    boxfill8                                ; 425D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4262 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4265 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4268 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 426B _ 8B. 00
        mov     dword [esp+18H], edx                    ; 426D _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 4271 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 4279 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 4281 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 4289 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 4291 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4294 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4298 _ 89. 04 24
        call    boxfill8                                ; 429B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 42A0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 42A3 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 42A6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 42A9 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 42AB _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 42AF _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 42B7 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 42BF _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 42C7 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 42CF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 42D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 42D6 _ 89. 04 24
        call    boxfill8                                ; 42D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 42DE _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 42E1 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 42E4 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 42E7 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 42EA _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 42ED _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 42F0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 42F3 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 42F5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 42F9 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 42FD _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 4305 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 4309 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 4311 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4314 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4318 _ 89. 04 24
        call    boxfill8                                ; 431B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4320 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 4323 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4326 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4329 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 432C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 432F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4332 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4335 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 4337 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 433B _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 433F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 4347 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 434B _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 4353 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4356 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 435A _ 89. 04 24
        call    boxfill8                                ; 435D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4362 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 4365 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 4368 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 436B _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 436E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4371 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4373 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 4377 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 437B _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 4383 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 438B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 4393 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4396 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 439A _ 89. 04 24
        call    boxfill8                                ; 439D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 43A2 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 43A5 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 43A8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 43AB _ 8B. 00
        mov     dword [esp+18H], 20                     ; 43AD _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 43B5 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 43B9 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 43C1 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 43C9 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 43D1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 43D4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 43D8 _ 89. 04 24
        call    boxfill8                                ; 43DB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 43E0 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 43E3 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 43E6 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 43E9 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 43EC _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 43EF _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 43F2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 43F5 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 43F7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 43FB _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 43FF _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 4403 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 440B _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 4413 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4416 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 441A _ 89. 04 24
        call    boxfill8                                ; 441D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4422 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 4425 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4428 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 442B _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 442E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4431 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4434 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4437 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 4439 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 443D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 4441 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 4445 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 444D _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 4455 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4458 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 445C _ 89. 04 24
        call    boxfill8                                ; 445F _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 4464 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 4468 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 446C _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 446F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4473 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4476 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 447A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 447D _ 89. 04 24
        call    make_wtitle8                            ; 4480 _ E8, FFFFFFFC(rel)
        nop                                             ; 4485 _ 90
        add     esp, 52                                 ; 4486 _ 83. C4, 34
        pop     ebx                                     ; 4489 _ 5B
        pop     ebp                                     ; 448A _ 5D
        ret                                             ; 448B _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 448C _ 55
        mov     ebp, esp                                ; 448D _ 89. E5
        push    ebx                                     ; 448F _ 53
        sub     esp, 52                                 ; 4490 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 4493 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 4496 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 4499 _ 80. 7D, E4, 00
        jz      ?_255                                   ; 449D _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 449F _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 44A3 _ C6. 45, ED, 0C
        jmp     ?_256                                   ; 44A7 _ EB, 08

?_255:  mov     byte [ebp-12H], 8                       ; 44A9 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 44AD _ C6. 45, ED, 0F
?_256:  mov     eax, dword [ebp+0CH]                    ; 44B1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 44B4 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 44B7 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 44BA _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 44BE _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 44C1 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 44C4 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 44C7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 44CA _ 8B. 00
        mov     dword [esp+18H], 20                     ; 44CC _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 44D4 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 44D8 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 44E0 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 44E8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 44EC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 44F0 _ 89. 04 24
        call    boxfill8                                ; 44F3 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 44F8 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 44FC _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 44FF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 4503 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 4507 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 450F _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 4517 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 451A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 451E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4521 _ 89. 04 24
        call    showString                              ; 4524 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 4529 _ C7. 45, F0, 00000000
        jmp     ?_264                                   ; 4530 _ E9, 00000083

?_257:  mov     dword [ebp-0CH], 0                      ; 4535 _ C7. 45, F4, 00000000
        jmp     ?_263                                   ; 453C _ EB, 70

?_258:  mov     eax, dword [ebp-10H]                    ; 453E _ 8B. 45, F0
        shl     eax, 4                                  ; 4541 _ C1. E0, 04
        mov     edx, eax                                ; 4544 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4546 _ 8B. 45, F4
        add     eax, edx                                ; 4549 _ 01. D0
        add     eax, closebtn.2311                      ; 454B _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 4550 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 4553 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 4556 _ 80. 7D, EF, 40
        jnz     ?_259                                   ; 455A _ 75, 06
        mov     byte [ebp-11H], 0                       ; 455C _ C6. 45, EF, 00
        jmp     ?_262                                   ; 4560 _ EB, 1C

?_259:  cmp     byte [ebp-11H], 36                      ; 4562 _ 80. 7D, EF, 24
        jnz     ?_260                                   ; 4566 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 4568 _ C6. 45, EF, 0F
        jmp     ?_262                                   ; 456C _ EB, 10

?_260:  cmp     byte [ebp-11H], 81                      ; 456E _ 80. 7D, EF, 51
        jnz     ?_261                                   ; 4572 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 4574 _ C6. 45, EF, 08
        jmp     ?_262                                   ; 4578 _ EB, 04

?_261:  mov     byte [ebp-11H], 7                       ; 457A _ C6. 45, EF, 07
?_262:  mov     eax, dword [ebp+0CH]                    ; 457E _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4581 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 4583 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 4586 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 4589 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 458C _ 8B. 40, 04
        imul    ecx, eax                                ; 458F _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 4592 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4595 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 4598 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 459B _ 8B. 45, F4
        add     eax, ebx                                ; 459E _ 01. D8
        add     eax, ecx                                ; 45A0 _ 01. C8
        add     edx, eax                                ; 45A2 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 45A4 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 45A8 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 45AA _ 83. 45, F4, 01
?_263:  cmp     dword [ebp-0CH], 15                     ; 45AE _ 83. 7D, F4, 0F
        jle     ?_258                                   ; 45B2 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 45B4 _ 83. 45, F0, 01
?_264:  cmp     dword [ebp-10H], 13                     ; 45B8 _ 83. 7D, F0, 0D
        jle     ?_257                                   ; 45BC _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 45C2 _ 83. C4, 34
        pop     ebx                                     ; 45C5 _ 5B
        pop     ebp                                     ; 45C6 _ 5D
        ret                                             ; 45C7 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 45C8 _ 55
        mov     ebp, esp                                ; 45C9 _ 89. E5
        push    edi                                     ; 45CB _ 57
        push    esi                                     ; 45CC _ 56
        push    ebx                                     ; 45CD _ 53
        sub     esp, 44                                 ; 45CE _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 45D1 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 45D4 _ 8B. 55, 0C
        add     eax, edx                                ; 45D7 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 45D9 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 45DC _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 45DF _ 8B. 55, 10
        add     eax, edx                                ; 45E2 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 45E4 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 45E7 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 45EA _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 45ED _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 45F0 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 45F3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 45F6 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 45F9 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 45FC _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 45FF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4602 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4605 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4608 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 460A _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 460E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4612 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4616 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 461A _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 4622 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4626 _ 89. 04 24
        call    boxfill8                                ; 4629 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 462E _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 4631 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4634 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 4637 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 463A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 463D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 4640 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 4643 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 4646 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4649 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 464C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 464F _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4651 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4655 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4659 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 465D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 4661 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 4669 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 466D _ 89. 04 24
        call    boxfill8                                ; 4670 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 4675 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 4678 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 467B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 467E _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 4681 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 4684 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 4687 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 468A _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 468D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4690 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4693 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4696 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4698 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 469C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 46A0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 46A4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 46A8 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 46B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 46B4 _ 89. 04 24
        call    boxfill8                                ; 46B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 46BC _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 46BF _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 46C2 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 46C5 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 46C8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 46CB _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 46CE _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 46D1 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 46D4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 46D7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 46DA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 46DD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 46DF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 46E3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 46E7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 46EB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 46EF _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 46F7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 46FB _ 89. 04 24
        call    boxfill8                                ; 46FE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4703 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 4706 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 4709 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 470C _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 470F _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 4712 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 4715 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4718 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 471B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 471E _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4720 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 4724 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 4727 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 472B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 472F _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 4733 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 473B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 473F _ 89. 04 24
        call    boxfill8                                ; 4742 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4747 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 474A _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 474D _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 4750 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 4753 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 4756 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 4759 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 475C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 475F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4762 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 4764 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 4767 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 476B _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 476F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4773 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 4777 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 477F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4783 _ 89. 04 24
        call    boxfill8                                ; 4786 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 478B _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 478E _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 4791 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 4794 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4797 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 479A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 479D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 47A0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 47A3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 47A6 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 47A8 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 47AC _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 47AF _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 47B3 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 47B7 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 47BB _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 47C3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 47C7 _ 89. 04 24
        call    boxfill8                                ; 47CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 47CF _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 47D2 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 47D5 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 47D8 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 47DB _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 47DE _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 47E1 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 47E4 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 47E7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 47EA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 47ED _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 47F0 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 47F2 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 47F6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 47FA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 47FE _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 4802 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 480A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 480E _ 89. 04 24
        call    boxfill8                                ; 4811 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4816 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 4819 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 481C _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 481F _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 4822 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 4825 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 4828 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 482B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 482E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4831 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 4833 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 4836 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 483A _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 483D _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 4841 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4845 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 4849 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 484D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4851 _ 89. 04 24
        call    boxfill8                                ; 4854 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 4859 _ 83. C4, 2C
        pop     ebx                                     ; 485C _ 5B
        pop     esi                                     ; 485D _ 5E
        pop     edi                                     ; 485E _ 5F
        pop     ebp                                     ; 485F _ 5D
        ret                                             ; 4860 _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 4861 _ 55
        mov     ebp, esp                                ; 4862 _ 89. E5
        sub     esp, 56                                 ; 4864 _ 83. EC, 38
        mov     dword [ebp-0CH], 88064                  ; 4867 _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 486E _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4873 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 487B _ 89. 04 24
        call    memman_alloc                            ; 487E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 4883 _ 89. 45, E4
        jmp     ?_277                                   ; 4886 _ E9, 0000013C

?_265:  mov     dword [ebp-10H], 0                      ; 488B _ C7. 45, F0, 00000000
        jmp     ?_267                                   ; 4892 _ EB, 0F

?_266:  mov     edx, dword [ebp-10H]                    ; 4894 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4897 _ 8B. 45, E4
        add     eax, edx                                ; 489A _ 01. D0
        mov     byte [eax], 0                           ; 489C _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 489F _ 83. 45, F0, 01
?_267:  cmp     dword [ebp-10H], 11                     ; 48A3 _ 83. 7D, F0, 0B
        jle     ?_266                                   ; 48A7 _ 7E, EB
        mov     dword [ebp-10H], 0                      ; 48A9 _ C7. 45, F0, 00000000
        jmp     ?_270                                   ; 48B0 _ EB, 2C

?_268:  mov     edx, dword [ebp-0CH]                    ; 48B2 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 48B5 _ 8B. 45, F0
        add     eax, edx                                ; 48B8 _ 01. D0
        movzx   eax, byte [eax]                         ; 48BA _ 0F B6. 00
        test    al, al                                  ; 48BD _ 84. C0
        jz      ?_269                                   ; 48BF _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 48C1 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 48C4 _ 8B. 45, E4
        add     edx, eax                                ; 48C7 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 48C9 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 48CC _ 8B. 45, F0
        add     eax, ecx                                ; 48CF _ 01. C8
        movzx   eax, byte [eax]                         ; 48D1 _ 0F B6. 00
        mov     byte [edx], al                          ; 48D4 _ 88. 02
        add     dword [ebp-10H], 1                      ; 48D6 _ 83. 45, F0, 01
        jmp     ?_270                                   ; 48DA _ EB, 02

?_269:  jmp     ?_271                                   ; 48DC _ EB, 06

?_270:  cmp     dword [ebp-10H], 7                      ; 48DE _ 83. 7D, F0, 07
        jle     ?_268                                   ; 48E2 _ 7E, CE
?_271:  mov     dword [ebp-14H], 0                      ; 48E4 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 48EB _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 48EE _ 8B. 45, E4
        add     eax, edx                                ; 48F1 _ 01. D0
        mov     byte [eax], 46                          ; 48F3 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 48F6 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 48FA _ C7. 45, EC, 00000000
        jmp     ?_273                                   ; 4901 _ EB, 1E

?_272:  mov     edx, dword [ebp-10H]                    ; 4903 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4906 _ 8B. 45, E4
        add     edx, eax                                ; 4909 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 490B _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 490E _ 8B. 45, EC
        add     eax, ecx                                ; 4911 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4913 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4917 _ 88. 02
        add     dword [ebp-10H], 1                      ; 4919 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 491D _ 83. 45, EC, 01
?_273:  cmp     dword [ebp-14H], 2                      ; 4921 _ 83. 7D, EC, 02
        jle     ?_272                                   ; 4925 _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 4927 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 492A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 492E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4931 _ 89. 04 24
        call    strcmp                                  ; 4934 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4939 _ 83. F8, 01
        jne     ?_276                                   ; 493C _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 4942 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 4945 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4948 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 494D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4951 _ 89. 04 24
        call    memman_alloc_4k                         ; 4954 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4959 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 495B _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 495E _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4960 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4963 _ 8B. 40, 1C
        mov     edx, eax                                ; 4966 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4968 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 496B _ 89. 50, 08
        mov     dword [ebp-20H], 97280                  ; 496E _ C7. 45, E0, 00017C00
        mov     eax, dword [ebp-0CH]                    ; 4975 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 4978 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 497C _ 0F B7. C0
        shl     eax, 9                                  ; 497F _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 4982 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 4985 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4988 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 498B _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 498E _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4995 _ C7. 45, E8, 00000000
        jmp     ?_275                                   ; 499C _ EB, 1B

?_274:  mov     eax, dword [ebp+0CH]                    ; 499E _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 49A1 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 49A3 _ 8B. 45, E8
        add     edx, eax                                ; 49A6 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 49A8 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 49AB _ 8B. 45, E0
        add     eax, ecx                                ; 49AE _ 01. C8
        movzx   eax, byte [eax]                         ; 49B0 _ 0F B6. 00
        mov     byte [edx], al                          ; 49B3 _ 88. 02
        add     dword [ebp-18H], 1                      ; 49B5 _ 83. 45, E8, 01
?_275:  mov     eax, dword [ebp-18H]                    ; 49B9 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 49BC _ 3B. 45, DC
        jl      ?_274                                   ; 49BF _ 7C, DD
        jmp     ?_278                                   ; 49C1 _ EB, 12

?_276:  add     dword [ebp-0CH], 32                     ; 49C3 _ 83. 45, F4, 20
?_277:  mov     eax, dword [ebp-0CH]                    ; 49C7 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 49CA _ 0F B6. 00
        test    al, al                                  ; 49CD _ 84. C0
        jne     ?_265                                   ; 49CF _ 0F 85, FFFFFEB6
?_278:  mov     edx, dword [ebp-1CH]                    ; 49D5 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 49D8 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 49DD _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 49E5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 49E9 _ 89. 04 24
        call    memman_free                             ; 49EC _ E8, FFFFFFFC(rel)
        leave                                           ; 49F1 _ C9
        ret                                             ; 49F2 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 49F3 _ 55
        mov     ebp, esp                                ; 49F4 _ 89. E5
        sub     esp, 40                                 ; 49F6 _ 83. EC, 28
        call    task_now                                ; 49F9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 49FE _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4A01 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4A04 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_441                      ; 4A0E _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 4A15 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A1A _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4A1D _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4A27 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4A2A _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4A30 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4A33 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4A36 _ 89. 90, 0000009C
        mov     dword [esp], ?_442                      ; 4A3C _ C7. 04 24, 000000A5(d)
        call    cons_putstr                             ; 4A43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A48 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4A4B _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4A55 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4A58 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4A5E _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4A61 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4A64 _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 4A6A _ 8B. 45, 08
        add     eax, 44                                 ; 4A6D _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 4A70 _ 8B. 00
        mov     dword [esp], eax                        ; 4A72 _ 89. 04 24
        call    intToHexStr                             ; 4A75 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4A7A _ 89. 45, F0
        mov     dword [esp], ?_443                      ; 4A7D _ C7. 04 24, 000000B5(d)
        call    cons_putstr                             ; 4A84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4A89 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 4A8C _ 89. 04 24
        call    cons_putstr                             ; 4A8F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A94 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4A97 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4AA1 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4AA4 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4AAA _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4AAD _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4AB0 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4AB6 _ 8B. 45, F4
        add     eax, 48                                 ; 4AB9 _ 83. C0, 30
        leave                                           ; 4ABC _ C9
        ret                                             ; 4ABD _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 4ABE _ 55
        mov     ebp, esp                                ; 4ABF _ 89. E5
        sub     esp, 40                                 ; 4AC1 _ 83. EC, 28
        call    task_now                                ; 4AC4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4AC9 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4ACC _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4ACF _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_444                      ; 4AD9 _ C7. 04 24, 000000BC(d)
        call    cons_putstr                             ; 4AE0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4AE5 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4AE8 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4AF2 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4AF5 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4AFB _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4AFE _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4B01 _ 89. 90, 0000009C
        mov     dword [esp], ?_445                      ; 4B07 _ C7. 04 24, 000000C4(d)
        call    cons_putstr                             ; 4B0E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4B13 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4B16 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4B1C _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4B1F _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4B22 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4B28 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4B2B _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4B35 _ 8B. 45, F4
        add     eax, 48                                 ; 4B38 _ 83. C0, 30
        leave                                           ; 4B3B _ C9
        ret                                             ; 4B3C _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 4B3D _ 55
        mov     ebp, esp                                ; 4B3E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4B40 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 4B43 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B49 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4B4C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B53 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4B56 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B5D _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 4B60 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 4B67 _ 5D
        ret                                             ; 4B68 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 4B69 _ 55
        mov     ebp, esp                                ; 4B6A _ 89. E5
        sub     esp, 16                                 ; 4B6C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4B6F _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 4B76 _ C7. 45, F8, 00000000
        jmp     ?_280                                   ; 4B7D _ EB, 14

?_279:  mov     eax, dword [ebp+8H]                     ; 4B7F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 4B82 _ 8B. 55, F8
        add     edx, 2                                  ; 4B85 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4B88 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 4B8C _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 4B8F _ 83. 45, F8, 01
?_280:  mov     eax, dword [ebp+8H]                     ; 4B93 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4B96 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4B98 _ 3B. 45, F8
        ja      ?_279                                   ; 4B9B _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 4B9D _ 8B. 45, FC
        leave                                           ; 4BA0 _ C9
        ret                                             ; 4BA1 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 4BA2 _ 55
        mov     ebp, esp                                ; 4BA3 _ 89. E5
        push    ebx                                     ; 4BA5 _ 53
        sub     esp, 16                                 ; 4BA6 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4BA9 _ C7. 45, F4, 00000000
        jmp     ?_286                                   ; 4BB0 _ E9, 000000BD

?_281:  mov     eax, dword [ebp+8H]                     ; 4BB5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BB8 _ 8B. 55, F4
        add     edx, 2                                  ; 4BBB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4BBE _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 4BC2 _ 3B. 45, 0C
        jc      ?_285                                   ; 4BC5 _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 4BCB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BCE _ 8B. 55, F4
        add     edx, 2                                  ; 4BD1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4BD4 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 4BD7 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 4BDA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BDD _ 8B. 55, F4
        add     edx, 2                                  ; 4BE0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4BE3 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 4BE6 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 4BE9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4BEC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BEF _ 8B. 55, F4
        add     edx, 2                                  ; 4BF2 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 4BF5 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 4BF8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BFB _ 8B. 55, F4
        add     edx, 2                                  ; 4BFE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4C01 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 4C05 _ 2B. 45, 0C
        mov     edx, eax                                ; 4C08 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4C0A _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4C0D _ 8B. 4D, F4
        add     ecx, 2                                  ; 4C10 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 4C13 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 4C17 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4C1A _ 8B. 55, F4
        add     edx, 2                                  ; 4C1D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4C20 _ 8B. 44 D0, 04
        test    eax, eax                                ; 4C24 _ 85. C0
        jnz     ?_284                                   ; 4C26 _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 4C28 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C2B _ 8B. 00
        lea     edx, [eax-1H]                           ; 4C2D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4C30 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4C33 _ 89. 10
        jmp     ?_283                                   ; 4C35 _ EB, 28

?_282:  mov     eax, dword [ebp-0CH]                    ; 4C37 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4C3A _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4C3D _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4C40 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4C43 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4C46 _ 8B. 45, 08
        add     edx, 2                                  ; 4C49 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4C4C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4C4F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4C51 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4C54 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4C57 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4C5B _ 83. 45, F4, 01
?_283:  mov     eax, dword [ebp+8H]                     ; 4C5F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C62 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4C64 _ 3B. 45, F4
        ja      ?_282                                   ; 4C67 _ 77, CE
?_284:  mov     eax, dword [ebp-8H]                     ; 4C69 _ 8B. 45, F8
        jmp     ?_287                                   ; 4C6C _ EB, 17

?_285:  add     dword [ebp-0CH], 1                      ; 4C6E _ 83. 45, F4, 01
?_286:  mov     eax, dword [ebp+8H]                     ; 4C72 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C75 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4C77 _ 3B. 45, F4
        ja      ?_281                                   ; 4C7A _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 4C80 _ B8, 00000000
?_287:  add     esp, 16                                 ; 4C85 _ 83. C4, 10
        pop     ebx                                     ; 4C88 _ 5B
        pop     ebp                                     ; 4C89 _ 5D
        ret                                             ; 4C8A _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 4C8B _ 55
        mov     ebp, esp                                ; 4C8C _ 89. E5
        push    ebx                                     ; 4C8E _ 53
        sub     esp, 16                                 ; 4C8F _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4C92 _ C7. 45, F4, 00000000
        jmp     ?_290                                   ; 4C99 _ EB, 17

?_288:  mov     eax, dword [ebp+8H]                     ; 4C9B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4C9E _ 8B. 55, F4
        add     edx, 2                                  ; 4CA1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4CA4 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 4CA7 _ 3B. 45, 0C
        jbe     ?_289                                   ; 4CAA _ 76, 02
        jmp     ?_291                                   ; 4CAC _ EB, 0E

?_289:  add     dword [ebp-0CH], 1                      ; 4CAE _ 83. 45, F4, 01
?_290:  mov     eax, dword [ebp+8H]                     ; 4CB2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4CB5 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4CB7 _ 3B. 45, F4
        jg      ?_288                                   ; 4CBA _ 7F, DF
?_291:  cmp     dword [ebp-0CH], 0                      ; 4CBC _ 83. 7D, F4, 00
        jle     ?_295                                   ; 4CC0 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 4CC6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4CC9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4CCC _ 8B. 45, 08
        add     edx, 2                                  ; 4CCF _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4CD2 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 4CD5 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4CD8 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 4CDB _ 8B. 45, 08
        add     ecx, 2                                  ; 4CDE _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4CE1 _ 8B. 44 C8, 04
        add     eax, edx                                ; 4CE5 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 4CE7 _ 3B. 45, 0C
        jne     ?_295                                   ; 4CEA _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4CF0 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4CF3 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4CF6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4CF9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4CFC _ 8B. 45, 08
        add     edx, 2                                  ; 4CFF _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4D02 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4D06 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4D09 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4D0C _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4D0F _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4D12 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4D16 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D19 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4D1B _ 3B. 45, F4
        jle     ?_294                                   ; 4D1E _ 0F 8E, 0000008A
        mov     eax, dword [ebp+10H]                    ; 4D24 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4D27 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4D2A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4D2D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4D30 _ 8B. 55, F4
        add     edx, 2                                  ; 4D33 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4D36 _ 8B. 04 D0
        cmp     ecx, eax                                ; 4D39 _ 39. C1
        jnz     ?_294                                   ; 4D3B _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 4D3D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4D40 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4D43 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4D46 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D49 _ 8B. 45, 08
        add     edx, 2                                  ; 4D4C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4D4F _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 4D53 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4D56 _ 8B. 4D, F4
        add     ecx, 2                                  ; 4D59 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4D5C _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 4D60 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4D63 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4D66 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4D69 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4D6D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D70 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4D72 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D75 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4D78 _ 89. 10
        jmp     ?_293                                   ; 4D7A _ EB, 28

?_292:  mov     eax, dword [ebp-0CH]                    ; 4D7C _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4D7F _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4D82 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4D85 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4D88 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4D8B _ 8B. 45, 08
        add     edx, 2                                  ; 4D8E _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4D91 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4D94 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4D96 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4D99 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4D9C _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4DA0 _ 83. 45, F4, 01
?_293:  mov     eax, dword [ebp+8H]                     ; 4DA4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4DA7 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4DA9 _ 3B. 45, F4
        jg      ?_292                                   ; 4DAC _ 7F, CE
?_294:  mov     eax, 0                                  ; 4DAE _ B8, 00000000
        jmp     ?_301                                   ; 4DB3 _ E9, 0000011C

?_295:  mov     eax, dword [ebp+8H]                     ; 4DB8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4DBB _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4DBD _ 3B. 45, F4
        jle     ?_296                                   ; 4DC0 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 4DC2 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4DC5 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4DC8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4DCB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DCE _ 8B. 55, F4
        add     edx, 2                                  ; 4DD1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4DD4 _ 8B. 04 D0
        cmp     ecx, eax                                ; 4DD7 _ 39. C1
        jnz     ?_296                                   ; 4DD9 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 4DDB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DDE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4DE1 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4DE4 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4DE7 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4DEA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DED _ 8B. 55, F4
        add     edx, 2                                  ; 4DF0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4DF3 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4DF7 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4DFA _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4DFD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4E00 _ 8B. 55, F4
        add     edx, 2                                  ; 4E03 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4E06 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4E0A _ B8, 00000000
        jmp     ?_301                                   ; 4E0F _ E9, 000000C0

?_296:  mov     eax, dword [ebp+8H]                     ; 4E14 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E17 _ 8B. 00
        cmp     eax, 4095                               ; 4E19 _ 3D, 00000FFF
        jg      ?_300                                   ; 4E1E _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 4E24 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E27 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 4E29 _ 89. 45, F8
        jmp     ?_298                                   ; 4E2C _ EB, 28

?_297:  mov     eax, dword [ebp-8H]                     ; 4E2E _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4E31 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 4E34 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 4E37 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 4E3A _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4E3D _ 8B. 45, 08
        add     edx, 2                                  ; 4E40 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4E43 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4E46 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4E48 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4E4B _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4E4E _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4E52 _ 83. 6D, F8, 01
?_298:  mov     eax, dword [ebp-8H]                     ; 4E56 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 4E59 _ 3B. 45, F4
        jg      ?_297                                   ; 4E5C _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4E5E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E61 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4E63 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4E66 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4E69 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4E6B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4E6E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4E71 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E74 _ 8B. 00
        cmp     edx, eax                                ; 4E76 _ 39. C2
        jge     ?_299                                   ; 4E78 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 4E7A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4E7D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4E7F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4E82 _ 89. 50, 04
?_299:  mov     eax, dword [ebp+8H]                     ; 4E85 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4E88 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4E8B _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4E8E _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4E91 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4E94 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4E97 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4E9A _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 4E9D _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4EA0 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 4EA4 _ B8, 00000000
        jmp     ?_301                                   ; 4EA9 _ EB, 29

?_300:  mov     eax, dword [ebp+8H]                     ; 4EAB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4EAE _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4EB1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4EB4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4EB7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4EBA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4EBD _ 8B. 40, 08
        mov     edx, eax                                ; 4EC0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4EC2 _ 8B. 45, 10
        add     eax, edx                                ; 4EC5 _ 01. D0
        mov     edx, eax                                ; 4EC7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4EC9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4ECC _ 89. 50, 08
        mov     eax, 4294967295                         ; 4ECF _ B8, FFFFFFFF
?_301:  add     esp, 16                                 ; 4ED4 _ 83. C4, 10
        pop     ebx                                     ; 4ED7 _ 5B
        pop     ebp                                     ; 4ED8 _ 5D
        ret                                             ; 4ED9 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4EDA _ 55
        mov     ebp, esp                                ; 4EDB _ 89. E5
        sub     esp, 24                                 ; 4EDD _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4EE0 _ 8B. 45, 0C
        add     eax, 4095                               ; 4EE3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4EE8 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4EED _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4EF0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4EF3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4EF7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4EFA _ 89. 04 24
        call    memman_alloc                            ; 4EFD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4F02 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4F05 _ 8B. 45, FC
        leave                                           ; 4F08 _ C9
        ret                                             ; 4F09 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 4F0A _ 55
        mov     ebp, esp                                ; 4F0B _ 89. E5
        sub     esp, 28                                 ; 4F0D _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4F10 _ 8B. 45, 10
        add     eax, 4095                               ; 4F13 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4F18 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4F1D _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4F20 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4F23 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4F27 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4F2A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F2E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F31 _ 89. 04 24
        call    memman_free                             ; 4F34 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4F39 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4F3C _ 8B. 45, FC
        leave                                           ; 4F3F _ C9
        ret                                             ; 4F40 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 4F41 _ 55
        mov     ebp, esp                                ; 4F42 _ 89. E5
        sub     esp, 40                                 ; 4F44 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 4F47 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 4F4F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F52 _ 89. 04 24
        call    memman_alloc_4k                         ; 4F55 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4F5A _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4F5D _ 83. 7D, F4, 00
        jnz     ?_302                                   ; 4F61 _ 75, 0A
        mov     eax, 0                                  ; 4F63 _ B8, 00000000
        jmp     ?_306                                   ; 4F68 _ E9, 000000C0

?_302:  mov     eax, dword [ebp+10H]                    ; 4F6D _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4F70 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 4F74 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F78 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F7B _ 89. 04 24
        call    memman_alloc_4k                         ; 4F7E _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4F83 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4F85 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 4F88 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4F8B _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4F8E _ 8B. 40, 04
        test    eax, eax                                ; 4F91 _ 85. C0
        jnz     ?_303                                   ; 4F93 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 4F95 _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 4F98 _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 4FA0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4FA4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4FA7 _ 89. 04 24
        call    memman_free_4k                          ; 4FAA _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 4FAF _ B8, 00000000
        jmp     ?_306                                   ; 4FB4 _ EB, 77

?_303:  mov     eax, dword [ebp-0CH]                    ; 4FB6 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 4FB9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4FBC _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4FBE _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4FC1 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4FC4 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4FC7 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 4FCA _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4FCD _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4FD0 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4FD3 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 4FDA _ C7. 45, F0, 00000000
        jmp     ?_305                                   ; 4FE1 _ EB, 3E

?_304:  mov     ecx, dword [ebp-0CH]                    ; 4FE3 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4FE6 _ 8B. 55, F0
        mov     eax, edx                                ; 4FE9 _ 89. D0
        shl     eax, 3                                  ; 4FEB _ C1. E0, 03
        add     eax, edx                                ; 4FEE _ 01. D0
        shl     eax, 2                                  ; 4FF0 _ C1. E0, 02
        add     eax, ecx                                ; 4FF3 _ 01. C8
        add     eax, 1072                               ; 4FF5 _ 05, 00000430
        mov     dword [eax], 0                          ; 4FFA _ C7. 00, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 5000 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 5003 _ 8B. 55, F0
        mov     eax, edx                                ; 5006 _ 89. D0
        shl     eax, 3                                  ; 5008 _ C1. E0, 03
        add     eax, edx                                ; 500B _ 01. D0
        shl     eax, 2                                  ; 500D _ C1. E0, 02
        add     eax, ecx                                ; 5010 _ 01. C8
        add     eax, 1076                               ; 5012 _ 05, 00000434
        mov     dword [eax], 0                          ; 5017 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 501D _ 83. 45, F0, 01
?_305:  cmp     dword [ebp-10H], 255                    ; 5021 _ 81. 7D, F0, 000000FF
        jle     ?_304                                   ; 5028 _ 7E, B9
        mov     eax, dword [ebp-0CH]                    ; 502A _ 8B. 45, F4
?_306:  leave                                           ; 502D _ C9
        ret                                             ; 502E _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 502F _ 55
        mov     ebp, esp                                ; 5030 _ 89. E5
        sub     esp, 24                                 ; 5032 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 5035 _ C7. 45, F0, 00000000
        jmp     ?_309                                   ; 503C _ EB, 63

?_307:  mov     ecx, dword [ebp+8H]                     ; 503E _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 5041 _ 8B. 55, F0
        mov     eax, edx                                ; 5044 _ 89. D0
        shl     eax, 3                                  ; 5046 _ C1. E0, 03
        add     eax, edx                                ; 5049 _ 01. D0
        shl     eax, 2                                  ; 504B _ C1. E0, 02
        add     eax, ecx                                ; 504E _ 01. C8
        add     eax, 1072                               ; 5050 _ 05, 00000430
        mov     eax, dword [eax]                        ; 5055 _ 8B. 00
        test    eax, eax                                ; 5057 _ 85. C0
        jnz     ?_308                                   ; 5059 _ 75, 42
        mov     edx, dword [ebp-10H]                    ; 505B _ 8B. 55, F0
        mov     eax, edx                                ; 505E _ 89. D0
        shl     eax, 3                                  ; 5060 _ C1. E0, 03
        add     eax, edx                                ; 5063 _ 01. D0
        shl     eax, 2                                  ; 5065 _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 5068 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 506E _ 8B. 45, 08
        add     eax, edx                                ; 5071 _ 01. D0
        add     eax, 4                                  ; 5073 _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 5076 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5079 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 507C _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 5083 _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 5086 _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 508D _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 5092 _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 5095 _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 5098 _ 8B. 45, F4
        jmp     ?_310                                   ; 509B _ EB, 12

?_308:  add     dword [ebp-10H], 1                      ; 509D _ 83. 45, F0, 01
?_309:  cmp     dword [ebp-10H], 255                    ; 50A1 _ 81. 7D, F0, 000000FF
        jle     ?_307                                   ; 50A8 _ 7E, 94
        mov     eax, 0                                  ; 50AA _ B8, 00000000
?_310:  leave                                           ; 50AF _ C9
        ret                                             ; 50B0 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 50B1 _ 55
        mov     ebp, esp                                ; 50B2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 50B4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 50B7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 50BA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 50BC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 50BF _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 50C2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 50C5 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 50C8 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 50CB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 50CE _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 50D1 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 50D4 _ 89. 50, 14
        nop                                             ; 50D7 _ 90
        pop     ebp                                     ; 50D8 _ 5D
        ret                                             ; 50D9 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 50DA _ 55
        mov     ebp, esp                                ; 50DB _ 89. E5
        push    edi                                     ; 50DD _ 57
        push    esi                                     ; 50DE _ 56
        push    ebx                                     ; 50DF _ 53
        sub     esp, 60                                 ; 50E0 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 50E3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 50E6 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 50E9 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 50EC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 50EF _ 8B. 40, 10
        add     eax, 1                                  ; 50F2 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 50F5 _ 3B. 45, 10
        jge     ?_311                                   ; 50F8 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 50FA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 50FD _ 8B. 40, 10
        add     eax, 1                                  ; 5100 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 5103 _ 89. 45, 10
?_311:  cmp     dword [ebp+10H], -1                     ; 5106 _ 83. 7D, 10, FF
        jge     ?_312                                   ; 510A _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 510C _ C7. 45, 10, FFFFFFFF
?_312:  mov     eax, dword [ebp+0CH]                    ; 5113 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 5116 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 5119 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 511C _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 511F _ 3B. 45, 10
        jle     ?_319                                   ; 5122 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 5128 _ 83. 7D, 10, 00
        js      ?_315                                   ; 512C _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 5132 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 5135 _ 89. 45, E0
        jmp     ?_314                                   ; 5138 _ EB, 34

?_313:  mov     eax, dword [ebp-20H]                    ; 513A _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 513D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5140 _ 8B. 45, 08
        add     edx, 4                                  ; 5143 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 5146 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 514A _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 514D _ 8B. 4D, E0
        add     ecx, 4                                  ; 5150 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 5153 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5157 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 515A _ 8B. 55, E0
        add     edx, 4                                  ; 515D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5160 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 5164 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 5167 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 516A _ 83. 6D, E0, 01
?_314:  mov     eax, dword [ebp-20H]                    ; 516E _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 5171 _ 3B. 45, 10
        jg      ?_313                                   ; 5174 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 5176 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5179 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 517C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 517F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 5182 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 5186 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 5189 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 518C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 518F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5192 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5195 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 5198 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 519B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 519E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 51A1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 51A4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 51A7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 51AA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 51AD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 51B0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 51B3 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 51B6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 51BA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 51BE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 51C2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 51C6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 51CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 51CD _ 89. 04 24
        call    sheet_refreshmap                        ; 51D0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 51D5 _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 51D8 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 51DB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 51DE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 51E1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 51E4 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 51E7 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 51EA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 51ED _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 51F0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 51F3 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 51F6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 51F9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 51FC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 51FF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5202 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 5205 _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 5208 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 520C _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 5210 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5214 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 5218 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 521C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5220 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5223 _ 89. 04 24
        call    sheet_refreshsub                        ; 5226 _ E8, FFFFFFFC(rel)
        jmp     ?_326                                   ; 522B _ E9, 0000027D

?_315:  mov     eax, dword [ebp+8H]                     ; 5230 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5233 _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 5236 _ 3B. 45, E4
        jle     ?_318                                   ; 5239 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 523B _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 523E _ 89. 45, E0
        jmp     ?_317                                   ; 5241 _ EB, 34

?_316:  mov     eax, dword [ebp-20H]                    ; 5243 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 5246 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5249 _ 8B. 45, 08
        add     edx, 4                                  ; 524C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 524F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 5253 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 5256 _ 8B. 4D, E0
        add     ecx, 4                                  ; 5259 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 525C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5260 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 5263 _ 8B. 55, E0
        add     edx, 4                                  ; 5266 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5269 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 526D _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 5270 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 5273 _ 83. 45, E0, 01
?_317:  mov     eax, dword [ebp+8H]                     ; 5277 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 527A _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 527D _ 3B. 45, E0
        jg      ?_316                                   ; 5280 _ 7F, C1
?_318:  mov     eax, dword [ebp+8H]                     ; 5282 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5285 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 5288 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 528B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 528E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5291 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5294 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5297 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 529A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 529D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 52A0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 52A3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 52A6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 52A9 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 52AC _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 52AF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 52B2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 52B5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 52B8 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 52BB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 52C3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 52C7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 52CB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 52CF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 52D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 52D6 _ 89. 04 24
        call    sheet_refreshmap                        ; 52D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 52DE _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 52E1 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 52E4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 52E7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 52EA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 52ED _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 52F0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 52F3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 52F6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 52F9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 52FC _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 52FF _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 5302 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5305 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5308 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 530B _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 530E _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 5312 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 531A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 531E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 5322 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 5326 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 532A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 532D _ 89. 04 24
        call    sheet_refreshsub                        ; 5330 _ E8, FFFFFFFC(rel)
        jmp     ?_326                                   ; 5335 _ E9, 00000173

?_319:  mov     eax, dword [ebp-1CH]                    ; 533A _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 533D _ 3B. 45, 10
        jge     ?_326                                   ; 5340 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 5346 _ 83. 7D, E4, 00
        js      ?_322                                   ; 534A _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 534C _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 534F _ 89. 45, E0
        jmp     ?_321                                   ; 5352 _ EB, 34

?_320:  mov     eax, dword [ebp-20H]                    ; 5354 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 5357 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 535A _ 8B. 45, 08
        add     edx, 4                                  ; 535D _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 5360 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 5364 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 5367 _ 8B. 4D, E0
        add     ecx, 4                                  ; 536A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 536D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5371 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 5374 _ 8B. 55, E0
        add     edx, 4                                  ; 5377 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 537A _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 537E _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 5381 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 5384 _ 83. 45, E0, 01
?_321:  mov     eax, dword [ebp-20H]                    ; 5388 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 538B _ 3B. 45, 10
        jl      ?_320                                   ; 538E _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 5390 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5393 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 5396 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 5399 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 539C _ 89. 54 88, 04
        jmp     ?_325                                   ; 53A0 _ EB, 6C

?_322:  mov     eax, dword [ebp+8H]                     ; 53A2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 53A5 _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 53A8 _ 89. 45, E0
        jmp     ?_324                                   ; 53AB _ EB, 3A

?_323:  mov     eax, dword [ebp-20H]                    ; 53AD _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 53B0 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 53B3 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 53B6 _ 8B. 55, E0
        add     edx, 4                                  ; 53B9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 53BC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 53C0 _ 8B. 45, 08
        add     ecx, 4                                  ; 53C3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 53C6 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 53CA _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 53CD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 53D0 _ 8B. 45, 08
        add     edx, 4                                  ; 53D3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 53D6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 53DA _ 8B. 55, E0
        add     edx, 1                                  ; 53DD _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 53E0 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 53E3 _ 83. 6D, E0, 01
?_324:  mov     eax, dword [ebp-20H]                    ; 53E7 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 53EA _ 3B. 45, 10
        jge     ?_323                                   ; 53ED _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 53EF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 53F2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 53F5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 53F8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 53FB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 53FF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5402 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 5405 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5408 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 540B _ 89. 50, 10
?_325:  mov     eax, dword [ebp+0CH]                    ; 540E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5411 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5414 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5417 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 541A _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 541D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 5420 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5423 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5426 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 5429 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 542C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 542F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5432 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5435 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 5438 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 543B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 543F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5443 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 5447 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 544B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 544F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5452 _ 89. 04 24
        call    sheet_refreshmap                        ; 5455 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 545A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 545D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5460 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5463 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 5466 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 5469 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 546C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 546F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5472 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 5475 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 5478 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 547B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 547E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5481 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 5484 _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 5487 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 548B _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 548E _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 5492 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5496 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 549A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 549E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 54A2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 54A5 _ 89. 04 24
        call    sheet_refreshsub                        ; 54A8 _ E8, FFFFFFFC(rel)
?_326:  add     esp, 60                                 ; 54AD _ 83. C4, 3C
        pop     ebx                                     ; 54B0 _ 5B
        pop     esi                                     ; 54B1 _ 5E
        pop     edi                                     ; 54B2 _ 5F
        pop     ebp                                     ; 54B3 _ 5D
        ret                                             ; 54B4 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 54B5 _ 55
        mov     ebp, esp                                ; 54B6 _ 89. E5
        push    edi                                     ; 54B8 _ 57
        push    esi                                     ; 54B9 _ 56
        push    ebx                                     ; 54BA _ 53
        sub     esp, 44                                 ; 54BB _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 54BE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 54C1 _ 8B. 40, 18
        test    eax, eax                                ; 54C4 _ 85. C0
        js      ?_327                                   ; 54C6 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 54C8 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 54CB _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 54CE _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 54D1 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 54D4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 54D7 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 54DA _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 54DD _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 54E0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 54E3 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 54E6 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 54E9 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 54EC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 54EF _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 54F2 _ 8B. 45, 14
        add     edx, eax                                ; 54F5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 54F7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 54FA _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 54FD _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 5500 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 5503 _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 5506 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 550A _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 550E _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 5512 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 5516 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 551A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 551E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5521 _ 89. 04 24
        call    sheet_refreshsub                        ; 5524 _ E8, FFFFFFFC(rel)
?_327:  mov     eax, 0                                  ; 5529 _ B8, 00000000
        add     esp, 44                                 ; 552E _ 83. C4, 2C
        pop     ebx                                     ; 5531 _ 5B
        pop     esi                                     ; 5532 _ 5E
        pop     edi                                     ; 5533 _ 5F
        pop     ebp                                     ; 5534 _ 5D
        ret                                             ; 5535 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 5536 _ 55
        mov     ebp, esp                                ; 5537 _ 89. E5
        push    esi                                     ; 5539 _ 56
        push    ebx                                     ; 553A _ 53
        sub     esp, 48                                 ; 553B _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 553E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5541 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 5544 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 5547 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 554A _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 554D _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 5550 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 5553 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 5556 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5559 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 555C _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 555F _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5562 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5565 _ 8B. 40, 18
        test    eax, eax                                ; 5568 _ 85. C0
        js      ?_328                                   ; 556A _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 5570 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 5573 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 5576 _ 8B. 45, F4
        add     edx, eax                                ; 5579 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 557B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 557E _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 5581 _ 8B. 45, F0
        add     eax, ecx                                ; 5584 _ 01. C8
        mov     dword [esp+14H], 0                      ; 5586 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 558E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 5592 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 5596 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 5599 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 559D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 55A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 55A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 55A7 _ 89. 04 24
        call    sheet_refreshmap                        ; 55AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 55AF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 55B2 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 55B5 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 55B8 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 55BB _ 8B. 55, 14
        add     ecx, edx                                ; 55BE _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 55C0 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 55C3 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 55C6 _ 8B. 55, 10
        add     edx, ebx                                ; 55C9 _ 01. DA
        mov     dword [esp+14H], eax                    ; 55CB _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 55CF _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 55D3 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 55D7 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 55DA _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 55DE _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 55E1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 55E5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 55E8 _ 89. 04 24
        call    sheet_refreshmap                        ; 55EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 55F0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 55F3 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 55F6 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 55F9 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 55FC _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 55FF _ 8B. 45, F4
        add     edx, eax                                ; 5602 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 5604 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 5607 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 560A _ 8B. 45, F0
        add     eax, ebx                                ; 560D _ 01. D8
        mov     dword [esp+18H], ecx                    ; 560F _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 5613 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 561B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 561F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 5623 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 5626 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 562A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 562D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5631 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5634 _ 89. 04 24
        call    sheet_refreshsub                        ; 5637 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 563C _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 563F _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 5642 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5645 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 5648 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 564B _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 564E _ 8B. 4D, 14
        add     ebx, ecx                                ; 5651 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 5653 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 5656 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 5659 _ 8B. 4D, 10
        add     ecx, esi                                ; 565C _ 01. F1
        mov     dword [esp+18H], edx                    ; 565E _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 5662 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 5666 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 566A _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 566E _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 5671 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 5675 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 5678 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 567C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 567F _ 89. 04 24
        call    sheet_refreshsub                        ; 5682 _ E8, FFFFFFFC(rel)
?_328:  add     esp, 48                                 ; 5687 _ 83. C4, 30
        pop     ebx                                     ; 568A _ 5B
        pop     esi                                     ; 568B _ 5E
        pop     ebp                                     ; 568C _ 5D
        ret                                             ; 568D _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 568E _ 55
        mov     ebp, esp                                ; 568F _ 89. E5
        sub     esp, 64                                 ; 5691 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 5694 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 5697 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 5699 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 569C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 569F _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 56A2 _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 56A5 _ 83. 7D, 0C, 00
        jns     ?_329                                   ; 56A9 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 56AB _ C7. 45, 0C, 00000000
?_329:  cmp     dword [ebp+10H], 8                      ; 56B2 _ 83. 7D, 10, 08
        jg      ?_330                                   ; 56B6 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 56B8 _ C7. 45, 10, 00000000
?_330:  mov     eax, dword [ebp+8H]                     ; 56BF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 56C2 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 56C5 _ 3B. 45, 14
        jge     ?_331                                   ; 56C8 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 56CA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 56CD _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 56D0 _ 89. 45, 14
?_331:  mov     eax, dword [ebp+8H]                     ; 56D3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 56D6 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 56D9 _ 3B. 45, 18
        jge     ?_332                                   ; 56DC _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 56DE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 56E1 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 56E4 _ 89. 45, 18
?_332:  mov     eax, dword [ebp+1CH]                    ; 56E7 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 56EA _ 89. 45, CC
        jmp     ?_343                                   ; 56ED _ E9, 0000015B

?_333:  mov     eax, dword [ebp+8H]                     ; 56F2 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 56F5 _ 8B. 55, CC
        add     edx, 4                                  ; 56F8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 56FB _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 56FF _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 5702 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 5705 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 5707 _ 89. 45, EC
        mov     edx, dword [ebp-18H]                    ; 570A _ 8B. 55, E8
        mov     eax, dword [ebp+8H]                     ; 570D _ 8B. 45, 08
        add     eax, 1044                               ; 5710 _ 05, 00000414
        sub     edx, eax                                ; 5715 _ 29. C2
        mov     eax, edx                                ; 5717 _ 89. D0
        sar     eax, 2                                  ; 5719 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 571C _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 5722 _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 5725 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5728 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 572B _ 8B. 55, 0C
        sub     edx, eax                                ; 572E _ 29. C2
        mov     eax, edx                                ; 5730 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 5732 _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 5735 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 5738 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 573B _ 8B. 55, 10
        sub     edx, eax                                ; 573E _ 29. C2
        mov     eax, edx                                ; 5740 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 5742 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 5745 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5748 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 574B _ 8B. 55, 14
        sub     edx, eax                                ; 574E _ 29. C2
        mov     eax, edx                                ; 5750 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 5752 _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 5755 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 5758 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 575B _ 8B. 55, 18
        sub     edx, eax                                ; 575E _ 29. C2
        mov     eax, edx                                ; 5760 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 5762 _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 5765 _ 83. 7D, F0, 00
        jns     ?_334                                   ; 5769 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 576B _ C7. 45, F0, 00000000
?_334:  cmp     dword [ebp-0CH], 0                      ; 5772 _ 83. 7D, F4, 00
        jns     ?_335                                   ; 5776 _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 5778 _ C7. 45, F4, 00000000
?_335:  mov     eax, dword [ebp-18H]                    ; 577F _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 5782 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 5785 _ 3B. 45, D8
        jge     ?_336                                   ; 5788 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 578A _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 578D _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 5790 _ 89. 45, D8
?_336:  mov     eax, dword [ebp-18H]                    ; 5793 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 5796 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 5799 _ 3B. 45, DC
        jge     ?_337                                   ; 579C _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 579E _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 57A1 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 57A4 _ 89. 45, DC
?_337:  mov     dword [ebp-2CH], 0                      ; 57A7 _ C7. 45, D4, 00000000
        jmp     ?_342                                   ; 57AE _ E9, 0000008A

?_338:  mov     eax, dword [ebp-18H]                    ; 57B3 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 57B6 _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 57B9 _ 8B. 45, D4
        add     eax, edx                                ; 57BC _ 01. D0
        mov     dword [ebp-8H], eax                     ; 57BE _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 57C1 _ C7. 45, D0, 00000000
        jmp     ?_341                                   ; 57C8 _ EB, 67

?_339:  mov     eax, dword [ebp-18H]                    ; 57CA _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 57CD _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 57D0 _ 8B. 45, D0
        add     eax, edx                                ; 57D3 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 57D5 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 57D8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 57DB _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 57DE _ 0F AF. 45, F8
        mov     edx, eax                                ; 57E2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 57E4 _ 8B. 45, FC
        add     eax, edx                                ; 57E7 _ 01. D0
        mov     edx, eax                                ; 57E9 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 57EB _ 8B. 45, E4
        add     eax, edx                                ; 57EE _ 01. D0
        movzx   eax, byte [eax]                         ; 57F0 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 57F3 _ 3A. 45, CB
        jnz     ?_340                                   ; 57F6 _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 57F8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 57FB _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 57FE _ 0F AF. 45, F8
        mov     edx, eax                                ; 5802 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5804 _ 8B. 45, FC
        add     eax, edx                                ; 5807 _ 01. D0
        mov     edx, eax                                ; 5809 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 580B _ 8B. 45, E0
        add     edx, eax                                ; 580E _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 5810 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 5813 _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 5816 _ 0F AF. 45, D4
        mov     ecx, eax                                ; 581A _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 581C _ 8B. 45, D0
        add     eax, ecx                                ; 581F _ 01. C8
        mov     ecx, eax                                ; 5821 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 5823 _ 8B. 45, EC
        add     eax, ecx                                ; 5826 _ 01. C8
        movzx   eax, byte [eax]                         ; 5828 _ 0F B6. 00
        mov     byte [edx], al                          ; 582B _ 88. 02
?_340:  add     dword [ebp-30H], 1                      ; 582D _ 83. 45, D0, 01
?_341:  mov     eax, dword [ebp-30H]                    ; 5831 _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 5834 _ 3B. 45, D8
        jl      ?_339                                   ; 5837 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 5839 _ 83. 45, D4, 01
?_342:  mov     eax, dword [ebp-2CH]                    ; 583D _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 5840 _ 3B. 45, DC
        jl      ?_338                                   ; 5843 _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 5849 _ 83. 45, CC, 01
?_343:  mov     eax, dword [ebp-34H]                    ; 584D _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 5850 _ 3B. 45, 20
        jle     ?_333                                   ; 5853 _ 0F 8E, FFFFFE99
        leave                                           ; 5859 _ C9
        ret                                             ; 585A _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 585B _ 55
        mov     ebp, esp                                ; 585C _ 89. E5
        sub     esp, 64                                 ; 585E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 5861 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5864 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 5867 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 586A _ 83. 7D, 0C, 00
        jns     ?_344                                   ; 586E _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 5870 _ C7. 45, 0C, 00000000
?_344:  cmp     dword [ebp+10H], 0                      ; 5877 _ 83. 7D, 10, 00
        jns     ?_345                                   ; 587B _ 79, 07
        mov     dword [ebp+10H], 0                      ; 587D _ C7. 45, 10, 00000000
?_345:  mov     eax, dword [ebp+8H]                     ; 5884 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5887 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 588A _ 3B. 45, 14
        jge     ?_346                                   ; 588D _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 588F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5892 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 5895 _ 89. 45, 14
?_346:  mov     eax, dword [ebp+8H]                     ; 5898 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 589B _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 589E _ 3B. 45, 18
        jge     ?_347                                   ; 58A1 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 58A3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 58A6 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 58A9 _ 89. 45, 18
?_347:  mov     eax, dword [ebp+1CH]                    ; 58AC _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 58AF _ 89. 45, D0
        jmp     ?_358                                   ; 58B2 _ E9, 00000147

?_348:  mov     eax, dword [ebp+8H]                     ; 58B7 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 58BA _ 8B. 55, D0
        add     edx, 4                                  ; 58BD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 58C0 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 58C4 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 58C7 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 58CA _ 8B. 45, 08
        add     eax, 1044                               ; 58CD _ 05, 00000414
        sub     edx, eax                                ; 58D2 _ 29. C2
        mov     eax, edx                                ; 58D4 _ 89. D0
        sar     eax, 2                                  ; 58D6 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 58D9 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 58DF _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 58E2 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 58E5 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 58E7 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 58EA _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 58ED _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 58F0 _ 8B. 55, 0C
        sub     edx, eax                                ; 58F3 _ 29. C2
        mov     eax, edx                                ; 58F5 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 58F7 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 58FA _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 58FD _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5900 _ 8B. 55, 10
        sub     edx, eax                                ; 5903 _ 29. C2
        mov     eax, edx                                ; 5905 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 5907 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 590A _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 590D _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 5910 _ 8B. 55, 14
        sub     edx, eax                                ; 5913 _ 29. C2
        mov     eax, edx                                ; 5915 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 5917 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 591A _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 591D _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5920 _ 8B. 55, 18
        sub     edx, eax                                ; 5923 _ 29. C2
        mov     eax, edx                                ; 5925 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 5927 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 592A _ 83. 7D, DC, 00
        jns     ?_349                                   ; 592E _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5930 _ C7. 45, DC, 00000000
?_349:  cmp     dword [ebp-20H], 0                      ; 5937 _ 83. 7D, E0, 00
        jns     ?_350                                   ; 593B _ 79, 07
        mov     dword [ebp-20H], 0                      ; 593D _ C7. 45, E0, 00000000
?_350:  mov     eax, dword [ebp-10H]                    ; 5944 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5947 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 594A _ 3B. 45, E4
        jge     ?_351                                   ; 594D _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 594F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5952 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 5955 _ 89. 45, E4
?_351:  mov     eax, dword [ebp-10H]                    ; 5958 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 595B _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 595E _ 3B. 45, E8
        jge     ?_352                                   ; 5961 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5963 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 5966 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 5969 _ 89. 45, E8
?_352:  mov     eax, dword [ebp-20H]                    ; 596C _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 596F _ 89. 45, D8
        jmp     ?_357                                   ; 5972 _ EB, 7A

?_353:  mov     eax, dword [ebp-10H]                    ; 5974 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 5977 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 597A _ 8B. 45, D8
        add     eax, edx                                ; 597D _ 01. D0
        mov     dword [ebp-8H], eax                     ; 597F _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 5982 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 5985 _ 89. 45, D4
        jmp     ?_356                                   ; 5988 _ EB, 58

?_354:  mov     eax, dword [ebp-10H]                    ; 598A _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 598D _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 5990 _ 8B. 45, D4
        add     eax, edx                                ; 5993 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 5995 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 5998 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 599B _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 599E _ 0F AF. 45, D8
        mov     edx, eax                                ; 59A2 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 59A4 _ 8B. 45, D4
        add     eax, edx                                ; 59A7 _ 01. D0
        mov     edx, eax                                ; 59A9 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 59AB _ 8B. 45, F4
        add     eax, edx                                ; 59AE _ 01. D0
        movzx   eax, byte [eax]                         ; 59B0 _ 0F B6. 00
        movzx   edx, al                                 ; 59B3 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 59B6 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 59B9 _ 8B. 40, 14
        cmp     edx, eax                                ; 59BC _ 39. C2
        jz      ?_355                                   ; 59BE _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 59C0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 59C3 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 59C6 _ 0F AF. 45, F8
        mov     edx, eax                                ; 59CA _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 59CC _ 8B. 45, FC
        add     eax, edx                                ; 59CF _ 01. D0
        mov     edx, eax                                ; 59D1 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 59D3 _ 8B. 45, EC
        add     edx, eax                                ; 59D6 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 59D8 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 59DC _ 88. 02
?_355:  add     dword [ebp-2CH], 1                      ; 59DE _ 83. 45, D4, 01
?_356:  mov     eax, dword [ebp-2CH]                    ; 59E2 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 59E5 _ 3B. 45, E4
        jl      ?_354                                   ; 59E8 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 59EA _ 83. 45, D8, 01
?_357:  mov     eax, dword [ebp-28H]                    ; 59EE _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 59F1 _ 3B. 45, E8
        jl      ?_353                                   ; 59F4 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 59FA _ 83. 45, D0, 01
?_358:  mov     eax, dword [ebp+8H]                     ; 59FE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5A01 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 5A04 _ 3B. 45, D0
        jge     ?_348                                   ; 5A07 _ 0F 8D, FFFFFEAA
        nop                                             ; 5A0D _ 90
        leave                                           ; 5A0E _ C9
        ret                                             ; 5A0F _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 5A10 _ 55
        mov     ebp, esp                                ; 5A11 _ 89. E5
        sub     esp, 24                                 ; 5A13 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5A16 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5A19 _ 8B. 40, 18
        test    eax, eax                                ; 5A1C _ 85. C0
        js      ?_359                                   ; 5A1E _ 78, 1A
        mov     dword [esp+8H], -1                      ; 5A20 _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 5A28 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 5A2B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5A2F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5A32 _ 89. 04 24
        call    sheet_updown                            ; 5A35 _ E8, FFFFFFFC(rel)
?_359:  mov     eax, dword [ebp+0CH]                    ; 5A3A _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 5A3D _ C7. 40, 1C, 00000000
        nop                                             ; 5A44 _ 90
        leave                                           ; 5A45 _ C9
        ret                                             ; 5A46 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 5A47 _ 55
        mov     ebp, esp                                ; 5A48 _ 89. E5
        sub     esp, 40                                 ; 5A4A _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 5A4D _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 5A55 _ C7. 04 24, 00000043
        call    io_out8                                 ; 5A5C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 5A61 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 5A69 _ C7. 04 24, 00000040
        call    io_out8                                 ; 5A70 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 5A75 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 5A7D _ C7. 04 24, 00000040
        call    io_out8                                 ; 5A84 _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 5A89 _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 5A93 _ C7. 45, F4, 00000000
        jmp     ?_361                                   ; 5A9A _ EB, 28

?_360:  mov     eax, dword [ebp-0CH]                    ; 5A9C _ 8B. 45, F4
        shl     eax, 4                                  ; 5A9F _ C1. E0, 04
        add     eax, timerctl                           ; 5AA2 _ 05, 00000380(d)
        mov     dword [eax+8H], 0                       ; 5AA7 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5AAE _ 8B. 45, F4
        shl     eax, 4                                  ; 5AB1 _ C1. E0, 04
        add     eax, timerctl                           ; 5AB4 _ 05, 00000380(d)
        mov     dword [eax+0CH], 0                      ; 5AB9 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 5AC0 _ 83. 45, F4, 01
?_361:  cmp     dword [ebp-0CH], 499                    ; 5AC4 _ 81. 7D, F4, 000001F3
        jle     ?_360                                   ; 5ACB _ 7E, CF
        leave                                           ; 5ACD _ C9
        ret                                             ; 5ACE _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 5ACF _ 55
        mov     ebp, esp                                ; 5AD0 _ 89. E5
        sub     esp, 16                                 ; 5AD2 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5AD5 _ C7. 45, FC, 00000000
        jmp     ?_364                                   ; 5ADC _ EB, 38

?_362:  mov     eax, dword [ebp-4H]                     ; 5ADE _ 8B. 45, FC
        shl     eax, 4                                  ; 5AE1 _ C1. E0, 04
        add     eax, timerctl                           ; 5AE4 _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 5AE9 _ 8B. 40, 08
        test    eax, eax                                ; 5AEC _ 85. C0
        jnz     ?_363                                   ; 5AEE _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 5AF0 _ 8B. 45, FC
        shl     eax, 4                                  ; 5AF3 _ C1. E0, 04
        add     eax, timerctl                           ; 5AF6 _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5AFB _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 5B02 _ 8B. 45, FC
        shl     eax, 4                                  ; 5B05 _ C1. E0, 04
        add     eax, timerctl                           ; 5B08 _ 05, 00000380(d)
        add     eax, 4                                  ; 5B0D _ 83. C0, 04
        jmp     ?_365                                   ; 5B10 _ EB, 12

?_363:  add     dword [ebp-4H], 1                       ; 5B12 _ 83. 45, FC, 01
?_364:  cmp     dword [ebp-4H], 499                     ; 5B16 _ 81. 7D, FC, 000001F3
        jle     ?_362                                   ; 5B1D _ 7E, BF
        mov     eax, 0                                  ; 5B1F _ B8, 00000000
?_365:  leave                                           ; 5B24 _ C9
        ret                                             ; 5B25 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 5B26 _ 55
        mov     ebp, esp                                ; 5B27 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5B29 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5B2C _ C7. 40, 04, 00000000
        nop                                             ; 5B33 _ 90
        pop     ebp                                     ; 5B34 _ 5D
        ret                                             ; 5B35 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 5B36 _ 55
        mov     ebp, esp                                ; 5B37 _ 89. E5
        sub     esp, 4                                  ; 5B39 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 5B3C _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5B3F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5B42 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5B45 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 5B48 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5B4B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 5B4E _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 5B52 _ 88. 50, 0C
        nop                                             ; 5B55 _ 90
        leave                                           ; 5B56 _ C9
        ret                                             ; 5B57 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 5B58 _ 55
        mov     ebp, esp                                ; 5B59 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5B5B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5B5E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 5B61 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5B63 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5B66 _ C7. 40, 04, 00000002
        nop                                             ; 5B6D _ 90
        pop     ebp                                     ; 5B6E _ 5D
        ret                                             ; 5B6F _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 5B70 _ 55
        mov     ebp, esp                                ; 5B71 _ 89. E5
        sub     esp, 40                                 ; 5B73 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 5B76 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 5B7E _ C7. 04 24, 00000020
        call    io_out8                                 ; 5B85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 5B8A _ A1, 00000380(d)
        add     eax, 1                                  ; 5B8F _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 5B92 _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 5B97 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 5B9B _ C7. 45, F4, 00000000
        jmp     ?_369                                   ; 5BA2 _ E9, 000000B0

?_366:  mov     eax, dword [ebp-0CH]                    ; 5BA7 _ 8B. 45, F4
        shl     eax, 4                                  ; 5BAA _ C1. E0, 04
        add     eax, timerctl                           ; 5BAD _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 5BB2 _ 8B. 40, 08
        cmp     eax, 2                                  ; 5BB5 _ 83. F8, 02
        jne     ?_367                                   ; 5BB8 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 5BBE _ 8B. 45, F4
        shl     eax, 4                                  ; 5BC1 _ C1. E0, 04
        add     eax, timerctl                           ; 5BC4 _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5BC9 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5BCC _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 5BCF _ 8B. 45, F4
        shl     eax, 4                                  ; 5BD2 _ C1. E0, 04
        add     eax, timerctl                           ; 5BD5 _ 05, 00000380(d)
        mov     dword [eax+4H], edx                     ; 5BDA _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 5BDD _ 8B. 45, F4
        shl     eax, 4                                  ; 5BE0 _ C1. E0, 04
        add     eax, timerctl                           ; 5BE3 _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5BE8 _ 8B. 40, 04
        test    eax, eax                                ; 5BEB _ 85. C0
        jnz     ?_367                                   ; 5BED _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 5BEF _ 8B. 45, F4
        shl     eax, 4                                  ; 5BF2 _ C1. E0, 04
        add     eax, timerctl                           ; 5BF5 _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5BFA _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 5C01 _ 8B. 45, F4
        shl     eax, 4                                  ; 5C04 _ C1. E0, 04
        add     eax, timerctl                           ; 5C07 _ 05, 00000380(d)
        movzx   eax, byte [eax+10H]                     ; 5C0C _ 0F B6. 40, 10
        movzx   edx, al                                 ; 5C10 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 5C13 _ 8B. 45, F4
        shl     eax, 4                                  ; 5C16 _ C1. E0, 04
        add     eax, timerctl                           ; 5C19 _ 05, 00000380(d)
        mov     eax, dword [eax+0CH]                    ; 5C1E _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 5C21 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5C25 _ 89. 04 24
        call    fifo8_put                               ; 5C28 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5C2D _ 8B. 45, F4
        shl     eax, 4                                  ; 5C30 _ C1. E0, 04
        add     eax, timerctl                           ; 5C33 _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 5C38 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 5C3B _ A1, 00000000(d)
        cmp     edx, eax                                ; 5C40 _ 39. C2
        jnz     ?_367                                   ; 5C42 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 5C44 _ C6. 45, F3, 01
?_367:  cmp     byte [ebp-0DH], 0                       ; 5C48 _ 80. 7D, F3, 00
        jz      ?_368                                   ; 5C4C _ 74, 05
        call    task_switch                             ; 5C4E _ E8, FFFFFFFC(rel)
?_368:  add     dword [ebp-0CH], 1                      ; 5C53 _ 83. 45, F4, 01
?_369:  cmp     dword [ebp-0CH], 499                    ; 5C57 _ 81. 7D, F4, 000001F3
        jle     ?_366                                   ; 5C5E _ 0F 8E, FFFFFF43
        nop                                             ; 5C64 _ 90
        leave                                           ; 5C65 _ C9
        ret                                             ; 5C66 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 5C67 _ 55
        mov     ebp, esp                                ; 5C68 _ 89. E5
        mov     eax, timerctl                           ; 5C6A _ B8, 00000380(d)
        pop     ebp                                     ; 5C6F _ 5D
        ret                                             ; 5C70 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 5C71 _ 55
        mov     ebp, esp                                ; 5C72 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5C74 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5C77 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5C7A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5C7D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5C80 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 5C83 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5C85 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5C88 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 5C8B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5C8E _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 5C91 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 5C98 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5C9B _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 5CA2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5CA5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 5CAC _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 5CAF _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 5CB2 _ 89. 50, 18
        nop                                             ; 5CB5 _ 90
        pop     ebp                                     ; 5CB6 _ 5D
        ret                                             ; 5CB7 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 5CB8 _ 55
        mov     ebp, esp                                ; 5CB9 _ 89. E5
        sub     esp, 24                                 ; 5CBB _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5CBE _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 5CC1 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 5CC4 _ 83. 7D, 08, 00
        jnz     ?_370                                   ; 5CC8 _ 75, 0A
        mov     eax, 4294967295                         ; 5CCA _ B8, FFFFFFFF
        jmp     ?_374                                   ; 5CCF _ E9, 000000B2

?_370:  mov     eax, dword [ebp+8H]                     ; 5CD4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5CD7 _ 8B. 40, 10
        test    eax, eax                                ; 5CDA _ 85. C0
        jnz     ?_371                                   ; 5CDC _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 5CDE _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 5CE1 _ 8B. 40, 14
        or      eax, 01H                                ; 5CE4 _ 83. C8, 01
        mov     edx, eax                                ; 5CE7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5CE9 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 5CEC _ 89. 50, 14
        mov     eax, 4294967294                         ; 5CEF _ B8, FFFFFFFE
        jmp     ?_374                                   ; 5CF4 _ E9, 0000008D

?_371:  mov     eax, dword [ebp+8H]                     ; 5CF9 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5CFC _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5CFE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5D01 _ 8B. 40, 04
        add     edx, eax                                ; 5D04 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 5D06 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 5D0A _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 5D0C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5D0F _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5D12 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5D15 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 5D18 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5D1B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5D1E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5D21 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5D24 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5D27 _ 39. C2
        jnz     ?_372                                   ; 5D29 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5D2B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5D2E _ C7. 40, 04, 00000000
?_372:  mov     eax, dword [ebp+8H]                     ; 5D35 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5D38 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 5D3B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5D3E _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5D41 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5D44 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5D47 _ 8B. 40, 18
        test    eax, eax                                ; 5D4A _ 85. C0
        jz      ?_373                                   ; 5D4C _ 74, 33
        mov     eax, dword [ebp+8H]                     ; 5D4E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5D51 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 5D54 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5D57 _ 83. F8, 02
        jz      ?_373                                   ; 5D5A _ 74, 25
        mov     eax, dword [ebp+8H]                     ; 5D5C _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5D5F _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 5D62 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 5D6A _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 5D72 _ 89. 04 24
        call    task_run                                ; 5D75 _ E8, FFFFFFFC(rel)
        mov     eax, 1                                  ; 5D7A _ B8, 00000001
        jmp     ?_374                                   ; 5D7F _ EB, 05

?_373:  mov     eax, 0                                  ; 5D81 _ B8, 00000000
?_374:  leave                                           ; 5D86 _ C9
        ret                                             ; 5D87 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 5D88 _ 55
        mov     ebp, esp                                ; 5D89 _ 89. E5
        sub     esp, 16                                 ; 5D8B _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 5D8E _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 5D91 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5D94 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5D97 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5D9A _ 39. C2
        jnz     ?_375                                   ; 5D9C _ 75, 07
        mov     eax, 4294967295                         ; 5D9E _ B8, FFFFFFFF
        jmp     ?_377                                   ; 5DA3 _ EB, 51

?_375:  mov     eax, dword [ebp+8H]                     ; 5DA5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5DA8 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5DAA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5DAD _ 8B. 40, 08
        add     eax, edx                                ; 5DB0 _ 01. D0
        movzx   eax, byte [eax]                         ; 5DB2 _ 0F B6. 00
        movzx   eax, al                                 ; 5DB5 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 5DB8 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5DBB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5DBE _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 5DC1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5DC4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5DC7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5DCA _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 5DCD _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5DD0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5DD3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5DD6 _ 39. C2
        jnz     ?_376                                   ; 5DD8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5DDA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5DDD _ C7. 40, 08, 00000000
?_376:  mov     eax, dword [ebp+8H]                     ; 5DE4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5DE7 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 5DEA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5DED _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5DF0 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 5DF3 _ 8B. 45, FC
?_377:  leave                                           ; 5DF6 _ C9
        ret                                             ; 5DF7 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 5DF8 _ 55
        mov     ebp, esp                                ; 5DF9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5DFB _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5DFE _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5E01 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5E04 _ 8B. 40, 10
        sub     edx, eax                                ; 5E07 _ 29. C2
        mov     eax, edx                                ; 5E09 _ 89. D0
        pop     ebp                                     ; 5E0B _ 5D
        ret                                             ; 5E0C _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 5E0D _ 55
        mov     ebp, esp                                ; 5E0E _ 89. E5
        sub     esp, 16                                 ; 5E10 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 5E13 _ 83. 7D, 08, 00
        jz      ?_378                                   ; 5E17 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5E19 _ 83. 7D, 0C, 00
        jnz     ?_379                                   ; 5E1D _ 75, 0A
?_378:  mov     eax, 0                                  ; 5E1F _ B8, 00000000
        jmp     ?_386                                   ; 5E24 _ E9, 0000009B

?_379:  mov     dword [ebp-4H], 0                       ; 5E29 _ C7. 45, FC, 00000000
        jmp     ?_382                                   ; 5E30 _ EB, 25

?_380:  mov     edx, dword [ebp-4H]                     ; 5E32 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E35 _ 8B. 45, 08
        add     eax, edx                                ; 5E38 _ 01. D0
        movzx   edx, byte [eax]                         ; 5E3A _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5E3D _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5E40 _ 8B. 45, 0C
        add     eax, ecx                                ; 5E43 _ 01. C8
        movzx   eax, byte [eax]                         ; 5E45 _ 0F B6. 00
        cmp     dl, al                                  ; 5E48 _ 38. C2
        jz      ?_381                                   ; 5E4A _ 74, 07
        mov     eax, 0                                  ; 5E4C _ B8, 00000000
        jmp     ?_386                                   ; 5E51 _ EB, 71

?_381:  add     dword [ebp-4H], 1                       ; 5E53 _ 83. 45, FC, 01
?_382:  mov     edx, dword [ebp-4H]                     ; 5E57 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E5A _ 8B. 45, 08
        add     eax, edx                                ; 5E5D _ 01. D0
        movzx   eax, byte [eax]                         ; 5E5F _ 0F B6. 00
        test    al, al                                  ; 5E62 _ 84. C0
        jz      ?_383                                   ; 5E64 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 5E66 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5E69 _ 8B. 45, 0C
        add     eax, edx                                ; 5E6C _ 01. D0
        movzx   eax, byte [eax]                         ; 5E6E _ 0F B6. 00
        test    al, al                                  ; 5E71 _ 84. C0
        jnz     ?_380                                   ; 5E73 _ 75, BD
?_383:  mov     edx, dword [ebp-4H]                     ; 5E75 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E78 _ 8B. 45, 08
        add     eax, edx                                ; 5E7B _ 01. D0
        movzx   eax, byte [eax]                         ; 5E7D _ 0F B6. 00
        test    al, al                                  ; 5E80 _ 84. C0
        jnz     ?_384                                   ; 5E82 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 5E84 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5E87 _ 8B. 45, 0C
        add     eax, edx                                ; 5E8A _ 01. D0
        movzx   eax, byte [eax]                         ; 5E8C _ 0F B6. 00
        test    al, al                                  ; 5E8F _ 84. C0
        jz      ?_384                                   ; 5E91 _ 74, 07
        mov     eax, 0                                  ; 5E93 _ B8, 00000000
        jmp     ?_386                                   ; 5E98 _ EB, 2A

?_384:  mov     edx, dword [ebp-4H]                     ; 5E9A _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E9D _ 8B. 45, 08
        add     eax, edx                                ; 5EA0 _ 01. D0
        movzx   eax, byte [eax]                         ; 5EA2 _ 0F B6. 00
        test    al, al                                  ; 5EA5 _ 84. C0
        jz      ?_385                                   ; 5EA7 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5EA9 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5EAC _ 8B. 45, 0C
        add     eax, edx                                ; 5EAF _ 01. D0
        movzx   eax, byte [eax]                         ; 5EB1 _ 0F B6. 00
        test    al, al                                  ; 5EB4 _ 84. C0
        jz      ?_385                                   ; 5EB6 _ 74, 07
        mov     eax, 0                                  ; 5EB8 _ B8, 00000000
        jmp     ?_386                                   ; 5EBD _ EB, 05

?_385:  mov     eax, 1                                  ; 5EBF _ B8, 00000001
?_386:  leave                                           ; 5EC4 _ C9
        ret                                             ; 5EC5 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5EC6 _ 55
        mov     ebp, esp                                ; 5EC7 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5EC9 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_387                                   ; 5ED0 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 5ED2 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 5ED9 _ 8B. 45, 0C
        shr     eax, 12                                 ; 5EDC _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 5EDF _ 89. 45, 0C
?_387:  mov     eax, dword [ebp+0CH]                    ; 5EE2 _ 8B. 45, 0C
        mov     edx, eax                                ; 5EE5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5EE7 _ 8B. 45, 08
        mov     word [eax], dx                          ; 5EEA _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 5EED _ 8B. 45, 10
        mov     edx, eax                                ; 5EF0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5EF2 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5EF5 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 5EF9 _ 8B. 45, 10
        sar     eax, 16                                 ; 5EFC _ C1. F8, 10
        mov     edx, eax                                ; 5EFF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5F01 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 5F04 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5F07 _ 8B. 45, 14
        mov     edx, eax                                ; 5F0A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5F0C _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 5F0F _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 5F12 _ 8B. 45, 0C
        shr     eax, 16                                 ; 5F15 _ C1. E8, 10
        and     eax, 0FH                                ; 5F18 _ 83. E0, 0F
        mov     edx, eax                                ; 5F1B _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5F1D _ 8B. 45, 14
        sar     eax, 8                                  ; 5F20 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5F23 _ 83. E0, F0
        or      eax, edx                                ; 5F26 _ 09. D0
        mov     edx, eax                                ; 5F28 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5F2A _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5F2D _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5F30 _ 8B. 45, 10
        shr     eax, 24                                 ; 5F33 _ C1. E8, 18
        mov     edx, eax                                ; 5F36 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5F38 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5F3B _ 88. 50, 07
        nop                                             ; 5F3E _ 90
        pop     ebp                                     ; 5F3F _ 5D
        ret                                             ; 5F40 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5F41 _ 55
        mov     ebp, esp                                ; 5F42 _ 89. E5
        mov     eax, dword [taskctl]                    ; 5F44 _ A1, 000022C8(d)
        pop     ebp                                     ; 5F49 _ 5D
        ret                                             ; 5F4A _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5F4B _ 55
        mov     ebp, esp                                ; 5F4C _ 89. E5
        sub     esp, 16                                 ; 5F4E _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5F51 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5F57 _ 8B. 55, 08
        mov     eax, edx                                ; 5F5A _ 89. D0
        add     eax, eax                                ; 5F5C _ 01. C0
        add     eax, edx                                ; 5F5E _ 01. D0
        shl     eax, 4                                  ; 5F60 _ C1. E0, 04
        add     eax, ecx                                ; 5F63 _ 01. C8
        add     eax, 8                                  ; 5F65 _ 83. C0, 08
        mov     dword [eax], 0                          ; 5F68 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5F6E _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5F74 _ 8B. 55, 08
        mov     eax, edx                                ; 5F77 _ 89. D0
        add     eax, eax                                ; 5F79 _ 01. C0
        add     eax, edx                                ; 5F7B _ 01. D0
        shl     eax, 4                                  ; 5F7D _ C1. E0, 04
        add     eax, ecx                                ; 5F80 _ 01. C8
        add     eax, 12                                 ; 5F82 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 5F85 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 5F8B _ C7. 45, FC, 00000000
        jmp     ?_389                                   ; 5F92 _ EB, 1B

?_388:  mov     edx, dword [taskctl]                    ; 5F94 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-4H]                     ; 5F9A _ 8B. 45, FC
        imul    eax, eax, 52                            ; 5F9D _ 6B. C0, 34
        add     eax, edx                                ; 5FA0 _ 01. D0
        add     eax, 16                                 ; 5FA2 _ 83. C0, 10
        mov     dword [eax], 0                          ; 5FA5 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 5FAB _ 83. 45, FC, 01
?_389:  cmp     dword [ebp-4H], 9                       ; 5FAF _ 83. 7D, FC, 09
        jle     ?_388                                   ; 5FB3 _ 7E, DF
        leave                                           ; 5FB5 _ C9
        ret                                             ; 5FB6 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5FB7 _ 55
        mov     ebp, esp                                ; 5FB8 _ 89. E5
        sub     esp, 40                                 ; 5FBA _ 83. EC, 28
        call    get_addr_gdt                            ; 5FBD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5FC2 _ 89. 45, F0
        mov     dword [esp+4H], 3128                    ; 5FC5 _ C7. 44 24, 04, 00000C38
        mov     eax, dword [ebp+8H]                     ; 5FCD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5FD0 _ 89. 04 24
        call    memman_alloc_4k                         ; 5FD3 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 5FD8 _ A3, 000022C8(d)
        mov     dword [ebp-14H], 0                      ; 5FDD _ C7. 45, EC, 00000000
        jmp     ?_391                                   ; 5FE4 _ E9, 000000F8

?_390:  mov     edx, dword [taskctl]                    ; 5FE9 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5FEF _ 8B. 45, EC
        imul    eax, eax, 208                           ; 5FF2 _ 69. C0, 000000D0
        add     eax, edx                                ; 5FF8 _ 01. D0
        add     eax, 492                                ; 5FFA _ 05, 000001EC
        mov     dword [eax], 0                          ; 5FFF _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 6005 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 600B _ 8B. 45, EC
        add     eax, 7                                  ; 600E _ 83. C0, 07
        lea     edx, [eax*8]                            ; 6011 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 6018 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 601B _ 69. C0, 000000D0
        add     eax, ecx                                ; 6021 _ 01. C8
        add     eax, 488                                ; 6023 _ 05, 000001E8
        mov     dword [eax], edx                        ; 6028 _ 89. 10
        mov     ecx, dword [taskctl]                    ; 602A _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 6030 _ 8B. 45, EC
        add     eax, 17                                 ; 6033 _ 83. C0, 11
        lea     edx, [eax*8]                            ; 6036 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 603D _ 8B. 45, EC
        imul    eax, eax, 208                           ; 6040 _ 69. C0, 000000D0
        add     eax, ecx                                ; 6046 _ 01. C8
        add     eax, 628                                ; 6048 _ 05, 00000274
        mov     dword [eax], edx                        ; 604D _ 89. 10
        mov     eax, dword [taskctl]                    ; 604F _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 6054 _ 8B. 55, EC
        imul    edx, edx, 208                           ; 6057 _ 69. D2, 000000D0
        add     edx, 512                                ; 605D _ 81. C2, 00000200
        add     eax, edx                                ; 6063 _ 01. D0
        add     eax, 20                                 ; 6065 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 6068 _ 8B. 55, EC
        add     edx, 7                                  ; 606B _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 606E _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 6075 _ 8B. 55, F0
        add     edx, ecx                                ; 6078 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 607A _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 6082 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 6086 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 608E _ 89. 14 24
        call    set_segmdesc                            ; 6091 _ E8, FFFFFFFC(rel)
        mov     eax, dword [taskctl]                    ; 6096 _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 609B _ 8B. 55, EC
        imul    edx, edx, 208                           ; 609E _ 69. D2, 000000D0
        add     edx, 656                                ; 60A4 _ 81. C2, 00000290
        add     eax, edx                                ; 60AA _ 01. D0
        add     eax, 20                                 ; 60AC _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 60AF _ 8B. 55, EC
        add     edx, 17                                 ; 60B2 _ 83. C2, 11
        lea     ecx, [edx*8]                            ; 60B5 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 60BC _ 8B. 55, F0
        add     edx, ecx                                ; 60BF _ 01. CA
        mov     dword [esp+0CH], 130                    ; 60C1 _ C7. 44 24, 0C, 00000082
        mov     dword [esp+8H], eax                     ; 60C9 _ 89. 44 24, 08
        mov     dword [esp+4H], 15                      ; 60CD _ C7. 44 24, 04, 0000000F
        mov     dword [esp], edx                        ; 60D5 _ 89. 14 24
        call    set_segmdesc                            ; 60D8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 60DD _ 83. 45, EC, 01
?_391:  cmp     dword [ebp-14H], 9                      ; 60E1 _ 83. 7D, EC, 09
        jle     ?_390                                   ; 60E5 _ 0F 8E, FFFFFEFE
        mov     dword [ebp-14H], 0                      ; 60EB _ C7. 45, EC, 00000000
        jmp     ?_393                                   ; 60F2 _ EB, 0F

?_392:  mov     eax, dword [ebp-14H]                    ; 60F4 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 60F7 _ 89. 04 24
        call    init_task_level                         ; 60FA _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 60FF _ 83. 45, EC, 01
?_393:  cmp     dword [ebp-14H], 9                      ; 6103 _ 83. 7D, EC, 09
        jle     ?_392                                   ; 6107 _ 7E, EB
        call    task_alloc                              ; 6109 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 610E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 6111 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 6114 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 611B _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 611E _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 6125 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 6128 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 612F _ 8B. 45, F4
        mov     dword [esp], eax                        ; 6132 _ 89. 04 24
        call    task_add                                ; 6135 _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 613A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 613F _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 6142 _ 8B. 00
        mov     dword [esp], eax                        ; 6144 _ 89. 04 24
        call    load_tr                                 ; 6147 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 614C _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 6151 _ A3, 000022C4(d)
        mov     eax, dword [ebp-0CH]                    ; 6156 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 6159 _ 8B. 40, 08
        mov     edx, eax                                ; 615C _ 89. C2
        mov     eax, dword [task_timer]                 ; 615E _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 6163 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 6167 _ 89. 04 24
        call    timer_settime                           ; 616A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 616F _ 8B. 45, F4
        leave                                           ; 6172 _ C9
        ret                                             ; 6173 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 6174 _ 55
        mov     ebp, esp                                ; 6175 _ 89. E5
        sub     esp, 16                                 ; 6177 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 617A _ C7. 45, F8, 00000000
        jmp     ?_396                                   ; 6181 _ E9, 000000F8

?_394:  mov     edx, dword [taskctl]                    ; 6186 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-8H]                     ; 618C _ 8B. 45, F8
        imul    eax, eax, 208                           ; 618F _ 69. C0, 000000D0
        add     eax, edx                                ; 6195 _ 01. D0
        add     eax, 492                                ; 6197 _ 05, 000001EC
        mov     eax, dword [eax]                        ; 619C _ 8B. 00
        test    eax, eax                                ; 619E _ 85. C0
        jne     ?_395                                   ; 61A0 _ 0F 85, 000000D4
        mov     eax, dword [taskctl]                    ; 61A6 _ A1, 000022C8(d)
        mov     edx, dword [ebp-8H]                     ; 61AB _ 8B. 55, F8
        imul    edx, edx, 208                           ; 61AE _ 69. D2, 000000D0
        add     edx, 480                                ; 61B4 _ 81. C2, 000001E0
        add     eax, edx                                ; 61BA _ 01. D0
        add     eax, 8                                  ; 61BC _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 61BF _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 61C2 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 61C5 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 61CC _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 61CF _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 61D6 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 61D9 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 61E0 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 61E3 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 61EA _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 61ED _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 61F4 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 61F7 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 61FE _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 6201 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 6208 _ 8B. 45, F8
        add     eax, 1                                  ; 620B _ 83. C0, 01
        shl     eax, 9                                  ; 620E _ C1. E0, 09
        mov     edx, eax                                ; 6211 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 6213 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 6216 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 6219 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 621C _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 6223 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 6226 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 622D _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 6230 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 6237 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 623A _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 6244 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 6247 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 6251 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 6254 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 625E _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 6261 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 6268 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 626B _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 6275 _ 8B. 45, FC
        jmp     ?_397                                   ; 6278 _ EB, 13

?_395:  add     dword [ebp-8H], 1                       ; 627A _ 83. 45, F8, 01
?_396:  cmp     dword [ebp-8H], 9                       ; 627E _ 83. 7D, F8, 09
        jle     ?_394                                   ; 6282 _ 0F 8E, FFFFFEFE
        mov     eax, 0                                  ; 6288 _ B8, 00000000
?_397:  leave                                           ; 628D _ C9
        ret                                             ; 628E _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 628F _ 55
        mov     ebp, esp                                ; 6290 _ 89. E5
        sub     esp, 24                                 ; 6292 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 6295 _ 83. 7D, 0C, 00
        jns     ?_398                                   ; 6299 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 629B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 629E _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 62A1 _ 89. 45, 0C
?_398:  cmp     dword [ebp+10H], 0                      ; 62A4 _ 83. 7D, 10, 00
        jle     ?_399                                   ; 62A8 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 62AA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 62AD _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 62B0 _ 89. 50, 08
?_399:  mov     eax, dword [ebp+8H]                     ; 62B3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 62B6 _ 8B. 40, 04
        cmp     eax, 2                                  ; 62B9 _ 83. F8, 02
        jnz     ?_400                                   ; 62BC _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 62BE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 62C1 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 62C4 _ 3B. 45, 0C
        jz      ?_400                                   ; 62C7 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 62C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 62CC _ 89. 04 24
        call    task_remove                             ; 62CF _ E8, FFFFFFFC(rel)
?_400:  mov     eax, dword [ebp+8H]                     ; 62D4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 62D7 _ 8B. 40, 04
        cmp     eax, 2                                  ; 62DA _ 83. F8, 02
        jz      ?_401                                   ; 62DD _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 62DF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 62E2 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 62E5 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 62E8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 62EB _ 89. 04 24
        call    task_add                                ; 62EE _ E8, FFFFFFFC(rel)
?_401:  mov     eax, dword [taskctl]                    ; 62F3 _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 62F8 _ C7. 40, 04, 00000001
        nop                                             ; 62FF _ 90
        leave                                           ; 6300 _ C9
        ret                                             ; 6301 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 6302 _ 55
        mov     ebp, esp                                ; 6303 _ 89. E5
        sub     esp, 40                                 ; 6305 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 6308 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 630E _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 6313 _ 8B. 10
        mov     eax, edx                                ; 6315 _ 89. D0
        add     eax, eax                                ; 6317 _ 01. C0
        add     eax, edx                                ; 6319 _ 01. D0
        shl     eax, 4                                  ; 631B _ C1. E0, 04
        add     eax, ecx                                ; 631E _ 01. C8
        add     eax, 8                                  ; 6320 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 6323 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 6326 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 6329 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 632C _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 632F _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 6333 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 6336 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 6339 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 633C _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 633F _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 6342 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 6345 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 6348 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 634B _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 634E _ 8B. 00
        cmp     edx, eax                                ; 6350 _ 39. C2
        jnz     ?_402                                   ; 6352 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 6354 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 6357 _ C7. 40, 04, 00000000
?_402:  mov     eax, dword [taskctl]                    ; 635E _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 6363 _ 8B. 40, 04
        test    eax, eax                                ; 6366 _ 85. C0
        jz      ?_403                                   ; 6368 _ 74, 23
        call    task_switchsub                          ; 636A _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 636F _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 6375 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 637A _ 8B. 10
        mov     eax, edx                                ; 637C _ 89. D0
        add     eax, eax                                ; 637E _ 01. C0
        add     eax, edx                                ; 6380 _ 01. D0
        shl     eax, 4                                  ; 6382 _ C1. E0, 04
        add     eax, ecx                                ; 6385 _ 01. C8
        add     eax, 8                                  ; 6387 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 638A _ 89. 45, EC
?_403:  mov     eax, dword [ebp-14H]                    ; 638D _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 6390 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 6393 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 6396 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 639A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 639D _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 63A0 _ 8B. 40, 08
        mov     edx, eax                                ; 63A3 _ 89. C2
        mov     eax, dword [task_timer]                 ; 63A5 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 63AA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 63AE _ 89. 04 24
        call    timer_settime                           ; 63B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 63B6 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 63B9 _ 3B. 45, F0
        jz      ?_404                                   ; 63BC _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 63BE _ 83. 7D, F4, 00
        jz      ?_404                                   ; 63C2 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 63C4 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 63C7 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 63C9 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 63CD _ C7. 04 24, 00000000
        call    farjmp                                  ; 63D4 _ E8, FFFFFFFC(rel)
?_404:  nop                                             ; 63D9 _ 90
        leave                                           ; 63DA _ C9
        ret                                             ; 63DB _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 63DC _ 55
        mov     ebp, esp                                ; 63DD _ 89. E5
        sub     esp, 40                                 ; 63DF _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 63E2 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 63E9 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 63F0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 63F3 _ 8B. 40, 04
        cmp     eax, 2                                  ; 63F6 _ 83. F8, 02
        jnz     ?_405                                   ; 63F9 _ 75, 51
        call    task_now                                ; 63FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 6400 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 6403 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 6406 _ 89. 04 24
        call    task_remove                             ; 6409 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 640E _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 6415 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 6418 _ 3B. 45, F4
        jnz     ?_405                                   ; 641B _ 75, 2F
        call    task_switchsub                          ; 641D _ E8, FFFFFFFC(rel)
        call    task_now                                ; 6422 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 6427 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 642A _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 6431 _ 83. 7D, F4, 00
        jz      ?_405                                   ; 6435 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 6437 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 643A _ 8B. 00
        mov     dword [esp+4H], eax                     ; 643C _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 6440 _ C7. 04 24, 00000000
        call    farjmp                                  ; 6447 _ E8, FFFFFFFC(rel)
?_405:  mov     eax, dword [ebp-10H]                    ; 644C _ 8B. 45, F0
        leave                                           ; 644F _ C9
        ret                                             ; 6450 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 6451 _ 55
        mov     ebp, esp                                ; 6452 _ 89. E5
        sub     esp, 16                                 ; 6454 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 6457 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 645D _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 6462 _ 8B. 10
        mov     eax, edx                                ; 6464 _ 89. D0
        add     eax, eax                                ; 6466 _ 01. C0
        add     eax, edx                                ; 6468 _ 01. D0
        shl     eax, 4                                  ; 646A _ C1. E0, 04
        add     eax, ecx                                ; 646D _ 01. C8
        add     eax, 8                                  ; 646F _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6472 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 6475 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 6478 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 647B _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 647E _ 8B. 44 90, 08
        leave                                           ; 6482 _ C9
        ret                                             ; 6483 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 6484 _ 55
        mov     ebp, esp                                ; 6485 _ 89. E5
        sub     esp, 16                                 ; 6487 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 648A _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 6490 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 6493 _ 8B. 50, 0C
        mov     eax, edx                                ; 6496 _ 89. D0
        add     eax, eax                                ; 6498 _ 01. C0
        add     eax, edx                                ; 649A _ 01. D0
        shl     eax, 4                                  ; 649C _ C1. E0, 04
        add     eax, ecx                                ; 649F _ 01. C8
        add     eax, 8                                  ; 64A1 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 64A4 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 64A7 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 64AA _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 64AC _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 64AF _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 64B2 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 64B6 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 64B9 _ 8B. 00
        lea     edx, [eax+1H]                           ; 64BB _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 64BE _ 8B. 45, FC
        mov     dword [eax], edx                        ; 64C1 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 64C3 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 64C6 _ C7. 40, 04, 00000002
        nop                                             ; 64CD _ 90
        leave                                           ; 64CE _ C9
        ret                                             ; 64CF _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 64D0 _ 55
        mov     ebp, esp                                ; 64D1 _ 89. E5
        sub     esp, 16                                 ; 64D3 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 64D6 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 64DC _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 64DF _ 8B. 50, 0C
        mov     eax, edx                                ; 64E2 _ 89. D0
        add     eax, eax                                ; 64E4 _ 01. C0
        add     eax, edx                                ; 64E6 _ 01. D0
        shl     eax, 4                                  ; 64E8 _ C1. E0, 04
        add     eax, ecx                                ; 64EB _ 01. C8
        add     eax, 8                                  ; 64ED _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 64F0 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 64F3 _ C7. 45, F8, 00000000
        jmp     ?_408                                   ; 64FA _ EB, 23

?_406:  mov     eax, dword [ebp-4H]                     ; 64FC _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 64FF _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 6502 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 6506 _ 3B. 45, 08
        jnz     ?_407                                   ; 6509 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 650B _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 650E _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 6511 _ C7. 44 90, 08, 00000000
        jmp     ?_409                                   ; 6519 _ EB, 0E

?_407:  add     dword [ebp-8H], 1                       ; 651B _ 83. 45, F8, 01
?_408:  mov     eax, dword [ebp-4H]                     ; 651F _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6522 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 6524 _ 3B. 45, F8
        jg      ?_406                                   ; 6527 _ 7F, D3
?_409:  mov     eax, dword [ebp-4H]                     ; 6529 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 652C _ 8B. 00
        lea     edx, [eax-1H]                           ; 652E _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 6531 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 6534 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 6536 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 6539 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 653C _ 3B. 45, F8
        jle     ?_410                                   ; 653F _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 6541 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 6544 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 6547 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 654A _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 654D _ 89. 50, 04
?_410:  mov     eax, dword [ebp-4H]                     ; 6550 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 6553 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 6556 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6559 _ 8B. 00
        cmp     edx, eax                                ; 655B _ 39. C2
        jl      ?_411                                   ; 655D _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 655F _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 6562 _ C7. 40, 04, 00000000
?_411:  mov     eax, dword [ebp+8H]                     ; 6569 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 656C _ C7. 40, 04, 00000001
        jmp     ?_413                                   ; 6573 _ EB, 1B

?_412:  mov     eax, dword [ebp-8H]                     ; 6575 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 6578 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 657B _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 657E _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 6582 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 6585 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 6588 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 658C _ 83. 45, F8, 01
?_413:  mov     eax, dword [ebp-4H]                     ; 6590 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6593 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 6595 _ 3B. 45, F8
        jg      ?_412                                   ; 6598 _ 7F, DB
        nop                                             ; 659A _ 90
        leave                                           ; 659B _ C9
        ret                                             ; 659C _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 659D _ 55
        mov     ebp, esp                                ; 659E _ 89. E5
        sub     esp, 16                                 ; 65A0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 65A3 _ C7. 45, FC, 00000000
        jmp     ?_416                                   ; 65AA _ EB, 23

?_414:  mov     ecx, dword [taskctl]                    ; 65AC _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 65B2 _ 8B. 55, FC
        mov     eax, edx                                ; 65B5 _ 89. D0
        add     eax, eax                                ; 65B7 _ 01. C0
        add     eax, edx                                ; 65B9 _ 01. D0
        shl     eax, 4                                  ; 65BB _ C1. E0, 04
        add     eax, ecx                                ; 65BE _ 01. C8
        add     eax, 8                                  ; 65C0 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 65C3 _ 8B. 00
        test    eax, eax                                ; 65C5 _ 85. C0
        jle     ?_415                                   ; 65C7 _ 7E, 02
        jmp     ?_417                                   ; 65C9 _ EB, 0A

?_415:  add     dword [ebp-4H], 1                       ; 65CB _ 83. 45, FC, 01
?_416:  cmp     dword [ebp-4H], 9                       ; 65CF _ 83. 7D, FC, 09
        jle     ?_414                                   ; 65D3 _ 7E, D7
?_417:  mov     eax, dword [taskctl]                    ; 65D5 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 65DA _ 8B. 55, FC
        mov     dword [eax], edx                        ; 65DD _ 89. 10
        mov     eax, dword [taskctl]                    ; 65DF _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 65E4 _ C7. 40, 04, 00000000
        leave                                           ; 65EB _ C9
        ret                                             ; 65EC _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 65ED _ 55
        mov     ebp, esp                                ; 65EE _ 89. E5
        sub     esp, 24                                 ; 65F0 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 65F3 _ 8B. 45, 10
        movzx   eax, al                                 ; 65F6 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 65F9 _ 8B. 55, 0C
        add     edx, 16                                 ; 65FC _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 65FF _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 6603 _ 89. 14 24
        call    fifo8_put                               ; 6606 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 660B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 660E _ 89. 04 24
        call    task_sleep                              ; 6611 _ E8, FFFFFFFC(rel)
        leave                                           ; 6616 _ C9
        ret                                             ; 6617 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_418:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_419:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_420:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_421:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_422:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_423:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_424:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_425:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0025 _ mem.

?_426:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0029 _ cls.

?_427:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 002D _ hlt.

?_428:                                                  ; byte
        db 61H, 62H, 63H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ abc.exe.

?_429:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_430:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_431:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_432:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_433:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 00H                 ; 004D _ crack.

?_434:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 2EH, 65H, 78H       ; 0053 _ crack.ex
        db 65H, 00H                                     ; 005B _ e.

?_435:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 005D _ keyboard
        db 00H                                          ; 0065 _ .

?_436:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0066 _ user pro
        db 63H, 00H                                     ; 006E _ c.

?_437:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0070 _ page is:
        db 20H, 00H                                     ; 0078 _  .

?_438:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 007A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0082 _ L: .

?_439:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0086 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 008E _ H: .

?_440:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0092 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 009A _ w: .

?_441:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009E _ INT OC.

?_442:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A5 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AD _ ception.

?_443:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B5 _ EIP = .

?_444:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00BC _ INT 0D .

?_445:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00C4 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00CC _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00D4 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00DC _ ion.


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0038 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 0080 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 0088 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 0090 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 0098 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00A0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00A8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00B0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 00C8 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 00D0 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 00F0 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 00F8 _ ......|.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0110 _ 0X

?_446:  db 00H                                          ; 0112 _ .

?_447:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH                                    ; 0120 _ 29 

show_console_window:                                    ; dword
        dd 00000001H                                    ; 0124 _ 1 

console_pos:                                            ; dword
        dd 000000F0H, 00000000H                         ; 0128 _ 240 0 
        dd 00000000H, 00000000H                         ; 0130 _ 0 0 
        dd 00000000H, 00000000H                         ; 0138 _ 0 0 

table_rgb.2132:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0140 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2192:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0180 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0188 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0190 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0198 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01A0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01B0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01D0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01F0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0200 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0210 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0220 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0228 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0230 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0238 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0240 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0248 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0250 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0258 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0260 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0268 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0270 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0278 _ .....***

closebtn.2311:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0280 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0288 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0290 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0298 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02A0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02B0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02B8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02C0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02E0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02F0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02F8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0300 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0310 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0318 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0320 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0328 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0330 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0338 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0340 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0348 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0350 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0358 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 4, bss

key_shift:                                              ; dword
        resd    1                                       ; 0000

caps_lock:                                              ; dword
        resd    1                                       ; 0004

first_task_cons_selector:                               ; dword
        resd    1                                       ; 0008

current_console:                                        ; dword
        resd    1                                       ; 000C

console_count:                                          ; dword
        resd    1                                       ; 0010

bootInfo:                                               ; qword
        resb    4                                       ; 0014

?_448:  resw    1                                       ; 0018

?_449:  resw    1                                       ; 001A

keyinfo:                                                ; byte
        resb    24                                      ; 001C

?_450:  resd    1                                       ; 0034

mouseinfo:                                              ; byte
        resb    40                                      ; 0038

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_451:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  7                                       ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0160

shtMsgBox:                                              ; dword
        resd    1                                       ; 0260

shtctl: resd    1                                       ; 0264

sht_back: resd  1                                       ; 0268

sht_mouse:                                              ; dword
        resd    1                                       ; 026C

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 0270

task_main:                                              ; dword
        resd    1                                       ; 0274

current_console_task:                                   ; dword
        resd    1                                       ; 0278

task_a.1827:                                            ; dword
        resd    1                                       ; 027C

tss_a.1826:                                             ; byte
        resb    128                                     ; 0280

tss_b.1825:                                             ; byte
        resb    104                                     ; 0300

task_b.1815:                                            ; byte
        resb    12                                      ; 0368

str.2240:                                               ; byte
        resb    1                                       ; 0374

?_452:  resb    9                                       ; 0375

?_453:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    2001                                    ; 0380

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


