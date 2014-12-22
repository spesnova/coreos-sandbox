require "spec_helper"

#
# Checks for etcd.service
#
describe command("systemctl status etcd.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for fleet.service
#
describe command("systemctl status fleet.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

describe command("fleetctl list-machines --no-legend | wc -l") do
  its(:stdout) { should match /^3$/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for docker.service
#
describe command("systemctl status docker.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for ntpd.service
#
describe command("systemctl status ntpd.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for Timezone
#
describe command("timedatectl status") do
  its(:stdout) { should match /Asia\/Tokyo/ }
end

describe command("date") do
  its(:stdout) { should match /JST/ }
end
