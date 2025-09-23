--Table: TW_User
INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'skywalker85', 'John', 'Doe', 'Male', 'john.doe@example.com', 
'15-MAR-1985', 'Active', '15-JAN-2024');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'sunnydays90', 'Anna', NULL, 'Female', 
'anna.smith@example.com','22-JUL-1990','Active','10-FEB-2024');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'nightowl78', 'Robert', 'Jones', 'Unavailable', 
'robert.jones@example.com', '30-NOV-1978', 'Inactive', '30-NOV-2023');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'starrysky82', 'Maria', 'Davis', 'Female', 
'maria.davis@example.com', '25-JAN-1982', 'Active', '05-MAR-2024');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'coolcat92', 'Juan', 'Garcia', 'Unavailable', 
'juan.garcia@example.com', '14-MAY-1992', 'Active', '20-MAY-2024');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'moondancer89', 'Emily', 'Wilson', 'Female', 
'emily.wilson@example.com', '09-AUG-1989', 'Active', '18-JUN-2024');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'thunderbird75', 'Thomas', 'Wales', 'Male', 
'thomassq@example.com', '17-DEC-1975', 'Active', '01-DEC-2023');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'rainbow94', 'Megan', 'Johnson', 'Female', 
'megan.johnson@example.com', '21-MAR-1994', 'Active', '12-MAR-2023');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'oceanwaves83', 'William', NULL, 'Male', 
'william.lopez@example.com', '04-JUN-1983', 'Active', '28-FEB-2024');

INSERT INTO TW_User 
(UserID,Username,FirstName,LastName,Gender,Email,Birthdate,AccStatus,JoinDate)
VALUES (TW_user_userid.nextval,'stargazer96', 'Nina', 'Khan', 'Unavailable', 
'nina.khan@example.com', '10-SEP-1996', 'Active', '09-JUL-2023');

--Table: Subscription
INSERT ALL
INTO Subscription (Subtype,Price,PlaybackShuffle,EarlyAccess,OfflineAccess)
VALUES('Free',NULL,'False','False','False')
INTO Subscription (Subtype,Price,PlaybackShuffle,EarlyAccess,OfflineAccess)
VALUES('Bronze',5.98,'True','False','False')
INTO Subscription (Subtype,Price,PlaybackShuffle,EarlyAccess,OfflineAccess)
VALUES('Silver',8.98,'True','True','False')
INTO Subscription (Subtype,Price,PlaybackShuffle,EarlyAccess,OfflineAccess)
VALUES('Gold',12.98,'True','True','True')
SELECT * FROM dual;

--Table: SubscriptionOrder
INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'10-JAN-2024', '15-JAN-2024', '15-JAN-2025', 'Visa', 'Paid', 
'Bronze', 7);

INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'05-FEB-2024', '10-FEB-2024', '10-FEB-2025', 'Master', 'Paid', 
'Gold', 8);

INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'15-MAR-2024',NULL,NULL,NULL, 'Cancelled', 'Silver', 4);

INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'20-APR-2024',NULL,NULL,NULL, 'Pending', 'Silver', 10);

INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'08-MAY-2024', '08-MAY-2024', '08-MAY-2025', 'Master', 
'Paid', 'Gold', 5);

INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'25-JUN-2024', '26-JUN-2024', '26-JUN-2025', 'GIRO', 'Paid', 
'Silver', 4);

INSERT INTO SubscriptionOrder 
(OrderID,OrderDate,StartDate,ExpiryDate,PaymentMethod,Status,SubType,UserID)
VALUES (suborder_orderid.nextval,'12-JUL-2024',NULL,NULL,NULL, 'Pending', 'Bronze', 6);

--Table: Artist
INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'Michael Jackson', 'Solo', '01-MAY-1970', '25-JUN-2009', 
'Inactive');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'The Beatles', 'Group', '01-AUG-1960', '10-APR-1970', 'Inactive');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'Beyoncé', 'Solo', '01-JAN-1997', NULL, 'Active');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'Queen', 'Group', '01-JUN-1970', NULL, 'Inactive');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'Elton John', 'Solo', NULL, NULL, 'Inactive');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'ABBA', 'Group', '20-OCT-1972', '31-DEC-1983', 'Active');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'Taylor Swift', 'Solo', '12-SEP-2004', NULL, 'Active');

INSERT INTO Artist(ArtistID, Name, Type, StartDate, EndDate, Status)
VALUES(artist_artistID.nextval,'The Rolling Stones', 'Group', '01-JUL-1962', NULL, 'Active');

--Table: ArtistFollower
INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'25-SEP-2024', 4, 5);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'18-AUG-2023', 8, 10);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'20-JUL-2024', 3, 7);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'14-JUN-2023', 1, 8);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'30-MAY-2024', 2, 5);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'02-APR-2024', 6, 3);

INSERT INTO ArtistFOllower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'15-MAR-2024', 7, 9);

