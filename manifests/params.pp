# zookeeper params
class zookeeper::params {
    $ensure = present
    $user = 'zookeeper'
    $group = 'zookeeper'
    $client_ip = undef # $::ipaddress
    $client_port = 2181
    $cfg_dir = '/etc/zookeeper'
    $service_name = 'zookeeper'
    $datastore = '/var/lib/zookeeper'
    $election_port = 2888
    $id = '1'
    $init_limit = 10
    $leader = true
    $leader_port = 3888
    $log_dir = '/var/log/zookeeper'
    $servers = []
    $sync_limit = 5
    $tick_time = 2000
    $zoo_dir = '/opt/zookeeper'
    $zoo_main = 'org.apache.zookeeper.server.quorum.QuorumPeerMain'
}
