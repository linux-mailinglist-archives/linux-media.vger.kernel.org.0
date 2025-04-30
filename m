Return-Path: <linux-media+bounces-31443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9037DAA4A5C
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D2281C01BEC
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA10F2586C1;
	Wed, 30 Apr 2025 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRYJOFt7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117C1E47B4
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014056; cv=none; b=m01JN3UD1PaC+kWi6Z9pEaGVFwXW5qw7hXpvv3RpbGCptZI6ZOEtSIpIDwJYcIR59gOC48uOQm8ZeDKsVXSBNQ166OZEGD/wwKSh53Ec3WlaLeDuGAHb9QYztCIgq4e1eCuynkyRyz8q93POCSxHXbUyeKb/3NBG25TQgscQBWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014056; c=relaxed/simple;
	bh=ozSufCjQGseVDyk/JwFkINZq01UvjsiHJsSiFdI2XK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tov0rq16LTNMU5BQkP8P6TYAFSFKoJBLOlQiJMOsuODoejWNAv2skrDciZaftbF9oG2qboNvUneYKPkMU9bAm68VKhzDs8KyaJIxCrvXgM7MyscnTXY3XPwEFDjguG54HiHUTBcBTEJPUY5tvR8BE9ALHpR6IwiwwTEjFMqeU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRYJOFt7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746014055; x=1777550055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ozSufCjQGseVDyk/JwFkINZq01UvjsiHJsSiFdI2XK8=;
  b=hRYJOFt7/hBKBOOFT5g6kKRhsCC4V18h6zyJPi9s9VzeVzKaEzJ/TEGf
   N63YtpP7TzoH5zHo+ILGxKS7vtKqlJxVupWhHw4fJvRstfKoP5rK+MtOC
   IG/mgFVdqUdth7PE91NTUwd8U3vg1XdOHYHtcevzOnazwTTjYUH1Ie86n
   od+F7w4goAPxot/IqDtJOVZLyq7De0FEnqQp3W93XbigLwatg8yS7lc2R
   PFsBzwkzCmuURELoreeceXbr+hQArXnBuUn1t3luV3PmGyH7cc30z4dMf
   alD6b9N5WFwfoqMIc0QDLplRcQAgp95TLqNYQVp9CsreyTqj0LXGgtH4W
   g==;
X-CSE-ConnectionGUID: XvLXuDA3QBShMKU9hZZJPg==
X-CSE-MsgGUID: Jrp66hcmTqiLrbAKr7Sjqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50326400"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50326400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:14 -0700
X-CSE-ConnectionGUID: gfMSSlwnQlqhwE1PJmob9g==
X-CSE-MsgGUID: bVfoILS+R8y2H102ltAIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134612846"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:11 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 4/5] media: intel/ipu6: Move common structures definitions to ipu-isys.h
Date: Wed, 30 Apr 2025 13:53:49 +0200
Message-Id: <20250430115350.506460-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
References: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
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
index d39dbb11a4a7..e3f9f5fb10e8 100644
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
+	spinlock_t lock;
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
index 6b8dec55f200..b4b14e0ef044 100644
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
-	spinlock_t lock;
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


