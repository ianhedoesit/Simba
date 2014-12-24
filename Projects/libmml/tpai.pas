(*
TPA Functions
=============


*)

// TODO: should this check for correctness? should this catch exceptions?
function quick_sort(var A: TIntegerArray; iLo, iHi: Integer): Integer; cdecl;
begin
    QuickSort(A, iLo, iHi);
    result := RESULT_OK;
end;

function t_swap(var a, b: TPoint): Integer; cdecl;
begin
  tSwap(a, b);
  result := RESULT_OK;
end;

function tpa_swap(var a, b: TPointArray): Integer; cdecl;
begin
  tpaSwap(a, b);
  result := RESULT_OK;
end;

function swap_e(var a, b: Extended): Integer; cdecl;
begin
  swap_e(a, b);
  result := RESULT_OK;
end;

function ra_a_s_tpa_ex(var a: TPointArray; const w, h: Integer): Integer; cdecl;
begin
  RAaSTPAEx(a, w, h);
  result := RESULT_OK;
end;

function ra_a_s_tpa(var a: TPointArray; const dist: Integer): Integer; cdecl;
begin
  RAaSTPA(a, dist);
  result := RESULT_OK;
end;

function nearby_point_in_array_ex(const P: TPoint; w, h: Integer; const a: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := NearbyPointInArrayEx(p, w, h, a);
  result := RESULT_OK;
end;

function nearby_point_in_array(const P: TPoint; dist: Integer; const a: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := NearbyPointInArray(p, dist, a);
  result := RESULT_OK;
end;

function quick_tpa_sort(var a: TIntegerArray; var b: TPointArray; iLo, iHi: Integer; sortUp: Boolean): Integer; cdecl;
begin
  QuickTPASort(a, b, iLo, iHi, sortUp);
  result := RESULT_OK;
end;

function quick_atpa_sort(var a: TIntegerArray; var b: T2DPointArray; iLo, iHi: Integer; sortUp: Boolean): Integer; cdecl;
begin
  QuickATPASort(a, b, iLo, iHi, sortUp);
  result := RESULT_OK;
end;

function sort_tpa_by_x(var a: TPointArray; const lowToHi: Boolean): Integer; cdecl;
begin
  SortTPAByX(a, lowToHi);
  result := RESULT_OK;
end;

function sort_tpa_by_y(var a: TPointArray; const lowToHi: Boolean): Integer; cdecl;
begin
  SortTPAByY(a, lowToHi);
  result := RESULT_OK;
end;

function find_tpa_rows(a: TPointArray; var test: T2DPointArray): Integer; cdecl;
begin
  test := FindTPARows(a);
  result := RESULT_OK;
end;

function find_tpa_columns(a: TPointArray; var test: T2DPointArray): Integer; cdecl;
begin
  test := FindTPAColumns(a);
  result := RESULT_OK;
end;

function sort_tpa_from(var a: TPointArray; const from: TPoint): Integer; cdecl;
begin
  SortTPAFrom(a, from);
  result := RESULT_OK;
end;

function sort_atpa_from(var a: T2DPointArray; const from: TPoint): Integer; cdecl;
begin
  SortATPAFrom(a, from);
  result := RESULT_OK;
end;

function sort_atpa_from_first_point(var a: T2DPointArray; const from: TPoint): Integer; cdecl;
begin
  SortATPAFromFirstPoint(a, from);
  result := RESULT_OK;
end;

function sort_atpa_from_mid_point(var a: T2DPointArray; const from: TPoint): Integer; cdecl;
begin
  SortATPAFromMidPoint(a, from);
  result := RESULT_OK;
end;

function invert_tpa(var a: TPointArray): Integer; cdecl;
begin
  InvertTPA(a);
  result := RESULT_OK;
end;

function invert_atpa(var a: T2DPointArray): Integer; cdecl;
begin
  InvertATPA(a);
  result := RESULT_OK;
end;

function middle_tpa_ex(const tpa: TPointArray; var x, y: Integer; var test: Boolean): Integer; cdecl;
begin
  test := MiddleTPAEx(tpa, x, y);
  result := RESULT_OK;
end;

function middle_tpa(const tpa: TPointArray; var test: TPoint): Integer; cdecl;
begin
  test := MiddleTPA(tpa);
  result := RESULT_OK;
end;

function sort_atpa_size(var a: T2DPointArray; const bigFirst: Boolean): Integer; cdecl;
begin
  SortATPASize(a, bigFirst);
  result := RESULT_OK;
end;

function sort_atpa_from_size(var a: T2DPointArray; const size: Integer; closeFirst: Boolean): Integer; cdecl;
begin
  SortATPAFromSize(a, size, closeFirst);
  result := RESULT_OK;
end;

function in_int_array_ex(const a: TIntegerArray; var where: Integer; const number: Integer; var test: Boolean): Integer; cdecl;
begin
  test := InIntArrayEx(a, where, number);
  result := RESULT_OK;
end;

function in_int_array(const a: TIntegerArray; number: Integer; var test: Boolean): Integer; cdecl;
begin
  test := InIntArray(a, number);
  result := RESULT_OK;
end;

function clear_same_integers(var a: TIntegerArray): Integer; cdecl;
begin
  ClearSameIntegers(a);
  result := RESULT_OK;
end;

function clear_same_integers_and_tpa(var a: TIntegerArray; var p: TPointArray): Integer; cdecl;
begin
  ClearSameIntegersAndTPA(a, p);
  result := RESULT_OK;
end;

function split_tpa_ex(const arr: TPointArray; w, h: Integer; var test: T2DPointArray): Integer; cdecl;
begin
  test := SplitTPAEx(arr, w, h);
  result := RESULT_OK;
end;

function split_tpa(const arr: TPointArray; dist: Integer; var test: T2DPointArray): Integer; cdecl;
begin
  test := SplitTPA(arr, dist);
  result := RESULT_OK;
end;

function flood_fill_tpa(const tpa: TPointArray; var test: T2DPointArray): Integer; cdecl;
begin
  test := FloodFillTPA(tpa);
  result := RESULT_OK;
end;

function filter_points_pie_ex(var points: TPointArray; const sd, ed, minR, maxR: Extended; mX, mY: Integer; natural: Boolean): Integer; cdecl;
begin
  FilterPointsPie(points, sd, ed, minR, maxR, mX, mY, natural);
  result := RESULT_OK;
end;

function filter_points_pie(var points: TPointArray; const sd, ed, minR, maxR: Extended; mX, mY: Integer): Integer; cdecl;
begin
  FilterPointsPie(points, sd, ed, minR, maxR, mX, mY, false);
  result := RESULT_OK;
end;

function filter_points_dist(var points: TPointArray; const minDist, maxDist: Extended; mX, mY: Integer): Integer; cdecl;
begin
  FilterPointsDist(points, minDist, maxDist, mX, mY);
  result := RESULT_OK;
end;

function filter_points_line(var points: TPointArray; radial: Extended; radius, mX, mY: Integer): Integer; cdecl;
begin
  FilterPointsLine(points, radial, radius, mX, mY);
  result := RESULT_OK;
end;

function filter_tpa_dist(var tpa: TPointArray; maxDist: Integer): Integer; cdecl;
begin
  FilterTPADist(tpa, maxDist);
  result := RESULT_OK;
end;

function get_atpa_bounds(const atpa: T2DPointArray; var test: TBox): Integer; cdecl;
begin
  test := GetATPABounds(atpa);
  result := RESULT_OK;
end;

function get_tpa_bounds(const tpa: TPointArray; var test: TBox): Integer; cdecl;
begin
  test := GetTPABounds(tpa);
  result := RESULT_OK;
end;

function find_tpa_in_tpa(const searchTPA, totalTPA: TPointArray; var matches: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := FindTPAinTPA(searchTPA, totalTPA, matches);
  result := RESULT_OK;
end;

function get_same_points_atpa(const atpa: T2DPointArray; var matches: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := GetSamePointsATPA(atpa, matches);
  result := RESULT_OK;
end;

function find_text_tpa_in_tpa(height: Integer; const searchTPA, totalTPA: TPointArray; var matches: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := FindTextTPAinTPA(height, searchTPA, totalTPA, matches);
  result := RESULT_OK;
end;

function sort_circle_wise(var tpa: TPointArray; const cX, cY, startDegree: Integer; sortUp, clockWise: Boolean): Integer; cdecl;
begin
  SortCircleWise(tpa, cX, cY, startDegree, sortUp, clockWise);
  result := RESULT_OK;
end;

function linear_sort(var tpa: TPointArray; cX, cY, sd: Integer; sortUp: Boolean): Integer; cdecl;
begin
  LinearSort(tpa, cX, cY, sd, sortUp);
  result := RESULT_OK;
end;

function rotate_point(const p: TPoint; angle, mX, mY: Extended; var test: TPoint): Integer; cdecl;
begin
  test := RotatePoint(p, angle, mX, mY);
  result := RESULT_OK;
end;

function change_dist_pt(const pt: TPoint; mX, mY: Integer; newDist: Extended; var test: TPoint): Integer; cdecl;
begin
  test := ChangeDistPT(pt, mX, mY, newDist);
  result := RESULT_OK;
end;

function change_dist_tpa(var tpa: TPointArray; mX, mY: Integer; newDist: Extended; var test: Boolean): Integer; cdecl;
begin
  test := ChangeDistTPA(tpa, mX, mY, newDist);
  result := RESULT_OK;
end;

function find_gaps_tpa(const tpa: TPointArray; minPixels: Integer; var test: T2DPointArray): Integer; cdecl;
begin
  test := FindGapsTPA(tpa, minPixels);
  result := RESULT_OK;
end;

function remove_dist_tpa(x, y, dist: Integer; const points: TPointArray; removeHigher: Boolean; var test: TPointArray): Integer; cdecl;
begin
  test := RemoveDistTPointArray(x, y, dist, points, removeHigher);
  result := RESULT_OK;
end;

function combine_tpa(const ar1, ar2: TPointArray; var test: TPointArray): Integer; cdecl;
begin
  test := CombineTPA(ar1, ar2);
  result := RESULT_OK;
end;

function re_arrange_and_shorten_array_ex(const a: TPointArray; w, h: Integer; var test: TPointArray): Integer; cdecl;
begin
  test := ReArrangeandShortenArrayEx(a, w, h);
  result := RESULT_OK;
end;

function re_arrange_and_shorten_array(const a: TPointArray; dist: Integer; var test: TPointArray): Integer; cdecl;
begin
  test := ReArrangeandShortenArray(a, dist);
  result := RESULT_OK;
end;

function tpa_to_atpa_ex(const tpa: TPointArray; w, h: Integer; var test: T2DPointArray): Integer; cdecl;
begin
  test := TPAtoATPAEx(tpa, w, h);
  result := RESULT_OK;
end;

function tpa_to_atpa(const tpa: TPointArray; dist: Integer; var test: T2DPointArray): Integer; cdecl;
begin
  test := TPAtoATPA(tpa, dist);
  result := RESULT_OK;
end;

function combine_int_array(const ar1, ar2: TIntegerArray; var test: TIntegerArray): Integer; cdecl;
begin
  test := CombineIntArray(ar1, ar2);
  result := RESULT_OK;
end;

function merge_atpa(const atpa: T2DPointArray; var test: TPointArray): Integer; cdecl;
begin
  test := MergeATPA(atpa);
  result := RESULT_OK;
end;

function append_tpa(var tpa: TPointArray; const toAppend: TPointArray): Integer; cdecl;
begin
  AppendTPA(tpa, toAppend);
  result := RESULT_OK;
end;

function tpa_from_line(const x1, y1, x2, y2: Integer; var test: TPointArray): Integer; cdecl;
begin
  test := TPAFromLine(x1, y1, x2, y2);
  result := RESULT_OK;
end;

function edge_from_box(const box: TBox; var test: TPointArray): Integer; cdecl;
begin
  test := EdgeFromBox(box);
  result := RESULT_OK;
end;

function tpa_from_box(const box: TBox; var test: TPointArray): Integer; cdecl;
begin
  test := TPAFromBox(box);
  result := RESULT_OK;
end;

function tpa_from_ellipse(const cX, cY, xRadius, yRadius: Integer; var test: TPointArray): Integer; cdecl;
begin
  test := TPAFromEllipse(cX, cY, xRadius, yRadius);
  result := RESULT_OK;
end;

function tpa_from_circle(const cX, cY, radius: Integer; var test: TPointArray): Integer; cdecl;
begin
  test := TPAFromCircle(cX, cY, radius);
  result := RESULT_OK;
end;

function fill_ellipse(var a: TPointArray): Integer; cdecl;
begin
  FillEllipse(a);
  result := RESULT_OK;
end;

function rotate_points(const p: TPointArray; a, cX, cY: Extended; var test: TPointArray): Integer; cdecl;
begin
  test := RotatePoints(p, a, cX, cY);
  result := RESULT_OK;
end;

function find_tpa_edges(const p: TPointArray; var test: TPointArray): Integer; cdecl;
begin
  test := FindTPAEdges(p);
  result := RESULT_OK;
end;

function clear_tpa_from_tpa(const arP, clearPoints: TPointArray; var test: TPointArray): Integer; cdecl;
begin
  test := ClearTPAFromTPA(arP, clearPoints);
  result := RESULT_OK;
end;

function return_points_not_in_tpa(const totalTPA: TPointArray; const box: TBox; var test: TPointArray): Integer; cdecl;
begin
  test := ReturnPointsNotInTPA(totalTPA, box);
  result := RESULT_OK;
end;

function point_in_tpa(p: TPoint; const arP: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := PointInTPA(p, arP);
  result := RESULT_OK;
end;

function clear_double_tpa(var tpa: TPointArray): Integer; cdecl;
begin
  ClearDoubleTPA(tpa);
  result := RESULT_OK;
end;

function tpa_count_sort(var tpa: TPointArray; const max: TPoint; const sortOnX: Boolean): Integer; cdecl;
begin
  TPACountSort(tpa, max, sortOnX);
  result := RESULT_OK;
end;

function tpa_count_sort_base(var tpa: TPointArray; const max, base: TPoint; const sortOnX: Boolean): Integer; cdecl;
begin
  TPACountSortBase(tpa, max, base, sortOnX);
  result := RESULT_OK;
end;

function invert_tia(var tia: TIntegerArray): Integer; cdecl;
begin
  InvertTIA(tia);
  result := RESULT_OK;
end;

function sum_integer_array(const ints: TIntegerArray; var test: Integer): Integer; cdecl;
begin
  test := SumIntegerArray(ints);
  result := RESULT_OK;
end;

function average_tia(const tia: TIntegerArray; var test: Integer): Integer; cdecl;
begin
  test := AverageTIA(tia);
  result := RESULT_OK;
end;

function average_extended(const tea: TExtendedArray; var test: Extended): Integer; cdecl;
begin
  test := AverageExtended(tea);
  result := RESULT_OK;
end;

function same_tpa(const tpa1, tpa2: TPointArray; var test: Boolean): Integer; cdecl;
begin
  test := SameTPA(tpa1, tpa2);
  result := RESULT_OK;
end;

// XXX: LongInt?
function tpa_in_atpa(const tpa: TPointArray; const inATPA: T2DPointArray; var index: LongInt; var test: Boolean): Integer; cdecl;
begin
  test := TPAInATPA(tpa, inATPA, index);
  result := RESULT_OK;
end;

function offset_tpa(var tpa: TPointArray; const offset: TPoint): Integer; cdecl;
begin
  OffsetTPA(tpa, offset);
  result := RESULT_OK;
end;

function offset_atpa(var atpa: T2DPointArray; const offset: TPoint): Integer; cdecl;
begin
  OffsetATPA(atpa, offset);
  result := RESULT_OK;
end;

// XXX: I don't trust this. This seems like one example where it should maybe be
// wrapped in a try..except? Same with copy_atpa below.
function copy_tpa(const tpa: TPointArray; var test: TPointArray): Integer; cdecl;
begin
  test := Copy(tpa, 0, Length(TPA));
  result := RESULT_OK;
end;

function copy_atpa(const atpa: T2DPointArray; var test: T2DPointArray): Integer; cdecl;
var
  i, l: Integer;
begin
  l := High(atpa);
  SetLength(test, l + 1);
  for i := 0 to l do
    test[i] := Copy(atpa[i], 0, Length(atpa[i]));
  result := RESULT_OK;
end;

function middle_box(b: TBox; var test: TPoint): Integer; cdecl;
begin
  test := MiddleBox(b);
  result := RESULT_OK;
end;

function tpa_pos_next(const find: TPoint; const v: TPointArray; const prevPos: Integer; const isSortedAscending: Boolean; var test: Integer): Integer; cdecl;
begin
  test := TPAPosNext(find, v, prevPos, isSortedAscending);
  result := RESULT_OK;
end;

function glue_tpas(const v1, v2: TPointArray; const isSortedAscending, byDifference: Boolean; var test: TPointArray): Integer; cdecl;
begin
  test := GlueTPAs(v1, v2, isSortedAscending, byDifference);
  result := RESULT_OK;
end;
