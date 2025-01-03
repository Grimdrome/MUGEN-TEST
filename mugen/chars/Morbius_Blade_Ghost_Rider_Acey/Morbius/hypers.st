[Statedef 3100]
type    = S
movetype= A
physics = N
juggle  = 1
velset = 0,0
poweradd = 0
anim = 3100
ctrl = 0
sprpriority = 2


[State 0, Explod]
type = Explod
trigger1 = animelem = 7
anim =  3110
ID = 3110
pos = 0,60
postype = p1
facing = 1
vfacing = 1
removetime = -2
bindtime = -1
scale = 1,1
sprpriority = 11
ontop = 0

; sfx
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 172,14

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 172,6

[State 0, VarSet] ;*Reset The custom state var(43) if needed
type = VarSet
trigger1 = var(43) = 9696
v = 43
value = 0

[State 190, 1]
type = VarRandom
trigger1 = Time = 0
v = 1
range = 0,400

[State 0, PlaySnd]
type = veladd
trigger1 = animelem = 3
y = -2

[State 0, PlaySnd]
type = veladd
trigger1 = animelem = 9
y = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger1 = Var(1) = [0,200]
value = S3000,0
freqmul = 1.0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger1 = Var(1) = [201,400]
value = S3000,1
freqmul = 1.0

[State 200, HitDef]
type = HitDef
trigger1 = animelem=8
trigger2 = animelem=9
trigger3 = animelem=10
trigger4 = animelem=11
trigger5 = animelem=12
trigger6 = animelem=13
trigger7 = animelem=14
trigger8 = animelem=15
trigger9 = animelem=16
trigger10 = animelem=17
trigger11 = animelem=18
trigger12 = animelem=19
trigger13 = animelem=20
trigger14 = animelem=21
attr = S,HA
damage = 8,1
animtype = Light
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 0,10
sparkno = 2
sparkxy = -10, -60
;guard.sparkno; = s6767
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -5,-12
air.type = Low
air.hittime = 15
air.velocity = -6,-12
envshake.time = 1
envshake.ampl = 1
fall = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
down.cornerpush.veloff = 0

[State 3000, End]
type = ChangeState
trigger1 = animtime=0
value = 50
ctrl = 1

;---------------------------------------------------------------------------------------------
;Hyper4 - Outerspace

[Statedef 3300]
type    = S
movetype= A
physics = N
juggle  = 1
velset = 0, 0
poweradd = -1000
anim = 3300
ctrl = 0
sprpriority = 2

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 172,15

[State 3300, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3300, VelSet]
type = VelSet
trigger1 = animelem = 3
x = 11
y = 0

;------------Hyper Effects-----------
;---------------------[NEW Version]---------------------
[State 3000, assertspecial]
type = assertspecial
triggerall = !Var(29)
trigger1 = time = 0
flag = noBG
flag2 = noFG
ignorehitpause = 1

[State 3000, SuperPause]
type = SuperPause
triggerall = !Var(29)
trigger1 = time = 0
Time = 30
;anim =-1;s3012
pos = -4,-70
sound = S8889,0
poweradd = -1000


[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40001)
trigger1 = time = 0
helpertype = normal
name = "HSDM"
ID = 40001
stateno = 40001
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40003)
trigger1 = time = 0
helpertype = normal
name = "H.Port"
ID = 40003
stateno = 40003
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40004)
trigger1 = time = 0
helpertype = normal
name = "Player 1"
ID = 40004
stateno = 40004
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 3300, HitDef]
type = HitDef
trigger1 = time = 0
damage = 25,1
animtype = light
guardflag = MA
attr = SA, HA
hitflag = MA
priority = 1, Miss
pausetime = 0,0
sparkno = s7700;s7771
sparkxy = -10,-60
;guard.sparkno; = s6767
hitsound = 5,1
guardsound = 6,0
ground.type = Low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = 2,0
air.type = Low
air.hittime = 15
air.velocity = 2,-5
envshake.time = 1
envshake.ampl = 1
p1stateno = 3310
p2stateno = 3315
id = 3315

