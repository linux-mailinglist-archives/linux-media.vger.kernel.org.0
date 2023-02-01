Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73AB7686BB0
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjBAQ3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbjBAQ3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:29:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C9579220
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:28:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9F3B6187E
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F0FC433EF;
        Wed,  1 Feb 2023 16:28:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 3/8] cx18: convert to vb2
Date:   Wed,  1 Feb 2023 17:28:45 +0100
Message-Id: <20230201162850.886563-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
References: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch converts cx18 from the old deprecated videobuf framework
to the 'new' vb2 framework.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/cx18/Kconfig        |   2 +-
 drivers/media/pci/cx18/cx18-driver.h  |  24 +--
 drivers/media/pci/cx18/cx18-fileops.c |  85 ++------
 drivers/media/pci/cx18/cx18-fileops.h |   3 +-
 drivers/media/pci/cx18/cx18-ioctl.c   | 128 +-----------
 drivers/media/pci/cx18/cx18-mailbox.c |  27 +--
 drivers/media/pci/cx18/cx18-streams.c | 276 ++++++++++++++------------
 7 files changed, 199 insertions(+), 346 deletions(-)

diff --git a/drivers/media/pci/cx18/Kconfig b/drivers/media/pci/cx18/Kconfig
index a4e32fdcfd3d..5c959bb5e233 100644
--- a/drivers/media/pci/cx18/Kconfig
+++ b/drivers/media/pci/cx18/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_CX18
 	tristate "Conexant cx23418 MPEG encoder support"
 	depends on VIDEO_DEV && DVB_CORE && PCI && I2C
 	select I2C_ALGOBIT
-	select VIDEOBUF_VMALLOC
+	select VIDEOBUF2_VMALLOC
 	depends on RC_CORE
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
diff --git a/drivers/media/pci/cx18/cx18-driver.h b/drivers/media/pci/cx18/cx18-driver.h
index ef545b96121d..887d2aa36447 100644
--- a/drivers/media/pci/cx18/cx18-driver.h
+++ b/drivers/media/pci/cx18/cx18-driver.h
@@ -48,9 +48,8 @@
 #include <media/dvb_net.h>
 #include <media/dvbdev.h>
 
-/* Videobuf / YUV support */
-#include <media/videobuf-core.h>
-#include <media/videobuf-vmalloc.h>
+/* vb2 YUV support */
+#include <media/videobuf2-vmalloc.h>
 
 #ifndef CONFIG_PCI
 #  error "This driver requires kernel PCI support."
