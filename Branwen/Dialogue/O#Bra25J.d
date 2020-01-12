// Read this after all SoA dialogue. Start reading with O#Bran.d
// This is Branwen's ToB main dialogue file, after she joins the party. Best read after SoA files.

BEGIN O#BRA25J

// Volo's obligatory interjection in Saradush.

EXTEND_TOP SARVOLO 9 #2
+ ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) !Global("O#BranRomanceActive","GLOBAL",2)~ + ~Tell me about Branwen.~ + O#BranVoloBio1
+ ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2)~ + ~Tell me about Branwen.~ + O#BranVoloBio2
END

CHAIN SARVOLO O#BranVoloBio1
~A priestess of Tempus and an honorable warrior without equal, Branwen of Norheim Isles inspires countless songs with her ardor in battle and her fervent devotion to her friends.~
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Ha! Flattering and accurate. What else could I ever desire?~
EXTERN SARVOLO 9

CHAIN SARVOLO O#BranVoloBio2
~They said that the Child of Bhaal found solace in the arms of a beautuful and deadly priestess of Tempus, but only now I can see that for myself! Would you grant me a private meeting, my dear? I would like to learn some of the details.~
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Certainly. As long as you burn the end result.~
EXTERN SARVOLO 9

// Solar, final interjections at the Throne of Bhaal and <CHARNAME>'s choice for the romanced protagonists.

// non-romanced

I_C_T FINSOL01 27 O#BranSolarFriend1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) !Global("O#BranRomanceActive","GLOBAL",2)~ THEN ~You are leaving, aren't you? I would be sorely tempted, if I were you. But 'tis your choice, only and forever. Good luck in making it, my friend.~
END

// romanced, Branwen and PC talk before the choice

EXTEND_BOTTOM FINSOL01 27
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarPers","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarPers","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarPers
END

CHAIN O#BRA25J O#BranSolarPers
~This is it, isn't it? This is the moment.~
END
++ ~I do not wish to leave you, Branwen. I love you.~ EXTERN O#BRA25J O#BranSolarPers1.1
++ ~I would miss you, but I want to see the planes, as well.~ EXTERN O#BRA25J O#BranSolarPers1.1
++ ~I really do not know what to choose.~ EXTERN O#BRA25J O#BranSolarPers1.1

CHAIN O#BRA25J O#BranSolarPers1.1
~I do not know what to say. 'Tis your choice and yours alone. But I can tell you this: if you stay, the world will be ours. We will travel, laugh, outwit kings, duel assassins and make love all night long.~
= ~Perhaps we'll settle down, perhaps not. But I'll love you, and I'll never leave you.~
= ~Remember this before you make a choice. Please.~
END
COPY_TRANS FINSOL01 27

// romanced, PC chooses to leave

EXTEND_BOTTOM FINSOL01 29
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarLeave","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarLeave","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarLeave
END

EXTEND_BOTTOM FINSOL01 30
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarLeave","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarLeave","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarLeave
END

EXTEND_BOTTOM FINSOL01 31
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarLeave","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarLeave","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarLeave
END

CHAIN O#BRA25J O#BranSolarLeave
~Then fly, my dear lover. Fly high and fly far. And I shall watch you from below. Our lives are short, but I'll remember you for the rest of mine.~
END
COPY_TRANS FINSOL01 29

// romanced, PC chooses to stay

EXTEND_BOTTOM FINSOL01 32
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarStay","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarStay","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarStay
END

CHAIN O#BRA25J O#BranSolarStay
~I... what?~
END
++ ~Told you I loved you, didn't I?~ EXTERN O#BRA25J O#BranSolarStay1.1
++ ~I am going to live my life as a mortal. With you.~ EXTERN O#BRA25J O#BranSolarStay1.1
++ ~That.~ EXTERN O#BRA25J O#BranSolarStay1.1

CHAIN O#BRA25J O#BranSolarStay1.1
~This is the best day ever. And forevermore.~
= ~I demand a kiss. A huge kiss. Right now.~
= ~I love you, my dear mortal. Best of all the world.~
COPY_TRANS FINSOL01 32

// Branwen's Gorion Wraith sequence.

EXTEND_BOTTOM HGWRA01 18
IF ~Global("O#BranRomanceActive","GLOBAL",2) InParty("O#Bran") See("O#Bran")~ EXTERN HGWRA01 O#BranWraith1
END

CHAIN HGWRA01 O#BranWraith1
~What of the inevitable pain you must give to the one you love? The priestess you call 'Branwen'.~
== O#BRA25J ~<CHARNAME> loves me, and I am happy with him.~
EXTERN HGWRA01 24

EXTEND_BOTTOM HGWRA01 24
IF ~Global("O#BranRomanceActive","GLOBAL",2)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("O#BranG")~ EXIT
END

BEGIN O#BRANG 

CHAIN 
IF ~Global("O#BranWraithSpirit1","GLOBAL",0)~ THEN O#BRANG O#BranWraithSpirit1
~My granddaughter. You have grown tall, yet there's no sense in your head!~
DO ~SetGlobal("O#BranWraithSpirit1","GLOBAL",1)~
== O#BRA25J ~G-grandmother?~
== O#BRANG ~Still not wearing my woolen socks, I see. No hot milk before bed, either. And to top it all, you're bedding a Bhaalspawn!~
== O#BRA25J ~Am not!~
== O#BRANG ~Are too!~
== O#BRA25J ~(sigh) All right, I am.~
== O#BRANG ~He is going to doom you, you know. DOOM you. And then you'll rape and pillage and murder together, and whole cities will burn because of you two! Even if you remember to wear my woolen socks, which you won't!~
== O#BRA25J ~That's... that's not true!~
END
++ ~I'm not a murderer! Well, maybe a little.~ EXTERN HGWRA01 25
++ ~Stop it, Gorion! She doesn't deserve this!~ EXTERN HGWRA01 25
+ ~CheckStatGT(Player1,16,WIS)~ + ~It's a lie, Branwen! Don't believe it!~ EXTERN HGWRA01 25
++ ~Enough! I won't allow this to continue! And woolen socks are itchy!~ EXTERN HGWRA01 25

