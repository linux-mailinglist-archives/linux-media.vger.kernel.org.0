Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9D827ECE1
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731154AbgI3PaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44664 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730949AbgI3P3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:07 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0C7AD634CCA
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 031/100] ccs: Make hwcfg part of the device specific struct
Date:   Wed, 30 Sep 2020 18:27:49 +0300
Message-Id: <20200930152858.8471-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to allocate the hardware configuration struct separately.
Put it in struct ccs_sensor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c  | 94 ++++++++++++++++---------------
 drivers/media/i2c/ccs/ccs-quirk.c |  4 +-
 drivers/media/i2c/ccs/ccs.h       |  2 +-
 3 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 610a2d22a5ca..d8553aba00c8 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -803,7 +803,7 @@ static int ccs_init_late_controls(struct ccs_sensor *sensor)
 	sensor->link_freq = v4l2_ctrl_new_int_menu(
 		&sensor->src->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_LINK_FREQ, __fls(*valid_link_freqs),
-		__ffs(*valid_link_freqs), sensor->hwcfg->op_sys_clock);
+		__ffs(*valid_link_freqs), sensor->hwcfg.op_sys_clock);
 
 	return sensor->src->ctrl_handler.error;
 }
@@ -916,8 +916,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 
 		pll->bits_per_pixel = f->compressed;
 
