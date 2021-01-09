// Read this after all SoA dialogue. Start reading with O#Bran.d
// This is Branwen's ToB main dialogue file, after she joins the party. Best read after SoA files.

BEGIN O#BRA25J

// Volo's obligatory interjection in Saradush.

EXTEND_TOP SARVOLO 9 #2
+ ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) !Global("O#BranRomanceActive","GLOBAL",2)~ + @0 /* Tell me about Branwen. */ + O#BranVoloBio1
+ ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2)~ + @0 /* Tell me about Branwen. */ + O#BranVoloBio2
END

CHAIN SARVOLO O#BranVoloBio1
@1 /* A priestess of Tempus and an honorable warrior without equal, Branwen of Norheim Isles inspires countless songs with her ardor in battle and her fervent devotion to her friends. */
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @2 /* Ha! Flattering and accurate. What else could I ever desire? */
EXTERN SARVOLO 9

CHAIN SARVOLO O#BranVoloBio2
@3 /* They said that the Child of Bhaal found solace in the arms of a beautuful and deadly priestess of Tempus, but only now I can see that for myself! Would you grant me a private meeting, my dear? I would like to learn some of the details. */
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @4 /* Certainly. As long as you burn the end result. */
EXTERN SARVOLO 9

// Solar, final interjections at the Throne of Bhaal and <CHARNAME>'s choice for the romanced protagonists.

// non-romanced

I_C_T FINSOL01 27 O#BranSolarFriend1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) !Global("O#BranRomanceActive","GLOBAL",2)~ THEN @5 /* You are leaving, aren't you? I would be sorely tempted, if I were you. But 'tis your choice, only and forever. Good luck in making it, my friend. */
END

// romanced, Branwen and PC talk before the choice

EXTEND_BOTTOM FINSOL01 27
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarPers","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarPers","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarPers
END

CHAIN O#BRA25J O#BranSolarPers
@6 /* This is it, isn't it? This is the moment. */
END
++ @7 /* I do not wish to leave you, Branwen. I love you. */ EXTERN O#BRA25J O#BranSolarPers1.1
++ @8 /* I would miss you, but I want to see the planes, as well. */ EXTERN O#BRA25J O#BranSolarPers1.1
++ @9 /* I really do not know what to choose. */ EXTERN O#BRA25J O#BranSolarPers1.1

CHAIN O#BRA25J O#BranSolarPers1.1
@10 /* I do not know what to say. 'Tis your choice and yours alone. But I can tell you this: if you stay, the world will be ours. We will travel, laugh, outwit kings, duel assassins and make love all night long. */
= @11 /* Perhaps we'll settle down, perhaps not. But I'll love you, and I'll never leave you. */
= @12 /* Remember this before you make a choice. Please. */
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
@13 /* Then fly, my dear lover. Fly high and fly far. And I shall watch you from below. Our lives are short, but I'll remember you for the rest of mine. */
END
COPY_TRANS FINSOL01 29

// romanced, PC chooses to stay

EXTEND_BOTTOM FINSOL01 32
IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) Global("O#BranRomanceActive","GLOBAL",2) Global("O#BranSolarStay","GLOBAL",0)~ DO ~SetGlobal("O#BranSolarStay","GLOBAL",1)~ EXTERN O#BRA25J O#BranSolarStay
END

CHAIN O#BRA25J O#BranSolarStay
@14 /* I... what? */
END
++ @15 /* Told you I loved you, didn't I? */ EXTERN O#BRA25J O#BranSolarStay1.1
++ @16 /* I am going to live my life as a mortal. With you. */ EXTERN O#BRA25J O#BranSolarStay1.1
++ @17 /* That. */ EXTERN O#BRA25J O#BranSolarStay1.1

CHAIN O#BRA25J O#BranSolarStay1.1
@18 /* This is the best day ever. And forevermore. */
= @19 /* I demand a kiss. A huge kiss. Right now. */
= @20 /* I love you, my dear mortal. Best of all the world. */
COPY_TRANS FINSOL01 32

// Branwen's Gorion Wraith sequence.

EXTEND_BOTTOM HGWRA01 18
IF ~Global("O#BranRomanceActive","GLOBAL",2) InParty("O#Bran") See("O#Bran")~ EXTERN HGWRA01 O#BranWraith1
END

CHAIN HGWRA01 O#BranWraith1
@21 /* What of the inevitable pain you must give to the one you love? The priestess you call 'Branwen'. */
== O#BRA25J @22 /* <CHARNAME> loves me, and I am happy with him. */
EXTERN HGWRA01 24

EXTEND_BOTTOM HGWRA01 24
IF ~Global("O#BranRomanceActive","GLOBAL",2)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("O#BranG")~ EXIT
END

BEGIN O#BRANG 

CHAIN 
IF ~Global("O#BranWraithSpirit1","GLOBAL",0)~ THEN O#BRANG O#BranWraithSpirit1
@23 /* My granddaughter. You have grown tall, yet there's no sense in your head! */
DO ~SetGlobal("O#BranWraithSpirit1","GLOBAL",1)~
== O#BRA25J @24 /* G-grandmother? */
== O#BRANG @25 /* Still not wearing my woolen socks, I see. No hot milk before bed, either. And to top it all, you're bedding a Bhaalspawn! */
== O#BRA25J @26 /* Am not! */
== O#BRANG @27 /* Are too! */
== O#BRA25J @28 /* (sigh) All right, I am. */
== O#BRANG @29 /* He is going to doom you, you know. DOOM you. And then you'll rape and pillage and murder together, and whole cities will burn because of you two! Even if you remember to wear my woolen socks, which you won't! */
== O#BRA25J @30 /* That's... that's not true! */
END
++ @31 /* I'm not a murderer! Well, maybe a little. */ EXTERN HGWRA01 25
++ @32 /* Stop it, Gorion! She doesn't deserve this! */ EXTERN HGWRA01 25
+ ~CheckStatGT(Player1,16,WIS)~ + @33 /* It's a lie, Branwen! Don't believe it! */ EXTERN HGWRA01 25
++ @34 /* Enough! I won't allow this to continue! And woolen socks are itchy! */ EXTERN HGWRA01 25

