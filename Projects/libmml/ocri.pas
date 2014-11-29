(*
OCR Functions
=============

*)

function rs_get_up_text(C: TClient; var test: PChar): Integer; cdecl;
begin
  try
    begin
      test := PChar(C.MOCR.GetUpTextAt(7, 7, true));
      result := RESULT_OK;
    end;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function rs_get_up_text_at_ex(C: TClient; x, y: Integer; shadow: Boolean;
                              fontname: PChar; var test: PChar): Integer; cdecl;
begin
  try
    begin
      test := PChar(C.MOCR.GetUpTextAtEx(x, y, shadow, fontname));
      result := RESULT_OK;
    end;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function rs_get_up_text_at(C: TClient; x, y: Integer; var test: PChar): Integer; cdecl;
begin
  try
    begin
      test := PChar(C.MOCR.GetUpTextAt(x, y, true));
      result := RESULT_OK;
    end;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function rs_bitmap_from_text(C: TClient; text, font: PChar; var test: Integer): Integer; cdecl;
var
  bmp: TMufasaBitmap;
begin
  try
    begin
      bmp := C.MOCR.TextToFontBitmap(text, font);
      test := C.MBitmaps.AddBMP(bmp);
      result := RESULT_OK;
    end;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function mask_from_text(C: TClient; text, font: PChar; var test: TMask): Integer; cdecl;
begin
  try
    test := C.MOCR.TextToMask(text, font);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// XXX: I don't think it's necessary to export this anymore. There's no
// backwards compatibility to worry about when moving to a new language, which
// is what this is for, I assume.
function tpa_from_text_wrap(C: TClient; text, font: PChar; var w, h: Integer; out tpa: TPointArray): Integer; cdecl;
begin
  try
    tpa := C.MOCR.TextToFontTPA(text, font, w, h);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function tpa_from_text(C: TClient; text, font: PChar; var w, h: Integer; var test: TPointArray): Integer; cdecl;
begin
  try
    test := C.MOCR.TextToFontTPA(text, font, w, h);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function get_text_tpa(C: TClient; atpa: T2DPointArray; maxvspacing: Integer; font: PChar; var test: PChar): Integer; cdecl;
begin
  try
    test := PChar(C.MOCR.GetTextATPA(atpa, maxvspacing, font));
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function get_text_at(C: TClient; atX, atY, minvspacing, maxvspacing, hspacing, color, tol, len: Integer; font: PChar; var test: PChar): Integer; cdecl;
begin
  try
    test := PChar(C.MOCR.GetTextAt(atX, atY, minvspacing, maxvspacing, hspacing, color, tol, len, font));
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function get_text_at_ex(C: TClient; xs, ys, xe, ye, minvspacing, maxvspacing, hspacing, color, tol: Integer; font: PChar; var test: PChar): Integer; cdecl;
begin
  try
    test := PChar(C.MOCR.GetTextAt(xs, ys, xe, ye, minvspacing, maxvspacing, hspacing, color, tol, font));
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function load_system_font(C: TClient; sysfont: TFont; fontname: PChar; var test: Boolean): Integer; cdecl;
begin
  try
    test := C.MOCR.Fonts.LoadSystemFont(sysfont, fontname);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function load_font(C: TClient; fontname: PChar; shadow: Boolean; var test: Boolean): Integer; cdecl;
begin
  try
    test := C.MOCR.Fonts.LoadFont(fontname, shadow);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function free_font(C: TClient; fontname: PChar; var test: Boolean): Integer; cdecl;
begin
  try
    test := C.MOCR.Fonts.FreeFont(fontname);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function filter_up_text_by_characteristics(C: TClient; bmp: TMufasaBitmap): Integer; cdecl;
begin
  try
    C.MOCR.FilterUpTextByCharacteristics(bmp);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function set_up_text_filter(C: TClient; filterdata: TOcrFilterDataArray): Integer; cdecl;
begin
  try
    C.MOCR.SetFilter(filterdata);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function reset_up_text_filter(C: TClient): Integer; cdecl;
begin
  try
    C.MOCR.ResetFilter();
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;
