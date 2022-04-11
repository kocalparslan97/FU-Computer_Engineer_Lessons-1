package cember;
public class Cember {

    double yaricap;
    static int say = 0;
    Cember() {
        yaricap = 1.0;
        say++;
    }
    Cember(double yc) {
        yaricap = yc;
        say++;
    }

    double Cevre() {
        return 2 * Math.PI * yaricap;
    }
    double alan() {
        return Math.PI * yaricap * yaricap;
    }
    public static void main(String[] args) {
        Cember a = new Cember();
        Cember b = new Cember(2.1);
        System.out.println(a.Cevre());
        System.out.println(b.alan());
        System.out.println(Cember.say);
    }
}
