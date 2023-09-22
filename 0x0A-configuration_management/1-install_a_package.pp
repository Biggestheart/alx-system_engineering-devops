# Using_Puppet,_install_flask_from_pip3
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
