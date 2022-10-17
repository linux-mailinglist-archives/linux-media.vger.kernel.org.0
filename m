Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46ED560093C
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiJQIwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbiJQIwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7DE3F1F5
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jfOsNlXDl4Ky9pGDw7gxwKwv8tihM1LkRj+h6VH7oHA=;
        b=FzAm7hCAZpnaH6VzAZreiSQhRpb/zyVUOqoSeE4xNIrzv85VfRm1Hy6mZRU5aD8SVHH2nD
        6eIIcSitNP1UXaObRBuYAgdOlSl0UikCzVPrZCUgrXfqB4AvD6kZbQTWPJsY4yyxy6erw3
        75AYH9YDE9iy2RpKWMe3EIvA9XrgH/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-7rzodngMNyi5x-M9vbecqg-1; Mon, 17 Oct 2022 04:51:27 -0400
X-MC-Unique: 7rzodngMNyi5x-M9vbecqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8210101AA45;
        Mon, 17 Oct 2022 08:51:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BF95810A58CE;
        Mon, 17 Oct 2022 08:51:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 10/17] media: atomisp: Convert to videobuf2
Date:   Mon, 17 Oct 2022 10:50:50 +0200
Message-Id: <20221017085057.7483-11-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert atomisp to use videobuf2.

This fixes mmap not working and in general moving over to
the more modern videobuf2 is a good plan.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 120 ++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   3 +-
 .../media/atomisp/pci/atomisp_common.h        |   6 +-
 .../media/atomisp/pci/atomisp_compat.h        |   3 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |   4 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  | 479 ++++++------------
 .../staging/media/atomisp/pci/atomisp_fops.h  |   7 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 434 +++-------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  10 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  13 +-
 .../media/atomisp/pci/ia_css_frame_public.h   |  15 +
 11 files changed, 310 insertions(+), 784 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a97c54615ba4..0f8d683382fd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -30,7 +30,6 @@
 #include <asm/iosf_mbi.h>
 
 #include <media/v4l2-event.h>
-#include <media/videobuf-vmalloc.h>
 
 #define CREATE_TRACE_POINTS
 #include "atomisp_trace_event.h"
@@ -662,23 +661,6 @@ void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 	} while (--size32);
 }
 
-static struct videobuf_buffer *atomisp_css_frame_to_vbuf(
-    struct atomisp_video_pipe *pipe, struct ia_css_frame *frame)
-{
-	struct videobuf_vmalloc_memory *vm_mem;
-	struct ia_css_frame *handle;
-	int i;
-
-	for (i = 0; pipe->capq.bufs[i]; i++) {
-		vm_mem = pipe->capq.bufs[i]->priv;
-		handle = vm_mem->vaddr;
-		if (handle && handle->data == frame->data)
-			return pipe->capq.bufs[i];
-	}
-
-	return NULL;
-}
-
 int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
 {
 	unsigned long irqflags;
@@ -695,37 +677,40 @@ int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
 	return buffers_in_css;
 }
 
-void atomisp_buffer_done(struct atomisp_video_pipe *pipe, struct videobuf_buffer *vb,
-			 int state)
+void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state)
 {
+	struct atomisp_video_pipe *pipe = vb_to_pipe(&frame->vb.vb2_buf);
+
 	lockdep_assert_held(&pipe->irq_lock);
 
-	vb->ts = ktime_get_ns();
-	vb->field_count = atomic_read(&pipe->asd->sequence) << 1;
-	vb->state = state;
-	list_del(&vb->queue);
-	wake_up(&vb->done);
+	frame->vb.vb2_buf.timestamp = ktime_get_ns();
+	frame->vb.field = pipe->pix.field;
+	frame->vb.sequence = atomic_read(&pipe->asd->sequence);
+	list_del(&frame->queue);
+	if (state == VB2_BUF_STATE_DONE)
+		vb2_set_plane_payload(&frame->vb.vb2_buf, 0, pipe->pix.sizeimage);
+	vb2_buffer_done(&frame->vb.vb2_buf, state);
 }
 
 void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames)
 {
-	struct videobuf_buffer *_vb, *vb;
+	struct ia_css_frame *frame, *_frame;
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&pipe->irq_lock, irqflags);
 
