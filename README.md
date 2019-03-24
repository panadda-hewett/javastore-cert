# javastore-cert
These multi-stage builds dockerfile contains 2 stages:
1. Stage 0 - addcert: This will stores all certificates and install the certificates to the system's trusted CA repository.
2. Stage 1 - This will import the certificates from 'Stage 0 - addcert' to Java key store

# Build
Here is an example on how to build.

Stage 1: 
docker build --target addcert -t javastore/certs .

Final Stage:
docker build -t javastore/home .

