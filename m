Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D137C83DF
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjJMLBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjJMLBQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:01:16 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3B5BE
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:01:14 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qrFuT-0006xJ-Vo; Fri, 13 Oct 2023 13:00:49 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Oct 2023 13:00:23 +0200
Subject: [PATCH v2 02/13] media: rockchip: rga: extract helper to fill
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v2-2-bbfa6abf8bbf@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IOMMU of the RGA is programmed with a list of DMA descriptors that
contain an 32 bit address per 4k page in the video buffers. The address
in the descriptor points to the start address of the page.

Introduce 'struct rga_dma_desc' to make the handling of the DMA
descriptors explicit instead of hiding them behind standard types.

While at it, use provided helpers for iterating the sg_table instead of
manually calculating the DMA addresses.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Remove check for upper_32_bits()
- Fix cast to dst_mmu_pages/src_mmu_pages
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 43 ++++++++++++++-------------
 drivers/media/platform/rockchip/rga/rga.c     |  4 +--
 drivers/media/platform/rockchip/rga/rga.h     |  8 +++--
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 81508ed5abf3..fc3f38f6b5e1 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <linux/scatterlist.h>
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -15,6 +16,23 @@
 #include "rga-hw.h"
 #include "rga.h"
 
+static size_t fill_descriptors(struct rga_dma_desc *desc, struct sg_table *sgt)
+{
+	struct sg_dma_page_iter iter;
+	struct rga_dma_desc *tmp = desc;
+	size_t n_desc = 0;
+	dma_addr_t addr;
+
+	for_each_sgtable_dma_page(sgt, &iter, 0) {
+		addr = sg_page_iter_dma_address(&iter);
+		tmp->addr = lower_32_bits(addr);
+		tmp++;
+		n_desc++;
+	}
+
+	return n_desc;
+}
+
 static int
 rga_queue_setup(struct vb2_queue *vq,
 		unsigned int *nbuffers, unsigned int *nplanes,
@@ -114,11 +132,8 @@ void rga_buf_map(struct vb2_buffer *vb)
 {
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct rockchip_rga *rga = ctx->rga;
-	struct sg_table *sgt;
-	struct scatterlist *sgl;
-	unsigned int *pages;
-	unsigned int address, len, i, p;
-	unsigned int mapped_size = 0;
+	struct rga_dma_desc *pages;
+	size_t n_desc = 0;
 
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		pages = rga->src_mmu_pages;
@@ -126,23 +141,9 @@ void rga_buf_map(struct vb2_buffer *vb)
 		pages = rga->dst_mmu_pages;
 
 	/* Create local MMU table for RGA */
-	sgt = vb2_plane_cookie(vb, 0);
-
-	for_each_sg(sgt->sgl, sgl, sgt->nents, i) {
-		len = sg_dma_len(sgl) >> PAGE_SHIFT;
-		address = sg_phys(sgl);
-
-		for (p = 0; p < len; p++) {
-			dma_addr_t phys = address +
-					  ((dma_addr_t)p << PAGE_SHIFT);
-
-			pages[mapped_size + p] = phys;
-		}
-
-		mapped_size += len;
-	}
+	n_desc = fill_descriptors(pages, vb2_dma_sg_plane_desc(vb, 0));
 
 	/* sync local MMU table for RGA */
 	dma_sync_single_for_device(rga->dev, virt_to_phys(pages),
-				   8 * PAGE_SIZE, DMA_BIDIRECTIONAL);
+				   n_desc * sizeof(*pages), DMA_BIDIRECTIONAL);
 }
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 25f5b5eebf13..36d7f255af90 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -873,13 +873,13 @@ static int rga_probe(struct platform_device *pdev)
 	}
 
 	rga->src_mmu_pages =
-		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
+		(struct rga_dma_desc *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
 	if (!rga->src_mmu_pages) {
 		ret = -ENOMEM;
 		goto free_dma;
 	}
 	rga->dst_mmu_pages =
-		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
+		(struct rga_dma_desc *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
 	if (!rga->dst_mmu_pages) {
 		ret = -ENOMEM;
 		goto free_src_pages;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 5fa9d2f366dc..22f7da28ac51 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -40,6 +40,10 @@ struct rga_frame {
 	u32 size;
 };
 
+struct rga_dma_desc {
+	u32 addr;
+};
+
 struct rockchip_rga_version {
 	u32 major;
 	u32 minor;
@@ -81,8 +85,8 @@ struct rockchip_rga {
 	struct rga_ctx *curr;
 	dma_addr_t cmdbuf_phy;
 	void *cmdbuf_virt;
-	unsigned int *src_mmu_pages;
-	unsigned int *dst_mmu_pages;
+	struct rga_dma_desc *src_mmu_pages;
+	struct rga_dma_desc *dst_mmu_pages;
 };
 
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);

-- 
2.39.2

