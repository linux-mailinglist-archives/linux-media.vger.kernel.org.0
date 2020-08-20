Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4341D24C146
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgHTPI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:08:56 -0400
Received: from foss.arm.com ([217.140.110.172]:40680 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727920AbgHTPIy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:08:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA18331B;
        Thu, 20 Aug 2020 08:08:53 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FDC83F6CF;
        Thu, 20 Aug 2020 08:08:50 -0700 (PDT)
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
Subject: [PATCH 00/18] Convert arch/arm to use iommu-dma
Date:   Thu, 20 Aug 2020 16:08:19 +0100
Message-Id: <cover.1597931875.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

After 5 years or so of intending to get round to this, finally the
time comes! The changes themselves actualy turn out to be relatively
mechanical; the bigger concern appears to be how to get everything
merged across about 5 diffferent trees given the dependencies.

I've lightly boot-tested things on Rockchip RK3288 and Exynos 4412
(Odroid-U3), to the degree that their display drivers should be using
IOMMU-backed buffers and don't explode (the Odroid doesn't manage to
send a working HDMI signal to the one monitor I have that it actually
detects, but that's a pre-existing condition...) Confirmation that the
Mediatek, OMAP and Tegra changes work will be most welcome.

Patches are based on 5.9-rc1, branch available here:

  git://linux-arm.org/linux-rm arm/dma


Robin.


Robin Murphy (18):
  ARM/dma-mapping: Drop .dma_supported for IOMMU ops
  ARM/dma-mapping: Consolidate IOMMU ops callbacks
  ARM/dma-mapping: Merge IOMMU ops
  iommu/dma: Add temporary hacks for arch/arm
  ARM/dma-mapping: Switch to iommu_dma_ops
  ARM/dma-mapping: Support IOMMU default domains
  iommu/arm-smmu: Remove arch/arm workaround
  iommu/renesas: Remove arch/arm workaround
  iommu/mediatek-v1: Add IOMMU_DOMAIN_DMA support
  iommu/msm: Add IOMMU_DOMAIN_DMA support
  iommu/omap: Add IOMMU_DOMAIN_DMA support
  iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
  iommu/tegra: Add IOMMU_DOMAIN_DMA support
  drm/exynos: Consolidate IOMMU mapping code
  drm/nouveau/tegra: Clean up IOMMU workaround
  staging/media/tegra-vde: Clean up IOMMU workaround
  media/omap3isp: Clean up IOMMU workaround
  ARM/dma-mapping: Remove legacy dma-iommu API

 arch/arm/Kconfig                              |   28 +-
 arch/arm/common/dmabounce.c                   |    1 -
 arch/arm/include/asm/device.h                 |    9 -
 arch/arm/include/asm/dma-iommu.h              |   37 -
 arch/arm/mm/dma-mapping.c                     | 1198 +----------------
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |    5 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c       |   61 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |    6 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         |    7 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    |   13 -
 drivers/iommu/Kconfig                         |    8 -
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   10 -
 drivers/iommu/ipmmu-vmsa.c                    |   69 -
 drivers/iommu/msm_iommu.c                     |    7 +-
 drivers/iommu/mtk_iommu.h                     |    2 -
 drivers/iommu/mtk_iommu_v1.c                  |  153 +--
 drivers/iommu/omap-iommu.c                    |   22 +-
 drivers/iommu/tegra-gart.c                    |   17 +-
 drivers/iommu/tegra-smmu.c                    |   37 +-
 drivers/media/platform/Kconfig                |    1 -
 drivers/media/platform/omap3isp/isp.c         |   68 +-
 drivers/media/platform/omap3isp/isp.h         |    3 -
 drivers/staging/media/tegra-vde/iommu.c       |   12 -
 30 files changed, 150 insertions(+), 1660 deletions(-)
 delete mode 100644 arch/arm/include/asm/dma-iommu.h

-- 
2.28.0.dirty

