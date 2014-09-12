require "spec_helper"

#
# Checks for systemd-journald.service
#
describe command("systemctl status systemd-journald.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for journal-router
#
describe command("systemctl status journal-router-short.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

describe command("systemctl status journal-router-json.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

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

#
# Checks for registry.service
#
describe command("systemctl status registry.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

describe command("docker ps | grep registry") do
  its(:stdout) { should match /Up/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for logspout.service
#
describe command("systemctl status logspout.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

describe command("docker ps | grep logspout") do
  its(:stdout) { should match /Up/ }
  its(:exit_status) { should eq 0 }
end

describe command("curl -I localhost:8000/logs") do
  its(:stdout) { should match /200/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for dd-agent.service
#
describe command("systemctl status dd-agent.service") do
  its(:stdout) { should match /active \(running\)/ }
  its(:exit_status) { should eq 0 }
end

describe command("docker ps | grep dd-agent") do
  its(:stdout) { should match /Up/ }
  its(:exit_status) { should eq 0 }
end

#
# Checks for docker-enter
#
describe file("/opt/bin/docker-enter") do
  it { should be_file }
  it { should be_executable }
  its(:content) { should match /NSENTER=nsenter/ }
end

describe command("docker-enter") do
  its(:exit_status) { should be }
  its(:exit_status) { should eq 0 }
end
