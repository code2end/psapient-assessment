# Designing an Online Booking System

`Total Monthly Active Users = 50 Million`

Designing an online booking system for 50 million monthly active users requires thorough planning and consideration of various system components.

## System Design Calculations

### 1. Traffic and Load Estimation:

- **Peak Traffic:** Estimate the peak number of concurrent users. Assuming 10% of users are active during peak times, you would have 5 million users. With a peak factor (e.g., 2x), the peak concurrent users could be 10 million.
- **Requests per Second (RPS):** If each user makes 5 requests per minute, you would have:

`RPS = 60 \* 5 \* 10,000,000 ≈ 833,333 RPS`

### 2. Database Requirements:

- **Storage:** Estimate the data storage requirements based on user data, booking records, and logs. For example, if each user generates 1 KB of data per booking and they make 5 bookings per month, the storage needed would be:

`Monthly Storage = 50,000,000 \* 5 \* 1 KB = 250 GB`

- **Database Throughput:** Estimate the read/write operations per second. Assuming 70% reads and 30% writes:

`Write TPS = 0.3 \* 833,333 ≈ 250,000 TPS`

`Read TPS = 0.7 \* 833,333 ≈ 583,333 TPS`

### 3. Scalability and Redundancy:

- **Horizontal Scaling:** Use load balancers to distribute traffic across multiple servers.
- **Database Sharding:** Split the database into smaller, more manageable pieces (shards) to handle high write/read loads.
- **Replication:** Implement replication to ensure data redundancy and high availability.

### 4. Network and Bandwidth:

- Estimate the required bandwidth. Assuming each request/response is 1 KB:

`Bandwidth = 833,333 \* 1 KB/s ≈ 814 MB/s`

### 5. Caching:

- Use caching mechanisms (e.g., Redis, Memcached) to reduce database load and improve response times.

### 6. Content Delivery Network (CDN):

- Use a CDN to deliver static content (e.g., images, scripts) closer to users, reducing latency and server load.

## Cost Estimations

### 1. Compute Resources (EC2 Instances)

- **Web Servers**: m5.large instances (2 vCPUs, 8 GiB RAM)
  - Estimated number of instances: 100
  - Cost per instance: $0.096 per hour
  - Monthly cost: `100 instances * 24 hours/day * 30 days * $0.096 = $69,120`
  - **Total Monthly Cost**: $69,120

### 2. Load Balancers (ELB)

- **Application Load Balancer**
  - Cost: $0.025 per hour + $0.008 per LCU-hour
  - Monthly cost: `(0.025 * 24 * 30) + (0.008 * 1000 * 24 * 30) = $8,856`
  - **Total Monthly Cost**: $8,856

### 3. Database (Amazon RDS or Aurora)

- **RDS Aurora**: db.r5.large instances (2 vCPUs, 16 GiB RAM)
  - Estimated number of instances: 20
  - Cost per instance: $0.29 per hour
  - Monthly cost: `20 instances * 24 hours/day * 30 days * $0.29 = $41,760`
  - **Total Monthly Cost**: $41,760
- **Storage**: 1 TB
  - Cost per GB: $0.10 per month
  - Monthly cost: `1000 GB * $0.10 = $100`
  - **Total Monthly Cost**: $100

### 4. Caching (Amazon ElastiCache)

- **Redis Cache Nodes**: cache.m5.large instances
  - Estimated number of nodes: 10
  - Cost per node: $0.146 per hour
  - Monthly cost: `10 nodes * 24 hours/day * 30 days * $0.146 = $10,512`
  - **Total Monthly Cost**: $10,512

### 5. Content Delivery Network (Amazon CloudFront)

- **Data Transfer**: 1 PB
  - Estimated Monthly Cost: $30,000

### 6. Storage (Amazon S3)

- **Data Storage**: 250 GB
  - Cost per GB: $0.023
  - Monthly cost: `250 GB * $0.023 = $5.75`
  - **Total Monthly Cost**: $5.75
- **Data Transfer**: 1 PB
  - Estimated Monthly Cost: $90,000

### 7. Logging and Monitoring (ELK Stack)

- **Elasticsearch Cluster**: r5.xlarge instances (4 vCPUs, 32 GiB RAM)
  - Estimated number of instances: 10
  - Cost per instance: $0.384 per hour
  - Monthly cost: `10 instances * 24 hours/day * 30 days * $0.384 = $27,648`
  - **Total Monthly Cost**: $27,648
- **Logstash Instances**: m5.large instances
  - Estimated number of instances: 5
  - Cost per instance: $0.096 per hour
  - Monthly cost: `5 instances * 24 hours/day * 30 days * $0.096 = $3,456`
  - **Total Monthly Cost**: $3,456
- **Storage for Logs**: 10 TB
  - Cost per GB: $0.023
  - Monthly cost: `10,000 GB * $0.023 = $230`
  - **Total Monthly Cost**: $230

### 8. Data Pipeline (Apache Spark, Cassandra, Grafana, Kafka)

- **Apache Spark**: r5.2xlarge instances (8 vCPUs, 64 GiB RAM)
  - Estimated number of instances: 20
  - Cost per instance: $0.504 per hour
  - Monthly cost: `20 instances * 24 hours/day * 30 days * $0.504 = $72,576`
  - **Total Monthly Cost**: $72,576
- **Cassandra Cluster**: r5.large instances (2 vCPUs, 16 GiB RAM)
  - Estimated number of instances: 15
  - Cost per instance: $0.126 per hour
  - Monthly cost: `15 instances * 24 hours/day * 30 days * $0.126 = $13,608`
  - **Total Monthly Cost**: $13,608
- **Grafana**: t3.medium instances
  - Estimated number of instances: 2
  - Cost per instance: $0.0416 per hour
  - Monthly cost: `2 instances * 24 hours/day * 30 days * $0.0416 = $60`
  - **Total Monthly Cost**: $60
- **Kafka Cluster**: m5.large instances

  - Estimated number of instances: 10
  - Cost per instance: $0.096 per hour
  - Monthly cost: `10 instances * 24 hours/day * 30 days * $0.096 = $6,912`
  - **Total Monthly Cost**: $6,912

### 9. API Gateway

- Total API calls: `50 million users * 50 calls/user = 2.5 billion calls` with API calls, data transfer and caching ~ $8,309.10

### 10. Miscellaneous Costs

- **Route 53 (DNS)**
  - Estimated cost: $100
- **IAM, VPC, and other ancillary services**
  - Estimated cost: $1,000

### Total Monthly Cost Estimate

Summing up the above components:

- **Compute Resources (EC2)**: $69,120
- **Load Balancers (ELB)**: $8,856
- **Database (RDS/Aurora)**: $41,860
- **Caching (ElastiCache)**: $10,512
- **CDN (CloudFront)**: $30,000
- **Storage (S3)**: $90,005.75
- **Logging and Monitoring (ELK)**: $31,334
- **Data Pipeline (Spark, Cassandra, Grafana, Kafka)**: $93,156
- **API Gateway**: $8,309.10
- **Miscellaneous Costs**: $1,100

**Total Estimated Monthly Cost**: $384,227.85

_Estimations can be optimized further as per requirements by using Cloudwatch for monitoring and AWS infra for analytics. Using AWS Cost optimizations and autoscaling rules to handle peak hours_

## Revenue Estimation :

- Assuming 5% conversion rate (5% of 50 million) with average ticket size of $1 (25% of movie ticket) we have :

`Monthly revenue : 2,500,000 * 1 = $2,500,000`

**Infra cost < 25% of Monthly Revenue**
