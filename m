Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710526BD7D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 15:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfGQNn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 09:43:58 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46273 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbfGQNn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 09:43:58 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id nkDnhwVmO0SBqnkDrhaPl9; Wed, 17 Jul 2019 15:43:55 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] mx2_emmaprp: use struct v4l2_fh
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <53199fac-04b9-027d-e014-041f94565926@xs4all.nl>
Date:   Wed, 17 Jul 2019 15:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGACFihOl5vFV/Rm1tyFsg0Cp/7yEK6v6S3QTb1hBwEGoOH2WmM8jip9f2sIvkBTALhCAsfaQwPYZxsHrzECBLisv6Y6wxEsYHh1hw4sYVhcK9PDix2Z
 7Ql+yZdPS6wC3a/9OWIURTO9HnRYpfqkfkHWUAqmZnTn/kEOvxH2N/mP69NusbprAttHaIFBDQb1zQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert this driver to use struct v4l2_fh and as a result switch to
using vb2/v4l2_mem2mem helper functions as well.

Only compile-tested due to lack of hardware. This driver is however
very similar to the m2m-deinterlace driver in this respect, and that
v4l2_fh conversion has been properly tested.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
index 333324c75027..b9a5c20d28aa 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -210,11 +210,11 @@ struct emmaprp_dev {
 };

 struct emmaprp_ctx {
+	struct v4l2_fh		fh;
 	struct emmaprp_dev	*dev;
 	/* Abort requested by m2m */
 	int			aborting;
 	struct emmaprp_q_data	q_data[2];
-	struct v4l2_m2m_ctx	*m2m_ctx;
 };

 static struct emmaprp_q_data *get_q_data(struct emmaprp_ctx *ctx,
@@ -243,7 +243,7 @@ static void emmaprp_job_abort(void *priv)

 	dprintk(pcdev, "Aborting task\n");

-	v4l2_m2m_job_finish(pcdev->m2m_dev, ctx->m2m_ctx);
+	v4l2_m2m_job_finish(pcdev->m2m_dev, ctx->fh.m2m_ctx);
 }

 static inline void emmaprp_dump_regs(struct emmaprp_dev *pcdev)
@@ -278,8 +278,8 @@ static void emmaprp_device_run(void *priv)
 	dma_addr_t p_in, p_out;
 	u32 tmp;

-	src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);

 	s_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	s_width	= s_q_data->width;
@@ -353,8 +353,8 @@ static irqreturn_t emmaprp_irq(int irq_emma, void *data)
 			pr_err("PrP bus error occurred, this transfer is probably corrupted\n");
 			writel(PRP_CNTL_SWRST, pcdev->base_emma + PRP_CNTL);
 		} else if (irqst & PRP_INTR_ST_CH2B1CI) { /* buffer ready */
-			src_vb = v4l2_m2m_src_buf_remove(curr_ctx->m2m_ctx);
-			dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->m2m_ctx);
+			src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
+			dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);

 			dst_vb->vb2_buf.timestamp = src_vb->vb2_buf.timestamp;
 			dst_vb->flags &=
@@ -371,7 +371,7 @@ static irqreturn_t emmaprp_irq(int irq_emma, void *data)
 		}
 	}

-	v4l2_m2m_job_finish(pcdev->m2m_dev, curr_ctx->m2m_ctx);
+	v4l2_m2m_job_finish(pcdev->m2m_dev, curr_ctx->fh.m2m_ctx);
 	return IRQ_HANDLED;
 }

@@ -435,7 +435,7 @@ static int vidioc_g_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 	struct emmaprp_q_data *q_data;

-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	if (!vq)
 		return -EINVAL;

@@ -540,7 +540,7 @@ static int vidioc_s_fmt(struct emmaprp_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 	int ret;

-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	if (!vq)
 		return -EINVAL;

@@ -596,52 +596,6 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	return vidioc_s_fmt(priv, f);
 }

