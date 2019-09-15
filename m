Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83218B323B
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 23:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfIOVgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 17:36:01 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38949 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbfIOVgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 17:36:01 -0400
Received: by mail-qt1-f196.google.com with SMTP id n7so40902061qtb.6;
        Sun, 15 Sep 2019 14:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7liELwTIlBMT41St5Lnus803/thiiALQ9nm2GIu7dAg=;
        b=ktPrfzZsqIZw6z2Ej1gCSwpFDPEeYXwantevzIH4Qt78qE4LsxtYavgrM0nYCMr3DL
         tR0p4sF2QURYp/7DQCHeONKxQQ/pH64k+06jadWIpp1Ig01WvNupvilz6xKlcAODDzRh
         FCgWr7DTeh2LU3w9SFR0PTOqQuGS5jakSsTMg/O9V4sR4PtjCTYTbVw/8yCUHMEqpiKt
         9eQF2Ml+gcCpi3T4OYcT0dXd1tbBrvpLyZuq5muLKOf4CR8BnFEaJbHzcIdHa9bjtG24
         ap7+F9iodg0aAp/jkiqp1+VZCGgQ+GwlwSWmySQJzp/aMbPDbnIvO+6r01psVFBjqwCD
         hGLA==
X-Gm-Message-State: APjAAAXXxy6XZQ3PsuPJcBS1Gv9IpOEUS13apbZ1wAlAd3H6Vwo/PQvX
        PITfD3EWRg0fV59SJmVdkXk=
X-Google-Smtp-Source: APXvYqzaVobdPQ0ZhCdW63MVe31qXKMW4rQatJAHFO6R6bmvJb+qvv5H/hVvNDBV77+8p0N775jiGQ==
X-Received: by 2002:ac8:548:: with SMTP id c8mr14812391qth.124.1568583359626;
        Sun, 15 Sep 2019 14:35:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:61ff:df91:282f:2661:e541])
        by smtp.gmail.com with ESMTPSA id c16sm16459913qkg.131.2019.09.15.14.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 14:35:59 -0700 (PDT)
From:   Pedro Terra <pirate@terraco.de>
To:     helen.koike@collabora.com, mchehab@kernel.org,
        skhan@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        andrealmeid@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Cc:     Pedro Terra <pirate@terraco.de>,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Subject: [PATCH v2] media: vimc: Enable set resolution at the scaler src pad
Date:   Sun, 15 Sep 2019 18:35:50 -0300
Message-Id: <20190915213550.6967-1-pirate@terraco.de>
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
media-ctl -d /dev/media0 -V '"Scaler":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Scaler":1[fmt:SBGGR8_1X8/300x700]'
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

Changes in V2:
* Patch was not sent to media list mail for some reason (even though it
was on the Cc list), trying again.
* Updating documentation.

Hello! This patch depends on the series:
"Collapse vimc into single monolithic driver" V3
This code is the result of friends getting together with too much
coffee, sugar and beer trying to get started with some kernel coding.
Please, don't go easy on us! s2

Running
/usr/local/bin/v4l2-compliance -m /dev/media0
Gave the following result:
v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
---
 Documentation/media/v4l-drivers/vimc.rst  |  15 +-
 drivers/media/platform/vimc/vimc-scaler.c | 217 +++++++---------------
 2 files changed, 77 insertions(+), 155 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index a582af0509ee..c28c635d965c 100644
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
@@ -84,13 +86,6 @@ Vimc has a few module parameters to configure the driver.
 
         param=value
 
-* ``sca_mult=<unsigned int>``
-
-        Image size multiplier factor to be used to multiply both width and
-        height, so the image size will be ``sca_mult^2`` bigger than the
-        original one. Currently, only supports scaling up (the default value
-        is 3).
-
 * ``deb_mean_win_size=<unsigned int>``
 
         Window size to calculate the mean. Note: the window size needs to be an
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 05db5070e268..1e398124a651 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -12,25 +12,24 @@
 
 #include "vimc-common.h"
 
-static unsigned int sca_mult = 3;
-module_param(sca_mult, uint, 0000);
-MODULE_PARM_DESC(sca_mult, " the image size multiplier");
+/* Pad identifier */
+enum sca_pad {
+	SCA_SINK = 0,
+	SCA_SRC = 1,
+	SCA_COUNT = 2
+};
 
-#define IS_SINK(pad)	(!pad)
-#define IS_SRC(pad)	(pad)
-#define MAX_ZOOM	8
+/* Default scaling factor for both width and height  */
+#define SRC_SCALING_DEFAULT 3
 
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
 	struct device *dev;
-	/* NOTE: the source fmt is the same as the sink
-	 * with the width and hight multiplied by mult
-	 */
-	struct v4l2_mbus_framefmt sink_fmt;
+	/* Frame format for both sink and src pad */
+	struct v4l2_mbus_framefmt fmt[SCA_COUNT];
 	/* Values calculated when the stream starts */
 	u8 *src_frame;
-	unsigned int src_line_size;
 	unsigned int bpp;
 };
 
@@ -54,8 +53,8 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 	for (i = 1; i < sd->entity.num_pads; i++) {
 		mf = v4l2_subdev_get_try_format(sd, cfg, i);
 		*mf = sink_fmt_default;
-		mf->width = mf->width * sca_mult;
-		mf->height = mf->height * sca_mult;
+		mf->width = mf->width * SRC_SCALING_DEFAULT;
+		mf->height = mf->height * SRC_SCALING_DEFAULT;
 	}
 
 	return 0;
@@ -92,14 +91,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 
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
@@ -111,82 +104,64 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
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
+	struct v4l2_mbus_framefmt *fmt[SCA_COUNT];
 
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
@@ -211,16 +186,12 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -249,73 +220,26 @@ static const struct v4l2_subdev_ops vimc_sca_ops = {
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
+	unsigned int lin, col, bpp_i, index;
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
+			for (bpp_i = 0; bpp_i < vsca->bpp; bpp_i++)
+				*(walker++) = sink_frame[index + bpp_i];
+		}
+	}
 }
 
 static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
@@ -382,7 +306,10 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	vsca->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
-	vsca->sink_fmt = sink_fmt_default;
+	vsca->fmt[SCA_SINK] = sink_fmt_default;
+	vsca->fmt[SCA_SRC] = sink_fmt_default;
+	vsca->fmt[SCA_SRC].width *= SRC_SCALING_DEFAULT;
+	vsca->fmt[SCA_SRC].height *= SRC_SCALING_DEFAULT;
 
 	return &vsca->ved;
 }
-- 
2.23.0

