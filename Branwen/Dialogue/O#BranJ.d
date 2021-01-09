// Read this dialogue file fourth, after O#Bran.d, O#BranP.d and O#BBran.d.

BEGIN O#BRANJ

// This is Branwen's main dialogue file after she joins the party. Whenever she interrupts Aran Linvail, confesses her love to CHARNAME or comments at the Tree of Life, she speaks from this very file.
// Here you will find all these annoying-to-code-but necessary things like the Slayer Transformation interjections, Entering Hell interjection, gypsy's reaction in Trademeet, Crazy Celvan and other things. Brace yourself.

// Branwen's friendship/romance/lovetalks are way below, if you want to start with these.

// Gypsy in Trademeet, predicting Branwen's fortune. The condition means "If you're not talking to CHARNAME and the character is Branwen".

// You can read Weidu readme at Weidu.org for more examples. Or just steal this code and forget it all like a bad dream... until you suddenly need it again.

EXTEND_BOTTOM TRGYP02 2
IF ~!InPartySlot(LastTalkedToBy,0) Name("O#Bran",LastTalkedToBy)~ EXTERN TRGYP02 g1
END

CHAIN TRGYP02 g1
@0 /* You are a noble woman, but new trials are ahead. Brace yourself, Hand of Tempus, for your friends will need you. */
== O#BRANJ @1 /* Thank you, good woman. I am always ready. */ 
EXIT

// Branwen was already talking here, so we didn't need InMyArea/CD_STATE_NOTVALID checks.

// Crazy Celvan - an obligatory bad limerick. Vanilla game uses "AR0300" instead of "GLOBAL", so let's use an area variable, too.
// Here you can see WEIGHT command. It means that whatever other dialogues Celvan has, this one will be triggered first if Branwen is around. Of course, the dialogue below can be triggered only once.

CHAIN IF WEIGHT #-1 
~InParty("O#Bran")
See("O#Bran")
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranReactionCelvan","AR0300",0)~ THEN CELVAN c1
@2 /* There was once a lady so fair
Spent whole mornings combing her hair.
But orcs swiftly came,
And down her mace came,
Because her god Tempus was there! */
DO ~SetGlobal("O#BranReactionCelvan","AR0300",1)~
== O#BRANJ @3 /* Who was it about? Who? Me? */
END CELVAN 1

// Obligatory comments for Madame Nin's brothel in the Copper Coronet

CHAIN IF WEIGHT #-1
~NumTimesTalkedTo(0) 
Name("O#Bran",LastTalkedToBy)
!Global("MadamUpset","GLOBAL",1)~ THEN MADAM O#BranReactionMadam1
@4 /* Greetings, my lady. I am Madame Nin, and I am here to ensure you are pleasantly accompanied. Are you interested in companionship, my lady? */
== O#BRANJ @5 /* Not in the sort you're proposing. Excuse me. */
EXIT

CHAIN IF WEIGHT #-1
~!NumTimesTalkedTo(0)
Name("O#Bran",LastTalkedToBy)
!Global("MadamUpset","GLOBAL",1)~ THEN MADAM O#BranReactionMadam2
@6 /* So... do you wish a companion for the evening, then? */
== O#BRANJ @7 /* Hmph! */
EXIT

// THIS IS IMPORTANT: if you use INTERJECT, you must understand that you're cutting in the game's dialogue, replacing someone else's reaction. So my recommendation is NEVER to do it, except in one or two cases below.
// On the other hand, using I_C_T, which means INTERJECT_COPY_TRANS, is fine and good.

// ALSO, ALL INTERJECT and I_C_T commands require a UNIQUE PREFIXED NAME, because they set a UNIQUE PREFIXED VARIABLE.
// This is why I don't write INTERJECT Player1 3 p3, but INTERJECT Player1 3 O#BranSpellholdDizzy0.
// Weidu will create a variable with the same name. Same goes for your mod.

// Yoshimo's betrayal

I_C_T YOSHJ 113 O#BranYOSHJ113
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @8 /* Betrayal... I do not understand, Yoshimo. I just don't. */
END

// Spellhold, right after the player loses his or her soul.

INTERJECT Player1 3 O#BranSpellholdDizzy0
== O#BRANJ IF ~InParty("O#Bran") Range("O#Bran",15) !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN
@9 /* Are you all right? What has Irenicus done to you? I swear, I'll kill him! */
END
++ @10 /* I'm all right. Don't worry. */ EXTERN O#BRANJ pl1.1
++ @11 /* I felt strange, like I wasn't in control. */ EXTERN O#BRANJ pl1.2
++ @12 /* Don't coddle me! */ EXTERN O#BRANJ pl1.1

CHAIN O#BRANJ pl1.1
@13 /* All right. But be wary. No one wants to lose you. */
EXIT

CHAIN O#BRANJ pl1.2
@14 /* Really? That's disturbing. But I'm here, <CHARNAME>. All your friends are with you. */
EXIT

// Player becomes the Slayer for the first time.

I_C_T PLAYER1 5 O#BranFirstSlayerChange1 
== O#BRANJ IF ~InParty("O#Bran") See("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @15 /* Uh-oh. Tempus would be... impressed, I think? But better not do it again. */
END

// Lonk is dead, inmates are free, time to battle Irenicus!

I_C_T PLAYER1 15 O#BranLonkIsDead1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @16 /* Quickly, tell them what to do, or they'll turn on us! */
END

// This is the dialogue for the Tree of Life.
// Non-romanced Branwen:

EXTEND_BOTTOM PLAYER1 33
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranTreeOfLife","GLOBAL",0) !Global("O#BranRomanceActive","GLOBAL",2)~ EXTERN PLAYER1 pl2
END

CHAIN PLAYER1 pl2
@17 /* Branwen, a fierce priestess from the North. She looks at you with a fond smile, but the battle hammer is firm in her hand. */
DO ~SetGlobal("O#BranTreeOfLife","GLOBAL",1)~
END
++ @18 /* Branwen, this is not your fight. You do not have to follow me. */ EXTERN O#BRANJ pl2.1
++ @19 /* You have done a lot for me, Branwen. You can go home now. */ EXTERN O#BRANJ pl2.1
++ @20 /* Are you ready to follow me? I need you to win. */ EXTERN O#BRANJ pl2.1

CHAIN O#BRANJ pl2.1
@21 /* You saved my life, and you are a friend. We're in this together, and I will remain by your side no matter what. By Tempus' shield! */
END
COPY_TRANS PLAYER1 33 

// COPY_TRANS  means coming back to the main dialogue, so other characters can say their piece. 
// INTERJECT 33 + COPY_TRANS 33 is okay, you can use it almost anywhere. Still, use I_C_T for one-liners - see examples below.

// Romanced Branwen at the Tree of Life:

EXTEND_BOTTOM PLAYER1 33
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranTreeOfLife","GLOBAL",0) Global("O#BranRomanceActive","GLOBAL",2)~ 
EXTERN PLAYER1 pl3
END

CHAIN PLAYER1 pl3
@22 /* Branwen, your comrade in arms and a devoted lover. She is standing still as a statue, listening to the sounds from the next room, but her gaze never leaves your face. */
DO ~SetGlobal("O#BranTreeOfLife","GLOBAL",1)~
END
++ @23 /* Branwen, I -- */ EXTERN O#BRANJ pl3.1

CHAIN O#BRANJ pl3.1
@24 /* Don't even think about leaving me behind. Ahem. But in case it wasn't what you wanted to say, I'm sorry for interrupting. */
= @25 /* 'Tis no use to linger before the battle. Both my sword arm and Tempus' grace are with you, my dear lover. Until the end. */
= @26 /* Come, let's enjoy the grand finale. Irenicus must be shaking with fear within. 'Twill be a pleasure to put my mace to his skull at last! */
END
COPY_TRANS PLAYER1 33

// Tree of Life, Irenicus is dead.

I_C_T PLAYER1 16 O#BranIrenicusIsDead1
== O#BRANJ IF ~InParty("O#Bran") Range("O#Bran",15) !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @27 /* The madman falls, but what of your soul? Has it returned? */
END

// Entering Hell with the rest of the party.

I_C_T PLAYER1 25 O#BranEnteringHell1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @28 /* You always take me to the strangest places. I do not know whether to thank you or curse you. */
END

// Battling Irenicus. There are four identical interjections for four dialogue states.

I_C_T HELLJON 7 O#BranThirdBattleWithIrenicus1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @29 /* You will not escape this time, wizard! We are strong and we have Tempus' favor! */
END

I_C_T HELLJON 8 O#BranThirdBattleWithIrenicus1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @29 /* You will not escape this time, wizard! We are strong and we have Tempus' favor! */
END

I_C_T HELLJON 9 O#BranThirdBattleWithIrenicus1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @29 /* You will not escape this time, wizard! We are strong and we have Tempus' favor! */
END

I_C_T HELLJON 10 O#BranThirdBattleWithIrenicus1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @29 /* You will not escape this time, wizard! We are strong and we have Tempus' favor! */
END

// ROMANCE CONTENT: the second slayer change and Bodhi abduction.

INTERJECT Player1 7 O#BranSecondSlayerChange0
== O#BranJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ THEN @30 /* Can't sleep? No surprise. I'll be glad away to be out of this place, myself. Wait. By Tempus, are you all right? */
END
++ @31 /* Something is happening to me. Run! */ EXTERN O#BranJ O#BranSecondSlayerChange1
++ @32 /* Branwen, I may turn into the Slayer again. */ EXTERN O#BranJ O#BranSecondSlayerChange1
++ @33 /* Fly, you fool! */ EXTERN O#BranJ O#BranSecondSlayerChange1

CHAIN O#BranJ O#BranSecondSlayerChange1
@34 /* You lips move, but I hear nothing. Is it... Oh, no! <CHARNAME>, NO! */
DO ~SetGlobal("O#BranSecondSlayerChange","GLOBAL",1)
ActionOverride(Player1,ReallyForceSpell(Myself,SLAYER_CHANGE))~
EXIT

INTERJECT Player1 10 O#BranSlayerSurvived1
== O#BranJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSecondSlayerChange","GLOBAL",1)~ THEN @35 /* By Tempus' mighty underwear... Gods, you're alive. I was afraid that thing has... had... has... */
== O#BranJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSecondSlayerChange","GLOBAL",1)~ THEN @36 /* Now I'm mumbling like a weeping babe. I'm with you, and together we'll get you back to the right state again. Come on! */
END
IF ~~ EXIT

EXTEND_BOTTOM Player1 10
IF ~Dead("O#Bran") Global("O#BranSecondSlayerChange","GLOBAL",1)~ EXTERN Player1 12
END

// Bodhi abduction. Since Branwen leaves the party temporarily, some of her dialogue moves to O#BRANP.d file. For convenience, I will attach it below after Bodhi's dialogue via APPEND O#BRANP command.

BEGIN O#BRANV // Vampire Branwen in Bodhi's crypt, she talks below, in C6BODHI o#BranAb chain.

// Bodhi's dialogue at the entrance to the Graveyard.

EXTEND_BOTTOM BODHIAMB 5
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2)~ EXTERN BODHIAMB O#BranKidnap
END

CHAIN BODHIAMB O#BranKidnap
@37 /* A lovely priestess of Tempus. You are going to set a fine example for our Bhaalspawn. */
== O#BranJ @38 /* Dream on, creature. */
== BODHIAMB @39 /* I do not need to, Branwen. Darkness calls out to you. Come with me... */
END
IF ~~ DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#BranVC")~ UNSOLVED_JOURNAL @100001 // you can read more about @100001 in English/Setup-Branwen.tra
EXIT

/* Basically, @100001 is a dialogue line. It is replaced with @100001, because Weidu, our "mod program", requires lines like @100001 for journal entries. In "non-traified" dialogue, it looks like this:
CHAIN BODHIAMB O#BranKidnap
@37 /* A lovely priestess of Tempus. You are going to set a fine example for our Bhaalspawn. */
== O#BranJ @38 /* Dream on, creature. */
== BODHIAMB @39 /* I do not need to, Branwen. Darkness calls out to you. Come with me... */
END
IF ~~ DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#BranVC")~ UNSOLVED_JOURNAL ~The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Branwen.  Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible.  I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of the one I love is at stake, as well!~
EXIT
Note that this code is commented, and won't be executed. */

// The following commands add new dialogue to Bodhi's dialogue in the crypt. A_T_T, or ADD_TRANS_TRIGGER prevents Bodhi from entering the fight immediately, if Branwen's a vampire. The rest adds new lines if Branwen was abducted.

A_T_T C6bodhi 21 ~!Global("O#BranVampire","GLOBAL",2)~ DO 0

EXTEND_BOTTOM C6BODHI 21
IF ~Global("O#BranVampire","GLOBAL",2)~ + 23
END

EXTEND_BOTTOM C6BODHI 23
+ ~Global("O#BranVampire","GLOBAL",2)~ + @40 /* You have taken too much already! You will return both Imoen's soul and Branwen! */ EXTERN C6BODHI O#BranAb
+ ~Global("O#BranVampire","GLOBAL",2)~ + @41 /* And you have delivered on that promise. Return Branwen and perhaps I will be merciful. */ EXTERN C6BODHI O#BranAb
+ ~Global("O#BranVampire","GLOBAL",2)~ + @42 /* I would have hunted you for your theft of Branwen alone. She is very important to me. */ EXTERN C6BODHI O#BranAb
+ ~Global("O#BranVampire","GLOBAL",2)~ + @43 /* You place too much confidence in sentiment. The theft of Branwen will not save you. */ EXTERN C6BODHI O#BranAbConf
END

CHAIN C6BODHI O#BranAbConf
@44 /* An interesting ploy, though I am sure her fate will still serve as an example, whether you wish her back or not. */
END
IF ~~ EXTERN C6BODHI O#BranAb

CHAIN C6BODHI O#BranAb
@45 /* Here she is, though I doubt your fumbling could have inspired the loyalty I have taken with a bite and a gaze.  She is mine now, and will do my bidding gladly. */
== O#BRANV @46 /* As you say, mistress. I am your servant in all things. */
== C6BODHI @47 /* She is not even fully turned and yet she is mine to use against you. Doesn't it gall you? I thought it might. */ 
END
IF ~~ EXTERN C6BODHI 28

// Elhan's sages, Oghma, Imnesvale's books, obligatory extra dialogue options. O#BranB is Branwen's body. You can copy it and give it another name. Look to Setup-Branwen.tp2 for the exact code.

EXTEND_BOTTOM WARSAGE 0
+ ~!Dead("C6BODHI") OR(2) Global("O#BranVampire","GLOBAL",1) Global("O#BranVampire","GLOBAL",2)~ + @48 /* A loved one was taken by a vampire. What can I expect when I find them? */ EXTERN WARSAGE 6
+ ~PartyHasItem("O#BranB")~ + @49 /* Someone I care about has fallen to a vampire. Is there any way to save them? */ EXTERN WARSAGE 5
END

EXTEND_BOTTOM DOGHMA 0
+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("O#BranB")~ + @50 /* A friend is afflicted by vampirism. An old book suggested that followers of Oghma might know something about that. */ EXTERN DOGHMA 10
END

EXTEND_BOTTOM IMNBOOK1 0
+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("O#BranB")~ + @51 /* I'm looking for information about a tome that details the curing of vampirism. */ EXTERN IMNBOOK1 4
END

// Branwen in the temple of Amaunator

APPEND O#BRANP

IF WEIGHT #-1 ~Global("O#BranVampire","GLOBAL",4)~ v1
SAY @52 /* Am I... am I asleep? No, 'tis not a dream, yet I am myself again... and the darkness calls to me no longer. */
IF ~~ DO ~EraseJournalEntry(32084)  // These are journal entries from the game.
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("O#BranVampire","GLOBAL",5)~ SOLVED_JOURNAL @100002 + v1.1 // read about @100002 in English/Setup-Branwen.tra
END

