import java.util.Scanner;

public class Main {
    private static PhoneManager manager = new PhoneManager();
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        manager.readFromFile();
        while (true) {
            Menu.showMenu();
            int choice = scanner.nextInt();
            scanner.nextLine(); // consume newline

            switch (choice) {
                case 1:
                    addPhone();
                    break;
                case 2:
                    deletePhone();
                    break;
                case 3:
                    manager.displayPhones();
                    break;
                case 4:
                    searchPhone();
                    break;
                case 0:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ!");
            }
        }
    }


    private static void addPhone() {
        try {

            System.out.print("Tên điện thoại: ");
            String name = scanner.nextLine();

            System.out.print("Giá tiền: ");
            double price = scanner.nextDouble();
            scanner.nextLine();
            Validator.validatePrice(price);

            System.out.print("Số lượng: ");
            int quantity = scanner.nextInt();
            scanner.nextLine();
            Validator.validateQuantity(quantity);

            System.out.print("Nhà sản xuất: ");
            String producer = scanner.nextLine();

            System.out.print("Loại điện thoại (G - GenuinePhone, C - CellPhone): ");
            String type = scanner.nextLine();

            if (type.equalsIgnoreCase("G")) {
                System.out.print("Thời gian bảo hành: ");
                String warrantyPeriod = scanner.nextLine();
                Validator.validateWarrantyPeriod(warrantyPeriod);
                System.out.print("Phạm vi bảo hành: ");
                String warrantyScope = scanner.nextLine();

                GenuinePhone newGenuinePhone = new GenuinePhone(name, price, quantity, producer, warrantyPeriod, warrantyScope);
                manager.addPhone(newGenuinePhone);
            } else if (type.equalsIgnoreCase("C")) {
                System.out.print("Quốc gia sử dụng được: ");
                String portableCountry = scanner.nextLine();
                Validator.validatePortableCountry(portableCountry);
                System.out.print("Tình trạng: ");
                String status = scanner.nextLine();

                CellPhone newCellPhone = new CellPhone(name, price, quantity, producer, portableCountry, status);
                manager.addPhone(newCellPhone);
            } else {
                System.out.println("Loại điện thoại không hợp lệ!");
            }
        } catch (InvalidDataException e) {
            System.out.println("Lỗi khi thêm mới điện thoại: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Lỗi khi thêm mới điện thoại: " + e.getMessage());
        }
    }

    private static void deletePhone() {
        System.out.print("Nhập ID điện thoại cần xóa: ");
        String ID = scanner.nextLine();

        System.out.print("Bạn có chắc chắn muốn xóa điện thoại này? (yes/no): ");
        String confirmation = scanner.nextLine();

        if (confirmation.equals("yes")) {
            manager.deletePhone(ID);
            System.out.println("Điện thoại đã được xóa.");
        } if (confirmation.equals("no")) {
            System.out.println("Hủy bỏ xóa điện thoại.");
        }
    }
    private static void searchPhone() {
        System.out.print("Nhập ID điện thoại cần tìm kiếm: ");
        String ID = scanner.nextLine();

        MobilePhone foundPhone = manager.findPhone(ID);

        if (foundPhone != null) {
            System.out.println("Thông tin điện thoại:");
            System.out.println(foundPhone);
        } else {
            System.out.println("Không tìm thấy điện thoại có ID: " + ID);
        }
    }
}
