
module Puppet
  module Jenkins
    # @return [String] Full path to the Jenkins user's home directory
    def self.home_dir
      File.expand_path('~jenkins')
      return unless Facter.value(:osfamily) == 'OpenBSD'
      File.expand_path('~_jenkins')
    rescue ArgumentError
      # The Jenkins user doesn't exist!
      return nil
    end

    # @return [String] Full path to the Jenkins user's plugin directory
    def self.plugins_dir
      File.join(home_dir, 'plugins')
      return unless Facter.value(:osfamily) == 'OpenBSD'
      File.join(home_dir, '.jenkins', 'plugins')
    end
  end
end
