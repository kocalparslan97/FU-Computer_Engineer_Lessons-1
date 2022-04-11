package dosyaokuma;
import java.io.*;
import java.util.Scanner;
public class DosyaOkuma {
    public static void main(String[] args) throws IOException {
        File dosya=new File("C:\\Users\\Mert\\Desktop\\data1.dat");
        int kelime=0;
        int satir=0;
        int karakter;
        //-----------------SATIR SAYMA-------------------
        Scanner okuma=new Scanner(dosya);
            while(okuma.hasNextLine()){
                okuma.nextLine();
                satir++;
            }            
        okuma.close();
        //-----------------KELİME SAYMA-------------------
        okuma=new Scanner(dosya);
            while (okuma.hasNext()){
                okuma.next();
                kelime++;
            }
        okuma.close();
        //------------------KARAKTER-----------------------
        karakter=(int)(dosya.length()-(2*(satir-1)));
        //-------------------YAZDIR------------------------
        System.out.println("Dosya ismi: "+dosya.getName());
        System.out.println("Karakter sayısı: "+karakter+" - Kelime sayısı: "+kelime+"  -  Satır sayısı: "+satir);
        }
    }
