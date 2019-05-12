Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD32C1AAD0
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 08:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfELGAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 02:00:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:15902 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725946AbfELGAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 02:00:25 -0400
X-UUID: 7e1d099f60434de4918b5b78e41d0153-20190512
X-UUID: 7e1d099f60434de4918b5b78e41d0153-20190512
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 721356067; Sun, 12 May 2019 14:00:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 12 May 2019 14:00:16 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 12 May 2019 14:00:16 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>
Subject: [RFC PATCH V2 2/4] media: platform: Add Mediatek sensor interface driver KConfig
Date:   Sun, 12 May 2019 14:00:03 +0800
Message-ID: <20190512060005.5444-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190512060005.5444-1-louis.kuo@mediatek.com>
References: <20190512060005.5444-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: DF53BF8B6971C61179F1785A44F193CA7107797E9AC2D6AFABE7C54F95F8D5D72000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds KConfig for sensor interface driver. Sensor interface driver
is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
It support a widely adopted, simple, high-speed protocol primarily intended
for point-to-point image and video transmission between cameras and host
devices.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/platform/mtk-isp/Kconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
new file mode 100644
index 000000000000..c665fa1bb121
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,16 @@
+config MTK_SENINF
+	bool "Mediatek mipi csi2 driver"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CAMERA_SUPPORT
+	select V4L2_FWNODE
+
+	default n
+	help
+	    This driver provides a mipi-csi2 host driver used as a
+	    interface to connect camera with Mediatek's
+	    MT8183 SOCs. It is able to handle multiple cameras
+	    at the same time.
+
+		Choose y if you want to use Mediatek SoCs to create image
+		capture application such as video recording and still image
+		capture.
-- 
2.18.0

