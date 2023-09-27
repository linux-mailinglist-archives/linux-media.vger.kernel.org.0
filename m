Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63717B0A60
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbjI0QeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjI0QeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:34:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ABE1A7
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832424; x=1727368424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=51IKnRNhlzYTJC5dDcaCSK7PZqYDytKN7vz7OV7ICrk=;
  b=bi1b6k6ViMFoj6vQigyszAYGi2m/1EG+6LxtMR9Vzbb+bh/mOGim5nwG
   Az1Mt0QSGmSbYXkime6Uomjjd3EbgGr5hOX1CkdnUUZhZMJozoJOvtO1V
   hZKXOrELzTXMaAxBMnkYCRD6UnhHpZpXSPvAATIBhVvZSaxdYKu818B13
   VgrKGQY/VDM6MYZcL4O4KAmeNOyIL3utsSlcv96iCu/HWNZJzes2ijDYv
   p5hTRZTY6KyvgZU3p6C4EQ3lgU0FYl7p4+9lamdh9KQG3E0xFkmSrRQQR
   TPJQyg36/HobnLxPNz1rf42j1e0Bxm9PDhBCKxVws2R9+UJZ28g5hK1i3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372219012"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="372219012"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="725870239"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="725870239"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:40 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3172211F967;
        Wed, 27 Sep 2023 19:33:35 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 25/26] media: ccs: Move acquiring and release mutex to set_stream callback
Date:   Wed, 27 Sep 2023 19:32:11 +0300
Message-Id: <20230927163212.402025-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both ccs_start_streaming() and ccs_stop_streaming() take the mutex for
serialising starting and stopping streaming. Move acquiring and releasing
the mutex out to the caller, ccs_set_stream(), in order to simplify error
handling in both of the functions.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 56 ++++++++++++++------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 7ae191b7cec5..ad63fce546cd 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1743,13 +1743,11 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	unsigned int binning_mode;
 	int rval;
 
-	mutex_lock(&sensor->mutex);
-
 	rval = ccs_write(sensor, CSI_DATA_FORMAT,
 			 (sensor->csi_format->width << 8) |
 			 sensor->csi_format->compressed);
 	if (rval)
-		goto out;
+		return rval;
 
 	/* Binning configuration */
 	if (sensor->binning_horizontal == 1 &&
@@ -1762,38 +1760,38 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
 		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		binning_mode = 1;
 	}
 	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	/* Set up PLL */
 	rval = ccs_pll_configure(sensor);
 	if (rval)
-		goto out;
+		return rval;
 
 	/* Analog crop start coordinates */
 	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	/* Analog crop end coordinates */
 	rval = ccs_write(sensor, X_ADDR_END,
 			 sensor->pa_src.left + sensor->pa_src.width - 1);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	rval = ccs_write(sensor, Y_ADDR_END,
 			 sensor->pa_src.top + sensor->pa_src.height - 1);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	/*
 	 * Output from pixel array, including blanking, is set using
@@ -1806,22 +1804,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
 				 sensor->scaler_sink.left);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
 				 sensor->scaler_sink.top);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
 				 sensor->scaler_sink.width);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
 				 sensor->scaler_sink.height);
 		if (rval < 0)
-			goto out;
+			return rval;
 	}
 
 	/* Scaling */
@@ -1829,26 +1827,26 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	    != CCS_SCALING_CAPABILITY_NONE) {
 		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
 		if (rval < 0)
-			goto out;
+			return rval;
 	}
 
 	/* Output size from sensor */
 	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
 	if (rval < 0)
-		goto out;
+		return rval;
 	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	/* Configure embedded data */
 	if (sensor->csi_format->compressed >= 16) {
 		rval = ccs_write(sensor, EMB_DATA_CTRL, sensor->emb_data_ctrl);
 		if (rval < 0)
-			goto out;
+			return rval;
 	}
 
 	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
@@ -1858,21 +1856,16 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	    sensor->hwcfg.strobe_setup->trigger != 0) {
 		rval = ccs_setup_flash_strobe(sensor);
 		if (rval)
-			goto out;
+			return rval;
 	}
 
 	rval = ccs_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");
-		goto out;
+		return rval;
 	}
 
-	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
-
-out:
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
+	return ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 }
 
 static int ccs_stop_streaming(struct ccs_sensor *sensor)
@@ -1880,17 +1873,14 @@ static int ccs_stop_streaming(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	mutex_lock(&sensor->mutex);
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
-		goto out;
+		return rval;
 
 	rval = ccs_call_quirk(sensor, post_streamoff);
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-out:
-	mutex_unlock(&sensor->mutex);
 	return rval;
 }
 
@@ -1942,7 +1932,9 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 		return 0;
 
 	if (!enable) {
+		mutex_lock(&sensor->mutex);
 		ccs_stop_streaming(sensor);
+		mutex_unlock(&sensor->mutex);
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
 		pm_runtime_put_autosuspend(&client->dev);
@@ -1956,7 +1948,9 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 
 	sensor->streaming = true;
 
+	mutex_lock(&sensor->mutex);
 	rval = ccs_start_streaming(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (rval < 0) {
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
-- 
2.39.2

