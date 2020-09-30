Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68CD27ECFE
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731200AbgI3Pag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730632AbgI3P3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:01 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4172C0613D0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:29:00 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 03E5D634C89
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 001/100] smiapp: Add CCS register definitions and limits
Date:   Wed, 30 Sep 2020 18:27:19 +0300
Message-Id: <20200930152858.8471-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add register definitions of the MIPI CCS 1.1 standard. Also add ccs-os.h
header that contains Linux headers to be included.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/Makefile     |   3 +-
 drivers/media/i2c/smiapp/ccs-limits.c | 239 +++++++
 drivers/media/i2c/smiapp/ccs-limits.h | 258 +++++++
 drivers/media/i2c/smiapp/ccs-os.h     |  15 +
 drivers/media/i2c/smiapp/ccs-regs.h   | 953 ++++++++++++++++++++++++++
 5 files changed, 1467 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/i2c/smiapp/ccs-limits.c
 create mode 100644 drivers/media/i2c/smiapp/ccs-limits.h
 create mode 100644 drivers/media/i2c/smiapp/ccs-os.h
 create mode 100644 drivers/media/i2c/smiapp/ccs-regs.h

diff --git a/drivers/media/i2c/smiapp/Makefile b/drivers/media/i2c/smiapp/Makefile
index 86f57a43f8e8..b4f0bcc037b8 100644
--- a/drivers/media/i2c/smiapp/Makefile
+++ b/drivers/media/i2c/smiapp/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 smiapp-objs			+= smiapp-core.o smiapp-regs.o \
-				   smiapp-quirk.o smiapp-limits.o
+				   smiapp-quirk.o smiapp-limits.o \
+				   ccs-limits.o
 obj-$(CONFIG_VIDEO_SMIAPP)	+= smiapp.o
 
 ccflags-y += -I $(srctree)/drivers/media/i2c
