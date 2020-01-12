// Read this after all SoA dialogue. Start reading with O#Bran.d
// This is Branwen's banter file for ToB - one conversation with each Bioware NPC(two for Imoen - one if Branwen romances PC, another if she does not).

BEGIN O#BBRA25

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranAerieToB1","GLOBAL",0)~ THEN BAERIE25 O#BranAerieToB1
~You're p-pensive today, Branwen.~
DO ~SetGlobal("O#BranAerieToB1","GLOBAL",1)~
== O#BBRA25 ~Soon our journeys will be over. 'Tis hard not to think about that.~
== BAERIE25 ~B-but you'll be able to go home! And I'll see the circus again!~
== O#BBRA25 ~Aye, but will they be happy to see you? Rich, free, forever young and doubtlessly able to defend yourself, while they are but poor workers, helpless before any ruffian?~
== BAERIE25 ~I... I didn't think of that.~
== O#BBRA25 ~People envy each other, and with you, they'll have good cause, Aerie. Be careful when you return to the circus, all right?~
== BAERIE25 ~A-all right. And you, too.~
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranAnomenToB1","GLOBAL",0)~ THEN BANOME25 O#BranAnomenToB1
~Lady Branwen, why are you practicing with my shield?~
DO ~SetGlobal("O#BranAnomenToB1","GLOBAL",1)~
== O#BBRA25 ~'Tis pretty.~
== BANOME25 ~Why, you'd give no other reason? Its defense enchantments or?..~
== O#BBRA25 ~Nope. Only that 'tis pretty.~
== BANOME25 ~Well, I must ask that you leave my battle gear alone. I need to keep it ready for our enemies. And, please, stop eyeing my helmet!~
== O#BBRA25 ~Aww, but 'tis so pretty! And, by Tempus, your armor is, too!~
== BANOME25 ~My lady Branwen, please! I'll have to go naked if you don't stop lusting after my things.~
== BANOME25 ~Oh. I...~
== O#BBRA25 ~And now he's blushing. So young and handsome... 'Twill take a strong will not to steal this one with his armor, too.~
== O#BBRA25 IF ~Global("O#BranRomanceActive","GLOBAL",2)~ THEN ~Sorry, <CHARNAME>. Just thinking aloud.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranCerndToB1","GLOBAL",0)~ THEN BCERND25 O#BranCerndToB1
~Have you given any thought to my earlier offer, Branwen?~
DO ~SetGlobal("O#BranCerndToB1","GLOBAL",1)~
== O#BBRA25 ~What? Ah, the one you made me in Suldanessellar. No, Cernd. I'm afraid I'm ill suited for becoming a druid.~
== BCERND25 ~Your soul will grow tired of battles one day, Branwen. Your calling is very close to mine. Should you want to become one of us, we'll welcome you into the circle.~
== O#BBRA25 ~Cernd, I thank you, but... no. Just no.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranEdwinToB1","GLOBAL",0)~ THEN BEDWIN25 O#BranEdwinToB1
~Woman! You've eaten my share of cheese again!~
DO ~SetGlobal("O#BranEdwinToB1","GLOBAL",1)~
== O#BBRA25 ~I have not!~
== BEDWIN25 ~Have, too! And don't you try to deny it, I've seen you licking your fingers!~
== O#BBRA25 ~'Twas not only my finger I was licking...~
== BEDWIN25 ~What?~
== O#BBRA25 ~Ah, nothing, Edwin. I'm sorry, but your cheese is gone. Go on and have my cookies, if you like.~
== BEDWIN25 ~Hmm. Cookies?~
== O#BBRA25 ~There might be chocolate chips from Maztica inside.~
== BEDWIN25 ~Deal. Hand them over. And don't you try to cheat Edwin Odesseiron ever again! (I'd fireball her, but it'd melt the chocolate.)~
== O#BBRA25 ~Sure. I'll just check our stores of cheese for the morrow...~
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranHaerDalisToB1","GLOBAL",0)~ THEN BHAERD25 O#BranHaerDalis1
~'Twould seem to this bard that our journey is coming to an end.~
DO ~SetGlobal("O#BranHaerDalisToB1","GLOBAL",1)~
== O#BBRA25 ~And you're going to add that entropy has run its course and all that?~
== BHAERD25 ~Nay. I shall simply be sad, as befits a bard who is about to lose his friends and the subject of his inspiration.~
== O#BBRA25 ~Why, do you think you'll never see <CHARNAME> again?~
== BHAERD25 ~Entropy, my dear magpie. Entropy envelops and devours all.~
== O#BBRA25 ~Ah. That's more like it.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!Global("O#BranRomanceActive","GLOBAL",2)
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranImoenToB1","GLOBAL",0)~ THEN BIMOEN25 O#BranImoenToB1
~Hey, Branwen. Want some wine?~
DO ~SetGlobal("O#BranImoenToB1","GLOBAL",1)~
== O#BBRA25 ~Sure! I've borrowed a good chunk of cheese, too. So, girl talk again?~
== BIMOEN25 ~As usual. This time, let's discuss <CHARNAME>.~
== O#BBRA25 ~'Tis obvious. Everyone knows <PRO_HESHE> is in love.~
== BIMOEN25 ~Yes, but with whom?~
== O#BBRA25 ~You don't know?~
== BIMOEN25 ~Nope.~
== O#BBRA25 ~Can't even guess?~
== BIMOEN25 ~Not a thing.~
== O#BBRA25 ~(whispers a name in Imoen's ear)~
== BIMOEN25 ~Oooooh! Oh! I should have... oh, but that's just... You're sure?~
== O#BBRA25 ~Yep.~
== BIMOEN25 ~Tee-hee! <CHARNAME>! I have something to aaaaask youuuuu!~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
Global("O#BranRomanceActive","GLOBAL",2)
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranImoenToB1","GLOBAL",0)~ THEN BIMOEN25 O#BranImoenToB1
~Hey, Branwen. You and <CHARNAME>, you're all right?~
DO ~SetGlobal("O#BranImoenToB1","GLOBAL",1)~
== O#BBRA25 ~'Twould seem so. Why?~
== BIMOEN25 ~Well, it's just there're so many pretty girls around, hungry for my big brother's attention...~
== O#BBRA25 ~Ahem. You don't mean Sarevok, do you? Because he seems to have more fans.~
== BIMOEN25 ~Hey, <CHARNAME> has more fans!~
== O#BBRA25 ~Nope. Besides, <CHARNAME> is mine.~
== BIMOEN25 ~Though Sarevok is nice, too. Tall, with these dark, strong shoulders...~
== O#BBRA25 ~Imoen! He's evil! And dead! And gross!~
== BIMOEN25 ~Well, not that gross. He's only my half-brother, you know. And he's not that evil. I mean, if only he met the right girl...~
== O#BBRA25 ~Argh!!~
== BIMOEN25 ~Tee-hee! Got ya!~
EXIT


CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranJaheiraToB1","GLOBAL",0)~ THEN BJAHEI25 O#BranJaheiraToB1
~We're both stronger and older. Yet some losses persist.~
DO ~SetGlobal("O#BranJaheiraToB1","GLOBAL",1)~
== O#BBRA25 ~Aye. I've been thinking of Khalid only yesterday. He was a good man.~
== BJAHEI25 ~Yes, but I was thinking of Gorion.~
== O#BBRA25 ~<CHARNAME>'s mentor? He was your friend, I remember it now.~
== BJAHEI25 ~And a much better father than I thought he would be. <CHARNAME> is living proof to that.~
== O#BBRA25 ~Even if some of <CHARNAME>'s choices upset the balance?~
== BJAHEI25 ~We all upset the balance at some point of another. It's who we become that is important.~
== O#BBRA25 ~True. And <CHARNAME> turned out just right.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranJanToB1","GLOBAL",0)~ THEN BJAN25 O#BranJanToB1
~Branny, I sense you need a story.~
DO ~SetGlobal("O#BranJanToB1","GLOBAL",1)~
== O#BBRA25 ~Make it two. It's not about uncle Scratchy again?~
== BJAN25 ~As a matter of fact, yes, it is.~
== O#BBRA25 ~Oh, joy.~
== BJAN25 ~Once uncle Scratchy decided to build a new road straight through the Promenade. He said that only a dozen of stupid peasants ever shopped there, and the city needed new roads.~
== BJAN25 ~Naturally, he expected a cultured debate and maybe some opposition, which is why he hired six trolls for protection. Does wonders for political microclimate, you see.~
== BJAN25 ~What he didn't expect was that my old friend Trax was planning to turn the Promenade into a big shopping center, destroying the little shops and burning the circus, since it was cursed anyway. And only my uncle Scratchy and his trolls stood in his way!~
== O#BBRA25 ~What would that Trax do?~
== BJAN25 ~What wouldn't he? He bribed the trolls with a nice castle(trolls love castles and not bogs, everyone knows that), and proceeded to trash uncle Scratchy most thoroughly. I believe my uncle still nurses a broken leg.~
== O#BBRA25 ~And the Promenade?~
== BJAN25 ~I've heard Trax has already demanded for 100,000 from the city budget, pointing out that he's started demolishing the old premises. When the Chief Inspector pointed out that it was in fact Irenicus who had blown up half of the Promenade, my friend Trax was very surprised.~
== O#BBRA25 ~And the morale of this tale is?~
== BJAN25 ~Why, six trolls is never enough. You should have friends in the high places, too, if you're ever going into business. Even if it's just turnip-peddling. Speaking of which, time for supper!~
== O#BBRA25 ~(groan)~
EXIT

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranKeldornToB1","GLOBAL",0)~ THEN O#BBRA25 O#BranKeldornToB1
~Keldorn, isn't it high time for you to retire? Your daughters must miss you.~
DO ~SetGlobal("O#BranKeldornToB1","GLOBAL",1)~
== BKELDO25 ~Aye, and I'll do it gladly, once our friend's campaign is over. My eldest is becoming the most beautiful young lady, and I fear some rascal may try and use her.~
== O#BBRA25 ~Surely he won't be as bold as try and seduce a paladin's daughter?~
== BKELDO25 ~Alas. Truly, I've seen some most disturbing examples even in this party, when young people lie together outside of the sanctity of marriage!~
== O#BBRA25 ~No. It can't be!~
== BKELDO25 ~... You are mocking me again, young Branwen, are you not?~
== O#BBRA25 ~Guilty as charged. But, Keldorn, men and women will sleep together, married or not! 'Tis our nature, no?~
== BKELDO25 ~Yet we are not animals to follow our every desire. You wouldn't eat your meat raw and sleep in a tree. You wouldn't want your child to grow up without a father.~
== O#BBRA25 ~Because yours did?~
== BKELDO25 ~Aye, she did. But never again. So do I swear.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranKorganToB1","GLOBAL",0)~ THEN BKORGA25 O#BranKorganToB1
~Branwen! Hand me that tankard, come on!~
DO ~SetGlobal("O#BranKorganToB1","GLOBAL",1)~
== O#BBRA25 ~Dwarf, you're drunk.~
== BKORGA25 ~So what's it to ye?~
== O#BBRA25 ~Your axe may take off the wrong head in the heat of battle. By Tempus, at least wash your face with some cold water!~
== BKORGA25 ~Aye, aye, woman. You worry too much!~
== O#BBRA25 ~'Tis not mine own head I'm worried for. 'Tis yours.~
EXIT

