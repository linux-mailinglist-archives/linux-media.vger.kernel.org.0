Return-Path: <linux-media+bounces-67664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zdnmKOBzV2pbOQEAu9opvQ
	(envelope-from <linux-media+bounces-67664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:49:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFC75DC05
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:49:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=KLWtTVSS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67664-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67664-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75FED3007AE2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D2447D95E;
	Wed, 15 Jul 2026 11:44:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022B4779A4
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115868; cv=none; b=Pbq763zN4CTv1CTXkoSrh6j1itSAPlFYYBCkPdkb4r+v+Ftk0oqGRH+QxXWrMehprbjbLa9/5DbiLiQqxWywk/i5SQaV6Dm3QRikjn0Jb0LjCQa/60OQRSOyEV6lBGP99X4tzTch8aCEQG+zk71uyCtqdA+td6eFCxZownONu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115868; c=relaxed/simple;
	bh=HdbiuQ9hrzt3ENIhE8rmztLy1tdY2xtHe47PqycJqCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG31Fb/E4+/b91Sv8q9pqOZqRMUkUwZ0IPDZsL3yfgO2XGN9vTeA8O5mKdr6b8uG5YOxhSKkhFWdT5fUv4JTsT464FqBHbXB9PyN+0TfP96EGtuE5FhMAHAeLxc6TWWYlHfKowBLacpbbNiWcOgP2t0wePVfmaJu0d3jn3aPuDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KLWtTVSS; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-474560436c3so1505135f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115863; x=1784720663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9+BuODn1jDo43G5zG0OPU3+fs9eA8M+XWxL5q1Yvm8=;
        b=KLWtTVSSkrf90TZpMmQU7x89N24WP/iXTOwTRAsQeJ0rIA/a/J3eUB0eDzn5BMy4+K
         0ppUOlsCQFBr1TVOAMdLT0oGXOVTs7yOXNfsdKxTudVuQic0mVuAPgizBmnFA/wJeXfS
         +YBQOV8lAhGjGS55fMiL0h2xMiAHEPJ1FMRvXQCmr3t6GrwOg4+Lg+POPoPXquVuSDXP
         OrnZhZ6gK8SSu/tkQqiCRXDFGWlUn7BdBltyPpAMg4jAUqxMngIqir9/Jlu7kdd0HE/I
         Xb7x9JKY+nuXlc0bf8WbCHH4d/z+qnDcuffjncMrdVk/U54MfZB4cmJV0UaSaJ4M0lNS
         J0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115863; x=1784720663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9+BuODn1jDo43G5zG0OPU3+fs9eA8M+XWxL5q1Yvm8=;
        b=TZ0pZjihMs6ZeOHxZXPj9ALrPzhfKDEWFpJmDIx+QjMSCt+xg5M4C5qr4CsiXsg1+Q
         qBMJ+sTZF3FVUKaBy3tY5KWNrpG2jKsjmmj9n/la6dCOj9D95FiHvJ4of5YtEwsqbLBR
         ho6anTXkYLTls9eFsoC0kDligMVj1bKGJ8on+Ju5rrMSWZbLpw4FbBdHV4imZcu/rpoy
         JVLiuz7sth5TLHarxVg/2Kom6523nYGnJHtx78X213esCSCVMECYH5ORmYCEuJezVadt
         nbQc9fJMk74uDu9lNsEBJAAACLS4kLK+Wr8CX5skXQEDsp75YnbHU17OUSOKIJ7/yVNm
         RCVQ==
X-Gm-Message-State: AOJu0YxriK5I4Z4xB7oWBjjKIZ//h53rXFzcB546flRVfeu1KUM6Z9yb
	bQFUz4Ai6goTlC/PnYJBszzTPTA3FkVhp6RlHxXpVe573bal8Soqrn4s3bnrfLIVzdk=
X-Gm-Gg: AfdE7ck9nr/3H/8kjBMoI5hQpJIaF3qPL5KQuSJVo48qHUyigyPxo5aOnM/vp2xWxO3
	zx0UeU3w8/BUJwZvN+tCeWbkbjO+P+Epd5v4j7GO0RlTkm5m54vF+gqN/8SdMsBIkyLqaMu6o8r
	mxnea9Gnhzv7WuDQglzz5HHON5ayhpOmzEw3E61JqnRhx9wcfgNRvvDJb3Oj9IDv+fDZaTWIZ5o
	nAQYKcCO6rTTbKcgJ03Fy58bsntCeagZY+Gf5Ez95y/fh40T0LZPOPrLNWXdj3uh5ffIIdAUArj
	uoqSG262ScgRKZkilx4Ld4lXpb5FXrpp0R1By7fC5rWAfV4SVyxq24lVaW7sns0DWkITFMOQU1H
	d+hRqa6Vc8FW2MnlZLY0c1PP5o2cqHfkZRyiTOrVk4sDGJwi3L1HZWoMMpj78tnGK6NBj9U62UV
	gDkDIvMRhZCPH/FWJ4xZtlb/f4MTp04Xh9JLMbk1p6wcinjlKO/kba64WIpCJt3PGk
X-Received: by 2002:a5d:5f49:0:b0:475:f0d1:eb5d with SMTP id ffacd0b85a97d-47f2dd15badmr19722835f8f.56.1784115862458;
        Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:27 +0100
Subject: [PATCH v4 14/21] media: imx355: Convert to new CCI register access
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-14-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67664-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0EFC75DC05

Use the new comon CCI register access helpers to replace the private
register access helpers in the imx355 driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx355.c | 500 ++++++++++++++++++---------------------------
 2 files changed, 196 insertions(+), 305 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5d173e0ecf42..06461a70a2cd 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -259,6 +259,7 @@ config VIDEO_IMX335
 
 config VIDEO_IMX355
 	tristate "Sony IMX355 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX355 camera.
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 17a2acc1152d..52bdfe636231 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -9,76 +9,78 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
-#define IMX355_REG_MODE_SELECT		0x0100
+#define IMX355_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define IMX355_MODE_STANDBY		0x00
 #define IMX355_MODE_STREAMING		0x01
 
 /* Chip ID */
-#define IMX355_REG_CHIP_ID		0x0016
+#define IMX355_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX355_CHIP_ID			0x0355
 
 /* PLL registers that depend on the external clock frequency */
-#define IMX355_REG_EXTCLK_FREQ		0x0136
-#define IMX355_REG_PLL_OP_MUL		0x030e
+#define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
+#define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
 
 /* V_TIMING internal */
-#define IMX355_REG_FLL			0x0340
+#define IMX355_REG_FLL			CCI_REG16(0x0340)
 #define IMX355_FLL_MAX			0xffff
 #define IMX355_VBLANK_MIN		20
 
-#define IMX355_REG_LLP			0x0342
+#define IMX355_REG_LLP			CCI_REG16(0x0342)
 #define IMX355_LLP_MAX			0xffff
 
-#define IMX355_REG_X_ADD_START		0x0344
-#define IMX355_REG_Y_ADD_START		0x0346
-#define IMX355_REG_X_ADD_END		0x0348
-#define IMX355_REG_Y_ADD_END		0x034a
-#define IMX355_REG_X_OUT_SIZE		0x034c
-#define IMX355_REG_Y_OUT_SIZE		0x034e
+#define IMX355_REG_X_ADD_START		CCI_REG16(0x0344)
+#define IMX355_REG_Y_ADD_START		CCI_REG16(0x0346)
+#define IMX355_REG_X_ADD_END		CCI_REG16(0x0348)
+#define IMX355_REG_Y_ADD_END		CCI_REG16(0x034a)
+#define IMX355_REG_X_OUT_SIZE		CCI_REG16(0x034c)
+#define IMX355_REG_Y_OUT_SIZE		CCI_REG16(0x034e)
 
 /* Exposure control */
-#define IMX355_REG_EXPOSURE		0x0202
+#define IMX355_REG_EXPOSURE		CCI_REG16(0x0202)
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
 
 /* Analog gain control */
-#define IMX355_REG_ANALOG_GAIN		0x0204
+#define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
 #define IMX355_ANA_GAIN_MIN		0
 #define IMX355_ANA_GAIN_MAX		960
 #define IMX355_ANA_GAIN_STEP		1
 #define IMX355_ANA_GAIN_DEFAULT		0
 
 /* Digital gain control */
-#define IMX355_REG_DPGA_USE_GLOBAL_GAIN	0x3070
-#define IMX355_REG_DIG_GAIN_GLOBAL	0x020e
+#define IMX355_REG_DPGA_USE_GLOBAL_GAIN	CCI_REG8(0x3070)
+#define IMX355_REG_DIG_GAIN_GLOBAL	CCI_REG16(0x020e)
 #define IMX355_DGTL_GAIN_MIN		256
 #define IMX355_DGTL_GAIN_MAX		4095
 #define IMX355_DGTL_GAIN_STEP		1
 #define IMX355_DGTL_GAIN_DEFAULT	256
 
 /* Test Pattern Control */
-#define IMX355_REG_TEST_PATTERN		0x0600
+#define IMX355_REG_TEST_PATTERN		CCI_REG16(0x0600)
 #define IMX355_TEST_PATTERN_DISABLED		0
 #define IMX355_TEST_PATTERN_SOLID_COLOR		1
 #define IMX355_TEST_PATTERN_COLOR_BARS		2
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
-#define IMX355_REG_BINNING_MODE		0x0900
-#define IMX355_REG_BINNING_TYPE		0x0901
-#define IMX355_REG_BINNING_WEIGHTING	0x0902
+#define IMX355_REG_BINNING_MODE		CCI_REG8(0x0900)
+#define IMX355_REG_BINNING_TYPE		CCI_REG8(0x0901)
+#define IMX355_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
 
 /* Flip Control */
-#define IMX355_REG_ORIENTATION		0x0101
+#define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
@@ -91,14 +93,9 @@
 #define IMX355_PIXEL_ARRAY_WIDTH	3280
 #define IMX355_PIXEL_ARRAY_HEIGHT	2464
 
-struct imx355_reg {
-	u16 address;
-	u8 val;
-};
-
 struct imx355_reg_list {
 	u32 num_of_regs;
-	const struct imx355_reg *regs;
+	const struct cci_reg_sequence *regs;
 };
 
 /* Mode : resolution and related config&values */
@@ -149,6 +146,7 @@ struct imx355_hwcfg {
 struct imx355 {
 	struct device *dev;
 	struct clk *clk;
+	struct regmap *regmap;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -185,155 +183,150 @@ static const struct regulator_bulk_data imx355_supplies[] = {
 	{ .supply = "dovdd" },
 };
 
-static const struct imx355_reg imx355_global_regs[] = {
-	{ 0x304e, 0x03 },
-	{ 0x4348, 0x16 },
-	{ 0x4350, 0x19 },
-	{ 0x4408, 0x0a },
-	{ 0x440c, 0x0b },
-	{ 0x4411, 0x5f },
-	{ 0x4412, 0x2c },
-	{ 0x4623, 0x00 },
-	{ 0x462c, 0x0f },
-	{ 0x462d, 0x00 },
-	{ 0x462e, 0x00 },
-	{ 0x4684, 0x54 },
-	{ 0x480a, 0x07 },
-	{ 0x4908, 0x07 },
-	{ 0x4909, 0x07 },
-	{ 0x490d, 0x0a },
-	{ 0x491e, 0x0f },
-	{ 0x4921, 0x06 },
-	{ 0x4923, 0x28 },
-	{ 0x4924, 0x28 },
-	{ 0x4925, 0x29 },
-	{ 0x4926, 0x29 },
-	{ 0x4927, 0x1f },
-	{ 0x4928, 0x20 },
-	{ 0x4929, 0x20 },
-	{ 0x492a, 0x20 },
-	{ 0x492c, 0x05 },
-	{ 0x492d, 0x06 },
-	{ 0x492e, 0x06 },
-	{ 0x492f, 0x06 },
-	{ 0x4930, 0x03 },
-	{ 0x4931, 0x04 },
-	{ 0x4932, 0x04 },
-	{ 0x4933, 0x05 },
-	{ 0x595e, 0x01 },
-	{ 0x5963, 0x01 },
-	{ 0x3030, 0x01 },
-	{ 0x3031, 0x01 },
-	{ 0x3045, 0x01 },
-	{ 0x4010, 0x00 },
-	{ 0x4011, 0x00 },
-	{ 0x4012, 0x00 },
-	{ 0x4013, 0x01 },
-	{ 0x68a8, 0xfe },
-	{ 0x68a9, 0xff },
-	{ 0x6888, 0x00 },
-	{ 0x6889, 0x00 },
-	{ 0x68b0, 0x00 },
-	{ 0x3058, 0x00 },
-	{ 0x305a, 0x00 },
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
+static const struct cci_reg_sequence imx355_global_regs[] = {
+	{ CCI_REG8(0x304e), 0x03 },
+	{ CCI_REG8(0x4348), 0x16 },
+	{ CCI_REG8(0x4350), 0x19 },
+	{ CCI_REG8(0x4408), 0x0a },
+	{ CCI_REG8(0x440c), 0x0b },
+	{ CCI_REG8(0x4411), 0x5f },
+	{ CCI_REG8(0x4412), 0x2c },
+	{ CCI_REG8(0x4623), 0x00 },
+	{ CCI_REG8(0x462c), 0x0f },
+	{ CCI_REG8(0x462d), 0x00 },
+	{ CCI_REG8(0x462e), 0x00 },
+	{ CCI_REG8(0x4684), 0x54 },
+	{ CCI_REG8(0x480a), 0x07 },
+	{ CCI_REG8(0x4908), 0x07 },
+	{ CCI_REG8(0x4909), 0x07 },
+	{ CCI_REG8(0x490d), 0x0a },
+	{ CCI_REG8(0x491e), 0x0f },
+	{ CCI_REG8(0x4921), 0x06 },
+	{ CCI_REG8(0x4923), 0x28 },
+	{ CCI_REG8(0x4924), 0x28 },
+	{ CCI_REG8(0x4925), 0x29 },
+	{ CCI_REG8(0x4926), 0x29 },
+	{ CCI_REG8(0x4927), 0x1f },
+	{ CCI_REG8(0x4928), 0x20 },
+	{ CCI_REG8(0x4929), 0x20 },
+	{ CCI_REG8(0x492a), 0x20 },
+	{ CCI_REG8(0x492c), 0x05 },
+	{ CCI_REG8(0x492d), 0x06 },
+	{ CCI_REG8(0x492e), 0x06 },
+	{ CCI_REG8(0x492f), 0x06 },
+	{ CCI_REG8(0x4930), 0x03 },
+	{ CCI_REG8(0x4931), 0x04 },
+	{ CCI_REG8(0x4932), 0x04 },
+	{ CCI_REG8(0x4933), 0x05 },
+	{ CCI_REG8(0x595e), 0x01 },
+	{ CCI_REG8(0x5963), 0x01 },
+	{ CCI_REG8(0x3030), 0x01 },
+	{ CCI_REG8(0x3031), 0x01 },
+	{ CCI_REG8(0x3045), 0x01 },
+	{ CCI_REG8(0x4010), 0x00 },
+	{ CCI_REG8(0x4011), 0x00 },
+	{ CCI_REG8(0x4012), 0x00 },
+	{ CCI_REG8(0x4013), 0x01 },
+	{ CCI_REG8(0x68a8), 0xfe },
+	{ CCI_REG8(0x68a9), 0xff },
+	{ CCI_REG8(0x6888), 0x00 },
+	{ CCI_REG8(0x6889), 0x00 },
+	{ CCI_REG8(0x68b0), 0x00 },
+	{ CCI_REG8(0x3058), 0x00 },
+	{ CCI_REG8(0x305a), 0x00 },
+	{ CCI_REG8(0x0112), 0x0a },
+	{ CCI_REG8(0x0113), 0x0a },
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0301), 0x05 },
+	{ CCI_REG8(0x0303), 0x01 },
+	{ CCI_REG8(0x0305), 0x02 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0x78 },
+	{ CCI_REG8(0x030b), 0x01 },
+	{ CCI_REG8(0x030d), 0x02 },
+	{ CCI_REG8(0x0310), 0x00 },
+	{ CCI_REG8(0x0220), 0x00 },
+	{ CCI_REG8(0x0222), 0x01 },
+	{ CCI_REG8(0x0820), 0x0b },
+	{ CCI_REG8(0x0821), 0x40 },
+	{ CCI_REG8(0x3088), 0x04 },
+	{ CCI_REG8(0x6813), 0x02 },
+	{ CCI_REG8(0x6835), 0x07 },
+	{ CCI_REG8(0x6836), 0x01 },
+	{ CCI_REG8(0x6837), 0x04 },
+	{ CCI_REG8(0x684d), 0x07 },
+	{ CCI_REG8(0x684e), 0x01 },
+	{ CCI_REG8(0x684f), 0x04 },
 };
 
-static const struct imx355_reg_list imx355_global_setting = {
-	.num_of_regs = ARRAY_SIZE(imx355_global_regs),
-	.regs = imx355_global_regs,
+static const struct cci_reg_sequence mode_3268x2448_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_3264x2448_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_3280x2464_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1940x1096_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1936x1096_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1924x1080_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1920x1080_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1640x1232_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1640x922_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1300x736_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1296x736_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1284x720_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
+static const struct cci_reg_sequence mode_1280x720_regs[] = {
+	{ CCI_REG8(0x0700), 0x00 },
+	{ CCI_REG8(0x0701), 0x10 },
 };
 
-static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0700, 0x00 },
-	{ 0x0701, 0x10 },
-};
-
-static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0700, 0x02 },
-	{ 0x0701, 0x78 },
+static const struct cci_reg_sequence mode_820x616_regs[] = {
+	{ CCI_REG8(0x0700), 0x02 },
+	{ CCI_REG8(0x0701), 0x78 },
 };
 
 static const char * const imx355_test_pattern_menu[] = {
@@ -604,78 +597,6 @@ static u32 imx355_get_format_code(struct imx355 *imx355)
 	return code;
 }
 
