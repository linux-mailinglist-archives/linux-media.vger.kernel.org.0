Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E848558ECAF
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbiHJNCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 09:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbiHJNBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 09:01:36 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49A766A63
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 06:01:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 51281CE1D0E
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 13:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E35C433D6;
        Wed, 10 Aug 2022 13:01:30 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/6] vb2: videobuf -> videobuf2
Date:   Wed, 10 Aug 2022 15:01:23 +0200
Message-Id: <20220810130127.2707169-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
References: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is confusing to use the term 'videobuf' or 'video-buf' since that
usually refers to the old videobuf version 1 framework. Rename to
'videobuf2' or vb2.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 14 +++++++-------
 drivers/media/common/videobuf2/videobuf2-dvb.c  |  4 ++--
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++--
 include/media/videobuf2-core.h                  | 16 ++++++++--------
 include/media/videobuf2-dvb.h                   |  2 +-
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b203c1e26353..ab9697f3b5f1 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -398,7 +398,7 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
 }
 
 /*
- * __vb2_queue_alloc() - allocate videobuf buffer structures and (for MMAP type)
+ * __vb2_queue_alloc() - allocate vb2 buffer structures and (for MMAP type)
  * video buffer memory for all buffers/planes on the queue and initializes the
  * queue
  *
@@ -417,7 +417,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			    VB2_MAX_FRAME - q->num_buffers);
 
 	for (buffer = 0; buffer < num_buffers; ++buffer) {
-		/* Allocate videobuf buffer structures */
+		/* Allocate vb2 buffer structures */
 		vb = kzalloc(q->buf_struct_size, GFP_KERNEL);
 		if (!vb) {
 			dprintk(q, 1, "memory alloc for buffer struct failed\n");
@@ -599,7 +599,7 @@ static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	}
 #endif
 
-	/* Free videobuf buffers */
+	/* Free vb2 buffers */
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
 		kfree(q->bufs[buffer]);
@@ -1949,7 +1949,7 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 	if (pb)
 		call_void_bufop(q, fill_user_buffer, vb, pb);
 
-	/* Remove from videobuf queue */
+	/* Remove from vb2 queue */
 	list_del(&vb->queued_entry);
 	q->queued_count--;
 
@@ -1978,7 +1978,7 @@ EXPORT_SYMBOL_GPL(vb2_core_dqbuf);
  * __vb2_queue_cancel() - cancel and stop (pause) streaming
  *
  * Removes all queued buffers from driver's queue and all buffers queued by
