Return-Path: <linux-media+bounces-52511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC3ANdUYi2ljPgAAu9opvQ
	(envelope-from <linux-media+bounces-52511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:39:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FACD11A520
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54E68304E323
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112D231B124;
	Tue, 10 Feb 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbdLt5kb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194432E764D
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723384; cv=none; b=T/imiL8mAHrrOB8rhcblj07iaxiVxNnB4iOkFAGC738x5kRQgoZYiEYVlQTi5EQt8KunIfaNogFBYNtzlwG+FrlVMavN2UFdUEI+u2B2AkoCQmQhM1Ptb0emmh/4qCMqDdjMr3FIa0EuyC88oq6fr2CnmToznQC2fnpTWQiGM6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723384; c=relaxed/simple;
	bh=6UZF0hPHXXbabgndO/pADRwx6wnGa8jhCrhXvoluDNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FtDVSGOfoc52y/c1t+gqKfbVFud7UdUTY2+9g/ng0xecbGlYN6EcXYHaB7AH06hO9SHNitbZuwh7ylflK1HdkrKYUjeVcOERgTxe/yhzhxTMpESjn1J9cSUIixZV/Ah9TyXvL8Gk3wzG04EuvIEiWJgnAahzwUGfnCTWzXTfaA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbdLt5kb; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-823075fed75so3264898b3a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770723381; x=1771328181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ySLvsFg7TLrIk93eB4lu1hrX+Zw7l/j16aUMMMVV/0=;
        b=nbdLt5kb25GuSeAkfIXsi+vm0nJ4radRtcdFNdC2t4lgO2gHSPR6HgmWYrB4snZUeg
         i4+FI5d456qKH92iNjRpmZgBp2KDgYDuXWDeVIkMwnFlUpZtnwpczzMLGKORFAKfrFVp
         HZYF+KoJY7himN4FzSD1CKIe+TEYQ5aeEElCMMPDAjs9ETyyRGsWgnOIbg1tmS6oINO6
         RJLzH4nAMfOE83Jn6z5KJljE/3ThvWhjU96kKi6JWXisQtuDQVFbZMLmPcxLbFnuOBhp
         yfY3FB0iZuvk2JRKWWVyxiznFEx/fHsMQq4Joia3vqyMNCxYxODH6qifFXxI14hSoACp
         J1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723381; x=1771328181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ySLvsFg7TLrIk93eB4lu1hrX+Zw7l/j16aUMMMVV/0=;
        b=rowYlQuCAgXsj17t3mpdo0fkOckj2e6WqAvOmyo+Lkuh76L+jVER7yFuT7PW7o5n3P
         k645huFXykHmrlx47l3C2yP5L/bFdWW9rYQZ7plKfrtmn0fg+/JWHT1LBLejLHhTYbu8
         bXeLnkLyYJSZUZFPRgcCQCyZ6ZXFO4TRLckLnCAyIdSgiYzGoShvjCenDMLJUhKfl382
         GvL0Mb+tnY0rElcnDsFWBk0JTBLN76jiwsazukpM3hMGfFzVPokT5lkL3in7rUdPWU4l
         fvvvrevkhXB6AskHV5NwIg4+A8QSSbUf+fQ/Ez3qXPED+5JXkuLc/oKw9uuTOMhZ3vLM
         /uEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQvbUkhG8MMCKCPAgk3yyOjvsw3epJ+up94gvRRbwXJBHDVkv6z1Ynqso/dLfePgfCweFJP7EvWmVgFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBn/LT602n9nJMU3C2XcEUgELYFt1L7QOEVGTTPpqeh9KcB9H
	seoTtE0IrIjYKHEx6xrg9vV+EymHdJeMiyZ4wil3khOV4+zXrzK9JAM/
X-Gm-Gg: AZuq6aKVWpsbDjWEsik9eKDpXVlfWPg5DX4dQ7xUn34ouAvT47au/pwU4395m7ihwpW
	wjHAMFvbfOMQ95nSz4odG6vRpWVCmcREJ4/zQUAKjMCKBCFCoCgVfzi3AM+TTK2wMyl8f8Xfsn2
	dI4BhHEf0sq+U5WEOLEj9WGT3K/qBBffisOAXo8K7k6MO03yYABPiXNZVpO5naQUGpTGNDV8zFr
	OwoqyzirHfIZiIaYTre9Q8Mx5NI6dXagNEETG6l8zr/IgLE3NIA7HFrD232OBkRlbhH8HMEZYjb
	+1UEc1YnXzihd9SB47DZyV/vFObgRC03wW20iUFCpkx6Jaidstc5dBFCQ3DVueU81z5MmZ29a0r
	oUf9+3AUjZGOVzKyorYhy5YSuY5cq3ohFmTNMqBYER2Pj6GaP1ohKQzQLMjXWDAMXOfs88FLjWg
	G72g80UASyBK4tGDC+GEoKpnU=
X-Received: by 2002:a05:6a00:e13:b0:81e:f280:f341 with SMTP id d2e1a72fcca58-824873ca992mr2256942b3a.6.1770723381341;
        Tue, 10 Feb 2026 03:36:21 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm14671935b3a.39.2026.02.10.03.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:36:21 -0800 (PST)
From: Ethan Lam <ethanlxkernel@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Lam <ethanlxkernel@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: fix block comment style
Date: Tue, 10 Feb 2026 19:35:57 +0800
Message-ID: <20260210113557.71677-1-ethanlxkernel@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-52511-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethanlxkernel@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 3FACD11A520
X-Rspamd-Action: no action

Fixed all block comment style warnings by checkpatch.pl.
Kept original indentation in comments (requested by Andy Shevchenko)

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 60 ++++++++++++-------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..c67fa4cc3f06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1393,8 +1395,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
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
@@ -1686,9 +1690,11 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		return -EINVAL;
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
-		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		/*
+		 * If the grid info in the argument differs from the current
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2462,9 +2468,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -3028,9 +3036,11 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		atomisp_curr_user_grid_info(asd, &config->info);
 
-		/* We always return the resolution and stride even if there is
+		/*
+		 * We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3280,8 +3290,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
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
@@ -3317,9 +3329,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
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
@@ -3928,8 +3942,10 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		    asd->stream_env[stream_id].isys_info[1].height);
 	}
 
-	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	/*
+	 * Compatibility for sensors which provide no media bus code
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -4387,8 +4403,10 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			ATOMISP_SUBDEV_PAD_SINK,
 			V4L2_SEL_TGT_CROP);
 
-	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	/*
+	 * Try to enable YUV downscaling if ISP input is 10 % (either
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.43.0