[State 3300, 1] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 3300, 2] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3300, 5]
type = PlaySnd
trigger1 = Time = 30
value = 172, 4

;[State 3300, 8]
;type = VelAdd
;triggerall = Vel X > 0
;trigger1 = time > 15
;x = -.3

[State 3300, 10]
type = ChangeState
trigger1 = MoveGuarded || Time >=100 || FrontEdgeDist <30;time = 45
ctrl = 1
value = 0

;---------------------------
[Statedef 3310] ;Hyper 4 Sentry State
type    = S
movetype= A
physics = N
juggle  = 1
velset = 0, 0
poweradd = 0
anim = 3310
ctrl = 0
sprpriority = 7

[State 1210, Explod]
type = Explod
trigger1 = animelem = 5
anim = 222
ID = 222
pos = 0,-30
facing = 1
velocity= 0,0
bindtime = -1
removetime = -2
sprpriority = 10
removeongethit = 0

[State 1210, Explod]
type = Explod
trigger1 = animelem = 5
anim = 223
ID = 223
pos = -30,-30
facing = 1
velocity= 0,0
bindtime = -1
removetime = -2
sprpriority = 10
removeongethit = 0

[State 1210, Explod]
type = Explod
trigger1 = time = 50
anim = 3191
ID = 3191
pos = 0,-34
facing = 1
velocity= 5,0
bindtime = -1
removetime = 60
sprpriority = 10
removeongethit = 0

[State 1210, Explod]
type = Explod
trigger1 = time = 50
anim = 3320
ID = 3320
pos = 11,18
facing = 1
velocity= 5,0
bindtime = -1
removetime = 60
sprpriority = 10
removeongethit = 0

[State 3310, assertspecial]
type = assertspecial
trigger1 = time = [0,170]
flag = noBG
flag2 = noFG
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 40
value = 172,3


[State 3310, VelSet]
type = VelSet
trigger1 = time = 2
x = 0
y = -3

[State 3310, VelSet]
type = VelSet
trigger1 = time = 40
x = 0
y = 0

[State 3310, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0



[State 3310, TargetBind]
type = TargetBind
trigger1 = 1
id = 3315
pos = 50,-50
;time = 300

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 40
value = 100

[State 620, HitDef]
type = HitDef
trigger1 = !movehit
trigger1 = !moveguarded
attr = A,NA
damage = 75,1
animtype = High
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12,12
sparkno = s8222
sparkxy = 0,-69
guard.sparkno = 0
hitsound = s1,8
guardsound = S8000,6
ground.type = High
air.type = Low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -9
air.velocity = -7,17
fall = (enemynear,statetype = A)
air.fall = 1
fall.recover =0
envshake.time = 7
envshake.ampl = 4
;Corner Push System support from Statedef -3
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
down.cornerpush.veloff = 0

[State 0, ChangeAnim]
type = Changestate
trigger1 = animtime = 0
trigger2 = p2stateno !=3315 && time < 120; p2stateno !=5020
value = 50

;---------------------------
[Statedef 3315] ;Hyper 4 Opponent State
type    = A
movetype= H
physics = N
velset = 0,0
ID = 3315
sprpriority = 7



[State 1110, PalFXWiz]
type = PalFX
trigger1 = time = 50
time = 120
add = 60,0,0
color = 128
sinadd = 60,0,0,50
invertall = 0


[State 3315, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 3315

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 40
value = -100 ; times 10 game ticks = -230 - this moves does less damage since it's an Avoid attack.
;absolute = 0

[State 1121, SelfState]
type = SelfState
trigger1 = Time = 210
value = 5100
ctrl = 1
;---------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------
;Hyper2

[Statedef 3000]
type    = S
movetype= A
physics = N
juggle  = 1
velset = 0,0
poweradd = 0
anim = 3000
ctrl = 0
sprpriority = 2
poweradd = -1000



; sfx
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem =2
value = s172,13

; sfx
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 173,0

[State 1210, Explod]
type = Explod
trigger1 = animelem = 4
anim = 3020
ID = 3020
facing = 1
pos = 45,-35
velocity= 0,0
bindtime = -1
removetime = 180
sprpriority = 10
removeongethit = 1
scale = .5,.5

[State 1210, Explod]
type = Explod
trigger1 = animelem = 4
sprpriority = -1
anim = 3030
ID = 3030
facing = 1
pos = 5,-45
velocity= 0,0
bindtime = -1
removetime = 180
removeongethit = 1
add = 0,-200,-200
mul = 256,256,256
sinadd = 40,80,40,10
invertall = 1
color = 0



;------------Hyper Effects-----------
;---------------------[NEW Version]---------------------
[State 3000, assertspecial]
type = assertspecial
triggerall = !Var(29)
trigger1 = AnimElem = 2
flag = noBG
flag2 = noFG
ignorehitpause = 1

[State 3000, SuperPause]
type = SuperPause
triggerall = !Var(29)
trigger1 = AnimElem = 2
Time = 30
;anim =-1;s3012
pos = -4,-65
sound = S8889,0
poweradd = -1000


[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40001)
trigger1 = AnimElem = 2
helpertype = normal
name = "HSDM"
ID = 40001
stateno = 40001
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40003)
trigger1 = AnimElem = 2
helpertype = normal
name = "H.Port"
ID = 40003
stateno = 40003
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40004)
trigger1 = AnimElem = 2
helpertype = normal
name = "Player 1"
ID = 40004
stateno = 40004
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 3000, som]
type = PlaySnd
trigger1 = animelem = 4
value = 172,5

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 15

