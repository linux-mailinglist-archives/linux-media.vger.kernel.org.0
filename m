Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9182C8EB85
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbfHOM2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:28:08 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57963 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730442AbfHOM2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:28:08 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yErKhvadoDqPeyErNhY4MQ; Thu, 15 Aug 2019 14:28:05 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] videobuf2-core: avoid buffer operations while in
 stop_streaming
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <475fff8b-9a11-0511-2226-a1767016746e@xs4all.nl>
Date:   Thu, 15 Aug 2019 14:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDcfP8ei0UTwWRRa729dHa2KbKuaDg+/ETHe78uM0sL0U36E9dSq9ZJJ7aEOM1hN3MDzrr9F1EzGG2w7FYJd4wwu2LPGu91M1XnNOqnnMEauQwG/TKgf
 hOE3hO0fYJIGqys6b1l8KEGFFph8hndhWyOuyebB0gHVysduQe2MyDu52yTSMa39Nr4do/d/7x2E7saYufm03PgbTGrhuw2Id/wYn2qBoQQX7nikl0x+SFcw
 OrrhZ/OkkIlyOU1us52zPx+okUguwovf+yovhxOTzGhpacfaR7Me1BKJ4YI9bC0X
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stop_streaming callback is called with the queue lock held.

But some drivers (vivid being one of them) need to stop a kernel thread
in stop_streaming, and if that kernel thread takes the same queue lock,
then stop_streaming may have to unlock the queue lock, stop the thread,
and lock it again.

However, if you do that, then you must ensure that no other operations
can take place that can change the list of buffers queued to the driver,
specifically: QBUF, STREAMON/OFF, REQBUFS, CREATE_BUFS.

__vb2_wait_for_done_vb() also checks for this and won't try to wait for
new buffers if in_stop_streaming is true.

This issue caused this syzbot report:

https://syzkaller.appspot.com/bug?extid=736c3aae4af7b50d9683

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+736c3aae4af7b50d9683@syzkaller.appspotmail.com
---
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..7c70bb9f6cb8 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -677,6 +677,11 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		return -EBUSY;
 	}

+	if (q->in_stop_streaming) {
+		dprintk(1, "reqbufs while the stream is being stopped\n");
+		return -EBUSY;
+	}
+
 	if (q->waiting_in_dqbuf && *count) {
 		dprintk(1, "another dup()ped fd is waiting for a buffer\n");
 		return -EBUSY;
@@ -811,6 +816,11 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	int ret;

+	if (q->in_stop_streaming) {
+		dprintk(1, "create_bufs while the stream is being stopped\n");
+		return -EBUSY;
+	}
+
 	if (q->num_buffers == VB2_MAX_FRAME) {
 		dprintk(1, "maximum number of buffers already allocated\n");
 		return -ENOBUFS;
@@ -1514,6 +1524,11 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 	struct vb2_buffer *vb;
 	int ret;

+	if (q->in_stop_streaming) {
+		dprintk(1, "qbuf while the stream is being stopped\n");
+		return -EBUSY;
+	}
+
 	if (q->error) {
 		dprintk(1, "fatal error occurred on queue\n");
 		return -EIO;
@@ -1675,6 +1690,11 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
 			return -EBUSY;
 		}

+		if (q->in_stop_streaming) {
+			dprintk(1, "the stream is being stopped, will not wait for buffers\n");
+			return -EINVAL;
+		}
+
 		if (!q->streaming) {
 			dprintk(1, "streaming off, will not wait for buffers\n");
 			return -EINVAL;
@@ -1716,7 +1736,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
 		dprintk(3, "will sleep waiting for buffers\n");
 		ret = wait_event_interruptible(q->done_wq,
 				!list_empty(&q->done_list) || !q->streaming ||
-				q->error);
+				q->in_stop_streaming || q->error);

 		/*
 		 * We need to reevaluate both conditions again after reacquiring
@@ -1866,12 +1886,18 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 {
 	unsigned int i;

+	if (WARN_ON(q->in_stop_streaming))
+		return;
+
 	/*
 	 * Tell driver to stop all transactions and release all queued
 	 * buffers.
 	 */
-	if (q->start_streaming_called)
+	if (q->start_streaming_called) {
+		q->in_stop_streaming = 1;
 		call_void_qop(q, stop_streaming, q);
+		q->in_stop_streaming = 0;
+	}

 	/*
 	 * If you see this warning, then the driver isn't cleaning up properly
@@ -1975,6 +2001,11 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 		return -EINVAL;
 	}

+	if (q->in_stop_streaming) {
+		dprintk(1, "streamon while the stream is being stopped\n");
+		return -EBUSY;
+	}
+
 	if (q->streaming) {
 		dprintk(3, "already streaming\n");
 		return 0;
@@ -2026,6 +2057,11 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
 		return -EINVAL;
 	}

+	if (q->in_stop_streaming) {
+		dprintk(1, "streamoff while the stream is being stopped\n");
+		return -EBUSY;
+	}
+
 	/*
 	 * Cancel will pause streaming and remove all buffers from the driver
 	 * and videobuf, effectively returning control over them to userspace.
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 640aabe69450..c4b7edd25e13 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -535,6 +535,9 @@ struct vb2_buf_ops {
  * @streaming:	current streaming state
  * @start_streaming_called: @start_streaming was called successfully and we
  *		started streaming.
+ * @in_stop_streaming: set when calling @stop_streaming. While 1, no new buffers
+ * 		can be queued or created, and neither is it possible to start or
+ * 		stop streaming.
  * @error:	a fatal error occurred on the queue
  * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
  *		buffers. Only set for capture queues if qbuf has not yet been
@@ -595,6 +598,7 @@ struct vb2_queue {

 	unsigned int			streaming:1;
 	unsigned int			start_streaming_called:1;
+	unsigned int			in_stop_streaming:1;
 	unsigned int			error:1;
 	unsigned int			waiting_for_buffers:1;
 	unsigned int			waiting_in_dqbuf:1;
