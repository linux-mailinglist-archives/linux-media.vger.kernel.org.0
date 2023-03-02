Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6F96A8323
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjCBNDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCBNDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A6518B31
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4550615C6
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5C2C4339E;
        Thu,  2 Mar 2023 13:03:39 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/17] media: saa7146: convert to vb2
Date:   Thu,  2 Mar 2023 14:03:20 +0100
Message-Id: <20230302130330.1125172-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
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

Convert this driver from the old videobuf framework to the vb2
frame.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/Kconfig         |   2 +-
 drivers/media/common/saa7146/saa7146_fops.c  | 323 ++-----------
 drivers/media/common/saa7146/saa7146_vbi.c   | 277 +++++------
 drivers/media/common/saa7146/saa7146_video.c | 484 +++++--------------
 drivers/media/pci/saa7146/mxb.c              |  10 -
 include/media/drv-intf/saa7146_vv.h          |  30 +-
 6 files changed, 308 insertions(+), 818 deletions(-)

diff --git a/drivers/media/common/saa7146/Kconfig b/drivers/media/common/saa7146/Kconfig
index a0aa155e5d85..dfec86e50dff 100644
--- a/drivers/media/common/saa7146/Kconfig
+++ b/drivers/media/common/saa7146/Kconfig
@@ -6,5 +6,5 @@ config VIDEO_SAA7146
 config VIDEO_SAA7146_VV
 	tristate
 	depends on VIDEO_DEV
-	select VIDEOBUF_DMA_SG
+	select VIDEOBUF2_DMA_SG
 	select VIDEO_SAA7146
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 4645545c3719..a3b4fe303d03 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -42,22 +42,6 @@ void saa7146_res_free(struct saa7146_dev *dev, unsigned int bits)
 }
 
 
-/********************************************************************************/
-/* common dma functions */
-
-void saa7146_dma_free(struct saa7146_dev *dev,struct videobuf_queue *q,
-						struct saa7146_buf *buf)
-{
-	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
-	DEB_EE("dev:%p, buf:%p\n", dev, buf);
-
-	videobuf_waiton(q, &buf->vb, 0, 0);
-	videobuf_dma_unmap(q->dev, dma);
-	videobuf_dma_free(dma);
-	buf->vb.state = VIDEOBUF_NEEDS_INIT;
-}
-
-
 /********************************************************************************/
 /* common buffer functions */
 
@@ -76,8 +60,7 @@ int saa7146_buffer_queue(struct saa7146_dev *dev,
 		DEB_D("immediately activating buffer %p\n", buf);
 		buf->activate(dev,buf,NULL);
 	} else {
-		list_add_tail(&buf->vb.queue,&q->queue);
-		buf->vb.state = VIDEOBUF_QUEUED;
+		list_add_tail(&buf->list, &q->queue);
 		DEB_D("adding buffer %p to queue. (active buffer present)\n",
 		      buf);
 	}
