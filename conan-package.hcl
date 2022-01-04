job "cci" {
  datacenters = ["dc1"]
  type = "batch"

  parameterized {
    meta_required = [
        "PACKAGE_NAME",
        "PACKAGE_RECIPE_FOLDER",
        "PACKAGE_VERSION"
    ]
  }
  reschedule {
    attempts  = 0
    unlimited = false
  }

  task "build-package" {
    resources {
        memory = 16000
    }
    restart {
      attempts = 0
    }

    driver  = "docker"

    config {
      image = "nomad-cci:local"
      command = "conan"
      args = [
        "create",
        "conan-center-index/recipes/${NOMAD_META_PACKAGE_NAME}/${NOMAD_META_PACKAGE_RECIPE_FOLDER}",
        "${NOMAD_META_PACKAGE_NAME}/${NOMAD_META_PACKAGE_VERSION}@",
        "--build=missing"
      ]
    }
  }
}

