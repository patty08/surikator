#!/bin/bash
echo "Building Surikator with docker.build(${maintainer_name}/${container_name}:${build_tag})"
container = docker.build("${maintainer_name}/${container_name}:${build_tag}", 'surikator')