@@ -284,6 +283,14 @@ struct cx18_options {
 #define list_entry_is_past_end(pos, head, member) \
 	(&pos->member == (head))
 
+struct cx18_vb2_buffer {
+	/* Common video buffer sub-system struct */
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	v4l2_std_id tvnorm; /* selected tv norm */
+	u32 bytes_used;
+};
+
 struct cx18_buffer {
 	struct list_head list;
 	dma_addr_t dma_handle;
@@ -399,19 +406,12 @@ struct cx18_stream {
 	struct list_head vb_capture;    /* video capture queue */
 	spinlock_t vb_lock;
 	struct timer_list vb_timeout;
+	u32 sequence;
 
-	struct videobuf_queue vbuf_q;
-	spinlock_t vbuf_q_lock; /* Protect vbuf_q */
+	struct vb2_queue vidq;
 	enum v4l2_buf_type vb_type;
 };
 
-struct cx18_videobuf_buffer {
-	/* Common video buffer sub-system struct */
-	struct videobuf_buffer vb;
-	v4l2_std_id tvnorm; /* selected tv norm */
-	u32 bytes_used;
-};
-
 struct cx18_open_id {
 	struct v4l2_fh fh;
 	u32 open_id;
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index 4cf5b9ca92e7..7e742733391b 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -584,12 +584,6 @@ ssize_t cx18_v4l2_read(struct file *filp, char __user *buf, size_t count,
 	if (rc)
 		return rc;
 
-	if ((s->vb_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(id->type == CX18_ENC_STREAM_TYPE_YUV)) {
-		return videobuf_read_stream(&s->vbuf_q, buf, count, pos, 0,
-			filp->f_flags & O_NONBLOCK);
-	}
-
 	return cx18_read_pos(s, buf, count, pos, filp->f_flags & O_NONBLOCK);
 }
 
@@ -618,17 +612,6 @@ __poll_t cx18_v4l2_enc_poll(struct file *filp, poll_table *wait)
 		CX18_DEBUG_FILE("Encoder poll started capture\n");
 	}
 
-	if ((s->vb_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(id->type == CX18_ENC_STREAM_TYPE_YUV)) {
-		__poll_t videobuf_poll = videobuf_poll_stream(filp, &s->vbuf_q, wait);
-
-		if (v4l2_event_pending(&id->fh))
-			res |= EPOLLPRI;
-		if (eof && videobuf_poll == EPOLLERR)
-			return res | EPOLLHUP;
-		return res | videobuf_poll;
-	}
-
 	/* add stream's waitq to the poll list */
 	CX18_DEBUG_HI_FILE("Encoder poll\n");
 	if (v4l2_event_pending(&id->fh))
@@ -643,62 +626,20 @@ __poll_t cx18_v4l2_enc_poll(struct file *filp, poll_table *wait)
 	return res;
 }
 
-int cx18_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-	int eof = test_bit(CX18_F_S_STREAMOFF, &s->s_flags);
-
-	if ((s->vb_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(id->type == CX18_ENC_STREAM_TYPE_YUV)) {
-
-		/* Start a capture if there is none */
-		if (!eof && !test_bit(CX18_F_S_STREAMING, &s->s_flags)) {
-			int rc;
-
-			mutex_lock(&cx->serialize_lock);
-			rc = cx18_start_capture(id);
-			mutex_unlock(&cx->serialize_lock);
-			if (rc) {
-				CX18_DEBUG_INFO(
-					"Could not start capture for %s (%d)\n",
-					s->name, rc);
-				return -EINVAL;
-			}
-			CX18_DEBUG_FILE("Encoder mmap started capture\n");
-		}
-
-		return videobuf_mmap_mapper(&s->vbuf_q, vma);
-	}
-
-	return -EINVAL;
-}
-
 void cx18_vb_timeout(struct timer_list *t)
 {
 	struct cx18_stream *s = from_timer(s, t, vb_timeout);
-	struct cx18_videobuf_buffer *buf;
-	unsigned long flags;
 
-	/* Return all of the buffers in error state, so the vbi/vid inode
+	/*
+	 * Return all of the buffers in error state, so the vbi/vid inode
 	 * can return from blocking.
 	 */
-	spin_lock_irqsave(&s->vb_lock, flags);
-	while (!list_empty(&s->vb_capture)) {
-		buf = list_entry(s->vb_capture.next,
-			struct cx18_videobuf_buffer, vb.queue);
-		list_del(&buf->vb.queue);
-		buf->vb.state = VIDEOBUF_ERROR;
-		wake_up(&buf->vb.done);
-	}
-	spin_unlock_irqrestore(&s->vb_lock, flags);
+	cx18_clear_queue(s, VB2_BUF_STATE_ERROR);
 }
 
-void cx18_stop_capture(struct cx18_open_id *id, int gop_end)
+void cx18_stop_capture(struct cx18_stream *s, int gop_end)
 {
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
+	struct cx18 *cx = s->cx;
 	struct cx18_stream *s_vbi = &cx->streams[CX18_ENC_STREAM_TYPE_VBI];
 	struct cx18_stream *s_idx = &cx->streams[CX18_ENC_STREAM_TYPE_IDX];
 
@@ -709,7 +650,7 @@ void cx18_stop_capture(struct cx18_open_id *id, int gop_end)
 	/* Stop capturing */
 	if (test_bit(CX18_F_S_STREAMING, &s->s_flags)) {
 		CX18_DEBUG_INFO("close stopping capture\n");
-		if (id->type == CX18_ENC_STREAM_TYPE_MPG) {
+		if (s->type == CX18_ENC_STREAM_TYPE_MPG) {
 			/* Stop internal use associated VBI and IDX streams */
 			if (test_bit(CX18_F_S_STREAMING, &s_vbi->s_flags) &&
 			    !test_bit(CX18_F_S_APPL_IO, &s_vbi->s_flags)) {
@@ -721,7 +662,7 @@ void cx18_stop_capture(struct cx18_open_id *id, int gop_end)
 				cx18_stop_v4l2_encode_stream(s_idx, 0);
 			}
 		}
-		if (id->type == CX18_ENC_STREAM_TYPE_VBI &&
+		if (s->type == CX18_ENC_STREAM_TYPE_VBI &&
 		    test_bit(CX18_F_S_INTERNAL_USE, &s->s_flags))
 			/* Also used internally, don't stop capturing */
 			s->id = -1;
@@ -741,13 +682,14 @@ int cx18_v4l2_close(struct file *filp)
 	struct cx18_open_id *id = fh2id(fh);
 	struct cx18 *cx = id->cx;
 	struct cx18_stream *s = &cx->streams[id->type];
+	struct video_device *vdev = &s->video_dev;
 
 	CX18_DEBUG_IOCTL("close() of %s\n", s->name);
 
 	mutex_lock(&cx->serialize_lock);
 	/* Stop radio */
 	if (id->type == CX18_ENC_STREAM_TYPE_RAD &&
-			v4l2_fh_is_singular_file(filp)) {
+	    v4l2_fh_is_singular_file(filp)) {
 		/* Closing radio device, return to TV mode */
 		cx18_mute(cx);
 		/* Mark that the radio is no longer in use */
@@ -766,12 +708,17 @@ int cx18_v4l2_close(struct file *filp)
 		cx18_unmute(cx);
 	}
 
+	if (id->type == CX18_ENC_STREAM_TYPE_YUV &&
+	    filp->private_data == vdev->queue->owner) {
+		vb2_queue_release(vdev->queue);
+		vdev->queue->owner = NULL;
+	}
 	v4l2_fh_del(fh);
 	v4l2_fh_exit(fh);
 
 	/* 'Unclaim' this stream */
-	if (s->id == id->open_id)
-		cx18_stop_capture(id, 0);
+	if (id->type != CX18_ENC_STREAM_TYPE_YUV && s->id == id->open_id)
+		cx18_stop_capture(s, 0);
 	kfree(id);
 	mutex_unlock(&cx->serialize_lock);
 	return 0;
diff --git a/drivers/media/pci/cx18/cx18-fileops.h b/drivers/media/pci/cx18/cx18-fileops.h
index 1985d6422347..943057b83d94 100644
--- a/drivers/media/pci/cx18/cx18-fileops.h
+++ b/drivers/media/pci/cx18/cx18-fileops.h
@@ -16,10 +16,11 @@ ssize_t cx18_v4l2_write(struct file *filp, const char __user *buf, size_t count,
 int cx18_v4l2_close(struct file *filp);
 __poll_t cx18_v4l2_enc_poll(struct file *filp, poll_table *wait);
 int cx18_start_capture(struct cx18_open_id *id);
-void cx18_stop_capture(struct cx18_open_id *id, int gop_end);
+void cx18_stop_capture(struct cx18_stream *s, int gop_end);
 void cx18_mute(struct cx18 *cx);
 void cx18_unmute(struct cx18 *cx);
 int cx18_v4l2_mmap(struct file *file, struct vm_area_struct *vma);
+void cx18_clear_queue(struct cx18_stream *s, enum vb2_buffer_state state);
 void cx18_vb_timeout(struct timer_list *t);
 
 /* Shared with cx18-alsa module */
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index c8ba7841c720..af6e72ffe4b7 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -803,117 +803,6 @@ static int cx18_g_enc_index(struct file *file, void *fh,
 	return 0;
 }
 
-static struct videobuf_queue *cx18_vb_queue(struct cx18_open_id *id)
-{
-	struct videobuf_queue *q = NULL;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	switch (s->vb_type) {
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		q = &s->vbuf_q;
-		break;
-	case V4L2_BUF_TYPE_VBI_CAPTURE:
-		break;
-	default:
-		break;
-	}
-	return q;
-}
-
-static int cx18_streamon(struct file *file, void *priv,
-	enum v4l2_buf_type type)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	/* Start the hardware only if we're the video device */
-	if ((s->vb_type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(s->vb_type != V4L2_BUF_TYPE_VBI_CAPTURE))
-		return -EINVAL;
-
-	if (id->type != CX18_ENC_STREAM_TYPE_YUV)
-		return -EINVAL;
-
-	/* Establish a buffer timeout */
-	mod_timer(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
-
-	return videobuf_streamon(cx18_vb_queue(id));
-}
-
-static int cx18_streamoff(struct file *file, void *priv,
-	enum v4l2_buf_type type)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	/* Start the hardware only if we're the video device */
-	if ((s->vb_type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(s->vb_type != V4L2_BUF_TYPE_VBI_CAPTURE))
-		return -EINVAL;
-
-	if (id->type != CX18_ENC_STREAM_TYPE_YUV)
-		return -EINVAL;
-
-	return videobuf_streamoff(cx18_vb_queue(id));
-}
-
-static int cx18_reqbufs(struct file *file, void *priv,
-	struct v4l2_requestbuffers *rb)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	if ((s->vb_type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(s->vb_type != V4L2_BUF_TYPE_VBI_CAPTURE))
-		return -EINVAL;
-
-	return videobuf_reqbufs(cx18_vb_queue(id), rb);
-}
-
-static int cx18_querybuf(struct file *file, void *priv,
-	struct v4l2_buffer *b)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	if ((s->vb_type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(s->vb_type != V4L2_BUF_TYPE_VBI_CAPTURE))
-		return -EINVAL;
-
-	return videobuf_querybuf(cx18_vb_queue(id), b);
-}
-
-static int cx18_qbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	if ((s->vb_type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(s->vb_type != V4L2_BUF_TYPE_VBI_CAPTURE))
-		return -EINVAL;
-
-	return videobuf_qbuf(cx18_vb_queue(id), b);
-}
-
-static int cx18_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
-{
-	struct cx18_open_id *id = file->private_data;
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-
-	if ((s->vb_type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		(s->vb_type != V4L2_BUF_TYPE_VBI_CAPTURE))
-		return -EINVAL;
-
-	return videobuf_dqbuf(cx18_vb_queue(id), b, file->f_flags & O_NONBLOCK);
-}
-
 static int cx18_encoder_cmd(struct file *file, void *fh,
 				struct v4l2_encoder_cmd *enc)
 {
@@ -930,7 +819,7 @@ static int cx18_encoder_cmd(struct file *file, void *fh,
 	case V4L2_ENC_CMD_STOP:
 		CX18_DEBUG_IOCTL("V4L2_ENC_CMD_STOP\n");
 		enc->flags &= V4L2_ENC_CMD_STOP_AT_GOP_END;
-		cx18_stop_capture(id,
+		cx18_stop_capture(&cx->streams[id->type],
 				  enc->flags & V4L2_ENC_CMD_STOP_AT_GOP_END);
 		break;
 
@@ -1106,12 +995,15 @@ static const struct v4l2_ioctl_ops cx18_ioctl_ops = {
 	.vidioc_s_register              = cx18_s_register,
 #endif
 	.vidioc_default                 = cx18_default,
-	.vidioc_streamon                = cx18_streamon,
-	.vidioc_streamoff               = cx18_streamoff,
-	.vidioc_reqbufs                 = cx18_reqbufs,
-	.vidioc_querybuf                = cx18_querybuf,
-	.vidioc_qbuf                    = cx18_qbuf,
-	.vidioc_dqbuf                   = cx18_dqbuf,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
diff --git a/drivers/media/pci/cx18/cx18-mailbox.c b/drivers/media/pci/cx18/cx18-mailbox.c
index 162480ec68ca..3b283f3c6726 100644
--- a/drivers/media/pci/cx18/cx18-mailbox.c
+++ b/drivers/media/pci/cx18/cx18-mailbox.c
@@ -145,36 +145,37 @@ static void cx18_mdl_send_to_dvb(struct cx18_stream *s, struct cx18_mdl *mdl)
 	}
 }
 
-static void cx18_mdl_send_to_videobuf(struct cx18_stream *s,
-	struct cx18_mdl *mdl)
+static void cx18_mdl_send_to_vb2(struct cx18_stream *s, struct cx18_mdl *mdl)
 {
-	struct cx18_videobuf_buffer *vb_buf;
+	struct cx18_vb2_buffer *vb_buf;
 	struct cx18_buffer *buf;
 	u8 *p;
 	u32 offset = 0;
 	int dispatch = 0;
+	unsigned long bsize;
 
 	if (mdl->bytesused == 0)
 		return;
 
-	/* Acquire a videobuf buffer, clone to and and release it */
+	/* Acquire a vb2 buffer, clone to and release it */
 	spin_lock(&s->vb_lock);
 	if (list_empty(&s->vb_capture))
 		goto out;
 
-	vb_buf = list_first_entry(&s->vb_capture, struct cx18_videobuf_buffer,
-		vb.queue);
+	vb_buf = list_first_entry(&s->vb_capture, struct cx18_vb2_buffer,
+				  list);
 
-	p = videobuf_to_vmalloc(&vb_buf->vb);
+	p = vb2_plane_vaddr(&vb_buf->vb.vb2_buf, 0);
 	if (!p)
 		goto out;
 
+	bsize = vb2_get_plane_payload(&vb_buf->vb.vb2_buf, 0);
 	offset = vb_buf->bytes_used;
 	list_for_each_entry(buf, &mdl->buf_list, list) {
 		if (buf->bytesused == 0)
 			break;
 
-		if ((offset + buf->bytesused) <= vb_buf->vb.bsize) {
+		if ((offset + buf->bytesused) <= bsize) {
 			memcpy(p + offset, buf->buf, buf->bytesused);
 			offset += buf->bytesused;
 			vb_buf->bytes_used += buf->bytesused;
@@ -188,10 +189,10 @@ static void cx18_mdl_send_to_videobuf(struct cx18_stream *s,
 	}
 
 	if (dispatch) {
-		vb_buf->vb.ts = ktime_get_ns();
-		list_del(&vb_buf->vb.queue);
-		vb_buf->vb.state = VIDEOBUF_DONE;
-		wake_up(&vb_buf->vb.done);
+		vb_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+		vb_buf->vb.sequence = s->sequence++;
+		list_del(&vb_buf->list);
+		vb2_buffer_done(&vb_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
 
 	mod_timer(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
@@ -304,7 +305,7 @@ static void epu_dma_done(struct cx18 *cx, struct cx18_in_work_order *order)
 				cx18_enqueue(s, mdl, &s->q_full);
 			}
 		} else if (s->type == CX18_ENC_STREAM_TYPE_YUV) {
-			cx18_mdl_send_to_videobuf(s, mdl);
+			cx18_mdl_send_to_vb2(s, mdl);
 			cx18_enqueue(s, mdl, &s->q_free);
 		} else {
 			cx18_enqueue(s, mdl, &s->q_full);
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 87ff554bb2d2..ce2be7f106b3 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -29,7 +29,16 @@ static const struct v4l2_file_operations cx18_v4l2_enc_fops = {
 	.unlocked_ioctl = video_ioctl2,
 	.release = cx18_v4l2_close,
 	.poll = cx18_v4l2_enc_poll,
-	.mmap = cx18_v4l2_mmap,
+};
+
+static const struct v4l2_file_operations cx18_v4l2_enc_yuv_fops = {
+	.owner = THIS_MODULE,
+	.open = cx18_v4l2_open,
+	.unlocked_ioctl = video_ioctl2,
+	.release = cx18_v4l2_close,
+	.poll = vb2_fop_poll,
+	.read = vb2_fop_read,
+	.mmap = vb2_fop_mmap,
 };
 
 /* offset from 0 to register ts v4l2 minors on */
@@ -91,156 +100,142 @@ static struct {
 	},
 };
 
-
-static void cx18_dma_free(struct videobuf_queue *q,
-	struct cx18_stream *s, struct cx18_videobuf_buffer *buf)
-{
-	videobuf_waiton(q, &buf->vb, 0, 0);
-	videobuf_vmalloc_free(&buf->vb);
-	buf->vb.state = VIDEOBUF_NEEDS_INIT;
-}
-
-static int cx18_prepare_buffer(struct videobuf_queue *q,
-	struct cx18_stream *s,
-	struct cx18_videobuf_buffer *buf,
-	u32 pixelformat,
-	unsigned int width, unsigned int height,
-	enum v4l2_field field)
+static int cx18_queue_setup(struct vb2_queue *vq,
+			    unsigned int *nbuffers, unsigned int *nplanes,
+			    unsigned int sizes[], struct device *alloc_devs[])
 {
+	struct cx18_stream *s = vb2_get_drv_priv(vq);
 	struct cx18 *cx = s->cx;
-	int rc = 0;
-
-	/* check settings */
-	buf->bytes_used = 0;
-
-	if ((width  < 48) || (height < 32))
-		return -EINVAL;
-
-	buf->vb.size = (width * height * 2);
-	if ((buf->vb.baddr != 0) && (buf->vb.bsize < buf->vb.size))
-		return -EINVAL;
+	unsigned int szimage;
 
-	/* alloc + fill struct (if changed) */
-	if (buf->vb.width != width || buf->vb.height != height ||
-	    buf->vb.field != field || s->pixelformat != pixelformat ||
-	    buf->tvnorm != cx->std) {
+	/*
+	 * HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
+	 * UYUV YUV size is (Y=(h*720) + UV=(h*(720)))
+	 */
+	if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
+		szimage = cx->cxhdl.height * 720 * 3 / 2;
+	else
+		szimage = cx->cxhdl.height * 720 * 2;
 
-		buf->vb.width  = width;
-		buf->vb.height = height;
-		buf->vb.field  = field;
-		buf->tvnorm    = cx->std;
-		s->pixelformat = pixelformat;
+	/*
+	 * Let's request at least three buffers: two for the
+	 * DMA engine and one for userspace.
+	 */
+	if (vq->num_buffers + *nbuffers < 3)
+		*nbuffers = 3 - vq->num_buffers;
 
-		/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
-		   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
-		if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
-			s->vb_bytes_per_frame = height * 720 * 3 / 2;
-		else
-			s->vb_bytes_per_frame = height * 720 * 2;
-		cx18_dma_free(q, s, buf);
+	if (*nplanes) {
+		if (*nplanes != 1 || sizes[0] < szimage)
+			return -EINVAL;
+		return 0;
 	}
 
-	if ((buf->vb.baddr != 0) && (buf->vb.bsize < buf->vb.size))
-		return -EINVAL;
-
-	if (buf->vb.field == 0)
-		buf->vb.field = V4L2_FIELD_INTERLACED;
-
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		buf->vb.width  = width;
-		buf->vb.height = height;
-		buf->vb.field  = field;
-		buf->tvnorm    = cx->std;
-		s->pixelformat = pixelformat;
-
-		/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
-		   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
-		if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
-			s->vb_bytes_per_frame = height * 720 * 3 / 2;
-		else
-			s->vb_bytes_per_frame = height * 720 * 2;
-		rc = videobuf_iolock(q, &buf->vb, NULL);
-		if (rc != 0)
-			goto fail;
-	}
-	buf->vb.state = VIDEOBUF_PREPARED;
+	sizes[0] = szimage;
+	*nplanes = 1;
 	return 0;
-
-fail:
-	cx18_dma_free(q, s, buf);
-	return rc;
-
 }
 
-/* VB_MIN_BUFSIZE is lcm(1440 * 480, 1440 * 576)
-   1440 is a single line of 4:2:2 YUV at 720 luma samples wide
-*/
-#define VB_MIN_BUFFERS 32
-#define VB_MIN_BUFSIZE 4147200
+static void cx18_buf_queue(struct vb2_buffer *vb)
+{
+	struct cx18_stream *s = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct cx18_vb2_buffer *buf =
+		container_of(vbuf, struct cx18_vb2_buffer, vb);
+	unsigned long flags;
+
+	spin_lock_irqsave(&s->vb_lock, flags);
+	list_add_tail(&buf->list, &s->vb_capture);
+	spin_unlock_irqrestore(&s->vb_lock, flags);
+}
 
-static int buffer_setup(struct videobuf_queue *q,
-	unsigned int *count, unsigned int *size)
+static int cx18_buf_prepare(struct vb2_buffer *vb)
 {
-	struct cx18_stream *s = q->priv_data;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct cx18_stream *s = vb2_get_drv_priv(vb->vb2_queue);
 	struct cx18 *cx = s->cx;
+	unsigned int size;
 
-	*size = 2 * cx->cxhdl.width * cx->cxhdl.height;
-	if (*count == 0)
-		*count = VB_MIN_BUFFERS;
-
-	while (*size * *count > VB_MIN_BUFFERS * VB_MIN_BUFSIZE)
-		(*count)--;
-
-	q->field = V4L2_FIELD_INTERLACED;
-	q->last = V4L2_FIELD_INTERLACED;
+	/*
+	 * HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
+	 * UYUV YUV size is (Y=(h*720) + UV=(h*(720)))
+	 */
+	if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
+		size = cx->cxhdl.height * 720 * 3 / 2;
+	else
+		size = cx->cxhdl.height * 720 * 2;
 
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+	vb2_set_plane_payload(vb, 0, size);
+	vbuf->field = V4L2_FIELD_INTERLACED;
 	return 0;
 }
 
-static int buffer_prepare(struct videobuf_queue *q,
-	struct videobuf_buffer *vb,
-	enum v4l2_field field)
+void cx18_clear_queue(struct cx18_stream *s, enum vb2_buffer_state state)
 {
-	struct cx18_videobuf_buffer *buf =
-		container_of(vb, struct cx18_videobuf_buffer, vb);
-	struct cx18_stream *s = q->priv_data;
-	struct cx18 *cx = s->cx;
+	while (!list_empty(&s->vb_capture)) {
+		struct cx18_vb2_buffer *buf;
 
-	return cx18_prepare_buffer(q, s, buf, s->pixelformat,
-		cx->cxhdl.width, cx->cxhdl.height, field);
+		buf = list_first_entry(&s->vb_capture,
+				       struct cx18_vb2_buffer, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
 }
 
-static void buffer_release(struct videobuf_queue *q,
-	struct videobuf_buffer *vb)
+static int cx18_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct cx18_videobuf_buffer *buf =
-		container_of(vb, struct cx18_videobuf_buffer, vb);
-	struct cx18_stream *s = q->priv_data;
+	struct v4l2_fh *owner = vq->owner;
+	struct cx18_stream *s = vb2_get_drv_priv(vq);
+	unsigned long flags;
+	int rc;
+
+	if (WARN_ON(!owner)) {
+		rc = -EIO;
+		goto clear_queue;
+	}
 
-	cx18_dma_free(q, s, buf);
+	s->sequence = 0;
+	rc = cx18_start_capture(fh2id(owner));
+	if (!rc) {
+		/* Establish a buffer timeout */
+		mod_timer(&s->vb_timeout, msecs_to_jiffies(2000) + jiffies);
+		return 0;
+	}
+
+clear_queue:
+	spin_lock_irqsave(&s->vb_lock, flags);
+	cx18_clear_queue(s, VB2_BUF_STATE_QUEUED);
+	spin_unlock_irqrestore(&s->vb_lock, flags);
+	return rc;
 }
 
-static void buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void cx18_stop_streaming(struct vb2_queue *vq)
 {
-	struct cx18_videobuf_buffer *buf =
-		container_of(vb, struct cx18_videobuf_buffer, vb);
-	struct cx18_stream *s = q->priv_data;
-
-	buf->vb.state = VIDEOBUF_QUEUED;
-
-	list_add_tail(&buf->vb.queue, &s->vb_capture);
+	struct cx18_stream *s = vb2_get_drv_priv(vq);
+	unsigned long flags;
+
+	cx18_stop_capture(s, 0);
+	timer_delete_sync(&s->vb_timeout);
+	spin_lock_irqsave(&s->vb_lock, flags);
+	cx18_clear_queue(s, VB2_BUF_STATE_ERROR);
+	spin_unlock_irqrestore(&s->vb_lock, flags);
 }
 
-static const struct videobuf_queue_ops cx18_videobuf_qops = {
-	.buf_setup    = buffer_setup,
-	.buf_prepare  = buffer_prepare,
-	.buf_queue    = buffer_queue,
-	.buf_release  = buffer_release,
+static const struct vb2_ops cx18_vb2_qops = {
+	.queue_setup		= cx18_queue_setup,
+	.buf_queue		= cx18_buf_queue,
+	.buf_prepare		= cx18_buf_prepare,
+	.start_streaming	= cx18_start_streaming,
+	.stop_streaming		= cx18_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
 };
 
-static void cx18_stream_init(struct cx18 *cx, int type)
+static int cx18_stream_init(struct cx18 *cx, int type)
 {
 	struct cx18_stream *s = &cx->streams[type];
+	int err = 0;
 
 	memset(s, 0, sizeof(*s));
 
@@ -275,22 +270,33 @@ static void cx18_stream_init(struct cx18 *cx, int type)
 	INIT_LIST_HEAD(&s->vb_capture);
 	timer_setup(&s->vb_timeout, cx18_vb_timeout, 0);
 	spin_lock_init(&s->vb_lock);
-	if (type == CX18_ENC_STREAM_TYPE_YUV) {
-		spin_lock_init(&s->vbuf_q_lock);
 
+	if (type == CX18_ENC_STREAM_TYPE_YUV) {
 		s->vb_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		videobuf_queue_vmalloc_init(&s->vbuf_q, &cx18_videobuf_qops,
-			&cx->pci_dev->dev, &s->vbuf_q_lock,
-			V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			V4L2_FIELD_INTERLACED,
-			sizeof(struct cx18_videobuf_buffer),
-			s, &cx->serialize_lock);
 
 		/* Assume the previous pixel default */
 		s->pixelformat = V4L2_PIX_FMT_NV12_16L16;
 		s->vb_bytes_per_frame = cx->cxhdl.height * 720 * 3 / 2;
 		s->vb_bytes_per_line = 720;
+
+		s->vidq.io_modes = VB2_READ | VB2_MMAP | VB2_DMABUF;
+		s->vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		s->vidq.drv_priv = s;
+		s->vidq.buf_struct_size = sizeof(struct cx18_vb2_buffer);
+		s->vidq.ops = &cx18_vb2_qops;
+		s->vidq.mem_ops = &vb2_vmalloc_memops;
+		s->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		s->vidq.min_buffers_needed = 2;
+		s->vidq.gfp_flags = GFP_DMA32;
+		s->vidq.dev = &cx->pci_dev->dev;
+		s->vidq.lock = &cx->serialize_lock;
+
+		err = vb2_queue_init(&s->vidq);
+		if (err)
+			v4l2_err(&cx->v4l2_dev, "cannot init vb2 queue\n");
+		s->video_dev.queue = &s->vidq;
 	}
+	return err;
 }
 
 static int cx18_prep_dev(struct cx18 *cx, int type)
@@ -299,6 +305,7 @@ static int cx18_prep_dev(struct cx18 *cx, int type)
 	u32 cap = cx->v4l2_cap;
 	int num_offset = cx18_stream_info[type].num_offset;
 	int num = cx->instance + cx18_first_minor + num_offset;
+	int err;
 
 	/*
 	 * These five fields are always initialized.
@@ -330,7 +337,9 @@ static int cx18_prep_dev(struct cx18 *cx, int type)
 		return 0;
 	}
 
-	cx18_stream_init(cx, type);
+	err = cx18_stream_init(cx, type);
+	if (err)
+		return err;
 
 	/* Allocate the cx18_dvb struct only for the TS on cards with DTV */
 	if (type == CX18_ENC_STREAM_TYPE_TS) {
@@ -356,7 +365,10 @@ static int cx18_prep_dev(struct cx18 *cx, int type)
 
 	s->video_dev.num = num;
 	s->video_dev.v4l2_dev = &cx->v4l2_dev;
-	s->video_dev.fops = &cx18_v4l2_enc_fops;
+	if (type == CX18_ENC_STREAM_TYPE_YUV)
+		s->video_dev.fops = &cx18_v4l2_enc_yuv_fops;
+	else
+		s->video_dev.fops = &cx18_v4l2_enc_fops;
 	s->video_dev.release = video_device_release_empty;
 	if (cx->card->video_inputs->video_type == CX18_CARD_INPUT_VID_TUNER)
 		s->video_dev.tvnorms = cx->tuner_std;
@@ -525,12 +537,12 @@ void cx18_streams_cleanup(struct cx18 *cx, int unregister)
 		if (vdev->v4l2_dev == NULL)
 			continue;
 
-		if (type == CX18_ENC_STREAM_TYPE_YUV)
-			videobuf_mmap_free(&cx->streams[type].vbuf_q);
-
 		cx18_stream_free(&cx->streams[type]);
 
-		video_unregister_device(vdev);
+		if (type == CX18_ENC_STREAM_TYPE_YUV)
+			vb2_video_unregister_device(vdev);
+		else
+			video_unregister_device(vdev);
 	}
 }
 
-- 
2.39.0

