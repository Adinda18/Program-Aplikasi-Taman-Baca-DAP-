Program Aplikasi_Anggota_Taman_Baca;
uses crt;
  type
    identitas_anggota = record
        ID      : string;
        Password: string;
        Nama    : string;
        Umur    : integer;
        Alamat  : string;
        Poin    : integer;
      end;

  type
    identitas_buku = record
        ID    : string;
        Judul : string;
        Stok  : integer;
      end;
  type bulan=(Januari,Februari,Maret,April,Mei,Juni,Juli,Agustus,September,Oktober,November,Desember);

  type identitas = array [1..99] of identitas_anggota;

  type Buku = array [1..99] of identitas_buku;

var
  bln: array [0..14] of bulan;
  batas,s : integer;
  Tbuku : buku;
  b : char;
  data : identitas;
  i,l,jbuku,d,m,y : integer;
  ID, Password : string;
  found : boolean;
  JA : integer;

Procedure tambah_anggota(var Data:identitas);  {Pengisian ID pada saat Halaman awal memilih tambah akun}
begin
clrscr;
  write('ID Anggota yang baru : ');readln(Data[JA].ID);
  write('Password yang baru   : ');readln(Data[JA].Password);
  write('Nama                 : ');readln(Data[Ja].nama);
  write('Umur                 : ');readln(Data[Ja].umur);
  write('Alamat               : ');readln(Data[Ja].alamat);
  Data[i].Poin := 0;
  JA := JA + 1;
  writeln;
  write('Tekan Enter untuk kembali ke halaman login');readln();
  clrscr;
end;


Procedure LihatProfil(var Data:identitas);  {Data milik anggota}
begin
clrscr;
  writeln('===================================');
  writeln('          Profil Anda              ');
  writeln('ID       : ',Data[l].ID,'          ');
  writeln('Password : ',Data[l].Password,'    ');
  Writeln('Nama     : ',Data[l].Nama,'        ');
  writeln('Umur     : ',Data[l].Umur,'        ');
  writeln('Alamat   : ',Data[l].Alamat,'      ');
  writeln('===================================');
  writeln('===================================');
  writeln('===> Tekan Enter untuk kembali <===');
  write('===================================');readln();
end;

Procedure SortingMaxPoin(var Data:identitas);
var
  k,i,j,tmp,m:integer;
  tm:string;
begin
  if JA=2 then
    begin
      writeln('=> Daftar Perolehan Poin');
      writeln('1. ',data[1].nama,' = ',data[1].poin);
      readkey;
    end
  else
    begin
    for i:=1 to JA-2 do
      begin
        m:=i;
        for j:=2 to JA-1 do
          begin
            if data[m].poin<data[j].poin then
            m:=j;
          end;
      end;
      tmp:=data[m].poin;
      data[m].poin:=data[i].poin;
      data[i].poin:=tmp;
      tmp:=data[m].umur;
      data[m].umur:=data[i].umur;
      data[i].umur:=tmp;
      tm:=data[m].id;
      data[m].id:=data[i].id;
      data[i].id:=tm;
      tm:=data[m].nama;
      data[m].nama:=data[i].nama;
      data[i].nama:=tm;
      tm:=data[m].alamat;
      data[m].alamat:=data[i].alamat;
      data[i].alamat:=tm;
      tm:=data[m].password;
      data[m].password:=data[i].password;
      data[i].password:=tm;
      write('Tekan Enter untuk melihat Ranking: ');readln();
      for k:=1 to JA-1 do
        begin
          writeln('====================================');
          writeln('Ranking ke-',k);
          writeln('ID       : ',Data[k].ID);
          writeln('Password : ',Data[k].Password);
          writeln('Nama     : ',Data[k].Nama);
          writeln('Umur     : ',Data[k].Umur);
          writeln('Alamat   : ',Data[k].Alamat);
          writeln('====================================');
          writeln();
        end;
    end;
      writeln('==============================================');
      writeln('=========___________________________==========');
      writeln('========| Tekan Enter untuk kembali |=========');
      writeln('========|___________________________|=========');
      write('==============================================');readln();
end;

Procedure LihatPoin(var Data:identitas); {Poin yang anggota miliki}
begin
clrscr;
  writeln('======================================');
  writeln('Poin yang Anda punya: ',Data[l].Poin);
  writeln('======================================');
  writeln;
  writeln('===============================================');
  writeln('=========> Tekan Enter untuk kembali <=========');
  write('===============================================');readln();
end;

Procedure Tanggal(a,b,c:integer);
var
  i:integer;
