Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C9B278A93
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgIYOMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:12:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50634 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbgIYOMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:37 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141234euoutp019d835d328a80f36c1fb4c447357ad29b~4DEQ-U8yW1102011020euoutp01s
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200925141234euoutp019d835d328a80f36c1fb4c447357ad29b~4DEQ-U8yW1102011020euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043154;
        bh=9CE6iiMKRXDrSc5Ywn3xo3KvMo/QgjPcqFMYHr22ArI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nkc7oWKE/tnx9QS3LqwiW6uiLXsIZ62s3nwkWf00PzJNQnN9qKRUftktGWL0KU0i/
         T6c8aLjJ+n4fiqU0xanyIYZaBUGAVjZceBVHFC88tOEQF7tTttl9yomMIF9Qgf4l0O
         qpPVcj4KhDSXOwJwSvqX1npd6895+ZR0dcfrI7N8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200925141234eucas1p115abf7d0d5af792ff10abab0adc70c05~4DEQtKIQa2131721317eucas1p1Z;
        Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CF.E4.06456.2DAFD6F5; Fri, 25
        Sep 2020 15:12:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141234eucas1p13ab5a15da95185dcc99300772d0d72ce~4DEQVaiXg1940419404eucas1p1d;
        Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200925141234eusmtrp121f952957ba05d6361967c7e2ae9dd31~4DEQUsHWJ1676616766eusmtrp1j;
        Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-68-5f6dfad2453e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 4E.7B.06017.1DAFD6F5; Fri, 25
        Sep 2020 15:12:33 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141233eusmtip13cef9bafb9f5c4dede41b7b90c27a9c2~4DEPuzSgK1697816978eusmtip16;
        Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Christoph Hellwig <hch@lst.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] media: platform: exynos4-is: remove all references to
 physicall addresses
Date:   Fri, 25 Sep 2020 16:12:16 +0200
Message-Id: <20200925141218.13550-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTURzn7N7dXYeT67Q8aCSMCjLykQoXNCkJutGXiOqDlDr1oiPvlN3N
        NBDGzMyxajU0mSUq5GO+ljizpfkonTKc+ci0DPJFKJiiqSimeb1qXw6/83v8f38OB0ekZUJf
        XKFU0yqlPFWGidHmng3X2aFNJi74y6+j5JuiBiFZXdMtIEvbI8j8YquIHBjYPYbtLzHSYLUJ
        yaKBDwKy7tMPEdm5NCMk82bnEHIldxu74E7NdJYIqNqSWkAVawdRqtGSj1GmsUpAvR/XYtST
        JgugVhqPX8NjxJFJdKoig1YFRcWLU0yVwnSzDmSWtpqEWjCaqgduOCTCYN9UsUAPxLiUqAKw
        pr0fcIKU+ANgQ7+GF1YAnC2oRw8ST7sLRbypcleoVRwGFhq8OYwRIVC/oMf0AMe9CTWs6PXg
        5iDEjAC2/i0TcB4vIh46RgwYh1HiJOyZcCEclhDn4UbFVwHf5Q9rrB17vBsRBScHOwA3CBIW
        EVxsqwK86RK0TjYhPPaC844mEY+PQafJgPKBHAAnXXUi/mIAcFhXtJ+OgBOuzb1VEeI0bLAH
        8fRFWLL1G+VoSHjAsQVPjkZ24fPmFwhPS+Cjh1LefQqaHfWHtZ2fh/bXoaBtJEfEP+IzAE0b
        5YgR+Jv/l5UCYAE+tIZlkmk2REnfC2TlDKtRJgcmpjGNYPfjOLcdyy1gdSihCxA4kLlLeqeY
        OKlQnsFmMV0A4ojMWxLd74yVSpLkWfdpVVqcSpNKs13AD0dlPpLQ8rk7UiJZrqbv0nQ6rTpQ
        BbibrxaUFawZyfFIxvMmK7VX+5Q+yNYtL+m02X62cPVHbduJLS820xyGDuct/hTN3zJevtHW
        F6DINU7dLhTaibWCq6uvR+nwxp3vWytYh//0eqTzeux61Jlz5XFX3r1lnEdYa2gw8m3blpYw
        Gt0isSGJ4YjNY9r8eHn2VfBOjLjNU4ayKfKQAETFyv8Bt73jpzQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e/4Xd2Lv3LjDR7OtrHYOGM9q8XK1UeZ
        LBbst7bonL2B3eL8eSBxedccNoueDVtZLWac38dksfbIXXaLgx+esFq0P33JbPG59R+bA4/H
        k4PzmDzWzFvD6DG74SKLx6ZVnWwek28sZ/TYfbOBzaNvyypGj8+b5AI4ovRsivJLS1IVMvKL
        S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyJi9nLZjVxFixYM9k1gbG
        azldjJwcEgImEv1Hp7F3MXJxCAksZZQ49ayJHSIhI3FyWgMrhC0s8edaFxtE0SdGiUObHzOC
        JNgEDCW63oIkODlEBMokOq5sZQYpYhZ4wyRx99UPsEnCAnESB/vnsYDYLAKqEsfunGMGsXkF
        bCV+LrvOBLFBXmL1hgNgcU4BO4mHFw8ALeAA2mYrsf+h0wRGvgWMDKsYRVJLi3PTc4uN9IoT
        c4tL89L1kvNzNzECY2DbsZ9bdjB2vQs+xCjAwajEw6vwNDdeiDWxrLgy9xCjBAezkgiv09nT
        cUK8KYmVValF+fFFpTmpxYcYTYFumsgsJZqcD4zPvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFC
        AumJJanZqakFqUUwfUwcnFINjLpn7mfUm+YLC169VP04+b/vgZN9EeeTwybL7c/hWS9TdG6x
        9oLIF27n91wTi0u1ZT282NHYWkM56PGB1YVTfppNj1NMuTxBo+FQVn27q2cyd7Dul4oo9lvT
        95X5iVi2BTBP9hax6b/2PNnAu5FH5pZ+uILFC6kryWt9P2n/DavzUirbvVpZiaU4I9FQi7mo
        OBEALv7o85cCAAA=
X-CMS-MailID: 20200925141234eucas1p13ab5a15da95185dcc99300772d0d72ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141234eucas1p13ab5a15da95185dcc99300772d0d72ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141234eucas1p13ab5a15da95185dcc99300772d0d72ce
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141234eucas1p13ab5a15da95185dcc99300772d0d72ce@eucas1p1.samsung.com>
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

