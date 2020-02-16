deploy-adguard:
	rage -p -d adguard/configs/password.enc > adguard/configs/password
	export $(cat adguard/configs/password | xargs)
	envsubst < adguard/configs/AdGuardHomeTmpl.yml | tee adguard/configs/AdGuardHome.yml > /dev/null
	kustomize build adguard | kubectl apply -f -

deploy-myip:
	kubectl apply -f myip/base/myip/myip-namespace.yml
	kustomize build myip | kubectl apply -f -