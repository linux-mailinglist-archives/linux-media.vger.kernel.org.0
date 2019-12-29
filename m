Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9357D12CAAD
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2019 20:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfL2Tmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Dec 2019 14:42:31 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40629 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfL2Tma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Dec 2019 14:42:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id s21so11099909plr.7;
        Sun, 29 Dec 2019 11:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YmKnMxUelpN6rMWp77VnNiMRd2UrdoGheBYQN845akE=;
        b=Z0QW512Xaw+13hPlXn0vr/3ntdy9GyyWRpjRcEIKb5qSys6UgF0nSxA/RvaV16br2w
         IrcguulAART13nC+dHfHDMySMMi0fpN1W+PF5tD3oKnv/4sgH0BISGpAXlCa+RUWhlO9
         i4NzrDitWg5lhUKhlur0GrRppWSJXdqWAFLwvbmg8f/UpJRP6m9AtJyKtJpj9wRKPwmR
         Eyy5K/2ow1IFHjKhADvtjGcLGIZldgqvoTSbVD4PHViws2br7jxOUyj9DYUWR+8txzg7
         nLs18qyk6ix6EEJ8vjHp4I1Z9Zkp+fn4/hU6XIkri0mc2f62d5MA/A5YjPprnFhkMiLj
         F2qw==
X-Gm-Message-State: APjAAAUV2UKOAM+nV41wNBvmWjefIMIbUbTSyiWJ5py/P7cg7cjA+kBn
        HITDs+3Imotsez0//m0pc9c=
X-Google-Smtp-Source: APXvYqwSCoNoJ77MXMoKDPSUO6SDvegPKiQPFp4c0uxvi0r9TJ3ZT2IdMhKXWC93prav1RI1iG2Qdw==
X-Received: by 2002:a17:902:b589:: with SMTP id a9mr64804841pls.256.1577648549433;
        Sun, 29 Dec 2019 11:42:29 -0800 (PST)
Received: from localhost.localdomain ([187.58.51.199])
        by smtp.gmail.com with ESMTPSA id k12sm44158004pgm.65.2019.12.29.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 11:42:28 -0800 (PST)
From:   Pedro Terra <pirate@terraco.de>
To:     helen.koike@collabora.com, mchehab@kernel.org,
        skhan@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        dafna.hirschfeld@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Cc:     Pedro Terra <pirate@terraco.de>,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Subject: [PATCH v4] media: vimc: Enable set resolution at the scaler src pad
Date:   Sun, 29 Dec 2019 16:42:14 -0300
Message-Id: <20191229194214.4592-1-pirate@terraco.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
	-video_size "300x700" test.raw

Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>

---

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

Hello!
This code is the result of friends getting together with too much
coffee, sugar and beer trying to get started with some kernel coding.
Please, don't go easy on us! s2

Running
/usr/local/bin/v4l2-compliance -m /dev/media0
Gave the following result:
v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
---
 Documentation/media/v4l-drivers/vimc.rst  |  21 +-
 drivers/media/platform/vimc/vimc-scaler.c | 248 +++++++---------------
 2 files changed, 87 insertions(+), 182 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index 8f5d7f8d83bb..af04ebbd4fa1 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -61,9 +61,11 @@ vimc-debayer:
 	* 1 Pad source
 
 vimc-scaler:
-	Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
-        1920x1440 image. (this value can be configured, see at
-        `Module options`_).
+	Re-size the image to meet the source pad resolution. E.g.: if the sync pad
+is configured to 360x480 and the source to 1280x720, the image will be stretched
+to fit the source resolution. Works for any resolution within the vimc
+limitations (even shrinking the image if necessary).
+
 	Exposes:
 
 	* 1 Pad sink
@@ -76,19 +78,6 @@ vimc-capture:
 	* 1 Pad sink
 	* 1 Pad source
 
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
-
 Source code documentation
 -------------------------
 
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index e2e551bc3ded..785009b7ac9e 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
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
+enum vimc_sca_pad {
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
@@ -90,17 +88,15 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_rect *r;
 	unsigned int i;
 
-	mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+	mf = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
 	*mf = sink_fmt_default;
 
-	r = v4l2_subdev_get_try_crop(sd, cfg, 0);
+	r = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
 	*r = crop_rect_default;
 
 	for (i = 1; i < sd->entity.num_pads; i++) {
 		mf = v4l2_subdev_get_try_format(sd, cfg, i);
 		*mf = sink_fmt_default;
-		mf->width = mf->width * sca_mult;
-		mf->height = mf->height * sca_mult;
 	}
 
 	return 0;
@@ -137,14 +133,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
 	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
-
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
@@ -154,95 +144,73 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_format *format)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
-	struct v4l2_rect *crop_rect;
 
-	/* Get the current sink format */
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
-	} else {
-		format->format = vsca->sink_fmt;
-		crop_rect = &vsca->crop_rect;
-	}
-
-	/* Scale the frame size for the source pad */
-	if (VIMC_IS_SRC(format->pad)) {
-		format->format.width = crop_rect->width * sca_mult;
-		format->format.height = crop_rect->height * sca_mult;
-	}
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		format->format = *v4l2_subdev_get_try_format(sd, cfg,
+							     format->pad);
+	else
+		format->format = vsca->fmt[format->pad];
 
 	return 0;
 }
 
