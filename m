Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050273E3DEF
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 04:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhHICc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Aug 2021 22:32:29 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]:36445 "EHLO
        mail-qk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhHICc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Aug 2021 22:32:29 -0400
Received: by mail-qk1-f173.google.com with SMTP id e14so16871265qkg.3;
        Sun, 08 Aug 2021 19:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4NJXt2ccFrqnk1xf0oJNgjrhaFSh7qplG/LTxGDa8Z8=;
        b=F7ITasREK8Tvn1jeR9Z42+uYq+7wJ/fBuQCoF9KP2YrF8osHZUAl55V8rE0FYhT84r
         /HFz+4X/7PcYOXAWfQh02/URRSsUQB7QlEsYtEvHeF2X1K4Pbxv+rmk1eHz33yfN1hv7
         M4PeNDxHt2cN2ALDpzyNQ5qqhroBth3+LIr5OahRYrautfPlZqqeatMOrnvsRvIp+Nac
         uELKx9gWoA08w0C/ayZy2S8DlWhgDCjqgRJouxNCjDKthI0mkTuQmIScwOh9crk3w8oV
         ca87L0V+HR36z4JnvyxxEz2bNm/w7U6UjR8iUX0sVlcMEYHW2ALWG8GSUBiR8D3KKsi4
         x86A==
X-Gm-Message-State: AOAM532e/GHS+Cx0McPa/Bo4Em2nJ/1WM1nv+Z+IEzIwLddlOJMd1kZ/
        Wh2oh9Ik9hzjXg5jR5BDcHQ=
X-Google-Smtp-Source: ABdhPJz20rkB2fo6ofVCU06XUB/U2Bks+JPxekl1fIiktMsak+ZOtpaj8XQOH4J4XwnWlUB4nA/Eww==
X-Received: by 2002:a05:620a:8de:: with SMTP id z30mr4204746qkz.132.1628476327757;
        Sun, 08 Aug 2021 19:32:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:e7cc:552:e0d7:ddf1:a4ab:2bc8])
        by smtp.gmail.com with ESMTPSA id b3sm6181044qto.49.2021.08.08.19.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 19:32:06 -0700 (PDT)
From:   Pedro Terra <pedro@terraco.de>
To:     pedro@terraco.de, helen.koike@collabora.com,
        hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, gabrielabittencourt00@gmail.com,
        gfmandaji@gmail.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH] [PATCH v5] media: vimc: Enable set resolution at the scaler src pad
Date:   Sun,  8 Aug 2021 23:32:02 -0300
Message-Id: <20210809023202.68763-1-pedro@terraco.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modify the scaler subdevice to accept setting the resolution of the source
pad (previously the source resolution would always be 3 times the sink for
both dimensions). Now any resolution can be set at src (even smaller ones)
and the sink video will be scaled to match it.

Test example: With the vimc module up (using the default vimc topology)
media-ctl -d /dev/media0 -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
media-ctl -d /dev/media0 -V '"Scaler":0[crop:(100,50)/400x150]'
media-ctl -d /dev/media0 -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
v4l2-ctl -d /dev/video2 -v width=300,height=700
v4l2-ctl -d /dev/video0 -v pixelformat=BA81
v4l2-ctl --stream-mmap --stream-count=10 -d /dev/video2 \
	--stream-to=test.raw

The result will be a cropped stream that can be checked with the command
ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
	-video_size "300x700" test.raw

Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>

---

Changes in V5:
* Fixed code aliment mistake
* Renamed some variables to make the code more readable
* Propagate sink pad formatting to src resetting the 1:1 scaling ratio.
	(the crop is also reset when this is done).

Changes in V4:
* Rebased with media/master
* Scaling is now compatible with crop
* Updated test example at the commit message
* Add vimc prefix to the pad enumeration

Changes in V3:
* Corrections suggested by Hans:
	- Default scaling factor is now 1 (we removed the define and
	  set the source format equals the sink).
	- Removed SCA_COUNT (enum that represents the number of pads)
	  as there always 2
	- Swapped the per byte pixel copy to memcpy.
* Corrections suggested by Dafna:
	- Removed from the documentation the old scaler parameter which
	  isn't necessary anymore.
* Added a thank you note at the end of the email

