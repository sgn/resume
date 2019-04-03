---
layout: post
title: TechComBank, password policy, "smart" OTP or the mess of internet banking
comments: false
categories:
  - rant
tags:
  - password
  - otp
  - banking
---

## Vì sao con khóc

Bữa nay là ngày 03/04/2019, 2 ngày sau khi TechComBank bắt buộc tất cả
khách hàng phải chuyển qua xài cái gọi là **SmartOTP** của họ, và cũng là 2 ngày
kể từ ngày mình hỏi TechComBank cách để quay trở lại xài token vật lý thay vì
cái **SmartOTP** nhảm nhí của TechComBank.

Chiều nay, mình mới nhận được cuộc gọi từ TechComBank trả lời cho câu hỏi
của mình. Kết quả (không có gì bất ngờ) là **SmartOTP** là bắt buộc.

### Đôi nét về OTP

OTP (one-time-password) là password xài một lần.
Chi tiết và phân loại có thể tham khảo ở [blog này (mình làm biếng viết)][1]

Ngoài những thể loại OTP trên, ở thời điểm hiện tại (03/04/2019 aka 20190403)
còn có [FIDO2/WebAuthn][2] là tiêu chuẩn mới nhất, thừa kế từ FIDO/U2F,
được công bố bởi W3C Consortium.

### Lý giải từ TechComBank:

TechComBank thông báo họ làm như vậy là để tuân thủ quyết định số
[630/QĐ-NHNN năm 2017][3].

### SmartOTP có vấn đề gì?

- Đầu tiên, **SmartOTP** và app TechComBank mobile Banking là 1 app, vừa giao dịch
  vừa lấy mã OTP trên cùng 1 ứng dụng thì còn gì là xác thực 2 bước!?

- Tệ hại hơn, nếu thực hiện giao dịch trong app TCB mobile banking,
  người dùng không cần động tay động chân để lấy OTP và nhập OTP cho giao dịch.
  Người dùng nhập 1 mã-4-số-cố-định-khi-thiết-lập-SmartOTP để thực hiện giao
  dịch. Nghĩa ban đầu của One-Time-Password đã biến mất.

  Đối chiếu với **Phụ lục 2** của Quyết định QĐ-630/2017 của Ngân hàng Nhà nước
  Việt Nam mà TCB viện dẫn, **SmartOTP** của TechComBank hoàn toàn không có bước
  *khách hàng nhập mã OTP trên giao diện thanh toán trực tuyến* của các giải
  pháp từ 1 đến 6. **SmartOTP** không yêu cầu *phản hồi trực tiếp qua kênh đã
  kết nối* để được xếp vào giải pháp số 7, giải pháp số 8, 9 và 10 thì khỏi phải bàn.

  Tóm lại **SmartOTP** của TechComBank là **NoOTP**.

- *Lý giải từ TCB: Người khác cần có chiếc điện thoại và mã 4 số passcode để
  giao dịch!!* Chắc anh chị này chưa nghe nói đến Virus! Hơn nữa, 4 số passcode
  này hoàn toàn không khó tìm ra. Chỉ cần xài một thời gian ngắn,
  4 số passcode này sẽ để lại dấu vết sử dụng trên điện thoại,
  từ 4 số này, chỉ có tối đa 24 (4!) hoán vị để thành lập passcode,
  dựa vào các thông tin về người dùng, tìm ra passcode là 1 chuyện không khó.
  Kiểu tấn công này nổi tiếng đến mức có tên riêng: [Smudge Attack][5].
  Tip: Không dùng Pattern Lock trên Android, dùng mật khẩu hoặc passcode với
  đầy đủ 9 số.
- *TCB: phần mềm này không xài được trên điện thoại đã root* root với Magisk có
  thể ẩn, uh, mà có thể cho tui xài token vật lý để khỏi lo chuyện này được không?

### TechComBank nên làm gì?

- Hỗ trợ SMS OTP (giải pháp 1) như cũ, mình biết [SMS không an toàn][4]
nhưng ít ra SMS OTP vẫn an toàn hơn **SmartOTP**,
đa số người dân Việt Nam không có nhu cầu giao dịch lớn hơn 100 triệu đồng
khi giao dịch trực tuyến.
Đa số người dân đều có chế độ báo số dư,
người dân có thể khoá tài khoản ngay khi có giao dịch khả nghi.
Để an toàn hơn, ngân hàng có thể giới hạn hạn mức giao dịch với SMS OTP lại.

- Hỗ trợ Soft OTP (giải pháp 3) như FreeOTP, Google Authenticator
giống như Google, Dropbox, Facebook, Twitter đang làm.
Uhm, hình như khả năng này là không có, vì các bậc lãnh đạo cần ai đó để
đổ lỗi khi có vấn đề xảy ra. Free, Libre Open Source Software không nằm trong
sự chọn lựa của quý vị. (Mới đọc được lúc sáng, có nơi còn yêu cầu phải mua kèm
gói hỗ trợ khi sử dụng phần mềm).

