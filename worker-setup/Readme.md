## Adding a new worker
### Master node
1. Add new worker hostname and ip to /etc/hosts
2. Add new worker hostname to /usr/local/hadoop/conf/slaves file
3. Copy setup.sh to worker node
4. SSH to worker node
### Worker node
5. Switch to root `sudo -i`
6. Execute setup.sh
7. Exit back to master node
### Master node
8. Run `copy-hadoop.sh <new worker hostname>`
9. Add new worker hostname to array in copy-files.sh and run copy-files.sh
10. Restart cluster using cluster management scripts.
