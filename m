Return-Path: <linux-media+bounces-66885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZvSeMPgyTWrqwQEAu9opvQ
	(envelope-from <linux-media+bounces-66885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:10:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA871E23A
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:10:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=UBFYzlhT;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66885-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66885-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEDB0303877D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC8444213F;
	Tue,  7 Jul 2026 17:06:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4B43F4AB
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443988; cv=none; b=ppDMfX3IDc/NsnQZfCZbDxE6EZwM203YLX5+KvYlR59BMDIBxWK0VScD8gdvmPh6TDjuxCRZkE5hMVPt+qqDTkc2wwzBvbkXqvdDlv9EUlT1AqQM3WeoAOpAVucBD8KHevXlu/JlSv8Nd2za6VXVjkkfvZ0UmNohHGRCdF6qmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443988; c=relaxed/simple;
	bh=Q2zlOjF5DllCgqp+36hxPYhrD7Xf3mJjT3KUBG9FLhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Viez84wLOxg6ZfFxdqvkH36whlPnRp/CDf++E9dwZXG+23wMV+Ly8gi+hyPt/j0XICLfzH8XM+HnalMlvEZZUSyVCWWTFbvC9H4xA029cMKL50ePY3CwKeBMLi3GJWB/2GznygbNw153KEoEjIvQGx4Q3/yEGTsOX4NOsC0lSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UBFYzlhT; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b779003fso22415905e9.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443984; x=1784048784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcGejnOxiMbE4KgMrI0yUaOLUc005/RfMPdtDQNRvyo=;
        b=UBFYzlhTXhhl65apQQlrqm9l8RVM7Of1OX407igQVqyLkueN6R6Ukyl/OwI1y8hBOy
         Z3DHa8Wes/qt1dpyRdAzqy5Bk6MDrfH2ibfI2dDc9NU8FL7MmrS0uPvSdt5E5XG9/NCX
         2aLtzAXFrJ0qZvFpyEa6rKptqeaczDEkqbeyP6wOI8nl+ZEwx985IJ+fD08DdTB1a59e
         mdYohxaAZ0sb0glKrF5tSQZ7FJ0Vr4ydfKmUr2fJmYCBwV6+Fk1CChiBAmKhFCG380r5
         JnCzJi4UcIqvYaFz0aEJBoFq9hhdsdz9m5ktm2eDNf5zkbViIk5PINDM2l8Ye5jsdZTU
         famw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443984; x=1784048784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcGejnOxiMbE4KgMrI0yUaOLUc005/RfMPdtDQNRvyo=;
        b=TKD8PiQfK/GABwv7zLqen+XEBfnbWDmig1zq+vJu+43hCGQdBf8Bzq6TZIx2VecULx
         r6B+tA0aoRb8frtJQYPy2M6CSjwOTtS/lnz5wXlPJZ2k3qOcnH4Hq9JoQ/uFeSXRcw34
         1WZee9WlovXwAauatJn5UrhCCfmxUytOWZJyABraavTD1mcjotUCmweSLW1DAGI/VYcT
         BkC1hkI14VidxEeDDzbbF2AMbmbM08/hYyET4DJIbsAeyEnw1ozUtyyYdD2S0b1SQXx3
         K9bYJif6XfVIOAIHHt052kEzhZXpeN7iGeooVtyZq1F005Ovyp+635ZtR7RoMFeEpo8E
         2WJw==
X-Gm-Message-State: AOJu0YwTjcFcMPm+0aaU7ajurxS72S1666/fEwjp1FUwJdKiPh7x8gad
	MAG92Vqc57tuT44kMb5QIbL2YjImMjrvGF9dugIB9XtOXBnBa+QuO9+tIUdLxQYzrLc=
X-Gm-Gg: AfdE7cls0TTaCIoAILiGWVBSs35L3kYFCYbkE+LkqOrXUTJidTtoFyb7FSDxpji4o0x
	AkdSrXqg7YrS39Pw7PgZT9BimyQM1dYzVUvi0T7PJh8Un8FV5DXrmNuevm1Dg/jFz1cRBe7lRK3
	bYlpT0rvrp0Lh7k67fwMm1Ik0NtkwdVF1G+vpX9FuLHyh/6nR9NiMlmzFkxr8WlYDdazwlY34XA
	3imIbi3A1u91c6VN0/4yl69E2v/g2Uqcqo0KogRAaE9K2tkB330nUgGLv1L8XaonJ+3vWNa4b2p
	4aAVXhAVmWi8MasTfg5uZuHTpRIx4aaB2YShOvW9WKz7HLMVf6ESY/MeM9K/vBSmBOGVpMdv/uP
	PSGwklq5NO49w0P+d9AMOs2d2pdeKWC8vfl1l62le4pOPgUaQRBJXYf4zXfDPmqTa9gkNPgsqmL
	4GlLbZn/0V+LE+lj+2yyMTqtkhmg2LAzYdjUUATRfC+x1wFffjxP2t+yLhEA2x7PrMBgH4daEr+
	V8=
X-Received: by 2002:a05:600c:608f:b0:493:bc88:ddcf with SMTP id 5b1f17b1804b1-493df71acffmr57624485e9.23.1783443983854;
        Tue, 07 Jul 2026 10:06:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:42 +0100
Subject: [PATCH v2 10/20] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-10-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	TAGGED_FROM(0.00)[bounces-66885-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DBA871E23A

fll_min (Frame Length Lines) is set to the same value as fll_def
for all modes, which makes it redundant.

The actual value is also erroneous as the sensor works in all
the defined modes with FLL set at the mode height + 20 lines,
so set the vblank control minimum to 20 rather than varying it.
This also improves the maximum frame rate achievable.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9d977bac23b6..354092295b7c 100644
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
@@ -358,7 +358,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
@@ -375,7 +374,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 8,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
@@ -392,7 +390,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 8,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
@@ -409,7 +406,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 684,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
@@ -426,7 +422,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 684,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
@@ -443,7 +438,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 692,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
@@ -460,7 +454,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 692,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
@@ -477,7 +470,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
@@ -494,7 +486,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 304,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
@@ -511,7 +502,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 496,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
@@ -528,7 +518,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 496,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
@@ -545,7 +534,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 512,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
@@ -562,7 +550,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 512,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
@@ -579,7 +566,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 652,
-		.fll_min = 652,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
@@ -863,7 +849,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	s32 vblank_def;
-	s32 vblank_min;
 	s64 h_blank;
 	u32 height;
 
@@ -888,10 +873,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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


