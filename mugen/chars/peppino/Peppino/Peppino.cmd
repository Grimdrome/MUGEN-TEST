;=============================================================================
; Commands File
;=============================================================================

;===================================================;
;                 BUTTON REMAPPING                  ;
;===================================================;
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;===================================================;
;                 DEFAULT VALUE                     ;
;===================================================;

[Defaults]
command.time = 30

command.buffer.time = 1

;==========================================================================
;--------------------------|CPU Activation Commands|-----------------------
;==========================================================================
[Command]
name = "cpu1"
command = ~D,UB, F, x, s, a, x, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu2"
command = ~D,UB, F, y, s, a, x, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu3"
command = ~D,UB, F, z, s, a, x, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu4"
command = ~D,DB, F, x, s,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu5"
command = ~D,DB, F, y, s,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu6"
command = ~D,DB, F, z, s,x+y+z+a+b+c+s
time = 1

[Command]
name = "cpu7"
command = ~D,DB, s, U, B, x ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu8"
command = ~D,DB, s, U, B, y ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu9"
command = ~D,DB, s, U, B, z ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu10"
command = ~D,DF, F, x, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu11"
command = ~D,DF, F, y, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu12"
command = ~D,DF, F, z, s, U ,x+y+z+a+b+c+s
time = 1

[Command]
name = "cpu13"
command = ~D,DF, F, a, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu14"
command = ~D,DF, F, b, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu15"
command = ~D,DF, F, c, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu16"
command = ~D,DB, B, a, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu17"
command = ~D,DB, B, b, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu18"
command = ~D,DB, B, c, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu19"
command = ~D,DB, F, a, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu20"
command = ~D,DB, F, b, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu21"
command = ~D,DB, F, c, s, U ,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu22"
command = ~D,UB, F, a, s, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu23"
command = ~D,UB, F, b, s, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu24"
command = ~D,UB, F, c, s, U,x+y+z+a+b+c+s
time = 1


[Command]
name = "cpu25"
command = ~D,DF, F, s, s, U,x+y+z+a+b+c+s
time = 1
;===================================================;
;                 SUPER MOVES                       ;
;===================================================;
[Command]
name = "Scooter"
command = ~D, D, x+y
time = 32

[Command]
name = "Chainsaw Killer"
command = ~D, D, y+z
time = 32

[Command]
name = "Knight Peppino"
command = ~D, D, x+z
time = 32
;===================================================;
;                 SPECIAL MOVES                     ;
;===================================================;
[Command]
name = "Shotgun"
command = ~D, DF, F, x
time = 20

[Command]
name = "Timble"
command = ~D, DF, F, y
time = 20

[Command]
name = "Slap Runner"
command = ~D, DF, F, z
time = 20

[Command]
name = "Skateboard"
command = ~D, DB, B, x
time = 20

[Command]
name = "Angry Italian Grab"
command = ~D, DB, B, y
time = 20

[Command]
name = "Charge!"
command = ~D, DB, B, z
time = 20

;===================================================;
;                 2 TAP COMBINATION                 ;
;===================================================;
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;===================================================;
;                 2/3 BUTTON COMBINATION            ;
;===================================================;
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 50

[Command]
name = "recovery"
command = y+z
time = 50

[Command]
name = "recovery"
command = x+z
time = 50

[Command]
name = "recovery"
command = a+b
time = 50

[Command]
name = "recovery"
command = b+c
time = 50

[Command]
name = "recovery"
command = a+c
time = 50

;===================================================;
;                 DIRECTION + BUTTON                ;
;===================================================;
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;===================================================;
;                 SINGLE BUTTON                     ;
;===================================================;
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;===================================================;
;                 SINGLE DIRECTION                  ;
;===================================================;
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;===================================================;
;                 HOLD BUTTON                       ;
;===================================================;
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;===================================================;
;                 HOLD DIRECTION                    ;
;===================================================;
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;===========================================================================
;State entry

; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
[State -1, AI]
type = VarSet
trigger1  = command = "cpu1"
trigger2  = command = "cpu2"
trigger3  = command = "cpu3"
trigger4  = command = "cpu4"
trigger5  = command = "cpu5"
trigger6  = command = "cpu6"
trigger7  = command = "cpu7"
trigger8  = command = "cpu8"
trigger9  = command = "cpu9"
trigger10 = command = "cpu10"
trigger11 = command = "cpu11"
trigger12 = command = "cpu12"
trigger13 = command = "cpu13"
trigger14 = command = "cpu14"
trigger15 = command = "cpu15"
trigger16 = command = "cpu16"
trigger17 = command = "cpu17"
trigger18 = command = "cpu18"
trigger19 = command = "cpu19"
trigger20 = command = "cpu20"
trigger21 = command = "cpu21"
trigger22 = command = "cpu22"
trigger23 = command = "cpu23"
trigger24 = command = "cpu24"
trigger25 = command = "cpu25"
;trigger26 = command = "cpu26"
;trigger27 = command = "cpu27"
;trigger28 = command = "cpu28"
;trigger29 = command = "cpu29"
;trigger30 = command = "cpu30"
v = 59
value = 1
;---------------------------------------------------------------------------
;===========================================================================

[State -1, AI] ; Close the gap?
type = ChangeState
value = 100
triggerall = p2bodydist x >= 84
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 450
triggerall = prevstateno != 100
triggerall = ctrl = 1

[State -1, AI] ; Close the gap?2
type = ChangeState
value = 20
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 450
triggerall = prevstateno != 20
triggerall = ctrl = 1

[State -1, AI] ; punch
type = ChangeState
value = 200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 500
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,35]
triggerall = p2statetype != A
triggerall = stateno !=200
trigger1 = ctrl = 1

[State -1, AI] ; punch
type = ChangeState
value = 201
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 500
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,35]
triggerall = p2statetype != A
triggerall = stateno !=201
trigger1 = stateno = 200 && movehit
trigger1 = ctrl = 1

[State -1, AI] ; punch
type = ChangeState
value = 202
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 500
triggerall = p2statetype != L
triggerall = p2bodydist x = [0,35]
triggerall = p2statetype != A
trigger2 = stateno = 201 && movehit
trigger1 = ctrl = 1

[State -1, AI] ; punch
type = ChangeState
value = 800
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 500
triggerall = p2statetype != L
triggerall = p2bodydist x <= 45
triggerall = p2statetype != A
trigger2 = stateno = 202 && movehit && Time >= 12
trigger1 = ctrl = 1

[State -1, AI] ;Should I Offensively Guard?
Type = Changestate
Triggerall = Inguarddist
Triggerall = var(59) = 1
Triggerall = ctrl
triggerall = enemy,hitdefattr != S, AT
triggerall = enemy,movetype = A
Trigger1 = random > 500
value = 120

[State -1, AI Guard] ;Should I Defensively Guard?
type = ChangeState
triggerall = var(59) = 1
triggerall = ctrl
triggerAll = stateno != [120,140]
trigger1 = inguarddist ||enemy,numproj||enemy(numenemy>1),numproj
trigger1 = enemynear, MoveGuarded = 0
value = 120

[State -1, AI] ; Laugh at them?
type = ChangeState
value = 195
triggerall = p2bodydist x >= 125
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = enemynear, stateno = 5120
trigger2 = prevstateno = 800
trigger3 = p2bodydist x >= 275
triggerall = prevstateno != 195
triggerall = ctrl = 1

[State -1, AI] ; Throw
type = ChangeState
value = 1000
triggerall = p2bodydist x >= 45
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 500
triggerall = prevstateno != 1000
triggerall = ctrl = 1

[State -1, AI] ; Throw
type = ChangeState
value = 1100
triggerall = p2bodydist x <=50
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 500
triggerall = prevstateno != 1100
triggerall = ctrl = 1

[State -1, AI] ;
type = ChangeState
value = 1200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 100
trigger2= p2bodydist x >= 85
triggerall = prevstateno != 1200
triggerall = ctrl = 1

[State -1, AI] ;
type = ChangeState
value = 100
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
trigger1 = random < 100
trigger2= p2bodydist x >= 85
triggerall = prevstateno = 1200
triggerall = ctrl = 1

[State -1, AI] ;
type = ChangeState
value = 1300
trigger3 = p2bodydist x >= 55
trigger3 = random < 200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = numhelper(1301) < 1
trigger2 = random < 400
trigger1 = prevstateno = 800
triggerall = prevstateno != 1300 || prevstateno != 1400 || prevstateno != 1500
triggerall = ctrl = 1

