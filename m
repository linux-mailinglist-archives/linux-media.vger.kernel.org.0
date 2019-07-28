Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D98A77FE6
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 16:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfG1Onx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jul 2019 10:43:53 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45615 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbfG1Onx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jul 2019 10:43:53 -0400
Received: from [IPv6:2001:983:e9a7:1:e485:2aba:cb7a:ed84] ([IPv6:2001:983:e9a7:1:e485:2aba:cb7a:ed84])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rkOjhxDJVqTdhrkOkhdeuT; Sun, 28 Jul 2019 16:43:49 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] via-camera: convert to the vb2 framework
Message-ID: <fd85a837-5c24-d539-47d4-cb8c47f358e8@xs4all.nl>
Date:   Sun, 28 Jul 2019 16:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIs+fDh6I/cmPhilkedFOrj9Zb4IK5zD+/SbrzwovQrJ/pFTx/Q4QMIxVaioBWEcHf0S4dSzTA/5QFWv8GRpB74T9YHUO/uBawm2kW1oFRBWg7WYcLpK
 dSEvkJWFSytmRksZ7MdgNidivkvGaTZfBVpugY5HUKjmpg4LG4guiUDITWB9fi324TEP0CAXv2uCG5UYIAXg6qfrxtRkYdKROolLHmOdcBBrQLDOzK4UBRvk
 XSMt0JvbRw7D9Dhwmd5sQTfnwGh3FXW8SptGNE5KLevvTvuDeqAOZKcnGnUnhRrZ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the via-camera to the vb2 framework. With this change this
driver passes all 'v4l2-compliance -s' tests on my OLPC 1.5.

Also tested with the Sugar 'Record' application.

All tests were done under the OLPC official 5.0.8 kernel.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
As usual, the vb2 conversion patch is hard to read. There really is no
way to split this up in smaller patches.
---
 drivers/media/platform/Kconfig      |   2 +-
 drivers/media/platform/via-camera.c | 492 +++++++++-------------------
 2 files changed, 159 insertions(+), 335 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 8a19654b393a..89555f9a813f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -16,7 +16,7 @@ source "drivers/media/platform/marvell-ccic/Kconfig"
 config VIDEO_VIA_CAMERA
 	tristate "VIAFB camera controller support"
 	depends on FB_VIA
-	select VIDEOBUF_DMA_SG
+	select VIDEOBUF2_DMA_SG
 	select VIDEO_OV7670
 	help
 	   Driver support for the integrated camera controller in VIA
diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index 24c5d2a7b91f..78841b9015ce 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -21,7 +21,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-image-sizes.h>
 #include <media/i2c/ov7670.h>