-	list_for_each_entry_safe(vb, _vb, &pipe->buffers_in_css, queue) {
+	list_for_each_entry_safe(frame, _frame, &pipe->buffers_in_css, queue) {
 		if (warn_on_css_frames)
 			dev_warn(pipe->isp->dev, "Warning: CSS frames queued on flush\n");
-		atomisp_buffer_done(pipe, vb, VIDEOBUF_ERROR);
+		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
 	}
 
-	list_for_each_entry_safe(vb, _vb, &pipe->activeq, queue)
-		atomisp_buffer_done(pipe, vb, VIDEOBUF_ERROR);
+	list_for_each_entry_safe(frame, _frame, &pipe->activeq, queue)
+		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
 
-	list_for_each_entry_safe(vb, _vb, &pipe->buffers_waiting_for_param, queue) {
-		pipe->frame_request_config_id[vb->i] = 0;
-		atomisp_buffer_done(pipe, vb, VIDEOBUF_ERROR);
+	list_for_each_entry_safe(frame, _frame, &pipe->buffers_waiting_for_param, queue) {
+		pipe->frame_request_config_id[frame->vb.vb2_buf.index] = 0;
+		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
 	}
 
 	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
@@ -874,7 +859,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		      enum ia_css_pipe_id css_pipe_id,
 		      bool q_buffers, enum atomisp_input_stream_id stream_id)
 {
-	struct videobuf_buffer *vb = NULL;
 	struct atomisp_video_pipe *pipe = NULL;
 	struct atomisp_css_buffer buffer;
 	bool requeue = false;
@@ -1027,10 +1011,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 				dev_dbg(isp->dev, "%s thumb no flash in this frame\n",
 					__func__);
 		}
-		vb = atomisp_css_frame_to_vbuf(pipe, frame);
-		WARN_ON(!vb);
-		if (vb)
-			pipe->frame_config_id[vb->i] = frame->isp_config_id;
+		pipe->frame_config_id[frame->vb.vb2_buf.index] = frame->isp_config_id;
 		if (css_pipe_id == IA_CSS_PIPE_ID_CAPTURE &&
 		    asd->pending_capture_request > 0) {
 			err = atomisp_css_offline_capture_configure(asd,
@@ -1066,13 +1047,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 		dev_dbg(isp->dev, "%s: main frame with exp_id %d is ready\n",
 			__func__, frame->exp_id);
-		vb = atomisp_css_frame_to_vbuf(pipe, frame);
-		if (!vb) {
-			WARN_ON(1);
-			break;
-		}
 
-		i = vb->i;
+		i = frame->vb.vb2_buf.index;
 
 		/* free the parameters */
 		if (pipe->frame_params[i]) {
@@ -1183,9 +1159,9 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	default:
 		break;
 	}
-	if (vb) {
+	if (frame) {
 		spin_lock_irqsave(&pipe->irq_lock, irqflags);
-		atomisp_buffer_done(pipe, vb, error ? VIDEOBUF_ERROR : VIDEOBUF_DONE);
+		atomisp_buffer_done(frame, error ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 	}
 
@@ -3656,6 +3632,18 @@ void atomisp_free_css_parameters(struct atomisp_css_params *css_param)
 	}
 }
 
+static void atomisp_move_frame_to_activeq(struct ia_css_frame *frame,
+					  struct atomisp_css_params_with_list *param)
+{
+	struct atomisp_video_pipe *pipe = vb_to_pipe(&frame->vb.vb2_buf);
+	unsigned long irqflags;
+
+	pipe->frame_params[frame->vb.vb2_buf.index] = param;
+	spin_lock_irqsave(&pipe->irq_lock, irqflags);
+	list_move_tail(&frame->queue, &pipe->activeq);
+	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
+}
+
 /*
  * Check parameter queue list and buffer queue list to find out if matched items
  * and then set parameter to CSS and enqueue buffer to CSS.
@@ -3666,11 +3654,10 @@ void atomisp_free_css_parameters(struct atomisp_css_params *css_param)
 void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 {
 	struct atomisp_sub_device *asd = pipe->asd;
-	struct videobuf_buffer *vb = NULL, *vb_tmp;
+	struct ia_css_frame *frame = NULL, *frame_tmp;
 	struct atomisp_css_params_with_list *param = NULL, *param_tmp;
-	struct videobuf_vmalloc_memory *vm_mem = NULL;
-	unsigned long irqflags;
 	bool need_to_enqueue_buffer = false;
+	int i;
 
 	lockdep_assert_held(&asd->isp->mutex);
 
@@ -3694,44 +3681,33 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 	    list_empty(&pipe->buffers_waiting_for_param))
 		return;
 
-	list_for_each_entry_safe(vb, vb_tmp,
+	list_for_each_entry_safe(frame, frame_tmp,
 				 &pipe->buffers_waiting_for_param, queue) {
-		if (pipe->frame_request_config_id[vb->i]) {
+		i = frame->vb.vb2_buf.index;
+		if (pipe->frame_request_config_id[i]) {
 			list_for_each_entry_safe(param, param_tmp,
 						 &pipe->per_frame_params, list) {
-				if (pipe->frame_request_config_id[vb->i] !=
-				    param->params.isp_config_id)
+				if (pipe->frame_request_config_id[i] != param->params.isp_config_id)
 					continue;
 
 				list_del(&param->list);
-				list_del(&vb->queue);
+
 				/*
 				 * clear the request config id as the buffer
 				 * will be handled and enqueued into CSS soon
 				 */
-				pipe->frame_request_config_id[vb->i] = 0;
-				pipe->frame_params[vb->i] = param;
-				vm_mem = vb->priv;
-				BUG_ON(!vm_mem);
+				pipe->frame_request_config_id[i] = 0;
+				atomisp_move_frame_to_activeq(frame, param);
+				need_to_enqueue_buffer = true;
 				break;
 			}
 
-			if (vm_mem) {
-				spin_lock_irqsave(&pipe->irq_lock, irqflags);
-				list_add_tail(&vb->queue, &pipe->activeq);
-				spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
-				vm_mem = NULL;
-				need_to_enqueue_buffer = true;
-			} else {
-				/* The is the end, stop further loop */
+			if (list_entry_is_head(param, &pipe->per_frame_params, list)) {
+				/* The is the end, stop outer loop */
 				break;
 			}
 		} else {
-			list_del(&vb->queue);
-			pipe->frame_params[vb->i] = NULL;
-			spin_lock_irqsave(&pipe->irq_lock, irqflags);
-			list_add_tail(&vb->queue, &pipe->activeq);
-			spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
+			atomisp_move_frame_to_activeq(frame, NULL);
 			need_to_enqueue_buffer = true;
 		}
 	}
@@ -5538,8 +5514,6 @@ int atomisp_set_fmt(struct file *file, void *unused, struct v4l2_format *f)
 	f->fmt.pix.priv = PAGE_ALIGN(pipe->pix.width *
 				     pipe->pix.height * 2);
 
-	pipe->capq.field = f->fmt.pix.field;
-
 	/*
 	 * If in video 480P case, no GFX throttle
 	 */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 1b46f4e60924..4c965d17c9a3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -56,8 +56,7 @@ struct camera_mipi_info *atomisp_to_sensor_mipi_info(struct v4l2_subdev *sd);
 struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev);
 int atomisp_reset(struct atomisp_device *isp);
 int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe);
-void atomisp_buffer_done(struct atomisp_video_pipe *pipe, struct videobuf_buffer *buf,
-			 int state);
+void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state);
 void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames);
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
 void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index b29874f2bc0f..07c38e487a66 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -25,7 +25,7 @@
 
 #include <linux/v4l2-mediabus.h>
 
-#include <media/videobuf-core.h>
+#include <media/videobuf2-v4l2.h>
 
 #include "atomisp_compat.h"
 
@@ -64,8 +64,4 @@ struct atomisp_fmt {
 	u32 bayer_order;
 };
 
-struct atomisp_buffer {
-	struct videobuf_buffer	vb;
-};
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index a6d85d0f9ae5..d1893a0deec1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -22,7 +22,6 @@
 #include "atomisp_compat_css20.h"
 
 #include "../../include/linux/atomisp.h"
-#include <media/videobuf-vmalloc.h>
 
 struct atomisp_device;
 struct atomisp_sub_device;
@@ -61,7 +60,7 @@ int atomisp_css_irq_enable(struct atomisp_device *isp,
 			   enum ia_css_irq_info info, bool enable);
 
 int atomisp_q_video_buffer_to_css(struct atomisp_sub_device *asd,
-				  struct videobuf_vmalloc_memory *vm_mem,
+				  struct ia_css_frame *frame,
 				  enum atomisp_input_stream_id stream_id,
 				  enum ia_css_buffer_type css_buf_type,
 				  enum ia_css_pipe_id css_pipe_id);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index fdc05548d972..ea6114679c53 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -996,7 +996,7 @@ void atomisp_css_init_struct(struct atomisp_sub_device *asd)
 }
 
 int atomisp_q_video_buffer_to_css(struct atomisp_sub_device *asd,
-				  struct videobuf_vmalloc_memory *vm_mem,
+				  struct ia_css_frame *frame,
 				  enum atomisp_input_stream_id stream_id,
 				  enum ia_css_buffer_type css_buf_type,
 				  enum ia_css_pipe_id css_pipe_id)
