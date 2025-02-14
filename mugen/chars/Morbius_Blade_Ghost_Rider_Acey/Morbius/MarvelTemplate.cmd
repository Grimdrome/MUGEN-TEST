;-| AI Commands |----------------------------------------------------------

;-| AI |-------------------------------------------------------------
[Command]
name = "CPU1"
command = U, D, F
time = 1

[Command]
name = "CPU2"
command = U, B, F
time = 1

[Command]
name = "CPU3"
command = U, D, D
time = 1

[Command]
name = "CPU4"
command = F, B, U
time = 1

[Command]
name = "CPU5"
command = U, F, U, B
time = 1

[Command]
name = "CPU6"
command = U, D, B
time = 1

[Command]
name = "CPU7"
command = F, F, B
time = 1

[Command]
name = "CPU8"
command = U, D, U
time = 1

[Command]
name = "CPU9"
command = F, B, B
time = 1

[Command]
name = "CPU10"
command = F, F, B, B
time = 1

[Command]
name = "CPU11"
command = U, U, F
time = 1

[Command]
name = "CPU12"
command = U, B, B
time = 1

[Command]
name = "CPU13"
command = U, B, F, F
time = 1

[Command]
name = "CPU14"
command = U, F, B, U
time = 1

[Command]
name = "CPU15"
command = U, B, F, U
time = 1

[Command]
name = "CPU16"
command = U, B, B, B
time = 1

[Command]
name = "CPU17"
command = U, D, B, F
time = 1

[Command]
name = "CPU18"
command = U, D, B, D
time = 1

[Command]
name = "CPU19"
command = U, D, F, U
time = 1

[Command]
name = "CPU20"
command = U, D, U, B
time = 1

[Command]
name = "CPU21"
command = U, D, F, F
time = 1

[Command]
name = "CPU22"
command = F, F, F, F
time = 1

[Command]
name = "CPU23"
command = U, U, U, D
time = 1

[Command]
name = "CPU24"
command = B, B, B
time = 1

[Command]
name = "CPU25"
command = D, D, D, D
time = 1

[Command]
name = "CPU26"
command = D, D, D
time = 1

[Command]
name = "CPU27"
command = F, F, F
time = 1

[Command]
name = "CPU28"
command = U, U, U
time = 1

[Command]
name = "CPU29"
command = U, U, B, B
time = 1

[Command]
name = "CPU30"
command = D, D, F, F
time = 1

;-| AvX Motions |--------------------------------------------------------

[Command]
name = "Pause"
command = s
time = 5

[Command]
name = "Taunt"
command = s;~D, DF, F, s
time = 17

[Command]
name = "Taunt"
command = s;~D, DB, B, s
time = 17

[Command]
name = "Down"
command = D
time = 5

[Command]
name = "Up"
command = U
time = 5


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "DU"
command = D,$U
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery";Required (do not remove)
command = y+z
time = 1

[Command]
name = "recovery";Required (do not remove)
command = x+z
time = 1

[Command]
name = "3P"
command = x+y+z
time = 1

[Command]
name = "3K"
command = a+b+c
time = 1

[Command]
name = "recovery roll"
command = a+b
time = 1

[Command]
name = "recovery roll"
command = b+c
time = 1

[Command]
name = "recovery roll"
command = a+c
time = 1

[Command]
name = "pushblock"
command = x+y
time = 5

[Command]
name = "pushblock"
command = x+z
time = 5

[Command]
name = "pushblock"
command = y+z
time = 5

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
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
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1


;-| Hypers |-----------------------------------------------------------
[Command] ; Amalgam (Quarter circle forward + hard punch & hard kick)
name = "Amalgam"
command = ~D, DF, F, z+c
time = 40

[Command]
name = "anti_xyz"
command = ~F, D, F, x+y

[Command]
name = "anti_xyz"
command = ~F, D, F, y+z

[Command]
name = "anti_xyz"
command = ~F, D, F, z+x

[Command]
name = "qcf_2p"
command = ~D, DF, F, x+y

[Command]
name = "qcf_2p"
command = ~D, DF, F, x+z

[Command]
name = "qcf_2p"
command = ~D, DF, F, y+z

[Command]
name = "qcb_2p"
command = ~D, DB, B, x+y

[Command]
name = "qcb_2p"
command = ~D, DB, B, x+z

[Command]
name = "qcb_2p"
command = ~D, DB, B, y+z

[Command]
name = "qcf_2k"
command = ~D, DF, F, a+b

[Command]
name = "qcf_2k"
command = ~D, DF, F, a+c

[Command]
name = "qcf_2k"
command = ~D, DF, F, b+c

[Command]
name = "qcb_2k"
command = ~D, DB, B, a+b

[Command]
name = "qcb_2k"
command = ~D, DB, B, a+c

[Command]
name = "qcb_2k"
command = ~D, DB, B, b+c

[Command] ; QCB + punch & kick of equal strength
name = "chain"
command = ~D, DB, B, a+x

