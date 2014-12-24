(*
Colour Conversion Functions
===========================


*)

function color_to_rgb(color: Integer; var r, g, b: Integer): Integer; cdecl;
begin
  ColorToRGB(color, r, g, b);
  result := RESULT_OK;
end;

function rgb_to_color(r, g, b: Integer; var test: TColor): Integer; cdecl;
begin
  test := RGBtoColor(r, g, b);
  result := RESULT_OK;
end;

function color_to_hsl(color: Integer; var h, s, l: Extended): Integer; cdecl;
begin
  ColorToHSL(color, h, s, l);
  result := RESULT_OK;
end;

function hsl_to_color(var h, s, l: Extended; var test: TColor): Integer; cdecl;
begin
  test := HSLToColor(h, s, l);
  result := RESULT_OK;
end;

function color_to_xyz(color: Integer; var x, y, z: Extended): Integer; cdecl;
begin
  ColorToXYZ(color, x, y, z);
  result := RESULT_OK;
end;

function xyz_to_color(var x, y, z: Extended; var test: TColor): Integer; cdecl;
begin
  test := XYZToColor(x, y, z);
  result := RESULT_OK;
end;

function rgb_to_hsl(var r, g, b: Integer; var h, s, l: Extended): Integer; cdecl;
begin
  RGBToHSL(r, g, b, h, s, l);
  result := RESULT_OK;
end;

function hsl_to_rgb(var h, s, l: Extended; var r, g, b: Byte): Integer; cdecl;
begin
  HSLtoRGB(h, s, l, r, g, b);
  result := RESULT_OK;
end;

function rgb_to_xyz(var r, g, b: Integer; var x, y, z: Extended): Integer; cdecl;
begin
  RGBToXYZ(r, g, b, x, y, z);
  result := RESULT_OK;
end;

function xyz_to_rgb(var x, y, z: Extended; var r, g, b: Integer): Integer; cdecl;
begin
  XYZToRGB(x, y, z, r, g, b);
  result := RESULT_OK;
end;

function xyz_to_hsl(var x, y, z: Extended; var h, s, l: Extended): Integer; cdecl;
begin
  XYZToHSL(x, y, z, h, s, l);
  result := RESULT_OK;
end;

function hsl_to_xyz(var h, s, l: Extended; var x, y, z: Extended): Integer; cdecl;
begin
  HSLToXYZ(h, s, l, x, y, z);
  result := RESULT_OK;
end;

function xyz_to_cie_lab(var x, y, z: Extended; var L, a, b: Extended): Integer; cdecl;
begin
  XYZtoCIELab(x, y, z, L, a, b);
  result := RESULT_OK;
end;

function cie_lab_to_xyz(var L, a, b: Extended; var x, y, z: Extended): Integer; cdecl;
begin
  CIELabtoXYZ(L, a, b, x, y, z);
  result := RESULT_OK;
end;

function cie_lab_to_rgb(var L, a, b: Extended; var rr, gg, bb: Integer): Integer; cdecl;
begin
  CIELabToRGB(L, a, b, rr, gg, bb);
  result := RESULT_OK;
end;

function rgb_to_cie_lab(rr, gg, bb: Integer; var L, a, b: Extended): Integer; cdecl;
begin
  RGBToCIELab(rr, gg, bb, L, a, b);
  result := RESULT_OK;
end;

function cie_lab_to_color(L, a, b: Extended; var test: TColor): Integer; cdecl;
begin
  test := CIELabToColor(L, a, b);
  result := RESULT_OK;
end;

function color_to_cie_lab(color: Integer; var L, a, b: Extended): Integer; cdecl;
begin
  ColorToCIELab(color, L, a, b);
  result := RESULT_OK;
end;

function cie_lab_to_hsl(L, a, b: Extended; var hh, ss, ll: Extended): Integer; cdecl;
begin
  CIELabToHSL(L, a, b, hh, ss, ll);
  result := RESULT_OK;
end;

function hsl_to_cie_lab(hh, ss, ll: Extended; var L, a, b: Extended): Integer; cdecl;
begin
  HSLToCIELab(hh, ss, ll, L, a, b);
  result := RESULT_OK;
end;
