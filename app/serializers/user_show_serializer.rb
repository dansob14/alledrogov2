class UserShowSerializer < UserSerializer
    attributes :email, :address, :post_code, :city
end