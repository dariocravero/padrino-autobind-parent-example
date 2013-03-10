AutobindParentObject::App.controllers :bar, parent: :foo do
  get :index do
    "I'm index @ foo/bar and foo is #{@foo.id}."
  end

  get :index, parent: :quux do
    "I'm index @ foo/quux/bar, foo is #{@foo.id} and quux is #{@quux.id}."
  end
end
