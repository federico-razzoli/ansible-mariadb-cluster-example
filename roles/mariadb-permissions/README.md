## MySQL Permissions

Create users and grant permissions in MySQL, or PXC, or MariaDB.


### Requirements

Ubuntu is required.


### Dependencies

None.


### Tags

Tags:

- `mysql-permissions`: Use this tag the first time, or after structural changes to this role.
- `mysql-permissions-update`: Update permissions by re-running SQL statements.


### Adding/removing permissions

- Make sure the target host, or group, has the `permission_group_set` variable set. Each item is the name of a permission group that applies to the target host/group.
- For each permission group name, create a file with in `templates/groups` callec `permission-group-name.sql.j2`.
- The file should contain `CREATE USER`, `ALTER USER`, `RENAME USER`, `DROP USER`, `CREATE ROLE`, `DROP ROLE`, `GRANT` or `REVOKE` SQL statements. If you understand Jinja2, you can use it in the file. Any valid SQL statement will be executed, but please only use the listed statements.
- For each host, you can optionally create a file in `templates/hosts`, called `host-alias.sql.j2`. The host alias used in the file name must be the same used in the inventory.
- You can optionally use Jinja2 in the SQL files. This would allow to create users defined in a list, or create users if a certain condition is met.

