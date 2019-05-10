Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3BAF1966B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 04:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfEJCBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 22:01:55 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56065 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726799AbfEJCBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 22:01:55 -0400
X-UUID: b9d62f3c0b6d4c259b49b2e7b56d8fda-20190510
X-UUID: b9d62f3c0b6d4c259b49b2e7b56d8fda-20190510
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 2095654483; Fri, 10 May 2019 10:01:49 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 May 2019 10:01:48 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 10:01:48 +0800
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
Subject: [RFC,V2,01/11] dt-bindings: mt8183: Add binding for ISP Pass 1 reserved memory
Date:   Fri, 10 May 2019 09:57:47 +0800
Message-ID: <20190510015755.51495-2-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the binding for describing the reserved
shared memory used to exchange ISP configuration and tuning
data between the co-processor and Pass 1 (P1) unit of the
camera ISP system on Mediatek SoCs.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../mediatek,reserve-memory-cam-smem.txt      | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
new file mode 100644
index 000000000000..65a967cff91e
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
@@ -0,0 +1,42 @@
+Mediatek ISP Pass 1 Shared Memory binding
+
+This binding describes the shared memory, which serves the purpose of
+describing the shared memory region used to exchange data between Pass 1
+unit of Image Signal Processor (ISP) and the co-processor in Mediatek
+SoCs.
+
+The co-processor doesn't have the iommu so we need to use the physical
+address to access the shared buffer in the firmware.
+
+The Pass 1 unit of ISP can access memory through the iommu so it
+uses the dma address to access the memory region.
+(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
+
+For additional details about reserved memory regions see reserved-memory.txt
+
+Required properties:
+
+- compatible: must be "mediatek,reserve-memory-cam-smem"
+
+- size: required for dynamic allocation. The unit is bytes.
+
+- alloc-range: required for dynamic allocation. The range must
+  between 0x40000000 and 0x100000000 due to the co-processer's
+  addressing limitation.
+
+Example:
+
+The following example shows the ISP Pass 1 shared memory setup for MT8183.
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		cam_mem_reserved: cam_mem_region {
+			compatible = "mediatek,reserve-memory-cam-smem";
+			size = <0 0x1400000>;
+			no-map;
+			alignment = <0 0x1000>;
+			alloc-ranges = <0 0x40000000 0 0x10000000>;
+		};
+	};
-- 
2.18.0

