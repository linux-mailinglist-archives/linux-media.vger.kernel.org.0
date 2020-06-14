Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A977A1F8BBA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgFOABv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgFOABu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:50 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8D8C2168;
        Mon, 15 Jun 2020 02:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179249;
        bh=aIEEm8eG1ITr/gA9EXEL9oNpjZSDJT9L17VmPlr+KUQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FdKQYDZyKo2gYChjK8qxrElenpE+aCEVr2BEvERt8TWh/CXlUnJDCIDisVrPE325T
         K6JINHGrsf+GuConQe3ovJPqQXBAhtYGNAhceWwZFbGWiacZ3K6hSOaiDWL2swDRlN
         uAW0jMopCbGhRIpK7DRggM9LCq5b5/g8jknmWyyY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 081/107] media: ti-vpe: cal: Split video node handling to cal-video.c
Date:   Mon, 15 Jun 2020 02:59:18 +0300
Message-Id: <20200614235944.17716-82-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for implementation of media controller centric device
configuration, move all the video node handling support to a separate
file.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/Makefile    |    2 +-
 drivers/media/platform/ti-vpe/cal-video.c |  887 +++++++++++++++++
 drivers/media/platform/ti-vpe/cal.c       | 1085 +--------------------
 drivers/media/platform/ti-vpe/cal.h       |  226 +++++
 4 files changed, 1137 insertions(+), 1063 deletions(-)
 create mode 100644 drivers/media/platform/ti-vpe/cal-video.c
 create mode 100644 drivers/media/platform/ti-vpe/cal.h

diff --git a/drivers/media/platform/ti-vpe/Makefile b/drivers/media/platform/ti-vpe/Makefile
index 886ac5ec073f..a7bf8f2a1386 100644
--- a/drivers/media/platform/ti-vpe/Makefile
+++ b/drivers/media/platform/ti-vpe/Makefile
@@ -13,4 +13,4 @@ ccflags-$(CONFIG_VIDEO_TI_VPE_DEBUG) += -DDEBUG
 
 obj-$(CONFIG_VIDEO_TI_CAL) += ti-cal.o
 
