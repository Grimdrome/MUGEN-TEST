; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10




;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


[Command]
name = "upper_x"
command = ~F, D, DF, x

[Command]
name = "upper_b"
command = ~F, D, DF, b

[Command]
name = "upper_a"
command = ~F, D, DF, a

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_z"
command = ~F, D, DF, z

[Command]
name = "upper_b2"
command = ~B, D, DB, b
time = 20

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y

[Command]
name = "DD_a"
command = ~D, D, a

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_z"
command = ~D, DF, F, z

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_z"
command = ~D, DB, B, z

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_c"
command = ~D, DF, F, c

[Command]
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, c

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b

[Command]
name = "~D, D, x"
command = ~D, D, x

[Command]
name = "~D, D, y"
command = ~D, D, y

[Command]
name = "~D, D, z"
command = ~D, D, z

[Command]
name = "~D, D, b"
command = ~D, D, b

[Command]
name = "DD_c"
command = ~D, D, c
time = 15

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = $F,x
time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = x,$F
time = 3

[Command]
name = "F_b"
command = F, b

[Command]
name = "F_c"
command = F, c

[Command]
name = "super_jump"    
command = $D, $U
time = 20

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 14

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 14

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
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

[Command]
name = "hold_a"
command = /a

[Command]
name = "hold_b"
command = /b

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;===========================================================================
;---------------------------------------------------------------------------
[State -2, VarAdd]
Type = VarSet
Trigger1 = 1
IgnoreHitPause = 1
fvar(15) = frontedgedist

[State -2, VarAdd]
Type = VarSet
Trigger1 = 1
IgnoreHitPause = 1
fvar(16) = p2dist y

[State -2, VarAdd]
Type = Varadd
Trigger1 = 1
IgnoreHitPause = 1
fvar(17) = fvar(2);((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 10)))*((p2bodydist x) / 10)

[State -2, VarAdd]
Type = VarSet
triggerall = enemy,backedgedist = 0
triggerall = movehit = 1
;slide = 18 , fvar(39) = -11, current value around -59, should be -31
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(18) = fvar(39)/1.12

[State -2, VarAdd]
Type = VarSet
triggerall = enemy,backedgedist > 0
triggerall = movehit = 1
triggerall = facing = -1 && enemy,facing = 1 || facing = -1 && enemy,facing = -1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(18) = enemy,gethitvar(xvel)

[State -2, VarAdd]
Type = VarSet
triggerall = enemy,backedgedist > 0
triggerall = movehit = 1
triggerall = facing = 1 && enemy,facing = -1 || facing = 1 && enemy,facing = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(18) = -enemy,gethitvar(xvel)

[State -2, VarAdd]
Type = VarSet
triggerall = enemy,backedgedist = 0
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(19) = const(movement.stand.friction)

[State -2, VarAdd]
Type = VarSet
triggerall = enemy,backedgedist > 0
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(19) = enemy,const(movement.stand.friction)

[State -2, VarAdd];1t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(20) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(20) = fvar(20) + enemy,backedgedist 

[State -2, VarAdd];1t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(20) = fvar(18) * fvar(19)

[State -2, VarAdd];2t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(21) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(21) = fvar(21) + enemy,backedgedist 

[State -2, VarAdd];2t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(21) = fvar(20) + fvar(18) * fvar(19) * fvar(19)

[State -2, VarAdd];3t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(22) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(22) = fvar(22) + enemy,backedgedist 

[State -2, VarAdd];3t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(22) = fvar(21) + fvar(18) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];4t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(23) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(23) = fvar(23) + enemy,backedgedist 

[State -2, VarAdd];4t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(23) = fvar(22) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];5t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(24) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(24) = fvar(24) + enemy,backedgedist 

[State -2, VarAdd];5t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(24) = fvar(23) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];6t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(25) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(25) = fvar(25) + enemy,backedgedist 

[State -2, VarAdd];6t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(25) = fvar(24) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];7t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(26) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(26) = fvar(26) + enemy,backedgedist 

[State -2, VarAdd];7t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(26) = fvar(25) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];8t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(27) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(27) = fvar(27) + enemy,backedgedist 

[State -2, VarAdd];8t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(27) = fvar(26) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];9t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(28) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(28) = fvar(28) + enemy,backedgedist 

[State -2, VarAdd];9t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(28) = fvar(27) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];10t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(29) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(29) = fvar(29) + enemy,backedgedist 

[State -2, VarAdd];10t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(29) = fvar(28) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];11t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(30) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(30) = fvar(30) + enemy,backedgedist 

[State -2, VarAdd];11t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(30) = fvar(29) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];12t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(31) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(31) = fvar(31) + enemy,backedgedist 

[State -2, VarAdd];12t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(31) = fvar(30) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];13t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(32) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(32) = fvar(32) + enemy,backedgedist 

[State -2, VarAdd];13t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(32) = fvar(31) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];14t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(33) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(33) = fvar(33) + enemy,backedgedist 

[State -2, VarAdd];14t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(33) = fvar(32) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];15t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(34) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(34) = fvar(34) + enemy,backedgedist 

[State -2, VarAdd];15t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(34) = fvar(33) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];16t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(35) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(35) = fvar(35) + enemy,backedgedist 

[State -2, VarAdd];16t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(35) = fvar(34) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];10t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(36) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(36) = fvar(36) + enemy,backedgedist 

[State -2, VarAdd];17t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(36) = fvar(35) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];18t
Type = VarSet
;triggerall = movehit = 1
Trigger1 = -fvar(37) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(37) = fvar(37) + enemy,backedgedist 

[State -2, VarAdd];18t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(37) = fvar(36) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];19t
Type = VarSet
;Triggerall = movehit = 1
Trigger1 = -fvar(38) > enemy,backedgedist 
IgnoreHitPause = 1
fvar(38) = fvar(38) + enemy,backedgedist 

[State -2, VarAdd];19t
Type = VarSet
triggerall = movehit = 1
Trigger1 = enemy,statetype != A && enemy,movetype = H
IgnoreHitPause = 1
fvar(38) = fvar(37) + fvar(18) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19) * fvar(19)

[State -2, VarAdd];Corner Offset
Type = VarSet
Trigger1 = enemy,backedgedist > 0 || enemy,movetype != H || stateno = 0
IgnoreHitPause = 1
fvar(39) = 0

[State -2, VarAdd];Corner Offset
Type = VarSet
Triggerall = enemy,backedgedist = 0 && enemy,movetype = H
trigger1 = stateno = 200  && enemy,statetype = A 
trigger2 = stateno = 600 && enemy,statetype = A 
trigger3 = stateno = 400 && enemy,statetype = A 
IgnoreHitPause = 1
fvar(39) = -1

[State -2, VarAdd];Corner Offset
Type = VarSet
Triggerall = enemy,backedgedist = 0 && enemy,movetype = H
trigger1 = stateno = 200 && enemy,statetype != A   
trigger2 = stateno = 600 && enemy,statetype != A
trigger3 = stateno = 210 && enemy,statetype = A
trigger4 = stateno = 215 && enemy,statetype = A
trigger5 = stateno = 400 && enemy,statetype != A 
trigger6 = stateno = 610 && enemy,statetype = A
trigger7 = stateno = 220 && enemy,statetype = A
trigger8 = stateno = 620 && enemy,statetype = A
IgnoreHitPause = 1
fvar(39) = -3

[State -2, VarAdd];Corner Offset
Type = VarSet
Triggerall = enemy,backedgedist = 0 && enemy,movetype = H
trigger1 = stateno = 210 && enemy,statetype != A
trigger2 = stateno = 215 && enemy,statetype != A
trigger3 = stateno = 610 && enemy,statetype != A
IgnoreHitPause = 1
fvar(39) = -8

[State -2, VarAdd];Corner Offset
Type = VarSet
Triggerall = enemy,backedgedist = 0 && enemy,movetype = H
trigger1 = stateno = 220 && enemy,statetype != A
trigger2 = stateno = 620 && enemy,statetype != A
IgnoreHitPause = 1
fvar(39) = -11

[State -2, VarAdd];Corner Offset
Type = VarSet
Triggerall = enemy,backedgedist = 0 && enemy,movetype = H
trigger1 = stateno = 230
trigger2 = stateno = 630
IgnoreHitPause = 1
fvar(39) = -15

[State -2, VarAdd];Corner Offset
Type = VarSet
Triggerall = enemy,backedgedist = 0 && enemy,movetype = H
trigger1 = stateno = 250
trigger2 = stateno = 650
trigger3 = stateno = 660
trigger4 = stateno = [1300,1360]
IgnoreHitPause = 1
fvar(39) = -17

[State -2, VarAdd];Y Accel normal
Type = VarSet
trigger1 = enemy,stateno != [10000,10049]
IgnoreHitPause = 1
fvar(4) = enemy,const(movement.yaccel)

[State -2, VarAdd];Y Accel wallslam flying
Type = VarSet
Triggerall = enemy,statetype = A; && enemy,movetype = H
trigger1 = enemy,stateno = [10040,10042]
trigger2 = enemy,stateno = [10000,10016]
IgnoreHitPause = 1
fvar(4) = 0.0

[State -2, VarAdd];Y Accel wallslam collision
Type = VarSet
Triggerall = enemy,statetype = A; && enemy,movetype = H
trigger1 = enemy,stateno = [10043,10044]
trigger2 = enemy,stateno = 10017 
trigger3 = enemy,stateno = 10019
IgnoreHitPause = 1
fvar(4) = 0.55

[State -2, VarAdd];Corner X Velocity Checker
Type = VarSet
triggerall = enemy,stateno != 10044
triggerall = facing != enemy,facing
trigger1 = enemy,backedgedist > 60
trigger2 = enemy,statetype != A
trigger3 = enemy,movetype != H
;trigger4 = enemy,vel x < 0
IgnoreHitPause = 1
fvar(5) = enemy,vel x

[State -2, VarAdd];Corner X Velocity Checker
Type = VarSet
triggerall = enemy,stateno != 10044
triggerall = facing = enemy,facing
trigger1 = enemy,backedgedist > 60
trigger2 = enemy,statetype != A
trigger3 = enemy,movetype != H
;trigger4 = enemy,stateno = [10050,10054]
;trigger4 = enemy,vel x < 0
IgnoreHitPause = 1
fvar(5) = -enemy,vel x

[State -2, VarAdd];Corner X Velocity Checker
Type = VarSet
triggerall = enemy,stateno != 10044
triggerall = enemy,statetype = A
triggerall = enemy,movetype = H
trigger1 = enemy,backedgedist < 61
trigger1 = frontedgedist < 189
trigger2 = enemy,backedgedist = 0
IgnoreHitPause = 1
fvar(5) = 0

[State -2, VarAdd];Corner X Velocity Checker Wallslam
Type = VarSet
trigger1 = enemy,stateno = 10044
IgnoreHitPause = 1
fvar(5) = 1.2

[State -2, VarAdd];Y Accel normal
Type = VarSet
trigger1 = stateno != 640  && stateno != 641 && stateno != 101 && stateno != 1050 && stateno != 1150 
IgnoreHitPause = 1
fvar(6) = const(movement.yaccel)

[State -2, VarAdd];Y Accel others
Type = VarSet
Triggerall = statetype = A; && enemy,movetype = H
trigger1 = stateno = 640 
trigger2 = stateno = 641 
trigger3 = stateno = 101 
trigger4 = stateno = 1050 
trigger5 = stateno = 1150 
IgnoreHitPause = 1
fvar(6) = 0.0

;[State -2, VarAdd];Grab Attack Detector for AI 
;type = Varset
;triggerall = (enemynear,hitdefattr=SCA,AT) || (enemynear,hitdefattr=SCA,ST) || (enemynear,hitdefattr=SCA,HT) || (enemynear,hitdefattr=SCA,NT)
;trigger1 = movetype = H
;trigger1 = !time
;IgnoreHitPause = 1
;var(32) = var(32) + 1

;[State -2, VarAdd];Grab Attack Detector for AI 
;type = Varset
;triggerall = var(32) = 3
;triggerall = (enemynear,hitdefattr=SCA,AT) || (enemynear,hitdefattr=SCA,ST) || (enemynear,hitdefattr=SCA,HT) || (enemynear,hitdefattr=SCA,NT)
;trigger1 = movetype = H
;trigger1 = !time
;IgnoreHitPause = 1
;persistent = 0
;var(56) = var(56) + 1

;[State -2, VarAdd];Grab Attack Detector for AI 
;type = Varset
;trigger1 = var(32) = 3
;IgnoreHitPause = 1
;var(32) = 0

[State 0, VarSet]
type = VarSet
trigger1 = enemy,movetype != H
var(25) = 0
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = p2stateno = 10040
trigger1 = enemy,pos y > -19
var(25) = 1
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = enemy,movetype != H
var(26) = 0
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = stateno = 1400
trigger1 = movehit
;trigger1 = prevstateno = 0 || prevstateno = [120,159]
var(26) = 1
persistent = 0

[State -2, DisplayToClipboard]
Type = DisplayToClipboard
Triggerall = TeamSide = 1
Trigger1 = Time >= 0
Text = "V15:%4d, V16:%4d, V17:%4d, V18:%4d"
Params = fvar(16), fvar(15),var(56), fvar(2)
IgnoreHitPause = 1

;---------------------------------------------------------------------------
[State -1, Combo]
type = VarSet
trigger1 = stateno != [200,2500]
var(1) = 0

[State -1, Hit Trigger]
type = VarSet
trigger1 = stateno = 200 && movecontact
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 215 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 225 && movecontact
trigger6 = stateno = 230 && movecontact
trigger7 = stateno = 240 && movecontact
trigger8 = stateno = 241 && movecontact
trigger9 = stateno = 250 && movecontact
trigger10 = stateno = 400 && movecontact
trigger11 = stateno = 600 && movecontact
trigger12 = stateno = 1000 && enemy,movetype = H
trigger13 = stateno = 1100 && enemy,movetype = H
trigger14 = stateno = 1200 && movecontact
trigger15 = stateno = 1300 && movecontact
trigger16 = stateno = 1310 && movecontact
trigger17 = stateno = 1350 && movecontact
trigger18 = stateno = 1360 && movecontact
trigger19 = stateno = 610 && movecontact
trigger20 = stateno = 620 && movecontact
trigger21 = stateno = 630 && movecontact
trigger22 = stateno = 640 && movecontact
trigger23 = stateno = 641 && movecontact
trigger24 = stateno = 650 && movecontact
trigger25 = stateno = 660 && movecontact
trigger26 = stateno = 620 && movecontact
trigger27 = stateno = 1050 && enemy,movetype = H
trigger28 = stateno = 1150 && enemy,movetype = H
trigger29 = stateno = 1400 && movecontact
trigger30 = stateno = 1500 && enemy,movetype = H
trigger31 = stateno = 1510 && enemy,movetype = H
trigger32 = stateno = 1550 && enemy,movetype = H
trigger33 = stateno = 1560 && enemy,movetype = H
trigger34 = stateno = 1600 && enemy,movetype = H
trigger35 = stateno = 1610 && enemy,movetype = H
trigger36 = stateno = 1620 && enemy,movetype = H
trigger37 = stateno = 1650 && enemy,movetype = H
trigger38 = stateno = 1660 && enemy,movetype = H
trigger39 = stateno = 1670 && enemy,movetype = H
trigger40 = stateno = 1700 && enemy,movetype = H
trigger41 = stateno = 1750 && enemy,movetype = H
trigger42 = stateno = 2000 && enemy,movetype = H
var(1) = 1

[State -1, Melee Guarded]
type = VarSet
trigger1 = stateno = 200 && moveguarded
trigger2 = stateno = 210 && moveguarded
trigger3 = stateno = 220 && moveguarded
trigger4 = stateno = 230 && moveguarded
trigger5 = stateno = 240 && moveguarded
trigger6 = stateno = 250 && moveguarded
trigger7 = stateno = 205 && moveguarded
trigger8 = stateno = 215 && moveguarded
trigger9 = stateno = 1200 && moveguarded
var(1) = 2

[State -1, Low Guarded]
type = VarSet
trigger1 = stateno = 400 && moveguarded
var(1) = 4

;[State -1, Range Guarded]
;type = VarSet
;var(1) = 5

[State -1]
Type=Assertspecial
Triggerall=StateNo!=[120,160]
Trigger1=var(59)>0
flag=noairguard
flag2=nocrouchguard
flag3=nostandguard

;---------------------------------------------------------------------------
; AI switch -> ON
[State -1, Activate AI]
type = Varset
triggerall = var(59) != 1
trigger1 = roundstate = 2
trigger1 = ailevel
trigger2 = command = "start"
;trigger1 = 1;teamside = 1
v = 59
value = 1
Ignorehitpause=1

[State -1, When To Ultimate - Sun Grazer]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A) 
triggerall = power > 2999             
triggerall = p2statetype != L 
;triggerall = palno != 12  
triggerall = var(57) != 1
triggerall = palno != 11
;triggerall = p2dist X = [-75,150 - (enemy,movetype = H * 20)]  
;triggerall = p2dist y = [-150,0-((enemy,statetype = A) * 75)]  
triggerall = fvar(5) = [-3,3]   
triggerall = enemy,stateno != [10000,10053]     
triggerall = enemy,vel y = [-3,8]    
triggerall = enemy,stateno != [100,109]   
triggerall = p2dist x = [-50,150 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+10),(fvar(5)) * 10),((fvar(5)) * 10))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 10 + p2dist x) >= 0),1)
triggerall = p2dist y = [-150 - (((enemy,vel y)+ (fvar(4)* 10)) * 10),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 10)) * 10) + p2dist y) <= 0),1)                                 
trigger1 = enemy,life >= 500  
trigger1 = ctrl  
trigger2 = enemy,life >= 500 
trigger2 = enemy,moveguarded
trigger2 = !enemy,ishelper
trigger2 = enemy,gethitvar(slidetime) = 0     
trigger2 = facing 
trigger2 = ctrl 
trigger2 = stateno != 3100 || stateno != 3000 || stateno != 3050 || stateno != 3200 || stateno != 3250
trigger3 = stateno = 710 && animtime = 0 || stateno = 711 && animtime = 0 || stateno = 712 && animtime = 0
trigger3 = enemy,life >= 500 
trigger4 = p2dist X = [0,130]                               
trigger4 = life < 400  
trigger4 = ctrl 
trigger4 = roundno > 3
trigger4 = enemy,life >= 350 
trigger5 = stateno = [800,804]
trigger5 = animelemtime(11) >= 2 && animelemtime(12) <= 4
trigger5 = enemy,life >= 500  
trigger6 = stateno = 210 && movecontact && enemy,movetype = H 
trigger6 = enemy,life >= 500       
trigger7 = stateno = 220 && movecontact && enemy,movetype = H   
trigger7 = enemy,life >= 500
trigger7 = enemy,statetype != A
trigger8 = stateno = 215 && movecontact && enemy,movetype = H  
trigger8 = hitcount = 2
trigger8 = enemy,life >= 500
value = 4000 

[State -1, When To Super - Blazing Star]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = power > 1999 
triggerall = enemy,stateno != [120,155] 
triggerall = enemy,statetype != L
triggerall = numexplod(33000) < 1  
triggerall = p2dist y = [-100,100] 
;triggerall = enemy,vel y = [-3,3]  
triggerall = enemynear,stateno != [5120,5210]                                                 
trigger1 = p2dist x = [50,999] 
trigger1 = enemy,life < 500 && enemy,life > 250  
trigger1 = (Ctrl)
trigger1 = enemy,movetype = A && enemy,time < 10
trigger1 = p2dist y = [-70,70]
trigger1 = var(56) = 0
trigger2 = enemy,stateno = [10040,10041]
trigger2 = ctrl
trigger2 = random < 999 + -life
trigger2 = enemy,life = [250,500]
trigger3 = stateno = 1200
trigger3 = movehit < 3 && enemy,movetype = H
trigger3 = hitcount > 3
trigger3 = var(21) = 1
trigger3 = p2dist y < -25
trigger3 = numexplod(22020) = 1 || enemy,life = [125,400]
trigger4 = p2bodydist x = [0,400]
trigger4 = ctrl
trigger4 = roundno > 2 || enemy,life = [250,500]
trigger4 = enemy,movetype = A && enemy,time < 10
trigger4 = life < 300
trigger4 = var(56) = 0
value = 3400

