Return-Path: <linux-media+bounces-6301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752886F5D4
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9331BB2544B
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B7967C62;
	Sun,  3 Mar 2024 15:27:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160D667C52
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479638; cv=none; b=gWNgpe7igbSQdVU66Q11ajrzLp+1T9mNi7WWv6VURIfoZGB2VZamYZugpPCnbwDQo2S6g6Sqc3jFZKjhRpFZgGf+swbbNxnqBbvBU7HlKVcEgAu6X8ar1IqZqllBEZIE4c0f/EvbXNCuqEcXjIDy0/IZBDCjTEn3Xxt26EdxLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479638; c=relaxed/simple;
	bh=XC55Qgr3NiSpeJk0J60Q9sONwPrGTZ2qsXbuPJsIWhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSmbRDxgPQiP3XEBllgfX/FtUTjwI6lQJPbvHxY0BYOWDR+vb0eMCIYtOg+/7rI95mYSKemr8Wx0MUMQhW916D5uo5HXXF+PpmLKat1v+nM5lNo1KJbf84PvnR79QHUkFphGtHkX7lx3rigTOy7m7rf3yWZ0Qg+RV0j7aUZA9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 0DB8C4C088;
	Sun,  3 Mar 2024 16:27:15 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 05/13] staging: vchiq_arm: Add 36-bit address support
Date: Sun,  3 Mar 2024 16:10:00 +0100
Message-ID: <20240303152635.2762696-6-maarten@rmail.be>
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

From: Phil Elwell <phil@raspberrypi.com>

Conditional on a new compatible string, change the pagelist encoding
such that the top 24 bits are the pfn, leaving 8 bits for run length
(-1), giving a 36-bit address range.

Manage the split between addresses for the VPU and addresses for the
40-bit DMA controller with a dedicated DMA device pointer that on non-
BCM2711 platforms is the same as the main VCHIQ device. This allows
the VCHIQ node to stay in the usual place in the DT.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 111 ++++++++++++++----
 1 file changed, 90 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0ffb8e60155c..e306f420d767 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -20,6 +20,7 @@
 #include <linux/completion.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/compat.h>
 #include <linux/dma-mapping.h>
@@ -75,6 +76,7 @@ static struct vchiq_device *vcsm_cma;
 
 struct vchiq_drvdata {
 	const unsigned int cache_line_size;
+	const bool use_36bit_addrs;
 	struct rpi_firmware *fw;
 };
 
@@ -120,6 +122,11 @@ struct vchiq_arm_state {
 	int first_connect;
 };
 
+static struct vchiq_drvdata bcm2711_drvdata = {
+	.cache_line_size = 64,
+	.use_36bit_addrs = true,
+};
+
 struct vchiq_2835_state {
 	int inited;
 	struct vchiq_arm_state arm_state;
@@ -149,10 +156,12 @@ static void __iomem *g_regs;
  * of 32.
  */
 static unsigned int g_cache_line_size = 32;
+static unsigned int g_use_36bit_addrs = 0;
 static unsigned int g_fragments_size;
 static char *g_fragments_base;
 static char *g_free_fragments;
 static struct semaphore g_free_fragments_sema;
+static struct device *g_dma_dev;
 
 static DEFINE_SEMAPHORE(g_free_fragments_mutex, 1);
 
@@ -182,7 +191,7 @@ static void
 cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo)
 {
 	if (pagelistinfo->scatterlist_mapped) {
-		dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
+		dma_unmap_sg(g_dma_dev, pagelistinfo->scatterlist,
 			     pagelistinfo->num_pages, pagelistinfo->dma_dir);
 	}
 
@@ -341,7 +350,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 		count -= len;
 	}
 
