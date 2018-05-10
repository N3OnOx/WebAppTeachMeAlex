package teachmealex;

public class PalabraEspecial {
    private String specialEsp, specialIng, category;
    private int codUsuario;

    public PalabraEspecial(String specialEsp, String specialIng, String category, int codUsuario) {
        this.specialEsp = specialEsp;
        this.specialIng = specialIng;
        this.category = category;
        this.codUsuario = codUsuario;
    }

    public PalabraEspecial(String specialEsp, String specialIng, String category) {
        this.specialEsp = specialEsp;
        this.specialIng = specialIng;
        this.category = category;
    }

    public String getSpecialEsp() {
        return specialEsp;
    }

    public void setSpecialEsp(String specialEsp) {
        this.specialEsp = specialEsp;
    }

    public String getSpecialIng() {
        return specialIng;
    }

    public void setSpecialIng(String specialIng) {
        this.specialIng = specialIng;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
    }
}
