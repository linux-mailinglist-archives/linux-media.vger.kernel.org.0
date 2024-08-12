Return-Path: <linux-media+bounces-16106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 188FB94E761
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD331F21153
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E700B146D69;
	Mon, 12 Aug 2024 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nbb8pBVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0E814A4E0;
	Mon, 12 Aug 2024 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446341; cv=none; b=u2w5G9z0TEY51T2nfvPTxLXwX046raOLVt34iXl/9rwCPlTBXNyhoeWNfF2PuvrTXo9jEsKC6upr849Sbx5mf4vKkhE8FSuBAJThN6lry2ytJ2+wEqVzbM3oHpyy/a8JF9y+Fu4ggY/M/kadsrk6cSCMpuAU+d1v9o5NvQfNEkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446341; c=relaxed/simple;
	bh=WgsPJfKYoBM5/FyefGOup8BUMNN6EtYkaG2orI4v+0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NOtnZHdJHmM3VGm3jj/sHZtq+57diheet2WjnkxBL0Fc8eE52ES0kDYIyfDMvrPbqKN/CvNej7lGGJFKgWzPn89jsCWwx8STe9YtDdKNRMmi+xnNTegldNZbZ7oUoowe2yUWc5v60fMpjcvU32rhpiY9hL/vnOtH2OkLeMw37TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nbb8pBVZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723446340; x=1754982340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WgsPJfKYoBM5/FyefGOup8BUMNN6EtYkaG2orI4v+0g=;
  b=Nbb8pBVZW9J0Ee5gOt3NJRv6nQxeRxbuhhl4Sf/IpjABUgV3rKtgEGe6
   eraiSH28NT4GxAFvNx4cyVYxl7GB8Am6Bn5AnpQzv3k5yit0QHSmM9wR6
   Khz8+ehX6wS6vSYjy9IDZkZU/7mFV7a6CkUzMraxq6MRYOYlO2FWlc9fL
   C5SZD1H0lvohS1EpMFtxDIX+wHEVy8hWRSAggNxCE4+8Vb1QIy0EesFHH
   5bcVOZTNLshdITrUsDEiNrYKNgeuzHopr9pfrl5B26u8I1fbDwm2sxjq3
   OI7uVVnBe//pvHOw6FpjMVPQ6fPzFM246irCag0zXs3dw2tjw7RoCQcNe
   A==;
X-CSE-ConnectionGUID: xQ1EV03lSYOW0M3TNcY0kQ==
X-CSE-MsgGUID: II4J99XJTRKnuOEAzrR2Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21418132"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21418132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:05:39 -0700
X-CSE-ConnectionGUID: 3zszVuoKQvCqlgyJJaAXEg==
X-CSE-MsgGUID: YJBYclSHTaKNj2MLGNZS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58070034"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2024 00:05:33 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 1/2] ARM: dma-mapping: Pass device to arm_iommu_create_mapping()
Date: Mon, 12 Aug 2024 15:02:01 +0800
Message-Id: <20240812070202.9366-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robin Murphy <robin.murphy@arm.com>

All users of ARM IOMMU mappings create them for a particular device, so
change the interface to accept the device rather than forcing a vague
indirection through a bus type. This prepares for making a similar
change to iommu_domain_alloc() itself.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20240610085555.88197-17-baolu.lu@linux.intel.com
---
 arch/arm/include/asm/dma-iommu.h         | 2 +-
 arch/arm/mm/dma-mapping.c                | 8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_dma.c  | 2 +-
 drivers/iommu/ipmmu-vmsa.c               | 3 +--
 drivers/iommu/mtk_iommu_v1.c             | 3 +--
 drivers/media/platform/ti/omap3isp/isp.c | 2 +-
 6 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/include/asm/dma-iommu.h b/arch/arm/include/asm/dma-iommu.h
index 82ec1ccf1fee..2ce4c5683e6d 100644
--- a/arch/arm/include/asm/dma-iommu.h
+++ b/arch/arm/include/asm/dma-iommu.h
@@ -24,7 +24,7 @@ struct dma_iommu_mapping {
 };
 
 struct dma_iommu_mapping *