-/* Read registers up to 4 at a time */
-static int imx355_read_reg(struct imx355 *imx355, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
-	struct i2c_msg msgs[2];
-	u8 addr_buf[2];
-	u8 data_buf[4] = { 0 };
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-/* Write registers up to 4 at a time */
-static int imx355_write_reg(struct imx355 *imx355, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
-	u8 buf[6];
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/* Write a list of registers */
-static int imx355_write_regs(struct imx355 *imx355,
-			     const struct imx355_reg *regs, u32 len)
-{
-	int ret;
-	u32 i;
-
-	for (i = 0; i < len; i++) {
-		ret = imx355_write_reg(imx355, regs[i].address, 1, regs[i].val);
-		if (ret) {
-			dev_err_ratelimited(imx355->dev,
-					    "write reg 0x%4.4x return err %d",
-					    regs[i].address, ret);
-
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 /* Open sub-device */
 static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
@@ -727,31 +648,31 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
 		/* Analog gain = 1024/(1024 - ctrl->val) times */
-		ret = imx355_write_reg(imx355, IMX355_REG_ANALOG_GAIN, 2,
-				       ctrl->val);
+		ret = cci_write(imx355->regmap, IMX355_REG_ANALOG_GAIN,
+				ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = imx355_write_reg(imx355, IMX355_REG_DIG_GAIN_GLOBAL, 2,
-				       ctrl->val);
+		ret = cci_write(imx355->regmap, IMX355_REG_DIG_GAIN_GLOBAL,
+				ctrl->val, NULL);
 		break;
 	case V4L2_CID_EXPOSURE:
-		ret = imx355_write_reg(imx355, IMX355_REG_EXPOSURE, 2,
-				       ctrl->val);
+		ret = cci_write(imx355->regmap, IMX355_REG_EXPOSURE,
+				ctrl->val, NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
-		ret = imx355_write_reg(imx355, IMX355_REG_FLL, 2,
-				       imx355->cur_mode->height + ctrl->val);
+		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
+				imx355->cur_mode->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = imx355_write_reg(imx355, IMX355_REG_TEST_PATTERN,
-				       2, ctrl->val);
+		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
+				ctrl->val, NULL);
 		break;
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
-		ret = imx355_write_reg(imx355, IMX355_REG_ORIENTATION, 1,
-				       imx355->hflip->val |
-				       imx355->vflip->val << 1);
+		ret = cci_write(imx355->regmap, IMX355_REG_ORIENTATION,
+				imx355->hflip->val | imx355->vflip->val << 1,
+				NULL);
 		break;
 	default:
 		ret = -EINVAL;
@@ -957,100 +878,64 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
 	u8 binning_mode;
-	int ret;
+	int ret = 0;
 
 	/* Global Setting */
-	reg_list = &imx355_global_setting;
-	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
-	if (ret) {
-		dev_err(imx355->dev, "failed to set global settings");
-		return ret;
-	}
+	cci_multi_reg_write(imx355->regmap, imx355_global_regs,
+			    ARRAY_SIZE(imx355_global_regs), &ret);
 
 	/* Apply default values of current mode */
 	mode = imx355->cur_mode;
 	reg_list = &mode->reg_list;
-	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
-	if (ret) {
-		dev_err(imx355->dev, "failed to set mode");
-		return ret;
-	}
+	cci_multi_reg_write(imx355->regmap, reg_list->regs,
+			    reg_list->num_of_regs, &ret);
 
 	/* Set readout crop and size registers  */
-	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_START, 2,
-			       mode->crop.left);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
-			       mode->crop.top);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
-			       mode->crop.width + mode->crop.left - 1);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
-			       mode->crop.height + mode->crop.top - 1);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
-			       mode->width);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
-			       mode->height);
-	if (ret)
-		return ret;
+	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, mode->crop.left,
+		  &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, mode->crop.top, &ret);
+	cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
+		  mode->crop.width + mode->crop.left - 1, &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
+		  mode->crop.height + mode->crop.top - 1, &ret);
+	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, mode->width, &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, mode->height, &ret);
 
 	binning_mode = ((mode->crop.width / mode->width) << 4) |
 			(mode->crop.height / mode->height);
