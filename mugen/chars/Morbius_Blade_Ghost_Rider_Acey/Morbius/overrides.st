; States file for {character} -- Overrides and Common states
;
;---------------------------------------------------------------------------
; Vars:
;   0: for Super Jump (0=vertical, 1=forward, -1=backward)
;   2: keep track of power level (for levelup sounds)
;  50: Desperation quote ("DANGER!" or whatever)
;  59: AI flag
; Helpers:
;   0: superjump opponent position indicator
; Explods:
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------
[State -3, RemoveExplod]
type = RemoveExplod
trigger1 =  anim != 3000 && numexplod(3202)>=0
id = 3202

[State -3, RemoveExplod]
type = RemoveExplod
trigger1 =  anim != 3000 && numexplod(3020)>=0
id = 3020
;---------------------------------------------------------------------------
; RUN_FWD
[Statedef 100]
type    = S
movetype = I
physics = N
anim = 100
sprpriority = 1
velset = const(velocity.run.fwd.x)+var(20), 0

[State 100, PlaySnd]
type = PlaySnd
trigger1 = animelem =1
value = 173,1


[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, 4]
type = ChangeState
triggerall = !Var(59)
trigger1 = command != "holdfwd";Time = 135
value = 0
ctrl = 1

[State 100, 4]
type = ChangeState
triggerall = Var(59)
trigger1 = time > 15
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------
[Statedef -2]

;=========AvX Menu Pause===========

[State -2, Pause Menu]
Type = null;Helper
trigger1 = AILevel = 0
trigger1 = NumHelper(40500) = 0
Name = "Pause"
ID = 40500
Pos = 0, 0
PosType = left
StateNo = 40500
KeyCtrl = 1
OwnPal = 1

;=========AvX Public Release Damage Dampiner===========
;The AvX project contains a Damage Multiplier. Such a system would create
;an unfair advantage outside of the closed game proejct. A damage dampiner
;has been added to the character in order to balance the large combo system
;found in the AvX game.

[State -2, Damage based on hits]
type=varset
trigger1= numenemy
fvar(12)= enemynear,gethitvar(hitcount)
ignorehitpause=1

[State -2, Reset var when the opponent recovers]
type=varset
trigger1= numenemy
trigger1= (enemynear,movetype!=H)
trigger2= !numenemy
fvar(12)=0

[State -2, Dampener]
type=varset
trigger1=1
fvar(10)= ifelse(fvar(12)<9,ifelse(fvar(12)=0, 1, ifelse(fvar(12)=1, .9, .86**fvar(12))),.25)
ignorehitpause=1

[State -2, Dampener itself]
type=attackmulset
trigger1= 1
value= fvar(10)
ignorehitpause=1
ignorehitpause=1

;=========AvX Special Get Hit State Recognition===========
;Fvar(30)
;0 = Not Hit
;1 = Ground Bounce - stateno 5130
;2 = Wall Bounce - stateno 5045
;3 = Both

[State -2, VarSet]
type = VarSet
trigger1 = fvar(30) = 0
trigger1 = enemynear,stateno = 5132 ;Ground Bounce
fv = 30
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = fvar(30) = 0
trigger1 = enemynear,stateno = 5048 ;Wall Bounce
fv = 30
value = 2

[State -2, VarSet]
type = VarSet
trigger1 = fvar(30) = 2
trigger1 = enemynear,stateno = 5132 ;Ground Bounce
trigger2 = fvar(30) = 1
trigger2 = enemynear,stateno = 5048 ;Wall Bounce
fv = 30
value = 3

[State -2, VarSet]
type = VarSet
trigger1 = fvar(30) > 0
trigger1 = enemynear,movetype!=H
fv = 30
value = 0

[State -2, VarSet];OTG Recognition
type = VarSet
trigger1 = fvar(29) > 0
trigger1 = enemynear,movetype!=H
trigger1 = enemynear,stateno != 5110
fv = 29
value = 0

[State -2, VarSet]
type = ParentVarSet
trigger1 = hitdefattr = SCA, NA, NP, NT
trigger1 = enemynear, movetype =H
fv = 25
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = hitdefattr = SCA, NA, NP, NT
trigger1 = enemynear, movetype =H
fv = 25
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = movetype !=A
trigger1 = enemynear, movetype !=H
fv = 25
value = 0

[State -2, VarSet]
type = ParentVarSet
trigger1 = hitdefattr = SCA, SA, SP, ST
trigger1 = enemynear, movetype =H
fv = 26
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = hitdefattr = SCA, SA, SP, ST
trigger1 = enemynear, movetype =H
fv = 26
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = movetype !=A
trigger1 = enemynear, movetype !=H
fv = 26
value = 0

[State -2, VarSet]
type = ParentVarSet
trigger1 = hitdefattr = SCA, HA, HP, HT
trigger1 = enemynear, movetype =H
fv = 27
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = hitdefattr = SCA, HA, HP, HT
trigger1 = enemynear, movetype =H
fv = 27
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = movetype !=A
trigger1 = enemynear, movetype !=H
fv = 27
value = 0

