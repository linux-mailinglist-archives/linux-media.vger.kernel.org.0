Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804B1438360
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 13:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhJWLRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 07:17:36 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39426 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230521AbhJWLRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 07:17:21 -0400
X-UUID: 086bb180c0734007b9da76d4f6288a2f-20211023
X-UUID: 086bb180c0734007b9da76d4f6288a2f-20211023
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 18124664; Sat, 23 Oct 2021 19:15:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 23 Oct 2021 19:14:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 19:14:59 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Subject: [RFC 10/13] arm64: dts: mt8192: Add APU-IOMMU nodes
Date:   Sat, 23 Oct 2021 19:14:06 +0800
Message-ID: <20211023111409.30463-11-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yong Wu <yong.wu@mediatek.com>

Add APU-IOMMI nodes

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 7014082637b0..d5e417a512a7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8192-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8192-larb-port.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
 #include <dt-bindings/power/mt8192-power.h>
 
@@ -916,6 +917,14 @@
 			#clock-cells = <1>;
 		};
 
+		iommu_apu: m4u@19010000 {
+			compatible = "mediatek,mt8192-iommu-apu";
+			reg = <0 0x19010000 0 0x1000>;
+			interrupts = <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&apuspm 0>;
+			#iommu-cells = <1>;
+		};
+
 		apu_conn: apu_conn@19020000 {
 			compatible = "mediatek,mt8192-apu-conn", "syscon";
 			reg = <0 0x19020000 0 0x1000>;
-- 
2.18.0

