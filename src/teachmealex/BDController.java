package teachmealex;

import java.sql.*;
import java.util.ArrayList;

public class BDController {
    private Connection connection;
    private PreparedStatement existePesp;
    private PreparedStatement existePespDiccionario;
    private PreparedStatement existePingDiccionario;
    private PreparedStatement existePalabra;
    private PreparedStatement existeVerbo;
    private PreparedStatement existeUsuario;

    public BDController(){
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/teachmealex", "root","");
            String SQLExistePesp = "select * from palabra where nEsp = ?";
            this.existePesp = connection.prepareStatement(SQLExistePesp);
            String SQLExistePalabra = "select * from palabra where nEsp = ? or nIng = ?";
            this.existePalabra = connection.prepareStatement(SQLExistePalabra);
            String SQLExisteVerbo = "select * from verbos where verb = ? or past = ? or present = ?";
            this.existeVerbo = connection.prepareStatement(SQLExisteVerbo);
            String SQLExistePespDiccionario = "select * from desp where palabra = ?";
            this.existePespDiccionario = connection.prepareStatement(SQLExistePespDiccionario);
            String SQLExistePingDiccionario = "select * from ding where word = ?";
            this.existePingDiccionario = connection.prepareStatement(SQLExistePingDiccionario);
            String SQLExisteUsuario = "select * from users where name = ? and password = ?";
            this.existeUsuario = connection.prepareStatement(SQLExisteUsuario);
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
    }

