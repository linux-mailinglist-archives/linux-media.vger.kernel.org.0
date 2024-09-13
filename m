Return-Path: <linux-media+bounces-18279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06471978ADA
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AF571C2314B
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1612155CBF;
	Fri, 13 Sep 2024 21:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X0CmsT88"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9FC155321
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264055; cv=none; b=ZNJVkxErl4CD6elGQpCqohJpvtSK1n7lLX2yD2KxNvsYXVom10dng8jB7XtNLtYu7V99cSOp49KV2ncs7C5/afVEYue7Ir6Mf/PZp0iJHQ7Cihn6q2iFUnFsnp4MsDh+ZNa7AHhsf6t1xo3XnKdY2OTIKq7echtROPnb6hNNhR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264055; c=relaxed/simple;
	bh=UjeQVJLvchVgUkD23gOYlJ7aYEUTepJcGMF+imJjm7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC7z6MX9/d7xd7v0AuuD66wP60mCM0n30SJjZUxPS7o42VrClY192c4DfxyfUZFfi5KPXe3XlwfqJjAa9uyEZTNEOP4qn3wohn3eYnXeHYlTlnOj2XO2OA9tuZD+XNx4at3Bl+afebZh9FpXnOMTTZVf2HZy4BGcALuBVYacu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X0CmsT88; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5470C2598;
	Fri, 13 Sep 2024 23:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263951;
	bh=UjeQVJLvchVgUkD23gOYlJ7aYEUTepJcGMF+imJjm7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0CmsT88crHPHV+70UFkLx4bfWissfunGauLCTF+nUBT1OLQrOzxXgl5v3MsBC5a+
	 TumUJtpP2+X/oet1RLBwwlgMm7IBOXloEGhVxi3x9YyUUTFQm7q1C7ZSn4AldS8szT
	 pv1g83TAQuaZ17xrE4undLJqb34Gu3PwpNlxAG/E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 10/10] media: pispbe: Add support for multi-context
Date: Fri, 13 Sep 2024 23:46:55 +0200
Message-ID: <20240913214657.1502838-11-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
References: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for context multiplexing to the PiSP BackEnd driver.

Move information that used to be per-node to the video context and
global information to the media context.

Implement media and video context allocation and release operations
to allocate and initialize a context and initialize the video queue there
contained.

Remove the per-node video device format and the buffer queues and
port the driver to use the ones in the video device context.

The operations that used to work with a pispbe_node now operates on a
pispbe_context.

- v4l2 ioctl ops: receive a file pointer, retrieve the associated context
  from the open file handle