/* Again, the code would look like this if I didn't have to replace a journal entry with @100002 for BG2EE purposes:
IF WEIGHT #-1 ~Global("O#BranVampire","GLOBAL",4)~ v1
SAY @52 /* Am I... am I asleep? No, 'tis not a dream, yet I am myself again... and the darkness calls to me no longer. */
IF ~~ DO ~EraseJournalEntry(32084)  // These are journal entries from the game.
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("O#BranVampire","GLOBAL",5)~ SOLVED_JOURNAL ~The Final Battle with Bodhi.

While I had feared for some time that Bodhi's final revenge on me would be to take away Branwen forever, it seems that the information in the lorebook was right... Amaunator's idol has restored Branwen not only to life, but has removed the vampiric curse from her, as well.~ + v1.1
END
Again, this code is commented out and will not be run/compiled/executed. */

IF ~~ v1.1
SAY @53 /* 'Twas you, wasn't it? <CHARNAME>, my dearest lover, you have saved me once again. Truly, 'twas Tempus' hand and mine own heart that brought me to you. */
IF ~~ DO ~EraseJournalEntry(%The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Branwen.  Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible.  I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of the one I love is at stake, as well!%)~ + v1.1a
END

IF ~~ v1.1a
SAY @54 /* Thank you. I wish that I could have resisted Bodhi, yet I had not. Her dark domination magic was repulsive, but it crushed me in an instant. I... you can't imagine how relieved I am to be with you again. */
++ @55 /* I am glad, as well. Join me, and let's get out of this place. */ DO ~ActionOverride("O#Bran",JoinParty())~ EXIT
++ @56 /* I have no room for you now. Will you wait for me in the Bridge District? */ + v1.2
END

IF ~~ v1.2
SAY @57 /* 'Tis not my wish, but... if you insist. */
= @58 /* I hope to see you again soon, <CHARNAME>. */
IF ~~ DO ~SetGlobal("KickedOut","LOCALS",1) MoveGlobal("AR0500","O#Bran",[4053.255])~ EXIT
END

END // for the APPEND O#BRANP

// BELOW THERE ARE NON-ESSENTIAL INTERJECTIONS THAT EVERY NPC MOD HAS.

// To add them, use Infinity Explorer to read the game's dialogue and choose good places for your interjections. Weidu has a tutorial on I_C_T, if you want to learn more.
// Actually, I really recommend you to try that - it's always best when your NPC has a unique interjection, and additional interjections are always a bonus.

// Quayle and his amazing brain are back

I_C_T QUAYLE 0 O#BranQUAYLE0
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @59 /* Quayle? Ha! A proper little reunion we're all having. */
END

// Viconia, hello!

I_C_T VICONI 13 O#BranVICONI13
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @60 /* Fear of the drow is not surprising. But to think they could burn Viconia alive... I do not wish to imagine what would happen, had you not intervened. */
END

// Xzar is back

I_C_T LYROS 5 O#BranLYROS5
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @61 /* Uh-oh. Weren't these fools... well, us? */
END

// Faldorn

I_C_T CEFALDOR 9 O#BranCEFALDOR9
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @62 /* 'Tis truly a pity what happened to her. Faldorn was a good companion. */
END

I_C_T CEFALDOR 10 O#BranCEFALDOR10
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @62 /* 'Tis truly a pity what happened to her. Faldorn was a good companion. */
END

// Bodhi, Bodhi, more Bodhi. Bodhi!

I_C_T BODHI 10 O#BranBODHI10
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @63 /* You're going to *kill*, that's what you're going to do. You will drown this city in blood and the Shadow Thieves will fall first. */
END

I_C_T BODHI 72 O#BranBODHI43
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @64 /* I strongly hope 'tis our last task. I grow tired of her games. */
END

I_C_T BODHI2 4 O#BranBODHI24
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @65 /* By Tempus, she's going to talk again! My ears are shriveling up already. */
END

I_C_T PPBODHI4 14 O#BranPPBODHI414
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @66 /* The bastard is in no hurry to leave, it seems. Just our luck. */
END

I_C_T C6BODHI 15 O#BranC6BODHI15
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @67 /* Wait, you're about to die, why would you care about the elves? Hello? */
END

// Unseeing Eye quest

I_C_T GAAL 1 O#BranGAAL1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @68 /* I have a bad, bad feeling about this... */
END

I_C_T GAAL 22 O#BranGAAL22
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @69 /* Looks like he's simply blind again. Poor fool. */
END

I_C_T CTRAITOR 2 O#BranCTRAITOR2
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @70 /* Well, nobody said it was going to be easy. */
END

I_C_T RIFTM01 6 O#BranRIFTM016
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @71 /* (waves) Hello! */
END

I_C_T RIFTM01 28 O#BranRIFTM0128
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @72 /* Unless we returned it! Ta-da! */
END

// Maevar, Renal, Aran Linvail 

I_C_T MAEVAR 24 O#BranMAEVAR24
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @73 /* Another distasteful bastard, I'll wager. */
END

I_C_T MAEVAR 29 O#BranMAEVAR29
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @74 /* Now we must be murderers, as well? By Tempus' mighty hammer, my patience is wearing thin. */
END

I_C_T EDWIN 3 O#BranEDWIN3
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @75 /* I wish *your* door was shut. Of all people I expected to meet here, you, Edwin Odesseiron, were the last. */
END

I_C_T EDWIN 16 O#BranEDWIN16
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @76 /* We are not killing the merchant, are we? His only crime is dealing with this... Red Wizard! */
END

I_C_T RENAL 5 O#BranRENAL5
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @77 /* And I am sick of thieves, but I doubt anyone cares. */
END

I_C_T RENAL 41 O#BranRENAL41
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @78 /* Now, finally, are we allowed to kill someone or not?! */
END

I_C_T ARAN 49 O#BranARAN49
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @79 /* And 'tis obvious he won't show you the receipts. */
END

I_C_T ARAN 53 O#BranARAN53
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @80 /* Here it comes... */
END

I_C_T ARAN 12 O#BranARAN12
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @81 /* And that spy will be eaten alive by vampires, no doubt. You seem to be cruel to your enemies and your own men alike. */
END

I_C_T ARAN 66 O#BranARAN66
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @82 /* He tortured my friends and you did nothing! What kind of people are you? */
END

// Hendak and Lehtinian

I_C_T LEHTIN 17 O#BranLEHTIN17
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @83 /* There's always more, isn't there? I wonder if you're compensating for something. */
END

I_C_T HENDAK 2 O#BranHendakInt2
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @84 /* By Valkur's greatsword, this is beyond injustice! I am going to give that slaver a huge kick in the batt and then some! */
END

I_C_T HENDAK 41 O#BranHendakInt41
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @85 /* And 'tis to be yours, too, after we're done cleaning it? Nay, you're not the noble warrior I imagined. */
END

I_C_T HENDAK 43 O#BranHendakInt43
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @86 /* And Hendak has a good piece of Athkatlan property, whereas those children ran the streets with nary a coin to their name and no means to feed themselves. I wonder if slavery not was better. */
END

// Bridge District, murders and Planar Prison and Fallen Paladins

I_C_T MURDGIRL 8 O#BranMURDGIRL8
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @87 /* She escaped by sheer miracle. Can you remember anything else, girl? */
END

I_C_T TANNER 8 O#BranTanner8
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @88 /* Stop? We have already stopped you, only you still do not understand, old man! Your evil has come to an end! */
END

I_C_T INSPECT 43 O#BranINSPECT43
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @89 /* We do good things. I am mighty proud of our work, <CHARNAME>. */
END

I_C_T MEKRAT 11 O#BranMEKRAT11
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @90 /* Ugh. Why does it have to be in the sewers again? */
END

I_C_T RAELIS 17 O#BranRAELIS17
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @91 /* Pretty words, but the woman reeks of lies. I will breathe easier with her gone. */
END

I_C_T KAYL2 10 O#BranKAYL210
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @92 /* Every man is fallible, and even fallen paladins can do great and noble deeds. If only 'twas possible to redeem them. */
END

I_C_T KAYPAL02 16 O#BranKAYPAL0216
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @93 /* 'Tis a shame, truly. An honorable warrior such as he could bring much good. */
END

// Imnesvale-related

I_C_T TOLGER 75 O#BranTOLGER75
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @94 /* Agree? Agree to what? 'Tis all about lies and deceit, <CHARNAME>, and I don't like it one bit. */
END

I_C_T UHMAY01 12 O#BranUHMAY12
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @95 /* Their ranger is missing? 'Tis strange indeed... were there any tracks in her cabin? Perhaps she just went hunting? */
END

I_C_T UHOGRE01 5 O#BranUHOGRE01
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @96 /* So close to the village? Without even trying to move further into the woods? Truly, they are too foolish to be the true killers. */
END

// Windspear-related

I_C_T VAELASA 7 O#BranVAELASA7
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @97 /* 'Twas a good deed indeed. I salute you. */
END

I_C_T FIRKRA02 7 O#BranFIRKRA02
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @98 /* And this one is after your heritage, too. Ugh. Is it so widely known? Or are these villains getting their announcements from somewhere? */
END

// de'Arnise-related

I_C_T NALIA 56 O#BranO#Bran56
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @99 /* The girl is a brave one. I vote we take her with us, <CHARNAME>. She will be of help in the castle. */
END

I_C_T NALIA 75 O#BranO#Bran75
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @100 /* And your father allowed that? To marry you off to some noble brat against your will? */
END

I_C_T KPCAPT01 1 O#BranKPCAPT011
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @101 /* I am sorry to hear of your misfortune, captain. Tempus willing, we'll avenge your men. */
END

I_C_T NALIA 77 O#BranO#Bran77
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @102 /* A barbaric custom. Why not drive him from your lands and whack him on the head with a mace if he does not take the hint? I'd help you gladly! */
END

I_C_T NALIAJ 171 O#BranO#BranJ171
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @102 /* A barbaric custom. Why not drive him from your lands and whack him on the head with a mace if he does not take the hint? I'd help you gladly! */
END

// Trademeet has been here for generations...

I_C_T NEEBER 8 O#BranNEEBER8
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @103 /* <CHARNAME>, may I show him? Pleeease? */
END

I_C_T CELOGAN 40 O#BranCELOGAN40
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @104 /* Dark minds follow us where'er we go. 'Tis your lot in life, <CHARNAME>. */
END

I_C_T TRHMER01 3 O#BranTRHMER013
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @105 /* Trademeet... without trade? Doesn't make any sense to me. */
END

I_C_T TRGENI01 6 O#BranTRGENI016
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @106 /* That's got to be one of the stupidest things I've ever heard. Why not leave the town and catch that rakshasa yourselves? People are starving here! */
END

// Spellhold

I_C_T PPCOWLED 1 O#BranPPCOWLED1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @107 /* 'Tis all a little too crazy for my taste. You'd better step back, though: he looks dangerous. */
END

I_C_T PPSAEM3 2 O#BranPPSAEM32
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @108 /* Did I ever mention that I do not trust him? */
END

I_C_T PPSAEM3 55 O#BranPPSAEM355
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @109 /* By Tempus, I *so* do not trust him. */
END

I_C_T PPSAEM3 52 O#BranPPSAEM352
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @110 /* You son of a mother! */
END

I_C_T ELEARB01 2 O#BranELEARB012
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @111 /* Lovely. Can I whack him on the head with my hammer? */
END

I_C_T PPTIAX 1 O#BranPPTIAX1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @112 /* Hard to believe, but I actually missed the little fellow. Funny, isn't it? */
END

I_C_T PPTIAX 6 O#BranPPTIAX6
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @113 /* Tiax! What is he doing here? He's not even a mage! Though his placement here is oddly apt, I admit. */
END

I_C_T PPIRENI1 4 O#BranPPIRENI14
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @114 /* Explain it or not, 'tis a prison for mages, healthy and sane both. 'Tis simple enough for those that can see. */
END

I_C_T PPIRENI1 28 O#BranPPIRENI128
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @115 /* Uh-oh. */
END

I_C_T PPIRENI2 42 O#BranPPIRENI242
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @115 /* Uh-oh. */
END

// Sahuagin City

I_C_T SAHKNG01 33 O#BranSAHKNG0133
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @116 /* Good. Let these monsters slaughter each other. */
END

I_C_T SAHPR1 1 O#BranSAHPR11
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @117 /* Shark-men. I've seen them on the isles before. But how are we to understand them? */
END

I_C_T SAHPR2 12 O#BranSAHPR112
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @118 /* One is as bad as another. Why don't we slaughter them both? The ships and the fishing villages will be safe, and this cursed place will rot and be forgotten. */
END

I_C_T SAHBEH01 2 O#BranSAHBEH012
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @119 /* And what is that thing, creature? Must be some mighty treasure indeed. */
END

// The Underdark 

I_C_T UDSVIR01 3 O#BranUDSVIR013
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @120 /* Looks like everyone has their use for us. Well, 'tis good as long as they give us passage to Irenicus. */
END

I_C_T UDSILVER 12 O#BranUDSILVER12
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @121 /* A silver dragon... 'Tis a strange peacemaker, but the only one the drow would truly fear. */
END

I_C_T UDSILVER 35 O#BranUDSILVER35
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @122 /* Ugh. By Tempus, my hands look like... just ugh. */
END

I_C_T UDSOLA01 56 O#BranUDSOLA0156
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @123 /* Looks like these two are worth each other. */
END

I_C_T UDSOLA01 91 O#BranUDSOLA191
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @124 /* He's an idiot. To speak against a Matron Mother's daughter so openly? She'll want his head soon, if she doesn't already. */
END

I_C_T UDDROW04 39 O#BranUDDROW0439
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @125 /* Hear that, Veldrin? Any House would be lucky to have you. */
END

// Chapter 6 and 7, Elhan and Demin

I_C_T C6ELHAN2 8 O#BranC6ELHAN28
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @126 /* 'Tis not too late to turn back to the Underdark's caverns. I'm sure the drow will give us a warmer welcome. */
END

I_C_T SUELHAN 6 O#BranSUELHAN6
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @127 /* Yet they are not defending this city. The task falls to us, and us alone. */
END

I_C_T SUDEMIN 23 O#BranSUDEMIN23
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @128 /* You could incarcerate him and yet you did not? And 'tis your fault that <CHARNAME> lost <PRO_HISHER> soul? */
END

// LOVETALKS START HERE

APPEND O#BRANJ

/* These days most of the companions have friendship paths for those players who do not want to romance them. But I do not want to write two separate paths for Branwen - remember, she's just a test NPC. So I am going to write her friendship path and add romance bits to every dialogue. And I will add some talks that will be completely romance-specific. This way the players will have a friendship AND a romance. */

// No CHAINs here. Just simple SAY commands, one after another.
// To know how and when these talks run, open Branwen/Scripts/O#BranS.baf.

// These talks trigger both if Branwen is your friend and if Branwen is romanced. If she is romanced, music plays.

// Talk 1. 

IF ~Global("O#BranTalk","GLOBAL",2)~ t1
SAY @129 /* Let's stop and talk for a moment. By Tempus, I haven't seen you in ages! */
++ @130 /* What for? You already know about Irenicus and Imoen. */ + t1.1
++ @131 /* If it's about some rumors about me being a Child of Bhaal again, I will break someone's shield over their head. Just saying. */ + t1.2
++ @132 /* Sure, let's talk. How have you been? */ + t1.3
++ @133 /* Now is not the best time, Branwen. */ + t.0
END

IF ~~ t.0
SAY @134 /* Until next time, then. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Note how t1.0 can be used for ALL lovetalks - it increments O#BranTalk and sets the timer.

/* Branches t1.1, t1.2 and t1.3 are "looping branches" - they create different answers for Branwen, but they would still loop back to the same place, t1.4. It's efficient: you don't have to create big separate branches. */

