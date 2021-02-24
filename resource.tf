resource "google_project_service" "cloudbuild" {
  project = var.project_id
  service  = "cloudbuild.googleapis.com"
}

resource "google_project_iam_member" "cloudbuild" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
  depends_on = [ google_project_service.cloudbuild ]
}