- vb2 ops: receive a queue, retrieve the context from the queue
- internal driver ops: given a media device contex retrieve the video
  context from the other video devices when assembling a job

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 509 +++++++++++++-----
 1 file changed, 370 insertions(+), 139 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 555c28dddc4b..34fbe2b730b0 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -151,6 +151,70 @@ static const struct pispbe_node_description node_desc[PISPBE_NUM_NODES] = {
  * Structure to describe a single node /dev/video<N> which represents a single
  * input or output queue to the PiSP Back End device.
  */
+
+struct pispbe_media_context {
+	struct media_device_context mdev_context;
+	u32 streaming_map;
+};
+
+static struct pispbe_media_context *
+pispbe_media_context(struct media_device_context *mdev_context)
+{
+	return container_of(mdev_context, struct pispbe_media_context,
+			    mdev_context);
+}
+
+struct pispbe_node;
+struct pispbe_entity_context {
+	struct video_device_context vdev_context;
+
+	struct v4l2_format format;
+	struct list_head ready_queue;
+	const struct pisp_be_format *pisp_format;
+	struct pispbe_dev *pispbe;
+	struct pispbe_node *node;
+};
+
+static struct pispbe_entity_context *
+pispbe_entity_context(struct video_device_context *ctx)
+{
+	return container_of(ctx, struct pispbe_entity_context, vdev_context);
+}
+
+static struct pispbe_entity_context *
+pispbe_entity_context_from_queue(struct vb2_queue *queue)
+{
+	return pispbe_entity_context(video_device_context_from_queue(queue));
+}
+
+static struct pispbe_entity_context *
+pispbe_entity_context_from_file(struct file *file, struct video_device *vfd)
+{
+	return pispbe_entity_context(video_device_context_from_file(file, vfd));
+}
+
+static struct pispbe_entity_context *
+pispbe_get_dev_context(struct pispbe_media_context *pispbe_mdev_context,
+			struct video_device *vdev)
+{
+	struct video_device_context *ctx =
+		video_device_context_get(&pispbe_mdev_context->mdev_context,
+					 vdev);
+
+	return ctx ? pispbe_entity_context(ctx) : NULL;
+}
+
+void pispbe_put_dev_context(struct pispbe_entity_context *ctx)
+{
+	video_device_context_put(&ctx->vdev_context);
+}
+
+static struct pispbe_media_context *
+pispbe_media_context_from_dev(struct pispbe_entity_context *context)
+{
+	return pispbe_media_context(context->vdev_context.base.mdev_context);
+}
+
 struct pispbe_node {
 	unsigned int id;
 	int vfl_dir;
@@ -162,14 +226,13 @@ struct pispbe_node {
 	struct pispbe_dev *pispbe;
 	/* Video device lock */
 	struct mutex node_lock;
-	/* vb2_queue lock */
-	struct mutex queue_lock;
-	struct list_head ready_queue;
-	struct vb2_queue queue;
-	struct v4l2_format format;
-	const struct pisp_be_format *pisp_format;
 };
 
+static struct pispbe_node *pispbe_node_from_vdev(struct video_device *vdev)
+{
+	return container_of(vdev, struct pispbe_node, vfd);
+}
+
 /* For logging only, use the entity name with "pispbe" and separator removed */
 #define NODE_NAME(node) \
 		(node_desc[(node)->id].ent_name + sizeof(PISPBE_NAME))
@@ -216,15 +279,15 @@ struct pispbe_dev {
 	struct pispbe_node node[PISPBE_NUM_NODES];
 	dma_addr_t config_dma_addr;
 	unsigned int sequence;
-	u32 streaming_map;
 	struct pispbe_job queued_job, running_job;
-	/* protects "hw_busy" flag, streaming_map and job_queue */
+	/* protects "hw_busy" flag and job_queue */
 	spinlock_t hw_lock;
 	bool hw_busy; /* non-zero if a job is queued or is being started */
 	struct list_head job_queue;
 	int irq;
 	u32 hw_version;
 	u8 done, started;
+	struct media_pipeline pipe;
 };
 
 static u32 pispbe_rd(struct pispbe_dev *pispbe, unsigned int offset)
@@ -308,30 +371,31 @@ struct pispbe_buffer {
 };
 
 static int pispbe_get_planes_addr(dma_addr_t addr[3], struct pispbe_buffer *buf,
-				  struct pispbe_node *node)
+				  struct pispbe_entity_context *context)
 {
-	unsigned int num_planes = node->format.fmt.pix_mp.num_planes;
+	struct v4l2_format *format = &context->format;
+	unsigned int num_planes = format->fmt.pix_mp.num_planes;
 	unsigned int plane_factor = 0;
 	unsigned int size;
 	unsigned int p;
 
-	if (!buf || !node->pisp_format)
+	if (!buf || !context->pisp_format)
 		return 0;
 
 	/*
 	 * Determine the base plane size. This will not be the same
-	 * as node->format.fmt.pix_mp.plane_fmt[0].sizeimage for a single
+	 * as format->fmt.pix_mp.plane_fmt[0].sizeimage for a single
 	 * plane buffer in an mplane format.
 	 */
-	size = node->format.fmt.pix_mp.plane_fmt[0].bytesperline *
-	       node->format.fmt.pix_mp.height;
+	size = format->fmt.pix_mp.plane_fmt[0].bytesperline *
+	       format->fmt.pix_mp.height;
 
 	for (p = 0; p < num_planes && p < PISPBE_MAX_PLANES; p++) {
 		addr[p] = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, p);
-		plane_factor += node->pisp_format->plane_factor[p];
+		plane_factor += context->pisp_format->plane_factor[p];
 	}
 
-	for (; p < PISPBE_MAX_PLANES && node->pisp_format->plane_factor[p]; p++) {
+	for (; p < PISPBE_MAX_PLANES && context->pisp_format->plane_factor[p]; p++) {
 		/*
 		 * Calculate the address offset of this plane as needed
 		 * by the hardware. This is specifically for non-mplane
@@ -339,7 +403,7 @@ static int pispbe_get_planes_addr(dma_addr_t addr[3], struct pispbe_buffer *buf,
 		 * for the V4L2_PIX_FMT_YUV420 format.
 		 */
 		addr[p] = addr[0] + ((size * plane_factor) >> 3);
-		plane_factor += node->pisp_format->plane_factor[p];
+		plane_factor += context->pisp_format->plane_factor[p];
 	}
 
 	return num_planes;
@@ -355,11 +419,13 @@ static dma_addr_t pispbe_get_addr(struct pispbe_buffer *buf)
 
 static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 			       struct pispbe_job_descriptor *job,
+			       struct pispbe_media_context *mdev_context,
 			       struct pispbe_buffer *buf[PISPBE_NUM_NODES])
 {
 	struct pispbe_hw_enables *hw_en = &job->hw_enables;
 	struct pisp_be_tiles_config *config = job->config;
 	dma_addr_t *addrs = job->hw_dma_addrs;
+	struct pispbe_entity_context *ctx;
 	int ret;
 
 	/* Take a copy of the "enable" bitmaps so we can modify them. */
@@ -370,8 +436,10 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	 * Main input first. There are 3 address pointers, corresponding to up
 	 * to 3 planes.
 	 */
-	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
-				     &pispbe->node[MAIN_INPUT_NODE]);
+	ctx = pispbe_get_dev_context(mdev_context,
+				     &pispbe->node[MAIN_INPUT_NODE].vfd);
+	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE], ctx);
+	pispbe_put_dev_context(ctx);
 	if (ret <= 0) {
 		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
@@ -427,9 +495,11 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 
 	/* Main image output channels. */
 	for (unsigned int i = 0; i < PISP_BACK_END_NUM_OUTPUTS; i++) {
+		ctx = pispbe_get_dev_context(mdev_context,
+					     &pispbe->node[OUTPUT0_NODE + i].vfd);
 		ret = pispbe_get_planes_addr(addrs + 7 + 3 * i,
-					     buf[OUTPUT0_NODE + i],
-					     &pispbe->node[OUTPUT0_NODE + i]);
+					     buf[OUTPUT0_NODE + i], ctx);
+		pispbe_put_dev_context(ctx);
 		if (ret <= 0)
 			hw_en->rgb_enables &= ~(PISP_BE_RGB_ENABLE_OUTPUT0 << i);
 	}
