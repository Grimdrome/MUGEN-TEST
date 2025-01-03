; States file for {character} -- Basics
;
;---------------------------------------------------------------------------
; Vars:
;   0: for Super Jump (0=vertical, 1=forward, -1=backward)
;   1: keep track of power level (for levelup sounds)

;  10: limite do fator de cura passivo
;  11: feralrage
;  41: basic combo pra mais de um ataque no mesmo botão
;  50: Desperation quote ("DANGER!" or whatever)
;  59: AI flag
; Helpers:
;   0: superjump opponent position indicator
; Explods:
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
; Lose (on timeover)
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170,0]
type = PlaySnd
trigger1 = Time = 0
value = 6,1
channel = 0

[State 170,1]
type = AssertSpecial     
trigger1 = Time = [0,100]
flag = RoundNotOver


;---------------------------------------------------------------------------
; Draw game (on timeover)
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0,0

[State 175,0]
type = PlaySnd
trigger1 = Time = 0
value = 6,2
channel = 0

[State 175,1]
type = AssertSpecial     
trigger1 = Time = [0,100]
flag = RoundNotOver

;---------------------------------------------------------------------------
; Winposes
[Statedef 180]  ; winpose selector
type = S
ctrl = 0
velset = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  numexplod(3301)>0
value = 189
ctrl = 0

[State 180,Winpose decider]
type = ChangeState
trigger1 = Time = 0
value = 181 + ((Random * 3) / 1000)     ; change the 1 to however many winposes you have

;-----------------------
; Winpose #1 - do better
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181,0]
type = PlaySnd
trigger1 = animelem = 1
value = 172,8
channel = 0

[State 181,1]
type = AssertSpecial     
trigger1 = Time = [0,320]
flag = RoundNotOver

;-----------------------
; Winpose #2 
[Statedef 182]
type = S
ctrl = 0
anim = 182
velset = 0,0

[State 182,0]
type = PlaySnd
trigger1 = animelem = 1
value = 172,7
channel = 0

[State 182,1]
type = AssertSpecial     
trigger1 = Time = [0,320]
flag = RoundNotOver

;-----------------------
; Winpose #3
[Statedef 183]
type = S
ctrl = 0
anim = 183
velset = 0,0

[State 183,0]
type = PlaySnd
trigger1 = animelem = 1
value = 172,18
channel = 0

[State 183, PlaySnd]
type = PlaySnd
trigger1 = time = 40
value = 10,14

[State 183, PlaySnd]
type = PlaySnd
trigger1 = time = 60
value = 172,19

[State 183,1]
type = AssertSpecial     
trigger1 = Time = [0,320]
flag = RoundNotOver
;---------------------------------------------------------------------------
; Intros
[Statedef 190]  ; intro selector
type = S
ctrl = 0
velset = 0,0


[State 190,intro decider]
type = ChangeState
trigger1 = Time = 0
trigger1 = P2Name != "Blade" 
value = 191 + ((Random * 3) / 1000)     ; change the 1 to however many intros you have

[State 190,intro decider]
type = ChangeState
trigger1 = Time = 0
trigger1 = P2Name = "Blade" 
value = 194

;-----------------------
; Intro #1
[Statedef 191]
type = S
ctrl = 0
anim = 1910
velset = 0,0
sprpriority = -2

[State 181,0]
type = PlaySnd
trigger1 = time = 0
value = 172,20;9
channel = 11

[State 181,0]
type = PlaySnd
trigger1 = time = 300
value = 0,9
channel = 4

[State 181,0]
type = PlaySnd
trigger1 = time = 300
value = 0,9
channel = 4

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 191
ID = 191
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = 0
scale = 1.08,1.08
sprpriority = 10
ontop = 0
shadow = 10,10,10
ownpal = 0
removeongethit = 0

[State 191, PlaySnd]
type = PlaySnd
trigger1 = time = 350
value = 10,14

[State 192, 2]
type = AssertSpecial
trigger1 = Time = [0,310]
flag = Intro

