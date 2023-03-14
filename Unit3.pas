unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, cxRadioGroup, cxSpinEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxColorComboBox, cxButtons, cxTextEdit, cxMemo, cxDBEdit,
  Data.DB, Data.Win.ADODB;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    cxButton1: TcxButton;
    GroupBox2: TGroupBox;
    cxColorComboBox1: TcxColorComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxDBMemo1: TcxDBMemo;
    ADOQuery1: TADOQuery;
    procedure cxButton1Click(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure cxRadioButton3Click(Sender: TObject);
    procedure cxRadioButton4Click(Sender: TObject);
    procedure cxRadioButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxColorComboBox1PropertiesChange(Sender: TObject);
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a, c, x: string;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm3.cxButton1Click(Sender: TObject);
begin
  a:= Unit1.Form1.ADOTable1.Fields.Fields[0].AsString;
  x:= 'UPDATE note SET text='''+ cxDBMemo1.Text +''', color='''+ cxColorComboBox1.Text +''', height='+ cxSpinEdit1.Text +', style='''+ c +''' WHERE id_note='+a;
  //ShowMessage(x);
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(x);
  ADOQuery1.ExecSQL;
  Form1.ADOTable1.Active:= False;
  Form1.ADOTable1.Active:= True;

  Form3.Close;
end;

procedure TForm3.cxColorComboBox1PropertiesChange(Sender: TObject);
begin
  cxDBMemo1.Style.Font.Color:= StringToColor(cxColorComboBox1.Text);
end;

procedure TForm3.cxRadioButton1Click(Sender: TObject); //������ �����
begin
  if cxRadioButton1.Checked
    then cxDBMemo1.Style.Font.Style:= [fsBold];
    c:= 'fsBold';
end;

procedure TForm3.cxRadioButton2Click(Sender: TObject); //��������� �����
begin
  if cxRadioButton2.Checked
    then cxDBMemo1.Style.Font.Style:= [fsItalic];
    c:= 'fsItalic';
end;

procedure TForm3.cxRadioButton3Click(Sender: TObject); //������������ �����
begin
  if cxRadioButton3.Checked
    then cxDBMemo1.Style.Font.Style:= [fsUnderline];
    c:= 'fsUnderline';
end;

procedure TForm3.cxRadioButton4Click(Sender: TObject); //����������� �����
begin
  if cxRadioButton4.Checked
    then cxDBMemo1.Style.Font.Style:= [fsStrikeOut];
    c:= 'fsStrikeOut';
end;

procedure TForm3.cxRadioButton5Click(Sender: TObject);
begin
  if cxRadioButton5.Checked
    then cxDBMemo1.Style.Font.Style:= [];
    c:= '';
end;

procedure TForm3.cxSpinEdit1PropertiesChange(Sender: TObject);
begin
    cxDBMemo1.Style.Font.Height:= cxSpinEdit1.Value;
end;

procedure TForm3.FormShow(Sender: TObject);
var b :string;

begin
  b:= Unit1.Form1.ADOTable1.Fields.Fields[5].AsString;         //�����
  cxDBMemo1.Style.Font.Color:= StringToColor(Unit1.Form1.ADOTable1.Fields.Fields[3].AsString);
  cxSpinEdit1.Text:= Unit1.Form1.ADOTable1.Fields.Fields[4].AsString;
  cxColorComboBox1.ColorValue:= StringToColor(Unit1.Form1.ADOTable1.Fields.Fields[3].AsString);
  cxDBMemo1.Style.Font.Height:= StrToInt(Unit1.Form1.ADOTable1.Fields.Fields[4].AsString);

  if (b = 'fsBold') then cxDBMemo1.Style.Font.Style:= [fsBold]
  else if (b = 'fsItalic') then cxDBMemo1.Style.Font.Style:= [fsItalic]
  else if (b = 'fsUnderline') then cxDBMemo1.Style.Font.Style:= [fsUnderline]
  else if (b = 'fsStrikeOut') then cxDBMemo1.Style.Font.Style:= [fsStrikeOut]
  else cxDBMemo1.Style.Font.Style:= [];

end;

end.
