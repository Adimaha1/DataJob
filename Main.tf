provider "google" {
  project = "durable-path-385321"
  region  = "us-east4"
}

resource "google_cloud_run_v2_job" "default" {
  name     = "cloudrun-job"
  location = "us-east4"

  template {
    template {
      containers {
        image = "us-east4-docker.pkg.dev/durable-path-385321/datajobtest/datajobtest"
        
      }
    }
  }

  lifecycle {
    ignore_changes = [
      launch_stage,
    ]
  }
}