@@ -88,21 +71,31 @@ void saa7146_buffer_finish(struct saa7146_dev *dev,
 			   struct saa7146_dmaqueue *q,
 			   int state)
 {
+	struct saa7146_vv *vv = dev->vv_data;
+	struct saa7146_buf *buf = q->curr;
+
 	assert_spin_locked(&dev->slock);
 	DEB_EE("dev:%p, dmaq:%p, state:%d\n", dev, q, state);
 	DEB_EE("q->curr:%p\n", q->curr);
 
 	/* finish current buffer */
-	if (NULL == q->curr) {
+	if (!buf) {
 		DEB_D("aiii. no current buffer\n");
 		return;
 	}
 
-	q->curr->vb.state = state;
-	q->curr->vb.ts = ktime_get_ns();
-	wake_up(&q->curr->vb.done);
-
 	q->curr = NULL;
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	if (vv->video_fmt.field == V4L2_FIELD_ALTERNATE)
+		buf->vb.field = vv->last_field;
+	else if (vv->video_fmt.field == V4L2_FIELD_ANY)
+		buf->vb.field = (vv->video_fmt.height > vv->standard->v_max_out / 2)
+			? V4L2_FIELD_INTERLACED
+			: V4L2_FIELD_BOTTOM;
+	else
+		buf->vb.field = vv->video_fmt.field;
+	buf->vb.sequence = vv->seqnr++;
+	vb2_buffer_done(&buf->vb.vb2_buf, state);
 }
 
 void saa7146_buffer_next(struct saa7146_dev *dev,
@@ -118,10 +111,10 @@ void saa7146_buffer_next(struct saa7146_dev *dev,
 	assert_spin_locked(&dev->slock);
 	if (!list_empty(&q->queue)) {
 		/* activate next one from queue */
-		buf = list_entry(q->queue.next,struct saa7146_buf,vb.queue);
-		list_del(&buf->vb.queue);
+		buf = list_entry(q->queue.next, struct saa7146_buf, list);
+		list_del(&buf->list);
 		if (!list_empty(&q->queue))
-			next = list_entry(q->queue.next,struct saa7146_buf, vb.queue);
+			next = list_entry(q->queue.next,struct saa7146_buf, list);
 		q->curr = buf;
 		DEB_INT("next buffer: buf:%p, prev:%p, next:%p\n",
 			buf, q->queue.prev, q->queue.next);
@@ -169,7 +162,7 @@ void saa7146_buffer_timeout(struct timer_list *t)
 	spin_lock_irqsave(&dev->slock,flags);
 	if (q->curr) {
 		DEB_D("timeout on %p\n", q->curr);
-		saa7146_buffer_finish(dev,q,VIDEOBUF_ERROR);
+		saa7146_buffer_finish(dev, q, VB2_BUF_STATE_ERROR);
 	}
 
 	/* we don't restart the transfer here like other drivers do. when
@@ -178,257 +171,23 @@ void saa7146_buffer_timeout(struct timer_list *t)
 	   we mess up our capture logic. if a timeout occurs on another buffer,
 	   then something is seriously broken before, so no need to buffer the
 	   next capture IMHO... */
-/*
-	saa7146_buffer_next(dev,q);
-*/
+
+	saa7146_buffer_next(dev, q, 0);
+
 	spin_unlock_irqrestore(&dev->slock,flags);
 }
 
 /********************************************************************************/
 /* file operations */
 
-static int fops_open(struct file *file)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = NULL;
-	int result = 0;
-
-	DEB_EE("file:%p, dev:%s\n", file, video_device_node_name(vdev));
-
-	if (mutex_lock_interruptible(vdev->lock))
-		return -ERESTARTSYS;
-
-	DEB_D("using: %p\n", dev);
-
-	/* check if an extension is registered */
-	if( NULL == dev->ext ) {
-		DEB_S("no extension registered for this device\n");
-		result = -ENODEV;
-		goto out;
-	}
-
-	/* allocate per open data */
-	fh = kzalloc(sizeof(*fh),GFP_KERNEL);
-	if (NULL == fh) {
-		DEB_S("cannot allocate memory for per open data\n");
-		result = -ENOMEM;
-		goto out;
-	}
-
-	v4l2_fh_init(&fh->fh, vdev);
-
-	file->private_data = &fh->fh;
-
-	if (vdev->vfl_type == VFL_TYPE_VBI) {
-		DEB_S("initializing vbi...\n");
-		if (dev->ext_vv_data->capabilities & V4L2_CAP_VBI_CAPTURE)
-			result = saa7146_vbi_uops.open(dev,file);
-		if (dev->ext_vv_data->vbi_fops.open)
-			dev->ext_vv_data->vbi_fops.open(file);
-	} else {
-		DEB_S("initializing video...\n");
-		result = saa7146_video_uops.open(dev,file);
-	}
-
-	if (0 != result) {
-		goto out;
-	}
-
-	if( 0 == try_module_get(dev->ext->module)) {
-		result = -EINVAL;
-		goto out;
-	}
-
-	result = 0;
-	v4l2_fh_add(&fh->fh);
-out:
-	if (fh && result != 0) {
-		kfree(fh);
-		file->private_data = NULL;
-	}
-	mutex_unlock(vdev->lock);
-	return result;
-}
-
-static int fops_release(struct file *file)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh  *fh  = file->private_data;
-
-	DEB_EE("file:%p\n", file);
-
-	mutex_lock(vdev->lock);
-
-	if (vdev->vfl_type == VFL_TYPE_VBI) {
-		if (dev->ext_vv_data->capabilities & V4L2_CAP_VBI_CAPTURE)
-			saa7146_vbi_uops.release(dev,file);
-		if (dev->ext_vv_data->vbi_fops.release)
-			dev->ext_vv_data->vbi_fops.release(file);
-	} else {
-		saa7146_video_uops.release(dev,file);
-	}
-
-	v4l2_fh_del(&fh->fh);
-	v4l2_fh_exit(&fh->fh);
-	module_put(dev->ext->module);
-	file->private_data = NULL;
-	kfree(fh);
-
-	mutex_unlock(vdev->lock);
-
-	return 0;
-}
-
-static int fops_mmap(struct file *file, struct vm_area_struct * vma)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = file->private_data;
-	struct videobuf_queue *q;
-	int res;
-
-	switch (vdev->vfl_type) {
-	case VFL_TYPE_VIDEO: {
-		DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: file:%p, vma:%p\n",
-		       file, vma);
-		q = &fh->video_q;
-		break;
-		}
-	case VFL_TYPE_VBI: {
-		DEB_EE("V4L2_BUF_TYPE_VBI_CAPTURE: file:%p, vma:%p\n",
-		       file, vma);
-		if (dev->ext_vv_data->capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
-			return -ENODEV;
-		q = &fh->vbi_q;
-		break;
-		}
-	default:
-		BUG();
-	}
-
-	if (mutex_lock_interruptible(vdev->lock))
-		return -ERESTARTSYS;
-	res = videobuf_mmap_mapper(q, vma);
-	mutex_unlock(vdev->lock);
-	return res;
-}
-
-static __poll_t __fops_poll(struct file *file, struct poll_table_struct *wait)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = file->private_data;
-	struct videobuf_buffer *buf = NULL;
-	struct videobuf_queue *q;
-	__poll_t res = v4l2_ctrl_poll(file, wait);
-
-	DEB_EE("file:%p, poll:%p\n", file, wait);
-
-	if (vdev->vfl_type == VFL_TYPE_VBI) {
-		if (dev->ext_vv_data->capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
-			return res | EPOLLOUT | EPOLLWRNORM;
-		if( 0 == fh->vbi_q.streaming )
-			return res | videobuf_poll_stream(file, &fh->vbi_q, wait);
-		q = &fh->vbi_q;
-	} else {
-		DEB_D("using video queue\n");
-		q = &fh->video_q;
-	}
-
-	if (!list_empty(&q->stream))
-		buf = list_entry(q->stream.next, struct videobuf_buffer, stream);
-
-	if (!buf) {
-		DEB_D("buf == NULL!\n");
-		return res | EPOLLERR;
-	}
-
-	poll_wait(file, &buf->done, wait);
-	if (buf->state == VIDEOBUF_DONE || buf->state == VIDEOBUF_ERROR) {
-		DEB_D("poll succeeded!\n");
-		return res | EPOLLIN | EPOLLRDNORM;
-	}
-
-	DEB_D("nothing to poll for, buf->state:%d\n", buf->state);
-	return res;
-}
-
-static __poll_t fops_poll(struct file *file, struct poll_table_struct *wait)
-{
-	struct video_device *vdev = video_devdata(file);
-	__poll_t res;
-
-	mutex_lock(vdev->lock);
-	res = __fops_poll(file, wait);
-	mutex_unlock(vdev->lock);
-	return res;
-}
-
-static ssize_t fops_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct saa7146_dev *dev = video_drvdata(file);
-	int ret;
-
-	switch (vdev->vfl_type) {
-	case VFL_TYPE_VIDEO:
-/*
-		DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: file:%p, data:%p, count:%lun",
-		       file, data, (unsigned long)count);
-*/
-		return saa7146_video_uops.read(file,data,count,ppos);
-	case VFL_TYPE_VBI:
-/*
-		DEB_EE("V4L2_BUF_TYPE_VBI_CAPTURE: file:%p, data:%p, count:%lu\n",
-		       file, data, (unsigned long)count);
-*/
-		if (dev->ext_vv_data->capabilities & V4L2_CAP_VBI_CAPTURE) {
-			if (mutex_lock_interruptible(vdev->lock))
-				return -ERESTARTSYS;
-			ret = saa7146_vbi_uops.read(file, data, count, ppos);
-			mutex_unlock(vdev->lock);
-			return ret;
-		}
-		return -EINVAL;
-	default:
-		BUG();
-	}
-}
-
-static ssize_t fops_write(struct file *file, const char __user *data, size_t count, loff_t *ppos)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct saa7146_dev *dev = video_drvdata(file);
-	int ret;
-
-	switch (vdev->vfl_type) {
-	case VFL_TYPE_VIDEO:
-		return -EINVAL;
-	case VFL_TYPE_VBI:
-		if (dev->ext_vv_data->vbi_fops.write) {
-			if (mutex_lock_interruptible(vdev->lock))
-				return -ERESTARTSYS;
-			ret = dev->ext_vv_data->vbi_fops.write(file, data, count, ppos);
-			mutex_unlock(vdev->lock);
-			return ret;
-		}
-		return -EINVAL;
-	default:
-		BUG();
-	}
-}
-
 static const struct v4l2_file_operations video_fops =
 {
 	.owner		= THIS_MODULE,
-	.open		= fops_open,
-	.release	= fops_release,
-	.read		= fops_read,
-	.write		= fops_write,
-	.poll		= fops_poll,
-	.mmap		= fops_mmap,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.read		= vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
 	.unlocked_ioctl	= video_ioctl2,
 };
 
