Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584906CBED2
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 14:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjC1MQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 08:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjC1MQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 08:16:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C3B76A7
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 05:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680005790; x=1711541790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47h9sHZgbVTOS7ePAWZEJ+IW+ejo+7M9iNRTYcIao2Y=;
  b=bmmMWY0iB4VcXFDgu7F03W0o5KPcrdBI99ErW/kJ01nashnlDYsTm0L9
   sV675fG6Q4mts6rHaj7pWMmAe9iqp140g8n1TGx00tW93T3AXNY4YB0CY
   MemNtqd5PH1e/9qL9k/kq5TroqDjzNNlxDCErpm7SsEwg6ImEmL7+Bh6/
   Mnpy4dfkJuoX4whvyiTrvlPZAjnKTlP5LABKcNta46XBBbBi3D4jqMq1h
   wcsFgaQh/Vx8EsqWUSxCkE1/q4CGyFY4L4/XSJdZ4XSbPAHeHABV68p/Q
   cYWHBksvFlItuuCPVfdCykS8nDIzYFf3IY+sfZMgOv4R7/N223tGdF4r6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426812960"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="426812960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="773133439"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773133439"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:16:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 706AF12227E;
        Tue, 28 Mar 2023 15:16:26 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH 1/2] media: ccs: Align flipping behaviour with other drivers
Date:   Tue, 28 Mar 2023 15:16:24 +0300
Message-Id: <20230328121625.1472037-2-sakari.ailus@linux.intel.com>
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

No longer mirror flipping controls if the sensor is mounted upside down.
Instead, change the default flip control values.

This way the behaviour of the flipping controls and rotation of the sensor
are aligned with the rest of the drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 29 ++++-------------------------
 drivers/media/i2c/ccs/ccs.h      |  1 -
 2 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4a14d7e5d9f2..431dd7d24cdc 100644
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
@@ -800,6 +796,8 @@ static const struct v4l2_ctrl_ops ccs_ctrl_ops = {
 static int ccs_init_controls(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int default_flip sensor->hwcfg.module_board_orient ==
+		CCS_MODULE_BOARD_ORIENT_180;
 	int rval;
 
 	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
@@ -948,10 +946,10 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
 
 	sensor->hflip = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-		V4L2_CID_HFLIP, 0, 1, 1, 0);
+		V4L2_CID_HFLIP, 0, 1, 1, default_flip);
 	sensor->vflip = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
-		V4L2_CID_VFLIP, 0, 1, 1, 0);
+		V4L2_CID_VFLIP, 0, 1, 1, default_flip);
 
 	sensor->vblank = v4l2_ctrl_new_std(
 		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
@@ -3437,25 +3435,6 @@ static int ccs_probe(struct i2c_client *client)
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
index 6beac375cc48..ea8909f011d9 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -243,7 +243,6 @@ struct ccs_sensor {
 	u8 scale_m;
 	u8 scaling_mode;
 
-	u8 hvflip_inv_mask; /* H/VFLIP inversion due to sensor orientation */
 	u8 frame_skip;
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
-- 
2.30.2