begin
    a:=a+7;
    if (c mod 4=0) and (b=2) and (a>29) then
      begin
        a:=a-29;
        b:=b+1;
      end
    else if (c mod 4<>0) and (b=2) and (a>28) then
      begin
        a:=a-28;
        b:=b+1;
      end
    else if (b=12) and (a>31) then
      begin
        a:=a-31;
        b:=1;
        c:=c+1;
      end
    else if ((b=2) or (b=4) or (b=6) or (b=9) or (b=11)) and (a>30) then
      begin
        a:=a-30;
        b:=b+1;
      end
    else if ((b=1) or (b=3) or (b=5) or (b=7) or (b=8) or (b=10)) and (a>31) then
      begin
        a:=a-31;
        b:=b+1;
      end;
    Tbuku[s].stok := Tbuku[s].stok-1;
    data[l].poin:=data[l].poin+5;
    writeln('Tanggal pengembalian buku = ',a,' ',bln[b],' ',c);
    writeln();
    writeln('Selamat!! 5 poin telah ditambahkan ke akun anda');
    writeln();
    writeln('Sisa buku ',tbuku[s].judul,' ada ',tbuku[s].stok,' buah');
    writeln();
    writeln('Tekan Enter untuk kembali');
    readkey;
  end;

Procedure Peminjaman(var Tbuku:buku;b:string);  {Peminjaman saat anggota dapat masuk dari halaman login dan memilih '1' pada menu}
var
  IX :integer;
  a,p  :boolean;
begin
clrscr;
  a:=false;
  jbuku:=jbuku+1;
  for i:=1 to jbuku do
  begin
    if (b=tbuku[i].id) then
      begin
        a:=true;
        s:=i;
      end;
  end;
  if (a=true) then
    begin
      if (tbuku[s].stok>=2) then
        begin
          writeln('Status : Dapat dipinjam');
          writeln;
          write('Tekan Enter');
          readln;
          p:=true;
        end
      else
        begin
          writeln('Status : Tidak dapat dipinjam');
          writeln;
          write('Tekan Enter');
          readln;
          p:=false;
          writeln();
        end;
    end
  else
    begin
      writeln('Status : Buku tidak dapat ditemukan');
      writeln;
      write('Tekan Enter');
      writeln();
      readln;
      p:=false;
    end;
  If (p = true) then
    begin
      writeln();
      writeln('Apakah anda ingin meminjam: ');
      writeln('1. Ya');
      writeln('2. Tidak');
      writeln;
      writeln('Masukkan Pilihan Anda');
      write('=> ');read(b);
      writeln();
      begin
        If (b = '1') then
          begin
            write('Masukkan tanggal peminjaman (DD MM YYYY) = ');readln(d,m,y);
            Tanggal(d,m,y);
            clrscr;
          end;
        If (b = '2') then
          exit;
      end;
    end
end;


Procedure Beranda(b:char); {Halaman awal setelah Login}
var
  n:string;
begin
    i := 1;
    repeat
      begin
        clrscr;
        writeln('==========================================');
        writeln('=======__________________________=========');
        writeln('======|       Menu               |========');
        writeln('======| 1. Peminjaman            |========');
        writeln('======| 2. Lihat Poin            |========');
        writeln('======| 3. Lihat Profil          |========');
        writeln('======| 4. Lihat Poin Tertinggi  |========');
        writeln('======| 0. Log Out               |========');
        writeln('======|__________________________|========');
        writeln('==========================================');
        writeln('========> Masukkan Pilihan Anda <=========');
        writeln('==========================================');
        write('=>');readln(b);
        clrscr;
        begin
          if (b = '1') then
          begin
            write('Masukkan Kode Buku: ');
            readln(n);
            Peminjaman(Tbuku,n);
          end;
          if (b = '2') then
            LihatPoin(Data);
          if (b = '3') then
            LihatProfil(Data);
          if (b = '4') then
            SortingMaxPoin(Data);
          if (b = '0') then
            exit;
        end;
        i := i + 1;
      end;
    until(b='0');
end;

Procedure Stok(var TBuku:Buku);
var
  n:integer;
begin
clrscr;
  writeln(' Buku Yang Tersedia: ');
  for i := 1 to batas do
    begin
      writeln('  Buku ke-',i);
      writeln('ID    Buku : ',TBuku[i].ID);
      writeln('Judul Buku : ',TBuku[i].Judul);
      writeln;
    end;
  begin
    write('Untuk Buku ke: ');readln(i);
    writeln;
    write('Berapa tambahan stok: ');readln(N);
    writeln;
    TBuku[i].stok := TBuku[i].stok + N;
    writeln('Stok buku ke-',i,' menjadi: ',TBuku[i].stok);
    writeln;
    writeln('Tekan Enter untuk kembali');readln();
    clrscr;
  end;
end;


