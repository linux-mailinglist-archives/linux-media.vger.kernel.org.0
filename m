Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C50834400
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfFDKMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:12:08 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:11494 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727107AbfFDKMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:08 -0400
X-UUID: ba1ccf79b92949c6900fef6057c08ab0-20190604
X-UUID: ba1ccf79b92949c6900fef6057c08ab0-20190604
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 834335591; Tue, 04 Jun 2019 18:12:01 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 18:12:00 +0800
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
Subject: [PATCH v4 03/14] dt-bindings: media: Add camsv binding for MT2712 MIPI-CSI2
Date:   Tue, 4 Jun 2019 18:11:44 +0800
Message-ID: <1559643115-15124-4-git-send-email-stu.hsieh@mediatek.com>
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

Add camsv binding for MT2712 MIPI-CSI2

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../bindings/media/mediatek-mipicsi-camsv.txt | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
new file mode 100644
index 000000000000..c9b4af9eeeff
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
@@ -0,0 +1,55 @@
+* Mediatek MIPI-CSI2 receiver camsv
+
+Mediatek MIPI-CSI2 receiver camsv transfer data to DRAM in Mediatek SoCs
+
+These node are refer by mipicsi
+
+Required properties:
+- reg : physical base address of the mipicsi receiver registers and length of
+  memory mapped region.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- interrupts : interrupt number to the interrupt controller.
+
+Example:
+	seninf1_mux_camsv0: seninf_mux_camsv@15002100 {
+		reg = <0 0x15002120 0 0x40>,
+		      <0 0x15004000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
+		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf2_mux_camsv1: seninf_mux_camsv@15002500 {
+		reg = <0 0x15002520 0 0x40>,
+		      <0 0x15005000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
+		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf3_mux_camsv2: seninf_mux_camsv@15002900 {
+		reg = <0 0x15002920 0 0x40>,
+		      <0 0x15006000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf4_mux_camsv3: seninf_mux_camsv@15002D00 {
+		reg = <0 0x15002D20 0 0x40>,
+		      <0 0x15007000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
+		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf5_mux_camsv4: seninf_mux_camsv@15003100 {
+		reg = <0 0x15003120 0 0x40>,
+		      <0 0x15008000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
+		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	seninf6_mux_camsv5: seninf_mux_camsv@15003500 {
+		reg = <0 0x15003520 0 0x40>,
+		      <0 0x15009000 0 0x1000>;
+		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
+		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_LOW>;
+	};
-- 
2.18.0

