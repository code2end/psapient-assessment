### Auth Service

```
POST /auth/login
POST /auth/register
POST /auth/refresh
POST /auth/logout
POST /auth/password
GET /auth/me
```

### User Service

```
CRUD USERS, USER PREFERENCES

GET /users
GET /users/{id}
POST /users
PUT /users/{id}
DELETE /users/{id}
GET /users/{id}/preferences
POST /users/{id}/preferences
PUT /users/{id}/preferences/{id}
DELETE /users/{id}/preferences/{id}
GET /users/{id}/bookings
GET /users/{id}/notifications
```

### Movie Service

```

CRUD MOVIES, GENRES

GET /movies
GET /movies/{id}
POST /movies
PUT /movies/{id}
DELETE /movies/{id}
GET /genres
GET /genres/{id}
POST /genres
PUT /genres/{id}
DELETE /genres/{id}
GET /movies/{id}/showtimes?context={location, screen, partner, ratings, date}
```

### Booking Service

```
CRUD BOOKINGS, PAYMENTS

GET /bookings
GET /bookings/{id}
POST /bookings
PUT /bookings/{id}
DELETE /bookings/{id}
GET /bookings/{id}/payment
POST /bookings/{id}/payment
POST /bookings/{id}/cancel

--- This is called by payment gateway(external system)
POST /webhooks/payment-success
POST /webhooks/payment-failure
```

### Partner Service

```
BASE - /partner/*

R BOOKINGS, MOVIES, GENRES
CRUD THEATRE_PARTNERS, THEATRES, SCREENS, SEATS, SHOW_TIMES

Example APIs :

GET /partners?context={location, searchInput, screen, partner}
GET /partners/{id}
POST /partners
PUT /partners/{id}
DELETE /partners/{id}
GET /partners/{id}/theatres
POST /partners/{id}/theatres
PUT /partners/{id}/theatres/{id}
DELETE /partners/{id}/theatres/{id}
GET /partners/{id}/theatres/{id}/screens
POST /partners/{id}/theatres/{id}/screens
PUT /partners/{id}/theatres/{id}/screens/{id}
DELETE /partners/{id}/theatres/{id}/screens/{id}

--- This is exposed by partner service to register booking events, lock and unlock seat
POST /partners/{id}/webhooks

--- This is called by partner(external system)
POST /webhooks/lock-seat
POST /webhooks/unlock-seat
POST /webhooks/booking-success
```

### Admin Service

```
BASE - /admin/*

R BOOKINGS, PAYMENTS, USERS, THEATRE_PARTNERS, THEATRES, SCREENS, SEATS, SHOW_TIMES, USER_PREFERENCES, NOTIFICATIONS
CRUD USERS, MOVIES, GENRES, THEATRE_PARTNERS
```

### Search Service

```
GET /search?context={location, searchInput, genre, partner, ratings, date}
```
