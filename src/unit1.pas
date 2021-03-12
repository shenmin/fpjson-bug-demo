unit Unit1;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

    { TForm1 }

    TForm1 = class(TForm)
        Button1 : TButton;
        procedure Button1Click(Sender : TObject);
    private

    public

    end;

var
    Form1 : TForm1;

implementation

uses fpjson, LkJSON, jsontools;

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender : TObject);
var
    str : String;
    js1 : TJsonObject;
    js2 : TlkJSONobject;
    js3 : TJsonNode;
begin
    str := '{"name":"\u95e8\u88ab\u8111\u5b50\u6324\u574f\u4e86"}';
    js1 := GetJson(str) as TJsonObject;
    js2 := TlkJSON.ParseText(str) as TlkJSONobject;
    js3 := TJsonNode.Create;
    js3.Parse(str);
    ShowMessage(js1.Get('name', '') + #13#10#13#10 + js2.getString('name') + #13#10#13#10 + js3.Find('name').AsString);
    js3.Free;
    js2.Free;
    js1.Free;
end;

end.