@@ -1006,7 +1006,7 @@ int atomisp_q_video_buffer_to_css(struct atomisp_sub_device *asd,
 	int err;
 
 	css_buf.type = css_buf_type;
-	css_buf.data.frame = vm_mem->vaddr;
+	css_buf.data.frame = frame;
 
 	err = ia_css_pipe_enqueue_buffer(
 		  stream_env->pipes[css_pipe_id], &css_buf);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index aefe1c56c262..eb9555c5e879 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -22,7 +22,7 @@
 #include <linux/pm_runtime.h>
 
 #include <media/v4l2-ioctl.h>
-#include <media/videobuf-vmalloc.h>
+#include <media/videobuf2-vmalloc.h>
 
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
@@ -35,49 +35,53 @@
 #include "atomisp-regs.h"
 #include "hmm/hmm.h"
 
+#include "ia_css_frame.h"
 #include "type_support.h"
 #include "device_access/device_access.h"
 
-#define ISP_LEFT_PAD			128	/* equal to 2*NWAY */
-
 /*
- * input image data, and current frame resolution for test
+ * Videobuf2 ops
  */
-#define	ISP_PARAM_MMAP_OFFSET	0xfffff000
+static int atomisp_queue_setup(struct vb2_queue *vq,
+			       unsigned int *nbuffers, unsigned int *nplanes,
+			       unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct atomisp_video_pipe *pipe = container_of(vq, struct atomisp_video_pipe, vb_queue);
+	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
+	int ret;
 
-#define MAGIC_CHECK(is, should)	\
-	do { \
-		if (unlikely((is) != (should))) { \
-			pr_err("magic mismatch: %x (expected %x)\n", \
-				is, should); \
-			BUG(); \
-		} \
-	} while (0)
+	ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
+	if (ret)
+		return ret;
 
-/*
- * Videobuf ops
- */
-static int atomisp_buf_setup(struct videobuf_queue *vq, unsigned int *count,
-			     unsigned int *size)
-{
-	struct atomisp_video_pipe *pipe = vq->priv_data;
+	atomisp_alloc_css_stat_bufs(pipe->asd, ATOMISP_INPUT_STREAM_GENERAL);
 
-	*size = pipe->pix.sizeimage;
+	*nplanes = 1;
+	sizes[0] = PAGE_ALIGN(pipe->pix.sizeimage);
 
 	return 0;
 }
 
-static int atomisp_buf_prepare(struct videobuf_queue *vq,
-			       struct videobuf_buffer *vb,
-			       enum v4l2_field field)
+static int atomisp_buf_init(struct vb2_buffer *vb)
 {
-	struct atomisp_video_pipe *pipe = vq->priv_data;
+	struct atomisp_video_pipe *pipe = vb_to_pipe(vb);
+	struct ia_css_frame *frame = vb_to_frame(vb);
+	int ret;
 
-	vb->size = pipe->pix.sizeimage;
-	vb->width = pipe->pix.width;
-	vb->height = pipe->pix.height;
-	vb->field = field;
-	vb->state = VIDEOBUF_PREPARED;
+	ret = ia_css_frame_init_from_info(frame, &pipe->frame_info);
+	if (ret)
+		return ret;
+
+	if (frame->data_bytes > vb2_plane_size(vb, 0)) {
+		dev_err(pipe->asd->isp->dev, "Internal error frame.data_bytes(%u) > vb.length(%lu)\n",
+			frame->data_bytes, vb2_plane_size(vb, 0));
+		return -EIO;
+	}
+
+	frame->data = hmm_create_from_vmalloc_buf(vb2_plane_size(vb, 0),
+						  vb2_plane_vaddr(vb, 0));
+	if (frame->data == mmgr_NULL)
+		return -ENOMEM;
 
 	return 0;
 }
@@ -212,7 +216,6 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 					  enum ia_css_buffer_type css_buf_type,
 					  enum ia_css_pipe_id css_pipe_id)
 {
-	struct videobuf_vmalloc_memory *vm_mem;
 	struct atomisp_css_params_with_list *param;
 	struct ia_css_dvs_grid_info *dvs_grid =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
@@ -229,26 +232,22 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 
 	space = ATOMISP_CSS_Q_DEPTH - atomisp_buffers_in_css(pipe);
 	while (space--) {
-		struct videobuf_buffer *vb;
+		struct ia_css_frame *frame;
 
 		spin_lock_irqsave(&pipe->irq_lock, irqflags);
-		vb = list_first_entry_or_null(&pipe->activeq, struct videobuf_buffer, queue);
-		if (vb) {
-			list_move_tail(&vb->queue, &pipe->buffers_in_css);
-			vb->state = VIDEOBUF_ACTIVE;
-		}
+		frame = list_first_entry_or_null(&pipe->activeq, struct ia_css_frame, queue);
+		if (frame)
+			list_move_tail(&frame->queue, &pipe->buffers_in_css);
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 
-		if (!vb)
+		if (!frame)
 			return -EINVAL;
 
 		/*
 		 * If there is a per_frame setting to apply on the buffer,
 		 * do it before buffer en-queueing.
 		 */
-		vm_mem = vb->priv;
-
-		param = pipe->frame_params[vb->i];
+		param = pipe->frame_params[frame->vb.vb2_buf.index];
 		if (param) {
 			atomisp_makeup_css_parameters(asd,
 						      &asd->params.css_param.update_flag,
@@ -262,8 +261,7 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 				if (!err)
 					asd->params.config.dz_config = &param->params.dz_config;
 			}
-			atomisp_css_set_isp_config_applied_frame(asd,
-				vm_mem->vaddr);
+			atomisp_css_set_isp_config_applied_frame(asd, frame);
 			atomisp_css_update_isp_params_on_pipe(asd,
 							      asd->stream_env[stream_id].pipes[css_pipe_id]);
 			asd->params.dvs_6axis = (struct ia_css_dvs_6axis_config *)
@@ -288,14 +286,14 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 				    &asd->params.css_param.dz_config;
 				asd->params.css_update_params_needed = true;
 			}
+			pipe->frame_params[frame->vb.vb2_buf.index] = NULL;
 		}
 		/* Enqueue buffer */
-		err = atomisp_q_video_buffer_to_css(asd, vm_mem, stream_id,
+		err = atomisp_q_video_buffer_to_css(asd, frame, stream_id,
 						    css_buf_type, css_pipe_id);
 		if (err) {
 			spin_lock_irqsave(&pipe->irq_lock, irqflags);
-			list_move_tail(&vb->queue, &pipe->activeq);
-			vb->state = VIDEOBUF_QUEUED;
+			list_move_tail(&frame->queue, &pipe->activeq);
 			spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 			dev_err(asd->isp->dev, "%s, css q fails: %d\n",
 				__func__, err);
@@ -522,11 +520,33 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	return 0;
 }
 
-static void atomisp_buf_queue(struct videobuf_queue *vq,
-			      struct videobuf_buffer *vb)
+static void atomisp_buf_queue(struct vb2_buffer *vb)
 {
-	struct atomisp_video_pipe *pipe = vq->priv_data;
+	struct atomisp_video_pipe *pipe = vb_to_pipe(vb);
+	struct ia_css_frame *frame = vb_to_frame(vb);
+	struct atomisp_sub_device *asd = pipe->asd;
+	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
+	unsigned long irqflags;
+	int ret;
+
+/*	Uncomment mutex_lock once we move to using a per queue lock
+	mutex_lock(&asd->isp->mutex); */
 
+	ret = atomisp_pipe_check(pipe, false);
+	if (ret || pipe->stopping) {
+		spin_lock_irqsave(&pipe->irq_lock, irqflags);
+		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
+		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
+		goto unlock;
+	}
+
+	/* FIXME this ugliness comes from the original atomisp buffer handling */
+	if (!(vb->skip_cache_sync_on_finish && vb->skip_cache_sync_on_prepare))
+		wbinvd();
+
+	pipe->frame_params[vb->index] = NULL;
+
+	spin_lock_irqsave(&pipe->irq_lock, irqflags);
 	/*
 	 * when a frame buffer meets following conditions, it should be put into
 	 * the waiting list:
@@ -538,40 +558,86 @@ static void atomisp_buf_queue(struct videobuf_queue *vq,
 	 *     get enqueued.
 	 */
 	if (!atomisp_is_vf_pipe(pipe) &&
-	    (pipe->frame_request_config_id[vb->i] ||
+	    (pipe->frame_request_config_id[vb->index] ||
 	     !list_empty(&pipe->buffers_waiting_for_param)))
-		list_add_tail(&vb->queue, &pipe->buffers_waiting_for_param);
+		list_add_tail(&frame->queue, &pipe->buffers_waiting_for_param);
 	else
-		list_add_tail(&vb->queue, &pipe->activeq);
+		list_add_tail(&frame->queue, &pipe->activeq);
+
+	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
+
+	/* TODO: do this better, not best way to queue to css */
+	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
+		if (!list_empty(&pipe->buffers_waiting_for_param))
+			atomisp_handle_parameter_and_buffer(pipe);
+		else
+			atomisp_qbuffers_to_css(asd);
+	}
 
-	vb->state = VIDEOBUF_QUEUED;
+	/*
+	 * Workaround: Due to the design of HALv3,
+	 * sometimes in ZSL or SDV mode HAL needs to
+	 * capture multiple images within one streaming cycle.
+	 * But the capture number cannot be determined by HAL.
+	 * So HAL only sets the capture number to be 1 and queue multiple
+	 * buffers. Atomisp driver needs to check this case and re-trigger
+	 * CSS to do capture when new buffer is queued.
+	 */
+	if (asd->continuous_mode->val && source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE &&
+	    !asd->enable_raw_buffer_lock->val && asd->params.offline_parm.num_captures == 1) {
+		asd->pending_capture_request++;
+		dev_dbg(asd->isp->dev, "Add one pending capture request.\n");
+	}
+
+unlock:
+/*	Uncomment mutex_unlock once we move to using a per queue lock
+	mutex_unlock(&asd->isp->mutex) */;
 }
 
-static void atomisp_buf_release(struct videobuf_queue *vq,
-				struct videobuf_buffer *vb)
+static void atomisp_buf_cleanup(struct vb2_buffer *vb)
 {
-	vb->state = VIDEOBUF_NEEDS_INIT;
-	atomisp_videobuf_free_buf(vb);
+	struct atomisp_video_pipe *pipe = vb_to_pipe(vb);
+	struct ia_css_frame *frame = vb_to_frame(vb);
+	int index = frame->vb.vb2_buf.index;
+
+	pipe->frame_request_config_id[index] = 0;
+	pipe->frame_params[index] = NULL;
+
+	hmm_free(frame->data);
 }
 
-static const struct videobuf_queue_ops videobuf_qops = {
-	.buf_setup	= atomisp_buf_setup,
-	.buf_prepare	= atomisp_buf_prepare,
-	.buf_queue	= atomisp_buf_queue,
-	.buf_release	= atomisp_buf_release,
+static const struct vb2_ops atomisp_vb2_ops = {
+	.queue_setup		= atomisp_queue_setup,
+	.buf_init		= atomisp_buf_init,
+	.buf_cleanup		= atomisp_buf_cleanup,
+	.buf_queue		= atomisp_buf_queue,
+	.start_streaming	= atomisp_start_streaming,
+	.stop_streaming		= atomisp_stop_streaming,
 };
 
 static int atomisp_init_pipe(struct atomisp_video_pipe *pipe)
 {
+	int ret;
+
 	/* init locks */
 	spin_lock_init(&pipe->irq_lock);
+	/* FIXME add per pipe vb_queue mutex
+	mutex_init(&pipe->vb_queue_lock); */
+
+	/* Init videobuf2 queue structure */
+	pipe->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	pipe->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR;
+	pipe->vb_queue.buf_struct_size = sizeof(struct ia_css_frame);
+	pipe->vb_queue.ops = &atomisp_vb2_ops;
+	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
+	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	ret = vb2_queue_init(&pipe->vb_queue);
+	if (ret)
+		return ret;
 
-	videobuf_queue_vmalloc_init(&pipe->capq, &videobuf_qops, NULL,
-				    &pipe->irq_lock,
-				    V4L2_BUF_TYPE_VIDEO_CAPTURE,
-				    V4L2_FIELD_NONE,
-				    sizeof(struct atomisp_buffer), pipe,
-				    NULL);	/* ext_lock: NULL */
+	pipe->vdev.queue = &pipe->vb_queue;
+	/* FIXME set per pipe vb_queue mutex as vb_queue lock
+	pipe->vdev.queue->lock = &pipe->vb_queue_lock; */
 
 	INIT_LIST_HEAD(&pipe->activeq);
 	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
@@ -783,33 +849,28 @@ static int atomisp_release(struct file *file)
 	if (!isp)
 		return -EBADF;
 
+	/* FIXME lock pipe->vb_queue_lock once added */
 	mutex_lock(&isp->mutex);
 
 	dev_dbg(isp->dev, "release device %s\n", vdev->name);
 
 	asd->subdev.devnode = vdev;
 
-	pipe->users--;
-
-	if (pipe->capq.streaming)
-		dev_warn(isp->dev,
-			 "%s: ISP still streaming while closing!",
-			 __func__);
-
-	if (pipe->capq.streaming &&
-	    atomisp_streamoff(file, NULL, V4L2_BUF_TYPE_VIDEO_CAPTURE)) {
-		dev_err(isp->dev, "atomisp_streamoff failed on release, driver bug");
-		goto done;
+	/*
+	 * FIXME This if is copied from _vb2_fop_release, this cannot use that
+	 * because that calls v4l2_fh_release() earlier then this function.
+	 * Maybe we can release the fh earlier though, it does not look like
+	 * anything needs it after this.
+	 */
+	if (file->private_data == vdev->queue->owner) {
+		vb2_queue_release(vdev->queue);
+		vdev->queue->owner = NULL;
 	}
 
+	pipe->users--;
 	if (pipe->users)
 		goto done;
 
-	if (atomisp_reqbufs(file, NULL, &req)) {
-		dev_err(isp->dev, "atomisp_reqbufs failed on release, driver bug");
-		goto done;
-	}
-
 	/*
 	 * A little trick here:
 	 * file injection input resolution is recorded in the sink pad,
@@ -867,260 +928,17 @@ static int atomisp_release(struct file *file)
 				     V4L2_SEL_TGT_COMPOSE, 0,
 				     &clear_compose);
 	mutex_unlock(&isp->mutex);
+	/* FIXME unlock pipe->vb_queue_lock once added */
 
 	return v4l2_fh_release(file);
 }
 
-/*
- * Memory help functions for image frame and private parameters
- */
-static int do_isp_mm_remap(struct atomisp_device *isp,
-			   struct vm_area_struct *vma,
-			   ia_css_ptr isp_virt, u32 host_virt, u32 pgnr)
-{
-	u32 pfn;
-
-	while (pgnr) {
-		pfn = hmm_virt_to_phys(isp_virt) >> PAGE_SHIFT;
-		if (remap_pfn_range(vma, host_virt, pfn,
-				    PAGE_SIZE, PAGE_SHARED)) {
-			dev_err(isp->dev, "remap_pfn_range err.\n");
-			return -EAGAIN;
-		}
-
-		isp_virt += PAGE_SIZE;
-		host_virt += PAGE_SIZE;
-		pgnr--;
-	}
-
-	return 0;
-}
-
-static int frame_mmap(struct atomisp_device *isp,
-		      const struct ia_css_frame *frame, struct vm_area_struct *vma)
-{
-	ia_css_ptr isp_virt;
-	u32 host_virt;
-	u32 pgnr;
-
-	if (!frame) {
-		dev_err(isp->dev, "%s: NULL frame pointer.\n", __func__);
-		return -EINVAL;
-	}
-
-	host_virt = vma->vm_start;
-	isp_virt = frame->data;
-	pgnr = DIV_ROUND_UP(frame->data_bytes, PAGE_SIZE);
-
-	if (do_isp_mm_remap(isp, vma, isp_virt, host_virt, pgnr))
-		return -EAGAIN;
-
-	return 0;
-}
-
-int atomisp_videobuf_mmap_mapper(struct videobuf_queue *q,
-				 struct vm_area_struct *vma)
-{
-	u32 offset = vma->vm_pgoff << PAGE_SHIFT;
-	int ret = -EINVAL, i;
-	struct atomisp_device *isp =
-	    ((struct atomisp_video_pipe *)(q->priv_data))->isp;
-	struct videobuf_vmalloc_memory *vm_mem;
-	struct videobuf_mapping *map;
-
-	MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
-	if (!(vma->vm_flags & VM_WRITE) || !(vma->vm_flags & VM_SHARED)) {
-		dev_err(isp->dev, "map appl bug: PROT_WRITE and MAP_SHARED are required\n");
-		return -EINVAL;
-	}
-
-	mutex_lock(&q->vb_lock);
-	for (i = 0; i < VIDEO_MAX_FRAME; i++) {
-		struct videobuf_buffer *buf = q->bufs[i];
-
-		if (!buf)
-			continue;
-
-		map = kzalloc(sizeof(struct videobuf_mapping), GFP_KERNEL);
-		if (!map) {
-			mutex_unlock(&q->vb_lock);
-			return -ENOMEM;
-		}
-
-		buf->map = map;
-		map->q = q;
-
-		buf->baddr = vma->vm_start;
-
-		if (buf && buf->memory == V4L2_MEMORY_MMAP &&
-		    buf->boff == offset) {
-			vm_mem = buf->priv;
-			ret = frame_mmap(isp, vm_mem->vaddr, vma);
-			vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-			break;
-		}
-	}
-	mutex_unlock(&q->vb_lock);
-
-	return ret;
-}
-
-/* The input frame contains left and right padding that need to be removed.
- * There is always ISP_LEFT_PAD padding on the left side.
- * There is also padding on the right (padded_width - width).
- */
-static int remove_pad_from_frame(struct atomisp_device *isp,
-				 struct ia_css_frame *in_frame, __u32 width, __u32 height)
-{
-	unsigned int i;
-	unsigned short *buffer;
-	int ret = 0;
-	ia_css_ptr load = in_frame->data;
-	ia_css_ptr store = load;
-
-	buffer = kmalloc_array(width, sizeof(load), GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	load += ISP_LEFT_PAD;
-	for (i = 0; i < height; i++) {
-		ret = hmm_load(load, buffer, width * sizeof(load));
-		if (ret < 0)
-			goto remove_pad_error;
-
-		ret = hmm_store(store, buffer, width * sizeof(store));
-		if (ret < 0)
-			goto remove_pad_error;
-
-		load  += in_frame->frame_info.padded_width;
-		store += width;
-	}
-
-remove_pad_error:
-	kfree(buffer);
-	return ret;
-}
-
-static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
-	struct ia_css_frame *raw_virt_addr;
-	u32 start = vma->vm_start;
-	u32 end = vma->vm_end;
-	u32 size = end - start;
-	u32 origin_size, new_size;
-	int ret;
-
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
-	if (!(vma->vm_flags & (VM_WRITE | VM_READ)))
-		return -EACCES;
-
-	mutex_lock(&isp->mutex);
-
-	if (!(vma->vm_flags & VM_SHARED)) {
-		/* Map private buffer.
-		 * Set VM_SHARED to the flags since we need
-		 * to map the buffer page by page.
-		 * Without VM_SHARED, remap_pfn_range() treats
-		 * this kind of mapping as invalid.
-		 */
-		vma->vm_flags |= VM_SHARED;
-		ret = hmm_mmap(vma, vma->vm_pgoff << PAGE_SHIFT);
-		mutex_unlock(&isp->mutex);
-		return ret;
-	}
-
-	/* mmap for ISP offline raw data */
-	if (atomisp_subdev_source_pad(vdev)
-	    == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE &&
-	    vma->vm_pgoff == (ISP_PARAM_MMAP_OFFSET >> PAGE_SHIFT)) {
-		new_size = pipe->pix.width * pipe->pix.height * 2;
-		if (asd->params.online_process != 0) {
-			ret = -EINVAL;
-			goto error;
-		}
-		raw_virt_addr = asd->raw_output_frame;
-		if (!raw_virt_addr) {
-			dev_err(isp->dev, "Failed to request RAW frame\n");
-			ret = -EINVAL;
-			goto error;
-		}
-
-		ret = remove_pad_from_frame(isp, raw_virt_addr,
-					    pipe->pix.width, pipe->pix.height);
-		if (ret < 0) {
-			dev_err(isp->dev, "remove pad failed.\n");
-			goto error;
-		}
-		origin_size = raw_virt_addr->data_bytes;
-		raw_virt_addr->data_bytes = new_size;
-
-		if (size != PAGE_ALIGN(new_size)) {
-			dev_err(isp->dev, "incorrect size for mmap ISP  Raw Frame\n");
-			ret = -EINVAL;
-			goto error;
-		}
-
-		if (frame_mmap(isp, raw_virt_addr, vma)) {
-			dev_err(isp->dev, "frame_mmap failed.\n");
-			raw_virt_addr->data_bytes = origin_size;
-			ret = -EAGAIN;
-			goto error;
-		}
-		raw_virt_addr->data_bytes = origin_size;
-		vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-		mutex_unlock(&isp->mutex);
-		return 0;
-	}
-
-	/*
-	 * mmap for normal frames
-	 */
-	if (size != pipe->pix.sizeimage) {
-		dev_err(isp->dev, "incorrect size for mmap ISP frames\n");
-		ret = -EINVAL;
-		goto error;
-	}
-	mutex_unlock(&isp->mutex);
-
-	return atomisp_videobuf_mmap_mapper(&pipe->capq, vma);
-
-error:
-	mutex_unlock(&isp->mutex);
-
-	return ret;
-}
-
-static __poll_t atomisp_poll(struct file *file,
-			     struct poll_table_struct *pt)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	mutex_lock(&isp->mutex);
-	if (pipe->capq.streaming != 1) {
-		mutex_unlock(&isp->mutex);
-		return EPOLLERR;
-	}
-	mutex_unlock(&isp->mutex);
-
-	return videobuf_poll_stream(file, &pipe->capq, pt);
-}
-
 const struct v4l2_file_operations atomisp_fops = {
 	.owner = THIS_MODULE,
 	.open = atomisp_open,
 	.release = atomisp_release,
-	.mmap = atomisp_mmap,
+	.mmap = vb2_fop_mmap,
+	.poll = vb2_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 #ifdef CONFIG_COMPAT
 	/*
@@ -1129,5 +947,4 @@ const struct v4l2_file_operations atomisp_fops = {
 	.compat_ioctl32 = atomisp_compat_ioctl32,
 	 */
 #endif
-	.poll = atomisp_poll,
 };
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 8d3ea33a7d9a..10e43126b693 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -29,13 +29,6 @@ unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
  * Memory help functions for image frame and private parameters
  */
 
-int atomisp_videobuf_mmap_mapper(struct videobuf_queue *q,
-				 struct vm_area_struct *vma);
-
-int atomisp_qbuf_to_css(struct atomisp_device *isp,
-			struct atomisp_video_pipe *pipe,
-			struct videobuf_buffer *vb);
-
 int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd);
 
 extern const struct v4l2_file_operations atomisp_fops;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 7d5413981714..0042e846a045 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -23,7 +23,6 @@
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
-#include <media/videobuf-vmalloc.h>
 
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
@@ -542,6 +541,11 @@ int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
 	if (pipe->isp->isp_fatal_error)
 		return -EIO;
 
+	if (settings_change && vb2_is_busy(&pipe->vb_queue)) {
+		dev_err(pipe->isp->dev, "Set fmt/input IOCTL while streaming\n");
+		return -EBUSY;
+	}
+
 	switch (pipe->asd->streaming) {
 	case ATOMISP_DEVICE_STREAMING_DISABLED:
 		break;
@@ -632,10 +636,10 @@ static int atomisp_enum_input(struct file *file, void *fh,
 static unsigned int
 atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
-	return asd->video_out_preview.capq.streaming
-	       + asd->video_out_capture.capq.streaming
-	       + asd->video_out_video_capture.capq.streaming
-	       + asd->video_out_vf.capq.streaming;
+	return asd->video_out_preview.vb_queue.start_streaming_called
+	       + asd->video_out_capture.vb_queue.start_streaming_called
+	       + asd->video_out_video_capture.vb_queue.start_streaming_called
+	       + asd->video_out_vf.vb_queue.start_streaming_called;
 }
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
@@ -968,37 +972,6 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt_cap(file, fh, f);
 }
 
-/*
- * Free videobuffer buffer priv data
- */
-void atomisp_videobuf_free_buf(struct videobuf_buffer *vb)
-{
-	struct videobuf_vmalloc_memory *vm_mem;
-
-	if (!vb)
-		return;
-
-	vm_mem = vb->priv;
-	if (vm_mem && vm_mem->vaddr) {
-		ia_css_frame_free(vm_mem->vaddr);
-		vm_mem->vaddr = NULL;
-	}
-}
-
-/*
- * this function is used to free video buffer queue
- */
-static void atomisp_videobuf_free_queue(struct videobuf_queue *q)
-{
-	int i;
-
-	for (i = 0; i < VIDEO_MAX_FRAME; i++) {
-		atomisp_videobuf_free_buf(q->bufs[i]);
-		kfree(q->bufs[i]);
-		q->bufs[i] = NULL;
-	}
-}
-
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				uint16_t stream_id)
 {
@@ -1100,178 +1073,13 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 	return -ENOMEM;
 }
 
-/*
- * Initiate Memory Mapping or User Pointer I/O
- */
-int atomisp_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *req)
+static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer *buf)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
-	struct ia_css_frame_info frame_info;
-	struct ia_css_frame *frame;
-	struct videobuf_vmalloc_memory *vm_mem;
-	u16 source_pad = atomisp_subdev_source_pad(vdev);
-	int ret = 0, i = 0;
-
-	if (req->count == 0) {
-		mutex_lock(&pipe->capq.vb_lock);
-		if (!list_empty(&pipe->capq.stream))
-			videobuf_queue_cancel(&pipe->capq);
-
-		atomisp_videobuf_free_queue(&pipe->capq);
-		mutex_unlock(&pipe->capq.vb_lock);
-		/* clear request config id */
-		memset(pipe->frame_request_config_id, 0,
-		       VIDEO_MAX_FRAME * sizeof(unsigned int));
-		memset(pipe->frame_params, 0,
-		       VIDEO_MAX_FRAME *
-		       sizeof(struct atomisp_css_params_with_list *));
-		return 0;
-	}
-
-	ret = videobuf_reqbufs(&pipe->capq, req);
-	if (ret)
-		return ret;
-
-	atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
-
-	/*
-	 * for user pointer type, buffers are not really allocated here,
-	 * buffers are setup in QBUF operation through v4l2_buffer structure
-	 */
-	if (req->memory == V4L2_MEMORY_USERPTR)
-		return 0;
-
-	ret = atomisp_get_css_frame_info(asd, source_pad, &frame_info);
-	if (ret)
-		return ret;
-
-	/*
-	 * Allocate the real frame here for selected node using our
-	 * memory management function
-	 */
-	for (i = 0; i < req->count; i++) {
-		if (ia_css_frame_allocate_from_info(&frame, &frame_info))
-			goto error;
-		vm_mem = pipe->capq.bufs[i]->priv;
-		vm_mem->vaddr = frame;
-	}
-
-	return ret;
-
-error:
-	while (i--) {
-		vm_mem = pipe->capq.bufs[i]->priv;
-		ia_css_frame_free(vm_mem->vaddr);
-	}
-
-	if (asd->vf_frame)
-		ia_css_frame_free(asd->vf_frame);
-
-	return -ENOMEM;
-}
-
-/* application query the status of a buffer */
-static int atomisp_querybuf(struct file *file, void *fh,
-			    struct v4l2_buffer *buf)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	return videobuf_querybuf(&pipe->capq, buf);
-}
-
-/*
- * Applications call the VIDIOC_QBUF ioctl to enqueue an empty (capturing) or
- * filled (output) buffer in the drivers incoming queue.
- */
-static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
-{
-	static const int NOFLUSH_FLAGS = V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
-					 V4L2_BUF_FLAG_NO_CACHE_CLEAN;
-	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
-	struct videobuf_buffer *vb;
-	struct videobuf_vmalloc_memory *vm_mem;
-	struct ia_css_frame_info frame_info;
-	struct ia_css_frame *handle = NULL;
-	u32 length;
-	u32 pgnr;
-	int ret;
-
-	ret = atomisp_pipe_check(pipe, false);
-	if (ret)
-		return ret;
-
-	if (!buf || buf->index >= VIDEO_MAX_FRAME ||
-	    !pipe->capq.bufs[buf->index]) {
-		dev_err(isp->dev, "Invalid index for qbuf.\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * For userptr type frame, we convert user space address to physic
-	 * address and reprograme out page table properly
-	 */
-	if (buf->memory == V4L2_MEMORY_USERPTR) {
-		if (offset_in_page(buf->m.userptr)) {
-			dev_err(isp->dev, "Error userptr is not page aligned.\n");
-			return -EINVAL;
-		}
-
-		vb = pipe->capq.bufs[buf->index];
-		vm_mem = vb->priv;
-		if (!vm_mem)
-			return -EINVAL;
-
-		length = vb->bsize;
-		pgnr = (length + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
-
-		if (vb->baddr == buf->m.userptr && vm_mem->vaddr)
-			goto done;
-
-		if (atomisp_get_css_frame_info(asd,
-					       atomisp_subdev_source_pad(vdev), &frame_info))
-			return -EIO;
-
-		ret = ia_css_frame_map(&handle, &frame_info,
-					    (void __user *)buf->m.userptr,
-					    pgnr);
-		if (ret) {
-			dev_err(isp->dev, "Failed to map user buffer\n");
-			return ret;
-		}
-
-		if (vm_mem->vaddr) {
-			mutex_lock(&pipe->capq.vb_lock);
-			ia_css_frame_free(vm_mem->vaddr);
-			vm_mem->vaddr = NULL;
-			vb->state = VIDEOBUF_NEEDS_INIT;
-			mutex_unlock(&pipe->capq.vb_lock);
-		}
-
-		vm_mem->vaddr = handle;
-
-		buf->flags &= ~V4L2_BUF_FLAG_MAPPED;
-		buf->flags |= V4L2_BUF_FLAG_QUEUED;
-		buf->flags &= ~V4L2_BUF_FLAG_DONE;
-	} else if (buf->memory == V4L2_MEMORY_MMAP) {
-		buf->flags |= V4L2_BUF_FLAG_MAPPED;
-		buf->flags |= V4L2_BUF_FLAG_QUEUED;
-		buf->flags &= ~V4L2_BUF_FLAG_DONE;
-
-		/*
-		 * For mmap, frames were allocated at request buffers
-		 */
-	}
-
-done:
-	if (!((buf->flags & NOFLUSH_FLAGS) == NOFLUSH_FLAGS))
-		wbinvd();
 
+	/* FIXME this abuse of buf->reserved2 comes from the original atomisp buffer handling */
 	if (!atomisp_is_vf_pipe(pipe) &&
 	    (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING)) {
 		/* this buffer will have a per-frame parameter */
@@ -1284,90 +1092,30 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		pipe->frame_request_config_id[buf->index] = 0;
 	}
 
-	pipe->frame_params[buf->index] = NULL;
-
-	mutex_unlock(&isp->mutex);
-	ret = videobuf_qbuf(&pipe->capq, buf);
-	mutex_lock(&isp->mutex);
-	if (ret)
-		return ret;
-
-	/* TODO: do this better, not best way to queue to css */
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
-		if (!list_empty(&pipe->buffers_waiting_for_param)) {
-			atomisp_handle_parameter_and_buffer(pipe);
-		} else {
-			atomisp_qbuffers_to_css(asd);
-		}
-	}
-
-	/*
-	 * Workaround: Due to the design of HALv3,
-	 * sometimes in ZSL or SDV mode HAL needs to
-	 * capture multiple images within one streaming cycle.
-	 * But the capture number cannot be determined by HAL.
-	 * So HAL only sets the capture number to be 1 and queue multiple
-	 * buffers. Atomisp driver needs to check this case and re-trigger
-	 * CSS to do capture when new buffer is queued.
-	 */
-	if (asd->continuous_mode->val &&
-	    atomisp_subdev_source_pad(vdev)
-	    == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE &&
-	    pipe->capq.streaming &&
-	    !asd->enable_raw_buffer_lock->val &&
-	    asd->params.offline_parm.num_captures == 1) {
-			asd->pending_capture_request++;
-			dev_dbg(isp->dev, "Add one pending capture request.\n");
-	}
-
-	dev_dbg(isp->dev, "qbuf buffer %d (%s) for asd%d\n", buf->index,
-		vdev->name, asd->index);
-
-	return 0;
-}
-
-static int __get_frame_exp_id(struct atomisp_video_pipe *pipe,
-			      struct v4l2_buffer *buf)
-{
-	struct videobuf_vmalloc_memory *vm_mem;
-	struct ia_css_frame *handle;
-	int i;
-
-	for (i = 0; pipe->capq.bufs[i]; i++) {
-		vm_mem = pipe->capq.bufs[i]->priv;
-		handle = vm_mem->vaddr;
-		if (buf->index == pipe->capq.bufs[i]->i && handle)
-			return handle->exp_id;
-	}
-	return -EINVAL;
+	return vb2_ioctl_qbuf(file, fh, buf);
 }
 
-/*
- * Applications call the VIDIOC_DQBUF ioctl to dequeue a filled (capturing) or
- * displayed (output buffer)from the driver's outgoing queue
- */
-static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
+static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer *buf)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct ia_css_frame *frame;
+	struct vb2_buffer *vb;
 	int ret;
 
-	ret = atomisp_pipe_check(pipe, false);
+	mutex_unlock(&asd->isp->mutex);
+	ret = vb2_ioctl_dqbuf(file, fh, buf);
+	mutex_lock(&asd->isp->mutex);
+
 	if (ret)
 		return ret;
 
-	mutex_unlock(&isp->mutex);
-	ret = videobuf_dqbuf(&pipe->capq, buf, file->f_flags & O_NONBLOCK);
-	mutex_lock(&isp->mutex);
-	if (ret) {
-		if (ret != -EAGAIN)
-			dev_dbg(isp->dev, "<%s: %d\n", __func__, ret);
-		return ret;
-	}
+	vb = pipe->vb_queue.bufs[buf->index];
+	frame = vb_to_frame(vb);
 
-	buf->bytesused = pipe->pix.sizeimage;
+	/* FIXME this abuse of buf->reserved* comes from the original atomisp buffer handling */
 	buf->reserved = asd->frame_status[buf->index];
 
 	/*
@@ -1378,7 +1126,7 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	 */
 	buf->reserved &= 0x0000ffff;
 	if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
-		buf->reserved |= __get_frame_exp_id(pipe, buf) << 16;
+		buf->reserved |= frame->exp_id;
 	buf->reserved2 = pipe->frame_config_id[buf->index];
 
 	dev_dbg(isp->dev,
@@ -1506,36 +1254,27 @@ static void atomisp_dma_burst_len_cfg(struct atomisp_sub_device *asd)
 		atomisp_css2_hw_store_32(DMA_BURST_SIZE_REG, 0x00);
 }
 
-/*
- * This ioctl start the capture during streaming I/O.
- */
-static int atomisp_streamon(struct file *file, void *fh,
-			    enum v4l2_buf_type type)
+int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
+	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
 	struct atomisp_sub_device *asd = pipe->asd;
-	struct atomisp_device *isp = video_get_drvdata(vdev);
+	struct video_device *vdev = &pipe->vdev;
+	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
 	unsigned int sensor_start_stream;
 	unsigned long irqflags;
 	int ret;
 
+/*	Uncomment mutex_lock once we move to using a per queue lock
+	mutex_lock(&asd->isp->mutex); */
+
 	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
 
-	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		dev_dbg(isp->dev, "unsupported v4l2 buf type\n");
-		return -EINVAL;
-	}
-
 	ret = atomisp_pipe_check(pipe, false);
 	if (ret)