[State -1, When To Super - Master Spark]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = power > 1999 
triggerall = enemy,stateno != [120,155] 
triggerall = enemy,statetype != L
triggerall = numexplod(34000) < 1  
triggerall = p2dist y = [-140,70] 
;triggerall = enemy,vel y = [-1,9]  
triggerall = enemynear,stateno != [5120,5210]                                                 
trigger1 = enemy,stateno = [10040,10041]
trigger1 = ctrl
trigger1 = random < 999 + -lifemax
trigger1 = enemy,life = [320,640]
trigger2 = stateno = 1400 && hitcount = 8 
trigger2 = movecontact && enemy,movetype = H
trigger2 = numexplod(22020) = 1 
trigger2 = enemy,life = [150,300]; || roundno > 2 && enemy,life > enemy,lifemax * 0.16
trigger3 = (var(20) = 0) && animelemtime(16) = 1 && stateno = [1300,1310]
trigger3 = movecontact && enemy,movetype = H
trigger3 = numexplod(22020) = 1  
trigger3 = enemy,life > enemy,lifemax * 0.5 || roundno > 2 && enemy,life > enemy,lifemax * 0.16  
trigger3 = p2dist y = [-140,0] 
trigger4 = enemy,vel x >= 0
trigger4 = stateno = [120,139]
trigger4 = power >= 2700
trigger4 = enemy,movetype = A
trigger4 = cond(enemy,life > 400, 1, cond(life < 400, 1, 0))
trigger4 = random < 999 + -life
trigger5 = p2dist x = [50,999] 
trigger5 = enemy,life < 500 && enemy,life > 250  
trigger5 = (Ctrl)
trigger5 = enemy,movetype = A && enemy,time < 10
trigger5 = p2dist y = [-140,0]
trigger5 = var(56) = 1
trigger6 = p2bodydist x = [100,400]
trigger6 = ctrl
trigger6 = roundno > 2 || enemy,life = [250,500]
trigger6 = enemy,movetype = A && enemy,time < 10
trigger6 = life < 300
trigger6 = var(56) = 1
value = 3300

[State -1, When To Super - Stellar Journey]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)  
triggerall = p2statetype != L       
triggerall = power > 999                  
;triggerall = p2dist X = [0,85]
;triggerall = p2dist y = [-95,0-(30*enemy,statetype = A)]   
triggerall = p2dist x = [0,85 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+10),(fvar(5)) * 10),((fvar(5)) * 10))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 10 + p2dist x) >= 0),1)
triggerall = p2dist y = [-65 - (((enemy,vel y)+ (fvar(4)* 10)) * 10),1]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 10)) * 10) + p2dist y) <= 0),1)                                 
;triggerall = enemynear,life > 200
;triggerall = teammode != simul
triggerall = palno != [11,12]          
triggerall = enemy,stateno != [10000,10053]  
triggerall = enemy,stateno != [100,106]  
triggerall = prevstateno != 1200     
triggerall = enemynear,vel x = [-2,2]          
triggerall = enemynear,stateno != [40,49]  
triggerall = numhelper(3299) = 0
trigger1 = random <= (125 + (575 * (enemy,stateno = [130,155])))
trigger1 = ctrl   
trigger1 = numexplod(31000) < 1     
trigger1 = enemy,movetype != H   
trigger1 = enemynear,vel y = [-2,2]                       
trigger2 = enemy,life <= 220 
trigger2 = ctrl  
trigger2 = life < 300 
trigger2 = enemy,movetype != H 
trigger2 = enemynear,vel y = [-2,2]     
trigger2 = numexplod(31000) < 1 
trigger3 = stateno = 1400 && hitcount = 8 || animelemtime(16) > 0 && (var(20) = 0) && frontedgedist < 100 && stateno = [1300,1310] 
trigger3 = movecontact
trigger3 = enemy,life <= (220 * fvar(2)) || enemy,life <= 55 
trigger3 = numexplod(22020) = 1 
trigger4 = stateno = [800,804]
trigger4 = animelemtime(11) >= 2 && animelemtime(12) <= 4
trigger4 = enemynear,movetype != A
trigger4 = Random <= 1000*ifelse((random <= 200 + ((life < 300)*700)),1,0) 
value = 3100

[State -1, When To Super - Satellite Illusion]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)  
;triggerall = p2statetype != L      
triggerall = power > 999                 
triggerall = numhelper(3210) = 0                            
triggerall = enemy,movetype != A
triggerall = numexplod(32000) < 1 
triggerall = enemy,stateno != [10000,10053] 
trigger1 = random < 250 
trigger1 = ctrl
trigger1 = life < 400
trigger1 = enemy,life < 300
trigger1 = power < 2000
trigger1 = enemy,movetype != H || enemy,stateno = [5080,5150]
trigger2 = random < 150 
trigger2 = ctrl
trigger2 = var(57) = 1
trigger2 = power >= 2700
trigger2 = enemy,movetype != H || enemy,stateno = [5080,5150]
trigger3 = stateno = [800,804]
trigger3 = animelemtime(11) >= 2 && animelemtime(12) <= 4
trigger3 = enemynear,stateno != [120,159]
trigger3 = p2dist x > 85
trigger3 = Random <= 1000*ifelse((random <= 100 + ((life < 300)*700)),1,0) 
value = 3200

[State -1, When To Super - Aerial Satellite Illusion]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype = A)  
;triggerall = p2statetype != L      
triggerall = power > 999                 
triggerall = numhelper(3210) = 0                            
triggerall = enemy,movetype != A
triggerall = numexplod(32000) < 1 
triggerall = enemy,stateno != [10000,10053] 
trigger1 = random < 250 
trigger1 = ctrl
trigger1 = life < 400
trigger1 = enemy,life < 300
trigger1 = power < 2000
trigger1 = enemy,movetype != H || enemy,stateno = [5080,5150]
trigger2 = stateno = 1400 && hitcount = 8 
trigger2 = movecontact
trigger2 = numexplod(22020) = 1  
trigger2 = power > 2599 || enemy,life < (enemy,lifemax * 0.1)
trigger2 = enemy,life < (enemy,lifemax * 0.8)
;trigger3 = random < 150 
;trigger3 = ctrl
;trigger3 = var(56) = 1
value = 3250

[State -1, When to Hop Backwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = backedgedist > 60
triggerall = (enemy,movetype != H) * (enemy,stateno != [10000,10053])
triggerall = numhelper(1730) = 0
triggerall = numhelper(3210) = 0
triggerall = numhelper(3004) = 0
trigger1 = var(1) = 0 
trigger1 = Random < (40)
trigger1 = p2dist x = [-20-(52*(enemy,movetype = H)),72 + ((var(56) = 1) * 53)]
trigger1 = Ctrl
Trigger2 = p2stateno = [120,155]
trigger2 = p2dist x = [0,90]
trigger2 = Random <= 350
trigger2 = ctrl
trigger3 = (enemynear,hitdefattr=SCA,AT) || (enemynear,hitdefattr=SCA,ST) || (enemynear,hitdefattr=SCA,HT) || (enemynear,hitdefattr=SCA,NT)
trigger3 = p2dist x = [-25,150];inguarddist
trigger3 = random <= 600
trigger3 = Ctrl || stateno = [120,140]
trigger4 = enemy,statetype = L
trigger4 = frontedgedist < 75
trigger4 = random <= 100
trigger4 = ctrl
trigger5 = stateno = [800,804] 
trigger5 = animelemtime(11) >= 2 && animelemtime(12) <= 4
trigger5 = enemy,movetype = A
trigger6 = enemynear,stateno = [5120,5210] 
trigger6 = p2dist x < 75
trigger6 = ctrl
trigger6 = random < 100
trigger7 = p2dist x = [-20,20]
trigger7 = p2dist y = [50,200]
trigger7 = enemy,movetype = A
trigger7 = random <= 500
trigger7 = backedgedist > 60
trigger7 = ctrl
trigger8 = p2dist x = [-20,20]
trigger8 = p2dist y = [-300,-150]
trigger8 = enemy,movetype = A
trigger8 = random <= 500
trigger8 = backedgedist > 60
trigger8 = ctrl
trigger9 = stateno = 200 || stateno = 400
trigger9 = p2dist x = [0,75]
trigger9 = !movecontact
trigger9 = time > 14
trigger10 = stateno = 210 
trigger10 = p2dist x = [0,105]
trigger10 = !movecontact
trigger10 = time > 18
value = 105

[State -1, AI Guarding, Hard AI]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall =!(enemynear,hitdefattr=SCA,AT,ST,HT,NT)
triggerall = enemynear,movetype = A || inguarddist || enemynear,numproj >= 1
triggerall = palno != 12
triggerall = numhelper(3004) = 0
;triggerall = inguarddist
trigger1 = inguarddist
trigger1 = ctrl
trigger1 = random <= 980
trigger2 = stateno = [130,155]
trigger2 = ctrl
trigger2 = inguarddist
trigger3 = stateno = [77000,77003]
trigger3 = inguarddist
trigger4 = stateno = [50,53]
trigger4 = inguarddist
trigger5 = stateno = 710 && animelemtime(5) >= 2 && animelemtime(6) <= 4
trigger5 = inguarddist
trigger6 = stateno = 711 && animelemtime(5) >= 2 && animelemtime(6) <= 4
trigger6 = inguarddist
trigger7 = stateno = 712 && animelemtime(5) >= 2 && animelemtime(6) <= 4
trigger7 = inguarddist
trigger8 = stateno = 106 || stateno = 100
trigger8 = inguarddist 
trigger9 = stateno = [101,102]
trigger9 = inguarddist 
trigger9 = ctrl
trigger9 = time > 15
trigger10 = stateno = 105
trigger10 = vel y > 0
trigger10 = pos y >= 0
trigger10 = inguarddist
trigger11 = stateno = 1000 || stateno = 1050
trigger11 = inguarddist
trigger11 = time < 9
trigger12 = stateno = 1100 || stateno = 1150 || stateno = 1600 || stateno = 1610 || stateno = 1620 || stateno = 1650 || stateno = 1660 || stateno = 1670
trigger12 = time < 10
trigger12 = inguarddist 
trigger13 = stateno = 1500 || stateno = 1550 
trigger13 = time < 12
trigger13 = inguarddist 
trigger14 = stateno = 1700 || stateno = 1750 
trigger14 = time < 20
trigger14 = inguarddist 
trigger15 = stateno = [20,24]
trigger15 = inguarddist
value = 120

[State -1, When To Ground Recover Roll Forwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = stateno = 5110 || stateno = 5150  
triggerall = alive          
triggerall = stateno != [710,712]   
;triggerall = var(56) != 1    
trigger1 = backedgedist <= 40   
trigger1 = p2dist X = [-10,100] 
;trigger2 = p2dist X > 200                      
value = 710 

[State -1, When To Ground Recover Roll Backwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = stateno = 5110 || stateno = 5150  
triggerall = alive 
triggerall = stateno != [710,712]      
trigger1 = backedgedist != [-999,50]                
trigger1 = p2dist x = [0,68]
trigger1 = random <= 125      
;trigger2 = var(56) = 1                 
value = 711 

[State -1, When To Ground Recover Roll At The Same Point]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = stateno = 5110 || stateno = 5150          
;triggerall = backedgedist >= 30 
triggerall = alive    
triggerall = stateno != [710,712]   
;triggerall = var(56) != 1               
trigger1 = p2dist x = [71,999]
trigger1 = random <= 150             
trigger2 = p2dist x < -30 
trigger2 = random <= 150      
value = 712

[State -1, When to Dash Yourself Out of Annoying Guard Locks]
type = Changestate
triggerall = statetype = S || statetype = C
triggerall = var(59) = 1 && roundstate = 2
;triggerall = p2dist x > 160 || p2dist x < 0
trigger1 = stateno = 120 || stateno = 130 || stateno = 131 || stateno = 140
trigger1 = var(16) > 120
trigger1 = Random <= 999
value = 800 + (4 * (p2dist x < 0))

[State -1, When to Occult - Mysterious Meteorite]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
;triggerall = (statetype != A) 
triggerall = numexplod(22020) = 0 
triggerall = enemy,statetype != L    
;triggerall = enemynear,movetype != A  
triggerall = var(40) > 199    
triggerall = p2dist x = [0,150] 
triggerall = enemynear,stateno != [40,49]  
trigger1 = p2dist y > -50
trigger1 = numhelper(1705) = 0
trigger1 = numhelper(1003) = 0
trigger1 = stateno = 1400
trigger1 = movehit < 3
trigger1 = hitcount = 8
trigger1 = time > 20
trigger1 = var(21) = 0
trigger2 = stateno = 1200 && animelemtime(13) > 0 
trigger2 = moveguarded > 2 && enemy,stateno = [120,159]
trigger3 = stateno = 1400 
trigger3 = moveguarded > 2 && enemy,stateno = [120,159]
trigger4 = stateno = [1300,1360] 
trigger4 = moveguarded > 2 && enemy,stateno = [120,159]
trigger4 = animelemtime(16) > 0
trigger5 = stateno = 1310
trigger5 = movecontact < 4
trigger5 = animelemtime(16) > 0
trigger5 = enemy,stateno != [10000,10053] 
trigger5 = var(21) = 0 || enemy,life <= (90 * fvar(2))
trigger5 = p2dist y < -25
trigger6 = stateno = 120 || stateno = 130 || stateno = 131 || stateno = 140
trigger6 = var(16) > 120
trigger6 = Random <= 999
trigger7 = stateno = 1200
trigger7 = movehit < 4
trigger7 = hitcount > 4
trigger7 = var(21) = 0
trigger7 = p2dist y < -30 || enemy,vel y < -4 
trigger7 = numhelper(1705) = 0
trigger7 = numhelper(1003) = 0
trigger8 = stateno = 220
trigger8 = moveguarded > 2 && enemy,stateno = [120,159]
trigger9 = stateno = 215
trigger9 = moveguarded > 2 && enemy,stateno = [120,159]
trigger10 = numhelper(1003) > 0
trigger10 = enemy,stateno = [120,159]
trigger10 = ctrl || stateno = 1000 && time > 12
trigger10 = p2dist x < 100
trigger11 = numhelper(1601) > 0 || numhelper(1611) > 0 || numhelper(1621) > 0 || numhelper(1651) > 0 || numhelper(1661) > 0 || numhelper(1671) > 0 || numhelper(1611) > 0
trigger11 = enemy,stateno = [120,159]
trigger11 = ctrl || stateno = 1600 && time > 12
trigger11 = p2dist x < 100
value = 2000

[State -1, When To Star Blink]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)         
;triggerall = enemy,vel y = [-2,2]
;triggerall = !inguarddist || numhelper(3004) = 1   
triggerall = p2statetype != L    
triggerall = stateno != [120,159]  
triggerall = prevstateno != 200
triggerall = enemynear,stateno != [40,49]  
triggerall = p2dist x = [0,65 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+4),(fvar(5)) * 4),((fvar(5)) * 4))]   
triggerall = cond(enemy,statetype = A, ((-((enemy,vel x)) * 4 + p2dist x) >= 0),1) 
triggerall = p2dist y = [-68 - (((enemy,vel y)+ (fvar(4)* 4)) * 4),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 4)) * 4) + p2dist y) <= -5),1)    
trigger1 = random <= 200  
trigger1 = Ctrl         
;trigger1 = var(56) != 1 
trigger1 = p2statetype != C  
;trigger1 = p2dist x = [0,65]  
trigger1 = fvar(5) = [-3,3] 
trigger2 = stateno = [800,804]
trigger2 = animelemtime(11) >= 2 && animelemtime(12) <= 4
trigger2 = enemynear,movetype != A
trigger2 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger2 = p2statetype != C         
trigger3 = random <= 999       
trigger3 = enemy,movetype = H && enemy,stateno != [10000,10049]
trigger3 = enemy,statetype = A
trigger3 = ctrl 
trigger3 = frontedgedist < 125
;trigger3 = enemy,vel y > -1
trigger4 = random <= 999
trigger4 = ctrl 
trigger4 = enemy,stateno = [10050,10053]
;trigger4 = p2dist x < 0
trigger4 = (statetype != A)
value = 200 

[State -1, When To Crouch Star Blink]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L 
;triggerall = p2statetype != A                       
;triggerall = !inguarddist || numhelper(3004) = 1   
triggerall = enemynear,stateno != [40,49]  
triggerall = prevstateno != 400
triggerall = p2dist x = [0,72 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+7),(fvar(5)) * 7),((fvar(5)) * 7))]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 7 + p2dist x) >= 0),1)
triggerall = p2dist y = [-25 - (((enemy,vel y)+ (fvar(4)* 7)) * 7),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 7)) * 7) + p2dist y) <= 0),1)    
trigger1 = enemy,stateno != [10050,10053]       
;triggerall = enemy,stateno != [5000,5199]                         
trigger1 = random <= 150 + (350 * (enemy,stateno = 130 || enemy,stateno = [150,151]))
trigger1 = Ctrl     
trigger1 = (statetype != A)  
;trigger1 = var(56) != 1  
;trigger1 = p2dist x = [0,72] 
trigger1 = fvar(5) = [-2,2]  
trigger1 = enemy,statetype != A
trigger2 = enemy,stateno = 130 || enemy,stateno = [150,151]
trigger2 = moveguarded
trigger2 = stateno = 200 || stateno = 600 && pos y >= 0
trigger2 = Random <= 1000*ifelse((random <= 700),1,0)    
;trigger3 = stateno = 2000 && anim = 2001 && animelemtime(12) >= 0
;trigger3 = enemy,movetype = H
;trigger3 = Random <= 1000*ifelse((random <= 100),1,0) 
;trigger3 = p2dist X = [-72,72]
trigger3 = prevstateno = 1400   
trigger3 = enemy,movetype = H
trigger3 = ctrl    
trigger3 = Random <= 1000*ifelse((random <= 800),1,0) 
trigger4 = stateno = [800,804]
trigger4 = animelemtime(11) >= 2 && animelemtime(12) <= 4
trigger4 = enemynear,movetype != A
trigger4 = Random <= 1000*ifelse((random <= 500),1,0)  
trigger4 = fvar(5) = [-2,2] 
;trigger3 = frontedgedist > 85
value = 400 

[State -1, When To Dashing Broom Spin]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)   
triggerall = p2statetype != L 
triggerall = stateno = 100   
triggerall = enemy,stateno != [120,155]     
triggerall = !inguarddist || numhelper(3004) = 1                   
;triggerall = (enemynear,movetype != A) * (palno != [11,12]) || numhelper(3004) = 1
;triggerall = p2dist y = [-100 - (enemy,statetype = A)*25,0]     
triggerall = enemynear,stateno != [40,49]                  
triggerall = p2dist x = [0,160 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+8),(fvar(5)) * 8),((fvar(5)) * 8))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 0),1)
triggerall = p2dist y = [-44 - (((enemy,vel y)+ (fvar(4)* 8)) * 8),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + p2dist y) <= -1),1)                  
trigger1 = random <= 500 
trigger1 = ctrl   
trigger1 = enemy,statetype != A     
trigger2 = enemy,stateno = [10050,10051]
trigger2 = enemy,movetype = H
trigger2 = random < 999
trigger2 = ctrl 
trigger3 = enemy,movetype = H
trigger3 = enemy,statetype = A
trigger3 = enemy,stateno = [5020,5035] 
trigger3 = ctrl
trigger3 = random <= 900 
trigger4 = enemy,stateno = [10000,10049]
trigger4 = enemy,movetype = H
trigger4 = random < 999
trigger4 = ctrl     
;trigger4 = enemy,vel y >= 0 
value = 215

[State -1, When To Broom Spin]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L     
triggerall = enemynear,stateno != [5200,5210]       
triggerall = enemynear,stateno != [40,49]   
triggerall = !inguarddist || numhelper(3004) = 1   
triggerall = prevstateno != 210   
triggerall = p2dist x = [-45,115 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+8),(fvar(5)) * 8),((fvar(5)) * 8))]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 0),1)
triggerall = p2dist y = [-48 - (((enemy,vel y)+ (fvar(4)* 8)) * 8),15]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + p2dist y) <= 0),1)                  
trigger1 = random <= 100 
trigger1 = ctrl
trigger1 = p2statetype != A  
trigger1 = (statetype != A) 
;trigger1 = p2dist x = [0,115] 
trigger1 = fvar(5) = [-3,3]  
trigger2 = stateno = 400 && movecontact && enemy,vel y <= 0 
trigger3 = stateno = 200 && movecontact 
trigger4 = stateno = 600 && movecontact && Pos Y >= 0  
;trigger3 = enemy,statetype != A
trigger5 = random <= 999
trigger5 = ctrl 
trigger5 = p2statetype = A 
trigger5 = p2movetype = H
trigger5 = (statetype != A)          
trigger6 = random <= 999  
trigger6 = Ctrl         
trigger6 = enemy,movetype = H 
;trigger6 = frontedgedist < 145
;trigger6 = enemy,vel y > -1
trigger6 = (statetype != A) 
trigger7 = stateno = 2000 && anim = 2001 && animelemtime(12) >= 0
trigger7 = enemy,movetype = H
trigger7 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger8 = prevstateno = 1400 
trigger8 = var(26) = 1  
trigger8 = enemy,movetype = H
trigger8 = ctrl    
trigger9 = stateno = 3110 && animelemtime(35) >= 0
trigger9 = enemy,movetype = H
trigger9 = Random <= 1000*ifelse((random <= 900),1,0) 
trigger9 = frontedgedist < 115
value = 210 

