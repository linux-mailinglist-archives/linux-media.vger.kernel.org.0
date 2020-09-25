Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6890278AA4
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgIYONI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:13:08 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48823 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728977AbgIYOMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:34 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141232euoutp02b1284d0af095bc89400aac9f9ab4673e~4DEOyIZhT0580805808euoutp027
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200925141232euoutp02b1284d0af095bc89400aac9f9ab4673e~4DEOyIZhT0580805808euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043152;
        bh=LBafGxduMqujCqtcOuirj0eG6IiPYgtYMNGxyXBJvis=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nOx6+j2sXDHU/xINZqYKAsyrvjroAGVdX/bTJwfZ3Vl8x8Bz7m8ejaAl7IxTa2jlh
         yYFaIsrKVXOOBC+DK7BomZBd7XR2OFe9f8ApWwQ6SbWuTsCtartpK2B9mVzMrrUTX3
         KPjLlElgGeOIa8QYkkFopKpUWY/D/GoZPypcNbBQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200925141232eucas1p1ee7c71a2e779ace903809af6f434547a~4DEOhU5xP1940819408eucas1p1l;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 4D.E4.06456.0DAFD6F5; Fri, 25
        Sep 2020 15:12:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200925141231eucas1p22043424ba07b99f7727f750487a55b6d~4DEORWFls3257132571eucas1p26;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200925141231eusmtrp2b4443a9b08f293ad547fa29babed9335~4DEOQwrTc2598725987eusmtrp2j;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-5e-5f6dfad042e5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.49.06314.FCAFD6F5; Fri, 25
        Sep 2020 15:12:31 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141231eusmtip190c22a68db9519674c016d8da3aa68f7~4DENsaA9_1697816978eusmtip15;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
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
Subject: [PATCH 2/8] iommu: iova: properly handle 0 as a valid IOVA address
Date:   Fri, 25 Sep 2020 16:12:12 +0200
Message-Id: <20200925141218.13550-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djPc7oXfuXGG3TuZ7PYOGM9q8XK1UeZ
        LBbst7bonL2B3eL8eSBxedccNoueDVtZLWac38dksfbIXXaLgx+esFq0P33JbPG59R+bA4/H
        k4PzmDzWzFvD6DG74SKLx6ZVnWwek28sZ/TYfbOBzaNvyypGj8+b5AI4orhsUlJzMstSi/Tt
        Ergy2pcvZSn4ZFKx/YtVA+N3rS5GTg4JAROJSbM6mLsYuTiEBFYwSlyavJkVwvnCKNH+5BtU
        5jOjxIwPH5lgWrZ1n2eBSCxnlNh6fR0zXEtz1xk2kCo2AUOJrrddQDYHh4hAicSyE3wgNcwC
        T5gk9vxdCDZJWMBb4vibeywgNouAqsST3jfMIDavgK3EhWlrGSG2yUus3nAALM4pYCfx8OIB
        RpBBEgKr2CUuXj8PVeQi0bpiAhuELSzx6vgWdghbRuL/zvlMEA3NjBIPz61lh3B6GCUuN82A
        6raWuHPuF9ipzAKaEut36UOEHSWuXXzIBBKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx
        6/g6uLUHL1xihrA9JB7O+c4ICaCJjBILdvWzTmCUn4WwbAEj4ypG8dTS4tz01GLDvNRyveLE
        3OLSvHS95PzcTYzApHP63/FPOxi/Xko6xCjAwajEw3viUW68EGtiWXFl7iFGCQ5mJRFep7On
        44R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgSTZeLglGpg3PHeq5m5
        bEeTpPXC/QW65cvlz847sWHb9/LEtQcCgq6t5Dh3lUHg6dXr2YtsWsL9miZxnOg3fXLLxf1h
        2Ewry43Plp4zcQrg48iO/bfqg8vmhQazjylvVRTfcZmh+9H2kwzrq7t4Psa4WB4SC4ydn60V
        94mv+EUuf0HA5sIkr9K8o1wXPHc/UGIpzkg01GIuKk4EAJTcX7Y2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42I5/e/4Xd3zv3LjDU5d07PYOGM9q8XK1UeZ
        LBbst7bonL2B3eL8eSBxedccNoueDVtZLWac38dksfbIXXaLgx+esFq0P33JbPG59R+bA4/H
        k4PzmDzWzFvD6DG74SKLx6ZVnWwek28sZ/TYfbOBzaNvyypGj8+b5AI4ovRsivJLS1IVMvKL
        S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy2pcvZSn4ZFKx/YtVA+N3
        rS5GTg4JAROJbd3nWUBsIYGljBJHWuIh4jISJ6c1sELYwhJ/rnWxdTFyAdV8YpTYvfguI0iC
        TcBQoustSIKTQ0SgTKLjylZmkCJmgTdMEndf/WAHSQgLeEscf3MPbAOLgKrEk943zCA2r4Ct
        xIVpaxkhNshLrN5wACzOKWAn8fDiAaA4B9A2W4n9D50mMPItYGRYxSiSWlqcm55bbKhXnJhb
        XJqXrpecn7uJERj+24793LyD8dLG4EOMAhyMSjy8Jx7lxguxJpYVV+YeYpTgYFYS4XU6ezpO
        iDclsbIqtSg/vqg0J7X4EKMp0E0TmaVEk/OBsZlXEm9oamhuYWlobmxubGahJM7bIXAwRkgg
        PbEkNTs1tSC1CKaPiYNTqoGR5+xhR3E7AW8PZ1OuGQssrwvol8+VuR1YcPNca9vLnyFzXp9z
        iZjxZYeiJveG9ba2yT8EJDKjD8sc5P/mL7r4R7RLBts8H/cNj3mv116Km5pttnBPMKvKn+OP
        zk11qHAKLD1k/s2A6eysPZ/tYs7uXec/6eGVuFiZupsHXrj3v2Oe+PFBetUqJZbijERDLeai
        4kQAhqQOLpUCAAA=
