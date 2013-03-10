AutobindParentObject::App.controllers :bar, parent: :foo do
  get :index do
    "I'm index @ bar and foo is #{@foo.id}."
  end
end
