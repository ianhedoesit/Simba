library tpai;

{
libMML - the C-like interface to MML.

Will (eventually) support the following functionality:
    [/] -   Bitmap creation and find functions.
    [/] -   DTM creation and find functions
    [/] -   Color find, get (and convert?) functions.
    [/] -   Mouse/Keyboard functions.
    [/] -   OCR Engine + functions. (font loader?)

It should not include:
    -   Simba file functions (the stdlib of other languages should suffice)
    -   Simba web functions (the stdlib of other languages should suffice)

Debatable:
    -   TPointArray functions, the languages themselves should probably handle
        this.
    [ ] -   TMufasaBitmap class?
}

{$mode objfpc}{$H+}

uses
  cmem, Classes, interfaces, graphics, client, sysutils, MufasaTypes, dtmutil,
  dtm, IOManager, bitmaps, tpa, mmath, colour_conv;

//{$R *.res}

(*
Constants
=========

Constants defined by libMML:

.. code-block:: c

    #define RESULT_OK       0
    #define RESULT_FALSE    1
    #define RESULT_ERROR    -1

    #define MOUSE_UP        0
    #define MOUSE_DOWN      1
*)

Const
  RESULT_OK = 0;
  RESULT_FALSE = 1;
  RESULT_ERROR = -1;

  MOUSE_UP = 0;
  MOUSE_DOWN = 1;

var
  last_error: String; // TODO: make it default to ''
  debug: boolean; // TODO: make it default to false


(*

libMML Specific Functions
=========================


*)

(*
init
----

This function must be called immediately after loading the library.
*)
function init: integer;  cdecl;
begin
  last_error := '';
  debug := true; // TODO: Change this to false
  result := RESULT_OK;
end;

(*
get_last_error
--------------

Returns a char pointer.

.. DANGER::

    VERY IMPORTANT: If you use get_last_error, you must immediately store the
    resulting string somewhere else. As soon as you do other calls, the last
    error may be reset or assigned a different memory position, making your old
    pointer invalid.

    TODO: Perhaps copy it to another pchar and return that? Just let the program
    using the library free it?

*)
function get_last_error: pchar; cdecl;
begin
  exit(@last_error[1]);
end;

procedure set_last_error(s: string);
begin
  last_error := s;
  if debug then
      writeln('ERROR: ' + s);
end;

{ Validate the TClient. If it is NULL, set last error and return false }
function validate_client(C: TClient): boolean; inline;
begin
  result := Assigned(C);
  if not result then
  begin
    last_error := 'TClient is NULL';
    if debug then
      writeln(last_error);
  end;
end;

{
  Create a TClient. A TClient contains all the functions.
  You can use multiple, but you'll have to manage them yourself.
}
function create_client: PtrUInt; cdecl;
var
  C: TClient;
begin
  try
    C := TClient.Create('');
    Result := PtrUInt(C);
  except on e : Exception do
  begin
    // FIXME UINT negative
    result := PtrUInt(RESULT_ERROR);
    set_last_error(e.message);
  end;
  end;
  writeln(format('C: %d, IOManager: %d', [PtrUInt(C), PtrUInt(C.IOManager)]));
end;

{ Destroy a TClient }
function destroy_client(C: TClient): integer; cdecl;
begin
  try
    C.Free;
  except on e : Exception do
  begin
    result := RESULT_ERROR;
    set_last_error(e.message);
  end;
  end;
end;

{ Set (verbose) debug on/off }
procedure set_debug(v: Boolean); cdecl;
begin
  debug := v;
end;

{ Get debug }
function get_debug: boolean; cdecl;
begin
  exit(debug);
end;

