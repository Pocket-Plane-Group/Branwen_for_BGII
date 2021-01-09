// Read this after all SoA dialogue. Start reading with O#Bran.d
// This is Branwen's dialogue file for ToB, when she is summoned by the Fate Spirit, BEFORE she joins the party.

BEGIN O#BRAN25

// Non-romanced, just summoned.

IF ~Global("O#BranSummoned","GLOBAL",1) !Global("O#BranRomanceActive","GLOBAL",2)~ b1
SAY @0 /* Where... where am I? By Tempus, is this the Abyss again? */
++ @1 /* No, Branwen. Just me. */ DO ~SetGlobal("O#BranSummoned","GLOBAL",2)~ + b1.1
++ @2 /* This is my pocket plane. */ DO ~SetGlobal("O#BranSummoned","GLOBAL",2)~ + b1.1
END

IF ~~ b1.1
SAY @3 /* Oh. You have this power? You've grown all high and mighty now, have you? */
= @4 /* I've been worried about you when you have disappeared from Suldanessellar. I'm glad that you are all right. */
= @5 /* Have you summoned me to travel with you again? Because if 'tis your wish, I am ready. */
++ @6 /* Of course. Join me, Branwen. */ + b1.2
++ @7 /* Not yet. Please, wait here. */ + b1.3
END

IF ~~ b1.2
SAY @8 /* With pleasure! */
IF ~~ DO ~JoinParty()~ EXIT
END

IF ~~ b1.3
SAY @9 /* Very well. I hope 'tis not forever... */
IF ~~ DO ~MoveToPointNoInterrupt([1717.1717]) Face(0)~ EXIT // Naturally, I recommend you to choose another set of coordinates for your NPC. This is where they'll wait for PC in the Pocket Plane.
END

// Romanced, just summoned.

IF ~Global("O#BranSummoned","GLOBAL",1) Global("O#BranRomanceActive","GLOBAL",2)~ b2
SAY @10 /* Looks like you don't like wasting time, lover. Care to show me some of these demonic bedrooms? */
++ @11 /* Absolutely. Join me, and I will show you much more. */ DO ~SetGlobal("O#BranSummoned","GLOBAL",2)~ + b1.2
++ @12 /* Perhaps later. Please, wait for me over there. */ DO ~SetGlobal("O#BranSummoned","GLOBAL",2)~ + b1.3
END

// If you haven't let Branwen join the first time, here's her dialogue when she stands in the pocket plane:

IF ~Global("O#BranSummoned","GLOBAL",2)~ b3
SAY @13 /* By Tempus, you have returned! Are we to join again and fight as mighty warriors should? Say it is so! */
++ @14 /* I have. Please, join me. */ + b3.1
++ @15 /* Not at the moment. */ + b3.2
END 

IF ~~ b3.1
SAY @16 /* A triumphant day, indeed! I welcome your company once again! */
IF ~~ DO ~JoinParty()~ EXIT
END

IF ~~ b3.2
SAY @17 /* Too bad. */
IF ~~ EXIT
END