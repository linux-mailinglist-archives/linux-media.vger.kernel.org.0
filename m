Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A55626B7F8
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgIPAdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:33:05 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47046 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgIONnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:43:10 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200915133309euoutp02208ab38900a1cdfc2d17339ef3d1eab5~0_E-niq-T1387513875euoutp02P
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 13:33:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200915133309euoutp02208ab38900a1cdfc2d17339ef3d1eab5~0_E-niq-T1387513875euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600176789;
        bh=eCw5I8pYrfFFBjFsoG+EmC7RVNzBZd5XzgYc1xY4fjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iTkCkO/fHbS2vFkNgbifPDhE9o0FQmEU7JsTfggXwYHd6cdCy8vAjMe2yrEuN8/9h
         sJhYyDqHK8OvA401Wa/EQni9+U2Ein1gi4liYSlPXLDc0zFwJXIHnhLLVdgq5cy4+k
         X2g6kamiVS5h2xDTAbKyf6cnuUx++wqYaLAv/snk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200915133309eucas1p1ddc99ebde39abfe133ba3aae0d52e79d~0_E-YJoin0220202202eucas1p1H;
        Tue, 15 Sep 2020 13:33:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E8.11.05997.592C06F5; Tue, 15
        Sep 2020 14:33:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915133309eucas1p27768c75d4391f646b3715f29ff0c452a~0_E-BcY6K2313723137eucas1p2D;
        Tue, 15 Sep 2020 13:33:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200915133309eusmtrp10283eb4504d067ea62811fd959cec066~0_E-ASkam0804908049eusmtrp1H;
        Tue, 15 Sep 2020 13:33:09 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-8e-5f60c295ada6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 62.20.06314.492C06F5; Tue, 15
        Sep 2020 14:33:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915133308eusmtip2ca76179ebe2323342c260df289195709~0_E_lwbuQ0271402714eusmtip21;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 2/2] media: platform: exynos4-is: add support for generic
 IOMMU-DMA glue code
Date:   Tue, 15 Sep 2020 15:32:56 +0200
Message-Id: <20200915133256.1210-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915133256.1210-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWy7djPc7pTDyXEGyz+KW6xccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzI7cHismbeG0WPTqk42j74tqxg9Pm+S
        C2CJ4rJJSc3JLEst0rdL4MpYMPsGU8FJw4q1E+4yNjDO0uxi5OSQEDCRmNV2nb2LkYtDSGAF
        o8Ti11OYIJwvjBKfVp6BynxmlJjw5TITTMuF3XPYIBLLGSU2LGlAaPn84wwbSBWbgKFE19su
        MFtEwEli4ay/YKOYBfqYJK7MW8wKkhAWiJfYMmM3C4jNIqAqcW7OdrAVvAI2Et/n/WOBWCcv
        sXrDAWYQm1PAVuLGu2fMEPH3bBLnv4lB2C4SbctvQ50nLPHq+BZ2CFtG4vTkHhaQxRICzYwS
        D8+tZYdwehglLjfNYISospa4c+4X0KkcQOdpSqzfpQ8RdpT49XMJI0hYQoBP4sZbQZAwM5A5
        adt0Zogwr0RHmxBEtZrErOPr4NYevHAJ6kwPiabWNdAAmsAocXj7NsYJjPKzEJYtYGRcxSie
        Wlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZgoTv87/mUH464/SYcYBTgYlXh4E8rj44VYE8uK
        K3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQi
        mCwTB6dUA6PGpJmMjvNrOD6vWjEx5Zzcq/06B/Zae4Tau06JOlbjx8xwNtZt67wVpZNrPC4I
        hKfPP2229k3F+eXtT5NyFy5b7GGxRCRJ02vnyle8GVbdlXc+W9rtMpJcszb//Kevev0y6o1+
        ykLTJrG5xDytaefePe3o4k3K7v4G8gkWykmyeZpXyyfOV1diKc5INNRiLipOBADblqDbEAMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsVy+t/xe7pTDiXEG9yZa22xccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzI7cHismbeG0WPTqk42j74tqxg9Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtY
        MPsGU8FJw4q1E+4yNjDO0uxi5OSQEDCRuLB7DlsXIxeHkMBSRonb0zYyQSRkJE5Oa2CFsIUl
        /lzrgir6xCgxfWYrO0iCTcBQoustSIKTQ0TARWL/nqfMIEXMApOYJH73b2cESQgLxErsPnII
        rIhFQFXi3JztYBt4BWwkvs/7xwKxQV5i9YYDzCA2p4CtxI13z8BsIaCaR2u62CYw8i1gZFjF
        KJJaWpybnltsqFecmFtcmpeul5yfu4kRGLbbjv3cvIPx0sbgQ4wCHIxKPLwJ5fHxQqyJZcWV
        uYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGBM5ZXEG5oamltYGpob
        mxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYBTYvVTdl1O0M4vv+MyE+9rS1nuyC1en
        lH0+EmH7Me057823rFbz3VWU0r+6NTy8ldw6+VRXYcvN4oBz13qF787LZmR69NEmTTEqq3t6
        tWlV7zd37Q0l9ka/9n+4z6D691RHh9SE7c3/QqYxv5wffccv+GTKSuZHF9t3aN7nqRH8GukZ
        onbslRJLcUaioRZzUXEiABWLlq5xAgAA