[State 0, VelSet]
type = VelSet
trigger1 = movehit
x = 12


[State 210, HitDef]
type = HitDef
trigger1 = animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20
trigger4 = animelem = 21 || animelem = 22 || animelem = 23
attr = S,HA
damage = 8,1
animtype = high
guardflag = MA
hitflag = MAF
;priority = 4, Hit
pausetime = 6,10
sparkno = 2
sparkxy = -40,-70
guard.sparkno = 40
hitsound = 5,1
guardsound = 6,0
ground.type = high
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = -5
air.type = Low
air.hittime = 15
air.velocity = -1,-10
envshake.time = 1
envshake.ampl = 1

fall = 1

[State 3100, End]
type = ChangeState
trigger1 = animtime=0
value = 3010

 [Statedef 3010]
type    = S
movetype= A
physics = N
;juggle  = 1
velset = 0,0
poweradd = 0
anim = 3010
;ctrl = 0
sprpriority = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 3010

[State -3, RemoveExplod]
type = RemoveExplod
trigger1 =  1
id = 3030

[State -3, RemoveExplod]
type = RemoveExplod
trigger1 =  1
id = 3020


 [State 3100, End]
type = ChangeState
trigger1 = animtime=0 && time > 5
value = 3100
ctrl = 1

;---------
[Statedef 3110]
MoveType = H
anim = 3110
Ctrl = 0


[State 3210, 2]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AP
time = 1


[State 3210, 4]
type = PalFX
trigger1 = time = 0
add = 255, 100, 100
time = 20
color = 50

[State 3210, 5]
type = ChangeState
trigger1 = time = 20
value = 3111

[Statedef 3111]
MoveType = H
anim = 1111

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value =  0
ctrl = 1