IF ~~ t1.1
SAY @135 /* The whole Athkatla knows that by now. Nay, 'tis not what I wanted to ask you about. */
IF ~~ + t1.4
END

IF ~~ t1.2
SAY @136 /* I've been in Baldur's Gate, <CHARNAME>. I remember Sarevok's fall, and his lineage, and talk about yours. I know who you are, and it does not frighten me one bit. */
IF ~~ + t1.4
END

IF ~~ t1.3
SAY @137 /* Those last few days? Looking for you. Before that I stayed in Baldur's Gate and worked with the city guard, but without you it just wasn't the same. */
IF ~~ + t1.4
END

IF ~~ t1.4
SAY @138 /* Remember the grand celebration in the Duchal Palace? Everyone drunk as a skunk, and Coran waking up wearing nothing but a tiara and Minsc's dirty socks? */
= @139 /* Dynaheir dancing, Khalid and Jaheira by the window... everyone else drinking and laughing... I haven't seen any of them since. */
= @140 /* Though I've heard Ajantis is somewhere around, and, of course, I know about Khalid and Dynaheir. */
= @141 /* But what about you? How have *you* been? You weren't just travelling down the coast working with militia like I did. So, what's new here? */
++ @142 /* It’s been fun. Everyone's offering me new missions, money's flooding in, I'm discovering new castles and cities... I've even travelled between planes! */ + t1.5
++ @143 /* People want to join me right when they see me. Nearly everyone I meet wants to become my friend, take a spot in my party, tell me their life story... it's endearing, actually. */ + t1.6
++ @144 /* Other than Irenicus' torture, I really have nothing to say. */ + t1.7
++ @145 /* Same old, same old. */ + t1.8
END

IF ~~ t1.5
SAY @146 /* Phew... By Tempus' battle hammer, that's mighty impressive! I'm glad I met you again. */
IF ~~ + t1.8
END

IF ~~ t1.6
SAY @147 /* Erm. You realize I'm one of "these people", right? */
= @148 /* (Branwen laughs.) */
IF ~~ + t1.8
END

IF ~~ t1.7
SAY @149 /* I am truly sorry about that bastard ever touching you. But worry not: my hammer cracks skulls like nobody's business. */
IF ~~ + t1.8
END

IF ~~ t1.8
SAY @150 /* Anyway, Duke Belt says hello. Remember him at the Duchal Palace? It's good you saved the fellow. He said they'd always be happy to welcome the Hero of Baldur's Gate back. */
++ @151 /* That's nice to hear. */ + t1.9
++ @152 /* Thank you for telling me. */ + t1.9
++ @153 /* Maybe I'll go back there some day. */ + t1.9
++ @154 /* I'm not sure if I'd want to go back. */ + t1.9
END

IF ~~ t1.9
SAY @155 /* I don't know what the future will bring, but by Tempus, I'm sure 'twill be a great one. Wherever we go. */
= @156 /* Speaking of which, 'tis past time we were on our way. Come on! */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

/* We need IncrementGlobal() and RealSetGlobalTimer() in every dialogue. The last state is the best place, IF the dialogue has one ending, otherwise you'll have to duplicate. */

// Talk 2.

IF ~Global("O#BranTalk","GLOBAL",4)~ t2
SAY @157 /* Remember how we lay on the grass under the walls of Candlekeep? I want to treat ourselves again. Here, take this. */
++ @158 /* A picnic basket? */ + t2.3
++ @159 /* Branwen, this is not a good time for picnics. */ + t2.1
++ @160 /* Ooooh, fresh bread and soft cheese and tomatoes and two bottles of wine! Impressive. */ + t2.2
++ @161 /* I am sorry, but no. */ + t.0
END

IF ~~ t2.1
SAY @162 /* And why ever not? Because warriors never go hungry? Because sitting on the grass and eating bread and cheese will make you a girly girl instead of a mighty warrior? Pah! */
= @163 /* You need strength, and you need rest. Tempus says so. */
IF ~~ + t2.3
END

IF ~~ t2.2
SAY @164 /* I added some roasted meat and potatoes. Too bad 'tis all gone cold. Yet we might still have a nice meal. */
IF ~~ + t2.3
END

IF ~~ t2.3
SAY @165 /* Let's have fun! Tempus willing, you and I will enjoy yourselves today. */
++ @166 /* I like the way you think. */ + t2.4
++ @167 /* Pass the bread, please! */ + t2.4
++ @168 /* No. Just no. */ + t.0
END

IF ~~ t2.4
SAY @169 /* In my youth, when summers were short, and childhoods even shorter, we oft picnicked at sundown on the cliffs. I remember those meals still... our family together, my father laughing... */
= @170 /* We are family now, <CHARNAME>. And I want you to have good memories of this. */
++ @171 /* Screw the memories! Let's enjoy the *food*! */ + t2.5
++ @172 /* I'm touched, Branwen. Thank you. */ + t2.6
++ @173 /* I propose a toast. To Branwen, the most romantic priestess from the Norheim isles! */ + t2.6
END

IF ~~ t2.5
SAY @174 /* (She laughs.) */
= @175 /* Let's! */
IF ~~ + t2.6
END

IF ~~ t2.6
SAY @176 /* To <CHARNAME>! The best friend I could ever have. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ + t2.7
END

// Note how I placed a condition for O#BranRomanceActive below a "normal" exit.
// That's how it works if you want to add some "conditional" text to SAY dialogue.

IF ~~ t2.7
SAY @177 /* And the most handsome man. */
IF ~~ EXIT
END

// Talk 3.

IF ~Global("O#BranTalk","GLOBAL",6)~ t3
SAY @178 /* We are doing honorable work, hunting that mad mage. 'Tis good. */ 
++ @179 /* Aye. He had conducted horrible experiments, tortured people in jars. */ + t3.2
++ @180 /* The bastard will pay for everything he's done to us. */ + t3.2
++ @181 /* I'm kind of interested in his experiments, actually. */ + t3.1
END

IF ~~ t3.1
SAY @182 /* Aye, and 'twill be his great pleasure to show you all of them, I suspect. */
IF ~~ + t3.2
END

IF ~~ t3.2
SAY @183 /* But 'tis truly not right that we have to acquire unseemly allies. The Shadow Thieves? Their dark rivals? The Cowled Wizards? */
= @184 /* My head spins just from thinking about it. 'Twill bring us no honor to be sure. */
++ @185 /* We can pointlessly discuss it and then do it, or we can just do it. Do you know what I prefer? */ + t3.3
++ @186 /* Greater good and all that. Even thieves can redeem themselves by aiding us. */ + t3.4
++ @187 /* You're right. I wish it was possible to just slaughter the whole lot. */ + t3.5
END

IF ~~ t3.3
SAY @188 /* No, which? Discuss it, right? */
IF ~~ + t3.5
END

IF ~~ t3.4
SAY @189 /* What is the point of that, if afterwards they would remain thieves who would pillage and murder? */
IF ~~ + t3.5
END

IF ~~ t3.5
SAY @190 /* Treacherous, murderous, greedy. I would slaughter them all with my battle hammer, if I could. Alas, we are denied that. */
= @191 /* But, by Tempus, when our need has passed, I shall raise the nearby temples and come back in numbers! */
++ @192 /* Sounds good to me. */ + t3.6
++ @193 /* Right. End of discussion. */ + t.0
++ @194 /* And lose our last allies in this city? */ + t3.7
++ @195 /* More killing? And how would that make anything right? */ + t3.7
END

IF ~~ t3.6
SAY @196 /* Yes! They will burn with cleansing fire! Let their wives suffer, let their... children... weep... */
IF ~~ + t3.7
END

IF ~~ t3.7
SAY @197 /* Bah! <CHARNAME>, why do you like making it so complicated! */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 4.

IF ~Global("O#BranTalk","GLOBAL",8)~ t4
SAY @198 /* Another dent on my hammer. We are putting our weapons to good use. */ 
++ @199 /* Your point being? */ + t4.2
++ @200 /* I bet that ruffian didn't like it when you hit him on the head. */ + t4.1
++ @201 /* Not now, Branwen. */ + t.0
END

IF ~~ t4.1
SAY @202 /* Ha! No, I don't think he liked it, either. */
IF ~~ + t4.2
END

IF ~~ t4.2
SAY @203 /* Does it bother you to kill so often? I confess, sometimes, when I lie awake at night, it does bother me. */
= @204 /* I know I fight with honor, and my enemies are guilty of numerous crimes, but still... */
++ @205 /* You are doing good work, Branwen. Everyone has doubts from time to time. */ + t4.3
++ @206 /* Who cares? We're adventurers. It's what we do. */ + t4.4
++ @207 /* I understand. I wonder sometimes, myself. */ + t4.3
END

IF ~~ t4.3
SAY @208 /* We all do, I think. But the battle comes, and the doubt is washed clean again. */
IF ~~ + t4.5
END

IF ~~ t4.4
SAY @209 /* Truly, you're right. I must be a fool to doubt myself and Tempus' wisdom. */
IF ~~ + t4.5
END

IF ~~ t4.5
SAY @210 /* I should not bother you with this. Tempus favors us, and I shall not be hesitant in my strikes. We'll destroy the scum, split the loot and call it a day. */
= @211 /* But it's been good to talk with you of my own doubts. My hammer is ever at your command. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ + t4.6
END

IF ~~ t4.6
SAY @212 /* As are some other weapons, should you wish it. */
++ @213 /* Why, Branwen, are you flirting with me? */ + t4.7
++ @214 /* I'll keep it in mind. */ + t4.8
++ @215 /* Not interested, thank you. */ + t4.9
END

IF ~~ t4.7
SAY @216 /* My lips are sealed. But you heard my words, didn't you? */
IF ~~ EXIT
END

IF ~~ t4.8
SAY @217 /* You do that. */
IF ~~ EXIT
END

IF ~~ t4.9
SAY @218 /* As you wish. */
IF ~~ DO ~SetGlobal("O#BranRomanceActive","GLOBAL",3)~ EXIT
END

// Talk 5.

IF ~Global("O#BranTalk","GLOBAL",10)~ t5
SAY @219 /* I like you a lot. You make me laugh, like my childhood friends used to. */ 
++ @220 /* I could never picture you as a child. */ + t5.1
++ @221 /* What were you like back then? */ + t5.1
++ @222 /* Thank you. I'd like to have been your childhood friend. */ + t5.1
++ @223 /* I'm not really interested in discussing it right now. */ + t.0
END

IF ~~ t5.1
SAY @224 /* I was not very different from what I am now. Boisterous. Noisy. A little clumsy. */
= @225 /* Boys called me beautiful when they wanted to kiss me, but they'd kick me in the mud as easily. And I'd kick them. We were free, and equals... */
= @226 /* When we started growing up, our training started, and I understood for the first time that some roles weren't given to women freely. But I struggled, and persevered. */
= @227 /* But I wanted to tell you about my friends. We built castles of sand on the shore, danced and laughed around the fires in the village, gossiped in the garden when everyone was asleep. We... held hands when no one saw that. */
++ @228 /* First love? That's romantic. */ + t5.2
++ @229 /* It wasn't very romantic in Candlekeep. Of course, when I left, it was an entirely different story. */ + t5.3
++ @230 /* It sounds very nice. */ + t5.2
END

IF ~~ t5.2
SAY @231 /* It was. I still remember those years fondly. */
IF ~~ + t5.3
END

IF ~~ t5.3
SAY @232 /* You must have been lonely in Candlekeep. No other children but Imoen, lonely old men all around, and Gorion never letting you out of his sight. */
++ @233 /* I had a bookish childhood. That worked for me. */ + t5.4
++ @234 /* I still found ampletime for my pranks, believe me. */ + t5.4
++ @235 /* Don't remind me. It was a horrible waste of my childhood years. */ + t5.4
++ @236 /* Ah, it wasn't so bad. */ + t5.4
END

IF ~~ t5.4
SAY @237 /* I'm glad they didn't spoil *everything* for you. You're not some bookworm, <CHARNAME>. You are a true warrior. */
= @238 /* Perhaps you'll tell me more of Candlekeep, Imoen and Gorion, as we walk? */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 6.

IF ~Global("O#BranTalk","GLOBAL",12)~ t6
SAY @239 /* I'm annoyed. Every task brings new villains, every villains bring their minions, and it ends with a soup of blood and broken limbs. */
= @240 /* By Tempus, don't they see we are going to slaughter them all? Why don't these fools yield and save themselves the trouble? */
++ @241 /* Because they're idiots? */ + t6.1
++ @242 /* Then it'd be boring. */ + t6.2
++ @243 /* True. I wouldn't mind trying diplomacy once in a while. */ + t6.3
++ @244 /* Branwen, this is not a good time. */ + t.0
END

IF ~~ t6.1
SAY @245 /* They are, and everyone knows that! I bet even their mothers called them idiots as they grew up. */
IF ~~ + t6.4
END

IF ~~ t6.2
SAY @246 /* Hmm. True. */
IF ~~ + t6.4
END

IF ~~ t6.3
SAY @247 /* That would be even more boring. Forget I said anything. */
IF ~~ + t6.4
END

IF ~~ t6.4
SAY @248 /* I remember what it felt like to be defeated. I stood, unable to move, when Tranzig and his men were laughing at me. And then he began casting the stone transformation, and I was helpless before it... */
= @249 /* I do not wish to be defeated ever again, but those fools know not what true defeat is. They are lambs to the slaughter, and their masters do not even deny it. */
= @250 /* Why do they follow this stupid path, do you think? Is there perchance a secret building somewhere? "Suicidal minions please apply here"? */
++ @251 /* Athkatla is a corrupted city. There's no work, no money, and families to feed. People become bandits or dirty guards or low-rank Shadow Thieves, because they do not wish to starve. */ + t6.5
++ @252 /* Maybe they think of themselves as good and true people who protect stability? */ + t6.5
++ @253 /* What choice do they have? */ + t6.5
++ @254 /* Heheh. Maybe. */ + t6.5
END

IF ~~ t6.5
SAY @255 /* It's just... they are everywhere! Truly, whenever we go, we are attacked by some mercenaries or bandits or someone's minions with empty eyes! */
= @256 /* I'm no scholar, but even I know that the land where every peasant dreams of becoming a villain is sick. And what cure can we offer save a warhammer? */
++ @257 /* A warhammer is a very good sort of cure! */ + t6.6
++ @258 /* Or a katana. A great method, very delicate. Swisssshhhh... */ + t6.6
++ @259 /* Maybe someone should join the Council of Six and help these lands. */ + t6.7
++ @260 /* I'm bored. Let's finish this conversation another time. */ + t.0
END

IF ~~ t6.6
SAY @261 /* Haha! Indeed. */ 
IF ~~ + t6.8
END

IF ~~ t6.7
SAY @262 /* Yes. But who? Some idealistic noble, some hermit, a newcomer? Would the people even want this? */
IF ~~ + t6.8
END

IF ~~ t6.8
SAY @263 /* I just know that while we enjoy ourselves, simple people suffer here. And Tempus does not let me sit idly. */
= @264 /* I must think on this. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ + t6.8a
END

IF ~~ t6.8a
SAY @265 /* Ha! A funny thought came to my head. Imagine you and me, side by side, ruling these lands together, kindly and honorably. What a sight that would be! */
++ @266 /* Was that a marriage offer? */ + t6.9
++ @267 /* Together? Isn't that a bit forward of you? */ + t6.9
++ @268 /* Sorry, Branwen, but we're just friends. */ + t4.9 // using an old lovetalk's "breakup" condition
END

IF ~~ t6.9
SAY @269 /* Nay, never mind. It was but an idle thought. You and I... 'tis only a fantasy, and I'd gladly escape that stuffed palace and go hunting villains anyhow. */
= @270 /* Now I'm blushing. Oh, let's just forget this. Please? */
IF ~~ EXIT
END

// Talk 7.

