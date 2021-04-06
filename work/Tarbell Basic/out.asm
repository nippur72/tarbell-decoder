
        ORG     0100h

L0100:  JP      L015A

L0103:  JP      L0233

        ; --- START PROC L0106 ---
L0106:  JP      L0212

L0109:  NOP
        NOP
        RET

L010C:  JP      L026C

L010F:  NOP
        NOP
        RET

L0112:  NOP
        NOP
        RET

L0115:  NOP
        NOP
        RET

L0118:  NOP
        NOP
        RET

L011B:  JP      L02A6

L011E:  JP      L0387

L0121:  JP      L0155

L0124:  JP      L013A

L0127:  JP      L0142

L012A:  NOP
        NOP
        ; --- START PROC L012C ---
L012C:  RET

L012D:  NOP
        NOP
        RET

L0130:  LD      (BC),A
        LD      A,(HL)
        INC     E
        NOP
        NOP
        LD      (BC),A
        LD      A,(HL)
        LD      DE,0000h
L013A:  LD      HL,0130h
        ; --- START PROC L013D ---
L013D:  LD      B,(HL)
        INC     HL
        JP      L03DC

L0142:  LD      HL,0135h
        CALL    L013D
        LD      HL,(L065B)
        LD      A,(HL)
        INC     HL
        CALL    L0151
        LD      A,(HL)
        ; --- START PROC L0151 ---
L0151:  OR      A
        JP      L0106

L0155:  NOP
        NOP
        NOP
        NOP
        RET

L015A:  LD      SP,0100h
        LD      HL,0001h
        DEC     HL
        EX      DE,HL
        LD      HL,(L0607)
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,(L0609)
        LD      (HL),0Ah
        LD      B,40h           ; '@'
        LD      HL,0522h
        LD      C,00h
        CALL    L04E6
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LD      A,00h
        LD      (0080h),A
        LD      (L0514+1),A     ; reference not aligned to instruction
        LD      (L0514+2),A     ; reference not aligned to instruction
        LD      A,02h
        LD      (L050C),A
        LD      DE,01A3h
        LD      HL,(L0603)
        LD      B,61h           ; 'a'
        CALL    L0209
        XOR     A
        JP      L0600

L01A3:  INC     BC
        LD      BC,0106h
        DEC     DE
        LD      BC,011Eh
        ADD     HL,BC
        LD      BC,010Ch
        RRCA
        LD      BC,0112h
        DEC     D
        LD      BC,0118h
        LD      BC,1402h
        JR      Z,L01BC
L01BC:  NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LD      C,B
        NOP
        ADC     A,B
        NOP
        NOP
        NOP
        LD      C,B
        NOP
        LD      E,H
        NOP
        NOP
        NOP
        LD      C,B
        NOP
        LD      E,H
        NOP
        NOP
        NOP
        LD      C,B
        NOP
        LD      E,H
        NOP
        NOP
        NOP
        LD      C,B
        NOP
        LD      E,H
        NOP
        NOP
        LD      HL,0001h
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        POP     DE
        INC     BC
        JP      NC,0D303h
        INC     BC
        CALL    NC,0D503h
        INC     BC
        SUB     03h
        EXX
        INC     BC
        RST     0x10
        INC     BC
        INC     H
        LD      BC,0127h
        ADC     A,L
        LD      (BC),A
        RET     C
        INC     BC
        ; --- START PROC L0204 ---
L0204:  LD      B,14h
        LD      DE,04CBh
        ; --- START PROC L0209 ---
L0209:  LD      A,(DE)
        LD      (HL),A
        INC     HL
        INC     DE
        DEC     B
        JP      NZ,L0209
        RET

        ; --- START PROC L0212 ---
L0212:  RET     Z
        RET     C
        PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    L0227
        LD      A,(L0514+1)     ; reference not aligned to instruction
        OR      A
        JP      Z,L03E7
        POP     AF
        PUSH    AF
        JP      L0272

        ; --- START PROC L0227 ---
L0227:  PUSH    AF
L0228:  IN      A,(00h)
        AND     80h
        JP      NZ,L0228
        POP     AF
        OUT     (01h),A
        RET

L0233:  PUSH    HL
        PUSH    DE
        PUSH    BC
        JP      Z,L024F
L0239:  CALL    L0257
        OR      A
        JP      Z,L0239
        CP      10h
        JP      NZ,L03E8
        LD      A,(L0514+1)     ; reference not aligned to instruction
        CPL
        LD      (L0514+1),A     ; reference not aligned to instruction
        JP      L0239

L024F:  CALL    L0263
        CPL
        OR      A
        JP      L03E8

        ; --- START PROC L0257 ---
L0257:  IN      A,(00h)
        AND     01h
        JP      NZ,L0257
        IN      A,(01h)
L0260:  AND     7Fh             ; ''
        RET

        ; --- START PROC L0263 ---
L0263:  IN      A,(00h)
        AND     01h
        LD      A,00h
        RET     NZ
        CPL
        RET

L026C:  RET     Z
        RET     C
        PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        ; --- START PROC L0272 ---
L0272:  CALL    L0278
        JP      L03E7

        ; --- START PROC L0278 ---
L0278:  PUSH    AF
L0279:  IN      A,(02h)
        AND     80h
        JP      NZ,L0279
        POP     AF
        PUSH    AF
        CP      08h
        JP      NZ,L0289
        ; --- START PROC L0287 ---
L0287:  LD      A,5Ch           ; '\'
L0289:  OUT     (03h),A
        POP     AF
        RET

L028D:  NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        ; --- START PROC L029F ---
L029F:  NOP
        NOP
        NOP
        NOP
        ; --- START PROC L02A3 ---
L02A3:  NOP
        NOP
        RET

L02A6:  PUSH    HL
        PUSH    DE
        PUSH    BC
        CALL    L02AF
        JP      L03E8

        ; --- START PROC L02AF ---
L02AF:  JP      Z,L02D4
        JP      C,L04B8
        CALL    L0476
        JP      M,L02C6
        OR      80h
        LD      (HL),A
L02BE:  CALL    L0349
        JP      Z,L02C6
        SCF
        RET

L02C6:  CALL    L04AA
        LD      A,(HL)
        RET     P
        PUSH    AF
        CALL    L0349
        POP     BC
        LD      A,B
        RET     Z
        SCF
        RET

L02D4:  LD      HL,(L0645)
        LD      (HL),00h
        CALL    L0403
L02DC:  CALL    L0349
        RET     NZ
        CALL    L03F6
        EX      DE,HL
        INC     HL
        LD      C,0Bh
L02E7:  LD      A,(DE)
        CP      (HL)
        JP      NZ,L02DC
        INC     DE
        INC     HL
        DEC     C
        JP      NZ,L02E7
        RET

        ; --- START PROC L02F3 ---
L02F3:  CALL    L03F3
        ; --- START PROC L02F6 ---
L02F6:  PUSH    HL
L02F7:  LD      HL,(L065F)
        LD      A,(HL)
        POP     HL
        AND     02h
        LD      DE,000Ah
L0301:  JP      NZ,L030A
        NOP
        NOP
        NOP
        LD      DE,0176h
L030A:  LD      A,3Ch           ; '<'
        CALL    L033B
        DEC     DE
        LD      A,D
        OR      E
        JP      NZ,L030A
        LD      A,0E6h
        CALL    L033B
        LD      C,00h
        LD      A,90h
        CALL    L033B
        LD      A,B
        CALL    L033B
        LD      A,B
        OR      A
        JP      Z,L0333
L032A:  LD      A,(HL)
        CALL    L033B
        INC     HL
        DEC     B
        JP      NZ,L032A
L0333:  LD      A,C
        CALL    L033B
        NOP
        NOP
        NOP
        RET

        ; --- START PROC L033B ---
L033B:  PUSH    AF
L033C:  IN      A,(6Eh)         ; 'n'
        AND     20h             ; ' '
        JP      NZ,L033C
        POP     AF
        OUT     (6Fh),A         ; 'o'
        ADD     A,C
        LD      C,A
        RET

        ; --- START PROC L0349 ---
L0349:  CALL    L03F3
        CALL    L033B
        CALL    L033B
        LD      E,00h
        LD      A,10h
        OUT     (6Eh),A         ; 'n'
        CALL    L0372
        CALL    L0372
        LD      B,A
        JP      Z,L0381
        LD      C,A
L0363:  CALL    L0372
        LD      (HL),A
        INC     HL
        DEC     C
        JP      NZ,L0363
        LD      C,E
        CALL    L0372
        SUB     C
L0371:  RET

        ; --- START PROC L0372 ---
L0372:  IN      A,(6Eh)         ; 'n'
        AND     10h
        JP      NZ,L0372
        IN      A,(6Fh)         ; 'o'
        PUSH    AF
        ADD     A,E
        LD      E,A
        POP     AF
        OR      A
        RET

        ; --- START PROC L0381 ---
L0381:  LD      HL,(L0645)
        LD      (HL),01h
        RET

L0387:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    L0391
        JP      L03E7

        ; --- START PROC L0391 ---
L0391:  JP      Z,L03AF
        JP      C,L03BC
L0397:  LD      (L051C+1),A     ; reference not aligned to instruction
        CALL    L0476
        AND     7Fh             ; ''
        OR      40h             ; '@'
L03A1:  LD      (HL),A
        CALL    L04AA
        LD      A,(DE)
        LD      B,A
        LD      A,(L051C+1)     ; reference not aligned to instruction
        LD      (HL),A
L03AB:  JP      M,L02F3
        RET

L03AF:  CALL    L0403
        CALL    L03F6
        EX      DE,HL
        INC     HL
L03B7:  LD      B,0Bh
        JP      L02F6

L03BC:  LD      HL,(L051E+2)    ; reference not aligned to instruction
        INC     HL
        LD      B,(HL)
        LD      A,B
        OR      A
        JP      Z,L03CB
        CALL    L02F3
        LD      B,00h
L03CB:  CALL    L02F6
        JP      L04B8

L03D1:  RET

L03D2:  RET

L03D3:  RET

L03D4:  RET

L03D5:  RET

L03D6:  RET

L03D7:  RET

L03D8:  RET

L03D9:  JP      0000h

        ; --- START PROC L03DC ---
L03DC:  LD      A,(HL)
        INC     HL
        OR      A
        CALL    L0106
        DEC     B
        JP      NZ,L03DC
        RET

        ; --- START PROC L03E7 ---
L03E7:  POP     AF
L03E8:  POP     BC
        POP     DE
        POP     HL
        RET

        ; --- START PROC L03EC ---
L03EC:  LD      HL,(L051E+2)    ; reference not aligned to instruction
        INC     HL
        LD      (HL),00h
        RET

        ; --- START PROC L03F3 ---
L03F3:  CALL    L03EC
        ; --- START PROC L03F6 ---
L03F6:  LD      HL,(L051E+2)    ; reference not aligned to instruction
        LD      DE,0028h
        EX      DE,HL
        ADD     HL,DE
        INC     DE
        INC     DE
        INC     DE
        INC     DE
        RET

        ; --- START PROC L0403 ---
L0403:  CALL    L04A3
        LD      HL,0058h
        LD      (L0507),A
        JP      Z,L042B
        CALL    L0464
        LD      A,H
        OR      L
        LD      (L0507),A
        JP      NZ,L042B
L041A:  PUSH    DE
        LD      A,0C0h
        LD      HL,00A8h
        CALL    L04ED
        LD      B,E
        LD      B,0EBh
        POP     HL
        LD      (HL),E
        INC     HL
L0429:  LD      (HL),D
        EX      DE,HL
L042B:  LD      (L051E+2),HL    ; reference not aligned to instruction
        CALL    L0204
        CALL    L03F6
L0434:  LD      (L051E),HL
        INC     DE
        PUSH    DE
        LD      HL,0008h
        ADD     HL,DE
L043D:  LD      (L0508),HL
        LD      HL,(L064D)
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        LD      C,0Bh
L0449:  LD      A,(DE)
L044A:  AND     7Fh             ; ''
        CP      2Eh             ; '.'
        JP      NZ,L0459
        LD      C,04h
        LD      HL,(L0508)
        JP      L045B

L0459:  LD      (HL),A
        INC     HL
L045B:  LD      A,(DE)
        INC     DE
        DEC     C
        RET     Z
        OR      A
        JP      P,L0449
        RET

        ; --- START PROC L0464 ---
L0464:  LD      HL,(L0649)
        LD      E,(HL)
        LD      D,00h
        EX      DE,HL
        ADD     HL,HL
        LD      DE,0522h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        DEC     HL
        EX      DE,HL
        RET

        ; --- START PROC L0476 ---
L0476:  LD      HL,(L0661)
        LD      A,(HL)
        OR      A
L047B:  CALL    NZ,L0487
        LD      HL,(L051E+2)    ; reference not aligned to instruction
        LD      A,H
        OR      L
        RET     Z
        LD      A,(HL)
        OR      A
        RET

        ; --- START PROC L0487 ---
L0487:  CALL    L04A3
        LD      HL,0058h
        CALL    NZ,L0464
L0490:  LD      (L051E+2),HL    ; reference not aligned to instruction
        EX      DE,HL
L0494:  LD      HL,0028h
        ADD     HL,DE
        LD      (L051E),HL
        LD      HL,(L0661)
        LD      A,(HL)
L049F:  AND     1Bh
        LD      (HL),A
        RET

        ; --- START PROC L04A3 ---
L04A3:  LD      HL,(L065F)
        LD      A,(HL)
        AND     04h
        RET

        ; --- START PROC L04AA ---
L04AA:  LD      HL,(L051E+2)    ; reference not aligned to instruction
        INC     HL
        LD      C,(HL)
        LD      B,00h
        INC     (HL)
        EX      DE,HL
L04B3:  LD      HL,(L051E)
        ADD     HL,BC
        RET

        ; --- START PROC L04B8 ---
L04B8:  LD      HL,(L051E+2)    ; reference not aligned to instruction
        LD      A,H
        OR      A
        RET     Z
        CALL    L04ED
        LD      B,C
        LD      B,0CDh
        LD      H,H
        INC     B
        XOR     A
        LD      (DE),A
        INC     DE
        LD      (DE),A
        RET

L04CB:  NOP
        NOP
        NOP
L04CE:  NOP
        NOP
        JR      NZ,L04F2
        JR      NZ,L04F4
        JR      NZ,L04F6
        JR      NZ,L04F8
        JR      NZ,L04FA
        JR      NZ,L04DC
L04DC:  NOP
        NOP
        NOP
        LD      C,1Ah
        CALL    L03F6
        LD      B,50h           ; 'P'
        ; --- START PROC L04E6 ---
L04E6:  LD      (HL),C
        INC     HL
        DEC     B
L04E9:  JP      NZ,L04E6
        RET

        ; --- START PROC L04ED ---
L04ED:  EX      (SP),HL
        PUSH    DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
L04F2:  INC     HL
        PUSH    HL
L04F4:  EX      DE,HL
        LD      E,(HL)
L04F6:  INC     HL
        LD      D,(HL)
L04F8:  POP     HL
        EX      DE,HL
L04FA:  LD      (L0508),HL
L04FD:  POP     HL
        EX      DE,HL
        EX      (SP),HL
        PUSH    HL
        LD      HL,(L0508)
        EX      (SP),HL
        RET

L0506:  EX      (SP),HL
L0507:  PUSH    HL
L0508:  LD      HL,(L050F)
L050B:  EX      (SP),HL
L050C:  RET

L050D:  ADD     A,A
        LD      C,A
L050F:  LD      HL,0642h
        ADD     HL,BC
        LD      C,(HL)
L0514:  CALL    0015h
        INC     HL
        LD      C,(HL)
        CALL    0015h
L051C:  LD      C,20h           ; ' '
L051E:  CALL    0015h
        JP      0015h

L0524:  CALL    L0301+2         ; reference not aligned to instruction
        AND     06h
        CP      06h
        JP      NZ,L02BE
        LD      C,53h           ; 'S'
        CALL    0015h
        LD      C,50h           ; 'P'
        JP      0015h

L0538:  CALL    002Eh
        LD      HL,(000Ch)
        LD      A,H
L053F:  CALL    L02D4+1         ; reference not aligned to instruction
        LD      A,L
        CALL    L02D4+1         ; reference not aligned to instruction
        LD      C,20h           ; ' '
        CALL    0015h
        CALL    0015h
        RET

L054F:  LD      HL,0000h
        ADD     HL,SP
        LD      (0013h),HL
        LD      A,(0010h)
        OR      A
L055A:  JP      Z,L0371
        LD      HL,0FFFFh
        LD      (000Eh),HL
        INC     A
        JP      NZ,L0371
        INC     A
        LD      (0010h),A
        LD      HL,(000Ch)
        JP      L0397

L0571:  CALL    L069E
        JP      NZ,L053F+1      ; reference not aligned to instruction
        LD      HL,0010h
        LD      A,(HL)
        OR      A
        JP      Z,L0381+2       ; reference not aligned to instruction
        DEC     (HL)
        JP      Z,L053F+1       ; reference not aligned to instruction
        LD      HL,(000Ch)
        CALL    L06A1
        CALL    002Eh
        LD      C,20h           ; ' '
        CALL    0015h
        CALL    0015h
        CALL    L033B
        CALL    L02A3
        LD      D,A
        LD      HL,0545h
L059E:  LD      BC,0011h
        CP      (HL)
        JP      Z,L04FD
        INC     HL
        DEC     C
L05A7:  JP      NZ,L03A1
        LD      C,0Ah
        CP      (HL)
        JP      Z,L04E9
        INC     HL
        DEC     C
        JP      NZ,L03AB+1      ; reference not aligned to instruction
        LD      C,06h
        CP      (HL)
        JP      Z,L04CE
        INC     HL
        DEC     C
        JP      NZ,L03B7
        AND     0C0h
        CP      40h             ; '@'
        JP      Z,L04B3+1       ; reference not aligned to instruction
        CP      80h
        JP      Z,L04A3+2       ; reference not aligned to instruction
        LD      A,D
        AND     0C7h
        SUB     04h
        JP      Z,L0494+2       ; reference not aligned to instruction
        DEC     A
        JP      Z,L0490
        DEC     A
        JP      Z,L047B+1       ; reference not aligned to instruction
        LD      A,D
        AND     0C0h
        JP      Z,L044A
        LD      A,D
        AND     07h
        JP      Z,L043D+2       ; reference not aligned to instruction
        SUB     02h
L05EA:  JP      Z,L0434
        SUB     02h
        JP      Z,L0429
        SUB     03h
        JP      Z,L041A
        LD      A,D
        AND     08h
        JP      NZ,L050B
L05FD:  LD      A,D
        AND     07h
L0600:  JP      L0667

L0603:  LD      D,5Ah           ; 'Z'
        INC     (HL)
        LD      E,D
L0607:  INC     D
        LD      E,D
L0609:  CP      (HL)
        LD      E,C
        LD      D,H
        LD      E,D
L060D:  LD      HL,(L055A)
        LD      E,E
        SUB     (HL)
        LD      E,D
        INC     (HL)
        JR      Z,L05A7
        LD      E,D
        ADC     A,A
        LD      E,D
        SUB     D
        ADD     HL,BC
        JP      M,L3511
        LD      (DE),A
        PUSH    DE
        LD      (DE),A
        LD      E,C
        INC     D
        XOR     D
        DEC     D
        NOP
        LD      A,(DE)
        INC     B
        LD      A,(DE)
        INC     SP
        LD      A,(DE)
        LD      C,H
        LD      A,(DE)
        CPL
        LD      D,7Eh           ; '~'
        LD      D,0ABh
        DEC     DE
        LD      L,L
        INC     E
        SBC     A,D
        LD      DE,1D63h
        SUB     H
        JR      Z,L05EA+1       ; reference not aligned to instruction
        JR      Z,L05FD
        JR      Z,L060D
        JR      Z,L064D
        DEC     SP
        SCF
L0645:  LD      D,(HL)
        LD      E,D
        LD      D,A
        LD      E,D
L0649:  LD      E,C
        LD      E,D
        LD      E,E
        LD      E,D
L064D:  LD      (HL),A
        LD      E,D
        OR      C
        RLCA
        XOR     C
        RLCA
        DAA
        EX      AF,AF'
        OR      A
        RLCA
        RLA
        ADD     HL,BC
        XOR     D
        EX      AF,AF'
L065B:  LD      A,E
        LD      E,D
        LD      D,D
        LD      E,D
L065F:  LD      A,C
        LD      E,D
L0661:  SUB     L
        LD      E,D
        LD      E,L
        LD      E,D
        DEC     (HL)
        RLA
L0667:  LD      SP,5B02h
        LD      A,0C9h
        LD      (5B13h),A
        CALL    L0992
        LD      (5B38h),A
L0675:  LD      A,(L593A+1)     ; reference not aligned to instruction
        AND     A
        JP      NZ,L069B
        XOR     A
        LD      (L593C),A
        LD      (5B29h),A
        LD      HL,0000h
        LD      (5B2Dh),HL
        CALL    L172E
        LD      A,(0080h)
        OR      A
        LD      HL,0785h
        CALL    Z,L17F3
        LD      A,0FFh
        LD      (L593A+1),A     ; reference not aligned to instruction
L069B:  LD      SP,5B02h
        ; --- START PROC L069E ---
L069E:  LD      HL,(5A14h)
        ; --- START PROC L06A1 ---
L06A1:  LD      A,H
        OR      L
        JP      NZ,L06B7
        LD      HL,5EEDh
L06A9:  INC     HL
        LD      A,H
        OR      L
        JP      Z,L06B6
        LD      A,(HL)
        CPL
        LD      (HL),A
        CP      (HL)
        JP      Z,L06A9
L06B6:  DEC     HL
L06B7:  LD      (5A8Ch),HL
        XOR     A
        LD      (5A94h),A
        INC     A
        LD      (5A7Ah),A
        LD      HL,0000h
        LD      (5B2Dh),HL
        LD      HL,5EEEh
        LD      (5B0Fh),HL
        CALL    L340A+2         ; reference not aligned to instruction
        LD      A,0C3h
        LD      (L0675),A
        LD      HL,0717h
        LD      (L0675+1),HL    ; reference not aligned to instruction
        LD      HL,0667h
        LD      (L0100+1),HL    ; reference not aligned to instruction
        LD      HL,0080h
        LD      A,(HL)
        OR      A
        JP      Z,L0717
        INC     HL
        LD      C,A
        LD      DE,5E08h
L06EF:  LD      A,(HL)
        INC     HL
        LD      (DE),A
        INC     DE
        DEC     C
        JP      NZ,L06EF
        LD      A,00h
        LD      (DE),A
        LD      HL,5E02h
L06FD:  CALL    L21F0
        INC     HL
        LD      (HL),4Ch        ; 'L'
        INC     HL
        LD      (HL),4Fh        ; 'O'
        INC     HL
        LD      (HL),41h        ; 'A'
        INC     HL
        LD      (HL),44h        ; 'D'
        LD      A,01h
        LD      (5A7Ah),A
        CALL    L172E
        JP      L073B

        ; --- START PROC L0717 ---
L0717:  LD      SP,5B02h
        XOR     A
        LD      (5A7Dh),A
        LD      (5A5Dh),A
        LD      (5A81h),A
        LD      H,A
        LD      L,A
        LD      (5A7Fh),HL
        INC     A
        LD      (5A7Ah),A
        CALL    L172E
        LD      A,3Eh           ; '>'
        CALL    L1735
        CALL    L2687+2         ; reference not aligned to instruction
        JP      C,L0717
L073B:  CALL    L2AAC+2         ; reference not aligned to instruction
        LD      DE,44F0h
        LD      BC,000Ah
        CALL    L0879
        JP      NZ,L075C
        PUSH    BC
        CALL    L2280+2         ; reference not aligned to instruction
        POP     DE
        LD      HL,451Ah
        CALL    L08F9
        LD      H,B
        LD      L,C
        LD      BC,0717h
        PUSH    BC
        JP      (HL)

L075C:  CALL    L2A10
        JP      C,L076B
        LD      HL,5B46h
        CALL    L0773
        JP      L0717

L076B:  LD      B,08h
        CALL    L2833+1         ; reference not aligned to instruction
        JP      L0717

        ; --- START PROC L0773 ---
L0773:  PUSH    HL
        LD      HL,(5A8Ah)
        LD      A,(5A93h)
        AND     A
        JP      NZ,L0781
        LD      (5A9Ah),HL
L0781:  POP     HL
        JP      L3C35

L0785:  DEC     C
        LD      A,(BC)
        LD      D,H
        LD      B,C
        LD      D,D
        LD      B,D
        LD      B,L
        LD      C,H
        LD      C,H
        JR      NZ,L07D2
        LD      B,C
        LD      D,E
        LD      C,C
        LD      B,E
        JR      NZ,L07C7
        DEC     (HL)
        LD      L,34h           ; '4'
        DEC     C
        LD      A,(BC)
        LD      D,E
        LD      B,L
        LD      D,B
        JR      NZ,L07D1
        INC     SP
        INC     L
        JR      NZ,L07D5
        ADD     HL,SP
        JR      C,L07D7+1       ; reference not aligned to instruction
        DEC     C
        ADC     A,D
        ; --- START PROC L07A9 ---
L07A9:  LD      A,L
        SUB     E
        LD      L,A
        LD      A,H
        SBC     A,D
        LD      H,A
        CCF
        RET

        ; --- START PROC L07B1 ---
L07B1:  LD      A,H
        SUB     D
        RET     NZ
        LD      A,L
        SUB     E
        RET

        ; --- START PROC L07B7 ---
L07B7:  PUSH    HL
        PUSH    AF
        LD      H,D
        LD      L,00h
        LD      D,L
        ADD     HL,HL
        JP      NC,L07C2
        ADD     HL,DE
L07C2:  ADD     HL,HL
        JP      NC,L07C7
        ADD     HL,DE
L07C7:  ADD     HL,HL
        JP      NC,L07CC
        ADD     HL,DE
L07CC:  ADD     HL,HL
        JP      NC,L07D1
        ADD     HL,DE
L07D1:  ADD     HL,HL
L07D2:  JP      NC,L07D6
L07D5:  ADD     HL,DE
L07D6:  ADD     HL,HL
L07D7:  JP      NC,L07DB
        ADD     HL,DE
L07DB:  ADD     HL,HL
        JP      NC,L07E0
        ADD     HL,DE
L07E0:  ADD     HL,HL
        JP      NC,L07E5
        ADD     HL,DE
L07E5:  POP     AF
        EX      DE,HL
        POP     HL
        RET

        ; --- START PROC L07E9 ---
L07E9:  PUSH    DE
        ADD     HL,HL
        LD      D,H
        LD      E,L
        ADD     HL,HL
        ADD     HL,DE
        POP     DE
        RET

L07F1:  LD      HL,0BB9h
        ; --- START PROC L07F4 ---
L07F4:  LD      BC,0006h
        ; --- START PROC L07F7 ---
L07F7:  PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
L07FB:  LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L07FB
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

        ; --- START PROC L080A ---
L080A:  PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
L0812:  DEC     HL
        DEC     DE
        DEC     BC
        LD      A,(HL)
        LD      (DE),A
        LD      A,B
        OR      C
        JP      NZ,L0812
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

        ; --- START PROC L0821 ---
L0821:  LD      HL,0BA9h
        ; --- START PROC L0824 ---
L0824:  LD      BC,0006h
        ; --- START PROC L0827 ---
L0827:  CALL    L07B1
        CALL    C,L080A
        CALL    NC,L07F7
        RET

        ; --- START PROC L0831 ---
L0831:  PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      C,00h
L0836:  LD      A,(HL)
        AND     A
        JP      P,L083E
        INC     C
        AND     7Fh             ; ''
L083E:  CALL    L0870
        LD      B,A
        LD      A,(DE)
        AND     A
        JP      P,L0850
        INC     C
        DEC     C
        JP      NZ,L084D
        DEC     A
L084D:  INC     C
        AND     7Fh             ; ''
L0850:  CALL    L0870
        SUB     B
        INC     DE
        INC     HL
        PUSH    AF
        DEC     C
        INC     C
        JP      NZ,L0864
        POP     AF
        JP      Z,L0836
L0860:  POP     HL
        POP     DE
        POP     BC
        RET

L0864:  DEC     C
        DEC     C
        JP      Z,L086C
        POP     AF
        DEC     C
        PUSH    AF
L086C:  POP     AF
        JP      L0860

        ; --- START PROC L0870 ---
L0870:  CP      7Bh             ; '{'
        RET     NC
        CP      61h             ; 'a'
        RET     C
        AND     5Fh             ; '_'
        RET

        ; --- START PROC L0879 ---
L0879:  PUSH    BC
L087A:  CALL    L0831
        JP      Z,L088D
L0880:  LD      A,(DE)
        AND     A
        INC     DE
        JP      P,L0880
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L087A
        DEC     A
L088D:  EX      (SP),HL
        PUSH    DE
        LD      D,B
        LD      E,C
        PUSH    AF
        CALL    L07A9
        POP     AF
        INC     HL
        POP     DE
        EX      (SP),HL
        POP     BC
        RET

        ; --- START PROC L089B ---
L089B:  PUSH    AF
        PUSH    HL
        LD      DE,0000h
        XOR     A
L08A1:  INC     DE
        OR      (HL)
        INC     HL
        JP      P,L08A1
        POP     HL
        POP     AF
        RET

        ; --- START PROC L08AA ---
L08AA:  PUSH    BC
        LD      A,H
        SUB     E
        JP      NC,L08D4
        LD      B,00h
        LD      C,08h
L08B4:  ADD     HL,HL
        JP      C,L08BD
        LD      A,H
        SUB     E
        JP      C,L08D7
L08BD:  LD      A,H
        SUB     E
        LD      H,A
        SCF
L08C1:  LD      A,B
        RLA
        LD      B,A
        DEC     C
        JP      NZ,L08B4
        LD      A,E
        LD      D,00h
        AND     A
        RRA
        LD      E,B
        CP      H
        JP      NC,L08D3
        INC     DE
L08D3:  SCF
L08D4:  LD      L,B
        POP     BC
        RET

L08D7:  AND     A
        JP      L08C1

L08DB:  PUSH    BC
L08DC:  CP      (HL)
        JP      Z,L088D
        INC     HL
        DEC     BC
        INC     B
        DEC     B
        JP      NZ,L08DC
        INC     C
        DEC     C
        JP      NZ,L08DC
        INC     C
        JP      L088D

        ; --- START PROC L08F0 ---
L08F0:  PUSH    AF
        ADD     A,L
        LD      L,A
        JP      NC,L08F7
        INC     H
L08F7:  POP     AF
        RET

        ; --- START PROC L08F9 ---
L08F9:  PUSH    AF
        PUSH    DE
        EX      DE,HL
        ADD     HL,HL
        ADD     HL,DE
        DEC     HL
        LD      B,(HL)
        DEC     HL
        LD      C,(HL)
        EX      DE,HL
        POP     DE
        POP     AF
        RET

        ; --- START PROC L0906 ---
L0906:  PUSH    BC
        LD      A,00h
        ADC     A,C
        DAA
        CPL
        SUB     66h             ; 'f'
        SCF
        ADC     A,B
        DAA
        POP     BC
        CCF
        RET

        ; --- START PROC L0914 ---
L0914:  LD      HL,5952h
L0917:  LD      (HL),00h
        INC     HL
        DEC     A
        JP      NZ,L0917
        RET

        ; --- START PROC L091F ---
L091F:  PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        DEC     HL
        LD      E,05h
L0926:  LD      A,(HL)
        INC     HL
        LD      D,(HL)
        DEC     HL
        LD      C,04h
L092C:  LD      B,A
        LD      A,D
        RLA
        LD      D,A
        LD      A,B
        RLA
        DEC     C
        JP      NZ,L092C
        LD      (HL),A
        DEC     E
        INC     HL
        JP      NZ,L0926
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        DEC     HL
        RET

        ; --- START PROC L0942 ---
L0942:  RRCA
        CALL    C,L0950
        AND     7Fh             ; ''
L0948:  AND     A
        RET     Z
        DEC     HL
        LD      (HL),B
        DEC     A
        JP      L0948

        ; --- START PROC L0950 ---
L0950:  CALL    L091F
        PUSH    AF
        LD      A,B
        AND     0F0h
        LD      C,A
        LD      A,(HL)
        AND     0Fh
        OR      C
        LD      (HL),A
        POP     AF
        RET

        ; --- START PROC L095F ---
L095F:  LD      A,B
        XOR     D
        AND     40h             ; '@'
        JP      NZ,L0976
        LD      A,C
        ADD     A,E
        DAA
        LD      C,A
        RET     NC
        LD      A,B
        RLCA
        RLCA
        AND     01h
        INC     A
        LD      (L593C),A
        SCF
        RET

L0976:  AND     B
        JP      NZ,L097E
        PUSH    BC
        PUSH    DE
        POP     BC
        POP     DE
L097E:  PUSH    BC
        LD      B,E
        CALL    L0906
        POP     BC
        LD      B,00h
        LD      C,A
        RET     NC
        CPL
L0989:  SUB     66h             ; 'f'
        ADD     A,01h
        DAA
        LD      C,A
        LD      B,40h           ; '@'
        RET

        ; --- START PROC L0992 ---
L0992:  LD      HL,593Bh
        LD      DE,0678h
        PUSH    DE
        CALL    L07A9
        EX      DE,HL
        POP     HL
        XOR     A
L099F:  ADD     A,(HL)
        DEC     DE
        INC     HL
        LD      B,A
        LD      A,D
        OR      E
        LD      A,B
        JP      NZ,L099F
        RET

        ; --- START PROC L09AA ---
L09AA:  LD      B,00h
L09AC:  LD      A,(DE)
        AND     0F0h
        JP      NZ,L09D1
        LD      A,B
        ADD     A,01h
        DAA
        LD      B,A
        LD      A,(DE)
        AND     0Fh
        JP      NZ,L09D1
        LD      A,B
        ADD     A,01h
        DAA
        LD      B,A
        INC     DE
        LD      A,16h
        CP      B
        JP      NZ,L09AC
        DEC     DE
        DEC     DE
        DEC     DE
        DEC     DE
        LD      BC,0000h
        RET

L09D1:  LD      A,01h
        AND     B
        JP      Z,L09DD
        EX      DE,HL
        INC     HL
        CALL    L091F
        EX      DE,HL
L09DD:  LD      C,B
        LD      B,40h           ; '@'
        PUSH    DE
        LD      DE,0008h
        CALL    L095F
        LD      D,(HL)
        INC     HL
        LD      E,(HL)
        DEC     HL
        CALL    L095F
        POP     DE
        RET

        ; --- START PROC L09F0 ---
L09F0:  PUSH    BC
        LD      (L593D+1),A     ; reference not aligned to instruction
        LD      C,A
        LD      B,00h
        EX      (SP),HL
        ADD     HL,BC
        EX      (SP),HL
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        PUSH    BC
        EX      DE,HL
        PUSH    DE
        LD      DE,5966h
        LD      BC,0004h
        CALL    L07F7
        POP     DE
        POP     BC
        EX      DE,HL
        XOR     A
L0A0D:  DEC     DE
        DEC     HL
        LD      A,(DE)
        ADC     A,(HL)
        DAA
        EX      (SP),HL
        DEC     HL
        LD      (HL),A
        EX      (SP),HL
        DEC     C
        JP      NZ,L0A0D
        RLA
        AND     01h
        POP     HL
        LD      C,A
        LD      A,(L593D+1)     ; reference not aligned to instruction
        CP      04h
        JP      NZ,L0A63
        PUSH    HL
        LD      HL,595Eh
        LD      B,08h
L0A2D:  LD      A,0F0h
        AND     (HL)
        JP      NZ,L0A42
        LD      A,0Fh
        AND     (HL)
        JP      NZ,L0A47
        INC     HL
        DEC     B
        JP      NZ,L0A2D
        POP     HL
        JP      L0A63

L0A42:  LD      A,50h           ; 'P'
        JP      L0A49

L0A47:  LD      A,05h
L0A49:  LD      DE,0008h
        ADD     HL,DE
        ADD     A,(HL)
        DAA
        JP      NC,L0A5B
L0A52:  DEC     HL
        LD      A,(HL)
        ADD     A,01h
        DAA
        LD      (HL),A
        JP      C,L0A52
L0A5B:  POP     HL
        DEC     HL
        LD      A,(HL)
        LD      (HL),00h
        INC     HL
        OR      C
        LD      C,A
L0A63:  LD      A,(L593D)
        AND     A
        JP      NZ,L0A6E
        DEC     HL
        LD      (HL),C
        XOR     A
        RET

L0A6E:  XOR     A
        DEC     C
        RET     Z
        LD      C,05h
        CALL    L0A79
        LD      A,80h
        RET

        ; --- START PROC L0A79 ---
L0A79:  PUSH    BC
L0A7A:  LD      A,(HL)
        CPL
        SUB     66h             ; 'f'
        LD      (HL),A
        INC     HL
        DEC     C
        JP      NZ,L0A7A
        SCF
        POP     BC
L0A86:  DEC     HL
        LD      A,(HL)
        ADC     A,00h
        DAA
        LD      (HL),A
        RET     NC
        DEC     C
        JP      NZ,L0A86
        RET

        ; --- START PROC L0A92 ---
L0A92:  PUSH    BC
        PUSH    HL
        EX      DE,HL
        INC     HL
        INC     HL
        LD      A,(HL)
        DEC     HL
        DEC     HL
        LD      DE,5940h
        CALL    L07F4
        AND     A
        JP      Z,L0AA8
        LD      A,(DE)
        XOR     80h
        LD      (DE),A
L0AA8:  POP     HL
        POP     BC
        ; --- START PROC L0AAA ---
L0AAA:  XOR     A
        INC     HL
        INC     HL
        CP      (HL)
        DEC     HL
        DEC     HL
        EX      DE,HL
        JP      Z,L0B84
        INC     HL
        INC     HL
        CP      (HL)
        DEC     HL
        DEC     HL
        EX      DE,HL
        JP      Z,L0B84
        LD      (L593D),A
        PUSH    HL
        LD      A,18h
        CALL    L0914
        POP     HL
        PUSH    BC
        LD      A,(DE)
        XOR     (HL)
        AND     80h
        JP      Z,L0AEB
        AND     (HL)
        JP      NZ,L0AD4
        EX      DE,HL
L0AD4:  PUSH    DE
        LD      DE,5946h
        CALL    L07F4
        PUSH    DE
        EX      DE,HL
        INC     HL
        INC     HL
        LD      C,04h
        CALL    L0A79
        POP     HL
        POP     DE
        LD      A,0FFh
        LD      (L593D),A
L0AEB:  PUSH    HL
        PUSH    DE
        LD      B,(HL)
        INC     HL
        LD      C,(HL)
        EX      DE,HL
        LD      D,(HL)
        INC     HL
        LD      E,(HL)
        PUSH    BC
        LD      A,40h           ; '@'
        XOR     B
        LD      B,A
        PUSH    DE
        CALL    L095F
        POP     DE
        LD      A,D
        POP     DE
        LD      E,A
        PUSH    AF
        LD      A,E
        OR      D
        CPL
        AND     B
        LD      H,A
        LD      A,B
        AND     E
        AND     D
        OR      H
        LD      H,A
        LD      A,D
        CPL
        AND     E
        OR      H
        AND     40h             ; '@'
        POP     HL
        POP     DE
        EX      (SP),HL
        JP      NZ,L0B19
        EX      DE,HL
L0B19:  POP     AF
        JP      C,L0B89
        LD      A,C
        CP      09h
        JP      NC,L0B89
        PUSH    HL
        PUSH    DE
        PUSH    BC
        EX      DE,HL
        LD      DE,5956h
        INC     HL
        INC     HL
        LD      BC,0004h
        CALL    L07F7
        POP     BC
        EX      DE,HL
        POP     DE
        LD      A,(DE)
        AND     80h
        JP      Z,L0B44
        LD      A,(L593D)
        AND     A
        JP      Z,L0B44
        LD      A,99h
L0B44:  LD      B,A
        LD      A,C
        CALL    L0942
        EX      DE,HL
        POP     HL
        PUSH    HL
        INC     HL
        INC     HL
        LD      BC,5962h
        LD      A,04h
        EX      DE,HL
        CALL    L09F0
        POP     HL
        PUSH    HL
        PUSH    AF
        LD      A,(L5946)
        XOR     80h
        LD      (L5946),A
        XOR     A
        LD      (L593C),A
        LD      DE,595Eh
        CALL    L09AA
        POP     AF
        POP     HL
        XOR     (HL)
        POP     HL
        PUSH    AF
        LD      A,B
        AND     40h             ; '@'
        LD      B,A
        POP     AF
        AND     0BFh
        OR      B
        LD      (HL),A
        INC     HL
        LD      (HL),C
        EX      DE,HL
        INC     DE
        LD      BC,0004h
        JP      L07F7

L0B84:  LD      D,B
        LD      E,C
        JP      L0824

L0B89:  LD      DE,5946h
        CALL    L07B1
        JP      NZ,L0B9B
        PUSH    HL
        INC     HL
        INC     HL
        LD      C,04h
        CALL    L0A79
        POP     HL
L0B9B:  POP     DE
        JP      L07F4

L0B9F:  NOP
        LD      BC,0302h
        INC     B
        DEC     B
        LD      B,07h
        EX      AF,AF'
        ADD     HL,BC
        LD      (BC),A
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LD      (BC),A
        INC     B
        LD      B,08h
        DJNZ    L0BC8
        INC     D
        LD      D,18h
        INC     BC
        NOP
L0BBB:  DJNZ    L0BBD
L0BBD:  NOP
        NOP
        NOP
        INC     BC
        LD      B,09h
        LD      (DE),A
        DEC     D
        JR      L0BE8

L0BC7:  INC     H
L0BC8:  DAA
        INC     BC
        NOP
        JR      NZ,L0BCD
L0BCD:  NOP
        NOP
        NOP
        INC     B
        EX      AF,AF'
        LD      (DE),A
        LD      D,20h           ; ' '
        INC     H
        JR      Z,L0C0A
        LD      (HL),03h
        NOP
        LD      D,90h
        NOP
        NOP
        NOP
        DEC     B
        DJNZ    L0BF8
        JR      NZ,L0C0A
        JR      NC,L0C1C
        LD      B,B
L0BE8:  LD      B,L
        INC     BC
        NOP
        DEC     D
        LD      (HL),B
        LD      A,C
        LD      H,E
        NOP
        LD      B,12h
        JR      L0C18

L0BF4:  JR      NC,L0C2B+1      ; reference not aligned to instruction
        LD      B,D
        LD      C,B
L0BF8:  LD      D,H
        INC     BC
        NOP
        LD      H,D
        ADD     A,E
        JR      L0C51+1         ; reference not aligned to instruction

L0BFF:  NOP
        RLCA
        INC     D
        LD      HL,3528h
        LD      B,D
        LD      C,C
        LD      D,(HL)
        LD      H,E
        LD      B,E
L0C0A:  LD      BC,9999h
        SBC     A,C
        LD      D,B
        NOP
        EX      AF,AF'
        LD      D,24h           ; '$'
        LD      (L483E+2),A     ; reference not aligned to instruction
        LD      D,(HL)
        LD      H,H
L0C18:  LD      (HL),D
        LD      (BC),A
        NOP
        NOP
L0C1C:  NOP
        LD      BC,0000h
        ADD     HL,BC
        JR      L0C4A

L0C23:  LD      (HL),45h        ; 'E'
        LD      D,H
        LD      H,E
        LD      (HL),D
        ADD     A,C
        ; --- START PROC L0C29 ---
L0C29:  INC     B
        DEC     B
L0C2B:  JP      Z,L0CC1
        INC     C
        DEC     C
        JP      Z,L0CC1
        PUSH    DE
        PUSH    HL
        LD      DE,0000h
        LD      A,C
        AND     0Fh
        JP      Z,L0C50
        LD      L,A
        LD      A,B
        AND     0F0h
        JP      Z,L0C50
        ADD     A,L
        LD      HL,0B8Fh
        ADD     A,L
L0C4A:  JP      NC,L0C4E
        INC     H
L0C4E:  LD      L,A
        LD      E,(HL)
L0C50:  LD      A,B
L0C51:  AND     0Fh
        JP      Z,L0C6F
        LD      L,A
        LD      A,C
        AND     0F0h
        JP      Z,L0C6F
        ADD     A,L
        LD      HL,0B8Fh
        ADD     A,L
        JP      NC,L0C66
        INC     H
L0C66:  LD      L,A
        LD      A,(HL)
        ADD     A,E
        DAA
        LD      E,A
        JP      NC,L0C6F
        INC     D
L0C6F:  EX      DE,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        EX      DE,HL
        LD      A,C
        AND     0Fh
        JP      Z,L0C98
        LD      L,A
        LD      A,B
        AND     0Fh
        JP      Z,L0C98
        RLCA
        RLCA
        RLCA
        RLCA
        ADD     A,L
        LD      HL,0B8Fh
        ADD     A,L
        JP      NC,L0C8F
        INC     H
L0C8F:  LD      L,A
        LD      A,(HL)
        ADD     A,E
        DAA
        LD      E,A
        JP      NC,L0C98
        INC     D
L0C98:  LD      A,B
        AND     0F0h
        JP      Z,L0CB9
        LD      L,A
        LD      A,C
        AND     0F0h
        JP      Z,L0CB9
        RLCA
        RLCA
        RLCA
        RLCA
        ADD     A,L
        LD      HL,0B8Fh
        ADD     A,L
        JP      NC,L0CB2
        INC     H
L0CB2:  LD      L,A
        XOR     A
        LD      A,D
        DAA
        ADD     A,(HL)
        DAA
        LD      D,A
L0CB9:  XOR     A
        LD      A,D
        DAA
        LD      B,A
        LD      C,E
        POP     HL
        POP     DE
        RET

L0CC1:  LD      BC,0000h
        RET

        ; --- START PROC L0CC5 ---
L0CC5:  PUSH    DE
        PUSH    HL
        EX      DE,HL
        LD      DE,5946h
        CALL    L07F4
        POP     HL
        PUSH    HL
        LD      DE,5940h
        CALL    L07F7
        LD      HL,595Dh
        LD      A,(L5944+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L594B)
        LD      B,A
        CALL    L0C29
        LD      (HL),C
        DEC     HL
        LD      (HL),B
        DEC     HL
        LD      A,(L5944)
        LD      C,A
        LD      A,(L594A)
        LD      B,A
        CALL    L0C29
        LD      (HL),C
        DEC     HL
        LD      (HL),B
        DEC     HL
        LD      A,(L5942+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L5949)
        LD      B,A
        CALL    L0C29
        LD      (HL),C
        DEC     HL
        LD      (HL),B
        DEC     HL
        LD      A,(L5942)
        LD      C,A
        LD      A,(L5947+1)     ; reference not aligned to instruction
        LD      B,A
        CALL    L0C29
        LD      (HL),C
        DEC     HL
        LD      (HL),B
        INC     HL
        INC     HL
        LD      A,(L5942+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L5947+1)     ; reference not aligned to instruction
        LD      B,A
        CALL    L0DA1
        LD      A,(L5942)
        LD      C,A
        LD      A,(L5949)
        LD      B,A
        CALL    L0DA1
        INC     HL
        LD      A,(L5942)
        LD      C,A
        LD      A,(L594A)
        LD      B,A
        CALL    L0DA1
        LD      A,(L5944)
        LD      C,A
        LD      A,(L5947+1)     ; reference not aligned to instruction
        LD      B,A
        CALL    L0DA1
        INC     HL
        LD      A,(L5942)
        LD      C,A
        LD      A,(L594B)
        LD      B,A
        CALL    L0DA1
        LD      A,(L5942+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L594A)
        LD      B,A
        CALL    L0DA1
        LD      A,(L5944)
        LD      C,A
        LD      A,(L5949)
        LD      B,A
        CALL    L0DA1
        LD      A,(L5944+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L5947+1)     ; reference not aligned to instruction
        LD      B,A
        CALL    L0DA1
        INC     HL
        LD      A,(L5942+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L594B)
        LD      B,A
        CALL    L0DA1
        LD      A,(L5944+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L5949)
        LD      B,A
        CALL    L0DA1
        INC     HL
        LD      A,(L5944)
        LD      C,A
        LD      A,(L594B)
        LD      B,A
        CALL    L0DA1
        LD      A,(L5944+1)     ; reference not aligned to instruction
        LD      C,A
        LD      A,(L594A)
        LD      B,A
        CALL    L0DA1
        POP     HL
        POP     DE
        RET

        ; --- START PROC L0DA1 ---
L0DA1:  CALL    L0C29
        PUSH    HL
        LD      A,C
        ADD     A,(HL)
        DAA
        LD      (HL),A
L0DA9:  DEC     HL
        LD      A,B
        ADC     A,(HL)
        DAA
        LD      (HL),A
        JP      NC,L0DB6
        LD      B,00h
        JP      L0DA9

L0DB6:  POP     HL
        RET

        ; --- START PROC L0DB8 ---
L0DB8:  PUSH    BC
        CALL    L0CC5
        LD      A,(L5956)
        AND     0F0h
        LD      A,50h           ; 'P'
        JP      NZ,L0DC8
        LD      A,05h
L0DC8:  PUSH    HL
        LD      HL,595Ah
L0DCC:  ADD     A,(HL)
        DAA
        LD      (HL),A
        DEC     HL
        LD      A,01h
        JP      C,L0DCC
        LD      A,04h
        CALL    L0914
        POP     HL
        PUSH    DE
        LD      DE,5952h
        CALL    L09AA
        POP     HL
        PUSH    DE
        LD      D,(HL)
        INC     HL
        LD      E,(HL)
        XOR     A
        LD      (L593C),A
        CALL    L095F
        LD      DE,0001h
        CALL    L095F
        POP     DE
        LD      A,(L5940)
        LD      HL,5946h
        XOR     (HL)
        AND     80h
        OR      03h
        LD      H,A
        LD      A,B
        AND     40h             ; '@'
        OR      H
        POP     HL
        LD      (HL),A
        INC     HL
        LD      (HL),C
        INC     HL
        EX      DE,HL
        LD      BC,0004h
        CALL    L07F7
        EX      DE,HL
        LD      A,(HL)
        DEC     HL
        DEC     HL
        AND     A
        RET     NZ
        EX      DE,HL
        LD      HL,0BA9h
        JP      L0827

L0E1E:  LD      A,(HL)
        LD      C,A
        RLCA
        RLCA
        RLCA
        RLCA
        AND     0Fh
        LD      (DE),A
        INC     DE
        LD      A,C
        AND     0Fh
        LD      (DE),A
        INC     DE
        INC     HL
        DEC     B
        JP      NZ,L0E1E
        RET

L0E33:  NOP
        ; --- START PROC L0E34 ---
L0E34:  OR      H
        XOR     H
        ADC     A,B
        OR      C
        XOR     H
        RST     0x10
        CP      A
        LD      B,A
        SUB     E
        ADC     A,C
        DEC     D
        ADC     A,L
        ADD     A,D
        POP     HL
        LD      E,07h
        LD      H,H
        JP      PE,L1F9D
        INC     L
        SBC     A,(HL)
        AND     E
        ADC     A,L
        LD      C,E
        LD      A,L
        SCF
        RLCA
L0E50:  LD      H,C
        JR      C,L0E5A
        ADD     HL,BC
        SUB     C
        ADD     A,D
        POP     HL
        LD      H,87h
        DEC     E
L0E5A:  RRA
        INC     L
        AND     E
        RST     0x10
        SUB     L
        ADC     A,L
        ADC     A,L
        LD      C,A
        LD      A,C
        INC     (HL)
        ADD     A,A
        LD      H,E
        DEC     B
        ADD     HL,BC
        LD      (BC),A
L0E69:  POP     HL
        JR      NC,L0E73
        LD      L,B
        CALL    PO,0C0BEh
        SCF
        JP      (HL)

L0E72:  DEC     SP
L0E73:  ADD     A,A
        LD      (DE),A
        DEC     A
        RET     NZ
        CPL
        JP      (HL)

L0E79:  DEC     L
        ADD     A,A
        LD      A,(BC)
        LD      H,C
        XOR     L
        ADD     A,A
        RRA
        LD      A,A
        SBC     A,C
        RRA
        XOR     H
        ADC     A,B
        OR      L
        INC     L
        RST     0x10
        SUB     B
        RST     0x10
        INC     L
        JP      P,87FAh
        NOP
        DJNZ    L0E50
        INC     L
        AND     0A3h
        ADD     A,A
        LD      A,L
        LD      C,A
        RLCA
        RRA
        INC     B
        LD      E,B
        AND     A
        SUB     B
        PUSH    BC
        INC     L
        AND     0A3h
        ADD     A,A
        LD      A,L
        LD      D,L
        ADD     A,A
        RRA
        LD      (BC),A
        LD      E,B
        AND     A
        SUB     B
        SRA     H
        AND     0A3h
        ADD     A,A
        LD      A,L
        LD      E,H
        RLCA
        RRA
        LD      BC,0A758h
        SUB     B
        POP     DE
        INC     L
        AND     0A3h
        ADD     A,A
        LD      A,L
        LD      H,D
        ADD     A,A
        RRA
        NOP
        RET     C
        AND     A
        ADC     A,C
        RET     M
        RET     P
        PUSH    HL
        LD      L,D
        RLCA
        JR      C,L0E69
        LD      DE,04FFh
        POP     HL
        LD      B,(HL)
        ADD     A,A
        LD      H,H
        ADD     A,(HL)
        ADD     A,(HL)
        LD      H,C
        LD      H,L
        ADD     A,A
L0ED7:  ADD     HL,DE
        RRA
        XOR     H
        POP     HL
        ADD     A,87h
        LD      H,D
L0EDE:  JP      P,89EAh
        ADC     A,C
        ADC     A,L
        LD      D,E
        PUSH    HL
        LD      D,D
        RLCA
        SBC     A,A
        DEC     B
        ADD     HL,DE
        RRA
        INC     L
        RST     0x10
        SBC     A,C
        LD      E,2Ch           ; ','
        SBC     A,C
        LD      (992Ch),A
        LD      (9FACh),A
        ADD     HL,BC
        LD      (HL),D
        SUB     B
        OR      L
        INC     L
        AND     8Bh
        ADD     A,H
        RET     P
        ADC     A,B
        OR      L
        XOR     H
        ADD     A,E
        LD      (BC),A
        LD      DE,0BF91h
        LD      D,E
        POP     HL
        INC     C
        ADD     A,A
        RET     P
        RET     P
        RET     P
        SBC     A,E
        LD      BC,029Fh
        SUB     C
        POP     HL
        ADC     A,E
        ADD     A,H
        AND     8Fh
        RLCA
        LD      D,A
        ADC     A,C
        LD      (HL),B
        JP      P,9191h
        ADC     A,B
        OR      E
        INC     L
        ADD     A,B
        ADD     A,D
        NOP
        LD      H,(HL)
        EI
        ADD     A,E
        AND     99h
        ADD     A,A
        DJNZ    L0ED7
        INC     L
        ADC     A,B
        CP      L
        XOR     H
        ADD     A,E
        INC     C
        LD      H,(HL)
        ADC     A,A
        RLCA
        LD      H,(HL)
        RET     NZ
        ADD     A,A
        LD      (HL),B
        RET     PE
        JP      PE,0A3F2h
        LD      DE,75A7h
        XOR     E
        LD      DE,1FAFh
        JR      NZ,L0F9B+1      ; reference not aligned to instruction
        INC     HL
        AND     0AFh
        ADD     A,H
        SBC     A,L
        RRA
        XOR     H
        OUT     (0E1h),A
        DEC     L
        ADD     A,A
        ADC     A,B
        ADD     A,B
        AND     B
        LD      H,(HL)
        XOR     A
        ADD     A,H
        RET     P
        RET     PE
        ADC     A,L
        LD      D,A
        LD      (HL),E
        LD      B,B
        LD      A,D
        CP      H
        ; --- START PROC L0F61 ---
L0F61:  LD      (HL),E
        CCF
        EI
        LD      BC,0F8A3h
        RET     C
        LD      (HL),B
        CP      E
        SUB     C
        CP      B
        SUB     C
        PUSH    AF
        RST     0x10
        SBC     A,C
        LD      D,(HL)
        XOR     H
        SBC     A,A
        LD      (BC),A
        SUB     B
        IN      A,(2Ch)         ; ','
        OUT     (0C7h),A
        LD      A,A
        DEC     B
        LD      A,L
        LD      B,C
        RLCA
        RST     0x28
        DEC     B
        RRA
        CP      E
        SBC     A,A
        NOP
        DEC     D
        NOP*

        RLCA
        SUB     B
        SUB     0ACh
        CP      A
        LD      D,E
        POP     HL
        LD      C,C
        ADD     A,A
        SUB     C
        ADD     A,A
        LD      (BC),A
        CCF
        INC     BC
        ADD     A,E
        ADD     A,E
        ADD     A,E
        SUB     C
        IN      A,(09h)
L0F9B:  LD      DE,8689h
        POP     HL
        LD      C,D
        ADD     A,A
        CALL    PO,L029F
        ADD     HL,DE
        LD      E,2Ch           ; ','
        RET     PE
        RET     P
        RET     PO
        CALL    PO,99D7h
        ; --- START PROC L0FAD ---
L0FAD:  LD      E,2Ch           ; ','
        ADC     A,L
        RLA
        POP     HL
        ADD     A,A
        RST     0x10
        SBC     A,C
        ; --- START PROC L0FB6 ---
L0FB6:  LD      E,2Ch           ; ','
        ADC     A,L
        LD      H,D
        ADD     A,B
        XOR     C
        INC     L
        RST     0x10
        LD      A,L
        LD      A,A
        ADD     A,A
        CP      A
        LD      BC,9F66h
        EX      AF,AF'
        DEC     C
        LD      B,E
        INC     DE
        ADD     A,C
        DEC     D
        ADC     A,L
        ADD     A,L
        ADC     A,L
        LD      B,A
        INC     DE
        ADD     A,C
        DEC     D
        ADC     A,L
        ADD     A,L
        ADC     A,L
        LD      B,A
        INC     DE
        ADD     A,C
        DEC     D
        ADC     A,L
        ADD     A,L
        ADC     A,L
        LD      B,A
        INC     DE
        ADD     A,C
        DEC     D
        ADC     A,L
        ADD     A,L
        ADC     A,L
        LD      B,A
        INC     DE
        ADD     A,C
        LD      L,B
        JP      M,0A990h
        INC     L
        ADD     A,A
        INC     BC
        CCF
        ADD     HL,BC
        LD      DE,8689h
        POP     HL
        LD      (HL),A
        ADD     A,A
        RET     M
        RET     PE
        RRA
        NOP
        SBC     A,C
        LD      E,2Ch           ; ','
        CALL    PO,0EAF2h
        JP      PO,L0287
        AND     0F3h
        ADC     A,D
        RET     PO
        RET     PE
        RET     P
        CP      A
        RLA
        PUSH    HL
        DEC     E
        EX      AF,AF'
        LD      L,C
        LD      A,(BC)
        EX      AF,AF'
        LD      (HL),L
        SUB     A
        DI
        LD      B,B
        LD      A,E
        LD      BC,6601h
        SBC     A,A
        EX      AF,AF'
        RRA
        LD      (BC),A
        SBC     A,E
        SBC     A,C
        JR      NZ,L104B+1      ; reference not aligned to instruction
        SBC     A,A
        LD      C,H
        RST     0x20
        NOP
        LD      C,E
        LD      (HL),L
        JP      8113h

L1029:  LD      (HL),L
        ADD     A,L
        ADC     A,L
        ; --- START PROC L102C ---
L102C:  SUB     L
        SBC     A,L
        JR      NZ,L105C
        SBC     A,(HL)
        POP     HL
        RRCA
        ADC     A,B
        LD      D,E
        POP     HL
        CALL    P,0E807h
        POP     HL
        SUB     B
        ADD     A,H
        LD      DE,9191h
        SUB     C
        SUB     C
        ADC     A,C
        ADC     A,C
        ADC     A,C
        ADC     A,C
        ADC     A,C
        ADD     A,C
        ADD     A,C
        ADD     A,C
        ADD     A,C
        ADD     A,C
L104B:  CALL    PO,L578C+1      ; reference not aligned to instruction
        ; --- START PROC L104E ---
L104E:  LD      A,E
        LD      BC,0101h
        JP      PO,9189h
        RST     0x10
        SBC     A,C
        LD      E,2Ch           ; ','
        JP      PE,95F2h
        ; --- START PROC L105C ---
L105C:  ADC     A,L
        AND     0E2h
        ADD     A,(HL)
        LD      (HL),B
        RET     PE
        ADC     A,L
        LD      E,E
        LD      H,L
        LD      C,L
        EX      AF,AF'
        LD      D,A
        LD      H,C
        SCF
        EX      AF,AF'
        LD      (HL),L
        ADD     A,E
        LD      (BC),A
        CCF
        LD      D,E
        POP     HL
        LD      C,D
        ADC     A,B
        LD      DE,0E182h
        JR      C,L1080
        INC     HL
        LD      (HL),L
        AND     A
        LD      H,(HL)
        SUB     H
        ADD     A,(HL)
        DJNZ    L102C
L1080:  XOR     H
        CP      A
        LD      B,B
        ; --- START PROC L1083 ---
L1083:  SUB     E
        CP      E
        SUB     L
        CP      A
        LD      B,H
        INC     DE
        CP      E
        SUB     L
        IN      A,(15h)
        IN      A,(15h)
        IN      A,(65h)         ; 'e'
        LD      C,L
        EX      AF,AF'
        RRA
        NOP
        SBC     A,C
        ; --- START PROC L1096 ---
L1096:  LD      E,2Ch           ; ','
        RET     PE
        SUB     B
        XOR     H
        XOR     H
        ADD     A,B
        ADD     A,D
        ADD     A,B
        LD      H,(HL)
        EI
        ADD     A,E
        ADD     A,E
        LD      BC,95D7h
        IN      A,(02h)
        ; --- START PROC L10A8 ---
L10A8:  POP     HL
        LD      D,E
        ADC     A,B
        LD      D,E
        CALL    PO,001Fh
        SBC     A,C
        LD      E,2Ch           ; ','
        CALL    PO,0EAE2h
        ; --- START PROC L10B5 ---
L10B5:  JP      P,L578C+1       ; reference not aligned to instruction
        LD      A,E
        LD      BC,1F01h
        DEC     B
        SBC     A,C
        RRA
        INC     L
        ADD     A,E
        LD      (BC),A
        RST     0x10
        PUSH    AF
        SUB     C
        IN      A,(61h)         ; 'a'
        LD      L,H
        EX      AF,AF'
        LD      (BC),A
        POP     HL
        LD      H,E
        EX      AF,AF'
        LD      (HL),B
        RET     P
        RET     P
        SBC     A,A
        LD      (BC),A
        ADD     HL,DE
        LD      E,2Ch           ; ','
        CALL    PO,99D7h
        LD      E,2Ch           ; ','
        SBC     A,C
        LD      (9F2Ch),A
        ADD     HL,BC
        DJNZ    L1096
        INC     L
        AND     8Bh
        ADD     A,H
        RET     P
        ADC     A,B
        OR      L
        XOR     H
        ADD     A,E
        LD      (BC),A
        SUB     C
        AND     8Fh
        RLCA
        LD      (HL),B
        SUB     C
        ADC     A,B
        OR      D
        XOR     H
        ADD     A,B
        ADD     A,D
        ADD     A,B
        LD      H,(HL)
        EI
        ADD     A,E
        AND     99h
        ADD     A,A
        DJNZ    L10A8
        INC     L
        ADC     A,B
        CP      (HL)
        INC     L
        ADD     A,E
        INC     C
        LD      H,(HL)
        ADC     A,A
        RLCA
        EX      AF,AF'
        POP     DE
        INC     L
        SUB     B
        RST     0x10
        INC     L
        ADD     A,A
L110F:  NOP
        DEC     C
        LD      D,E
        POP     HL
        RRCA
        ADC     A,B
        SBC     A,E
        NOP
        ADD     HL,BC
        SUB     C
        ADD     A,(HL)
        LD      H,C
        ADC     A,C
        EX      AF,AF'
        JP      P,93B4h
        NOP
        LD      H,D
        ADC     A,B
        CP      (HL)
        INC     L
        ADC     A,H
        ADD     A,B
        SBC     A,C
        NOP
        LD      H,(HL)
        EI
        ADD     A,E
        SUB     B
        RST     0x10
        INC     L
        RET     PO
        AND     B
        SUB     L
        ADD     A,(HL)
        LD      E,88h
        SBC     A,E
        NOP
        LD      H,C
        SBC     A,C
        ADC     A,B
        RET     P
        CP      H
        LD      B,B
        RLA
        SBC     A,(HL)
        DEC     BC
        LD      A,A
        ADC     A,H
        ADC     A,B
        ADD     A,L
        NOP
        INC     C
        ADC     A,B
        OR      L
        INC     L
        RST     0x10
        JP      P,87FAh
        NOP
        DJNZ    L110F
        INC     L
        AND     0A3h
        ADD     A,A
        LD      A,L
        CPL
        EX      AF,AF'
        CP      H
        EI
        INC     B
        DAA
        SUB     B
        CALL    NZ,0E62Ch
        AND     E
        ADD     A,A
        LD      A,L
        DEC     (HL)
        ADC     A,B
        CP      H
        EI
        LD      (BC),A
        DAA
        SUB     B
        JP      Z,0E62Ch
        AND     E
        ADD     A,A
        LD      A,L
        INC     A
        EX      AF,AF'
        CP      H
        EI
        LD      BC,9027h
        RET     NC
        INC     L
        AND     0A3h
        ADD     A,A
        LD      A,L
        LD      B,D
        ADC     A,B
        CP      H
        EI
        NOP
        AND     A
        RET     M
        RET     P
        CP      B
        ADC     A,C
        SUB     C
        SBC     A,(HL)
        LD      A,A
        DEC     B
        POP     HL
        LD      H,88h
        RET     PE
        ADC     A,C
        SUB     B
        RST     0x10
        INC     L
        ADD     A,A
        LD      (BC),A
        POP     HL
        JP      Z,0EA87h
L1199:  JP      P,L53BF
        ADD     A,E
        INC     E
        CP      1Ah
        INC     D
        EX      AF,AF'
        CALL    PE,0E62Ch
        SUB     D
        INC     B
        LD      H,(HL)
        OUT     (8Ah),A
        PUSH    HL
        LD      (HL),A
        EX      AF,AF'
        SUB     B
        CALL    PE,802Ch
        RST     0x28
        INC     L
        XOR     (HL)
        XOR     D
        LD      H,(HL)
        RST     0x18
        SUB     H
        NOP
        RST     0x28
        INC     L
        RET     P
        JP      P,0A8ACh
        LD      H,(HL)
        RST     0x10
        SUB     H
        NOP
        RST     0x28
        INC     L
        OR      H
        OR      B
        EX      AF,AF'
        CALL    PO,0E685h
        AND     94h
        NOP
        RST     0x28
        INC     L
        OR      H
        OR      B
        EX      AF,AF'
        CALL    PE,0E62Ch
        AND     94h
        LD      H,(HL)
        AND     B
        ADC     A,H
        NOP*

        EX      AF,AF'
        ADD     A,B
        CALL    PE,882Ch
        RST     0x28
        INC     L
        OR      H
        OR      B
        LD      H,(HL)
        JP      Z,6114h
        RST     0x10
        ADC     A,B
        RET     P
        RET     PE
        SUB     B
        CALL    PE,0BF2Ch
        LD      (HL),E
        CCF
        CP      E
        POP     HL
        SUB     D
        INC     B
        LD      L,D
L11F9:  JP      P,0A988h
        INC     L
        ADD     A,E
        LD      (BC),A
        SUB     C
        AND     8Fh
        RLCA
        RRA
        DEC     B
        LD      (HL),L
        AND     8Bh
        ADD     A,H
        SUB     B
        XOR     C
        INC     L
        ADD     A,E
        INC     B
        CP      A
        LD      D,E
        POP     HL
        DJNZ    L121C
        RRA
        LD      C,H
        RET     NZ
        INC     DE
        AND     E
        SUB     C
        NOP*

        ADD     HL,BC
L121C:  INC     BC
        NOP
        LD      L,B
        ADC     A,L
        LD      A,E
        NOP
        RET     PE
        ADC     A,C
        ADD     HL,BC
        CP      H
        ADD     HL,BC
        ADD     HL,BC
        ADD     A,A
        LD      (BC),A
        LD      H,C
        JP      Z,0BF87h
        LD      (HL),E
        ; --- START PROC L122F ---
L122F:  NOP
        PUSH    HL
        LD      A,D
        INC     BC
        JP      PE,0FE88h
        INC     L
        AND     92h
        INC     B
        LD      (HL),L
        RET     PE
        CP      A
        LD      (HL),E
        LD      E,A
        ADD     HL,BC
        CCF
        LD      (HL),E
        JR      NZ,L12A5
        DEC     A
        ADC     A,C
        LD      DE,7FBFh
        EX      AF,AF'
        LD      L,C
        LD      B,E
        ADC     A,C
        INC     HL
        SBC     A,A
        INC     B
        JP      PE,7AC8h
        SUB     C
        ADC     A,B
        XOR     L
        INC     L
        ADD     A,B
        ADD     A,D
        NOP
        LD      H,(HL)
        EI
        ADD     A,E
        PUSH    AF
        RET     M
        AND     0A1h
        INC     B
        RET     PE
        ADC     A,C
        ADD     A,B
        ADD     A,D
        ADD     A,B
        LD      H,(HL)
        EI
        ADD     A,E
        SBC     A,L
        LD      A,(HL)
        INC     L
        OUT     (0F8h),A
        DEC     C
        SUB     B
        XOR     29h             ; ')'
        LD      (HL),L
        AND     (HL)
        AND     D
        LD      H,C
        RST     0x10
        SUB     H
        LD      (HL),L
        SUB     C
        JP      P,L029F
        AND     8Bh
        ADD     A,H
        RET     PE
        POP     HL
        OR      (HL)
        ADD     HL,BC
        RRA
        NOP
        SBC     A,C
        LD      E,2Ch           ; ','
        CALL    PO,0A3E2h
        ; --- START PROC L128D ---
L128D:  DI
        LD      A,B
        RRCA
        AND     A
        ADC     A,A
        ADC     A,A
        RET     NZ
        AND     A
        CP      H
        LD      (HL),E
        RLCA
        RET     NZ
        RET     PO
        CALL    PO,6ABFh
        ; --- START PROC L129D ---
L129D:  ADC     A,B
        CP      2Ch             ; ','
        DI
        LD      E,A
        ADD     HL,BC
        INC     BC
        LD      (BC),A
        ; --- START PROC L12A5 ---
L12A5:  LD      DE,0BF89h
        LD      D,E
        POP     HL
        LD      E,E
        ADD     HL,BC
        ADD     HL,BC
        LD      (BC),A
        LD      SP,HL
        LD      D,E
        ADC     A,C
        LD      H,C
        POP     HL
        ADD     HL,BC
        LD      (BC),A
        LD      E,A
        ADC     A,C
        LD      D,A
        ADC     A,C
        LD      H,C
        CALL    NC,L1F09
        NOP
        ADC     A,C
        LD      L,B
        SUB     B
        CP      2Ch             ; ','
        POP     HL
        SUB     D
        INC     B
        CCF
        LD      (HL),E
        ; --- START PROC L12C9 ---
L12C9:  CCF
        ADC     A,C
        ADD     HL,BC
        SUB     C
        ADD     A,B
        ADD     A,D
        ADD     A,B
        LD      H,C
        EI
        ADD     A,E
        SBC     A,A
L12D4:  LD      BC,0419h
        DEC     L
        LD      L,D
        RST     0x10
        SBC     A,C
        LD      E,H
        XOR     H
        AND     E
        JP      P,L059E+1       ; reference not aligned to instruction
        AND     8Ah
        INC     B
        RET     P
        ADC     A,B
        XOR     C
        INC     L
        AND     0A5h
        ADC     A,C
        RST     0x38
        DEC     D
        PUSH    HL
        LD      A,A
        ADC     A,C
        LD      A,A
        LD      D,0E1h
        LD      BC,9D09h
        INC     B
        DEC     L
        LD      A,E
        LD      B,B
        ADD     HL,DE
        INC     B
        DEC     L
        LD      H,(HL)
        AND     L
        ADC     A,C
        ADD     A,D
        LD      H,(HL)
        SBC     A,L
        ADD     HL,BC
        AND     0A9h
        LD      A,(BC)
        LD      L,L
        LD      E,L
        ADC     A,C
        PUSH    HL
        LD      A,A
        ADC     A,C
        LD      A,D
        CP      H
        LD      E,E
        LD      SP,HL
        INC     C
        ADD     HL,BC
        SBC     A,C
        LD      E,H
        INC     L
        DI
        LD      B,B
        INC     HL
        RET     M
        DI
        RLCA
        ADC     A,C
        ADD     HL,BC
        ADD     A,D
        LD      H,(HL)
        AND     L
        ADC     A,C
        AND     9Dh
        ADD     HL,BC
        RST     0x38
        LD      (L28E5),HL
        ADD     HL,BC
        AND     0A9h
        LD      A,(BC)
        LD      L,C
        LD      C,09h
        SUB     L
        POP     HL
        EX      (SP),HL
        ADD     HL,BC
        RET     PO
        RET     PE
        SBC     A,E
        CALL    PO,L17FF
        LD      H,B
        INC     A
        LD      E,E
        DEC     DE
        ADD     HL,BC
        AND     9Bh
        LD      A,(BC)
        INC     A
        ADD     HL,DE
        LD      E,H
        INC     L
        ADD     A,E
        LD      B,B
        CCF
        LD      DE,3FF3h
        CALL    PO,9BE6h
        LD      A,(BC)
        INC     A
        LD      E,E
        DEC     IYL
        ADC     A,C
        SBC     A,C
        LD      E,H
        INC     L
        AND     0A5h
        ADC     A,C
        RST     0x38
        DJNZ    L13C4
        LD      A,(0FF89h)
        DEC     D
        PUSH    HL
        LD      A,(0FF89h)
        LD      D,0E1h
        INC     A
        ADD     HL,BC
        SBC     A,L
        INC     B
        DEC     L
        LD      A,E
        JR      NZ,L138A
        INC     B
        DEC     L
        LD      H,(HL)
        AND     L
        ADC     A,C
        AND     0A9h
        LD      A,(BC)
        LD      L,L
        DEC     DE
        ADC     A,C
        DI
        RLCA
        SBC     A,C
        LD      E,L
        INC     L
        AND     0A5h
        ADC     A,C
        AND     0A9h
        LD      A,(BC)
        LD      L,C
        LD      C,C
        ADC     A,C
L138A:  SUB     L
        SBC     A,L
        LD      E,L
        INC     L
        POP     HL
        RST     0x08
        ADD     HL,BC
        DI
        RLCA
        AND     E
        SBC     A,L
        LD      E,L
        INC     L
        ADC     A,E
        ADC     A,E
        ADC     A,E
        ADC     A,E
        RET     C
        LD      H,(HL)
        ADD     A,89h
        INC     HL
        SBC     A,L
        INC     B
        DEC     L
        DAA
        DI
        JR      NZ,L13E3
        LD      H,L
        LD      E,D
        ADC     A,C
        CP      H
        DI
        LD      E,A
        SBC     A,C
        INC     B
        DEC     L
        INC     A
        RLA
        SBC     A,(HL)
        ADD     HL,DE
        LD      E,H
        XOR     H
        POP     HL
        RST     0x20
        ADD     HL,BC
        SUB     L
        SBC     A,L
        INC     B
        DEC     L
        LD      (HL),E
        CCF
        POP     AF
        JP      P,97E1h
        ADC     A,D
L13C4:  INC     A
        LD      E,E
        LD      IYH,A
        ADD     HL,BC
        SBC     A,C
        LD      E,H
        INC     L
        POP     AF
        JP      P,5C9Dh
        INC     L
        IN      A,(0F9h)
        LD      L,L
        ADD     HL,BC
        EX      DE,HL
        LD      B,B
        SUB     A
        AND     E
        SBC     A,L
        INC     B
        DEC     L
        RRCA
        NOP*

        ADD     HL,BC
        SUB     B
        XOR     (HL)
        INC     L
L13E3:  AND     0D8h
        ADD     A,E
        JP      (HL)

L13E7:  DEC     C
        LD      A,(BC)
        LD      H,(HL)
        SBC     A,E
        LD      A,(BC)
        LD      (BC),A
        SBC     A,L
        LD      E,H
        XOR     H
        RET     NZ
        LD      A,C
        LD      BC,170Ah
        SBC     A,(HL)
        LD      A,D
        SBC     A,L
        INC     B
        DEC     L
        LD      A,E
        JR      NZ,L1416
        INC     B
        DEC     L
        LD      A,B
        AND     9Fh
        ADC     A,D
        LD      L,B
        ADC     A,C
        ADC     A,C
        DEC     E
        INC     B
        DEC     L
        DEC     C
        ADC     A,C
        ADD     HL,BC
        ADD     A,A
        LD      (BC),A
        ADD     HL,BC
        SUB     B
        XOR     C
        INC     L
        AND     0CAh
        ADD     A,A
        RET     P
L1416:  RST     0x10
        CALL    PO,L16E5
        LD      A,(BC)
        LD      (HL),L
        SUB     L
        ADC     A,B
        XOR     L
        XOR     H
        CP      A
        ADD     HL,BC
        DEC     DE
        NOP
        DEC     D
        ADC     A,L
        ADD     A,D
        POP     HL
        LD      DE,1D0Ah
        INC     B
        DEC     L
        LD      L,B
        ADC     A,C
        RLCA
        LD      (BC),A
        POP     HL
        ADC     A,B
        LD      A,(BC)
        DEC     E
        INC     B
        DEC     L
        LD      A,E
        NOP
        SBC     A,C
        INC     B
        DEC     L
        LD      H,H
        JP      PE,0B7F2h
        SUB     E
        NOP
        RRCA
        DEC     B
        LD      H,(HL)
        PUSH    DE
        INC     B
        LD      A,83h
        ADD     A,E
        ADD     A,E
        ADD     A,E
        JP      NZ,0E870h
        CALL    PO,L1DFF
        DEC     DE
        RET     M
        LD      A,A
        JR      L14BA+1         ; reference not aligned to instruction

L1457:  RST     0x10
        SBC     A,C
        ; --- START PROC L1459 ---
L1459:  LD      E,(HL)
        INC     L
        SBC     A,C
        LD      E,H
        INC     L
        AND     E
        INC     A
        LD      (HL),E
        LD      B,B
        LD      H,L
        DEC     (HL)
        ADC     A,D
        RRA
        LD      D,89h
        ADD     HL,BC
        JP      PE,73BCh
        NOP
        PUSH    HL
        LD      D,(HL)
        LD      A,(BC)
        LD      DE,0BF91h
        DEC     D
        OUT     (0E1h),A
        LD      B,B
        LD      A,(BC)
        LD      L,B
        SBC     A,A
        JR      L1485

L147C:  ADD     HL,BC
L147D:  JP      PE,L27BF
        SBC     A,C
        LD      E,L
        XOR     H
        CP      H
        ADD     HL,DE
L1485:  LD      E,(HL)
        INC     L
        SBC     A,A
        NOP
        SBC     A,C
        LD      E,L
        INC     L
        SBC     A,L
        LD      E,A
        INC     L
        CALL    C,61EDh
        ADC     A,D
        LD      D,A
        SBC     A,C
        LD      E,(HL)
        INC     L
        CP      H
        LD      (HL),E
        JR      NZ,L14FC
        LD      E,D
        ADC     A,D
        DEC     E
        LD      E,L
        XOR     H
        AND     0C6h
        ADC     A,C
        LD      E,19h
        LD      E,L
        INC     L
        POP     HL
        POP     HL
        ADC     A,D
        LD      DE,059Fh
        ADD     HL,DE
        LD      E,L
        INC     L
        POP     HL
        EX      (SP),HL
        LD      A,(BC)
        LD      D,A
        SBC     A,C
        LD      E,L
        INC     L
        SBC     A,L
        LD      E,L
        XOR     H
L14BA:  AND     0C6h
        ADC     A,C
        LD      E,99h
        LD      E,H
        INC     L
        SUB     C
        SBC     A,A
        INC     B
        ADD     HL,DE
        LD      E,(HL)
        XOR     H
        ADD     A,A
        DI
        RLCA
        AND     E
        ADC     A,B
        XOR     C
        INC     L
        AND     8Fh
        RLCA
        RLCA
        DEC     B
        DJNZ    L147D+1         ; reference not aligned to instruction
        INC     L
        CP      A
        LD      A,E
        JR      L1514+1         ; reference not aligned to instruction

L14DA:  SUB     C
        ADD     A,(HL)
        POP     HL
        LD      L,H
        LD      A,(BC)
        DEC     E
        LD      E,(HL)
        XOR     H
        AND     A
        SUB     B
        XOR     C
        INC     L
        AND     0F8h
        INC     B
        DEC     D
        CP      A
        LD      A,A
        JR      L154F

L14EE:  LD      A,H
        ADC     A,D
        DEC     D
        ADD     A,(HL)
        POP     HL
        HALT
        LD      A,(BC)
        RLCA
        INC     B
        CP      H
        SBC     A,C
        LD      E,H
        XOR     H
        SUB     B
L14FC:  XOR     C
        INC     L
        ADD     A,B
        ADD     A,B
        NOP
        LD      L,B
        SBC     A,L
        LD      E,L
        INC     L
        CALL    C,L0F61
        LD      A,(BC)
        SBC     A,L
        LD      E,(HL)
        XOR     H
        RST     0x38
        INC     B
        LD      H,L
        DEC     C
        LD      A,(BC)
        SBC     A,L
        LD      E,H
        XOR     H
L1514:  CALL    C,L2964+1       ; reference not aligned to instruction
        LD      A,(BC)
        SBC     A,A
        RLA
        ADD     HL,BC
        ADD     HL,BC
        SBC     A,L
        LD      E,H
        XOR     H
        CALL    C,L2964+1       ; reference not aligned to instruction
        LD      A,(BC)
        SBC     A,L
        LD      E,H
        INC     L
        OUT     (0E5h),A
        DEC     E
        ADC     A,D
        JP      PO,9FA7h
        JR      L1538

L152F:  ADD     HL,BC
        ADD     A,(HL)
        POP     HL
        JR      L153E

L1534:  RET     PO
        RST     0x10
        SBC     A,C
        LD      E,H
L1538:  INC     L
        CP      A
        LD      A,A
        JR      L159E

L153D:  INC     HL
L153E:  LD      A,(BC)
        ADD     A,(HL)
        LD      B,0E5h
        INC     H
        ADC     A,D
        ADD     A,(HL)
        ADD     HL,BC
        ADD     HL,BC
        SUB     C
        ADD     A,D
        DEC     E
        LD      E,(HL)
        XOR     H
        CALL    C,L0260+1       ; reference not aligned to instruction
L154F:  LD      A,(BC)
        SBC     A,L
        LD      E,H
        XOR     H
        AND     E
        SBC     A,L
        LD      E,L
        INC     L
        RET     Z
        INC     HL
        LD      A,8Ah
        ADD     A,D
        INC     (IY-76h)
        SBC     A,A
        JR      L156C

L1563:  ADD     HL,BC
        POP     HL
        XOR     A
        LD      A,(BC)
        SBC     A,L
        LD      E,(HL)
        XOR     H
        RST     0x38
        INC     B
L156C:  LD      H,C
        LD      A,8Ah
        ADC     A,L
        ADC     A,L
        ADD     HL,BC
        RST     0x38
        RLA
        LD      H,L
        LD      A,8Ah
        SBC     A,A
        RLA
        ADD     HL,BC
        ADD     HL,BC
        SBC     A,L
        LD      E,(HL)
        INC     L
        OUT     (0E4h),A
        LD      (HL),E
        JR      NZ,L15A1+1      ; reference not aligned to instruction
        LD      (L0989),HL
        SBC     A,A
        DJNZ    L15EE
        LD      B,A
        ADC     A,D
        SBC     A,A
        LD      D,89h
        ADD     HL,BC
        SBC     A,L
        LD      E,L
        XOR     H
        AND     E
        ADD     A,A
        ADD     A,A
        ADD     A,A
        ADD     A,A
        DI
        RLCA
        EI
        JR      L15A4+1         ; reference not aligned to instruction

L159C:  ADD     HL,BC
        CP      H
L159E:  LD      (HL),E
        RLCA
        EI
L15A1:  JR      L15AC

L15A3:  ADD     HL,BC
L15A4:  CALL    PO,0D488h
        ; --- START PROC L15A7 ---
L15A7:  ADD     A,L
        PUSH    AF
        ADC     A,L
        ; --- START PROC L15AA ---
L15AA:  LD      D,A
        LD      A,D
        ; --- START PROC L15AC ---
L15AC:  ADC     A,A
        JP      (HL)

L15AE:  LD      H,H
        LD      A,(BC)
        ADC     A,L
        RRCA
        JP      M,5CEDh
        ADC     A,D
        PUSH    AF
        JP      PE,8488h
        DEC     L
        LD      L,D
        AND     0FDh
        EX      AF,AF'
        RET     P
        RET     PE
        ; --- START PROC L15C1 ---
L15C1:  RET     M
        NEG
        LD      A,(BC)
        PUSH    AF
        RET     M
        DI
        LD      H,B
        RLCA
        LD      (BC),A
        ADC     A,L
        LD      H,C
        LD      A,B
        ADC     A,D
        OUT     (0F9h),A
        LD      L,E
        LD      A,(BC)
        PUSH    AF
        ADC     A,A
        JP      (HL)

L15D6:  LD      (HL),E
        ADC     A,D
        DI
        DJNZ    L163F+1         ; reference not aligned to instruction
        LD      (HL),E
        ADC     A,D
        PUSH    AF
        ADC     A,C
        SUB     C
        ADC     A,L
        LD      E,A
        LD      H,B
        LD      B,0F5h
        ADC     A,C
        SUB     C
        ADC     A,L
        LD      E,A
        LD      H,B
        LD      B,0E1h
        LD      (HL),E
        ADC     A,D
L15EE:  CALL    PO,L02F7+2      ; reference not aligned to instruction
        DEC     BC
        INC     HL
        SUB     C
        ADC     A,C
        ADC     A,L
        LD      E,E
        LD      H,C
        NOP
        ADC     A,E
        LD      B,0E1h
        LD      A,D
        ADC     A,D
        CALL    PO,L0BBB+1      ; reference not aligned to instruction
        CALL    PO,0E98Bh
        DEC     B
        ADC     A,E
        LD      (HL),L
        ADC     A,L
        DEC     BC
        ADC     A,E
        NOP*

        DEC     BC
        LD      (HL),L
        JP      M,91D7h
        RST     0x18
        LD      H,C
        RRCA
        DEC     BC
        LD      B,0E1h
        ADD     HL,BC
        DEC     BC
        LD      A,B
        SBC     A,A
        CALL    PO,0E4F8h
        ; --- START PROC L161E ---
L161E:  ADC     A,B
        RET     M
        ; --- START PROC L1620 ---
L1620:  INC     L
        AND     97h
        ADC     A,C
        DJNZ    L161E
        INC     L
        ADC     A,B
        CP      D
        DEC     BC
        LD      H,C
        SBC     A,L
        ADC     A,E
        ; --- START PROC L162D ---
L162D:  EX      AF,AF'
        RET     M
        ; --- START PROC L162F ---
L162F:  INC     L
        AND     97h
        ADC     A,C
        DJNZ    L162D
        INC     L
        ADC     A,B
        EX      DE,HL
        SBC     A,E
        AND     0D5h
        LD      A,(BC)
        JP      PE,8B60h
L163F:  DJNZ    L15C1
        NOP
        NOP
        LD      SP,HL
        XOR     H
        ADD     A,L
        SCF
        ADD     A,C
        RST     0x10
        JP      M,94E2h
        SUB     H
        XOR     D
        LD      L,94h
        SUB     H
        SUB     H
        AND     D
        LD      H,94h
        ADC     A,H
        ADD     A,H
        RET     PO
        ADD     A,L
        LD      H,(HL)
        ; --- START PROC L165A ---
L165A:  ADD     A,89h
        CPL
        ADC     A,E
        NOP
        INC     C
        ADD     A,C
        RET     M
        SBC     A,A
        NOP*

        ADC     A,E
        DEC     E
        LD      A,B
        INC     L
        OUT     (0F8h),A
        LD      (HL),L
        SUB     B
        ADD     A,B
        NOP
        LD      H,C
        CALL    NC,8183h
        NOP
        NOP
        INC     BC
        LD      HL,(L579B)
        POP     HL
        ; --- START PROC L167A ---
L167A:  RET     NZ
        ADC     A,E
        LD      A,73h           ; 's'
        ; --- START PROC L167E ---
L167E:  LD      B,B
        INC     HL
        PUSH    HL
        LD      B,(HL)
        DEC     BC
        LD      A,17h
        OR      E
        CP      (HL)
        SUB     A
        OR      A
        SUB     C
        SBC     A,A
        LD      BC,0958h
        LD      (HL),L
        SUB     C
        SBC     A,A
        LD      (BC),A
        AND     8Bh
        ADD     A,H
        SUB     L
        SBC     A,A
        LD      BC,0A1F5h
        DEC     H
        JP      M,80E2h
        ADD     A,B
        NOP
        EX      AF,AF'
        OR      D
        NOP
        LD      H,(HL)
        RET     C
        ADD     A,E
        OUT     (C),E
        DEC     BC
        LD      H,(HL)
        CALL    NC,8183h
        POP     HL
        JP      NC,L3E89+2      ; reference not aligned to instruction
        OR      H
        OR      B
        LD      H,(HL)
        SBC     A,A
        ADC     A,D
        LD      H,B
        ADD     A,C
        DEC     B
        RET     M
        SBC     A,(HL)
        POP     HL
        LD      C,(HL)
        ADC     A,E
        LD      H,H
        ADD     A,E
        LD      (BC),A
        POP     HL
        SBC     A,D
        INC     D
        DJNZ    L165A
        ; --- START PROC L16C6 ---
L16C6:  XOR     L
        INC     B
        XOR     E
        CP      H
        RST     0x38
        DEC     B
        PUSH    HL
        LD      A,C
        DEC     BC
        CCF
        LD      D,C
        LD      H,C
        LD      L,L
        ADC     A,E
        LD      BC,0E191h
        PUSH    HL
        ADC     A,E
        INC     (HL)
        OR      B
        INC     D
        JP      P,8A88h
        DEC     L
        INC     C
        XOR     A
        LD      DE,70ABh
        ; --- START PROC L16E5 ---
L16E5:  ADD     A,H
        JP      PE,9888h
        XOR     L
        INC     C
        RET     PE
        PUSH    AF
        ADD     A,C
        RST     0x10
        CALL    PO,L32F9+2      ; reference not aligned to instruction
        LD      A,E
        NOP
        CALL    PO,0E6D7h
        ; --- START PROC L16F7 ---
L16F7:  SUB     B
        ADC     A,E
        RET     PO
        LD      H,(HL)
        ADC     A,A
        ADC     A,E
        RST     0x38
        LD      BC,7FE4h
        ADD     HL,BC
        POP     HL
        DEC     BC
        DEC     BC
        SBC     A,L
        LD      A,0ADh
        LD      E,E
        SBC     A,A
        LD      A,A
        SBC     A,C
        LD      A,0ADh
        LD      H,L
        LD      A,(HL)
        DEC     BC
        LD      H,C
        ADC     A,H
        ADC     A,E
        SBC     A,C
        LD      B,B
        XOR     L
        LD      D,A
        SBC     A,C
        LD      A,0ADh
        LD      E,64h           ; 'd'
        EI
        NOP
        ; --- START PROC L171F ---
L171F:  JP      M,009Fh
        JP      PO,8080h
        ADD     A,B
        LD      H,(HL)
        EX      (SP),HL
        DEC     BC
        LD      H,B
        RET     M
        CALL    P,L069E+1       ; reference not aligned to instruction
        ; --- START PROC L172E ---
L172E:  AND     9Ah
        ADC     A,E
        SBC     A,A
        DEC     B
        NOP
        ADD     A,B
        ; --- START PROC L1735 ---
L1735:  ADD     A,B
        LD      H,(HL)
        SBC     A,C
        ADC     A,A
        JP      M,L06FD+2       ; reference not aligned to instruction
        PUSH    HL
        LD      L,D
        ADC     A,E
        RST     0x38
        CCF
        PUSH    HL
        LD      L,H
        ADC     A,E
        RST     0x38
        INC     B
        PUSH    HL
        LD      B,A
        DEC     BC
        RST     0x38
        DEC     B
        LD      H,L
        DEC     HL
        ADC     A,E
        SBC     A,L
        ADD     HL,DE
        XOR     L
        SBC     A,(HL)
        ADD     HL,DE
        ADD     HL,DE
        XOR     L
        SBC     A,A
        LD      BC,0E366h
        DEC     BC
        LD      H,C
        LD      E,H
        ADC     A,E
        RET     M
        JP      PO,0F5FAh
        RST     0x38
        CCF
        PUSH    HL
        LD      E,L
        ADC     A,E
        JP      M,L06FD+2       ; reference not aligned to instruction
        PUSH    HL
        LD      H,A
        ADC     A,E
        SUB     C
        SBC     A,D
        DEC     D
        CP      A
        LD      DE,0E5D3h
        LD      D,H
        ADC     A,E
        RST     0x18
        LD      L,C
        LD      D,H
        ADC     A,E
        SBC     A,E
        NOP
        RRA
        LD      B,80h
        JP      0E20Bh

L1781:  PUSH    AF
        OUT     (0F4h),A
        SBC     A,A
        DEC     B
        LD      D,E
        ADD     A,B
        OUT     (0Bh),A
        JP      PO,0F8F4h
        SBC     A,A
        DJNZ    L1790
L1790:  ADD     A,B
        ADD     A,B
        LD      H,(HL)
        SBC     A,L
        ADC     A,E
        SBC     A,L
        DEC     E
        XOR     L
        AND     E
        SBC     A,L
        ADD     HL,DE
        XOR     L
        RET     Z
        LD      H,H
        LD      A,C
        LD      C,A
        DEC     BC
        POP     HL
        RST     0x00
        ADC     A,E
        PUSH    AF
        SBC     A,E
        LD      BC,0FA78h
        ADD     A,B
        EXX
        DEC     BC
        JP      PO,0D3F5h
        CALL    P,0F8F8h
        RET     PO
        JP      M,0ABE1h
        ADC     A,E
        RET     M
        CALL    PO,9191h
        CP      A
        LD      A,D
        SUB     L
        OUT     (0F9h),A
        SCF
        ADC     A,E
        DI
        CCF
        SBC     A,D
        LD      SP,HL
        LD      D,L
        ADC     A,E
        SBC     A,E
        NOP
        LD      H,C
        EXX
        DEC     BC
        SUB     C
        SBC     A,E
        NOP
        LD      H,C
        PUSH    DE
        ADC     A,E
        RST     0x10
        POP     HL
        XOR     8Bh
        SBC     A,L
        ADD     HL,DE
        XOR     L
        SBC     A,(HL)
        SBC     A,C
        ADD     HL,DE
        XOR     L
        POP     HL
        XOR     E
        ADC     A,E
L17E1:  JP      M,L049F
        NOP
        ADD     A,B
        ADD     A,B
        LD      H,(HL)
        EX      (SP),HL
        DEC     BC
        LD      H,C
        LD      A,B
        ADC     A,E
        RET     M
        CALL    P,0E4F8h
        SBC     A,L
        DEC     A
        ; --- START PROC L17F3 ---
L17F3:  DEC     L
        LD      (HL),E
        LD      (HL),A
        SBC     A,C
        DEC     A
        DEC     L
        CCF
        LD      D,E
        ; --- START PROC L17FB ---
L17FB:  JP      M,L3FF2+1       ; reference not aligned to instruction
        XOR     E
        ; --- START PROC L17FF ---
L17FF:  RET     M
        CP      L
        LD      (HL),D
        JP      M,L3D9C+1       ; reference not aligned to instruction
        DEC     L
        LD      (HL),E
        EX      AF,AF'
        LD      H,C
        DEC     C
        ADC     A,H
        LD      A,B
        JP      M,9AE6h
        ADC     A,E
        RET     M
        RET     P
        SUB     C
        CALL    M,007Bh
        POP     HL
        ADC     A,E
        RET     M
        JP      M,0F1E6h
        ADC     A,E
        POP     HL
        ADC     A,C
        INC     C
        DEC     E
        DEC     A
        ; --- START PROC L1823 ---
L1823:  DEC     L
        LD      (HL),E
        EX      AF,AF'
        LD      H,C
        LD      D,C
        INC     C
        EX      AF,AF'
        ADD     A,B
        ; --- START PROC L182B ---
L182B:  NOP
        LD      L,D
        JP      P,8FE6h
        ADC     A,E
        RET     P
        RET     PE
        RST     0x38
        CCF
        PUSH    HL
        LD      B,C
        ADC     A,H
        LD      A,A
        INC     B
        LD      H,L
        LD      B,C
        ADC     A,H
        LD      A,A
        LD      BC,0BE5h
        ADD     A,E
        RST     0x38
        LD      B,0E5h
        LD      C,B
        INC     C
        LD      A,A
        LD      A,(BC)
        PUSH    HL
        LD      C,H
        ADC     A,H
        LD      A,A
        INC     B
        PUSH    HL
        INC     L
        INC     C
        LD      A,A
        DJNZ    L18C0+1         ; reference not aligned to instruction
        DEC     L
        ADC     A,H
        DEC     SP
        SUB     C
        ADC     A,C
        AND     0B6h
        ADC     A,H
        LD      H,C
        SUB     A
        INC     C
        RRA
        CCF
        AND     0B6h
        ADC     A,H
        RRA
        DJNZ    L18CD
        OR      (HL)
        ADC     A,H
        RRA
        CCF
        JP      P,0E6EAh
        SBC     A,D
        ADC     A,E
        RET     PE
        SUB     B
        JP      NZ,6600h
        RET     C
        ADD     A,E
        AND     3Fh             ; '?'
        INC     C
        LD      (HL),B
        CALL    PO,L1083
        ; --- START PROC L187E ---
L187E:  LD      H,C
        SBC     A,D
        INC     D
        DEC     A
        LD      E,C
        PUSH    HL
        RLA
        INC     C
        DEC     C
        SUB     L
        AND     0B0h
        ADC     A,H
        LD      H,C
        SUB     A
        INC     C
        LD      H,(HL)
        JP      (HL)

L1890:  ADC     A,H
        LD      L,H
        LD      H,(HL)
        POP     AF
        ADC     A,H
        LD      D,A
        CALL    PO,0F1E6h
        ADC     A,H
        LD      H,(HL)
        CALL    NC,0E183h
        SUB     A
        INC     C
        EX      AF,AF'
        ADD     A,B
        ; --- START PROC L18A2 ---
L18A2:  NOP
        LD      L,D
        JP      P,00FBh
        AND     0F6h
        ADC     A,H
        LD      (HL),B
        RET     PE
        RST     0x38
        LD      B,0E5h
        LD      H,D
        INC     C
        DEC     SP
        ADC     A,C
        SUB     C
        JP      P,0FA90h
        NOP
        AND     0D8h
        ADD     A,E
        AND     3Fh             ; '?'
        INC     C
        LD      (HL),B
        POP     HL
L18C0:  JP      NC,668Ch
        JP      (HL)

L18C4:  ADC     A,H
        LD      L,H
        LD      H,L
        LD      E,D
        ADC     A,H
        LD      (HL),D
        AND     0F6h
        ADC     A,H
        ; --- START PROC L18CD ---
L18CD:  LD      (HL),B
        EI
        NOP
        CALL    PO,0BD95h
        LD      E,C
        POP     HL
        LD      L,L
        ADC     A,H
        DEC     DE
        CALL    PO,7BBFh
        LD      B,B
        DEC     SP
        SUB     C
        SBC     A,E
        NOP
        LD      H,H
        JP      M,0F2EAh
        AND     97h
        DEC     BC
        RET     P
        RET     PE
        RET     M
        CALL    PO,9FFAh
        ; --- START PROC L18ED ---
L18ED:  LD      (BC),A
        NOP
        ADD     A,B
        ADD     A,B
        LD      H,(HL)
        EX      (SP),HL
        DEC     BC
        LD      A,B
        AND     80h
        INC     C
        RET     PE
        INC     BC
        LD      DE,9AE6h
        INC     D
        LD      (HL),H
L18FF:  JP      PO,9FA3h
        NOP
        OUT     (0BCh),A
        LD      H,B
L1906:  JP      M,8080h
        ADD     A,B
        RRA
        DJNZ    L1973
        EX      (SP),HL
        DEC     BC
        LD      H,C
        DJNZ    L191E
        RET     M
        JP      M,80E2h
        ADC     A,(HL)
        INC     C
        JP      PO,0E0F4h
        POP     HL
        ADD     A,(HL)
        INC     C
L191E:  RET     M
        CALL    PO,009Fh
        ; --- START PROC L1922 ---
L1922:  OUT     (80h),A
        ADD     A,B
        ; --- START PROC L1925 ---
L1925:  ADD     A,B
        LD      A,D
        SBC     A,A
        EX      AF,AF'
        LD      H,(HL)
        EX      (SP),HL
        DEC     BC
        LD      A,B
        POP     HL
        EI
        ADC     A,H
        DEC     E
        LD      E,A
        XOR     H
        AND     E
        SUB     B
        RST     0x28
        INC     L
        RST     0x10
        DEC     SP
        CP      H
        LD      (HL),A
        LD      B,B
        ADD     HL,DE
        LD      E,A
        XOR     H
        SUB     L
        LD      L,H
        INC     L
        AND     (HL)
        LD      (6F95h),HL
        INC     L
        XOR     (HL)
        LD      A,0F7h
        JR      NZ,L1977
        SBC     A,L
        LD      (HL),B
        INC     L
        OUT     (9Bh),A
        CALL    PO,0AF66h
        ADD     A,H
        ; --- START PROC L1955 ---
L1955:  CP      H
        LD      (HL),E
        JR      NZ,L19B8+1      ; reference not aligned to instruction
        INC     A
        EX      DE,HL
        INC     B
        RRA
        ; --- START PROC L195D ---
L195D:  CALL    PO,88F2h
        CALL    M,0E685h
        PUSH    DE
        LD      A,(BC)
        RET     P
        LD      I,A
        ADC     A,H
        JP      P,0FC88h
        ADD     A,L
        ADD     A,B
        RET     PO
        INC     L
        AND     0E6h
        SUB     H
        ; --- START PROC L1973 ---
L1973:  DJNZ    L1955
        INC     L
        XOR     D
        ; --- START PROC L1977 ---
L1977:  LD      L,0E6h
        SUB     A
        ADC     A,C
L197B:  DJNZ    L195D
        INC     L
        ADC     A,B
        CALL    M,0E685h
        SBC     A,94h
L1984:  LD      (HL),B
        ADC     A,B
        RET     PO
        INC     L
        AND     C
        DEC     H
        POP     HL
        RST     0x10
        SUB     H
        NOP
        RET     PO
        INC     L
        ADC     A,B
        CALL    C,0E185h
        RST     0x18
        SUB     H
        DJNZ    L197B
        INC     L
        ADC     A,B
        CALL    C,0E685h
        ; --- START PROC L199D ---
L199D:  RET

L199E:  INC     D
        DJNZ    L1984
        INC     L
        ADC     A,B
        AND     2Ch             ; ','
        AND     C
        DEC     H
        POP     HL
        RST     0x18
        SUB     H
        LD      D,A
        SBC     A,C
        LD      E,A
        XOR     H
        ADC     A,B
        CALL    PE,902Ch
        CALL    NC,0E685h
L19B5:  JP      M,9003h
L19B8:  CALL    C,0F285h
        ADC     A,B
        EX      (SP),HL
        INC     L
        AND     0FAh
        INC     BC
        RET     P
        ADC     A,B
        AND     2Ch             ; ','
        AND     0FAh
        INC     BC
        SUB     B
        RET     PO
        INC     L
        XOR     D
        LD      L,80h
        JP      (HL)

L19CF:  INC     L
        POP     HL
        RST     0x18
        SUB     H
        DJNZ    L19B5
        INC     L
        ADC     A,B
        AND     2Ch             ; ','
        ADD     A,B
        RST     0x28
        INC     L
        AND     0E6h
        SUB     H
        LD      H,(HL)
        SBC     A,C
        INC     C
        CALL    PE,0EC10h
        INC     L
        ADC     A,B
        RST     0x28
        INC     L
        AND     0C9h
        INC     D
        LD      H,(HL)
        CALL    Z,0E60Ch
        CALL    Z,900Ch
        RET     PO
        INC     L
        ADC     A,B
        JP      (HL)

L19F7:  INC     L
        AND     0DEh
        SUB     H
        LD      H,C
        JP      PE,0D78Ch
        SBC     A,C
        ; --- START PROC L1A00 ---
L1A00:  LD      L,A
        INC     L
        JP      PE,0B0E6h
        INC     C
        AND     0D6h
        INC     C
        SBC     A,L
        LD      L,A
        INC     L
        OUT     (0E5h),A
        DJNZ    L199D
        EX      AF,AF'
        RET     PO
        INC     L
        AND     0F8h
        ADD     A,E
        SUB     B
        CALL    NC,8885h
        EX      (SP),HL
        INC     L
        AND     0FAh
        INC     BC
        AND     0EAh
        ADC     A,H
        RET     PE
        SUB     B
        CALL    PE,0E12Ch
        JP      M,9F03h
        NOP
        ; --- START PROC L1A2B ---
L1A2B:  SBC     A,C
        LD      L,A
        INC     L
        POP     HL
        ADD     A,D
        DEC     C
        LD      L,D
L1A32:  JP      P,0F588h
        INC     L
L1A36:  AND     80h
        DEC     C
        LD      (HL),B
        ADC     A,B
        RET     M
        INC     L
        AND     95h
        ADC     A,L
        DJNZ    L1A36+1         ; reference not aligned to instruction
        INC     L
        ADC     A,B
        RET     M
L1A45:  INC     L
        RET     PO
        POP     HL
        AND     94h
        LD      L,D
L1A4B:  JP      P,0E088h
        INC     L
        AND     0FAh
        INC     BC
        OR      C
        DEC     (HL)
        ADD     A,B
        JP      (HL)

L1A56:  INC     L
        AND     0DFh
        SUB     H
        DJNZ    L1A45
        INC     L
L1A5D:  ADC     A,B
        CALL    PE,0E685h
        PUSH    DE
        LD      A,(BC)
        RET     P
        IN      L,(C)
        DEC     C
        DJNZ    L1A5D
        ADD     A,L
        ADC     A,B
        CALL    PE,0E62Ch
        JP      M,8803h
        EX      (SP),HL
        INC     L
        AND     0F8h
        ADD     A,E
        SBC     A,A
        LD      B,B
        ADD     HL,DE
        LD      E,A
        XOR     H
        SBC     A,L
        LD      H,B
        INC     L
        DI
        LD      B,B
L1A80:  INC     HL
        SUB     B
        CALL    PE,0BF2Ch
        LD      (HL),E
        CCF
        RET     C
        DEC     SP
        SUB     B
        CALL    C,0F285h
        ADC     A,B
        RET     PO
        INC     L
        AND     C
        DEC     H
        AND     0E6h
        SUB     H
        LD      (HL),B
        ADC     A,B
        JP      (HL)

L1A98:  INC     L
        AND     C
        DEC     H
L1A9B:  AND     0E6h
        SUB     H
        DJNZ    L1A80
        INC     L
        ADC     A,B
        EX      (SP),HL
        INC     L
        ADD     A,B
        RST     0x28
        INC     L
        AND     0E6h
        SUB     H
        LD      H,(HL)
        SBC     A,C
        INC     C
        NOP*

        DEC     C
L1AB0:  SUB     B
        EX      (SP),HL
        INC     L
        ADC     A,B
        CALL    PO,0E685h
        RET

L1AB8:  INC     D
        DJNZ    L1A9B
        INC     L
        ADC     A,B
        JP      (HL)

L1ABE:  INC     L
        AND     0DEh
        SUB     H
        DJNZ    L1AB0
        INC     L
        ADC     A,B
        RST     0x28
        INC     L
        AND     0C9h
        INC     D
        LD      H,C
        RET     NC
        DEC     C
        LD      (HL),D
L1ACF:  SUB     B
        CALL    C,8885h
        JP      (HL)

L1AD4:  INC     L
        ADD     A,B
        EI
        INC     L
L1AD8:  AND     0CAh
        INC     D
        DJNZ    L1AD8
        INC     L
        XOR     D
        LD      L,0E6h
        CALL    0F008h
        ADC     A,B
        EI
        INC     L
        ADD     A,B
        RET     PO
        INC     L
        AND     0E6h
        SUB     H
        DJNZ    L1ACF
        INC     L
        XOR     D
        LD      L,80h
        JP      (HL)

L1AF4:  INC     L
        AND     0DFh
        SUB     H
        EX      AF,AF'
        AND     2Ch             ; ','
        AND     0F8h
L1AFD:  ADD     A,E
        ADC     A,B
        RET     M
        INC     L
        AND     0FBh
        ADD     A,E
        SUB     B
        CALL    NC,8885h
        CALL    PE,0E62Ch
        EI
        ADD     A,E
        ADC     A,B
        EX      (SP),HL
        INC     L
        AND     0FBh
        ADD     A,E
        SUB     B
        RET     M
        INC     L
        ADC     A,B
        RET     PO
        INC     L
        ADD     A,B
        JP      P,0E62Ch
        RST     0x18
        SUB     H
L1B1F:  DJNZ    L1AFD
        ADD     A,L
        ADC     A,B
        EX      (SP),HL
        INC     L
        ADD     A,B
        PUSH    AF
        INC     L
        AND     0CAh
L1B2A:  INC     D
        DJNZ    L1B1F
        INC     L
        ADC     A,B
        PUSH    AF
        INC     L
        AND     D
        LD      H,0E6h
        AND     94h
L1B36:  DJNZ    L1B2A
        INC     L
        ADC     A,B
        AND     2Ch             ; ','
        ADD     A,B
        RST     0x28
        INC     L
        AND     0E6h
        SUB     H
        LD      H,(HL)
        AND     B
        ADC     A,H
        NOP*

        DEC     C
        SUB     B
        CALL    PE,882Ch
        RST     0x28
        INC     L
        AND     0C9h
        INC     D
        DJNZ    L1B36
        INC     L
L1B54:  ADC     A,B
        CALL    C,0E685h
        RET

L1B59:  INC     D
        DJNZ    L1B54
        INC     L
        ADC     A,B
        EX      (SP),HL
        INC     L
        AND     0DEh
        SUB     H
        LD      H,(HL)
        CALL    Z,900Ch
        RET     PO
        INC     L
        ADC     A,B
        JP      (HL)

L1B6B:  INC     L
        AND     0DEh
        SUB     H
        LD      H,C
        ADC     A,D
        ADC     A,L
        RET     PE
        SUB     B
        CALL    PE,0E12Ch
        JP      M,8103h
        ADD     A,B
        INC     DE
        ADC     A,H
        INC     D
        INC     C
        LD      BC,3980h
        CALL    NZ,0B082h
        ADD     A,C
        ADD     A,B
        XOR     D
        INC     L
        RET     NZ
        XOR     B
        LD      BC,9481h
        RET     NZ
        LD      C,D
        RET     NZ
        LD      BC,4483h
        LD      B,E
        EX      AF,AF'
        ADD     A,D
        ADD     A,C
        ADC     A,C
        CP      H
        LD      C,E
        INC     D
        OR      B
        LD      BC,0B193h
        LD      A,(DE)
        ADC     A,D
        LD      C,B
        ADD     A,C
        XOR     D
        SBC     A,H
        LD      B,E
        CP      B
        LD      B,D
        LD      L,D
        ADC     A,B
        ; --- START PROC L1BAB ---
L1BAB:  RET     PO
        INC     L
        JP      PE,0E6F2h
        CALL    PO,7089h
        RET     PE
        CP      A
        LD      (HL),E
        LD      B,B
        ADD     HL,DE
        LD      E,A
        XOR     H
        PUSH    AF
        AND     97h
        ADC     A,E
        EX      AF,AF'
        DI
        ADD     A,B
        LD      H,(HL)
        RET     C
        ADD     A,E
        JP      PE,L0E34
        LD      (HL),D
        SUB     B
        CALL    C,8885h
        PUSH    AF
        INC     L
        AND     0FAh
        INC     BC
        RET     PO
        ADD     A,E
        NOP
        SUB     B
        CP      L
        ADC     A,L
        CP      H
        LD      D,B
        PUSH    HL
        LD      (HL),L
        DEC     C
        JP      PO,88F2h
        PUSH    AF
        INC     L
        AND     C
        DEC     H
        AND     0DFh
        SUB     H
        LD      (HL),B
        RET     PO
        SBC     A,A
        INC     BC
        LD      H,(HL)
        RET     M
        INC     B
        INC     A
        INC     BC
        AND     E
        JP      (HL)

L1BF1:  LD      L,H
        ADC     A,L
        SUB     B
        RET     PO
        INC     L
        ADC     A,B
        RET     M
        INC     L
        AND     D
        LD      H,0F2h
        JP      PE,0D7E6h
        SUB     H
        LD      L,B
        RET     P
        AND     0FAh
        INC     BC
        SUB     B
        CALL    C,8885h
        EX      (SP),HL
        INC     L
        AND     0FBh
        ADD     A,E
        ADC     A,B
        CALL    PE,0E62Ch
        EI
        ADD     A,E
        ADC     A,B
        AND     2Ch             ; ','
        SUB     B
        ADD     A,H
        ADD     A,(HL)
        LD      H,(HL)
        EI
        ADD     A,E
        SUB     B
        RET     PO
        INC     L
        ADC     A,B
        AND     2Ch             ; ','
        ADD     A,B
        RST     0x28
        INC     L
        AND     0E6h
        SUB     H
        LD      H,(HL)
        AND     B
        ADC     A,H
        NOP*

L1C2E:  ADC     A,(HL)
        LD      H,(HL)
        CALL    Z,900Ch
        RET     M
        INC     L
        ADC     A,B
        RET     PO
        INC     L
        AND     C
L1C39:  DEC     H
        AND     0DFh
        SUB     H
        DJNZ    L1C2E
        INC     L
        ADC     A,B
        CALL    PE,0A12Ch
        DEC     H
        AND     0CAh
        INC     D
        LD      H,C
        ADC     A,A
        ADC     A,(HL)
        DJNZ    L1C39
        INC     L
        ADC     A,B
        PUSH    AF
        INC     L
        AND     0DEh
        SUB     H
        DEC     E
        LD      E,A
        XOR     H
        OUT     (0E0h),A
        SUB     B
        CALL    C,8885h
        CALL    PE,0E12Ch
        LD      H,(HL)
        SUB     H
        LD      (HL),L
        POP     HL
        AND     94h
        INC     BC
        LD      (BC),A
        LD      H,C
        SBC     A,D
        INC     D
        LD      L,D
L1C6C:  JP      P,0D3E6h
        ADC     A,D
        RET     P
        ADD     A,E
        LD      BC,1A66h
        INC     D
        EX      AF,AF'
        RET     PO
        INC     L
        AND     0FAh
        INC     BC
        ADC     A,L
        DEC     BC
        XOR     2Fh             ; '/'
        LD      C,0F3h
        LD      BC,4C65h
        LD      C,0Dh
        LD      (HL),E
        JR      NZ,L1CEE+1      ; reference not aligned to instruction
        LD      C,H
        LD      C,10h
        XOR     29h             ; ')'
        LD      HL,0E625h
        AND     94h
        RRA
        LD      A,A
        SBC     A,C
        RLCA
        DEC     L
        INC     BC
        LD      B,B
        RLCA
        NOP
        EX      AF,AF'
        JP      NC,908Dh
        RET     PO
        INC     L
L1CA3:  JP      P,0EAE2h
        AND     0D5h
        LD      A,(BC)
        RET     PE
        RET     PO
        RET     P
        IM      2
        ADC     A,(HL)
        LD      L,D
        JP      PO,L26A0+2      ; reference not aligned to instruction
        AND     0E6h
        SUB     H
        LD      H,B
        RET     PE
        CP      H
        RET     C
        DAA
        SUB     B
        LD      A,A
        ADC     A,H
        PUSH    AF
        CP      H
        RLCA
        AND     E
        JP      (HL)

L1CC4:  LD      D,C
        LD      C,34h           ; '4'
        SUB     E
        NOP
        EX      AF,AF'
        JP      P,0E62Ch
        CP      A
        DEC     BC
        DJNZ    L1CA3+2         ; reference not aligned to instruction
        ADD     A,L
        ADC     A,B
        CALL    PE,0E62Ch
        JP      M,9003h
        RET     PO
        INC     L
        ADC     A,B
L1CDC:  CALL    C,8085h
        RET     M
        INC     L
        JP      P,0E6EAh
        RST     0x10
        SUB     H
        LD      L,B
        RET     P
        JP      P,0C9E6h
        INC     D
        LD      (HL),B
        AND     D
L1CEE:  LD      H,88h
        RET     M
        INC     L
        PUSH    AF
        JP      PO,0E6E6h
        SUB     H
        LD      (HL),B
        XOR     D
        LD      L,80h
        JP      (HL)

L1CFC:  INC     L
        AND     0DFh
        SUB     H
        DJNZ    L1CDC+2         ; reference not aligned to instruction
        ADD     A,L
        ADC     A,B
        EX      (SP),HL
        INC     L
        AND     0FAh
L1D08:  INC     BC
        SUB     B
        RET     PO
        INC     L
        ADC     A,B
        EX      (SP),HL
        INC     L
        ADD     A,B
        RST     0x28
        INC     L
        AND     0E6h
        SUB     H
        LD      H,(HL)
        AND     B
        ADC     A,H
        NOP*

        ADC     A,(HL)
        SUB     B
L1D1C:  CALL    PO,8885h
        EX      (SP),HL
        INC     L
        AND     C
        DEC     H
        AND     0CAh
        INC     D
        DJNZ    L1D08
        INC     L
        ADC     A,B
        JP      (HL)

L1D2B:  INC     L
        AND     0DEh
        SUB     H
        DJNZ    L1D1C+1         ; reference not aligned to instruction
        INC     L
        ADC     A,B
        RST     0x28
        INC     L
        AND     0C9h
        INC     D
        LD      H,C
        ADD     A,L
L1D3A:  ADC     A,(HL)
        SUB     B
        CALL    PO,8885h
        CALL    PE,0A12Ch
        DEC     H
        AND     0DFh
        SUB     H
        DJNZ    L1D3A
        INC     L
        ADC     A,B
        CALL    PE,0E02Ch
        JP      PO,0CAE6h
        INC     D
        LD      H,B
        SBC     A,L
        RLCA
        DEC     L
        LD      E,E
        CALL    PO,7B05h
        LD      B,B
        LD      BC,8364h
        INC     BC
        LD      H,C
        SBC     A,D
        INC     D
        LD      H,D
L1D62:  JP      PE,0F5F2h
        AND     0D3h
        ADC     A,D
        RET     P
        PUSH    HL
        LD      C,H
        ADC     A,(HL)
        JP      P,0D3E6h
        ADC     A,D
        RET     P
        PUSH    HL
        LD      D,B
        ADC     A,(HL)
        POP     AF
        JP      P,8C88h
        ADD     A,(HL)
        LD      H,(HL)
        PUSH    DE
        LD      A,(BC)
        RET     P
        POP     AF
        LD      (880Eh),DE
        EI
        INC     L
        AND     0B6h
        ADC     A,(HL)
        LD      L,B
        SUB     B
        EI
        INC     L
        AND     D
        LD      H,0E6h
        RST     0x18
        SUB     H
        LD      L,B
        SUB     B
        EI
        INC     L
        POP     HL
        PUSH    DE
        ADC     A,L
        RET     PE
        RET     PE
        SUB     B
        XOR     29h             ; ')'
        LD      H,C
        SUB     D
        INC     B
        LD      L,B
        RET     PE
        POP     HL
        SUB     D
        INC     B
        LD      H,B
        RET     PE
        JP      P,0F0E2h
        RET     PO
        JP      PO,0F2EAh
        ADC     A,B
        CP      2Ch             ; ','
        AND     97h
        ADC     A,C
        LD      (HL),B
        ADC     A,B
        CP      2Ch             ; ','
L1DB7:  JP      P,0D5E6h
        LD      A,(BC)
        RET     PE
        RET     P
        POP     AF
        JP      PE,L41E0+1      ; reference not aligned to instruction
        ADC     A,(HL)
        JP      P,0EE90h
        ADD     HL,HL
        EX      AF,AF'
        RET     PO
        INC     L
L1DC9:  AND     92h
        INC     B
        LD      (HL),B
        POP     AF
        ADC     A,B
        EX      (SP),HL
        INC     L
        AND     93h
        ADD     A,H
        DJNZ    L1DB7+2         ; reference not aligned to instruction
        INC     L
        AND     0D3h
        ADC     A,D
        PUSH    HL
        LD      A,D
        ADC     A,(HL)
        RET     PE
        JP      PE,0E090h
        INC     L
        AND     0DEh
        SUB     H
        DJNZ    L1DC9+1         ; reference not aligned to instruction
        INC     L
        ADC     A,B
        XOR     29h             ; ')'
        LD      H,0A2h
        LD      H,(HL)
        RST     0x10
        SUB     H
        LD      H,C
        EX      DE,HL
        LD      C,0E8h
        RET     PE
        SUB     B
        RET     PO
        INC     L
        POP     HL
        SUB     D
        INC     B
        DEC     D
        LD      (BC),A
        XOR     L
        SUB     C
        ; --- START PROC L1DFF ---
L1DFF:  SUB     C
        DEC     D
        XOR     L
        SBC     A,A
        LD      BC,3D19h
        DEC     L
        LD      H,(HL)
        SUB     C
L1E09:  SBC     A,C
        LD      L,L
        LD      A,(BC)
        ADC     A,A
        LD      H,(HL)
        JP      PE,9198h
        DEC     D
        XOR     L
        SUB     L
        DEC     D
L1E15:  XOR     L
        SUB     C
        INC     BC
        XOR     L
        SUB     L
        CP      A
        LD      E,64h           ; 'd'
        LD      H,(HL)
        JP      C,9190h
        RLA
        XOR     L
        SUB     L
        RLA
L1E25:  XOR     L
        CP      (HL)
        LD      E,D
        CALL    PO,8110h
        CPL
        LD      DE,0AD16h
        SUB     L
        DEC     D
        XOR     L
        AND     0CBh
        SBC     A,B
        DEC     D
        LD      D,0ADh
        SBC     A,E
        LD      B,B
        LD      H,(HL)
        RST     0x10
        SUB     B
        SUB     B
        ADD     A,B
        NOP
        LD      DE,0AD16h
        SUB     B
        ADD     A,C
        CPL
        LD      DE,0AD06h
        SUB     C
        DEC     B
        XOR     L
        SUB     C
        LD      A,B
        INC     L
        AND     97h
        DEC     BC
        SUB     B
        ADD     A,B
        ; --- START PROC L1E54 ---
L1E54:  NOP
        LD      DE,2C60h
        AND     8Fh
        ADC     A,E
        RST     0x38
        LD      BC,0BE5h
        ADD     A,E
        RST     0x38
        CCF
        PUSH    HL
        LD      HL,(660Fh)
        XOR     C
        LD      A,(BC)
        LD      L,L
        LD      B,E
        RRCA
        LD      (HL),E
        RLCA
        ADD     A,E
        DEC     B
        DEC     D
        LD      H,B
        INC     L
        PUSH    AF
        SUB     B
        ADD     A,B
        NOP
        INC     C
        ADD     A,D
        POP     HL
        INC     A
        RRCA
        LD      H,(HL)
        RET     M
        INC     B
        LD      DE,2C60h
        POP     HL
        XOR     L
        RRCA
        LD      H,(HL)
        CP      B
L1E86:  INC     B
        NOP
        ADC     A,E
        NOP
        DJNZ    L1E86
        RRCA
        LD      H,L
        IN      A,(08h)
        JP      NZ,L1EE9
        PUSH    BC
        LD      HL,(L59BF+1)    ; reference not aligned to instruction
        LD      A,H
        OR      L
        JP      NZ,L1E9D+2      ; reference not aligned to instruction
        INC     HL
L1E9D:  LD      (L59BF+1),HL    ; reference not aligned to instruction
        LD      HL,5C0Eh
        LD      A,C
        CP      03h
        JP      Z,L1EB9+1       ; reference not aligned to instruction
        CP      04h
        JP      Z,L1EB9+1       ; reference not aligned to instruction
        CP      05h
        JP      Z,L1EB9+1       ; reference not aligned to instruction
        CP      0Ch
        JP      NZ,L1ED9+1      ; reference not aligned to instruction
        PUSH    HL
L1EB9:  CALL    L171F
        POP     HL
        CP      03h
        JP      Z,L0717
        CP      7Fh             ; ''
        POP     BC
        JP      Z,L1E54
        PUSH    BC
        CP      0Dh
        JP      Z,L1ED5
        LD      (HL),A
        INC     HL
        JP      L1EB9+1         ; reference not aligned to instruction

L1ED3:  LD      (HL),80h
L1ED5:  CALL    L21AF
        POP     BC
        ; --- START PROC L1ED9 ---
L1ED9:  LD      HL,1F07h
        ADD     HL,BC
        ADD     HL,BC
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      DE,1E54h
        PUSH    DE
        JP      (HL)

L1EE7:  LD      A,3Fh           ; '?'
        ; --- START PROC L1EE9 ---
L1EE9:  CALL    L1735
        CALL    L1F84+2         ; reference not aligned to instruction
        JP      L1E54

L1EF2:  LD      D,L
        LD      B,H
        LD      C,C
        LD      B,E
        LD      D,E
        LD      D,C
        ; --- START PROC L1EF8 ---
L1EF8:  LD      D,D
        LD      C,E
        LD      B,(HL)
        LD      B,D
        LD      B,C
        LD      C,L
        LD      C,H
        LD      D,H
        JR      NZ,L1F5A
        LD      D,B
        LD      D,A
        LD      B,L
        LD      C,B
        LD      E,D
        ADD     A,(HL)
        RRA
        ; --- START PROC L1F09 ---
L1F09:  SUB     A
        RRA
        ADD     HL,DE
        JR      NZ,L1F63
        JR      NZ,L1ED9
        RRA
L1F11:  LD      L,B
        JR      NZ,L1F7E
        JR      NZ,L1F8B
        RRA
        XOR     L
        JR      NZ,L1EF8
        JR      NZ,L1F11
        JR      NZ,L1F26
        LD      HL,2119h
        ADD     A,B
        RRA
        JR      C,L1F44+2       ; reference not aligned to instruction
        LD      C,L
L1F26:  LD      HL,209Dh
        CP      B
        JR      NZ,L1F95
        LD      HL,2179h
        LD      A,A
        LD      HL,0E5F5h
        LD      HL,(5B2Dh)
        PUSH    AF
        LD      A,H
        OR      L
        JP      Z,L1F54+1       ; reference not aligned to instruction
        POP     AF
        CP      0Dh
        JP      Z,L1F52
        LD      (HL),A
        INC     HL
L1F44:  LD      (5B2Dh),HL
        LD      DE,5E86h
        CALL    L07B1
        CALL    Z,L187E
        POP     HL
        POP     AF
        ; --- START PROC L1F52 ---
L1F52:  RET

L1F53:  POP     AF
L1F54:  JP      L1F52

L1F57:  LD      A,D
        OR      E
        ; --- START PROC L1F59 ---
L1F59:  RET     Z
        ; --- START PROC L1F5A ---
L1F5A:  PUSH    HL
        PUSH    DE
        LD      A,(HL)
        AND     7Fh             ; ''
        CALL    L1735
        POP     DE
        ; --- START PROC L1F63 ---
L1F63:  POP     HL
        INC     HL
        DEC     DE
        JP      L1F59

L1F69:  LD      HL,(L59BF+1)    ; reference not aligned to instruction
        DEC     HL
        LD      (L59BF+1),HL    ; reference not aligned to instruction
        LD      A,H
        OR      L
        RET

L1F73:  LD      HL,(5B0Bh)
        LD      (HL),80h
        LD      (5B0Dh),HL
        JP      L201A+2         ; reference not aligned to instruction

        ; --- START PROC L1F7E ---
L1F7E:  LD      HL,(5B0Dh)
        CALL    L17F3
L1F84:  CALL    L172E
        LD      HL,(5B0Bh)
        EX      DE,HL
        ; --- START PROC L1F8B ---
L1F8B:  LD      HL,(5B0Dh)
        CALL    L07A9
        EX      DE,HL
        JP      L1F59

        ; --- START PROC L1F95 ---
L1F95:  LD      A,5Ch           ; '\'
        ; --- START PROC L1F97 ---
L1F97:  CALL    L1735
        LD      HL,(5B0Dh)
        ; --- START PROC L1F9D ---
L1F9D:  LD      A,(HL)
        INC     HL
L1F9F:  AND     7Fh             ; ''
        JP      Z,L1FB0+1       ; reference not aligned to instruction
        PUSH    HL
        CALL    L1735
        CALL    L1F69+2         ; reference not aligned to instruction
        POP     HL
        JP      NZ,L1F9F
        EX      DE,HL
L1FB0:  LD      HL,(5B0Dh)
        LD      A,(DE)
        INC     DE
L1FB5:  AND     7Fh             ; ''
        LD      (HL),A
        INC     HL
        JP      NZ,L1FB5
        DEC     HL
        LD      (HL),80h
        CALL    L21AF
        LD      A,5Ch           ; '\'
        JP      L1735

L1FC7:  LD      HL,(5B0Dh)
        LD      (L59C5+1),HL    ; reference not aligned to instruction
        LD      HL,5C0Eh
        LD      A,(HL)
        CP      80h
        RET     Z
L1FD4:  LD      HL,5C0Eh
        EX      DE,HL
        LD      HL,(L59C5+1)    ; reference not aligned to instruction
        LD      A,(HL)
L1FDC:  AND     7Fh             ; ''
        LD      B,A
        LD      A,(DE)
        AND     7Fh             ; ''
        CP      B
        JP      NZ,L1FF5+2      ; reference not aligned to instruction
        LD      A,(DE)
        AND     A
        JP      M,L200A+2       ; reference not aligned to instruction
        LD      A,(HL)
        AND     A
        JP      M,L1FF5+2       ; reference not aligned to instruction
        INC     DE
        INC     HL
        JP      L1FDC+1         ; reference not aligned to instruction

L1FF5:  LD      HL,(L59C5+1)    ; reference not aligned to instruction
        PUSH    HL
        LD      A,(HL)
        CALL    L1735
        POP     HL
        LD      A,(HL)
        AND     A
        JP      M,L2098
        INC     HL
        LD      (L59C5+1),HL    ; reference not aligned to instruction
        JP      L1FD4+2         ; reference not aligned to instruction

L200A:  CALL    L1F69+2         ; reference not aligned to instruction
        JP      NZ,L1FF5+2      ; reference not aligned to instruction
        LD      HL,(L59C5+1)    ; reference not aligned to instruction
        LD      (5B0Dh),HL
        RET

L2017:  CALL    L1FC7+2         ; reference not aligned to instruction
L201A:  LD      HL,5E02h
        EX      DE,HL
L201E:  LD      HL,(5B0Dh)
        CALL    L07B1
        CALL    NZ,L21A9
        LD      HL,5C0Eh
        CALL    L182B
        RET     C
        PUSH    DE
        LD      HL,(5B0Dh)
        CALL    L089B
        INC     DE
        LD      B,D
        LD      C,E
        POP     DE
        PUSH    DE
        EX      DE,HL
        ADD     HL,DE
        EX      DE,HL
        CALL    L0827
        LD      HL,(5B0Dh)
        EX      DE,HL
        LD      HL,5C0Eh
        POP     BC
        CALL    L0827
        EX      DE,HL
        ADD     HL,BC
        CALL    L21A9
        JP      L172E

L2053:  CALL    L1FC7+2         ; reference not aligned to instruction
        LD      HL,5C0Eh
        CALL    L089B
        EX      DE,HL
        LD      (L59BF+1),HL    ; reference not aligned to instruction
        CALL    L1F97
        JP      L201A+2         ; reference not aligned to instruction

L2066:  POP     HL
        RET

L2068:  LD      HL,(5B0Bh)
        CALL    L089B
        ADD     HL,DE
        LD      (HL),00h
        CALL    L172E
        LD      HL,(5B2Bh)
        DEC     HL
        LD      (5A9Ch),HL
        CALL    L58D3+1         ; reference not aligned to instruction
        LD      HL,(5A96h)
        LD      (5B3Eh),HL
        LD      (5A98h),HL
        LD      HL,5E02h
        CALL    L2AB6+1         ; reference not aligned to instruction
        CALL    L2A10
        CALL    L2AC3+2         ; reference not aligned to instruction
        JP      L20BD+2         ; reference not aligned to instruction

L2096:  LD      A,3Fh           ; '?'
L2098:  CALL    L1735
        LD      HL,(5B0Bh)
        CALL    L17F3
        CALL    L172E
        LD      HL,(5B0Bh)
        LD      (5B0Dh),HL
        RET

L20AB:  LD      HL,(L59BF+1)    ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5B2Fh)
        ADD     HL,DE
        JP      L20E6+2         ; reference not aligned to instruction

L20B6:  LD      HL,(5B2Bh)
        DEC     HL
        LD      (5A9Ch),HL
L20BD:  LD      HL,(5A9Ch)
        LD      (5B0Bh),HL
        LD      (5B0Dh),HL
        CALL    L334B+2         ; reference not aligned to instruction
        LD      HL,(5A96h)
        EX      DE,HL
        LD      HL,(5B2Bh)
        CALL    L07B1
        JP      C,L20F0+1       ; reference not aligned to instruction
        LD      HL,0001h
        LD      (L59BF+1),HL    ; reference not aligned to instruction
        LD      HL,(L59BF+1)    ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5B2Fh)
        CALL    L07A9
L20E6:  LD      (5B2Fh),HL
        CALL    L21D4
        LD      (5B2Bh),HL
        POP     HL
L20F0:  JP      L1E15

L20F3:  LD      HL,(5B0Dh)
        CALL    L17F3
        LD      HL,(5B0Bh)
        CALL    L089B
        ADD     HL,DE
        LD      (5B0Dh),HL
        JP      L201A+2         ; reference not aligned to instruction

L2106:  LD      HL,5C0Eh
        LD      (5A8Fh),HL
        XOR     A
        LD      (5A8Eh),A
        CALL    L2280+2         ; reference not aligned to instruction
        POP     HL
        JP      L1E09

L2117:  CALL    L172E
        CALL    L1F69+2         ; reference not aligned to instruction
        JP      Z,L20F0+1       ; reference not aligned to instruction
        LD      HL,(5B2Bh)
        CALL    L3096+1         ; reference not aligned to instruction
        LD      HL,(5B2Fh)
        INC     HL
        LD      (5B2Fh),HL
        CALL    L21D4
        LD      (5B2Bh),HL
        JP      L2117+2         ; reference not aligned to instruction

L2136:  LD      HL,(5B0Dh)
        LD      A,(HL)
        AND     7Fh             ; ''
        RET     Z
        INC     HL
        LD      (5B0Dh),HL
        CALL    L1735
        CALL    L1F69+2         ; reference not aligned to instruction
        JP      NZ,L2136+2      ; reference not aligned to instruction
        RET

L214B:  LD      HL,(5B0Dh)
        EX      DE,HL
        LD      HL,(5B0Bh)
        CALL    L07B1
        RET     Z
        DEC     DE
        EX      DE,HL
        LD      (5B0Dh),HL
        LD      A,7Fh           ; ''
        CALL    L1735
        CALL    L1F69+2         ; reference not aligned to instruction
        JP      NZ,L214B+2      ; reference not aligned to instruction
        RET

L2167:  LD      HL,(5B2Bh)
        DEC     HL
        LD      (5A9Ch),HL
        CALL    L58D3+1         ; reference not aligned to instruction
        CALL    L330E
        JP      L172E

L2177:  LD      HL,0001h
        JP      L20E6+2         ; reference not aligned to instruction

L217D:  LD      HL,(5B2Bh)
        DEC     HL
        LD      BC,0000h
        LD      A,(HL)
        INC     A
        JP      Z,L21A0
L2189:  LD      (5B3Ch),HL
        INC     BC
        LD      E,(HL)
        LD      D,00h
        ADD     HL,DE
        INC     HL
        LD      A,(HL)
        INC     A
        JP      NZ,L2189+2      ; reference not aligned to instruction
        LD      HL,(5B3Ch)
        INC     HL
        LD      (5B2Bh),HL
        LD      H,B
        LD      L,C
L21A0:  LD      (5B2Fh),HL
        POP     HL
        JP      L1E25

L21A7:  DEC     HL
        LD      A,(HL)
        ; --- START PROC L21A9 ---
L21A9:  AND     7Fh             ; ''
        LD      (HL),A
        RET

L21AD:  DEC     HL
        LD      A,(HL)
        ; --- START PROC L21AF ---
L21AF:  OR      80h
        LD      (HL),A
        RET

L21B3:  LD      HL,(5B05h)
        LD      (5B3Ch),HL
        INC     HL
        LD      BC,0001h
        EX      DE,HL
L21BE:  LD      HL,(5B07h)
        EX      DE,HL
        CALL    L07B1
        JP      NC,L21D1
        CALL    L320D+2         ; reference not aligned to instruction
        INC     BC
        JP      L21BE+1         ; reference not aligned to instruction

L21CF:  LD      H,B
        LD      L,C
L21D1:  RET

L21D2:  LD      B,H
        LD      C,L
        ; --- START PROC L21D4 ---
L21D4:  LD      HL,(5B05h)
L21D7:  LD      (5B3Ch),HL
        INC     HL
        LD      A,B
        OR      A
        RET     M
        OR      C
        RET     Z
        DEC     BC
        LD      A,B
L21E2:  OR      C
        RET     Z
        CALL    L320D+2         ; reference not aligned to instruction
        JP      NZ,L21E2
        DEC     HL
        JP      L07A9

L21EE:  LD      (HL),80h
        ; --- START PROC L21F0 ---
L21F0:  INC     HL
        LD      (HL),80h
        RET

L21F4:  EX      DE,HL
L21F5:  LD      HL,(5A86h)
        LD      B,H
        LD      C,L
        LD      HL,(5A88h)
        EX      DE,HL
        CALL    L0879
        RET     NZ
L2202:  LD      HL,(5A8Ah)
        ADD     HL,BC
        ADD     HL,BC
        ADD     HL,BC
        DEC     HL
        PUSH    HL
        DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)
        POP     HL
        LD      A,(HL)
        EX      DE,HL
        PUSH    DE
        LD      D,A
        XOR     A
        LD      A,D
        POP     DE
        RET

L2217:  CALL    L089B
        PUSH    HL
        PUSH    DE
        INC     DE
        INC     DE
        INC     DE
        LD      HL,(5A8Ah)
        PUSH    HL
        CALL    L07A9
        PUSH    HL
        CALL    L58D3+1         ; reference not aligned to instruction
        LD      HL,(5A8Ah)
        EX      DE,HL
        LD      HL,(5A88h)
        CALL    L07A9
        LD      B,H
        LD      C,L
        POP     DE
        POP     HL
        CALL    L0827
        EX      DE,HL
        LD      (5A8Ah),HL
        LD      (5A9Ah),HL
        LD      HL,(5A88h)
        POP     DE
        PUSH    DE
        CALL    L07A9
        PUSH    HL
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(5A8Ch)
        CALL    L07A9
        INC     HL
        LD      B,H
        LD      C,L
        POP     DE
        LD      HL,(5A88h)
        CALL    L0827
        EX      DE,HL
        LD      (5A88h),HL
        POP     DE
        LD      HL,(5A8Ch)
        CALL    L07A9
        INC     HL
        EX      DE,HL
        LD      B,H
        LD      C,L
        POP     HL
        CALL    L0827
        LD      HL,(5A86h)
        INC     HL
        LD      (5A86h),HL
        LD      B,H
        LD      C,L
        LD      HL,(5A88h)
        DEC     HL
        LD      (HL),00h
        RET

L2280:  LD      A,(5A8Eh)
        CP      02h
        SCF
        RET     Z
        LD      HL,(5A8Fh)
        LD      (5A91h),HL
        CP      01h
        JP      NZ,L229A+1      ; reference not aligned to instruction
        INC     A
        LD      (5A8Eh),A
        SCF
        RET

L2298:  INC     HL
        LD      A,(HL)
L229A:  CP      20h             ; ' '
        JP      Z,L229A
        LD      (5A91h),HL
        LD      C,00h
L22A4:  CALL    L230E+1         ; reference not aligned to instruction
        INC     HL
        INC     C
        JP      NC,L22A4+2      ; reference not aligned to instruction
        DEC     C
        JP      NZ,L22C6
        AND     A
        JP      Z,L22DC+1       ; reference not aligned to instruction
        CALL    L22E7
        JP      NZ,L22C7
        LD      A,(HL)
        CALL    L22E7
        JP      NZ,L22C7
        JP      L22C7+1         ; reference not aligned to instruction

L22C4:  DEC     HL
        DEC     HL
L22C6:  LD      A,(HL)
L22C7:  OR      80h
        LD      (HL),A
        INC     HL
        LD      A,(HL)
L22CC:  AND     7Fh             ; ''
        JP      Z,L22DC+2       ; reference not aligned to instruction
        CP      20h             ; ' '
        JP      Z,L22CC
        LD      (5A8Fh),HL
        OR      A
        RET

L22DB:  DEC     HL
L22DC:  LD      (5A8Fh),HL
        LD      A,01h
        LD      (5A8Eh),A
        RET

L22E5:  CP      3Eh             ; '>'
        ; --- START PROC L22E7 ---
L22E7:  RET     Z
        CP      3Ch             ; '<'
        RET     Z
        CP      3Dh             ; '='
        RET

L22EE:  PUSH    AF
        PUSH    HL
        ; --- START PROC L22F0 ---
L22F0:  CALL    L21F5+1         ; reference not aligned to instruction
        JP      NZ,L22FD+1      ; reference not aligned to instruction
        POP     HL
        POP     DE
        CP      D
        RET     Z
        SCF
        RET

L22FC:  POP     HL
L22FD:  CALL    L2217+2         ; reference not aligned to instruction
        POP     AF
        LD      (HL),A
        DEC     HL
        LD      (HL),00h
        DEC     HL
        LD      (HL),00h
        AND     A
        RET

L230A:  LD      HL,(5A91h)
        LD      A,(HL)
L230E:  AND     7Fh             ; ''
        CP      24h             ; '$'
        RET     Z
        CP      2Eh             ; '.'
        RET     Z
        CP      7Bh             ; '{'
        JP      NC,L2330
        CP      61h             ; 'a'
        RET     NC
        CP      5Bh             ; '['
        JP      P,L2330
        CP      41h             ; 'A'
        RET     P
        CP      3Ah             ; ':'
        JP      P,L2330
        CP      30h             ; '0'
        RET     P
        SCF
        RET

L2330:  LD      HL,(5A91h)
        LD      A,(HL)
        AND     7Fh             ; ''
        CP      2Eh             ; '.'
        JP      Z,L2342+2       ; reference not aligned to instruction
        CP      3Ah             ; ':'
        SCF
        RET     P
        CP      30h             ; '0'
        RET     C
L2342:  LD      DE,59F6h
        CALL    L12D4+1         ; reference not aligned to instruction
        RET     C
        DEC     HL
        LD      A,(HL)
        OR      80h
        LD      (HL),A
        INC     HL
        LD      (5A8Fh),HL
        LD      A,(HL)
        OR      A
        RET     NZ
        LD      A,01h
        LD      (5A8Eh),A
        RET

L235B:  LD      HL,(5A91h)
        LD      DE,4535h
        LD      BC,0015h
        CALL    L0879
        RET     NZ
        LD      A,C
        CP      13h
        JP      M,L2379
        SUB     0Fh
        CP      06h
        JP      NZ,L2379
        INC     A
        INC     A
        ADD     A,0Fh
L2379:  CP      18h
        JP      Z,L2380+2       ; reference not aligned to instruction
        CP      A
        RET

L2380:  LD      A,(5B03h)
        CP      0A8h
        JP      Z,L2393
        CP      0C7h
        JP      Z,L2393
        LD      A,18h
        CP      A
        RET

L2391:  LD      A,0Fh
L2393:  CP      A
        RET

L2395:  CALL    L230A+2         ; reference not aligned to instruction
        CALL    C,L321E
        LD      A,01h
        LD      HL,(5A91h)
        CALL    L22F0
        PUSH    BC
        LD      B,09h
        CALL    C,L2833+1       ; reference not aligned to instruction
        POP     BC
        LD      A,06h
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,C
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,B
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,07h
        CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        RET     C
        CALL    L235B+2         ; reference not aligned to instruction
        JP      Z,L23CA
        AND     A
        RET

L23C8:  CP      19h
L23CA:  CALL    Z,L321E
        CP      1Ah
        JP      NZ,L23C8
        LD      A,08h
        CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        CALL    C,L321E
        JP      L241B+2         ; reference not aligned to instruction

L23E0:  CALL    L2395+2         ; reference not aligned to instruction
        RET     C
        LD      HL,(5A91h)
        LD      A,(HL)
        AND     7Fh             ; ''
        CP      2Ch             ; ','
        RET     NZ
        CALL    L2280+2         ; reference not aligned to instruction
        JP      L23E0+2         ; reference not aligned to instruction

L23F3:  LD      A,(5A8Eh)
        CP      02h
        RET     Z
        XOR     A
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      HL,(5A91h)
        EX      DE,HL
        LD      A,(DE)
L2402:  AND     7Fh             ; ''
        JP      Z,L240E+2       ; reference not aligned to instruction
        CALL    L2B3E+2         ; reference not aligned to instruction
        INC     DE
        JP      L2402+1         ; reference not aligned to instruction

L240E:  CALL    L21AF
        LD      A,02h
        LD      (5A8Eh),A
        LD      A,01h
        JP      L2B3E+2         ; reference not aligned to instruction

L241B:  LD      DE,5EEAh
        LD      BC,0001h
        CALL    L265B
        PUSH    BC
        PUSH    DE
        PUSH    HL
L2427:  CALL    L235B+2         ; reference not aligned to instruction
        JP      Z,L2599
        CALL    L2B1A+2         ; reference not aligned to instruction
        JP      Z,L2599
        CALL    L2B2C+2         ; reference not aligned to instruction
        JP      Z,L245B
        CALL    L2B5E+2         ; reference not aligned to instruction
        JP      Z,L2639
        LD      HL,(5A91h)
        LD      A,(HL)
        CP      0A2h
        JP      Z,L2547
        CALL    L2330+2         ; reference not aligned to instruction
        JP      NC,L251D
        CALL    L230A+2         ; reference not aligned to instruction
        JP      NC,L24B1
        LD      B,11h
        CALL    L2833+1         ; reference not aligned to instruction
        CP      0Dh
L245B:  JP      NZ,L2475
        LD      A,(5B03h)
        CP      80h
        LD      A,0Dh
        JP      NZ,L2475
        POP     HL
        POP     DE
        POP     BC
        PUSH    BC
        PUSH    DE
        PUSH    HL
        INC     B
        DEC     B
        JP      Z,L2639
        POP     HL
        POP     DE
L2475:  POP     BC
        PUSH    AF
        INC     B
        DEC     B
L2479:  JP      Z,L248B+1       ; reference not aligned to instruction
        LD      A,(DE)
        CP      20h             ; ' '
        JP      Z,L248B+1       ; reference not aligned to instruction
        CALL    L2B3E+2         ; reference not aligned to instruction
        INC     DE
        DEC     B
        JP      L2479

L248A:  POP     AF
L248B:  CALL    L2B3E+2         ; reference not aligned to instruction
        LD      C,01h
L2490:  PUSH    BC
        PUSH    DE
        PUSH    HL
        CALL    L2280+2         ; reference not aligned to instruction
        JP      C,L2639
        JP      L2427+2         ; reference not aligned to instruction

L249C:  POP     HL
        POP     DE
L249E:  POP     BC
        LD      A,36h           ; '6'
        DEC     DE
        INC     B
        LD      (DE),A
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      HL,(5A91h)
        LD      A,04h
        JP      L24EE+2         ; reference not aligned to instruction

L24AF:  POP     HL
        POP     DE
L24B1:  POP     BC
        CALL    L253C+1         ; reference not aligned to instruction
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      HL,(5A98h)
        DEC     HL
        DEC     HL
        LD      A,(HL)
        CP      0A4h
        JP      Z,L249E
        LD      HL,(5A91h)
        CALL    L21F5+1         ; reference not aligned to instruction
        CP      04h
        JP      Z,L249E
        LD      HL,(5A8Fh)
        LD      A,(HL)
        OR      A
        JP      Z,L24E9+2       ; reference not aligned to instruction
        CP      0A8h
        JP      NZ,L24E9+2      ; reference not aligned to instruction
        LD      HL,(5A91h)
        DEC     HL
        LD      (HL),00h
        LD      (5A91h),HL
        LD      A,10h
        JP      L24EE+2         ; reference not aligned to instruction

L24E9:  LD      HL,(5A91h)
        LD      A,02h
L24EE:  CALL    L22F0
        PUSH    BC
        LD      B,17h
        CALL    C,L2833+1       ; reference not aligned to instruction
        POP     BC
        POP     HL
        LD      A,02h
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,C
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,B
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,03h
L2508:  CALL    L2B3E+2         ; reference not aligned to instruction
        POP     DE
        POP     BC
L250D:  LD      C,02h
L250F:  PUSH    BC
        PUSH    DE
        PUSH    HL
        CALL    L2280+2         ; reference not aligned to instruction
        JP      C,L2639
        JP      L2427+2         ; reference not aligned to instruction

L251B:  POP     HL
        POP     DE
L251D:  POP     BC
        CALL    L253C+1         ; reference not aligned to instruction
        PUSH    BC
        PUSH    DE
        LD      A,04h
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      C,06h
        LD      DE,59F6h
        LD      A,(DE)
L252E:  CALL    L2B3E+2         ; reference not aligned to instruction
        INC     DE
        DEC     C
        JP      NZ,L252E+1      ; reference not aligned to instruction
        LD      A,05h
        JP      L2508+2         ; reference not aligned to instruction

L253B:  LD      A,B
L253C:  LD      B,15h
        DEC     C
        DEC     C
        CALL    Z,L2833+1       ; reference not aligned to instruction
        LD      B,A
        RET

L2545:  POP     HL
        POP     DE
L2547:  POP     BC
        CALL    L253C+1         ; reference not aligned to instruction
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      HL,(5A91h)
        POP     DE
        EX      DE,HL
        XOR     A
L2554:  CALL    L2B3E+2         ; reference not aligned to instruction
        INC     DE
        LD      A,(DE)
        AND     7Fh             ; ''
        JP      Z,L2575
        CP      22h             ; '"'
        JP      NZ,L2554+2      ; reference not aligned to instruction
        INC     DE
        LD      A,(DE)
        AND     7Fh             ; ''
        JP      Z,L2575
        CP      22h             ; '"'
        JP      NZ,L2575
        CALL    L2B3E+2         ; reference not aligned to instruction
        INC     DE
        DEC     HL
        LD      A,(HL)
L2575:  AND     A
        JP      NZ,L257D
        INC     HL
        XOR     A
        OR      80h
L257D:  CALL    L2B43
        LD      A,01h
        CALL    L2B3E+2         ; reference not aligned to instruction
        EX      DE,HL
        LD      (5A8Fh),HL
        LD      A,(HL)
        AND     A
        JP      NZ,L2594+1      ; reference not aligned to instruction
        LD      A,01h
        LD      (5A8Eh),A
        EX      DE,HL
L2594:  JP      L250D

L2597:  POP     HL
        POP     DE
L2599:  POP     BC
        CP      20h             ; ' '
        JP      Z,L260A
        CP      21h             ; '!'
        JP      Z,L2622
        DEC     C
        JP      NZ,L25C4
        CP      12h
        JP      NZ,L25B2
        INC     C
        LD      A,1Eh
        CP      19h
L25B2:  JP      NZ,L25BA
        INC     C
        LD      A,1Dh
        CP      40h             ; '@'
L25BA:  JP      M,L25BF+1       ; reference not aligned to instruction
        INC     C
        DEC     C
L25BF:  JP      M,L25F9
        LD      C,A
        DEC     B
L25C4:  INC     B
L25C5:  JP      Z,L2603
        LD      A,(DE)
        CP      20h             ; ' '
        JP      Z,L2603
        CP      1Eh
        JP      NZ,L25D6
        DEC     A
        CP      19h
L25D6:  JP      NZ,L25E0
        INC     A
        INC     A
        JP      L25EB

L25DE:  CP      1Bh
L25E0:  JP      NZ,L25EB
        DEC     C
        CP      C
        INC     C
        JP      L25EB+2         ; reference not aligned to instruction

L25E9:  DEC     A
        CP      C
L25EB:  JP      C,L2603
        LD      A,(DE)
        CALL    L2B3E+2         ; reference not aligned to instruction
        DEC     B
        INC     DE
        JP      L25C5

L25F7:  CP      1Ah
L25F9:  JP      Z,L2490
        LD      B,14h
        CALL    L2833+1         ; reference not aligned to instruction
        LD      A,C
        DEC     DE
L2603:  INC     B
        LD      (DE),A
        JP      L2490

L2608:  DEC     C
        DEC     C
L260A:  JP      NZ,L261A
        LD      A,(DE)
        CP      36h             ; '6'
        JP      Z,L261A
        LD      A,34h           ; '4'
        DEC     DE
        INC     B
        LD      (DE),A
        LD      A,20h           ; ' '
L261A:  DEC     DE
        INC     B
        LD      (DE),A
        JP      L2490

L2620:  INC     B
        DEC     B
L2622:  PUSH    BC
        LD      B,12h
        CALL    Z,L2833+1       ; reference not aligned to instruction
        POP     BC
        LD      A,(DE)
        INC     DE
        DEC     B
        CP      20h             ; ' '
        JP      Z,L250F
        CALL    L2B3E+2         ; reference not aligned to instruction
        JP      L2622

L2637:  POP     HL
        POP     DE
L2639:  POP     BC
        INC     B
        DEC     B
L263C:  JP      Z,L2651+2       ; reference not aligned to instruction
        LD      A,(DE)
        INC     DE
        DEC     B
        CP      20h             ; ' '
        PUSH    BC
        LD      B,13h
        CALL    Z,L2833+1       ; reference not aligned to instruction
        POP     BC
        CALL    L2B3E+2         ; reference not aligned to instruction
        JP      L263C

L2651:  CALL    L265E+2         ; reference not aligned to instruction
        CP      09h
        JP      Z,L2B48
        LD      A,09h
        ; --- START PROC L265B ---
L265B:  JP      L2B3E+2         ; reference not aligned to instruction

L265E:  LD      HL,(5A98h)
        DEC     HL
        LD      A,(HL)
        RET

L2664:  LD      A,(DE)
        XOR     (HL)
        ; --- START PROC L2666 ---
L2666:  AND     01h
        LD      A,(HL)
        JP      NZ,L2670
        RRCA
        RET

L266E:  AND     01h
L2670:  SCF
        PUSH    AF
        JP      Z,L2678
        EX      DE,HL
        PUSH    DE
        PUSH    BC
L2678:  LD      DE,59FCh
        CALL    L11F9+1         ; reference not aligned to instruction
        POP     BC
        POP     DE
        LD      HL,59FCh
        POP     AF
        RET     Z
        EX      DE,HL
        RET

L2687:  LD      HL,5E02h
        CALL    L21F0
        INC     HL
        JP      L182B

L2691:  CALL    L0992
        LD      B,A
        LD      A,(5B38h)
        CP      B
        RET     Z
        LD      HL,26A5h
        CALL    L17F3
L26A0:  JP      L26A0+2         ; reference not aligned to instruction

L26A3:  LD      B,D
        LD      B,C
        LD      D,E
        LD      C,C
        LD      B,E
        JR      NZ,L26F3
        LD      D,E
        JR      NZ,L26F0
        LD      D,D
        LD      B,C
        LD      D,E
        LD      C,B
        LD      B,L
        LD      B,H
        ADC     A,L
        LD      HL,(5A6Bh)
        JP      (HL)

L26B8:  CALL    L3519
        LD      A,(HL)
L26BC:  LD      DE,0001h
        CP      08h
        RET     NC
        PUSH    HL
        AND     A
        JP      Z,L26EA
        DEC     A
        JP      Z,L26E1
        CP      03h
        JP      Z,L26DA+2       ; reference not aligned to instruction
        CP      04h
        JP      Z,L26DA+2       ; reference not aligned to instruction
        LD      DE,0004h
        POP     HL
        RET

L26DA:  LD      DE,0008h
        POP     HL
        RET

L26DF:  DEC     HL
        INC     DE
L26E1:  LD      A,(HL)
        AND     A
        JP      NZ,L26E1
        POP     HL
        RET

L26E8:  INC     HL
        INC     DE
L26EA:  LD      A,(HL)
        CP      01h
        JP      NZ,L26EA
L26F0:  POP     HL
        RET

L26F2:  PUSH    AF
L26F3:  LD      HL,(5B07h)
        CALL    L5209+1         ; reference not aligned to instruction
        LD      (5B07h),HL
        POP     AF
        RET

L26FE:  LD      HL,(5A86h)
        EX      DE,HL
        LD      HL,(5A8Ah)
        INC     HL
        INC     HL
L2707:  LD      A,05h
        AND     (HL)
        JP      Z,L2717
        DEC     HL
        LD      (HL),00h
        DEC     HL
        LD      (HL),00h
        INC     HL
        INC     HL
        INC     HL
        DEC     DE
L2717:  LD      A,D
        OR      E
        JP      NZ,L2707
        LD      HL,(5B05h)
        INC     HL
        LD      (5B07h),HL
        LD      A,(HL)
L2724:  CP      9Fh
        JP      Z,L2739
        CP      0A4h
        JP      Z,L2754
        EX      DE,HL
        INC     A
        RET     Z
L2731:  CALL    L26F3+1         ; reference not aligned to instruction
        JP      L2724+1         ; reference not aligned to instruction

L2737:  INC     HL
        INC     HL
L2739:  LD      C,(HL)
        INC     HL
        LD      B,(HL)
        CALL    L2202+2         ; reference not aligned to instruction
        LD      A,H
        OR      L
        JP      NZ,L27F1+2      ; reference not aligned to instruction
L2744:  LD      HL,5B07h
        LD      BC,0002h
        DEC     DE
        DEC     DE
        CALL    L0827
        JP      L2731+2         ; reference not aligned to instruction

L2752:  INC     HL
        INC     HL
L2754:  LD      A,(HL)
        CP      02h
        CALL    NZ,L2832
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        CALL    L2202+2         ; reference not aligned to instruction
        LD      A,H
        OR      L
        JP      NZ,L27FF+2      ; reference not aligned to instruction
        JP      L2744+2         ; reference not aligned to instruction

L2769:  CALL    L26FE+2         ; reference not aligned to instruction
        LD      BC,0001h
        LD      HL,(5A8Ah)
        LD      (5A9Ah),HL
        LD      HL,(5A96h)
        INC     HL
        PUSH    HL
L277A:  CALL    L2202+2         ; reference not aligned to instruction
        CP      02h
        JP      Z,L279A
        CP      10h
        JP      Z,L27DC
        LD      D,B
        LD      E,C
L2789:  LD      HL,(5A86h)
        INC     BC
        CALL    L07B1
        JP      NZ,L277A+2      ; reference not aligned to instruction
        POP     HL
        LD      (5B09h),HL
        RET

L2798:  PUSH    DE
        PUSH    BC
L279A:  LD      HL,(5A88h)
L279D:  CALL    L089B
        ADD     HL,DE
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L279D+2      ; reference not aligned to instruction
        DEC     HL
        LD      A,(HL)
        CP      0A4h
        POP     BC
        POP     DE
        JP      NZ,L27DC
        POP     HL
        PUSH    BC
        PUSH    DE
        PUSH    HL
        EX      DE,HL
        DEC     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        EX      DE,HL
        LD      A,81h
        INC     HL
        INC     HL
        INC     HL
L27BF:  EX      DE,HL
        LD      HL,0001h
        CALL    L37DD
        LD      (HL),80h
        EX      DE,HL
        POP     HL
        LD      (HL),08h
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        INC     HL
        POP     DE
        POP     BC
        PUSH    HL
        JP      L2789

L27DA:  POP     HL
        EX      DE,HL
L27DC:  DEC     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        EX      DE,HL
        LD      (HL),02h
        INC     HL
        LD      A,05h
        LD      (HL),00h
L27E8:  INC     HL
        DEC     A
        JP      NZ,L27E8
        PUSH    HL
        JP      L2789

L27F1:  CALL    L280E+1         ; reference not aligned to instruction
        LD      B,20h           ; ' '
        LD      HL,42CEh
        CALL    L17F3
        JP      L2731+2         ; reference not aligned to instruction

L27FF:  CALL    L280E+1         ; reference not aligned to instruction
        LD      B,21h           ; '!'
        LD      HL,42DBh
        CALL    L17F3
        JP      L2731+2         ; reference not aligned to instruction

L280D:  PUSH    BC
L280E:  CALL    L172E
        POP     BC
        LD      HL,59F0h
        LD      (HL),02h
        INC     HL
        LD      (HL),C
        INC     HL
        LD      (HL),B
        LD      HL,59F0h
        JP      L2F52+1         ; reference not aligned to instruction

L2821:  LD      B,21h           ; '!'
        ; --- START PROC L2823 ---
L2823:  JP      L2833+1         ; reference not aligned to instruction

L2826:  LD      B,16h
        ; --- START PROC L2828 ---
L2828:  JP      L2833+1         ; reference not aligned to instruction

L282B:  LD      B,38h           ; '8'
        JP      L2833+1         ; reference not aligned to instruction

L2830:  LD      B,10h
        ; --- START PROC L2832 ---
L2832:  POP     HL
L2833:  LD      (5B40h),HL
        LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
        LD      HL,0000h
        LD      (5B2Dh),HL
        LD      A,B
        CALL    L128D
        LD      (5A7Eh),A
        LD      HL,(5A7Fh)
        LD      A,H
        OR      L
        JP      NZ,L2889+2      ; reference not aligned to instruction
        LD      A,(5A7Eh)
        LD      HL,28E5h
        DEC     A
        AND     A
L285B:  JP      Z,L2866+1       ; reference not aligned to instruction
        CALL    L089B
        ADD     HL,DE
        JP      L285B

L2865:  PUSH    HL
L2866:  CALL    L172E
        CALL    L16F7
        JP      Z,L0717
        POP     HL
        CALL    L17F3
        LD      HL,28DBh
        CALL    L17F3
        CALL    L344F+2         ; reference not aligned to instruction
        LD      HL,0717h
        PUSH    HL
        LD      A,(5A7Ah)
        AND     02h
        RET     Z
        JP      L1E15

L2889:  LD      BC,0717h
        PUSH    BC
        JP      L3C41+2         ; reference not aligned to instruction

L2890:  LD      B,H
        LD      C,L
L2892:  CALL    L2666
        PUSH    AF
        CALL    C,L0AAA
        POP     AF
        CALL    NC,L0FB6
L289D:  LD      A,(L593C)
        AND     07h
        RET     Z
        LD      B,01h
        RRCA
L28A6:  CALL    C,L2833+1       ; reference not aligned to instruction
        INC     B
        JP      L28A6+1         ; reference not aligned to instruction

L28AD:  CALL    L2666
        PUSH    AF
        CALL    C,L0A92
        POP     AF
        CALL    NC,L0FAD
        JP      L289D+2         ; reference not aligned to instruction

L28BB:  LD      B,H
        LD      C,L
L28BD:  CALL    L2666
        PUSH    AF
        CALL    C,L0DB8
        POP     AF
        CALL    NC,L104E
        JP      L289D+2         ; reference not aligned to instruction

L28CB:  CALL    L2666
        PUSH    AF
        CALL    C,L0EDE+1       ; reference not aligned to instruction
        POP     AF
        CALL    NC,L10B5
L28D6:  JP      L289D+2         ; reference not aligned to instruction

L28D9:  JR      NZ,L2920
        LD      D,D
        LD      D,D
        LD      C,A
        LD      D,D
        JR      NZ,L2929+1      ; reference not aligned to instruction
        LD      C,(HL)
        AND     B
        LD      C,A
        LD      D,(HL)
L28E5:  LD      D,D
        LD      B,(HL)
        LD      C,H
        RST     0x10
        LD      D,L
        LD      C,(HL)
        LD      B,H
        LD      D,D
        LD      B,(HL)
        LD      C,H
        RST     0x10
        CPL
        OR      B
        LD      B,L
        LD      E,B
        JR      NZ,L2932+2      ; reference not aligned to instruction
        CP      (HL)
        LD      B,D
        LD      C,C
        LD      C,(HL)
        JR      NZ,L293F
        LD      C,A
        LD      C,(HL)
        JR      NZ,L293E
        CP      (HL)
        DEC     L
        LD      C,H
        LD      C,A
        RST     0x00
        LD      C,H
        LD      C,C
        LD      C,(HL)
        JR      NZ,L294E
        LD      B,L
        OUT     (43h),A         ; 'C'
        LD      C,A
        LD      C,L
        CALL    L5256
        LD      B,D
        LD      C,H
        JR      NZ,L2956+1      ; reference not aligned to instruction
        LD      D,E
        JR      NZ,L296B+1      ; reference not aligned to instruction
        LD      D,H
        LD      B,C
        LD      D,H
        PUSH    BC
        LD      D,E
        LD      E,C
        LD      C,(HL)
L2920:  LD      D,H
        LD      B,C
        RET     C
        LD      D,(HL)
        LD      D,D
        LD      B,D
        LD      C,H
        JR      NZ,L2976+1      ; reference not aligned to instruction
L2929:  CALL    L3E3D+1         ; reference not aligned to instruction
        JR      NZ,L28D6+1      ; reference not aligned to instruction
        LD      A,3Eh           ; '>'
        JR      NZ,L28D9+1      ; reference not aligned to instruction
L2932:  LD      (L4F20),A
        LD      D,B
        LD      B,L
        LD      D,D
        OUT     (32h),A         ; '2'
        JR      NZ,L298B
        LD      D,B
        LD      B,C
L293E:  LD      C,(HL)
L293F:  LD      B,H
        OUT     (49h),A         ; 'I'
        LD      C,H
        LD      B,A
        LD      C,H
        JR      NZ,L298D
        LD      D,L
        LD      C,(HL)
        JP      L5452+1         ; reference not aligned to instruction

L294C:  LD      B,C
        LD      D,H
L294E:  LD      B,L
        JR      NZ,L2992
        LD      D,E
        JR      NZ,L29AA
        LD      D,D
        LD      B,D
L2956:  CALL    Z,L4C48+1       ; reference not aligned to instruction
        LD      B,A
        LD      C,H
        JR      NZ,L29A6
        LD      C,(HL)
        JR      NZ,L29A4
        LD      C,C
        JP      NC,L4F4D+1      ; reference not aligned to instruction
L2964:  JR      NZ,L29BA
        RST     0x08
        LD      B,D
        LD      D,L
        LD      B,(HL)
        LD      D,D
L296B:  JR      NZ,L29B2+1      ; reference not aligned to instruction
        LD      D,L
        LD      C,H
        CALL    Z,L4F4D+1       ; reference not aligned to instruction
        JR      NZ,L29B9
        LD      E,B
        LD      D,B
L2976:  JP      NC,L4141+2      ; reference not aligned to instruction
        LD      C,(HL)
        DAA
        LD      D,H
        JR      NZ,L29C1
        LD      C,A
        LD      C,(HL)
        CALL    NC,L4552
        LD      B,C
        CALL    NZ,L5452+1      ; reference not aligned to instruction
        LD      D,D
        LD      C,C
        LD      C,(HL)
        RST     0x00
L298B:  LD      B,E
        LD      C,A
L298D:  LD      C,L
        LD      C,L
        POP     BC
        LD      C,A
        LD      D,B
L2992:  LD      D,D
        LD      C,(HL)
        CALL    NZ,L2A3B+1      ; reference not aligned to instruction
        LD      C,L
        LD      B,L
        LD      C,L
        LD      HL,(L55BE)
        LD      C,(HL)
        LD      B,H
        LD      C,C
        CALL    L5551+2         ; reference not aligned to instruction
        LD      B,D
L29A4:  LD      D,E
        LD      B,E
L29A6:  LD      D,B
        LD      D,H
        JR      NZ,L29E8
L29AA:  CP      (HL)
        LD      D,E
        LD      D,L
        LD      B,D
        LD      D,E
        LD      B,E
        LD      D,B
        LD      D,H
L29B2:  JR      NZ,L2A03
        LD      D,(HL)
        LD      B,(HL)
        LD      C,H
        RST     0x10
        LD      B,C
L29B9:  LD      D,E
L29BA:  LD      D,E
        LD      C,C
        LD      B,A
        ADC     A,53h           ; 'S'
        LD      D,H
        LD      D,D
L29C1:  JR      NZ,L2A04
        LD      D,E
        JR      NZ,L2A14
        LD      D,L
        CALL    L554E
        LD      C,L
        JR      NZ,L2A0D+1      ; reference not aligned to instruction
        LD      D,E
        JR      NZ,L2A22+1      ; reference not aligned to instruction
        LD      D,H
        JP      NC,L4E41+2      ; reference not aligned to instruction
        LD      D,H
        LD      D,D
        LD      C,H
        JR      NZ,L2A2B+1      ; reference not aligned to instruction
        LD      D,H
        LD      B,E
        BIT     1,A
        LD      C,(HL)
        JR      NZ,L2A25+2      ; reference not aligned to instruction
        LD      C,A
        LD      D,H
        RST     0x08
        INC     A
        INC     A
        JR      NZ,L2A2B
        LD      B,C
L29E8:  LD      D,H
        POP     BC
        LD      D,D
        LD      B,E
        LD      D,(HL)
        JR      NZ,L2A33
        LD      B,C
        LD      D,H
        POP     BC
        LD      C,C
        LD      C,H
        LD      B,A
        LD      C,H
        JR      NZ,L2A3B
        LD      C,A
        LD      B,H
        PUSH    BC
        DEC     L
        JR      NZ,L2A4F+2      ; reference not aligned to instruction
        LD      D,C
        JP      NC,L4F4A+2      ; reference not aligned to instruction
        LD      B,A
L2A03:  LD      C,C
L2A04:  LD      B,E
        LD      B,C
        CALL    Z,L4F4D+1       ; reference not aligned to instruction
        JR      NZ,L2A58+1      ; reference not aligned to instruction
        LD      B,L
        LD      E,B
L2A0D:  CALL    NC,982Ah
        ; --- START PROC L2A10 ---
L2A10:  LD      E,D
        LD      (5B3Ch),HL
L2A14:  LD      A,0FFh
        CALL    L2B3E+2         ; reference not aligned to instruction
L2A19:  CALL    L2A79+2         ; reference not aligned to instruction
        JP      C,L2A63
        JP      Z,L2A19+2       ; reference not aligned to instruction
L2A22:  CALL    L2C0E+2         ; reference not aligned to instruction
L2A25:  JP      Z,L2A19+2       ; reference not aligned to instruction
        CALL    L230A+2         ; reference not aligned to instruction
L2A2B:  CALL    C,L321E
        LD      A,9Fh
        CALL    L2B3E+2         ; reference not aligned to instruction
L2A33:  LD      A,06h
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      HL,(5A91h)
L2A3B:  LD      A,01h
        CALL    L22F0
        CALL    C,L321E
        LD      A,C
        LD      L,C
        LD      H,B
        LD      (5B31h),HL
        LD      HL,0000h
        LD      (5B2Fh),HL
L2A4F:  CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,B
        CALL    L2B3E+2         ; reference not aligned to instruction
        LD      A,07h
L2A58:  CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        JP      NC,L2A19+2      ; reference not aligned to instruction
        LD      A,0FEh
L2A63:  CALL    L2B3E+2         ; reference not aligned to instruction
        LD      HL,(5B3Ch)
        EX      DE,HL
        LD      HL,(5A98h)
        CALL    L07A9
        LD      A,H
        OR      A
        CALL    NZ,L187E
        DEC     L
        EX      DE,HL
        LD      (HL),E
        RET

L2A79:  LD      A,(5A8Eh)
        CP      02h
        JP      Z,L2A99
        LD      HL,(5A91h)
        LD      A,(HL)
        AND     7Fh             ; ''
        JP      Z,L2A99
        CP      09h
        JP      Z,L2AA2
        CP      3Ah             ; ':'
        JP      Z,L2A9D
        OR      01h
        RET

L2A97:  OR      01h
L2A99:  SCF
        RET

L2A9B:  LD      A,9Eh
L2A9D:  JP      L2AA2+2         ; reference not aligned to instruction

L2AA0:  LD      A,9Ch
L2AA2:  CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        RLA
        CP      A
        RRA
        RET

L2AAC:  LD      HL,5B46h
L2AAF:  LD      (5A98h),HL
        LD      HL,5E04h
        XOR     A
L2AB6:  LD      (5A8Eh),A
        LD      (5A8Fh),HL
        CALL    L2280+2         ; reference not aligned to instruction
        LD      HL,(5A91h)
        RET

L2AC3:  LD      HL,(5B3Eh)
        EX      DE,HL
        LD      HL,(5A98h)
        CALL    L07A9
        LD      B,H
        LD      C,L
        PUSH    HL
        LD      HL,(5A96h)
        EX      DE,HL
        LD      HL,(5A9Ch)
        CALL    L07B1
        POP     HL
        JP      Z,L2B02+2       ; reference not aligned to instruction
        PUSH    HL
        CALL    L51E2+1         ; reference not aligned to instruction
        LD      HL,(5A9Ch)
        EX      DE,HL
        LD      HL,(5A98h)
        CALL    L07A9
        LD      B,H
        LD      C,L
        LD      HL,(5A9Ch)
        EX      DE,HL
        POP     HL
        PUSH    HL
        ADD     HL,DE
        EX      DE,HL
        CALL    L0827
        EX      DE,HL
        LD      HL,(5B3Eh)
        POP     BC
        ADD     HL,BC
        CALL    L0827
L2B02:  LD      HL,(5A96h)
        ADD     HL,BC
        LD      (5A96h),HL
        LD      (HL),0FFh
        INC     HL
        LD      (5B09h),HL
        LD      (5EECh),HL
        LD      HL,(5A9Ch)
        ADD     HL,BC
        LD      (5A9Ch),HL
        RET

L2B1A:  LD      HL,(5A91h)
        LD      DE,42E4h
        LD      BC,0031h
        CALL    L0879
        RET     NZ
        LD      A,3Fh           ; '?'
        ADD     A,C
        CP      A
        RET

L2B2C:  LD      HL,(5A91h)
        LD      A,(HL)
        CP      0BBh
        JP      Z,L2B3D
        CP      0ACh
        RET     NZ
        LD      A,0Dh
        RET

L2B3B:  LD      A,0Eh
L2B3D:  RET

L2B3E:  LD      HL,(5A98h)
        LD      (HL),A
        INC     L
        ; --- START PROC L2B43 ---
L2B43:  JP      Z,L2B4E+1       ; reference not aligned to instruction
        LD      (HL),0FFh
        ; --- START PROC L2B48 ---
L2B48:  LD      (5A98h),HL
        CP      A
        RET

L2B4D:  INC     H
L2B4E:  CALL    L2B48
        PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    L51DE+2         ; reference not aligned to instruction
        POP     AF
        POP     BC
        POP     DE
        POP     HL
        CP      A
        RET

L2B5E:  LD      HL,(5A91h)
        LD      DE,43A7h
        LD      BC,000Ah
        CALL    L0879
        LD      A,C
        RET

L2B6C:  ADD     A,9Fh
L2B6E:  LD      C,A
        LD      A,(5A7Ah)
        CP      01h
        JP      NZ,L2B8A+1      ; reference not aligned to instruction
        LD      HL,452Eh
        LD      A,(HL)
        INC     HL
L2B7C:  AND     A
        JP      Z,L2B8A+1       ; reference not aligned to instruction
        CP      C
        JP      NZ,L2B7C
        LD      B,18h
        CALL    L2833+1         ; reference not aligned to instruction
        LD      A,C
L2B8A:  CP      0C8h
        JP      NZ,L2BA0+2      ; reference not aligned to instruction
        LD      A,(5B03h)
        CP      0ADh
        CALL    NZ,L2832
        LD      HL,(5A98h)
        DEC     HL
        LD      (5A98h),HL
        LD      A,0C9h
L2BA0:  LD      (5B03h),A
        CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        JP      C,L2BBF+2       ; reference not aligned to instruction
        LD      HL,(5A91h)
        LD      DE,4417h
        LD      BC,002Fh
        CALL    L0879
        LD      A,C
        JP      Z,L2B6E
L2BBC:  CALL    L241B+2         ; reference not aligned to instruction
L2BBF:  LD      A,(5A8Eh)
        CP      02h
        RET     Z
        CALL    L2A79+2         ; reference not aligned to instruction
        RET     Z
        JP      C,L2C00
        CALL    L2B5E+2         ; reference not aligned to instruction
        JP      NZ,L2C00
        CP      06h
        JP      Z,L2BF0
        CP      07h
        JP      Z,L2BF5
        CP      09h
        CALL    NZ,L2832
        LD      A,9Bh
L2BE3:  CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        CALL    C,L2832
        CP      A
        RET

L2BEE:  LD      A,35h           ; '5'
L2BF0:  JP      L2BF5+2         ; reference not aligned to instruction

L2BF3:  LD      A,9Dh
L2BF5:  CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        JP      L23F3+2         ; reference not aligned to instruction

L2BFE:  CP      A
        RET

L2C00:  LD      A,(5A8Eh)
        CP      02h
        JP      Z,L2BBF+2       ; reference not aligned to instruction
        CALL    L2395+2         ; reference not aligned to instruction
        JP      L2BBF+2         ; reference not aligned to instruction

L2C0E:  LD      HL,(5A91h)
        LD      A,(HL)
        CP      0BFh
        LD      A,0Eh
        JP      Z,L2B6E
        LD      DE,4417h
        LD      BC,002Fh
        CALL    L0879
        LD      A,C
        JP      Z,L2B6E
        LD      HL,(5A91h)
        LD      DE,43D8h
        LD      BC,000Eh
        CALL    L0879
        LD      A,C
        JP      NZ,L2C4F+2      ; reference not aligned to instruction
        PUSH    AF
        ADD     A,7Fh           ; ''
        LD      (5B03h),A
        CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        POP     AF
        LD      E,A
        LD      D,00h
        LD      HL,43C2h
        CALL    L08F9
        LD      L,C
        LD      H,B
        JP      (HL)

L2C4F:  CALL    L2B5E+2         ; reference not aligned to instruction
        CP      06h
        JP      Z,L2BF0
        CP      07h
        JP      Z,L2BF5
        CP      09h
        JP      Z,L2BE3
        LD      HL,(5A91h)
        CALL    L230E+1         ; reference not aligned to instruction
        JP      C,L2CA3
        INC     HL
        LD      A,(HL)
L2C6C:  AND     7Fh             ; ''
        JP      Z,L2CA3
        CP      3Dh             ; '='
        JP      Z,L2C98
        CP      20h             ; ' '
        JP      Z,L2C82
        CP      09h
        JP      NZ,L2C6C
        INC     HL
        LD      A,(HL)
L2C82:  AND     7Fh             ; ''
        JP      Z,L2CA3
        CP      20h             ; ' '
        JP      Z,L2C82
        CP      09h
        JP      Z,L2C82
        CP      3Dh             ; '='
        JP      NZ,L2CA3
        LD      A,0A8h
L2C98:  LD      (5B03h),A
        CALL    L2B3E+2         ; reference not aligned to instruction
        JP      L2BBC+2         ; reference not aligned to instruction

L2CA1:  OR      01h
L2CA3:  RET

L2CA4:  LD      A,0A8h
        LD      (5B03h),A
        CALL    L241B+2         ; reference not aligned to instruction
        CALL    L2B5E+2         ; reference not aligned to instruction
        CP      03h
        LD      B,19h
        CALL    NZ,L2833+1      ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        CALL    L241B+2         ; reference not aligned to instruction
        CALL    L2B5E+2         ; reference not aligned to instruction
        CP      04h
        JP      NZ,L2BBF+2      ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        JP      L2BBC+2         ; reference not aligned to instruction

L2CCA:  CALL    L241B+2         ; reference not aligned to instruction
        CALL    L2B5E+2         ; reference not aligned to instruction
        CP      02h
        JP      Z,L2CF3
        CP      05h
        CALL    NZ,L2832
        LD      A,8Ch
        CALL    L2B3E+2         ; reference not aligned to instruction
        DEC     HL
        PUSH    HL
        CALL    L2280+2         ; reference not aligned to instruction
        CALL    C,L2832
        CALL    L2C0E+2         ; reference not aligned to instruction
        POP     HL
        RET     Z
        LD      (HL),8Bh
        JP      L2CF9+2         ; reference not aligned to instruction

L2CF1:  LD      A,83h
L2CF3:  CALL    L2B3E+2         ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
L2CF9:  CALL    L2395+2         ; reference not aligned to instruction
        JP      L2BBF+2         ; reference not aligned to instruction

L2CFF:  JP      L23F3+2         ; reference not aligned to instruction

L2D02:  JP      L2BBF+2         ; reference not aligned to instruction

L2D05:  LD      HL,(5A98h)
        PUSH    HL
        LD      HL,(5A91h)
        LD      DE,4412h
        CALL    L37A3
        JP      Z,L2D36
        CALL    L241B+2         ; reference not aligned to instruction
        CALL    L2B5E+2         ; reference not aligned to instruction
        CP      02h
        JP      Z,L2D2B+1       ; reference not aligned to instruction
        CP      08h
        CALL    NZ,L2832
        POP     HL
        DEC     HL
        LD      (HL),88h
        PUSH    HL
        POP     HL
L2D2B:  CALL    L2280+2         ; reference not aligned to instruction
        CALL    L23E0+2         ; reference not aligned to instruction
        JP      L2BBF+2         ; reference not aligned to instruction

L2D34:  POP     HL
        DEC     HL
L2D36:  LD      (HL),8Dh
        CALL    L2280+2         ; reference not aligned to instruction
        JP      L2C0E+2         ; reference not aligned to instruction

L2D3E:  NOP
        CALL    L2395+2         ; reference not aligned to instruction
        JP      C,L2BBF+2       ; reference not aligned to instruction
        CALL    L2B2C+2         ; reference not aligned to instruction
        CP      0Dh
        JP      NZ,L2BBF+2      ; reference not aligned to instruction
        CALL    L2280+2         ; reference not aligned to instruction
        JP      L2BBC+2         ; reference not aligned to instruction

L2D53:  LD      HL,(5A86h)
        DEC     HL
        LD      A,H
        OR      L
        RET     Z
        LD      HL,586Ch
        CALL    L17F3
        LD      A,(5A93h)
        AND     A
        JP      NZ,L2D6A+2      ; reference not aligned to instruction
        CALL    L2769+2         ; reference not aligned to instruction
L2D6A:  LD      HL,(5A86h)
        LD      B,H
        LD      C,L
        LD      HL,(5A8Ah)
        PUSH    HL
        LD      HL,(5A88h)
L2D76:  CALL    L089B
        ADD     HL,DE
        LD      A,(HL)
        AND     A
        JP      NZ,L2D82
        INC     HL
        EX      (SP),HL
        INC     HL
L2D82:  INC     HL
        INC     HL
        EX      (SP),HL
        DEC     BC
        LD      A,B
        OR      C
        JP      Z,L2E0D
        PUSH    HL
        PUSH    DE
        PUSH    BC
        CALL    L16F7
        POP     BC
        POP     DE
        POP     HL
        JP      Z,L2E0D
        PUSH    BC
        PUSH    HL
        CALL    L17F3
L2D9C:  LD      A,(5B33h)
        CP      20h             ; ' '
        JP      Z,L2DAE
        LD      A,20h           ; ' '
        CALL    L1735
        JP      L2D9C+2         ; reference not aligned to instruction

L2DAC:  POP     HL
        POP     BC
L2DAE:  EX      (SP),HL
        INC     HL
        INC     HL
        PUSH    HL
        PUSH    BC
        LD      A,(HL)
        AND     04h
        JP      NZ,L2DCB+2      ; reference not aligned to instruction
        LD      A,(HL)
        AND     01h
        JP      NZ,L2DD1+2      ; reference not aligned to instruction
        LD      A,(HL)
        AND     02h
        JP      NZ,L2DD7+2      ; reference not aligned to instruction
        LD      HL,589Eh
        JP      L2DDA+2         ; reference not aligned to instruction

L2DCB:  LD      HL,58B9h
        JP      L2DDA+2         ; reference not aligned to instruction

L2DD1:  LD      HL,58A7h
        JP      L2DDA+2         ; reference not aligned to instruction

L2DD7:  LD      HL,58B0h
L2DDA:  CALL    L17F3
        POP     BC
        POP     HL
        DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)
        PUSH    HL
        EX      DE,HL
        PUSH    BC
        LD      DE,59C0h
        CALL    L167A
        LD      HL,(5B09h)
        EX      DE,HL
        LD      HL,59C0h
        CALL    L1459
        EX      DE,HL
        DEC     HL
        LD      A,(HL)
        OR      80h
        LD      (HL),A
        LD      HL,(5B09h)
        CALL    L17F3
        CALL    L172E
        POP     BC
        POP     HL
        EX      (SP),HL
        JP      L2D76+2         ; reference not aligned to instruction

L2E0B:  POP     HL
        RET

L2E0D:  PUSH    HL
L2E0E:  LD      HL,5E02h
        EX      DE,HL
        LD      HL,5C0Eh
        LD      B,00h
        DEC     DE
        LD      A,09h
        LD      (DE),A
        EX      (SP),HL
        DEC     HL
L2E1D:  PUSH    DE
L2E1E:  CALL    L26BC+1         ; reference not aligned to instruction
        CALL    L07A9
        INC     HL
        POP     DE
        LD      A,(HL)
        CP      09h
        JP      Z,L2F3E
        CP      06h
        JP      C,L2EF8
        CP      0Eh
        JP      Z,L2E7E
        CP      0Dh
        JP      Z,L2E7E
        EX      (SP),HL
        LD      C,A
        CP      40h             ; '@'
        JP      P,L2E8F
        CP      34h             ; '4'
        JP      P,L2ECE+1       ; reference not aligned to instruction
        CP      20h             ; ' '
        JP      P,L2E63
        CP      0Fh
        JP      M,L2E63
        LD      A,(DE)
        CP      20h             ; ' '
        JP      NC,L2E5E
        DEC     A
        CP      C
        JP      P,L2E70
        INC     B
        DEC     B
L2E5E:  JP      Z,L2E78
        DEC     HL
        LD      A,(HL)
L2E63:  CP      20h             ; ' '
        INC     HL
        JP      Z,L2E78
        CP      0Fh
        JP      Z,L2E78
        LD      (HL),20h        ; ' '
L2E70:  INC     HL
        INC     B
        DEC     DE
        LD      A,21h           ; '!'
        LD      (DE),A
        LD      (HL),C
        INC     HL
L2E78:  INC     B
        JP      L2E1D

L2E7C:  DEC     DE
        LD      (DE),A
L2E7E:  EX      (SP),HL
        DEC     HL
        LD      A,(HL)
        INC     HL
        CP      3Bh             ; ';'
        JP      NZ,L2E8A+1      ; reference not aligned to instruction
        DEC     HL
        DEC     B
        EX      (SP),HL
L2E8A:  JP      L2E1E

L2E8D:  LD      (HL),A
        INC     HL
L2E8F:  LD      (HL),20h        ; ' '
        INC     HL
        INC     B
        INC     B
        CP      49h             ; 'I'
        JP      Z,L2ED7
        CP      66h             ; 'f'
        JP      Z,L2ED7
        CP      5Eh             ; '^'
        JP      Z,L2ED7
        CP      50h             ; 'P'
        JP      Z,L2ED7
        CP      6Ah             ; 'j'
        JP      Z,L2ED7
        CP      4Ch             ; 'L'
        JP      Z,L2ED3
        CP      5Ch             ; '\'
        JP      Z,L2ED3
        DEC     DE
L2EB8:  LD      A,21h           ; '!'
        LD      (DE),A
        JP      L2E1D

L2EBE:  EX      (SP),HL
        DEC     HL
L2EC0:  LD      A,(HL)
        INC     HL
        EX      (SP),HL
        CP      0Dh
        JP      Z,L2E1D
        DEC     HL
        DEC     B
        JP      L2F0A

L2ECD:  LD      (HL),A
L2ECE:  JP      L2ED9

L2ED1:  LD      (HL),3Bh        ; ';'
L2ED3:  INC     HL
        INC     B
        LD      (HL),3Bh        ; ';'
L2ED7:  INC     HL
        INC     B
L2ED9:  JP      L2EB8+1         ; reference not aligned to instruction

L2EDC:  EX      (SP),HL
        DEC     HL
L2EDE:  LD      A,(HL)
        INC     HL
        EX      (SP),HL
        INC     HL
        INC     B
        CP      0Dh
        JP      Z,L2E1D
        CP      0Eh
        JP      Z,L2E1D
        DEC     HL
        DEC     B
        DEC     DE
        LD      A,20h           ; ' '
        LD      (DE),A
        JP      L2E1D

L2EF6:  PUSH    BC
        PUSH    DE
L2EF8:  CALL    L26BC+1         ; reference not aligned to instruction
        EX      (SP),HL
        CALL    L07A9
        EX      DE,HL
        LD      C,L
        LD      B,H
        POP     HL
        CALL    L0827
        POP     BC
        EX      (SP),HL
        INC     B
        DEC     B
L2F0A:  JP      Z,L2E1D
        DEC     HL
        DEC     B
        LD      A,(HL)
        INC     HL
        INC     B
        CP      3Bh             ; ';'
        JP      Z,L2EC0
        DEC     HL
        DEC     B
        CP      34h             ; '4'
        JP      Z,L2EDE
        CP      36h             ; '6'
        JP      Z,L2EDE
        DEC     DE
        LD      (DE),A
        CP      40h             ; '@'
        JP      P,L2F0A
        CP      20h             ; ' '
        JP      Z,L2F0A
        CP      1Dh
        JP      Z,L2F0A
        CP      1Eh
        JP      Z,L2F0A
        JP      L2E1D

L2F3C:  POP     HL
        EX      DE,HL
L2F3E:  PUSH    HL
L2F3F:  CALL    L2F52+1         ; reference not aligned to instruction
        POP     HL
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
        CP      09h
        JP      NZ,L2F3F+1      ; reference not aligned to instruction
        RET

L2F4E:  XOR     H
        CP      E
        CP      L
        LD      A,(HL)
L2F52:  CP      0A8h
        RET     Z
        CP      34h             ; '4'
        RET     Z
        CP      36h             ; '6'
        RET     Z
        CP      0A0h
        JP      C,L2F6A
        LD      HL,4417h
        SUB     0A0h
        JP      L2F78+2         ; reference not aligned to instruction

L2F68:  CP      80h
L2F6A:  JP      C,L2F83
        LD      HL,43D8h
        SUB     80h
        CP      08h
        JP      NZ,L2F78+2      ; reference not aligned to instruction
        XOR     A
L2F78:  CALL    L2FB9
L2F7B:  LD      HL,305Ah
        JP      L17FB

L2F81:  CP      40h             ; '@'
L2F83:  JP      C,L2F90
        LD      HL,42E4h
        SUB     40h             ; '@'
        JP      L2FB9

L2F8E:  CP      2Fh             ; '/'
L2F90:  JP      C,L2F9D
        LD      HL,43A7h
        SUB     2Fh             ; '/'
        JP      L2FB9

L2F9B:  CP      10h
L2F9D:  JP      C,L2FC5
        JP      Z,L3025+1       ; reference not aligned to instruction
        CP      11h
        JP      Z,L3025+1       ; reference not aligned to instruction
        CP      12h
        JP      Z,L3025+1       ; reference not aligned to instruction
        CP      1Eh
        JP      Z,L3025+1       ; reference not aligned to instruction
        LD      HL,4535h
        SUB     10h
        LD      C,A
        DEC     C
        ; --- START PROC L2FB9 ---
L2FB9:  JP      M,L17FB
        CALL    L089B
        ADD     HL,DE
        JP      L2FB9+1         ; reference not aligned to instruction

L2FC3:  CP      0Dh
L2FC5:  JP      C,L2FD1+1       ; reference not aligned to instruction
        LD      HL,2F50h
        SUB     0Dh
        JP      L2FB9

L2FD0:  AND     A
L2FD1:  JP      NZ,L3036
        INC     HL
        PUSH    HL
        CALL    L301E+2         ; reference not aligned to instruction
        POP     HL
        LD      A,(HL)
        CP      80h
        JP      Z,L301E+2       ; reference not aligned to instruction
        LD      A,(HL)
        AND     A
L2FE2:  PUSH    AF
        AND     7Fh             ; ''
        LD      D,A
        POP     AF
        LD      A,D
        PUSH    HL
        PUSH    AF
        LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L300E
        POP     AF
        PUSH    AF
        CALL    L1735
        POP     AF
        PUSH    AF
        CP      22h             ; '"'
        JP      NZ,L3003
        CALL    L1735
        POP     AF
        POP     HL
L3003:  INC     HL
        JP      M,L301E+2       ; reference not aligned to instruction
        OR      01h
        JP      L2FE2

L300C:  POP     AF
        PUSH    AF
L300E:  CALL    L17E1+2         ; reference not aligned to instruction
        POP     AF
        PUSH    AF
        CP      22h             ; '"'
        JP      NZ,L3003
        CALL    L17E1+2         ; reference not aligned to instruction
        JP      L3003

L301E:  LD      HL,350Fh
        JP      L17FB

L3024:  PUSH    AF
L3025:  CALL    L2F7B+2         ; reference not aligned to instruction
        LD      HL,4535h
        POP     AF
        SUB     10h
        CALL    L2FB9
        JP      L2F7B+2         ; reference not aligned to instruction

L3034:  CP      04h
L3036:  JP      NZ,L304D+2      ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,5C0Eh
        EX      DE,HL
        PUSH    DE
        INC     HL
        CALL    L1459
        EX      DE,HL
        DEC     HL
        LD      A,(HL)
        OR      80h
        LD      (HL),A
        POP     HL
        JP      L17FB

L304D:  CALL    L34D8
        PUSH    BC
        CALL    L17FB
        POP     BC
        JP      L2202+2         ; reference not aligned to instruction

L3058:  AND     B
        PUSH    HL
L305A:  CALL    L2F52+1         ; reference not aligned to instruction
        POP     HL
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(5A96h)
        CALL    L07B1
        EX      DE,HL
        RET     Z
        LD      A,(HL)
        CP      08h
        RET     NZ
        INC     HL
        PUSH    HL
        LD      DE,0009h
        ADD     HL,DE
        LD      A,(HL)
        POP     HL
        CP      1Dh
        JP      Z,L3084+2       ; reference not aligned to instruction
        PUSH    HL
        LD      HL,3D12h
        CALL    L17FB
        POP     HL
L3084:  CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
        CP      09h
        JP      NZ,L3084+2      ; reference not aligned to instruction
        PUSH    HL
        CALL    L2E0E+1         ; reference not aligned to instruction
        POP     HL
        INC     HL
        RET

L3095:  LD      A,(HL)
L3096:  CP      0FFh
        RET     Z
        CP      0FEh
        RET     Z
        CP      9Fh
        JP      Z,L30DD+1       ; reference not aligned to instruction
        PUSH    HL
        CP      9Dh
        JP      Z,L3118+2       ; reference not aligned to instruction
        CP      9Eh
        JP      Z,L311E+2       ; reference not aligned to instruction
        CP      9Bh
        JP      Z,L30D6+2       ; reference not aligned to instruction
        CP      9Ch
        JP      Z,L30F1+2       ; reference not aligned to instruction
        CP      35h             ; '5'
        JP      Z,L3106+2       ; reference not aligned to instruction
        CALL    L2F52+1         ; reference not aligned to instruction
        POP     HL
        LD      A,(HL)
        CP      0A0h
        JP      P,L30FB
        SUB     80h
        ADD     A,A
        EX      DE,HL
        LD      HL,312Bh
        CALL    L08F0
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        EX      DE,HL
        INC     HL
        PUSH    BC
        RET

L30D6:  LD      HL,31AAh
        JP      L3121+2         ; reference not aligned to instruction

L30DC:  INC     HL
L30DD:  CALL    L305A+1         ; reference not aligned to instruction
        LD      A,(HL)
L30E1:  CP      9Ch
        PUSH    HL
        JP      Z,L30F1+2       ; reference not aligned to instruction
        LD      HL,30FAh
        CALL    L17FB
        POP     HL
        JP      L3096+1         ; reference not aligned to instruction

L30F1:  LD      HL,30F9h
        JP      L3121+2         ; reference not aligned to instruction

L30F7:  ADC     A,C
        AND     B
        INC     HL
        LD      A,(HL)
L30FB:  CP      09h
        JP      NZ,L3103+2      ; reference not aligned to instruction
L3100:  CALL    L3084+2         ; reference not aligned to instruction
L3103:  JP      L3096+1         ; reference not aligned to instruction

L3106:  LD      HL,31C2h
L3109:  CALL    L17FB
        POP     HL
        INC     HL
        LD      A,(HL)
        CP      0FEh
        RET     Z
        INC     HL
L3113:  CALL    L17FB
        INC     HL
        RET

L3118:  LD      HL,31C0h
        JP      L3109+2         ; reference not aligned to instruction

L311E:  LD      HL,42E3h
L3121:  CALL    L17FB
        POP     HL
        INC     HL
        JP      L3096+1         ; reference not aligned to instruction

L3129:  SUB     D
        LD      SP,3147h
        LD      H,A
        LD      SP,315Bh
        LD      B,A
        LD      SP,3182h
        DJNZ    L3168
        DEC     B
        LD      SP,3188h
        LD      E,E
        LD      SP,3110h
        LD      E,E
        LD      SP,3097h
        SUB     A
        JR      NC,L3113
        LD      E,E
        JR      NC,L31C7
        CP      09h
        JP      NZ,L3103+2      ; reference not aligned to instruction
        PUSH    HL
        LD      HL,31C1h
L3152:  CALL    L17FB
        POP     HL
        JP      L3100+2         ; reference not aligned to instruction

L3159:  LD      A,(HL)
        CP      06h
        JP      NZ,L3103+2      ; reference not aligned to instruction
        CALL    L305A+1         ; reference not aligned to instruction
        JP      L3103+2         ; reference not aligned to instruction

L3165:  CALL    L3084+2         ; reference not aligned to instruction
L3168:  PUSH    HL
        LD      HL,31B6h
        CALL    L17FB
        POP     HL
        CALL    L3084+2         ; reference not aligned to instruction
        LD      A,(HL)
        CP      09h
        JP      NZ,L3103+2      ; reference not aligned to instruction
        PUSH    HL
        LD      HL,31BAh
        JP      L3152+2         ; reference not aligned to instruction

L3180:  CALL    L3084+2         ; reference not aligned to instruction
        JP      L30E1+1         ; reference not aligned to instruction

L3186:  CALL    L3084+2         ; reference not aligned to instruction
        PUSH    HL
        LD      HL,31A3h
        JP      L3197+2         ; reference not aligned to instruction

L3190:  CALL    L3084+2         ; reference not aligned to instruction
        PUSH    HL
        LD      HL,31B0h
L3197:  CALL    L17FB
        POP     HL
        CALL    L31C1+2         ; reference not aligned to instruction
        JP      L3103+2         ; reference not aligned to instruction

L31A1:  JR      NZ,L31EA
        LD      C,A
        LD      D,E
        LD      D,L
        LD      B,D
        AND     B
        JR      NZ,L31ED+2      ; reference not aligned to instruction
        LD      C,H
        LD      D,E
        LD      B,L
        AND     B
        JR      NZ,L31F6+1      ; reference not aligned to instruction
        LD      C,A
        LD      D,H
        LD      C,A
        AND     B
        JR      NZ,L320A
        LD      C,A
        AND     B
        JR      NZ,L320D
        LD      D,H
        LD      B,L
        LD      D,B
        AND     B
        CALL    C,0A7ACh
L31C1:  CALL    L305A+1         ; reference not aligned to instruction
        LD      A,(HL)
        CP      06h
L31C7:  RET     NZ
        PUSH    HL
        LD      HL,2F50h
        CALL    L17FB
        POP     HL
        JP      L31C1+2         ; reference not aligned to instruction

L31D3:  PUSH    DE
        PUSH    BC
        ; --- START PROC L31D5 ---
L31D5:  LD      A,(5A7Ah)
        AND     08h
        CALL    Z,L26FE+2       ; reference not aligned to instruction
        POP     BC
        CALL    L2202+2         ; reference not aligned to instruction
        LD      (5B07h),HL
        LD      A,(HL)
        CP      9Fh
        CALL    NZ,L321E
L31EA:  POP     BC
        INC     B
        DEC     B
L31ED:  JP      M,L3205+1       ; reference not aligned to instruction
        LD      A,B
        OR      C
        RET     Z
L31F3:  CALL    L5209+1         ; reference not aligned to instruction
L31F6:  CP      0FEh
        JP      NZ,L31F3+2      ; reference not aligned to instruction
        INC     HL
        LD      A,(HL)
        INC     A
        CALL    Z,L321E
        JP      L21D7+2         ; reference not aligned to instruction

L3204:  PUSH    BC
L3205:  CALL    L21B3+2         ; reference not aligned to instruction
        POP     DE
        ADD     HL,DE
L320A:  JP      L21D4

L320D:  LD      HL,(5B3Ch)
        LD      D,00h
        LD      E,(HL)
        ADD     HL,DE
        INC     HL
        LD      A,(HL)
        INC     A
        LD      (5B3Ch),HL
        INC     HL
        RET

L321C:  LD      B,07h
        ; --- START PROC L321E ---
L321E:  JP      L2833+1         ; reference not aligned to instruction

L3221:  LD      A,(5A8Eh)
        CP      02h
        SCF
        RET     Z
        LD      HL,(5A91h)
        CALL    L21F5+1         ; reference not aligned to instruction
        PUSH    BC
        CALL    NZ,L321E
        AND     3Fh             ; '?'
        CP      01h
        CALL    NZ,L321E
        CALL    L2280+2         ; reference not aligned to instruction
        JP      NC,L3245+2      ; reference not aligned to instruction
L323F:  LD      DE,0000h
        XOR     A
        POP     BC
L3244:  RET

L3245:  LD      HL,(5A91h)
        LD      A,(HL)
        CP      0ABh
        JP      Z,L3254+1       ; reference not aligned to instruction
        CP      0ADh
        JP      NZ,L323F+2      ; reference not aligned to instruction
        PUSH    AF
L3254:  CALL    L2280+2         ; reference not aligned to instruction
        CALL    C,L321E
        CALL    L2330+2         ; reference not aligned to instruction
        CALL    C,L321E
        CALL    L2280+2         ; reference not aligned to instruction
        LD      HL,59F6h
        CALL    L162F
        POP     AF
        EX      DE,HL
        CP      0ADh
        JP      NZ,L3244
        LD      A,D
        CPL
        LD      D,A
        LD      A,E
        CPL
        LD      E,A
        INC     DE
        JP      L3244

L327A:  LD      HL,(5B05h)
        LD      (5B0Bh),HL
        LD      HL,(5A96h)
        LD      (5B0Dh),HL
        CALL    L3221+2         ; reference not aligned to instruction
        JP      C,L32A5+2       ; reference not aligned to instruction
        CALL    L31D5
        DEC     HL
        LD      (5B0Bh),HL
        CALL    L3221+2         ; reference not aligned to instruction
        JP      C,L32A5+2       ; reference not aligned to instruction
        CALL    L31D5
        DEC     HL
        LD      D,00h
        LD      E,(HL)
        ADD     HL,DE
        INC     HL
        LD      (5B0Dh),HL
L32A5:  LD      HL,(5B0Bh)
        EX      DE,HL
        LD      HL,(5B0Dh)
        CALL    L07B1
        CALL    C,L3596
        EX      DE,HL
        EX      DE,HL
L32B4:  LD      HL,(5B0Dh)
        CALL    L07B1
        JP      Z,L32D4+2       ; reference not aligned to instruction
        JP      C,L32D4+2       ; reference not aligned to instruction
        EX      DE,HL
        INC     HL
        CALL    L3096+1         ; reference not aligned to instruction
        INC     HL
        PUSH    HL
        LD      HL,07A7h
        CALL    L17FB
        CALL    L16F7
        POP     HL
        JP      NZ,L32B4+1      ; reference not aligned to instruction
L32D4:  LD      A,(5A7Ah)
        AND     10h
        RET     Z
        LD      HL,07A7h
        CALL    L17FB
        LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
        XOR     A
        SCF
        INC     A
        JP      L17E1+2         ; reference not aligned to instruction

L32EE:  LD      HL,(5A96h)
        LD      (5A9Ch),HL
        CALL    L58D3+1         ; reference not aligned to instruction
        LD      A,04h
L32F9:  LD      (5A7Ah),A
        CALL    L3221+2         ; reference not aligned to instruction
        JP      C,L330E
        CALL    L31D5
        DEC     HL
        LD      (5A9Ch),HL
        CALL    L172E
        LD      A,3Ah           ; ':'
        ; --- START PROC L330E ---
L330E:  CALL    L1735
        CALL    L2687+2         ; reference not aligned to instruction
        RET     C
        LD      HL,(5A96h)
        LD      (5B3Eh),HL
        CALL    L2AAF+2         ; reference not aligned to instruction
        CALL    L2A10
        CALL    L2AC3+2         ; reference not aligned to instruction
        JP      L330E

L3327:  LD      A,01h
        LD      (5B29h),A
        CALL    L3221+2         ; reference not aligned to instruction
        PUSH    BC
        CALL    C,L2823
        POP     BC
        CALL    L31D5
        DEC     HL
        LD      (5B0Bh),HL
        LD      (5B0Dh),HL
        CALL    L3221+2         ; reference not aligned to instruction
        JP      C,L334B+2       ; reference not aligned to instruction
        CALL    L31D5
        DEC     HL
        LD      (5B0Dh),HL
L334B:  LD      (5B3Ch),HL
        CALL    L320D+2         ; reference not aligned to instruction
        DEC     HL
        EX      DE,HL
        LD      HL,(5A96h)
        CALL    L07A9
        LD      A,H
        OR      L
        JP      Z,L338A+2       ; reference not aligned to instruction
        LD      C,L
        LD      B,H
        LD      HL,(5B0Bh)
        EX      DE,HL
        CALL    L0827
        EX      DE,HL
        ADD     HL,BC
L3369:  LD      (5A96h),HL
        LD      (HL),0FFh
        LD      A,(5B29h)
        AND     A
        JP      Z,L3390+2       ; reference not aligned to instruction
        XOR     A
        LD      (5B29h),A
        LD      HL,(5B0Bh)
        LD      (5A9Ch),HL
        LD      A,04h
        LD      (5A7Ah),A
        CALL    L3390+2         ; reference not aligned to instruction
        JP      L330E

L338A:  LD      HL,(5B0Bh)
        JP      L3369+2         ; reference not aligned to instruction

L3390:  CALL    L58D3+1         ; reference not aligned to instruction
        JP      L2769+2         ; reference not aligned to instruction

L3396:  LD      HL,(5A96h)
        LD      (5B39h),HL
        EX      DE,HL
        LD      HL,(5B05h)
        CALL    L07B1
        RET     Z
        CALL    L2691+2         ; reference not aligned to instruction
        CALL    L3221+2         ; reference not aligned to instruction
        LD      HL,(5B05h)
        INC     HL
        LD      (5B1Ch),HL
        LD      HL,0000h
        LD      (5B1Eh),HL
        LD      (5B20h),HL
        LD      HL,(5A8Ah)
        LD      (5A9Ah),HL
        LD      HL,(5B09h)
        LD      (5EECh),HL
        LD      (5B1Ah),HL
        LD      HL,(5B05h)
        JP      C,L33D3+2       ; reference not aligned to instruction
        CALL    L31D5
        DEC     HL
L33D3:  LD      A,(5A93h)
        AND     A
        JP      NZ,L3C2B+2      ; reference not aligned to instruction
        PUSH    HL
        CALL    L2769+2         ; reference not aligned to instruction
        LD      A,0FFh
        LD      (5A93h),A
        LD      HL,(5B09h)
        LD      (5EECh),HL
        POP     HL
        JP      L3C2B+2         ; reference not aligned to instruction

L33ED:  LD      A,(5A93h)
        AND     A
        JP      Z,L3404
        LD      HL,(5B39h)
        EX      DE,HL
        LD      HL,(5A96h)
        EX      DE,HL
        CALL    L07B1
        JP      C,L3C41+2       ; reference not aligned to instruction
        LD      B,22h           ; '"'
L3404:  CALL    L2833+1         ; reference not aligned to instruction
        CALL    L58D3+1         ; reference not aligned to instruction
L340A:  LD      HL,0001h
        LD      (5A86h),HL
        LD      HL,(5A8Ch)
        LD      (5A88h),HL
        LD      (HL),80h
        DEC     HL
        XOR     A
        LD      (5A5Bh),A
        LD      (5A93h),A
        LD      (HL),A
        DEC     HL
        LD      (HL),A
        DEC     HL
        LD      (HL),A
        LD      A,08h
        LD      (5B3Bh),A
        LD      (5A8Ah),HL
        LD      (5A9Ah),HL
        LD      HL,(5B0Fh)
        LD      (5B05h),HL
        LD      (5A96h),HL
        LD      (5B39h),HL
        INC     HL
        LD      (5EECh),HL
        LD      (5B09h),HL
        LD      HL,37D7h
        LD      DE,5B14h
        CALL    L0824
        JP      L2691+2         ; reference not aligned to instruction

L344F:  LD      DE,0000h
        LD      HL,(5B07h)
        PUSH    HL
        LD      (5B42h),HL
        LD      A,(5A7Ah)
        AND     08h
        LD      HL,3509h
        LD      (5B44h),HL
        JP      Z,L349E+1       ; reference not aligned to instruction
        LD      HL,3510h
        LD      (5B44h),HL
        LD      HL,(5B05h)
        LD      (5B3Ch),HL
        INC     HL
        PUSH    DE
        LD      A,(HL)
L3476:  CP      9Fh
        JP      NZ,L3487+2      ; reference not aligned to instruction
        POP     DE
        LD      DE,0FFFFh
        PUSH    DE
        INC     HL
        CALL    L34D8
        LD      (5B44h),HL
L3487:  LD      HL,(5B42h)
        EX      DE,HL
        LD      HL,(5B3Ch)
        CALL    L07B1
        JP      NC,L349E
        CALL    L320D+2         ; reference not aligned to instruction
        POP     DE
        INC     DE
        JP      L3476

L349C:  POP     DE
        PUSH    DE
L349E:  LD      HL,350Eh
        CALL    L17FB
        LD      HL,(5B44h)
        CALL    L17FB
        POP     HL
        LD      A,H
        OR      A
        JP      M,L34BC+2       ; reference not aligned to instruction
        OR      L
        JP      Z,L34D2+1       ; reference not aligned to instruction
        PUSH    HL
        LD      HL,3D12h
        CALL    L17F3
        POP     HL
L34BC:  LD      DE,59F0h
        CALL    L167E
        LD      A,04h
        LD      (L59EE+1),A     ; reference not aligned to instruction
        INC     A
        LD      (L59F6),A
        LD      HL,59EFh
        CALL    L2F52+1         ; reference not aligned to instruction
        POP     HL
L34D2:  LD      (5B07h),HL
        RET

L34D6:  INC     HL
        LD      C,(HL)
        ; --- START PROC L34D8 ---
L34D8:  INC     HL
        LD      B,(HL)
        PUSH    BC
        LD      HL,(5A88h)
        DEC     BC
        LD      A,B
L34E0:  OR      C
        JP      Z,L34ED
        CALL    L089B
        ADD     HL,DE
        JP      L34E0

L34EB:  POP     BC
        LD      A,(HL)
L34ED:  OR      A
        RET     NZ
        INC     HL
        RET

L34F1:  LD      D,D
        LD      B,L
        LD      B,C
        LD      B,H
        LD      C,C
        LD      C,(HL)
        LD      B,A
        LD      L,2Eh           ; '.'
        LD      L,8Dh
        LD      D,A
        LD      D,D
        LD      C,C
        LD      D,H
        LD      C,C
        LD      C,(HL)
        LD      B,A
        LD      L,2Eh           ; '.'
        LD      L,8Dh
        LD      B,L
        LD      C,(HL)
        LD      D,H
        LD      D,D
        EXX
        AND     B
        AND     D
        LD      B,D
        LD      B,L
        LD      B,A
L3511:  LD      C,C
        LD      C,(HL)
        LD      C,(HL)
        LD      C,C
        LD      C,(HL)
        RST     0x00
        PUSH    HL
        PUSH    DE
        ; --- START PROC L3519 ---
L3519:  PUSH    BC
        PUSH    AF
        CALL    L26BC+1         ; reference not aligned to instruction
        PUSH    HL
        PUSH    DE
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     BC
        LD      HL,(5EECh)
        EX      DE,HL
        POP     HL
        CALL    L07F7
        EX      DE,HL
        ADD     HL,BC
        LD      (5EECh),HL
        POP     AF
        POP     BC
        POP     DE
        POP     HL
        RET

L3536:  PUSH    DE
        PUSH    BC
        ; --- START PROC L3538 ---
L3538:  PUSH    AF
        LD      HL,(5EECh)
        DEC     HL
        CALL    L26BC+1         ; reference not aligned to instruction
        CALL    L07A9
        INC     HL
        LD      (5EECh),HL
        POP     AF
        POP     BC
        POP     DE
        RET

L354B:  LD      A,(HL)
L354C:  CP      02h
        JP      Z,L3559
        LD      C,L
        LD      B,H
        AND     A
        RET     Z
        INC     BC
        RET

L3557:  INC     HL
        LD      C,(HL)
L3559:  INC     HL
        LD      B,(HL)
        PUSH    DE
        CALL    L2202+2         ; reference not aligned to instruction
        LD      B,H
        LD      C,L
        POP     DE
        RET

L3563:  CALL    L3538
        LD      DE,0000h
        LD      A,(HL)
L356A:  CP      02h
        JP      Z,L3580
        AND     A
        JP      Z,L359B
        CP      04h
        JP      Z,L359E
        CP      09h
        JP      Z,L3563+2       ; reference not aligned to instruction
        RET

L357E:  INC     HL
        LD      E,(HL)
L3580:  INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      A,(HL)
        AND     A
        JP      Z,L359B
        AND     3Eh             ; '>'
        CP      02h
        JP      Z,L35A7
        CP      08h
        JP      Z,L35A9
        LD      B,26h           ; '&'
        ; --- START PROC L3596 ---
L3596:  JP      L2833+1         ; reference not aligned to instruction

L3599:  INC     HL
        SCF
L359B:  RET

L359C:  INC     HL
        LD      A,(HL)
L359E:  AND     0Eh
        CP      02h
        JP      NZ,L35B2
        XOR     A
        RET

L35A7:  INC     HL
        INC     HL
L35A9:  INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        SCF
        RET

L35B0:  SUB     06h
L35B2:  CCF
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        RET     NC
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        RET

L35BE:  LD      A,00h
        ; --- START PROC L35C0 ---
L35C0:  RLA
        LD      BC,59F6h
        LD      (BC),A
        CALL    L3563+2         ; reference not aligned to instruction
        LD      A,(BC)
        INC     A
        INC     A
        JP      NC,L35D2
        ADD     A,02h
        LD      (BC),A
        PUSH    HL
L35D2:  CALL    L3563+2         ; reference not aligned to instruction
        LD      A,(BC)
        INC     A
        INC     A
        JP      NC,L35DE+1      ; reference not aligned to instruction
        ADD     A,02h
        PUSH    HL
L35DE:  CP      08h
        JP      Z,L35F0+1       ; reference not aligned to instruction
        OR      01h
        CP      05h
        JP      Z,L35F0+2       ; reference not aligned to instruction
        LD      B,24h           ; '$'
        ; --- START PROC L35EC ---
L35EC:  JP      L2833+1         ; reference not aligned to instruction

L35EF:  SCF
L35F0:  LD      HL,(5EECh)
        INC     HL
        LD      C,L
        LD      B,H
        POP     HL
        POP     DE
        RET

L35F9:  SCF
L35FA:  CALL    L35C0
        PUSH    BC
        PUSH    DE
        CALL    L162F
        EX      (SP),HL
        CALL    L162F
        POP     DE
        LD      C,L
        LD      B,H
        POP     HL
        EX      (SP),HL
        JP      (HL)

L360C:  EX      DE,HL
        POP     HL
L360E:  EX      DE,HL
        CALL    L167E
L3612:  LD      HL,(5EECh)
        LD      (HL),04h
        LD      DE,0007h
        ADD     HL,DE
        LD      (HL),05h
        INC     HL
        LD      (5EECh),HL
        RET

L3622:  EX      DE,HL
L3623:  LD      HL,0BA9h
        JP      NC,L362C+2      ; reference not aligned to instruction
        LD      HL,37D1h
L362C:  CALL    L07F4
        JP      L3612+2         ; reference not aligned to instruction

L3632:  XOR     A
L3633:  CALL    L35C0
        PUSH    BC
        JP      C,L3640+1       ; reference not aligned to instruction
        CALL    L15AA
        POP     HL
        RET

L363F:  EX      DE,HL
L3640:  CALL    L37A3
        POP     HL
        RET

L3645:  CALL    L35FA+1         ; reference not aligned to instruction
        LD      A,E
        OR      C
        LD      L,A
        LD      A,D
        OR      B
        LD      H,A
        JP      L360E

L3651:  CALL    L35FA+1         ; reference not aligned to instruction
        LD      A,E
        AND     C
        LD      L,A
        LD      A,D
        AND     B
        LD      H,A
        JP      L360E

L365D:  CALL    L35FA+1         ; reference not aligned to instruction
        LD      A,C
        CPL
        AND     E
        LD      L,A
        LD      A,B
        CPL
        AND     D
        LD      H,A
        JP      L360E

L366B:  CALL    L3633+1         ; reference not aligned to instruction
        CCF
        JP      L3623+1         ; reference not aligned to instruction

L3672:  CALL    L3633+1         ; reference not aligned to instruction
        JP      C,L3623+1       ; reference not aligned to instruction
        JP      NZ,L3623+1      ; reference not aligned to instruction
        SCF
        JP      L3623+1         ; reference not aligned to instruction

L367F:  CALL    L3633+1         ; reference not aligned to instruction
        CCF
        JP      NZ,L3623+1      ; reference not aligned to instruction
        XOR     A
        JP      L3623+1         ; reference not aligned to instruction

L368A:  CALL    L3633+1         ; reference not aligned to instruction
        JP      L3623+1         ; reference not aligned to instruction

L3690:  CALL    L3633+1         ; reference not aligned to instruction
        SCF
        JP      NZ,L3623+1      ; reference not aligned to instruction
        CCF
        JP      L3623+1         ; reference not aligned to instruction

L369B:  LD      A,(5B22h)
        AND     A
        RET     NZ
        LD      A,(5B03h)
        CP      87h
        RET     Z
        CALL    L3633+1         ; reference not aligned to instruction
        SCF
        JP      Z,L3623+1       ; reference not aligned to instruction
        CCF
        JP      L3623+1         ; reference not aligned to instruction

L36B1:  SCF
        CALL    L35C0
        CALL    L28AD+2         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L36BB:  SCF
        CALL    L35C0
        LD      A,(HL)
        AND     01h
        JP      NZ,L36D1+2      ; reference not aligned to instruction
        PUSH    BC
        PUSH    DE
        LD      DE,5A02h
        PUSH    DE
        CALL    L11F9+1         ; reference not aligned to instruction
        POP     HL
        POP     DE
        POP     BC
L36D1:  CALL    L28CB+2         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L36D7:  SCF
        CALL    L35C0
        CALL    L28BD+2         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L36E1:  SCF
        CALL    L35C0
        LD      A,(DE)
        CP      82h
        JP      NZ,L36F8+2      ; reference not aligned to instruction
        PUSH    HL
        PUSH    BC
        EX      DE,HL
        LD      DE,594Ch
        PUSH    DE
        CALL    L11F9+1         ; reference not aligned to instruction
        POP     DE
        POP     BC
        POP     HL
L36F8:  CALL    L1D62+1         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L36FE:  XOR     A
        LD      HL,(5EECh)
        LD      (L5940),HL
        CALL    L35C0
        JP      C,L3713
        CALL    L2892+2         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L3711:  PUSH    HL
        EX      DE,HL
L3713:  CALL    L089B
        EX      DE,HL
        EX      (SP),HL
        CALL    L089B
        POP     HL
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(L5940)
        CALL    L51DB+1         ; reference not aligned to instruction
        LD      HL,(L5940)
        LD      (5EECh),HL
        XOR     A
        CALL    L35C0
        PUSH    DE
        PUSH    HL
        LD      HL,(L5940)
        LD      (HL),00h
        INC     HL
        POP     DE
        CALL    L3762
        POP     DE
        LD      A,(DE)
        CP      80h
        JP      Z,L374F+2       ; reference not aligned to instruction
        DEC     HL
        LD      A,(HL)
        CP      80h
        JP      Z,L374C+2       ; reference not aligned to instruction
        AND     7Fh             ; ''
        LD      (HL),A
        INC     HL
L374C:  CALL    L3762
L374F:  LD      HL,(L5940)
        EX      DE,HL
        LD      HL,(5EECh)
        CALL    L3762
        LD      (HL),01h
        INC     HL
        LD      (5EECh),HL
        RET

L3760:  LD      A,(DE)
        INC     DE
        ; --- START PROC L3762 ---
L3762:  LD      (HL),A
        INC     HL
        OR      A
        JP      P,L3762
        RET

L3769:  CALL    L3563+2         ; reference not aligned to instruction
        JP      C,L35EC
        EX      DE,HL
        LD      HL,(5EECh)
        INC     HL
        CALL    L07B1
        JP      Z,L3781
        EX      DE,HL
        CALL    L0824
        EX      DE,HL
        LD      A,80h
L3781:  XOR     (HL)
        LD      (HL),A
        JP      L3612+2         ; reference not aligned to instruction

L3786:  CALL    L3563+2         ; reference not aligned to instruction
        JP      C,L35EC
        CALL    L162F
        LD      A,H
        CPL
        LD      H,A
        LD      A,L
        CPL
        LD      L,A
        EX      DE,HL
        LD      HL,(5EECh)
        INC     HL
        EX      DE,HL
        CALL    L167E
        JP      L3612+2         ; reference not aligned to instruction

L37A1:  PUSH    BC
        PUSH    DE
        ; --- START PROC L37A3 ---
L37A3:  CALL    L37AB
        POP     DE
        POP     BC
        RET

L37A9:  LD      A,(DE)
        AND     A
        ; --- START PROC L37AB ---
L37AB:  JP      M,L37C5
        CP      (HL)
        INC     DE
        INC     HL
        JP      Z,L37AB
        RET     NC
        DEC     HL
        LD      B,A
        LD      A,(HL)
        INC     A
        RET     P
        DEC     A
        AND     7Fh             ; ''
        CP      B
        CCF
        RET     NZ
        OR      01h
        RET

L37C3:  LD      B,A
        LD      A,(HL)
L37C5:  CP      B
        RET     Z
        OR      80h
        SUB     B
        CCF
        RET     NZ
        SUB     01h
        RET

L37CF:  ADD     A,D
        NOP
        NOP
        NOP
        NOP
        LD      BC,0002h
        NOP
        INC     BC
        DAA
        LD      H,A
        PUSH    AF
        PUSH    HL
        ; --- START PROC L37DD ---
L37DD:  XOR     A
        LD      (L59F6+1),A     ; reference not aligned to instruction
        EX      DE,HL
        LD      (L59F8),HL
L37E5:  LD      HL,(5A9Ah)
        CALL    L07A9
        CALL    NC,L3837
        LD      DE,0FE0Ch
        ADD     HL,DE
        CALL    NC,L3837
        EX      DE,HL
        LD      HL,(5EECh)
        CALL    L07B1
        JP      NC,L3822+2      ; reference not aligned to instruction
        POP     DE
        INC     DE
        INC     DE
        INC     DE
        LD      HL,(5A9Ah)
        DEC     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        CALL    L07A9
        LD      (5A9Ah),HL
        EX      DE,HL
        LD      HL,(L59F8)
        EX      DE,HL
        POP     AF
        LD      (HL),A
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        EX      DE,HL
        RET

L3822:  LD      A,(L59F6+1)     ; reference not aligned to instruction
        AND     A
        CALL    NZ,L3837
        INC     A
        LD      (L59F6+1),A     ; reference not aligned to instruction
        CALL    L383A+2         ; reference not aligned to instruction
        POP     DE
        PUSH    DE
        JP      L37E5+2         ; reference not aligned to instruction

L3835:  LD      B,27h           ; '''
        ; --- START PROC L3837 ---
L3837:  JP      L2833+1         ; reference not aligned to instruction

L383A:  LD      A,(5A95h)
        OR      80h
        LD      (5A95h),A
        LD      HL,(5A8Ah)
L3845:  LD      (L59F0),HL
L3848:  LD      (L59EA),HL
        EX      DE,HL
L384C:  LD      HL,(5A9Ah)
        CALL    L07B1
        JP      Z,L3909+2       ; reference not aligned to instruction
        EX      DE,HL
        DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)
        CALL    L07A9
        LD      A,(HL)
        AND     A
        JP      P,L3848+2       ; reference not aligned to instruction
        PUSH    HL
        LD      HL,(L59EA)
        EX      DE,HL
        LD      HL,(L59F0)
        CALL    L07B1
        POP     HL
        JP      Z,L3845+2       ; reference not aligned to instruction
        EX      DE,HL
        CALL    L07A9
        EX      DE,HL
        LD      (L59EA),HL
        LD      HL,(L59F0)
        CALL    L07A9
        LD      (L59F0),HL
        LD      C,E
        LD      B,D
        EX      DE,HL
        PUSH    DE
        LD      HL,(L59EA)
        EX      DE,HL
        LD      HL,(L59F8)
        CALL    L07B1
        JP      C,L38AC+2       ; reference not aligned to instruction
        EX      DE,HL
        ADD     HL,BC
        DEC     HL
        CALL    L07B1
        JP      C,L38AC+2       ; reference not aligned to instruction
        EX      DE,HL
        POP     DE
        PUSH    DE
        PUSH    HL
        LD      HL,(L59EA)
        EX      DE,HL
        CALL    L07A9
        POP     DE
        ADD     HL,DE
        LD      (L59F8),HL
L38AC:  LD      HL,(L59EA)
        POP     DE
        CALL    L0827
        LD      A,(DE)
        CP      82h
        JP      NZ,L38FB
        PUSH    HL
        PUSH    DE
        PUSH    BC
        EX      DE,HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        PUSH    HL
        EX      DE,HL
        DEC     HL
        DEC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        ADD     HL,DE
        ADD     HL,DE
        PUSH    HL
        LD      L,C
        LD      H,B
        CALL    L07A9
        CALL    L07A9
        LD      DE,0005h
        CALL    L07A9
        LD      A,H
        AND     A
        RRA
        LD      B,A
        LD      A,L
        RRA
        LD      C,A
        POP     HL
        LD      E,(HL)
        INC     HL
L38E5:  LD      D,(HL)
        DEC     HL
        DEC     DE
        DEC     DE
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        EX      DE,HL
        INC     HL
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L38E5
        POP     BC
        POP     DE
        POP     HL
        EX      DE,HL
        INC     HL
L38FB:  LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        INC     DE
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,(L59EA)
        JP      L384C+1         ; reference not aligned to instruction

L3909:  LD      HL,(L59F0)
        LD      (5A9Ah),HL
        RET

L3910:  LD      HL,(5EECh)
        DEC     HL
L3914:  CALL    L26BC+1         ; reference not aligned to instruction
        CALL    L07A9
        LD      A,(HL)
        CP      0Dh
        JP      Z,L3914+1       ; reference not aligned to instruction
        CALL    L26BC+1         ; reference not aligned to instruction
        CALL    L07A9
        INC     HL
        LD      A,(HL)
        CP      02h
        CALL    NZ,L2832
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      A,(5B03h)
        CP      0A5h
        JP      Z,L39D9
        LD      A,(HL)
        CP      0FFh
        LD      B,28h           ; '('
        CALL    Z,L2833+1       ; reference not aligned to instruction
        AND     0Ch
        CALL    Z,L2832
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      (L59B8),HL
        EX      DE,HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      (L59BA),HL
        LD      HL,0000h
        PUSH    HL
        JP      L396F+2         ; reference not aligned to instruction

L395F:  CALL    L4720+2         ; reference not aligned to instruction
        LD      HL,(L59BA)
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,(L59BA+2)    ; reference not aligned to instruction
        CALL    L3AE9
        PUSH    HL
L396F:  CALL    L3563+2         ; reference not aligned to instruction
        CALL    C,L35EC
        CALL    L1620
        PUSH    HL
        LD      HL,(L59BA)
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        LD      (L59BA),HL
        POP     HL
        EX      DE,HL
        DEC     HL
        CALL    L07B1
        INC     HL
        LD      B,29h           ; ')'
        EX      DE,HL
        CALL    C,L2833+1       ; reference not aligned to instruction
        POP     DE
        ADD     HL,DE
        LD      (L59BA+2),HL    ; reference not aligned to instruction
        LD      HL,(L59B8)
        DEC     HL
        LD      (L59B8),HL
        LD      A,H
        OR      L
        JP      NZ,L395F+2      ; reference not aligned to instruction
        CALL    L3538
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        DEC     DE
        LD      A,(HL)
        LD      (DE),A
        EX      DE,HL
        INC     HL
        INC     HL
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        EX      DE,HL
        PUSH    DE
        LD      A,(HL)
        AND     04h
        JP      NZ,L39C2+2      ; reference not aligned to instruction
        LD      HL,(L59BA+2)    ; reference not aligned to instruction
        ADD     HL,HL
        JP      L39C9+1         ; reference not aligned to instruction

L39C2:  LD      HL,(L59BA+2)    ; reference not aligned to instruction
        CALL    L07E9
        EX      DE,HL
L39C9:  LD      HL,(L59BA)
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DEC     HL
        DEC     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        JP      L3612+2         ; reference not aligned to instruction

L39D7:  PUSH    HL
        LD      A,(HL)
L39D9:  CP      0FFh
        JP      Z,L39E8+2       ; reference not aligned to instruction
        INC     HL
        INC     HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        CALL    L3B0B
L39E8:  LD      HL,(5EECh)
        LD      (L59B8),HL
        LD      (5B0Dh),HL
        LD      HL,0001h
        LD      (L59BA),HL
        DEC     HL
        LD      (L59BA+2),HL    ; reference not aligned to instruction
L39FB:  CALL    L3563+2         ; reference not aligned to instruction
        CALL    C,L35EC
        CALL    L162F
        INC     HL
        EX      DE,HL
        LD      HL,(5B0Dh)
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (5B0Dh),HL
        LD      HL,(L59BA)
        CALL    L3AE9
        LD      (L59BA),HL
        LD      HL,(L59BA+2)    ; reference not aligned to instruction
        INC     HL
        LD      (L59BA+2),HL    ; reference not aligned to instruction
        CALL    L3538
        LD      A,(HL)
        CP      0Dh
        JP      Z,L39FB+2       ; reference not aligned to instruction
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,(5A88h)
        PUSH    HL
        LD      HL,(5A8Ah)
        EX      DE,HL
        LD      (L59F6),HL
        EX      DE,HL
        LD      E,(HL)
        INC     HL
L3A3B:  LD      D,(HL)
        INC     HL
        INC     HL
        EX      (SP),HL
        PUSH    DE
        CALL    L089B
        ADD     HL,DE
        POP     DE
        EX      (SP),HL
        PUSH    HL
        LD      HL,(L59F6)
        CALL    L07B1
        POP     HL
        JP      NZ,L3A3B
        POP     HL
        DEC     HL
        LD      A,(HL)
        LD      (L59F6),A
        LD      HL,(L59BA)
        LD      DE,0002h
        LD      A,(L59F6)
        CP      0A4h
        JP      Z,L3A68+2       ; reference not aligned to instruction
        LD      DE,0006h
L3A68:  CALL    L3AE9
        PUSH    HL
        LD      HL,(L59BA+2)    ; reference not aligned to instruction
        ADD     HL,HL
        POP     DE
        ADD     HL,DE
        POP     DE
        INC     DE
        INC     DE
        INC     DE
        PUSH    DE
        LD      A,(L59F6)
        CP      0A4h
        JP      Z,L3A86
        LD      A,84h
        JP      L3A86+2         ; reference not aligned to instruction

L3A84:  LD      A,82h
L3A86:  CALL    L37DD
        POP     DE
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        PUSH    DE
        DEC     HL
        DEC     HL
        EX      DE,HL
        LD      HL,(L59BA+2)    ; reference not aligned to instruction
        EX      DE,HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        DEC     HL
        LD      A,(L59F6)
        CP      0A4h
        JP      Z,L3AA9
        LD      (HL),04h
        JP      L3AA9+2         ; reference not aligned to instruction

L3AA7:  LD      (HL),48h        ; 'H'
L3AA9:  LD      HL,(L59BA+2)    ; reference not aligned to instruction
        ADD     HL,HL
        LD      B,H
        LD      C,L
        LD      HL,(L59B8)
        POP     DE
        CALL    L0827
        EX      DE,HL
        ADD     HL,BC
        PUSH    HL
        LD      HL,(L59BA)
        LD      B,H
        LD      C,L
        POP     HL
        LD      A,(L59F6)
        CP      0A4h
        JP      NZ,L3ADA
        LD      DE,5A85h
        LD      A,80h
        LD      (DE),A
        LD      (HL),E
        INC     HL
L3ACF:  LD      (HL),D
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L3ACF
        RET

L3AD8:  PUSH    BC
        EX      DE,HL
L3ADA:  CALL    L0821
        EX      DE,HL
        ADD     HL,BC
        POP     BC
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L3ADA
        RET

L3AE7:  LD      B,H
        LD      C,L
        ; --- START PROC L3AE9 ---
L3AE9:  PUSH    DE
        LD      D,C
        CALL    L07B7
        EX      DE,HL
        POP     DE
        PUSH    DE
        LD      D,B
        CALL    L07B7
        LD      A,E
        ADD     A,H
        LD      H,A
        LD      B,30h           ; '0'
        CALL    C,L4711
        POP     DE
        LD      E,C
        CALL    L07B7
        LD      A,E
        ADD     A,H
        LD      H,A
        CALL    C,L4711
        RET

L3B09:  DEC     HL
        DEC     HL
        ; --- START PROC L3B0B ---
L3B0B:  DEC     HL
        LD      A,(HL)
        AND     7Fh             ; ''
        LD      (HL),A
        RET

L3B11:  EX      DE,HL
        XOR     A
        ; --- START PROC L3B13 ---
L3B13:  LD      (5B22h),A
        XOR     A
L3B17:  LD      (5B04h),A
        PUSH    DE
        LD      DE,0100h
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     DE
        LD      HL,(5EECh)
        PUSH    HL
        EX      DE,HL
        INC     HL
        LD      A,(HL)
        PUSH    HL
L3B2A:  CP      0Dh
        JP      Z,L3B37
        PUSH    AF
        XOR     A
        LD      (5B04h),A
        POP     AF
        CP      09h
L3B37:  JP      Z,L3BBA+2       ; reference not aligned to instruction
        CP      06h
        JP      C,L3B8B+1       ; reference not aligned to instruction
        CP      0Fh
        JP      C,L3BAD+2       ; reference not aligned to instruction
        CP      40h             ; '@'
        JP      P,L3B79
        CP      34h             ; '4'
        JP      Z,L3B6C+2       ; reference not aligned to instruction
        CP      36h             ; '6'
        JP      Z,L3B66+2       ; reference not aligned to instruction
        SUB     0Fh
        ADD     A,A
        LD      E,A
        XOR     A
        LD      D,A
        LD      HL,41B2h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,3B71h
        PUSH    HL
        EX      DE,HL
        JP      (HL)

L3B66:  CALL    L5551+2         ; reference not aligned to instruction
        JP      L3B70+1         ; reference not aligned to instruction

L3B6C:  CALL    L3910+2         ; reference not aligned to instruction
        POP     HL
L3B70:  CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        JP      L3B2A

L3B77:  SUB     40h             ; '@'
        ; --- START PROC L3B79 ---
L3B79:  ADD     A,A
        LD      E,A
        XOR     A
        LD      D,A
        LD      HL,41D4h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,3B71h
        PUSH    HL
        EX      DE,HL
        JP      (HL)

L3B8A:  LD      A,(HL)
L3B8B:  CP      02h
        JP      NZ,L3B97+2      ; reference not aligned to instruction
        LD      A,(5B22h)
        AND     A
        JP      NZ,L3BC2
L3B97:  CALL    L354C+1         ; reference not aligned to instruction
        LD      HL,(5EECh)
        LD      (HL),02h
        INC     HL
        LD      (HL),C
        INC     HL
        LD      (HL),B
        INC     HL
        LD      (HL),03h
        INC     HL
        LD      (5EECh),HL
        JP      L3B70+1         ; reference not aligned to instruction

L3BAD:  LD      A,(5B04h)
        AND     A
        JP      NZ,L3B70+1      ; reference not aligned to instruction
        CALL    L3519
        JP      L3B70+1         ; reference not aligned to instruction

L3BBA:  CALL    L3519
        POP     DE
        POP     HL
        RET

L3BC0:  INC     HL
        LD      C,(HL)
L3BC2:  INC     HL
        LD      B,(HL)
        PUSH    HL
        CALL    L2202+2         ; reference not aligned to instruction
        CP      04h
        POP     HL
        DEC     HL
        DEC     HL
        JP      Z,L3B97+2       ; reference not aligned to instruction
        LD      HL,(5B23h)
        LD      DE,0000h
        LD      A,(HL)
L3BD7:  CP      02h
        CALL    NZ,L2828
        INC     HL
        LD      A,(HL)
        INC     HL
        CP      C
        JP      NZ,L3BEA
        LD      A,(HL)
        CP      B
        JP      Z,L3BF8+2       ; reference not aligned to instruction
        INC     HL
        INC     HL
L3BEA:  LD      A,(HL)
        CP      36h             ; '6'
        JP      Z,L3C14+2       ; reference not aligned to instruction
        CALL    L4724+1         ; reference not aligned to instruction
        INC     HL
        INC     DE
        JP      L3BD7+1         ; reference not aligned to instruction

L3BF8:  LD      HL,(5B25h)
        LD      A,D
        OR      E
L3BFD:  JP      Z,L3C0E+2       ; reference not aligned to instruction
        PUSH    DE
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        CALL    L4724+1         ; reference not aligned to instruction
        INC     HL
        POP     DE
        DEC     DE
        JP      L3BFD

L3C0E:  CALL    L3519
        JP      L3B70+1         ; reference not aligned to instruction

L3C14:  CALL    L2202+2         ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5EECh)
        LD      (HL),02h
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (HL),03h
        INC     HL
        LD      (5EECh),HL
        JP      L3B70+1         ; reference not aligned to instruction

L3C2B:  LD      A,(5A7Ah)
        OR      08h
        LD      (5A7Ah),A
        LD      A,(HL)
        INC     A
        ; --- START PROC L3C35 ---
L3C35:  RET     Z
        INC     HL
        JP      L3C41+2         ; reference not aligned to instruction

L3C3A:  LD      HL,(5B1Ah)
        LD      (5EECh),HL
        POP     HL
L3C41:  LD      (5B07h),HL
        CALL    L16F7
        JP      Z,L3CFE+2       ; reference not aligned to instruction
        LD      HL,(5EECh)
        LD      (5B1Ah),HL
        LD      DE,0014h
        CALL    L51D7+2         ; reference not aligned to instruction
        LD      HL,(5B07h)
        LD      A,(HL)
        CP      9Ch
        JP      Z,L3CAC+1       ; reference not aligned to instruction
        LD      (5B03h),A
        CP      0A0h
        JP      C,L3C9B
        CP      0FEh
        JP      Z,L3CBD+1       ; reference not aligned to instruction
        CP      0A4h
        JP      Z,L3CEF+2       ; reference not aligned to instruction
        INC     HL
        LD      A,(HL)
        CP      09h
        JP      NZ,L3CD4
        CALL    L3B13
        INC     DE
        PUSH    DE
        SCF
        PUSH    AF
        PUSH    HL
L3C80:  LD      HL,(5B07h)
        LD      A,(HL)
        SUB     0A0h
        ADD     A,A
        LD      E,A
        XOR     A
        LD      D,A
        LD      HL,4270h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        POP     DE
        POP     AF
        LD      BC,3C3Ch
        PUSH    BC
        JP      (HL)

L3C99:  CP      9Fh
L3C9B:  JP      Z,L3CF8
        CP      9Bh
        JP      C,L3CD9
        JP      Z,L3CAF+2       ; reference not aligned to instruction
        CP      9Dh
        JP      Z,L3D1B+1       ; reference not aligned to instruction
        INC     HL
L3CAC:  JP      L3C41+2         ; reference not aligned to instruction

L3CAF:  CALL    L5209+1         ; reference not aligned to instruction
        CP      9Dh
        JP      Z,L3CC2
        CP      0FEh
        JP      NZ,L3CAF+2      ; reference not aligned to instruction
        INC     HL
L3CBD:  JP      L3C35

L3CC0:  INC     HL
        LD      A,(HL)
L3CC2:  CP      0FEh
        JP      NZ,L3CC2
        INC     HL
        LD      A,(HL)
        INC     A
        RET     Z
        INC     HL
        LD      (5B07h),HL
        JP      L3CAF+2         ; reference not aligned to instruction

L3CD2:  XOR     A
        PUSH    HL
L3CD4:  JP      L3C80

L3CD7:  CP      35h             ; '5'
L3CD9:  JP      Z,L3D1B+1       ; reference not aligned to instruction
        SUB     80h
        ADD     A,A
        LD      E,A
        XOR     A
        LD      D,A
        LD      HL,4254h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,3C3Ch
        PUSH    HL
        EX      DE,HL
        JP      (HL)

L3CEF:  CALL    L26F3+1         ; reference not aligned to instruction
        PUSH    HL
        JP      L3C3A+2         ; reference not aligned to instruction

L3CF6:  INC     HL
        INC     HL
L3CF8:  INC     HL
        INC     HL
        INC     HL
        JP      L3C41+2         ; reference not aligned to instruction

L3CFE:  CALL    L172E
        LD      HL,(5B07h)
        LD      (5B39h),HL
        LD      HL,3D13h
        CALL    L17F3
        JP      L344F+2         ; reference not aligned to instruction

L3D10:  XOR     E
        LD      B,D
        LD      D,D
        LD      B,L
        LD      B,C
        LD      C,E
        JR      NZ,L3D61
        LD      C,(HL)
        AND     B
        PUSH    DE
L3D1B:  LD      HL,(5B07h)
        INC     HL
        LD      A,(HL)
L3D20:  CP      0FEh
        JP      NZ,L3D20
        INC     HL
        POP     DE
        JP      L3C35

L3D2A:  LD      HL,(5EECh)
        LD      (5EEAh),HL
        CALL    L3563+2         ; reference not aligned to instruction
        PUSH    HL
        PUSH    AF
        XOR     A
        LD      (L59E4),A
        CALL    L3538
        LD      A,(HL)
        CP      02h
        JP      Z,L3D52
        CP      04h
        JP      Z,L3E03
        AND     A
        LD      B,31h           ; '1'
        CALL    Z,L2833+1       ; reference not aligned to instruction
        CALL    L2832
        INC     HL
        LD      E,(HL)
L3D52:  INC     HL
        LD      D,(HL)
        LD      A,D
        OR      E
        LD      B,18h
        CALL    Z,L2833+1       ; reference not aligned to instruction
        EX      DE,HL
        LD      A,(HL)
        AND     0Eh
        CP      02h
L3D61:  JP      NZ,L3DA6
        POP     AF
        JP      NC,L3D88
        POP     DE
        PUSH    DE
        LD      A,(DE)
        CP      80h
        LD      B,32h           ; '2'
        JP      NZ,L472C+2      ; reference not aligned to instruction
        LD      A,(5B03h)
        CP      0A7h
        LD      B,32h           ; '2'
        CALL    NZ,L2833+1      ; reference not aligned to instruction
        EX      DE,HL
        POP     BC
        CALL    L0821
        EX      DE,HL
        LD      (5B27h),HL
        RET

L3D86:  EX      DE,HL
        POP     HL
L3D88:  LD      A,(DE)
L3D89:  RRA
        JP      NC,L3D9C+2      ; reference not aligned to instruction
        LD      A,(HL)
        RRA
        JP      C,L3D9C+2       ; reference not aligned to instruction
        PUSH    DE
        LD      DE,5A0Eh
        PUSH    DE
        CALL    L11F9+1         ; reference not aligned to instruction
        POP     HL
        POP     DE
L3D9C:  CALL    L0824
        EX      DE,HL
        LD      (5B27h),HL
        RET

L3DA4:  CP      08h
L3DA6:  JP      NZ,L3DF1
        POP     AF
        LD      B,33h           ; '3'
        CALL    NC,L3E26+2      ; reference not aligned to instruction
        INC     HL
        INC     HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        PUSH    DE
L3DB7:  CALL    L3B0B
        POP     HL
        EX      (SP),HL
L3DBC:  LD      A,(L59E4)
        AND     A
        JP      Z,L3DCC+2       ; reference not aligned to instruction
        LD      HL,(5B0Dh)
        LD      (5EECh),HL
        LD      HL,(L59FE)
L3DCC:  CALL    L089B
        EX      (SP),HL
        EX      DE,HL
        DEC     DE
        LD      A,81h
        PUSH    HL
        LD      HL,(5EECh)
        EX      (SP),HL
        PUSH    HL
        LD      HL,(5EEAh)
        LD      (5EECh),HL
        POP     HL
        PUSH    HL
        CALL    L37DD
        POP     BC
        EX      DE,HL
        POP     HL
        LD      (5EECh),HL
        POP     HL
        JP      L0827

L3DEF:  LD      A,(HL)
        INC     A
L3DF1:  CALL    NZ,L2832
        POP     AF
        JP      NC,L3D88
        LD      (HL),08h
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        JP      L3DBC+1         ; reference not aligned to instruction

L3E01:  INC     HL
        LD      A,(HL)
L3E03:  CP      04h
        JP      NZ,L3E16+1      ; reference not aligned to instruction
        POP     AF
        LD      B,32h           ; '2'
        JP      C,L472C+2       ; reference not aligned to instruction
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        JP      L3D89

L3E15:  POP     AF
L3E16:  LD      B,33h           ; '3'
        CALL    NC,L3E26+2      ; reference not aligned to instruction
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        JP      L3DB7

L3E26:  LD      A,(5B03h)
        CP      0A7h
        LD      (L59E4),A
        RET     Z
        CP      0A0h
        RET     Z
        CALL    L2833+1         ; reference not aligned to instruction
        PUSH    AF
        LD      A,(5A7Ah)
        OR      10h
        AND     0DFh
L3E3D:  LD      (5A7Ah),A
        LD      A,05h
        LD      (5A79h),A
        POP     AF
        JP      L3E94

L3E49:  PUSH    BC
        PUSH    DE
        ; --- START PROC L3E4B ---
L3E4B:  PUSH    HL
        PUSH    AF
        LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L3E5E+1      ; reference not aligned to instruction
        POP     AF
        CALL    L1735
        POP     HL
        POP     DE
        POP     BC
        RET

L3E5D:  POP     AF
L3E5E:  CALL    L17E1+2         ; reference not aligned to instruction
        POP     HL
        POP     DE
        RET

L3E64:  PUSH    BC
        PUSH    HL
        ; --- START PROC L3E66 ---
L3E66:  CALL    L356A+1         ; reference not aligned to instruction
        EX      (SP),HL
        PUSH    AF
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
        LD      (5A05h),A
        CP      0Eh
        JP      Z,L3E7F
        CP      0Dh
        JP      NZ,L3E80
        INC     HL
        POP     AF
L3E7F:  POP     DE
L3E80:  POP     BC
        RET

L3E82:  LD      HL,07A7h
        JP      L3EDD+2         ; reference not aligned to instruction

L3E88:  PUSH    AF
L3E89:  LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
        POP     AF
        EX      DE,HL
        PUSH    HL
L3E94:  JP      NC,L3F5B+2      ; reference not aligned to instruction
        LD      A,(HL)
L3E98:  CP      09h
        JP      Z,L3F49
        CP      0Dh
        JP      Z,L3F16+1       ; reference not aligned to instruction
        CP      0Eh
        JP      Z,L3EE1+2       ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     20h             ; ' '
        JP      NZ,L3EB6+1      ; reference not aligned to instruction
        LD      A,(HL)
        CP      06h
        JP      Z,L4755
        PUSH    HL
L3EB6:  LD      A,(5A7Ah)
        AND     20h             ; ' '
        JP      NZ,L3EE8+2      ; reference not aligned to instruction
        CALL    L356A+1         ; reference not aligned to instruction
        JP      C,L3EDD+2       ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5EECh)
        LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L3F6F+1      ; reference not aligned to instruction
        LD      (HL),20h        ; ' '
        INC     HL
        EX      DE,HL
        CALL    L1459
        EX      DE,HL
        LD      (HL),0A0h
L3EDA:  LD      HL,(5EECh)
L3EDD:  CALL    L17FB
        POP     HL
L3EE1:  CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        JP      L3E98+1         ; reference not aligned to instruction

L3EE8:  CALL    L356A+1         ; reference not aligned to instruction
        JP      C,L3F02
        LD      B,06h
        LD      A,(HL)
        PUSH    HL
L3EF2:  PUSH    BC
        CALL    L18FF+2         ; reference not aligned to instruction
        POP     BC
        POP     HL
        DEC     B
        INC     HL
        JP      NZ,L3EF2
        JP      L3EE1+1         ; reference not aligned to instruction

L3F00:  PUSH    HL
        XOR     A
L3F02:  CALL    L18FF+2         ; reference not aligned to instruction
        POP     HL
        LD      A,(HL)
        PUSH    HL
L3F08:  CALL    L18FF+2         ; reference not aligned to instruction
        POP     HL
        LD      A,(HL)
        INC     HL
        AND     A
        JP      P,L3F08
        JP      L3EE1+1         ; reference not aligned to instruction

L3F15:  PUSH    HL
L3F16:  LD      A,(5A7Ah)
        AND     20h             ; ' '
        JP      NZ,L3EE1+1      ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L3E82+2      ; reference not aligned to instruction
        LD      A,(5B33h)
        LD      L,A
        LD      H,00h
        LD      E,0Eh
        CALL    L08AA
        LD      A,0Eh
        SUB     H
        JP      Z,L3EE1+1       ; reference not aligned to instruction
        LD      HL,(5EECh)
        LD      (HL),20h        ; ' '
L3F3C:  INC     HL
        DEC     A
        JP      NZ,L3F3C
        DEC     HL
        LD      (HL),0A0h
        JP      L3EDA+2         ; reference not aligned to instruction

L3F47:  DEC     HL
        LD      A,(HL)
L3F49:  CP      0Dh
        JP      Z,L3F62+1       ; reference not aligned to instruction
        CP      0Eh
        JP      Z,L3F62+1       ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     20h             ; ' '
        JP      NZ,L3F62+1      ; reference not aligned to instruction
L3F5B:  LD      HL,07A7h
        CALL    L17FB
        POP     HL
L3F62:  LD      (5EECh),HL
        LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
        RET

L3F6E:  EX      DE,HL
L3F6F:  CALL    L1459
        EX      DE,HL
        DEC     HL
        LD      A,(HL)
        OR      80h
        LD      (HL),A
        JP      L3EDA+2         ; reference not aligned to instruction

L3F7B:  CALL    NC,L2823
        PUSH    DE
        EX      DE,HL
        CALL    L3E66
        CALL    NC,L4FE8
        PUSH    HL
        EX      DE,HL
        CALL    L089B
        PUSH    HL
        CALL    L51D7+2         ; reference not aligned to instruction
        LD      HL,(5EECh)
        POP     DE
        CALL    L3762
        DEC     HL
        LD      A,(HL)
        AND     7Fh             ; ''
        LD      (HL),A
        INC     HL
        LD      (HL),80h
        INC     HL
        LD      (L59FE+4),HL    ; reference not aligned to instruction
        POP     HL
        EX      DE,HL
L3FA4:  LD      HL,(5EECh)
        EX      DE,HL
        LD      A,(DE)
        INC     DE
L3FAA:  AND     A
        JP      M,L3FA4+1       ; reference not aligned to instruction
        CP      21h             ; '!'
        JP      Z,L4008+1       ; reference not aligned to instruction
        CP      2Fh             ; '/'
        JP      Z,L4018+2       ; reference not aligned to instruction
        CP      26h             ; '&'
        JP      Z,L4052+1       ; reference not aligned to instruction
        CP      23h             ; '#'
        JP      Z,L407D
        CP      2Ah             ; '*'
        JP      Z,L4064
        CP      24h             ; '$'
        JP      Z,L4064
        CP      5Ch             ; '\'
        JP      Z,L4000
L3FD1:  CALL    L3E4B
        LD      A,(HL)
L3FD5:  CP      09h
        JP      NZ,L3FAA
        LD      A,(DE)
        INC     DE
L3FDC:  AND     A
        JP      M,L3FE7+1       ; reference not aligned to instruction
        CALL    L3E4B
        JP      L3FDC

L3FE6:  POP     HL
L3FE7:  LD      (5EECh),HL
        LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
L3FF2:  LD      A,(5A05h)
        CP      0Eh
        RET     Z
        LD      HL,07A7h
        JP      L17FB

L3FFE:  LD      A,(DE)
        INC     DE
L4000:  AND     A
        CALL    M,L2832
        JP      L3FD1+2         ; reference not aligned to instruction

L4007:  PUSH    DE
L4008:  CALL    L3E66
        CALL    NC,L4FE8
        LD      A,(DE)
        AND     7Fh             ; ''
        POP     DE
        CALL    L3E4B
        JP      L3FD5+1         ; reference not aligned to instruction

L4018:  LD      BC,0001h
        LD      A,(DE)
        INC     DE
L401D:  INC     BC
        CP      2Fh             ; '/'
        JP      NZ,L401D
        PUSH    DE
        CALL    L3E66
        CALL    NC,L4FE8
        LD      A,(DE)
L402B:  AND     7Fh             ; ''
        CALL    L3E4B
        LD      A,(DE)
        AND     A
        INC     DE
        DEC     BC
        JP      M,L4040+1       ; reference not aligned to instruction
        LD      A,B
        OR      C
        JP      NZ,L402B+1      ; reference not aligned to instruction
        JP      L405F+1         ; reference not aligned to instruction

L403F:  POP     DE
L4040:  JP      L3FA4+1         ; reference not aligned to instruction

L4043:  LD      A,20h           ; ' '
L4045:  CALL    L3E4B
        DEC     BC
        LD      A,B
        OR      C
        JP      NZ,L4045
        JP      L405F+1         ; reference not aligned to instruction

L4051:  PUSH    DE
L4052:  CALL    L3E66
        CALL    NC,L4FE8
        PUSH    HL
        EX      DE,HL
L405A:  CALL    L17FB
        POP     HL
        POP     DE
L405F:  JP      L3FD5+1         ; reference not aligned to instruction

L4062:  LD      B,A
        LD      A,(DE)
L4064:  INC     DE
        AND     A
        JP      M,L3FA4+1       ; reference not aligned to instruction
        CP      B
        JP      Z,L4075+2       ; reference not aligned to instruction
        LD      A,B
        DEC     DE
        CALL    L3E4B
        JP      L3FAA

L4075:  LD      BC,0001h
        JP      L4080+2         ; reference not aligned to instruction

L407B:  LD      A,20h           ; ' '
L407D:  LD      BC,0000h
L4080:  LD      (5A04h),A
        LD      A,(DE)
        INC     DE
L4085:  INC     C
        AND     A
        JP      M,L40BC
        CP      23h             ; '#'
        JP      Z,L4085
        CP      2Ch             ; ','
        JP      Z,L41AA+1       ; reference not aligned to instruction
        CP      2Eh             ; '.'
        JP      Z,L40A0
        CP      5Eh             ; '^'
        JP      Z,L40B0+1       ; reference not aligned to instruction
        LD      A,(DE)
        INC     DE
L40A0:  INC     B
        AND     A
        JP      M,L40BC
        CP      23h             ; '#'
        JP      Z,L40A0
        CP      5Eh             ; '^'
        JP      NZ,L40BC
        LD      A,B
L40B0:  OR      40h             ; '@'
        LD      B,A
        LD      A,(DE)
        INC     DE
L40B5:  CP      5Eh             ; '^'
        JP      Z,L40B5
        DEC     DE
        PUSH    DE
L40BC:  PUSH    BC
        LD      A,(L59BD+1)     ; reference not aligned to instruction
        LD      (L59FE+2),A     ; reference not aligned to instruction
        LD      A,B
        AND     40h             ; '@'
        JP      Z,L40D0+2       ; reference not aligned to instruction
        LD      A,B
        AND     3Fh             ; '?'
        DEC     A
        LD      (L59BD+1),A     ; reference not aligned to instruction
L40D0:  CALL    L3E66
        CALL    C,L5157
        EX      (SP),HL
        PUSH    HL
        LD      HL,(L59FE+4)    ; reference not aligned to instruction
        EX      DE,HL
        CALL    L1459
        EX      DE,HL
        LD      A,(L59FE+2)     ; reference not aligned to instruction
        LD      (L59BD+1),A     ; reference not aligned to instruction
        LD      (HL),0A0h
        INC     HL
        INC     HL
        LD      (5A06h),HL
        LD      C,14h
        LD      A,(5A04h)
        CP      24h             ; '$'
        JP      NZ,L40FB
        LD      A,20h           ; ' '
        LD      (HL),A
        INC     HL
L40FB:  DEC     C
        JP      NZ,L40FB
        LD      HL,(5A06h)
        POP     BC
        PUSH    BC
        LD      B,00h
        ADD     HL,BC
        LD      (L59FB+1),HL    ; reference not aligned to instruction
        DEC     HL
        EX      DE,HL
        LD      HL,(L59FE+4)    ; reference not aligned to instruction
        LD      A,(HL)
        INC     HL
L4111:  CP      2Eh             ; '.'
        JP      Z,L4122+1       ; reference not aligned to instruction
        AND     A
        JP      M,L4122+1       ; reference not aligned to instruction
        CP      45h             ; 'E'
        INC     B
        JP      NZ,L4111
        DEC     B
        DEC     HL
L4122:  LD      (L59FE),HL
        DEC     HL
        LD      A,B
        AND     A
        JP      Z,L414F+2       ; reference not aligned to instruction
        INC     C
        CP      C
        CALL    NC,L4711
        POP     BC
        PUSH    BC
        LD      C,A
        LD      A,B
        AND     A
        LD      B,0FFh
        JP      P,L413E
        LD      B,03h
L413C:  LD      A,(HL)
        DEC     HL
L413E:  LD      (DE),A
        DEC     DE
        DEC     C
L4141:  JP      Z,L414F+2       ; reference not aligned to instruction
        DEC     B
        JP      NZ,L413E
        LD      A,2Ch           ; ','
        LD      (DE),A
        DEC     DE
L414C:  JP      L413C

L414F:  LD      A,(5A04h)
        LD      (DE),A
        ; --- START PROC L4153 ---
L4153:  LD      HL,(L59FE)
L4156:  EX      DE,HL
        LD      HL,(L59FB+1)    ; reference not aligned to instruction
        POP     BC
        PUSH    BC
        LD      A,B
        AND     3Fh             ; '?'
        JP      Z,L4184
        LD      B,A
        LD      (HL),2Eh        ; '.'
        INC     HL
        DEC     B
        JP      Z,L4184
        LD      A,(DE)
        INC     DE
        CP      2Eh             ; '.'
        JP      NZ,L41A0
        LD      A,(DE)
        INC     DE
L4173:  AND     A
        JP      M,L41A0
        CP      45h             ; 'E'
        JP      Z,L41A0
        LD      (HL),A
        INC     HL
        DEC     B
        JP      NZ,L4173
        POP     BC
        LD      A,B
L4184:  AND     40h             ; '@'
        JP      Z,L4195
        LD      C,04h
        LD      A,(DE)
        INC     DE
L418D:  LD      (HL),A
        INC     HL
        DEC     C
        JP      NZ,L418D
        DEC     HL
        LD      A,(HL)
L4195:  OR      80h
        LD      (HL),A
        LD      HL,(5A06h)
        JP      L405A+2         ; reference not aligned to instruction

L419E:  LD      (HL),30h        ; '0'
L41A0:  INC     HL
        DEC     B
        JP      NZ,L41A0
        DEC     DE
        JP      L4184

L41A9:  LD      A,B
L41AA:  OR      80h
        LD      B,A
        JP      L4085

L41B0:  INC     L
        DEC     A
        LD      B,A
        LD      (HL),53h        ; 'S'
        LD      (HL),5Fh        ; '_'
        LD      (HL),6Dh        ; 'm'
        LD      (HL),74h        ; 't'
        LD      (HL),81h
        LD      (HL),8Ch
        LD      (HL),92h
        LD      (HL),9Dh
        LD      (HL),0B3h
        LD      (HL),00h
        SCF
        CP      L
        LD      (HL),0D9h
        LD      (HL),6Bh        ; 'k'
        SCF
        ADC     A,B
        SCF
        EX      (SP),HL
        LD      (HL),9Ch
        LD      B,L
        AND     L
        LD      B,L
        SBC     A,4Ah           ; 'J'
        CP      D
        LD      B,L
        RST     0x20
        LD      C,D
        RET     P
        LD      C,D
        EX      DE,HL
        LD      C,C
L41E0:  LD      D,4Ah           ; 'J'
        RST     0x00
        LD      B,L
        RET     NC
        LD      B,L
        RET     P
        LD      B,L
        LD      SP,HL
        LD      C,D
        DEC     B
        LD      B,(HL)
        LD      (BC),A
        LD      C,E
        DEC     L
        LD      C,D
        LD      (HL),4Ah        ; 'J'
        LD      B,L
        LD      B,(HL)
        LD      H,A
        LD      B,(HL)
        CP      E
        LD      B,(HL)
        LD      B,L
        LD      C,E
        LD      B,D
        LD      C,D
        LD      D,H
        LD      C,D
        LD      C,(HL)
        LD      C,E
        RET     NC
        LD      B,(HL)
        JP      PO,6746h
        LD      C,E
        LD      (HL),B
        LD      C,E
        OR      46h             ; 'F'
        CALL    P,6D4Bh
        LD      C,D
        POP     DE
        LD      C,E
        RET     PE
        LD      C,E
        OR      D
        LD      C,D
        LD      (BC),A
        LD      C,A
        LD      L,4Fh           ; 'O'
        LD      H,H
        LD      C,(HL)
        LD      (HL),C
        LD      C,(HL)
        LD      A,(HL)
        LD      C,(HL)
        OR      4Eh             ; 'N'
        SUB     C
        LD      C,(HL)
        OR      E
        LD      C,E
        RET     NZ
        LD      C,E
        ADD     A,C
        LD      C,E
        XOR     E
        LD      C,E
        OR      L
        LD      C,(HL)
        SBC     A,(HL)
        LD      C,(HL)
        CALL    0C44Eh
        LD      C,(HL)
        POP     HL
        LD      C,(HL)
        DEC     L
        JR      Z,L4264
L4237:  JR      Z,L4266
        JR      Z,L4268
        JR      Z,L426A
        JR      Z,L426C
        JR      Z,L426E
        JR      Z,L4270
        JR      Z,L4271+1       ; reference not aligned to instruction
        JR      Z,L4274
        JR      Z,L4276
        JR      Z,L4278
        JR      Z,L427A
        JR      Z,L427C
        JR      Z,L427E
        JR      Z,L4237+1       ; reference not aligned to instruction
        LD      D,L
        LD      H,D
        LD      D,C
        LD      H,52h           ; 'R'
        SUB     C
        LD      B,A
        LD      H,D
        LD      D,C
        ADD     A,47h           ; 'G'
        DEC     E
        DEC     A
        CP      B
        LD      D,A
        PUSH    HL
        LD      D,L
L4264:  LD      B,D
        LD      D,H
L4266:  DEC     E
        DEC     A
L4268:  SUB     C
        LD      B,A
L426A:  JR      NC,L42B4
L426C:  NOP
        LD      D,C
L426E:  EX      AF,AF'
        LD      D,L
L4270:  SCF
L4271:  LD      A,0Ah
        LD      D,C
L4274:  ADD     A,A
        LD      B,A
L4276:  ADD     A,A
        LD      B,A
L4278:  ADD     A,A
        LD      B,A
L427A:  RRCA
        LD      D,C
L427C:  LD      (HL),48h        ; 'H'
L427E:  ADD     A,A
        LD      B,A
        ADC     A,B
        LD      B,A
        JP      PO,L4D50+2      ; reference not aligned to instruction
        LD      D,(HL)
        LD      L,A
        LD      D,(HL)
        ADC     A,D
        LD      A,7Fh           ; ''
        LD      D,(HL)
        SUB     E
        LD      D,E
        OR      56h             ; 'V'
        LD      C,H
        LD      C,A
        LD      (HL),D
        LD      D,H
        POP     AF
        LD      D,H
        LD      L,B
        LD      D,A
        LD      A,(DE)
        LD      D,L
        LD      DE,0ED50h
        LD      C,A
        RST     0x38
        LD      C,A
        LD      SP,HL
        LD      C,L
        DEC     B
        LD      C,(HL)
        CPL
        LD      C,L
        RET     M
        LD      C,H
        LD      HL,(0F24Dh)
        LD      C,H
        JP      NZ,0C858h
        LD      E,B
        ADC     A,58h           ; 'X'
        SBC     A,58h           ; 'X'
L42B4:  RST     0x30
        LD      E,B
        CALL    PE,L0257+1      ; reference not aligned to instruction
        LD      E,C
        LD      A,(DE)
        LD      E,C
        ADD     A,A
        LD      B,A
        ADD     A,A
        LD      B,A
        LD      A,L
        CCF
        RET     C
        LD      E,B
        OR      (HL)
        LD      H,1Dh
        LD      E,C
        INC     SP
        LD      E,C
        SCF
        LD      E,C
        JR      NZ,L4312
        LD      D,L
        LD      D,B
        JR      NZ,L4325
        LD      D,H
        LD      B,C
        LD      D,H
        LD      B,L
        JR      NZ,L4326
        CALL    L4420
        LD      D,L
        LD      D,B
        JR      NZ,L4323
        LD      B,L
        ADD     A,0BAh
        LD      B,C
        LD      B,D
        OUT     (41h),A         ; 'A'
        LD      D,E
        JP      L5440+1         ; reference not aligned to instruction

L42EA:  ADC     A,43h           ; 'C'
        LD      C,B
        LD      D,D
        AND     H
        LD      B,E
        LD      C,A
        OUT     (45h),A         ; 'E'
        LD      E,B
        RET     NC
        LD      B,(HL)
        LD      D,D
        PUSH    BC
        LD      C,C
        LD      C,(HL)
        RET     NC
        LD      C,C
        LD      C,(HL)
        CALL    NC,L454B+1      ; reference not aligned to instruction
        LD      B,(HL)
        LD      D,H
        AND     H
        LD      C,H
        LD      B,L
        ADC     A,4Ch           ; 'L'
        LD      C,A
        RST     0x00
        LD      C,L
        LD      C,C
        LD      B,H
        AND     H
        LD      C,A
        LD      B,E
        LD      D,H
        AND     H
        LD      D,B
L4312:  LD      B,L
        LD      B,L
        BIT     2,B
        LD      C,A
        OUT     (52h),A         ; 'R'
        LD      C,C
        LD      B,A
        LD      C,B
        LD      D,H
        AND     H
        LD      D,D
        LD      C,(HL)
        CALL    NZ,L4753
L4323:  ADC     A,53h           ; 'S'
L4325:  LD      C,C
L4326:  ADC     A,53h           ; 'S'
        LD      D,B
        LD      B,C
        LD      B,E
        LD      B,L
        AND     H
        LD      D,E
        LD      D,B
        JP      L5151+2         ; reference not aligned to instruction

L4332:  JP      NC,L5452+1      ; reference not aligned to instruction
        LD      D,D
        AND     H
        LD      D,H
        LD      B,C
        JP      NZ,L4153+1      ; reference not aligned to instruction
        ADC     A,55h           ; 'U'
        LD      D,E
        JP      NC,L4156
        CALL    Z,L414C+1       ; reference not aligned to instruction
        LD      D,H
        LD      B,E
        RET     Z
        LD      C,B
        LD      B,L
        LD      E,B
        AND     H
        LD      B,E
        LD      B,C
        LD      C,H
        CALL    Z,L4F4A+2       ; reference not aligned to instruction
        JP      L4548

        ; --- START PROC L4355 ---
L4355:  RET     C
        LD      C,A
        LD      B,E
        CALL    NC,L4F45
        ADD     A,52h           ; 'R'
        LD      B,L
        LD      B,E
        LD      C,A
        LD      D,D
        CALL    NZ,L5954
        LD      D,B
        PUSH    BC
        LD      B,(HL)
        LD      C,C
        LD      C,H
        PUSH    BC
        LD      B,L
        LD      D,D
        JP      NC,L4944
        LD      D,E
        BIT     2,E
        LD      B,L
        LD      B,C
        LD      D,D
        LD      B,E
        RET     Z
        LD      B,(HL)
        LD      C,C
        LD      C,H
        LD      B,L
        LD      E,B
        LD      C,C
        LD      D,E
        LD      D,H
        OUT     (46h),A         ; 'F'
        LD      C,C
        LD      C,H
        LD      C,H
        AND     H
        LD      D,H
        LD      B,C
        LD      B,D
        OUT     (54h),A         ; 'T'
        LD      C,C
        LD      C,L
        PUSH    BC
        LD      C,H
        LD      C,A
        LD      B,E
        BIT     0,E
        LD      C,A
        LD      C,(HL)
        LD      B,E
        LD      C,B
        LD      B,C
        JP      NC,L4F42+1      ; reference not aligned to instruction
        LD      C,(HL)
        LD      D,E
        LD      D,H
        LD      B,C
        CALL    NC,L4355
        LD      B,C
        LD      D,E
        LD      B,L
        AND     H
        CP      D
        LD      B,A
        LD      C,A
        LD      D,H
        RST     0x08
        LD      D,H
        RST     0x08
        LD      D,E
        LD      D,H
        LD      B,L
        RET     NC
        LD      D,H
        LD      C,B
        LD      B,L
        ADC     A,0A7h
        CALL    C,L4F47
        LD      D,E
        LD      D,L
        JP      NZ,L4C44+1      ; reference not aligned to instruction
        LD      D,E
        PUSH    BC
        ADC     A,C
        RLCA
        DEC     L
        LD      B,C
        DEC     L
        AND     (HL)
        INC     L
        EI
        INC     L
        LD      B,B
        DEC     L
        CALL    Z,L012C
        DEC     L
        INC     B
        DEC     L
        RLCA
        DEC     L
        LD      (BC),A
        INC     L
        LD      BC,4F2Dh
        ADC     A,47h           ; 'G'
        LD      C,A
        LD      D,B
        LD      D,D
        LD      C,A
        JP      L4F46

L43E0:  JP      NC,L4F47
        LD      D,H
        RST     0x08
        LD      B,A
        LD      C,A
        LD      D,E
        LD      D,L
        JP      NZ,0C649h
        LD      D,D
        LD      B,L
        CALL    L4842+1         ; reference not aligned to instruction
        LD      B,C
        LD      C,(HL)
        LD      C,(HL)
        LD      B,L
        CALL    Z,0CE4Fh
        LD      D,D
        LD      B,L
        LD      D,E
        LD      D,H
        LD      C,A
        LD      D,D
        PUSH    BC
        LD      D,D
        LD      B,L
        LD      C,L
        LD      B,C
        LD      D,D
        BIT     2,H
        LD      C,B
        LD      B,L
        ADC     A,54h           ; 'T'
        LD      C,B
        LD      B,L
        ADC     A,4Fh           ; 'O'
        LD      C,(HL)
        JR      NZ,L4454+2      ; reference not aligned to instruction
        LD      D,D
        LD      D,D
        LD      C,A
        JP      NC,L4547
        CALL    NC,L554E+2      ; reference not aligned to instruction
        CALL    NC,L5341
        LD      D,E
        LD      C,C
        LD      B,A
        ; --- START PROC L4420 ---
L4420:  ADC     A,44h           ; 'D'
        LD      B,C
        LD      D,H
        POP     BC
        LD      B,H
        LD      B,L
        ADD     A,44h           ; 'D'
        LD      C,C
        CALL    L5242+2         ; reference not aligned to instruction
        LD      C,A
        RET     NC
        LD      C,C
        LD      C,(HL)
        LD      D,B
        LD      D,L
        CALL    NC,L4580
        LD      C,(HL)
        CALL    NZ,L454E
        LD      E,B
        CALL    NC,L554E+1      ; reference not aligned to instruction
        CALL    NC,L4F4F+1      ; reference not aligned to instruction
        LD      C,E
        PUSH    BC
        LD      D,B
        LD      D,D
        LD      C,C
        LD      C,(HL)
        CALL    NC,L524F+1      ; reference not aligned to instruction
        LD      C,A
        LD      B,E
        LD      B,L
        LD      B,H
        LD      D,L
        LD      D,D
        PUSH    BC
        LD      D,D
        LD      B,L
        LD      B,C
L4454:  CALL    NZ,L4552
        LD      B,E
        LD      B,L
        LD      C,C
        LD      D,(HL)
        PUSH    BC
        LD      B,D
        LD      D,E
        LD      B,C
        LD      D,(HL)
        PUSH    BC
        LD      D,D
        LD      B,L
        LD      D,H
        LD      D,L
        LD      D,D
        ADC     A,53h           ; 'S'
        LD      D,H
        LD      C,A
        RET     NC
        LD      D,A
        LD      B,C
        LD      C,C
        CALL    NC,L4C41+2      ; reference not aligned to instruction
        LD      B,L
        LD      B,C
        JP      NC,L4C41+1      ; reference not aligned to instruction
        LD      C,A
        LD      B,C
        CALL    NZ,L5042
        LD      D,L
        CALL    NC,L4740+2      ; reference not aligned to instruction
        LD      B,L
        CALL    NC,L504F
        LD      B,L
        ADC     A,43h           ; 'C'
        LD      C,H
        LD      C,A
        LD      D,E
        PUSH    BC
        LD      C,H
        LD      C,A
        LD      B,C
        CALL    NZ,L4153
        LD      D,(HL)
        PUSH    BC
        LD      B,C
        LD      D,B
        LD      D,B
        LD      B,L
        LD      C,(HL)
        CALL    NZ,L4842+1      ; reference not aligned to instruction
        LD      B,L
        LD      B,E
        BIT     0,H
        LD      C,C
        JP      NC,L4552
        LD      C,(HL)
        LD      B,C
        LD      C,L
        PUSH    BC
        LD      B,L
        LD      D,D
        LD      B,C
        LD      D,E
        PUSH    BC
        LD      D,D
        LD      B,L
        LD      D,E
        LD      B,L
        CALL    NC,L4F4D
        LD      D,(HL)
        LD      B,L
        LD      B,D
        LD      C,A
        ADD     A,4Dh           ; 'M'
        LD      C,A
        LD      D,(HL)
        LD      B,L
        LD      B,L
        LD      C,A
        ADD     A,57h           ; 'W'
        LD      C,C
        LD      B,H
        LD      D,H
        RET     Z
        LD      D,E
        LD      B,L
        CALL    NC,L454B+1      ; reference not aligned to instruction
        CALL    NC,L5354+1      ; reference not aligned to instruction
        LD      C,C
        LD      C,(HL)
        RST     0x00
        LD      D,B
        LD      D,D
        LD      C,C
        LD      C,(HL)
        LD      D,H
        JR      NZ,L452A
        LD      D,E
        LD      C,C
        LD      C,(HL)
        RST     0x00
        LD      B,E
        LD      C,H
        LD      C,A
        LD      D,E
        LD      B,L
        LD      B,C
        LD      C,H
        CALL    Z,L5942
        PUSH    BC
        LD      B,C
        CALL    NC,L4C41+2      ; reference not aligned to instruction
        OUT     (46h),A         ; 'F'
        LD      C,H
        LD      D,L
        LD      D,E
        RET     Z
        LD      B,E
        LD      C,A
        LD      C,(HL)
        CALL    NC,L4544
        LD      C,H
        LD      B,L
        LD      D,H
        PUSH    BC
        LD      B,L
        LD      C,(HL)
        LD      D,H
        LD      B,L
        JP      NC,L494C
        LD      D,E
        CALL    NC,L454E
        RST     0x10
        LD      D,D
        LD      D,L
        ADC     A,45h           ; 'E'
        LD      B,H
        LD      C,C
        CALL    NC,L5951+2      ; reference not aligned to instruction
        LD      C,L
        LD      B,D
        LD      C,A
        CALL    Z,L4842+1       ; reference not aligned to instruction
        LD      B,C
        LD      C,(HL)
        LD      B,A
        PUSH    BC
        CP      D
        RST     0x28
        INC     SP
        LD      L,33h           ; '3'
        RET     P
        LD      (L327A+2),A     ; reference not aligned to instruction
        ADD     HL,BC
        INC     (HL)
        SBC     A,B
        INC     SP
        DEC     E
        LD      D,L
        DEC     L
        ADD     HL,HL
        INC     SP
L452A:  RET     P
        LD      (0A4A3h),A
        AND     L
        XOR     B
        XOR     (HL)
        RST     0x00
        NOP
        LD      C,A
        JP      NC,L4E41
        CALL    NZ,L4F4D+1      ; reference not aligned to instruction
        CALL    NC,0BD3Eh
        INC     A
        CP      L
        CP      (HL)
        CP      H
        INC     A
        CP      (HL)
        CP      L
        ; --- START PROC L4544 ---
L4544:  XOR     L
        XOR     E
        XOR     A
L4547:  XOR     D
L4548:  XOR     L
        LD      C,(HL)
        LD      C,A
L454B:  CALL    NC,0A8DEh
        ; --- START PROC L454E ---
L454E:  XOR     C
        DEC     A
        CP      (HL)
        DEC     A
        ; --- START PROC L4552 ---
L4552:  CP      H
        LD      A,0BCh
L4555:  CALL    L5151+2         ; reference not aligned to instruction
        EX      DE,HL
L4559:  LD      HL,(5EECh)
        LD      (HL),00h
        INC     HL
        EX      DE,HL
        RET

L4561:  CALL    L4FE2+2         ; reference not aligned to instruction
        JP      L4559+1         ; reference not aligned to instruction

L4567:  CALL    L4555+2         ; reference not aligned to instruction
        PUSH    HL
        PUSH    DE
        CALL    L4720+2         ; reference not aligned to instruction
        POP     DE
        POP     HL
        DEC     DE
        RET

L4573:  PUSH    BC
        PUSH    DE
        ; --- START PROC L4575 ---
L4575:  PUSH    HL
        LD      DE,0004h
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     HL
        POP     DE
        POP     BC
        RET

        ; --- START PROC L4580 ---
L4580:  CALL    L4555+2         ; reference not aligned to instruction
        PUSH    DE
        CALL    L162F
        POP     DE
        RET

L4589:  CALL    L4555+2         ; reference not aligned to instruction
        PUSH    DE
        CALL    L1620
        POP     DE
        RET

L4592:  INC     HL
L4593:  LD      (HL),01h
        INC     HL
        LD      (5EECh),HL
        RET

L459A:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L12C9
        JP      L3612+2         ; reference not aligned to instruction

L45A3:  CALL    L4561+2         ; reference not aligned to instruction
        LD      A,(HL)
        AND     7Fh             ; ''
        LD      L,A
        LD      H,00h
L45AC:  CALL    L167E
        JP      L3612+2         ; reference not aligned to instruction

L45B2:  CALL    L167A
        JP      L3612+2         ; reference not aligned to instruction

L45B8:  CALL    L4580+2         ; reference not aligned to instruction
        INC     H
        DEC     H
        CALL    NZ,L3596
        LD      A,L
        LD      (DE),A
        JP      L4BA3

L45C5:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L122F
        JP      L3612+2         ; reference not aligned to instruction

L45CE:  CALL    L4714+2         ; reference not aligned to instruction
        PUSH    BC
        POP     BC
        LD      A,B
L45D4:  OR      C
        JP      Z,L45EA
        LD      A,(HL)
        LD      (DE),A
L45DA:  AND     A
        JP      M,L45E8+1       ; reference not aligned to instruction
        DEC     BC
        INC     HL
        INC     DE
        LD      A,B
        OR      C
        JP      NZ,L45DA
        DEC     DE
        LD      A,(DE)
L45E8:  OR      80h
L45EA:  LD      (DE),A
        JP      L4BA3

L45EE:  CALL    L4561+2         ; reference not aligned to instruction
        PUSH    DE
        LD      DE,0000h
        LD      A,(HL)
        CP      80h
        JP      Z,L4600
        CALL    L089B
        EX      DE,HL
        POP     DE
L4600:  JP      L45B2+2         ; reference not aligned to instruction

L4603:  CALL    L4567+2         ; reference not aligned to instruction
        CALL    L162F
        PUSH    HL
        CALL    L3563+2         ; reference not aligned to instruction
        JP      C,L462A+2       ; reference not aligned to instruction
        CALL    L162F
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L4561+2         ; reference not aligned to instruction
        POP     BC
        DEC     BC
L461C:  LD      A,B
L461D:  OR      C
        JP      Z,L45D4
        LD      A,(HL)
        AND     A
        JP      M,L463D+1       ; reference not aligned to instruction
        INC     HL
        JP      L461D

L462A:  LD      DE,0FFFFh
        POP     BC
        PUSH    DE
        PUSH    BC
        PUSH    HL
        LD      HL,(5EECh)
        LD      (HL),00h
        INC     HL
        EX      DE,HL
        POP     HL
        JP      L461C

L463C:  POP     BC
L463D:  LD      A,0A0h
        LD      (DE),A
        JP      L4BA3

L4643:  CALL    L4714+2         ; reference not aligned to instruction
        LD      A,B
        OR      C
        JP      Z,L45EA
        PUSH    DE
        CALL    L089B
        ADD     HL,DE
        DEC     HL
        POP     DE
        LD      A,(HL)
        AND     A
L4654:  JP      Z,L465F+1       ; reference not aligned to instruction
        DEC     BC
        LD      A,C
        OR      B
        DEC     HL
        JP      NZ,L4654
        INC     HL
L465F:  LD      BC,0FFFFh
        JP      L45DA

L4665:  CALL    L4555+2         ; reference not aligned to instruction
        PUSH    DE
        LD      A,(HL)
        AND     A
        JP      M,L46A7+2       ; reference not aligned to instruction
        CALL    L15A7
        JP      Z,L468A+1       ; reference not aligned to instruction
L4674:  LD      DE,5B14h
        LD      HL,46C4h
        CALL    L0CC5
        LD      HL,595Ah
        LD      DE,5B16h
        LD      BC,0004h
        CALL    L0827
        POP     BC
L468A:  LD      DE,46CAh
        LD      HL,5B14h
        CALL    L28CB+2         ; reference not aligned to instruction
        LD      HL,(5EECh)
        INC     HL
        INC     HL
        INC     HL
        LD      A,(HL)
        INC     HL
        ADD     A,(HL)
        DAA
        INC     HL
        ADD     A,(HL)
        DAA
        INC     HL
        ADD     A,(HL)
        DAA
        LD      (HL),A
        JP      L3612+2         ; reference not aligned to instruction

L46A7:  LD      DE,5B14h
        CALL    L12C9
        LD      HL,5B14h
        LD      DE,5B14h
        CALL    L122F
        JP      L4674+2         ; reference not aligned to instruction

L46B9:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L129D
        JP      L3612+2         ; reference not aligned to instruction

L46C2:  LD      (BC),A
        NOP
        NOP
        NOP
        LD      (HL),L
        LD      A,C
        INC     BC
        EX      AF,AF'
        DJNZ    L46CC
L46CC:  NOP
        NOP
        CALL    L4555+2         ; reference not aligned to instruction
        CALL    L4575
        CALL    L1459
        DEC     DE
        EX      DE,HL
        LD      A,(HL)
        OR      80h
        LD      (HL),A
        JP      L4593+1         ; reference not aligned to instruction

L46E0:  CALL    L4580+2         ; reference not aligned to instruction
        LD      A,H
        AND     A
        CALL    NZ,L3596
        EX      DE,HL
        LD      HL,(5EECh)
        LD      (HL),06h
        INC     HL
        LD      (HL),00h
        JP      L4A63

L46F4:  CALL    L4561+2         ; reference not aligned to instruction
        PUSH    DE
        LD      A,(HL)
L46F9:  CP      20h             ; ' '
        JP      NZ,L4702+2      ; reference not aligned to instruction
        INC     HL
        JP      L46F9+1         ; reference not aligned to instruction

L4702:  CALL    L12D4+1         ; reference not aligned to instruction
        POP     DE
        JP      NC,L3612+2      ; reference not aligned to instruction
L4709:  CALL    L0821
        JP      L3612+2         ; reference not aligned to instruction

L470F:  LD      B,01h
        ; --- START PROC L4711 ---
L4711:  JP      L2833+1         ; reference not aligned to instruction

L4714:  CALL    L4589+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L4561+2         ; reference not aligned to instruction
        POP     BC
        RET

L4720:  CALL    L3538
        LD      A,(HL)
L4724:  CP      0Dh
        ; --- START PROC L4726 ---
L4726:  RET     Z
        LD      B,25h           ; '%'
        CALL    L2833+1         ; reference not aligned to instruction
L472C:  LD      A,(5B03h)
        CP      0A7h
        CALL    NZ,L2833+1      ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     10h
        CALL    NZ,L2833+1      ; reference not aligned to instruction
        POP     HL
        LD      HL,4748h
L4740:  CALL    L17F3
        JP      L484F+2         ; reference not aligned to instruction

L4746:  DEC     C
        LD      C,C
        LD      C,(HL)
        LD      D,B
        LD      D,L
        LD      D,H
        JR      NZ,L4793
        LD      D,D
        LD      D,D
        LD      C,A
        LD      D,D
        ADC     A,L
        ; --- START PROC L4753 ---
L4753:  PUSH    HL
        INC     HL
L4755:  LD      A,(HL)
        AND     A
        JP      NZ,L4781
        INC     HL
        LD      B,(HL)
        LD      A,(5B33h)
        INC     B
        CP      B
        DEC     B
        JP      C,L476A+2       ; reference not aligned to instruction
        PUSH    BC
        CALL    L172E
        POP     BC
L476A:  LD      A,(5B33h)
        SUB     B
        CPL
        INC     A
        DEC     A
L4771:  JP      M,L3EE1+1       ; reference not aligned to instruction
        LD      HL,4786h
        PUSH    AF
        CALL    L17FB
        POP     AF
        JP      L4771+1         ; reference not aligned to instruction

L477F:  INC     HL
        LD      A,(HL)
        ; --- START PROC L4781 ---
L4781:  JP      L4771+1         ; reference not aligned to instruction

L4784:  AND     B
        RET

L4786:  LD      HL,(5B07h)
        LD      (5B39h),HL
        JP      L0717

L478F:  LD      HL,(5B07h)
        INC     HL
L4793:  INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        PUSH    BC
        INC     HL
        INC     HL
        LD      DE,0000h
        LD      A,(HL)
        CP      08h
        JP      NZ,L47AB+1      ; reference not aligned to instruction
        INC     HL
        CALL    L3B13
        CALL    L47B2+2         ; reference not aligned to instruction
        POP     BC
L47AB:  CALL    L31D5
        EX      DE,HL
        POP     HL
        PUSH    DE
        JP      (HL)

L47B2:  LD      (5EECh),HL
        CALL    L356A+1         ; reference not aligned to instruction
        CALL    C,L3596
        LD      A,(HL)
        AND     A
        PUSH    AF
        CALL    L162F
        POP     AF
        EX      DE,HL
        RET

L47C4:  LD      HL,(5B07h)
        INC     HL
        CALL    L3B13
        CALL    L356A+1         ; reference not aligned to instruction
        LD      B,40h           ; '@'
        CALL    C,L2833+1       ; reference not aligned to instruction
        CALL    L162F
        INC     HL
        LD      A,H
        OR      L
        JP      Z,L4801+2       ; reference not aligned to instruction
        DEC     HL
        LD      A,H
        OR      L
        LD      B,40h           ; '@'
        CALL    NZ,L2833+1      ; reference not aligned to instruction
L47E4:  CALL    L26F3+1         ; reference not aligned to instruction
        LD      A,(HL)
        CP      0FEh
        JP      Z,L4806
        CP      0FFh
        JP      Z,L4806
        CP      85h
        JP      Z,L4813+2       ; reference not aligned to instruction
        CP      9Dh
        JP      Z,L4808
        CP      9Bh
        JP      NZ,L47E4+2      ; reference not aligned to instruction
L4801:  CALL    L26F3+1         ; reference not aligned to instruction
        EX      (SP),HL
        JP      (HL)

L4806:  INC     HL
        LD      A,(HL)
L4808:  CP      0FEh
        JP      NZ,L4808
        LD      (5B07h),HL
        JP      L47E4+2         ; reference not aligned to instruction

L4813:  CALL    L26F3+1         ; reference not aligned to instruction
        LD      A,(HL)
        CP      0FEh
        JP      Z,L4806
        CP      9Dh
        JP      NZ,L4813+2      ; reference not aligned to instruction
        INC     HL
        LD      A,(HL)
L4823:  CP      0FEh
        JP      NZ,L4823
        LD      (5B07h),HL
        JP      L4813+2         ; reference not aligned to instruction

L482E:  LD      HL,(5B07h)
        INC     HL
        EX      (SP),HL
        JP      (HL)

L4834:  PUSH    AF
        LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
        POP     AF
L483E:  CALL    NC,L2823
        EX      DE,HL
L4842:  LD      (L59BF+1),HL    ; reference not aligned to instruction
        LD      HL,(5EECh)
        LD      (L59C5+1),HL    ; reference not aligned to instruction
        XOR     A
        LD      (5B02h),A
L484F:  LD      HL,(L59BF+1)    ; reference not aligned to instruction
        LD      (5B0Bh),HL
        LD      HL,(L59C5+1)    ; reference not aligned to instruction
        LD      (5EECh),HL
        LD      (5B0Dh),HL
L485E:  LD      HL,(5B0Bh)
        LD      A,(HL)
        AND     A
        JP      Z,L49A8+1       ; reference not aligned to instruction
        CP      0Dh
        JP      Z,L49B8+2       ; reference not aligned to instruction
        CP      0Eh
        JP      Z,L49B8+2       ; reference not aligned to instruction
        CP      09h
        JP      Z,L4902+1       ; reference not aligned to instruction
        CP      02h
        JP      Z,L499F
L487A:  LD      HL,(5B0Dh)
        EX      DE,HL
        LD      HL,(5EECh)
        CALL    L07B1
        JP      NZ,L497C+2      ; reference not aligned to instruction
        LD      A,(5B02h)
        AND     A
        JP      NZ,L48A4+2      ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     20h             ; ' '
        JP      NZ,L48A4+2      ; reference not aligned to instruction
        LD      HL,49D2h
        LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L48A4+2      ; reference not aligned to instruction
        CALL    L17F3
L48A4:  LD      A,(5A7Ah)
        AND     20h             ; ' '
        JP      NZ,L492F+2      ; reference not aligned to instruction
        LD      HL,5C0Eh
        LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L48BA+2      ; reference not aligned to instruction
        LD      HL,5E02h
L48BA:  LD      (L59FE),HL
        PUSH    HL
        CALL    L1823
        POP     HL
        JP      NC,L48CC+1      ; reference not aligned to instruction
        LD      (HL),80h
        INC     HL
        LD      (HL),00h
        DEC     HL
        XOR     A
L48CC:  LD      (5B02h),A
        LD      A,(HL)
        CP      03h
        JP      NZ,L48DC+1      ; reference not aligned to instruction
        CALL    L3CFE+2         ; reference not aligned to instruction
        JP      L0717

L48DB:  PUSH    HL
L48DC:  CALL    L49C5+2         ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5EECh)
        INC     HL
        EX      DE,HL
        CALL    L12D4+1         ; reference not aligned to instruction
        JP      C,L490F+1       ; reference not aligned to instruction
        EX      (SP),HL
        CALL    L3612+2         ; reference not aligned to instruction
        POP     HL
        DEC     HL
        LD      A,(HL)
        AND     A
        JP      M,L485E+2       ; reference not aligned to instruction
        INC     HL
        LD      A,(HL)
        CP      2Ch             ; ','
        INC     HL
        JP      Z,L48DC+1       ; reference not aligned to instruction
        JP      L485E+2         ; reference not aligned to instruction

L4901:  XOR     A
L4902:  LD      (5A94h),A
        LD      A,(5A7Ah)
        AND     0CFh
        LD      (5A7Ah),A
        RET

L490E:  POP     HL
L490F:  CALL    L089B
        LD      C,E
        LD      B,D
        INC     DE
        INC     DE
        CALL    L49CA
        EX      DE,HL
        LD      HL,(5EECh)
        LD      (HL),00h
        INC     HL
        EX      DE,HL
        CALL    L0827
        EX      DE,HL
        ADD     HL,BC
        LD      (HL),01h
        INC     HL
        LD      (5EECh),HL
        JP      L485E+2         ; reference not aligned to instruction

L492F:  CALL    L1922
        AND     A
        LD      HL,(5EECh)
        JP      Z,L495C+1       ; reference not aligned to instruction
        PUSH    AF
        CALL    L49C5+2         ; reference not aligned to instruction
        POP     AF
        LD      (HL),04h
        INC     HL
        LD      (HL),A
        LD      B,05h
        ; --- START PROC L4944 ---
L4944:  INC     HL
        PUSH    HL
        PUSH    BC
        ; --- START PROC L4947 ---
L4947:  CALL    L1922
        POP     BC
        POP     HL
        ; --- START PROC L494C ---
L494C:  LD      (HL),A
        INC     HL
        DEC     B
        JP      NZ,L4947
        LD      (HL),05h
        INC     HL
        LD      (5EECh),HL
        JP      L485E+2         ; reference not aligned to instruction

L495B:  PUSH    AF
L495C:  CALL    L49D2+1         ; reference not aligned to instruction
        POP     AF
        LD      (HL),A
        INC     HL
        PUSH    HL
        DEC     DE
L4964:  LD      A,D
        OR      E
        CALL    Z,L49D2+1       ; reference not aligned to instruction
        CALL    L1922
        POP     HL
        LD      (HL),A
        INC     HL
        AND     A
        JP      P,L4964
        LD      (HL),01h
        INC     HL
        LD      (5EECh),HL
        JP      L485E+2         ; reference not aligned to instruction

L497C:  LD      HL,(5B0Bh)
        CALL    L26B8+2         ; reference not aligned to instruction
        ADD     HL,DE
        LD      (5B0Bh),HL
        LD      HL,(5B0Dh)
        CALL    L26B8+2         ; reference not aligned to instruction
        ADD     HL,DE
        LD      (5B0Dh),HL
        LD      A,(5A94h)
        AND     A
        JP      NZ,L485E+2      ; reference not aligned to instruction
        CALL    L3D2A+2         ; reference not aligned to instruction
        JP      L485E+2         ; reference not aligned to instruction

L499D:  INC     HL
        LD      E,(HL)
L499F:  INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      A,(HL)
        AND     A
        JP      NZ,L487A+2      ; reference not aligned to instruction
        INC     HL
L49A8:  LD      A,(5A7Ah)
        AND     10h
        JP      NZ,L49B8+2      ; reference not aligned to instruction
        CALL    L17F3
        LD      A,0FFh
        LD      (5B02h),A
L49B8:  LD      HL,(5B0Bh)
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      (5B0Bh),HL
        JP      L485E+2         ; reference not aligned to instruction

L49C5:  LD      DE,0008h
        PUSH    BC
        PUSH    HL
        ; --- START PROC L49CA ---
L49CA:  CALL    L51D7+2         ; reference not aligned to instruction
        POP     HL
        POP     BC
        RET

L49D0:  CP      A
        PUSH    HL
L49D2:  LD      DE,01F4h
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(5A9Ah)
        CALL    L07A9
        JP      NC,L49E9
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     HL
        JP      L49D2+1         ; reference not aligned to instruction

L49E7:  POP     HL
        RET

L49E9:  CALL    L3563+2         ; reference not aligned to instruction
        JP      C,L49FA+2       ; reference not aligned to instruction
        CALL    L162F
        LD      A,H
        OR      L
        JP      NZ,L49FA+2      ; reference not aligned to instruction
        CALL    L383A+2         ; reference not aligned to instruction
L49FA:  LD      HL,(5EECh)
        EX      DE,HL
        LD      HL,(5A9Ah)
        CALL    L07A9
        INC     DE
        PUSH    DE
        LD      DE,0FE0Ch
        ADD     HL,DE
        JP      C,L4A11+1       ; reference not aligned to instruction
        LD      HL,0000h
        POP     DE
L4A11:  JP      L45B2+2         ; reference not aligned to instruction

L4A14:  CALL    L4580+2         ; reference not aligned to instruction
        LD      A,H
        AND     A
        CALL    NZ,L3596
        LD      H,L
        LD      L,0DBh
        LD      (5B11h),HL
        CALL    5B11h
        LD      L,A
        LD      H,00h
        JP      L45AC+2         ; reference not aligned to instruction

L4A2B:  CALL    L4589+2         ; reference not aligned to instruction
        LD      L,(HL)
        LD      H,00h
        JP      L45AC+2         ; reference not aligned to instruction

L4A34:  CALL    L3538
        LD      A,(5B33h)
        LD      E,A
        LD      D,00h
        JP      L4F3A+2         ; reference not aligned to instruction

L4A40:  CALL    L4589+2         ; reference not aligned to instruction
        PUSH    BC
        PUSH    DE
        PUSH    HL
        EX      DE,HL
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     HL
        POP     DE
        POP     BC
        LD      B,20h           ; ' '
        JP      L4B93

L4A52:  CALL    L4580+2         ; reference not aligned to instruction
        EX      DE,HL
        CALL    L4575
        LD      HL,(5EECh)
        LD      (HL),06h
        INC     HL
        LD      (HL),01h
        INC     HL
        LD      (HL),E
L4A63:  INC     HL
        LD      (HL),07h
        INC     HL
        LD      (5EECh),HL
        RET

L4A6B:  CALL    L4589+2         ; reference not aligned to instruction
        XOR     A
        LD      (L5946),A
        LD      B,04h
        XOR     A
L4A75:  LD      C,04h
        ADD     HL,HL
        RLA
L4A79:  DEC     C
        JP      NZ,L4A79
        AND     A
        JP      Z,L4A9C+2       ; reference not aligned to instruction
        ADD     A,30h           ; '0'
L4A83:  LD      (L5946),A
        CP      3Ah             ; ':'
        JP      C,L4A8F
        ADD     A,07h
        LD      (DE),A
        INC     DE
L4A8F:  DEC     B
L4A90:  JP      NZ,L4A75+1      ; reference not aligned to instruction
        EX      DE,HL
        DEC     HL
        LD      A,(HL)
        OR      80h
        LD      (HL),A
        JP      L4593+1         ; reference not aligned to instruction

L4A9C:  LD      A,(L5946)
        AND     A
        LD      A,00h
        JP      NZ,L4A83
        LD      A,B
        CP      01h
        LD      A,00h
        JP      Z,L4A83
        JP      L4A90+1         ; reference not aligned to instruction

L4AB0:  CALL    L4FE2+2         ; reference not aligned to instruction
        LD      DE,0000h
        PUSH    DE
        LD      A,(HL)
L4AB8:  AND     7Fh             ; ''
        SUB     30h             ; '0'
        CALL    C,L2832
        CP      0Ah
        JP      C,L4ACD
        SUB     07h
        CP      10h
        CALL    NC,L2832
        EX      (SP),HL
        ADD     HL,HL
L4ACD:  ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        OR      L
        LD      L,A
        EX      (SP),HL
        LD      A,(HL)
        AND     A
        INC     HL
        JP      P,L4AB8+1       ; reference not aligned to instruction
        JP      L4F24+1         ; reference not aligned to instruction

L4ADC:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L1A4B+1         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L4AE5:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L1A2B
        JP      L3612+2         ; reference not aligned to instruction

L4AEE:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L1BAB
        JP      L3612+2         ; reference not aligned to instruction

L4AF7:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L1C6C+1         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L4B00:  CALL    L4575
        CALL    L4589+2         ; reference not aligned to instruction
        DEC     DE
        LD      C,01h
        LD      B,00h
        JP      L4B12

L4B0E:  LD      C,03h
L4B10:  XOR     A
        ADD     HL,HL
L4B12:  RLA
L4B13:  DEC     C
        JP      NZ,L4B13
        INC     B
        AND     A
        JP      NZ,L4B22+1      ; reference not aligned to instruction
        DEC     B
        INC     B
        JP      P,L4B2A+1       ; reference not aligned to instruction
        INC     DE
L4B22:  OR      30h             ; '0'
        LD      (DE),A
        LD      A,B
        OR      80h
        LD      B,A
        LD      A,B
L4B2A:  AND     7Fh             ; ''
        CP      06h
        JP      NZ,L4B10
        EX      DE,HL
        LD      A,B
        CP      06h
        JP      NZ,L4B3D+1      ; reference not aligned to instruction
        INC     HL
        LD      A,30h           ; '0'
        LD      (HL),A
        LD      A,(HL)
L4B3D:  OR      80h
        LD      (HL),A
        JP      L4593+1         ; reference not aligned to instruction

L4B43:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L1A00
        JP      L3612+2         ; reference not aligned to instruction

L4B4C:  CALL    L4555+2         ; reference not aligned to instruction
        LD      A,(HL)
        AND     01h
        JP      NZ,L4B5F+2      ; reference not aligned to instruction
        PUSH    DE
        LD      DE,594Ch
        PUSH    DE
        CALL    L11F9+1         ; reference not aligned to instruction
        POP     HL
        POP     DE
L4B5F:  CALL    L1199+1         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L4B65:  CALL    L4555+2         ; reference not aligned to instruction
        CALL    L1A32+1         ; reference not aligned to instruction
        JP      L3612+2         ; reference not aligned to instruction

L4B6E:  CALL    L4589+2         ; reference not aligned to instruction
        EX      DE,HL
        PUSH    HL
        LD      HL,(5A54h)
        CALL    L4B7F+1         ; reference not aligned to instruction
        EX      DE,HL
        POP     DE
        JP      L45B2+2         ; reference not aligned to instruction

L4B7E:  JP      (HL)

L4B7F:  CALL    L4714+2         ; reference not aligned to instruction
        PUSH    HL
        PUSH    DE
        PUSH    BC
        LD      D,B
        LD      E,C
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     HL
        POP     DE
        POP     BC
        LD      A,(BC)
        AND     7Fh             ; ''
        LD      B,A
        LD      A,H
        OR      L
L4B93:  LD      (DE),A
        JP      Z,L4BA3
        LD      A,B
        LD      (DE),A
L4B99:  INC     DE
        DEC     HL
        LD      A,H
        OR      L
        JP      NZ,L4B99
        DEC     DE
        EX      DE,HL
        LD      A,(HL)
L4BA3:  OR      80h
        LD      (HL),A
        JP      L4593+1         ; reference not aligned to instruction

L4BA9:  CALL    L4589+2         ; reference not aligned to instruction
        LD      A,L
        LD      (5B3Bh),A
        RET

L4BB1:  LD      HL,(5A67h)
        LD      DE,4BBCh
        JP      L4BC6

L4BBA:  EX      DE,HL
        JP      L45B2+2         ; reference not aligned to instruction

L4BBE:  LD      HL,(5A69h)
        LD      DE,4BCDh
        PUSH    DE
        PUSH    HL
L4BC6:  CALL    L4561+2         ; reference not aligned to instruction
        EX      DE,HL
        RET

L4BCB:  EX      DE,HL
        JP      L45AC+2         ; reference not aligned to instruction

L4BCF:  CALL    L4589+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L4589+2         ; reference not aligned to instruction
        EX      DE,HL
        EX      (SP),HL
        EX      DE,HL
        LD      BC,4BE3h
        PUSH    BC
        JP      (HL)

L4BE1:  POP     HL
        EX      DE,HL
        JP      L45B2+2         ; reference not aligned to instruction

L4BE6:  CALL    L3563+2         ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5EECh)
        EX      DE,HL
        INC     DE
        JP      L45B2+2         ; reference not aligned to instruction

L4BF2:  CALL    L4567+2         ; reference not aligned to instruction
        CALL    L162F
        PUSH    HL
        CALL    L4FE2+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L4FE2+2         ; reference not aligned to instruction
        CALL    L4C41
        POP     DE
        EX      (SP),HL
        LD      A,H
        OR      L
        CALL    Z,L2832
        PUSH    HL
        EX      DE,HL
        CALL    L089B
        EX      (SP),HL
        INC     DE
        CALL    L07B1
        CALL    NC,L2832
        PUSH    HL
        POP     BC
        POP     HL
        DEC     BC
        ADD     HL,BC
        INC     BC
        POP     DE
L4C21:  CALL    L4C90
        JP      Z,L4C3B
        LD      A,(HL)
        AND     A
        JP      M,L4C31+2       ; reference not aligned to instruction
        INC     BC
        INC     HL
        JP      L4C21+2         ; reference not aligned to instruction

L4C31:  LD      HL,(5EECh)
        EX      DE,HL
        INC     DE
        JP      L4709+2         ; reference not aligned to instruction

L4C39:  LD      L,C
        LD      H,B
L4C3B:  EX      DE,HL
        JP      L4F3A+2         ; reference not aligned to instruction

L4C3F:  EX      DE,HL
        PUSH    DE
        ; --- START PROC L4C41 ---
L4C41:  LD      DE,0200h
L4C44:  CALL    L51D7+2         ; reference not aligned to instruction
        POP     DE
L4C48:  LD      HL,(5A9Ah)
        DEC     H
        DEC     H
        LD      C,00h
        PUSH    HL
        LD      A,(DE)
L4C51:  AND     7Fh             ; ''
        CP      5Ch             ; '\'
        JP      Z,L4C7C
        CP      3Fh             ; '?'
        JP      Z,L4C86
        CP      21h             ; '!'
        JP      Z,L4C86
        CP      23h             ; '#'
        JP      Z,L4C86
        LD      (HL),A
L4C68:  LD      C,00h
        LD      A,(DE)
        AND     A
        JP      M,L4C75+1       ; reference not aligned to instruction
        INC     HL
        INC     DE
        JP      L4C51+1         ; reference not aligned to instruction

L4C74:  LD      A,(HL)
L4C75:  OR      80h
        LD      (HL),A
        POP     HL
        RET

L4C7A:  INC     C
        LD      A,(DE)
        ; --- START PROC L4C7C ---
L4C7C:  AND     A
        JP      M,L4C75+1       ; reference not aligned to instruction
        INC     DE
        JP      L4C51+1         ; reference not aligned to instruction

L4C84:  INC     C
        DEC     C
        ; --- START PROC L4C86 ---
L4C86:  JP      NZ,L4C68+1      ; reference not aligned to instruction
        AND     0Fh
        JP      L4C68+1         ; reference not aligned to instruction

L4C8E:  PUSH    HL
        PUSH    DE
        ; --- START PROC L4C90 ---
L4C90:  PUSH    BC
        LD      A,(HL)
L4C92:  AND     7Fh             ; ''
        LD      B,A
        LD      A,(DE)
        AND     7Fh             ; ''
        CP      10h
        JP      C,L4CB2
        CP      B
L4C9E:  JP      NZ,L4CE7
        LD      A,(DE)
        AND     A
L4CA3:  JP      M,L4CED
        LD      A,(HL)
        AND     A
        JP      M,L4CE7
        INC     HL
        INC     DE
        JP      L4C92+1         ; reference not aligned to instruction

L4CB0:  CP      01h
L4CB2:  JP      Z,L4CD1+1       ; reference not aligned to instruction
        CP      03h
        JP      Z,L4CC3+1       ; reference not aligned to instruction
        CP      0Fh
        JP      NZ,L4C9E+1      ; reference not aligned to instruction
        JP      L4CA3

L4CC2:  LD      A,B
L4CC3:  CP      3Ah             ; ':'
        JP      NC,L4CE7
        CP      30h             ; '0'
        JP      C,L4CE7
        JP      L4CA3

L4CD0:  LD      A,B
L4CD1:  CP      7Bh             ; '{'
        JP      NC,L4CE7
        CP      61h             ; 'a'
        JP      NC,L4CA3
        CP      5Bh             ; '['
        JP      NC,L4CE7
        CP      41h             ; 'A'
        JP      NC,L4CA3
        LD      A,01h
        ; --- START PROC L4CE7 ---
L4CE7:  AND     A
        JP      L4CEE

L4CEB:  XOR     A
        POP     BC
        ; --- START PROC L4CED ---
L4CED:  POP     DE
        ; --- START PROC L4CEE ---
L4CEE:  POP     HL
        RET

L4CF0:  LD      A,0FFh
        LD      (5A94h),A
        RET

L4CF6:  CALL    NC,L2823
        CALL    L4FE2+2         ; reference not aligned to instruction
        LD      (5A77h),HL
        LD      HL,(5B05h)
        LD      (5B0Bh),HL
        LD      HL,(5A96h)
        LD      (5B0Dh),HL
        CALL    L172E
        LD      HL,34FEh
        CALL    L5548+2         ; reference not aligned to instruction
        LD      A,01h
        LD      (5A79h),A
        LD      A,(5A7Ah)
        OR      10h
        LD      (5A7Ah),A
        XOR     A
        CALL    L17E1+2         ; reference not aligned to instruction
        JP      L32A5+2         ; reference not aligned to instruction

L4D28:  LD      A,08h
        JP      L4D31

L4D2D:  LD      A,00h
        PUSH    AF
        PUSH    DE
L4D31:  CALL    L58D3+1         ; reference not aligned to instruction
        POP     DE
        POP     AF
        LD      (5A79h),A
        CALL    NC,L2823
        XOR     A
        LD      (L5946),A
        EX      DE,HL
        PUSH    HL
        CALL    L4FDB+2         ; reference not aligned to instruction
        LD      (5A77h),HL
        POP     HL
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
        CP      0Dh
L4D50:  JP      NZ,L4D63+2      ; reference not aligned to instruction
        INC     HL
        CALL    L4FDB+2         ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,5946h
        CALL    L3762
        LD      (HL),00h
        JP      L4D6C+2         ; reference not aligned to instruction

L4D63:  CALL    L172E
        LD      HL,34F3h
        CALL    L5548+2         ; reference not aligned to instruction
L4D6C:  LD      A,(5A7Ah)
        OR      14h
        LD      (5A7Ah),A
        XOR     A
        CALL    L18ED
        LD      A,(5A94h)
        AND     A
        JP      NZ,L4DB8+2      ; reference not aligned to instruction
        LD      A,(5A79h)
        CP      08h
        CALL    NZ,L340A+2      ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     0F7h
        LD      (5A7Ah),A
L4D8F:  LD      HL,5C0Eh
        CALL    L21F0
        INC     HL
        CALL    L18A2
        JP      C,L4DC3
        LD      HL,(5A96h)
        LD      (5A98h),HL
        LD      HL,5C10h
        CALL    L2AB6+1         ; reference not aligned to instruction
        CALL    L2A10
        LD      HL,(5A98h)
        LD      (5A96h),HL
        INC     HL
        LD      (5B1Ah),HL
        JP      L4D8F+2         ; reference not aligned to instruction

L4DB8:  LD      HL,5C0Eh
        CALL    L18A2
        JP      NC,L4DB8+2      ; reference not aligned to instruction
        OR      01h
        ; --- START PROC L4DC3 ---
L4DC3:  SCF
        CALL    L18ED
        LD      A,(5A7Ah)
        AND     0EBh
        LD      (5A7Ah),A
        XOR     A
        LD      (5A94h),A
        LD      A,(L5946)
        AND     A
        RET     Z
        XOR     A
        LD      (5A8Eh),A
        LD      HL,5946h
        LD      (5A8Fh),HL
        CALL    L2280+2         ; reference not aligned to instruction
        LD      A,(5A7Ah)
        AND     0F7h
        LD      (5A7Ah),A
        CALL    L26FE+2         ; reference not aligned to instruction
        XOR     A
        LD      (5A93h),A
        JP      L3396+2         ; reference not aligned to instruction

L4DF7:  CALL    NC,L2823
        LD      A,14h
        LD      (5A79h),A
        XOR     A
        JP      L4E11

L4E03:  CALL    NC,L2823
        LD      A,15h
        LD      (5A79h),A
        LD      A,01h
        AND     A
        SCF
        EX      DE,HL
        PUSH    AF
L4E11:  PUSH    HL
        CALL    L356A+1         ; reference not aligned to instruction
        CALL    C,L5157
        CALL    L162F
        LD      DE,0008h
        CALL    L514A+2         ; reference not aligned to instruction
        LD      B,L
        CALL    L4F44
        POP     HL
        PUSH    AF
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
L4E2C:  LD      DE,0000h
        CP      09h
        JP      Z,L4E41+1       ; reference not aligned to instruction
        CP      0Dh
        JP      Z,L4E5F+1       ; reference not aligned to instruction
        CALL    L356A+1         ; reference not aligned to instruction
        EX      DE,HL
        CALL    NC,L4FE8
        EX      DE,HL
        ; --- START PROC L4E41 ---
L4E41:  LD      (5A77h),HL
        POP     AF
        LD      BC,0001h
        PUSH    AF
L4E49:  CALL    L16C6
        JP      NZ,L4E5D
        POP     DE
        POP     AF
        PUSH    AF
        PUSH    DE
        CALL    L4E5C
        POP     AF
        JP      L4E49+1         ; reference not aligned to instruction

L4E5A:  JP      (HL)

L4E5B:  POP     HL
        ; --- START PROC L4E5C ---
L4E5C:  POP     HL
        ; --- START PROC L4E5D ---
L4E5D:  RET

L4E5E:  INC     HL
L4E5F:  JP      L4E2C+1         ; reference not aligned to instruction

L4E62:  CALL    L4589+2         ; reference not aligned to instruction
        LD      (5A57h),HL
        CALL    L4EAB
        OR      01h
        LD      (HL),A
        RET

L4E6F:  CALL    L4580+2         ; reference not aligned to instruction
        LD      (5A5Bh),HL
        CALL    L4EAB
        OR      02h
        LD      (HL),A
        RET

L4E7C:  CALL    L3563+2         ; reference not aligned to instruction
        JP      C,L4E85+2       ; reference not aligned to instruction
        CALL    L162F
L4E85:  LD      (5A59h),HL
        CALL    L4EAB
        OR      04h
        LD      (HL),A
        RET

L4E8F:  CALL    L4580+2         ; reference not aligned to instruction
        LD      (5A52h),HL
        CALL    L4EAB
        OR      10h
        LD      (HL),A
        RET

L4E9C:  CALL    L4580+2         ; reference not aligned to instruction
        LD      (5A5Dh),HL
        CALL    L4EAB
        OR      08h
        LD      (HL),A
        RET

L4EA9:  LD      A,0FFh
        ; --- START PROC L4EAB ---
L4EAB:  LD      (5B04h),A
        LD      HL,5A95h
        LD      A,(HL)
        RET

L4EB3:  LD      HL,(5A73h)
        PUSH    HL
        CALL    L4555+2         ; reference not aligned to instruction
        PUSH    DE
        PUSH    HL
        CALL    L15A7
        POP     HL
        POP     DE
        RET

L4EC2:  CALL    L4580+2         ; reference not aligned to instruction
        LD      A,(5A81h)
        JP      L4F33+1         ; reference not aligned to instruction

L4ECB:  CALL    L4580+2         ; reference not aligned to instruction
        LD      A,(5A81h)
        OR      A
        CALL    Z,L171F
        LD      D,00h
        LD      E,A
        XOR     A
        LD      (5A81h),A
        JP      L4F3A+2         ; reference not aligned to instruction

L4EDF:  CALL    L4561+2         ; reference not aligned to instruction
        LD      A,(HL)
        OR      A
L4EE4:  PUSH    AF
        AND     7Fh             ; ''
        CALL    L0870
        LD      (DE),A
        INC     HL
        INC     DE
        POP     AF
        JP      P,L4EE4
        JP      L45E8

L4EF4:  CALL    L4580+2         ; reference not aligned to instruction
        LD      A,(5A7Eh)
        LD      D,00h
        LD      E,A
        JP      L4F3A+2         ; reference not aligned to instruction

L4F00:  CALL    L4FE2+2         ; reference not aligned to instruction
        LD      DE,0000h
        PUSH    DE
        LD      A,(HL)
L4F08:  AND     7Fh             ; ''
        CP      30h             ; '0'
        CALL    C,L2832
        CP      38h             ; '8'
        CALL    NC,L2832
        AND     07h
        EX      (SP),HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        OR      L
        LD      L,A
        EX      (SP),HL
        LD      A,(HL)
        INC     HL
        AND     A
L4F20:  JP      P,L4F08+1       ; reference not aligned to instruction
        POP     DE
L4F24:  LD      HL,(5EECh)
        EX      DE,HL
        INC     DE
        JP      L45B2+2         ; reference not aligned to instruction

L4F2C:  CALL    L4580+2         ; reference not aligned to instruction
        LD      A,(5A56h)
        AND     A
L4F33:  LD      DE,0000h
        JP      Z,L4F3A+2       ; reference not aligned to instruction
        DEC     DE
L4F3A:  LD      HL,(5EECh)
        INC     HL
        EX      DE,HL
        JP      L45AC+2         ; reference not aligned to instruction

L4F42:  LD      A,01h
        ; --- START PROC L4F44 ---
L4F44:  DEC     B
        ; --- START PROC L4F45 ---
L4F45:  RET     M
        ; --- START PROC L4F46 ---
L4F46:  ADD     A,A
        ; --- START PROC L4F47 ---
L4F47:  JP      L4F46

L4F4A:  CALL    NC,L2832
        ; --- START PROC L4F4D ---
L4F4D:  LD      A,03h
L4F4F:  LD      (5A79h),A
        CALL    L4FE2+2         ; reference not aligned to instruction
        LD      (5A77h),HL
        CALL    L172E
        LD      HL,34FEh
        CALL    L5548+2         ; reference not aligned to instruction
        XOR     A
        CALL    L1906+2         ; reference not aligned to instruction
        LD      HL,(5B05h)
        EX      DE,HL
        LD      HL,(5A96h)
        INC     HL
        CALL    L07A9
        LD      (L59BF+1),HL    ; reference not aligned to instruction
        LD      HL,(5A86h)
        LD      (L59C2),HL
        LD      HL,(5A8Ah)
        EX      DE,HL
        LD      HL,(5A8Ch)
        CALL    L07A9
        LD      (L59C4),HL
        EX      DE,HL
        LD      HL,(L59BF+1)    ; reference not aligned to instruction
        LD      BC,0007h
        ADD     HL,BC
        ADD     HL,DE
        LD      (L59C5+1),HL    ; reference not aligned to instruction
        LD      A,L
        CALL    L18FF+2         ; reference not aligned to instruction
        LD      A,(L59C7)
        CALL    L18FF+2         ; reference not aligned to instruction
        LD      HL,59C0h
        LD      B,06h
        LD      A,(HL)
        PUSH    BC
L4FA3:  PUSH    HL
        CALL    L18FF+2         ; reference not aligned to instruction
        POP     HL
        POP     BC
        DEC     B
        INC     HL
        JP      NZ,L4FA3
        LD      HL,(L59BF+1)    ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5B05h)
        CALL    L4FCD
        LD      HL,(L59C4)
        EX      DE,HL
        INC     DE
        LD      HL,(5A8Ah)
        CALL    L4FCD
        SCF
        LD      A,00h
        INC     A
        CALL    L1906+2         ; reference not aligned to instruction
        RET

L4FCB:  LD      A,(HL)
        PUSH    HL
        ; --- START PROC L4FCD ---
L4FCD:  PUSH    DE
        CALL    L18FF+2         ; reference not aligned to instruction
        POP     DE
        POP     HL
        DEC     DE
        INC     HL
        LD      A,D
        OR      E
        JP      NZ,L4FCD
        RET

L4FDB:  CALL    L356A+1         ; reference not aligned to instruction
        RET     C
        CALL    L4FE8
L4FE2:  CALL    L3563+2         ; reference not aligned to instruction
        RET     C
        LD      B,33h           ; '3'
        ; --- START PROC L4FE8 ---
L4FE8:  JP      L2833+1         ; reference not aligned to instruction

L4FEB:  PUSH    AF
        LD      A,(5A7Ah)
        OR      30h             ; '0'
        LD      (5A7Ah),A
        LD      A,07h
        LD      (5A79h),A
        POP     AF
        JP      L3E94

L4FFD:  PUSH    AF
        LD      A,(5A7Ah)
        OR      30h             ; '0'
        LD      (5A7Ah),A
        LD      A,06h
        LD      (5A79h),A
        POP     AF
        JP      L483E+2         ; reference not aligned to instruction

L500F:  CALL    NC,L2823
        PUSH    DE
        CALL    L58D3+1         ; reference not aligned to instruction
        POP     DE
        LD      A,02h
        LD      (5A79h),A
        XOR     A
        LD      (L5946),A
        EX      DE,HL
        PUSH    HL
        CALL    L4FDB+2         ; reference not aligned to instruction
        LD      (5A77h),HL
        POP     HL
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
        CP      0Dh
        JP      NZ,L5042+2      ; reference not aligned to instruction
        INC     HL
        CALL    L4FDB+2         ; reference not aligned to instruction
        CALL    L089B
        LD      C,E
        LD      B,D
        LD      DE,5946h
        CALL    L0827
        ; --- START PROC L5042 ---
L5042:  CALL    L172E
        LD      HL,34F3h
        CALL    L5548+2         ; reference not aligned to instruction
        LD      A,(5A94h)
        AND     A
        ; --- START PROC L504F ---
L504F:  JP      NZ,L5056+1      ; reference not aligned to instruction
        CALL    L340A+2         ; reference not aligned to instruction
        XOR     A
L5056:  CALL    L1925
        CALL    L1922
        CALL    L1922
        LD      HL,59C0h
        LD      B,06h
        PUSH    HL
        PUSH    BC
L5066:  CALL    L1922
        POP     BC
        POP     HL
        LD      (HL),A
        DEC     B
        INC     HL
        JP      NZ,L5066
        LD      A,(5A94h)
        AND     A
        JP      NZ,L509F+2      ; reference not aligned to instruction
        LD      HL,(L59BF+1)    ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5B05h)
        ADD     HL,DE
        LD      (5B09h),HL
        DEC     HL
        LD      (5A96h),HL
        LD      (HL),0FFh
        LD      HL,(L59C2)
        LD      (5A86h),HL
        LD      HL,(L59C4)
        EX      DE,HL
        LD      HL,(5A8Ch)
        CALL    L07A9
        LD      (5A9Ah),HL
        LD      (5A8Ah),HL
L509F:  LD      HL,(L59BF+1)    ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5B05h)
        CALL    L50DB
        LD      HL,(L59C4)
        EX      DE,HL
        INC     DE
        LD      HL,(5A8Ah)
        CALL    L50DB
        LD      A,(5A94h)
        AND     A
        JP      NZ,L50CF
        LD      HL,(5A86h)
        LD      E,L
        LD      D,H
        ADD     HL,DE
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(5A8Ah)
        ADD     HL,DE
        LD      (5A88h),HL
        JP      L4DC3

L50CD:  LD      A,01h
L50CF:  AND     A
        SCF
        CALL    L1925
        XOR     A
        LD      (5A94h),A
        RET

L50D9:  PUSH    HL
        PUSH    DE
        ; --- START PROC L50DB ---
L50DB:  CALL    L1922
        POP     DE
        POP     HL
        LD      B,A
        LD      A,(5A94h)
        AND     A
        JP      NZ,L50EB
        LD      (HL),B
        INC     HL
        DEC     DE
L50EB:  LD      A,D
        OR      E
        JP      NZ,L50DB
        LD      A,(5A94h)
        AND     A
        RET     NZ
        LD      A,(5A7Ah)
        AND     0F7h
        LD      (5A7Ah),A
        RET

L50FE:  LD      HL,(5B07h)
        INC     HL
        LD      (5A7Fh),HL
        JP      L47E4+2         ; reference not aligned to instruction

L5108:  CALL    L5113+2         ; reference not aligned to instruction
        LD      (HL),A
        RET

L510D:  CALL    L5113+2         ; reference not aligned to instruction
        XOR     E
        LD      (HL),A
        RET

L5113:  CALL    NC,L2823
        CALL    L5144+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L513B+2         ; reference not aligned to instruction
        PUSH    DE
        LD      DE,0001h
        LD      A,H
        OR      L
L5126:  JP      Z,L5132
        EX      DE,HL
        ADD     HL,HL
        EX      DE,HL
        DEC     HL
        JP      L5126

L5130:  EX      DE,HL
        POP     DE
L5132:  EX      (SP),HL
        LD      DE,5A2Ah
        ADD     HL,DE
        POP     DE
        LD      A,(HL)
        OR      E
        RET

L513B:  CALL    L515A+2         ; reference not aligned to instruction
        LD      DE,0008h
        JP      L514A+2         ; reference not aligned to instruction

L5144:  CALL    L515A+2         ; reference not aligned to instruction
        LD      DE,000Ah
L514A:  CALL    L07B1
        RET     C
        CALL    L4711
L5151:  CALL    L3563+2         ; reference not aligned to instruction
        RET     NC
        LD      B,32h           ; '2'
        ; --- START PROC L5157 ---
L5157:  JP      L2833+1         ; reference not aligned to instruction

L515A:  CALL    L5151+2         ; reference not aligned to instruction
        JP      L1620

L5160:  LD      HL,(5B07h)
        PUSH    HL
        CALL    L26F3+1         ; reference not aligned to instruction
        EX      DE,HL
        CALL    L51BD+1         ; reference not aligned to instruction
        POP     HL
        PUSH    HL
        LD      (5B07h),HL
        CALL    L478F+2         ; reference not aligned to instruction
        POP     BC
        POP     HL
        POP     DE
        PUSH    BC
        PUSH    DE
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      A,(HL)
        CP      08h
        JP      NZ,L5194+1      ; reference not aligned to instruction
        INC     HL
        INC     HL
        LD      A,(HL)
L5186:  CP      09h
        JP      Z,L5194
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        JP      L5186+1         ; reference not aligned to instruction

L5192:  INC     HL
        LD      A,(HL)
L5194:  CP      09h
        JP      NZ,L51B1+2      ; reference not aligned to instruction
        EX      DE,HL
        LD      HL,(5EECh)
        LD      (HL),3Ah        ; ':'
        INC     HL
        LD      (5EECh),HL
        EX      DE,HL
        CALL    L3B13
        LD      HL,(5EECh)
        DEC     HL
        LD      (HL),3Ah        ; ':'
        INC     HL
        LD      (5EECh),HL
L51B1:  LD      HL,(5EECh)
        LD      (5B1Ah),HL
        XOR     A
        LD      (5B2Ah),A
        RET

L51BC:  PUSH    DE
L51BD:  LD      DE,0006h
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     DE
        LD      HL,(5EECh)
        LD      (HL),39h        ; '9'
        INC     HL
        CALL    L51FF
        LD      (HL),39h        ; '9'
        INC     HL
        LD      (5EECh),HL
        LD      (5B1Ah),HL
        RET

L51D7:  LD      HL,(5EECh)
        ADD     HL,DE
L51DB:  CALL    C,L4711
L51DE:  LD      DE,01F4h
        ADD     HL,DE
L51E2:  CALL    C,L4711
        EX      DE,HL
        LD      HL,(5A9Ah)
        CALL    L07B1
        RET     NC
        PUSH    DE
        CALL    L383A+2         ; reference not aligned to instruction
        LD      HL,(5A9Ah)
        POP     DE
        CALL    L07B1
        CCF
        RET     C
        CALL    L3837
        LD      (HL),02h
        ; --- START PROC L51FF ---
L51FF:  INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (HL),03h
        INC     HL
        RET

L5208:  LD      A,(HL)
L5209:  CP      0FEh
        INC     HL
        JP      Z,L521B
        LD      A,(HL)
        OR      A
L5211:  RET     M
        CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        JP      L5211

L5219:  LD      A,(HL)
        INC     A
L521B:  RET     Z
        INC     HL
        LD      A,(HL)
        RET

L521F:  LD      B,41h           ; 'A'
        ; --- START PROC L5221 ---
L5221:  JP      L2833+1         ; reference not aligned to instruction

L5224:  PUSH    DE
        LD      DE,001Fh
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     DE
        LD      HL,(5EECh)
        LD      (HL),37h        ; '7'
        INC     HL
        LD      (5EECh),HL
        LD      HL,(5B07h)
        CALL    L5209+1         ; reference not aligned to instruction
        CALL    Z,L5221
        EX      DE,HL
        LD      HL,(5EECh)
L5242:  CALL    L51FF
        LD      (5EECh),HL
        EX      DE,HL
        EX      (SP),HL
        PUSH    HL
        LD      HL,(5B07h)
        INC     HL
L524F:  CALL    L3B13
        PUSH    DE
        LD      HL,(5B27h)
        ; --- START PROC L5256 ---
L5256:  EX      DE,HL
        CALL    L3538
        CALL    L51FF
        LD      (5EECh),HL
        POP     HL
        INC     HL
        CALL    L528A+1         ; reference not aligned to instruction
        LD      A,(HL)
        CP      09h
        JP      NZ,L5278+2      ; reference not aligned to instruction
        CALL    L528A+1         ; reference not aligned to instruction
L526E:  LD      HL,(5EECh)
        LD      (HL),37h        ; '7'
        INC     HL
        LD      (5B1Ah),HL
        RET

L5278:  LD      HL,(5EECh)
        EX      DE,HL
        INC     DE
        LD      HL,52DCh
        CALL    L0824
        CALL    L3612+2         ; reference not aligned to instruction
        JP      L526E+2         ; reference not aligned to instruction

L5289:  PUSH    HL
L528A:  LD      HL,(5EECh)
        EX      (SP),HL
        CALL    L3B13
        EX      DE,HL
        INC     HL
        LD      (5B34h),HL
        CALL    L5151+2         ; reference not aligned to instruction
        EX      (SP),HL
        EX      DE,HL
        LD      HL,(5EECh)
        CALL    L07B1
        CALL    NZ,L2832
        POP     HL
        EX      DE,HL
        LD      HL,(5EECh)
        LD      (HL),04h
        INC     HL
        EX      DE,HL
        CALL    L0824
        EX      DE,HL
        ADD     HL,BC
        LD      (HL),05h
        INC     HL
        LD      (5EECh),HL
        LD      HL,(5B34h)
        RET

L52BC:  LD      HL,(5EECh)
        EX      DE,HL
        LD      HL,(5B09h)
        CALL    L07B1
        LD      B,34h           ; '4'
        CALL    NC,L2833+1      ; reference not aligned to instruction
        CALL    L3538
        LD      A,(HL)
        CP      3Bh             ; ';'
        JP      NC,L52BC+2      ; reference not aligned to instruction
        CP      37h             ; '7'
        JP      C,L52BC+2       ; reference not aligned to instruction
        RET

L52DA:  LD      (BC),A
        NOP
        NOP
        NOP
        NOP
        LD      BC,0D2EBh
L52E2:  ADC     A,C
        LD      D,E
        LD      (5B34h),HL
        LD      (5EECh),HL
L52EA:  CALL    L52BC+2         ; reference not aligned to instruction
        CP      3Ah             ; ':'
        JP      Z,L52EA+2       ; reference not aligned to instruction
        CP      37h             ; '7'
        LD      B,34h           ; '4'
        CALL    NZ,L2833+1      ; reference not aligned to instruction
        LD      HL,(5B34h)
        LD      A,(HL)
        CP      09h
        JP      Z,L531D+2       ; reference not aligned to instruction
        CP      02h
        CALL    NZ,L2832
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        PUSH    DE
        LD      HL,(5EECh)
        LD      DE,0FFEDh
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        CALL    L07B1
        JP      NZ,L5381+2      ; reference not aligned to instruction
L531D:  LD      HL,(5EECh)
        INC     HL
        LD      (5EECh),HL
        LD      DE,0FFECh
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        INC     HL
        INC     HL
        PUSH    DE
        PUSH    HL
        CALL    L15AA
        POP     HL
        PUSH    AF
        LD      DE,0008h
        ADD     HL,DE
        LD      A,(HL)
        AND     A
        JP      P,L5343
        POP     AF
        CCF
        PUSH    AF
        ; --- START PROC L5341 ---
L5341:  POP     AF
        POP     DE
L5343:  JP      Z,L535F+2       ; reference not aligned to instruction
        JP      C,L535F+2       ; reference not aligned to instruction
        LD      C,E
        LD      B,D
        CALL    L2892+2         ; reference not aligned to instruction
        LD      HL,(5EECh)
        LD      (5B1Ah),HL
L5354:  LD      DE,0FFE8h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        POP     BC
        PUSH    DE
        JP      (HL)

L535F:  CALL    L52BC+2         ; reference not aligned to instruction
        CALL    L52BC+2         ; reference not aligned to instruction
        LD      (5B1Ah),HL
        LD      HL,(5B34h)
        LD      A,(HL)
        CP      09h
        RET     Z
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        LD      A,(HL)
        CP      09h
        RET     Z
        CALL    L4726
        INC     HL
        LD      (5B34h),HL
        JP      L52EA+2         ; reference not aligned to instruction

L5381:  CALL    L52BC+2         ; reference not aligned to instruction
        JP      L52EA+2         ; reference not aligned to instruction

L5387:  LD      HL,(5EECh)
        LD      (HL),09h
        SCF
        EX      DE,HL
        JP      L52E2

L5391:  CALL    NC,L2823
        EX      DE,HL
        LD      (5B34h),HL
        LD      HL,(5B07h)
        LD      (5B36h),HL
L539E:  LD      HL,(5B34h)
        LD      A,(HL)
        CP      09h
        RET     Z
        CP      0Dh
        JP      NZ,L53AC+2      ; reference not aligned to instruction
        INC     HL
        LD      A,(HL)
L53AC:  CALL    L26B8+2         ; reference not aligned to instruction
        ADD     HL,DE
        LD      (5B34h),HL
        CALL    L53BC+2         ; reference not aligned to instruction
        CALL    L3D2A+2         ; reference not aligned to instruction
        JP      L539E+2         ; reference not aligned to instruction

L53BC:  LD      HL,(5B1Eh)
        ; --- START PROC L53BF ---
L53BF:  LD      A,L
        OR      H
        JP      Z,L53E8+2       ; reference not aligned to instruction
        DEC     HL
        EX      DE,HL
        LD      HL,(5B20h)
        ADD     HL,DE
        LD      A,(HL)
        CP      0Dh
        JP      NZ,L53D4
        INC     HL
        LD      A,(HL)
        CP      09h
L53D4:  JP      Z,L53E8+2       ; reference not aligned to instruction
        CALL    L26B8+2         ; reference not aligned to instruction
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(5B20h)
        EX      DE,HL
        CALL    L07A9
        INC     HL
        LD      (5B1Eh),HL
        RET

L53E8:  LD      HL,(5B20h)
        LD      A,L
        OR      H
        CALL    NZ,L3B0B
        LD      HL,(5B1Ch)
        LD      (5B07h),HL
L53F6:  CALL    L26F3+1         ; reference not aligned to instruction
        LD      A,(HL)
        CP      0FFh
        CALL    Z,L5435+2       ; reference not aligned to instruction
        CP      0A3h
        JP      NZ,L53F6+2      ; reference not aligned to instruction
        INC     HL
        CALL    L3B13
        EX      DE,HL
        LD      HL,(5EECh)
        CALL    L07A9
        PUSH    DE
        PUSH    HL
        LD      A,88h
        LD      DE,5B20h
        CALL    L37DD
        EX      DE,HL
        POP     BC
        POP     HL
        CALL    L0827
        LD      (5EECh),HL
        EX      DE,HL
        LD      (5B20h),HL
        LD      HL,0001h
        LD      (5B1Eh),HL
        LD      HL,(5B07h)
        LD      (5B1Ch),HL
        JP      L53BC+2         ; reference not aligned to instruction

L5435:  LD      HL,(5B36h)
        LD      (5B07h),HL
        LD      B,36h           ; '6'
        JP      L2833+1         ; reference not aligned to instruction

L5440:  LD      HL,(5B05h)
        INC     HL
        LD      (5B1Ch),HL
        LD      HL,(5B20h)
        LD      A,L
        OR      H
        CALL    NZ,L3B0B
        LD      HL,0000h
L5452:  LD      (5B20h),HL
        LD      (5B1Eh),HL
        LD      HL,(5B07h)
        CALL    L5209+1         ; reference not aligned to instruction
        POP     DE
        PUSH    HL
        PUSH    DE
        LD      HL,(5B07h)
        INC     HL
        LD      A,(HL)
        AND     A
        RET     M
        CALL    L478F+2         ; reference not aligned to instruction
        POP     HL
        LD      (5B1Ch),HL
        RET

L5470:  PUSH    AF
        EX      DE,HL
        JP      NC,L5483+2      ; reference not aligned to instruction
        LD      (5B0Dh),HL
        EX      DE,HL
        LD      HL,(5EECh)
        LD      (5B0Bh),HL
        EX      DE,HL
        LD      (5EECh),HL
L5483:  CALL    L52BC+2         ; reference not aligned to instruction
        CP      37h             ; '7'
        JP      Z,L5483+2       ; reference not aligned to instruction
        CP      3Ah             ; ':'
        JP      Z,L5483+2       ; reference not aligned to instruction
        CP      38h             ; '8'
        JP      Z,L54C7+2       ; reference not aligned to instruction
        CALL    L52BC+2         ; reference not aligned to instruction
        LD      (5B1Ah),HL
        INC     HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     AF
        POP     HL
        POP     BC
        PUSH    DE
        PUSH    HL
        RET     NC
        LD      HL,(5B0Dh)
        EX      DE,HL
        LD      HL,(5B0Bh)
        CALL    L07A9
        LD      B,H
        LD      C,L
        LD      H,D
        LD      L,E
        INC     DE
        CALL    L0827
        LD      (HL),3Ah        ; ':'
        ADD     HL,BC
        LD      (HL),3Ah        ; ':'
        INC     HL
        LD      (5B1Ah),HL
        LD      A,0FFh
        LD      (5B2Ah),A
        RET

L54C7:  CALL    L54CD+2         ; reference not aligned to instruction
        JP      L5483+2         ; reference not aligned to instruction

L54CD:  CALL    L3538
        LD      A,(HL)
        CP      38h             ; '8'
        RET     Z
        CALL    L3538
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        PUSH    DE
        CALL    L3538
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        CALL    L2202+2         ; reference not aligned to instruction
        EX      DE,HL
        DEC     HL
        POP     DE
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        JP      L54CD+2         ; reference not aligned to instruction

L54EF:  LD      HL,5500h
        CALL    L17F3
        CALL    L344F+2         ; reference not aligned to instruction
        CALL    L26F3+1         ; reference not aligned to instruction
        JP      L4786+2         ; reference not aligned to instruction

L54FE:  LD      D,E
        LD      D,H
        LD      C,A
        LD      D,B
        JR      NZ,L554D
        LD      C,(HL)
        AND     B
        PUSH    AF
        LD      A,(5A7Ah)
        OR      10h
        LD      (5A7Ah),A
        LD      A,04h
        LD      (5A79h),A
        POP     AF
        JP      L483E+2         ; reference not aligned to instruction

L5518:  LD      HL,(5B09h)
        EX      DE,HL
        LD      HL,(5A96h)
        INC     HL
L5520:  CALL    L07B1
        JP      Z,L5541+2       ; reference not aligned to instruction
        LD      A,(HL)
        AND     3Eh             ; '>'
        CP      02h
        JP      NZ,L553A
        PUSH    DE
        EX      DE,HL
        CALL    L0821
        EX      DE,HL
        POP     DE
        JP      L553A+2         ; reference not aligned to instruction

L5538:  LD      (HL),0FFh
L553A:  LD      BC,0006h
        ADD     HL,BC
        JP      L5520+2         ; reference not aligned to instruction

L5541:  LD      HL,(5A8Ah)
        LD      (5A9Ah),HL
        RET

L5548:  LD      A,(5A7Ah)
        AND     08h
L554D:  RET     NZ
        ; --- START PROC L554E ---
L554E:  JP      L17F3

L5551:  LD      DE,0004h
        CALL    L51D7+2         ; reference not aligned to instruction
        LD      HL,5B22h
        INC     (HL)
        LD      HL,(5EECh)
        PUSH    HL
        EX      DE,HL
        LD      HL,(5B23h)
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        EX      DE,HL
        LD      HL,(5B25h)
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (5EECh),HL
        POP     HL
        DEC     HL
L5576:  CALL    L26BC+1         ; reference not aligned to instruction
        CALL    L07A9
        LD      A,(HL)
        CP      0Dh
        JP      Z,L5576+1       ; reference not aligned to instruction
        INC     HL
        LD      (5B25h),HL
        DEC     HL
        DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)
        LD      HL,0006h
        ADD     HL,DE
        LD      (5B23h),HL
L5592:  CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        PUSH    HL
        PUSH    DE
        LD      HL,0000h
        ADD     HL,SP
        EX      DE,HL
        LD      HL,5AC6h
        CALL    L07B1
        LD      B,16h
        CALL    NC,L2833+1      ; reference not aligned to instruction
        POP     DE
        POP     HL
        LD      A,(HL)
        CP      36h             ; '6'
        JP      NZ,L5592+2      ; reference not aligned to instruction
        EX      DE,HL
        CALL    L3B17+1         ; reference not aligned to instruction
        CALL    L3538
        CALL    L3538
        PUSH    HL
        LD      HL,(5EECh)
L55BE:  DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)
        PUSH    DE
        DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)
        PUSH    DE
        LD      HL,(5B25h)
        DEC     HL
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (5EECh),HL
        POP     HL
        LD      (5B23h),HL
        POP     HL
        LD      (5B25h),HL
        POP     HL
        CALL    L3519
        LD      HL,5B22h
        DEC     (HL)
        RET

L55E3:  LD      HL,(5EECh)
        PUSH    HL
        LD      HL,(5B07h)
        INC     HL
        CALL    L3B13
        POP     HL
        PUSH    DE
        PUSH    HL
        CALL    L5151+2         ; reference not aligned to instruction
        LD      A,(HL)
        AND     A
        LD      B,35h           ; '5'
        CALL    M,L2833+1       ; reference not aligned to instruction
        EX      (SP),HL
        EX      DE,HL
        LD      HL,(5EECh)
        CALL    L07B1
        CALL    NZ,L2832
        POP     HL
        CALL    L162F
        EX      DE,HL
        POP     HL
        INC     HL
        DEC     DE
        LD      A,D
L560F:  OR      E
        JP      Z,L5627+1       ; reference not aligned to instruction
        PUSH    DE
L5614:  CALL    L26BC+1         ; reference not aligned to instruction
        ADD     HL,DE
        LD      A,(HL)
        AND     A
        JP      M,L5648+1       ; reference not aligned to instruction
        CP      06h
        JP      NZ,L5614+2      ; reference not aligned to instruction
        POP     DE
        JP      L560F

L5626:  DEC     HL
L5627:  LD      (5B07h),HL
        LD      A,(5B03h)
        CP      80h
        JP      Z,L478F+2       ; reference not aligned to instruction
        LD      HL,(5B07h)
        PUSH    HL
        CALL    L26F3+1         ; reference not aligned to instruction
        EX      DE,HL
        CALL    L51BD+1         ; reference not aligned to instruction
        POP     HL
        LD      (5B07h),HL
        CALL    L478F+2         ; reference not aligned to instruction
        POP     HL
        EX      (SP),HL
        JP      (HL)

L5647:  POP     HL
L5648:  JP      L4801+2         ; reference not aligned to instruction

L564B:  CALL    NC,L2823
        CALL    L5664+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L5664+2         ; reference not aligned to instruction
        EX      (SP),HL
        LD      A,L
        POP     HL
        LD      H,L
        LD      L,0D3h
        LD      (5B11h),HL
        JP      5B11h

L5664:  CALL    L515A+2         ; reference not aligned to instruction
        INC     H
        DEC     H
        CALL    NZ,L2832
        RET

L566D:  CALL    NC,L2823
        CALL    L5664+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L515A+2         ; reference not aligned to instruction
        POP     DE
        LD      (HL),E
        RET

L567D:  RET     NC
        PUSH    DE
        LD      DE,000Ah
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     DE
        LD      HL,(5B1Ah)
        LD      (HL),38h        ; '8'
        INC     HL
        LD      (5EECh),HL
        LD      HL,(5B07h)
        INC     HL
        INC     HL
        LD      A,(HL)
L5695:  CP      09h
        JP      Z,L56E7+2       ; reference not aligned to instruction
        CP      02h
        CALL    NZ,L2832
        CALL    L3519
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        INC     HL
        LD      (5B07h),HL
        PUSH    DE
        LD      DE,000Ah
        CALL    L51D7+2         ; reference not aligned to instruction
        POP     DE
        LD      HL,(5EECh)
        PUSH    HL
        CALL    L2202+2         ; reference not aligned to instruction
        EX      DE,HL
        EX      (SP),HL
        CALL    L51FF
        LD      (HL),04h
        INC     HL
        EX      DE,HL
        POP     HL
        DEC     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        EX      DE,HL
        LD      B,06h
        LD      (HL),0FFh
L56CD:  INC     HL
        DEC     B
        JP      NZ,L56CD
        LD      (HL),05h
        INC     HL
        LD      (5EECh),HL
        LD      HL,(5B07h)
        LD      A,(HL)
        CP      0Dh
        INC     HL
        JP      Z,L5695+1       ; reference not aligned to instruction
        CP      09h
        CALL    NZ,L2832
L56E7:  LD      HL,(5EECh)
        LD      (HL),38h        ; '8'
        INC     HL
        LD      (5EECh),HL
        LD      (5B1Ah),HL
        RET

L56F4:  CALL    NC,L2823
        PUSH    DE
        LD      HL,(5EECh)
        PUSH    HL
        EX      DE,HL
        LD      (5EECh),HL
L5700:  CALL    L52BC+2         ; reference not aligned to instruction
        CP      3Ah             ; ':'
        JP      NZ,L5700+2      ; reference not aligned to instruction
        CALL    L52BC+2         ; reference not aligned to instruction
        INC     HL
        EX      (SP),HL
        LD      (5EECh),HL
        POP     HL
        EX      (SP),HL
L5712:  CALL    L573E+1         ; reference not aligned to instruction
        JP      NC,L5752+1      ; reference not aligned to instruction
        EX      (SP),HL
        CALL    L573E+1         ; reference not aligned to instruction
        JP      C,L5736+1       ; reference not aligned to instruction
        PUSH    HL
        LD      HL,59C5h
        LD      (HL),04h
        EX      DE,HL
        INC     DE
        CALL    L0821
        EX      DE,HL
        ADD     HL,BC
        LD      (HL),05h
        LD      HL,59C5h
        CALL    L573E+1         ; reference not aligned to instruction
        POP     HL
        PUSH    HL
L5736:  CALL    L3D2A+2         ; reference not aligned to instruction
        POP     HL
        JP      L5712+1         ; reference not aligned to instruction

L573D:  LD      A,(HL)
L573E:  CP      0Dh
        JP      NZ,L5747
        INC     HL
        LD      A,(HL)
        CP      09h
L5747:  RET     Z
        CP      3Ah             ; ':'
        RET     Z
        CALL    L26B8+2         ; reference not aligned to instruction
        ADD     HL,DE
        SCF
        RET

L5751:  POP     HL
L5752:  LD      A,(5B2Ah)
        AND     A
        RET     Z
L5757:  CALL    L52BC+2         ; reference not aligned to instruction
        CALL    L52BC+2         ; reference not aligned to instruction
        CP      39h             ; '9'
        JP      NZ,L5757+2      ; reference not aligned to instruction
        LD      (5B1Ah),HL
        RET

L5766:  CALL    NC,L2823
        EX      DE,HL
        LD      (5B34h),HL
        CALL    L5664+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L5664+2         ; reference not aligned to instruction
        PUSH    HL
        LD      HL,(5EECh)
        EX      DE,HL
        LD      HL,(5B34h)
        CALL    L07B1
        JP      Z,L57B0
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L5664+2         ; reference not aligned to instruction
        PUSH    HL
L578C:  LD      HL,(5EECh)
        EX      DE,HL
        LD      HL,(5B34h)
        CALL    L07B1
        CALL    NZ,L2832
        POP     BC
        POP     DE
L579B:  POP     HL
        LD      A,0DBh
L579E:  LD      (5B11h),A
        LD      A,C
        LD      (5B12h),A
L57A5:  CALL    5B11h
        XOR     L
        AND     E
        JP      Z,L57A5+2       ; reference not aligned to instruction
        RET

L57AE:  POP     BC
        POP     DE
L57B0:  LD      HL,0000h
        JP      L579E

L57B6:  LD      HL,5821h
        CALL    L17F3
        LD      HL,5A2Ah
        LD      B,00h
        LD      C,00h
L57C3:  PUSH    BC
        PUSH    HL
        LD      A,B
        OR      30h             ; '0'
        CALL    L1735
        LD      HL,5812h
        CALL    L17F3
        POP     HL
        POP     BC
        PUSH    BC
        PUSH    HL
L57D5:  LD      A,(HL)
        RRA
        DEC     C
L57D8:  JP      P,L57D8
        JP      NC,L57E8
        LD      A,58h           ; 'X'
        CALL    L1735
        JP      L57ED

L57E6:  LD      A,2Eh           ; '.'
L57E8:  CALL    L1735
        LD      A,20h           ; ' '
L57ED:  CALL    L1735
        LD      A,20h           ; ' '
        CALL    L1735
        POP     HL
        POP     BC
        INC     C
        LD      A,C
        CP      08h
        JP      NZ,L57D5
        INC     HL
        INC     B
        PUSH    BC
        PUSH    HL
        CALL    L172E
        POP     HL
        POP     BC
        LD      A,B
        CP      0Ah
        JP      NZ,L57C3
        JP      L4801+2         ; reference not aligned to instruction

L5810:  JR      NZ,L583F
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        DEC     L
        AND     B
        DEC     C
        LD      A,(BC)
        LD      B,E
        LD      C,B
        LD      B,C
        LD      C,(HL)
        LD      C,(HL)
        LD      B,L
        LD      C,H
        LD      D,E
        JR      NZ,L584B
        JR      NZ,L584D
        JR      NZ,L584F
        JR      NZ,L5851
        LD      C,H
        LD      C,A
        LD      B,A
        LD      C,C
        LD      B,E
        LD      B,C
        LD      C,H
        JR      NZ,L587E
        LD      B,L
        LD      D,(HL)
        LD      C,C
        LD      B,E
        LD      B,L
L583F:  LD      D,E
        DEC     C
        LD      A,(BC)
        JR      Z,L5894
        LD      C,B
L5845:  LD      E,C
        LD      D,E
        LD      L,29h           ; ')'
        JR      NZ,L586B
L584B:  JR      NZ,L586D
L584D:  JR      NZ,L586F
L584F:  JR      NZ,L5871
L5851:  JR      NZ,L5882+1      ; reference not aligned to instruction
        JR      NZ,L5874+1      ; reference not aligned to instruction
        LD      SP,2020h
        LD      (L201E+2),A     ; reference not aligned to instruction
        INC     SP
        JR      NZ,L587E
        INC     (HL)
        JR      NZ,L5880+1      ; reference not aligned to instruction
        DEC     (HL)
        JR      NZ,L5884
        LD      (HL),20h        ; ' '
        JR      NZ,L589F
        DEC     C
        ADC     A,D
        DEC     C
L586B:  LD      A,(BC)
        LD      D,E
L586D:  LD      E,C
        LD      C,L
L586F:  LD      B,D
        LD      C,A
L5871:  LD      C,H
        JR      NZ,L5894
L5874:  JR      NZ,L5896
        JR      NZ,L5898
        JR      NZ,L589A
        JR      NZ,L589C
        JR      NZ,L589E
L587E:  JR      NZ,L58A0
L5880:  JR      NZ,L58A1+1      ; reference not aligned to instruction
L5882:  JR      NZ,L58A3+1      ; reference not aligned to instruction
L5884:  JR      NZ,L58A6
        JR      NZ,L58A8
        JR      NZ,L58AA
        LD      D,H
        LD      E,C
        LD      D,B
        LD      B,L
        JR      NZ,L58B0
        JR      NZ,L58B2
        LD      C,H
        LD      C,A
L5894:  LD      B,E
        LD      B,C
L5896:  LD      D,H
        LD      C,C
L5898:  LD      C,A
        LD      C,(HL)
L589A:  DEC     C
        ADC     A,D
L589C:  LD      B,C
        LD      D,D
L589E:  LD      D,D
L589F:  LD      B,C
L58A0:  LD      E,C
L58A1:  JR      NZ,L58C3
L58A3:  JR      NZ,L5845
        LD      C,H
L58A6:  LD      B,C
        LD      B,D
L58A8:  LD      B,L
        LD      C,H
L58AA:  JR      NZ,L58CC
        JR      NZ,L584D+1      ; reference not aligned to instruction
        LD      D,(HL)
        LD      B,C
L58B0:  LD      D,D
        LD      C,C
L58B2:  LD      B,C
        LD      B,D
        LD      C,H
        LD      B,L
        AND     B
        LD      B,(HL)
        LD      D,L
        LD      C,(HL)
        LD      B,E
        LD      D,H
        LD      C,C
        LD      C,A
        LD      C,(HL)
        AND     B
        LD      HL,(5A5Fh)
L58C3:  JP      L58E0+1         ; reference not aligned to instruction

L58C6:  LD      HL,(5A61h)
        JP      L58E0+1         ; reference not aligned to instruction

L58CC:  LD      HL,(5A63h)
        JP      L58E0+1         ; reference not aligned to instruction

L58D2:  XOR     A
L58D3:  LD      (5A93h),A
        LD      HL,(5A6Dh)
        JP      L58E0+1         ; reference not aligned to instruction

L58DC:  LD      HL,(5A65h)
        PUSH    HL
L58E0:  LD      HL,0000h
        CALL    C,L3563+2       ; reference not aligned to instruction
        LD      (5A77h),HL
        RET

L58EA:  LD      A,(5A95h)
        OR      20h             ; ' '
        AND     0BFh
        LD      (5A95h),A
        RET

L58F5:  LD      A,(5A95h)
        OR      40h             ; '@'
        AND     0DFh
        LD      (5A95h),A
        RET

L5900:  CALL    NC,L2823
        CALL    L515A+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L5144+2         ; reference not aligned to instruction
        LD      D,H
        LD      E,L
        ADD     HL,HL
        ADD     HL,DE
        LD      DE,5A34h
        ADD     HL,DE
        POP     DE
        LD      (HL),E
        RET

L5918:  JP      L58E0+2         ; reference not aligned to instruction

L591B:  CALL    NC,L2823
        CALL    L515A+2         ; reference not aligned to instruction
        PUSH    HL
        CALL    L4720+2         ; reference not aligned to instruction
        CALL    L515A+2         ; reference not aligned to instruction
        POP     DE
        LD      H,E
        LD      (5A7Bh),HL
        LD      HL,(5A71h)
        JP      (HL)

L5931:  LD      HL,(5A6Fh)
        JP      (HL)

L5935:  LD      HL,(5A75h)
        JP      (HL)

L5939:  NOP
L593A:  JR      NZ,L595B+1      ; reference not aligned to instruction
L593C:  LD      L,C
L593D:  LD      HL,5350h
L5940:  LD      D,E
        LD      B,(HL)
        ; --- START PROC L5942 ---
L5942:  JR      NZ,L5964
L5944:  JR      NZ,L5965+1      ; reference not aligned to instruction
L5946:  XOR     L
L5947:  JR      NZ,L5999
L5949:  LD      D,E
L594A:  LD      D,E
L594B:  LD      C,B
        JR      NZ,L596E
        JR      NZ,L5970
        LD      A,C
L5951:  LD      HL,5350h
        ; --- START PROC L5954 ---
L5954:  LD      D,E
        LD      C,C
L5956:  JR      NZ,L5978
        JR      NZ,L5979+1      ; reference not aligned to instruction
        ADD     HL,DE
L595B:  JR      NZ,L59AD
        LD      D,E
        LD      D,E
        LD      C,C
        JR      C,L5982
        JR      NZ,L5983+1      ; reference not aligned to instruction
        ; --- START PROC L5964 ---
L5964:  INC     E
L5965:  JR      NZ,L59B7
        LD      D,E
        LD      D,E
        LD      C,E
        JR      NZ,L598C
        JR      NZ,L598D+1      ; reference not aligned to instruction
        ; --- START PROC L596E ---
L596E:  LD      (HL),L
        RRA
        ; --- START PROC L5970 ---
L5970:  LD      D,B
        LD      D,E
        LD      D,E
        LD      C,H
L5974:  JR      NZ,L5996
        JR      NZ,L5997+1      ; reference not aligned to instruction
L5978:  ADD     HL,DE
L5979:  LD      HL,5350h
        LD      D,E
        LD      C,L
        JR      NZ,L59A0
        JR      NZ,L59A1+1      ; reference not aligned to instruction
L5982:  EX      AF,AF'
L5983:  LD      HL,5350h
        LD      D,E
        LD      D,B
        JR      NZ,L59AA
        JR      NZ,L59AC
        ; --- START PROC L598C ---
L598C:  SBC     A,L
L598D:  JR      NZ,L59DF
        LD      D,E
        LD      D,E
        LD      D,C
        JR      NZ,L59B3+1      ; reference not aligned to instruction
        JR      NZ,L59B6
        ; --- START PROC L5996 ---
L5996:  LD      L,B
L5997:  JR      NZ,L59E9
        ; --- START PROC L5999 ---
L5999:  LD      D,E
        LD      D,E
        LD      D,D
        JR      NZ,L59BD+1      ; reference not aligned to instruction
        JR      NZ,L59BF+1      ; reference not aligned to instruction
        ; --- START PROC L59A0 ---
L59A0:  LD      L,D
L59A1:  JR      NZ,L59F3
        LD      D,E
        LD      D,E
        LD      D,E
        ; --- START PROC L59A6 ---
L59A6:  JR      NZ,L59C7+1      ; reference not aligned to instruction
L59A8:  JR      NZ,L59CA
        ; --- START PROC L59AA ---
L59AA:  RET

L59AB:  RRA
        ; --- START PROC L59AC ---
L59AC:  LD      D,B
L59AD:  LD      D,E
        LD      D,E
        LD      D,E
        LD      SP,2020h
L59B3:  JR      NZ,L59AC
        RRA
        ; --- START PROC L59B6 ---
L59B6:  LD      D,B
        ; --- START PROC L59B7 ---
L59B7:  LD      D,E
L59B8:  LD      D,E
        LD      D,E
L59BA:  LD      (L201E+2),A     ; reference not aligned to instruction
L59BD:  JR      NZ,L59CB
L59BF:  JR      NZ,5A11h
        LD      D,E
L59C2:  LD      D,E
        LD      D,E
L59C4:  INC     SP
L59C5:  JR      NZ,L59E7
L59C7:  JR      NZ,L59A6
        RRA
        ; --- START PROC L59CA ---
L59CA:  LD      D,B
        ; --- START PROC L59CB ---
L59CB:  LD      D,E
        LD      D,E
        LD      D,E
        INC     (HL)
        JR      NZ,L59F1
        JR      NZ,L59A8+1      ; reference not aligned to instruction
        RRA
        LD      D,B
        LD      D,E
        LD      D,E
        LD      D,E
        DEC     (HL)
        JR      NZ,L59FB
        JR      NZ,L5974+1      ; reference not aligned to instruction
        JR      NZ,5A2Fh
        ; --- START PROC L59DF ---
L59DF:  LD      D,E
        LD      D,E
        LD      D,H
        JR      NZ,5A04h
L59E4:  JR      NZ,5A06h
        ADD     A,B
        ; --- START PROC L59E7 ---
L59E7:  RRA
        LD      D,B
        ; --- START PROC L59E9 ---
L59E9:  LD      D,E
L59EA:  LD      D,E
        LD      D,L
        JR      NZ,5A0Eh
L59EE:  JR      NZ,5A10h
L59F0:  ADD     A,(HL)
        ; --- START PROC L59F1 ---
L59F1:  RRA
        LD      D,B
        ; --- START PROC L59F3 ---
L59F3:  LD      D,E
        LD      D,E
        LD      D,A
L59F6:  JR      NZ,5A18h
L59F8:  JR      NZ,5A1Ah
        CP      B
        ; --- START PROC L59FB ---
L59FB:  JR      NZ,5A4Dh
        LD      D,E
L59FE:  AND     80h
