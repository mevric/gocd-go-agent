# Usage pattern
# ./run.sh <HOST_IP> <DockerImageID>
# ./run.sh 192.168.2.5 386190f5a38e
#
# Update volumn mount param below before attempting to start the agent.
#

#docker run \
docker run -d \
 -v -v /opt/go-agent/pipelines:/var/lib/go-agent-16.11.0/pipelines \
 -v /var/log/go-agent:/var/log/go-agent \
 -p $1:20154:8154 \
 -e TZ=${TZ-`readlink /etc/localtime | sed -e 's,../usr/share/zoneinfo/,,'`} \
 -e GO_SERVER_URL=https://192.168.2.5:8154/go \
 -e dockerImageId=$2 \
 -t $2