X-CMS-MailID: 20200925141231eucas1p22043424ba07b99f7727f750487a55b6d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141231eucas1p22043424ba07b99f7727f750487a55b6d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141231eucas1p22043424ba07b99f7727f750487a55b6d
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141231eucas1p22043424ba07b99f7727f750487a55b6d@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Zero is a valid DMA and IOVA address on many architectures, so adjust the
IOVA management code to properly handle it. A new value IOVA_BAD_ADDR
(~0UL) is introduced as a generic value for the error case. Adjust all
callers of the alloc_iova_fast() function for the new return value.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/dma-iommu.c   | 18 ++++++++++--------
 drivers/iommu/intel/iommu.c | 12 ++++++------
 drivers/iommu/iova.c        | 10 ++++++----
 include/linux/iova.h        |  2 ++
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index cd6e3c70ebb3..91dd8f46dae1 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -405,7 +405,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
-	unsigned long shift, iova_len, iova = 0;
+	unsigned long shift, iova_len, iova = IOVA_BAD_ADDR;
 
 	if (cookie->type == IOMMU_DMA_MSI_COOKIE) {
 		cookie->msi_iova += size;
@@ -433,11 +433,13 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 		iova = alloc_iova_fast(iovad, iova_len,
 				       DMA_BIT_MASK(32) >> shift, false);
 
-	if (!iova)
+	if (iova == IOVA_BAD_ADDR)
 		iova = alloc_iova_fast(iovad, iova_len, dma_limit >> shift,
 				       true);
 
-	return (dma_addr_t)iova << shift;
+	if (iova != IOVA_BAD_ADDR)
+		return (dma_addr_t)iova << shift;
+	return DMA_MAPPING_ERROR;
 }
 
 static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
@@ -493,8 +495,8 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	size = iova_align(iovad, size + iova_off);
 
 	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
-	if (!iova)
-		return DMA_MAPPING_ERROR;
+	if (iova == DMA_MAPPING_ERROR)
+		return iova;
 
 	if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) {
 		iommu_dma_free_iova(cookie, iova, size);
@@ -617,7 +619,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 
 	size = iova_align(iovad, size);
 	iova = iommu_dma_alloc_iova(domain, size, dev->coherent_dma_mask, dev);
-	if (!iova)
+	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_pages;
 
 	if (sg_alloc_table_from_pages(&sgt, pages, count, 0, size, GFP_KERNEL))
@@ -887,7 +889,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	}
 
 	iova = iommu_dma_alloc_iova(domain, iova_len, dma_get_mask(dev), dev);
