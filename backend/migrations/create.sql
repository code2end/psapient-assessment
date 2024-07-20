-- Relationships
-- Users can make multiple Bookings.
-- TheatrePartners can manage multiple Theatres.
-- Each Theatre can have multiple Screens.
-- Each Screen can have multiple Seats.
-- Movies can have multiple Showtimes in different Screens.
-- Each Booking is associated with a User and a Showtime.
-- Each Payment is associated with a Booking.
-- Notifications can be sent to Users.

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20),
    EmailVerified Boolean,
    PhoneVerified Boolean,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE UserPreferences (
    PreferenceID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    GenreID INT,
    PreferredLocationID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PreferredLocationID) REFERENCES Locations(LocationID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE TheatrePartners (
    PartnerID INT PRIMARY KEY AUTO_INCREMENT,
    PartnerName VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    ContactEmail VARCHAR(255) NOT NULL UNIQUE,
    ContactPhone VARCHAR(20),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100),
    Country VARCHAR(100),
    ZipCode VARCHAR(20)
);

CREATE TABLE Theatres (
    TheatreID INT PRIMARY KEY AUTO_INCREMENT,
    PartnerID INT,
    TheatreName VARCHAR(255) NOT NULL,
    LocationID INT,
    FOREIGN KEY (PartnerID) REFERENCES TheatrePartners(PartnerID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Screens (
    ScreenID INT PRIMARY KEY AUTO_INCREMENT,
    TheatreID INT,
    ScreenName VARCHAR(255) NOT NULL,
    TotalSeats INT NOT NULL,
    FOREIGN KEY (TheatreID) REFERENCES Theatres(TheatreID)
);

CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    ScreenID INT,
    SeatNumber VARCHAR(10) NOT NULL,
    SeatType ENUM('Regular', 'Premium') NOT NULL,
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);

CREATE TABLE SeatAvailability (
    SeatAvailabilityID INT PRIMARY KEY AUTO_INCREMENT,
    ShowtimeID INT,
    SeatID INT,
    SeatStatus ENUM('Booked', 'Available', 'Locked', 'Unavailable') NOT NULL,
    FOREIGN KEY (ShowtimeID) REFERENCES Showtimes(ShowtimeID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID),
    UNIQUE (ShowtimeID, SeatID)
);

CREATE TABLE Genres (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    GenreID INT,
    Duration INT,  -- Duration in minutes
    ReleaseDate DATE,
    Language VARCHAR(50),
    Rating DECIMAL(3, 1),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Showtimes (
    ShowtimeID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    ScreenID INT,
    ShowDate DATE NOT NULL,
    ShowTime TIME NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ShowtimeID INT,
    SeatID INT,
    ScreenID INT,
    TheatreID INT,
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    BookingStatus ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ShowtimeID) REFERENCES Showtimes(ShowtimeID)
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID)
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
    FOREIGN KEY (TheatreID) REFERENCES Theatres(TheatreID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod ENUM('CreditCard', 'DebitCard', 'PayPal', 'Other') NOT NULL,
    PaymentStatus ENUM('Success', 'Failed') NOT NULL,
    TransactionID VARCHAR(255),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Message TEXT NOT NULL,
    Status VARCHAR(20) NOT NULL, 
    SentAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    NotificationType ENUM('Email', 'SMS', 'APP') NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


---- Prompt

-- Create an ER Model of online movie booking system having tables 
-- users, user_preferences, movies, genres, showtimes, screens, seats,
--  theatres, theatre_partners, bookings, payments, locations, notifications 