-		for (j = 0; sensor->hwcfg->op_sys_clock[j]; j++) {
-			pll->link_freq = sensor->hwcfg->op_sys_clock[j];
+		for (j = 0; sensor->hwcfg.op_sys_clock[j]; j++) {
+			pll->link_freq = sensor->hwcfg.op_sys_clock[j];
 
 			rval = ccs_pll_try(sensor, pll);
 			dev_dbg(&client->dev, "link freq %u Hz, bpp %u %s\n",
@@ -1117,21 +1117,21 @@ static int ccs_change_cci_addr(struct ccs_sensor *sensor)
 	int rval;
 	u32 val;
 
-	client->addr = sensor->hwcfg->i2c_addr_dfl;
+	client->addr = sensor->hwcfg.i2c_addr_dfl;
 
 	rval = ccs_write(sensor, CCI_ADDRESS_CTRL,
-			 sensor->hwcfg->i2c_addr_alt << 1);
+			 sensor->hwcfg.i2c_addr_alt << 1);
 	if (rval)
 		return rval;
 
-	client->addr = sensor->hwcfg->i2c_addr_alt;
+	client->addr = sensor->hwcfg.i2c_addr_alt;
 
 	/* verify addr change went ok */
 	rval = ccs_read(sensor, CCI_ADDRESS_CTRL, &val);
 	if (rval)
 		return rval;
 
-	if (val != sensor->hwcfg->i2c_addr_alt << 1)
+	if (val != sensor->hwcfg.i2c_addr_alt << 1)
 		return -ENODEV;
 
 	return 0;
@@ -1145,13 +1145,13 @@ static int ccs_change_cci_addr(struct ccs_sensor *sensor)
 static int ccs_setup_flash_strobe(struct ccs_sensor *sensor)
 {
 	struct ccs_flash_strobe_parms *strobe_setup;
-	unsigned int ext_freq = sensor->hwcfg->ext_clk;
+	unsigned int ext_freq = sensor->hwcfg.ext_clk;
 	u32 tmp;
 	u32 strobe_adjustment;
 	u32 strobe_width_high_rs;
 	int rval;
 
-	strobe_setup = sensor->hwcfg->strobe_setup;
+	strobe_setup = sensor->hwcfg.strobe_setup;
 
 	/*
 	 * How to calculate registers related to strobe length. Please
@@ -1259,7 +1259,7 @@ static int ccs_setup_flash_strobe(struct ccs_sensor *sensor)
 	rval = ccs_write(sensor, FLASH_TRIGGER_RS, strobe_setup->trigger);
 
 out:
-	sensor->hwcfg->strobe_setup->trigger = 0;
+	sensor->hwcfg.strobe_setup->trigger = 0;
 
 	return rval;
 }
@@ -1298,7 +1298,7 @@ static int ccs_power_on(struct device *dev)
 	gpiod_set_value(sensor->reset, 0);
 	gpiod_set_value(sensor->xshutdown, 1);
 
-	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg->ext_clk);
+	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg.ext_clk);
 	usleep_range(sleep, sleep);
 
 	/*
@@ -1312,7 +1312,7 @@ static int ccs_power_on(struct device *dev)
 	 * is found.
 	 */
 
-	if (sensor->hwcfg->i2c_addr_alt) {
+	if (sensor->hwcfg.i2c_addr_alt) {
 		rval = ccs_change_cci_addr(sensor);
 		if (rval) {
 			dev_err(dev, "cci address change error\n");
@@ -1326,7 +1326,7 @@ static int ccs_power_on(struct device *dev)
 		goto out_cci_addr_fail;
 	}
 
-	if (sensor->hwcfg->i2c_addr_alt) {
+	if (sensor->hwcfg.i2c_addr_alt) {
 		rval = ccs_change_cci_addr(sensor);
 		if (rval) {
 			dev_err(dev, "cci address change error\n");
@@ -1342,13 +1342,13 @@ static int ccs_power_on(struct device *dev)
 	}
 
 	rval = ccs_write(sensor, EXTCLK_FREQUENCY_MHZ,
-			 sensor->hwcfg->ext_clk / (1000000 / (1 << 8)));
+			 sensor->hwcfg.ext_clk / (1000000 / (1 << 8)));
 	if (rval) {
 		dev_err(dev, "extclk frequency set failed\n");
 		goto out_cci_addr_fail;
 	}
 
-	rval = ccs_write(sensor, CSI_LANE_MODE, sensor->hwcfg->lanes - 1);
+	rval = ccs_write(sensor, CSI_LANE_MODE, sensor->hwcfg.lanes - 1);
 	if (rval) {
 		dev_err(dev, "csi lane mode set failed\n");
 		goto out_cci_addr_fail;
@@ -1362,7 +1362,7 @@ static int ccs_power_on(struct device *dev)
 	}
 
 	rval = ccs_write(sensor, CSI_SIGNALING_MODE,
-			 sensor->hwcfg->csi_signalling_mode);
+			 sensor->hwcfg.csi_signalling_mode);
 	if (rval) {
 		dev_err(dev, "csi signalling mode set failed\n");
 		goto out_cci_addr_fail;
@@ -1406,7 +1406,7 @@ static int ccs_power_off(struct device *dev)
 	 * really see a power off and next time the cci address change
 	 * will fail. So do a soft reset explicitly here.
 	 */
-	if (sensor->hwcfg->i2c_addr_alt)
+	if (sensor->hwcfg.i2c_addr_alt)
 		ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
 
 	gpiod_set_value(sensor->reset, 1);
@@ -1545,8 +1545,8 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
 	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
 	     SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE) &&
-	    sensor->hwcfg->strobe_setup != NULL &&
-	    sensor->hwcfg->strobe_setup->trigger != 0) {
+	    sensor->hwcfg.strobe_setup != NULL &&
+	    sensor->hwcfg.strobe_setup->trigger != 0) {
 		rval = ccs_setup_flash_strobe(sensor);
 		if (rval)
 			goto out;
@@ -2844,9 +2844,9 @@ static int __maybe_unused ccs_resume(struct device *dev)
 	return rval;
 }
 
-static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
+static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 {
-	struct ccs_hwconfig *hwcfg;
+	struct ccs_hwconfig *hwcfg = &sensor->hwcfg;
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
@@ -2856,7 +2856,7 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return NULL;
+		return -ENODEV;
 
 	bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
 	rval = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
@@ -2868,10 +2868,6 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 	if (rval)
 		goto out_err;
 
-	hwcfg = devm_kzalloc(dev, sizeof(*hwcfg), GFP_KERNEL);
-	if (!hwcfg)
-		goto out_err;
-
 	switch (bus_cfg.bus_type) {
 	case V4L2_MBUS_CSI2_DPHY:
 		hwcfg->csi_signalling_mode = CCS_CSI_SIGNALING_MODE_CSI_2_DPHY;
@@ -2885,6 +2881,7 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 		break;
 	default:
 		dev_err(dev, "unsupported bus %u\n", bus_cfg.bus_type);
+		rval = -EINVAL;
 		goto out_err;
 	}
 
@@ -2901,6 +2898,7 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 			break;
 		default:
 			dev_err(dev, "invalid rotation %u\n", rotation);
+			rval = -EINVAL;
 			goto out_err;
 		}
 	}
@@ -2915,14 +2913,17 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_warn(dev, "no link frequencies defined\n");
+		rval = -EINVAL;
 		goto out_err;
 	}
 
 	hwcfg->op_sys_clock = devm_kcalloc(
 		dev, bus_cfg.nr_of_link_frequencies + 1 /* guardian */,
 		sizeof(*hwcfg->op_sys_clock), GFP_KERNEL);
-	if (!hwcfg->op_sys_clock)
+	if (!hwcfg->op_sys_clock) {
+		rval = -ENOMEM;
 		goto out_err;
+	}
 
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
 		hwcfg->op_sys_clock[i] = bus_cfg.link_frequencies[i];
@@ -2931,29 +2932,30 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	fwnode_handle_put(ep);
-	return hwcfg;
+
+	return 0;
 
 out_err:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	fwnode_handle_put(ep);
-	return NULL;
+
+	return rval;
 }
 
 static int ccs_probe(struct i2c_client *client)
 {
 	struct ccs_sensor *sensor;
-	struct ccs_hwconfig *hwcfg = ccs_get_hwconfig(&client->dev);
 	unsigned int i;
 	int rval;
 
-	if (hwcfg == NULL)
-		return -ENODEV;
-
 	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
 	if (sensor == NULL)
 		return -ENOMEM;
 
-	sensor->hwcfg = hwcfg;
+	rval = ccs_get_hwconfig(sensor, &client->dev);
+	if (rval)
+		return rval;
+
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
 	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
@@ -2976,33 +2978,33 @@ static int ccs_probe(struct i2c_client *client)
 	}
 
 	if (sensor->ext_clk) {
-		if (sensor->hwcfg->ext_clk) {
+		if (sensor->hwcfg.ext_clk) {
 			unsigned long rate;
 
 			rval = clk_set_rate(sensor->ext_clk,
-					    sensor->hwcfg->ext_clk);
+					    sensor->hwcfg.ext_clk);
 			if (rval < 0) {
 				dev_err(&client->dev,
 					"unable to set clock freq to %u\n",
-					sensor->hwcfg->ext_clk);
+					sensor->hwcfg.ext_clk);
 				return rval;
 			}
 
 			rate = clk_get_rate(sensor->ext_clk);
-			if (rate != sensor->hwcfg->ext_clk) {
+			if (rate != sensor->hwcfg.ext_clk) {
 				dev_err(&client->dev,
 					"can't set clock freq, asked for %u but got %lu\n",
-					sensor->hwcfg->ext_clk, rate);
+					sensor->hwcfg.ext_clk, rate);
 				return rval;
 			}
 		} else {
-			sensor->hwcfg->ext_clk = clk_get_rate(sensor->ext_clk);
+			sensor->hwcfg.ext_clk = clk_get_rate(sensor->ext_clk);
 			dev_dbg(&client->dev, "obtained clock freq %u\n",
-				sensor->hwcfg->ext_clk);
+				sensor->hwcfg.ext_clk);
 		}
