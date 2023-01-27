Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888F967DAD8
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 01:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbjA0Abk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 19:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjA0Abi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 19:31:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8060459D6
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 16:31:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E241588;
        Fri, 27 Jan 2023 01:31:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674779492;
        bh=I4cTvXY50DP5vFRqWKpdamGCNRLGztEDmz2bYMvU8Fk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=idBtYuGNInC1FE/dVvoK1wkT1b8yVevDRKLJ/vjvE6k+yFS8+LDF/4gpBmfWpqYSa
         wg7euD5WsyoYo31IsRE0eKF2B3A1yLX2XtUFmOZ4dnUgTXGmkdT/GZ/HBQrLUKD4xC
         7s173cwgWLSD7jdUk00o1ePYfUY+Fm2uXYOxs+1s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v1 3/3] media: rkisp1: csi: Use V4L2 subdev active state
Date:   Fri, 27 Jan 2023 02:31:24 +0200
Message-Id: <20230127003124.31685-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
References: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
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

Use the V4L2 subdev active state API to store the active format and crop
rectangle. This simplifies the driver not only by dropping the state
stored in the rkisp1_csi structure, but also by replacing the ops_lock
with the state lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   6 -
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 107 ++++++------------
 2 files changed, 33 insertions(+), 80 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index d43ff1b549d9..dbd8725f2ec9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -167,9 +167,6 @@ struct rkisp1_sensor_async {
  * @is_dphy_errctrl_disabled: if dphy errctrl is disabled (avoid endless interrupt)
  * @sd: v4l2_subdev variable
  * @pads: media pads
- * @pad_cfg: configurations for the pads
- * @sink_fmt: input format
- * @lock: protects pad_cfg and sink_fmt
  * @source: source in-use, set when starting streaming
  */
 struct rkisp1_csi {
@@ -178,9 +175,6 @@ struct rkisp1_csi {
 	bool is_dphy_errctrl_disabled;
 	struct v4l2_subdev sd;
 	struct media_pad pads[RKISP1_CSI_PAD_NUM];
-	struct v4l2_subdev_pad_config pad_cfg[RKISP1_CSI_PAD_NUM];
-	const struct rkisp1_mbus_info *sink_fmt;
-	struct mutex lock;
 	struct v4l2_subdev *source;
 };
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index d7acc94e10f8..d8d50270f6db 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -30,23 +30,6 @@ static inline struct rkisp1_csi *to_rkisp1_csi(struct v4l2_subdev *sd)
 	return container_of(sd, struct rkisp1_csi, sd);
 }
 
-static struct v4l2_mbus_framefmt *
-rkisp1_csi_get_pad_fmt(struct rkisp1_csi *csi,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, u32 which)
-{
-	struct v4l2_subdev_state state = {
-		.pads = csi->pad_cfg
-	};
-
-	lockdep_assert_held(&csi->lock);
-
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi->sd, sd_state, pad);
-	else
-		return v4l2_subdev_get_try_format(&csi->sd, &state, pad);
-}
-
 int rkisp1_csi_link_sensor(struct rkisp1_device *rkisp1, struct v4l2_subdev *sd,
 			   struct rkisp1_sensor_async *s_asd,
 			   unsigned int source_pad)
@@ -76,7 +59,8 @@ int rkisp1_csi_link_sensor(struct rkisp1_device *rkisp1, struct v4l2_subdev *sd,
 }
 
 static int rkisp1_csi_config(struct rkisp1_csi *csi,
-			     const struct rkisp1_sensor_async *sensor)
+			     const struct rkisp1_sensor_async *sensor,
+			     const struct rkisp1_mbus_info *format)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	unsigned int lanes = sensor->lanes;
@@ -98,7 +82,7 @@ static int rkisp1_csi_config(struct rkisp1_csi *csi,
 
 	/* Configure Data Type and Virtual Channel */
 	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL,
-		     RKISP1_CIF_MIPI_DATA_SEL_DT(csi->sink_fmt->mipi_dt) |
+		     RKISP1_CIF_MIPI_DATA_SEL_DT(format->mipi_dt) |
 		     RKISP1_CIF_MIPI_DATA_SEL_VC(0));
 
 	/* Clear MIPI interrupts */
@@ -151,7 +135,8 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 }
 
 static int rkisp1_csi_start(struct rkisp1_csi *csi,
-			    const struct rkisp1_sensor_async *sensor)
+			    const struct rkisp1_sensor_async *sensor,
+			    const struct rkisp1_mbus_info *format)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	union phy_configure_opts opts;
@@ -159,7 +144,7 @@ static int rkisp1_csi_start(struct rkisp1_csi *csi,
 	s64 pixel_clock;
 	int ret;
 
-	ret = rkisp1_csi_config(csi, sensor);
+	ret = rkisp1_csi_config(csi, sensor, format);
 	if (ret)
 		return ret;
 
@@ -169,7 +154,7 @@ static int rkisp1_csi_start(struct rkisp1_csi *csi,
 		return -EINVAL;
 	}
 
-	phy_mipi_dphy_get_default_config(pixel_clock, csi->sink_fmt->bus_width,
+	phy_mipi_dphy_get_default_config(pixel_clock, format->bus_width,
 					 sensor->lanes, cfg);
 	phy_set_mode(csi->dphy, PHY_MODE_MIPI_DPHY);
 	phy_configure(csi->dphy, &opts);
@@ -248,7 +233,6 @@ static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
 	unsigned int i;
 	int pos = 0;
 
@@ -258,15 +242,10 @@ static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index)
 			return -EINVAL;
 
-		mutex_lock(&csi->lock);
-
-		sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state,
-						  RKISP1_CSI_PAD_SINK,
-						  code->which);
+		sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
+						      RKISP1_CSI_PAD_SINK);
 		code->code = sink_fmt->code;
 
