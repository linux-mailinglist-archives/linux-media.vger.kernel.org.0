Return-Path: <linux-media+bounces-17410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A445968F4B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685E71C2260A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFB718893E;
	Mon,  2 Sep 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+lk9f0h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0816187357;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=E4IzNUG0JyVQBiDD/5tA2xh103LplETmW/6jBeEdiO7CNv5K2ZUQQc2jLZq9BdxpJP5I3RdmT62NhcF0xrkW2A0YT2vTXUSNUu1SQPCowBiLSD1TbEV/5xbyTqu7YvbY+NU5z2jYFrcz6v2HFVekh6zOjwpYbdCOCgfdp0BnUSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=3Zl1tNYzP4cHMVoppmRfZMxeJsK2qq0e6KpPHVUT2+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iedV8nU3IYKufOxJTeHGHQqcETLXeG8nPhScoCrbYYah4E7YT1dHyCw+pisaOeZ9VXpU92t8no6uo5STadLp57mf4BJJ4fp2s55oIByFjhhxBY4g9YXdaZrBp8O2ob2gmTqmj4rVMe4yLY7vJtDxWexnL+K1KJTa7+Das7PtxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+lk9f0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79633C4CECD;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=3Zl1tNYzP4cHMVoppmRfZMxeJsK2qq0e6KpPHVUT2+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t+lk9f0hqYunrnsxvk77/qY2fKFHJRpwbGx7MDT/uR2h4by2jD5S12ehB8fyLn3vi
	 TAI2BYVOhLX+FsYszNmZ40aCtvLVXA9ycpOR2ZEj0jwhDFXcOSQlSXzyfYCC/u7Yqf
	 ufp26ft8N25LE0j45cbpAD4Yr+n//Ih9HIAFtLiQpm7E+zW4WMRARWM5KsBUHF1kF/
	 YlLaAPNNhk3FW5FjFyfTaSSmYDjQZL0ACwy374ustSOnP2nCHOmUV/H40iVRKbZzrF
	 /J/ZVjqwNTwDHLrZHAdt852NYwZwIgfdyKuDRLYorJAvhqcIpuJJcX+3fqUrApHUGH
	 Vq++Xr29sxDQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F69ECD342D;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:31 +0200
Subject: [PATCH 04/13] media: i2c: imx214: Convert to CCI register access
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-4-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=20816;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=sPwwkSbvHSrTFnKBg3TPH4YupMnP50c97F4n9oEaFnE=;
 b=xOB9jgTgFOzNA5Z3VQfP63mT21lkVUgIvjLtm8RY8fqGAQI8XOMi/1wK8bQFOKCgHA9RnsR+w
 ZOsFvKt7Ll3DbzP+PhztD89zD4P4afvMggzUTmuV0ANrwI8OMygtG2u
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Use the new common CCI register access helpers to replace the private
register access helpers in the imx214 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx214.c | 672 +++++++++++++++++++++------------------------
 2 files changed, 310 insertions(+), 363 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8ba096b8ebca..85ecb2aeefdb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -140,6 +140,7 @@ config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB
 	select REGMAP_I2C
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX214 camera.
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index ad2f1db6baeb..780c9b8f88b0 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -15,11 +15,12 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <media/media-entity.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define IMX214_REG_MODE_SELECT		0x0100
+#define IMX214_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define IMX214_MODE_STANDBY		0x00
 #define IMX214_MODE_STREAMING		0x01
 
@@ -30,7 +31,7 @@
 #define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
 
 /* Exposure control */
-#define IMX214_REG_EXPOSURE		0x0202
+#define IMX214_REG_EXPOSURE		CCI_REG16(0x0202)
 #define IMX214_EXPOSURE_MIN		0
 #define IMX214_EXPOSURE_MAX		3184
 #define IMX214_EXPOSURE_STEP		1
@@ -73,345 +74,324 @@ struct imx214 {
 	struct gpio_desc *enable_gpio;
 };
 
-struct reg_8 {
-	u16 addr;
-	u8 val;
-};
-
-enum {
-	IMX214_TABLE_WAIT_MS = 0,
-	IMX214_TABLE_END,
-	IMX214_MAX_RETRIES,
-	IMX214_WAIT_MS
-};
-
 /*From imx214_mode_tbls.h*/