[State -1, When To Broom Overhead]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L                  
triggerall = (enemynear,movetype != A) * (palno != [11,12] ) || numhelper(3004) = 1
triggerall = stateno != [100,101]   
triggerall = p2dist x = [25,165 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+9),(fvar(5)) * 9),((fvar(5)) * 9))]  
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 9 + p2dist x) >= 0),1) 
triggerall = p2dist y = [-120 - (((enemy,vel y)+ (fvar(4)* 9)) * 9),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 9)) * 9) + p2dist y) <= -1),1)                                   
trigger1 = Random <= 25 + 375 * (enemy,stateno = 131 || enemy,stateno = [152,153])   
trigger1 = Ctrl         
trigger1 = (statetype != A)  
trigger1 = enemy,movetype != H
trigger1 = p2dist X = [100,165]  
trigger2 = stateno = 210 || stateno = 610 && Pos Y >= 0  
trigger2 = movecontact && enemy,statetype != A
trigger2 = Random <= 1000*ifelse((random <= 600),1,0)    
trigger3 = stateno = 210 || stateno = 610 && Pos Y >= 0    
trigger3 = moveguarded
trigger3 = enemy,stateno = 131 || enemy,stateno = [152,153]
trigger3 = Random <= 1000*ifelse((random <= 700),1,0) 
trigger4 = numhelper(3210) = 1  
trigger4 = enemy,movetype = H
trigger4 = ctrl 
trigger4 = stateno = 0
value = 220

[State -1, When To Dashing Rotating Star]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype = S)   
triggerall = p2statetype != L 
triggerall = p2statetype != A || enemy,stateno = [10000,10049]
triggerall = stateno = 100   
triggerall = enemy,stateno != [120,155]                       
triggerall = p2dist X = [200,300]
triggerall = enemynear,stateno != [40,49]  
;triggerall = p2dist y = [-115,15-(35*enemy,statetype = A)]  
trigger1 = (enemynear,movetype = A) * (palno != [11,12] )                                           
trigger1 = random <= 75
trigger1 = ctrl     
trigger1 = fvar(5) = [-2,2] 
;trigger2 = enemynear,movetype != A                                          
;trigger2 = random <= 75
;trigger2 = ctrl    
;trigger2 = enemy,backedgedist < 10             
value = 225

[State -1, When To Broom Uppersweep]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L                       
;triggerall = !inguarddist     
triggerall = (enemynear,movetype != A) * (palno != [11,12] ) || numhelper(3004) = 1          
triggerall = stateno != [100,101]    
triggerall = prevstateno != 660  
triggerall = p2dist x = [0,88 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+10),(fvar(5)) * 10),((fvar(5)) * 10))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 10 + p2dist x) >= 0),1)
triggerall = p2dist y = [-145 - (((enemy,vel y)+ (fvar(4)* 10)) * 10),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 10)) * 10) + p2dist y) <= 0),1)                              
trigger1 = random <= 20
trigger1 = ctrl    
trigger1 = (statetype != A) 
;trigger1 = enemy,vel y >= -1 
trigger2 = stateno = 220 || stateno = 620 && Pos Y >= 0   
trigger2 = movecontact && enemy,movetype = H
trigger2 = Random <= 1000*ifelse((random <= 200),1,0)  
trigger2 = enemy,statetype != A   
trigger3 = stateno = 210 || stateno = 610 && Pos Y >= 0   
trigger3 = movecontact && enemy,movetype = H
trigger3 = Random <= 1000*ifelse((random <= 150 + ((enemy,statetype = A) *(enemy,backedgedist < 10)) * (frontedgedist < 70) *850),1,0) 
trigger4 = stateno = 2000 && anim = 2001 && animelemtime(12) >= 0 && animelemtime(12) <= 3
trigger4 = enemy,movetype = H
trigger4 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger5 = stateno = 210 || stateno = 610 && Pos Y >= 0  
trigger5 = prevstateno = 400
trigger5 = movecontact && enemy,movetype = H
trigger5 = Random <= 1000*ifelse((random <= 999),1,0) 
value = 230

[State -1, When To Tackle Attack]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L            
triggerall = enemynear,stateno != [40,49]   
triggerall = p2dist x = [0,120 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+8)* ((p2bodydist x) / 5.2),(fvar(5)) * 8)* ((p2bodydist x) / 5.2),((fvar(5)) * 8) * ((p2bodydist x) / 5.2))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 0),1)
triggerall = p2dist y = [-45  - (enemy,vel y + (fvar(4)* 8)) * 8 + ((enemy,vel y + (fvar(4)*((p2bodydist x) / 5.2)))*((p2bodydist x) / 5.2)),1]; - cond(enemy,statetype = A, ((((enemy,vel y)+ (fvar(4)* 7)) * 7 + (enemy,vel y + (fvar(4)*((p2bodydist x) / 8)))*((p2bodydist x) / 8))),1)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + p2dist y) <= -5),1)                                                                                            
;trigger1 = enemynear,vel y = [-4,4]         
trigger1 = stateno != [100,101]                   
trigger1 = Random <= 50
trigger1 = Ctrl         
;trigger1 = var(56) = 1
trigger1 = (statetype != A)  
trigger1 = (enemynear,movetype != A) * (palno != [11,12] )  
trigger2 = prevstateno = 1400   
trigger2 = enemy,movetype = H
trigger2 = ctrl    
trigger2 = Random <= 1000*ifelse((random <= 800),1,0) 
;trigger2 = enemy,vel y > 0 
trigger2 = (enemynear,movetype != A) * (palno != [11,12] )  
;trigger2 = frontedgedist > 85 
value = 240

[State -1, When To Tackle Attack - Combo Version]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L              
;triggerall = enemynear,vel y = [-4,4]         
triggerall = (enemynear,movetype != A) * (palno != [11,12] )   
triggerall = p2dist x = [0,120 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+8)* ((p2bodydist x) / 5.2),(fvar(5)) * 8)* ((p2bodydist x) / 5.2),((fvar(5)) * 8)  * ((p2bodydist x) / 5.2))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 0),1)
triggerall = p2dist y = [-45  - (enemy,vel y + (fvar(4)* 8)) * 8 + ((enemy,vel y + (fvar(4)*((p2bodydist x) / 5.2)))*((p2bodydist x) / 5.2)),1]; - cond(enemy,statetype = A, ((((enemy,vel y)+ (fvar(4)* 7)) * 7 + (enemy,vel y + (fvar(4)*((p2bodydist x) / 8)))*((p2bodydist x) / 8))),1)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + p2dist y) <= -5),1)                                                                                            
trigger1 = stateno = 220 || stateno = 620 && Pos Y >= 0   
trigger1 = movecontact && p2dist x > 70
trigger1 = Random <= 1000*ifelse((random <= 800),1,0)  
trigger1 = enemy,statetype != A
trigger2 = stateno = 210 || stateno = 610 && Pos Y >= 0   
trigger2 = movecontact; && p2dist x > 70
trigger2 = enemy,statetype = A
;trigger2 = enemy,vel y <= 0 
value = 241

[State -1, When To Homerun Sweep]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L            
;triggerall = enemynear,vel y = [-4,4]        
triggerall = (enemynear,movetype != A) * (palno != [11,12] )     
triggerall = p2dist x = [0,158 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+19),(fvar(5)) * 19),(fvar(5)) * 19 )] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 19 + p2dist x) >= 0),1)
triggerall = p2dist y = [-70 - (((enemy,vel y)+ (fvar(4)* 19)) * 19),0]; - cond(enemy,statetype = A, ((enemy,vel y)+ (fvar(4)* 5)) * 5,0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 19)) * 19) + p2dist y) <= -10),1)                                           
trigger1 = stateno = 220 || stateno = 620 && Pos Y >= 0   
trigger1 = movehit
trigger1 = Random <= 1000*ifelse((random <= 999),1,0)  
trigger1 = enemy,statetype != A
;trigger1 = p2dist x < 73
;trigger2 = Random <= 25
;trigger2 = Ctrl         
;trigger2 = var(56) != 1
;trigger2 = (statetype != A)  
;trigger2 = enemy,movetype != H
value = 250

[State -1, When To Aerial Star Blink]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype = A) && Pos Y <= -1     
triggerall = p2statetype != L 
triggerall = enemynear,stateno != [5200,5210]   
;triggerall = p2statetype != A                        
;triggerall = !inguarddist  
triggerall = p2dist x = [0,66 + (vel x * 4) + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+4),((fvar(5)) * 4)),(fvar(5)) * 4 )]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 4 + (vel x * 4) + p2dist x) >= 10),1)
triggerall = p2dist y = [-48 + ((vel y)+ (fvar(6)* 4))*4  - ((enemy,vel y + (fvar(4)* 4)) * 4),0 + ((vel y)+ (fvar(6)* 4))*4 - cond(enemy,statetype = A,(((((enemy,vel y)+ (fvar(4)* 4)) * 4))),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 4)) * 4) + enemy,pos y) <= 0),1)
;triggerall = cond(((((vel y + (fvar(6)* 7)) * 7) + pos y) <= 0),1,0)                            
trigger1 = random <= 600
trigger1 = ctrl 
;trigger1 = vel x > -2
trigger1 = enemy,movetype != H                  
value = 600 

[State -1, When To Aerial Broom Spin]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype = A) && Pos Y <= -1   
triggerall = p2statetype != L                
triggerall = p2dist x = [0,100 + (vel x * 8) + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+8),((fvar(5)) * 8)),(fvar(5)) * 8 )]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + (vel x * 8) + p2dist x) >= 0),1) 
triggerall = p2dist y = [-50 + ((vel y)+ (fvar(6)* 8))*8  - ((enemy,vel y + (fvar(4)* 8)) * 8),42 + ((vel y)+ (fvar(6)* 8))*8 - cond(enemy,statetype = A,(((((enemy,vel y)+ (fvar(4)* 8)) * 8))),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + enemy,pos y) <= 0),1)
;triggerall = !inguarddist  
triggerall = (enemynear,movetype != A) * (palno != [11,12])                                      
trigger1 = random <= 100 +((enemy,movetype = H) * 600)   
trigger1 = ctrl  
trigger1 = (statetype = A)     
trigger2 = stateno = 600 && movecontact   
;trigger2 = vel x >= 0 
value = 610 

[State -1, When To Broom Overhead]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L                
triggerall = (enemynear,movetype != A) * (palno != [11,12] ) 
triggerall = (statetype = A) && Pos Y <= -1    
triggerall = p2dist x = [0,140 + (vel x * 9) + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+9),((fvar(5)) * 9)),(fvar(5)) * 9 )]  
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 9 + (vel x * 9) + p2dist x) >= 0),1)
triggerall = p2dist y = [-105 + ((vel y)+ (fvar(6)* 9))*9  - ((enemy,vel y + (fvar(4)* 9)) * 9),15 + ((vel y)+ (fvar(6)* 9))*9 - cond(enemy,statetype = A,(((((enemy,vel y)+ (fvar(4)* 9)) * 9))),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 9)) * 9) + enemy,pos y) <= 0),1)          
trigger1 = Random <= 50 + 375 * (enemy,stateno = 131 || enemy,stateno = [152,153])   
trigger1 = Ctrl        
trigger1 = enemy,statetype != A 
trigger2 = stateno = 610  
trigger2 = movecontact && enemy,statetype != A
trigger2 = Random <= 1000*ifelse((random <= 300),1,0)  
trigger2 = p2dist y > -25  
;trigger2 = vel x >= 0 
value = 620

[State -1, When To Aerial Broom Uppersweep]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L                       
;triggerall = !inguarddist     
triggerall = (enemynear,movetype != A) * (palno != [11,12] )   
triggerall = p2dist x = [-15,75 + (vel x * 10) + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+10),((fvar(5)) * 10)),(fvar(5)) * 10 )]  
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 10 + (vel x * 10) + p2dist x) >= 0),1)
triggerall = p2dist y = [-130 + ((vel y)+ (fvar(6)* 10))*10  - ((enemy,vel y + (fvar(4)* 10)) * 10),90 + ((vel y)+ (fvar(6)* 10)) *10 - cond(enemy,statetype = A,(((((enemy,vel y)+ (fvar(4)* 10)) * 10))),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 10)) * 10) + enemy,pos y) <= 0),1)                                           
trigger1 = random <= 100 + (150 * (enemy,statetype = A))
trigger1 = ctrl    
;trigger1 = p2dist X = [-15+(vel x * 6)-(fvar(5) * 3),85+(vel x * 6)-(fvar(5) * 3)]
;trigger1 = enemy,statetype = A
trigger1 = (statetype = A)    
trigger2 = stateno = 610 && Pos Y <= -1   
trigger2 = movecontact ;&& p2dist x < 95 && p2dist y < -15
trigger2 = Random <= 1000*ifelse((random <= 500),1,0) 
;trigger2 = vel x >= 0 
trigger3 = stateno = 600 && Pos Y <= -1   
trigger3 = movecontact ;&& p2dist x < 95
trigger3 = Random <= 1000*ifelse((random <= 500),1,0) 
;trigger3 = vel x >= 0 
value = 630

[State -1, When To Aerial Tackle Attack]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L                   
triggerall = (enemynear,movetype != A) * (palno != [11,12] ) 
triggerall = stateno != [100,101]                    
triggerall = p2dist x = [0,75]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 *((p2bodydist x) / 21) + p2dist x) >= 0),1)
triggerall = p2dist y = [-35  - ((enemy,vel y + (fvar(4)* 8)) * 8),0 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 8)) * 8)),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + enemy,pos y) <= 0),1)
trigger1 = Random <= 50
trigger1 = Ctrl      
;trigger1 = var(56) = 1
trigger1 = (statetype = A)  
trigger1 = enemynear,vel x = [-1,1] 
value = 640

[State -1, When To Aerial Tackle Attack - Combo Version]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L            
;triggerall = enemynear,vel y = [-4,4]         
triggerall = (enemynear,movetype != A) * (palno != [11,12] )      
triggerall = p2dist x = [0,95  +  cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+8) *((p2bodydist x) / 21),((fvar(5)) * 8)) *((p2bodydist x) / 21),(fvar(5)) * 8 * ((p2bodydist x) / 21))]     
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 *((p2bodydist x) / 21) + p2dist x) >= 0),1)
triggerall = p2dist y = [-35 - ((enemy,vel y + (fvar(4)* 8)) * 8),0 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 8)) * 8)),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 8)) * 8) + enemy,pos y) <= 0),1)             
trigger1 = stateno = 600 && Pos Y <= -1 || stateno = 610 && Pos Y <= -1   
trigger1 = movecontact; && p2dist x > 100
trigger1 = Random <= 1000*ifelse((random <= 400),1,0)  
value = 641

[State -1, When To Aerial Homerun Sweep]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = p2statetype != L            
;triggerall = enemynear,vel y = [-4,4]         
triggerall = (enemynear,movetype != A) * (palno != [11,12] )      
triggerall = p2dist x = [0,105 + (vel x * 19) + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+19),((fvar(5)) * 19)),(fvar(5)) * 19)]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 19 + (vel x * 19) + p2dist x) >= 0),1) 
triggerall = p2dist y = [-68 + ((vel y)+ (fvar(6)* 19))*19  - ((enemy,vel y + (fvar(4)* 19)) * 19),0 + ((vel y)+ (fvar(6)* 19))*19 - cond(enemy,statetype = A,(((((enemy,vel y)+ (fvar(4)* 19)) * 19))),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 19)) * 19) + enemy,pos y) <= 0),1)                                           
trigger1 = stateno = 600 && Pos Y <= -1 || stateno = 610 && Pos Y <= -1   
trigger1 = movecontact 
trigger1 = Random <= 1000*ifelse((random <= 600),1,0)  
;trigger1 = vel x >= 0 
;trigger2 = Random <= 25
;trigger2 = Ctrl         
;trigger2 = var(1) = 0  
;trigger2 = var(56) != 1
;trigger2 = (statetype = A)  
value = 650

[State -1, When To Comet Trail]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2  
triggerall = p2statetype != L    
triggerall = (enemynear,movetype != A) * (palno != [11,12] )                   
;triggerall = p2dist X = [-5,85]
triggerall = numhelper(3210) = 0  
triggerall = p2dist x = [0,85  + cond(enemy,movetype != H, cond(enemy,statetype != A,fvar(19+9) *((p2bodydist x) / 8),((fvar(5)) * 9)) *((p2bodydist x) / 8),(fvar(5)) * 9)]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 9 *((p2bodydist x) / 8) + p2dist x) >= 0),1)
triggerall = p2dist y = [-25  - (enemy,vel y + (fvar(4)* 9)) * 9 + (enemy,vel y + (fvar(4)*((p2dist y) / 3.5)))*((p2dist y) / 3.5),50]; - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 5)) * 5 + (enemy,vel y + (fvar(4)*((p2dist y) / 14)))*((p2dist y) / 14))),1)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 9)) * 9) + enemy,pos y) <= 999),1)
;trigger1 = p2dist y = [10-(35*(enemy,movetype = H))+((enemynear,vel y) * 5),75-(35*enemy,statetype = A)+((enemynear,vel y) * 5)+(35*(enemy,movetype = H))]                              
trigger1 = Random <= 50; + ((var(56) = 1) * 100)
trigger1 = Ctrl         
trigger1 = (statetype = A)   
trigger1 = cond(enemy,statetype = A, enemy,movetype = H, 0) 
trigger2 = stateno = 610 && Pos Y <= -1 
trigger2 = movecontact && enemy,movetype = H ;&& p2dist x < 75
value = 660 

[State -1, When To Sweep Aside - Ground Forwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
triggerall = numhelper(3210) = 0
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L  
;triggerall = stateno != [100,101]      
;triggerall = enemynear,movetype != A   
triggerall = var(40) > 199       
;triggerall = stateno != [100,101] 
triggerall = enemynear,stateno != [40,49]   
triggerall = prevstateno != 1300      
triggerall = prevstateno != 1400     
triggerall = p2dist x = [0,250 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+16) * ((((p2bodydist x > 150) *(p2bodydist x))-150) / 7),((fvar(5)) * 16)) *((((p2bodydist x > 150) *(p2bodydist x))-150) / 7),(fvar(5)) * 16 * ((((p2bodydist x > 150) *(p2bodydist x))-150) / 7))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 16 + p2dist x) >= 0),1)
triggerall = p2dist y = [-135  - (enemy,vel y + (fvar(4)* 16)) * 16 + ((enemy,vel y + (fvar(4)*((p2bodydist x) / 7)))*((p2bodydist x) / 7)),1]; - cond(enemy,statetype = A, ((((enemy,vel y)+ (fvar(4)* 7)) * 7 + (enemy,vel y + (fvar(4)*((p2bodydist x) / 8)))*((p2bodydist x) / 8))),1)]
triggerall = cond((enemy,statetype = A), (((((enemy,vel y)+ (fvar(4)* 16)) * 16) + p2dist y) <= -35),1)                                                                                                        
trigger1 = random <= 25 ;+ ((var(56) = 1) * 75) 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger1 = (enemynear,movetype = H)  
;trigger1 = enemy,statetype != A
;trigger1 = p2dist y = [-135-(enemy,vel y * 4)- ((p2dist x) * 0.4),0-(((enemy,statetype = A) * -20 - ((p2dist x) * 0.4)))]          
;trigger1 = p2dist x = [100,250]      
trigger1 = var(20) = 0                               
trigger2 = stateno = 1000 && time > 15 && pos y >= 0 || stateno = 1050 && time > 15 && pos y >= 0
trigger2 = enemy,movetype = H
trigger2 = Random <= 1000*ifelse((random <= 300 - (var(20) * 250)),1,0) 
;trigger2 = p2dist y = [-135-(enemy,vel y * 5),0-(((enemy,statetype = A) * -50))-(enemy,vel y * 5)] 
;trigger2 = p2dist x = [0,250]   
trigger3 = stateno = 1100 && time > 12 && pos y >= 0 || stateno = 1150 && time > 12 && pos y >= 0
trigger3 = enemy,movetype = H 
trigger3 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y < -60
trigger3 = Random <= 1000*ifelse((random <= 1200 - ((frontedgedist < 100)*250)),1,0) 
trigger3 = var(20) = 0  
;trigger3 = p2dist y = [-135-(enemy,vel y * 5),0-(((enemy,statetype = A) * -50))-(enemy,vel y * 5)] 
;trigger3 = p2dist x = [0,250]   
trigger4 = prevstateno = 1500
trigger4 = enemy,movetype = H
trigger4 = numhelper(1003) > 0 || numhelper(1004) > 0 || numhelper(1005) > 0 || numhelper(1006) > 0 || numhelper(1007) > 0
;trigger4 = p2dist y = [-135-(enemy,vel y * 5),0] 
value = 1300 

