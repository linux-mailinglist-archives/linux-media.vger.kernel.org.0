Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE86437115
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 12:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfFFKA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 06:00:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:26278 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727891AbfFFKA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 06:00:56 -0400
X-UUID: 0616955ab927431694428006a327569e-20190606
X-UUID: 0616955ab927431694428006a327569e-20190606
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1535517798; Thu, 06 Jun 2019 18:00:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Jun 2019 18:00:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 6 Jun 2019 18:00:42 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>
Subject: [RFC PATCH V3 4/4] dts: arm64: mt8183: Add sensor interface nodes
Date:   Thu, 6 Jun 2019 18:00:33 +0800
Message-ID: <1559815233-24796-5-git-send-email-louis.kuo@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 745F35D63D56B7E4467BD79ED8DD0542DD4F0EE424B2793DA7791920112282522000:8
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
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 75c4881..d98bb3f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -370,4 +370,19 @@
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
+		clocks =
+				<&camsys CLK_CAM_SENINF>, <&topckgen CLK_TOP_MUX_SENINF>;
+		clock-names =
+			"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
+		status = "disabled";
+		};
+	};
 };
-- 
1.9.1