[Command] ; QCB + punch & kick of equal strength
name = "chain"
command = ~D, DB, B, b+y

[Command] ; QCB + punch & kick of equal strength
name = "chain"
command = ~D, DB, B, c+z


;-| Specials |-----------------------------------------------------------

[Command]
name = "qcf_x"
command = ~D, DB, B, x

[Command]
name = "qcf_y"
command = ~D, DB, B, y

[Command]
name = "qcf_z"
command = ~D, DB, B, z

[Command]
name = "Hypnotic Gaze_a"
command = ~D, DF, F, a

[Command]
name = "Hypnotic Gaze_b"
command = ~D, DF, F, b

[Command]
name = "Hypnotic Gaze_c"
command = ~D, DF, F, c

[Command]
name = "anti_x"
command = ~F, D, F, x
time = 15

[Command]
name = "anti_y"
command = ~F, D, F, y
time = 15

[Command]
name = "anti_z"
command = ~F, D, F, z
time = 15

[Command]
name = "Teleport1"
command = ~D, DB, B, a

[Command]
name = "Teleport2"
command = ~D, DB, B, b

[Command]
name = "Teleport3"
command = ~D, DB, B, c

[command]
name = "Extractor of energy"
command = ~D, F, x
time = 30

[command]
name = "Extractor of energy"
command = ~D, F, y
time = 30

[command]
name = "Extractor of energy"
command = ~D, F, z
time = 30


[Command] ;Charge back, then forward + kick (a/b/c)
name = "charge_B_F_K"
command = ~30$B, F, a
time = 10

[Command] ;Charge back, then forward + kick (a/b/c)
name = "charge_B_F_K"
command = ~30$B, F, b
time = 10

[Command] ;Charge back, then forward + kick (a/b/c)
name = "charge_B_F_K"
command = ~30$B, F, c
time = 10

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; 2. State entry
; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
[State -1, AIActivate]
type = VarSet
triggerall = var(59) != 1
triggerall = RoundState != 3
trigger1  = command = "CPU1"
trigger2  = command = "CPU2"
trigger3  = command = "CPU3"
trigger4  = command = "CPU4"
trigger5  = command = "CPU5"
trigger6  = command = "CPU6"
trigger7  = command = "CPU7"
trigger8  = command = "CPU8"
trigger9  = command = "CPU9"
trigger10  = command = "CPU10"
trigger11  = command = "CPU11"
trigger12  = command = "CPU12"
trigger13  = command = "CPU13"
trigger14  = command = "CPU14"
trigger15  = command = "CPU15"
trigger16  = command = "CPU16"
trigger17  = command = "CPU17"
trigger18  = command = "CPU18"
trigger19  = command = "CPU19"
trigger20  = command = "CPU20"
trigger21  = command = "CPU21"
trigger22  = command = "CPU22"
trigger23  = command = "CPU23"
trigger24  = command = "CPU24"
trigger25  = command = "CPU25"
trigger26  = command = "CPU26"
trigger27  = command = "CPU27"
trigger28  = command = "CPU28"
trigger29  = command = "CPU29"
trigger30  = command = "CPU30"
var(59) = 1

;======================================================================
;===========================================================================
;======================================================================
; A.I Commands
;-----------------------------------------------------------------------

;====================================================================
;GUARD/BLOCK CODE
;====================================================================

[State -1, standGuard]
type = ChangeState
triggerall = var(59) && random <= 900
triggerall =(StateType != A) && (Ctrl)&& (enemynear, Facing != Facing) 
trigger1 = (P2StateType != C) && (P2MoveType = A)
;trigger2 = inguarddist  
value = 130

[State -1, airGuardHitBack]
type = ChangeState
triggerall = var(59) && random <= 900
triggerall =(StateType != A) && (enemynear, Facing != Facing)
triggerall = (P2StateType = C) && (P2MoveType = A)  
trigger1 = StateNo = 150
;trigger2 = inguarddist  
value = 152

[State -1, crouchGuard]
type = ChangeState
triggerall = var(59) && random <= 900
triggerall = (StateType != A) && (Ctrl) && (enemynear, Facing != Facing) 
trigger1 = (P2StateType = C) && (P2MoveType = A)  
;trigger2 = inguarddist  
value = 131

[State -1, standGuardHitBack]
type = ChangeState
triggerall = var(59) && random <= 900
triggerall =(StateType != A) && (enemynear, Facing != Facing) 
triggerall = (P2StateType != C) && (P2MoveType = A) 
trigger1 = StateNo = 152
;trigger2 = inguarddist  
value = 150

[State -1, airGuard]
type = ChangeState
triggerall = var(59) && random <= 900
triggerall = (StateType = A) && (Ctrl) && (enemynear, Facing != Facing) 
trigger1 = P2MoveType = A 
;trigger2 = inguarddist  
value = 132

;---------------------------------------------------------------------------
;&& (StateNo = 420) && (MoveHit = 1)

;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 700
triggerall = (StateType != A) && Var(59) && random < 200
trigger1 = (StateNo = 420) && (MoveHit = 1)

