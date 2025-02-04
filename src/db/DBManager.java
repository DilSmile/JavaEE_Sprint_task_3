package db;

import servlets.User;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;



public class DBManager {



    private static Connection connection;

    static {

        try{

            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(

                    "jdbc:postgresql://localhost:5432/postgres",

                    "postgres", "676803");
            System.out.println("Database connected successfully!");
        }catch (Exception e){

            e.printStackTrace();

        }

    }



    public static User getUser(String email){
        User user = null;
        System.out.println(email);
        try{
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ? LIMIT 1");

            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                user = new User();

                user.setEmail(resultSet.getString("email"));
                System.out.println(user.getEmail());

                user.setId(resultSet.getLong("id"));
                System.out.println(user.getId());

                user.setPassword(resultSet.getString("password"));
                System.out.println(user.getPassword());

                user.setFullName(resultSet.getString("full_name"));
                System.out.println(user.getFullName());

            }
            System.out.println(user.toString());
            statement.close();

        }catch (Exception e){

            e.printStackTrace();

        }

        return user;

    }

    public static Connection getConnection() {
        return connection;
    }
}
