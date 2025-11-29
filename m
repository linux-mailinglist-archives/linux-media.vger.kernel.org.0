Return-Path: <linux-media+bounces-47895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C9C938A4
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 07:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3772D344563
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 06:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68761257459;
	Sat, 29 Nov 2025 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GinDFJPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004C722259A
	for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764396771; cv=none; b=k20UVnipZ02W/k7AMO2HuedCF4AKzt8jxFVuuUyH9VW8itZIFi4la9ep+rFzrwtb7Mz5y7R4Oc/DCGb7YFGEA53c4guLOLql3YlvQmG4V0k6tDCtmxDgdFeQflnf+SrrpPJaB9pfQ7N0ofFvt4iBs9nEncTnjtwRrmjozl2yXTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764396771; c=relaxed/simple;
	bh=pwhk6KUC9aj1bO1CnKCgI1WgBJAeVfM9l/gwJMBdHX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orPpYwSC/b1r4UnG91e9rHPxfy11dg6X+oiVf9Eu8xwnlHsTyPYS6ftFLBnywfbbJzNyUZzwrT+mlsMc6tph1n4fKcNqz9jpLMcCS/dt4izku4KHH4Gm6jHXZ/VDBqb8mgMZPQOylQzxd9GmKnxg51udyRFzHMUcPBbgReVa7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GinDFJPP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3108f41fso1571873f8f.3
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 22:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764396768; x=1765001568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3fiwCuDBn6bCR36wBmkPpqkRzBcsOHTvfCQX1x7iMNw=;
        b=GinDFJPP5xcOU74CLFdmchDuoiUAiaE9CbupwOZz7lOsSjGUQPjxR7QNOJcQA3vCE2
         qPpbVP0rCsVDrZk1NGlcYpfZzVM/B70LkBekIOhpw8HV4vZgSCFVsjg6FTfMYfQw1yAx
         tBuHapBGYnwBRENl71dZC66lV1BnkvxFyX4RTnn70lyVx1hStpfsme9EFRKq5bCS8CAp
         gOJ5kXdGJsXUPbM7hiYRUGPBPpn66wJoDarMbTYwZ9NN0kmhVV1vPud8hwd+woGbGeYd
         fKOitWifFLfBcJ9/tzB4QPHyDB8DohShQR2o/g9OSXoIK2Rwq46R5A6Fe3phGU0ZkDxQ
         UWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764396768; x=1765001568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fiwCuDBn6bCR36wBmkPpqkRzBcsOHTvfCQX1x7iMNw=;
        b=U0cjKfa7UyMSLeKGIiVNVyMcrJrJyPaEaxoVRfYsy38h4S77XR72kzYuZ51pC4Ki+e
         6/ovyFFPQfEhjx0dHjZwLhrgr+0a+KR31bn8OTBI8f0SxxCXV6HIKdnONDLKXZRSDRsj
         otimjiE8rxcOJoMHpjygoE3gS38i2+3FYT7xd6+ckxNumdB41Jj2kTo0GpcHfjtV+NLv
         U+xZRWMeIdvsoy3OE4oSOHzTAaPJFk96YsJ1aDEmAmlVLsDVndNhMCIxPZm5iTXgRHu6
         MnfaD80NElCngcs7L1dIOc/w+tecJaMGcsr8wnyNHa0ZvwXuddTglz5P/KUWsR52mAei
         KA0w==
X-Forwarded-Encrypted: i=1; AJvYcCVXiqoCY5NG9yhNHJS+zpbNhpn4pC7aOvkxCae9dt6xQlDA/cQh6aXR8Hh0/19JCTCiCJDih9um/FFKLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNL4paahAZZ/qQ0+Csu8aNJfv9K1XWdsL1Mf+3CPzlTmbJyg+W
	BzeLNnw1RFJdClWZ9547sqGPG0P4Xe0Ppd1iVKBcdctHQidihmVi0Lgp
X-Gm-Gg: ASbGncuDTe+L5dLsol9l1mlaWcQMz18SUfdhcDLDuz6Hy3p/6YBRlzRA4wF5fA9pmWG
	T+nrGOQFr1QY4IEygKNb6xSae/QJLkAFvAF2jdCIsCRU6L+KtDRShcXjQCrkwJexjQBoc3PE8zn
	6IefyMYpHi2GPisrJRv8TOmISiT6IVFGtedSR7emRLLYADHri30X4sJSWnQeGpT8OIUcM2020lI
	CLuFf9h4PvmMIGXb1oWlJ7rIh/h5XEHWwZLwPDnNHXRK2JBYB5DjmTzFT/kVgynmkAGom5fFH/O
	a5sMUp48mXXCfDAAiwPunowARTPbi6shCddlOEsDYxqNFL4vtlOFF29xEnyYPolX0HIRjZkPb9Q
	iYkHZ/A8aNa3nD1bXAedz13GSSsa+vlQpbOHzNiSZYRwT3JGn/ctgVA+hcSqHs/P73RxzmdsQGT
	3YgXQmpv8HCz54aQ==
X-Google-Smtp-Source: AGHT+IHQ+0VjmmaEZNp55jPFWS27fq/ncIV93c7qAUFgJU59OllCnHsJo3akw3S5TwbkSGCIvSatYg==
X-Received: by 2002:a5d:5f51:0:b0:42b:5448:7b1a with SMTP id ffacd0b85a97d-42cc1d0c768mr32010097f8f.39.1764396768020;
        Fri, 28 Nov 2025 22:12:48 -0800 (PST)
