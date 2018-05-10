package teachmealex;

public class Palabra {
    private String esp, ing, category, specialEsp, specialIng;
    private int codUsuario;

    public Palabra() {
    }

    public Palabra(String category, String specialEsp, String specialIng, int codUsuario) {
        this.category = category;
        this.specialEsp = specialEsp;
        this.specialIng = specialIng;
        this.codUsuario = codUsuario;
    }

    public Palabra(int codUsuario, String esp, String ing, String category){
        this.esp = esp;
        this.ing = ing;
        this.category = category;
        this.codUsuario = codUsuario;
    }

    public Palabra(String esp, String ing, String category) {
        this.esp = esp;
        this.ing = ing;
        this.category = category;
    }

    public Palabra(String esp, String ing) {
        this.esp = esp;
        this.ing = ing;
    }

    public Palabra(String specialEsp, String specialIng, int codUsuario) {
        this.specialEsp = specialEsp;
        this.specialIng = specialIng;
        this.codUsuario = codUsuario;
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

    public int getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getEsp() {
        return esp;
    }

    public void setEsp(String esp) {
        this.esp = esp;
    }

    public String getIng() {
        return ing;
    }

    public void setIng(String ing) {
        this.ing = ing;
    }
}
