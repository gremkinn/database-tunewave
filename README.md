# TuneWave: Online Music & Podcast Streaming
TuneWave is an upcoming (fictional) online music & podcast streaming platform. The company behind it, has tasked us to design their database to support all their 
operations.

These are the company’s business rules:

• To access TuneWave, users must register an account by providing some basic information. 

• Users will have a free account by default, with limited features and they can purchase one of the available subscription plans to access much more.

• Each subscription tier unlocks an additional feature. The first tier includes a shuffle option. The second tier includes early access to newly released tracks & podcasts. The third tier offers users the option to download tracks and access them offline. 

• Each subscription will expire a year after its purchase.  

• Users can only use certain payment methods to purchase subscriptions. 

• All users are allowed to save their favourite tracks in a “Liked Tracks” playlist, which is only visible to them. 

• Users can create public or private customised playlists with any number of 
tracks. 

• Users can choose to follow public playlists and artists, so that they receive 
notifications when there is an update. 

• Music will be categorized according to the artist, album, and track name in 
the platform.  

• The platform will also offer podcasts. A podcast must have at least one 
episode & a podcast creator must have a podcast. 

• Users can choose to follow podcast creators or a podcast to receive 
notifications when there are updates. 

• Tracks & podcast may be classified by their genres if available. 

## Entities

<table cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">User</td>
    <td align="center">User Favourite Item</td>
    <td align="center">Subscription</td>
    <td align="center">Subscription Order</td>
    <td align="center">Artist</td>
    <td align="center">Artist's Follower</td>
  </tr>
  <tr>
    <td align="center">Album</td>
    <td align="center">Track</td>
    <td align="center">Playlist</td>
    <td align="center">Playlist Follower</td>
    <td align="center">Playlist Item</td>
    <td align="center">Podcast</td>
  </tr>
  <tr>
    <td align="center">Podcast Episode</td>
    <td align="center">Podcast Creator</td>
    <td align="center">Podcast Creator Follower</td>
    <td align="center">Podcast Follower</td>
    <td align="center"> Genre</td>
  </tr>
</table>

## Entity Relationship Diagram

![Entity Relationship Diagram](documentation/ERD.png)

## Database Table Definitions

#### Table: TW_User

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| UserID | Primary Key | - | Number | 6 |
| Username | Not Null, Unique | - | Varchar2 | 20 |
| FirstName | Not Null | - | Varchar2 | 50 |
| LastName | - | - | Varchar2 | 50 |
| Gender | Not Null, Check (Male, Female, or Unavailable) | Unavailable | Varchar2 | 11 |
| Email | Not Null, Unique | - | Varchar2 | 200 |
| Birthdate | Not Null | - | Date | - |
| AccStatus | Not Null, Check (Active, Inactive) | Active | Varchar2 | 8 |
| JoinDate | Not Null | SYSDATE | Date | - |

#### Table: Subscription

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| SubType | Primary Key | - | Varchar2 | 6 |
| Price | - | - | Number | 4,2 |
| PlaybackShuffle | Check (True or False), Not Null | - | Varchar2 | 5 |
| EarlyAccess | Check (True or False), Not Null | - | Varchar2 | 5 |
| OfflineAccess | Check (True or False), Not Null | - | Varchar2 | 5 |

