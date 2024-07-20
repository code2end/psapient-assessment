# Non-functional Discussion

## Localization and Internationalization

_Translations Table : Movie, Notifications, UI, Messages, Theatre etc_

_Preferences : Language, Currency and Current Location for datetime_

Features :

- Server Side Rendering (for faster load time),
- DateTime Utils,
- Currency Utils [External Currency Conversion library],
- Localization Library (Resource Bundle)

## Security [OWASP Top 10]

1. SQL Injection

   - Vulnerability: Unsanitized user input in SQL queries.
   - Mitigation: Use parameterized queries or ORM frameworks.

2. Broken Authentication

   - Vulnerability: Weak or flawed authentication mechanisms.
   - Mitigation: Use strong password policies, implement multi-factor authentication (MFA), and securely store passwords.

3. Sensitive Data Exposure

   - Vulnerability: Exposing sensitive data in transit or at rest.
   - Mitigation: Use HTTPS for data transmission and encrypt sensitive data.

4. XML External Entities (XXE)

   - Vulnerability: Processing XML input containing external entity references.
   - Mitigation: Disable external entities in XML parsers.

5. Broken Access Control

   - Vulnerability: Improper access control allowing unauthorized actions.
   - Mitigation: Enforce access control checks at all levels (API, services, database).

6. Security Misconfiguration

   - Vulnerability: Using default configurations or incomplete configurations.
   - Mitigation: Regularly review and update configurations, remove unnecessary features, and enable security features.

7. Cross-Site Scripting (XSS)

   - Vulnerability: Injecting malicious scripts into web pages viewed by other users.
   - Mitigation: Validate and escape all user input.

8. Insecure Deserialization

   - Vulnerability: Deserializing untrusted data leading to remote code execution.
   - Mitigation: Avoid deserialization of untrusted data and use safe libraries.

9. Using Components with Known Vulnerabilities

   - Vulnerability: Using outdated or vulnerable third-party components.
   - Mitigation: Regularly update dependencies and use vulnerability scanning tools.

10. Insufficient Logging & Monitoring
    - Vulnerability: Lack of proper logging and monitoring can delay the detection of attacks.
    - Mitigation: Implement comprehensive logging and monitoring.

## External Integration

_Factors : Cost, Availability, Response Time, Documentation, Use Case Match, Support_

- **External Services:**
  - Email - SES/SendGrid
  - Phone Messages - Twilio/Exotel
  - Payment Gateway - Stripe/Razorpay

## Compliance

- Data Protection and Privacy:

  - GDPR
  - CCPA

- Payment Security:

  - PCI DSS

- Accessibility:

  - WCAG

- SEO:

  - SEO best practices : keywords, load time, website map for search engines

- Security:

  - OWASP Top 10

- Localization and Internationalization:

  - Support multiple languages and regional formats
  - Comply with local laws and regulations

- Industry-Specific:
  - COPPA

## Monetize

- Service Fees and Convenience Charges
- Advertising and Promotions [Movie Studios, Theatres]
- Partnerships and Affiliate Programs [Restaurants, Taxi]
- Premium Memberships and Subscriptions
- Data Analytics and Insights [Anonymized user data to movie studios]
- Ticket Insurance Commission
- Exclusive Content and Merchandise [Movie Studio Partnerships]
- Event Hosting and Private Screenings
- Streaming Services