// Branwen's talk after Gorion Wraith:

APPEND O#BRA25J

IF ~Global("O#BranWraithSpirit1","GLOBAL",2)~ w1
SAY ~That son of a mother! I want to kill him all over again!~
++ ~Easy, easy, Branwen. He's dead.~ + w1.1
++ ~All right. You're the priestess.~ + w1.1
++ ~I'm sorry he brought you such pain.~ + w1.1
END

IF ~~ w1.1
SAY ~(Branwen suddenly snickers.) Actually, 'twas nice to see grandmother again. And she was right, I'm not wearing warm socks, though I should.~
= ~But that ugly, undead thing! Ugh! I'm glad 'tis destroyed at last.~
= ~Let's go. And thank you.~
++ ~You're very welcome.~ + w1.2
++ ~Thank you for what?~ + w1.3
END

IF ~~ w1.2
SAY ~We're going to be naughty again tonight, I hope? 'Twill be a disappointment if my grandmother's proven wrong.~
IF ~~ DO ~SetGlobal("O#BranWraithSpirit1","GLOBAL",3)~ EXIT
END

IF ~~ w1.3
SAY ~For giving that bastard a what for.~
IF ~~ + w1.2
END

END // For APPEND

// Various non-essential interjection for ToB.

I_C_T AMMERC02 1 O#BranSaemonMet11
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~About time, I say. If you need a knife, I'm ready to loan you one, here.~
END 

I_C_T BAZDRA01 0 O#BranDrakonis1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Draconis, huh? You're no dragon, boy. Stand aside if you wish to live.~
END

I_C_T SARMEL01 56 O#BranSARMEL0156
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~And what's your interest in this, old woman?~
END

I_C_T SARMEL01 40 O#BranMelissanYagaTemple1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Or maybe you are. <CHARNAME> has nothing to fear from some fat redhead in a pair of too-small shorts.~
END

I_C_T SARMEL01 63 O#BranMelissanGiantDead1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~You returned from Saradush? What happened there?~
END

I_C_T SARKIS01 4 O#BranSARKIS014
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Huh?~
END

I_C_T HGNYA01 6 O#BranHGNYA016
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Waiting for <CHARNAME>. Just like... well, always. Why am I not surprised?~
END

I_C_T SENGUA03 1 O#BranSENGUA03
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~At last, honorable combat! I have been waiting ages for this!~
END

I_C_T BALTH 6 O#BranBalth6
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~He's helping us, but he doesn't very much care for us. Huh. Are these Bhaalspawn his enemies, too?~
END

I_C_T BALTH 17 O#BranBalth17
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN ~Uh-huh. Does it mean we have a new enemy? Ahh, scratch that. She's toast.~
END

// Watcher's Keep interjections are tricky. If we're visiting it in SoA, we should have interjections with Branwen's SoA dialogue file, and in ToB - with ToB one. Fortunately, we can do both, we just need to check if Chapter>7 for ToB.

// Watcher's Keep interjections, ToB

I_C_T GORPOL1 1 O#BranMetKnightsOfTheVigil1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN ~It must be bringing great disquiet to your ranks, surely.~
END

I_C_T GORCHR 2 O#BranChromaticDemon2
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN ~And, of course, you're just bursting with desire to give us the key. Or not.~
END

I_C_T GORIMP01 4 O#BranImpDeadWizards1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN ~You don't seem very concerned, imp.~
END

I_C_T GORCAMB 9 O#BranCambion9
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN ~But you could try and get yourself out, yes?~
END

I_C_T GORDEMO 1 O#BranImprisonedOneMet1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN ~I feel some alien presence here. Do not trust it. I doubt these manacles are here for nothing.~
END

I_C_T GORODR1 35 O#BranOdrenFoolishness1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN ~You betrayed us! <CHARNAME>, if you wish to kill these craven cowards now, just say the word.~
END

// Same lines, different dialogue file - O#BRANJ, if Chapter<8(SoA). We're compiling all Watcher's Keep interjection in this ToB file, so all of them are together here.

// Watcher's Keep interjections, SoA

I_C_T GORPOL1 1 O#BranMetKnightsOfTheVigil1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN ~It must be bringing great disquiet to your ranks, surely.~
END

I_C_T GORCHR 2 O#BranChromaticDemon2
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN ~And, of course, you're just bursting with desire to give us the key. Or not.~
END

I_C_T GORIMP01 4 O#BranImpDeadWizards1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN ~You don't seem very concerned, imp.~
END

I_C_T GORCAMB 9 O#BranCambion9
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN ~But you could try and get yourself out, yes?~
END

I_C_T GORDEMO 1 O#BranImprisonedOneMet1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN ~I feel some alien presence here. Do not trust it. I doubt these manacles are here for nothing.~
END

I_C_T GORODR1 35 O#BranOdrenFoolishness1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN ~You betrayed us! <CHARNAME>, if you wish to kill these craven cowards now, just say the word.~
END

APPEND O#BRA25J

