# deployment-v1-v2
Step-1 Create ec2 machine with t2.miceo or large and open all security group, login into the instance with public ip

step-2 install sudo apt unzip

step-3 install aws cli with below 3 command line

       curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
       unzip awscliv2.zip
       sudo ./aws/install
step-4 aws configure

       AWS Access Key ID [None]: A*******************6
       AWS Secret Access Key [None]: d*************************o
       Default region name [None]: us-east-2
       Default output format [None]: optional

step-5 Download the Kubectl Binary File
       To begin, download the Kubectl command-line tool suitable for your AMD64 Ubuntu setup. Use the provided terminal command to retrieve the Kubectl binary file: curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
       Make the Kubectl Binary File Executable : sudo chmod +x kubectl
       Move the Kubectl Binary File to the Bin Directory: sudo mv kubectl /usr/local/bin
       Confirm Kubectl Installation: kubectl version --client

step-6 install eksctl
       # for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
       ARCH=amd64
       PLATFORM=$(uname -s)_$ARCH

       curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

       # (Optional) Verify checksum
       curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

       tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

       sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

step-7 eksctl create cluster --name my-cluster-1 --region us-east-2 --node-type m7i-flex.large

step-8 check nodes by using kubectl get nodes

step-9 create namespace - kubectl create ns <name>

step-10 set the default namespace for your current kubectl context - kubectl config set-context --current --namespace=devnamespace

step-11 clone the url - git clone url cd directory

step-12 check docker deployment.yaml service.yaml files

step-13 apply all Kubernetes manifests in the current directory to your cluste with kubectl apply -f .

step-14 check the Deployment with respected named in your Kubernetes cluster -  kubectl get deploy mylb
         (check the server with the external ip to check external ip - kubectl get all )

step-15 to view the revision history of a Deployment called mylb - kubectl rollout history deploy mylb

step-16  kubectl describe svc - Shows detailed information about a Service

step-17  kubectl get po -w - Watches Pods in real time

step-18  kubectl describe all - Shows detailed information about all resources (Pods, Services, Deployments, ReplicaSets) in the current namespace.
         then set another image 

step-19  kubectl set image deploy mylb mylb-con=sleeky - Updates the container image of the Deployment mylb.
         mylb-con=sleeky → sets the container mylb-con to use the sleeky image.
         Triggers a rolling update of the Deployment.
         (check the server with the external ip to check external ip - kubectl get all )

step-20  kubectl rollout status deploy mylb - Shows the progress of the Deployment rollout.

step-21  kubectl get svc - Lists all Services in the current namespace.

step-22  kubectl rollout undo deploy mylb - Rolls back the Deployment mylb to the previous revision.

step-23  kubectl rollout status deploy mylb - Same as Step 21 — confirms that the rollback or update has completed successfully.

step-24  kubectl rollout history deploy mylb - Likely meant kubectl rollout history deploy mylb.

step-25  aws eks list-clusters --region us-east-2 - lists all clusters

step-26  eksctl delete cluster --name my-cluster-2 --region us-east-2 - delete the particular cluster

step-27 terminate the created ec2 vm