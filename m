Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A84215EC7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgGFSi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbgGFSi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:59 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 097C12581;
        Mon,  6 Jul 2020 20:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060701;
        bh=c3sPrQAplqpkPpetmB+nCpwtFA6k1uUwM0dIMPzActI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tDubBD+4CIV7rMHHYFrQE8LlaXC4wt33+zUHPaGyfuP4+P90iPgnm6UKV8RwlipWB
         RNHFJyIX3VqLnI0vRn6IYpc8fM12wiq1lvpjBKs310U2uR9uhPgY+LAzS/6FNCZDQ9
         6kgna0W9xOpcwnbI1Dhm99+zMYw8C1hq5jA2MeOM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 085/108] media: ti-vpe: cal: Create subdev for CAMERARX
Date:   Mon,  6 Jul 2020 21:36:46 +0300
Message-Id: <20200706183709.12238-86-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create and register V4L2 subdevs for the CAMERARX instances, and link
them in the media graph to the sensors and video nodes. The subdev API
is not exposed to userspace at this point, and no subdev operation is
implemented, but the media controller graph is visible to applications.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Changes since v1:

- Fix order of cleanup steps in cal_probe()
- Don't of_node_put(phy->sensor_ep_node) on success in
  cal_camerarx_parse_dt()
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 42 +++++++++++++++++++-
 drivers/media/platform/ti-vpe/cal-video.c    | 12 ++++++
 drivers/media/platform/ti-vpe/cal.c          | 35 ++++++++++++----
 drivers/media/platform/ti-vpe/cal.h          |  9 ++++-
 4 files changed, 88 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 806cbf175d39..1c9ce30eb7af 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -533,8 +533,8 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
-	struct device_node *ep_node;
 	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
+	struct device_node *ep_node;
 	unsigned int i;
 	int ret;
 
@@ -582,9 +582,11 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 		endpoint->bus.mipi_csi2.flags);
 
 	/* Retrieve the connected device and store it for later use. */
-	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
+	phy->sensor_ep_node = of_graph_get_remote_endpoint(ep_node);
+	phy->sensor_node = of_graph_get_port_parent(phy->sensor_ep_node);
 	if (!phy->sensor_node) {
 		phy_dbg(3, phy, "Can't get remote parent\n");
+		of_node_put(phy->sensor_ep_node);
 		ret = -EINVAL;
 		goto done;
 	}
@@ -596,11 +598,25 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 	return ret;
 }
 
+/* ------------------------------------------------------------------
+ *	V4L2 Subdev Operations
+ * ------------------------------------------------------------------
+ */
+
+static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
+};
+
+/* ------------------------------------------------------------------
+ *	Create and Destroy
+ * ------------------------------------------------------------------
+ */
+
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 					 unsigned int instance)
 {
 	struct platform_device *pdev = to_platform_device(cal->dev);
 	struct cal_camerarx *phy;
+	struct v4l2_subdev *sd;
 	int ret;
 
 	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
@@ -632,9 +648,28 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (ret)
 		goto error;
 
+	/* Initialize the V4L2 subdev and media entity. */
+	sd = &phy->subdev;
+	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
+	sd->dev = cal->dev;
+
+	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	phy->pads[CAL_CAMERARX_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
+				     phy->pads);
+	if (ret)
+		goto error;
+
+	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
+	if (ret)
+		goto error;
+
 	return phy;
 
 error:
+	media_entity_cleanup(&phy->subdev.entity);
 	kfree(phy);
 	return ERR_PTR(ret);
 }
@@ -644,6 +679,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 	if (!phy)
 		return;
 
+	v4l2_device_unregister_subdev(&phy->subdev);
+	media_entity_cleanup(&phy->subdev.entity);
+	of_node_put(phy->sensor_ep_node);
 	of_node_put(phy->sensor_node);
 	kfree(phy);
 }
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index df472a175e83..0a1a11692208 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -809,6 +809,18 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 		return ret;
 	}
 
+	ret = media_create_pad_link(&ctx->phy->subdev.entity,
+				    CAL_CAMERARX_PAD_SOURCE,
+				    &vfd->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		ctx_err(ctx, "Failed to create media link for context %u\n",
+			ctx->index);
+		video_unregister_device(vfd);
+		return ret;
+	}
+
 	ctx_info(ctx, "V4L2 device registered as %s\n",
 		 video_device_node_name(vfd));
 
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 59a0266b1f39..f6e42b2c022a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -421,6 +421,8 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 				    struct v4l2_async_subdev *asd)
 {
 	struct cal_camerarx *phy = to_cal_asd(asd)->phy;
+	int pad;
+	int ret;
 
 	if (phy->sensor) {
 		phy_info(phy, "Rejecting subdev %s (Already set!!)",
@@ -431,6 +433,25 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 	phy->sensor = subdev;
 	phy_dbg(1, phy, "Using sensor %s for capture\n", subdev->name);
 
+	pad = media_entity_get_fwnode_pad(&subdev->entity,
+					  of_fwnode_handle(phy->sensor_ep_node),
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		phy_err(phy, "Sensor %s has no connected source pad\n",
+			subdev->name);
+		return pad;
+	}
+
+	ret = media_create_pad_link(&subdev->entity, pad,
+				    &phy->subdev.entity, CAL_CAMERARX_PAD_SINK,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		phy_err(phy, "Failed to create media link for sensor %s\n",
+			subdev->name);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -797,6 +818,11 @@ static int cal_probe(struct platform_device *pdev)
 	cal_get_hwinfo(cal);
 	pm_runtime_put_sync(&pdev->dev);
 
+	/* Initialize the media device. */
+	ret = cal_media_init(cal);
+	if (ret < 0)
+		goto error_pm_runtime;
+
 	/* Create CAMERARX PHYs. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
@@ -816,11 +842,6 @@ static int cal_probe(struct platform_device *pdev)
 		goto error_camerarx;
 	}
 
-	/* Initialize the media device. */
-	ret = cal_media_init(cal);
-	if (ret < 0)
-		goto error_camerarx;
-
 	/* Create contexts. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		if (!cal->phy[i]->sensor_node)
@@ -848,12 +869,12 @@ static int cal_probe(struct platform_device *pdev)
 			cal_ctx_v4l2_cleanup(ctx);
 	}
 
-	cal_media_cleanup(cal);
-
 error_camerarx:
 	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
+	cal_media_cleanup(cal);
+
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index e496083715d2..446aa4cc5217 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -24,6 +24,7 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
 #define CAL_MODULE_NAME			"cal"
@@ -33,12 +34,14 @@
 #define MAX_WIDTH_BYTES			(8192 * 8)
 #define MAX_HEIGHT_LINES		16383
 
+#define CAL_CAMERARX_PAD_SINK		0
+#define CAL_CAMERARX_PAD_SOURCE		1
+
 struct device;
 struct device_node;
 struct resource;
 struct regmap;
 struct regmap_fied;
-struct v4l2_subdev;
 
 /* CTRL_CORE_CAMERRX_CONTROL register field id */
 enum cal_camerarx_field {
@@ -108,8 +111,12 @@ struct cal_camerarx {
 	unsigned int		instance;
 
 	struct v4l2_fwnode_endpoint	endpoint;
+	struct device_node	*sensor_ep_node;
 	struct device_node	*sensor_node;
 	struct v4l2_subdev	*sensor;
+
+	struct v4l2_subdev	subdev;
+	struct media_pad	pads[2];
 };
 
 struct cal_dev {
-- 
Regards,

Laurent Pinchart

