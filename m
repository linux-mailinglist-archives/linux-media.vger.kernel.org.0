Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA019785A5F
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 16:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbjHWOYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 10:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236360AbjHWOYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 10:24:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9C2E69
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 07:24:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83D1166322
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 14:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F11C433C7;
        Wed, 23 Aug 2023 14:24:02 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 1/3] media: split up v4l2-mem2mem.c into a core and codec part
Date:   Wed, 23 Aug 2023 16:23:57 +0200
Message-Id: <20230823142359.602411-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
References: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2-mem2mem.c source contains core functions, valid for any m2m device,
and codec functions that are needed for codec drivers only. Split up the
source into a core source and a codec source to simplify maintenance.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/Makefile              |   2 +
 drivers/media/v4l2-core/v4l2-mem2mem-codec.c  | 359 +++++++++++++++
 .../{v4l2-mem2mem.c => v4l2-mem2mem-core.c}   | 422 +-----------------
 drivers/media/v4l2-core/v4l2-mem2mem-priv.h   | 100 +++++
 include/media/v4l2-mem2mem-codec.h            |  15 +
 include/media/v4l2-mem2mem.h                  |  31 +-
 6 files changed, 500 insertions(+), 429 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-codec.c
 rename drivers/media/v4l2-core/{v4l2-mem2mem.c => v4l2-mem2mem-core.c} (72%)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-priv.h
 create mode 100644 include/media/v4l2-mem2mem-codec.h

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index be2551705755..ae718b8ab46e 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -13,6 +13,8 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
 
