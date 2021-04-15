######### End of Dev1 ############

######### SSH ############
#SSH into IP address as Dev user and then execute command sudo su to become root
ssh-bastion-root () {
  ssh -t dev@96.102.197.218 "sudo su"
}
#SSH into bastion host as dec user, execute the command to become root, and then run another ssh command using a key and as a new user against an ip address
ssh-dev2-redirector1 () {
  ssh -t dev@96.102.197.218 "sudo su -c 'ssh -i /home/plume/.ssh/pem_key newuser@96.102.197.182'"
}


######### End of SSH ############

######### Tunneling ##########
#Tunnel into bastion host 96.102.197.218 as dev user using jump command and then from localhost and port 5010 connect
# to ip address X on port 8088 and run in the background.
tunnel-spark-data-pipeline-cluster () {
  jump dev@96.102.197.218 -l dev -L localhost:5010:172.16.1.32:8088 -q -C -N -T dev@96.102.197.218 &
}

tunnel-mongodDB() {
  jump dev@96.102.181.62 -l dev -L localhost:5081:chi-dev-us-west-2-mocha.cluster-csisxinzw91i.us-west-2.docdb.amazonaws.com:27017  -q -C -N -T dev@96.102.181.62 &
}
tunnel-document-db() {
  jump dev@96.102.181.62 -l dev -L localhost:5080:172.16.1.206:27017 -q -C -N -T dev@96.102.181.62 &
}
tunnel-global-inventory () {
   jump dev@96.102.197.218 -l dev -L localhost:5090:172.16.1.221:27017 -q -C -N -T dev@96.102.197.218 &
}
######### End of Tunneling ##########
