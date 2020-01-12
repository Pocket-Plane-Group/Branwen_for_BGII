// Crossmod for BG2EE 

// Dorn

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranDorn1","GLOBAL",0)~ THEN BDORN O#BranDorn1
~We travel side by side again, I see. My master grows very interested in you.~
DO ~SetGlobal("O#BranDorn1","GLOBAL",1)~
== O#BBRAN ~Don't tell me. Same old "Join the dark side, Branwen, we have cookies?"~
== BDORN ~Ha! Do you expect me to bake you cookies, woman?~
== O#BBRAN ~Well, you'd look good in an apron.~
== BDORN ~Not in this lifetime.~
== O#BBRAN ~Thought you'd chicken out.~
EXIT

CHAIN
IF ~InParty("Dorn")
See("Dorn")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranDorn2","GLOBAL",0)~ THEN O#BBRAN O#BranDorn2
~I must say, you are a strong warrior, Dorn. 'Tis a true pity you're so entrenched in your dishonorable ways.~
DO ~SetGlobal("O#BranDorn2","GLOBAL",1)~
== BDORN ~Blackguards have plenty of honor, woman. Just not the sort you require.~
== O#BBRAN ~Do you keep your word? Protect the ailing and week? Respect a worthy enemy? Give mercy to those who ask for it?~
== BDORN ~You know the answers better than I. Why do you keep asking questions?~
== O#BBRAN ~Because I hope to drag you to the light one day, Dorn. A pain in the ass that you are, you are still a mighty warrior.~
== BDORN ~Ha! Keep hoping, woman.~
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranDorn3","GLOBAL",0)~ THEN BDORN O#BranDorn3
~We should have a drink sometime. Reminisce on the old times and new ones. Get into a good brawl, kick a few shins, have a good time. What say you?~
DO ~SetGlobal("O#BranDorn3","GLOBAL",1)~
== O#BBRAN ~I'd love to. We should take <CHARNAME>: I think <PRO_HESHE>'s been looking down lately.~
== BDORN ~A bloody fight to the death should do <PRO_HIMHER> good.~
== O#BBRAN ~And not <PRO_HIMHER> alone. You, too, look strained. Even evil needs to relax sometimes, hm?~
== BDORN ~You've got me here.~
EXIT

// ToB

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranToBDorn1","GLOBAL",0)~ THEN BDORN25 O#BranToBDorn1
~Whatever are you doing, woman? ~
DO ~SetGlobal("O#BranToBDorn1","GLOBAL",1)~
== O#BBRA25 ~Oh, just braiding your hair. Never mind me.~
== BDORN25 ~Stop it!~
== O#BBRA25 ~Nope. Tempus wills your unruly mane into lovely braids, so sit tight and do not bite!~
== BDORN25 ~Grrr...~
== O#BBRA25 ~Here. Done now. I could swear, 'tis the sweetest blackguard in the history of the Realms sitting before me.~
== BDORN25 ~One day I shall be your death, woman.~
== O#BBRA25 ~Your hair certainly will.~
EXIT

// Hexxat

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Hexxat",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranHexxat1","GLOBAL",0)~ THEN BHEXXAT O#BranHexxat1
~All angry silences? I thought you'd be more... tolerant of me, Branwen.~
DO ~SetGlobal("O#BranHexxat1","GLOBAL",1)~
== O#BBRAN ~I destroy every undead I meet, everywhere, and I am proud of it. There is a time for mercy and pity. But you can feel none - and you will get none.~
== BHEXXAT ~Too bad. You could learn so much.~
== O#BBRAN ~Tempus save me from such knowledge.~
EXIT

// ToB

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Hexxat",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranToBHexxat1","GLOBAL",0)~ THEN BHEXXA25 O#BranToBHexxat1
~Still nothing to say to me?~
DO ~SetGlobal("O#BranToBHexxat1","GLOBAL",1)~
== O#BBRA25 ~No. Stay away, Hexxat.~
== BHEXXA25 ~Your loss.~
EXIT

// Neera

