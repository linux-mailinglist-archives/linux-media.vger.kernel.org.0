Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE6A4DADB5
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354951AbiCPJsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348960AbiCPJsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:48:46 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54ACC63BC9
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:47:32 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 99E9C634C90
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 11:47:29 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: ccs: Use %u for printing unsigned values, remove extra debug print
Date:   Wed, 16 Mar 2022 11:45:24 +0200
Message-Id: <20220316094525.53664-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use %u for printing unsigned integer or u32 values. In a lot of cases %d
was being used instead.

Also remove an extra debug print --- the number of lanes is already
printed by V4L2 when parsing fwnode endpoints when dynamic debug is
enabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 03e841b8443f..547e18b6b4c4 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -121,7 +121,7 @@ void ccs_replace_limit(struct ccs_sensor *sensor,
 
 	linfo = &ccs_limits[ccs_limit_offsets[limit].info];
 
-	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" %u = %d, 0x%x\n",
+	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" %u = %u, 0x%x\n",
 		linfo->reg, linfo->name, offset, val, val);
 
 	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
@@ -288,7 +288,7 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 				CCS_FRAME_FORMAT_DESCRIPTOR_4_PIXELS_MASK;
 		} else {
 			dev_dbg(&client->dev,
-				"invalid frame format model type %d\n",
+				"invalid frame format model type %u\n",
 				fmt_model_type);
 			return -EINVAL;
 		}
@@ -320,7 +320,7 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 		}
 
 		dev_dbg(&client->dev,
-			"%s pixels: %d %s (pixelcode %u)\n",
+			"%s pixels: %u %s (pixelcode %u)\n",
 			what, pixels, which, pixelcode);
 
 		if (i < ncol_desc) {
@@ -353,9 +353,9 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 		sensor->image_start = sensor->embedded_end;
 	}
 
-	dev_dbg(&client->dev, "embedded data from lines %d to %d\n",
+	dev_dbg(&client->dev, "embedded data from lines %u to %u\n",
 		sensor->embedded_start, sensor->embedded_end);
-	dev_dbg(&client->dev, "image data starts at line %d\n",
+	dev_dbg(&client->dev, "image data starts at line %u\n",
 		sensor->image_start);
 
 	return 0;
@@ -571,7 +571,7 @@ static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 
 	flip ^= sensor->hvflip_inv_mask;
 
-	dev_dbg(&client->dev, "flip %d\n", flip);
+	dev_dbg(&client->dev, "flip %u\n", flip);
 	return sensor->default_pixel_order ^ flip;
 }
 
@@ -1056,18 +1056,18 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 
 	type = CCS_LIM(sensor, DATA_FORMAT_MODEL_TYPE);
 
-	dev_dbg(&client->dev, "data_format_model_type %d\n", type);
+	dev_dbg(&client->dev, "data_format_model_type %u\n", type);
 
 	rval = ccs_read(sensor, PIXEL_ORDER, &pixel_order);
 	if (rval)
 		return rval;
 
 	if (pixel_order >= ARRAY_SIZE(pixel_order_str)) {
-		dev_dbg(&client->dev, "bad pixel order %d\n", pixel_order);
+		dev_dbg(&client->dev, "bad pixel order %u\n", pixel_order);
 		return -EINVAL;
 	}
 
-	dev_dbg(&client->dev, "pixel order %d (%s)\n", pixel_order,
+	dev_dbg(&client->dev, "pixel order %u (%s)\n", pixel_order,
 		pixel_order_str[pixel_order]);
 
 	switch (type) {
@@ -1105,7 +1105,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 			    (fmt & CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_MASK))
 				continue;
 
-			dev_dbg(&client->dev, "jolly good! %d\n", j);
+			dev_dbg(&client->dev, "jolly good! %u\n", j);
 
 			sensor->default_mbus_frame_fmts |= 1 << j;
 		}
@@ -1999,7 +1999,7 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 
 	mutex_lock(&sensor->mutex);
 
-	dev_err(&client->dev, "subdev %s, pad %d, index %d\n",
+	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
 
 	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
@@ -2017,7 +2017,7 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 
 		if (idx == code->index) {
 			code->code = ccs_csi_data_formats[i].code;
-			dev_err(&client->dev, "found index %d, i %d, code %x\n",
+			dev_err(&client->dev, "found index %u, i %u, code %x\n",
 				code->index, i, code->code);
 			rval = 0;
 			break;
@@ -2386,7 +2386,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 	max_m = clamp(max_m, CCS_LIM(sensor, SCALER_M_MIN),
 		      CCS_LIM(sensor, SCALER_M_MAX));
 
-	dev_dbg(&client->dev, "scaling: a %d b %d max_m %d\n", a, b, max_m);
+	dev_dbg(&client->dev, "scaling: a %u b %u max_m %u\n", a, b, max_m);
 
 	min = min(max_m, min(a, b));
 	max = min(max_m, max(a, b));
@@ -2416,7 +2416,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 			sel->r.height,
 			sel->flags);
 
-		dev_dbg(&client->dev, "trying factor %d (%d)\n", try[i], i);
+		dev_dbg(&client->dev, "trying factor %u (%u)\n", try[i], i);
 
 		if (this > best) {
 			scale_m = try[i];
@@ -3221,8 +3221,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		goto out_err;
 	}
 
-	dev_dbg(dev, "lanes %u\n", hwcfg->lanes);
-
 	rval = fwnode_property_read_u32(fwnode, "rotation", &rotation);
 	if (!rval) {
 		switch (rotation) {
@@ -3244,7 +3242,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	if (rval)
 		dev_info(dev, "can't get clock-frequency\n");
 
-	dev_dbg(dev, "clk %d, mode %d\n", hwcfg->ext_clk,
+	dev_dbg(dev, "clk %u, mode %u\n", hwcfg->ext_clk,
 		hwcfg->csi_signalling_mode);
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-- 
2.30.2

