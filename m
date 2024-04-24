Return-Path: <linux-media+bounces-10100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D748C8B178D
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 629F51F2414B
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBC0172BBA;
	Wed, 24 Apr 2024 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jgkz3XB8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B09616F27E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003087; cv=none; b=n7N/DermzQV/cwEz5Rja2ZTjSTYi00DwFG3r54b6rjqUS5e17ws3gD1F8Oe8cMU9+YosiDE8avMKq7pRvw8XuiiT2B1LSubbnCP1eydjq9tv+AwVXHnm9GAMonYRpsNvdIIWO5TxLCtahBa57TXiU45VwiWAXvUpiUaI0789qS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003087; c=relaxed/simple;
	bh=YSjAVWq2tfombaiWeN59SpZtEScOfDfKY1r37a+Ogl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhE2A7Ez7qTvnvM/FQNnACFO6aj97zWeccSKgKJow8AwQY8baerbVdtJhdJy2C0MS0zTvNVvZHcPjYsPZWcRKz06LY9Eog1JVSn7VhLdWl+yn7wA/1Wi0MW9XTmE2Dk/qYKGlv0ThwEdKx/pWrneeJ1v6+ICVFJ8q8lJeaLqzNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jgkz3XB8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3410882A;
	Thu, 25 Apr 2024 01:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003025;
	bh=YSjAVWq2tfombaiWeN59SpZtEScOfDfKY1r37a+Ogl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgkz3XB8Di6rnKH7MTyIFN3fWwTcF/9zDccNUtZSrekieIPGGyQMYB7JElckiFtle
	 jCqi0gSfDoIr8YL5lnFypqYJPfa1I+Oo9YT1ON7HYJ03IX91hwim7uOM6Vgqt60GTs
	 CHSLQgkk2ly4XOxyweKigoXuXaZpwFToduSYQNKc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 8/9] media: vimc: debayer: Use subdev active state
Date: Thu, 25 Apr 2024 02:57:40 +0300
Message-ID: <20240424235741.17093-9-laurent.pinchart@ideasonboard.com>
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
still stored in the vimc_debayer_device structure. The driver could
instead access the active state in the .process_frame() handler, but the
required locking could interfere with the real time constraints of the
frame processing. This data would be stored in registers in the
.s_stream() handler for real hardware, storing it in dedicated storage
thus mimics a real driver. To differentiate them from the rest of the
device private data, move the corresponding fields to a sub-structure of
vimc_debayer_device named hw.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/test-drivers/vimc/vimc-debayer.c    | 182 ++++++++----------
 1 file changed, 83 insertions(+), 99 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index 9f8a31fb0695..bbb7c7a86df0 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -15,6 +15,9 @@
 
 #include "vimc-common.h"
 