+v4l2-mem2mem-objs	:=	v4l2-mem2mem-core.o v4l2-mem2mem-codec.o
+
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem-codec.c b/drivers/media/v4l2-core/v4l2-mem2mem-codec.c
new file mode 100644
index 000000000000..6e4b539a3b62
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-mem2mem-codec.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Memory-to-memory device framework for Video for Linux 2 and vb2.
+ *
+ * Helper functions for devices that use vb2 buffers for both their
+ * source and destination.
+ *
+ * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
+ * Pawel Osciak, <pawel@osciak.com>
+ * Marek Szyprowski, <m.szyprowski@samsung.com>
+ */
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+
+#include <media/media-device.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-mem2mem-codec.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-event.h>
+
+#include "v4l2-mem2mem-priv.h"
+
+void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				      struct v4l2_m2m_ctx *m2m_ctx,
+				      enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	bool schedule_next = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
+
+	if (WARN_ON(!src_buf || !dst_buf))
+		goto unlock;
+	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	if (!dst_buf->is_held) {
+		v4l2_m2m_dst_buf_remove(m2m_ctx);
+		v4l2_m2m_buf_done(dst_buf, state);
+	}
+	/*
+	 * If the request API is being used, returning the OUTPUT
+	 * (src) buffer will wake-up any process waiting on the
+	 * request file descriptor.
+	 *
+	 * Therefore, return the CAPTURE (dst) buffer first,
+	 * to avoid signalling the request file descriptor
+	 * before the CAPTURE buffer is done.
+	 */
+	v4l2_m2m_buf_done(src_buf, state);
+	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
+unlock:
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	if (schedule_next)
+		v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx);
+}
+EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
+
+/*
+ * This will add the LAST flag and mark the buffer management
+ * state as stopped.
+ * This is called when the last capture buffer must be flagged as LAST
+ * in draining mode from the encoder/decoder driver buf_queue() callback
+ * or from v4l2_update_last_buf_state() when a capture buffer is available.
+ */
+void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
+			       struct vb2_v4l2_buffer *vbuf)
+{
+	vbuf->flags |= V4L2_BUF_FLAG_LAST;
+	vb2_buffer_done(&vbuf->vb2_buf, VB2_BUF_STATE_DONE);
+
+	v4l2_m2m_mark_stopped(m2m_ctx);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_last_buffer_done);
+
+/* When stop command is issued, update buffer management state */
+static int v4l2_update_last_buf_state(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	struct vb2_v4l2_buffer *next_dst_buf;
+
+	if (m2m_ctx->is_draining)
+		return -EBUSY;
+
+	if (m2m_ctx->has_stopped)
+		return 0;
+
+	m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
+	m2m_ctx->is_draining = true;
+
+	/*
+	 * The processing of the last output buffer queued before
+	 * the STOP command is expected to mark the buffer management
+	 * state as stopped with v4l2_m2m_mark_stopped().
+	 */
+	if (m2m_ctx->last_src_buf)
+		return 0;
+
+	/*
+	 * In case the output queue is empty, try to mark the last capture
+	 * buffer as LAST.
+	 */
+	next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
+	if (!next_dst_buf) {
+		/*
+		 * Wait for the next queued one in encoder/decoder driver
+		 * buf_queue() callback using the v4l2_m2m_dst_buf_is_last()
+		 * helper or in v4l2_m2m_qbuf() if encoder/decoder is not yet
+		 * streaming.
+		 */
+		m2m_ctx->next_buf_last = true;
+		return 0;
+	}
+
+	v4l2_m2m_last_buffer_done(m2m_ctx, next_dst_buf);
+
+	return 0;
+}
+
+/*
+ * Updates the encoding/decoding buffer management state, should
+ * be called from encoder/decoder drivers start_streaming()
+ */
+void v4l2_m2m_update_start_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
+					   struct vb2_queue *q)
+{
+	/* If start streaming again, untag the last output buffer */
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		m2m_ctx->last_src_buf = NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_update_start_streaming_state);
+
+/*
+ * Updates the encoding/decoding buffer management state, should
+ * be called from encoder/decoder driver stop_streaming()
+ */
+void v4l2_m2m_update_stop_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
+					  struct vb2_queue *q)
+{
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		/*
+		 * If in draining state, either mark next dst buffer as
+		 * done or flag next one to be marked as done either
+		 * in encoder/decoder driver buf_queue() callback using
+		 * the v4l2_m2m_dst_buf_is_last() helper or in v4l2_m2m_qbuf()
+		 * if encoder/decoder is not yet streaming
+		 */
+		if (m2m_ctx->is_draining) {
+			struct vb2_v4l2_buffer *next_dst_buf;
+
+			m2m_ctx->last_src_buf = NULL;
+			next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
+			if (!next_dst_buf)
+				m2m_ctx->next_buf_last = true;
+			else
+				v4l2_m2m_last_buffer_done(m2m_ctx,
+							  next_dst_buf);
+		}
+	} else {
+		v4l2_m2m_clear_state(m2m_ctx);
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_update_stop_streaming_state);
+
+static void v4l2_m2m_force_last_buf_done(struct v4l2_m2m_ctx *m2m_ctx,
+					 struct vb2_queue *q)
+{
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned int i;
+
+	if (WARN_ON(q->is_output))
+		return;
+	if (list_empty(&q->queued_list))
+		return;
+
+	vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
+	for (i = 0; i < vb->num_planes; i++)
+		vb2_set_plane_payload(vb, i, 0);
+
+	/*
+	 * Since the buffer hasn't been queued to the ready queue,
+	 * mark is active and owned before marking it LAST and DONE
+	 */
+	vb->state = VB2_BUF_STATE_ACTIVE;
+	atomic_inc(&q->owned_by_drv_count);
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vbuf->field = V4L2_FIELD_NONE;
+
+	v4l2_m2m_last_buffer_done(m2m_ctx, vbuf);
+}
+
+void _v4l2_codec_qbuf(struct v4l2_m2m_ctx *m2m_ctx, struct vb2_queue *vq,
+		      struct v4l2_buffer *buf)
+{
+	/*
+	 * If the capture queue is streaming, but streaming hasn't started
+	 * on the device, but was asked to stop, mark the previously queued
+	 * buffer as DONE with LAST flag since it won't be queued on the
+	 * device.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(vq->type) &&
+	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq) &&
+	   (v4l2_m2m_has_stopped(m2m_ctx) || v4l2_m2m_dst_buf_is_last(m2m_ctx)))
+		v4l2_m2m_force_last_buf_done(m2m_ctx, vq);
+	else if (!(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
+		v4l2_m2m_try_schedule(m2m_ctx);
+}
+
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
+				   struct v4l2_encoder_cmd *ec)
+{
+	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
+		return -EINVAL;
+
+	ec->flags = 0;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
+
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
+				   struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	dc->flags = 0;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP) {
+		dc->stop.pts = 0;
+	} else if (dc->cmd == V4L2_DEC_CMD_START) {
+		dc->start.speed = 0;
+		dc->start.format = V4L2_DEC_START_FMT_NONE;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
+
+/*
+ * Updates the encoding state on ENC_CMD_STOP/ENC_CMD_START
+ * Should be called from the encoder driver encoder_cmd() callback
+ */
+int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_encoder_cmd *ec)
+{
+	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
+		return -EINVAL;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP)
+		return v4l2_update_last_buf_state(m2m_ctx);
+
+	if (m2m_ctx->is_draining)
+		return -EBUSY;
+
+	if (m2m_ctx->has_stopped)
+		m2m_ctx->has_stopped = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_encoder_cmd);
+
+/*
+ * Updates the decoding state on DEC_CMD_STOP/DEC_CMD_START
+ * Should be called from the decoder driver decoder_cmd() callback
+ */
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP)
+		return v4l2_update_last_buf_state(m2m_ctx);
+
+	if (m2m_ctx->is_draining)
+		return -EBUSY;
+
+	if (m2m_ctx->has_stopped)
+		m2m_ctx->has_stopped = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
+
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
+			       struct v4l2_encoder_cmd *ec)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_encoder_cmd(file, fh->m2m_ctx, ec);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_encoder_cmd);
+
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
+			       struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
+
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
+					     struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
+		return -EINVAL;
+
+	dc->flags = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
+
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+					 struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh = file->private_data;
+	struct vb2_v4l2_buffer *out_vb, *cap_vb;
+	struct v4l2_m2m_dev *m2m_dev = fh->m2m_ctx->m2m_dev;
+	unsigned long flags;
+	int ret;
+
+	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
+	if (ret < 0)
+		return ret;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	out_vb = v4l2_m2m_last_src_buf(fh->m2m_ctx);
+	cap_vb = v4l2_m2m_last_dst_buf(fh->m2m_ctx);
+
+	/*
+	 * If there is an out buffer pending, then clear any HOLD flag.
+	 *
+	 * By clearing this flag we ensure that when this output
+	 * buffer is processed any held capture buffer will be released.
+	 */
+	if (out_vb) {
+		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	} else if (cap_vb && cap_vb->is_held) {
+		/*
+		 * If there were no output buffers, but there is a
+		 * capture buffer that is held, then release that
+		 * buffer.
+		 */
+		cap_vb->is_held = false;
+		v4l2_m2m_dst_buf_remove(fh->m2m_ctx);
+		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+	}
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem-core.c
similarity index 72%
rename from drivers/media/v4l2-core/v4l2-mem2mem.c
rename to drivers/media/v4l2-core/v4l2-mem2mem-core.c
index 0cc30397fbad..8963a5b29b1d 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem-core.c
@@ -21,42 +21,14 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
 
