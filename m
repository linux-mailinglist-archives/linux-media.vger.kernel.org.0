Return-Path: <linux-media+bounces-6302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FE86F5D5
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4641C21958
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AF767E76;
	Sun,  3 Mar 2024 15:27:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDB467C55
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479638; cv=none; b=iMpxa6GXZnm2bgFUszEbIgZZnOyrUVF2mh6/K5XlFy7NX6WB4QBoA3ofmc3zNBiTRfL+9yFvXr2R7wanZlwEUP5R4cTyTt+tnbu2ttF3GAcZJu4WsI/OEDzho10E56SRNVzv+8eEXWGJjsbOv418hlehwuZtlcMTW+/mtH1CWzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479638; c=relaxed/simple;
	bh=4o+PCbLr2oP+VZi0X1UpFX3IBP1F7mz3dMkh3sNEKg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7eL2/qubpLohtUjpjzAia8qNME2qmr7QqD+/OpVv6m4zkUzqFDOe9e4r4tFHlQh9qcM56B51Xk4oOzwzZYvU25HJHxbfq110Uah3qMzc62jy6NbD73mDgH2FQNDsqxBGh6NjKqykrA/BxtqBscMiHGLjHMIC7zRoomlyOaJTdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 5FC6F4C08C;
	Sun,  3 Mar 2024 16:27:16 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	detule <ogjoneski@gmail.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 06/13] staging: vchiq_arm: Usa a DMA pool for small bulks
Date: Sun,  3 Mar 2024 16:10:01 +0100
Message-ID: <20240303152635.2762696-7-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240303152635.2762696-1-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: detule <ogjoneski@gmail.com>

During a bulk transfer we request a DMA allocation to hold the
scatter-gather list.  Most of the time, this allocation is small
(<< PAGE_SIZE), however it can be requested at a high enough frequency
to cause fragmentation and/or stress the CMA allocator (think time
spent in compaction here, or during allocations elsewhere).

Implement a pool to serve up small DMA allocations, falling back
to a coherent allocation if the request is greater than
VCHIQ_DMA_POOL_SIZE.

Signed-off-by: Oliver Gjoneski <ogjoneski@gmail.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 33 ++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e306f420d767..eb15aa011a22 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/compat.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
 #include <linux/rcupdate.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -54,6 +55,8 @@
 
 #define ARM_DS_ACTIVE	BIT(2)
 
+#define VCHIQ_DMA_POOL_SIZE PAGE_SIZE
+
 /* Override the default prefix, which would be vchiq_arm (from the filename) */
 #undef MODULE_PARAM_PREFIX
 #define MODULE_PARAM_PREFIX DEVICE_NAME "."
@@ -136,6 +139,7 @@ struct vchiq_pagelist_info {
 	struct pagelist *pagelist;
 	size_t pagelist_buffer_size;
 	dma_addr_t dma_addr;
+	bool is_from_pool;
 	enum dma_data_direction dma_dir;
 	unsigned int num_pages;
 	unsigned int pages_need_release;
@@ -156,6 +160,7 @@ static void __iomem *g_regs;
  * of 32.
  */
 static unsigned int g_cache_line_size = 32;
+static struct dma_pool *g_dma_pool;
 static unsigned int g_use_36bit_addrs = 0;
 static unsigned int g_fragments_size;
 static char *g_fragments_base;
@@ -198,8 +203,13 @@ cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info
 	if (pagelistinfo->pages_need_release)
 		unpin_user_pages(pagelistinfo->pages, pagelistinfo->num_pages);
 
-	dma_free_coherent(instance->state->dev, pagelistinfo->pagelist_buffer_size,
-			  pagelistinfo->pagelist, pagelistinfo->dma_addr);
+	if (pagelistinfo->is_from_pool) {
+		dma_pool_free(g_dma_pool, pagelistinfo->pagelist,
+			      pagelistinfo->dma_addr);
+	} else {
+		dma_free_coherent(instance->state->dev, pagelistinfo->pagelist_buffer_size,
+				  pagelistinfo->pagelist, pagelistinfo->dma_addr);
+	}
 }
 
 static inline bool
@@ -234,6 +244,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	u32 *addrs;
 	unsigned int num_pages, offset, i, k;
 	int actual_pages;
+	bool is_from_pool;
 	size_t pagelist_size;
 	struct scatterlist *scatterlist, *sg;
 	int dma_buffers;
@@ -263,8 +274,14 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	/* Allocate enough storage to hold the page pointers and the page
 	 * list
 	 */
-	pagelist = dma_alloc_coherent(instance->state->dev, pagelist_size, &dma_addr,
-				      GFP_KERNEL);
+	if (pagelist_size > VCHIQ_DMA_POOL_SIZE) {
+		pagelist = dma_alloc_coherent(instance->state->dev, pagelist_size, &dma_addr,
+					      GFP_KERNEL);
+		is_from_pool = false;
+	} else {
+		pagelist = dma_pool_alloc(g_dma_pool, GFP_KERNEL, &dma_addr);
+		is_from_pool = true;
+	}
 
 	dev_dbg(instance->state->dev, "arm: %pK\n", pagelist);
 
@@ -285,6 +302,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	pagelistinfo->pagelist = pagelist;
 	pagelistinfo->pagelist_buffer_size = pagelist_size;
 	pagelistinfo->dma_addr = dma_addr;
+	pagelistinfo->is_from_pool = is_from_pool;
 	pagelistinfo->dma_dir =  (type == PAGELIST_WRITE) ?
 				  DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	pagelistinfo->num_pages = num_pages;
@@ -625,6 +643,13 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
 		vchiq_slot_zero, &slot_phys);
 	g_dma_dev = dma_dev ?: dev;
+	g_dma_pool = dmam_pool_create("vchiq_scatter_pool", dev,
+				      VCHIQ_DMA_POOL_SIZE, g_cache_line_size,
+				      0);
+	if (!g_dma_pool) {
+		dev_err(dev, "failed to create dma pool");
+		return -ENOMEM;
+	}
 
 	vchiq_call_connected_callbacks();
 
-- 
2.41.0