Changes in V2:
* Patch was not sent to media list mail for some reason (even though it
was on the Cc list), trying again.
* Updating documentation.

Running
/usr/local/bin/v4l2-compliance -m /dev/media0
Gave the following result:
v4l2-compliance SHA: c86aab9cc7f1 2021-07-28 11:52:45
Grand Total for vimc device /dev/media0: 473, Succeeded: 473, Failed: 0, Warnings: 0
---
 Documentation/admin-guide/media/vimc.rst      |  18 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c | 287 +++++++-----------
 2 files changed, 115 insertions(+), 190 deletions(-)

diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
index 211cc8972410..b6a123e22544 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -65,6 +65,11 @@ vimc-scaler:
         1920x1440 image. (this value can be configured, see at
         `Module options`_).
 	Exposes:
+	Re-size the image to meet the source pad resolution. E.g.: if the sync pad
+is configured to 360x480 and the source to 1280x720, the image will be stretched
+to fit the source resolution. Works for any resolution within the vimc
+limitations (even shrinking the image if necessary).
+Exposes:
 
 	* 1 Pad sink
 	* 1 Pad source
@@ -75,16 +80,3 @@ vimc-capture:
 
 	* 1 Pad sink
 	* 1 Pad source
-
-
-Module options
---------------
-
-Vimc has a module parameter to configure the driver.
-
-* ``sca_mult=<unsigned int>``
-
-        Image size multiplier factor to be used to multiply both width and
-        height, so the image size will be ``sca_mult^2`` bigger than the
-        original one. Currently, only supports scaling up (the default value
-        is 3).
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 06880dd0b6ac..745316a50459 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/moduleparam.h>
+#include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
 #include <media/v4l2-rect.h>
@@ -13,11 +14,11 @@
 
 #include "vimc-common.h"
 
-static unsigned int sca_mult = 3;
-module_param(sca_mult, uint, 0000);
-MODULE_PARM_DESC(sca_mult, " the image size multiplier");
-
-#define MAX_ZOOM	8
+/* Pad identifier */
+enum vic_sca_pad {
+	VIMC_SCA_SINK = 0,
+	VIMC_SCA_SRC = 1,
+};
 
 #define VIMC_SCA_FMT_WIDTH_DEFAULT  640
 #define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
@@ -25,14 +26,11 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
-	/* NOTE: the source fmt is the same as the sink
-	 * with the width and hight multiplied by mult
-	 */
-	struct v4l2_mbus_framefmt sink_fmt;
 	struct v4l2_rect crop_rect;
+	/* Frame format for both sink and src pad */
+	struct v4l2_mbus_framefmt fmt[2];
 	/* Values calculated when the stream starts */
 	u8 *src_frame;
-	unsigned int src_line_size;
 	unsigned int bpp;
 	struct media_pad pads[2];
 };
@@ -72,17 +70,6 @@ vimc_sca_get_crop_bound_sink(const struct v4l2_mbus_framefmt *sink_fmt)
 	return r;
 }
 
-static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
-				      const struct v4l2_mbus_framefmt *sink_fmt)
-{
-	const struct v4l2_rect sink_rect =
-		vimc_sca_get_crop_bound_sink(sink_fmt);
-
-	/* Disallow rectangles smaller than the minimal one. */
-	v4l2_rect_set_min_size(r, &crop_rect_min);
-	v4l2_rect_map_inside(r, &sink_rect);
-}
-
 static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
@@ -90,17 +77,15 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_rect *r;
 	unsigned int i;
 
-	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+	mf = v4l2_subdev_get_try_format(sd, sd_state, VIMC_SCA_SINK);
 	*mf = sink_fmt_default;
 
-	r = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+	r = v4l2_subdev_get_try_crop(sd, sd_state, VIMC_SCA_SINK);
 	*r = crop_rect_default;
 
 	for (i = 1; i < sd->entity.num_pads; i++) {
 		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
 		*mf = sink_fmt_default;
-		mf->width = mf->width * sca_mult;
-		mf->height = mf->height * sca_mult;
 	}
 
 	return 0;
@@ -144,13 +129,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
 	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
 
