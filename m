Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDD5270024
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgIROsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:48:55 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44495 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgIROsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:48:55 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200918144853euoutp02a82e07887cc8deb5dafb0a3e815517cb~16C_lLHMx2946329463euoutp02l
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200918144853euoutp02a82e07887cc8deb5dafb0a3e815517cb~16C_lLHMx2946329463euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600440533;
        bh=NT9iqMLTjgKNpXXtL1v6+t4dPuGuedIJyGlk+Ys+a+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qNaSX45GwO06KcEQBYkeIoDhj1x+063c6H+OLmSIw2Rrt17+riqtZfgIUUPTs+ROK
         StkXvuljDFrZtBQA1IDUSn2gKgGo6PZaJQ2pShXMukNcO7CNFc3b3kXSRTHGGPMB7I
         PsTvHhMMlzyz1626T8pSlztZqjscZ5fRy9N2dg9k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200918144853eucas1p215d60de9e9481717700567ee4f6d2214~16C_XPre11376313763eucas1p2J;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E7.BE.05997.5D8C46F5; Fri, 18
        Sep 2020 15:48:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144853eucas1p1b04a96d33c66052f845b3979a3105f9f~16C_Ahl3N3169231692eucas1p1p;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200918144853eusmtrp1713718cbbb730d4a4f38e7646ae43202~16C9-5vk61892418924eusmtrp1B;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-53-5f64c8d549a4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.2E.06314.5D8C46F5; Fri, 18
        Sep 2020 15:48:53 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144852eusmtip15af5d2da0fd731f0d3933141779eef8c~16C9eRFtd1497714977eusmtip1h;
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
Subject: [PATCH v2 2/4] media: platform: exynos4-is: add support for generic
 IOMMU-DMA glue code
Date:   Fri, 18 Sep 2020 16:48:31 +0200
Message-Id: <20200918144833.14618-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918144833.14618-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduzned2rJ1LiDZ7NUrfYOGM9q8X58xvY
        LXo2bGW1mHF+H5PF2iN32S2WbfrDZHHwwxNWi/anL5ktPrf+Y3Pg9Fgzbw2jx+yGiywem1Z1
        snn0bVnF6PF5k1wAaxSXTUpqTmZZapG+XQJXRsf3hUwFC3Qrem42szQwXlLtYuTkkBAwkVhy
        5Q5rFyMXh5DACkaJfftOsUM4Xxgldsy4zQLhfGaUaP9ynBGmZU7nOUaIxHJGic5Tc1nhWibt
        /8oKUsUmYCjR9baLDcQWEXCSWDjrL9hcZoFNTBK73nxg6mLk4BAWSJKYdMEcpIZFQFVi6qU7
        YPW8ArYS8y4dZIbYJi+xesMBZpByTgE7iatNliBjJAT+s0lc3X0f6iIXiWX7NkHVC0u8Or6F
        HcKWkTg9uYcFoqGZUeLhubXsEE4Po8TlphlQ3dYSd879YgPZwCygKbF+lz5E2FHi1415LCBh
        CQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlqHM8JOYdnswGCZ+JjBI3dq1n
        mcAoPwth2QJGxlWM4qmlxbnpqcVGeanlesWJucWleel6yfm5mxiBqeP0v+NfdjDu+pN0iFGA
        g1GJh/fFvJR4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70
        MlZIID2xJDU7NbUgtQgmy8TBKdXAKM8h+XYLT8NrwfI3Z1b9Z5Jfs/V4Y8+0+KYHGXmscvmx
        Zl4vd16r5rb1WJg9NXC5gEL8dkn3PsvsrfaZpdtm3PM1105YliCT83fXfTdB594sg2iRhkXf
        mBImPnv9ucs/Wz6fdfrcFQsL/z0XmDqr7Mecx3yGeesEY4o/qUyclsRn4Fg78+YKJZbijERD
        Leai4kQANlKKShkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsVy+t/xu7pXT6TEG/Qe5rTYOGM9q8X58xvY
        LXo2bGW1mHF+H5PF2iN32S2WbfrDZHHwwxNWi/anL5ktPrf+Y3Pg9Fgzbw2jx+yGiywem1Z1
        snn0bVnF6PF5k1wAa5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpq
        TmZZapG+XYJeRsf3hUwFC3Qrem42szQwXlLtYuTkkBAwkZjTeY6xi5GLQ0hgKaNE84mtrBAJ
        GYmT0xqgbGGJP9e62CCKPjFKvN13FyzBJmAo0fUWJMHJISLgIrF/z1NmkCJmgW1MEr+2LmLq
        YuTgEBZIkDjxzgekhkVAVWLqpTtg9bwCthLzLh1khlggL7F6wwFmkHJOATuJq02WIGEhoJLW
        JUvYJjDyLWBkWMUoklpanJueW2yoV5yYW1yal66XnJ+7iREYxtuO/dy8g/HSxuBDjAIcjEo8
        vC/mpcQLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBNE5mlRJPzgTGW
        VxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBUfGt4Y2zLy7MUp8S
        vyrYuc9e0Vxy/cfySyfdQjod/n4WErPr8LbL9pz9ZW+4TXuo59aSkAmz0ueLuglzt0q/sr3K
        YrAn5LfZta6fmdODbuRkZDMflUt5LSmnvkfoSa7vvJN3vtxWW6u894vLoi1L49cflPwb1SjX
        mlLaFnv03sSN0/6vr7mYrMRSnJFoqMVcVJwIAC5MSwx5AgAA
