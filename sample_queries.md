## Database Sample Queries

**Scenario:** Display a specified user’s favourite tracks with the track & artists names.

**SQL Command:**
SELECT UserID, Username, TrackID, TrackName AS Favourite_Tracks, Name AS ArtistName 
FROM TW_User NATURAL JOIN UserFavourites NATURAL JOIN Track NATURAL JOIN Artist 
WHERE UserID = 1 ;

**Result:**
| Username     | Favourite_Tracks               | ArtistName      |
|:------------:|:------------------------------:|:---------------:|
| Skywalker85  | Don't Stop 'Til You Get Enough | Michael Jackson |
| Skywalker85  | Come Together                  | Michael Jackson |

---

**Scenario:** Display all followers of a specified artist that also hold a certain subscription type.

**SQL Command:**
SELECT Name AS ArtistName, UserName,SubType,SubscriptionOrder.Status 
FROM Artist JOIN ArtistFollower USING (ArtistID) 
JOIN TW_User USING (UserID) JOIN SubscriptionOrder USING (UserID) 
JOIN Subscription USING (SubType) 
WHERE ArtistID = 3 AND SubscriptionOrder.Status = 'Paid';

**Result:**
| ArtistName | Username    | SubType | Status |
|:----------:|:-----------:|:-------:|:------:|
| Beyoncé    | starrysky82 | Silver  | Paid   |

---

**Scenario:** Display all tracks recorded by a specific artist and the album it belongs to, if one 
exists.

**SQL Command:**
SELECT a.Name AS ArtistName, t.TrackName,alb.AlbumName 
FROM Artist a JOIN TRACK t ON a.ArtistID = t.ArtistID 
LEFT OUTER JOIN Album alb ON alb.AlbumID = t.AlbumID WHERE a.ArtistID = 7

**Result:**
| ArtistName   | TrackName     | AlbumName |
|:------------:|:-------------:|:---------:|
| Taylor Swift | Blank Space   | 1989      |
| Taylor Swift | Shake It Off  | 1989      |
| Taylor Swift | Style         | 1989      |
| Taylor Swift | Love Story    | -         |

---

**Scenario:** Display all artists, podcasts & podcast creators that a specific user follows. 

**SQL Command:**
SELECT Username,Name AS Artist, PodcastName AS Podcast, CreatorName AS PodcastCreator
FROM TW_User JOIN ArtistFollower USING (UserID) 
JOIN Artist USING (ArtistID) 
JOIN PodcastFollower USING (UserID) 
JOIN Podcast USING (PodcastID) 
LEFT OUTER JOIN PodcastCreatorFollower USING (UserID)
LEFT OUTER JOIN PodcastCreator ON PodcastCreator.CreatorID = 
PodcastCreatorFollower.CreatorID
WHERE UserID = 7;

**Result:**
| Username      | Artist  | Podcast           | PodcastCreator |
|:-------------:|:-------:|:-----------------:|:--------------:|
| thunderbird75 | Beyoncé | History Uncovered | -              |
| thunderbird75 | ABBA    | History Uncovered | -              |

---

**Scenario:** Display all episodes of a specified podcast, and its creator.

**SQL Command:**
SELECT PodcastName, CreatorName, EpisodeName 
FROM Podcast JOIN PodcastCreator USING (CreatorID)
JOIN PodcastEpisode USING (PodcastID) WHERE PodcastID = 3;

**Result:**
| PodcastName      | CreatorName | EpisodeName                |
|:----------------:|:-----------:|:--------------------------:|
| Health Insights  | PodSquad    | Fitness Trends             |
| Health Insights  | PodSquad    | Nutrition and Diet Myths   |
| Health Insights  | PodSquad    | Wellness and Mental Health |

---

**Scenario:** Display the total number of followers of all podcasts by a specific podcast creator.

**SQL Command:**
SELECT COUNT(*) AS TotalFollowers FROM
(SELECT CreatorName,PodcastName,PodFollowerID
FROM PodcastCreator JOIN Podcast USING (CreatorID) 
JOIN PodcastFollower USING (PodcastID) WHERE CreatorID = 2);

