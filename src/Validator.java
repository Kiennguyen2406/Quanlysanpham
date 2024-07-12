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
    public static void validateWarrantyPeriod(String warrantyPeriod) throws InvalidDataException {
        try {
            int days = Integer.parseInt(warrantyPeriod);
            if (days <= 0 || days > 730) {
                throw new InvalidDataException("Thời gian bảo hành phải là số dương và không quá 730 ngày.");
            }
        } catch (NumberFormatException e) {
            throw new InvalidDataException("Thời gian bảo hành phải là một số nguyên.");
        }
    }
}