@@ -568,16 +327,20 @@ EXPORT_SYMBOL_GPL(saa7146_vv_release);
 int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 			    char *name, int type)
 {
+	struct vb2_queue *q;
 	int err;
 	int i;
 
 	DEB_EE("dev:%p, name:'%s', type:%d\n", dev, name, type);
 
 	vfd->fops = &video_fops;
-	if (type == VFL_TYPE_VIDEO)
+	if (type == VFL_TYPE_VIDEO) {
 		vfd->ioctl_ops = &dev->ext_vv_data->vid_ops;
-	else
+		q = &dev->vv_data->video_dmaq.q;
+	} else {
 		vfd->ioctl_ops = &dev->ext_vv_data->vbi_ops;
+		q = &dev->vv_data->vbi_dmaq.q;
+	}
 	vfd->release = video_device_release_empty;
 	vfd->lock = &dev->v4l2_lock;
 	vfd->v4l2_dev = &dev->v4l2_dev;
@@ -592,8 +355,22 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 		vfd->device_caps &=
 			~(V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_OUTPUT);
 	else
-		vfd->device_caps &=
-			~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO);
+		vfd->device_caps &= ~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO);
+	q->type = type == VFL_TYPE_VIDEO ? V4L2_BUF_TYPE_VIDEO_CAPTURE : V4L2_BUF_TYPE_VBI_CAPTURE;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
+	q->ops = type == VFL_TYPE_VIDEO ? &video_qops : &vbi_qops;
+	q->mem_ops = &vb2_dma_sg_memops;
+	q->drv_priv = dev;
+	q->gfp_flags = __GFP_DMA32;
+	q->buf_struct_size = sizeof(struct saa7146_buf);
+	q->lock = &dev->v4l2_lock;
+	q->min_buffers_needed = 2;
+	q->dev = &dev->pci->dev;
+	err = vb2_queue_init(q);
+	if (err)
+		return err;
+	vfd->queue = q;
 	video_set_drvdata(vfd, dev);
 
 	err = video_register_device(vfd, type, -1);
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
index 1a6fb0f381b7..c1d8d8008b6f 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -207,7 +207,6 @@ static int buffer_activate(struct saa7146_dev *dev,
 			   struct saa7146_buf *next)
 {
 	struct saa7146_vv *vv = dev->vv_data;
-	buf->vb.state = VIDEOBUF_ACTIVE;
 
 	DEB_VBI("dev:%p, buf:%p, next:%p\n", dev, buf, next);
 	saa7146_set_vbi_capture(dev,buf,next);
@@ -216,111 +215,101 @@ static int buffer_activate(struct saa7146_dev *dev,
 	return 0;
 }
 
-static int buffer_prepare(struct videobuf_queue *q, struct videobuf_buffer *vb,enum v4l2_field field)
-{
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
+/* ------------------------------------------------------------------ */
 
-	int err = 0;
-	int lines, llength, size;
+static int queue_setup(struct vb2_queue *q,
+		       unsigned int *num_buffers, unsigned int *num_planes,
+		       unsigned int sizes[], struct device *alloc_devs[])
+{
+	unsigned int size = 16 * 2 * vbi_pixel_to_capture;
 
-	lines   = 16 * 2 ; /* 2 fields */
-	llength = vbi_pixel_to_capture;
-	size = lines * llength;
+	if (*num_planes)
+		return sizes[0] < size ? -EINVAL : 0;
+	*num_planes = 1;
+	sizes[0] = size;
 
-	DEB_VBI("vb:%p\n", vb);
+	return 0;
+}
 
-	if (0 != buf->vb.baddr  &&  buf->vb.bsize < size) {
-		DEB_VBI("size mismatch\n");
-		return -EINVAL;
-	}
+static void buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
+	struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
+	unsigned long flags;
 
-	if (buf->vb.size != size)
-		saa7146_dma_free(dev,q,buf);
+	spin_lock_irqsave(&dev->slock, flags);
 
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
+	saa7146_buffer_queue(dev, &dev->vv_data->vbi_dmaq, buf);
+	spin_unlock_irqrestore(&dev->slock, flags);
+}
 
-		buf->vb.width  = llength;
-		buf->vb.height = lines;
-		buf->vb.size   = size;
-		buf->vb.field  = field;	// FIXME: check this
+static int buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0);
+	struct scatterlist *list = sgt->sgl;
+	int length = sgt->nents;
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
+	int ret;
 
-		saa7146_pgtable_free(dev->pci, &buf->pt[2]);
-		saa7146_pgtable_alloc(dev->pci, &buf->pt[2]);
-
-		err = videobuf_iolock(q,&buf->vb, NULL);
-		if (err)
-			goto oops;
-		err = saa7146_pgtable_build_single(dev->pci, &buf->pt[2],
-						 dma->sglist, dma->sglen);
-		if (0 != err)
-			return err;
-	}
-	buf->vb.state = VIDEOBUF_PREPARED;
 	buf->activate = buffer_activate;
 
-	return 0;
-
- oops:
-	DEB_VBI("error out\n");
-	saa7146_dma_free(dev,q,buf);
+	saa7146_pgtable_alloc(dev->pci, &buf->pt[2]);
 
-	return err;
+	ret = saa7146_pgtable_build_single(dev->pci, &buf->pt[2],
+					 list, length);
+	if (ret)
+		saa7146_pgtable_free(dev->pci, &buf->pt[2]);
+	return ret;
 }
 
-static int buffer_setup(struct videobuf_queue *q, unsigned int *count, unsigned int *size)
+static int buf_prepare(struct vb2_buffer *vb)
 {
-	int llength,lines;
-
-	lines   = 16 * 2 ; /* 2 fields */
-	llength = vbi_pixel_to_capture;
-
-	*size = lines * llength;
-	*count = 2;
-
-	DEB_VBI("count:%d, size:%d\n", *count, *size);
+	unsigned int size = 16 * 2 * vbi_pixel_to_capture;
 
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+	vb2_set_plane_payload(vb, 0, size);
 	return 0;
 }
 
-static void buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void buf_cleanup(struct vb2_buffer *vb)
 {
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_vv *vv = dev->vv_data;
-	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
 
-	DEB_VBI("vb:%p\n", vb);
-	saa7146_buffer_queue(dev, &vv->vbi_dmaq, buf);
+	saa7146_pgtable_free(dev->pci, &buf->pt[2]);
 }
 
