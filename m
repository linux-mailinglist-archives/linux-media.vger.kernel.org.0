Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A2324C199
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbgHTPLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:11:18 -0400
Received: from foss.arm.com ([217.140.110.172]:41266 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728698AbgHTPJw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:09:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D724B1516;
        Thu, 20 Aug 2020 08:09:50 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48CAB3F6CF;
        Thu, 20 Aug 2020 08:09:47 -0700 (PDT)
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
Subject: [PATCH 15/18] drm/nouveau/tegra: Clean up IOMMU workaround
Date:   Thu, 20 Aug 2020 16:08:34 +0100
Message-Id: <21d8d42edb9f91e62f9c72875cf2210afacff18c.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that arch/arm is wired up for default domains and iommu-dma, we no
longer need to work around the arch-private mapping.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index d0d52c1d4aee..410ee1f83e0b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -23,10 +23,6 @@
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
 #include "priv.h"
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-#include <asm/dma-iommu.h>
-#endif
-
 static int
 nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 {
@@ -109,15 +105,6 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 	unsigned long pgsize_bitmap;
 	int ret;
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-	if (dev->archdata.mapping) {
-		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-
-		arm_iommu_detach_device(dev);
-		arm_iommu_release_mapping(mapping);
-	}
-#endif
-
 	if (!tdev->func->iommu_bit)
 		return;
 
-- 
2.28.0.dirty