@@ -450,35 +520,46 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
  *
  * Returns 0 if a job has been successfully prepared, < 0 otherwise.
  */
-static int pispbe_prepare_job(struct pispbe_dev *pispbe)
+static int pispbe_prepare_job(struct pispbe_dev *pispbe,
+			      struct pispbe_entity_context *context)
 {
+	struct pispbe_media_context *mdev_context =
+					pispbe_media_context_from_dev(context);
 	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
 	struct pispbe_job_descriptor *job;
+	struct pispbe_entity_context *ctx;
 	unsigned int streaming_map;
 	unsigned int config_index;
-	struct pispbe_node *node;
 
 	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
 		static const u32 mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
 
-		if ((pispbe->streaming_map & mask) != mask)
+		if ((mdev_context->streaming_map & mask) != mask)
 			return -ENODEV;
 
 		/*
 		 * Take a copy of streaming_map: nodes activated after this
 		 * point are ignored when preparing this job.
 		 */
-		streaming_map = pispbe->streaming_map;
+		streaming_map = mdev_context->streaming_map;
 	}
 
 	job = kzalloc(sizeof(*job), GFP_KERNEL);
 	if (!job)
 		return -ENOMEM;
 
-	node = &pispbe->node[CONFIG_NODE];
-	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
+	ctx = pispbe_get_dev_context(mdev_context,
+				     &pispbe->node[CONFIG_NODE].vfd);
+	if (!ctx) {
+		kfree(job);
+		return -ENODEV;
+	}
+
+	buf[CONFIG_NODE] = list_first_entry_or_null(&ctx->ready_queue,
 						    struct pispbe_buffer,
 						    ready_list);
+	pispbe_put_dev_context(ctx);
+
 	if (!buf[CONFIG_NODE]) {
 		kfree(job);
 		return -ENODEV;
@@ -530,12 +611,17 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe)
 			ignore_buffers = true;
 		}
 
-		node = &pispbe->node[i];
-
 		/* Pull a buffer from each V4L2 queue to form the queued job */
-		buf[i] = list_first_entry_or_null(&node->ready_queue,
+		ctx = pispbe_get_dev_context(mdev_context,
+					     &pispbe->node[i].vfd);
+		if (!ctx && !ignore_buffers)
+			goto err_return_buffers;
+
+		buf[i] = list_first_entry_or_null(&ctx->ready_queue,
 						  struct pispbe_buffer,
 						  ready_list);
+		pispbe_put_dev_context(ctx);
+
 		if (buf[i]) {
 			list_del(&buf[i]->ready_list);
 			job->buffers[i] = buf[i];
@@ -546,7 +632,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe)
 	}
 
 	/* Convert buffers to DMA addresses for the hardware */
-	pispbe_xlate_addrs(pispbe, job, buf);
+	pispbe_xlate_addrs(pispbe, job, mdev_context, buf);
 
 	spin_lock(&pispbe->hw_lock);
 	list_add_tail(&job->queue, &pispbe->job_queue);
@@ -556,13 +642,17 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe)
 
 err_return_buffers:
 	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
-		struct pispbe_node *n =  &pispbe->node[i];
-
 		if (!buf[i])
 			continue;
 
 		/* Return the buffer to the ready_list queue */
-		list_add(&buf[i]->ready_list, &n->ready_queue);
+		ctx = pispbe_get_dev_context(mdev_context,
+					     &pispbe->node[i].vfd);
+		if (!ctx)
+			continue;
+
+		list_add(&buf[i]->ready_list, &ctx->ready_queue);
+		pispbe_put_dev_context(ctx);
 	}
 
 	kfree(job);
@@ -570,7 +660,9 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe)
 	return -ENODEV;
 }
 
-static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
+static void pispbe_schedule(struct pispbe_dev *pispbe,
+			    struct pispbe_media_context *mdev_context,
+			    bool clear_hw_busy)
 {
 	struct pispbe_job_descriptor *job;
 
@@ -674,18 +766,20 @@ static irqreturn_t pispbe_isr(int irq, void *dev)
 	}
 
 	/* check if there's more to do before going to sleep */
