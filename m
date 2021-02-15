Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCB331B49C
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhBOEcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:32:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhBOEcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:32:12 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1273191F;
        Mon, 15 Feb 2021 05:28:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363305;
        bh=A+dn/WFhxogOr9lToFoMxcMEnrRcCEc4/pmOvd26kOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y5iijtopb/YHtHXHBQUwsldbMQMCvhJvWZ+961zxkAMCYh5mlTxyw5VehhAgeuTTC
         8xtfV8Zm5tFqnUjOntzpInb8fSdqT0stb3Q7x6Tbx0qzHlsEeZYbqhE5A0nmgCNHNa
         7LGKKXKWwRtMWS+XlEdKfKZlMS4NyEBmFFDqrS/s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 19/77] media: imx: capture: Rename ioctl operations with legacy prefix
Date:   Mon, 15 Feb 2021 06:26:43 +0200
Message-Id: <20210215042741.28850-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX media drivers implement a legacy video node API, where the
format of the video node is influenced by the active format of the
connected subdev (both for enumeration and for the get, set and try
format ioctls), and where controls exposed by the subdevs in the
pipeline are inherited by the video node.

At the same time, the drivers implement the media controller API and
expose subdev video nodes to userspace. Those two modes of operation are
incompatible and should not be exposed together. Furthermore, the legacy
API gets in the way of proper enumeration of pixel formats on the video
node, as it prevents compliance with the V4L2 specification.

As a first step towards fixing this, rename all V4L2 video node ioctl
handlers with a legacy prefix. This will allow implementing a new set of
ioctls in parallel and gradually switching drivers. Add a task to the
TODO file for the removal of the legacy API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/TODO                |   9 +-
 drivers/staging/media/imx/imx-media-capture.c | 210 +++++++++---------
 2 files changed, 116 insertions(+), 103 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 9cfc1c1e78dc..2384f4c6b09d 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -17,9 +17,12 @@
 - This media driver supports inheriting V4L2 controls to the
   video capture devices, from the subdevices in the capture device's
   pipeline. The controls for each capture device are updated in the
-  link_notify callback when the pipeline is modified. It should be
-  decided whether this feature is useful enough to make it generally
-  available by exporting to v4l2-core.
+  link_notify callback when the pipeline is modified. This feature should be
+  removed, userspace should use the subdev-based userspace API instead.
+
+- Similarly to the legacy control handling, legacy format handling where
+  formats on the video nodes are influenced by the active format of the
+  connected subdev should be removed.
 
 - i.MX7: all of the above, since it uses the imx media core
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index ed36c28a8b52..483198a5da96 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -52,8 +52,8 @@ struct capture_priv {
 /* In bytes, per queue */
 #define VID_MEM_LIMIT	SZ_64M
 
-/*
- * Video ioctls follow
+/* -----------------------------------------------------------------------------
+ * Common Video IOCTLs
  */
 
 static int capture_querycap(struct file *file, void *fh,
@@ -69,8 +69,52 @@ static int capture_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_enum_framesizes(struct file *file, void *fh,
-				   struct v4l2_frmsizeenum *fsize)
+static int capture_g_fmt_vid_cap(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct capture_priv *priv = video_drvdata(file);
+
+	f->fmt.pix = priv->vdev.fmt;
+
+	return 0;
+}
+
+static int capture_g_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s)
+{
+	struct capture_priv *priv = video_drvdata(file);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		/* The compose rectangle is fixed to the source format. */
+		s->r = priv->vdev.compose;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+		/*
+		 * The hardware writes with a configurable but fixed DMA burst
+		 * size. If the source format width is not burst size aligned,
+		 * the written frame contains padding to the right.
+		 */
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = priv->vdev.fmt.width;
+		s->r.height = priv->vdev.fmt.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Legacy Video IOCTLs
+ */
+
+static int capture_legacy_enum_framesizes(struct file *file, void *fh,
+					  struct v4l2_frmsizeenum *fsize)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	const struct imx_media_pixfmt *cc;
@@ -109,8 +153,8 @@ static int capture_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_enum_frameintervals(struct file *file, void *fh,
-				       struct v4l2_frmivalenum *fival)
+static int capture_legacy_enum_frameintervals(struct file *file, void *fh,
+					      struct v4l2_frmivalenum *fival)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	const struct imx_media_pixfmt *cc;
@@ -140,8 +184,8 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
-				    struct v4l2_fmtdesc *f)
+static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
+					   struct v4l2_fmtdesc *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	const struct imx_media_pixfmt *cc_src;
@@ -184,21 +228,11 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_g_fmt_vid_cap(struct file *file, void *fh,
-				 struct v4l2_format *f)
-{
-	struct capture_priv *priv = video_drvdata(file);
-
-	f->fmt.pix = priv->vdev.fmt;
-
-	return 0;
-}
-
-static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
-				     struct v4l2_subdev_format *fmt_src,
-				     struct v4l2_format *f,
-				     const struct imx_media_pixfmt **retcc,
-				     struct v4l2_rect *compose)
+static int __capture_legacy_try_fmt(struct capture_priv *priv,
+				    struct v4l2_subdev_format *fmt_src,
+				    struct v4l2_format *f,
+				    const struct imx_media_pixfmt **retcc,
+				    struct v4l2_rect *compose)
 {
 	const struct imx_media_pixfmt *cc, *cc_src;
 
@@ -255,8 +289,8 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 	return 0;
 }
 