-	dma_buffers = dma_map_sg(instance->state->dev,
+	dma_buffers = dma_map_sg(g_dma_dev,
 				 scatterlist,
 				 num_pages,
 				 pagelistinfo->dma_dir);
@@ -355,22 +364,61 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 
 	/* Combine adjacent blocks for performance */
 	k = 0;
-	for_each_sg(scatterlist, sg, dma_buffers, i) {
-		u32 len = sg_dma_len(sg);
-		u32 addr = sg_dma_address(sg);
-
-		/* Note: addrs is the address + page_count - 1
-		 * The firmware expects blocks after the first to be page-
-		 * aligned and a multiple of the page size
-		 */
-		WARN_ON(len == 0);
-		WARN_ON(i && (i != (dma_buffers - 1)) && (len & ~PAGE_MASK));
-		WARN_ON(i && (addr & ~PAGE_MASK));
-		if (is_adjacent_block(addrs, addr, k))
-			addrs[k - 1] += ((len + PAGE_SIZE - 1) >> PAGE_SHIFT);
-		else
-			addrs[k++] = (addr & PAGE_MASK) |
-				(((len + PAGE_SIZE - 1) >> PAGE_SHIFT) - 1);
+	if (g_use_36bit_addrs) {
+		for_each_sg(scatterlist, sg, dma_buffers, i) {
+			u32 len = sg_dma_len(sg);
+			u64 addr = sg_dma_address(sg);
+			u32 page_id = (u32)((addr >> 4) & ~0xff);
+			u32 sg_pages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+
+			/* Note: addrs is the address + page_count - 1
+			 * The firmware expects blocks after the first to be page-
+			 * aligned and a multiple of the page size
+			 */
+			WARN_ON(len == 0);
+			WARN_ON(i &&
+				(i != (dma_buffers - 1)) && (len & ~PAGE_MASK));
+			WARN_ON(i && (addr & ~PAGE_MASK));
+			WARN_ON(upper_32_bits(addr) > 0xf);
+
+			if (k > 0 &&
+			    ((addrs[k - 1] & ~0xff) +
+			     (((addrs[k - 1] & 0xff) + 1) << 8)
+			     == page_id)) {
+				u32 inc_pages = min(sg_pages,
+						    0xff - (addrs[k - 1] & 0xff));
+				addrs[k - 1] += inc_pages;
+				page_id += inc_pages << 8;
+				sg_pages -= inc_pages;
+			}
+			while (sg_pages) {
+				u32 inc_pages = min(sg_pages, 0x100u);
+				addrs[k++] = page_id | (inc_pages - 1);
+				page_id += inc_pages << 8;
+				sg_pages -= inc_pages;
+			}
+		}
+	} else {
+		for_each_sg(scatterlist, sg, dma_buffers, i) {
+			u32 len = sg_dma_len(sg);
+			u32 addr = sg_dma_address(sg);
+			u32 new_pages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+
+			/* Note: addrs is the address + page_count - 1
+			 * The firmware expects blocks after the first to be page-
+			 * aligned and a multiple of the page size
+			 */
+			WARN_ON(len == 0);
+			WARN_ON(i && (i != (dma_buffers - 1)) && (len & ~PAGE_MASK));
+			WARN_ON(i && (addr & ~PAGE_MASK));
+			if (k > 0 &&
+			    ((addrs[k - 1] & PAGE_MASK) +
+			     (((addrs[k - 1] & ~PAGE_MASK) + 1) << PAGE_SHIFT))
+			    == (addr & PAGE_MASK))
+				addrs[k - 1] += new_pages;
+			else
+				addrs[k++] = (addr & PAGE_MASK) | (new_pages - 1);
+		}
 	}
 
 	/* Partial cache lines (fragments) require special measures */
@@ -413,7 +461,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	 * NOTE: dma_unmap_sg must be called before the
 	 * cpu can touch any of the data/pages.
 	 */
-	dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
+	dma_unmap_sg(g_dma_dev, pagelistinfo->scatterlist,
 		     pagelistinfo->num_pages, pagelistinfo->dma_dir);
 	pagelistinfo->scatterlist_mapped = 0;
 
@@ -468,6 +516,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
+	struct device *dma_dev = NULL;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
 	struct rpi_firmware *fw = drvdata->fw;
 	struct vchiq_slot_zero *vchiq_slot_zero;
@@ -489,6 +538,24 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	g_cache_line_size = drvdata->cache_line_size;
 	g_fragments_size = 2 * g_cache_line_size;
 
+	if (drvdata->use_36bit_addrs) {
+		struct device_node *dma_node =
+			of_find_compatible_node(NULL, NULL, "brcm,bcm2711-dma");
+
+		if (dma_node) {
+			struct platform_device *pdev;
+
+			pdev = of_find_device_by_node(dma_node);
+			if (pdev)
+				dma_dev = &pdev->dev;
+			of_node_put(dma_node);
+			g_use_36bit_addrs = true;
+		} else {
+			dev_err(dev, "40-bit DMA controller not found\n");
+			return -EINVAL;
+		}
+	}
+
 	/* Allocate space for the channels in coherent memory */
 	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
 	frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
@@ -501,13 +568,14 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	}
 
 	WARN_ON(((unsigned long)slot_mem & (PAGE_SIZE - 1)) != 0);
+	channelbase = slot_phys;
 
 	vchiq_slot_zero = vchiq_init_slots(dev, slot_mem, slot_mem_size);
 	if (!vchiq_slot_zero)
 		return -ENOMEM;
 
 	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_OFFSET_IDX] =
-		(int)slot_phys + slot_mem_size;
+		channelbase + slot_mem_size;
 	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
 		MAX_FRAGMENTS;
 
@@ -541,7 +609,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	}
 
 	/* Send the base address of the slots to VideoCore */
-	channelbase = slot_phys;
 	err = rpi_firmware_property(fw, RPI_FIRMWARE_VCHIQ_INIT,
 				    &channelbase, sizeof(channelbase));
 	if (err) {
@@ -557,6 +624,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
 		vchiq_slot_zero, &slot_phys);
+	g_dma_dev = dma_dev ?: dev;
 
 	vchiq_call_connected_callbacks();
 
@@ -1710,6 +1778,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 static const struct of_device_id vchiq_of_match[] = {
 	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
 	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
+	{ .compatible = "brcm,bcm2711-vchiq", .data = &bcm2711_drvdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vchiq_of_match);
-- 
2.41.0


