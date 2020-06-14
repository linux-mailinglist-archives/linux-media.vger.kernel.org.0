Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5796C1F8BD3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgFOACU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728278AbgFOACU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:20 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04F51217C;
        Mon, 15 Jun 2020 02:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179262;
        bh=2Ny57HZ239zxFkItMOl/cXsibYlljNstCvgMbJ+gJSE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FkzsSFKykBNsP+0jZ/12eXRNTXocr56NnayS9Duumn/V3xEomTsdbcsF+dv8vXgUF
         zeUQ0WamY8q+KLM3zy5KUqS4pvxIFQZOeThupK7PeOzr5RgxLDk0yG9o4W3OhoBi9q
         A5neJ/wMQGvsEfILydQo93xbIVjNYSlgLu8aRqLw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 107/107] media: ti-vpe: cal: Implement media controller centric API
Date:   Mon, 15 Jun 2020 02:59:44 +0300
Message-Id: <20200614235944.17716-108-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CAL driver is video node centric, it controls the whole device
through the video device nodes. This limits the possible use cases as it
can't support sources that are more complex than a single subdev. To
support more complex hardware pipelines, implement support for the media
controller centric API. The exposed API can be selected through a module
parameter.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c |   1 +
 drivers/media/platform/ti-vpe/cal-video.c    | 358 ++++++++++++++-----
 drivers/media/platform/ti-vpe/cal.c          |  10 +-
 drivers/media/platform/ti-vpe/cal.h          |   2 +
 4 files changed, 289 insertions(+), 82 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 2e7a3bc716cf..014ca46509db 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -818,6 +818,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
 	sd->dev = cal->dev;
 
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 0f8702bd77db..5f9cd449f027 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -40,40 +40,10 @@ static char *fourcc_to_str(u32 fmt)
 }
 
 /* ------------------------------------------------------------------
- *	V4L2 Video IOCTLs
+ *	V4L2 Common IOCTLs
  * ------------------------------------------------------------------
  */
 
-static const struct cal_format_info *find_format_by_pix(struct cal_ctx *ctx,
-							u32 pixelformat)
-{
-	const struct cal_format_info *fmtinfo;
-	unsigned int k;
-
-	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmtinfo = ctx->active_fmt[k];
-		if (fmtinfo->fourcc == pixelformat)
-			return fmtinfo;
-	}
-
-	return NULL;
-}
-
-static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
-							 u32 code)
-{
-	const struct cal_format_info *fmtinfo;
-	unsigned int k;
-
-	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmtinfo = ctx->active_fmt[k];
-		if (fmtinfo->code == code)
-			return fmtinfo;
-	}
-
-	return NULL;
-}
-
 static int cal_querycap(struct file *file, void *priv,
 			struct v4l2_capability *cap)
 {
@@ -87,6 +57,51 @@ static int cal_querycap(struct file *file, void *priv,
 	return 0;
 }
 
+static int cal_g_fmt_vid_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	*f = ctx->v_fmt;
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------
+ *	V4L2 Video Node Centric IOCTLs
+ * ------------------------------------------------------------------
+ */
+
+static const struct cal_format_info *find_format_by_pix(struct cal_ctx *ctx,
+							u32 pixelformat)
+{
+	const struct cal_format_info *fmtinfo;
+	unsigned int k;
+
+	for (k = 0; k < ctx->num_active_fmt; k++) {
+		fmtinfo = ctx->active_fmt[k];
+		if (fmtinfo->fourcc == pixelformat)
+			return fmtinfo;
+	}
+
+	return NULL;
+}
+
+static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
+							 u32 code)
+{
+	const struct cal_format_info *fmtinfo;
+	unsigned int k;
+
+	for (k = 0; k < ctx->num_active_fmt; k++) {
+		fmtinfo = ctx->active_fmt[k];
+		if (fmtinfo->code == code)
+			return fmtinfo;
+	}
+
+	return NULL;
+}
+
 static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
 				struct v4l2_fmtdesc *f)
 {
@@ -174,16 +189,6 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
 		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 }
 
