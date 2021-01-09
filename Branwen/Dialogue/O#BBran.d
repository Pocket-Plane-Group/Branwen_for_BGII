// Read this dialogue file third, after O#Bran.d and O#BranP.d.

BEGIN O#BBRAN 

// This is Branwen's banter file. Remember how companions talk to each other? To do it, you need to write CHAINS like the ones below.
// Note that each of these chains has a condition like O#BranAerie1=0. It's technically always true, but on practice all banters in B file(O#BBran.d) trigger ONLY when the banter engine(or jcompton's banter script) tells them to.

// Sometimes modders uses game conventions and use BO#BRAN instead of O#BBRAN. I used this myself in Xan, Tiax and Coran. However, to avoid ALL possible collisions, it's best to use your prefix like we do here: O#BBRAN or even O#BRANB.
// Remember to register your own prefix, though, or there WILL be collisions. If this topic http://forums.blackwyrmlair.net/index.php?showtopic=113 is not available, just ask at forums.pocketplane.net or forums.gibberlings3.net.

// Conditions: InParty(otherNPC) which means they're in party and not dead, See(other NPC), and CamDawg's !StateCheck("Name",CD_STATE_NOTVALID). NPCs can't talk if they're silenced or confused.
// Again, and I can't stress that enough, you have to set your variable to 1 in the banter, or it will trigger again.
CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranAerie1","GLOBAL",0)~ THEN O#BBRAN O#BranAerie1
@0 /* Speak up, girl! Why are you always mumbling and stuttering? */
DO ~SetGlobal("O#BranAerie1","GLOBAL",1)~
== BAERIE @1 /* I'm not! */
== O#BBRAN @2 /* Are too! */
== BAERIE @3 /* Not! */
== O#BBRAN @4 /* Are! */
== BAERIE @5 /* Not, not, not! And you're too big and too loud and your feet are smelly when you take your huge boots off! So there! */
== O#BBRAN @6 /* Ha! When you want to, you're a regular little lioness, girl. */
EXIT

// Sometimes you need aditional conditions, like "Anomen shouldn't be romancing CHARNAME for this banter to trigger". Just place them after InParty(), to be safe.

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!Global("AnomenRomanceActive","GLOBAL",1)
!Global("AnomenRomanceActive","GLOBAL",2)
!Global("O#BranRomanceActive","GLOBAL",1)
!Global("O#BranRomanceActive","GLOBAL",2)
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranAnomen1","GLOBAL",0)~ THEN O#BBRAN O#BranAnomen1
@7 /* You are a strong warrior. I respect that. */
DO ~SetGlobal("O#BranAnomen1","GLOBAL",1)~
== BANOMEN @8 /* Thank you for your kind words. */
== O#BBRAN @9 /* May I hold your hammer sometime? */
== BANOMEN @10 /* You certainly may. */
== O#BBRAN @11 /* I'll take you up on this offer some day. */
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranCernd1","GLOBAL",0)~ THEN BCERND O#BranCernd1
@12 /* Branwen, you are well-versed in medicine. Why don't you become a healer, not a warrior? */
DO ~SetGlobal("O#BranCernd1","GLOBAL",1)~
== O#BBRAN @13 /* 'Twould be a huge insult to my honor! Me, sitting at home like a blind fishwife? Not for the whole world! */
== BCERND @14 /* What of your children? Will they grow unattended like weeds, only seeing their mother between some crusade or another? */
== O#BBRAN @15 /* If I have any, they will be strong warriors like their father, honorable and courageous. No one but Tempus himself will make my sons and daughters stay at home. */
== BCERND @16 /* Perhaps there is some truth to what you say. */
== O#BBRAN @17 /* Nay, you speak truly, druid. Some maiden will be happier for hearing your words. Not me, though. And not yourself. */
== BCERND @18 /* True enough. */
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranEdwin1","GLOBAL",0)~ THEN O#BBRAN O#BranEdwin1
@19 /* Wizard! Stop stealing my herbs! */
DO ~SetGlobal("O#BranEdwin1","GLOBAL",1)~
== BEDWIN @20 /* Who, me? You must be mistaken, erm, good woman. (She's blind as a monkey! Can't believe she noticed anything?) */
== O#BBRAN @21 /* You are using my herbs for your spell components, aren't you? Good for you, too, but you owe me for purchasing these. */
== O#BBRAN @22 /* Although mayhap I'll take a different payment this time... */
== BEDWIN @23 /* W-WHAT? (She can't mean it. She can't mean THAT. She can't.) */
== O#BBRAN @24 /* 'Twas a harmless joke, you ninny! By Tempus, you're red as your robes! */
== BEDWIN @25 /* Grrrrr...(Fireball. Fireball. Fireball!) */
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranHaerDalis1","GLOBAL",0)~ THEN BHAERDA O#BranHaerDalis1
@26 /* Tell me, lovely magpie, why do you love gold thread so? */
DO ~SetGlobal("O#BranHaerDalis1","GLOBAL",1)~
== O#BBRAN @27 /* Why? 'Tis unbecoming, you wish to say? */
== BHAERDA @28 /* Not for this bard, no. But yon garb can't withstand harsh weather and danger, surely? */
== O#BBRAN @29 /* I can always buy another tunic. But 'tis so much pleasure to shine, to let it caress my skin, to smile and be noticed. 'Tis not so for you? */
== BHAERDA @30 /* Perchance you're wiser than you appear. */
== O#BBRAN @31 /* On that, bard, you're happily mistaken. */
EXIT

