Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35041B2EC5
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 08:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfIOGuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 02:50:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5235 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725788AbfIOGuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 02:50:20 -0400
X-UUID: 96465b7513e64828adecf76e3bc2f38b-20190915
X-UUID: 96465b7513e64828adecf76e3bc2f38b-20190915
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 230456824; Sun, 15 Sep 2019 14:50:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Sep 2019 14:50:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 15 Sep 2019 14:50:07 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <louis.kuo@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V4 2/4] media: platform: Add Mediatek sensor interface driver KConfig
Date:   Sun, 15 Sep 2019 14:50:02 +0800
Message-ID: <20190915065004.20257-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190915065004.20257-1-louis.kuo@mediatek.com>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds KConfig for sensor interface driver. Sensor interface
driver
is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
It support a widely adopted, simple, high-speed protocol primarily
intended
for point-to-point image and video transmission between cameras and host
devices.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/platform/mtk-isp/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
new file mode 100644
index 000000000000..bc7fd01808b3
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,17 @@
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
+	    Choose y if you want to use Mediatek SoCs to create image
+	    capture application such as video recording and still image
+	    capture.
+
-- 
2.18.0

