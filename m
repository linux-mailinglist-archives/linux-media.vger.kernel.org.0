Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D24519672
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 04:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfEJCCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 22:02:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43022 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726839AbfEJCCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 22:02:55 -0400
X-UUID: f5101126d6664a2087d570b72d2ede68-20190510
X-UUID: f5101126d6664a2087d570b72d2ede68-20190510
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1276962723; Fri, 10 May 2019 10:02:19 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 May 2019 10:02:17 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 10:02:18 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <seraph.huang@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC,V2,03/11] dt-bindings: mt8183: Added camera ISP Pass 1
Date:   Fri, 10 May 2019 09:57:52 +0800
Message-ID: <20190510015755.51495-4-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 019C1D491CF1598136811AF6381FF7DD5DCE3AB319A6537852CFA7FE8E9948DB2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds DT binding document for the Pass 1 (P1) unit in
Mediatek's camera ISP system. The Pass 1 unit grabs the sensor data
out from the sensor interface, applies ISP image effects from tuning
data and outputs the image data or statistics data to DRAM.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../bindings/media/mediatek,camisp.txt        | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
new file mode 100644
index 000000000000..759e55a5dfac
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
@@ -0,0 +1,92 @@
+* Mediatek Image Signal Processor Pass 1 (ISP P1)
+
+The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
+from the sensor interface, applies ISP effects from tuning data and outputs
+the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
+the ability to output two different resolutions frames at the same time to
+increase the performance of the camera application.
+
+Required properties:
+- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
+- reg: Must contain an entry for each entry in reg-names.
+- interrupts: interrupt number to the cpu.
+- iommus: shall point to the respective IOMMU block with master port
+  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- power-domains : a phandle to the power domain of this local arbiter.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- clock-names: must be "CAMSYS_CAM_CGPDN" and "CAMSYS_CAMTG_CGPDN".
+- mediatek,larb: must contain the local arbiters in the current SOCs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- mediatek,scp : the node of system control processor (SCP), see
+  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
+- memory-region : the reserved shared memory region between Pass 1 unit and
+  system control processor.
+
+Example:
+SoC specific DT entry:
+
+	camisp: camisp@1a000000 {
+		compatible = "mediatek,mt8183-camisp", "syscon";
+		reg = <0 0x1a000000 0 0x1000>,
+		      <0 0x1a003000 0 0x1000>,
+		      <0 0x1a004000 0 0x2000>,
+		      <0 0x1a006000 0 0x2000>;
+		reg-names = "camisp",
+		            "cam1",
+		            "cam2",
+		            "cam3";
+		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "cam1",
+				  "cam2",
+				  "cam3";
+		iommus = <&iommu M4U_PORT_CAM_LSCI0>,
+			 <&iommu M4U_PORT_CAM_LSCI1>,
+			 <&iommu M4U_PORT_CAM_BPCI>;
+		#clock-cells = <1>;
+		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+		/* Camera CCF */
+		clocks = <&camsys CLK_CAM_CAM>,
+			 <&camsys CLK_CAM_CAMTG>;
+		clock-names = "CAMSYS_CAM_CGPDN",
+			      "CAMSYS_CAMTG_CGPDN";
+		mediatek,larb = <&larb3>,
+				<&larb6>;
+		mediatek,scp = <&scp>;
+		memory-region = <&cam_mem_reserved>;
+	};
+
+Reserved memory specific DT entry (see reserved memory binding for more
+information):
+
+Example:
+SoC specific DT entry:
+
+	cam_mem_reserved: cam_mem_region {
+		compatible = "mediatek,reserve-memory-cam-smem";
+		no-map;
+		size = <0 0x01400000>; / *20 MB share mem size */
+		alignment = <0 0x1000>;
+		alloc-ranges = <0 0x40000000 0 0x10000000>;
+	};
+
+Mediatek ISP P1 supports a single port node with MIPI-CSI2 bus. It should
+contain one 'port' child node with child 'endpoint' node. Please refer to
+the bindings defined in Documentation/devicetree/bindings/media/video-interfaces.txt
+and Documentation/devicetree/bindings/media/mediatek-seninf.txt.
+
+Example:
+Board specific DT entry:
+
+	&camisp {
+		port@0 {
+			seninf_0: endpoint {
+				remote-endpoint = <&seninf_core>;
+			};
+		};
+	};
+
-- 
2.18.0

