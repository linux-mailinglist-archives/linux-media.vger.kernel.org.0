Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA687AFAF1
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjI0GTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjI0GTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:19:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2BF196
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695795546; x=1727331546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6cYVqCUeLnXfrYUAyPAGPd3J/a2k76+Fz1Dpl3VHKps=;
  b=SLXNEvpLc8DQZtB/pi8ge/Sr56h6WaGQ6L1st/OtAqIlPZY3Whepkfb5
   W9q62TGRYVrcNoWf4WyGRdDrJp6y1x87Zyd54LwmYP8ITvfxFCsYZSkiz
   ydnR1AhFfWKV3RBrl5mkPubbre9juIx0sS9dghR74xWcgZnf7D1/SSWqQ
   cq3KfuZpPQye4KzlXTwq3AwoTnkeIz9y8/7weXqM32R7lc9T9NY8NNlds
   R8uL7COwwhAtiYmf0p+tiimLYjzMnzgy93p0NO79m1j5ZNgb2H/aISeKu
   3CuvfwsEwugIjWXWux8t3wR8301gVBCLSlNVK7ms6Zf9JT+eaE2W2rIAk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381641157"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="381641157"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742598601"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742598601"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 66F521209F6;
        Wed, 27 Sep 2023 09:18:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v5 08/13] media: ov2740: Use sub-device active state
Date:   Wed, 27 Sep 2023 09:18:24 +0300
Message-Id: <20230927061829.366107-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
References: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use sub-device active state. Rely on control handler lock to serialise
access to the active state. Also clean up locking on s_stream handler.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 109 ++++++++++++++-----------------------
 1 file changed, 42 insertions(+), 67 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 6d5fb2789dc6..d83ac31efd9c 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -336,9 +336,6 @@ struct ov2740 {
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
-	struct mutex mutex;
-
 	/* NVM data inforamtion */
 	struct nvm_data *nvm;
 
@@ -579,7 +576,6 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	if (ret)
 		return ret;
 
-	ctrl_hdlr->lock = &ov2740->mutex;
 	cur_mode = ov2740->cur_mode;
 	size = ARRAY_SIZE(link_freq_menu_items);
 
@@ -789,15 +785,15 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
-	mutex_lock(&ov2740->mutex);
+	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
+
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-		if (ret < 0) {
-			mutex_unlock(&ov2740->mutex);
-			return ret;
-		}
+		if (ret < 0)
+			goto out_unlock;
 
 		ret = ov2740_start_streaming(ov2740);
 		if (ret) {
@@ -810,7 +806,8 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mutex_unlock(&ov2740->mutex);
+out_unlock:
+	v4l2_subdev_unlock_state(sd_state);
 
 	return ret;
 }
@@ -828,48 +825,26 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 				      height, fmt->format.width,
 				      fmt->format.height);
 
-	mutex_lock(&ov2740->mutex);
 	ov2740_update_pad_format(mode, &fmt->format);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
-	} else {
-		ov2740->cur_mode = mode;
-		__v4l2_ctrl_s_ctrl(ov2740->link_freq, mode->link_freq_index);
-		__v4l2_ctrl_s_ctrl_int64(ov2740->pixel_rate,
-					 to_pixel_rate(mode->link_freq_index));
-
-		/* Update limits and set FPS to default */
-		vblank_def = mode->vts_def - mode->height;
-		__v4l2_ctrl_modify_range(ov2740->vblank,
-					 mode->vts_min - mode->height,
-					 OV2740_VTS_MAX - mode->height, 1,
-					 vblank_def);
-		__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
-		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
-			  mode->width;
-		__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1,
-					 h_blank);
-	}
-	mutex_unlock(&ov2740->mutex);
+	*v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad) = fmt->format;
 
