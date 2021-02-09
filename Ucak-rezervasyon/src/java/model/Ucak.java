/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author lenovo
 */
public class Ucak {
    private int iducak;
    private String kalkis;
    private String inis;
    private String tarih;

    public Ucak(int iducak, String kalkis, String inis, String tarih) {
        this.iducak = iducak;
        this.kalkis = kalkis;
        this.inis = inis;
        this.tarih = tarih;
                
        
        //throw new UnsupportedOperationException("Not supported yet.");
    }

    public Ucak(String kalkis, String inis, String tarih) {
        this.kalkis = kalkis;
        this.inis = inis;
        this.tarih = tarih;
       // throw new UnsupportedOperationException("Not supported yet.");
    }

    public int getIducak() {
        return iducak;
    }

    public void setIducak(int iducak) {
        this.iducak = iducak;
    }

    public String getKalkis() {
        return kalkis;
    }

    public void setKalkis(String kalkis) {
        this.kalkis = kalkis;
    }

    public String getInis() {
        return inis;
    }

    public void setInis(String inis) {
        this.inis = inis;
    }

    public String getTarih() {
        return tarih;
    }

    public void setTarih(String tarih) {
        this.tarih = tarih;
    }
}
