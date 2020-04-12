# jenkins.rb
#
# Creates a fact 'jenkins_plugins' containing a comma-delimited string of all
# jenkins plugins + versions.
require 'facter'
require_relative '../puppet/jenkins/plugins'

Facter.add(:jenkins_plugins) do
  confine kernel: %w[Linux OpenBSD]
  setcode do
    plugins = Puppet::Jenkins::Plugins.available
    plugins.keys.sort.map { |plugin| "#{plugin} #{plugins[plugin][:plugin_version]}" }.join(', ')
  end
end
