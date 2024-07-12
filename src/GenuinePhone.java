public class GenuinePhone extends MobilePhone{
    private String warrantyPeriod;
    private String warrantyScope;


    public GenuinePhone( String name, double price, int quantity, String producer, String warrantyPeriod, String warrantyScope) {
        super( name, price, quantity, producer);
        this.warrantyPeriod = warrantyPeriod;
        this.warrantyScope = warrantyScope;
    }



    public String getWarrantyPeriod() {
        return warrantyPeriod;
    }

    public void setWarrantyPeriod(String warrantyPeriod) {
        this.warrantyPeriod = warrantyPeriod;
    }

    public String getWarrantyScope() {
        return warrantyScope;
    }

    public void setWarrantyScope(String warrantyScope) {
        this.warrantyScope = warrantyScope;
    }

    @Override
    public String toString() {
        return super.toString() + "," +this.warrantyPeriod + "," +this.warrantyScope;
    }
}
