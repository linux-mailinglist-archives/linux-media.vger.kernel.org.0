Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66769ED382
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 15:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbfKCOBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 09:01:55 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57831 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727350AbfKCOBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 09:01:55 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id RGRqiVq7T9P9bRGRtiTPhK; Sun, 03 Nov 2019 15:01:45 +0100
Subject: [PATCH 9/8] vivid: add vivid_create_queue() helper
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
Message-ID: <ca2927d6-1f62-4224-bcfa-605c710038e6@xs4all.nl>
Date:   Sun, 3 Nov 2019 15:01:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPgnQQJ0Rj1XrHrorVRGOezmuLQHQPAggBZs12AHXOS3sU2C03j2DNrByGa13ow5flEnZJvowtqJtw02r5KisPMU8bWpw2xHvv4BFvr9FXxA9kV4WVWQ
 FizPI/whmUMoOwa1HWhNEjMI7ZLVLKOtBktzd4ofwpcS+MG+x2IDjwfIVSc6ZKMoElVMPP0wrW7qlw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor some of the vivid_create_instance code by using a
new vivid_create_queue() helper function.

Also add some sanity checks for the node_types vs input/output_types
module options.

This patch resolves these two smatch parse errors:

drivers/media/platform/vivid/vivid-core.c:1679 vivid_create_instance() parse error: OOM: 3002600Kb sm_state_count = 6160113
drivers/media/platform/vivid/vivid-core.c: /home/hans/work/build/media-git/drivers/media/platform/vivid/vivid-core.c:1679
vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 33 seconds

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vivid/vivid-cec.c  |   7 +-
 drivers/media/platform/vivid/vivid-core.c | 257 ++++++++++------------
 drivers/media/platform/vivid/vivid-core.h |   1 +
 3 files changed, 116 insertions(+), 149 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-cec.c b/drivers/media/platform/vivid/vivid-cec.c
index 4d822dbed972..4d2413e87730 100644
--- a/drivers/media/platform/vivid/vivid-cec.c
+++ b/drivers/media/platform/vivid/vivid-cec.c
@@ -276,12 +276,11 @@ struct cec_adapter *vivid_cec_alloc_adap(struct vivid_dev *dev,
 					 unsigned int idx,
 					 bool is_source)
 {
-	char name[sizeof(dev->vid_out_dev.name) + 2];
 	u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL | CEC_CAP_MONITOR_PIN;
+	char name[32];

-	snprintf(name, sizeof(name), "%s%d",
-		 is_source ? dev->vid_out_dev.name : dev->vid_cap_dev.name,
-		 idx);
+	snprintf(name, sizeof(name), "vivid-%03d-vid-%s%d",
+		 dev->inst, is_source ? "out" : "cap", idx);
 	return cec_allocate_adapter(&vivid_cec_adap_ops, dev,
 		name, caps, 1);
 }
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index dadfc59c92c5..4d4d6dd01784 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -677,14 +677,44 @@ static const struct media_device_ops vivid_media_ops = {
 };
 #endif

+static int vivid_create_queue(struct vivid_dev *dev,
+			      struct vb2_queue *q,
+			      u32 buf_type,
+			      unsigned int min_buffers_needed,
+			      const struct vb2_ops *ops)
+{
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE && dev->multiplanar)
+		buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	else if (buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT && dev->multiplanar)
+		buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	else if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE && !dev->has_raw_vbi_cap)
+		buf_type = V4L2_BUF_TYPE_SLICED_VBI_CAPTURE;
+	else if (buf_type == V4L2_BUF_TYPE_VBI_OUTPUT && !dev->has_raw_vbi_out)
+		buf_type = V4L2_BUF_TYPE_SLICED_VBI_OUTPUT;
+
+	q->type = buf_type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
+	if (allocators[dev->inst] != 1)
+		q->io_modes |= VB2_USERPTR;
+	q->drv_priv = dev;
+	q->buf_struct_size = sizeof(struct vivid_buffer);
+	q->ops = ops;
+	q->mem_ops = allocators[dev->inst] == 1 ? &vb2_dma_contig_memops :
+						  &vb2_vmalloc_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = min_buffers_needed;
+	q->lock = &dev->mutex;
+	q->dev = dev->v4l2_dev.dev;
+	q->supports_requests = true;
+
+	return vb2_queue_init(q);
+}
+
 static int vivid_create_instance(struct platform_device *pdev, int inst)
 {
 	static const struct v4l2_dv_timings def_dv_timings =
 					V4L2_DV_BT_CEA_1280X720P60;
-	static const struct vb2_mem_ops * const vivid_mem_ops[2] = {
-		&vb2_vmalloc_memops,
-		&vb2_dma_contig_memops,
-	};
 	unsigned in_type_counter[4] = { 0, 0, 0, 0 };
 	unsigned out_type_counter[4] = { 0, 0, 0, 0 };
 	int ccs_cap = ccs_cap_mode[inst];
@@ -693,9 +723,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	bool has_modulator;
 	struct vivid_dev *dev;
 	struct video_device *vfd;
-	struct vb2_queue *q;
 	unsigned node_type = node_types[inst];
-	unsigned int allocator = allocators[inst];
 	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
 	int ret;
 	int i;
@@ -790,6 +818,25 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		dev->has_vbi_cap = dev->has_raw_vbi_cap | dev->has_sliced_vbi_cap;
 	}