;---------------------------------------------------------------------------
; Hyper 2 - Juggling Act
[Statedef 3200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 3200                      ;Change animation (Def: no change)
sprpriority = 2                  ;Set layering priority to 2 (in front)
hitcountpersist = 1

; sfx
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = s172,11

;------------Hyper Effects-----------
;---------------------[NEW Version]---------------------
[State 3000, assertspecial]
type = assertspecial
triggerall = !Var(29)
trigger1 = time = 0
flag = noBG
flag2 = noFG
ignorehitpause = 1

[State 3000, SuperPause]
type = SuperPause
triggerall = !Var(29)
trigger1 = time = 0
Time = 30
;anim =-1;s3012
pos = -4,-65
sound = S8889,0
poweradd = -1000


[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40001)
trigger1 = time = 0
helpertype = normal
name = "HSDM"
ID = 40001
stateno = 40001
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40003)
trigger1 = time = 0
helpertype = normal
name = "H.Port"
ID = 40003
stateno = 40003
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State -2, Helper]
type = Helper
triggerall = !Var(29)
triggerall = !numhelper(40004)
trigger1 = time = 0
helpertype = normal
name = "Player 1"
ID = 40004
stateno = 40004
pos = 160,120
postype = left    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 999999999999
pausemovetime = 999999999999
ignorehitpause = 1

[State 0, ]
type = VelSet
trigger1 = time = 12
x = 3

[State 0, ]
type = VelSet
trigger1 = movecontact || animtime = 0
x = 0

[State 420, HitDef]
type = HitDef
trigger1 = animelem = 3
attr = C, HA
hitflag = MAF
damage = 50
guardflag = MA
pausetime = 5,5
hitsound = 5,2
guardsound = 6,0
sparkno = 2
sparkxy = 0,-40
animtype = UP
ground.type = Low
ground.slidetime = 15
ground.hittime  = 15
ground.velocity = 1,-12
guard.velocity = 0
air.velocity = 0,-11
fall=1
fall.recover = 0
kill = 0
getpower = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = Time >= 0 && movecontact
value = 0
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0 && movehit
value = 3210
ctrl = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animtime = 0 && !movehit
id = 8901

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0 && !movehit
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Hyper 2 - Juggling Act continued
[Statedef 3210]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 3210                      ;Change animation (Def: no change)
sprpriority = 2                  ;Set layering priority to 2 (in front)
hitcountpersist = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 2 ;strong punch
time = 2
pos = 50,-6

[State 0, TargetBind]
type = TargetBind
triggerall = movecontact
trigger1 = animelem = 8 ;low kick
time = 2
pos = -35,-10

[State 0, TargetBind]
type = TargetBind
triggerall = movecontact
trigger1 = animelem = 13 ;med punch
time = 2
pos = -65,15

[State 0, TargetBind]
type = TargetBind
triggerall = movecontact
trigger1 = animelem = 19 ;uppercut2
time = 2
pos = 60,-15


[State 0, TargetBind]
type = TargetBind
triggerall = movecontact
trigger1 = animelem = 25 ;final kick
time = 2
pos = 60,15

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1  ;uppercut1
trigger2 = animelem = 7  ;lowkick
trigger3 = animelem = 11 ;med punch
trigger4 = animelem = 17 ;uppercut2
trigger5 = animelem = 22 ;final kick
value = 10,14

[State 0, Helper]
type = Helper
trigger1 = animelem = 1 ;uppercut1
trigger2 = animelem = 7 ;lowkick
trigger3 = animelem = 11 ;med punch
trigger4 = animelem = 17 ;uppercut2
trigger5 = animelem = 22 ;final kick
stateno = 3220
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 0, Helper]
type = Helper
trigger1 = animelem = 2  ;uppercut1
trigger2 = animelem = 8  ;low kick end
trigger3 = animelem = 12 ;med punch end
trigger4 = animelem = 18 ;upercut2
trigger5 = animelem = 23 ;final kick
stateno = 3220
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 0, PosSet] ;Strong Punch
type = PosSet
trigger1 = animelem = 1 && facing = 1
x = -15
y = -200

[State 0, PosSet] ;Low Kick
type = PosSet
trigger1 = animelem = 7 && facing = 1
x = 125
y = 0

[State 0, PosSet] ;Med Punch
type = PosSet
trigger1 = animelem = 11 && facing = 1
x = 80
y = -200

[State 0, PosSet] ;Uppercut
type = PosSet
trigger1 = animelem = 17 && facing = 1
x = -60
y = 0