- * userspace from videobuf's queue. Returns to state after reqbufs.
+ * userspace from vb2's queue. Returns to state after reqbufs.
  */
 static void __vb2_queue_cancel(struct vb2_queue *q)
 {
@@ -2016,7 +2016,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	q->uses_qbuf = 0;
 
 	/*
-	 * Remove all buffers from videobuf's list...
+	 * Remove all buffers from vb2's list...
 	 */
 	INIT_LIST_HEAD(&q->queued_list);
 	/*
@@ -2139,7 +2139,7 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
 
 	/*
 	 * Cancel will pause streaming and remove all buffers from the driver
-	 * and videobuf, effectively returning control over them to userspace.
+	 * and vb2, effectively returning control over them to userspace.
 	 *
 	 * Note that we do this even if q->streaming == 0: if you prepare or
 	 * queue buffers, and then call streamoff without ever having called
diff --git a/drivers/media/common/videobuf2/videobuf2-dvb.c b/drivers/media/common/videobuf2/videobuf2-dvb.c
index 9d571c9d31e9..8c15bcd07eef 100644
--- a/drivers/media/common/videobuf2/videobuf2-dvb.c
+++ b/drivers/media/common/videobuf2/videobuf2-dvb.c
@@ -3,8 +3,8 @@
  *
  * some helper function for simple DVB cards which simply DMA the
  * complete transport stream and let the computer sort everything else
- * (i.e. we are using the software demux, ...).  Also uses the
- * video-buf to manage DMA buffers.
+ * (i.e. we are using the software demux, ...).  Also uses vb2
+ * to manage DMA buffers.
  *
  * (c) 2004 Gerd Knorr <kraxel@bytesex.org> [SUSE Labs]
  */
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f26cb8586bd4..2ecd4483e139 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -268,7 +268,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 		/*
 		 * Single-planar buffers do not use planes array,
 		 * so fill in relevant v4l2_buffer struct fields instead.
-		 * In videobuf we use our internal V4l2_planes struct for
+		 * In vb2 we use our internal V4l2_planes struct for
 		 * single-planar buffers as well, for simplicity.
 		 *
 		 * If bytesused == 0 for the output buffer, then fall back
@@ -652,7 +652,7 @@ EXPORT_SYMBOL_GPL(vb2_find_buffer);
 
 /*
  * vb2_querybuf() - query video buffer information
- * @q:		videobuf queue
+ * @q:		vb2 queue
  * @b:		buffer struct passed from userspace to vidioc_querybuf handler
  *		in driver
  *
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 5468b633b9d2..3253bd2f6fee 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -65,7 +65,7 @@ struct vb2_buffer;
  *		 DMABUF memory types.
  * @get_userptr: acquire userspace memory for a hardware operation; used for
  *		 USERPTR memory types; vaddr is the address passed to the
- *		 videobuf layer when queuing a video buffer of USERPTR type;
+ *		 videobuf2 layer when queuing a video buffer of USERPTR type;
  *		 should return an allocator private per-buffer structure
  *		 associated with the buffer on success, ERR_PTR() on failure;
  *		 the returned private structure will then be passed as @buf_priv
@@ -97,7 +97,7 @@ struct vb2_buffer;
  *		associated with the passed private structure or NULL if not
  *		available.
  * @num_users:	return the current number of users of a memory buffer;
- *		return 1 if the videobuf layer (or actually the driver using
+ *		return 1 if the videobuf2 layer (or actually the driver using
  *		it) is the only user.
  * @mmap:	setup a userspace mapping for a given memory buffer under
  *		the provided virtual memory region.
@@ -210,11 +210,11 @@ enum vb2_io_modes {
  * enum vb2_buffer_state - current video buffer state.
  * @VB2_BUF_STATE_DEQUEUED:	buffer under userspace control.
  * @VB2_BUF_STATE_IN_REQUEST:	buffer is queued in media request.
- * @VB2_BUF_STATE_PREPARING:	buffer is being prepared in videobuf.
- * @VB2_BUF_STATE_QUEUED:	buffer queued in videobuf, but not in driver.
+ * @VB2_BUF_STATE_PREPARING:	buffer is being prepared in videobuf2.
+ * @VB2_BUF_STATE_QUEUED:	buffer queued in videobuf2, but not in driver.
  * @VB2_BUF_STATE_ACTIVE:	buffer queued in driver and possibly used
  *				in a hardware operation.
- * @VB2_BUF_STATE_DONE:		buffer returned from driver to videobuf, but
+ * @VB2_BUF_STATE_DONE:		buffer returned from driver to videobuf2, but
  *				not yet dequeued to userspace.
  * @VB2_BUF_STATE_ERROR:	same as above, but the operation on the buffer
  *				has ended with an error, which will be reported
@@ -466,7 +466,7 @@ struct vb2_buf_ops {
 };
 
 /**
- * struct vb2_queue - a videobuf queue.
+ * struct vb2_queue - a videobuf2 queue.
  *
  * @type:	private buffer type whose content is defined by the vb2-core
  *		caller. For example, for V4L2, it should match
@@ -544,7 +544,7 @@ struct vb2_buf_ops {
  * @mmap_lock:	private mutex used when buffers are allocated/freed/mmapped
  * @memory:	current memory type used
  * @dma_dir:	DMA mapping direction.
- * @bufs:	videobuf buffer structures
+ * @bufs:	videobuf2 buffer structures
  * @num_buffers: number of allocated/used buffers
  * @queued_list: list of buffers currently queued from userspace
  * @queued_count: number of buffers queued and ready for streaming.
@@ -683,7 +683,7 @@ void *vb2_plane_vaddr(struct vb2_buffer *vb, unsigned int plane_no);
 void *vb2_plane_cookie(struct vb2_buffer *vb, unsigned int plane_no);
 
 /**
- * vb2_buffer_done() - inform videobuf that an operation on a buffer
+ * vb2_buffer_done() - inform videobuf2 that an operation on a buffer
  *	is finished.
  * @vb:		pointer to &struct vb2_buffer to be used.
  * @state:	state of the buffer, as defined by &enum vb2_buffer_state.
diff --git a/include/media/videobuf2-dvb.h b/include/media/videobuf2-dvb.h
index 8605366ec87c..2d577b945637 100644
--- a/include/media/videobuf2-dvb.h
+++ b/include/media/videobuf2-dvb.h
@@ -24,7 +24,7 @@ struct vb2_dvb {
 	struct dvb_frontend	*frontend;
 	struct vb2_queue	dvbq;
 
-	/* video-buf-dvb state info */
+	/* vb2-dvb state info */
 	struct mutex		lock;
 	int			nfeeds;
 
-- 
2.35.1

