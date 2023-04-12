# Azure-Lightweight-BI-Infrastructure
Azure Lightweight BI Infrastructure is a Bicep template that deploys a minimalistic BI infrastructure in Azure for small to medium scale BI projects. It includes a SQL Server instance, a SQL Database, a Data Factory instance, and a Storage Account. This template is designed to be lightweight and easy to deploy, providing a starting point for building a customized BI solution on Azure.

# What's included
The lightweight BI infrastructure on Azure provides a scalable and cost-effective solution for small to medium-sized businesses that need to manage and analyze data. It also provides a flexible architecture that can be extended as your business grows and your BI requirements change.

1. Azure SQL Database - Use this as your data source to store and manage your data. It's a fully managed, cloud-based relational database service that's scalable and provides high availability.
2. Azure Data Factory - Use this to move data from various sources into Azure SQL Database. It's a fully managed, cloud-based data integration service that allows you to create, schedule, and manage data pipelines.
3. Azure Blob Storage - Use this to store data that doesn't require relational or tabular structures. It's a fully managed, cloud-based object storage service that's scalable and provides high availability.
4. Azure Key Vault - Use this to store and manage keys, secrets, and certificates that are used to secure your BI infrastructure. It's a fully managed, cloud-based service that provides secure access to your data and applications.

Except from these Azure resources, it is recommended to use Power BI for Dashboards and storage of Tabular Models:
- Power BI - Use this to create visualizations and dashboards. Power BI is a cloud-based business analytics service that provides interactive visualizations with self-service business intelligence capabilities.
