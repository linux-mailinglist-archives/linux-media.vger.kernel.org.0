Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB93432D479
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 14:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241441AbhCDNrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 08:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235437AbhCDNqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 08:46:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1ED3C061760
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 05:45:57 -0800 (PST)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15E88EB;
        Thu,  4 Mar 2021 14:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614865555;
        bh=dOPICapyPT3jiLiGrpjDnMRbAGHHU3DxNJuvBNPZDzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cEuvD+E5ah4rbmkWrIn9hQ3DpaZdfN451kBAHcL1RuztmrkPEn5vhe++AwG2Auy2R
         RAnekXj7oJnCnRQYrAz8EbRG62h5lB8orEMA7m06l+Ckwnlxd3QuRYW/mKBnjq9bj0
         z5gUc4WPUHFm5nqmW21QKIf8iTCNHulRzhUf9CA4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 3/3] media: ti-vpe: cal: Implement media controller centric API
Date:   Thu,  4 Mar 2021 15:45:21 +0200
Message-Id: <20210304134521.1825150-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
References: <20210304134521.1825150-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The CAL driver is video node centric, it controls the whole device
through the video device nodes. This limits the possible use cases as it
can't support sources that are more complex than a single subdev. To
support more complex hardware pipelines, implement support for the media
controller centric API. The exposed API can be selected through a module
parameter.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since v3:

- Add VIDEO_TI_CAL_MC kernel config option
- Set format->colorspace in cal_mc_try_fmt
- Fix typo in comment
- Fix cleanup in cal_start_streaming if media_pipeline_start fails
- Call cal_ctx_v4l2_init_formats when in MC mode

Changes since v1:

- Fix parameter name and description in MODULE_PARM_DESC()

---
 drivers/media/platform/Kconfig               |  14 +
 drivers/media/platform/ti-vpe/cal-camerarx.c |   1 +
 drivers/media/platform/ti-vpe/cal-video.c    | 319 +++++++++++++++----
 drivers/media/platform/ti-vpe/cal.c          |  16 +-
 drivers/media/platform/ti-vpe/cal.h          |   2 +
 5 files changed, 291 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index fd1831e97b22..2ba7413a4f12 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -186,6 +186,20 @@ config VIDEO_TI_CAL
 	  In TI Technical Reference Manual this module is referred as
 	  Camera Interface Subsystem (CAMSS).
 
+if VIDEO_TI_CAL
+
+config VIDEO_TI_CAL_MC
+	bool "Media Controller centric mode by default"
+	default n
+	help
+	  Enables Media Controller centric mode by default.
+
+	  If set, CAL driver will start in Media Controller mode by
+	  default. Note that this behavior can be overridden via
+	  module parameter 'mc_api'.
+
+endif # VIDEO_TI_CAL
+
 endif # V4L_PLATFORM_DRIVERS
 
 menuconfig V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index dd48017859cd..cbe6114908de 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -830,6 +830,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
 	sd->dev = cal->dev;
 
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index dd02af40491f..7e993dab46fb 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -40,7 +40,35 @@ static char *fourcc_to_str(u32 fmt)
 }
 
 /* ------------------------------------------------------------------
- *	V4L2 Video IOCTLs
+ *	V4L2 Common IOCTLs
+ * ------------------------------------------------------------------
+ */
+
+static int cal_querycap(struct file *file, void *priv,
+			struct v4l2_capability *cap)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	strscpy(cap->driver, CAL_MODULE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, CAL_MODULE_NAME, sizeof(cap->card));
+
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", dev_name(ctx->cal->dev));
+	return 0;
+}
+
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
  * ------------------------------------------------------------------
  */
 
@@ -74,19 +102,6 @@ static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
 	return NULL;
 }
 
