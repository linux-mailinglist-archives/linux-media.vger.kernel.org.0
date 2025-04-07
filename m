Return-Path: <linux-media+bounces-29514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE42A7DFBF
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7278C16CA19
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE7119D07C;
	Mon,  7 Apr 2025 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPy7FK2t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9A187553
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033259; cv=none; b=nYi7+HDWaGuxJymclv2MgoSRmyzcKBK7SkjCR6f2oxw8SWrTYMdEuGBtlbKFR7AlALbmHPD4p4awiZ1mAd5cRmRjZvfg+ia9L5X2qb0hs5d/PQVFGKGFszl6L5IIPjNkcCrCQXk+BglmT6dcauAj40aNsfGDKYr4hLEgc4+lLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033259; c=relaxed/simple;
	bh=w5CeYWw33jr5ftWsNaOxXcVacnKXP3Cem/ZpBM5HjCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kh8IThwMLskYdGlGr5CkTGw+DzfDD/VogN98iIRhD0ENJ+A6xurkZNW3iKmLZb61KN7GD6SmoZ1KzNRqiEGlN8ERs3EO/V+8BWt8eUNor8PkfNCK1/7ChInIIi1xyv/FnHke2IvppFsmIqJx9CpFf9T+PVJzTmafJlFV/lfGkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPy7FK2t; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033258; x=1775569258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5CeYWw33jr5ftWsNaOxXcVacnKXP3Cem/ZpBM5HjCg=;
  b=EPy7FK2tg5v5VWFD9d9C6rbR1w/q/bfNrqEOsojMYTN7LS9a5yL4ae3W
   4EGD5jWnNCzv+jjOuDULkLCn6jLg4WcLdE5J/R9TV5qorI5jBdcp2GNHY
   vBnqSWLPrqr43w8UB+T44tRo0CEMKQOVpPynagrEKpcZUJtWoWuoQoA7n
   wK4SqEDzNPsHweQcneCRZ4RJ0ViswhPX0ea2OdHGTXvZG4bIKmq5Zvwoh
   kg3//+cWm+zQt/Qhn6IxBToZycKlbAZs3yu+BDyRxudnwG8tTS0uH015Y
   +yDx6V9PXclp1+Ml3niCZim+tl4VOVfNo0tO0aa5cmElG0fV7NgHpZ0bL
   A==;
X-CSE-ConnectionGUID: hWVHDiscQFSs6kaDUUe4Sw==
X-CSE-MsgGUID: 8b45es6CRl+fzSlbro/sxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45322436"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45322436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:58 -0700
X-CSE-ConnectionGUID: kWGdlzY7TgGJOrk10YySNw==
X-CSE-MsgGUID: /X1btUBrRqmdexJeh9Ci0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127713238"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:57 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 3/7] media: intel/ipu6: Move common structures definitions to isys.h
Date: Mon,  7 Apr 2025 15:40:33 +0200
Message-Id: <20250407134037.808367-4-stanislaw.gruszka@linux.intel.com>
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

Move some structures that will be reused in ipu7 to isys.h file.
Use one header file instead of multiple, since we frequently include
most of ipu6-*.h headers in c files anyways.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   1 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  56 +---------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  59 +---------
 drivers/media/pci/intel/ipu6/isys.h           | 102 ++++++++++++++++++
 4 files changed, 105 insertions(+), 113 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 5fc52a3b89e6..252097c61d0a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -20,6 +20,7 @@
 #include "ipu6-dma.h"
 #include "ipu6-fw-isys.h"
 #include "ipu6-isys.h"
+#include "ipu6-isys-queue.h"
 #include "ipu6-isys-video.h"
 
 static int ipu6_isys_buf_init(struct vb2_buffer *vb)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 00666098bbdc..6a95858bfd59 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -4,62 +4,8 @@
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
 #include "ipu6-fw-isys.h"
-#include "ipu6-isys-video.h"
-
-struct ipu6_isys_stream;
-
-struct ipu6_isys_queue {
-	struct vb2_queue vbq;
-	struct list_head node;
-	/*
-	 * @lock: serialise access to queued and pre_streamon_queued
-	 */
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
+#include "isys.h"
 
 void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 				 unsigned long op_flags,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index f4dee6120635..bca8e65dd5ec 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -13,64 +13,7 @@
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
-struct isys_subdev;
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
-struct output_pin_data {
-	void (*pin_ready)(struct ipu6_isys_stream *stream, void *_info);
-	struct ipu6_isys_queue *aq;
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
-	struct isys_subdev *asd;
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
-	struct output_pin_data output_pins[IPU6_ISYS_OUTPUT_PINS];
-	int error;
-	u8 vc;
-};
+#include "isys.h"
 
 struct video_stream_watermark {
 	u32 width;
diff --git a/drivers/media/pci/intel/ipu6/isys.h b/drivers/media/pci/intel/ipu6/isys.h
index b6ddadfc374b..f2a49694a050 100644
--- a/drivers/media/pci/intel/ipu6/isys.h
+++ b/drivers/media/pci/intel/ipu6/isys.h
@@ -4,10 +4,14 @@
 #ifndef ISYS_H
 #define ISYS_H
 
+#include <linux/atomic.h>
 #include <linux/container_of.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
 
 struct isys_subdev {
 	struct v4l2_subdev sd;
@@ -20,6 +24,104 @@ struct isys_subdev {
 
 #define to_isys_subdev(__sd) container_of(__sd, struct isys_subdev, sd)
 
+struct ipu6_isys_queue {
+	struct vb2_queue vbq;
+	struct list_head node;
+	/*
+	 * @lock: serialise access to queued and pre_streamon_queued
+	 */
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
+#define vb2_buffer_to_ipu6_isys_video_buffer(__vvb) \
+	container_of(__vvb, struct ipu6_isys_video_buffer, vb_v4l2)
+
+#define ipu6_isys_to_isys_video_buffer(__ib) \
+	container_of(__ib, struct ipu6_isys_video_buffer, ib)
+
+#define ipu6_isys_buffer_to_vb2_buffer(__ib) \
+	(&ipu6_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
+
+#define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
+#define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
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
+struct isys_sequence_info {
+	unsigned int sequence;
+	u64 timestamp;
+};
+
+struct ipu6_isys_stream;
+
+struct isys_output_pin_data {
+	void (*pin_ready)(struct ipu6_isys_stream *stream, void *_info);
+	struct ipu6_isys_queue *aq;
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
+	struct isys_sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
+	int stream_source;
+	int stream_handle;
+	unsigned int nr_output_pins;
+	struct isys_subdev *asd;
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
+	struct isys_output_pin_data output_pins[IPU6_ISYS_OUTPUT_PINS];
+	int error;
+	u8 vc;
+};
+
 int isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 			    struct v4l2_mbus_framefmt *format);
 int isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
-- 
2.34.1


