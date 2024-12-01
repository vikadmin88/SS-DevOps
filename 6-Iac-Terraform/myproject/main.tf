# Define the MongoDB Atlas Provider
terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.22.0"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.MONGODB_ATLAS_PUBLIC_KEY
  private_key = var.MONGODB_ATLAS_PRIVATE_KEY
}


# Create a Project
resource "mongodbatlas_project" "myproject" {
  name   = var.project_name
  org_id = var.MONGODB_ATLAS_ORGANIZATION_ID
}



# Create an Atlas Cluster
resource "mongodbatlas_cluster" "mycluster" {
  project_id                   = mongodbatlas_project.myproject.id
  name                         = var.cluster_name
  provider_name                = "TENANT"
  backing_provider_name        = "AWS"
  provider_instance_size_name  = "M0"
  provider_region_name         = "US_EAST_1"
  cloud_backup                 = false
  auto_scaling_disk_gb_enabled = false
}


# Create a Database User
resource "mongodbatlas_database_user" "bob" {
  project_id         = mongodbatlas_project.myproject.id
  username           = var.MONGODB_ATLAS_DB_USER_NAME
  password           = var.MONGODB_ATLAS_DB_USER_PASSWORD
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = var.MONGODB_ATLAS_DB_NAME
  }

  depends_on = [mongodbatlas_cluster.mycluster]
}


# Open up your IP Access List to all, but this comes with significant potential risk.
locals {

  cidr_block_list = [
    "0.0.0.0/1",
    "128.0.0.0/1"
  ]
}

resource "mongodbatlas_project_ip_access_list" "cidr" {
  for_each   = toset(local.cidr_block_list)
  project_id = mongodbatlas_project.myproject.id
  cidr_block = each.key
  comment    = "Allow access for all IPs"
}
