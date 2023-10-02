# Update_package_information
exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => ['/usr/bin', '/bin'],
}

# Install_Nginx_package
package { 'nginx':
  ensure => installed,
}

# Create_a_basic HTML_file
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# Configure_Nginx to_add_the custom_HTTP_header
file_line { 'add custom header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'server_name _;',
}

# Ensure_Nginx_is_running
service { 'nginx':
  ensure => running,
}
