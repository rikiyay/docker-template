#!/bin/bash
docker run -it -p 8888:8888 -v $(pwd)/data:/ds/data -v $(pwd)/code:/ds/code --rm ds-template