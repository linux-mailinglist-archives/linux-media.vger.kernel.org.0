Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958B27002B
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgIROs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:48:58 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43905 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgIROs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:48:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200918144855euoutp01807c5dd7e37e41282cbc93b5500970d0~16C-teeQH1226312263euoutp01I
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 14:48:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200918144855euoutp01807c5dd7e37e41282cbc93b5500970d0~16C-teeQH1226312263euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600440535;
        bh=RCuLRfHQO0zMamxsPVc9KnXy3A4V8FmIbMSlqAKbmTI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mgrImLIIBkbayygnBjYlCj5KeIugTkC52wSuYEtCueUwyD1XpUfl/vNjGWnOS7eaz
         dOJVRMff+pr+KCCGhRVyO6Mdc0GFyiWd4UvKjoo97v65IWt6dgKqBYd/fBurKdLIXI
         IHWIvMqkGnk+465Obyvr/gorTzq+f98oUZTliQ/w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200918144854eucas1p1967dc67825cc314eba6121726efef9cc~16C-e10zj2767027670eucas1p12;
        Fri, 18 Sep 2020 14:48:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id B8.BE.05997.6D8C46F5; Fri, 18
        Sep 2020 15:48:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200918144854eucas1p2ad33e726e1e3caa04ab4145f86b05486~16C_wu6F21175311753eucas1p2O;
        Fri, 18 Sep 2020 14:48:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200918144854eusmtrp12b51a427d45a1a2583df8d4e1c665556~16C_wIer21892418924eusmtrp1E;
        Fri, 18 Sep 2020 14:48:54 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-57-5f64c8d63011
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F9.2E.06314.6D8C46F5; Fri, 18
        Sep 2020 15:48:54 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144853eusmtip111e745941de67270c021f9ae5210ac18~16C_UYDIz1497714977eusmtip1i;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 4/4] media: platform: s5p-mfc: add support for generic
 DMA-IOMMU glue code
Date:   Fri, 18 Sep 2020 16:48:33 +0200
Message-Id: <20200918144833.14618-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918144833.14618-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduznOd1rJ1LiDRb2GltsnLGe1eL8+Q3s
        Fj0btrJazDi/j8li7ZG77BbLNv1hsjj44QmrRfvTl8wWn1v/sTlweqyZt4bRY3bDRRaPTas6
        2Tz6tqxi9Pi8SS6ANYrLJiU1J7MstUjfLoEro/fAQuaC6XIV006eZW5gnCfZxcjJISFgIvFn
        8y82EFtIYAWjxJM9yl2MXED2F0aJ183T2SCcz4wSlxbvZ4TpOL5vIhNEYjmjxOeNs9nhWg5t
        +8QKUsUmYCjR9bYLbK6IgJPEwll/wYqYBTYxSex684EJJCEsEC/x8fdsFhCbRUBVoufRLHYQ
        m1fAVuLS86csEOvkJVZvOMDcxcjBwSlgJ3G1yRJkjoRAM7vElBnfWCFqXCQObOplgrCFJV4d
        38IOYctInJ7cwwLVwCjx8Nxadginh1HictMMqIesJe6cAwUBB9B5mhLrd+lDhB0lfi5fBLZY
        QoBP4sZbQZAwM5A5adt0qDCvREebEES1msSs4+vg1h68cIkZwvaQmPPhByskgCYySsyec5p9
        AqP8LIRlCxgZVzGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSmjtP/jn/ZwbjrT9IhRgEO
        RiUe3hfzUuKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHL
        WCGB9MSS1OzU1ILUIpgsEwenVAOjpOKuXwvda7fGcM40qn5W2+XX8fewyXaRnIIXXV/fl0y2
        DtKzzqlS3+dge3haPZdTc32/YcvrefMuv/ezyftsZ7XPQa3DPWV1glpyttmVdU0TuaI6V1n/
        upMgmLtHRqs2yuVWglecuIfphyN3Jj5ZZ7/8ikTzvpqJMzNi+O+fURfdWWl4epcSS3FGoqEW
        c1FxIgBmwhzKGQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsVy+t/xu7rXTqTEG+z/xmyxccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzJbfG79x+bA6bFm3hpGj9kNF1k8Nq3q
        ZPPo27KK0ePzJrkA1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jN4DC5kLpstVTDt5lrmBcZ5kFyMnh4SAicTxfROZuhi5OIQEljJKXNl+iBki
        ISNxcloDK4QtLPHnWhcbRNEnRomlz66xgCTYBAwlut6CJDg5RARcJPbvecoMUsQssI1J4tfW
        RUwgCWGBWIn+F2vBGlgEVCV6Hs1iB7F5BWwlLj1/ygKxQV5i9YYDQM0cHJwCdhJXmyxBwkJA
        Ja1LlrBNYORbwMiwilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzCQtx37uXkH46WNwYcYBTgY
        lXh4X8xLiRdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToJsmMkuJJucD
        oyyvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVANjyXax2bwtn0s9
        Vk75t//UhaMHb8+WlJ/NI/Bgu8f/i2alCg/WO2x+e0J5ktW8M+45zszGxp0OtXOZDzuzLzMu
        v2n0Qvav4RTvmCUJ4hkXg87auYR6JG36sK7v3SGZpbFmIle8Jla9Ff97xICtdY7CqnfXClln
        XX/zbJ6ZlkwV+5m/jXYb94kHK7EUZyQaajEXFScCAIlTWCV6AgAA
