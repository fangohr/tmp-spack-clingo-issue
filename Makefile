

# Install zlib via spack. Using most recent spack version
develop:
	docker build -t develop --build-arg SPACK_VERSION=develop .

v0.16.3:
	docker build -t develop --build-arg SPACK_VERSION=v0.16.3 .
