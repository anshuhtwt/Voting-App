* Download deployment file, [click here](https://kubernetes.github.io/ingress-nginx/deploy/#aws)
* Make changes in deployment file to add VPC CIDR in use for the Kubernetes cluster and also change the AWS Certificate Manager(ACM)-ID.
* Apply the deployment file after making the above changes, this will setup Nginx-Ingress-Controller on k8s cluster and a Load-Balancer in AWS.
