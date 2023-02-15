Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD39D69814A
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 17:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjBOQug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 11:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjBOQua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 11:50:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8ED36455
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 08:50:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA7A3465;
        Wed, 15 Feb 2023 17:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676479826;
        bh=qGtjCRodk+s041+7G6fRYe3nv/NSD/9q2xYXQ0e5l40=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rur4mHhFq1vag39B39wpUeV8t0iwhHCR2lwrcdRSFNIwCga3p6LQYzjZeYk2uE00H
         0q44DeQ9Oo7poOOIapG55aPua+WMHPSca2xfilqXESJsV400SqhLj67VPEBeJeGLyv
         reAJIm1ZPNvQStd++O2T3Pf+SVOi66izoBZ7btkE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: [PATCH 2/3] media: Prefer designated initializers over memset for subdev pad ops
Date:   Wed, 15 Feb 2023 18:50:20 +0200
Message-Id: <20230215165021.6628-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
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

Structures passed to subdev pad operations are all zero-initialized, but
not always with the same kind of code constructs. While most drivers
used designated initializers, which zero all the fields that are not
specified, when declaring variables, some use memset(). Those two
methods lead to the same end result, and, depending on compiler
optimizations, may even be completely equivalent, but they're not
consistent.

Improve coding style consistency by using designated initializers
instead of calling memset(). Where applicable, also move the variables
to inner scopes of for loops to ensure correct initialization in all
iterations.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 18 +++++++++---------
 .../media/platform/renesas/vsp1/vsp1_entity.c  | 11 +++++------
 .../platform/samsung/exynos4-is/fimc-capture.c |  7 ++++---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 15 ++++++++-------
 drivers/media/platform/ti/cal/cal-video.c      |  8 ++++----
 drivers/media/usb/dvb-usb/cxusb-analog.c       | 14 +++++++-------
 drivers/staging/media/imx/imx-media-capture.c  | 12 ++++++------
 drivers/staging/media/imx/imx-media-utils.c    |  8 ++++----
 drivers/staging/media/omap4iss/iss_video.c     |  6 +++---
 9 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index c6f25200982c..7fe375b6322c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -66,7 +66,9 @@ static int vsp1_du_insert_uif(struct vsp1_device *vsp1,
 			      struct vsp1_entity *prev, unsigned int prev_pad,
 			      struct vsp1_entity *next, unsigned int next_pad)
 {
-	struct v4l2_subdev_format format;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	int ret;
 
 	if (!uif) {
@@ -82,8 +84,6 @@ static int vsp1_du_insert_uif(struct vsp1_device *vsp1,
 	prev->sink = uif;
 	prev->sink_pad = UIF_PAD_SINK;
 
-	memset(&format, 0, sizeof(format));
-	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	format.pad = prev_pad;
 
 	ret = v4l2_subdev_call(&prev->subdev, pad, get_fmt, NULL, &format);
@@ -118,8 +118,12 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 				      struct vsp1_entity *uif,
 				      unsigned int brx_input)
 {
-	struct v4l2_subdev_selection sel;
-	struct v4l2_subdev_format format;
+	struct v4l2_subdev_selection sel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	const struct v4l2_rect *crop;
 	int ret;
 
@@ -129,8 +133,6 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	 */
 	crop = &vsp1->drm->inputs[rpf->entity.index].crop;
 
-	memset(&format, 0, sizeof(format));
-	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	format.pad = RWPF_PAD_SINK;
 	format.format.width = crop->width + crop->left;
 	format.format.height = crop->height + crop->top;
@@ -147,8 +149,6 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 		__func__, format.format.width, format.format.height,
 		format.format.code, rpf->entity.index);
 
-	memset(&sel, 0, sizeof(sel));
-	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.pad = RWPF_PAD_SINK;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = *crop;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 4c3bd2b1ca28..c31f05a80bb5 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -184,15 +184,14 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
 int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
 			 struct v4l2_subdev_state *sd_state)
 {
-	struct v4l2_subdev_format format;
 	unsigned int pad;
 
 	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
-		memset(&format, 0, sizeof(format));
-
-		format.pad = pad;
-		format.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-			     : V4L2_SUBDEV_FORMAT_ACTIVE;
+		struct v4l2_subdev_format format = {
+			.pad = pad,
+			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+			       : V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
 
 		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
 	}
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index 4800751a401c..a0d43bf892e6 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -763,7 +763,10 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
 	struct fimc_dev *fimc = ctx->fimc_dev;
 	struct fimc_pipeline *p = to_fimc_pipeline(fimc->vid_cap.ve.pipe);
 	struct v4l2_subdev *sd = p->subdevs[IDX_SENSOR];
-	struct v4l2_subdev_format sfmt;
+	struct v4l2_subdev_format sfmt = {
+		.which = set ? V4L2_SUBDEV_FORMAT_ACTIVE
+		       : V4L2_SUBDEV_FORMAT_TRY,
+	};
 	struct v4l2_mbus_framefmt *mf = &sfmt.format;
 	struct media_entity *me;
 	struct fimc_fmt *ffmt;
@@ -774,9 +777,7 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
 	if (WARN_ON(!sd || !tfmt))
 		return -EINVAL;
 
-	memset(&sfmt, 0, sizeof(sfmt));
 	sfmt.format = *tfmt;
-	sfmt.which = set ? V4L2_SUBDEV_FORMAT_ACTIVE : V4L2_SUBDEV_FORMAT_TRY;
 
 	me = fimc_pipeline_get_head(&sd->entity);
 
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index f23085b5954b..9fcbf2a2b7c3 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1501,7 +1501,9 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 			  struct v4l2_frmsizeenum *fsize)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
-	struct v4l2_subdev_frame_size_enum fse;
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	struct v4l2_subdev *sd = vpfe->current_subdev->sd;
 	struct vpfe_fmt *fmt;
 	int ret;
@@ -1516,11 +1518,9 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 
 	memset(fsize->reserved, 0x0, sizeof(fsize->reserved));
 
-	memset(&fse, 0x0, sizeof(fse));
 	fse.index = fsize->index;
 	fse.pad = 0;
 	fse.code = fmt->code;
-	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);
 	if (ret)
 		return ret;
