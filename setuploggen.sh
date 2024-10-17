kubectl delete ns easytrade
kubectl create namespace easytrade

cp /home/dtu_training/easytrade/kubernetes-manifests/ingress.yaml /home/dtu_training/WisconsinUserGroup-HOT/deployment/ingress.yaml

kubectl -n easytrade apply -f ./deployment

kubectl rollout status deployment -n easytrade --timeout=300s

kubectl delete ns log-generator
kubectl create namespace log-generator

# cd /home/dtu_training/WisconsinUserGroup-HOT

kubectl apply -f LogGenerator.yaml -n log-generator

kubectl rollout status deployment log-generator -n log-generator --timeout=90s

kubectl logs -f -n log-generator -l app=log-generator
