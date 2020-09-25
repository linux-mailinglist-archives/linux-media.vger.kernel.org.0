Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F1A278A9E
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgIYOND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:13:03 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48839 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgIYOMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:35 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141233euoutp02b877973d9f2b39105d73ef8fe7cec793~4DEP4ZpBB0695406954euoutp02J
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200925141233euoutp02b877973d9f2b39105d73ef8fe7cec793~4DEP4ZpBB0695406954euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043153;
        bh=CdqxAOIxfFbS+SUmvI9y9pxawzs7pibWdyiVOgUzy44=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U1eh95Xo0IXUT4vH5UNGl9qY2QbhBPiswrAdbhxzq5Y1EdlskZCtywIfLbJCYXb8k
         IHqGaWsRgWb6izX+BRogjF51SO0qotZ++NRYFRbNshnWjpIFyBbD+6voS3hcSC61HQ
         Iw56RcDFc/1c27I0rAwKZiB/5vQvE5S2moYrcXno=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200925141233eucas1p1ea15e4e9e9dc217a0257d962397cd31f~4DEPkZV7w1932619326eucas1p1n;
        Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 2B.49.05997.1DAFD6F5; Fri, 25
        Sep 2020 15:12:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200925141232eucas1p29ad64ca3bc90bb3cbfad9b385cb3d9ef~4DEPTB0xY3045930459eucas1p2w;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200925141232eusmtrp26b8e39ba356de1a7832b24065c9fb758~4DEPSbuBN2598725987eusmtrp2k;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-00-5f6dfad1cfdf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.49.06314.0DAFD6F5; Fri, 25
        Sep 2020 15:12:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141232eusmtip1014f8a7f5e189693cabe32aee4a21a5a~4DEOtvhWP1229912299eusmtip1z;
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
Subject: [PATCH 4/8] iommu: dma-iommu: refactor iommu_dma_alloc_iova()
Date:   Fri, 25 Sep 2020 16:12:14 +0200
Message-Id: <20200925141218.13550-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87oXf+XGG+xZzW2xccZ6VouVq48y
        WSzYb23ROXsDu8X580Di8q45bBY9G7ayWsw4v4/JYu2Ru+wWBz88YbVof/qS2eJz6z82Bx6P
        JwfnMXmsmbeG0WN2w0UWj02rOtk8Jt9Yzuix+2YDm0ffllWMHp83yQVwRHHZpKTmZJalFunb
        JXBlPL6sVrBCqWLlfvUGxp0yXYycHBICJhKH909m7mLk4hASWMEosXf5F1YI5wujxP6LqxlB
        qoQEPjNK9B61hel4cGcFC0TRckaJA5vWs0MUAXU0HGcFsdkEDCW63naxdTFycIgIlEgsO8EH
        Us8s8IRJYs/fhUwgNcICbhLHvswFs1kEVCWWnbnIDGLzCthK9Lw6wQyxTF5i9YYDYDangJ3E
        w4sHGEEGSQisYpdYNX0pI0SRi8SVPzPYIGxhiVfHt7BD2DIS/3fOZ4JoaGaUeHhuLTuE08Mo
        cblpBlS3tcSdc7/ATmUW0JRYv0sfIuwoceX5I7CwhACfxI23giBhZiBz0rbpzBBhXomONiGI
        ajWJWcfXwa09eOES1P0eEu9+ToGG6ERGiVW3/rFMYJSfhbBsASPjKkbx1NLi3PTUYqO81HK9
        4sTc4tK8dL3k/NxNjMB0c/rf8S87GHf9STrEKMDBqMTDq/A0N16INbGsuDL3EKMEB7OSCK/T
        2dNxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTCqbn3q
        +/2MDtfWFn0NKaZZDOclf1bmHqyI3HD9ROa7bWL7Zpq81dsVe3nuwpMLHKZeSFb89cz3tu/l
        K0m6qs5ienqbWFKtnu7fJBWyNeTVHC+FssPSvnJMhy57ztv+yLzUJUO0/vTv02w1CmtEhBf0
        2/Deu6xfaFSofO/kpQJOt1n5i2NmTRBVYinOSDTUYi4qTgQACRdfZTMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42I5/e/4Xd0Lv3LjDU5uMrfYOGM9q8XK1UeZ
        LBbst7bonL2B3eL8eSBxedccNoueDVtZLWac38dksfbIXXaLgx+esFq0P33JbPG59R+bA4/H
        k4PzmDzWzFvD6DG74SKLx6ZVnWwek28sZ/TYfbOBzaNvyypGj8+b5AI4ovRsivJLS1IVMvKL
        S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyHl9WK1ihVLFyv3oD406Z
        LkZODgkBE4kHd1awdDFycQgJLGWU6H5wiBUiISNxcloDlC0s8edaFxtE0SdGiQ2vPzCBJNgE
        DCW63oIkODlEBMokOq5sZQYpYhZ4wyRx99UPdpCEsICbxLEvc8EaWARUJZaducgMYvMK2Er0
        vDrBDLFBXmL1hgNgNqeAncTDiwcYuxg5gLbZSux/6DSBkW8BI8MqRpHU0uLc9NxiQ73ixNzi
        0rx0veT83E2MwPDfduzn5h2MlzYGH2IU4GBU4uE98Sg3Xog1say4MvcQowQHs5IIr9PZ03FC
        vCmJlVWpRfnxRaU5qcWHGE2BbprILCWanA+MzbySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLp
        iSWp2ampBalFMH1MHJxSDYx1Z4ziI5KPPxKv1y/a071h++vsbZa5xteup89+W7lu/XcXU67n
        IV9+7ToxU/hA2z35Q54CnBac9k7SBybae67Xl3wd2vamTU+0bNqTvrWbV/44GMEt+c3d/ESR
        6Lf3mgcWfn66nn/xZL125ocXP4VcYAhksGdZrsRz/N3fD0orOQ59LF6yg9tAiaU4I9FQi7mo
        OBEAi3X12ZUCAAA=
