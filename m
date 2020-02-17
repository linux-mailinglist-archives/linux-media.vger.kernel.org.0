Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D6B1615D9
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgBQPOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:09 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55361 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBQPOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005WJ-BJ; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001aq-Dp; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 16/18] media: allegro: pass buffers through firmware
Date:   Mon, 17 Feb 2020 16:13:56 +0100
Message-Id: <20200217151358.5695-17-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
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
 .../staging/media/allegro-dvt/allegro-core.c  | 104 +++++++++++++++---
 1 file changed, 89 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 4f525920c194..80d3383b84f8 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -226,6 +226,10 @@ struct allegro_channel {
 	struct list_head buffers_reference;
 	struct list_head buffers_intermediate;
 
+	struct list_head source_shadow_list;
+	struct list_head stream_shadow_list;
+	struct mutex shadow_list_lock;
+
 	struct list_head list;
 	struct completion completion;
 
@@ -247,6 +251,14 @@ allegro_get_state(struct allegro_channel *channel)
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
@@ -1570,6 +1582,43 @@ static void allegro_channel_buf_done(struct allegro_channel *channel,
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
+	return (u64) buffer;
+}
+
+static struct vb2_v4l2_buffer *allegro_get_buffer(struct allegro_channel *channel,
+						  struct list_head *list,
+						  u64 handle)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct allegro_m2m_buffer *shadow;
+	u64 found;
+
+	mutex_lock(&channel->shadow_list_lock);
+	shadow = list_first_entry(list, struct allegro_m2m_buffer, head);
+	list_del_init(&shadow->head);
+	mutex_unlock(&channel->shadow_list_lock);
+
+	found = (u64) (&shadow->buf.vb);
+	if (handle != found)
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel %d: output buffer mismatch 0x%llx, expected 0x%llx\n",
+			  channel->mcu_channel_id, handle, found);
+
+	return &shadow->buf.vb;
+}
+
 static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		struct mcu_msg_encode_frame_response *msg)
 {
@@ -1585,13 +1634,17 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	ssize_t len;
 	ssize_t free;
 
-	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
+	src_buf = allegro_get_buffer(channel, &channel->source_shadow_list, msg->src_handle);
+	if (!src_buf)
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel %d: invalid source buffer\n",
+			  channel->mcu_channel_id);
 
-	if ((u64)src_buf != msg->src_handle || (u64)dst_buf != msg->stream_id)
-		v4l2_err(&dev->v4l2_dev,
-			 "channel %d: check failed\n",
-			 channel->mcu_channel_id);
+	dst_buf = allegro_get_buffer(channel, &channel->stream_shadow_list, msg->stream_id);
+	if (!dst_buf)
+		v4l2_warn(&dev->v4l2_dev,
+			  "channel %d: invalid stream buffer\n",
+			  channel->mcu_channel_id);
 
 	dst_buf->sequence = channel->csequence++;
 
@@ -1718,8 +1771,6 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
 
 	allegro_channel_buf_done(channel, dst_buf, state);
-
-	v4l2_m2m_job_finish(dev->m2m_dev, channel->fh.m2m_ctx);
 }
 
 static int allegro_handle_init(struct allegro_dev *dev,
@@ -2312,16 +2363,31 @@ static void allegro_stop_streaming(struct vb2_queue *q)
 	struct allegro_channel *channel = vb2_get_drv_priv(q);
 	struct allegro_dev *dev = channel->dev;
 	struct vb2_v4l2_buffer *buffer;
+	struct allegro_m2m_buffer *shadow, *tmp;
 
 	v4l2_dbg(2, debug, &dev->v4l2_dev,
 		 "%s: stop streaming\n",
 		 V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture");
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		mutex_lock(&channel->shadow_list_lock);
+		list_for_each_entry_safe(shadow, tmp, &channel->source_shadow_list, head) {
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
+		list_for_each_entry_safe(shadow, tmp, &channel->stream_shadow_list, head) {
+			list_del(&shadow->head);
+			v4l2_m2m_buf_done(&shadow->buf.vb, VB2_BUF_STATE_ERROR);
+		}
+		mutex_unlock(&channel->shadow_list_lock);
+
 		allegro_destroy_channel(channel);
 		while ((buffer = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx)))
 			v4l2_m2m_buf_done(buffer, VB2_BUF_STATE_ERROR);
@@ -2352,7 +2418,7 @@ static int allegro_queue_init(void *priv,
 	src_vq->drv_priv = channel;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->ops = &allegro_queue_ops;
-	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->buf_struct_size = sizeof(struct allegro_m2m_buffer);
 	src_vq->lock = &channel->dev->lock;
 	err = vb2_queue_init(src_vq);
 	if (err)
@@ -2365,7 +2431,7 @@ static int allegro_queue_init(void *priv,
 	dst_vq->drv_priv = channel;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->ops = &allegro_queue_ops;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct allegro_m2m_buffer);
 	dst_vq->lock = &channel->dev->lock;
 	err = vb2_queue_init(dst_vq);
 	if (err)
@@ -2457,6 +2523,9 @@ static int allegro_open(struct file *file)
 	v4l2_fh_add(&channel->fh);
 
 	init_completion(&channel->completion);
+	INIT_LIST_HEAD(&channel->source_shadow_list);
+	INIT_LIST_HEAD(&channel->stream_shadow_list);
+	mutex_init(&channel->shadow_list_lock);
 
 	channel->dev = dev;
 
@@ -2957,18 +3026,23 @@ static void allegro_device_run(void *priv)
 	dma_addr_t src_uv;
 	dma_addr_t dst_addr;
 	unsigned long dst_size;
+	u64 src_handle;
+	u64 dst_handle;
 
-	dst_buf = v4l2_m2m_next_dst_buf(channel->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
 	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	dst_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
-	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size, (u64)dst_buf);
+	dst_handle = allegro_put_buffer(channel, &channel->stream_shadow_list, dst_buf);
+	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size, dst_handle);
 
-	src_buf = v4l2_m2m_next_src_buf(channel->fh.m2m_ctx);
+	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
 	src_buf->sequence = channel->osequence++;
-
 	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	src_uv = src_y + (channel->stride * channel->height);
-	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv, (u64)src_buf);
+	src_handle = allegro_put_buffer(channel, &channel->source_shadow_list, src_buf);
+	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv, src_handle);
+
+	v4l2_m2m_job_finish(dev->m2m_dev, channel->fh.m2m_ctx);
 }
 
 static const struct v4l2_m2m_ops allegro_m2m_ops = {
-- 
2.20.1

