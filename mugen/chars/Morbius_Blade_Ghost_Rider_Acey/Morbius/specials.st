; States file for {character} -- Specials
;
;---------------------------------------------------------------------------
; Vars:
;   0: for Super Jump (0=vertical, 1=forward, -1=backward)
;   1: keep track of power level (for levelup sounds)
;  50: Desperation quote ("DANGER!" or whatever)
;  59: AI flag
; Helpers:
;   0: superjump opponent position indicator
; Explods:
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Special Attacks
; 
; Special 1 (QCF + P) -- state 1000
;   beam
;---------------------------------------------------------------------------

;------------------------------
; Special 1
[StateDef 1300]
type = S
movetype = A
physics = S
anim = 1300
ctrl = 0
velset = 0,0

;[State 0, PosSet]
;type = PosSet
;trigger1 = time = 0
;y = 0


[State 100, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S172,0

[State 100, PlaySnd]
type = PlaySnd
trigger1 = Time = 25
value = S172,1

[State 0, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal ;player
name = "missi"
ID = 1301
stateno = 1301
pos = -240,-100
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1000, changestate]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

; Special 1
[StateDef 1310]
type = S
movetype = A
physics = S
anim = 1300
ctrl = 0
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0


[State 100, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S172,0

[State 100, PlaySnd]
type = PlaySnd
trigger1 = Time = 25
value = S172,1

[State 0, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal ;player
name = "missi"
ID = 1301
stateno = 1301
pos = -240,-70
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1000, changestate]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

; Special 1
[StateDef 1320]
type = S
movetype = A
physics = S
anim = 1300
ctrl = 0
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0


[State 100, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S172,0

[State 100, PlaySnd]
type = PlaySnd
trigger1 = Time = 25
value = S172,1

[State 0, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal ;player
name = "missi"
ID = 1301
stateno = 1301
pos = -240,-40
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1000, changestate]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


[Statedef 1301]
type = A
movetype = A
physics = N
anim = 1301
velset = 7,0
sprpriority = 99

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
;value = 1
scale = .7,.7
;ignorehitpause = 
;persistent = 

;[State 1210, Explod]
;type = Explod
;trigger1 = time = 0
;anim = 1301
;ID = 1301
;facing = 1
;velocity= 5,0
;bindtime = 0
;removetime = 900
;sprpriority = 10
;removeongethit = 0
;scale= .7,.7

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 10

[State 220, HitDef]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 70,5
guardflag = MA
pausetime = 6,6
hitsound = s2,2
guardsound = s3,0
sparkno = 2
;guard.sparkno = S6004
sparkxy = -20, 0; (enemynear,pos y)
animtype = Heavy
ground.type = High
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -9,0
guard.velocity = -5
air.velocity = -3,-3
airguard.velocity = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
envshake.time = 6
envshake.ampl = 3


[State 1010, VarSet]
type = ParentVarSet
triggerall = fvar(26)!=1
trigger1 = movecontact
fv = 26
value = 1


[State 0, DestroySelf]
type = DestroySelf
trigger1 =  time = 300

;---------------------------------------------------------------------------
;Teleport3
[Statedef 1100]
type    = S
movetype= A
physics = S
juggle  = 1
poweradd= 120
ctrl = 0
velset = 0,0
anim = 1100
sprpriority = 0


[State 2010, 0]
type = playsnd
trigger1 = time = 15
value = 10,14

[State 2000, 1]
type = Posset
trigger1 = time = 37
Triggerall = Facing = 1
x = -320
y = -100


[State 2000, 1]
type = Posset
trigger1 = time = 37
Triggerall = Facing = -1
x = 320
y = -100



[State 2000, 1]
type = StateTypeSet
trigger1 = time = 37
statetype = A



[State 2000, 1]
type = Changeanim
trigger1 = time = 37
value = 1102

[State 2000, 1]
type = ctrlset
trigger1 = time = 57
value = 1

[State 2000, 1]
type = Changeanim
trigger1 = time = 57
value = 1103

[State 2000, 1]
type = Changestate
trigger1 = time = 57
value = 51

;---------------------------------------------------------------------------
;Teleport1
[Statedef 1103]
type    = S
movetype= A
physics = S
juggle  = 1
poweradd= 120
ctrl = 0
velset = 0,0
anim = 1105
sprpriority = 0

[State 2010, 0]
type = playsnd
trigger1 = time = 15
value = 10,14

[State 2000, 1]
type = Posset
trigger1 = time = 37
triggerall = facing = 1
x = -320
y = 0

[State 2000, 1]
type = Posset
trigger1 = time = 37
triggerall = facing = -1
x = 320
y = 0

[State 2000, 1]
type = StateTypeSet
trigger1 = time = 37
statetype = S

[State 2000, 1]
type = Changeanim
trigger1 = time = 37
value = 1106


[State 2000, 1]
type = ctrlset
trigger1 = time = 57
value = 1




[State 2000, 1]
type = Changestate
trigger1 = time = 57
value = ifelse(var(2) = 1,0,1106)




;---------------------------------------------------------------------------
;Teleport2
[Statedef 1104]
type    = S
movetype= A
physics = S
juggle  = 1
poweradd= 120
ctrl = 0
velset = 0,0
anim = 1100
sprpriority = 0

[State 2010, 0]
type = playsnd
trigger1 = time = 15
value = 10,14

[State 2000, 4]
type = Posadd
trigger1 = time = 37
triggerall = facing = 1
x = 200
y = 0

[State 2000, 5]
type = Posadd
trigger1 = time = 37
triggerall = facing = -1
x = 200
y = 0

[State 2000, 6]
type = StateTypeSet
trigger1 = time = 37
statetype = S

[State 2000, 7]
type = Changeanim
trigger1 = time = 37
value = 1101

[State 2000, 8]
type = turn
trigger1 = time = 37
trigger1 = P2BodyDist X <= -1

[State 2000, 9]
type = ctrlset
trigger1 = time = 57
value = 1




[State 2000, 10]
type = Changestate
trigger1 = time = 57
value = 948;ifelse(var(2) = 1,0,1106) 
ctrl = 1

;---------------------------------------------------------------------------
;Teleport end
[Statedef 1106]
type    = S
movetype= A
physics = S
juggle  = 1
poweradd= 120
ctrl = 1
velset = 0,0
anim = 1104
sprpriority = 0

[State 2000, 1]
type = Changestate
trigger1 = time = 8
value = 948
ctrl = 1

;---------------------------------------------------------------------------
; Finish Hit Explod (based on FlowaGirl and Ethan Lives codes)
; (taken with permission from McCready's StrongGuy char)
[Statedef 8900]
type = S
movetype = I
physics = N
anim = 8930

;[State 8900, 1]
;type = Pause
;trigger1 = (!Time)
;time = 12
;movetime = 12

[State 8900, 1]
type = EnvShake
trigger1 = (!Time)
time = 12
freq = 120;10
ampl = -3;2
phase = 90

[State 8900, 2]
type = Explod
triggerall = (NumExplod(8900) < 1)
trigger1 = Time = 0
persistent = 0
anim = 8900
ID = 8900
postype = left
pos = 0, 0
velocity = 0, 0
accel = 0, 0
removetime = -2
sprpriority = -4
bindtime = -1
ontop = 1
ownpal = 1
supermovetime = 1000
pausemovetime = 1000
ignorehitpause = 1

[State 8900, 3]
type = PlaySnd
trigger1 = (NumExplod(8900) != 0)
value = 30, 0
persistent = 0
supermovetime = 1000
pausemovetime = 1000
ignorehitpause = 1

[State 8900, done]
type = DestroySelf
trigger1 = RoundState = 4
;------------------------------
; Hypnotic Gaze
[StateDef 1000]
type = S
movetype = A
physics = S
poweradd = 69
velset = 0, 0
anim = 1000
ctrl = 0

; sfx
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S9,1

[State 1000, Hypno eyes]
type = explod
trigger1 = animelem = 3
anim = 1015
pos = 23,-73
postype = p1
bindtime = -1
removetime = 40
sprpriority = 5
removeongethit = 1
supermovetime = 999999
pausemovetime = 999999
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) > 0 && animelemtime(4) < 2
triggerall = time%12 = 0
anim = 1001
vfacing = 1-2*(random%2)
bindtime = 3
pos = 50*const(size.xscale), -70*const(size.yscale)
vel = 1,0
scale = 0.8*const(size.xscale), 0.8*const(size.yscale)
sprpriority = 2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(3) > 0 && animelemtime(4) < 2
triggerall = time%12 = 6
anim = 1002
vfacing = 1-2*(random%2)
bindtime = 3
pos = 50*const(size.xscale), -70*const(size.yscale)
vel = 1,0
scale = 0.8*const(size.xscale), 0.8*const(size.yscale)
sprpriority = 1
ownpal = 1

[State 1000, 2]
type = Projectile
trigger1 = AnimElem = 3
ProjID = 8002
ProjAnim = 1016
Projremove = 0
projremanim = 1017
Projhits = 1
velocity = 3,0
remvelocity = 0,0
projremovetime = 33
postype = p1
offset = 60,-50
sparkno = -1
attr = S, SP
damage = 50, 3
hitflag = MA
guardflag = MA
pausetime = 0,20
hitsound = S3,2
guardsound = 6,0
ground.slidetime = 15
ground.velocity = -10
ground.hittime = 15
air.velocity = -3,-2
;guard.velocity = -4,0
airguard.velocity = -4,0
p2stateno = 1110
kill = 0

[State 1000, 3]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------
[Statedef 1110]
type    = A
physics = N
movetype = H
ctrl = 0
anim = 5300

[State 1110, PalFXWiz]
type = PalFX
trigger1 = animelem = 1
time = 120
add = 100,100,100
mul = 256,256,256
sinadd = -80,-80,-80,25
invertall = 0
color = 40

[State 0, ]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 907, 3]
type = SelfState
trigger1 = Pos y != 0
value = 5100

[State 907, 3]
type = SelfState
trigger1 = Time = 120
ctrl = 1
value = 0
;--------------
;---------------------------------------------------------------------------
; Anti Air
[Statedef 1400]
type = A
movetype = A
physics = N
anim = 1400
juggle = 0;= 2
ctrl = 0
velset = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 171,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 172,12

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 224
ID = 224
pos = 13,-33
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 5
removeongethit = 1
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
y = -6
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 5
x = 0

[State 0, VelAdd]
type = VelAdd
triggerall = time < 17
trigger1 = vel y < 0 && vel y > -5
y = -1

[State 0, VelAdd]
type = VelAdd
trigger1 = time > 17
y = 0.5


[State 650, HitDef]
type = HitDef
trigger1 = time = 0
attr = A, SA
damage = 75,2
sparkno = 1
priority = 4, Hit
guardflag = HA
pausetime = 5,5
hitsound = S2,2
guardsound = S3,0
sparkxy = 0,-120
animtype = Heavy
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,-10
guard.velocity = -7
air.velocity = 1,-10
fall = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 50
ctrl = 0


;---------------------------------------------------------------------------
; Finish Hit Explod (based on FlowaGirl and Ethan Lives codes)
; (taken with permission from McCready's StrongGuy char)
[Statedef 8900]
type = S
movetype = I
physics = N
anim = 8930

;[State 8900, 1]
;type = Pause
;trigger1 = (!Time)
;time = 12
;movetime = 12

[State 8900, 1]
type = EnvShake
trigger1 = (!Time)
time = 12
freq = 120;10
ampl = -3;2
phase = 90

[State 8900, 2]
type = Explod
triggerall = (NumExplod(8900) < 1)
trigger1 = Time = 0
persistent = 0
anim = 8900
ID = 8900
postype = left
pos = 0, 0
velocity = 0, 0
accel = 0, 0
removetime = -2
sprpriority = -4
bindtime = -1
ontop = 1
ownpal = 1
supermovetime = 1000
pausemovetime = 1000
ignorehitpause = 1

[State 8900, 3]
type = PlaySnd
trigger1 = (NumExplod(8900) != 0)
value = 30, 0
persistent = 0
supermovetime = 1000
pausemovetime = 1000
ignorehitpause = 1

[State 8900, done]
type = DestroySelf
trigger1 = RoundState = 4
;-------------------------------------------------------------------------------
;Extractor of energy
[Statedef 1500]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 100
velset   = 0,0
anim     = 1500
ctrl     = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,1

[State 800, ヒット定義（投げ用）]
type = HitDef
triggerall = p2stateno != [120,152]
trigger1 = Time = 0
attr = S, HT
hitflag = MAF
numhits = 0
priority = 7,dodge
sparkno = 2
sparkxy = -30,-70
p1sprpriority = 1
p2sprpriority = 0
p2facing = 0
p1stateno = 1501
p2stateno = 1502 
guard.dist = 0
kill = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;Target
[Statedef 1501]
type     = S
movetype = A
physics  = S
juggle   = 0
poweradd = 0
velset   = 0,0
anim     = 1501
ctrl     = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S1,6

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S1,8

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 10
value = S1,9

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 28
value = S1,7

[State 100, TargetBind]
type = TargetBind
trigger1 = animelem = 1
pos = 70,0

[State 1000, Explod]
type = Explod
trigger1 = animelem = 4
anim = 1503
ID = 1503
pos = -2,14
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 5

[State 1000, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 28
id = 1503

[State 1000, Explod]
type = Explod
trigger1 = animelem = 28
anim = 30002
pos = 68,-68
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
sprpriority = 5

[State 2620, lifeadd]
type = lifeadd
trigger1 = time >= 1
Trigger1 = time <= 40
value = 1

[State 2620, lifeadd]
type = targetlifeadd
trigger1 = time >= 1
Trigger1 = time <= 40
value = -3
kill = 0

[State 2620, lifeadd]
type = targetlifeadd
Trigger1 = time = 40
value = -3

[State 1000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[Statedef 1502]
type    = A
movetype= H
physics = N
velset = 0,0

[State 52, 1]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1830]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1502

[State 1830]
type = changestate
trigger1 = Animtime = 0
value = 1503
ctrl = 0

[State 52, PalFXWiz]
type = PalFX
trigger1 = animelem = 1
time = 120
add = 7,-200,-200
mul = 256,256,256
sinadd = 30,30,0,10
invertall = 0
color = 0
;-------------------------------------------------------------------------------
[Statedef 1503]
type = A
movetype= H
physics  = N
ctrl = 0
facep2 = 1

[State 2630, PalFX]
type = PalFX
trigger1 = time = 0
time = 1

[State 52, 1]
type = VelSet
trigger1 = time = 0
x = -4
y = -6

[State 170, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA

[State 52, 1]
type = Veladd
trigger1 = time >= 0
y = .4

[State 1830]
type = ChangeAnim2
Trigger1 = Time = 0
value = 5050

[State 1830]
type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100
;-------------------------------------------------------------------------------
