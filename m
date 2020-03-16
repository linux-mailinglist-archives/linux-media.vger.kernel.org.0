Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B2D186E82
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731814AbgCPP0p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40829 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731764AbgCPP0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:44 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrda-0000lR-0t; Mon, 16 Mar 2020 16:26:42 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055b-St; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 16/18] media: allegro: pass buffers through firmware
Date:   Mon, 16 Mar 2020 16:26:36 +0100
Message-Id: <20200316152638.19457-17-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316152638.19457-1-m.tretter@pengutronix.de>
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we know which buffers are processed by the codec from the address in
the ENCODE_FRAME response, we can queue multiple buffers in the firmware
and retrieve the buffer from the response of the firmware. This enables
the firmware to use the internal scheduling the codec and avoids round
trips through the driver when fetching the next frame.

Remove buffers that have been passed to the firmware from the m2m buffer
queue and put them into a shadow queue for tracking the buffer in the
driver. When we receive a ENCODE_FRAME response from the firmware, get
the buffer from the shadow queue and finish the buffer.

Furthermore, it is necessary to finish the job straight after passing
the buffer to the firmware to allow the V4L2 framework to send further
buffers to the driver.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog

v1 -> v2:
- Search buffer in entire shadow buffer queue
- Fix error handling if firmware reports wrong buffer handles
- Fix warnings about lines longer than 80 characters
- Set LAST flag on last buffer instead of last but one buffer
---
 .../staging/media/allegro-dvt/allegro-core.c  | 124 +++++++++++++++---
 1 file changed, 103 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 45e0d2c2fc44..1554beebea88 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -228,6 +228,11 @@ struct allegro_channel {
 	struct list_head buffers_reference;
 	struct list_head buffers_intermediate;
 
+	struct list_head source_shadow_list;
+	struct list_head stream_shadow_list;
+	/* protect shadow lists of buffers passed to firmware */
+	struct mutex shadow_list_lock;
+
 	struct list_head list;
 	struct completion completion;
 
@@ -249,6 +254,14 @@ allegro_get_state(struct allegro_channel *channel)
 	return channel->state;
 }
 
+struct allegro_m2m_buffer {
+	struct v4l2_m2m_buffer buf;
+	struct list_head head;
+};
+
+#define to_allegro_m2m_buffer(__buf) \
+	container_of(__buf, struct allegro_m2m_buffer, buf)
+
 struct fw_info {
 	unsigned int id;
 	unsigned int id_codec;
@@ -1567,8 +1580,11 @@ static bool allegro_channel_is_at_eos(struct allegro_channel *channel)
 		break;
 	case ALLEGRO_STATE_DRAIN:
 	case ALLEGRO_STATE_WAIT_FOR_BUFFER:
-		if (v4l2_m2m_num_src_bufs_ready(channel->fh.m2m_ctx) == 0)
+		mutex_lock(&channel->shadow_list_lock);
+		if (v4l2_m2m_num_src_bufs_ready(channel->fh.m2m_ctx) == 0 &&
+		    list_empty(&channel->source_shadow_list))
 			is_at_eos = true;
+		mutex_unlock(&channel->shadow_list_lock);
 		break;
 	default:
 		break;
@@ -1595,6 +1611,41 @@ static void allegro_channel_buf_done(struct allegro_channel *channel,
 	v4l2_m2m_buf_done(buf, state);
 }
 
+static u64 allegro_put_buffer(struct allegro_channel *channel,
+			      struct list_head *list,
+			      struct vb2_v4l2_buffer *buffer)
+{
+	struct v4l2_m2m_buffer *b = container_of(buffer,
+						 struct v4l2_m2m_buffer, vb);
+	struct allegro_m2m_buffer *shadow = to_allegro_m2m_buffer(b);
+
+	mutex_lock(&channel->shadow_list_lock);
+	list_add_tail(&shadow->head, list);
+	mutex_unlock(&channel->shadow_list_lock);
+
+	return ptr_to_u64(buffer);
+}
+
+static struct vb2_v4l2_buffer *
+allegro_get_buffer(struct allegro_channel *channel,
+		   struct list_head *list, u64 handle)
+{
+	struct allegro_m2m_buffer *shadow, *tmp;
+	struct vb2_v4l2_buffer *buffer = NULL;
+
+	mutex_lock(&channel->shadow_list_lock);
+	list_for_each_entry_safe(shadow, tmp, list, head) {
+		if (handle == ptr_to_u64(&shadow->buf.vb)) {
+			buffer = &shadow->buf.vb;
+			list_del_init(&shadow->head);
+			break;
+		}
+	}
+	mutex_unlock(&channel->shadow_list_lock);
+
+	return buffer;
+}
+
 static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		struct mcu_msg_encode_frame_response *msg)
 {
@@ -1610,17 +1661,22 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	ssize_t len;
 	ssize_t free;
 
-	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
-	if (ptr_to_u64(src_buf) != msg->src_handle)
+	src_buf = allegro_get_buffer(channel, &channel->source_shadow_list,
+				     msg->src_handle);
+	if (!src_buf)
 		v4l2_warn(&dev->v4l2_dev,
-			  "channel %d: invalid source buffer (0x%llx)\n",
-			  channel->mcu_channel_id, msg->src_handle);
+			  "channel %d: invalid source buffer\n",
+			  channel->mcu_channel_id);
 