-static void buffer_release(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void return_buffers(struct vb2_queue *q, int state)
 {
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
-
-	DEB_VBI("vb:%p\n", vb);
-	saa7146_dma_free(dev,q,buf);
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+	struct saa7146_dmaqueue *dq = &dev->vv_data->vbi_dmaq;
+	struct saa7146_buf *buf;
+
+	if (dq->curr) {
+		buf = dq->curr;
+		dq->curr = NULL;
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	while (!list_empty(&dq->queue)) {
+		buf = list_entry(dq->queue.next, struct saa7146_buf, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
 }
 
-static const struct videobuf_queue_ops vbi_qops = {
-	.buf_setup    = buffer_setup,
-	.buf_prepare  = buffer_prepare,
-	.buf_queue    = buffer_queue,
-	.buf_release  = buffer_release,
-};
-
-/* ------------------------------------------------------------------ */
-
-static void vbi_stop(struct saa7146_fh *fh, struct file *file)
+static void vbi_stop(struct saa7146_dev *dev)
 {
-	struct saa7146_dev *dev = video_drvdata(file);
 	struct saa7146_vv *vv = dev->vv_data;
 	unsigned long flags;
-	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
+	DEB_VBI("dev:%p\n", dev);
 
 	spin_lock_irqsave(&dev->slock,flags);
 
@@ -334,11 +323,7 @@ static void vbi_stop(struct saa7146_fh *fh, struct file *file)
 	saa7146_write(dev, MC1, MASK_20);
 
 	if (vv->vbi_dmaq.curr)
-		saa7146_buffer_finish(dev, &vv->vbi_dmaq, VIDEOBUF_DONE);
-
-	videobuf_queue_cancel(&fh->vbi_q);
-
-	vv->vbi_streaming = NULL;
+		saa7146_buffer_finish(dev, &vv->vbi_dmaq, VB2_BUF_STATE_DONE);
 
 	del_timer(&vv->vbi_dmaq.timeout);
 	del_timer(&vv->vbi_read_timeout);
@@ -349,36 +334,20 @@ static void vbi_stop(struct saa7146_fh *fh, struct file *file)
 static void vbi_read_timeout(struct timer_list *t)
 {
 	struct saa7146_vv *vv = from_timer(vv, t, vbi_read_timeout);
-	struct file *file = vv->vbi_read_timeout_file;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = file->private_data;
-
-	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
+	struct saa7146_dev *dev = vv->vbi_dmaq.dev;
 
-	vbi_stop(fh, file);
-}
-
-static void vbi_init(struct saa7146_dev *dev, struct saa7146_vv *vv)
-{
 	DEB_VBI("dev:%p\n", dev);
 
-	INIT_LIST_HEAD(&vv->vbi_dmaq.queue);
-
-	timer_setup(&vv->vbi_dmaq.timeout, saa7146_buffer_timeout, 0);
-	vv->vbi_dmaq.dev              = dev;
-
-	init_waitqueue_head(&vv->vbi_wq);
+	vbi_stop(dev);
 }
 
-static int vbi_open(struct saa7146_dev *dev, struct file *file)
+static int vbi_begin(struct saa7146_dev *dev)
 {
-	struct saa7146_fh *fh = file->private_data;
 	struct saa7146_vv *vv = dev->vv_data;
-
 	u32 arbtr_ctrl	= saa7146_read(dev, PCI_BT_V1);
 	int ret = 0;
 
-	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
+	DEB_VBI("dev:%p\n", dev);
 
 	ret = saa7146_res_get(dev, RESOURCE_DMA3_BRS);
 	if (0 == ret) {
@@ -392,15 +361,7 @@ static int vbi_open(struct saa7146_dev *dev, struct file *file)
 	saa7146_write(dev, PCI_BT_V1, arbtr_ctrl);
 	saa7146_write(dev, MC2, (MASK_04|MASK_20));
 
-	videobuf_queue_sg_init(&fh->vbi_q, &vbi_qops,
-			    &dev->pci->dev, &dev->slock,
-			    V4L2_BUF_TYPE_VBI_CAPTURE,
-			    V4L2_FIELD_SEQ_TB, // FIXME: does this really work?
-			    sizeof(struct saa7146_buf),
-			    file, &dev->v4l2_lock);
-
 	vv->vbi_read_timeout.function = vbi_read_timeout;
-	vv->vbi_read_timeout_file = file;
 
 	/* initialize the brs */
 	if ( 0 != (SAA7146_USE_PORT_B_FOR_VBI & dev->ext_vv_data->flags)) {
@@ -419,18 +380,54 @@ static int vbi_open(struct saa7146_dev *dev, struct file *file)
 	return 0;
 }
 
-static void vbi_close(struct saa7146_dev *dev, struct file *file)
+static int start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_vv *vv = dev->vv_data;
-	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+	int ret;
+
+	if (!vb2_is_streaming(&dev->vv_data->vbi_dmaq.q))
+		dev->vv_data->seqnr = 0;
+	ret = vbi_begin(dev);
+	if (ret)
+		return_buffers(q, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
 
-	if( fh == vv->vbi_streaming ) {
-		vbi_stop(fh, file);
-	}
+static void stop_streaming(struct vb2_queue *q)
+{
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+
+	vbi_stop(dev);
+	return_buffers(q, VB2_BUF_STATE_ERROR);
 	saa7146_res_free(dev, RESOURCE_DMA3_BRS);
 }
 
+const struct vb2_ops vbi_qops = {
+	.queue_setup	= queue_setup,
+	.buf_queue	= buf_queue,
+	.buf_init	= buf_init,
+	.buf_prepare	= buf_prepare,
+	.buf_cleanup	= buf_cleanup,
+	.start_streaming = start_streaming,
+	.stop_streaming = stop_streaming,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
+};
+
+/* ------------------------------------------------------------------ */
+
+static void vbi_init(struct saa7146_dev *dev, struct saa7146_vv *vv)
+{
+	DEB_VBI("dev:%p\n", dev);
+
+	INIT_LIST_HEAD(&vv->vbi_dmaq.queue);
+
+	timer_setup(&vv->vbi_dmaq.timeout, saa7146_buffer_timeout, 0);
+	vv->vbi_dmaq.dev              = dev;
+
+	init_waitqueue_head(&vv->vbi_wq);
+}
+
 static void vbi_irq_done(struct saa7146_dev *dev, unsigned long status)
 {
 	struct saa7146_vv *vv = dev->vv_data;
@@ -438,10 +435,7 @@ static void vbi_irq_done(struct saa7146_dev *dev, unsigned long status)
 
 	if (vv->vbi_dmaq.curr) {
 		DEB_VBI("dev:%p, curr:%p\n", dev, vv->vbi_dmaq.curr);
-		/* this must be += 2, one count for each field */
-		vv->vbi_fieldcount+=2;
-		vv->vbi_dmaq.curr->vb.field_count = vv->vbi_fieldcount;
-		saa7146_buffer_finish(dev, &vv->vbi_dmaq, VIDEOBUF_DONE);
+		saa7146_buffer_finish(dev, &vv->vbi_dmaq, VB2_BUF_STATE_DONE);
 	} else {
 		DEB_VBI("dev:%p\n", dev);
 	}
@@ -450,46 +444,7 @@ static void vbi_irq_done(struct saa7146_dev *dev, unsigned long status)
 	spin_unlock(&dev->slock);
 }
 
-static ssize_t vbi_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
-{
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_vv *vv = dev->vv_data;
-	ssize_t ret = 0;
-
-	DEB_VBI("dev:%p, fh:%p\n", dev, fh);
-
-	if( NULL == vv->vbi_streaming ) {
-		// fixme: check if dma3 is available
-		// fixme: activate vbi engine here if necessary. (really?)
-		vv->vbi_streaming = fh;
-	}
-
-	if( fh != vv->vbi_streaming ) {
-		DEB_VBI("open %p is already using vbi capture\n",
-			vv->vbi_streaming);
-		return -EBUSY;
-	}
-
-	mod_timer(&vv->vbi_read_timeout, jiffies+BUFFER_TIMEOUT);
-	ret = videobuf_read_stream(&fh->vbi_q, data, count, ppos, 1,
-				   file->f_flags & O_NONBLOCK);
-/*
-	printk("BASE_ODD3:      0x%08x\n", saa7146_read(dev, BASE_ODD3));
-	printk("BASE_EVEN3:     0x%08x\n", saa7146_read(dev, BASE_EVEN3));
-	printk("PROT_ADDR3:     0x%08x\n", saa7146_read(dev, PROT_ADDR3));
-	printk("PITCH3:         0x%08x\n", saa7146_read(dev, PITCH3));
-	printk("BASE_PAGE3:     0x%08x\n", saa7146_read(dev, BASE_PAGE3));
-	printk("NUM_LINE_BYTE3: 0x%08x\n", saa7146_read(dev, NUM_LINE_BYTE3));
-	printk("BRS_CTRL:       0x%08x\n", saa7146_read(dev, BRS_CTRL));
-*/
-	return ret;
-}
-
 const struct saa7146_use_ops saa7146_vbi_uops = {
 	.init		= vbi_init,
-	.open		= vbi_open,
-	.release	= vbi_close,
 	.irq_done	= vbi_irq_done,
-	.read		= vbi_read,
 };
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 6af30fece176..290f388c2f28 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -11,9 +11,6 @@ static int max_memory = 32;
 module_param(max_memory, int, 0644);
 MODULE_PARM_DESC(max_memory, "maximum memory usage for capture buffers (default: 32Mb)");
 
-#define IS_CAPTURE_ACTIVE(fh) \
-	(((vv->video_status & STATUS_CAPTURE) != 0) && (vv->video_fh == fh))
-
 /* format descriptions for capture and preview */
 static struct saa7146_format formats[] = {
 	{
@@ -95,9 +92,9 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 {
 	struct saa7146_vv *vv = dev->vv_data;
 	struct pci_dev *pci = dev->pci;
-	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
-	struct scatterlist *list = dma->sglist;
-	int length = dma->sglen;
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0);
+	struct scatterlist *list = sgt->sgl;
+	int length = sgt->nents;
 	struct v4l2_pix_format *pix = &vv->video_fmt;
 	struct saa7146_format *sfmt = saa7146_format_by_fourcc(dev, pix->pixelformat);
 
@@ -151,7 +148,7 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 
 		/* if we have a user buffer, the first page may not be
 		   aligned to a page boundary. */
-		pt1->offset = dma->sglist->offset;
+		pt1->offset = sgt->sgl->offset;
 		pt2->offset = pt1->offset + o1;
 		pt3->offset = pt1->offset + o2;
 
@@ -187,23 +184,14 @@ static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *bu
 /********************************************************************************/
 /* file operations */
 
-static int video_begin(struct saa7146_dev *dev, struct saa7146_fh *fh)
+static int video_begin(struct saa7146_dev *dev)
 {
 	struct saa7146_vv *vv = dev->vv_data;
 	struct saa7146_format *fmt = NULL;
 	unsigned int resource;
 	int ret = 0;
 
-	DEB_EE("dev:%p, fh:%p\n", dev, fh);
-
-	if ((vv->video_status & STATUS_CAPTURE) != 0) {
-		if (vv->video_fh == fh) {
-			DEB_S("already capturing\n");
-			return 0;
-		}
-		DEB_S("already capturing in another open\n");
-		return -EBUSY;
-	}
+	DEB_EE("dev:%p\n", dev);
 
 	fmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
 	/* we need to have a valid format set here */
@@ -228,36 +216,22 @@ static int video_begin(struct saa7146_dev *dev, struct saa7146_fh *fh)
 	/* enable rps0 irqs */
 	SAA7146_IER_ENABLE(dev, MASK_27);
 
-	vv->video_fh = fh;
-	vv->video_status = STATUS_CAPTURE;
-
 	return 0;
 }
 
-static int video_end(struct saa7146_dev *dev, struct saa7146_fh *fh)
+static void video_end(struct saa7146_dev *dev)
 {
 	struct saa7146_vv *vv = dev->vv_data;
-	struct saa7146_dmaqueue *q = &vv->video_dmaq;
 	struct saa7146_format *fmt = NULL;
 	unsigned long flags;
 	unsigned int resource;
 	u32 dmas = 0;
-	DEB_EE("dev:%p, fh:%p\n", dev, fh);
-
-	if ((vv->video_status & STATUS_CAPTURE) != STATUS_CAPTURE) {
-		DEB_S("not capturing\n");
-		return 0;
-	}
-
-	if (vv->video_fh != fh) {
-		DEB_S("capturing, but in another open\n");
-		return -EBUSY;
-	}
+	DEB_EE("dev:%p\n", dev);
 
 	fmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
 	/* we need to have a valid format set here */
 	if (!fmt)
-		return -EINVAL;
+		return;
 
 	if (0 != (fmt->flags & FORMAT_IS_PLANAR)) {
 		resource = RESOURCE_DMA1_HPS|RESOURCE_DMA2_CLP|RESOURCE_DMA3_BRS;
@@ -277,17 +251,9 @@ static int video_end(struct saa7146_dev *dev, struct saa7146_fh *fh)
 	/* shut down all used video dma transfers */
 	saa7146_write(dev, MC1, dmas);
 
-	if (q->curr)
-		saa7146_buffer_finish(dev, q, VIDEOBUF_DONE);
-
 	spin_unlock_irqrestore(&dev->slock, flags);
 
-	vv->video_fh = NULL;
-	vv->video_status = 0;
-
 	saa7146_res_free(dev, resource);
-
-	return 0;
 }
 
 static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -345,13 +311,13 @@ int saa7146_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_HFLIP:
 		/* fixme: we can support changing VFLIP and HFLIP here... */
-		if ((vv->video_status & STATUS_CAPTURE))
+		if (vb2_is_busy(&vv->video_dmaq.q))
 			return -EBUSY;
 		vv->hflip = ctrl->val;
 		break;
 
 	case V4L2_CID_VFLIP:
-		if ((vv->video_status & STATUS_CAPTURE))
+		if (vb2_is_busy(&vv->video_dmaq.q))
 			return -EBUSY;
 		vv->vflip = ctrl->val;
 		break;
@@ -459,15 +425,14 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format *f)
+static int vidioc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = __fh;
 	struct saa7146_vv *vv = dev->vv_data;
 	int err;
 
-	DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: dev:%p, fh:%p\n", dev, fh);
-	if (IS_CAPTURE_ACTIVE(fh) != 0) {
+	DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: dev:%p\n", dev);
+	if (vb2_is_busy(&vv->video_dmaq.q)) {
 		DEB_EE("streaming capture is active\n");
 		return -EBUSY;
 	}
@@ -489,24 +454,6 @@ static int vidioc_g_std(struct file *file, void *fh, v4l2_std_id *norm)
 	return 0;
 }
 
-	/* the saa7146 supfhrts (used in conjunction with the saa7111a for example)
-	   PAL / NTSC / SECAM. if your hardware does not (or does more)
-	   -- override this function in your extension */
-/*
-	case VIDIOC_ENUMSTD:
-	{
-		struct v4l2_standard *e = arg;
-		if (e->index < 0 )
-			return -EINVAL;
-		if( e->index < dev->ext_vv_data->num_stds ) {
-			DEB_EE("VIDIOC_ENUMSTD: index:%d\n", e->index);
-			v4l2_video_std_construct(e, dev->ext_vv_data->stds[e->index].id, dev->ext_vv_data->stds[e->index].name);
-			return 0;
-		}
-		return -EINVAL;
-	}
-	*/
-
 static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
@@ -516,7 +463,7 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 
 	DEB_EE("VIDIOC_S_STD\n");
 
-	if ((vv->video_status & STATUS_CAPTURE) == STATUS_CAPTURE) {
+	if (vb2_is_busy(&vv->video_dmaq.q) || vb2_is_busy(&vv->vbi_dmaq.q)) {
 		DEB_D("cannot change video standard while streaming capture is active\n");
 		return -EBUSY;
 	}
@@ -540,120 +487,22 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 	return 0;
 }
 
-static int vidioc_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffers *b)
-{
-	struct saa7146_fh *fh = __fh;
-
-	if (b->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return videobuf_reqbufs(&fh->video_q, b);
-	if (b->type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		return videobuf_reqbufs(&fh->vbi_q, b);
-	return -EINVAL;
-}
-
-static int vidioc_querybuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
-{
-	struct saa7146_fh *fh = __fh;
-
-	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return videobuf_querybuf(&fh->video_q, buf);
-	if (buf->type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		return videobuf_querybuf(&fh->vbi_q, buf);
-	return -EINVAL;
-}
-
-static int vidioc_qbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
-{
-	struct saa7146_fh *fh = __fh;
-
-	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return videobuf_qbuf(&fh->video_q, buf);
-	if (buf->type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		return videobuf_qbuf(&fh->vbi_q, buf);
-	return -EINVAL;
-}
-
-static int vidioc_dqbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
-{
-	struct saa7146_fh *fh = __fh;
-
-	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return videobuf_dqbuf(&fh->video_q, buf, file->f_flags & O_NONBLOCK);
-	if (buf->type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		return videobuf_dqbuf(&fh->vbi_q, buf, file->f_flags & O_NONBLOCK);
-	return -EINVAL;
-}
-
-static int vidioc_streamon(struct file *file, void *__fh, enum v4l2_buf_type type)
-{
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = __fh;
-	int err;
-
-	DEB_D("VIDIOC_STREAMON, type:%d\n", type);
-
-	err = video_begin(dev, fh);
-	if (err)
-		return err;
-	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return videobuf_streamon(&fh->video_q);
-	if (type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		return videobuf_streamon(&fh->vbi_q);
-	return -EINVAL;
-}
-
-static int vidioc_streamoff(struct file *file, void *__fh, enum v4l2_buf_type type)
-{
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = __fh;
-	struct saa7146_vv *vv = dev->vv_data;
-	int err;
-
-	DEB_D("VIDIOC_STREAMOFF, type:%d\n", type);
-
-	/* ugly: we need to copy some checks from video_end(),
-	   because videobuf_streamoff() relies on the capture running.
-	   check and fix this */
-	if ((vv->video_status & STATUS_CAPTURE) != STATUS_CAPTURE) {
-		DEB_S("not capturing\n");
-		return 0;
-	}
-
-	if (vv->video_fh != fh) {
-		DEB_S("capturing, but in another open\n");
-		return -EBUSY;
-	}
-
-	err = -EINVAL;
-	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		err = videobuf_streamoff(&fh->video_q);
-	else if (type == V4L2_BUF_TYPE_VBI_CAPTURE)
-		err = videobuf_streamoff(&fh->vbi_q);
-	if (0 != err) {
-		DEB_D("warning: videobuf_streamoff() failed\n");
-		video_end(dev, fh);
-	} else {
-		err = video_end(dev, fh);
-	}
-	return err;
-}
-
 const struct v4l2_ioctl_ops saa7146_video_ioctl_ops = {
 	.vidioc_querycap             = vidioc_querycap,
 	.vidioc_enum_fmt_vid_cap     = vidioc_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap        = vidioc_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap      = vidioc_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap        = vidioc_s_fmt_vid_cap,
-
-	.vidioc_reqbufs              = vidioc_reqbufs,
-	.vidioc_querybuf             = vidioc_querybuf,
-	.vidioc_qbuf                 = vidioc_qbuf,
-	.vidioc_dqbuf                = vidioc_dqbuf,
 	.vidioc_g_std                = vidioc_g_std,
 	.vidioc_s_std                = vidioc_s_std,
-	.vidioc_streamon             = vidioc_streamon,
-	.vidioc_streamoff            = vidioc_streamoff,
 	.vidioc_g_parm		     = vidioc_g_parm,
+	.vidioc_reqbufs		     = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs	     = vb2_ioctl_create_bufs,
+	.vidioc_querybuf	     = vb2_ioctl_querybuf,
+	.vidioc_qbuf		     = vb2_ioctl_qbuf,
+	.vidioc_dqbuf		     = vb2_ioctl_dqbuf,
+	.vidioc_streamon	     = vb2_ioctl_streamon,
+	.vidioc_streamoff	     = vb2_ioctl_streamoff,
 	.vidioc_subscribe_event      = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event    = v4l2_event_unsubscribe,
 };
@@ -661,16 +510,17 @@ const struct v4l2_ioctl_ops saa7146_video_ioctl_ops = {
 const struct v4l2_ioctl_ops saa7146_vbi_ioctl_ops = {
 	.vidioc_querycap             = vidioc_querycap,
 	.vidioc_g_fmt_vbi_cap        = vidioc_g_fmt_vbi_cap,
-
-	.vidioc_reqbufs              = vidioc_reqbufs,
-	.vidioc_querybuf             = vidioc_querybuf,
-	.vidioc_qbuf                 = vidioc_qbuf,
-	.vidioc_dqbuf                = vidioc_dqbuf,
+	.vidioc_s_fmt_vbi_cap        = vidioc_g_fmt_vbi_cap,
 	.vidioc_g_std                = vidioc_g_std,
 	.vidioc_s_std                = vidioc_s_std,
-	.vidioc_streamon             = vidioc_streamon,
-	.vidioc_streamoff            = vidioc_streamoff,
 	.vidioc_g_parm		     = vidioc_g_parm,
+	.vidioc_reqbufs		     = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs	     = vb2_ioctl_create_bufs,
+	.vidioc_querybuf	     = vb2_ioctl_querybuf,
+	.vidioc_qbuf		     = vb2_ioctl_qbuf,
+	.vidioc_dqbuf		     = vb2_ioctl_dqbuf,
+	.vidioc_streamon	     = vb2_ioctl_streamon,
+	.vidioc_streamoff	     = vb2_ioctl_streamoff,
 	.vidioc_subscribe_event      = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event    = v4l2_event_unsubscribe,
 };
@@ -684,7 +534,6 @@ static int buffer_activate (struct saa7146_dev *dev,
 {
 	struct saa7146_vv *vv = dev->vv_data;
 
-	buf->vb.state = VIDEOBUF_ACTIVE;
 	saa7146_set_capture(dev,buf,next);
 
 	mod_timer(&vv->video_dmaq.timeout, jiffies+BUFFER_TIMEOUT);
@@ -698,135 +547,136 @@ static void release_all_pagetables(struct saa7146_dev *dev, struct saa7146_buf *
 	saa7146_pgtable_free(dev->pci, &buf->pt[2]);
 }
 
-static int buffer_prepare(struct videobuf_queue *q,
-			  struct videobuf_buffer *vb, enum v4l2_field field)
+static int queue_setup(struct vb2_queue *q,
+		       unsigned int *num_buffers, unsigned int *num_planes,
+		       unsigned int sizes[], struct device *alloc_devs[])
 {
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_vv *vv = dev->vv_data;
-	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
-	int size,err = 0;
-
-	DEB_CAP("vbuf:%p\n", vb);
-
-	/* sanity checks */
-	if (vv->video_fmt.width  < 48 ||
-	    vv->video_fmt.height < 32 ||
-	    vv->video_fmt.width  > vv->standard->h_max_out ||
-	    vv->video_fmt.height > vv->standard->v_max_out) {
-		DEB_D("w (%d) / h (%d) out of bounds\n",
-		      vv->video_fmt.width, vv->video_fmt.height);
-		return -EINVAL;
-	}
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+	unsigned size = dev->vv_data->video_fmt.sizeimage;
 
-	size = vv->video_fmt.sizeimage;
-	if (0 != buf->vb.baddr && buf->vb.bsize < size) {
-		DEB_D("size mismatch\n");
-		return -EINVAL;
-	}
+	if (*num_planes)
+		return sizes[0] < size ? -EINVAL : 0;
+	*num_planes = 1;
+	sizes[0] = size;
 
-	DEB_CAP("buffer_prepare [size=%dx%d,bytes=%d,fields=%s]\n",
-		vv->video_fmt.width, vv->video_fmt.height,
-		size, v4l2_field_names[vv->video_fmt.field]);
-	if (buf->vb.width  != vv->video_fmt.width  ||
-	    buf->vb.bytesperline != vv->video_fmt.bytesperline ||
-	    buf->vb.height != vv->video_fmt.height ||
-	    buf->vb.size   != size ||
-	    buf->vb.field  != field      ||
-	    buf->vb.field  != vv->video_fmt.field) {
-		saa7146_dma_free(dev,q,buf);
-	}
+	return 0;
+}
 
-	if (VIDEOBUF_NEEDS_INIT == buf->vb.state) {
-		struct saa7146_format *sfmt;
+static void buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
+	struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
+	unsigned long flags;
 
-		buf->vb.bytesperline  = vv->video_fmt.bytesperline;
-		buf->vb.width  = vv->video_fmt.width;
-		buf->vb.height = vv->video_fmt.height;
-		buf->vb.size   = size;
-		buf->vb.field  = field;
-		buf->vb.field  = vv->video_fmt.field;
+	spin_lock_irqsave(&dev->slock, flags);
 
-		sfmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
+	saa7146_buffer_queue(dev, &dev->vv_data->video_dmaq, buf);
+	spin_unlock_irqrestore(&dev->slock, flags);
+}
 
-		release_all_pagetables(dev, buf);
-		if( 0 != IS_PLANAR(sfmt->trans)) {
-			saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
-			saa7146_pgtable_alloc(dev->pci, &buf->pt[1]);
-			saa7146_pgtable_alloc(dev->pci, &buf->pt[2]);
-		} else {
-			saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
-		}
+static int buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
+	struct saa7146_vv *vv = dev->vv_data;
+	struct saa7146_format *sfmt;
+	int ret;
 
-		err = videobuf_iolock(q, &buf->vb, NULL);
-		if (err)
-			goto oops;
-		err = saa7146_pgtable_build(dev,buf);
-		if (err)
-			goto oops;
-	}
-	buf->vb.state = VIDEOBUF_PREPARED;
 	buf->activate = buffer_activate;
+	sfmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
 
-	return 0;
-
- oops:
-	DEB_D("error out\n");
-	saa7146_dma_free(dev,q,buf);
+	if (IS_PLANAR(sfmt->trans)) {
+		saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
+		saa7146_pgtable_alloc(dev->pci, &buf->pt[1]);
+		saa7146_pgtable_alloc(dev->pci, &buf->pt[2]);
+	} else {
+		saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
+	}
 
-	return err;
+	ret = saa7146_pgtable_build(dev,buf);
+	if (ret)
+		release_all_pagetables(dev, buf);
+	return ret;
 }
 
-static int buffer_setup(struct videobuf_queue *q, unsigned int *count, unsigned int *size)
+static int buf_prepare(struct vb2_buffer *vb)
 {
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
 	struct saa7146_vv *vv = dev->vv_data;
+	unsigned int size = vv->video_fmt.sizeimage;
 
-	if (0 == *count || *count > MAX_SAA7146_CAPTURE_BUFFERS)
-		*count = MAX_SAA7146_CAPTURE_BUFFERS;
-
-	*size = vv->video_fmt.sizeimage;
-
-	/* check if we exceed the "max_memory" parameter */
-	if( (*count * *size) > (max_memory*1048576) ) {
-		*count = (max_memory*1048576) / *size;
-	}
-
-	DEB_CAP("%d buffers, %d bytes each\n", *count, *size);
-
+	if (vb2_plane_size(vb, 0) < size)
+		return -EINVAL;
+	vb2_set_plane_payload(vb, 0, size);
 	return 0;
 }
 
-static void buffer_queue(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void buf_cleanup(struct vb2_buffer *vb)
 {
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_vv *vv = dev->vv_data;
-	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct saa7146_dev *dev = vb2_get_drv_priv(vq);
 
-	DEB_CAP("vbuf:%p\n", vb);
-	saa7146_buffer_queue(dev, &vv->video_dmaq, buf);
+	release_all_pagetables(dev, buf);
 }
 
-static void buffer_release(struct videobuf_queue *q, struct videobuf_buffer *vb)
+static void return_buffers(struct vb2_queue *q, int state)
 {
-	struct file *file = q->priv_data;
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_buf *buf = (struct saa7146_buf *)vb;
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+	struct saa7146_dmaqueue *dq = &dev->vv_data->video_dmaq;
+	struct saa7146_buf *buf;
+
+	if (dq->curr) {
+		buf = dq->curr;
+		dq->curr = NULL;
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	while (!list_empty(&dq->queue)) {
+		buf = list_entry(dq->queue.next, struct saa7146_buf, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
 
-	DEB_CAP("vbuf:%p\n", vb);
+static int start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+	int ret;
+
+	if (!vb2_is_streaming(&dev->vv_data->video_dmaq.q))
+		dev->vv_data->seqnr = 0;
+	ret = video_begin(dev);
+	if (ret)
+		return_buffers(q, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
 
-	saa7146_dma_free(dev,q,buf);
+static void stop_streaming(struct vb2_queue *q)
+{
+	struct saa7146_dev *dev = vb2_get_drv_priv(q);
+	struct saa7146_dmaqueue *dq = &dev->vv_data->video_dmaq;
 
-	release_all_pagetables(dev, buf);
+	del_timer(&dq->timeout);
+	video_end(dev);
+	return_buffers(q, VB2_BUF_STATE_ERROR);
 }
 
-static const struct videobuf_queue_ops video_qops = {
-	.buf_setup    = buffer_setup,
-	.buf_prepare  = buffer_prepare,
-	.buf_queue    = buffer_queue,
-	.buf_release  = buffer_release,
+const struct vb2_ops video_qops = {
+	.queue_setup	= queue_setup,
+	.buf_queue	= buf_queue,
+	.buf_init	= buf_init,
+	.buf_prepare	= buf_prepare,
+	.buf_cleanup	= buf_cleanup,
+	.start_streaming = start_streaming,
+	.stop_streaming = stop_streaming,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
 };
 
 /********************************************************************************/
@@ -847,36 +697,6 @@ static void video_init(struct saa7146_dev *dev, struct saa7146_vv *vv)
 	vv->current_hps_sync = SAA7146_HPS_SYNC_PORT_A;
 }
 
-
-static int video_open(struct saa7146_dev *dev, struct file *file)
-{
-	struct saa7146_fh *fh = file->private_data;
-
-	videobuf_queue_sg_init(&fh->video_q, &video_qops,
-			    &dev->pci->dev, &dev->slock,
-			    V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			    V4L2_FIELD_INTERLACED,
-			    sizeof(struct saa7146_buf),
-			    file, &dev->v4l2_lock);
-
-	return 0;
-}
-
-
-static void video_close(struct saa7146_dev *dev, struct file *file)
-{
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_vv *vv = dev->vv_data;
-	struct videobuf_queue *q = &fh->video_q;
-
-	if (IS_CAPTURE_ACTIVE(fh) != 0)
-		video_end(dev, fh);
-
-	videobuf_stop(q);
-	/* hmm, why is this function declared void? */
-}
-
-
 static void video_irq_done(struct saa7146_dev *dev, unsigned long st)
 {
 	struct saa7146_vv *vv = dev->vv_data;
@@ -886,53 +706,15 @@ static void video_irq_done(struct saa7146_dev *dev, unsigned long st)
 	DEB_CAP("called\n");
 
 	/* only finish the buffer if we have one... */
-	if( NULL != q->curr ) {
-		saa7146_buffer_finish(dev,q,VIDEOBUF_DONE);
+	if (q->curr) {
+		saa7146_buffer_finish(dev, q, VB2_BUF_STATE_DONE);
 	}
 	saa7146_buffer_next(dev,q,0);
 
 	spin_unlock(&dev->slock);
 }
 
-static ssize_t video_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
-{
-	struct saa7146_dev *dev = video_drvdata(file);
-	struct saa7146_fh *fh = file->private_data;
-	struct saa7146_vv *vv = dev->vv_data;
-	ssize_t ret = 0;
-
-	DEB_EE("called\n");
-
-	if ((vv->video_status & STATUS_CAPTURE) != 0) {
-		/* fixme: should we allow read() captures while streaming capture? */
-		if (vv->video_fh == fh) {
-			DEB_S("already capturing\n");
-			return -EBUSY;
-		}
-		DEB_S("already capturing in another open\n");
-		return -EBUSY;
-	}
-
-	ret = video_begin(dev, fh);
-	if( 0 != ret) {
-		goto out;
-	}
-
-	ret = videobuf_read_one(&fh->video_q , data, count, ppos,
-				file->f_flags & O_NONBLOCK);
-	if (ret != 0) {
-		video_end(dev, fh);
-	} else {
-		ret = video_end(dev, fh);
-	}
-out:
-	return ret;
-}
-
 const struct saa7146_use_ops saa7146_video_uops = {
 	.init = video_init,
-	.open = video_open,
-	.release = video_close,
 	.irq_done = video_irq_done,
-	.read = video_read,
 };
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index f518ad8c92ed..557ba89cd12d 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -587,7 +587,6 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
-	struct saa7146_vv *vv = dev->vv_data;
 
 	if (f->tuner)
 		return -EINVAL;
@@ -604,15 +603,6 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 	tuner_call(mxb, tuner, g_frequency, &mxb->cur_freq);
 	if (mxb->cur_audinput == 0)
 		mxb_update_audmode(mxb);
-
-	if (mxb->cur_input)
-		return 0;
-
-	/* hack: changing the frequency should invalidate the vbi-counter (=> alevt) */
-	spin_lock(&dev->slock);
-	vv->vbi_fieldcount = 0;
-	spin_unlock(&dev->slock);
-
 	return 0;
 }
 
diff --git a/include/media/drv-intf/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
index 80463fdd30eb..f31aaf156be3 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -6,7 +6,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-fh.h>
 #include <media/drv-intf/saa7146.h>
-#include <media/videobuf-dma-sg.h>
+#include <media/videobuf2-dma-sg.h>
 
 #define MAX_SAA7146_CAPTURE_BUFFERS	32	/* arbitrary */
 #define BUFFER_TIMEOUT     (HZ/2)  /* 0.5 seconds */
@@ -57,7 +57,8 @@ struct saa7146_standard
 /* buffer for one video/vbi frame */
 struct saa7146_buf {
 	/* common v4l buffer stuff -- must be first */
-	struct videobuf_buffer vb;
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
 
 	/* saa7146 specific */
 	int (*activate)(struct saa7146_dev *dev,
@@ -73,41 +74,29 @@ struct saa7146_dmaqueue {
 	struct saa7146_buf	*curr;
 	struct list_head	queue;
 	struct timer_list	timeout;
+	struct vb2_queue	q;
 };
 
 /* per open data */
 struct saa7146_fh {
 	/* Must be the first field! */
 	struct v4l2_fh		fh;
-
-	/* video capture */
-	struct videobuf_queue	video_q;
-
-	/* vbi capture */
-	struct videobuf_queue	vbi_q;
 };
 
-#define STATUS_CAPTURE	0x02
-
 struct saa7146_vv
 {
 	/* vbi capture */
 	struct saa7146_dmaqueue		vbi_dmaq;
 	struct v4l2_vbi_format		vbi_fmt;
 	struct timer_list		vbi_read_timeout;
-	struct file			*vbi_read_timeout_file;
 	/* vbi workaround interrupt queue */
 	wait_queue_head_t		vbi_wq;
-	int				vbi_fieldcount;
-	struct saa7146_fh		*vbi_streaming;
-
-	int				video_status;
-	struct saa7146_fh		*video_fh;
 
 	/* video capture */
 	struct saa7146_dmaqueue		video_dmaq;
 	struct v4l2_pix_format		video_fmt;
 	enum v4l2_field			last_field;
+	u32				seqnr;
 
 	/* common: fixme? shouldn't this be in saa7146_fh?
 	   (this leads to a more complicated question: shall the driver
@@ -122,7 +111,7 @@ struct saa7146_vv
 	int	current_hps_source;
 	int	current_hps_sync;
 
-	unsigned int resources;	/* resource management for device */
+	unsigned int resources; /* resource management for device */
 };
 
 /* flags */
@@ -152,10 +141,7 @@ struct saa7146_ext_vv
 
 struct saa7146_use_ops  {
 	void (*init)(struct saa7146_dev *, struct saa7146_vv *);
-	int(*open)(struct saa7146_dev *, struct file *);
-	void (*release)(struct saa7146_dev *, struct file *);
 	void (*irq_done)(struct saa7146_dev *, unsigned long status);
-	ssize_t (*read)(struct file *, char __user *, size_t, loff_t *);
 };
 
 /* from saa7146_fops.c */
@@ -165,8 +151,6 @@ void saa7146_buffer_finish(struct saa7146_dev *dev, struct saa7146_dmaqueue *q,
 void saa7146_buffer_next(struct saa7146_dev *dev, struct saa7146_dmaqueue *q,int vbi);
 int saa7146_buffer_queue(struct saa7146_dev *dev, struct saa7146_dmaqueue *q, struct saa7146_buf *buf);
 void saa7146_buffer_timeout(struct timer_list *t);
-void saa7146_dma_free(struct saa7146_dev* dev,struct videobuf_queue *q,
-						struct saa7146_buf *buf);
 
 int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv);
 int saa7146_vv_release(struct saa7146_dev* dev);
@@ -181,11 +165,13 @@ void saa7146_set_gpio(struct saa7146_dev *saa, u8 pin, u8 data);
 extern const struct v4l2_ioctl_ops saa7146_video_ioctl_ops;
 extern const struct v4l2_ioctl_ops saa7146_vbi_ioctl_ops;
 extern const struct saa7146_use_ops saa7146_video_uops;
+extern const struct vb2_ops video_qops;
 long saa7146_video_do_ioctl(struct file *file, unsigned int cmd, void *arg);
 int saa7146_s_ctrl(struct v4l2_ctrl *ctrl);
 
 /* from saa7146_vbi.c */
 extern const struct saa7146_use_ops saa7146_vbi_uops;
+extern const struct vb2_ops vbi_qops;
 
 /* resource management functions */
 int saa7146_res_get(struct saa7146_dev *dev, unsigned int bit);
-- 
2.39.1

