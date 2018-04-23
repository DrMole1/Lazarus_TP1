unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BtAnalyse: TButton;
    BTRAZ: TButton;
    BtQuit: TButton;
    txtConsPre: TLabel;
    txtVoyPre: TLabel;
    txtConsNom: TLabel;
    txtVoyNom: TLabel;
    txtConsNomPre: TLabel;
    txtVoyNomPre: TLabel;
    txtCons: TLabel;
    txtCons1: TLabel;
    txtCons2: TLabel;
    txtVoy: TLabel;
    TPre: TEdit;
    TNom: TEdit;
    TNomPre: TEdit;
    txtPre: TLabel;
    txtNom: TLabel;
    txtNomPre: TLabel;
    txtVoy1: TLabel;
    txtVoy2: TLabel;
    procedure BtAnalyseClick(Sender: TObject);
    procedure BtQuitClick(Sender: TObject);
    procedure BTRAZClick(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;
  voy1,voy2,voy3,cons1,cons2,cons3 : integer;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.BTRAZClick(Sender: TObject);
begin
     TNomPre.text:='';
end;

procedure TForm2.BtQuitClick(Sender: TObject);
begin
  if (QuestionDlg ('Quitter', 'Voulez-vous quitter ?', mtCustom, [mrYes, 'Jme casse', mrNo, 'Non'], '')= mrYes) then
  begin
     close;
  end;
end;

procedure TForm2.BtAnalyseClick(Sender: TObject);
var
nom,prenom : string;
cpt,lg : integer;
verif : boolean;
begin
     lg := Length (TNomPre.text);
     verif := false;
     for cpt:=1 to lg do
     begin
       if ((Copy(TNomPre.text,cpt,1)<> ' ') and ( verif = false)) then
       begin
          nom := nom + Copy(TNomPre.text,cpt,1);
          if ((Copy(TNomPre.text,cpt,1)= 'a')or (Copy(TNomPre.text,cpt,1)= 'e')or (Copy(TNomPre.text,cpt,1)= 'u')or(Copy(TNomPre.text,cpt,1)= 'i')or(Copy(TNomPre.text,cpt,1)= 'o')) then
              voy2 := voy2 +1
          else
              cons2 := cons2 +1;
       end;
       if (Copy(TNomPre.text,cpt,1) = ' ') then
          verif := true;
       if ((Copy(TNomPre.text,cpt,1)<> ' ') and ( verif = true)) then
       begin
          prenom := prenom + Copy(TNomPre.text,cpt,1);
          if ((Copy(TNomPre.text,cpt,1)= 'a')or (Copy(TNomPre.text,cpt,1)= 'e')or (Copy(TNomPre.text,cpt,1)= 'u')or(Copy(TNomPre.text,cpt,1)= 'i')or(Copy(TNomPre.text,cpt,1)= 'o')) then
              voy3 := voy3 +1
          else
              cons3 := cons3 +1;
       end;
     end;

     TNom.text := nom;
     TPre.text := prenom;
     voy1 := voy2 + voy3;
     cons1 := cons2 + cons3;
     txtVoyNomPre.caption := floattostr(voy1);
     txtConsNomPre.caption := floattostr(cons1);
     txtVoyNom.caption := floattostr(voy2);
     txtConsNom.caption := floattostr(cons2);
     txtVoyPre.caption := floattostr(voy3);
     txtConsPre.caption := floattostr(cons3);



end;

end.

