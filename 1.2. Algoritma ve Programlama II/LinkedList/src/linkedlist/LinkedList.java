package linkedlist;

public class LinkedList {

    public static void main(String[] args) {
        Liste liste=new Liste();
        liste.basaEkle(new Dugum('e'));
        liste.basaEkle(new Dugum('M'));
        liste.sonaEkle(new Dugum('r'));
        liste.sonaEkle(new Dugum('t'));
        liste.sonaEkle(new Dugum('t'));
        liste.elemanEkle(4,new Dugum('A'));
        System.out.println(liste.elemanSayisi());
        
        liste.yazdir();
    }
    
}
