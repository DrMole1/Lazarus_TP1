unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes,unit2, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtConnect: TButton;
    TPss: TEdit;
    TUser: TEdit;
    txtPss: TLabel;
    txtUser: TLabel;
    procedure BtConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtConnectClick(Sender: TObject);
const
  USER = 'LaMoquetteRPZ';
  PASSWORD = 'test';
begin
    if ((TUser.text = USER) and (TPss.text = PASSWORD)) then
    begin
       Form2.show;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TPss.PasswordChar := Chr(149);
  TPss.Font.Style := TPss.Font.Style + [fsBold];
end;

end.

