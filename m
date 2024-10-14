Return-Path: <linux-media+bounces-19521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C3099BE52
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484002831E7
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 03:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1165D12CD96;
	Mon, 14 Oct 2024 03:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSJiYjgR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B348112AAE2
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 03:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877660; cv=none; b=NOHCMNB44dWrD75seCcjcnf0BPHqykacMItxRC0UfiztOx84/TVDYcYhwD2aqdtyJRKJ/KGZ7LytvOwBNnI8OM82+sBoRcLP2q+0ADgOs7BbQflyj8e3tRZp0y9G1jQCSO/2VPo8cRhaZHwc4VIYktfaR+E2XqcMzIQ9/4E/G0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877660; c=relaxed/simple;
	bh=S6HttPFY9717VIo95ELpmLkbvxGUa8tj1fuKPy7+v/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HfG58o/mey85P37kKk5TKDkAZuVMkM9SH2nEj/J2G2KU+SZZtXKfqaIUH+jGCGllUIA96Trc2FL5/fCgSWmyHKF7ClK+8C2PrMXjXWPj8ciglZTVZPJOJJRfIixl3vZijYJ8Oof2QKcElwj3VrnKUQpt5KKiIBgjEf6q7BmFRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSJiYjgR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728877658; x=1760413658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6HttPFY9717VIo95ELpmLkbvxGUa8tj1fuKPy7+v/U=;
  b=mSJiYjgRznbqmLW2nvPMTavzY+GINdtvnBfSaO86dwqaevEnOuBs2qLv
   WPSyDGDJRxGK1yucn/h5z9w+1Mq8z/7RI445bxFDEoPFtRdxiQyhiUNz8
   GbAdq3w5F4w1gkBxvgPGQM0kVmSYLOIyPUsnVsxZtBQwX6W5iC/xaJ1Yq
   yyLljRj72YAuS6iU/GnqyLhMoJAXxalXTPhHaPXW4YJxFVw1b8w+Hi40V
   S0o9/L3kb95R6IuCWm7uO9GRDtpsHNyoRb67SJgLaL+GERsJSfJL/MDIQ
   Pi8UbkMiPqWcAyCoADtenznkKpN25IV5r9itX3MNg3KXuDelxtWCN9+xV
   g==;
X-CSE-ConnectionGUID: iZrqzm8LRz+2pfRSXqP//Q==
X-CSE-MsgGUID: +zhUPkKBRSWcTpV2JxZbfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53632121"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53632121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 20:47:38 -0700
X-CSE-ConnectionGUID: zaCR8iTMShGJFTuSGv22mw==
X-CSE-MsgGUID: UJtJUlGfR3KwDVfeE09CfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77076856"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 20:47:36 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hch@lst.de,
	andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 2/5] media: ipu6: use the IPU6 DMA mapping APIs to do mapping
Date: Mon, 14 Oct 2024 11:47:29 +0800
Message-Id: <20241014034732.3109440-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014034732.3109440-1-bingbu.cao@intel.com>
References: <20241014034732.3109440-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

dma_ops is removed from the IPU6 auxiliary device, ISYS driver
should use the IPU6 DMA mapping APIs directly instead of depending
on the device callbacks.

ISYS driver switch from the videobuf2 DMA contig memory allocator to
scatter/gather memory allocator.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig          |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 66 +++++++++++++++----
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 19 +++---
 4 files changed, 64 insertions(+), 24 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 49e4fb696573..ec6c1ea329ed 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -14,7 +14,7 @@ config VIDEO_INTEL_IPU6
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
-	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	help
 	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 03dbb0e0ea79..bbb66b56ee88 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -13,17 +13,48 @@
 
 #include <media/media-entity.h>
 #include <media/v4l2-subdev.h>
-#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "ipu6-bus.h"
+#include "ipu6-dma.h"
 #include "ipu6-fw-isys.h"
 #include "ipu6-isys.h"
 #include "ipu6-isys-video.h"
 
-static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
-		       unsigned int *num_planes, unsigned int sizes[],
-		       struct device *alloc_devs[])
+static int ipu6_isys_buf_init(struct vb2_buffer *vb)
+{
+	struct ipu6_isys *isys = vb2_get_drv_priv(vb->vb2_queue);
+	struct sg_table *sg = vb2_dma_sg_plane_desc(vb, 0);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu6_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+	int ret;
+
+	ret = ipu6_dma_map_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
+	if (ret)
+		return ret;
+
+	ivb->dma_addr = sg_dma_address(sg->sgl);
+
+	return 0;
+}
+
+static void ipu6_isys_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct ipu6_isys *isys = vb2_get_drv_priv(vb->vb2_queue);
+	struct sg_table *sg = vb2_dma_sg_plane_desc(vb, 0);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu6_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+
+	ivb->dma_addr = 0;
+	ipu6_dma_unmap_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
+}
+
+static int ipu6_isys_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				 unsigned int *num_planes, unsigned int sizes[],
+				 struct device *alloc_devs[])
 {
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
@@ -207,9 +238,11 @@ ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
 				  struct ipu6_fw_isys_frame_buff_set_abi *set)
 {
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu6_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
 
-	set->output_pins[aq->fw_output].addr =
-		vb2_dma_contig_plane_dma_addr(vb, 0);
+	set->output_pins[aq->fw_output].addr = ivb->dma_addr;
 	set->output_pins[aq->fw_output].out_buf_id = vb->index + 1;
 }
 