[State 192, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
;---------------------------------------------------------------------------------------------
;Intro 2
[Statedef 192]
type = S
movetype = I
physics = N
ctrl = 0
anim = 192
velset = 0,0
spriority = 0

[State 190, PlaySnd]
type = PlaySnd
trigger1 = Var(3) = 0
trigger1 =  animelem = 2
value = S172,10
channel = 5
volume = 255

[State 192, PlaySnd]
type = PlaySnd
trigger1 = animelem = 22
value = 10,14

[State 192, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0

;-----------------------
; Intro 03 - Crowd Running
[Statedef 193]
type = S
ctrl = 0
anim = 193
velset = 0,0

[State 193, 1]
type = PlaySnd
trigger1 = time = 10
value = 173,3
channel = 0

[State 193, 1]
type = Helper
trigger1 = Time = 10
postype = p1
pos = -100,10
stateno = 8100
helpertype = normal
ownpal = 0
keyctrl = 0

[State 193, 2]
type = Helper
trigger1 = Time = 12
postype = p1
pos = -400,0
stateno = 8101
helpertype = normal
ownpal = 0
keyctrl = 0

[State 193, 3]
type = Helper
trigger1 = Time = 8
postype = p1
pos = -170,15
stateno = 8102
helpertype = normal
ownpal = 0
keyctrl = 0

[State 193, 4]
type = Helper
trigger1 = Time = 15
postype = p1
pos = -230,-5
stateno = 8103
helpertype = normal
ownpal = 0
keyctrl = 0

[State 193, Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193, 2]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 0

;---------------------------------------------------------
;Intro Blade
[Statedef 194]
type = S
ctrl = 0
anim = 194
velset = 0,0

[State 193, 1]
type = PlaySnd
trigger1 = animelem = 2
trigger1 = P2Name = "Blade" 
value = 172,21

[State 193, 1]
type = PlaySnd
trigger1 = animelem = 2
trigger1 = P2Name != "Blade" 
value = 172,20

[State 190, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 194

[State 190, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4] ;Change to stand state
type = ChangeState
trigger1 = AnimTime = 0
value = 0
;-----------------------
; Intro Crowd Runners
[Statedef 8100]
type    = A
movetype= I
physics = N
anim = 8100

[State 8100, 1]
type = SprPriority
trigger1 = Time >= 0
value = 6

[State 8100, 2]
type = VelSet
trigger1 = Time = [0,249]
X = 5.5

[State 8100, 3]
type = VelSet
trigger1 = Time = 250
X = 0

[State 8100, 5]
type = DestroySelf
trigger1 = Time = 265

;----------------------------------------------------
; Intro Crowd Runners
[Statedef 8101]
type    = A
movetype= I
physics = N
anim = 8101

[State 8101, 1]
type = SprPriority
trigger1 = Time >= 0
value = 6

[State 8101, 2]
type = VelSet
trigger1 = Time = [0,249]
X = 6.8

[State 8101, 3]
type = VelSet
trigger1 = Time = 250
X = 0

[State 8101, 5]
type = DestroySelf
trigger1 = Time = 265

;----------------------------------------------------
; Intro Crowd Runners
[Statedef 8102]
type    = A
movetype= I
physics = N
anim = 8102

[State 8102, 1]
type = SprPriority
trigger1 = Time >= 0
value = 6

[State 8102, 2]
type = VelSet
trigger1 = Time = [0,249]
X = 6.2

[State 8102, 3]
type = VelSet
trigger1 = Time = 250
X = 0

[State 8102, 5]
type = DestroySelf
trigger1 = Time = 265

;----------------------------------------------------
; Intro Crowd Runners
[Statedef 8103]
type    = A
movetype= I
physics = N
anim = 8103

[State 8103, 1]
type = SprPriority
trigger1 = Time >= 0
value = 6

[State 8103, 2]
type = VelSet
trigger1 = Time = [0,249]
X = 5.8

[State 8103, 3]
type = VelSet
trigger1 = Time = 250
X = 0

[State 8103, 5]
type = DestroySelf
trigger1 = Time = 265
;----------------------------------------------------
; Taunt
[Statedef 195]
anim = 195
ctrl = 0
type = S
movetype = A
physics = S
velset = 0,0

[State 181,0]
type = PlaySnd
trigger1 =AnimElem = 1
value = 172,11
channel = -1

[State 200, back to stance]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Light Punch
[StateDef 200]
anim = 200 + var(11)
ctrl = 0
type = S
movetype = A
physics = S
velset = 0,0
juggle = 0; = 4
poweradd = 20

[State 200, swoosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 171,2



[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA   
air.cornerpush.veloff = -20
damage = 20
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 8,8
hitsound = S171,7
guardsound = 6,0
sparkno = 0
sparkxy = -10,-100
animtype = Light
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -3
guard.velocity = -2
air.velocity = -2,-3

[State 200, back to stance]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Stand Medium Punch
[StateDef 210]
anim = 210
ctrl = 0
type = S
movetype = A
physics = S
juggle = 0; = 2
velset = 0,0
poweradd = 20

[State 200, swoosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 171,1

[State 210, HitDef]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA   
air.cornerpush.veloff = -20
damage = 15
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 4,4
hitsound = S171,6
guardsound = 6,0
sparkno = 1
sparkxy = -10,-100
animtype = Medium
ground.type = High
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -3
guard.velocity = -5
air.velocity = -3,-6


[State 220, back to stance]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1




;---------------------------------------------------------------------------
; Stand Hard Punch
[StateDef 220]
anim = 220
ctrl = 0
type = S
movetype = A
physics = S
juggle = 0; = 4
velset = 0,0
poweradd = 60


[State 200, swoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 171,0

[State 220, grunt]
type = PlaySnd
trigger1 = AnimElem = 1
value = 172,17
channel = -1

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 221
ID = 221
pos = -55,-55
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 5
removeongethit = 1
ownpal = 1



[State 220, HitDef]
type = HitDef
trigger1 = time = 0
attr = S, NA   
air.cornerpush.veloff = -20
damage = 80
guardflag = MA
hitflag = MAF
priority = 4, Hit ;f
pausetime = 10,10
hitsound = S171,5
guardsound = 6,0
sparkno = 2
sparkxy = -10,-100
animtype = Low
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -3,-3
guard.velocity = -3
air.velocity = -8,8


[State 220, back to stance]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Stand Light Kick
[StateDef 230]
anim = 230
ctrl = 0
type = S
movetype = A
physics = S
juggle = 0; = 4
velset = 0,0
poweradd = 20

[State 230, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,0



[State 230, HitDef]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 25
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 8,8
hitsound = s2,0
guardsound = 6,0
sparkno = 0
sparkxy = -10,-30
animtype = Light
ground.type = Low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -3
guard.velocity = -2
air.velocity = -2,-3

[State 230, back to stance]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Medium Kick
[StateDef 240]
anim = 240
ctrl = 0
type = S
movetype = A
physics = S
juggle = 0; = 3
velset = 0,0
poweradd = 20

[State 240, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,1

[State 240, HitDef]
type = HitDef
trigger1 = Time = 0
attr = S, NA   
air.cornerpush.veloff = -20
damage = 30
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 9,9
hitsound = S2,1
guardsound = 6,0
sparkno = 1
sparkxy = -10,-60
animtype = Medium
ground.type = low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -7
guard.velocity = -5
air.velocity = -3,-6

[State 220, back to stance]
type = ChangeState
trigger1 = AnimTime = 0 && var(41)=0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
; Stand Hard Kick
[StateDef 250]
anim = 250
ctrl = 0
type = A
movetype = A
physics = N
juggle = 0; = 4
velset = 0,0
poweradd = 60

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 2
value = 0,2


[State 250, HitDef]
type = HitDef
trigger1 = Time = 0
attr = S, NA   
air.cornerpush.veloff = -20
damage = 45
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 12,12;L6,6
hitsound = S2,2
guardsound = 6,0
sparkno = 2
sparkxy = -10,-90
animtype = Heavy
ground.type = High
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -5
guard.velocity = -5
air.velocity = 0,-2


[State 250, back to stance]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Crouch Light Punch
[StateDef 400]
anim = 400
ctrl = 0
type = C
movetype = A
physics = C
velset = 0,0
juggle = 0; = 4
poweradd = 30

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 1
value = 171,2


[State 400, HitDef]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 20
hitflag = MAF
guardflag = L
priority = 3, Hit ;uhu
pausetime = 8,8
hitsound = S171,7
guardsound = 6,0
sparkxy = -10,-70
sparkno = 0
animtype = Light
ground.type = Low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -3
guard.velocity = -2
air.velocity = -3,-6

[State 400, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Medium Punch
[StateDef 410]
anim = 410
ctrl = 0
type = C
movetype = A
physics = C
juggle = 0; = 4
velset = 0,0
poweradd = 50

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 1
value = 171,1

[State 410, HitDef]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 40
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 9,9
hitsound = S171,6
guardsound = 6,0
sparkno = 1
sparkxy = -10,-70
animtype = Medium
ground.type = Low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -8
guard.velocity = -10
air.velocity = -3,-6

[State 410, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Hard Punch
[StateDef 420]
anim = 420
ctrl = 0
type = C
movetype = A
physics = C
velset = 0,0
juggle = 1
poweradd = ifelse(numexplod(3304)=0,60,0) 

;Aerial rave launcher
[State -1, Aerial rave launcher]
type = ChangeState 
value = 700
triggerall = command = "holdup"
trigger1 = movecontact = 1
trigger1 = stateno = 420
trigger2 = movecontact = 1
trigger2 = stateno = 202
trigger3 = movecontact = 1
trigger3 = stateno = 205
trigger3 = Time >= 19

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 223
ID = 223
pos = -50,-32
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 5
removeongethit = 1
ownpal = 1

;[State 0, Explod]
;type = Explod
;trigger1 = animelem = 2
;anim = 222
;ID = 222
;pos = -39,-31
;postype = p1  ;p2,front,back,left,right
;bindtime = -1
;removetime = -2
;scale = 1,1
;sprpriority = 5
;removeongethit = 1
;ownpal = 1

;[State 0, Explod]
;type = Explod
;trigger1 = animelem = 2
;anim = 222
;ID = 222
;pos = -50,-51
;postype = p1  ;p2,front,back,left,right
;bindtime = -1
;removetime = -2
;scale = 1,1
;sprpriority = 5
;removeongethit = 1
;ownpal = 1


[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 1
value = 171,0

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 8
value = 172,6

[State 420, HitDef]
type = HitDef
trigger1 = time = 0
attr = C, NA
damage = 66,0
priority = 4, Hit
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = 2
sparkxy = -15,-59
hitsound = s8000,2
guardsound = 6,0
animtype = Heavy
ground.type = Low
ground.slidetime = 20
ground.hittime  = 20
air.hittime = 20
guard.velocity = -5
ground.velocity = 0,-12.5
air.velocity = 0,-11.25
p2getp1state = 0
getpower = ifelse(numexplod(3304)=0,5,0) 

[State 420, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Light Kick
[StateDef 430]
anim = 430
ctrl = 0
juggle = 0; = 4
type = C
movetype = A
physics = C
velset = 0,0
poweradd = 25

[State 430, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,0

[State 430, HitDef]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 25
hitflag = MAF
guardflag = MA
priority = 3, Hit ;uhu
pausetime = 8,8
hitsound = S2,0
guardsound = 6,0
sparkxy = -10,0
sparkno = 0
animtype = Light
ground.type = Low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -2
guard.velocity = -1
air.velocity = -2,-3

[State 430, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Medium Kick
[StateDef 440]
anim = 440
ctrl = 0
type = C
movetype = A
juggle = 0; = 4
physics = C
velset = 0,0
poweradd = 50

[State 440, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,1


[State 440, HitDef]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 30
hitflag = MAF
guardflag = L
priority = 3, Hit ;uhu
pausetime = 9,9
hitsound = S2,1
guardsound = 6,0
sparkxy = -10,-10
sparkno = 1
animtype = light;Back
ground.type = low
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -3
guard.velocity = -3
air.velocity = -4,-6

;animtype = light          ;light,medium,hard,back,up,diagup
;ground.type = High      ;Low,Trip,None

[State 440, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Hard Kick
[StateDef 450]
anim = 450
ctrl = 0
type = C
movetype = A
physics = C
velset = 0,0
poweradd = 60
juggle = 0; = 4

[State 450, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 15

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 460, Dust]
type = Explod
trigger1 = animelem = 3, >= 0
;trigger1 = animelem = 8, < 0
trigger1 = timemod = 4,0
scale = const(size.xscale)
id = 451
anim = 451
pos = -45,0
sprpriority = 2
bindtime = 1
supermovetime = 99999999
pausemovetime = 99999999
ownpal = 1


[State 450, HitDef]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 60
guardflag = MA
hitflag = MAF
priority = 3, Hit ;uhu
pausetime = 10,10
hitsound = S2,2
guardsound = 6,0
sparkno = 2
sparkxy = -10,-30
animtype = Medium
ground.type = Low
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -6
guard.velocity = -3
fall = 1

[State 450, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Air Light Punch
[StateDef 600]
anim = 600
ctrl = 0
type = A
juggle = 0; = 2
movetype = A
physics = A
poweradd = 25

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 1
value = 171,2

[State 600, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 20
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8,8
hitsound = S171,7
guardsound = 6,0
sparkno = 0
sparkxy = -10,-80;0,-100
animtype = Light
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5
guard.velocity = -7
air.velocity = -2,-3

[State 600, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 948
ctrl = 1


;---------------------------------------------------------------------------
; Air Medium Punch
[StateDef 610]
anim = 610
ctrl = 0
type = A
juggle = 0; = 2
movetype = A
physics = A
poweradd = 20

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 1
value = 171,1


[State 610, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 25
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 9,9
hitsound = S171,6
guardsound = 6,0
sparkxy = -20,-20
sparkno = 1
animtype = Medium
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5
guard.velocity = -7
air.velocity = -1,-3


[State 220, back to stance]
type = ChangeState
trigger1 = AnimTime = 0 && var(41)=0
value = 948
ctrl = 1

;---------------------------------------------------------------------------
; Air Hard Punch
[StateDef 620]
anim = 620
ctrl = 0
type = A
movetype = A
juggle = 0; = 2
physics = A
poweradd = 60
sprpriority = -1

[State 250, swoosh]
type = PlaySnd
trigger1 = animelem = 1
value = 171,0

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 221
ID = 221
pos = -35,-55
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 5
removeongethit = 1
ownpal = 1

[State 620, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 80
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 10,10
hitsound = S171,5
guardsound = 6,0
sparkxy = -10,-80
animtype = Heavy
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -8
guard.velocity = -7
air.velocity = -2,5
fall = 1

[State 0, SprPriority]
type = SprPriority
trigger1 =  animelem = 7
value = 1


[State 620, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 948
ctrl = 1


;---------------------------------------------------------------------------
; Air Light Kick
[StateDef 630]
anim = 630
ctrl = 0
type = A
movetype = A
juggle = 0; = 2
physics = A
poweradd = 22

[State 630, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,0

[State 630, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 22
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8,8
hitsound = S2,0
guardsound = 6,0
sparkno = 0
sparkxy = 0,-40
animtype = Light
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5
guard.velocity = -7
air.velocity = -2,-3

[State 630, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 948
ctrl = 1


;---------------------------------------------------------------------------
; Air Medium Kick
[StateDef 640]
anim = 640
ctrl = 0
type = A
movetype = A
juggle = 0; = 2
physics = A
poweradd = 50

[State 640, swoosh]
type = PlaySnd
trigger1 = Time = 2
value = 0,1

[State 640, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 50
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 9,9
hitsound = S2,1
guardsound = 6,0
sparkno = 1
sparkxy = -10,-40
animtype = Medium
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -5
guard.velocity = -7
air.velocity = -2,-3

[State 640, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 948
ctrl = 1

;---------------------------------------------------------------------------
; Air Hard Kick
[StateDef 650]
anim = 650
ctrl = 0
type = A
movetype = A
physics = A
juggle = 0; = 4
poweradd = 60

[State 650, grunt]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 5
value = 0,1

[State 650, HitDef]
type = HitDef
trigger1 = time = 0
;trigger1 = AnimElem = 4
;trigger2 = AnimElem = 5
attr = A,NA
damage = 60,1
animtype = High
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 10,10
sparkno = 2
sparkxy = -10, -83
;guard.sparkno; = s6767
hitsound = 5,4
guardsound = 6,0
ground.type = High
ground.slidetime = 18
ground.hittime  = 25
ground.velocity = -10
air.velocity = -12,10
air.fall = 1
air.hittime = 25

[State 650, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 948
ctrl = 1


;---------------------------------------------------------------------------
;Super Jump opponent locator
[Statedef 910]
type    = A
physics = N
ctrl = 0
sprpriority = 2

[State 910, arrow]
type = ChangeAnim
trigger1 = IsHelper(0)
;trigger1 = TeamSide = 2
value = 910

[State 910, destroyself]
type = DestroySelf
triggerall = IsHelper(0)
trigger1 = RootDist Y > 0


;-----------------------
; Safe fall (from superjump, or jumping attack)
[StateDef 948]
type = A
movetype = I
physics = A
ctrl = 1

; neutral
[State 948, ChangeAnim]
type = ChangeAnim
trigger1 = (Time = 0) && (Vel X = 0)
value = 48

; forwards
[State 948, ChangeAnim]
type = ChangeAnim
trigger1 = (Time = 0) && (Vel X > 0)
value = 49

; backwards
[State 948, ChangeAnim]
type = ChangeAnim
trigger1 = (Time = 0) && (Vel X < 0)
value = 50


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
;Throw
[Statedef 800]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800
poweradd = 60
sprpriority = -1

;[State 800, PlaySnd]
;type = PlaySnd
;trigger1 =  AnimElem = 3
;value = 14,24

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = 1
sparkxy = -15,-75
hitsound = S3,1
sprpriority = 2
numhits = 0
p1facing = ifelse (command = "holdback", -1, 1)
p2facing = 1
p1stateno = 801
p2stateno = 810
fall = 1

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------

[Statedef 801]
type = S
movetype= A
physics = N
anim = 801
sprpriority = 2
juggle = 0
velset = 0,-4


;[State 800, PlaySnd]
;type = PlaySnd
;trigger1 =  AnimElem = 3
;value = s3,1
;[State 0, Width]
;type = Width
;trigger1 = time <= 50
;value = 40,0

[State 801, ENEMY ESCAPES!!]
type = ChangeState
trigger1 = (time <= 10) && (numtarget = 0)
value = 345
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time < 66
value = SCA
time = 1

[State 801, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
pos = 40,0;-80

[State 801, TargetLifeAdd]
type = TargetLifeAdd
triggerall = AnimElemTime(4) >= 0 && AnimElemTime(12) < 0
trigger1 = (gametime%3) = 1
value = -3
kill = 0

[State 1303, 5]
type = HitDef
trigger1 = AnimElem = 7
attr = S, SA
animtype  = Hard
damage    = 95, 5
priority  = 6
hitflag = MAF
guardflag = MA
pausetime = 0,0
sparkxy = -10,-60
sparkno=2
hitsound   = S2,0
guard.sparkno = s8001
guardsound = 6,0
ground.type = Low
ground.slidetime = 24
ground.hittime  = 30
ground.velocity = -24,0
air.velocity = -24,-3
p2facing = 1
air.fall = 1
fall = 1

;[State 220, hit]
;type=hitdef
;trigger1=animelem = 4 ;!time
;attr=S,NT
;damage=40,0
;animtype=Light
;guardflag=
;hitflag=MAF+
;priority=4,Hit
;pausetime=2,2

;sparkxy = -25,-68
;hitsound= S2,0
;guardsound = S5,5
;ground.type=Low
;ground.slidetime=0;16
;ground.hittime=0; 16
;air.hittime = 0;14
;ground.velocity=0,0 ;-8,-4
;air.type=Low
;air.velocity=0, 0 ;-8,-4
;ground.cornerpush.veloff=0
;air.cornerpush.veloff=0
;fall.xvelocity = 0
;fall.yvelocity = 0
;envshake.time=10
;envshake.ampl=2

;[State 8616, 1]
;type = HitDef
;trigger1 = animelem = 10
;attr = S, SA
;animtype  = Hard
;damage    = 
;getpower  = 0
;priority  = 4
;guardflag = MA
;pausetime = 8,7

;guardsound = 6,0
;ground.type = Low
;ground.slidetime = 20
;ground.hittime  = 22
;ground.velocity = -8,-7
;guard.velocity = -7
;air.velocity = -8,-7
;airguard.velocity = -5, -4
;fall = 1
;p2stateno = 8625    ;Make p2 go to state 8625 on hit
;p2facing = 1        ;Force to face p1

[State 220, hit]
type= null ;hitdef
trigger1=animelem = 10 ;!time
attr=S,NT
damage=40,0
animtype=Hard ;light
guardflag=
hitflag=MAF+
priority=4,Hit
pausetime=2,2
sparkno=s7712
sparkxy = -25,-68
hitsound=s8000,2
guardsound = S5,5
ground.type=Low
ground.slidetime=16
ground.hittime=16
air.hittime = 14
ground.velocity=-8,-4 ;0,0
air.type=Low
air.velocity=-8,-4 ;0,0
ground.cornerpush.veloff=0
air.cornerpush.veloff=0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time=10
envshake.ampl=2
fall = 1
p2stateno = 8625    ;Make p2 go to state 8625 on hit (wallbounce)
p2facing = 1        ;Force to face p1

[State 801, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 948
ctrl = 1

;-------------------------------------------------------------------------------

[Statedef 810]
type = A
movetype = H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 810

[State 0, PosAdd]
type = PosAdd
triggerall = (enemy, stateno != 801) && (anim = 810)
trigger1 = AnimElemTime(13) < 0
y = 40
persistent = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 1,0

[State 0, ChangeState]
type = null ;ChangeState
trigger1 = (enemy, stateno != 801) && (anim = 810) 
value = 8625
ctrl = 0

[State 0, SelfState]
type = SelfState
trigger1 = (enemy, stateno != 801) && (anim = 810)
value = 5040
ctrl = 1

;--------------------------------------------------------------------------------------------
; Guard Push (stand)
[Statedef 7610]
type    = S
movetype= I
physics = N
poweradd= 0
velset = 10,0
ctrl = 0
anim = 7610
sprpriority = 0
facep2 = 1


[State 7610, VelMul]
type = VelMul
trigger1 = 1
x = 0.75

[State 7610, VelSet]
type = VelSet
trigger1 = Time = 10
x = 0

[State 7610, Width]
type = Width
trigger1 = 1
value = 10,0

[State 7610, NotHitBy]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 23


[State 7610, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 30

[State 7610, PlaySnd 2]
type = PlaySnd
trigger1 = Time = 0
value = 4,0

[State 7610, Spark]
type = Explod
trigger1 = AnimElem = 2;Time = 0
anim = 7020
postype = p1
pos = 31,-47
ownpal = 1
vel = 0,0
scale = .5,.5
ignorehitpause = 1
sprpriority = 5

[State 7610, Guard Push Helper]
type = Helper
trigger1 = AnimElem = 2;Time = 0
helpertype = Normal
name = "GuardPush"
postype = P1
pos = -50,0
stateno = 7611
ownpal = 1
size.height = 200
size.ground.back = 30
size.ground.front = 30

[State 7610, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Guard Push (Helper)

[Statedef 7611]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = Parent,Anim
sprpriority = -4


[State 7611, PlayerPush]
type = AssertSpecial
trigger1 = 1
flag = invisible

[State 7611, PlayerPush]
type = PlayerPush
trigger1 = Time >= 0
value = 1

[State 7611, VelSet 1]
type = VelSet
trigger1 = Time = [0,10]
x = 25

[State 7611, VelSet 2]
type = VelSet
trigger1 = Time = [11,13]
x = 15

[State 7611, VelSet 2]
type = VelSet
trigger1 = Time >= 14
x = 10

[State 7611, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 10

[State 7611, DestroySelf]
type = DestroySelf
trigger1 = Time >= 14
