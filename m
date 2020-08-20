Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF1A24C1C6
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgHTPMm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:12:42 -0400
Received: from foss.arm.com ([217.140.110.172]:40830 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728615AbgHTPJK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:09:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09BE1106F;
        Thu, 20 Aug 2020 08:09:09 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C78F3F6CF;
        Thu, 20 Aug 2020 08:09:05 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     hch@lst.de, joro@8bytes.org, linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        digetx@gmail.com, matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/18] iommu/dma: Add temporary hacks for arch/arm
Date:   Thu, 20 Aug 2020 16:08:23 +0100
Message-Id: <dd49f2e7873820fd215165d9facd523d0c1f5d11.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to wrangle arch/arm over to iommu_dma_ops, we first need to
convert all its associated IOMMU drivers over to default domains, and
deal with users of its public dma_iommu_mappinng API. Since that can't
reasonably be done in a single patch, we've no choice but to go through
an ugly transitional phase. That starts with exposing some hooks into
iommu-dma's internals so that it can start to do most of the heavy
lifting.

Before you start thinking about how horrible that is, here's a zebra:
  ,
 c@
  `||||)\
   <  /

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4959f5df21bd..ab157d155bf7 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -25,6 +25,19 @@
 #include <linux/vmalloc.h>
 #include <linux/crash_dump.h>
 
+#ifdef CONFIG_ARM
+#include <asm/dma-iommu.h>
+#endif
+static struct iommu_domain *__iommu_get_dma_domain(struct device *dev)
+{
+#ifdef CONFIG_ARM
+	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+	if (mapping)
+		return mapping->domain;
+#endif
+	return iommu_get_dma_domain(dev);
+}
+
 struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
@@ -298,8 +311,11 @@ static void iommu_dma_flush_iotlb_all(struct iova_domain *iovad)
  * avoid rounding surprises. If necessary, we reserve the page at address 0
  * to ensure it is an invalid IOVA. It is safe to reinitialise a domain, but
  * any change which could make prior IOVAs invalid will fail.
+ *
+ * XXX: Not formally exported, but needs to be referenced
+ * from arch/arm/mm/dma-mapping.c temporarily
  */
-static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
+int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 		u64 size, struct device *dev)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -456,7 +472,7 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 		size_t size)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, dma_addr);
@@ -478,7 +494,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		size_t size, int prot, u64 dma_mask)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, phys);
@@ -582,7 +598,7 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	bool coherent = dev_is_dma_coherent(dev);
@@ -678,7 +694,7 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
 	if (dev_is_dma_coherent(dev))
 		return;
 
-	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
+	phys = iommu_iova_to_phys(__iommu_get_dma_domain(dev), dma_handle);
 	arch_sync_dma_for_cpu(phys, size, dir);
 }
 
@@ -690,7 +706,7 @@ static void iommu_dma_sync_single_for_device(struct device *dev,
 	if (dev_is_dma_coherent(dev))
 		return;
 
-	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
+	phys = iommu_iova_to_phys(__iommu_get_dma_domain(dev), dma_handle);
 	arch_sync_dma_for_device(phys, size, dir);
 }
 
@@ -831,7 +847,7 @@ static void __invalidate_sg(struct scatterlist *sg, int nents)
 static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		int nents, enum dma_data_direction dir, unsigned long attrs)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	struct scatterlist *s, *prev = NULL;
@@ -1112,12 +1128,16 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 
 static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
 {
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
 
 	return (1UL << __ffs(domain->pgsize_bitmap)) - 1;
 }
 
-static const struct dma_map_ops iommu_dma_ops = {
+/*
+ * XXX: Not formally exported, but needs to be referenced
+ * from arch/arm/mm/dma-mapping.c temporarily
+ */
+const struct dma_map_ops iommu_dma_ops = {
 	.alloc			= iommu_dma_alloc,
 	.free			= iommu_dma_free,
 	.mmap			= iommu_dma_mmap,
-- 
2.28.0.dirty

