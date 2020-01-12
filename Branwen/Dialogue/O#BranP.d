// Read this dialogue file second, after O#Bran.d.

BEGIN O#BranP

// This is the file we use when Branwen leaves the party. She can leave the party in two cases: first, she's VERY unhappy with the player's actions, and second, the player kicked her out.
// I use SAY here, since there is no one else but the player and Branwen.

// Just copy this and use your own filenames and variable names. Don't forget your very own modding prefix!

IF ~Global("O#BranKickedOut","GLOBAL",0) HappinessLT(Myself,-299)~ b1
SAY ~By Auril's frozen breath, I am leaving! May Tempus someday show you the error of your ways.~
IF ~~ DO ~EscapeArea()~ EXIT
END

// The player kicks Branwen out. The list of areas is the same for every NPC in the game. Use iesdp.gibberlings3.net to find out what each area code means.

IF ~Global("O#BranKickedOut","GLOBAL",0)~ b2
SAY ~We have fought well and we have fought bravely. Tempus willing, perhaps I will fight at your side again someday.~
++ ~My mistake. Please, don't leave.~ DO ~JoinParty()~ EXIT
+ ~!AreaCheck("AR0603")
!AreaCheck("AR0410")
!AreaCheck("AR0411")
!AreaCheck("AR0412")
!AreaCheck("AR0413")
!AreaCheck("AR0414")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")~ + ~Of course. Wait for me in the Bridge District.~ DO ~SetGlobal("O#BranKickedOut","GLOBAL",1) MoveGlobal("AR0500","O#Bran",[4053.255])~ EXIT 
+ ~!AreaCheck("AR0301")
!AreaCheck("AR0302")
!AreaCheck("AR0303")
!AreaCheck("AR0304")
!AreaCheck("AR0305")
!AreaCheck("AR0306")
!AreaCheck("AR0307")
!AreaCheck("AR0509")
!AreaCheck("AR0510")
!AreaCheck("AR0511")
!AreaCheck("AR1102")
!AreaCheck("AR1107")
!AreaCheck("AR0801")
!AreaCheck("AR0803")~ + ~Just wait for me here.~ DO ~SetGlobal("O#BranKickedOut","GLOBAL",1)~ EXIT
END

// If you have kicked Branwen out and told her to wait right here or in the Bridge District, here's the dialogue she is going to have(remember, O#BranKickedOut is at 1).

IF ~Global("O#BranKickedOut","GLOBAL",1)~ b3
SAY ~By Tempus, you have returned! Are we to join again and fight as mighty warriors should? Say it is so!~
++ ~I have. Please, join me.~ + b3.1
++ ~Not at the moment.~ + b3.2
END 

IF ~~ b3.1
SAY ~A triumphant day, indeed! I welcome your company once again!~
IF ~~ DO ~SetGlobal("O#BranKickedOut","GLOBAL",0) JoinParty()~ EXIT
END

IF ~~ b3.2
SAY ~Too bad.~
IF ~~ EXIT
END