IF ~Global("O#BranTalk","GLOBAL",14)~ t7
SAY @271 /* I've given a thought to the prospect of making these lands better. It is going to happen one day. */
++ @272 /* How? */ + t7.1
++ @273 /* In a fairy tale, maybe. */ + t7.1
++ @274 /* You tell yourself that, sister. */ + t7.1
++ @275 /* Branwen, I'm not interested in the subject right now. */ + t.0
END

IF ~~ t7.1
SAY @276 /* 'Twould be best if things were akin to my home isle's way. Everyone who produces, sows, fights, raises children, grows crops and does anything else useful has a vote, be it an old midwife or a new farmer. */
= @277 /* When a big decision is to be made, they gather together. Those who have no craft, can no longer work, or are not yet sixteen years of age are left behind. */
= @278 /* Thus everyone weighs on the decision, and only those who give to the isle's wellbeing are allowed to put a white stone into the pot, to vote. 'Tis most sensible to me. */
++ @279 /* Why not let everyone vote? Old men who must be fed by the state, and young people who cannot find a job? */ + t7.2
++ @280 /* I agree. Sounds like a good system. */ + t7.3
++ @281 /* It has its flaws, but how do you propose to install it in Amn? */ + t7.3
END

IF ~~ t7.2
SAY @282 /* No. 'Tis bad. If you take and take, and give nothing, what worth can there be in your voice? Decisions are made by those who swing the sword and wield the hammer. */
++ @283 /* That's a very narrow view of things, Branwen. */ + t7.2a
++ @284 /* I suppose I see your point. */ + t7.3
END

IF ~~ t7.2a
SAY @285 /* Yet 'tis not mine alone. */
IF ~~ + t7.3
END

IF ~~ t7.3
SAY @286 /* When this adventure is over, we must approach the Chief Inspector. If we get him on our side, and your friends from Athkatla's nobility, and maybe even someone on the Council of Six... Then we'll have the power to change things. */
++ @287 /* Wouldn't playing at politics be too boring? We are adventurers, after all. */ + t7.4
++ @288 /* Seems like you've thought of everything. */ + t7.4
++ @289 /* And who will decide the future of Amn? */ + t7.4
END

IF ~~ t7.4
SAY @290 /* We'll get those people together. 'Tis up to them to decide, but we'll make sure they do before we leave on our next adventure. A good idea, no? */
= @291 /* I remember the iron crisis. I saw the trade in Baldur's Gate coming to ruin because of the Iron Throne. We mustn't let the same sort of corruption continue here. */
= @292 /* Thank you for... entertaining my notions. I'm not the one for politics, but I hate injustice. */
++ @293 /* Any time, Branwen. */ + t7.5
++ @294 /* Just let's talk of something more interesting next time, all right? */ + t7.6
END

IF ~~ t7.5
SAY @295 /* 'Tis a great pleasure to talk to you, <CHARNAME>. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t7.6
SAY @296 /* You have my word. */
IF ~~ + t7.5
END

// Talk 8.

IF ~Global("O#BranTalk","GLOBAL",16)~ t8
SAY @297 /* In my yestereve's dream, Tempus showed me the Wall of Faithless. 'Twas most disturbing. */
++ @298 /* The Wall is the place where the souls of disbelievers go, right? */ + t8.1
++ @299 /* Why did you dream of it? */ + t8.2
++ @300 /* I do not want to talk about the Wall right now, Branwen. */ + t.0
END

IF ~~ t8.1
SAY @301 /* Quite so. If you do not worship a god, after death your soul just... dissolves. Ugh! It was so... so... */
IF ~~ + t8.2
END

IF ~~ t8.2
SAY @302 /* I do not know why Tempus shows me such horrible things at times. Yet I know of one reason. */
= @303 /* <CHARNAME>, do you worship the Lord of Battles? */ 
++ @304 /* I respect him as a deity, but no, I worship another. */ + t8.3
++ @305 /* I do not worship a god. */ + t8.4
++ @306 /* Actually, I do. We both follow Tempus, Branwen. */ + t8.5
END

IF ~~ t8.3
SAY @307 /* I understand. We all have our callings. */
IF ~~ + t8.6
END

IF ~~ t8.4
SAY @308 /* Oh. That's why Tempus sent me the vision, then. */
IF ~~ + t8.6
END

/* Sometimes when the player says something interesting and you want to use it in some later conversation, it's worth it to set a variable, like in t8.5 below. */

IF ~~ t8.5
SAY @309 /* 'Tis good! We should pray together some time. Though I say a good battle is the best prayer. */
IF ~~ DO ~SetGlobal("O#BranWorshipTempus","GLOBAL",1)~ + t8.6
END

// If I want one of the dialogue options to be only available for romance, here's what I do:

IF ~~ t8.6
SAY @310 /* Your choices are yours alone, but since I've wanted to tell you about Tempus for some time, will you let me? Just a few... fun facts. */
+ ~Global("O#BranRomanceActive","GLOBAL",1)~ + @311 /* I like when you're going all seductive on me. */ + t8.6a
++ @312 /* All right. */ + t8.7
++ @313 /* Not really. */ + t.0
END

IF ~~ t8.6a
SAY @314 /* Ha! I can't say I'm not fond of these moments, either. */
IF ~~ + t8.7
END

IF ~~ t8.7
SAY @315 /* If you're ever hungry or in need of lodgings or a weapon, a temple of Tempus is where you should go. We have mess halls, barracks and armories. */
= @316 /* Clerics of Tempus fight on both sides of every conflict, and Tempus only encourages it. So there's no strict hierarchy, for what sensible high priest would ask for the fighting to stop? */
= @317 /* Yet Tempus does not hold with senseless carnage, and accepts peace as a state that must come after any war. */
++ @318 /* Anything else? */ + t8.8
++ @319 /* Thanks, Branwen. If I ever go hungry and in need of good steel, I'll be sure to visit your brethren. */ + t8.8
END

IF ~~ t8.8
SAY @320 /* If you ever hear someone calling the Lord of Battles unfair and unseemly names, know their ignorance. Tempus encourages honorable battle, forbids cowardice and says that any war is meaningless without peace following it. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ + t8.10
END

IF ~~ t8.10
SAY @321 /* But when you complete a deed that would please Tempus, a priest or a priestess would say: "Tempus thanks you", and a proper response would be: "and I thank Tempus". */
= @322 /* And do you know what may please me now? */
++ @323 /* I don't know. Tempus is *not* a goddess of hot and passionate love, is he? */ + t8.11
++ @324 /* You naughty priestess. I really like that seductive voice. So, what is it? */ + t8.11
++ @325 /* No idea. Enlighten me. */ + t8.11
++ @326 /* Branwen, I am really not comfortable with all this. Let's just keep it friendly. */ + t4.9
END

IF ~~ t8.11
SAY @327 /* All in good time. And I make good on *all* my promises, <CHARNAME>. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 9.

// Some gender conditions here.

IF ~Global("O#BranTalk","GLOBAL",18)~ t9
SAY @328 /* A family <PRO_MANWOMAN> or a lonely wolf? Which is your path? */
++ @329 /* What brought this on? */ + t9.1
+ ~Gender(Player1,MALE)~ + @330 /* A family <PRO_MANWOMAN>, I think. */ + t9.2
+ ~Gender(Player1,FEMALE)~ + @330 /* A family <PRO_MANWOMAN>, I think. */ + t9.2a
++ @331 /* A lonely wolf, without a doubt. */ + t9.3
++ @332 /* Neither. I have my friends, and they're my family. */ + t9.4
++ @333 /* Let's talk another time. */ + t.0
END

IF ~~ t9.1
SAY @334 /* I like travelling with you. But if you marry and settle down, 'twill all be gone. */
IF ~~ + t9.5
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ + t9.1a
END

IF ~~ t9.1a
SAY @335 /* Unless, of course, you marry me. Haha! But even so, people part. */
IF ~~ + t9.5
END

IF ~~ t9.2
SAY @336 /* 'Tis so? Never pictured you with seven children and a bossy wife. */
IF ~~ + t9.5
END

IF ~~ t9.2a
SAY @337 /* Truly? Never imagined you cooking daily and giving birth yearly. */
IF ~~ + t9.5
END

IF ~~ t9.3
SAY @338 /* You are one, I agree. */
IF ~~ + t9.5
END

IF ~~ t9.4
SAY @339 /* Aw, 'tis so good to hear. I feel the same way about you. */
IF ~~ + t9.5
END

IF ~~ t9.5
SAY @340 /* So many good friends spend years together, save each other's lives and give heartfelt promises, and then they marry, father children... and disappear, visiting once a year and behaving like strangers. */
= @341 /* I don't want that to happen to us. */
++ @342 /* But you can marry and still have your friends, Branwen. */ + t9.6
++ @343 /* I don't want that to happen, either. */ + t9.7
++ @344 /* I'm afraid such is life. */ + t9.7
END

IF ~~ t9.6
SAY @345 /* Ha! 'Twould take a true diplomat and a paragon of balance besides. */
IF ~~ + t9.7
END

IF ~~ t9.7
SAY @346 /* But even so, there are times when you're lost without home and hearth. Sitting in a wet bedroll under a lonely tree in the night, sharing a paltry meal, wincing from the pain in an old wound... is it truly better? */
= @347 /* I don't know. I just know that whatever joy having a family brings, I do not wish to lose the camaraderie we have now. */
++ @348 /* True words. I feel the same myself, sometimes. */ + t9.8
++ @349 /* Then let's make sure it doesn't happen, even if it seems difficult. */ + t9.9
++ @350 /* We won't, Branwen. I swear. */ + t9.9
++ @351 /* We'll see what happens. */ + t9.10
END

IF ~~ t9.8
SAY @352 /* Aye. But our journey is not done yet. */
IF ~~ + t9.10
END

IF ~~ t9.9
SAY @353 /* I'll hold you to this promise. */
IF ~~ + t9.10
END

IF ~~ t9.10
SAY @354 /* Come. The road awaits. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 10.

IF ~Global("O#BranTalk","GLOBAL",20)~ t10
SAY @355 /* Anything on your mind? */
++ @356 /* Not particularly. */ + t10.2
++ @357 /* A couple of things. */ + t10.2
++ @358 /* Irenicus. */ + t10.1
++ @359 /* I'd prefer to walk in silence right now. */ + t.0
END

IF ~~ t10.1
SAY @360 /* That bastard. I'll walk in his blood yet! */
IF ~~ + t10.2
END

IF ~~ t10.2
SAY @361 /* Would you care to play a game with me? The rules are simple. You tell me the name of the villain you'd like to kill, I'll tell you what death I envision for him. */
++ @362 /* Sounds interesting. Let's try it. */ + t10.3
++ @363 /* Why not? I could use a short respite. */ + t10.3
++ @364 /* I'd rather not play. */ + t.0
END

IF ~~ t10.3
SAY @365 /* Your move. */
++ @358 /* Irenicus. */ + t10.4
++ @366 /* Bhaal. */ + t10.5
++ @367 /* Sarevok. */ + t10.6
++ @368 /* Demogorgon. */ + t10.7
++ @369 /* Cyric. */ + t10.8
++ @370 /* I'm done, thanks. */ + t10.9
END

IF ~~ t10.4
SAY @371 /* I'd send Irenicus to the division of the Abyss reserved for the smartest of villains, where he'd find out that *everyone* there was smarter than him. */
= @372 /* He'd want to kill himself, but he couldn't! Cruel, huh? */
IF ~~ + t10.3
END

IF ~~ t10.5
SAY @373 /* Do not resurrect him. Problem solved. */
= @374 /* Wait. No. Try to resurrect him, and make each try more and more successful, like he's going to be brought back right now, they just need another few days, another ritual... and then it all comes crashing down. */
= @375 /* To top it all, take all his divine energy and give it to a force of balance and good. He'd crap his pants with envy, only... yep, no crap, no pants. Only a disembodied spirit, watching... in pain. */
IF ~~ + t10.3
END

IF ~~ t10.6
SAY @376 /* He's dead! Isn't he? */
= @377 /* But, okay, if he wasn't, I'd make him travel with you. Let him see your every success, and find out what a fool he was. Maybe a great warrior such as he might even redeem himself. */
= @378 /* If not, there's always the Abyss. */
IF ~~ + t10.3
END

// I want to check if Demogorgon is dead. Fortunately, it's easy: 
// Global("DemogorgonIsDead","GLOBAL",1)

IF ~~ t10.7
SAY @379 /* The Prince of Demons? Better stay well away. */
IF ~~ + t10.7b
IF ~Global("DemogorgonIsDead","GLOBAL",1)~ + t10.7a
END

IF ~~ t10.7a
SAY @380 /* Besides, you killed him already. */
IF ~~ + t10.7b
END

IF ~~ t10.7b
SAY @381 /* But if you asked me, I'd say in a big battle. Spells flying, swords cutting, archers loosing, demonspawn everywhere - and a glorious, glorious victory! */
= @382 /* Because we deserve that. */
IF ~~ + t10.3
END

IF ~~ t10.8
SAY @383 /* A living god? You set your sights high! And the higher the better, I say! */
= @384 /* We'd need Tempus' favor to win this one. But with your heritage and your strength, heavens themselves would tremble. */
= @385 /* I hope that Cyric the Loser would endure the worst punishment for his own pride. Living a life as a mortal, knowing he'd have nowhere to go in the afterlife unless he tried to redeem himself. */
IF ~~ + t10.3
END

IF ~~ t10.9
SAY @386 /* 'Twas my pleasure. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ + t10.10
END

IF ~~ t10.10
SAY @387 /* Truly, I'd like us to play... other sorts of games one day. Would you consider it? */
++ @388 /* With you, my lovely Branwen, anything. */ + t10.11
++ @389 /* Me? Oh, I'm ready right now! */ + t10.11
++ @390 /* I'd rather we stayed friends. */ + t4.9
END

IF ~~ t10.11
SAY @391 /* 'Tis decided, then. Once a night is special enough... we come out and play. */
= @392 /* I can't wait. */
IF ~~ EXIT
END

// Talk 11. 

IF ~Global("O#BranTalk","GLOBAL",22)~ t11
SAY @393 /* Once more we plunge into battle, and once more my blood sings! 'Tis a most wonderful feeling when a mighty adversary is before us, and lesser enemies scream in fear! */
++ @394 /* You have a true warrior spirit, Branwen. */ + t11.1
++ @395 /* Doesn't it seem too bloodthirsty to you? */ + t11.1
++ @396 /* Let us speak of bloodshed another time. */ + t.0
END

IF ~~ t11.1
SAY @397 /* Aye, I am what Tempus made me. And no other path would suffice. */
= @398 /* I revere honest battle. I breathe with my hammer, and revel in every strike. Truly, even making love pales before it. */
++ @399 /* Did you have many lovers? */ + t11.2
++ @400 /* And you would know, wouldn't you? */ + t11.2
++ @401 /* I disagree. Making love is much better than making war. */ + t11.3
++ @402 /* There's nothing like taking a lover right after battle. */ + t11.4
END

IF ~~ t11.2
SAY @403 /* I've had my share of... adventures. Indeed, I see nothing shameful in it. */
IF ~~ + t11.5
END

IF ~~ t11.3
SAY @404 /* 'Tis better to make both, wouldn't you agree? */
IF ~~ + t11.5
END

IF ~~ t11.4
SAY @405 /* Aye, you have the right of it. Oooh, the memory almost brought me to my knees just now, hot and trembling. */
IF ~~ + t11.5
END

IF ~~ t11.5
SAY @406 /* You of all people should know what 'tis like, with all the knights and elves and maidens chasing you and wanting you in their bed. Men sought my company, and I reciprocated. */
= @407 /* And I don't regret a thing. That's what my grandmother said before she died: regret nothing. She was a beauty in her day... */
= @408 /* Ah, but look at me, drowning in old memories. That should be boring to you. */
++ @409 /* Not at all. Tell me about your grandmother. */ + t11.6
++ @410 /* Yes, let's talk later. */ + t.0
END

