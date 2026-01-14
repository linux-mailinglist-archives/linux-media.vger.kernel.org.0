Return-Path: <linux-media+bounces-50725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DED21250
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89E1C300FEE3
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 20:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E99330FC36;
	Wed, 14 Jan 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoaLmpRu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111E30F55A
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768421743; cv=none; b=ZBua64Ct3k2tOYSbUS+CmHTA8kkn9FMup5w4UUltk8Fq3KHTm4c3X+2BvPjVFldoeyuIDiI44SKESUqLdL88W3bE/LmPfAv3sAu/FjiZBzGBmGu0/3PGwMjT/+BwuBcIV1NDHVXMtIzzjUOyJxFWSDvGpWDr/DqOX8LuEbk+SJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768421743; c=relaxed/simple;
	bh=eThHSm/w77QOISPY+CbgiC/g73jTbhA0IvA02omyC34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n8rZTL5GTJDUI0JYtxvyJsNIfpVCaB559dIAU+Smfo8Ag1GOBbJp0Ax5Ercw/m7Knv3P+waZYYl3UEm4lUDV1sLzZwBav6beoM+l1IHLeSEJ56nO1J/zsKableXoN4uI7zFnpkWuT7khbHAzVCmg/2HImVVZD7sLJ0BfhWaJPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoaLmpRu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so2317405e9.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 12:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768421739; x=1769026539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swtyOsvKzLXvXbQRbDrbFIVzRP2oDiaPjTmxvRvYtb8=;
        b=AoaLmpRuoPxgN1+sbjoV9Egj2fNYFelHQyAjkBJqdxvCyXgZZKfIBDU7t6CLN2jSCi
         L56z6GcQLcAVevvsRxigXYfQYf2K27DRQ/tH73XpoVtUg0zYwjdeEmdoDbDSfXQRTcKp
         0pfeEidGGaFr5YRY/h84n3Zt2ipRyPjBgppUth35DNKTlukiUSlS11VHTs5SQGzGi3MG
         3gPca0pH+jRG6qtNC4mfDkpOlRVOSknVAZyfnKV3ABRt900IWOtDgbVLnpzFf8dcfw0R
         JzwH9R+QVqpg92QD01pBq4Jc0mgHGXZ23gzkflm54BeipRlki6JgQVzzCuiWD9Nwhvzi
         EVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768421739; x=1769026539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swtyOsvKzLXvXbQRbDrbFIVzRP2oDiaPjTmxvRvYtb8=;
        b=pjfri4hlDRKvqQQgwt5S4v7JgtMDNUtcVfl91X9swMtAe9AHOFnl+YjNUjUSBfz1ZS
         VxJtXX7Okhg1dZzXZYnw0vCLaWfAUNTF3+ZWqIk5FBcm2v3rOyEWGi+gnEvoluLbOPdX
         u3SW+0L4vJw4Q7sft/Ejl3yKZ+lt4nla0zoav9QRh4pN5SQJn4tt3kUJyy1x5MRiBtbt
         ijbuSO7XNp7NimkBgOMXj1OlDOw+raMy1VXih9l7a6nRPJKkNYYpAklNRIdPED8NhNzw
         +N2yv5lO4+mx0LBCKovMr9PV0eJ1FuLdKKiJ6c8d1Qa1LSLzz4G/C6Bwjr2UDrKGaD0l
         AnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1kviPEvu+17qUBVyNLsuXxbA+LO6r0jIwfxWSl/+LQz6OIooM1E53MUEzrCNLgEjK1Q3/tbG+3Pltqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzxesuWoXKkAix03g169LCAiiPTpXLq7jQPbkXwiW0t5DknD34
	XKP8MbOlZXbrQ6FMuXUvEUUneH+3O498Miye2IVsQC+TKpW2qev/ZwVz
