Return-Path: <linux-media+bounces-47453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A53ECC72F4F
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 8E2F12B473
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0E530EF92;
	Thu, 20 Nov 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b46VllM0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195F30EF74
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628598; cv=none; b=px+wf3XYoPe1bcGz0ITYzns85qn+Rs7dgkLXpDaRUImvZGO9zuUkUGg179TvZ2pskgdFvgiRPQMECLqZwtOAsR0oXh8lUvW6yhiXJRm4mAUgxDPr0EG+TSzRXDrt0f6IFrZ7RQIWxHiIOfF4D8ecq50E5EX9tg8bBBvVP2SUe1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628598; c=relaxed/simple;
	bh=MQV8jD27ZG+yZve5+9joqOYFG9IDBUKao+l7F/BRtLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9wVrGWuYlg354C/X7fz6ftWIUKFAcsIRZCxrzgPG7xHOnGR55AGlXd5pb6d0fePt4JOj90Q9FPuLctIwPYnF/e7YVgYE82tS2+iHyNxRtkj9Zuaztrw+ZqupxLmfjytYhgXJ61mlU2/Y9glIBNmxiTougT6DVAR7edWqDjZOjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b46VllM0; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so743929b3a.3
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763628596; x=1764233396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGP4x/41RYIg15mQcXh3AwtklkR1Te1lPQnjCYwhFmM=;
        b=b46VllM0mNbqjcyT1g4C/WwRSsIWjt4RNF2tIrmyQndjZVKW1zH3QbJWmWH1a4J8EM
         F+ygTVsE2xRue7UDRl14bfqVYB5BnTIJ0D9zwnKu8QbO3ts++mFUYCGuSoycxsTdSHIJ
         ytjJigcJeK8FhjQu9LeE5UVmBilitFIqLYRzY8rYGI4KuRPC4x3e+iVWxAyk7MKvwHpT
         XH71mAJXXOp+PdYFiDV4wJhPCH4UA6zbmqQDSRjY1YfjTPkYY6o2rYdJabov6ityAtt6
         QiScSGL/i7FUFVyCQlAP2fFUb2I+7+2YCAswpIH8ZJiD12Q4ZKUABARCQlCu1Evw0a+h
         fW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628596; x=1764233396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cGP4x/41RYIg15mQcXh3AwtklkR1Te1lPQnjCYwhFmM=;
        b=DN8P/45KtdKUwLYKI8OADj20Xmh0L3pUZbkdMbFOeBatT0niBzn+iwFZwTPtYvn6QD
         jcXswOXNIMlmC8TfoazlHLN9YSeuFtl6inSjSzWFXrbLRp4ePAwnVyIxnOt13NS8UNuq
         iAvsX0UG3qitlOrC9RSnJJSbwJUCJ9v3T3eKL8/ICKolW3NicleAXR8V7zrlOu6UH5mE
         mt0tadjWnVQEacZDPlZiicdp+HSmDxOthebVRElkWuMMMvO41AHnDdn9fsrZzS5MAR2k
         yWBbtH8bpHsDUFZhMdva9e8UqdjdnbywivW+A3PActyYq9bSCD6vtis/llkSTBebf/RH
         mkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm42TUVMOUE6bMfoIhLfOM3/D4w6qqgkCu7+GMFz/5Vwh2+FQ+Vh4U6AfeAK9qJCCCAB4Xkhs5Uz5Qjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcm6eVWlxdMtYHQG2tnGOAGYeyRJqTh6NaZXUtlgIFdeotLPhx
	uJvlOaCyu0sdLJi8iLaBU8R5JEBGZSp6z8ucjCBOuAS1v9g9Vi5KIl+6a/G6MQ==
X-Gm-Gg: ASbGncu6rmy4kDE6gh7MWj8jez0QIWRFVoCU9rgApRSYYHNZpgRjxeq/ACAh4QK2BQI
	PoeFyroeoY1BYbNWZu3LtpPmEMxmSuhG8TpbLGVcqbyf58oWHQtT9a6HSAUKR12m3uwJaA6C85L
	S/aaG3N02nS1hvQ65C5mYugmt6tg616BrfYRKTrazFk+WTGoofJSzhwv29xZMyQRWWNDfnhtjF+
	VyhUxuK5lHpjDCywySXD8iFzRZ+P4hIDq02Ii7kcE9N5eQ9+7S4ktvWLqpTbsyxNMhSq9p9GYhu
	IugCQ53vZ0KM/9YkCdqwezhz9NtfIY6csp7Ihw5xEb2t6RG9BvEkhrqEQyx2jzi5K5nRX60TY6/
	y/IMVurMuc4azg5oOqfs58IJAH8Y9PjAo/gFRCw0NmddYhdqh8BmM6IA11RjH/qprx6xeO6+2ax
	ynBJMhOFmEjMRNRIpjEZe2ToaGkrEqUAPhrMIszg==
