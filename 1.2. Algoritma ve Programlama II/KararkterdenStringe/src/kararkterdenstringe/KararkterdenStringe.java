
package kararkterdenstringe;

import java.util.Scanner;

public class KararkterdenStringe {

    public static void main(String[] args) {
        Scanner klavye=new Scanner(System.in);
        String StringHali="";
        
        System.out.println("Kaç elemanlı karakter dizisi oluşturulacak?");
        int elemansayisi= klavye.nextInt();
        char dizi[]=new char[elemansayisi];
        
        for (int i = 0; i < elemansayisi; i++) {
            System.out.println((i+1)+". karakteri giriniz:");
            dizi[i]=klavye.next().charAt(0);
        }
        
        for (int i = 0; i < elemansayisi; i++) {
            StringHali=StringHali+dizi[i];
        }
        System.out.println("Girilen karakter dizisi stringe çevrildi: "+StringHali);
    }
    
}
