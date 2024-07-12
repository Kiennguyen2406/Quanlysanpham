public class Validator {

    public static void validatePrice(double price) throws InvalidDataException {
        if (price <= 0) {
            throw new InvalidDataException("Giá tiền phải là số dương.");
        }
    }

    public static void validateQuantity(int quantity) throws InvalidDataException {
        if (quantity <= 0) {
            throw new InvalidDataException("Số lượng phải là số dương.");
        }
    }

    public static void validatePortableCountry(String portableCountry) throws InvalidDataException {
        if (portableCountry.equalsIgnoreCase("Viet Nam")) {
            throw new InvalidDataException("Không thể sử dụng ở Việt Nam.");
        }
    }
}