IF ~~ t11.6
SAY @411 /* My grandmother has been a true valkyrie. She dreamed of flying, of steering ships, but in truth, she never ventured far from the isles, because she married young and had four sons to raise. */
= @412 /* Yet she had inner strength. All the men on the isles respected her, and many young ones came to her for battle training. Nobody could wield a quarterstaff like her. */
= @413 /* I often wonder: were she unmarried and free, what couldn't she achieve? She would have flown high and far indeed... wouldn't she? */
= @414 /* But here I stand in her place, fighting in Tempus' name. And, by Tempus' shield, I swear am going to fly far. */
++ @415 /* I believe you. */ + t11.7
++ @416 /* I hope you'll be flying at my side. */ + t11.8
++ @417 /* Does it mean you reject marriage entirely? */ + t11.9
END

IF ~~ t11.7
SAY @418 /* And I believe in you. By Tempus' warrior spirit, your wings are the mightiest I have ever seen! */
IF ~~ + t11.10
END

IF ~~ t11.8
SAY @419 /* 'Tis an offer, then? I would love to accept. If we are both alive at the end of this mission, then... aye. We shall fly together. */
IF ~~ + t11.10
END

IF ~~ t11.9
SAY @420 /* Nay. If I fall in love, marry I might... even carry a child to term, Tempus willing. But I will not be chained to the house and hearth. Never again. */
IF ~~ + t11.10
END

IF ~~ t11.10
SAY @421 /* But the hour is growing late, and we still have much to do. Shall we move on? */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 12.

IF ~Global("O#BranTalk","GLOBAL",24)~ t12
SAY @422 /* What kind of enemy do you enjoy facing most? */
++ @423 /* Exotic ones, like beholders or illithids. They're helpless when you use proper defense. */ + t12.1
++ @424 /* Mages. Breaking their shields is always a challenge. */ + t12.2
++ @425 /* Strong ones, like giants, trolls or golems. */ + t12.3
++ @426 /* Dragons, of course! They are the hardest, but the loot is superb. */ + t12.4
++ @427 /* Other adventurers and mercenaries. The most cunning enemies. */ + t12.5
++ @428 /* Different ones. It varies from time to time. */ + t12.6
++ @429 /* I do not enjoy these battles, Branwen. */ + t12.7
++ @430 /* I really don't want to think about it now. */ + t.0
END

IF ~~ t12.1
SAY @431 /* Whacking them with a club has a certain pleasure to it, I'll admit. Ugly beasts. */
IF ~~ + t12.8
END

IF ~~ t12.2
SAY @432 /* Ha! Dispelling often works, but 'tis terribly frustrating when it doesn't. */
IF ~~ + t12.8
END

IF ~~ t12.3
SAY @433 /* Aye, each of them requires something special. Blunt edges, fire, acid... 'tis like a roaring puzzle that wishes to rip your head off. */
IF ~~ + t12.8
END

IF ~~ t12.4
SAY @434 /* Aye, a dragon's horde is every adventurer's dream. When I was a girl, 'twas often that I dreamt of finding a shining tiara in a dark cave beside a dragon's corpse. */
IF ~~ + t12.8
END

IF ~~ t12.5
SAY @435 /* And so many of them work on the side of evil. 'Tis disheartening. */
IF ~~ + t12.8
END

IF ~~ t12.6
SAY @436 /* Any enemy is a good enemy, as long as he's not a craven coward. */
IF ~~ + t12.8
END

IF ~~ t12.7
SAY @437 /* No? You loot the bodies only because you must, and that smile I saw was but a trick of the light? Must truly be so, indeed. */
IF ~~ + t12.8
END

IF ~~ t12.8
SAY @438 /* We are truly fortunate. Young, healthy and ready for battle, and, by Tempus, the next skirmish is always near! */
= @439 /* Bandits, thieves, monsters old and new... what haven't we encountered? */
= @440 /* I feel stronger and faster, too. Tempus' favor grows, and I can almost perform miracles. Bringing back the dead, curing horrible wounds... I simply never imagined. */
++ @441 /* You are a talented healer, Branwen. */ + t12.8b
++ @442 /* I feel much more powerful, too.  */ + t12.8a
END

IF ~~ t12.8a
SAY @443 /* And it shows. */
IF ~~ + t12.8b
END

IF ~~ t12.8b
SAY @444 /* I cannot thank you enough for letting me join your war party, my dear friend. */
++ @445 /* You're very welcome, Branwen. */ + t12.9
++ @446 /* The pleasure's all mine. */ + t12.9
++ @447 /* Oh, just stop gushing. */ + t12.9
END

IF ~~ t12.9
SAY @448 /* Let's find a dragon to kill! And, by Tempus, the final blow will be mine! */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ + t12.10
END

IF ~~ t12.10
SAY @449 /* I must say, nothing heats my blood like thinking of a powerful enemy... and taking a powerful lover. Think on this while we walk, won't you? */
= @450 /* And I shall think of you. */
IF ~~ EXIT
END

// Talk 13.

IF ~Global("O#BranTalk","GLOBAL",26)~ t13
SAY @451 /* We've become richer than some kings in the north by now. What are you going to do with these heaps of money? */
++ @452 /* Treat myself. Best armor, best weapons, best everything. */ + t13.1
++ @453 /* Invest. Buy a house or two, some shares, something like that. */ + t13.2
++ @454 /* Open a shop or a famous inn. Many adventurers do that. */ + t13.3
++ @455 /* I don't want to talk about money right now, Branwen. */ + t.0
END

IF ~~ t13.1
SAY @456 /* Wise. And it means new armor and weapons for me, as well, hmm? */
IF ~~ + t13.4
END

IF ~~ t13.2
SAY @457 /* 'Tis boring and time-wasting, no? Much easier to kill another dragon and rob his lair. But as it pleases you. */
IF ~~ + t13.4
END

IF ~~ t13.3
SAY @458 /* Ha! I'll come by and down a cup or two of your strongest brew, if so. */
IF ~~ + t13.4
END

IF ~~ t13.4
SAY @459 /* I never had much. Money slips through my fingers, one way or another. But Tempus provides, and I never needed much beside room, board, and a fine hammer in my hand. */
++ @460 /* What about the time when you become old? Or unable to fight? */ + t13.5
++ @461 /* I see what you mean. It's easier to live this way. */ + t13.7
++ @462 /* Well, as long as that hammer is enchanted doubly and triply and is worth a small fortune... */ + t13.6
END

IF ~~ t13.5
SAY @463 /* Tempus favors the Order of the Broken Blade. It honors those who were injured in Tempus' service. Besides, I can always heal in his name. */
IF ~~ + t13.7
END

IF ~~ t13.6
SAY @464 /* Ha! Aye, you have the right of it. But 'tis not for selling. */
IF ~~ + t13.7
END

IF ~~ t13.7
SAY @465 /* Living frugally and lightly fits me. Yet sometimes I yearn for comfort. */
= @466 /* When next we are in an inn, shall we rent a royal room, do you think? With a huge pile of Calimshan grapes on the table and a hot bath in the corner? */
++ @467 /* I'm all for it! */ + t13.8
++ @468 /* We can do that. */ + t13.8
++ @469 /* We'll see. */ + t13.8
END

IF ~~ t13.8
SAY @470 /* Oh, the anticipation! When we come there, I am going to raid the kitchen. You are coming with me: we'll grab the finest bits of the roast, and wash it down with the sweetest red wine. */
= @471 /* So what are we waiting for? Onwards! */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 14.

IF ~Global("O#BranTalk","GLOBAL",28)~ t14
SAY @472 /* You are a Bhaalspawn, and I rarely mention that, if ever. Do you want to know why? */
++ @473 /* Why? */ + t14.1
++ @356 /* Not particularly. */ + t.0
END

IF ~~ t14.1
SAY @474 /* I don't care. Well, 'tis untrue, I do, but... 'tis not fear of you. */
= @475 /* Yours is a strong, unyielding presence. Bhaal's heritage may have shaped you somewhat, but you are ruling it now. */
= @476 /* And if it tries to twist you, I rather think you'll twist it and force it into your service instead. For you are a true warrior. */
++ @477 /* Thank you. I'm honored you believe in me this much. */ + t14.2
++ @478 /* We'll see. It may not be as easy as you think. */ + t14.3
++ @479 /* Yet Bhaal was the Lord of Murder, remember? He may have a trick or two up his sleeve. */ + t14.3
END

IF ~~ t14.2
SAY @480 /* 'Tis nothing. You've done much more for me. */
IF ~~ + t14.4
END

IF ~~ t14.3
SAY @481 /* Bah! What can the old codger do? Bhaal is dead, and a living hand and will are more powerful by far. */
IF ~~ + t14.4
END

IF ~~ t14.4
SAY @482 /* Bhaal or no, you're a damn fine friend. Tell you what: if you ever decide to take your father's power, I'll still worship Tempus... but I'll send a prayer or two your way from time to time. */
++ @214 /* I'll keep it in mind. */ + t14.7
++ @483 /*  I don't want to take Bhaal's place, Branwen. */ + t14.5
++ @484 /* You won't become my high priestess? */ + t14.6
END

IF ~~ t14.5
SAY @485 /* Who says you have to? Any god's power can be turned to good, if Tempus... ahem, if the new owner wills it. */
IF ~~ + t14.7
END

IF ~~ t14.6
SAY @486 /* Nay, my dear friend. Though playing pretend would be fun. A new god and <PRO_HISHER> new high priestess. Could be amusing, no? */
IF ~~ + t14.7
END

IF ~~ t14.7
SAY @487 /* I'm really fond of you. */
IF ~~ + t14.8
IF ~Global("O#BranRomanceActive","GLOBAL",1)~ + t14.9
END

IF ~~ t14.8
SAY @488 /* You're like a <PRO_BROTHERSISTER> to me. And a true <PRO_BROTHERSISTER> in arms. */
IF ~~ + t14.10
END

IF ~~ t14.9
SAY @489 /* I have known you for a long time, and cared for you for most of it. But only now I understand that I would truly love to spend my life fighting beside you, and need naught but your smile for the reward. */
IF ~~ + t14.10
END

IF ~~ t14.10
SAY @490 /* I am glad we have met. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1) RealSetGlobalTimer("O#BranTimer","GLOBAL",3600)~ EXIT
END

// Talk 15.

IF ~Global("O#BranTalk","GLOBAL",30)~ t15
SAY @491 /* Things are getting grim, and our hunt for Irenicus will soon pay off. This should be our last talk for a while. */
= @492 /* Tempus willing, we are going to emerge victorious. But if not, know that it was an honor to fight and die by your side. */
++ @493 /* Branwen, stop this immediately. Nobody is dying. Nobody else. Is that clear? */ + t15.1
++ @494 /* The honor is mine, Branwen. */ + t15.3
++ @495 /* Nah, we'll just kick Irenicus' butt and go home. */ + t15.2
++ @496 /* Let's talk later, all right? */ + t.0
END

IF ~~ t15.1
SAY @497 /* Aye-aye, commander! */
IF ~~ + t15.3
END

IF ~~ t15.2
SAY @498 /* That we shall. With extreme prejudice, too. */
IF ~~ + t15.3
END

IF ~~ t15.3
SAY @499 /* I've been reading about summoning devas. Tempus grants that spell to the most devout of his priests. And there are very tiring, but greatly rewarding magics of greater restoration. */
= @500 /* I hope to be useful to you in this. That son of a mother is going so far down he'll need a torch to find his own ass. */
++ @501 /* Without question. */ + t15.5
++ @502 /* After I'm done with him, he won't have an ass to find. Wait, that didn't sound so good... */ + t15.4
++ @503 /* You will be useful, Branwen. Don't worry. */ + t15.5
END

IF ~~ t15.4
SAY @504 /* (Branwen snickers.) */
IF ~~ + t15.5
END

IF ~~ t15.5
SAY @505 /* Thank you for choosing me. For picking me among the brave, bright and wonderful warriors we've met on our way. 'Tis because of you I am here, a stronger priestess and a better sword hand. */
= @506 /* Here, a fine bottle of old Norheim mead. Let's uncork it together and drink to victory! */
++ @507 /* To victory! */ + t15.6
++ @508 /* To kicking Irenicus' butt! */ + t15.6
++ @509 /* To us! */ + t15.6
++ @510 /* I'll pass, but I value the gesture. */ + t15.6
END

// Since this is the last talk in the sequence of fifteen talks, we do not need to set the timer for the next one. We still need to update the variable, though.

IF ~~ t15.6
SAY @511 /* (Branwen pulls you in a huge hug.) */
= @512 /* These are the days of our lives, <CHARNAME>. Remember that. */
IF ~~ DO ~IncrementGlobal("O#BranTalk","GLOBAL",1)~ EXIT 
END

// Extra talks are very nice if you want to keep your game fresh and interesting. There are various places for that: Planar Sphere, Sahuagin city, Watcher's Keep and practically anywhere else in the game.
// Extra talks: Sahuagin city

IF ~Global("O#BranTalkSahuagin","GLOBAL",1)~ t16
SAY @513 /* I've never been underwater. To walk here, to breathe, to talk... 'tis strange indeed. I feel out of place a little. */
++ @514 /* Only a little? */ + t16.1
++ @515 /* I know what you mean. */ + t16.2
++ @516 /* I don't think it's a good time to talk right now. */ + t16.0
END

IF ~~ t16.0
SAY @517 /* You're right. Let's go. */
IF ~~ DO ~IncrementGlobal("O#BranTalkSahuagin","GLOBAL",1)~ EXIT
END

IF ~~ t16.1
SAY @518 /* Ha! Nay, I confess, a lot. */
IF ~~ + t16.2
END

IF ~~ t16.2
SAY @519 /* 'Tis going to be the strangest adventure of all, I'll wager. Shark-men, giving us orders! I'd be galled, but to be truthful, I'm rather curious. */
++ @520 /* Just wait until we meet real drow in the Underdark. */ + t16.3
++ @521 /* I'd rather slaughter them all. */ + t16.4
++ @522 /* Me, too. It's a whole different culture. */ + t16.5
END

IF ~~ t16.3
SAY @523 /* The Underdark... We're really going there, aren't we? */
IF ~~ + t16.5
END

IF ~~ t16.4
SAY @524 /* You're preaching to the quire, <PRO_BROTHERSISTER>. I'd lend you my hammer, but mine own hands are itching to grab it. */
IF ~~ + t16.5
END

IF ~~ t16.5
SAY @525 /* I'm a little ashamed at myself for looking at these domes and pools in such wonder. When I recall what this race has done to my people, I'd rather all of this didn't exist. */
= @526 /* On my home isles, sahuagin raids were especially brutal. No child or elder was safe: they slaughtered all and took no captives. They cut, pierced and drowned without mercy. My father's sister and her children... they were all... they all... */
++ @527 /* Shh, Branwen. I understand. */ + t16.6
++ @528 /* We'll kill these bastards as soon as we can. I give you my word. */ + t16.6
++ @529 /* That was then, Branwen. This is now. These are not the same sahuagin. */  + t16.6
END

IF ~~ t16.6
SAY @530 /* They're all the same. Ruthless and brutal and little better than crazed animals. Their power games might lend them a pretense of humanity, but, truly, a blight is all they are. */
= @531 /* And every blight must be purged. */
IF ~~ DO ~IncrementGlobal("O#BranTalkSahuagin","GLOBAL",1)~ EXIT
END

// Extra talks: An hour into Chapter 5.

