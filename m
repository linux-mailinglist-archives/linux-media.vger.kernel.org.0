Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE257A4D8C
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 17:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjIRPxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 11:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjIRPxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 11:53:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC971706
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 08:51:59 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91CC28822;
        Mon, 18 Sep 2023 16:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695049044;
        bh=D5uJtVIqDOSwRn2ViY6MDf4wbHtzdmOa9RpO9ZkHyn4=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=an80PiZ3DU8mLn+IjaA1hfaigN1FU4cAPivllFEGDbw3BjLMNiNBCIdOjyG8h4DMt
         tfCKA66sXEIujlKvAUCnqMX2MrHifMRFcLC9DXrPvVhsoJSYaohfbLosAxdcm2/Z9l
         +j1n9FkEYZi9in4vJ58BZzJO90uZBjQRVYj3SnoI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Mon, 18 Sep 2023 17:58:25 +0300
Subject: [PATCH v5 2/2] media: ti: cal: Add metadata streams support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230918-cal-streams-v5-2-4851f073f58a@ideasonboard.com>
References: <20230918-cal-streams-v5-0-4851f073f58a@ideasonboard.com>
In-Reply-To: <20230918-cal-streams-v5-0-4851f073f58a@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9346;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=D5uJtVIqDOSwRn2ViY6MDf4wbHtzdmOa9RpO9ZkHyn4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlCGWwRPOW7/lHlSRAn5cwoF2Hl7rZ3ATK0zjEJ
 z2leV46ZM6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZQhlsAAKCRD6PaqMvJYe
 9ZmiEACKsOZzvjc+B/Fa3lcyDLYo37gARCko4wfyEtPoRTAZC3UgOqFnSPdwTQIA694Z22FYiml
 ww2KHJHx631uXJpOIMMtfvRbUUqLGry99BiJBR+Whi0zrj3DCu9SbNX9d3NxPRaAb7MkBWoBrF6
 PBWyNpA32sYsmPkvpvDpLOFRSiPd+tFgIhRU1roWk9UikPeROl78cys7FIhHQVM0rRisPqwDFeQ
 MqnLhlCNvePbCKsHAwo0NyC38Y9TY9fl0AzRsDL0AXq/vq01vjRVK1Pxz3UNYMKMMUmImgEA882
 cdAG1bH7qHpKc/dfbKbVA6k4+MwhoIVQDMJSwTmUYTapZ2SsmB85qTNK1scsPlJDOJeF82bxVlK
 BK7EiDjmSoUUmFZmN7l9DuG9Sitf/As0jDw5N7mrOaXAIftpMqIT89yxVqrYoqht/bvkBmdJfx6
 Z/qt9Q1NSFretdAmHG8mMv/WlbazMzslkH9MKyifSStO/6RE2EHbuA1/esd7LrMRMK6HmaShbAp
 Hi8Il059/sxLmjwDNcQLRtFxswKmmJwxiUNPismI+Gfgb+qGlMZA7LQDWBQ+DIlR4RtP54+++e5
 KejW3UUkdf8Vda12hiLMPY/hQ0fWMntF7C8IBK8TK+kPsot66VmyTqPFrObm1CyebfHMb4t9Xp3
 RWZBi8z36LbfGWg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for metadata streams. As all the video nodes (DMA-engines)
support both video and metadata, we need to change the vb2 queue type
based on what the user wants. This is done in the two v4l2_ioctl_ops:
vidioc_reqbufs and vidioc_create_bufs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-video.c | 187 ++++++++++++++++++++++++++++--
 drivers/media/platform/ti/cal/cal.c       |  15 +++
 drivers/media/platform/ti/cal/cal.h       |   3 +
 3 files changed, 194 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 85638c56953c..ea6f29845324 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -551,6 +551,94 @@ static int cal_mc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