// Branwen's talk after Gorion Wraith:

APPEND O#BRA25J

IF ~Global("O#BranWraithSpirit1","GLOBAL",2)~ w1
SAY @35 /* That son of a mother! I want to kill him all over again! */
++ @36 /* Easy, easy, Branwen. He's dead. */ + w1.1
++ @37 /* All right. You're the priestess. */ + w1.1
++ @38 /* I'm sorry he brought you such pain. */ + w1.1
END

IF ~~ w1.1
SAY @39 /* (Branwen suddenly snickers.) Actually, 'twas nice to see grandmother again. And she was right, I'm not wearing warm socks, though I should. */
= @40 /* But that ugly, undead thing! Ugh! I'm glad 'tis destroyed at last. */
= @41 /* Let's go. And thank you. */
++ @42 /* You're very welcome. */ + w1.2
++ @43 /* Thank you for what? */ + w1.3
END

IF ~~ w1.2
SAY @44 /* We're going to be naughty again tonight, I hope? 'Twill be a disappointment if my grandmother's proven wrong. */
IF ~~ DO ~SetGlobal("O#BranWraithSpirit1","GLOBAL",3)~ EXIT
END

IF ~~ w1.3
SAY @45 /* For giving that bastard a what for. */
IF ~~ + w1.2
END

END // For APPEND

// Various non-essential interjection for ToB.

I_C_T AMMERC02 1 O#BranSaemonMet11
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @46 /* About time, I say. If you need a knife, I'm ready to loan you one, here. */
END 

I_C_T BAZDRA01 0 O#BranDrakonis1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @47 /* Draconis, huh? You're no dragon, boy. Stand aside if you wish to live. */
END

I_C_T SARMEL01 56 O#BranSARMEL0156
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @48 /* And what's your interest in this, old woman? */
END

I_C_T SARMEL01 40 O#BranMelissanYagaTemple1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @49 /* Or maybe you are. <CHARNAME> has nothing to fear from some fat redhead in a pair of too-small shorts. */
END

I_C_T SARMEL01 63 O#BranMelissanGiantDead1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @50 /* You returned from Saradush? What happened there? */
END

I_C_T SARKIS01 4 O#BranSARKIS014
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @51 /* Huh? */
END

I_C_T HGNYA01 6 O#BranHGNYA016
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @52 /* Waiting for <CHARNAME>. Just like... well, always. Why am I not surprised? */
END

I_C_T SENGUA03 1 O#BranSENGUA03
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @53 /* At last, honorable combat! I have been waiting ages for this! */
END

I_C_T BALTH 6 O#BranBalth6
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @54 /* He's helping us, but he doesn't very much care for us. Huh. Are these Bhaalspawn his enemies, too? */
END

I_C_T BALTH 17 O#BranBalth17
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID)~ THEN @55 /* Uh-huh. Does it mean we have a new enemy? Ahh, scratch that. She's toast. */
END

// Watcher's Keep interjections are tricky. If we're visiting it in SoA, we should have interjections with Branwen's SoA dialogue file, and in ToB - with ToB one. Fortunately, we can do both, we just need to check if Chapter>7 for ToB.

// Watcher's Keep interjections, ToB

I_C_T GORPOL1 1 O#BranMetKnightsOfTheVigil1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @56 /* It must be bringing great disquiet to your ranks, surely. */
END

I_C_T GORCHR 2 O#BranChromaticDemon2
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @57 /* And, of course, you're just bursting with desire to give us the key. Or not. */
END

I_C_T GORIMP01 4 O#BranImpDeadWizards1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @58 /* You don't seem very concerned, imp. */
END

I_C_T GORCAMB 9 O#BranCambion9
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @59 /* But you could try and get yourself out, yes? */
END

I_C_T GORDEMO 1 O#BranImprisonedOneMet1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @60 /* I feel some alien presence here. Do not trust it. I doubt these manacles are here for nothing. */
END

I_C_T GORODR1 35 O#BranOdrenFoolishness1
== O#BRA25J IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN @61 /* You betrayed us! <CHARNAME>, if you wish to kill these craven cowards now, just say the word. */
END

// Same lines, different dialogue file - O#BRANJ, if Chapter<8(SoA). We're compiling all Watcher's Keep interjection in this ToB file, so all of them are together here.

// Watcher's Keep interjections, SoA

I_C_T GORPOL1 1 O#BranMetKnightsOfTheVigil1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN @56 /* It must be bringing great disquiet to your ranks, surely. */
END

I_C_T GORCHR 2 O#BranChromaticDemon2
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN @57 /* And, of course, you're just bursting with desire to give us the key. Or not. */
END

I_C_T GORIMP01 4 O#BranImpDeadWizards1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN @58 /* You don't seem very concerned, imp. */
END

I_C_T GORCAMB 9 O#BranCambion9
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN @59 /* But you could try and get yourself out, yes? */
END

I_C_T GORDEMO 1 O#BranImprisonedOneMet1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN @60 /* I feel some alien presence here. Do not trust it. I doubt these manacles are here for nothing. */
END

I_C_T GORODR1 35 O#BranOdrenFoolishness1
== O#BRANJ IF ~InParty("O#Bran") InMyArea("O#Bran") !StateCheck("O#Bran",CD_STATE_NOTVALID) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN @61 /* You betrayed us! <CHARNAME>, if you wish to kill these craven cowards now, just say the word. */
END

