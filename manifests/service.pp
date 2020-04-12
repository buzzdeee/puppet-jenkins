# Class: jenkins::service
#
class jenkins::service {
  assert_private()

  service { 'jenkins':
    ensure     => $jenkins::service_ensure,
    enable     => $jenkins::service_enable,
    provider   => $jenkins::service_provider,
    flags      => $jenkins::service_flags,
    hasstatus  => true,
    hasrestart => true,
  }

}