// Imoen does not have a banter file, so we have to use IMOEN2J, instead. This is fine, as long as OUR NPC INITIATES TALK. (We can also steal someone's code and add a banter file to Imoen, but... nah).

CHAIN
IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranImoen1","GLOBAL",0)~ THEN O#BBRAN O#BranImoen1
@32 /* Imoen, what are you... wait, are you wearing my lipstick? And my gloss? And my... undertunic? */
DO ~SetGlobal("O#BranImoen1","GLOBAL",1)~
== IMOEN2J @33 /* Well, Irenicus didn't exactly provide me with spare things... */
== O#BBRAN @34 /* You poor thing! Here, I have some new underclothes for you, too... */
== IMOEN2J @35 /* Aw, Branwen, I was just teasing. <CHARNAME> bought me all I needed. I just... liked your lipstick. */
== O#BBRAN @36 /* By Tempus! Oh, just keep it, girl. My lips are prettier than yours, anyhow. */
== IMOEN2J @37 /* Now wait just a minute! */
EXIT

// That's how you set a condition inside one of the CHAIN's lines. Middle three lines will only trigger if Branwen's romance is active.
// Also, note that OR(2) A() B() means A() or B(). If you want A() or B() or C(), you'll have to use OR(3) A() B() C().

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranJaheira1","GLOBAL",0)~ THEN BJAHEIR O#BranJaheira1
@38 /* Are you well, Branwen? You seem to be distracted often lately. */
DO ~SetGlobal("O#BranJaheira1","GLOBAL",1)~
== O#BBRAN @39 /* 'Tis <CHARNAME>'s trials. Torture, and cages, and grim sights... <PRO_HESHE> is a grown <PRO_MANWOMAN> now. */
== BJAHEIR @40 /* That <PRO_HESHE> is. */
== O#BBRAN IF ~OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ THEN @41 /* And he needs a strong woman besides him, don't you think? */
== BJAHEIR IF ~OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ THEN @42 /* As long as she keeps him away from the darkness. */
== O#BBRAN IF ~OR(2) Global("O#BranRomanceActive","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ THEN @43 /* She will. */
== O#BBRAN @44 /* 'Tis strange how little time has passed. Only a year. And now my old captor, Tranzig, lies dead, Khalid has fallen, and <CHARNAME> is a Bhaalspawn. So many losses... */
== BJAHEIR @45 /* And regrets. */
== O#BBRAN @46 /* We'll get through. By Tempus' shield! */
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranJan1","GLOBAL",0)~ THEN BJAN O#BranJan1
@47 /* Branwen! Do you have a big family? */
DO ~SetGlobal("O#BranJan1","GLOBAL",1)~
== O#BBRAN @48 /* Some. Two of my brothers are soldiers. Another is a fisherman. They don't talk to me, though. Not since... */
== BJAN @49 /* Aye, the centuries-old disagreement of picking a profession! Uncle Scratchy once got burned, too. His betrothed, Leticia, decided to become a sales manager in a drow city. Surprisingly, her turnip sales were through the roof, but not for long. */
== O#BBRAN @50 /* Why is that? */
== BJAN @51 /* Never trust an illithid. The tentacled devils ate the whole bunch. */
== O#BBRAN @52 /* Jan, that's horrible! */
== BJAN @53 /* Told you. Career advice is the key. */
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranKeldorn1","GLOBAL",0)~ THEN BKELDOR O#BranKeldorn1
@54 /* You seem a reasonable and an honorable young lady, Branwen. */
DO ~SetGlobal("O#BranKeldorn1","GLOBAL",1)~
== O#BBRAN @55 /* Why, thank you, good sir! 'Tis a great honor to be complimented by one such as you. */
== BKELDOR @56 /* Yet your behavior toward young men is sometimes... unseemly. Have you noticed how free you can become with your affections? */
== O#BBRAN @57 /* Sir Keldorn! You're a married man who fathered two strong daughters! How can you say such things to an innocent young woman like myself? */
== BKELDOR @58 /* My apologies, Branwen, but sometimes truth must be heard. */
== O#BBRAN @59 /* No. No, it mustn't! I'll just go and cry myself to sleep... curl in some dark corner... */
== BKELDOR @60 /* Please, Branwen, you mustn't take it so seriously. A small adjustment in your temper... */
== O#BBRAN @61 /* Haha! Got you, old man! */
== BKELDOR @62 /* (sigh) Torm help me. */
EXIT

