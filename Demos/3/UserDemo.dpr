{
 * UserDemo.dpr
 *
 * Project file for the Window State Components UserDemo demo program.
 *
 * Any copyright in this file is dedicated to the Public Domain.
 * http://creativecommons.org/publicdomain/zero/1.0/
}

program UserDemo;

uses
  Forms,
  FmUserDemo in 'FmUserDemo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
