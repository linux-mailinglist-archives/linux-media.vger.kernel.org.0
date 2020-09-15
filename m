Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6086E26B7F2
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgIPAck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:32:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47043 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgIONnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:43:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200915133309euoutp025de2fa3a560bea915378f57a755000e2~0_E-VYshR1386513865euoutp02R
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 13:33:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200915133309euoutp025de2fa3a560bea915378f57a755000e2~0_E-VYshR1386513865euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600176789;
        bh=kCAb32KOoE4xPrYfNdilVMsiXgILf6ARsPY05j3OiaY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EQlp8pO8osTlxr8cmjtqbv/djAI8BG53qHMVr2PN9DFwCZuCCknkrtQGHIVYYNzGV
         OfvVhIP7j69dxYQG7nHoR1bSpXZYtyJ/5nTqixuo+kkBvXcTi2NaABv40CXHdEH+/r
         MA52Nelzv3q/Vmn4SpchyHGuxnmHixPezhBub4K4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915133309eucas1p2c488e984b5b7359953cc82e5dad7ce87~0_E-CjDA01823418234eucas1p2a;
        Tue, 15 Sep 2020 13:33:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 83.F5.06456.492C06F5; Tue, 15
        Sep 2020 14:33:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915133308eucas1p20ad0dcd055de2d63abfbc0b385fd5369~0_E_qDOXB2313823138eucas1p2C;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200915133308eusmtrp1cc0c47c6904c9a8ccc282ddb88c0fd80~0_E_owNuo0801708017eusmtrp1T;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-b4-5f60c2946f74
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.20.06314.492C06F5; Tue, 15
        Sep 2020 14:33:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915133308eusmtip22b7cb2cdcbf9db6365ee4fde1f272d1a~0_E_NhbkF0118501185eusmtip2b;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/2] media: platform: exynos4-is: remove all references to
 physicall addresses
Date:   Tue, 15 Sep 2020 15:32:55 +0200
Message-Id: <20200915133256.1210-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915133256.1210-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWy7djP87pTDiXEG6xYY2WxccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzI7cHismbeG0WPTqk42j74tqxg9Pm+S
        C2CJ4rJJSc3JLEst0rdL4Mq4+GM6a8H8JsaKOx2vWBsYb+V0MXJySAiYSBx50MLSxcjFISSw
        glHixo1XbBDOF0aJd59XMUI4nxkl2q5uASrjAGvZfskOIr6cUWLq5F5WuI5HP68xgsxlEzCU
        6HrbxQZiiwg4SSyc9ZcdpIhZoI9J4sq8xawgCWGBBImn+76xgNgsAqoSn/f0gm3gFbCRmLhS
        GOI+eYnVGw4wg9icArYSN949YwaZIyHwnU1i/5U7TBBFLhLrmw6xQNjCEq+Ob2GHsGUkTk/u
        YYFoaGaUeHhuLTuE08MocblpBiNElbXEnXO/2EA2MwtoSqzfpQ8RdpToWbAP6mU+iRtvBUHC
        zEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlZgjbQ+J/21V2SABNYJRY+/Qj8wRG+VkIyxYw
        Mq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITBSn/x3/tIPx66WkQ4wCHIxKPLwJ5fHx
        QqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2
        ampBahFMlomDU6qBse2N5+eONVk6UycYCqtW3VhYUuV1U3zbdieVZdarNz9g2FZudPhbMOu0
        h5nNS18qH+8Jz+T8Xjql2qf1wuaXT5wSmTZGrruyJMr36/0nb8/I6n3p371C5tmJevnz3K+n
        hJ3dd8xyrsDSBHXmV9bWRQ8d5rD/cu268maP5KOQr0bT3HTjqoqD7ZVYijMSDbWYi4oTAc/O
        Hc4QAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsVy+t/xe7pTDiXEG/TdUrLYOGM9q8X58xvY
        LXo2bGW1mHF+H5PF2iN32S2WbfrDZHHwwxNWi/anL5kdODzWzFvD6LFpVSebR9+WVYwenzfJ
        BbBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GVc
        /DGdtWB+E2PFnY5XrA2Mt3K6GDk4JARMJLZfsuti5OIQEljKKHFmxzKWLkZOoLiMxMlpDawQ
        trDEn2tdbBBFnxglrk97wASSYBMwlOh6C5Lg5BARcJHYv+cpM0gRs8AkJonf/dsZQRLCAnES
        +z8fZgexWQRUJT7v6WUB2cwrYCMxcaUwxAJ5idUbDjCD2JwCthI33j0Ds4WASh6t6WKbwMi3
        gJFhFaNIamlxbnpusaFecWJucWleul5yfu4mRmDQbjv2c/MOxksbgw8xCnAwKvHwJpTHxwux
        JpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0E0TmaVEk/OBEZVXEm9oamhu
        YWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHR5UjzyjCj75b3w+wW/G9d90cx
        82SPfeyisPWC27dl9wo+CY468qD/lc+XXNN3B/dz9h4KvdXkERJmLMQc/lctYllp6+p/PxM+
        lztc2LxpoQZr4rRHIWxCSzTLtsic2M7moCf/7ITUORvVsgP2C+beXT3ttEuSqKlL4L5AN3Zl
        Wc+gUk/vVRlKLMUZiYZazEXFiQBUGMotcAIAAA==
