; Disassembly of file: app.o
; Mon Feb 15 16:19:53 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






putstr: ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 72                                 ; 0003 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 0006 _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+14H]                    ; 000D _ 8B. 45, 14
        add     eax, 1                                  ; 0010 _ 83. C0, 01
        shl     eax, 3                                  ; 0013 _ C1. E0, 03
        mov     dword [ebp+14H], eax                    ; 0016 _ 89. 45, 14
        mov     eax, dword [ebp+18H]                    ; 0019 _ 8B. 45, 18
        shl     eax, 4                                  ; 001C _ C1. E0, 04
        add     eax, 29                                 ; 001F _ 83. C0, 1D
        mov     dword [ebp+18H], eax                    ; 0022 _ 89. 45, 18
        mov     eax, dword [ebp+14H]                    ; 0025 _ 8B. 45, 14
        mov     dword [ebp-14H], eax                    ; 0028 _ 89. 45, EC
        jmp     ?_002                                   ; 002B _ EB, 04

?_001:  add     dword [ebp-0CH], 1                      ; 002D _ 83. 45, F4, 01
?_002:  mov     edx, dword [ebp-0CH]                    ; 0031 _ 8B. 55, F4
        mov     eax, dword [ebp+20H]                    ; 0034 _ 8B. 45, 20
        add     eax, edx                                ; 0037 _ 01. D0
        movzx   eax, byte [eax]                         ; 0039 _ 0F B6. 00
        test    al, al                                  ; 003C _ 84. C0
        jnz near      ?_001                                   ; 003e _ 75, ed
        mov     eax, dword [ebp+18H]                    ; 0040 _ 8B. 45, 18
        add     eax, 15                                 ; 0043 _ 83. C0, 0F
        mov     dword [esp+14H], 0                      ; 0046 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], eax                    ; 004E _ 89. 44 24, 10
        mov     dword [esp+0CH], 262                    ; 0052 _ C7. 44 24, 0C, 00000106
        mov     eax, dword [ebp+18H]                    ; 005A _ 8B. 45, 18
        mov     dword [esp+8H], eax                     ; 005D _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0061 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp+8H]                     ; 0069 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 006C _ 89. 04 24
        call    api_boxfilwin                           ; 006F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 0074 _ 8B. 45, 18
        imul    eax, eax, 270                           ; 0077 _ 69. C0, 0000010E
        mov     edx, eax                                ; 007D _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 007F _ 8B. 45, 0C
        add     eax, edx                                ; 0082 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 0084 _ 89. 45, F0
        mov     byte [ebp-1DH], 0                       ; 0087 _ C6. 45, E3, 00
?_003:  mov     eax, dword [ebp+20H]                    ; 008B _ 8B. 45, 20
        movzx   eax, byte [eax]                         ; 008E _ 0F B6. 00
        movzx   eax, al                                 ; 0091 _ 0F B6. C0
        mov     dword [ebp-18H], eax                    ; 0094 _ 89. 45, E8
        cmp     dword [ebp-18H], 0                      ; 0097 _ 83. 7D, E8, 00
        jnz near      ?_004                                   ; 009b _ 75, 05
        jmp     ?_019                                   ; 009D _ E9, 000001BD

?_004:  cmp     dword [ebp-18H], 32                     ; 00A2 _ 83. 7D, E8, 20
        je near       ?_018                                   ; 00a6 _ 0f 84, 000001a6
        cmp     dword [ebp-18H], 96                     ; 00AC _ 83. 7D, E8, 60
        jle near      ?_015                                   ; 00b0 _ 0f 8e, 0000014c
        cmp     dword [ebp-18H], 104                    ; 00B6 _ 83. 7D, E8, 68
        jg  near      ?_015                                   ; 00ba _ 0f 8f, 00000142
        mov     eax, dword [ebp-18H]                    ; 00C0 _ 8B. 45, E8
        sub     eax, 97                                 ; 00C3 _ 83. E8, 61
        shl     eax, 4                                  ; 00C6 _ C1. E0, 04
        mov     edx, eax                                ; 00C9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 00CB _ 8B. 45, 10
        add     eax, edx                                ; 00CE _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 00D0 _ 89. 45, E4
        mov     eax, dword [ebp+14H]                    ; 00D3 _ 8B. 45, 14
        add     dword [ebp-10H], eax                    ; 00D6 _ 01. 45, F0
        mov     dword [ebp-0CH], 0                      ; 00D9 _ C7. 45, F4, 00000000
        jmp     ?_014                                   ; 00E0 _ E9, 00000104

?_005:  mov     edx, dword [ebp-0CH]                    ; 00E5 _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 00E8 _ 8B. 45, E4
        add     eax, edx                                ; 00EB _ 01. D0
        movzx   eax, byte [eax]                         ; 00ED _ 0F B6. 00
        test    al, al                                  ; 00F0 _ 84. C0
        jns near      ?_006                                   ; 00f2 _ 79, 0a
        mov     eax, dword [ebp+1CH]                    ; 00F4 _ 8B. 45, 1C
        mov     edx, eax                                ; 00F7 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 00F9 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 00FC _ 88. 10
?_006:  mov     edx, dword [ebp-0CH]                    ; 00FE _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 0101 _ 8B. 45, E4
        add     eax, edx                                ; 0104 _ 01. D0
        movzx   eax, byte [eax]                         ; 0106 _ 0F B6. 00
        movsx   eax, al                                 ; 0109 _ 0F BE. C0
        and     eax, 40H                                ; 010C _ 83. E0, 40
        test    eax, eax                                ; 010F _ 85. C0
        jz near       ?_007                                   ; 0111 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 0113 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 0116 _ 8D. 50, 01
        mov     eax, dword [ebp+1CH]                    ; 0119 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 011C _ 88. 02
?_007:  mov     edx, dword [ebp-0CH]                    ; 011E _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 0121 _ 8B. 45, E4
        add     eax, edx                                ; 0124 _ 01. D0
        movzx   eax, byte [eax]                         ; 0126 _ 0F B6. 00
        movsx   eax, al                                 ; 0129 _ 0F BE. C0
        and     eax, 20H                                ; 012C _ 83. E0, 20
        test    eax, eax                                ; 012F _ 85. C0
        jz near       ?_008                                   ; 0131 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 0133 _ 8B. 45, F0
        lea     edx, [eax+2H]                           ; 0136 _ 8D. 50, 02
        mov     eax, dword [ebp+1CH]                    ; 0139 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 013C _ 88. 02
?_008:  mov     edx, dword [ebp-0CH]                    ; 013E _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 0141 _ 8B. 45, E4
        add     eax, edx                                ; 0144 _ 01. D0
        movzx   eax, byte [eax]                         ; 0146 _ 0F B6. 00
        movsx   eax, al                                 ; 0149 _ 0F BE. C0
        and     eax, 10H                                ; 014C _ 83. E0, 10
        test    eax, eax                                ; 014F _ 85. C0
        jz near       ?_009                                   ; 0151 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 0153 _ 8B. 45, F0
        lea     edx, [eax+3H]                           ; 0156 _ 8D. 50, 03
        mov     eax, dword [ebp+1CH]                    ; 0159 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 015C _ 88. 02
?_009:  mov     edx, dword [ebp-0CH]                    ; 015E _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 0161 _ 8B. 45, E4
        add     eax, edx                                ; 0164 _ 01. D0
        movzx   eax, byte [eax]                         ; 0166 _ 0F B6. 00
        movsx   eax, al                                 ; 0169 _ 0F BE. C0
        and     eax, 08H                                ; 016C _ 83. E0, 08
        test    eax, eax                                ; 016F _ 85. C0
        jz near       ?_010                                   ; 0171 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 0173 _ 8B. 45, F0
        lea     edx, [eax+4H]                           ; 0176 _ 8D. 50, 04
        mov     eax, dword [ebp+1CH]                    ; 0179 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 017C _ 88. 02
?_010:  mov     edx, dword [ebp-0CH]                    ; 017E _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 0181 _ 8B. 45, E4
        add     eax, edx                                ; 0184 _ 01. D0
        movzx   eax, byte [eax]                         ; 0186 _ 0F B6. 00
        movsx   eax, al                                 ; 0189 _ 0F BE. C0
        and     eax, 04H                                ; 018C _ 83. E0, 04
        test    eax, eax                                ; 018F _ 85. C0
        jz near       ?_011                                   ; 0191 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 0193 _ 8B. 45, F0
        lea     edx, [eax+5H]                           ; 0196 _ 8D. 50, 05
        mov     eax, dword [ebp+1CH]                    ; 0199 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 019C _ 88. 02
