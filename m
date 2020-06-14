Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8765C1F8BBB
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbgFOABx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgFOABx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:53 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 419A02164;
        Mon, 15 Jun 2020 02:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179250;
        bh=vmoiNyJela2PRWbN07tS1kixWO7SwwhmKAatwZAJm+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F8WK2sp+Gj8UYNsCgp3JJK8T4Keg1pMZem3AEa3xmK8aSOI0stpFg4616wBZ8uFhw
         8ijm/SpCguAnRPED+WPmqL6V/5DdpTy0+DtKEzCp92rioVIT4UreRXm+Y2EDMYjyYn
         Pu3DWWYGx2kiIe1W8hrvct+2MRbSjbNrjjqkus7o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 084/107] media: ti-vpe: cal: Create subdev for CAMERARX
Date:   Mon, 15 Jun 2020 02:59:21 +0300
Message-Id: <20200614235944.17716-85-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create and register V4L2 sudbevs for the CAMERARX instances, and link
them in the media graph to the sensors and video nodes. The subdev API
is not exposed to userspace at this point, and no subdev operation is
implemented, but the media controller graph is visible to applications.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 42 +++++++++++++++++++-
 drivers/media/platform/ti-vpe/cal-video.c    | 12 ++++++
 drivers/media/platform/ti-vpe/cal.c          | 31 ++++++++++++---
 drivers/media/platform/ti-vpe/cal.h          |  9 ++++-
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index a7e4b81c9734..9be432ff87b2 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -526,8 +526,8 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
-	struct device_node *ep_node;
 	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
+	struct device_node *ep_node;
 	unsigned int i;
 	int ret;
 
@@ -571,7 +571,8 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 		endpoint->bus.mipi_csi2.flags);
 
 	/* Retrieve the connected device and store it for later use. */
-	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
+	phy->sensor_ep_node = of_graph_get_remote_endpoint(ep_node);
+	phy->sensor_node = of_graph_get_port_parent(phy->sensor_ep_node);
 	if (!phy->sensor_node) {
 		phy_dbg(3, phy, "Can't get remote parent\n");
 		goto done;
@@ -580,15 +581,30 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
 
 done:
+	of_node_put(phy->sensor_ep_node);
 	of_node_put(ep_node);
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
@@ -620,9 +636,28 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
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
@@ -632,6 +667,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
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
index ca8576aa2646..bf1734d4d800 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -416,6 +416,8 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 				    struct v4l2_async_subdev *asd)
 {
 	struct cal_camerarx *phy = to_cal_asd(asd)->phy;
+	int pad;
+	int ret;
 
 	if (phy->sensor) {
 		phy_info(phy, "Rejecting subdev %s (Already set!!)",
@@ -426,6 +428,25 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
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
 
@@ -796,6 +817,11 @@ static int cal_probe(struct platform_device *pdev)
 	cal_get_hwinfo(cal);
 	pm_runtime_put_sync(&pdev->dev);
 
+	/* Initialize the media device. */
+	ret = cal_media_init(cal);
+	if (ret < 0)
+		goto error_camerarx;
+
 	/* Create CAMERARX PHYs. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
@@ -805,11 +831,6 @@ static int cal_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Initialize the media device. */
-	ret = cal_media_init(cal);
-	if (ret < 0)
-		goto error_camerarx;
-
 	/* Create contexts. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
 		cal->ctx[i] = cal_ctx_create(cal, i);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index cb167bfc2773..bf31dbf24523 100644
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

