Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479E965D944
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 17:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239704AbjADQW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 11:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239781AbjADQWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 11:22:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C9942E1C
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 08:22:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F06EA127D;
        Wed,  4 Jan 2023 17:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672849342;
        bh=3puvoP3RdJKJi9M4ppK/F23lXuCDIerrbCcEa54Z7RI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s1SeUjTOcxQrilyq2/5vmWE7C8r6rv/adaq4TykgbddjsK3T1HmDSVgR7iVfYgteh
         mYZWc4zgLaYlGWC0rgwZtZETJoVw9Yrw/0caabU/jYPEKT0glHpfW02BkDe0lI9uqu
         h6FfKIBLC5TpfZsPf83bFtCZ+3aNKpArbSJmnt4Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH v1 2/2] media: sun6i-csi: subdev: Use subdev active state to store active format
Date:   Wed,  4 Jan 2023 18:22:15 +0200
Message-Id: <20230104162215.31194-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
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

The sun6i_csi_bridge structure stores the active format as a struct
v4l2_mbus_framefmt instance. Now that the V4L2 subdev core supports
managing the active state, use it to replace the manually-managed
format. This simplifies the implementation of the subdev operations by
removing the need for a custom .get_fmt() handler.

The subdev state now needs to be passed manually from the .s_stream()
operation to internal functions that need to access the format. As a
result, the sun6i_csi_bridge_format() helper function is now unused and
can be dropped.

The .init_cfg() and .set_fmt() operations also need to be updated
accordingly. As a result, .set_fmt() now correctly propagates the format
from the sink pad to the source pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 202 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 -
 2 files changed, 95 insertions(+), 109 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index a149a0d4e601..d3a8b18ff348 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -13,17 +13,6 @@
 #include "sun6i_csi_bridge.h"
 #include "sun6i_csi_reg.h"
 
-/* Helpers */
-
-static void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-				    u32 *mbus_code, u32 *field)
-{
-	if (mbus_code)
-		*mbus_code = csi_dev->bridge.mbus_format.code;
-	if (field)
-		*field = csi_dev->bridge.mbus_format.field;
-}
-
 /* Format */
 
 static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
@@ -217,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
+				    struct v4l2_subdev_state *state)
 {
 	struct device *dev = csi_dev->dev;
 	struct regmap *regmap = csi_dev->regmap;
@@ -225,14 +215,15 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 		&csi_dev->bridge.source_parallel.endpoint;
 	unsigned char bus_width = endpoint->bus.parallel.bus_width;
 	unsigned int flags = endpoint->bus.parallel.flags;
-	u32 field;
+	const struct v4l2_mbus_framefmt *sink_format;
 	u32 value = SUN6I_CSI_IF_CFG_IF_CSI;
 
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+	sink_format = v4l2_subdev_get_pad_format(&csi_dev->bridge.subdev, state,
+						 SUN6I_CSI_BRIDGE_PAD_SINK);
 
-	if (field == V4L2_FIELD_INTERLACED ||
-	    field == V4L2_FIELD_INTERLACED_TB ||
-	    field == V4L2_FIELD_INTERLACED_BT)
+	if (sink_format->field == V4L2_FIELD_INTERLACED ||
+	    sink_format->field == V4L2_FIELD_INTERLACED_TB ||
+	    sink_format->field == V4L2_FIELD_INTERLACED_BT)
 		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_INTERLACED |
 			 SUN6I_CSI_IF_CFG_FIELD_DT_PCLK_SHIFT(1) |
 			 SUN6I_CSI_IF_CFG_FIELD_DT_FIELD_VSYNC;
@@ -308,17 +299,19 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
+				     struct v4l2_subdev_state *state)
 {
+	const struct v4l2_mbus_framefmt *sink_format;
 	struct regmap *regmap = csi_dev->regmap;
 	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
-	u32 field;
 
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+	sink_format = v4l2_subdev_get_pad_format(&csi_dev->bridge.subdev, state,
+						 SUN6I_CSI_BRIDGE_PAD_SINK);
 
-	if (field == V4L2_FIELD_INTERLACED ||
-	    field == V4L2_FIELD_INTERLACED_TB ||
-	    field == V4L2_FIELD_INTERLACED_BT)
+	if (sink_format->field == V4L2_FIELD_INTERLACED ||
+	    sink_format->field == V4L2_FIELD_INTERLACED_TB ||
+	    sink_format->field == V4L2_FIELD_INTERLACED_BT)
 		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_INTERLACED;
 	else
 		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_PROGRESSIVE;
@@ -326,19 +319,21 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
 	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
 }
 
