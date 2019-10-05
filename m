Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BECCC76B
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 04:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfJECkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 22:40:52 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33458 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJECkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 22:40:52 -0400
Received: by mail-qt1-f195.google.com with SMTP id r5so11410594qtd.0;
        Fri, 04 Oct 2019 19:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZ4Z2zSdXKrKOEDrIjfMaJfN+3RjUrmOvFm3AzFZPuk=;
        b=ea7WyRvEgkbwV5/Gqht8o7ZpXycHO+B84zaCxtvGYojGEpxUeUwNdg/YfqRNAPIXbA
         XDUSsHo5kCzSOJjdYZ0Xz4EPC86Jkl2FVBwC4wac+AGYYcVbAwin2Jc8CHDf6djs6f9k
         KwdfdeM0MK+sXe719eNKcD7P46YDBcqAH1W06BpiBOFidDWdKGbj0ABrdcPt+tt/1JTd
         YnSCxFd8c0+KAbu357VVnShptjpsjLHaeKDQ7mAveYubC3g0nVj8vg0JkqWGpy+lHzv+
         s0D0Yqw9RwerzFgmOeyJGXpAsWHEJ5ShYb7DNNuVZqe7ZSjg1FuDhf48ioU2ovauCYE2
         ZOeg==
X-Gm-Message-State: APjAAAUAHJzmXZ18UGmoopEnOv21azd8QijkeYgDoG1J59vVDdBtRq+e
        /+EP//3G1Kn5iWl447tnI7g=
X-Google-Smtp-Source: APXvYqzvsvMCBnfThbrIcV+RKYucA/F/CWSB//g6O7PbnskhoRar2O+tv2GasFNpL7KfSourwEMEVA==
X-Received: by 2002:ac8:fd1:: with SMTP id f17mr18195002qtk.213.1570243250652;
        Fri, 04 Oct 2019 19:40:50 -0700 (PDT)
Received: from linux-27gj.terracota.local ([177.103.155.130])
        by smtp.gmail.com with ESMTPSA id g33sm3878250qtd.12.2019.10.04.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 19:40:50 -0700 (PDT)
From:   Pedro Terra <pirate@terraco.de>
To:     helen.koike@collabora.com, mchehab@kernel.org,
        skhan@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        andrealmeid@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Cc:     Pedro Terra <pirate@terraco.de>,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Subject: [PATCH v3] media: vimc: Enable set resolution at the scaler src pad
Date:   Fri,  4 Oct 2019 23:40:43 -0300
Message-Id: <20191005024043.7764-1-pirate@terraco.de>
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

Hello! This patch depends on the series:
"Collapse vimc into single monolithic driver" V3
This code is the result of friends getting together with too much
coffee, sugar and beer trying to get started with some kernel coding.
Please, don't go easy on us! s2

Thanks Hans and Dafna for taking your time to review our patch!

Running
/usr/local/bin/v4l2-compliance -m /dev/media0
Gave the following result:
v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
---
 Documentation/media/v4l-drivers/vimc.rst  |  19 +-
 drivers/media/platform/vimc/vimc-scaler.c | 212 +++++++---------------
 2 files changed, 72 insertions(+), 159 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index a582af0509ee..22689bb6a63b 100644
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
@@ -80,16 +82,7 @@ vimc-capture:
         Module options
 ---------------
 
-Vimc has a few module parameters to configure the driver.
-
-        param=value
-
-* ``sca_mult=<unsigned int>``
-
-        Image size multiplier factor to be used to multiply both width and
-        height, so the image size will be ``sca_mult^2`` bigger than the
-        original one. Currently, only supports scaling up (the default value
-        is 3).
+Vimc has one module parameters to configure the driver.
 
 * ``deb_mean_win_size=<unsigned int>``
 
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 05db5070e268..3a319ee3e8bb 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -8,29 +8,25 @@
 #include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
+#include <linux/string.h>
 #include <media/v4l2-subdev.h>
 
 #include "vimc-common.h"
 
