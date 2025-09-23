--Creating Tables
CREATE TABLE TW_User (
UserID Number(6) CONSTRAINT user_pk PRIMARY KEY,
Username Varchar2(20) NOT NULL CONSTRAINT user_name_uni UNIQUE,
FirstName Varchar2(50) NOT NULL,
LastName Varchar2(50),
Gender Varchar2(11) DEFAULT 'Unavailable' NOT NULL CONSTRAINT user_gender_chk CHECK 
(Gender IN ('Male','Female','Unavailable')),
Email Varchar2(200) NOT NULL CONSTRAINT user_email_uni UNIQUE,
Birthdate Date NOT NULL,
AccStatus Varchar2(8) DEFAULT 'Active' NOT NULL CONSTRAINT user_accstat_chk CHECK 
(AccStatus IN ('Active','Inactive')),
JoinDate Date DEFAULT SYSDATE NOT NULL
);

CREATE TABLE Subscription (
 SubType Varchar2(6) CONSTRAINT sub_pk PRIMARY KEY,
 Price Number(4,2),
 PlaybackShuffle Varchar2(5) NOT NULL CONSTRAINT sub_playbackshuf_chk CHECK 
(PlaybackShuffle IN ('True','False')),
 EarlyAccess Varchar2(5) NOT NULL CONSTRAINT sub_earlyacc_chk CHECK (EarlyAccess IN 
('True','False')),
 OfflineAccess Varchar2(5) NOT NULL CONSTRAINT sub_offlineacc_chk CHECK (OfflineAccess 
IN ('True','False'))
);

CREATE TABLE SubscriptionOrder (
 OrderID Number(5) CONSTRAINT suborder_pk PRIMARY KEY,
 OrderDate Date DEFAULT SYSDATE NOT NULL,
 StartDate Date,
 ExpiryDate Date,
 PaymentMethod Varchar2(6) CONSTRAINT suborder_pm_chk CHECK (PaymentMethod IN 
('Master','Visa','GIRO')),
 Status Varchar2(9) NOT NULL CONSTRAINT suborder_stat_chk CHECK (Status IN 
('Paid','Pending','Cancelled')),
 SubType Varchar2(6) NOT NULL CONSTRAINT suborder_sub_fk REFERENCES 
Subscription(SubType),
 UserID Number(6) NOT NULL CONSTRAINT suborder_user_fk REFERENCES 
TW_User(UserID),
 CONSTRAINT suborder_sdate_chk CHECK ((Status = 'Paid' AND StartDate IS NOT NULL) OR 
(Status != 'Paid' AND StartDate IS NULL))
);

CREATE TRIGGER set_suborder_expdate
BEFORE INSERT ON SubscriptionOrder FOR EACH ROW
BEGIN
IF :NEW.StartDate IS NOT NULL THEN
 :NEW.ExpiryDate := ADD_MONTHS(:NEW.StartDate, 12);
 END IF;
END;
/
  
CREATE TABLE Artist (
 ArtistID Number(4) CONSTRAINT artist_pk PRIMARY KEY,
 Name Varchar2(50) NOT NULL,
 Type Varchar2(5) CONSTRAINT artist_type_chk CHECK (Type IN ('Solo','Group')),
 StartDate Date,
 EndDate Date,
 Status Varchar2(8) CONSTRAINT artist_stat_chk CHECK (Status IN ('Active','Inactive'))
);

CREATE TABLE ArtistFollower (
 AFollowerID Number(5) CONSTRAINT artistf_pk PRIMARY KEY,
 FollowDate Date DEFAULT SYSDATE NOT NULL,
 ArtistID Number(4) NOT NULL CONSTRAINT artistf_artist_fk REFERENCES Artist(ArtistID),
 UserID Number(6) NOT NULL CONSTRAINT artistf_user_fk REFERENCES TW_User(UserID)
);