X-CMS-MailID: 20200915133308eucas1p20ad0dcd055de2d63abfbc0b385fd5369
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200915133308eucas1p20ad0dcd055de2d63abfbc0b385fd5369
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200915133308eucas1p20ad0dcd055de2d63abfbc0b385fd5369
References: <20200915133256.1210-1-m.szyprowski@samsung.com>
        <CGME20200915133308eucas1p20ad0dcd055de2d63abfbc0b385fd5369@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver always operates on the DMA/IOVA addresses, so calling them
physicall addresses is misleading, although when no IOMMU is used they
equal each other. Fix this by renaming all such entries just to 'addr'
and adjusting comments.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../media/platform/exynos4-is/fimc-capture.c  |  6 ++--
 drivers/media/platform/exynos4-is/fimc-core.c | 28 +++++++++----------
 drivers/media/platform/exynos4-is/fimc-core.h | 18 ++++++------
 drivers/media/platform/exynos4-is/fimc-is.c   | 20 ++++++-------
 drivers/media/platform/exynos4-is/fimc-is.h   |  6 ++--
 .../media/platform/exynos4-is/fimc-lite-reg.c |  4 +--
 drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.h |  4 +--
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  8 +++---
 drivers/media/platform/exynos4-is/fimc-reg.c  | 18 ++++++------
 drivers/media/platform/exynos4-is/fimc-reg.h  |  4 +--
 11 files changed, 58 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 6000a4e789ad..13c838d3f947 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -201,7 +201,7 @@ void fimc_capture_irq_handler(struct fimc_dev *fimc, int deq_buf)
 	if (!list_empty(&cap->pending_buf_q)) {
 
 		v_buf = fimc_pending_queue_pop(cap);
-		fimc_hw_set_output_addr(fimc, &v_buf->paddr, cap->buf_index);
+		fimc_hw_set_output_addr(fimc, &v_buf->addr, cap->buf_index);
 		v_buf->index = cap->buf_index;
 
 		/* Move the buffer to the capture active queue */
@@ -410,7 +410,7 @@ static void buffer_queue(struct vb2_buffer *vb)
 	int min_bufs;
 
 	spin_lock_irqsave(&fimc->slock, flags);
-	fimc_prepare_addr(ctx, &buf->vb.vb2_buf, &ctx->d_frame, &buf->paddr);
+	fimc_prepare_addr(ctx, &buf->vb.vb2_buf, &ctx->d_frame, &buf->addr);
 
 	if (!test_bit(ST_CAPT_SUSPENDED, &fimc->state) &&
 	    !test_bit(ST_CAPT_STREAM, &fimc->state) &&
@@ -419,7 +419,7 @@ static void buffer_queue(struct vb2_buffer *vb)
 		int buf_id = (vid_cap->reqbufs_count == 1) ? -1 :
 				vid_cap->buf_index;
 
-		fimc_hw_set_output_addr(fimc, &buf->paddr, buf_id);
+		fimc_hw_set_output_addr(fimc, &buf->addr, buf_id);
 		buf->index = vid_cap->buf_index;
 		fimc_active_queue_add(vid_cap, buf);
 
diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/media/platform/exynos4-is/fimc-core.c
index 08d1f39a914c..c989abeb478e 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/exynos4-is/fimc-core.c
@@ -325,7 +325,7 @@ static irqreturn_t fimc_irq_handler(int irq, void *priv)
 
 /* The color format (colplanes, memplanes) must be already configured. */
 int fimc_prepare_addr(struct fimc_ctx *ctx, struct vb2_buffer *vb,
-		      struct fimc_frame *frame, struct fimc_addr *paddr)
+		      struct fimc_frame *frame, struct fimc_addr *addr)
 {
 	int ret = 0;
 	u32 pix_size;
@@ -338,42 +338,40 @@ int fimc_prepare_addr(struct fimc_ctx *ctx, struct vb2_buffer *vb,
 	dbg("memplanes= %d, colplanes= %d, pix_size= %d",
 		frame->fmt->memplanes, frame->fmt->colplanes, pix_size);
 
-	paddr->y = vb2_dma_contig_plane_dma_addr(vb, 0);
+	addr->y = vb2_dma_contig_plane_dma_addr(vb, 0);
 
 	if (frame->fmt->memplanes == 1) {
 		switch (frame->fmt->colplanes) {
 		case 1:
-			paddr->cb = 0;
-			paddr->cr = 0;
+			addr->cb = 0;
+			addr->cr = 0;
 			break;
 		case 2:
 			/* decompose Y into Y/Cb */
-			paddr->cb = (u32)(paddr->y + pix_size);
-			paddr->cr = 0;
+			addr->cb = (u32)(addr->y + pix_size);
+			addr->cr = 0;
 			break;
 		case 3:
-			paddr->cb = (u32)(paddr->y + pix_size);
+			addr->cb = (u32)(addr->y + pix_size);
 			/* decompose Y into Y/Cb/Cr */
 			if (FIMC_FMT_YCBCR420 == frame->fmt->color)
-				paddr->cr = (u32)(paddr->cb
-						+ (pix_size >> 2));
+				addr->cr = (u32)(addr->cb + (pix_size >> 2));
 			else /* 422 */
-				paddr->cr = (u32)(paddr->cb
-						+ (pix_size >> 1));
+				addr->cr = (u32)(addr->cb + (pix_size >> 1));
 			break;
 		default:
 			return -EINVAL;
 		}
 	} else if (!frame->fmt->mdataplanes) {
 		if (frame->fmt->memplanes >= 2)
-			paddr->cb = vb2_dma_contig_plane_dma_addr(vb, 1);
+			addr->cb = vb2_dma_contig_plane_dma_addr(vb, 1);
 
 		if (frame->fmt->memplanes == 3)
-			paddr->cr = vb2_dma_contig_plane_dma_addr(vb, 2);
+			addr->cr = vb2_dma_contig_plane_dma_addr(vb, 2);
 	}
 
-	dbg("PHYS_ADDR: y= 0x%X  cb= 0x%X cr= 0x%X ret= %d",
-	    paddr->y, paddr->cb, paddr->cr, ret);
+	dbg("DMA ADDR: y= 0x%X  cb= 0x%X cr= 0x%X ret= %d",
+	    addr->y, addr->cb, addr->cr, ret);
 
 	return ret;
 }
diff --git a/drivers/media/platform/exynos4-is/fimc-core.h b/drivers/media/platform/exynos4-is/fimc-core.h
index e4a56232907a..58b72a052cef 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/exynos4-is/fimc-core.h
@@ -202,10 +202,10 @@ struct fimc_scaler {
 };
 
 /**
- * struct fimc_addr - the FIMC physical address set for DMA
- * @y:	 luminance plane physical address
- * @cb:	 Cb plane physical address
- * @cr:	 Cr plane physical address
+ * struct fimc_addr - the FIMC address set for DMA
+ * @y:	 luminance plane address
+ * @cb:	 Cb plane address
+ * @cr:	 Cr plane address
  */
 struct fimc_addr {
 	u32	y;
@@ -217,13 +217,13 @@ struct fimc_addr {
  * struct fimc_vid_buffer - the driver's video buffer
  * @vb:    v4l videobuf buffer
  * @list:  linked list structure for buffer queue
- * @paddr: precalculated physical address set
+ * @addr: precalculated DMA address set
  * @index: buffer index for the output DMA engine
  */
 struct fimc_vid_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head	list;
-	struct fimc_addr	paddr;
+	struct fimc_addr	addr;
 	int			index;
 };
 
@@ -239,7 +239,7 @@ struct fimc_vid_buffer {
  * @height:	image pixel weight
  * @payload:	image size in bytes (w x h x bpp)
  * @bytesperline: bytesperline value for each plane
- * @paddr:	image frame buffer physical addresses
+ * @addr:	image frame buffer DMA addresses
  * @dma_offset:	DMA offset in bytes
  * @fmt:	fimc color format pointer
  */
@@ -254,7 +254,7 @@ struct fimc_frame {
 	u32	height;
 	unsigned int		payload[VIDEO_MAX_PLANES];
 	unsigned int		bytesperline[VIDEO_MAX_PLANES];
-	struct fimc_addr	paddr;
+	struct fimc_addr	addr;
 	struct fimc_dma_offset	dma_offset;
 	struct fimc_fmt		*fmt;
 	u8			alpha;
@@ -626,7 +626,7 @@ int fimc_check_scaler_ratio(struct fimc_ctx *ctx, int sw, int sh,
 int fimc_set_scaler_info(struct fimc_ctx *ctx);
 int fimc_prepare_config(struct fimc_ctx *ctx, u32 flags);
 int fimc_prepare_addr(struct fimc_ctx *ctx, struct vb2_buffer *vb,
-		      struct fimc_frame *frame, struct fimc_addr *paddr);
+		      struct fimc_frame *frame, struct fimc_addr *addr);
 void fimc_prepare_dma_offset(struct fimc_ctx *ctx, struct fimc_frame *f);
 void fimc_set_yuv_order(struct fimc_ctx *ctx);
 void fimc_capture_irq_handler(struct fimc_dev *fimc, int deq_buf);
diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 019bb47df915..41b841a96338 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -269,7 +269,7 @@ int fimc_is_cpu_set_power(struct fimc_is *is, int on)
 		mcuctl_write(0, is, REG_WDT_ISP);
 
 		/* Cortex-A5 start address setting */
-		mcuctl_write(is->memory.paddr, is, MCUCTL_REG_BBOAR);
+		mcuctl_write(is->memory.addr, is, MCUCTL_REG_BBOAR);
 
 		/* Enable and start Cortex-A5 */
 		pmuisp_write(0x18000, is, REG_PMU_ISP_ARM_OPTION);
@@ -336,26 +336,26 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 	struct device *dev = &is->pdev->dev;
 
 	is->memory.vaddr = dma_alloc_coherent(dev, FIMC_IS_CPU_MEM_SIZE,
-					      &is->memory.paddr, GFP_KERNEL);
+					      &is->memory.addr, GFP_KERNEL);
 	if (is->memory.vaddr == NULL)
 		return -ENOMEM;
 
 	is->memory.size = FIMC_IS_CPU_MEM_SIZE;
 
-	dev_info(dev, "FIMC-IS CPU memory base: %#x\n", (u32)is->memory.paddr);
+	dev_info(dev, "FIMC-IS CPU memory base: %pad\n", &is->memory.addr);
 
-	if (((u32)is->memory.paddr) & FIMC_IS_FW_ADDR_MASK) {
+	if (((u32)is->memory.addr) & FIMC_IS_FW_ADDR_MASK) {
 		dev_err(dev, "invalid firmware memory alignment: %#x\n",
-			(u32)is->memory.paddr);
+			(u32)is->memory.addr);
 		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
-				  is->memory.paddr);
+				  is->memory.addr);
 		return -EIO;
 	}
 
 	is->is_p_region = (struct is_region *)(is->memory.vaddr +
 				FIMC_IS_CPU_MEM_SIZE - FIMC_IS_REGION_SIZE);
 
-	is->is_dma_p_region = is->memory.paddr +
+	is->is_dma_p_region = is->memory.addr +
 				FIMC_IS_CPU_MEM_SIZE - FIMC_IS_REGION_SIZE;
 
 	is->is_shared_region = (struct is_share_region *)(is->memory.vaddr +
@@ -371,7 +371,7 @@ static void fimc_is_free_cpu_memory(struct fimc_is *is)
 		return;
 
 	dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
-			  is->memory.paddr);
+			  is->memory.addr);
 }
 
 static void fimc_is_load_firmware(const struct firmware *fw, void *context)