diff --git a/drivers/media/i2c/smiapp/ccs-limits.c b/drivers/media/i2c/smiapp/ccs-limits.c
new file mode 100644
index 000000000000..f5511789ac83
--- /dev/null
+++ b/drivers/media/i2c/smiapp/ccs-limits.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+/* Copyright (C) 2019--2020 Intel Corporation */
+
+#include "ccs-limits.h"
+#include "ccs-regs.h"
+
+const struct ccs_limit ccs_limits[] = {
+	{ CCS_R_FRAME_FORMAT_MODEL_TYPE, 1, 0, "frame_format_model_type" },
+	{ CCS_R_FRAME_FORMAT_MODEL_SUBTYPE, 1, 0, "frame_format_model_subtype" },
+	{ CCS_R_FRAME_FORMAT_DESCRIPTOR(0), 30, 0, "frame_format_descriptor" },
+	{ CCS_R_FRAME_FORMAT_DESCRIPTOR_4(0), 32, 0, "frame_format_descriptor_4" },
+	{ CCS_R_ANALOG_GAIN_CAPABILITY, 2, 0, "analog_gain_capability" },
+	{ CCS_R_ANALOG_GAIN_CODE_MIN, 2, 0, "analog_gain_code_min" },
+	{ CCS_R_ANALOG_GAIN_CODE_MAX, 2, 0, "analog_gain_code_max" },
+	{ CCS_R_ANALOG_GAIN_CODE_STEP, 2, 0, "analog_gain_code_step" },
+	{ CCS_R_ANALOG_GAIN_TYPE, 2, 0, "analog_gain_type" },
+	{ CCS_R_ANALOG_GAIN_M0, 2, 0, "analog_gain_m0" },
+	{ CCS_R_ANALOG_GAIN_C0, 2, 0, "analog_gain_c0" },
+	{ CCS_R_ANALOG_GAIN_M1, 2, 0, "analog_gain_m1" },
+	{ CCS_R_ANALOG_GAIN_C1, 2, 0, "analog_gain_c1" },
+	{ CCS_R_ANALOG_LINEAR_GAIN_MIN, 2, 0, "analog_linear_gain_min" },
+	{ CCS_R_ANALOG_LINEAR_GAIN_MAX, 2, 0, "analog_linear_gain_max" },
+	{ CCS_R_ANALOG_LINEAR_GAIN_STEP_SIZE, 2, 0, "analog_linear_gain_step_size" },
+	{ CCS_R_ANALOG_EXPONENTIAL_GAIN_MIN, 2, 0, "analog_exponential_gain_min" },
+	{ CCS_R_ANALOG_EXPONENTIAL_GAIN_MAX, 2, 0, "analog_exponential_gain_max" },
+	{ CCS_R_ANALOG_EXPONENTIAL_GAIN_STEP_SIZE, 2, 0, "analog_exponential_gain_step_size" },
+	{ CCS_R_DATA_FORMAT_MODEL_TYPE, 1, 0, "data_format_model_type" },
+	{ CCS_R_DATA_FORMAT_MODEL_SUBTYPE, 1, 0, "data_format_model_subtype" },
+	{ CCS_R_DATA_FORMAT_DESCRIPTOR(0), 32, 0, "data_format_descriptor" },
+	{ CCS_R_INTEGRATION_TIME_CAPABILITY, 2, 0, "integration_time_capability" },
+	{ CCS_R_COARSE_INTEGRATION_TIME_MIN, 2, 0, "coarse_integration_time_min" },
+	{ CCS_R_COARSE_INTEGRATION_TIME_MAX_MARGIN, 2, 0, "coarse_integration_time_max_margin" },
+	{ CCS_R_FINE_INTEGRATION_TIME_MIN, 2, 0, "fine_integration_time_min" },
+	{ CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN, 2, 0, "fine_integration_time_max_margin" },
+	{ CCS_R_DIGITAL_GAIN_CAPABILITY, 1, 0, "digital_gain_capability" },
+	{ CCS_R_DIGITAL_GAIN_MIN, 2, 0, "digital_gain_min" },
+	{ CCS_R_DIGITAL_GAIN_MAX, 2, 0, "digital_gain_max" },
+	{ CCS_R_DIGITAL_GAIN_STEP_SIZE, 2, 0, "digital_gain_step_size" },
+	{ CCS_R_PEDESTAL_CAPABILITY, 1, 0, "Pedestal_capability" },
+	{ CCS_R_ADC_CAPABILITY, 1, 0, "ADC_capability" },
+	{ CCS_R_ADC_BIT_DEPTH_CAPABILITY, 4, 0, "ADC_bit_depth_capability" },
+	{ CCS_R_MIN_EXT_CLK_FREQ_MHZ, 4, 0, "min_ext_clk_freq_mhz" },
+	{ CCS_R_MAX_EXT_CLK_FREQ_MHZ, 4, 0, "max_ext_clk_freq_mhz" },
+	{ CCS_R_MIN_PRE_PLL_CLK_DIV, 2, 0, "min_pre_pll_clk_div" },
+	{ CCS_R_MAX_PRE_PLL_CLK_DIV, 2, 0, "max_pre_pll_clk_div" },
+	{ CCS_R_MIN_PLL_IP_CLK_FREQ_MHZ, 4, 0, "min_pll_ip_clk_freq_mhz" },
+	{ CCS_R_MAX_PLL_IP_CLK_FREQ_MHZ, 4, 0, "max_pll_ip_clk_freq_mhz" },
+	{ CCS_R_MIN_PLL_MULTIPLIER, 2, 0, "min_pll_multiplier" },
+	{ CCS_R_MAX_PLL_MULTIPLIER, 2, 0, "max_pll_multiplier" },
+	{ CCS_R_MIN_PLL_OP_CLK_FREQ_MHZ, 4, 0, "min_pll_op_clk_freq_mhz" },
+	{ CCS_R_MAX_PLL_OP_CLK_FREQ_MHZ, 4, 0, "max_pll_op_clk_freq_mhz" },
+	{ CCS_R_MIN_VT_SYS_CLK_DIV, 2, 0, "min_vt_sys_clk_div" },
+	{ CCS_R_MAX_VT_SYS_CLK_DIV, 2, 0, "max_vt_sys_clk_div" },
+	{ CCS_R_MIN_VT_SYS_CLK_FREQ_MHZ, 4, 0, "min_vt_sys_clk_freq_mhz" },
+	{ CCS_R_MAX_VT_SYS_CLK_FREQ_MHZ, 4, 0, "max_vt_sys_clk_freq_mhz" },
+	{ CCS_R_MIN_VT_PIX_CLK_FREQ_MHZ, 4, 0, "min_vt_pix_clk_freq_mhz" },
+	{ CCS_R_MAX_VT_PIX_CLK_FREQ_MHZ, 4, 0, "max_vt_pix_clk_freq_mhz" },
+	{ CCS_R_MIN_VT_PIX_CLK_DIV, 2, 0, "min_vt_pix_clk_div" },
+	{ CCS_R_MAX_VT_PIX_CLK_DIV, 2, 0, "max_vt_pix_clk_div" },
+	{ CCS_R_CLOCK_CALCULATION, 1, 0, "clock_calculation" },
+	{ CCS_R_NUM_OF_VT_LANES, 1, 0, "num_of_vt_lanes" },
+	{ CCS_R_NUM_OF_OP_LANES, 1, 0, "num_of_op_lanes" },
+	{ CCS_R_OP_BITS_PER_LANE, 1, 0, "op_bits_per_lane" },
+	{ CCS_R_MIN_FRAME_LENGTH_LINES, 2, 0, "min_frame_length_lines" },
+	{ CCS_R_MAX_FRAME_LENGTH_LINES, 2, 0, "max_frame_length_lines" },
+	{ CCS_R_MIN_LINE_LENGTH_PCK, 2, 0, "min_line_length_pck" },
+	{ CCS_R_MAX_LINE_LENGTH_PCK, 2, 0, "max_line_length_pck" },
+	{ CCS_R_MIN_LINE_BLANKING_PCK, 2, 0, "min_line_blanking_pck" },
+	{ CCS_R_MIN_FRAME_BLANKING_LINES, 2, 0, "min_frame_blanking_lines" },
+	{ CCS_R_MIN_LINE_LENGTH_PCK_STEP_SIZE, 1, 0, "min_line_length_pck_step_size" },
+	{ CCS_R_TIMING_MODE_CAPABILITY, 1, 0, "timing_mode_capability" },
+	{ CCS_R_FRAME_MARGIN_MAX_VALUE, 2, 0, "frame_margin_max_value" },
+	{ CCS_R_FRAME_MARGIN_MIN_VALUE, 1, 0, "frame_margin_min_value" },
+	{ CCS_R_GAIN_DELAY_TYPE, 1, 0, "gain_delay_type" },
+	{ CCS_R_MIN_OP_SYS_CLK_DIV, 2, 0, "min_op_sys_clk_div" },
+	{ CCS_R_MAX_OP_SYS_CLK_DIV, 2, 0, "max_op_sys_clk_div" },
+	{ CCS_R_MIN_OP_SYS_CLK_FREQ_MHZ, 4, 0, "min_op_sys_clk_freq_mhz" },
+	{ CCS_R_MAX_OP_SYS_CLK_FREQ_MHZ, 4, 0, "max_op_sys_clk_freq_mhz" },
+	{ CCS_R_MIN_OP_PIX_CLK_DIV, 2, 0, "min_op_pix_clk_div" },
+	{ CCS_R_MAX_OP_PIX_CLK_DIV, 2, 0, "max_op_pix_clk_div" },
+	{ CCS_R_MIN_OP_PIX_CLK_FREQ_MHZ, 4, 0, "min_op_pix_clk_freq_mhz" },
+	{ CCS_R_MAX_OP_PIX_CLK_FREQ_MHZ, 4, 0, "max_op_pix_clk_freq_mhz" },
+	{ CCS_R_X_ADDR_MIN, 2, 0, "x_addr_min" },
+	{ CCS_R_Y_ADDR_MIN, 2, 0, "y_addr_min" },
+	{ CCS_R_X_ADDR_MAX, 2, 0, "x_addr_max" },
+	{ CCS_R_Y_ADDR_MAX, 2, 0, "y_addr_max" },
+	{ CCS_R_MIN_X_OUTPUT_SIZE, 2, 0, "min_x_output_size" },
+	{ CCS_R_MIN_Y_OUTPUT_SIZE, 2, 0, "min_y_output_size" },
+	{ CCS_R_MAX_X_OUTPUT_SIZE, 2, 0, "max_x_output_size" },
+	{ CCS_R_MAX_Y_OUTPUT_SIZE, 2, 0, "max_y_output_size" },
+	{ CCS_R_X_ADDR_START_DIV_CONSTANT, 1, 0, "x_addr_start_div_constant" },
+	{ CCS_R_Y_ADDR_START_DIV_CONSTANT, 1, 0, "y_addr_start_div_constant" },
+	{ CCS_R_X_ADDR_END_DIV_CONSTANT, 1, 0, "x_addr_end_div_constant" },
+	{ CCS_R_Y_ADDR_END_DIV_CONSTANT, 1, 0, "y_addr_end_div_constant" },
+	{ CCS_R_X_SIZE_DIV, 1, 0, "x_size_div" },
+	{ CCS_R_Y_SIZE_DIV, 1, 0, "y_size_div" },
+	{ CCS_R_X_OUTPUT_DIV, 1, 0, "x_output_div" },
+	{ CCS_R_Y_OUTPUT_DIV, 1, 0, "y_output_div" },
+	{ CCS_R_NON_FLEXIBLE_RESOLUTION_SUPPORT, 1, 0, "non_flexible_resolution_support" },
+	{ CCS_R_MIN_OP_PRE_PLL_CLK_DIV, 2, 0, "min_op_pre_pll_clk_div" },
+	{ CCS_R_MAX_OP_PRE_PLL_CLK_DIV, 2, 0, "max_op_pre_pll_clk_div" },
+	{ CCS_R_MIN_OP_PLL_IP_CLK_FREQ_MHZ, 4, 0, "min_op_pll_ip_clk_freq_mhz" },
+	{ CCS_R_MAX_OP_PLL_IP_CLK_FREQ_MHZ, 4, 0, "max_op_pll_ip_clk_freq_mhz" },
+	{ CCS_R_MIN_OP_PLL_MULTIPLIER, 2, 0, "min_op_pll_multiplier" },
+	{ CCS_R_MAX_OP_PLL_MULTIPLIER, 2, 0, "max_op_pll_multiplier" },
+	{ CCS_R_MIN_OP_PLL_OP_CLK_FREQ_MHZ, 4, 0, "min_op_pll_op_clk_freq_mhz" },
+	{ CCS_R_MAX_OP_PLL_OP_CLK_FREQ_MHZ, 4, 0, "max_op_pll_op_clk_freq_mhz" },
+	{ CCS_R_CLOCK_TREE_PLL_CAPABILITY, 1, 0, "clock_tree_pll_capability" },
+	{ CCS_R_CLOCK_CAPA_TYPE_CAPABILITY, 1, 0, "clock_capa_type_capability" },
+	{ CCS_R_MIN_EVEN_INC, 2, 0, "min_even_inc" },
+	{ CCS_R_MIN_ODD_INC, 2, 0, "min_odd_inc" },
+	{ CCS_R_MAX_EVEN_INC, 2, 0, "max_even_inc" },
+	{ CCS_R_MAX_ODD_INC, 2, 0, "max_odd_inc" },
+	{ CCS_R_AUX_SUBSAMP_CAPABILITY, 1, 0, "aux_subsamp_capability" },
+	{ CCS_R_AUX_SUBSAMP_MONO_CAPABILITY, 1, 0, "aux_subsamp_mono_capability" },
+	{ CCS_R_MONOCHROME_CAPABILITY, 1, 0, "monochrome_capability" },
+	{ CCS_R_PIXEL_READOUT_CAPABILITY, 1, 0, "pixel_readout_capability" },
+	{ CCS_R_MIN_EVEN_INC_MONO, 2, 0, "min_even_inc_mono" },
+	{ CCS_R_MAX_EVEN_INC_MONO, 2, 0, "max_even_inc_mono" },
+	{ CCS_R_MIN_ODD_INC_MONO, 2, 0, "min_odd_inc_mono" },
+	{ CCS_R_MAX_ODD_INC_MONO, 2, 0, "max_odd_inc_mono" },
+	{ CCS_R_MIN_EVEN_INC_BC2, 2, 0, "min_even_inc_bc2" },
+	{ CCS_R_MAX_EVEN_INC_BC2, 2, 0, "max_even_inc_bc2" },
+	{ CCS_R_MIN_ODD_INC_BC2, 2, 0, "min_odd_inc_bc2" },
+	{ CCS_R_MAX_ODD_INC_BC2, 2, 0, "max_odd_inc_bc2" },
+	{ CCS_R_MIN_EVEN_INC_MONO_BC2, 2, 0, "min_even_inc_mono_bc2" },
+	{ CCS_R_MAX_EVEN_INC_MONO_BC2, 2, 0, "max_even_inc_mono_bc2" },
+	{ CCS_R_MIN_ODD_INC_MONO_BC2, 2, 0, "min_odd_inc_mono_bc2" },
+	{ CCS_R_MAX_ODD_INC_MONO_BC2, 2, 0, "max_odd_inc_mono_bc2" },
+	{ CCS_R_SCALING_CAPABILITY, 2, 0, "scaling_capability" },
+	{ CCS_R_SCALER_M_MIN, 2, 0, "scaler_m_min" },
+	{ CCS_R_SCALER_M_MAX, 2, 0, "scaler_m_max" },
+	{ CCS_R_SCALER_N_MIN, 2, 0, "scaler_n_min" },
+	{ CCS_R_SCALER_N_MAX, 2, 0, "scaler_n_max" },
+	{ CCS_R_DIGITAL_CROP_CAPABILITY, 1, 0, "digital_crop_capability" },
+	{ CCS_R_HDR_CAPABILITY_1, 1, 0, "hdr_capability_1" },
+	{ CCS_R_MIN_HDR_BIT_DEPTH, 1, 0, "min_hdr_bit_depth" },
+	{ CCS_R_HDR_RESOLUTION_SUB_TYPES, 1, 0, "hdr_resolution_sub_types" },
+	{ CCS_R_HDR_RESOLUTION_SUB_TYPE(0), 2, 0, "hdr_resolution_sub_type" },
+	{ CCS_R_HDR_CAPABILITY_2, 1, 0, "hdr_capability_2" },
+	{ CCS_R_MAX_HDR_BIT_DEPTH, 1, 0, "max_hdr_bit_depth" },
+	{ CCS_R_USL_SUPPORT_CAPABILITY, 1, 0, "usl_support_capability" },
+	{ CCS_R_USL_CLOCK_MODE_D_CAPABILITY, 1, 0, "usl_clock_mode_d_capability" },
+	{ CCS_R_MIN_OP_SYS_CLK_DIV_REV, 1, 0, "min_op_sys_clk_div_rev" },
+	{ CCS_R_MAX_OP_SYS_CLK_DIV_REV, 1, 0, "max_op_sys_clk_div_rev" },
+	{ CCS_R_MIN_OP_PIX_CLK_DIV_REV, 1, 0, "min_op_pix_clk_div_rev" },
+	{ CCS_R_MAX_OP_PIX_CLK_DIV_REV, 1, 0, "max_op_pix_clk_div_rev" },
+	{ CCS_R_MIN_OP_SYS_CLK_FREQ_REV_MHZ, 4, 0, "min_op_sys_clk_freq_rev_mhz" },
+	{ CCS_R_MAX_OP_SYS_CLK_FREQ_REV_MHZ, 4, 0, "max_op_sys_clk_freq_rev_mhz" },
+	{ CCS_R_MIN_OP_PIX_CLK_FREQ_REV_MHZ, 4, 0, "min_op_pix_clk_freq_rev_mhz" },
+	{ CCS_R_MAX_OP_PIX_CLK_FREQ_REV_MHZ, 4, 0, "max_op_pix_clk_freq_rev_mhz" },
+	{ CCS_R_MAX_BITRATE_REV_D_MODE_MBPS, 4, 0, "max_bitrate_rev_d_mode_mbps" },
+	{ CCS_R_MAX_SYMRATE_REV_C_MODE_MSPS, 4, 0, "max_symrate_rev_c_mode_msps" },
+	{ CCS_R_COMPRESSION_CAPABILITY, 1, 0, "compression_capability" },
+	{ CCS_R_TEST_MODE_CAPABILITY, 2, 0, "test_mode_capability" },
+	{ CCS_R_PN9_DATA_FORMAT1, 1, 0, "pn9_data_format1" },
+	{ CCS_R_PN9_DATA_FORMAT2, 1, 0, "pn9_data_format2" },
+	{ CCS_R_PN9_DATA_FORMAT3, 1, 0, "pn9_data_format3" },
+	{ CCS_R_PN9_DATA_FORMAT4, 1, 0, "pn9_data_format4" },
+	{ CCS_R_PN9_MISC_CAPABILITY, 1, 0, "pn9_misc_capability" },
+	{ CCS_R_TEST_PATTERN_CAPABILITY, 1, 0, "test_pattern_capability" },
+	{ CCS_R_PATTERN_SIZE_DIV_M1, 1, 0, "pattern_size_div_m1" },
+	{ CCS_R_FIFO_SUPPORT_CAPABILITY, 1, 0, "fifo_support_capability" },
+	{ CCS_R_PHY_CTRL_CAPABILITY, 1, 0, "phy_ctrl_capability" },
+	{ CCS_R_CSI_DPHY_LANE_MODE_CAPABILITY, 1, 0, "csi_dphy_lane_mode_capability" },
+	{ CCS_R_CSI_SIGNALING_MODE_CAPABILITY, 1, 0, "csi_signaling_mode_capability" },
+	{ CCS_R_FAST_STANDBY_CAPABILITY, 1, 0, "fast_standby_capability" },
+	{ CCS_R_CSI_ADDRESS_CONTROL_CAPABILITY, 1, 0, "csi_address_control_capability" },
+	{ CCS_R_DATA_TYPE_CAPABILITY, 1, 0, "data_type_capability" },
+	{ CCS_R_CSI_CPHY_LANE_MODE_CAPABILITY, 1, 0, "csi_cphy_lane_mode_capability" },
+	{ CCS_R_EMB_DATA_CAPABILITY, 1, 0, "emb_data_capability" },
+	{ CCS_R_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS(0), 16, 0, "max_per_lane_bitrate_lane_d_mode_mbps 0" },
+	{ CCS_R_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS(4), 16, CCS_L_FL_SAME_REG, "max_per_lane_bitrate_lane_d_mode_mbps 4" },
+	{ CCS_R_TEMP_SENSOR_CAPABILITY, 1, 0, "temp_sensor_capability" },
+	{ CCS_R_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS(0), 16, 0, "max_per_lane_bitrate_lane_c_mode_mbps 0" },
+	{ CCS_R_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS(4), 16, CCS_L_FL_SAME_REG, "max_per_lane_bitrate_lane_c_mode_mbps 4" },
+	{ CCS_R_DPHY_EQUALIZATION_CAPABILITY, 1, 0, "dphy_equalization_capability" },
+	{ CCS_R_CPHY_EQUALIZATION_CAPABILITY, 1, 0, "cphy_equalization_capability" },
+	{ CCS_R_DPHY_PREAMBLE_CAPABILITY, 1, 0, "dphy_preamble_capability" },
+	{ CCS_R_DPHY_SSC_CAPABILITY, 1, 0, "dphy_ssc_capability" },
+	{ CCS_R_CPHY_CALIBRATION_CAPABILITY, 1, 0, "cphy_calibration_capability" },
+	{ CCS_R_DPHY_CALIBRATION_CAPABILITY, 1, 0, "dphy_calibration_capability" },
+	{ CCS_R_PHY_CTRL_CAPABILITY_2, 1, 0, "phy_ctrl_capability_2" },
+	{ CCS_R_LRTE_CPHY_CAPABILITY, 1, 0, "lrte_cphy_capability" },
+	{ CCS_R_LRTE_DPHY_CAPABILITY, 1, 0, "lrte_dphy_capability" },
+	{ CCS_R_ALPS_CAPABILITY_DPHY, 1, 0, "alps_capability_dphy" },
+	{ CCS_R_ALPS_CAPABILITY_CPHY, 1, 0, "alps_capability_cphy" },
+	{ CCS_R_SCRAMBLING_CAPABILITY, 1, 0, "scrambling_capability" },
+	{ CCS_R_DPHY_MANUAL_CONSTANT, 1, 0, "dphy_manual_constant" },
+	{ CCS_R_CPHY_MANUAL_CONSTANT, 1, 0, "cphy_manual_constant" },
+	{ CCS_R_CSI2_INTERFACE_CAPABILITY_MISC, 1, 0, "CSI2_interface_capability_misc" },
+	{ CCS_R_PHY_CTRL_CAPABILITY_3, 1, 0, "PHY_ctrl_capability_3" },
+	{ CCS_R_DPHY_SF, 1, 0, "dphy_sf" },
+	{ CCS_R_CPHY_SF, 1, 0, "cphy_sf" },
+	{ CCS_R_DPHY_LIMITS_1, 1, 0, "dphy_limits_1" },
+	{ CCS_R_DPHY_LIMITS_2, 1, 0, "dphy_limits_2" },
+	{ CCS_R_DPHY_LIMITS_3, 1, 0, "dphy_limits_3" },
+	{ CCS_R_DPHY_LIMITS_4, 1, 0, "dphy_limits_4" },
+	{ CCS_R_DPHY_LIMITS_5, 1, 0, "dphy_limits_5" },
+	{ CCS_R_DPHY_LIMITS_6, 1, 0, "dphy_limits_6" },
+	{ CCS_R_CPHY_LIMITS_1, 1, 0, "cphy_limits_1" },
+	{ CCS_R_CPHY_LIMITS_2, 1, 0, "cphy_limits_2" },
+	{ CCS_R_CPHY_LIMITS_3, 1, 0, "cphy_limits_3" },
+	{ CCS_R_MIN_FRAME_LENGTH_LINES_BIN, 2, 0, "min_frame_length_lines_bin" },
+	{ CCS_R_MAX_FRAME_LENGTH_LINES_BIN, 2, 0, "max_frame_length_lines_bin" },
+	{ CCS_R_MIN_LINE_LENGTH_PCK_BIN, 2, 0, "min_line_length_pck_bin" },
+	{ CCS_R_MAX_LINE_LENGTH_PCK_BIN, 2, 0, "max_line_length_pck_bin" },
+	{ CCS_R_MIN_LINE_BLANKING_PCK_BIN, 2, 0, "min_line_blanking_pck_bin" },
+	{ CCS_R_FINE_INTEGRATION_TIME_MIN_BIN, 2, 0, "fine_integration_time_min_bin" },
+	{ CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN, 2, 0, "fine_integration_time_max_margin_bin" },
+	{ CCS_R_BINNING_CAPABILITY, 1, 0, "binning_capability" },
+	{ CCS_R_BINNING_WEIGHTING_CAPABILITY, 1, 0, "binning_weighting_capability" },
+	{ CCS_R_BINNING_SUB_TYPES, 1, 0, "binning_sub_types" },
+	{ CCS_R_BINNING_SUB_TYPE(0), 64, 0, "binning_sub_type" },
+	{ CCS_R_BINNING_WEIGHTING_MONO_CAPABILITY, 1, 0, "binning_weighting_mono_capability" },
+	{ CCS_R_BINNING_SUB_TYPES_MONO, 1, 0, "binning_sub_types_mono" },
+	{ CCS_R_BINNING_SUB_TYPE_MONO(0), 64, 0, "binning_sub_type_mono" },
+	{ CCS_R_DATA_TRANSFER_IF_CAPABILITY, 1, 0, "data_transfer_if_capability" },
+	{ CCS_R_SHADING_CORRECTION_CAPABILITY, 1, 0, "shading_correction_capability" },
+	{ CCS_R_GREEN_IMBALANCE_CAPABILITY, 1, 0, "green_imbalance_capability" },
+	{ CCS_R_MODULE_SPECIFIC_CORRECTION_CAPABILITY, 1, 0, "module_specific_correction_capability" },
+	{ CCS_R_DEFECT_CORRECTION_CAPABILITY, 2, 0, "defect_correction_capability" },
+	{ CCS_R_DEFECT_CORRECTION_CAPABILITY_2, 2, 0, "defect_correction_capability_2" },
+	{ CCS_R_NF_CAPABILITY, 1, 0, "nf_capability" },
+	{ CCS_R_OB_READOUT_CAPABILITY, 1, 0, "ob_readout_capability" },
+	{ CCS_R_COLOR_FEEDBACK_CAPABILITY, 1, 0, "color_feedback_capability" },
+	{ CCS_R_CFA_PATTERN_CAPABILITY, 1, 0, "CFA_pattern_capability" },
+	{ CCS_R_CFA_PATTERN_CONVERSION_CAPABILITY, 1, 0, "CFA_pattern_conversion_capability" },
+	{ CCS_R_FLASH_MODE_CAPABILITY, 1, 0, "flash_mode_capability" },
+	{ CCS_R_SA_STROBE_MODE_CAPABILITY, 1, 0, "sa_strobe_mode_capability" },
+	{ CCS_R_RESET_MAX_DELAY, 1, 0, "reset_max_delay" },
+	{ CCS_R_RESET_MIN_TIME, 1, 0, "reset_min_time" },
+	{ CCS_R_PDAF_CAPABILITY_1, 1, 0, "pdaf_capability_1" },
+	{ CCS_R_PDAF_CAPABILITY_2, 1, 0, "pdaf_capability_2" },
+	{ CCS_R_BRACKETING_LUT_CAPABILITY_1, 1, 0, "bracketing_lut_capability_1" },
+	{ CCS_R_BRACKETING_LUT_CAPABILITY_2, 1, 0, "bracketing_lut_capability_2" },
+	{ CCS_R_BRACKETING_LUT_SIZE, 1, 0, "bracketing_lut_size" },
+	{ 0 } /* Guardian */
+};
diff --git a/drivers/media/i2c/smiapp/ccs-limits.h b/drivers/media/i2c/smiapp/ccs-limits.h
new file mode 100644
index 000000000000..0da422b889a0
--- /dev/null
+++ b/drivers/media/i2c/smiapp/ccs-limits.h
@@ -0,0 +1,258 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
+/* Copyright (C) 2019--2020 Intel Corporation */
+
+#ifndef __CCS_LIMITS_H__
+#define __CCS_LIMITS_H__
+
+#include "ccs-os.h"
+
+struct ccs_limit {
+	uint32_t reg;
+	uint16_t size;
+	uint16_t flags;
+	const char *name;
+};
+
+#define CCS_L_FL_SAME_REG	(1U << 0)
+
+extern const struct ccs_limit ccs_limits[];
+
+#define CCS_L_FRAME_FORMAT_MODEL_TYPE				0
+#define CCS_L_FRAME_FORMAT_MODEL_SUBTYPE			1
+#define CCS_L_FRAME_FORMAT_DESCRIPTOR				2
+#define CCS_L_FRAME_FORMAT_DESCRIPTOR_OFFSET(n)			((n) * 2)
+#define CCS_L_FRAME_FORMAT_DESCRIPTOR_4				3
+#define CCS_L_FRAME_FORMAT_DESCRIPTOR_4_OFFSET(n)		((n) * 4)
+#define CCS_L_ANALOG_GAIN_CAPABILITY				4
+#define CCS_L_ANALOG_GAIN_CODE_MIN				5
+#define CCS_L_ANALOG_GAIN_CODE_MAX				6
+#define CCS_L_ANALOG_GAIN_CODE_STEP				7
+#define CCS_L_ANALOG_GAIN_TYPE					8
+#define CCS_L_ANALOG_GAIN_M0					9
+#define CCS_L_ANALOG_GAIN_C0					10
+#define CCS_L_ANALOG_GAIN_M1					11
+#define CCS_L_ANALOG_GAIN_C1					12
+#define CCS_L_ANALOG_LINEAR_GAIN_MIN				13
+#define CCS_L_ANALOG_LINEAR_GAIN_MAX				14
+#define CCS_L_ANALOG_LINEAR_GAIN_STEP_SIZE			15
+#define CCS_L_ANALOG_EXPONENTIAL_GAIN_MIN			16
+#define CCS_L_ANALOG_EXPONENTIAL_GAIN_MAX			17
+#define CCS_L_ANALOG_EXPONENTIAL_GAIN_STEP_SIZE			18
+#define CCS_L_DATA_FORMAT_MODEL_TYPE				19
+#define CCS_L_DATA_FORMAT_MODEL_SUBTYPE				20
+#define CCS_L_DATA_FORMAT_DESCRIPTOR				21
+#define CCS_L_DATA_FORMAT_DESCRIPTOR_OFFSET(n)			((n) * 2)
+#define CCS_L_INTEGRATION_TIME_CAPABILITY			22
+#define CCS_L_COARSE_INTEGRATION_TIME_MIN			23
+#define CCS_L_COARSE_INTEGRATION_TIME_MAX_MARGIN		24
+#define CCS_L_FINE_INTEGRATION_TIME_MIN				25
+#define CCS_L_FINE_INTEGRATION_TIME_MAX_MARGIN			26
+#define CCS_L_DIGITAL_GAIN_CAPABILITY				27
+#define CCS_L_DIGITAL_GAIN_MIN					28
+#define CCS_L_DIGITAL_GAIN_MAX					29
+#define CCS_L_DIGITAL_GAIN_STEP_SIZE				30
+#define CCS_L_PEDESTAL_CAPABILITY				31
+#define CCS_L_ADC_CAPABILITY					32
+#define CCS_L_ADC_BIT_DEPTH_CAPABILITY				33
+#define CCS_L_MIN_EXT_CLK_FREQ_MHZ				34
+#define CCS_L_MAX_EXT_CLK_FREQ_MHZ				35
+#define CCS_L_MIN_PRE_PLL_CLK_DIV				36
+#define CCS_L_MAX_PRE_PLL_CLK_DIV				37
+#define CCS_L_MIN_PLL_IP_CLK_FREQ_MHZ				38
+#define CCS_L_MAX_PLL_IP_CLK_FREQ_MHZ				39
+#define CCS_L_MIN_PLL_MULTIPLIER				40
+#define CCS_L_MAX_PLL_MULTIPLIER				41
+#define CCS_L_MIN_PLL_OP_CLK_FREQ_MHZ				42
+#define CCS_L_MAX_PLL_OP_CLK_FREQ_MHZ				43
+#define CCS_L_MIN_VT_SYS_CLK_DIV				44
+#define CCS_L_MAX_VT_SYS_CLK_DIV				45
+#define CCS_L_MIN_VT_SYS_CLK_FREQ_MHZ				46
+#define CCS_L_MAX_VT_SYS_CLK_FREQ_MHZ				47
+#define CCS_L_MIN_VT_PIX_CLK_FREQ_MHZ				48
+#define CCS_L_MAX_VT_PIX_CLK_FREQ_MHZ				49
+#define CCS_L_MIN_VT_PIX_CLK_DIV				50
+#define CCS_L_MAX_VT_PIX_CLK_DIV				51
+#define CCS_L_CLOCK_CALCULATION					52
+#define CCS_L_NUM_OF_VT_LANES					53
+#define CCS_L_NUM_OF_OP_LANES					54
+#define CCS_L_OP_BITS_PER_LANE					55
+#define CCS_L_MIN_FRAME_LENGTH_LINES				56
+#define CCS_L_MAX_FRAME_LENGTH_LINES				57
+#define CCS_L_MIN_LINE_LENGTH_PCK				58
+#define CCS_L_MAX_LINE_LENGTH_PCK				59
+#define CCS_L_MIN_LINE_BLANKING_PCK				60
+#define CCS_L_MIN_FRAME_BLANKING_LINES				61
+#define CCS_L_MIN_LINE_LENGTH_PCK_STEP_SIZE			62
+#define CCS_L_TIMING_MODE_CAPABILITY				63
+#define CCS_L_FRAME_MARGIN_MAX_VALUE				64
+#define CCS_L_FRAME_MARGIN_MIN_VALUE				65
+#define CCS_L_GAIN_DELAY_TYPE					66
+#define CCS_L_MIN_OP_SYS_CLK_DIV				67
+#define CCS_L_MAX_OP_SYS_CLK_DIV				68
+#define CCS_L_MIN_OP_SYS_CLK_FREQ_MHZ				69
+#define CCS_L_MAX_OP_SYS_CLK_FREQ_MHZ				70
+#define CCS_L_MIN_OP_PIX_CLK_DIV				71
+#define CCS_L_MAX_OP_PIX_CLK_DIV				72
+#define CCS_L_MIN_OP_PIX_CLK_FREQ_MHZ				73
+#define CCS_L_MAX_OP_PIX_CLK_FREQ_MHZ				74
+#define CCS_L_X_ADDR_MIN					75
+#define CCS_L_Y_ADDR_MIN					76
+#define CCS_L_X_ADDR_MAX					77
+#define CCS_L_Y_ADDR_MAX					78
+#define CCS_L_MIN_X_OUTPUT_SIZE					79
+#define CCS_L_MIN_Y_OUTPUT_SIZE					80
+#define CCS_L_MAX_X_OUTPUT_SIZE					81
+#define CCS_L_MAX_Y_OUTPUT_SIZE					82
+#define CCS_L_X_ADDR_START_DIV_CONSTANT				83
+#define CCS_L_Y_ADDR_START_DIV_CONSTANT				84
+#define CCS_L_X_ADDR_END_DIV_CONSTANT				85
+#define CCS_L_Y_ADDR_END_DIV_CONSTANT				86
+#define CCS_L_X_SIZE_DIV					87
+#define CCS_L_Y_SIZE_DIV					88
+#define CCS_L_X_OUTPUT_DIV					89
+#define CCS_L_Y_OUTPUT_DIV					90
+#define CCS_L_NON_FLEXIBLE_RESOLUTION_SUPPORT			91
+#define CCS_L_MIN_OP_PRE_PLL_CLK_DIV				92
+#define CCS_L_MAX_OP_PRE_PLL_CLK_DIV				93
+#define CCS_L_MIN_OP_PLL_IP_CLK_FREQ_MHZ			94
+#define CCS_L_MAX_OP_PLL_IP_CLK_FREQ_MHZ			95
+#define CCS_L_MIN_OP_PLL_MULTIPLIER				96
+#define CCS_L_MAX_OP_PLL_MULTIPLIER				97
+#define CCS_L_MIN_OP_PLL_OP_CLK_FREQ_MHZ			98
+#define CCS_L_MAX_OP_PLL_OP_CLK_FREQ_MHZ			99
+#define CCS_L_CLOCK_TREE_PLL_CAPABILITY				100
+#define CCS_L_CLOCK_CAPA_TYPE_CAPABILITY			101
+#define CCS_L_MIN_EVEN_INC					102
+#define CCS_L_MIN_ODD_INC					103
+#define CCS_L_MAX_EVEN_INC					104
+#define CCS_L_MAX_ODD_INC					105
+#define CCS_L_AUX_SUBSAMP_CAPABILITY				106
+#define CCS_L_AUX_SUBSAMP_MONO_CAPABILITY			107
+#define CCS_L_MONOCHROME_CAPABILITY				108
+#define CCS_L_PIXEL_READOUT_CAPABILITY				109
+#define CCS_L_MIN_EVEN_INC_MONO					110
+#define CCS_L_MAX_EVEN_INC_MONO					111
+#define CCS_L_MIN_ODD_INC_MONO					112
+#define CCS_L_MAX_ODD_INC_MONO					113
+#define CCS_L_MIN_EVEN_INC_BC2					114
+#define CCS_L_MAX_EVEN_INC_BC2					115
+#define CCS_L_MIN_ODD_INC_BC2					116
+#define CCS_L_MAX_ODD_INC_BC2					117
+#define CCS_L_MIN_EVEN_INC_MONO_BC2				118
+#define CCS_L_MAX_EVEN_INC_MONO_BC2				119
+#define CCS_L_MIN_ODD_INC_MONO_BC2				120
+#define CCS_L_MAX_ODD_INC_MONO_BC2				121
+#define CCS_L_SCALING_CAPABILITY				122
+#define CCS_L_SCALER_M_MIN					123
+#define CCS_L_SCALER_M_MAX					124
+#define CCS_L_SCALER_N_MIN					125
+#define CCS_L_SCALER_N_MAX					126
+#define CCS_L_DIGITAL_CROP_CAPABILITY				127
+#define CCS_L_HDR_CAPABILITY_1					128
+#define CCS_L_MIN_HDR_BIT_DEPTH					129
+#define CCS_L_HDR_RESOLUTION_SUB_TYPES				130
+#define CCS_L_HDR_RESOLUTION_SUB_TYPE				131
+#define CCS_L_HDR_RESOLUTION_SUB_TYPE_OFFSET(n)			(n)
+#define CCS_L_HDR_CAPABILITY_2					132
+#define CCS_L_MAX_HDR_BIT_DEPTH					133
+#define CCS_L_USL_SUPPORT_CAPABILITY				134
+#define CCS_L_USL_CLOCK_MODE_D_CAPABILITY			135
+#define CCS_L_MIN_OP_SYS_CLK_DIV_REV				136
+#define CCS_L_MAX_OP_SYS_CLK_DIV_REV				137
+#define CCS_L_MIN_OP_PIX_CLK_DIV_REV				138
+#define CCS_L_MAX_OP_PIX_CLK_DIV_REV				139
+#define CCS_L_MIN_OP_SYS_CLK_FREQ_REV_MHZ			140
+#define CCS_L_MAX_OP_SYS_CLK_FREQ_REV_MHZ			141
+#define CCS_L_MIN_OP_PIX_CLK_FREQ_REV_MHZ			142
+#define CCS_L_MAX_OP_PIX_CLK_FREQ_REV_MHZ			143
+#define CCS_L_MAX_BITRATE_REV_D_MODE_MBPS			144
+#define CCS_L_MAX_SYMRATE_REV_C_MODE_MSPS			145
+#define CCS_L_COMPRESSION_CAPABILITY				146
+#define CCS_L_TEST_MODE_CAPABILITY				147
+#define CCS_L_PN9_DATA_FORMAT1					148
+#define CCS_L_PN9_DATA_FORMAT2					149
+#define CCS_L_PN9_DATA_FORMAT3					150
+#define CCS_L_PN9_DATA_FORMAT4					151
+#define CCS_L_PN9_MISC_CAPABILITY				152
+#define CCS_L_TEST_PATTERN_CAPABILITY				153
+#define CCS_L_PATTERN_SIZE_DIV_M1				154
+#define CCS_L_FIFO_SUPPORT_CAPABILITY				155
+#define CCS_L_PHY_CTRL_CAPABILITY				156
+#define CCS_L_CSI_DPHY_LANE_MODE_CAPABILITY			157
+#define CCS_L_CSI_SIGNALING_MODE_CAPABILITY			158
+#define CCS_L_FAST_STANDBY_CAPABILITY				159
+#define CCS_L_CSI_ADDRESS_CONTROL_CAPABILITY			160
+#define CCS_L_DATA_TYPE_CAPABILITY				161
+#define CCS_L_CSI_CPHY_LANE_MODE_CAPABILITY			162
+#define CCS_L_EMB_DATA_CAPABILITY				163
+#define CCS_L_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS		164
+#define CCS_L_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS_OFFSET(n)	((n) * 4)
+#define CCS_L_TEMP_SENSOR_CAPABILITY				165
+#define CCS_L_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS		166
+#define CCS_L_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS_OFFSET(n)	((n) * 4)
+#define CCS_L_DPHY_EQUALIZATION_CAPABILITY			167
+#define CCS_L_CPHY_EQUALIZATION_CAPABILITY			168
+#define CCS_L_DPHY_PREAMBLE_CAPABILITY				169
+#define CCS_L_DPHY_SSC_CAPABILITY				170
+#define CCS_L_CPHY_CALIBRATION_CAPABILITY			171
+#define CCS_L_DPHY_CALIBRATION_CAPABILITY			172
+#define CCS_L_PHY_CTRL_CAPABILITY_2				173
+#define CCS_L_LRTE_CPHY_CAPABILITY				174
+#define CCS_L_LRTE_DPHY_CAPABILITY				175
+#define CCS_L_ALPS_CAPABILITY_DPHY				176
+#define CCS_L_ALPS_CAPABILITY_CPHY				177
+#define CCS_L_SCRAMBLING_CAPABILITY				178
+#define CCS_L_DPHY_MANUAL_CONSTANT				179
+#define CCS_L_CPHY_MANUAL_CONSTANT				180
+#define CCS_L_CSI2_INTERFACE_CAPABILITY_MISC			181
+#define CCS_L_PHY_CTRL_CAPABILITY_3				182
+#define CCS_L_DPHY_SF						183
+#define CCS_L_CPHY_SF						184
+#define CCS_L_DPHY_LIMITS_1					185
+#define CCS_L_DPHY_LIMITS_2					186
+#define CCS_L_DPHY_LIMITS_3					187
+#define CCS_L_DPHY_LIMITS_4					188
+#define CCS_L_DPHY_LIMITS_5					189
+#define CCS_L_DPHY_LIMITS_6					190
+#define CCS_L_CPHY_LIMITS_1					191
+#define CCS_L_CPHY_LIMITS_2					192
+#define CCS_L_CPHY_LIMITS_3					193
+#define CCS_L_MIN_FRAME_LENGTH_LINES_BIN			194
+#define CCS_L_MAX_FRAME_LENGTH_LINES_BIN			195
+#define CCS_L_MIN_LINE_LENGTH_PCK_BIN				196
+#define CCS_L_MAX_LINE_LENGTH_PCK_BIN				197
+#define CCS_L_MIN_LINE_BLANKING_PCK_BIN				198
+#define CCS_L_FINE_INTEGRATION_TIME_MIN_BIN			199
+#define CCS_L_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN		200
+#define CCS_L_BINNING_CAPABILITY				201
+#define CCS_L_BINNING_WEIGHTING_CAPABILITY			202
+#define CCS_L_BINNING_SUB_TYPES					203
+#define CCS_L_BINNING_SUB_TYPE					204
+#define CCS_L_BINNING_SUB_TYPE_OFFSET(n)			(n)
+#define CCS_L_BINNING_WEIGHTING_MONO_CAPABILITY			205
+#define CCS_L_BINNING_SUB_TYPES_MONO				206
+#define CCS_L_BINNING_SUB_TYPE_MONO				207
+#define CCS_L_BINNING_SUB_TYPE_MONO_OFFSET(n)			(n)
+#define CCS_L_DATA_TRANSFER_IF_CAPABILITY			208
+#define CCS_L_SHADING_CORRECTION_CAPABILITY			209
+#define CCS_L_GREEN_IMBALANCE_CAPABILITY			210
+#define CCS_L_MODULE_SPECIFIC_CORRECTION_CAPABILITY		211
+#define CCS_L_DEFECT_CORRECTION_CAPABILITY			212
+#define CCS_L_DEFECT_CORRECTION_CAPABILITY_2			213
+#define CCS_L_NF_CAPABILITY					214
+#define CCS_L_OB_READOUT_CAPABILITY				215
+#define CCS_L_COLOR_FEEDBACK_CAPABILITY				216
+#define CCS_L_CFA_PATTERN_CAPABILITY				217
+#define CCS_L_CFA_PATTERN_CONVERSION_CAPABILITY			218
+#define CCS_L_FLASH_MODE_CAPABILITY				219
+#define CCS_L_SA_STROBE_MODE_CAPABILITY				220
+#define CCS_L_RESET_MAX_DELAY					221
+#define CCS_L_RESET_MIN_TIME					222
+#define CCS_L_PDAF_CAPABILITY_1					223
+#define CCS_L_PDAF_CAPABILITY_2					224
+#define CCS_L_BRACKETING_LUT_CAPABILITY_1			225
+#define CCS_L_BRACKETING_LUT_CAPABILITY_2			226
+#define CCS_L_BRACKETING_LUT_SIZE				227
+#define CCS_L_LAST						228
+
+#endif /* __CCS_LIMITS_H__ */
diff --git a/drivers/media/i2c/smiapp/ccs-os.h b/drivers/media/i2c/smiapp/ccs-os.h
new file mode 100644
index 000000000000..f2445733f5d5
--- /dev/null
+++ b/drivers/media/i2c/smiapp/ccs-os.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2020 Intel Corporation */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/limits.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+typedef struct device * printf_ctx;
+#define os_printf	dev_dbg
+#define os_calloc(size)	kvcalloc(1, size, GFP_KERNEL)
+#define os_free		kvfree
+#define align2		ALIGN
diff --git a/drivers/media/i2c/smiapp/ccs-regs.h b/drivers/media/i2c/smiapp/ccs-regs.h
new file mode 100644
index 000000000000..039d65930319
--- /dev/null
+++ b/drivers/media/i2c/smiapp/ccs-regs.h
@@ -0,0 +1,953 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
+/* Copyright (C) 2019--2020 Intel Corporation */
+
+#ifndef __CCS_REGS_H__
+#define __CCS_REGS_H__
+
+#define CCS_FL_BASE		16
+#define CCS_FL_16BIT		(1U << CCS_FL_BASE)
+#define CCS_FL_32BIT		(1U << (CCS_FL_BASE + 1))
+#define CCS_FL_FLOAT_IREAL	(1U << (CCS_FL_BASE + 2))
+#define CCS_FL_IREAL		(1U << (CCS_FL_BASE + 3))
+
+#define CCS_R_ADDR(r)		((r) & 0xffff)
+
+#define CCS_R_MODULE_MODEL_ID					(0x0000 | CCS_FL_16BIT)
+#define CCS_R_MODULE_REVISION_NUMBER_MAJOR			0x0002
+#define CCS_R_FRAME_COUNT					0x0005
+#define CCS_R_PIXEL_ORDER					0x0006
+#define CCS_PIXEL_ORDER_GRBG					0U
+#define CCS_PIXEL_ORDER_RGGB					1U
+#define CCS_PIXEL_ORDER_BGGR					2U
+#define CCS_PIXEL_ORDER_GBRG					3U
+#define CCS_R_MIPI_CCS_VERSION					0x0007
+#define CCS_MIPI_CCS_VERSION_V1_0				0x10
+#define CCS_MIPI_CCS_VERSION_V1_1				0x11
+#define CCS_MIPI_CCS_VERSION_MAJOR_SHIFT			4U
+#define CCS_MIPI_CCS_VERSION_MAJOR_MASK				0xf0
+#define CCS_MIPI_CCS_VERSION_MINOR_SHIFT			0U
+#define CCS_MIPI_CCS_VERSION_MINOR_MASK				0xf
+#define CCS_R_DATA_PEDESTAL					(0x0008 | CCS_FL_16BIT)
+#define CCS_R_MODULE_MANUFACTURER_ID				(0x000e | CCS_FL_16BIT)
+#define CCS_R_MODULE_REVISION_NUMBER_MINOR			0x0010
+#define CCS_R_MODULE_DATE_YEAR					0x0012
+#define CCS_R_MODULE_DATE_MONTH					0x0013
+#define CCS_R_MODULE_DATE_DAY					0x0014
+#define CCS_R_MODULE_DATE_PHASE					0x0015
+#define CCS_MODULE_DATE_PHASE_SHIFT				0U
+#define CCS_MODULE_DATE_PHASE_MASK				0x7
+#define CCS_MODULE_DATE_PHASE_TS				0U
+#define CCS_MODULE_DATE_PHASE_ES				1U
+#define CCS_MODULE_DATE_PHASE_CS				2U
+#define CCS_MODULE_DATE_PHASE_MP				3U
+#define CCS_R_SENSOR_MODEL_ID					(0x0016 | CCS_FL_16BIT)
+#define CCS_R_SENSOR_REVISION_NUMBER				0x0018
+#define CCS_R_SENSOR_FIRMWARE_VERSION				0x001a
+#define CCS_R_SERIAL_NUMBER					(0x001c | CCS_FL_32BIT)
+#define CCS_R_SENSOR_MANUFACTURER_ID				(0x0020 | CCS_FL_16BIT)
+#define CCS_R_SENSOR_REVISION_NUMBER_16				(0x0022 | CCS_FL_16BIT)
+#define CCS_R_FRAME_FORMAT_MODEL_TYPE				0x0040
+#define CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE			1U
+#define CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE			2U
+#define CCS_R_FRAME_FORMAT_MODEL_SUBTYPE			0x0041
+#define CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_SHIFT		0U
+#define CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_MASK		0xf
+#define CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT		4U
+#define CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK		0xf0
+#define CCS_R_FRAME_FORMAT_DESCRIPTOR(n)			((0x0042 | CCS_FL_16BIT) + (n) * 2)
+#define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_MIN_N			0U
+#define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_MAX_N			14U
+#define CCS_R_FRAME_FORMAT_DESCRIPTOR_4(n)			((0x0060 | CCS_FL_32BIT) + (n) * 4)
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_SHIFT		0U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_MASK			0xfff
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_SHIFT			12U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MASK			0xf000
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_EMBEDDED		1U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_DUMMY_PIXEL		2U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_BLACK_PIXEL		3U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_DARK_PIXEL		4U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL		5U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_0	8U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_1	9U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_2	10U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_3	11U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_4	12U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_5	13U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MANUF_SPECIFIC_6	14U
+#define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_4_MIN_N			0U
+#define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_4_MAX_N			7U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PIXELS_SHIFT		0U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PIXELS_MASK		0xffff
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_SHIFT		28U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MASK		0xf0000000
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_EMBEDDED		1U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_DUMMY_PIXEL		2U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_BLACK_PIXEL		3U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_DARK_PIXEL		4U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_VISIBLE_PIXEL	5U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_0	8U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_1	9U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_2	10U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_3	11U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_4	12U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_5	13U
+#define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_6	14U
+#define CCS_R_ANALOG_GAIN_CAPABILITY				(0x0080 | CCS_FL_16BIT)
+#define CCS_ANALOG_GAIN_CAPABILITY_GLOBAL			0U
+#define CCS_ANALOG_GAIN_CAPABILITY_ALTERNATE_GLOBAL		2U
+#define CCS_R_ANALOG_GAIN_CODE_MIN				(0x0084 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_CODE_MAX				(0x0086 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_CODE_STEP				(0x0088 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_TYPE					(0x008a | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_M0					(0x008c | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_C0					(0x008e | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_M1					(0x0090 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_C1					(0x0092 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_LINEAR_GAIN_MIN				(0x0094 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_LINEAR_GAIN_MAX				(0x0096 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_LINEAR_GAIN_STEP_SIZE			(0x0098 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_MIN			(0x009a | CCS_FL_16BIT)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_MAX			(0x009c | CCS_FL_16BIT)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_STEP_SIZE			(0x009e | CCS_FL_16BIT)
+#define CCS_R_DATA_FORMAT_MODEL_TYPE				0x00c0
+#define CCS_DATA_FORMAT_MODEL_TYPE_NORMAL			1U
+#define CCS_DATA_FORMAT_MODEL_TYPE_EXTENDED			2U
+#define CCS_R_DATA_FORMAT_MODEL_SUBTYPE				0x00c1
+#define CCS_DATA_FORMAT_MODEL_SUBTYPE_ROWS_SHIFT		0U
+#define CCS_DATA_FORMAT_MODEL_SUBTYPE_ROWS_MASK			0xf
+#define CCS_DATA_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT		4U
+#define CCS_DATA_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK		0xf0
+#define CCS_R_DATA_FORMAT_DESCRIPTOR(n)				((0x00c2 | CCS_FL_16BIT) + (n) * 2)
+#define CCS_LIM_DATA_FORMAT_DESCRIPTOR_MIN_N			0U
+#define CCS_LIM_DATA_FORMAT_DESCRIPTOR_MAX_N			15U
+#define CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_SHIFT		0U
+#define CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_MASK		0xff
+#define CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_SHIFT		8U
+#define CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_MASK		0xff00
+#define CCS_R_MODE_SELECT					0x0100
+#define CCS_MODE_SELECT_SOFTWARE_STANDBY			0U
+#define CCS_MODE_SELECT_STREAMING				1U
+#define CCS_R_IMAGE_ORIENTATION					0x0101
+#define CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR			(1U << 0)
+#define CCS_IMAGE_ORIENTATION_VERTICAL_FLIP			(1U << 1)
+#define CCS_R_SOFTWARE_RESET					0x0103
+#define CCS_SOFTWARE_RESET_OFF					0U
+#define CCS_SOFTWARE_RESET_ON					1U
+#define CCS_R_GROUPED_PARAMETER_HOLD				0x0104
+#define CCS_R_MASK_CORRUPTED_FRAMES				0x0105
+#define CCS_MASK_CORRUPTED_FRAMES_ALLOW				0U
+#define CCS_MASK_CORRUPTED_FRAMES_MASK				1U
+#define CCS_R_FAST_STANDBY_CTRL					0x0106
+#define CCS_FAST_STANDBY_CTRL_COMPLETE_FRAMES			0U
+#define CCS_FAST_STANDBY_CTRL_FRAME_TRUNCATION			1U
+#define CCS_R_CCI_ADDRESS_CTRL					0x0107
+#define CCS_R_2ND_CCI_IF_CTRL					0x0108
+#define CCS_2ND_CCI_IF_CTRL_ENABLE				(1U << 0)
+#define CCS_2ND_CCI_IF_CTRL_ACK					(1U << 1)
+#define CCS_R_2ND_CCI_ADDRESS_CTRL				0x0109
+#define CCS_R_CSI_CHANNEL_IDENTIFIER				0x0110
+#define CCS_R_CSI_SIGNALING_MODE				0x0111
+#define CCS_CSI_SIGNALING_MODE_CSI_2_DPHY			2U
+#define CCS_CSI_SIGNALING_MODE_CSI_2_CPHY			3U
+#define CCS_R_CSI_DATA_FORMAT					(0x0112 | CCS_FL_16BIT)
+#define CCS_R_CSI_LANE_MODE					0x0114
+#define CCS_R_DPCM_FRAME_DT					0x011d
+#define CCS_R_BOTTOM_EMBEDDED_DATA_DT				0x011e
+#define CCS_R_BOTTOM_EMBEDDED_DATA_VC				0x011f
+#define CCS_R_GAIN_MODE						0x0120
+#define CCS_GAIN_MODE_GLOBAL					0U
+#define CCS_GAIN_MODE_ALTERNATE					1U
+#define CCS_R_ADC_BIT_DEPTH					0x0121
+#define CCS_R_EMB_DATA_CTRL					0x0122
+#define CCS_EMB_DATA_CTRL_RAW8_PACKING_FOR_RAW16		(1U << 0)
+#define CCS_EMB_DATA_CTRL_RAW10_PACKING_FOR_RAW20		(1U << 1)
+#define CCS_EMB_DATA_CTRL_RAW12_PACKING_FOR_RAW24		(1U << 2)
+#define CCS_R_GPIO_TRIG_MODE					0x0130
+#define CCS_R_EXTCLK_FREQUENCY_MHZ				(0x0136 | (CCS_FL_16BIT | CCS_FL_IREAL))
+#define CCS_R_TEMP_SENSOR_CTRL					0x0138
+#define CCS_TEMP_SENSOR_CTRL_ENABLE				(1U << 0)
+#define CCS_R_TEMP_SENSOR_MODE					0x0139
+#define CCS_R_TEMP_SENSOR_OUTPUT				0x013a
+#define CCS_R_FINE_INTEGRATION_TIME				(0x0200 | CCS_FL_16BIT)
+#define CCS_R_COARSE_INTEGRATION_TIME				(0x0202 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_CODE_GLOBAL				(0x0204 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_LINEAR_GAIN_GLOBAL				(0x0206 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_GLOBAL			(0x0208 | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_GAIN_GLOBAL				(0x020e | CCS_FL_16BIT)
+#define CCS_R_SHORT_ANALOG_GAIN_GLOBAL				(0x0216 | CCS_FL_16BIT)
+#define CCS_R_SHORT_DIGITAL_GAIN_GLOBAL				(0x0218 | CCS_FL_16BIT)
+#define CCS_R_HDR_MODE						0x0220
+#define CCS_HDR_MODE_ENABLED					(1U << 0)
+#define CCS_HDR_MODE_SEPARATE_ANALOG_GAIN			(1U << 1)
+#define CCS_HDR_MODE_UPSCALING					(1U << 2)
+#define CCS_HDR_MODE_RESET_SYNC					(1U << 3)
+#define CCS_HDR_MODE_TIMING_MODE				(1U << 4)
+#define CCS_HDR_MODE_EXPOSURE_CTRL_DIRECT			(1U << 5)
+#define CCS_HDR_MODE_SEPARATE_DIGITAL_GAIN			(1U << 6)
+#define CCS_R_HDR_RESOLUTION_REDUCTION				0x0221
+#define CCS_HDR_RESOLUTION_REDUCTION_ROW_SHIFT			0U
+#define CCS_HDR_RESOLUTION_REDUCTION_ROW_MASK			0xf
+#define CCS_HDR_RESOLUTION_REDUCTION_COLUMN_SHIFT		4U
+#define CCS_HDR_RESOLUTION_REDUCTION_COLUMN_MASK		0xf0
+#define CCS_R_EXPOSURE_RATIO					0x0222
+#define CCS_R_HDR_INTERNAL_BIT_DEPTH				0x0223
+#define CCS_R_DIRECT_SHORT_INTEGRATION_TIME			(0x0224 | CCS_FL_16BIT)
+#define CCS_R_SHORT_ANALOG_LINEAR_GAIN_GLOBAL			(0x0226 | CCS_FL_16BIT)
+#define CCS_R_SHORT_ANALOG_EXPONENTIAL_GAIN_GLOBAL		(0x0228 | CCS_FL_16BIT)
+#define CCS_R_VT_PIX_CLK_DIV					(0x0300 | CCS_FL_16BIT)
+#define CCS_R_VT_SYS_CLK_DIV					(0x0302 | CCS_FL_16BIT)
+#define CCS_R_PRE_PLL_CLK_DIV					(0x0304 | CCS_FL_16BIT)
+#define CCS_R_PLL_MULTIPLIER					(0x0306 | CCS_FL_16BIT)
+#define CCS_R_OP_PIX_CLK_DIV					(0x0308 | CCS_FL_16BIT)
+#define CCS_R_OP_SYS_CLK_DIV					(0x030a | CCS_FL_16BIT)
+#define CCS_R_OP_PRE_PLL_CLK_DIV				(0x030c | CCS_FL_16BIT)
+#define CCS_R_OP_PLL_MULTIPLIER					(0x031e | CCS_FL_16BIT)
+#define CCS_R_PLL_MODE						0x0310
+#define CCS_PLL_MODE_SHIFT					0U
+#define CCS_PLL_MODE_MASK					0x1
+#define CCS_PLL_MODE_SINGLE					0U
+#define CCS_PLL_MODE_DUAL					1U
+#define CCS_R_OP_PIX_CLK_DIV_REV				(0x0312 | CCS_FL_16BIT)
+#define CCS_R_OP_SYS_CLK_DIV_REV				(0x0314 | CCS_FL_16BIT)
+#define CCS_R_FRAME_LENGTH_LINES				(0x0340 | CCS_FL_16BIT)
+#define CCS_R_LINE_LENGTH_PCK					(0x0342 | CCS_FL_16BIT)
+#define CCS_R_X_ADDR_START					(0x0344 | CCS_FL_16BIT)
+#define CCS_R_Y_ADDR_START					(0x0346 | CCS_FL_16BIT)
+#define CCS_R_X_ADDR_END					(0x0348 | CCS_FL_16BIT)
+#define CCS_R_Y_ADDR_END					(0x034a | CCS_FL_16BIT)
+#define CCS_R_X_OUTPUT_SIZE					(0x034c | CCS_FL_16BIT)
+#define CCS_R_Y_OUTPUT_SIZE					(0x034e | CCS_FL_16BIT)
+#define CCS_R_FRAME_LENGTH_CTRL					0x0350
+#define CCS_FRAME_LENGTH_CTRL_AUTOMATIC				(1U << 0)
+#define CCS_R_TIMING_MODE_CTRL					0x0352
+#define CCS_TIMING_MODE_CTRL_MANUAL_READOUT			(1U << 0)
+#define CCS_TIMING_MODE_CTRL_DELAYED_EXPOSURE			(1U << 1)
+#define CCS_R_START_READOUT_RS					0x0353
+#define CCS_START_READOUT_RS_MANUAL_READOUT_START		(1U << 0)
+#define CCS_R_FRAME_MARGIN					(0x0354 | CCS_FL_16BIT)
+#define CCS_R_X_EVEN_INC					(0x0380 | CCS_FL_16BIT)
+#define CCS_R_X_ODD_INC						(0x0382 | CCS_FL_16BIT)
+#define CCS_R_Y_EVEN_INC					(0x0384 | CCS_FL_16BIT)
+#define CCS_R_Y_ODD_INC						(0x0386 | CCS_FL_16BIT)
+#define CCS_R_MONOCHROME_EN					0x0390
+#define CCS_MONOCHROME_EN_ENABLED				0U
+#define CCS_R_SCALING_MODE					(0x0400 | CCS_FL_16BIT)
+#define CCS_SCALING_MODE_NO_SCALING				0U
+#define CCS_SCALING_MODE_HORIZONTAL				1U
+#define CCS_R_SCALE_M						(0x0404 | CCS_FL_16BIT)
+#define CCS_R_SCALE_N						(0x0406 | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_CROP_X_OFFSET				(0x0408 | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_CROP_Y_OFFSET				(0x040a | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_CROP_IMAGE_WIDTH				(0x040c | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_CROP_IMAGE_HEIGHT				(0x040e | CCS_FL_16BIT)
+#define CCS_R_COMPRESSION_MODE					(0x0500 | CCS_FL_16BIT)
+#define CCS_COMPRESSION_MODE_NONE				0U
+#define CCS_COMPRESSION_MODE_DPCM_PCM_SIMPLE			1U
+#define CCS_R_TEST_PATTERN_MODE					(0x0600 | CCS_FL_16BIT)
+#define CCS_TEST_PATTERN_MODE_NONE				0U
+#define CCS_TEST_PATTERN_MODE_SOLID_COLOR			1U
+#define CCS_TEST_PATTERN_MODE_COLOR_BARS			2U
+#define CCS_TEST_PATTERN_MODE_FADE_TO_GREY			3U
+#define CCS_TEST_PATTERN_MODE_PN9				4U
+#define CCS_TEST_PATTERN_MODE_COLOR_TILE			5U
+#define CCS_R_TEST_DATA_RED					(0x0602 | CCS_FL_16BIT)
+#define CCS_R_TEST_DATA_GREENR					(0x0604 | CCS_FL_16BIT)
+#define CCS_R_TEST_DATA_BLUE					(0x0606 | CCS_FL_16BIT)
+#define CCS_R_TEST_DATA_GREENB					(0x0608 | CCS_FL_16BIT)
+#define CCS_R_VALUE_STEP_SIZE_SMOOTH				0x060a
+#define CCS_R_VALUE_STEP_SIZE_QUANTISED				0x060b
+#define CCS_R_TCLK_POST						0x0800
+#define CCS_R_THS_PREPARE					0x0801
+#define CCS_R_THS_ZERO_MIN					0x0802
+#define CCS_R_THS_TRAIL						0x0803
+#define CCS_R_TCLK_TRAIL_MIN					0x0804
+#define CCS_R_TCLK_PREPARE					0x0805
+#define CCS_R_TCLK_ZERO						0x0806
+#define CCS_R_TLPX						0x0807
+#define CCS_R_PHY_CTRL						0x0808
+#define CCS_PHY_CTRL_AUTO					0U
+#define CCS_PHY_CTRL_UI						1U
+#define CCS_PHY_CTRL_MANUAL					2U
+#define CCS_R_TCLK_POST_EX					(0x080a | CCS_FL_16BIT)
+#define CCS_R_THS_PREPARE_EX					(0x080c | CCS_FL_16BIT)
+#define CCS_R_THS_ZERO_MIN_EX					(0x080e | CCS_FL_16BIT)
+#define CCS_R_THS_TRAIL_EX					(0x0810 | CCS_FL_16BIT)
+#define CCS_R_TCLK_TRAIL_MIN_EX					(0x0812 | CCS_FL_16BIT)
+#define CCS_R_TCLK_PREPARE_EX					(0x0814 | CCS_FL_16BIT)
+#define CCS_R_TCLK_ZERO_EX					(0x0816 | CCS_FL_16BIT)
+#define CCS_R_TLPX_EX						(0x0818 | CCS_FL_16BIT)
+#define CCS_R_REQUESTED_LINK_RATE				(0x0820 | CCS_FL_32BIT)
+#define CCS_R_DPHY_EQUALIZATION_MODE				0x0824
+#define CCS_DPHY_EQUALIZATION_MODE_EQ2				(1U << 0)
+#define CCS_R_PHY_EQUALIZATION_CTRL				0x0825
+#define CCS_PHY_EQUALIZATION_CTRL_ENABLE			(1U << 0)
+#define CCS_R_DPHY_PREAMBLE_CTRL				0x0826
+#define CCS_DPHY_PREAMBLE_CTRL_ENABLE				(1U << 0)
+#define CCS_R_DPHY_PREAMBLE_LENGTH				0x0826
+#define CCS_R_PHY_SSC_CTRL					0x0828
+#define CCS_PHY_SSC_CTRL_ENABLE					(1U << 0)
+#define CCS_R_MANUAL_LP_CTRL					0x0829
+#define CCS_MANUAL_LP_CTRL_ENABLE				(1U << 0)
+#define CCS_R_TWAKEUP						0x082a
+#define CCS_R_TINIT						0x082b
+#define CCS_R_THS_EXIT						0x082c
+#define CCS_R_THS_EXIT_EX					(0x082e | CCS_FL_16BIT)
+#define CCS_R_PHY_PERIODIC_CALIBRATION_CTRL			0x0830
+#define CCS_PHY_PERIODIC_CALIBRATION_CTRL_FRAME_BLANKING	(1U << 0)
+#define CCS_R_PHY_PERIODIC_CALIBRATION_INTERVAL			0x0831
+#define CCS_R_PHY_INIT_CALIBRATION_CTRL				0x0832
+#define CCS_PHY_INIT_CALIBRATION_CTRL_STREAM_START		(1U << 0)
+#define CCS_R_DPHY_CALIBRATION_MODE				0x0833
+#define CCS_DPHY_CALIBRATION_MODE_ALSO_ALTERNATE		(1U << 0)
+#define CCS_R_CPHY_CALIBRATION_MODE				0x0834
+#define CCS_CPHY_CALIBRATION_MODE_FORMAT_1			0U
+#define CCS_CPHY_CALIBRATION_MODE_FORMAT_2			1U
+#define CCS_CPHY_CALIBRATION_MODE_FORMAT_3			2U
+#define CCS_R_T3_CALPREAMBLE_LENGTH				0x0835
+#define CCS_R_T3_CALPREAMBLE_LENGTH_PER				0x0836
+#define CCS_R_T3_CALALTSEQ_LENGTH				0x0837
+#define CCS_R_T3_CALALTSEQ_LENGTH_PER				0x0838
+#define CCS_R_FM2_INIT_SEED					(0x083a | CCS_FL_16BIT)
+#define CCS_R_T3_CALUDEFSEQ_LENGTH				(0x083c | CCS_FL_16BIT)
+#define CCS_R_T3_CALUDEFSEQ_LENGTH_PER				(0x083e | CCS_FL_16BIT)
+#define CCS_R_TGR_PREAMBLE_LENGTH				0x0841
+#define CCS_TGR_PREAMBLE_LENGTH_PREAMABLE_PROG_SEQ		(1U << 7)
+#define CCS_TGR_PREAMBLE_LENGTH_BEGIN_PREAMBLE_LENGTH_SHIFT	0U
+#define CCS_TGR_PREAMBLE_LENGTH_BEGIN_PREAMBLE_LENGTH_MASK	0x3f
+#define CCS_R_TGR_POST_LENGTH					0x0842
+#define CCS_TGR_POST_LENGTH_POST_LENGTH_SHIFT			0U
+#define CCS_TGR_POST_LENGTH_POST_LENGTH_MASK			0x1f
+#define CCS_R_TGR_PREAMBLE_PROG_SEQUENCE(n2)			(0x0843 + (n2))
+#define CCS_LIM_TGR_PREAMBLE_PROG_SEQUENCE_MIN_N2		0U
+#define CCS_LIM_TGR_PREAMBLE_PROG_SEQUENCE_MAX_N2		6U
+#define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_1_SHIFT		3U
+#define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_1_MASK		0x38
+#define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_SHIFT		0U
+#define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_MASK		0x7
+#define CCS_R_T3_PREPARE					(0x084e | CCS_FL_16BIT)
+#define CCS_R_T3_LPX						(0x0850 | CCS_FL_16BIT)
+#define CCS_R_ALPS_CTRL						0x085a
+#define CCS_ALPS_CTRL_LVLP_DPHY					(1U << 0)
+#define CCS_ALPS_CTRL_LVLP_CPHY					(1U << 1)
+#define CCS_ALPS_CTRL_ALP_CPHY					(1U << 2)
+#define CCS_R_TX_REG_CSI_EPD_EN_SSP_CPHY			(0x0860 | CCS_FL_16BIT)
+#define CCS_R_TX_REG_CSI_EPD_OP_SLP_CPHY			(0x0862 | CCS_FL_16BIT)
+#define CCS_R_TX_REG_CSI_EPD_EN_SSP_DPHY			(0x0864 | CCS_FL_16BIT)
+#define CCS_R_TX_REG_CSI_EPD_OP_SLP_DPHY			(0x0866 | CCS_FL_16BIT)
+#define CCS_R_TX_REG_CSI_EPD_MISC_OPTION_CPHY			0x0868
+#define CCS_R_TX_REG_CSI_EPD_MISC_OPTION_DPHY			0x0869
+#define CCS_R_SCRAMBLING_CTRL					0x0870
+#define CCS_SCRAMBLING_CTRL_ENABLED				(1U << 0)
+#define CCS_SCRAMBLING_CTRL_SHIFT				2U
+#define CCS_SCRAMBLING_CTRL_MASK				0xc
+#define CCS_SCRAMBLING_CTRL_1_SEED_CPHY				0U
+#define CCS_SCRAMBLING_CTRL_4_SEED_CPHY				3U
+#define CCS_R_LANE_SEED_VALUE(seed, lane)			((0x0872 | CCS_FL_16BIT) + (seed) * 16 + (lane) * 2)
+#define CCS_LIM_LANE_SEED_VALUE_MIN_SEED			0U
+#define CCS_LIM_LANE_SEED_VALUE_MAX_SEED			3U
+#define CCS_LIM_LANE_SEED_VALUE_MIN_LANE			0U
+#define CCS_LIM_LANE_SEED_VALUE_MAX_LANE			7U
+#define CCS_R_TX_USL_REV_ENTRY					(0x08c0 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_REV_CLOCK_COUNTER				(0x08c2 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_REV_LP_COUNTER				(0x08c4 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_REV_FRAME_COUNTER				(0x08c6 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_REV_CHRONOLOGICAL_TIMER			(0x08c8 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_FWD_ENTRY					(0x08ca | CCS_FL_16BIT)
+#define CCS_R_TX_USL_GPIO					(0x08cc | CCS_FL_16BIT)
+#define CCS_R_TX_USL_OPERATION					(0x08ce | CCS_FL_16BIT)
+#define CCS_TX_USL_OPERATION_RESET				(1U << 0)
+#define CCS_R_TX_USL_ALP_CTRL					(0x08d0 | CCS_FL_16BIT)
+#define CCS_TX_USL_ALP_CTRL_CLOCK_PAUSE				(1U << 0)
+#define CCS_R_TX_USL_APP_BTA_ACK_TIMEOUT			(0x08d2 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_SNS_BTA_ACK_TIMEOUT			(0x08d2 | CCS_FL_16BIT)
+#define CCS_R_USL_CLOCK_MODE_D_CTRL				0x08d2
+#define CCS_USL_CLOCK_MODE_D_CTRL_CONT_CLOCK_STANDBY		(1U << 0)
+#define CCS_USL_CLOCK_MODE_D_CTRL_CONT_CLOCK_VBLANK		(1U << 1)
+#define CCS_USL_CLOCK_MODE_D_CTRL_CONT_CLOCK_HBLANK		(1U << 2)
+#define CCS_R_BINNING_MODE					0x0900
+#define CCS_R_BINNING_TYPE					0x0901
+#define CCS_R_BINNING_WEIGHTING					0x0902
+#define CCS_R_DATA_TRANSFER_IF_1_CTRL				0x0a00
+#define CCS_DATA_TRANSFER_IF_1_CTRL_ENABLE			(1U << 0)
+#define CCS_DATA_TRANSFER_IF_1_CTRL_WRITE			(1U << 1)
+#define CCS_DATA_TRANSFER_IF_1_CTRL_CLEAR_ERROR			(1U << 2)
+#define CCS_R_DATA_TRANSFER_IF_1_STATUS				0x0a01
+#define CCS_DATA_TRANSFER_IF_1_STATUS_READ_IF_READY		(1U << 0)
+#define CCS_DATA_TRANSFER_IF_1_STATUS_WRITE_IF_READY		(1U << 1)
+#define CCS_DATA_TRANSFER_IF_1_STATUS_DATA_CORRUPTED		(1U << 2)
+#define CCS_DATA_TRANSFER_IF_1_STATUS_IMPROPER_IF_USAGE		(1U << 3)
+#define CCS_R_DATA_TRANSFER_IF_1_PAGE_SELECT			0x0a02
+#define CCS_R_DATA_TRANSFER_IF_1_DATA(p)			(0x0a04 + (p))
+#define CCS_LIM_DATA_TRANSFER_IF_1_DATA_MIN_P			0U
+#define CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P			63U
+#define CCS_R_SHADING_CORRECTION_EN				0x0b00
+#define CCS_SHADING_CORRECTION_EN_ENABLE			(1U << 0)
+#define CCS_R_LUMINANCE_CORRECTION_LEVEL			0x0b01
+#define CCS_R_GREEN_IMBALANCE_FILTER_EN				0x0b02
+#define CCS_GREEN_IMBALANCE_FILTER_EN_ENABLE			(1U << 0)
+#define CCS_R_MAPPED_DEFECT_CORRECT_EN				0x0b05
+#define CCS_MAPPED_DEFECT_CORRECT_EN_ENABLE			(1U << 0)
+#define CCS_R_SINGLE_DEFECT_CORRECT_EN				0x0b06
+#define CCS_SINGLE_DEFECT_CORRECT_EN_ENABLE			(1U << 0)
+#define CCS_R_DYNAMIC_COUPLET_CORRECT_EN			0x0b08
+#define CCS_DYNAMIC_COUPLET_CORRECT_EN_ENABLE			(1U << 0)
+#define CCS_R_COMBINED_DEFECT_CORRECT_EN			0x0b0a
+#define CCS_COMBINED_DEFECT_CORRECT_EN_ENABLE			(1U << 0)
+#define CCS_R_MODULE_SPECIFIC_CORRECTION_EN			0x0b0c
+#define CCS_MODULE_SPECIFIC_CORRECTION_EN_ENABLE		(1U << 0)
+#define CCS_R_DYNAMIC_TRIPLET_DEFECT_CORRECT_EN			0x0b13
+#define CCS_DYNAMIC_TRIPLET_DEFECT_CORRECT_EN_ENABLE		(1U << 0)
+#define CCS_R_NF_CTRL						0x0b15
+#define CCS_NF_CTRL_LUMA					(1U << 0)
+#define CCS_NF_CTRL_CHROMA					(1U << 1)
+#define CCS_NF_CTRL_COMBINED					(1U << 2)
+#define CCS_R_OB_READOUT_CONTROL				0x0b30
+#define CCS_OB_READOUT_CONTROL_ENABLE				(1U << 0)
+#define CCS_OB_READOUT_CONTROL_INTERLEAVING			(1U << 1)
+#define CCS_R_OB_VIRTUAL_CHANNEL				0x0b31
+#define CCS_R_OB_DT						0x0b32
+#define CCS_R_OB_DATA_FORMAT					0x0b33
+#define CCS_R_COLOR_TEMPERATURE					(0x0b8c | CCS_FL_16BIT)
+#define CCS_R_ABSOLUTE_GAIN_GREENR				(0x0b8e | CCS_FL_16BIT)
+#define CCS_R_ABSOLUTE_GAIN_RED					(0x0b90 | CCS_FL_16BIT)
+#define CCS_R_ABSOLUTE_GAIN_BLUE				(0x0b92 | CCS_FL_16BIT)
+#define CCS_R_ABSOLUTE_GAIN_GREENB				(0x0b94 | CCS_FL_16BIT)
+#define CCS_R_CFA_CONVERSION_CTRL				0x0ba0
+#define CCS_CFA_CONVERSION_CTRL_BAYER_CONVERSION_ENABLE		(1U << 0)
+#define CCS_R_FLASH_STROBE_ADJUSTMENT				0x0c12
+#define CCS_R_FLASH_STROBE_START_POINT				(0x0c14 | CCS_FL_16BIT)
+#define CCS_R_TFLASH_STROBE_DELAY_RS_CTRL			(0x0c16 | CCS_FL_16BIT)
+#define CCS_R_TFLASH_STROBE_WIDTH_HIGH_RS_CTRL			(0x0c18 | CCS_FL_16BIT)
+#define CCS_R_FLASH_MODE_RS					0x0c1a
+#define CCS_FLASH_MODE_RS_CONTINUOUS				(1U << 0)
+#define CCS_FLASH_MODE_RS_TRUNCATE				(1U << 1)
+#define CCS_FLASH_MODE_RS_ASYNC					(1U << 3)
+#define CCS_R_FLASH_TRIGGER_RS					0x0c1b
+#define CCS_R_FLASH_STATUS					0x0c1c
+#define CCS_FLASH_STATUS_RETIMED				(1U << 0)
+#define CCS_R_SA_STROBE_MODE					0x0c1d
+#define CCS_SA_STROBE_MODE_CONTINUOUS				(1U << 0)
+#define CCS_SA_STROBE_MODE_TRUNCATE				(1U << 1)
+#define CCS_SA_STROBE_MODE_ASYNC				(1U << 3)
+#define CCS_SA_STROBE_MODE_ADJUST_EDGE				(1U << 4)
+#define CCS_R_SA_STROBE_START_POINT				(0x0c1e | CCS_FL_16BIT)
+#define CCS_R_TSA_STROBE_DELAY_CTRL				(0x0c20 | CCS_FL_16BIT)
+#define CCS_R_TSA_STROBE_WIDTH_CTRL				(0x0c22 | CCS_FL_16BIT)
+#define CCS_R_SA_STROBE_TRIGGER					0x0c24
+#define CCS_R_SA_STROBE_STATUS					0x0c25
+#define CCS_SA_STROBE_STATUS_RETIMED				(1U << 0)
+#define CCS_R_TSA_STROBE_RE_DELAY_CTRL				(0x0c30 | CCS_FL_16BIT)
+#define CCS_R_TSA_STROBE_FE_DELAY_CTRL				(0x0c32 | CCS_FL_16BIT)
+#define CCS_R_PDAF_CTRL						(0x0d00 | CCS_FL_16BIT)
+#define CCS_PDAF_CTRL_ENABLE					(1U << 0)
+#define CCS_PDAF_CTRL_PROCESSED					(1U << 1)
+#define CCS_PDAF_CTRL_INTERLEAVED				(1U << 2)
+#define CCS_PDAF_CTRL_VISIBLE_PDAF_CORRECTION			(1U << 3)
+#define CCS_R_PDAF_VC						0x0d02
+#define CCS_R_PDAF_DT						0x0d03
+#define CCS_R_PD_X_ADDR_START					(0x0d04 | CCS_FL_16BIT)
+#define CCS_R_PD_Y_ADDR_START					(0x0d06 | CCS_FL_16BIT)
+#define CCS_R_PD_X_ADDR_END					(0x0d08 | CCS_FL_16BIT)
+#define CCS_R_PD_Y_ADDR_END					(0x0d0a | CCS_FL_16BIT)
+#define CCS_R_BRACKETING_LUT_CTRL				0x0e00
+#define CCS_R_BRACKETING_LUT_MODE				0x0e01
+#define CCS_BRACKETING_LUT_MODE_CONTINUE_STREAMING		(1U << 0)
+#define CCS_BRACKETING_LUT_MODE_LOOP_MODE			(1U << 1)
+#define CCS_R_BRACKETING_LUT_ENTRY_CTRL				0x0e02
+#define CCS_R_BRACKETING_LUT_FRAME(n)				(0x0e10 + (n))
+#define CCS_LIM_BRACKETING_LUT_FRAME_MIN_N			0U
+#define CCS_LIM_BRACKETING_LUT_FRAME_MAX_N			239U
+#define CCS_R_INTEGRATION_TIME_CAPABILITY			(0x1000 | CCS_FL_16BIT)
+#define CCS_INTEGRATION_TIME_CAPABILITY_FINE			(1U << 0)
+#define CCS_R_COARSE_INTEGRATION_TIME_MIN			(0x1004 | CCS_FL_16BIT)
+#define CCS_R_COARSE_INTEGRATION_TIME_MAX_MARGIN		(0x1006 | CCS_FL_16BIT)
+#define CCS_R_FINE_INTEGRATION_TIME_MIN				(0x1008 | CCS_FL_16BIT)
+#define CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN			(0x100a | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_GAIN_CAPABILITY				0x1081
+#define CCS_DIGITAL_GAIN_CAPABILITY_NONE			0U
+#define CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL			2U
+#define CCS_R_DIGITAL_GAIN_MIN					(0x1084 | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_GAIN_MAX					(0x1086 | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_GAIN_STEP_SIZE				(0x1088 | CCS_FL_16BIT)
+#define CCS_R_PEDESTAL_CAPABILITY				0x10e0
+#define CCS_R_ADC_CAPABILITY					0x10f0
+#define CCS_ADC_CAPABILITY_BIT_DEPTH_CTRL			(1U << 0)
+#define CCS_R_ADC_BIT_DEPTH_CAPABILITY				(0x10f4 | CCS_FL_32BIT)
+#define CCS_R_MIN_EXT_CLK_FREQ_MHZ				(0x1100 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_EXT_CLK_FREQ_MHZ				(0x1104 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_PRE_PLL_CLK_DIV				(0x1108 | CCS_FL_16BIT)
+#define CCS_R_MAX_PRE_PLL_CLK_DIV				(0x110a | CCS_FL_16BIT)
+#define CCS_R_MIN_PLL_IP_CLK_FREQ_MHZ				(0x110c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_PLL_IP_CLK_FREQ_MHZ				(0x1110 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_PLL_MULTIPLIER				(0x1114 | CCS_FL_16BIT)
+#define CCS_R_MAX_PLL_MULTIPLIER				(0x1116 | CCS_FL_16BIT)
+#define CCS_R_MIN_PLL_OP_CLK_FREQ_MHZ				(0x1118 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_PLL_OP_CLK_FREQ_MHZ				(0x111c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_VT_SYS_CLK_DIV				(0x1120 | CCS_FL_16BIT)
+#define CCS_R_MAX_VT_SYS_CLK_DIV				(0x1122 | CCS_FL_16BIT)
+#define CCS_R_MIN_VT_SYS_CLK_FREQ_MHZ				(0x1124 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_VT_SYS_CLK_FREQ_MHZ				(0x1128 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_VT_PIX_CLK_FREQ_MHZ				(0x112c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_VT_PIX_CLK_FREQ_MHZ				(0x1130 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_VT_PIX_CLK_DIV				(0x1134 | CCS_FL_16BIT)
+#define CCS_R_MAX_VT_PIX_CLK_DIV				(0x1136 | CCS_FL_16BIT)
+#define CCS_R_CLOCK_CALCULATION					0x1138
+#define CCS_CLOCK_CALCULATION_LANE_SPEED			(1U << 0)
+#define CCS_CLOCK_CALCULATION_LINK_DECOUPLED			(1U << 1)
+#define CCS_CLOCK_CALCULATION_DUAL_PLL_OP_SYS_DDR		(1U << 2)
+#define CCS_CLOCK_CALCULATION_DUAL_PLL_OP_PIX_DDR		(1U << 3)
+#define CCS_R_NUM_OF_VT_LANES					0x1139
+#define CCS_R_NUM_OF_OP_LANES					0x113a
+#define CCS_R_OP_BITS_PER_LANE					0x113b
+#define CCS_R_MIN_FRAME_LENGTH_LINES				(0x1140 | CCS_FL_16BIT)
+#define CCS_R_MAX_FRAME_LENGTH_LINES				(0x1142 | CCS_FL_16BIT)
+#define CCS_R_MIN_LINE_LENGTH_PCK				(0x1144 | CCS_FL_16BIT)
+#define CCS_R_MAX_LINE_LENGTH_PCK				(0x1146 | CCS_FL_16BIT)
+#define CCS_R_MIN_LINE_BLANKING_PCK				(0x1148 | CCS_FL_16BIT)
+#define CCS_R_MIN_FRAME_BLANKING_LINES				(0x114a | CCS_FL_16BIT)
+#define CCS_R_MIN_LINE_LENGTH_PCK_STEP_SIZE			0x114c
+#define CCS_R_TIMING_MODE_CAPABILITY				0x114d
+#define CCS_TIMING_MODE_CAPABILITY_AUTO_FRAME_LENGTH		(1U << 0)
+#define CCS_TIMING_MODE_CAPABILITY_ROLLING_SHUTTER_MANUAL_READOUT      (1U << 2)
+#define CCS_TIMING_MODE_CAPABILITY_DELAYED_EXPOSURE_START	(1U << 3)
+#define CCS_TIMING_MODE_CAPABILITY_MANUAL_EXPOSURE_EMBEDDED_DATA       (1U << 4)
+#define CCS_R_FRAME_MARGIN_MAX_VALUE				(0x114e | CCS_FL_16BIT)
+#define CCS_R_FRAME_MARGIN_MIN_VALUE				0x1150
+#define CCS_R_GAIN_DELAY_TYPE					0x1151
+#define CCS_GAIN_DELAY_TYPE_FIXED				0U
+#define CCS_GAIN_DELAY_TYPE_VARIABLE				1U
+#define CCS_R_MIN_OP_SYS_CLK_DIV				(0x1160 | CCS_FL_16BIT)
+#define CCS_R_MAX_OP_SYS_CLK_DIV				(0x1162 | CCS_FL_16BIT)
+#define CCS_R_MIN_OP_SYS_CLK_FREQ_MHZ				(0x1164 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_OP_SYS_CLK_FREQ_MHZ				(0x1168 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_OP_PIX_CLK_DIV				(0x116c | CCS_FL_16BIT)
+#define CCS_R_MAX_OP_PIX_CLK_DIV				(0x116e | CCS_FL_16BIT)
+#define CCS_R_MIN_OP_PIX_CLK_FREQ_MHZ				(0x1170 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_OP_PIX_CLK_FREQ_MHZ				(0x1174 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_X_ADDR_MIN					(0x1180 | CCS_FL_16BIT)
+#define CCS_R_Y_ADDR_MIN					(0x1182 | CCS_FL_16BIT)
+#define CCS_R_X_ADDR_MAX					(0x1184 | CCS_FL_16BIT)
+#define CCS_R_Y_ADDR_MAX					(0x1186 | CCS_FL_16BIT)
+#define CCS_R_MIN_X_OUTPUT_SIZE					(0x1188 | CCS_FL_16BIT)
+#define CCS_R_MIN_Y_OUTPUT_SIZE					(0x118a | CCS_FL_16BIT)
+#define CCS_R_MAX_X_OUTPUT_SIZE					(0x118c | CCS_FL_16BIT)
+#define CCS_R_MAX_Y_OUTPUT_SIZE					(0x118e | CCS_FL_16BIT)
+#define CCS_R_X_ADDR_START_DIV_CONSTANT				0x1190
+#define CCS_R_Y_ADDR_START_DIV_CONSTANT				0x1191
+#define CCS_R_X_ADDR_END_DIV_CONSTANT				0x1192
+#define CCS_R_Y_ADDR_END_DIV_CONSTANT				0x1193
+#define CCS_R_X_SIZE_DIV					0x1194
+#define CCS_R_Y_SIZE_DIV					0x1195
+#define CCS_R_X_OUTPUT_DIV					0x1196
+#define CCS_R_Y_OUTPUT_DIV					0x1197
+#define CCS_R_NON_FLEXIBLE_RESOLUTION_SUPPORT			0x1198
+#define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_NEW_PIX_ADDR	(1U << 0)
+#define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_NEW_OUTPUT_RES	(1U << 1)
+#define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_OUTPUT_CROP_NO_PAD	(1U << 2)
+#define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_OUTPUT_SIZE_LANE_DEP       (1U << 3)
+#define CCS_R_MIN_OP_PRE_PLL_CLK_DIV				(0x11a0 | CCS_FL_16BIT)
+#define CCS_R_MAX_OP_PRE_PLL_CLK_DIV				(0x11a2 | CCS_FL_16BIT)
+#define CCS_R_MIN_OP_PLL_IP_CLK_FREQ_MHZ			(0x11a4 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_OP_PLL_IP_CLK_FREQ_MHZ			(0x11a8 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_OP_PLL_MULTIPLIER				(0x11ac | CCS_FL_16BIT)
+#define CCS_R_MAX_OP_PLL_MULTIPLIER				(0x11ae | CCS_FL_16BIT)
+#define CCS_R_MIN_OP_PLL_OP_CLK_FREQ_MHZ			(0x11b0 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_OP_PLL_OP_CLK_FREQ_MHZ			(0x11b4 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_CLOCK_TREE_PLL_CAPABILITY				0x11b8
+#define CCS_CLOCK_TREE_PLL_CAPABILITY_DUAL_PLL			(1U << 0)
+#define CCS_CLOCK_TREE_PLL_CAPABILITY_SINGLE_PLL		(1U << 1)
+#define CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER		(1U << 2)
+#define CCS_CLOCK_TREE_PLL_CAPABILITY_FLEXIBLE_OP_PIX_CLK_DIV	(1U << 3)
+#define CCS_R_CLOCK_CAPA_TYPE_CAPABILITY			0x11b9
+#define CCS_CLOCK_CAPA_TYPE_CAPABILITY_IREAL			(1U << 0)
+#define CCS_R_MIN_EVEN_INC					(0x11c0 | CCS_FL_16BIT)
+#define CCS_R_MIN_ODD_INC					(0x11c2 | CCS_FL_16BIT)
+#define CCS_R_MAX_EVEN_INC					(0x11c4 | CCS_FL_16BIT)
+#define CCS_R_MAX_ODD_INC					(0x11c6 | CCS_FL_16BIT)
+#define CCS_R_AUX_SUBSAMP_CAPABILITY				0x11c8
+#define CCS_AUX_SUBSAMP_CAPABILITY_FACTOR_POWER_OF_2		(1U << 1)
+#define CCS_R_AUX_SUBSAMP_MONO_CAPABILITY			0x11c9
+#define CCS_AUX_SUBSAMP_MONO_CAPABILITY_FACTOR_POWER_OF_2	(1U << 1)
+#define CCS_R_MONOCHROME_CAPABILITY				0x11ca
+#define CCS_MONOCHROME_CAPABILITY_INC_ODD			0U
+#define CCS_MONOCHROME_CAPABILITY_INC_EVEN			1U
+#define CCS_R_PIXEL_READOUT_CAPABILITY				0x11cb
+#define CCS_PIXEL_READOUT_CAPABILITY_BAYER			0U
+#define CCS_PIXEL_READOUT_CAPABILITY_MONOCHROME			1U
+#define CCS_PIXEL_READOUT_CAPABILITY_BAYER_AND_MONO		2U
+#define CCS_R_MIN_EVEN_INC_MONO					(0x11cc | CCS_FL_16BIT)
+#define CCS_R_MAX_EVEN_INC_MONO					(0x11ce | CCS_FL_16BIT)
+#define CCS_R_MIN_ODD_INC_MONO					(0x11d0 | CCS_FL_16BIT)
+#define CCS_R_MAX_ODD_INC_MONO					(0x11d2 | CCS_FL_16BIT)
+#define CCS_R_MIN_EVEN_INC_BC2					(0x11d4 | CCS_FL_16BIT)
+#define CCS_R_MAX_EVEN_INC_BC2					(0x11d6 | CCS_FL_16BIT)
+#define CCS_R_MIN_ODD_INC_BC2					(0x11d8 | CCS_FL_16BIT)
+#define CCS_R_MAX_ODD_INC_BC2					(0x11da | CCS_FL_16BIT)
+#define CCS_R_MIN_EVEN_INC_MONO_BC2				(0x11dc | CCS_FL_16BIT)
+#define CCS_R_MAX_EVEN_INC_MONO_BC2				(0x11de | CCS_FL_16BIT)
+#define CCS_R_MIN_ODD_INC_MONO_BC2				(0x11f0 | CCS_FL_16BIT)
+#define CCS_R_MAX_ODD_INC_MONO_BC2				(0x11f2 | CCS_FL_16BIT)
+#define CCS_R_SCALING_CAPABILITY				(0x1200 | CCS_FL_16BIT)
+#define CCS_SCALING_CAPABILITY_NONE				0U
+#define CCS_SCALING_CAPABILITY_HORIZONTAL			1U
+#define CCS_SCALING_CAPABILITY_RESERVED				2U
+#define CCS_R_SCALER_M_MIN					(0x1204 | CCS_FL_16BIT)
+#define CCS_R_SCALER_M_MAX					(0x1206 | CCS_FL_16BIT)
+#define CCS_R_SCALER_N_MIN					(0x1208 | CCS_FL_16BIT)
+#define CCS_R_SCALER_N_MAX					(0x120a | CCS_FL_16BIT)
+#define CCS_R_DIGITAL_CROP_CAPABILITY				0x120e
+#define CCS_DIGITAL_CROP_CAPABILITY_NONE			0U
+#define CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP			1U
+#define CCS_R_HDR_CAPABILITY_1					0x1210
+#define CCS_HDR_CAPABILITY_1_2X2_BINNING			(1U << 0)
+#define CCS_HDR_CAPABILITY_1_COMBINED_ANALOG_GAIN		(1U << 1)
+#define CCS_HDR_CAPABILITY_1_SEPARATE_ANALOG_GAIN		(1U << 2)
+#define CCS_HDR_CAPABILITY_1_UPSCALING				(1U << 3)
+#define CCS_HDR_CAPABILITY_1_RESET_SYNC				(1U << 4)
+#define CCS_HDR_CAPABILITY_1_DIRECT_SHORT_EXP_TIMING		(1U << 5)
+#define CCS_HDR_CAPABILITY_1_DIRECT_SHORT_EXP_SYNTHESIS		(1U << 6)
+#define CCS_R_MIN_HDR_BIT_DEPTH					0x1211
+#define CCS_R_HDR_RESOLUTION_SUB_TYPES				0x1212
+#define CCS_R_HDR_RESOLUTION_SUB_TYPE(n)			(0x1213 + (n))
+#define CCS_LIM_HDR_RESOLUTION_SUB_TYPE_MIN_N			0U
+#define CCS_LIM_HDR_RESOLUTION_SUB_TYPE_MAX_N			1U
+#define CCS_HDR_RESOLUTION_SUB_TYPE_ROW_SHIFT			0U
+#define CCS_HDR_RESOLUTION_SUB_TYPE_ROW_MASK			0xf
+#define CCS_HDR_RESOLUTION_SUB_TYPE_COLUMN_SHIFT		4U
+#define CCS_HDR_RESOLUTION_SUB_TYPE_COLUMN_MASK			0xf0
+#define CCS_R_HDR_CAPABILITY_2					0x121b
+#define CCS_HDR_CAPABILITY_2_COMBINED_DIGITAL_GAIN		(1U << 0)
+#define CCS_HDR_CAPABILITY_2_SEPARATE_DIGITAL_GAIN		(1U << 1)
+#define CCS_HDR_CAPABILITY_2_TIMING_MODE			(1U << 3)
+#define CCS_HDR_CAPABILITY_2_SYNTHESIS_MODE			(1U << 4)
+#define CCS_R_MAX_HDR_BIT_DEPTH					0x121c
+#define CCS_R_USL_SUPPORT_CAPABILITY				0x1230
+#define CCS_USL_SUPPORT_CAPABILITY_CLOCK_TREE			(1U << 0)
+#define CCS_USL_SUPPORT_CAPABILITY_REV_CLOCK_TREE		(1U << 1)
+#define CCS_USL_SUPPORT_CAPABILITY_REV_CLOCK_CALC		(1U << 2)
+#define CCS_R_USL_CLOCK_MODE_D_CAPABILITY			0x1231
+#define CCS_USL_CLOCK_MODE_D_CAPABILITY_CONT_CLOCK_STANDBY	(1U << 0)
+#define CCS_USL_CLOCK_MODE_D_CAPABILITY_CONT_CLOCK_VBLANK	(1U << 1)
+#define CCS_USL_CLOCK_MODE_D_CAPABILITY_CONT_CLOCK_HBLANK	(1U << 2)
+#define CCS_USL_CLOCK_MODE_D_CAPABILITY_NONCONT_CLOCK_STANDBY	(1U << 3)
+#define CCS_USL_CLOCK_MODE_D_CAPABILITY_NONCONT_CLOCK_VBLANK	(1U << 4)
+#define CCS_USL_CLOCK_MODE_D_CAPABILITY_NONCONT_CLOCK_HBLANK	(1U << 5)
+#define CCS_R_MIN_OP_SYS_CLK_DIV_REV				0x1234
+#define CCS_R_MAX_OP_SYS_CLK_DIV_REV				0x1236
+#define CCS_R_MIN_OP_PIX_CLK_DIV_REV				0x1238
+#define CCS_R_MAX_OP_PIX_CLK_DIV_REV				0x123a
+#define CCS_R_MIN_OP_SYS_CLK_FREQ_REV_MHZ			(0x123c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_OP_SYS_CLK_FREQ_REV_MHZ			(0x1240 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MIN_OP_PIX_CLK_FREQ_REV_MHZ			(0x1244 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_OP_PIX_CLK_FREQ_REV_MHZ			(0x1248 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
+#define CCS_R_MAX_BITRATE_REV_D_MODE_MBPS			(0x124c | (CCS_FL_32BIT | CCS_FL_IREAL))
+#define CCS_R_MAX_SYMRATE_REV_C_MODE_MSPS			(0x1250 | (CCS_FL_32BIT | CCS_FL_IREAL))
+#define CCS_R_COMPRESSION_CAPABILITY				0x1300
+#define CCS_COMPRESSION_CAPABILITY_DPCM_PCM_SIMPLE		(1U << 0)
+#define CCS_R_TEST_MODE_CAPABILITY				(0x1310 | CCS_FL_16BIT)
+#define CCS_TEST_MODE_CAPABILITY_SOLID_COLOR			(1U << 0)
+#define CCS_TEST_MODE_CAPABILITY_COLOR_BARS			(1U << 1)
+#define CCS_TEST_MODE_CAPABILITY_FADE_TO_GREY			(1U << 2)
+#define CCS_TEST_MODE_CAPABILITY_PN9				(1U << 3)
+#define CCS_TEST_MODE_CAPABILITY_COLOR_TILE			(1U << 5)
+#define CCS_R_PN9_DATA_FORMAT1					0x1312
+#define CCS_R_PN9_DATA_FORMAT2					0x1313
+#define CCS_R_PN9_DATA_FORMAT3					0x1314
+#define CCS_R_PN9_DATA_FORMAT4					0x1315
+#define CCS_R_PN9_MISC_CAPABILITY				0x1316
+#define CCS_PN9_MISC_CAPABILITY_NUM_PIXELS_SHIFT		0U
+#define CCS_PN9_MISC_CAPABILITY_NUM_PIXELS_MASK			0x7
+#define CCS_PN9_MISC_CAPABILITY_COMPRESSION			(1U << 3)
+#define CCS_R_TEST_PATTERN_CAPABILITY				0x1317
+#define CCS_TEST_PATTERN_CAPABILITY_NO_REPEAT			(1U << 1)
+#define CCS_R_PATTERN_SIZE_DIV_M1				0x1318
+#define CCS_R_FIFO_SUPPORT_CAPABILITY				0x1502
+#define CCS_FIFO_SUPPORT_CAPABILITY_NONE			0U
+#define CCS_FIFO_SUPPORT_CAPABILITY_DERATING			1U
+#define CCS_FIFO_SUPPORT_CAPABILITY_DERATING_OVERRATING		2U
+#define CCS_R_PHY_CTRL_CAPABILITY				0x1600
+#define CCS_PHY_CTRL_CAPABILITY_AUTO_PHY_CTL			(1U << 0)
+#define CCS_PHY_CTRL_CAPABILITY_UI_PHY_CTL			(1U << 1)
+#define CCS_PHY_CTRL_CAPABILITY_DPHY_TIME_UI_REG_1_CTL		(1U << 2)
+#define CCS_PHY_CTRL_CAPABILITY_DPHY_TIME_UI_REG_2_CTL		(1U << 3)
+#define CCS_PHY_CTRL_CAPABILITY_DPHY_TIME_CTL			(1U << 4)
+#define CCS_PHY_CTRL_CAPABILITY_DPHY_EXT_TIME_UI_REG_1_CTL	(1U << 5)
+#define CCS_PHY_CTRL_CAPABILITY_DPHY_EXT_TIME_UI_REG_2_CTL	(1U << 6)
+#define CCS_PHY_CTRL_CAPABILITY_DPHY_EXT_TIME_CTL		(1U << 7)
+#define CCS_R_CSI_DPHY_LANE_MODE_CAPABILITY			0x1601
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_1_LANE		(1U << 0)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_2_LANE		(1U << 1)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_3_LANE		(1U << 2)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_4_LANE		(1U << 3)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_5_LANE		(1U << 4)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_6_LANE		(1U << 5)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_7_LANE		(1U << 6)
+#define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_8_LANE		(1U << 7)
+#define CCS_R_CSI_SIGNALING_MODE_CAPABILITY			0x1602
+#define CCS_CSI_SIGNALING_MODE_CAPABILITY_CSI_DPHY		(1U << 2)
+#define CCS_CSI_SIGNALING_MODE_CAPABILITY_CSI_CPHY		(1U << 3)
+#define CCS_R_FAST_STANDBY_CAPABILITY				0x1603
+#define CCS_FAST_STANDBY_CAPABILITY_NO_FRAME_TRUNCATION		0U
+#define CCS_FAST_STANDBY_CAPABILITY_FRAME_TRUNCATION		1U
+#define CCS_R_CSI_ADDRESS_CONTROL_CAPABILITY			0x1604
+#define CCS_CSI_ADDRESS_CONTROL_CAPABILITY_CCI_ADDR_CHANGE	(1U << 0)
+#define CCS_CSI_ADDRESS_CONTROL_CAPABILITY_2ND_CCI_ADDR		(1U << 1)
+#define CCS_CSI_ADDRESS_CONTROL_CAPABILITY_SW_CHANGEABLE_2ND_CCI_ADDR  (1U << 2)
+#define CCS_R_DATA_TYPE_CAPABILITY				0x1605
+#define CCS_DATA_TYPE_CAPABILITY_DPCM_PROGRAMMABLE		(1U << 0)
+#define CCS_DATA_TYPE_CAPABILITY_BOTTOM_EMBEDDED_DT_PROGRAMMABLE       (1U << 1)
+#define CCS_DATA_TYPE_CAPABILITY_BOTTOM_EMBEDDED_VC_PROGRAMMABLE       (1U << 2)
+#define CCS_DATA_TYPE_CAPABILITY_EXT_VC_RANGE			(1U << 3)
+#define CCS_R_CSI_CPHY_LANE_MODE_CAPABILITY			0x1606
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_1_LANE		(1U << 0)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_2_LANE		(1U << 1)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_3_LANE		(1U << 2)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_4_LANE		(1U << 3)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_5_LANE		(1U << 4)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_6_LANE		(1U << 5)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_7_LANE		(1U << 6)
+#define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_8_LANE		(1U << 7)
+#define CCS_R_EMB_DATA_CAPABILITY				0x1607
+#define CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW16		(1U << 0)
+#define CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW20		(1U << 1)
+#define CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW24		(1U << 2)
+#define CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW16		(1U << 3)
+#define CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW20		(1U << 4)
+#define CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW24		(1U << 5)
+#define CCS_R_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS(n)		((0x1608 | (CCS_FL_32BIT | CCS_FL_IREAL)) + ((n) < 4 ? (n) * 4 : 0x32 + ((n) - 4) * 4))
+#define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS_MIN_N	0U
+#define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS_MAX_N	7U
+#define CCS_R_TEMP_SENSOR_CAPABILITY				0x1618
+#define CCS_TEMP_SENSOR_CAPABILITY_SUPPORTED			(1U << 0)
+#define CCS_TEMP_SENSOR_CAPABILITY_CCS_FORMAT			(1U << 1)
+#define CCS_TEMP_SENSOR_CAPABILITY_RESET_0X80			(1U << 2)
+#define CCS_R_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS(n)		((0x161a | (CCS_FL_32BIT | CCS_FL_IREAL)) + ((n) < 4 ? (n) * 4 : 0x30 + ((n) - 4) * 4))
+#define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS_MIN_N	0U
+#define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS_MAX_N	7U
+#define CCS_R_DPHY_EQUALIZATION_CAPABILITY			0x162b
+#define CCS_DPHY_EQUALIZATION_CAPABILITY_EQUALIZATION_CTRL	(1U << 0)
+#define CCS_DPHY_EQUALIZATION_CAPABILITY_EQ1			(1U << 1)
+#define CCS_DPHY_EQUALIZATION_CAPABILITY_EQ2			(1U << 2)
+#define CCS_R_CPHY_EQUALIZATION_CAPABILITY			0x162c
+#define CCS_CPHY_EQUALIZATION_CAPABILITY_EQUALIZATION_CTRL	(1U << 0)
+#define CCS_R_DPHY_PREAMBLE_CAPABILITY				0x162d
+#define CCS_DPHY_PREAMBLE_CAPABILITY_PREAMBLE_SEQ_CTRL		(1U << 0)
+#define CCS_R_DPHY_SSC_CAPABILITY				0x162e
+#define CCS_DPHY_SSC_CAPABILITY_SUPPORTED			(1U << 0)
+#define CCS_R_CPHY_CALIBRATION_CAPABILITY			0x162f
+#define CCS_CPHY_CALIBRATION_CAPABILITY_MANUAL			(1U << 0)
+#define CCS_CPHY_CALIBRATION_CAPABILITY_MANUAL_STREAMING	(1U << 1)
+#define CCS_CPHY_CALIBRATION_CAPABILITY_FORMAT_1_CTRL		(1U << 2)
+#define CCS_CPHY_CALIBRATION_CAPABILITY_FORMAT_2_CTRL		(1U << 3)
+#define CCS_CPHY_CALIBRATION_CAPABILITY_FORMAT_3_CTRL		(1U << 4)
+#define CCS_R_DPHY_CALIBRATION_CAPABILITY			0x1630
+#define CCS_DPHY_CALIBRATION_CAPABILITY_MANUAL			(1U << 0)
+#define CCS_DPHY_CALIBRATION_CAPABILITY_MANUAL_STREAMING	(1U << 1)
+#define CCS_DPHY_CALIBRATION_CAPABILITY_ALTERNATE_SEQ		(1U << 2)
+#define CCS_R_PHY_CTRL_CAPABILITY_2				0x1631
+#define CCS_PHY_CTRL_CAPABILITY_2_TGR_LENGTH			(1U << 0)
+#define CCS_PHY_CTRL_CAPABILITY_2_TGR_PREAMBLE_PROG_SEQ		(1U << 1)
+#define CCS_PHY_CTRL_CAPABILITY_2_EXTRA_CPHY_MANUAL_TIMING	(1U << 2)
+#define CCS_PHY_CTRL_CAPABILITY_2_CLOCK_BASED_MANUAL_CDPHY	(1U << 3)
+#define CCS_PHY_CTRL_CAPABILITY_2_CLOCK_BASED_MANUAL_DPHY	(1U << 4)
+#define CCS_PHY_CTRL_CAPABILITY_2_CLOCK_BASED_MANUAL_CPHY	(1U << 5)
+#define CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_DPHY		(1U << 6)
+#define CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_CPHY		(1U << 7)
+#define CCS_R_LRTE_CPHY_CAPABILITY				0x1632
+#define CCS_LRTE_CPHY_CAPABILITY_PDQ_SHORT			(1U << 0)
+#define CCS_LRTE_CPHY_CAPABILITY_SPACER_SHORT			(1U << 1)
+#define CCS_LRTE_CPHY_CAPABILITY_PDQ_LONG			(1U << 2)
+#define CCS_LRTE_CPHY_CAPABILITY_SPACER_LONG			(1U << 3)
+#define CCS_LRTE_CPHY_CAPABILITY_SPACER_NO_PDQ			(1U << 4)
+#define CCS_R_LRTE_DPHY_CAPABILITY				0x1633
+#define CCS_LRTE_DPHY_CAPABILITY_PDQ_SHORT_OPT1			(1U << 0)
+#define CCS_LRTE_DPHY_CAPABILITY_SPACER_SHORT_OPT1		(1U << 1)
+#define CCS_LRTE_DPHY_CAPABILITY_PDQ_LONG_OPT1			(1U << 2)
+#define CCS_LRTE_DPHY_CAPABILITY_SPACER_LONG_OPT1		(1U << 3)
+#define CCS_LRTE_DPHY_CAPABILITY_SPACER_SHORT_OPT2		(1U << 4)
+#define CCS_LRTE_DPHY_CAPABILITY_SPACER_LONG_OPT2		(1U << 5)
+#define CCS_LRTE_DPHY_CAPABILITY_SPACER_NO_PDQ_OPT1		(1U << 6)
+#define CCS_LRTE_DPHY_CAPABILITY_SPACER_VARIABLE_OPT2		(1U << 7)
+#define CCS_R_ALPS_CAPABILITY_DPHY				0x1634
+#define CCS_ALPS_CAPABILITY_DPHY_LVLP_NOT_SUPPORTED		0U
+#define CCS_ALPS_CAPABILITY_DPHY_LVLP_SUPPORTED			1U
+#define CCS_ALPS_CAPABILITY_DPHY_CONTROLLABLE_LVLP		2U
+#define CCS_R_ALPS_CAPABILITY_CPHY				0x1635
+#define CCS_ALPS_CAPABILITY_CPHY_LVLP_NOT_SUPPORTED		0U
+#define CCS_ALPS_CAPABILITY_CPHY_LVLP_SUPPORTED			1U
+#define CCS_ALPS_CAPABILITY_CPHY_CONTROLLABLE_LVLP		2U
+#define CCS_ALPS_CAPABILITY_CPHY_ALP_NOT_SUPPORTED		0xc
+#define CCS_ALPS_CAPABILITY_CPHY_ALP_SUPPORTED			0xd
+#define CCS_ALPS_CAPABILITY_CPHY_CONTROLLABLE_ALP		0xe
+#define CCS_R_SCRAMBLING_CAPABILITY				0x1636
+#define CCS_SCRAMBLING_CAPABILITY_SCRAMBLING_SUPPORTED		(1U << 0)
+#define CCS_SCRAMBLING_CAPABILITY_MAX_SEEDS_PER_LANE_C_SHIFT	1U
+#define CCS_SCRAMBLING_CAPABILITY_MAX_SEEDS_PER_LANE_C_MASK	0x6
+#define CCS_SCRAMBLING_CAPABILITY_MAX_SEEDS_PER_LANE_C_1	0U
+#define CCS_SCRAMBLING_CAPABILITY_MAX_SEEDS_PER_LANE_C_4	3U
+#define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_SHIFT		3U
+#define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_MASK		0x38
+#define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_0		0U
+#define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_1		1U
+#define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_4		4U
+#define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_PER_LANE		(1U << 6)
+#define CCS_R_DPHY_MANUAL_CONSTANT				0x1637
+#define CCS_R_CPHY_MANUAL_CONSTANT				0x1638
+#define CCS_R_CSI2_INTERFACE_CAPABILITY_MISC			0x1639
+#define CCS_CSI2_INTERFACE_CAPABILITY_MISC_EOTP_SHORT_PKT_OPT2	(1U << 0)
+#define CCS_R_PHY_CTRL_CAPABILITY_3				0x165c
+#define CCS_PHY_CTRL_CAPABILITY_3_DPHY_TIMING_NOT_MULTIPLE	(1U << 0)
+#define CCS_PHY_CTRL_CAPABILITY_3_DPHY_MIN_TIMING_VALUE_1	(1U << 1)
+#define CCS_PHY_CTRL_CAPABILITY_3_TWAKEUP_SUPPORTED		(1U << 2)
+#define CCS_PHY_CTRL_CAPABILITY_3_TINIT_SUPPORTED		(1U << 3)
+#define CCS_PHY_CTRL_CAPABILITY_3_THS_EXIT_SUPPORTED		(1U << 4)
+#define CCS_PHY_CTRL_CAPABILITY_3_CPHY_TIMING_NOT_MULTIPLE	(1U << 5)
+#define CCS_PHY_CTRL_CAPABILITY_3_CPHY_MIN_TIMING_VALUE_1	(1U << 6)
+#define CCS_R_DPHY_SF						0x165d
+#define CCS_R_CPHY_SF						0x165e
+#define CCS_CPHY_SF_TWAKEUP_SHIFT				0U
+#define CCS_CPHY_SF_TWAKEUP_MASK				0xf
+#define CCS_CPHY_SF_TINIT_SHIFT					4U
+#define CCS_CPHY_SF_TINIT_MASK					0xf0
+#define CCS_R_DPHY_LIMITS_1					0x165f
+#define CCS_DPHY_LIMITS_1_THS_PREPARE_SHIFT			0U
+#define CCS_DPHY_LIMITS_1_THS_PREPARE_MASK			0xf
+#define CCS_DPHY_LIMITS_1_THS_ZERO_SHIFT			4U
+#define CCS_DPHY_LIMITS_1_THS_ZERO_MASK				0xf0
+#define CCS_R_DPHY_LIMITS_2					0x1660
+#define CCS_DPHY_LIMITS_2_THS_TRAIL_SHIFT			0U
+#define CCS_DPHY_LIMITS_2_THS_TRAIL_MASK			0xf
+#define CCS_DPHY_LIMITS_2_TCLK_TRAIL_MIN_SHIFT			4U
+#define CCS_DPHY_LIMITS_2_TCLK_TRAIL_MIN_MASK			0xf0
+#define CCS_R_DPHY_LIMITS_3					0x1661
+#define CCS_DPHY_LIMITS_3_TCLK_PREPARE_SHIFT			0U
+#define CCS_DPHY_LIMITS_3_TCLK_PREPARE_MASK			0xf
+#define CCS_DPHY_LIMITS_3_TCLK_ZERO_SHIFT			4U
+#define CCS_DPHY_LIMITS_3_TCLK_ZERO_MASK			0xf0
+#define CCS_R_DPHY_LIMITS_4					0x1662
+#define CCS_DPHY_LIMITS_4_TCLK_POST_SHIFT			0U
+#define CCS_DPHY_LIMITS_4_TCLK_POST_MASK			0xf
+#define CCS_DPHY_LIMITS_4_TLPX_SHIFT				4U
+#define CCS_DPHY_LIMITS_4_TLPX_MASK				0xf0
+#define CCS_R_DPHY_LIMITS_5					0x1663
+#define CCS_DPHY_LIMITS_5_THS_EXIT_SHIFT			0U
+#define CCS_DPHY_LIMITS_5_THS_EXIT_MASK				0xf
+#define CCS_DPHY_LIMITS_5_TWAKEUP_SHIFT				4U
+#define CCS_DPHY_LIMITS_5_TWAKEUP_MASK				0xf0
+#define CCS_R_DPHY_LIMITS_6					0x1664
+#define CCS_DPHY_LIMITS_6_TINIT_SHIFT				0U
+#define CCS_DPHY_LIMITS_6_TINIT_MASK				0xf
+#define CCS_R_CPHY_LIMITS_1					0x1665
+#define CCS_CPHY_LIMITS_1_T3_PREPARE_MAX_SHIFT			0U
+#define CCS_CPHY_LIMITS_1_T3_PREPARE_MAX_MASK			0xf
+#define CCS_CPHY_LIMITS_1_T3_LPX_MAX_SHIFT			4U
+#define CCS_CPHY_LIMITS_1_T3_LPX_MAX_MASK			0xf0
+#define CCS_R_CPHY_LIMITS_2					0x1666
+#define CCS_CPHY_LIMITS_2_THS_EXIT_MAX_SHIFT			0U
+#define CCS_CPHY_LIMITS_2_THS_EXIT_MAX_MASK			0xf
+#define CCS_CPHY_LIMITS_2_TWAKEUP_MAX_SHIFT			4U
+#define CCS_CPHY_LIMITS_2_TWAKEUP_MAX_MASK			0xf0
+#define CCS_R_CPHY_LIMITS_3					0x1667
+#define CCS_CPHY_LIMITS_3_TINIT_MAX_SHIFT			0U
+#define CCS_CPHY_LIMITS_3_TINIT_MAX_MASK			0xf
+#define CCS_R_MIN_FRAME_LENGTH_LINES_BIN			(0x1700 | CCS_FL_16BIT)
+#define CCS_R_MAX_FRAME_LENGTH_LINES_BIN			(0x1702 | CCS_FL_16BIT)
+#define CCS_R_MIN_LINE_LENGTH_PCK_BIN				(0x1704 | CCS_FL_16BIT)
+#define CCS_R_MAX_LINE_LENGTH_PCK_BIN				(0x1706 | CCS_FL_16BIT)
+#define CCS_R_MIN_LINE_BLANKING_PCK_BIN				(0x1708 | CCS_FL_16BIT)
+#define CCS_R_FINE_INTEGRATION_TIME_MIN_BIN			(0x170a | CCS_FL_16BIT)
+#define CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN		(0x170c | CCS_FL_16BIT)
+#define CCS_R_BINNING_CAPABILITY				0x1710
+#define CCS_BINNING_CAPABILITY_UNSUPPORTED			0U
+#define CCS_BINNING_CAPABILITY_BINNING_THEN_SUBSAMPLING		1U
+#define CCS_BINNING_CAPABILITY_SUBSAMPLING_THEN_BINNING		2U
+#define CCS_R_BINNING_WEIGHTING_CAPABILITY			0x1711
+#define CCS_BINNING_WEIGHTING_CAPABILITY_AVERAGED		(1U << 0)
+#define CCS_BINNING_WEIGHTING_CAPABILITY_SUMMED			(1U << 1)
+#define CCS_BINNING_WEIGHTING_CAPABILITY_BAYER_CORRECTED	(1U << 2)
+#define CCS_BINNING_WEIGHTING_CAPABILITY_MODULE_SPECIFIC_WEIGHT	(1U << 3)
+#define CCS_R_BINNING_SUB_TYPES					0x1712
+#define CCS_R_BINNING_SUB_TYPE(n)				(0x1713 + (n))
+#define CCS_LIM_BINNING_SUB_TYPE_MIN_N				0U
+#define CCS_LIM_BINNING_SUB_TYPE_MAX_N				63U
+#define CCS_BINNING_SUB_TYPE_ROW_SHIFT				0U
+#define CCS_BINNING_SUB_TYPE_ROW_MASK				0xf
+#define CCS_BINNING_SUB_TYPE_COLUMN_SHIFT			4U
+#define CCS_BINNING_SUB_TYPE_COLUMN_MASK			0xf0
+#define CCS_R_BINNING_WEIGHTING_MONO_CAPABILITY			0x1771
+#define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_AVERAGED		(1U << 0)
+#define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_SUMMED		(1U << 1)
+#define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_BAYER_CORRECTED	(1U << 2)
+#define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_MODULE_SPECIFIC_WEIGHT   (1U << 3)
+#define CCS_R_BINNING_SUB_TYPES_MONO				0x1772
+#define CCS_R_BINNING_SUB_TYPE_MONO(n)				(0x1773 + (n))
+#define CCS_LIM_BINNING_SUB_TYPE_MONO_MIN_N			0U
+#define CCS_LIM_BINNING_SUB_TYPE_MONO_MAX_N			63U
+#define CCS_R_DATA_TRANSFER_IF_CAPABILITY			0x1800
+#define CCS_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED		(1U << 0)
+#define CCS_DATA_TRANSFER_IF_CAPABILITY_POLLING			(1U << 2)
+#define CCS_R_SHADING_CORRECTION_CAPABILITY			0x1900
+#define CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING		(1U << 0)
+#define CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION	(1U << 1)
+#define CCS_R_GREEN_IMBALANCE_CAPABILITY			0x1901
+#define CCS_GREEN_IMBALANCE_CAPABILITY_SUPPORTED		(1U << 0)
+#define CCS_R_MODULE_SPECIFIC_CORRECTION_CAPABILITY		0x1903
+#define CCS_R_DEFECT_CORRECTION_CAPABILITY			(0x1904 | CCS_FL_16BIT)
+#define CCS_DEFECT_CORRECTION_CAPABILITY_MAPPED_DEFECT		(1U << 0)
+#define CCS_DEFECT_CORRECTION_CAPABILITY_DYNAMIC_COUPLET	(1U << 2)
+#define CCS_DEFECT_CORRECTION_CAPABILITY_DYNAMIC_SINGLE		(1U << 5)
+#define CCS_DEFECT_CORRECTION_CAPABILITY_COMBINED_DYNAMIC	(1U << 8)
+#define CCS_R_DEFECT_CORRECTION_CAPABILITY_2			(0x1906 | CCS_FL_16BIT)
+#define CCS_DEFECT_CORRECTION_CAPABILITY_2_DYNAMIC_TRIPLET	(1U << 3)
+#define CCS_R_NF_CAPABILITY					0x1908
+#define CCS_NF_CAPABILITY_LUMA					(1U << 0)
+#define CCS_NF_CAPABILITY_CHROMA				(1U << 1)
+#define CCS_NF_CAPABILITY_COMBINED				(1U << 2)
+#define CCS_R_OB_READOUT_CAPABILITY				0x1980
+#define CCS_OB_READOUT_CAPABILITY_CONTROLLABLE_READOUT		(1U << 0)
+#define CCS_OB_READOUT_CAPABILITY_VISIBLE_PIXEL_READOUT		(1U << 1)
+#define CCS_OB_READOUT_CAPABILITY_DIFFERENT_VC_READOUT		(1U << 2)
+#define CCS_OB_READOUT_CAPABILITY_DIFFERENT_DT_READOUT		(1U << 3)
+#define CCS_OB_READOUT_CAPABILITY_PROG_DATA_FORMAT		(1U << 4)
+#define CCS_R_COLOR_FEEDBACK_CAPABILITY				0x1987
+#define CCS_COLOR_FEEDBACK_CAPABILITY_KELVIN			(1U << 0)
+#define CCS_COLOR_FEEDBACK_CAPABILITY_AWB_GAIN			(1U << 1)
+#define CCS_R_CFA_PATTERN_CAPABILITY				0x1990
+#define CCS_CFA_PATTERN_CAPABILITY_BAYER			0U
+#define CCS_CFA_PATTERN_CAPABILITY_MONOCHROME			1U
+#define CCS_CFA_PATTERN_CAPABILITY_4X4_QUAD_BAYER		2U
+#define CCS_CFA_PATTERN_CAPABILITY_VENDOR_SPECIFIC		3U
+#define CCS_R_CFA_PATTERN_CONVERSION_CAPABILITY			0x1991
+#define CCS_CFA_PATTERN_CONVERSION_CAPABILITY_BAYER		(1U << 0)
+#define CCS_R_FLASH_MODE_CAPABILITY				0x1a02
+#define CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE			(1U << 0)
+#define CCS_R_SA_STROBE_MODE_CAPABILITY				0x1a03
+#define CCS_SA_STROBE_MODE_CAPABILITY_FIXED_WIDTH		(1U << 0)
+#define CCS_SA_STROBE_MODE_CAPABILITY_EDGE_CTRL			(1U << 1)
+#define CCS_R_RESET_MAX_DELAY					0x1a10
+#define CCS_R_RESET_MIN_TIME					0x1a11
+#define CCS_R_PDAF_CAPABILITY_1					0x1b80
+#define CCS_PDAF_CAPABILITY_1_SUPPORTED				(1U << 0)
+#define CCS_PDAF_CAPABILITY_1_PROCESSED_BOTTOM_EMBEDDED		(1U << 1)
+#define CCS_PDAF_CAPABILITY_1_PROCESSED_INTERLEAVED		(1U << 2)
+#define CCS_PDAF_CAPABILITY_1_RAW_BOTTOM_EMBEDDED		(1U << 3)
+#define CCS_PDAF_CAPABILITY_1_RAW_INTERLEAVED			(1U << 4)
+#define CCS_PDAF_CAPABILITY_1_VISIBLE_PDAF_CORRECTION		(1U << 5)
+#define CCS_PDAF_CAPABILITY_1_VC_INTERLEAVING			(1U << 6)
+#define CCS_PDAF_CAPABILITY_1_DT_INTERLEAVING			(1U << 7)
+#define CCS_R_PDAF_CAPABILITY_2					0x1b81
+#define CCS_PDAF_CAPABILITY_2_ROI				(1U << 0)
+#define CCS_PDAF_CAPABILITY_2_AFTER_DIGITAL_CROP		(1U << 1)
+#define CCS_PDAF_CAPABILITY_2_CTRL_RETIMED			(1U << 2)
+#define CCS_R_BRACKETING_LUT_CAPABILITY_1			0x1c00
+#define CCS_BRACKETING_LUT_CAPABILITY_1_COARSE_INTEGRATION	(1U << 0)
+#define CCS_BRACKETING_LUT_CAPABILITY_1_GLOBAL_ANALOG_GAIN	(1U << 1)
+#define CCS_BRACKETING_LUT_CAPABILITY_1_FLASH			(1U << 4)
+#define CCS_BRACKETING_LUT_CAPABILITY_1_GLOBAL_DIGITAL_GAIN	(1U << 5)
+#define CCS_BRACKETING_LUT_CAPABILITY_1_ALTERNATE_GLOBAL_ANALOG_GAIN   (1U << 6)
+#define CCS_R_BRACKETING_LUT_CAPABILITY_2			0x1c01
+#define CCS_BRACKETING_LUT_CAPABILITY_2_SINGLE_BRACKETING_MODE	(1U << 0)
+#define CCS_BRACKETING_LUT_CAPABILITY_2_LOOPED_BRACKETING_MODE	(1U << 1)
+#define CCS_R_BRACKETING_LUT_SIZE				0x1c02
+
+#endif /* __CCS_REGS_H__ */
-- 
2.27.0

