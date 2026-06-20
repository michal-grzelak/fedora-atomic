# V2 Schema Migration Guide

Migrate recipes from `recipe-v1.json` to `recipe-v2.json` schema when the BlueBuild CLI supports v2 validation.

## v1 → v2 Field Mapping

| v1                             | v2                                             |
| ------------------------------ | ---------------------------------------------- |
| `name`                         | `metadata.name`                                |
| `description`                  | `metadata.description`                         |
| `alt-tags`                     | `metadata.tags`                                |
| `base-image` + `image-version` | `base.image` (combined as `<image>:<version>`) |
| _(missing)_                    | `version: 2`                                   |
| _(missing)_                    | `spec.platforms: [linux/amd64/v2]`             |

## Example: Nvidia Recipe

### v1

```yaml
# yaml-language-server: $schema=https://schema.blue-build.org/recipe-v1.json
name: aurora-dx-nvidia
description: Personalized Aurora-DX image.

base-image: ghcr.io/ublue-os/aurora-dx-nvidia-open
image-version: stable
alt-tags:
  - stable

modules:
  - from-file: common-nvidia.yml
  - type: initramfs
  - type: signing
```

### v2

```yaml
# yaml-language-server: $schema=https://schema.blue-build.org/recipe-v2.json
version: 2
spec:
  platforms:
    - linux/amd64/v2
base:
  image: ghcr.io/ublue-os/aurora-dx-nvidia-open:stable
metadata:
  name: aurora-dx-nvidia
  description: Personalized Aurora-DX image.
  tags:
    - stable

modules:
  - from-file: common-nvidia.yml
  - type: initramfs
  - type: signing
```

## Prerequisites

- BlueBuild CLI must support v2 recipe validation before applying
- Validate migrated recipes with `bluebuild validate` before pushing
