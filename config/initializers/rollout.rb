require 'redis'

$redis = Redis.new
$rollout = Rollout.new($redis)

#$rollout.define_group(:beta_users) do |user|
  #user.beta_user?
#end
