Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97E33C77D2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 22:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbhGMUYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 16:24:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:18054 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235139AbhGMUYE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197421628"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="197421628"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="649643244"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2021 13:21:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0E780B9; Tue, 13 Jul 2021 23:21:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 2/6] media: ipu3-cio2: Use temporary storage for struct device pointer
Date:   Tue, 13 Jul 2021 23:21:27 +0300
Message-Id: <20210713202131.13906-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
References: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use temporary storage for struct device pointer to simplify the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 138 +++++++++---------
 1 file changed, 67 insertions(+), 71 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 5fb379e91071..d3358817db6f 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -103,26 +103,29 @@ static inline u32 cio2_bytesperline(const unsigned int width)
 
 static void cio2_fbpt_exit_dummy(struct cio2_device *cio2)
 {
+	struct device *dev = &cio2->pci_dev->dev;
+
 	if (cio2->dummy_lop) {
-		dma_free_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
-				  cio2->dummy_lop, cio2->dummy_lop_bus_addr);
+		dma_free_coherent(dev, PAGE_SIZE, cio2->dummy_lop,
+				  cio2->dummy_lop_bus_addr);
 		cio2->dummy_lop = NULL;
 	}
 	if (cio2->dummy_page) {
-		dma_free_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
-				  cio2->dummy_page, cio2->dummy_page_bus_addr);
+		dma_free_coherent(dev, PAGE_SIZE, cio2->dummy_page,
+				  cio2->dummy_page_bus_addr);
 		cio2->dummy_page = NULL;
 	}
 }
 
 static int cio2_fbpt_init_dummy(struct cio2_device *cio2)
 {
+	struct device *dev = &cio2->pci_dev->dev;
 	unsigned int i;
 
-	cio2->dummy_page = dma_alloc_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
+	cio2->dummy_page = dma_alloc_coherent(dev, PAGE_SIZE,
 					      &cio2->dummy_page_bus_addr,
 					      GFP_KERNEL);
-	cio2->dummy_lop = dma_alloc_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
+	cio2->dummy_lop = dma_alloc_coherent(dev, PAGE_SIZE,
 					     &cio2->dummy_lop_bus_addr,
 					     GFP_KERNEL);
 	if (!cio2->dummy_page || !cio2->dummy_lop) {
@@ -498,6 +501,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
+	struct device *dev = &cio2->pci_dev->dev;
 	void __iomem *const base = cio2->base;
 	unsigned int i;
 	u32 value;
@@ -515,8 +519,7 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 				 value, value & CIO2_CDMAC0_DMA_HALTED,
 				 4000, 2000000);
 	if (ret)
-		dev_err(&cio2->pci_dev->dev,
-			"DMA %i can not be halted\n", CIO2_DMA_CHAN);
+		dev_err(dev, "DMA %i can not be halted\n", CIO2_DMA_CHAN);
 
 	for (i = 0; i < CIO2_NUM_PORTS; i++) {
 		writel(readl(base + CIO2_REG_PXM_FRF_CFG(i)) |
@@ -540,8 +543,7 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 
 	entry = &q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
 	if (entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID) {
-		dev_warn(&cio2->pci_dev->dev,
-			 "no ready buffers found on DMA channel %u\n",
+		dev_warn(dev, "no ready buffers found on DMA channel %u\n",
 			 dma_chan);
 		return;
 	}
@@ -558,8 +560,7 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 
 			q->bufs[q->bufs_first] = NULL;
 			atomic_dec(&q->bufs_queued);
-			dev_dbg(&cio2->pci_dev->dev,
-				"buffer %i done\n", b->vbb.vb2_buf.index);
+			dev_dbg(dev, "buffer %i done\n", b->vbb.vb2_buf.index);
 
 			b->vbb.vb2_buf.timestamp = ns;
 			b->vbb.field = V4L2_FIELD_NONE;
@@ -648,8 +649,8 @@ static void cio2_irq_log_port_errs(struct device *dev, u8 port, u32 status)
 
 static void cio2_irq_handle_once(struct cio2_device *cio2, u32 int_status)
 {
-	void __iomem *const base = cio2->base;
 	struct device *dev = &cio2->pci_dev->dev;
+	void __iomem *const base = cio2->base;
 
 	if (int_status & CIO2_INT_IOOE) {
 		/*
@@ -792,6 +793,7 @@ static int cio2_vb2_queue_setup(struct vb2_queue *vq,
 				struct device *alloc_devs[])
 {
 	struct cio2_device *cio2 = vb2_get_drv_priv(vq);
+	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_queue *q = vb2q_to_cio2_queue(vq);
 	unsigned int i;
 
@@ -799,7 +801,7 @@ static int cio2_vb2_queue_setup(struct vb2_queue *vq,
 
 	for (i = 0; i < *num_planes; ++i) {
 		sizes[i] = q->format.plane_fmt[i].sizeimage;
-		alloc_devs[i] = &cio2->pci_dev->dev;
+		alloc_devs[i] = dev;
 	}
 
 	*num_buffers = clamp_val(*num_buffers, 1, CIO2_MAX_BUFFERS);
@@ -876,6 +878,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 static void cio2_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct cio2_device *cio2 = vb2_get_drv_priv(vb->vb2_queue);
+	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_queue *q =
 		container_of(vb->vb2_queue, struct cio2_queue, vbq);
 	struct cio2_buffer *b =
@@ -886,7 +889,7 @@ static void cio2_vb2_buf_queue(struct vb2_buffer *vb)
 	int bufs_queued = atomic_inc_return(&q->bufs_queued);
 	u32 fbpt_rp;
 
-	dev_dbg(&cio2->pci_dev->dev, "queue buffer %d\n", vb->index);
+	dev_dbg(dev, "queue buffer %d\n", vb->index);
 
 	/*
 	 * This code queues the buffer to the CIO2 DMA engine, which starts
@@ -937,12 +940,12 @@ static void cio2_vb2_buf_queue(struct vb2_buffer *vb)
 			return;
 		}
 
-		dev_dbg(&cio2->pci_dev->dev, "entry %i was full!\n", next);
+		dev_dbg(dev, "entry %i was full!\n", next);
 		next = (next + 1) % CIO2_MAX_BUFFERS;
 	}
 
 	local_irq_restore(flags);
-	dev_err(&cio2->pci_dev->dev, "error: all cio2 entries were full!\n");
+	dev_err(dev, "error: all cio2 entries were full!\n");
 	atomic_dec(&q->bufs_queued);
 	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
 }
@@ -951,6 +954,7 @@ static void cio2_vb2_buf_queue(struct vb2_buffer *vb)
 static void cio2_vb2_buf_cleanup(struct vb2_buffer *vb)
 {
 	struct cio2_device *cio2 = vb2_get_drv_priv(vb->vb2_queue);
+	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_buffer *b =
 		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
 	unsigned int i;
@@ -958,7 +962,7 @@ static void cio2_vb2_buf_cleanup(struct vb2_buffer *vb)
 	/* Free LOP table */
 	for (i = 0; i < CIO2_MAX_LOPS; i++) {
 		if (b->lop[i])
-			dma_free_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
+			dma_free_coherent(dev, PAGE_SIZE,
 					  b->lop[i], b->lop_bus_addr[i]);
 	}
 }
@@ -967,14 +971,15 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cio2_queue *q = vb2q_to_cio2_queue(vq);
 	struct cio2_device *cio2 = vb2_get_drv_priv(vq);
+	struct device *dev = &cio2->pci_dev->dev;
 	int r;
 
 	cio2->cur_queue = q;
 	atomic_set(&q->frame_sequence, 0);
 
-	r = pm_runtime_resume_and_get(&cio2->pci_dev->dev);
+	r = pm_runtime_resume_and_get(dev);
 	if (r < 0) {
-		dev_info(&cio2->pci_dev->dev, "failed to set power %d\n", r);
+		dev_info(dev, "failed to set power %d\n", r);
 		return r;
 	}
 
@@ -1000,9 +1005,9 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 fail_hw:
 	media_pipeline_stop(&q->vdev.entity);
 fail_pipeline:
-	dev_dbg(&cio2->pci_dev->dev, "failed to start streaming (%d)\n", r);
+	dev_dbg(dev, "failed to start streaming (%d)\n", r);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_QUEUED);
-	pm_runtime_put(&cio2->pci_dev->dev);
+	pm_runtime_put(dev);
 
 	return r;
 }
@@ -1011,16 +1016,16 @@ static void cio2_vb2_stop_streaming(struct vb2_queue *vq)
 {
 	struct cio2_queue *q = vb2q_to_cio2_queue(vq);
 	struct cio2_device *cio2 = vb2_get_drv_priv(vq);
+	struct device *dev = &cio2->pci_dev->dev;
 
 	if (v4l2_subdev_call(q->sensor, video, s_stream, 0))
-		dev_err(&cio2->pci_dev->dev,
-			"failed to stop sensor streaming\n");
+		dev_err(dev, "failed to stop sensor streaming\n");
 
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(cio2->pci_dev->irq);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_ERROR);
 	media_pipeline_stop(&q->vdev.entity);
-	pm_runtime_put(&cio2->pci_dev->dev);
+	pm_runtime_put(dev);
 	cio2->streaming = false;
 }
 
@@ -1312,12 +1317,12 @@ static int cio2_video_link_validate(struct media_link *link)
 						struct video_device, entity);
 	struct cio2_queue *q = container_of(vd, struct cio2_queue, vdev);
 	struct cio2_device *cio2 = video_get_drvdata(vd);
+	struct device *dev = &cio2->pci_dev->dev;
 	struct v4l2_subdev_format source_fmt;
 	int ret;
 
 	if (!media_entity_remote_pad(link->sink->entity->pads)) {
-		dev_info(&cio2->pci_dev->dev,
-			 "video node %s pad not connected\n", vd->name);
+		dev_info(dev, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
 
@@ -1327,8 +1332,7 @@ static int cio2_video_link_validate(struct media_link *link)
 
 	if (source_fmt.format.width != q->format.width ||
 	    source_fmt.format.height != q->format.height) {
-		dev_err(&cio2->pci_dev->dev,
-			"Wrong width or height %ux%u (%ux%u expected)\n",
+		dev_err(dev, "Wrong width or height %ux%u (%ux%u expected)\n",
 			q->format.width, q->format.height,
 			source_fmt.format.width, source_fmt.format.height);
 		return -EINVAL;
@@ -1409,6 +1413,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct cio2_device *cio2 = container_of(notifier, struct cio2_device,
 						notifier);
+	struct device *dev = &cio2->pci_dev->dev;
 	struct sensor_async_subdev *s_asd;
 	struct v4l2_async_subdev *asd;
 	struct cio2_queue *q;
@@ -1425,8 +1430,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 				break;
 
 		if (pad == q->sensor->entity.num_pads) {
-			dev_err(&cio2->pci_dev->dev,
-				"failed to find src pad for %s\n",
+			dev_err(dev, "failed to find src pad for %s\n",
 				q->sensor->name);
 			return -ENXIO;
 		}
@@ -1436,8 +1440,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 				&q->subdev.entity, CIO2_PAD_SINK,
 				0);
 		if (ret) {
-			dev_err(&cio2->pci_dev->dev,
-				"failed to create link for %s\n",
+			dev_err(dev, "failed to create link for %s\n",
 				q->sensor->name);
 			return ret;
 		}
@@ -1454,6 +1457,7 @@ static const struct v4l2_async_notifier_operations cio2_async_ops = {
 
 static int cio2_parse_firmware(struct cio2_device *cio2)
 {
+	struct device *dev = &cio2->pci_dev->dev;
 	unsigned int i;
 	int ret;
 
@@ -1464,10 +1468,8 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 		struct sensor_async_subdev *s_asd;
 		struct fwnode_handle *ep;
 
-		ep = fwnode_graph_get_endpoint_by_id(
-			dev_fwnode(&cio2->pci_dev->dev), i, 0,
-			FWNODE_GRAPH_ENDPOINT_NEXT);
-
+		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), i, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 		if (!ep)
 			continue;
 
@@ -1501,8 +1503,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 	cio2->notifier.ops = &cio2_async_ops;
 	ret = v4l2_async_notifier_register(&cio2->v4l2_dev, &cio2->notifier);
 	if (ret)
-		dev_err(&cio2->pci_dev->dev,
-			"failed to register async notifier : %d\n", ret);
+		dev_err(dev, "failed to register async notifier : %d\n", ret);
 
 	return ret;
 }
@@ -1521,7 +1522,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	static const u32 default_width = 1936;
 	static const u32 default_height = 1096;
 	const struct ipu3_cio2_fmt dflt_fmt = formats[0];
-
+	struct device *dev = &cio2->pci_dev->dev;
 	struct video_device *vdev = &q->vdev;
 	struct vb2_queue *vbq = &q->vbq;
 	struct v4l2_subdev *subdev = &q->subdev;
@@ -1563,8 +1564,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	subdev->internal_ops = &cio2_subdev_internal_ops;
 	r = media_entity_pads_init(&subdev->entity, CIO2_PADS, q->subdev_pads);
 	if (r) {
-		dev_err(&cio2->pci_dev->dev,
-			"failed initialize subdev media entity (%d)\n", r);
+		dev_err(dev, "failed initialize subdev media entity (%d)\n", r);
 		goto fail_subdev_media_entity;
 	}
 
@@ -1572,8 +1572,8 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	vdev->entity.ops = &cio2_video_entity_ops;
 	r = media_entity_pads_init(&vdev->entity, 1, &q->vdev_pad);
 	if (r) {
-		dev_err(&cio2->pci_dev->dev,
-			"failed initialize videodev media entity (%d)\n", r);
+		dev_err(dev, "failed initialize videodev media entity (%d)\n",
+			r);
 		goto fail_vdev_media_entity;
 	}
 
@@ -1587,8 +1587,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	v4l2_set_subdevdata(subdev, cio2);
 	r = v4l2_device_register_subdev(&cio2->v4l2_dev, subdev);
 	if (r) {
-		dev_err(&cio2->pci_dev->dev,
-			"failed initialize subdev (%d)\n", r);
+		dev_err(dev, "failed initialize subdev (%d)\n", r);
 		goto fail_subdev;
 	}
 
@@ -1604,8 +1603,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	vbq->lock = &q->lock;
 	r = vb2_queue_init(vbq);
 	if (r) {
-		dev_err(&cio2->pci_dev->dev,
-			"failed to initialize videobuf2 queue (%d)\n", r);
+		dev_err(dev, "failed to initialize videobuf2 queue (%d)\n", r);
 		goto fail_subdev;
 	}
 
@@ -1622,8 +1620,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	video_set_drvdata(vdev, cio2);
 	r = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (r) {
-		dev_err(&cio2->pci_dev->dev,
-			"failed to register video device (%d)\n", r);
+		dev_err(dev, "failed to register video device (%d)\n", r);
 		goto fail_vdev;
 	}
 
@@ -1645,7 +1642,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 fail_vdev_media_entity:
 	media_entity_cleanup(&subdev->entity);
 fail_subdev_media_entity:
-	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
+	cio2_fbpt_exit(q, dev);
 fail_fbpt:
 	mutex_destroy(&q->subdev_lock);
 	mutex_destroy(&q->lock);
@@ -1712,11 +1709,12 @@ static int cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
 static int cio2_pci_probe(struct pci_dev *pci_dev,
 			  const struct pci_device_id *id)
 {
-	struct fwnode_handle *fwnode = dev_fwnode(&pci_dev->dev);
+	struct device *dev = &pci_dev->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct cio2_device *cio2;
 	int r;
 
-	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
+	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
 	if (!cio2)
 		return -ENOMEM;
 	cio2->pci_dev = pci_dev;
@@ -1729,7 +1727,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	r = cio2_check_fwnode_graph(fwnode);
 	if (r) {
 		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
-			dev_err(&pci_dev->dev, "fwnode graph has no endpoints connected\n");
+			dev_err(dev, "fwnode graph has no endpoints connected\n");
 			return -EINVAL;
 		}
 
@@ -1740,16 +1738,16 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	r = pcim_enable_device(pci_dev);
 	if (r) {
-		dev_err(&pci_dev->dev, "failed to enable device (%d)\n", r);
+		dev_err(dev, "failed to enable device (%d)\n", r);
 		return r;
 	}
 
-	dev_info(&pci_dev->dev, "device 0x%x (rev: 0x%x)\n",
+	dev_info(dev, "device 0x%x (rev: 0x%x)\n",
 		 pci_dev->device, pci_dev->revision);
 
 	r = pcim_iomap_regions(pci_dev, 1 << CIO2_PCI_BAR, pci_name(pci_dev));
 	if (r) {
-		dev_err(&pci_dev->dev, "failed to remap I/O memory (%d)\n", r);
+		dev_err(dev, "failed to remap I/O memory (%d)\n", r);
 		return -ENODEV;
 	}
 
@@ -1761,13 +1759,13 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	r = pci_set_dma_mask(pci_dev, CIO2_DMA_MASK);
 	if (r) {
-		dev_err(&pci_dev->dev, "failed to set DMA mask (%d)\n", r);
+		dev_err(dev, "failed to set DMA mask (%d)\n", r);
 		return -ENODEV;
 	}
 
 	r = pci_enable_msi(pci_dev);
 	if (r) {
-		dev_err(&pci_dev->dev, "failed to enable MSI (%d)\n", r);
+		dev_err(dev, "failed to enable MSI (%d)\n", r);
 		return r;
 	}
 
@@ -1777,7 +1775,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	mutex_init(&cio2->lock);
 
-	cio2->media_dev.dev = &cio2->pci_dev->dev;
+	cio2->media_dev.dev = dev;
 	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
 		sizeof(cio2->media_dev.model));
 	snprintf(cio2->media_dev.bus_info, sizeof(cio2->media_dev.bus_info),
@@ -1790,10 +1788,9 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 		goto fail_mutex_destroy;
 
 	cio2->v4l2_dev.mdev = &cio2->media_dev;
-	r = v4l2_device_register(&pci_dev->dev, &cio2->v4l2_dev);
+	r = v4l2_device_register(dev, &cio2->v4l2_dev);
 	if (r) {
-		dev_err(&pci_dev->dev,
-			"failed to register V4L2 device (%d)\n", r);
+		dev_err(dev, "failed to register V4L2 device (%d)\n", r);
 		goto fail_media_device_unregister;
 	}
 
@@ -1808,15 +1805,15 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	if (r)
 		goto fail_clean_notifier;
 
-	r = devm_request_irq(&pci_dev->dev, pci_dev->irq, cio2_irq,
-			     IRQF_SHARED, CIO2_NAME, cio2);
+	r = devm_request_irq(dev, pci_dev->irq, cio2_irq, IRQF_SHARED,
+			     CIO2_NAME, cio2);
 	if (r) {
-		dev_err(&pci_dev->dev, "failed to request IRQ (%d)\n", r);
+		dev_err(dev, "failed to request IRQ (%d)\n", r);
 		goto fail_clean_notifier;
 	}
 
-	pm_runtime_put_noidle(&pci_dev->dev);
-	pm_runtime_allow(&pci_dev->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_allow(dev);
 
 	return 0;
 
@@ -2003,10 +2000,9 @@ static int __maybe_unused cio2_resume(struct device *dev)
 	if (!cio2->streaming)
 		return 0;
 	/* Start stream */
-	r = pm_runtime_force_resume(&cio2->pci_dev->dev);
+	r = pm_runtime_force_resume(dev);
 	if (r < 0) {
-		dev_err(&cio2->pci_dev->dev,
-			"failed to set power %d\n", r);
+		dev_err(dev, "failed to set power %d\n", r);
 		return r;
 	}
 
-- 
2.30.2

