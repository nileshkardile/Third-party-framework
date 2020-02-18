set -xv

cd $home/src

# install kubernetes metrics server
sudo /usr/bin/kubectl apply -f ./metrics-server-0.3.6/deploy/1.8+/

# install istio with demo profile, it will install prometheus, grafana, kaili and jaeger for us
sudo /home/ec2-user/istio-install/istio-1.4.3/bin/istioctl manifest apply --set profile=demo

#Apply instio sidecar in application installed namespace
sudo /usr/bin/kubectl label namespace default istio-injection=enabled

# create virtual services for grafana, kaili, prometheus and jaegar
sudo /usr/bin/kubectl apply -f grafana.yaml
sudo /usr/bin/kubectl apply -f kaili.yaml
sudo /usr/bin/kubectl apply -f prometheus.yaml
sudo /usr/bin/kubectl apply -f tracing.yaml
