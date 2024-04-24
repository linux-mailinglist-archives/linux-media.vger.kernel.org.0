Return-Path: <linux-media+bounces-10101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6DA8B178E
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44DEF1F248E6
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F391B172BDE;
	Wed, 24 Apr 2024 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p1oTKx/r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C830916F293
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003087; cv=none; b=kaVOEaTZweukiqPsN2SbjGnbqnog0bX68OKbYGuPp8g7BqsPjaHIT5DmF7PoPxTXdnUu7V0ZM5ia1SJwiYqfVPCU4tNPEDqemW1E7SJahbqA/VUuQhMietEIw1pyR7XqUNeFc9rUIwuIL8U3WttX1TruEPOq6ftWobfmyJnZfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003087; c=relaxed/simple;
	bh=QJNlDMKALQ1CU0HDTCQ8CjQUpfzEceEjSIq2Z6Bn/LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCemmm3H3BBzlhk7oqY2sOyZ5GNcHobnJrDq/PVgmUbm3fbMxFPgeAeY75enSZYp4oiFmHXfPTKw90X9StMdv98Myx4fq68/1clod4hg1IcKUm+p/bQdpVhrsSa3CzUb04mgKbshGyBcBJsNespTkx/r8trMbUDlEfNWRdzrxg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p1oTKx/r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0961766B;
	Thu, 25 Apr 2024 01:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003026;
	bh=QJNlDMKALQ1CU0HDTCQ8CjQUpfzEceEjSIq2Z6Bn/LA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1oTKx/rBPy8ESgtEZPC7z073lWG9i9AC/uYnHISWMAXZctwOPR2TvyWbTfiGsg8x
	 F9Un2yVgNcJrkpVr7wcMa4w04OKkxKSZlsMVXWFgGnmufIca2LTFPshf76NqPNoAhp
	 xsr0Q9svhrLrkn59fnIEcHVsliCyN+GmvZ6QjtYQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 9/9] media: vimc: scaler: Use subdev active state
Date: Thu, 25 Apr 2024 02:57:41 +0300
Message-ID: <20240424235741.17093-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the active formats and crop rectangle in the subdevice active
state. This simplifies implementation of the format and selection
accessors, and allows using the v4l2_subdev_get_fmt() helper to
implement the .get_fmt() operation.

The active configuration that is used in the .process_frame() handler is
still stored in the vimc_scaler_device structure. The driver could
instead access the active state in the .process_frame() handler, but the
required locking could interfere with the real time constraints of the
frame processing. This data would be stored in registers in the
.s_stream() handler for real hardware, storing it in dedicated storage
thus mimics a real driver. To differentiate them from the rest of the
device private data, move the corresponding fields to a sub-structure of
vimc_scaler_device named hw.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-scaler.c | 124 +++++++-----------
 1 file changed, 49 insertions(+), 75 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index f8639f5b4d0c..47d0d63865a0 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -26,13 +26,20 @@ enum vimc_scaler_pad {
 struct vimc_scaler_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
-	struct v4l2_rect crop_rect;
-	/* Frame format for both sink and src pad */
-	struct v4l2_mbus_framefmt fmt[2];
-	/* Values calculated when the stream starts */
-	u8 *src_frame;
-	unsigned int bpp;
 	struct media_pad pads[2];
+
+	u8 *src_frame;
+
+	/*
+	 * Virtual "hardware" configuration, filled when the stream starts or
+	 * when controls are set.
+	 */
+	struct {
+		struct v4l2_mbus_framefmt sink_fmt;
+		struct v4l2_mbus_framefmt src_fmt;
+		struct v4l2_rect sink_crop;
+		unsigned int bpp;
+	} hw;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -132,39 +139,6 @@ static int vimc_scaler_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static struct v4l2_mbus_framefmt *
-vimc_scaler_pad_format(struct vimc_scaler_device *vscaler,
-		    struct v4l2_subdev_state *sd_state, u32 pad,
-		    enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	else
-		return &vscaler->fmt[pad];
-}
-
-static struct v4l2_rect *
-vimc_scaler_pad_crop(struct vimc_scaler_device *vscaler,
-		  struct v4l2_subdev_state *sd_state,
-		  enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_crop(sd_state, VIMC_SCALER_SINK);
-	else
-		return &vscaler->crop_rect;
-}
-
-static int vimc_scaler_get_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *format)
-{
-	struct vimc_scaler_device *vscaler = v4l2_get_subdevdata(sd);
-
-	format->format = *vimc_scaler_pad_format(vscaler, sd_state, format->pad,
-					      format->which);
-	return 0;
-}
-
 static int vimc_scaler_set_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -176,7 +150,7 @@ static int vimc_scaler_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && vscaler->src_frame)
 		return -EBUSY;
 