-	if (VIMC_IS_SINK(fse->pad)) {
-		fse->max_width = VIMC_FRAME_MAX_WIDTH;
-		fse->max_height = VIMC_FRAME_MAX_HEIGHT;
-	} else {
-		fse->max_width = VIMC_FRAME_MAX_WIDTH * MAX_ZOOM;
-		fse->max_height = VIMC_FRAME_MAX_HEIGHT * MAX_ZOOM;
-	}
+	fse->max_width = VIMC_FRAME_MAX_WIDTH;
+	fse->max_height = VIMC_FRAME_MAX_HEIGHT;
 
 	return 0;
 }
@@ -160,94 +140,82 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_format *format)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
-	struct v4l2_rect *crop_rect;
-
-	/* Get the current sink format */
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
-	} else {
-		format->format = vsca->sink_fmt;
-		crop_rect = &vsca->crop_rect;
-	}
 
-	/* Scale the frame size for the source pad */
-	if (VIMC_IS_SRC(format->pad)) {
-		format->format.width = crop_rect->width * sca_mult;
-		format->format.height = crop_rect->height * sca_mult;
-	}
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							     format->pad);
+	else
+		format->format = vsca->fmt[format->pad];
 
 	return 0;
 }
 
-static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
+static void vimc_sca_adjust_fmt(struct v4l2_mbus_framefmt *fmt[], __u32 pad)
 {
-	const struct vimc_pix_map *vpix;
+	unsigned int src_width, src_height;
 
-	/* Only accept code in the pix map table in non bayer format */
-	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
-		fmt->code = sink_fmt_default.code;
+	if (pad == VIMC_SCA_SINK) {
+		const struct vimc_pix_map *vpix;
 
-	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
-			     VIMC_FRAME_MAX_WIDTH) & ~1;
-	fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
-			      VIMC_FRAME_MAX_HEIGHT) & ~1;
+		/* Only accept code in the pix map table in non bayer format */
+		vpix = vimc_pix_map_by_code(fmt[VIMC_SCA_SINK]->code);
+		if (!vpix || vpix->bayer)
+			fmt[VIMC_SCA_SINK]->code = sink_fmt_default.code;
+		if (fmt[VIMC_SCA_SINK]->field == V4L2_FIELD_ANY)
+			fmt[VIMC_SCA_SINK]->field = sink_fmt_default.field;
+
+		vimc_colorimetry_clamp(fmt[VIMC_SCA_SINK]);
+	}
 
-	if (fmt->field == V4L2_FIELD_ANY)
-		fmt->field = sink_fmt_default.field;
+	fmt[pad]->width = clamp_t(u32, fmt[pad]->width, VIMC_FRAME_MIN_WIDTH,
+				  VIMC_FRAME_MAX_WIDTH) & ~1;
+	fmt[pad]->height = clamp_t(u32, fmt[pad]->height, VIMC_FRAME_MIN_HEIGHT,
+				   VIMC_FRAME_MAX_HEIGHT) & ~1;
 
-	vimc_colorimetry_clamp(fmt);
+	/* Resets the src pad to match the sink, then restore dimensions if
+	 * the pad formatted was the src one
+	 */
+	src_width = fmt[pad]->width;
+	src_height = fmt[pad]->height;
+	*fmt[VIMC_SCA_SRC] = *fmt[VIMC_SCA_SINK];
+	fmt[VIMC_SCA_SRC]->width = src_width;
+	fmt[VIMC_SCA_SRC]->height = src_height;
 }
 
 static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *fmt)
+			    struct v4l2_subdev_format *format)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *fmt[2];
 	struct v4l2_rect *crop_rect;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
 		if (vsca->src_frame)
 			return -EBUSY;
 
-		sink_fmt = &vsca->sink_fmt;
+		fmt[VIMC_SCA_SINK] = &vsca->fmt[VIMC_SCA_SINK];
+		fmt[VIMC_SCA_SRC] = &vsca->fmt[VIMC_SCA_SRC];
 		crop_rect = &vsca->crop_rect;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+		fmt[VIMC_SCA_SINK] = v4l2_subdev_get_try_format(sd, sd_state,
+								VIMC_SCA_SINK);
+		fmt[VIMC_SCA_SRC] = v4l2_subdev_get_try_format(sd, sd_state,
+							       VIMC_SCA_SRC);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, VIMC_SCA_SINK);
 	}
 