-static int cal_querycap(struct file *file, void *priv,
-			struct v4l2_capability *cap)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-
-	strscpy(cap->driver, CAL_MODULE_NAME, sizeof(cap->driver));
-	strscpy(cap->card, CAL_MODULE_NAME, sizeof(cap->card));
-
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", dev_name(ctx->cal->dev));
-	return 0;
-}
-
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
@@ -383,16 +388,7 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static const struct v4l2_file_operations cal_fops = {
-	.owner		= THIS_MODULE,
-	.open           = v4l2_fh_open,
-	.release        = vb2_fop_release,
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
@@ -418,7 +414,155 @@ static const struct v4l2_ioctl_ops cal_ioctl_ops = {
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
+	 * Default to the first format if the requested pixel format code isn't
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
+	format->colorspace = ctx->v_fmt.fmt.pix.colorspace;
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
 
@@ -504,6 +648,26 @@ static void cal_release_buffers(struct cal_ctx *ctx,
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
@@ -511,6 +675,23 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma_addr_t addr;
 	int ret;
 
+	ret = media_pipeline_start(&ctx->vdev.entity, &ctx->phy->pipe);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
+		goto error_release_buffers;
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
@@ -526,18 +707,22 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
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
+error_release_buffers:
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
+
 	return ret;
 }
 
@@ -552,6 +737,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	pm_runtime_put_sync(ctx->cal->dev);
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
+
+	media_pipeline_stop(&ctx->vdev.entity);
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -569,13 +756,13 @@ static const struct vb2_ops cal_video_qops = {
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
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
+	.mmap           = vb2_fop_mmap,
 };
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
@@ -654,7 +841,6 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 
 int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 {
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 	struct video_device *vfd = &ctx->vdev;
 	int ret;
 
@@ -662,11 +848,15 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 	if (ret)
 		return ret;
 
-	ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL,
-				    true);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to add sensor ctrl handler\n");
-		return ret;
+	if (!cal_mc_api) {
+		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
+
+		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler,
+					    NULL, true);
+		if (ret < 0) {
+			ctx_err(ctx, "Failed to add sensor ctrl handler\n");
+			return ret;
+		}
 	}
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
@@ -703,7 +893,6 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 
 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 {
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 	struct video_device *vfd = &ctx->vdev;
 	struct vb2_queue *q = &ctx->vb_vidq;
 	int ret;
@@ -730,10 +919,14 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
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
 
@@ -742,14 +935,18 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	if (ret < 0)
 		return ret;
 
-	/* Initialize the control handler. */
-	ret = v4l2_ctrl_handler_init(hdl, 11);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to init ctrl handler\n");
-		goto error;
-	}
+	if (!cal_mc_api) {
+		/* Initialize the control handler. */
+		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 
-	vfd->ctrl_handler = hdl;
+		ret = v4l2_ctrl_handler_init(hdl, 11);
+		if (ret < 0) {
+			ctx_err(ctx, "Failed to init ctrl handler\n");
+			goto error;
+		}
+
+		vfd->ctrl_handler = hdl;
+	}
 
 	return 0;
 
@@ -760,6 +957,8 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 
 void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
 {
-	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	if (!cal_mc_api)
+		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
 	media_entity_cleanup(&ctx->vdev.entity);
 }
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fa0931788040..2e2bef91b2b0 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -43,6 +43,16 @@ unsigned int cal_debug;
 module_param_named(debug, cal_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
+#ifdef CONFIG_VIDEO_TI_CAL_MC
+#define CAL_MC_API_DEFAULT 1
+#else
+#define CAL_MC_API_DEFAULT 0
+#endif
+
+bool cal_mc_api = CAL_MC_API_DEFAULT;
+module_param_named(mc_api, cal_mc_api, bool, 0444);
+MODULE_PARM_DESC(mc_api, "activates the MC API");
+
 /* ------------------------------------------------------------------
  *	Format Handling
  * ------------------------------------------------------------------
@@ -660,13 +670,17 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
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
index d471b7f82519..1b5c88dc0ab0 100644
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
2.25.1

