Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E83FB2EC2
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 08:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfIOGuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 02:50:21 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59699 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725835AbfIOGuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 02:50:20 -0400
X-UUID: 31c5a11394274a3db69d226665b57e15-20190915
X-UUID: 31c5a11394274a3db69d226665b57e15-20190915
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1493376918; Sun, 15 Sep 2019 14:50:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Sep 2019 14:50:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 15 Sep 2019 14:50:07 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <louis.kuo@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V4 4/4] dts: arm64: mt8183: Add sensor interface nodes
Date:   Sun, 15 Sep 2019 14:50:04 +0800
Message-ID: <20190915065004.20257-5-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190915065004.20257-1-louis.kuo@mediatek.com>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add nodes for Mediatek's sensor interface device. Sensor interface module
embedded in Mediatek SOCs, works as a HW camera interface controller
intended for image and data transmission between cameras and host devices.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 66aaa07f6cec..f1d081b99867 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -506,4 +506,18 @@
 			#clock-cells = <1>;
 		};
 	};
+
+	seninf: seninf@1a040000 {
+		compatible = "mediatek,mt8183-seninf";
+		reg = <0 0x1a040000 0 0x8000>,
+		      <0 0x11C80000 0 0x6000>;
+		reg-names = "base_reg", "rx_reg";
+		interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+		clocks = <&camsys CLK_CAM_SENINF>,
+			 <&topckgen CLK_TOP_MUX_SENINF>;
+		clock-names = "CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
+		status = "disabled";
+		};
+	};
 };
-- 
2.18.0