CHAIN
IF ~InParty("Neera")
See("Neera")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranNeera1","GLOBAL",0)~ THEN O#BBRAN O#BranNeera1
~'Twas most discourteous of you, Neera. Pink hammer? Seriously? What would Tempus think?~
DO ~SetGlobal("O#BranNeera1","GLOBAL",1)~
== BNEERA ~Er... I didn't dye your hammer pink, Branwen.~
== O#BBRAN ~Hmph. You must think me a fool. In this company, only you and Imoen are so attached to the color.~
== BNEERA ~Nope. 'Twas <CHARNAME>, believe it or not. Our leader did it on a dare. I underestimated <PRO_HIMHER>, by the way.~
== O#BBRAN ~Truly?~
== BNEERA ~Yep.~
== O#BBRAN ~Then... I apologize, Neera. I shouldn't have judged you so rashly. I... well, I still have a piece of cake from breakfast. I'd be honored to share it with you.~
== BNEERA ~Cake! Chocolate cake! Cake! But... no. Um... wait. Wait.~
== O#BBRAN ~What is it?~
== BNEERA ~Branwen, I'm sorry. I got to tell you the truth. It WAS me, after all. With your hammer.~
== O#BBRAN ~You do know you're not getting any cake for that, do you?~
== BNEERA ~Yeah. Yeah, you bet I know. But the truth is more important.~
== O#BBRAN ~And I respect you for that. Ha! Pink hammer or no, there's enough cake for both of us! Come, let's share a taste as we walk.~
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranNeera2","GLOBAL",0)~ THEN BNEERA O#BranNeera2
~So. You and Tempus have a very special relationship.~
DO ~SetGlobal("O#BranNeera2","GLOBAL",1)~
== O#BBRAN ~He does not turn me into rabbits daily, if 'tis what you mean.~
== BNEERA ~No, no. I just... wonder. You pray and he answers? How does it work?~
== O#BBRAN ~I feel Him. In the sunlight. In the water. In here, with you and me. In the force that guides my every spell. 'Tis that simple.~
== BNEERA ~Huh. Much like I feel my magic, then. It's an amazing feeling, you know.~
== O#BBRAN ~Aside from the rabbit thing.~
== BNEERA ~Well, nobody's perfect.~
EXIT

CHAIN
IF ~InParty("Neera")
See("Neera")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranNeera3","GLOBAL",0)~ THEN O#BBRAN O#BranNeera3
~You're drinking that strange thing of yours again.~
DO ~SetGlobal("O#BranNeera3","GLOBAL",1)~
== BNEERA ~Tea. It's called tea. Do you want to try it?~
== O#BBRAN ~Mayhap just a taste.~
== BNEERA ~Here. It's cherry.~
== O#BBRAN ~Mmm. Mmmm!~
== BNEERA ~Heh. That good?~
== O#BBRAN ~Like sleeping with a strapping lad, only better. Where are you getting this... tea?~
== BNEERA ~Oh, here and there. You never know when you get lucky.~
== O#BBRAN ~Neera, you're not stealing, are you? We are honorable warriors!~
== BNEERA ~Sure we are. Well, you are. I just like tea.~
EXIT

// ToB 

CHAIN
IF ~InParty("Neera")
See("Neera")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranNeeraToB1","GLOBAL",0)~ THEN O#BBRA25 O#BranNeeraToB1
~Damn the icicles of Auril. I'm bored.~ [o#bran10]
DO ~SetGlobal("O#BranNeeraToB1","GLOBAL",1)~
== BNEERA25 ~That didn't take long.~
== O#BBRA25 ~Well, I am! No enemies in sight, and <CHARNAME>'s conversing with this Solar of who-knows-what plane, and I have little and less patience for all this!~
== BNEERA25 ~Aren't men and women of the faith supposed to respect old prophecies and cryptic messengers?~
== O#BBRA25 ~Not when it's my friend's life on the line! Tell you what, Neera. You summon your wild whirls, I'll bring my hammer, and next time that Solar appears and tries to put us to sleep, let's teach her a lesson. You don't mess with us.~
== BNEERA25 ~Haha! I like the way you think. Shall we let <CHARNAME> in on our sinister plot?~
== O#BBRA25 ~Nah, <PRO_HESHE> is listening anyway.~
== BNEERA25 ~Then it's a plan. Unless we just fall asleep again when Solar appears.~
== O#BBRA25 ~There's that.~
EXIT

