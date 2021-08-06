package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDatabase {

    public static void main(String[] args) {
        final String projectPath = "C:\\p\\rockstars-be";
        final String jbdcUrl = "jdbc:sqlite:/"+projectPath+"\\rockstars-be-database\\src\\main\\java\\database\\rockstars.db";
        try {
            Connection connection = DriverManager.getConnection(jbdcUrl);
            String sql = "SELECT * FROM artist";

            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);

            while (result.next()) {
                String id = result.getString("id");
                String name = result.getString("name");
                System.out.println(id + " | " + name);
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to SQLITE database");
            e.printStackTrace();

        }
    }
}
