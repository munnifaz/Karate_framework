package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBConnector {

    public static Connection connectToDB(Map<Object, Object> config) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection(
                    String.format("jdbc:mysql://%s:%s/%s", config.get("host"), config.get("port"), config.get("db").toString()),
                    config.get("user").toString(),config.get("pswd").toString());
            return conn;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static List<Map<Object, Object>> getData(Map<Object, Object> config, String sqlQuery) {
        Connection conn = connectToDB(config);
        List<Map<Object, Object>> list = new ArrayList<>();
        try {
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sqlQuery);
            while(rs.next()) {
                Map<Object, Object> m = new HashMap<>();
                m.put(String.valueOf(0), rs.getString(1));
                m.put(String.valueOf(1), rs.getString(2));
                m.put(String.valueOf(2), rs.getString(3));
                m.put(String.valueOf(3), rs.getString(4));
                m.put(String.valueOf(4), rs.getString(5));
                list.add(m);
            }
            conn.close();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

}
