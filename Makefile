installgit:
	choco install git -s"'https://chocolatey.org/api/v2/'"
	refreshenv

dockerbuild:
	docker-compose --project-name elastalert build ealert

dockerrun:
	docker-compose --project-name elastalert run ealert

setupdocker:
	choco install docker-desktop --force
	a
	choco install docker-compose --force
	a
	startDocker.ps1

firstdocker:
	make installgit
	make setupdocker
	make dockerbuild
	make dockerrun

docker:
	make dockerbuild
	make dockerrun
	