X-CMS-MailID: 20200925141232eucas1p29ad64ca3bc90bb3cbfad9b385cb3d9ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141232eucas1p29ad64ca3bc90bb3cbfad9b385cb3d9ef
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141232eucas1p29ad64ca3bc90bb3cbfad9b385cb3d9ef
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141232eucas1p29ad64ca3bc90bb3cbfad9b385cb3d9ef@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the parameters passed to iommu_dma_alloc_iova(): the dma_limit can
be easily extracted from the parameters of the passed struct device, so
replace it with a flags parameter, which can later hold more information
about the way the IOVA allocator should do it job. While touching the
parameter list, move struct device to the second position to better match
the convention of the DMA-mapping related functions.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/dma-iommu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 91dd8f46dae1..0ea87023306f 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -400,12 +400,16 @@ static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
 	}
 }
 
+#define DMA_ALLOC_IOVA_COHERENT		BIT(0)
+
 static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
-		size_t size, u64 dma_limit, struct device *dev)
+		struct device *dev, size_t size, unsigned int flags)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	unsigned long shift, iova_len, iova = IOVA_BAD_ADDR;
+	u64 dma_limit = (flags & DMA_ALLOC_IOVA_COHERENT) ?
+			dev->coherent_dma_mask : dma_get_mask(dev);
 
 	if (cookie->type == IOMMU_DMA_MSI_COOKIE) {
 		cookie->msi_iova += size;
@@ -481,7 +485,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot, u64 dma_mask)
+		size_t size, int prot, unsigned int flags)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -494,7 +498,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 
 	size = iova_align(iovad, size + iova_off);
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
+	iova = iommu_dma_alloc_iova(domain, dev, size, flags);
 	if (iova == DMA_MAPPING_ERROR)
 		return iova;
 
@@ -618,7 +622,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 		return NULL;
 
 	size = iova_align(iovad, size);
-	iova = iommu_dma_alloc_iova(domain, size, dev->coherent_dma_mask, dev);
+	iova = iommu_dma_alloc_iova(domain, dev, size, DMA_ALLOC_IOVA_COHERENT);
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_pages;
 
@@ -733,7 +737,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle = __iommu_dma_map(dev, phys, size, prot, dma_get_mask(dev));
+	dma_handle = __iommu_dma_map(dev, phys, size, prot, 0);
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(phys, size, dir);
@@ -888,7 +892,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		prev = s;
 	}
 
-	iova = iommu_dma_alloc_iova(domain, iova_len, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, dev, iova_len, 0);
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_restore_sg;
 
@@ -936,8 +940,7 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return __iommu_dma_map(dev, phys, size,
-			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
-			dma_get_mask(dev));
+			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO, 0);
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1045,7 +1048,7 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 		return NULL;
 
 	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
-			dev->coherent_dma_mask);
+				  DMA_ALLOC_IOVA_COHERENT);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
 		return NULL;
@@ -1182,7 +1185,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!msi_page)
 		return NULL;
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, dev, size, 0);
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_page;
 
-- 
2.17.1