[State -1, megaBeam]
type = ChangeState
value = 3000
triggerall = power >= 1000 && var(59) && p2bodydist x > 50
triggerall = StateType != A && MoveType != H && RoundState = 2
trigger1 = enemynear, numproj = 0 && enemynear, movetype != A && random < 100  && ctrl

[State -1, megaBeam]
type = ChangeState
value = 3200
triggerall = power >= 1000 && var(59) && p2bodydist x <= 80
triggerall = StateType != A && MoveType != H && RoundState = 2
trigger1 = enemynear, numproj = 0 && enemynear, movetype != A && random < 300  && ctrl

 [State -1, megaBeam]
type = ChangeState
value = 3300
triggerall = power >= 1000 && var(59) && p2bodydist x > 50
triggerall = StateType != A && MoveType != H && RoundState = 2
trigger1 = enemynear, numproj = 0 && enemynear, movetype != A && random < 100  && ctrl

;---------------------------------------------------------------------------
; Special1

[state -1]  ; gaze
type = ChangeState
;triggerall = NumprojID(1009) = 0
triggerall = var(59) && RoundState = 2
triggerall = p2stateno != 1110
triggerall = (Ctrl) && (Statetype != A) && (random = [0,500])
trigger1 = (p2bodydist x > 50) && (prevstateno != 5120) && (statetype != A)
trigger1 = p2bodydist y >-70 && p2bodydist y <70
trigger1 = p2bodydist x <= 100
value = 1000

[state -1]  ; blood
type = ChangeState
;triggerall = NumprojID(1009) = 0
triggerall = var(59) && RoundState = 2
triggerall = (Ctrl) && (Statetype != A) && (random = [0,500])
trigger1 = (p2bodydist x > 50) && (prevstateno != 5120) && (statetype != A)
trigger1 = p2bodydist y >-70 && p2bodydist y <70
trigger1 = p2bodydist x <= 100
value = 1500

[state -1]  ; teleport
type = ChangeState
;triggerall = numhelper(1301) = 0 && numhelper(1302) = 0
triggerall = var(59) && RoundState = 2
triggerall = (Ctrl) && (Statetype != A) && (random = [0,50])
trigger1 = (p2bodydist x > 50) && (prevstateno != 5120) && (statetype != A)
trigger1 = p2bodydist y >-70 && p2bodydist y <70
value = 1104

[State -1, Special1] ; bat attack
type = ChangeState
value = 1320
triggerall = var(59) && ctrl && prevstateno != 1320
triggerall = MoveType != H && RoundState = 2 && !IsHelper 
triggerall = NumHelper(1301) = 0 && StateType != A
;trigger1 = p2stateno = 1001
trigger1 = P2BodyDist X > 70 && P2BodyDist X < 170 && Random < 250
trigger1 = P2BodyDist Y = [-50,50]
trigger2 = p2bodydist x >= 150

[State -1, Special1] ; bat attack
type = ChangeState
value = 1310
triggerall = var(59) && ctrl && prevstateno != 1310
triggerall = MoveType != H && RoundState = 2 && !IsHelper 
triggerall = NumHelper(1301) = 0 && StateType != A
;trigger1 = p2stateno = 1001
trigger1 = P2BodyDist X > 70 && P2BodyDist X < 170 && Random < 250
trigger1 = P2BodyDist Y = [-50,50]
trigger2 = p2bodydist x >= 150

[State -1, Special1] ; bat attack
type = ChangeState
value = 1300
triggerall = var(59) && ctrl && prevstateno != 1300
triggerall = MoveType != H && RoundState = 2 && !IsHelper 
triggerall = NumHelper(1301) = 0 && StateType != A
;trigger1 = p2stateno = 1001
trigger1 = P2BodyDist X > 70 && P2BodyDist X < 170 && Random < 250
trigger1 = P2BodyDist Y = [-50,50]
trigger2 = p2bodydist x >= 150

[State -1, Special1] ; anti-air
type = ChangeState
value = 1400
triggerall = var(59) && ctrl && P2BodyDist X < 60 && enemynear, movetype != H
triggerall = StateType != A && MoveType != H && RoundState = 2
trigger1 = enemynear, numproj = 0 && enemynear, statetype = A && random < 600
trigger2 = enemynear, numproj = 0 && enemynear, statetype != A && random < 300

;teleport
[State -1, ChangeState]
type = ChangeState
triggerall = Var(59)>=1&& StateType != A
triggerall = (P2Dist x >= 1) && (P2Dist x < 50)
triggerall = Random <= 50
triggerall = P2Stateno = [1000,2000]
triggerall = P2life >= 1
trigger1 = ctrl = 1
value = 1100
persistent = 0

;teleport near
[State -1, ChangeState]
type = ChangeState
triggerall = Var(59)>=1&& StateType != A
triggerall = (P2Dist x >= 50)
triggerall = Random <= 250
triggerall = P2life >= 1
triggerall = P2Stateno = [1000,2000]
trigger1 = ctrl = 1
value = 1104
persistent = 0