?_011:  mov     edx, dword [ebp-0CH]                    ; 019E _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 01A1 _ 8B. 45, E4
        add     eax, edx                                ; 01A4 _ 01. D0
        movzx   eax, byte [eax]                         ; 01A6 _ 0F B6. 00
        movsx   eax, al                                 ; 01A9 _ 0F BE. C0
        and     eax, 02H                                ; 01AC _ 83. E0, 02
        test    eax, eax                                ; 01AF _ 85. C0
        jz near       ?_012                                   ; 01b1 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 01B3 _ 8B. 45, F0
        lea     edx, [eax+6H]                           ; 01B6 _ 8D. 50, 06
        mov     eax, dword [ebp+1CH]                    ; 01B9 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 01BC _ 88. 02
?_012:  mov     edx, dword [ebp-0CH]                    ; 01BE _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 01C1 _ 8B. 45, E4
        add     eax, edx                                ; 01C4 _ 01. D0
        movzx   eax, byte [eax]                         ; 01C6 _ 0F B6. 00
        movsx   eax, al                                 ; 01C9 _ 0F BE. C0
        and     eax, 01H                                ; 01CC _ 83. E0, 01
        test    eax, eax                                ; 01CF _ 85. C0
        jz near       ?_013                                   ; 01d1 _ 74, 0b
        mov     eax, dword [ebp-10H]                    ; 01D3 _ 8B. 45, F0
        lea     edx, [eax+7H]                           ; 01D6 _ 8D. 50, 07
        mov     eax, dword [ebp+1CH]                    ; 01D9 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 01DC _ 88. 02
?_013:  add     dword [ebp-10H], 270                    ; 01DE _ 81. 45, F0, 0000010E
        add     dword [ebp-0CH], 1                      ; 01E5 _ 83. 45, F4, 01
?_014:  cmp     dword [ebp-0CH], 15                     ; 01E9 _ 83. 7D, F4, 0F
        jle near      ?_005                                   ; 01ed _ 0f 8e, fffffef2
        mov     eax, dword [ebp+14H]                    ; 01F3 _ 8B. 45, 14
        add     eax, 4320                               ; 01F6 _ 05, 000010E0
        neg     eax                                     ; 01FB _ F7. D8
        add     dword [ebp-10H], eax                    ; 01FD _ 01. 45, F0
        jmp     ?_018                                   ; 0200 _ EB, 50

?_015:  cmp     dword [ebp-18H], 104                    ; 0202 _ 83. 7D, E8, 68
        jle near      ?_016                                   ; 0206 _ 7e, 06
        cmp     dword [ebp-18H], 122                    ; 0208 _ 83. 7D, E8, 7A
        jle near      ?_017                                   ; 020c _ 7e, 0c
?_016:  cmp     dword [ebp-18H], 64                     ; 020E _ 83. 7D, E8, 40
        jle near      ?_018                                   ; 0212 _ 7e, 3e
        cmp     dword [ebp-18H], 90                     ; 0214 _ 83. 7D, E8, 5A
        jg  near      ?_018                                   ; 0218 _ 7f, 38
?_017:  mov     eax, dword [ebp+20H]                    ; 021A _ 8B. 45, 20
        movzx   eax, byte [eax]                         ; 021D _ 0F B6. 00
        mov     byte [ebp-1EH], al                      ; 0220 _ 88. 45, E2
        lea     eax, [ebp-1EH]                          ; 0223 _ 8D. 45, E2
        mov     dword [esp+14H], eax                    ; 0226 _ 89. 44 24, 14
        mov     dword [esp+10H], 1                      ; 022A _ C7. 44 24, 10, 00000001
        mov     eax, dword [ebp+1CH]                    ; 0232 _ 8B. 45, 1C
        mov     dword [esp+0CH], eax                    ; 0235 _ 89. 44 24, 0C
        mov     eax, dword [ebp+18H]                    ; 0239 _ 8B. 45, 18
        mov     dword [esp+8H], eax                     ; 023C _ 89. 44 24, 08
        mov     eax, dword [ebp+14H]                    ; 0240 _ 8B. 45, 14
        mov     dword [esp+4H], eax                     ; 0243 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0247 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 024A _ 89. 04 24
        call    api_putstrwin                           ; 024D _ E8, FFFFFFFC(rel)
?_018:  add     dword [ebp+20H], 1                      ; 0252 _ 83. 45, 20, 01
        add     dword [ebp+14H], 8                      ; 0256 _ 83. 45, 14, 08
        jmp     ?_003                                   ; 025A _ E9, FFFFFE2C

?_019:  mov     eax, dword [ebp+18H]                    ; 025F _ 8B. 45, 18
        add     eax, 15                                 ; 0262 _ 83. C0, 0F
        mov     dword [esp+10H], eax                    ; 0265 _ 89. 44 24, 10
        mov     dword [esp+0CH], 262                    ; 0269 _ C7. 44 24, 0C, 00000106
        mov     eax, dword [ebp+18H]                    ; 0271 _ 8B. 45, 18
        mov     dword [esp+8H], eax                     ; 0274 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0278 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp+8H]                     ; 0280 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0283 _ 89. 04 24
        call    api_refreshwin                          ; 0286 _ E8, FFFFFFFC(rel)
        leave                                           ; 028B _ C9
        ret                                             ; 028C _ C3
; putstr End of function

waitting:; Function begin
        push    ebp                                     ; 028D _ 55
        mov     ebp, esp                                ; 028E _ 89. E5
        sub     esp, 40                                 ; 0290 _ 83. EC, 28
        cmp     dword [ebp+8H], 0                       ; 0293 _ 83. 7D, 08, 00
        jle near      ?_020                                   ; 0297 _ 7e, 1b
        mov     eax, dword [ebp+8H]                     ; 0299 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 029C _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 02A0 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 02A3 _ 89. 04 24
        call    api_settimer                            ; 02A6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp+8H], 128                     ; 02AB _ C7. 45, 08, 00000080
        jmp     ?_021                                   ; 02B2 _ EB, 07

?_020:  mov     dword [ebp+8H], 28                      ; 02B4 _ C7. 45, 08, 0000001C
?_021:  mov     dword [esp], 1                          ; 02BB _ C7. 04 24, 00000001
        call    api_getkey                              ; 02C2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02C7 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 02CA _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 02CD _ 3B. 45, F4
        jnz near      ?_022                                   ; 02d0 _ 75, 02
        jmp     ?_026                                   ; 02D2 _ EB, 2E

?_022:  cmp     dword [ebp-0CH], 36                     ; 02D4 _ 83. 7D, F4, 24
        jnz near      ?_023                                   ; 02d8 _ 75, 06
        mov     eax, dword [ebp+10H]                    ; 02DA _ 8B. 45, 10
        mov     byte [eax], 1                           ; 02DD _ C6. 00, 01
?_023:  cmp     dword [ebp-0CH], 37                     ; 02E0 _ 83. 7D, F4, 25
        jnz near      ?_024                                   ; 02e4 _ 75, 09
        mov     eax, dword [ebp+10H]                    ; 02E6 _ 8B. 45, 10
        add     eax, 1                                  ; 02E9 _ 83. C0, 01
        mov     byte [eax], 1                           ; 02EC _ C6. 00, 01
?_024:  cmp     dword [ebp-0CH], 57                     ; 02EF _ 83. 7D, F4, 39
        jnz near      ?_025                                   ; 02f3 _ 75, 0b
        mov     eax, dword [ebp+10H]                    ; 02F5 _ 8B. 45, 10
        add     eax, 2                                  ; 02F8 _ 83. C0, 02
        mov     byte [eax], 1                           ; 02FB _ C6. 00, 01
        jmp     ?_021                                   ; 02FE _ EB, BB

?_025:  jmp     ?_021                                   ; 0300 _ EB, B9

?_026:  nop                                             ; 0302 _ 90
        leave                                           ; 0303 _ C9
        ret                                             ; 0304 _ C3
; waitting End of function

main:   ; Function begin
        push    ebp                                     ; 0305 _ 55
        mov     ebp, esp                                ; 0306 _ 89. E5
        push    edi                                     ; 0308 _ 57
        push    ebx                                     ; 0309 _ 53
        and     esp, 0FFFFFFF0H                         ; 030A _ 83. E4, F0
        sub     esp, 64496                              ; 030D _ 81. EC, 0000FBF0
        lea     edx, [esp+0FEH]                         ; 0313 _ 8D. 94 24, 000000FE
        mov     ebx, 192                                ; 031A _ BB, 000000C0
        mov     eax, 0                                  ; 031F _ B8, 00000000
        mov     ecx, edx                                ; 0324 _ 89. D1
        and     ecx, 02H                                ; 0326 _ 83. E1, 02
        test    ecx, ecx                                ; 0329 _ 85. C9
        jz near       ?_027                                   ; 032b _ 74, 09
        mov     word [edx], ax                          ; 032D _ 66: 89. 02
        add     edx, 2                                  ; 0330 _ 83. C2, 02
        sub     ebx, 2                                  ; 0333 _ 83. EB, 02
