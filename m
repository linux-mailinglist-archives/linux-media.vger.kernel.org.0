Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1964267D7CC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbjAZVfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjAZVfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:35:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2182713E
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:34:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BF60975;
        Thu, 26 Jan 2023 22:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674768897;
        bh=Vr1YID76BwZCQ8X2C/GTFmjJeGSi6UYFOdIA53Cvei8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y/e3QdjIerTZ4KMJlyXig3aeqxbGh6FmRBUUn99fv9RTe++T+jB8MVAwWr0OA3uVj
         qnYvxm9+zcoCFuJSDvarhX4G28Ps8/JJh9IuFB+1MGIH5WZcBMWKfCwQ8h8tWkixlG
         eunN2m2sdkzRDUt8lieI3UYIuRcftiBnxiKgytPI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 4/5] media: imx-mipi-csis: Use V4L2 subdev active state
Date:   Thu, 26 Jan 2023 23:34:36 +0200
Message-Id: <20230126213437.20796-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the V4L2 subdev active state API to store the active format. This
simplifies the driver not only by dropping the mipi_csis_device csis_fmt
and format_mbus fields, but it also allows dropping the device lock,
replaced with the state lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 135 +++++++--------------
 1 file changed, 47 insertions(+), 88 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 38ed88646632..9e424cb1c4b1 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -327,10 +327,6 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
-	struct mutex lock;	/* Protect csis_fmt and format_mbus */
-	const struct csis_pix_format *csis_fmt;
-	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
-
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 	struct dentry *debugfs_root;
@@ -559,7 +555,6 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
 }
 
-/* Called with the csis.lock mutex held */
 static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 				   const struct v4l2_mbus_framefmt *format,
 				   const struct csis_pix_format *csis_fmt)
@@ -941,79 +936,67 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-	const struct v4l2_mbus_framefmt *format = &csis->format_mbus[CSIS_PAD_SINK];
-	const struct csis_pix_format *csis_fmt = csis->csis_fmt;
+	const struct v4l2_mbus_framefmt *format;
+	const struct csis_pix_format *csis_fmt;
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (!enable) {
-		mutex_lock(&csis->lock);
-
 		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
 
 		mipi_csis_stop_stream(csis);
 		if (csis->debug.enable)
 			mipi_csis_log_counters(csis, true);
 
-		mutex_unlock(&csis->lock);
-
 		pm_runtime_put(csis->dev);
 
 		return 0;
 	}
 
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	format = v4l2_subdev_get_pad_format(sd, state, CSIS_PAD_SINK);
+	csis_fmt = find_csis_format(format->code);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
-		return ret;
+		goto err_unlock;
 
 	mipi_csis_clear_counters(csis);
 
 	ret = pm_runtime_resume_and_get(csis->dev);
 	if (ret < 0)
-		return ret;
-
-	mutex_lock(&csis->lock);
+		goto err_unlock;
 
 	mipi_csis_start_stream(csis, format, csis_fmt);
+
 	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
 	if (ret < 0)
-		goto error;
+		goto err_stop;
 
 	mipi_csis_log_counters(csis, true);
 
-	mutex_unlock(&csis->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
-error:
+err_stop:
 	mipi_csis_stop_stream(csis);
-	mutex_unlock(&csis->lock);
 	pm_runtime_put(csis->dev);
+err_unlock:
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
 
-static struct v4l2_mbus_framefmt *
-mipi_csis_get_format(struct mipi_csis_device *csis,
-		     struct v4l2_subdev_state *sd_state,
-		     enum v4l2_subdev_format_whence which,
-		     unsigned int pad)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csis->sd, sd_state, pad);
-
-	return &csis->format_mbus[pad];
-}
-
 static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state)
 {
-	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct v4l2_mbus_framefmt *fmt_sink;
 	struct v4l2_mbus_framefmt *fmt_source;
-	enum v4l2_subdev_format_whence which;
 
-	which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	fmt_sink = mipi_csis_get_format(csis, sd_state, which, CSIS_PAD_SINK);
+	fmt_sink = v4l2_subdev_get_pad_format(sd, sd_state, CSIS_PAD_SINK);
+	fmt_source = v4l2_subdev_get_pad_format(sd, sd_state, CSIS_PAD_SOURCE);
 
 	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_1X16;
 	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
@@ -1027,36 +1010,15 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
 		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
 					      fmt_sink->ycbcr_enc);
 
-	fmt_source = mipi_csis_get_format(csis, sd_state, which,
-					  CSIS_PAD_SOURCE);
 	*fmt_source = *fmt_sink;
 
 	return 0;
 }
 
-static int mipi_csis_get_fmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *sdformat)
-{
-	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = mipi_csis_get_format(csis, sd_state, sdformat->which,
-				   sdformat->pad);
-
-	mutex_lock(&csis->lock);
-	sdformat->format = *fmt;
-	mutex_unlock(&csis->lock);
-
-	return 0;
-}
-
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-
 	/*
 	 * The CSIS can't transcode in any way, the source format is identical
 	 * to the sink format.
@@ -1067,8 +1029,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = mipi_csis_get_format(csis, sd_state, code->which,
-					   code->pad);
+		fmt = v4l2_subdev_get_pad_format(sd, sd_state, code->pad);
 		code->code = fmt->code;
 		return 0;
 	}
@@ -1088,7 +1049,6 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *sdformat)
 {
-	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct csis_pix_format const *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int align;
@@ -1098,7 +1058,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	 * modified.
 	 */
 	if (sdformat->pad == CSIS_PAD_SOURCE)