-	} else if (sensor->hwcfg->ext_clk) {
+	} else if (sensor->hwcfg.ext_clk) {
 		dev_dbg(&client->dev, "assuming clock freq %u\n",
-			sensor->hwcfg->ext_clk);
+			sensor->hwcfg.ext_clk);
 	} else {
 		dev_err(&client->dev, "unable to obtain clock freq\n");
 		return -EINVAL;
@@ -3055,7 +3057,7 @@ static int ccs_probe(struct i2c_client *client)
 	 *
 	 * Rotation also changes the bayer pattern.
 	 */
-	if (sensor->hwcfg->module_board_orient ==
+	if (sensor->hwcfg.module_board_orient ==
 	    CCS_MODULE_BOARD_ORIENT_180)
 		sensor->hvflip_inv_mask =
 			CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR |
@@ -3127,8 +3129,8 @@ static int ccs_probe(struct i2c_client *client)
 
 	/* prepare PLL configuration input values */
 	sensor->pll.bus_type = SMIAPP_PLL_BUS_TYPE_CSI2;
-	sensor->pll.csi2.lanes = sensor->hwcfg->lanes;
-	sensor->pll.ext_clk_freq_hz = sensor->hwcfg->ext_clk;
+	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
+	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
 	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2,
diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
index 5a24da1d7aa9..facec28f8447 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -152,13 +152,13 @@ static int jt8ev1_post_poweron(struct ccs_sensor *sensor)
 	if (rval < 0)
 		return rval;
 
-	switch (sensor->hwcfg->ext_clk) {
+	switch (sensor->hwcfg.ext_clk) {
 	case 9600000:
 		return ccs_write_addr_8s(sensor, regs_96,
 				       ARRAY_SIZE(regs_96));
 	default:
 		dev_warn(&client->dev, "no MSRs for %d Hz ext_clk\n",
-			 sensor->hwcfg->ext_clk);
+			 sensor->hwcfg.ext_clk);
 		return 0;
 	}
 }
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index bfe39e02f5e9..2d1e8339f663 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -215,7 +215,7 @@ struct ccs_sensor {
 	struct ccs_subdev *binner;
 	struct ccs_subdev *scaler;
 	struct ccs_subdev *pixel_array;
-	struct ccs_hwconfig *hwcfg;
+	struct ccs_hwconfig hwcfg;
 	struct regulator *vana;
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
-- 
2.27.0

