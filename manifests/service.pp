# Class: zookeeper::service
class zookeeper::service {
  require ::zookeeper::install

  file {"/etc/init.d/${::zookeeper::service_name}":
     ensure  => present,
     content => template("${module_name}/conf/init.erb"),
     mode    => '0755',
     before  => Service[$::zookeeper::service_name],
     notify  => Service[$::zookeeper::service_name]
  }

  service { $::zookeeper::service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => [
      Class['::zookeeper::install'],
      File["${::zookeeper::cfg_dir}/zoo.cfg"]
    ],
    subscribe  => [
      File["${::zookeeper::cfg_dir}/myid"], File["${::zookeeper::cfg_dir}/zoo.cfg"],
    ]

  }
}
