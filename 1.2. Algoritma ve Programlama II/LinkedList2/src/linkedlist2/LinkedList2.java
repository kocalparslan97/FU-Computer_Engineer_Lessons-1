
package linkedlist2;

public class LinkedList2 {

    public static void main(String[] args) {
        Polinom polinom=new Polinom();
        
        polinom.ekle(new Dugum(1,1));
        polinom.ekle(new Dugum(3,3));
        polinom.ekle(new Dugum(2,2));
       
        polinom.ekle(new Dugum(5,5));
        polinom.ekle(new Dugum(8,8));
        
        
        polinom.yazdir();
    }
    
}
