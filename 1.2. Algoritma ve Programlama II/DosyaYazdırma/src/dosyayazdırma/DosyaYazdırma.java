package dosyayazdırma;
import java.io.*;
public class DosyaYazdırma {
    public static void main(String[] args) throws FileNotFoundException, IOException {
    File dosya = new File("dosya.txt");
    PrintWriter yazdir=new PrintWriter(dosya);
    int i=0;
        while(i<5){
            yazdir.print((int)(Math.random()*100)+" ");
            i++;
       }
    yazdir.close();
        System.out.println("Dodya oluşturuldu mu / mevcut mu?: "+dosya.exists());
        System.out.println("Dosyanın ismi ve uzantısı: "+dosya.getName());
        System.out.println("Dosya yolu: "+dosya.getAbsolutePath());
        System.out.println("Dosya okunabilir mi?: "+dosya.canRead());
        System.out.println("Dosyadaki rakam sayısı: "+(dosya.length()-i));
        
    }
}