;teleport out
[State -1, ChangeState]
type = ChangeState
triggerall = Var(59)>=1&& StateType != A
triggerall = (P2Dist x >= 1) && (P2Dist x < 50)
triggerall = Random <= 50
triggerall = P2life >= 1
triggerall = P2Stateno = [1000,2000]
trigger1 = ctrl = 1
value = 1103
persistent = 0

;---------------------------------------------------------------------------
;====================================================================
; Main Standing Special

;---------------------------------------------------------------------------
; Fwd Dash
[State -1, FwdDash]
type = ChangeState
value = 100
triggerall = var(59) && RoundState = 2 && ctrl  && prevstateno != 100 && random < 200
triggerall = (statetype = S) && enemynear, p2dist X >= 50
triggerall = Var(20) != 3 && NumHelper(25) = 0 && p2bodydist x > 50
trigger1 = enemynear, movetype != A && enemynear, numproj = 0 && enemynear, statetype != L
trigger2 = enemynear, statetype = L && random <= 300 && enemy, numproj = 0

;====================================================================
; Stand, Crouch, Jump / Punch, Kick - NORMAL (only 3 punches/kicks)
;====================================================================

;---------------------------------------------------------------------------
; Standing basics
; 
; Punches: 200, 210, 220
; Kicks: 230, 240, 250
;---------------------------------------------------------------------------
;crouch Strong punch (launcher)
[State -1, Crouch launcher]
type = ChangeState
value = 420
triggerall = var(59) && ctrl && random < 200
triggerall = StateType != A && MoveType != H && RoundState = 2 && !IsHelper
trigger1 = p2bodydist X <= 20 && (enemynear, anim = 5300) && (StateNo = 420) && movehit
trigger2 = p2bodydist X <= 20 && (enemynear, statetype != A) && Random = [150,850]
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = (statetype = S) && var(59) && p2statetype != L && RoundState = 2
trigger1 = ctrl = 1
trigger1 = (enemynear, p2dist x <= 60 && enemynear, movetype != A && Random <= 200)

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall =(statetype = S) && var(59) && p2statetype != L && RoundState = 2

; (chain combos)
trigger1 = (stateno = 200) && (movecontact >= 1)

;---------------------------------------------------------------------------
; Stand Hard Punch
[State -1, Stand Hard Punch]
type = ChangeState
value = 220
triggerall = var(59) && p2statetype != L && RoundState = 2
triggerall = statetype = S

; (chain combos)
trigger1 = ((stateno = 200) || (stateno = 210)) && (movecontact >= 1)
trigger2 = ctrl = 1
trigger2 = (enemynear, p2dist x <= 60 && enemynear, movetype != A && Random <= 200)

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall =(statetype = S) && var(59) && p2statetype != L && RoundState = 2
trigger1 = (enemynear, p2dist x <= 60 && enemynear, movetype != A && (Random <= 400&& random >200)) && ctrl

