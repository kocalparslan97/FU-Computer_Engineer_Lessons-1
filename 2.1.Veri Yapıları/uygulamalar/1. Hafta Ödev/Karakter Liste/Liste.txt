
package linkedlist;

public class Liste {
    private Dugum ilk,son;
    Liste(){
        this.ilk=null;
        this.son=null;
    }
    
    void basaEkle(Dugum ch){
        if(ilk==null){
            this.ilk=ch;
            this.son=ch;
        }
        else{
            ilk.onceki=ch;
            ch.sonraki=ilk;
            ilk=ch;
        }
    }
    
    void sonaEkle(Dugum ch){
        if(son==null){
            this.ilk=ch;
            this.son=ch;
        }
        else{
            son.sonraki=ch;
            ch.onceki=son;
            son=ch;
        }
    }
    
    void elemanEkle(int n,Dugum ch){
        Dugum gez=ilk;
        for (int i = 1; i < n; i++) {
            gez=gez.sonraki;
        }
        
        if(gez.onceki==null){
            basaEkle(ch);
        }
        else if(gez.sonraki==null){
            sonaEkle(ch);
        }
        else{
            gez.onceki.sonraki=ch;
            ch.onceki=gez.onceki;
            ch.sonraki=gez;
            gez.onceki=ch;
        }
        
    }
    
    void bastanSil(){
        ilk.sonraki.onceki=null;
        ilk=ilk.sonraki;
    }
    
    void sondanSil(){
        son.onceki.sonraki=null;
        son=son.onceki;
    }
    
    void elemanSil(int n){
        Dugum gez=ilk;
        for (int i = 1; i < n; i++) {
            gez=gez.sonraki;
        }
        
        if(gez.onceki==null){
            bastanSil();
        }
        else if(gez.sonraki==null){
            sondanSil(); 
        }
        else{
            gez.onceki.sonraki=gez.sonraki;
            gez.sonraki.onceki=gez.onceki;
        }
        
    }
    int elemanSayisi(){
        int sayac=0;
        Dugum gez=ilk;
        if (ilk != null) {
            while (gez.sonraki != null) {
                sayac++;
                gez = gez.sonraki;
            }
            
        }
        else{
            sayac=-1;
        }
        return sayac + 1;
    }
    
    void yazdir(){
        Dugum gez=ilk;
        int elemansayisi=elemanSayisi();
        for (int i = 0; i < 5; i++) {
            System.out.print(gez.karakter);
            gez=gez.sonraki;
        }
    }
}
