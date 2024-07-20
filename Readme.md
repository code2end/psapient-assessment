### Assumption

- Theatre Partners will be doing offline bookings that needs to be updated with the online system

- All dates and time to remain in UTC and conversions to LocalDateTime for internationalization.

### Notes :

- Auth and session tables are not included in the ER-model as auth will be managed by API Gateway

- Auditing tables are not included here, can be done via asynchronous event system like kafka or using internal libraries like envers.

- Localization and Internationalization has been added for discussion in non-functional discussion and have not been considered in the main architecture.

- Leaving offers, comments and reviews for movies as it will add complexity to the system. Movies will be displayed based on user preferences and movie ratings.

- Pre calculated data contains the movies and theaters based on pre-registered user preferences like location, genre, rating, theatre preference etc.

- Graph data pipeline is omitted here for simplicity, we can create a user graph database which can store precalculated nested data for user including feed, notifications, comments and reviews/emotions.

- DGS (GraphQL service) can also be used to address multiple internal service calls.

- Inventory Synchronization would be required with the theatres periodically.

- MFA or Pass key authentication is not included in this for simplicity.

### Declaration

- I have used Chat-GPT 3.5 for boiler-plating.
