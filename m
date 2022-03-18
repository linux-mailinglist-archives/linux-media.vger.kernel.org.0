Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B50F4DE35A
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241068AbiCRVQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240986AbiCRVQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:16:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496A2FABE9;
        Fri, 18 Mar 2022 14:15:11 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55C6AEE;
        Fri, 18 Mar 2022 22:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647638108;
        bh=dVjP1fXwGIg5lZkDu6rGqdf3bjYXmhVmeNMypJMk2qM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=enF/HVoJNeGLR7qPgu4483XtapgconNLP+sktTV/mA6s2XlPlPD/DkxcCyHVP+4a9
         eYPvtmNaFX5hML4PVVkz8XHJDnzJx7IR5g9jlhg+cwWxY/WQUHrkd2gUdSM+RNq1zd
         Q2qM2QQVbrph12rUa6Jj8kcr7zcUr/RIlqfL0/Jg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] media: videobuf2-v4l2: Expose vb2_queue_is_busy() to drivers
Date:   Fri, 18 Mar 2022 23:14:44 +0200
Message-Id: <20220318211446.11543-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vb2 queue ownership is managed by the ioctl handler helpers
(vb2_ioctl_*). There are however use cases where drivers can benefit
from checking queue ownership, for instance when open-coding an ioctl
handler that needs to perform additional checks before calling the
corresponding vb2 operation.

Expose the vb2_queue_is_busy() function in the videobuf2-v4l2.h header,
and change its first argument to a struct vb2_queue pointer as the
function name implies it operates on a queue, not a video_device.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 26 +++++++------------
 include/media/videobuf2-v4l2.h                | 23 ++++++++++++++--
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 6edf4508c636..075d24ebf44c 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -977,12 +977,6 @@ EXPORT_SYMBOL_GPL(vb2_poll);
  * and so they simplify the driver code.
  */
 
-/* The queue is busy if there is a owner and you are not that owner. */
-static inline bool vb2_queue_is_busy(struct video_device *vdev, struct file *file)
-{
-	return vdev->queue->owner && vdev->queue->owner != file->private_data;
-}
-
 /* vb2 ioctl helpers */
 
 int vb2_ioctl_reqbufs(struct file *file, void *priv,
@@ -997,7 +991,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 	p->flags = flags;
 	if (res)
 		return res;
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
@@ -1026,7 +1020,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 		return res != -EBUSY ? res : 0;
 	if (res)
 		return res;
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 
 	res = vb2_create_bufs(vdev->queue, p);
@@ -1041,7 +1035,7 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	return vb2_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
 }
@@ -1060,7 +1054,7 @@ int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	return vb2_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
 }
@@ -1070,7 +1064,7 @@ int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	return vb2_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
 }
@@ -1080,7 +1074,7 @@ int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
 
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	return vb2_streamon(vdev->queue, i);
 }
@@ -1090,7 +1084,7 @@ int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
 
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	return vb2_streamoff(vdev->queue, i);
 }
@@ -1100,7 +1094,7 @@ int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
 
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		return -EBUSY;
 	return vb2_expbuf(vdev->queue, p);
 }
@@ -1152,7 +1146,7 @@ ssize_t vb2_fop_write(struct file *file, const char __user *buf,
 		return -EINVAL;
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		goto exit;
 	err = vb2_write(vdev->queue, buf, count, ppos,
 		       file->f_flags & O_NONBLOCK);
@@ -1176,7 +1170,7 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
 		return -EINVAL;
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (vb2_queue_is_busy(vdev, file))
+	if (vb2_queue_is_busy(vdev->queue, file))
 		goto exit;
 	err = vb2_read(vdev->queue, buf, count, ppos,
 		       file->f_flags & O_NONBLOCK);
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index b66585e304e2..1fb99583cd45 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -302,10 +302,29 @@ __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait);
  * The following functions are not part of the vb2 core API, but are simple
  * helper functions that you can use in your struct v4l2_file_operations,
  * struct v4l2_ioctl_ops and struct vb2_ops. They will serialize if vb2_queue->lock
- * or video_device->lock is set, and they will set and test vb2_queue->owner
- * to check if the calling filehandle is permitted to do the queuing operation.
+ * or video_device->lock is set, and they will set and test the queue owner
+ * (vb2_queue->owner) to check if the calling filehandle is permitted to do the
+ * queuing operation.
  */
 
+/**
+ * vb2_queue_is_busy() - check if the queue is busy
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @file:	file through which the vb2 queue access is performed
+ *
+ * The queue is considered busy if is has an owner and the owner is not the
+ * @file.
+ *
+ * Queue ownership is acquired and checked by some of the v4l2_ioctl_ops helpers
+ * below. Drivers can also use this function directly when they need to
+ * open-code ioctl handlers, for instance to add additional checks between the
+ * queue ownership test and the call to the corresponding vb2 operation.
+ */
+static inline bool vb2_queue_is_busy(struct vb2_queue *q, struct file *file)
+{
+	return q->owner && q->owner != file->private_data;
+}
+
 /* struct v4l2_ioctl_ops helpers */
 
 int vb2_ioctl_reqbufs(struct file *file, void *priv,
-- 
Regards,

Laurent Pinchart

