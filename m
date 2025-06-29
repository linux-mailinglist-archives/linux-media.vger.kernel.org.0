Return-Path: <linux-media+bounces-36211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C770DAED118
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DFBE1700DD
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1322F23D28E;
	Sun, 29 Jun 2025 20:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsgy/tRH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547C22F74A
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230600; cv=none; b=fbci3urKeEv5nd6HZSqnKWVhbqKlUdJR0q19Q4yl68irswKmzZKa4Jnh44NPoX2enkvV9HIk5HvsyN2legc4dVMZ1mMoRxgzvZ+ij9merZ8pIkSvEMYC4DjmMAtwJq9LuxjhZsk9eVmvoyixKJ4ny7C5LY3ctWf4uiiPEPQWJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230600; c=relaxed/simple;
	bh=ZtYeP35v54cqzpGIH/U83FQje4sd3h7i20sYAnQ7Lqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rt6mb5tsF7ymhitfRHrGwx+jw3PkVjqkXisT9Hd6dIMcn4OsSJnvdF2V2wFWnCSuUy4EVFbISr3YFb4QZnml4DoGONyJgeJWC7s7GI1FodQ1sQ8yZz7V+29s7UuNd0D8vtGL52qRFLAbVYF0kkCGbQ0tS40jzO6pLkT9gk9W9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsgy/tRH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB65CC4CEEB;
	Sun, 29 Jun 2025 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230600;
	bh=ZtYeP35v54cqzpGIH/U83FQje4sd3h7i20sYAnQ7Lqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dsgy/tRH+cBpPOCK0oxqh2WLC+G/O7mMCA+in2ywWElU6LdydhC4YrCcqvY77WbUp
	 wWt03q6iiqWlvPh9U5704GTG4hhJTVgHMwuzeYCpQ+hiVTLKsl9fpRAaWhLIm0k2XD
	 S8hIDm8XTL77MInKVjvd+u70YCdBbc1wAsCGg6ESf3IISeEVGOl+HzDQGVZ+tL73rK
	 f9mESW4uaU5vfC+6WdJc6Sui2YHbiug+m4Oc5KN/ZRbZkxrwEecnrQ6Qgb77ukVb7O
	 aDfhKx2WO1Oa4U5jaRetKmWGiPTmouXZrstp8is4jMOTUDN/44Z33SJnpMbVx+522h
	 F34N+QQBrxnMw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 03/15] media: mt9m114: Use aptina-PLL helper to get PLL values
Date: Sun, 29 Jun 2025 22:56:13 +0200
Message-ID: <20250629205626.68341-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before this change the driver used hardcoded PLL m, n and p values to
achieve a 48MHz pixclock when used with an external clock with a frequency
of 24 MHz.

Use aptina_pll_calculate() to allow the driver to work with different
external clock frequencies. The m, n, and p values will be unchanged
with a 24 MHz extclk and this has also been tested with a 19.2 MHz
clock where m gets increased from 32 to 40.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Document that using 768Mhz for out_clock_max does not work

Changes in v2:
- Add select VIDEO_APTINA_PLL to Kconfig
- Use correct aptina_pll_limits
---
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9m114.c | 55 +++++++++++++++++++++++++++----------
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 0b58197471ae..75674bc40107 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -295,6 +295,7 @@ config VIDEO_MT9M111
 config VIDEO_MT9M114
 	tristate "onsemi MT9M114 sensor support"
 	select V4L2_CCI_I2C
+	select VIDEO_APTINA_PLL
 	help
 	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
 	  camera.
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5a7c45ce2169..9e703012cb0e 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -31,6 +31,8 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
+#include "aptina-pll.h"
+
 /* Sysctl registers */
 #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
 #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)
@@ -263,9 +265,9 @@
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
 #define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
-#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
+#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		((((n) - 1) << 8) | (m))
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
-#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		((p) << 8)
+#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		(((p) - 1) << 8)
 #define MT9M114_CAM_PORT_OUTPUT_CONTROL			CCI_REG16(0xc984)
 #define MT9M114_CAM_PORT_PORT_SELECT_PARALLEL			(0 << 0)
 #define MT9M114_CAM_PORT_PORT_SELECT_MIPI			(1 << 0)
@@ -326,7 +328,7 @@
  * minimum values that have been seen in register lists are 303 and 38, use
  * them.
  *
- * Set the default to achieve 1280x960 at 30fps.
+ * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				38
@@ -336,6 +338,8 @@
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
 
+#define MT9M114_DEF_PIXCLOCK				48000000
+
 #define MT9M114_PIXEL_ARRAY_WIDTH			1296U
 #define MT9M114_PIXEL_ARRAY_HEIGHT			976U
 
@@ -380,11 +384,7 @@ struct mt9m114 {
 	struct v4l2_fwnode_endpoint bus_cfg;
 	bool bypass_pll;
 
-	struct {
-		unsigned int m;
-		unsigned int n;
-		unsigned int p;
-	} pll;
+	struct aptina_pll pll;
 
 	unsigned int pixrate;
 	bool streaming;
@@ -757,7 +757,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 							       sensor->pll.n),
 			  &ret);
 		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
-			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
+			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p1),
 			  &ret);
 	}
 
@@ -2262,12 +2262,30 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
 
 static int mt9m114_clk_init(struct mt9m114 *sensor)
 {
+	static const struct aptina_pll_limits limits = {
+		.ext_clock_min = 6000000,
+		.ext_clock_max = 54000000,
+		/* int_clock_* limits are not documented taken from mt9p031.c */
+		.int_clock_min = 2000000,
+		.int_clock_max = 13500000,
+		/*
+		 * out_clock_min is not documented, taken from mt9p031.c.
+		 * out_clock_max is documented as 768MHz, but this leads to
+		 * a non working setup. Use 400MHz instead which results in
+		 * the same PLL settings as used by the vendor's drivers.
+		 */
+		.out_clock_min = 180000000,
+		.out_clock_max = 400000000,
+		.pix_clock_max = 48000000,
+		.n_min = 1,
+		.n_max = 64,
+		.m_min = 16,
+		.m_max = 192,
+		.p1_min = 1,
+		.p1_max = 64,
+	};
 	unsigned int pixrate;
-
-	/* Hardcode the PLL multiplier and dividers to default settings. */
-	sensor->pll.m = 32;
-	sensor->pll.n = 1;
-	sensor->pll.p = 7;
+	int ret;
 
 	/*
 	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
@@ -2287,8 +2305,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	}
 
 	/* Check if the PLL configuration fits the configured link frequency. */
+	sensor->pll.ext_clock = sensor->clk_freq;
+	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
+
+	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
+	if (ret)
+		return ret;
+
 	pixrate = sensor->clk_freq * sensor->pll.m
-		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+		/ (sensor->pll.n * sensor->pll.p1);
 	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
 		sensor->pixrate = pixrate;
 		sensor->bypass_pll = false;
-- 
2.49.0