-	pispbe_schedule(pispbe, can_queue_another);
+	pispbe_schedule(pispbe, NULL, can_queue_another);
 
 	return IRQ_HANDLED;
 }
 
 static int pisp_be_validate_config(struct pispbe_dev *pispbe,
+				   struct pispbe_media_context *mdev_context,
 				   struct pisp_be_tiles_config *config)
 {
 	u32 bayer_enables = config->config.global.bayer_enables;
 	u32 rgb_enables = config->config.global.rgb_enables;
+	struct pispbe_entity_context *context;
+	struct v4l2_pix_format_mplane *mp;
 	struct device *dev = pispbe->dev;
-	struct v4l2_format *fmt;
 	unsigned int bpl, size;
 
 	if (!(bayer_enables & PISP_BE_BAYER_ENABLE_INPUT) ==
@@ -702,36 +796,50 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
 	}
 
 	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
-	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
+	context = pispbe_get_dev_context(mdev_context,
+					 &pispbe->node[TDN_OUTPUT_NODE].vfd);
+	if (!context)
+		return -EINVAL;
+
+	mp = &context->format.fmt.pix_mp;
+	pispbe_put_dev_context(context);
+
 	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
 		bpl = config->config.tdn_output_format.stride;
 		size = bpl * config->config.tdn_output_format.height;
 
-		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
+		if (mp->plane_fmt[0].bytesperline < bpl) {
 			dev_dbg(dev, "%s: bpl mismatch on tdn_output\n",
 				__func__);
 			return -EINVAL;
 		}
 
-		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
+		if (mp->plane_fmt[0].sizeimage < size) {
 			dev_dbg(dev, "%s: size mismatch on tdn_output\n",
 				__func__);
 			return -EINVAL;
 		}
 	}
 
