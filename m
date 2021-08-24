Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFCD3F5B7F
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 12:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbhHXKBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 06:01:19 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:43024 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235566AbhHXKBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 06:01:18 -0400
X-UUID: 322b4236e3aa4e25b7d96b9e6fe24009-20210824
X-UUID: 322b4236e3aa4e25b7d96b9e6fe24009-20210824
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 633261771; Tue, 24 Aug 2021 18:00:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:00:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 18:00:29 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Subject: [PATCH v7 4/5] dts: arm64: mt8183: Add Mediatek MDP3 nodes
Date:   Tue, 24 Aug 2021 18:00:26 +0800
Message-ID: <20210824100027.25989-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210824100027.25989-1-moudy.ho@mediatek.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device nodes for Media Data Path 3 (MDP3) modules.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c08..067cfb0d6621 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1232,6 +1232,82 @@
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		mdp3_rdma0: mdp3_rdma0@14001000 {
+			compatible = "mediatek,mt8183-mdp3",
+				     "mediatek,mt8183-mdp3-rdma";
+			mediatek,scp = <&scp>;
+			mediatek,mdp3-id = <0>;
+			mdp3-comps = "mediatek,mt8183-mdp3-dl1", "mediatek,mt8183-mdp3-dl2",
+				     "mediatek,mt8183-mdp3-path1", "mediatek,mt8183-mdp3-path2",
+				     "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
+			mdp3-comp-ids = <0 1 0 1 0 1>;
+			reg = <0 0x14001000 0 0x1000>,
+			      <0 0x14000000 0 0x1000>,
+			      <0 0x14005000 0 0x1000>,
+			      <0 0x14006000 0 0x1000>,
+			      <0 0x15020000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
+						  <&gce SUBSYS_1400XXXX 0 0x1000>,
+						  <&gce SUBSYS_1400XXXX 0x5000 0x1000>,
+						  <&gce SUBSYS_1400XXXX 0x6000 0x1000>,
+						  <&gce SUBSYS_1502XXXX 0 0x1000>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+				 <&mmsys CLK_MM_MDP_RSZ1>,
+				 <&mmsys CLK_MM_MDP_DL_TXCK>,
+				 <&mmsys CLK_MM_MDP_DL_RX>,
+				 <&mmsys CLK_MM_IPU_DL_TXCK>,
+				 <&mmsys CLK_MM_IPU_DL_RX>;
+			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+			mediatek,mmsys = <&mmsys>;
+			mediatek,mm-mutex = <&mutex>;
+			mediatek,mailbox-gce = <&gce>;
+			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
+			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+				     <&gce 0x14010000 SUBSYS_1401XXXX>,
+				     <&gce 0x14020000 SUBSYS_1402XXXX>,
+				     <&gce 0x15020000 SUBSYS_1502XXXX>;
+		};
+
+		mdp3_rsz0: mdp3_rsz0@14003000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			mediatek,mdp3-id = <0>;
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		};
+
+		mdp3_rsz1: mdp3_rsz1@14004000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			mediatek,mdp3-id = <1>;
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		};
+
+		mdp3_wrot0: mdp3_wrot0@14005000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			mediatek,mdp3-id = <0>;
+			reg = <0 0x14005000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_WROT0>;
+			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+		};
+
+		mdp3_wdma: mdp3_wdma@14006000 {
+			compatible = "mediatek,mt8183-mdp3-wdma";
+			mediatek,mdp3-id = <0>;
+			reg = <0 0x14006000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
+		};
+
 		ovl0: ovl@14008000 {
 			compatible = "mediatek,mt8183-disp-ovl";
 			reg = <0 0x14008000 0 0x1000>;
@@ -1355,6 +1431,32 @@
 			reg = <0 0x14016000 0 0x1000>;
 			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
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
 		};
 
 		larb0: larb@14017000 {
@@ -1378,6 +1480,14 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 		};
 
+		mdp3_ccorr: mdp3_ccorr@1401c000 {
+			compatible = "mediatek,mt8183-mdp3-ccorr";
+			mediatek,mdp3-id = <0>;
+			reg = <0 0x1401c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_CCORR>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
2.18.0

