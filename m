Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EAC27ECD4
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730957AbgI3P36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44664 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730977AbgI3P3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:09 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1AF3D634CD8
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 042/100] smiapp-pll: Rename as ccs-pll
Date:   Wed, 30 Sep 2020 18:28:00 +0300
Message-Id: <20200930152858.8471-43-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MIPI CCS replaces SMIA and SMIA++ as the current standard. CCS brings new
features while existing functionality will be supported. Rename the
smiapp-pll as ccs-pll accordingly.

Also add Intel copyright to the files.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig                     |  2 +-
 drivers/media/i2c/Makefile                    |  2 +-
 drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} | 60 +++++++++----------
 drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} | 40 ++++++-------
 drivers/media/i2c/ccs/Kconfig                 |  2 +-
 drivers/media/i2c/ccs/ccs-core.c              | 18 +++---
 drivers/media/i2c/ccs/ccs-quirk.c             |  2 +-
 drivers/media/i2c/ccs/ccs.h                   |  4 +-
 8 files changed, 64 insertions(+), 66 deletions(-)
 rename drivers/media/i2c/{smiapp-pll.c => ccs-pll.c} (90%)
 rename drivers/media/i2c/{smiapp-pll.h => ccs-pll.h} (68%)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 41a8b6189259..4b6fcf13d527 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -722,7 +722,7 @@ menu "Camera sensor devices"
 config VIDEO_APTINA_PLL
 	tristate
 
-config VIDEO_SMIAPP_PLL
+config VIDEO_CCS_PLL
 	tristate
 
 config VIDEO_HI556
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index cb0be09e38bd..c716bac3ed4b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -104,7 +104,7 @@ obj-$(CONFIG_VIDEO_S5C73M3)	+= s5c73m3/
 obj-$(CONFIG_VIDEO_ADP1653)	+= adp1653.o
 obj-$(CONFIG_VIDEO_LM3560)	+= lm3560.o
 obj-$(CONFIG_VIDEO_LM3646)	+= lm3646.o
-obj-$(CONFIG_VIDEO_SMIAPP_PLL)	+= smiapp-pll.o
+obj-$(CONFIG_VIDEO_CCS_PLL)	+= ccs-pll.o
 obj-$(CONFIG_VIDEO_AK881X)		+= ak881x.o
 obj-$(CONFIG_VIDEO_IR_I2C)  += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_I2C)		+= video-i2c.o
diff --git a/drivers/media/i2c/smiapp-pll.c b/drivers/media/i2c/ccs-pll.c
similarity index 90%
rename from drivers/media/i2c/smiapp-pll.c
rename to drivers/media/i2c/ccs-pll.c
index 690abe8cbdb2..d2f0f7375f5c 100644
--- a/drivers/media/i2c/smiapp-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp-pll.c
+ * drivers/media/i2c/ccs-pll.c
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic MIPI CCS/SMIA/SMIA++ PLL calculator
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
@@ -13,7 +14,7 @@
 #include <linux/lcm.h>
 #include <linux/module.h>
 
-#include "smiapp-pll.h"
+#include "ccs-pll.h"
 
 /* Return an even number or one. */
 static inline uint32_t clk_div_even(uint32_t a)
@@ -50,11 +51,11 @@ static int bounds_check(struct device *dev, uint32_t val,
 	return -EINVAL;
 }
 
-static void print_pll(struct device *dev, struct smiapp_pll *pll)
+static void print_pll(struct device *dev, struct ccs_pll *pll)
 {
 	dev_dbg(dev, "pre_pll_clk_div\t%u\n",  pll->pre_pll_clk_div);
 	dev_dbg(dev, "pll_multiplier \t%u\n",  pll->pll_multiplier);
-	if (!(pll->flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS)) {
+	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)) {
 		dev_dbg(dev, "op_sys_clk_div \t%u\n", pll->op.sys_clk_div);
 		dev_dbg(dev, "op_pix_clk_div \t%u\n", pll->op.pix_clk_div);
 	}
@@ -64,7 +65,7 @@ static void print_pll(struct device *dev, struct smiapp_pll *pll)
 	dev_dbg(dev, "ext_clk_freq_hz \t%u\n", pll->ext_clk_freq_hz);
 	dev_dbg(dev, "pll_ip_clk_freq_hz \t%u\n", pll->pll_ip_clk_freq_hz);
 	dev_dbg(dev, "pll_op_clk_freq_hz \t%u\n", pll->pll_op_clk_freq_hz);
