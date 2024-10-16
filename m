Return-Path: <linux-media+bounces-19725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E119A0322
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78861B24611
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A5B1CB9EA;
	Wed, 16 Oct 2024 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO7a4lnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222A1B2193
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065193; cv=none; b=g3mT9W4mkf/55kozcNg//xNXzIKtMUbUx7vTUEYZqK8QdPfo8jPaanGPTubSX6cjFeOcO9iUHk0gB0b6UiQz59wQ2BlDXk9YXc7zscEMnXYvR/7T0DhMISVh71AT+oROmi7qw8w5smQylOY1TrfHou9+7eBksZorZq5PbrTgvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065193; c=relaxed/simple;
	bh=S6HttPFY9717VIo95ELpmLkbvxGUa8tj1fuKPy7+v/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i66eEkAM3P6UyTonrudTTH5349Dd/7AE5aDErGbCsvX3pmlJ/90Hz3xj8T2dGVD4rR5goPVWhlGORlGQz4CEdVR2AUO8K6FjZaweSqPl3jHjMx3ei6YhB/S2wcacrup8qOGz9BFnHe2mK+njIViluUDAIpep/fl02tk+jqnRQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO7a4lnG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729065191; x=1760601191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6HttPFY9717VIo95ELpmLkbvxGUa8tj1fuKPy7+v/U=;
  b=gO7a4lnGDxkwgNt0DxjkEITs3wcmRoNyg6k/I0HNbPbNZemSvRCOpvS0
   A7txAMlpOVsNwyASrrHqDtlVWbppincqljk6wEQzGduJSNnsFGcDEKqZP
   hdQ08vb6O+qnsMxv5Uuq2/EzTAs5LTrjIp4z5qg3M3M8FjFRUb5j3vf3P
   1XZJGFMzYPSe66RmT4fXyE9dBNUVX1rugE1HAXnsgTYoMiyjYJmjOOENI
   0nlGcaem/X/DBzsPUraJWlDJ/ImdjA0OU6ru58uQRLLkDLQhooM7ej+4Y
   4pqqcb3uLdw5vI2xlqJnDk20oQlkD8QDUzQgPj3dO4EspQB3ZZSS9284P
   g==;
X-CSE-ConnectionGUID: ecQV2sMhR9Gye6xEdvsqdA==
X-CSE-MsgGUID: G/6GgdXWRWWRzwQ/DRvEpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27971556"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="27971556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 00:53:11 -0700
X-CSE-ConnectionGUID: SxRL3oRoTomgRgZWTVMETg==
X-CSE-MsgGUID: 54X65OfCRemzINlUW6jhSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78313731"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2024 00:53:09 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hch@lst.de
Cc: andriy.shevchenko@linux.intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH v2 2/5] media: ipu6: use the IPU6 DMA mapping APIs to do mapping
Date: Wed, 16 Oct 2024 15:53:02 +0800
Message-Id: <20241016075305.508934-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016075305.508934-1-bingbu.cao@intel.com>
References: <20241016075305.508934-1-bingbu.cao@intel.com>
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


