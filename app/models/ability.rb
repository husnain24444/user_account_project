class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'user'
      can :read, Account, user_id: user.id
      can :update, Account, user_id: user.id
    else
      can :read, :all
    end
  end
end