CHAIN
IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranKorgan1","GLOBAL",0)~ THEN O#BBRAN O#BranKorgan1
@63 /* I loved the way you chopped his head off in the last battle! */
DO ~SetGlobal("O#BranKorgan1","GLOBAL",1)~
== BKORGAN @64 /* Har! */
== O#BBRAN @65 /* His innards were flying around like sausages! I confess, I grew hungry a little. */
== BKORGAN @66 /* Meself, too. */
== O#BBRAN @67 /* Really? How about we grab a beer and some pork? I'll see what we can do. */
== BKORGAN @68 /* (belch) Bring it on! */
EXIT

CHAIN 
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranMazzy1","GLOBAL",0)~ THEN O#BBRAN O#BranMazzy1
@69 /* Mazzy, why don't you stop staring at human men? */
DO ~SetGlobal("O#BranMazzy1","GLOBAL",1)~
== BMAZZY @70 /* Excuse me? */
== O#BBRAN @71 /* They are twice as tall as you! 'Twould be like cradling a child! And what would happen to your loins, should you carry a human boy? */
== BMAZZY @72 /* Branwen, I'm not some lewd - slattern! I talk to people! */
== O#BBRAN @73 /* Hmph. That may be, but I wasn't born yesterday. I noticed that look in your eye, sister. */
== BMAZZY @74 /* Well, keep your "notices" to yourself. */
EXIT

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranMinsc1","GLOBAL",0)~ THEN O#BBRAN O#BranMinsc1
@75 /* Minsc, my good friend! We are together again! */
DO ~SetGlobal("O#BranMinsc1","GLOBAL",1)~
== BMINSC @76 /* So we are! Let's sing a song! */
== BMINSC @77 /* From beyond the wooded island
To the river wide and free,
Proudly sail the arrow-breasted
Ships of Cossack yeomanry. */
== O#BBRAN @78 /* On the first is Stenka Razin
With a princess at his side,
Drunken, holds a marriage revel
With his beautiful young bride. */
== BMINSC @79 /* But behind them rose a whisper,
"He has left his sword to woo;
One short night, and Stenka Razin
Has become a woman too!" */
== O#BBRAN @80 /* Stenka Razin hears the jeering
Of his discontented band,
And the lovely Persian princess
He has circled with his hand. */
== BMINSC @81 /* His black brows have come together
As the waves of anger rise,
And the blood comes rushing swiftly
To his piercing, jet-black eyes. */
== O#BBRAN @82 /* "I will give you all you ask for,
Life and heart, and head and hand,"
Echo rolls the pealing thunder
Of his voice across the land. */
== BMINSC @83 /* Boo says he's tired now, friend Branwen. Shall we sing the rest later? */
== O#BBRAN @84 /* Gladly! */
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranNalia1","GLOBAL",0)~ THEN BNALIA O#BranNalia1
@85 /* Branwen, what do you do to help the less fortunate? Besides slaughtering goblins, I mean. */
DO ~SetGlobal("O#BranNalia1","GLOBAL",1)~
== O#BBRAN @86 /* These goblins make out with harvest and sometimes even innocent children, foolish girl! Without adventurers and militia, entire villages would be dead! */
== BNALIA @87 /* Yes, but that's my point, isn't it? If these people had enough money to station guards, their children and crops needn't suffer! */
== O#BBRAN @88 /* No one can be safe day and night. Even the king can be murdered in his chambers. */
== BNALIA @89 /* Unless someone slaughters his guards and his battle mages, he is safe. Unlike the less fortunate I'm protecting! */
== O#BBRAN @90 /* How many less fortunate are there, girl? I say if they come together, no guards can save that king. */
EXIT 

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranValygar1","GLOBAL",0)~ THEN BVALYGA O#BranValygar1
@91 /* Your hair looks lovely in this light, Branwen. */
DO ~SetGlobal("O#BranValygar1","GLOBAL",1)~
== O#BBRAN @92 /* Thank you. 'Tis a rare compliment from you, my friend. */
== BVALYGA @93 /* I rarely make small talk anymore. */
== O#BBRAN @94 /* I understand. I miss my parents, too, very much. */
== BVALYGA @95 /* Are they dead? */
== O#BBRAN @96 /* They are. Shall I tell you more about them? */
== BVALYGA @97 /* I... yes. Please do. */
== O#BBRAN @98 /* My mother was born in high summer, and it was said that the sun never left her hair. My father was a woodsman, a ranger not unlike yourself. A good man. When I was born, he held me and cried... */
EXIT

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranViconia1","GLOBAL",0)~ THEN O#BBRAN O#BranViconia1
@99 /* Viconia, I respect you. */
DO ~SetGlobal("O#BranViconia1","GLOBAL",1)~
== BVICONI @100 /* Truly? Why is that? */
== O#BBRAN @101 /* You were nearly burnt, very probably raped, and very nearly killed. You must be hurting inside, but you persevered and became stronger. */
== BVICONI @102 /* Shar guides my hand. */
== O#BBRAN @103 /* And Tempus guides mine. I hope we'll never become enemies. */
== BVICONI @104 /* Perhaps one day, elg'caress. But not today. */
EXIT

