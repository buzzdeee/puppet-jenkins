
module Puppet
  module Jenkins
    # @return [String] Full path to the Jenkins user's home directory
    def self.home_dir
      if Facter.value(:osfamily) == 'OpenBSD'
        return File.expand_path('~_jenkins')
      else
        return File.expand_path('~jenkins')
      end
    rescue ArgumentError
      # The Jenkins user doesn't exist!
      return nil
    end

    # @return [String] Full path to the Jenkins user's plugin directory
    def self.plugins_dir
      if Facter.value(:osfamily) == 'OpenBSD'
        return File.join(home_dir, '.jenkins', 'plugins')
      else
        return File.join(home_dir, 'plugins')
      end
    end
  end
end