-	/*
-	 * Do not change the format of the source pad,
-	 * it is propagated from the sink
-	 */
-	if (VIMC_IS_SRC(fmt->pad)) {
-		fmt->format = *sink_fmt;
-		fmt->format.width = crop_rect->width * sca_mult;
-		fmt->format.height = crop_rect->height * sca_mult;
-	} else {
-		/* Set the new format in the sink pad */
-		vimc_sca_adjust_sink_fmt(&fmt->format);
-
-		dev_dbg(vsca->ved.dev, "%s: sink format update: "
-			"old:%dx%d (0x%x, %d, %d, %d, %d) "
-			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsca->sd.name,
-			/* old */
-			sink_fmt->width, sink_fmt->height, sink_fmt->code,
-			sink_fmt->colorspace, sink_fmt->quantization,
-			sink_fmt->xfer_func, sink_fmt->ycbcr_enc,
-			/* new */
-			fmt->format.width, fmt->format.height, fmt->format.code,
-			fmt->format.colorspace,	fmt->format.quantization,
-			fmt->format.xfer_func, fmt->format.ycbcr_enc);
-
-		*sink_fmt = fmt->format;
+	*fmt[format->pad] = format->format;
+	vimc_sca_adjust_fmt(fmt, format->pad);
+	format->format = *fmt[format->pad];
 
-		/* Do the crop, but respect the current bounds */
-		vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
+	if (format->pad == VIMC_SCA_SINK) {
+		/* Reset the crop to match the sink pad */
+		crop_rect->width = fmt[VIMC_SCA_SINK]->width;
+		crop_rect->height = fmt[VIMC_SCA_SINK]->height;
+		crop_rect->top = 0;
+		crop_rect->left = 0;
 	}
 
 	return 0;
@@ -265,11 +233,13 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sink_fmt = &vsca->sink_fmt;
+		sink_fmt = &vsca->fmt[VIMC_SCA_SINK];
 		crop_rect = &vsca->crop_rect;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+						      VIMC_SCA_SINK);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state,
