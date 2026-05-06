Return-Path: <linux-media+bounces-60674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KuNAmyH+2lpcQMAu9opvQ
	(envelope-from <linux-media+bounces-60674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F74DF4B2
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21E0630237C7
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8263D4C9544;
	Wed,  6 May 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="laUNTrXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218764C77BA
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091846; cv=none; b=V4faBSrCV5i0s4VoiYMVL0OxMRWqyb+GzP/7I1ROxS3WrWnVv6/dnV6Vl3UTDL3FzqfQxTZ87rfLung9CPcnwtwUX7A/Izy4NYyxb8htGR9IPwinvAfNa1MGMmbvo96nv2SoxPvCpfJDrEfFe2mhunP90GAoBNPQ/WPfX3CZdNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091846; c=relaxed/simple;
	bh=xmR9cjWdkx0/RjDNOl9sJ0HMQmryvHQRXlVtFmidLVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNTK0LfrCJXa7dPfAATYvJDVgPYFjdHRMgc/jqSRgYxvJxcRSizPOFwEPRgWi5rjSYGjTr92gb5qe5H8MdD2OqUXUUS0oSOeDjg5DV7rXXDCV9bJ/fscNYQ/bZZZrZXOjlnnRy7Nodyxh6Ky2r0LR/0Z2JZLgaWwAJ/Ok5Xpkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=laUNTrXG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso80073945e9.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091842; x=1778696642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VScBt6o5JgEQ4/fHCZ+XmNlE5Z8Bh4ejGjVe8g1NSM8=;
        b=laUNTrXGD2bVrWlpyvcv4SDskuwqC27JkLejNLENogPxjEbmcWff8cxpvydn06KA5c
         8MTyYObT4B4TLdsIa3XD95dsJITLgoK+4WLlvJvE3eSA7BLBS4QWQBLoh620VWUzbSUg
         9jHdx6BH0N5GC1+0ePBMX3sHOJ4S4q8WHpVR12WfCD3U4IjaK+LVB/i5+t2mx5CuzHiH
         XxItFn+lttk/PZjEJmo+KW8acK9R6hbknLxx8wLLW3SlllhBHu/nXiKA5yHyAYpjZJnd
         iOebz8+DQOwXZSazo6CaIxnOSSwUvyVdeXE9ICzVqJfPMCwDjYZnjbd+wu8N7ekKTec3
         H4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091842; x=1778696642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VScBt6o5JgEQ4/fHCZ+XmNlE5Z8Bh4ejGjVe8g1NSM8=;
        b=E+yeU0pQfJKVbsRXBzvy5cK0J3V9daP0QyxqZ+w1oPy1U00+tzwkRbzGUTl0H4n5Wg
         agNLBrfXQnUFhBsB0ENfPlhF03Kmb4LIQE2MaTBmbYJ1UF5OwOycmiIQevHWjvwC+sfO
         G9o8U5oqVeofHmKEN/OL7HmRq1T3iSaozSpyoETkLWn2IH5kSJsL3+ktTsFunyFwyr0q
         iiwEW8FOB9zCfoa0oOWnmjYzdIm/nMMMBSSvNSM5vVKG0J1gvagy+5j0JA1Ksa0IXqmh
         i5lUp0/ypIhbLw+jVZEqx7cwrdd3uh5zpJMq2FrBinkt8Cvj/fHTfQrWwciBSTFT1jq6
         gHmA==
X-Gm-Message-State: AOJu0YyklJvSDFg+TISNCpR2Id5rhT9oIOs9VVFtROL74mW8ELK9iJmu
	ByjWO77KOQxMPWNk2I8GUd+PLHSi1l9Oa3fgfGuc/joiRbGsBuXNsHD5QptRDFOTtD4Oapg4wSA
	ifXON
X-Gm-Gg: AeBDievFFmA78vFEvNbxA8NDHQ+6sPaZ5tMfswLE0Ei7lVJn6Q8sMcXCCMMS1HbPe4h
	wD/7iEWziQsOEO+JP0xsNHH7sVdRU68aEF2fSzuvK/mXIIHE2T3kvNLlHoXTh8ApE8VWINSvbKW
	6RbY1xa3miBsTrKsrOXYUe6G/G3cg5NBcwq46AJyk15qI1vUVs+ktRLSiZ0dSeA1DEDcpAjxXzZ
	EmBAad4An+NZF6aeRSTyvSUFNlkz6NKlGLTU95VKwcXojgecDwlY9fvcyXBQC6izZbqBIeW7grP
	FAulV6YyjfyKeeqW5z1FF+NiEQmeWayxhwWKjhEjY8SCKsF6UFvwkW8+YNmxjJQ4Z86BMoUn7S/
	wGrIp/p+zwhUbQmgHfpIdQFN97PSBWCnP9yC/mmow7hwbcKy7L8dVEpWYdCZPDzFmgXD2aF4JFh
	T9ASBmcT8g65b3LLW+MKp7ts8K31EISyNaKO0=
X-Received: by 2002:a05:600c:3ba7:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48e51f40884mr82775025e9.26.1778091842202;
        Wed, 06 May 2026 11:24:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:24:01 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:47 +0100
Subject: [PATCH 09/13] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-9-660685030455@raspberrypi.com>
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
X-Rspamd-Queue-Id: 986F74DF4B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60674-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

fll_min (Frame Length Lines) is set to the same value as fll_def
for all modes, which makes it redundant.

The actual value is also erroneous as sensor works in all the
defined modes with FLL set at the mode height + 20 lines, so
set the vblank control minimum to 20 rather than varying it.
This also improves the maximum frame rate achievable.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 12005bc40f36..5a3bfcd0f51c 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,8 @@
 /* V_TIMING internal */
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
+/* Number of lines above frame height that are required. */
+#define IMX355_FLL_OFFSET		20
 
 #define IMX355_REG_LLP			0x0342
 #define IMX355_LLP_MAX			0xffff
@@ -105,7 +107,6 @@ struct imx355_mode {
 
 	/* V-timing */
 	u32 fll_def;
-	u32 fll_min;
 
 	/* H-timing */
 	u32 llp;
@@ -360,7 +361,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 3280,
 		.height = 2464,
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
@@ -376,7 +376,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 3268,
 		.height = 2448,
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
@@ -392,7 +391,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 3264,
 		.height = 2448,
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
@@ -408,7 +406,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1940,
 		.height = 1096,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
@@ -424,7 +421,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1936,
 		.height = 1096,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
@@ -440,7 +436,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1924,
 		.height = 1080,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
@@ -456,7 +451,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1920,
 		.height = 1080,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
@@ -472,7 +466,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1640,
 		.height = 1232,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
@@ -488,7 +481,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1640,
 		.height = 922,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
@@ -504,7 +496,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1300,
 		.height = 736,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
@@ -520,7 +511,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1296,
 		.height = 736,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
@@ -536,7 +526,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1284,
 		.height = 720,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
@@ -552,7 +541,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1280,
 		.height = 720,
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
@@ -568,7 +556,6 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 820,
 		.height = 616,
 		.fll_def = 652,
-		.fll_min = 652,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
@@ -857,7 +844,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	s32 vblank_def;
-	s32 vblank_min;
 	s64 h_blank;
 	u32 height;
 
@@ -882,10 +868,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
-		vblank_min = imx355->cur_mode->fll_min - height;
 		height = IMX355_FLL_MAX - height;
-		__v4l2_ctrl_modify_range(imx355->vblank, vblank_min, height, 1,
-					 vblank_def);
+		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_FLL_OFFSET,
+					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
 		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
@@ -1146,7 +1131,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
-	s64 vblank_min;
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
@@ -1176,9 +1160,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
-	vblank_min = mode->fll_min - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_VBLANK, vblank_min,
+					   V4L2_CID_VBLANK, IMX355_FLL_OFFSET,
 					   IMX355_FLL_MAX - mode->height,
 					   1, vblank_def);
 

-- 
2.34.1