;---------------------------------------------------------------------------
; Stand Medium Kick
[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = var(59) && p2statetype != L && RoundState = 2
triggerall = statetype = S

; (chain combos)
trigger1= (stateno = 230) && (movecontact >= 1)

;---------------------------------------------------------------------------
; Stand Hard Kick
[State -1, Stand Hard Kick]
type = ChangeState
value = 250
triggerall = var(59) && enemynear, statetype != L && RoundState = 2
triggerall = statetype = S
; (chain combos)
trigger1 = ((stateno = 230) || (stateno = 240)) && (movecontact >= 1)
trigger2 = ctrl = 1
trigger2 = (enemynear, p2dist x <= 60 && enemynear, movetype != A && Random <= 200)

;---------------------------------------------------------------------------
; Throws
; 
; Standing : 800
; Air : 810
;---------------------------------------------------------------------------

; Throws
[State -1, Throw]
type = ChangeState
value = 800
triggerall = var(59)
triggerall = p2bodydist X <= 20
triggerall = random < 900
triggerall = statetype = S
triggerall = p2statetype != L
trigger1 = p2bodydist y = [-25,25]
trigger1 = ctrl
trigger2 = var(17) = [1,2]
trigger2 = enemynear,moveguarded
;---------------------------------------------------------------------------
[State -1,Ground Throw]
type = ChangeState
value = 800
triggerall = var(59) > 0 && roundstate = 2
triggerall = p2statetype != A
triggerall = p2movetype = A
triggerall = random <= 60*var(59)
triggerall = p2bodydist x = [0,63+7*(vel x+enemynear,vel x)]
triggerall = P2BodyDist X <= 20
triggerall = ctrl
trigger1 = Statetype != A
;-----------------------------

;Throw
[State -1,Ground Throw]
type = ChangeState
value = 800
triggerall = var(59) > 0 && roundstate = 2
triggerall = p2statetype != A
triggerall = p2movetype != H
triggerall = !inguarddist && p2statetype != L
triggerall = random <= 15*var(59)
triggerall = p2bodydist x = [0,63+7*(vel x+enemynear,vel x)]
triggerall = P2BodyDist X <= 20
triggerall = ctrl
trigger1 = Statetype != A

;---------------------------------------------------------------------------
; Crouching basics
; Punches: 400, 410, 420
; Kicks: 430, 440, 450
;---------------------------------------------------------------------------
; Crouch Light Punch
[State -1, Crouch Light Punch]
type = ChangeState
value = 400
triggerall = var(59) && statetype = C && RoundState = 2 && ctrl
trigger1 = (enemynear, p2dist x <= 60 && enemynear, movetype != A && (Random <= 600&& random >400))

;---------------------------------------------------------------------------
; Crouch Medium Punch
[State -1, Crouch Medium Punch]
type = ChangeState
value = 410
triggerall = var(59) && statetype = C && RoundState = 2 && ctrl

; (chain combos)
trigger1 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Punch
[State -1, Crouch Hard Punch]
type = ChangeState
value = 420
triggerall = var(59) && statetype = C && RoundState = 2

; (chain combos)
trigger1 = (stateno = 410) && movecontact

;---------------------------------------------------------------------------
; Crouch Light Kick
[State -1, Crouch Light Kick]
type = ChangeState
value = 430
triggerall = var(59) && statetype = C && RoundState = 2 && ctrl
trigger1 = (enemynear, p2dist x <= 65 && enemynear, movetype != A && (Random <= 900&& random >600))

;---------------------------------------------------------------------------
; Crouch Medium Kick
[State -1, Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = var(59) && statetype = C && RoundState = 2 && ctrl

; (chain combos)
trigger1 = (stateno = 430) && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Kick
[State -1, Crouch Hard Kick]
type = ChangeState
value = 450
triggerall = var(59) && statetype = C && RoundState = 2

; (chain combos)
trigger1 = (stateno = 440) && movecontact

;---------------------------------------------------------------------------
; Air basics
; Punches: 600, 610, 620
; Kicks: 630, 640, 650
;---------------------------------------------------------------------------
; Air Light Punch
[State -1, Air Light Punch]
type = ChangeState
value = 600
triggerall = var(59) && RoundState = 2 && stateno != 100 && statetype = A && ctrl
trigger1 = p2dist X < 60 && (p2dist Y > -3 && p2dist Y < 3)

;---------------------------------------------------------------------------
; Air Medium Punch
[State -1, Air Medium Punch]
type = ChangeState
value = 610
triggerall = var(59) && RoundState = 2 && stateno != 100 && statetype = A

; (chain combos)
trigger1 = (stateno = 630) && movecontact

;---------------------------------------------------------------------------
; Air Hard Punch
[State -1, Air Hard Punch]
type = ChangeState
value = 620
triggerall = var(59) && RoundState = 2 && stateno != 100 && statetype = A

; (chain combos)
trigger1 = stateno = 640 && movecontact

;---------------------------------------------------------------------------
; Air Light Kick
[State -1, Air Light Kick]
type = ChangeState
value = 630
triggerall = var(59) && RoundState = 2 && stateno != 100 && statetype = A

; (chain combos)
trigger1 = (stateno = 600) && (movecontact = 1)

;---------------------------------------------------------------------------
; Air Medium Kick
[State -1, Air Medium Kick]
type = ChangeState
value = 640
triggerall = var(59) && RoundState = 2 && stateno != 100 && statetype = A

; (chain combos)
trigger1 = (stateno = 610) && movecontact

;---------------------------------------------------------------------------
; Air Hard Kick
[State -1, Air Hard Kick]
type = ChangeState
value = 650
triggerall = var(59) && RoundState = 2 && stateno != 100
triggerall = statetype = A && ctrl

; (chain combos)
trigger1 = stateno = 620 && movecontact

;----------------------------------------------------------------------
;----------------------------------------------------------------------
; Air combo
[State -1, ChangeState]
type = ChangeState
triggerall = Var(59) && StateType = A
trigger1 = (StateNo = [600,620]) && (MoveContact)
value = IfElse(StateNo = 600,630,IfElse(StateNo = 610,640,650))
persistent = 0

[State -1, ChangeState]
type = ChangeState
triggerall = Var(59) && StateType = A
trigger1 = (StateNo = [630,640]) && (MoveContact)
value = IfElse(StateNo = 630,610,620)
;---------------------------------------------------------------------------
;-----------------------------
;======================================================================
;User Input Attacks

;----------------------------------------------------------------------
; Amalgam Hyper
;[State -1, Amalgam]
;type = ChangeState
;value = 4000
;triggerall = power = 3000 && !Var(59)
;triggerall = StateType != A && MoveType != H
;triggerall = (ctrl = 1) && (!IsHelper)
;trigger1 = command = "Amalgam"

;---------------------------------------------------------------------------
; Hyper1    anti_xyz



[State -1, Hyper1]
type = ChangeState
value = 3000
triggerall = power >= 1000
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (!IsHelper)
triggerall = command = "qcf_2p"
trigger1 = ctrl = 1
trigger2 = (stateno = 1000) && (movecontact >= 1)
trigger3 = (stateno = 1050) && (movecontact >= 1)
trigger4 = (stateno = 1060) && (movecontact >= 1)

[State -1, Hyper2]
type = ChangeState
value = 3200
triggerall = power >= 1000
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = !IsHelper
triggerall = command = "qcb_2p"
trigger1 = ctrl
trigger2 = (HitdefAttr = SC, NA) && MoveContact

[State -1, Hyper1]
type = ChangeState
value = 3300
triggerall = power >= 1000 && numexplod(3401)=0 && numexplod(3301)=0
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (!IsHelper)
triggerall = command = "qcf_2k"
trigger1 = ctrl = 1





;---------------------------------------------------------------------------
; Special1
[State -1, Special1]
type = ChangeState
value = 1400
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (!IsHelper)
triggerALL = (command = "anti_x") || (command = "anti_y") || (command = "anti_z")
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact >= 1)
trigger3 = (stateno = 210) && (movecontact >= 1)
trigger4 = (stateno = 215) && (movecontact >= 1)
trigger5 = (stateno = 220) && (movecontact >= 1)
trigger6 = (stateno = 230) && (movecontact >= 1)
trigger7 = (stateno = 240) && (movecontact >= 1)
trigger8 = (stateno = 245) && (movecontact >= 1)
trigger9 = (stateno = 250) && (movecontact >= 1)
trigger10 = (stateno = 400) && (movecontact >= 1)
trigger11 = (stateno = 410) && (movecontact >= 1)
trigger12 = (stateno = 420) && (movecontact >= 1)
trigger13 = (stateno = 430) && (movecontact >= 1)
trigger14 = (stateno = 440) && (movecontact >= 1)
trigger15 = (stateno = 450) && (movecontact >= 1)

; Special1
[State -1, Special1]
type = ChangeState
value = 1000
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (ctrl = 1) && (!IsHelper) && enemynear, stateno != 1000
trigger1 = (command = "Hypnotic Gaze_a") || (command = "Hypnotic Gaze_b") || (command = "Hypnotic Gaze_c")

[State -1, Special1]
type = ChangeState
value = 1300
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (!IsHelper)
triggerALL = (command = "qcf_z")
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact >= 1)
trigger3 = (stateno = 210) && (movecontact >= 1)
trigger4 = (stateno = 215) && (movecontact >= 1)
trigger5 = (stateno = 220) && (movecontact >= 1)
trigger6 = (stateno = 230) && (movecontact >= 1)
trigger7 = (stateno = 240) && (movecontact >= 1)
trigger8 = (stateno = 245) && (movecontact >= 1)
trigger9 = (stateno = 250) && (movecontact >= 1)
trigger10 = (stateno = 400) && (movecontact >= 1)
trigger11 = (stateno = 410) && (movecontact >= 1)
trigger12 = (stateno = 420) && (movecontact >= 1)
trigger13 = (stateno = 430) && (movecontact >= 1)
trigger14 = (stateno = 440) && (movecontact >= 1)
trigger15 = (stateno = 450) && (movecontact >= 1)

