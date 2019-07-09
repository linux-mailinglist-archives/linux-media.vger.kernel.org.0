Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718AE62EC5
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 05:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfGIDV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 23:21:56 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:42014 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726294AbfGIDVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 23:21:55 -0400
X-UUID: 707dca3466484833b952467e4d0b3c79-20190709
X-UUID: 707dca3466484833b952467e4d0b3c79-20190709
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1883023027; Tue, 09 Jul 2019 11:21:48 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 11:21:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 11:21:46 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH 1/5] media: dt-bindings: Add JPEG ENC device tree node document
Date:   Tue, 9 Jul 2019 11:20:59 +0800
Message-ID: <20190709032103.10291-2-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190709032103.10291-1-xia.jiang@mediatek.com>
References: <20190709032103.10291-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add JPEG ENC device tree node document.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-encoder.txt  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
new file mode 100644
index 000000000000..1231fedb70bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -0,0 +1,33 @@
+* MediaTek JPEG Encoder
+
+MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
+
+Required properties:
+- compatible : must be "mediatek,mtk-jpgenc"
+- reg : physical base address of the JPEG encoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the interrupt controller.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
+- power-domains: a phandle to the power domain, see
+  Documentation/devicetree/bindings/power/power_domain.txt for details.
+- mediatek,larb: must contain the local arbiters in the current SoCs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+
+Example:
+	jpegenc: jpegenc@1500a000 {
+		compatible = "mediatek,mtk-jpgenc";
+		reg = <0 0x1500a000 0 0x1000>;
+		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
+		clocks =  <&imgsys CLK_IMG_VENC>;
+		clock-names = "jpgenc";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+		mediatek,larb = <&larb2>;
+		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
+			<&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
+	};
-- 
2.18.0

