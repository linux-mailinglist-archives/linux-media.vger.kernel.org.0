Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD9B79D0A6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 15:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbfHZNce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 09:32:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5660 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726953AbfHZNcd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 09:32:33 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5EFA913FC29889333CDC;
        Mon, 26 Aug 2019 21:32:27 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 26 Aug 2019
 21:32:20 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <digetx@gmail.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <robin.murphy@arm.com>,
        <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] media: staging: tegra-vde: Disable building with COMPILE_TEST
Date:   Mon, 26 Aug 2019 21:31:40 +0800
Message-ID: <20190826133140.13456-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
to m will set IOMMU_IOVA to m, this fails the building of
TEGRA_HOST1X and DRM_TEGRA which is y like this:

drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
cdma.c:(.text+0x698): undefined reference to `__free_iova'

drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/tegra-vde/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ba49ea5..a41d30c 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
-	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on ARCH_TEGRA
 	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
+	select IOMMU_IOVA if IOMMU_SUPPORT
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.7.4