[State 0, PosSet] ;Final Kick
type = PosSet
trigger1 = animelem = 22 && facing = 1
x = -15
y = -170

[State 0, PosSet] ;Strong Punch
type = PosSet
trigger1 = animelem = 1 && facing = -1
x = 30
y = -200

[State 0, PosSet] ;Low Kick
type = PosSet
trigger1 = animelem = 7 && facing = -1
x = -125
y = 0

[State 0, PosSet] ;Med Punch
type = PosSet
trigger1 = animelem = 11 && facing = -1
x = -80
y = -200

[State 0, PosSet] ;Uppercut
type = PosSet
trigger1 = animelem = 17 && facing = -1
x = 60
y = 0

[State 0, PosSet] ;Final Kick
type = PosSet
trigger1 = animelem = 22 && facing = -1
x = 15
y = -170

[State 0, hitdef] ;Strong Punch
type = HitDef
trigger1 = animelem = 4
attr = A, HA
guardflag = MA
hitflag = MAF
damage = 40
priority = 4
pausetime = 8, 10
sparkno = 2
sparkxy = -10,-40
hitsound = 5,2
guardsound = 6,0
animtype = Medium
air.velocity = -1,4.5
air.fall = 1
fall.recover = 0
kill = 0
getpower = 0

[State 0, hitdef] ;Low Kick
type = HitDef
trigger1 = animelem = 10
attr = S, HA
guardflag = MA
hitflag = MAF
damage = 40
priority = 4
pausetime = 8, 10
sparkno = 1
sparkxy = -10,-40
hitsound = 5,2
guardsound = 6,0
animtype = up
air.velocity = 1,-11
air.fall = 1
fall.recover = 0
kill = 0
getpower = 0

[State 0, hitdef] ;Med Punch
type = HitDef
trigger1 = animelem = 13
attr = A, HA
guardflag = MA
hitflag = MAF
damage = 40
priority = 4
pausetime = 8, 10
sparkno = 2
sparkxy = -10,-40
hitsound = 5,2
guardsound = 6,0
animtype = Medium
air.velocity = 0,5
air.fall = 1
fall.recover = 0
kill = 0
getpower = 0

[State 0, hitdef] ;Uppdercut
type = HitDef
trigger1 = animelem = 20
attr = C, HA
guardflag = MA
hitflag = MAF
damage = 40
priority = 4
pausetime = 8, 10
sparkno = 1
sparkxy = -10,-40
hitsound = 5,2
guardsound = 6,0
animtype = up
air.velocity = -2,-10
air.fall = 1
fall.recover = 0
kill = 0
getpower= 0

[State 620, hitdef] ;Final Kick
type = HitDef
trigger1 = animelem = 25
attr = A, HA
guardflag = MA
hitflag = MAF
damage = 50
priority = 4
pausetime = 8, 10
sparkno = 2
sparkxy = -10,20
hitsound = 5,2
guardsound = 6,0
animtype = Hard
air.velocity = -8,10
air.fall = 1
fall.recover = 0
getpower = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animtime = 0
id = 8901

[State 650, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 948
ctrl = 1

; Special Helper - Bamf! effect
[StateDef 3220]
type = A
movetype = A
physics = C
anim = 3221
ctrl = 0
sprpriority = 1

[State 0, Explod] ;Cloud Effect
type = Explod
trigger1 = time = 0
anim = 3220
id = 3220
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 3220, DestroySelf]
type = DestroySelf
trigger1 = parent, AnimTime = 0

[Statedef 55000]
type    = S
movetype= H
physics = N
velset = 0,0

[State 55000,Color]
type = PalFX
trigger1 = time = 0
time = 100
add = 0,-200,-200
mul = 256,256,256
sinadd = 40,80,40,10
invertall = 1
color = 0


[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;HITG_SLIDE

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 5000, 7]
type = selfstate
trigger1 = HitShakeOver
value = 5100
ctrl=1