-	fmt = vimc_scaler_pad_format(vscaler, sd_state, format->pad, format->which);
+	fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 
 	/*
 	 * The media bus code and colorspace can only be changed on the sink
@@ -214,14 +188,13 @@ static int vimc_scaler_set_fmt(struct v4l2_subdev *sd,
 		struct v4l2_mbus_framefmt *src_fmt;
 		struct v4l2_rect *crop;
 
-		crop = vimc_scaler_pad_crop(vscaler, sd_state, format->which);
+		crop = v4l2_subdev_state_get_crop(sd_state, VIMC_SCALER_SINK);
 		crop->width = fmt->width;
 		crop->height = fmt->height;
 		crop->top = 0;
 		crop->left = 0;
 
-		src_fmt = vimc_scaler_pad_format(vscaler, sd_state, VIMC_SCALER_SRC,
-					      format->which);
+		src_fmt = v4l2_subdev_state_get_format(sd_state, VIMC_SCALER_SRC);
 		*src_fmt = *fmt;
 	}
 
@@ -234,7 +207,6 @@ static int vimc_scaler_get_selection(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
 {
-	struct vimc_scaler_device *vscaler = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *sink_fmt;
 
 	if (VIMC_IS_SRC(sel->pad))
@@ -242,11 +214,10 @@ static int vimc_scaler_get_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vimc_scaler_pad_crop(vscaler, sd_state, sel->which);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, VIMC_SCALER_SINK);
 		break;
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sink_fmt = vimc_scaler_pad_format(vscaler, sd_state, VIMC_SCALER_SINK,
-					       sel->which);
+		sink_fmt = v4l2_subdev_state_get_format(sd_state, VIMC_SCALER_SINK);
 		sel->r = vimc_scaler_get_crop_bound_sink(sink_fmt);
 		break;
 	default:
@@ -282,9 +253,8 @@ static int vimc_scaler_set_selection(struct v4l2_subdev *sd,
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE && vscaler->src_frame)
 		return -EBUSY;
 
-	crop_rect = vimc_scaler_pad_crop(vscaler, sd_state, sel->which);
-	sink_fmt = vimc_scaler_pad_format(vscaler, sd_state, VIMC_SCALER_SINK,
-				       sel->which);
+	crop_rect = v4l2_subdev_state_get_crop(sd_state, VIMC_SCALER_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, VIMC_SCALER_SINK);
 	vimc_scaler_adjust_sink_crop(&sel->r, sink_fmt);
 	*crop_rect = sel->r;
 
@@ -294,7 +264,7 @@ static int vimc_scaler_set_selection(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_pad_ops vimc_scaler_pad_ops = {
 	.enum_mbus_code		= vimc_scaler_enum_mbus_code,
 	.enum_frame_size	= vimc_scaler_enum_frame_size,
-	.get_fmt		= vimc_scaler_get_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= vimc_scaler_set_fmt,
 	.get_selection		= vimc_scaler_get_selection,
 	.set_selection		= vimc_scaler_set_selection,
@@ -305,27 +275,38 @@ static int vimc_scaler_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_scaler_device *vscaler = v4l2_get_subdevdata(sd);
 
 	if (enable) {
-		const struct vimc_pix_map *vpix;
+		struct v4l2_subdev_state *state;
+		const struct v4l2_mbus_framefmt *format;
+		const struct v4l2_rect *rect;
 		unsigned int frame_size;
 
 		if (vscaler->src_frame)
 			return 0;
 
-		/* Save the bytes per pixel of the sink */
-		vpix = vimc_pix_map_by_code(vscaler->fmt[VIMC_SCALER_SINK].code);
-		vscaler->bpp = vpix->bpp;
+		state = v4l2_subdev_lock_and_get_active_state(sd);
 