X-CMS-MailID: 20200918144853eucas1p1b04a96d33c66052f845b3979a3105f9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200918144853eucas1p1b04a96d33c66052f845b3979a3105f9f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200918144853eucas1p1b04a96d33c66052f845b3979a3105f9f
References: <20200918144833.14618-1-m.szyprowski@samsung.com>
        <CGME20200918144853eucas1p1b04a96d33c66052f845b3979a3105f9f@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exynos4-IS driver relied on the was the ARM DMA-IOMMU glue code worked -
mainly it relied on the fact that the allocator used first-fit algorithm
and the first allocated buffer were at 0x0 DMA/IOVA address. This is not
true for the generic IOMMU-DMA glue code that will be used for ARM
architecture soon, so add the needed code to support such case.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 72 +++++++++++++++++----
 drivers/media/platform/exynos4-is/fimc-is.h |  4 +-
 2 files changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 69510a700798..98fb242b6ac7 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
+#include <linux/iommu.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/of_graph.h>
@@ -269,7 +270,7 @@ int fimc_is_cpu_set_power(struct fimc_is *is, int on)
 		mcuctl_write(0, is, REG_WDT_ISP);
 
 		/* Cortex-A5 start address setting */
-		mcuctl_write(is->memory.addr, is, MCUCTL_REG_BBOAR);
+		mcuctl_write(is->memory.base, is, MCUCTL_REG_BBOAR);
 
 		/* Enable and start Cortex-A5 */
 		pmuisp_write(0x18000, is, REG_PMU_ISP_ARM_OPTION);
@@ -330,37 +331,82 @@ int fimc_is_start_firmware(struct fimc_is *is)
 	return ret;
 }
 
+#ifdef CONFIG_IOMMU_DMA
+#define FIMC_IS_CPU_MEM_BASE	(0)
+static int fimc_iommu_remap_cpu_memory(struct fimc_is *is)
+{
+	struct device *dev = &is->pdev->dev;
+	struct sg_table sgt;
+	int ret;
+
+	if (!dev_iommu_priv_get(dev))
+		return 0;
+
+	ret = dma_get_sgtable(dev, &sgt, is->memory.vaddr,
+			      is->memory.alloc_addr, FIMC_IS_CPU_MEM_SIZE);
+	if (ret)
+		return ret;
+
+	ret = iommu_map_sgtable(iommu_get_domain_for_dev(dev),
+				FIMC_IS_CPU_MEM_BASE, &sgt,
+				IOMMU_READ | IOMMU_WRITE);
+	sg_free_table(&sgt);
+	if (ret != FIMC_IS_CPU_MEM_SIZE)
+		return -EINVAL;
+
+	is->memory.base = FIMC_IS_CPU_MEM_BASE;
+	return 0;
+}
+
+static void fimc_iommu_unmap_cpu_memory(struct fimc_is *is)
+{
+	struct device *dev = &is->pdev->dev;
+
+	iommu_unmap(iommu_get_domain_for_dev(dev), FIMC_IS_CPU_MEM_BASE,
+		    FIMC_IS_CPU_MEM_SIZE);
+}
+#else
+static inline int fimc_iommu_remap_cpu_memory(struct fimc_is *is) { return 0; }
+static void fimc_iommu_unmap_cpu_memory(struct fimc_is *is) { }
+#endif
+
 /* Allocate working memory for the FIMC-IS CPU. */
 static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 {
 	struct device *dev = &is->pdev->dev;
 
 	is->memory.vaddr = dma_alloc_coherent(dev, FIMC_IS_CPU_MEM_SIZE,
-					      &is->memory.addr, GFP_KERNEL);
+					    &is->memory.alloc_addr, GFP_KERNEL);
 	if (is->memory.vaddr == NULL)
 		return -ENOMEM;
 