CHAIN
IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("O#BranYoshimo1","GLOBAL",0)~ THEN O#BBRAN O#BranYoshimo1
@105 /* Do you miss home, Yoshimo? */
DO ~SetGlobal("O#BranYoshimo1","GLOBAL",1)~
== BYOSHIM @106 /* Of course I do! Every ronin and samurai does. Especially in spring, with every cherry tree in bloom. */
== O#BBRAN @107 /* I'd like to visit Kara-Tur one day. */
== BYOSHIM @108 /* Then you will! A fierce maiden like yourself will not let a little bit of distance stop her. Just be careful on the way: these roads are crawling with bandits. */
== O#BBRAN @109 /* And other filth. But I have Tempus' favor, truth and honor. I will see Kara-Tur, Yoshimo. */
== BYOSHIM @110 /* Perhaps one day we shall see it together? */
== O#BBRAN @111 /* Ha, you're a right cad, Yoshimo! I confess, I didn't see it coming. */
== BYOSHIM @112 /* I try my best. */
EXIT

/* After one banter for each NPC has been written, you can write the second, third and so on set of banters. 
I recommend NOT to place all Aerie banters together first(then all Anomen banters, all Cernd banters and so on), because then the engine will trigger four Aerie banters first and no Keldorn ones. 
So, write the first set first and then the second one, one set of banters after another. Randomize their order - that's even better. */

// When two banters are linked, and you want one to happen only after another, take the variable from the previous banter. It should be at 1 at the start of the next banter, and then we set it to 2.

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranEdwin2","GLOBAL",0)~ THEN O#BBRAN O#BranEdwin2
@113 /* Edwin, has anyone told you that you have a very nice voice? */
DO ~SetGlobal("O#BranEdwin2","GLOBAL",1)~
== BEDWIN @114 /* Ahem. Do I? (She has noticed at last!) */
== O#BBRAN @115 /* Indeed. And these soft, soft hands... */
== BEDWIN @116 /* Yes? */
== O#BBRAN @117 /* My heart is beating faster when I think about ALL the wonderful things these deft fingers can do... */
== BEDWIN @118 /* Yeees? */
== O#BBRAN @119 /* Will you peel the potatoes for the stew? */
== BEDWIN @120 /* Rats. */
EXIT