-static int vidioc_reqbufs(struct file *file, void *priv,
-			  struct v4l2_requestbuffers *reqbufs)
-{
-	struct emmaprp_ctx *ctx = priv;
-
-	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
-}
-
-static int vidioc_querybuf(struct file *file, void *priv,
-			   struct v4l2_buffer *buf)
-{
-	struct emmaprp_ctx *ctx = priv;
-
-	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
-}
-
-static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
-{
-	struct emmaprp_ctx *ctx = priv;
-
-	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
-}
-
-static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
-{
-	struct emmaprp_ctx *ctx = priv;
-
-	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
-}
-
-static int vidioc_streamon(struct file *file, void *priv,
-			   enum v4l2_buf_type type)
-{
-	struct emmaprp_ctx *ctx = priv;
-
-	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
-}
-
-static int vidioc_streamoff(struct file *file, void *priv,
-			    enum v4l2_buf_type type)
-{
-	struct emmaprp_ctx *ctx = priv;
-
-	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
-}
-
 static const struct v4l2_ioctl_ops emmaprp_ioctl_ops = {
 	.vidioc_querycap	= vidioc_querycap,

@@ -655,14 +609,14 @@ static const struct v4l2_ioctl_ops emmaprp_ioctl_ops = {
 	.vidioc_try_fmt_vid_out	= vidioc_try_fmt_vid_out,
 	.vidioc_s_fmt_vid_out	= vidioc_s_fmt_vid_out,

-	.vidioc_reqbufs		= vidioc_reqbufs,
-	.vidioc_querybuf	= vidioc_querybuf,
-
-	.vidioc_qbuf		= vidioc_qbuf,
-	.vidioc_dqbuf		= vidioc_dqbuf,
-
-	.vidioc_streamon	= vidioc_streamon,
-	.vidioc_streamoff	= vidioc_streamoff,
+	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
+	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
 };


@@ -722,7 +676,7 @@ static void emmaprp_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct emmaprp_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-	v4l2_m2m_buf_queue(ctx->m2m_ctx, vbuf);
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }

 static const struct vb2_ops emmaprp_qops = {
@@ -740,7 +694,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;

 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	src_vq->io_modes = VB2_MMAP | VB2_USERPTR;
+	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->ops = &emmaprp_qops;
@@ -754,7 +708,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;

 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR;
+	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &emmaprp_qops;
@@ -778,7 +732,8 @@ static int emmaprp_open(struct file *file)
 	if (!ctx)
 		return -ENOMEM;

-	file->private_data = ctx;
+	v4l2_fh_init(&ctx->fh, video_devdata(file));
+	file->private_data = &ctx->fh;
 	ctx->dev = pcdev;

 	if (mutex_lock_interruptible(&pcdev->dev_mutex)) {
@@ -786,10 +741,10 @@ static int emmaprp_open(struct file *file)
 		return -ERESTARTSYS;
 	}

-	ctx->m2m_ctx = v4l2_m2m_ctx_init(pcdev->m2m_dev, ctx, &queue_init);
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(pcdev->m2m_dev, ctx, &queue_init);

-	if (IS_ERR(ctx->m2m_ctx)) {
-		int ret = PTR_ERR(ctx->m2m_ctx);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		int ret = PTR_ERR(ctx->fh.m2m_ctx);

 		mutex_unlock(&pcdev->dev_mutex);
 		kfree(ctx);
@@ -800,9 +755,10 @@ static int emmaprp_open(struct file *file)
 	clk_prepare_enable(pcdev->clk_emma_ahb);
 	ctx->q_data[V4L2_M2M_SRC].fmt = &formats[1];
 	ctx->q_data[V4L2_M2M_DST].fmt = &formats[0];
+	v4l2_fh_add(&ctx->fh);
 	mutex_unlock(&pcdev->dev_mutex);

-	dprintk(pcdev, "Created instance %p, m2m_ctx: %p\n", ctx, ctx->m2m_ctx);
+	dprintk(pcdev, "Created instance %p, m2m_ctx: %p\n", ctx, ctx->fh.m2m_ctx);

 	return 0;
 }
@@ -817,46 +773,22 @@ static int emmaprp_release(struct file *file)
 	mutex_lock(&pcdev->dev_mutex);
 	clk_disable_unprepare(pcdev->clk_emma_ahb);
 	clk_disable_unprepare(pcdev->clk_emma_ipg);
-	v4l2_m2m_ctx_release(ctx->m2m_ctx);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_unlock(&pcdev->dev_mutex);
 	kfree(ctx);

 	return 0;
 }

-static __poll_t emmaprp_poll(struct file *file,
-				 struct poll_table_struct *wait)
-{
-	struct emmaprp_dev *pcdev = video_drvdata(file);
-	struct emmaprp_ctx *ctx = file->private_data;
-	__poll_t res;
-
-	mutex_lock(&pcdev->dev_mutex);
-	res = v4l2_m2m_poll(file, ctx->m2m_ctx, wait);
-	mutex_unlock(&pcdev->dev_mutex);
-	return res;
-}
-
-static int emmaprp_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct emmaprp_dev *pcdev = video_drvdata(file);
-	struct emmaprp_ctx *ctx = file->private_data;
-	int ret;
-
-	if (mutex_lock_interruptible(&pcdev->dev_mutex))
-		return -ERESTARTSYS;
-	ret = v4l2_m2m_mmap(file, ctx->m2m_ctx, vma);
-	mutex_unlock(&pcdev->dev_mutex);
-	return ret;
-}
-
 static const struct v4l2_file_operations emmaprp_fops = {
 	.owner		= THIS_MODULE,
 	.open		= emmaprp_open,
 	.release	= emmaprp_release,
-	.poll		= emmaprp_poll,
+	.poll		= v4l2_m2m_fop_poll,
 	.unlocked_ioctl	= video_ioctl2,
-	.mmap		= emmaprp_mmap,
+	.mmap		= v4l2_m2m_fop_mmap,
 };

 static const struct video_device emmaprp_videodev = {
