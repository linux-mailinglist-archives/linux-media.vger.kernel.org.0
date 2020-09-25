Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF33278AA2
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgIYONE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:13:04 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50628 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728968AbgIYOMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:35 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141234euoutp01ef6faf3e65f2e7aaee3f85c47786b167~4DEQfb9fg1106011060euoutp01l
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200925141234euoutp01ef6faf3e65f2e7aaee3f85c47786b167~4DEQfb9fg1106011060euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043154;
        bh=ne9u7VvtcKUtNJGd6gpwAnIIX9HybL1toIE7vYsodus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r4uF/aoxITpAjSLsg7hVtIW/4nmNKTFksX95LoeSEKU1dkHOLLpnzpmqwSPhp+1RW
         tgQRyWvGivBhxKBcfHp63r08sTn/S6dKUxpOblxp1Zr37Jihpdw4shWVckzIbbupVf
         wSH18f0De37EsOVLAQ38sl/6cVOJKzTPUv14E4Wg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200925141233eucas1p2cca36e0b11cc5db9cbda616b70e7a9fe~4DEQAmdTr3045930459eucas1p2x;
        Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C8.D3.06318.1DAFD6F5; Fri, 25
        Sep 2020 15:12:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200925141233eucas1p2148ace93f157bd631edd8db4e8df664b~4DEPw4PUF3139231392eucas1p21;
        Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200925141233eusmtrp2ff5345af0a8d80a26e9c2b715254c4ed~4DEPwRptr2568825688eusmtrp2J;
        Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-81-5f6dfad1ad2a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D2.49.06314.1DAFD6F5; Fri, 25
        Sep 2020 15:12:33 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141232eusmtip1a73066b6d091025c6bf9b7bd592e77e2~4DEPNuSm21158111581eusmtip1J;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
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
Subject: [PATCH 5/8] iommu: dma-iommu: add support for DMA_ATTR_LOW_ADDRESS
Date:   Fri, 25 Sep 2020 16:12:15 +0200
Message-Id: <20200925141218.13550-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSb0hTURzt7m1vb8vJazO8aCkMDMrU/EM9MKWi8EVf+lBEiq6lDxV9U/bU
        0g8xkpYuFTNiS0MtKm1zOpdKrlJn6oSRa0mlaIpmlJYQTTP/pPl8al8u53d+59xzuFwMkT4S
        +GHpqhxKrVJmylExv61vcSDEvUQrDpl7g4lmQ5OAeGrq5RG1ndFEcZVFSLhc68eg7T5KlFha
        BYTB1cEjzD2fhIT955SAuPllGiE8N1bRY17klL2aRzZUNwCySuPmk1ZjMUreGaoD5IthDUqW
        tRgB6bEGnMXixUdTqMz0PEodFntJnFb9+gOS3RxydfGbAdWAuiAdEGEQj4JW87RQB8SYFK8H
        cKXehHLDHIDGMg+fGzwAVo/OoFsWzZoN4RZ1AC6PVPC3LY52LZ9VoXg41M3q1h0Y5oPnwCf9
        3qwGwad48OXfBzxWI8PPwP7vywiL+XgQHG8cE7JYgsfA7o/DCJcWCE2Wrg0swmPhhLsLsBdB
        3CiEc9Mtm6KTUDtn2awngzOOFiGH98C19hoeZygEcGLALOSGEgAHrxsAp4qGowNLG1URfD9s
        soVx9HHoqvkNWBri3nBodhdLI+uwok2PcLQEFmmlnHofrHQ0bsfa377brEbCsrXPgHug2wDe
        m3yMloPAyv9htQAYgS+Vy9CpFBOpoq6EMkqayVWlhiZn0Vaw/necq47556Bj5XI3wDEg95L0
        T9IKqUCZx+TT3QBiiNxHcuKNM0kqSVHmF1DqLIU6N5NiuoE/xpf7SiIfTidK8VRlDpVBUdmU
        emvLw0R+GpAc5WwmMsRVCXuLaoNm4idNP4CpVB/7J85X8TW7VBYhn+0sml/TT1081Tvv3B1V
        spD2foEO1o/GHi4QxchPJ9ATiRfKFa1U3/klLTpyLr5NcI3sOLhjZ7A7z6brifzlsefpjjy7
        a64p1MaN2YUyZP7WqySPeLxxxekvCIjIl/OZNGX4AUTNKP8B5XKVDzcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e/4Xd2Lv3LjDdqmSFpsnLGe1WLl6qNM
        Fgv2W1t0zt7AbnH+PJC4vGsOm0XPhq2sFjPO72OyWHvkLrvFwQ9PWC3an75ktvjc+o/Ngcfj
        ycF5TB5r5q1h9JjdcJHFY9OqTjaPyTeWM3rsvtnA5tG3ZRWjx+dNcgEcUXo2RfmlJakKGfnF
        JbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ8w5fYy7YqFvx88UMtgbG
        5apdjJwcEgImEg3/dzF3MXJxCAksZZSYvP8TG0RCRuLktAZWCFtY4s+1LjaIok+MEt97r7KD
        JNgEDCW63naBNYgIlEl0XNkKNolZ4A2TxN1XP8CKhAW8JU68/s0MYrMIqErcX3cPLM4rYCtx
        6PpNZogN8hKrNxwAszkF7CQeXjzA2MXIAbTNVmL/Q6cJjHwLGBlWMYqklhbnpucWG+oVJ+YW
        l+al6yXn525iBMbAtmM/N+9gvLQx+BCjAAejEg/viUe58UKsiWXFlbmHGCU4mJVEeJ3Ono4T
        4k1JrKxKLcqPLyrNSS0+xGgKdNNEZinR5HxgfOaVxBuaGppbWBqaG5sbm1koifN2CByMERJI
        TyxJzU5NLUgtgulj4uCUamBUyvgiIPtlyUv+yw0mXCd8J/nnv7NR9L1W8VVWVPV7d0/1iZ6P
        Wkwi+tfmftn4ud6G2zN1VwozO9M60QmhmcER5ctNJOJ3z/yeHN0re2eN/7sPLvFaLU1zuf6c
        j6lddOFpHdNx8UNPThQ9T+la5S0RITzjodnt/G0rfmux2Riv9DrGXMwoa6LEUpyRaKjFXFSc
        CAAJRGSXlwIAAA==
