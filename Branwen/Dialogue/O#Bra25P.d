// Read this after all SoA dialogue. Start reading with O#Bran.d
// This is a dialogue file for Branwen's kickout in ToB.

BEGIN O#BRA25P

// This code(area codes especially) has been borrowed from the game and altered somewhat.

IF ~Global("O#BranToBKickedOut","GLOBAL",0)~ b1
SAY ~We have fought well and we have fought bravely. Tempus willing, perhaps I will fight at your side again someday.~
++ ~My mistake. Please, don't leave.~ DO ~JoinParty()~ EXIT
+ ~AreaCheck("AR4500")~ + ~Just wait for me here.~ DO ~SetGlobal("O#BranToBKickedOut","GLOBAL",1) MoveToPointNoInterrupt([1717.1717]) Face(0)~ EXIT
+ ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + ~Just wait for me here.~ DO ~SetGlobal("O#BranToBKickedOut","GLOBAL",1)~ EXIT
+ ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + ~I am sending you to the pocket plane. Wait for me there.~ DO ~SetGlobal("O#BranToBKickedOut","GLOBAL",1)
CreateVisualEffectObject("spdimndr",Myself)
Wait(2)
MoveBetweenAreas("AR4500",[1717.1717],0)~ EXIT // Naturally, I recommend you to choose another set of coordinates for your NPC. This is where they'll wait for PC in the Pocket Plane.
END

// Branwen is not in party, waiting for you.

IF ~Global("O#BranToBKickedOut","GLOBAL",1)~ b2
SAY ~By Tempus, you have returned! Are we to join again and fight as mighty warriors should? Say it is so!~
++ ~I have. Please, join me.~ + b2.1
++ ~Not at the moment.~ + b2.2
END 

IF ~~ b2.1
SAY ~A triumphant day, indeed! I welcome your company once again!~
IF ~~ DO ~SetGlobal("O#BranToBKickedOut","GLOBAL",0) JoinParty()~ EXIT
END

IF ~~ b2.2
SAY ~Too bad.~
IF ~~ EXIT
END