-		return mipi_csis_get_fmt(sd, sd_state, sdformat);
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
 
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
@@ -1136,10 +1096,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			      &sdformat->format.height, 1,
 			      CSIS_MAX_PIX_HEIGHT, 0, 0);
 
-	fmt = mipi_csis_get_format(csis, sd_state, sdformat->which,
-				   sdformat->pad);
-
-	mutex_lock(&csis->lock);
+	fmt = v4l2_subdev_get_pad_format(sd, sd_state, sdformat->pad);
 
 	fmt->code = csis_fmt->code;
 	fmt->width = sdformat->format.width;
@@ -1152,44 +1109,40 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	sdformat->format = *fmt;
 
 	/* Propagate the format from sink to source. */
-	fmt = mipi_csis_get_format(csis, sd_state, sdformat->which,
-				   CSIS_PAD_SOURCE);
+	fmt = v4l2_subdev_get_pad_format(sd, sd_state, CSIS_PAD_SOURCE);
 	*fmt = sdformat->format;
 
 	/* The format on the source pad might change due to unpacking. */
 	fmt->code = csis_fmt->output;
 
-	/* Store the CSIS format descriptor for active formats. */
-	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		csis->csis_fmt = csis_fmt;
-
-	mutex_unlock(&csis->lock);
-
 	return 0;
 }
 
 static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				    struct v4l2_mbus_frame_desc *fd)
 {
-	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct csis_pix_format *csis_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
 
 	if (pad != CSIS_PAD_SOURCE)
 		return -EINVAL;
 
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_get_pad_format(sd, state, CSIS_PAD_SOURCE);
+	csis_fmt = find_csis_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
 	fd->num_entries = 1;
 
 	memset(entry, 0, sizeof(*entry));
 
-	mutex_lock(&csis->lock);
-
 	entry->flags = 0;
-	entry->pixelcode = csis->csis_fmt->code;
+	entry->pixelcode = csis_fmt->code;
 	entry->bus.csi2.vc = 0;
-	entry->bus.csi2.dt = csis->csis_fmt->data_type;
-
-	mutex_unlock(&csis->lock);
+	entry->bus.csi2.dt = csis_fmt->data_type;
 
 	return 0;
 }
@@ -1216,7 +1169,7 @@ static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
 static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
 	.init_cfg		= mipi_csis_init_cfg,
 	.enum_mbus_code		= mipi_csis_enum_mbus_code,
-	.get_fmt		= mipi_csis_get_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= mipi_csis_set_fmt,
 	.get_frame_desc		= mipi_csis_get_frame_desc,
 };
@@ -1398,6 +1351,7 @@ static const struct dev_pm_ops mipi_csis_pm_ops = {
 static int mipi_csis_subdev_init(struct mipi_csis_device *csis)
 {
 	struct v4l2_subdev *sd = &csis->sd;
+	int ret;
 
 	v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
 	sd->owner = THIS_MODULE;
@@ -1419,15 +1373,21 @@ static int mipi_csis_subdev_init(struct mipi_csis_device *csis)
 		return -ENOENT;
 	}
 
-	csis->csis_fmt = &mipi_csis_formats[0];
-	mipi_csis_init_cfg(sd, NULL);
-
 	csis->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
 					 | MEDIA_PAD_FL_MUST_CONNECT;
 	csis->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
 					   | MEDIA_PAD_FL_MUST_CONNECT;
-	return media_entity_pads_init(&sd->entity, CSIS_PADS_NUM,
-				      csis->pads);
+	ret = media_entity_pads_init(&sd->entity, CSIS_PADS_NUM, csis->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		media_entity_cleanup(&sd->entity);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
@@ -1452,7 +1412,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (!csis)
 		return -ENOMEM;
 
-	mutex_init(&csis->lock);
 	spin_lock_init(&csis->slock);
 
 	csis->dev = dev;
@@ -1533,6 +1492,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 err_unregister_all:
 	mipi_csis_debugfs_exit(csis);
 err_cleanup:
+	v4l2_subdev_cleanup(&csis->sd);
 	media_entity_cleanup(&csis->sd.entity);
 	v4l2_async_nf_unregister(&csis->notifier);
 	v4l2_async_nf_cleanup(&csis->notifier);
@@ -1540,7 +1500,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 err_disable_clock:
 	mipi_csis_clk_disable(csis);
 	fwnode_handle_put(csis->sd.fwnode);
-	mutex_destroy(&csis->lock);
 
 	return ret;
 }
@@ -1558,9 +1517,9 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	mipi_csis_runtime_suspend(&pdev->dev);
 	mipi_csis_clk_disable(csis);
+	v4l2_subdev_cleanup(&csis->sd);
 	media_entity_cleanup(&csis->sd.entity);
 	fwnode_handle_put(csis->sd.fwnode);
-	mutex_destroy(&csis->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