X-CMS-MailID: 20200925141233eucas1p2148ace93f157bd631edd8db4e8df664b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141233eucas1p2148ace93f157bd631edd8db4e8df664b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141233eucas1p2148ace93f157bd631edd8db4e8df664b
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141233eucas1p2148ace93f157bd631edd8db4e8df664b@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for the DMA_ATTR_LOW_ADDRESS DMA attribute. If it has
been set, call alloc_iova_first_fit() instead of the alloc_iova_fast() to
allocate the new IOVA from the beginning of the address space.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/dma-iommu.c | 50 +++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0ea87023306f..ab39659c727a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -401,6 +401,18 @@ static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
 }
 
 #define DMA_ALLOC_IOVA_COHERENT		BIT(0)
+#define DMA_ALLOC_IOVA_FIRST_FIT	BIT(1)
+
+static unsigned int dma_attrs_to_alloc_flags(unsigned long attrs, bool coherent)
+{
+	unsigned int flags = 0;
+
+	if (coherent)
+		flags |= DMA_ALLOC_IOVA_COHERENT;
+	if (attrs & DMA_ATTR_LOW_ADDRESS)
+		flags |= DMA_ALLOC_IOVA_FIRST_FIT;
+	return flags;
+}
 
 static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 		struct device *dev, size_t size, unsigned int flags)
@@ -433,13 +445,23 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 		dma_limit = min(dma_limit, (u64)domain->geometry.aperture_end);
 
 	/* Try to get PCI devices a SAC address */
