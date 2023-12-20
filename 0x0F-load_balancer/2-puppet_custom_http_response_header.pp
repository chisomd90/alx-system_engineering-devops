# 2-puppet_custom_http_response_header.pp

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define custom header value
$custom_header_value = $::hostname

# Configure Nginx with custom header
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => "http {\n  add_header X-Served-By $custom_header_value;\n}\n",
  notify  => Service['nginx'],
}

# Restart Nginx to apply changes
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/nginx.conf'],
}