APPEND O#BRA25J

// ToB talks - these trigger if Branwen is your friend and if Branwen is romanced. If she is romanced, music plays.

// ToB Talk 1.

IF ~Global("O#BranTalkToB","GLOBAL",2)~ b1
SAY @62 /* Here we are, playing games with demigods. Have you ever wanted this, <CHARNAME>? */
++ @63 /* Of course. It means my victory - and my ascension. */ + b1.1
++ @64 /* I don't know. Maybe after this, I'll be free. */ + b1.2
++ @65 /* No. Never. I feel like a chess piece. */ + b1.3
++ @66 /* It was inevitable. Alaundo predicted these events, you know. */ + b1.3
++ @67 /* Let's talk later. */ + b.0
END

IF ~~ b.0
SAY @68 /* As you wish. */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

IF ~~ b1.1
SAY @69 /* You may want power or whatnot, but I wouldn't count on it. It seems like that Solar's in power, not you. */
IF ~~ + b1.3
END

IF ~~ b1.2
SAY @70 /* Or dead. That happens a lot during wars, too. */
IF ~~ + b1.3
END

IF ~~ b1.3
SAY @71 /* It leaves bitter taste in my mouth. Played like dolls, moved at this Solar's whim... bah. */
= @72 /* I prayed to Tempus, but received only blind warmth in return. Whatever his reasons, my Lord of Battles isn't answering. */
= @73 /* Argh, I'd dig my nails deep into Solar's perfect face, if I could. That bitch! Let her fight her own wars and leave us alone. If you wanted to fight your siblings, you'd have done it years ago. */
++ @74 /* I didn't know about them years ago, Branwen. */ + b1.4
++ @75 /* Solar's actually helping me. She gave me a pocket plane and sent me to Saradush. */ + b1.5
++ @76 /* I don't like her, either. Too arrogant for my taste. */ + b1.6
++ @77 /* Maybe she's not that unkillable... */ + b1.7
END

IF ~~ b1.4
SAY @78 /* True... and yet this blue meanie annoys me to no end. */ 
IF ~~ + b1.8
END

IF ~~ b1.5
SAY @79 /* To advance her goals. Or not? She's not human, and she may have her own interest in you... or your failure. */ 
IF ~~ + b1.8
END

IF ~~ b1.6
SAY @80 /* And too blue. Though I like her wings. A pretty pair. */ 
IF ~~ + b1.8
END

IF ~~ b1.7
SAY @81 /* Ha! I like the way you think. */
IF ~~ + b1.8
END

IF ~~ b1.8
SAY @82 /* Now look at me. Complaining like a fishwife, and for what? */
= @83 /* 'Tis meaningless. We have beaten Irenicus, we've saved an entire city of elves, and we are here, friends and comrades to the bitter end. *That's* what matters. */
++ @84 /* Too true. */ + b1.9
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + @85 /* Much more than comrades, Branwen. */ + b1.9
++ @86 /* No, you're right. That Solar bears watching. */ + b1.10
END

IF ~~ b1.9
SAY @87 /* 'Tis a pleasure to be with you. Walking, laughing... even complaining. I just wanted to say that. */
= @88 /* Now, let the grand adventure begin! */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

IF ~~ b1.10
SAY @89 /* A good divine spanking is what she deserves. But enough of her. */
IF ~~ + b1.9
END

// ToB Talk 2.

IF ~Global("O#BranTalkToB","GLOBAL",4)~ b2
SAY @90 /* I'd like us to buy a boat. A ship, maybe. Or should we rent it instead? */
++ @91 /* What are you talking about? */ + b2.1
++ @92 /* A ship voyage? I'm interested. */ + b2.1
++ @93 /* Not now, Branwen. */ + b.0
END

IF ~~ b2.1
SAY @94 /* Ah, 'tis an old dream of mine, to travel round the world. But I more thought of escaping this place. */
= @95 /* After this is done... we will win. We must. But a general of a winning army is oft unwelcome in war-torn lands. */
++ @96 /* So, you wish to offer me a ship to get us out of here? */ + b2.4
++ @97 /* What if you're wrong? I was welcome in Suldanessellar, why won't I be unwelcome in Tethyr? */ + b2.2
++ @98 /* We might also lose. */ + b2.3
END

IF ~~ b2.2
SAY @99 /* Wasn't queen Ellesime eager to get rid of you and yours, hmm? By Tempus, I could swear she was. */
IF ~~ + b2.4
END

IF ~~ b2.3
SAY @100 /* In our enemies' dreams. They might wish themselves invincible, my dear <CHARNAME>, but nothing compares to you. */
IF ~~ + b2.4
END

IF ~~ b2.4
SAY @101 /* Trust a priestess of Tempus, 'tis unwise to overstay your welcome when a war is over. All the wounded, all the grieving, all who lost husbands, sons and homes... they will turn on you in an instant. */
= @102 /* And fires burn fast. */
= @103 /* But in other lands, you will be hailed a hero, and your career will soar. In the meantime, Tethyr will heal her wounds, and one day the same people will sing praises of your return. You'll see. */
++ @104 /* A wise enough plan. */ + b2.5
++ @105 /* Travelling again? I want to settle down. */ + b2.5a
++ @106 /* An interesting point of view. */ + b2.5
++ @107 /* Let's wait and see how it ends, first. */ + b2.5
END

IF ~~ b2.5a
SAY @108 /* So do I, sometimes. But we can't always get what we want. */
IF ~~ + b2.5
END

IF ~~ b2.5
SAY @109 /* I'll miss this adventure, though. The grim prophecy, the war... even the fires. Truly, sometimes I doubt whether I'm made for peace. */
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + @110 /* You're made for me, and that's all I need. */ + b2.6
++ @111 /* Sometimes I think it's true for me, too. */ + b2.7
++ @112 /* We'll have to wait and see, won't we? */ + b2.7
END

