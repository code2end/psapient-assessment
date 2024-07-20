from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import Lambda, EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB, APIGateway, Route53
from diagrams.aws.security import IAM
from diagrams.aws.storage import S3
from diagrams.aws.general import User
from diagrams.elastic.elasticsearch import Logstash
from diagrams.onprem.queue import Kafka
from diagrams.onprem.monitoring import Grafana
from diagrams.firebase.grow import InAppMessaging
from diagrams.aws.database import ElasticacheForRedis
from diagrams.onprem.database import Cassandra
from diagrams.onprem.analytics import Spark
from diagrams.elastic.elasticsearch import Elasticsearch

with Diagram("Cloud", direction="TB", show=False):

    # DNS and Load Balancer
    dns = Route53("DNS")
    lb = ELB("Load Balancer")

    # Users
    user = User("Customer")
    admin = User("Admin")
    theatre_partner = User("Theatre Partner")
    notification = InAppMessaging("Notify")
    elastic_search = Elasticsearch("Elastic Cluster")
    aggregator = Logstash("aggreagtor")

    with Cluster("VPC"):

        # API Gateway
        api_gateway = APIGateway("API Gateway (Auth, Rate Limiting, Caching, Logging, Tracing, Security, Context)")
        analytics_monitor = Spark("Analytics Processing")
        monitoring = Grafana("Analytics Monitoring")
        analytics_database = Cassandra("Analytic db")

        # Microservices Cluster
        micro_cluster = Cluster("Microservices")
        with micro_cluster:
            user_service = EC2("User Service")
            search_service = EC2("Search Service")
            partner_service = EC2("Partner Service")
            movie_service = EC2("Movie Service")
            booking_service = EC2("Booking Service")
            admin_service = EC2("Admin Service")

        # Databases
        with Cluster("Databases"):
            relational_db = RDS("Postgres (RDS)")
            # Caching
            cache = ElasticacheForRedis("Redis Cache")
        
        full_text_search = Elasticsearch("Full Text Search")
        # Storage
        storage = S3("S3 Bucket")
        # Kafka
        kafka = Kafka("Kafka")

        # Kafka Consumers
        analytics_consumer = Lambda("Analytics Consumer")
        notification_consumer = Lambda("Notification Consumer")

    # Connections
    dns >> lb >> api_gateway

    api_gateway >> user_service
    api_gateway >> partner_service
    api_gateway >> movie_service
    api_gateway >> booking_service
    api_gateway >> admin_service
    api_gateway >> search_service
    
    booking_service >> cache >> relational_db
    booking_service >> kafka

    kafka >> analytics_consumer
    kafka >> notification_consumer >> notification

    booking_service >> storage

    user >> lb
    admin >> lb
    theatre_partner >> lb

    admin_service >> aggregator
    api_gateway >> aggregator >> elastic_search

    analytics_consumer >> analytics_monitor >> analytics_database >> monitoring
    relational_db >> analytics_monitor
    analytics_monitor >> relational_db
    search_service >> full_text_search