-		return ret;
-
-	if (pipe->capq.streaming)
-		return 0;
+		goto out;
 
 	/* Input system HW workaround */
 	atomisp_dma_burst_len_cfg(asd);
@@ -1546,18 +1285,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 	 */
 	sensor_start_stream = atomisp_sensor_start_stream(asd);
 
-	spin_lock_irqsave(&pipe->irq_lock, irqflags);
-	if (list_empty(&pipe->capq.stream)) {
-		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
-		dev_dbg(isp->dev, "no buffer in the queue\n");
-		return -EINVAL;
-	}
-	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
-
-	ret = videobuf_streamon(&pipe->capq);
-	if (ret)
-		return ret;
-
 	/* Reset pending capture request count. */
 	asd->pending_capture_request = 0;
 
@@ -1578,8 +1305,10 @@ static int atomisp_streamon(struct file *file, void *fh,
 				mutex_unlock(&isp->mutex);
 				ret = wait_for_completion_interruptible(&asd->init_done);
 				mutex_lock(&isp->mutex);
-				if (ret != 0)
-					return -ERESTARTSYS;
+				if (ret) {
+					ret = -ERESTARTSYS;
+					goto out;
+				}
 			}
 
 			/* handle per_frame_setting parameter and buffers */
@@ -1601,12 +1330,15 @@ static int atomisp_streamon(struct file *file, void *fh,
 					asd->params.offline_parm.num_captures,
 					asd->params.offline_parm.skip_frames,
 					asd->params.offline_parm.offset);
