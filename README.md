# boggart-wow

Steps (WIP)

On the docker tab of Unraid select 'Add New Stack'. Name the stack and click Create.
Right click the stack and edit it. Paste


Set to manual override

Paste in the docker compose file contents and the override contents

Run the stack and let the db popualte for 10 mins or so

Connect to the db on port 3306 with default login root:password

Update the realm IP with the following

USE acore_auth;
SELECT * FROM realmlist;
UPDATE realmlist SET address='YOURSERVERIP'
WHERE NAME = 'AzerothCore';

Attach to the worldsserver and make an admin account

docker attach ac-worldserver
account create admin password
account set gmlevel admin 3 -1

also crate the account for the auction house

account create auctioneer password

login as the auctioneer and create one or more characters with names you want to see in the AH then log out.

Query the db to get the guid id of that character:
USE acore_characters;
SELECT guid, name FROM characters WHERE name = 'YourCharName';

note down the guids

Compose down the server.

In the override compose file populate that guid in AC_AUCTION_HOUSE_BOT_GUIDS
e.g. AC_AUCTION_HOUSE_BOT_GUIDS: "3002,3003"

Then set AC_AUCTION_HOUSE_BOT_ENABLE_SELLER and AC_AUCTION_HOUSE_BOT_BUYER_ENABLED to true.

Now compose up the server and login as any account besides the auctioneer. (never login to the auctioneer whilst the seller is enabled as this can cause issues)

Individual Progression

# Progression Tiers

| Tier | Level | Name | Final Bosses | Approximate ilvl |
|---:|---:|---|---|---|
| Base for AH Bot | 30 | N/A | N/A | 32 |
| Pre-Raid | 52-58 | Dungeons | N/A | 57-63 |
| 0/1 | 60 | Molten Core/Onyxia's Lair | Ragnaros/Onyxia | 61-70 |
| 2 | 60 | Blackwing Lair | Nefarian | 73-77 |
| 3 | 60 | Pre-AQ | (Simply) Bang a Gong! *(final quest)* | - |
| 4 | 60 | AQ-War | Chaos and Destruction *(final quest)* | - |
| 5 | 60 | Ahn'Qiraj | C'Thun | 78-88 |
| 6 | 60 | Naxxramas | Kel'Thuzad | 81-92 |
| 7 | 60 | Pre-TBC | Into the Breach *(final quest)* | - |
| 8 | 70 | Karazhan, Gruul's Lair, Magtheridon's Lair | Prince Malchezaar | 115-125 |
| 9 | 70 | Serpentshrine Cavern, Tempest Keep | Kael'thas | 128-171 |
| 10 | 70 | Hyjal Summit, Black Temple | Illidan | 141-156 |
| 11 | 70 | Zul'Aman | Zul'jin | 128-138 |
| 12 | 70 | Sunwell Plateau | Kil'jaeden | 141-164 |
| 13 | 80 | Naxxramas (WotLK), Eye of Eternity, Obsidian Sanctum | Kel'Thuzad (Level 80) | 213-226 |
| 14 | 80 | Ulduar | Yogg-Saron | 232-252 |
| 15 | 80 | Trial of the Crusader | Anub'arak | 232-258 |
| 16 | 80 | Icecrown Citadel | The Lich King | 251-284 |
| 17 | 80 | Ruby Sanctum | Halion | 258-284 |

**Source:** [List of Progression Tiers — Individual Progression](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/List-of-Progression-Tiers)