// ToB talks - these trigger if Branwen is your friend and if Branwen is romanced. If she is romanced, music plays.

// ToB Talk 1.

IF ~Global("O#BranTalkToB","GLOBAL",2)~ b1
SAY ~Here we are, playing games with demigods. Have you ever wanted this, <CHARNAME>?~
++ ~Of course. It means my victory - and my ascension.~ + b1.1
++ ~I don't know. Maybe after this, I'll be free.~ + b1.2
++ ~No. Never. I feel like a chess piece.~ + b1.3
++ ~It was inevitable. Alaundo predicted these events, you know.~ + b1.3
++ ~Let's talk later.~ + b.0
END

IF ~~ b.0
SAY ~As you wish.~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

IF ~~ b1.1
SAY ~You may want power or whatnot, but I wouldn't count on it. It seems like that Solar's in power, not you.~
IF ~~ + b1.3
END

IF ~~ b1.2
SAY ~Or dead. That happens a lot during wars, too.~
IF ~~ + b1.3
END

IF ~~ b1.3
SAY ~It leaves bitter taste in my mouth. Played like dolls, moved at this Solar's whim... bah.~
= ~I prayed to Tempus, but received only blind warmth in return. Whatever his reasons, my Lord of Battles isn't answering.~
= ~Argh, I'd dig my nails deep into Solar's perfect face, if I could. That bitch! Let her fight her own wars and leave us alone. If you wanted to fight your siblings, you'd have done it years ago.~
++ ~I didn't know about them years ago, Branwen.~ + b1.4
++ ~Solar's actually helping me. She gave me a pocket plane and sent me to Saradush.~ + b1.5
++ ~I don't like her, either. Too arrogant for my taste.~ + b1.6
++ ~Maybe she's not that unkillable...~ + b1.7
END

IF ~~ b1.4
SAY ~True... and yet this blue meanie annoys me to no end.~ 
IF ~~ + b1.8
END

IF ~~ b1.5
SAY ~To advance her goals. Or not? She's not human, and she may have her own interest in you... or your failure.~ 
IF ~~ + b1.8
END

IF ~~ b1.6
SAY ~And too blue. Though I like her wings. A pretty pair.~ 
IF ~~ + b1.8
END

IF ~~ b1.7
SAY ~Ha! I like the way you think.~
IF ~~ + b1.8
END

IF ~~ b1.8
SAY ~Now look at me. Complaining like a fishwife, and for what?~
= ~'Tis meaningless. We have beaten Irenicus, we've saved an entire city of elves, and we are here, friends and comrades to the bitter end. *That's* what matters.~
++ ~Too true.~ + b1.9
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + ~Much more than comrades, Branwen.~ + b1.9
++ ~No, you're right. That Solar bears watching.~ + b1.10
END

IF ~~ b1.9
SAY ~'Tis a pleasure to be with you. Walking, laughing... even complaining. I just wanted to say that.~
= ~Now, let the grand adventure begin!~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

IF ~~ b1.10
SAY ~A good divine spanking is what she deserves. But enough of her.~
IF ~~ + b1.9
END

// ToB Talk 2.

IF ~Global("O#BranTalkToB","GLOBAL",4)~ b2
SAY ~I'd like us to buy a boat. A ship, maybe. Or should we rent it instead?~
++ ~What are you talking about?~ + b2.1
++ ~A ship voyage? I'm interested.~ + b2.1
++ ~Not now, Branwen.~ + b.0
END

IF ~~ b2.1
SAY ~Ah, 'tis an old dream of mine, to travel round the world. But I more thought of escaping this place.~
= ~After this is done... we will win. We must. But a general of a winning army is oft unwelcome in war-torn lands.~
++ ~So, you wish to offer me a ship to get us out of here?~ + b2.4
++ ~What if you're wrong? I was welcome in Suldanessellar, why won't I be unwelcome in Tethyr?~ + b2.2
++ ~We might also lose.~ + b2.3
END

IF ~~ b2.2
SAY ~Wasn't queen Ellesime eager to get rid of you and yours, hmm? By Tempus, I could swear she was.~
IF ~~ + b2.4
END

IF ~~ b2.3
SAY ~In our enemies' dreams. They might wish themselves invincible, my dear <CHARNAME>, but nothing compares to you.~
IF ~~ + b2.4
END

IF ~~ b2.4
SAY ~Trust a priestess of Tempus, 'tis unwise to overstay your welcome when a war is over. All the wounded, all the grieving, all who lost husbands, sons and homes... they will turn on you in an instant.~
= ~And fires burn fast.~
= ~But in other lands, you will be hailed a hero, and your career will soar. In the meantime, Tethyr will heal her wounds, and one day the same people will sing praises of your return. You'll see.~
++ ~A wise enough plan.~ + b2.5
++ ~Travelling again? I want to settle down.~ + b2.5a
++ ~An interesting point of view.~ + b2.5
++ ~Let's wait and see how it ends, first.~ + b2.5
END

IF ~~ b2.5a
SAY ~So do I, sometimes. But we can't always get what we want.~
IF ~~ + b2.5
END

IF ~~ b2.5
SAY ~I'll miss this adventure, though. The grim prophecy, the war... even the fires. Truly, sometimes I doubt whether I'm made for peace.~
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + ~You're made for me, and that's all I need.~ + b2.6
++ ~Sometimes I think it's true for me, too.~ + b2.7
++ ~We'll have to wait and see, won't we?~ + b2.7
END

IF ~~ b2.6
SAY ~Flatterer. But you're *my* flatterer, and that's all I need.~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

