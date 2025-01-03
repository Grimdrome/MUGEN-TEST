;The CMD File.
;-| Button Remapping |------------------------------------------------------
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s
;-| Default Values |--------------------------------------------------------
[Defaults]
Command.Time = 15
Command.Buffer.Time = 1
;-| Super Motions |---------------------------------------------------------
[Command]
Name = "ExtremePawCombo"
Command = ~D, B, D, B, x
Time = 20

[Command]
Name = "Memorial"
Command = ~D, B, F, a
Time = 40

[Command]
Name = "BigLaser"
Command = ~D, F, D, F, a
Time = 60

[Command]
Name = "Combo"
Command = ~D, F, D, F, x
Time = 30
;-| Special Motions |-------------------------------------------------------
[Command]
Name = "Laser"
Command = ~D, F, x

[Command]
Name = "Gun"
Command = ~D, F, y

[Command]
Name = "LJA"
Command = F, F, a

[Command]
Name = "SJA"
Command = F, F, b
;-| Super Jump |------------------------------------------------------------
[Command]
Name = "DU"
Command = ~D, U
Time = 15

[Command]
Name = "DUF"
Command = ~D, UF
Time = 15

[Command]
Name = "DUB"
Command = ~D, UB
Time = 15
;-| Double Tap |------------------------------------------------------------
[Command]
Name = "FF"
Command = F, F
Time = 10

[Command]
Name = "BB"
Command = B, B
Time = 10
;-| 2/3 Button Combination |------------------------------------------------
[Command]
Name = "recovery"
Command = x+y
Time = 1
;-| Dir + Button |----------------------------------------------------------
[Command]
Name = "down_a"
Command = /$D,a
Time = 1

[Command]
Name = "down_b"
Command = /$D,b
Time = 1
;-| Single Button |---------------------------------------------------------
[Command]
Name = "a"
Command = a
Time = 1

[Command]
Name = "b"
Command = b
Time = 1

[Command]
Name = "c"
Command = c
Time = 1

[Command]
Name = "x"
Command = x
Time = 1

[Command]
Name = "y"
Command = y
Time = 1

[Command]
Name = "z"
Command = z
Time = 1

[Command]
Name = "start"
Command = s
Time = 1

[Command]
Name = "fwd"
Command = F
Time = 1

[Command]
Name = "back"
Command = B
Time = 1

[Command]
Name = "up"
Command = U
Time = 1

[Command]
Name = "down"
Command = D
Time = 1
;-| Hold Button |------------------------------------------------------------
[Command]
Name = "hold_x"
Command = /x
Time = 1

[Command]
Name = "hold_y"
Command = /y
Time = 1

[Command]
Name = "hold_z"
Command = /z
Time = 1

[Command]
Name = "hold_a"
Command = /a
Time = 1

[Command]
Name = "hold_b"
Command = /b
Time = 1

[Command]
Name = "hold_c"
Command = /c
Time = 1

[Command]
Name = "hold_s"
Command = /s
Time = 1
;-| Hold Dir |--------------------------------------------------------------
[Command]
Name = "holdfwd"
Command = /$F
Time = 1

[Command]
Name = "holdback"
Command = /$B
Time = 1

[Command]
Name = "holdup"
Command = /$U
Time = 1