X-Gm-Gg: AY/fxX6Jq14sRbrIXirWwcgRhPL5Wo1M735IdotKXEBOtU/67jJuBzhCanuXP5JncKj
	UTs2odZT5+DNj0sq0Dk85imjAbWV8muhKz6IVnLODCLXR/q1G3gZYkP4VgfRsrzojQLpwUqZHHO
	Asx2QVF90CxF1REEx1yAqN3dyJ4F9tWnJyMl3vB4b+FseAlnGg3Rsa7yc4JfjaiBeuS4JqWpT7r
	9ks3furppHMRrcsGo1LNSK/1s2uUbkFmq3p75o/NVmnJuhlnADuQ+F4NY/Wwd6q2aOhs9EUZxDG
	bWrRTy8pkpInaShSrnrA8DewjKFFlByb+W1QNUf5Q1gf3uGD9CUxcobdPbrqK8ovPm13ORJp7lY
	UmWoULjrnNgqbverNMPDVwiGzWtda31RHynjVUaf4MvJu5xudHDLHICo6uyFbi653PndZYgFQEa
	UmDte3ZbKy8ghQ
X-Received: by 2002:a05:600c:548a:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47ee32e09b5mr44873095e9.4.1768421738914;
        Wed, 14 Jan 2026 12:15:38 -0800 (PST)