+static int cal_mc_enum_fmt_meta_cap(struct file *file, void  *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	unsigned int i;
+	unsigned int idx;
+
+	if (f->index >= cal_num_formats)
+		return -EINVAL;
+
+	idx = 0;
+
+	for (i = 0; i < cal_num_formats; ++i) {
+		if (!cal_formats[i].meta)
+			continue;
+
+		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
+			continue;
+
+		if (idx == f->index) {
+			f->pixelformat = cal_formats[i].fourcc;
+			f->type = V4L2_BUF_TYPE_META_CAPTURE;
+			return 0;
+		}
+
+		idx++;
+	}
+
+	return -EINVAL;
+}
+
+static int cal_g_fmt_meta_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	*f = ctx->v_meta_fmt;
+
+	return 0;
+}
+
+static void cal_mc_try_fmt_meta(struct cal_ctx *ctx, struct v4l2_format *f,
+			   const struct cal_format_info **info)
+{
+	const struct cal_format_info *fmtinfo;
+
+	fmtinfo = cal_format_by_fourcc(f->fmt.meta.dataformat);
+	if (!fmtinfo || !fmtinfo->meta)
+		fmtinfo = cal_format_by_fourcc(V4L2_META_FMT_GENERIC_8);
+
+	f->fmt.meta.dataformat = fmtinfo->fourcc;
+
+	if (info)
+		*info = fmtinfo;
+
+	ctx_dbg(3, ctx, "%s: %s (buffersize %u)\n",
+		__func__, fourcc_to_str(f->fmt.meta.dataformat),
+		f->fmt.meta.buffersize);
+}
+
+static int cal_mc_try_fmt_meta_cap(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	cal_mc_try_fmt_meta(ctx, f, NULL);
+
+	return 0;
+}
+
+static int cal_mc_s_fmt_meta_cap(struct file *file, void *priv,
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
+	cal_mc_try_fmt_meta(ctx, f, &fmtinfo);
+
+	ctx->v_meta_fmt = *f;
+	ctx->meta_fmtinfo = fmtinfo;
+
+	return 0;
+}
+
 static int cal_mc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