-static unsigned int sca_mult = 3;
-module_param(sca_mult, uint, 0000);
-MODULE_PARM_DESC(sca_mult, " the image size multiplier");
-
-#define IS_SINK(pad)	(!pad)
-#define IS_SRC(pad)	(pad)
-#define MAX_ZOOM	8
+/* Pad identifier */
+enum sca_pad {
+	SCA_SINK = 0,
+	SCA_SRC = 1,
+};
 
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
 	struct device *dev;
-	/* NOTE: the source fmt is the same as the sink
-	 * with the width and hight multiplied by mult
-	 */
-	struct v4l2_mbus_framefmt sink_fmt;
+	/* Frame format for both sink and src pad */
+	struct v4l2_mbus_framefmt fmt[2];
 	/* Values calculated when the stream starts */
 	u8 *src_frame;
-	unsigned int src_line_size;
 	unsigned int bpp;
 };
 
@@ -54,8 +50,6 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 	for (i = 1; i < sd->entity.num_pads; i++) {
 		mf = v4l2_subdev_get_try_format(sd, cfg, i);
 		*mf = sink_fmt_default;
-		mf->width = mf->width * sca_mult;
-		mf->height = mf->height * sca_mult;
 	}
 
 	return 0;
@@ -92,14 +86,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
 	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
-
-	if (IS_SINK(fse->pad)) {
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
@@ -111,82 +99,64 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 
 	/* Get the current sink format */
-	format->format = (format->which == V4L2_SUBDEV_FORMAT_TRY) ?
-			 *v4l2_subdev_get_try_format(sd, cfg, 0) :
-			 vsca->sink_fmt;
-
-	/* Scale the frame size for the source pad */
-	if (IS_SRC(format->pad)) {
-		format->format.width = vsca->sink_fmt.width * sca_mult;
-		format->format.height = vsca->sink_fmt.height * sca_mult;
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
+	if (pad == SCA_SINK) {
+		const struct vimc_pix_map *vpix;
 
-	/* Only accept code in the pix map table in non bayer format */
-	vpix = vimc_pix_map_by_code(fmt->code);
-	if (!vpix || vpix->bayer)
-		fmt->code = sink_fmt_default.code;
+		/* Only accept code in the pix map table in non bayer format */
+		vpix = vimc_pix_map_by_code(fmt[SCA_SINK]->code);
+		if (!vpix || vpix->bayer)
+			fmt[SCA_SINK]->code = sink_fmt_default.code;
+		if (fmt[SCA_SINK]->field == V4L2_FIELD_ANY)
+			fmt[SCA_SINK]->field = sink_fmt_default.field;
+
+		vimc_colorimetry_clamp(fmt[SCA_SINK]);
+	}
 
-	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
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
+	fmt[SCA_SRC]->code = fmt[SCA_SINK]->code;
+	fmt[SCA_SRC]->field = fmt[SCA_SINK]->field;
+	fmt[SCA_SRC]->colorspace = fmt[SCA_SINK]->colorspace;
 }
 
 static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_pad_config *cfg,
-			    struct v4l2_subdev_format *fmt)
+			    struct v4l2_subdev_format *format)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *fmt[2];
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
 		if (vsca->src_frame)
 			return -EBUSY;
 
-		sink_fmt = &vsca->sink_fmt;
+		fmt[SCA_SINK] = &vsca->fmt[SCA_SINK];
+		fmt[SCA_SRC] = &vsca->fmt[SCA_SRC];
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		fmt[SCA_SINK] = v4l2_subdev_get_try_format(sd, cfg, SCA_SINK);
+		fmt[SCA_SRC] = v4l2_subdev_get_try_format(sd, cfg, SCA_SRC);
 	}
 
-	/*
-	 * Do not change the format of the source pad,
-	 * it is propagated from the sink
-	 */
-	if (IS_SRC(fmt->pad)) {
-		fmt->format = *sink_fmt;
-		fmt->format.width = sink_fmt->width * sca_mult;
-		fmt->format.height = sink_fmt->height * sca_mult;
-	} else {
-		/* Set the new format in the sink pad */
-		vimc_sca_adjust_sink_fmt(&fmt->format);
-
-		dev_dbg(vsca->dev, "%s: sink format update: "
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
-	}
+	*fmt[format->pad] = format->format;
+	vimc_sca_adjust_fmt(fmt, format->pad);
+
+	format->format = *fmt[format->pad];
 
 	return 0;
 }