[State -1, Special1]
type = ChangeState
value = 1310
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (!IsHelper)
triggerALL = (command = "qcf_y")
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact >= 1)
trigger3 = (stateno = 210) && (movecontact >= 1)
trigger4 = (stateno = 215) && (movecontact >= 1)
trigger5 = (stateno = 220) && (movecontact >= 1)
trigger6 = (stateno = 230) && (movecontact >= 1)
trigger7 = (stateno = 240) && (movecontact >= 1)
trigger8 = (stateno = 245) && (movecontact >= 1)
trigger9 = (stateno = 250) && (movecontact >= 1)
trigger10 = (stateno = 400) && (movecontact >= 1)
trigger11 = (stateno = 410) && (movecontact >= 1)
trigger12 = (stateno = 420) && (movecontact >= 1)
trigger13 = (stateno = 430) && (movecontact >= 1)
trigger14 = (stateno = 440) && (movecontact >= 1)
trigger15 = (stateno = 450) && (movecontact >= 1)

[State -1, Special1]
type = ChangeState
value = 1320
triggerall = (StateType != A) && (MoveType != H) && !Var(59)
triggerall = (!IsHelper)
triggerALL = (command = "qcf_x")
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact >= 1)
trigger3 = (stateno = 210) && (movecontact >= 1)
trigger4 = (stateno = 215) && (movecontact >= 1)
trigger5 = (stateno = 220) && (movecontact >= 1)
trigger6 = (stateno = 230) && (movecontact >= 1)
trigger7 = (stateno = 240) && (movecontact >= 1)
trigger8 = (stateno = 245) && (movecontact >= 1)
trigger9 = (stateno = 250) && (movecontact >= 1)
trigger10 = (stateno = 400) && (movecontact >= 1)
trigger11 = (stateno = 410) && (movecontact >= 1)
trigger12 = (stateno = 420) && (movecontact >= 1)
trigger13 = (stateno = 430) && (movecontact >= 1)
trigger14 = (stateno = 440) && (movecontact >= 1)
trigger15 = (stateno = 450) && (movecontact >= 1)