[State -1, AI]
type = ChangeState
value = 1400
trigger3 = p2bodydist x >= 55
trigger3 = random < 200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = numhelper(1401) < 1
trigger2 = random < 400
trigger1 = prevstateno = 800
triggerall = prevstateno != 1300 || prevstateno != 1400 || prevstateno != 1500
triggerall = ctrl = 1

[State -1, AI] ;
type = ChangeState
value = 1500
trigger3 = p2bodydist x >= 55
trigger3 = random < 200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = numhelper(1500) < 1
trigger2 = random < 400
trigger1 = prevstateno = 800
triggerall = prevstateno != 1300 || prevstateno != 1400 || prevstateno != 1500
triggerall = ctrl = 1

[State -1, AI] ;Mini Mario Stampede
type = ChangeState
value = 3000
trigger1 = Power >=1000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = ctrl = 1
trigger1 = random < 500
trigger1 = enemynear,Vel X !=0


[State -1, AI] ; Blocks Danger
type = ChangeState
value = 3100
trigger1 = Power >=2000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = numhelper(3000) < 1
triggerall = ctrl = 1


[State -1, AI] ; Bob-Bomb
type = ChangeState
value = 3200
triggerall = Power >=3000
trigger1 = enemynear,life > root,life
trigger2 = random < 200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = numhelper(3000) < 1
triggerall = ctrl = 1
;===========================================================================
;---------------------------------------------------------------------------

;===================================================;
;                   HYPER MOVES                     ;
;===================================================;
;---------------------------------------------------------------------------
;テイルアタック
[State -1, テイルアタック]
type = ChangeState
value = 3200
triggerall = Command = "Knight Peppino"
triggerall = power>=3000
trigger1 = StateType != A
trigger1 = Ctrl
;---------------------------------------------------------------------------
;テイルアタック
[State -1, テイルアタック]
type = ChangeState
value = 3100
triggerall = Command = "Chainsaw Killer"
triggerall = power>=2000
trigger1 = StateType != A
trigger1 = Ctrl
;---------------------------------------------------------------------------
;テイルアタック
[State -1, テイルアタック]
type = ChangeState
value = 3000
triggerall = Command = "Scooter"
triggerall = power>=1000
trigger1 = StateType != A
trigger1 = Ctrl
;===================================================;
;                   SUPER MOVES                     ;
;===================================================;

;===================================================;
;                 SPECIAL MOVES                     ;
;===================================================;
[State -1, クッパブレス]
type = ChangeState
value = 1000
triggerall = Command = "Shotgun"
trigger1 = StateType != A
trigger1 = Ctrl

[State -1, クッパブレス]
type = ChangeState
value = 1100
triggerall = Command = "Timble"
trigger1 = StateType != A
trigger1 = Ctrl

[State -1, クッパブレス]
type = ChangeState
value = 1200
triggerall = Command = "Slap Runner"
trigger1 = StateType != A
trigger1 = Ctrl

[State -1, クッパブレス]
type = ChangeState
value = 1300
triggerall = Command = "Skateboard"
trigger1 = StateType != A
trigger1 = Ctrl

[State -1, クッパブレス]
type = ChangeState
value = 1400
triggerall = Command = "Angry Italian Grab"
trigger1 = StateType != A
trigger1 = Ctrl

[State -1, クッパブレス]
type = ChangeState
value = 1500
triggerall = Command = "Charge!"
trigger1 = StateType != A
trigger1 = Ctrl
;===================================================;
;           MISCELLANEOUS MOVES                     ;
;===================================================;
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;===================================================;
;                  NORMAL MOVES                     ;
;===================================================;

;===================================================;
;                  STAND MOVES                      ;
;===================================================;

[State -1, StandX]
type = ChangeState
value = 200
triggerall = command = "x" && command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, StandY]
type = ChangeState
value = 201
triggerall = command = "y" && command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, StandZ]
type = ChangeState
value = 202
triggerall = command = "z" && command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;===================================================;
;                  CROUCH MOVES                     ;
;===================================================;

[State -1, CrouchX]
type = ChangeState
value = 400
triggerall = command = "x" && command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, CrouchY]
type = ChangeState
value = 401
triggerall = command = "y" && command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, CrouchZ]
type = ChangeState
value = 402
triggerall = command = "z" && command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;===================================================;
;                    AIR MOVES                      ;
;===================================================;

[State -1, AirX]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, AirY]
type = ChangeState
value = 601
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, AirZ]
type = ChangeState
value = 602
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl