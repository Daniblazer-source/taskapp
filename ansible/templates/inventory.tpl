[control]
%{ for name, ip in control ~}
${ip} ansible_user=ubuntu node_name=${name}
%{ endfor ~}

[workers]
%{ for name, ip in workers ~}
${ip} ansible_user=ubuntu node_name=${name}
%{ endfor ~}

[k3s_cluster:children]
control
workers