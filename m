Return-Path: <linux-media+bounces-33722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CAAC9BB8
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98FA5189A1A3
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E833B18B47C;
	Sat, 31 May 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPKIkMHM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570113CA97
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709123; cv=none; b=BKvp+vss/7AKhH+f8piJfmzNTePaglMmNYOa3ez2AFXgRGVIBDxML10pZXlgy78ZSTHB5llRFKsriDCr+Vh9KvlSGUf7k4FxHia63d8AbR/9iXUbJ0lXlTU5n9ip0DPixW97MZKvTZWKpCoGjkRf1yFyfkFTkuCdLapCF4vc9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709123; c=relaxed/simple;
	bh=voer7miYAFU+uyWXu5yCJhGNfL1zEk8UsA8rG5NtZuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aL33SJ7LzYg/aZ9sMhMlulNhiafscapho3j6FEwAUwFeZGD2hKZuOIPOsSb9/XORIC+wJkYATh7xmTgIzK/Rthlwywh47vvqhaQLSYCu9oLDIan0pAgYNP3eYkZ+QY9GdBX52Fx/1IW+zffuheAqVQ19AKPtnf3znqQvSN+YyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPKIkMHM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995DDC4CEEF;
	Sat, 31 May 2025 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709123;
	bh=voer7miYAFU+uyWXu5yCJhGNfL1zEk8UsA8rG5NtZuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XPKIkMHMmybMrUVzREsFshALsZQ4aIoqJkJCix+Hh1Cw09/9gNqk60mBctw4S3GSZ
	 Ksv620GdP6ojZPip78Y+xCciXFD3z2rIFTFmd87asMmrMauTGlmPAflireCqhrjlOt
	 BPzLR4F+9l8grNXxrc9VYvIw1F+aE6pZd1tOfDuL7kG+Sjg2AhfzMlT5AMBWptow41
	 OQKVmgxg/3fo8cDXgxDz7AhdoGvLXQKOt+8AOEYopuI/5/qqP87XVJDnWyt6jn7Qoj
	 Zy0qyOXzNJ/PPuRXd3uAoNi64z8cw5W3BQzCA4TWDKc42Oea82zXDt2WzjNxm/mnWC
	 ypqm5kARtM4qg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 03/12] media: mt9m114: Use aptina-PLL helper to get PLL values
Date: Sat, 31 May 2025 18:31:38 +0200
Message-ID: <20250531163148.83497-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
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
Changes in v2:
- Add select VIDEO_APTINA_PLL to Kconfig
- Use correct aptina_pll_limits
---
 drivers/media/i2c/Kconfig   |  1 +
 drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index dc2c429734fc..1820ec37404a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -285,6 +285,7 @@ config VIDEO_MT9M111
 config VIDEO_MT9M114
 	tristate "onsemi MT9M114 sensor support"
 	select V4L2_CCI_I2C
+	select VIDEO_APTINA_PLL
 	help
 	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
 	  camera.
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5a7c45ce2169..e12c69dc9df0 100644
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
 
@@ -2262,12 +2262,29 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
 
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
+		 * different PLL settings then used by the vendor's drivers.
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
@@ -2287,8 +2304,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
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


