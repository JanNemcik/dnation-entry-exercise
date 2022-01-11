# Tasks

## 1 Solve programatical problem

- dir: *exercise*

To solve this problem I needed to run some kind of lowest cost alghoritm between two cells in matrix.
Since I already knew about dijsktra or BFS, I transformed the input matrix into acyclic directed graph using  *networkx* library. Then I run dijskra algorithm on the graph to find lowest cost between source and target points.

## 2 Create k8s cluster

- dir: *kubespray*

To deploy kube cluster, I firstly created the vm's using terraform. Then I used [*kubespray*](http://kubespray.io) to deploy the cluster to the vms. I used basic setup, just allowed metrics-server for HPA purposes. 

## 3 Deploy app into cluster

- dir: *kubernetes/nginx*


## Bonuses

### dnation Monitoring

unable to setup due to foloowing error while trying to install using Helm:
Error: INSTALLATION FAILED: failed post-install: timed out waiting for the condition

### nginx HPA

- dir: *kubernetes/nginx*

```bash
kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://nginx; done"
```

### terraform

- dir: *provision*

### hetzner csi driver

- dir: *kubernetes/csi-verify*
- ref: https://github.com/hetznercloud/csi-driver/blob/master/README.md#versioning-policy