+	is->memory.base = is->memory.alloc_addr;
 	is->memory.size = FIMC_IS_CPU_MEM_SIZE;
 
-	dev_info(dev, "FIMC-IS CPU memory base: %pad\n", &is->memory.addr);
+	if (fimc_iommu_remap_cpu_memory(is))
+		goto err;
+
+	dev_info(dev, "FIMC-IS CPU memory base: %pad\n", &is->memory.base);
 
-	if (((u32)is->memory.addr) & FIMC_IS_FW_ADDR_MASK) {
+	if (((u32)is->memory.base) & FIMC_IS_FW_ADDR_MASK) {
 		dev_err(dev, "invalid firmware memory alignment: %#x\n",
-			(u32)is->memory.addr);
-		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
-				  is->memory.addr);
-		return -EIO;
+			(u32)is->memory.base);
+		goto err;
 	}
 
 	is->is_p_region = (struct is_region *)(is->memory.vaddr +
 				FIMC_IS_CPU_MEM_SIZE - FIMC_IS_REGION_SIZE);
 
-	is->is_dma_p_region = is->memory.addr +
+	is->is_dma_p_region = is->memory.base +
 				FIMC_IS_CPU_MEM_SIZE - FIMC_IS_REGION_SIZE;
 
 	is->is_shared_region = (struct is_share_region *)(is->memory.vaddr +
 				FIMC_IS_SHARED_REGION_OFFSET);
 	return 0;
+err:
+	dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
+			  is->memory.alloc_addr);
+	return -EIO;
 }
 
 static void fimc_is_free_cpu_memory(struct fimc_is *is)
@@ -370,8 +416,9 @@ static void fimc_is_free_cpu_memory(struct fimc_is *is)
 	if (is->memory.vaddr == NULL)
 		return;
 
+	fimc_iommu_unmap_cpu_memory(is);
 	dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
-			  is->memory.addr);
+			  is->memory.alloc_addr);
 }
 
 static void fimc_is_load_firmware(const struct firmware *fw, void *context)
@@ -416,7 +463,8 @@ static void fimc_is_load_firmware(const struct firmware *fw, void *context)
 
 	dev_info(dev, "loaded firmware: %s, rev. %s\n",
 		 is->fw.info, is->fw.version);
-	dev_dbg(dev, "FW size: %zu, DMA addr: %pad\n", fw->size, &is->memory.addr);
+	dev_dbg(dev, "FW size: %zu, DMA addr: %pad\n", fw->size,
+		&is->memory.base);
 
 	is->is_shared_region->chip_id = 0xe4412;
 	is->is_shared_region->chip_rev_no = 1;
@@ -699,7 +747,7 @@ int fimc_is_hw_initialize(struct fimc_is *is)
 	}
 
 	pr_debug("shared region: %pad, parameter region: %pad\n",
-		 &is->memory.addr + FIMC_IS_SHARED_REGION_OFFSET,
+		 &is->memory.base + FIMC_IS_SHARED_REGION_OFFSET,
 		 &is->is_dma_p_region);
 
 	is->setfile.sub_index = 0;
diff --git a/drivers/media/platform/exynos4-is/fimc-is.h b/drivers/media/platform/exynos4-is/fimc-is.h
index ce30b007bc55..d44729839310 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.h
+++ b/drivers/media/platform/exynos4-is/fimc-is.h
@@ -186,7 +186,9 @@ struct fimc_is_firmware {
 
 struct fimc_is_memory {
 	/* DMA base address */
-	dma_addr_t addr;
+	dma_addr_t base;
+	/* DMA address from allocator */
+	dma_addr_t alloc_addr;
 	/* virtual base address */
 	void *vaddr;
 	/* total length */
-- 
2.17.1