Received: from hamdan-pc.. ([39.34.128.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b1390sm1167509f8f.21.2026.01.14.12.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:15:38 -0800 (PST)
From: Hamdan Khan <hamdankhan212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hamdan Khan <hamdankhan212@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Fix typos and comment alignment issues in include/linux/* header files
Date: Thu, 15 Jan 2026 01:14:53 +0500
Message-ID: <20260114201453.17329-1-hamdankhan212@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revised version: minor comment alignment, typos, and checkpatch.pl
warnings/checks fixes in atomisp/include/linux/*.h files.

patch v1: https://lore.kernel.org/linux-staging/20251129061228.6286-1-hamdankhan212@gmail.com/

Signed-off-by: Hamdan Khan <hamdankhan212@gmail.com>
---
Changes in v2:
- fixed coding style issues as pointed out by Andy Shevchenko
- fixed english text in some of the comments
- covered all header files of this sub directory as a starting point
  (can look into further files if this goes well)
---
 .../media/atomisp/include/linux/atomisp.h     | 164 +++++++++---------
 .../include/linux/atomisp_gmin_platform.h     |   7 +-
 .../atomisp/include/linux/atomisp_platform.h  |  42 ++---
 3 files changed, 111 insertions(+), 102 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3c8fa3f5808d..75f97477119c 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -22,7 +22,7 @@
 #define ATOMISP_HW_STEPPING_A0		0x00
 #define ATOMISP_HW_STEPPING_B0		0x10
 
-/*ISP binary running mode*/
+/* ISP binary running mode */
 #define CI_MODE_PREVIEW		0x8000
 #define CI_MODE_VIDEO		0x4000
 #define CI_MODE_STILL_CAPTURE	0x2000
@@ -78,7 +78,8 @@ struct atomisp_tnr_config {
 	unsigned int threshold_uv;/* [intensity] Motion sensitivity for U/V */
 };
 
-/* Histogram. This contains num_elements values of type unsigned int.
+/*
+ * Contains num_elements values of type unsigned int.
  * The data pointer is a DDR pointer (virtual address).
  */
 struct atomisp_histogram {
@@ -146,8 +147,7 @@ struct atomisp_3a_config {
 	unsigned int ae_y_coef_r;	/* [gain] Weight of R for Y */
 	unsigned int ae_y_coef_g;	/* [gain] Weight of G for Y */
 	unsigned int ae_y_coef_b;	/* [gain] Weight of B for Y */
-	unsigned int awb_lg_high_raw;	/* [intensity]
-					   AWB level gate high for raw */
+	unsigned int awb_lg_high_raw;	/* [intensity] AWB level gate high for raw */
 	unsigned int awb_lg_low;	/* [intensity] AWB level gate low */
 	unsigned int awb_lg_high;	/* [intensity] AWB level gate high */
 	int af_fir1_coef[7];	/* [factor] AF FIR coefficients of fir1 */
@@ -188,14 +188,15 @@ struct atomisp_dis_vector {
 	int y;
 };
 
-/* DVS 2.0 Coefficient types. This structure contains 4 pointers to
- *  arrays that contain the coefficients for each type.
+/*
+ * DVS 2.0 Coefficient types. This structure contains 4 pointers to
+ * arrays that contain the coefficients for each type.
  */
 struct atomisp_dvs2_coef_types {
-	short __user *odd_real; /** real part of the odd coefficients*/
-	short __user *odd_imag; /** imaginary part of the odd coefficients*/
-	short __user *even_real;/** real part of the even coefficients*/
-	short __user *even_imag;/** imaginary part of the even coefficients*/
+	short __user *odd_real; /* Real part of the odd coefficients*/
+	short __user *odd_imag; /* Imaginary part of the odd coefficients*/
+	short __user *even_real;/* Real part of the even coefficients*/
+	short __user *even_imag;/* Imaginary part of the even coefficients*/
 };
 
 /*
@@ -203,10 +204,10 @@ struct atomisp_dvs2_coef_types {
  * arrays that contain the statistics for each type.
  */
 struct atomisp_dvs2_stat_types {
-	int __user *odd_real; /** real part of the odd statistics*/
-	int __user *odd_imag; /** imaginary part of the odd statistics*/
-	int __user *even_real;/** real part of the even statistics*/
-	int __user *even_imag;/** imaginary part of the even statistics*/
+	int __user *odd_real; /* Real part of the odd statistics*/
+	int __user *odd_imag; /* Imaginary part of the odd statistics*/
+	int __user *even_real;/* Real part of the even statistics*/
+	int __user *even_imag;/* Imaginary part of the even statistics*/
 };
 
 struct atomisp_dis_coefficients {
@@ -234,12 +235,12 @@ struct atomisp_3a_rgby_output {
 };
 
 /*
- * Because we have 2 pipes at max to output metadata, therefore driver will use
- * ATOMISP_MAIN_METADATA to specify the metadata from the pipe which keeps
- * streaming always and use ATOMISP_SEC_METADATA to specify the metadata from
- * the pipe which is streaming by request like capture pipe of ZSL or SDV mode
- * as secondary metadata. And for the use case which has only one pipe
- * streaming like online capture, ATOMISP_MAIN_METADATA will be used.
+ * As the driver can output metadata on two pipes at max,
+ * ATOMISP_MAIN_METADATA is used for the pipe that streams continuously.
+ * ATOMISP_SEC_METADATA is used for the pipe that streams on demand, e.g.,
+ * the capture pipe in ZSL or SDV modes.
+ * In use cases with a single streaming pipe (like online capture),
+ * only ATOMISP_MAIN_METADATA is used.
  */
 enum atomisp_metadata_type {
 	ATOMISP_MAIN_METADATA = 0,
@@ -257,7 +258,7 @@ struct atomisp_3a_statistics {
 	struct atomisp_3a_output __user *data;
 	struct atomisp_3a_rgby_output __user *rgby_data;
 	u32 exp_id; /* exposure ID */
-	u32 isp_config_id; /* isp config ID */
+	u32 isp_config_id; /* ISP config ID */
 };
 
 /* White Balance (Gain Adjust) */
@@ -272,8 +273,8 @@ struct atomisp_wb_config {
 /* Color Space Conversion settings */
 struct atomisp_cc_config {
 	unsigned int fraction_bits;
-	int matrix[3 * 3];	/* RGB2YUV Color matrix, signed
-				   <13-fraction_bits>.<fraction_bits> */
+	/* RGB2YUV Color matrix, signed <13-fraction_bits>.<fraction_bits> */
+	int matrix[3 * 3];
 };
 
 /* De pixel noise configuration */
@@ -291,13 +292,15 @@ struct atomisp_ce_config {
 
 /* Defect pixel correction configuration */
 struct atomisp_dp_config {
-	/* [intensity] The threshold of defect Pixel Correction, representing
+	/*
+	 * [intensity] The threshold of defect Pixel Correction, representing
 	 * the permissible difference of intensity between one pixel and its
 	 * surrounding pixels. Smaller values result in more frequent pixel
 	 * corrections. u0_16
 	 */
 	unsigned int threshold;
-	/* [gain] The sensitivity of mis-correction. ISP will miss a lot of
+	/*
+	 * [gain] The sensitivity of mis-correction. ISP will miss a lot of
 	 * defects if the value is set too large. u8_8
 	 */
 	unsigned int gain;
@@ -312,7 +315,7 @@ struct atomisp_xnr_config {
 	__u16 threshold;
 };
 
-/* metadata config */
+/* Metadata config */
 struct atomisp_metadata_config {
 	u32 metadata_height;
 	u32 metadata_stride;
@@ -322,31 +325,30 @@ struct atomisp_metadata_config {
  * Generic resolution structure.
  */
 struct atomisp_resolution {
-	u32 width;  /** Width */
-	u32 height; /** Height */
+	u32 width;  /* Width */
+	u32 height; /* Height */
 };
 
 /*
- * This specifies the coordinates (x,y)
+ * Specifies the zoom point coordinates (x,y)
  */
 struct atomisp_zoom_point {
-	s32 x; /** x coordinate */
-	s32 y; /** y coordinate */
+	s32 x; /* x coordinate */
+	s32 y; /* y coordinate */
 };
 
 /*
- * This specifies the region
+ * Specifies the zoom region
  */
 struct atomisp_zoom_region {
-	struct atomisp_zoom_point
-		origin; /* Starting point coordinates for the region */
+	struct atomisp_zoom_point origin; /* Starting point coordinates for the region */
 	struct atomisp_resolution resolution; /* Region resolution */
 };
 
 struct atomisp_dz_config {
-	u32 dx; /** Horizontal zoom factor */
-	u32 dy; /** Vertical zoom factor */
-	struct atomisp_zoom_region zoom_region; /** region for zoom */
+	u32 dx; /* Horizontal zoom factor */
+	u32 dy; /* Vertical zoom factor */
+	struct atomisp_zoom_region zoom_region; /* Region for zoom */
 };
 
 struct atomisp_parm {
@@ -378,7 +380,7 @@ struct atomisp_dvs2_bq_resolutions {
 	struct dvs2_bq_resolution output_bq;
 	/* GDC effective envelope size [BQ] */
 	struct dvs2_bq_resolution envelope_bq;
-	/* isp pipe filter size [BQ] */
+	/* ISP pipe filter size [BQ] */
 	struct dvs2_bq_resolution ispfilter_bq;
 	/* GDC shit size [BQ] */
 	struct dvs2_bq_resolution gdc_shift_bq;
@@ -411,8 +413,8 @@ struct atomisp_parameters {
 	struct atomisp_cnr_config  *cnr_config; /* Chroma Noise Reduction */
 	struct atomisp_macc_config *macc_config;  /* MACC */
 	struct atomisp_ctc_config  *ctc_config; /* Chroma Tone Control */
-	struct atomisp_aa_config   *aa_config;  /* Anti-Aliasing */
-	struct atomisp_aa_config   *baa_config;  /* Anti-Aliasing */
+	struct atomisp_aa_config   *aa_config;	/* Anti-Aliasing */
+	struct atomisp_aa_config   *baa_config;	/* Anti-Aliasing */
 	struct atomisp_ce_config   *ce_config;
 	struct atomisp_dvs_6axis_config *dvs_6axis_config;
 	struct atomisp_ob_config   *ob_config;  /* Objective Black config */
@@ -425,10 +427,8 @@ struct atomisp_parameters {
 	struct atomisp_3a_config   *a3a_config; /* 3A Statistics config */
 	struct atomisp_xnr_config  *xnr_config; /* eXtra Noise Reduction */
 	struct atomisp_dz_config   *dz_config;  /* Digital Zoom */
-	struct atomisp_cc_config *yuv2rgb_cc_config; /* Color
-							Correction config */
-	struct atomisp_cc_config *rgb2yuv_cc_config; /* Color
-							Correction config */
+	struct atomisp_cc_config *yuv2rgb_cc_config; /* Color Correction config */
+	struct atomisp_cc_config *rgb2yuv_cc_config; /* Color Correction config */
 	struct atomisp_macc_table  *macc_table;
 	struct atomisp_gamma_table *gamma_table;
 	struct atomisp_ctc_table   *ctc_table;
@@ -490,9 +490,9 @@ struct atomisp_gamma_table {
 	unsigned short data[ATOMISP_GAMMA_TABLE_SIZE];
 };
 
-/* Morphing table for advanced ISP.
- * Each line of width elements takes up COORD_TABLE_EXT_WIDTH elements
- * in memory.
+/*
+ * Morphing table for advanced ISP.
+ * Each line of width elements takes up COORD_TABLE_EXT_WIDTH elements in memory.
  */
 #define ATOMISP_MORPH_TABLE_NUM_PLANES  6
 struct atomisp_morph_table {
@@ -519,7 +519,7 @@ struct atomisp_shading_table {
 	__u16 *data[ATOMISP_NUM_SC_COLORS];
 };
 
-/* parameter for MACC */
+/* Parameter for MACC */
 #define ATOMISP_NUM_MACC_AXES           16
 struct atomisp_macc_table {
 	short data[4 * ATOMISP_NUM_MACC_AXES];
@@ -538,9 +538,10 @@ struct atomisp_ctc_table {
 
 /* Parameter for overlay image loading */
 struct atomisp_overlay {
-	/* the frame containing the overlay data The overlay frame width should
-	 * be the multiples of 2*ISP_VEC_NELEMS. The overlay frame height
-	 * should be the multiples of 2.
+	/*
+	 * The frame containing the overlay data. The overlay frame width should
+	 * be a multiple of 2 * ISP_VEC_NELEMS. The overlay frame height
+	 * should be a multiple of 2.
 	 */
 	struct v4l2_framebuffer *frame;
 	/* Y value of overlay background */
@@ -549,23 +550,27 @@ struct atomisp_overlay {
 	char bg_u;
 	/* V value of overlay background */
 	char bg_v;
-	/* the blending percent of input data for Y subpixels */
+	/* The blending percentage of input data for Y subpixels */
 	unsigned char blend_input_perc_y;
-	/* the blending percent of input data for U subpixels */
+	/* The blending percentage of input data for U subpixels */
 	unsigned char blend_input_perc_u;
-	/* the blending percent of input data for V subpixels */
+	/* The blending percentage of input data for V subpixels */
 	unsigned char blend_input_perc_v;
-	/* the blending percent of overlay data for Y subpixels */
+	/* The blending percentage of overlay data for Y subpixels */
 	unsigned char blend_overlay_perc_y;
-	/* the blending percent of overlay data for U subpixels */
+	/* The blending percentage of overlay data for U subpixels */
 	unsigned char blend_overlay_perc_u;
-	/* the blending percent of overlay data for V subpixels */
+	/* The blending percentage of overlay data for V subpixels */
 	unsigned char blend_overlay_perc_v;
-	/* the overlay start x pixel position on output frame It should be the
-	   multiples of 2*ISP_VEC_NELEMS. */
+	/*
+	 * The overlay start x pixel position on output frame. It should be a
+	 * multiple of 2 * ISP_VEC_NELEMS.
+	 */
 	unsigned int overlay_start_x;
-	/* the overlay start y pixel position on output frame It should be the
-	   multiples of 2. */
+	/*
+	 * The overlay start y pixel position on output frame. It should be a
+	 * multiple of 2.
+	 */
 	unsigned int overlay_start_y;
 };
 
@@ -659,7 +664,7 @@ enum atomisp_burst_capture_options {
 #define EXT_ISP_SHOT_MODE_ANIMATED_PHOTO	10
 #define EXT_ISP_SHOT_MODE_SPORTS	11
 
-/*Private IOCTLs for ISP */
+/* Private IOCTLs for ISP */
 #define ATOMISP_IOC_G_XNR \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 0, int)
 #define ATOMISP_IOC_S_XNR \
@@ -684,7 +689,8 @@ enum atomisp_burst_capture_options {
 	_IOR('v', BASE_VIDIOC_PRIVATE + 5, struct atomisp_ee_config)
 #define ATOMISP_IOC_S_EE \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 5, struct atomisp_ee_config)
-/* Digital Image Stabilization:
+/*
+ * Digital Image Stabilization:
  * 1. get dis statistics: reads DIS statistics from ISP (every frame)
  * 2. set dis coefficients: set DIS filter coefficients (one time)
  * 3. set dis motion vector: set motion vector (result of DIS, every frame)
@@ -716,54 +722,54 @@ enum atomisp_burst_capture_options {
 #define ATOMISP_IOC_S_ISP_GDC_TAB \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table)
 
-/* macc parameter control*/
+/* MACC parameter control*/
 #define ATOMISP_IOC_G_ISP_MACC \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 12, struct atomisp_macc_config)
 #define ATOMISP_IOC_S_ISP_MACC \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 12, struct atomisp_macc_config)
 
-/* Defect pixel detection & Correction */
+/* Defect pixel detection & correction */
 #define ATOMISP_IOC_G_ISP_BAD_PIXEL_DETECTION \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 13, struct atomisp_dp_config)
 #define ATOMISP_IOC_S_ISP_BAD_PIXEL_DETECTION \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 13, struct atomisp_dp_config)
 
-/* False Color Correction */
+/* False color correction */
 #define ATOMISP_IOC_G_ISP_FALSE_COLOR_CORRECTION \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 14, struct atomisp_de_config)
 #define ATOMISP_IOC_S_ISP_FALSE_COLOR_CORRECTION \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 14, struct atomisp_de_config)
 
-/* ctc parameter control */
+/* CTC parameter control */
 #define ATOMISP_IOC_G_ISP_CTC \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
 #define ATOMISP_IOC_S_ISP_CTC \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
 
-/* white balance Correction */
+/* White balance correction */
 #define ATOMISP_IOC_G_ISP_WHITE_BALANCE \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
 #define ATOMISP_IOC_S_ISP_WHITE_BALANCE \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
 
-/* fpn table loading */
+/* FPN table loading */
 #define ATOMISP_IOC_S_ISP_FPN_TABLE \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 17, struct v4l2_framebuffer)
 
-/* overlay image loading */
+/* Overlay image loading */
 #define ATOMISP_IOC_G_ISP_OVERLAY \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay)
 #define ATOMISP_IOC_S_ISP_OVERLAY \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay)
 
-/* bcd driver bridge */
+/* BCD driver bridge */
 #define ATOMISP_IOC_CAMERA_BRIDGE \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 19, struct atomisp_bc_video_package)
 
 #define ATOMISP_IOC_S_EXPOSURE \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 21, struct atomisp_exposure)
 
-/* white balance Correction */
+/* White balance correction */
 #define ATOMISP_IOC_G_3A_CONFIG \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 23, struct atomisp_3a_config)
 #define ATOMISP_IOC_S_3A_CONFIG \
@@ -773,7 +779,7 @@ enum atomisp_burst_capture_options {
 #define ATOMISP_IOC_S_ISP_SHD_TAB \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 27, struct atomisp_shading_table)
 
-/* Gamma Correction */
+/* Gamma correction */
 #define ATOMISP_IOC_G_ISP_GAMMA_CORRECTION \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 28, struct atomisp_gc_config)
 
@@ -804,7 +810,7 @@ enum atomisp_burst_capture_options {
 #define ATOMISP_IOC_S_ARRAY_RESOLUTION \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 45, struct atomisp_resolution)
 
-/* for depth mode sensor frame sync compensation */
+/* For depth mode sensor frame sync compensation */
 #define ATOMISP_IOC_G_DEPTH_SYNC_COMP \
 	_IOR('v', BASE_VIDIOC_PRIVATE + 46, unsigned int)
 
@@ -822,7 +828,7 @@ enum atomisp_burst_capture_options {
  *	_IOW('v', BASE_VIDIOC_PRIVATE + 56, struct atomisp_sensor_regs)
  */
 
-/*  ISP Private control IDs */
+/* ISP Private control IDs */
 #define V4L2_CID_ATOMISP_BAD_PIXEL_DETECTION \
 	(V4L2_CID_PRIVATE_BASE + 0)
 #define V4L2_CID_ATOMISP_POSTPROCESS_GDC_CAC \
@@ -836,8 +842,10 @@ enum atomisp_burst_capture_options {
 #define V4L2_CID_ATOMISP_LOW_LIGHT \
 	(V4L2_CID_PRIVATE_BASE + 5)
 
-/* Camera class:
- * Exposure, Flash and privacy (indicator) light controls, to be upstreamed */
+/*
+ * Camera class:
+ * Exposure, Flash and privacy (indicator) light controls, to be upstreamed
+ */
 #define V4L2_CID_CAMERA_LASTP1             (V4L2_CID_CAMERA_CLASS_BASE + 1024)
 
 #define V4L2_CID_RUN_MODE			(V4L2_CID_CAMERA_LASTP1 + 20)
@@ -879,7 +887,7 @@ enum atomisp_burst_capture_options {
 #define V4L2_EVENT_ATOMISP_ACC_COMPLETE     (V4L2_EVENT_PRIVATE_START + 4)
 #define V4L2_EVENT_ATOMISP_PAUSE_BUFFER	    (V4L2_EVENT_PRIVATE_START + 5)
 #define V4L2_EVENT_ATOMISP_CSS_RESET	    (V4L2_EVENT_PRIVATE_START + 6)
-/* Nonstandard color effects for V4L2_CID_COLORFX */
+/* Non-standard color effects for V4L2_CID_COLORFX */
 enum {
 	V4L2_COLORFX_SKIN_WHITEN_LOW = 1001,
 	V4L2_COLORFX_SKIN_WHITEN_HIGH = 1002,
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 426c5ee4ec18..74092af1c659 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -15,8 +15,7 @@ int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd);
 int gmin_get_var_int(struct device *dev, bool is_gmin,
 		     const char *var, int def);
 struct camera_sensor_platform_data *
-gmin_camera_platform_data(
-    struct v4l2_subdev *subdev,
-    enum atomisp_input_format csi_format,
-    enum atomisp_bayer_order csi_bayer);
+	gmin_camera_platform_data(struct v4l2_subdev *subdev,
+				  enum atomisp_input_format csi_format,
+				  enum atomisp_bayer_order csi_bayer);
 #endif
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 6146555fe9cf..e8f91c55ba01 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -57,7 +57,8 @@ enum atomisp_input_format {
 	ATOMISP_INPUT_FORMAT_RAW_16,   /* RAW data, 16 bits per pixel */
 	ATOMISP_INPUT_FORMAT_BINARY_8, /* Binary byte stream. */
 
-	/* CSI2-MIPI specific format: Generic short packet data. It is used to
+	/*
+	 * CSI2-MIPI specific format: Generic short packet data. It is used to
 	 * keep the timing information for the opening/closing of shutters,
 	 * triggering of flashes and etc.
 	 */
@@ -70,18 +71,18 @@ enum atomisp_input_format {
 	ATOMISP_INPUT_FORMAT_GENERIC_SHORT7,  /* Generic Short Packet Code 7 */
 	ATOMISP_INPUT_FORMAT_GENERIC_SHORT8,  /* Generic Short Packet Code 8 */
 
-	/* CSI2-MIPI specific format: YUV data.
-	 */
-	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,  /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
-	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+	/* YUV data */
+	/* YUV420 8-bit (Chroma Shifted Pixel Sampling) */
+	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,
+	/* YUV420 10-bit (Chroma Shifted Pixel Sampling) */
+	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT,
 
-	/* CSI2-MIPI specific format: Generic long packet data
-	 */
-	ATOMISP_INPUT_FORMAT_EMBEDDED, /* Embedded 8-bit non Image Data */
+	/* CSI2-MIPI specific format: Generic long packet data */
+	/* Embedded 8-bit non Image Data */
+	ATOMISP_INPUT_FORMAT_EMBEDDED,
 
-	/* CSI2-MIPI specific format: User defined byte-based data. For example,
+	/*
+	 * User defined byte-based data. For example,
 	 * the data transmitter (e.g. the SoC sensor) can keep the JPEG data as
 	 * the User Defined Data Type 4 and the MPEG data as the
 	 * User Defined Data Type 7.
@@ -105,9 +106,9 @@ struct intel_v4l2_subdev_table {
 };
 
 /*
- *  Sensor of external ISP can send multiple streams with different mipi data
+ * Sensor of external ISP can send multiple streams with different MIPI data
  * type in the same virtual channel. This information needs to come from the
- * sensor or external ISP
+ * sensor or external ISP.
  */
 struct atomisp_isys_config_info {
 	u8 input_format;
@@ -118,16 +119,17 @@ struct atomisp_isys_config_info {
 struct atomisp_input_stream_info {
 	enum atomisp_input_stream_id stream;
 	u8 enable;
-	/* Sensor driver fills ch_id with the id
-	   of the virtual channel. */
+	/* Sensor driver fills ch_id with the id of the virtual channel. */
 	u8 ch_id;
-	/* Tells how many streams in this virtual channel. If 0 ignore rest
-	 * and the input format will be from mipi_info */
+	/*
+	 * Tells the number of streams in this virtual channel. If 0, ignore rest
+	 * and the input format will be from mipi_info.
+	 */
 	u8 isys_configs;
 	/*
-	 * if more isys_configs is more than 0, sensor needs to configure the
-	 * input format differently. width and height can be 0. If width and
-	 * height is not zero, then the corresponding data needs to be set
+	 * If isys_configs is more than 0, sensor needs to configure the
+	 * input format differently. Width and height can be 0. If width and
+	 * height are not zero, then the corresponding data needs to be set.
 	 */
 	struct atomisp_isys_config_info isys_info[MAX_STREAMS_PER_CHANNEL];
 };
-- 
2.43.0


