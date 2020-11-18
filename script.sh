set -e
elastalert-create-index
exec elastalert --rule change.yaml