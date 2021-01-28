Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487EF3075C1
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 13:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhA1MQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 07:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbhA1MQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 07:16:18 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46747C061756
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 04:14:33 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 69726634C8E;
        Thu, 28 Jan 2021 14:12:38 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 03/14] media: stm32: Use v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Thu, 28 Jan 2021 14:09:34 +0200
Message-Id: <20210128120945.5062-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
References: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The use of v4l2_async_notifier_add_subdev will be discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
which handles the needed setup, instead of open-coding it.

This results in removal of the now unneeded driver-specific state
struct dcmi_graph_entity, keeping track of just the source
subdevice.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 86 ++++++++---------------
 1 file changed, 30 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b745f1342c2e..142f63d07dcd 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -99,13 +99,6 @@ enum state {
 
 #define OVERRUN_ERROR_THRESHOLD	3
 
-struct dcmi_graph_entity {
-	struct v4l2_async_subdev asd;
-
-	struct device_node *remote_node;
-	struct v4l2_subdev *source;
-};
-
 struct dcmi_format {
 	u32	fourcc;
 	u32	mbus_code;
@@ -139,7 +132,7 @@ struct stm32_dcmi {
 	struct v4l2_device		v4l2_dev;
 	struct video_device		*vdev;
 	struct v4l2_async_notifier	notifier;
-	struct dcmi_graph_entity	entity;
+	struct v4l2_subdev		*source;
 	struct v4l2_format		fmt;
 	struct v4l2_rect		crop;
 	bool				do_crop;
@@ -610,7 +603,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
 			       struct v4l2_subdev_pad_config *pad_cfg,
 			       struct v4l2_subdev_format *format)
 {
-	struct media_entity *entity = &dcmi->entity.source->entity;
+	struct media_entity *entity = &dcmi->source->entity;
 	struct v4l2_subdev *subdev;
 	struct media_pad *sink_pad = NULL;
 	struct media_pad *src_pad = NULL;
@@ -1018,7 +1011,7 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->entity.source, pad, set_fmt,
+	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
 			       &pad_cfg, &format);
 	if (ret < 0)
 		return ret;
@@ -1152,7 +1145,7 @@ static int dcmi_get_sensor_format(struct stm32_dcmi *dcmi,
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(dcmi->entity.source, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(dcmi->source, pad, get_fmt, NULL, &fmt);
 	if (ret)
 		return ret;
 
@@ -1181,7 +1174,7 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->entity.source, pad, set_fmt,
+	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
 			       &pad_cfg, &format);
 	if (ret < 0)
 		return ret;
@@ -1204,7 +1197,7 @@ static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
 	/*
 	 * Get sensor bounds first
 	 */
-	ret = v4l2_subdev_call(dcmi->entity.source, pad, get_selection,
+	ret = v4l2_subdev_call(dcmi->source, pad, get_selection,
 			       NULL, &bounds);
 	if (!ret)
 		*r = bounds.r;
@@ -1385,7 +1378,7 @@ static int dcmi_enum_framesizes(struct file *file, void *fh,
 
 	fse.code = sd_fmt->mbus_code;
 
-	ret = v4l2_subdev_call(dcmi->entity.source, pad, enum_frame_size,
+	ret = v4l2_subdev_call(dcmi->source, pad, enum_frame_size,
 			       NULL, &fse);
 	if (ret)
 		return ret;
@@ -1402,7 +1395,7 @@ static int dcmi_g_parm(struct file *file, void *priv,
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
 
-	return v4l2_g_parm_cap(video_devdata(file), dcmi->entity.source, p);
+	return v4l2_g_parm_cap(video_devdata(file), dcmi->source, p);
 }
 
 static int dcmi_s_parm(struct file *file, void *priv,
@@ -1410,7 +1403,7 @@ static int dcmi_s_parm(struct file *file, void *priv,
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
 
-	return v4l2_s_parm_cap(video_devdata(file), dcmi->entity.source, p);
+	return v4l2_s_parm_cap(video_devdata(file), dcmi->source, p);
 }
 
 static int dcmi_enum_frameintervals(struct file *file, void *fh,
@@ -1432,7 +1425,7 @@ static int dcmi_enum_frameintervals(struct file *file, void *fh,
 
 	fie.code = sd_fmt->mbus_code;
 
-	ret = v4l2_subdev_call(dcmi->entity.source, pad,
+	ret = v4l2_subdev_call(dcmi->source, pad,
 			       enum_frame_interval, NULL, &fie);
 	if (ret)
 		return ret;
@@ -1452,7 +1445,7 @@ MODULE_DEVICE_TABLE(of, stm32_dcmi_of_match);
 static int dcmi_open(struct file *file)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
-	struct v4l2_subdev *sd = dcmi->entity.source;
+	struct v4l2_subdev *sd = dcmi->source;
 	int ret;
 
 	if (mutex_lock_interruptible(&dcmi->lock))
@@ -1483,7 +1476,7 @@ static int dcmi_open(struct file *file)
 static int dcmi_release(struct file *file)
 {
 	struct stm32_dcmi *dcmi = video_drvdata(file);
-	struct v4l2_subdev *sd = dcmi->entity.source;
+	struct v4l2_subdev *sd = dcmi->source;
 	bool fh_singular;
 	int ret;
 
@@ -1616,7 +1609,7 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 {
 	const struct dcmi_format *sd_fmts[ARRAY_SIZE(dcmi_formats)];
 	unsigned int num_fmts = 0, i, j;
-	struct v4l2_subdev *subdev = dcmi->entity.source;
+	struct v4l2_subdev *subdev = dcmi->source;
 	struct v4l2_subdev_mbus_code_enum mbus_code = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -1675,7 +1668,7 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 static int dcmi_framesizes_init(struct stm32_dcmi *dcmi)
 {
 	unsigned int num_fsize = 0;
-	struct v4l2_subdev *subdev = dcmi->entity.source;
+	struct v4l2_subdev *subdev = dcmi->source;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = dcmi->sd_format->mbus_code,
@@ -1727,14 +1720,13 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	 * we search for the source subdevice
 	 * in order to expose it through V4L2 interface
 	 */
-	dcmi->entity.source =
-		media_entity_to_v4l2_subdev(dcmi_find_source(dcmi));
-	if (!dcmi->entity.source) {
+	dcmi->source = media_entity_to_v4l2_subdev(dcmi_find_source(dcmi));
+	if (!dcmi->source) {
 		dev_err(dcmi->dev, "Source subdevice not found\n");
 		return -ENODEV;
 	}
 
-	dcmi->vdev->ctrl_handler = dcmi->entity.source->ctrl_handler;
+	dcmi->vdev->ctrl_handler = dcmi->source->ctrl_handler;
 
 	ret = dcmi_formats_init(dcmi);
 	if (ret) {
@@ -1813,46 +1805,28 @@ static const struct v4l2_async_notifier_operations dcmi_graph_notify_ops = {
 	.complete = dcmi_graph_notify_complete,
 };
 
-static int dcmi_graph_parse(struct stm32_dcmi *dcmi, struct device_node *node)
-{
-	struct device_node *ep = NULL;
-	struct device_node *remote;
-
-	ep = of_graph_get_next_endpoint(node, ep);
-	if (!ep)
-		return -EINVAL;
-
-	remote = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
-	if (!remote)
-		return -EINVAL;
-
-	/* Remote node to connect */
-	dcmi->entity.remote_node = remote;
-	dcmi->entity.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-	dcmi->entity.asd.match.fwnode = of_fwnode_handle(remote);
-	return 0;
-}
-
 static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 {
+	struct v4l2_async_subdev *asd;
+	struct device_node *ep;
 	int ret;
 
-	/* Parse the graph to extract a list of subdevice DT nodes. */
-	ret = dcmi_graph_parse(dcmi, dcmi->dev->of_node);
-	if (ret < 0) {
-		dev_err(dcmi->dev, "Failed to parse graph\n");
-		return ret;
+	ep = of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
+	if (!ep) {
+		dev_err(dcmi->dev, "Failed to get next endpoint\n");
+		return -EINVAL;
 	}
 
 	v4l2_async_notifier_init(&dcmi->notifier);
 
-	ret = v4l2_async_notifier_add_subdev(&dcmi->notifier,
-					     &dcmi->entity.asd);
-	if (ret) {
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+		&dcmi->notifier, of_fwnode_handle(ep), sizeof(*asd));
+
+	of_node_put(ep);
+
+	if (IS_ERR(asd)) {
 		dev_err(dcmi->dev, "Failed to add subdev notifier\n");
-		of_node_put(dcmi->entity.remote_node);
-		return ret;
+		return PTR_ERR(asd);
 	}
 
 	dcmi->notifier.ops = &dcmi_graph_notify_ops;
-- 
2.29.2