-		mutex_unlock(&csi->lock);
-
 		return 0;
 	}
 
@@ -296,9 +275,9 @@ static int rkisp1_csi_init_config(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 
-	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					      RKISP1_CSI_PAD_SINK);
-	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					     RKISP1_CSI_PAD_SRC);
 
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
@@ -311,36 +290,18 @@ static int rkisp1_csi_init_config(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int rkisp1_csi_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
-{
-	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
-
-	mutex_lock(&csi->lock);
-	fmt->format = *rkisp1_csi_get_pad_fmt(csi, sd_state, fmt->pad,
-					      fmt->which);
-	mutex_unlock(&csi->lock);
-
-	return 0;
-}
-
 static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
-	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
 	const struct rkisp1_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 
 	/* The format on the source pad always matches the sink pad. */
 	if (fmt->pad == RKISP1_CSI_PAD_SRC)
-		return rkisp1_csi_get_fmt(sd, sd_state, fmt);
+		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
 
-	mutex_lock(&csi->lock);
-
-	sink_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SINK,
-					  fmt->which);
+	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, RKISP1_CSI_PAD_SINK);
 
 	sink_fmt->code = fmt->format.code;
 
@@ -359,16 +320,10 @@ static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
 
 	fmt->format = *sink_fmt;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		csi->sink_fmt = mbus_info;
-
 	/* Propagate the format to the source pad. */
-	src_fmt = rkisp1_csi_get_pad_fmt(csi, sd_state, RKISP1_CSI_PAD_SRC,
-					 fmt->which);
+	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state, RKISP1_CSI_PAD_SRC);
 	*src_fmt = *sink_fmt;
 
-	mutex_unlock(&csi->lock);
-
 	return 0;
 }
 
@@ -380,7 +335,10 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	const struct v4l2_mbus_framefmt *sink_fmt;
+	const struct rkisp1_mbus_info *format;
 	struct rkisp1_sensor_async *source_asd;
+	struct v4l2_subdev_state *sd_state;
 	struct media_pad *source_pad;
 	struct v4l2_subdev *source;
 	int ret;
@@ -410,9 +368,12 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	if (source_asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
 		return -EINVAL;
 
-	mutex_lock(&csi->lock);
-	ret = rkisp1_csi_start(csi, source_asd);
-	mutex_unlock(&csi->lock);
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, RKISP1_CSI_PAD_SINK);
+	format = rkisp1_mbus_info_get_by_code(sink_fmt->code);
+	v4l2_subdev_unlock_state(sd_state);
+
+	ret = rkisp1_csi_start(csi, source_asd, format);
 	if (ret)
 		return ret;
 
@@ -442,7 +403,7 @@ static const struct v4l2_subdev_video_ops rkisp1_csi_video_ops = {
 static const struct v4l2_subdev_pad_ops rkisp1_csi_pad_ops = {
 	.enum_mbus_code = rkisp1_csi_enum_mbus_code,
 	.init_cfg = rkisp1_csi_init_config,
-	.get_fmt = rkisp1_csi_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rkisp1_csi_set_fmt,
 };
 
@@ -454,13 +415,11 @@ static const struct v4l2_subdev_ops rkisp1_csi_ops = {
 int rkisp1_csi_register(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_csi *csi = &rkisp1->csi;
-	struct v4l2_subdev_state state = {};
 	struct media_pad *pads;
 	struct v4l2_subdev *sd;
 	int ret;
 
 	csi->rkisp1 = rkisp1;
-	mutex_init(&csi->lock);
 
 	sd = &csi->sd;
 	v4l2_subdev_init(sd, &rkisp1_csi_ops);
@@ -476,26 +435,26 @@ int rkisp1_csi_register(struct rkisp1_device *rkisp1)
 	pads[RKISP1_CSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
 					 MEDIA_PAD_FL_MUST_CONNECT;
 
-	csi->sink_fmt = rkisp1_mbus_info_get_by_code(RKISP1_CSI_DEF_FMT);
-
 	ret = media_entity_pads_init(&sd->entity, RKISP1_CSI_PAD_NUM, pads);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
 
-	state.pads = csi->pad_cfg;
-	rkisp1_csi_init_config(sd, &state);
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
 
 	ret = v4l2_device_register_subdev(&csi->rkisp1->v4l2_dev, sd);
 	if (ret) {
 		dev_err(sd->dev, "Failed to register csi receiver subdev\n");
-		goto error;
+		goto err_subdev_cleanup;
 	}
 
 	return 0;
 
-error:
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
 	media_entity_cleanup(&sd->entity);
-	mutex_destroy(&csi->lock);
 	csi->rkisp1 = NULL;
 	return ret;
 }
@@ -508,8 +467,8 @@ void rkisp1_csi_unregister(struct rkisp1_device *rkisp1)
 		return;
 
 	v4l2_device_unregister_subdev(&csi->sd);
+	v4l2_subdev_cleanup(&csi->sd);
 	media_entity_cleanup(&csi->sd.entity);
-	mutex_destroy(&csi->lock);
 }
 
 int rkisp1_csi_init(struct rkisp1_device *rkisp1)
-- 
Regards,

Laurent Pinchart

