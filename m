Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EAA454DF9
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240553AbhKQThV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240508AbhKQThL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B250461BCF;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177651;
        bh=ytvlIhLdcp4Op8aN7j21UD/tbIUiPaZIY4rIWVgdALI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mtJgF7p3apbdic6sYBbNzi1fgHtq6txZ+ZO4dlSiXjOC1pVCgZbp5jHoAx0v4zYdX
         TF4tZoD6yDg/I6PZBmiHffet2xhI05zQRm9ZSoKVco4y9hN8XO7s2Ud2LERb7Ivb2c
         sCXGsAkAdhVy8ntZTFJnoqh0HDmtXHAG8KmME4aRh7KHJswxcjNZlnpN3jnas5ocJK
         /Mbb9cJlA4Pr3mPKO6zXP68qT8V2eYVmpX8lTp/LQm3LbjfmFCt5wmZaE9nFcodzDG
         i7c6ZJCq4SMm2XJmNnaCvXETqOvo+tRF1sEj1pg7XBPAAn2saKzmI8qrTqSOMGvYQz
         e1ZSPMmXPQQLg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHi-2Q; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 3/8] media: atomisp: simplify binary.c
Date:   Wed, 17 Nov 2021 19:34:01 +0000
Message-Id: <015f09434c0d2c7a69f6bad115d6006627e3f64c.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 .../atomisp/pci/runtime/binary/src/binary.c   | 413 +-----------------
 1 file changed, 10 insertions(+), 403 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 9af23fdb127b..5e435bec942b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -261,227 +261,12 @@ ia_css_binary_compute_shading_table_bayer_origin(
 	return err;
 }
 