?_027:  mov     ecx, ebx                                ; 0336 _ 89. D9
        shr     ecx, 2                                  ; 0338 _ C1. E9, 02
        mov     edi, edx                                ; 033B _ 89. D7
        rep stosd                                       ; 033D _ F3: AB
        mov     edx, edi                                ; 033F _ 89. FA
        mov     ecx, ebx                                ; 0341 _ 89. D9
        and     ecx, 02H                                ; 0343 _ 83. E1, 02
        test    ecx, ecx                                ; 0346 _ 85. C9
        jz near       ?_028                                   ; 0348 _ 74, 06
        mov     word [edx], ax                          ; 034A _ 66: 89. 02
        add     edx, 2                                  ; 034D _ 83. C2, 02
?_028:  and     ebx, 01H                                ; 0350 _ 83. E3, 01
        mov     ecx, ebx                                ; 0353 _ 89. D9
        test    ecx, ecx                                ; 0355 _ 85. C9
        jz near       ?_029                                   ; 0357 _ 74, 05
        mov     byte [edx], al                          ; 0359 _ 88. 02
        add     edx, 1                                  ; 035B _ 83. C2, 01
?_029:  lea     eax, [esp+1BEH]                         ; 035E _ 8D. 84 24, 000001BE
        mov     dword [esp+0FBD8H], eax                 ; 0365 _ 89. 84 24, 0000FBD8
        lea     ebx, [esp+0C8H]                         ; 036C _ 8D. 9C 24, 000000C8
        mov     eax, 0                                  ; 0373 _ B8, 00000000
        mov     edx, 9                                  ; 0378 _ BA, 00000009
        mov     edi, ebx                                ; 037D _ 89. DF
        mov     ecx, edx                                ; 037F _ 89. D1
        rep stosd                                       ; 0381 _ F3: AB
        mov     byte [esp+0C8H], 32                     ; 0383 _ C6. 84 24, 000000C8, 20
        mov     byte [esp+0C9H], 97                     ; 038B _ C6. 84 24, 000000C9, 61
        mov     byte [esp+0CAH], 98                     ; 0393 _ C6. 84 24, 000000CA, 62
        mov     byte [esp+0CBH], 99                     ; 039B _ C6. 84 24, 000000CB, 63
        mov     byte [esp+0CCH], 100                    ; 03A3 _ C6. 84 24, 000000CC, 64
        mov     byte [esp+0CDH], 32                     ; 03AB _ C6. 84 24, 000000CD, 20
        mov     byte [esp+0CEH], 97                     ; 03B3 _ C6. 84 24, 000000CE, 61
        mov     byte [esp+0CFH], 98                     ; 03BB _ C6. 84 24, 000000CF, 62
        mov     byte [esp+0D0H], 99                     ; 03C3 _ C6. 84 24, 000000D0, 63
        mov     byte [esp+0D1H], 100                    ; 03CB _ C6. 84 24, 000000D1, 64
        mov     byte [esp+0D2H], 32                     ; 03D3 _ C6. 84 24, 000000D2, 20
        mov     byte [esp+0D3H], 97                     ; 03DB _ C6. 84 24, 000000D3, 61
        mov     byte [esp+0D4H], 98                     ; 03E3 _ C6. 84 24, 000000D4, 62
        mov     byte [esp+0D5H], 99                     ; 03EB _ C6. 84 24, 000000D5, 63
        mov     byte [esp+0D6H], 100                    ; 03F3 _ C6. 84 24, 000000D6, 64
        mov     byte [esp+0D7H], 32                     ; 03FB _ C6. 84 24, 000000D7, 20
        mov     byte [esp+0D8H], 97                     ; 0403 _ C6. 84 24, 000000D8, 61
        mov     byte [esp+0D9H], 98                     ; 040B _ C6. 84 24, 000000D9, 62
        mov     byte [esp+0DAH], 99                     ; 0413 _ C6. 84 24, 000000DA, 63
        mov     byte [esp+0DBH], 100                    ; 041B _ C6. 84 24, 000000DB, 64
        mov     byte [esp+0DCH], 32                     ; 0423 _ C6. 84 24, 000000DC, 20
        mov     byte [esp+0DDH], 97                     ; 042B _ C6. 84 24, 000000DD, 61
        mov     byte [esp+0DEH], 98                     ; 0433 _ C6. 84 24, 000000DE, 62
        mov     byte [esp+0DFH], 99                     ; 043B _ C6. 84 24, 000000DF, 63
        mov     byte [esp+0E0H], 100                    ; 0443 _ C6. 84 24, 000000E0, 64
        mov     byte [esp+0E1H], 32                     ; 044B _ C6. 84 24, 000000E1, 20
        lea     ebx, [esp+38H]                          ; 0453 _ 8D. 5C 24, 38
        mov     eax, 0                                  ; 0457 _ B8, 00000000
        mov     edx, 36                                 ; 045C _ BA, 00000024
        mov     edi, ebx                                ; 0461 _ 89. DF
        mov     ecx, edx                                ; 0463 _ 89. D1
        rep stosd                                       ; 0465 _ F3: AB
        mov     byte [esp+3BH], 67                      ; 0467 _ C6. 44 24, 3B, 43
        mov     byte [esp+3CH], 95                      ; 046C _ C6. 44 24, 3C, 5F
        mov     byte [esp+3DH], 95                      ; 0471 _ C6. 44 24, 3D, 5F
        mov     byte [esp+3EH], 95                      ; 0476 _ C6. 44 24, 3E, 5F
        mov     byte [esp+3FH], 127                     ; 047B _ C6. 44 24, 3F, 7F
        mov     byte [esp+40H], 31                      ; 0480 _ C6. 44 24, 40, 1F
        mov     byte [esp+41H], 31                      ; 0485 _ C6. 44 24, 41, 1F
        mov     byte [esp+42H], 31                      ; 048A _ C6. 44 24, 42, 1F
        mov     byte [esp+43H], 31                      ; 048F _ C6. 44 24, 43, 1F
        mov     byte [esp+45H], 32                      ; 0494 _ C6. 44 24, 45, 20
        mov     byte [esp+46H], 63                      ; 0499 _ C6. 44 24, 46, 3F
        mov     byte [esp+49H], 15                      ; 049E _ C6. 44 24, 49, 0F
        mov     byte [esp+4AH], 127                     ; 04A3 _ C6. 44 24, 4A, 7F
        mov     byte [esp+4BH], -1                      ; 04A8 _ C6. 44 24, 4B, FF
        mov     byte [esp+4CH], -49                     ; 04AD _ C6. 44 24, 4C, CF
        mov     byte [esp+4DH], -49                     ; 04B2 _ C6. 44 24, 4D, CF
        mov     byte [esp+4EH], -49                     ; 04B7 _ C6. 44 24, 4E, CF
        mov     byte [esp+4FH], -1                      ; 04BC _ C6. 44 24, 4F, FF
        mov     byte [esp+50H], -1                      ; 04C1 _ C6. 44 24, 50, FF
        mov     byte [esp+51H], -32                     ; 04C6 _ C6. 44 24, 51, E0
        mov     byte [esp+52H], -1                      ; 04CB _ C6. 44 24, 52, FF
        mov     byte [esp+53H], -1                      ; 04D0 _ C6. 44 24, 53, FF
        mov     byte [esp+54H], -64                     ; 04D5 _ C6. 44 24, 54, C0
        mov     byte [esp+55H], -64                     ; 04DA _ C6. 44 24, 55, C0
        mov     byte [esp+56H], -64                     ; 04DF _ C6. 44 24, 56, C0
        mov     byte [esp+59H], -16                     ; 04E4 _ C6. 44 24, 59, F0
        mov     byte [esp+5AH], -2                      ; 04E9 _ C6. 44 24, 5A, FE
        mov     byte [esp+5BH], -1                      ; 04EE _ C6. 44 24, 5B, FF
        mov     byte [esp+5CH], -13                     ; 04F3 _ C6. 44 24, 5C, F3
        mov     byte [esp+5DH], -13                     ; 04F8 _ C6. 44 24, 5D, F3
        mov     byte [esp+5EH], -13                     ; 04FD _ C6. 44 24, 5E, F3
        mov     byte [esp+5FH], -1                      ; 0502 _ C6. 44 24, 5F, FF
        mov     byte [esp+60H], -1                      ; 0507 _ C6. 44 24, 60, FF
        mov     byte [esp+61H], 7                       ; 050C _ C6. 44 24, 61, 07
        mov     byte [esp+62H], -1                      ; 0511 _ C6. 44 24, 62, FF
        mov     byte [esp+63H], -1                      ; 0516 _ C6. 44 24, 63, FF
        mov     byte [esp+64H], 3                       ; 051B _ C6. 44 24, 64, 03
        mov     byte [esp+65H], 3                       ; 0520 _ C6. 44 24, 65, 03
        mov     byte [esp+66H], 3                       ; 0525 _ C6. 44 24, 66, 03
        mov     byte [esp+6BH], -62                     ; 052A _ C6. 44 24, 6B, C2
        mov     byte [esp+6CH], -6                      ; 052F _ C6. 44 24, 6C, FA
        mov     byte [esp+6DH], -6                      ; 0534 _ C6. 44 24, 6D, FA
        mov     byte [esp+6EH], -6                      ; 0539 _ C6. 44 24, 6E, FA
        mov     byte [esp+6FH], -2                      ; 053E _ C6. 44 24, 6F, FE
        mov     byte [esp+70H], -8                      ; 0543 _ C6. 44 24, 70, F8
        mov     byte [esp+71H], -8                      ; 0548 _ C6. 44 24, 71, F8
        mov     byte [esp+72H], -8                      ; 054D _ C6. 44 24, 72, F8
        mov     byte [esp+73H], -8                      ; 0552 _ C6. 44 24, 73, F8
        mov     byte [esp+75H], 4                       ; 0557 _ C6. 44 24, 75, 04
        mov     byte [esp+76H], -4                      ; 055C _ C6. 44 24, 76, FC
        mov     byte [esp+7AH], 1                       ; 0561 _ C6. 44 24, 7A, 01
        mov     byte [esp+7BH], 1                       ; 0566 _ C6. 44 24, 7B, 01
        mov     byte [esp+7CH], 1                       ; 056B _ C6. 44 24, 7C, 01
        mov     byte [esp+7DH], 1                       ; 0570 _ C6. 44 24, 7D, 01
        mov     byte [esp+7EH], 1                       ; 0575 _ C6. 44 24, 7E, 01
        mov     byte [esp+7FH], 1                       ; 057A _ C6. 44 24, 7F, 01
        mov     byte [esp+80H], 1                       ; 057F _ C6. 84 24, 00000080, 01
        mov     byte [esp+81H], 67                      ; 0587 _ C6. 84 24, 00000081, 43
        mov     byte [esp+82H], 71                      ; 058F _ C6. 84 24, 00000082, 47
        mov     byte [esp+83H], 79                      ; 0597 _ C6. 84 24, 00000083, 4F
        mov     byte [esp+84H], 95                      ; 059F _ C6. 84 24, 00000084, 5F
        mov     byte [esp+85H], 127                     ; 05A7 _ C6. 84 24, 00000085, 7F
        mov     byte [esp+86H], 127                     ; 05AF _ C6. 84 24, 00000086, 7F
        mov     byte [esp+88H], 24                      ; 05B7 _ C6. 84 24, 00000088, 18
        mov     byte [esp+89H], 126                     ; 05BF _ C6. 84 24, 00000089, 7E
        mov     byte [esp+8AH], -1                      ; 05C7 _ C6. 84 24, 0000008A, FF
        mov     byte [esp+8BH], -61                     ; 05CF _ C6. 84 24, 0000008B, C3
        mov     byte [esp+8CH], -61                     ; 05D7 _ C6. 84 24, 0000008C, C3
        mov     byte [esp+8DH], -61                     ; 05DF _ C6. 84 24, 0000008D, C3
        mov     byte [esp+8EH], -61                     ; 05E7 _ C6. 84 24, 0000008E, C3
        mov     byte [esp+8FH], -1                      ; 05EF _ C6. 84 24, 0000008F, FF
        mov     byte [esp+90H], -1                      ; 05F7 _ C6. 84 24, 00000090, FF
        mov     byte [esp+91H], -1                      ; 05FF _ C6. 84 24, 00000091, FF
        mov     byte [esp+92H], -25                     ; 0607 _ C6. 84 24, 00000092, E7
        mov     byte [esp+93H], -25                     ; 060F _ C6. 84 24, 00000093, E7
        mov     byte [esp+94H], -25                     ; 0617 _ C6. 84 24, 00000094, E7
        mov     byte [esp+95H], -25                     ; 061F _ C6. 84 24, 00000095, E7
        mov     byte [esp+96H], -1                      ; 0627 _ C6. 84 24, 00000096, FF
        mov     byte [esp+9AH], -128                    ; 062F _ C6. 84 24, 0000009A, 80
        mov     byte [esp+9BH], -128                    ; 0637 _ C6. 84 24, 0000009B, 80
        mov     byte [esp+9CH], -128                    ; 063F _ C6. 84 24, 0000009C, 80
        mov     byte [esp+9DH], -128                    ; 0647 _ C6. 84 24, 0000009D, 80
        mov     byte [esp+9EH], -128                    ; 064F _ C6. 84 24, 0000009E, 80
        mov     byte [esp+9FH], -128                    ; 0657 _ C6. 84 24, 0000009F, 80
        mov     byte [esp+0A0H], -128                   ; 065F _ C6. 84 24, 000000A0, 80
        mov     byte [esp+0A1H], -62                    ; 0667 _ C6. 84 24, 000000A1, C2
        mov     byte [esp+0A2H], -30                    ; 066F _ C6. 84 24, 000000A2, E2
        mov     byte [esp+0A3H], -14                    ; 0677 _ C6. 84 24, 000000A3, F2
        mov     byte [esp+0A4H], -6                     ; 067F _ C6. 84 24, 000000A4, FA
        mov     byte [esp+0A5H], -2                     ; 0687 _ C6. 84 24, 000000A5, FE
        mov     byte [esp+0A6H], -2                     ; 068F _ C6. 84 24, 000000A6, FE
        mov     byte [esp+0A9H], 24                     ; 0697 _ C6. 84 24, 000000A9, 18
        mov     byte [esp+0AAH], 24                     ; 069F _ C6. 84 24, 000000AA, 18
        mov     byte [esp+0ABH], 24                     ; 06A7 _ C6. 84 24, 000000AB, 18
        mov     byte [esp+0ACH], 24                     ; 06AF _ C6. 84 24, 000000AC, 18
        mov     byte [esp+0ADH], 24                     ; 06B7 _ C6. 84 24, 000000AD, 18
        mov     byte [esp+0AEH], 24                     ; 06BF _ C6. 84 24, 000000AE, 18
        mov     byte [esp+0AFH], 24                     ; 06C7 _ C6. 84 24, 000000AF, 18
        mov     byte [esp+0B0H], 24                     ; 06CF _ C6. 84 24, 000000B0, 18
        mov     byte [esp+0B1H], 24                     ; 06D7 _ C6. 84 24, 000000B1, 18
        mov     byte [esp+0B2H], 24                     ; 06DF _ C6. 84 24, 000000B2, 18
        mov     byte [esp+0B3H], 24                     ; 06E7 _ C6. 84 24, 000000B3, 18
        mov     byte [esp+0B4H], 24                     ; 06EF _ C6. 84 24, 000000B4, 18
        mov     byte [esp+0B5H], 24                     ; 06F7 _ C6. 84 24, 000000B5, 18
        mov     byte [esp+0B6H], 24                     ; 06FF _ C6. 84 24, 000000B6, 18
        mov     dword [esp+10H], ?_062                  ; 0707 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], -1                     ; 070F _ C7. 44 24, 0C, FFFFFFFF
        mov     dword [esp+8H], 237                     ; 0717 _ C7. 44 24, 08, 000000ED
        mov     dword [esp+4H], 270                     ; 071F _ C7. 44 24, 04, 0000010E
        lea     eax, [esp+1BEH]                         ; 0727 _ 8D. 84 24, 000001BE
        mov     dword [esp], eax                        ; 072E _ 89. 04 24
        call    api_openwin                             ; 0731 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0FBBCH], eax                 ; 0736 _ 89. 84 24, 0000FBBC
        mov     dword [esp+14H], 0                      ; 073D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 228                    ; 0745 _ C7. 44 24, 10, 000000E4
        mov     dword [esp+0CH], 264                    ; 074D _ C7. 44 24, 0C, 00000108
        mov     dword [esp+8H], 29                      ; 0755 _ C7. 44 24, 08, 0000001D
        mov     dword [esp+4H], 8                       ; 075D _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+0FBBCH]                 ; 0765 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 076C _ 89. 04 24
        call    api_boxfilwin                           ; 076F _ E8, FFFFFFFC(rel)
        call    api_alloctimer                          ; 0774 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0FBB8H], eax                 ; 0779 _ 89. 84 24, 0000FBB8
        mov     dword [esp+4H], 128                     ; 0780 _ C7. 44 24, 04, 00000080
        mov     eax, dword [esp+0FBB8H]                 ; 0788 _ 8B. 84 24, 0000FBB8
        mov     dword [esp], eax                        ; 078F _ 89. 04 24
        call    api_inittimer                           ; 0792 _ E8, FFFFFFFC(rel)
