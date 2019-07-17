Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DDF6B94C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfGQJbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:31:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:36782 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726458AbfGQJbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:31:31 -0400
X-UUID: fc376afada1647888930b706c5c4d3f7-20190717
X-UUID: fc376afada1647888930b706c5c4d3f7-20190717
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 232240130; Wed, 17 Jul 2019 17:31:03 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 17:31:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 17:31:02 +0800
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
Date:   Wed, 17 Jul 2019 17:30:30 +0800
Message-ID: <20190717093034.22826-2-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190717093034.22826-1-xia.jiang@mediatek.com>
References: <20190717093034.22826-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add JPEG ENC device tree node document

Change-Id: I9f0a8aec7eced20c88acbc88d6ff179763f91246
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