@@ -2148,7 +2148,6 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 {
 	struct vpfe_device *vpfe = container_of(notifier->v4l2_dev,
 					       struct vpfe_device, v4l2_dev);
-	struct v4l2_subdev_mbus_code_enum mbus_code;
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_fmt *fmt;
 	int ret = 0;
@@ -2175,9 +2174,11 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 
 	vpfe->num_active_fmt = 0;
 	for (j = 0, i = 0; (ret != -EINVAL); ++j) {
-		memset(&mbus_code, 0, sizeof(mbus_code));
-		mbus_code.index = j;
-		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		struct v4l2_subdev_mbus_code_enum mbus_code = {
+			.index = j,
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
+
 		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
 				       NULL, &mbus_code);
 		if (ret)
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 51ed82172d71..ca906a9e4222 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -814,7 +814,6 @@ static const struct v4l2_file_operations cal_fops = {
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 {
-	struct v4l2_subdev_mbus_code_enum mbus_code;
 	struct v4l2_mbus_framefmt mbus_fmt;
 	const struct cal_format_info *fmtinfo;
 	unsigned int i, j, k;
@@ -829,10 +828,11 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	ctx->num_active_fmt = 0;
 
 	for (j = 0, i = 0; ; ++j) {
+		struct v4l2_subdev_mbus_code_enum mbus_code = {
+			.index = j,
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
 
-		memset(&mbus_code, 0, sizeof(mbus_code));
-		mbus_code.index = j;
-		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_mbus_code,
 				       NULL, &mbus_code);
 		if (ret == -EINVAL)
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index e93183ddd797..deba5224cb8d 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1014,7 +1014,10 @@ static int cxusb_medion_try_s_fmt_vid_cap(struct file *file,
 {
 	struct dvb_usb_device *dvbdev = video_drvdata(file);
 	struct cxusb_medion_dev *cxdev = dvbdev->priv;
-	struct v4l2_subdev_format subfmt;
+	struct v4l2_subdev_format subfmt = {
+		.which = isset ? V4L2_SUBDEV_FORMAT_ACTIVE :
+			 V4L2_SUBDEV_FORMAT_TRY,
+	};
 	u32 field;
 	int ret;
 
@@ -1024,9 +1027,6 @@ static int cxusb_medion_try_s_fmt_vid_cap(struct file *file,
 	field = vb2_start_streaming_called(&cxdev->videoqueue) ?
 		cxdev->field_order : cxusb_medion_field_order(cxdev);
 
-	memset(&subfmt, 0, sizeof(subfmt));
-	subfmt.which = isset ? V4L2_SUBDEV_FORMAT_ACTIVE :
-		V4L2_SUBDEV_FORMAT_TRY;
 	subfmt.format.width = f->fmt.pix.width & ~1;
 	subfmt.format.height = f->fmt.pix.height & ~1;
 	subfmt.format.code = MEDIA_BUS_FMT_FIXED;
@@ -1464,7 +1464,9 @@ int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
 					    .buf = tuner_analog_msg_data,
 					    .len =
 					    sizeof(tuner_analog_msg_data) };
-	struct v4l2_subdev_format subfmt;
+	struct v4l2_subdev_format subfmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	int ret;
 
 	/* switch tuner to analog mode so IF demod will become accessible */
@@ -1507,8 +1509,6 @@ int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
 	v4l2_subdev_call(cxdev->tuner, video, s_std, cxdev->norm);
 	v4l2_subdev_call(cxdev->cx25840, video, s_std, cxdev->norm);
 
-	memset(&subfmt, 0, sizeof(subfmt));
-	subfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	subfmt.format.width = cxdev->width;
 	subfmt.format.height = cxdev->height;
 	subfmt.format.code = MEDIA_BUS_FMT_FIXED;
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 39666db59c4e..4364df27c6d2 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -504,14 +504,14 @@ static int capture_legacy_g_parm(struct file *file, void *fh,
 				 struct v4l2_streamparm *a)
 {
 	struct capture_priv *priv = video_drvdata(file);
-	struct v4l2_subdev_frame_interval fi;
+	struct v4l2_subdev_frame_interval fi = {
+		.pad = priv->src_sd_pad,
+	};
 	int ret;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	memset(&fi, 0, sizeof(fi));
-	fi.pad = priv->src_sd_pad;
 	ret = v4l2_subdev_call(priv->src_sd, video, g_frame_interval, &fi);
 	if (ret < 0)
 		return ret;
@@ -526,14 +526,14 @@ static int capture_legacy_s_parm(struct file *file, void *fh,
 				 struct v4l2_streamparm *a)
 {
 	struct capture_priv *priv = video_drvdata(file);
-	struct v4l2_subdev_frame_interval fi;
+	struct v4l2_subdev_frame_interval fi = {
+		.pad = priv->src_sd_pad,
+	};
 	int ret;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	memset(&fi, 0, sizeof(fi));
-	fi.pad = priv->src_sd_pad;
 	fi.interval = a->parm.capture.timeperframe;
 	ret = v4l2_subdev_call(priv->src_sd, video, s_frame_interval, &fi);
 	if (ret < 0)
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 411e907b68eb..b545750ca526 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -432,15 +432,15 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 		       struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mf_try;
-	struct v4l2_subdev_format format;
 	unsigned int pad;
 	int ret;
 
 	for (pad = 0; pad < sd->entity.num_pads; pad++) {
-		memset(&format, 0, sizeof(format));
+		struct v4l2_subdev_format format = {
+			.pad = pad,
+			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
 
-		format.pad = pad;
-		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
 		if (ret)
 			continue;
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 1406445a30c3..22fa4d6cae10 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -237,7 +237,9 @@ static int
 __iss_video_get_format(struct iss_video *video,
 		       struct v4l2_mbus_framefmt *format)
 {
-	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	struct v4l2_subdev *subdev;
 	u32 pad;
 	int ret;
@@ -246,9 +248,7 @@ __iss_video_get_format(struct iss_video *video,
 	if (!subdev)
 		return -EINVAL;
 
-	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
-	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
 	mutex_lock(&video->mutex);
 	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
-- 
Regards,

Laurent Pinchart