IF ~Global("O#BranTalkSoul","GLOBAL",1)~ t17
SAY @532 /* <CHARNAME>, the time might not be right, but I worry. How are you? 'Tis a tactless question, I know, but... */
++ @533 /* It's all right, Branwen. I feel empty, but I soldier on. We all must. */ + t17.1
++ @534 /* I'm fine, but thank you for asking. */ + t17.1
++ @535 /* I really don't know what I feel right now. */ + t17.1
++ @536 /* Yes, it was tactless of you. Let's end this conversation. */ + t17.0
END

IF ~~ t17.0
SAY @537 /* 'Twill be as you wish. Please, forgive my bluntness. */
IF ~~ DO ~IncrementGlobal("O#BranTalkSoul","GLOBAL",1)~ EXIT
END

IF ~~ t17.1
SAY @538 /* You are the strongest person I know. Irenicus could never take it from you. */
= @539 /* I wonder something. That baseborn monster said he'd survived years under a similar curse. Decades, even. Does it mean that you might spend your entire life without a soul and never miss it? */
++ @540 /* Why not? Your mind remains intact, and your body, too. */ + t17.2
++ @541 /* Of course. It's just a link to the supernatural, and things like the afterlife. */ + t17.2
++ @542 /* I don't think so. Something essential is lacking. */ + t17.2
++ @543 /* Believe me, I'm missing it a lot right now. */ + t17.2
END

IF ~~ t17.2
SAY @544 /* Children of Bhaal have no afterlife, do they? They just... turn into dust, like Sarevok did, and then they disappear forever. Or wait in the former realm of Bhaal, perhaps - we'll never know. */
= @545 /* Huh. Sounds like Irenicus will see no afterlife, either, save for the pits of the burning hells. That, at least, is some consolation. */
= @546 /* Anyway, I hope that if you fall, you fall gloriously in battle, and I will defend you to my last breath. This I swear. */
++ @547 /* Will you follow me into death, if I ask you? */ + t17.3
++ @548 /* I'd rather not fall at all, thank you very much. */ + t17.4
++ @549 /* I appreciate it, Branwen. */ + t17.5
END

IF ~~ t17.3
SAY @550 /* 'Tis strange of you to ask. Of course! Is there any other answer? */
IF ~~ + t17.5
END

IF ~~ t17.4
SAY @551 /* If only 'twas for us to choose. */
IF ~~ + t17.5
END

IF ~~ t17.5
SAY @552 /* I am ever by your side, if you need my aid. But I hope we find the bastard way before you ever need it. */
= @553 /* Be strong, my dear friend. And be prepared. */
IF ~~ DO ~IncrementGlobal("O#BranTalkSoul","GLOBAL",1)~ EXIT
END

// Lovetalk 1, at rest, after talk 1 happened.

IF ~Global("O#BranLovetalk","GLOBAL",2)~ l1
SAY @554 /* <CHARNAME>, are you going to watch me undress? 'Tis most courteous of you. */
++ @555 /* Did you mean to say 'discourteous'? */ + l1.1
++ @556 /* I'll keep watching, then. */ + l1.2
++ @557 /* I wasn't watching, no. */ + l1.3a
++ @558 /* I do not think I'm interested. Good night. */ + l.0
END

IF ~~ l.0
SAY @559 /* Then we'll forget this. Good night, <CHARNAME>. */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1) SetGlobal("O#BranRomanceActive","GLOBAL",3) RestParty()~ EXIT
END

IF ~~ l1.1
SAY @560 /* Of course not. I am rather... flattered by your interest, in fact. */
IF ~~ + l1.3
END

IF ~~ l1.2
SAY @561 /* Please do. 'Tis good to be watched by a man I find desirable. */
IF ~~ + l1.3
END

IF ~~ l1.3a
SAY @562 /* Oh. My mistake. */
IF ~~ + l1.3
END

IF ~~ l1.3
SAY @563 /* Remember Baldur's Gate and our first meeting near Nashkel? I liked you well back then. */
++ @564 /* We were just friends, though. Nothing more. */ + l1.4
++ @565 /* Brings back memories of the time we were together, doesn't it? */ + l1.5
END

IF ~~ l1.4
SAY @566 /* Yes, and I regret it now, a little. */
IF ~~ + l1.6
END

IF ~~ l1.5
SAY @567 /* We parted ways, as I thought joining you made me weak. I was right in a fashion, but I was wrong, too. */
IF ~~ + l1.6
END

IF ~~ l1.6
SAY @568 /* 'Tis a mistake not pursue your passion, I see it now. You are strong, handsome, you make me smile and you've saved me. */
++ @569 /* And you like me as more than a friend, is this what you're trying to say? */ + l1.6a
++ @570 /* Branwen, I don't want to give you the wrong idea. Let's stay friends. Good night. */ + l.0
END

IF ~~ l1.6a
SAY @571 /* I do. 'Tis not an offer to spend a night with me right away, you understand. I will not fall into your arms right away, a willing victim. But give it time, and... */
++ @572 /* And? */ + l1.7
++ @573 /* We might become lovers? */ + l1.7
++ @574 /* Sorry, but I am not interested. Good night, Branwen. */ + l.0
END

IF ~~ l1.7
SAY @575 /* I like you, <CHARNAME>. I really like you. */
= @576 /* And once we've gotten used to each other again and become good friends, who knows? */
++ @577 /* If a romance doesn't work out, we'd still be good friends, right? */ + l1.8
++ @578 /* Take it slow. I get it. */ + l1.8
++ @579 /* Being friends is enough for me, so let's stop there. */ + l.0
END

IF ~~ l1.8
SAY @580 /* No matter what happens, I'll always be your friend. You know that. */
++ @581 /* All right, count me in. */ + l1.9
++ @351 /* We'll see what happens. */ + l1.9
++ @582 /* I'm still going to see other girls, mind. */ + l1.10
END

IF ~~ l1.9
SAY @583 /* Good night, <CHARNAME>. Sleep well... and, if you wish it, dream of us. */
= @584 /* I might. */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ l1.10
SAY @585 /* Ha! As if I ever doubted *that*. */
IF ~~ + l1.9
END

// Lovetalk 2, at rest, after talk 15 happens. So it's 'talk 16', or even 'talk 17' of sorts.

IF ~Global("O#BranLovetalk","GLOBAL",4)~ l2
SAY @586 /* 'Tis time to rest already? I thought... oh, but never mind. I don't think I can wait another day. */
++ @587 /* Wait for what? */ + l2.0
++ @588 /* Branwen, I think I know what you're about, and I'm not interested. */ + l.0
END

IF ~~ l2.0
SAY @589 /* Curious, are we? Come over there with me, and I'll tell you. */
++ @590 /* Very well. */ + l2.1
++ @591 /* No, I don't think I want to. */ + l.0
END

IF ~~ l2.1
SAY @592 /* Now that we're alone, I am going to whisper it to you, so you'd feel my breath on your skin. */
= @593 /* You. I want you with me tonight. I want to hold you and hear your heartbeat and moan under your touch. */
= @594 /* This night is ours. Do you want it? */
++ @595 /* I do. Come to me, Branwen. Be mine at last. */ + l2.2
++ @596 /* Of course. I loved you in Baldur's Gate, and I love you now. */ + l2.2
++ @597 /* Very much. */ + l2.2
++ @598 /* Branwen, I am not sure about this... */ + l2.1a
++ @599 /* No. We are good friends, but this is it. */ + l.0
END

IF ~~ l2.1a
SAY @600 /* I am sure enough for both of us, but... if you do not want me, is this all a mistake? And we're better off as friends instead? */
++ @601 /* No, not at all. I want you. Let's spend this night together. */ + l2.2
++ @602 /* Perhaps we are. */ + l.0
++ @603 /* If you put it like this, then yes. */ + l.0
END

IF ~~ l2.2
SAY @604 /* 'Tis Tempus' will that we are meant to be together tonight, but 'tis my heart that chose you. */
= @605 /* Be my lover, <CHARNAME>, and let the whole world wait. */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1) SetGlobal("O#BranRomanceActive","GLOBAL",2) RestParty()~ EXIT
END

// Wakeup talk to lovetalk 2. Technically, it's lovetalk 3, but you're not getting it if you refused Branwen.
// See the script for more details: Branwen/Scripts/O#BranS.baf

IF ~Global("O#BranLovetalk","GLOBAL",6)~ l3
SAY @606 /* Hello there. Did you rest well? */
++ @607 /* It was a good night. */ + l3.1
++ @608 /* Rather! */ + l3.1
++ @609 /* Could be better. Could be worse. */ + l3.0
END

IF ~~ l3.0
SAY @610 /* You rascal! I'd throw a shoe at you, but I don't see any about. */
IF ~~ + l3.1
END

IF ~~ l3.1
SAY @611 /* I hope many more nights together await us. You pleased me so much I want to ravish you all over again, but new battles await. Or?.. */
++ @612 /* To the Nine Hells with the battles. Come here. */ + l3.2
++ @613 /* No, it's time to get up. Come on! */ + l3.3
END

IF ~~ l3.2
SAY @614 /* Gladly! */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1) RealSetGlobalTimer("O#BranLoveTimer","GLOBAL",3600) RestParty()~ EXIT // we set the timer for the next lovetalk, lovetalk 4
END

IF ~~ l3.3
SAY @615 /* Irenicus'd better watch out: a satisfied valkyrie is on the loose. And, by Tempus, she is truly inspired to fight! */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1) RealSetGlobalTimer("O#BranLoveTimer","GLOBAL",3600)~ EXIT
END

// Lovetalk 4, an hour after lovetalk 3

IF ~Global("O#BranLovetalk","GLOBAL",8)~ l4
SAY @616 /* I'm truly happy these days. Despite everything. 'Twould seem strange, yet 'tis so. */
++ @617 /* Because we became lovers? */ + l4.1
++ @618 /* Because we are together again? */ + l4.1
++ @619 /* No regrets? */ + l4.2
++ @620 /* I am glad. Let's move on, all right? */ + l4.0
END

IF ~~ l4.0
SAY @621 /* As you say, my dear commander. Onwards! */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1)~ EXIT
END

IF ~~ l4.1
SAY @622 /* Of course. It gladdens my heart to wake up and know you're near. But 'tis not that alone. */
IF ~~ + l4.2
END

IF ~~ l4.2
SAY @623 /* A year before I believed I should not love a man too much. I could become too weak, and my warrior skills would suffer. And depending on anyone so much... no, that was not for me, I vowed. */
= @624 /* Yet I am here with you and I do not feel any weaker. I think I have found some inner strength. */
= @625 /* I am in love, and I am loved. The heart knows what it wants, they say. Seems like my heart is wiser than me. */
++ @626 /* I'm glad you've finally realized it. */ + l4.3
++ @627 /* As long as you don't run away again. */ + l4.3
++ @628 /* I love you, Branwen. */ + l4.3
++ @629 /* And now that's over with, let's move on. */ + l4.0
END

IF ~~ l4.3
SAY @630 /* I love you. I've always loved you, I think. Ever since the Nashkel Fair, when you chased the stone from my eyes. */
= @631 /* I do not know what the future will bring, but here and now, I am happy. And 'tis enough for me. */
++ @632 /* By Tempus, you are right! */ + l4.4
++ @633 /* And for me. */ + l4.4
++ @634 /* We'll see what the future brings. */ + l4.4
END

IF ~~ l4.4
SAY @148 /* (Branwen laughs.) */
= @635 /* Come. Let's show your enemies who holds the real power. And then we'll see what the night brings... */
IF ~~ DO ~IncrementGlobal("O#BranLovetalk","GLOBAL",1)~ EXIT
END

// Chapter 4.

IF ~Global("O#BranChapter4","GLOBAL",1)~ ch4
SAY @636 /* 'Tis a shame we had to abandon the ship. I truly enjoyed the sea voyage. */
++ @637 /* Yeah, me too. */ + ch4.2
++ @638 /* It was too long for my liking. */ + ch4.1
++ @639 /* And on a pirate ship, too! Great! */ + ch4.2
++ @640 /* Branwen, this is *really* a bad time to talk. */ + ch4.0
END

IF ~~ ch4.0
SAY @218 /* As you wish. */
IF ~~ DO ~SetGlobal("O#BranChapter4","GLOBAL",2)~ EXIT
END

IF ~~ ch4.1
SAY @641 /* It grew on me. Truth be told, I was reluctant to leave. */
IF ~~ + ch4.2
END

IF ~~ ch4.2
SAY @642 /* We should journey on a ship again one day. Perhaps a back journey to Athkatla? */
= @643 /* And now to find Imoen. Do you think she is still alive? */
++ @644 /* Of course she is! I didn't come all the way here for nothing. */ + ch4.3
++ @645 /* She lives. She must. */ + ch4.3
++ @646 /* I truly do not know, Branwen. */ + ch4.4
++ @647 /* I don't care. */ + ch4.4
END

IF ~~ ch4.3
SAY @648 /* Your confidence is refreshing. Yet my heart is in disquiet. */
IF ~~ + ch4.4
END

IF ~~ ch4.4
SAY @649 /* Irenicus must be prepared for you... if he, too, still lives. Does he perchance have an army of brainwashed Cowled Wizards under his command? Or his pet golems? */
= @650 /* I confess, I am curious and almost eager to see the villain for the first time. */
++ @651 /* Believe me, there's not much to see. Just a stupid leather outfit and a mask. */ + ch4.5
++ @652 /* I'm afraid you'll soon get your wish. */ + ch4.6
++ @653 /* Then let's find out where the coward is hiding. */ + ch4.7
END

IF ~~ ch4.5
SAY @654 /* Then we'll peel it off him to stare at what's underneath, aye? Though... maybe not. */
IF ~~ + ch4.7
END

IF ~~ ch4.6
SAY @655 /* He'll be the one regretting our meeting. */
IF ~~ + ch4.7
END

IF ~~ ch4.7
SAY @656 /* Whatever he's prepared, we'll beat him regardless. Just know that I am with you. */
IF ~~ DO ~SetGlobal("O#BranChapter4","GLOBAL",2)~ EXIT
END

// Chapter 5.

IF ~Global("O#BranChapter5","GLOBAL",1)~ ch5
SAY @657 /* The fabled Underdark! */
IF ~~ + ch5.2
IF ~OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ + ch5.1
END

IF ~~ ch5.1
SAY @658 /* You take the girl to the best places, <CHARNAME>. */
IF ~~ + ch5.2
END

IF ~~ ch5.2
SAY @659 /* The legendary home of the drow, illithid and beholders... I could never imagine I'd actually see it one day. */
= @660 /* Thank you. 'Tis truly one of the gifts I'll treasure forever. */
++ @661 /* Um, Branwen? It's a terrible, dangerous place. Not much of a gift. */ + ch5.3
++ @662 /* You're welcome. Anytime you'd like to travel to the Abyss, just say a word. */ + ch5.4
++ @663 /* It's too dangerous to chat here. We'll speak another time. */ + ch5.8
END

IF ~~ ch5.3
SAY @664 /* For someone else, perhaps, but 'tis the worthiest of gifts to me. */
IF ~~ + ch5.5
END

IF ~~ ch5.4
SAY @665 /* I'll hold you to that promise! */
IF ~~ + ch5.5
END

IF ~~ ch5.5
SAY @666 /* I'm going to guess that Irenicus passed that way before. Alone, or with that crawling thing, Bodhi? */ 
++ @667 /* Probably. These two are must be inseparable now. */ + ch5.5a
++ @668 /* Together, absolutely. */ + ch5.5a
++ @669 /* They might've split, but it's Irenicus we're after. */ + ch5.5a
++ @670 /* Does it matter? */ + ch5.5a
END

IF ~~ ch5.5a
SAY @671 /* Ah, I care not. I just want to catch them before they make mayhem somewhere else. */
= @672 /* And this time, I'll *drown* that slithering vampire in holy water. I just need one simple stake... */
++ @673 /* I have a feeling someone'll help us with that. */ + ch5.6
++ @674 /* Bodhi is just a nuisance. We need Irenicus. */ + ch5.7
++ @675 /* Let's find out what these two are up to. */ + ch5.8
END

