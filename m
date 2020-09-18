Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C2D270026
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgIROs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:48:57 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44486 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgIROs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:48:56 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200918144853euoutp02a33b091c6542508990efb35b3e08cfa2~16C_HGGnf2942229422euoutp02u
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200918144853euoutp02a33b091c6542508990efb35b3e08cfa2~16C_HGGnf2942229422euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600440533;
        bh=Qqymb2wpODbhpuSz8Xj9i/kRimYKlxxfRHerUqv0mt0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FHlXEkyRubwiNlAGggTtacUAJLUlNtQ0eOXnQctYGUwjQsU/u4niS9kemzcCHelW/
         D6HLa0o6yRfsUGg35cqvsTEnxgDlGtsssHKDMtCjVvbkogA1p8DIyrmsjiopw9LtZK
         pC5X96QpKabrKgMjl3NEBpPNyQTIlASW6UdPmpow=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200918144853eucas1p271e7179ba2e19a2f4ec70e2107c9fdc4~16C94f6PF3250032500eucas1p2b;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.30.06456.5D8C46F5; Fri, 18
        Sep 2020 15:48:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144852eucas1p1d23d84ef3ecf48e377b1b82a915a256b~16C9f_caz1471314713eucas1p1q;
        Fri, 18 Sep 2020 14:48:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200918144852eusmtrp29cba7ed5828a62cd7c8acf0136d6fe4f~16C9fXn-B2279922799eusmtrp2r;
        Fri, 18 Sep 2020 14:48:52 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-12-5f64c8d5b779
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.4F.06017.4D8C46F5; Fri, 18
        Sep 2020 15:48:52 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144852eusmtip18196de618895ad626e63533ffa2f7454~16C9ACno01085610856eusmtip1J;
        Fri, 18 Sep 2020 14:48:52 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 1/4] media: platform: exynos4-is: remove all references
 to physicall addresses
Date:   Fri, 18 Sep 2020 16:48:30 +0200
Message-Id: <20200918144833.14618-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918144833.14618-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduzned2rJ1LiDbrnslpsnLGe1eL8+Q3s
        Fj0btrJazDi/j8li7ZG77BbLNv1hsjj44QmrRfvTl8wWn1v/sTlweqyZt4bRY3bDRRaPTas6
        2Tz6tqxi9Pi8SS6ANYrLJiU1J7MstUjfLoErY+WB78wFs5oYKxrvNDM3MF7L6WLk5JAQMJHY
        vOUqexcjF4eQwApGic0LNzFCOF8YJfZ09bJBOJ8ZJd7va2KBaZnXfJ0JxBYSWM4oMWEKC0LH
        3k5GkASbgKFE19suNhBbRMBJYuGsv2A7mAU2MUnsevMBrFtYIFli8edesAYWAVWJGWf2M4PY
        vAK2Esfn3WWH2CYvsXrDAaA4BwengJ3E1SZLkDkSAs3sEs8e72OGqHGRWNOyBuo6YYlXx7dA
        9cpI/N85nwmqgVHi4bm17BBOD6PE5aYZjBBV1hJ3zv1iA9nALKApsX6XPogpIeAosfAAF4TJ
        J3HjrSBIMTOQOWnbdGaIMK9ER5sQxAw1iVnH18FtPXjhEtRlHhKdl5dAg3cio8TfrTeYJjDK
        z0LYtYCRcRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZg6jj97/inHYxfLyUdYhTgYFTi
        4f2xJiVeiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUS
        SE8sSc1OTS1ILYLJMnFwSjUw1jqybPLZJJv15uMqhQNcXhXf3A34t+3IXbn4Q/uWgktzF2/0
        V77Y0nsp4KjT0niBlwu8PDWYHr+JTNyUsScw46TA7I7H+zftj5xowMd9YtuxaVn1X82mn5ii
        E7B437oH/hcvBp8I0C1bc/7t+VWOl59laN2fdfLxobp3eoHX2pxTDu4PX60lcFiJpTgj0VCL
        uag4EQBvAJYiGQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsVy+t/xu7pXTqTEG+xu1bHYOGM9q8X58xvY
        LXo2bGW1mHF+H5PF2iN32S2WbfrDZHHwwxNWi/anL5ktPrf+Y3Pg9Fgzbw2jx+yGiywem1Z1
        snn0bVnF6PF5k1wAa5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpq
        TmZZapG+XYJexsoD35kLZjUxVjTeaWZuYLyW08XIySEhYCIxr/k6UxcjF4eQwFJGiaY5i9gh
        EjISJ6c1sELYwhJ/rnWxQRR9YpR4dmgNG0iCTcBQouttF5gtIuAisX/PU2aQImaBbUwSv7Yu
        YgJJCAskSjzZ2MACYrMIqErMOLOfGcTmFbCVOD7vLtQ2eYnVGw4AxTk4OAXsJK42WYKEhYBK
        WpcsYZvAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYChvO/Zzyw7GrnfBhxgFOBiV
        eHhfzEuJF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgmyYyS4km5wPj
        LK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6PK12L2mEdvsosU
        v/3Rt3G/t251qt4rg/a8i3e9ZV4+jyqcXHDiWseihtnKgjMunJtcvbR+Z/bU4tSbSltNXnAl
        MGzaor4v77PNeuemv0Et+5WmBjdvenBd+bX/h+eRu39K5Fp8qlq0QGlKxJ7LC2IDmiZfnZMV
        L8mbNe+9UsRUCcE/k1blR+YpsRRnJBpqMRcVJwIAPgSsu3sCAAA=
X-CMS-MailID: 20200918144852eucas1p1d23d84ef3ecf48e377b1b82a915a256b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200918144852eucas1p1d23d84ef3ecf48e377b1b82a915a256b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200918144852eucas1p1d23d84ef3ecf48e377b1b82a915a256b
References: <20200918144833.14618-1-m.szyprowski@samsung.com>
        <CGME20200918144852eucas1p1d23d84ef3ecf48e377b1b82a915a256b@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver always operates on the DMA/IOVA addresses, so calling them
physicall addresses is misleading, although when no IOMMU is used they
equal each other. Fix this by renaming all such entries to 'addr' and
adjusting comments.

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
index e7a4b06e6dfe..2b163480eba4 100644
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
index cde60fbb23a8..93d85fc83f50 100644
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
index d130f664a60b..5419c3fdc307 100644
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
@@ -631,7 +631,7 @@ int fimc_check_scaler_ratio(struct fimc_ctx *ctx, int sw, int sh,
 int fimc_set_scaler_info(struct fimc_ctx *ctx);
 int fimc_prepare_config(struct fimc_ctx *ctx, u32 flags);
 int fimc_prepare_addr(struct fimc_ctx *ctx, struct vb2_buffer *vb,
-		      struct fimc_frame *frame, struct fimc_addr *paddr);
+		      struct fimc_frame *frame, struct fimc_addr *addr);
 void fimc_prepare_dma_offset(struct fimc_ctx *ctx, struct fimc_frame *f);
 void fimc_set_yuv_order(struct fimc_ctx *ctx);
 void fimc_capture_irq_handler(struct fimc_dev *fimc, int deq_buf);
diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index a474014f0a0f..69510a700798 100644
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
index 5ce2bdebd424..76b97d567673 100644
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

