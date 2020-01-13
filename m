Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201731389EA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 04:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387435AbgAMDtE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 22:49:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:42180 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387415AbgAMDtD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 22:49:03 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0A9B6363CF2ECA1AC0A6;
        Mon, 13 Jan 2020 11:49:01 +0800 (CST)
Received: from localhost.localdomain (10.175.124.28) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 13 Jan 2020 11:48:52 +0800
From:   Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To:     <helen.koike@collabora.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <zhangxiaoxu5@huawei.com>
CC:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>
Subject: [PATCH] media: staging: rkisp1: Fix undefined reference to `phy_mipi_dphy_get_default_config' in rkisp1_mipi_csi2_start
Date:   Mon, 13 Jan 2020 11:48:04 +0800
Message-ID: <20200113034804.24732-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If 'GENERIC_PHY_MIPI_DPHY' not configured, there is an error:

drivers/staging/media/rkisp1/rkisp1-isp.o:
	In function `rkisp1_mipi_csi2_start.isra.5':
rkisp1-isp.c:(.text+0x1238):
	undefined reference to `phy_mipi_dphy_get_default_config'
make: *** [vmlinux] Error 1

Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/staging/media/rkisp1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
index b859a493caba..788bcb703376 100644
--- a/drivers/staging/media/rkisp1/Kconfig
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_ISP1
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
 	select PHY_ROCKCHIP_DPHY_RX0
+	select GENERIC_PHY_MIPI_DPHY
 	default n
 	help
 	  Enable this to support the Image Signal Processing (ISP) module
-- 
2.17.2