-/* ISP2401: Get the requirements for the shading correction. */
-static int
-sh_css_binary_get_sc_requirements(const struct ia_css_binary *binary, /* [in] */
-				  unsigned int required_bds_factor,   /* [in] */
-				  const struct ia_css_stream_config *stream_config, /* [in] */
-				  struct sh_css_binary_sc_requirements *scr) /* [out] */
-{
-	int err;
-
-	/* Numerator and denominator of the fixed bayer downscaling factor. (numerator >= denominator) */
-	unsigned int bds_num, bds_den;
-
-	/* Horizontal/Vertical ratio of bayer scaling between input area and output area. */
-	unsigned int bs_hor_ratio_in, bs_hor_ratio_out, bs_ver_ratio_in, bs_ver_ratio_out;
-
-	/* Left padding set by InputFormatter. */
-	unsigned int left_padding_bqs;
-
-	/* Flags corresponding to NEED_BDS_FACTOR_2_00/NEED_BDS_FACTOR_1_50/NEED_BDS_FACTOR_1_25 macros
-	 * defined in isp kernels. */
-	unsigned int need_bds_factor_2_00, need_bds_factor_1_50, need_bds_factor_1_25;
-
-	/* Left padding adjusted inside the isp kernels. */
-	unsigned int left_padding_adjusted_bqs;
-
-	/* Top padding padded inside the isp kernel for bayer downscaling binaries. */
-	unsigned int top_padding_bqs;
-
-	/* Bayer downscaling factor 1.0 by fixed-point. */
-	int bds_frac_acc = FRAC_ACC;	/* FRAC_ACC is defined in ia_css_fixedbds_param.h. */
-
-	/* Right/Down shift amount caused by filters applied BEFORE shading corrertion. */
-	unsigned int right_shift_bqs_before_bs; /* right shift before bayer scaling */
-	unsigned int right_shift_bqs_after_bs;  /* right shift after bayer scaling */
-	unsigned int down_shift_bqs_before_bs;  /* down shift before bayer scaling */
-	unsigned int down_shift_bqs_after_bs;   /* down shift after bayer scaling */
-
-	/* Origin of the real sensor data area on the internal frame at shading correction. */
-	unsigned int sensor_data_origin_x_bqs_on_internal;
-	unsigned int sensor_data_origin_y_bqs_on_internal;
-
-	unsigned int bs_frac = bds_frac_acc;	/* scaling factor 1.0 in fixed point */
-	unsigned int bs_out, bs_in;		/* scaling ratio in fixed point */
-
-	IA_CSS_ENTER_PRIVATE("binary=%p, required_bds_factor=%d, stream_config=%p",
-			     binary, required_bds_factor, stream_config);
-
-	/* Get the numerator and denominator of the required bayer downscaling factor. */
-	err = sh_css_bds_factor_get_numerator_denominator(required_bds_factor,
-							  &bds_num, &bds_den);
-	if (err) {
-		IA_CSS_LEAVE_ERR_PRIVATE(err);
-		return err;
-	}
-
-	IA_CSS_LOG("bds_num=%d, bds_den=%d", bds_num, bds_den);
-
-	/* Set the horizontal/vertical ratio of bayer scaling between input area and output area. */
-	bs_hor_ratio_in  = bds_num;
-	bs_hor_ratio_out = bds_den;
-	bs_ver_ratio_in  = bds_num;
-	bs_ver_ratio_out = bds_den;
-
-	/* Set the left padding set by InputFormatter. (ia_css_ifmtr_configure() in ifmtr.c) */
-	if (stream_config->left_padding == -1)
-		left_padding_bqs = _ISP_BQS(binary->left_padding);
-	else
-		left_padding_bqs = (unsigned int)((int)ISP_VEC_NELEMS - _ISP_BQS(stream_config->left_padding));
-
-	IA_CSS_LOG("stream.left_padding=%d, binary.left_padding=%d, left_padding_bqs=%d",
-		   stream_config->left_padding, binary->left_padding,
-		   left_padding_bqs);
-
-	/* Set the left padding adjusted inside the isp kernels.
-	* When the bds_factor isn't 1.00, the left padding size is adjusted inside the isp,
-	* before bayer downscaling. (scaled_hor_plane_index(), raw_compute_hphase() in raw.isp.c)
-	*/
-	need_bds_factor_2_00 = ((binary->info->sp.bds.supported_bds_factors &
-				(PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_2_00) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_2_50) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_3_00) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_4_00) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_4_50) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_5_00) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_6_00) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_8_00))) != 0);
-
-	need_bds_factor_1_50 = ((binary->info->sp.bds.supported_bds_factors &
-				(PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_1_50) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_2_25) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_3_00) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_4_50) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_6_00))) != 0);
-
-	need_bds_factor_1_25 = ((binary->info->sp.bds.supported_bds_factors &
-				(PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_1_25) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_2_50) |
-				PACK_BDS_FACTOR(SH_CSS_BDS_FACTOR_5_00))) != 0);
-
-	if (binary->info->sp.pipeline.left_cropping > 0 &&
-	    (need_bds_factor_2_00 || need_bds_factor_1_50 || need_bds_factor_1_25)) {
-		/*
-		* downscale 2.0  -> first_vec_adjusted_bqs = 128
-		* downscale 1.5  -> first_vec_adjusted_bqs = 96
-		* downscale 1.25 -> first_vec_adjusted_bqs = 80
-		*/
-		unsigned int first_vec_adjusted_bqs = ISP_VEC_NELEMS * bs_hor_ratio_in / bs_hor_ratio_out;
-		left_padding_adjusted_bqs = first_vec_adjusted_bqs
-			    - _ISP_BQS(binary->info->sp.pipeline.left_cropping);
-	} else {
-		left_padding_adjusted_bqs = left_padding_bqs;
-	}
-
-	IA_CSS_LOG("supported_bds_factors=%d, need_bds_factor:2_00=%d, 1_50=%d, 1_25=%d",
-		   binary->info->sp.bds.supported_bds_factors,
-		   need_bds_factor_2_00, need_bds_factor_1_50,
-		   need_bds_factor_1_25);
-	IA_CSS_LOG("left_cropping=%d, left_padding_adjusted_bqs=%d",
-		   binary->info->sp.pipeline.left_cropping,
-		   left_padding_adjusted_bqs);
-
-	/* Set the top padding padded inside the isp kernel for bayer downscaling binaries.
-	* When the bds_factor isn't 1.00, the top padding is padded inside the isp
-	* before bayer downscaling, because the top cropping size (input margin) is not enough.
-	* (calculate_input_line(), raw_compute_vphase(), dma_read_raw() in raw.isp.c)
-	* NOTE: In dma_read_raw(), the factor passed to raw_compute_vphase() is got by get_bds_factor_for_dma_read().
-	*       This factor is BDS_FPVAL_100/BDS_FPVAL_125/BDS_FPVAL_150/BDS_FPVAL_200.
-	*/
-	top_padding_bqs = 0;
-	if (binary->info->sp.pipeline.top_cropping > 0 &&
-	    (required_bds_factor == SH_CSS_BDS_FACTOR_1_25 ||
-	    required_bds_factor == SH_CSS_BDS_FACTOR_1_50 ||
-	    required_bds_factor == SH_CSS_BDS_FACTOR_2_00)) {
-		/* Calculation from calculate_input_line() and raw_compute_vphase() in raw.isp.c. */
-		int top_cropping_bqs = _ISP_BQS(binary->info->sp.pipeline.top_cropping);
-		/* top cropping (in bqs) */
-		int factor = bds_num * bds_frac_acc /
-		bds_den;	/* downscaling factor by fixed-point */
-		int top_padding_bqsxfrac_acc = (top_cropping_bqs * factor - top_cropping_bqs *
-						bds_frac_acc)
-		+ (2 * bds_frac_acc - factor);	/* top padding by fixed-point (in bqs) */
-
-		top_padding_bqs = (unsigned int)((top_padding_bqsxfrac_acc + bds_frac_acc / 2 -
-						1) / bds_frac_acc);
-	}
-
-	IA_CSS_LOG("top_cropping=%d, top_padding_bqs=%d",
-		   binary->info->sp.pipeline.top_cropping, top_padding_bqs);
-
-	/* Set the right/down shift amount caused by filters applied BEFORE bayer scaling,
-	* which scaling is applied BEFORE shading corrertion.
-	*
-	* When the bds_factor isn't 1.00, 3x3 anti-alias filter is applied to each color plane(Gr/R/B/Gb)
-	* before bayer downscaling.
-	* This filter shifts each color plane (Gr/R/B/Gb) to right/down directions by 1 pixel.
-	*/
-	right_shift_bqs_before_bs = 0;
-	down_shift_bqs_before_bs = 0;
-
-	if (need_bds_factor_2_00 || need_bds_factor_1_50 || need_bds_factor_1_25) {
-		right_shift_bqs_before_bs = 1;
-		down_shift_bqs_before_bs = 1;
-	}
-
-	IA_CSS_LOG("right_shift_bqs_before_bs=%d, down_shift_bqs_before_bs=%d",
-		   right_shift_bqs_before_bs, down_shift_bqs_before_bs);
-
-	/* Set the right/down shift amount caused by filters applied AFTER bayer scaling,
-	* which scaling is applied BEFORE shading corrertion.
-	*
-	* When DPC&BNR is processed between bayer scaling and shading correction,
-	* DPC&BNR moves each color plane (Gr/R/B/Gb) to right/down directions by 1 pixel.
-	*/
-	right_shift_bqs_after_bs = 0;
-	down_shift_bqs_after_bs = 0;
-
-	/* if DPC&BNR is enabled in the binary */
-	if (binary->info->mem_offsets.offsets.param->dmem.dp.size != 0) {
-		right_shift_bqs_after_bs = 1;
-		down_shift_bqs_after_bs = 1;
-	}
-
-	IA_CSS_LOG("right_shift_bqs_after_bs=%d, down_shift_bqs_after_bs=%d",
-		   right_shift_bqs_after_bs, down_shift_bqs_after_bs);
-
-	bs_out = bs_hor_ratio_out * bs_frac;
-	bs_in = bs_hor_ratio_in * bs_frac;
-	sensor_data_origin_x_bqs_on_internal =
-		((left_padding_adjusted_bqs + right_shift_bqs_before_bs) * bs_out + bs_in / 2) / bs_in
-		+ right_shift_bqs_after_bs;	/* "+ bs_in/2": rounding */
-
-	bs_out = bs_ver_ratio_out * bs_frac;
-	bs_in = bs_ver_ratio_in * bs_frac;
-	sensor_data_origin_y_bqs_on_internal =
-		((top_padding_bqs + down_shift_bqs_before_bs) * bs_out + bs_in / 2) / bs_in
-		+ down_shift_bqs_after_bs;	/* "+ bs_in/2": rounding */
-
-	scr->bayer_scale_hor_ratio_in			= (uint32_t)bs_hor_ratio_in;
-	scr->bayer_scale_hor_ratio_out			= (uint32_t)bs_hor_ratio_out;
-	scr->bayer_scale_ver_ratio_in			= (uint32_t)bs_ver_ratio_in;
-	scr->bayer_scale_ver_ratio_out			= (uint32_t)bs_ver_ratio_out;
-	scr->sensor_data_origin_x_bqs_on_internal	= (uint32_t)sensor_data_origin_x_bqs_on_internal;
-	scr->sensor_data_origin_y_bqs_on_internal	= (uint32_t)sensor_data_origin_y_bqs_on_internal;
-
-	IA_CSS_LOG("sc_requirements: %d, %d, %d, %d, %d, %d",
-		   scr->bayer_scale_hor_ratio_in,
-		   scr->bayer_scale_hor_ratio_out,
-		   scr->bayer_scale_ver_ratio_in, scr->bayer_scale_ver_ratio_out,
-		   scr->sensor_data_origin_x_bqs_on_internal,
-		   scr->sensor_data_origin_y_bqs_on_internal);
-
-	IA_CSS_LEAVE_ERR_PRIVATE(err);
-	return err;
-}
-
 /* Get the shading information of Shading Correction Type 1. */
 static int