+#include "v4l2-mem2mem-priv.h"
+
 MODULE_DESCRIPTION("Mem to mem device framework for vb2");
 MODULE_AUTHOR("Pawel Osciak, <pawel@osciak.com>");
 MODULE_LICENSE("GPL");
 
-static bool debug;
-module_param(debug, bool, 0644);
-
-#define dprintk(fmt, arg...)						\
-	do {								\
-		if (debug)						\
-			printk(KERN_DEBUG "%s: " fmt, __func__, ## arg);\
-	} while (0)
-
-
-/* Instance is already queued on the job_queue */
-#define TRANS_QUEUED		(1 << 0)
-/* Instance is currently running in hardware */
-#define TRANS_RUNNING		(1 << 1)
-/* Instance is currently aborting */
-#define TRANS_ABORT		(1 << 2)
-
-
-/* The job queue is not running new jobs */
-#define QUEUE_PAUSED		(1 << 0)
-
-
-/* Offset base for buffers on the destination queue - used to distinguish
- * between source and destination buffers when mmapping - they receive the same
- * offsets but for different queues */
-#define DST_QUEUE_OFF_BASE	(1 << 30)
-
-enum v4l2_m2m_entity_type {
-	MEM2MEM_ENT_TYPE_SOURCE,
-	MEM2MEM_ENT_TYPE_SINK,
-	MEM2MEM_ENT_TYPE_PROC
-};
+bool v4l2_mem2mem_debug;
+module_param_named(debug, v4l2_mem2mem_debug, bool, 0644);
 
 static const char * const m2m_entity_name[] = {
 	"source",
@@ -64,53 +36,6 @@ static const char * const m2m_entity_name[] = {
 	"proc"
 };
 
-/**
- * struct v4l2_m2m_dev - per-device context
- * @source:		&struct media_entity pointer with the source entity
- *			Used only when the M2M device is registered via
- *			v4l2_m2m_register_media_controller().
- * @source_pad:		&struct media_pad with the source pad.
- *			Used only when the M2M device is registered via
- *			v4l2_m2m_register_media_controller().
- * @sink:		&struct media_entity pointer with the sink entity
- *			Used only when the M2M device is registered via
- *			v4l2_m2m_register_media_controller().
- * @sink_pad:		&struct media_pad with the sink pad.
- *			Used only when the M2M device is registered via
- *			v4l2_m2m_register_media_controller().
- * @proc:		&struct media_entity pointer with the M2M device itself.
- * @proc_pads:		&struct media_pad with the @proc pads.
- *			Used only when the M2M device is registered via
- *			v4l2_m2m_unregister_media_controller().
- * @intf_devnode:	&struct media_intf devnode pointer with the interface
- *			with controls the M2M device.
- * @curr_ctx:		currently running instance
- * @job_queue:		instances queued to run
- * @job_spinlock:	protects job_queue
- * @job_work:		worker to run queued jobs.
- * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
- * @m2m_ops:		driver callbacks
- */
-struct v4l2_m2m_dev {
-	struct v4l2_m2m_ctx	*curr_ctx;
-#ifdef CONFIG_MEDIA_CONTROLLER
-	struct media_entity	*source;
-	struct media_pad	source_pad;
-	struct media_entity	sink;
-	struct media_pad	sink_pad;
-	struct media_entity	proc;
-	struct media_pad	proc_pads[2];
-	struct media_intf_devnode *intf_devnode;
-#endif
-
-	struct list_head	job_queue;
-	spinlock_t		job_spinlock;
-	struct work_struct	job_work;
-	unsigned long		job_queue_flags;
-
-	const struct v4l2_m2m_ops *m2m_ops;
-};
-
 static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
 						enum v4l2_buf_type type)
 {
@@ -445,8 +370,8 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
  * Schedule the next job, called from v4l2_m2m_job_finish() or
  * v4l2_m2m_buf_done_and_job_finish().
  */
-static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
-				       struct v4l2_m2m_ctx *m2m_ctx)
+void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
+				struct v4l2_m2m_ctx *m2m_ctx)
 {
 	/*
 	 * This instance might have more buffers ready, but since we do not
@@ -466,8 +391,8 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
  * Assumes job_spinlock is held, called from v4l2_m2m_job_finish() or
  * v4l2_m2m_buf_done_and_job_finish().
  */
-static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
-				 struct v4l2_m2m_ctx *m2m_ctx)
+bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
+			  struct v4l2_m2m_ctx *m2m_ctx)
 {
 	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx != m2m_ctx) {
 		dprintk("Called by an instance not currently running\n");
@@ -503,44 +428,6 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 }
 EXPORT_SYMBOL(v4l2_m2m_job_finish);
 
