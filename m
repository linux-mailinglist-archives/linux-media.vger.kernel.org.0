Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28E067DAD6
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 01:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbjA0Abd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 19:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjA0Abd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 19:31:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482D12CFDD
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 16:31:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CD73146B;
        Fri, 27 Jan 2023 01:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674779489;
        bh=H06ZQPTjbKiQFzIblCzCmzJ5sPljJX9E8BrOnnaJl3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X6Rv4Vb/X5LJ62XrkkYrdkErBo6LUwcWLgw6SqVaJ3DgKjbSQ+znTucQyOuPh4NoQ
         xVbiS+h0NCl7Ksm78WrR5z3JxbJVpIRD8/F9J5USjTt0770CoQ3H+hA0AH79lCbq78
         /WSeMom3xHfqv7pX10N1KWzZqY4sYDM8zQ6DgxJM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/3] media: rkisp1: resizer: Use V4L2 subdev active state
Date:   Fri, 27 Jan 2023 02:31:22 +0200
Message-Id: <20230127003124.31685-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
References: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the V4L2 subdev active state API to store the active format and crop
rectangle. This simplifies the driver not only by dropping the state
stored in the rkisp1_resizer structure, but also by replacing the
ops_lock with the state lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   6 -
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 184 +++++++-----------
 2 files changed, 66 insertions(+), 124 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index a1293c45aae1..e9626e59e1c8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -390,10 +390,7 @@ struct rkisp1_params {
  * @id:	       id of the resizer, one of RKISP1_SELFPATH, RKISP1_MAINPATH
  * @rkisp1:    pointer to the rkisp1 device
  * @pads:      media pads
- * @pad_cfg:   configurations for the pads
  * @config:    the set of registers to configure the resizer
- * @pixel_enc: pixel encoding of the resizer
- * @ops_lock:  a lock for the subdev ops
  */
 struct rkisp1_resizer {
 	struct v4l2_subdev sd;
@@ -401,10 +398,7 @@ struct rkisp1_resizer {
 	enum rkisp1_stream_id id;
 	struct rkisp1_device *rkisp1;
 	struct media_pad pads[RKISP1_RSZ_PAD_MAX];
-	struct v4l2_subdev_pad_config pad_cfg[RKISP1_RSZ_PAD_MAX];
 	const struct rkisp1_rsz_config *config;
-	enum v4l2_pixel_encoding pixel_enc;
-	struct mutex ops_lock; /* serialize the subdevice ops */
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index f76afd8112b2..62728ee6d058 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -117,34 +117,6 @@ static inline void rkisp1_rsz_write(struct rkisp1_resizer *rsz, u32 offset,
 	rkisp1_write(rsz->rkisp1, rsz->regs_base + offset, value);
 }
 
-static struct v4l2_mbus_framefmt *
-rkisp1_rsz_get_pad_fmt(struct rkisp1_resizer *rsz,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, u32 which)
-{
-	struct v4l2_subdev_state state = {
-		.pads = rsz->pad_cfg
-		};
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&rsz->sd, sd_state, pad);
-	else
-		return v4l2_subdev_get_try_format(&rsz->sd, &state, pad);
-}
-
-static struct v4l2_rect *
-rkisp1_rsz_get_pad_crop(struct rkisp1_resizer *rsz,
-			struct v4l2_subdev_state *sd_state,
-			unsigned int pad, u32 which)
-{
-	struct v4l2_subdev_state state = {
-		.pads = rsz->pad_cfg
-		};
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&rsz->sd, sd_state, pad);
-	else
-		return v4l2_subdev_get_try_crop(&rsz->sd, &state, pad);
-}
-
 /* ----------------------------------------------------------------------------
  * Dual crop hw configs
  */
@@ -165,17 +137,18 @@ static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
 }
 
 /* configure dual-crop unit */
-static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz)
+static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz,
+				struct v4l2_subdev_state *sd_state)
 {
 	struct rkisp1_device *rkisp1 = rsz->rkisp1;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 	u32 dc_ctrl;
 
-	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
-					    V4L2_SUBDEV_FORMAT_ACTIVE);
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SINK,
-					  V4L2_SUBDEV_FORMAT_ACTIVE);
+	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SINK);
+	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					      RKISP1_RSZ_PAD_SINK);
 
 	if (sink_crop->width == sink_fmt->width &&
 	    sink_crop->height == sink_fmt->height &&
@@ -296,6 +269,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 }
 
 static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
