variable "TARGET_REPO" {}
variable "TARGET_TAG" {}
variable "ORIGIN_IMAGE" {}

group "default" {
    targets = ["linux-amd64", "linux-arm64-v8", "linux-arm-v7"]
}

target "linux-amd64" {
    tags = ["${TARGET_REPO}:${TARGET_TAG}-amd64"]
    platforms = ["linux/amd64"]
    dockerfile = "Dockerfile"
}

target "linux-arm64-v8" {
    tags = ["${TARGET_REPO}:${TARGET_TAG}-arm64"]
    platforms = ["linux/arm64/v8"]
    dockerfile = "Dockerfile.arm"
}

target "linux-arm-v7" {
    tags = ["${TARGET_REPO}:${TARGET_TAG}-armv7"]
    platforms = ["linux/arm/v7"]
    dockerfile = "Dockerfile.arm"
}