-	if (!(pll->flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS)) {
+	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)) {
 		dev_dbg(dev, "op_sys_clk_freq_hz \t%u\n",
 			pll->op.sys_clk_freq_hz);
 		dev_dbg(dev, "op_pix_clk_freq_hz \t%u\n",
@@ -75,10 +76,9 @@ static void print_pll(struct device *dev, struct smiapp_pll *pll)
 }
 
 static int check_all_bounds(struct device *dev,
-			    const struct smiapp_pll_limits *limits,
-			    const struct smiapp_pll_branch_limits *op_limits,
-			    struct smiapp_pll *pll,
-			    struct smiapp_pll_branch *op_pll)
+			    const struct ccs_pll_limits *limits,
+			    const struct ccs_pll_branch_limits *op_limits,
+			    struct ccs_pll *pll, struct ccs_pll_branch *op_pll)
 {
 	int rval;
 
@@ -118,7 +118,7 @@ static int check_all_bounds(struct device *dev,
 	 * If there are no OP clocks, the VT clocks are contained in
 	 * the OP clock struct.
 	 */
-	if (pll->flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS)
+	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		return rval;
 
 	if (!rval)
@@ -148,11 +148,11 @@ static int check_all_bounds(struct device *dev,
  *
  * @return Zero on success, error code on error.
  */
-static int __smiapp_pll_calculate(
-	struct device *dev, const struct smiapp_pll_limits *limits,
-	const struct smiapp_pll_branch_limits *op_limits,
-	struct smiapp_pll *pll, struct smiapp_pll_branch *op_pll, uint32_t mul,
-	uint32_t div, uint32_t lane_op_clock_ratio)
+static int
+__ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
+		    const struct ccs_pll_branch_limits *op_limits,
+		    struct ccs_pll *pll, struct ccs_pll_branch *op_pll,
+		    uint32_t mul, uint32_t div, uint32_t lane_op_clock_ratio)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
@@ -252,7 +252,7 @@ static int __smiapp_pll_calculate(
 	op_pll->pix_clk_freq_hz =
 		op_pll->sys_clk_freq_hz / op_pll->pix_clk_div;
 
-	if (pll->flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS) {
+	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
 		/* No OP clocks --- VT clocks are used instead. */
 		goto out_skip_vt_calc;
 	}
@@ -383,12 +383,11 @@ static int __smiapp_pll_calculate(
 	return check_all_bounds(dev, limits, op_limits, pll, op_pll);
 }
 
-int smiapp_pll_calculate(struct device *dev,
-			 const struct smiapp_pll_limits *limits,
-			 struct smiapp_pll *pll)
+int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
+		      struct ccs_pll *pll)
 {
-	const struct smiapp_pll_branch_limits *op_limits = &limits->op;
-	struct smiapp_pll_branch *op_pll = &pll->op;
+	const struct ccs_pll_branch_limits *op_limits = &limits->op;
+	struct ccs_pll_branch *op_pll = &pll->op;
 	uint16_t min_pre_pll_clk_div;
 	uint16_t max_pre_pll_clk_div;
 	uint32_t lane_op_clock_ratio;
@@ -396,7 +395,7 @@ int smiapp_pll_calculate(struct device *dev,
 	unsigned int i;
 	int rval = -EINVAL;
 
-	if (pll->flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS) {
+	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
 		/*
 		 * If there's no OP PLL at all, use the VT values
 		 * instead. The OP values are ignored for the rest of
@@ -406,7 +405,7 @@ int smiapp_pll_calculate(struct device *dev,
 		op_pll = &pll->vt;
 	}
 
-	if (pll->flags & SMIAPP_PLL_FLAG_OP_PIX_CLOCK_PER_LANE)
+	if (pll->flags & CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE)
 		lane_op_clock_ratio = pll->csi2.lanes;
 	else
 		lane_op_clock_ratio = 1;
@@ -416,12 +415,12 @@ int smiapp_pll_calculate(struct device *dev,
 		pll->binning_vertical);
 
 	switch (pll->bus_type) {
-	case SMIAPP_PLL_BUS_TYPE_CSI2:
+	case CCS_PLL_BUS_TYPE_CSI2:
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
 		pll->pll_op_clk_freq_hz = pll->link_freq * 2
 			* (pll->csi2.lanes / lane_op_clock_ratio);
 		break;
-	case SMIAPP_PLL_BUS_TYPE_PARALLEL:
+	case CCS_PLL_BUS_TYPE_PARALLEL:
 		pll->pll_op_clk_freq_hz = pll->link_freq * pll->bits_per_pixel
 			/ DIV_ROUND_UP(pll->bits_per_pixel,
 				       pll->parallel.bus_width);
@@ -461,9 +460,8 @@ int smiapp_pll_calculate(struct device *dev,
 	for (pll->pre_pll_clk_div = min_pre_pll_clk_div;
 	     pll->pre_pll_clk_div <= max_pre_pll_clk_div;
 	     pll->pre_pll_clk_div += 2 - (pll->pre_pll_clk_div & 1)) {
-		rval = __smiapp_pll_calculate(dev, limits, op_limits, pll,
-					      op_pll, mul, div,
-					      lane_op_clock_ratio);
+		rval = __ccs_pll_calculate(dev, limits, op_limits, pll, op_pll,
+					   mul, div, lane_op_clock_ratio);
 		if (rval)
 			continue;
 
@@ -475,8 +473,8 @@ int smiapp_pll_calculate(struct device *dev,
 
 	return rval;
 }
-EXPORT_SYMBOL_GPL(smiapp_pll_calculate);
+EXPORT_SYMBOL_GPL(ccs_pll_calculate);
 
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
-MODULE_DESCRIPTION("Generic SMIA/SMIA++ PLL calculator");
+MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ PLL calculator");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/smiapp-pll.h b/drivers/media/i2c/ccs-pll.h
similarity index 68%
rename from drivers/media/i2c/smiapp-pll.h
rename to drivers/media/i2c/ccs-pll.h
index bd6902f54539..88d641ee3fa1 100644
--- a/drivers/media/i2c/smiapp-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -1,32 +1,33 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * drivers/media/i2c/smiapp-pll.h
+ * drivers/media/i2c/ccs-pll.h
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic MIPI CCS/SMIA/SMIA++ PLL calculator
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
 
-#ifndef SMIAPP_PLL_H
-#define SMIAPP_PLL_H
+#ifndef CCS_PLL_H
+#define CCS_PLL_H
 
 /* CSI-2 or CCP-2 */
-#define SMIAPP_PLL_BUS_TYPE_CSI2				0x00
-#define SMIAPP_PLL_BUS_TYPE_PARALLEL				0x01
+#define CCS_PLL_BUS_TYPE_CSI2				0x00
+#define CCS_PLL_BUS_TYPE_PARALLEL				0x01
 
 /* op pix clock is for all lanes in total normally */
-#define SMIAPP_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
-#define SMIAPP_PLL_FLAG_NO_OP_CLOCKS				(1 << 1)
+#define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
+#define CCS_PLL_FLAG_NO_OP_CLOCKS				(1 << 1)
 
-struct smiapp_pll_branch {
+struct ccs_pll_branch {
 	uint16_t sys_clk_div;
 	uint16_t pix_clk_div;
 	uint32_t sys_clk_freq_hz;
 	uint32_t pix_clk_freq_hz;
 };
 
-struct smiapp_pll {
+struct ccs_pll {
 	/* input values */
 	uint8_t bus_type;
 	union {
@@ -51,14 +52,14 @@ struct smiapp_pll {
 	uint16_t pll_multiplier;
 	uint32_t pll_ip_clk_freq_hz;
 	uint32_t pll_op_clk_freq_hz;
-	struct smiapp_pll_branch vt;
-	struct smiapp_pll_branch op;
+	struct ccs_pll_branch vt;
+	struct ccs_pll_branch op;
 
 	uint32_t pixel_rate_csi;
 	uint32_t pixel_rate_pixel_array;
 };
 
-struct smiapp_pll_branch_limits {
+struct ccs_pll_branch_limits {
 	uint16_t min_sys_clk_div;
 	uint16_t max_sys_clk_div;
 	uint32_t min_sys_clk_freq_hz;
@@ -69,7 +70,7 @@ struct smiapp_pll_branch_limits {
 	uint32_t max_pix_clk_freq_hz;
 };
 
-struct smiapp_pll_limits {
+struct ccs_pll_limits {
 	/* Strict PLL limits */
 	uint32_t min_ext_clk_freq_hz;
 	uint32_t max_ext_clk_freq_hz;
@@ -82,8 +83,8 @@ struct smiapp_pll_limits {
 	uint32_t min_pll_op_freq_hz;
 	uint32_t max_pll_op_freq_hz;
 
-	struct smiapp_pll_branch_limits vt;
-	struct smiapp_pll_branch_limits op;
+	struct ccs_pll_branch_limits vt;
+	struct ccs_pll_branch_limits op;
 
 	/* Other relevant limits */
 	uint32_t min_line_length_pck_bin;
@@ -92,8 +93,7 @@ struct smiapp_pll_limits {
 
 struct device;
 
-int smiapp_pll_calculate(struct device *dev,
-			 const struct smiapp_pll_limits *limits,
-			 struct smiapp_pll *pll);
+int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
+		      struct ccs_pll *pll);
 
-#endif /* SMIAPP_PLL_H */
+#endif /* CCS_PLL_H */
diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
index b4f8b10da420..59f35b33ddc1 100644
--- a/drivers/media/i2c/ccs/Kconfig
+++ b/drivers/media/i2c/ccs/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_CCS
 	depends on I2C && VIDEO_V4L2 && HAVE_CLK
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select VIDEO_SMIAPP_PLL
+	select VIDEO_CCS_PLL
 	select V4L2_FWNODE
 	help
 	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 40e0fc84205c..21765f98bdc4 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -357,7 +357,7 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 
 static int ccs_pll_configure(struct ccs_sensor *sensor)
 {
-	struct smiapp_pll *pll = &sensor->pll;
+	struct ccs_pll *pll = &sensor->pll;
 	int rval;
 
 	rval = ccs_write(sensor, VT_PIX_CLK_DIV, pll->vt.pix_clk_div);
@@ -380,7 +380,7 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	rval = ccs_write(sensor, REQUESTED_LINK_RATE,
 			 DIV_ROUND_UP(pll->op.sys_clk_freq_hz,
 				      1000000 / 256 / 256));
-	if (rval < 0 || sensor->pll.flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS)
+	if (rval < 0 || sensor->pll.flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		return rval;
 
 	rval = ccs_write(sensor, OP_PIX_CLK_DIV, pll->op.pix_clk_div);
@@ -390,10 +390,10 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	return ccs_write(sensor, OP_SYS_CLK_DIV, pll->op.sys_clk_div);
 }
 
-static int ccs_pll_try(struct ccs_sensor *sensor, struct smiapp_pll *pll)
+static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	struct smiapp_pll_limits lim = {
+	struct ccs_pll_limits lim = {
 		.min_pre_pll_clk_div = CCS_LIM(sensor, MIN_PRE_PLL_CLK_DIV),
 		.max_pre_pll_clk_div = CCS_LIM(sensor, MAX_PRE_PLL_CLK_DIV),
 		.min_pll_ip_freq_hz = CCS_LIM(sensor, MIN_PLL_IP_CLK_FREQ_MHZ),
@@ -425,12 +425,12 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct smiapp_pll *pll)
 		.min_line_length_pck = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK),
 	};
 
-	return smiapp_pll_calculate(&client->dev, &lim, pll);
+	return ccs_pll_calculate(&client->dev, &lim, pll);
 }
 
 static int ccs_pll_update(struct ccs_sensor *sensor)
 {
-	struct smiapp_pll *pll = &sensor->pll;
+	struct ccs_pll *pll = &sensor->pll;
 	int rval;
 
 	pll->binning_horizontal = sensor->binning_horizontal;
@@ -823,7 +823,7 @@ static void ccs_free_controls(struct ccs_sensor *sensor)
 static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	struct smiapp_pll *pll = &sensor->pll;
+	struct ccs_pll *pll = &sensor->pll;
 	u8 compressed_max_bpp = 0;
 	unsigned int type, n;
 	unsigned int i, pixel_order;
@@ -3141,7 +3141,7 @@ static int ccs_probe(struct i2c_client *client)
 	    !CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV) ||
 	    !CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV)) {
 		/* No OP clock branch */
-		sensor->pll.flags |= SMIAPP_PLL_FLAG_NO_OP_CLOCKS;
+		sensor->pll.flags |= CCS_PLL_FLAG_NO_OP_CLOCKS;
 	} else if (CCS_LIM(sensor, SCALING_CAPABILITY)
 		   != CCS_SCALING_CAPABILITY_NONE ||
 		   CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
@@ -3158,7 +3158,7 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
-	sensor->pll.bus_type = SMIAPP_PLL_BUS_TYPE_CSI2;
+	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2;
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
index 07c5733b4244..8b4fa60044b2 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -190,7 +190,7 @@ static int jt8ev1_post_streamoff(struct ccs_sensor *sensor)
 
 static int jt8ev1_init(struct ccs_sensor *sensor)
 {
-	sensor->pll.flags |= SMIAPP_PLL_FLAG_OP_PIX_CLOCK_PER_LANE;
+	sensor->pll.flags |= CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE;
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index f60d1801c469..c8a9f4ee093e 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -21,7 +21,7 @@
 #include "ccs-quirk.h"
 #include "ccs-regs.h"
 #include "ccs-reg-access.h"
-#include "../smiapp-pll.h"
+#include "../ccs-pll.h"
 #include "smiapp-reg-defs.h"
 
 /*
@@ -256,7 +256,7 @@ struct ccs_sensor {
 
 	struct ccs_module_info minfo;
 
-	struct smiapp_pll pll;
+	struct ccs_pll pll;
 
 	/* Is a default format supported for a given BPP? */
 	unsigned long *valid_link_freqs;
-- 
2.27.0

