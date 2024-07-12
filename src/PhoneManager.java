import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PhoneManager {
    private List<MobilePhone> phones = new ArrayList<>();
    private static final String FILE_PATH = "C:\\java\\Quanlysanpham\\data\\mobiles.csv";

    public void readFromFile() {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 5) { // Kiểm tra số lượng trường
                    String id = parts[0];
                    String name = parts[1];
                    double price = Double.parseDouble(parts[2]);
                    int quantity = Integer.parseInt(parts[3]);
                    String producer = parts[4];

                    MobilePhone phone;
                    if (parts.length == 7) { // Kiểm tra loại điện thoại
                        String warrantyPeriod = parts[5];
                        String warrantyScope = parts[6];
                        phone = new GenuinePhone( name, price, quantity, producer, warrantyPeriod, warrantyScope);
                    } else {
                        String portableCountry = parts[5];
                        String status = parts[6];
                        phone = new CellPhone( name, price, quantity, producer, portableCountry, status);
                    }

                    phones.add(phone);
                }
            }
        } catch (IOException | NumberFormatException e) {
            System.err.println("Lỗi khi đọc file " + FILE_PATH + ": " + e.getMessage());
        }
    }


    public void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (MobilePhone phone : phones) {
                if (phone instanceof GenuinePhone) {
                    GenuinePhone genuinePhone = (GenuinePhone) phone;
                    writer.write(String.format("%s,%s,%.2f,%d,%s,%s,%s\n",
                            genuinePhone.getID(), genuinePhone.getName(), genuinePhone.getPrice(),
                            genuinePhone.getQuantity(), genuinePhone.getProducer(),
                            genuinePhone.getWarrantyPeriod(), genuinePhone.getWarrantyScope()));
                } else if (phone instanceof CellPhone) {
                    CellPhone cellPhone = (CellPhone) phone;
                    writer.write(String.format("%s,%s,%.2f,%d,%s,%s,%s\n",
                            cellPhone.getID(), cellPhone.getName(), cellPhone.getPrice(),
                            cellPhone.getQuantity(), cellPhone.getProducer(),
                            cellPhone.getPortableCountry(), cellPhone.getStatus()));
                }
            }
        } catch (IOException e) {
            System.err.println("Lỗi khi ghi vào file " + FILE_PATH + ": " + e.getMessage());
        }
    }

    public void addPhone(MobilePhone phone) {
        phones.add(phone);
        saveToFile();
    }


    public void deletePhone(String ID) {
        phones.removeIf(phone -> phone.getID().equals(ID));
        saveToFile();
    }



    public MobilePhone findPhone(String ID) {
        for (MobilePhone phone : phones) {
            if (phone.getID().equals(ID)) {
                return phone;
            }
        }
        return null;
    }

    public void displayPhones() {
        if (phones.isEmpty()) {
            System.out.println("Danh sách điện thoại rỗng.");
        } else {
            System.out.println("Danh sách điện thoại:");
            for (MobilePhone phone : phones) {
                System.out.println(phone);
            }
        }
    }
}

