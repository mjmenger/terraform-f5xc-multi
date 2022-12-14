include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_path_to_repo_root()}//modules/base-aws-network"
}

inputs = {
  awsRegion = "us-east-1"
  servicesVpcCidrBlock = "100.64.0.0/20"
  servicesVpc = {
    "azs" = {
      "az1" = { az = "us-east-1a" },
      "az2" = { az = "us-east-1b" },
      "az3" = { az = "us-east-1c" },
    },
    "external" = {
      "az1" = {
        cidr = "100.64.0.0/24"
      },
      "az2" = {
        cidr = "100.64.3.0/24"
      },
      "az3" = {
        cidr = "100.64.6.0/24"
      }
    },
    "internal" = {
      "az1" = {
        cidr = "100.64.1.0/24"
      },
      "az2" = {
        cidr = "100.64.4.0/24"
      },
      "az3" = {
        cidr = "100.64.7.0/24"
      }
    },
    "workload" = {
      "az1" = {
        cidr = "100.64.2.0/24"
      },
      "az2" = {
        cidr = "100.64.5.0/24"
      },
      "az3" = {
        cidr = "100.64.8.0/24"
      }
    }

  }
  spokeVpcCidrBlock = "10.0.0.0/20"
  spokeVpc = {
    "azs" = {
      "az1" = { az = "us-east-1a" },
      "az2" = { az = "us-east-1b" },
      "az3" = { az = "us-east-1c" },
    },
    "external" = {
      "az1" = {
        cidr = "10.0.0.0/24"
      },
      "az2" = {
        cidr = "10.0.3.0/24"
      },
      "az3" = {
        cidr = "10.0.6.0/24"
      }
    },
    "internal" = {
      "az1" = {
        cidr = "10.0.1.0/24"
      },
      "az2" = {
        cidr = "10.0.4.0/24"
      },
      "az3" = {
        cidr = "10.0.7.0/24"
      }
    },
    "workload" = {
      "az1" = {
        cidr = "10.0.2.0/24"
      },
      "az2" = {
        cidr = "10.0.5.0/24"
      },
      "az3" = {
        cidr = "10.0.8.0/24"
      }
    }

  }
  spoke2VpcCidrBlock = "10.0.48.0/20"
  spoke2Vpc = {
    "azs" = {
      "az1" = { az = "us-east-1a" },
      "az2" = { az = "us-east-1b" },
      "az3" = { az = "us-east-1c" },
    },
    "external" = {
      "az1" = {
        cidr = "10.0.48.0/24"
      },
      "az2" = {
        cidr = "10.0.51.0/24"
      },
      "az3" = {
        cidr = "10.0.54.0/24"
      }
    },
    "internal" = {
      "az1" = {
        cidr = "10.0.49.0/24"
      },
      "az2" = {
        cidr = "10.0.52.0/24"
      },
      "az3" = {
        cidr = "10.0.55.0/24"
      }
    },
    "workload" = {
      "az1" = {
        cidr = "10.0.50.0/24"
      },
      "az2" = {
        cidr = "10.0.53.0/24"
      },
      "az3" = {
        cidr = "10.0.56.0/24"
      }
    }

  }
}