-	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
-			       binning_mode == 0x11 ? 0x00 : 0x01);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_TYPE, 1,
-			       binning_mode);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_WEIGHTING, 1, 0x00);
-	if (ret)
-		return ret;
+	cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
+		  binning_mode == 0x11 ? 0x00 : 0x01, &ret);
+	cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode, &ret);
+	cci_write(imx355->regmap, IMX355_REG_BINNING_WEIGHTING, 0x00, &ret);
 
 	/* Set PLL registers for the external clock frequency */
-	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
-			       imx355->clk_params->extclk_freq);
-	if (ret)
-		return ret;
-	ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
-			       imx355->clk_params->pll_op_mpy);
-	if (ret)
-		return ret;
+	cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
+		  imx355->clk_params->extclk_freq, &ret);
+	cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
+		  imx355->clk_params->pll_op_mpy, &ret);
 
 	/* set digital gain control to all color mode */
-	ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
-	if (ret)
-		return ret;
+	cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
 
 	/* set line length */
-	ret = imx355_write_reg(imx355, IMX355_REG_LLP, 2,
-			       imx355->hblank->val + imx355->cur_mode->width);
-	if (ret)
-		return ret;
+	cci_write(imx355->regmap, IMX355_REG_LLP,
+		  imx355->hblank->val + imx355->cur_mode->width, &ret);
 
 	/* Apply customized values from user */
