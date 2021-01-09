// Read this dialogue file FIRST.

// As for Branwen's scripts, I recommend to start with O#BranS.baf.

BEGIN O#BRAN 

// This is the file we have assigned to Branwen in her .cre file. She will use it when you find her in the Bridge District.
// Each file begins with a BEGIN FILENAME, so that the game can recognize it.

// If you've registered your prefix here: http://forums.blackwyrmlair.net/index.php?showtopic=113 then you can already start mass-replacing O#Bran with your prefix(let's say it's BB)+your NPC name(Anna, then replace O#Bran with BBAnna).

// Every dialogue file is just a list of dialogues. If you open Infinity Explorer and choose to open Anomen's or Cernd's dialogue file, you will see that list in an easy-to-read format. 

// Before we start, PLEASE, READ MY TUTORIALS at Pocket Plane about .d format for real beginners, and another about quick and simple NPC banters. Actually, it's kind of necessary.

// This dialogue will trigger first, because it's first in the list. 
// There are two types of dialogue: SAY and CHAIN. I use CHAIN here, because I want several people to talk. If it's just you and Branwen, it will be a SAY - see below.

// We don't want this dialogue to trigger again, so we set O#BranMet to one. Do this to all your lovetalks and NPC banters.

// Remember CD_STATE_NOTVALID from Setup-Branwen.tp2? Here it comes. If you want your NPCs to interject, use three conditions: InParty(means in party and not dead), InMyArea("Name") and !StateCheck("Name",CD_STATE_NOTVALID)
// b1 is a state name. You can use the same name, b1 in another file, but here, in O#Bran, all names must be unique, so I use b1, b1.1, b2 and so on. You cannot link b1 to b1 again, or the same dialogue will play over and over!

CHAIN IF ~Global("O#BranMet","GLOBAL",0)~ THEN O#BRAN b1 
@0 /* <CHARNAME>! By Tempus, 'tis good to see you again! I feared you had perished! */
DO ~SetGlobal("O#BranMet","GLOBAL",1)~ 
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @1 /* I remember you, elg'caress. You were such an amusing statue with your mouth forever drooling. Pity someone had set you free. */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @2 /* Little Branwen is back! Look, Boo, isn't it a proper reunion? Minsc and Boo and Branwen and friends! */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @3 /* This one is useless, <CHARNAME>. Don't you remember how she got trapped in Nashkel? (Oh, fine, fine. But don't let her near my scrolls!) */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @4 /* Well met, Branwen. It is good to see you once more. */
== O#BRAN @5 /* I've learnt about mystery murders in this district and I've come to investigate. I am glad indeed that I've met you here! 'Twould be an honor to travel with you again. */
END 
++ @6 /* It would be my pleasure, Branwen. */ EXTERN O#BRAN b1.1 
++ @7 /* Not at this time. */  EXTERN O#BRAN b1.2

// CHAIN requires EXTERN DIALOGUENAME, because the game needs to know which dialogue file to go to. It could be EXTERN VICONIJ, and then Viconia would speak.

CHAIN O#BRAN b1.1
@8 /* I am glad to be part of your war party. I will not make you regret your decision! */
END
+ ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @9 /* I should probably tell you that I am going to rescue Imoen from the Cowled Wizards. */ EXTERN O#BRAN b1.3
+ ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @10 /* I am going to find Irenicus, the mage who kidnapped and tortured me. */ EXTERN O#BRAN b1.4
++ @11 /* All right, let's go. */ EXTERN O#BRAN b1.join

CHAIN O#BRAN b1.2
@12 /* It's an insult to my honor to refuse my services, but the choice is yours. */
EXIT

CHAIN O#BRAN b1.3
@13 /* You have saved me, and for that I owe you my life. I am indebted to you, and, by Tempus, I leave no debt unpaid! Let us save Imoen together. */
END
IF ~~ EXTERN O#BRAN b1.join 

CHAIN O#BRAN b1.4
@14 /* Then I shall join you and bring the favor of the Lord of Battles upon us. Let the wizard tremble in his lair! */
END
IF ~~ EXTERN O#BRAN b1.join 

CHAIN O#BRAN b1.join
@15 /* Come, tell me of your new adventures as we walk. */
DO ~JoinParty()~ // When Branwen joins, she will use her O#BranJ dialogue - J for "joined"
EXIT

// If you're going to end the CHAIN, use EXIT. If you have replies or you want to move to another state, it's END. 

// APPEND is a command we always use, if we want to switch from CHAIN to SAY. We'll have to use END in the end, because APPEND is like a begin.

APPEND O#BRAN

// This dialogue will trigger every time you talk to Branwen, if you didn't take her in your party. Remember O#BranMet? It's at 1 now. We're not going to set it to 2 here: we'll need this dialogue if you click on Branwen again.

IF ~Global("O#BranMet","GLOBAL",1)~ b2 
SAY @16 /* Perhaps you have changed your mind, and now need my skills? */
++ @17 /* I have indeed. Welcome aboard. */ + b1.1
++ @18 /* Not at the moment. */ + b1.2
END 

// Note that b2 is another unique dialogue name. Also note that we've written b1.1 and b1.2 already - look above. Seems like cheating, doesn't it? But it's very convenient.

// CHAIN and SAY are different. There's no SAY in CHAIN. CHAIN uses END before replies, SAY - after replies. 
// SAY differs from CHAIN in other ways, too: instead of EXIT, it's IF ~~ EXIT and then END.
// And, yes, you're going to mix SAY and CHAIN at some point, and, yes, syntax errors are frustrating.

END // This is an end to APPEND
