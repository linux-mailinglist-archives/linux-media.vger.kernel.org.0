Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5E554BA4F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357686AbiFNTOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245409AbiFNTOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E5F167E1
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:31 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 526B8D96;
        Tue, 14 Jun 2022 21:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234070;
        bh=jbvJX7i+C9k1JYEVwzj6u7FtLpm2xQDOpc3cY6tnv+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WTQtaA7ou46YgDy+YL6jXY2MKsyZztW4FIup7PdyOnqOC7zbmb1yxS+wFXAevcrdj
         uX9Xd0oYNFzD40Ng6JVmuk6U3S1M2Lz0WBRqSKWqbTqMjJLy5f+sqVYBJTR60xw9+/
         U1T9hicyPqEA1iBSWc1FEebz6jvBEfBt/+2PCe6w=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 40/55] media: rkisp1: csi: Implement a V4L2 subdev for the CSI receiver
Date:   Wed, 15 Jun 2022 04:11:12 +0900
Message-Id: <20220614191127.3420492-41-paul.elder@ideasonboard.com>
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

The CSI receiver is a component separate from the ISP or the resizers.
It is actually optional, not all device model include a CSI receiver. On
some SoCs CSI-2 support can be provided through an external CSI-2
receiver, connected to the ISP's parallel input.

To support those use cases, create a V4L2 subdev to model the CSI
receiver. It will allow the driver to handle both internal and external
CSI receivers the same way.

The next commit will plumb the CSI subdev to the rest of the driver,
replacing direct function calls.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  17 ++
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 287 ++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |   4 +
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |   5 +
 4 files changed, 313 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 3c55e922346e..0ab49d1feb55 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -68,6 +68,13 @@ enum rkisp1_rsz_pad {
 	RKISP1_RSZ_PAD_MAX
 };
 
+/* enum for the csi receiver pads */
+enum rkisp1_csi_pad {
+	RKISP1_CSI_PAD_SINK,
+	RKISP1_CSI_PAD_SRC,
+	RKISP1_CSI_PAD_MAX
+};
+
 /* enum for the capture id */
 enum rkisp1_stream_id {
 	RKISP1_MAINPATH,
@@ -141,11 +148,21 @@ struct rkisp1_sensor_async {
  * @rkisp1: pointer to the rkisp1 device
  * @dphy: a pointer to the phy
  * @is_dphy_errctrl_disabled: if dphy errctrl is disabled (avoid endless interrupt)
+ * @sd: v4l2_subdev variable
+ * @pads: media pads
+ * @pad_cfg: configurations for the pads
+ * @ops_lock: a lock for the subdev ops
+ * @source: source in-use, set when starting streaming
  */
 struct rkisp1_csi {
 	struct rkisp1_device *rkisp1;
 	struct phy *dphy;
 	bool is_dphy_errctrl_disabled;
+	struct v4l2_subdev sd;
+	struct media_pad pads[RKISP1_CSI_PAD_MAX];
+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_CSI_PAD_MAX];
+	struct mutex ops_lock; /* serialize the subdevice ops */
+	struct rkisp1_sensor_async *source;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 425a3b014089..8182694a6fe0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -15,10 +15,34 @@
 #include <linux/phy/phy-mipi-dphy.h>
 
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
 
 #include "rkisp1-common.h"
 #include "rkisp1-csi.h"
 
+#define RKISP1_CSI_DEV_NAME	RKISP1_DRIVER_NAME "_csi"
+
+#define RKISP1_CSI_DEF_FMT	MEDIA_BUS_FMT_SRGGB10_1X10
+
+static inline struct rkisp1_csi *to_rkisp1_csi(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkisp1_csi, sd);
+}
+
+static struct v4l2_mbus_framefmt *
+rkisp1_csi_get_pad_fmt(struct rkisp1_csi *csi,
+		       struct v4l2_subdev_state *sd_state,
+		       unsigned int pad, u32 which)
+{
+	struct v4l2_subdev_state state = {
+		.pads = csi->pad_cfg
+	};
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&csi->sd, sd_state, pad);
+	else
+		return v4l2_subdev_get_try_format(&csi->sd, &state, pad);
+}
+
 static int rkisp1_csi_config(struct rkisp1_csi *csi,
 			     const struct rkisp1_sensor_async *sensor)
 {
@@ -185,6 +209,269 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
 	return IRQ_HANDLED;
 }
 