-#include <media/videobuf-dma-sg.h>
+#include <media/videobuf2-dma-sg.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_qos.h>
@@ -85,16 +85,11 @@ struct via_camera {
 	 * live in frame buffer memory, so we don't call them "DMA".
 	 */
 	unsigned int cb_offsets[3];	/* offsets into fb mem */
-	u8 __iomem *cb_addrs[3];		/* Kernel-space addresses */
+	u8 __iomem *cb_addrs[3];	/* Kernel-space addresses */
 	int n_cap_bufs;			/* How many are we using? */
-	int next_buf;
-	struct videobuf_queue vb_queue;
-	struct list_head buffer_queue;	/* prot. by reg_lock */
-	/*
-	 * User tracking.
-	 */
-	int users;
-	struct file *owner;
+	struct vb2_queue vq;
+	struct list_head buffer_queue;
+	u32 sequence;
 	/*
 	 * Video format information.  sensor_format is kept in a form
 	 * that we can use to pass to the sensor.  We always run the
@@ -107,6 +102,13 @@ struct via_camera {
 	u32 mbus_code;
 };

+/* buffer for one video frame */
+struct via_buffer {
+	/* common v4l buffer stuff -- must be first */
+	struct vb2_v4l2_buffer		vbuf;
+	struct list_head		queue;
+};
+
 /*
  * Yes, this is a hack, but there's only going to be one of these
  * on any system we know of.
@@ -323,28 +325,15 @@ static irqreturn_t viacam_quick_irq(int irq, void *data)
 }

 /*
- * Find the next videobuf buffer which has somebody waiting on it.
+ * Find the next buffer which has somebody waiting on it.
  */
-static struct videobuf_buffer *viacam_next_buffer(struct via_camera *cam)
+static struct via_buffer *viacam_next_buffer(struct via_camera *cam)
 {
-	unsigned long flags;
-	struct videobuf_buffer *buf = NULL;
-
-	spin_lock_irqsave(&cam->viadev->reg_lock, flags);
 	if (cam->opstate != S_RUNNING)
-		goto out;
+		return NULL;
 	if (list_empty(&cam->buffer_queue))
-		goto out;
-	buf = list_entry(cam->buffer_queue.next, struct videobuf_buffer, queue);
-	if (!waitqueue_active(&buf->done)) {/* Nobody waiting */
-		buf = NULL;
-		goto out;
-	}
-	list_del(&buf->queue);
-	buf->state = VIDEOBUF_ACTIVE;
-out:
-	spin_unlock_irqrestore(&cam->viadev->reg_lock, flags);
-	return buf;
+		return NULL;
+	return list_entry(cam->buffer_queue.next, struct via_buffer, queue);
 }

 /*
@@ -352,11 +341,12 @@ static struct videobuf_buffer *viacam_next_buffer(struct via_camera *cam)
  */
 static irqreturn_t viacam_irq(int irq, void *data)
 {
-	int bufn;
-	struct videobuf_buffer *vb;
 	struct via_camera *cam = data;
-	struct videobuf_dmabuf *vdma;
+	struct via_buffer *vb;
+	int bufn;
+	struct sg_table *sgt;

+	mutex_lock(&cam->lock);
 	/*
 	 * If there is no place to put the data frame, don't bother
 	 * with anything else.
@@ -374,12 +364,15 @@ static irqreturn_t viacam_irq(int irq, void *data)
 	/*
 	 * Copy over the data and let any waiters know.
 	 */
-	vdma = videobuf_to_dma(vb);
-	viafb_dma_copy_out_sg(cam->cb_offsets[bufn], vdma->sglist, vdma->sglen);
-	vb->state = VIDEOBUF_DONE;
-	vb->size = cam->user_format.sizeimage;
-	wake_up(&vb->done);
+	sgt = vb2_dma_sg_plane_desc(&vb->vbuf.vb2_buf, 0);
+	vb->vbuf.vb2_buf.timestamp = ktime_get_ns();
+	viafb_dma_copy_out_sg(cam->cb_offsets[bufn], sgt->sgl, sgt->nents);
+	vb->vbuf.sequence = cam->sequence++;
+	vb->vbuf.field = V4L2_FIELD_NONE;
+	list_del(&vb->queue);
+	vb2_buffer_done(&vb->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
 done:
+	mutex_unlock(&cam->lock);
 	return IRQ_HANDLED;
 }

@@ -555,7 +548,6 @@ static int viacam_config_controller(struct via_camera *cam)
 static void viacam_start_engine(struct via_camera *cam)
 {
 	spin_lock_irq(&cam->viadev->reg_lock);
-	cam->next_buf = 0;
 	viacam_write_reg_mask(cam, VCR_CAPINTC, VCR_CI_ENABLE, VCR_CI_ENABLE);
 	viacam_int_enable(cam);
 	(void) viacam_read_reg(cam, VCR_CAPINTC); /* Force post */
@@ -576,81 +568,117 @@ static void viacam_stop_engine(struct via_camera *cam)


 /* --------------------------------------------------------------------------*/
-/* Videobuf callback ops */
+/* vb2 callback ops */

-/*
- * buffer_setup.  The purpose of this one would appear to be to tell
- * videobuf how big a single image is.	It's also evidently up to us
- * to put some sort of limit on the maximum number of buffers allowed.
- */
-static int viacam_vb_buf_setup(struct videobuf_queue *q,
-		unsigned int *count, unsigned int *size)
+static struct via_buffer *vb2_to_via_buffer(struct vb2_buffer *vb)
 {
-	struct via_camera *cam = q->priv_data;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);

-	*size = cam->user_format.sizeimage;
-	if (*count == 0 || *count > 6)	/* Arbitrary number */
-		*count = 6;
-	return 0;
+	return container_of(vbuf, struct via_buffer, vbuf);
 }

-/*
- * Prepare a buffer.
- */
-static int viacam_vb_buf_prepare(struct videobuf_queue *q,
-		struct videobuf_buffer *vb, enum v4l2_field field)
+static void viacam_vb2_queue(struct vb2_buffer *vb)
 {
-	struct via_camera *cam = q->priv_data;
-
-	vb->size = cam->user_format.sizeimage;
-	vb->width = cam->user_format.width; /* bytesperline???? */
-	vb->height = cam->user_format.height;
-	vb->field = field;
-	if (vb->state == VIDEOBUF_NEEDS_INIT) {
-		int ret = videobuf_iolock(q, vb, NULL);
-		if (ret)
-			return ret;
+	struct via_camera *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct via_buffer *via = vb2_to_via_buffer(vb);
+
+	list_add_tail(&via->queue, &cam->buffer_queue);
+}
+
+static int viacam_vb2_prepare(struct vb2_buffer *vb)
+{
+	struct via_camera *cam = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (vb2_plane_size(vb, 0) < cam->user_format.sizeimage) {
+		cam_dbg(cam,
+			"Plane size too small (%lu < %u)\n",
+			vb2_plane_size(vb, 0),
+			cam->user_format.sizeimage);
+		return -EINVAL;
 	}
-	vb->state = VIDEOBUF_PREPARED;
+
+	vb2_set_plane_payload(vb, 0, cam->user_format.sizeimage);
+
 	return 0;
 }

-/*
- * We've got a buffer to put data into.
- *
- * FIXME: check for a running engine and valid buffers?
- */
-static void viacam_vb_buf_queue(struct videobuf_queue *q,
-		struct videobuf_buffer *vb)
+static int viacam_vb2_queue_setup(struct vb2_queue *vq,
+				  unsigned int *nbufs,
+				  unsigned int *num_planes, unsigned int sizes[],
+				  struct device *alloc_devs[])
 {
-	struct via_camera *cam = q->priv_data;
+	struct via_camera *cam = vb2_get_drv_priv(vq);
+	int size = cam->user_format.sizeimage;
+
+	if (*num_planes)
+		return sizes[0] < size ? -EINVAL : 0;
+
+	*num_planes = 1;
+	sizes[0] = size;
+	return 0;
+}

+static int viacam_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct via_camera *cam = vb2_get_drv_priv(vq);
+	struct via_buffer *buf, *tmp;
+	int ret = 0;
+
+	if (cam->opstate != S_IDLE) {
+		ret = -EBUSY;
+		goto out;
+	}
 	/*
-	 * Note that videobuf holds the lock when it calls
-	 * us, so we need not (indeed, cannot) take it here.
+	 * Configure things if need be.
 	 */
-	vb->state = VIDEOBUF_QUEUED;
-	list_add_tail(&vb->queue, &cam->buffer_queue);
+	if (test_bit(CF_CONFIG_NEEDED, &cam->flags)) {
+		ret = viacam_configure_sensor(cam);
+		if (ret)
+			goto out;
+		ret = viacam_config_controller(cam);
+		if (ret)
+			goto out;
+	}
+	cam->sequence = 0;
+	/*
+	 * If the CPU goes into C3, the DMA transfer gets corrupted and
+	 * users start filing unsightly bug reports.  Put in a "latency"
+	 * requirement which will keep the CPU out of the deeper sleep
+	 * states.
+	 */
+	pm_qos_add_request(&cam->qos_request, PM_QOS_CPU_DMA_LATENCY, 50);
+	viacam_start_engine(cam);
+	return 0;
+out:
+	list_for_each_entry_safe(buf, tmp, &cam->buffer_queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	return ret;
 }

-/*
- * Free a buffer.
- */
-static void viacam_vb_buf_release(struct videobuf_queue *q,
-		struct videobuf_buffer *vb)
+static void viacam_vb2_stop_streaming(struct vb2_queue *vq)
 {
-	struct via_camera *cam = q->priv_data;
+	struct via_camera *cam = vb2_get_drv_priv(vq);
+	struct via_buffer *buf, *tmp;
+
+	pm_qos_remove_request(&cam->qos_request);
+	viacam_stop_engine(cam);

-	videobuf_dma_unmap(&cam->platdev->dev, videobuf_to_dma(vb));
-	videobuf_dma_free(videobuf_to_dma(vb));
-	vb->state = VIDEOBUF_NEEDS_INIT;
+	list_for_each_entry_safe(buf, tmp, &cam->buffer_queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
 }

-static const struct videobuf_queue_ops viacam_vb_ops = {
-	.buf_setup	= viacam_vb_buf_setup,
-	.buf_prepare	= viacam_vb_buf_prepare,
-	.buf_queue	= viacam_vb_buf_queue,
-	.buf_release	= viacam_vb_buf_release,
+static const struct vb2_ops viacam_vb2_ops = {
+	.queue_setup		= viacam_vb2_queue_setup,
+	.buf_queue		= viacam_vb2_queue,
+	.buf_prepare		= viacam_vb2_prepare,
+	.start_streaming	= viacam_vb2_start_streaming,
+	.stop_streaming		= viacam_vb2_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
 };

 /* --------------------------------------------------------------------------*/
@@ -678,15 +706,7 @@ static int viacam_open(struct file *filp)
 		}
 		via_sensor_power_up(cam);
 		set_bit(CF_CONFIG_NEEDED, &cam->flags);
-		/*
-		 * Hook into videobuf.	Evidently this cannot fail.
-		 */
-		videobuf_queue_sg_init(&cam->vb_queue, &viacam_vb_ops,
-				&cam->platdev->dev, &cam->viadev->reg_lock,
-				V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FIELD_NONE,
-				sizeof(struct videobuf_buffer), cam, NULL);
 	}
-	(cam->users)++;
 out:
 	mutex_unlock(&cam->lock);
 	return ret;
@@ -698,108 +718,27 @@ static int viacam_release(struct file *filp)
 	bool last_open;

 	mutex_lock(&cam->lock);
-	(cam->users)--;
 	last_open = v4l2_fh_is_singular_file(filp);
-	/*
-	 * If the "owner" is closing, shut down any ongoing
-	 * operations.
-	 */
-	if (filp == cam->owner) {
-		videobuf_stop(&cam->vb_queue);
-		/*
-		 * We don't hold the spinlock here, but, if release()
-		 * is being called by the owner, nobody else will
-		 * be changing the state.  And an extra stop would
-		 * not hurt anyway.
-		 */
-		if (cam->opstate != S_IDLE)
-			viacam_stop_engine(cam);
-		cam->owner = NULL;
-	}
+	_vb2_fop_release(filp, NULL);
 	/*
 	 * Last one out needs to turn out the lights.
 	 */
 	if (last_open) {
-		videobuf_mmap_free(&cam->vb_queue);
 		via_sensor_power_down(cam);
 		viafb_release_dma();
 	}
-	v4l2_fh_release(filp);
 	mutex_unlock(&cam->lock);
 	return 0;
 }

-/*
- * Read a frame from the device.
- */
-static ssize_t viacam_read(struct file *filp, char __user *buffer,
-		size_t len, loff_t *pos)
-{
-	struct via_camera *cam = video_drvdata(filp);
-	int ret;
-
-	mutex_lock(&cam->lock);
-	/*
-	 * Enforce the V4l2 "only one owner gets to read data" rule.
-	 */
-	if (cam->owner && cam->owner != filp) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
-	cam->owner = filp;
-	/*
-	 * Do we need to configure the hardware?
-	 */
-	if (test_bit(CF_CONFIG_NEEDED, &cam->flags)) {
-		ret = viacam_configure_sensor(cam);
-		if (!ret)
-			ret = viacam_config_controller(cam);
-		if (ret)
-			goto out_unlock;
-	}
-	/*
-	 * Fire up the capture engine, then have videobuf do
-	 * the heavy lifting.  Someday it would be good to avoid
-	 * stopping and restarting the engine each time.
-	 */
-	INIT_LIST_HEAD(&cam->buffer_queue);
-	viacam_start_engine(cam);
-	ret = videobuf_read_stream(&cam->vb_queue, buffer, len, pos, 0,
-			filp->f_flags & O_NONBLOCK);
-	viacam_stop_engine(cam);
-	/* videobuf_stop() ?? */
-
-out_unlock:
-	mutex_unlock(&cam->lock);
-	return ret;
-}
-
-
-static __poll_t viacam_poll(struct file *filp, struct poll_table_struct *pt)
-{
-	struct via_camera *cam = video_drvdata(filp);
-
-	return v4l2_ctrl_poll(filp, pt) | videobuf_poll_stream(filp, &cam->vb_queue, pt);
-}
-
-
-static int viacam_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct via_camera *cam = video_drvdata(filp);
-
-	return videobuf_mmap_mapper(&cam->vb_queue, vma);
-}
-
-
-
 static const struct v4l2_file_operations viacam_fops = {
 	.owner		= THIS_MODULE,
 	.open		= viacam_open,
 	.release	= viacam_release,
-	.read		= viacam_read,
-	.poll		= viacam_poll,
-	.mmap		= viacam_mmap,
-	.unlocked_ioctl	= video_ioctl2,
+	.read		= vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
 };

 /*----------------------------------------------------------------------------*/
@@ -926,12 +865,8 @@ static int viacam_try_fmt_vid_cap(struct file *filp, void *priv,
 {
 	struct via_camera *cam = video_drvdata(filp);
 	struct v4l2_format sfmt;
-	int ret;

-	mutex_lock(&cam->lock);
-	ret = viacam_do_try_fmt(cam, &fmt->fmt.pix, &sfmt.fmt.pix);
-	mutex_unlock(&cam->lock);
-	return ret;
+	return viacam_do_try_fmt(cam, &fmt->fmt.pix, &sfmt.fmt.pix);
 }


@@ -940,9 +875,7 @@ static int viacam_g_fmt_vid_cap(struct file *filp, void *priv,
 {
 	struct via_camera *cam = video_drvdata(filp);

-	mutex_lock(&cam->lock);
 	fmt->fmt.pix = cam->user_format;
-	mutex_unlock(&cam->lock);
 	return 0;
 }

@@ -958,18 +891,15 @@ static int viacam_s_fmt_vid_cap(struct file *filp, void *priv,
 	 * Camera must be idle or we can't mess with the
 	 * video setup.
 	 */
-	mutex_lock(&cam->lock);
-	if (cam->opstate != S_IDLE) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (cam->opstate != S_IDLE)
+		return -EBUSY;
 	/*
 	 * Let the sensor code look over and tweak the
 	 * requested formatting.
 	 */
 	ret = viacam_do_try_fmt(cam, &fmt->fmt.pix, &sfmt.fmt.pix);
 	if (ret)
-		goto out;
+		return ret;
 	/*
 	 * OK, let's commit to the new format.
 	 */
@@ -979,8 +909,6 @@ static int viacam_s_fmt_vid_cap(struct file *filp, void *priv,
 	ret = viacam_configure_sensor(cam);
 	if (!ret)
 		ret = viacam_config_controller(cam);
-out:
-	mutex_unlock(&cam->lock);
 	return ret;
 }

@@ -993,140 +921,22 @@ static int viacam_querycap(struct file *filp, void *priv,
 	return 0;
 }

-/*
- * Streaming operations - pure videobuf stuff.
- */
-static int viacam_reqbufs(struct file *filp, void *priv,
-		struct v4l2_requestbuffers *rb)
-{
-	struct via_camera *cam = video_drvdata(filp);
-
-	return videobuf_reqbufs(&cam->vb_queue, rb);
-}
-
-static int viacam_querybuf(struct file *filp, void *priv,
-		struct v4l2_buffer *buf)
-{
-	struct via_camera *cam = video_drvdata(filp);
-
-	return videobuf_querybuf(&cam->vb_queue, buf);
-}
-
-static int viacam_qbuf(struct file *filp, void *priv, struct v4l2_buffer *buf)
-{
-	struct via_camera *cam = video_drvdata(filp);
-
-	return videobuf_qbuf(&cam->vb_queue, buf);
-}
-
-static int viacam_dqbuf(struct file *filp, void *priv, struct v4l2_buffer *buf)
-{
-	struct via_camera *cam = video_drvdata(filp);
-
-	return videobuf_dqbuf(&cam->vb_queue, buf, filp->f_flags & O_NONBLOCK);
-}
-
-static int viacam_streamon(struct file *filp, void *priv, enum v4l2_buf_type t)
-{
-	struct via_camera *cam = video_drvdata(filp);
-	int ret = 0;
-
-	if (t != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
-	mutex_lock(&cam->lock);
-	if (cam->opstate != S_IDLE) {
-		ret = -EBUSY;
-		goto out;
-	}
-	/*
-	 * Enforce the V4l2 "only one owner gets to read data" rule.
-	 */
-	if (cam->owner && cam->owner != filp) {
-		ret = -EBUSY;
-		goto out;
-	}
-	cam->owner = filp;
-	/*
-	 * Configure things if need be.
-	 */
-	if (test_bit(CF_CONFIG_NEEDED, &cam->flags)) {
-		ret = viacam_configure_sensor(cam);
-		if (ret)
-			goto out;
-		ret = viacam_config_controller(cam);
-		if (ret)
-			goto out;
-	}
-	/*
-	 * If the CPU goes into C3, the DMA transfer gets corrupted and
-	 * users start filing unsightly bug reports.  Put in a "latency"
-	 * requirement which will keep the CPU out of the deeper sleep
-	 * states.
-	 */
-	pm_qos_add_request(&cam->qos_request, PM_QOS_CPU_DMA_LATENCY, 50);
-	/*
-	 * Fire things up.
-	 */
-	INIT_LIST_HEAD(&cam->buffer_queue);
-	ret = videobuf_streamon(&cam->vb_queue);
-	if (!ret)
-		viacam_start_engine(cam);
-out:
-	mutex_unlock(&cam->lock);
-	return ret;
-}
-
-static int viacam_streamoff(struct file *filp, void *priv, enum v4l2_buf_type t)
-{
-	struct via_camera *cam = video_drvdata(filp);
-	int ret;
-
-	if (t != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-	mutex_lock(&cam->lock);
-	if (cam->opstate != S_RUNNING) {
-		ret = -EINVAL;
-		goto out;
-	}
-	pm_qos_remove_request(&cam->qos_request);
-	viacam_stop_engine(cam);
-	/*
-	 * Videobuf will recycle all of the outstanding buffers, but
-	 * we should be sure we don't retain any references to
-	 * any of them.
-	 */
-	ret = videobuf_streamoff(&cam->vb_queue);
-	INIT_LIST_HEAD(&cam->buffer_queue);
-out:
-	mutex_unlock(&cam->lock);
-	return ret;
-}
-
 /* G/S_PARM */

 static int viacam_g_parm(struct file *filp, void *priv,
 		struct v4l2_streamparm *parm)
 {
 	struct via_camera *cam = video_drvdata(filp);
-	int ret;

-	mutex_lock(&cam->lock);
-	ret = v4l2_g_parm_cap(video_devdata(filp), cam->sensor, parm);
-	mutex_unlock(&cam->lock);
-	return ret;
+	return v4l2_g_parm_cap(video_devdata(filp), cam->sensor, parm);
 }

 static int viacam_s_parm(struct file *filp, void *priv,
 		struct v4l2_streamparm *parm)
 {
 	struct via_camera *cam = video_drvdata(filp);
-	int ret;

-	mutex_lock(&cam->lock);
-	ret = v4l2_s_parm_cap(video_devdata(filp), cam->sensor, parm);
-	mutex_unlock(&cam->lock);
-	return ret;
+	return v4l2_s_parm_cap(video_devdata(filp), cam->sensor, parm);
 }

 static int viacam_enum_framesizes(struct file *filp, void *priv,
@@ -1172,9 +982,7 @@ static int viacam_enum_frameintervals(struct file *filp, void *priv,
 	if (interval->width < QCIF_WIDTH || interval->width > VGA_WIDTH ||
 	    interval->height < QCIF_HEIGHT || interval->height > VGA_HEIGHT)
 		return -EINVAL;
-	mutex_lock(&cam->lock);
 	ret = sensor_call(cam, pad, enum_frame_interval, NULL, &fie);
-	mutex_unlock(&cam->lock);
 	if (ret)
 		return ret;
 	interval->type = V4L2_FRMIVAL_TYPE_DISCRETE;
@@ -1182,8 +990,6 @@ static int viacam_enum_frameintervals(struct file *filp, void *priv,
 	return 0;
 }

-
-
 static const struct v4l2_ioctl_ops viacam_ioctl_ops = {
 	.vidioc_enum_input	= viacam_enum_input,
 	.vidioc_g_input		= viacam_g_input,
@@ -1193,12 +999,15 @@ static const struct v4l2_ioctl_ops viacam_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap	= viacam_g_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap	= viacam_s_fmt_vid_cap,
 	.vidioc_querycap	= viacam_querycap,
-	.vidioc_reqbufs		= viacam_reqbufs,
-	.vidioc_querybuf	= viacam_querybuf,
-	.vidioc_qbuf		= viacam_qbuf,
-	.vidioc_dqbuf		= viacam_dqbuf,
-	.vidioc_streamon	= viacam_streamon,
-	.vidioc_streamoff	= viacam_streamoff,
+	.vidioc_reqbufs		= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs	= vb2_ioctl_create_bufs,
+	.vidioc_querybuf	= vb2_ioctl_querybuf,
+	.vidioc_prepare_buf	= vb2_ioctl_prepare_buf,
+	.vidioc_qbuf		= vb2_ioctl_qbuf,
+	.vidioc_dqbuf		= vb2_ioctl_dqbuf,
+	.vidioc_expbuf		= vb2_ioctl_expbuf,
+	.vidioc_streamon	= vb2_ioctl_streamon,
+	.vidioc_streamoff	= vb2_ioctl_streamoff,
 	.vidioc_g_parm		= viacam_g_parm,
 	.vidioc_s_parm		= viacam_s_parm,
 	.vidioc_enum_framesizes = viacam_enum_framesizes,
@@ -1242,7 +1051,7 @@ static int viacam_resume(void *priv)
 	/*
 	 * Make sure the sensor's power state is correct
 	 */
-	if (cam->users > 0)
+	if (!list_empty(&cam->vdev.fh_list))
 		via_sensor_power_up(cam);
 	else
 		via_sensor_power_down(cam);
@@ -1327,6 +1136,7 @@ static int viacam_probe(struct platform_device *pdev)
 	int ret;
 	struct i2c_adapter *sensor_adapter;
 	struct viafb_dev *viadev = pdev->dev.platform_data;
+	struct vb2_queue *vq;
 	struct i2c_board_info ov7670_info = {
 		.type = "ov7670",
 		.addr = 0x42 >> 1,
@@ -1370,8 +1180,6 @@ static int viacam_probe(struct platform_device *pdev)
 	via_cam_info = cam;
 	cam->platdev = pdev;
 	cam->viadev = viadev;
-	cam->users = 0;
-	cam->owner = NULL;
 	cam->opstate = S_IDLE;
 	cam->user_format = cam->sensor_format = viacam_def_pix_format;
 	mutex_init(&cam->lock);
@@ -1432,11 +1240,27 @@ static int viacam_probe(struct platform_device *pdev)
 			viacam_irq, IRQF_SHARED, "via-camera", cam);
 	if (ret)
 		goto out_power_down;
+
+	vq = &cam->vq;
+	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
+	vq->drv_priv = cam;
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vq->buf_struct_size = sizeof(struct via_buffer);
+	vq->dev = cam->v4l2_dev.dev;
+
+	vq->ops = &viacam_vb2_ops;
+	vq->mem_ops = &vb2_dma_sg_memops;
+	vq->lock = &cam->lock;
+
+	ret = vb2_queue_init(vq);
 	/*
 	 * Tell V4l2 that we exist.
 	 */
 	cam->vdev = viacam_v4l_template;
 	cam->vdev.v4l2_dev = &cam->v4l2_dev;
+	cam->vdev.lock = &cam->lock;
+	cam->vdev.queue = vq;
 	video_set_drvdata(&cam->vdev, cam);
 	ret = video_register_device(&cam->vdev, VFL_TYPE_GRABBER, -1);
 	if (ret)
-- 
2.20.1

