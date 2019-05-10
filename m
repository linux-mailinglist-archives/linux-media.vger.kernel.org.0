Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1657D19674
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 04:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfEJCCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 22:02:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:17306 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726799AbfEJCCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 22:02:55 -0400
X-UUID: 52bc2170f38e4a96b7101ad943b46761-20190510
X-UUID: 52bc2170f38e4a96b7101ad943b46761-20190510
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1230836266; Fri, 10 May 2019 10:02:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 May 2019 10:02:28 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 10:02:28 +0800
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
Subject: [RFC,V2,04/11] dts: arm64: mt8183: Add ISP Pass 1 nodes
Date:   Fri, 10 May 2019 09:57:54 +0800
Message-ID: <20190510015755.51495-5-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 994DC7035D47087A22DFA3A364B1B3D460E8C7B4587C2A3605B8DE427128280C2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add nodes for Pass 1 unit of Mediatek's camera ISP system.
Pass 1 unit embedded in Mediatek SoCs, works with the
co-processor to process image signal from the image sensor
and output RAW image data.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index d5d83a05f8a1..5f195236a762 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -382,5 +382,37 @@
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		camisp: camisp@1a000000 {
+			compatible = "mediatek,mt8183-camisp", "syscon";
+			reg = <0 0x1a000000 0 0x1000>,
+			      <0 0x1a003000 0 0x1000>,
+			      <0 0x1a004000 0 0x2000>,
+			      <0 0x1a006000 0 0x2000>;
+			reg-names = "camisp",
+				    "cam1",
+				    "cam2",
+				    "cam3";
+			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "cam1",
+					  "cam2",
+					  "cam3";
+			iommus = <&iommu M4U_PORT_CAM_LSCI0>,
+				 <&iommu M4U_PORT_CAM_LSCI1>,
+				 <&iommu M4U_PORT_CAM_BPCI>;
+			#clock-cells = <1>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+			/* Camera CCF */
+			clocks = <&camsys CLK_CAM_CAM>,
+				 <&camsys CLK_CAM_CAMTG>;
+			clock-names = "CAMSYS_CAM_CGPDN",
+				      "CAMSYS_CAMTG_CGPDN";
+			mediatek,larb = <&larb3>,
+					<&larb6>;
+			mediatek,scp = <&scp>;
+			memory-region = <&cam_mem_reserved>;
+		};
 	};
 };
-- 
2.18.0