?_030:  mov     dword [esp+0FBDCH], 18                  ; 0797 _ C7. 84 24, 0000FBDC, 00000012
        mov     dword [esp+30H], 0                      ; 07A2 _ C7. 44 24, 30, 00000000
        mov     dword [esp+34H], 0                      ; 07AA _ C7. 44 24, 34, 00000000
        mov     byte [esp+30H], 101                     ; 07B2 _ C6. 44 24, 30, 65
        mov     byte [esp+31H], 102                     ; 07B7 _ C6. 44 24, 31, 66
        mov     byte [esp+32H], 103                     ; 07BC _ C6. 44 24, 32, 67
        lea     eax, [esp+30H]                          ; 07C1 _ 8D. 44 24, 30
        mov     dword [esp+18H], eax                    ; 07C5 _ 89. 44 24, 18
        mov     dword [esp+14H], 6                      ; 07C9 _ C7. 44 24, 14, 00000006
        mov     dword [esp+10H], 11                     ; 07D1 _ C7. 44 24, 10, 0000000B
        mov     dword [esp+0CH], 18                     ; 07D9 _ C7. 44 24, 0C, 00000012
        lea     eax, [esp+38H]                          ; 07E1 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 07E5 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 07E9 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 07F0 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 07F4 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 07FB _ 89. 04 24
        call    putstr                                  ; 07FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0FBB4H], 20                  ; 0803 _ C7. 84 24, 0000FBB4, 00000014
        mov     dword [esp+0FBE4H], 7                   ; 080E _ C7. 84 24, 0000FBE4, 00000007
        mov     dword [esp+0FBE0H], 1                   ; 0819 _ C7. 84 24, 0000FBE0, 00000001
        mov     dword [esp+0FBCCH], 3                   ; 0824 _ C7. 84 24, 0000FBCC, 00000003
        mov     dword [esp+0FBECH], 0                   ; 082F _ C7. 84 24, 0000FBEC, 00000000
        jmp     ?_034                                   ; 083A _ E9, 000000B6

