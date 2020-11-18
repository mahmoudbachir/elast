dockerbuild:
	docker-compose --project-name elastalert build ealert

dockerrun:
	docker-compose --project-name elastalert run ealert

setupdocker:
	choco install docker-desktop -s"'https://chocolatey.org/api/v2/'" --force 
	a
	choco install docker-compose -s"'https://chocolatey.org/api/v2/'" --force
	a
	startDocker.ps1

firstdocker:
	make setupdocker
	make dockerbuild
	make dockerrun

docker:
	make dockerbuild
	make dockerrun
	