-static int capture_try_fmt_vid_cap(struct file *file, void *fh,
-				   struct v4l2_format *f)
+static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
+					  struct v4l2_format *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct v4l2_subdev_format fmt_src;
@@ -268,11 +302,11 @@ static int capture_try_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	return __capture_try_fmt_vid_cap(priv, &fmt_src, f, NULL, NULL);
+	return __capture_legacy_try_fmt(priv, &fmt_src, f, NULL, NULL);
 }
 
-static int capture_s_fmt_vid_cap(struct file *file, void *fh,
-				 struct v4l2_format *f)
+static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
+					struct v4l2_format *f)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct v4l2_subdev_format fmt_src;
@@ -289,8 +323,8 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f, &priv->vdev.cc,
-					&priv->vdev.compose);
+	ret = __capture_legacy_try_fmt(priv, &fmt_src, f, &priv->vdev.cc,
+				       &priv->vdev.compose);
 	if (ret)
 		return ret;
 
@@ -299,21 +333,22 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_querystd(struct file *file, void *fh, v4l2_std_id *std)
+static int capture_legacy_querystd(struct file *file, void *fh,
+				   v4l2_std_id *std)
 {
 	struct capture_priv *priv = video_drvdata(file);
 
 	return v4l2_subdev_call(priv->src_sd, video, querystd, std);
 }
 
-static int capture_g_std(struct file *file, void *fh, v4l2_std_id *std)
+static int capture_legacy_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct capture_priv *priv = video_drvdata(file);
 
 	return v4l2_subdev_call(priv->src_sd, video, g_std, std);
 }
 
-static int capture_s_std(struct file *file, void *fh, v4l2_std_id std)
+static int capture_legacy_s_std(struct file *file, void *fh, v4l2_std_id std)
 {
 	struct capture_priv *priv = video_drvdata(file);
 
@@ -323,38 +358,8 @@ static int capture_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return v4l2_subdev_call(priv->src_sd, video, s_std, std);
 }
 