+/* ----------------------------------------------------------------------------
+ * Subdev pad operations
+ */
+
+static void rkisp1_csi_set_src_fmt(struct rkisp1_csi *csi,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_mbus_framefmt *format,
+				   unsigned int which)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	/* We don't set the src format directly; take it from the sink format */
+	sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SINK,
+					  which);
+
+	*format = *sink_fmt;
+}
+
+static void rkisp1_csi_set_sink_fmt(struct rkisp1_csi *csi,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_mbus_framefmt *format,
+				    unsigned int which)
+{
+	const struct rkisp1_mbus_info *mbus_info;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SINK,
+					  which);
+	src_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SRC,
+					 which);
+
+	sink_fmt->code = format->code;
+
+	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
+	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
+		sink_fmt->code = RKISP1_CSI_DEF_FMT;
+		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
+	}
+
+	sink_fmt->width = clamp_t(u32, format->width,
+				  RKISP1_ISP_MIN_WIDTH,
+				  RKISP1_ISP_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, format->height,
+				   RKISP1_ISP_MIN_HEIGHT,
+				   RKISP1_ISP_MAX_HEIGHT);
+
+	/* Propagate to source pad */
+	src_fmt->code = sink_fmt->code;
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+
+	*format = *sink_fmt;
+}
+
+static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int i;
+	int pos = 0;
+
+	if (code->index >= rkisp1_mbus_info_length())
+		return -EINVAL;
+
+	for (i = 0; i < rkisp1_mbus_info_length(); i++) {
+		const struct rkisp1_mbus_info *fmt =
+			rkisp1_mbus_info_get_by_index(i);
+
+		if (fmt->direction & RKISP1_ISP_SD_SINK)
+			pos++;
+
+		if (code->index == pos - 1) {
+			code->code = fmt->mbus_code;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int rkisp1_csi_init_config(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+					      RKISP1_CSI_PAD_SRC);
+	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
+	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = RKISP1_CSI_DEF_FMT;
+
+	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+					     RKISP1_CSI_PAD_SINK);
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static int rkisp1_csi_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
+
+	mutex_lock(&csi->ops_lock);
+	fmt->format = *rkisp1_csi_get_pad_fmt(csi, sd_state, fmt->pad,
+					      fmt->which);
+	mutex_unlock(&csi->ops_lock);
+	return 0;
+}
+
+static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
+
+	mutex_lock(&csi->ops_lock);
+	if (fmt->pad == RKISP1_CSI_PAD_SINK)
+		rkisp1_csi_set_sink_fmt(csi, sd_state, &fmt->format,
+					fmt->which);
+	else
+		rkisp1_csi_set_src_fmt(csi, sd_state, &fmt->format,
+				       fmt->which);
+
+	mutex_unlock(&csi->ops_lock);
+	return 0;
+}
+
+/* ----------------------------------------------------------------------------
+ * Subdev video operations
+ */
+
+static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	struct media_pad *source_pad;
+	struct v4l2_subdev *source;
+	int ret;
+
+	if (!enable) {
+		v4l2_subdev_call(csi->source->sd, video, s_stream,
+				 false);
+
+		rkisp1_csi_stop(csi);
+
+		return ret;
+	}
+
+	source_pad = media_entity_remote_source_pad(&sd->entity);
+	if (IS_ERR(source_pad)) {
+		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %d\n", ret);
+		return -EPIPE;
+	}
+
+	source = media_entity_to_v4l2_subdev(source_pad->entity);
+	if (!source) {
+		/* This should really not happen, so is not worth a message. */
+		return -EPIPE;
+	}
+
+	csi->source = container_of(source->asd, struct rkisp1_sensor_async,
+				   asd);
+
+	if (csi->source->mbus_type != V4L2_MBUS_CSI2_DPHY)
+		return -EINVAL;
+
+	mutex_lock(&csi->ops_lock);
+	ret = rkisp1_csi_start(csi, csi->source);
+	mutex_unlock(&csi->ops_lock);
+	if (ret)
+		return ret;
+
+	v4l2_subdev_call(csi->source->sd, video, s_stream, true);
+
+	return 0;
+}
+
+/* ----------------------------------------------------------------------------
+ * Registration
+ */
+
+static const struct media_entity_operations rkisp1_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_video_ops rkisp1_csi_video_ops = {
+	.s_stream = rkisp1_csi_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops rkisp1_csi_pad_ops = {
+	.enum_mbus_code = rkisp1_csi_enum_mbus_code,
+	.init_cfg = rkisp1_csi_init_config,
+	.get_fmt = rkisp1_csi_get_fmt,
+	.set_fmt = rkisp1_csi_set_fmt,
+};
+
+static const struct v4l2_subdev_ops rkisp1_csi_ops = {
+	.video = &rkisp1_csi_video_ops,
+	.pad = &rkisp1_csi_pad_ops,
+};
+
+int rkisp1_csi_register(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_csi *csi = &rkisp1->csi;
+	struct v4l2_subdev_state state = {};
+	struct media_pad *pads;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	csi->rkisp1 = rkisp1;
+	mutex_init(&csi->ops_lock);
+
+	sd = &csi->sd;
+	v4l2_subdev_init(sd, &rkisp1_csi_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.ops = &rkisp1_csi_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->owner = THIS_MODULE;
+	strscpy(sd->name, RKISP1_CSI_DEV_NAME, sizeof(sd->name));
+
+	pads = csi->pads;
+	pads[RKISP1_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					  MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKISP1_CSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
+					 MEDIA_PAD_FL_MUST_CONNECT;
+
+	ret = media_entity_pads_init(&sd->entity, RKISP1_CSI_PAD_MAX, pads);
+	if (ret)
+		goto error;
+
+	state.pads = csi->pad_cfg;
+	rkisp1_csi_init_config(sd, &state);
+
+	ret = v4l2_device_register_subdev(&csi->rkisp1->v4l2_dev, sd);
+	if (ret) {
+		dev_err(sd->dev, "Failed to register csi receiver subdev\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+	media_entity_cleanup(&sd->entity);
+	mutex_destroy(&csi->ops_lock);
+	csi->rkisp1 = NULL;
+	return ret;
+}
+
+void rkisp1_csi_unregister(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_csi *csi = &rkisp1->csi;
+
+	if (!csi->rkisp1)
+		return;
+
+	v4l2_device_unregister_subdev(&csi->sd);
+	media_entity_cleanup(&csi->sd.entity);
+	mutex_destroy(&csi->ops_lock);
+}
+
 int rkisp1_csi_init(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_csi *csi = &rkisp1->csi;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
index 97ce7e7959ab..ddf8e5e08f55 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -13,10 +13,14 @@
 
 struct rkisp1_device;
 struct rkisp1_sensor_async;
+struct v4l2_subdev;
 
 int rkisp1_csi_init(struct rkisp1_device *rkisp1);
 void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
 
+int rkisp1_csi_register(struct rkisp1_device *rkisp1);
+void rkisp1_csi_unregister(struct rkisp1_device *rkisp1);
+
 int rkisp1_csi_start(struct rkisp1_csi *csi,
 		     const struct rkisp1_sensor_async *sensor);
 void rkisp1_csi_stop(struct rkisp1_csi *csi);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 253220188abd..faf2cd4c8149 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -324,6 +324,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 
 static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
 {
+	rkisp1_csi_unregister(rkisp1);
 	rkisp1_params_unregister(rkisp1);
 	rkisp1_stats_unregister(rkisp1);
 	rkisp1_capture_devs_unregister(rkisp1);
@@ -355,6 +356,10 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		goto error;
 
+	ret = rkisp1_csi_register(rkisp1);
+	if (ret)
+		goto error;
+
 	ret = rkisp1_create_links(rkisp1);
 	if (ret)
 		goto error;
-- 
2.30.2