-	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
-	if (ptr_to_u64(dst_buf) != msg->stream_id)
+	dst_buf = allegro_get_buffer(channel, &channel->stream_shadow_list,
+				     msg->stream_id);
+	if (!dst_buf)
 		v4l2_warn(&dev->v4l2_dev,
-			  "channel %d: invalid stream buffer (0x%llx)\n",
-			  channel->mcu_channel_id, msg->stream_id);
+			  "channel %d: invalid stream buffer\n",
+			  channel->mcu_channel_id);
+
+	if (!src_buf || !dst_buf)
+		goto err;
 
 	dst_buf->sequence = channel->csequence++;
 
@@ -1744,11 +1800,11 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		 msg->qp, partition->size);
 
 err:
-	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+	if (src_buf)
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
 
-	allegro_channel_buf_done(channel, dst_buf, state);
-
-	v4l2_m2m_job_finish(dev->m2m_dev, channel->fh.m2m_ctx);
+	if (dst_buf)
+		allegro_channel_buf_done(channel, dst_buf, state);
 }
 
 static int allegro_handle_init(struct allegro_dev *dev,
@@ -2344,16 +2400,33 @@ static void allegro_stop_streaming(struct vb2_queue *q)
 	struct allegro_channel *channel = vb2_get_drv_priv(q);
 	struct allegro_dev *dev = channel->dev;
 	struct vb2_v4l2_buffer *buffer;
+	struct allegro_m2m_buffer *shadow, *tmp;
 
 	v4l2_dbg(2, debug, &dev->v4l2_dev,
 		 "%s: stop streaming\n",
 		 V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture");
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		mutex_lock(&channel->shadow_list_lock);
+		list_for_each_entry_safe(shadow, tmp,
+					 &channel->source_shadow_list, head) {
+			list_del(&shadow->head);
+			v4l2_m2m_buf_done(&shadow->buf.vb, VB2_BUF_STATE_ERROR);
+		}
+		mutex_unlock(&channel->shadow_list_lock);
+
 		allegro_set_state(channel, ALLEGRO_STATE_STOPPED);
 		while ((buffer = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx)))
 			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
 	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		mutex_lock(&channel->shadow_list_lock);
+		list_for_each_entry_safe(shadow, tmp,
+					 &channel->stream_shadow_list, head) {
+			list_del(&shadow->head);
+			v4l2_m2m_buf_done(&shadow->buf.vb, VB2_BUF_STATE_ERROR);
+		}
+		mutex_unlock(&channel->shadow_list_lock);
+
 		allegro_destroy_channel(channel);
 		while ((buffer = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx)))
 			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
@@ -2384,7 +2457,7 @@ static int allegro_queue_init(void *priv,
 	src_vq->drv_priv = channel;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->ops = &allegro_queue_ops;
-	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->buf_struct_size = sizeof(struct allegro_m2m_buffer);
 	src_vq->lock = &channel->dev->lock;
 	err = vb2_queue_init(src_vq);
 	if (err)
@@ -2397,7 +2470,7 @@ static int allegro_queue_init(void *priv,
 	dst_vq->drv_priv = channel;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->ops = &allegro_queue_ops;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct allegro_m2m_buffer);
 	dst_vq->lock = &channel->dev->lock;
 	err = vb2_queue_init(dst_vq);
 	if (err)
@@ -2510,6 +2583,9 @@ static int allegro_open(struct file *file)
 		return -ENOMEM;
 
 	init_completion(&channel->completion);
+	INIT_LIST_HEAD(&channel->source_shadow_list);
+	INIT_LIST_HEAD(&channel->stream_shadow_list);
+	mutex_init(&channel->shadow_list_lock);
 
 	channel->dev = dev;
 
@@ -3039,20 +3115,26 @@ static void allegro_device_run(void *priv)
 	dma_addr_t src_uv;
 	dma_addr_t dst_addr;
 	unsigned long dst_size;
+	u64 src_handle;
+	u64 dst_handle;
 
-	dst_buf = v4l2_m2m_next_dst_buf(channel->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
 	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	dst_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
+	dst_handle = allegro_put_buffer(channel, &channel->stream_shadow_list,
+					dst_buf);
 	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size,
-					   ptr_to_u64(dst_buf));
+					   dst_handle);
 
-	src_buf = v4l2_m2m_next_src_buf(channel->fh.m2m_ctx);
+	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
 	src_buf->sequence = channel->osequence++;
-
 	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	src_uv = src_y + (channel->stride * channel->height);
-	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv,
-				      ptr_to_u64(src_buf));
+	src_handle = allegro_put_buffer(channel, &channel->source_shadow_list,
+					src_buf);
+	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv, src_handle);
+
+	v4l2_m2m_job_finish(dev->m2m_dev, channel->fh.m2m_ctx);
 }
 
 static const struct v4l2_m2m_ops allegro_m2m_ops = {
-- 
2.20.1