Received: from hamdan-pc.. ([39.34.128.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c304csm13395224f8f.8.2025.11.28.22.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 22:12:47 -0800 (PST)
From: Hamdan Khan <hamdankhan212@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Hamdan Khan <hamdankhan212@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix typos and comments alignment issue in include/linux/* header files
Date: Sat, 29 Nov 2025 11:12:28 +0500
Message-ID: <20251129061228.6286-1-hamdankhan212@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes minor comment and code alignment issues in
atomisp/include/linux/*.h header files. Some of them were warnings
generated by checkpatch.pl (missing * at the start of the line or */
present in the same line)

The changes are code-style related only and don't affect the
functionality.

Signed-off-by: Hamdan Khan <hamdankhan212@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     | 30 +++++++++++--------
 .../include/linux/atomisp_gmin_platform.h     |  7 ++---
 .../atomisp/include/linux/atomisp_platform.h  | 21 +++++++------
 3 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3c8fa3f5808d..bce4e5f1bfc7 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -146,8 +146,7 @@ struct atomisp_3a_config {
 	unsigned int ae_y_coef_r;	/* [gain] Weight of R for Y */
 	unsigned int ae_y_coef_g;	/* [gain] Weight of G for Y */
 	unsigned int ae_y_coef_b;	/* [gain] Weight of B for Y */
-	unsigned int awb_lg_high_raw;	/* [intensity]
-					   AWB level gate high for raw */
+	unsigned int awb_lg_high_raw;	/* [intensity] AWB level gate high for raw */
 	unsigned int awb_lg_low;	/* [intensity] AWB level gate low */
 	unsigned int awb_lg_high;	/* [intensity] AWB level gate high */
 	int af_fir1_coef[7];	/* [factor] AF FIR coefficients of fir1 */
@@ -272,8 +271,10 @@ struct atomisp_wb_config {
 /* Color Space Conversion settings */
 struct atomisp_cc_config {
 	unsigned int fraction_bits;
-	int matrix[3 * 3];	/* RGB2YUV Color matrix, signed
-				   <13-fraction_bits>.<fraction_bits> */
+	/* RGB2YUV Color matrix, signed
+	 * <13-fraction_bits>.<fraction_bits>
+	 */
+	int matrix[3 * 3];
 };
 
 /* De pixel noise configuration */
@@ -425,10 +426,8 @@ struct atomisp_parameters {
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
@@ -538,7 +537,8 @@ struct atomisp_ctc_table {
 
 /* Parameter for overlay image loading */
 struct atomisp_overlay {
-	/* the frame containing the overlay data The overlay frame width should
+	/*
+	 * the frame containing the overlay data The overlay frame width should
 	 * be the multiples of 2*ISP_VEC_NELEMS. The overlay frame height
 	 * should be the multiples of 2.
 	 */
@@ -562,10 +562,12 @@ struct atomisp_overlay {
 	/* the blending percent of overlay data for V subpixels */
 	unsigned char blend_overlay_perc_v;
 	/* the overlay start x pixel position on output frame It should be the
-	   multiples of 2*ISP_VEC_NELEMS. */
+	 * multiples of 2*ISP_VEC_NELEMS.
+	 */
 	unsigned int overlay_start_x;
 	/* the overlay start y pixel position on output frame It should be the
-	   multiples of 2. */
+	 * multiples of 2.
+	 */
 	unsigned int overlay_start_y;
 };
 
@@ -836,8 +838,10 @@ enum atomisp_burst_capture_options {
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
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 426c5ee4ec18..415b265505c7 100644
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
+gmin_camera_platform_data(struct v4l2_subdev *subdev,
+			  enum atomisp_input_format csi_format,
+			  enum atomisp_bayer_order csi_bayer);
 #endif
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 6146555fe9cf..2378a21ee961 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -72,10 +72,12 @@ enum atomisp_input_format {
 
 	/* CSI2-MIPI specific format: YUV data.
 	 */
-	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,  /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
-	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-bit (Chroma Shifted
-						 Pixel Sampling) */
+	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,   /* YUV420 8-bit (Chroma Shifted
+						* Pixel Sampling)
+						*/
+	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT,  /* YUV420 10-bit (Chroma Shifted
+						* Pixel Sampling)
+						*/
 
 	/* CSI2-MIPI specific format: Generic long packet data
 	 */
@@ -105,7 +107,7 @@ struct intel_v4l2_subdev_table {
 };
 
 /*
- *  Sensor of external ISP can send multiple streams with different mipi data
+ * Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
@@ -119,13 +121,14 @@ struct atomisp_input_stream_info {
 	enum atomisp_input_stream_id stream;
 	u8 enable;
 	/* Sensor driver fills ch_id with the id
-	   of the virtual channel. */
+	 * of the virtual channel.
+	 */
 	u8 ch_id;
 	/* Tells how many streams in this virtual channel. If 0 ignore rest
-	 * and the input format will be from mipi_info */
+	 * and the input format will be from mipi_info
+	 */
 	u8 isys_configs;
-	/*
-	 * if more isys_configs is more than 0, sensor needs to configure the
+	/* If isys_configs is more than 0, sensor needs to configure the
 	 * input format differently. width and height can be 0. If width and
 	 * height is not zero, then the corresponding data needs to be set
 	 */
-- 
2.43.0


