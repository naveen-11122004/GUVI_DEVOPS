#!/bin/bash
docker build -t shop .
echo Hyyy
docker login -u naveen11122004 -p naveen2004
docker tag shop naveen11122004/devops-devops
docker push naveen11122004/devops-devops
kubectl apply -f  deploy.yaml --validate=false
kubectl apply -f svc.yaml --validate=false
