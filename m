Return-Path: <linux-media+bounces-60671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFFXHnKH+2kscQMAu9opvQ
	(envelope-from <linux-media+bounces-60671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8626D4DF4C0
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A4DD300692D
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6343A4C77D8;
	Wed,  6 May 2026 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EepaC8oj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B4F4C040B
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091844; cv=none; b=hHKdO1n/fJLemlJYuzl6SbcHYRSfe4BNXA91o2Ap3acCgJ560q0APnJUKNcmcOeY6r/Phut1tLL55yiWqkKdQS8n+jxjF6vTEIlyVEwDK9NpKj09I/7Db+eIp/mIXcAgLYQ7I/TtyETV8MWIMsdKCyeMe8l3+8XN97bQ9X6jUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091844; c=relaxed/simple;
	bh=JQMQ/39taEOfXCuc3Xm8sCWj2KOUChdVR0RtTPLXBBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0mf6VvG7pheBN4yaQaqksZb5lJruwVtLlt/WpuSeLKiqKIzPZkIrbdyEZMjAR7VYNsHPakFxTAV6dePSu1HBnVA0LyCeMdfMLP8bOwXrrW7gW5pdmr5sWcPy9wBoHWpoPmvJW8256tyRdtgXMHsitiSBIFalpRbw1UZiLuNG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EepaC8oj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so60134505e9.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091840; x=1778696640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVilxyTkiWhT086+MzFvYzbdD2S4USttkppXjLgMDLI=;
        b=EepaC8ojy2gQhjTWWGFWY2i6Awv83h/yT/0lNcLWKYSxZBLqLYs9+eo6nA1q/AxDEl
         o6LVTZHJiEsLCjzJ5xjIaP1qpXabnTjsWnxw9cCVrgOvC+7sJWHcQIwRLBuLeUz49E/I
         rlKkUfak/phFqW0q7xKXR75Ld68Do4cZHwXZfob2DVgXKJQY9KIn+p22ORHlI5l8s9UA
         VGvNd59f/Tgi0lMWzshOHZTJBlJgVuob2ta80E6zPAbSYmMyKk94IIyIvhkk/Y7H6r1b
         DPkGGEDSvGXIIvhr8u8mJ84fVIt/W8GuTAJ6yGFxU2KvwCcnxhPR/M2rwlxBt9/hSrWi
         ElHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091840; x=1778696640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qVilxyTkiWhT086+MzFvYzbdD2S4USttkppXjLgMDLI=;
        b=AWM8cNja90F5Ie/OQIh1r0VFSL0gg2q9PUIKHcDvqmbAEFVzR2OFffXNVBeDy9euNF
         Bx9GiWCT4gKs1OG490lH0WxQQ4/ZQXDc/GTvPUyfEWSm2BDJJQMlOT2DqUG+WOggIAOl
         6zuDqmGgK6KaW+HM0Ca1HftsLQkwCPcQCp7UpWP2/1bnzqtXyUBBDiwpJnObriB62v73
         KqEyxdy/5vPj6WThJnf0Ow2RVy8jBJC8P2pljcGLQBbF31vmLnyfbRZ84Vj8EwBFnMtx
         rwwlyrRcHcnqRFXHbKyRhc3MREhhU9iS8pgNpTPj8qAyMC8CB4gte9IbJOG9QikQC3VH
         hQnQ==
X-Gm-Message-State: AOJu0Yw28zadzYmdRSy9b751TgqsJPU++a4B4xA5B/D+ANyJpJAokOQ7
	I05aPKRaUoiUHZFlax7z/S25Pby3ddpPHtiqsZQ23mvW7ICRFWHAp4GLlUqquUm2TQT2JrFgYKN
	Ws4oJ
X-Gm-Gg: AeBDietu4z3hTmBuRgRLr5ccTtvteP4VcVvNwkHdOOHFsBZi/i+Mb/9GxQemMfl8tRS
	L87MkkdQ3LIs8RwcjwMdOVchA5ffgfC6UWk1jUbC0Y10U3LjL7tKOizkUuqMP4ZHUQ8yf8ccyUb
	X1Stqk01b45JtPHZKQR6D1H1VMnWKPyomwE/yJDtt+p+2RBPxhxUljNrkT2EFcVOCPQpsrkSV2m
	jqR6C5+eGOW3PSra4vh2TV/eBYhzgzaywm/KdB2RPMIoEGfEmgvjjN4i/xHdpOzadS9APojdHGj
	svQvN5sUNSVwC7px9injy2/Kd0pXo3/asCglex5hzHwxkxIub6RF+2ccJ9QyKZjAObvq3R4xPGa
	toq8WFwUr97l/7CXLGygt8w7gwFmzxQSOVJTCECE34z6ktt2BIdxXLG7idsWsfYL5TKVNacOi4c
	QH3P1hsYusxu178mE6owoMS2It
X-Received: by 2002:a05:600c:4512:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48e51e0c7e3mr76385355e9.3.1778091840226;
        Wed, 06 May 2026 11:24:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:23:59 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:44 +0100
Subject: [PATCH 06/13] media: imx355: Set binning mode registers
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-6-660685030455@raspberrypi.com>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
In-Reply-To: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 8626D4DF4C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60671-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

Store the binning mode in the mode structure and set the registers
based on that, rather than having the bare register writes spelled
out for each mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 73 ++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 56a82f37709e..422454e529a7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -73,6 +73,10 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
+#define IMX355_REG_BINNING_MODE		0x0900
+#define IMX355_REG_BINNING_TYPE		0x0901
+#define IMX355_REG_BINNING_WEIGHTING	0x0902
+
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		0x0101
 
@@ -117,6 +121,7 @@ struct imx355_mode {
 	u16 y_add_start;
 	u16 x_add_end;
 	u16 y_add_end;
+	u8 binning_mode;
 };
 
 struct imx355_clk_params {
@@ -269,113 +274,71 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x44 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
 };
@@ -413,6 +376,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0000,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x099f,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 3268,
@@ -429,6 +393,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0008,
 		.x_add_end = 0x0ccb,
 		.y_add_end = 0x997,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 3264,
@@ -445,6 +410,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0008,
 		.x_add_end = 0x0cc7,
 		.y_add_end = 0x0997,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 1940,
@@ -461,6 +427,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02ac,
 		.x_add_end = 0x0a33,
 		.y_add_end = 0x06f3,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 1936,
@@ -477,6 +444,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02ac,
 		.x_add_end = 0x0a2f,
 		.y_add_end = 0x06f3,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 1924,
@@ -493,6 +461,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02b4,
 		.x_add_end = 0x0a2b,
 		.y_add_end = 0x06eb,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 1920,
@@ -509,6 +478,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02b4,
 		.x_add_end = 0x0a27,
 		.y_add_end = 0x06eb,
+		.binning_mode = 0x11,
 	},
 	{
 		.width = 1640,
@@ -525,6 +495,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0000,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x099f,
+		.binning_mode = 0x22,
 	},
 	{
 		.width = 1640,
@@ -541,6 +512,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0130,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x0863,
+		.binning_mode = 0x22,
 	},
 	{
 		.width = 1300,
@@ -557,6 +529,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x01f0,
 		.x_add_end = 0x0b7f,
 		.y_add_end = 0x07af,
+		.binning_mode = 0x22,
 	},
 	{
 		.width = 1296,
@@ -573,6 +546,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x01f0,
 		.x_add_end = 0x0b77,
 		.y_add_end = 0x07af,
+		.binning_mode = 0x22,
 	},
 	{
 		.width = 1284,
@@ -589,6 +563,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0200,
 		.x_add_end = 0x0b6f,
 		.y_add_end = 0x079f,
+		.binning_mode = 0x22,
 	},
 	{
 		.width = 1280,
@@ -605,6 +580,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0200,
 		.x_add_end = 0x0b67,
 		.y_add_end = 0x079f,
+		.binning_mode = 0x22,
 	},
 	{
 		.width = 820,
@@ -621,6 +597,7 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0000,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x099f,
+		.binning_mode = 0x44,
 	},
 };
 
@@ -997,6 +974,18 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
+			       mode->binning_mode == 0x11 ? 0x00 : 0x01);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_TYPE, 1,
+			       mode->binning_mode);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_WEIGHTING, 1, 0x00);
+	if (ret)
+		return ret;
+
 	/* Set PLL registers for the external clock frequency */
 	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
 			       imx355->clk_params->extclk_freq);

-- 
2.34.1