-	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
-	if (ret)
-		return ret;
+	if (!ret)
+		ret = __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
+
+	cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_STREAMING,
+		  &ret);
 
-	return imx355_write_reg(imx355, IMX355_REG_MODE_SELECT,
-				1, IMX355_MODE_STREAMING);
+	return ret;
 }
 
 /* Stop streaming */
 static int imx355_stop_streaming(struct imx355 *imx355)
 {
-	return imx355_write_reg(imx355, IMX355_REG_MODE_SELECT,
-				1, IMX355_MODE_STANDBY);
+	return cci_write(imx355->regmap, IMX355_REG_MODE_SELECT,
+			 IMX355_MODE_STANDBY, NULL);
 }
 
 static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
@@ -1097,14 +982,14 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 static int imx355_identify_module(struct imx355 *imx355)
 {
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = imx355_read_reg(imx355, IMX355_REG_CHIP_ID, 2, &val);
+	ret = cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != IMX355_CHIP_ID) {
-		dev_err(imx355->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx355->dev, "chip id mismatch: %x!=%llx",
 			IMX355_CHIP_ID, val);
 		return -EIO;
 	}
@@ -1351,6 +1236,11 @@ static int imx355_probe(struct i2c_client *client)
 
 	mutex_init(&imx355->mutex);
 
+	imx355->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx355->regmap))
+		return dev_err_probe(imx355->dev, PTR_ERR(imx355->regmap),
+				     "Unable to initialize I2C\n");
+
 	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
 	if (IS_ERR(imx355->clk))
 		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),

-- 
2.34.1