**Result:**
| TotalFollowers   |
|:----------------:|
| 4                |

---

**Scenario:** Display the average number of followers each artist has.

**SQL Command:**
DECLARE
TotalFollowers NUMBER;
TotalArtists NUMBER;
AvgFollowers Number;
BEGIN
SELECT COUNT(*) INTO TotalFollowers FROM ArtistFollower;
SELECT COUNT(*) INTO TotalArtists FROM Artist;
AvgFollowers := TotalFollowers / TotalArtists ;
DBMS_OUTPUT.PUT_LINE('Each artist has an average of ' || AvgFollowers || ' followers.'); 
End

**Result:**
Each artist has an average of 1.875 followers.

---

**Scenario:** Display the artist with the highest number of followers.

**SQL Command:**
DECLARE
ArtistsFollowers NUMBER := 0;
MaxFollowers NUMBER := 0;
MaxArtistID NUMBER := 0;
NumArtists NUMBER :=0;
LoopNum NUMBER := 1;
ArtistName VARCHAR2(30);

BEGIN
SELECT COUNT(*) INTO NumArtists FROM Artist;

WHILE LoopNum != NumArtists + 1 LOOP
SELECT COUNT(*) INTO ArtistsFollowers FROM ArtistFollower WHERE ArtistID = LoopNum;
 IF ArtistsFollowers > MaxFollowers THEN 
 MaxFollowers := ArtistsFollowers;
 MaxArtistID := LoopNum;
 END IF;
LoopNum := LoopNum + 1;
END LOOP;

SELECT Name INTO ArtistName FROM Artist WHERE ArtistID = MaxArtistID;

DBMS_OUTPUT.PUT_LINE(ArtistName || ' has the highest number of followers of ' || 
MaxFollowers);
End

**Result:**
Michael Jackson has the highest number of followers of 3

----

**Scenario:** Display the tracks within a specified playlist with their genres, if available.

**SQL Command:**
SELECT PlaylistName, TrackName, GenreName 
FROM Playlist NATURAL JOIN PlaylistItem 
NATURAL JOIN Track 
LEFT OUTER JOIN Genre USING (GenreID) 
WHERE PlaylistID = 4;

**Result:**
| PlaylistName  | TrackName                 | GenreName |
|:-------------:|:-------------------------:|:---------:|
| Study Music   | Goodbye Yellow Brick Road | -         |
| Study Music   | Candle in the Wind        | -         |
| Study Music   | Bennie and the Jets       | -         |

---

**Scenario:** Display all content creators (artists & podcast creators) along with their details.

**SQL Command:**
SELECT * FROM Artist UNION SELECT * FROM PodcastCreator;

**Result:**
| ArtistID | Name                | Type  | StartDate    | EndDate      | Status   |
|:--------:|:-------------------:|:-----:|:------------:|:------------:|:--------:|
| 1        | EchoTalk            | Group | 01-Jan-2023  | -            | Active   |
| 1        | Michael Jackson     | Solo  | 01-May-1970  | 25-Jun-2009  | Inactive |
| 2        | SoloSound           | Solo  | 15-Jun-2022  | -            | Active   |
| 2        | The Beatles         | Group | 01-Aug-1960  | 10-Apr-1970  | Inactive |
| 3        | Beyoncé             | Solo  | 01-Jan-1997  | -            | Active   |
| 3        | PodSquad            | Group | 20-Sep-2023  | -            | Active   |
| 4        | Queen               | Group | 01-Jun-1970  | -            | Inactive |
| 5        | Elton John          | Solo  | -            | -            | Inactive |
| 6        | ABBA                | Group | 20-Oct-1972  | 31-Dec-1983  | Active   |
| 7        | Taylor Swift        | Solo  | 12-Sep-2004  | -            | Active   |
| 8        | The Rolling Stones  | Group | 01-Jul-1962  | -            | Active   |
