#!groovy

node {
    
    // Setup the Docker Registry (Docker Hub) + Credentials 
    registry_url = "https://index.docker.io/v1/" // Docker Hub
    build_tag = "CI" // default tag to push for to the registry
    
	echo "Building Surikator with docker.build(${maintainer_name}/${container_name}:${build_tag})"
	container = docker.build("${maintainer_name}/${container_name}:${build_tag}", 'surikator')
	echo "Surikator (${maintainer_name}/${container_name}:${build_tag}) is running"

}