-ti-cal-y := cal.o
+ti-cal-y := cal.o cal-video.o
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
new file mode 100644
index 000000000000..82b32a2f9db5
--- /dev/null
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -0,0 +1,887 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI Camera Access Layer (CAL) - Video Device
+ *
+ * Copyright (c) 2015-2020 Texas Instruments Inc.
+ *
+ * Authors:
+ *	Benoit Parrot <bparrot@ti.com>
+ *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/ioctl.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "cal.h"
+
+/* ------------------------------------------------------------------
+ *	Format Handling
+ * ------------------------------------------------------------------
+ */
+
+static const struct cal_fmt cal_formats[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
+		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
+		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
+		.code		= MEDIA_BUS_FMT_RGB888_2X12_LE,
+		.bpp		= 24,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
+		.code		= MEDIA_BUS_FMT_RGB888_2X12_BE,
+		.bpp		= 24,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
+		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
+		.bpp		= 32,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.bpp		= 8,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR10,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG10,
+		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG10,
+		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB10,
+		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp		= 10,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SBGGR12,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGBRG12,
+		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SGRBG12,
+		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bpp		= 12,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_SRGGB12,
+		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp		= 12,
+	},
+};
+
+/*  Print Four-character-code (FOURCC) */
+static char *fourcc_to_str(u32 fmt)
+{
+	static char code[5];
+
+	code[0] = (unsigned char)(fmt & 0xff);
+	code[1] = (unsigned char)((fmt >> 8) & 0xff);
+	code[2] = (unsigned char)((fmt >> 16) & 0xff);
+	code[3] = (unsigned char)((fmt >> 24) & 0xff);
+	code[4] = '\0';
+
+	return code;
+}
+
+/* ------------------------------------------------------------------
+ *	V4L2 Video IOCTLs
+ * ------------------------------------------------------------------
+ */
+
+static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
+						u32 pixelformat)
+{
+	const struct cal_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < ctx->num_active_fmt; k++) {
+		fmt = ctx->active_fmt[k];
+		if (fmt->fourcc == pixelformat)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
+						 u32 code)
+{
+	const struct cal_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < ctx->num_active_fmt; k++) {
+		fmt = ctx->active_fmt[k];
+		if (fmt->code == code)
+			return fmt;
+	}
+
+	return NULL;
+}
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
+static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
+				struct v4l2_fmtdesc *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	const struct cal_fmt *fmt;
+
+	if (f->index >= ctx->num_active_fmt)
+		return -EINVAL;
+
+	fmt = ctx->active_fmt[f->index];
+
+	f->pixelformat = fmt->fourcc;
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	return 0;
+}
+
+static int __subdev_get_format(struct cal_ctx *ctx,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_subdev_format sd_fmt;
+	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	int ret;
+
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt.pad = 0;
+
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, get_fmt, NULL, &sd_fmt);
+	if (ret)
+		return ret;
+
+	*fmt = *mbus_fmt;
+
+	ctx_dbg(1, ctx, "%s %dx%d code:%04X\n", __func__,
+		fmt->width, fmt->height, fmt->code);
+
+	return 0;
+}
+
+static int __subdev_set_format(struct cal_ctx *ctx,
+			       struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_subdev_format sd_fmt;
+	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	int ret;
+
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt.pad = 0;
+	*mbus_fmt = *fmt;
+
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, set_fmt, NULL, &sd_fmt);
+	if (ret)
+		return ret;
+
+	ctx_dbg(1, ctx, "%s %dx%d code:%04X\n", __func__,
+		fmt->width, fmt->height, fmt->code);
+
+	return 0;
+}
+
+static int cal_calc_format_size(struct cal_ctx *ctx,
+				const struct cal_fmt *fmt,
+				struct v4l2_format *f)
+{
+	u32 bpl, max_width;
+
+	if (!fmt) {
+		ctx_dbg(3, ctx, "No cal_fmt provided!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Maximum width is bound by the DMA max width in bytes.
+	 * We need to recalculate the actual maxi width depending on the
+	 * number of bytes per pixels required.
+	 */
+	max_width = MAX_WIDTH_BYTES / (ALIGN(fmt->bpp, 8) >> 3);
+	v4l_bound_align_image(&f->fmt.pix.width, 48, max_width, 2,
+			      &f->fmt.pix.height, 32, MAX_HEIGHT_LINES, 0, 0);
+
+	bpl = (f->fmt.pix.width * ALIGN(fmt->bpp, 8)) >> 3;
+	f->fmt.pix.bytesperline = ALIGN(bpl, 16);
+
+	f->fmt.pix.sizeimage = f->fmt.pix.height *
+			       f->fmt.pix.bytesperline;
+
+	ctx_dbg(3, ctx, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
+		__func__, fourcc_to_str(f->fmt.pix.pixelformat),
+		f->fmt.pix.width, f->fmt.pix.height,
+		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
+
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
+static int cal_try_fmt_vid_cap(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	const struct cal_fmt *fmt;
+	struct v4l2_subdev_frame_size_enum fse;
+	int ret, found;
+
+	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
+	if (!fmt) {
+		ctx_dbg(3, ctx, "Fourcc format (0x%08x) not found.\n",
+			f->fmt.pix.pixelformat);
+
+		/* Just get the first one enumerated */
+		fmt = ctx->active_fmt[0];
+		f->fmt.pix.pixelformat = fmt->fourcc;
+	}
+
+	f->fmt.pix.field = ctx->v_fmt.fmt.pix.field;
+
+	/* check for/find a valid width/height */
+	ret = 0;
+	found = false;
+	fse.pad = 0;
+	fse.code = fmt->code;
+	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	for (fse.index = 0; ; fse.index++) {
+		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size,
+				       NULL, &fse);
+		if (ret)
+			break;
+
+		if ((f->fmt.pix.width == fse.max_width) &&
+		    (f->fmt.pix.height == fse.max_height)) {
+			found = true;
+			break;
+		} else if ((f->fmt.pix.width >= fse.min_width) &&
+			 (f->fmt.pix.width <= fse.max_width) &&
+			 (f->fmt.pix.height >= fse.min_height) &&
+			 (f->fmt.pix.height <= fse.max_height)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		/* use existing values as default */
+		f->fmt.pix.width = ctx->v_fmt.fmt.pix.width;
+		f->fmt.pix.height =  ctx->v_fmt.fmt.pix.height;
+	}
+
+	/*
+	 * Use current colorspace for now, it will get
+	 * updated properly during s_fmt
+	 */
+	f->fmt.pix.colorspace = ctx->v_fmt.fmt.pix.colorspace;
+	return cal_calc_format_size(ctx, fmt, f);
+}
+
+static int cal_s_fmt_vid_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	struct vb2_queue *q = &ctx->vb_vidq;
+	const struct cal_fmt *fmt;
+	struct v4l2_mbus_framefmt mbus_fmt;
+	int ret;
+
+	if (vb2_is_busy(q)) {
+		ctx_dbg(3, ctx, "%s device busy\n", __func__);
+		return -EBUSY;
+	}
+
+	ret = cal_try_fmt_vid_cap(file, priv, f);
+	if (ret < 0)
+		return ret;
+
+	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
+
+	v4l2_fill_mbus_format(&mbus_fmt, &f->fmt.pix, fmt->code);
+
+	ret = __subdev_set_format(ctx, &mbus_fmt);
+	if (ret)
+		return ret;
+
+	/* Just double check nothing has gone wrong */
+	if (mbus_fmt.code != fmt->code) {
+		ctx_dbg(3, ctx,
+			"%s subdev changed format on us, this should not happen\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
+	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
+	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
+	ctx->fmt = fmt;
+	ctx->m_fmt = mbus_fmt;
+	*f = ctx->v_fmt;
+
+	return 0;
+}
+
+static int cal_enum_framesizes(struct file *file, void *fh,
+			       struct v4l2_frmsizeenum *fsize)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	const struct cal_fmt *fmt;
+	struct v4l2_subdev_frame_size_enum fse;
+	int ret;
+
+	/* check for valid format */
+	fmt = find_format_by_pix(ctx, fsize->pixel_format);
+	if (!fmt) {
+		ctx_dbg(3, ctx, "Invalid pixel code: %x\n",
+			fsize->pixel_format);
+		return -EINVAL;
+	}
+
+	fse.index = fsize->index;
+	fse.pad = 0;
+	fse.code = fmt->code;
+	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size, NULL,
+			       &fse);
+	if (ret)
+		return ret;
+
+	ctx_dbg(1, ctx, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
+		__func__, fse.index, fse.code, fse.min_width, fse.max_width,
+		fse.min_height, fse.max_height);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = fse.max_width;
+	fsize->discrete.height = fse.max_height;
+
+	return 0;
+}
+
+static int cal_enum_input(struct file *file, void *priv,
+			  struct v4l2_input *inp)
+{
+	if (inp->index > 0)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	sprintf(inp->name, "Camera %u", inp->index);
+	return 0;
+}
+
+static int cal_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int cal_s_input(struct file *file, void *priv, unsigned int i)
+{
+	return i > 0 ? -EINVAL : 0;
+}
+
+/* timeperframe is arbitrary and continuous */
+static int cal_enum_frameintervals(struct file *file, void *priv,
+				   struct v4l2_frmivalenum *fival)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+	const struct cal_fmt *fmt;
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.index = fival->index,
+		.width = fival->width,
+		.height = fival->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	fmt = find_format_by_pix(ctx, fival->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fie.code = fmt->code;
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_interval,
+			       NULL, &fie);
+	if (ret)
+		return ret;
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = fie.interval;
+
+	return 0;
+}
+
+static const struct v4l2_file_operations cal_fops = {
+	.owner		= THIS_MODULE,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.read           = vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
+	.mmap           = vb2_fop_mmap,
+};
+
+static const struct v4l2_ioctl_ops cal_ioctl_ops = {
+	.vidioc_querycap      = cal_querycap,
+	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
+	.vidioc_enum_framesizes   = cal_enum_framesizes,
+	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf      = vb2_ioctl_querybuf,
+	.vidioc_qbuf          = vb2_ioctl_qbuf,
+	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
+	.vidioc_enum_input    = cal_enum_input,
+	.vidioc_g_input       = cal_g_input,
+	.vidioc_s_input       = cal_s_input,
+	.vidioc_enum_frameintervals = cal_enum_frameintervals,
+	.vidioc_streamon      = vb2_ioctl_streamon,
+	.vidioc_streamoff     = vb2_ioctl_streamoff,
+	.vidioc_log_status    = v4l2_ctrl_log_status,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+/* ------------------------------------------------------------------
+ *	videobuf2 Operations
+ * ------------------------------------------------------------------
+ */
+
+static int cal_queue_setup(struct vb2_queue *vq,
+			   unsigned int *nbuffers, unsigned int *nplanes,
+			   unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
+
+	if (vq->num_buffers + *nbuffers < 3)
+		*nbuffers = 3 - vq->num_buffers;
+
+	if (*nplanes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+		size = sizes[0];
+	}
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	ctx_dbg(3, ctx, "nbuffers=%d, size=%d\n", *nbuffers, sizes[0]);
+
+	return 0;
+}
+
+static int cal_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct cal_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct cal_buffer *buf = container_of(vb, struct cal_buffer,
+					      vb.vb2_buf);
+	unsigned long size;
+
+	if (WARN_ON(!ctx->fmt))
+		return -EINVAL;
+
+	size = ctx->v_fmt.fmt.pix.sizeimage;
+	if (vb2_plane_size(vb, 0) < size) {
+		ctx_err(ctx,
+			"data will not fit into plane (%lu < %lu)\n",
+			vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
+	return 0;
+}
+
+static void cal_buffer_queue(struct vb2_buffer *vb)
+{
+	struct cal_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct cal_buffer *buf = container_of(vb, struct cal_buffer,
+					      vb.vb2_buf);
+	struct cal_dmaqueue *vidq = &ctx->vidq;
+	unsigned long flags;
+
+	/* recheck locking */
+	spin_lock_irqsave(&ctx->slock, flags);
+	list_add_tail(&buf->list, &vidq->active);
+	spin_unlock_irqrestore(&ctx->slock, flags);
+}
+
+static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	struct cal_dmaqueue *dma_q = &ctx->vidq;
+	struct cal_buffer *buf, *tmp;
+	unsigned long addr;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ctx->slock, flags);
+	if (list_empty(&dma_q->active)) {
+		spin_unlock_irqrestore(&ctx->slock, flags);
+		ctx_dbg(3, ctx, "buffer queue is empty\n");
+		return -EIO;
+	}
+
+	buf = list_entry(dma_q->active.next, struct cal_buffer, list);
+	ctx->cur_frm = buf;
+	ctx->next_frm = buf;
+	list_del(&buf->list);
+	spin_unlock_irqrestore(&ctx->slock, flags);
+
+	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
+	ctx->sequence = 0;
+
+	pm_runtime_get_sync(ctx->cal->dev);
+
+	cal_ctx_csi2_config(ctx);
+	cal_ctx_pix_proc_config(ctx);
+	cal_ctx_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
+			      ctx->v_fmt.fmt.pix.height);
+
+	cal_camerarx_enable_irqs(ctx->phy);
+
+	ret = cal_camerarx_start(ctx->phy, ctx->fmt);
+	if (ret)
+		goto err;
+
+	cal_ctx_wr_dma_addr(ctx, addr);
+	cal_camerarx_ppi_enable(ctx->phy);
+
+	if (cal_debug >= 4)
+		cal_quickdump_regs(ctx->cal);
+
+	return 0;
+
+err:
+	spin_lock_irqsave(&ctx->slock, flags);
+	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	ctx->cur_frm = NULL;
+	ctx->next_frm = NULL;
+	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	spin_unlock_irqrestore(&ctx->slock, flags);
+	return ret;
+}
+
+static void cal_stop_streaming(struct vb2_queue *vq)
+{
+	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	struct cal_dmaqueue *dma_q = &ctx->vidq;
+	struct cal_buffer *buf, *tmp;
+	unsigned long timeout;
+	unsigned long flags;
+	bool dma_act;
+
+	cal_camerarx_ppi_disable(ctx->phy);
+
+	/* wait for stream and dma to finish */
+	dma_act = true;
+	timeout = jiffies + msecs_to_jiffies(500);
+	while (dma_act && time_before(jiffies, timeout)) {
+		msleep(50);
+
+		spin_lock_irqsave(&ctx->slock, flags);
+		dma_act = ctx->dma_act;
+		spin_unlock_irqrestore(&ctx->slock, flags);
+	}
+
+	if (dma_act)
+		ctx_err(ctx, "failed to disable dma cleanly\n");
+
+	cal_camerarx_disable_irqs(ctx->phy);
+	cal_camerarx_stop(ctx->phy);
+
+	/* Release all active buffers */
+	spin_lock_irqsave(&ctx->slock, flags);
+	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+
+	if (ctx->cur_frm == ctx->next_frm) {
+		vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	} else {
+		vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&ctx->next_frm->vb.vb2_buf,
+				VB2_BUF_STATE_ERROR);
+	}
+	ctx->cur_frm = NULL;
+	ctx->next_frm = NULL;
+	spin_unlock_irqrestore(&ctx->slock, flags);
+
+	pm_runtime_put_sync(ctx->cal->dev);
+}
+
+static const struct vb2_ops cal_video_qops = {
+	.queue_setup		= cal_queue_setup,
+	.buf_prepare		= cal_buffer_prepare,
+	.buf_queue		= cal_buffer_queue,
+	.start_streaming	= cal_start_streaming,
+	.stop_streaming		= cal_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+/* ------------------------------------------------------------------
+ *	V4L2 Initialization and Registration
+ * ------------------------------------------------------------------
+ */
+
+static const struct video_device cal_videodev = {
+	.name		= CAL_MODULE_NAME,
+	.fops		= &cal_fops,
+	.ioctl_ops	= &cal_ioctl_ops,
+	.minor		= -1,
+	.release	= video_device_release_empty,
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			  V4L2_CAP_READWRITE,
+};
+
+static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
+{
+	struct v4l2_subdev_mbus_code_enum mbus_code;
+	struct v4l2_mbus_framefmt mbus_fmt;
+	const struct cal_fmt *fmt;
+	unsigned int i, j, k;
+	int ret = 0;
+
+	/* Enumerate sub device formats and enable all matching local formats */
+	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, ARRAY_SIZE(cal_formats),
+				       sizeof(*ctx->active_fmt), GFP_KERNEL);
+	ctx->num_active_fmt = 0;
+
+	for (j = 0, i = 0; ret != -EINVAL; ++j) {
+
+		memset(&mbus_code, 0, sizeof(mbus_code));
+		mbus_code.index = j;
+		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_mbus_code,
+				       NULL, &mbus_code);
+		if (ret)
+			continue;
+
+		ctx_dbg(2, ctx,
+			"subdev %s: code: %04x idx: %u\n",
+			ctx->phy->sensor->name, mbus_code.code, j);
+
+		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
+			const struct cal_fmt *fmt = &cal_formats[k];
+
+			if (mbus_code.code == fmt->code) {
+				ctx->active_fmt[i] = fmt;
+				ctx_dbg(2, ctx,
+					"matched fourcc: %s: code: %04x idx: %u\n",
+					fourcc_to_str(fmt->fourcc),
+					fmt->code, i);
+				ctx->num_active_fmt = ++i;
+			}
+		}
+	}
+
+	if (i == 0) {
+		ctx_err(ctx, "No suitable format reported by subdev %s\n",
+			ctx->phy->sensor->name);
+		return -EINVAL;
+	}
+
+	ret = __subdev_get_format(ctx, &mbus_fmt);
+	if (ret)
+		return ret;
+
+	fmt = find_format_by_code(ctx, mbus_fmt.code);
+	if (!fmt) {
+		ctx_dbg(3, ctx, "mbus code format (0x%08x) not found.\n",
+			mbus_fmt.code);
+		return -EINVAL;
+	}
+
+	/* Save current subdev format */
+	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
+	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
+	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
+	ctx->fmt = fmt;
+	ctx->m_fmt = mbus_fmt;
+
+	return 0;
+}
+
+int cal_ctx_v4l2_register(struct cal_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
+	struct video_device *vfd = &ctx->vdev;
+	int ret;
+
+	ret = cal_ctx_v4l2_init_formats(ctx);
+	if (ret)
+		return ret;
+
+	ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL,
+				    true);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to add sensor ctrl handler\n");
+		return ret;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to register video device\n");
+		return ret;
+	}
+
+	ctx_info(ctx, "V4L2 device registered as %s\n",
+		 video_device_node_name(vfd));
+
+	return 0;
+}
+
+void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
+{
+	ctx_dbg(1, ctx, "unregistering %s\n",
+		video_device_node_name(&ctx->vdev));
+
+	video_unregister_device(&ctx->vdev);
+}
+
+int cal_ctx_v4l2_init(struct cal_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
+	struct video_device *vfd = &ctx->vdev;
+	struct vb2_queue *q = &ctx->vb_vidq;
+	int ret;
+
+	INIT_LIST_HEAD(&ctx->vidq.active);
+	spin_lock_init(&ctx->slock);
+	mutex_init(&ctx->mutex);
+
+	/* Initialize the vb2 queue. */
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = ctx;
+	q->buf_struct_size = sizeof(struct cal_buffer);
+	q->ops = &cal_video_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &ctx->mutex;
+	q->min_buffers_needed = 3;
+	q->dev = ctx->cal->dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+
+	/* Initialize the video device and media entity. */
+	*vfd = cal_videodev;
+	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
+	vfd->queue = q;
+	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->index);
+	vfd->lock = &ctx->mutex;
+	video_set_drvdata(vfd, ctx);
+
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vfd->entity, 1, &ctx->pad);
+	if (ret < 0)
+		return ret;
+
+	/* Initialize the control handler. */
+	ret = v4l2_ctrl_handler_init(hdl, 11);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to init ctrl handler\n");
+		goto error;
+	}
+
+	vfd->ctrl_handler = hdl;
+
+	return 0;
+
+error:
+	media_entity_cleanup(&vfd->entity);
+	return ret;
+}
+
+void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
+{
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	media_entity_cleanup(&ctx->vdev.entity);
+}
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b67e59a4eedd..0bc02ba52b59 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * TI CAL camera interface driver
+ * TI Camera Access Layer (CAL) - Driver
  *
