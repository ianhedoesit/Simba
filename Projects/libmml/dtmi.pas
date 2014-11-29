(*
DTM Functions
=============


*)

{ Create a MDTM}
function create_dtm(PointLen: integer; Points: PMDTMPoint; DTM: TMDTM): integer;
    cdecl;
var
  i: integer;
begin
  DTM := TMDTM.Create;
  for i := 0 to PointLen - 1 do
    DTM.AddPoint(Points[i]);

  if DTM.Valid then
    exit(RESULT_OK);

  DTM.Free;
  set_last_error('Invalid DTM');
  result := RESULT_ERROR;
end;

{ Delete a MDTM. Don't delete it if it is managed! use remove_dtm instead }
function delete_dtm(C: TClient; DTM: TMDTM): integer; cdecl;
begin
  if not assigned(DTM) then
  begin
    set_last_error('DTM is NULL');
    exit(RESULT_ERROR);
  end;

  DTM.Free;

  result := RESULT_OK;
end;

{ Add a previously created DTM to the DTM Manager }
function add_dtm(C: TClient; DTM: TMDTM; var index: integer): integer; cdecl;
begin
  if not assigned(DTM) then
  begin
    set_last_error('DTM is NULL');
    exit(RESULT_ERROR);
  end;

  try
    index := C.MDTMs.AddDTM(DTM);
    exit(RESULT_OK);
  except on e : Exception do
    result := RESULT_ERROR;
  end;
end;

{ Remove a previously added DTM from the DTM manager. This also frees the DTM }
function remove_dtm(C: TClient; DTMi: integer): integer; cdecl;
begin
  try
    C.MDTMs.FreeDTM(DTMi);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

{ Find a DTM given DTM index i, client C in area x1,y1,x2,y2. Return coord at x, y. }
function find_dtm(C: TClient; DTMi: integer; var x, y: integer; x1, y1, x2,
    y2: integer): integer; cdecl;
var
  res: boolean;
begin
  try
    res := C.MFinder.FindDTM(C.MDTMs.DTM[DTMi], x, y, x1, y1, x2, y2);
  except on e : Exception do
    begin;
      result := RESULT_ERROR;
      set_last_error(e.Message);
    end;
  end;

  if res then
    result := RESULT_OK
  else
    result := RESULT_FALSE;
end;

{ Find a DTM given DTM index i, client C in area x1,y1,x2,y2. Return coord at x, y. }
function find_dtms(C: TClient; DTMi: integer; ptr: PPoint; x1, y1, x2, 
    y2: integer; var test: Boolean): integer; cdecl;
var
  len: integer;
  TPA: TPointArray;
begin
  try
    test := C.MFinder.FindDTMs(C.MDTMs.DTM[DTMi], TPA, x1, y1, x2, y2);
  except on e : Exception do
  begin
    result := RESULT_ERROR;
    set_last_error(e.Message);
  end;
  end;

  len := Length(TPA);
  if len > 0 then
    result := RESULT_OK
  else
  begin
    setlength(tpa, 0);
    exit(RESULT_FALSE);
  end;

  ptr := array_to_ptr(Pointer(@TPA[0]), len, sizeof(TPoint));
  setlength(TPA, 0);
end;

function find_dtm_rotated_alternating(C: TClient; dtmi: Integer; var x, y: Integer; xs, ys, xe, ye: Integer; sAngle, eAngle, aStep: Double; var aFound: Double; var test: Boolean): Integer; cdecl;
var
  aFoundE: Extended;
begin
  try
    test := C.MFinder.FindDTMRotated(C.MDTMs[dtmi], x, y, xs, ys, xe, ye, sAngle, eAngle, aStep, aFoundE, true);
    aFound := Double(AFoundE);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function find_dtm_rotated_se(C: TClient; dtmi: Integer; var x, y: Integer; xs, ys, xe, ye: Integer; sAngle, eAngle, aStep: Double; var aFound: Double; var test: Boolean): Integer; cdecl;
var
  aFoundE: Extended;
begin
  try
    test := C.MFinder.FindDTMRotated(C.MDTMs[dtmi], x, y, xs, ys, xe, ye, sAngle, eAngle, aStep, aFoundE, false);
    aFound := AFoundE;
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// XXX: Needs to be T2DDoubleArray.
function find_dtms_rotated_alternating(C: TClient; dtmi: Integer; var points: TPointArray; xs, ys, xe, ye: Integer; sAngle, eAngle, aStep: Double; var aFound: T2DExtendedArray; var test: Boolean): Integer; cdecl;
var
  aFoundE: T2DExtendedArray;
  i, j: Integer;
begin
  try
    test := C.MFinder.FindDTMsRotated(C.MDTMs[dtmi], points, xs, ys, xe, ye, sAngle, eAngle, aStep, aFoundE, true);
    //for i := 0 to High(aFoundE - 1)
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// XXX: Needs to be T2DDoubleArray.
function find_dtms_rotated_se(C: TClient; dtmi: Integer; var points: TPointArray; xs, ys, xe, ye: Integer; sAngle, eAngle, aStep: Double; var aFound: T2DExtendedArray; var test: Boolean): Integer; cdecl;
begin
  try
    test := C.MFinder.FindDTMsRotated(C.MDTMs[dtmi], points, xs, ys, xe, ye, sAngle, eAngle, aStep, aFound, false);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function set_dtm_name(C: TClient; dtmi: Integer; name: PChar): Integer; cdecl;
begin
  try
    C.MDTMs[dtmi].Name := name;
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function dtm_from_string(C: TClient; dtmstring: PChar; var test: Integer): Integer; cdecl;
begin
  try
    test := C.MDTMs.StringToDTM(dtmstring);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function get_dtm(C: TClient; idx: Integer; var test: TMDTM): Integer; cdecl;
begin
  try
    test := C.MDTMs[idx];
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function add_tsdtm(C: TClient; dtm: TSDTM; var test: Integer): Integer; cdecl;
begin
  try
    test := C.MDTMs.AddDTM(dtm);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// TODO: I don't know how this should work? This is using Writeln(), which won't
// be visible anywhere, and it's not using a TClient. I'm passing it for the
// sake of consistency. - ianhedoesit
function print_dtm(C: TClient; dtm: TMDTM): Integer; cdecl;
begin
  try
    PrintDTM(dtm);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// XXX: TClient not needed, passing for consistency.
function mdtm_to_sdtm(C: TClient; dtm: TMDTM; var test: TSDTM): Integer; cdecl;
begin
  try
    test := MDTMToSDTM(dtm);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// XXX: I'm not sure how to do this. I realize that currently this does not
// return the index to the user, but I think that's just been overlooked.
// I will currently conform to how Lape/PS does this (not return managed id)
// but I do not like this approach.
function sdtm_to_mdtm(C: TClient; dtm: TSDTM; var test: TMDTM): Integer; cdecl;
begin
  try
    test := SDTMToMDTM(dtm);
    C.MDTMs.AddDTM(dtm);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

// XXX: TClient not needed, passing for consistency.
function create_dtm_point(C: TClient; x, y, _c, t, asz: Integer; bp: Boolean; var test: TMDTMPoint): Integer; cdecl;
begin
  try
    test := CreateDTMPoint(x, y, _c, t, asz, bp);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;

function dtm_exists(C: TClient; idx: Integer; var test: Boolean): Integer; cdecl;
begin
  try
    test := C.MDTMs.ExistsDTM(idx);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.Message);
      result := RESULT_ERROR;
    end;
  end;
end;