X-CMS-MailID: 20200918144854eucas1p2ad33e726e1e3caa04ab4145f86b05486
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200918144854eucas1p2ad33e726e1e3caa04ab4145f86b05486
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200918144854eucas1p2ad33e726e1e3caa04ab4145f86b05486
References: <20200918144833.14618-1-m.szyprowski@samsung.com>
        <CGME20200918144854eucas1p2ad33e726e1e3caa04ab4145f86b05486@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

S5P-MFC driver relies on the way the ARM DMA-IOMMU glue code works:
the IOVA allocator uses first-fit algorithm, so the first allocated
buffer is at 0x0 DMA/IOVA address. This is not true for the generic
IOMMU-DMA glue code that will be used for ARM architecture soon, so add
the needed code to support it too.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c      | 35 ++++++++++++++++++-
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |  2 ++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index 4e50c342b322..63cbf1d29c43 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
@@ -1201,6 +1202,10 @@ static int s5p_mfc_configure_common_memory(struct s5p_mfc_dev *mfc_dev)
 	if (!mfc_dev->mem_bitmap)
 		return -ENOMEM;
 
+	/* MFC v5 can access memory only via the 128M window */
+	if (exynos_is_iommu_available(dev) && !IS_MFCV6_PLUS(mfc_dev))
+		dma_set_mask_and_coherent(dev, SZ_128M - 1);
+
 	mfc_dev->mem_virt = dma_alloc_coherent(dev, mem_size,
 					       &mfc_dev->mem_base, GFP_KERNEL);
 	if (!mfc_dev->mem_virt) {
@@ -1218,13 +1223,37 @@ static int s5p_mfc_configure_common_memory(struct s5p_mfc_dev *mfc_dev)
 	 * as used (to keep required base alignment) and adjust base address
 	 */
 	if (mfc_dev->mem_base == (dma_addr_t)0) {
-		unsigned int offset = 1 << MFC_BASE_ALIGN_ORDER;
+		unsigned int offset = MFC_MIN_VALID_BASE;
 
 		bitmap_set(mfc_dev->mem_bitmap, 0, offset >> PAGE_SHIFT);
 		mfc_dev->dma_base[BANK_L_CTX] += offset;
 		mfc_dev->dma_base[BANK_R_CTX] += offset;
 	}
 
+	/*
+	 * Generic DMA-IOMMU use last-fit memory allocation algorithm, so
+	 * remap the firmware to the lowest supported address for MFC v5 to
+	 * let HW properly address buffers as an offset from the firmware.
+	 */
+	if (IS_ENABLED(CONFIG_IOMMU_DMA) && exynos_is_iommu_available(dev) &&
+	    !IS_MFCV6_PLUS(mfc_dev)) {
+		struct sg_table sgt;
+		int size;
+
+		if (dma_get_sgtable(dev, &sgt, mfc_dev->mem_virt,
+				    mfc_dev->mem_base, mfc_dev->mem_size) != 0)
+			return -ENOMEM;
+		size = iommu_map_sgtable(iommu_get_domain_for_dev(dev),
+					 MFC_MIN_VALID_BASE, &sgt,
+					 IOMMU_READ | IOMMU_WRITE);
+		sg_free_table(&sgt);
+		if (size != mem_size)
+			return -ENOMEM;
+
+		mfc_dev->dma_base[BANK_L_CTX] = MFC_MIN_VALID_BASE;
+		mfc_dev->dma_base[BANK_R_CTX] = MFC_MIN_VALID_BASE;
+	}
+
 	/* Firmware allocation cannot fail in this case */
 	s5p_mfc_alloc_firmware(mfc_dev);
 
@@ -1241,6 +1270,10 @@ static void s5p_mfc_unconfigure_common_memory(struct s5p_mfc_dev *mfc_dev)
 {
 	struct device *dev = &mfc_dev->plat_dev->dev;
 
+	if (IS_ENABLED(CONFIG_IOMMU_DMA) && exynos_is_iommu_available(dev) &&
+	    !IS_MFCV6_PLUS(mfc_dev))
+		iommu_unmap(iommu_get_domain_for_dev(dev), MFC_MIN_VALID_BASE,
+			    mfc_dev->mem_size);
 	dma_free_coherent(dev, mfc_dev->mem_size, mfc_dev->mem_virt,
 			  mfc_dev->mem_base);
 	kfree(mfc_dev->mem_bitmap);
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
index 96d1ecd1521b..f28c943b8426 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
@@ -37,6 +37,8 @@
 #define MFC_BANK2_ALIGN_ORDER	13
 #define MFC_BASE_ALIGN_ORDER	17
 
+#define MFC_MIN_VALID_BASE	(1 << MFC_BASE_ALIGN_ORDER)
+
 #define MFC_FW_MAX_VERSIONS	2
 
 #include <media/videobuf2-dma-contig.h>
-- 
2.17.1

