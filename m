Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F751C300
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfENGOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:14:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:11083 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726381AbfENGOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:10 -0400
X-UUID: ed75a129c3aa410fac1c7ff51932ac53-20190514
X-UUID: ed75a129c3aa410fac1c7ff51932ac53-20190514
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1038240998; Tue, 14 May 2019 14:13:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:13:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:13:54 +0800
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
Subject: [PATCH v3 01/13] dt-bindings: media: Add binding for MT2712 MIPI-CSI2
Date:   Tue, 14 May 2019 14:13:38 +0800
Message-ID: <1557814430-9675-2-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 52F22A3B8030EDB752AF9E792A3AD372CBFC3B55B8488575710DCC25A6C3F40E2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MIPI-CSI2 dt-binding for Mediatek MT2712 SoC

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../bindings/media/mediatek-mipicsi-camsv.txt | 53 ++++++++++++++++++
 .../media/mediatek-mipicsi-common.txt         | 19 +++++++
 .../bindings/media/mediatek-mipicsi.txt       | 54 +++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
new file mode 100644
index 000000000000..5f34974f12ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
@@ -0,0 +1,53 @@
+* Mediatek MIPI-CSI2 receiver camsv
+
+Mediatek MIPI-CSI2 receiver camsv transfer data to DRAM in Mediatek SoCs
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
diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
new file mode 100644
index 000000000000..24741ed62b25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
@@ -0,0 +1,54 @@
+* Mediatek MIPI-CSI2 receiver
+
+Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
+
+Required properties:
+- compatible: should be "mediatek,mt2712-mipicsi"
+- reg : physical base address of the mipicsi receiver registers and length of
+  memory mapped region.
+- power-domains: a phandle to the power domain, see
+  Documentation/devicetree/bindings/power/power_domain.txt for details.
+- mediatek,larb: must contain the local arbiters in the current Socs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,seninf_mux_camsv: seninf_mux_camsv the data go through of the mipicsi port
+- mediatek,mipicsiid: the id of the mipicsi port
+- mediatek,mipicsi: the common component of the two mipicsi port
+
+Example:
+	mipicsi0: mipicsi@10217000 {
+		compatible = "mediatek,mt2712-mipicsi";
+		mediatek,mipicsi = <&mipicsi>;
+		iommus = <&iommu0 M4U_PORT_CAM_DMA0>,
+			 <&iommu0 M4U_PORT_CAM_DMA1>;
+		mediatek,larb = <&larb2>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
+
+		mediatek,seninf_mux_camsv = <&seninf1_mux_camsv0
+					     &seninf2_mux_camsv1
+					     &seninf3_mux_camsv2
+					     &seninf4_mux_camsv3>;
+		reg = <0 0x10217000 0 0x60>,
+		      <0 0x15002100 0 0x4>,
+		      <0 0x15002300 0 0x100>;
+		mediatek,mipicsiid = <0>;
+		status="disabled";
+	};
+
+	mipicsi1: mipicsi@10218000 {
+		compatible = "mediatek,mt2712-mipicsi";
+		mediatek,mipicsi = <&mipicsi>;
+		iommus = <&iommu0 M4U_PORT_CAM_DMA2>;
+		mediatek,larb = <&larb2>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
+		mediatek,seninf_mux_camsv = <&seninf5_mux_camsv4
+					     &seninf6_mux_camsv5>;
+		reg = <0 0x10218000 0 0x60>,
+		      <0 0x15002500 0 0x4>,
+		      <0 0x15002700 0 0x100>;
+		mediatek,mipicsiid = <1>;
+		status="disabled";
+	};
\ No newline at end of file
-- 
2.18.0

