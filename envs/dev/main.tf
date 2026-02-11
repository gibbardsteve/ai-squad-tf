resource "random_id" "suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "tf_test" {
  name                        = "aiagent-scratch-tf-test-${random_id.suffix.hex}"
  location                    = "EU"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  public_access_prevention = "enforced"
}