IF ~~ ch5.6
SAY @676 /* Irenicus has many other enemies, true. Perchance we might meet? */
IF ~~ + ch5.8
END

IF ~~ ch5.7
SAY @677 /* We need his head. The rest of his body can rot for all I care. */
IF ~~ + ch5.8
END

IF ~~ ch5.8
SAY @678 /* Come on. Let's make them fear the surfacers in the Underdark! */
IF ~~ DO ~SetGlobal("O#BranChapter5","GLOBAL",2)~ EXIT
END

// Chapter 7

IF ~Global("O#BranChapter7","GLOBAL",1)~ ch7
SAY @679 /* The elven city... So that's what it's like. */
++ @680 /* Can't believe your own eyes? A familiar feeling. */ + ch7.1
++ @681 /* Majestic, isn't it? */ + ch7.1
++ @682 /* Branwen, people are dying, let's go! */ + ch7.6
END

IF ~~ ch7.1
SAY @683 /* With you, I don't know if I believe anything anymore. The world swirls and changes every instant. */
= @684 /* I talked to Kivan, laughed with Coran, teased Xan, but I never imagined when and how they lived. */
= @685 /* Incredible. So beautiful, fragile, alien, grand... breathtaking. The view alone makes my head spin. */
++ @686 /* Let's hope it makes Irenicus dizzy, too. */ + ch7.2
++ @687 /* The elves are lucky indeed. */ + ch7.4
++ @688 /* I wouldn't want to live here. */ + ch7.3
END

IF ~~ ch7.2
SAY @689 /* Ha! The madman must be out of breath with all these stairs and platforms. Alas, 'tis know that some mages can levitate. */
IF ~~ + ch7.4
END

IF ~~ ch7.3
SAY @690 /* Aye, I know what you mean. */
IF ~~ + ch7.4
END

IF ~~ ch7.4
SAY @691 /* 'Tis all the same, and it bothers me. Every house, every tower, every elf with his narrow eyes and blue-green attire... they are like ants in an anthill. */
= @692 /* Take Athkatla, take Baldur's Gate, even Beregost - each house breathed with its own personality. Each door held a secret, each window showed a story, each woman was a street heroine. */
= @693 /* Not here. To me, they look like nameless underlings in a hive, and only their mother-queen matters. Ellesime. */
++ @694 /* I get the same feeling. */ + ch7.5
++ @695 /* Let's find her, then. */ + ch7.6
++ @696 /* I think I heard her name somewhere else. Nashkel, perhaps? I can't recall. */ + ch7.7
++ @697 /* Prism built a statue of her with emeralds in her eyes. Outside Nashkel mines, remember? */ + ch7.7
END

IF ~~ ch7.5
SAY @698 /* Doesn't sound like a humble person to me, does she? Huh. */
IF ~~ + ch7.6
END

IF ~~ ch7.6
SAY @699 /* Let's find them both, Irenicus and this Ellesime, and put an end to it. The time has come. */
= @700 /* The final battle is so near I can taste it. And if our journey leads us to the Abyss itself... by Tempus' shield, it's all been worth it! */
IF ~~ DO ~SetGlobal("O#BranChapter7","GLOBAL",2)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",2)~ DO ~SetGlobal("O#BranChapter7","GLOBAL",2)~ + ch7.8
END

IF ~~ ch7.7
SAY @701 /* I remember Prism and his sculpture. But he just seemed entranced by her beauty. He knew little of what she was like... or is, if she's still alive. */
IF ~~ + ch7.6
END

IF ~~ ch7.8
SAY @702 /* (Branwen kisses you on the lips.) */
= @703 /* I love you. */
IF ~~ EXIT
END

// FLIRTS

// Branwen-initiated flirts.
// These are like little lovetalks, but they all begin with a single line. Some of them are randomized, some are not(to save time).

// Once upon a time, there were no flirts. Then Kelsey came. JCompton and Ghreyfain have started a real revolution to romance/NPC modding, and we steal their code to this day.
// Now, here comes the Branwen-initiated part. The player-initiated dialogue will come later, as it should be on the bottom of the file(since it's a default condition when you click on Branwen).

// Flirts for Branwen, O#BranRomanceActive=1

/* It's basically one big dialogue state that goes to dialogue states a2, a3, a4... depending on O#BranFlirtCounter that increases after every flirt. After each flirt, the timer sets again. You can use RandomNum(), like I did in the first flirt(a1.1 and a1.2) or skip the random component entirely. Or get rid of O#BranFlirtCounter and just use RandomNum(20,1), like most modders do. */

// We must also set O#BranFlirt back to 0, otherwise Branwen will keep flirting.

IF ~Global("O#BranFlirt","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",1)~ flirt1
SAY @704 /* (Branwen approaches you, smiling.) */
IF ~RandomNum(2,1) Global("O#BranFlirtCounter","GLOBAL",0)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a1.1
IF ~RandomNum(2,1) Global("O#BranFlirtCounter","GLOBAL",0)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a1.2
IF ~Global("O#BranFlirtCounter","GLOBAL",1)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a2
IF ~Global("O#BranFlirtCounter","GLOBAL",2)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a3
IF ~Global("O#BranFlirtCounter","GLOBAL",3)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a4
IF ~Global("O#BranFlirtCounter","GLOBAL",4)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a5
IF ~Global("O#BranFlirtCounter","GLOBAL",5)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a6
IF ~Global("O#BranFlirtCounter","GLOBAL",6)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a7
IF ~Global("O#BranFlirtCounter","GLOBAL",7)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a8
IF ~Global("O#BranFlirtCounter","GLOBAL",8)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a9
IF ~Global("O#BranFlirtCounter","GLOBAL",9)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a10
IF ~Global("O#BranFlirtCounter","GLOBAL",10)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a11
IF ~Global("O#BranFlirtCounter","GLOBAL",11)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a12
IF ~Global("O#BranFlirtCounter","GLOBAL",12)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a13
IF ~Global("O#BranFlirtCounter","GLOBAL",13)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a14
IF ~Global("O#BranFlirtCounter","GLOBAL",14)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a15
IF ~Global("O#BranFlirtCounter","GLOBAL",15)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a16
IF ~Global("O#BranFlirtCounter","GLOBAL",16)~ DO ~IncrementGlobal("O#BranFlirtCounter","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a17
IF ~Global("O#BranFlirtCounter","GLOBAL",17)~ DO ~SetGlobal("O#BranFlirtCounter","GLOBAL",0)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + a18
END

IF ~~ a1.1
SAY @705 /* Do you want some fresh almonds? I bought them in the Promenade. */
++ @706 /* Yes, please. */ + a1.11
++ @707 /* No, thanks. */ + a1.12
END

IF ~~ a1.11
SAY @708 /* Enjoy. 'Tis nice to walk and munch on something, isn't it? */
IF ~~ EXIT
END

IF ~~ a1.12
SAY @709 /* As you wish. More for me, then! */
IF ~~ EXIT
END

IF ~~ a1.2
SAY @710 /* I like your shoulders. So muscular... */
= @711 /* Relaxing tense muscles is a specialty of mine... I am a war priestess, after all. Let me help... */
++ @706 /* Yes, please. */ + a1.21
++ @712 /* Branwen, there's no need. */ + a1.22
END

IF ~~ a1.21
SAY @713 /* Mmm... I love your skin. Warm and smooth. And your arms. Let me massage your neck some more... and your shoulders... yes, like this, nice and slow... */
= @714 /* Here we are, all better. Come for seconds any time! */
IF ~~ EXIT
END

IF ~~ a1.22
SAY @715 /* Of course. 'Tis your call. */
IF ~~ EXIT
END

IF ~~ a2
SAY @716 /* (Branwen is eyeing you openly. Noticing your gaze, she winks.) */
IF ~~ EXIT
END

IF ~~ a3
SAY @717 /* Hey, <CHARNAME>. Care for a friendly spar some time? You look like a man who could handle pressure well. */
IF ~~ EXIT
END

IF ~~ a4
SAY @718 /* (Branwen lightly kisses you on the cheek.) */
= @719 /* You looked like you needed this. And maybe you did. */
IF ~~ EXIT
END

IF ~~ a5
SAY @720 /* When I think back to our time in Baldur's Gate, I oft smile. But now I'm even happier. */
IF ~~ EXIT
END

IF ~~ a6
SAY @721 /* (Branwen slips her hand in yours for a moment. Then she squeezes your fingers and lets go.) */
IF ~~ EXIT
END

IF ~~ a7
SAY @722 /* <CHARNAME>... what if a girl came up to you and kissed you? */
++ @723 /* Depends on the girl. */ + a7.1
++ @724 /* Well, I don't know... */ + a7.1
++ @725 /* I wouldn't mind. */ + a7.1
++ @168 /* No. Just no. */ + a7.0
END

IF ~~ a7.0
SAY @726 /* I see. 'Tis well I asked, then. */
IF ~~ EXIT
END

IF ~~ a7.1
SAY @727 /* Then... */
= @728 /* (Branwen steps closer and suddenly her lips are on yours, warm and eager. She kisses you until she's out of breath.) */
= @729 /* This was... */
++ @730 /* Nice, wasn't it? */ + a7.1a
++ @731 /* I liked it. */ + a7.1a
++ @732 /* I don't think we should continue this. */ + a7.2
END

IF ~~ a7.1a
SAY @733 /* Very nice. */
= @734 /* We should do it again some time. */
IF ~~ EXIT
END

IF ~~ a7.2
SAY @735 /* I see. We won't. */
IF ~~ DO ~SetGlobal("O#BranRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ a8
SAY @736 /* (Branwen flips her hair, gives you a long look... and laughs.) */
= @737 /* I confess, I like teasing you, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ a9
SAY @738 /* (She keeps walking next to you for some time, shoulder to shoulder.) */
IF ~~ EXIT
END

IF ~~ a10
SAY @739 /* I oft worry when you're wounded. I know you're stronger than this, but... be careful. */
IF ~~ EXIT
END

IF ~~ a11
SAY @740 /* By Tempus, 'tis a good day to die for our enemies! And when the day is done... */
= @741 /* (Branwen suddenly blushes.) Oh, never mind. */
IF ~~ EXIT
END

IF ~~ a12
SAY @742 /* Once upon a time there was a valiant prince who freed a fair maiden from a terrible curse. And then she fought at his side, until one day... */
= @743 /* Will you continue the story? */
IF ~~ EXIT
END

IF ~~ a13
SAY @744 /* I wish we'd spend a day or two somewhere quiet, just lazing in the sun. Kissing, maybe? */
= @745 /* But then a horde of orcs would just *happen* to come by. Argh! 'Tis so frustrating at times! */
= @746 /* Ha! I'll kiss you anyway! */
= @747 /* (Branwen gives you a warm, dry kiss on the cheek.) So there! */
IF ~~ EXIT
END

IF ~~ a14
SAY @748 /* I love your tousled hair. You're adorable when you just wake up. */
= @749 /* 'Tis hard of me not to bring you breakfast to bed. But perhaps I'll stop resisting, one day... */
IF ~~ EXIT
END

IF ~~ a15
SAY @750 /* (Branwen leans on you for a moment, her head on your shoulder.) */
= @751 /* Warm and strong. I love it. */
IF ~~ EXIT
END

IF ~~ a16
SAY @752 /* I dreamt of you last night. You were lying on the shore, wearing only a sword and a shield. */
= @753 /* Do you think it might mean something, hmm? */
IF ~~ EXIT
END

IF ~~ a17
SAY @754 /* 'Tis good to stay at your side. Perhaps one of these nights we'll have a talk about where it might lead us, no? */
IF ~~ EXIT
END

IF ~~ a18
SAY @755 /* (She presses a piece of fresh bread with cheese into your hand.) */
= @756 /* Eat. I do not want to lose my dedicated warrior. */
IF ~~ EXIT
END

// Flirts for Branwen, O#BranRomanceActive=2

IF ~Global("O#BranFlirt","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ flirt2
SAY @757 /* (Branwen grins at you wickedly.) */
IF ~Global("O#BranFlirtCounter2","GLOBAL",0)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b1
IF ~Global("O#BranFlirtCounter2","GLOBAL",1)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b2
IF ~Global("O#BranFlirtCounter2","GLOBAL",2)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b3
IF ~Global("O#BranFlirtCounter2","GLOBAL",3)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b4
IF ~Global("O#BranFlirtCounter2","GLOBAL",4)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b5
IF ~Global("O#BranFlirtCounter2","GLOBAL",5)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b6
IF ~Global("O#BranFlirtCounter2","GLOBAL",6)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b7
IF ~Global("O#BranFlirtCounter2","GLOBAL",7)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b8
IF ~Global("O#BranFlirtCounter2","GLOBAL",8)~ DO ~IncrementGlobal("O#BranFlirtCounter2","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b9
IF ~Global("O#BranFlirtCounter2","GLOBAL",9)~ DO ~SetGlobal("O#BranFlirtCounter2","GLOBAL",0)
RealSetGlobalTimer("O#BranFlirtTimer","GLOBAL",2500) SetGlobal("O#BranFlirt","GLOBAL",0)~ + b10
END

IF ~~ b1
SAY @758 /* So, who's going to be a bad boy tonight? */
IF ~~ EXIT
END

IF ~~ b2
SAY @759 /* I've got to say, 'tis true what they tell of half-gods. Both their virility... and their stamina. */
IF ~~ EXIT
END

IF ~~ b3
SAY @760 /* I enjoy fighting with you like this. Every breath, every moment. By Tempus, 'tis the best dance at all! */
IF ~~ EXIT
END

IF ~~ b4
SAY @761 /* One day I'd like us to visit the other lands. Neverwinter and Thay, Kara-Tur and the Sea of Fallen Stars... With you by my side and my hammer at my hip, 'twill be incredible. */
IF ~~ EXIT
END

IF ~~ b5
SAY @762 /* I have plans for tonight. Do you have plans? */
IF ~~ EXIT
END

IF ~~ b6
SAY @763 /* By Tempus, did you see that hit? The enemy just exploded! Truly, you are like a young god of war walking this earth with us mortals. */
= @764 /* And a fine lover. */
IF ~~ EXIT
END

IF ~~ b7
SAY @765 /* (Branwen kisses you full on the lips, her expression dreamy and distant. She seems to enjoy the kiss very much.) */
= @766 /* Sometimes I think of the day we might take our wedding vows. Don't blanch, I was just kidding! */
IF ~~ EXIT
END

IF ~~ b8
SAY @767 /* We're a fine couple, aren't we? */
= @768 /* How about I prove it to you tonight? */
IF ~~ EXIT
END

IF ~~ b9
SAY @769 /* (Branwen steps into your arms, cuddling with you for a moment.) */
= @770 /* By Tempus, it feels so good... I almost want to purr. */
IF ~~ EXIT
END

IF ~~ b10
SAY @771 /* I love every night we spend together. */
= @772 /* And I love you, <CHARNAME>. Forever and always. */
IF ~~ EXIT
END

// Player-initiated dialogue, SoA
// Player-initiated dialogue is ALWAYS true if Player1 clicks on Branwen. So, it should go at the very bottom of the file. ALL talks should go BEFORE flirts.
// Otherwise you may get Branwen stuttering and trying to initiated flirt-menu with you every few seconds.

// There are exceptions: Chapter 5, for example. In the Underdark, flirts are forbidden, so we're going to go with an extra option:

IF ~IsGabber(Player1) Global("Chapter","GLOBAL",%bg2_chapter_5%)~ O#BranPID1    		// It means Branwen's talking to the player in Chapter 5
SAY @773 /* We're in the Underdark, <CHARNAME>. Danger is about. */
IF ~~ EXIT
END

// I'm placing all her flirts into one menu. You can get several menus, if you want. Or sub-menus: each line can lead to a whole new talk, or a new menu with lots of new dialogue.
// I recommend looking at other mods and other flirts, including Domi's IWD2NPCs, BG1 NPC Project, Kelsey, and many other romance mods, to get your own unique flirts.

IF ~IsGabber(Player1)~ O#BranPID    			
SAY @774 /* What is your command? */
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",1)~ + @775 /* (Give her a flower) */ + f1.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",1)~ + @775 /* (Give her a flower) */ + f1.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",1)~ + @775 /* (Give her a flower) */ + f1.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",1)~ + @775 /* (Give her a flower) */ + f1.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",1)~ + @776 /* (Kiss her cheek) */ + f3.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",1)~ + @776 /* (Kiss her cheek) */ + f3.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",1)~ + @776 /* (Kiss her cheek) */ + f3.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",1)~ + @776 /* (Kiss her cheek) */ + f3.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @777 /* (Kiss Branwen) */ + f2.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @777 /* (Kiss Branwen) */ + f2.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @777 /* (Kiss Branwen) */ + f2.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",2)~ + @777 /* (Kiss Branwen) */ + f2.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @778 /* (Grab Branwen) */ + f4.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @778 /* (Grab Branwen) */ + f4.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @778 /* (Grab Branwen) */ + f4.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",2)~ + @778 /* (Grab Branwen) */ + f4.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",1)~ + @779 /* (Hold hands) */ + f5.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",1)~ + @779 /* (Hold hands) */ + f5.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",1)~ + @779 /* (Hold hands) */ + f5.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",1)~ + @779 /* (Hold hands) */ + f5.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @780 /* (Link arms) */ + f8.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @780 /* (Link arms) */ + f8.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @780 /* (Link arms) */ + f8.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",2)~ + @780 /* (Link arms) */ + f8.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @781 /* Let's do it tonight. */ + f6.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @781 /* Let's do it tonight. */ + f6.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @781 /* Let's do it tonight. */ + f6.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",2)~ + @781 /* Let's do it tonight. */ + f6.4
+ ~RandomNum(4,1) Global("O#BranRomanceActive","GLOBAL",1)~ + @782 /* You are beautiful. */ + f7.1
+ ~RandomNum(4,2) Global("O#BranRomanceActive","GLOBAL",1)~ + @782 /* You are beautiful. */ + f7.2
+ ~RandomNum(4,3) Global("O#BranRomanceActive","GLOBAL",1)~ + @782 /* You are beautiful. */ + f7.3
+ ~RandomNum(4,4) Global("O#BranRomanceActive","GLOBAL",1)~ + @782 /* You are beautiful. */ + f7.4
+ ~RandomNum(4,1)~ + @783 /* Hello there. */ + p1.1
+ ~RandomNum(4,2)~ + @783 /* Hello there. */ + p1.2
+ ~RandomNum(4,3)~ + @783 /* Hello there. */ + p1.3
+ ~RandomNum(4,4)~ + @783 /* Hello there. */ + p1.4
+ ~RandomNum(4,1)~ + @784 /* (Hug Branwen) */ + p2.1
+ ~RandomNum(4,2)~ + @784 /* (Hug Branwen) */ + p2.2
+ ~RandomNum(4,3)~ + @784 /* (Hug Branwen) */ + p2.3
+ ~RandomNum(4,4)~ + @784 /* (Hug Branwen) */ + p2.4
+ ~RandomNum(4,1)~ + @785 /* (Smile at Branwen) */ + p3.1
+ ~RandomNum(4,2)~ + @785 /* (Smile at Branwen) */ + p3.2
+ ~RandomNum(4,3)~ + @785 /* (Smile at Branwen) */ + p3.3
+ ~RandomNum(4,4)~ + @785 /* (Smile at Branwen) */ + p3.4
+ ~RandomNum(4,1)~ + @786 /* By Tempus' shield! */ + p4.1
+ ~RandomNum(4,2)~ + @786 /* By Tempus' shield! */ + p4.2
+ ~RandomNum(4,3)~ + @786 /* By Tempus' shield! */ + p4.3
+ ~RandomNum(4,4)~ + @786 /* By Tempus' shield! */ + p4.4
+ ~RandomNum(4,1)~ + @787 /* Thank you for being there for me. */ + p5.1
+ ~RandomNum(4,2)~ + @787 /* Thank you for being there for me. */ + p5.2
+ ~RandomNum(4,3)~ + @787 /* Thank you for being there for me. */ + p5.3
+ ~RandomNum(4,4)~ + @787 /* Thank you for being there for me. */ + p5.4
+ ~RandomNum(4,1)~ + @788 /* You are a strong warrior. I respect that. */ + p6.1
+ ~RandomNum(4,2)~ + @788 /* You are a strong warrior. I respect that. */ + p6.2
+ ~RandomNum(4,3)~ + @788 /* You are a strong warrior. I respect that. */ + p6.3
+ ~RandomNum(4,4)~ + @788 /* You are a strong warrior. I respect that. */ + p6.4
+ ~RandomNum(4,1)~ + @789 /* I think you place too much value on honor. */ + p7.1
+ ~RandomNum(4,2)~ + @789 /* I think you place too much value on honor. */ + p7.2
+ ~RandomNum(4,3)~ + @789 /* I think you place too much value on honor. */ + p7.3
+ ~RandomNum(4,4)~ + @789 /* I think you place too much value on honor. */ + p7.4
+ ~RandomNum(4,1)~ + @790 /* Could you be a bit less eager for battle? */ + p8.1
+ ~RandomNum(4,2)~ + @790 /* Could you be a bit less eager for battle? */ + p8.2
+ ~RandomNum(4,3)~ + @790 /* Could you be a bit less eager for battle? */ + p8.3
+ ~RandomNum(4,4)~ + @790 /* Could you be a bit less eager for battle? */ + p8.4
+ ~RandomNum(4,1)~ + @791 /* (Clap Branwen's shoulder) */ + p9.1
+ ~RandomNum(4,2)~ + @791 /* (Clap Branwen's shoulder) */ + p9.2
+ ~RandomNum(4,3)~ + @791 /* (Clap Branwen's shoulder) */ + p9.3
+ ~RandomNum(4,4)~ + @791 /* (Clap Branwen's shoulder) */ + p9.4
+ ~Global("O#BranQuest","GLOBAL",0)~ + @792 /* Is there any task I could complete for you? */ DO ~SetGlobal("O#BranQuest","GLOBAL",1)~ + quest
+ ~Global("O#BranShutUp","GLOBAL",0)~ + @793 /* I like our talks, but I would like some peace and quiet. */ DO ~SetGlobal("O#BranShutUp","GLOBAL",1)~ + again
+ ~Global("O#BranShutUp","GLOBAL",1)~ + @794 /* I miss our talks. Can we chat again? */ DO ~SetGlobal("O#BranShutUp","GLOBAL",0)~ + again
+ ~OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ + @795 /* I want us to just be friends. */ + breakup
++ @796 /* No, nothing. */ EXIT
END