-static int capture_g_selection(struct file *file, void *fh,
-			       struct v4l2_selection *s)
-{
-	struct capture_priv *priv = video_drvdata(file);
-
-	switch (s->target) {
-	case V4L2_SEL_TGT_COMPOSE:
-	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-		/* The compose rectangle is fixed to the source format. */
-		s->r = priv->vdev.compose;
-		break;
-	case V4L2_SEL_TGT_COMPOSE_PADDED:
-		/*
-		 * The hardware writes with a configurable but fixed DMA burst
-		 * size. If the source format width is not burst size aligned,
-		 * the written frame contains padding to the right.
-		 */
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = priv->vdev.fmt.width;
-		s->r.height = priv->vdev.fmt.height;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int capture_g_parm(struct file *file, void *fh,
-			  struct v4l2_streamparm *a)
+static int capture_legacy_g_parm(struct file *file, void *fh,
+				 struct v4l2_streamparm *a)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct v4l2_subdev_frame_interval fi;
@@ -375,8 +380,8 @@ static int capture_g_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_s_parm(struct file *file, void *fh,
-			  struct v4l2_streamparm *a)
+static int capture_legacy_s_parm(struct file *file, void *fh,
+				 struct v4l2_streamparm *a)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct v4l2_subdev_frame_interval fi;
@@ -398,8 +403,8 @@ static int capture_s_parm(struct file *file, void *fh,
 	return 0;
 }
 
-static int capture_subscribe_event(struct v4l2_fh *fh,
-				   const struct v4l2_event_subscription *sub)
+static int capture_legacy_subscribe_event(struct v4l2_fh *fh,
+					  const struct v4l2_event_subscription *sub)
 {
 	switch (sub->type) {
 	case V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR:
@@ -413,42 +418,42 @@ static int capture_subscribe_event(struct v4l2_fh *fh,
 	}
 }
 
-static const struct v4l2_ioctl_ops capture_ioctl_ops = {
-	.vidioc_querycap	= capture_querycap,
+static const struct v4l2_ioctl_ops capture_legacy_ioctl_ops = {
+	.vidioc_querycap		= capture_querycap,
 
-	.vidioc_enum_framesizes = capture_enum_framesizes,
-	.vidioc_enum_frameintervals = capture_enum_frameintervals,
+	.vidioc_enum_framesizes		= capture_legacy_enum_framesizes,
+	.vidioc_enum_frameintervals	= capture_legacy_enum_frameintervals,
 
-	.vidioc_enum_fmt_vid_cap        = capture_enum_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap           = capture_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap         = capture_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap           = capture_s_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap	= capture_legacy_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap		= capture_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= capture_legacy_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= capture_legacy_s_fmt_vid_cap,
 
-	.vidioc_querystd        = capture_querystd,
-	.vidioc_g_std           = capture_g_std,
-	.vidioc_s_std           = capture_s_std,
+	.vidioc_querystd		= capture_legacy_querystd,
+	.vidioc_g_std			= capture_legacy_g_std,
+	.vidioc_s_std			= capture_legacy_s_std,
 
-	.vidioc_g_selection	= capture_g_selection,
+	.vidioc_g_selection		= capture_g_selection,
 
-	.vidioc_g_parm          = capture_g_parm,
-	.vidioc_s_parm          = capture_s_parm,
+	.vidioc_g_parm			= capture_legacy_g_parm,
+	.vidioc_s_parm			= capture_legacy_s_parm,
 
-	.vidioc_reqbufs		= vb2_ioctl_reqbufs,
-	.vidioc_create_bufs     = vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf     = vb2_ioctl_prepare_buf,
-	.vidioc_querybuf	= vb2_ioctl_querybuf,
-	.vidioc_qbuf		= vb2_ioctl_qbuf,
-	.vidioc_dqbuf		= vb2_ioctl_dqbuf,
-	.vidioc_expbuf		= vb2_ioctl_expbuf,
-	.vidioc_streamon	= vb2_ioctl_streamon,
-	.vidioc_streamoff	= vb2_ioctl_streamoff,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
 
-	.vidioc_subscribe_event = capture_subscribe_event,
-	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_subscribe_event		= capture_legacy_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
 
-/*
- * Queue operations
+/* -----------------------------------------------------------------------------
+ * Queue Operations
  */
 
 static int capture_queue_setup(struct vb2_queue *vq,
@@ -540,7 +545,7 @@ static int capture_validate_fmt(struct capture_priv *priv)
 
 	v4l2_fill_pix_format(&f.fmt.pix, &fmt_src.format);
 
-	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, &f, &cc, &compose);
+	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f, &cc, &compose);
 	if (ret)
 		return ret;
 
@@ -616,9 +621,10 @@ static const struct vb2_ops capture_qops = {
 	.stop_streaming  = capture_stop_streaming,
 };
 
-/*
- * File operations
+/* -----------------------------------------------------------------------------
+ * File Operations
  */
+
 static int capture_open(struct file *file)
 {
 	struct capture_priv *priv = video_drvdata(file);
@@ -672,6 +678,10 @@ static const struct v4l2_file_operations capture_fops = {
 	.mmap		= vb2_fop_mmap,
 };
 
+/* -----------------------------------------------------------------------------
+ * Public API
+ */
+
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev)
 {
@@ -815,7 +825,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
 		return ERR_PTR(-ENOMEM);
 
 	vfd->fops = &capture_fops;
-	vfd->ioctl_ops = &capture_ioctl_ops;
+	vfd->ioctl_ops = &capture_legacy_ioctl_ops;
 	vfd->minor = -1;
 	vfd->release = video_device_release;
 	vfd->vfl_dir = VFL_DIR_RX;
-- 
Regards,

Laurent Pinchart

