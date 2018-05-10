package teachmealex;

public class Palabra {
    private String esp, ing, category;
    private int codUsuario;

    public Palabra() {
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