[State -1, When To Sweep Aside - Ground Up]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L  
;triggerall = stateno != [100,101]      
;triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = stateno != [100,101]   
triggerall = enemynear,stateno != [40,49]  
triggerall = prevstateno != 1300
triggerall = numhelper(3210) = 0
triggerall = p2dist x = [0,185 + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+16),(fvar(5)) * 16),((fvar(5)) * 16))] 
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 16 + p2dist x) >= 0),1)
triggerall = p2dist y = [-185  - (enemy,vel y + (fvar(4)* 16)) * 16,1]; - cond(enemy,statetype = A, ((((enemy,vel y)+ (fvar(4)* 7)) * 7 + (enemy,vel y + (fvar(4)*((p2bodydist x) / 8)))*((p2bodydist x) / 8))),1)]
triggerall = cond((enemy,statetype = A), (((((enemy,vel y)+ (fvar(4)* 16)) * 16) + p2dist y) <= -35),1)                                                                                                         
triggerall = prevstateno != 1400
triggerall = numhelper(1601) = 0 && numhelper(1611) = 0 && numhelper(1621) = 0
;triggerall = enemy,vel y < 3
trigger1 = p2dist x = [0,185]                            
trigger1 = random <= 75;250 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger1 = (enemynear,movetype = H)  
;trigger1 = p2dist y = [-185-(enemy,vel y * 4)- ((p2dist x) * 0.4),0-((((enemy,statetype = A) * -75) - ((p2dist x) * 0.4)))]  
trigger1 = var(20) = 0                                          
trigger2 = stateno = 1000 && time > 15 && pos y >= 0 || stateno = 1050 && time > 15 && pos y >= 0
trigger2 = enemy,movetype = H
trigger2 = Random <= 1000*ifelse((random <= 300 - (var(20) * 250)),1,0) 
trigger3 = stateno = 1100 && time > 12 && pos y >= 0 || stateno = 1150 && time > 12 && pos y >= 0
trigger3 = enemy,movetype = H 
trigger3 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y < -60
trigger3 = Random <= 1000*ifelse((random <= 300 - (var(20) * 250)),1,0) 
trigger3 = var(20) = 0  
trigger4 = stateno = 610 && Pos Y >= 0 || stateno = 210 ;&& frontedgedist > 95 && enemy,backedgedist < 10
trigger4 = movecontact
trigger4 = enemy,statetype = A
trigger4 = p2dist x > 75
trigger4 = Random <= 1000*ifelse((random <= 800),1,0)    
value = 1310 

[State -1, When To Sweep Aside - Air Forward]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L      
;triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = enemynear,stateno != [40,52]  
triggerall = numhelper(3210) = 0
triggerall = p2dist x = [0,250  + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+16) * ((((p2bodydist x > 150) *(p2bodydist x))-150) / 7),((fvar(5)) * 16)) *((((p2bodydist x > 150) *(p2bodydist x))-150) / 7),(fvar(5)) * 16 * ((((p2bodydist x > 150) *(p2bodydist x))-150) / 7))]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 16 *(((p2bodydist x)-150) / 7) + p2dist x) >= 0),1)
triggerall = p2dist y = [-125  - ((enemy,vel y + (fvar(4)* 16)) * 16),0]
triggerall = cond((enemy,statetype = A) , (((((enemy,vel y)+ (fvar(4)* 16)) * 16) + enemy,pos y) <= -35),1) 
;triggerall = enemy,pos y < -100
;trigger1 = p2dist x = [100,250]                            
trigger1 = random <= 25; + ((var(56) = 1) * 75) 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger1 = (enemynear,movetype = H)   
trigger1 = var(20) = 0                                       
trigger2 = stateno = 640 && Pos Y <= -1 || stateno = 641 && Pos Y <= -1
trigger2 = movecontact
trigger2 = Random <= 1000*ifelse((random <= 300),1,0) 
trigger3 = stateno = 650 && Pos Y <= -1
trigger3 = movecontact
trigger3 = Random <= 1000*ifelse((random <= 300),1,0) 
trigger4 = stateno = 630 && Pos Y <= -1 || stateno = 230 && Pos Y <= -1
trigger4 = movecontact
trigger4 = Random <= 1000*ifelse((random <= 300 - (var(20) * 250)),1,0) 
trigger4 = time > 18; = enemy,vel y >= 0
trigger5 = stateno = 1150 && time > 12 && pos y <= -1
trigger5 = enemy,movetype = H 
trigger5 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y > -60
trigger5 = Random <= 1000*ifelse((random <= 999),1,0) 
;trigger5 = var(20) = 0
value = 1350

[State -1, When To Sweep Aside - Air Down]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
triggerall = numhelper(3210) = 0
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L      
;triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = enemynear,stateno != [40,52]   
triggerall = p2dist x = [0,185  + cond(enemy,movetype = H, cond(enemy,statetype != A,fvar(19+16) *((p2bodydist x) / 4),((fvar(5)) * 16)) *((p2bodydist x) / 4),(fvar(5)) * 16 * ((p2bodydist x) / 4))]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 16 *((p2bodydist x) / 7) + p2dist x) >= 0),1)
triggerall = p2dist y = [-50  - ((enemy,vel y + (fvar(4)* 16)) * 16),125 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 16)) * 16)),0)]
triggerall = cond((enemy,statetype = A), (((((enemy,vel y)+ (fvar(4)* 16)) * 16) + enemy,pos y) <= -35),1) 
;trigger1 = p2dist x = [0,200]                           
trigger1 = random <= 25 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger1 = (enemynear,movetype = H)  
trigger1 = var(20) = 0                                           
trigger2 = stateno = 640 && Pos Y <= -1 || stateno = 641 && Pos Y <= -1
trigger2 = movecontact
trigger2 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger3 = stateno = 650 && Pos Y <= -1
trigger3 = movecontact
trigger3 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger4 = stateno = 1050 && time > 12 && pos y <= -1
trigger4 = enemy,movetype = H
trigger4 = Random <= 1000*ifelse((random <= 500 - (var(20) * 450)),1,0) 
trigger5 = stateno = 1150 && time > 12 && pos y <= -1
trigger5 = enemy,movetype = H 
trigger5 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y < -60
trigger5 = Random <= 1000*ifelse((random <= 300 - (var(20) * 250)),1,0) 
trigger5 = var(20) = 0
trigger6 = stateno = 630 && Pos Y <= -1  || stateno = 230 && Pos Y <= -1
trigger6 = movecontact
trigger6 = time > 18;enemy,vel y >= 0
trigger6 = Random <= 1000*ifelse((random <= 300 - (var(20) * 250)),1,0) 
value = 1360

[State -1, When To Rising Sweep]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
;triggerall = (statetype != A)  
triggerall = p2statetype != L       
triggerall = enemy,stateno != [120,155]                       
;triggerall = p2dist X = [-120,120]            
;triggerall = p2dist y = [-225,75]  
triggerall = enemy,stateno != [100,109]
triggerall = p2dist x = [-118,118  + cond(enemy,movetype != H, cond(enemy,statetype != A,fvar(19+13),((fvar(5)) * 13)),(fvar(5)) * 13)]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 + p2dist x) >= -118),1)
triggerall = p2dist y = [-225  - ((enemy,vel y + (fvar(4)* 13)) * 13),75 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 13)) * 13)),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 0),1) 
trigger1 = enemy,statetype = A
trigger1 = random <= 800
trigger1 = stateno = 225
trigger1 = enemy,backedgedist < 30
trigger1 = hitcount > 5
;trigger1 = enemy,stateno != [5050,5210]                          
;trigger1 = random <= 0; + (((enemy,statetype = A) * (enemy,movetype != H) * (p2dist X = [0,130])) * 225)
;trigger1 = Ctrl; || stateno = 120
;Trigger1 = fvar(5) = [-1,1]
;trigger1 = p2dist X = [0,130+(fvar(5) * 4)]   
trigger2 = stateno = 630 || stateno = 230
trigger2 = movecontact && enemy,movetype = H
trigger2 = Random <= 1000*ifelse((random <= 999),1,0) 
;trigger2 = p2dist X = [0,100]
trigger3 = enemy,moveguarded > 0
trigger3 = gethitvar(slidetime) = 0 
;trigger3 = !enemynear,ishelper   
;trigger3 = fvar(5) = [-1,9] 
trigger3 = random <= 300 + (600 * (enemy,life < 150))
trigger3 = stateno != 3000 || stateno != 3050 || stateno != 3100
trigger3 = fvar(5) = [-2,2] 
;trigger3 = p2dist y = [-225,0]   
;trigger3 = p2dist X = [5,120]  
;trigger4 = p2dist x = [-70,-30]
trigger4 = p2dist y = [-175,-75]
trigger4 = enemy,movetype = A
trigger4 = random <= 800
trigger4 = ctrl || stateno = 120 || stateno = 140
trigger4 = fvar(5) = [-3,3]
trigger5 = stateno = 200 && time > 0 || stateno = 600 && time > 0 
trigger5 = p2dist y < -125
trigger5 = enemy,movetype != H
trigger5 = !movecontact
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger5 = p2dist X = [5,120]  
trigger6 = stateno = 210 && time > 10 || stateno = 610 && time > 10 
trigger6 = p2dist y < -100
trigger6 = enemy,movetype != H
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger6 = p2dist X = [5,120]
trigger7 = stateno = 400 && time > 0 
trigger7 = p2dist y < -75
trigger7 = enemy,movetype != H
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger7 = p2dist X = [5,120]
trigger8 = stateno = 220 && time > 12 || stateno = 620 && time > 12 
trigger8 = p2dist y < -150
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = enemy,movetype != H
;trigger8 = p2dist X = [5,120]
trigger9 = stateno = 240 && time > 15 || stateno = 640 && time > 15  || stateno = 241 && time > 15 || stateno = 641 && time > 15 
trigger9 = p2dist y < -100
trigger9 = !movecontact
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = enemy,movetype != H
;trigger9 = p2dist X = [5,120]
trigger10 = stateno = 250 && time > 21 || stateno = 650 && time > 21  
trigger10 = p2dist y < -125
trigger10 = !movecontact
trigger10 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger10 = enemy,movetype != H
;trigger10 = p2dist X = [5,120]
trigger11 = stateno = 630 && time > 12 
;trigger11 = p2dist y < -160
trigger11 = !movecontact
trigger11 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger11 = enemy,movetype != H
;trigger11 = p2dist X = [5,120]
trigger12 = stateno = 1600 || stateno = 1610
trigger12 = time > 12
trigger12 = enemy,movetype = A
;trigger12 = p2dist X = [5,120]
trigger13 = stateno = 1100 && time > 12  || stateno = 1150 && time > 12 || prevstateno = 1100 && ctrl || prevstateno = 1150 && ctrl 
trigger13 = enemy,movetype = H 
trigger13 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y > (-57-(enemy,vel y * 4))
trigger13 = Random <= 1000*ifelse((random <= 50 + (var(20) * 250)),1,0) 
trigger13 = enemy,vel y > 0.1
trigger14 = p2dist x = [30,70]
trigger14 = p2dist y = [-175,-75]
trigger14 = enemy,movetype = A
trigger14 = random <= 800
trigger14 = ctrl || stateno = 120 || stateno = 140
trigger14 = fvar(5) = [-3,3]
trigger15 = stateno = 1100 && time > 12 && pos y >= 0 || stateno = 1150 && time > 12 || stateno = 1000 && time > 12 && pos y >= 0 || stateno = 1050 && time > 12 && pos y >= 0
trigger15 = enemy,movetype != H 
trigger15 = p2dist x < 0
trigger15 = p2movetype = A
trigger16 = stateno = 1100 && time > 12 || stateno = 1150 && time > 12
trigger16 = p2dist y < -125 || p2dist x = [-100,0]
;trigger16 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount = 0,1,0),0)
trigger16 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger16 = enemy,movetype != H || enemy,movetype = H && p2dist x = [-100,0]
trigger17 = stateno = 1000 && time > 12 || stateno = 1050 && time > 12
trigger17 = p2dist y < -125
;trigger6 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount = 0,1,0),0)
trigger17 = Random <= 1000*ifelse((random <= 400),1,0) 
trigger17 = enemy,movetype != H
trigger18 = enemy,movetype != H
trigger18 = random < 150
trigger18 = time > 12 && stateno = 1550 || time > 12  && stateno = 1550
trigger18 = enemy,movetype = A || p2dist x < -10 || p2dist y = [-999,-75]
;trigger15 = p2dist x = [-10,100]
;trigger15 = p2dist y = [-175,0]
value = 1400

[State -1, When To Witch Leyline]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2    
triggerall = statetype != A 
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L  
triggerall = enemy,stateno != [10000,10008]; && enemy,stateno != 10018      
;triggerall = enemynear,movetype != A   
triggerall = var(40) > 199        
triggerall = enemynear,stateno != [40,49]  
;triggerall = p2dist y = [-65-(enemy,vel y * 4),0-(((enemy,statetype = A) * -20))] 
triggerall = prevstateno != 1400
triggerall = enemy,stateno != [10040,10041]
triggerall = p2dist x = [0,400]  
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 *((p2bodydist x) / 15) + p2dist x) >= 0),1)
triggerall = p2dist y = [-42 - ((enemy,vel y + (fvar(4)* 13)) * 13) - (enemy,vel y + (fvar(4)*((p2bodydist x) / 15)))*((p2bodydist x) / 15),0]
triggerall = cond((enemy,statetype = A)* (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 0),1) 
;triggerall = cond((enemy,statetype = A && enemy,movetype = H), cond((((((enemy,vel y + fvar(4)* 13)) *13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 15)))*((p2bodydist x) / 15) + enemy,pos y) <= 0),1,0),1)   
;trigger1 = enemy,vel y >= 0 
;trigger1 = p2dist x = [100,300]                            
;trigger1 = random <= 25 + ((var(56) = 1) * 75) 
;trigger1 = ctrl && stateno != [100,101]
;trigger1 = (statetype != A) 
;trigger1 = (enemynear,movetype = H)  
;trigger1 = p2dist y = [-85-(enemy,vel y * 7)- ((p2dist x) * 0.3),0-(((enemy,statetype = A) * -40 - ((p2dist x) * 0.3)-(enemy,vel y * 7)))]                                          
trigger1 = stateno = 1000 && time > 12 && pos y >= 0 || stateno = 1050 && time > 12 && pos y >= 0
trigger1 = enemy,movetype = H
trigger1 = Random <= 1000*ifelse((random <= 50 + (var(20) * 450)),1,0) 
trigger1 = enemy,vel y > 0
;trigger1 = p2dist y = [-65-(enemy,vel y * 4),0-(((enemy,statetype = A) * -20))-(enemy,vel y * 4)] 
trigger2 = stateno = 1100 && time > 12  || stateno = 1150 && time > 12 && pos y >= 0 || prevstateno = 1100 && ctrl || prevstateno = 1150 && ctrl && pos y >= 0 
trigger2 = enemy,movetype = H 
trigger2 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 36 && var(25) = 1
trigger2 = Random <= 1000*ifelse((random <= 999),1,0) 
;trigger2 = p2dist y = [-35,0] 
;trigger2 = cond(var(25) = 1, enemy,vel y >= 2, 1)
;trigger2 = var(25) = 1  || enemy,backedgedist < 60 ; && enemy,vel y > 0 
;trigger3 = enemy,backedgedist < 50
;trigger3 = enemy,vel y >= 0 
;trigger3 = var(25) = 1   
trigger3 = p2dist x > 200
trigger3 = enemy,movetype = H 
trigger3 = ctrl    
trigger3 = Random <= 1000*ifelse((random <= 800),1,0) 
trigger3 = p2dist y < -25
;trigger3 = stateno  != 100
;trigger4 = p2dist x = [200,325]                            
;trigger4 = random <= 999 
;trigger4 = ctrl && stateno = [100,101]
;trigger4 = (statetype != A) 
;trigger4 = (enemynear,movetype = H) && enemy,stateno = [10000,10053] 
;trigger4 = enemy,backedgedist < 50
;trigger4 = p2dist y = [-52,0]     
;trigger4 = enemy,vel y > 0
;trigger3 = prevstateno != 1500
;trigger3 = stateno != [100,106]
;trigger3 = p2dist y = [-45 - ((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 15))),25 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 13)) * 13)) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 15)))*((p2bodydist x) / 15),0)] 
;trigger4 = random <= 50 + ((var(56) = 1) * 75) 
;trigger4 = ctrl 
;trigger4 = (statetype = A) 
;trigger4 = (enemynear,movetype = H)    
;trigger5 = enemy,backedgedist < 20                       
value = 1200 

[State -1, When To Aerial Witch Leyline]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L      
;triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = enemynear,stateno != [40,49]   
triggerall = p2dist x = [0,360]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 *((p2bodydist x) / 15) + p2dist x) >= 0),1)
triggerall = p2dist y = [-38 - ((enemy,vel y + (fvar(4)* 13)) * 13),20] ;[-25 - ((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 15))),25]; - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 13)) * 13)) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 15)))*((p2bodydist x) / 15),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 0),1) 
;triggerall = cond((enemy,statetype = A && enemy,movetype = H), cond((((((enemy,vel y + fvar(4)* 13)) *13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 15)))*((p2bodydist x) / 15) + enemy,pos y) <= 0),1,0),1)   
;triggerall = p2dist y = [-85-(enemy,vel y * 4),0-(((enemy,statetype = A) * -25 - ((p2dist x) * 0.2)))] 
;trigger1 = p2dist x = [150,300]                            
trigger1 = random <= 50; + ((var(56) = 1) * 75) 
trigger1 = ctrl 
trigger1 = (statetype = A) 
trigger1 = (enemynear,movetype = H)  
;trigger1 = p2dist y = [-85-(enemy,vel y * 4),0-(((enemy,statetype = A) * -20 - ((p2dist x) * 0.4)))]  
trigger1 = numhelper(3004) = 0  
trigger1 = cond(p2dist x < 150, enemy,vel y >= -1, 1)
trigger2 = stateno = 640 && Pos Y <= -1 || stateno = 641 && Pos Y <= -1
trigger2 = movecontact
trigger2 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger3 = stateno = 650 && Pos Y <= -1
trigger3 = movecontact
trigger3 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger4 = stateno = 1050 && time > 12 && pos y <= -1
trigger4 = enemy,movetype = H
trigger4 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger5 = stateno = 1150 && time > 12 && pos y <= -1
trigger5 = enemy,movetype = H 
trigger5 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y < -60
trigger5 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger5 = var(20) = 0
;trigger5 = cond(p2dist x < 200, enemy,vel y >= -1, 1)
trigger6 = stateno = 630 && Pos Y <= -1 || stateno = 230 && Pos Y <= -1 ;&& frontedgedist > 95 && enemy,backedgedist < 10
trigger6 = movecontact
trigger6 = Random <= 1000*ifelse((random <= 800),1,0) 
trigger6 = enemy,vel y >= 1
trigger7 = prevstateno = 1550 && numhelper(1003) = 0
;trigger7 = p2dist x > 300
trigger7 = enemy,movetype = H
trigger7 = ctrl    
trigger7 = Random <= 1000*ifelse((random <= 800),1,0)  
trigger8 = var(25) = 1   
trigger8 = p2dist x = [200,275]
trigger8 = enemy,movetype = H 
trigger8 = ctrl    
trigger8 = Random <= 1000*ifelse((random <= 800),1,0)  
trigger9 = stateno = 610 && Pos Y <= -1 || stateno = 210 && Pos Y <= -1 ;&& frontedgedist > 95 && enemy,backedgedist < 10
trigger9 = movecontact
trigger9 = Random <= 1000*ifelse((random <= 800),1,0)             
value = 1250

[State -1, When To Starshards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)      
;triggerall = p2stateno != [5080,5150]     
triggerall = enemy,stateno != [120,155]   
triggerall = enemynear,movetype != A         
triggerall = enemy,vel y = [-1,1]  
triggerall = var(40) > 599       
triggerall = enemy,stateno != [10000,10053]    
triggerall = p2dist x = [0,400]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 9 + p2dist x) >= 0),1)
triggerall = p2dist y = [-95  - ((enemy,vel y + (fvar(4)* 9)) * 9) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 4.8)))*((p2bodydist x) / 4.8),5]; - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 9)) * 9)) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 4.8)))*((p2bodydist x) / 4.8),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 9)) * 9) + enemy,pos y) <= -20),1)                                
trigger1 = random <= 50; + (100 * (var(56)) = 1)
trigger1 = ctrl  
trigger1 = p2dist x = [175,400] 
trigger1 = enemy,movetype != H   
trigger2 = p2statetype = L                               
trigger2 = random <= 50 
trigger2 = p2dist x >= 175
trigger2 = ctrl                  
value = 1000

