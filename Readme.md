### Assumption

- Theatre Partners will be doing offline bookings that needs to be updated with the online system

### Notes :

- Auth and session tables are not included in the ER-model as auth will be managed by API Gateway

- Auditing tables are not included here, can be done via asynchronous event system like kafka or using internal libraries like envers.

- Leaving comments and reviews for movies as it will add complexity to the system. Movies will be displayed based on user preferences and movie ratings.

- Pre calculated data contains the movies and theaters based on pre-registered user preferences like location, genre, rating, theatre preference etc.

- Graph data pipeline is omitted here for simplicity, we can create a user graph database which can store precalculated nested data for user including feed, notifications, comments and reviews/emotions.

- DGS (GraphQL service) can also be used to address multiple internal service calls.

- Inventory Synchronization would be required with the theatre partners periodically.

### Declaration

- I have used Chat-GPT 3.5 for boiler-plating.
