# 01-01.random.tf

resource "random_pet" "example" {
  #
  count = 10
  keepers = {
    pet_name = var.pet_name
    count    = count.index
  }
}

resource "random_pet" "group" {
  #
  count = 10
  # prefix = "subgroup"
  keepers = {
    pet_name = var.pet_name
    count    = count.index
  }
}

resource "random_uuid" "example" {
  #
  keepers = {
    # Keep the random ID constant across Terraform runs
    # always = 1
    uuid = var.uuid
  }
}

resource "random_uuid" "apps" {
  #
  count = 32
  keepers = {
    # Keep the random ID constant across Terraform runs
    # always = 1
    uuid = var.uuid
  }
}

resource "random_id" "example" {
  #
  byte_length = 8
}

