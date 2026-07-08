Return-Path: <linux-media+bounces-67023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CIpjDKBlTmqjLwIAu9opvQ
	(envelope-from <linux-media+bounces-67023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FA727AE9
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=cAhn5afI;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67023-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67023-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46375306F8E0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0F34C9564;
	Wed,  8 Jul 2026 14:49:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2866147DF8F
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522172; cv=none; b=ERw/kI7XCft9reXQ7y7BBi+4gopkgu5YRwohDLPkLnP1zzr2K2jFFcfxuiowl1Ky1/9132CJw28cZrMoWvgbeYC7Tb9KoHfZDfx+dmcXO4gBk6eOitXWUX95p1w6gG4ZN8a6CV15Y+3byvhWCn8qAH7lhDc5yJ6xZ14q5dokfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522172; c=relaxed/simple;
	bh=WmGz4nPgmAYFKTk0UHv3cgym/1CZLfveDLzGzzdpKXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Azogr6nu58BXniMNJ4dDoFBcyO/F/4VWN4ayYGmi8HngqFCy6/ERgMqksHUVvcff0C/OeG+2BgxNMRFO0KmQ6uXlvsxOTLjyBKsjiPs+RvTs5sGXF+zaOF0z1+SLo/n3feyMdQyCOrLDaFdkZ1ofcY71xHMZI8bAkssQgcM/Oxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cAhn5afI; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so4379365e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522157; x=1784126957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poih6FWktQDQKgkCTECxgZzsFqMFD3r/FGOUzaesYvE=;
        b=cAhn5afI10yGdIL7k8Xblf5IvVuzKqghzNCIAiVKorHu+MCMFbxvAFjqhIWYKmX/9j
         GK+tEUQfxzYasmQLJ2fSZ4rjjTV8ukdC3qUiizfyB65oA7aQTBvC+CztyROKkBlEVrvq
         QNIAEAQqdPJZ24ox/nBJgusXu7pWwqnSv1CfLQ47nWSYKE9J7D05KmApzHTpYy8xyjkd
         zLTa6vXRB+wb5IiKxuH6+7otBPm04RPa4QhtV+CmXPvVlDQDNiajxgPespI0oR3i0sPR
         Qnc9atiaRS5GyjKQAIVWs+vMQ8Z3+IvNuTfb/Z9cYRjMrur5j0CBmmRhgplYCpIxSzqZ
         OgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522157; x=1784126957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poih6FWktQDQKgkCTECxgZzsFqMFD3r/FGOUzaesYvE=;
        b=QWFif1fc55GSjzT6nZpyUQQRlwb6fBjFgqnL9SKhIqjInFvrb3J/RPQMlLSmu6NbI4
         BrPOccUhbyJqGsZV2gu3/+Ygc61Np+N93TmZqgyOeFyxA+Ec5CLN4X7y+PGekrWxXOM+
         jVAQxQOANXorsOOTzjdAByZa64JgW/t/HhVAwEGq6I+BgNCPCt4h2JskCwzMErF9Sy9W
         Gl/7HRlWvS+EsVFz3mFe6h7O+QcK9UJ2NI67JocX2Yn8TxuMCYKOFqzjLSY+ecS1BVWZ
         TjgHuihh1VezOGNWZPiT79xa1yrgOh1PaYnsZ9u3a808jH1p+IvHJJj054x1v/+y9+hh
         KyFw==
X-Gm-Message-State: AOJu0Yy+c/9whjUw7QqBovnL2wlrmYVXHjsQ/OshjPAqJjPeYpzF0wPM
	IE+7SMR4G/Cr8yuTC0R3H+1U9ySaz9O6X+4FnNT2NAR2BPHWiEqKRa1cZ3/ISkbJ3zg=
X-Gm-Gg: AfdE7ckIW/1RJ+wt+LCXODgiG9w0p7TeBcwBRq4PbhD/XG6zrMV66uHe6mnVCKbkLaz
	z6ONU9VQGADmwxRTWVQ9rJ3lLqxbk1bSJctATaBvYrDQEZRQrpe5IxmaOYSfTU1n/GM9sbpKzCs
	XGc6P7AT7MZj7eKxJ4KCueH6ZZl1N14byFMAnPIHZqdWtuRKWM2NDWSCmrs08TIAJR6O0DupOix
	smTy9zvWzYtW5RP5cYlzebSIK491plhxCJKvMSZBKMzfc0DaBvD21eewteYIB50OVdLzmgmpEh/
	Dlop/GD1oVf/Ipxsl1Cg+nIodiz7vh5OPK5nzfLYq/2aOQUPDdBLzHmZNE+Uc0b0BjAV1xA07Jd
	l/Qmt2E34PYJs19u7GyRuCUIBPxRWGcuEPaIAfZpdJq+UQS+gxhaQNgh50tBEKhv+4ngNy1CtzJ
	J1xxdK7MJbllQa1ktIzSCzQx/g7poICEyOBWVlFythNe1RZwOrVtMB0ETpBE5vOCPb
X-Received: by 2002:a05:600c:4796:b0:493:e97b:3b9c with SMTP id 5b1f17b1804b1-493e97b3bcfmr1416705e9.29.1783522157466;
        Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:46 +0100
Subject: [PATCH v3 10/20] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-10-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67023-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B87FA727AE9

fll_min (Frame Length Lines) is set to the same value as fll_def
for all modes, which makes it redundant.

The actual value is also erroneous as the sensor works in all
the defined modes with FLL set at the mode height + 20 lines,
so set the vblank control minimum to 20 rather than varying it.
This also improves the maximum frame rate achievable.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 2a97e076bff7..c6f27cf269b4 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -32,6 +32,7 @@
 /* V_TIMING internal */
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
+#define IMX355_VBLANK_MIN		20
 
 #define IMX355_REG_LLP			0x0342
 #define IMX355_LLP_MAX			0xffff
@@ -105,7 +106,6 @@ struct imx355_mode {
 
 	/* V-timing */
 	u32 fll_def;
-	u32 fll_min;
 
 	/* H-timing */
 	u32 llp;
@@ -359,7 +359,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
@@ -376,7 +375,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 8,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
@@ -393,7 +391,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 8,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
@@ -410,7 +407,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 684,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
@@ -427,7 +423,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 684,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
@@ -444,7 +439,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 692,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
@@ -461,7 +455,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 692,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
@@ -478,7 +471,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
@@ -495,7 +487,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 304,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
@@ -512,7 +503,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 496,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
@@ -529,7 +519,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 496,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
@@ -546,7 +535,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 512,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
@@ -563,7 +551,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 512,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
@@ -580,7 +567,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 652,
-		.fll_min = 652,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
@@ -864,7 +850,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	s32 vblank_def;
-	s32 vblank_min;
 	s64 h_blank;
 	u32 height;
 
@@ -889,10 +874,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
-		vblank_min = imx355->cur_mode->fll_min - height;
 		height = IMX355_FLL_MAX - height;
-		__v4l2_ctrl_modify_range(imx355->vblank, vblank_min, height, 1,
-					 vblank_def);
+		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
+					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
 		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
@@ -1151,7 +1135,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
-	s64 vblank_min;
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
@@ -1181,9 +1164,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
-	vblank_min = mode->fll_min - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_VBLANK, vblank_min,
+					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
 					   IMX355_FLL_MAX - mode->height,
 					   1, vblank_def);
 

-- 
2.34.1