-static const struct reg_8 mode_4096x2304[] = {
-	{0x0114, 0x03},
-	{0x0220, 0x00},
-	{0x0221, 0x11},
-	{0x0222, 0x01},
-	{0x0340, 0x0C},
-	{0x0341, 0x7A},
-	{0x0342, 0x13},
-	{0x0343, 0x90},
-	{0x0344, 0x00},
-	{0x0345, 0x38},
-	{0x0346, 0x01},
-	{0x0347, 0x98},
-	{0x0348, 0x10},
-	{0x0349, 0x37},
-	{0x034A, 0x0A},
-	{0x034B, 0x97},
-	{0x0381, 0x01},
-	{0x0383, 0x01},
-	{0x0385, 0x01},
-	{0x0387, 0x01},
-	{0x0900, 0x00},
-	{0x0901, 0x00},
-	{0x0902, 0x00},
-	{0x3000, 0x35},
-	{0x3054, 0x01},
-	{0x305C, 0x11},
-
-	{0x0112, 0x0A},
-	{0x0113, 0x0A},
-	{0x034C, 0x10},
-	{0x034D, 0x00},
-	{0x034E, 0x09},
-	{0x034F, 0x00},
-	{0x0401, 0x00},
-	{0x0404, 0x00},
-	{0x0405, 0x10},
-	{0x0408, 0x00},
-	{0x0409, 0x00},
-	{0x040A, 0x00},
-	{0x040B, 0x00},
-	{0x040C, 0x10},
-	{0x040D, 0x00},
-	{0x040E, 0x09},
-	{0x040F, 0x00},
-
-	{0x0301, 0x05},
-	{0x0303, 0x02},
-	{0x0305, 0x03},
-	{0x0306, 0x00},
-	{0x0307, 0x96},
-	{0x0309, 0x0A},
-	{0x030B, 0x01},
-	{0x0310, 0x00},
-
-	{0x0820, 0x12},
-	{0x0821, 0xC0},
-	{0x0822, 0x00},
-	{0x0823, 0x00},
-
-	{0x3A03, 0x09},
-	{0x3A04, 0x50},
-	{0x3A05, 0x01},
-
-	{0x0B06, 0x01},
-	{0x30A2, 0x00},
-
-	{0x30B4, 0x00},
-
-	{0x3A02, 0xFF},
-
-	{0x3011, 0x00},
-	{0x3013, 0x01},
-
-	{0x0202, 0x0C},
-	{0x0203, 0x70},
-	{0x0224, 0x01},
-	{0x0225, 0xF4},
-
-	{0x0204, 0x00},
-	{0x0205, 0x00},
-	{0x020E, 0x01},
-	{0x020F, 0x00},
-	{0x0210, 0x01},
-	{0x0211, 0x00},
-	{0x0212, 0x01},
-	{0x0213, 0x00},
-	{0x0214, 0x01},
-	{0x0215, 0x00},
-	{0x0216, 0x00},
-	{0x0217, 0x00},
-
-	{0x4170, 0x00},
-	{0x4171, 0x10},
-	{0x4176, 0x00},
-	{0x4177, 0x3C},
-	{0xAE20, 0x04},
-	{0xAE21, 0x5C},
-
-	{IMX214_TABLE_WAIT_MS, 10},
-	{0x0138, 0x01},
-	{IMX214_TABLE_END, 0x00}
+static const struct cci_reg_sequence mode_4096x2304[] = {
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0220), 0x00 },
+	{ CCI_REG8(0x0221), 0x11 },
+	{ CCI_REG8(0x0222), 0x01 },
+	{ CCI_REG8(0x0340), 0x0C },
+	{ CCI_REG8(0x0341), 0x7A },
+	{ CCI_REG8(0x0342), 0x13 },
+	{ CCI_REG8(0x0343), 0x90 },
+	{ CCI_REG8(0x0344), 0x00 },
+	{ CCI_REG8(0x0345), 0x38 },
+	{ CCI_REG8(0x0346), 0x01 },
+	{ CCI_REG8(0x0347), 0x98 },
+	{ CCI_REG8(0x0348), 0x10 },
+	{ CCI_REG8(0x0349), 0x37 },
+	{ CCI_REG8(0x034A), 0x0A },
+	{ CCI_REG8(0x034B), 0x97 },
+	{ CCI_REG8(0x0381), 0x01 },
+	{ CCI_REG8(0x0383), 0x01 },
+	{ CCI_REG8(0x0385), 0x01 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ CCI_REG8(0x0900), 0x00 },
+	{ CCI_REG8(0x0901), 0x00 },
+	{ CCI_REG8(0x0902), 0x00 },
+	{ CCI_REG8(0x3000), 0x35 },
+	{ CCI_REG8(0x3054), 0x01 },
+	{ CCI_REG8(0x305C), 0x11 },
+
+	{ CCI_REG8(0x0112), 0x0A },
+	{ CCI_REG8(0x0113), 0x0A },
+	{ CCI_REG8(0x034C), 0x10 },
+	{ CCI_REG8(0x034D), 0x00 },
+	{ CCI_REG8(0x034E), 0x09 },
+	{ CCI_REG8(0x034F), 0x00 },
+	{ CCI_REG8(0x0401), 0x00 },
+	{ CCI_REG8(0x0404), 0x00 },
+	{ CCI_REG8(0x0405), 0x10 },
+	{ CCI_REG8(0x0408), 0x00 },
+	{ CCI_REG8(0x0409), 0x00 },
+	{ CCI_REG8(0x040A), 0x00 },
+	{ CCI_REG8(0x040B), 0x00 },
+	{ CCI_REG8(0x040C), 0x10 },
+	{ CCI_REG8(0x040D), 0x00 },
+	{ CCI_REG8(0x040E), 0x09 },
+	{ CCI_REG8(0x040F), 0x00 },
+
+	{ CCI_REG8(0x0301), 0x05 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x03 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0x96 },
+	{ CCI_REG8(0x0309), 0x0A },
+	{ CCI_REG8(0x030B), 0x01 },
+	{ CCI_REG8(0x0310), 0x00 },
+
+	{ CCI_REG8(0x0820), 0x12 },
+	{ CCI_REG8(0x0821), 0xC0 },
+	{ CCI_REG8(0x0822), 0x00 },
+	{ CCI_REG8(0x0823), 0x00 },
+
+	{ CCI_REG8(0x3A03), 0x09 },
+	{ CCI_REG8(0x3A04), 0x50 },
+	{ CCI_REG8(0x3A05), 0x01 },
+
+	{ CCI_REG8(0x0B06), 0x01 },
+	{ CCI_REG8(0x30A2), 0x00 },
+
+	{ CCI_REG8(0x30B4), 0x00 },
+
+	{ CCI_REG8(0x3A02), 0xFF },
+
+	{ CCI_REG8(0x3011), 0x00 },
+	{ CCI_REG8(0x3013), 0x01 },
+
+	{ CCI_REG8(0x0202), 0x0C },
+	{ CCI_REG8(0x0203), 0x70 },
+	{ CCI_REG8(0x0224), 0x01 },
+	{ CCI_REG8(0x0225), 0xF4 },
+
+	{ CCI_REG8(0x0204), 0x00 },
+	{ CCI_REG8(0x0205), 0x00 },
+	{ CCI_REG8(0x020E), 0x01 },
+	{ CCI_REG8(0x020F), 0x00 },
+	{ CCI_REG8(0x0210), 0x01 },
+	{ CCI_REG8(0x0211), 0x00 },
+	{ CCI_REG8(0x0212), 0x01 },
+	{ CCI_REG8(0x0213), 0x00 },
+	{ CCI_REG8(0x0214), 0x01 },
+	{ CCI_REG8(0x0215), 0x00 },
+	{ CCI_REG8(0x0216), 0x00 },
+	{ CCI_REG8(0x0217), 0x00 },
+
+	{ CCI_REG8(0x4170), 0x00 },
+	{ CCI_REG8(0x4171), 0x10 },
+	{ CCI_REG8(0x4176), 0x00 },
+	{ CCI_REG8(0x4177), 0x3C },
+	{ CCI_REG8(0xAE20), 0x04 },
+	{ CCI_REG8(0xAE21), 0x5C },
 };
 