IF ~~ b2.6
SAY @113 /* Flatterer. But you're *my* flatterer, and that's all I need. */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

IF ~~ b2.7
SAY @114 /* Without a doubt. And the future's not far away at all. */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

// ToB talk 3.

IF ~Global("O#BranTalkToB","GLOBAL",6)~ b3
SAY @115 /* 'Tis strange to be so powerful. Calling sunrays at night, blasting vampires into oblivion with but a thought, and having elemental princes at my beck and call. */
++ @116 /* Really puts things in perspective, doesn't it? */ + b3.1
++ @117 /* I'm enjoying it, myself. */ + b3.1
++ @118 /* Such power means responsibility. */ + b3.1
++ @119 /* Let's talk another time, Branwen. */ + b.0
END

IF ~~ b3.1
SAY @120 /* I've just realized that I'll never be able to work with city militia or mercenaries again. Head them, maybe. Or give orders to the ones who head them, more like. */
= @121 /* No more walking the roads for me. Or hunting bandits and rescuing peasants. I *could* do it, I imagine, but knowing that somewhere else my word could stop a war... or start it... */
= @122 /* 'Tis making me sad a little. That simple life we lost. */
++ @123 /* But we gained so much. */ + b3.2
++ @124 /* I know what you mean. Any ogre could kill us back then, and a single diamond was beyond our dreams. */ + b3.2
++ @125 /* We haven't lost it entirely. You can always take a vacation from grand crusades and play pretend in Beregost again. */ + b3.2
END

IF ~~ b3.2
SAY @126 /* Ahhh, 'tis no use to moan. We can still walk the roads, but this time, we'll fight liches and their armies, corrupted kings and their plots, dragons and their vast hoards and minions! And, by Tempus, I'll laugh at anyone who'd say 'tis worse! */
++ @127 /* That's Branwen we know and love. Welcome back. */ + b3.3
++ @128 /* I don't know. Killing goblins had its charm. */ + b3.3
++ @129 /* You have a point. */ + b3.3
END

IF ~~ b3.3
SAY @130 /* You know, when this is over, I'll probably miss this adventure, too. And my friends' grandchildren will hear me complaining about not meeting proper enemies like giants and demiliches anymore. */
= @131 /* That said, the adventure isn't over yet, so let's move on! */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
IF ~Global("O#BranRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ + b3.4
END

IF ~~ b3.4
SAY @132 /* That is, after I kiss you first. */
= @133 /* Mmm... yes, that's much better. */
IF ~~ EXIT
END

// ToB talk 4.

IF ~Global("O#BranTalkToB","GLOBAL",8)~ b4
SAY @134 /* Looks like your dead father is stirring in his grave. He wanted to be reborn with the deaths of his children, right? */
++ @135 /* And they keep dying. Yes, you're correct. */ + b4.1
++ @136 /* Bhaal is dead. It'll take more than a few deaths to resurrect him. */ + b4.1
++ @137 /* I don't think he'll ever come back. */ + b4.1
++ @138 /* Branwen, I'm in no mood to discuss Bhaal. */ + b.0
END

IF ~~ b4.1
SAY @139 /* 'Twould be hard, but if someone wanted to, they could bring him back... I think. His priests are still out there, aren't they? */
= @140 /* Bhaal was a right bastard, but not half as mad as his so-called heir, Cyric. Someone needs to do the dirty job, and if your father comes back, you will be free of his heritage. Not a bad idea, hmm? */
++ @141 /* You forget one tiny detail. If Bhaal comes back, he'll need my essence, like Irenicus did. */ + b4.2
++ @142 /* What if I want to take Cyric's place, instead? */ + b4.3
++ @143 /* Bringing Bhaal back? No. Never. */ + b4.4
++ @144 /* Why not? Things can't become worse than they are now, can it? */ + b4.5
END

IF ~~ b4.2
SAY @145 /* Aye. Too bad you can't just get rid of it. */
IF ~~ + b4.6
END

IF ~~ b4.3
SAY @146 /* Do you? Dealing with ghosts and skeletons all the time and never leaving the Abyss? Ugh. */
IF ~~ + b4.6
END

IF ~~ b4.4
SAY @147 /* Aw, you're no fun at all! */
IF ~~ + b4.6
END

IF ~~ b4.5
SAY @148 /* <CHARNAME>, adventurers never say these things. Because things can *always* become worse. 'Tis the first law of adventuring. */
= @149 /* Or were you teasing me, you little trickster? */
IF ~~ + b4.6
END

IF ~~ b4.6
SAY @150 /* Anyway, I just feel like we're following a road someone laid for us and we can't turn back or left or right. And going forward makes me feel rebellious. I wish to do something, anything, to turn the tide! */
++ @151 /* How about winning? */ + b4.7
++ @152 /* Well, resurrecting Bhaal is a capital Bad Idea. */ + b4.8
++ @153 /* We will. Just you wait. */ + b4.9
END

IF ~~ b4.7
SAY @154 /* (Branwen laughs.) Good idea. */
IF ~~ + b4.9
END

IF ~~ b4.8
SAY @155 /* Aye, perhaps. He wasn't a perfect father, that's for sure. */
IF ~~ + b4.9
END

IF ~~ b4.9
SAY @156 /* Never mind my misgivings. I believe in you, <CHARNAME>. But you know that. */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)
RealSetGlobalTimer("O#BranTimerToB","GLOBAL",3600)~ EXIT
END

// ToB talk 5.

