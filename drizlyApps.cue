package kube

import (
	drizlyApp_v1alpha1 "github.com/mikekantzer-drizly/cue-testing/schema/drizlyApp/v1alpha1"
)

drizlyApp: drizlyApp_v1alpha1.#DrizlyApp // | drizlyApp_v1alpha2.#DrizlyApp

for a in drizlyApp.spec.always if drizlyApp.apiVersion == "v1alpha1" {
	kubernetes: {
		deployment: "\(drizlyApp.metadata.name)-\(a.name)": {
			metadata: labels: {
				repo: drizlyApp.metadata.labels.repo
				team: drizlyApp.metadata.labels.team
				env:  drizlyApp.metadata.labels.env
			}
			spec: {
				replicas: a.replicas
				template: spec: containers: [{
					name:  a.name
					image: "\(a.imageName):\(a.imageTag)"
					env: [ for k, v in a.env {
						name:  k
						value: v
					}]
				}]
			}
		}
	}
}
