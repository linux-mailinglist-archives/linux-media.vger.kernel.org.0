Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E5754BA4E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357611AbiFNTOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245409AbiFNTOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AFF764E
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:35 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9E9F825;
        Tue, 14 Jun 2022 21:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234074;
        bh=qbUKKlAVPblPV/pI5UUGyESkZeMPGJdVzC0EImNhNCQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HOeCrhf0+lGnb+Or7Y6tnvAbkPOSELAhg4TW05S13XYzWxqUdpLQBd2oH2oHqISbz
         BxPjUNYAz4hAdDynZt6BDC7qD3qJKDBRwtntykf0okFfriW8kUtAnmuVm5XdSxrPoV
         942ZqpKJ1DXt6d+Kpxe7/6/vPTwCtD3Mfvy+vHNo=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 41/55] media: rkisp1: csi: Plumb the CSI RX subdev
Date:   Wed, 15 Jun 2022 04:11:13 +0900
Message-Id: <20220614191127.3420492-42-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Connect the CSI receiver subdevice into the rest of the driver. This
includes:
- calling the subdevice via the v4l2 subdev API
- moving the async notifier for the sensor from the ISP to the CSI
  receiver
- in the ISP, create a media link to the CSI receiver, and remove the
  media link creation to the sensor
- in the CSI receiver, create a media link to the sensor

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 34 ++++++++++++++++--
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  6 ++--
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 36 +++++++++----------
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 21 ++---------
 4 files changed, 53 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 8182694a6fe0..96712b467dde 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -43,6 +43,34 @@ rkisp1_csi_get_pad_fmt(struct rkisp1_csi *csi,
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
@@ -118,8 +146,8 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
 }
 
-int rkisp1_csi_start(struct rkisp1_csi *csi,
-		     const struct rkisp1_sensor_async *sensor)
+static int rkisp1_csi_start(struct rkisp1_csi *csi,
+			    const struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	union phy_configure_opts opts;
@@ -155,7 +183,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
 	return 0;
 }
 
-void rkisp1_csi_stop(struct rkisp1_csi *csi)
+static void rkisp1_csi_stop(struct rkisp1_csi *csi)
 {
 	rkisp1_csi_disable(csi);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
index ddf8e5e08f55..eadcd24f65fb 100644
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
index faf2cd4c8149..a3e182c86bdd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 
 #include "rkisp1-common.h"
 #include "rkisp1-csi.h"
@@ -119,17 +120,8 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
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
@@ -138,10 +130,7 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 		return source_pad;
 	}
 
-	return media_create_pad_link(&sd->entity, source_pad,
-				     &rkisp1->isp.sd.entity,
-				     RKISP1_ISP_PAD_SINK_VIDEO,
-				     !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
+	return rkisp1_csi_link_sensor(rkisp1, sd, s_asd, source_pad);
 }
 
 static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
@@ -283,6 +272,14 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
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
@@ -364,13 +361,6 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
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
@@ -534,10 +524,16 @@ static int rkisp1_probe(struct platform_device *pdev)
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
index 5afb8be311c7..260c9ce0dca4 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -16,7 +16,6 @@
 #include <media/v4l2-event.h>
 
 #include "rkisp1-common.h"
-#include "rkisp1-csi.h"
 
 #define RKISP1_DEF_SINK_PAD_FMT MEDIA_BUS_FMT_SRGGB10_1X10
 #define RKISP1_DEF_SRC_PAD_FMT MEDIA_BUS_FMT_YUYV8_2X8
@@ -728,16 +727,12 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	const struct rkisp1_sensor_async *asd;
 	struct media_pad *source_pad;
 	int ret;
 
 	if (!enable) {
 		v4l2_subdev_call(rkisp1->source, video, s_stream, false);
-
-		rkisp1_csi_stop(&rkisp1->csi);
 		rkisp1_isp_stop(isp);
-
 		return 0;
 	}
 
@@ -754,30 +749,20 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
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
2.30.2

