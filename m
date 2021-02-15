Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D457A31B4A4
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhBOEdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:33:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhBOEd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:33:28 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F7601931;
        Mon, 15 Feb 2021 05:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363311;
        bh=zh7TRDN2j7PQ75ceUSS22k6DcYMmSq6IcvleWqOgq/M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NCkx1LXDFdbp9Z5LJr+B7Sxe2K5Rz+4WGCpy3Z53L8IOXGVBXgGpkthLafzT3nX94
         WFuDd10FxNrCOVcDOxh5ocgJdpYT38BVq9K3WXzEl0upJzydFjaa9+4RHjNgFgk46B
         baYB/5AADMOldrUXtegkSC4H2r+xuWJwrU4qsFNE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 27/77] media: imx: capture: Decouple video node from source with MC-centric API
Date:   Mon, 15 Feb 2021 06:26:51 +0200
Message-Id: <20210215042741.28850-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When operating in MC-centric mode, the behaviour of video nodes shall
not be influenced by the active configuration of the source subdev. Add
a set of ioctl handlers that implement this mode, and select them when
support for the legacy API is not requested.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 161 +++++++++++++++++-
 1 file changed, 155 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 700e99d02523..99133b7ffa5f 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -55,7 +55,7 @@ struct capture_priv {
 #define VID_MEM_LIMIT	SZ_64M
 
 /* -----------------------------------------------------------------------------
- * Common Video IOCTLs
+ * MC-Centric Video IOCTLs
  */
 
 static const struct imx_media_pixfmt *capture_find_format(u32 code, u32 fourcc)
@@ -92,6 +92,41 @@ static int capture_querycap(struct file *file, void *fh,
 	return 0;
 }
 
+static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
+				    struct v4l2_fmtdesc *f)
+{
+	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
+					    PIXFMT_SEL_ANY, 0);
+}
+
+static int capture_enum_framesizes(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	const struct imx_media_pixfmt *cc;
+
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	cc = imx_media_find_pixel_format(fsize->pixel_format, PIXFMT_SEL_ANY);
+	if (!cc)
+		return -EINVAL;
+
+	/*
+	 * TODO: The constraints are hardware-specific and may depend on the
+	 * pixel format. This should come from the driver using
+	 * imx_media_capture.
+	 */
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = 65535;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = 65535;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
 static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
@@ -102,6 +137,75 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
+static const struct imx_media_pixfmt *
+__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
+{
+	struct v4l2_mbus_framefmt fmt_src;
+	const struct imx_media_pixfmt *cc;
+
+	/*
+	 * Find the pixel format, default to the first supported format if not
+	 * found.
+	 */
+	cc = imx_media_find_pixel_format(pixfmt->pixelformat, PIXFMT_SEL_ANY);
+	if (!cc) {
+		imx_media_enum_pixel_formats(&pixfmt->pixelformat, 0,
+					     PIXFMT_SEL_ANY, 0);
+		cc = imx_media_find_pixel_format(pixfmt->pixelformat,
+						 PIXFMT_SEL_ANY);
+	}
+
+	/* Allow IDMAC interweave but enforce field order from source. */
+	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
+		switch (pixfmt->field) {
+		case V4L2_FIELD_SEQ_TB:
+			pixfmt->field = V4L2_FIELD_INTERLACED_TB;
+			break;
+		case V4L2_FIELD_SEQ_BT:
+			pixfmt->field = V4L2_FIELD_INTERLACED_BT;
+			break;
+		default:
+			break;
+		}
+	}
+
+	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+
+	if (compose) {
+		compose->width = fmt_src.width;
+		compose->height = fmt_src.height;
+	}
+
+	return cc;
+}
+
+static int capture_try_fmt_vid_cap(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	__capture_try_fmt(&f->fmt.pix, NULL);
+	return 0;
+}
+
+static int capture_s_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct capture_priv *priv = video_drvdata(file);
+	const struct imx_media_pixfmt *cc;
+
+	if (vb2_is_busy(&priv->q)) {
+		dev_err(priv->dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	cc = __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose);
+
+	priv->vdev.cc = cc;
+	priv->vdev.fmt = f->fmt.pix;
+
+	return 0;
+}
+
 static int capture_g_selection(struct file *file, void *fh,
 			       struct v4l2_selection *s)
 {
@@ -132,6 +236,43 @@ static int capture_g_selection(struct file *file, void *fh,
 	return 0;
 }
 
+static int capture_subscribe_event(struct v4l2_fh *fh,
+				   const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops capture_ioctl_ops = {
+	.vidioc_querycap		= capture_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= capture_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes		= capture_enum_framesizes,
+
+	.vidioc_g_fmt_vid_cap		= capture_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= capture_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= capture_s_fmt_vid_cap,
+
+	.vidioc_g_selection		= capture_g_selection,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_subscribe_event		= capture_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
 /* -----------------------------------------------------------------------------
  * Legacy Video IOCTLs
  */
@@ -734,10 +875,17 @@ static int capture_init_format(struct capture_priv *priv)
 	struct imx_media_video_dev *vdev = &priv->vdev;
 	int ret;
 
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
-	if (ret) {
-		dev_err(priv->dev, "failed to get source format\n");
-		return ret;
+	if (priv->legacy_api) {
+		ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL,
+				       &fmt_src);
+		if (ret) {
+			dev_err(priv->dev, "failed to get source format\n");
+			return ret;
+		}
+	} else {
+		fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+		fmt_src.format.width = IMX_MEDIA_DEF_PIX_WIDTH;
+		fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
 	}
 
 	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
@@ -832,7 +980,8 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 		return ERR_PTR(-ENOMEM);
 
 	vfd->fops = &capture_fops;
-	vfd->ioctl_ops = &capture_legacy_ioctl_ops;
+	vfd->ioctl_ops = legacy_api ? &capture_legacy_ioctl_ops
+		       : &capture_ioctl_ops;
 	vfd->minor = -1;
 	vfd->release = video_device_release;
 	vfd->vfl_dir = VFL_DIR_RX;
-- 
Regards,

Laurent Pinchart