IF ~~ b2.7
SAY ~Without a doubt. And the future's not far away at all.~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

// ToB talk 3.

IF ~Global("O#BranTalkToB","GLOBAL",6)~ b3
SAY ~'Tis strange to be so powerful. Calling sunrays at night, blasting vampires into oblivion with but a thought, and having elemental princes at my beck and call.~
++ ~Really puts things in perspective, doesn't it?~ + b3.1
++ ~I'm enjoying it, myself.~ + b3.1
++ ~Such power means responsibility.~ + b3.1
++ ~Let's talk another time, Branwen.~ + b.0
END

IF ~~ b3.1
SAY ~I've just realized that I'll never be able to work with city militia or mercenaries again. Head them, maybe. Or give orders to the ones who head them, more like.~
= ~No more walking the roads for me. Or hunting bandits and rescuing peasants. I *could* do it, I imagine, but knowing that somewhere else my word could stop a war... or start it...~
= ~'Tis making me sad a little. That simple life we lost.~
++ ~But we gained so much.~ + b3.2
++ ~I know what you mean. Any ogre could kill us back then, and a single diamond was beyond our dreams.~ + b3.2
++ ~We haven't lost it entirely. You can always take a vacation from grand crusades and play pretend in Beregost again.~ + b3.2
END

IF ~~ b3.2
SAY ~Ahhh, 'tis no use to moan. We can still walk the roads, but this time, we'll fight liches and their armies, corrupted kings and their plots, dragons and their vast hoards and minions! And, by Tempus, I'll laugh at anyone who'd say 'tis worse!~
++ ~That's Branwen we know and love. Welcome back.~ + b3.3
++ ~I don't know. Killing goblins had its charm.~ + b3.3
++ ~You have a point.~ + b3.3
END

IF ~~ b3.3
SAY ~You know, when this is over, I'll probably miss this adventure, too. And my friends' grandchildren will hear me complaining about not meeting proper enemies like giants and demiliches anymore.~
= ~That said, the adventure isn't over yet, so let's move on!~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ + b3.4
END

IF ~~ b3.4
SAY ~That is, after I kiss you first.~
= ~Mmm... yes, that's much better.~
IF ~~ EXIT
END

// ToB talk 4.

IF ~Global("O#BranTalkToB","GLOBAL",8)~ b4
SAY ~Looks like your dead father is stirring in his grave. He wanted to be reborn with the deaths of his children, right?~
++ ~And they keep dying. Yes, you're correct.~ + b4.1
++ ~Bhaal is dead. It'll take more than a few deaths to resurrect him.~ + b4.1
++ ~I don't think he'll ever come back.~ + b4.1
++ ~Branwen, I'm in no mood to discuss Bhaal.~ + b.0
END

IF ~~ b4.1
SAY ~'Twould be hard, but if someone wanted to, they could bring him back... I think. His priests are still out there, aren't they?~
= ~Bhaal was a right bastard, but not half as mad as his so-called heir, Cyric. Someone needs to do the dirty job, and if your father comes back, you will be free of his heritage. Not a bad idea, hmm?~
++ ~You forget one tiny detail. If Bhaal comes back, he'll need my essence, like Irenicus did.~ + b4.2
++ ~What if I want to take Cyric's place, instead?~ + b4.3
++ ~Bringing Bhaal back? No. Never.~ + b4.4
++ ~Why not? Things can't become worse than they are now, can it?~ + b4.5
END

IF ~~ b4.2
SAY ~Aye. Too bad you can't just get rid of it.~
IF ~~ + b4.6
END

IF ~~ b4.3
SAY ~Do you? Dealing with ghosts and skeletons all the time and never leaving the Abyss? Ugh.~
IF ~~ + b4.6
END

IF ~~ b4.4
SAY ~Aw, you're no fun at all!~
IF ~~ + b4.6
END

IF ~~ b4.5
SAY ~<CHARNAME>, adventurers never say these things. Because things can *always* become worse. 'Tis the first law of adventuring.~
= ~Or were you teasing me, you little trickster?~
IF ~~ + b4.6
END

IF ~~ b4.6
SAY ~Anyway, I just feel like we're following a road someone laid for us and we can't turn back or left or right. And going forward makes me feel rebellious. I wish to do something, anything, to turn the tide!~
++ ~How about winning?~ + b4.7
++ ~Well, resurrecting Bhaal is a capital Bad Idea.~ + b4.8
++ ~We will. Just you wait.~ + b4.9
END

IF ~~ b4.7
SAY ~(Branwen laughs.) Good idea.~
IF ~~ + b4.9
END

IF ~~ b4.8
SAY ~Aye, perhaps. He wasn't a perfect father, that's for sure.~
IF ~~ + b4.9
END

IF ~~ b4.9
SAY ~Never mind my misgivings. I believe in you, <CHARNAME>. But you know that.~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

// ToB talk 5.

IF ~Global("O#BranTalkToB","GLOBAL",10)~ b5
SAY ~Soon our work will be done here. How about another adventure somewhere in the East? Or North? Or south? Even west... though that'd bring us to the sea and the Sword Coast again. Still, the world is vast.~
+ ~!Global("O#BranRomanceActive","GLOBAL",2)~ + ~Do you propose to continue adventuring together?~ + b5.1
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + ~Do you propose to continue adventuring together?~ + b5.2
++ ~Branwen, let's talk later.~ + b.0
END

