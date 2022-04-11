
package cihazyayin;


interface CihazYayin {
    void ac();
    void kapat();
    void goster(String a);
}

class tv implements CihazYayin{

    @Override
    public void ac() {
        System.out.println("TV Açıldı");
    }

    @Override
    public void kapat() {
        System.out.println("TV Kapatıldı");
    }

    @Override
    public void goster(String a) {
        System.out.println("TV Gösteriyor: "+a);
    }

}

    class LCD implements CihazYayin{

    @Override
    public void ac() {
        System.out.println("LCD Açıldı");
    }

    @Override
    public void kapat() {
        System.out.println("LCD Kapatıldı");
    }

    @Override
    public void goster(String a) {
        System.out.println("LCD Gösteriyor: "+ a);    
    }
        
    class Projektor implements CihazYayin{
        @Override
        public void ac(){
            System.out.println("Projektör Açıldı");
        }

        @Override
        public void kapat() {
            System.out.println("Projektör Kapatıldı");
        }

        @Override
        public void goster(String a) {
            System.out.println("Projektör gösteriyor: "+a);
        }
    }

        public static void main(String[] args) {
            CihazYayin TV1= new tv();
            CihazYayin TV2= new tv();
            CihazYayin LCD1= new LCD();

            CihazYayin[] dizi=new CihazYayin[3];
            dizi[0]=TV1;
            dizi[1]=TV2;
            dizi[2]=LCD1;
        }
    }