[State -2, Varadd];hitcount
type = Varadd
trigger1 = movehit
trigger1 = enemynear, time = 0
trigger1 = p2stateno = [5000,5899]
fv = 28
value = 1
ignorehitpause = 1

[State -2, VarSet];hitcount
type = VarSet
trigger1 = movetype !=A
trigger1 = enemynear, movetype !=H
trigger1 = p2stateno != [5000,5899]
fv = 28
value = 0

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = stateno != 1011 && stateno != 1050
id = 8001



[State -2, PowerAdd]
type = null;PowerAdd
triggerall = StageVar(info.name) =  "B"
triggerall = roundno = 1
trigger1 = p2name = "Cable Training"
trigger1 = enemynear,var(40)>= 4
value = 3000

[State -2, PowerAdd]
type = null;PowerAdd
triggerall = StageVar(info.name) =  "B"
triggerall = roundno = 2
trigger1 = roundstate < 2
trigger1 = p2name = "Cable Training"
value = -3000

[State -2, StopSnd]
type = null;StopSnd
trigger1 = p2stateno = 5149
channel = 0

[State -2, StopSnd]
type = null;StopSnd
trigger1 = p2stateno = 5149
channel = 1

[State -2, StopSnd]
type = null;StopSnd
trigger1 = p2stateno = 5149
channel = 2

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(15601)=0
id = 15650

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(15601)=0
id = 15651

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(15601)=0
id = 15660

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(15601)=0
id = 15661

;==============================


[State -2, Stop Intro Sound]
type = StopSnd
trigger1 = roundstate = 2
channel = 20

[State -2] ;Omega Red Life Drain
type = lifeadd
triggerall = roundstate = 2
triggerall = stateno != [120,159]
triggerall = stateno != [5000,5999]
triggerall = stateno != 7730
triggerall = life < 1000
triggerall = life > 100
triggerall = var(10) < 300
trigger1 = enemynear, name = "Omega Red"
trigger1 = timemod = 20,0
value = -1

[State 0, PowerSet]
type = PowerSet
triggerall = enemynear, name ="Trainingroom"
trigger1 = power != 3000
value = 3000

[State 0, StopSnd]
type = StopSnd
trigger1 = roundstate = 2
channel = 11

[State -2, VarSet];Dive Kick Gound Bounce Limiter
type = VarSet
trigger1 = enemynear, movetype != H
v = 40
value = 0

[State -2, VarSet]
type = VarSet
trigger1 = enemynear,movetype!=H
v = 24
value = 0

[State -2, VarSet];Dive Kick Air vs Ground
type = VarSet
triggerall = stateno != [1100,1199]
trigger1 = statetype = A
v = 42
value = 1

[State -2, VarSet];Dive Kick Air vs Ground
type = VarSet
triggerall = stateno != [1100,1199]
trigger1 = statetype != A
v = 42
value = 0

[State -2, debug]       ; (debug clipboard)
type = DisplayToClipboard
trigger1 = 1 ;Alive
text = "PalNo: %d, Pos Y: %f, Var(59): %d"
params = PalNo, Pos Y, Var(59)

[State -2, PosSet]
type = PosSet
trigger1 = Alive
z = 0.9


[State -2, jump landing sound]   ; custom jump-landing sound
triggerall = Time = 1
trigger1 = stateno = 52
trigger2 = stateno = 106
type = PlaySnd
persistent = 0
value = 8,1


[State 0, VarAdd] ; limite do hfactor passivo
type = VarAdd
triggerall = stateno != [120,159]
triggerall = stateno != [5000,5999]
triggerall = stateno != 7730
triggerall = life < 1500
triggerall = life > 100
triggerall = var(10) < 300
trigger1 = timemod = 20,0
v =  10   ;fv =
value = 1

[State 0, LifeAdd]  ;hfactor passivo
type = LifeAdd
triggerall = stateno != [120,159]
triggerall = stateno != [5000,5999]
triggerall = stateno != 7730
triggerall = life < 1500
triggerall = life > 100
triggerall = var(10) < 300
trigger1 = timemod = 60,0
value = 1

[State 0, LifeAdd]  ;hyper do hfactor
type = LifeAdd
triggerall = life < 1500
triggerall = life > 49
triggerall = numexplod(3401) > 0
trigger1 = timemod = 4,0
value = 1



[State 0, VarAdd] ; limite do hfactor passivo
type = VarAdd
triggerall = stateno != [120,159]
triggerall = stateno != [5000,5999]
triggerall = life < 1000
triggerall = life > 49
triggerall = var(10) < 300
trigger1 = timemod = 20,0
v =  10   ;fv =
value = 1
;ignorehitpause =
;persistent =


;ignorehitpause =
;persistent =