?_031:  mov     dword [esp+0FBE8H], 0                   ; 083F _ C7. 84 24, 0000FBE8, 00000000
        jmp     ?_033                                   ; 084A _ EB, 37

?_032:  mov     eax, dword [esp+0FBECH]                 ; 084C _ 8B. 84 24, 0000FBEC
        shl     eax, 5                                  ; 0853 _ C1. E0, 05
        mov     edx, eax                                ; 0856 _ 89. C2
        mov     eax, dword [esp+0FBE8H]                 ; 0858 _ 8B. 84 24, 0000FBE8
        add     edx, eax                                ; 085F _ 01. C2
        lea     ecx, [esp+0C8H]                         ; 0861 _ 8D. 8C 24, 000000C8
        mov     eax, dword [esp+0FBE8H]                 ; 0868 _ 8B. 84 24, 0000FBE8
        add     eax, ecx                                ; 086F _ 01. C8
        movzx   eax, byte [eax]                         ; 0871 _ 0F B6. 00
        mov     byte [esp+edx+0FEH], al                 ; 0874 _ 88. 84 14, 000000FE
        add     dword [esp+0FBE8H], 1                   ; 087B _ 83. 84 24, 0000FBE8, 01
?_033:  cmp     dword [esp+0FBE8H], 19                  ; 0883 _ 83. BC 24, 0000FBE8, 13
        jle near      ?_032                                   ; 088b _ 7e, bf
        mov     eax, dword [esp+0FBECH]                 ; 088D _ 8B. 84 24, 0000FBEC
        shl     eax, 5                                  ; 0894 _ C1. E0, 05
        lea     edx, [esp+0FEH]                         ; 0897 _ 8D. 94 24, 000000FE
        add     edx, eax                                ; 089E _ 01. C2
        mov     eax, dword [esp+0FBECH]                 ; 08A0 _ 8B. 84 24, 0000FBEC
        mov     ecx, dword [esp+0FBE0H]                 ; 08A7 _ 8B. 8C 24, 0000FBE0
        add     eax, ecx                                ; 08AE _ 01. C8
        mov     dword [esp+18H], edx                    ; 08B0 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 08B4 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 08BC _ 89. 44 24, 10
        mov     eax, dword [esp+0FBE4H]                 ; 08C0 _ 8B. 84 24, 0000FBE4
        mov     dword [esp+0CH], eax                    ; 08C7 _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 08CB _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 08CF _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 08D3 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 08DA _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 08DE _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 08E5 _ 89. 04 24
        call    putstr                                  ; 08E8 _ E8, FFFFFFFC(rel)
        add     dword [esp+0FBECH], 1                   ; 08ED _ 83. 84 24, 0000FBEC, 01
?_034:  cmp     dword [esp+0FBECH], 2                   ; 08F5 _ 83. BC 24, 0000FBEC, 02
        jle near      ?_031                                   ; 08fd _ 0f 8e, ffffff3c
        mov     byte [esp+0ECH], 0                      ; 0903 _ C6. 84 24, 000000EC, 00
        mov     byte [esp+0EDH], 0                      ; 090B _ C6. 84 24, 000000ED, 00
        mov     byte [esp+0EEH], 0                      ; 0913 _ C6. 84 24, 000000EE, 00
        mov     dword [esp+0FBC8H], 0                   ; 091B _ C7. 84 24, 0000FBC8, 00000000
        mov     dword [esp+0FBC4H], 0                   ; 0926 _ C7. 84 24, 0000FBC4, 00000000
        mov     dword [esp+0FBC0H], 0                   ; 0931 _ C7. 84 24, 0000FBC0, 00000000
        mov     eax, dword [esp+0FBB4H]                 ; 093C _ 8B. 84 24, 0000FBB4
        mov     dword [esp+0FBD0H], eax                 ; 0943 _ 89. 84 24, 0000FBD0
        mov     dword [esp+0FBD4H], 1                   ; 094A _ C7. 84 24, 0000FBD4, 00000001
        jmp     ?_036                                   ; 0955 _ EB, 01

?_035:  nop                                             ; 0957 _ 90
?_036:  cmp     dword [esp+0FBC0H], 0                   ; 0958 _ 83. BC 24, 0000FBC0, 00
        jz near       ?_037                                   ; 0960 _ 74, 10
        sub     dword [esp+0FBC0H], 1                   ; 0962 _ 83. AC 24, 0000FBC0, 01
        mov     byte [esp+0EEH], 0                      ; 096A _ C6. 84 24, 000000EE, 00
?_037:  lea     eax, [esp+0ECH]                         ; 0972 _ 8D. 84 24, 000000EC
        mov     dword [esp+8H], eax                     ; 0979 _ 89. 44 24, 08
        mov     eax, dword [esp+0FBB8H]                 ; 097D _ 8B. 84 24, 0000FBB8
        mov     dword [esp+4H], eax                     ; 0984 _ 89. 44 24, 04
        mov     dword [esp], 4                          ; 0988 _ C7. 04 24, 00000004
        call    waitting                                ; 098F _ E8, FFFFFFFC(rel)
        movzx   eax, byte [esp+0ECH]                    ; 0994 _ 0F B6. 84 24, 000000EC
        test    al, al                                  ; 099C _ 84. C0
        jz near       ?_038                                   ; 099e _ 74, 78
        cmp     dword [esp+0FBDCH], 1                   ; 09A0 _ 83. BC 24, 0000FBDC, 01
        jle near      ?_038                                   ; 09a8 _ 7e, 6e
        sub     dword [esp+0FBDCH], 1                   ; 09AA _ 83. AC 24, 0000FBDC, 01
        mov     byte [esp+30H], 101                     ; 09B2 _ C6. 44 24, 30, 65
        mov     byte [esp+31H], 102                     ; 09B7 _ C6. 44 24, 31, 66
        mov     byte [esp+32H], 103                     ; 09BC _ C6. 44 24, 32, 67
        mov     byte [esp+33H], 32                      ; 09C1 _ C6. 44 24, 33, 20
        mov     byte [esp+34H], 0                       ; 09C6 _ C6. 44 24, 34, 00
        lea     eax, [esp+30H]                          ; 09CB _ 8D. 44 24, 30
        mov     dword [esp+18H], eax                    ; 09CF _ 89. 44 24, 18
        mov     dword [esp+14H], 6                      ; 09D3 _ C7. 44 24, 14, 00000006
        mov     dword [esp+10H], 11                     ; 09DB _ C7. 44 24, 10, 0000000B
        mov     eax, dword [esp+0FBDCH]                 ; 09E3 _ 8B. 84 24, 0000FBDC
        mov     dword [esp+0CH], eax                    ; 09EA _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 09EE _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 09F2 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 09F6 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 09FD _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0A01 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0A08 _ 89. 04 24
        call    putstr                                  ; 0A0B _ E8, FFFFFFFC(rel)
        mov     byte [esp+0ECH], 0                      ; 0A10 _ C6. 84 24, 000000EC, 00
