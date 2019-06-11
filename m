Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2A923C1A8
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 05:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391039AbfFKDyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 23:54:01 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39376 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391027AbfFKDyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 23:54:00 -0400
X-UUID: 58abbbe7404b4c3f874c0215dbfda760-20190611
X-UUID: 58abbbe7404b4c3f874c0215dbfda760-20190611
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 65018185; Tue, 11 Jun 2019 11:53:53 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 11:53:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 11:53:52 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <jungo.lin@mediatek.com>,
        <frankie.chiu@mediatek.com>
Subject: [RFC,v3 3/9] media: platform: Add Mediatek ISP Pass 1 driver Kconfig
Date:   Tue, 11 Jun 2019 11:53:38 +0800
Message-ID: <20190611035344.29814-4-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds Kconfig for Pass 1 (P1) unit driver of Mediatek's
camera ISP system. ISP P1 unit is embedded in Mediatek SoCs. It
provides RAW processing which includes optical black correction,
defect pixel correction, W/IR imbalance correction and lens
shading correction.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 drivers/media/platform/Kconfig         |  2 ++
 drivers/media/platform/mtk-isp/Kconfig | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 011c1c2fcf19..8e2b65d757e5 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/omap/Kconfig"
 
+source "drivers/media/platform/mtk-isp/Kconfig"
+
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
 	depends on VIDEO_V4L2
diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
new file mode 100644
index 000000000000..983b79c261fa
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,17 @@
+config VIDEO_MEDIATEK_ISP_PASS1
+	bool "Mediatek Pass 1 image processing function"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select VIDEOBUF2_DMA_CONTIG
+	default n
+	help
+		Pass 1 driver controls 3A (auto-focus, exposure,
+		and white balance) with tuning feature and outputs
+		the captured image buffers in Mediatek's camera system.
+
+		Choose y if you want to use Mediatek SoCs to create image
+		captured application such as video recording and still image
+		capturing.
+
+
-- 
2.18.0