;Extractor of energy
[State -1, Extractor of energy]
type = ChangeState
value = 1500
triggerall = command = "Extractor of energy"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact


[State -1, Teleport3]
type = ChangeState
value = 1100
triggerall = command = "Teleport3"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Teleport4
[State -1, Teleport1]
type = ChangeState
value = 1103
triggerall = command = "Teleport1"
trigger1 = ctrl

;---------------------------------------------------------------------------
;Teleport5
[State -1, Teleport5]
type = ChangeState
value = 1104
triggerall = command = "Teleport2"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Standing Push Block (AKA advancing guard)
;[State -1, SPushBlock]
;type = ChangeState
;value = 750
;triggerall = command = "pushblock" && StateType = S && !Var(59)
;trigger1 = StateNo = 130
;trigger2 = StateNo = [150, 151]
;
;;---------------------------------------------------------------------------
;; Crouching Push Block
;[State -1, CPushBlock]
;type = ChangeState
;value = 752
;triggerall = command = "pushblock" && StateType = C && !Var(59)
;trigger1 = StateNo = 131
;trigger2 = StateNo = [152, 153]
;

[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "pushblock"
triggerall = statetype = S
triggerall = ctrl
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
;Fwd Dash
[State -1, FwdDash]
type = ChangeState
value = 100
triggerall = command != "holdback" && !Var(59)
triggerall = statetype = S;
triggerall = ctrl = 1
trigger1 = command = "FF"
;trigger2 = command = "3P"

;---------------------------------------------------------------------------
;Back Dash
[State -1, BackDash]
type = ChangeState
value = 105
triggerall = statetype = S && !Var(59)
triggerall = ctrl = 1
trigger1 = command = "BB"
;trigger2 = command = "holdback"
;trigger2 = command = "3P"

;---------------------------------------------------------------------------
; Superjump
[State -1, Superjump]
type = ChangeState
value = 700
triggerall = (Var(0) = 0) && !Var(59)
trigger1 = (command = "DU") && (Ctrl) && (StateType != A)
;trigger2 = (command = "3K") && (Ctrl) && (StateType != A)
trigger2 = stateno = 250 && movehit && command="holdup"

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = statetype = S && !Var(59)
triggerall = ctrl = 1
trigger1 = command = "Taunt"


;---------------------------------------------------------------------------
; Throws
;
; (none yet)
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Standing basics
;
; Punches: 200, 210, 220
; Kicks: 230, 240, 250
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = (command = "x") && (statetype = S) && !Var(59)
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = (command = "y") && (statetype = S) && !Var(59) && (command != "holddown")
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (StateNo = 200) && movecontact
trigger3 = (StateNo = 230) && movecontact

;---------------------------------------------------------------------------
; Stand Hard Punch
[State -1, Stand Hard Punch]
type = ChangeState
value = 220
triggerall = (command = "z") && (statetype = S) && !Var(59) && (command != "holddown")
trigger1 = ctrl = 1

; (chain combos)
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 215)) && movecontact
trigger3 = (StateNo = 240) && movecontact

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = (command = "a") && (statetype = S) && !Var(59) && (command != "holddown")
trigger1 = ctrl = 1
trigger2 = (StateNo = 200) && movecontact

