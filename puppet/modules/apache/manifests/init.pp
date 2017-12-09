class apache {

	package {"apache2":
		ensure => 'installed',
		allowcdrom => 'true',
	}

	file { "/etc/apache2/mods-enabled/userdir.conf":
		ensure => "link",
		target => "/etc/apache2/mods-available/userdir.conf",
		require => Package["apache2"],
		notify => Service["apache2"],	
	}

	file { "/etc/apache2/mods-enabled/userdir.load":
		ensure => "link",
		target => "/etc/apache2/mods-available/userdir.load",
		require => Package["apache2"],
		notify => Service["apache2"],
	}

	service {"apache2":
		ensure => "running",
		enable => "true",
		require => Package["apache2"],
	}
	
	file {"/var/www/html/index.html":
		ensure => file,
		content => template('apache/index.html'),
		require => Package["apache2"],		
	}
	package {"php":
		ensure => "installed",
		allowcdrom => "true",
		require => Package["apache2"],
	}
	package {"libapache2-mod-php":
		ensure => "installed",
		allowcdrom => "true",
		require => Package["apache2","php"],
		notify => Service["apache2"],
	}
	file { "/etc/apache2/mods-available/php7.0.conf":
                ensure => "file",
                content => template('apache/php7.0.conf'),
                require => Package["apache2","php"],
                notify => Service["apache2"],
        }
	file { "/etc/apache2/mods-enabled/php7.0.conf":
                ensure => "link",
                target => "/etc/apache2/mods-available/php7.0.conf",
                require => Package["apache2","php"],
                notify => Service["apache2"],
        }

        file { "/etc/apache2/mods-enabled/php7.0.load":
                ensure => "link",
                target => "/etc/apache2/mods-available/php7.0.load",
                require => Package["apache2","php"],
                notify => Service["apache2"],
	}
	
	package {'mysql-server':
		ensure => 'installed',
		root => ['root_password' => 'auto'],
		allowcdrom => "true",

	}
	
	service { 'mysql':
		ensure  => 'true',
		enable  => 'true',
		require => Package['mysql-server'],
	}
	
	package {'php-mysql':
		ensure => 'installed',
		allowcdrom => "true",
		require => Package['mysql-server'],
	}	
}