#### Table: SubscriptionOrder

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| OrderID | Primary Key | - | Number | 5 |
| OrderDate | Not Null | SYSDATE | Date | - |
| StartDate | Check ((Status = 'Paid' AND StartDate IS NOT NULL) OR (Status != 'Paid' AND StartDate IS | - | ADD_MONTHS(StartDate,12) | Date | - |
| PaymentMethod | Check (Master, Visa, GIRO) | - | Varchar2  | 6 |
| Status | Check (Paid, Pending, Cancelled), Not Null | - | Varchar2 | 9 |
| SubType | Not Null, Foreign Key to Subscription table | - | Varchar2  | 6 |
| UserID | Not Null, Foreign Key to TW_User table | - | Number | 6 |

#### Table: Artist

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| ArtistID | Primary Key | - | Number | 4 |
| Name | Not Null, Unique | - | Varchar2 | 50 |
| Type | Check (Solo or Group) | - | Varchar2 | 5 |
| StartDate | - | - | Date | - |
| EndDate | - | - | Date | - |
| Status  | Check (Active, Inactive) | - | Varchar2 | 8 |

#### Table: ArtistFollower

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| AFollowerID | Primary Key | - | Number | 5 |
| FollowDate | Not Null | SYSDATE | Date | - |
| ArtistID | Not Null, Foreign Key to Artist table, Unique with UserID | - | Number | 4 |
| UserID | Not Null, Foreign Key to TW_User table, Unique with ArtistID | - | Number | 6 |

#### Table: Genre

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| GenreID | Primary Key | - | Number | 2 |
| GenreName | Not Null, Check (Like "P_%" or "M_%") | - | Varchar2 | 20 |

#### Table: Album

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| AlbumID | Primary Key | - | Number | 3 |
| AlbumName | Not Null, Unique with ArtistID | - | Varchar2 | 100 |
| ReleaseDate | - | - | Date | - |
| GenreID | Foreign Key to Genre table | - | Number | 2 |
| ArtistID | Not Null, Foreign Key to Artist table, Unique with AlbumName | - | Number | 4 |

#### Table: Track

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| TrackID | Primary Key | - | Number | 6 |
| TrackName | Not Null, Unique with ArtistID | - | Varchar2 | 50 |
| ReleaseDate | - | - | Date | - |
| GenreID | Foreign Key to Genre table | - | Number | 2 |
| AlbumID | Foreign Key to Album table | - | Number | 3 |
| ArtistID | Not Null, Foreign Key to Artist table, Unique with TrackName | - | Number | 4 |

#### Table: UserFavourites

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| FaveTrackID | Primary Key | - | Number | 6 |
| DateAdded | Not Null | SYSDATE | Date | - |
| UserID | Not Null, Foreign Key to TW_User table, Unique with TrackID | - | Number | 6 |
| TrackID | Not Null, Foreign Key to Track table, Unique with UserID | - | Number | 6 |

#### Table: Playlist

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| PlaylistID | Primary Key | - | Number | 5 |
| PlaylistName | Not Null | "Playlist#" || PlaylistID | Varchar2 | 100 |
| Visibility | Not Null, Check (Private or Public) | - | Varchar2 | 7 |
| CreatorID | Not Null, Foreign Key to TW_User table | - | Number | 6 |

#### Table: PlaylistItem

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| ItemID | Primary Key | - | Number | 6 |
| DateAdded | Not Null | SYSDATE | Date | - |
| PlaylistID | Not Null, Foreign Key to Playlist table, Unique with TrackID | - | Number    | 5 |
| TrackID | Not Null, Foreign Key to Track table, Unique with PlaylistID | - | Number | 6 |

#### Table: PlaylistFollower

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| PLFollowerID | Primary Key | - | Number | 6 |
| FollowDate | Not Null | SYSDATE | Date | - |
| PlaylistID | Not Null, Foreign Key to Playlist table, Unique with UserID | - | Number | 5 |
| UserID | Not Null, Foreign Key to TW_User table, Unique with PlaylistID | - | Number | 6 |

#### Table: PodcastCreator

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| CreatorID | Primary Key | - | Number | 4 |
| CreatorName | Not Null, Unique | - | Varchar2 | 50 |
| Type | Check (Solo or Group) | - | Varchar2 | 5 |
| StartDate | Not Null | - | Date | - |
| EndDate | - | - | Date | - |
| Status | Check (Active, Inactive) | - | Varchar2 | 8 |

#### Table: Podcast

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| PodcastID | Primary Key | - | Number | 3 |
| PodcastName | Not Null, Unique with CreatorID | - | Varchar2 | 75 |
| StartDate | Not Null | - | Date | - |
| EndDate | - | - | Date | - |
| GenreID | Foreign Key to Genre table | - | Number | 2 |
| CreatorID | Not Null, Foreign Key to PodcastCreator table, Unique with PodcastName | - | Number | 4 |

#### Table: PodcastEpisode

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| EpisodeID | Primary Key | - | Number | 5 |
| EpisodeName | Not Null, Unique with PodcastID | - | Varchar2 | 30 |
| ReleaseDate | - | - | Date | - |
| PodcastID | Not Null, Foreign Key to Podcast table, Unique with EpisodeName | - | Number | 3 |

#### Table: PodcastCreatorFollower

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| PCFollowerID | Primary Key | - | Number | 6 |
| FollowDate | Not Null | SYSDATE | Date | - |
| CreatorID | Not Null, Foreign Key to PodcastCreator table | - | Number | 4 |
| UserID | Not Null, Foreign Key to TW_User table, Unique with CreatorID | - | Number | 6 |

#### Table: PodcastFollower

| Column Name | Constraints | Default Value | Data Type | Length |
|:---------:|:--------:|:---------:|:--------:|:---------:|
| PodFollowerID | Primary Key | - | Number | 6 |
| FollowDate | Not Null | SYSDATE | Date | - |
| PodcastID | Not Null, Foreign Key to Podcast table, Unique with UserID | - | Number | 3 |
| UserID  | Not Null, Foreign Key to TW_User table, Unique with PodcastID | - | Number | - |

## Data for Tables

#### Table: TW_User
#### Table: Subscription
#### Table: SubscriptionOrder
#### Table: Artist
#### Table: ArtistFollower
#### Table: Genre
#### Table: Album
#### Table: Track
#### Table: UserFavourites
#### Table: Playlist
#### Table: PlaylistItem
#### Table: PlaylistFollower
#### Table: PodcastCreator
#### Table: Podcast
#### Table: PodcastEpisode
#### Table: PodcastCreatorFollower
#### Table: PodcastFollower


