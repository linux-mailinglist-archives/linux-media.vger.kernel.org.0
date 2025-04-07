Return-Path: <linux-media+bounces-29515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3AA7DFE1
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6936918894DA
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019F31A3159;
	Mon,  7 Apr 2025 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKSUO3Ib"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EFC1B0402
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033266; cv=none; b=KlmeRLFTfwH/8HaYRyuOE+hPkah/llRBxQVOKfnoYWYXKJXgAryq2HsfpRCHSu+eob/JzuYLuusVawMJb38K6EZV4owpaXchMekUriWHlf3u9WPXJ0rlZPfurzW7+nNIp/kf/L8chCpuWhLinrGN0XSuY2PFYwJNiYRp/orF7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033266; c=relaxed/simple;
	bh=NWu96nXrmLnbEJYPNMftOWkXLN/hBWu1JXgVDEKZulE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHXN+aEQ9yzcD1p7080Hh+KA9GcY86aND9RTLtIPVyFfpfnupdTaKqcGg5dlHsKCSdssPH0CsJhUQvrJPyafOp2ihpp1wV0R7zNph8O/vgHLNiH1yNxUZ0bvruT00cP5iID/7zN4EwpdJmrx5EJR7LZG65f1Jwd2MOurJ7Wy7uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKSUO3Ib; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033263; x=1775569263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NWu96nXrmLnbEJYPNMftOWkXLN/hBWu1JXgVDEKZulE=;
  b=DKSUO3Ibils4NdcwCmfZx2VwftMzpBsKTRcQPRqhNlXTj3n5vd040Ctx
   ar46IZ5oMsVcfm5Dr26U+nDrDOQ3rmbmNMiehp+pUEfUSQiWZIQeLFnZC
   UtNhiJUH/Fy3FoOByGXOzWtfBw2ZA1hhYF8c+7froEaQwgUP7XXAzef9O
   7spu8AdITC0hbeK5/girftLOJWYHpjMk51TPQQlMKvfFv0s5EQxCzpmht
   GGejGzWG2OM+cseofZSxQyOdbIsHHVfX/p1znCAnEsk0ACgGbRemjjJ7o
   PB4knpZoIeVu+q2k2ehW1d2WuNV7PO4yF4mgF8yAqoJZPErlgRuNkkPkV
   A==;
X-CSE-ConnectionGUID: ++tm638hRlq+k/Nk0Bv4PQ==
X-CSE-MsgGUID: 57akHz8fSOyR1sicbVHQlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55607456"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="55607456"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:02 -0700
X-CSE-ConnectionGUID: OEi2r6PnSIK586EpPG9/TQ==
X-CSE-MsgGUID: DV+g4FyJTIawG0nQ610A7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128293107"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:00 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 4/7] media: intel/ipu6: Rename common structures
Date: Mon,  7 Apr 2025 15:40:34 +0200
Message-Id: <20250407134037.808367-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename common structures and defines with isys_ prefix. This makes
clean distinction of what data/code belongs to each part of the
driver.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   6 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 155 +++++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  10 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  52 +++---
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  18 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  14 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   4 +-
 drivers/media/pci/intel/ipu6/isys.h           |  48 +++---
 9 files changed, 155 insertions(+), 156 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 5c4baaffa092..ddd19cde69be 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -556,7 +556,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 	return ret;
 }
 
-void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
+void ipu6_isys_csi2_sof_event_by_stream(struct isys_stream *stream)
 {
 	struct video_device *vdev = stream->asd->sd.devnode;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
@@ -572,7 +572,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
 		csi2->port, ev.u.frame_sync.frame_sequence, stream->vc);
 }
 
-void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
+void ipu6_isys_csi2_eof_event_by_stream(struct isys_stream *stream)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 7deafead66cf..8b39c139a803 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -16,7 +16,7 @@ struct v4l2_mbus_frame_desc_entry;
 
 struct ipu6_isys_video;
 struct ipu6_isys;
-struct ipu6_isys_stream;
+struct isys_stream;
 
 #define NR_OF_CSI2_VC		16
 #define INVALID_VC_ID		-1
@@ -65,8 +65,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2);
 int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2, struct ipu6_isys *isys,
 			void __iomem *base, unsigned int index);
 void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2);
-void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream);
-void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
+void ipu6_isys_csi2_sof_event_by_stream(struct isys_stream *stream);
+void ipu6_isys_csi2_eof_event_by_stream(struct isys_stream *stream);
 void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
 void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
 int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 252097c61d0a..d9457176f32f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -28,8 +28,8 @@ static int ipu6_isys_buf_init(struct vb2_buffer *vb)
 	struct ipu6_isys *isys = vb2_get_drv_priv(vb->vb2_queue);
 	struct sg_table *sg = vb2_dma_sg_plane_desc(vb, 0);
 	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
