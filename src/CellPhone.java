public class CellPhone extends MobilePhone {
    private String portableCountry;
    private String status;

    public CellPhone( String name, double price, int quantity, String producer, String portableCountry, String status) {
        super(name, price, quantity, producer);
        this.portableCountry = portableCountry;
        this.status = status;
    }

    public String getPortableCountry() {
        return portableCountry;
    }

    public void setPortableCountry(String portableCountry) {
        this.portableCountry = portableCountry;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return super.toString() + "," + this.portableCountry + "," + this.status;
    }
}
