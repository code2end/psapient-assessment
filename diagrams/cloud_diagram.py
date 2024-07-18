from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import Lambda, EC2
from diagrams.aws.database import RDS, Dynamodb
from diagrams.aws.network import ELB, APIGateway, Route53
from diagrams.aws.security import IAM
from diagrams.aws.storage import S3
from diagrams.aws.management import Cloudwatch
from diagrams.aws.general import User
from diagrams.onprem.aggregator import Fluentd
from diagrams.onprem.queue import Kafka
from diagrams.onprem.monitoring import Grafana
from diagrams.firebase.grow import InAppMessaging
from diagrams.aws.database import ElasticacheForRedis
from diagrams.onprem.database import Mongodb
from diagrams.onprem.analytics import Spark
from diagrams.elastic.elasticsearch import Elasticsearch

with Diagram("Online Movie Ticket Booking Platform", direction="TB", show=False):

    # DNS and Load Balancer
    dns = Route53("DNS")
    lb = ELB("Load Balancer")

    # Users
    user = User("Customer")
    admin = User("Admin")
    theatre_partner = User("Theatre Partner")
    notification = InAppMessaging("Notify")
    elastic_search = Elasticsearch("Elastic Cluster")
    aggregator = Fluentd("aggreagtor")

    with Cluster("VPC"):

        # API Gateway
        api_gateway = APIGateway("API Gateway")
        analytics_monitor = Spark("Analytics Processing")
        monitoring = Grafana("Analytics Monitoring")

        # Microservices Cluster
        micro_cluster = Cluster("Microservices")
        with micro_cluster:
            auth_service = EC2("Auth Service")
            user_service = EC2("User Service")
            partner_service = EC2("Partner Service")
            movie_service = EC2("Movie Service")
            booking_service = EC2("Booking Service")
            admin_service = EC2("Admin Service")

        # Databases
        with Cluster("Databases"):
            relational_db = RDS("Postgres (RDS)")
            # Caching
            cache = ElasticacheForRedis("Redis Cache")
        
        nosql_db = Mongodb("Mongo")
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
    api_gateway >> auth_service

    analytics_consumer >> analytics_monitor >> monitoring
    relational_db >> analytics_monitor
    analytics_monitor >> relational_db
    analytics_monitor >> nosql_db
    user_service >> Edge(color="black", label="Pre-calculated data") >> nosql_db