// Rasaad

CHAIN
IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranRasaad1","GLOBAL",0)~ THEN O#BBRAN O#BranRasaad1
~A brooding monk and a northern priestess are together again, marching by a Bhaalspawn's side. 'Tis like a second tome of a saga, mmm, Rasaad?~
DO ~SetGlobal("O#BranRasaad1","GLOBAL",1)~
== BRASAAD ~I do not feel like a hero of a saga.~
== O#BBRAN ~Nobody does, until the saga's over. Then they get all nostalgic... by Tempus' shield, I am going all nostalgic now! Remember Nashkel? And the striped tents, and the river?~
== BRASAAD ~I remember the kobolds.~
== O#BBRAN ~Ugh! Don't remind me. (sigh) And I remember the statue I once was. Rain pouring over unfeeling eyes... and darkness. And yet I am nostalgic. Strange, isn't it? Remembering only the good?~
== BRASAAD ~It's a great gift, Branwen. I wish I had it.~
== O#BBRAN ~You will. In ten, in twenty years you'll remember our exchange of words and smile. I promise you.~
EXIT

CHAIN
IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranRasaad2","GLOBAL",0)~ THEN O#BBRAN O#BranRasaad2
~Have you ever dreamt of holding a hammer, Rasaad? Or a pair of swords? A halberd?~
DO ~SetGlobal("O#BranRasaad2","GLOBAL",1)~
== BRASAAD ~Sometimes, when I was a boy. Every boy has such dreams, doesn't he?~
== O#BBRAN ~'Tis true. I had such dreams as a girl, as well. And mine came true.~
== BRASAAD ~Mine, too, in a way. My masters used to say I was a warrior born.~
== O#BBRAN ~An unarmed warrior... but a deadly one. I like it.~
== BRASAAD ~Are you... flirting with me, Branwen?~
== O#BBRAN ~Haha! I flirt with everyone, my dear friend, haven't you noticed? But 'twould be false to say I was not admiring your prowess. You are a fearsome sight on the battlefield.~
EXIT

CHAIN
IF ~InParty("O#Bran")
See("O#Bran")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranRasaad3","GLOBAL",0)~ THEN BRASAAD O#BranRasaad3
~Branwen, you look especially happy today.~
DO ~SetGlobal("O#BranRasaad3","GLOBAL",1)~
== O#BBRAN ~'Tis so. And do you know why?~
== BRASAAD ~Am I supposed to ask?~
== O#BBRAN ~You are! Because I read a wonderful, perilous book about dragons!~
== BRASAAD ~An interesting read, I take it?~
== O#BBRAN ~Very! Imagine, there are numerous dragons in Tethyr, and the author even hinted he's heard of a dragon Bhaalspawn, once! I want to kill it so much!~
== BRASAAD ~Sometimes you scare me, Branwen.~
== O#BBRAN ~Nah, 'tis just enthusiasm. Come on! If we start pestering <CHARNAME> now, we may well get to Tethyr by the end of the year!~
EXIT

// ToB

CHAIN
IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("O#Bran",CD_STATE_NOTVALID)
Global("O#BranToBRasaad1","GLOBAL",0)~ THEN O#BBRA25 O#BranToBRasaad1
~Rasaad! Catch!~
DO ~SetGlobal("O#BranToBRasaad1","GLOBAL",1)~
== BRASAA25 ~What's that? A cake? Covered with strange white frosting... what is it?~
== O#BBRA25 ~Coconut, silly! You've never seen it? And with your family coming from the southern lands, too, for shame!~
== BRASAA25 ~I'd rather not speak of my family now, Branwen.~
== O#BBRA25 ~I know. Which is why you're getting the cake, instead.~
== BRASAA25 ~But why?~
== O#BBRA25 ~Because one more hour of staring at your moody face, and I'll scream. So eat your cake. Now. That's an order!~
== BRASAA25 ~Aye, aye, mistress Branwen.~
EXIT
