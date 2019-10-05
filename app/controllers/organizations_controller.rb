# frozen_string_literal: true

class OrganizationsController < ApplicationController
  def new
    @form = OrganizationForm.new
  end

  def create
    form = OrganizationForm.new(form_params)
    if form.save
      flash[:success] = 'Organization has been created'
    else
      flash[:error] = form.errors.full_messages.join(', ')
    end
    redirect_to new_organization_path
  end

  private

  def form_params
    params.require(:organization_form).permit(
      :name, :user_name, :user_email
    )
  end
end