IF ~Global("O#BranTalkToB","GLOBAL",10)~ b5
SAY @157 /* Soon our work will be done here. How about another adventure somewhere in the East? Or North? Or south? Even west... though that'd bring us to the sea and the Sword Coast again. Still, the world is vast. */
+ ~!Global("O#BranRomanceActive","GLOBAL",2)~ + @158 /* Do you propose to continue adventuring together? */ + b5.1
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + @158 /* Do you propose to continue adventuring together? */ + b5.2
++ @159 /* Branwen, let's talk later. */ + b.0
END

IF ~~ b5.1
SAY @160 /* If you have other plans, 'twould be unwise of me to insist. But if you want us all to go on, hammer in hand and bedrolls firmly tied to our backs, then, yes, my friend. I can think of nowhere else I'd rather be. */
++ @161 /* All right. If we continue adventuring, you'll be right by my side. */ + b5.1a
++ @162 /* I cannot promise anything, Branwen. But I'll think about it. */ + b5.1b
++ @163 /* Actually, I'd like to retire from adventuring, at least for a while. */ + b5.1c
++ @164 /* I might want to spend some time with my lover instead. */ + b5.1c
END

IF ~~ b5.1a
SAY @165 /* Yess! By Tempus' mighty underpants, yes! */
IF ~~ + b5.3
END

IF ~~ b5.1b
SAY @166 /* Thank you. Tis all I ask. */
IF ~~ + b5.3
END

IF ~~ b5.1c
SAY @167 /* I understand. Well, if some of our old friends would still want to travel, I'd join them gladly. And you'll be awaited eagerly. */
IF ~~ + b5.3
END

IF ~~ b5.2
SAY @168 /* 'Tis the best thing that could ever happen to me. Meeting you, adventuring with you. Do you think I'd ever want to leave your side? */
++ @169 /* Neither I would want to leave yours. */ + b5.2a
++ @170 /* What about settling down or having children? */ + b5.2b
++ @171 /* People change, and so do their feelings. */ + b5.2c
END

IF ~~ b5.2a
SAY @172 /* We're a right pair of doves, aren't we? Only very well armed. */
IF ~~ + b5.3
END

IF ~~ b5.2b
SAY @173 /* Maybe, if you wish. I'm not sure about letting kids follow us on adventures when they’re too young, but I do not doubt goblins and orcs will flee from their cribs in terror. */
IF ~~ + b5.3
END

IF ~~ b5.2c
SAY @174 /* Not mine. Never mine. */
IF ~~ + b5.3
END

IF ~~ b5.3
SAY @175 /* We're going to be happy. Whether on our own or with a war party, miles apart or drinking together, we are going to have long, happy, amazing lives. Promise me we will, <CHARNAME>. Promise me. */
++ @176 /* I promise, Branwen. */ + b5.5
++ @177 /* I don't need to promise. It's obvious. */ + b5.4
++ @178 /* Who knows? But I'd like our lives to turn out like that. */ + b5.5
++ @179 /* We'll see. */ + b5.5
END

IF ~~ b5.4
SAY @180 /* Isn't it just? But our lives have been amazing all the same. Even with all the darkness. */ 
IF ~~ + b5.5
END

IF ~~ b5.5
SAY @181 /* The final battle for your heritage draws near. You probably need to think, to prepare, so I won't be disrupting your thoughts. */
= @182 /* Just know that you may turn to me each time you need me. */
IF ~~ DO ~IncrementGlobal("O#BranTalkToB","GLOBAL",1)~ EXIT // last talk, so no need for a timer
END

// ToB, Saradush, at waking up - Branwen's romanced lovetalk(all romances have them)

IF ~Global("O#BranSaradush","GLOBAL",1)~ b6
SAY @183 /* 'Tis late, but I'm lying awake nevertheless. Saradush... they're all dead, aren't they? */
++ @184 /* Aye. */ + b6.2
++ @185 /* So many dead... I can't sleep, either. */ + b6.2
++ @186 /* This is war. People die, and sometimes entire cities are sacked. */ + b6.1
++ @187 /* I don't want to think about it. Let's rest some more. */ + b6.0
END

IF ~~ b6.0
SAY @188 /* Sleep well, my love. */
IF ~~ DO ~SetGlobal("O#BranSaradush","GLOBAL",2) RestParty()~ EXIT
END

IF ~~ b6.1
SAY @189 /* Aye, 'tis expected in war. But was it war? Slaughter, more like. */
IF ~~ + b6.2
END

IF ~~ b6.2
SAY @190 /* I wish to turn back time and warn these people. Take them to that pocket plane of yours, one by one, or smuggle them beyond the city walls. */
= @191 /* Or destroy Yaga-Shura's army and let the lone giant have at the walls. Invulnerable or no, he'd be buried under a pile of stinking rubble soon enough. */
= @192 /* 'Tis impossible, I know. I'm only dreaming. But to know that all those people I talked and laughted with, or bought bread from... are dead... */
= @193 /* No, I should not keep you up. Rest, <CHARNAME>. You need it. */
++ @194 /* Thank you, Branwen. Good night. */ + b6.0
++ @195 /* I am willing to listen, if you want to talk. */ + b6.3
END

IF ~~ b6.3
SAY @196 /* Talking to you is oft a pleasure, true... but not tonight. These people are dead; can words bring them back? No. */
= @197 /* But I am shamefully, unduly relieved that you are alive and unharmed. I was worried that crone lied to us, and that Yaga-Shura would be as strong as ever. By Tempus, I was so happy when I learnt I was wrong! */
= @198 /* Listen to me. A warrior I might be, but I worry like any woman. And you... almost a god, but you bleed like any man. Who are we, <CHARNAME>? */
++ @199 /* Lovers. Sleep, Branwen. There's a long day tomorrow. */ + b6.0
++ @200 /* Just <CHARNAME> and Branwen. */ + b6.4
++ @201 /* A future god and his loyal priestess. */ + b6.4
++ @202 /* I don't know. */ + b6.5
END

