Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79F26343D4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfFDKM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:12:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41375 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727366AbfFDKM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:26 -0400
X-UUID: 19a63ab428de403bad2a9c4f79da7b88-20190604
X-UUID: 19a63ab428de403bad2a9c4f79da7b88-20190604
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1763951134; Tue, 04 Jun 2019 18:12:00 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 18:11:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 18:11:59 +0800
From:   Stu Hsieh <stu.hsieh@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stu Hsieh <stu.hsieh@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 02/14] dt-bindings: media: Add mipicsi common node binding for MT2712 MIPI-CSI2
Date:   Tue, 4 Jun 2019 18:11:43 +0800
Message-ID: <1559643115-15124-3-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add mipicsi common node binding for MT2712 MIPI-CSI2

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/mediatek-mipicsi-common.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
new file mode 100644
index 000000000000..a67c744b75f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
@@ -0,0 +1,19 @@
+* Mediatek MIPI-CSI2 receiver common
+
+Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
+
+Required properties:
+- compatible: should be "mediatek,mt2712-mipicsi-common"
+- reg : physical base address of the mipicsi receiver registers and length of
+  memory mapped region.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+
+
+Example:
+	mipicsi: mipicsi@15002000 {
+		compatible = "mediatek,mt2712-mipicsi-common", "syscon";
+		reg = <0 0x15002000 0 0x10>;
+		clocks = <&imgsys CLK_IMG_SENINF_CAM_EN>,
+			 <&imgsys CLK_IMG_SENINF_SCAM_EN>;
+	};
-- 
2.18.0

