include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/mjmenger/f5-xc-modules//f5xc/site/aws/tgw"
}

# Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

dependencies {
  paths = ["${get_path_to_repo_root()}/aws-base-1"]
}

dependency "infrastructure" {
  config_path = "${get_path_to_repo_root()}/aws-base-1"
  mock_outputs = {
    awsAz1 = ""
    awsAz2 = ""
    awsAz3 = ""
    externalSubnets = {
      "az1" = {
        "id" = "1"
      },
      "az2" = {
        "id" = "2"
      },
      "az3" = {
        "id" = "3"
      }
    }
    internalSubnets = {
      "az1" = {
        "id" = "1"
      },
      "az2" = {
        "id" = "2"
      },
      "az3" = {
        "id" = "3"
      }
    }
    workloadSubnets = {
      "az1" = {
        "id" = "1"
      },
      "az2" = {
        "id" = "2"
      },
      "az3" = {
        "id" = "3"
      }
    }
    spokeExternalSubnets = {
      "az1" = {
        "id" = "1"
      },
      "az2" = {
        "id" = "2"
      },
      "az3" = {
        "id" = "3"
      }
    }
    spokeWorkloadSubnets = {
      "az1" = {
        "id" = "1"
      },
      "az2" = {
        "id" = "2"
      },
      "az3" = {
        "id" = "3"
      }
    }
    securityGroup = ""
    vpcId = ""
    spokeVpcId = ""
    spoke2VpcId = ""
    spokeSecurityGroup = ""
  }
}

inputs = {
    instanceSuffix                 = "1"
    f5xc_aws_region                = dependency.infrastructure.outputs.awsRegion
    f5xc_aws_tgw_name              = "tgt-newmodule"
    f5xc_aws_default_ce_os_version = true
    f5xc_aws_default_ce_sw_version = true
    f5xc_aws_tgw_no_worker_nodes   = true
    f5xc_aws_tgw_az_nodes = {
        node0 : {
          f5xc_aws_tgw_workload_subnet             = "192.168.168.0/24", f5xc_aws_tgw_outside_subnet = "192.168.169.0/24"
          f5xc_aws_tgw_az_name                     = "us-east-2a"
          f5xc_aws_tgw_workload_existing_subnet_id = "subnet-0627537aadef37e68"
          f5xc_aws_tgw_outside_existing_subnet_id  = "subnet-04a82f3f85b1e772d"
          f5xc_aws_tgw_inside_existing_subnet_id   = "subnet-0627537aadef37e68"
        }
      }
    custom_tags = { 
        Owner = "m.menger@f5.com"
      }
    awsRegion                      = dependency.infrastructure.outputs.awsRegion
    awsAz1                         = dependency.infrastructure.outputs.awsAz1
    awsAz2                         = dependency.infrastructure.outputs.awsAz2
    awsAz3                         = dependency.infrastructure.outputs.awsAz3
    externalSubnets                = dependency.infrastructure.outputs.externalSubnets
    internalSubnets                = dependency.infrastructure.outputs.internalSubnets
    workloadSubnets                = dependency.infrastructure.outputs.workloadSubnets
    spokeExternalSubnets           = dependency.infrastructure.outputs.spokeExternalSubnets
    spokeWorkloadSubnets           = dependency.infrastructure.outputs.spokeWorkloadSubnets
    securityGroup                  = dependency.infrastructure.outputs.securityGroup
    vpcId                          = dependency.infrastructure.outputs.vpcId
    spokeVpcId                     = dependency.infrastructure.outputs.spokeVpcId
    spoke2VpcId                    = dependency.infrastructure.outputs.spoke2VpcId
    spokeSecurityGroup             = dependency.infrastructure.outputs.spokeSecurityGroup
}