IF ~~ b5.1
SAY ~If you have other plans, 'twould be unwise of me to insist. But if you want us all to go on, hammer in hand and bedrolls firmly tied to our backs, then, yes, my friend. I can think of nowhere else I'd rather be.~
++ ~All right. If we continue adventuring, you'll be right by my side.~ + b5.1a
++ ~I cannot promise anything, Branwen. But I'll think about it.~ + b5.1b
++ ~Actually, I'd like to retire from adventuring, at least for a while.~ + b5.1c
++ ~I might want to spend some time with my lover instead.~ + b5.1c
END

IF ~~ b5.1a
SAY ~Yess! By Tempus' mighty underpants, yes!~
IF ~~ + b5.3
END

IF ~~ b5.1b
SAY ~Thank you. Tis all I ask.~
IF ~~ + b5.3
END

IF ~~ b5.1c
SAY ~I understand. Well, if some of our old friends would still want to travel, I'd join them gladly. And you'll be awaited eagerly.~
IF ~~ + b5.3
END

IF ~~ b5.2
SAY ~'Tis the best thing that could ever happen to me. Meeting you, adventuring with you. Do you think I'd ever want to leave your side?~
++ ~Neither I would want to leave yours.~ + b5.2a
++ ~What about settling down or having children?~ + b5.2b
++ ~People change, and so do their feelings.~ + b5.2c
END

IF ~~ b5.2a
SAY ~We're a right pair of doves, aren't we? Only very well armed.~
IF ~~ + b5.3
END

IF ~~ b5.2b
SAY ~Maybe, if you wish. I'm not sure about letting kids follow us on adventures when they’re too young, but I do not doubt goblins and orcs will flee from their cribs in terror.~
IF ~~ + b5.3
END

IF ~~ b5.2c
SAY ~Not mine. Never mine.~
IF ~~ + b5.3
END

IF ~~ b5.3
SAY ~We're going to be happy. Whether on our own or with a war party, miles apart or drinking together, we are going to have long, happy, amazing lives. Promise me we will, <CHARNAME>. Promise me.~
++ ~I promise, Branwen.~ + b5.5
++ ~I don't need to promise. It's obvious.~ + b5.4
++ ~Who knows? But I'd like our lives to turn out like that.~ + b5.5
++ ~We'll see.~ + b5.5
END

IF ~~ b5.4
SAY ~Isn't it just? But our lives have been amazing all the same. Even with all the darkness.~ 
IF ~~ + b5.5
END

IF ~~ b5.5
SAY ~The final battle for your heritage draws near. You probably need to think, to prepare, so I won't be disrupting your thoughts.~
= ~Just know that you may turn to me each time you need me.~
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)~ EXIT // last talk, so no need for a timer
END

// ToB, Saradush, at waking up - Branwen's romanced lovetalk(all romances have them)

IF ~Global("O#BranSaradush","GLOBAL",1)~ b6
SAY ~'Tis late, but I'm lying awake nevertheless. Saradush... they're all dead, aren't they?~
++ ~Aye.~ + b6.2
++ ~So many dead... I can't sleep, either.~ + b6.2
++ ~This is war. People die, and sometimes entire cities are sacked.~ + b6.1
++ ~I don't want to think about it. Let's rest some more.~ + b6.0
END

IF ~~ b6.0
SAY ~Sleep well, my love.~
IF ~~ DO ~SetGlobal("O#BranSaradush","GLOBAL",2) RestParty()~ EXIT
END

IF ~~ b6.1
SAY ~Aye, 'tis expected in war. But was it war? Slaughter, more like.~
IF ~~ + b6.2
END

IF ~~ b6.2
SAY ~I wish to turn back time and warn these people. Take them to that pocket plane of yours, one by one, or smuggle them beyond the city walls.~
= ~Or destroy Yaga-Shura's army and let the lone giant have at the walls. Invulnerable or no, he'd be buried under a pile of stinking rubble soon enough.~
= ~'Tis impossible, I know. I'm only dreaming. But to know that all those people I talked and laughted with, or bought bread from... are dead...~
= ~No, I should not keep you up. Rest, <CHARNAME>. You need it.~
++ ~Thank you, Branwen. Good night.~ + b6.0
++ ~I am willing to listen, if you want to talk.~ + b6.3
END

IF ~~ b6.3
SAY ~Talking to you is oft a pleasure, true... but not tonight. These people are dead; can words bring them back? No.~
= ~But I am shamefully, unduly relieved that you are alive and unharmed. I was worried that crone lied to us, and that Yaga-Shura would be as strong as ever. By Tempus, I was so happy when I learnt I was wrong!~
= ~Listen to me. A warrior I might be, but I worry like any woman. And you... almost a god, but you bleed like any man. Who are we, <CHARNAME>?~
++ ~Lovers. Sleep, Branwen. There's a long day tomorrow.~ + b6.0
++ ~Just <CHARNAME> and Branwen.~ + b6.4
++ ~A future god and his loyal priestess.~ + b6.4
++ ~I don't know.~ + b6.5
END

IF ~~ b6.4
SAY ~Are we?~
IF ~~ + b6.5
END

IF ~~ b6.5
SAY ~But 'tis past time we both were asleep. I'll pray for people of Saradush next morn, when tears fall less freely.~
= ~Do you wish to sleep some more? Or is it time to awaken already?~
++ ~Let's sleep some more.~ + b6.0
++ ~No, it is time to go.~ + b6.6
END

IF ~~ b6.6
SAY ~As you wish, then.~
IF ~~ DO ~SetGlobal("O#BranSaradush","GLOBAL",2)~ EXIT
END

// ToB challenge 3: innocence.

