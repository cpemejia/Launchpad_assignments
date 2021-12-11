################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Application/bim_offchip_main.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/bim/bim_offchip_main.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/bim_util.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/cc26xx/bim/bim_util.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/ccfg_app.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/bim/ccfg_app.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/crc32.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/cc26xx/crc/crc32.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/flash_interface_internal.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/cc26xx/flash_interface/internal/flash_interface_internal.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/led_debug.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/cc26xx/debug/led_debug.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Application/startup_ccs.obj: /Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files/startup_ccs.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/Users/ElmerOMejia/Desktop/work403/bim_offchip_CC1352R1_LAUNCHXL_nortos_ccs" --include_path="/Applications/ti/ccs1100/ccs/tools/compiler/ti-cgt-arm_20.2.5.LTS/include" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/common/flash/no_rtos/extFlash/" --include_path="/Users/ElmerOMejia/ti/simplelink_cc13xx_cc26xx_sdk_5_30_01_01/source/ti/devices/cc13x2_cc26x2/startup_files" --define=DeviceFamily_CC13X2 --define=SET_CCFG_IMAGE_VALID_CONF_IMAGE_VALID=0x56000 --define=BOOT_LOADER --define=xFLASH_DEVICE_ERASE --define=xSECURITY --define=DEBUG -g --c99 --gcc --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Application/$(basename $(<F)).d_raw" --obj_directory="Application" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