;[state 1101, twister] ;feral mode
;type = afterimage
;triggerall = numexplod(3301) > 0
;trigger1 = timemod = 50,0
[State -2]
type = AfterImage
trigger1 = numexplod(3301)>0 && Time%80 = 0
time = 80
ignorehitpause = 1
PalBright = 0, 0, 0
PalContrast =  255,50,50
PalAdd = 0, 0, 0
PalMul = 1,1,1
trans = none;add1;AS250D250;none
Length = 20
FrameGap = 4



[State -2, Set Powered Up Attack]
type = AttackMulSet
trigger1 =  var(11) = 3
value = 1.1

[State -2, Set Powered Up Attack]
type = AttackMulSet
trigger1 =  var(11) = 0
value = 1



[State 0, VarSet]
type = VarSet
trigger1 = var(11)!= 0 && numexplod(3301) = 0
v = 11    ;fv = 10
value = 0

[State -2, PalFX]
type = PalFX
triggerall = numexplod(3301) > 0
trigger1 = timemod = 20,0
time = 50
add = 60,0,0
color = 128
sinadd = 60,0,0,50
ignorehitpause = 1

[State 0, RemoveExplod]
type = RemoveExplod
triggerall = numexplod(3301)>0
trigger1 = lose
id = 3301

[State 0, RemoveExplod]
type = RemoveExplod
triggerall = numexplod(3401)>0
trigger1 = win
trigger2 = lose
trigger3 = life < 50
id = 3401
;ignorehitpause =
;persistent =

[State 0, RemoveExplod]
type = RemoveExplod
triggerall = numexplod(3302)>0
trigger1 = lose
id = 3302

[State 0, RemoveExplod]
type = RemoveExplod
triggerall = numexplod(3402)>0
trigger1 = win
trigger2 = lose
trigger3 = life < 50
id = 3402


;[State -2, fall landing sound]   ; custom fall-landing sound
;trigger1 = stateno = [5100, 5110]
;trigger1 = Time = 1
;type = PlaySnd
;persistent = 0
;value = 8,2

[State -2, gethits]         ; custom gethit sounds
type = PlaySnd
triggerall = (stateno = [5000,5210]) && (Time = 0) && (!IsHelper)
trigger1 = anim = 5002  ; standing hard hit high
trigger2 = anim = 5012  ; stand hard hit low
trigger3 = anim = 5022  ; crouching hard hit
trigger4 = anim = 5030  ; air hit
trigger5 = anim = 5070  ; tripped
persistent = 0
value = 172,16

[State -2, VarSet]
type = VarSet
trigger1 = ctrl && var(41) = 1
v = 41    ;fv = 10
value = 0


[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(621)>0 && pos y = 0
id = 621
;ignorehitpause =
;persistent =

[State -2, Helper]
type = Helper
trigger1 = var(35)=1
trigger1 = numhelper(1900) = 0
trigger1 = stateno != 191
helpertype = normal ;player
name = "head"
ID = 1900
stateno = 1900
pos = 100,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State -2, ChangeAnim]
type = changestate
triggerall = pos y = 0; && time = 0
triggerall = numhelper(1900)>0
triggerall = backedgedist <= helper(1900),backedgedist + 20
triggerall = backedgedist >= helper(1900),backedgedist - 20
trigger1 = stateno = 200
trigger2 = stateno = 210
trigger3 = stateno = 220
trigger4 = stateno = 400
trigger5 = stateno = 410
trigger6 = stateno = 420
value = 1910


;---------------------------------------------------------------------------
; States that are executed when in self's state file (use statedef -3)
;---------------------------------------------------------------------------
[Statedef -3]


[State -3, Cable Stage]
type = Explod
triggerall = numexplod(29872)=0
triggerall = p2name = "Cable Training"
triggerall = StageVar(info.name) =  "B"
trigger1 = Teamside = 1
anim = F29872
ID =  29872
pos = 50,200;-40,-22
postype = left  ;p1
removetime = -2
scale = 1,1
sprpriority = -10000
ownpal = 1


[State -3, Landing Dust]
type = Explod
triggerall =  NumExplod(60) < 1
triggerall = Time = 3
trigger1 = StateNo = 52 ;Jump land
trigger2 = StateNo = 101 ;Run-fdw land
trigger3 = StateNo = 106 ;Run-back land
trigger4 = PrevStateNo = 52 && StateNo = 11 ;Jump land/crouch
persistent = 0
ID = 60
anim = 8510;60
postype = p1
pos = -10,0
velocity = 0, 0
accel = 0, 0
removetime = -2
sprpriority = -2
ownpal = 1

[State -3, Landing Sound]
type = PlaySnd
triggerall = Time = 1 && Var(20) != 2
trigger1 = StateNo = 52 ;Jump land
trigger2 = StateNo = 101 ;Run-fwd land
trigger3 = StateNo = 106 ;Run-back land
value = 8, 1








; desperation quote
[State -3, PlaySnd]
type = PlaySnd
trigger1 = (Life <= 0) && (var(50) = 0)
value = S172,17

[State -3, VarSet]
type = VarSet
trigger1 = Life <= 0
v = 50
value = 1

