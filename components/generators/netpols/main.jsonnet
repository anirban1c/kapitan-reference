local kap = import 'lib/kap.libsonnet';
local utils = kap.utils;
local p = kap.parameters;

local netpols = kap.utils.objectGet(p, 'netpols', {});



{
  [netpol_name + '-netpols']: 
  local netpol = netpols[netpol_name];
  kap.K8sNetpols(netpol_name)
    .WithNamespace(p.namespace)
    .WithAnnotations(utils.objectGet(netpol, 'annotations', {}))
    .WithPolicytypes(utils.objectGet(netpol, 'policies', {},))
    .WithPodSelector(utils.objectGet(netpol, 'podSelector', {},))
  for netpol_name in std.objectFields(netpols)
} 