# frozen_string_literal: true

class HaikuReflex < ApplicationReflex
  delegate :current_user, to: :connection

  # Add Reflex methods in this file.
  #
  # All Reflex instances include CableReady::Broadcaster and expose the following properties:
  #
  #   - connection  - the ActionCable connection
  #   - channel     - the ActionCable channel
  #   - request     - an ActionDispatch::Request proxy for the socket connection
  #   - session     - the ActionDispatch::Session store for the current visitor
  #   - flash       - the ActionDispatch::Flash::FlashHash for the current request
  #   - url         - the URL of the page that triggered the reflex
  #   - params      - parameters from the element's closest form (if any)
  #   - element     - a Hash like object that represents the HTML element that triggered the reflex
  #     - signed    - use a signed Global ID to map dataset attribute to a model eg. element.signed[:foo]
  #     - unsigned  - use an unsigned Global ID to map dataset attribute to a model  eg. element.unsigned[:foo]
  #   - cable_ready - a special cable_ready that can broadcast to the current visitor (no brackets needed)
  #   - reflex_id   - a UUIDv4 that uniquely identies each Reflex
  #
  # Example:
  #
  #   before_reflex do
  #     # throw :abort # this will prevent the Reflex from continuing
  #     # learn more about callbacks at https://docs.stimulusreflex.com/lifecycle
  #   end
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com/reflexes#reflex-classes

  def filter
    @filtered_user = User.find(element.dataset["filter-user-id"])
    @haikus = @filtered_user.haikus.includes(:user).order(created_at: :desc)
    @filter_users = @haikus.map(&:user).uniq
    update_haikus_and_dropdown
  end

  def unfilter
    @filtered_user = nil
    @haikus = Haiku.all.includes(:user).order(created_at: :desc)
    @filter_users = @haikus.map(&:user).uniq
    update_haikus_and_dropdown
  end

  private

  def update_haikus_and_dropdown
    morph ".haikus-list", "<div class=\"haikus-list\">" + render(partial: "haikus/haiku", collection: @haikus, cached: true) + "</div>"
    morph ".filter-users", "<div class=\"navbar-dropdown filter-users\">" + render(partial: "users/filter_users_dropdown", locals: { filtered_user: @filtered_user, filter_users: @filter_users }) + "</div>"
  end
end