-static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
+static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
+					      struct v4l2_subdev_state *state)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	bool capture_streaming = csi_dev->capture.state.streaming;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	const struct sun6i_csi_capture_format *capture_format;
-	u32 mbus_code, field, pixelformat;
+	const struct v4l2_mbus_framefmt *sink_format;
+	u32 pixelformat;
 	u8 input_format, input_yuv_seq, output_format;
 	u32 value = 0;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
-
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	sink_format = v4l2_subdev_get_pad_format(&csi_dev->bridge.subdev, state,
+						 SUN6I_CSI_BRIDGE_PAD_SINK);
+	bridge_format = sun6i_csi_bridge_format_find(sink_format->code);
 	if (WARN_ON(!bridge_format))
 		return;
 
@@ -358,9 +353,9 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 		if (capture_format->input_yuv_seq_invert)
 			input_yuv_seq = bridge_format->input_yuv_seq_invert;
 
-		if (field == V4L2_FIELD_INTERLACED ||
-		    field == V4L2_FIELD_INTERLACED_TB ||
-		    field == V4L2_FIELD_INTERLACED_BT)
+		if (sink_format->field == V4L2_FIELD_INTERLACED ||
+		    sink_format->field == V4L2_FIELD_INTERLACED_TB ||
+		    sink_format->field == V4L2_FIELD_INTERLACED_BT)
 			output_format = capture_format->output_format_field;
 		else
 			output_format = capture_format->output_format_frame;
@@ -371,9 +366,9 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 	value |= SUN6I_CSI_CH_CFG_INPUT_FMT(input_format);
 	value |= SUN6I_CSI_CH_CFG_INPUT_YUV_SEQ(input_yuv_seq);
 
-	if (field == V4L2_FIELD_TOP)
+	if (sink_format->field == V4L2_FIELD_TOP)
 		value |= SUN6I_CSI_CH_CFG_FIELD_SEL_FIELD0;
-	else if (field == V4L2_FIELD_BOTTOM)
+	else if (sink_format->field == V4L2_FIELD_BOTTOM)
 		value |= SUN6I_CSI_CH_CFG_FIELD_SEL_FIELD1;
 	else
 		value |= SUN6I_CSI_CH_CFG_FIELD_SEL_EITHER;
@@ -382,16 +377,17 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 }
 
 static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
-				       struct sun6i_csi_bridge_source *source)
+				       struct sun6i_csi_bridge_source *source,
+				       struct v4l2_subdev_state *state)
 {
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 
 	if (source == &bridge->source_parallel)
-		sun6i_csi_bridge_configure_parallel(csi_dev);
+		sun6i_csi_bridge_configure_parallel(csi_dev, state);
 	else
-		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
+		sun6i_csi_bridge_configure_mipi_csi2(csi_dev, state);
 
-	sun6i_csi_bridge_configure_format(csi_dev);
+	sun6i_csi_bridge_configure_format(csi_dev, state);
 }
 
 /* V4L2 Subdev */
@@ -406,6 +402,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_csi_bridge_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	/* Source */
@@ -441,8 +438,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	sun6i_csi_bridge_irq_clear(csi_dev);
 
 	/* Configure */
-
-	sun6i_csi_bridge_configure(csi_dev, source);
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+	sun6i_csi_bridge_configure(csi_dev, source, state);
+	v4l2_subdev_unlock_state(state);
 
 	if (capture_streaming)
 		sun6i_csi_capture_configure(csi_dev);
