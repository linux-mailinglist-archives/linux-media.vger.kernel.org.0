Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D7AAB57C
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 12:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389663AbfIFKMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 06:12:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:24088 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732763AbfIFKMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 06:12:08 -0400
X-UUID: 6eafbf0924ce41f0969c17b77f94b461-20190906
X-UUID: 6eafbf0924ce41f0969c17b77f94b461-20190906
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2052249996; Fri, 06 Sep 2019 18:12:02 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Sep 2019 18:11:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Sep 2019 18:11:58 +0800
From:   Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>, <lkml@metux.net>
CC:     <ck.hu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <po-yang.huang@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.com>
Subject: [RFC PATCH V3 2/3] dts: arm64: mt8183: Add FD nodes
Date:   Fri, 6 Sep 2019 18:11:24 +0800
Message-ID: <20190906101125.3784-3-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

This patch adds nodes for Face Detection (FD) unit. FD is embedded
in Mediatek SoCs and works with the co-processor to perform face
detection on the input data and image and output detected face result.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c3a516e63141..6f31b5f4c17c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -432,6 +432,19 @@
 			#clock-cells = <1>;
 		};
 
+		fd:fd@1502b000 {
+			compatible = "mediatek,mt8183-fd";
+			mediatek,scp = <&scp>;
+			iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
+				 <&iommu M4U_PORT_CAM_FDVT_WR>,
+				 <&iommu M4U_PORT_CAM_FDVT_RB>;
+			reg = <0 0x1502b000 0 0x1000>;
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&imgsys CLK_IMG_FDVT>;
+			clock-names = "fd";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_ISP>;
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8183-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;
-- 
2.18.0

