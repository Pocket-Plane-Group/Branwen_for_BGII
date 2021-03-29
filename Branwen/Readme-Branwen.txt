			Branwen NPC MOD for Baldur's Gate II
				   Version 7
			  A Pocket Plane Group Project
			   http://www.pocketplane.net



This is not just an NPC mod for BG2 players. It is also an NPC mod for modders!
If you want to create an NPC mod, but don't know how, Branwen's files will
help you and teach you. Of course, you can play her, too.

To start as a player, just unpack the archive into your BG2 directory and run
Setup-Branwen.exe. 

To start as a modder, open any of Branwen's files and read the comments. 
I recommend starting with Branwen/Dialogue/O#Bran.d and Setup-Branwen.tp2.
And, please, register a modding prefix here first, to replace mine(O#): 
http://forums.blackwyrmlair.net/index.php?showtopic=113

Please note: for BGII:EE and EET, if you want to create a mod that uses any other letters or symbols than the latin (english) alphabet, you need to provide the texts in UTF-8 (without BOM) format, whereas the original game needs them in ANSI. So in case you do, you'll need to get familiar with using d/tra-pairs in your mod ("traify-ing" your mod) and using HANDLE_CHARSETS + iconv.exe for text transformation upon install: 

As of v6, the mod contains iconv.exe and all syntax needed for a mod to be able to include several language versions. 


Contents

1. Introduction
2. Installation
3. General Information
4. Frequently Asked Questions
5. Credits
6. Legal Information

----------------
1. Introduction
----------------

Branwen NPC MOD for Baldur's Gate II (Branwen for short) is an add-on for
the game Baldur's Gate II, with or without the Throne of Bhaal expansion pack.
Throne of Bhaal content is present.

Branwen, a non-player character from the first game in Baldur's Gate series, is a
True Neutral human cleric. She worships Tempus, and one of her most famous quotes
is "By Tempus' shield!"

----------------
2. Installation
----------------

Make sure that you have obtained and installed the latest official Bioware patch.
Install the official patch BEFORE installing any unofficial modifications.

Make sure that Baldur's Gate II or ANY game-related utilities are not running.

To install the mod, unpack the archive into your BG2 directory and run 
Setup-Branwen.exe.

Once you see the Readme, the installation is complete.

To reinstall or uninstall the mod, run Setup-Branwen.exe in your game directory.

-----------------------
3. General Information
-----------------------

This mod adds Branwen as a viable, fully developed NPC.

Branwen can be found in the Bridge district of Athkatla, near the entrance.
You do not need to start a new game to get her into your party.

In ToB, she can also be summoned from the Pocket Plane Fate Spirit.

She has a full friendship with the PC, player-initiated dialogue, banters with
all Bioware NPCs(three banters for those who was in BG1), a number of
interjections, character reactions and other scenery dialogue.

Male human, elven, half-elven and half-orcish protagonists may begin a 
romance with Branwen and continue it to ToB. 

Depending on PC's level, Branwen's experience may be 161000, 400000, 
800000 or 1200000 experience points.

In ToB, Branwen starts with 2500000 experience. 

If you experience any problems with Branwen's select/confirm sounds, select
her in the game and press K key. This should fix the problem.

------------------------------
4. Frequently Asked Questions
------------------------------

Q: Where is she?
A: Branwen is in the Bridge district of Athkatla, not far from the main entrance.
You should see her once you enter the area.
Q: But she is not there!
A: Make sure that you have actually installed the mod. Open your game directory
and run Setup-Branwen.exe. If this file is not there, repeat the installation
process as described above.

Q: Branwen's select/confirm sounds are all mixed up! And her name, too!
A: Select Branwen and press K key.

Q: Is there a romance between Branwen and a male PC?
A: Yes, for the "tall" races, including a human, elf, half-elf and a half-orc.

Q: Does Branwen really have a full romance?
A: Yes, with player-initiated flirts and Branwen-initiated flirts, as well,
for SoA and ToB. Teen content only. There are also "obligatory" romance
events, like Bodhi abduction, Gorion Wraith encounter and post-Saradush talk.

Q: What about Branwen's romance from BG1 NPC Project you wrote with Domi?
A: You can refer to it a few times, if you choose to, but the romance will
continue just fine either way.

Q: Any special places for Branwen to talk to?
A: In addition to a friendship/romance track, Branwen has talks
in Chapters 4,5,7, an additional talk an hour after Chapter 5 starts,
a talk in Sahuagin city and a talk after the 3rd challenge in ToB.

Q: Any party advice?
A: All NPCs who were in BG1. Imoen, Jaheira, Minsc, Viconia, Edwin all get
at least three conversations with Branwen in SoA. Also Xan, Kivan, Ajantis,
Tiax, Coran and others, if Crossmod Banter Pack ever gets updated again.

Q: Can I install Branwen and continue playing?
A: Sure, just quit the game before installing mods.

Q: Is Branwen compatible with mod X?
A: Branwen should work fine with other mods. Install her together with other
NPCs.



Q: I am a modder and I want to steal your code.
A: Steal away! You'll have to open files and read comments on how it works.

Don't forget to register your own prefix here:
http://forums.blackwyrmlair.net/index.php?showtopic=113
(because you obviously can't have mine, I'm that greedy)

I also strongly recommend my dialogue tutorials at Pocket Plane Group forums.

And don't forget to download Infinity Explorer and DLTCEP! The links are below.

Q: I stole your code, changed it, and now I'm getting a syntax error in my mod.
It sucks.
A: Yes, it does. I had the same problems, but you're going to get it done.

Visit the modding Q&A forums at shsforums.net, forums.gibberlings3.net
and forums.pocketplane.net. But first, try to solve the problem yourself.
A missing '~' is often the key.

Q: Can I e-mail or PM you instead?
A: (evil laughter) No. But I answer queries in Modding Q&A sometimes,
when I'm active on the forums.



-----------
5. Credits
-----------

Olga Silaeva (Kulyok)				Writer
						Programmer

"From beyond the wooded island..." by Dmitry Nikolaevich Sadovnikov, 1883.
Translated by Jacob Robbins, 1921.

Flirting technology originally developed for Kelsey NPC by Jason Compton and
Jesse Meyers. http://www.pocketplane.net/kelsey

All my mods were created using the resources provided by the IESDP.
http://iesdp.gibberlings3.net

Branwen was created with the following software:

DLTCEP					http://www.gibberlings3.net/tools/
Infinity Explorer			http://infexp.sourceforge.net
WeiDU					http://www.weidu.org

-------------------
6. Version History
-------------------

Version 7
- Russian version by Jericho2

Version 6
- mod is now traified, by Austin.
- removed not needed Backup folder.
- links in branwen.ini updated.
- shortened mod name in .ini
- add Dynamic Install Syntax to support Project Infinity.

Version 5
-updated branwen.ini with the GitHub address for download

Version 4
- EET compatibility (with explanations!)
- corrected Viconia's DV in her interjection where Minsc's was checked instead
- added small note to readme about text formats needed in the EE
- renamed setup-Branwen.tp2 -> Branwen.tp2 to support ALIEN's "Project Infinity"
- added Branwen.ini to support ALIEN's "Project Infinity"
- moved readme call to the beginning 
- Updated to WeiDU 246

Version 3
- Banters with Dorn, Hexxat, Neera and Rasaad for BG2EE

Version 2
- Full BG2:EE compatibility

Version 1
- Initial release

---------------------
7. Legal Information
---------------------

=================================================================================
BALDUR'S GATE II: SHADOWS OF AMN Developed and © 2000 BioWare Corp. All Rights
Reserved. BALDUR'S GATE II: THRONE OF BHAAL Developed and © 2001 BioWare
Corp. All Rights Reserved. Baldur's Gate, Shadows of Amn, Tales of the Sword
Coast, Forgotten Realms, the Forgotten Realms logo, Advanced Dungeons & Dragons,
the AD&D logo, TSR and the TSR logo, and the Wizards of the Coast logo, are
trademarks of the Wizards of the Coast, Inc., a subsidiary of Hasbro, Inc., and
are used by Interplay Entertainment Corp. under license. All Rights Reserved.
BioWare, the BioWare Infinity Engine and the BioWare logo are the trademarks of
BioWare Corp. All Rights Reserved. Black Isle Studios and the Black Isle Studios
logo are trademarks of Interplay Entertainment Corp. All Rights Reserved.
Exclusively licensed and distributed by Interplay Entertainment Corp. All other
trademarks and copyrights are property of their respective owners.
=================================================================================

=================================================================================
Branwen NPC MOD for Baldur's Gate II © 2013 Olga Silaeva. Branwen is not 
developed, supported, or endorsed by BioWare, Black Isle Studios, Interplay
Entertainment Corp., or the Wizards of the Coast. All other trademarks and
copyrights are property of their respective owners.
=================================================================================

=================================================================================
REDISTRIBUTION NOTE: Branwen was created to be freely enjoyed by all Baldur's
Gate II players and picked apart by all Baldur's Gate II modders. Please, don't
mirror Branwen anywhere, but feel free to use her code as a base for your mod. 
If you manage to sell her, let me know.
=================================================================================