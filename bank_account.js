/*1. Membuat file JavaScript dengan nama 'bank_account.js'*/

/*2. Deklarasi variabel "saldo" dengan nilai awal (0)*/
let saldo = 0;

/*3. Fungsi untuk menambahkan saldo 'tambahSaldo()' telah diimplementasikan menggunakan window.prompt() untuk menambahkan saldo*/
function tambahSaldo() {
  const inputSaldo = window.prompt("Masukkan jumlah saldo yang akan ditambahkan:");

  if (inputSaldo === null) {
    return;
  }

  if (!isNumber(inputSaldo)) {
    alert("Tidak ada nominal rupiah yang masuk");
  } else {
    const jumlahSaldo = parseFloat(inputSaldo);
    if (jumlahSaldo < 50000.0) {
      alert("Minimal saldo yang bisa dimasukkan adalah Rp. 50,000.00");
    } else {
      saldo += jumlahSaldo;
      updateSaldo();
      alert(`Saldo Anda sekarang: Rp. ${saldo.toFixed(2)}`);
    }
  }
}

/*4. Fungsi untuk mengurangi saldo 'kurangiSaldo()' telah diimplementasikan menggunakan window.prompt() untuk mengurangi saldo*/
function kurangiSaldo() {
  const inputTarikSaldo = window.prompt("Masukkan jumlah saldo yang akan ditarik:");

  if (inputTarikSaldo === null) {
    return;
  }

  if (!isNumber(inputTarikSaldo)) {
    alert("Data yang dimasukkan bukan angka.");
  } else {
    const jumlahTarikSaldo = parseFloat(inputTarikSaldo);
    if (jumlahTarikSaldo < 50000.0) {
      alert("Minimal saldo yang bisa ditarik adalah Rp. 50,000.00");
    } else if (jumlahTarikSaldo > saldo) {
      alert("Saldo tidak mencukupi.");
    } else {
      saldo -= jumlahTarikSaldo;
      updateSaldo();
      alert(`Saldo Anda sekarang: Rp. ${saldo.toFixed(2)}`);
    }
  }
}
/*Memeriksa apakah input adalah tipe data number*/
function isNumber(value) {
  return !isNaN(parseFloat(value)) && isFinite(value);
}

/*6. Fungsi untuk mengupdate tampilan saldo*/
function updateSaldo() {
  document.getElementById("saldo").textContent = saldo.toFixed(2);
}

/*7. Event listener untuk tombol Masukkan Saldo*/
document.getElementById("saldo-btn").addEventListener("click", tambahSaldo);

/*8. Event listener untuk tombol Tarik Saldo*/
document.getElementById("tarik-saldo-btn").addEventListener("click", kurangiSaldo);

/*9. Memastikan saldo awal ditampilkan di halaman web*/
updateSaldo();
