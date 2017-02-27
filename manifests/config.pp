# zookeeper config
class zookeeper::config {
  require ::zookeeper::install
   
  file { $::zookeeper::cfg_dir:
        ensure => directory,
        owner => $::zookeeper::user,
	group => $::zookeeper::group,
	recurse => true,
	mode => '0644',
    }

    file { $::zookeeper::log_dir:
	ensure => directory,
	owner => $::zookeeper::user,
	group => $::zookeeper::group,
	recurse => false,
	mode => '0644',
    }

    file { $::zookeeper::datastore:
        ensure  => directory,
        owner   => $::zookeeper::user,
        group   => $::zookeeper::group,
        mode    => '0644',
        recurse => false, # intentionally, puppet run would take too long #41
    }
    
    file { "${::zookeeper::cfg_dir}/myid":
	ensure => file,
	content => template("${module_name}/conf/myid.erb"),
	owner => $::zookeeper::user,
	group => $::zookeeper::group,
	mode => '0644'
    }

    file { "${::zookeeper::datastore}/myid":
	ensure => 'link',
	target => "${::zookeeper::cfg_dir}/myid"
    }

    file { "${::zookeeper::cfg_dir}/zoo.cfg":
	ensure => file,
	content => template("${module_name}/conf/zoo.cfg.erb"),
	owner   => $::zookeeper::user,
        group   => $::zookeeper::group,
        mode    => '0644',
    }

}

