unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMemo, cxLabel, cxDBEdit;

type
  TForm4 = class(TForm)
    cxDBMemo1: TcxDBMemo;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm4.FormShow(Sender: TObject);
var b :string;

begin
  cxLabel2.Caption := Unit1.Form1.ADOTable1.Fields.Fields[1].AsString;

  b:= Unit1.Form1.ADOTable1.Fields.Fields[5].AsString;         //�����
  cxDBMemo1.Style.Font.Color:= StringToColor(Unit1.Form1.ADOTable1.Fields.Fields[3].AsString);
  cxDBMemo1.Style.Font.Height:= StrToInt(Unit1.Form1.ADOTable1.Fields.Fields[4].AsString);

  if (b = 'fsBold') then cxDBMemo1.Style.Font.Style:= [fsBold]
  else if (b = 'fsItalic') then cxDBMemo1.Style.Font.Style:= [fsItalic]
  else if (b = 'fsUnderline') then cxDBMemo1.Style.Font.Style:= [fsUnderline]
  else if (b = 'fsStrikeOut') then cxDBMemo1.Style.Font.Style:= [fsStrikeOut]
  else cxDBMemo1.Style.Font.Style:= [];
end;

end.