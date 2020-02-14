make deploy-adguard:
	rage -p -d adguard/configs/password.enc > adguard/configs/password
	export $(cat adguard/configs/password | xargs)
	envsubst < adguard/configs/AdGuardHomeTmpl.yml | tee adguard/configs/AdGuardHome.yml > /dev/null
	kustomize build adguard | kubectl apply -f -