CREATE TABLE Genre (
 GenreID Number(2) CONSTRAINT genre_pk PRIMARY KEY,
 GenreName Varchar2(20) NOT NULL CONSTRAINT genre_name_chk CHECK (GenreName 
LIKE 'P_%' OR GenreName LIKE 'M_%')
);

CREATE TABLE Album (
 AlbumID Number(3) CONSTRAINT album_pk PRIMARY KEY,
 AlbumName Varchar2(100) NOT NULL,
 ReleaseDate Date,
 GenreID Number(2) CONSTRAINT album_genre_fk REFERENCES Genre(GenreID),
 ArtistID Number(4) NOT NULL CONSTRAINT album_artist_fk REFERENCES Artist(ArtistID)
);

CREATE TABLE Track (
 TrackID Number(6) CONSTRAINT track_pk PRIMARY KEY,
 TrackName Varchar2(50) NOT NULL,
 ReleaseDate Date,
 GenreID Number(2) CONSTRAINT track_genre_fk REFERENCES Genre(GenreID),
 AlbumID Number(3) CONSTRAINT track_album_fk REFERENCES Album(AlbumID),
 ArtistID Number(4) NOT NULL CONSTRAINT track_artist_fk REFERENCES Artist(ArtistID)
);

CREATE TABLE UserFavourites (
 FaveTrackID Number(6) CONSTRAINT userfave_pk PRIMARY KEY,
 DateAdded Date DEFAULT SYSDATE NOT NULL,
 UserID Number(6) NOT NULL CONSTRAINT userfave_user_fk REFERENCES TW_User(UserID),
 TrackID Number(6) NOT NULL CONSTRAINT userfave_track_fk REFERENCES Track(TrackID)
);

CREATE TABLE Playlist (
 PlaylistID Number(5) CONSTRAINT playlist_pk PRIMARY KEY,
 PlaylistName Varchar2(100) NOT NULL,
 Visibility Varchar2(7) NOT NULL CONSTRAINT playlist_vis_chk CHECK (Visibility IN 
('Private','Public')),
 CreatorID Number(6) NOT NULL CONSTRAINT playlist_user_fk REFERENCES 
TW_User(UserID)
);

CREATE TRIGGER set_playlist_name
BEFORE INSERT ON Playlist FOR EACH ROW
BEGIN
 IF :NEW.PlaylistName IS NULL THEN
 :NEW.PlaylistName := 'Playlist#' || :NEW.PlaylistID;
 END IF;
END;
/
  
CREATE TABLE PlaylistItem (
 ItemID Number(6) CONSTRAINT PLitem_pk PRIMARY KEY,
 DateAdded Date DEFAULT SYSDATE NOT NULL,
 PlaylistID Number(5) NOT NULL CONSTRAINT PLitem_playlist_fk REFERENCES 
Playlist(PlaylistID),
 TrackID Number(6) NOT NULL CONSTRAINT PLitem_track_fk REFERENCES Track(TrackID)
);

CREATE TABLE PlaylistFollower (
 PLFollowerID Number(6) CONSTRAINT PLFollower_pk PRIMARY KEY,
 FollowDate Date DEFAULT SYSDATE NOT NULL,
 PlaylistID Number(5) NOT NULL CONSTRAINT PLfollower_playlist_fk REFERENCES 
Playlist(PlaylistID),
 UserID Number(6) NOT NULL CONSTRAINT PLfollower_user_fk REFERENCES 
TW_User(UserID)
);

CREATE TABLE PodcastCreator (
 CreatorID Number(4) CONSTRAINT podcreator_pk PRIMARY KEY,
 CreatorName Varchar2(50) NOT NULL,
 Type Varchar2(5) CONSTRAINT podcreator_type_chk CHECK (Type IN ('Solo','Group')),
 StartDate Date NOT NULL,
 EndDate Date,
 Status Varchar2(8) CONSTRAINT podcreator_stat_chk CHECK (Status IN ('Active','Inactive'))
);

