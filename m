Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A0C1C35A7
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgEDJ0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbgEDJ0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:52 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B05D2122D;
        Mon,  4 May 2020 11:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584407;
        bh=Xc+03rJOLzY9YeBMxi1IzWdzC5nCF0ClGsyZ+jt95bc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=snjCtUc5V3qf/NRAus8cbTeVhNAvr/BVrH+QKmHaKkpaLa6olzbuZA+T6iI8S0VDk
         P15jrJIb+3dXgyfW/PmjqBvjyFTHtG6Hl7orucoltiUsj9dqgEQvR5I48vo5XaOaco
         hdqhsy7imx7+0B/iSdoUjd0SPxj02+ZpbgJ83jW0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 29/34] staging: vchiq: Add 36-bit address support
Date:   Mon,  4 May 2020 12:26:06 +0300
Message-Id: <20200504092611.9798-30-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.org>

Conditional on a new compatible string, change the pagelist encoding
such that the top 24 bits are the pfn, leaving 8 bits for run length
(-1).

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../interface/vchiq_arm/vchiq_2835_arm.c      | 88 ++++++++++++++-----
 .../interface/vchiq_arm/vchiq_arm.c           |  6 ++
 .../interface/vchiq_arm/vchiq_arm.h           |  1 +
 3 files changed, 74 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index 3e422a7eb3f1..ecec84ad4345 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -16,6 +16,8 @@
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
 #define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
+#define VC_SAFE(x) (g_use_36bit_addrs ? ((u32)(x) | 0xc0000000) : (u32)(x))
+#define IS_VC_SAFE(x) (g_use_36bit_addrs ? !((x) & ~0x3fffffffull) : 1)
 
 #include "vchiq_arm.h"
 #include "vchiq_connected.h"
@@ -62,6 +64,7 @@ static void __iomem *g_regs;
  */
 static unsigned int g_cache_line_size = 32;
 static struct dma_pool *g_dma_pool;
+static unsigned int g_use_36bit_addrs = 0;
 static unsigned int g_fragments_size;
 static char *g_fragments_base;
 static char *g_free_fragments;
@@ -104,6 +107,8 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	g_cache_line_size = drvdata->cache_line_size;
 	g_fragments_size = 2 * g_cache_line_size;
 
+	g_use_36bit_addrs = (dev->dma_pfn_offset == 0);
+
 	/* Allocate space for the channels in coherent memory */
 	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
 	frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
@@ -115,14 +120,21 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 		return -ENOMEM;
 	}
 
+	if (!IS_VC_SAFE(slot_phys)) {
+		dev_err(dev, "allocated DMA memory %pad is not VC-safe\n",
+			&slot_phys);
+		return -ENOMEM;
+	}
+
 	WARN_ON(((unsigned long)slot_mem & (PAGE_SIZE - 1)) != 0);
+	channelbase = VC_SAFE(slot_phys);
 
 	vchiq_slot_zero = vchiq_init_slots(slot_mem, slot_mem_size);
 	if (!vchiq_slot_zero)
 		return -EINVAL;
 
 	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_OFFSET_IDX] =
-		(int)slot_phys + slot_mem_size;
+		channelbase + slot_mem_size;
 	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
 		MAX_FRAGMENTS;
 
@@ -155,7 +167,6 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	}
 
 	/* Send the base address of the slots to VideoCore */
-	channelbase = slot_phys;
 	err = rpi_firmware_property(fw, RPI_FIRMWARE_VCHIQ_INIT,
 				    &channelbase, sizeof(channelbase));
 	if (err || channelbase) {
@@ -241,7 +252,7 @@ vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset, int size,
 	if (!pagelistinfo)
 		return VCHIQ_ERROR;
 
-	bulk->data = (void *)(unsigned long)pagelistinfo->dma_addr;
+	bulk->data = (void *)VC_SAFE(pagelistinfo->dma_addr);
 
 	/*
 	 * Store the pagelistinfo address in remote_data,
@@ -475,25 +486,60 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 
 	/* Combine adjacent blocks for performance */
 	k = 0;
-	for_each_sg(scatterlist, sg, dma_buffers, i) {
-		u32 len = sg_dma_len(sg);
-		u32 addr = sg_dma_address(sg);
+	if (g_use_36bit_addrs) {
+		for_each_sg(scatterlist, sg, dma_buffers, i) {
+			u32 len = sg_dma_len(sg);
+			u64 addr = sg_dma_address(sg);
+			u32 page_id = (u32)((addr >> 4) & ~0xff);
+			u32 sg_pages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 
-		/* Note: addrs is the address + page_count - 1
-		 * The firmware expects blocks after the first to be page-
-		 * aligned and a multiple of the page size
-		 */
-		WARN_ON(len == 0);
-		WARN_ON(i && (i != (dma_buffers - 1)) && (len & ~PAGE_MASK));
-		WARN_ON(i && (addr & ~PAGE_MASK));
-		if (k > 0 &&
-		    ((addrs[k - 1] & PAGE_MASK) +
-		     (((addrs[k - 1] & ~PAGE_MASK) + 1) << PAGE_SHIFT))
-		    == (addr & PAGE_MASK))
-			addrs[k - 1] += ((len + PAGE_SIZE - 1) >> PAGE_SHIFT);
-		else
-			addrs[k++] = (addr & PAGE_MASK) |
-				(((len + PAGE_SIZE - 1) >> PAGE_SHIFT) - 1);
+			/* Note: addrs is the address + page_count - 1
+			 * The firmware expects blocks after the first to be page-
+			 * aligned and a multiple of the page size
+			 */
+			WARN_ON(len == 0);
+			WARN_ON(i &&
+				(i != (dma_buffers - 1)) && (len & ~PAGE_MASK));
+			WARN_ON(i && (addr & ~PAGE_MASK));
+			WARN_ON(upper_32_bits(addr) > 0xf);
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
+			u32 addr = VC_SAFE(sg_dma_address(sg));
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
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index d1a556f16499..dd3c8f829daa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -117,6 +117,11 @@ static struct vchiq_drvdata bcm2836_drvdata = {
 	.cache_line_size = 64,
 };
 
+static struct vchiq_drvdata bcm2711_drvdata = {
+	.cache_line_size = 64,
+	.use_36bit_addrs = true,
+};
+
 static const char *const ioctl_names[] = {
 	"CONNECT",
 	"SHUTDOWN",
@@ -2710,6 +2715,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 static const struct of_device_id vchiq_of_match[] = {
 	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
 	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
+	{ .compatible = "brcm,bcm2711-vchiq", .data = &bcm2711_drvdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vchiq_of_match);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 0784c5002417..f8b1c005af62 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -52,6 +52,7 @@ struct vchiq_arm_state {
 
 struct vchiq_drvdata {
 	const unsigned int cache_line_size;
+	const bool use_36bit_addrs;
 	struct rpi_firmware *fw;
 };
 
-- 
Regards,

Laurent Pinchart

