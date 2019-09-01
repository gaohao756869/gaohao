#/bin/bash
#author:gaohao
# docker install
USER=`whoami`
CUR_DIR=`pwd`
function check_user()
{
	if [ ${USER} == "root" ];then
		echo "check user done..."
	else
		echo "only root can run this script"
		exit 1
	fi
}
function docker_install()
{
	echo "start install docker..."
	bash ${CUR_DIR}/get_docker.sh
	if [ $? != "0" ];then
		echo "docker install failed..."
		exit 1
	else
		echo "docker install success"
	fi
}
function  add_docker_registry_mirror()
{
	echo "start add docker_registry_mirror..."
	curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
}
function restart_docker()
{
	systemctl restart docker > /dev/null 2>&1
	if [ $? != "0" ];then
		echo "docker restart failed..."
		exit 1
	else
		echo "docker restart success"
	fi
}
check_user
docker_install
add_docker_registry_mirror
restart_docker
