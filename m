Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF4CD61D84
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 13:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbfGHLFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 07:05:12 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:33875 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727625AbfGHLFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 07:05:12 -0400
X-UUID: 616d08799c88431ab5b31eb9710c1fb7-20190708
X-UUID: 616d08799c88431ab5b31eb9710c1fb7-20190708
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 2007830324; Mon, 08 Jul 2019 19:05:08 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 8 Jul 2019 19:05:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 8 Jul 2019 19:05:06 +0800
From:   <frederic.chen@mediatek.com>
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
        <shik@chromium.org>, <suleiman@chromium.org>,
        <Allan.Yang@mediatek.com>
Subject: [RFC PATCH V2 1/6] dt-bindings: mt8183: Added DIP dt-bindings
Date:   Mon, 8 Jul 2019 19:04:55 +0800
Message-ID: <20190708110500.7242-2-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190708110500.7242-1-frederic.chen@mediatek.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Frederic Chen <frederic.chen@mediatek.com>

This patch adds DT binding documentation for the Digital Image
Processing (DIP) unit of camera ISP system on Mediatek's SoCs.

It depends on the SCP and MDP 3 patch as following:

1. dt-bindings: Add a binding for Mediatek SCP
   https://patchwork.kernel.org/patch/11027247/
2. dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
   https://patchwork.kernel.org/patch/10945603/

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 .../bindings/media/mediatek,mt8183-dip.txt    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
new file mode 100644
index 000000000000..3a0435513089
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
@@ -0,0 +1,40 @@
+* Mediatek Digital Image Processor (DIP)
+
+Digital Image Processor (DIP) unit in Mediatek ISP system is responsible for
+image content adjustment according to the tuning parameters. DIP can process
+the image form memory buffer and output the processed image to multiple output
+buffers. Furthermore, it can support demosaicing and noise reduction on the
+images.
+
+Required properties:
+- compatible: "mediatek,mt8183-dip"
+- reg: Physical base address and length of the function block register space
+- interrupts: interrupt number to the cpu
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,mdp3: should point to the respective mdp block. DIP hardware
+  connects to MDP and we can get the processed image with both effect of the
+  two blocks.
+- mediatek,larb: must contain the local arbiters in the current SoCs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- mediatek,scp: should point to the scp node since the we use SCP
+  coprocessor to control DIP hardware
+- clocks: must contain the local arbiters 5 (LARB5) and DIP clock
+- clock-names: must contain "larb5" and "dip"
+
+Example:
+	dip: dip@15022000 {
+		compatible = "mediatek,mt8183-dip";
+		mediatek,larb = <&larb5>;
+		mediatek,mdp3 = <&mdp_rdma0>;
+		mediatek,scp = <&scp>;
+		iommus = <&iommu M4U_PORT_CAM_IMGI>;
+		reg = <0 0x15022000 0 0x6000>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&imgsys CLK_IMG_LARB5>,
+			 <&imgsys CLK_IMG_DIP>;
+		clock-names = "larb5",
+			      "dip";
+		};
-- 
2.18.0