?_038:  movzx   eax, byte [esp+0EDH]                    ; 0A18 _ 0F B6. 84 24, 000000ED
        test    al, al                                  ; 0A20 _ 84. C0
        jz near       ?_039                                   ; 0a22 _ 74, 78
        cmp     dword [esp+0FBDCH], 23                  ; 0A24 _ 83. BC 24, 0000FBDC, 17
        jg  near      ?_039                                   ; 0a2c _ 7f, 6e
        add     dword [esp+0FBDCH], 1                   ; 0A2E _ 83. 84 24, 0000FBDC, 01
        mov     byte [esp+30H], 32                      ; 0A36 _ C6. 44 24, 30, 20
        mov     byte [esp+31H], 101                     ; 0A3B _ C6. 44 24, 31, 65
        mov     byte [esp+32H], 102                     ; 0A40 _ C6. 44 24, 32, 66
        mov     byte [esp+33H], 103                     ; 0A45 _ C6. 44 24, 33, 67
        mov     byte [esp+34H], 0                       ; 0A4A _ C6. 44 24, 34, 00
        lea     eax, [esp+30H]                          ; 0A4F _ 8D. 44 24, 30
        mov     dword [esp+18H], eax                    ; 0A53 _ 89. 44 24, 18
        mov     dword [esp+14H], 6                      ; 0A57 _ C7. 44 24, 14, 00000006
        mov     dword [esp+10H], 11                     ; 0A5F _ C7. 44 24, 10, 0000000B
        mov     eax, dword [esp+0FBDCH]                 ; 0A67 _ 8B. 84 24, 0000FBDC
        mov     dword [esp+0CH], eax                    ; 0A6E _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 0A72 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0A76 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0A7A _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0A81 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0A85 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0A8C _ 89. 04 24
        call    putstr                                  ; 0A8F _ E8, FFFFFFFC(rel)
        mov     byte [esp+0EDH], 0                      ; 0A94 _ C6. 84 24, 000000ED, 00
?_039:  movzx   eax, byte [esp+0EEH]                    ; 0A9C _ 0F B6. 84 24, 000000EE
        test    al, al                                  ; 0AA4 _ 84. C0
        jz near       ?_040                                   ; 0aa6 _ 74, 31
        cmp     dword [esp+0FBC0H], 0                   ; 0AA8 _ 83. BC 24, 0000FBC0, 00
        jnz near      ?_040                                   ; 0ab0 _ 75, 27
        mov     dword [esp+0FBC0H], 15                  ; 0AB2 _ C7. 84 24, 0000FBC0, 0000000F
        mov     eax, dword [esp+0FBDCH]                 ; 0ABD _ 8B. 84 24, 0000FBDC
        add     eax, 1                                  ; 0AC4 _ 83. C0, 01
        mov     dword [esp+0FBC4H], eax                 ; 0AC7 _ 89. 84 24, 0000FBC4
        mov     dword [esp+0FBC8H], 8                   ; 0ACE _ C7. 84 24, 0000FBC8, 00000008
?_040:  cmp     dword [esp+0FBD0H], 0                   ; 0AD9 _ 83. BC 24, 0000FBD0, 00
        jz near       ?_041                                   ; 0ae1 _ 74, 0d
        sub     dword [esp+0FBD0H], 1                   ; 0AE3 _ 83. AC 24, 0000FBD0, 01
        jmp     ?_048                                   ; 0AEB _ E9, 0000017B

?_041:  mov     eax, dword [esp+0FBB4H]                 ; 0AF0 _ 8B. 84 24, 0000FBB4
        mov     dword [esp+0FBD0H], eax                 ; 0AF7 _ 89. 84 24, 0000FBD0
        mov     eax, dword [esp+0FBD4H]                 ; 0AFE _ 8B. 84 24, 0000FBD4
        mov     edx, dword [esp+0FBE4H]                 ; 0B05 _ 8B. 94 24, 0000FBE4
        add     eax, edx                                ; 0B0C _ 01. D0
        cmp     eax, 12                                 ; 0B0E _ 83. F8, 0C
        jg  near      ?_042                                   ; 0b11 _ 7f, 18
        mov     eax, dword [esp+0FBD4H]                 ; 0B13 _ 8B. 84 24, 0000FBD4
        mov     edx, dword [esp+0FBE4H]                 ; 0B1A _ 8B. 94 24, 0000FBE4
        add     eax, edx                                ; 0B21 _ 01. D0
        test    eax, eax                                ; 0B23 _ 85. C0
        jg  near      ?_044                                   ; 0b25 _ 0f 8f, 000000ad
?_042:  mov     eax, dword [esp+0FBCCH]                 ; 0B2B _ 8B. 84 24, 0000FBCC
        mov     edx, dword [esp+0FBE0H]                 ; 0B32 _ 8B. 94 24, 0000FBE0
        add     eax, edx                                ; 0B39 _ 01. D0
        cmp     eax, 10                                 ; 0B3B _ 83. F8, 0A
        jnz near      ?_043                                   ; 0b3e _ 75, 3c
        mov     dword [esp+14H], 0                      ; 0B40 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 228                    ; 0B48 _ C7. 44 24, 10, 000000E4
        mov     dword [esp+0CH], 264                    ; 0B50 _ C7. 44 24, 0C, 00000108
        mov     dword [esp+8H], 29                      ; 0B58 _ C7. 44 24, 08, 0000001D
        mov     dword [esp+4H], 8                       ; 0B60 _ C7. 44 24, 04, 00000008
        mov     eax, dword [esp+0FBBCH]                 ; 0B68 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0B6F _ 89. 04 24
        call    api_boxfilwin                           ; 0B72 _ E8, FFFFFFFC(rel)
        jmp     ?_061                                   ; 0B77 _ E9, 00000434

?_043:  neg     dword [esp+0FBD4H]                      ; 0B7C _ F7. 9C 24, 0000FBD4
        mov     eax, dword [esp+0FBE4H]                 ; 0B83 _ 8B. 84 24, 0000FBE4
        lea     edx, [eax+1H]                           ; 0B8A _ 8D. 50, 01
        mov     dword [esp+18H], ?_063                  ; 0B8D _ C7. 44 24, 18, 00000008(d)
        mov     dword [esp+14H], 0                      ; 0B95 _ C7. 44 24, 14, 00000000
        mov     eax, dword [esp+0FBE0H]                 ; 0B9D _ 8B. 84 24, 0000FBE0
        mov     dword [esp+10H], eax                    ; 0BA4 _ 89. 44 24, 10
        mov     dword [esp+0CH], edx                    ; 0BA8 _ 89. 54 24, 0C
        lea     eax, [esp+38H]                          ; 0BAC _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0BB0 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0BB4 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0BBB _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0BBF _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0BC6 _ 89. 04 24
        call    putstr                                  ; 0BC9 _ E8, FFFFFFFC(rel)
        add     dword [esp+0FBE0H], 1                   ; 0BCE _ 83. 84 24, 0000FBE0, 01
        jmp     ?_045                                   ; 0BD6 _ EB, 0E

?_044:  mov     eax, dword [esp+0FBD4H]                 ; 0BD8 _ 8B. 84 24, 0000FBD4
        add     dword [esp+0FBE4H], eax                 ; 0BDF _ 01. 84 24, 0000FBE4
?_045:  mov     dword [esp+0FBECH], 0                   ; 0BE6 _ C7. 84 24, 0000FBEC, 00000000
        jmp     ?_047                                   ; 0BF1 _ EB, 68

?_046:  mov     eax, dword [esp+0FBECH]                 ; 0BF3 _ 8B. 84 24, 0000FBEC
        shl     eax, 5                                  ; 0BFA _ C1. E0, 05
        lea     edx, [esp+0FEH]                         ; 0BFD _ 8D. 94 24, 000000FE
        add     edx, eax                                ; 0C04 _ 01. C2
        mov     eax, dword [esp+0FBECH]                 ; 0C06 _ 8B. 84 24, 0000FBEC
        mov     ecx, dword [esp+0FBE0H]                 ; 0C0D _ 8B. 8C 24, 0000FBE0
        add     eax, ecx                                ; 0C14 _ 01. C8
        mov     dword [esp+18H], edx                    ; 0C16 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0C1A _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0C22 _ 89. 44 24, 10
        mov     eax, dword [esp+0FBE4H]                 ; 0C26 _ 8B. 84 24, 0000FBE4
        mov     dword [esp+0CH], eax                    ; 0C2D _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 0C31 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0C35 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0C39 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0C40 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0C44 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0C4B _ 89. 04 24
        call    putstr                                  ; 0C4E _ E8, FFFFFFFC(rel)
        add     dword [esp+0FBECH], 1                   ; 0C53 _ 83. 84 24, 0000FBEC, 01
?_047:  mov     eax, dword [esp+0FBECH]                 ; 0C5B _ 8B. 84 24, 0000FBEC
        cmp     eax, dword [esp+0FBCCH]                 ; 0C62 _ 3B. 84 24, 0000FBCC
        jl      ?_046                                   ; 0C69 _ 7C, 88
