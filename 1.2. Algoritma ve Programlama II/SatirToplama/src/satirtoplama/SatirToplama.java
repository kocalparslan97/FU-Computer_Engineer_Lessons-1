package satirtoplama;
import java.io.*;
import java.util.*;
public class SatirToplama {
// MERT İNCİDELEN - 170260101
    public static void main(String[] args) throws FileNotFoundException {
        File file = new File("C:\\Users\\Mert\\Desktop\\data2.dat");
        try (Scanner scan = new Scanner(file)) {
            int satir = 1;
            //Sonraki satıra geçiş için döngü
            while (scan.hasNextLine()) {
                int toplam = 0;
                String satirstr = scan.nextLine();
                String dizi[];
                dizi = satirstr.split(",");
                //Satırdaki eleman kadar dönerek her elemanı int çevirerek toplama dahil edecek
                for (int i = 0; i < dizi.length; i++) {
                    toplam += Integer.parseInt(dizi[i]);
                }
                System.out.println(satir+".satırdaki sayılar: "+satirstr);
                System.out.println(satir + ".satır toplamı:" + toplam+"\n");
                satir++;
            }
        }
        catch(Exception hata){
            System.out.println(hata+"\nBelirtilen dosya bozuk, silinmiş, ismi değiştirilmiş veya taşınmış olabilir.");
        }
    }
}
