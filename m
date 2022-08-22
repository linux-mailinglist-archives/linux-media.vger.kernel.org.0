Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5B959B7EB
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 05:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiHVDZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 23:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiHVDZR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 23:25:17 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992E11A81E;
        Sun, 21 Aug 2022 20:25:09 -0700 (PDT)
X-UUID: 7b605b13af1a4d94ac5c7f855c4e0b1a-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tjf6H6IThMSCMLkSgMB4FlCL8HQC6Ruzd1YbmB9axXU=;
        b=jOIytJrJRee2jQiwYUA0n9Fdm09/zrzojv0cyoB2WBBuLRGnMSkglfLxWSBrPcIaAIv6b/zeEY9Y5MMW1DSwPgoDXviphW2XgOW/6QUHO8XNLrBBtlOnlwJ6YzHNiojd/gEzOj/mszUO/1LVftlNlHkZclG8UaYoBSMhDJLkmhg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:33dbac1d-e57c-4eb6-88b1-1847ce66b86b,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
        Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:83912dcf-20bd-4e5e-ace8-00692b7ab380,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7b605b13af1a4d94ac5c7f855c4e0b1a-20220822
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2032864299; Mon, 22 Aug 2022 11:25:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 11:25:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 22 Aug 2022 11:25:02 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <pihsun@chromium.org>, <hsinyi@google.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <cellopoint.kai@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v27 3/4] arm64: dts: mt8183: add MediaTek MDP3 nodes
Date:   Mon, 22 Aug 2022 11:25:00 +0800
Message-ID: <20220822032501.15418-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220822032501.15418-1-moudy.ho@mediatek.com>
References: <20220822032501.15418-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device nodes for Media Data Path 3 (MDP3) modules.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..1543876b1e3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1691,6 +1691,60 @@
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		mdp3-rdma0@14001000 {
+			compatible = "mediatek,mt8183-mdp3-rdma";
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_RDMA0_EOF>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+				 <&mmsys CLK_MM_MDP_RSZ1>;
+			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>;
+		};
+
+		mdp3-rsz0@14003000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RSZ0_SOF>,
+					      <CMDQ_EVENT_MDP_RSZ0_EOF>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		};
+
+		mdp3-rsz1@14004000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RSZ1_SOF>,
+					      <CMDQ_EVENT_MDP_RSZ1_EOF>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		};
+
+		mdp3-wrot0@14005000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14005000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_WROT0_SOF>,
+					      <CMDQ_EVENT_MDP_WROT0_EOF>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_WROT0>;
+			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+		};
+
+		mdp3-wdma@14006000 {
+			compatible = "mediatek,mt8183-mdp3-wdma";
+			reg = <0 0x14006000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_WDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_WDMA0_EOF>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
+		};
+
 		ovl0: ovl@14008000 {
 			compatible = "mediatek,mt8183-disp-ovl";
 			reg = <0 0x14008000 0 0x1000>;
@@ -1834,6 +1888,15 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 		};
 
+		mdp3-ccorr@1401c000 {
+			compatible = "mediatek,mt8183-mdp3-ccorr";
+			reg = <0 0x1401c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_CCORR_SOF>,
+					      <CMDQ_EVENT_MDP_CCORR_EOF>;
+			clocks = <&mmsys CLK_MM_MDP_CCORR>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
2.18.0

