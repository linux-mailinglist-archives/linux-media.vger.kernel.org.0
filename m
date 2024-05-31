Return-Path: <linux-media+bounces-12324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D19F78D5C47
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C174B27B81
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CC377F10;
	Fri, 31 May 2024 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GoJFKXcA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD6770FE
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717142859; cv=none; b=WKOOLCmYfLYPf0MbvUKvz35vnr2NlIr0dN2OS3Gy8bPmd8hxl8IMIuSi/KpVIP4FL9B22kQvm6IoHZwApQZZJ3ROZ+GnwtjPKGBH/3rCxoZoV2gbs8frGHg+sf53E7ULATeBjk9AX4KMufbtCsg3CVkRzwWuZ3fV2o5IujhaRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717142859; c=relaxed/simple;
	bh=dp/9SfebZIbmaTlvqRws6GvSKedg5SQbzbiL1+mtfI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0jI+Ud83WyYvlWQgN+fNOQs1n1c6T6l1jaVeGFChKJqe4rT4FUOEeoilXcSBU8cU+Ofd2M+HWdKNl8V20nzB7Kh+YmIdR1k8WJuUc6KCfCMkqm48jMyQRyq9AIgR5Shg+GJwQM6yQa4xiuE4LcHZZnHzyJqSmh44GjtDLKRvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GoJFKXcA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10FE8114C;
	Fri, 31 May 2024 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717142848;
	bh=dp/9SfebZIbmaTlvqRws6GvSKedg5SQbzbiL1+mtfI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoJFKXcA5lP1+aPwpFHD2dy9mG0DRcr1PC0VttmXuiUI/tsTtC+H3Q12Qk7LwMR1H
	 jK8Fg2gsAwv9azka7/Iqad325No1dxCy5jDwXwcvpMcnNZgomQu0tZjHzDagIli0lg
	 Mk9rwSNxFERFwD13/PIYzCMB/zJA+TxT/Xl0TeUI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v9 3/8] media: uapi: Add Raspberry Pi PiSP Back End uAPI
Date: Fri, 31 May 2024 10:07:02 +0200
Message-ID: <20240531080707.34568-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Raspberry Pi PiSP Back End uAPI header.

The header defines the data type used to configure the PiSP Back End
ISP.

The detailed description of the types and of the ISP configuration
procedure is available at
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                                   |   7 +
 .../linux/media/raspberrypi/pisp_be_config.h  | 927 ++++++++++++++++++
 .../linux/media/raspberrypi/pisp_common.h     | 199 ++++
 3 files changed, 1133 insertions(+)
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..97f2bb162730 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18772,6 +18772,13 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/ras/amd/fmpm.c
 
