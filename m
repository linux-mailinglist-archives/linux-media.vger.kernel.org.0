Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EEF24C1BC
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbgHTPMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:12:18 -0400
Received: from foss.arm.com ([217.140.110.172]:40906 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728638AbgHTPJR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:09:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C34B713A1;
        Thu, 20 Aug 2020 08:09:16 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20A2C3F6CF;
        Thu, 20 Aug 2020 08:09:13 -0700 (PDT)
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
Subject: [PATCH 06/18] ARM/dma-mapping: Support IOMMU default domains
Date:   Thu, 20 Aug 2020 16:08:25 +0100
Message-Id: <2144220ecbc88e9c1f1311c56db32f96dea05396.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that iommu-dma is wired up, we can let it work as normal
without the dma_iommu_mapping hacks if the IOMMU driver already
supports default domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mm/dma-mapping.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 0f69ede44cd7..2ef0afc17645 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1220,6 +1220,13 @@ static bool arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	if (!iommu)
 		return false;
 
+	/* If a default domain exists, just let iommu-dma work normally */
+	if (iommu_get_domain_for_dev(dev)) {
+		iommu_setup_dma_ops(dev, dma_base, size);
+		return true;
+	}
+
+	/* Otherwise, use the workaround until the IOMMU driver is updated */
 	mapping = arm_iommu_create_mapping(dev->bus, dma_base, size);
 	if (IS_ERR(mapping)) {
 		pr_warn("Failed to create %llu-byte IOMMU mapping for device %s\n",
@@ -1234,6 +1241,7 @@ static bool arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		return false;
 	}
 
+	set_dma_ops(dev, &iommu_dma_ops);
 	return true;
 }
 
@@ -1263,8 +1271,6 @@ static void arm_teardown_iommu_dma_ops(struct device *dev) { }
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 			const struct iommu_ops *iommu, bool coherent)
 {
-	const struct dma_map_ops *dma_ops;
-
 	dev->archdata.dma_coherent = coherent;
 #ifdef CONFIG_SWIOTLB
 	dev->dma_coherent = coherent;
@@ -1278,12 +1284,9 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	if (dev->dma_ops)
 		return;
 
-	if (arm_setup_iommu_dma_ops(dev, dma_base, size, iommu))
-		dma_ops = &iommu_dma_ops;
-	else
-		dma_ops = arm_get_dma_map_ops(coherent);
+	set_dma_ops(dev, arm_get_dma_map_ops(coherent));
 
-	set_dma_ops(dev, dma_ops);
+	arm_setup_iommu_dma_ops(dev, dma_base, size, iommu);
 
 #ifdef CONFIG_XEN
 	if (xen_initial_domain())
-- 
2.28.0.dirty

