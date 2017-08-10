#!/bin/bash
echo "---------------------------------------------------------------------------------"
echo " Stage Init: Initialisation of Surikator"
echo "---------------------------------------------------------------------------------"

// Setup the Docker Registry (Docker Hub) + Credentials 

registry_url = "https://index.docker.io/v1/" // Docker Hub
build_tag = "CI" // default tag to push for to the registry