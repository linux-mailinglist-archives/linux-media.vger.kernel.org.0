Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0321D7E2166
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjKFM0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbjKFM0R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:17 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC51A6
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273573; x=1730809573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WJ3lI2/J7sg/+nJQ1JLepTD8Y3tzV6im7swGZh9DpqI=;
  b=cpvlbzQj7iWIRNtmX+LLzRr9IGUUkBbu/oRPvQtGn1xb0yaDa5kGtPR4
   iv1A8WITw8ChZWOC9eRBojPZmJVTMJ0vOgkZ5lKNKc+A3FksrKjqqgCEL
   AyUcKhgR/bWRUMzXFVEQB8N9BtlJTiY/xud85pC/XxKWIVrO4StGsvfKw
   n05FOs2g8haTa5BxmAKn+EDa0LoENi3dk4xwkgWvQ1H91DZ/uCkZmuEjv
   4sJ2p+M/RymT4spQYpx5Atcu1xEBv5sz9yL0PGG4hR2mmuacy2z0f4yZD
   duq6dH0Bq8Ot+yFEP+JGzbZcua6HA0uVoQmxV4VdSCqLIkbYWI6tjE9Do
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369469657"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369469657"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879427739"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="879427739"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A7491203CE;
        Mon,  6 Nov 2023 14:26:07 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 19/31] media: ccs: Use {enable,disable}_streams operations
Date:   Mon,  6 Nov 2023 14:25:27 +0200
Message-Id: <20231106122539.1268265-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch from s_stream() video op to enable_streams() and disable_streams()
pad operations. They are preferred and required for streams support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 183 +++++++++++++++----------------
 1 file changed, 86 insertions(+), 97 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 7e6166e70adb..e416b7cb48c2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1705,22 +1705,64 @@ static int ccs_power_off(struct device *dev)
 }
 
 /* -----------------------------------------------------------------------------
- * Video stream management
+ * V4L2 subdev video operations
  */
 
-static int ccs_start_streaming(struct ccs_sensor *sensor)
+static int ccs_pm_get_init(struct ccs_sensor *sensor)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int rval;
+
+	/*
+	 * It can't use pm_runtime_resume_and_get() here, as the driver
+	 * relies at the returned value to detect if the device was already
+	 * active or not.
+	 */
+	rval = pm_runtime_get_sync(&client->dev);
+	if (rval < 0)
+		goto error;
+
+	/* Device was already active, so don't set controls */
+	if (rval == 1)
+		return 0;
+
+	/* Restore V4L2 controls to the previously suspended device */
+	rval = __v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
+	if (rval)
+		goto error;
+
+	rval = __v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
+	if (rval)
+		goto error;
+
+	/* Keep PM runtime usage_count incremented on success */
+	return 0;
+error:
+	pm_runtime_put(&client->dev);
+	return rval;
+}
+
+static int ccs_enable_streams(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *state, u32 pad,
+			      u64 streams_mask)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int binning_mode;
 	int rval;
 
-	mutex_lock(&sensor->mutex);
+	if (pad != CCS_PAD_SRC)
+		return -EINVAL;
+
+	rval = ccs_pm_get_init(sensor);
+	if (rval)
+		return rval;
 
 	rval = ccs_write(sensor, CSI_DATA_FORMAT,
 			 (sensor->csi_format->width << 8) |
 			 sensor->csi_format->compressed);
 	if (rval)
-		goto out;
+		goto err_pm_put;
 
 	/* Binning configuration */
 	if (sensor->binning_horizontal == 1 &&
@@ -1733,38 +1775,38 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
 		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		binning_mode = 1;
 	}
 	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	/* Set up PLL */
 	rval = ccs_pll_configure(sensor);
 	if (rval)
-		goto out;
+		goto err_pm_put;
 
 	/* Analog crop start coordinates */
 	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	/* Analog crop end coordinates */
 	rval = ccs_write(sensor, X_ADDR_END,
 			 sensor->pa_src.left + sensor->pa_src.width - 1);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	rval = ccs_write(sensor, Y_ADDR_END,
 			 sensor->pa_src.top + sensor->pa_src.height - 1);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	/*
 	 * Output from pixel array, including blanking, is set using
@@ -1777,22 +1819,22 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
 				 sensor->scaler_sink.left);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
 				 sensor->scaler_sink.top);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
 				 sensor->scaler_sink.width);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
 				 sensor->scaler_sink.height);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 	}
 
 	/* Scaling */
@@ -1800,20 +1842,20 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	    != CCS_SCALING_CAPABILITY_NONE) {
 		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 
 		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
 		if (rval < 0)
-			goto out;
+			goto err_pm_put;
 	}
 
 	/* Output size from sensor */
 	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
 	if (rval < 0)
-		goto out;
+		goto err_pm_put;
 
 	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
 	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
@@ -1822,109 +1864,52 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 	    sensor->hwcfg.strobe_setup->trigger != 0) {
 		rval = ccs_setup_flash_strobe(sensor);
 		if (rval)
-			goto out;
+			goto err_pm_put;
 	}
 
 	rval = ccs_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");
-		goto out;
+		goto err_pm_put;
 	}
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-out:
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
-static int ccs_stop_streaming(struct ccs_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
-	if (rval)
-		goto out;
-
-	rval = ccs_call_quirk(sensor, post_streamoff);
-	if (rval)
-		dev_err(&client->dev, "post_streamoff quirks failed\n");
-
-out:
-	mutex_unlock(&sensor->mutex);
-	return rval;
-}
-
-/* -----------------------------------------------------------------------------
- * V4L2 subdev video operations
- */
-
-static int ccs_pm_get_init(struct ccs_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	int rval;
-
-	/*
-	 * It can't use pm_runtime_resume_and_get() here, as the driver
-	 * relies at the returned value to detect if the device was already
-	 * active or not.
-	 */
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0)
-		goto error;
-
-	/* Device was already active, so don't set controls */
-	if (rval == 1)
-		return 0;
+	sensor->streaming = true;
 
-	/* Restore V4L2 controls to the previously suspended device */
-	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
-	if (rval)
-		goto error;
+	return 0;
 
-	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
-	if (rval)
-		goto error;
+err_pm_put:
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
-	/* Keep PM runtime usage_count incremented on success */
-	return 0;
-error:
-	pm_runtime_put(&client->dev);
 	return rval;
 }
 
-static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
+static int ccs_disable_streams(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *state, u32 pad,
+			       u64 streams_mask)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	if (!enable) {
-		ccs_stop_streaming(sensor);
-		sensor->streaming = false;
-		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
-
-		return 0;
-	}
+	if (pad != CCS_PAD_SRC)
+		return -EINVAL;
 
-	rval = ccs_pm_get_init(sensor);
+	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
 
-	sensor->streaming = true;
+	rval = ccs_call_quirk(sensor, post_streamoff);
+	if (rval)
+		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	rval = ccs_start_streaming(sensor);
-	if (rval < 0) {
-		sensor->streaming = false;
-		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
-	}
+	sensor->streaming = false;
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
-	return rval;
+	return 0;
 }
 
 static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
@@ -1950,7 +1935,9 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
 		}
 	}
 
+	mutex_lock(&sensor->mutex);
 	rval = ccs_pm_get_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (rval)
 		return rval;
 
@@ -3046,7 +3033,7 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
-	.s_stream = ccs_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 	.pre_streamon = ccs_pre_streamon,
 	.post_streamoff = ccs_post_streamoff,
 };
@@ -3058,6 +3045,8 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+	.enable_streams = ccs_enable_streams,
+	.disable_streams = ccs_disable_streams,
 };
 
 static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
-- 
2.39.2