INSERT INTO ArtistFOllower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'28-FEB-2024', 5, 2);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'10-JUL-2024', 4, 6);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'05-FEB-2024', 8, 1);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'20-JUN-2024', 3, 4);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'22-OCT-2023', 1, 10);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'18-SEP-2024', 2, 3);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'30-AUG-2024', 6, 7);

INSERT INTO ArtistFollower(AFollowerID, FollowDate, ArtistID, UserID)
VALUES(artistfollower_AFollowerid.nextval,'25-JUL-2023', 7, 8);

--Table: Genre
INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'M_Rock');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'M_Pop');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'M_Jazz');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'M_Blues');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'M_HipHop');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'M_Electronic');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'P_Tech');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'P_TrueCrime');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'P_Health');

INSERT INTO Genre (GenreID, GenreName) VALUES (genre_genreid.nextval, 'P_History');

--Table: Album
INSERT INTO Album (AlbumID, AlbumName, ReleaseDate, GenreID, ArtistID)
VALUES (album_albumid.nextval, 'Off the Wall', '10-AUG-1979', 2, 1);

INSERT INTO Album (AlbumID, AlbumName, ReleaseDate, GenreID, ArtistID)
VALUES (album_albumid.nextval, 'Abbey Road', '26-SEP-1969', 1, 2);

INSERT INTO Album (AlbumID, AlbumName, ReleaseDate, GenreID, ArtistID)
VALUES (album_albumid.nextval, '1989', '27-OCT-2014', 2, 7);

INSERT INTO Album (AlbumID, AlbumName, ReleaseDate, GenreID, ArtistID)
VALUES (album_albumid.nextval, 'Goodbye Yellow Brick Road', NULL, NULL, 5);

--Table: Track
INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Don''t Stop ''Til You Get Enough', '10-AUG-1979', 2, 1, 1);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Rock with You', '10-AUG-1979', 2, 1, 1);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Off the Wall', '10-AUG-1979', 2, 1, 1);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Come Together', '26-SEP-1969', 1, 2, 2);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Something', '26-SEP-1969', 1, 2, 2);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Here Comes the Sun', '26-SEP-1969', 1, 2, 2);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Shake It Off', '27-OCT-2014', 2, 3, 7);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Blank Space', '27-OCT-2014', 2, 3, 7);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Style', '27-OCT-2014', 2, 3, 7);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Goodbye Yellow Brick Road', NULL, NULL, 4, 5);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Candle in the Wind', NULL, NULL, 4, 5);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Bennie and the Jets', NULL, NULL, 4, 5);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Billie Jean', '01-JAN-1983', 2, NULL, 1);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Hey Jude', NULL, 2, NULL, 2);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Love Story', '12-SEP-2008', 3, NULL, 7);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Bohemian Rhapsody', '31-OCT-1975', 4, NULL, 4);

INSERT INTO Track (TrackID, TrackName, ReleaseDate, GenreID, AlbumID, ArtistID)
VALUES (track_trackid.nextval, 'Single Ladies', '13-OCT-2008', 5, NULL, 3);

--Table: UserFavourites
INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '20-JAN-2024', 1, 1);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '15-FEB-2024', 2, 6);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '01-DEC-2023', 3, 9);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '20-MAR-2024', 4, 12);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '30-MAY-2024', 5, 15);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '25-JUN-2024', 6, 3);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '10-DEC-2023', 7, 8);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '25-MAR-2023', 8, 5);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '10-AUG-2023', 9, 11);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '30-JUL-2023', 10, 14);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '28-FEB-2024', 1, 4);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '10-MAR-2024', 2, 7);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '05-JAN-2024', 3, 2);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '15-APR-2024', 4, 10);

INSERT INTO UserFavourites (FaveTrackID, DateAdded, UserID, TrackID)
VALUES (userfave_favetrackid.nextval, '20-JUN-2024', 5, 13);

--Table: Playlist
INSERT INTO Playlist (PlaylistID, PlaylistName, Visibility, CreatorID)
VALUES (pl_playlistid.nextval, 'Summer Hits', 'Public', 1);

INSERT INTO Playlist (PlaylistID, PlaylistName, Visibility, CreatorID)
VALUES (pl_playlistid.nextval, 'Chill Vibes', 'Private', 2);

INSERT INTO Playlist (PlaylistID, PlaylistName, Visibility, CreatorID)
VALUES (pl_playlistid.nextval, NULL, 'Public', 5);

INSERT INTO Playlist (PlaylistID, PlaylistName, Visibility, CreatorID)
VALUES (pl_playlistid.nextval, 'Study Music', 'Private', 6);

--Table: PlaylistItem
INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '15-JAN-2024', 1, 1);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '10-FEB-2024', 1, 2);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '20-MAY-2024', 1, 3);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '15-FEB-2024', 2, 4);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '01-MAR-2024', 2, 5);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '27-OCT-2024', 3, 7);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '27-OCT-2024', 3, 8);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '27-OCT-2024', 3, 9);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '05-JUL-2024', 4, 10);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '05-JUL-2024', 4, 11);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '12-SEP-2024', 4, 12);