[Command]
Name = "holddown"
Command = /$D
Time = 1
;---------------------------------------------------------------------------
[StateDef -1]
;---------------------------------------------------------------------------
;Cupcake's Memorial
[State -1, Cupcake's Memorial]
Type = ChangeState
Value = 6300
TriggerAll = Var(59) = 0
TriggerAll = Power >= 3000
TriggerAll = StateType != A
TriggerAll = Ctrl
Trigger1 = Command = "Memorial"
;---------------------------------------------------------------------------
;Extreme Paw Combo Hyper
[State -1, Many Paws Punches And Kicks]
Type = ChangeState
Value = 3050
TriggerAll = Var(59) = 0
TriggerAll = Power >= 1000
TriggerAll = StateType != A
TriggerAll = Ctrl
Trigger1 = Command = "ExtremePawCombo"
;---------------------------------------------------------------------------
;Big Laser Hyper
[State -1, Big Laser Hyper]
Type = ChangeState
Value = 6200
Triggerall = Var(59) = 0
Triggerall = Command = "BigLaser"
Triggerall = Power >= 2000
Trigger1 = StateType = S
Trigger1 = Ctrl
Trigger2 = StateType != A
Trigger2 = HitDefAttr = SC,NA,SA,HA
Trigger2 = StateNO != [3000,3050]
Trigger2 = MoveContact
;---------------------------------------------------------------------------
;Power Charge
[State -1, Power Charge]
Type = ChangeState
Value = 1300
TriggerAll = Var(59) = 0
TriggerAll = StateType = S
TriggerAll = Power < PowerMax
TriggerAll = Ctrl = 1
Trigger1 = Command = "hold_a"
Trigger1 = Command = "hold_y"
;---------------------------------------------------------------------------
;Combo Hyper
[State -1, Combo Hyper]
Type = ChangeState
Value = 3000
TriggerAll = Var(59) = 0
TriggerAll = Command = "Combo"
TriggerAll = Power >= 1000
Trigger1 = StateType = S
Trigger1 = Ctrl
Trigger2 = StateType != A
Trigger2 = HitDefAttr = SC,NA,SA,HA
Trigger2 = StateNO != [3000,3050]
Trigger2 = MoveContact
;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
Type = ChangeState
Value = 7000
Trigger1 = Command = "DU"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
Type = ChangeState
Value = 7000
TriggerAll = Command = "holdup"
Trigger1 = StateNO = 420 && MoveHit
;---------------------------------------------------------------------------
[State -1, Combo Condition Reset]
Type = VarSet
Trigger1 = 1
var(1) = 0
;---------------------------------------------------------------------------
[State -1, Combo Condition Check]
Type = VarSet
Trigger1 = StateType != A
Trigger1 = Ctrl
Trigger2 = (StateNO = [200,299]) || (StateNO = [400,499])
Trigger2 = StateNO != 440
Trigger2 = MoveContact
var(1) = 1
;---------------------------------------------------------------------------
;Light Jump Attack
[State -1, Light Jump Attack]
Type = ChangeState
Value = 1050
Triggerall = Command = "LJA"
Trigger1 = var(1)
;---------------------------------------------------------------------------
;Strong Jump Attack
[State -1, Strong Jump Attack]
Type = ChangeState
Value = 1060
TriggerAll = Command = "SJA"
Trigger1 = Var(1)
;---------------------------------------------------------------------------
;Laser Special
[State -1, Laser Special]
Type = ChangeState
Value = 1000
TriggerAll = Command = "Laser"
Trigger1 = Var(1)
;---------------------------------------------------------------------------
;Gun Special
[State -1, Gun Special]
Type = ChangeState
Value = 1010
TriggerAll = Command = "Gun"
Trigger1 = Var(1)
;---------------------------------------------------------------------------
;Run Forwards
[State -1, Run Forwards]
Type = ChangeState
Value = 100
Trigger1 = Command = "FF"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Hop Backwards
[State -1, Hop Backwards]
Type = ChangeState
Value = 105
Trigger1 = Command = "BB"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
Type = ChangeState
Value = 200
TriggerAll = Command = "x"
TriggerAll = Command != "holddown"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Stand Medium Punch
[State -1, Stand Medium Punch]
Type = ChangeState
Value = 210
TriggerAll = Command = "y"
TriggerAll = Command != "holddown"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
Type = ChangeState
Value = 220
TriggerAll = Command = "z"
TriggerAll = Command != "holddown"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
Type = ChangeState
Value = 230
TriggerAll = Command = "a"
TriggerAll = Command != "holddown"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Standing Medium Kick
[State -1, Standing Medium Kick]
Type = ChangeState
Value = 240
TriggerAll = Command = "b"
TriggerAll = Command != "holddown"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
Type = ChangeState
Value = 250
TriggerAll = Command = "c"
TriggerAll = Command != "holddown"
Trigger1 = StateType = S
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
Type = ChangeState
Value = 400
TriggerAll = Command = "x"
TriggerAll = Command = "holddown"
Trigger1 = StateType = C
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Crouching Medium Punch
[State -1, Crouching Medium Punch]
Type = ChangeState
Value = 410
TriggerAll = Command = "y"
TriggerAll = Command = "holddown"
Trigger1 = StateType = C
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
Type = ChangeState
Value = 420
TriggerAll = Command = "z"
TriggerAll = Command = "holddown"
Trigger1 = StateType = C
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
Type = ChangeState
Value = 430
TriggerAll = Command = "a"
TriggerAll = Command = "holddown"
Trigger1 = StateType = C
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Crouching Medium Kick
[State -1, Crouching Medium Kick]
Type = ChangeState
Value = 440
TriggerAll = Command = "b"
TriggerAll = Command = "holddown"
Trigger1 = StateType = C
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
Type = ChangeState
Value = 450
TriggerAll = Command = "c"
TriggerAll = Command = "holddown"
Trigger1 = StateType = C
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
Type = ChangeState
Value = 600
TriggerAll = Command = "x"
Trigger1 = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Jump Medium Punch
[State -1, Jump Medium Punch]
Type = ChangeState
Value = 610
TriggerAll = Command = "y"
Trigger1 = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
Type = ChangeState
Value = 620
TriggerAll = Command = "z"
Trigger1 = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
Type = ChangeState
Value = 630
TriggerAll = Command = "a"
Trigger1 = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Medium Kick]
Type = ChangeState
Value = 640
TriggerAll = Command = "b"
Trigger1 = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
Type = ChangeState
Value = 650
TriggerAll = Command = "c"
Trigger1 = StateType = A
Trigger1 = Ctrl