
```bash
docker run --rm -it --mount type=bind,source="$(pwd)"/inventory/hetzner,dst=/inventory \
  --mount type=bind,source="${HOME}"/.ssh/hetzner_id_rsa,dst=/root/.ssh/id_rsa \
  quay.io/kubespray/kubespray:v2.18.0 bash
# Inside the container you may now run the kubespray playbooks:
ansible-playbook -i /inventory/hosts.yml --private-key /root/.ssh/id_rsa cluster.yml
```