+			      struct v4l2_subdev_state *sd_state,
 			      enum rkisp1_shadow_regs_when when)
 {
 	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;
@@ -303,20 +277,21 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
-					    V4L2_SUBDEV_FORMAT_ACTIVE);
-	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SRC,
-					 V4L2_SUBDEV_FORMAT_ACTIVE);
-	src_yuv_info = rkisp1_rsz_get_yuv_mbus_info(src_fmt->code);
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SINK,
-					  V4L2_SUBDEV_FORMAT_ACTIVE);
+	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					      RKISP1_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SRC);
+
 	sink_yuv_info = rkisp1_rsz_get_yuv_mbus_info(sink_fmt->code);
+	src_yuv_info = rkisp1_rsz_get_yuv_mbus_info(src_fmt->code);
 
 	/*
 	 * The resizer only works on yuv formats,
 	 * so return if it is bayer format.
 	 */
-	if (rsz->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
+	if (!sink_yuv_info) {
 		rkisp1_rsz_disable(rsz, when);
 		return;
 	}
@@ -405,7 +380,7 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					      RKISP1_RSZ_PAD_SRC);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
@@ -423,7 +398,7 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 	sink_crop->left = 0;
 	sink_crop->top = 0;
 
-	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					     RKISP1_RSZ_PAD_SINK);
 	*src_fmt = *sink_fmt;
 
@@ -434,16 +409,16 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 
 static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
 				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_mbus_framefmt *format,
-				   unsigned int which)
+				   struct v4l2_mbus_framefmt *format)
 {
 	const struct rkisp1_mbus_info *sink_mbus_info;
 	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
-					  which);
-	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SRC,
-					 which);
+	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					      RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SRC);
+
 	sink_mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 
 	/* for YUV formats, userspace can change the mbus code on the src pad if it is supported */
@@ -463,18 +438,16 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
 
 static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 				     struct v4l2_subdev_state *sd_state,
-				     struct v4l2_rect *r,
-				     unsigned int which)
+				     struct v4l2_rect *r)
 {
 	const struct rkisp1_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
-					  which);
-	sink_crop = rkisp1_rsz_get_pad_crop(rsz, sd_state,
-					    RKISP1_RSZ_PAD_SINK,
-					    which);
+	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					      RKISP1_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SINK);
 
 	/* Not crop for MP bayer raw data */
 	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
@@ -501,21 +474,20 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 
 static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 				    struct v4l2_subdev_state *sd_state,
-				    struct v4l2_mbus_framefmt *format,
-				    unsigned int which)
+				    struct v4l2_mbus_framefmt *format)
 {
 	const struct rkisp1_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
 	bool is_yuv;
 
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
-					  which);
-	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SRC,
-					 which);
-	sink_crop = rkisp1_rsz_get_pad_crop(rsz, sd_state,
-					    RKISP1_RSZ_PAD_SINK,
-					    which);
+	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					      RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SRC);
+	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
+					     RKISP1_RSZ_PAD_SINK);
+
 	if (rsz->id == RKISP1_SELFPATH)
 		sink_fmt->code = MEDIA_BUS_FMT_YUYV8_2X8;
 	else
@@ -526,8 +498,6 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 		sink_fmt->code = RKISP1_DEF_FMT;
 		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 	}
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		rsz->pixel_enc = mbus_info->pixel_enc;
 
 	sink_fmt->width = clamp_t(u32, format->width,
 				  RKISP1_ISP_MIN_WIDTH,
@@ -576,21 +546,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	src_fmt->quantization = sink_fmt->quantization;
 
 	/* Update sink crop */
-	rkisp1_rsz_set_sink_crop(rsz, sd_state, sink_crop, which);
-}
-
-static int rkisp1_rsz_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
-{
-	struct rkisp1_resizer *rsz =
-		container_of(sd, struct rkisp1_resizer, sd);
-
-	mutex_lock(&rsz->ops_lock);
-	fmt->format = *rkisp1_rsz_get_pad_fmt(rsz, sd_state, fmt->pad,
-					      fmt->which);
-	mutex_unlock(&rsz->ops_lock);
-	return 0;
+	rkisp1_rsz_set_sink_crop(rsz, sd_state, sink_crop);
 }
 
 static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
@@ -600,15 +556,11 @@ static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
 
-	mutex_lock(&rsz->ops_lock);
 	if (fmt->pad == RKISP1_RSZ_PAD_SINK)
-		rkisp1_rsz_set_sink_fmt(rsz, sd_state, &fmt->format,
-					fmt->which);
+		rkisp1_rsz_set_sink_fmt(rsz, sd_state, &fmt->format);
 	else