+	/* do we create a meta capture device */
+	dev->has_meta_cap = node_type & 0x20000;
+
+	/* sanity checks */
+	if ((in_type_counter[WEBCAM] || in_type_counter[HDMI]) &&
+	    !dev->has_vid_cap && !dev->has_meta_cap) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "Webcam or HDMI input without video or metadata nodes\n");
+		kfree(dev);
+		return -EINVAL;
+	}
+	if ((in_type_counter[TV] || in_type_counter[SVID]) &&
+	    !dev->has_vid_cap && !dev->has_vbi_cap && !dev->has_meta_cap) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "TV or S-Video input without video, VBI or metadata nodes\n");
+		kfree(dev);
+		return -EINVAL;
+	}
+
 	/* do we create a video output device? */
 	dev->has_vid_out = node_type & 0x0100;

@@ -800,6 +847,24 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		dev->has_vbi_out = dev->has_raw_vbi_out | dev->has_sliced_vbi_out;
 	}

+	/* do we create a metadata output device */
+	dev->has_meta_out = node_type & 0x40000;
+
+	/* sanity checks */
+	if (out_type_counter[SVID] &&
+	    !dev->has_vid_out && !dev->has_vbi_out && !dev->has_meta_out) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "S-Video output without video, VBI or metadata nodes\n");
+		kfree(dev);
+		return -EINVAL;
+	}
+	if (out_type_counter[HDMI] && !dev->has_vid_out && !dev->has_meta_out) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "HDMI output without video or metadata nodes\n");
+		kfree(dev);
+		return -EINVAL;
+	}
+
 	/* do we create a radio receiver device? */
 	dev->has_radio_rx = node_type & 0x0010;

@@ -809,6 +874,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	/* do we create a software defined radio capture device? */
 	dev->has_sdr_cap = node_type & 0x0020;

+	/* do we have a TV tuner? */
+	dev->has_tv_tuner = in_type_counter[TV];
+
 	/* do we have a tuner? */
 	has_tuner = ((dev->has_vid_cap || dev->has_vbi_cap) && in_type_counter[TV]) ||
 		    dev->has_radio_rx || dev->has_sdr_cap;
@@ -850,12 +918,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			dev->has_scaler_out ? 'Y' : 'N');
 	}

-	/* do we create a meta capture device */
-	dev->has_meta_cap = node_type & 0x20000;
-
-	/* do we create a metadata output device */
-	dev->has_meta_out = node_type & 0x40000;
-
 	/* end detecting feature set */

 	if (dev->has_vid_cap) {
@@ -866,7 +928,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		dev->vid_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 		if (dev->has_audio_inputs)
 			dev->vid_cap_caps |= V4L2_CAP_AUDIO;
-		if (in_type_counter[TV])
+		if (dev->has_tv_tuner)
 			dev->vid_cap_caps |= V4L2_CAP_TUNER;
 	}
 	if (dev->has_vid_out) {
@@ -887,7 +949,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		dev->vbi_cap_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 		if (dev->has_audio_inputs)
 			dev->vbi_cap_caps |= V4L2_CAP_AUDIO;
-		if (in_type_counter[TV])
+		if (dev->has_tv_tuner)
 			dev->vbi_cap_caps |= V4L2_CAP_TUNER;
 	}
 	if (dev->has_vbi_out) {
@@ -919,7 +981,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 		if (dev->has_audio_inputs)
 			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
-		if (in_type_counter[TV])
+		if (dev->has_tv_tuner)
 			dev->meta_cap_caps |= V4L2_CAP_TUNER;
 	}
 	/* set up the capabilities of meta output device */
@@ -1162,181 +1224,82 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		goto unreg_dev;
 	}

-	if (allocator == 1)
+	if (allocators[inst] == 1)
 		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-	else if (allocator >= ARRAY_SIZE(vivid_mem_ops))
