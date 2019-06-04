Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB13D343E7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfFDKMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:12:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60302 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727367AbfFDKM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:26 -0400
X-UUID: 05b8f7322a024332a486d97bd065a167-20190604
X-UUID: 05b8f7322a024332a486d97bd065a167-20190604
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1176125939; Tue, 04 Jun 2019 18:12:00 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
Date:   Tue, 4 Jun 2019 18:11:42 +0800
Message-ID: <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
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

Add MIPI-CSI2 dt-binding for Mediatek MT2712 SoC

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../bindings/media/mediatek-mipicsi.txt       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
new file mode 100644
index 000000000000..e30b6a468129
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
@@ -0,0 +1,58 @@
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
+  any mipicsi port can contain max four seninf_mux_camsv
+  The Total seninf_mux_camsv is six for mt2712
+- mediatek,mipicsiid: the id of the mipicsi port, there are two port for mt2712
+- mediatek,mipicsi: the common component of the two mipicsi port
+- mediatek,mipicsi_max_vc: the number of virtual channel which subdev used
+- mediatek,serdes_link_reg: the register of subdev to get the link status
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
+		mediatek,mipicsi_max_vc = <4>;
+		mediatek,serdes_link_reg = <0x49>;
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
+	};
-- 
2.18.0