CHAIN
IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranImoen2","GLOBAL",0)~ THEN O#BBRAN O#BranImoen2
@121 /* Imoen! You've taken my towel again! And you haven't even folded it properly! It's lying in a heap, still wet! */
DO ~SetGlobal("O#BranImoen2","GLOBAL",1)~
== IMOEN2J @122 /* Aww, stop shouting. Screaming won't make it dry, you know. */
== O#BBRAN @123 /* By Tempus's hairy ass, what will, then? */
== IMOEN2J @124 /* Here, let me... Oooougeli bugeli! */
== IMOEN2J @125 /* See? Just a small spell, and it's fresh and dry, good as new. */
== O#BBRAN @126 /* Hmph. Thank you, Imoen but what exactly prevented you from doing it right after you first used it? */
== IMOEN2J @127 /* Ah... uh... I forgot? */
== O#BBRAN @128 /* And you think these pretty dimples will help you, will they? Arrgh! Next time, I'll tell <CHARNAME>. I've no doubt <PRO_HISHER> towels suffered from your attacks, too. We'll plan revenge together. */
== IMOEN2J @129 /* But that's way too cruel! I'm being unfairly slandered here! <CHARNAME>, help! */
EXIT

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranJaheira2","GLOBAL",0)~ THEN O#BBRAN O#BranJaheira2
@130 /* I really don't understand, Jaheira. Why would you wear these braids? They make you look like a travelling gypsy! */
DO ~SetGlobal("O#BranJaheira2","GLOBAL",1)~
== BJAHEIR @131 /* Says a woman wearing way too much golden thread. */
== O#BBRAN @132 /* Well, I do! And it makes me prettier, would you not agree? */
== BJAHEIR @133 /* Branwen, I am used to comfort. Long hair can be used against you in battle. Hasn't anyone shown you this? */
== O#BBRAN @134 /* ... */
== O#BBRAN @135 /* I... yes. Once. I remember. It hurt. */
== O#BBRAN @136 /* Please disregard what I told you earlier. You're beautiful with the braids. */
== BJAHEIR @137 /* And you. I sometimes say things... in anger. I do not mean them. */
== O#BBRAN @138 /* Then I declare Tempus' peace! Drinks? */
== BJAHEIR @139 /* Tonight. */
EXIT

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranMinsc1","GLOBAL",1)~ THEN O#BBRAN O#BranMinsc2
@140 /* Shall we finish the song, friend Minsc? */
DO ~SetGlobal("O#BranMinsc1","GLOBAL",2)~
== BMINSC @141 /* "Volga, Volga, mother Volga,
Deep and wide beneath the sun,
You have never seen a present
From the Cossack of the Don. */
== O#BBRAN @142 /* And that peace might rule as always
All my free-born men and brave,
Volga, Volga, mother Volga,
Volga, make this girl a grave." */
== BMINSC @143 /* Minsc cannot continue! He is crying! */
== O#BBRAN @144 /* With a sudden, mighty movement,
Razin lifts the beauty high,
And he casts her where the waters
Of the Volga move and sigh. */
== BMINSC @145 /* Now a silence like the grave sinks
To all those who stand to see,
And the battle-hardened Cossacks
Sink to weep on bended knee. */
== O#BBRAN @146 /* "Dance, you fool, and men, make merry!
What has got into your eyes?
Let us thunder out a chanty
Of a place where beauty lies." */
== BMINSC @77 /* From beyond the wooded island
To the river wide and free,
Proudly sail the arrow-breasted
Ships of Cossack yeomanry. */
== BMINSC @147 /* Look what you have done! Even Boo's little whiskers are quivering! */
== O#BBRAN @148 /* Aye, well sung indeed. Shall we drown your hamster next? Ha! 'Twas a harmless joke, my friend Minsc, do not glare at me so. */
== BMINSC @149 /* Come, Boo, away from this not-so-nice lady. When she wants a hamster's company next, we'll make her beg for it. */
== O#BBRAN @150 /* Why, Minsc, you can be downright dirty sometimes. */
EXIT

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranViconia2","GLOBAL",0)~ THEN O#BBRAN O#BranViconia2
@151 /* Viconia, why don't we share a drink? */
DO ~SetGlobal("O#BranViconia2","GLOBAL",1)~
== BVICONI @152 /* You would... drink with me? */
== O#BBRAN @153 /* Aye, and gladly! The strongest brew you can find! */
== BVICONI @154 /* Let's see if you can keep up, abbil. */
== O#BBRAN @155 /* Did you just call me your friend? */
== BVICONI @156 /* No. */
== O#BBRAN @157 /* Thought so. */
EXIT

