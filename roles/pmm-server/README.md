## PMM Server

PMM (Percona Monitoring and Management) servers. Installed via Docker.

https://www.percona.com/software/database-tools/percona-monitoring-and-management


### Requirements

Ubuntu is required.


### Dependencies

Depends on these roles:

- docker


### Tags

Tags:

- `pmm-server-upgrade`: upgrade pmm-server container.


### Examples

Completely apply pmm-server role:

```
ansible-playbook -i production --tag pmm-server production.yml
```


### Troubleshooting

#### Disk full

Add disk space. Then try to restart the server, there's a chance it will work:

```
ansible-playbook -i production --tag pmm-server-restart production.yml
```

If it doesn't work, Grafana is up, but no node is monitored. If so, you need to
delete existing containers and volumes, and recreate everything.

```
docker system prune -af --volumes
```

Then re-apply PMM-server. You may also need to reapply existing PMM clients.