-	return 0;
-}
-
-static int ov2740_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *fmt)
-{
-	struct ov2740 *ov2740 = to_ov2740(sd);
-
-	mutex_lock(&ov2740->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov2740->sd,
-							  sd_state,
-							  fmt->pad);
-	else
-		ov2740_update_pad_format(ov2740->cur_mode, &fmt->format);
+		return 0;
 
-	mutex_unlock(&ov2740->mutex);
+	ov2740->cur_mode = mode;
+	__v4l2_ctrl_s_ctrl(ov2740->link_freq, mode->link_freq_index);
+	__v4l2_ctrl_s_ctrl_int64(ov2740->pixel_rate,
+				 to_pixel_rate(mode->link_freq_index));
+
+	/* Update limits and set FPS to default */
+	vblank_def = mode->vts_def - mode->height;
+	__v4l2_ctrl_modify_range(ov2740->vblank,
+				 mode->vts_min - mode->height,
+				 OV2740_VTS_MAX - mode->height, 1, vblank_def);
+	__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
+	h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
+		mode->width;
+	__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1, h_blank);
 
 	return 0;
 }
@@ -904,14 +879,11 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov2740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+static int ov2740_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state)
 {
-	struct ov2740 *ov2740 = to_ov2740(sd);
-
-	mutex_lock(&ov2740->mutex);
 	ov2740_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->state, 0));
-	mutex_unlock(&ov2740->mutex);
+				 v4l2_subdev_get_pad_format(sd, sd_state, 0));
 
 	return 0;
 }
@@ -921,10 +893,11 @@ static const struct v4l2_subdev_video_ops ov2740_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov2740_set_format,
-	.get_fmt = ov2740_get_format,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
+	.init_cfg = ov2740_init_cfg,
 };
 
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
@@ -936,10 +909,6 @@ static const struct media_entity_operations ov2740_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_internal_ops ov2740_internal_ops = {
-	.open = ov2740_open,
-};
-
 static int ov2740_check_hwcfg(struct device *dev)
 {
 	struct fwnode_handle *ep;
@@ -1005,13 +974,12 @@ static int ov2740_check_hwcfg(struct device *dev)
 static void ov2740_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
+	v4l2_subdev_cleanup(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&ov2740->mutex);
 }
 
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
@@ -1020,9 +988,11 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 	struct nvm_data *nvm = priv;
 	struct device *dev = regmap_get_device(nvm->regmap);
 	struct ov2740 *ov2740 = to_ov2740(dev_get_drvdata(dev));
+	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
-	mutex_lock(&ov2740->mutex);
+	/* Serialise sensor access */
+	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
 
 	if (nvm->nvm_buffer) {
 		memcpy(val, nvm->nvm_buffer + off, count);
@@ -1040,7 +1010,7 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 
 	pm_runtime_put(dev);
 exit:
-	mutex_unlock(&ov2740->mutex);
+	v4l2_subdev_unlock_state(sd_state);
 	return ret;
 }
 
@@ -1111,7 +1081,6 @@ static int ov2740_probe(struct i2c_client *client)
 			return dev_err_probe(dev, ret, "failed to find sensor\n");
 	}
 
-	mutex_init(&ov2740->mutex);
 	ov2740->cur_mode = &supported_modes[0];
 	ret = ov2740_init_controls(ov2740);
 	if (ret) {
@@ -1119,7 +1088,7 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ov2740->sd.internal_ops = &ov2740_internal_ops;
+	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
 	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
 	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
@@ -1130,6 +1099,10 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	ret = v4l2_subdev_init_finalize(&ov2740->sd);
+	if (ret)
+		goto probe_error_media_entity_cleanup;
+
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
 		pm_runtime_set_active(&client->dev);
@@ -1139,7 +1112,7 @@ static int ov2740_probe(struct i2c_client *client)
 	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
-		goto probe_error_media_entity_cleanup;
+		goto probe_error_v4l2_subdev_cleanup;
 	}
 
 	ret = ov2740_register_nvmem(client, ov2740);
@@ -1148,6 +1121,9 @@ static int ov2740_probe(struct i2c_client *client)
 
 	return 0;
 
+probe_error_v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov2740->sd);
+
 probe_error_media_entity_cleanup:
 	media_entity_cleanup(&ov2740->sd.entity);
 	pm_runtime_disable(&client->dev);
@@ -1155,7 +1131,6 @@ static int ov2740_probe(struct i2c_client *client)
 
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
-	mutex_destroy(&ov2740->mutex);
 
 	return ret;
 }
-- 
2.39.2

