Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249C31C35A4
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgEDJ0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgEDJ0u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:50 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F40D4F7;
        Mon,  4 May 2020 11:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584406;
        bh=h1f4LLJwwL0fBSoFl0xi5O2F/8Lszy9bphrat8ky49o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BZrUWm0IeMGoJ1sKI5Z9OTvAHnF8bWGP6a2HY2vfYisU3rr1HpCXX0U4dxrEx2Dux
         e9ljkZOGexON6HKVREzNFucVYCUfX01voAM/EOCzbpAeDOp11bpADdHokXFJB8UBqM
         lR2TvxSZ+BYdY8x6BuMKJfqM9Svwxs79wnvZow5s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oliver Gjoneski <ogjoneski@gmail.com>
Subject: [PATCH v2 28/34] staging: vchiq_2835_arm: Implement a DMA pool for small bulk transfers
Date:   Mon,  4 May 2020 12:26:05 +0300
Message-Id: <20200504092611.9798-29-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Oliver Gjoneski <ogjoneski@gmail.com>

During a bulk transfer we request a DMA allocation to hold the
scatter-gather list.  Most of the time, this allocation is small
(<< PAGE_SIZE), however it can be requested at a high enough frequency
to cause fragmentation and/or stress the CMA allocator (think time
spent in compaction here, or during allocations elsewhere).

Implement a pool to serve up small DMA allocations, falling back
to a coherent allocation if the request is greater than
VCHIQ_DMA_POOL_SIZE.

Signed-off-by: Oliver Gjoneski <ogjoneski@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../interface/vchiq_arm/vchiq_2835_arm.c      | 38 ++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index c18c6ca0b6c0..3e422a7eb3f1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -7,6 +7,7 @@
 #include <linux/interrupt.h>
 #include <linux/pagemap.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
@@ -28,6 +29,8 @@
 #define BELL0	0x00
 #define BELL2	0x08
 
+#define VCHIQ_DMA_POOL_SIZE PAGE_SIZE
+
 struct vchiq_2835_state {
 	int inited;
 	struct vchiq_arm_state arm_state;
@@ -37,6 +40,7 @@ struct vchiq_pagelist_info {
 	struct pagelist *pagelist;
 	size_t pagelist_buffer_size;
 	dma_addr_t dma_addr;
+	bool is_from_pool;
 	enum dma_data_direction dma_dir;
 	unsigned int num_pages;
 	unsigned int pages_need_release;
@@ -57,6 +61,7 @@ static void __iomem *g_regs;
  * of 32.
  */
 static unsigned int g_cache_line_size = 32;
+static struct dma_pool *g_dma_pool;
 static unsigned int g_fragments_size;
 static char *g_fragments_base;
 static char *g_free_fragments;
@@ -159,6 +164,14 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	}
 
 	g_dev = dev;
+	g_dma_pool = dmam_pool_create("vchiq_scatter_pool", dev,
+				      VCHIQ_DMA_POOL_SIZE, g_cache_line_size,
+				      0);
+	if (!g_dma_pool) {
+		dev_err(dev, "failed to create dma pool");
+		return -ENOMEM;
+	}
+
 	vchiq_log_info(vchiq_arm_log_level,
 		"vchiq_init - done (slots %pK, phys %pad)",
 		vchiq_slot_zero, &slot_phys);
@@ -293,9 +306,14 @@ cleanup_pagelistinfo(struct vchiq_pagelist_info *pagelistinfo)
 		for (i = 0; i < pagelistinfo->num_pages; i++)
 			put_page(pagelistinfo->pages[i]);
 	}
-
-	dma_free_coherent(g_dev, pagelistinfo->pagelist_buffer_size,
-			  pagelistinfo->pagelist, pagelistinfo->dma_addr);
+	if (pagelistinfo->is_from_pool) {
+		dma_pool_free(g_dma_pool, pagelistinfo->pagelist,
+			      pagelistinfo->dma_addr);
+	} else {
+		dma_free_coherent(g_dev, pagelistinfo->pagelist_buffer_size,
+				  pagelistinfo->pagelist,
+				  pagelistinfo->dma_addr);
+	}
 }
 
 /* There is a potential problem with partial cache lines (pages?)
@@ -315,6 +333,7 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 	u32 *addrs;
 	unsigned int num_pages, offset, i, k;
 	int actual_pages;
+	bool is_from_pool;
 	size_t pagelist_size;
 	struct scatterlist *scatterlist, *sg;
 	int dma_buffers;
@@ -341,8 +360,16 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 	/* Allocate enough storage to hold the page pointers and the page
 	 * list
 	 */
-	pagelist = dma_alloc_coherent(g_dev, pagelist_size, &dma_addr,
-				      GFP_KERNEL);
+	if (pagelist_size > VCHIQ_DMA_POOL_SIZE) {
+		pagelist = dma_alloc_coherent(g_dev,
+					       pagelist_size,
+					       &dma_addr,
+					       GFP_KERNEL);
+		is_from_pool = false;
+	} else {
+		pagelist = dma_pool_alloc(g_dma_pool, GFP_KERNEL, &dma_addr);
+		is_from_pool = true;
+	}
 
 	vchiq_log_trace(vchiq_arm_log_level, "%s - %pK", __func__, pagelist);
 
@@ -363,6 +390,7 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 	pagelistinfo->pagelist = pagelist;
 	pagelistinfo->pagelist_buffer_size = pagelist_size;
 	pagelistinfo->dma_addr = dma_addr;
+	pagelistinfo->is_from_pool = is_from_pool;
 	pagelistinfo->dma_dir =  (type == PAGELIST_WRITE) ?
 				  DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	pagelistinfo->num_pages = num_pages;
-- 
Regards,

Laurent Pinchart

