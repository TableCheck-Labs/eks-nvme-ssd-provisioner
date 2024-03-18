FROM debian:bookworm-slim

RUN  apt-get update && apt-get -y install nvme-cli mdadm && apt-get -y clean && apt-get -y autoremove
COPY eks-nvme-ssd-provisioner.sh /usr/local/bin/
COPY link-nvme-dir.sh /usr/local/bin/
COPY run-provisioning.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/link-nvme-dir.sh
RUN chmod +x /usr/local/bin/run-provisioning.sh

ENTRYPOINT ["run-provisioning.sh"]
