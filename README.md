# tmp-spack-clingo-issue
Demonstrate problem with clingo on `zlib` compilation (as basic example)

Using spack v0.16.3, the command `spack install zlib` completes: [![debian-spack-develop](https://github.com/fangohr/tmp-spack-clingo-issue/actions/workflows/debian-spack-0.16.3.yml/badge.svg)](https://github.com/fangohr/tmp-spack-clingo-issue/actions/workflows/debian-spack-0.16.3.yml)

Whereas using spack `develop` fails: [![debian-spack-develop](https://github.com/fangohr/tmp-spack-clingo-issue/actions/workflows/debian-spack-develop.yml/badge.svg)](https://github.com/fangohr/tmp-spack-clingo-issue/actions/workflows/debian-spack-develop.yml)

This seems to relate to the switch to clingo, and some of the bootstrapping not working well? Or there is a mistake in the assumptions what needs to be installed before starting to use Spack.

As the commands are run in a Docker container ([Dockerfile](Dockerfile)), this is starting from a well defined environment.

To reproduce locally:

- clone this repository: `git clone https://github.com/fangohr/tmp-spack-clingo-issue.git`
- cd into repository: `cd tmp-spack-clingo-issue`
- run `make develop` for the develop branch 
- run `make v0.16.3` for the 0.16.3 release

[Relates to Spack Issue https://github.com/spack/spack/issues/22606]

-----------

## Update 25 October 2021: the issue is solved

The installed prerequisites were incomplete. The command `file` was not available. This prevented the bootstrap of binary clingo, and the bootstrapping of clingo from source needed further packages. Thanks to @alalazo for the input.
