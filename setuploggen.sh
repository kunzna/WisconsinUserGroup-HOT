kubectl delete ns easytrade
kubectl create namespace easytrade
kubectl -n easytrade apply -f ./deployment

kubectl create namespace log-generator

# cd /home/dtu_training/WisconsinUserGroup-HOT

kubectl apply -f LogGenerator.yaml -n log-generator

kubectl rollout status deployment log-generator -n log-generator --timeout=90s

kubectl logs -f -n log-generator -l app=log-generator


