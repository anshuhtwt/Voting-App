* Go to official doc, [click here](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)

* Install the prerequisites and create IAM Role with following permission policies: <br> 
                                                   1)AmazonEC2FullAccess <br> 2)AWSCloudFormationFullAccess <br> 3)IAMFullAccess

* Commad to create cluster <br>
     eksctl create cluster --name (cluster-name) --region (region-name) --node-type (Instance type)  
     
* Command to delete cluster <br>
     eksctl delete cluster (cluster-name) --region (region-name)