-	if (!iova)
+	if (iova == DMA_MAPPING_ERROR)
 		goto out_restore_sg;
 
 	/*
@@ -1181,7 +1183,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 		return NULL;
 
 	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
-	if (!iova)
+	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_page;
 
 	if (iommu_map(domain, iova, msi_addr, size, prot))
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 00963cedfd83..885d0dee39cc 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3416,15 +3416,15 @@ static unsigned long intel_alloc_iova(struct device *dev,
 		 */
 		iova_pfn = alloc_iova_fast(&domain->iovad, nrpages,
 					   IOVA_PFN(DMA_BIT_MASK(32)), false);
-		if (iova_pfn)
+		if (iova_pfn != IOVA_BAD_ADDR)
 			return iova_pfn;
 	}
 	iova_pfn = alloc_iova_fast(&domain->iovad, nrpages,
 				   IOVA_PFN(dma_mask), true);
-	if (unlikely(!iova_pfn)) {
+	if (unlikely(iova_pfn == IOVA_BAD_ADDR)) {
 		dev_err_once(dev, "Allocating %ld-page iova failed\n",
 			     nrpages);
-		return 0;
+		return IOVA_BAD_ADDR;
 	}
 
 	return iova_pfn;
@@ -3454,7 +3454,7 @@ static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 	size = aligned_nrpages(paddr, size);
 
 	iova_pfn = intel_alloc_iova(dev, domain, dma_to_mm_pfn(size), dma_mask);
-	if (!iova_pfn)
+	if (iova_pfn == IOVA_BAD_ADDR)
 		goto error;
 
 	/*
@@ -3663,7 +3663,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 
 	iova_pfn = intel_alloc_iova(dev, domain, dma_to_mm_pfn(size),
 				*dev->dma_mask);
-	if (!iova_pfn) {
+	if (iova_pfn == IOVA_BAD_ADDR) {
 		sglist->dma_length = 0;
 		return 0;
 	}
@@ -3760,7 +3760,7 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
 	nrpages = aligned_nrpages(0, size);
 	iova_pfn = intel_alloc_iova(dev, domain,
 				    dma_to_mm_pfn(nrpages), dma_mask);
-	if (!iova_pfn)
+	if (iova_pfn == IOVA_BAD_ADDR)
 		return DMA_MAPPING_ERROR;
 
 	/*
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 30d969a4c5fd..87555ed1737a 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -407,6 +407,8 @@ EXPORT_SYMBOL_GPL(free_iova);
  * This function tries to satisfy an iova allocation from the rcache,
  * and falls back to regular allocation on failure. If regular allocation
  * fails too and the flush_rcache flag is set then the rcache will be flushed.
+ * Returns a pfn the allocated iova starts at or IOVA_BAD_ADDR in the case
+ * of a failure.
 */
 unsigned long
 alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
@@ -416,7 +418,7 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
 	struct iova *new_iova;
 
 	iova_pfn = iova_rcache_get(iovad, size, limit_pfn + 1);
-	if (iova_pfn)
+	if (iova_pfn != IOVA_BAD_ADDR)
 		return iova_pfn;
 
 retry:
@@ -425,7 +427,7 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
 		unsigned int cpu;
 
 		if (!flush_rcache)
-			return 0;
+			return IOVA_BAD_ADDR;
 
 		/* Try replenishing IOVAs by flushing rcache. */
 		flush_rcache = false;
@@ -956,7 +958,7 @@ static unsigned long __iova_rcache_get(struct iova_rcache *rcache,
 				       unsigned long limit_pfn)
 {
 	struct iova_cpu_rcache *cpu_rcache;
-	unsigned long iova_pfn = 0;
+	unsigned long iova_pfn = IOVA_BAD_ADDR;
 	bool has_pfn = false;
 	unsigned long flags;
 
@@ -998,7 +1000,7 @@ static unsigned long iova_rcache_get(struct iova_domain *iovad,
 	unsigned int log_size = order_base_2(size);
 
 	if (log_size >= IOVA_RANGE_CACHE_MAX_SIZE)
-		return 0;
+		return IOVA_BAD_ADDR;
 
 	return __iova_rcache_get(&iovad->rcaches[log_size], limit_pfn - size);
 }
diff --git a/include/linux/iova.h b/include/linux/iova.h
index a0637abffee8..69737e6bcef6 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -22,6 +22,8 @@ struct iova {
 	unsigned long	pfn_lo; /* Lowest allocated pfn */
 };
 
+#define IOVA_BAD_ADDR	(~0UL)
+
 struct iova_magazine;
 struct iova_cpu_rcache;
 
-- 
2.17.1