-		rkisp1_rsz_set_src_fmt(rsz, sd_state, &fmt->format,
-				       fmt->which);
+		rkisp1_rsz_set_src_fmt(rsz, sd_state, &fmt->format);
 
-	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
@@ -616,35 +568,32 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
-	struct rkisp1_resizer *rsz =
-		container_of(sd, struct rkisp1_resizer, sd);
 	struct v4l2_mbus_framefmt *mf_sink;
 	int ret = 0;
 
 	if (sel->pad == RKISP1_RSZ_PAD_SRC)
 		return -EINVAL;
 
-	mutex_lock(&rsz->ops_lock);
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		mf_sink = rkisp1_rsz_get_pad_fmt(rsz, sd_state,
-						 RKISP1_RSZ_PAD_SINK,
-						 sel->which);
+		mf_sink = v4l2_subdev_get_pad_format(sd, sd_state,
+						     RKISP1_RSZ_PAD_SINK);
 		sel->r.height = mf_sink->height;
 		sel->r.width = mf_sink->width;
 		sel->r.left = 0;
 		sel->r.top = 0;
 		break;
+
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *rkisp1_rsz_get_pad_crop(rsz, sd_state,
-						  RKISP1_RSZ_PAD_SINK,
-						  sel->which);
+		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state,
+						   RKISP1_RSZ_PAD_SINK);
 		break;
+
 	default:
 		ret = -EINVAL;
+		break;
 	}
 
-	mutex_unlock(&rsz->ops_lock);
 	return ret;
 }
 
@@ -661,9 +610,7 @@ static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
 	dev_dbg(rsz->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
-	mutex_lock(&rsz->ops_lock);
-	rkisp1_rsz_set_sink_crop(rsz, sd_state, &sel->r, sel->which);
-	mutex_unlock(&rsz->ops_lock);
+	rkisp1_rsz_set_sink_crop(rsz, sd_state, &sel->r);
 
 	return 0;
 }
@@ -677,7 +624,7 @@ static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
 	.get_selection = rkisp1_rsz_get_selection,
 	.set_selection = rkisp1_rsz_set_selection,
 	.init_cfg = rkisp1_rsz_init_config,
-	.get_fmt = rkisp1_rsz_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rkisp1_rsz_set_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
 };
@@ -693,6 +640,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_device *rkisp1 = rsz->rkisp1;
 	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
 	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
+	struct v4l2_subdev_state *sd_state;
 
 	if (!enable) {
 		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
@@ -703,11 +651,13 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	if (other->is_streaming)
 		when = RKISP1_SHADOW_REGS_ASYNC;
 
-	mutex_lock(&rsz->ops_lock);
-	rkisp1_rsz_config(rsz, when);
-	rkisp1_dcrop_config(rsz);
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	rkisp1_rsz_config(rsz, sd_state, when);
+	rkisp1_dcrop_config(rsz, sd_state);
+
+	v4l2_subdev_unlock_state(sd_state);
 
-	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
@@ -726,15 +676,12 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 		return;
 
 	v4l2_device_unregister_subdev(&rsz->sd);
+	v4l2_subdev_cleanup(&rsz->sd);
 	media_entity_cleanup(&rsz->sd.entity);
-	mutex_destroy(&rsz->ops_lock);
 }
 
 static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 {
-	struct v4l2_subdev_state state = {
-		.pads = rsz->pad_cfg
-		};
 	static const char * const dev_names[] = {
 		RKISP1_RSZ_MP_DEV_NAME,
 		RKISP1_RSZ_SP_DEV_NAME
@@ -763,25 +710,26 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 	pads[RKISP1_RSZ_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
 					 MEDIA_PAD_FL_MUST_CONNECT;
 
-	rsz->pixel_enc = RKISP1_DEF_PIXEL_ENC;
-
-	mutex_init(&rsz->ops_lock);
 	ret = media_entity_pads_init(&sd->entity, RKISP1_RSZ_PAD_MAX, pads);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
 
 	ret = v4l2_device_register_subdev(&rsz->rkisp1->v4l2_dev, sd);
 	if (ret) {
 		dev_err(sd->dev, "Failed to register resizer subdev\n");
-		goto error;
+		goto err_subdev_cleanup;
 	}
 
-	rkisp1_rsz_init_config(sd, &state);
 	return 0;
 
-error:
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
 	media_entity_cleanup(&sd->entity);
-	mutex_destroy(&rsz->ops_lock);
 	return ret;
 }
 
-- 
Regards,

Laurent Pinchart

