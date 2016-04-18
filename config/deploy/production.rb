# set :deploy_to, '/home/deploy/monmonhouse'
# set :stage, :production
# server '106.185.34.142', user: 'deploy', roles: %w{web app}

set :stage, :production
set :branch, "master"

set :server_name, 'localhost'
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"


server '104.199.129.36', user: 'deploy', roles: %w{web app db}, primary: true
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

set :rails_env, :production

set :unicorn_worker_count, 5

set :enable_ssl, false

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
# role :app, %w{deploy@106.185.34.142}
# role :web, %w{deploy@106.185.34.142}
# role :db,  %w{deploy@106.185.34.142}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
 set :ssh_options, {
   keys: %w(/home/deploy/.ssh/authorized_keys),
   forward_agent: false
 }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options