-		allocator = 0;

 	/* start creating the vb2 queues */
 	if (dev->has_vid_cap) {
-		snprintf(dev->vid_cap_dev.name, sizeof(dev->vid_cap_dev.name),
-			 "vivid-%03d-vid-cap", inst);
 		/* initialize vid_cap queue */
-		q = &dev->vb_vid_cap_q;
-		q->type = dev->multiplanar ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
-			V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_vid_cap_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 2;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_vid_cap_q,
+					 V4L2_BUF_TYPE_VIDEO_CAPTURE, 2,
+					 &vivid_vid_cap_qops);
 		if (ret)
 			goto unreg_dev;
 	}

 	if (dev->has_vid_out) {
-		snprintf(dev->vid_out_dev.name, sizeof(dev->vid_out_dev.name),
-			 "vivid-%03d-vid-out", inst);
 		/* initialize vid_out queue */
-		q = &dev->vb_vid_out_q;
-		q->type = dev->multiplanar ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
-			V4L2_BUF_TYPE_VIDEO_OUTPUT;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_WRITE;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_vid_out_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 2;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_vid_out_q,
+					 V4L2_BUF_TYPE_VIDEO_OUTPUT, 2,
+					 &vivid_vid_out_qops);
 		if (ret)
 			goto unreg_dev;
 	}

 	if (dev->has_vbi_cap) {
 		/* initialize vbi_cap queue */
-		q = &dev->vb_vbi_cap_q;
-		q->type = dev->has_raw_vbi_cap ? V4L2_BUF_TYPE_VBI_CAPTURE :
-					      V4L2_BUF_TYPE_SLICED_VBI_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_vbi_cap_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 2;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_vbi_cap_q,
+					 V4L2_BUF_TYPE_VBI_CAPTURE, 2,
+					 &vivid_vbi_cap_qops);
 		if (ret)
 			goto unreg_dev;
 	}

 	if (dev->has_vbi_out) {
 		/* initialize vbi_out queue */
-		q = &dev->vb_vbi_out_q;
-		q->type = dev->has_raw_vbi_out ? V4L2_BUF_TYPE_VBI_OUTPUT :
-					      V4L2_BUF_TYPE_SLICED_VBI_OUTPUT;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_WRITE;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_vbi_out_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 2;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_vbi_out_q,
+					 V4L2_BUF_TYPE_VBI_OUTPUT, 2,
+					 &vivid_vbi_out_qops);
 		if (ret)
 			goto unreg_dev;
 	}

 	if (dev->has_sdr_cap) {
 		/* initialize sdr_cap queue */
-		q = &dev->vb_sdr_cap_q;
-		q->type = V4L2_BUF_TYPE_SDR_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_sdr_cap_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 8;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_sdr_cap_q,
+					 V4L2_BUF_TYPE_SDR_CAPTURE, 8,
+					 &vivid_sdr_cap_qops);
 		if (ret)
 			goto unreg_dev;
 	}

-	if (dev->has_fb) {
-		/* Create framebuffer for testing capture/output overlay */
-		ret = vivid_fb_init(dev);
-		if (ret)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
-				dev->fb_info.node);
-	}
-
 	if (dev->has_meta_cap) {
 		/* initialize meta_cap queue */
-		q = &dev->vb_meta_cap_q;
-		q->type = V4L2_BUF_TYPE_META_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_meta_cap_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 2;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_meta_cap_q,
+					 V4L2_BUF_TYPE_META_CAPTURE, 2,
+					 &vivid_meta_cap_qops);
 		if (ret)
 			goto unreg_dev;
 	}

 	if (dev->has_meta_out) {
 		/* initialize meta_out queue */
-		q = &dev->vb_meta_out_q;
-		q->type = V4L2_BUF_TYPE_META_OUTPUT;
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_WRITE;
-		if (!allocator)
-			q->io_modes |= VB2_USERPTR;
-		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct vivid_buffer);
-		q->ops = &vivid_meta_out_qops;
-		q->mem_ops = vivid_mem_ops[allocator];
-		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		q->min_buffers_needed = 1;
-		q->lock = &dev->mutex;
-		q->dev = dev->v4l2_dev.dev;
-		q->supports_requests = true;
-		ret = vb2_queue_init(q);
+		ret = vivid_create_queue(dev, &dev->vb_meta_out_q,
+					 V4L2_BUF_TYPE_META_OUTPUT, 1,
+					 &vivid_meta_out_qops);
 		if (ret)
 			goto unreg_dev;
 	}

+	if (dev->has_fb) {
+		/* Create framebuffer for testing capture/output overlay */
+		ret = vivid_fb_init(dev);
+		if (ret)
+			goto unreg_dev;
+		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
+			  dev->fb_info.node);
+	}
+
 #ifdef CONFIG_VIDEO_VIVID_CEC
 	if (dev->has_vid_cap && in_type_counter[HDMI]) {
 		struct cec_adapter *adap;
@@ -1383,6 +1346,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	/* finally start creating the device nodes */
 	if (dev->has_vid_cap) {
 		vfd = &dev->vid_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-vid-cap", inst);
 		vfd->fops = &vivid_fops;
 		vfd->ioctl_ops = &vivid_ioctl_ops;
 		vfd->device_caps = dev->vid_cap_caps;
@@ -1428,6 +1393,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)

 	if (dev->has_vid_out) {
 		vfd = &dev->vid_out_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-vid-out", inst);
 		vfd->vfl_dir = VFL_DIR_TX;
 		vfd->fops = &vivid_fops;
 		vfd->ioctl_ops = &vivid_ioctl_ops;
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index d57066ed31f0..59192b67231c 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -200,6 +200,7 @@ struct vivid_dev {
 	bool				has_fb;
 	bool				has_meta_cap;
 	bool				has_meta_out;
+	bool				has_tv_tuner;

 	bool				can_loop_video;

-- 
2.23.0


