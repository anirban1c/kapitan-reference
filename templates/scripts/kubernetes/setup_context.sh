#!/bin/bash
set -o nounset -o pipefail -o noclobber -o errexit
KUBECTL="kubectl"

{% set p = inventory.parameters %}

{% set cluster = p.cluster %}
{% if cluster.type == "gke" %}
${KUBECTL} config set-context {{p.target_name}} --cluster {{cluster.id}} --user {{cluster.user}} --namespace {{p.namespace}}
{% elif cluster.type == "kind" %}
${KUBECTL} config set-context {{p.target_name}} --cluster {{cluster.id}} --user {{cluster.user}} --namespace {{p.namespace}}
{% elif cluster.type == "microk8s" %}
${KUBECTL} config set-context {{p.target_name}} --cluster {{cluster.id}} --user {{cluster.user}} --namespace {{p.namespace}}
{% elif cluster.type == "aks" %}
${KUBECTL} config set-context {{p.target_name}} --cluster {{cluster.id}} --user {{cluster.user}} --namespace {{p.namespace}}
{% elif cluster.type == "iks" %}
${KUBECTL} config set-context {{p.target_name}} --cluster {{cluster.id}} --user {{cluster.user}} --namespace {{p.namespace}}
{% endif %}