[State -1, When To Aerial Starshards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype = A)      
;triggerall = p2stateno != [5080,5150]   
triggerall = enemy,statetype != L   
triggerall = enemy,stateno != [120,155]   
triggerall = enemynear,movetype != A          
;triggerall = enemy,vel y = [-3,3]  
triggerall = var(40) > 399       
triggerall = p2dist x = [0,400]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 9 + p2dist x) >= 0),1)
triggerall = p2dist y = [-95  - ((enemy,vel y + (fvar(4)* 9)) * 9) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 4.8)))*((p2bodydist x) / 4.8),5 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 9)) * 9)) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 4.8)))*((p2bodydist x) / 4.8),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 9)) * 9) + enemy,pos y) <= -20),1) 
;triggerall = p2dist y = [-95+(vel y * 3)-(enemy,vel y * 4),0+(vel y * 3)-(enemy,vel y * 4)]   
triggerall = enemy,stateno != [10000,10053]                                            
trigger1 = random <= 50; + (100 * (var(56)) = 1)
trigger1 = ctrl  
trigger1 = p2dist x = [175,400] 
trigger1 = enemy,movetype != H  
value = 1050 

[State -1, When To Stellarbeam]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L  
triggerall = stateno != [100,101]      
triggerall = enemynear,movetype != A   
triggerall = var(40) > 199        
triggerall = enemynear,stateno != [40,49]  
triggerall = prevstateno != 1100 || prevstateno != 1150
triggerall = p2dist x = [-600,600]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 11 *((p2bodydist x) / 66) + p2dist x) >= 0),1)
triggerall = p2dist y = [-25 - ((enemy,vel y + (fvar(4)* 11)) * 11) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 66)))*((p2bodydist x) / 66),25]; - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 11)) * 11)) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 66)))*((p2bodydist x) / 66),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 11)) * 11) + enemy,pos y) <= (0 + (enemy,stateno = 10052) * 999)),1) 
;triggerall = cond((enemy,statetype = A && enemy,movetype = H), cond((((((enemy,vel y + fvar(4)* 11)) *11) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 66)))*((p2bodydist x) / 66) + enemy,pos y) <= 0),1,0),1)   
;triggerall = enemy,stateno != [10040,10043]
triggerall = cond(enemy,stateno = 10044, enemy,vel y > 1.5, cond(enemy,stateno = 10045, enemy,vel y > 1.5, 1))
;trigger1 = p2dist y = [-70-(enemy,vel y * 5)-(((enemy,statetype = A) * -46 - ((p2dist x) * 0.3))),0-(((enemy,statetype = A) * -46 - ((p2dist x) * 0.3)))-(enemy,vel y * 5)]
trigger1 = p2dist x = [140,400]                            
trigger1 = random <= 25 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger1 = enemy,stateno != [120,155] 
trigger2 = stateno = 210 || stateno = 610 && Pos Y >= 0
trigger2 = movecontact
trigger2 = enemy,statetype = A
;trigger2 = enemy,vel y <= 0
trigger2 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger3 = stateno = 220 || stateno = 620 && Pos Y >= 0
trigger3 = movecontact
trigger3 = enemy,statetype != A
trigger3 = p2dist x > 100
trigger3 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger4 = stateno = 240 || stateno = 640 && Pos Y >= 0 || stateno = 241 || stateno = 641 && pos y >= 0
trigger4 = movecontact
trigger4 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger4 = p2dist y = [-40,25]
;trigger4 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger5 = stateno = 250 || stateno = 650 && Pos Y >= 0
trigger5 = movecontact
trigger5 = Random <= 1000*ifelse((random <= 999),1,0) 
;trigger5 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger6 = stateno = 200 && time > 0 || stateno = 600 && time > 0 && pos y >= 0
trigger6 = p2dist x > 66 || p2dist x < -25
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger6 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger7 = stateno = 210 && time > 10 || stateno = 610 && time > 10 && pos y >= 0
trigger7 = p2dist x > 115 || p2dist x < -35
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger7 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger8 = stateno = 400 && time > 0 
trigger8 = p2dist x > 72 || p2dist x < -25
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger8 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger9 = stateno = 220 && time > 12 || stateno = 620 && time > 12 && pos y >= 0
trigger9 = p2dist x > 145 || p2dist x < -35
trigger9 = !movecontact
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger9 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger10 = stateno = 240 && time > 15 || stateno = 640 && time > 15 && pos y >= 0 || stateno = 241 && time > 15 || stateno = 641 && time > 15 && pos y >= 0
trigger10 = p2dist x > 120 || p2dist x < -35 || stateno = 641 && p2dist x > 100 || stateno = 241 && p2dist x > 100
trigger10 = !movecontact
trigger10 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger10 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger11 = stateno = 250 && time > 21 || stateno = 650 && time > 21 && pos y >= 0 
trigger11 = p2dist x > 105 || p2dist x < -35
trigger11 = !movecontact
trigger11 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger11 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger12 = stateno = 630 && time > 12 && pos y >= 0 
trigger12 = p2dist x > 100 || p2dist x < -35
trigger12 = !movecontact
trigger12 = Random <= 1000*ifelse((random <= 200),1,0) 
;trigger12 = p2dist y = [-70-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger13 = stateno = 215 
trigger13 = hitcount = 2 || time > 23
trigger13 = movecontact
trigger13 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger13 = enemy,vel y >= 0
;trigger13 = p2dist y = [-60-(enemy,vel y * 4),0-(((enemy,statetype = A) * -46)-(enemy,vel y * 4))]
trigger14 = enemy,movetype = H || moveguarded
trigger14 = stateno = 660 && anim = 601 && animelemtime(6) >= 0 && movecontact ;&& anim = 601 && time >= 22
;trigger15 = p2dist y = [-70-(enemy,vel y * 5)-(((enemy,statetype = A) * -46 - ((p2dist x) * 0.2))),0-(((enemy,statetype = A) * -46 - ((p2dist x) * 0.2)))-(enemy,vel y * 5)]
trigger15 = p2dist x = [100,400]                            
trigger15 = random <= 700 
trigger15 = ctrl 
trigger15 = (statetype != A)
trigger15 = enemy,stateno = [10000,10049]   
;trigger15 = enemy,vel y >= 0                        
trigger16 = random <= 700 
trigger16 = ctrl 
trigger16 = (statetype != A)
trigger16 = prevstateno = 3100 && enemy,movetype = H
;trigger17 = p2dist X = [0,300]          
;trigger17 = random <= 999  
;trigger17 = Ctrl         
;trigger17 = enemy,movetype = H 
;trigger17 = enemy,statetype = A
;trigger17 = frontedgedist < 165
;trigger17 = p2dist y = [-102-(enemy,vel y * 12)-((enemy,statetype = A) * -50),-52-((enemy,statetype = A) * -50) -(enemy,vel y * 12)]
;trigger17 = enemy,vel y > -1
;trigger17 = (statetype != A) 
trigger17 = stateno = 3110 && animelemtime(35) >= 0
trigger17 = enemy,movetype = H
trigger17 = Random <= 1000*ifelse((random <= 999),1,0) 
trigger17 = p2dist X > 100
trigger18 = var(26) = 1  
;trigger18 = p2dist y < -10
;trigger18 = p2dist x > 108
trigger18 = enemy,movetype = H
trigger18 = ctrl  
trigger18 = (statetype != A)
trigger19 = stateno = 2000 && anim = 2001 && animelemtime(12) >= 0
trigger19 = enemy,movetype = H
trigger19 = Random <= 1000*ifelse((random <= 900),1,0) 
trigger19 = p2dist X > 108 || p2dist X < -108
value = 1100 

[State -1, When To Aerial Stellarbeam]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L      
triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = enemynear,stateno != [40,49]  
triggerall = p2dist x = [0,600]   
triggerall = prevstateno != 1150
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 11 *((p2bodydist x) / 66) + p2dist x) >= 0),1)
triggerall = p2dist y = [-60  - ((enemy,vel y + (fvar(4)* 11)) * 11) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 66)))*((p2bodydist x) / 66),15 - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 11)) * 11)) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 66)))*((p2bodydist x) / 66),0)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 11)) * 11) + enemy,pos y) <= -12),1) 
triggerall = cond((enemy,statetype = A && enemy,movetype = H), cond((((((enemy,vel y + fvar(4)* 11)) *11) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 66)))*((p2bodydist x) / 66) + enemy,pos y) <= 0),1,0),1)   
;triggerall = p2dist y = [-60+(vel y * 3)-(enemy,vel y * 4),-20+(vel y * 3)-(enemy,vel y * 4)] 
trigger1 = p2dist x > 75                            
trigger1 = random <= 25
trigger1 = ctrl 
trigger1 = (statetype = A) 
trigger2 = stateno = 610 && Pos Y <= -1
trigger2 = movecontact
trigger2 = enemy,statetype = A
trigger2 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger3 = stateno = 620 && Pos Y <= -1
trigger3 = movecontact
trigger3 = enemy,statetype != A
trigger3 = p2dist x > 100
trigger3 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger4 = stateno = 640 && Pos Y <= -1 || stateno = 641 && Pos Y <= -1
trigger4 = movecontact
trigger4 = Random <= 1000*ifelse((random <= 300),1,0) 
trigger5 = stateno = 650 && Pos Y <= -1
trigger5 = movecontact
trigger5 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger6 = stateno = 600 && time > 0 && Pos Y <= -1
trigger6 = p2dist x > 66 || p2dist x < -25
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger7 = stateno = 610 && time > 10 && Pos Y <= -1
trigger7 = p2dist x > 115 || p2dist x < -35
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = stateno = 620 && time > 12 && Pos Y <= -1
trigger8 = p2dist x > 145 || p2dist x < -35
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = stateno = 640 && time > 7 && Pos Y <= -1 || stateno = 641 && time > 7 && Pos Y <= -1
trigger9 = p2dist x > 125 || p2dist x < -35
trigger9 = !movecontact
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger10 = stateno = 650 && time > 21 && Pos Y <= -1
trigger10 = p2dist x > 105 || p2dist x < -35
trigger10 = !movecontact
trigger10 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger11 = stateno = 630 && time > 12 && Pos Y <= -1 || stateno = 230 && time > 12
trigger11 = p2dist x > 100 || p2dist x < -35
trigger11 = !movecontact
trigger11 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger12 = stateno = 600 && Pos Y <= -1
trigger12 = movecontact
trigger12 = enemy,statetype = A
trigger12 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger13 = stateno = 630 && Pos Y <= -1 || stateno = 230 
trigger13 = movecontact
trigger13 = enemy,statetype = A
trigger13 = Random <= 1000*ifelse((random <= 500),1,0) 
value = 1150

[State -1, When To Meteor Bullet - Forwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = numhelper(1501) = 0 && numhelper(1511) = 0 && numhelper(1561) = 0
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L  
triggerall = stateno != [100,101]      
triggerall = enemynear,movetype != A   
triggerall = var(40) > 199        
triggerall = enemynear,stateno != [40,49]  
triggerall = p2dist x = [-600,600]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 * p2dist x) >= 0),1)
triggerall = p2dist y = [-180 - ((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 10 * 0.78)))*((p2bodydist x) / 10 * 0.78),0]; - cond(enemy,statetype = A,((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 10 * 0.78)))*((p2bodydist x) / 10 * 0.78),0)]
triggerall = cond((enemy,statetype = A), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 0),1) 
;triggerall = p2dist y = [-100-(enemy,vel y * 4),0-(((enemy,statetype = A) * -20 - ((p2dist x) * 0.2)))] 
trigger1 = p2dist x = [150,999]                            
trigger1 = random <= 25; + ((var(56) = 1) * 75) 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger1 = enemy,stateno != [120,155] 
;trigger1 = p2dist y = [-100-(enemy,vel y * 4),0-(((enemy,statetype = A) * -20 - ((p2dist x) * 0.4)))] 
trigger2 = stateno = 200 && time > 0 || stateno = 600 && time > 0 && pos y >= 0
trigger2 = p2dist x > 66 || p2dist x < -25
trigger2 = !movecontact
trigger2 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger3 = stateno = 210 && time > 10 || stateno = 610 && time > 10 && pos y >= 0
trigger3 = p2dist x > 115 || p2dist x < -35
trigger3 = !movecontact
trigger3 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger4 = stateno = 400 && time > 0 
trigger4 = p2dist x > 72 || p2dist x < -25
trigger4 = !movecontact
trigger4 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger5 = stateno = 220 && time > 12 || stateno = 620 && time > 12 && pos y >= 0
trigger5 = p2dist x > 145 || p2dist x < -35
trigger5 = !movecontact
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger6 = stateno = 240 && time > 15 || stateno = 640 && time > 15 && pos y >= 0 || stateno = 241 && time > 15 || stateno = 641 && time > 15 && pos y >= 0
trigger6 = p2dist x > 120 || p2dist x < -35 || stateno = 641 && p2dist x > 100 || stateno = 241 && p2dist x > 100
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger7 = stateno = 250 && time > 21 || stateno = 650 && time > 21 && pos y >= 0 
trigger7 = p2dist x > 105 || p2dist x < -35
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = stateno = 630 && time > 12 && pos y >= 0 
trigger8 = p2dist x > 100 || p2dist x < -35
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = stateno = 1000 && time > 12 && pos y >= 0 || stateno = 1050 && time > 12 && pos y >= 0
trigger9 = enemy,movetype = H
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger10 = stateno = 1100 && time > 12 || stateno = 1150 && time > 12 && pos y >= 0
trigger10 = enemy,movetype = H || enemy,stateno = [120,159]
trigger10 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 40 && enemy,stateno = [120,159]
trigger10 = Random <= 1000*ifelse((random <= 900),1,0) 
trigger10 = var(20) = 0  || var(20) = 0 && p2dist x > 175 ;|| p2dist x > 225
;trigger10 = cond((enemy,statetype = A), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 20),1) 
value = 1500 

[State -1, When To Meteor Bullet - Upwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
triggerall = numhelper(1501) = 0 && numhelper(1511) = 0 && numhelper(1561) = 0
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L  
triggerall = stateno != [100,101]      
triggerall = enemynear,movetype != A   
triggerall = var(40) > 199        
;triggerall = p2dist y = [-190-(enemy,vel y * 4),-105-(enemy,vel y * 4)] 
triggerall = enemy,stateno != [10000,10053]
triggerall = p2dist x = [-600 - (((p2dist y) + ((vel y)+ (fvar(6)* 13))*13)/2),999]; + (vel x * 13) + cond(enemy,statetype != A,fvar(19+13) *((p2bodydist x) / 9) + ((p2dist y) / 4.5),(fvar(5) * 13) *((p2bodydist x) / 9) + ((p2dist y) / 4.5)),450]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 *((p2bodydist x) / 9) + p2dist x) >= 0),1)
triggerall = p2dist y = [-75  - ((vel y)+ (fvar(6)* 13))*13  - ((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 9)))*((p2bodydist x) / 9),0 - (((vel y)+ (fvar(6)* 13))*13) - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 13)) * 13 + (enemy,vel y + (fvar(4)*((p2bodydist x) / 9)))*((p2bodydist x) / 9))),1)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 0),1) 
trigger1 = p2dist x = [150,999]                            
trigger1 = random <= 25; + ((var(56) = 1) * 75) 
trigger1 = ctrl 
trigger1 = (statetype != A) 
trigger2 = stateno = 200 && time > 0 || stateno = 600 && time > 0 && pos y >= 0
trigger2 = p2dist x > 66 || p2dist x < -25
trigger2 = !movecontact
trigger2 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger3 = stateno = 210 && time > 10 || stateno = 610 && time > 10 && pos y >= 0
trigger3 = p2dist x > 115 || p2dist x < -35
trigger3 = !movecontact
trigger3 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger4 = stateno = 400 && time > 0 
trigger4 = p2dist x > 72 || p2dist x < -25
trigger4 = !movecontact
trigger4 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger5 = stateno = 220 && time > 12 || stateno = 620 && time > 12 && pos y >= 0
trigger5 = p2dist x > 145 || p2dist x < -35
trigger5 = !movecontact
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger6 = stateno = 240 && time > 15 || stateno = 640 && time > 15 && pos y >= 0 || stateno = 241 && time > 15 || stateno = 641 && time > 15 && pos y >= 0
trigger6 = p2dist x > 120 || p2dist x < -35 || stateno = 641 && p2dist x > 100 || stateno = 241 && p2dist x > 100
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger7 = stateno = 250 && time > 21 || stateno = 650 && time > 21 && pos y >= 0 
trigger7 = p2dist x > 105 || p2dist x < -35
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = stateno = 630 && time > 12 && pos y >= 0 
trigger8 = p2dist x > 100 || p2dist x < -35
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = stateno = 1000 && time > 12 && pos y >= 0 || stateno = 1050 && time > 12 && pos y >= 0
trigger9 = enemy,movetype = H
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger10 = stateno = 1100 && time > 12 && pos y >= 0 || stateno = 1150 && time > 12 && pos y >= 0
trigger10 = enemy,movetype = H 
trigger10 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y < -60
trigger10 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger10 = var(20) = 0
value = 1510 

[State -1, When To Aerial Meteor Bullet - Forwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
triggerall = numhelper(1501) = 0 && numhelper(1511) = 0 && numhelper(1561) = 0
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L      
triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = enemynear,stateno != [40,49]  
triggerall = p2dist x = [0 + (vel x * 13),600]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 *((p2bodydist x) / 10) + (vel x * 13) + p2dist x) >= 0),1)
triggerall = p2dist y = [-50  + ((vel y)+ (fvar(6)* 13))*13  - ((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 10)))*((p2bodydist x) / 10),5]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= -12),1) 
;triggerall = p2dist y = [-90+(vel y * 3)-(enemy,vel y * 4),-30+(vel y * 3)-(enemy,vel y * 4)] 
trigger1 = p2dist x = [75,400]                            
trigger1 = random <= 25
trigger1 = ctrl 
trigger1 = (statetype = A) 
trigger2 = stateno = 640 && Pos Y <= -1 || stateno = 641 && Pos Y <= -1
trigger2 = movecontact
trigger2 = Random <= 1000*ifelse((random <= 300),1,0) 
trigger3 = stateno = 650 && Pos Y <= -1
trigger3 = movecontact
trigger3 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger4 = stateno = 600 && time > 0 && Pos Y <= -1
trigger4 = p2dist x > 66 || p2dist x < -25
trigger4 = !movecontact
trigger4 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger5 = stateno = 610 && time > 10 && Pos Y <= -1
trigger5 = p2dist x > 115 || p2dist x < -35
trigger5 = !movecontact
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger6 = stateno = 620 && time > 12 && Pos Y <= -1
trigger6 = p2dist x > 145 || p2dist x < -35
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger7 = stateno = 640 && time > 7 && Pos Y <= -1 || stateno = 641 && time > 7 && Pos Y <= -1
trigger7 = p2dist x > 125 || p2dist x < -35
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = stateno = 650 && time > 21 && Pos Y <= -1
trigger8 = p2dist x > 105 || p2dist x < -35
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = stateno = 630 && time > 12 && Pos Y <= -1 || stateno = 230 && time > 12
trigger9 = p2dist x > 100 || p2dist x < -35
trigger9 = !movecontact
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger10 = stateno = 1050 && time > 12 && pos y <= -1
trigger10 = enemy,movetype = H
trigger10 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger11 = stateno = 1150 && time > 12 && pos y <= -1
trigger11 = enemy,movetype = H 
trigger11 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34 && p2dist y < -60
trigger11 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger11 = var(20) = 0
trigger12 = stateno = 600 && Pos Y <= -1
trigger12 = movecontact
trigger12 = Random <= 1000*ifelse((random <= 800),1,0) 
trigger13 = stateno = 610  && Pos Y <= -1
trigger13 = movecontact
trigger13 = Random <= 1000*ifelse((random <= 800),1,0) 
value = 1550

