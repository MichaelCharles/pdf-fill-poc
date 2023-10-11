unit PDFFormFill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, gtPDFClasses, gtCstPDFDoc,
  gtExPDFDoc, gtExProPDFDoc, gtPDFDoc, ShellAPI;  // Add ShellAPI here

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  OpenDialog : TOpenDialog;
  SavePath, FilePath, FileName, FileExt: string;
  PDFDoc: TgtPDFDocument;  // GnosticeのPDFドキュメントクラス
  field: TgtFormField;  // Gnosticeのフォームフィールドクラス
  originalStr: PAnsiChar;
begin
  OpenDialog := nil;
  PDFDoc := nil;

  try
    FilePath := ExtractFilePath(ParamStr(0)) + 'r5bun_01_input.pdf';

    PDFDoc := TgtPDFDocument.Create(nil);
    PDFDoc.LoadFromFile(FilePath);  // GnosticeでPDFファイルをロード

    field := PDFDoc.GetFormField(3);  // Gnosticeでフィールドを取得

    originalStr := 'test';

    if Assigned(field) then
    begin
      field.FieldValue := originalStr;
    end;

;  // フィールドの値を設定

    FileName := ExtractFileName(FilePath);
    FileExt := ExtractFileExt(FilePath);
    SavePath := ExtractFilePath(FilePath) + ChangeFileExt(FileName, '') + '_filled' + FileExt;

    PDFDoc.SaveToFile(SavePath);  // Gnosticeで修正されたPDFを保存

    ShellExecute(0, 'open', PChar(SavePath), nil, nil, SW_SHOWNORMAL);
  finally
    OpenDialog.Free;
    PDFDoc.Free;  // Gnosticeのリソースを解放
  end;
end;

end.

