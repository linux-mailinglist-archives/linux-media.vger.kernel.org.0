Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D6957032D
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbiGKMpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbiGKMpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:45:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F22860699
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:46 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B61CD2F50;
        Mon, 11 Jul 2022 14:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543424;
        bh=f+MN00A0UOxPA9aBsxCLQ2UAel9P8hNaKX6kFDMPtEY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HzoUpLft4dxWWXp/OxYxyHUQtZQi6D44exVAk2pkHpcXVmceewTROd20qc7UyYXJN
         7fxFxndaKqfbuTz2JGY8+d+V5QzWN+Tyq3p2QFQ3qQpD1TKZ9dVzy3fToYsCwzSnCJ
         Md6xEKp6GwPqzjvLuCfm59mE+nji7MMh3/32l7xY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 40/46] media: rkisp1: csi: Plumb the CSI RX subdev
Date:   Mon, 11 Jul 2022 15:42:42 +0300
Message-Id: <20220711124248.2683-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Connect the CSI receiver subdevice between the sensors and the ISP. This
includes:

- Calling the subdevice via the v4l2 subdev API
- Moving the async notifier for the sensor from the ISP to the CSI
  receiver
- In the ISP, create a media link to the CSI receiver, and remove the
  media link creation to the sensor
- In the CSI receiver, create a media link to the sensor

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
Changes since v1:

- Clarify commit message
- Update the media device topology
- Fix white space
---
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 34 ++++++++-
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  6 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 70 ++++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 21 +-----
 4 files changed, 75 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 0c90f76ba9b3..d7acc94e10f8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -47,6 +47,34 @@ rkisp1_csi_get_pad_fmt(struct rkisp1_csi *csi,
 		return v4l2_subdev_get_try_format(&csi->sd, &state, pad);
 }
 
+int rkisp1_csi_link_sensor(struct rkisp1_device *rkisp1, struct v4l2_subdev *sd,
+			   struct rkisp1_sensor_async *s_asd,
+			   unsigned int source_pad)
+{
+	struct rkisp1_csi *csi = &rkisp1->csi;
+	int ret;
+
+	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
+						V4L2_CID_PIXEL_RATE);
+	if (!s_asd->pixel_rate_ctrl) {
+		dev_err(rkisp1->dev, "No pixel rate control in subdev %s\n",
+			sd->name);
+		return -EINVAL;
+	}
+
+	/* Create the link from the sensor to the CSI receiver. */
+	ret = media_create_pad_link(&sd->entity, source_pad,
+				    &csi->sd.entity, RKISP1_CSI_PAD_SINK,
+				    !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
+	if (ret) {
+		dev_err(csi->rkisp1->dev, "failed to link src pad of %s\n",
+			sd->name);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int rkisp1_csi_config(struct rkisp1_csi *csi,
 			     const struct rkisp1_sensor_async *sensor)
 {
@@ -122,8 +150,8 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
 }
 
-int rkisp1_csi_start(struct rkisp1_csi *csi,
-		     const struct rkisp1_sensor_async *sensor)
+static int rkisp1_csi_start(struct rkisp1_csi *csi,
+			    const struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	union phy_configure_opts opts;
@@ -158,7 +186,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
 	return 0;
 }
 
-void rkisp1_csi_stop(struct rkisp1_csi *csi)
+static void rkisp1_csi_stop(struct rkisp1_csi *csi)
 {
 	rkisp1_csi_disable(csi);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
index f75babaac1cb..1f5f2af31a7d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -21,8 +21,8 @@ void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
 int rkisp1_csi_register(struct rkisp1_device *rkisp1);
 void rkisp1_csi_unregister(struct rkisp1_device *rkisp1);
 
-int rkisp1_csi_start(struct rkisp1_csi *csi,
-		     const struct rkisp1_sensor_async *sensor);
-void rkisp1_csi_stop(struct rkisp1_csi *csi);
+int rkisp1_csi_link_sensor(struct rkisp1_device *rkisp1, struct v4l2_subdev *sd,
+			   struct rkisp1_sensor_async *s_asd,
+			   unsigned int source_pad);
 
 #endif /* _RKISP1_CSI_H */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 5428e19e818f..c3a7ab70bbef 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 
 #include "rkisp1-common.h"
 #include "rkisp1-csi.h"
@@ -67,18 +68,28 @@
  *
  * Media Topology
  * --------------
- *      +----------+     +----------+
- *      | Sensor 2 |     | Sensor X |
- *      ------------ ... ------------
- *      |    0     |     |    0     |
- *      +----------+     +----------+      +-----------+
- *                  \      |               |  params   |
- *                   \     |               | (output)  |
- *    +----------+    \    |               +-----------+
- *    | Sensor 1 |     v   v                     |
- *    ------------      +------+------+          |
- *    |    0     |----->|  0   |  1   |<---------+
- *    +----------+      |------+------|
+ *
+ *          +----------+       +----------+
+ *          | Sensor 1 |       | Sensor X |
+ *          ------------  ...  ------------
+ *          |    0     |       |    0     |
+ *          +----------+       +----------+
+ *               |                  |
+ *                \----\       /----/
+ *                     |       |
+ *                     v       v
+ *                  +-------------+
+ *                  |      0      |
+ *                  ---------------
+ *                  |  CSI-2 RX   |
+ *                  ---------------         +-----------+
+ *                  |      1      |         |  params   |
+ *                  +-------------+         | (output)  |
+ *                         |               +-----------+
+ *                         v                     |
+ *                      +------+------+          |
+ *                      |  0   |  1   |<---------+
+ *                      |------+------|
  *                      |     ISP     |
  *                      |------+------|
  *        +-------------|  2   |  3   |----------+
@@ -119,17 +130,8 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 		container_of(asd, struct rkisp1_sensor_async, asd);
 	int source_pad;
 
-	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
-						V4L2_CID_PIXEL_RATE);
-	if (!s_asd->pixel_rate_ctrl) {
-		dev_err(rkisp1->dev, "No pixel rate control in subdev %s\n",
-			sd->name);
-		return -EINVAL;
-	}
-
 	s_asd->sd = sd;
 
-	/* Create the link to the sensor. */
 	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
 						 MEDIA_PAD_FL_SOURCE);
 	if (source_pad < 0) {
@@ -138,10 +140,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 		return source_pad;
 	}
 
-	return media_create_pad_link(&sd->entity, source_pad,
-				     &rkisp1->isp.sd.entity,
-				     RKISP1_ISP_PAD_SINK_VIDEO,
-				     !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
+	return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, source_pad);
 }
 
 static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