IF ~~ b6.4
SAY @203 /* Are we? */
IF ~~ + b6.5
END

IF ~~ b6.5
SAY @204 /* But 'tis past time we both were asleep. I'll pray for people of Saradush next morn, when tears fall less freely. */
= @205 /* Do you wish to sleep some more? Or is it time to awaken already? */
++ @206 /* Let's sleep some more. */ + b6.0
++ @207 /* No, it is time to go. */ + b6.6
END

IF ~~ b6.6
SAY @208 /* As you wish, then. */
IF ~~ DO ~SetGlobal("O#BranSaradush","GLOBAL",2)~ EXIT
END

// ToB challenge 3: innocence.

IF ~Global("O#BranChallenge3","GLOBAL",1)~ b7
SAY @209 /* Solar continues to put you through the grind, doesn't she? Do you wish to talk of your last challenge? */
++ @210 /* I was offered my doubt and innocence back. To return to my own personal past. */ + b7.1
++ @211 /* It was about returning to my roots, losing my memories and experience and becoming as I once was, before I met you. */ + b7.1
++ @212 /* No, it's fine. */ + b7.0
END

IF ~~ b7.0
SAY @213 /* As you say. */
IF ~~ DO ~SetGlobal("O#BranChallenge3","GLOBAL",2)~ EXIT 
END

IF ~~ b7.1
SAY @214 /* You were offered death, weren't you? Erasing your memory... it's like dying, no? The person you are is gone, replaced by the person you used to be. */
= @215 /* I am glad you refused. Truly, I am rather fond of the person you are. */
++ @216 /* Me, too, however strange it sounds. */ + b7.2
++ @217 /* Well, I wasn't actually given a chance to agree. The spirit expected me to refuse. */ + b7.2
++ @218 /* The funniest thing happened at the end, when the spirit turned into a Slayer. Looks like there's no doubt or innocence for me anymore. */ + b7.2
END

IF ~~ b7.2
SAY @219 /* There's no way back, right? Only forward. Maybe that's what the spirit of the challenge tried to show you. */
= @220 /* I follow Tempus and his tenets, but the world of the spiritual is far away from me. I've always hated its riddles. All I know is my hammer and my friends, and that never failed me. */
= @221 /* I wish you could ask Solar, but she only answers what she wants, doesn't she? I vote we give her an ice bath, the way Rashemi barbarians greet the newcomers to their lodge. I bet she'll like it. */
++ @222 /* Good idea. You hold her legs, I'll grab her wings. */ + b7.3
++ @223 /* Another challenge like that, and I just might. */ + b7.3
++ @224 /* Let's not anger the Solar. Remember, she can always send us back... oh, wait. */ + b7.3
END

IF ~~ b7.3
SAY @225 /* (Branwen snickers.) */
= @226 /* 'Tis never boring with you, <CHARNAME>. I love you for that. */
IF ~~ DO ~SetGlobal("O#BranChallenge3","GLOBAL",2)~ EXIT 
END

// ToB, the last night, lovetalk only. Triggers at rest when the last of the Five(BALTH) is dead.

IF ~Global("O#BranLastNight","GLOBAL",1)~ b8
SAY @227 /* Hey. Sit with me for a short while? */
++ @228 /* Sure. */ + b8.1
++ @229 /* Branwen, I'm sleepy. */ + b8.1
++ @230 /* Maybe another time. */ + b8.1
END

IF ~~ b8.0
SAY @231 /* Of course, my love. Sleep well. */
IF ~~ DO ~SetGlobal("O#BranLastNight","GLOBAL",2) RestParty()~ EXIT
END

IF ~~ b8.1
SAY @232 /* 'Tis the last time we sit like this near the fire. Tomorrow you may be far away on Mount Celestia... or in the Abyss, for all I know. */
= @233 /* Stay with me tonight. Let's make it a night to remember. */
++ @234 /* Of course. But I am not going anywhere. */ + b8.2
++ @235 /* I'm all for it. */ + b8.2
++ @236 /* If you really want this... */ + b8.2
++ @237 /* No, I'd really like to sleep. */ + b8.0
END

IF ~~ b8.2
SAY @238 /* I don't know what will happen when that Solar appears before us for the final time. I don't know if Melissan is going to try and become a god or not. It doesn't matter tonight. */
= @239 /* There's only a man and a woman. You and me. Our past, our future, our present. */
= @240 /* Don't mind the shadows. Just love me like you always do. */
++ @241 /* I will... */ + b8.3
++ @242 /* Come to me... */ + b8.3
++ @243 /* No, I changed my mind. Not tonight. */ + b8.0
END

IF ~~ b8.3
SAY @244 /* I am yours... */
IF ~~ DO ~SetGlobal("O#BranLastNight","GLOBAL",2) RestParty()~ EXIT
END

// ToB, final challenge, killing the Ravager, romance only

IF ~Global("O#BranChallenge5","GLOBAL",1)~ b9
SAY @245 /* (Branwen kisses you hotly without warning.) */
= @246 /* Whatever happens... whatever comes... I will always love you. */
= @247 /* 'Tis not a goodbye, my love. Just a reminder. */
IF ~~ DO ~SetGlobal("O#BranChallenge5","GLOBAL",2)~ EXIT
END

// Branwen-initiated flirts

// Flirts for Branwen, O#BranRomanceActive=2