-void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
-				      struct v4l2_m2m_ctx *m2m_ctx,
-				      enum vb2_buffer_state state)
-{
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	bool schedule_next = false;
-	unsigned long flags;
-
-	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
-
-	if (WARN_ON(!src_buf || !dst_buf))
-		goto unlock;
-	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
-	if (!dst_buf->is_held) {
-		v4l2_m2m_dst_buf_remove(m2m_ctx);
-		v4l2_m2m_buf_done(dst_buf, state);
-	}
-	/*
-	 * If the request API is being used, returning the OUTPUT
-	 * (src) buffer will wake-up any process waiting on the
-	 * request file descriptor.
-	 *
-	 * Therefore, return the CAPTURE (dst) buffer first,
-	 * to avoid signalling the request file descriptor
-	 * before the CAPTURE buffer is done.
-	 */
-	v4l2_m2m_buf_done(src_buf, state);
-	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
-unlock:
-	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-
-	if (schedule_next)
-		v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx);
-}
-EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
-
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
@@ -621,140 +508,6 @@ int v4l2_m2m_querybuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_querybuf);
 
-/*
- * This will add the LAST flag and mark the buffer management
- * state as stopped.
- * This is called when the last capture buffer must be flagged as LAST
- * in draining mode from the encoder/decoder driver buf_queue() callback
- * or from v4l2_update_last_buf_state() when a capture buffer is available.
- */
-void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
-			       struct vb2_v4l2_buffer *vbuf)
-{
-	vbuf->flags |= V4L2_BUF_FLAG_LAST;
-	vb2_buffer_done(&vbuf->vb2_buf, VB2_BUF_STATE_DONE);
-
-	v4l2_m2m_mark_stopped(m2m_ctx);
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_last_buffer_done);
-
-/* When stop command is issued, update buffer management state */
-static int v4l2_update_last_buf_state(struct v4l2_m2m_ctx *m2m_ctx)
-{
-	struct vb2_v4l2_buffer *next_dst_buf;
-
-	if (m2m_ctx->is_draining)
-		return -EBUSY;
-
-	if (m2m_ctx->has_stopped)
-		return 0;
-
-	m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
-	m2m_ctx->is_draining = true;
-
-	/*
-	 * The processing of the last output buffer queued before
-	 * the STOP command is expected to mark the buffer management
-	 * state as stopped with v4l2_m2m_mark_stopped().
-	 */
-	if (m2m_ctx->last_src_buf)
-		return 0;
-
-	/*
-	 * In case the output queue is empty, try to mark the last capture
-	 * buffer as LAST.
-	 */
-	next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
-	if (!next_dst_buf) {
-		/*
-		 * Wait for the next queued one in encoder/decoder driver
-		 * buf_queue() callback using the v4l2_m2m_dst_buf_is_last()
-		 * helper or in v4l2_m2m_qbuf() if encoder/decoder is not yet
-		 * streaming.
-		 */
-		m2m_ctx->next_buf_last = true;
-		return 0;
-	}
-
-	v4l2_m2m_last_buffer_done(m2m_ctx, next_dst_buf);
-
-	return 0;
-}
-
-/*
- * Updates the encoding/decoding buffer management state, should
- * be called from encoder/decoder drivers start_streaming()
- */
-void v4l2_m2m_update_start_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
-					   struct vb2_queue *q)
-{
-	/* If start streaming again, untag the last output buffer */
-	if (V4L2_TYPE_IS_OUTPUT(q->type))
-		m2m_ctx->last_src_buf = NULL;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_update_start_streaming_state);
-
-/*
- * Updates the encoding/decoding buffer management state, should
- * be called from encoder/decoder driver stop_streaming()
- */
-void v4l2_m2m_update_stop_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
-					  struct vb2_queue *q)
-{
-	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
-		/*
-		 * If in draining state, either mark next dst buffer as
-		 * done or flag next one to be marked as done either
-		 * in encoder/decoder driver buf_queue() callback using
-		 * the v4l2_m2m_dst_buf_is_last() helper or in v4l2_m2m_qbuf()
-		 * if encoder/decoder is not yet streaming
-		 */
-		if (m2m_ctx->is_draining) {
-			struct vb2_v4l2_buffer *next_dst_buf;
-
-			m2m_ctx->last_src_buf = NULL;
-			next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
-			if (!next_dst_buf)
-				m2m_ctx->next_buf_last = true;
-			else
-				v4l2_m2m_last_buffer_done(m2m_ctx,
-							  next_dst_buf);
-		}
-	} else {
-		v4l2_m2m_clear_state(m2m_ctx);
-	}
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_update_stop_streaming_state);
-
-static void v4l2_m2m_force_last_buf_done(struct v4l2_m2m_ctx *m2m_ctx,
-					 struct vb2_queue *q)
-{
-	struct vb2_buffer *vb;
-	struct vb2_v4l2_buffer *vbuf;
-	unsigned int i;
-
-	if (WARN_ON(q->is_output))
-		return;
-	if (list_empty(&q->queued_list))
-		return;
-
-	vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
-	for (i = 0; i < vb->num_planes; i++)
-		vb2_set_plane_payload(vb, i, 0);
-
-	/*
-	 * Since the buffer hasn't been queued to the ready queue,
-	 * mark is active and owned before marking it LAST and DONE
-	 */
-	vb->state = VB2_BUF_STATE_ACTIVE;
-	atomic_inc(&q->owned_by_drv_count);
-
-	vbuf = to_vb2_v4l2_buffer(vb);
-	vbuf->field = V4L2_FIELD_NONE;
-
-	v4l2_m2m_last_buffer_done(m2m_ctx, vbuf);
-}
-
 int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct v4l2_buffer *buf)
 {
@@ -777,18 +530,7 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	/* Adjust MMAP memory offsets for the CAPTURE queue */
 	v4l2_m2m_adjust_mem_offset(vq, buf);
 
-	/*
-	 * If the capture queue is streaming, but streaming hasn't started
-	 * on the device, but was asked to stop, mark the previously queued
-	 * buffer as DONE with LAST flag since it won't be queued on the
-	 * device.
-	 */
-	if (V4L2_TYPE_IS_CAPTURE(vq->type) &&
-	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq) &&
-	   (v4l2_m2m_has_stopped(m2m_ctx) || v4l2_m2m_dst_buf_is_last(m2m_ctx)))
-		v4l2_m2m_force_last_buf_done(m2m_ctx, vq);
-	else if (!(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
-		v4l2_m2m_try_schedule(m2m_ctx);
+	_v4l2_codec_qbuf(m2m_ctx, vq, buf);
 
 	return 0;
 }
@@ -1440,152 +1182,6 @@ int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamoff);
 