;---------------------------------------------------------------------------
; Stand Medium Kick
[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = (command = "b") && (statetype = S) && !Var(59) && (command != "holddown")
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (stateno = 230) && movecontact
trigger3 = ((StateNo = 210) || (stateno = 215)) && movecontact

;---------------------------------------------------------------------------
; Stand Hard Kick
[State -1, Stand Hard Kick]
type = ChangeState
value = 250
triggerall = (command = "c") && !Var(59) && (command != "holddown") && (statetype != A)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = ((stateno = 230) || (stateno = 240)|| (stateno = 245)) && movecontact
trigger3 = StateNo = 210 && movecontact
trigger4 = stateno = 440 && movecontact

;---------------------------------------------------------------------------
; Crouching basics
;---------------------------------------------------------------------------
; Crouch Light Punch
[State -1, Crouch Light Punch]
type = ChangeState
value = 400
triggerall = (command = "x") && (command = "holddown") && (statetype != A) && !Var(59)
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
; Crouch Medium Punch
[State -1, Crouch Medium Punch]
type = ChangeState
value = 410
triggerall = (command = "y") && (command = "holddown") && (statetype != A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (stateno = 400) && movecontact
trigger3 = (StateNo = 430) && movecontact
trigger4 = (stateno = 200) && movecontact
trigger5 = (StateNo = 230) && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Punch
[State -1, Crouch Hard Punch]
type = ChangeState
value = 420
triggerall = (command = "z") && (command = "holddown") && (statetype != A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (stateno = [400,410]) && movecontact
trigger3 = (StateNo = [430,440]) && movecontact
trigger4 = (stateno = [200,210]) && movecontact
trigger5 = (StateNo = [230,240]) && movecontact

;---------------------------------------------------------------------------
; Crouch Light Kick
[State -1, Crouch Light Kick]
type = ChangeState
value = 430
triggerall = (command = "a") && (command = "holddown") && (statetype != A) && !Var(59)
trigger1 = ctrl = 1
trigger2 = (StateNo = 400) && movecontact

;---------------------------------------------------------------------------
; Crouch Medium Kick
[State -1, Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = (command = "b") && (command = "holddown") && (statetype != A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (stateno = 430) && movecontact
trigger3 = (StateNo = [400,410]) && movecontact
trigger4 = (stateno = 230) && movecontact
trigger5 = (StateNo = [200,210]) && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Kick
[State -1, Crouch Hard Kick]
type = ChangeState
value = 450
triggerall = (command = "c") && (command = "holddown") && (statetype != A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (stateno = [400,410]) && movecontact
trigger3 = (StateNo = [430,440]) && movecontact
trigger4 = (stateno = [200,210]) && movecontact
trigger5 = (StateNo = [230,240]) && movecontact

;---------------------------------------------------------------------------
; Air basics
;---------------------------------------------------------------------------
; Air Light Punch
[State -1, Air Light Punch]
type = ChangeState
value = 600
triggerall = (command = "x") && (statetype = A) && !Var(59)
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
; Air Medium Punch
[State -1, Air Medium Punch]
type = ChangeState
value = 610
triggerall = (command = "y") && (statetype = A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = ((stateno = 600) || (stateno = 630)) && movecontact

;---------------------------------------------------------------------------
; Air Hard Punch
[State -1, Air Hard Punch]
type = ChangeState
value = 620
triggerall = (command = "z") && (statetype = A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = ((stateno = 600) || (stateno = 610) || (stateno = 630) || (stateno = 640)|| (stateno = 615)) && movecontact

;---------------------------------------------------------------------------
; Air Light Kick
[State -1, Air Light Kick]
type = ChangeState
value = 630
triggerall = (command = "a") && (statetype = A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = (stateno = 600) && movecontact

;---------------------------------------------------------------------------
; Air Medium Kick
[State -1, Air Medium Kick]
type = ChangeState
value = 640
triggerall = (command = "b") && (statetype = A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = ((stateno = 600) || (stateno = 615) || (stateno = 610) || (stateno = 630)) && movecontact

;---------------------------------------------------------------------------
; Air Hard Kick
[State -1, Air Hard Kick]
type = ChangeState
value = 650
triggerall = (command = "c") && (statetype = A) && !Var(59)
trigger1 = ctrl = 1

; (chain combos)
trigger2 = ((stateno = 600) || (stateno = 615) || (stateno = 610) || (stateno = 620) || (stateno = 630) || (stateno = 640)) && movecontact

;-----------------------
;  DCvM Template Files
;      provided by
;       Buyog2099
;(based on MEE template
;  by Kitsune Sniper)
;         ***
;   Thanks, Kitsune!
;-----------------------
 ;---------------------------------------------------------------------------
;[State -1, Triangle Jump]
;type = ChangeState
;value = 7730
;triggerall = enemynear, name != "helibonus"
;triggerall = movetype != H
;;triggerall = stateno != 1340 && stateno != 1350
;trigger1 = command = "holdfwd" && ctrl && var(59) = 0  && prevstateno !=  7730 &&  (backedgebodydist = 0) && (pos y < -80); && prevstateno != [600,650]
;trigger2 = var(59) = 1 && ctrl && random >= 900 && vel y > 0 && (backedgebodydist = 0) && (pos y < -80); && prevstateno != [600,650]

;---------------------------------------------------------------------------
;------------------------ Lie Down Recovery Roll ---------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Lie Down Forward Recovery Roll

;[State -1]
;type = null;ChangeState
;value = 832
;triggerall = Var(59) != 2
;triggerall = command = "holdfwd"
;triggerall = time = 1
;triggerall = life > 0
;trigger1 = stateno = 5120
;trigger1 = alive = 1

;---------------------------------------------------------------------------
; Lie Down Backward Recovery Roll

;[State -1]
;type = null;ChangeState
;value = 855
;triggerall = Var(59) != 2
;triggerall = command = "holdback"
;triggerall = time = 1
;triggerall = life > 0
;trigger1 = stateno = 5120
;trigger1 = alive = 1

;---------------------------------------------------------------------------
;;Guard Push (Standing)
;[State -1, Guard Push]
;type = ChangeState
;value = 7610
;triggerall = !var(59)
;triggerall = command = "recovery"
;triggerall = statetype != A
;triggerall = enemynear, name != "helibonus"
;triggerall = enemynear, name != "Prime Sentinels"
;triggerall = enemynear, name != "Trainingroom"
;triggerall = enemynear, HitDefAttr = SCA,NA,NT,NP,SA,ST,SP
;trigger1 = stateno = [150,153]

