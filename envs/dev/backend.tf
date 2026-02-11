terraform {
  backend "gcs" {
    bucket = "ai-squad-tfstate"
    prefix = "envs/dev"
  }
}