+						     VIMC_SCA_SINK);
 	}
 
 	switch (sel->target) {
@@ -286,6 +256,17 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
+				      const struct v4l2_mbus_framefmt *sink_fmt)
+{
+	const struct v4l2_rect sink_rect =
+		vimc_sca_get_crop_bound_sink(sink_fmt);
+
+	/* Disallow rectangles smaller than the minimal one. */
+	v4l2_rect_set_min_size(r, &crop_rect_min);
+	v4l2_rect_map_inside(r, &sink_rect);
+}
+
 static int vimc_sca_set_selection(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
@@ -303,10 +284,12 @@ static int vimc_sca_set_selection(struct v4l2_subdev *sd,
 			return -EBUSY;
 
 		crop_rect = &vsca->crop_rect;
-		sink_fmt = &vsca->sink_fmt;
+		sink_fmt = &vsca->fmt[VIMC_SCA_SINK];
 	} else {
-		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
-		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state,
+						     VIMC_SCA_SINK);
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+						      VIMC_SCA_SINK);
 	}
 
 	switch (sel->target) {
@@ -344,16 +327,12 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 			return 0;
 
 		/* Save the bytes per pixel of the sink */
-		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
+		vpix = vimc_pix_map_by_code(vsca->fmt[VIMC_SCA_SINK].code);
 		vsca->bpp = vpix->bpp;
 
-		/* Calculate the width in bytes of the src frame */
-		vsca->src_line_size = vsca->crop_rect.width *
-				      sca_mult * vsca->bpp;
-
 		/* Calculate the frame size of the source pad */
-		frame_size = vsca->src_line_size * vsca->crop_rect.height *
-			     sca_mult;
+		frame_size = vsca->fmt[VIMC_SCA_SRC].width
+			     * vsca->fmt[VIMC_SCA_SRC].height * vsca->bpp;
 
 		/* Allocate the frame buffer. Use vmalloc to be able to
 		 * allocate a large amount of memory
@@ -382,77 +361,30 @@ static const struct v4l2_subdev_ops vimc_sca_ops = {
 	.video = &vimc_sca_video_ops,
 };
 
-static void vimc_sca_fill_pix(u8 *const ptr,
-			      const u8 *const pixel,
-			      const unsigned int bpp)
-{
-	unsigned int i;
-
-	/* copy the pixel to the pointer */
-	for (i = 0; i < bpp; i++)
-		ptr[i] = pixel[i];
-}
-
-static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
-			       unsigned int lin, unsigned int col,
-			       const u8 *const sink_frame)
-{
-	const struct v4l2_rect crop_rect = vsca->crop_rect;
-	unsigned int i, j, index;
-	const u8 *pixel;
-
-	/* Point to the pixel value in position (lin, col) in the sink frame */
-	index = VIMC_FRAME_INDEX(lin, col,
-				 vsca->sink_fmt.width,
-				 vsca->bpp);
-	pixel = &sink_frame[index];
-
-	dev_dbg(vsca->ved.dev,
-		"sca: %s: --- scale_pix sink pos %dx%d, index %d ---\n",
-		vsca->sd.name, lin, col, index);
-
-	/* point to the place we are going to put the first pixel
-	 * in the scaled src frame
-	 */
-	lin -= crop_rect.top;
-	col -= crop_rect.left;
-	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
-				 crop_rect.width * sca_mult, vsca->bpp);
-
-	dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
-		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
-
-	/* Repeat this pixel mult times */
-	for (i = 0; i < sca_mult; i++) {
-		/* Iterate through each beginning of a
-		 * pixel repetition in a line
-		 */
-		for (j = 0; j < sca_mult * vsca->bpp; j += vsca->bpp) {
-			dev_dbg(vsca->ved.dev,
-				"sca: %s: sca: scale_pix src pos %d\n",
-				vsca->sd.name, index + j);
-
-			/* copy the pixel to the position index + j */
-			vimc_sca_fill_pix(&vsca->src_frame[index + j],
-					  pixel, vsca->bpp);
-		}
-
-		/* move the index to the next line */
-		index += vsca->src_line_size;
-	}
-}
-
 static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
 				    const u8 *const sink_frame)
 {
-	const struct v4l2_rect r = vsca->crop_rect;
-	unsigned int i, j;
-
-	/* Scale each pixel from the original sink frame */
-	/* TODO: implement scale down, only scale up is supported for now */
-	for (i = r.top; i < r.top + r.height; i++)
-		for (j = r.left; j < r.left + r.width; j++)
-			vimc_sca_scale_pix(vsca, i, j, sink_frame);
+	const struct v4l2_mbus_framefmt *src_fmt = &vsca->fmt[VIMC_SCA_SRC];
+	const struct v4l2_rect *r = &vsca->crop_rect;
+	unsigned int snk_width = vsca->fmt[VIMC_SCA_SINK].width;
+	unsigned int src_lin, src_col;
+	u8 *walker = vsca->src_frame;
+
+	/* Set each pixel at the src_frame to its sink_frame equivalent */
+	for (src_lin = 0; src_lin < src_fmt->height; src_lin++) {
+		for (src_col = 0; src_col < src_fmt->width; src_col++) {
+			unsigned int snk_lin, snk_col, index;
+
+			snk_lin = (src_lin * r->height) / src_fmt->height
+				  + r->top;
+			snk_col = (src_col * r->width) / src_fmt->width
+				  + r->left;
+			index = VIMC_FRAME_INDEX(snk_lin, snk_col, snk_width,
+						 vsca->bpp);
+			memcpy(walker, &sink_frame[index], vsca->bpp);
+			walker += vsca->bpp;
+		}
+	}
 }
 
 static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
@@ -492,8 +424,8 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 		return ERR_PTR(-ENOMEM);
 
 	/* Initialize ved and sd */
-	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
-	vsca->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	vsca->pads[VIMC_SCA_SINK].flags = MEDIA_PAD_FL_SINK;
+	vsca->pads[VIMC_SCA_SRC].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
 				   vcfg_name,
@@ -508,7 +440,8 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	vsca->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the frame format */
-	vsca->sink_fmt = sink_fmt_default;
+	vsca->fmt[VIMC_SCA_SINK] = sink_fmt_default;
+	vsca->fmt[VIMC_SCA_SRC] = sink_fmt_default;
 
 	/* Initialize the crop selection */
 	vsca->crop_rect = crop_rect_default;
-- 
2.32.0