CHAIN
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranMazzyToB1","GLOBAL",0)~ THEN O#BBRA25 O#BranMazzyToB1
~Mazzy? You're going to Neverwinter after this is done, correct?~
DO ~SetGlobal("O#BranMazzyToB1","GLOBAL",1)~
== BMAZZY25 ~Aye, my friend. Would you wish to come with me?~
== O#BBRA25 ~If <CHARNAME> wishes it. I'm sworn to <PRO_HISHER> side, but I would love for us all to continue adventuring together.~
== BMAZZY25 ~It is my wish, as well. Wouldn't that be lovely? Fentan knights!~
== O#BBRA25 ~What? Not 'Branwen's sailors' or '<CHARNAME>'s minions'?~
== BMAZZY25 ~Haha! I was only joking, my friend. Though, truth be told, I like the name...~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranMinscToB1","GLOBAL",0)~ THEN BMINSC25 O#BranMinscToB1
~Friend Branwen, shall Minsc and Boo and you sing again?~
DO ~SetGlobal("O#BranMinscToB1","GLOBAL",1)~
== O#BBRA25 ~Perhaps another time, Minsc.~
== BMINSC25 ~Then Minsc will sing for you and Boo will sing along! From beyond the wooded island
to the river wide and free...~
== O#BBRA25 ~Minsc, no! Not now, please. My head hurts.~
== BMINSC25 ~It must be because you are in dire need of some butt-kicking goodness! Boo, let's find little Branwen something juicy to kill.~
== BMINSC25 ~What are you saying, Boo?~
== BMINSC25 ~Boo says a giant might be nice. What do you think, Branwen?~
== O#BBRA25 ~Half a dozen of them, more like. My headache is killing me.~
== BMINSC25 ~Then forward, for the medicine!~
== O#BBRA25 ~Ah, Minsc. Never change.~
EXIT

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
Global("O#BranNaliaToB1","GLOBAL",0)~ THEN O#BBRA25 O#BranNaliaToB1
~You're different now, Nalia.~
DO ~SetGlobal("O#BranNaliaToB1","GLOBAL",1)~
== BNALIA25 ~I am. I have much to think about. My castle, my people, my lands...~
== O#BBRA25 ~Athkatla, too, I gather?~
== BNALIA25 ~And the whole of Amn. It's time everything changed.~
== O#BBRA25 ~If I can help, just say a word.~
== BNALIA25 ~Actually, I've been thinking about a hospital for the poor. You could help me find the men and women for it. And stay for a while, yourself, if you prefer.~
== O#BBRA25 ~I'll gladly help. I'm proud of you, Nalia.~
== BNALIA25 ~Thank you. But now I have to turn my mind to other things. Excuse me.~
== O#BBRA25 ~(sigh) 'Twas more fun when trolls attacked her castle.~ 
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranSarevokToB2","GLOBAL",0)~ THEN BSAREV25 O#BranSarevokToB2
~Another girl from my past. Who would've thought you'd survive, brash priestess?~
DO ~SetGlobal("O#BranSarevokToB2","GLOBAL",1)~
== O#BBRA25 ~They call me brash, and they are not wrong. But I'm also the winner.~
== BSAREV25 ~Aye, at my sibling's side.~
== O#BBRA25 ~You doubt that I can become a winner in my own right?~
== BSAREV25 ~Not if you prove it.~
== O#BBRA25 ~Come along and watch me.~
== BSAREV25 ~What?~
== O#BBRA25 ~You've heard me. You, <CHARNAME>, our companions. Just watch me in battle and make your decisions. If you think I can stand on my own, don't aid me. I'll prove myself.~
== BSAREV25 ~Alone against a horde, with the rest of us just watching? You'll be slaughtered.~
== O#BBRA25 ~No.~
== BSAREV25  ~Now I understand why they call you Branwen the Brash.~
== O#BBRA25 ~Just wait 'till you hear what they call you, brother.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("O#Bran",CD_STATE_NOTVALID)
!StateCheck("Valygar",CD_STATE_NOTVALID)
Global("O#BranValygarToB2","GLOBAL",0)~ THEN BVALYG25 O#BranValygarToB2
~Branwen, what are you doing with this cloak?~
DO ~SetGlobal("O#BranValygarToB2","GLOBAL",1)~
== O#BBRA25 ~I'm going to make myself a new skirt.~
== BVALYG25 ~This short?~
== O#BBRA25 ~Aye! You think it won't suit me?~
== BVALYG25 ~No, I think... it will be very becoming. Just not very practical.~
== O#BBRA25 ~Flatterer. All right, let's consider you've wormed your way out of that one.~
== BVALYG25 ~I'm ever at your service, milady.~
EXIT

CHAIN 
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("O#Bran",CD_STATE_NOTVALID)
!StateCheck("Viconia",CD_STATE_NOTVALID)
Global("O#BranViconiaToB1","GLOBAL",0)~ THEN BVICON25 O#BranViconiaToB1
~Whenever I approach you, abbil, we talk about perfume, clothes and drinking. Doesn't it bore you?~
DO ~SetGlobal("O#BranViconiaToB1","GLOBAL",1)~
== O#BBRA25 ~Aye! I've been waiting for that moment eagerly, in fact. Shall we finally talk about what's truly important?~
== BVICON25 ~Their size, their weight, their hard smoothness in our hands?~
== O#BBRA25 ~Their prices?~
== BVICON25 ~The way battle dents and batters them?~
== O#BBRA25 ~Aye, I love comparing war hammers and maces! Let's go over there, so no one would interrupt us! Oh, it's going to be such fun!~
== BVICON25 ~Hmm. Surface-dwellers can be quite practical.~
EXIT
