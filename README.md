# fpjson-bug-demo
---
fpjson is the unit implements JSON support for Free Pascal. But it has a bug for processing "\u" characters in JSON String.

This is a demo project to show the bug. It uses fpjson and other two open-source pascal JSON parsers ([LkJson](https://sourceforge.net/projects/lkjson/) and [JsonTools](https://www.getlazarus.org/json/)) to parse a simple JSON string.

    uses fpjson, LkJSON, jsontools;
    
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
        ShowMessage(
            js1.Get('name', '') + #13#10#13#10 +
            js2.getString('name') + #13#10#13#10 +
            js3.Find('name').AsString
        );
        js3.Free;
        js2.Free;
        js1.Free;
    end;

The snapshot below shows the result. The fpjson gets a bad chinese string and the other two work fine.

![](https://raw.githubusercontent.com/shenmin/fpjson-bug-demo/master/demo.png)

P.S. The LkJSON unit also has some bugs. Here is the version I modified, since the original version has not been updated for more than 10 years.