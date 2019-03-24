# javastore-cert
These multi-stage builds dockerfile have 2 stages:
1. Stage - addcert: this will stores all certificates and install the certificates to the system's trusted CA repository.
2. Stage - importer: this will import the certificates to Java key store

# Build
Here is an example on how to build.

Stage 1: 
docker build --target addcert -t javastore/certs .

Final Stage:
docker build -t javastore/home .