-		/* Calculate the frame size of the source pad */
-		frame_size = vscaler->fmt[VIMC_SCALER_SRC].width
-			   * vscaler->fmt[VIMC_SCALER_SRC].height * vscaler->bpp;
+		/* Save the bytes per pixel of the sink. */
+		format = v4l2_subdev_state_get_format(state, VIMC_SCALER_SINK);
+		vscaler->hw.sink_fmt = *format;
+		vscaler->hw.bpp = vimc_pix_map_by_code(format->code)->bpp;
 
-		/* Allocate the frame buffer. Use vmalloc to be able to
-		 * allocate a large amount of memory
+		/* Calculate the frame size of the source pad. */
+		format = v4l2_subdev_state_get_format(state, VIMC_SCALER_SRC);
+		vscaler->hw.src_fmt = *format;
+		frame_size = format->width * format->height * vscaler->hw.bpp;
+
+		rect = v4l2_subdev_state_get_crop(state, VIMC_SCALER_SINK);
+		vscaler->hw.sink_crop = *rect;
+
+		v4l2_subdev_unlock_state(state);
+
+		/*
+		 * Allocate the frame buffer. Use vmalloc to be able to allocate
+		 * a large amount of memory.
 		 */
 		vscaler->src_frame = vmalloc(frame_size);
 		if (!vscaler->src_frame)
 			return -ENOMEM;
-
 	} else {
 		if (!vscaler->src_frame)
 			return 0;
@@ -353,9 +334,9 @@ static const struct v4l2_subdev_internal_ops vimc_scaler_internal_ops = {
 static void vimc_scaler_fill_src_frame(const struct vimc_scaler_device *const vscaler,
 				    const u8 *const sink_frame)
 {
-	const struct v4l2_mbus_framefmt *src_fmt = &vscaler->fmt[VIMC_SCALER_SRC];
-	const struct v4l2_rect *r = &vscaler->crop_rect;
-	unsigned int snk_width = vscaler->fmt[VIMC_SCALER_SINK].width;
+	const struct v4l2_mbus_framefmt *sink_fmt = &vscaler->hw.sink_fmt;
+	const struct v4l2_mbus_framefmt *src_fmt = &vscaler->hw.src_fmt;
+	const struct v4l2_rect *r = &vscaler->hw.sink_crop;
 	unsigned int src_x, src_y;
 	u8 *walker = vscaler->src_frame;
 
@@ -364,16 +345,16 @@ static void vimc_scaler_fill_src_frame(const struct vimc_scaler_device *const vs
 		unsigned int snk_y, y_offset;
 
 		snk_y = (src_y * r->height) / src_fmt->height + r->top;
-		y_offset = snk_y * snk_width * vscaler->bpp;
+		y_offset = snk_y * sink_fmt->width * vscaler->hw.bpp;
 
 		for (src_x = 0; src_x < src_fmt->width; src_x++) {
 			unsigned int snk_x, x_offset, index;
 
 			snk_x = (src_x * r->width) / src_fmt->width + r->left;
-			x_offset = snk_x * vscaler->bpp;
+			x_offset = snk_x * vscaler->hw.bpp;
 			index = y_offset + x_offset;
-			memcpy(walker, &sink_frame[index], vscaler->bpp);
-			walker += vscaler->bpp;
+			memcpy(walker, &sink_frame[index], vscaler->hw.bpp);
+			walker += vscaler->hw.bpp;
 		}
 	}
 }
@@ -432,13 +413,6 @@ static struct vimc_ent_device *vimc_scaler_add(struct vimc_device *vimc,
 	vscaler->ved.process_frame = vimc_scaler_process_frame;
 	vscaler->ved.dev = vimc->mdev.dev;
 
-	/* Initialize the frame format */
-	vscaler->fmt[VIMC_SCALER_SINK] = fmt_default;
-	vscaler->fmt[VIMC_SCALER_SRC] = fmt_default;
-
-	/* Initialize the crop selection */
-	vscaler->crop_rect = crop_rect_default;
-
 	return &vscaler->ved;
 }
 
-- 
Regards,

Laurent Pinchart