INSERT INTO PlaylistItem (ItemID, DateAdded, PlaylistID, TrackID)
VALUES (plitem_itemid.nextval, '10-MAR-2024', 1, 6);

--Table: PlaylistFollower
INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '01-MAR-2024', 1, 2);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '05-APR-2024', 2, 3);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '10-MAY-2024', 3, 4);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '15-JUN-2024', 4, 5);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '20-JUN-2024', 2, 6);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '25-FEB-2024', 1, 7);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '01-JUL-2024', 4, 8);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '12-JUN-2024', 3, 9);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '02-MAY-2024', 1, 10);

INSERT INTO PlaylistFollower (PLFollowerID, FollowDate, PlaylistID, UserID)
VALUES (plfollower_plfollowerid.nextval, '10-APR-2024', 3, 1);

--Table: PodcastCreator
INSERT INTO PodcastCreator (CreatorID, CreatorName, Type, StartDate, EndDate, Status)
VALUES (podcreator_creatorid.nextval, 'EchoTalk', 'Group', '01-JAN-2023', NULL, 'Active');

INSERT INTO PodcastCreator (CreatorID, CreatorName, Type, StartDate, EndDate, Status)
VALUES (podcreator_creatorid.nextval, 'SoloSound', 'Solo', '15-JUN-2022', NULL, 'Active');

INSERT INTO PodcastCreator (CreatorID, CreatorName, Type, StartDate, EndDate, Status)
VALUES (podcreator_creatorid.nextval, 'PodSquad', 'Group', '20-SEP-2023', NULL, 'Active');

--Table: Podcast
INSERT INTO Podcast (PodcastID, PodcastName, StartDate, EndDate, GenreID, CreatorID)
VALUES (pod_podcastid.nextval, 'TechTalk', '01-FEB-2023', NULL, 7, 1);

INSERT INTO Podcast (PodcastID, PodcastName, StartDate, EndDate, GenreID, CreatorID)
VALUES (pod_podcastid.nextval, 'True Crime Chronicles', '01-JUL-2022', '30-JUN-2023', 8, 2);

INSERT INTO Podcast (PodcastID, PodcastName, StartDate, EndDate, GenreID, CreatorID)
VALUES (pod_podcastid.nextval, 'Health Insights', '01-OCT-2023', NULL, 9, 3);

INSERT INTO Podcast (PodcastID, PodcastName, StartDate, EndDate, GenreID, CreatorID)
VALUES (pod_podcastid.nextval, 'History Uncovered', '01-JAN-2024', NULL, 10, 2);

--Table: PodcastEpisode
INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Emerging Technologies', '01-FEB-2023', 1);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Future of AI', '15-FEB-2023', 1);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Blockchain Revolution', '01-MAR-2023', 1);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'The Cold Case Files', '01-JUL-2022', 2);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Murder Mysteries: Unsolved', '15-JUL-2022', 2);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Wellness and Mental Health', '01-OCT-2023', 3);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Nutrition and Diet Myths', '15-OCT-2023', 3);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Fitness Trends', '01-NOV-2023', 3);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'Ancient Civilizations', '01-JAN-2024', 4);

INSERT INTO PodcastEpisode (EpisodeID, EpisodeName, ReleaseDate, PodcastID)
VALUES (podepi_episodeid.nextval, 'World Wars in Perspective', '15-JAN-2024', 4);

--Table: PodcastCreatorFollower
INSERT INTO PodcastCreatorFollower (PCFollowerID, FollowDate, CreatorID, UserID)
VALUES (podcfollower_followerid.nextval, '01-MAR-2024', 1, 1);

INSERT INTO PodcastCreatorFollower (PCFollowerID, FollowDate, CreatorID, UserID)
VALUES (podcfollower_followerid.nextval, '10-FEB-2024', 2, 2);

INSERT INTO PodcastCreatorFollower (PCFollowerID, FollowDate, CreatorID, UserID)
VALUES (podcfollower_followerid.nextval, '01-DEC-2023', 3, 3);

INSERT INTO PodcastCreatorFollower (PCFollowerID, FollowDate, CreatorID, UserID)
VALUES (podcfollower_followerid.nextval, '05-APR-2024', 1, 4);

INSERT INTO PodcastCreatorFollower (PCFollowerID, FollowDate, CreatorID, UserID)
VALUES (podcfollower_followerid.nextval, '20-MAY-2024', 2, 5);

INSERT INTO PodcastCreatorFollower (PCFollowerID, FollowDate, CreatorID, UserID)
VALUES (podcfollower_followerid.nextval, '15-JUL-2024', 3, 6);

--Table: PodcastFollower
INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '25-MAR-2024', 1, 3);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '01-JUN-2024', 2, 5);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '10-MAR-2024', 3, 2);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '20-JUN-2024', 1, 6);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '01-MAY-2024', 2, 1);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '10-JUL-2024', 4, 4);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '02-APR-2024', 1, 8);

INSERT INTO PodcastFollower (PodFollowerID, FollowDate, PodcastID, UserID)
VALUES (podfollower_followerid.nextval, '10-MAR-2024', 4, 7)