?_048:  cmp     dword [esp+0FBC8H], 0                   ; 0C6B _ 83. BC 24, 0000FBC8, 00
        jle near      ?_035                                   ; 0c73 _ 0f 8e, fffffcde
        cmp     dword [esp+0FBC8H], 7                   ; 0C79 _ 83. BC 24, 0000FBC8, 07
        jg  near      ?_050                                   ; 0c81 _ 0f 8f, 00000100
        mov     eax, dword [esp+0FBE4H]                 ; 0C87 _ 8B. 84 24, 0000FBE4
        cmp     eax, dword [esp+0FBC4H]                 ; 0C8E _ 3B. 84 24, 0000FBC4
        jge near      ?_049                                   ; 0c95 _ 0f 8d, 000000a4
        mov     eax, dword [esp+0FBE4H]                 ; 0C9B _ 8B. 84 24, 0000FBE4
        add     eax, 25                                 ; 0CA2 _ 83. C0, 19
        cmp     eax, dword [esp+0FBC4H]                 ; 0CA5 _ 3B. 84 24, 0000FBC4
        jle near      ?_049                                   ; 0cac _ 0f 8e, 0000008d
        mov     eax, dword [esp+0FBE0H]                 ; 0CB2 _ 8B. 84 24, 0000FBE0
        cmp     eax, dword [esp+0FBC8H]                 ; 0CB9 _ 3B. 84 24, 0000FBC8
        jg  near      ?_049                                   ; 0cc0 _ 7f, 7d
        mov     eax, dword [esp+0FBCCH]                 ; 0CC2 _ 8B. 84 24, 0000FBCC
        mov     edx, dword [esp+0FBE0H]                 ; 0CC9 _ 8B. 94 24, 0000FBE0
        add     eax, edx                                ; 0CD0 _ 01. D0
        cmp     eax, dword [esp+0FBC8H]                 ; 0CD2 _ 3B. 84 24, 0000FBC8
        jle near      ?_049                                   ; 0cd9 _ 7e, 64
        mov     eax, dword [esp+0FBE0H]                 ; 0CDB _ 8B. 84 24, 0000FBE0
        mov     edx, dword [esp+0FBC8H]                 ; 0CE2 _ 8B. 94 24, 0000FBC8
        sub     edx, eax                                ; 0CE9 _ 29. C2
        mov     eax, edx                                ; 0CEB _ 89. D0
        shl     eax, 5                                  ; 0CED _ C1. E0, 05
        lea     edx, [esp+0FEH]                         ; 0CF0 _ 8D. 94 24, 000000FE
        add     eax, edx                                ; 0CF7 _ 01. D0
        mov     dword [esp+18H], eax                    ; 0CF9 _ 89. 44 24, 18
        mov     dword [esp+14H], 2                      ; 0CFD _ C7. 44 24, 14, 00000002
        mov     eax, dword [esp+0FBC8H]                 ; 0D05 _ 8B. 84 24, 0000FBC8
        mov     dword [esp+10H], eax                    ; 0D0C _ 89. 44 24, 10
        mov     eax, dword [esp+0FBE4H]                 ; 0D10 _ 8B. 84 24, 0000FBE4
        mov     dword [esp+0CH], eax                    ; 0D17 _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 0D1B _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0D1F _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0D23 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0D2A _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0D2E _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0D35 _ 89. 04 24
        call    putstr                                  ; 0D38 _ E8, FFFFFFFC(rel)
        jmp     ?_050                                   ; 0D3D _ EB, 48

?_049:  mov     dword [esp+18H], ?_063                  ; 0D3F _ C7. 44 24, 18, 00000008(d)
        mov     dword [esp+14H], 0                      ; 0D47 _ C7. 44 24, 14, 00000000
        mov     eax, dword [esp+0FBC8H]                 ; 0D4F _ 8B. 84 24, 0000FBC8
        mov     dword [esp+10H], eax                    ; 0D56 _ 89. 44 24, 10
        mov     eax, dword [esp+0FBC4H]                 ; 0D5A _ 8B. 84 24, 0000FBC4
        mov     dword [esp+0CH], eax                    ; 0D61 _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 0D65 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0D69 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0D6D _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0D74 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0D78 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0D7F _ 89. 04 24
        call    putstr                                  ; 0D82 _ E8, FFFFFFFC(rel)
?_050:  sub     dword [esp+0FBC8H], 1                   ; 0D87 _ 83. AC 24, 0000FBC8, 01
        cmp     dword [esp+0FBC8H], 0                   ; 0D8F _ 83. BC 24, 0000FBC8, 00
        jle near      ?_051                                   ; 0d97 _ 7e, 52
        mov     byte [esp+2EH], 104                     ; 0D99 _ C6. 44 24, 2E, 68
        mov     byte [esp+2FH], 0                       ; 0D9E _ C6. 44 24, 2F, 00
        lea     eax, [esp+2EH]                          ; 0DA3 _ 8D. 44 24, 2E
        mov     dword [esp+18H], eax                    ; 0DA7 _ 89. 44 24, 18
        mov     dword [esp+14H], 3                      ; 0DAB _ C7. 44 24, 14, 00000003
        mov     eax, dword [esp+0FBC8H]                 ; 0DB3 _ 8B. 84 24, 0000FBC8
        mov     dword [esp+10H], eax                    ; 0DBA _ 89. 44 24, 10
        mov     eax, dword [esp+0FBC4H]                 ; 0DBE _ 8B. 84 24, 0000FBC4
        mov     dword [esp+0CH], eax                    ; 0DC5 _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 0DC9 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0DCD _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0DD1 _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0DD8 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0DDC _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0DE3 _ 89. 04 24
        call    putstr                                  ; 0DE6 _ E8, FFFFFFFC(rel)
?_051:  mov     eax, dword [esp+0FBE4H]                 ; 0DEB _ 8B. 84 24, 0000FBE4
        cmp     eax, dword [esp+0FBC4H]                 ; 0DF2 _ 3B. 84 24, 0000FBC4
        jge near      ?_035                                   ; 0df9 _ 0f 8d, fffffb58
        mov     eax, dword [esp+0FBE4H]                 ; 0DFF _ 8B. 84 24, 0000FBE4
        add     eax, 25                                 ; 0E06 _ 83. C0, 19
        cmp     eax, dword [esp+0FBC4H]                 ; 0E09 _ 3B. 84 24, 0000FBC4
        jle near      ?_035                                   ; 0e10 _ 0f 8e, fffffb41
        mov     eax, dword [esp+0FBE0H]                 ; 0E16 _ 8B. 84 24, 0000FBE0
        cmp     eax, dword [esp+0FBC8H]                 ; 0E1D _ 3B. 84 24, 0000FBC8
        jg  near      ?_035                                   ; 0e24 _ 0f 8f, fffffb2d
        mov     eax, dword [esp+0FBCCH]                 ; 0E2A _ 8B. 84 24, 0000FBCC
        mov     edx, dword [esp+0FBE0H]                 ; 0E31 _ 8B. 94 24, 0000FBE0
        add     eax, edx                                ; 0E38 _ 01. D0
        cmp     eax, dword [esp+0FBC8H]                 ; 0E3A _ 3B. 84 24, 0000FBC8
        jle near      ?_035                                   ; 0e41 _ 0f 8e, fffffb10
        mov     eax, dword [esp+0FBE0H]                 ; 0E47 _ 8B. 84 24, 0000FBE0
        mov     edx, dword [esp+0FBC8H]                 ; 0E4E _ 8B. 94 24, 0000FBC8
        sub     edx, eax                                ; 0E55 _ 29. C2
        mov     eax, edx                                ; 0E57 _ 89. D0
        shl     eax, 5                                  ; 0E59 _ C1. E0, 05
        mov     edx, eax                                ; 0E5C _ 89. C2
        mov     eax, dword [esp+0FBE4H]                 ; 0E5E _ 8B. 84 24, 0000FBE4
        mov     ecx, dword [esp+0FBC4H]                 ; 0E65 _ 8B. 8C 24, 0000FBC4
        sub     ecx, eax                                ; 0E6C _ 29. C1
        mov     eax, ecx                                ; 0E6E _ 89. C8
        add     edx, eax                                ; 0E70 _ 01. C2
        lea     eax, [esp+0FEH]                         ; 0E72 _ 8D. 84 24, 000000FE
        add     eax, edx                                ; 0E79 _ 01. D0
        mov     dword [esp+0FBD8H], eax                 ; 0E7B _ 89. 84 24, 0000FBD8
        mov     eax, dword [esp+0FBD8H]                 ; 0E82 _ 8B. 84 24, 0000FBD8
        movzx   eax, byte [eax]                         ; 0E89 _ 0F B6. 00
        cmp     al, 32                                  ; 0E8C _ 3C, 20
        je near       ?_035                                   ; 0e8e _ 0f 84, fffffac3
        sub     dword [esp+0FBD8H], 1                   ; 0E94 _ 83. AC 24, 0000FBD8, 01
        jmp     ?_053                                   ; 0E9C _ EB, 08

