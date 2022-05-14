class TwitterMessage < ApplicationRecord
  belongs_to :user
  after_create do
    broadcast_prepend_to 'twitter_messages'
  end

  after_update do
    broadcast_update_to 'twitter_messages'
  end
  after_destroy_commit do
    broadcast_remove_to 'twitter_messages'
  end
end