IF ~~ again
SAY @797 /* Of course, if you wish. */
IF ~~ EXIT
END

IF ~~ breakup
SAY @798 /* 'Tis most unexpected. Are you sure? */
++ @799 /* I am. */ + breakup2
++ @800 /* No, forget it. */ + again
END

IF ~~ breakup2
SAY @801 /* I see. I will miss holding hands with you, <CHARNAME>. */
IF ~~ DO ~SetGlobal("O#BranRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ quest
SAY @802 /* I confess, there's none. You've already helped me greatly when you freed me from my stone prison and dealt with those louts from the Iron Throne. */
= @803 /* Now I am content to aid your own cause. Lead on, and I shall fight in your name! */
IF ~~ EXIT
END

// flirts

IF ~~ f1.1
SAY @804 /* Such a beautiful bloom! For me? I am honored, truly. */
IF ~~ EXIT
END

IF ~~ f1.2
SAY @805 /* It smells lovely. Thank you, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ f1.3
SAY @806 /* Such a strange thought! But 'tis pleasant, I admit. */
IF ~~ EXIT
END

IF ~~ f1.4
SAY @807 /* So beautiful... Will you help me? I want to wear it in my hair. */
IF ~~ EXIT
END

IF ~~ f2.1
SAY @808 /* Mmm! You taste so good! */
IF ~~ EXIT
END

IF ~~ f2.2
SAY @809 /* Come here, you. */
IF ~~ EXIT
END

IF ~~ f2.3
SAY @810 /* (Branwen enthusiastically kisses you back.) */
IF ~~ EXIT
END

IF ~~ f2.4
SAY @811 /* Mmmmm... */
IF ~~ EXIT
END

IF ~~ f3.1
SAY @812 /* (Branwen blushes and giggles like a girl.) */
IF ~~ EXIT
END

IF ~~ f3.2
SAY @813 /* Aww. A real gentleman, are you? */
IF ~~ EXIT
END

IF ~~ f3.3
SAY @814 /* I'd like to take good look at *your* rosy cheeks. */
IF ~~ EXIT
END

IF ~~ f3.4
SAY @815 /* Uh-oh. Looks like somebody's just kissed me! */
IF ~~ EXIT
END

IF ~~ f4.1
SAY @816 /* Hey! What are you doing! Put me down! (Branwen laughs) */
IF ~~ EXIT
END

IF ~~ f4.2
SAY @817 /* I can find something to grab, too... */
IF ~~ EXIT
END

IF ~~ f4.3
SAY @818 /* 'Tis most unseemly. What will the others think? */
= @819 /* (But she is smiling.) */
IF ~~ EXIT
END

IF ~~ f4.4
SAY @820 /* Ah! Oh, <CHARNAME>, it's you. I was about to swing my hammer at the intruder. Kiss me! */
IF ~~ EXIT
END

IF ~~ f5.1
SAY @821 /* (Branwen smiles and takes your hand.) */
IF ~~ EXIT
END

IF ~~ f5.2
SAY @822 /* (You continue walking hand in hand.) */
IF ~~ EXIT
END

IF ~~ f5.3
SAY @823 /* (Branwen's fingers slide into yours.) */
IF ~~ EXIT
END

IF ~~ f5.4
SAY @824 /* Hmm? Here's my hand, then. */
IF ~~ EXIT
END

IF ~~ f6.1
SAY @825 /* With the lights on? Or off? */
IF ~~ EXIT
END

IF ~~ f6.2
SAY @826 /* Right now might be better. But I am willing to wait... */
IF ~~ EXIT
END

IF ~~ f6.3
SAY @827 /* Oh, yes. Yes, indeed. */
IF ~~ EXIT
END

IF ~~ f6.4
SAY @828 /* Aye, sir! */
IF ~~ EXIT
END

IF ~~ f7.1
SAY @829 /* You're not so bad-looking, yourself. */
IF ~~ EXIT
END

IF ~~ f7.2
SAY @830 /* 'Tis so? Nice to hear it. */
IF ~~ EXIT
END

IF ~~ f7.3
SAY @831 /* Thank you, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ f7.4
SAY @832 /* (Branwen laughs.) Why, thank you! */
IF ~~ EXIT
END

IF ~~ f8.1
SAY @833 /* 'Tis nice to feel your arm so close. */
IF ~~ EXIT
END

IF ~~ f8.2
SAY @834 /* (Branwen laughs.) We're a regular couple now, aren't we? */
IF ~~ EXIT
END

IF ~~ f8.3
SAY @835 /* (Branwen takes your arm with a smlie.) */
IF ~~ EXIT
END

IF ~~ f8.4
SAY @836 /* (Branwen's arm is warm and strong, but it becomes softer when it touches yours.) */
IF ~~ EXIT
END

// player-initiated options both for flirts and friendship

IF ~~ p1.1
SAY @837 /* Hello! */
IF ~~ EXIT
END

IF ~~ p1.2
SAY @838 /* Hello, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ p1.3
SAY @839 /* (Branwen smiles.) */
IF ~~ EXIT
END

IF ~~ p1.4
SAY @840 /* And hello to you. */
IF ~~ EXIT
END

IF ~~ p2.1
SAY @841 /* Ha! What was that for? But I confess, 'tis pleasing. */
IF ~~ EXIT
END

IF ~~ p2.2
SAY @842 /* (Branwen smiles and hugs you back.) */
IF ~~ EXIT
END

IF ~~ p2.3
SAY @843 /* (Branwen hugs you tightly.) */
IF ~~ EXIT
END

IF ~~ p2.4
SAY @844 /* (Branwen laughs and encloses you in a huge bear-hug.) */
IF ~~ EXIT
END

IF ~~ p3.1
SAY @845 /* (Branwen returns your smile.) */
IF ~~ EXIT
END

IF ~~ p3.2
SAY @846 /* What are you smiling about? */
IF ~~ EXIT
END

IF ~~ p3.3
SAY @847 /* (Branwen smiles back at you.) */
IF ~~ EXIT
END

IF ~~ p3.4
SAY @848 /* (Branwen winks.) */
IF ~~ EXIT
END

IF ~~ p4.1
SAY @849 /* And Auril's tight buttocks! */
IF ~~ EXIT
END

IF ~~ p4.2
SAY @850 /* By Valkur's mighty blade. */
IF ~~ EXIT
END

IF ~~ p4.3
SAY @851 /* By Loki's smelly socks! */
IF ~~ EXIT
END

IF ~~ p4.4
SAY @852 /* By Valkur's strapping buttocks. */
IF ~~ EXIT
END

IF ~~ p5.1
SAY @853 /* Any time, my dear friend. */
IF ~~ EXIT
END

IF ~~ p5.2
SAY @854 /* Of course, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ p5.3
SAY @855 /* The honor is mine. */
IF ~~ EXIT
END

IF ~~ p5.4
SAY @856 /* I'm glad to be by your side. */
IF ~~ EXIT
END

IF ~~ p6.1
SAY @857 /* And I respect your abilities. Truly, together we're a fearsome sight! */
IF ~~ EXIT
END

IF ~~ p6.2
SAY @858 /* Thank you for your kind words. */
IF ~~ EXIT
END

IF ~~ p6.3
SAY @148 /* (Branwen laughs.) */
= @859 /* I like this kind of honesty. */
IF ~~ EXIT
END

IF ~~ p6.4
SAY @860 /* Nay, you are stronger by far. I am proud to remain by your side. */
IF ~~ EXIT
END

IF ~~ p7.1
SAY @861 /* If you think so, then 'tis you who places too little. */
IF ~~ EXIT
END

IF ~~ p7.2
SAY @862 /* Would you be happier travelling with an honorable sort, or with someone who'd stab you in the back? */
IF ~~ EXIT
END

IF ~~ p7.3
SAY @863 /* Remember Ajantis? My honor is my life, <CHARNAME>. As should be yours and anyone's. */
IF ~~ EXIT
END

IF ~~ p7.4
SAY @864 /* You are joking, aren't you? */
IF ~~ EXIT
END

IF ~~ p8.1
SAY @865 /* Must I also abandon my hammer and shield to appear insipid and girly? 'Twill never happen. */
IF ~~ EXIT
END

IF ~~ p8.2
SAY @866 /* Ha! Never. */
IF ~~ EXIT
END

IF ~~ p8.3
SAY @867 /* When the sun rises in the west. */
IF ~~ EXIT
END

IF ~~ p8.4
SAY @868 /* Let's allow any pack of ruffians beat us black and blue. I'll see what you say about my battle-readiness then. */
IF ~~ EXIT
END

IF ~~ p9.1
SAY @869 /* (Branwen laughs and elbows you in the ribs lightly.) */
IF ~~ EXIT
END

IF ~~ p9.2
SAY @870 /* Aye, we'll win this. And then there'll be drinking and feasting and whatever you please! */
IF ~~ EXIT
END

IF ~~ p9.3
SAY @871 /* (Branwen smiles at you and tosses her hair.) */
IF ~~ EXIT
END

IF ~~ p9.4
SAY @872 /* (She claps your shoulder in return.) */
IF ~~ EXIT
END

END // END for APPEND
