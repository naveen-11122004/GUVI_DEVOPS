#!/bin/bash
    echo hi123
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u naveen1104 -p naveen2004
    docker tag test naveen1104/pipeline2
    docker push naveen1104/pipeline2
    
