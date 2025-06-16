Return-Path: <linux-media+bounces-34948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F3ADB495
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 325D23B0873
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66193215773;
	Mon, 16 Jun 2025 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PmpZRqHr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E472BEFEB;
	Mon, 16 Jun 2025 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085785; cv=none; b=Nc8Kcs58d4AAK6D2cLRFtu/DRVZHLspQemMkFL4U/0/hYeZmwpk0X+BexzOJecx5avVrSaowO1TnDChjImNYerGdmUdvBIgAnRN+GERFKUUCZY/idnFwi9seEq7HJm/KYtqjgKmRIswCaeveJbhIrrI49yiUtcz1oVoIJHGbndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085785; c=relaxed/simple;
	bh=2kriy99/o8T2lAG2k7Rp5DjK+2Hd80bjmmVahtRtZ/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QC/52swRSg6nAbHC3UPlPnGVUg96pZQcbsuJYzd+dTXS1Q4Vjo6st1U3CUUpomxilpQCW93ZC/DnazDdo31yIXo6hFvZGbgquWpca9D2XDErFXcHbgP1VyI3+LxPAdv7i+xy4bKQqpE2fooABG5ElCFcF2TrSeW+mK23lbKpAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PmpZRqHr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750085775;
	bh=2kriy99/o8T2lAG2k7Rp5DjK+2Hd80bjmmVahtRtZ/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PmpZRqHrujq8LAubOmpSK/O/1e7UAzqfwVO+2w2EM8qHgUlnuJgDTd13CYcgM19b+
	 geO0LKVRHI25d6vf6FNvqiog5XoNIGGZMW/q6ZZDB7QCJQDxwSuYWhOikWOM2pFLm9
	 4cvX/LNnpU2+9wEBk7ZTNMGrNGdoiNsJy4RzTyhMQG84vDPdjLjDC3Qn012WO2+agw
	 SL2Z9bFW5JGQg1mK4QMCXWYT4tOIP6tT66gLmw1BVJPnPQIRGS7e0NItEGGjuUJ+Ms
	 OH2lkCsjiONnXz/vxQoU03esAulfoQqgxGfqhtgQDxJcMRMUEinNwV1hnEKqqacX5l
	 Q8u2lF+1QAgjA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4811:e81c:4b33:730c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B31F17E156E;
	Mon, 16 Jun 2025 16:56:14 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
Date: Mon, 16 Jun 2025 16:55:51 +0200
Message-ID: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verisilicon IOMMU hardware block can be found in combination
with hardware video codecs (encoders or decoders) on
different SoCs.
Enable it will allows to use non contiguous memory
allocators for Verisilicon video codecs.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/iommu/Kconfig     |   8 +
 drivers/iommu/Makefile    |   1 +
 drivers/iommu/vsi-iommu.c | 900 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 909 insertions(+)
 create mode 100644 drivers/iommu/vsi-iommu.c

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0a33d995d15d..4cf4504dcc25 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -383,4 +383,12 @@ config SPRD_IOMMU
 
 	  Say Y here if you want to use the multimedia devices listed above.
 
+config VSI_IOMMU
+	bool "Verisilicon IOMMU Support"
+	depends on ARM64
+	select IOMMU_API
+	select ARM_DMA_USE_IOMMU
+	help
+	  Support for IOMMUs used by Verisilicon video decoders.
+
 endif # IOMMU_SUPPORT
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 355294fa9033..68aeff31af8b 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -34,3 +34,4 @@ obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
 obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
 obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
 obj-$(CONFIG_APPLE_DART) += apple-dart.o
