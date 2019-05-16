Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C218A1FE0D
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 05:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfEPDYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 23:24:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5602 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726265AbfEPDYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 23:24:03 -0400
X-UUID: 1a888ce7b8c943ae81441be02a4495bb-20190516
X-UUID: 1a888ce7b8c943ae81441be02a4495bb-20190516
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <daoyuan.huang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 2047438356; Thu, 16 May 2019 11:23:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 11:23:57 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 May 2019 11:23:57 +0800
From:   Daoyuan Huang <daoyuan.huang@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Subject: [RFC v2 3/4] media: platform: Add Mediatek MDP3 driver KConfig
Date:   Thu, 16 May 2019 11:23:31 +0800
Message-ID: <20190516032332.56844-4-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

This patch adds Kconfig for Mediatek Media Data Path 3 (MDP3)
driver. MDP3 is used to do scaling and color format conversion.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 drivers/media/platform/Kconfig  | 18 ++++++++++++++++++
 drivers/media/platform/Makefile |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a505e9f5a1e2..6e8b594a1569 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -244,6 +244,24 @@ config VIDEO_MEDIATEK_MDP
 	    To compile this driver as a module, choose M here: the
 	    module will be called mtk-mdp.
 
+config VIDEO_MEDIATEK_MDP3
+	tristate "Mediatek MDP v3 driver"
+	depends on MTK_IOMMU || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on HAS_DMA
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select VIDEO_MEDIATEK_VPU
+	select MTK_CMDQ
+	default n
+	help
+	    It is a v4l2 driver and present in Mediatek MT8183 SoC.
+	    The driver supports for scaling and color space conversion.
+
+	    To compile this driver as a module, choose M here: the
+	    module will be called mtk-mdp3.
+
 config VIDEO_MEDIATEK_VCODEC
 	tristate "Mediatek Video Codec driver"
 	depends on MTK_IOMMU || COMPILE_TEST
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index e6deb2597738..1e2cb92bc6da 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -92,6 +92,8 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC)	+= mtk-vcodec/
 
 obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
 
+obj-$(CONFIG_VIDEO_MEDIATEK_MDP3)	+= mtk-mdp3/
+
 obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
-- 
2.18.0

