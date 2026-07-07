Return-Path: <linux-media+bounces-66889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wiOtOm8zTWoLwgEAu9opvQ
	(envelope-from <linux-media+bounces-66889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE271E294
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Zm9U9xGQ;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66889-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66889-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5970A3028C05
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88C7478E38;
	Tue,  7 Jul 2026 17:06:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246443D518
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443991; cv=none; b=rU7yYvp3PRIhhwNtIEzJVuBYk9FxmFKc/YkMMmqU7HN4a+00nio4896zKPf8ITB3qY6D2yR5XBBv5GSPz+9rinc3LsRzdrcdir7YdUGR2pPg8zyOoXn4PpwjsfKmCMxrtL413kAjp3ErsN9U+aPeKuBWnEFScPl6lXTUmrUYPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443991; c=relaxed/simple;
	bh=g51ENC5J06DK4rgql1jO19m6FFuuHFPm0QsA7BL8g9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcXIYTyh0pkhXqT+BhlZKo8ke1t7dwTE+AJiojfHr30v6Eb8+03lKBEwCg8XP+i3IEMXG2hyn8dVdHVSZfQgnWJjrhxiK+f2BB9G6CPztDwmfcdudfEU0mVH3b2uaW1D25Qn9yLejTy+viiNrI0V3R/I+NW3r5aHRKnIJIiW15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Zm9U9xGQ; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c7902f47so27682765e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443986; x=1784048786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YyNM8N0NzaF1wojxz+5JwoUsq8961CdIep5LktXX9E=;
        b=Zm9U9xGQMjFDi1wW0XWUH8wudBtJPF3jTsqUQ+mKt4R4/koDDx8boWnavID6Jko3DQ
         YFSAKbpowx14P0/4HswYNFp5xwgYDwwCYFqlFn62hqUK+k3b5ovg5QBxJkgKqrqZltkP
         3wj28pH+AZtMfNRDu9QC9vHshvYFkf4er8O3rNgrn6OUAoIg4fj+XTuTjxQxhsT40G/U
         ZWalk81iXWguqguCZwrzFHNUr55Mqpmn1D31uJvTE1cC7JV5y8LRKtuEv532u9shAzDd
         08D1Bobh8JRjUTXZ9c5165pnH9gsw61+JewWKsWZwGNNA+KmpIENlu18G6mjQ3+Avq3Q
         c8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443986; x=1784048786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2YyNM8N0NzaF1wojxz+5JwoUsq8961CdIep5LktXX9E=;
        b=BgxEaN5LCrovxRI0DmnJb4ao+flgXpn9Pq2IRlaMKl0s/kb4eL5gWH0Bzye43Y9ohN
         yc2Lwm8CbN+8eGchcu6wdclyaINGhV09UPbzifQfFr1KwOpV1VlJALnCg4ftw/hvSuo/
         6wboZcFhu+zxWdCqc9wkU0iBYc3UNzNhGph1tQ6rYliGwLpp7Bq7ztri6Ysub21+lLFE
         jG2pkF6nda8gUvm0c2dpcnP4Cg1+PudS4LC7v4odHHZvFvhe9YMEO3i/5oyXyxJbLnJ7
         za3rbVKVYsak9Rm7rshM2PJ6FjjQYlistMCMyZJ0lzQP5UTYYsZ3FNq4OlPZ7mnJSCJB
         jZXg==
X-Gm-Message-State: AOJu0YxNmIv5kerAyYrtfXolSUjg3LGLxQvtx1UsUWi+MaeACU4+Smcq
	MWMEP9whDLfI/5d+JQxoqkESiepaHEugtklmxGYe+IcbP1TVPHtH29GG7cfpwROQHL7GzgFlDcK
	lt7vu
X-Gm-Gg: AfdE7cnOedNM7kwfWu3orvxE8cbRS30H7W3c8DheWvAp3rdDCl8E3F9QoLzvcOFMpqO
	31oMvxCK4OhOgu6P9w8mDr/AMPqc0E3Hhk/6Ha2eRhCGskvJNdkiZJHMlHJ8RgL684uPZ7j1H9C
	ZuMsOhvCXLC9s4aPX1zS3Qkteniy204OHy85gE7INO7PcWlClLyWK5+h05K8XICmy2XsfpHInCj
	45h1NMESQDdv9XxumVTE8KbrAdzMn1IAEN+PimmXwMZIthYIvxZI0ziVvik2NZ31MLNaOs+z86+
	7qrLIdkR5sZleGC9f2lWKl44kX5GSSd9PrPJAUh0035qY+cUUpdDgXfyZL8c+GXD4DaoDVMdVla
	ZlIrCiKUXz7VEeeyllxfPl8owcNpVMehamXCiIFGaKIBVI1xf8muNw0J7Akn3f8VWCz/fRnEVIK
	RhtDyvZI7rAgMbwgtH2bddeGiTwEPGRudfdPUQTdYgqiC7TzqOtBtV38TN8ov/xdAXqr9Fu+/ex
	8I=
X-Received: by 2002:a05:600c:19d1:b0:493:cc25:85c4 with SMTP id 5b1f17b1804b1-493df1c98fbmr56224895e9.8.1783443986435;
        Tue, 07 Jul 2026 10:06:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:45 +0100
Subject: [PATCH v2 13/20] media: imx355: Convert to new CCI register access
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-13-1683ec07b897@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-66889-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DFE271E294

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
index c7a24c69c0df..c710dda5795b 100644
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
+#define IMX355_REG_TEST_PATTERN		CCI_REG8(0x0600)
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
@@ -185,154 +183,149 @@ static const struct regulator_bulk_data imx355_supplies[] = {
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
+	{ CCI_REG8(0x0305), 0x00 },
+	{ CCI_REG8(0x0306), 0x78 },
+	{ CCI_REG8(0x0307), 0x02 },
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
@@ -603,78 +596,6 @@ static u32 imx355_get_format_code(struct imx355 *imx355)
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
@@ -726,31 +647,31 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -949,101 +870,64 @@ static int imx355_start_streaming(struct imx355 *imx355)
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
-	ret = imx355_write_reg(imx355, IMX355_REG_LLP,
-			       imx355->hblank->val + imx355->cur_mode->width,
-			       2);
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
 
-	return imx355_write_reg(imx355, IMX355_REG_MODE_SELECT,
-				1, IMX355_MODE_STREAMING);
+	cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_STREAMING,
+		  &ret);
+
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
@@ -1090,14 +974,14 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
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
@@ -1344,6 +1228,12 @@ static int imx355_probe(struct i2c_client *client)
 
 	mutex_init(&imx355->mutex);
 
+	imx355->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx355->regmap)) {
+		dev_err(imx355->dev, "Unable to initialize I2C\n");
+		return -ENODEV;
+	}
+
 	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
 	if (IS_ERR(imx355->clk))
 		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),

-- 
2.34.1


