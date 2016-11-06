# gocd-go-agent 
Docker image for Thoughtworks GOCD (https://www.thoughtworks.com/go/)

Before build :
1) Check Java and GO-Agent version in Dockerfile. Download JDK and place it under material directory.
2) Udpate supervisord.conf for reflecting correct version of go-agent.


Before starting the continer
1) Update run.sh with correct volumn mount values.
2) Update GO_SERVER_URL , IP , port mapping in run.sh
