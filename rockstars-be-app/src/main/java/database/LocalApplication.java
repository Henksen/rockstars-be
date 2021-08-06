package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LocalApplication {

    public static void main(String[] args) {
        final String jbdcUrl = "jdbc:sqlite:/C:\\sqlite\\tools\\rockstars.db";
        try {
            Connection connection = DriverManager.getConnection(jbdcUrl);
            String sql = "SELECT * FROM artist";

            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);

            while (result.next()) {
                String id = result.getString("id");
                String artist = result.getString("artist");
                System.out.println(id + " | " + artist);
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to SQLITE database");
            e.printStackTrace();

        }
    }
}
