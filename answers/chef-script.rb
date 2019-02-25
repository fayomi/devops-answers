#install httpd package
package "httpd" do
  action :install
end

# set httpd to be enabled at boot time
service "httpd" do
  action [:enable, :start]
end

#permission modification
file '/etc/motd' do
  content 'Hello world'
  owner 'root'
  group 'root'
  mode '0644'
end


# Create a unix group
group "fayomi.fashanu" do
     gid 20002
end

# create a unix username called your firstname.lastname using the 'user' Chef resource
user "fayomi.fashanu" do
     comment "Unix User"
     uid 20002
     gid 20002
     shell "/bin/bash"
     password "$1$UI2ac8Lp$8KNrmrGHnbnsx4S6/HIb01"
end

# using Chef, create a cronjob that executes a test command that runs every day at 5.45 AM
cron 'cron_test' do
  action :create
  minute '45'
  hour '5'
  weekday '*'
  user 'fayomi.fashanu'
  command "echo Hello"
end

# set the timezone to Europe/London
timezone 'Europe/London' do
  timezone      "Europe/London"
  action        :set
end