Return-Path: <linux-media+bounces-54904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OwRIGznxrWl79wEAu9opvQ
	(envelope-from <linux-media+bounces-54904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 22:59:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4962325E4
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 22:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E123015CA7
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 21:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79273563C6;
	Sun,  8 Mar 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL+lpAp3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB9256C84
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773007150; cv=none; b=GGb6RcYI0sqEbqNJ7n1PUMj9yDVNYE3+PszxEPVcQLTBQfDd8H35l4oAj8Z1NzXcMeDpVBI7uEwkL5qxPPt/GMjnTIbobUYNc0owBohH7tRmSmu3H20C3sw3zDV4pC1/AbQ33xrOj6FmiNEuHmw5nsVJl+FK+eeuCYmskq3qCyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773007150; c=relaxed/simple;
	bh=RkI0Ck+Z//36o4GYMvtpCE/Nbzne3VOHMoCn1ZlFcrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEc1f7Cz0C1VsI64GeY9QJY9oQpKa4hmm096vo0i/Qf7W7QRNkVfifTWb3nBC3oGgTrT70a9BIKSw9AEkUsYo/cVsmKOZrvu0RMKFmdxXjwUdz1N+hxFhbpFibJVm8uqBGb1LWk19MAtRb6eitx4mNpO20pQGwauR84/kAHn/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL+lpAp3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c5b40f60so4071760f8f.0
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2026 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773007147; x=1773611947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubLM4F7XEC/QmTucukVIfkm75FRzWcZH4FP0WB/k0JE=;
        b=JL+lpAp34/4xEP9YEpoGS4vFl5ue/35Qvd81SDd0R0lzVYhLCHBo9ej9ME17JJrNVY
         D818CnTxSWYQccaVpUG1juCsFerD1LTsp7verPpHxOci63exaP/8bVjku54nGex4pg8L
         dsJmW21RM5sTObTNM3ToIrDC8bYp+HkJupr1dtN5dr3tY9wohhAd2eT1tAm1ma96n6PA
         oqtlqW/D4IveocQ0cAcE65OC4EnWbo2DxvkVw378+nxO0NG0bVTvZhLwOu+7xYeG8BYF
         x3H+/famcTtIDtAgCnsdNA3OLxqH0DEqVDopqzrxFONGw+B5JiHyEZmWjjMBUSLEJvSH
         IRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773007147; x=1773611947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubLM4F7XEC/QmTucukVIfkm75FRzWcZH4FP0WB/k0JE=;
        b=CbeLp9d9I+/nQTMyHwtrLCcA0+h3+ZQeTzTFGmV4PjGj4n/kV4O5Vnuu8170DaQn9f
         PZIxKf2dbobdVAOFaZ8L70xqJ4TwvS4/rv83cvxA/DYAoulZcoNfYqEznK2HPlYWuuEQ
         FbPYsOXjO5CR2+IWPgUWAmPWvtQX43dfNIFJDakH4g3Lnqs/shVdrqavfVDAwFStHflu
         m08AtS3BQpcfvocsqGIzmbLlqNUBYauC4OnKWSWx4ojhdowawjYDtaMLtIwtggry1unf
         DSx+lJD8PCUmGrEqCdUhmPtONm8cYyfDHrZkU37vEsHq9Guq4M6bwC23/36XSsrlyedu
         Z8Og==
X-Forwarded-Encrypted: i=1; AJvYcCWPn2JK9nqIwaCtd4Yb+THl+9VKhV5dAZqx/rfEHjYsLyCI+P6acaNvUwR5HzJ4ueSYFfaL+uaoRnEaJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGzzXDwrBMqQ9p9w2fJwyO+btq2+hvCZ8GzYTADEJV4uf6iCEA
	eqZesnnCS7Qa6xeNcgnxcRkoY7BBiJcVnGVTcRA5DSpuo2609xvYBJAU
X-Gm-Gg: ATEYQzyBZqljSZyCQkEyjUqS5ILHe3EdVYDpA63WaT+oBHITgKKwN9TYku+KI9AUv2x
	8ab1b1H5ITiFUrRsdB4vbms83CukhbRDcPTBbwhcZMK346hy18jEbDVAylt7a/Kk1LhchmK70QB
	mRxFiM6UB9filFmIdWVliTqnHN7JbVsYe8/Z6Gz4IxEDgh6Xwk2ElDzQbRy2wtKsm0EBNFDDzwn
	us8DxtIlVxTTsIpHBHAqxDwWCEGOoB+KDVfAPwC+o5XAaIQrHwatj9DUbeCtk1OXN+OiAledtz6
	Xks8zRU+k6brVEofC8Shglm/tGYt/m6G4HOq1wo7hn8TohMp9XYaqwDuVXATuzcmS70z6D2EbGK
	JCcxFxuLoupfuVYoaXxzGExmssbquUE1JosHIRK3WYqJBMFxOgz43X5kgFl3HqhkQBrA7LVLkmq
	UnGjg9mJ5pqtXIytNnGTVWVr6Q/uNvRBPc00tTzKSnpiJ4AnnTjPNSy06q7mfqmV8MZ+eo
X-Received: by 2002:a05:600c:3acf:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48526978978mr154072235e9.33.1773007146690;
        Sun, 08 Mar 2026 14:59:06 -0700 (PDT)
Received: from laurentiu-Inspiron-15-3525.. ([188.27.131.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852767d8e4sm198995015e9.2.2026.03.08.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 14:59:06 -0700 (PDT)
From: Laur <laurentiutopai2004@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laur <laurentiutopai2004@gmail.com>
Subject: [PATCH] staging: media: atomisp: comprehensive coding style cleanup
Date: Sun,  8 Mar 2026 23:58:40 +0200
Message-ID: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA4962325E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-54904-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiutopai2004@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Clean up atomisp_cmd.c to comply with Linux Kernel coding standards.
This patch addresses multiple checkpatch.pl issues:
-Fixed block comment formatting(trailing */ on separate lines).
-Replaced hardcoded function names in logs with %s and __func__.
-Fixed comma spacing and converted leading spaces to tabs.
-Removed redundant else branches and void return statements.
-Merged multiple line dereferences to improve readability.

Signed-off-by: Laur <laurentiutopai2004@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 96 ++++++++++---------
 1 file changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575..dc9176918 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -262,8 +262,6 @@ int atomisp_reset(struct atomisp_device *isp)
 	/* Reset ISP by power-cycling it */
 	int ret = 0;
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
@@ -1024,11 +1022,9 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
 		return IA_CSS_FRAME_FORMAT_RGBA888;
 	case V4L2_PIX_FMT_RGB565:
 		return IA_CSS_FRAME_FORMAT_RGB565;
-#if 0
 	case V4L2_PIX_FMT_JPEG:
 	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
 		return IA_CSS_FRAME_FORMAT_BINARY_8;
-#endif
 	case V4L2_PIX_FMT_SBGGR16:
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
@@ -1380,8 +1376,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 *  We must free all buffers because they no longer match
+	 *  the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1393,8 +1391,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_alloc_3a_output_buf(asd)) {
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
-			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			/*
+			 * For SOC sensor happens s3a_output_bytes == 0,
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1415,7 +1415,7 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
+
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
@@ -1589,7 +1589,6 @@ int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 int atomisp_set_array_res(struct atomisp_sub_device *asd,
 			  struct atomisp_resolution  *config)
 {
-	dev_dbg(asd->isp->dev, ">%s start\n", __func__);
 	if (!config) {
 		dev_err(asd->isp->dev, "Set sensor array size is not valid\n");
 		return -EINVAL;
@@ -1687,8 +1686,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -1885,8 +1885,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
  * Function to check the zoom region whether is effective
  */
 static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+	struct atomisp_sub_device *asd,
+	struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1920,8 +1920,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -2032,7 +2032,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
 {
 	if (from_user)
 		return copy_from_user(to, (void __user *)from, n);
-	else
+
 		memcpy(to, from, n);
 	return 0;
 }
@@ -2462,9 +2462,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs from the current
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -2518,9 +2520,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs from the current
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3016,6 +3020,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 	struct ia_css_pipe_config *vp_cfg =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		    pipe_configs[IA_CSS_PIPE_ID_VIDEO];
+	struct ia_css_stream_info *s_info =
+		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info;
 
 	/* Read parameter for 3A binary info */
 	if (flag == 0) {
@@ -3027,13 +3033,12 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
-		config->metadata_config.metadata_height = asd->
-			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
-			metadata_info.resolution.height;
-		config->metadata_config.metadata_stride = asd->
-			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
-			metadata_info.stride;
+		 * information needed to allocate user-space buffers.
+		 */
+		config->metadata_config.metadata_height =
+			 s_info->metadata_info.resolution.height;
+		config->metadata_config.metadata_stride =
+			 s_info->metadata_info.stride;
 
 		/* update dvs grid info */
 		if (dvs_grid_info)
@@ -3277,8 +3282,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 		return bytesperline / 2;
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
-	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	/*
+	 * The following cases could be removed, but we leave them
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3314,9 +3321,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	padded_width = atomisp_bytesperline_to_padded_width(
 			   arg->fmt.bytesperline, sh_format);
 
-	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	/*
+	 * Note: the padded width on an ia_css_frame is in elements, not in
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3889,9 +3898,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 }
 
 static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
@@ -3926,7 +3935,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -3998,13 +4008,12 @@ static int get_frame_info_nop(struct atomisp_sub_device *asd,
  * handled in CSS when the input resolution is changed.
  */
 static int css_input_resolution_changed(struct atomisp_sub_device *asd,
-					struct v4l2_mbus_framefmt *ffmt)
+	struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
 	unsigned int i;
 
-	dev_dbg(asd->isp->dev, "css_input_resolution_changed to %ux%u\n",
-		ffmt->width, ffmt->height);
+	dev_dbg(asd->isp->dev, "%s to %ux%u\n", __func__, ffmt->width, ffmt->height);
 
 	if (IS_ISP2401)
 		atomisp_css_input_set_two_pixels_per_clock(asd, false);
@@ -4385,7 +4394,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			V4L2_SEL_TGT_CROP);
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.43.0


