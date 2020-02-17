set -xv

home_dir=/var/lib/jenkins/workspace/Third-party-framework
cd $home_dir

sudo /home/ec2-user/istio-install/istio-1.4.3/bin/istioctl manifest apply --set profile=demo

sudo /usr/bin/kubectl apply -f ./metrics-server-0.3.6/deploy/1.8+/

cd ./src
sudo /usr/bin/kubectl apply -f grafana.yaml
sudo /usr/bin/kubectl apply -f kaili.yaml
sudo /usr/bin/kubectl apply -f prometheus.yaml
sudo /usr/bin/kubectl apply -f tracing.yaml