-	struct ipu6_isys_video_buffer *ivb =
-		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+	struct isys_video_buffer *ivb =
+		vb2_buffer_to_isys_video_buffer(vvb);
 	int ret;
 
 	ret = ipu6_dma_map_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
@@ -46,8 +46,8 @@ static void ipu6_isys_buf_cleanup(struct vb2_buffer *vb)
 	struct ipu6_isys *isys = vb2_get_drv_priv(vb->vb2_queue);
 	struct sg_table *sg = vb2_dma_sg_plane_desc(vb, 0);
 	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
-	struct ipu6_isys_video_buffer *ivb =
-		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+	struct isys_video_buffer *ivb =
+		vb2_buffer_to_isys_video_buffer(vvb);
 
 	ivb->dma_addr = 0;
 	ipu6_dma_unmap_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
@@ -57,7 +57,7 @@ static int ipu6_isys_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 				 unsigned int *num_planes, unsigned int sizes[],
 				 struct device *alloc_devs[])
 {
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	u32 size = ipu6_isys_get_data_size(av);
@@ -78,7 +78,7 @@ static int ipu6_isys_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 
 static int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
 {
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	u32 bytesperline = ipu6_isys_get_bytes_per_line(av);
@@ -100,11 +100,11 @@ static int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
  * Queue a buffer list back to incoming or active queues. The buffers
  * are removed from the buffer list.
  */
-void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
+void ipu6_isys_buffer_list_queue(struct isys_buffer_list *bl,
 				 unsigned long op_flags,
 				 enum vb2_buffer_state state)
 {
-	struct ipu6_isys_buffer *ib, *ib_safe;
+	struct isys_buffer *ib, *ib_safe;
 	unsigned long flags;
 	bool first = true;
 
@@ -112,13 +112,13 @@ void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 		return;
 
 	WARN_ON_ONCE(!bl->nbufs);
-	WARN_ON_ONCE(op_flags & IPU6_ISYS_BUFFER_LIST_FL_ACTIVE &&
-		     op_flags & IPU6_ISYS_BUFFER_LIST_FL_INCOMING);
+	WARN_ON_ONCE(op_flags & ISYS_BUFFER_LIST_ACTIVE &&
+		     op_flags & ISYS_BUFFER_LIST_INCOMING);
 
 	list_for_each_entry_safe(ib, ib_safe, &bl->head, head) {
 		struct ipu6_isys_video *av;
-		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
-		struct ipu6_isys_queue *aq =
+		struct vb2_buffer *vb = isys_buffer_to_vb2_buffer(ib);
+		struct isys_queue *aq =
 			vb2_queue_to_isys_queue(vb->vb2_queue);
 		struct device *dev;
 
@@ -126,13 +126,13 @@ void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 		dev = &av->isys->adev->auxdev.dev;
 		spin_lock_irqsave(&aq->lock, flags);
 		list_del(&ib->head);
-		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_ACTIVE)
+		if (op_flags & ISYS_BUFFER_LIST_ACTIVE)
 			list_add(&ib->head, &aq->active);
-		else if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_INCOMING)
+		else if (op_flags & ISYS_BUFFER_LIST_INCOMING)
 			list_add_tail(&ib->head, &aq->incoming);
 		spin_unlock_irqrestore(&aq->lock, flags);
 
-		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_SET_STATE)
+		if (op_flags & ISYS_BUFFER_LIST_SET_STATE)
 			vb2_buffer_done(vb, state);
 
 		if (first) {
@@ -153,22 +153,22 @@ void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
  * have been queued to firmware and the *firmware streamon fails for a
  * reason or another.
  */
-static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
+static void flush_firmware_streamon_fail(struct isys_stream *stream)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_queue *aq;
+	struct isys_queue *aq;
 	unsigned long flags;
 
 	lockdep_assert_held(&stream->mutex);
 
 	list_for_each_entry(aq, &stream->queues, node) {
 		struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-		struct ipu6_isys_buffer *ib, *ib_safe;
+		struct isys_buffer *ib, *ib_safe;
 
 		spin_lock_irqsave(&aq->lock, flags);
 		list_for_each_entry_safe(ib, ib_safe, &aq->active, head) {
 			struct vb2_buffer *vb =
-				ipu6_isys_buffer_to_vb2_buffer(ib);
+				isys_buffer_to_vb2_buffer(ib);
 
 			list_del(&ib->head);
 			if (av->streaming) {
@@ -182,7 +182,7 @@ static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
 			/* Queue not yet streaming, return to user. */
 			dev_dbg(dev, "%s: return %u back to videobuf2\n",
 				av->vdev.name, vb->index);
-			vb2_buffer_done(ipu6_isys_buffer_to_vb2_buffer(ib),
+			vb2_buffer_done(isys_buffer_to_vb2_buffer(ib),
 					VB2_BUF_STATE_QUEUED);
 		}
 		spin_unlock_irqrestore(&aq->lock, flags);
@@ -194,19 +194,19 @@ static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
  * that contains one entry from each video buffer queue. If a buffer can't be
  * obtained from every queue, the buffers are returned back to the queue.
  */
-static int buffer_list_get(struct ipu6_isys_stream *stream,
-			   struct ipu6_isys_buffer_list *bl)
+static int buffer_list_get(struct isys_stream *stream,
+			   struct isys_buffer_list *bl)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_queue *aq;
+	struct isys_queue *aq;
 	unsigned long flags;
-	unsigned long buf_flag = IPU6_ISYS_BUFFER_LIST_FL_INCOMING;
+	unsigned long buf_flag = ISYS_BUFFER_LIST_INCOMING;
 
 	bl->nbufs = 0;
 	INIT_LIST_HEAD(&bl->head);
 
 	list_for_each_entry(aq, &stream->queues, node) {
-		struct ipu6_isys_buffer *ib;
+		struct isys_buffer *ib;
 
 		spin_lock_irqsave(&aq->lock, flags);
 		if (list_empty(&aq->incoming)) {
@@ -217,11 +217,11 @@ static int buffer_list_get(struct ipu6_isys_stream *stream,
 		}
 
 		ib = list_last_entry(&aq->incoming,
-				     struct ipu6_isys_buffer, head);
+				     struct isys_buffer, head);
 
 		dev_dbg(dev, "buffer: %s: buffer %u\n",
 			ipu6_isys_queue_to_video(aq)->vdev.name,
-			ipu6_isys_buffer_to_vb2_buffer(ib)->index);
+			isys_buffer_to_vb2_buffer(ib)->index);
 		list_del(&ib->head);
 		list_add(&ib->head, &bl->head);
 		spin_unlock_irqrestore(&aq->lock, flags);
@@ -238,10 +238,10 @@ static void
 ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
 				  struct ipu6_fw_isys_frame_buff_set_abi *set)
 {
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
-	struct ipu6_isys_video_buffer *ivb =
-		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+	struct isys_video_buffer *ivb =
+		vb2_buffer_to_isys_video_buffer(vvb);
 
 	set->output_pins[aq->fw_output].addr = ivb->dma_addr;
 	set->output_pins[aq->fw_output].out_buf_id = vb->index + 1;
@@ -254,10 +254,10 @@ ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
 #define IPU6_ISYS_FRAME_NUM_THRESHOLD  (30)
 void
 ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
-			      struct ipu6_isys_stream *stream,
-			      struct ipu6_isys_buffer_list *bl)
+			      struct isys_stream *stream,
+			      struct isys_buffer_list *bl)
 {
-	struct ipu6_isys_buffer *ib;
+	struct isys_buffer *ib;
 
 	WARN_ON(!bl->nbufs);
 
@@ -280,7 +280,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 	}
 
 	list_for_each_entry(ib, &bl->head, head) {
-		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+		struct vb2_buffer *vb = isys_buffer_to_vb2_buffer(ib);
 
 		ipu6_isys_buf_to_fw_frame_buf_pin(vb, set);
 	}
@@ -288,11 +288,11 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 
 /* Start streaming for real. The buffer list must be available. */
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
-				  struct ipu6_isys_buffer_list *bl, bool error)
+				  struct isys_buffer_list *bl, bool error)
 {
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_buffer_list __bl;
+	struct isys_buffer_list __bl;
 	int ret;
 
 	mutex_lock(&stream->isys->stream_mutex);
@@ -322,7 +322,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
 		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
 						 stream->nr_output_pins);
-		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
+		ipu6_isys_buffer_list_queue(bl, ISYS_BUFFER_LIST_ACTIVE,
 					    0);
 		ret = ipu6_fw_isys_complex_cmd(stream->isys,
 					       stream->stream_handle, buf,
@@ -335,9 +335,9 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 out_requeue:
 	if (bl && bl->nbufs)
 		ipu6_isys_buffer_list_queue(bl,
-					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
+					    ISYS_BUFFER_LIST_INCOMING |
 					    (error ?
-					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
+					    ISYS_BUFFER_LIST_SET_STATE :
 					     0), error ? VB2_BUF_STATE_ERROR :
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
@@ -347,18 +347,18 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 
 static void buf_queue(struct vb2_buffer *vb)
 {
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
-	struct ipu6_isys_video_buffer *ivb =
-		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
-	struct ipu6_isys_buffer *ib = &ivb->ib;
+	struct isys_video_buffer *ivb =
+		vb2_buffer_to_isys_video_buffer(vvb);
+	struct isys_buffer *ib = &ivb->ib;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct media_pipeline *media_pipe =
 		media_entity_pipeline(&av->vdev.entity);
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_buffer_list bl;
+	struct isys_stream *stream = av->stream;
+	struct isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
 	unsigned long flags;
 	dma_addr_t dma;
@@ -420,7 +420,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	 * firmware since we could get a buffer event back before we
 	 * have queued them ourselves to the active queue.
 	 */
-	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+	ipu6_isys_buffer_list_queue(&bl, ISYS_BUFFER_LIST_ACTIVE, 0);
 
 	ret = ipu6_fw_isys_complex_cmd(stream->isys, stream->stream_handle,
 				       buf, msg->dma_addr, sizeof(*buf),
@@ -432,7 +432,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	mutex_unlock(&stream->mutex);
 }
 
-static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
+static int ipu6_isys_link_fmt_validate(struct isys_queue *aq)
 {
 	struct v4l2_mbus_framefmt format;
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
@@ -476,11 +476,11 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 	return 0;
 }
 
-static void return_buffers(struct ipu6_isys_queue *aq,
+static void return_buffers(struct isys_queue *aq,
 			   enum vb2_buffer_state state)
 {
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct ipu6_isys_buffer *ib;
+	struct isys_buffer *ib;
 	bool need_reset = false;
 	unsigned long flags;
 
@@ -488,9 +488,9 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 	while (!list_empty(&aq->incoming)) {
 		struct vb2_buffer *vb;
 
-		ib = list_first_entry(&aq->incoming, struct ipu6_isys_buffer,
+		ib = list_first_entry(&aq->incoming, struct isys_buffer,
 				      head);
-		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+		vb = isys_buffer_to_vb2_buffer(ib);
 		list_del(&ib->head);
 		spin_unlock_irqrestore(&aq->lock, flags);
 
@@ -507,9 +507,8 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 	while (!list_empty(&aq->active)) {
 		struct vb2_buffer *vb;
 
-		ib = list_first_entry(&aq->active, struct ipu6_isys_buffer,
-				      head);
-		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+		ib = list_first_entry(&aq->active, struct isys_buffer, head);
+		vb = isys_buffer_to_vb2_buffer(ib);
 
 		list_del(&ib->head);
 		spin_unlock_irqrestore(&aq->lock, flags);
@@ -538,13 +537,13 @@ static void ipu6_isys_stream_cleanup(struct ipu6_isys_video *av)
 
 static int start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	const struct ipu6_isys_pixelformat *pfmt =
+	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct ipu6_isys_buffer_list __bl, *bl = NULL;
-	struct ipu6_isys_stream *stream;
+	struct isys_buffer_list __bl, *bl = NULL;
+	struct isys_stream *stream;
 	struct media_entity *source_entity = NULL;
 	int nr_queues, ret;
 
@@ -626,9 +625,9 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 
 static void stop_streaming(struct vb2_queue *q)
 {
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 
 	mutex_lock(&stream->mutex);
 
@@ -652,7 +651,7 @@ static void stop_streaming(struct vb2_queue *q)
 }
 
 static unsigned int
-get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream, u64 time)
+get_sof_sequence_by_timestamp(struct isys_stream *stream, u64 time)
 {
 	struct ipu6_isys *isys = stream->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -665,14 +664,14 @@ get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream, u64 time)
 	if (time == 0)
 		return atomic_read(&stream->sequence) - 1;
 
-	for (i = 0; i < IPU6_ISYS_MAX_PARALLEL_SOF; i++)
+	for (i = 0; i < ISYS_MAX_PARALLEL_SOF; i++)
 		if (time == stream->seq[i].timestamp) {
 			dev_dbg(dev, "sof: using seq nr %u for ts %llu\n",
 				stream->seq[i].sequence, time);
 			return stream->seq[i].sequence;
 		}
 
-	for (i = 0; i < IPU6_ISYS_MAX_PARALLEL_SOF; i++)
+	for (i = 0; i < ISYS_MAX_PARALLEL_SOF; i++)
 		dev_dbg(dev, "sof: sequence %u, timestamp value %llu\n",
 			stream->seq[i].sequence, stream->seq[i].timestamp);
 
@@ -695,14 +694,14 @@ static u64 get_sof_ns_delta(struct ipu6_isys_video *av, u64 timestamp)
 }
 
 static void
-ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib, u64 time)
+ipu6_isys_buf_calc_sequence_time(struct isys_buffer *ib, u64 time)
 {
-	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+	struct vb2_buffer *vb = isys_buffer_to_vb2_buffer(ib);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	u64 ns;
 	u32 sequence;
 
@@ -718,9 +717,9 @@ ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib, u64 time)
 		vbuf->vb2_buf.timestamp);
 }
 
-static void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
+static void ipu6_isys_queue_buf_done(struct isys_buffer *ib)
 {
-	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+	struct vb2_buffer *vb = isys_buffer_to_vb2_buffer(ib);
 
 	if (atomic_read(&ib->str2mmio_flag)) {
 		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
@@ -735,13 +734,13 @@ static void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
 }
 
 static void
-ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 pin_addr,
+ipu6_stream_buf_ready(struct isys_stream *stream, u8 pin_id, u32 pin_addr,
 		      u64 time, bool error_check)
 {
-	struct ipu6_isys_queue *aq = stream->output_pins[pin_id].aq;
+	struct isys_queue *aq = stream->output_pins[pin_id].aq;
 	struct ipu6_isys *isys = stream->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
-	struct ipu6_isys_buffer *ib;
+	struct isys_buffer *ib;
 	struct vb2_buffer *vb;
 	unsigned long flags;
 	bool first = true;
@@ -755,13 +754,13 @@ ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 pin_addr,
 	}
 
 	list_for_each_entry_reverse(ib, &aq->active, head) {
-		struct ipu6_isys_video_buffer *ivb;
+		struct isys_video_buffer *ivb;
 		struct vb2_v4l2_buffer *vvb;
 		dma_addr_t addr;
 
-		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+		vb = isys_buffer_to_vb2_buffer(ib);
 		vvb = to_vb2_v4l2_buffer(vb);
-		ivb = vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+		ivb = vb2_buffer_to_isys_video_buffer(vvb);
 		addr = ivb->dma_addr;
 
 		if (pin_addr != addr) {
@@ -799,7 +798,7 @@ ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 pin_addr,
 	spin_unlock_irqrestore(&aq->lock, flags);
 }
 
-void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream, void *_info)
+void ipu6_isys_queue_buf_ready(struct isys_stream *stream, void *_info)
 {
 	struct ipu6_fw_isys_resp_info_abi *info = _info;
 	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
@@ -818,7 +817,7 @@ static const struct vb2_ops ipu6_isys_queue_ops = {
 	.buf_queue = buf_queue,
 };
 
-int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
+int ipu6_isys_queue_init(struct isys_queue *aq)
 {
 	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 6a95858bfd59..10f0dad9964d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -7,13 +7,13 @@
 #include "ipu6-fw-isys.h"
 #include "isys.h"
 
-void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
+void ipu6_isys_buffer_list_queue(struct isys_buffer_list *bl,
 				 unsigned long op_flags,
 				 enum vb2_buffer_state state);
 void
 ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
-			      struct ipu6_isys_stream *stream,
-			      struct ipu6_isys_buffer_list *bl);
-void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream, void *info);
-int ipu6_isys_queue_init(struct ipu6_isys_queue *aq);
+			      struct isys_stream *stream,
+			      struct isys_buffer_list *bl);
+void ipu6_isys_queue_buf_ready(struct isys_stream *stream, void *info);
+int ipu6_isys_queue_init(struct isys_queue *aq);
 #endif /* IPU6_ISYS_QUEUE_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 3165904d7ebf..71429e83d8aa 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -36,7 +36,7 @@
 #include "ipu6-isys-video.h"
 #include "ipu6-platform-regs.h"
 
-const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
+const struct isys_pixelformat ipu6_isys_pfmts[] = {
 	{ V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
 	{ V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
@@ -112,14 +112,14 @@ static int video_open(struct file *file)
 	return v4l2_fh_open(file);
 }
 
-const struct ipu6_isys_pixelformat *
+const struct isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 type)
 {
-	const struct ipu6_isys_pixelformat *default_pfmt = NULL;
+	const struct isys_pixelformat *default_pfmt = NULL;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
-		const struct ipu6_isys_pixelformat *pfmt = &ipu6_isys_pfmts[i];
+		const struct isys_pixelformat *pfmt = &ipu6_isys_pfmts[i];
 
 		if (type && ((!pfmt->is_meta &&
 			      type != V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
@@ -229,7 +229,7 @@ static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
 				  u32 *format, u32 *width, u32 *height,
 				  u32 *bytesperline, u32 *sizeimage)
 {
-	const struct ipu6_isys_pixelformat *pfmt =
+	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(*format, type);
 
 	*format = pfmt->pixelformat;
@@ -443,10 +443,10 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
 	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
 	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_queue *aq = &av->aq;
+	struct isys_stream *stream = av->stream;
+	struct isys_queue *aq = &av->aq;
 	struct v4l2_mbus_framefmt fmt;
-	const struct ipu6_isys_pixelformat *pfmt =
+	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct v4l2_rect v4l2_crop;
 	struct ipu6_isys *isys = av->isys;
@@ -516,14 +516,14 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 }
 
 static int start_stream_firmware(struct ipu6_isys_video *av,
-				 struct ipu6_isys_buffer_list *bl)
+				 struct isys_buffer_list *bl)
 {
 	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct isys_fw_msgs *msg = NULL;
-	struct ipu6_isys_queue *aq;
+	struct isys_queue *aq;
 	int ret, retout, tout;
 	u16 send_type;
 
@@ -591,7 +591,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 		buf = &msg->fw_msg.frame;
 		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
 		ipu6_isys_buffer_list_queue(bl,
-					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+					    ISYS_BUFFER_LIST_ACTIVE, 0);
 	}
 
 	reinit_completion(&stream->stream_start_completion);
@@ -659,7 +659,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 static void stop_streaming_firmware(struct ipu6_isys_video *av)
 {
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	int ret, tout;
 
 	reinit_completion(&stream->stream_stop_completion);
@@ -684,7 +684,7 @@ static void stop_streaming_firmware(struct ipu6_isys_video *av)
 
 static void close_streaming_firmware(struct ipu6_isys_video *av)
 {
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	int ret, tout;
 
@@ -713,7 +713,7 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 				   struct media_entity *source_entity,
 				   int nr_queues)
 {
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	struct ipu6_isys_csi2 *csi2;
 
 	if (WARN_ON(stream->nr_streaming))
@@ -797,7 +797,7 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 static void calculate_stream_datarate(struct ipu6_isys_video *av)
 {
 	struct video_stream_watermark *watermark = &av->watermark;
-	const struct ipu6_isys_pixelformat *pfmt =
+	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
 	u64 line_time_ns, stream_data_rate;
@@ -841,7 +841,7 @@ void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
 	update_watermark_setting(av->isys);
 }
 
-void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
+void ipu6_isys_put_stream(struct isys_stream *stream)
 {
 	struct device *dev;
 	unsigned int i;
@@ -868,10 +868,10 @@ void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
 	spin_unlock_irqrestore(&stream->isys->streams_lock, flags);
 }
 
-static struct ipu6_isys_stream *
+static struct isys_stream *
 ipu6_isys_get_stream(struct ipu6_isys_video *av, struct isys_subdev *asd)
 {
-	struct ipu6_isys_stream *stream = NULL;
+	struct isys_stream *stream = NULL;
 	struct ipu6_isys *isys = av->isys;
 	unsigned long flags;
 	unsigned int i;
@@ -906,11 +906,11 @@ ipu6_isys_get_stream(struct ipu6_isys_video *av, struct isys_subdev *asd)
 	return stream;
 }
 
-struct ipu6_isys_stream *
+struct isys_stream *
 ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
 {
 	unsigned long flags;
-	struct ipu6_isys_stream *stream = NULL;
+	struct isys_stream *stream = NULL;
 
 	if (!isys)
 		return NULL;
@@ -931,10 +931,10 @@ ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
 	return stream;
 }
 
-struct ipu6_isys_stream *
+struct isys_stream *
 ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
 {
-	struct ipu6_isys_stream *stream = NULL;
+	struct isys_stream *stream = NULL;
 	unsigned long flags;
 	unsigned int i;
 
@@ -982,10 +982,10 @@ static u64 get_stream_mask_by_pipeline(struct ipu6_isys_video *__av)
 }
 
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
-				  struct ipu6_isys_buffer_list *bl)
+				  struct isys_buffer_list *bl)
 {
 	struct v4l2_subdev_krouting *routing;
-	struct ipu6_isys_stream *stream = av->stream;
+	struct isys_stream *stream = av->stream;
 	struct v4l2_subdev_state *subdev_state;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_subdev *sd;
@@ -1167,7 +1167,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_entity **source_entity, int *nr_queues)
 {
-	const struct ipu6_isys_pixelformat *pfmt =
+	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_mbus_frame_desc_entry entry;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index bca8e65dd5ec..402607242005 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -28,7 +28,7 @@ struct video_stream_watermark {
 };
 
 struct ipu6_isys_video {
-	struct ipu6_isys_queue aq;
+	struct isys_queue aq;
 	/* Serialise access to other fields in the struct. */
 	struct mutex mutex;
 	struct media_pad pad;
@@ -37,7 +37,7 @@ struct ipu6_isys_video {
 	struct v4l2_meta_format meta_fmt;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_csi2 *csi2;
-	struct ipu6_isys_stream *stream;
+	struct isys_stream *stream;
 	unsigned int streaming;
 	struct video_stream_watermark watermark;
 	u32 source_stream;
@@ -48,26 +48,26 @@ struct ipu6_isys_video {
 #define ipu6_isys_queue_to_video(__aq) \
 	container_of(__aq, struct ipu6_isys_video, aq)
 
-extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts[];
-extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
+extern const struct isys_pixelformat ipu6_isys_pfmts[];
+extern const struct isys_pixelformat ipu6_isys_pfmts_packed[];
 
-const struct ipu6_isys_pixelformat *
+const struct isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 				   struct media_entity *source_entity,
 				   int nr_queues);
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
-				  struct ipu6_isys_buffer_list *bl);
+				  struct isys_buffer_list *bl);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_entity **source_entity, int *nr_queues);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
-void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
-struct ipu6_isys_stream *
+void ipu6_isys_put_stream(struct isys_stream *stream);
+struct isys_stream *
 ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
-struct ipu6_isys_stream *
+struct isys_stream *
 ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc);
 
 void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 2267784b86bc..8ac0cc7574de 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -249,7 +249,7 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
 				 i * NR_OF_CSI2_SRC_PADS + j);
 			av->isys = isys;
 			av->aq.vbq.buf_struct_size =
-				sizeof(struct ipu6_isys_video_buffer);
+				sizeof(struct isys_video_buffer);
 
 			ret = ipu6_isys_video_init(av);
 			if (ret)
@@ -306,7 +306,7 @@ void isys_setup_hw(struct ipu6_isys *isys)
 
 static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 {
-	struct ipu6_isys_stream *stream;
+	struct isys_stream *stream;
 	unsigned int i;
 	u32 status;
 	int source;
@@ -982,7 +982,7 @@ static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
 	return -ENOMEM;
 }
 
-struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream)
+struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct isys_stream *stream)
 {
 	struct ipu6_isys *isys = stream->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -1221,7 +1221,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 {
 	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
 	struct ipu6_fw_isys_resp_info_abi *resp;
-	struct ipu6_isys_stream *stream;
+	struct isys_stream *stream;
 	struct ipu6_isys_csi2 *csi2 = NULL;
 	u32 index;
 	u64 ts;
@@ -1292,7 +1292,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 		 * get pin_data_ready event
 		 */
 		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		if (resp->pin_id < ISYS_OUTPUT_PINS &&
 		    stream->output_pins[resp->pin_id].pin_ready)
 			stream->output_pins[resp->pin_id].pin_ready(stream,
 								    resp);
@@ -1319,8 +1319,8 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
 			resp->stream_handle,
 			stream->seq[stream->seq_index].sequence, ts);
-		stream->seq_index = (stream->seq_index + 1)
-			% IPU6_ISYS_MAX_PARALLEL_SOF;
+		stream->seq_index =
+			(stream->seq_index + 1) % ISYS_MAX_PARALLEL_SOF;
 		break;
 	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
 		ipu6_isys_csi2_eof_event_by_stream(stream);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index f488e782c26e..bf6008bfe539 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -134,7 +134,7 @@ struct ipu6_isys {
 	u32 isr_csi2_bits;
 	u32 csi2_rx_ctrl_cached;
 	spinlock_t streams_lock;
-	struct ipu6_isys_stream streams[IPU6_ISYS_MAX_STREAMS];
+	struct isys_stream streams[IPU6_ISYS_MAX_STREAMS];
 	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
 	void *fwcom;
 	u32 phy_termcal_val;
@@ -175,7 +175,7 @@ struct isys_fw_msgs {
 	dma_addr_t dma_addr;
 };
 
-struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream);
+struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct isys_stream *stream);
 void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data);
 void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
diff --git a/drivers/media/pci/intel/ipu6/isys.h b/drivers/media/pci/intel/ipu6/isys.h
index f2a49694a050..d5736ea2b036 100644
--- a/drivers/media/pci/intel/ipu6/isys.h
+++ b/drivers/media/pci/intel/ipu6/isys.h
@@ -24,7 +24,7 @@ struct isys_subdev {
 
 #define to_isys_subdev(__sd) container_of(__sd, struct isys_subdev, sd)
 
-struct ipu6_isys_queue {
+struct isys_queue {
 	struct vb2_queue vbq;
 	struct list_head node;
 	/*
@@ -36,42 +36,42 @@ struct ipu6_isys_queue {
 	unsigned int fw_output;
 };
 
-struct ipu6_isys_buffer {
+struct isys_buffer {
 	struct list_head head;
 	atomic_t str2mmio_flag;
 };
 
-struct ipu6_isys_video_buffer {
+struct isys_video_buffer {
 	struct vb2_v4l2_buffer vb_v4l2;
-	struct ipu6_isys_buffer ib;
+	struct isys_buffer ib;
 	dma_addr_t dma_addr;
 };
 
-struct ipu6_isys_buffer_list {
+struct isys_buffer_list {
 	struct list_head head;
 	unsigned int nbufs;
 };
 
 #define vb2_queue_to_isys_queue(__vb2) \
-	container_of(__vb2, struct ipu6_isys_queue, vbq)
+	container_of(__vb2, struct isys_queue, vbq)
 
-#define vb2_buffer_to_ipu6_isys_video_buffer(__vvb) \
-	container_of(__vvb, struct ipu6_isys_video_buffer, vb_v4l2)
+#define vb2_buffer_to_isys_video_buffer(__vvb) \
+	container_of(__vvb, struct isys_video_buffer, vb_v4l2)
 
-#define ipu6_isys_to_isys_video_buffer(__ib) \
-	container_of(__ib, struct ipu6_isys_video_buffer, ib)
+#define isys_buffer_to_isys_video_buffer(__ib) \
+	container_of(__ib, struct isys_video_buffer, ib)
 
-#define ipu6_isys_buffer_to_vb2_buffer(__ib) \
-	(&ipu6_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
+#define isys_buffer_to_vb2_buffer(__ib) \
+	(&isys_buffer_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
 
-#define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
-#define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
-#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
+#define ISYS_BUFFER_LIST_INCOMING	BIT(0)
+#define ISYS_BUFFER_LIST_ACTIVE		BIT(1)
+#define ISYS_BUFFER_LIST_SET_STATE	BIT(2)
 
-#define IPU6_ISYS_OUTPUT_PINS 11
-#define IPU6_ISYS_MAX_PARALLEL_SOF 2
+#define ISYS_OUTPUT_PINS	11
+#define ISYS_MAX_PARALLEL_SOF	2
 
-struct ipu6_isys_pixelformat {
+struct isys_pixelformat {
 	u32 pixelformat;
 	u32 bpp;
 	u32 bpp_packed;
@@ -85,23 +85,23 @@ struct isys_sequence_info {
 	u64 timestamp;
 };
 
-struct ipu6_isys_stream;
+struct isys_stream;
 
 struct isys_output_pin_data {
-	void (*pin_ready)(struct ipu6_isys_stream *stream, void *_info);
-	struct ipu6_isys_queue *aq;
+	void (*pin_ready)(struct isys_stream *stream, void *_info);
+	struct isys_queue *aq;
 };
 
 /*
  * Align with firmware stream. Each stream represents a CSI virtual channel.
  * May map to multiple video devices
  */
-struct ipu6_isys_stream {
+struct isys_stream {
 	struct mutex mutex;
 	struct media_entity *source_entity;
 	atomic_t sequence;
 	unsigned int seq_index;
-	struct isys_sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
+	struct isys_sequence_info seq[ISYS_MAX_PARALLEL_SOF];
 	int stream_source;
 	int stream_handle;
 	unsigned int nr_output_pins;
@@ -117,7 +117,7 @@ struct ipu6_isys_stream {
 	struct completion stream_stop_completion;
 	struct ipu6_isys *isys;
 
-	struct isys_output_pin_data output_pins[IPU6_ISYS_OUTPUT_PINS];
+	struct isys_output_pin_data output_pins[ISYS_OUTPUT_PINS];
 	int error;
 	u8 vc;
 };
-- 
2.34.1


