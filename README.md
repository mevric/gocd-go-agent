# gocd-go-agent 
Docker image for Thoughtworks GOCD (https://www.thoughtworks.com/go/)

Before build :<br>
1) Check Java and GO-Agent version in Dockerfile. Download JDK and place it under material directory.<br>
2) Udpate supervisord.conf for reflecting correct version of go-agent.<br>

Before starting the container <br>
1) Update run.sh with correct volumn mount values.<br>
2) Update GO_SERVER_URL , IP , port mapping in run.sh