[State -1, When To Aerial Meteor Bullet - Downwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
triggerall = p2stateno != [5080,5150]  
triggerall = enemy,stateno != [120,155] 
triggerall = numhelper(1501) = 0 && numhelper(1511) = 0 && numhelper(1561) = 0
;triggerall = enemy,statetype != A     
triggerall = enemy,statetype != L      
triggerall = enemynear,movetype != A   
triggerall = var(40) > 199      
triggerall = enemynear,stateno != [40,49]    
triggerall = p2dist x = [-10 + (vel x * 13) - (((p2dist y) + ((vel y)+ (fvar(6)* 13))*13)/2),999]; + (vel x * 13) + cond(enemy,statetype != A,fvar(19+13) *((p2bodydist x) / 9) + ((p2dist y) / 4.5),(fvar(5) * 13) *((p2bodydist x) / 9) + ((p2dist y) / 4.5)),450]   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 13 *((p2bodydist x) / 9) + (vel x * 13)+ p2dist x) >= 0),1)
triggerall = p2dist y = [-25  + ((vel y)+ (fvar(6)* 13))*13  - ((enemy,vel y + (fvar(4)* 13)) * 13) + (enemy,vel y + (fvar(4)*((p2bodydist x) / 9)))*((p2bodydist x) / 9),35 + (((vel y)+ (fvar(6)* 13))*13) - cond(enemy,statetype = A,((((enemy,vel y)+ (fvar(4)* 13)) * 13 + (enemy,vel y + (fvar(4)*((p2bodydist x) / 9)))*((p2bodydist x) / 9))),1)]
triggerall = cond((enemy,statetype = A) * (enemy,vel y >= 0.1), (((((enemy,vel y)+ (fvar(4)* 13)) * 13) + enemy,pos y) <= 0),1) 
;triggerall = p2dist y = [-30+(vel y * 3)-(enemy,vel y * 4)-((p2dist x) * 0.4),150+(vel y * 3)-(enemy,vel y * 4)-((p2dist x) * 0.4)] 
;triggerall = enemy,vel y > -3
;trigger1 = p2dist x = [75 + ((var(56) = 1) * 100),400]                            
trigger1 = random <= 25
trigger1 = ctrl 
trigger1 = (statetype = A)
trigger1 = cond(stateno = 101, pos y > -62,1)
trigger2 = stateno = 640 && Pos Y <= -1 || stateno = 641 && Pos Y <= -1
trigger2 = movecontact
trigger2 = Random <= 1000*ifelse((random <= 300),1,0) 
trigger3 = stateno = 650 && Pos Y <= -1
trigger3 = movecontact
trigger3 = Random <= 1000*ifelse((random <= 500),1,0) 
trigger4 = stateno = 600 && time > 0 && Pos Y <= -1
trigger4 = p2dist x > 66 || p2dist x < -25
trigger4 = !movecontact
trigger4 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger5 = stateno = 610 && time > 10 && Pos Y <= -1
trigger5 = p2dist x > 115 || p2dist x < -35
trigger5 = !movecontact
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger6 = stateno = 620 && time > 12 && Pos Y <= -1
trigger6 = p2dist x > 145 || p2dist x < -35
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger7 = stateno = 640 && time > 7 && Pos Y <= -1 || stateno = 641 && time > 7 && Pos Y <= -1
trigger7 = p2dist x > 125 || p2dist x < -35
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = stateno = 650 && time > 21 && Pos Y <= -1
trigger8 = p2dist x > 105 || p2dist x < -35
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = stateno = 630 && time > 12 && Pos Y <= -1 || stateno = 230 && time > 12
trigger9 = p2dist x > 100 || p2dist x < -35
trigger9 = !movecontact
trigger9 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger10 = stateno = 1050 && time > 12 && pos y <= -1
trigger10 = enemy,movetype = H
trigger10 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger11 = stateno = 1150 && time > 12 && pos y <= -1
trigger11 = enemy,movetype = H 
trigger11 = cond(numhelper(1101) = 1, cond(helper(1101),hitcount > 4,1,0),0) || time > 34
trigger11 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger11 = var(20) = 0
trigger12 = stateno = 600 && time > 0 && Pos Y <= -1
trigger12 = movecontact
trigger12 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger13 = stateno = 610 && time > 10 && Pos Y <= -1
trigger13 = movecontact
trigger13 = Random <= 1000*ifelse((random <= 200),1,0) 
value = 1560

[State -1, When To Starfall]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2     
;triggerall = p2stateno != [5080,5150]     
triggerall = enemy,stateno != [120,155]   
triggerall = enemynear,movetype != A  
;triggerall = pos y < -15       
triggerall = var(40) > 199    
;triggerall = numhelper(1801) = 0  
triggerall = stateno != [100,101] 
triggerall = p2dist x = [-90,90]  
triggerall = numhelper(1720) = 0
triggerall = enemy,stateno != 5120 && enemy,stateno != [5200,5210]
triggerall = enemy,stateno != [700,999]
triggerall = power > 999
triggerall = life > 400
triggerall = enemy,life > 200
trigger1 = p2dist x = [-75,75]    
trigger1 = enemy,statetype = A
trigger1 = ctrl
trigger1 = p2dist y < -300  
trigger1 = statetype != A
trigger2 = enemy,statetype = L
trigger2 = ctrl
trigger2 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger2 = p2dist x = [75,100]
trigger2 = statetype != A
trigger3 = stateno = 200 && time > 0 || stateno = 600 && time > 0 && pos y >= 0
trigger3 = p2dist y < -300 
trigger3 = !movecontact
trigger3 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger4 = stateno = 210 && time > 10 || stateno = 610 && time > 10 && pos y >= 0
trigger4 = p2dist y < -300 || enemy,statetype = L
trigger4 = !movecontact
trigger4 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger5 = stateno = 400 && time > 0 
trigger5 = p2dist y < -300
trigger5 = !movecontact
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger6 = stateno = 220 && time > 12 || stateno = 620 && time > 12 && pos y >= 0
trigger6 = p2dist y < -300
trigger6 = !movecontact
trigger6 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger7 = stateno = 240 && time > 15 || stateno = 640 && time > 15 && pos y >= 0  || stateno = 241 && time > 15 || stateno = 641 && time > 15  && pos y >= 0
trigger7 = p2dist y < -300 || enemy,statetype = L
trigger7 = !movecontact
trigger7 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger8 = stateno = 250 && time > 21 || stateno = 650 && time > 21  && pos y >= 0 
trigger8 = p2dist y < -300 
trigger8 = !movecontact
trigger8 = Random <= 1000*ifelse((random <= 200),1,0) 
trigger9 = stateno = 630 && time > 12 && pos y >= 0
trigger9 = p2dist y < -300
trigger9 = !movecontact
trigger9 = Random <= 1000*ifelse((random <= 200),1,0)  
value = 1700

[State -1, When To Run Forward]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = enemynear,movetype != A 
triggerall = stateno != 100
triggerall = frontedgedist > 100
triggerall = !enemynear,ishelper
;triggerall = var(56) != 1 
trigger1 = Ctrl 
trigger1 = p2dist X >= 125
trigger1 = random <= 75 + ((var(20) = 1) * 925)
trigger2 = Ctrl 
trigger2 = enemy,statetype = A
trigger2 = enemy,movetype = H
trigger2 = fvar(5) > 3
trigger2 = enemy,pos y < -50
trigger2 = random <= 200
trigger2 = p2dist X >= 225
trigger2 = backedgedist > 30
trigger2 = prevstateno != 1400
trigger3 = enemy,stateno = [120,155]
trigger3 = ctrl
trigger3 = random < (200 + (numhelper(1601) = 1) * 400) 
trigger3 = p2dist X >= 150
trigger4 = (numhelper(1601) = 1)
trigger4 = ctrl
trigger4 = random < 500
trigger4 = enemy,numproj = 0 
trigger4 = p2dist X >= 150
value = 100

[State -1, When to AirDash Forwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2 
triggerall = statetype = A
triggerall = numexplod(100001) < 1 
triggerall = frontedgedist > (75 + ((vel x > 0) * 50)) 
triggerall = enemy,stateno != [10000,10051] 
triggerall = pos y < -40
;trigger1 = var(56) != 1 
trigger1 = p2dist x = [125,400]
trigger1 = Random < 100 + ((prevstateno = 41) * (backedgedist < 60) * 600)
trigger1 = ctrl
trigger2 = enemy,movetype = H
trigger2 = p2dist x = [50,225]
trigger2 = random < 975
trigger2 = ctrl
trigger2 = prevstateno != 3000 || prevstateno != 3050
;trigger2 = var(56) != 1 
trigger3 = backedgedist < 50
trigger3 = p2dist x = [0,100]
trigger3 = p2dist y = [125,200]
trigger3 = random < 200
trigger3 = ctrl
;trigger3 = var(56) != 1
trigger4 = enemy,statetype = L
trigger4 = p2dist x = [75,300]
trigger4 = random < 200
trigger4 = ctrl
;trigger4 = var(56) != 1
trigger5 = p2dist x = [0,200]
trigger5 = enemy,statetype = A 
trigger5 = enemy,movetype != H
trigger5 = enemynear,vel x < -2
trigger5 = random < 75
trigger5 = ctrl
trigger5 = time > 4
trigger5 = pos y < -60
trigger6 = stateno = 120 || stateno = 132 || stateno = 140
trigger6 = p2dist x > 150
trigger6 = backedgedist < 80
trigger6 = pos y < -135
trigger6 = random < 800
trigger6 = !inguarddist
trigger7 = backedgedist < 50
trigger7 = p2dist x = [-50,125]
trigger7 = random < 900
trigger7 = ctrl
;trigger7 = var(56) = 1
trigger7 = pos y < -100
value = 101

[State -1, When to AirDash Backwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2 
triggerall = statetype = A
triggerall = numexplod(100005) < 1 
triggerall = backedgedist > 75 
triggerall = enemy,stateno != [10000,10053]
triggerall = ctrl
triggerall = enemy,movetype != H
triggerall = numhelper(3004) = 0
trigger1 = p2dist x = [0,150]
trigger1 = random < 4
;trigger1 = var(56) = 1
trigger2 = p2dist x <= 0
trigger2 = facing != enemy,facing
trigger2 = enemy,statetype != A
trigger2 = random < 20
trigger3 = enemy,movetype != H
trigger3 = random < 999
trigger3 = time > 12 && pos y >= 0
trigger3 = stateno = 1650 || stateno = 1660 || stateno = 1670 && time > 18
trigger3 = enemy,movetype = A || p2dist x < -10
value = 102

[State -1, When to Specifically Jump]
Type = ChangeState
Value = 40000
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = StateType != A
triggerall = var(17) = 0
triggerall = frontedgedist > 35
triggerall = prevstateno != 1100 || prevstateno != 3000
triggerall = numhelper(3004) = 0
trigger1 = enemy,movetype != A
trigger1 = enemy,StateType = A && enemy,movetype = H
trigger1 = p2dist X = [0,75]
trigger1 = p2dist y = [-175,-75]
trigger1 = enemy,vel y < 2
trigger1 = random < 150
trigger1 = Ctrl 
trigger1 = enemy,stateno != [10000,10053]
trigger2 = enemy,StateType = A && enemy,movetype != H
trigger2 = p2dist X = [40,150]
trigger2 = random < 150
trigger2 = Ctrl 
trigger2 = p2dist y = [-175,-75]
trigger2 = enemy,stateno != [10000,10053]
trigger2 = enemy,movetype != A
trigger3 = enemy,stateno = 131 || enemy,stateno = [152,153]
trigger3 = Ctrl
trigger3 = random < 300
trigger3 = enemy,movetype != A
trigger4 = enemy,movetype != H || enemy,statetype != A
trigger4 = stateno != [20,101]
trigger4 = p2dist y = [-100,0]
trigger4 = p2dist x > 200
trigger4 = random < 25
trigger4 = Ctrl
trigger4 = life > 250
;trigger4 = var(56) != 1
trigger4 = enemy,movetype != A
trigger5 = enemy,movetype != H
trigger5 = random < 150
trigger5 = time > 12 && pos y >= 0 && stateno = [1000,1050]
trigger5 = enemy,movetype = A || p2dist x < -10 || p2dist y = [-999,-75]
trigger6 = enemy,movetype != H || enemy,statetype = L && p2dist x < 180
trigger6 = random < 150
trigger6 = time > 12 && pos y >= 0 && stateno = [1100,1150]
trigger6 = enemy,movetype = A || p2dist x < -10 || enemy,statetype = L && p2dist x < 180 || p2dist y = [-999,-75]
trigger7 = enemy,movetype != H
trigger7 = random < 150
trigger7 = time > 12 && pos y >= 0 && stateno = 1500
trigger7 = enemy,movetype = A || p2dist x < -10 || p2dist y = [-999,-75]
trigger8 = enemy,movetype != H
trigger8 = random < 999
trigger8 = time > 12 && pos y >= 0
trigger8 = stateno = 1600 || stateno = 1610 || stateno = 1620 && time > 18
trigger8 = enemy,movetype = A || p2dist x < -10

[State -1, When To Walk Forward]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = statetype != A
;triggerall = stateno != 20
triggerall = frontedgedist > 45
triggerall = prevstateno != 52 
;triggerall = var(56) != 1  
triggerall = stateno != [100,106]
triggerall = enemy,stateno != [10050,10053]
trigger1 = Ctrl 
trigger1 = p2dist X > (90 + (105 * enemy,movetype = A))
trigger1 = random <= 300
trigger1 = enemy,statetype != L
trigger2 = enemy,statetype = L
trigger2 = Ctrl 
trigger2 = p2dist X > 125
trigger2 = random <= 300
trigger3 = Ctrl 
trigger3 = p2dist X > 66 
trigger3 = random <= 300
trigger3 = enemy,movetype = H
trigger3 = enemy,statetype = A
trigger3 = frontedgedist < 125
trigger4 = Ctrl 
trigger4 = p2dist X > 100 
trigger4 = random <= 300
trigger4 = enemy,movetype = H
trigger4 = enemy,statetype = A
trigger4 = enemy,backedgedist = 0
trigger4 = enemy,pos y < -100
value = 21

[State -1, When To Walk Backwards]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = enemy,movetype != A
;triggerall = stateno != 20
triggerall = backedgedist > 45
triggerall = stateno != [100,106]
triggerall = enemy,stateno != [10000,10053]
triggerall = numhelper(3004) = 0
;triggerall = var(1) = 0
trigger1 = Ctrl 
trigger1 = p2dist X = [0,90]
;trigger1 = random <= 500
trigger1 = enemy,stateno = [5080,5210]
;trigger1 = enemy,stateno != 5150
;trigger2 = var(56) = 1
trigger2 = Ctrl 
trigger2 = p2dist X < 150 
trigger2 = random <= 5
trigger2 = enemy,movetype != H
trigger3 = stateno = 1700 
trigger3 = time < 11
trigger3 = enemy,statetype != L
value = 24

[State -1, When to Super Jump]
Type = ChangeState
Value = 41
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = StateType != A
triggerall = frontedgedist > 35
triggerall = numhelper(3004) = 0
trigger1 = random <= (100)
trigger1 = ctrl
trigger1 = p2dist X = [-25,125]
trigger1 = backedgedist < 50
trigger1 = prevstateno != [800,804]
trigger2 = enemy,statetype = A
trigger2 = p2dist y = [-250,-100]
trigger2 = enemynear,movetype != H 
trigger2 = ctrl   
trigger2 = random <= 200
trigger2 = p2dist X = [0,100] 
trigger3 = enemy,StateType = A
trigger3 = enemy,movetype = H
trigger3 = p2dist X = [0,100]
trigger3 = p2dist y = [-300,-200]
trigger3 = enemy,vel y < 2
trigger3 = random < 150
trigger3 = Ctrl
trigger4 = random <= 150
trigger4 = ctrl || stateno = 120
trigger4 = p2dist X > 250
trigger4 = backedgedist < 25
trigger4 = enemy,movetype = A

;[State -1, When To Explosive Potion - Into the Air]
;type = ChangeState
;triggerall = var(59) = 1
;triggerall = roundstate = 2
;triggerall = (statetype != A)  
;triggerall = p2statetype != L   
;triggerall = p2movetype != H   
;triggerall = (enemynear,movetype != A) * (palno != [11,12])     
;triggerall = enemy,stateno != [120,155]                   
;triggerall = enemynear,vel y = [-7,1] 
;triggerall = enemynear,vel x = [-2,2] 
;triggerall = var(40) > 199
;triggerall = numhelper(1601) < 1
;triggerall = numhelper(1611) < 1
;triggerall = !inguarddist
;triggerall = p2dist X = [135,175]
;triggerall = p2dist y = [-250,-75]    
;triggerall = enemy,stateno != [10000,10053]  
;triggerall = stateno != [100,106]                 
;trigger1 = random <= 25 + ((numhelper(1003) = 1) * 75)
;trigger1 = ctrl
;trigger2 = ctrl
;trigger2 = stateno = 0 && time > 120 && gametime > 300 
;trigger2 = random < 50     
;value = 1600

[State -1, When To Explosive Potion - Into the Front]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)       
triggerall = (enemynear,movetype != A) * (palno != [11,12])     
;triggerall = enemy,stateno != [120,155]                   
triggerall = enemynear,vel y = [-2,2] 
triggerall = enemynear,vel x = [-2,2] 
triggerall = var(40) > 199
triggerall = numhelper(1601) < 1
triggerall = numhelper(1611) < 1
triggerall = !inguarddist
triggerall = life > 500
triggerall = p2dist X = [150,190]
triggerall = p2dist y = [-125,0]   
triggerall = stateno != [20,24]
triggerall = stateno != [100,101]   
triggerall = enemy,stateno != [10000,10053]  
triggerall = stateno != [100,106]           
triggerall = numhelper(3210) = 0         
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 150),1)
trigger1 = random <= 25 + ((numhelper(1003) = 1) * 75)
trigger1 = ctrl    
trigger1 = p2statetype != L 
trigger2 = p2statetype = L    
trigger2 = random <= 75
trigger2 = ctrl   
trigger3 = ctrl
trigger3 = stateno = 0 && time > 120 && gametime > 300   
trigger3 = random < 50  
value = 1610

[State -1, When To Explosive Potion - Long Throw]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype != A)       
triggerall = (enemynear,movetype != A) * (palno != [11,12])     
;triggerall = enemy,stateno != [120,155]                   
triggerall = var(40) > 199
triggerall = numhelper(1621) < 1
triggerall = !inguarddist
triggerall = p2dist X = [175,300]
triggerall = p2dist y = [-150,0]   
triggerall = stateno != [20,24]
triggerall = stateno != [100,101]  
triggerall = enemy,stateno != [10000,10053]  
triggerall = numhelper(3210) = 0   
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 175),1)                
trigger1 = random <= 25 + ((numhelper(1003) = 1) * 75)
trigger1 = ctrl    
trigger1 = p2statetype != L 
trigger1 = enemynear,vel y = [-2,2] 
trigger1 = enemynear,vel x = [-2,2] 
trigger1 = life > 500 
trigger2 = p2statetype = L    
trigger2 = random <= 75
trigger2 = ctrl   
trigger2 = enemynear,vel y = [-2,2] 
trigger2 = enemynear,vel x = [-2,2] 
trigger2 = life > 500 
trigger3 = stateno = 1600 || stateno = 1610
trigger3 = time > 12
trigger4 = ctrl
trigger4 = stateno = 0 && time > 120 && gametime > 300  
trigger4 = random < 50 
;trigger1 = life > 500 
trigger5 = stateno = 1100 && time > 12 && pos y >= 0 || stateno = 1150 && time > 12 && pos y >= 0
trigger5 = enemy,statetype = L
trigger5 = enemy,stateno = [5080,5150]
trigger5 = Random <= 1000*ifelse((random <= 200),1,0) 
value = 1620

[State -1, When To Aerial Explosive Potion - Down Below]
type = ChangeState
triggerall = var(59) = 1
triggerall = roundstate = 2
triggerall = (statetype = A)       
triggerall = (enemynear,movetype != A) * (palno != [11,12])     
;triggerall = enemy,stateno != [120,155]                   
triggerall = enemynear,vel y = [-7,1] 
triggerall = enemynear,vel x = [-4,4] 
triggerall = var(40) > 199
triggerall = numhelper(1601) < 1
triggerall = numhelper(1611) < 1
triggerall = !inguarddist
triggerall = life > 500
triggerall = p2dist X = [115,155]
triggerall = p2dist y = [-25,175]  
triggerall = enemy,stateno != [10000,10053]   
triggerall = numhelper(3210) = 0  
triggerall = numhelper(3004) = 0
triggerall = cond(enemy,statetype = A, ((-(enemy,vel x) * 8 + p2dist x) >= 115),1)                    
trigger1 = random <= 25
trigger1 = ctrl    
trigger1 = p2statetype != L 
trigger2 = p2statetype = L    
trigger2 = random <= 75
trigger2 = ctrl       
value = 1650

;[State -1, When To Aerial Explosive Potion - Into the Front]
;type = ChangeState
;triggerall = var(59) = 1
;triggerall = roundstate = 2
;triggerall = (statetype = A)       
;triggerall = (enemynear,movetype != A) * (palno != [11,12])     
;triggerall = p2movetype != H   
;triggerall = enemy,stateno != [120,155]                   
;triggerall = enemynear,vel y = [-2,2] 
;triggerall = enemynear,vel x = [-2,2] 
;triggerall = var(40) > 199
;triggerall = numhelper(1601) < 1
;triggerall = numhelper(1611) < 1
;triggerall = !inguarddist
;triggerall = p2dist X = [150,190]
;triggerall = p2dist y = [-125,50]  
;triggerall = p2statetype != L   
;triggerall = enemy,stateno != [10000,10053]     
;triggerall = numhelper(3210) = 0                
;trigger1 = random <= 25
;trigger1 = ctrl    
;value = 1660

