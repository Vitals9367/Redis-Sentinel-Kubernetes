FILE_PATH="${1:-"./resources"}"
NAMESPACE="redis-sentinel"

# Namespace
kubectl create ns $NAMESPACE

# Config files
kubectl apply -f "$FILE_PATH/redis-config.yml" -n $NAMESPACE
kubectl apply -f "$FILE_PATH/redis-scripts-config.yml" -n $NAMESPACE
kubectl apply -f "$FILE_PATH/redis-secret.yml" -n $NAMESPACE

# Services
kubectl apply -f "$FILE_PATH/redis-services.yml" -n $NAMESPACE

# Redis
kubectl apply -f "$FILE_PATH/redis-stateful.yml" -n $NAMESPACE

kubectl wait --namespace=$NAMESPACE \
             --for=condition=ready pod \
             --selector=app=redis \
             --timeout=280s

# Sentinel
kubectl apply -f "$FILE_PATH/sentinel-stateful.yml" -n $NAMESPACE