-				if (ret)
-					return -EINVAL;
+				if (ret) {
+					ret = -EINVAL;
+					goto out;
+				}
 			}
 		}
 		atomisp_qbuffers_to_css(asd);
-		return 0;
+		ret = 0;
+		goto out;
 	}
 
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
@@ -1632,7 +1364,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 	ret = atomisp_css_start(asd, css_pipe_id, false);
 	if (ret)
-		return ret;
+		goto out;
 
 	spin_lock_irqsave(&isp->lock, irqflags);
 	asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
@@ -1652,8 +1384,10 @@ static int atomisp_streamon(struct file *file, void *fh,
 	atomisp_qbuffers_to_css(asd);
 
 	/* Only start sensor when the last streaming instance started */
-	if (atomisp_subdev_streaming_count(asd) < sensor_start_stream)
-		return 0;
+	if (atomisp_subdev_streaming_count(asd) < sensor_start_stream) {
+		ret = 0;
+		goto out;
+	}
 
 start_sensor:
 	if (isp->flash) {
@@ -1684,7 +1418,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		ret = atomisp_stream_on_master_slave_sensor(isp, false);
 		if (ret) {
 			dev_err(isp->dev, "master slave sensor stream on failed!\n");
-			return ret;
+			goto out;
 		}
 		goto start_delay_wq;
 	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
@@ -1706,7 +1440,8 @@ static int atomisp_streamon(struct file *file, void *fh,
 		spin_lock_irqsave(&isp->lock, irqflags);
 		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 		spin_unlock_irqrestore(&isp->lock, irqflags);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 start_delay_wq:
@@ -1724,31 +1459,30 @@ static int atomisp_streamon(struct file *file, void *fh,
 		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	}
 
-	return 0;
+out:
+/*	Uncomment mutex_unlock once we move to using a per queue lock
+	mutex_unlock(&asd->isp->mutex) */
+	return ret;
 }
 
-int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
+void atomisp_stop_streaming(struct vb2_queue *vq)
 {
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
+	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
 	struct atomisp_sub_device *asd = pipe->asd;
+	struct video_device *vdev = &pipe->vdev;
+	struct atomisp_device *isp = asd->isp;
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
 	int ret;
 	unsigned long flags;
 	bool first_streamoff = false;
 
+/*	Uncomment mutex_lock once we move to using a per queue lock
+	mutex_lock(&asd->isp->mutex); */
+
 	dev_dbg(isp->dev, "Stop stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
 
-	lockdep_assert_held(&isp->mutex);
-
-	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		dev_dbg(isp->dev, "unsupported v4l2 buf type\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * There is no guarantee that the buffers queued to / owned by the ISP
 	 * will properly be returned to the queue when stopping. Set a flag to
@@ -1758,12 +1492,12 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	pipe->stopping = true;
 	mutex_unlock(&isp->mutex);
 	/* wait max 1 second */
-	ret = wait_event_interruptible_timeout(pipe->capq.wait,
-					       atomisp_buffers_in_css(pipe) == 0, HZ);
+	ret = wait_event_timeout(pipe->vb_queue.done_wq,
+				 atomisp_buffers_in_css(pipe) == 0, HZ);
 	mutex_lock(&isp->mutex);
 	pipe->stopping = false;
-	if (ret <= 0)
-		return ret ? ret : -ETIME;
+	if (ret == 0)
+		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
 
 	/*
 	 * do only videobuf_streamoff for capture & vf pipes in
@@ -1780,12 +1514,9 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 			atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, false);
 		}
 
-		return videobuf_streamoff(&pipe->capq);
+		goto out;
 	}
 
-	if (!pipe->capq.streaming)
-		return 0;
-
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED)
 		first_streamoff = true;
 
@@ -1796,12 +1527,8 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
 	spin_unlock_irqrestore(&isp->lock, flags);
 
-	if (!first_streamoff) {
-		ret = videobuf_streamoff(&pipe->capq);
-		if (ret)
-			return ret;
+	if (!first_streamoff)
 		goto stopsensor;
-	}
 
 	atomisp_clear_css_buffer_counters(asd);
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
@@ -1816,15 +1543,10 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	atomisp_flush_video_pipe(pipe, true);
 
-	ret = videobuf_streamoff(&pipe->capq);
-	if (ret)
-		return ret;
-
 	atomisp_subdev_cleanup_pending_events(asd);
 stopsensor:
-	if (atomisp_subdev_streaming_count(asd) + 1
-	    != atomisp_sensor_start_stream(asd))
-		return 0;
+	if (atomisp_subdev_streaming_count(asd) != atomisp_sensor_start_stream(asd))
+		goto out;
 
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 			       video, s_stream, 0);
@@ -1837,7 +1559,7 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	/* if other streams are running, isp should not be powered off */
 	if (atomisp_streaming_count(isp)) {
 		atomisp_css_flush(isp);
-		return 0;
+		goto out;
 	}
 
 	/* Disable the CSI interface on ANN B0/K0 */
@@ -1896,7 +1618,9 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		}
 		isp->isp_timeout = false;
 	}
-	return ret;
+out:
+/*	Uncomment mutex_unlock once we move to using a per queue lock
+	mutex_unlock(&asd->isp->mutex) */ ;
 }
 
 /*
@@ -2685,12 +2409,12 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_try_fmt_vid_cap = atomisp_try_fmt_cap,
 	.vidioc_g_fmt_vid_cap = atomisp_g_fmt_cap,
 	.vidioc_s_fmt_vid_cap = atomisp_set_fmt,
-	.vidioc_reqbufs = atomisp_reqbufs,
-	.vidioc_querybuf = atomisp_querybuf,
-	.vidioc_qbuf = atomisp_qbuf,
-	.vidioc_dqbuf = atomisp_dqbuf,
-	.vidioc_streamon = atomisp_streamon,
-	.vidioc_streamoff = atomisp_streamoff,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = atomisp_qbuf_wrapper,
+	.vidioc_dqbuf = atomisp_dqbuf_wrapper,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_default = atomisp_vidioc_default,
 	.vidioc_s_parm = atomisp_s_parm,
 	.vidioc_g_parm = atomisp_g_parm,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index c660f631d371..59e071f035f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -39,14 +39,12 @@ int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				uint16_t stream_id);
 
-int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type);
-int atomisp_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *req);
+int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
+void atomisp_stop_streaming(struct vb2_queue *vq);
 
 enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device
 	*asd);
 
-void atomisp_videobuf_free_buf(struct videobuf_buffer *vb);
-
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp);
@@ -57,4 +55,8 @@ long atomisp_compat_ioctl32(struct file *file,
 
 int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
 	bool isp_timeout);
+
+int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
+void atomisp_stop_streaming(struct vb2_queue *vq);
+
 #endif /* __ATOMISP_IOCTL_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 45b0c7341e84..f5eae8c6bd31 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -21,8 +21,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-subdev.h>
-#include <media/videobuf-core.h>
-
+#include <media/videobuf2-v4l2.h>
 #include "atomisp_common.h"
 #include "atomisp_compat.h"
 #include "atomisp_v4l2.h"
@@ -69,7 +68,7 @@ struct atomisp_video_pipe {
 	struct video_device vdev;
 	enum v4l2_buf_type type;
 	struct media_pad pad;
-	struct videobuf_queue capq;
+	struct vb2_queue vb_queue;
 	/* List of video-buffers handed over to the CSS  */
 	struct list_head buffers_in_css;
 	/* List of video-buffers handed over to the driver, but not yet to the CSS */
@@ -82,6 +81,9 @@ struct atomisp_video_pipe {
 	/* the link list to store per_frame parameters */
 	struct list_head per_frame_params;
 
+	/* Filled through atomisp_get_css_frame_info() on queue setup */
+	struct ia_css_frame_info frame_info;
+
 	/* Store here the initial run mode */
 	unsigned int default_run_mode;
 	/* Set from streamoff to disallow queuing further buffers in CSS */
@@ -113,6 +115,11 @@ struct atomisp_video_pipe {
 	struct atomisp_css_params_with_list *frame_params[VIDEO_MAX_FRAME];
 };
 
+#define vq_to_pipe(queue) \
+	container_of(queue, struct atomisp_video_pipe, vb_queue)
+
+#define vb_to_pipe(vb) vq_to_pipe((vb)->vb2_queue)
+
 struct atomisp_pad_format {
 	struct v4l2_mbus_framefmt fmt;
 	struct v4l2_rect crop;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index d787c4054bb1..32d6d9699c37 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -20,6 +20,7 @@
  * This file contains structs to describe various frame-formats supported by the ISP.
  */
 
+#include <media/videobuf2-v4l2.h>
 #include <type_support.h>
 #include "ia_css_err.h"
 #include "ia_css_types.h"
@@ -146,6 +147,17 @@ enum ia_css_frame_flash_state {
  *  This is the main structure used for all input and output images.
  */
 struct ia_css_frame {
+	/*
+	 * The videobuf2 core will allocate buffers including room for private
+	 * data (the rest of struct ia_css_frame). The vb2_v4l2_buffer must
+	 * be the first member for this to work!
+	 * Note the atomisp code also uses ia_css_frame-s which are not used
+	 * as v4l2-buffers in some places. In this case the vb2 member will
+	 * be unused.
+	 */
+	struct vb2_v4l2_buffer vb;
+	/* List-head for linking into the activeq or buffers_waiting_for_param list */
+	struct list_head queue;
 	struct ia_css_frame_info frame_info; /** info struct describing the frame */
 	ia_css_ptr   data;	       /** pointer to start of image data */
 	unsigned int data_bytes;       /** size of image data in bytes */
@@ -183,6 +195,9 @@ struct ia_css_frame {
 		       info.format */
 };
 
+#define vb_to_frame(vb2) \
+	container_of(to_vb2_v4l2_buffer(vb2), struct ia_css_frame, vb)
+
 #define DEFAULT_FRAME { \
 	.frame_info		= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
 	.dynamic_queue_id	= SH_CSS_INVALID_QUEUE_ID, \
-- 
2.37.3

