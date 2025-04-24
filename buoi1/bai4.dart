void main()
{
  String chuoi = "Hello, World!";

  print("Chuỗi gốc: $chuoi");

  String daoNguoc = daoNguocChuoi(chuoi);
  print("Chuỗi đảo ngược: $daoNguoc");

  Map<String, int> tanSuat = demKyTu(chuoi);
  print("Số lần xuất hiện của từng ký tự:");
  tanSuat.forEach((kyTu, soLan)
  {
    print("  '$kyTu': $soLan");
  });

  String chuHoa = chuyenThanhChuHoa(chuoi);
  print("Chuỗi chữ hoa: $chuHoa");
}

String daoNguocChuoi(String input)
{
  return input.split('').reversed.join();
}

Map<String, int> demKyTu(String input)
{
  Map<String, int> dem = {};
  for (int i = 0; i < input.length; i++)
  {
    String kyTu = input[i];
    dem[kyTu] = (dem[kyTu] ?? 0) + 1;
  }
  return dem;
}

String chuyenThanhChuHoa(String input)
{
  return input.toUpperCase();
}
