# datetime.rb
# Return the date in Jeff's preferred format.
require 'facter'
Facter.add("datetime") do
  setcode do
     Facter::Util::Resolution.exec("date +%F")
  end
end