@@ -480,40 +478,6 @@ static const struct v4l2_subdev_video_ops sun6i_csi_bridge_video_ops = {
 	.s_stream	= sun6i_csi_bridge_s_stream,
 };
 
-static void
-sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
-{
-	if (!sun6i_csi_bridge_format_find(mbus_format->code))
-		mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
-
-	mbus_format->field = V4L2_FIELD_NONE;
-	mbus_format->colorspace = V4L2_COLORSPACE_RAW;
-	mbus_format->quantization = V4L2_QUANTIZATION_DEFAULT;
-	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-}
-
-static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_state *state)
-{
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_get_try_format(subdev, state, pad);
-	struct mutex *lock = &csi_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
-	mbus_format->width = 1280;
-	mbus_format->height = 720;
-
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int
 sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *state,
@@ -527,54 +491,77 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_state *state,
-				    struct v4l2_subdev_format *format)
-{
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
-							   format->pad);
-	else
-		*mbus_format = csi_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *sink_format;
+	struct v4l2_mbus_framefmt *src_format;
 
-	mutex_lock(lock);
+	/*
+	 * As the source format can't change independently of the sink format,
+	 * a set operation on the source is a get.
+	 */
+	if (format->pad == SUN6I_CSI_BRIDGE_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	sink_format = v4l2_subdev_get_pad_format(subdev, state,
+						 SUN6I_CSI_BRIDGE_PAD_SINK);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
-			*mbus_format;
+	if (!sun6i_csi_bridge_format_find(format->format.code))
+		sink_format->code = sun6i_csi_bridge_formats[0].mbus_code;
 	else
-		csi_dev->bridge.mbus_format = *mbus_format;
+		sink_format->code = format->format.code;
 
-	mutex_unlock(lock);
+	sink_format->width = format->format.width;
+	sink_format->height = format->format.height;
+
+	/* Accept any colorspace as the CSI bridge isn't colorspace-aware. */
+	sink_format->colorspace = format->format.colorspace;
+	sink_format->xfer_func = format->format.xfer_func;
+	sink_format->ycbcr_enc = format->format.ycbcr_enc;
+	sink_format->quantization = format->format.quantization;
+
+	sink_format->field = V4L2_FIELD_NONE;
+
+	format->format = *sink_format;
+
+	/*
+	 * Propagate the format to the source pad. The CSI bridge can't
+	 * transcode, the format on the source pad always matches the sink pad
+	 * exactly.
+	 */
+	src_format = v4l2_subdev_get_pad_format(subdev, state,
+						SUN6I_CSI_BRIDGE_PAD_SOURCE);
+	*src_format = *sink_format;
 
 	return 0;
 }
 
+static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format format = {
+		.pad = SUN6I_CSI_BRIDGE_PAD_SINK,
+		.format = {
+			.code = sun6i_csi_bridge_formats[0].mbus_code,
+			.width = 1280,
+			.height = 720,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_RAW,
+			.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+			.quantization = V4L2_QUANTIZATION_DEFAULT,
+			.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+		},
+	};
+
+	return sun6i_csi_bridge_set_fmt(subdev, state, &format);
+}
+
 static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
 	.init_cfg	= sun6i_csi_bridge_init_cfg,
 	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
-	.get_fmt	= sun6i_csi_bridge_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_csi_bridge_set_fmt,
 };
 
@@ -768,8 +755,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	};
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
@@ -797,6 +782,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 		return ret;
 
 	/* V4L2 Subdev */
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret)
+		goto error_media_entity;
 
 	if (csi_dev->isp_available)
 		ret = v4l2_async_register_subdev(subdev);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index b827ab1be011..7754eaaab743 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -42,8 +42,6 @@ struct sun6i_csi_bridge {
 	struct v4l2_subdev		subdev;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pads[2];
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct sun6i_csi_bridge_source	source_parallel;
 	struct sun6i_csi_bridge_source	source_mipi_csi2;
-- 
Regards,

Laurent Pinchart