;[State -1, When To Aerial Explosive Potion - Long Throw]
;type = ChangeState
;triggerall = var(59) = 1
;triggerall = roundstate = 2
;triggerall = (statetype = A)       
;triggerall = (enemynear,movetype != A) * (palno != [11,12])     
;triggerall = enemy,stateno != [120,155]                   
;triggerall = var(40) > 199
;triggerall = numhelper(1621) < 1
;triggerall = !inguarddist
;triggerall = p2dist X = [125,300]
;triggerall = p2dist y = [-85,85]   
;triggerall = enemy,stateno != [10000,10053]   
;triggerall = numhelper(3210) = 0                   
;trigger1 = random <= 25
;trigger1 = ctrl    
;trigger1 = p2statetype != L 
;trigger1 = enemynear,vel y = [-2,2] 
;trigger1 = enemynear,vel x = [-2,2] 
;trigger2 = p2statetype = L    
;trigger2 = random <= 75
;trigger2 = ctrl   
;trigger2 = enemynear,vel y = [-2,2] 
;trigger2 = enemynear,vel x = [-2,2] 
;trigger3 = stateno = 1600 || stateno = 1610
;trigger3 = time > 12
;value = 1670

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = stateno != 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = command = "c"
;trigger2 = command = "holdfwd"
;trigger2 = ctrl 
;trigger2 = statetype = S

;===========================================================================
;---------------------------------------------------------------------------
;Hop Forwards
[State -1, Run Fwd]
type = ChangeState
value = 101
triggerall = var(59) != 1
triggerall = numexplod(100001) < 1 
triggerall = !AIlevel
trigger1 = command = "FF"
trigger1 = statetype = A
trigger1 = ctrl 
;trigger2 = command = "c"
;trigger2 = command = "holdfwd"
;trigger2 = ctrl 
;trigger2 = statetype = A

;---------------------------------------------------------------------------
;Hop Backwards In The Air
[State -1, Run Back]
type = ChangeState
value = 102
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = command != "QCB_c"
triggerall = command = "BB"
trigger1 = numexplod(100005) < 1 
trigger1 = statetype = A
trigger1 = ctrl 
trigger2 = stateno = 1050 && time > 12 && Pos Y <= -1 
trigger3 = stateno = 1150 && time > 12 && Pos Y <= -1
trigger4 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger5 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger6 = stateno = 1550 && anim = 1501 && animelemtime(4) >= 0 
trigger7 = stateno = 1560 && anim = 1501 && animelemtime(4) >= 0 
trigger8 = stateno = 1650 && time > 12 
trigger9 = stateno = 1660 && time > 12 
trigger10 = stateno = 1670 && time > 18 

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = command != "QCB_c"
triggerall = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 1000 && time > 12 
trigger3 = stateno = 1050 && time > 12 && Pos Y >= 0
trigger4 = stateno = 1100 && time > 12
trigger5 = stateno = 1150 && time > 12 && Pos Y >= 0
trigger6 = stateno = 1600 && time > 12 
trigger7 = stateno = 1610 && time > 12 
trigger8 = stateno = 1620 && time > 18 

;===========================================================================
;---------------------------------------------------------------------------
;Star Blink
[State -1, Star Blink]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "QCB_x"
triggerall = stateno != 100
triggerall = var(59) != 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger2 = var(31) < 1

;---------------------------------------------------------------------------
;Broom Sweep
[State -1, Broom Sweep]
type = ChangeState
value = 210
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "QCB_y"
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = stateno != 100
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 600 && movecontact && Pos Y >= 0

;---------------------------------------------------------------------------
;Dashing Broom Sweep
[State -1, Dashing Broom Sweep]
type = ChangeState
value = 215
triggerall = var(59) != 1
triggerall = !AIlevel
trigger1 = stateno = 100
trigger1 = ctrl
trigger1 = statetype != A 
trigger1 = command = "x"

;---------------------------------------------------------------------------
;Broom Overhead
[State -1, Broom Overhead]
type = ChangeState
value = 220
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "QCB_z"
triggerall = var(59) != 1
triggerall = command = "z"
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = stateno != 100
trigger2 = stateno = 200 && movecontact    
trigger3 = stateno = 210 && movecontact 
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 600 && movecontact && Pos Y >= 0
trigger6 = stateno = 610 && movecontact && Pos Y >= 0

;---------------------------------------------------------------------------
;Dashing Rotating Star
[State -1, Dashing Rotating Star]
type = ChangeState
value = 225
triggerall = var(59) != 1
triggerall = !AIlevel
trigger1 = stateno = 100
trigger1 = ctrl
trigger1 = statetype != A 
trigger1 = command = "y"


;---------------------------------------------------------------------------
;Broom Uppersweep
[State -1, Broom Uppersweep]
type = ChangeState
value = 230
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = command != "QCB_y"
triggerall = var(59) != 1
triggerall = Pos Y >= 0 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact       
trigger3 = stateno = 200 && movecontact 
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 220 && movecontact
trigger6 = stateno = 600 && movecontact && Pos Y >= 0
trigger7 = stateno = 610 && movecontact && Pos Y >= 0
trigger8 = stateno = 620 && movecontact && Pos Y >= 0

;---------------------------------------------------------------------------
;Tackle Attack
[State -1, Tackle Attack]
type = ChangeState
value = 240
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = var(59) != 1
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = stateno != 100
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 600 && movecontact && Pos Y >= 0

;---------------------------------------------------------------------------
;Tackle Attack - Wallslam Combo Version
[State -1, Tackle Attack - Wallslam Combo Version]
type = ChangeState
value = 241
triggerall = var(59) != 1
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = stateno != 100
trigger1 = stateno = 220 && movecontact
trigger2 = stateno = 210 && movecontact   
trigger3 = stateno = 610 && movecontact && Pos Y >= 0
trigger4 = stateno = 620 && movecontact && Pos Y >= 0    

;---------------------------------------------------------------------------
;Homerun Sweep
[State -1, Homerun Sweep]
type = ChangeState
value = 250
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holdfwd" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact       
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 600 && movecontact && Pos Y >= 0
trigger7 = stateno = 610 && movecontact && Pos Y >= 0
trigger8 = stateno = 620 && movecontact && Pos Y >= 0

;---------------------------------------------------------------------------
;Low Star Blink
[State -1, Low Star Blink]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = command != "QCB_x"
triggerall = var(59) != 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 600 && movecontact && Pos Y >= 0 

;---------------------------------------------------------------------------
;Aerial Star Blink
[State -1, Aerial Star Blink]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "QCB_x"
triggerall = stateno != 100
triggerall = var(59) != 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact && Pos Y <= -1 
trigger2 = var(31) < 1

;---------------------------------------------------------------------------
;Aerial Broom Spin
[State -1, Aerial Broom Spin]
type = ChangeState
value = 610
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "QCB_y"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = stateno != 100
trigger2 = stateno = 600 && movecontact && Pos Y <= -1

;---------------------------------------------------------------------------
;Aerial Broom Overhead
[State -1, Broom Overhead]
type = ChangeState
value = 620
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "QCB_z"
triggerall = var(59) != 1
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact && Pos Y <= -1    
trigger3 = stateno = 610 && movecontact && Pos Y <= -1 

;---------------------------------------------------------------------------
;Aerial Broom Uppersweep
[State -1, Aerial Broom Uppersweep]
type = ChangeState
value = 630
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = command != "QCB_y"
triggerall = var(59) != 1
triggerall = Pos Y <= -1   
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1       
trigger3 = stateno = 600 && movecontact && Pos Y <= -1 
trigger4 = stateno = 620 && movecontact && Pos Y <= -1

;---------------------------------------------------------------------------
;Aerial Tackle Attack
[State -1, Aerial Tackle Attack]
type = ChangeState
value = 640
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = var(59) != 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact && Pos Y <= -1 

;---------------------------------------------------------------------------
;Aerial Tackle Attack - Wallslam Combo Version
[State -1, Aerial Tackle Attack - Wallslam Combo Version]
type = ChangeState
value = 641
triggerall = var(59) != 1
triggerall = command = "x"
triggerall = command = "holdfwd"
trigger1 = stateno = 620 && movecontact && Pos Y <= -1
trigger2 = stateno = 610 && movecontact && Pos Y <= -1  

;---------------------------------------------------------------------------
;Aerial Homerun Sweep
[State -1, Aerial Homerun Sweep]
type = ChangeState
value = 650
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holdfwd" 
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1       
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 

;---------------------------------------------------------------------------
;Comet Trail
[State -1, Comet Trail]
type = ChangeState
value = 660
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = command != "QCB_x"
triggerall = var(59) != 1
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1       
trigger3 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 620 && movecontact && Pos Y <= -1

;---------------------------------------------------------------------------
[State -1, Starshards]
type = ChangeState
value = 1000
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "DD_a"
triggerall = command != "QCF_a"
triggerall = command != "QCB_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact || stateno = 210 && time > 10     
trigger3 = stateno = 220 && movecontact || stateno = 220 && time > 12
trigger4 = stateno = 200 && movecontact || stateno = 200 && time > 0
trigger5 = stateno = 400 && movecontact || stateno = 400 && time > 0
trigger6 = stateno = 241 && movecontact || stateno = 241 && time > 7 
trigger7 = stateno = 240 && movecontact || stateno = 240 && time > 7  
trigger8 = stateno = 250 && movecontact || stateno = 250 && time > 21
trigger9 = stateno = 610 && movecontact && Pos Y >= 0 || stateno = 610 && time > 10  && Pos Y >= 0   
trigger10 = stateno = 620 && movecontact && Pos Y >= 0 || stateno = 620 && time > 12 && Pos Y >= 0
trigger11 = stateno = 600 && movecontact && Pos Y >= 0 || stateno = 600 && time > 0 && Pos Y >= 0
trigger12 = stateno = 641 && movecontact && Pos Y >= 0 || stateno = 641 && time > 7 && Pos Y >= 0 
trigger13 = stateno = 640 && movecontact && Pos Y >= 0 || stateno = 640 && time > 7 && Pos Y >= 0
trigger14 = stateno = 650 && movecontact && Pos Y >= 0 || stateno = 650 && time > 21 && Pos Y >= 0
trigger15 = stateno = 630 && movecontact && Pos Y >= 0 || stateno = 630 && time > 12 && Pos Y >= 0

;---------------------------------------------------------------------------
[State -1, Aerial Starshards]
type = ChangeState
value = 1050
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "DD_a"
triggerall = command != "QCF_a"
triggerall = command != "QCB_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1 || stateno = 610 && time > 10  && Pos Y <= -1     
trigger3 = stateno = 620 && movecontact && Pos Y <= -1 || stateno = 620 && time > 12 && Pos Y <= -1     
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 || stateno = 600 && time > 0  && Pos Y <= -1     
trigger5 = stateno = 641 && movecontact && Pos Y <= -1 || stateno = 641 && time > 7  && Pos Y <= -1       
trigger6 = stateno = 640 && movecontact && Pos Y <= -1 || stateno = 640 && time > 7  && Pos Y <= -1      
trigger7 = stateno = 650 && movecontact && Pos Y <= -1 || stateno = 650 && time > 21  && Pos Y <= -1     
trigger8 = stateno = 230 && movecontact || stateno = 230 && time > 12  && Pos Y <= -1     
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 || stateno = 630 && time > 12  && Pos Y <= -1     

;---------------------------------------------------------------------------
[State -1, Stellarbeam]
type = ChangeState
value = 1100
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
triggerall = command != "DD_a"
triggerall = command != "QCF_a"
triggerall = command != "QCB_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact || stateno = 210 && time > 10     
trigger3 = stateno = 220 && movecontact || stateno = 220 && time > 12
trigger4 = stateno = 200 && movecontact || stateno = 200 && time > 0
trigger5 = stateno = 400 && movecontact || stateno = 400 && time > 0
trigger6 = stateno = 241 && movecontact || stateno = 241 && time > 7 
trigger7 = stateno = 240 && movecontact || stateno = 240 && time > 7  
trigger8 = stateno = 250 && movecontact || stateno = 250 && time > 21
trigger9 = stateno = 610 && movecontact && Pos Y >= 0 || stateno = 610 && time > 10  && Pos Y >= 0   
trigger10 = stateno = 620 && movecontact && Pos Y >= 0 || stateno = 620 && time > 12 && Pos Y >= 0
trigger11 = stateno = 600 && movecontact && Pos Y >= 0 || stateno = 600 && time > 0 && Pos Y >= 0
trigger12 = stateno = 641 && movecontact && Pos Y >= 0 || stateno = 641 && time > 7 && Pos Y >= 0 
trigger13 = stateno = 640 && movecontact && Pos Y >= 0 || stateno = 640 && time > 7 && Pos Y >= 0
trigger14 = stateno = 650 && movecontact && Pos Y >= 0 || stateno = 650 && time > 21 && Pos Y >= 0
trigger15 = stateno = 630 && movecontact && Pos Y >= 0 || stateno = 630 && time > 12 && Pos Y >= 0

;---------------------------------------------------------------------------
[State -1, Aerial Stellarbeam]
type = ChangeState
value = 1150
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
triggerall = command != "DD_a"
triggerall = command != "QCF_a"
triggerall = command != "QCB_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1 || stateno = 610 && time > 10  && Pos Y <= -1     
trigger3 = stateno = 620 && movecontact && Pos Y <= -1 || stateno = 620 && time > 12 && Pos Y <= -1     
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 || stateno = 600 && time > 0  && Pos Y <= -1     
trigger5 = stateno = 641 && movecontact && Pos Y <= -1 || stateno = 641 && time > 7  && Pos Y <= -1       
trigger6 = stateno = 640 && movecontact && Pos Y <= -1 || stateno = 640 && time > 7  && Pos Y <= -1      
trigger7 = stateno = 650 && movecontact && Pos Y <= -1 || stateno = 650 && time > 21  && Pos Y <= -1     
trigger8 = stateno = 230 && movecontact || stateno = 230 && time > 12  && Pos Y <= -1     
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 || stateno = 630 && time > 12  && Pos Y <= -1    

;---------------------------------------------------------------------------
[State -1, Witch Ley Line]
type = ChangeState
value = 1200
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0 
trigger18 = stateno = 1000 && time > 10
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12 


;---------------------------------------------------------------------------
[State -1, Aerial Witch Ley Line]
type = ChangeState
value = 1250
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1

;---------------------------------------------------------------------------
;Sweep Aside - Ground Forward
[State -1, Sweep Aside - Ground Forward]
type = ChangeState
value = 1300
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = command != "QCB_y"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12 


;---------------------------------------------------------------------------
;Sweep Aside - Ground Up
[State -1, Sweep Aside - Ground Up]
type = ChangeState
value = 1310
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = command != "QCB_z"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0 
trigger18 = stateno = 1000 && time > 10
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12 

;---------------------------------------------------------------------------
[State -1, Sweep Aside - Air Forward]
type = ChangeState
value = 1350
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = command != "QCB_y"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1  
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1

;---------------------------------------------------------------------------
[State -1, Sweep Aside - Air Down]
type = ChangeState
value = 1360
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = command != "QCB_z"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1

;---------------------------------------------------------------------------
;Rising Sweep
[State -1, Rising Sweep]
type = ChangeState
value = 1400
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "z"
triggerall = command = "holddown"
;triggerall = command != "~D, D, z"
triggerall = command != "QCB_z"
;trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact     
trigger12 = stateno = 620 && movecontact 
trigger13 = stateno = 600 && movecontact  
trigger14 = stateno = 641 && movecontact 
trigger15 = stateno = 640 && movecontact    
trigger16 = stateno = 650 && movecontact  
trigger17 = stateno = 630 && movecontact 
trigger18 = stateno = 230 && movecontact 
trigger19 = stateno = 1050 && time > 10 
trigger20 = stateno = 1000 && time > 10 
trigger21 = stateno = 1100 && time > 10
trigger22 = stateno = 1150 && time > 10
trigger23 = stateno = 1600 && time > 12 
trigger24 = stateno = 1610 && time > 12 


;---------------------------------------------------------------------------
[State -1, Meteor Bullet - Forward]
type = ChangeState
value = 1500
triggerall = command = "QCF_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact || stateno = 210 && time > 10     
trigger3 = stateno = 220 && movecontact || stateno = 220 && time > 12
trigger4 = stateno = 200 && movecontact || stateno = 200 && time > 0
trigger5 = stateno = 400 && movecontact || stateno = 400 && time > 0
trigger6 = stateno = 241 && movecontact || stateno = 241 && time > 7 
trigger7 = stateno = 240 && movecontact || stateno = 240 && time > 7  
trigger8 = stateno = 250 && movecontact || stateno = 250 && time > 21
trigger9 = stateno = 610 && movecontact && Pos Y >= 0 || stateno = 610 && time > 10  && Pos Y >= 0   
trigger10 = stateno = 620 && movecontact && Pos Y >= 0 || stateno = 620 && time > 12 && Pos Y >= 0
trigger11 = stateno = 600 && movecontact && Pos Y >= 0 || stateno = 600 && time > 0 && Pos Y >= 0
trigger12 = stateno = 641 && movecontact && Pos Y >= 0 || stateno = 641 && time > 7 && Pos Y >= 0 
trigger13 = stateno = 640 && movecontact && Pos Y >= 0 || stateno = 640 && time > 7 && Pos Y >= 0
trigger14 = stateno = 650 && movecontact && Pos Y >= 0 || stateno = 650 && time > 21 && Pos Y >= 0
trigger15 = stateno = 630 && movecontact && Pos Y >= 0 || stateno = 630 && time > 12 && Pos Y >= 0
trigger16 = stateno = 1000 && time > 10 
trigger17 = stateno = 1100 && time > 10

;---------------------------------------------------------------------------
[State -1, Meteor Bullet - Up]
type = ChangeState
value = 1510
triggerall = command = "QCB_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact || stateno = 210 && time > 10     
trigger3 = stateno = 220 && movecontact || stateno = 220 && time > 12
trigger4 = stateno = 200 && movecontact || stateno = 200 && time > 0
trigger5 = stateno = 400 && movecontact || stateno = 400 && time > 0
trigger6 = stateno = 241 && movecontact || stateno = 241 && time > 7 
trigger7 = stateno = 240 && movecontact || stateno = 240 && time > 7  
trigger8 = stateno = 250 && movecontact || stateno = 250 && time > 21
trigger9 = stateno = 610 && movecontact && Pos Y >= 0 || stateno = 610 && time > 10  && Pos Y >= 0   
trigger10 = stateno = 620 && movecontact && Pos Y >= 0 || stateno = 620 && time > 12 && Pos Y >= 0
trigger11 = stateno = 600 && movecontact && Pos Y >= 0 || stateno = 600 && time > 0 && Pos Y >= 0
trigger12 = stateno = 641 && movecontact && Pos Y >= 0 || stateno = 641 && time > 7 && Pos Y >= 0 
trigger13 = stateno = 640 && movecontact && Pos Y >= 0 || stateno = 640 && time > 7 && Pos Y >= 0
trigger14 = stateno = 650 && movecontact && Pos Y >= 0 || stateno = 650 && time > 21 && Pos Y >= 0
trigger15 = stateno = 630 && movecontact && Pos Y >= 0 || stateno = 630 && time > 12 && Pos Y >= 0
trigger16 = stateno = 1000 && time > 10 
trigger17 = stateno = 1100 && time > 10

;---------------------------------------------------------------------------
[State -1, Aerial Meteor Bullet]
type = ChangeState
value = 1550
triggerall = command = "QCF_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1 || stateno = 610 && time > 10  && Pos Y <= -1     
trigger3 = stateno = 620 && movecontact && Pos Y <= -1 || stateno = 620 && time > 12 && Pos Y <= -1     
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 || stateno = 600 && time > 0  && Pos Y <= -1     
trigger5 = stateno = 641 && movecontact && Pos Y <= -1 || stateno = 641 && time > 7  && Pos Y <= -1       
trigger6 = stateno = 640 && movecontact && Pos Y <= -1 || stateno = 640 && time > 7  && Pos Y <= -1      
trigger7 = stateno = 650 && movecontact && Pos Y <= -1 || stateno = 650 && time > 21  && Pos Y <= -1     
trigger8 = stateno = 230 && movecontact || stateno = 230 && time > 12  && Pos Y <= -1     
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 || stateno = 630 && time > 12  && Pos Y <= -1  
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1  

;---------------------------------------------------------------------------
[State -1, Aerial Meteor Bullet - Down]
type = ChangeState
value = 1560
triggerall = command = "QCB_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1 || stateno = 610 && time > 10  && Pos Y <= -1     
trigger3 = stateno = 620 && movecontact && Pos Y <= -1 || stateno = 620 && time > 12 && Pos Y <= -1     
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 || stateno = 600 && time > 0  && Pos Y <= -1     
trigger5 = stateno = 641 && movecontact && Pos Y <= -1 || stateno = 641 && time > 7  && Pos Y <= -1       
trigger6 = stateno = 640 && movecontact && Pos Y <= -1 || stateno = 640 && time > 7  && Pos Y <= -1      
trigger7 = stateno = 650 && movecontact && Pos Y <= -1 || stateno = 650 && time > 21  && Pos Y <= -1     
trigger8 = stateno = 230 && movecontact || stateno = 230 && time > 12  && Pos Y <= -1     
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 || stateno = 630 && time > 12  && Pos Y <= -1  
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1 

