/*SuperClass BankAccount*/
class BankAccount {
  constructor() {
    this.balance = 0;
  }

  /*Metode deposit(amount) akan menerima jumlah uang yang akan disimpan ke dalam akun*/
  deposit() {
    const amount = parseFloat(window.prompt("Masukkan jumlah deposit (min 50000):"));
    setTimeout(() => {
      if (amount >= 50000 && Number.isInteger(amount)) {
        this.balance += amount;
        console.log(`Deposit berhasil: Rp. ${amount}`);
        this.updateUI();
      } else {
        const error = new Error("Jumlah deposit tidak valid. Pastikan min 50000.");
        error.name = "InvalidDepositError";
        alert(error.message);
      }
    }, 2000);
  }

  /*Abstract method withdraw*/
  withdraw() {
    throw new Error("Metode withdraw harus diimplementasikan dalam subclass.");
  }

  /*Menambahkan updateUI berfungsi untuk membantu menampilkan elemen pada User Interface dengan informasi saldo terbaru dari objek BankAccount*/
  updateUI() {
    document.getElementById("saldo").innerText = this.balance.toFixed(2);
  }
}

/*SubClass CheckingAccount*/
class CheckingAccount extends BankAccount {
  /*Implementasi abstract method withdraw*/
  withdraw() {
    const amount = parseFloat(window.prompt("Masukkan jumlah penarikan (min 50000):"));
    setTimeout(() => {
      if (amount >= 50000 && Number.isInteger(amount) && amount <= this.balance) {
        this.balance -= amount;
        console.log(`Penarikan berhasil: Rp. ${amount}`);
        this.updateUI();
      } else {
        const error = new Error("Jumlah penarikan tidak valid atau saldo tidak mencukupi. Pastikan min 50000.");
        error.name = "InvalidWithdrawalError";
        alert(error.message);
      }
    }, 2000);
  }
}

/* Membuat objek CheckingAccount*/
const myAccount = new CheckingAccount();

/*Menambahkan event listeners untuk tombol deposit dan withdraw*/
document.getElementById("deposit-btn").addEventListener("click", () => {
  myAccount.deposit();
});

document.getElementById("withdraw-btn").addEventListener("click", () => {
  myAccount.withdraw();
});

/*Memastikan saldo awal ditampilkan di halaman web*/
myAccount.updateUI();
