Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2477139F67
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 03:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgANCSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 21:18:21 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44842 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728931AbgANCSV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 21:18:21 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2F1F990C45F4730C62EB;
        Tue, 14 Jan 2020 10:18:20 +0800 (CST)
Received: from localhost.localdomain (10.175.124.28) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 Jan 2020 10:18:10 +0800
From:   Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To:     <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <zhangxiaoxu5@huawei.com>
CC:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>
Subject: [PATCH v2] media: staging: rkisp1: The rkisp1 should be depended on CONFIG_OF
Date:   Tue, 14 Jan 2020 10:17:20 +0800
Message-ID: <20200114021720.30826-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If 'CONFIG_VIDEO_ROCKCHIP_ISP1' configured but no 'CONFIG_OF', the
default configuration maybe:
  # CONFIG_OF is not set
  CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
  CONFIG_VIDEO_ROCKCHIP_ISP1=y

This will cause the following compilation errors:
  drivers/staging/media/rkisp1/rkisp1-isp.o:
      In function `rkisp1_mipi_csi2_start.isra.5':
  rkisp1-isp.c:(.text+0x1238):
      undefined reference to `phy_mipi_dphy_get_default_config'
  make: *** [vmlinux] Error 1

Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/staging/media/rkisp1/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
index b859a493caba..23080b7f07a6 100644
--- a/drivers/staging/media/rkisp1/Kconfig
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_ROCKCHIP_ISP1
 	tristate "Rockchip Image Signal Processing v1 Unit driver"
 	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
-- 
2.17.2

