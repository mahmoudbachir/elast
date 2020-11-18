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
	make setupdocker
	make dockerbuild
	make dockerrun

docker:
	make dockerbuild
	make dockerrun
	