-int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
-				   struct v4l2_encoder_cmd *ec)
-{
-	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
-		return -EINVAL;
-
-	ec->flags = 0;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
-
-int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
-				   struct v4l2_decoder_cmd *dc)
-{
-	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
-		return -EINVAL;
-
-	dc->flags = 0;
-
-	if (dc->cmd == V4L2_DEC_CMD_STOP) {
-		dc->stop.pts = 0;
-	} else if (dc->cmd == V4L2_DEC_CMD_START) {
-		dc->start.speed = 0;
-		dc->start.format = V4L2_DEC_START_FMT_NONE;
-	}
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
-
-/*
- * Updates the encoding state on ENC_CMD_STOP/ENC_CMD_START
- * Should be called from the encoder driver encoder_cmd() callback
- */
-int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
-			 struct v4l2_encoder_cmd *ec)
-{
-	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
-		return -EINVAL;
-
-	if (ec->cmd == V4L2_ENC_CMD_STOP)
-		return v4l2_update_last_buf_state(m2m_ctx);
-
-	if (m2m_ctx->is_draining)
-		return -EBUSY;
-
-	if (m2m_ctx->has_stopped)
-		m2m_ctx->has_stopped = false;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_encoder_cmd);
-
-/*
- * Updates the decoding state on DEC_CMD_STOP/DEC_CMD_START
- * Should be called from the decoder driver decoder_cmd() callback
- */
-int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
-			 struct v4l2_decoder_cmd *dc)
-{
-	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
-		return -EINVAL;
-
-	if (dc->cmd == V4L2_DEC_CMD_STOP)
-		return v4l2_update_last_buf_state(m2m_ctx);
-
-	if (m2m_ctx->is_draining)
-		return -EBUSY;
-
-	if (m2m_ctx->has_stopped)
-		m2m_ctx->has_stopped = false;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
-
-int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
-			       struct v4l2_encoder_cmd *ec)
-{
-	struct v4l2_fh *fh = file->private_data;
-
-	return v4l2_m2m_encoder_cmd(file, fh->m2m_ctx, ec);
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_encoder_cmd);
-
-int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
-			       struct v4l2_decoder_cmd *dc)
-{
-	struct v4l2_fh *fh = file->private_data;
-
-	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
-
-int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
-					     struct v4l2_decoder_cmd *dc)
-{
-	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
-		return -EINVAL;
-
-	dc->flags = 0;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
-
-int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
-					 struct v4l2_decoder_cmd *dc)
-{
-	struct v4l2_fh *fh = file->private_data;
-	struct vb2_v4l2_buffer *out_vb, *cap_vb;
-	struct v4l2_m2m_dev *m2m_dev = fh->m2m_ctx->m2m_dev;
-	unsigned long flags;
-	int ret;
-
-	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
-	if (ret < 0)
-		return ret;
-
-	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	out_vb = v4l2_m2m_last_src_buf(fh->m2m_ctx);
-	cap_vb = v4l2_m2m_last_dst_buf(fh->m2m_ctx);
-
-	/*
-	 * If there is an out buffer pending, then clear any HOLD flag.
-	 *
-	 * By clearing this flag we ensure that when this output
-	 * buffer is processed any held capture buffer will be released.
-	 */
-	if (out_vb) {
-		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
-	} else if (cap_vb && cap_vb->is_held) {
-		/*
-		 * If there were no output buffers, but there is a
-		 * capture buffer that is held, then release that
-		 * buffer.
-		 */
-		cap_vb->is_held = false;
-		v4l2_m2m_dst_buf_remove(fh->m2m_ctx);
-		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
-	}
-	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
-
 /*
  * v4l2_file_operations helpers. It is assumed here same lock is used
  * for the output and the capture buffer queue.
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem-priv.h b/drivers/media/v4l2-core/v4l2-mem2mem-priv.h
new file mode 100644
index 000000000000..65ac006808df
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-mem2mem-priv.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Memory-to-memory device framework, private header
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ * Pawel Osciak, <pawel@osciak.com>
+ * Marek Szyprowski, <m.szyprowski@samsung.com>
+ */
+
+#ifndef _MEDIA_V4L2_MEM2MEM_PRIV_H
+#define _MEDIA_V4L2_MEM2MEM_PRIV_H
+
+extern bool v4l2_mem2mem_debug;
+
+#define dprintk(fmt, arg...)						\
+	do {								\
+		if (v4l2_mem2mem_debug)					\
+			printk(KERN_DEBUG "%s: " fmt, __func__, ## arg);\
+	} while (0)
+
+
+/* Instance is already queued on the job_queue */
+#define TRANS_QUEUED		(1 << 0)
+/* Instance is currently running in hardware */
+#define TRANS_RUNNING		(1 << 1)
+/* Instance is currently aborting */
+#define TRANS_ABORT		(1 << 2)
+
+
+/* The job queue is not running new jobs */
+#define QUEUE_PAUSED		(1 << 0)
+
+
+/* Offset base for buffers on the destination queue - used to distinguish
+ * between source and destination buffers when mmapping - they receive the same
+ * offsets but for different queues */
+#define DST_QUEUE_OFF_BASE	(1 << 30)
+
+enum v4l2_m2m_entity_type {
+	MEM2MEM_ENT_TYPE_SOURCE,
+	MEM2MEM_ENT_TYPE_SINK,
+	MEM2MEM_ENT_TYPE_PROC
+};
+
+/**
+ * struct v4l2_m2m_dev - per-device context
+ * @source:		&struct media_entity pointer with the source entity
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_register_media_controller().
+ * @source_pad:		&struct media_pad with the source pad.
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_register_media_controller().
+ * @sink:		&struct media_entity pointer with the sink entity
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_register_media_controller().
+ * @sink_pad:		&struct media_pad with the sink pad.
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_register_media_controller().
+ * @proc:		&struct media_entity pointer with the M2M device itself.
+ * @proc_pads:		&struct media_pad with the @proc pads.
+ *			Used only when the M2M device is registered via
+ *			v4l2_m2m_unregister_media_controller().
+ * @intf_devnode:	&struct media_intf devnode pointer with the interface
+ *			with controls the M2M device.
+ * @curr_ctx:		currently running instance
+ * @job_queue:		instances queued to run
+ * @job_spinlock:	protects job_queue
+ * @job_work:		worker to run queued jobs.
+ * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
+ * @m2m_ops:		driver callbacks
+ */
+struct v4l2_m2m_dev {
+	struct v4l2_m2m_ctx	*curr_ctx;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_entity	*source;
+	struct media_pad	source_pad;
+	struct media_entity	sink;
+	struct media_pad	sink_pad;
+	struct media_entity	proc;
+	struct media_pad	proc_pads[2];
+	struct media_intf_devnode *intf_devnode;
+#endif
+
+	struct list_head	job_queue;
+	spinlock_t		job_spinlock;
+	struct work_struct	job_work;
+	unsigned long		job_queue_flags;
+
+	const struct v4l2_m2m_ops *m2m_ops;
+};
+
+bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
+			  struct v4l2_m2m_ctx *m2m_ctx);
+void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
+				struct v4l2_m2m_ctx *m2m_ctx);
+
+void _v4l2_codec_qbuf(struct v4l2_m2m_ctx *m2m_ctx, struct vb2_queue *vq,
+		      struct v4l2_buffer *buf);
+
+#endif /* _MEDIA_V4L2_MEM2MEM_PRIV_H */
diff --git a/include/media/v4l2-mem2mem-codec.h b/include/media/v4l2-mem2mem-codec.h
new file mode 100644
index 000000000000..6e3d75fd4017
--- /dev/null
+++ b/include/media/v4l2-mem2mem-codec.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Memory-to-memory device framework, codec specific part.
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ * Pawel Osciak, <pawel@osciak.com>
+ * Marek Szyprowski, <m.szyprowski@samsung.com>
+ */
+
+#ifndef _MEDIA_V4L2_MEM2MEM_CODEC_H
+#define _MEDIA_V4L2_MEM2MEM_CODEC_H
+
+#include <media/v4l2-mem2mem.h>
+
+#endif /* _MEDIA_V4L2_MEM2MEM_CODEC_H */
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index d6c8eb2b5201..cebadec49666 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -75,6 +75,14 @@ struct v4l2_m2m_queue_ctx {
  * struct v4l2_m2m_ctx - Memory to memory context structure
  *
  * @q_lock: struct &mutex lock
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ * @cap_q_ctx: Capture (output to memory) queue context
+ * @out_q_ctx: Output (input from memory) queue context
+ * @queue: List of memory to memory contexts
+ * @job_flags: Job queue flags, used internally by v4l2-mem2mem.c:
+ *		%TRANS_QUEUED, %TRANS_RUNNING and %TRANS_ABORT.
+ * @finished: Wait queue used to signalize when a job queue finished.
+ * @priv: Instance private data
  * @new_frame: valid in the device_run callback: if true, then this
  *		starts a new frame; if false, then this is a new slice
  *		for an existing frame. This is always true unless
@@ -84,14 +92,6 @@ struct v4l2_m2m_queue_ctx {
  * @last_src_buf: indicate the last source buffer for draining
  * @next_buf_last: next capture queud buffer will be tagged as last
  * @has_stopped: indicate the device has been stopped
- * @m2m_dev: opaque pointer to the internal data to handle M2M context
- * @cap_q_ctx: Capture (output to memory) queue context
- * @out_q_ctx: Output (input from memory) queue context
- * @queue: List of memory to memory contexts
- * @job_flags: Job queue flags, used internally by v4l2-mem2mem.c:
- *		%TRANS_QUEUED, %TRANS_RUNNING and %TRANS_ABORT.
- * @finished: Wait queue used to signalize when a job queue finished.
- * @priv: Instance private data
  *
  * The memory to memory context is specific to a file handle, NOT to e.g.
  * a device.
@@ -100,18 +100,10 @@ struct v4l2_m2m_ctx {
 	/* optional cap/out vb2 queues lock */
 	struct mutex			*q_lock;
 
-	bool				new_frame;
-
-	bool				is_draining;
-	struct vb2_v4l2_buffer		*last_src_buf;
-	bool				next_buf_last;
-	bool				has_stopped;
-
 	/* internal use only */
 	struct v4l2_m2m_dev		*m2m_dev;
 
 	struct v4l2_m2m_queue_ctx	cap_q_ctx;
-
 	struct v4l2_m2m_queue_ctx	out_q_ctx;
 
 	/* For device job queue */
@@ -120,6 +112,13 @@ struct v4l2_m2m_ctx {
 	wait_queue_head_t		finished;
 
 	void				*priv;
+
+	/* codec specific fields */
+	bool				new_frame;
+	bool				is_draining;
+	struct vb2_v4l2_buffer		*last_src_buf;
+	bool				next_buf_last;
+	bool				has_stopped;
 };
 
 /**
-- 
2.40.1