-static int cal_g_fmt_vid_cap(struct file *file, void *priv,
-			     struct v4l2_format *f)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-
-	*f = ctx->v_fmt;
-
-	return 0;
-}
-
 static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
@@ -383,17 +388,7 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static const struct v4l2_file_operations cal_fops = {
-	.owner		= THIS_MODULE,
-	.open           = v4l2_fh_open,
-	.release        = vb2_fop_release,
-	.read           = vb2_fop_read,
-	.poll		= vb2_fop_poll,
-	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
-	.mmap           = vb2_fop_mmap,
-};
-
-static const struct v4l2_ioctl_ops cal_ioctl_ops = {
+static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
 	.vidioc_querycap      = cal_querycap,
 	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
@@ -419,7 +414,153 @@ static const struct v4l2_ioctl_ops cal_ioctl_ops = {
 };
 
 /* ------------------------------------------------------------------
- *	videobuf2 Operations
+ *	V4L2 Media Controller Centric IOCTLs
+ * ------------------------------------------------------------------
+ */
+
+static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	if (f->index >= cal_num_formats)
+		return -EINVAL;
+
+	f->pixelformat = cal_formats[f->index].fourcc;
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+	return 0;
+}
+
+static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
+			   const struct cal_format_info **info)
+{
+	struct v4l2_pix_format *format = &f->fmt.pix;
+	const struct cal_format_info *fmtinfo;
+	unsigned int bpp;
+
+	/*
+	 * Default to the first format is the requested pixel format code isn't
+	 * supported.
+	 */
+	fmtinfo = cal_format_by_fourcc(f->fmt.pix.pixelformat);
+	if (!fmtinfo)
+		fmtinfo = &cal_formats[0];
+
+	/*
+	 * Clamp the size, update the pixel format. The field and colorspace are
+	 * accepted as-is, except for V4L2_FIELD_ANY that is turned into
+	 * V4L2_FIELD_NONE.
+	 */
+	bpp = ALIGN(fmtinfo->bpp, 8);
+
+	format->width = clamp_t(unsigned int, format->width,
+				CAL_MIN_WIDTH_BYTES * 8 / bpp,
+				CAL_MAX_WIDTH_BYTES * 8 / bpp);
+	format->height = clamp_t(unsigned int, format->height,
+				 CAL_MIN_HEIGHT_LINES, CAL_MAX_HEIGHT_LINES);
+	format->pixelformat = fmtinfo->fourcc;
+
+	if (format->field == V4L2_FIELD_ANY)
+		format->field = V4L2_FIELD_NONE;
+
+	/*
+	 * Calculate the number of bytes per line and the image size. The
+	 * hardware stores the stride as a number of 16 bytes words, in a
+	 * signed 15-bit value. Only 14 bits are thus usable.
+	 */
+	format->bytesperline = ALIGN(clamp(format->bytesperline,
+					   format->width * bpp / 8,
+					   ((1U << 14) - 1) * 16), 16);
+
+	format->sizeimage = format->height * format->bytesperline;
+
+	if (info)
+		*info = fmtinfo;
+
+	ctx_dbg(3, ctx, "%s: %s %ux%u (bytesperline %u sizeimage %u)\n",
+		__func__, fourcc_to_str(format->pixelformat),
+		format->width, format->height,
+		format->bytesperline, format->sizeimage);
+}
+
+static int cal_mc_try_fmt_vid_cap(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	cal_mc_try_fmt(ctx, f, NULL);
+	return 0;
+}
+
+static int cal_mc_s_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	const struct cal_format_info *fmtinfo;
+
+	if (vb2_is_busy(&ctx->vb_vidq)) {
+		ctx_dbg(3, ctx, "%s device busy\n", __func__);
+		return -EBUSY;
+	}
+
+	cal_mc_try_fmt(ctx, f, &fmtinfo);
+
+	ctx->v_fmt = *f;
+	ctx->fmtinfo = fmtinfo;
+
+	return 0;
+}
+
+static int cal_mc_enum_framesizes(struct file *file, void *fh,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	const struct cal_format_info *fmtinfo;
+	unsigned int bpp;
+
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	fmtinfo = cal_format_by_fourcc(fsize->pixel_format);
+	if (!fmtinfo) {
+		ctx_dbg(3, ctx, "Invalid pixel format 0x%08x\n",
+			fsize->pixel_format);
+		return -EINVAL;
+	}
+
+	bpp = ALIGN(fmtinfo->bpp, 8);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = CAL_MIN_WIDTH_BYTES * 8 / bpp;
+	fsize->stepwise.max_width = CAL_MAX_WIDTH_BYTES * 8 / bpp;
+	fsize->stepwise.step_width = 64 / bpp;
+	fsize->stepwise.min_height = CAL_MIN_HEIGHT_LINES;
+	fsize->stepwise.max_height = CAL_MAX_HEIGHT_LINES;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops cal_ioctl_mc_ops = {
+	.vidioc_querycap      = cal_querycap,
+	.vidioc_enum_fmt_vid_cap  = cal_mc_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap   = cal_mc_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap     = cal_mc_s_fmt_vid_cap,
+	.vidioc_enum_framesizes   = cal_mc_enum_framesizes,
+	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf      = vb2_ioctl_querybuf,
+	.vidioc_qbuf          = vb2_ioctl_qbuf,
+	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
+	.vidioc_streamon      = vb2_ioctl_streamon,
+	.vidioc_streamoff     = vb2_ioctl_streamoff,
+	.vidioc_log_status    = v4l2_ctrl_log_status,
+};
+
+/* ------------------------------------------------------------------
+ *	videobuf2 Common Operations
  * ------------------------------------------------------------------
  */
 
@@ -505,6 +646,26 @@ static void cal_release_buffers(struct cal_ctx *ctx,
 	spin_unlock_irq(&ctx->dma.lock);
 }
 
+/* ------------------------------------------------------------------
+ *	videobuf2 Operations
+ * ------------------------------------------------------------------
+ */
+
+static int cal_video_check_format(struct cal_ctx *ctx)
+{
+	const struct v4l2_mbus_framefmt *format;
+
+	format = &ctx->phy->formats[CAL_CAMERARX_PAD_SOURCE];
+
+	if (ctx->fmtinfo->code != format->code ||
+	    ctx->v_fmt.fmt.pix.height != format->height ||
+	    ctx->v_fmt.fmt.pix.width != format->width ||
+	    ctx->v_fmt.fmt.pix.field != format->field)
+		return -EPIPE;
+
+	return 0;
+}
+
 static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
@@ -512,6 +673,23 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma_addr_t addr;
 	int ret;
 
+	ret = media_pipeline_start(&ctx->vdev.entity, &ctx->phy->pipe);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Verify that the currently configured format matches the output of
+	 * the connected CAMERARX.
+	 */
+	ret = cal_video_check_format(ctx);
+	if (ret < 0) {
+		ctx_dbg(3, ctx,
+			"Format mismatch between CAMERARX and video node\n");
+		goto error_pipeline;
+	}
+
 	spin_lock_irq(&ctx->dma.lock);
 	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
 	ctx->dma.pending = buf;
@@ -527,18 +705,21 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
 	if (ret)
-		goto err;
+		goto error_stop;
 
 	if (cal_debug >= 4)
 		cal_quickdump_regs(ctx->cal);
 
 	return 0;
 
-err:
+error_stop:
 	cal_ctx_stop(ctx);
 	pm_runtime_put_sync(ctx->cal->dev);
 
+error_pipeline:
+	media_pipeline_stop(&ctx->vdev.entity);
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
@@ -553,6 +734,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	pm_runtime_put_sync(ctx->cal->dev);
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
+
+	media_pipeline_stop(&ctx->vdev.entity);
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -570,13 +753,14 @@ static const struct vb2_ops cal_video_qops = {
  * ------------------------------------------------------------------
  */
 
-static const struct video_device cal_videodev = {
-	.name		= CAL_MODULE_NAME,
-	.fops		= &cal_fops,
-	.ioctl_ops	= &cal_ioctl_ops,
-	.minor		= -1,
-	.release	= video_device_release_empty,
-	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
+static const struct v4l2_file_operations cal_fops = {
+	.owner		= THIS_MODULE,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.read           = vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
+	.mmap           = vb2_fop_mmap,
 };
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
@@ -650,19 +834,22 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 
 int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 {
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 	struct video_device *vfd = &ctx->vdev;
 	int ret;
 
-	ret = cal_ctx_v4l2_init_formats(ctx);
-	if (ret)
-		return ret;
+	if (!cal_mc_api) {
+		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 
-	ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL,
-				    true);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to add sensor ctrl handler\n");
-		return ret;
+		ret = cal_ctx_v4l2_init_formats(ctx);
+		if (ret)
+			return ret;
+
+		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler,
+					    NULL, true);
+		if (ret < 0) {
+			ctx_err(ctx, "Failed to add sensor ctrl handler\n");
+			return ret;
+		}
 	}
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
@@ -699,7 +886,6 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 
 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 {
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 	struct video_device *vfd = &ctx->vdev;
 	struct vb2_queue *q = &ctx->vb_vidq;
 	int ret;
@@ -726,10 +912,14 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 		return ret;
 
 	/* Initialize the video device and media entity. */
-	*vfd = cal_videodev;
+	vfd->fops = &cal_fops;
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+			 | (cal_mc_api ? V4L2_CAP_IO_MC : 0);
 	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
 	vfd->queue = q;
 	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->index);
+	vfd->release = video_device_release_empty;
+	vfd->ioctl_ops = cal_mc_api ? &cal_ioctl_mc_ops : &cal_ioctl_video_ops;
 	vfd->lock = &ctx->mutex;
 	video_set_drvdata(vfd, ctx);
 
@@ -738,15 +928,19 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	if (ret < 0)
 		return ret;
 
-	/* Initialize the control handler. */
-	ret = v4l2_ctrl_handler_init(hdl, 11);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to init ctrl handler\n");
-		goto error;
+	if (!cal_mc_api) {
+		/* Initialize the control handler. */
+		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
+
+		ret = v4l2_ctrl_handler_init(hdl, 11);
+		if (ret < 0) {
+			ctx_err(ctx, "Failed to init ctrl handler\n");
+			goto error;
+		}
+
+		vfd->ctrl_handler = hdl;
 	}
 
-	vfd->ctrl_handler = hdl;
-
 	return 0;
 
 error:
@@ -756,6 +950,8 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 
 void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
 {
-	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	if (!cal_mc_api)
+		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
 	media_entity_cleanup(&ctx->vdev.entity);
 }
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f97c213f716f..caea3e129c87 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -43,6 +43,10 @@ unsigned int cal_debug;
 module_param_named(debug, cal_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
+bool cal_mc_api;
+module_param_named(mc_api, cal_mc_api, bool, 0444);
+MODULE_PARM_DESC(debug, "activates MC API");
+
 /* ------------------------------------------------------------------
  *	Format Handling
  * ------------------------------------------------------------------
@@ -655,13 +659,17 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
 	unsigned int i;
+	int ret = 0;
 
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 		if (cal->ctx[i])
 			cal_ctx_v4l2_register(cal->ctx[i]);
 	}
 
-	return 0;
+	if (cal_mc_api)
+		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
+
+	return ret;
 }
 
 static const struct v4l2_async_notifier_operations cal_async_notifier_ops = {
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 036b944c3862..f6b4c9a73aab 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -160,6 +160,7 @@ struct cal_camerarx {
 	struct device_node	*sensor_ep_node;
 	struct device_node	*sensor_node;
 	struct v4l2_subdev	*sensor;
+	struct media_pipeline	pipe;
 
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[2];
@@ -224,6 +225,7 @@ struct cal_ctx {
 
 extern unsigned int cal_debug;
 extern int cal_video_nr;
+extern bool cal_mc_api;
 
 #define cal_dbg(level, cal, fmt, arg...)				\
 	do {								\
-- 
Regards,

Laurent Pinchart