@@ -416,7 +416,7 @@ static void fimc_is_load_firmware(const struct firmware *fw, void *context)
 
 	dev_info(dev, "loaded firmware: %s, rev. %s\n",
 		 is->fw.info, is->fw.version);
-	dev_dbg(dev, "FW size: %zu, paddr: %pad\n", fw->size, &is->memory.paddr);
+	dev_dbg(dev, "FW size: %zu, DMA addr: %pad\n", fw->size, &is->memory.addr);
 
 	is->is_shared_region->chip_id = 0xe4412;
 	is->is_shared_region->chip_rev_no = 1;
@@ -699,7 +699,7 @@ int fimc_is_hw_initialize(struct fimc_is *is)
 	}
 
 	pr_debug("shared region: %pad, parameter region: %pad\n",
-		 &is->memory.paddr + FIMC_IS_SHARED_REGION_OFFSET,
+		 &is->memory.addr + FIMC_IS_SHARED_REGION_OFFSET,
 		 &is->is_dma_p_region);
 
 	is->setfile.sub_index = 0;
diff --git a/drivers/media/platform/exynos4-is/fimc-is.h b/drivers/media/platform/exynos4-is/fimc-is.h
index 7ee96a058d40..ce30b007bc55 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.h
+++ b/drivers/media/platform/exynos4-is/fimc-is.h
@@ -174,7 +174,7 @@ struct is_af_info {
 struct fimc_is_firmware {
 	const struct firmware *f_w;
 
-	dma_addr_t paddr;
+	dma_addr_t addr;
 	void *vaddr;
 	unsigned int size;
 
@@ -185,8 +185,8 @@ struct fimc_is_firmware {
 };
 
 struct fimc_is_memory {
-	/* physical base address */
-	dma_addr_t paddr;
+	/* DMA base address */
+	dma_addr_t addr;
 	/* virtual base address */
 	void *vaddr;
 	/* total length */
diff --git a/drivers/media/platform/exynos4-is/fimc-lite-reg.c b/drivers/media/platform/exynos4-is/fimc-lite-reg.c
index 85f765e0f4e1..57996b4104b4 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite-reg.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite-reg.c
@@ -272,9 +272,9 @@ void flite_hw_set_dma_buffer(struct fimc_lite *dev, struct flite_buffer *buf)
 		index = buf->index;
 
 	if (index == 0)
-		writel(buf->paddr, dev->regs + FLITE_REG_CIOSA);
+		writel(buf->addr, dev->regs + FLITE_REG_CIOSA);
 	else
-		writel(buf->paddr, dev->regs + FLITE_REG_CIOSAN(index - 1));
+		writel(buf->addr, dev->regs + FLITE_REG_CIOSAN(index - 1));
 
 	cfg = readl(dev->regs + FLITE_REG_CIFCNTSEQ);
 	cfg |= BIT(index);
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index 9c666f663ab4..1576f273761b 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -409,7 +409,7 @@ static void buffer_queue(struct vb2_buffer *vb)
 	unsigned long flags;
 
 	spin_lock_irqsave(&fimc->slock, flags);
-	buf->paddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+	buf->addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 
 	buf->index = fimc->buf_index++;
 	if (fimc->buf_index >= fimc->reqbufs_count)
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.h b/drivers/media/platform/exynos4-is/fimc-lite.h
index e6846c5fc9ac..e2d4d628b5aa 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.h
+++ b/drivers/media/platform/exynos4-is/fimc-lite.h
@@ -93,13 +93,13 @@ struct flite_frame {
  * struct flite_buffer - video buffer structure
  * @vb:    vb2 buffer
  * @list:  list head for the buffers queue
- * @paddr: DMA buffer start address
+ * @addr: DMA buffer start address
  * @index: DMA start address register's index
  */
 struct flite_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
-	dma_addr_t paddr;
+	dma_addr_t addr;
 	unsigned short index;
 };
 
diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
index 4acb179556c4..c9704a147e5c 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -115,12 +115,12 @@ static void fimc_device_run(void *priv)
 	}
 
 	src_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	ret = fimc_prepare_addr(ctx, &src_vb->vb2_buf, sf, &sf->paddr);
+	ret = fimc_prepare_addr(ctx, &src_vb->vb2_buf, sf, &sf->addr);
 	if (ret)
 		goto dma_unlock;
 
 	dst_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
-	ret = fimc_prepare_addr(ctx, &dst_vb->vb2_buf, df, &df->paddr);
+	ret = fimc_prepare_addr(ctx, &dst_vb->vb2_buf, df, &df->addr);
 	if (ret)
 		goto dma_unlock;
 
@@ -152,8 +152,8 @@ static void fimc_device_run(void *priv)
 			fimc_hw_set_rgb_alpha(ctx);
 		fimc_hw_set_output_path(ctx);
 	}
-	fimc_hw_set_input_addr(fimc, &sf->paddr);
-	fimc_hw_set_output_addr(fimc, &df->paddr, -1);
+	fimc_hw_set_input_addr(fimc, &sf->addr);
+	fimc_hw_set_output_addr(fimc, &df->addr, -1);
 
 	fimc_activate_capture(ctx);
 	ctx->state &= (FIMC_CTX_M2M | FIMC_CTX_CAP);
diff --git a/drivers/media/platform/exynos4-is/fimc-reg.c b/drivers/media/platform/exynos4-is/fimc-reg.c
index 8764999a5fd7..95165a2cc7d1 100644
--- a/drivers/media/platform/exynos4-is/fimc-reg.c
+++ b/drivers/media/platform/exynos4-is/fimc-reg.c
@@ -526,30 +526,30 @@ void fimc_hw_set_output_path(struct fimc_ctx *ctx)
 	writel(cfg, dev->regs + FIMC_REG_CISCCTRL);
 }
 