X-Google-Smtp-Source: AGHT+IECkCFNKIq/dOmcM+rn72ZbItA41tgJJU1WjHJ7EZr5qY/C2DRz99gNei/A0E9dQvLJp0yjFQ==
X-Received: by 2002:a05:6a00:c8f:b0:7a9:b9e0:551c with SMTP id d2e1a72fcca58-7c3f095c12fmr2797914b3a.21.1763628596176;
        Thu, 20 Nov 2025 00:49:56 -0800 (PST)
Received: from opensource206.. ([157.50.102.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f023fba8sm1974900b3a.41.2025.11.20.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:49:55 -0800 (PST)
From: Pavan Bobba <opensource206@gmail.com>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 3/5] media: vimc: debayer: add support for multiple RGB formats
Date: Thu, 20 Nov 2025 14:19:24 +0530
Message-ID: <20251120084926.18620-4-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120084926.18620-1-opensource206@gmail.com>
References: <20251120084926.18620-1-opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enhance the vimc debayer subdevice to support multiple RGB output
formats and improve its format negotiation behavior.

This patch introduces the following changes:
 - Adds ARGB8888_1X32 to the list of supported source pad mbus codes.
 - Allows userspace to select any valid RGB code on the source pad
   through set_fmt().
 - Propagates width, height, and field settings from sink to source
   while preserving the selected RGB code.
 - Sets appropriate default colorimetry for RGB output (sRGB, full-range).
 - Updates vimc_debayer_process_rgb_frame() to handle RGB24, BGR24,
   and ARGB32 pixel formats with proper channel ordering and alpha fill.
 - Adds debug and warning logs for invalid or unsupported formats.

These changes make the virtual debayer pipeline more flexible and
realistic for testing RGB/ARGB camera capture paths.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++++++++----
 1 file changed, 90 insertions(+), 23 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index bbb7c7a86df0..0fa1cb8d3be1 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -15,9 +15,6 @@
 
 #include "vimc-common.h"
 
-/* TODO: Add support for more output formats, we only support RGB888 for now. */
-#define VIMC_DEBAYER_SOURCE_MBUS_FMT	MEDIA_BUS_FMT_RGB888_1X24
-
 enum vimc_debayer_rgb_colors {
 	VIMC_DEBAYER_RED = 0,
 	VIMC_DEBAYER_GREEN = 1,
@@ -73,6 +70,7 @@ static const u32 vimc_debayer_src_mbus_codes[] = {
 	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
 	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+	MEDIA_BUS_FMT_ARGB8888_1X32,
 };
 
 static const struct vimc_debayer_pix_map vimc_debayer_pix_map_list[] = {
@@ -170,7 +168,7 @@ static int vimc_debayer_init_state(struct v4l2_subdev *sd,
 
 	mf = v4l2_subdev_state_get_format(sd_state, 1);
 	*mf = sink_fmt_default;
-	mf->code = VIMC_DEBAYER_SOURCE_MBUS_FMT;
+	mf->code = vimc_debayer_src_mbus_codes[0];
 
 	return 0;
 }
@@ -239,6 +237,14 @@ static void vimc_debayer_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 	vimc_colorimetry_clamp(fmt);
 }
 
+static void vimc_debayer_set_rgb_mbus_fmt_default(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+}
+
 static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
@@ -250,12 +256,30 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && vdebayer->src_frame)
 		return -EBUSY;
 
-	/*
-	 * Do not change the format of the source pad, it is propagated from
-	 * the sink.
-	 */
-	if (VIMC_IS_SRC(fmt->pad))
-		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+	if (VIMC_IS_SRC(fmt->pad)) {
+		struct v4l2_mbus_framefmt *source_fmt;
+		struct v4l2_mbus_framefmt *sink_fmt;
+
+		/* Validate the requested source format */
+		if (!vimc_debayer_src_code_is_valid(fmt->format.code))
+			return -EINVAL;
+
+		/* Get current formats */
+		source_fmt = v4l2_subdev_state_get_format(sd_state, 1);
+		sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
+
+		/* Update source format with appropriate properties for RGB output */
+		source_fmt->code = fmt->format.code;
+		source_fmt->width = sink_fmt->width;   /* Size should match */
+		source_fmt->height = sink_fmt->height; /* Size should match */
+		source_fmt->field = sink_fmt->field;   /* Field handling should match */
+
+		/* Set appropriate colorimetry for RGB output */
+		vimc_debayer_set_rgb_mbus_fmt_default(source_fmt);
+
+		fmt->format = *source_fmt;
+		return 0;
+	}
 
 	/* Set the new format in the sink pad. */
 	vimc_debayer_adjust_sink_fmt(&fmt->format);
@@ -278,8 +302,25 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 
 	/* Propagate the format to the source pad. */
 	format = v4l2_subdev_state_get_format(sd_state, 1);
-	*format = fmt->format;
-	format->code = VIMC_DEBAYER_SOURCE_MBUS_FMT;
+
+	/* Propagate size and field from sink, but maintain source code */
+	format->width = fmt->format.width;
+	format->height = fmt->format.height;
+	format->field = fmt->format.field;
+
+	/*
+	 * Source code should always be valid (set during init or via set_fmt).
+	 * If somehow it's not, this is a bug - log warning and fix it.
+	 */
+	if (!vimc_debayer_src_code_is_valid(format->code)) {
+		dev_warn(vdebayer->ved.dev,
+			 "%s: Invalid source code 0x%x, resetting to default\n",
+			 vdebayer->sd.name, format->code);
+		format->code = vimc_debayer_src_mbus_codes[0];
+	}
+
+	/* Set appropriate colorimetry for RGB output */
+	vimc_debayer_set_rgb_mbus_fmt_default(format);
 
 	return 0;
 }