+RASPBERRY PI PISP BACK END
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	include/uapi/linux/media/raspberrypi/
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
new file mode 100644
index 000000000000..3eb4be03c5f4
--- /dev/null
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -0,0 +1,927 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * PiSP Back End configuration definitions.
+ *
+ * Copyright (C) 2021 - Raspberry Pi Ltd
+ *
+ */
+#ifndef _UAPI_PISP_BE_CONFIG_H_
+#define _UAPI_PISP_BE_CONFIG_H_
+
+#include <linux/types.h>
+
+#include "pisp_common.h"
+
+/* byte alignment for inputs */
+#define PISP_BACK_END_INPUT_ALIGN 4u
+/* alignment for compressed inputs */
+#define PISP_BACK_END_COMPRESSED_ALIGN 8u
+/* minimum required byte alignment for outputs */
+#define PISP_BACK_END_OUTPUT_MIN_ALIGN 16u
+/* preferred byte alignment for outputs */
+#define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
+
+/* minimum allowed tile width anywhere in the pipeline */
+#define PISP_BACK_END_MIN_TILE_WIDTH 16u
+/* minimum allowed tile width anywhere in the pipeline */
+#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
+
+#define PISP_BACK_END_NUM_OUTPUTS 2
+#define PISP_BACK_END_HOG_OUTPUT 1
+
+#define PISP_BACK_END_NUM_TILES 64
+
+enum pisp_be_bayer_enable {
+	PISP_BE_BAYER_ENABLE_INPUT = 0x000001,
+	PISP_BE_BAYER_ENABLE_DECOMPRESS = 0x000002,
+	PISP_BE_BAYER_ENABLE_DPC = 0x000004,
+	PISP_BE_BAYER_ENABLE_GEQ = 0x000008,
+	PISP_BE_BAYER_ENABLE_TDN_INPUT = 0x000010,
+	PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS = 0x000020,
+	PISP_BE_BAYER_ENABLE_TDN = 0x000040,
+	PISP_BE_BAYER_ENABLE_TDN_COMPRESS = 0x000080,
+	PISP_BE_BAYER_ENABLE_TDN_OUTPUT = 0x000100,
+	PISP_BE_BAYER_ENABLE_SDN = 0x000200,
+	PISP_BE_BAYER_ENABLE_BLC = 0x000400,
+	PISP_BE_BAYER_ENABLE_STITCH_INPUT = 0x000800,
+	PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS = 0x001000,
+	PISP_BE_BAYER_ENABLE_STITCH = 0x002000,
+	PISP_BE_BAYER_ENABLE_STITCH_COMPRESS = 0x004000,
+	PISP_BE_BAYER_ENABLE_STITCH_OUTPUT = 0x008000,
+	PISP_BE_BAYER_ENABLE_WBG = 0x010000,
+	PISP_BE_BAYER_ENABLE_CDN = 0x020000,
+	PISP_BE_BAYER_ENABLE_LSC = 0x040000,
+	PISP_BE_BAYER_ENABLE_TONEMAP = 0x080000,
+	PISP_BE_BAYER_ENABLE_CAC = 0x100000,
+	PISP_BE_BAYER_ENABLE_DEBIN = 0x200000,
+	PISP_BE_BAYER_ENABLE_DEMOSAIC = 0x400000,
+};
+
+enum pisp_be_rgb_enable {
+	PISP_BE_RGB_ENABLE_INPUT = 0x000001,
+	PISP_BE_RGB_ENABLE_CCM = 0x000002,
+	PISP_BE_RGB_ENABLE_SAT_CONTROL = 0x000004,
+	PISP_BE_RGB_ENABLE_YCBCR = 0x000008,
+	PISP_BE_RGB_ENABLE_FALSE_COLOUR = 0x000010,
+	PISP_BE_RGB_ENABLE_SHARPEN = 0x000020,
+	/* Preferred colours would occupy 0x000040 */
+	PISP_BE_RGB_ENABLE_YCBCR_INVERSE = 0x000080,
+	PISP_BE_RGB_ENABLE_GAMMA = 0x000100,
+	PISP_BE_RGB_ENABLE_CSC0 = 0x000200,
+	PISP_BE_RGB_ENABLE_CSC1 = 0x000400,
+	PISP_BE_RGB_ENABLE_DOWNSCALE0 = 0x001000,
+	PISP_BE_RGB_ENABLE_DOWNSCALE1 = 0x002000,
+	PISP_BE_RGB_ENABLE_RESAMPLE0 = 0x008000,
+	PISP_BE_RGB_ENABLE_RESAMPLE1 = 0x010000,
+	PISP_BE_RGB_ENABLE_OUTPUT0 = 0x040000,
+	PISP_BE_RGB_ENABLE_OUTPUT1 = 0x080000,
+	PISP_BE_RGB_ENABLE_HOG = 0x200000
+};
+
+#define PISP_BE_RGB_ENABLE_CSC(i) (PISP_BE_RGB_ENABLE_CSC0 << (i))
+#define PISP_BE_RGB_ENABLE_DOWNSCALE(i) (PISP_BE_RGB_ENABLE_DOWNSCALE0 << (i))
+#define PISP_BE_RGB_ENABLE_RESAMPLE(i) (PISP_BE_RGB_ENABLE_RESAMPLE0 << (i))
+#define PISP_BE_RGB_ENABLE_OUTPUT(i) (PISP_BE_RGB_ENABLE_OUTPUT0 << (i))
+
+/*
+ * We use the enable flags to show when blocks are "dirty", but we need some
+ * extra ones too.
+ */
+enum pisp_be_dirty {
+	PISP_BE_DIRTY_GLOBAL = 0x0001,
+	PISP_BE_DIRTY_SH_FC_COMBINE = 0x0002,
+	PISP_BE_DIRTY_CROP = 0x0004
+};
+
+/**
+ * struct pisp_be_global_config - PiSP global enable bitmaps
+ * @bayer_enables:	Bayer input enable flags
+ * @rgb_enables:	RGB output enable flags
+ * @bayer_order:	Bayer input format ordering
+ * @pad:		Padding bytes
+ */
+struct pisp_be_global_config {
+	__u32 bayer_enables;
+	__u32 rgb_enables;
+	__u8 bayer_order;
+	__u8 pad[3];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_input_buffer_config - PiSP Back End input buffer
+ * @addr:		Input buffer address
+ */
+struct pisp_be_input_buffer_config {
+	/* low 32 bits followed by high 32 bits (for each of up to 3 planes) */
+	__u32 addr[3][2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_dpc_config - PiSP Back End DPC config
+ *
+ * Defective Pixel Correction configuration
+ *
+ * @coeff_level:	Coefficient for the darkest neighbouring pixel value
+ * @coeff_range:	Coefficient for the range of pixels for this Bayer channel
+ * @pad:		Padding byte
+ * @flags:		DPC configuration flags
+ */
+struct pisp_be_dpc_config {
+	__u8 coeff_level;
+	__u8 coeff_range;
+	__u8 pad;
+#define PISP_BE_DPC_FLAG_FOLDBACK 1
+	__u8 flags;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_geq_config - PiSP Back End GEQ config
+ *
+ * Green Equalisation configuration
+ *
+ * @offset:		Offset value for threshold calculation
+ * @slope_sharper:	Slope/Sharper configuration
+ * @min:		Minimum value the threshold may have
+ * @max:		Maximum value the threshold may have
+ */
+struct pisp_be_geq_config {
+	__u16 offset;
+#define PISP_BE_GEQ_SHARPER BIT(15)
+#define PISP_BE_GEQ_SLOPE ((1 << 10) - 1)
+	/* top bit is the "sharper" flag, slope value is bottom 10 bits */
+	__u16 slope_sharper;
+	__u16 min;
+	__u16 max;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_tdn_input_buffer_config - PiSP Back End TDN input buffer
+ * @addr:		TDN input buffer address
+ */
+struct pisp_be_tdn_input_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_tdn_config - PiSP Back End TDN config
+ *
+ * Temporal Denoise configuration
+ *
+ * @black_level:	Black level value subtracted from pixels
+ * @ratio:		Multiplier for the LTA input frame
+ * @noise_constant:	Constant offset value used in noise estimation
+ * @noise_slope:	Noise estimation multiplier
+ * @threshold:		Threshold for TDN operations
+ * @reset:		Disable TDN operations
+ * @pad:		Padding byte
+ */
+struct pisp_be_tdn_config {
+	__u16 black_level;
+	__u16 ratio;
+	__u16 noise_constant;
+	__u16 noise_slope;
+	__u16 threshold;
+	__u8 reset;
+	__u8 pad;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_tdn_output_buffer_config - PiSP Back End TDN output buffer
+ * @addr:		TDN output buffer address
+ */
+struct pisp_be_tdn_output_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_sdn_config - PiSP Back End SDN config
+ *
+ * Spatial Denoise configuration
+ *
+ * @black_level:	Black level subtracted from pixel for noise estimation
+ * @leakage:		Proportion of the original undenoised value to mix in
+ *			denoised output
+ * @pad:		Padding byte
+ * @noise_constant:	Noise constant used for noise estimation
+ * @noise_slope:	Noise slope value used for noise estimation
+ * @noise_constant2:	Second noise constant used for noise estimation
+ * @noise_slope2:	Second slope value used for noise estimation
+ */
+struct pisp_be_sdn_config {
+	__u16 black_level;
+	__u8 leakage;
+	__u8 pad;
+	__u16 noise_constant;
+	__u16 noise_slope;
+	__u16 noise_constant2;
+	__u16 noise_slope2;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_stitch_input_buffer_config - PiSP Back End Stitch input
+ * @addr:		Stitch input buffer address
+ */
+struct pisp_be_stitch_input_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+#define PISP_BE_STITCH_STREAMING_LONG 0x8000
+#define PISP_BE_STITCH_EXPOSURE_RATIO_MASK 0x7fff
+
+/**
+ * struct pisp_be_stitch_config - PiSP Back End Stitch config
+ *
+ * Stitch block configuration
+ *
+ * @threshold_lo:		Low threshold value
+ * @threshold_diff_power:	Low and high threshold difference
+ * @pad:			Padding bytes
+ * @exposure_ratio:		Multiplier to convert long exposure pixels into
+ *				short exposure pixels
+ * @motion_threshold_256:	Motion threshold above which short exposure
+ *				pixels are used
+ * @motion_threshold_recip:	Reciprocal of motion_threshold_256 value
+ */
+struct pisp_be_stitch_config {
+	__u16 threshold_lo;
+	__u8 threshold_diff_power;
+	__u8 pad;
+
+	/* top bit indicates whether streaming input is the long exposure */
+	__u16 exposure_ratio;
+
+	__u8 motion_threshold_256;
+	__u8 motion_threshold_recip;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_stitch_output_buffer_config - PiSP Back End Stitch output
+ * @addr:		Stitch input buffer address
+ */
+struct pisp_be_stitch_output_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_cdn_config - PiSP Back End CDN config
+ *
+ * Colour Denoise configuration
+ *
+ * @thresh:		Constant for noise estimation
+ * @iir_strength:	Relative strength of the IIR part of the filter
+ * @g_adjust:		Proportion of the change assigned to the G channel
+ */
+struct pisp_be_cdn_config {
+	__u16 thresh;
+	__u8 iir_strength;
+	__u8 g_adjust;
+} __attribute__((packed));
+
+#define PISP_BE_LSC_LOG_GRID_SIZE 5
+#define PISP_BE_LSC_GRID_SIZE (1 << PISP_BE_LSC_LOG_GRID_SIZE)
+#define PISP_BE_LSC_STEP_PRECISION 18
+
+/**
+ * struct pisp_be_lsc_config - PiSP Back End LSC config
+ *
+ * Lens Shading Correction configuration
+ *
+ * @grid_step_x:	Reciprocal of cell size width
+ * @grid_step_y:	Reciprocal of cell size height
+ * @lut_packed:		Jointly-coded RGB gains for each LSC grid
+ */
+struct pisp_be_lsc_config {
+	/* (1<<18) / grid_cell_width */
+	__u16 grid_step_x;
+	/* (1<<18) / grid_cell_height */
+	__u16 grid_step_y;
+	/* RGB gains jointly encoded in 32 bits */
+#define PISP_BE_LSC_LUT_SIZE	(PISP_BE_LSC_GRID_SIZE + 1)
+	__u32 lut_packed[PISP_BE_LSC_LUT_SIZE][PISP_BE_LSC_LUT_SIZE];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_lsc_extra - PiSP Back End LSC Extra config
+ * @offset_x:		Horizontal offset into the LSC table of this tile
+ * @offset_y:		Vertical offset into the LSC table of this tile
+ */
+struct pisp_be_lsc_extra {
+	__u16 offset_x;
+	__u16 offset_y;
+} __attribute__((packed));
+
+#define PISP_BE_CAC_LOG_GRID_SIZE 3
+#define PISP_BE_CAC_GRID_SIZE (1 << PISP_BE_CAC_LOG_GRID_SIZE)
+#define PISP_BE_CAC_STEP_PRECISION 20
+
+/**
+ * struct pisp_be_cac_config - PiSP Back End CAC config
+ *
+ * Chromatic Aberration Correction config
+ *
+ * @grid_step_x:	Reciprocal of cell size width
+ * @grid_step_y:	Reciprocal of cell size height
+ * @lut:		Pixel shift for the CAC grid
+ */
+struct pisp_be_cac_config {
+	/* (1<<20) / grid_cell_width */
+	__u16 grid_step_x;
+	/* (1<<20) / grid_cell_height */
+	__u16 grid_step_y;
+	/* [gridy][gridx][rb][xy] */
+#define PISP_BE_CAC_LUT_SIZE		(PISP_BE_CAC_GRID_SIZE + 1)
+	__s8 lut[PISP_BE_CAC_LUT_SIZE][PISP_BE_CAC_LUT_SIZE][2][2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_cac_extra - PiSP Back End CAC extra config
+ * @offset_x:		Horizontal offset into the CAC table of this tile
+ * @offset_y:		Horizontal offset into the CAC table of this tile
+ */
+struct pisp_be_cac_extra {
+	__u16 offset_x;
+	__u16 offset_y;
+} __attribute__((packed));
+
+#define PISP_BE_DEBIN_NUM_COEFFS 4
+
+/**
+ * struct pisp_be_debin_config - PiSP Back End Debin config
+ *
+ * Debinning configuration
+ *
+ * @coeffs:		Filter coefficients for debinning
+ * @h_enable:		Horizontal debinning enable
+ * @v_enable:		Vertical debinning enable
+ * @pad:		Padding bytes
+ */
+struct pisp_be_debin_config {
+	__s8 coeffs[PISP_BE_DEBIN_NUM_COEFFS];
+	__s8 h_enable;
+	__s8 v_enable;
+	__s8 pad[2];
+} __attribute__((packed));
+
+#define PISP_BE_TONEMAP_LUT_SIZE 64
+
+/**
+ * struct pisp_be_tonemap_config - PiSP Back End Tonemap config
+ *
+ * Tonemapping configuration
+ *
+ * @detail_constant:	Constant value for threshold calculation
+ * @detail_slope:	Slope value for threshold calculation
+ * @iir_strength:	Relative strength of the IIR fiter
+ * @strength:		Strength factor
+ * @lut:		Look-up table for tonemap curve
+ */
+struct pisp_be_tonemap_config {
+	__u16 detail_constant;
+	__u16 detail_slope;
+	__u16 iir_strength;
+	__u16 strength;
+	__u32 lut[PISP_BE_TONEMAP_LUT_SIZE];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_demosaic_config - PiSP Back End Demosaic config
+ *
+ * Demosaic configuration
+ *
+ * @sharper:		Use other Bayer channels to increase sharpness
+ * @fc_mode:		Built-in false colour suppression mode
+ * @pad:		Padding bytes
+ */
+struct pisp_be_demosaic_config {
+	__u8 sharper;
+	__u8 fc_mode;
+	__u8 pad[2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_ccm_config - PiSP Back End CCM config
+ *
+ * Colour Correction Matrix configuration
+ *
+ * @coeffs:		Matrix coefficients
+ * @pad:		Padding bytes
+ * @offsets:		Offsets triplet
+ */
+struct pisp_be_ccm_config {
+	__s16 coeffs[9];
+	__u8 pad[2];
+	__s32 offsets[3];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_sat_control_config - PiSP Back End SAT config
+ *
+ * Saturation Control configuration
+ *
+ * @shift_r:		Left shift for Red colour channel
+ * @shift_g:		Left shift for Green colour channel
+ * @shift_b:		Left shift for Blue colour channel
+ * @pad:		Padding byte
+ */
+struct pisp_be_sat_control_config {
+	__u8 shift_r;
+	__u8 shift_g;
+	__u8 shift_b;
+	__u8 pad;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_false_colour_config - PiSP Back End False Colour config
+ *
+ * False Colour configuration
+ *
+ * @distance:		Distance of neighbouring pixels, either 1 or 2
+ * @pad:		Padding bytes
+ */
+struct pisp_be_false_colour_config {
+	__u8 distance;
+	__u8 pad[3];
+} __attribute__((packed));
+
+#define PISP_BE_SHARPEN_SIZE 5
+#define PISP_BE_SHARPEN_FUNC_NUM_POINTS 9
+
+/**
+ * struct pisp_be_sharpen_config - PiSP Back End Sharpening config
+ *
+ * Sharpening configuration
+ *
+ * @kernel0:		Coefficient for filter 0
+ * @pad0:		Padding byte
+ * @kernel1:		Coefficient for filter 1
+ * @pad1:		Padding byte
+ * @kernel2:		Coefficient for filter 2
+ * @pad2:		Padding byte
+ * @kernel3:		Coefficient for filter 3
+ * @pad3:		Padding byte
+ * @kernel4:		Coefficient for filter 4
+ * @pad4:		Padding byte
+ * @threshold_offset0:	Offset for filter 0 response calculation
+ * @threshold_slope0:	Slope multiplier for the filter 0 response calculation
+ * @scale0:		Scale factor for filter 0 response calculation
+ * @pad5:		Padding byte
+ * @threshold_offset1:	Offset for filter 0 response calculation
+ * @threshold_slope1:	Slope multiplier for the filter 0 response calculation
+ * @scale1:		Scale factor for filter 0 response calculation
+ * @pad6:		Padding byte
+ * @threshold_offset2:	Offset for filter 0 response calculation
+ * @threshold_slope2:	Slope multiplier for the filter 0 response calculation
+ * @scale2:		Scale factor for filter 0 response calculation
+ * @pad7:		Padding byte
+ * @threshold_offset3:	Offset for filter 0 response calculation
+ * @threshold_slope3:	Slope multiplier for the filter 0 response calculation
+ * @scale3:		Scale factor for filter 0 response calculation
+ * @pad8:		Padding byte
+ * @threshold_offset4:	Offset for filter 0 response calculation
+ * @threshold_slope4:	Slope multiplier for the filter 0 response calculation
+ * @scale4:		Scale factor for filter 0 response calculation
+ * @pad9:		Padding byte
+ * @positive_strength:	Factor to scale the positive sharpening strength
+ * @positive_pre_limit:	Maximum allowed possible positive sharpening value
+ * @positive_func:	Gain factor applied to positive sharpening response
+ * @positive_limit:	Final gain factor applied to positive sharpening
+ * @negative_strength:	Factor to scale the negative sharpening strength
+ * @negative_pre_limit:	Maximum allowed possible negative sharpening value
+ * @negative_func:	Gain factor applied to negative sharpening response
+ * @negative_limit:	Final gain factor applied to negative sharpening
+ * @enables:		Filter enable mask
+ * @white:		White output pixel filter mask
+ * @black:		Black output pixel filter mask
+ * @grey:		Grey output pixel filter mask
+ */
+struct pisp_be_sharpen_config {
+	__s8 kernel0[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad0[3];
+	__s8 kernel1[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad1[3];
+	__s8 kernel2[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad2[3];
+	__s8 kernel3[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad3[3];
+	__s8 kernel4[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad4[3];
+	__u16 threshold_offset0;
+	__u16 threshold_slope0;
+	__u16 scale0;
+	__u16 pad5;
+	__u16 threshold_offset1;
+	__u16 threshold_slope1;
+	__u16 scale1;
+	__u16 pad6;
+	__u16 threshold_offset2;
+	__u16 threshold_slope2;
+	__u16 scale2;
+	__u16 pad7;
+	__u16 threshold_offset3;
+	__u16 threshold_slope3;
+	__u16 scale3;
+	__u16 pad8;
+	__u16 threshold_offset4;
+	__u16 threshold_slope4;
+	__u16 scale4;
+	__u16 pad9;
+	__u16 positive_strength;
+	__u16 positive_pre_limit;
+	__u16 positive_func[PISP_BE_SHARPEN_FUNC_NUM_POINTS];
+	__u16 positive_limit;
+	__u16 negative_strength;
+	__u16 negative_pre_limit;
+	__u16 negative_func[PISP_BE_SHARPEN_FUNC_NUM_POINTS];
+	__u16 negative_limit;
+	__u8 enables;
+	__u8 white;
+	__u8 black;
+	__u8 grey;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_sh_fc_combine_config - PiSP Back End Sharpening and
+ *					 False Colour config
+ *
+ * Sharpening and False Colour configuration
+ *
+ * @y_factor:		Control amount of desaturation of pixels being darkened
+ * @c1_factor:		Control amount of brightening of a pixel for the Cb
+ *			channel
+ * @c2_factor:		Control amount of brightening of a pixel for the Cr
+ *			channel
+ * @pad:		Padding byte
+ */
+struct pisp_be_sh_fc_combine_config {
+	__u8 y_factor;
+	__u8 c1_factor;
+	__u8 c2_factor;
+	__u8 pad;
+} __attribute__((packed));
+
+#define PISP_BE_GAMMA_LUT_SIZE 64
+
+/**
+ * struct pisp_be_gamma_config - PiSP Back End Gamma configuration
+ * @lut:		Gamma curve look-up table
+ */
+struct pisp_be_gamma_config {
+	__u32 lut[PISP_BE_GAMMA_LUT_SIZE];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_crop_config - PiSP Back End Crop config
+ *
+ * Crop configuration
+ *
+ * @offset_x:		Number of pixels cropped from the left of the tile
+ * @offset_y:		Number of pixels cropped from the top of the tile
+ * @width:		Width of the cropped tile output
+ * @height:		Height of the cropped tile output
+ */
+struct pisp_be_crop_config {
+	__u16 offset_x, offset_y;
+	__u16 width, height;
+} __attribute__((packed));
+
+#define PISP_BE_RESAMPLE_FILTER_SIZE 96
+
+/**
+ * struct pisp_be_resample_config - PiSP Back End Resampling config
+ *
+ * Resample configuration
+ *
+ * @scale_factor_h:	Horizontal scale factor
+ * @scale_factor_v:	Vertical scale factor
+ * @coef:		Resample coefficients
+ */
+struct pisp_be_resample_config {
+	__u16 scale_factor_h, scale_factor_v;
+	__s16 coef[PISP_BE_RESAMPLE_FILTER_SIZE];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_resample_extra - PiSP Back End Resample config
+ *
+ * Resample configuration
+ *
+ * @scaled_width:	Width in pixels of the scaled output
+ * @scaled_height:	Height in pixels of the scaled output
+ * @initial_phase_h:	Initial horizontal phase
+ * @initial_phase_v:	Initial vertical phase
+ */
+struct pisp_be_resample_extra {
+	__u16 scaled_width;
+	__u16 scaled_height;
+	__s16 initial_phase_h[3];
+	__s16 initial_phase_v[3];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_downscale_config - PiSP Back End Downscale config
+ *
+ * Downscale configuration
+ *
+ * @scale_factor_h:	Horizontal scale factor
+ * @scale_factor_v:	Vertical scale factor
+ * @scale_recip_h:	Horizontal reciprocal factor
+ * @scale_recip_v:	Vertical reciprocal factor
+ */
+struct pisp_be_downscale_config {
+	__u16 scale_factor_h;
+	__u16 scale_factor_v;
+	__u16 scale_recip_h;
+	__u16 scale_recip_v;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_downscale_extra - PiSP Back End Downscale Extra config
+ * @scaled_width:	Scaled image width
+ * @scaled_height:	Scaled image height
+ */
+struct pisp_be_downscale_extra {
+	__u16 scaled_width;
+	__u16 scaled_height;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_hog_config - PiSP Back End HOG config
+ *
+ * Histogram of Oriented Gradients configuration
+ *
+ * @compute_signed:	Set 0 for unsigned gradients, 1 for signed
+ * @channel_mix:	Channels proportions to use
+ * @stride:		Stride in bytes between blocks directly below
+ */
+struct pisp_be_hog_config {
+	__u8 compute_signed;
+	__u8 channel_mix[3];
+	__u32 stride;
+} __attribute__((packed));
+
+struct pisp_be_axi_config {
+	__u8 r_qos; /* Read QoS */
+	__u8 r_cache_prot; /* Read { prot[2:0], cache[3:0] } */
+	__u8 w_qos; /* Write QoS */
+	__u8 w_cache_prot; /* Write { prot[2:0], cache[3:0] } */
+} __attribute__((packed));
+
+/**
+ * enum pisp_be_transform - PiSP Back End Transform flags
+ * @PISP_BE_TRANSFORM_NONE:	No transform
+ * @PISP_BE_TRANSFORM_HFLIP:	Horizontal flip
+ * @PISP_BE_TRANSFORM_VFLIP:	Vertical flip
+ * @PISP_BE_TRANSFORM_ROT180:	180 degress rotation
+ */
+enum pisp_be_transform {
+	PISP_BE_TRANSFORM_NONE = 0x0,
+	PISP_BE_TRANSFORM_HFLIP = 0x1,
+	PISP_BE_TRANSFORM_VFLIP = 0x2,
+	PISP_BE_TRANSFORM_ROT180 =
+		(PISP_BE_TRANSFORM_HFLIP | PISP_BE_TRANSFORM_VFLIP)
+};
+
+struct pisp_be_output_format_config {
+	struct pisp_image_format_config image;
+	__u8 transform;
+	__u8 pad[3];
+	__u16 lo;
+	__u16 hi;
+	__u16 lo2;
+	__u16 hi2;
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_output_buffer_config - PiSP Back End Output buffer
+ * @addr:		Output buffer address
+ */
+struct pisp_be_output_buffer_config {
+	/* low 32 bits followed by high 32 bits (for each of 3 planes) */
+	__u32 addr[3][2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_hog_buffer_config - PiSP Back End HOG buffer
+ * @addr:		HOG buffer address
+ */
+struct pisp_be_hog_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_config - RaspberryPi PiSP Back End Processing configuration
+ *
+ * @global:			Global PiSP configuration
+ * @input_format:		Input image format
+ * @decompress:			Decompress configuration
+ * @dpc:			Defective Pixel Correction configuration
+ * @geq:			Green Equalisation configuration
+ * @tdn_input_format:		Temporal Denoise input format
+ * @tdn_decompress:		Temporal Denoise decompress configuration
+ * @tdn:			Temporal Denoise configuration
+ * @tdn_compress:		Temporal Denoise compress configuration
+ * @tdn_output_format:		Temporal Denoise output format
+ * @sdn:			Spatial Denoise configuration
+ * @blc:			Black Level Correction configuration
+ * @stitch_compress:		Stitch compress configuration
+ * @stitch_output_format:	Stitch output format
+ * @stitch_input_format:	Stitch input format
+ * @stitch_decompress:		Stitch decompress configuration
+ * @stitch:			Stitch configuration
+ * @lsc:			Lens Shading Correction configuration
+ * @wbg:			White Balance Gain configuration
+ * @cdn:			Colour Denoise configuration
+ * @cac:			Colour Aberration Correction configuration
+ * @debin:			Debinning configuration
+ * @tonemap:			Tonemapping configuration
+ * @demosaic:			Demosaicing configuration
+ * @ccm:			Colour Correction Matrix configuration
+ * @sat_control:		Saturation Control configuration
+ * @ycbcr:			YCbCr colour correction configuration
+ * @sharpen:			Sharpening configuration
+ * @false_colour:		False colour correction
+ * @sh_fc_combine:		Sharpening and False Colour correction
+ * @ycbcr_inverse:		Inverse YCbCr colour correction
+ * @gamma:			Gamma curve configuration
+ * @csc:			Color Space Conversion configuration
+ * @downscale:			Downscale configuration
+ * @resample:			Resampling configuration
+ * @output_format:		Output format configuration
+ * @hog:			HOG configuration
+ */
+struct pisp_be_config {
+	struct pisp_be_global_config global;
+	struct pisp_image_format_config input_format;
+	struct pisp_decompress_config decompress;
+	struct pisp_be_dpc_config dpc;
+	struct pisp_be_geq_config geq;
+	struct pisp_image_format_config tdn_input_format;
+	struct pisp_decompress_config tdn_decompress;
+	struct pisp_be_tdn_config tdn;
+	struct pisp_compress_config tdn_compress;
+	struct pisp_image_format_config tdn_output_format;
+	struct pisp_be_sdn_config sdn;
+	struct pisp_bla_config blc;
+	struct pisp_compress_config stitch_compress;
+	struct pisp_image_format_config stitch_output_format;
+	struct pisp_image_format_config stitch_input_format;
+	struct pisp_decompress_config stitch_decompress;
+	struct pisp_be_stitch_config stitch;
+	struct pisp_be_lsc_config lsc;
+	struct pisp_wbg_config wbg;
+	struct pisp_be_cdn_config cdn;
+	struct pisp_be_cac_config cac;
+	struct pisp_be_debin_config debin;
+	struct pisp_be_tonemap_config tonemap;
+	struct pisp_be_demosaic_config demosaic;
+	struct pisp_be_ccm_config ccm;
+	struct pisp_be_sat_control_config sat_control;
+	struct pisp_be_ccm_config ycbcr;
+	struct pisp_be_sharpen_config sharpen;
+	struct pisp_be_false_colour_config false_colour;
+	struct pisp_be_sh_fc_combine_config sh_fc_combine;
+	struct pisp_be_ccm_config ycbcr_inverse;
+	struct pisp_be_gamma_config gamma;
+	struct pisp_be_ccm_config csc[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_downscale_config downscale[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_resample_config resample[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_output_format_config
+				output_format[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_hog_config hog;
+} __attribute__((packed));
+
+/**
+ * enum pisp_tile_edge - PiSP Back End Tile position
+ * @PISP_LEFT_EDGE:		Left edge tile
+ * @PISP_RIGHT_EDGE:		Right edge tile
+ * @PISP_TOP_EDGE:		Top edge tile
+ * @PISP_BOTTOM_EDGE:		Bottom edge tile
+ */
+enum pisp_tile_edge {
+	PISP_LEFT_EDGE = (1 << 0),
+	PISP_RIGHT_EDGE = (1 << 1),
+	PISP_TOP_EDGE = (1 << 2),
+	PISP_BOTTOM_EDGE = (1 << 3)
+};
+
+/**
+ * struct pisp_tile - Raspberry Pi PiSP Back End tile configuration
+ *
+ * Tile parameters: each set of tile parameters is a 160-bytes block of data
+ * which contains the tile processing parameters.
+ *
+ * @edge:			Edge tile flag
+ * @pad0:			Padding bytes
+ * @input_addr_offset:		Top-left pixel offset, in bytes
+ * @input_addr_offset2:		Top-left pixel offset, in bytes for the second/
+ *				third image planes
+ * @input_offset_x:		Horizontal offset in pixels of this tile in the
+ *				input image
+ * @input_offset_y:		Vertical offset in pixels of this tile in the
+ *				input image
+ * @input_width:		Width in pixels of this tile
+ * @input_height:		Height in pixels of the this tile
+ * @tdn_input_addr_offset:	TDN input image offset, in bytes
+ * @tdn_output_addr_offset:	TDN output image offset, in bytes
+ * @stitch_input_addr_offset:	Stitch input image offset, in bytes
+ * @stitch_output_addr_offset:	Stitch output image offset, in bytes
+ * @lsc_grid_offset_x:		Horizontal offset in the LSC table for this tile
+ * @lsc_grid_offset_y:		Vertical offset in the LSC table for this tile
+ * @cac_grid_offset_x:		Horizontal offset in the CAC table for this tile
+ * @cac_grid_offset_y:		Horizontal offset in the CAC table for this tile
+ * @crop_x_start:		Number of pixels cropped from the left of the
+ *				tile
+ * @crop_x_end:			Number of pixels cropped from the right of the
+ *				tile
+ * @crop_y_start:		Number of pixels cropped from the top of the
+ *				tile
+ * @crop_y_end:			Number of pixels cropped from the bottom of the
+ *				tile
+ * @downscale_phase_x:		Initial horizontal phase in pixels
+ * @downscale_phase_y:		Initial vertical phase in pixels
+ * @resample_in_width:		Width in pixels of the tile entering the
+ *				Resample block
+ * @resample_in_height:		Height in pixels of the tile entering the
+ *				Resample block
+ * @resample_phase_x:		Initial horizontal phase for the Resample block
+ * @resample_phase_y:		Initial vertical phase for the Resample block
+ * @output_offset_x:		Horizontal offset in pixels where the tile will
+ *				be written into the output image
+ * @output_offset_y:		Vertical offset in pixels where the tile will be
+ *				written into the output image
+ * @output_width:		Width in pixels in the output image of this tile
+ * @output_height:		Height in pixels in the output image of this tile
+ * @output_addr_offset:		Offset in bytes into the output buffer
+ * @output_addr_offset2:	Offset in bytes into the output buffer for the
+ *				second and third plane
+ * @output_hog_addr_offset:	Offset in bytes into the HOG buffer where
+ *				results of this tile are to be written
+ */
+struct pisp_tile {
+	__u8 edge; /* enum pisp_tile_edge */
+	__u8 pad0[3];
+	/* 4 bytes */
+	__u32 input_addr_offset;
+	__u32 input_addr_offset2;
+	__u16 input_offset_x;
+	__u16 input_offset_y;
+	__u16 input_width;
+	__u16 input_height;
+	/* 20 bytes */
+	__u32 tdn_input_addr_offset;
+	__u32 tdn_output_addr_offset;
+	__u32 stitch_input_addr_offset;
+	__u32 stitch_output_addr_offset;
+	/* 36 bytes */
+	__u32 lsc_grid_offset_x;
+	__u32 lsc_grid_offset_y;
+	/* 44 bytes */
+	__u32 cac_grid_offset_x;
+	__u32 cac_grid_offset_y;
+	/* 52 bytes */
+	__u16 crop_x_start[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 crop_x_end[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 crop_y_start[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 crop_y_end[PISP_BACK_END_NUM_OUTPUTS];
+	/* 68 bytes */
+	/* Ordering is planes then branches */
+	__u16 downscale_phase_x[3 * PISP_BACK_END_NUM_OUTPUTS];
+	__u16 downscale_phase_y[3 * PISP_BACK_END_NUM_OUTPUTS];
+	/* 92 bytes */
+	__u16 resample_in_width[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 resample_in_height[PISP_BACK_END_NUM_OUTPUTS];
+	/* 100 bytes */
+	/* Ordering is planes then branches */
+	__u16 resample_phase_x[3 * PISP_BACK_END_NUM_OUTPUTS];
+	__u16 resample_phase_y[3 * PISP_BACK_END_NUM_OUTPUTS];
+	/* 124 bytes */
+	__u16 output_offset_x[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 output_offset_y[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 output_width[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 output_height[PISP_BACK_END_NUM_OUTPUTS];
+	/* 140 bytes */
+	__u32 output_addr_offset[PISP_BACK_END_NUM_OUTPUTS];
+	__u32 output_addr_offset2[PISP_BACK_END_NUM_OUTPUTS];
+	/* 156 bytes */
+	__u32 output_hog_addr_offset;
+	/* 160 bytes */
+} __attribute__((packed));
+
+/**
+ * struct pisp_be_tiles_config - Raspberry Pi PiSP Back End configuration
+ * @tiles:	Tile descriptors
+ * @num_tiles:	Number of tiles
+ * @config:	PiSP Back End configuration
+ */
+struct pisp_be_tiles_config {
+	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
+	int num_tiles;
+	struct pisp_be_config config;
+} __attribute__((packed));
+
+#endif /* _UAPI_PISP_BE_CONFIG_H_ */
diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
new file mode 100644
index 000000000000..b2522e29c976
--- /dev/null
+++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
@@ -0,0 +1,199 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * RP1 PiSP common definitions.
+ *
+ * Copyright (C) 2021 - Raspberry Pi Ltd.
+ *
+ */
+#ifndef _UAPI_PISP_COMMON_H_
+#define _UAPI_PISP_COMMON_H_
+
+#include <linux/types.h>
+
+struct pisp_image_format_config {
+	/* size in pixels */
+	__u16 width;
+	__u16 height;
+	/* must match struct pisp_image_format below */
+	__u32 format;
+	__s32 stride;
+	/* some planar image formats will need a second stride */
+	__s32 stride2;
+} __attribute__((packed));
+
+enum pisp_bayer_order {
+	/*
+	 * Note how bayer_order&1 tells you if G is on the even pixels of the
+	 * checkerboard or not, and bayer_order&2 tells you if R is on the even
+	 * rows or is swapped with B. Note that if the top (of the 8) bits is
+	 * set, this denotes a monochrome or greyscale image, and the lower bits
+	 * should all be ignored.
+	 */
+	PISP_BAYER_ORDER_RGGB = 0,
+	PISP_BAYER_ORDER_GBRG = 1,
+	PISP_BAYER_ORDER_BGGR = 2,
+	PISP_BAYER_ORDER_GRBG = 3,
+	PISP_BAYER_ORDER_GREYSCALE = 128
+};
+
+enum pisp_image_format {
+	/*
+	 * Precise values are mostly tbd. Generally these will be portmanteau
+	 * values comprising bit fields and flags. This format must be shared
+	 * throughout the PiSP.
+	 */
+	PISP_IMAGE_FORMAT_BPS_8 = 0x00000000,
+	PISP_IMAGE_FORMAT_BPS_10 = 0x00000001,
+	PISP_IMAGE_FORMAT_BPS_12 = 0x00000002,
+	PISP_IMAGE_FORMAT_BPS_16 = 0x00000003,
+	PISP_IMAGE_FORMAT_BPS_MASK = 0x00000003,
+
+	PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED = 0x00000000,
+	PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR = 0x00000010,
+	PISP_IMAGE_FORMAT_PLANARITY_PLANAR = 0x00000020,
+	PISP_IMAGE_FORMAT_PLANARITY_MASK = 0x00000030,
+
+	PISP_IMAGE_FORMAT_SAMPLING_444 = 0x00000000,
+	PISP_IMAGE_FORMAT_SAMPLING_422 = 0x00000100,
+	PISP_IMAGE_FORMAT_SAMPLING_420 = 0x00000200,
+	PISP_IMAGE_FORMAT_SAMPLING_MASK = 0x00000300,
+
+	PISP_IMAGE_FORMAT_ORDER_NORMAL = 0x00000000,
+	PISP_IMAGE_FORMAT_ORDER_SWAPPED = 0x00001000,
+
+	PISP_IMAGE_FORMAT_SHIFT_0 = 0x00000000,
+	PISP_IMAGE_FORMAT_SHIFT_1 = 0x00010000,
+	PISP_IMAGE_FORMAT_SHIFT_2 = 0x00020000,
+	PISP_IMAGE_FORMAT_SHIFT_3 = 0x00030000,
+	PISP_IMAGE_FORMAT_SHIFT_4 = 0x00040000,
+	PISP_IMAGE_FORMAT_SHIFT_5 = 0x00050000,
+	PISP_IMAGE_FORMAT_SHIFT_6 = 0x00060000,
+	PISP_IMAGE_FORMAT_SHIFT_7 = 0x00070000,
+	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
+	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
+
+	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MODE_3 = 0x03000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MASK = 0x03000000,
+
+	PISP_IMAGE_FORMAT_HOG_SIGNED = 0x04000000,
+	PISP_IMAGE_FORMAT_HOG_UNSIGNED = 0x08000000,
+	PISP_IMAGE_FORMAT_INTEGRAL_IMAGE = 0x10000000,
+	PISP_IMAGE_FORMAT_WALLPAPER_ROLL = 0x20000000,
+	PISP_IMAGE_FORMAT_THREE_CHANNEL = 0x40000000,
+
+	/* Lastly a few specific instantiations of the above. */
+	PISP_IMAGE_FORMAT_SINGLE_16 = PISP_IMAGE_FORMAT_BPS_16,
+	PISP_IMAGE_FORMAT_THREE_16 = PISP_IMAGE_FORMAT_BPS_16 |
+				     PISP_IMAGE_FORMAT_THREE_CHANNEL
+};
+
+#define PISP_IMAGE_FORMAT_bps_8(fmt)                                           \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_8)
+#define PISP_IMAGE_FORMAT_bps_10(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_10)
+#define PISP_IMAGE_FORMAT_bps_12(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_12)
+#define PISP_IMAGE_FORMAT_bps_16(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_16)
+#define PISP_IMAGE_FORMAT_bps(fmt)                                             \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) ?                                \
+	       8 + (2 << (((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) - 1)) : 8)
+#define PISP_IMAGE_FORMAT_shift(fmt)                                           \
+	(((fmt) & PISP_IMAGE_FORMAT_SHIFT_MASK) / PISP_IMAGE_FORMAT_SHIFT_1)
+#define PISP_IMAGE_FORMAT_three_channel(fmt)                                   \
+	((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL)
+#define PISP_IMAGE_FORMAT_single_channel(fmt)                                  \
+	(!((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL))
+#define PISP_IMAGE_FORMAT_compressed(fmt)                                      \
+	(((fmt) & PISP_IMAGE_FORMAT_COMPRESSION_MASK) !=                       \
+	 PISP_IMAGE_FORMAT_UNCOMPRESSED)
+#define PISP_IMAGE_FORMAT_sampling_444(fmt)                                    \
+	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
+	 PISP_IMAGE_FORMAT_SAMPLING_444)
+#define PISP_IMAGE_FORMAT_sampling_422(fmt)                                    \
+	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
+	 PISP_IMAGE_FORMAT_SAMPLING_422)
+#define PISP_IMAGE_FORMAT_sampling_420(fmt)                                    \
+	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
+	 PISP_IMAGE_FORMAT_SAMPLING_420)
+#define PISP_IMAGE_FORMAT_order_normal(fmt)                                    \
+	(!((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED))
+#define PISP_IMAGE_FORMAT_order_swapped(fmt)                                   \
+	((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED)
+#define PISP_IMAGE_FORMAT_interleaved(fmt)                                     \
+	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
+	 PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED)
+#define PISP_IMAGE_FORMAT_semiplanar(fmt)                                      \
+	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
+	 PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR)
+#define PISP_IMAGE_FORMAT_planar(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
+	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
+#define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
+	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
+#define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
+	((fmt) &                                                               \
+	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
+
+#define PISP_WALLPAPER_WIDTH 128 /* in bytes */
+
+struct pisp_bla_config {
+	__u16 black_level_r;
+	__u16 black_level_gr;
+	__u16 black_level_gb;
+	__u16 black_level_b;
+	__u16 output_black_level;
+	__u8 pad[2];
+} __attribute__((packed));
+
+struct pisp_wbg_config {
+	__u16 gain_r;
+	__u16 gain_g;
+	__u16 gain_b;
+	__u8 pad[2];
+} __attribute__((packed));
+
+struct pisp_compress_config {
+	/* value subtracted from incoming data */
+	__u16 offset;
+	__u8 pad;
+	/* 1 => Companding; 2 => Delta (recommended); 3 => Combined (for HDR) */
+	__u8 mode;
+} __attribute__((packed));
+
+struct pisp_decompress_config {
+	/* value added to reconstructed data */
+	__u16 offset;
+	__u8 pad;
+	/* 1 => Companding; 2 => Delta (recommended); 3 => Combined (for HDR) */
+	__u8 mode;
+} __attribute__((packed));
+
+enum pisp_axi_flags {
+	/*
+	 * round down bursts to end at a 32-byte boundary, to align following
+	 * bursts
+	 */
+	PISP_AXI_FLAG_ALIGN = 128,
+	/* for FE writer: force WSTRB high, to pad output to 16-byte boundary */
+	PISP_AXI_FLAG_PAD = 64,
+	/* for FE writer: Use Output FIFO level to trigger "panic" */
+	PISP_AXI_FLAG_PANIC = 32,
+};
+
+struct pisp_axi_config {
+	/*
+	 * burst length minus one, which must be in the range 0:15; OR'd with
+	 * flags
+	 */
+	__u8 maxlen_flags;
+	/* { prot[2:0], cache[3:0] } fields, echoed on AXI bus */
+	__u8 cache_prot;
+	/* QoS field(s) (4x4 bits for FE writer; 4 bits for other masters) */
+	__u16 qos;
+} __attribute__((packed));
+
+#endif /* _UAPI_PISP_COMMON_H_ */
-- 
2.45.1


