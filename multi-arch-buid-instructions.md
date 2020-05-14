# Multi-Architecture build instructions

To be able to use that docker image on multiple architectures, follow the build instructions to make a multi-arch build.

## Preperation

1. Enable buildx (DOCKER_CLI_EXPERIMENTAL)
2. Enable binfmt_misc to run non-native Docker images  
`docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d`
3. Switch from the default Docker builder to a multi-arch builder  
`docker buildx create --use --name mybuilder`

## Actual build

The following build is building for `x86`, `Arm` and `Arm64`:

```
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t nortismo/dynu-ddns-updater --push https://github.com/nortismo/dynu-ddns-updater.git
```