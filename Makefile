

# Install zlib via spack. Using most recent spack version
develop:
	docker build -t develop --build-arg SPACK_VERSION=develop .

v0.16.3:
	docker build -t v0.16.3 --build-arg SPACK_VERSION=v0.16.3 .


develop-fixed:
	docker build -t develop-fixed -f Dockerfile-fixed \
               --build-arg SPACK_VERSION=develop .