@@ -581,15 +669,57 @@ static int cal_mc_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
+int cal_vb2_ioctl_reqbufs(struct file *file, void *priv,
+			  struct v4l2_requestbuffers *p)
+{
+	struct video_device *vdev = video_devdata(file);
+	int ret;
+
+	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    p->type != V4L2_BUF_TYPE_META_CAPTURE)
+		return -EINVAL;
+
+	ret = vb2_queue_change_type(vdev->queue, p->type);
+	if (ret)
+		return ret;
+
+	return vb2_ioctl_reqbufs(file, priv, p);
+}
+
+int cal_vb2_ioctl_create_bufs(struct file *file, void *priv,
+			  struct v4l2_create_buffers *p)
+{
+	struct video_device *vdev = video_devdata(file);
+	int ret;
+
+	if (p->format.type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    p->format.type != V4L2_BUF_TYPE_META_CAPTURE)
+		return -EINVAL;
+
+	ret = vb2_queue_change_type(vdev->queue, p->format.type);
+	if (ret)
+		return ret;
+
+	return vb2_ioctl_create_bufs(file, priv, p);
+}
+
 static const struct v4l2_ioctl_ops cal_ioctl_mc_ops = {
 	.vidioc_querycap      = cal_querycap,
+
 	.vidioc_enum_fmt_vid_cap  = cal_mc_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap   = cal_mc_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap     = cal_mc_s_fmt_vid_cap,
+
+	.vidioc_enum_fmt_meta_cap  = cal_mc_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap     = cal_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap   = cal_mc_try_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap     = cal_mc_s_fmt_meta_cap,
+
 	.vidioc_enum_framesizes   = cal_mc_enum_framesizes,
-	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
+
+	.vidioc_reqbufs       = cal_vb2_ioctl_reqbufs,
+	.vidioc_create_bufs   = cal_vb2_ioctl_create_bufs,
 	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
 	.vidioc_querybuf      = vb2_ioctl_querybuf,
 	.vidioc_qbuf          = vb2_ioctl_qbuf,
@@ -610,7 +740,12 @@ static int cal_queue_setup(struct vb2_queue *vq,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
+	unsigned int size;
+
+	if (ctx->vb_vidq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = ctx->v_meta_fmt.fmt.meta.buffersize;
+	else
+		size = ctx->v_fmt.fmt.pix.sizeimage;
 
 	if (vq->num_buffers + *nbuffers < 3)
 		*nbuffers = 3 - vq->num_buffers;
@@ -636,7 +771,11 @@ static int cal_buffer_prepare(struct vb2_buffer *vb)
 					      vb.vb2_buf);
 	unsigned long size;
 
-	size = ctx->v_fmt.fmt.pix.sizeimage;
+	if (ctx->vb_vidq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		size = ctx->v_meta_fmt.fmt.meta.buffersize;
+	else
+		size = ctx->v_fmt.fmt.pix.sizeimage;
+
 	if (vb2_plane_size(vb, 0) < size) {
 		ctx_err(ctx,
 			"data will not fit into plane (%lu < %lu)\n",
@@ -712,12 +851,27 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 		goto out;
 	}
 
-	if (ctx->fmtinfo->code != format->code ||
-	    ctx->v_fmt.fmt.pix.height != format->height ||
-	    ctx->v_fmt.fmt.pix.width != format->width ||
-	    ctx->v_fmt.fmt.pix.field != format->field) {
-		ret = -EPIPE;
-		goto out;
+	if (ctx->vb_vidq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		if (ctx->fmtinfo->code != format->code ||
+		    ctx->v_fmt.fmt.pix.height != format->height ||
+		    ctx->v_fmt.fmt.pix.width != format->width ||
+		    ctx->v_fmt.fmt.pix.field != format->field) {
+			ret = -EPIPE;
+			goto out;
+		}
+	} else {
+		const struct cal_format_info *fmtinfo;
+
+		if (ctx->meta_fmtinfo->code != format->code)
+			return -EPIPE;
+
+		fmtinfo = cal_format_by_code(format->code);
+		if (!fmtinfo)
+			return -EPIPE;
+
+		if (ctx->v_meta_fmt.fmt.meta.buffersize !=
+		    format->width * format->height * fmtinfo->bpp / 8)
+			return -EPIPE;
 	}
 
 out:
@@ -936,6 +1090,7 @@ static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
 {
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
+	struct v4l2_meta_format *meta_fmt = &ctx->v_meta_fmt.fmt.meta;
 
 	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_1X16);
 	if (!fmtinfo)
@@ -956,6 +1111,16 @@ static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
 	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 	ctx->fmtinfo = fmtinfo;
 
+	ctx->v_meta_fmt.type = V4L2_BUF_TYPE_META_CAPTURE;
+	meta_fmt->dataformat = V4L2_META_FMT_GENERIC_8;
+	meta_fmt->buffersize = 64;
+
+	fmtinfo = cal_format_by_fourcc(meta_fmt->dataformat);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	ctx->meta_fmtinfo = fmtinfo;
+
 	return 0;
 }
 
@@ -1084,7 +1249,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 
 	/* Initialize the video device and media entity. */
 	vfd->fops = &cal_fops;
-	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING
 			 | (cal_mc_api ? V4L2_CAP_IO_MC : 0);
 	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
 	vfd->queue = q;
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 1883f9a50f2a..43750739b7fd 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -127,6 +127,21 @@ const struct cal_format_info cal_formats[] = {
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_META_FMT_GENERIC_8,
+		.code		= MEDIA_BUS_FMT_META_8,
+		.bpp		= 8,
+		.meta		= true,
+	}, {
+		.fourcc		= V4L2_META_FMT_GENERIC_CSI2_10,
+		.code		= MEDIA_BUS_FMT_META_10,
+		.bpp		= 10,
+		.meta		= true,
+	}, {
+		.fourcc		= V4L2_META_FMT_GENERIC_CSI2_12,
+		.code		= MEDIA_BUS_FMT_META_12,
+		.bpp		= 12,
+		.meta		= true,
 	},
 };
 
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index 44ee0bece56e..05b27c496131 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -235,6 +235,9 @@ struct cal_ctx {
 	/* Used to store current pixel format */
 	struct v4l2_format	v_fmt;
 
+	const struct cal_format_info	*meta_fmtinfo;
+	struct v4l2_format	v_meta_fmt;
+
 	/* Current subdev enumerated format (legacy) */
 	const struct cal_format_info	**active_fmt;
 	unsigned int		num_active_fmt;

-- 
2.34.1

