Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD6D438361
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 13:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhJWLRi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 07:17:38 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39320 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231408AbhJWLRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 07:17:22 -0400
X-UUID: 4a3e196170eb448a87f51f8f0e46d445-20211023
X-UUID: 4a3e196170eb448a87f51f8f0e46d445-20211023
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1865629089; Sat, 23 Oct 2021 19:15:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:15:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 19:15:00 +0800
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
Subject: [RFC 11/13] arm64: dts: mt8192: Add apu power nodes
Date:   Sat, 23 Oct 2021 19:14:07 +0800
Message-ID: <20211023111409.30463-12-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add apu power node.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index d5e417a512a7..c505c6926839 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -964,6 +964,68 @@
 			};
 		};
 
+		apusys_power: apusys_power@190f1000 {
+			compatible = "mediatek,apusys-power",
+				     "mediatek,mt8192-apu-power";
+			reg = <0 0x190f1000 0 0x1000>,
+			      <0 0x19000600 0 0x100>;
+			reg-names = "apu_pcu",
+				    "apu_spare";
+			power-domains = <&apuspm 0>;
+			clocks = <&topckgen CLK_TOP_DSP_SEL>,
+				<&topckgen CLK_TOP_DSP1_SEL>,
+				<&topckgen CLK_TOP_DSP1_NPUPLL_SEL>,
+				<&topckgen CLK_TOP_DSP2_SEL>,
+				<&topckgen CLK_TOP_DSP2_NPUPLL_SEL>,
+				<&topckgen CLK_TOP_DSP5_SEL>,
+				<&topckgen CLK_TOP_DSP5_APUPLL_SEL>,
+				<&topckgen CLK_TOP_IPU_IF_SEL>,
+				<&clk26m>,
+				<&topckgen CLK_TOP_MAINPLL_D4_D2>,
+				<&topckgen CLK_TOP_UNIVPLL_D4_D2>,
+				<&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				<&topckgen CLK_TOP_MMPLL_D6>,
+				<&topckgen CLK_TOP_MMPLL_D5>,
+				<&topckgen CLK_TOP_MMPLL_D4>,
+				<&topckgen CLK_TOP_UNIVPLL_D5>,
+				<&topckgen CLK_TOP_UNIVPLL_D4>,
+				<&topckgen CLK_TOP_UNIVPLL_D3>,
+				<&topckgen CLK_TOP_MAINPLL_D6>,
+				<&topckgen CLK_TOP_MAINPLL_D4>,
+				<&topckgen CLK_TOP_MAINPLL_D3>,
+				<&topckgen CLK_TOP_TVDPLL>,
+				<&topckgen CLK_TOP_APUPLL>,
+				<&topckgen CLK_TOP_NPUPLL>,
+				<&apmixedsys CLK_APMIXED_APUPLL>,
+				<&apmixedsys CLK_APMIXED_NPUPLL>;
+			clock-names = "clk_top_dsp_sel",
+				"clk_top_dsp1_sel",
+				"clk_top_dsp1_npupll_sel",
+				"clk_top_dsp2_sel",
+				"clk_top_dsp2_npupll_sel",
+				"clk_top_dsp5_sel",
+				"clk_top_dsp5_apupll_sel",
+				"clk_top_ipu_if_sel",
+				"clk_top_clk26m",
+				"clk_top_mainpll_d4_d2",
+				"clk_top_univpll_d4_d2",
+				"clk_top_univpll_d6_d2",
+				"clk_top_mmpll_d6",
+				"clk_top_mmpll_d5",
+				"clk_top_mmpll_d4",
+				"clk_top_univpll_d5",
+				"clk_top_univpll_d4",
+				"clk_top_univpll_d3",
+				"clk_top_mainpll_d6",
+				"clk_top_mainpll_d4",
+				"clk_top_mainpll_d3",
+				"clk_top_tvdpll_ck",
+				"clk_top_apupll_ck",
+				"clk_top_npupll_ck",
+				"clk_apmixed_apupll_rate",
+				"clk_apmixed_npupll_rate";
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8192-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.18.0

