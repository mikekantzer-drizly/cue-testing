package kube

kubernetes: namespace: appTwo: {
	apiVersion: "v1"
	kind:       "Namespace"
	metadata: name: "appTwo"
}
kubernetes: deployment: appTwo: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      "appTwo"
		namespace: "appTwo"
	}
	spec: {
		minReadySeconds:      10
		replicas:             2
		revisionHistoryLimit: 10
		selector: matchLabels: name: "appTwo"
		template: {
			metadata: labels: name: "appTwo"
			spec: containers: [{
				env: [{
					name:  "PORT"
					value: "80"
				}]
				image:           "ealen/echo-server:0.5.1"
				imagePullPolicy: "IfNotPresent"
				name:            "appTwo"
				ports: [{
					containerPort: 80
					name:          "api"
				}]
			}]
		}
	}
}
kubernetes: service: appTwo: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		labels: name: "appTwo"
		name:      "appTwo"
		namespace: "appTwo"
	}
	spec: {
		ports: [{
			name:       "appTwo-api"
			port:       80
			targetPort: 80
		}]
		selector: name: "appTwo"
	}
}
kubernetes: ingress: appTwo: {
	apiVersion: "networking.k8s.io/v1"
	kind:       "Ingress"
	metadata: {
		name:      "appTwo"
		namespace: "appTwo"
	}
	spec: {
		ingressClassName: "nginx"
		rules: [{
			http: paths: [{
				backend: service: {
					name: "appTwo"
					port: number: 80
				}
				path:     "/"
				pathType: "Prefix"
			}]
		}]
	}
}