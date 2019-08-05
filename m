Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C27D815D9
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 11:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfHEJsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 05:48:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51546 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 05:48:37 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9651C28A2ED;
        Mon,  5 Aug 2019 10:48:32 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH 3/5] media: v4l2: Add m2m codec helpers
Date:   Mon,  5 Aug 2019 11:48:25 +0200
Message-Id: <20190805094827.11205-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805094827.11205-1-boris.brezillon@collabora.com>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most codec drivers do the same thing, let's extract those generic bits
and provide them as m2m_codec helpers.

Each compressed-format will have its own set of sub-helpers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/media/v4l2-core/Kconfig              |    4 +
 drivers/media/v4l2-core/Makefile             |    1 +
 drivers/media/v4l2-core/v4l2-mem2mem-codec.c | 1170 ++++++++++++++++++
 include/media/v4l2-mem2mem-codec.h           |  317 +++++
 4 files changed, 1492 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-codec.c
 create mode 100644 include/media/v4l2-mem2mem-codec.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 7c5f62f196e5..2ee185b58c72 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -45,6 +45,10 @@ config V4L2_MEM2MEM_DEV
 	tristate
 	depends on VIDEOBUF2_CORE
 
+config V4L2_MEM2MEM_CODEC
+	bool
+	depends on V4L2_MEM2MEM_DEV
+
 # Used by LED subsystem flash drivers
 config V4L2_FLASH_LED_CLASS
 	tristate "V4L2 flash API for LED flash class devices"
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index a8f8117a788f..9c18fed9ea5a 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
 obj-$(CONFIG_VIDEO_TUNER) += tuner.o
 
 v4l2-mem2mem-y = v4l2-mem2mem-core.o