-arm_iommu_create_mapping(const struct bus_type *bus, dma_addr_t base, u64 size);
+arm_iommu_create_mapping(struct device *dev, dma_addr_t base, u64 size);
 
 void arm_iommu_release_mapping(struct dma_iommu_mapping *mapping);
 
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 5adf1769eee4..52f9c56cc3cb 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1532,7 +1532,7 @@ static const struct dma_map_ops iommu_ops = {
 
 /**
  * arm_iommu_create_mapping
- * @bus: pointer to the bus holding the client device (for IOMMU calls)
+ * @dev: pointer to the client device (for IOMMU calls)
  * @base: start address of the valid IO address space
  * @size: maximum size of the valid IO address space
  *
@@ -1544,7 +1544,7 @@ static const struct dma_map_ops iommu_ops = {
  * arm_iommu_attach_device function.
  */
 struct dma_iommu_mapping *
-arm_iommu_create_mapping(const struct bus_type *bus, dma_addr_t base, u64 size)
+arm_iommu_create_mapping(struct device *dev, dma_addr_t base, u64 size)
 {
 	unsigned int bits = size >> PAGE_SHIFT;
 	unsigned int bitmap_size = BITS_TO_LONGS(bits) * sizeof(long);
@@ -1585,7 +1585,7 @@ arm_iommu_create_mapping(const struct bus_type *bus, dma_addr_t base, u64 size)
 
 	spin_lock_init(&mapping->lock);
 
-	mapping->domain = iommu_domain_alloc(bus);
+	mapping->domain = iommu_domain_alloc(dev->bus);
 	if (!mapping->domain)
 		goto err4;
 
@@ -1718,7 +1718,7 @@ static void arm_setup_iommu_dma_ops(struct device *dev)
 		dma_base = dma_range_map_min(dev->dma_range_map);
 		size = dma_range_map_max(dev->dma_range_map) - dma_base;
 	}
-	mapping = arm_iommu_create_mapping(dev->bus, dma_base, size);
+	mapping = arm_iommu_create_mapping(dev, dma_base, size);
 	if (IS_ERR(mapping)) {
 		pr_warn("Failed to create %llu-byte IOMMU mapping for device %s\n",
 				size, dev_name(dev));
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index e2c7373f20c6..6a6761935224 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -110,7 +110,7 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 		void *mapping = NULL;
 
 		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
-			mapping = arm_iommu_create_mapping(&platform_bus_type,
+			mapping = arm_iommu_create_mapping(dev,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 			mapping = iommu_get_domain_for_dev(priv->dma_dev);
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index b657cc09605f..ff55b8c30712 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -804,8 +804,7 @@ static int ipmmu_init_arm_mapping(struct device *dev)
 	if (!mmu->mapping) {
 		struct dma_iommu_mapping *mapping;
 
-		mapping = arm_iommu_create_mapping(&platform_bus_type,
-						   SZ_1G, SZ_2G);
+		mapping = arm_iommu_create_mapping(dev, SZ_1G, SZ_2G);
 		if (IS_ERR(mapping)) {
 			dev_err(mmu->dev, "failed to create ARM IOMMU mapping\n");
 			ret = PTR_ERR(mapping);
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index c6ea5b4baff3..ee4e55b6b190 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -433,8 +433,7 @@ static int mtk_iommu_v1_create_mapping(struct device *dev,
 	mtk_mapping = data->mapping;
 	if (!mtk_mapping) {
 		/* MTK iommu support 4GB iova address space. */
-		mtk_mapping = arm_iommu_create_mapping(&platform_bus_type,
-						0, 1ULL << 32);
+		mtk_mapping = arm_iommu_create_mapping(dev, 0, 1ULL << 32);
 		if (IS_ERR(mtk_mapping))
 			return PTR_ERR(mtk_mapping);
 
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 1cda23244c7b..91101ba88ef0 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -1965,7 +1965,7 @@ static int isp_attach_iommu(struct isp_device *isp)
 	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
 	 * VAs. This will allocate a corresponding IOMMU domain.
 	 */
-	mapping = arm_iommu_create_mapping(&platform_bus_type, SZ_1G, SZ_2G);
+	mapping = arm_iommu_create_mapping(isp->dev, SZ_1G, SZ_2G);
 	if (IS_ERR(mapping)) {
 		dev_err(isp->dev, "failed to create ARM IOMMU mapping\n");
 		return PTR_ERR(mapping);
-- 
2.34.1


