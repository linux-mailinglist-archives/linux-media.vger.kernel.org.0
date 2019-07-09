Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB9B632F2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 10:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfGIImE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 04:42:04 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40838 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726617AbfGIImD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 04:42:03 -0400
X-UUID: 2b6f1438b0694273897fde2d8f4f1f06-20190709
X-UUID: 2b6f1438b0694273897fde2d8f4f1f06-20190709
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1807405469; Tue, 09 Jul 2019 16:41:57 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 16:41:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 16:41:55 +0800
From:   Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <po-yang.huang@mediatek.com>, <shik@chromium.org>,
        <suleiman@chromium.org>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.com>
Subject: [RFC PATCH V2 3/4] media: platform: Add Mediatek FD driver KConfig
Date:   Tue, 9 Jul 2019 16:41:11 +0800
Message-ID: <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

This patch adds KConfig for Mediatek Face Detection driver (FD).
FD is embedded in Mediatek SoCs. It can provide hardware
accelerated face detection function.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
---
 drivers/media/platform/Kconfig            |  2 ++
 drivers/media/platform/mtk-isp/fd/Kconfig | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a505e9f..ae99258e 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/omap/Kconfig"
 
+source "drivers/media/platform/mtk-isp/fd/Kconfig"
+
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
 	depends on VIDEO_V4L2
diff --git a/drivers/media/platform/mtk-isp/fd/Kconfig b/drivers/media/platform/mtk-isp/fd/Kconfig
new file mode 100644
index 0000000..0c5eaf0
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/fd/Kconfig
@@ -0,0 +1,17 @@
+config VIDEO_MEDIATEK_FD
+	bool "Mediatek face detection processing function"
+	select DMA_SHARED_BUFFER
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_MEMOPS
+	select VIDEOBUF2_VMALLOC
+	select MEDIA_CONTROLLER
+
+	default n
+	help
+		Support the Face Detectioin (FD) feature.
+
+		FD driver is a V4L2 memory-to-memory device driver which
+		provides hardware accelerated face detection function,
+		it can detect different sizes of faces in a raw image.
-- 
1.9.1

