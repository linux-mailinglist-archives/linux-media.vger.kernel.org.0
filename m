Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34E0701A7
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfGVNsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:48:50 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2735 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727805AbfGVNsu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:48:50 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B47831F73539573CC4C6;
        Mon, 22 Jul 2019 21:48:46 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 22 Jul 2019
 21:48:39 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <yong.zhi@intel.com>,
        <digetx@gmail.com>, <hverkuil-cisco@xs4all.nl>
CC:     <linux-kernel@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <linux-media@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] media: staging: ipu3: Enable IOVA API only when IOMMU support is enabled
Date:   Mon, 22 Jul 2019 21:47:49 +0800
Message-ID: <20190722134749.21580-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If IOMMU_SUPPORT is not set, ipu3 driver may select IOMMU_IOVA to m.
But for many drivers, they use "select IOMMU_IOVA if IOMMU_SUPPORT"
in the Kconfig, for example, CONFIG_TEGRA_VDE is set to y but IOMMU_IOVA
is m, then the building fails like this:

drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
iommu.c:(.text+0x41): undefined reference to `alloc_iova'
iommu.c:(.text+0x56): undefined reference to `__free_iova'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/ipu3/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
index 4b51c67..b7df18f 100644
--- a/drivers/staging/media/ipu3/Kconfig
+++ b/drivers/staging/media/ipu3/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_IPU3_IMGU
 	depends on PCI && VIDEO_V4L2
 	depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
 	depends on X86
-	select IOMMU_IOVA
+	select IOMMU_IOVA if IOMMU_SUPPORT
 	select VIDEOBUF2_DMA_SG
 	help
 	  This is the Video4Linux2 driver for Intel IPU3 image processing unit,
-- 
2.7.4


