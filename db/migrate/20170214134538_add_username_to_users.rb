class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change  

  		add_column :users, :username, :string #Añadir nueva columna llamada username a la tabla users de tipo cadena
  		add_index :users, :username, unique: true # para que el usernme no se repita

  end
end