?_052:  sub     dword [esp+0FBD8H], 1                   ; 0E9E _ 83. AC 24, 0000FBD8, 01
?_053:  mov     eax, dword [esp+0FBD8H]                 ; 0EA6 _ 8B. 84 24, 0000FBD8
        movzx   eax, byte [eax]                         ; 0EAD _ 0F B6. 00
        cmp     al, 32                                  ; 0EB0 _ 3C, 20
        jnz near      ?_052                                   ; 0eb2 _ 75, ea
        mov     dword [esp+0FBECH], 1                   ; 0EB4 _ C7. 84 24, 0000FBEC, 00000001
        jmp     ?_055                                   ; 0EBF _ EB, 1B

?_054:  mov     edx, dword [esp+0FBECH]                 ; 0EC1 _ 8B. 94 24, 0000FBEC
        mov     eax, dword [esp+0FBD8H]                 ; 0EC8 _ 8B. 84 24, 0000FBD8
        add     eax, edx                                ; 0ECF _ 01. D0
        mov     byte [eax], 32                          ; 0ED1 _ C6. 00, 20
        add     dword [esp+0FBECH], 1                   ; 0ED4 _ 83. 84 24, 0000FBEC, 01
?_055:  cmp     dword [esp+0FBECH], 4                   ; 0EDC _ 83. BC 24, 0000FBEC, 04
        jle near      ?_054                                   ; 0ee4 _ 7e, db
        mov     eax, dword [esp+0FBE0H]                 ; 0EE6 _ 8B. 84 24, 0000FBE0
        mov     edx, dword [esp+0FBC8H]                 ; 0EED _ 8B. 94 24, 0000FBC8
        sub     edx, eax                                ; 0EF4 _ 29. C2
        mov     eax, edx                                ; 0EF6 _ 89. D0
        shl     eax, 5                                  ; 0EF8 _ C1. E0, 05
        lea     edx, [esp+0FEH]                         ; 0EFB _ 8D. 94 24, 000000FE
        add     eax, edx                                ; 0F02 _ 01. D0
        mov     dword [esp+18H], eax                    ; 0F04 _ 89. 44 24, 18
        mov     dword [esp+14H], 2                      ; 0F08 _ C7. 44 24, 14, 00000002
        mov     eax, dword [esp+0FBC8H]                 ; 0F10 _ 8B. 84 24, 0000FBC8
        mov     dword [esp+10H], eax                    ; 0F17 _ 89. 44 24, 10
        mov     eax, dword [esp+0FBE4H]                 ; 0F1B _ 8B. 84 24, 0000FBE4
        mov     dword [esp+0CH], eax                    ; 0F22 _ 89. 44 24, 0C
        lea     eax, [esp+38H]                          ; 0F26 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 0F2A _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 0F2E _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 0F35 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 0F39 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 0F40 _ 89. 04 24
        call    putstr                                  ; 0F43 _ E8, FFFFFFFC(rel)
        jmp     ?_060                                   ; 0F48 _ EB, 5C

?_056:  mov     eax, dword [esp+0FBCCH]                 ; 0F4A _ 8B. 84 24, 0000FBCC
        sub     eax, 1                                  ; 0F51 _ 83. E8, 01
        shl     eax, 5                                  ; 0F54 _ C1. E0, 05
        lea     edx, [esp+0FEH]                         ; 0F57 _ 8D. 94 24, 000000FE
        add     eax, edx                                ; 0F5E _ 01. D0
        mov     dword [esp+0FBD8H], eax                 ; 0F60 _ 89. 84 24, 0000FBD8
        jmp     ?_059                                   ; 0F67 _ EB, 27

?_057:  mov     eax, dword [esp+0FBD8H]                 ; 0F69 _ 8B. 84 24, 0000FBD8
        movzx   eax, byte [eax]                         ; 0F70 _ 0F B6. 00
        cmp     al, 32                                  ; 0F73 _ 3C, 20
        jz near       ?_058                                   ; 0f75 _ 74, 11
        nop                                             ; 0F77 _ 90
        mov     dword [esp+0FBC8H], 0                   ; 0F78 _ C7. 84 24, 0000FBC8, 00000000
        jmp     ?_035                                   ; 0F83 _ E9, FFFFF9CF

?_058:  add     dword [esp+0FBD8H], 1                   ; 0F88 _ 83. 84 24, 0000FBD8, 01
?_059:  mov     eax, dword [esp+0FBD8H]                 ; 0F90 _ 8B. 84 24, 0000FBD8
        movzx   eax, byte [eax]                         ; 0F97 _ 0F B6. 00
        test    al, al                                  ; 0F9A _ 84. C0
        jnz near      ?_057                                   ; 0f9c _ 75, cb
        sub     dword [esp+0FBCCH], 1                   ; 0F9E _ 83. AC 24, 0000FBCC, 01
?_060:  cmp     dword [esp+0FBCCH], 0                   ; 0FA6 _ 83. BC 24, 0000FBCC, 00
        jg  near      ?_056                                   ; 0fae _ 7f, 9a
?_061:  mov     ecx, dword [esp+0FBB4H]                 ; 0FB0 _ 8B. 8C 24, 0000FBB4
        mov     edx, 1431655766                         ; 0FB7 _ BA, 55555556
        mov     eax, ecx                                ; 0FBC _ 89. C8
        imul    edx                                     ; 0FBE _ F7. EA
        mov     eax, ecx                                ; 0FC0 _ 89. C8
        sar     eax, 31                                 ; 0FC2 _ C1. F8, 1F
        sub     edx, eax                                ; 0FC5 _ 29. C2
        mov     eax, edx                                ; 0FC7 _ 89. D0
        sub     dword [esp+0FBB4H], eax                 ; 0FC9 _ 29. 84 24, 0000FBB4
        mov     dword [esp+22H], 0                      ; 0FD0 _ C7. 44 24, 22, 00000000
        mov     dword [esp+26H], 0                      ; 0FD8 _ C7. 44 24, 26, 00000000
        mov     dword [esp+2AH], 0                      ; 0FE0 _ C7. 44 24, 2A, 00000000
        mov     byte [esp+22H], 71                      ; 0FE8 _ C6. 44 24, 22, 47
        mov     byte [esp+23H], 65                      ; 0FED _ C6. 44 24, 23, 41
        mov     byte [esp+24H], 77                      ; 0FF2 _ C6. 44 24, 24, 4D
        mov     byte [esp+25H], 69                      ; 0FF7 _ C6. 44 24, 25, 45
        mov     byte [esp+26H], 32                      ; 0FFC _ C6. 44 24, 26, 20
        mov     byte [esp+27H], 79                      ; 1001 _ C6. 44 24, 27, 4F
        mov     byte [esp+28H], 86                      ; 1006 _ C6. 44 24, 28, 56
        mov     byte [esp+29H], 69                      ; 100B _ C6. 44 24, 29, 45
        mov     byte [esp+2AH], 82                      ; 1010 _ C6. 44 24, 2A, 52
        lea     eax, [esp+22H]                          ; 1015 _ 8D. 44 24, 22
        mov     dword [esp+18H], eax                    ; 1019 _ 89. 44 24, 18
        mov     dword [esp+14H], 1                      ; 101D _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 6                      ; 1025 _ C7. 44 24, 10, 00000006
        mov     dword [esp+0CH], 15                     ; 102D _ C7. 44 24, 0C, 0000000F
        lea     eax, [esp+38H]                          ; 1035 _ 8D. 44 24, 38
        mov     dword [esp+8H], eax                     ; 1039 _ 89. 44 24, 08
        lea     eax, [esp+1BEH]                         ; 103D _ 8D. 84 24, 000001BE
        mov     dword [esp+4H], eax                     ; 1044 _ 89. 44 24, 04
        mov     eax, dword [esp+0FBBCH]                 ; 1048 _ 8B. 84 24, 0000FBBC
        mov     dword [esp], eax                        ; 104F _ 89. 04 24
        call    putstr                                  ; 1052 _ E8, FFFFFFFC(rel)
        lea     eax, [esp+0ECH]                         ; 1057 _ 8D. 84 24, 000000EC
        mov     dword [esp+8H], eax                     ; 105E _ 89. 44 24, 08
        mov     eax, dword [esp+0FBB8H]                 ; 1062 _ 8B. 84 24, 0000FBB8
        mov     dword [esp+4H], eax                     ; 1069 _ 89. 44 24, 04
        mov     dword [esp], 10                         ; 106D _ C7. 04 24, 0000000A
        call    waitting                                ; 1074 _ E8, FFFFFFFC(rel)
        jmp     ?_030                                   ; 1079 _ E9, FFFFF719
; main End of function







?_062:                                                  ; byte
        db 69H, 6EH, 76H, 61H, 64H, 65H, 72H, 00H       ; 0000 _ invader.

?_063:                                                  ; byte
        db 20H, 20H, 00H                                ; 0008 _   .


