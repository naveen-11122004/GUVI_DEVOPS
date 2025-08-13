#!/bin/bash
docker build -t task_final .
echo Hyyy
docker login -u naveen11122004 -p naveen2004
docker tag task_final naveen11122004/devops_final
docker push naveen11122004/devops_final
kubectl apply -f  deploy.yaml --validate=false
kubectl apply -f svc.yaml --validate=false
