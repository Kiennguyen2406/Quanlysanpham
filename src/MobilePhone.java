public abstract class MobilePhone {
    private static int nextID = 1;
    private String ID;
    private String name;
    private double price;
    private int quantity;
    private String producer;

    public MobilePhone( String name, double price, int quantity, String producer) {

        this.ID =  generateNextID();
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.producer = producer;
    }
    private static String generateNextID() {
        String newID = "ID" + nextID;
        nextID++;
        return newID;
    }
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    @Override
    public String toString() {
        return  ID + "," +
                name + "," +
                price + "," +
                quantity + "," +
                producer
                ;
    }
}