@@ -332,7 +365,7 @@ static void buf_queue(struct vb2_buffer *vb)
 
 	dev_dbg(dev, "queue buffer %u for %s\n", vb->index, av->vdev.name);
 
-	dma = vb2_dma_contig_plane_dma_addr(vb, 0);
+	dma = ivb->dma_addr;
 	dev_dbg(dev, "iova: iova %pad\n", &dma);
 
 	spin_lock_irqsave(&aq->lock, flags);
@@ -724,10 +757,14 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 	}
 
 	list_for_each_entry_reverse(ib, &aq->active, head) {
+		struct ipu6_isys_video_buffer *ivb;
+		struct vb2_v4l2_buffer *vvb;
 		dma_addr_t addr;
 
 		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
-		addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+		vvb = to_vb2_v4l2_buffer(vb);
+		ivb = vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+		addr = ivb->dma_addr;
 
 		if (info->pin.addr != addr) {
 			if (first)
@@ -766,10 +803,12 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 }
 
 static const struct vb2_ops ipu6_isys_queue_ops = {
-	.queue_setup = queue_setup,
+	.queue_setup = ipu6_isys_queue_setup,
 	.wait_prepare = vb2_ops_wait_prepare,
 	.wait_finish = vb2_ops_wait_finish,
+	.buf_init = ipu6_isys_buf_init,
 	.buf_prepare = ipu6_isys_buf_prepare,
+	.buf_cleanup = ipu6_isys_buf_cleanup,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
 	.buf_queue = buf_queue,
@@ -779,16 +818,17 @@ int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
 {
 	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct ipu6_bus_device *adev = isys->adev;
 	int ret;
 
 	/* no support for userptr */
 	if (!aq->vbq.io_modes)
 		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;
 
-	aq->vbq.drv_priv = aq;
+	aq->vbq.drv_priv = isys;
 	aq->vbq.ops = &ipu6_isys_queue_ops;
 	aq->vbq.lock = &av->mutex;
-	aq->vbq.mem_ops = &vb2_dma_contig_memops;
+	aq->vbq.mem_ops = &vb2_dma_sg_memops;
 	aq->vbq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	aq->vbq.min_queued_buffers = 1;
 	aq->vbq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
@@ -797,8 +837,8 @@ int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
 	if (ret)
 		return ret;
 
-	aq->dev = &isys->adev->auxdev.dev;
-	aq->vbq.dev = &isys->adev->auxdev.dev;
+	aq->dev = &adev->auxdev.dev;
+	aq->vbq.dev = &adev->isp->pdev->dev;
 	spin_lock_init(&aq->lock);
 	INIT_LIST_HEAD(&aq->active);
 	INIT_LIST_HEAD(&aq->incoming);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 95cfd4869d93..fe8fc796a58f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -38,6 +38,7 @@ struct ipu6_isys_buffer {
 struct ipu6_isys_video_buffer {
 	struct vb2_v4l2_buffer vb_v4l2;
 	struct ipu6_isys_buffer ib;
+	dma_addr_t dma_addr;
 };
 
 #define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c4aff2e2009b..c85e056cb904 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -34,6 +34,7 @@
 
 #include "ipu6-bus.h"
 #include "ipu6-cpd.h"
+#include "ipu6-dma.h"
 #include "ipu6-isys.h"
 #include "ipu6-isys-csi2.h"
 #include "ipu6-mmu.h"
@@ -933,29 +934,27 @@ static const struct dev_pm_ops isys_pm_ops = {
 
 static void free_fw_msg_bufs(struct ipu6_isys *isys)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
 	struct isys_fw_msgs *fwmsg, *safe;
 
 	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
-		dma_free_attrs(dev, sizeof(struct isys_fw_msgs), fwmsg,
-			       fwmsg->dma_addr, 0);
+		ipu6_dma_free(isys->adev, sizeof(struct isys_fw_msgs), fwmsg,
+			      fwmsg->dma_addr, 0);
 
 	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
-		dma_free_attrs(dev, sizeof(struct isys_fw_msgs), fwmsg,
-			       fwmsg->dma_addr, 0);
+		ipu6_dma_free(isys->adev, sizeof(struct isys_fw_msgs), fwmsg,
+			      fwmsg->dma_addr, 0);
 }
 
 static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
 	struct isys_fw_msgs *addr;
 	dma_addr_t dma_addr;
 	unsigned long flags;
 	unsigned int i;
 
 	for (i = 0; i < amount; i++) {
-		addr = dma_alloc_attrs(dev, sizeof(struct isys_fw_msgs),
-				       &dma_addr, GFP_KERNEL, 0);
+		addr = ipu6_dma_alloc(isys->adev, sizeof(*addr),
+				      &dma_addr, GFP_KERNEL, 0);
 		if (!addr)
 			break;
 		addr->dma_addr = dma_addr;
@@ -974,8 +973,8 @@ static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
 					struct isys_fw_msgs, head);
 		list_del(&addr->head);
 		spin_unlock_irqrestore(&isys->listlock, flags);
-		dma_free_attrs(dev, sizeof(struct isys_fw_msgs), addr,
-			       addr->dma_addr, 0);
+		ipu6_dma_free(isys->adev, sizeof(struct isys_fw_msgs), addr,
+			      addr->dma_addr, 0);
 		spin_lock_irqsave(&isys->listlock, flags);
 	}
 	spin_unlock_irqrestore(&isys->listlock, flags);
-- 
2.34.1


