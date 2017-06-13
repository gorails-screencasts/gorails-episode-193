module TweetsHelper
  def editable?(tweet)
    $rollout.active?(:edit_tweet, current_user) &&
      tweet.user_id == current_user.id
  end
end