IF ~Global("O#BranChallenge3","GLOBAL",1)~ b7
SAY ~Solar continues to put you through the grind, doesn't she? Do you wish to talk of your last challenge?~
++ ~I was offered my doubt and innocence back. To return to my own personal past.~ + b7.1
++ ~It was about returning to my roots, losing my memories and experience and becoming as I once was, before I met you.~ + b7.1
++ ~No, it's fine.~ + b7.0
END

IF ~~ b7.0
SAY ~As you say.~
IF ~~ DO ~SetGlobal("O#BranChallenge3","GLOBAL",2)~ EXIT 
END

IF ~~ b7.1
SAY ~You were offered death, weren't you? Erasing your memory... it's like dying, no? The person you are is gone, replaced by the person you used to be.~
= ~I am glad you refused. Truly, I am rather fond of the person you are.~
++ ~Me, too, however strange it sounds.~ + b7.2
++ ~Well, I wasn't actually given a chance to agree. The spirit expected me to refuse.~ + b7.2
++ ~The funniest thing happened at the end, when the spirit turned into a Slayer. Looks like there's no doubt or innocence for me anymore.~ + b7.2
END

IF ~~ b7.2
SAY ~There's no way back, right? Only forward. Maybe that's what the spirit of the challenge tried to show you.~
= ~I follow Tempus and his tenets, but the world of the spiritual is far away from me. I've always hated its riddles. All I know is my hammer and my friends, and that never failed me.~
= ~I wish you could ask Solar, but she only answers what she wants, doesn't she? I vote we give her an ice bath, the way Rashemi barbarians greet the newcomers to their lodge. I bet she'll like it.~
++ ~Good idea. You hold her legs, I'll grab her wings.~ + b7.3
++ ~Another challenge like that, and I just might.~ + b7.3
++ ~Let's not anger the Solar. Remember, she can always send us back... oh, wait.~ + b7.3
END

IF ~~ b7.3
SAY ~(Branwen snickers.)~
= ~'Tis never boring with you, <CHARNAME>. I love you for that.~
IF ~~ DO ~SetGlobal("O#BranChallenge3","GLOBAL",2)~ EXIT 
END

// ToB, the last night, lovetalk only. Triggers at rest when the last of the Five(BALTH) is dead.

IF ~Global("O#BranLastNight","GLOBAL",1)~ b8
SAY ~Hey. Sit with me for a short while?~
++ ~Sure.~ + b8.1
++ ~Branwen, I'm sleepy.~ + b8.1
++ ~Maybe another time.~ + b8.1
END

IF ~~ b8.0
SAY ~Of course, my love. Sleep well.~
IF ~~ DO ~SetGlobal("O#BranLastNight","GLOBAL",2) RestParty()~ EXIT
END

IF ~~ b8.1
SAY ~'Tis the last time we sit like this near the fire. Tomorrow you may be far away on Mount Celestia... or in the Abyss, for all I know.~
= ~Stay with me tonight. Let's make it a night to remember.~
++ ~Of course. But I am not going anywhere.~ + b8.2
++ ~I'm all for it.~ + b8.2
++ ~If you really want this...~ + b8.2
++ ~No, I'd really like to sleep.~ + b8.0
END

IF ~~ b8.2
SAY ~I don't know what will happen when that Solar appears before us for the final time. I don't know if Melissan is going to try and become a god or not. It doesn't matter tonight.~
= ~There's only a man and a woman. You and me. Our past, our future, our present.~
= ~Don't mind the shadows. Just love me like you always do.~
++ ~I will...~ + b8.3
++ ~Come to me...~ + b8.3
++ ~No, I changed my mind. Not tonight.~ + b8.0
END

IF ~~ b8.3
SAY ~I am yours...~
IF ~~ DO ~SetGlobal("O#BranLastNight","GLOBAL",2) RestParty()~ EXIT
END

// ToB, final challenge, killing the Ravager, romance only

IF ~Global("O#BranChallenge5","GLOBAL",1)~ b9
SAY ~(Branwen kisses you hotly without warning.)~
= ~Whatever happens... whatever comes... I will always love you.~
= ~'Tis not a goodbye, my love. Just a reminder.~
IF ~~ DO ~SetGlobal("O#BranChallenge5","GLOBAL",2)~ EXIT
END

// Branwen-initiated flirts

// Flirts for Branwen, O#BranRomanceActive=2