@@ -283,6 +282,14 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 	unsigned int i;
 	int ret;
 
+	/* Link the CSI receiver to the ISP. */
+	ret = media_create_pad_link(&rkisp1->csi.sd.entity, RKISP1_CSI_PAD_SRC,
+				    &rkisp1->isp.sd.entity,
+				    RKISP1_ISP_PAD_SINK_VIDEO,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		return ret;
+
 	/* create ISP->RSZ->CAP links */
 	for (i = 0; i < 2; i++) {
 		struct media_entity *resizer =
@@ -364,13 +371,6 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		goto error;
 
-	ret = rkisp1_subdev_notifier_register(rkisp1);
-	if (ret) {
-		dev_err(rkisp1->dev,
-			"Failed to register subdev notifier(%d)\n", ret);
-		goto error;
-	}
-
 	return 0;
 
 error:
@@ -534,10 +534,16 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_csi;
 
+	ret = rkisp1_subdev_notifier_register(rkisp1);
+	if (ret)
+		goto err_unreg_entities;
+
 	rkisp1_debug_init(rkisp1);
 
 	return 0;
 
+err_unreg_entities:
+	rkisp1_entities_unregister(rkisp1);
 err_cleanup_csi:
 	rkisp1_csi_cleanup(rkisp1);
 err_unreg_media_dev:
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d7e2802d11f5..ea0bbccb5aee 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -16,7 +16,6 @@
 #include <media/v4l2-event.h>
 
 #include "rkisp1-common.h"
-#include "rkisp1-csi.h"
 
 #define RKISP1_DEF_SINK_PAD_FMT MEDIA_BUS_FMT_SRGGB10_1X10
 #define RKISP1_DEF_SRC_PAD_FMT MEDIA_BUS_FMT_YUYV8_2X8
@@ -728,17 +727,13 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	const struct rkisp1_sensor_async *asd;
 	struct media_pad *source_pad;
 	struct media_pad *sink_pad;
 	int ret;
 
 	if (!enable) {
 		v4l2_subdev_call(rkisp1->source, video, s_stream, false);
-
-		rkisp1_csi_stop(&rkisp1->csi);
 		rkisp1_isp_stop(isp);
-
 		return 0;
 	}
 
@@ -756,30 +751,20 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		return -EPIPE;
 	}
 
-	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
-			   asd);
-
-	if (asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
-		return -EINVAL;
+	if (rkisp1->source != &rkisp1->csi.sd)
+		return -EPIPE;
 
 	isp->frame_sequence = -1;
 	mutex_lock(&isp->ops_lock);
-	ret = rkisp1_config_cif(isp, asd->mbus_type, asd->mbus_flags);
+	ret = rkisp1_config_cif(isp, V4L2_MBUS_CSI2_DPHY, 0);
 	if (ret)
 		goto mutex_unlock;
 
 	rkisp1_isp_start(isp);
 
-	ret = rkisp1_csi_start(&rkisp1->csi, asd);
-	if (ret) {
-		rkisp1_isp_stop(isp);
-		goto mutex_unlock;
-	}
-
 	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
 	if (ret) {
 		rkisp1_isp_stop(isp);
-		rkisp1_csi_stop(&rkisp1->csi);
 		goto mutex_unlock;
 	}
 
-- 
Regards,

Laurent Pinchart

