program Ppal;

uses
  Forms,
  Upal in 'Upal.pas' {Form1},
  Uabout in 'Uabout.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