IF ~Global("O#BranFlirtToB","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ flirt3
SAY ~(Branwen smiles at you warmly.)~ [O#BRAN00]
IF ~Global("O#BranFlirtCounter3","GLOBAL",0)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f1
IF ~Global("O#BranFlirtCounter3","GLOBAL",1)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f2
IF ~Global("O#BranFlirtCounter3","GLOBAL",2)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f3
IF ~Global("O#BranFlirtCounter3","GLOBAL",3)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f4
IF ~Global("O#BranFlirtCounter3","GLOBAL",4)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f5
IF ~Global("O#BranFlirtCounter3","GLOBAL",5)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f6
IF ~Global("O#BranFlirtCounter3","GLOBAL",6)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f7
IF ~Global("O#BranFlirtCounter3","GLOBAL",7)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f8
IF ~Global("O#BranFlirtCounter3","GLOBAL",8)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f9
IF ~Global("O#BranFlirtCounter3","GLOBAL",9)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f10
IF ~Global("O#BranFlirtCounter3","GLOBAL",10)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f11
IF ~Global("O#BranFlirtCounter3","GLOBAL",11)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f12
IF ~Global("O#BranFlirtCounter3","GLOBAL",12)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f13
IF ~Global("O#BranFlirtCounter3","GLOBAL",13)~ DO ~IncrementGlobal("O#BranFlirtCounter3","GLOBAL",1)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f14
IF ~Global("O#BranFlirtCounter3","GLOBAL",14)~ DO ~SetGlobal("O#BranFlirtCounter3","GLOBAL",0)
RealSetGlobalTimer("O#BranFlirtTimerToB","GLOBAL",2500) SetGlobal("O#BranFlirtToB","GLOBAL",0)~ + f15
END

IF ~~ f1
SAY ~Come morning, you are going to be exhausted.~
= ~In a very pleasant way.~
IF ~~ EXIT
END

IF ~~ f2
SAY ~I enjoy the meals we have together. By Tempus, I might yet become a good cook!~
= ~Ha! Kidding.~
IF ~~ EXIT
END

IF ~~ f3
SAY ~(Branwen caresses your shoulders thoughtfully.) I love doing that. If only you were naked...~
IF ~~ EXIT
END

IF ~~ f4
SAY ~I love imagining our future travels. Nights under the starry sky... with you...~
= ~Ahem. I'd better turn my thoughts to the road ahead.~
IF ~~ EXIT
END

IF ~~ f5
SAY ~(Branwen gives you a quick kiss and smiles.)~
IF ~~ EXIT
END

IF ~~ f6
SAY ~By Tempus, I never imagined... I simply never imagined.~
= ~(Her eyes shine at you.)~
IF ~~ EXIT
END

IF ~~ f7
SAY ~(Branwen extends her arm, and you walk hand in hand for a while.)~
IF ~~ EXIT
END

IF ~~ f8
SAY ~Hey, you. How about another kiss while we're out of enemies to kill?~
= ~Ah, there's another one. Rats!~
IF ~~ EXIT
END

IF ~~ f9
SAY ~(She kisses you fully, slowly, thoroughly.)~
IF ~~ EXIT
END

IF ~~ f10
SAY ~(Branwen is singing. Very quietly, almost shyly, but you finally recognize the words.)~
= ~(She is singing your name.)~
IF ~~ EXIT
END

IF ~~ f11
SAY ~I would enjoy a breakfast to bed, I think. Some eggs, bread and honey, and a huge cup of milk. Some bacon, too.~
= ~And a very generous helping of you.~
IF ~~ EXIT
END

IF ~~ f12
SAY ~When we kill the Five, I'm going to go through the loot again. By Tempus, our gear should be perfect!~
= ~Because we are perfect. And tonight we will fit... perfectly.~
IF ~~ EXIT
END

IF ~~ f13
SAY ~I would love to show you the Seawolf one day. Our isles are oft unwelcome in bitter weather, but when the sun comes out, everything shines.~
IF ~~ EXIT
END

IF ~~ f14
SAY ~The end will come soon now, won't it?~
= ~(Branwen bites her lip.) Oh, never mind. We'll come through, I know.~
IF ~~ EXIT
END

IF ~~ f15
SAY ~I love you. Every day.~
IF ~~ EXIT
END

// Player-initiated dialogue, ToB. Again, in the bottom of the file, and, again, no flirting for the final battle, AR6200.

IF ~IsGabber(Player1) AreaCheck("AR6200")~ PPID0
SAY ~<CHARNAME>, there's no time for this! We need to get Melissan!~
IF ~~ EXIT
END

IF ~IsGabber(Player1)~ PPID
SAY ~What is your command?~ [o#bran18]
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Kiss Branwen)~ + p7.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Kiss Branwen)~ + p7.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Kiss Branwen)~ + p7.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Hold Branwen)~ + p8.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Hold Branwen)~ + p8.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Hold Branwen)~ + p8.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Smile at Branwen)~ + p9.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Smile at Branwen)~ + p9.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + ~(Smile at Branwen)~ + p9.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + ~I love you, Branwen.~ + p10.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + ~I love you, Branwen.~ + p10.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + ~I love you, Branwen.~ + p10.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + ~Whatever shall we do tonight?~ + p11.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + ~Whatever shall we do tonight?~ + p11.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + ~Whatever shall we do tonight?~ + p11.3
+ ~RandomNum(3,1)~ + ~Things are looking up!~ + p0.1
+ ~RandomNum(3,2)~ + ~Things are looking up!~ + p0.2
+ ~RandomNum(3,3)~ + ~Things are looking up!~ + p0.3
+ ~RandomNum(3,1)~ + ~Are you all right?~ + p1.1
+ ~RandomNum(3,2)~ + ~Are you all right?~ + p1.2
+ ~RandomNum(3,3)~ + ~Are you all right?~ + p1.3
+ ~RandomNum(3,1)~ + ~Do you miss Baldur's Gate and Athkatla?~ + p2.1
+ ~RandomNum(3,2)~ + ~Do you miss Baldur's Gate and Athkatla?~ + p2.2
+ ~RandomNum(3,3)~ + ~Do you miss Baldur's Gate and Athkatla?~ + p2.3
+ ~RandomNum(3,1)~ + ~This journey will be over soon.~ + p3.1
+ ~RandomNum(3,2)~ + ~This journey will be over soon.~ + p3.2
+ ~RandomNum(3,3)~ + ~This journey will be over soon.~ + p3.3
+ ~RandomNum(3,1)~ + ~Does Tempus approve of your role in this?~ + p4.1
+ ~RandomNum(3,2)~ + ~Does Tempus approve of your role in this?~ + p4.2
+ ~RandomNum(3,3)~ + ~Does Tempus approve of your role in this?~ + p4.3
+ ~RandomNum(3,1)~ + ~Thank you for remaining at my side.~ + p5.1
+ ~RandomNum(3,2)~ + ~Thank you for remaining at my side.~ + p5.2
+ ~RandomNum(3,3)~ + ~Thank you for remaining at my side.~ + p5.3
+ ~RandomNum(3,1)~ + ~Let's kick someone's ass right and proper!~ + p6.1
+ ~RandomNum(3,2)~ + ~Let's kick someone's ass right and proper!~ + p6.2
+ ~RandomNum(3,3)~ + ~Let's kick someone's ass right and proper!~ + p6.3
+ ~Global("O#BranShutUp","GLOBAL",0)~ + ~I like our talks, but I would like some peace and quiet.~ DO ~SetGlobal("O#BranShutUp","GLOBAL",1)~ + again
+ ~Global("O#BranShutUp","GLOBAL",1)~ + ~I miss our talks. Can we chat again?~ DO ~SetGlobal("O#BranShutUp","GLOBAL",0)~ + again
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + ~I want us to just be friends.~ + breakup
++ ~No, there's nothing.~ EXIT
END

