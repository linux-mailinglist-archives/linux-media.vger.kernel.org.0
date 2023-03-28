Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797356CBED3
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 14:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjC1MQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 08:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjC1MQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 08:16:33 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366CF76A7
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680005792; x=1711541792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NahvOJt75V/1P3mR8GhMXg9CXvVo8Snhqa9L5/kzE7w=;
  b=g6k3CCyDrSbjvzbaGaeAPYak4b/4ZmAHqGRpa/i4Ggz/PdffScJWSLS1
   ouy5ycSNmc2vlafhuv4LolVtNWya4wPyvXrNsv4jBVr9ye7nMTNlnMWjN
   QIR23ik7UWGJAj/IQziNlwMP8mHR5lJuSS36AsDU+USLD5M84suPTPPpr
   CfHEFd3otwaGqtYSmFrPHtPey71ywVT74jnx5X+pjQ02Ze1Vlb3jQTKhb
   0as4EGVY/TysKe9/FZ2ry5rvKEmH1XzE5zCUhGNBSZCwU9gavnT/QG+/f
   sRL/7hNb3eor01ReXgnDVxRSDzPeFix0+0U2Hf4LJ9p+wY1bDnPUhc2v2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340571533"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="340571533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="716471970"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="716471970"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:16:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 522481224DB;
        Tue, 28 Mar 2023 15:16:27 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH 2/2] media: ccs: Add V4L2 controls from properties
Date:   Tue, 28 Mar 2023 15:16:25 +0300
Message-Id: <20230328121625.1472037-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230328121625.1472037-1-sakari.ailus@linux.intel.com>
References: <20230328121625.1472037-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2 controls (currently CAMERA_SENSOR_ROTATION and
CAMERA_SENSOR_ORIENTATION) from properties.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 35 ++++++++++++--------------------
 drivers/media/i2c/ccs/ccs.h      | 13 ------------
 2 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 431dd7d24cdc..b08938f42f61 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -796,16 +796,24 @@ static const struct v4l2_ctrl_ops ccs_ctrl_ops = {
 static int ccs_init_controls(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	int default_flip sensor->hwcfg.module_board_orient ==
-		CCS_MODULE_BOARD_ORIENT_180;
+	struct v4l2_fwnode_device_properties props;
 	int rval;
 
-	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
+	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 19);
 	if (rval)
 		return rval;
 
 	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
 
+	rval = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (rval)
+		return rval;
+
+	rval = v4l2_ctrl_new_fwnode_properties(&sensor->pixel_array->ctrl_handler,
+					       &ccs_ctrl_ops, &props);
+	if (rval)
+		return rval;
+
 	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
 	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
 		struct {
@@ -946,10 +954,10 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
 	sensor->hflip = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-		V4L2_CID_HFLIP, 0, 1, 1, default_flip);
+		V4L2_CID_HFLIP, 0, 1, 1, props.rotation == 180);
 	sensor->vflip = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-		V4L2_CID_VFLIP, 0, 1, 1, default_flip);
+		V4L2_CID_VFLIP, 0, 1, 1, props.rotation == 180);
 
 	sensor->vblank = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
@@ -3183,7 +3191,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	u32 rotation;
 	unsigned int i;
 	int rval;
 
@@ -3222,22 +3229,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		goto out_err;
 	}
 
-	rval = fwnode_property_read_u32(fwnode, "rotation", &rotation);
-	if (!rval) {
-		switch (rotation) {
-		case 180:
-			hwcfg->module_board_orient =
-				CCS_MODULE_BOARD_ORIENT_180;
-			fallthrough;
-		case 0:
-			break;
-		default:
-			dev_err(dev, "invalid rotation %u\n", rotation);
-			rval = -EINVAL;
-			goto out_err;
-		}
-	}
-
 	rval = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 					&hwcfg->ext_clk);
 	if (rval)
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index ea8909f011d9..a94c796cea48 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -57,17 +57,6 @@
 #define CCS_LIM_AT(sensor, limit, offset)	\
 	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(offset))
 
-/*
- * Sometimes due to board layout considerations the camera module can be
- * mounted rotated. The typical rotation used is 180 degrees which can be
- * corrected by giving a default H-FLIP and V-FLIP in the sensor readout.
- * FIXME: rotation also changes the bayer pattern.
- */
-enum ccs_module_board_orient {
-	CCS_MODULE_BOARD_ORIENT_0 = 0,
-	CCS_MODULE_BOARD_ORIENT_180,
-};
-
 struct ccs_flash_strobe_parms {
 	u8 mode;
 	u32 strobe_width_high_us;
@@ -90,8 +79,6 @@ struct ccs_hwconfig {
 	u32 csi_signalling_mode;	/* CCS_CSI_SIGNALLING_MODE_* */
 	u64 *op_sys_clock;
 
-	enum ccs_module_board_orient module_board_orient;
-
 	struct ccs_flash_strobe_parms *strobe_setup;
 };
 
-- 
2.30.2