CREATE TABLE Podcast (
 PodcastID Number(3) CONSTRAINT podcast_pk PRIMARY KEY,
 PodcastName Varchar2(75) NOT NULL,
 StartDate Date NOT NULL,
 EndDate Date,
 GenreID Number(2) CONSTRAINT podcast_genre_fk REFERENCES Genre(GenreID),
 CreatorID Number(4) NOT NULL CONSTRAINT podcast_podcreator_fk REFERENCES 
PodcastCreator(CreatorID)
);

CREATE TABLE PodcastEpisode (
 EpisodeID Number(5) CONSTRAINT podepi_pk PRIMARY KEY,
 EpisodeName Varchar2(30) NOT NULL,
 ReleaseDate Date,
 PodcastID Number(3) NOT NULL CONSTRAINT podepi_pod_fk REFERENCES 
Podcast(PodcastID)
);

CREATE TABLE PodcastCreatorFollower (
 PCFollowerID Number(6) CONSTRAINT podcfollower_pk PRIMARY KEY,
 FollowDate Date DEFAULT SYSDATE NOT NULL,
 CreatorID Number(4) NOT NULL CONSTRAINT podcfollower_podc_fk REFERENCES 
PodcastCreator(CreatorID),
 UserID Number(6) NOT NULL CONSTRAINT podcfollower_user_fk REFERENCES 
TW_User(UserID)
);

CREATE TABLE PodcastFollower (
 PodFollowerID Number(6) CONSTRAINT podfollower_pk PRIMARY KEY,
 FollowDate Date DEFAULT SYSDATE NOT NULL,
 PodcastID Number(3) NOT NULL CONSTRAINT podfollower_pod_fk REFERENCES 
Podcast(PodcastID),
 UserID Number(6) NOT NULL CONSTRAINT podfollower_user_fk REFERENCES 
TW_User(UserID)
);

--Creating Sequences
CREATE SEQUENCE TW_user_userid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE suborder_orderid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE artist_artistID 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE artistfollower_AFollowerid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE genre_genreid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE album_albumid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE track_trackid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE userfave_favetrackid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE pl_playlistid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE plitem_itemid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE plfollower_plfollowerid 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE podcreator_creatorid
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE pod_podcastid
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE podepi_episodeid
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE podcfollower_followerid
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE podfollower_followerid
START WITH 1
INCREMENT BY 1
NOCACHE;

--Adding in Unique Constraints
ALTER TABLE Artist ADD CONSTRAINT artist_name_uni UNIQUE(Name);

ALTER TABLE ArtistFollower ADD CONSTRAINT artistfollower_uni UNIQUE (ArtistID,UserID);

ALTER TABLE Album ADD CONSTRAINT album_uni UNIQUE(AlbumName,ArtistID);

ALTER TABLE Track ADD CONSTRAINT track_uni UNIQUE(TrackName,ArtistID);

ALTER TABLE UserFavourites ADD CONSTRAINT userfave_uni UNIQUE (UserID,TrackID);

ALTER TABLE PlaylistItem ADD CONSTRAINT PLitem_uni UNIQUE(PlaylistID,TrackID);

ALTER TABLE PlaylistFollower ADD CONSTRAINT PLfollower_uni UNIQUE (PlaylistID,UserID);

ALTER TABLE PodcastCreator ADD CONSTRAINT podcreator_uni UNIQUE(CreatorName);

ALTER TABLE Podcast ADD CONSTRAINT pod_unique UNIQUE(PodcastName,CreatorID);

ALTER TABLE PodcastEpisode ADD CONSTRAINT podepi_uni UNIQUE 
(EpisodeName,PodcastID);

ALTER TABLE PodcastCreatorFollower ADD CONSTRAINT podcfollower_uni UNIQUE 
(CreatorID,UserID);

ALTER TABLE PodcastFollower ADD CONSTRAINT podfollower_uni UNIQUE (PodcastID,UserID);