- Hỗ trợ token vật lý như trước đây, tuỳ vào nhu cầu của khách hàng mà có thể
  sử dụng giải pháp số 5 (chỉ sinh TOTP như RSA SecurID),
  hoặc giải pháp số 6 (như của HSBC).

- Hỗ trợ FIDO/U2F hoặc/và FIDO2/WebAuthn (giải pháp số 9),
đây là giải pháp tốt nhất vì 1 thiết bị có thể sử dụng cho nhiều trang web,
phần mềm khác nhau.
Yubikey FIDO/U2F giá chỉ tầm 15$ đến 20$, Yubikey hỗ trợ tất cả HOTP, TOTP,
OpenPGP (giải pháp số 10), FIDO/U2F, FIDO2/WebAuthn giá khoảng 45$.
Trong khi token vật lý của ngân hàng giá đã 300k VND.

### Các vấn đề khác của TechComBank Internet Banking:

- Sử dụng số điện thoại làm tài khoản đăng nhập Internet Banking,
giảm độ phức tạp cho việc tấn công, thay vì phải biết cả username/password,
bây giờ chỉ cần tìm password.

- Password giới hạn từ 6 đến 8 ký tự, phải có cả số, chữ hoa, chữ thường,
ký tự đặc biệt:
  * Mời xem [XKCD #936](https://www.xkcd.com/936/)
  * Phải có cả số, chữ hoa, chữ thường và ký tự đặc biệt, chuyện này
  là quy định của Ngân hàng Nhà nước, nhưng quy định này hoàn toàn
  không giúp tăng độ an toàn cho mật khẩu, ngược lại, quy định này giảm
  số lượng tổ hợp mật khẩu hợp lệ => giảm thời gian tấn công vét cạn,
  nhưng lại cho phép những mật khẩu tồi như `P@ssw0rd` lọt sổ.
  Mời đọc thêm [nghiên cứu của Microsoft][6].
  Với mình thì cái này không phải vấn đề quá lớn,
  vì mình dùng phần mềm để quản lý mật khẩu (mọi người cũng nên sử dụng
  ngay đi, LastPass, 1Password, Keepass, pass, etc...),
  vấn đề chỉ xảy ra khi bị giới hạn cận trên của chiều dài mật khẩu.
  * Cùng với quy định giới hạn từ 6 đến 8 ký tự, số lượng mật khẩu hợp lệ
  tổng cộng là: 3.295.982.584.840.192, nhỏ hơn nhiều so với việc cho phép sử
  dụng mật khẩu tự do, với yêu cầu độ dài tối thiểu, cộng với cấm sử dụng
  những quy tắc mật khẩu thông dụng, [thư viện zxcvbn của Dropbox][7] có sẵn
  để làm việc này.
  - Lại nói về quy định tối đa 8 ký tự của TechComBank, quy định này xuất phát
  từ thời kỳ xa xưa của Unix, thời kỳ [crypt(3)][8] còn được sử dụng để mã hoá
  mật khẩu. `crypt(3)` chỉ có thể xử lý `7 bits` thấp của `8 bytes` đầu tiên
  của mật khẩu. Những thế hệ lập trình viên về sau không hiểu nguyên nhân này
  đã vô thức áp đặt quy định này vào hệ thống của họ như
  [những con đười ươi trong sở thú][9].
  Năm 2019 rồi, vui lòng sử dụng `scrypt`, `bcrypt`, `Argon2`

[1]: https://kyosec.blogspot.com/2017/01/anh-gia-cac-loai-otp-uoc-su-dung-pho.html
[2]: https://en.wikipedia.org/wiki/WebAuthn
[3]: https://thuvienphapluat.vn/van-ban/Tien-te-Ngan-hang/Quyet-dinh-630-QD-NHNN-2017-an-toan-bao-mat-thanh-toan-truc-tuyen-thanh-toan-the-ngan-hang-388271.aspx
[4]: https://www.howtogeek.com/310418/why-you-shouldnt-use-sms-for-two-factor-authentication/
[5]: https://security.stackexchange.com/questions/36030/touch-screen-password-guessing-by-fingerprint-trace
[6]: https://www.microsoft.com/en-us/research/wp-content/uploads/2016/06/Microsoft_Password_Guidance-1.pdf
[7]: https://github.com/dropbox/zxcvbn
[8]: http://man7.org/linux/man-pages/man3/crypt.3.html
[9]: https://security.stackexchange.com/questions/33470/what-technical-reasons-are-there-to-have-low-maximum-password-lengths