+v4l2-mem2mem-$(CONFIG_V4L2_MEM2MEM_CODEC) += v4l2-mem2mem-codec.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem-codec.c b/drivers/media/v4l2-core/v4l2-mem2mem-codec.c
new file mode 100644
index 000000000000..2dbc7dc9e4ba
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-mem2mem-codec.c
@@ -0,0 +1,1170 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Memory-to-memory codec framework for Video for Linux 2.
+ *
+ * Helper functions for codec devices that use memory buffers for both source
+ * and destination.
+ *
+ * Copyright (c) 2019 Collabora Ltd.
+ *
+ * Author:
+ *      Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem-codec.h>
+
+/**
+ * v4l2_m2m_codec_init() - Initializes a v4l2_m2m_codec object
+ * @codec: the codec to initialize
+ * @type: the type of codec (encoder or decoder)
+ * @m2m_dev: the M2M device backing this codec
+ * @v4l2_dev: the V4L2 device backing this codec
+ * @caps: the codec format capabilities
+ * @ops: codec operations
+ * @fops: video device file operations
+ * @ioctl_ops: video device ioctl operations
+ * @lock: the lock to attach to the video device
+ * @name: the name of the video device
+ * @drvdata: driver private data to attach to the video device
+ *
+ * This function initializes the codec object and the video device it contains.
+ * The caller is still responsible for registering the video dev.
+ *
+ * Return: 0 in case of success, an negative error code otherwise.
+ */
+int v4l2_m2m_codec_init(struct v4l2_m2m_codec *codec,
+			enum v4l2_m2m_codec_type type,
+			struct v4l2_m2m_dev *m2m_dev,
+			struct v4l2_device *v4l2_dev,
+			const struct v4l2_m2m_codec_caps *caps,
+			const struct v4l2_m2m_codec_ops *ops,
+			const struct v4l2_file_operations *fops,
+			const struct v4l2_ioctl_ops *ioctl_ops,
+			struct mutex *lock, const char *name, void *drvdata)
+{
+	struct video_device *vdev = v4l2_m2m_codec_to_vdev(codec);
+	unsigned int i;
+	ssize_t ret;
+
+	if (!codec || !caps || !m2m_dev || !ops ||
+	    !caps->num_coded_fmts || !caps->num_decoded_fmts ||
+	    !caps->coded_fmts || !caps->decoded_fmts || !ops->queue_init)
+		return -EINVAL;
+
+	for (i = 0; i < caps->num_coded_fmts; i++) {
+		if (!caps->coded_fmts[i].ops)
+			return -EINVAL;
+	}
+
+	codec->type = type;
+	codec->m2m_dev = m2m_dev;
+	codec->caps = caps;
+	codec->ops = ops;
+	vdev->lock = lock;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->fops = fops;
+	vdev->release = video_device_release_empty;
+	vdev->vfl_dir = VFL_DIR_M2M;
+	vdev->device_caps = V4L2_CAP_STREAMING;
+	vdev->ioctl_ops = ioctl_ops;
+	video_set_drvdata(vdev, drvdata);
+
+	if (ioctl_ops->vidioc_g_fmt_vid_out_mplane)
+		vdev->device_caps |= V4L2_CAP_VIDEO_M2M_MPLANE;
+	else
+		vdev->device_caps |= V4L2_CAP_VIDEO_M2M;
+
+	ret = strscpy(vdev->name, name, sizeof(vdev->name));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_init);
+
+static int v4l2_m2m_codec_add_ctrls(struct v4l2_m2m_codec_ctx *ctx,
+				    const struct v4l2_m2m_codec_ctrls *ctrls)
+{
+	unsigned int i;
+
+	if (!ctrls)
+		return 0;
+
+	if (ctrls->num_ctrls && !ctrls->ctrls)
+		return -EINVAL;
+
+	for (i = 0; i < ctrls->num_ctrls; i++) {
+		const struct v4l2_ctrl_config *cfg = &ctrls->ctrls[i].cfg;
+
+		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, cfg, ctx);
+		if (ctx->ctrl_hdl.error)
+			return ctx->ctrl_hdl.error;
+	}
+
+	return 0;
+}
+
+static void v4l2_m2m_codec_cleanup_ctrls(struct v4l2_m2m_codec_ctx *ctx)
+{
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+}
+
+static int v4l2_m2m_codec_init_ctrls(struct v4l2_m2m_codec_ctx *ctx)
+{
+	const struct v4l2_m2m_codec_coded_fmt_desc *fmts;
+	unsigned int i, nfmts, nctrls = 0;
+	int ret;
+
+	fmts = ctx->codec->caps->coded_fmts;
+	nfmts = ctx->codec->caps->num_coded_fmts;
+	for (i = 0; i < nfmts; i++)
+		nctrls += fmts[i].ctrls->num_ctrls;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
+
+	for (i = 0; i < nfmts; i++) {
+		ret = v4l2_m2m_codec_add_ctrls(ctx, fmts[i].ctrls);
+		if (ret)
+			goto err_free_handler;
+	}
+
+	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+	if (ret)
+		goto err_free_handler;
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+	return ret;
+}
+
+static void v4l2_m2m_codec_reset_fmt(struct v4l2_m2m_codec_ctx *ctx,
+				     struct v4l2_format *f, u32 fourcc)
+{
+	const struct v4l2_ioctl_ops *ops = ctx->codec->vdev.ioctl_ops;
+
+	memset(f, 0, sizeof(*f));
+
+	if (ops->vidioc_g_fmt_vid_cap_mplane) {
+		f->fmt.pix_mp.pixelformat = fourcc;
+	        f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	        f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
+	        f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	        f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	        f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	} else {
+		f->fmt.pix.pixelformat = fourcc;
+	        f->fmt.pix.field = V4L2_FIELD_NONE;
+	        f->fmt.pix.colorspace = V4L2_COLORSPACE_JPEG,
+	        f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	        f->fmt.pix.quantization = V4L2_QUANTIZATION_DEFAULT;
+	        f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	}
+}
+
+static void v4l2_m2m_codec_reset_coded_fmt(struct v4l2_m2m_codec_ctx *ctx)
+{
+	struct v4l2_m2m_codec *codec = ctx->codec;
+	const struct v4l2_ioctl_ops *ops = codec->vdev.ioctl_ops;
+	const struct v4l2_m2m_codec_coded_fmt_desc *desc;
+	struct v4l2_format *f = &ctx->coded_fmt;
+
+	desc = &ctx->codec->caps->coded_fmts[0];
+	ctx->coded_fmt_desc = desc;
+	v4l2_m2m_codec_reset_fmt(ctx, f, desc->fourcc);
+
+	if (ops->vidioc_g_fmt_vid_cap_mplane) {
+		struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
+
+		if (codec->type == V4L2_M2M_DECODER)
+			f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+		else
+			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+
+		if (desc->frmsize) {
+			fmt->width = desc->frmsize->min_width;
+			fmt->height = desc->frmsize->min_height;
+		}
+
+	} else {
+		struct v4l2_pix_format *fmt = &f->fmt.pix;
+
+		if (codec->type == V4L2_M2M_DECODER)
+			f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+		else
+			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+		if (desc->frmsize) {
+			fmt->width = desc->frmsize->min_width;
+			fmt->height = desc->frmsize->min_height;
+		}
+	}
+
+	if (desc->ops->adjust_fmt)
+		desc->ops->adjust_fmt(ctx, &ctx->coded_fmt);
+}
+
+/**
+ * v4l2_m2m_codec_reset_decoded_fmt() - Reset the decoded format embedded in a
+ *					codec context
+ * @ctx: the context to reset the fmt on
+ *
+ * The decoded format might need to be reset when specific operations (like
+ * updating the format) are done on the coded end of the pipeline. This
+ * function is also called at context initialization time.
+ */
+void v4l2_m2m_codec_reset_decoded_fmt(struct v4l2_m2m_codec_ctx *ctx)
+{
+	struct v4l2_m2m_codec *codec = ctx->codec;
+	const struct v4l2_ioctl_ops *ops = codec->vdev.ioctl_ops;
+	const struct v4l2_m2m_codec_coded_fmt_desc *coded_desc;
+	struct v4l2_format *f = &ctx->decoded_fmt;
+
+	if (!ctx->coded_fmt_desc)
+		v4l2_m2m_codec_reset_coded_fmt(ctx);
+
+	coded_desc = ctx->coded_fmt_desc;
+	v4l2_m2m_codec_reset_fmt(ctx, f, codec->caps->decoded_fmts[0].fourcc);
+	if (ops->vidioc_g_fmt_vid_cap_mplane) {
+		struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
+
+		if (codec->type == V4L2_M2M_DECODER)
+			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		else
+			f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+
+		if (coded_desc->frmsize) {
+			fmt->width = coded_desc->frmsize->min_width;
+			fmt->height = coded_desc->frmsize->min_height;
+		}
+
+		v4l2_fill_pixfmt_mp(fmt, fmt->pixelformat,
+				    fmt->width, fmt->height);
+	} else {
+		struct v4l2_pix_format *fmt = &f->fmt.pix;
+
+		if (codec->type == V4L2_M2M_DECODER)
+			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		else
+			f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+		if (coded_desc->frmsize) {
+			fmt->width = coded_desc->frmsize->min_width;
+			fmt->height = coded_desc->frmsize->min_height;
+		}
+
+		v4l2_fill_pixfmt(fmt, fmt->pixelformat,
+				 fmt->width, fmt->height);
+	}
+
+	ctx->decoded_fmt_desc = &codec->caps->decoded_fmts[0];
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_reset_decoded_fmt);
+
+static int v4l2_m2m_codec_queue_init(void *priv, struct vb2_queue *src_vq,
+				     struct vb2_queue *dst_vq)
+{
+	struct v4l2_m2m_codec_ctx *ctx = priv;
+
+	return ctx->codec->ops->queue_init(ctx, src_vq, dst_vq);
+}
+
+/**
+ * v4l2_m2m_codec_ctx_init() - Initialize a codec context
+ * @ctx: the context to initialize
+ * @file: the file instance to attach this context to
+ * @codec: the codec device creating this context
+ *
+ * Initializes a codec ctx. A new m2m context is created and the file handle
+ * embedded in the codec context is initialized too. We also reset the coded
+ * and decoded formats to start from a known state, and add the controls that
+ * are defined in the supported coded formats.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_ctx_init(struct v4l2_m2m_codec_ctx *ctx, struct file *file,
+			    struct v4l2_m2m_codec *codec)
+{
+	int ret;
+
+	v4l2_fh_init(&ctx->fh, video_devdata(file));
+	ctx->codec = codec;
+	ret = v4l2_m2m_codec_init_ctrls(ctx);
+	if (ret)
+		return ret;
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(codec->m2m_dev, ctx,
+					    v4l2_m2m_codec_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		goto err_cleanup_ctrls;
+	}
+
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh);
+
+	v4l2_m2m_codec_reset_coded_fmt(ctx);
+	v4l2_m2m_codec_reset_decoded_fmt(ctx);
+	return 0;
+
+err_cleanup_ctrls:
+	v4l2_m2m_codec_cleanup_ctrls(ctx);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_ctx_init);
+
+/**
+ * v4l2_m2m_codec_ctx_cleanup() - Clean the codec context up
+ * @ctx: codec context to cleanup
+ *
+ * Undoes what's been done in v4l2_m2m_codec_ctx_init().
+ */
+void v4l2_m2m_codec_ctx_cleanup(struct v4l2_m2m_codec_ctx *ctx)
+{
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_m2m_codec_cleanup_ctrls(ctx);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_ctx_cleanup);
+
+/**
+ * v4l2_m2m_codec_run_preamble() - Preamble to a codec run
+ * @ctx: the context the run is happening on
+ * @run: object describing a codec run
+ *
+ * Prepare a codec run. The src/dst buffer are retrieved and stored in
+ * the run object, and v4l2_ctrl_request_setup() is called on the media
+ * request attached to the src buffer if there's one.
+ * We also copy the src buffer metadata to the dst buffer.
+ */
+void v4l2_m2m_codec_run_preamble(struct v4l2_m2m_codec_ctx *ctx,
+				 struct v4l2_m2m_codec_run *run)
+{
+	struct media_request *src_req;
+
+	memset(run, 0, sizeof(*run));
+
+	run->bufs.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	run->bufs.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	/* Apply request(s) controls if needed. */
+	src_req = run->bufs.src->vb2_buf.req_obj.req;
+	if (src_req)
+		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
+
+	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst, true);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_run_preamble);
+
+/**
+ * v4l2_m2m_codec_run_postamble() - Postamble to a codec run
+ * @ctx: the context the run is happening on
+ * @run: the codec run object
+ *
+ * Finish a run by declaring the request attached to the src buffer as
+ * complete.
+ */
+void v4l2_m2m_codec_run_postamble(struct v4l2_m2m_codec_ctx *ctx,
+				  struct v4l2_m2m_codec_run *run)
+{
+	struct media_request *src_req = run->bufs.src->vb2_buf.req_obj.req;
+
+	if (src_req)
+		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_run_postamble);
+
+/**
+ * v4l2_m2m_codec_job_finish() - Declare the current job as finished
+ * @ctx: context this job is running on
+ * @state: state of the job
+ *
+ * Should be called when the codec is done encoding/decoding a frame.
+ * The src/dst buffers are returned to their queues and
+ * v4l2_m2m_job_finish() is called.
+ */
+void v4l2_m2m_codec_job_finish(struct v4l2_m2m_codec_ctx *ctx,
+			       enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	WARN_ON(!src_buf);
+	if (src_buf)
+		v4l2_m2m_buf_done(src_buf, state);
+
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	WARN_ON(!dst_buf);
+	if (dst_buf)
+		v4l2_m2m_buf_done(dst_buf, state);
+
+	v4l2_m2m_job_finish(ctx->codec->m2m_dev, ctx->fh.m2m_ctx);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_job_finish);
+
+/**
+ * v4l2_m2m_codec_request_validate() - Validate a media request
+ * @req: the media request to validate
+ *
+ * This function makes sure there's at least one src buffer attached to the
+ * request and checks that all per-request+mandatory controls have been set.
+ * This helper can be used to implement media_device_ops->req_validate() op.
+ */
+int v4l2_m2m_codec_request_validate(struct media_request *req)
+{
+	const struct v4l2_m2m_codec_ctrls *ctrls;
+	struct v4l2_m2m_codec_ctx *ctx;
+	struct v4l2_ctrl_handler *hdl;
+	struct vb2_buffer *vb;
+	unsigned int count;
+	unsigned int i;
+
+	vb = vb2_request_get_buf(req, 0);
+	if (!vb)
+		return -ENOENT;
+
+	ctx = vb2_get_drv_priv(vb->vb2_queue);
+	if (!ctx)
+		return -EINVAL;
+
+	count = vb2_request_buffer_cnt(req);
+	if (!count)
+		return -ENOENT;
+	else if (count > 1)
+		return -EINVAL;
+
+	hdl = v4l2_ctrl_request_hdl_find(req, &ctx->ctrl_hdl);
+	if (!hdl)
+		return -ENOENT;
+
+	ctrls = ctx->coded_fmt_desc->ctrls;
+	for (i = 0; ctrls && i < ctrls->num_ctrls; i++) {
+		u32 id = ctrls->ctrls[i].cfg.id;
+		struct v4l2_ctrl *ctrl;
+
+		if (!ctrls->ctrls[i].per_request || !ctrls->ctrls[i].mandatory)
+			continue;
+
+		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
+		if (!ctrl)
+			return -ENOENT;
+	}
+
+	v4l2_ctrl_request_hdl_put(hdl);
+
+	return vb2_request_validate(req);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_request_validate);
+
+/**
+ * v4l2_m2m_codec_find_coded_fmt_desc() - Search for a supported coded format
+ *					  based on its 4CC
+ * @codec: codec to search the coded format on
+ * @fourcc: the 4CC representing this format
+ *
+ * Return: A coded format desc if a matching format was found, NULL otherwise.
+ */
+const struct v4l2_m2m_codec_coded_fmt_desc *
+v4l2_m2m_codec_find_coded_fmt_desc(struct v4l2_m2m_codec *codec, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < codec->caps->num_coded_fmts; i++) {
+		if (codec->caps->coded_fmts[i].fourcc == fourcc)
+			return &codec->caps->coded_fmts[i];
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_find_coded_fmt_desc);
+
+/**
+ * v4l2_m2m_codec_enum_framesizes() - Enumerate frame sizes helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @fsize: framesize object
+ *
+ * This helper can be used to implement ioctl_ops->vidioc_enum_framesizes().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_enum_framesizes(struct file *file, void *priv,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct v4l2_m2m_codec *codec = vdev_to_v4l2_m2m_codec(vdev);
+	const struct v4l2_m2m_codec_coded_fmt_desc *fmt;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	fmt = v4l2_m2m_codec_find_coded_fmt_desc(codec, fsize->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	if (!fmt->frmsize)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = *fmt->frmsize;
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_enum_framesizes);
+
+static int v4l2_m2m_codec_enum_coded_fmt(struct file *file, void *priv,
+					 struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct v4l2_m2m_codec *codec = vdev_to_v4l2_m2m_codec(vdev);
+
+	if (f->index >= codec->caps->num_coded_fmts)
+		return -EINVAL;
+
+	f->pixelformat = codec->caps->coded_fmts[f->index].fourcc;
+	return 0;
+}
+
+static int v4l2_m2m_codec_enum_decoded_fmt(struct file *file, void *priv,
+					   struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct v4l2_m2m_codec *codec = vdev_to_v4l2_m2m_codec(vdev);
+
+	if (f->index >= codec->caps->num_decoded_fmts)
+		return -EINVAL;
+
+	f->pixelformat = codec->caps->decoded_fmts[f->index].fourcc;
+	return 0;
+}
+
+/**
+ * v4l2_m2m_codec_enum_output_fmt() - Enumerate output formats helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format descriptor
+ *
+ * This helper can be used to implement ioctl_ops->vidioc_enum_fmt_vid_out().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_enum_output_fmt(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		return v4l2_m2m_codec_enum_coded_fmt(file, priv, f);
+
+	return v4l2_m2m_codec_enum_decoded_fmt(file, priv, f);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_enum_output_fmt);
+
+/**
+ * v4l2_m2m_codec_enum_output_fmt() - Enumerate capture formats helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format descriptor
+ *
+ * This helper can be used to implement ioctl_ops->vidioc_enum_fmt_vid_cap().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_enum_capture_fmt(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		return v4l2_m2m_codec_enum_decoded_fmt(file, priv, f);
+
+	return v4l2_m2m_codec_enum_coded_fmt(file, priv, f);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_enum_capture_fmt);
+
+/**
+ * v4l2_m2m_codec_g_output_fmt() - Get output format helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format object
+ *
+ * This helper can be used to implement
+ * ioctl_ops->vidioc_g_fmt_vid_out[_mplane]().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_g_output_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		*f = ctx->coded_fmt;
+	else
+		*f = ctx->decoded_fmt;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_g_output_fmt);
+
+/**
+ * v4l2_m2m_codec_g_capture_fmt() - Get capture format helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format object
+ *
+ * This helper can be used to implement
+ * ioctl_ops->vidioc_g_fmt_vid_cap[_mplane]().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_g_capture_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		*f = ctx->decoded_fmt;
+	else
+		*f = ctx->coded_fmt;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_g_capture_fmt);
+
+static void
+v4l2_m2m_codec_apply_frmsize_constraints(struct v4l2_format *f,
+				const struct v4l2_frmsize_stepwise *frmsize)
+{
+	u32 *width, *height;
+
+	if (!frmsize)
+		return;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
+		width = &f->fmt.pix.width;
+       		height = &f->fmt.pix.height;
+	} else {
+		width = &f->fmt.pix_mp.width;
+       		height = &f->fmt.pix_mp.height;
+	}
+
+	v4l2_apply_frmsize_constraints(width, height, frmsize);
+}
+
+static int v4l2_m2m_codec_try_coded_fmt(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	const struct v4l2_m2m_codec_coded_fmt_desc *desc;
+	struct v4l2_m2m_codec *codec = ctx->codec;
+	u32 fourcc;
+	int ret;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
+		fourcc = f->fmt.pix.pixelformat;
+	else
+		fourcc = f->fmt.pix_mp.pixelformat;
+
+	desc = v4l2_m2m_codec_find_coded_fmt_desc(codec, fourcc);
+	if (!desc)
+		return -EINVAL;
+
+	v4l2_m2m_codec_apply_frmsize_constraints(f, desc->frmsize);
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+	} else {
+		f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+		/* All coded formats are considered single planar for now. */
+		f->fmt.pix_mp.num_planes = 1;
+	}
+
+	if (desc->ops->adjust_fmt) {
+		ret = desc->ops->adjust_fmt(ctx, f);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int v4l2_m2m_codec_try_decoded_fmt(struct file *file, void *priv,
+					  struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	const struct v4l2_m2m_codec_coded_fmt_desc *coded_desc;
+	struct v4l2_m2m_codec *codec = ctx->codec;
+	unsigned int i;
+	u32 fourcc;
+
+	/*
+	 * The codec context should point to a coded format desc, if the format
+	 * on the coded end has not been set yet, it should point to the
+	 * default value.
+	 */
+	coded_desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!coded_desc))
+		return -EINVAL;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
+		fourcc = f->fmt.pix.pixelformat;
+	else
+		fourcc = f->fmt.pix_mp.pixelformat;
+
+	for (i = 0; i < codec->caps->num_decoded_fmts; i++) {
+		if (codec->caps->decoded_fmts[i].fourcc == fourcc)
+			break;
+	}
+
+	if (i == codec->caps->num_decoded_fmts)
+		return -EINVAL;
+
+	/* Always apply the frmsize constraint of the coded end. */
+	v4l2_m2m_codec_apply_frmsize_constraints(f, coded_desc->frmsize);
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
+		v4l2_fill_pixfmt(&f->fmt.pix, fourcc, f->fmt.pix.width,
+				 f->fmt.pix.height);
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+	} else {
+		v4l2_fill_pixfmt_mp(&f->fmt.pix_mp, fourcc, f->fmt.pix_mp.width,
+				    f->fmt.pix_mp.height);
+		f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	}
+
+	return 0;
+}
+
+/**
+ * v4l2_m2m_codec_try_output_fmt() - Try output format helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format object
+ *
+ * This helper can be used to implement
+ * ioctl_ops->vidioc_try_fmt_vid_out[_mplane]().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_try_output_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		return v4l2_m2m_codec_try_coded_fmt(file, priv, f);
+
+	return v4l2_m2m_codec_try_decoded_fmt(file, priv, f);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_try_output_fmt);
+
+/**
+ * v4l2_m2m_codec_try_capture_fmt() - Try capture format helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format object
+ *
+ * This helper can be used to implement
+ * ioctl_ops->vidioc_try_fmt_vid_cap[_mplane]().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_try_capture_fmt(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		return v4l2_m2m_codec_try_decoded_fmt(file, priv, f);
+
+	return v4l2_m2m_codec_try_coded_fmt(file, priv, f);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_try_capture_fmt);
+
+static int v4l2_m2m_codec_s_fmt(struct file *file, void *priv,
+				struct v4l2_format *f,
+				int (*try_fmt)(struct file *, void *,
+					       struct v4l2_format *))
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	struct vb2_queue *vq;
+	int ret;
+
+	if (!try_fmt)
+		return -EINVAL;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	ret = try_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type) == 
+	    (ctx->codec->type == V4L2_M2M_DECODER)) {
+		struct v4l2_m2m_ctx *m2m_ctx = v4l2_m2m_codec_get_m2m_ctx(ctx);
+		const struct v4l2_m2m_codec_coded_fmt_desc *desc;
+		u32 fourcc;
+
+		if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
+			fourcc = f->fmt.pix.pixelformat;
+		else
+			fourcc = f->fmt.pix_mp.pixelformat;
+
+		desc = v4l2_m2m_codec_find_coded_fmt_desc(ctx->codec, fourcc);
+		if (!desc)
+			return -EINVAL;
+
+		ctx->coded_fmt_desc = desc;
+		m2m_ctx->out_q_ctx.q.requires_requests = desc->requires_requests;
+	}
+
+	return 0;
+}
+
+/**
+ * v4l2_m2m_codec_s_output_fmt() - Set output format helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format object
+ *
+ * This helper can be used to implement
+ * ioctl_ops->vidioc_s_fmt_vid_out[_mplane]().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_s_output_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	struct video_device *vfd = video_devdata(file);
+	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
+	struct v4l2_format *cap_fmt;
+	int ret;
+
+	ret = v4l2_m2m_codec_s_fmt(file, priv, f,
+				   V4L2_TYPE_IS_MULTIPLANAR(f->type) ?
+				   ops->vidioc_try_fmt_vid_out_mplane :
+				   ops->vidioc_try_fmt_vid_out);
+	if (ret)
+		return ret;
+
+	if (ctx->codec->type == V4L2_M2M_DECODER) {
+		ctx->coded_fmt = *f;
+		cap_fmt = &ctx->decoded_fmt;
+	} else {
+		ctx->decoded_fmt = *f;
+		cap_fmt = &ctx->coded_fmt;
+	}
+
+	/* Propagate colorspace information to capture. */
+	if (V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
+		cap_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+		cap_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+		cap_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		cap_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+	} else {
+		cap_fmt->fmt.pix.colorspace = f->fmt.pix.colorspace;
+		cap_fmt->fmt.pix.xfer_func = f->fmt.pix.xfer_func;
+		cap_fmt->fmt.pix.ycbcr_enc = f->fmt.pix.ycbcr_enc;
+		cap_fmt->fmt.pix.quantization = f->fmt.pix.quantization;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_s_output_fmt);
+
+/**
+ * v4l2_m2m_codec_s_capture_fmt() - Set capture format helper
+ * @file: opened file descriptor
+ * @priv: private data
+ * @f: format object
+ *
+ * This helper can be used to implement
+ * ioctl_ops->vidioc_s_fmt_vid_cap[_mplane]().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_s_capture_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct v4l2_m2m_codec_ctx *ctx = fh_to_v4l2_m2m_codec_ctx(priv);
+	struct video_device *vfd = video_devdata(file);
+	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
+	int ret;
+
+	ret = v4l2_m2m_codec_s_fmt(file, priv, f,
+				   V4L2_TYPE_IS_MULTIPLANAR(f->type) ?
+				   ops->vidioc_try_fmt_vid_cap_mplane:
+				   ops->vidioc_try_fmt_vid_cap);
+	if (ret)
+		return ret;
+
+	if (ctx->codec->type == V4L2_M2M_DECODER)
+		ctx->decoded_fmt = *f;
+	else
+		ctx->coded_fmt = *f;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_s_capture_fmt);
+
+/**
+ * v4l2_m2m_codec_queue_setup() - Queue setup helper
+ * @vq: the VB2 queue to setup
+ * @num_buffers: the number of buffers to allocate
+ * @num_planes: the number of planes per image
+ * @sizes: the plane sizes
+ * @alloc_devs: the device to use to allocate each plane
+ *
+ * This helper can be used to implement vb2_ops->queue_setup().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
+			       unsigned int *num_planes, unsigned int sizes[],
+			       struct device *alloc_devs[])
+{
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(vq);
+	struct v4l2_format *f;
+	int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type) == 
+	    (ctx->codec->type == V4L2_M2M_DECODER))
+		f = &ctx->coded_fmt;
+	else
+		f = &ctx->decoded_fmt;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(vq->type)) {
+		if (*num_planes) {
+			if (*num_planes != 1)
+				return -EINVAL;
+
+			if (sizes[0] < f->fmt.pix.sizeimage)
+				return -EINVAL;
+		} else {
+			sizes[0] = f->fmt.pix.sizeimage;
+		}
+
+		return 0;
+	}
+
+	if (*num_planes) {
+		if (*num_planes != f->fmt.pix_mp.num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < f->fmt.pix_mp.num_planes; i++) {
+			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	*num_planes = f->fmt.pix_mp.num_planes;
+	for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
+		sizes[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_queue_setup);
+
+/**
+ * v4l2_m2m_codec_queue_cleanup() - Queue cleanup helper
+ * @vq: the VB2 queue to cleanup
+ * @state: the sate to assigned to released bufs
+ *
+ * This helper can be used in the vb2_ops->stop_streaming() implementation
+ * to release buffers (and associated requests) bound to a queue.
+ */
+void v4l2_m2m_codec_queue_cleanup(struct vb2_queue *vq, u32 state)
+{
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(vq);
+
+	while (true) {
+		struct vb2_v4l2_buffer *vbuf;
+
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+		if (!vbuf)
+			break;
+
+		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_hdl);
+		v4l2_m2m_buf_done(vbuf, state);
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_queue_cleanup);
+
+/**
+ * v4l2_m2m_codec_buf_out_validate() - Validate output buffer helper
+ * @vb: the VB2 buffer to validate
+ *
+ * This helper can be used to implement vb2_ops->buf_out_validate().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_buf_out_validate);
+
+/**
+ * v4l2_m2m_codec_buf_prepare() - Prepare buffer helper
+ * @vb: the VB2 buffer to prepare
+ *
+ * This helper can be used to implement vb2_ops->buf_prepare().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(vq);
+	struct v4l2_format *f;
+	int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type) ==
+	    (ctx->codec->type == V4L2_M2M_DECODER))
+		f = &ctx->coded_fmt;
+	else
+		f = &ctx->decoded_fmt;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(vq->type)) {
+		if (vb2_plane_size(vb, 0) < f->fmt.pix.sizeimage)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	for (i = 0; i < f->fmt.pix_mp.num_planes; ++i) {
+		if (vb2_plane_size(vb, i) < f->fmt.pix_mp.plane_fmt[i].sizeimage)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_buf_prepare);
+
+/**
+ * v4l2_m2m_codec_buf_queue() - Queue buffer helper
+ * @vb: the VB2 buffer to queue
+ *
+ * This helper can be used to implement vb2_ops->buf_queue().
+ */
+void v4l2_m2m_codec_buf_queue(struct vb2_buffer *vb)
+{
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_buf_queue);
+
+/**
+ * v4l2_m2m_codec_buf_queue() - Complete buffer request helper
+ * @vb: the VB2 buffer to complete request on
+ *
+ * This helper can be used to implement vb2_ops->buf_request_complete().
+ */
+void v4l2_m2m_codec_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_buf_request_complete);
+
+/**
+ * v4l2_m2m_codec_start_streaming() - Start streaming helper
+ * @q: the VB2 queue to start streaming on
+ *
+ * This helper can be used to implement vb2_ops->start_streaming().
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(q);
+	const struct v4l2_m2m_codec_coded_fmt_desc *desc;
+	struct v4l2_m2m_codec *codec = ctx->codec;
+	int ret;
+
+	if ((codec->type == V4L2_M2M_DECODER) != V4L2_TYPE_IS_OUTPUT(q->type))
+		return 0;
+
+	desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!desc))
+		return -EINVAL;
+
+	if (desc->ops->start) {
+		ret = desc->ops->start(ctx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_start_streaming);
+
+/**
+ * v4l2_m2m_codec_stop_streaming() - Stop streaming helper
+ * @q: the VB2 queue to stop streaming on
+ *
+ * This helper can be used to implement vb2_ops->stop_streaming().
+ */
+void v4l2_m2m_codec_stop_streaming(struct vb2_queue *q)
+{
+	struct v4l2_m2m_codec_ctx *ctx = vb2_get_drv_priv(q);
+	const struct v4l2_m2m_codec_coded_fmt_desc *desc;
+	struct v4l2_m2m_codec *codec = ctx->codec;
+
+	if ((codec->type == V4L2_M2M_DECODER) == V4L2_TYPE_IS_OUTPUT(q->type)) {
+		desc = ctx->coded_fmt_desc;
+		if (WARN_ON(!desc))
+			return;
+
+		if (desc->ops->stop)
+			desc->ops->stop(ctx);
+	}
+
+	v4l2_m2m_codec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_stop_streaming);
+
+/**
+ * v4l2_m2m_codec_device_run() - Device run helper
+ * @ctx: the codec context this run happens on
+ *
+ * This helper can be used to implement v4l2_m2m_ops->device_run(). It just
+ * calls the ->run() method of the selected coded format.
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int v4l2_m2m_codec_device_run(struct v4l2_m2m_codec_ctx *ctx)
+{
+	const struct v4l2_m2m_codec_coded_fmt_desc *desc;
+
+	desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!desc))
+		return -EINVAL;
+
+	desc->ops->run(ctx);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_codec_device_run);
diff --git a/include/media/v4l2-mem2mem-codec.h b/include/media/v4l2-mem2mem-codec.h
new file mode 100644
index 000000000000..2c3e21d53f9e
--- /dev/null
+++ b/include/media/v4l2-mem2mem-codec.h
@@ -0,0 +1,317 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Memory-to-memory codec framework for Video for Linux 2.
+ *
+ * Helper functions for codec devices that use memory buffers for both source
+ * and destination.
+ *
+ * Copyright (c) 2019 Collabora Ltd.
+ *
+ * Author:
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#ifndef _MEDIA_V4L2_MEM2MEM_CODEC_H
+#define _MEDIA_V4L2_MEM2MEM_CODEC_H
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-mem2mem.h>
+
+struct v4l2_m2m_codec_ctx;
+
+/**
+ * struct v4l2_m2m_codec_ctrl_desc - Codec control description
+ * @per_request: set to true if the control is expected to be set everytime a
+ *		 decoding/encoding request is queued
+ * @mandatory: set to true if the control is mandatory
+ * @cfg: control configuration
+ */
+struct v4l2_m2m_codec_ctrl_desc {
+	u32 per_request : 1;
+	u32 mandatory : 1;
+	struct v4l2_ctrl_config cfg;
+};
+
+/**
+ * struct v4l2_m2m_codec_ctrls - Codec controls
+ * @ctrls: array of control descriptions
+ * @num_ctrls: size of the ctrls array
+ *
+ * Structure used to declare codec specific controls.
+ */
+struct v4l2_m2m_codec_ctrls {
+	const struct v4l2_m2m_codec_ctrl_desc *ctrls;
+	unsigned int num_ctrls;
+};
+
+#define V4L2_M2M_CODEC_CTRLS(_name, ...)						\
+	struct v4l2_m2m_codec_ctrls _name = {						\
+		.ctrls = (const struct v4l2_m2m_codec_ctrl_desc[]){__VA_ARGS__},	\
+		.num_ctrls = sizeof((struct v4l2_m2m_codec_ctrl_desc[]){__VA_ARGS__}) /	\
+			     sizeof(struct v4l2_m2m_codec_ctrl_desc),			\
+	}
+
+/**
+ * struct v4l2_m2m_codec_decoded_fmt_desc - Decoded format description
+ * @fourcc: the 4CC code of the decoded format
+ * @priv: driver private data to associate to this decoded format
+ *
+ * Structure used to describe decoded formats.
+ */
+struct v4l2_m2m_codec_decoded_fmt_desc {
+	u32 fourcc;
+	const void *priv;
+};
+
+/**
+ * struct v4l2_m2m_codec_coded_fmt_ops - Coded format methods
+ * @adjust_fmt: adjust a coded format before passing it back to userspace.
+ *		Particularly useful when one wants to tweak any of the
+ *		params set by the core (sizeimage, width, height, ...)
+ * @start: called when vb2_ops->start_streaming() is called. Any coded-format
+ *	   specific context initialization should happen here
+ * @stop: called when vb2_ops->stop_streaming() is called. Any coded-format
+ *	  specific context cleanup should happen here
+ * @run: called when v4l2_m2m_ops->device_run() is called. This method should
+ *	 issue the encoding/decoding request
+ */
+struct v4l2_m2m_codec_coded_fmt_ops {
+	int (*adjust_fmt)(struct v4l2_m2m_codec_ctx *ctx,
+			  struct v4l2_format *f);
+	int (*start)(struct v4l2_m2m_codec_ctx *ctx);
+	void (*stop)(struct v4l2_m2m_codec_ctx *ctx);
+	int (*run)(struct v4l2_m2m_codec_ctx *ctx);
+};
+
+/**
+ * struct v4l2_m2m_codec_coded_fmt_desc - Coded format description
+ * @fourcc: 4CC code describing this coded format
+ * @requires_request: set to true if the codec requires a media request object
+ *		      to process encoding/decoding requests
+ * @frmsize: frame size constraint. Can be NULL if the codec does not have any
+ *	     alignment/min/max size constraints for this coded format
+ * @ctrls: controls attached to this coded format
+ * @ops: coded format ops
+ * @priv: driver private data
+ */
+struct v4l2_m2m_codec_coded_fmt_desc {
+	u32 fourcc;
+	u32 requires_requests : 1;
+	const struct v4l2_frmsize_stepwise *frmsize;
+	const struct v4l2_m2m_codec_ctrls *ctrls;
+	const struct v4l2_m2m_codec_coded_fmt_ops *ops;
+	const void *priv;
+};
+
+#define V4L2_M2M_CODEC_CODED_FMTS(_fmt_array)		\
+	.num_coded_fmts = ARRAY_SIZE(_fmt_array),	\
+	.coded_fmts = _fmt_array
+
+#define V4L2_M2M_CODEC_DECODED_FMTS(_fmt_array)		\
+	.num_decoded_fmts = ARRAY_SIZE(_fmt_array),	\
+	.decoded_fmts = _fmt_array
+
+/**
+ * struct v4l2_m2m_codec_caps - Codec capabilities
+ * @coded_fmts: array of supported coded formats
+ * @num_coded_fmts: size of the coded_fmts array
+ * @decoded_fmts: array of supported decoded formats
+ * @num_decoded_fmts: size of the decoded_fmts array
+ *
+ * This structure is describing the formats supported by the codec.
+ */
+struct v4l2_m2m_codec_caps {
+	const struct v4l2_m2m_codec_coded_fmt_desc *coded_fmts;
+	unsigned int num_coded_fmts;
+	const struct v4l2_m2m_codec_decoded_fmt_desc *decoded_fmts;
+	unsigned int num_decoded_fmts;
+};
+
+/**
+ * enum v4l2_m2m_codec_type - Codec type
+ * @V4L2_M2M_ENCODER: encoder
+ * @V4L2_M2M_DECODER: decoder
+ */
+enum v4l2_m2m_codec_type {
+	V4L2_M2M_ENCODER,
+	V4L2_M2M_DECODER,
+};
+
+/**
+ * struct v4l2_m2m_codec_ops - Codec methods
+ * @queue_init: called by the v4l2_m2m_codec_queue_init() helper to let the
+ *		driver initialize the src/dst queues
+ */
+struct v4l2_m2m_codec_ops {
+	int (*queue_init)(struct v4l2_m2m_codec_ctx *ctx,
+			  struct vb2_queue *src_vq,
+			  struct vb2_queue *dst_vq);
+};
+
+/**
+ * struct v4l2_m2m_codec - Codec object
+ * @vdev: video device exposed by the codec
+ * @type: type of codec
+ * @m2m_dev: m2m device this codec is attached to
+ * @caps: codec capabilities
+ * @ops: codec operations
+ */
+struct v4l2_m2m_codec {
+	struct video_device vdev;
+	enum v4l2_m2m_codec_type type;
+	struct v4l2_m2m_dev *m2m_dev;
+	const struct v4l2_m2m_codec_caps *caps;
+	const struct v4l2_m2m_codec_ops *ops;
+};
+
+static inline struct v4l2_m2m_codec *
+vdev_to_v4l2_m2m_codec(struct video_device *vdev)
+{
+	return container_of(vdev, struct v4l2_m2m_codec, vdev);
+}
+
+static inline struct video_device *
+v4l2_m2m_codec_to_vdev(struct v4l2_m2m_codec *codec)
+{
+	return &codec->vdev;
+}
+
+static inline enum v4l2_m2m_codec_type
+v4l2_m2m_codec_get_type(const struct v4l2_m2m_codec *codec)
+{
+	return codec->type;
+}
+
+/**
+ * struct v4l2_m2m_codec_ctx - Codec context
+ * @fh: file handle
+ * @coded_fmt: current coded format
+ * @decoded_fmt: current decoded format
+ * @coded_fmt_desc: current coded format desc
+ * @decoded_fmt_desc: current decoded format desc
+ * @ctrl_hdl: control handler
+ * @codec: the codec that has created this context
+ */
+struct v4l2_m2m_codec_ctx {
+	struct v4l2_fh fh;
+	struct v4l2_format coded_fmt;
+	struct v4l2_format decoded_fmt;
+	const struct v4l2_m2m_codec_coded_fmt_desc *coded_fmt_desc;
+	const struct v4l2_m2m_codec_decoded_fmt_desc *decoded_fmt_desc;
+	struct v4l2_ctrl_handler ctrl_hdl;
+	struct v4l2_m2m_codec *codec;
+};
+
+static inline struct v4l2_m2m_codec_ctx *
+fh_to_v4l2_m2m_codec_ctx(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct v4l2_m2m_codec_ctx, fh);
+}
+
+static inline struct v4l2_m2m_codec_ctx *
+file_to_v4l2_m2m_codec_ctx(struct file *file)
+{
+	return fh_to_v4l2_m2m_codec_ctx(file->private_data);
+}
+
+static inline struct v4l2_m2m_ctx *
+v4l2_m2m_codec_get_m2m_ctx(struct v4l2_m2m_codec_ctx *ctx)
+{
+	return ctx->fh.m2m_ctx;
+}
+
+static inline struct v4l2_ctrl_handler *
+v4l2_m2m_codec_get_ctrl_handler(struct v4l2_m2m_codec_ctx *ctx)
+{
+	return &ctx->ctrl_hdl;
+}
+
+struct v4l2_m2m_codec_run {
+	struct {
+		struct vb2_v4l2_buffer *src;
+		struct vb2_v4l2_buffer *dst;
+	} bufs;
+};
+
+int v4l2_m2m_codec_init(struct v4l2_m2m_codec *codec,
+			enum v4l2_m2m_codec_type type,
+			struct v4l2_m2m_dev *m2m_dev,
+			struct v4l2_device *v4l2_dev,
+			const struct v4l2_m2m_codec_caps *caps,
+			const struct v4l2_m2m_codec_ops *ops,
+			const struct v4l2_file_operations *vdev_fops,
+			const struct v4l2_ioctl_ops *vdev_ioctl_ops,
+			struct mutex *lock, const char *name, void *drvdata);
+int v4l2_m2m_codec_ctx_init(struct v4l2_m2m_codec_ctx *ctx, struct file *file,
+			    struct v4l2_m2m_codec *codec);
+void v4l2_m2m_codec_ctx_cleanup(struct v4l2_m2m_codec_ctx *ctx);
+void v4l2_m2m_codec_run_preamble(struct v4l2_m2m_codec_ctx *ctx,
+				 struct v4l2_m2m_codec_run *run);
+void v4l2_m2m_codec_run_postamble(struct v4l2_m2m_codec_ctx *ctx,
+				  struct v4l2_m2m_codec_run *run);
+void v4l2_m2m_codec_job_finish(struct v4l2_m2m_codec_ctx *ctx,
+			       enum vb2_buffer_state state);
+
+static inline const struct v4l2_format *
+v4l2_m2m_codec_get_coded_fmt(struct v4l2_m2m_codec_ctx *ctx)
+{
+	return &ctx->coded_fmt;
+}
+
+static inline const struct v4l2_m2m_codec_coded_fmt_desc *
+v4l2_m2m_codec_get_coded_fmt_desc(struct v4l2_m2m_codec_ctx *ctx)
+{
+	return ctx->coded_fmt_desc;
+}
+
+static inline const struct v4l2_format *
+v4l2_m2m_codec_get_decoded_fmt(struct v4l2_m2m_codec_ctx *ctx)
+{
+	return &ctx->decoded_fmt;
+}
+
+static inline const struct v4l2_m2m_codec_decoded_fmt_desc *
+v4l2_m2m_codec_get_decoded_fmt_desc(struct v4l2_m2m_codec_ctx *ctx)
+{
+	return ctx->decoded_fmt_desc;
+}
+
+void v4l2_m2m_codec_reset_decoded_fmt(struct v4l2_m2m_codec_ctx *ctx);
+const struct v4l2_m2m_codec_coded_fmt_desc *
+v4l2_m2m_codec_find_coded_fmt_desc(struct v4l2_m2m_codec *codec, u32 fourcc);
+int v4l2_m2m_codec_enum_framesizes(struct file *file, void *priv,
+				   struct v4l2_frmsizeenum *fsize);
+int v4l2_m2m_codec_enum_output_fmt(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f);
+int v4l2_m2m_codec_enum_capture_fmt(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f);
+int v4l2_m2m_codec_g_output_fmt(struct file *file, void *priv,
+				struct v4l2_format *f);
+int v4l2_m2m_codec_g_capture_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f);
+int v4l2_m2m_codec_try_output_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f);
+int v4l2_m2m_codec_try_capture_fmt(struct file *file, void *priv,
+				   struct v4l2_format *f);
+int v4l2_m2m_codec_s_output_fmt(struct file *file, void *priv,
+				struct v4l2_format *f);
+int v4l2_m2m_codec_s_capture_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f);
+
+int v4l2_m2m_codec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
+			       unsigned int *num_planes, unsigned int sizes[],
+			       struct device *alloc_devs[]);
+void v4l2_m2m_codec_queue_cleanup(struct vb2_queue *vq, u32 state);
+int v4l2_m2m_codec_buf_out_validate(struct vb2_buffer *vb);
+int v4l2_m2m_codec_buf_prepare(struct vb2_buffer *vb);
+void v4l2_m2m_codec_buf_queue(struct vb2_buffer *vb);
+void v4l2_m2m_codec_buf_request_complete(struct vb2_buffer *vb);
+int v4l2_m2m_codec_start_streaming(struct vb2_queue *q, unsigned int count);
+void v4l2_m2m_codec_stop_streaming(struct vb2_queue *q);
+
+int v4l2_m2m_codec_request_validate(struct media_request *req);
+int v4l2_m2m_codec_device_run(struct v4l2_m2m_codec_ctx *ctx);
+
+#endif /* _MEDIA_V4L2_MEM2MEM_CODEC_H */
-- 
2.21.0