@@ -211,16 +181,12 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 			return 0;
 
 		/* Save the bytes per pixel of the sink */
-		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
+		vpix = vimc_pix_map_by_code(vsca->fmt[SCA_SINK].code);
 		vsca->bpp = vpix->bpp;
 
-		/* Calculate the width in bytes of the src frame */
-		vsca->src_line_size = vsca->sink_fmt.width *
-				      sca_mult * vsca->bpp;
-
 		/* Calculate the frame size of the source pad */
-		frame_size = vsca->src_line_size * vsca->sink_fmt.height *
-			     sca_mult;
+		frame_size = vsca->fmt[SCA_SRC].width
+			     * vsca->fmt[SCA_SRC].height * vsca->bpp;
 
 		/* Allocate the frame buffer. Use vmalloc to be able to
 		 * allocate a large amount of memory
@@ -249,73 +215,26 @@ static const struct v4l2_subdev_ops vimc_sca_ops = {
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
-			       const unsigned int lin, const unsigned int col,
-			       const u8 *const sink_frame)
-{
-	unsigned int i, j, index;
-	const u8 *pixel;
-
-	/* Point to the pixel value in position (lin, col) in the sink frame */
-	index = VIMC_FRAME_INDEX(lin, col,
-				 vsca->sink_fmt.width,
-				 vsca->bpp);
-	pixel = &sink_frame[index];
-
-	dev_dbg(vsca->dev,
-		"sca: %s: --- scale_pix sink pos %dx%d, index %d ---\n",
-		vsca->sd.name, lin, col, index);
-
-	/* point to the place we are going to put the first pixel
-	 * in the scaled src frame
-	 */
-	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
-				 vsca->sink_fmt.width * sca_mult, vsca->bpp);
-
-	dev_dbg(vsca->dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
-		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
-
-	/* Repeat this pixel mult times */
-	for (i = 0; i < sca_mult; i++) {
-		/* Iterate through each beginning of a
-		 * pixel repetition in a line
-		 */
-		for (j = 0; j < sca_mult * vsca->bpp; j += vsca->bpp) {
-			dev_dbg(vsca->dev,
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
-	unsigned int i, j;
-
-	/* Scale each pixel from the original sink frame */
-	/* TODO: implement scale down, only scale up is supported for now */
-	for (i = 0; i < vsca->sink_fmt.height; i++)
-		for (j = 0; j < vsca->sink_fmt.width; j++)
-			vimc_sca_scale_pix(vsca, i, j, sink_frame);
+	unsigned int lin, col, index;
+	struct v4l2_mbus_framefmt const *fmt = vsca->fmt;
+	u8 *walker = vsca->src_frame;
+
+	/* Set each pixel at the src_frame to its sink_frame equivalent */
+	for (lin = 0; lin < fmt[SCA_SRC].height; lin++) {
+		for (col = 0; col < fmt[SCA_SRC].width; col++) {
+			index = VIMC_FRAME_INDEX((lin * fmt[SCA_SINK].height)
+						 / fmt[SCA_SRC].height,
+						 (col * fmt[SCA_SINK].width)
+						 / fmt[SCA_SRC].width,
+						 fmt[SCA_SINK].width,
+						 vsca->bpp);
+			memcpy(walker, &sink_frame[index], vsca->bpp);
+			walker += vsca->bpp;
+		}
+	}
 }
 
 static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
@@ -382,7 +301,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	vsca->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
-	vsca->sink_fmt = sink_fmt_default;
+	vsca->fmt[SCA_SINK] = sink_fmt_default;
+	vsca->fmt[SCA_SRC] = sink_fmt_default;
 
 	return &vsca->ved;
 }
-- 
2.23.0