-static const struct reg_8 mode_1920x1080[] = {
-	{0x0114, 0x03},
-	{0x0220, 0x00},
-	{0x0221, 0x11},
-	{0x0222, 0x01},
-	{0x0340, 0x0C},
-	{0x0341, 0x7A},
-	{0x0342, 0x13},
-	{0x0343, 0x90},
-	{0x0344, 0x04},
-	{0x0345, 0x78},
-	{0x0346, 0x03},
-	{0x0347, 0xFC},
-	{0x0348, 0x0B},
-	{0x0349, 0xF7},
-	{0x034A, 0x08},
-	{0x034B, 0x33},
-	{0x0381, 0x01},
-	{0x0383, 0x01},
-	{0x0385, 0x01},
-	{0x0387, 0x01},
-	{0x0900, 0x00},
-	{0x0901, 0x00},
-	{0x0902, 0x00},
-	{0x3000, 0x35},
-	{0x3054, 0x01},
-	{0x305C, 0x11},
-
-	{0x0112, 0x0A},
-	{0x0113, 0x0A},
-	{0x034C, 0x07},
-	{0x034D, 0x80},
-	{0x034E, 0x04},
-	{0x034F, 0x38},
-	{0x0401, 0x00},
-	{0x0404, 0x00},
-	{0x0405, 0x10},
-	{0x0408, 0x00},
-	{0x0409, 0x00},
-	{0x040A, 0x00},
-	{0x040B, 0x00},
-	{0x040C, 0x07},
-	{0x040D, 0x80},
-	{0x040E, 0x04},
-	{0x040F, 0x38},
-
-	{0x0301, 0x05},
-	{0x0303, 0x02},
-	{0x0305, 0x03},
-	{0x0306, 0x00},
-	{0x0307, 0x96},
-	{0x0309, 0x0A},
-	{0x030B, 0x01},
-	{0x0310, 0x00},
-
-	{0x0820, 0x12},
-	{0x0821, 0xC0},
-	{0x0822, 0x00},
-	{0x0823, 0x00},
-
-	{0x3A03, 0x04},
-	{0x3A04, 0xF8},
-	{0x3A05, 0x02},
-
-	{0x0B06, 0x01},
-	{0x30A2, 0x00},
-
-	{0x30B4, 0x00},
-
-	{0x3A02, 0xFF},
-
-	{0x3011, 0x00},
-	{0x3013, 0x01},
-
-	{0x0202, 0x0C},
-	{0x0203, 0x70},
-	{0x0224, 0x01},
-	{0x0225, 0xF4},
-
-	{0x0204, 0x00},
-	{0x0205, 0x00},
-	{0x020E, 0x01},
-	{0x020F, 0x00},
-	{0x0210, 0x01},
-	{0x0211, 0x00},
-	{0x0212, 0x01},
-	{0x0213, 0x00},
-	{0x0214, 0x01},
-	{0x0215, 0x00},
-	{0x0216, 0x00},
-	{0x0217, 0x00},
-
-	{0x4170, 0x00},
-	{0x4171, 0x10},
-	{0x4176, 0x00},
-	{0x4177, 0x3C},
-	{0xAE20, 0x04},
-	{0xAE21, 0x5C},
-
-	{IMX214_TABLE_WAIT_MS, 10},
-	{0x0138, 0x01},
-	{IMX214_TABLE_END, 0x00}
+static const struct cci_reg_sequence mode_1920x1080[] = {
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0220), 0x00 },
+	{ CCI_REG8(0x0221), 0x11 },
+	{ CCI_REG8(0x0222), 0x01 },
+	{ CCI_REG8(0x0340), 0x0C },
+	{ CCI_REG8(0x0341), 0x7A },
+	{ CCI_REG8(0x0342), 0x13 },
+	{ CCI_REG8(0x0343), 0x90 },
+	{ CCI_REG8(0x0344), 0x04 },
+	{ CCI_REG8(0x0345), 0x78 },
+	{ CCI_REG8(0x0346), 0x03 },
+	{ CCI_REG8(0x0347), 0xFC },
+	{ CCI_REG8(0x0348), 0x0B },
+	{ CCI_REG8(0x0349), 0xF7 },
+	{ CCI_REG8(0x034A), 0x08 },
+	{ CCI_REG8(0x034B), 0x33 },
+	{ CCI_REG8(0x0381), 0x01 },
+	{ CCI_REG8(0x0383), 0x01 },
+	{ CCI_REG8(0x0385), 0x01 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ CCI_REG8(0x0900), 0x00 },
+	{ CCI_REG8(0x0901), 0x00 },
+	{ CCI_REG8(0x0902), 0x00 },
+	{ CCI_REG8(0x3000), 0x35 },
+	{ CCI_REG8(0x3054), 0x01 },
+	{ CCI_REG8(0x305C), 0x11 },
+
+	{ CCI_REG8(0x0112), 0x0A },
+	{ CCI_REG8(0x0113), 0x0A },
+	{ CCI_REG8(0x034C), 0x07 },
+	{ CCI_REG8(0x034D), 0x80 },
+	{ CCI_REG8(0x034E), 0x04 },
+	{ CCI_REG8(0x034F), 0x38 },
+	{ CCI_REG8(0x0401), 0x00 },
+	{ CCI_REG8(0x0404), 0x00 },
+	{ CCI_REG8(0x0405), 0x10 },
+	{ CCI_REG8(0x0408), 0x00 },
+	{ CCI_REG8(0x0409), 0x00 },
+	{ CCI_REG8(0x040A), 0x00 },
+	{ CCI_REG8(0x040B), 0x00 },
+	{ CCI_REG8(0x040C), 0x07 },
+	{ CCI_REG8(0x040D), 0x80 },
+	{ CCI_REG8(0x040E), 0x04 },
+	{ CCI_REG8(0x040F), 0x38 },
+
+	{ CCI_REG8(0x0301), 0x05 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x03 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0x96 },
+	{ CCI_REG8(0x0309), 0x0A },
+	{ CCI_REG8(0x030B), 0x01 },
+	{ CCI_REG8(0x0310), 0x00 },
+
+	{ CCI_REG8(0x0820), 0x12 },
+	{ CCI_REG8(0x0821), 0xC0 },
+	{ CCI_REG8(0x0822), 0x00 },
+	{ CCI_REG8(0x0823), 0x00 },
+
+	{ CCI_REG8(0x3A03), 0x04 },
+	{ CCI_REG8(0x3A04), 0xF8 },
+	{ CCI_REG8(0x3A05), 0x02 },
+
+	{ CCI_REG8(0x0B06), 0x01 },
+	{ CCI_REG8(0x30A2), 0x00 },
+
+	{ CCI_REG8(0x30B4), 0x00 },
+
+	{ CCI_REG8(0x3A02), 0xFF },
+
+	{ CCI_REG8(0x3011), 0x00 },
+	{ CCI_REG8(0x3013), 0x01 },
+
+	{ CCI_REG8(0x0202), 0x0C },
+	{ CCI_REG8(0x0203), 0x70 },
+	{ CCI_REG8(0x0224), 0x01 },
+	{ CCI_REG8(0x0225), 0xF4 },
+
+	{ CCI_REG8(0x0204), 0x00 },
+	{ CCI_REG8(0x0205), 0x00 },
+	{ CCI_REG8(0x020E), 0x01 },
+	{ CCI_REG8(0x020F), 0x00 },
+	{ CCI_REG8(0x0210), 0x01 },
+	{ CCI_REG8(0x0211), 0x00 },
+	{ CCI_REG8(0x0212), 0x01 },
+	{ CCI_REG8(0x0213), 0x00 },
+	{ CCI_REG8(0x0214), 0x01 },
+	{ CCI_REG8(0x0215), 0x00 },
+	{ CCI_REG8(0x0216), 0x00 },
+	{ CCI_REG8(0x0217), 0x00 },
+
+	{ CCI_REG8(0x4170), 0x00 },
+	{ CCI_REG8(0x4171), 0x10 },
+	{ CCI_REG8(0x4176), 0x00 },
+	{ CCI_REG8(0x4177), 0x3C },
+	{ CCI_REG8(0xAE20), 0x04 },
+	{ CCI_REG8(0xAE21), 0x5C },
 };
 
