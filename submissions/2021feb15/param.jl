global max_spectra_to_use = 20
if max_spectra_to_use < 200
   @warn "param.in setting max_spectra_to_use to " * string(max_spectra_to_use)
end

global tophap_ccf_mask_scale_factor=1.6

global fits_target_str
if fits_target_str == "Solar"
   global linelist_for_ccf_filename = "G2.espresso.mas"
   hostname = gethostname()
   if occursin("aci.ics.psu.edu",hostname)
      global ancilary_solar_data_path = "/gpfs/group/ebf11/default/ebf11/neid_solar"
   elseif occursin("nuc8",hostname)  # Eric's home machine :)
      global ancilary_solar_data_path = "/home/eford/Data/SolarSpectra/NEID_solar/"
   end
   global ccf_mid_velocity = 0
   global bjd_first_good = 2458745.1296134139
   global bjd_last_good = 2458745.283
   global df_files
   global df_files_use = df_files |>
      @filter( _.target == fits_target_str ) |>
      @filter(bjd_first_good <= _.bjd < bjd_last_good) |>
      @take(max_spectra_to_use) |>
      DataFrame
end


if fits_target_str == "101501"
   global espresso_mask_filename = "G9.espresso.mas"
   global ccf_mid_velocity = -5.0e3
   global df_files
   global df_files_use = df_files |>
      @filter( _.target == fits_target_str ) |>
      @take(max_spectra_to_use) |>
      DataFrame
end



if fits_target_str == "10700"
   global espresso_mask_filename = "G8.espresso.mas"
   global ccf_mid_velocity = -16640.0
   global df_files
   global df_files_use = df_files |>
      @filter( _.target == fits_target_str ) |>
      @take(max_spectra_to_use) |>
      DataFrame
end


if fits_target_str == "34411"  #G1?
   global espresso_mask_filename = "G2.espresso.mas"
   global ccf_mid_velocity = 66500.0
   global df_files
   global df_files_use = df_files |>
      @filter( _.target == fits_target_str ) |>
      @take(max_spectra_to_use) |>
      DataFrame
end


if fits_target_str == "26965" # K0?
   global espresso_mask_filename = "G9.espresso.mas"
   global ccf_mid_velocity = -40320.0
   global df_files
   global df_files_use = df_files |>
      @filter( _.target == fits_target_str ) |>
      @take(max_spectra_to_use) |>
      DataFrame
end