-isp2400_binary_get_shading_info_type_1(const struct ia_css_binary *binary,	/* [in] */
-				       unsigned int required_bds_factor,			/* [in] */
-				       const struct ia_css_stream_config *stream_config,	/* [in] */
-				       struct ia_css_shading_info *info)			/* [out] */
+binary_get_shading_info_type_1(const struct ia_css_binary *binary,	/* [in] */
+			       unsigned int required_bds_factor,			/* [in] */
+			       const struct ia_css_stream_config *stream_config,	/* [in] */
+			       struct ia_css_shading_info *info)			/* [out] */
 {
 	int err;
 	struct sh_css_shading_table_bayer_origin_compute_results res;
@@ -522,173 +307,6 @@ isp2400_binary_get_shading_info_type_1(const struct ia_css_binary *binary,	/* [i
 	return err;
 }
 
-/* Get the shading information of Shading Correction Type 1. */
-static int
-isp2401_binary_get_shading_info_type_1(const struct ia_css_binary *binary,	/* [in] */
-				       unsigned int required_bds_factor,			/* [in] */
-				       const struct ia_css_stream_config *stream_config,	/* [in] */
-				       struct ia_css_shading_info *shading_info,		/* [out] */
-				       struct ia_css_pipe_config *pipe_config)			/* [out] */
-{
-	int err;
-	struct sh_css_binary_sc_requirements scr;
-
-	u32 in_width_bqs, in_height_bqs, internal_width_bqs, internal_height_bqs;
-	u32 num_hor_grids, num_ver_grids, bqs_per_grid_cell, tbl_width_bqs, tbl_height_bqs;
-	u32 sensor_org_x_bqs_on_internal, sensor_org_y_bqs_on_internal, sensor_width_bqs, sensor_height_bqs;
-	u32 sensor_center_x_bqs_on_internal, sensor_center_y_bqs_on_internal;
-	u32 left, right, upper, lower;
-	u32 adjust_left, adjust_right, adjust_upper, adjust_lower, adjust_width_bqs, adjust_height_bqs;
-	u32 internal_org_x_bqs_on_tbl, internal_org_y_bqs_on_tbl;
-	u32 sensor_org_x_bqs_on_tbl, sensor_org_y_bqs_on_tbl;
-
-	assert(binary);
-	assert(stream_config);
-	assert(shading_info);
-	assert(pipe_config);
-
-	IA_CSS_ENTER_PRIVATE("binary=%p, required_bds_factor=%d, stream_config=%p",
-			     binary, required_bds_factor, stream_config);
-
-	/* Initialize by default values. */
-	*shading_info = DEFAULT_SHADING_INFO_TYPE_1;
-
-	err = sh_css_binary_get_sc_requirements(binary, required_bds_factor, stream_config, &scr);
-	if (err) {
-		IA_CSS_LEAVE_ERR_PRIVATE(err);
-		return err;
-	}
-
-	IA_CSS_LOG("binary: id=%d, sctbl=%dx%d, deci=%d",
-		binary->info->sp.id, binary->sctbl_width_per_color, binary->sctbl_height, binary->deci_factor_log2);
-	IA_CSS_LOG("binary: in=%dx%d, in_padded_w=%d, int=%dx%d, int_padded_w=%d, out=%dx%d, out_padded_w=%d",
-		binary->in_frame_info.res.width, binary->in_frame_info.res.height, binary->in_frame_info.padded_width,
-		binary->internal_frame_info.res.width, binary->internal_frame_info.res.height,
-		binary->internal_frame_info.padded_width,
-		binary->out_frame_info[0].res.width, binary->out_frame_info[0].res.height,
-		binary->out_frame_info[0].padded_width);
-
-	/* Set the input size from sensor, which includes left/top crop size. */
-	in_width_bqs	    = _ISP_BQS(binary->in_frame_info.res.width);
-	in_height_bqs	    = _ISP_BQS(binary->in_frame_info.res.height);
-
-	/*
-	 * Frame size internally used in ISP, including sensor data and padding.
-	 * This is the frame size, to which the shading correction is applied.
-	 */
-	internal_width_bqs  = _ISP_BQS(binary->internal_frame_info.res.width);
-	internal_height_bqs = _ISP_BQS(binary->internal_frame_info.res.height);
-
-	/* Shading table. */
-	num_hor_grids = binary->sctbl_width_per_color;
-	num_ver_grids = binary->sctbl_height;
-	bqs_per_grid_cell = (1 << binary->deci_factor_log2);
-	tbl_width_bqs  = (num_hor_grids - 1) * bqs_per_grid_cell;
-	tbl_height_bqs = (num_ver_grids - 1) * bqs_per_grid_cell;
-
-	IA_CSS_LOG("tbl_width_bqs=%d, tbl_height_bqs=%d", tbl_width_bqs, tbl_height_bqs);
-
-	/*
-	 * Real sensor data area on the internal frame at shading correction.
-	 * Filters and scaling are applied to the internal frame before
-	 * shading correction, depending on the binary.
-	 */
-	sensor_org_x_bqs_on_internal = scr.sensor_data_origin_x_bqs_on_internal;
-	sensor_org_y_bqs_on_internal = scr.sensor_data_origin_y_bqs_on_internal;
-	{
-		unsigned int bs_frac = 8;	/* scaling factor 1.0 in fixed point (8 == FRAC_ACC macro in ISP) */
-		unsigned int bs_out, bs_in;	/* scaling ratio in fixed point */
-
-		bs_out = scr.bayer_scale_hor_ratio_out * bs_frac;
-		bs_in = scr.bayer_scale_hor_ratio_in * bs_frac;
-		sensor_width_bqs  = (in_width_bqs * bs_out + bs_in / 2) / bs_in; /* "+ bs_in/2": rounding */
-
-		bs_out = scr.bayer_scale_ver_ratio_out * bs_frac;
-		bs_in = scr.bayer_scale_ver_ratio_in * bs_frac;
-		sensor_height_bqs = (in_height_bqs * bs_out + bs_in / 2) / bs_in; /* "+ bs_in/2": rounding */
-	}
-
-	/* Center of the sensor data on the internal frame at shading correction. */
-	sensor_center_x_bqs_on_internal = sensor_org_x_bqs_on_internal + sensor_width_bqs / 2;
-	sensor_center_y_bqs_on_internal = sensor_org_y_bqs_on_internal + sensor_height_bqs / 2;
-
-	/* Size of left/right/upper/lower sides of the sensor center on the internal frame. */
-	left  = sensor_center_x_bqs_on_internal;
-	right = internal_width_bqs - sensor_center_x_bqs_on_internal;
-	upper = sensor_center_y_bqs_on_internal;
-	lower = internal_height_bqs - sensor_center_y_bqs_on_internal;
-
-	/* Align the size of left/right/upper/lower sides to a multiple of the grid cell size. */
-	adjust_left  = CEIL_MUL(left,  bqs_per_grid_cell);
-	adjust_right = CEIL_MUL(right, bqs_per_grid_cell);
-	adjust_upper = CEIL_MUL(upper, bqs_per_grid_cell);
-	adjust_lower = CEIL_MUL(lower, bqs_per_grid_cell);
-
-	/* Shading table should cover the adjusted frame size. */
-	adjust_width_bqs  = adjust_left + adjust_right;
-	adjust_height_bqs = adjust_upper + adjust_lower;
-
-	IA_CSS_LOG("adjust_width_bqs=%d, adjust_height_bqs=%d", adjust_width_bqs, adjust_height_bqs);
-
-	if (adjust_width_bqs > tbl_width_bqs || adjust_height_bqs > tbl_height_bqs) {
-		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-		return -EINVAL;
-	}
-
-	/* Origin of the internal frame on the shading table. */
-	internal_org_x_bqs_on_tbl = adjust_left - left;
-	internal_org_y_bqs_on_tbl = adjust_upper - upper;
-
-	/* Origin of the real sensor data area on the shading table. */
-	sensor_org_x_bqs_on_tbl = internal_org_x_bqs_on_tbl + sensor_org_x_bqs_on_internal;
-	sensor_org_y_bqs_on_tbl = internal_org_y_bqs_on_tbl + sensor_org_y_bqs_on_internal;
-
-	/* The shading information necessary as API is stored in the shading_info. */
-	shading_info->info.type_1.num_hor_grids	    = num_hor_grids;
-	shading_info->info.type_1.num_ver_grids	    = num_ver_grids;
-	shading_info->info.type_1.bqs_per_grid_cell = bqs_per_grid_cell;
-
-	shading_info->info.type_1.bayer_scale_hor_ratio_in  = scr.bayer_scale_hor_ratio_in;
-	shading_info->info.type_1.bayer_scale_hor_ratio_out = scr.bayer_scale_hor_ratio_out;
-	shading_info->info.type_1.bayer_scale_ver_ratio_in  = scr.bayer_scale_ver_ratio_in;
-	shading_info->info.type_1.bayer_scale_ver_ratio_out = scr.bayer_scale_ver_ratio_out;
-
-	shading_info->info.type_1.isp_input_sensor_data_res_bqs.width  = in_width_bqs;
-	shading_info->info.type_1.isp_input_sensor_data_res_bqs.height = in_height_bqs;
-
-	shading_info->info.type_1.sensor_data_res_bqs.width  = sensor_width_bqs;
-	shading_info->info.type_1.sensor_data_res_bqs.height = sensor_height_bqs;
-
-	shading_info->info.type_1.sensor_data_origin_bqs_on_sctbl.x = (int32_t)sensor_org_x_bqs_on_tbl;
-	shading_info->info.type_1.sensor_data_origin_bqs_on_sctbl.y = (int32_t)sensor_org_y_bqs_on_tbl;
-
-	/* The shading information related to ISP (but, not necessary as API) is stored in the pipe_config. */
-	pipe_config->internal_frame_origin_bqs_on_sctbl.x = (int32_t)internal_org_x_bqs_on_tbl;
-	pipe_config->internal_frame_origin_bqs_on_sctbl.y = (int32_t)internal_org_y_bqs_on_tbl;
-
-	IA_CSS_LOG("shading_info: grids=%dx%d, cell=%d, scale=%d,%d,%d,%d, input=%dx%d, data=%dx%d, origin=(%d,%d)",
-		   shading_info->info.type_1.num_hor_grids,
-		   shading_info->info.type_1.num_ver_grids,
-		   shading_info->info.type_1.bqs_per_grid_cell,
-		   shading_info->info.type_1.bayer_scale_hor_ratio_in,
-		   shading_info->info.type_1.bayer_scale_hor_ratio_out,
-		   shading_info->info.type_1.bayer_scale_ver_ratio_in,
-		   shading_info->info.type_1.bayer_scale_ver_ratio_out,
-		   shading_info->info.type_1.isp_input_sensor_data_res_bqs.width,
-		   shading_info->info.type_1.isp_input_sensor_data_res_bqs.height,
-		   shading_info->info.type_1.sensor_data_res_bqs.width,
-		   shading_info->info.type_1.sensor_data_res_bqs.height,
-		   shading_info->info.type_1.sensor_data_origin_bqs_on_sctbl.x,
-		   shading_info->info.type_1.sensor_data_origin_bqs_on_sctbl.y);
-
-	IA_CSS_LOG("pipe_config: origin=(%d,%d)",
-		   pipe_config->internal_frame_origin_bqs_on_sctbl.x,
-		   pipe_config->internal_frame_origin_bqs_on_sctbl.y);
-
-	IA_CSS_LEAVE_ERR_PRIVATE(err);
-	return err;
-}
-
 
 int
 ia_css_binary_get_shading_info(const struct ia_css_binary *binary,			/* [in] */
@@ -706,25 +324,14 @@ ia_css_binary_get_shading_info(const struct ia_css_binary *binary,			/* [in] */
 	IA_CSS_ENTER_PRIVATE("binary=%p, type=%d, required_bds_factor=%d, stream_config=%p",
 			     binary, type, required_bds_factor, stream_config);
 
-	if (type != IA_CSS_SHADING_CORRECTION_TYPE_1) {
+	if (type == IA_CSS_SHADING_CORRECTION_TYPE_1)
+		err = binary_get_shading_info_type_1(binary,
+						     required_bds_factor,
+						     stream_config,
+						     shading_info);
+	else
 		err = -ENOTSUPP;
 
-		IA_CSS_LEAVE_ERR_PRIVATE(err);
-		return err;
-	}
-
-	if (!IS_ISP2401)
-		err = isp2400_binary_get_shading_info_type_1(binary,
-							     required_bds_factor,
-							     stream_config,
-							     shading_info);
-	else
-		err = isp2401_binary_get_shading_info_type_1(binary,
-							     required_bds_factor,
-							     stream_config,
-							     shading_info,
-							     pipe_config);
-
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
 }
-- 
2.33.1