Procedure Input(var TBuku:buku);   {Pengisian buku yang dilakukan oleh ADMIN}
begin
clrscr;
  write('Berapa Buku : ');readln(batas);
  writeln;
  i := 1;
  repeat
    begin
      writeln('  Buku ke-',i);
      write('ID    Buku : ');readln(TBuku[i].ID);
      write('Judul Buku : ');readln(TBuku[i].Judul);
      write('Stok  Buku : ');readln(TBuku[i].Stok);
      writeln;
      i := i + 1;
    end;
  until(i > batas);
  writeln('=============================================');
  writeln('=========___________________________=========');
  writeln('========| Tekan Enter untuk kembali |========');
  writeln('========|___________________________|========');
  write('=============================================');readln();
  clrscr;
end;


Procedure BerandaADMIN(b:char);
begin
  i := 1;
  repeat
    begin
      clrscr;
      writeln('==========================================');
      writeln('==========> SELAMAT DATANG <==============');
      writeln('===========>    *ADMIN*    <==============');
      writeln('==========================================');
      writeln('===________________________________=======');
      writeln('==| Menu apa yang akan Anda pilih: |======');
      writeln('==| 1.Tambah Buku                  |======');
      writeln('==| 2.Tambah Stok Buku             |======');
      writeln('==| 0.Log Out                      |======');
      writeln('==|________________________________|======');
      writeln('==========================================');
      writeln('========> Masukkan Pilihan Anda <=========');
      writeln('==========================================');
      write('=>');readln(b);
      clrscr;
      begin
        if (b = '1') then
          Input(TBuku);
        if (b = '2') then
          Stok(TBuku);
        If (b = '0') then
          exit;
      end;
      i := i + 1;
    end;
  until(b='0');
end;


Procedure Login(b:char);  {Halaman Login}
begin
clrscr;
  i := 1;
      repeat
        begin
          found := false;
          write('ID Anggota : ');readln(ID);
          write('Password   : ');readln(Password);
          begin
            if (ID = 'ADMIN') and (Password = 'ADMIN') then
              BerandaADMIN(b)
            else
              begin
                i := 1;
                while (not found) and (i <= JA) do
                  begin
                    If (ID = Data[i].ID) then
                    begin
                      found := true;
                      l := i;
                    end;
                    i:=i+1;
                  end;
                if (found = true) then
                  begin
                    writeln;
                    Beranda(b);
                  end
                else
                  begin
                    writeln('ID atau Password anda salah');
                    writeln;
                    writeln('1. Coba lagi');
                    writeln('2. Buat Akun');
                    writeln('0. Halaman Awal');
                    writeln;
                    writeln('Masukkan Pilihan Anda: ');
                    write('=>');readln(b);
                    begin
                      if (b = '1') then
                        begin
                          clrscr;
                          Login(B);
                        end;
                      if (b = '2') then
                        begin
                          clrscr;
                          tambah_anggota(Data);
                        end;
                      if (b = '0') then
                        exit
                    end;
                  end;
              end;
          end;
        i := i + 1;
        end;
      Until(b = '0');
end;

Procedure Homepage(b:char);  {Halaman awal}
begin
  repeat
    begin
      clrscr;
      writeln('==========================================');
      writeln('=====> Selamat Datang di Taman Baca <=====');
      writeln('=========________________=================');
      writeln('========| Pilihan:       |================');
      writeln('========| 1. Login       |================');
      writeln('========| 2. Tambah akun |================');
      writeln('========| 0. Exit        |================');
      writeln('========|________________|================');
      writeln('==========================================');
      writeln('========> Masukkan Pilihan Anda <=========');
      writeln('==========================================');
      write('=>');readln(b);
      if (b = '1') then
        Login(b)
      else if (b = '2') then
        tambah_anggota(Data)
      else if (b = '0') then
        begin
          writeln;
          writeln('Selamat Tinggal');
          writeln;
        end;
    end;
  Until(b='0');
end;

begin
  jbuku:=0;
  bln[1]:=Januari;
  bln[2]:=Februari;
  bln[3]:=Maret;
  bln[4]:=April;
  bln[5]:=Mei;
  bln[6]:=Juni;
  bln[7]:=Juli;
  bln[8]:=Agustus;
  bln[9]:=September;
  bln[10]:=Oktober;
  bln[11]:=November;
  bln[12]:=Desember;
  i := 1;
  JA := 1;
  homepage(b);
  repeat
    begin
      writeln('=====================================================');
      writeln('Apakah kamu benar benar ingin meninggalkan homepage ?');
      writeln(' 1. Ya   ');
      writeln(' 2. Tidak');
      writeln('=============> Masukkan Pilihan Anda <===============');
      write('=>');readln(b);
      writeln;
      begin
        if (b='1') then
          begin
            writeln;
            writeln('Sekian Terima Kasih Dan Sampai Jumpa');
          end
        else if (b='2') then
          homepage(b);
      end;
    end;
  until(b='1');
end.