-static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
+static void vimc_sca_adjust_fmt(struct v4l2_mbus_framefmt *fmt[], __u32 pad)
 {
-	const struct vimc_pix_map *vpix;
+	if (pad == VIMC_SCA_SINK) {
+		const struct vimc_pix_map *vpix;
 
-	/* Only accept code in the pix map table in non bayer format */
-	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
-		fmt->code = sink_fmt_default.code;
+		/* Only accept code in the pix map table in non bayer format */
+		vpix = vimc_pix_map_by_code(fmt[VIMC_SCA_SINK]->code);
+		if (!vpix || vpix->bayer)
+			fmt[VIMC_SCA_SINK]->code = sink_fmt_default.code;
+		if (fmt[VIMC_SCA_SINK]->field == V4L2_FIELD_ANY)
+			fmt[VIMC_SCA_SINK]->field = sink_fmt_default.field;
 
-	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
+		vimc_colorimetry_clamp(fmt[VIMC_SCA_SINK]);
+	}
+
+	fmt[pad]->width = clamp_t(u32, fmt[pad]->width, VIMC_FRAME_MIN_WIDTH,
 			     VIMC_FRAME_MAX_WIDTH) & ~1;
-	fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
+	fmt[pad]->height = clamp_t(u32, fmt[pad]->height, VIMC_FRAME_MIN_HEIGHT,
 			      VIMC_FRAME_MAX_HEIGHT) & ~1;
 
-	if (fmt->field == V4L2_FIELD_ANY)
-		fmt->field = sink_fmt_default.field;
-
-	vimc_colorimetry_clamp(fmt);
+	/* Assure src pad attributes besides dimensions are the same as sink */
+	fmt[VIMC_SCA_SRC]->code = fmt[VIMC_SCA_SINK]->code;
+	fmt[VIMC_SCA_SRC]->field = fmt[VIMC_SCA_SINK]->field;
+	fmt[VIMC_SCA_SRC]->colorspace = fmt[VIMC_SCA_SINK]->colorspace;
 }
 
 static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_pad_config *cfg,
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
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		fmt[VIMC_SCA_SINK] = v4l2_subdev_get_try_format(sd, cfg,
+								VIMC_SCA_SINK);
+		fmt[VIMC_SCA_SRC] = v4l2_subdev_get_try_format(sd, cfg,
+							       VIMC_SCA_SRC);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
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
 
+	if (format->pad == VIMC_SCA_SINK)
 		/* Do the crop, but respect the current bounds */
-		vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
-	}
+		vimc_sca_adjust_sink_crop(crop_rect, fmt[VIMC_SCA_SINK]);
 
 	return 0;
 }
@@ -259,11 +227,11 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		sink_fmt = &vsca->sink_fmt;
+		sink_fmt = &vsca->fmt[VIMC_SCA_SINK];
 		crop_rect = &vsca->crop_rect;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
 	}
 
 	switch (sel->target) {
@@ -297,10 +265,10 @@ static int vimc_sca_set_selection(struct v4l2_subdev *sd,
 			return -EBUSY;
 
 		crop_rect = &vsca->crop_rect;
-		sink_fmt = &vsca->sink_fmt;
+		sink_fmt = &vsca->fmt[VIMC_SCA_SINK];
 	} else {
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
+		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
 	}
 
 	switch (sel->target) {
@@ -338,16 +306,12 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -376,77 +340,28 @@ static const struct v4l2_subdev_ops vimc_sca_ops = {
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
+	unsigned int s_width = vsca->fmt[VIMC_SCA_SINK].width;
+	unsigned int lin, col, index;
+	u8 *walker = vsca->src_frame;
+
+	/* Set each pixel at the src_frame to its sink_frame equivalent */
+	for (lin = 0; lin < src_fmt->height; lin++) {
+		for (col = 0; col < src_fmt->width; col++) {
+			unsigned int s_lin, s_col;
+
+			s_lin = (lin * r->height) / src_fmt->height + r->top;
+			s_col = (col * r->width) / src_fmt->width + r->left;
+			index = VIMC_FRAME_INDEX(s_lin, s_col, s_width,
+						 vsca->bpp);
+			memcpy(walker, &sink_frame[index], vsca->bpp);
+			walker += vsca->bpp;
+		}
+	}
 }
 
 static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
@@ -498,8 +413,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 		return NULL;
 
 	/* Initialize ved and sd */
-	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
-	vsca->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	vsca->pads[VIMC_SCA_SINK].flags = MEDIA_PAD_FL_SINK;
+	vsca->pads[VIMC_SCA_SRC].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
 				   vcfg_name,
@@ -515,7 +430,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	vsca->ved.dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
-	vsca->sink_fmt = sink_fmt_default;
+	vsca->fmt[VIMC_SCA_SINK] = sink_fmt_default;
+	vsca->fmt[VIMC_SCA_SRC] = sink_fmt_default;
 
 	/* Initialize the crop selection */
 	vsca->crop_rect = crop_rect_default;
-- 
2.23.0