// The third set of banters for some of the NPCs(from Baldur's Gate), this time initiated by NPCs themselves, not Branwen. Except Imoen.

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranEdwin3","GLOBAL",0)~ THEN BEDWIN O#BranEdwin3
@158 /* So, priestess, do you aspire to become a Chosen of your dumb deity? (No doubt she can't set her sights any higher. These monkeys are amusing.) */
DO ~SetGlobal("O#BranEdwin3","GLOBAL",1)~
== O#BBRAN @159 /* You are a heretic fool, Edwin, to speak of the Lord of Battles so carelessly. His wrath is great, and my hammer is only inches from your finger bones... */
== BEDWIN @160 /* And my fingers are itching for a fireball! */
== O#BBRAN @161 /* Which would take you two seconds to cast. My hammer is ready now. 'Twould be a pity to bereave this party of a capable mage, but Tempus holds with no affronts to his honor, and his will be done. */
== BEDWIN @162 /* All right, all right! I... apologize. */
== O#BBRAN @163 /* Truly? */
== BEDWIN @164 /* Yes! Now shut up and keep walking! */
EXIT

CHAIN
IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranImoen3","GLOBAL",0)~ THEN O#BBRAN O#BranImoen3
@165 /* You're a sly one, aren't you? */
DO ~SetGlobal("O#BranImoen3","GLOBAL",1)~
== IMOEN2J @166 /* What do you mean, Branwen? */
== O#BBRAN @167 /* You're a proper little vixen, that's what I mean. I've noticed your appraising look when I was repacking my backpack. You may be all smiles and innocent looks, but you're an accomplished rogue, little Imoen. I was a fool to doubt that. */
== IMOEN2J @168 /* Heh. Who'd notice an old little me? But your backpack is safe, Branwen. */ 
== O#BBRAN @169 /* Because there's nothing interesting for you inside. */
== IMOEN2J @170 /* That, too. */
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranJaheira3","GLOBAL",0)~ THEN BJAHEIR O#BranJaheira3
@171 /* Branwen, what is it? You look drawn. */
DO ~SetGlobal("O#BranJaheira3","GLOBAL",1)~
== O#BBRAN @172 /* Those pines on the edge of Athkatla... 'Twas a rare sight. It reminded me of home. */
== BJAHEIR @173 /* Amn is not that far from Tethyr. I see reminders of my home every day. */
== O#BBRAN @174 /* Lucky you. */
== BJAHEIR @175 /* Do you truly think so? */
== O#BBRAN @176 /* No... 'twas spoken in haste. Forgive me, Jaheira. */
== BJAHEIR @177 /* Home is where the heart is, Branwen. May your heart find yours. */
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranMinsc3","GLOBAL",0)~ THEN BMINSC O#BranMinsc2
@178 /* Branwen! Boo asks, do you have nuts? */
DO ~SetGlobal("O#BranMinsc3","GLOBAL",1)~
== O#BBRAN @179 /* Hmm. I confess, I do. Here, have some, little Boo. */
== BMINSC @180 /* Thank you! Oooh, Dynaheir used to carry nuts for us in her backpack. Just like old times, right, Boo? */
== O#BBRAN @181 /* You're welcome, Minsc and Boo. You miss Dynaheir, both of you? */
== BMINSC @182 /* We do! But she would want us to stay strong, so we are. */
== O#BBRAN @183 /* You keep it up, Minsc. You keep it up. */
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranViconia3","GLOBAL",0)~ THEN BVICONI O#BranViconia3
@184 /* So, abbil, tell me true: what kind of men attract you?  */
DO ~SetGlobal("O#BranViconia3","GLOBAL",1)~
== O#BBRAN @185 /* Tall ones. Hard ones. Strong arms and gentle hands. */
== BVICONI @186 /* Ha! What about your precious honor? */
== O#BBRAN @187 /* I confess, I wouldn't lie with a rascal willingly, but if I were truly starved and hungry for a strong man's caresses... */
== BVICONI @188 /* Ha! You'd yield shamefully, and lick his boot like a good bitch! */
== O#BBRAN @189 /* Hmph. You're a real ray of sunshine sometimes, do you know that? */
EXIT
