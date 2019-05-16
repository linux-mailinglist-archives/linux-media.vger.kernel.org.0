Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE8821FE0F
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 05:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfEPDYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 23:24:13 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:29786 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726348AbfEPDYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 23:24:13 -0400
X-UUID: 990262522c494b549602fea32204765f-20190516
X-UUID: 990262522c494b549602fea32204765f-20190516
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <daoyuan.huang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 878619781; Thu, 16 May 2019 11:23:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 11:23:54 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 May 2019 11:23:55 +0800
From:   Daoyuan Huang <daoyuan.huang@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Subject: [RFC v2 2/4] dts: arm64: mt8183: Add Mediatek MDP3 nodes
Date:   Thu, 16 May 2019 11:23:30 +0800
Message-ID: <20190516032332.56844-3-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

Add device nodes for Media Data Path 3 (MDP3) modules.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 173 +++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c3a516e63141..e3e4c3bcd7b6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -418,14 +418,187 @@
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		mdp_camin@14000000 {
+			compatible = "mediatek,mt8183-mdp-dl";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_DL_TXCK>,
+				<&mmsys CLK_MM_MDP_DL_RX>;
+		};
+
+		mdp_camin2@14000000 {
+			compatible = "mediatek,mt8183-mdp-dl";
+			mediatek,mdp-id = <1>;
+			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0 0x1000>;
+			clocks = <&mmsys CLK_MM_IPU_DL_TXCK>,
+				<&mmsys CLK_MM_IPU_DL_RX>;
+		};
+
+		mdp_rdma0: mdp_rdma0@14001000 {
+			compatible = "mediatek,mt8183-mdp-rdma",
+				     "mediatek,mt8183-mdp3";
+			mediatek,vpu = <&vpu>;
+			mediatek,scp = <&scp>;
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0x1000 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+				<&mmsys CLK_MM_MDP_RSZ1>;
+			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+			mediatek,larb = <&larb0>;
+			mediatek,mmsys = <&mmsys>;
+			mediatek,mm-mutex = <&mutex>;
+			mediatek,mailbox-gce = <&gce>;
+			mboxes = <&gce 20 0 CMDQ_THR_PRIO_LOWEST>,
+				<&gce 21 0 CMDQ_THR_PRIO_LOWEST>,
+				<&gce 22 0 CMDQ_THR_PRIO_LOWEST>,
+				<&gce 23 0 CMDQ_THR_PRIO_LOWEST>;
+			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+				<&gce 0x14010000 SUBSYS_1401XXXX>,
+				<&gce 0x14020000 SUBSYS_1402XXXX>,
+				<&gce 0x15020000 SUBSYS_1502XXXX>;
+			mediatek,gce-event-names = "rdma0_sof",
+				"rsz0_sof",
+				"rsz1_sof",
+				"tdshp0_sof",
+				"wrot0_sof",
+				"wdma0_sof",
+				"rdma0_done",
+				"wrot0_done",
+				"wdma0_done",
+				"isp_p2_0_done",
+				"isp_p2_1_done",
+				"isp_p2_2_done",
+				"isp_p2_3_done",
+				"isp_p2_4_done",
+				"isp_p2_5_done",
+				"isp_p2_6_done",
+				"isp_p2_7_done",
+				"isp_p2_8_done",
+				"isp_p2_9_done",
+				"isp_p2_10_done",
+				"isp_p2_11_done",
+				"isp_p2_12_done",
+				"isp_p2_13_done",
+				"isp_p2_14_done",
+				"wpe_done",
+				"wpe_b_done";
+			mediatek,gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
+				<&gce CMDQ_EVENT_MDP_RSZ0_SOF>,
+				<&gce CMDQ_EVENT_MDP_RSZ1_SOF>,
+				<&gce CMDQ_EVENT_MDP_TDSHP_SOF>,
+				<&gce CMDQ_EVENT_MDP_WROT0_SOF>,
+				<&gce CMDQ_EVENT_MDP_WDMA0_SOF>,
+				<&gce CMDQ_EVENT_MDP_RDMA0_EOF>,
+				<&gce CMDQ_EVENT_MDP_WROT0_EOF>,
+				<&gce CMDQ_EVENT_MDP_WDMA0_EOF>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
+				<&gce CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
+				<&gce CMDQ_EVENT_WPE_A_DONE>,
+				<&gce CMDQ_EVENT_SPE_B_DONE>;
+		};
+
+		mdp_imgi@15020000 {
+			compatible = "mediatek,mt8183-mdp-imgi";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x15020000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1502XXXX 0 0x1000>;
+		};
+
+		mdp_img2o@15020000 {
+			compatible = "mediatek,mt8183-mdp-exto";
+			mediatek,mdp-id = <1>;
+		};
+
+		mdp_rsz0: mdp_rsz0@14003000 {
+			compatible = "mediatek,mt8183-mdp-rsz";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		};
+
+		mdp_rsz1: mdp_rsz1@14004000 {
+			compatible = "mediatek,mt8183-mdp-rsz";
+			mediatek,mdp-id = <1>;
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		};
+
+		mdp_wrot0: mdp_wrot0@14005000 {
+			compatible = "mediatek,mt8183-mdp-wrot";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14005000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_WROT0>;
+			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		mdp_path0_sout@14005000 {
+			compatible = "mediatek,mt8183-mdp-path";
+			mediatek,mdp-id = <0>;
+		};
+
+		mdp_wdma: mdp_wdma@14006000 {
+			compatible = "mediatek,mt8183-mdp-wdma";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14006000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		mdp_path1_sout@14006000 {
+			compatible = "mediatek,mt8183-mdp-path";
+			mediatek,mdp-id = <1>;
+		};
+
 		smi_common: smi@14019000 {
 			compatible = "mediatek,mt8183-smi-common", "syscon";
 			reg = <0 0x14019000 0 0x1000>;
 		};
 
+		mdp_ccorr: mdp_ccorr@1401c000 {
+			compatible = "mediatek,mt8183-mdp-ccorr";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x1401c000 0 0x1000>;
+			mediatek,gce-client-reg =
+					<&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_CCORR>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
2.18.0

