Return-Path: <linux-media+bounces-54022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SryfB86opGkKoQUAu9opvQ
	(envelope-from <linux-media+bounces-54022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 21:59:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B51D192A
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 21:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 867C63013A94
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 20:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD5F329C5F;
	Sun,  1 Mar 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxx9yIoG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2D2F5461
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398791; cv=none; b=lkXYPFH269cP2DEw/b0FZwzAiXBIHPGLIJs9JE5w8dz1Ry6sG+BAet+E6lTk5lcJTzI+If3tUvVKlmVzAaN5S9w/mgM+u31YxsIlJiXSMvVEgimWP6NO5dpOTnz95de6EwgmvlUsp9jh9iqVrZKvkzO6PD/mpNCfvRTKlyVoaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398791; c=relaxed/simple;
	bh=SlOWRADI3nROQA80eTEVqGMa/6yj1B2cTK7v2OlMqj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZ6yc0kP4kP0qTJAsafWTjv1jxlMGDuSYeA49EHPF1RYmUKwNvMpMP0vzRnSc6CrXZ+7hJLfS9iDg7wcO27Kr5EIygDq9Q/ztRVF1GSxCjx7pcEWweUVuREuvVZ8i+MKg4bgAHkxioKIxiASkvSnPd9o9EwMSfdbJJ/tUoRU2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxx9yIoG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870acaf78eso28327281fa.2
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772398788; x=1773003588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6MHN8vujqeAy5voi2iD86dHKq8qVmHMYvFleDpHmjo=;
        b=Jxx9yIoGP5zRDoAilGMiJcar2qm7Qdw0qxPL+e6T6UltYx/QU413ok0BiOR+kzUPhI
         3V0dcFD7fnRpYYo6sSPLSPa1G/Uj6jycYsneQLKB6wAyIarEm2sOwf7jojwaS/jjim8a
         TtENOnDQ0sjjE9Q5FksszDjQmkQSA4GJIdLuZKKnkwqbmfAs+64pYGAKr8QoFH/nOIB3
         GQNDCidxIiCxwdBTFDCwRRXQmyzOlPTknB5P4Z0durgzc9qJwUcvRJ9PkNtNDTTHn6W4
         CdFZFS/m6kn52P5cVEdZYlXN2mUiUXpxvSWuUklMMmtZtUrm7R4KR5AXFVIN5jlHiQRX
         Q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398788; x=1773003588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6MHN8vujqeAy5voi2iD86dHKq8qVmHMYvFleDpHmjo=;
        b=xFSb59SxzduqhjPdkQDrTQQKp2E1VIynB8bij/bD0kJm6NnmPnIN6Xa7om34y+RW9M
         nNKWjYGjj3+o0vH7YC0vA21RU6/c3h66KySkbUpicQaErl+z8zO7e3e1ULN6KrkKTK8K
         rT72XxLSvJFvqNA2IBu4vIBLzyPBb1j0DhrM9UWIbeKGEUR9iS1m9A8hX3CpXEbXrpFj
         1WPkQGZgOjFEgyznn+Un2Tt3vew651gLiCzlxMvhqTUwTva43iiJoqaNu0kVyPA3XB3a
         gDa3O6A+XrXuO5qlr3AYGUsr6HqC/aHqaeGctVbdrJSoa0+a5Lvo++jaVdB+RCpz1Xwh
         EVNA==
X-Forwarded-Encrypted: i=1; AJvYcCVeQCRt2CBR8GCxgj5FobIzvboijeoqkFJJBQ0QDg2HIKT1xBO5Q8cdtCzZx2ef0pEaS+kUUBTsHOw9Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznQTo0rdWnyP+bv3oBnc5lk/BYA2UqDmT3W2N8DkkWlWkGUh1x
	t/zrOq8tZ26KD3VVh5pct5Xmh2gNKcpO1p/B2z/yRbPk3ZuKX3p8MNIfYN231Q==
X-Gm-Gg: ATEYQzyvNpfRCWBlOOpHOMwQFKcRjTSTM2x3fjS2YoCl9GAKnQgcTDFAS8FUA72O5Wx
	BULUzwQPTDo0bqt5bMjug8C2WQlwuXs+cMyD+2mVqjqrmAHkILKg2PdlUhp1dmKnTaxmeD+l8yL
	7mEQhlXgrTp29cMuIPrKWPM1mlPw1m0ZeLdk40aWzzu+KwsWI1K9w5VUb9bB/XGCw+b9GL235FE
	Y0i0eQAib/2hvpLJW8PrgNqXFWJL6ZJ5kZ08XNxNkY9ixCg5Rp04/NlxFZR/Pu3VU49OV4ck2hd
	fP2CGiQweTZxeqWGvFkqHS75TPnqCrFcHIit4SemCBnbuEbDBst/IbPBRlee1BdE+y8MFip1gW7
	RysZC7qqw9V1UVBRGvZ0133+bPioJKJeuyCxWX49zr3pq1n3I1XXLFYeEBb3wKzMLAb1jCg3yw1
	nbuGzU4oQEW+9Yy3PK03XQoeRMLLd9F42u3HG30+Ttokk4bi38NF+jKFUTfR89vAPd0xkfwl0q6
	JozvlbBNfY8
X-Received: by 2002:a2e:a9ac:0:b0:386:91a1:f206 with SMTP id 38308e7fff4ca-389ff119551mr68062701fa.5.1772398787562;
        Sun, 01 Mar 2026 12:59:47 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca099sm1241737e87.32.2026.03.01.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 12:59:46 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix block comment style in atomisp_cmd.c
Date: Sun,  1 Mar 2026 21:59:10 +0100
Message-ID: <20260301205910.3308-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54022-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 641B51D192A
X-Rspamd-Action: no action

Fix block comments to use the proper kernel coding style by adding
* on subsequent lines and moving trailing */ to a separate line.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5bc1541b1e40 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1381,7 +1381,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 		return;
 
 	/* We must free all buffers because they no longer match
-	   the grid size. */
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1391,10 +1392,11 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	}
 
 	if (atomisp_alloc_3a_output_buf(asd)) {
-		/* Failure for 3A buffers does not influence DIS buffers */
+		/* Failure for 3A buffers does not influence DIS buffers. */
 		if (asd->params.s3a_output_bytes != 0) {
 			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			 * using if condition to exclude false error log.
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1687,8 +1689,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2463,8 +2466,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -2519,8 +2523,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3027,7 +3032,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3278,7 +3284,8 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
 	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3315,8 +3322,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 			   arg->fmt.bytesperline, sh_format);
 
 	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded width.
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3926,7 +3934,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
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


