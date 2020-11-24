Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C23D2C203F
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 09:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730765AbgKXIl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 03:41:57 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54138 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730761AbgKXIl5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 03:41:57 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201124084145euoutp0123feff4c61c25975e75a8984c867af58~KZQjcfQ0x2585025850euoutp01w
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 08:41:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201124084145euoutp0123feff4c61c25975e75a8984c867af58~KZQjcfQ0x2585025850euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606207305;
        bh=ep0MBbfxsNQvXjbPzYfN6AAz1vg/a1K9++PfO9mvK/0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=uwCpxcVePJaJgHD9xX7mX7Ff2Z8AusR6mZgQjv3mAgKDWTPXP+XJP7WRhSUezhh8r
         Wm6+wTYDJwz/J9GUVLUIvFWNpf0jjJAQBBpmRqTk/DNZgqB6egtA2qGKQUFiGMEqlU
         tFGUxFN/k8jnSDmz3vYOxFAaSYsBqoQBBLQYk/Ls=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201124084139eucas1p1fea99879132ec7a38c44e4d82e55750e~KZQdz4ILO2224022240eucas1p1q;
        Tue, 24 Nov 2020 08:41:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7F.45.45488.347CCBF5; Tue, 24
        Nov 2020 08:41:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201124084139eucas1p1f8a0e5c782b5706868bb3b5ea5de25e7~KZQdbO_Eg0040200402eucas1p1Z;
        Tue, 24 Nov 2020 08:41:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201124084139eusmtrp263aa716e735a2d2186a60da6bee3d860~KZQdakDE60411504115eusmtrp2I;
        Tue, 24 Nov 2020 08:41:39 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-d2-5fbcc743dd14
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5C.46.16282.347CCBF5; Tue, 24
        Nov 2020 08:41:39 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201124084138eusmtip18ff4c60c472eb56f49aacf84adb51fe9~KZQc7bqMV1490714907eusmtip1C;
        Tue, 24 Nov 2020 08:41:38 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: platform: exynos4-is: remove all references to
 physicall addresses
Date:   Tue, 24 Nov 2020 09:41:28 +0100
Message-Id: <20201124084128.12496-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7djP87rOx/fEG7S/1bbYOGM9q8Wpyc+Y
        LM6f38Bu0bNhK6vFjPP7mCzWHrnLbrFs0x8mi/anL5kdODw2repk8+jbsorR4/MmOY9TXz+z
        B7BEcdmkpOZklqUW6dslcGUcXdrNVvClhbFiw8obLA2M//O6GDk4JARMJJ6fru5i5OIQEljB
        KLFrxnFGCOcLo8S2vZtYuhg5gZzPjBJdP51BbJCGRcc2sEEULWeU+PhmIxNEEVDHlftgDWwC
        hhJdb7vYQGwRASeJhbP+soM0MAv0MElsurOFESQhLBAj8fnsVLAiFgFViTkvHoEN4hWwlTh0
        ahUbxDZ5idUbDjCDNEsINHJIrLlzHyrhIrFu0klmCFtY4tXxLewQtozE/53zmSAamhklHp5b
        yw7h9DBKXG6awQhRZS1x59wvNlAIMAtoSqzfpQ8JDEeJzQcsIUw+iRtvBUGKmYHMSdumM0OE
        eSU62oQgZqhJzDq+Dm7rwQuXoK7xkJh59TcrJExiJTZcbGObwCg3C2HVAkbGVYziqaXFuemp
        xcZ5qeV6xYm5xaV56XrJ+bmbGIGp4PS/4193MK549VHvECMTB+MhRgkOZiUR3la5nfFCvCmJ
        lVWpRfnxRaU5qcWHGKU5WJTEeXdtXRMvJJCeWJKanZpakFoEk2Xi4JRqYAoScuidac71V3TS
        3oObBbNza6QULU0ex3s+WXzvzgvtqKlSUb0zCrrlJrg/8XERWzv91C9nA+XnyfXvHcPNPDuS
        y+6fyIrgucsY6Cq8JF4m3Gd1xaG+5W4rbZ1W5d1f8v748YOTgz4pd78sFXygnMrjw2yaZhY+
        x+bKIs1JzoLWYQZX1ocveDXj+Y6FTFa3yhgD1XWXr0+a97FjX8ZMHaPUwgmT1299+0npyXrm
        o/c7H6dznFM7l6+w8ti2rcGaAktVL2x2uF99J+ahyd7DSeZB9WLT5wfEPTM+/Mf4Ssz7jJX2
        /64c/69/60XOtLcs6mH7a0V926KCF9T8kjxyOOZKyf17UjfXKuz14zukxqzEUpyRaKjFXFSc
        CABW67BndAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsVy+t/xu7rOx/fEG7w/KWCxccZ6VotTk58x
        WZw/v4HdomfDVlaLGef3MVmsPXKX3WLZpj9MFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNch6nvn5m
        D2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Ms4
        urSbreBLC2PFhpU3WBoY/+d1MXJySAiYSCw6toGti5GLQ0hgKaNEf8MvFoiEjMTJaQ2sELaw
        xJ9rXVBFnxglzpyZxQaSYBMwlOh62wVmiwi4SOzf85QZpIhZYAKTxIRVV5lBEsICURIzjr8B
        m8oioCox58UjJhCbV8BW4tCpVWwQG+QlVm84wDyBkWcBI8MqRpHU0uLc9NxiI73ixNzi0rx0
        veT83E2MwEDcduznlh2MK1991DvEyMTBeIhRgoNZSYS3VW5nvBBvSmJlVWpRfnxRaU5q8SFG
        U6B9E5mlRJPzgbGQVxJvaGZgamhiZmlgamlmrCTOa3JkTbyQQHpiSWp2ampBahFMHxMHp1QD
        k8vTyVML+//6eObuWq1Y9Fe5136vf82cDfOW3eHTFZSstDHafO/3rFeTljH/12YMlqsMc0vw
        0Mwo3SqjfjxgDbPpN4bwj5lMa+OkeEW09ha3Bj+5vIinbH2vouTLw8LVlxQnuHx77iH+8iXv
        yetPmZ1mL5P8aBm999HtK3O2T5m2x76qjeuO9Jz8B82ls3Yl/GKcv07v9+KD33R+O0rOL380
        2Xz3o2ieuk2mxzc73qrbFLpv+13++jNrmA5XZz2WXhhzXPNbGYf9txh3BZ7OlysneL7e7tyz
        4Rh34Pk6ffY7oQIPCrY4VPbumhr4O3iP/bwizRexd0L0YlnWu66PftvwKqX11cQcvn4Nuxfe
        1kosxRmJhlrMRcWJAGsh66TNAgAA
X-CMS-MailID: 20201124084139eucas1p1f8a0e5c782b5706868bb3b5ea5de25e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201124084139eucas1p1f8a0e5c782b5706868bb3b5ea5de25e7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201124084139eucas1p1f8a0e5c782b5706868bb3b5ea5de25e7
References: <CGME20201124084139eucas1p1f8a0e5c782b5706868bb3b5ea5de25e7@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver always operates on the DMA/IOVA addresses, so calling them
physicall addresses is misleading, although when no IOMMU is used they
equal each other. Fix this by renaming all such entries to 'addr' and
adjusting comments.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch was previously sent as part of "[PATCH 0/8] IOMMU-DMA -
support old allocation algorithm used on ARM" patchset:
https://lore.kernel.org/linux-samsung-soc/20200925141218.13550-1-m.szyprowski@samsung.com/
The IOMMU related changes are still under review, but this change is
unrelated and it makes sense to aplly it separately.
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

