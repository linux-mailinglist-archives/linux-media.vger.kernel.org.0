Return-Path: <linux-media+bounces-31625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8066AA7658
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FDF99848C3
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB254258CFC;
	Fri,  2 May 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekC8rm1N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81019004A
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200708; cv=none; b=thV421Ess30rDg5m/bar9FJG2Ov281l2paBoRuJj4WngB6nE8+tHEkrKoK90Gs91Fz3zoAOyYNi8zA/Ed+edb5Oyn4MtHqZbnKKQgxNkBU8q0+Y1IRnuzTb7IwrBZQ9y03VQTOAqRM+zfOaqizVNfONWdwgONJNWxQtaqkOeBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200708; c=relaxed/simple;
	bh=im74MGMavQwj5I031m7PspeFpzo9OVxmW6+/AeKhduw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a95Lo/QMwLPZVBT0b6Imawd9j2PgcLTrWJtUdYGrWKt34l5Ks4r8LKjFmIh6ne+zIav+cLdDgvB1iL7cJ5toff6QVJ7khE8nn1q+gvddBEYxfSDysrY5Mb0m1uEEIieGubPl8Mg6qm8Y2TSTG/goH+7VVCyWFMy/zYKvx6rq1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekC8rm1N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200706; x=1777736706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=im74MGMavQwj5I031m7PspeFpzo9OVxmW6+/AeKhduw=;
  b=ekC8rm1NIn8exSeDuqCVYvfOLMABHp0QbA2SIPH1L0qo8C8Du/Uf0iDr
   uhikou+Bdr+Rv4ZV6S8eQJBgYGZQ14bRimG6c30BypX16HAtRIz7V98zb
   fc2a53rjn3M/m9ngpmzLiiw0XeIQA3hRlXInMxYzypLiHv3Zh1qKc/sb9
   NT0xixrT5JC4m0SUudMycx1MqNjXubtVuP3szsj64HVuCQIa24CcYpvyr
   CtwPQeua7kD5qECGveYgAMZ7AreNRRNgP37w56p+0LtUUJIjTazSwfvmp
   CJ9dLkiyZSrXzdRKGBJGs0pbJ7AIj7o6SXO6t4PpTGnour4Abz5XUtta+
   Q==;
X-CSE-ConnectionGUID: syXwxmXcR5e97qm/JaVrGg==
X-CSE-MsgGUID: jWtMPJhgRg6Ow0A8tiR+rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58551585"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58551585"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:45:06 -0700
X-CSE-ConnectionGUID: 0DHSf4qoQfSto5kmaXAZuA==
X-CSE-MsgGUID: 11xTKnjIQkCWQh8/MSdFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134626239"
Received: from csteflea-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.252.84])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:45:04 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 4/5] media: intel/ipu6: Move common structures definitions to ipu-isys.h
Date: Fri,  2 May 2025 17:44:45 +0200
Message-Id: <20250502154446.88965-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
References: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some structures that will be reused in ipu7 to ipu-isys.h file.
Use one header file instead of multiple, since we frequently include
most of ipu6-*.h headers in c files anyways.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu-isys.h       | 92 +++++++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    | 53 +----------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    | 54 +----------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  1 +
 5 files changed, 96 insertions(+), 106 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu-isys.h b/drivers/media/pci/intel/ipu6/ipu-isys.h
index d39dbb11a4a7..69a790695856 100644
--- a/drivers/media/pci/intel/ipu6/ipu-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu-isys.h
@@ -4,10 +4,14 @@
 #ifndef IPU_ISYS_H
 #define IPU_ISYS_H
 