{ Turn an array into a pointer. The pointer memory is not managed by FPC, so we can pass
  it along happily. It'll have to be freed by the external control though }
function array_to_ptr(ptr: Pointer; size: PtrUInt; objsize: PtrUInt): Pointer; cdecl;
begin
  result := GetMem(objsize * size);
  Move(ptr^, result^, objsize * size);
end;

{ Free memory previously allocated by libMML }
function free_ptr(ptr: pointer): boolean; cdecl;
begin
  result := Assigned(ptr);
  if not result then
  begin
    set_last_error('TClient is NULL');
    if debug then
      writeln(last_error);
  end else
    FreeMem(ptr);
end;

{ Allocate memory with libMML }
function alloc_mem(size, objsize: PtrUInt): Pointer; cdecl;
begin
  result := GetMem(size * objsize);
end;

{ Reallocate memory with libMML }
function realloc_mem(ptr: Pointer; size, objsize: PtrUInt): Pointer; cdecl;
begin
  result := ReAllocMem(ptr, size * objsize);
end;

{$I input.pas}
{$I colour.pas}
{$I dtmi.pas}
{$I ocri.pas}
{$I windowi.pas}
{$I bitmapi.pas}
{$I tpai.pas}
{$I colourconvi.pas}

(*
Client Functions
================



*)

function set_array_target(C: TClient; Arr: PRGB32; Size: TPoint): integer; 
    cdecl;
begin
  if not assigned(Arr) then
  begin
    set_last_error('Arr is not assigned');
    exit(RESULT_FALSE);
  end;

  try
    C.IOManager.SetTarget(Arr, Size);
    result := RESULT_OK;
  except on e : Exception do
    begin
      set_last_error(e.message);
      result := RESULT_FALSE;
    end;
  end;
end;

exports

  init,
  create_client,
  destroy_client,
  get_last_error,
  get_debug,
  set_debug,
  alloc_mem,
  realloc_mem,
  free_ptr,

  get_mouse_pos, set_mouse_pos,
  get_mouse_button_state, set_mouse_button_state,

  get_color,

  find_color, find_color_tolerance,

  find_colors, find_colors_tolerance,

  create_dtm, delete_dtm, add_dtm, remove_dtm,

  find_dtm,

  set_array_target,

  // ianhedoesit

  key_down, key_up, key_press, is_key_down, get_key_code, send_keys,

  find_color_spiral, find_color_spiral_tolerance, find_colored_area,
  find_colored_area_tolerance, count_color, count_color_tolerance,
  similar_colors, set_tolerance_speed, get_tolerance_speed,
  set_tolerance_speed_2_modifiers, get_tolerance_speed_2_modifiers,

  find_dtms, // I did not implement this, only exported for testing
  find_dtm_rotated_alternating, find_dtm_rotated_se,
  find_dtms_rotated_alternating, find_dtms_rotated_se, set_dtm_name,
  dtm_from_string, get_dtm, add_tsdtm, print_dtm, mdtm_to_sdtm, sdtm_to_mdtm,
  create_dtm_point, dtm_exists, filter_up_text_by_characteristics,
  set_up_text_filter, reset_up_text_filter,

  rs_get_up_text, rs_get_up_text_at_ex, rs_get_up_text_at, rs_bitmap_from_text,
  mask_from_text, tpa_from_text_wrap, tpa_from_text, get_text_tpa, get_text_at,
  get_text_at_ex, load_system_font, load_font, free_font,

  set_desktop_as_client, free_target, get_client_dimensions,
  get_client_position, freeze, unfreeze, activate_client, is_target_valid,
  //get_native_window, // I don't know why I export this? it's not exported in ps
  set_target_array, set_target_bitmap, set_eios_target, mouse_set_client_area,
  mouse_reset_client_area, image_set_client_area, image_reset_client_area,
  set_image_target, set_key_mouse_target, get_image_target,
  get_key_mouse_target, export_image_target, export_key_mouse_target,

  create_bitmap_string, get_mufasa_bitmap, create_bitmap, free_bitmap,
  save_bitmap, set_persistent_memory_bitmap, reset_persistent_memory_bitmap,
  bitmap_from_string, load_bitmap, set_bitmap_size, stretch_bitmap_resize,
  get_bitmap_size, set_bitmap_name, create_mirrored_bitmap,
  create_mirrored_bitmap_ex, fast_get_pixel, fast_get_pixels,
  get_bitmap_area_colors, fast_set_pixel, fast_set_pixels, draw_tpa_bitmap,
  draw_atpa_bitmap, draw_atpa_bitmap_ex, fast_draw_clear, draw_bitmap,
  fast_draw_transparent, set_transparent_color, get_transparent_color,
  fast_replace_color, copy_client_to_bitmap, bitmap_from_client, find_bitmap,
  find_bitmap_in, find_bitmap_tolerance_in, find_bitmap_spiral,
  find_bitmaps_spiral_tolerance, find_bitmap_spiral_tolerance, rotate_bitmap,
  desaturate, invert_bitmap, copy_bitmap, grey_scale_bitmap, brightness_bitmap,
  contrast_bitmap, posterize_bitmap, create_mask_from_bitmap,
  find_mask_tolerance, find_bitmap_mask_tolerance,
  find_deformed_bitmap_tolerance_in, rectangle_bitmap, flood_fill_bitmap,
  convolute_bitmap, calculate_pixel_shift, calculate_pixel_shift_tpa,
  calculate_pixel_tolerance, calculate_pixel_tolerance_tpa, bitmap_exists,

  quick_sort, t_swap, tpa_swap, swap_e, ra_a_s_tpa_ex, ra_a_s_tpa,
  nearby_point_in_array_ex, nearby_point_in_array, quick_tpa_sort,
  quick_atpa_sort, sort_tpa_by_x, sort_tpa_by_y, find_tpa_rows,
  find_tpa_columns, sort_tpa_from, sort_atpa_from, sort_atpa_from_first_point,
  sort_atpa_from_mid_point, invert_tpa, invert_atpa, middle_tpa_ex, middle_tpa,
  sort_atpa_size, sort_atpa_from_size, in_int_array_ex, in_int_array,
  clear_same_integers, clear_same_integers_and_tpa, split_tpa_ex, split_tpa,
  flood_fill_tpa, filter_points_pie_ex, filter_points_pie, filter_points_dist,
  filter_points_line, filter_tpa_dist, get_atpa_bounds, get_tpa_bounds,
  find_tpa_in_tpa, get_same_points_atpa, find_text_tpa_in_tpa,
  sort_circle_wise, linear_sort, rotate_point, change_dist_pt, change_dist_tpa,
  find_gaps_tpa, remove_dist_tpa, combine_tpa, re_arrange_and_shorten_array_ex,
  re_arrange_and_shorten_array, tpa_to_atpa_ex, tpa_to_atpa, combine_int_array,
  merge_atpa, append_tpa, tpa_from_line, edge_from_box, tpa_from_box,
  tpa_from_ellipse, tpa_from_circle, fill_ellipse, rotate_points,
  find_tpa_edges, clear_tpa_from_tpa, return_points_not_in_tpa, point_in_tpa,
  clear_double_tpa, tpa_count_sort, tpa_count_sort_base, invert_tia,
  sum_integer_array, average_tia, average_extended, same_tpa, tpa_in_atpa,
  offset_tpa, offset_atpa, copy_tpa, copy_atpa, middle_box, tpa_pos_next,
  glue_tpas,

  color_to_rgb, rgb_to_color, color_to_hsl, hsl_to_color, color_to_xyz,
  xyz_to_color, rgb_to_hsl, hsl_to_rgb, rgb_to_xyz, xyz_to_rgb, xyz_to_hsl,
  hsl_to_xyz, xyz_to_cie_lab, cie_lab_to_xyz, cie_lab_to_rgb, rgb_to_cie_lab,
  cie_lab_to_color, color_to_cie_lab, cie_lab_to_hsl, hsl_to_cie_lab;

begin
end.