    public void altaPalabra(Palabra palabra){
        String sql = "insert into palabra values ('"+palabra.getEsp()+"','"+palabra.getIng()+"')";
        try {
            Statement ms = this.connection.createStatement();
            ms.executeUpdate(sql);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
    }
    public void altaVerbo(Verbo verbo){
        String sql = "insert into verbos values ('"+verbo.getVerb()+"','"+verbo.getPresent()+"', '"+verbo.getPast()+"')";
        try {
            Statement ms = this.connection.createStatement();
            ms.executeUpdate(sql);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error "+e.getMessage());
        }
    }
    public void bajaPalabra(String palabra){
        String sql = "delete from palabra where nIng = '"+palabra+"' or nEsp = '"+palabra+"';";
        try {
            Statement ms = connection.createStatement();
            ms.executeUpdate(sql);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error :( "+e.getMessage());
        }
    }
    public void bajaVerbo(String palabra){
        String sql = "delete from verbos where verb = '"+palabra+"' or present = '"+palabra+"' or past = '"+palabra+"';";
        try {
            Statement ms = connection.createStatement();
            ms.executeUpdate(sql);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error! "+e.getMessage());
        }
    }

    public ArrayList<Palabra> damePalabras(){
        ArrayList<Palabra> palabras = new ArrayList<Palabra>();
        try {
            Statement miStatement = this.connection.createStatement();
            ResultSet rs=miStatement.executeQuery("SELECT * FROM palabra order by category asc");
            while(rs.next()){
                palabras.add(new Palabra(rs.getString("nEsp"),rs.getString("nIng"),rs.getString("category")));
            }
            miStatement.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error al generar el ArrayList de palabras en BDController "+e.getMessage());
        }
        return palabras;
    }

    public ArrayList<Verbo> dameVerbos(){
        ArrayList<Verbo> verbos = new ArrayList<Verbo>();
        try {
            Statement miStatement = this.connection.createStatement();
            ResultSet rs=miStatement.executeQuery("SELECT * FROM verbos order by verb asc");
            while(rs.next()){
                verbos.add(new Verbo(rs.getString("verb"),rs.getString("present"),rs.getString("past")));
            }
            miStatement.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error al generar el ArrayList de verbos en BDController "+e.getMessage());
        }
        return verbos;
    }

    public ArrayList<Palabra> palabrasRandom(){
        ArrayList<Palabra> palabras = new ArrayList<>();
        String sql = "select * from palabra order by rand()";
        try {
            Statement ms = connection.createStatement();
            ResultSet rs = ms.executeQuery(sql);
            while (rs.next()){
                palabras.add(new Palabra(rs.getString("nEsp"), rs.getString("nIng")));
            }
            rs.close();
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }

        return palabras;
    }
    public ArrayList<Verbo> verbosRandom(){
        ArrayList<Verbo> verbos = new ArrayList<>();
        String sql = "select * from verbos order by rand()";
        try {
            Statement ms = connection.createStatement();
            ResultSet rs = ms.executeQuery(sql);
            while (rs.next()){
                verbos.add(new Verbo(rs.getString("verb"), rs.getString("present"),rs.getString("past")));
            }
            rs.close();
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }

        return verbos;
    }
    public Palabra traductorPalabra(String palabra){
        String sql = "select * from palabra where nEsp = '"+palabra+"' or nIng = '"+palabra+"'";
        Palabra palabra1 = new Palabra();
            try {
                Statement ms = connection.createStatement();
                ResultSet rs = ms.executeQuery(sql);
                while (rs.next()) {
                    palabra1.setEsp(rs.getString("nESP"));
                    palabra1.setIng(rs.getString("nIng"));
                }
                rs.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e.getMessage());
            }
        return palabra1;
    }
    public Verbo traductorVerbo(String palabra){
        String sql2 = "select * from verbos where verb = '"+palabra+"' or present = '"+palabra+"' or past = '"+palabra+"'";
        Verbo verbo = new Verbo();
        try {
            Statement ms = connection.createStatement();
            ResultSet rs = ms.executeQuery(sql2);
            while (rs.next()) {
                verbo.setVerb(rs.getString("verb"));
                verbo.setPresent(rs.getString("present"));
                verbo.setPast(rs.getString("past"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return verbo;
    }


    public long tiempoEstudio(){
        long tiempo = 0;
        String sql = "select tiempoEstudio from estadisticas;";
        try {
            Statement ms = this.connection.createStatement();
            ResultSet rs = ms.executeQuery(sql);
            while (rs.next()){
                tiempo = rs.getLong(1);
            }
        }catch (SQLException e){
            System.out.println("Error!! "+e.getMessage());
        }
        return tiempo;
    }
    public long tiempoEstVoca(){
        long tiempo = 0;
        String sql = "select tiempoEstVoca from estadisticas;";
        try {
            Statement ms = this.connection.createStatement();
            ResultSet rs = ms.executeQuery(sql);
            while (rs.next()){
                tiempo = rs.getLong(1);
            }
        }catch (SQLException e){
            System.out.println("Error!!! "+e.getMessage());
        }
        return tiempo;
    }
    public long tiempoEstVerb(){
        long tiempo = 0;
        String sql = "select tiempoEstVerb from estadisticas;";
        try {
            Statement ms = this.connection.createStatement();
            ResultSet rs = ms.executeQuery(sql);
            while (rs.next()){
                tiempo = rs.getLong(1);
            }
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        return tiempo;
    }
    public void insertarTiempo(long tiempo, long voca, long verb){
        String sql = "update estadisticas set tiempoEstudio = "+tiempo+";";
        try {
            Statement ms = this.connection.createStatement();
            ms.executeUpdate(sql);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error  "+e.getMessage());
        }
        String sql2 = "update estadisticas set tiempoEstVoca = "+voca+";";
        try {
            Statement ms = this.connection.createStatement();
            ms.executeUpdate(sql2);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error    "+e.getMessage());
        }
        String sql3 = "update estadisticas set tiempoEstVerb = "+verb+";";
        try {
            Statement ms = this.connection.createStatement();
            ms.executeUpdate(sql3);
            ms.close();
        }catch (SQLException e){
            System.out.println("Error!!!!"+e.getMessage());
        }
    }

    public boolean existePesp(String palabra){
        boolean existe = true;
        try {
            existePesp.setString(1,palabra);
            ResultSet rs = existePesp.executeQuery();
            if (!rs.first()){
                existe = false;
            }
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        return existe;
    }
    public boolean existeUsuario(String palabra, String password){
        boolean existe = true;
        try {
            existeUsuario.setString(1,palabra);
            existeUsuario.setString(2,password);
            ResultSet rs = existeUsuario.executeQuery();
            if (!rs.first()){
                existe = false;
            }
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        return existe;
    }
    public boolean existePalabra(String palabra){
        boolean existe = true;
        try {
            existePalabra.setString(1,palabra);
            existePalabra.setString(2,palabra);
            ResultSet rs = existePalabra.executeQuery();
            if (!rs.first()){
                existe = false;
            }
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        return existe;
    }
    public boolean existeVerbo(String palabra){
        boolean existe = true;
        try {
            existeVerbo.setString(1,palabra);
            existeVerbo.setString(2,palabra);
            existeVerbo.setString(3, palabra);
            ResultSet rs = existeVerbo.executeQuery();
            if (!rs.first()){
                existe = false;
            }
        }catch (SQLException e){
            System.out.println("Error: "+e.getMessage());
        }
        return existe;
    }
    public boolean existePDiccionario(String diccionario,String palabra){
        boolean existe = true;
        try {
            if (diccionario.equalsIgnoreCase("desp")) {
                existePespDiccionario.setString(1, palabra);
                ResultSet rs = existePespDiccionario.executeQuery();
                if (!rs.first()) {
                    existe = false;
                }
            }else {
                existePingDiccionario.setString(1, palabra);
                ResultSet rs = existePingDiccionario.executeQuery();
                if (!rs.first()) {
                    existe = false;
                }
            }
        }catch (SQLException e){
            System.out.println("Error en palabra: "+e.getMessage());
        }
        return existe;
    }
}