+/* TODO: Add support for more output formats, we only support RGB888 for now. */
+#define VIMC_DEBAYER_SOURCE_MBUS_FMT	MEDIA_BUS_FMT_RGB888_1X24
+
 enum vimc_debayer_rgb_colors {
 	VIMC_DEBAYER_RED = 0,
 	VIMC_DEBAYER_GREEN = 1,
@@ -29,19 +32,26 @@ struct vimc_debayer_pix_map {
 struct vimc_debayer_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
-	/* The active format */
-	struct v4l2_mbus_framefmt sink_fmt;
-	u32 src_code;
+	struct v4l2_ctrl_handler hdl;
+	struct media_pad pads[2];
+
+	u8 *src_frame;
+
 	void (*set_rgb_src)(struct vimc_debayer_device *vdebayer,
 			    unsigned int lin, unsigned int col,
 			    unsigned int rgb[3]);
-	/* Values calculated when the stream starts */
-	u8 *src_frame;
-	const struct vimc_debayer_pix_map *sink_pix_map;
-	unsigned int sink_bpp;
-	unsigned int mean_win_size;
-	struct v4l2_ctrl_handler hdl;
-	struct media_pad pads[2];
+
+	/*
+	 * Virtual "hardware" configuration, filled when the stream starts or
+	 * when controls are set.
+	 */
+	struct {
+		const struct vimc_debayer_pix_map *sink_pix_map;
+		unsigned int sink_bpp;
+		struct v4l2_area size;
+		unsigned int mean_win_size;
+		u32 src_code;
+	} hw;
 };
 
 static const struct v4l2_mbus_framefmt sink_fmt_default = {
@@ -153,7 +163,6 @@ static bool vimc_debayer_src_code_is_valid(u32 code)
 static int vimc_debayer_init_state(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state)
 {
-	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 
 	mf = v4l2_subdev_state_get_format(sd_state, 0);
@@ -161,7 +170,7 @@ static int vimc_debayer_init_state(struct v4l2_subdev *sd,
 
 	mf = v4l2_subdev_state_get_format(sd_state, 1);
 	*mf = sink_fmt_default;
-	mf->code = vdebayer->src_code;
+	mf->code = VIMC_DEBAYER_SOURCE_MBUS_FMT;
 
 	return 0;
 }
@@ -210,24 +219,6 @@ static int vimc_debayer_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int vimc_debayer_get_fmt(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
-				struct v4l2_subdev_format *fmt)
-{
-	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
-
-	/* Get the current sink format */
-	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
-		      *v4l2_subdev_state_get_format(sd_state, 0) :
-		      vdebayer->sink_fmt;
-
-	/* Set the right code for the source pad */
-	if (VIMC_IS_SRC(fmt->pad))
-		fmt->format.code = vdebayer->src_code;
-
-	return 0;
-}
-
 static void vimc_debayer_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 {
 	const struct vimc_debayer_pix_map *vpix;
@@ -253,52 +244,42 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 				struct v4l2_subdev_format *fmt)
 {
 	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *sink_fmt;
-	u32 *src_code;
+	struct v4l2_mbus_framefmt *format;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		/* Do not change the format while stream is on */
-		if (vdebayer->src_frame)
-			return -EBUSY;
-
-		sink_fmt = &vdebayer->sink_fmt;
-		src_code = &vdebayer->src_code;
-	} else {
-		sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
-		src_code = &v4l2_subdev_state_get_format(sd_state, 1)->code;
-	}
+	/* Do not change the format while stream is on. */
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && vdebayer->src_frame)
+		return -EBUSY;
 
 	/*
-	 * Do not change the format of the source pad,
-	 * it is propagated from the sink
+	 * Do not change the format of the source pad, it is propagated from
+	 * the sink.
 	 */
-	if (VIMC_IS_SRC(fmt->pad)) {
-		u32 code = fmt->format.code;
+	if (VIMC_IS_SRC(fmt->pad))
+		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
 
-		fmt->format = *sink_fmt;
+	/* Set the new format in the sink pad. */
+	vimc_debayer_adjust_sink_fmt(&fmt->format);
 
-		if (vimc_debayer_src_code_is_valid(code))
-			*src_code = code;
+	format = v4l2_subdev_state_get_format(sd_state, 0);
 
-		fmt->format.code = *src_code;
-	} else {
-		/* Set the new format in the sink pad */
-		vimc_debayer_adjust_sink_fmt(&fmt->format);
+	dev_dbg(vdebayer->ved.dev, "%s: sink format update: "
+		"old:%dx%d (0x%x, %d, %d, %d, %d) "
+		"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vdebayer->sd.name,
+		/* old */
+		format->width, format->height, format->code,
+		format->colorspace, format->quantization,
+		format->xfer_func, format->ycbcr_enc,
+		/* new */
+		fmt->format.width, fmt->format.height, fmt->format.code,
+		fmt->format.colorspace,	fmt->format.quantization,
+		fmt->format.xfer_func, fmt->format.ycbcr_enc);
 
-		dev_dbg(vdebayer->ved.dev, "%s: sink format update: "
-			"old:%dx%d (0x%x, %d, %d, %d, %d) "
-			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vdebayer->sd.name,
-			/* old */
-			sink_fmt->width, sink_fmt->height, sink_fmt->code,
-			sink_fmt->colorspace, sink_fmt->quantization,
-			sink_fmt->xfer_func, sink_fmt->ycbcr_enc,
-			/* new */
-			fmt->format.width, fmt->format.height, fmt->format.code,
-			fmt->format.colorspace,	fmt->format.quantization,
-			fmt->format.xfer_func, fmt->format.ycbcr_enc);
+	*format = fmt->format;
 
-		*sink_fmt = fmt->format;
-	}
+	/* Propagate the format to the source pad. */
+	format = v4l2_subdev_state_get_format(sd_state, 1);
+	*format = fmt->format;
+	format->code = VIMC_DEBAYER_SOURCE_MBUS_FMT;
 
 	return 0;
 }
@@ -306,7 +287,7 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_pad_ops vimc_debayer_pad_ops = {
 	.enum_mbus_code		= vimc_debayer_enum_mbus_code,
 	.enum_frame_size	= vimc_debayer_enum_frame_size,
-	.get_fmt		= vimc_debayer_get_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= vimc_debayer_set_fmt,
 };
 
@@ -318,8 +299,8 @@ static void vimc_debayer_process_rgb_frame(struct vimc_debayer_device *vdebayer,
 	const struct vimc_pix_map *vpix;
 	unsigned int i, index;
 
-	vpix = vimc_pix_map_by_code(vdebayer->src_code);
-	index = VIMC_FRAME_INDEX(lin, col, vdebayer->sink_fmt.width, 3);
+	vpix = vimc_pix_map_by_code(vdebayer->hw.src_code);
+	index = VIMC_FRAME_INDEX(lin, col, vdebayer->hw.size.width, 3);
 	for (i = 0; i < 3; i++) {
 		switch (vpix->pixelformat) {
 		case V4L2_PIX_FMT_RGB24:
@@ -337,24 +318,37 @@ static int vimc_debayer_s_stream(struct v4l2_subdev *sd, int enable)
 	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
 
 	if (enable) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+		const struct v4l2_mbus_framefmt *src_fmt;
+		struct v4l2_subdev_state *state;
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
 		if (vdebayer->src_frame)
 			return 0;
 
+		state = v4l2_subdev_lock_and_get_active_state(sd);
+		sink_fmt = v4l2_subdev_state_get_format(state, 0);
+		src_fmt = v4l2_subdev_state_get_format(state, 1);
+
 		/* Calculate the frame size of the source pad */
-		vpix = vimc_pix_map_by_code(vdebayer->src_code);
-		frame_size = vdebayer->sink_fmt.width * vdebayer->sink_fmt.height *
-				vpix->bpp;
+		vpix = vimc_pix_map_by_code(src_fmt->code);
+		frame_size = src_fmt->width * src_fmt->height * vpix->bpp;
 
 		/* Save the bytes per pixel of the sink */
-		vpix = vimc_pix_map_by_code(vdebayer->sink_fmt.code);
-		vdebayer->sink_bpp = vpix->bpp;
+		vpix = vimc_pix_map_by_code(sink_fmt->code);
+		vdebayer->hw.sink_bpp = vpix->bpp;
 
 		/* Get the corresponding pixel map from the table */
-		vdebayer->sink_pix_map =
-			vimc_debayer_pix_map_by_code(vdebayer->sink_fmt.code);
+		vdebayer->hw.sink_pix_map =
+			vimc_debayer_pix_map_by_code(sink_fmt->code);
+
+		vdebayer->hw.size.width = sink_fmt->width;
+		vdebayer->hw.size.height = sink_fmt->height;
+
+		vdebayer->hw.src_code = src_fmt->code;
+
+		v4l2_subdev_unlock_state(state);
 
 		/*
 		 * Allocate the frame buffer. Use vmalloc to be able to
@@ -363,7 +357,6 @@ static int vimc_debayer_s_stream(struct v4l2_subdev *sd, int enable)
 		vdebayer->src_frame = vmalloc(frame_size);
 		if (!vdebayer->src_frame)
 			return -ENOMEM;
-
 	} else {
 		if (!vdebayer->src_frame)
 			return 0;
@@ -424,13 +417,13 @@ static void vimc_debayer_calc_rgb_sink(struct vimc_debayer_device *vdebayer,
 	 * the top left corner of the mean window (considering the current
 	 * pixel as the center)
 	 */
-	seek = vdebayer->mean_win_size / 2;
+	seek = vdebayer->hw.mean_win_size / 2;
 
 	/* Sum the values of the colors in the mean window */
 
 	dev_dbg(vdebayer->ved.dev,
 		"deb: %s: --- Calc pixel %dx%d, window mean %d, seek %d ---\n",
-		vdebayer->sd.name, lin, col, vdebayer->sink_fmt.height, seek);
+		vdebayer->sd.name, lin, col, vdebayer->hw.size.height, seek);
 
 	/*
 	 * Iterate through all the lines in the mean window, start
@@ -439,7 +432,7 @@ static void vimc_debayer_calc_rgb_sink(struct vimc_debayer_device *vdebayer,
 	 * frame
 	 */
 	for (wlin = seek > lin ? 0 : lin - seek;
-	     wlin < lin + seek + 1 && wlin < vdebayer->sink_fmt.height;
+	     wlin < lin + seek + 1 && wlin < vdebayer->hw.size.height;
 	     wlin++) {
 
 		/*
@@ -449,17 +442,17 @@ static void vimc_debayer_calc_rgb_sink(struct vimc_debayer_device *vdebayer,
 		 * frame
 		 */
 		for (wcol = seek > col ? 0 : col - seek;
-		     wcol < col + seek + 1 && wcol < vdebayer->sink_fmt.width;
+		     wcol < col + seek + 1 && wcol < vdebayer->hw.size.width;
 		     wcol++) {
 			enum vimc_debayer_rgb_colors color;
 			unsigned int index;
 
 			/* Check which color this pixel is */
-			color = vdebayer->sink_pix_map->order[wlin % 2][wcol % 2];
+			color = vdebayer->hw.sink_pix_map->order[wlin % 2][wcol % 2];
 
 			index = VIMC_FRAME_INDEX(wlin, wcol,
-						 vdebayer->sink_fmt.width,
-						 vdebayer->sink_bpp);
+						 vdebayer->hw.size.width,
+						 vdebayer->hw.sink_bpp);
 
 			dev_dbg(vdebayer->ved.dev,
 				"deb: %s: RGB CALC: frame index %d, win pos %dx%d, color %d\n",
@@ -468,7 +461,7 @@ static void vimc_debayer_calc_rgb_sink(struct vimc_debayer_device *vdebayer,
 			/* Get its value */
 			rgb[color] = rgb[color] +
 				vimc_debayer_get_val(&frame[index],
-						     vdebayer->sink_bpp);
+						     vdebayer->hw.sink_bpp);
 
 			/* Save how many values we already added */
 			n_rgb[color]++;
@@ -506,8 +499,8 @@ static void *vimc_debayer_process_frame(struct vimc_ent_device *ved,
 	if (!vdebayer->src_frame)
 		return ERR_PTR(-EINVAL);
 
-	for (i = 0; i < vdebayer->sink_fmt.height; i++)
-		for (j = 0; j < vdebayer->sink_fmt.width; j++) {
+	for (i = 0; i < vdebayer->hw.size.height; i++)
+		for (j = 0; j < vdebayer->hw.size.width; j++) {
 			vimc_debayer_calc_rgb_sink(vdebayer, sink_frame, i, j, rgb);
 			vdebayer->set_rgb_src(vdebayer, i, j, rgb);
 		}
@@ -522,7 +515,7 @@ static int vimc_debayer_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case VIMC_CID_MEAN_WIN_SIZE:
-		vdebayer->mean_win_size = ctrl->val;
+		vdebayer->hw.mean_win_size = ctrl->val;
 		break;
 	default:
 		return -EINVAL;
@@ -599,17 +592,8 @@ static struct vimc_ent_device *vimc_debayer_add(struct vimc_device *vimc,
 
 	vdebayer->ved.process_frame = vimc_debayer_process_frame;
 	vdebayer->ved.dev = vimc->mdev.dev;
-	vdebayer->mean_win_size = vimc_debayer_ctrl_mean_win_size.def;
+	vdebayer->hw.mean_win_size = vimc_debayer_ctrl_mean_win_size.def;
 
-	/* Initialize the frame format */
-	vdebayer->sink_fmt = sink_fmt_default;
-	/*
-	 * TODO: Add support for more output formats, we only support
-	 * RGB888 for now
-	 * NOTE: the src format is always the same as the sink, except
-	 * for the code
-	 */
-	vdebayer->src_code = MEDIA_BUS_FMT_RGB888_1X24;
 	vdebayer->set_rgb_src = vimc_debayer_process_rgb_frame;
 
 	return &vdebayer->ved;
-- 
Regards,

Laurent Pinchart