IF ~Global("O#BranFlirtToB","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ flirt3
SAY @248 /* (Branwen smiles at you warmly.) */
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
SAY @249 /* Come morning, you are going to be exhausted. */
= @250 /* In a very pleasant way. */
IF ~~ EXIT
END

IF ~~ f2
SAY @251 /* I enjoy the meals we have together. By Tempus, I might yet become a good cook! */
= @252 /* Ha! Kidding. */
IF ~~ EXIT
END

IF ~~ f3
SAY @253 /* (Branwen caresses your shoulders thoughtfully.) I love doing that. If only you were naked... */
IF ~~ EXIT
END

IF ~~ f4
SAY @254 /* I love imagining our future travels. Nights under the starry sky... with you... */
= @255 /* Ahem. I'd better turn my thoughts to the road ahead. */
IF ~~ EXIT
END

IF ~~ f5
SAY @256 /* (Branwen gives you a quick kiss and smiles.) */
IF ~~ EXIT
END

IF ~~ f6
SAY @257 /* By Tempus, I never imagined... I simply never imagined. */
= @258 /* (Her eyes shine at you.) */
IF ~~ EXIT
END

IF ~~ f7
SAY @259 /* (Branwen extends her arm, and you walk hand in hand for a while.) */
IF ~~ EXIT
END

IF ~~ f8
SAY @260 /* Hey, you. How about another kiss while we're out of enemies to kill? */
= @261 /* Ah, there's another one. Rats! */
IF ~~ EXIT
END

IF ~~ f9
SAY @262 /* (She kisses you fully, slowly, thoroughly.) */
IF ~~ EXIT
END

IF ~~ f10
SAY @263 /* (Branwen is singing. Very quietly, almost shyly, but you finally recognize the words.) */
= @264 /* (She is singing your name.) */
IF ~~ EXIT
END

IF ~~ f11
SAY @265 /* I would enjoy a breakfast to bed, I think. Some eggs, bread and honey, and a huge cup of milk. Some bacon, too. */
= @266 /* And a very generous helping of you. */
IF ~~ EXIT
END

IF ~~ f12
SAY @267 /* When we kill the Five, I'm going to go through the loot again. By Tempus, our gear should be perfect! */
= @268 /* Because we are perfect. And tonight we will fit... perfectly. */
IF ~~ EXIT
END

IF ~~ f13
SAY @269 /* I would love to show you the Seawolf one day. Our isles are oft unwelcome in bitter weather, but when the sun comes out, everything shines. */
IF ~~ EXIT
END

IF ~~ f14
SAY @270 /* The end will come soon now, won't it? */
= @271 /* (Branwen bites her lip.) Oh, never mind. We'll come through, I know. */
IF ~~ EXIT
END

IF ~~ f15
SAY @272 /* I love you. Every day. */
IF ~~ EXIT
END

// Player-initiated dialogue, ToB. Again, in the bottom of the file, and, again, no flirting for the final battle, AR6200.

IF ~IsGabber(Player1) AreaCheck("AR6200")~ PPID0
SAY @273 /* <CHARNAME>, there's no time for this! We need to get Melissan! */
IF ~~ EXIT
END

IF ~IsGabber(Player1)~ PPID
SAY @274 /* What is your command? */
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @275 /* (Kiss Branwen) */ + p7.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @275 /* (Kiss Branwen) */ + p7.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @275 /* (Kiss Branwen) */ + p7.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @276 /* (Hold Branwen) */ + p8.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @276 /* (Hold Branwen) */ + p8.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @276 /* (Hold Branwen) */ + p8.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @277 /* (Smile at Branwen) */ + p9.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @277 /* (Smile at Branwen) */ + p9.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @277 /* (Smile at Branwen) */ + p9.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @278 /* I love you, Branwen. */ + p10.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @278 /* I love you, Branwen. */ + p10.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @278 /* I love you, Branwen. */ + p10.3
+ ~RandomNum(3,1) Global("O#BranRomanceActive","GLOBAL",2)~ + @279 /* Whatever shall we do tonight? */ + p11.1
+ ~RandomNum(3,2) Global("O#BranRomanceActive","GLOBAL",2)~ + @279 /* Whatever shall we do tonight? */ + p11.2
+ ~RandomNum(3,3) Global("O#BranRomanceActive","GLOBAL",2)~ + @279 /* Whatever shall we do tonight? */ + p11.3
+ ~RandomNum(3,1)~ + @280 /* Things are looking up! */ + p0.1
+ ~RandomNum(3,2)~ + @280 /* Things are looking up! */ + p0.2
+ ~RandomNum(3,3)~ + @280 /* Things are looking up! */ + p0.3
+ ~RandomNum(3,1)~ + @281 /* Are you all right? */ + p1.1
+ ~RandomNum(3,2)~ + @281 /* Are you all right? */ + p1.2
+ ~RandomNum(3,3)~ + @281 /* Are you all right? */ + p1.3
+ ~RandomNum(3,1)~ + @282 /* Do you miss Baldur's Gate and Athkatla? */ + p2.1
+ ~RandomNum(3,2)~ + @282 /* Do you miss Baldur's Gate and Athkatla? */ + p2.2
+ ~RandomNum(3,3)~ + @282 /* Do you miss Baldur's Gate and Athkatla? */ + p2.3
+ ~RandomNum(3,1)~ + @283 /* This journey will be over soon. */ + p3.1
+ ~RandomNum(3,2)~ + @283 /* This journey will be over soon. */ + p3.2
+ ~RandomNum(3,3)~ + @283 /* This journey will be over soon. */ + p3.3
+ ~RandomNum(3,1)~ + @284 /* Does Tempus approve of your role in this? */ + p4.1
+ ~RandomNum(3,2)~ + @284 /* Does Tempus approve of your role in this? */ + p4.2
+ ~RandomNum(3,3)~ + @284 /* Does Tempus approve of your role in this? */ + p4.3
+ ~RandomNum(3,1)~ + @285 /* Thank you for remaining at my side. */ + p5.1
+ ~RandomNum(3,2)~ + @285 /* Thank you for remaining at my side. */ + p5.2
+ ~RandomNum(3,3)~ + @285 /* Thank you for remaining at my side. */ + p5.3
+ ~RandomNum(3,1)~ + @286 /* Let's kick someone's ass right and proper! */ + p6.1
+ ~RandomNum(3,2)~ + @286 /* Let's kick someone's ass right and proper! */ + p6.2
+ ~RandomNum(3,3)~ + @286 /* Let's kick someone's ass right and proper! */ + p6.3
+ ~Global("O#BranShutUp","GLOBAL",0)~ + @287 /* I like our talks, but I would like some peace and quiet. */ DO ~SetGlobal("O#BranShutUp","GLOBAL",1)~ + again
+ ~Global("O#BranShutUp","GLOBAL",1)~ + @288 /* I miss our talks. Can we chat again? */ DO ~SetGlobal("O#BranShutUp","GLOBAL",0)~ + again
+ ~Global("O#BranRomanceActive","GLOBAL",2)~ + @289 /* I want us to just be friends. */ + breakup
++ @290 /* No, there's nothing. */ EXIT
END

IF ~~ again
SAY @291 /* Of course, if you wish. */
IF ~~ EXIT
END

IF ~~ breakup
SAY @292 /* Oh. I... I see. Are you sure? */
++ @293 /* I am. */ + breakup2
++ @294 /* No, forget it. */ + again
END

IF ~~ breakup2
SAY @295 /* <CHARNAME>, I... */
= @296 /* No, never mind. It's over. */
IF ~~ DO ~SetGlobal("O#BranRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ p0.1
SAY @297 /* They are indeed! */
IF ~~ EXIT
END

IF ~~ p0.2
SAY @298 /* We are going to win. There is no doubt. */
IF ~~ EXIT
END

IF ~~ p0.3
SAY @299 /* These Five? They've already lost. */
IF ~~ EXIT
END

IF ~~ p1.1
SAY @300 /* Oh, fine! Thanks for asking. */
IF ~~ EXIT
END

IF ~~ p1.2
SAY @301 /* More or less. I don't think we're putting all these healing potions to good use. */
IF ~~ EXIT
END

IF ~~ p1.3
SAY @302 /* (yawn) A little tired. */
IF ~~ EXIT
END

IF ~~ p2.1
SAY @303 /* A little. Well, a lot. */
IF ~~ EXIT
END

IF ~~ p2.2
SAY @304 /* Those were the times, weren't they? But these are the times, too. */
IF ~~ EXIT
END

IF ~~ p2.3
SAY @305 /* Baldur's Gate, mostly. And Beregost. */
IF ~~ EXIT
END

IF ~~ p3.1
SAY @306 /* But the road is never over. */
IF ~~ EXIT
END

IF ~~ p3.2
SAY @307 /* Not for us. Our journeys are just beginning. */
IF ~~ EXIT
END

IF ~~ p3.3
SAY @308 /* I just hope it won't end abruptly, as Xan would say. */
IF ~~ EXIT
END

IF ~~ p4.1
SAY @309 /* You are important to me. He knows. */
IF ~~ EXIT
END

IF ~~ p4.2
SAY @310 /* I doubt that Tempus can interfere. But I know, he understands. */
IF ~~ EXIT
END

IF ~~ p4.3
SAY @311 /* As long as we conduct ourselves with honor. */
IF ~~ EXIT
END

IF ~~ p5.1
SAY @312 /* 'Tis my pleasure. */
IF ~~ EXIT
END

IF ~~ p5.2
SAY @313 /* I am happy to. */
IF ~~ EXIT
END

IF ~~ p5.3
SAY @314 /* Thank you for letting me stay. */
IF ~~ EXIT
END

IF ~~ p6.1
SAY @315 /* Let's! */
IF ~~ EXIT
END

IF ~~ p6.2
SAY @316 /* Finally! We're marching out immediately! */
IF ~~ EXIT
END

IF ~~ p6.3
SAY @317 /* At once! */
IF ~~ EXIT
END

IF ~~ p7.1
SAY @318 /* Mmmm! More! */
IF ~~ EXIT
END

IF ~~ p7.2
SAY @319 /* (Branwen eagerly kisses you in return.) */
IF ~~ EXIT
END

IF ~~ p7.3
SAY @320 /* Mmm... you're so tasty! */
IF ~~ EXIT
END

IF ~~ p8.1
SAY @321 /* (Branwen cuddles in your arms and sighs.) */
IF ~~ EXIT
END

IF ~~ p8.2
SAY @322 /* (Branwen smiles, looking up from your shoulder.) */
IF ~~ EXIT
END

IF ~~ p8.3
SAY @323 /* (She's warm and pliant in your arms, but you feel unyielding hardness underneath.) */
IF ~~ EXIT
END

IF ~~ p9.1
SAY @324 /* (Branwen smiles back at you with her eyes.) */
IF ~~ EXIT
END

IF ~~ p9.2
SAY @325 /* (Branwen winks back.) */
IF ~~ EXIT
END

IF ~~ p9.3
SAY @326 /* (Branwen laughs.) */
IF ~~ EXIT
END

IF ~~ p10.1
SAY @327 /* And I love you, <CHARNAME>. */
IF ~~ EXIT
END

IF ~~ p10.2
SAY @328 /* Really? But I love you, too. */
IF ~~ EXIT
END

IF ~~ p10.3
SAY @329 /* I love you. */
IF ~~ EXIT
END

IF ~~ p11.1
SAY @330 /* I suggest knitting. It calms the nerves, you see. */
IF ~~ EXIT
END

IF ~~ p11.2
SAY @331 /* Why don't you show me? */
IF ~~ EXIT
END

IF ~~ p11.3
SAY @332 /* I think I know the answer. I'll whisper it to you while you undress. */
IF ~~ EXIT
END

END // End to APPEND