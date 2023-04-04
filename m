Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157B36D6D39
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 21:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236110AbjDDTdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 15:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236083AbjDDTdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 15:33:15 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E4D3A92
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 12:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680636794; x=1712172794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Kx7Uyki1fUiXxTZLuaNTX+LBfErfRrj5E4f0V61PKY=;
  b=NgIHXFHSl07mG3p6AJTZcF6dhjs54H0j7GL+XwhAVkAeMG79QOd5tP4f
   y9h8zYdsc6B5WZTjJcWZnli/SyLjoCdy1/32tNV5/uM9i3Nko387Rkg+M
   fJAV9K23DKvP7SMKnBUclFnM6lmYJjU7IUvPEVDC+8U2Rcc9XNXXUJhSb
   dxZu27JDGeA+UFAFvxVoz8jRWhqD4s8+1zenHC0emQngTT2qooGsCP6cr
   M3qRBlAqtSD/U/i/El5bQjc0/+umDJ1duZ2oHiw1buN6xPWeGcc3+JpMx
   t+m2lCGpLECE1QbZUVblIycZdc7n7GFl1g8ecrWFfQ9UxCm57u6KN3cfa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370104303"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="370104303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689009507"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="689009507"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:33:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DB988122E17;
        Tue,  4 Apr 2023 22:23:48 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 1/2] media: ccs: Align flipping behaviour with other drivers
Date:   Tue,  4 Apr 2023 22:23:46 +0300
Message-Id: <20230404192347.1798323-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404192347.1798323-1-sakari.ailus@linux.intel.com>
References: <20230404192347.1798323-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No longer mirror flipping controls if the sensor is mounted upside down.

This way the behaviour of the flipping controls and rotation of the sensor
are aligned with the rest of the drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 39 --------------------------------
 drivers/media/i2c/ccs/ccs.h      | 14 ------------
 2 files changed, 53 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4a14d7e5d9f2..d44d3a44166f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -569,8 +569,6 @@ static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 			flip |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
 	}
 
-	flip ^= sensor->hvflip_inv_mask;
-
 	dev_dbg(&client->dev, "flip %u\n", flip);
 	return sensor->default_pixel_order ^ flip;
 }
@@ -632,8 +630,6 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (sensor->vflip->val)
 			orient |= CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
 
-		orient ^= sensor->hvflip_inv_mask;
-
 		ccs_update_mbus_formats(sensor);
 
 		break;
@@ -3224,22 +3220,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
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
@@ -3437,25 +3417,6 @@ static int ccs_probe(struct i2c_client *client)
 	if (rval < 0)
 		goto out_free_ccs_limits;
 
-	/*
-	 * Handle Sensor Module orientation on the board.
-	 *
-	 * The application of H-FLIP and V-FLIP on the sensor is modified by
-	 * the sensor orientation on the board.
-	 *
-	 * For CCS_BOARD_SENSOR_ORIENT_180 the default behaviour is to set
-	 * both H-FLIP and V-FLIP for normal operation which also implies
-	 * that a set/unset operation for user space HFLIP and VFLIP v4l2
-	 * controls will need to be internally inverted.
-	 *
-	 * Rotation also changes the bayer pattern.
-	 */
-	if (sensor->hwcfg.module_board_orient ==
-	    CCS_MODULE_BOARD_ORIENT_180)
-		sensor->hvflip_inv_mask =
-			CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR |
-			CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
-
 	rval = ccs_call_quirk(sensor, limits);
 	if (rval) {
 		dev_err(&client->dev, "limits quirks failed\n");
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 6beac375cc48..a94c796cea48 100644
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
 
@@ -243,7 +230,6 @@ struct ccs_sensor {
 	u8 scale_m;
 	u8 scaling_mode;
 
-	u8 hvflip_inv_mask; /* H/VFLIP inversion due to sensor orientation */
 	u8 frame_skip;
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
-- 
2.30.2

