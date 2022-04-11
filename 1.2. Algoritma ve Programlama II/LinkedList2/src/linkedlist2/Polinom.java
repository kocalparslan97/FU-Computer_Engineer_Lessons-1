package linkedlist2;

public class Polinom {

    Dugum ilk, son;

    Polinom() {
        this.ilk = null;
        this.son = null;
    }

    void ekle(Dugum yeni) {
        if (ilk == null) {
            ilk = yeni;
            son = yeni;
        } 
        else {
            Dugum gez = ilk;
            boolean dongu = true;
            while (dongu) {
                if (yeni.derece > ilk.derece) {
                    yeni.sonraki = ilk;
                    son = ilk;
                    ilk = yeni;
                    dongu = false;
                } 
                else if (son.derece > yeni.derece) {   
                    son.sonraki = yeni;
                    son = yeni;
                    dongu = false;
                } 
                else if (gez.derece > yeni.derece && yeni.derece > gez.sonraki.derece) {
                    yeni.sonraki = gez.sonraki;
                    gez.sonraki = yeni;
                    dongu = false;
                } 
                else {
                    gez = gez.sonraki;
                }
            }
        }

    }

    
    
    void yazdir() {
        Dugum gez = ilk;

        for (int i = 0; i < 5; i++) {
            System.out.print(gez.derece);
            gez = gez.sonraki;
        }
    }
}
