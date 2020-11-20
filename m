Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAF42BA082
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 03:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgKTCec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 21:34:32 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:55697 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727107AbgKTCeb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 21:34:31 -0500
X-UUID: 6a8a512a89174b8f84b36303ff056946-20201120
X-UUID: 6a8a512a89174b8f84b36303ff056946-20201120
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <daoyuan.huang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1831481896; Fri, 20 Nov 2020 10:29:18 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 10:29:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 10:29:08 +0800
From:   Daoyuan Huang <daoyuan.huang@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v4 2/4] dts: arm64: mt8183: Add Mediatek MDP3 nodes
Date:   Fri, 20 Nov 2020 10:29:04 +0800
Message-ID: <1605839346-10648-3-git-send-email-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
References: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 55E9BE2092F48E92C04B0561F10FB184D5682F22E2EA2E137381990B6F3B2B912000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

Add device nodes for Media Data Path 3 (MDP3) modules.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
Depend on:
   [1] https://lore.kernel.org/patchwork/patch/1164746/
   [2] https://patchwork.kernel.org/patch/11703299/
   [3] https://patchwork.kernel.org/patch/11283773/
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 116 +++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 8fed72bb35d7..fdd809883ce7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/mt8183-clk.h>
+#include <dt-bindings/gce/mt8183-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
@@ -712,13 +713,128 @@
 
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
+			mdp-comps = "mediatek,mt8183-mdp-dl",
+				    "mediatek,mt8183-mdp-dl";
+			mdp-comp-ids = <0 1>;
 			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 			#clock-cells = <1>;
+			clocks = <&mmsys CLK_MM_MDP_DL_TXCK>,
+				 <&mmsys CLK_MM_MDP_DL_RX>,
+				 <&mmsys CLK_MM_IPU_DL_TXCK>,
+				 <&mmsys CLK_MM_IPU_DL_RX>;
+		};
+
+		mdp_rdma0: mdp-rdma0@14001000 {
+			compatible = "mediatek,mt8183-mdp-rdma",
+				     "mediatek,mt8183-mdp3";
+			mediatek,scp = <&scp>;
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+				 <&mmsys CLK_MM_MDP_RSZ1>;
+			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+			mediatek,larb = <&larb0>;
+			mediatek,mmsys = <&mmsys>;
+			mediatek,mm-mutex = <&mutex>;
+			mediatek,imgsys = <&imgsys>;
+			mediatek,mailbox-gce = <&gce>;
+			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
+			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+				     <&gce 0x14010000 SUBSYS_1401XXXX>,
+				     <&gce 0x14020000 SUBSYS_1402XXXX>,
+				     <&gce 0x15020000 SUBSYS_1502XXXX>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_RDMA0_EOF>,
+					      <CMDQ_EVENT_MDP_RSZ0_SOF>,
+					      <CMDQ_EVENT_MDP_RSZ1_SOF>,
+					      <CMDQ_EVENT_MDP_TDSHP_SOF>,
+					      <CMDQ_EVENT_MDP_WROT0_SOF>,
+					      <CMDQ_EVENT_MDP_WROT0_EOF>,
+					      <CMDQ_EVENT_MDP_WDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_WDMA0_EOF>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
+					      <CMDQ_EVENT_WPE_A_DONE>,
+					      <CMDQ_EVENT_SPE_B_DONE>;
+		};
+
+		mdp_rsz0: mdp-rsz0@14003000 {
+			compatible = "mediatek,mt8183-mdp-rsz";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		};
+
+		mdp_rsz1: mdp-rsz1@14004000 {
+			compatible = "mediatek,mt8183-mdp-rsz";
+			mediatek,mdp-id = <1>;
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		};
+
+		mdp_wrot0: mdp-wrot0@14005000 {
+			compatible = "mediatek,mt8183-mdp-wrot";
+			mediatek,mdp-id = <0>;
+			mdp-comps = "mediatek,mt8183-mdp-path";
+			mdp-comp-ids = <0>;
+			reg = <0 0x14005000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_WROT0>;
+			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		mdp_wdma: mdp-wdma@14006000 {
+			compatible = "mediatek,mt8183-mdp-wdma";
+			mediatek,mdp-id = <0>;
+			mdp-comps = "mediatek,mt8183-mdp-path";
+			mdp-comp-ids = <1>;
+			reg = <0 0x14006000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		mdp_ccorr: mdp-ccorr@1401c000 {
+			compatible = "mediatek,mt8183-mdp-ccorr";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x1401c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_CCORR>;
 		};
 
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
+			mediatek,mdp-id = <0>;
+			mdp-comps = "mediatek,mt8183-mdp-imgi",
+				    "mediatek,mt8183-mdp-exto";
+			mdp-comp-ids = <0 1>;
 			reg = <0 0x15020000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1502XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
-- 
2.18.0