+obj-$(CONFIG_VSI_IOMMU) += vsi-iommu.o
diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
new file mode 100644
index 000000000000..f2fa1197916c
--- /dev/null
+++ b/drivers/iommu/vsi-iommu.c
@@ -0,0 +1,900 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/clk.h>
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_iommu.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include "iommu-pages.h"
+
+struct vsi_iommu_domain {
+	struct list_head iommus;
+	u32 *dt; /* page directory table */
+	dma_addr_t dt_dma;
+	spinlock_t iommus_lock; /* lock for iommus list */
+	spinlock_t dt_lock; /* lock for modifying page directory table */
+	struct iommu_domain domain;
+	/* for vsi iommu */
+	u64 *pta; /* page directory table */
+	dma_addr_t pta_dma;
+};
+
+struct vsi_iommu {
+	struct device *dev;
+	void __iomem **bases;
+	int num_mmu;
+	int num_irq;
+	struct clk_bulk_data *clocks;
+	int num_clocks;
+	struct iommu_device iommu;
+	struct list_head node; /* entry in vsi_iommu_domain.iommus */
+	struct iommu_domain *domain; /* domain to which iommu is attached */
+	struct iommu_group *group;
+};
+
+struct vsi_iommudata {
+	struct device_link *link; /* runtime PM link from IOMMU to master */
+	struct vsi_iommu *iommu;
+	bool defer_attach;
+};
+
+#define NUM_DT_ENTRIES	1024
+#define NUM_PT_ENTRIES	1024
+
+#define SPAGE_SIZE	BIT(12)
+
+/* vsi iommu regs address */
+#define VSI_MMU_CONFIG1_BASE			0x1ac
+#define VSI_MMU_AHB_EXCEPTION_BASE		0x380
+#define VSI_MMU_AHB_CONTROL_BASE		0x388
+#define VSI_MMU_AHB_TBL_ARRAY_BASE_L_BASE	0x38C
+
+/* MMU register offsets */
+#define VSI_MMU_FLUSH_BASE		0x184
+#define VSI_MMU_BIT_FLUSH		BIT(4)
+
+#define VSI_MMU_PAGE_FAULT_ADDR		0x380
+#define VSI_MMU_STATUS_BASE		0x384	/* IRQ status */
+
+#define VSI_MMU_BIT_ENABLE		BIT(0)
+
+#define VSI_MMU_OUT_OF_BOUND		BIT(28)
+/* Irq mask */
+#define VSI_MMU_IRQ_MASK		0x7
+
+#define VSI_DTE_PT_ADDRESS_MASK		0xffffffc0
+#define VSI_DTE_PT_VALID		BIT(0)
+
+#define VSI_PAGE_DESC_LO_MASK		0xfffff000
+#define VSI_PAGE_DESC_HI_MASK		GENMASK_ULL(39, 32)
+#define VSI_PAGE_DESC_HI_SHIFT		(32 - 4)
+
+#define VSI_IOMMU_PGSIZE_BITMAP 0x007ff000
+
+static inline phys_addr_t vsi_dte_pt_address(u32 dte)
+{
+	return (phys_addr_t)dte & VSI_DTE_PT_ADDRESS_MASK;
+}
+
+static inline u32 vsi_mk_dte(dma_addr_t pt_dma)
+{
+	return (pt_dma) | VSI_DTE_PT_VALID;
+}
+
+#define VSI_PTE_PAGE_ADDRESS_MASK	0xfffffff0
+#define VSI_PTE_PAGE_WRITABLE		BIT(2)
+#define VSI_PTE_PAGE_VALID		BIT(0)
+
+static struct device *dma_dev;
+
+static inline phys_addr_t vsi_pte_page_address(u32 pte)
+{
+	u64 pte_vsi = pte;
+
+	pte_vsi = ((pte_vsi & VSI_PAGE_DESC_HI_MASK) << VSI_PAGE_DESC_HI_SHIFT) |
+		  (pte_vsi & VSI_PAGE_DESC_LO_MASK);
+
+	return (phys_addr_t)pte_vsi;
+}
+
+static u32 vsi_mk_pte(phys_addr_t page, int prot)
+{
+	u32 flags = 0;
+
+	flags |= (prot & IOMMU_WRITE) ? VSI_PTE_PAGE_WRITABLE : 0;
+	page = (page & VSI_PAGE_DESC_LO_MASK) |
+	       ((page & VSI_PAGE_DESC_HI_MASK) >> VSI_PAGE_DESC_HI_SHIFT);
+	page &= VSI_PTE_PAGE_ADDRESS_MASK;
+
+	return page | flags | VSI_PTE_PAGE_VALID;
+}
+
+#define VSI_DTE_PT_VALID	BIT(0)
+
+static inline bool vsi_dte_is_pt_valid(u32 dte)
+{
+	return dte & VSI_DTE_PT_VALID;
+}
+
+static inline bool vsi_pte_is_page_valid(u32 pte)
+{
+	return pte & VSI_PTE_PAGE_VALID;
+}
+
+static u32 vsi_mk_pte_invalid(u32 pte)
+{
+	return pte & ~VSI_PTE_PAGE_VALID;
+}
+
+#define VSI_MASTER_TLB_MASK	GENMASK_ULL(31, 10)
+/* mode 0 : 4k */
+#define VSI_PTA_4K_MODE	0
+
+static struct vsi_iommu *vsi_iommu_from_dev(struct device *dev)
+{
+	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
+
+	return data ? data->iommu : NULL;
+}
+
+static u64 vsi_mk_pta(dma_addr_t dt_dma)
+{
+	u64 val = (dt_dma & VSI_MASTER_TLB_MASK) | VSI_PTA_4K_MODE;
+
+	return val;
+}
+
+static struct vsi_iommu_domain *to_vsi_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct vsi_iommu_domain, domain);
+}
+
+static void vsi_iommu_disable(struct vsi_iommu *iommu)
+{
+	int i;
+
+	/* Ignore error while disabling, just keep going */
+	WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks));
+	for (i = 0; i < iommu->num_mmu; i++)
+		writel(0, iommu->bases[i] + VSI_MMU_AHB_CONTROL_BASE);
+
+	clk_bulk_disable(iommu->num_clocks, iommu->clocks);
+}
+
+static int vsi_iommu_enable(struct vsi_iommu *iommu)
+{
+	struct iommu_domain *domain = iommu->domain;
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	int ret, i;
+
+	ret = clk_bulk_enable(iommu->num_clocks, iommu->clocks);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < iommu->num_mmu; i++) {
+		u32 val = readl(iommu->bases[i] + VSI_MMU_AHB_CONTROL_BASE);
+
+		if (!(val & VSI_MMU_BIT_ENABLE)) {
+			writel(vsi_domain->pta_dma,
+			       iommu->bases[i] + VSI_MMU_AHB_TBL_ARRAY_BASE_L_BASE);
+			writel(VSI_MMU_OUT_OF_BOUND, iommu->bases[i] + VSI_MMU_CONFIG1_BASE);
+			writel(VSI_MMU_BIT_ENABLE, iommu->bases[i] + VSI_MMU_AHB_EXCEPTION_BASE);
+			writel(VSI_MMU_BIT_ENABLE, iommu->bases[i] + VSI_MMU_AHB_CONTROL_BASE);
+		}
+	}
+	clk_bulk_disable(iommu->num_clocks, iommu->clocks);
+
+	return ret;
+}
+
+static inline void vsi_table_flush(struct vsi_iommu_domain *dom, dma_addr_t dma,
+				   unsigned int count)
+{
+	size_t size = count * sizeof(u32); /* count of u32 entry */
+
+	dma_sync_single_for_device(dma_dev, dma, size, DMA_TO_DEVICE);
+}
+
+#define VSI_IOVA_DTE_MASK	0xffc00000
+#define VSI_IOVA_DTE_SHIFT	22
+#define VSI_IOVA_PTE_MASK	0x003ff000
+#define VSI_IOVA_PTE_SHIFT	12
+#define VSI_IOVA_PAGE_MASK	0x00000fff
+#define VSI_IOVA_PAGE_SHIFT	0
+
+static u32 vsi_iova_dte_index(dma_addr_t iova)
+{
+	return (u32)(iova & VSI_IOVA_DTE_MASK) >> VSI_IOVA_DTE_SHIFT;
+}
+
+static u32 vsi_iova_pte_index(dma_addr_t iova)
+{
+	return (u32)(iova & VSI_IOVA_PTE_MASK) >> VSI_IOVA_PTE_SHIFT;
+}
+
+static u32 vsi_iova_page_offset(dma_addr_t iova)
+{
+	return (u32)(iova & VSI_IOVA_PAGE_MASK) >> VSI_IOVA_PAGE_SHIFT;
+}
+
+static u32 vsi_iommu_read(void __iomem *base, u32 offset)
+{
+	return readl(base + offset);
+}
+
+static void vsi_iommu_write(void __iomem *base, u32 offset, u32 value)
+{
+	writel(value, base + offset);
+}
+
+static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
+{
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	struct list_head *pos;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
+	list_for_each(pos, &vsi_domain->iommus) {
+		struct vsi_iommu *iommu;
+		int ret;
+
+		iommu = list_entry(pos, struct vsi_iommu, node);
+		ret = pm_runtime_get_if_in_use(iommu->dev);
+		if (WARN_ON_ONCE(ret < 0))
+			continue;
+		if (ret) {
+			WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks));
+			for (i = 0; i < iommu->num_mmu; i++) {
+				writel(VSI_MMU_BIT_FLUSH,
+				       iommu->bases[i] + VSI_MMU_FLUSH_BASE);
+				writel(0, iommu->bases[i] + VSI_MMU_FLUSH_BASE);
+			}
+			clk_bulk_disable(iommu->num_clocks, iommu->clocks);
+			pm_runtime_put(iommu->dev);
+		}
+	}
+	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);
+}
+
+static irqreturn_t vsi_iommu_irq(int irq, void *dev_id)
+{
+	struct vsi_iommu *iommu = dev_id;
+	u32 int_status;
+	dma_addr_t iova;
+	irqreturn_t ret = IRQ_NONE;
+	int i, err;
+
+	err = pm_runtime_get_if_in_use(iommu->dev);
+	if (!err || WARN_ON_ONCE(err < 0))
+		return ret;
+
+	if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks)))
+		goto out;
+
+	for (i = 0; i < iommu->num_mmu; i++) {
+		int_status = vsi_iommu_read(iommu->bases[i], VSI_MMU_STATUS_BASE);
+		if (int_status & VSI_MMU_IRQ_MASK) {
+			dev_err(iommu->dev, "unexpected int_status=%08x\n", int_status);
+			iova = vsi_iommu_read(iommu->bases[i], VSI_MMU_PAGE_FAULT_ADDR);
+
+			if (iommu->domain)
+				report_iommu_fault(iommu->domain, iommu->dev, iova, int_status);
+			else
+				dev_err(iommu->dev,
+					"Page fault while iommu not attached to domain?\n");
+		}
+		vsi_iommu_write(iommu->bases[i], VSI_MMU_STATUS_BASE, 0);
+		ret = IRQ_HANDLED;
+	}
+
+	clk_bulk_disable(iommu->num_clocks, iommu->clocks);
+
+out:
+	pm_runtime_put(iommu->dev);
+	return ret;
+}
+
+static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
+{
+	struct vsi_iommu_domain *vsi_domain;
+
+	if (!dma_dev)
+		return NULL;
+
+	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
+	if (!vsi_domain)
+		return NULL;
+
+	/*
+	 * iommu use a 2 level pagetable.
+	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
+	 * Allocate one 4 KiB page for each table.
+	 */
+	vsi_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
+					      SPAGE_SIZE);
+	if (!vsi_domain->dt)
+		goto err_free_domain;
+
+	vsi_domain->dt_dma = dma_map_single(dma_dev, vsi_domain->dt,
+					    SPAGE_SIZE, DMA_TO_DEVICE);
+	if (dma_mapping_error(dma_dev, vsi_domain->dt_dma)) {
+		dev_err(dma_dev, "DMA map error for DT\n");
+		goto err_free_dt;
+	}
+
+	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
+					       SPAGE_SIZE);
+	if (!vsi_domain->pta)
+		goto err_unmap_dt;
+
+	vsi_domain->pta_dma = dma_map_single(dma_dev, vsi_domain->pta,
+					     SPAGE_SIZE, DMA_TO_DEVICE);
+	if (dma_mapping_error(dma_dev, vsi_domain->pta_dma)) {
+		dev_err(dma_dev, "DMA map error for PTA\n");
+		goto err_free_pta;
+	}
+	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);
+
+	vsi_table_flush(vsi_domain, vsi_domain->pta_dma, 1024);
+	vsi_table_flush(vsi_domain, vsi_domain->dt_dma, NUM_DT_ENTRIES);
+
+	spin_lock_init(&vsi_domain->iommus_lock);
+	spin_lock_init(&vsi_domain->dt_lock);
+	INIT_LIST_HEAD(&vsi_domain->iommus);
+
+	vsi_domain->domain.geometry.aperture_start = 0;
+	vsi_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
+	vsi_domain->domain.geometry.force_aperture = true;
+
+	return &vsi_domain->domain;
+
+err_free_pta:
+	iommu_free_pages(vsi_domain->pta);
+err_unmap_dt:
+	dma_unmap_single(dma_dev, vsi_domain->dt_dma,
+			 SPAGE_SIZE, DMA_TO_DEVICE);
+err_free_dt:
+	iommu_free_pages(vsi_domain->dt);
+err_free_domain:
+	kfree(vsi_domain);
+
+	return NULL;
+}
+
+static phys_addr_t vsi_iommu_iova_to_phys(struct iommu_domain *domain,
+					  dma_addr_t iova)
+{
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	unsigned long flags;
+	phys_addr_t pt_phys, phys = 0;
+	u32 dte, pte;
+	u32 *page_table;
+
+	spin_lock_irqsave(&vsi_domain->dt_lock, flags);
+
+	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
+	if (!vsi_dte_is_pt_valid(dte))
+		goto out;
+
+	pt_phys = vsi_dte_pt_address(dte);
+	page_table = (u32 *)phys_to_virt(pt_phys);
+	pte = page_table[vsi_iova_pte_index(iova)];
+	if (!vsi_pte_is_page_valid(pte))
+		goto out;
+
+	phys = vsi_pte_page_address(pte) + vsi_iova_page_offset(iova);
+out:
+	spin_unlock_irqrestore(&vsi_domain->dt_lock, flags);
+
+	return phys;
+}
+
+static u32 *vsi_dte_get_page_table(struct vsi_iommu_domain *vsi_domain, dma_addr_t iova)
+{
+	u32 *page_table, *dte_addr;
+	u32 dte_index, dte;
+	phys_addr_t pt_phys;
+	dma_addr_t pt_dma;
+
+	assert_spin_locked(&vsi_domain->dt_lock);
+
+	dte_index = vsi_iova_dte_index(iova);
+	dte_addr = &vsi_domain->dt[dte_index];
+	dte = *dte_addr;
+	if (vsi_dte_is_pt_valid(dte))
+		goto done;
+
+	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
+	if (!page_table)
+		return ERR_PTR(-ENOMEM);
+
+	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
+	if (dma_mapping_error(dma_dev, pt_dma)) {
+		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
+		free_page((unsigned long)page_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	dte = vsi_mk_dte(pt_dma);
+	*dte_addr = dte;
+
+	vsi_table_flush(vsi_domain, pt_dma, NUM_PT_ENTRIES);
+	vsi_table_flush(vsi_domain,
+			vsi_domain->dt_dma + dte_index * sizeof(u32), 1);
+done:
+	pt_phys = vsi_dte_pt_address(dte);
+	return (u32 *)phys_to_virt(pt_phys);
+}
+
+static size_t vsi_iommu_unmap_iova(struct vsi_iommu_domain *vsi_domain,
+				   u32 *pte_addr, dma_addr_t pte_dma,
+				   size_t size)
+{
+	unsigned int pte_count;
+	unsigned int pte_total = size / SPAGE_SIZE;
+
+	assert_spin_locked(&vsi_domain->dt_lock);
+
+	for (pte_count = 0; pte_count < pte_total; pte_count++) {
+		u32 pte = pte_addr[pte_count];
+
+		if (!vsi_pte_is_page_valid(pte))
+			break;
+
+		pte_addr[pte_count] = vsi_mk_pte_invalid(pte);
+	}
+
+	vsi_table_flush(vsi_domain, pte_dma, pte_count);
+
+	return pte_count * SPAGE_SIZE;
+}
+
+static int vsi_iommu_map_iova(struct vsi_iommu_domain *vsi_domain, u32 *pte_addr,
+			      dma_addr_t pte_dma, dma_addr_t iova,
+			      phys_addr_t paddr, size_t size, int prot)
+{
+	unsigned int pte_count;
+	unsigned int pte_total = size / SPAGE_SIZE;
+	phys_addr_t page_phys;
+
+	assert_spin_locked(&vsi_domain->dt_lock);
+
+	for (pte_count = 0; pte_count < pte_total; pte_count++) {
+		u32 pte = pte_addr[pte_count];
+
+		if (vsi_pte_is_page_valid(pte))
+			goto unwind;
+
+		pte_addr[pte_count] = vsi_mk_pte(paddr, prot);
+
+		paddr += SPAGE_SIZE;
+	}
+
+	vsi_table_flush(vsi_domain, pte_dma, pte_total);
+
+	return 0;
+unwind:
+	/* Unmap the range of iovas that we just mapped */
+	vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma,
+			     pte_count * SPAGE_SIZE);
+
+	iova += pte_count * SPAGE_SIZE;
+	page_phys = vsi_pte_page_address(pte_addr[pte_count]);
+	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
+	       &iova, &page_phys, &paddr, prot);
+
+	return -EADDRINUSE;
+}
+
+static size_t vsi_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
+			      size_t size, size_t count, struct iommu_iotlb_gather *gather)
+{
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	unsigned long flags;
+	dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
+	phys_addr_t pt_phys;
+	u32 dte;
+	u32 *pte_addr;
+	size_t unmap_size;
+
+	spin_lock_irqsave(&vsi_domain->dt_lock, flags);
+
+	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
+	/* Just return 0 if iova is unmapped */
+	if (!vsi_dte_is_pt_valid(dte)) {
+		spin_unlock_irqrestore(&vsi_domain->dt_lock, flags);
+		return 0;
+	}
+
+	pt_phys = vsi_dte_pt_address(dte);
+	pte_addr = (u32 *)phys_to_virt(pt_phys) + vsi_iova_pte_index(iova);
+	pte_dma = pt_phys + vsi_iova_pte_index(iova) * sizeof(u32);
+	unmap_size = vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma, size);
+
+	spin_unlock_irqrestore(&vsi_domain->dt_lock, flags);
+
+	return unmap_size;
+}
+
+static int vsi_iommu_map(struct iommu_domain *domain, unsigned long _iova,
+			 phys_addr_t paddr, size_t size, size_t count,
+			 int prot, gfp_t gfp, size_t *mapped)
+{
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	unsigned long flags;
+	dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
+	u32 *page_table, *pte_addr;
+	u32 dte, pte_index;
+	int ret;
+
+	spin_lock_irqsave(&vsi_domain->dt_lock, flags);
+
+	page_table = vsi_dte_get_page_table(vsi_domain, iova);
+	if (IS_ERR(page_table)) {
+		spin_unlock_irqrestore(&vsi_domain->dt_lock, flags);
+		return PTR_ERR(page_table);
+	}
+
+	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
+	pte_index = vsi_iova_pte_index(iova);
+	pte_addr = &page_table[pte_index];
+	pte_dma = vsi_dte_pt_address(dte) + pte_index * sizeof(u32);
+	ret = vsi_iommu_map_iova(vsi_domain, pte_addr, pte_dma, iova,
+				 paddr, size, prot);
+
+	spin_unlock_irqrestore(&vsi_domain->dt_lock, flags);
+	if (!ret)
+		*mapped = size;
+
+	return ret;
+}
+
+static void vsi_iommu_detach_device(struct iommu_domain *domain,
+				    struct device *dev)
+{
+	struct vsi_iommu *iommu;
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	unsigned long flags;
+	int ret;
+
+	/* Allow 'virtual devices' (eg drm) to detach from domain */
+	iommu = vsi_iommu_from_dev(dev);
+	if (WARN_ON(!iommu))
+		return;
+
+	dev_dbg(dev, "Detaching from iommu domain\n");
+
+	if (!iommu->domain)
+		return;
+
+	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
+	list_del_init(&iommu->node);
+	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);
+
+	ret = pm_runtime_get_if_in_use(iommu->dev);
+	WARN_ON_ONCE(ret < 0);
+	if (ret > 0) {
+		vsi_iommu_disable(iommu);
+		pm_runtime_put(iommu->dev);
+	}
+	iommu->domain = NULL;
+}
+
+static int vsi_iommu_attach_device(struct iommu_domain *domain,
+				   struct device *dev)
+{
+	struct vsi_iommu *iommu;
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	unsigned long flags;
+	int ret;
+
+	iommu = vsi_iommu_from_dev(dev);
+	if (WARN_ON(!iommu))
+		return -ENODEV;
+
+	if (iommu->domain == domain)
+		return 0;
+
+	iommu->domain = domain;
+
+	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
+	list_add_tail(&iommu->node, &vsi_domain->iommus);
+	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);
+
+	ret = pm_runtime_get_if_in_use(iommu->dev);
+	if (!ret || WARN_ON_ONCE(ret < 0))
+		return 0;
+
+	ret = vsi_iommu_enable(iommu);
+	if (ret)
+		vsi_iommu_detach_device(iommu->domain, dev);
+
+	pm_runtime_put(iommu->dev);
+
+	return ret;
+}
+
+static void vsi_iommu_domain_free(struct iommu_domain *domain)
+{
+	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
+	int i;
+
+	WARN_ON(!list_empty(&vsi_domain->iommus));
+
+	for (i = 0; i < NUM_DT_ENTRIES; i++) {
+		u32 dte = vsi_domain->dt[i];
+
+		if (vsi_dte_is_pt_valid(dte)) {
+			phys_addr_t pt_phys = vsi_dte_pt_address(dte);
+			u32 *page_table = phys_to_virt(pt_phys);
+
+			dma_unmap_single(dma_dev, pt_phys,
+					 SPAGE_SIZE, DMA_TO_DEVICE);
+			iommu_free_pages(page_table);
+		}
+	}
+
+	dma_unmap_single(dma_dev, vsi_domain->dt_dma,
+			 SPAGE_SIZE, DMA_TO_DEVICE);
+	iommu_free_pages(vsi_domain->dt);
+
+	dma_unmap_single(dma_dev, vsi_domain->pta_dma,
+			 SPAGE_SIZE, DMA_TO_DEVICE);
+	iommu_free_pages(vsi_domain->pta);
+
+	kfree(vsi_domain);
+}
+
+static struct iommu_device *vsi_iommu_probe_device(struct device *dev)
+{
+	struct vsi_iommudata *data;
+	struct vsi_iommu *iommu;
+
+	data = dev_iommu_priv_get(dev);
+	if (!data)
+		return ERR_PTR(-ENODEV);
+
+	iommu = vsi_iommu_from_dev(dev);
+
+	pr_info("%s,%d, consumer : %s, supplier : %s\n",
+		__func__, __LINE__, dev_name(dev), dev_name(iommu->dev));
+
+	/*
+	 * link will free by platform_device_del(master) via
+	 * BUS_NOTIFY_REMOVED_DEVICE
+	 */
+	data->link = device_link_add(dev, iommu->dev,
+				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+
+	/* set max segment size for dev, needed for single chunk map */
+	if (!dev->dma_parms)
+		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
+	if (!dev->dma_parms)
+		return ERR_PTR(-ENOMEM);
+
+	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+
+	return &iommu->iommu;
+}
+
+static void vsi_iommu_release_device(struct device *dev)
+{
+	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
+
+	device_link_del(data->link);
+}
+
+static int vsi_iommu_of_xlate(struct device *dev,
+			      const struct of_phandle_args *args)
+{
+	struct platform_device *iommu_dev;
+	struct vsi_iommudata *data;
+
+	data = devm_kzalloc(dma_dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_info(dev, "%s,%d\n", __func__, __LINE__);
+	iommu_dev = of_find_device_by_node(args->np);
+
+	data->iommu = platform_get_drvdata(iommu_dev);
+
+	dev_iommu_priv_set(dev, data);
+
+	platform_device_put(iommu_dev);
+
+	return 0;
+}
+
+static struct iommu_ops vsi_iommu_ops = {
+	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
+	.probe_device = vsi_iommu_probe_device,
+	.release_device = vsi_iommu_release_device,
+	.device_group = generic_single_device_group,
+	.pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,
+	.of_xlate = vsi_iommu_of_xlate,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev		= vsi_iommu_attach_device,
+		.map_pages		= vsi_iommu_map,
+		.unmap_pages		= vsi_iommu_unmap,
+		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
+		.iova_to_phys		= vsi_iommu_iova_to_phys,
+		.free			= vsi_iommu_domain_free,
+	}
+};
+
+static const struct of_device_id vsi_iommu_dt_ids[] = {
+	{
+		.compatible = "verisilicon,iommu",
+	},
+	{ /* sentinel */ }
+};
+
+static int vsi_iommu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vsi_iommu *iommu;
+	struct resource *res;
+	int num_res = pdev->num_resources;
+	int err, i;
+
+	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
+	if (!iommu)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, iommu);
+	iommu->dev = dev;
+	iommu->num_mmu = 0;
+
+	iommu->bases = devm_kcalloc(dev, num_res, sizeof(*iommu->bases),
+				    GFP_KERNEL);
+	if (!iommu->bases)
+		return -ENOMEM;
+
+	for (i = 0; i < num_res; i++) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			continue;
+		iommu->bases[i] = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(iommu->bases[i]))
+			continue;
+		iommu->num_mmu++;
+	}
+	if (iommu->num_mmu == 0)
+		return PTR_ERR(iommu->bases[0]);
+
+	iommu->num_irq = platform_irq_count(pdev);
+	if (iommu->num_irq < 0)
+		return iommu->num_irq;
+
+	err = devm_clk_bulk_get_all(dev, &iommu->clocks);
+	if (err >= 0)
+		iommu->num_clocks = err;
+	else if (err == -ENOENT)
+		iommu->num_clocks = 0;
+	else
+		return err;
+
+	err = clk_bulk_prepare(iommu->num_clocks, iommu->clocks);
+	if (err)
+		return err;
+
+	iommu->group = iommu_group_alloc();
+	if (IS_ERR(iommu->group)) {
+		err = PTR_ERR(iommu->group);
+		goto err_unprepare_clocks;
+	}
+
+	/*
+	 * use the first registered sysmmu device for performing
+	 * dma mapping operations on iommu page tables (cpu cache flush)
+	 */
+	if (!dma_dev)
+		dma_dev = &pdev->dev;
+
+	pm_runtime_enable(dev);
+
+	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
+	if (err)
+		goto err_put_group;
+
+	err = iommu_device_register(&iommu->iommu, &vsi_iommu_ops, dev);
+	if (err)
+		goto err_remove_sysfs;
+
+	for (i = 0; i < iommu->num_irq; i++) {
+		int irq = platform_get_irq(pdev, i);
+
+		if (irq < 0)
+			return irq;
+
+		err = devm_request_irq(iommu->dev, irq, vsi_iommu_irq,
+				       IRQF_SHARED, dev_name(dev), iommu);
+		if (err)
+			goto err_unregister;
+	}
+
+	return 0;
+err_unregister:
+	iommu_device_unregister(&iommu->iommu);
+err_remove_sysfs:
+	iommu_device_sysfs_remove(&iommu->iommu);
+err_put_group:
+	iommu_group_put(iommu->group);
+	pm_runtime_disable(dev);
+err_unprepare_clocks:
+	clk_bulk_unprepare(iommu->num_clocks, iommu->clocks);
+	return err;
+}
+
+static void vsi_iommu_shutdown(struct platform_device *pdev)
+{
+	struct vsi_iommu *iommu = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < iommu->num_irq; i++) {
+		int irq = platform_get_irq(pdev, i);
+
+		devm_free_irq(iommu->dev, irq, iommu);
+	}
+
+	pm_runtime_force_suspend(&pdev->dev);
+}
+
+static int __maybe_unused vsi_iommu_suspend(struct device *dev)
+{
+	struct vsi_iommu *iommu = dev_get_drvdata(dev);
+
+	if (!iommu->domain)
+		return 0;
+
+	vsi_iommu_disable(iommu);
+	return 0;
+}
+
+static int __maybe_unused vsi_iommu_resume(struct device *dev)
+{
+	struct vsi_iommu *iommu = dev_get_drvdata(dev);
+
+	if (!iommu->domain)
+		return 0;
+
+	return vsi_iommu_enable(iommu);
+}
+
+static const struct dev_pm_ops vsi_iommu_pm_ops = {
+	SET_RUNTIME_PM_OPS(vsi_iommu_suspend, vsi_iommu_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+struct platform_driver rockchip_vsi_iommu_driver = {
+	.probe = vsi_iommu_probe,
+	.shutdown = vsi_iommu_shutdown,
+	.driver = {
+		   .name = "vsi_iommu",
+		   .of_match_table = vsi_iommu_dt_ids,
+		   .pm = &vsi_iommu_pm_ops,
+		   .suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(rockchip_vsi_iommu_driver);
-- 
2.43.0