+#include <linux/atomic.h>
 #include <linux/container_of.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
 
 struct ipu_isys_subdev {
 	struct v4l2_subdev sd;
@@ -20,6 +24,94 @@ struct ipu_isys_subdev {
 
 #define to_ipu_isys_subdev(__sd) container_of(__sd, struct ipu_isys_subdev, sd)
 
+struct ipu6_isys_queue {
+	struct vb2_queue vbq;
+	struct list_head node;
+	spinlock_t lock; /* Protects active and incoming lists */
+	struct list_head active;
+	struct list_head incoming;
+	unsigned int fw_output;
+};
+
+struct ipu6_isys_buffer {
+	struct list_head head;
+	atomic_t str2mmio_flag;
+};
+
+struct ipu6_isys_video_buffer {
+	struct vb2_v4l2_buffer vb_v4l2;
+	struct ipu6_isys_buffer ib;
+	dma_addr_t dma_addr;
+};
+
+struct ipu6_isys_buffer_list {
+	struct list_head head;
+	unsigned int nbufs;
+};
+
+#define vb2_queue_to_isys_queue(__vb2) \
+	container_of(__vb2, struct ipu6_isys_queue, vbq)
+
+#define ipu6_isys_to_isys_video_buffer(__ib) \
+	container_of(__ib, struct ipu6_isys_video_buffer, ib)
+
+#define vb2_buffer_to_ipu6_isys_video_buffer(__vvb) \
+	container_of(__vvb, struct ipu6_isys_video_buffer, vb_v4l2)
+
+#define ipu6_isys_buffer_to_vb2_buffer(__ib) \
+	(&ipu6_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
+
+#define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
+#define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE		BIT(1)
+#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
+
+#define IPU6_ISYS_OUTPUT_PINS 11
+#define IPU6_ISYS_MAX_PARALLEL_SOF 2
+
+struct ipu6_isys_pixelformat {
+	u32 pixelformat;
+	u32 bpp;
+	u32 bpp_packed;
+	u32 code;
+	u32 css_pixelformat;
+	bool is_meta;
+};
+
+struct ipu_isys_sequence_info {
+	unsigned int sequence;
+	u64 timestamp;
+};
+
+/*
+ * Align with firmware stream. Each stream represents a CSI virtual channel.
+ * May map to multiple video devices
+ */
+struct ipu6_isys_stream {
+	struct mutex mutex;
+	struct media_entity *source_entity;
+	atomic_t sequence;
+	unsigned int seq_index;
+	struct ipu_isys_sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
+	int stream_source;
+	int stream_handle;
+	unsigned int nr_output_pins;
+	struct ipu_isys_subdev *asd;
+
+	int nr_queues;	/* Number of capture queues */
+	int nr_streaming;
+	int streaming;	/* Has streaming been really started? */
+	struct list_head queues;
+	struct completion stream_open_completion;
+	struct completion stream_close_completion;
+	struct completion stream_start_completion;
+	struct completion stream_stop_completion;
+	struct ipu6_isys *isys;
+
+	struct ipu6_isys_queue *output_pins_queue[IPU6_ISYS_OUTPUT_PINS];
+	int error;
+	u8 vc;
+};
+
 int ipu_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 				struct v4l2_mbus_framefmt *format);
 int ipu_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 3998b0087da3..ad813323e62b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -20,7 +20,7 @@
 #include "ipu6-dma.h"
 #include "ipu6-fw-isys.h"
 #include "ipu6-isys.h"
-#include "ipu6-isys-video.h"
+#include "ipu6-isys-queue.h"
 
 static int ipu6_isys_buf_init(struct vb2_buffer *vb)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 844dfda15ab6..b4b14e0ef044 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -4,59 +4,8 @@
 #ifndef IPU6_ISYS_QUEUE_H
 #define IPU6_ISYS_QUEUE_H
 
-#include <linux/container_of.h>
-#include <linux/atomic.h>
-#include <linux/device.h>
-#include <linux/list.h>
-#include <linux/spinlock_types.h>
-
-#include <media/videobuf2-v4l2.h>
-
+#include "ipu-isys.h"
 #include "ipu6-fw-isys.h"
-#include "ipu6-isys-video.h"
-
-struct ipu6_isys_stream;
-
-struct ipu6_isys_queue {
-	struct vb2_queue vbq;
-	struct list_head node;
-	spinlock_t lock; /* Protects active and incoming lists */
-	struct list_head active;
-	struct list_head incoming;
-	unsigned int fw_output;
-};
-
-struct ipu6_isys_buffer {
-	struct list_head head;
-	atomic_t str2mmio_flag;
-};
-
-struct ipu6_isys_video_buffer {
-	struct vb2_v4l2_buffer vb_v4l2;
-	struct ipu6_isys_buffer ib;
-	dma_addr_t dma_addr;
-};
-
-#define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
-#define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
-#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
-
-struct ipu6_isys_buffer_list {
-	struct list_head head;
-	unsigned int nbufs;
-};
-
-#define vb2_queue_to_isys_queue(__vb2) \
-	container_of(__vb2, struct ipu6_isys_queue, vbq)
-
-#define ipu6_isys_to_isys_video_buffer(__ib) \
-	container_of(__ib, struct ipu6_isys_video_buffer, ib)
-
-#define vb2_buffer_to_ipu6_isys_video_buffer(__vvb) \
-	container_of(__vvb, struct ipu6_isys_video_buffer, vb_v4l2)
-
-#define ipu6_isys_buffer_to_vb2_buffer(__ib) \
-	(&ipu6_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
 
 void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 				 unsigned long op_flags,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 7b347c99d907..0b80d73173ff 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -13,59 +13,7 @@
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 
-#include "ipu6-isys-queue.h"
-
-#define IPU6_ISYS_OUTPUT_PINS 11
-#define IPU6_ISYS_MAX_PARALLEL_SOF 2
-
-struct file;
-struct ipu6_isys;
-struct ipu6_isys_csi2;
-struct ipu_isys_subdev;
-
-struct ipu6_isys_pixelformat {
-	u32 pixelformat;
-	u32 bpp;
-	u32 bpp_packed;
-	u32 code;
-	u32 css_pixelformat;
-	bool is_meta;
-};
-
-struct sequence_info {
-	unsigned int sequence;
-	u64 timestamp;
-};
-
-/*
- * Align with firmware stream. Each stream represents a CSI virtual channel.
- * May map to multiple video devices
- */
-struct ipu6_isys_stream {
-	struct mutex mutex;
-	struct media_entity *source_entity;
-	atomic_t sequence;
-	unsigned int seq_index;
-	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
-	int stream_source;
-	int stream_handle;
-	unsigned int nr_output_pins;
-	struct ipu_isys_subdev *asd;
-
-	int nr_queues;	/* Number of capture queues */
-	int nr_streaming;
-	int streaming;	/* Has streaming been really started? */
-	struct list_head queues;
-	struct completion stream_open_completion;
-	struct completion stream_close_completion;
-	struct completion stream_start_completion;
-	struct completion stream_stop_completion;
-	struct ipu6_isys *isys;
-
-	struct ipu6_isys_queue *output_pins_queue[IPU6_ISYS_OUTPUT_PINS];
-	int error;
-	u8 vc;
-};
+#include "ipu-isys.h"
 
 struct video_stream_watermark {
 	u32 width;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8286dea681fb..7fc529b5a9f5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -37,6 +37,7 @@
 #include "ipu6-dma.h"
 #include "ipu6-isys.h"
 #include "ipu6-isys-csi2.h"
+#include "ipu6-isys-queue.h"
 #include "ipu6-mmu.h"
 #include "ipu6-platform-buttress-regs.h"
 #include "ipu6-platform-isys-csi2-reg.h"
-- 
2.34.1


