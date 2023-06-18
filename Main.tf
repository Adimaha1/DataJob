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
        image = "us-east4-docker.pkg.dev/durable-path-385321/datajobtest/datajobtest:e84675d3d8bb72c4c75a1e36412d92d003a445e2"
        
      }
    }
  }

  lifecycle {
    ignore_changes = [
      launch_stage,
    ]
  }
}