-	if (dma_limit > DMA_BIT_MASK(32) && dev_is_pci(dev))
-		iova = alloc_iova_fast(iovad, iova_len,
-				       DMA_BIT_MASK(32) >> shift, false);
+	if (dma_limit > DMA_BIT_MASK(32) && dev_is_pci(dev)) {
+		if (unlikely(flags & DMA_ALLOC_IOVA_FIRST_FIT))
+			iova = alloc_iova_first_fit(iovad, iova_len,
+						    DMA_BIT_MASK(32) >> shift);
+		else
+			iova = alloc_iova_fast(iovad, iova_len,
+					      DMA_BIT_MASK(32) >> shift, false);
+	}
 
-	if (iova == IOVA_BAD_ADDR)
-		iova = alloc_iova_fast(iovad, iova_len, dma_limit >> shift,
-				       true);
+	if (iova == IOVA_BAD_ADDR) {
+		if (unlikely(flags & DMA_ALLOC_IOVA_FIRST_FIT))
+			iova = alloc_iova_first_fit(iovad, iova_len,
+						    dma_limit >> shift);
+		else
+			iova = alloc_iova_fast(iovad, iova_len,
+					       dma_limit >> shift, true);
+	}
 
 	if (iova != IOVA_BAD_ADDR)
 		return (dma_addr_t)iova << shift;
@@ -593,6 +615,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	struct iova_domain *iovad = &cookie->iovad;
 	bool coherent = dev_is_dma_coherent(dev);
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
+	unsigned int flags = dma_attrs_to_alloc_flags(attrs, true);
 	pgprot_t prot = dma_pgprot(dev, PAGE_KERNEL, attrs);
 	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
 	struct page **pages;
@@ -622,7 +645,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 		return NULL;
 
 	size = iova_align(iovad, size);
-	iova = iommu_dma_alloc_iova(domain, dev, size, DMA_ALLOC_IOVA_COHERENT);
+	iova = iommu_dma_alloc_iova(domain, dev, size, flags);
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_pages;
 
@@ -732,12 +755,13 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
+	unsigned int flags = dma_attrs_to_alloc_flags(attrs, false);
 	phys_addr_t phys = page_to_phys(page) + offset;
 	bool coherent = dev_is_dma_coherent(dev);
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle = __iommu_dma_map(dev, phys, size, prot, 0);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot, flags);
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(phys, size, dir);
@@ -842,6 +866,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	struct iova_domain *iovad = &cookie->iovad;
 	struct scatterlist *s, *prev = NULL;
 	int prot = dma_info_to_prot(dir, dev_is_dma_coherent(dev), attrs);
+	unsigned int flags = dma_attrs_to_alloc_flags(attrs, false);
 	dma_addr_t iova;
 	size_t iova_len = 0;
 	unsigned long mask = dma_get_seg_boundary(dev);
@@ -892,7 +917,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		prev = s;
 	}
 
-	iova = iommu_dma_alloc_iova(domain, dev, iova_len, 0);
+	iova = iommu_dma_alloc_iova(domain, dev, iova_len, flags);
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_restore_sg;
 
@@ -940,7 +965,8 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return __iommu_dma_map(dev, phys, size,
-			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO, 0);
+		       dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
+		       dma_attrs_to_alloc_flags(attrs, false));
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1027,6 +1053,7 @@ static void *iommu_dma_alloc_pages(struct device *dev, size_t size,
 static void *iommu_dma_alloc(struct device *dev, size_t size,
 		dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 {
+	unsigned int flags = dma_attrs_to_alloc_flags(attrs, true);
 	bool coherent = dev_is_dma_coherent(dev);
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
 	struct page *page = NULL;
@@ -1047,8 +1074,7 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (!cpu_addr)
 		return NULL;
 
-	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
-				  DMA_ALLOC_IOVA_COHERENT);
+	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot, flags);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
 		return NULL;
-- 
2.17.1

