# Redis - Sentinel cluster template for Kubernetes

You have to have Kubernetes cluster before doing this. Easies way is to use Docker Desktop and enable Kubernetes.

To start cluster run ```sh startCluster.sh```<br/>
And if you want to clean up after, run ```kubectl delete ns redis-sentinel```

It creates all files in order in redis-sentinel namespace. Feel free to modify everything, this is just a template.

More info [here]()