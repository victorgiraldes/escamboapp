class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access?
  end

  def edit?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end

  def permitted_attributes
    if user.full_access?
      [:name, :email, :role, :password, :confirm_password]
    else
      [:name, :email, :password, :confirm_password]
    end
  end


  class Scope < Scope
    def resolve
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