IF ~~ again
SAY ~Of course, if you wish.~
IF ~~ EXIT
END

IF ~~ breakup
SAY ~Oh. I... I see. Are you sure?~
++ ~I am.~ + breakup2
++ ~No, forget it.~ + again
END

IF ~~ breakup2
SAY ~<CHARNAME>, I...~
= ~No, never mind. It's over.~
IF ~~ DO ~SetGlobal("O#BranRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ p0.1
SAY ~They are indeed!~
IF ~~ EXIT
END

IF ~~ p0.2
SAY ~We are going to win. There is no doubt.~
IF ~~ EXIT
END

IF ~~ p0.3
SAY ~These Five? They've already lost.~
IF ~~ EXIT
END

IF ~~ p1.1
SAY ~Oh, fine! Thanks for asking.~
IF ~~ EXIT
END

IF ~~ p1.2
SAY ~More or less. I don't think we're putting all these healing potions to good use.~
IF ~~ EXIT
END

IF ~~ p1.3
SAY ~(yawn) A little tired.~
IF ~~ EXIT
END

IF ~~ p2.1
SAY ~A little. Well, a lot.~
IF ~~ EXIT
END

IF ~~ p2.2
SAY ~Those were the times, weren't they? But these are the times, too.~
IF ~~ EXIT
END

IF ~~ p2.3
SAY ~Baldur's Gate, mostly. And Beregost.~
IF ~~ EXIT
END

IF ~~ p3.1
SAY ~But the road is never over.~
IF ~~ EXIT
END

IF ~~ p3.2
SAY ~Not for us. Our journeys are just beginning.~
IF ~~ EXIT
END

IF ~~ p3.3
SAY ~I just hope it won't end abruptly, as Xan would say.~
IF ~~ EXIT
END

IF ~~ p4.1
SAY ~You are important to me. He knows.~
IF ~~ EXIT
END

IF ~~ p4.2
SAY ~I doubt that Tempus can interfere. But I know, he understands.~
IF ~~ EXIT
END

IF ~~ p4.3
SAY ~As long as we conduct ourselves with honor.~
IF ~~ EXIT
END

IF ~~ p5.1
SAY ~'Tis my pleasure.~
IF ~~ EXIT
END

IF ~~ p5.2
SAY ~I am happy to.~
IF ~~ EXIT
END

IF ~~ p5.3
SAY ~Thank you for letting me stay.~
IF ~~ EXIT
END

IF ~~ p6.1
SAY ~Let's!~
IF ~~ EXIT
END

IF ~~ p6.2
SAY ~Finally! We're marching out immediately!~
IF ~~ EXIT
END

IF ~~ p6.3
SAY ~At once!~
IF ~~ EXIT
END

IF ~~ p7.1
SAY ~Mmmm! More!~
IF ~~ EXIT
END

IF ~~ p7.2
SAY ~(Branwen eagerly kisses you in return.)~
IF ~~ EXIT
END

IF ~~ p7.3
SAY ~Mmm... you're so tasty!~
IF ~~ EXIT
END

IF ~~ p8.1
SAY ~(Branwen cuddles in your arms and sighs.)~
IF ~~ EXIT
END

IF ~~ p8.2
SAY ~(Branwen smiles, looking up from your shoulder.)~
IF ~~ EXIT
END

IF ~~ p8.3
SAY ~(She's warm and pliant in your arms, but you feel unyielding hardness underneath.)~
IF ~~ EXIT
END

IF ~~ p9.1
SAY ~(Branwen smiles back at you with her eyes.)~
IF ~~ EXIT
END

IF ~~ p9.2
SAY ~(Branwen winks back.)~
IF ~~ EXIT
END

IF ~~ p9.3
SAY ~(Branwen laughs.)~
IF ~~ EXIT
END

IF ~~ p10.1
SAY ~And I love you, <CHARNAME>.~
IF ~~ EXIT
END

IF ~~ p10.2
SAY ~Really? But I love you, too.~
IF ~~ EXIT
END

IF ~~ p10.3
SAY ~I love you.~
IF ~~ EXIT
END

IF ~~ p11.1
SAY ~I suggest knitting. It calms the nerves, you see.~
IF ~~ EXIT
END

IF ~~ p11.2
SAY ~Why don't you show me?~
IF ~~ EXIT
END

IF ~~ p11.3
SAY ~I think I know the answer. I'll whisper it to you while you undress.~
IF ~~ EXIT
END

END // End to APPEND