-	fmt = &pispbe->node[STITCH_OUTPUT_NODE].format;
+	context = pispbe_get_dev_context(mdev_context,
+					 &pispbe->node[STITCH_OUTPUT_NODE].vfd);
+	if (!context)
+		return -EINVAL;
+
+	mp = &context->format.fmt.pix_mp;
+	pispbe_put_dev_context(context);
+
 	if (bayer_enables & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) {
 		bpl = config->config.stitch_output_format.stride;
 		size = bpl * config->config.stitch_output_format.height;
 
-		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
+		if (mp->plane_fmt[0].bytesperline < bpl) {
 			dev_dbg(dev, "%s: bpl mismatch on stitch_output\n",
 				__func__);
 			return -EINVAL;
 		}
 
-		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
+		if (mp->plane_fmt[0].sizeimage < size) {
 			dev_dbg(dev, "%s: size mismatch on stitch_output\n",
 				__func__);
 			return -EINVAL;
@@ -746,8 +854,15 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
 		    PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
 			continue; /* TODO: Size checks for wallpaper formats */
 
-		fmt = &pispbe->node[OUTPUT0_NODE + j].format;
-		for (unsigned int i = 0; i < fmt->fmt.pix_mp.num_planes; i++) {
+		context = pispbe_get_dev_context(mdev_context,
+					  &pispbe->node[OUTPUT0_NODE + j].vfd);
+		if (!context)
+			return -EINVAL;
+
+		mp = &context->format.fmt.pix_mp;
+		pispbe_put_dev_context(context);
+
+		for (unsigned int i = 0; i < mp->num_planes; i++) {
 			bpl = !i ? config->config.output_format[j].image.stride
 			    : config->config.output_format[j].image.stride2;
 			size = bpl * config->config.output_format[j].image.height;
@@ -756,13 +871,15 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
 						PISP_IMAGE_FORMAT_SAMPLING_420)
 				size >>= 1;
 
-			if (fmt->fmt.pix_mp.plane_fmt[i].bytesperline < bpl) {
+			if (mp->plane_fmt[i].bytesperline < bpl) {
 				dev_dbg(dev, "%s: bpl mismatch on output %d\n",
 					__func__, j);
+				dev_dbg(dev, "Expected %u, got %u\n",
+					bpl, mp->plane_fmt[i].bytesperline);
 				return -EINVAL;
 			}
 
-			if (fmt->fmt.pix_mp.plane_fmt[i].sizeimage < size) {
+			if (mp->plane_fmt[i].sizeimage < size) {
 				dev_dbg(dev, "%s: size mismatch on output\n",
 					__func__);
 				return -EINVAL;
@@ -777,10 +894,12 @@ static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 				   unsigned int *nplanes, unsigned int sizes[],
 				   struct device *alloc_devs[])
 {
+	struct pispbe_entity_context *context = pispbe_entity_context_from_queue(q);
+	struct v4l2_format *format = &context->format;
 	struct pispbe_node *node = vb2_get_drv_priv(q);
 	struct pispbe_dev *pispbe = node->pispbe;
 	unsigned int num_planes = NODE_IS_MPLANE(node) ?
-				  node->format.fmt.pix_mp.num_planes : 1;
+				  format->fmt.pix_mp.num_planes : 1;
 
 	if (*nplanes) {
 		if (*nplanes != num_planes)
@@ -788,8 +907,8 @@ static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 
 		for (unsigned int i = 0; i < *nplanes; i++) {
 			unsigned int size = NODE_IS_MPLANE(node) ?
-				node->format.fmt.pix_mp.plane_fmt[i].sizeimage :
-				node->format.fmt.meta.buffersize;
+				format->fmt.pix_mp.plane_fmt[i].sizeimage :
+				format->fmt.meta.buffersize;
 
 			if (sizes[i] < size)
 				return -EINVAL;
@@ -801,8 +920,8 @@ static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 	*nplanes = num_planes;
 	for (unsigned int i = 0; i < *nplanes; i++) {
 		unsigned int size = NODE_IS_MPLANE(node) ?
-				node->format.fmt.pix_mp.plane_fmt[i].sizeimage :
-				node->format.fmt.meta.buffersize;
+				    format->fmt.pix_mp.plane_fmt[i].sizeimage :
+				    format->fmt.meta.buffersize;
 		sizes[i] = size;
 	}
 
@@ -815,15 +934,21 @@ static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 
 static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 {
-	struct pispbe_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_queue *q = vb->vb2_queue;
+	struct pispbe_entity_context *context =
+					pispbe_entity_context_from_queue(q);
+	struct pispbe_media_context *mdev_context =
+					pispbe_media_context_from_dev(context);
+	struct v4l2_format *format = &context->format;
+	struct pispbe_node *node = context->node;
 	struct pispbe_dev *pispbe = node->pispbe;
 	unsigned int num_planes = NODE_IS_MPLANE(node) ?
-				  node->format.fmt.pix_mp.num_planes : 1;
+				  format->fmt.pix_mp.num_planes : 1;
 
 	for (unsigned int i = 0; i < num_planes; i++) {
 		unsigned long size = NODE_IS_MPLANE(node) ?
-				node->format.fmt.pix_mp.plane_fmt[i].sizeimage :
-				node->format.fmt.meta.buffersize;
+				     format->fmt.pix_mp.plane_fmt[i].sizeimage :
+				     format->fmt.meta.buffersize;
 
 		if (vb2_plane_size(vb, i) < size) {
 			dev_dbg(pispbe->dev,
@@ -841,7 +966,7 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 
 		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
 
-		return pisp_be_validate_config(pispbe, dst);
+		return pisp_be_validate_config(pispbe, mdev_context, dst);
 	}
 
 	return 0;
@@ -849,53 +974,67 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 
 static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 {
-	struct vb2_v4l2_buffer *vbuf =
-		container_of(buf, struct vb2_v4l2_buffer, vb2_buf);
-	struct pispbe_buffer *buffer =
-		container_of(vbuf, struct pispbe_buffer, vb);
-	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = container_of(buf, struct vb2_v4l2_buffer,
+						    vb2_buf);
+	struct pispbe_buffer *buffer = container_of(vbuf, struct pispbe_buffer,
+						    vb);
+	struct vb2_queue *q = buf->vb2_queue;
+	struct pispbe_entity_context *context =
+					pispbe_entity_context_from_queue(q);
+	struct pispbe_media_context *mdev_context =
+					pispbe_media_context_from_dev(context);
+	struct pispbe_node *node = context->node;
 	struct pispbe_dev *pispbe = node->pispbe;
 
 	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
-	list_add_tail(&buffer->ready_list, &node->ready_queue);
+	list_add_tail(&buffer->ready_list, &context->ready_queue);
 
 	/*
 	 * Every time we add a buffer, check if there's now some work for the hw
 	 * to do.
 	 */
-	if (!pispbe_prepare_job(pispbe))
-		pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe, context))
+		pispbe_schedule(pispbe, mdev_context, false);
 }
 
 static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct pispbe_node *node = vb2_get_drv_priv(q);
+	struct pispbe_entity_context *context =
+					pispbe_entity_context_from_queue(q);
+	struct pispbe_media_context *mdev_context =
+					pispbe_media_context_from_dev(context);
+	struct pispbe_node *node = context->node;
 	struct pispbe_dev *pispbe = node->pispbe;
 	struct pispbe_buffer *buf, *tmp;
 	int ret;
 
+	ret = video_device_context_pipeline_start(&context->vdev_context,
+						  &pispbe->pipe);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret < 0)
 		goto err_return_buffers;
 
 	spin_lock_irq(&pispbe->hw_lock);
-	node->pispbe->streaming_map |=  BIT(node->id);
+	mdev_context->streaming_map |=  BIT(node->id);
 	node->pispbe->sequence = 0;
 	spin_unlock_irq(&pispbe->hw_lock);
 
 	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
 		__func__, NODE_NAME(node), count);
 	dev_dbg(pispbe->dev, "Nodes streaming now 0x%x\n",
-		node->pispbe->streaming_map);
+		mdev_context->streaming_map);
 
 	/* Maybe we're ready to run. */
-	if (!pispbe_prepare_job(pispbe))
-		pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe, context))
+		pispbe_schedule(pispbe, mdev_context, false);
 
 	return 0;
 
 err_return_buffers:
-	list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
+	list_for_each_entry_safe(buf, tmp, &context->ready_queue, ready_list) {
 		list_del(&buf->ready_list);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
@@ -905,7 +1044,11 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 
 static void pispbe_node_stop_streaming(struct vb2_queue *q)
 {
-	struct pispbe_node *node = vb2_get_drv_priv(q);
+	struct pispbe_entity_context *context =
+					pispbe_entity_context_from_queue(q);
+	struct pispbe_media_context *mdev_context =
+					pispbe_media_context_from_dev(context);
+	struct pispbe_node *node = context->node;
 	struct pispbe_dev *pispbe = node->pispbe;
 	struct pispbe_buffer *buf;
 
@@ -920,7 +1063,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 	 */
 	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
 	do {
-		buf = list_first_entry_or_null(&node->ready_queue,
+		buf = list_first_entry_or_null(&context->ready_queue,
 					       struct pispbe_buffer,
 					       ready_list);
 		if (buf) {
@@ -929,13 +1072,13 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 		}
 	} while (buf);
 
-	vb2_wait_for_all_buffers(&node->queue);
+	vb2_wait_for_all_buffers(&context->vdev_context.queue);
 
 	spin_lock_irq(&pispbe->hw_lock);
-	pispbe->streaming_map &= ~BIT(node->id);
+	mdev_context->streaming_map &= ~BIT(node->id);
 
 	/* Release all jobs once all nodes have stopped streaming. */
-	if (pispbe->streaming_map == 0) {
+	if (mdev_context->streaming_map == 0) {
 		struct pispbe_job_descriptor *job, *temp;
 
 		list_for_each_entry_safe(job, temp, &pispbe->job_queue, queue) {
@@ -948,8 +1091,10 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 	pm_runtime_mark_last_busy(pispbe->dev);
 	pm_runtime_put_autosuspend(pispbe->dev);
 
+	video_device_pipeline_stop(context->vdev_context.vdev);
+
 	dev_dbg(pispbe->dev, "Nodes streaming now 0x%x\n",
-		pispbe->streaming_map);
+		mdev_context->streaming_map);
 }
 
 static const struct vb2_ops pispbe_node_queue_ops = {
@@ -990,6 +1135,8 @@ static int pispbe_node_g_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 
 	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
 		dev_dbg(pispbe->dev,
@@ -998,7 +1145,7 @@ static int pispbe_node_g_fmt_vid_cap(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	*f = node->format;
+	*f = context->format;
 	dev_dbg(pispbe->dev, "Get capture format for node %s\n",
 		NODE_NAME(node));
 
@@ -1010,6 +1157,8 @@ static int pispbe_node_g_fmt_vid_out(struct file *file, void *priv,
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 
 	if (NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
 		dev_dbg(pispbe->dev,
@@ -1018,7 +1167,7 @@ static int pispbe_node_g_fmt_vid_out(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	*f = node->format;
+	*f = context->format;
 	dev_dbg(pispbe->dev, "Get output format for node %s\n",
 		NODE_NAME(node));
 
@@ -1030,6 +1179,8 @@ static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 
 	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
 		dev_dbg(pispbe->dev,
@@ -1038,7 +1189,7 @@ static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	*f = node->format;
+	*f = context->format;
 	dev_dbg(pispbe->dev, "Get output format for meta node %s\n",
 		NODE_NAME(node));
 
@@ -1206,17 +1357,19 @@ static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 	int ret;
 
 	ret = pispbe_node_try_fmt_vid_cap(file, priv, f);
 	if (ret < 0)
 		return ret;
 
-	if (vb2_is_busy(&node->queue))
+	if (vb2_is_busy(&context->vdev_context.queue))
 		return -EBUSY;
 
-	node->format = *f;
-	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
+	context->format = *f;
+	context->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
 
 	dev_dbg(pispbe->dev, "Set capture format for node %s to %p4cc\n",
 		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
@@ -1229,17 +1382,19 @@ static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 	int ret;
 
 	ret = pispbe_node_try_fmt_vid_out(file, priv, f);
 	if (ret < 0)
 		return ret;
 
-	if (vb2_is_busy(&node->queue))
+	if (vb2_is_busy(&context->vdev_context.queue))
 		return -EBUSY;
 
-	node->format = *f;
-	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
+	context->format = *f;
+	context->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
 
 	dev_dbg(pispbe->dev, "Set output format for node %s to %p4cc\n",
 		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
@@ -1252,17 +1407,19 @@ static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
 {
 	struct pispbe_node *node = video_drvdata(file);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 	int ret;
 
 	ret = pispbe_node_try_fmt_meta_out(file, priv, f);
 	if (ret < 0)
 		return ret;
 
-	if (vb2_is_busy(&node->queue))
+	if (vb2_is_busy(&context->vdev_context.queue))
 		return -EBUSY;
 
-	node->format = *f;
-	node->pisp_format = &meta_out_supported_formats[0];
+	context->format = *f;
+	context->pisp_format = &meta_out_supported_formats[0];
 
 	dev_dbg(pispbe->dev, "Set output format for meta node %s to %p4cc\n",
 		NODE_NAME(node), &f->fmt.meta.dataformat);
@@ -1274,8 +1431,10 @@ static int pispbe_node_enum_fmt(struct file *file, void  *priv,
 				struct v4l2_fmtdesc *f)
 {
 	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_entity_context *context =
+			pispbe_entity_context_from_file(file, &node->vfd);
 
-	if (f->type != node->queue.type)
+	if (f->type != context->vdev_context.queue.type)
 		return -EINVAL;
 
 	if (NODE_IS_META(node)) {
@@ -1349,24 +1508,16 @@ static const struct v4l2_ioctl_ops pispbe_node_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static const struct video_device pispbe_videodev = {
-	.name = PISPBE_NAME,
-	.vfl_dir = VFL_DIR_M2M, /* gets overwritten */
-	.fops = &pispbe_fops,
-	.ioctl_ops = &pispbe_node_ioctl_ops,
-	.minor = -1,
-	.release = video_device_release_empty,
-};
-
-static void pispbe_node_def_fmt(struct pispbe_node *node)
+static void pispbe_node_def_fmt(struct pispbe_node *node,
+				struct pispbe_entity_context *context)
 {
+	struct v4l2_format *format = &context->format;
+
 	if (NODE_IS_META(node) && NODE_IS_OUTPUT(node)) {
 		/* Config node */
-		struct v4l2_format *f = &node->format;
-
-		f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
-		f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
-		f->type = node->buf_type;
+		format->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
+		format->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
+		format->type = node->buf_type;
 	} else {
 		struct v4l2_format f = {
 			.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420,
@@ -1375,36 +1526,39 @@ static void pispbe_node_def_fmt(struct pispbe_node *node)
 			.type = node->buf_type,
 		};
 		pispbe_try_format(&f, node);
-		node->format = f;
+		*format = f;
 	}
 
-	node->pisp_format = pispbe_find_fmt(node->format.fmt.pix_mp.pixelformat);
+	context->pisp_format = pispbe_find_fmt(format->fmt.pix_mp.pixelformat);
 }
 
-/*
- * Initialise a struct pispbe_node and register it as /dev/video<N>
- * to represent one of the PiSP Back End's input or output streams.
- */
-static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
+static int pispbe_alloc_entity_context(struct media_entity *entity,
+				       struct media_entity_context **ctx)
 {
-	bool output = NODE_DESC_IS_OUTPUT(&node_desc[id]);
-	struct pispbe_node *node = &pispbe->node[id];
-	struct media_entity *entity = &node->vfd.entity;
-	struct video_device *vdev = &node->vfd;
-	struct vb2_queue *q = &node->queue;
+	struct video_device *vdev = container_of(entity, struct video_device,
+						 entity);
+	struct pispbe_node *node = pispbe_node_from_vdev(vdev);
+	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_entity_context *context;
+	struct vb2_queue *q;
 	int ret;
 
-	node->id = id;
-	node->pispbe = pispbe;
-	node->buf_type = node_desc[id].buf_type;
+	*ctx = kzalloc(sizeof(*context), GFP_KERNEL);
+	if (!*ctx)
+		return -ENOMEM;
+	context = (struct pispbe_entity_context *)*ctx;
 
-	mutex_init(&node->node_lock);
-	mutex_init(&node->queue_lock);
-	INIT_LIST_HEAD(&node->ready_queue);
+	video_device_init_context(vdev, &context->vdev_context);
+
+	context->pispbe = pispbe;
+	context->node = node;
+
+	INIT_LIST_HEAD(&context->ready_queue);
 
-	node->format.type = node->buf_type;
-	pispbe_node_def_fmt(node);
+	context->format.type = node->buf_type;
+	pispbe_node_def_fmt(node, context);
 
+	q = &context->vdev_context.queue;
 	q->type = node->buf_type;
 	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->mem_ops = &vb2_dma_contig_memops;
@@ -1414,41 +1568,92 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->dev = pispbe->dev;
 	/* get V4L2 to handle node->queue locking */
-	q->lock = &node->queue_lock;
+	q->lock = &context->vdev_context.queue_lock;
 
 	ret = vb2_queue_init(q);
 	if (ret < 0) {
 		dev_err(pispbe->dev, "vb2_queue_init failed\n");
-		goto err_mutex_destroy;
+		goto err_cleanup;
 	}
 
+	return 0;
+
+err_cleanup:
+	kfree(*ctx);
+	return ret;
+}
+
+static void pispbe_free_entity_context(struct media_entity_context *ctx)
+{
+	struct pispbe_entity_context *context =
+					(struct pispbe_entity_context *)ctx;
+
+	list_del_init(&context->ready_queue);
+	video_device_cleanup_context(&context->vdev_context);
+	kfree(context);
+}
+
+static const struct media_entity_operations pispbe_media_entity_ops = {
+	.alloc_context = pispbe_alloc_entity_context,
+	.destroy_context = pispbe_free_entity_context,
+};
+
+static const struct video_device pispbe_videodev = {
+	.name = PISPBE_NAME,
+	.vfl_dir = VFL_DIR_M2M, /* gets overwritten */
+	.fops = &pispbe_fops,
+	.ioctl_ops = &pispbe_node_ioctl_ops,
+	.minor = -1,
+	.release = video_device_release_empty,
+};
+
+/*
+ * Initialise a struct pispbe_node and register it as /dev/video<N>
+ * to represent one of the PiSP Back End's input or output streams.
+ */
+static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
+{
+	bool output = NODE_DESC_IS_OUTPUT(&node_desc[id]);
+	struct pispbe_node *node = &pispbe->node[id];
+	struct media_entity *entity = &node->vfd.entity;
+	struct video_device *vdev = &node->vfd;
+	int ret;
+
+	node->id = id;
+	node->pispbe = pispbe;
+	node->buf_type = node_desc[id].buf_type;
+
+	mutex_init(&node->node_lock);
+
 	*vdev = pispbe_videodev; /* default initialization */
 	strscpy(vdev->name, node_desc[id].ent_name, sizeof(vdev->name));
 	vdev->v4l2_dev = &pispbe->v4l2_dev;
 	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
 	/* get V4L2 to serialise our ioctls */
 	vdev->lock = &node->node_lock;
-	vdev->queue = &node->queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | node_desc[id].caps;
 
+	vdev->entity.ops = &pispbe_media_entity_ops;
+
 	node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(entity, 1, &node->pad);
 	if (ret) {
 		dev_err(pispbe->dev,
 			"Failed to register media pads for %s device node\n",
 			NODE_NAME(node));
-		goto err_unregister_queue;
+		goto err_mutex_destroy;
 	}
 
+	video_set_drvdata(vdev, node);
+
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO,
 				    PISPBE_VIDEO_NODE_OFFSET);
 	if (ret) {
 		dev_err(pispbe->dev,
 			"Failed to register video %s device node\n",
 			NODE_NAME(node));
-		goto err_unregister_queue;
+		goto err_mutex_destroy;
 	}
-	video_set_drvdata(vdev, node);
 
 	if (output)
 		ret = media_create_pad_link(entity, 0, &pispbe->sd.entity,
@@ -1468,11 +1673,8 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 
 err_unregister_video_dev:
 	video_unregister_device(&node->vfd);
-err_unregister_queue:
-	vb2_queue_release(&node->queue);
 err_mutex_destroy:
 	mutex_destroy(&node->node_lock);
-	mutex_destroy(&node->queue_lock);
 	return ret;
 }
 
@@ -1484,6 +1686,38 @@ static const struct v4l2_subdev_ops pispbe_sd_ops = {
 	.pad = &pispbe_pad_ops,
 };
 
+static int pispbe_media_alloc_context(struct media_device *mdev,
+				      struct media_device_context **ctx)
+{
+	struct pispbe_media_context *context;
+
+	*ctx = kzalloc(sizeof(*context), GFP_KERNEL);
+	if (!*ctx)
+		return -ENOMEM;
+	context = (struct pispbe_media_context *)*ctx;
+
+	media_device_init_context(mdev, &context->mdev_context);
+
+	context->streaming_map = 0;
+
+	return 0;
+}
+
+static void pispbe_media_destroy_context(struct media_device_context *ctx)
+{
+	struct pispbe_media_context *context =
+					(struct pispbe_media_context *)ctx;
+
+	context->streaming_map = 0;
+	media_device_cleanup_context(&context->mdev_context);
+	kfree(context);
+}
+
+static const struct media_device_ops pispbe_media_device_ops = {
+	.alloc_context = pispbe_media_alloc_context,
+	.destroy_context = pispbe_media_destroy_context,
+};
+
 static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 {
 	struct v4l2_subdev *sd = &pispbe->sd;
@@ -1527,6 +1761,7 @@ static int pispbe_init_devices(struct pispbe_dev *pispbe)
 	mdev = &pispbe->mdev;
 	mdev->hw_revision = pispbe->hw_version;
 	mdev->dev = pispbe->dev;
+	mdev->ops = &pispbe_media_device_ops;
 	strscpy(mdev->model, PISPBE_NAME, sizeof(mdev->model));
 	media_device_init(mdev);
 
@@ -1570,10 +1805,8 @@ static int pispbe_init_devices(struct pispbe_dev *pispbe)
 err_unregister_mdev:
 	media_device_unregister(mdev);
 err_unregister_nodes:
-	while (num_regist-- > 0) {
+	while (num_regist-- > 0)
 		video_unregister_device(&pispbe->node[num_regist].vfd);
-		vb2_queue_release(&pispbe->node[num_regist].queue);
-	}
 	v4l2_device_unregister_subdev(&pispbe->sd);
 	media_entity_cleanup(&pispbe->sd.entity);
 err_unregister_v4l2:
@@ -1601,9 +1834,7 @@ static void pispbe_destroy_devices(struct pispbe_dev *pispbe)
 
 	for (int i = PISPBE_NUM_NODES - 1; i >= 0; i--) {
 		video_unregister_device(&pispbe->node[i].vfd);
-		vb2_queue_release(&pispbe->node[i].queue);
 		mutex_destroy(&pispbe->node[i].node_lock);
-		mutex_destroy(&pispbe->node[i].queue_lock);
 	}
 
 	media_device_cleanup(&pispbe->mdev);
-- 
2.46.0