-static const struct reg_8 mode_table_common[] = {
+static const struct cci_reg_sequence mode_table_common[] = {
 	/* software reset */
 
 	/* software standby settings */
-	{0x0100, 0x00},
+	{ CCI_REG8(0x0100), 0x00 },
 
 	/* ATR setting */
-	{0x9300, 0x02},
+	{ CCI_REG8(0x9300), 0x02 },
 
 	/* external clock setting */
-	{0x0136, 0x18},
-	{0x0137, 0x00},
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
 
 	/* global setting */
 	/* basic config */
-	{0x0101, 0x00},
-	{0x0105, 0x01},
-	{0x0106, 0x01},
-	{0x4550, 0x02},
-	{0x4601, 0x00},
-	{0x4642, 0x05},
-	{0x6227, 0x11},
-	{0x6276, 0x00},
-	{0x900E, 0x06},
-	{0xA802, 0x90},
-	{0xA803, 0x11},
-	{0xA804, 0x62},
-	{0xA805, 0x77},
-	{0xA806, 0xAE},
-	{0xA807, 0x34},
-	{0xA808, 0xAE},
-	{0xA809, 0x35},
-	{0xA80A, 0x62},
-	{0xA80B, 0x83},
-	{0xAE33, 0x00},
+	{ CCI_REG8(0x0101), 0x00 },
+	{ CCI_REG8(0x0105), 0x01 },
+	{ CCI_REG8(0x0106), 0x01 },
+	{ CCI_REG8(0x4550), 0x02 },
+	{ CCI_REG8(0x4601), 0x00 },
+	{ CCI_REG8(0x4642), 0x05 },
+	{ CCI_REG8(0x6227), 0x11 },
+	{ CCI_REG8(0x6276), 0x00 },
+	{ CCI_REG8(0x900E), 0x06 },
+	{ CCI_REG8(0xA802), 0x90 },
+	{ CCI_REG8(0xA803), 0x11 },
+	{ CCI_REG8(0xA804), 0x62 },
+	{ CCI_REG8(0xA805), 0x77 },
+	{ CCI_REG8(0xA806), 0xAE },
+	{ CCI_REG8(0xA807), 0x34 },
+	{ CCI_REG8(0xA808), 0xAE },
+	{ CCI_REG8(0xA809), 0x35 },
+	{ CCI_REG8(0xA80A), 0x62 },
+	{ CCI_REG8(0xA80B), 0x83 },
+	{ CCI_REG8(0xAE33), 0x00 },
 
 	/* analog setting */
-	{0x4174, 0x00},
-	{0x4175, 0x11},
-	{0x4612, 0x29},
-	{0x461B, 0x12},
-	{0x461F, 0x06},
-	{0x4635, 0x07},
-	{0x4637, 0x30},
-	{0x463F, 0x18},
-	{0x4641, 0x0D},
-	{0x465B, 0x12},
-	{0x465F, 0x11},
-	{0x4663, 0x11},
-	{0x4667, 0x0F},
-	{0x466F, 0x0F},
-	{0x470E, 0x09},
-	{0x4909, 0xAB},
-	{0x490B, 0x95},
-	{0x4915, 0x5D},
-	{0x4A5F, 0xFF},
-	{0x4A61, 0xFF},
-	{0x4A73, 0x62},
-	{0x4A85, 0x00},
-	{0x4A87, 0xFF},
+	{ CCI_REG8(0x4174), 0x00 },
+	{ CCI_REG8(0x4175), 0x11 },
+	{ CCI_REG8(0x4612), 0x29 },
+	{ CCI_REG8(0x461B), 0x12 },
+	{ CCI_REG8(0x461F), 0x06 },
+	{ CCI_REG8(0x4635), 0x07 },
+	{ CCI_REG8(0x4637), 0x30 },
+	{ CCI_REG8(0x463F), 0x18 },
+	{ CCI_REG8(0x4641), 0x0D },
+	{ CCI_REG8(0x465B), 0x12 },
+	{ CCI_REG8(0x465F), 0x11 },
+	{ CCI_REG8(0x4663), 0x11 },
+	{ CCI_REG8(0x4667), 0x0F },
+	{ CCI_REG8(0x466F), 0x0F },
+	{ CCI_REG8(0x470E), 0x09 },
+	{ CCI_REG8(0x4909), 0xAB },
+	{ CCI_REG8(0x490B), 0x95 },
+	{ CCI_REG8(0x4915), 0x5D },
+	{ CCI_REG8(0x4A5F), 0xFF },
+	{ CCI_REG8(0x4A61), 0xFF },
+	{ CCI_REG8(0x4A73), 0x62 },
+	{ CCI_REG8(0x4A85), 0x00 },
+	{ CCI_REG8(0x4A87), 0xFF },
 
 	/* embedded data */
-	{0x5041, 0x04},
-	{0x583C, 0x04},
-	{0x620E, 0x04},
-	{0x6EB2, 0x01},
-	{0x6EB3, 0x00},
-	{0x9300, 0x02},
+	{ CCI_REG8(0x5041), 0x04 },
+	{ CCI_REG8(0x583C), 0x04 },
+	{ CCI_REG8(0x620E), 0x04 },
+	{ CCI_REG8(0x6EB2), 0x01 },
+	{ CCI_REG8(0x6EB3), 0x00 },
+	{ CCI_REG8(0x9300), 0x02 },
 
 	/* imagequality */
 	/* HDR setting */
-	{0x3001, 0x07},
-	{0x6D12, 0x3F},
-	{0x6D13, 0xFF},
-	{0x9344, 0x03},
-	{0x9706, 0x10},
-	{0x9707, 0x03},
-	{0x9708, 0x03},
-	{0x9E04, 0x01},
-	{0x9E05, 0x00},
-	{0x9E0C, 0x01},
-	{0x9E0D, 0x02},
-	{0x9E24, 0x00},
-	{0x9E25, 0x8C},
-	{0x9E26, 0x00},
-	{0x9E27, 0x94},
-	{0x9E28, 0x00},
-	{0x9E29, 0x96},
+	{ CCI_REG8(0x3001), 0x07 },
+	{ CCI_REG8(0x6D12), 0x3F },
+	{ CCI_REG8(0x6D13), 0xFF },
+	{ CCI_REG8(0x9344), 0x03 },
+	{ CCI_REG8(0x9706), 0x10 },
+	{ CCI_REG8(0x9707), 0x03 },
+	{ CCI_REG8(0x9708), 0x03 },
+	{ CCI_REG8(0x9E04), 0x01 },
+	{ CCI_REG8(0x9E05), 0x00 },
+	{ CCI_REG8(0x9E0C), 0x01 },
+	{ CCI_REG8(0x9E0D), 0x02 },
+	{ CCI_REG8(0x9E24), 0x00 },
+	{ CCI_REG8(0x9E25), 0x8C },
+	{ CCI_REG8(0x9E26), 0x00 },
+	{ CCI_REG8(0x9E27), 0x94 },
+	{ CCI_REG8(0x9E28), 0x00 },
+	{ CCI_REG8(0x9E29), 0x96 },
 
 	/* CNR parameter setting */
-	{0x69DB, 0x01},
+	{ CCI_REG8(0x69DB), 0x01 },
 
 	/* Moire reduction */
-	{0x6957, 0x01},
+	{ CCI_REG8(0x6957), 0x01 },
 
 	/* image enhancement */
-	{0x6987, 0x17},
-	{0x698A, 0x03},
-	{0x698B, 0x03},
+	{ CCI_REG8(0x6987), 0x17 },
+	{ CCI_REG8(0x698A), 0x03 },
+	{ CCI_REG8(0x698B), 0x03 },
 
 	/* white balanace */
-	{0x0B8E, 0x01},
-	{0x0B8F, 0x00},
-	{0x0B90, 0x01},
-	{0x0B91, 0x00},
-	{0x0B92, 0x01},
-	{0x0B93, 0x00},
-	{0x0B94, 0x01},
-	{0x0B95, 0x00},
+	{ CCI_REG8(0x0B8E), 0x01 },
+	{ CCI_REG8(0x0B8F), 0x00 },
+	{ CCI_REG8(0x0B90), 0x01 },
+	{ CCI_REG8(0x0B91), 0x00 },
+	{ CCI_REG8(0x0B92), 0x01 },
+	{ CCI_REG8(0x0B93), 0x00 },
+	{ CCI_REG8(0x0B94), 0x01 },
+	{ CCI_REG8(0x0B95), 0x00 },
 
 	/* ATR setting */
-	{0x6E50, 0x00},
-	{0x6E51, 0x32},
-	{0x9340, 0x00},
-	{0x9341, 0x3C},
-	{0x9342, 0x03},
-	{0x9343, 0xFF},
-	{IMX214_TABLE_END, 0x00}
+	{ CCI_REG8(0x6E50), 0x00 },
+	{ CCI_REG8(0x6E51), 0x32 },
+	{ CCI_REG8(0x9340), 0x00 },
+	{ CCI_REG8(0x9341), 0x3C },
+	{ CCI_REG8(0x9342), 0x03 },
+	{ CCI_REG8(0x9343), 0xFF },
 };
 
 /*
@@ -421,16 +401,19 @@ static const struct reg_8 mode_table_common[] = {
 static const struct imx214_mode {
 	u32 width;
 	u32 height;
-	const struct reg_8 *reg_table;
+	unsigned int num_of_regs;
+	const struct cci_reg_sequence *reg_table;
 } imx214_modes[] = {
 	{
 		.width = 4096,
 		.height = 2304,
+		.num_of_regs = ARRAY_SIZE(mode_4096x2304),
 		.reg_table = mode_4096x2304,
 	},
 	{
 		.width = 1920,
 		.height = 1080,
+		.num_of_regs = ARRAY_SIZE(mode_1920x1080),
 		.reg_table = mode_1920x1080,
 	},
 };
@@ -631,7 +614,6 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx214 *imx214 = container_of(ctrl->handler,
 					     struct imx214, ctrls);
-	u8 vals[2];
 	int ret;
 
 	/*
@@ -643,12 +625,7 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
-		vals[1] = ctrl->val;
-		vals[0] = ctrl->val >> 8;
-		ret = regmap_bulk_write(imx214->regmap, IMX214_REG_EXPOSURE, vals, 2);
-		if (ret < 0)
-			dev_err(imx214->dev, "Error %d\n", ret);
-		ret = 0;
+		cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val, &ret);
 		break;
 
 	default:
@@ -734,46 +711,13 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	return 0;
 };
 
-#define MAX_CMD 4
-static int imx214_write_table(struct imx214 *imx214,
-			      const struct reg_8 table[])
-{
-	u8 vals[MAX_CMD];
-	int i;
-	int ret;
-
-	for (; table->addr != IMX214_TABLE_END ; table++) {
-		if (table->addr == IMX214_TABLE_WAIT_MS) {
-			usleep_range(table->val * 1000,
-				     table->val * 1000 + 500);
-			continue;
-		}
-
-		for (i = 0; i < MAX_CMD; i++) {
-			if (table[i].addr != (table[0].addr + i))
-				break;
-			vals[i] = table[i].val;
-		}
-
-		ret = regmap_bulk_write(imx214->regmap, table->addr, vals, i);
-
-		if (ret) {
-			dev_err(imx214->dev, "write_table error: %d\n", ret);
-			return ret;
-		}
-
-		table += i - 1;
-	}
-
-	return 0;
-}
-
 static int imx214_start_streaming(struct imx214 *imx214)
 {
 	const struct imx214_mode *mode;
 	int ret;
 
-	ret = imx214_write_table(imx214, mode_table_common);
+	ret = cci_multi_reg_write(imx214->regmap, mode_table_common,
+				  ARRAY_SIZE(mode_table_common), NULL);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent common table %d\n", ret);
 		return ret;
@@ -782,17 +726,24 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	mode = v4l2_find_nearest_size(imx214_modes,
 				ARRAY_SIZE(imx214_modes), width, height,
 				imx214->fmt.width, imx214->fmt.height);
-	ret = imx214_write_table(imx214, mode->reg_table);
+	ret = cci_multi_reg_write(imx214->regmap, mode->reg_table,
+				  mode->num_of_regs, NULL);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent mode table %d\n", ret);
 		return ret;
 	}
+
+	usleep_range(10000, 10500);
+
+	cci_write(imx214->regmap, CCI_REG8(0x0138), 0x01, NULL);
+
 	ret = __v4l2_ctrl_handler_setup(&imx214->ctrls);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sync v4l2 controls\n");
 		return ret;
 	}
-	ret = regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX214_MODE_STREAMING);
+	ret = cci_write(imx214->regmap, IMX214_REG_MODE_SELECT,
+			IMX214_MODE_STREAMING, NULL);
 	if (ret < 0)
 		dev_err(imx214->dev, "could not sent start table %d\n", ret);
 
@@ -803,7 +754,8 @@ static int imx214_stop_streaming(struct imx214 *imx214)
 {
 	int ret;
 
-	ret = regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX214_MODE_STANDBY);
+	ret = cci_write(imx214->regmap, IMX214_REG_MODE_SELECT,
+			IMX214_MODE_STANDBY, NULL);
 	if (ret < 0)
 		dev_err(imx214->dev, "could not sent stop table %d\n",	ret);
 
@@ -904,12 +856,6 @@ static const struct v4l2_subdev_internal_ops imx214_internal_ops = {
 	.init_state = imx214_entity_init_state,
 };
 
-static const struct regmap_config sensor_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 8,
-	.cache_type = REGCACHE_MAPLE,
-};
-
 static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
 {
 	unsigned int i;
@@ -992,10 +938,10 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->enable_gpio),
 				     "failed to get enable gpio\n");
 
-	imx214->regmap = devm_regmap_init_i2c(client, &sensor_regmap_config);
+	imx214->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(imx214->regmap))
 		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
-				     "regmap init failed\n");
+				     "failed to initialize CCI\n");
 
 	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
 	imx214->sd.internal_ops = &imx214_internal_ops;

-- 
2.46.0