-void fimc_hw_set_input_addr(struct fimc_dev *dev, struct fimc_addr *paddr)
+void fimc_hw_set_input_addr(struct fimc_dev *dev, struct fimc_addr *addr)
 {
 	u32 cfg = readl(dev->regs + FIMC_REG_CIREAL_ISIZE);
 	cfg |= FIMC_REG_CIREAL_ISIZE_ADDR_CH_DIS;
 	writel(cfg, dev->regs + FIMC_REG_CIREAL_ISIZE);
 
-	writel(paddr->y, dev->regs + FIMC_REG_CIIYSA(0));
-	writel(paddr->cb, dev->regs + FIMC_REG_CIICBSA(0));
-	writel(paddr->cr, dev->regs + FIMC_REG_CIICRSA(0));
+	writel(addr->y, dev->regs + FIMC_REG_CIIYSA(0));
+	writel(addr->cb, dev->regs + FIMC_REG_CIICBSA(0));
+	writel(addr->cr, dev->regs + FIMC_REG_CIICRSA(0));
 
 	cfg &= ~FIMC_REG_CIREAL_ISIZE_ADDR_CH_DIS;
 	writel(cfg, dev->regs + FIMC_REG_CIREAL_ISIZE);
 }
 
 void fimc_hw_set_output_addr(struct fimc_dev *dev,
-			     struct fimc_addr *paddr, int index)
+			     struct fimc_addr *addr, int index)
 {
 	int i = (index == -1) ? 0 : index;
 	do {
-		writel(paddr->y, dev->regs + FIMC_REG_CIOYSA(i));
-		writel(paddr->cb, dev->regs + FIMC_REG_CIOCBSA(i));
-		writel(paddr->cr, dev->regs + FIMC_REG_CIOCRSA(i));
+		writel(addr->y, dev->regs + FIMC_REG_CIOYSA(i));
+		writel(addr->cb, dev->regs + FIMC_REG_CIOCBSA(i));
+		writel(addr->cr, dev->regs + FIMC_REG_CIOCRSA(i));
 		dbg("dst_buf[%d]: 0x%X, cb: 0x%X, cr: 0x%X",
-		    i, paddr->y, paddr->cb, paddr->cr);
+		    i, addr->y, addr->cb, addr->cr);
 	} while (index == -1 && ++i < FIMC_MAX_OUT_BUFS);
 }
 
diff --git a/drivers/media/platform/exynos4-is/fimc-reg.h b/drivers/media/platform/exynos4-is/fimc-reg.h
index b81826d04936..d7a62465c14e 100644
--- a/drivers/media/platform/exynos4-is/fimc-reg.h
+++ b/drivers/media/platform/exynos4-is/fimc-reg.h
@@ -302,8 +302,8 @@ void fimc_hw_set_rgb_alpha(struct fimc_ctx *ctx);
 void fimc_hw_set_in_dma(struct fimc_ctx *ctx);
 void fimc_hw_set_input_path(struct fimc_ctx *ctx);
 void fimc_hw_set_output_path(struct fimc_ctx *ctx);
-void fimc_hw_set_input_addr(struct fimc_dev *fimc, struct fimc_addr *paddr);
-void fimc_hw_set_output_addr(struct fimc_dev *fimc, struct fimc_addr *paddr,
+void fimc_hw_set_input_addr(struct fimc_dev *fimc, struct fimc_addr *addr);
+void fimc_hw_set_output_addr(struct fimc_dev *fimc, struct fimc_addr *addr,
 			     int index);
 int fimc_hw_set_camera_source(struct fimc_dev *fimc,
 			      struct fimc_source_info *cam);
-- 
2.17.1

