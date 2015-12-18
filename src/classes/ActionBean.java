package classes;

import javax.xml.bind.annotation.*;

/**
 * Created by Den on 20/09/15.
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType( propOrder = {"firstNumber","secondNumber","result"})
@XmlRootElement
public class ActionBean {
    private int secondNumber = 0;
    private int firstNumber = 0;
    private int result = 0;
    @XmlTransient
    private boolean ok = false;
    public ActionBean(){

    }

    public int getFirstNumber() {
        return firstNumber;
    }

    public void setFirstNumber(int firstNumber) {
        this.firstNumber = firstNumber;
    }

    public int getSecondNumber() {
        return secondNumber;
    }

    public void setSecondNumber(int secondNumber) {
        this.secondNumber = secondNumber;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public boolean isOk() {
        return ok;
    }

    public void setOk(boolean ok) {
        this.ok = ok;
    }
}
