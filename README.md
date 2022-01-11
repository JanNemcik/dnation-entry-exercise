# Tasks

## Bonuses

- dnation Monitoring

unable to setup due to foloowing error while trying to install using Helm:
Error: INSTALLATION FAILED: failed post-install: timed out waiting for the condition

- nginx HPA

```bash
kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://nginx; done"
```