- * Copyright (c) 2015 Texas Instruments Inc.
- * Benoit Parrot, <bparrot@ti.com>
+ * Copyright (c) 2015-2020 Texas Instruments Inc.
+ *
+ * Authors:
+ *	Benoit Parrot <bparrot@ti.com>
+ *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
 #include <linux/bitfield.h>
@@ -11,7 +14,6 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/ioctl.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -27,319 +29,26 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
-#include <media/v4l2-fh.h>
 #include <media/v4l2-fwnode.h>
-#include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "cal.h"
 #include "cal_regs.h"
 
-#define CAL_MODULE_NAME "cal"
-
 MODULE_DESCRIPTION("TI CAL driver");
 MODULE_AUTHOR("Benoit Parrot, <bparrot@ti.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_VERSION("0.1.0");
 
-static unsigned video_nr = -1;
-module_param(video_nr, uint, 0644);
+int cal_video_nr = -1;
+module_param_named(video_nr, cal_video_nr, uint, 0644);
 MODULE_PARM_DESC(video_nr, "videoX start number, -1 is autodetect");
 
-static unsigned debug;
-module_param(debug, uint, 0644);
+unsigned int cal_debug;
+module_param_named(debug, cal_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
-#define cal_dbg(level, cal, fmt, arg...)				\
-	do {								\
-		if (debug >= (level))					\
-			dev_dbg((cal)->dev, fmt, ##arg);		\
-	} while (0)
-#define cal_info(cal, fmt, arg...)	\
-	dev_info((cal)->dev, fmt, ##arg)
-#define cal_err(cal, fmt, arg...)	\
-	dev_err((cal)->dev, fmt, ##arg)
-
-#define ctx_dbg(level, ctx, fmt, arg...)	\
-	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
-#define ctx_info(ctx, fmt, arg...)	\
-	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
-#define ctx_err(ctx, fmt, arg...)	\
-	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
-
-#define phy_dbg(level, phy, fmt, arg...)	\
-	cal_dbg(level, (phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
-#define phy_info(phy, fmt, arg...)	\
-	cal_info((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
-#define phy_err(phy, fmt, arg...)	\
-	cal_err((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
-
-#define CAL_NUM_CONTEXT			2
-#define CAL_NUM_CSI2_PORTS		2
-
-#define MAX_WIDTH_BYTES			(8192 * 8)
-#define MAX_HEIGHT_LINES		16383
-
-/* ------------------------------------------------------------------
- *	Format Handling
- * ------------------------------------------------------------------
- */
-
-struct cal_fmt {
-	u32	fourcc;
-	u32	code;
-	/* Bits per pixel */
-	u8	bpp;
-};
-
-static const struct cal_fmt cal_formats[] = {
-	{
-		.fourcc		= V4L2_PIX_FMT_YUYV,
-		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_UYVY,
-		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_YVYU,
-		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_VYUY,
-		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
-		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
-		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
-		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
-		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
-		.bpp		= 16,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
-		.code		= MEDIA_BUS_FMT_RGB888_2X12_LE,
-		.bpp		= 24,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
-		.code		= MEDIA_BUS_FMT_RGB888_2X12_BE,
-		.bpp		= 24,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
-		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
-		.bpp		= 32,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SBGGR8,
-		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGBRG8,
-		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGRBG8,
-		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SRGGB8,
-		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.bpp		= 8,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SBGGR10,
-		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGBRG10,
-		.code		= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGRBG10,
-		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SRGGB10,
-		.code		= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.bpp		= 10,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SBGGR12,
-		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.bpp		= 12,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGBRG12,
-		.code		= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.bpp		= 12,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SGRBG12,
-		.code		= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.bpp		= 12,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_SRGGB12,
-		.code		= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.bpp		= 12,
-	},
-};
-
-/*  Print Four-character-code (FOURCC) */
-static char *fourcc_to_str(u32 fmt)
-{
-	static char code[5];
-
-	code[0] = (unsigned char)(fmt & 0xff);
-	code[1] = (unsigned char)((fmt >> 8) & 0xff);
-	code[2] = (unsigned char)((fmt >> 16) & 0xff);
-	code[3] = (unsigned char)((fmt >> 24) & 0xff);
-	code[4] = '\0';
-
-	return code;
-}
-
-/* ------------------------------------------------------------------
- *	Driver Structures
- * ------------------------------------------------------------------
- */
-
-/* buffer for one video frame */
-struct cal_buffer {
-	/* common v4l buffer stuff -- must be first */
-	struct vb2_v4l2_buffer	vb;
-	struct list_head	list;
-};
-
-struct cal_dmaqueue {
-	struct list_head	active;
-};
-
-/* CTRL_CORE_CAMERRX_CONTROL register field id */
-enum cal_camerarx_field {
-	F_CTRLCLKEN,
-	F_CAMMODE,
-	F_LANEENABLE,
-	F_CSI_MODE,
-
-	F_MAX_FIELDS,
-};
-
-struct cal_camerarx_data {
-	struct {
-		unsigned int lsb;
-		unsigned int msb;
-	} fields[F_MAX_FIELDS];
-	unsigned int num_lanes;
-};
-
-struct cal_data {
-	const struct cal_camerarx_data *camerarx;
-	unsigned int num_csi2_phy;
-	unsigned int flags;
-};
-
-/*
- * The Camera Adaptation Layer (CAL) module is paired with one or more complex
- * I/O PHYs (CAMERARX). It contains multiple instances of CSI-2, processing and
- * DMA contexts.
- *
- * The cal_dev structure represents the whole subsystem, including the CAL and
- * the CAMERARX instances. Instances of struct cal_dev are named cal through the
- * driver.
- *
- * The cal_camerarx structure represents one CAMERARX instance. Instances of
- * cal_camerarx are named phy through the driver.
- *
- * The cal_ctx structure represents the combination of one CSI-2 context, one
- * processing context and one DMA context. Instance of struct cal_ctx are named
- * ctx through the driver.
- */
-
-struct cal_camerarx {
-	void __iomem		*base;
-	struct resource		*res;
-	struct device		*dev;
-	struct regmap_field	*fields[F_MAX_FIELDS];
-
-	struct cal_dev		*cal;
-	unsigned int		instance;
-
-	struct v4l2_fwnode_endpoint	endpoint;
-	struct device_node	*sensor_node;
-	struct v4l2_subdev	*sensor;
-};
-
-struct cal_dev {
-	struct clk		*fclk;
-	int			irq;
-	void __iomem		*base;
-	struct resource		*res;
-	struct device		*dev;
-
-	const struct cal_data	*data;
-	u32			revision;
-
-	/* Control Module handle */
-	struct regmap		*syscon_camerrx;
-	u32			syscon_camerrx_offset;
-
-	/* Camera Core Module handle */
-	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
-
-	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
-
-	struct media_device	mdev;
-	struct v4l2_device	v4l2_dev;
-	struct v4l2_async_notifier notifier;
-};
-
-/*
- * There is one cal_ctx structure for each camera core context.
- */
-struct cal_ctx {
-	struct v4l2_ctrl_handler ctrl_handler;
-	struct video_device	vdev;
-	struct media_pad	pad;
-
-	struct cal_dev		*cal;
-	struct cal_camerarx	*phy;
-
-	/* v4l2_ioctl mutex */
-	struct mutex		mutex;
-	/* v4l2 buffers lock */
-	spinlock_t		slock;
-
-	struct cal_dmaqueue	vidq;
-
-	/* video capture */
-	const struct cal_fmt	*fmt;
-	/* Used to store current pixel format */
-	struct v4l2_format		v_fmt;
-	/* Used to store current mbus frame format */
-	struct v4l2_mbus_framefmt	m_fmt;
-
-	/* Current subdev enumerated format */
-	const struct cal_fmt	**active_fmt;
-	unsigned int		num_active_fmt;
-
-	unsigned int		sequence;
-	struct vb2_queue	vb_vidq;
-	unsigned int		index;
-	unsigned int		cport;
-
-	/* Pointer pointing to current v4l2_buffer */
-	struct cal_buffer	*cur_frm;
-	/* Pointer pointing to next v4l2_buffer */
-	struct cal_buffer	*next_frm;
-
-	bool dma_act;
-};
-
 /* ------------------------------------------------------------------
  *	Platform Data
  * ------------------------------------------------------------------
@@ -451,7 +160,7 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 	*valp = val;
 }
 
-static void cal_quickdump_regs(struct cal_dev *cal)
+void cal_quickdump_regs(struct cal_dev *cal)
 {
 	unsigned int i;
 
@@ -661,8 +370,7 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 		phy_err(phy, "Timeout waiting for stop state\n");
 }
 
-static int cal_camerarx_start(struct cal_camerarx *phy,
-			      const struct cal_fmt *fmt)
+int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
 {
 	s64 external_rate;
 	u32 sscounter;
@@ -789,7 +497,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy,
 	return 0;
 }
 
-static void cal_camerarx_stop(struct cal_camerarx *phy)
+void cal_camerarx_stop(struct cal_camerarx *phy)
 {
 	unsigned int i;
 	int ret;
@@ -858,7 +566,7 @@ static void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 /*
  * Enable the expected IRQ sources
  */
-static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
+void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
 {
 	u32 val;
 
@@ -889,7 +597,7 @@ static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
 	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
 }
 
-static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
+void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 {
 	u32 val;
 
@@ -911,14 +619,14 @@ static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
 }
 
-static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
+void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
 	reg_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
 	reg_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
-static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
+void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 {
 	reg_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
@@ -1133,7 +841,7 @@ static int cal_camerarx_init_regmap(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
-static void cal_ctx_csi2_config(struct cal_ctx *ctx)
+void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
@@ -1158,7 +866,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 		reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
 }
 
-static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
+void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 {
 	u32 val, extract, pack;
 
@@ -1209,8 +917,8 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		reg_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
 }
 
-static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
-				  unsigned int width, unsigned int height)
+void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
+			    unsigned int height)
 {
 	u32 val;
 
@@ -1263,7 +971,7 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->cal, CAL_CTRL));
 }
 
-static void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
+void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 {
 	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
 }
@@ -1371,753 +1079,6 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	return IRQ_HANDLED;
 }
 
-/* ------------------------------------------------------------------
- *	V4L2 Video IOCTLs
- * ------------------------------------------------------------------
- */
-
-static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
-						u32 pixelformat)
-{
-	const struct cal_fmt *fmt;
-	unsigned int k;
-
-	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmt = ctx->active_fmt[k];
-		if (fmt->fourcc == pixelformat)
-			return fmt;
-	}
-
-	return NULL;
-}
-
-static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
-						 u32 code)
-{
-	const struct cal_fmt *fmt;
-	unsigned int k;
-
-	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmt = ctx->active_fmt[k];
-		if (fmt->code == code)
-			return fmt;
-	}
-
-	return NULL;
-}
-
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
-static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
-				struct v4l2_fmtdesc *f)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
-
-	if (f->index >= ctx->num_active_fmt)
-		return -EINVAL;
-
-	fmt = ctx->active_fmt[f->index];
-
-	f->pixelformat = fmt->fourcc;
-	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	return 0;
-}
-
-static int __subdev_get_format(struct cal_ctx *ctx,
-			       struct v4l2_mbus_framefmt *fmt)
-{
-	struct v4l2_subdev_format sd_fmt;
-	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
-	int ret;
-
-	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	sd_fmt.pad = 0;
-
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, get_fmt, NULL, &sd_fmt);
-	if (ret)
-		return ret;
-
-	*fmt = *mbus_fmt;
-
-	ctx_dbg(1, ctx, "%s %dx%d code:%04X\n", __func__,
-		fmt->width, fmt->height, fmt->code);
-
-	return 0;
-}
-
-static int __subdev_set_format(struct cal_ctx *ctx,
-			       struct v4l2_mbus_framefmt *fmt)
-{
-	struct v4l2_subdev_format sd_fmt;
-	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
-	int ret;
-
-	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	sd_fmt.pad = 0;
-	*mbus_fmt = *fmt;
-
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, set_fmt, NULL, &sd_fmt);
-	if (ret)
-		return ret;
-
-	ctx_dbg(1, ctx, "%s %dx%d code:%04X\n", __func__,
-		fmt->width, fmt->height, fmt->code);
-
-	return 0;
-}
-
-static int cal_calc_format_size(struct cal_ctx *ctx,
-				const struct cal_fmt *fmt,
-				struct v4l2_format *f)
-{
-	u32 bpl, max_width;
-
-	if (!fmt) {
-		ctx_dbg(3, ctx, "No cal_fmt provided!\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Maximum width is bound by the DMA max width in bytes.
-	 * We need to recalculate the actual maxi width depending on the
-	 * number of bytes per pixels required.
-	 */
-	max_width = MAX_WIDTH_BYTES / (ALIGN(fmt->bpp, 8) >> 3);
-	v4l_bound_align_image(&f->fmt.pix.width, 48, max_width, 2,
-			      &f->fmt.pix.height, 32, MAX_HEIGHT_LINES, 0, 0);
-
-	bpl = (f->fmt.pix.width * ALIGN(fmt->bpp, 8)) >> 3;
-	f->fmt.pix.bytesperline = ALIGN(bpl, 16);
-
-	f->fmt.pix.sizeimage = f->fmt.pix.height *
-			       f->fmt.pix.bytesperline;
-
-	ctx_dbg(3, ctx, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
-		__func__, fourcc_to_str(f->fmt.pix.pixelformat),
-		f->fmt.pix.width, f->fmt.pix.height,
-		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
-
-	return 0;
-}
-
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
-static int cal_try_fmt_vid_cap(struct file *file, void *priv,
-			       struct v4l2_format *f)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
-	struct v4l2_subdev_frame_size_enum fse;
-	int ret, found;
-
-	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
-	if (!fmt) {
-		ctx_dbg(3, ctx, "Fourcc format (0x%08x) not found.\n",
-			f->fmt.pix.pixelformat);
-
-		/* Just get the first one enumerated */
-		fmt = ctx->active_fmt[0];
-		f->fmt.pix.pixelformat = fmt->fourcc;
-	}
-
-	f->fmt.pix.field = ctx->v_fmt.fmt.pix.field;
-
-	/* check for/find a valid width/height */
-	ret = 0;
-	found = false;
-	fse.pad = 0;
-	fse.code = fmt->code;
-	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	for (fse.index = 0; ; fse.index++) {
-		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size,
-				       NULL, &fse);
-		if (ret)
-			break;
-
-		if ((f->fmt.pix.width == fse.max_width) &&
-		    (f->fmt.pix.height == fse.max_height)) {
-			found = true;
-			break;
-		} else if ((f->fmt.pix.width >= fse.min_width) &&
-			 (f->fmt.pix.width <= fse.max_width) &&
-			 (f->fmt.pix.height >= fse.min_height) &&
-			 (f->fmt.pix.height <= fse.max_height)) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		/* use existing values as default */
-		f->fmt.pix.width = ctx->v_fmt.fmt.pix.width;
-		f->fmt.pix.height =  ctx->v_fmt.fmt.pix.height;
-	}
-
-	/*
-	 * Use current colorspace for now, it will get
-	 * updated properly during s_fmt
-	 */
-	f->fmt.pix.colorspace = ctx->v_fmt.fmt.pix.colorspace;
-	return cal_calc_format_size(ctx, fmt, f);
-}
-
-static int cal_s_fmt_vid_cap(struct file *file, void *priv,
-			     struct v4l2_format *f)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-	struct vb2_queue *q = &ctx->vb_vidq;
-	const struct cal_fmt *fmt;
-	struct v4l2_mbus_framefmt mbus_fmt;
-	int ret;
-
-	if (vb2_is_busy(q)) {
-		ctx_dbg(3, ctx, "%s device busy\n", __func__);
-		return -EBUSY;
-	}
-
-	ret = cal_try_fmt_vid_cap(file, priv, f);
-	if (ret < 0)
-		return ret;
-
-	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
-
-	v4l2_fill_mbus_format(&mbus_fmt, &f->fmt.pix, fmt->code);
-
-	ret = __subdev_set_format(ctx, &mbus_fmt);
-	if (ret)
-		return ret;
-
-	/* Just double check nothing has gone wrong */
-	if (mbus_fmt.code != fmt->code) {
-		ctx_dbg(3, ctx,
-			"%s subdev changed format on us, this should not happen\n",
-			__func__);
-		return -EINVAL;
-	}
-
-	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
-	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
-	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
-	ctx->fmt = fmt;
-	ctx->m_fmt = mbus_fmt;
-	*f = ctx->v_fmt;
-
-	return 0;
-}
-
-static int cal_enum_framesizes(struct file *file, void *fh,
-			       struct v4l2_frmsizeenum *fsize)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
-	struct v4l2_subdev_frame_size_enum fse;
-	int ret;
-
-	/* check for valid format */
-	fmt = find_format_by_pix(ctx, fsize->pixel_format);
-	if (!fmt) {
-		ctx_dbg(3, ctx, "Invalid pixel code: %x\n",
-			fsize->pixel_format);
-		return -EINVAL;
-	}
-
-	fse.index = fsize->index;
-	fse.pad = 0;
-	fse.code = fmt->code;
-	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size, NULL,
-			       &fse);
-	if (ret)
-		return ret;
-
-	ctx_dbg(1, ctx, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
-		__func__, fse.index, fse.code, fse.min_width, fse.max_width,
-		fse.min_height, fse.max_height);
-
-	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width;
-	fsize->discrete.height = fse.max_height;
-
-	return 0;
-}
-
-static int cal_enum_input(struct file *file, void *priv,
-			  struct v4l2_input *inp)
-{
-	if (inp->index > 0)
-		return -EINVAL;
-
-	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	sprintf(inp->name, "Camera %u", inp->index);
-	return 0;
-}
-
-static int cal_g_input(struct file *file, void *priv, unsigned int *i)
-{
-	*i = 0;
-	return 0;
-}
-
-static int cal_s_input(struct file *file, void *priv, unsigned int i)
-{
-	return i > 0 ? -EINVAL : 0;
-}
-
-/* timeperframe is arbitrary and continuous */
-static int cal_enum_frameintervals(struct file *file, void *priv,
-				   struct v4l2_frmivalenum *fival)
-{
-	struct cal_ctx *ctx = video_drvdata(file);
-	const struct cal_fmt *fmt;
-	struct v4l2_subdev_frame_interval_enum fie = {
-		.index = fival->index,
-		.width = fival->width,
-		.height = fival->height,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	int ret;
-
-	fmt = find_format_by_pix(ctx, fival->pixel_format);
-	if (!fmt)
-		return -EINVAL;
-
-	fie.code = fmt->code;
-	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_interval,
-			       NULL, &fie);
-	if (ret)
-		return ret;
-	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
-	fival->discrete = fie.interval;
-
-	return 0;
-}
-
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
-	.vidioc_querycap      = cal_querycap,
-	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
-	.vidioc_enum_framesizes   = cal_enum_framesizes,
-	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
-	.vidioc_querybuf      = vb2_ioctl_querybuf,
-	.vidioc_qbuf          = vb2_ioctl_qbuf,
-	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
-	.vidioc_expbuf        = vb2_ioctl_expbuf,
-	.vidioc_enum_input    = cal_enum_input,
-	.vidioc_g_input       = cal_g_input,
-	.vidioc_s_input       = cal_s_input,
-	.vidioc_enum_frameintervals = cal_enum_frameintervals,
-	.vidioc_streamon      = vb2_ioctl_streamon,
-	.vidioc_streamoff     = vb2_ioctl_streamoff,
-	.vidioc_log_status    = v4l2_ctrl_log_status,
-	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
-	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
-};
-
-/* ------------------------------------------------------------------
- *	videobuf2 Operations
- * ------------------------------------------------------------------
- */
-
-static int cal_queue_setup(struct vb2_queue *vq,
-			   unsigned int *nbuffers, unsigned int *nplanes,
-			   unsigned int sizes[], struct device *alloc_devs[])
-{
-	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
-
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
-	if (*nplanes) {
-		if (sizes[0] < size)
-			return -EINVAL;
-		size = sizes[0];
-	}
-
-	*nplanes = 1;
-	sizes[0] = size;
-
-	ctx_dbg(3, ctx, "nbuffers=%d, size=%d\n", *nbuffers, sizes[0]);
-
-	return 0;
-}
-
-static int cal_buffer_prepare(struct vb2_buffer *vb)
-{
-	struct cal_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-	struct cal_buffer *buf = container_of(vb, struct cal_buffer,
-					      vb.vb2_buf);
-	unsigned long size;
-
-	if (WARN_ON(!ctx->fmt))
-		return -EINVAL;
-
-	size = ctx->v_fmt.fmt.pix.sizeimage;
-	if (vb2_plane_size(vb, 0) < size) {
-		ctx_err(ctx,
-			"data will not fit into plane (%lu < %lu)\n",
-			vb2_plane_size(vb, 0), size);
-		return -EINVAL;
-	}
-
-	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
-	return 0;
-}
-
-static void cal_buffer_queue(struct vb2_buffer *vb)
-{
-	struct cal_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-	struct cal_buffer *buf = container_of(vb, struct cal_buffer,
-					      vb.vb2_buf);
-	struct cal_dmaqueue *vidq = &ctx->vidq;
-	unsigned long flags;
-
-	/* recheck locking */
-	spin_lock_irqsave(&ctx->slock, flags);
-	list_add_tail(&buf->list, &vidq->active);
-	spin_unlock_irqrestore(&ctx->slock, flags);
-}
-
-static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
-{
-	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	struct cal_dmaqueue *dma_q = &ctx->vidq;
-	struct cal_buffer *buf, *tmp;
-	unsigned long addr;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ctx->slock, flags);
-	if (list_empty(&dma_q->active)) {
-		spin_unlock_irqrestore(&ctx->slock, flags);
-		ctx_dbg(3, ctx, "buffer queue is empty\n");
-		return -EIO;
-	}
-
-	buf = list_entry(dma_q->active.next, struct cal_buffer, list);
-	ctx->cur_frm = buf;
-	ctx->next_frm = buf;
-	list_del(&buf->list);
-	spin_unlock_irqrestore(&ctx->slock, flags);
-
-	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
-	ctx->sequence = 0;
-
-	pm_runtime_get_sync(ctx->cal->dev);
-
-	cal_ctx_csi2_config(ctx);
-	cal_ctx_pix_proc_config(ctx);
-	cal_ctx_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
-			      ctx->v_fmt.fmt.pix.height);
-
-	cal_camerarx_enable_irqs(ctx->phy);
-
-	ret = cal_camerarx_start(ctx->phy, ctx->fmt);
-	if (ret)
-		goto err;
-
-	cal_ctx_wr_dma_addr(ctx, addr);
-	cal_camerarx_ppi_enable(ctx->phy);
-
-	if (debug >= 4)
-		cal_quickdump_regs(ctx->cal);
-
-	return 0;
-
-err:
-	spin_lock_irqsave(&ctx->slock, flags);
-	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	ctx->cur_frm = NULL;
-	ctx->next_frm = NULL;
-	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	}
-	spin_unlock_irqrestore(&ctx->slock, flags);
-	return ret;
-}
-
-static void cal_stop_streaming(struct vb2_queue *vq)
-{
-	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	struct cal_dmaqueue *dma_q = &ctx->vidq;
-	struct cal_buffer *buf, *tmp;
-	unsigned long timeout;
-	unsigned long flags;
-	bool dma_act;
-
-	cal_camerarx_ppi_disable(ctx->phy);
-
-	/* wait for stream and dma to finish */
-	dma_act = true;
-	timeout = jiffies + msecs_to_jiffies(500);
-	while (dma_act && time_before(jiffies, timeout)) {
-		msleep(50);
-
-		spin_lock_irqsave(&ctx->slock, flags);
-		dma_act = ctx->dma_act;
-		spin_unlock_irqrestore(&ctx->slock, flags);
-	}
-
-	if (dma_act)
-		ctx_err(ctx, "failed to disable dma cleanly\n");
-
-	cal_camerarx_disable_irqs(ctx->phy);
-	cal_camerarx_stop(ctx->phy);
-
-	/* Release all active buffers */
-	spin_lock_irqsave(&ctx->slock, flags);
-	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-	}
-
-	if (ctx->cur_frm == ctx->next_frm) {
-		vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-	} else {
-		vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		vb2_buffer_done(&ctx->next_frm->vb.vb2_buf,
-				VB2_BUF_STATE_ERROR);
-	}
-	ctx->cur_frm = NULL;
-	ctx->next_frm = NULL;
-	spin_unlock_irqrestore(&ctx->slock, flags);
-
-	pm_runtime_put_sync(ctx->cal->dev);
-}
-
-static const struct vb2_ops cal_video_qops = {
-	.queue_setup		= cal_queue_setup,
-	.buf_prepare		= cal_buffer_prepare,
-	.buf_queue		= cal_buffer_queue,
-	.start_streaming	= cal_start_streaming,
-	.stop_streaming		= cal_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
-};
-
-/* ------------------------------------------------------------------
- *	V4L2 Initialization and Registration
- * ------------------------------------------------------------------
- */
-
-static const struct video_device cal_videodev = {
-	.name		= CAL_MODULE_NAME,
-	.fops		= &cal_fops,
-	.ioctl_ops	= &cal_ioctl_ops,
-	.minor		= -1,
-	.release	= video_device_release_empty,
-	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-			  V4L2_CAP_READWRITE,
-};
-
-static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
-{
-	struct v4l2_subdev_mbus_code_enum mbus_code;
-	struct v4l2_mbus_framefmt mbus_fmt;
-	const struct cal_fmt *fmt;
-	unsigned int i, j, k;
-	int ret = 0;
-
-	/* Enumerate sub device formats and enable all matching local formats */
-	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, ARRAY_SIZE(cal_formats),
-				       sizeof(*ctx->active_fmt), GFP_KERNEL);
-	if (!ctx->active_fmt)
-		return -ENOMEM;
-
-	ctx->num_active_fmt = 0;
-
-	for (j = 0, i = 0; ret != -EINVAL; ++j) {
-
-		memset(&mbus_code, 0, sizeof(mbus_code));
-		mbus_code.index = j;
-		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_mbus_code,
-				       NULL, &mbus_code);
-		if (ret)
-			continue;
-
-		ctx_dbg(2, ctx,
-			"subdev %s: code: %04x idx: %u\n",
-			ctx->phy->sensor->name, mbus_code.code, j);
-
-		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
-			const struct cal_fmt *fmt = &cal_formats[k];
-
-			if (mbus_code.code == fmt->code) {
-				ctx->active_fmt[i] = fmt;
-				ctx_dbg(2, ctx,
-					"matched fourcc: %s: code: %04x idx: %u\n",
-					fourcc_to_str(fmt->fourcc),
-					fmt->code, i);
-				ctx->num_active_fmt = ++i;
-			}
-		}
-	}
-
-	if (i == 0) {
-		ctx_err(ctx, "No suitable format reported by subdev %s\n",
-			ctx->phy->sensor->name);
-		return -EINVAL;
-	}
-
-	ret = __subdev_get_format(ctx, &mbus_fmt);
-	if (ret)
-		return ret;
-
-	fmt = find_format_by_code(ctx, mbus_fmt.code);
-	if (!fmt) {
-		ctx_dbg(3, ctx, "mbus code format (0x%08x) not found.\n",
-			mbus_fmt.code);
-		return -EINVAL;
-	}
-
-	/* Save current subdev format */
-	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
-	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
-	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
-	ctx->fmt = fmt;
-	ctx->m_fmt = mbus_fmt;
-
-	return 0;
-}
-
-static int cal_ctx_v4l2_register(struct cal_ctx *ctx)
-{
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
-	struct video_device *vfd = &ctx->vdev;
-	int ret;
-
-	ret = cal_ctx_v4l2_init_formats(ctx);
-	if (ret)
-		return ret;
-
-	ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL,
-				    true);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to add sensor ctrl handler\n");
-		return ret;
-	}
-
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to register video device\n");
-		return ret;
-	}
-
-	ctx_info(ctx, "V4L2 device registered as %s\n",
-		 video_device_node_name(vfd));
-
-	return 0;
-}
-
-static void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
-{
-	ctx_dbg(1, ctx, "unregistering %s\n",
-		video_device_node_name(&ctx->vdev));
-
-	video_unregister_device(&ctx->vdev);
-}
-
-static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
-{
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
-	struct video_device *vfd = &ctx->vdev;
-	struct vb2_queue *q = &ctx->vb_vidq;
-	int ret;
-
-	INIT_LIST_HEAD(&ctx->vidq.active);
-	spin_lock_init(&ctx->slock);
-	mutex_init(&ctx->mutex);
-
-	/* Initialize the vb2 queue. */
-	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
-	q->drv_priv = ctx;
-	q->buf_struct_size = sizeof(struct cal_buffer);
-	q->ops = &cal_video_qops;
-	q->mem_ops = &vb2_dma_contig_memops;
-	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->lock = &ctx->mutex;
-	q->min_buffers_needed = 3;
-	q->dev = ctx->cal->dev;
-
-	ret = vb2_queue_init(q);
-	if (ret)
-		return ret;
-
-	/* Initialize the video device and media entity. */
-	*vfd = cal_videodev;
-	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
-	vfd->queue = q;
-	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->index);
-	vfd->lock = &ctx->mutex;
-	video_set_drvdata(vfd, ctx);
-
-	ctx->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vfd->entity, 1, &ctx->pad);
-	if (ret < 0)
-		return ret;
-
-	/* Initialize the control handler. */
-	ret = v4l2_ctrl_handler_init(hdl, 11);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to init ctrl handler\n");
-		goto error;
-	}
-
-	vfd->ctrl_handler = hdl;
-
-	return 0;
-
-error:
-	media_entity_cleanup(&vfd->entity);
-	return ret;
-}
-
-static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
-{
-	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	media_entity_cleanup(&ctx->vdev.entity);
-}
-
 /* ------------------------------------------------------------------
  *	Asynchronous V4L2 subdev binding
  * ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
new file mode 100644
index 000000000000..88a6473b1dbe
--- /dev/null
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * TI Camera Access Layer (CAL)
+ *
+ * Copyright (c) 2015-2020 Texas Instruments Inc.
+ *
+ * Authors:
+ *	Benoit Parrot <bparrot@ti.com>
+ *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+#ifndef __TI_CAL_H__
+#define __TI_CAL_H__
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/videodev2.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/videobuf2-v4l2.h>
+
+#define CAL_MODULE_NAME			"cal"
+#define CAL_NUM_CONTEXT			2
+#define CAL_NUM_CSI2_PORTS		2
+
+#define MAX_WIDTH_BYTES			(8192 * 8)
+#define MAX_HEIGHT_LINES		16383
+
+struct device;
+struct device_node;
+struct resource;
+struct regmap;
+struct regmap_fied;
+struct v4l2_subdev;
+
+/* CTRL_CORE_CAMERRX_CONTROL register field id */
+enum cal_camerarx_field {
+	F_CTRLCLKEN,
+	F_CAMMODE,
+	F_LANEENABLE,
+	F_CSI_MODE,
+	F_MAX_FIELDS,
+};
+
+struct cal_fmt {
+	u32	fourcc;
+	u32	code;
+	/* Bits per pixel */
+	u8	bpp;
+};
+
+/* buffer for one video frame */
+struct cal_buffer {
+	/* common v4l buffer stuff -- must be first */
+	struct vb2_v4l2_buffer	vb;
+	struct list_head	list;
+};
+
+struct cal_dmaqueue {
+	struct list_head	active;
+};
+
+struct cal_camerarx_data {
+	struct {
+		unsigned int lsb;
+		unsigned int msb;
+	} fields[F_MAX_FIELDS];
+	unsigned int num_lanes;
+};
+
+struct cal_data {
+	const struct cal_camerarx_data *camerarx;
+	unsigned int num_csi2_phy;
+	unsigned int flags;
+};
+
+/*
+ * The Camera Adaptation Layer (CAL) module is paired with one or more complex
+ * I/O PHYs (CAMERARX). It contains multiple instances of CSI-2, processing and
+ * DMA contexts.
+ *
+ * The cal_dev structure represents the whole subsystem, including the CAL and
+ * the CAMERARX instances. Instances of struct cal_dev are named cal through the
+ * driver.
+ *
+ * The cal_camerarx structure represents one CAMERARX instance. Instances of
+ * cal_camerarx are named phy through the driver.
+ *
+ * The cal_ctx structure represents the combination of one CSI-2 context, one
+ * processing context and one DMA context. Instance of struct cal_ctx are named
+ * ctx through the driver.
+ */
+
+struct cal_camerarx {
+	void __iomem		*base;
+	struct resource		*res;
+	struct device		*dev;
+	struct regmap_field	*fields[F_MAX_FIELDS];
+
+	struct cal_dev		*cal;
+	unsigned int		instance;
+
+	struct v4l2_fwnode_endpoint	endpoint;
+	struct device_node	*sensor_node;
+	struct v4l2_subdev	*sensor;
+};
+
+struct cal_dev {
+	struct clk		*fclk;
+	int			irq;
+	void __iomem		*base;
+	struct resource		*res;
+	struct device		*dev;
+
+	const struct cal_data	*data;
+	u32			revision;
+
+	/* Control Module handle */
+	struct regmap		*syscon_camerrx;
+	u32			syscon_camerrx_offset;
+
+	/* Camera Core Module handle */
+	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
+
+	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
+
+	struct media_device	mdev;
+	struct v4l2_device	v4l2_dev;
+	struct v4l2_async_notifier notifier;
+};
+
+/*
+ * There is one cal_ctx structure for each camera core context.
+ */
+struct cal_ctx {
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct video_device	vdev;
+	struct media_pad	pad;
+
+	struct cal_dev		*cal;
+	struct cal_camerarx	*phy;
+
+	/* v4l2_ioctl mutex */
+	struct mutex		mutex;
+	/* v4l2 buffers lock */
+	spinlock_t		slock;
+
+	struct cal_dmaqueue	vidq;
+
+	/* video capture */
+	const struct cal_fmt	*fmt;
+	/* Used to store current pixel format */
+	struct v4l2_format		v_fmt;
+	/* Used to store current mbus frame format */
+	struct v4l2_mbus_framefmt	m_fmt;
+
+	/* Current subdev enumerated format */
+	const struct cal_fmt	**active_fmt;
+	unsigned int		num_active_fmt;
+
+	unsigned int		sequence;
+	struct vb2_queue	vb_vidq;
+	unsigned int		index;
+	unsigned int		cport;
+
+	/* Pointer pointing to current v4l2_buffer */
+	struct cal_buffer	*cur_frm;
+	/* Pointer pointing to next v4l2_buffer */
+	struct cal_buffer	*next_frm;
+
+	bool dma_act;
+};
+
+extern unsigned int cal_debug;
+extern int cal_video_nr;
+
+#define cal_dbg(level, cal, fmt, arg...)				\
+	do {								\
+		if (cal_debug >= (level))				\
+			dev_dbg((cal)->dev, fmt, ##arg);		\
+	} while (0)
+#define cal_info(cal, fmt, arg...)					\
+	dev_info((cal)->dev, fmt, ##arg)
+#define cal_err(cal, fmt, arg...)					\
+	dev_err((cal)->dev, fmt, ##arg)
+
+#define ctx_dbg(level, ctx, fmt, arg...)				\
+	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
+#define ctx_info(ctx, fmt, arg...)					\
+	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
+#define ctx_err(ctx, fmt, arg...)					\
+	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
+
+#define phy_dbg(level, phy, fmt, arg...)				\
+	cal_dbg(level, (phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
+#define phy_info(phy, fmt, arg...)					\
+	cal_info((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
+#define phy_err(phy, fmt, arg...)					\
+	cal_err((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
+
+void cal_quickdump_regs(struct cal_dev *cal);
+
+int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt);
+void cal_camerarx_stop(struct cal_camerarx *phy);
+void cal_camerarx_enable_irqs(struct cal_camerarx *phy);
+void cal_camerarx_disable_irqs(struct cal_camerarx *phy);
+void cal_camerarx_ppi_enable(struct cal_camerarx *phy);
+void cal_camerarx_ppi_disable(struct cal_camerarx *phy);
+
+void cal_ctx_csi2_config(struct cal_ctx *ctx);
+void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
+void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
+			   unsigned int height);
+void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr);
+
+int cal_ctx_v4l2_register(struct cal_ctx *ctx);
+void cal_ctx_v4l2_unregister(struct cal_ctx *ctx);
+int cal_ctx_v4l2_init(struct cal_ctx *ctx);
+void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx);
+
+#endif /* __TI_CAL_H__ */
-- 
Regards,

Laurent Pinchart