;---------------------------------------------------------------------------
;Explosive Potion - Into the Air
[State -1, Explosive Potion - Into the Air]
type = ChangeState
value = 1600
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "QCB_y"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact || stateno = 210 && time > 10     
trigger3 = stateno = 220 && movecontact || stateno = 220 && time > 12
trigger4 = stateno = 200 && movecontact || stateno = 200 && time > 0
trigger5 = stateno = 400 && movecontact || stateno = 400 && time > 0
trigger6 = stateno = 241 && movecontact || stateno = 241 && time > 7 
trigger7 = stateno = 240 && movecontact || stateno = 240 && time > 7  
trigger8 = stateno = 250 && movecontact || stateno = 250 && time > 21
trigger9 = stateno = 610 && movecontact && Pos Y >= 0 || stateno = 610 && time > 10  && Pos Y >= 0   
trigger10 = stateno = 620 && movecontact && Pos Y >= 0 || stateno = 620 && time > 12 && Pos Y >= 0
trigger11 = stateno = 600 && movecontact && Pos Y >= 0 || stateno = 600 && time > 0 && Pos Y >= 0
trigger12 = stateno = 641 && movecontact && Pos Y >= 0 || stateno = 641 && time > 7 && Pos Y >= 0 
trigger13 = stateno = 640 && movecontact && Pos Y >= 0 || stateno = 640 && time > 7 && Pos Y >= 0
trigger14 = stateno = 650 && movecontact && Pos Y >= 0 || stateno = 650 && time > 21 && Pos Y >= 0
trigger15 = stateno = 630 && movecontact && Pos Y >= 0 || stateno = 630 && time > 12 && Pos Y >= 0
trigger16 = stateno = 215 && movecontact   
trigger17 = stateno = 225 && movecontact

;---------------------------------------------------------------------------
;Explosive Potion - Into the Front
[State -1, Explosive Potion - Into the Front]
type = ChangeState
value = 1610
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "QCB_x"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact || stateno = 210 && time > 10     
trigger3 = stateno = 220 && movecontact || stateno = 220 && time > 12
trigger4 = stateno = 200 && movecontact || stateno = 200 && time > 0
trigger5 = stateno = 400 && movecontact || stateno = 400 && time > 0
trigger6 = stateno = 241 && movecontact || stateno = 241 && time > 7 
trigger7 = stateno = 240 && movecontact || stateno = 240 && time > 7  
trigger8 = stateno = 250 && movecontact || stateno = 250 && time > 21
trigger9 = stateno = 610 && movecontact && Pos Y >= 0 || stateno = 610 && time > 10  && Pos Y >= 0   
trigger10 = stateno = 620 && movecontact && Pos Y >= 0 || stateno = 620 && time > 12 && Pos Y >= 0
trigger11 = stateno = 600 && movecontact && Pos Y >= 0 || stateno = 600 && time > 0 && Pos Y >= 0
trigger12 = stateno = 641 && movecontact && Pos Y >= 0 || stateno = 641 && time > 7 && Pos Y >= 0 
trigger13 = stateno = 640 && movecontact && Pos Y >= 0 || stateno = 640 && time > 7 && Pos Y >= 0
trigger14 = stateno = 650 && movecontact && Pos Y >= 0 || stateno = 650 && time > 21 && Pos Y >= 0
trigger15 = stateno = 630 && movecontact && Pos Y >= 0 || stateno = 630 && time > 12 && Pos Y >= 0
trigger16 = stateno = 215 && movecontact   
trigger17 = stateno = 225 && movecontact

;---------------------------------------------------------------------------
;Explosive Potion - Long Throw
[State -1, Explosive Potion - Long Throw]
type = ChangeState
value = 1620
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "QCB_z"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0 
trigger18 = stateno = 1600 && time > 12 
trigger19 = stateno = 1610 && time > 12 
trigger20 = stateno = 1000 && time > 10 
trigger21 = stateno = 1100 && time > 10

;---------------------------------------------------------------------------
[State -1, Aerial Explosive Potion - Down Below]
type = ChangeState
value = 1650
triggerall = command = "QCB_y"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1 || stateno = 610 && time > 10  && Pos Y <= -1     
trigger3 = stateno = 620 && movecontact && Pos Y <= -1 || stateno = 620 && time > 12 && Pos Y <= -1     
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 || stateno = 600 && time > 0  && Pos Y <= -1     
trigger5 = stateno = 641 && movecontact && Pos Y <= -1 || stateno = 641 && time > 7  && Pos Y <= -1       
trigger6 = stateno = 640 && movecontact && Pos Y <= -1 || stateno = 640 && time > 7  && Pos Y <= -1      
trigger7 = stateno = 650 && movecontact && Pos Y <= -1 || stateno = 650 && time > 21  && Pos Y <= -1     
trigger8 = stateno = 230 && movecontact || stateno = 230 && time > 12  && Pos Y <= -1     
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 || stateno = 630 && time > 12  && Pos Y <= -1 

;---------------------------------------------------------------------------
[State -1, Aerial Explosive Potion - Into the Front]
type = ChangeState
value = 1660
triggerall = command = "QCB_x"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1 || stateno = 610 && time > 10  && Pos Y <= -1     
trigger3 = stateno = 620 && movecontact && Pos Y <= -1 || stateno = 620 && time > 12 && Pos Y <= -1     
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 || stateno = 600 && time > 0  && Pos Y <= -1     
trigger5 = stateno = 641 && movecontact && Pos Y <= -1 || stateno = 641 && time > 7  && Pos Y <= -1       
trigger6 = stateno = 640 && movecontact && Pos Y <= -1 || stateno = 640 && time > 7  && Pos Y <= -1      
trigger7 = stateno = 650 && movecontact && Pos Y <= -1 || stateno = 650 && time > 21  && Pos Y <= -1     
trigger8 = stateno = 230 && movecontact || stateno = 230 && time > 12  && Pos Y <= -1     
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 || stateno = 630 && time > 12  && Pos Y <= -1 

;---------------------------------------------------------------------------
[State -1, Aerial Explosive Potion - Long Throw]
type = ChangeState
value = 1670
triggerall = command = "QCB_z"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger12 = stateno = 1650 && time > 12 
trigger13 = stateno = 1660 && time > 12 

;---------------------------------------------------------------------------
;Starfall
[State -1, Starfall]
type = ChangeState
value = 1700
triggerall = var(59) != 1
triggerall = var(40) > 199
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = command != "QCB_a"
triggerall = command != "QCF_a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12

;---------------------------------------------------------------------------
[State -1, Aerial Starfall]
type = ChangeState
value = 1750
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = command != "QCB_a"
triggerall = command != "QCF_a"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = var(40) > 199
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger12 = stateno = 1650 && time > 12 
trigger13 = stateno = 1660 && time > 12 

;---------------------------------------------------------------------------
;Occult - Mysterious Meteorite
[State -1, Occult - Mysterious Shooting Star]
type = ChangeState
value = 2000
triggerall = numexplod(22020) = 0
triggerall = command = "b"
triggerall = command != "~D, D, b"
triggerall = command != "QCB_b"
triggerall = command != "QCF_b"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = var(59) != 1
triggerall = !AIlevel
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 610 && movecontact && Pos Y <= -1      
trigger25 = stateno = 620 && movecontact && Pos Y <= -1
trigger26 = stateno = 600 && movecontact && Pos Y <= -1 
trigger27 = stateno = 641 && movecontact && Pos Y <= -1   
trigger28 = stateno = 640 && movecontact && Pos Y <= -1  
trigger29 = stateno = 650 && movecontact && Pos Y <= -1
trigger30 = stateno = 230 && movecontact 
trigger31 = stateno = 630 && movecontact && Pos Y <= -1 
trigger32 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger33 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger34 = stateno = 1650 && time > 12 
trigger35 = stateno = 1660 && time > 12 
trigger36 = stateno = 1200 && movecontact
trigger37 = stateno = 1250 && movecontact
trigger38 = stateno = 1300 && movecontact
trigger39 = stateno = 1310 && movecontact
trigger40 = stateno = 1350 && movecontact
trigger41 = stateno = 1360 && movecontact
trigger42 = stateno = 1400 && movecontact
trigger43 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger44 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger45 = stateno = 1550 && anim = 1501 && animelemtime(4) >= 0 
trigger46 = stateno = 1560 && anim = 1501 && animelemtime(4) >= 0 
trigger47 = stateno = 1600 && time > 12 
trigger48 = stateno = 1610 && time > 12 
trigger49 = stateno = 1620 && time > 18  
trigger50 = stateno = 1670 && time > 18 
trigger51 = stateno = 1700 && time > 30
trigger52 = stateno = 1750 && time > 30

;---------------------------------------------------------------------------
[State -1, Super - Bomb]
type = ChangeState
value = 3000
triggerall = command = "~D, D, b"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 999
triggerall = numhelper(3004) = 0
triggerall = numexplod(30000) = 0 
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 1200 && movecontact
trigger25 = stateno = 1300 && movecontact
trigger26 = stateno = 1620 && time > 18 
trigger27 = stateno = 1700 && time > 30 
trigger28 = stateno = [120,155]
trigger28 = statetype != A

;---------------------------------------------------------------------------
[State -1, Aerial Super - Bomb]
type = ChangeState
value = 3050
triggerall = command = "~D, D, b"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 999
triggerall = numhelper(3004) = 0
triggerall = numexplod(30000) = 0 
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger12 = stateno = 1650 && time > 12 
trigger13 = stateno = 1660 && time > 12 
trigger14 = stateno = 1310 && movecontact
trigger15 = stateno = 1350 && movecontact
trigger16 = stateno = 1360 && movecontact
trigger17 = stateno = 1250 && movecontact
trigger18 = stateno = 1400 && movecontact
trigger19 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger20 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger21 = stateno = 1550 && anim = 1501 && animelemtime(4) >= 0 
trigger22 = stateno = 1560 && anim = 1501 && animelemtime(4) >= 0 
trigger23 = stateno = 1670 && time > 18 
trigger24 = stateno = 1750 && time > 30
trigger25 = stateno = [120,155]
trigger25 = statetype = A

;---------------------------------------------------------------------------
[State -1, Super - Stellar Journey]
type = ChangeState
value = 3100
triggerall = command = "holdfwd"
triggerall = command = "b"
triggerall = command != "QCF_b"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 999 
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 1200 && movecontact
trigger25 = stateno = 1300 && movecontact
trigger26 = stateno = 1620 && time > 18 
trigger27 = stateno = 1700 && time > 30 

;---------------------------------------------------------------------------
[State -1, Super - Stellar Illusion]
type = ChangeState
value = 3200
triggerall = command = "holdback"
triggerall = command = "b"
triggerall = command != "QCB_b"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 999
triggerall = numhelper(3210) = 0
trigger1 = statetype != A && ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 1200 && movecontact
trigger25 = stateno = 1300 && movecontact
trigger26 = stateno = 1620 && time > 18 
trigger27 = stateno = 1700 && time > 30 

;---------------------------------------------------------------------------
[State -1, Aerial Super - Stellar Illusion]
type = ChangeState
value = 3250
triggerall = command = "holdback"
triggerall = command = "b"
triggerall = command != "QCB_b"
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 999
triggerall = numhelper(3210) = 0
trigger1 = statetype = A && ctrl
trigger2 = stateno = 610 && movecontact && Pos Y <= -1      
trigger3 = stateno = 620 && movecontact && Pos Y <= -1
trigger4 = stateno = 600 && movecontact && Pos Y <= -1 
trigger5 = stateno = 641 && movecontact && Pos Y <= -1   
trigger6 = stateno = 640 && movecontact && Pos Y <= -1  
trigger7 = stateno = 650 && movecontact && Pos Y <= -1
trigger8 = stateno = 230 && movecontact 
trigger9 = stateno = 630 && movecontact && Pos Y <= -1 
trigger10 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger11 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger12 = stateno = 1650 && time > 12 
trigger13 = stateno = 1660 && time > 12 
trigger14 = stateno = 1310 && movecontact
trigger15 = stateno = 1350 && movecontact
trigger16 = stateno = 1360 && movecontact
trigger17 = stateno = 1250 && movecontact
trigger18 = stateno = 1400 && movecontact
trigger19 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger20 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger21 = stateno = 1550 && anim = 1501 && animelemtime(4) >= 0 
trigger22 = stateno = 1560 && anim = 1501 && animelemtime(4) >= 0 
trigger23 = stateno = 1670 && time > 18 
trigger24 = stateno = 1750 && time > 30

;---------------------------------------------------------------------------
;Super - Master Spark
[State -1, Super - Master Spark]
type = ChangeState
value = 3300
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 1999
triggerall = command = "QCB_b"
triggerall = command != "FF_b"
triggerall = command != "upper_b"
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 610 && movecontact && Pos Y <= -1      
trigger25 = stateno = 620 && movecontact && Pos Y <= -1
trigger26 = stateno = 600 && movecontact && Pos Y <= -1 
trigger27 = stateno = 641 && movecontact && Pos Y <= -1   
trigger28 = stateno = 640 && movecontact && Pos Y <= -1  
trigger29 = stateno = 650 && movecontact && Pos Y <= -1
trigger30 = stateno = 230 && movecontact 
trigger31 = stateno = 630 && movecontact && Pos Y <= -1 
trigger32 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger33 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger34 = stateno = 1650 && time > 12 
trigger35 = stateno = 1660 && time > 12 
trigger36 = stateno = 1200 && movecontact
trigger37 = stateno = 1250 && movecontact
trigger38 = stateno = 1300 && movecontact
trigger39 = stateno = 1310 && movecontact
trigger40 = stateno = 1350 && movecontact
trigger41 = stateno = 1360 && movecontact
trigger42 = stateno = 1400 && movecontact
trigger43 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger44 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger45 = stateno = 1550 && anim = 1501 && animelemtime(4) >= 0 
trigger46 = stateno = 1560 && anim = 1501 && animelemtime(4) >= 0 
trigger47 = stateno = 1600 && time > 12 
trigger48 = stateno = 1610 && time > 12 
trigger49 = stateno = 1620 && time > 18  
trigger50 = stateno = 1670 && time > 18 
trigger51 = stateno = 1700 && time > 30
trigger52 = stateno = 1750 && time > 30

;---------------------------------------------------------------------------
;Super - Blazing Star
[State -1, Super - Blazing Star]
type = ChangeState
value = 3400
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 1999
triggerall = command = "QCF_b"
triggerall = command != "FF_b"
triggerall = command != "upper_b"
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 610 && movecontact && Pos Y <= -1      
trigger25 = stateno = 620 && movecontact && Pos Y <= -1
trigger26 = stateno = 600 && movecontact && Pos Y <= -1 
trigger27 = stateno = 641 && movecontact && Pos Y <= -1   
trigger28 = stateno = 640 && movecontact && Pos Y <= -1  
trigger29 = stateno = 650 && movecontact && Pos Y <= -1
trigger30 = stateno = 230 && movecontact 
trigger31 = stateno = 630 && movecontact && Pos Y <= -1 
trigger32 = stateno = 1050 && time > 10 && Pos Y <= -1 
trigger33 = stateno = 1150 && time > 10 && Pos Y <= -1
trigger34 = stateno = 1650 && time > 12 
trigger35 = stateno = 1660 && time > 12 
trigger36 = stateno = 1200 && movecontact
trigger37 = stateno = 1250 && movecontact
trigger38 = stateno = 1300 && movecontact
trigger39 = stateno = 1310 && movecontact
trigger40 = stateno = 1350 && movecontact
trigger41 = stateno = 1360 && movecontact
trigger42 = stateno = 1400 && movecontact
trigger43 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger44 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger45 = stateno = 1550 && anim = 1501 && animelemtime(4) >= 0 
trigger46 = stateno = 1560 && anim = 1501 && animelemtime(4) >= 0 
trigger47 = stateno = 1600 && time > 12 
trigger48 = stateno = 1610 && time > 12 
trigger49 = stateno = 1620 && time > 18  
trigger50 = stateno = 1670 && time > 18 
trigger51 = stateno = 1700 && time > 30
trigger52 = stateno = 1750 && time > 30

;---------------------------------------------------------------------------
[State -1, Ultimate - Sun Grazer]
type = ChangeState
value = 4000
triggerall = command = "QCB_c"
triggerall = var(57) < 1
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = power > 2999
trigger1 = statetype != A &&ctrl
trigger2 = stateno = 210 && movecontact      
trigger3 = stateno = 220 && movecontact
trigger4 = stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 241 && movecontact    
trigger7 = stateno = 240 && movecontact   
trigger8 = stateno = 250 && movecontact
trigger9 = stateno = 215 && movecontact   
trigger10 = stateno = 225 && movecontact
trigger11 = stateno = 610 && movecontact && Pos Y >= 0     
trigger12 = stateno = 620 && movecontact && Pos Y >= 0 
trigger13 = stateno = 600 && movecontact && Pos Y >= 0 
trigger14 = stateno = 641 && movecontact && Pos Y >= 0 
trigger15 = stateno = 640 && movecontact && Pos Y >= 0   
trigger16 = stateno = 650 && movecontact && Pos Y >= 0 
trigger17 = stateno = 630 && movecontact && Pos Y >= 0
trigger18 = stateno = 1000 && time > 10 
trigger19 = stateno = 1050 && time > 10 && Pos Y >= 0
trigger20 = stateno = 1100 && time > 10
trigger21 = stateno = 1150 && time > 10 && Pos Y >= 0
trigger22 = stateno = 1600 && time > 12 
trigger23 = stateno = 1610 && time > 12
trigger24 = stateno = 1200 && movecontact
trigger25 = stateno = 1300 && movecontact
trigger26 = stateno = 1310 && movecontact
trigger27 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger28 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger29 = stateno = 1600 && time > 12 
trigger30 = stateno = 1610 && time > 12 
trigger31 = stateno = 1620 && time > 18  
trigger32 = stateno = 1700 && time > 30

;---------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 41
triggerall = command = "super_jump"
triggerall = var(59) != 1
triggerall = !AIlevel
trigger1 = stateno = 1000 && time > 12
trigger2 = stateno = 1050 && time > 12 && Pos Y >= 0
trigger3 = stateno = 1100 && time > 12
trigger4 = stateno = 1150 && time > 12 && Pos Y >= 0
trigger5 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger6 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger7 = stateno = 1600 && time > 12 
trigger8 = stateno = 1610 && time > 12 
trigger9 = stateno = 1620 && time > 18 
trigger10 = statetype != A && ctrl

;---------------------------------------------------------------------------
[State -1, Extra Jump Controls]
type = ChangeState
value = 40
triggerall = command = "holdup"
triggerall = command != "super_jump" 
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = prevstateno != [102,103]
trigger1 = stateno = 1000 && time > 12
trigger2 = stateno = 1050 && time > 12 && Pos Y >= 0
trigger3 = stateno = 1100 && time > 12
trigger4 = stateno = 1150 && time > 12 && Pos Y >= 0
trigger5 = stateno = 1500 && anim = 1501 && animelemtime(4) >= 0 
trigger6 = stateno = 1510 && anim = 1501 && animelemtime(4) >= 0 
trigger7 = stateno = 1600 && time > 12 
trigger8 = stateno = 1610 && time > 12 
trigger9 = stateno = 1620 && time > 18 

;---------------------------------------------------------------------------
[State -1, Ground Recover Roll Forwards]
type = ChangeState
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = alive          
triggerall = stateno != [710,712]  
triggerall = stateno = 5110 || stateno = 5150 
trigger1 = command = "c"
trigger1 = command = "holdfwd"                          
value = 710 

;---------------------------------------------------------------------------
[State -1, Ground Recover Roll Backwards]
type = ChangeState
triggerall = var(59) != 1
triggerall = !AIlevel
triggerall = stateno = 5110 || stateno = 5150  
triggerall = alive 
triggerall = stateno != [710,712]    
trigger1 = command = "c"
trigger1 = command = "holdback"                       
value = 711

;---------------------------------------------------------------------------
[State -1, Star Warp]
type = ChangeState
value = 800
triggerall = command = "c" && command != "holddown" 
triggerall = statetype != A
triggerall = command != "DD_c"
triggerall = command != "QCB_c"
triggerall = var(59) != 1
;triggerall = helper(50000),anim != 99999
trigger1 = ctrl || stateno = 100

;---------------------------------------------------------------------------
[State -1, Air Star Warp]
type = ChangeState
value = 810
triggerall = (var(55)<5 && command = "c" && command != "holddown")
triggerall = statetype = A
triggerall = command != "DD_c"
triggerall = command != "QCB_c"
triggerall = var(59) != 1
triggerall = numexplod(71300) < 1
;triggerall = helper(50000),anim != 99999 
trigger1 = ctrl || stateno = 100