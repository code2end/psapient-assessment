### Anyone of the following read scenarios: (Only Service Implementation needed/ No UI required)

- Browse theatres currently running the show (movie selected) in the town, including show
  timing by a chosen date.
- Booking platform offers in selected cities and theatres
- 50% discount on the third ticket
- Tickets booked for the afternoon show get a 20% discount

### Anyone of the following write scenarios: Good to have - Code Implementation (write scenario):

- Book movie tickets by selecting a theatre, timing, and preferred seats for the day
- Theatres can create, update, and delete shows for the day.
- Bulk booking and cancellation
- Theatres can allocate seat inventory and update them for the show

**Functional Scenario implemented :**

- **READ** - Browse theatres currently running the show (movie selected) in the town, including show
  timing by a chosen date.
- **WRITE** - Book movie tickets by selecting a theatre, timing, and preferred seats for the day.

**Implementation Plan :**

1. Setup Springboot Project
2. Setup DB and Docker Containers
3. Create Test Data
4. Implement Movie and Partner Service for the read scenario
5. Implement Booking Service for the write scenario
