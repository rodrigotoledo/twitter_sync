class UserSyncJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.sync_all
  end
end
