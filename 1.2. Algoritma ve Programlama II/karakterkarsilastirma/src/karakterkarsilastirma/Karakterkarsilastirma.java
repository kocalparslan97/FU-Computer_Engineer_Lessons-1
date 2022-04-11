package karakterkarsilastirma;

import java.util.Scanner;

/**
 *
 * @author Mert
 */
public class Karakterkarsilastirma {

    public static void main(String[] args) {
        int i = 0;
        int j = 1;
        Scanner input = new Scanner(System.in);
        String kdizisi = input.nextLine();
        if (kdizisi.length() == 30) {
            for (int k = 0; k < 15; k++) {
                if (kdizisi.charAt(i) == kdizisi.charAt(j)) {
                    System.out.print(kdizisi.charAt(i));
                }
                i = i + 2;
                j = j + 2;
            }
        } else {
            System.out.println("Lütfen 30 adet karakter giriniz");
        }
    }

}