X-CMS-MailID: 20200915133309eucas1p27768c75d4391f646b3715f29ff0c452a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200915133309eucas1p27768c75d4391f646b3715f29ff0c452a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200915133309eucas1p27768c75d4391f646b3715f29ff0c452a
References: <20200915133256.1210-1-m.szyprowski@samsung.com>
        <CGME20200915133309eucas1p27768c75d4391f646b3715f29ff0c452a@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exynos4-IS driver relies on the way the ARM DMA-IOMMU glue code works:
the IOVA allocator uses first-fit algorithm and the first allocated
buffer is at 0x0 DMA/IOVA address. This is not true for the generic
IOMMU-DMA glue code that will be used for ARM architecture soon, so add
the needed code to support such case too.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 95 ++++++++++++++++++---
 drivers/media/platform/exynos4-is/fimc-is.h |  6 +-
 2 files changed, 88 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 41b841a96338..bdef61be0cad 100644
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
@@ -330,37 +331,105 @@ int fimc_is_start_firmware(struct fimc_is *is)
 	return ret;
 }
 
+#ifdef CONFIG_IOMMU_DMA
+#define FIMC_IS_CPU_MEM_BASE	(0)
+static int fimc_iommu_remap_cpu_memory(struct fimc_is *is)
+{
+	struct device *dev = &is->pdev->dev;
+	struct iommu_domain *domain;
+	struct sg_table sgt;
+	int ret;
+
+	domain = iommu_domain_alloc(&platform_bus_type);
+	if (!domain)
+		return -ENOMEM;
+
+	ret = dma_get_sgtable(dev, &sgt, is->memory.vaddr,
+			      is->memory.alloc_addr, FIMC_IS_CPU_MEM_SIZE);
+	if (ret)
+		goto err_free_domain;
+
+	ret = iommu_attach_device(domain, dev);
+	if (ret)
+		goto err_free_sgt;
+
+	ret = iommu_map_sgtable(domain, FIMC_IS_CPU_MEM_BASE, &sgt,
+				IOMMU_READ | IOMMU_WRITE);
+	if (ret != FIMC_IS_CPU_MEM_SIZE) {
+		ret = -EINVAL;
+		goto err_detach;
+	}
+
+	is->memory.base = FIMC_IS_CPU_MEM_BASE;
+	is->memory.domain = domain;
+	sg_free_table(&sgt);
+
+	return 0;
+
+err_detach:
+	iommu_detach_device(domain, dev);
+err_free_sgt:
+	sg_free_table(&sgt);
+err_free_domain:
+	iommu_domain_free(domain);
+	return ret;
+}
+
+static void fimc_iommu_unmap_cpu_memory(struct fimc_is *is)
+{
+	struct iommu_domain *domain = is->memory.domain;
+	struct device *dev = &is->pdev->dev;
+
+	iommu_unmap(domain, FIMC_IS_CPU_MEM_BASE, FIMC_IS_CPU_MEM_SIZE);
+	iommu_detach_device(domain, dev);
+	iommu_domain_free(domain);
+}
+#else
+static inline int fimc_iommu_remap_cpu_memory(struct fimc_is *is)
+{
+	is->memory.base = is->memory.alloc_addr;
+	return 0;
+}
+
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
 
+	if (fimc_iommu_remap_cpu_memory(is))
+		goto err;
+
 	is->memory.size = FIMC_IS_CPU_MEM_SIZE;
 
-	dev_info(dev, "FIMC-IS CPU memory base: %pad\n", &is->memory.addr);
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
@@ -370,8 +439,9 @@ static void fimc_is_free_cpu_memory(struct fimc_is *is)
 	if (is->memory.vaddr == NULL)
 		return;
 
+	fimc_iommu_unmap_cpu_memory(is);
 	dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
-			  is->memory.addr);
+			  is->memory.alloc_addr);
 }
 
 static void fimc_is_load_firmware(const struct firmware *fw, void *context)
@@ -416,7 +486,8 @@ static void fimc_is_load_firmware(const struct firmware *fw, void *context)
 
 	dev_info(dev, "loaded firmware: %s, rev. %s\n",
 		 is->fw.info, is->fw.version);
-	dev_dbg(dev, "FW size: %zu, DMA addr: %pad\n", fw->size, &is->memory.addr);
+	dev_dbg(dev, "FW size: %zu, DMA addr: %pad\n", fw->size,
+		&is->memory.base);
 
 	is->is_shared_region->chip_id = 0xe4412;
 	is->is_shared_region->chip_rev_no = 1;
@@ -699,7 +770,7 @@ int fimc_is_hw_initialize(struct fimc_is *is)
 	}
 
 	pr_debug("shared region: %pad, parameter region: %pad\n",
-		 &is->memory.addr + FIMC_IS_SHARED_REGION_OFFSET,
+		 &is->memory.base + FIMC_IS_SHARED_REGION_OFFSET,
 		 &is->is_dma_p_region);
 
 	is->setfile.sub_index = 0;
diff --git a/drivers/media/platform/exynos4-is/fimc-is.h b/drivers/media/platform/exynos4-is/fimc-is.h
index ce30b007bc55..e96bf9122e91 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.h
+++ b/drivers/media/platform/exynos4-is/fimc-is.h
@@ -186,11 +186,15 @@ struct fimc_is_firmware {
 
 struct fimc_is_memory {
 	/* DMA base address */
-	dma_addr_t addr;
+	dma_addr_t base;
+	/* DMA address from allocator */
+	dma_addr_t alloc_addr;
 	/* virtual base address */
 	void *vaddr;
 	/* total length */
 	unsigned int size;
+	/* optional IOMMU domain */
+	struct iommu_domain *domain;
 };
 
 #define FIMC_IS_I2H_MAX_ARGS	12
-- 
2.17.1

