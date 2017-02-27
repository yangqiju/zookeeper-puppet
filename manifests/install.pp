# zookeeper install 
class zookeeper::install{
  package { 'zookeeper' :
    ensure => present,
  }
}