@@ -297,19 +338,45 @@ static void vimc_debayer_process_rgb_frame(struct vimc_debayer_device *vdebayer,
 					   unsigned int rgb[3])
 {
 	const struct vimc_pix_map *vpix;
-	unsigned int i, index;
+	unsigned int index;
 
 	vpix = vimc_pix_map_by_code(vdebayer->hw.src_code);
-	index = VIMC_FRAME_INDEX(lin, col, vdebayer->hw.size.width, 3);
-	for (i = 0; i < 3; i++) {
-		switch (vpix->pixelformat) {
-		case V4L2_PIX_FMT_RGB24:
-			vdebayer->src_frame[index + i] = rgb[i];
-			break;
-		case V4L2_PIX_FMT_BGR24:
-			vdebayer->src_frame[index + i] = rgb[2 - i];
-			break;
-		}
+	if (!vpix) {
+		dev_dbg(vdebayer->ved.dev, "Invalid source code: 0x%x\n",
+			vdebayer->hw.src_code);
+		return;
+	}
+
+	index = VIMC_FRAME_INDEX(lin, col, vdebayer->hw.size.width, vpix->bpp);
+
+	switch (vpix->pixelformat) {
+	case V4L2_PIX_FMT_RGB24:
+		/* RGB24: R-G-B */
+		vdebayer->src_frame[index + 0] = rgb[0]; /* Red */
+		vdebayer->src_frame[index + 1] = rgb[1]; /* Green */
+		vdebayer->src_frame[index + 2] = rgb[2]; /* Blue */
+		break;
+
+	case V4L2_PIX_FMT_BGR24:
+		/* BGR24: B-G-R */
+		vdebayer->src_frame[index + 0] = rgb[2]; /* Blue */
+		vdebayer->src_frame[index + 1] = rgb[1]; /* Green */
+		vdebayer->src_frame[index + 2] = rgb[0]; /* Red */
+		break;
+
+	case V4L2_PIX_FMT_ARGB32:
+		/* ARGB32: A-R-G-B (set alpha to 255) */
+		vdebayer->src_frame[index + 0] = 255;    /* Alpha */
+		vdebayer->src_frame[index + 1] = rgb[0]; /* Red */
+		vdebayer->src_frame[index + 2] = rgb[1]; /* Green */
+		vdebayer->src_frame[index + 3] = rgb[2]; /* Blue */
+		break;
+
+	default:
+		dev_dbg(vdebayer->ved.dev,
+			"Unsupported pixel format for debayer: 0x%x\n",
+			vpix->pixelformat);
+		break;
 	}
 }
 
-- 
2.43.0


