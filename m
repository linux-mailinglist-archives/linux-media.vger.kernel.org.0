Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3EC24C19E
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgHTPLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:11:31 -0400
Received: from foss.arm.com ([217.140.110.172]:41190 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728765AbgHTPJo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:09:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B97B1509;
        Thu, 20 Aug 2020 08:09:43 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAB5A3F6CF;
        Thu, 20 Aug 2020 08:09:39 -0700 (PDT)
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
Subject: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
Date:   Thu, 20 Aug 2020 16:08:32 +0100
Message-Id: <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that arch/arm is wired up for default domains and iommu-dma,
implement the corresponding driver-side support for DMA domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 124c8848ab7e..8e276eac84d9 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitops.h>
 #include <linux/debugfs.h>
+#include <linux/dma-iommu.h>
 #include <linux/err.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
@@ -278,7 +279,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -288,25 +289,19 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->attr = SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
 
 	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
-	if (!as->pd) {
-		kfree(as);
-		return NULL;
-	}
+	if (!as->pd)
+		goto out_free_as;
 
 	as->count = kcalloc(SMMU_NUM_PDE, sizeof(u32), GFP_KERNEL);
-	if (!as->count) {
-		__free_page(as->pd);
-		kfree(as);
-		return NULL;
-	}
+	if (!as->count)
+		goto out_free_all;
 
 	as->pts = kcalloc(SMMU_NUM_PDE, sizeof(*as->pts), GFP_KERNEL);
-	if (!as->pts) {
-		kfree(as->count);
-		__free_page(as->pd);
-		kfree(as);
-		return NULL;
-	}
+	if (!as->pts)
+		goto out_free_all;
+
+	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&as->domain))
+		goto out_free_all;
 
 	/* setup aperture */
 	as->domain.geometry.aperture_start = 0;
@@ -314,12 +309,22 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->domain.geometry.force_aperture = true;
 
 	return &as->domain;
+
+out_free_all:
+	kfree(as->pts);
+	kfree(as->count);
+	__free_page(as->pd);
+out_free_as:
+	kfree(as);
+	return NULL;
 }
 
 static void tegra_smmu_domain_free(struct iommu_domain *domain)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 
+	iommu_put_dma_cookie(domain);
+
 	/* TODO: free page directory and page tables */
 
 	WARN_ON_ONCE(as->use_count);
-- 
2.28.0.dirty

