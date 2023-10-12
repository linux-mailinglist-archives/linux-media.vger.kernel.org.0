Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117757C6927
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 11:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbjJLJMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 05:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235478AbjJLJMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 05:12:25 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC73C9;
        Thu, 12 Oct 2023 02:12:21 -0700 (PDT)
X-UUID: 6c1743f668df11ee8051498923ad61e6-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0XPTl4/2TL0xFHGL6FzRNSjKjR7rkqIBHEZw4bv3mio=;
        b=bgzqLPuplC+w8TVaCPaUnaCRx5sKlMzviiI05nzJ6wqagKx+4jlI38mSUS7x7MWJegNHpXICC95RcPQkuVdUjX4dfo1KGqQBUrtFYklQPUY6lAxlBmCf2ACVfNuS71k2+GFGuyKh7XHq1QMU3S0abocopV9mpZ8rTKrPj/q5N3M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:d1fc8310-5716-4cb8-9f96-1009873a3d36,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:015b0ac4-1e57-4345-9d31-31ad9818b39f,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6c1743f668df11ee8051498923ad61e6-20231012
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1510270969; Thu, 12 Oct 2023 17:12:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 17:12:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 17:12:08 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v7 09/12] media: platform: mtk-mdp3: add mt8195 platform configuration
Date:   Thu, 12 Oct 2023 17:12:03 +0800
Message-ID: <20231012091206.20165-10-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012091206.20165-1-moudy.ho@mediatek.com>
References: <20231012091206.20165-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MT8195 MDP3 basic configuration in file "mdp_cfg_data.c"
and corresponding driver data.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mdp_cfg_data.c     | 666 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    |  36 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   6 +
 6 files changed, 713 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index 3834efe54e17..9ee3931d31e3 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -46,12 +46,91 @@ enum mt8183_mdp_comp_id {
 	MT8183_MDP_COMP_WROT1,          /* 25 */
 };
 
+enum mt8195_mdp_comp_id {
+	/* MT8195 Comp id */
+	/* ISP */
+	MT8195_MDP_COMP_WPEI = 0,
+	MT8195_MDP_COMP_WPEO,           /* 1 */
+	MT8195_MDP_COMP_WPEI2,          /* 2 */
+	MT8195_MDP_COMP_WPEO2,          /* 3 */
+
+	/* MDP */
+	MT8195_MDP_COMP_CAMIN,          /* 4 */
+	MT8195_MDP_COMP_CAMIN2,         /* 5 */
+	MT8195_MDP_COMP_SPLIT,          /* 6 */
+	MT8195_MDP_COMP_SPLIT2,         /* 7 */
+	MT8195_MDP_COMP_RDMA0,          /* 8 */
+	MT8195_MDP_COMP_RDMA1,          /* 9 */
+	MT8195_MDP_COMP_RDMA2,          /* 10 */
+	MT8195_MDP_COMP_RDMA3,          /* 11 */
+	MT8195_MDP_COMP_STITCH,         /* 12 */
+	MT8195_MDP_COMP_FG0,            /* 13 */
+	MT8195_MDP_COMP_FG1,            /* 14 */
+	MT8195_MDP_COMP_FG2,            /* 15 */
+	MT8195_MDP_COMP_FG3,            /* 16 */
+	MT8195_MDP_COMP_TO_SVPP2MOUT,   /* 17 */
+	MT8195_MDP_COMP_TO_SVPP3MOUT,   /* 18 */
+	MT8195_MDP_COMP_TO_WARP0MOUT,   /* 19 */
+	MT8195_MDP_COMP_TO_WARP1MOUT,   /* 20 */
+	MT8195_MDP_COMP_VPP0_SOUT,      /* 21 */
+	MT8195_MDP_COMP_VPP1_SOUT,      /* 22 */
+	MT8195_MDP_COMP_PQ0_SOUT,       /* 23 */
+	MT8195_MDP_COMP_PQ1_SOUT,       /* 24 */
+	MT8195_MDP_COMP_HDR0,           /* 25 */
+	MT8195_MDP_COMP_HDR1,           /* 26 */
+	MT8195_MDP_COMP_HDR2,           /* 27 */
+	MT8195_MDP_COMP_HDR3,           /* 28 */
+	MT8195_MDP_COMP_AAL0,           /* 29 */
+	MT8195_MDP_COMP_AAL1,           /* 30 */
+	MT8195_MDP_COMP_AAL2,           /* 31 */
+	MT8195_MDP_COMP_AAL3,           /* 32 */
+	MT8195_MDP_COMP_RSZ0,           /* 33 */
+	MT8195_MDP_COMP_RSZ1,           /* 34 */
+	MT8195_MDP_COMP_RSZ2,           /* 35 */
+	MT8195_MDP_COMP_RSZ3,           /* 36 */
+	MT8195_MDP_COMP_TDSHP0,         /* 37 */
+	MT8195_MDP_COMP_TDSHP1,         /* 38 */
+	MT8195_MDP_COMP_TDSHP2,         /* 39 */
+	MT8195_MDP_COMP_TDSHP3,         /* 40 */
+	MT8195_MDP_COMP_COLOR0,         /* 41 */
+	MT8195_MDP_COMP_COLOR1,         /* 42 */
+	MT8195_MDP_COMP_COLOR2,         /* 43 */
+	MT8195_MDP_COMP_COLOR3,         /* 44 */
+	MT8195_MDP_COMP_OVL0,           /* 45 */
+	MT8195_MDP_COMP_OVL1,           /* 46 */
+	MT8195_MDP_COMP_PAD0,           /* 47 */
+	MT8195_MDP_COMP_PAD1,           /* 48 */
+	MT8195_MDP_COMP_PAD2,           /* 49 */
+	MT8195_MDP_COMP_PAD3,           /* 50 */
+	MT8195_MDP_COMP_TCC0,           /* 51 */
+	MT8195_MDP_COMP_TCC1,           /* 52 */
+	MT8195_MDP_COMP_WROT0,          /* 53 */
+	MT8195_MDP_COMP_WROT1,          /* 54 */
+	MT8195_MDP_COMP_WROT2,          /* 55 */
+	MT8195_MDP_COMP_WROT3,          /* 56 */
+	MT8195_MDP_COMP_MERGE2,         /* 57 */
+	MT8195_MDP_COMP_MERGE3,         /* 58 */
+
+	MT8195_MDP_COMP_VDO0DL0,        /* 59 */
+	MT8195_MDP_COMP_VDO1DL0,        /* 60 */
+	MT8195_MDP_COMP_VDO0DL1,        /* 61 */
+	MT8195_MDP_COMP_VDO1DL1,        /* 62 */
+};
+
 static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
 	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
 	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
 	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
 };
 
+static const struct of_device_id mt8195_mdp_probe_infra[MDP_INFRA_MAX] = {
+	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8195-vppsys0" },
+	[MDP_INFRA_MMSYS2] = { .compatible = "mediatek,mt8195-vppsys1" },
+	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8195-vpp-mutex" },
+	[MDP_INFRA_MUTEX2] = { .compatible = "mediatek,mt8195-vpp-mutex" },
+	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8195-scp" }
+};
+
 static const struct mdp_platform_config mt8183_plat_cfg = {
 	.rdma_support_10bit		= true,
 	.rdma_rsz1_sram_sharing		= true,
@@ -62,6 +141,21 @@ static const struct mdp_platform_config mt8183_plat_cfg = {
 	.wrot_event_num			= 1,
 };
 
+static const struct mdp_platform_config mt8195_plat_cfg = {
+	.rdma_support_10bit             = true,
+	.rdma_rsz1_sram_sharing         = false,
+	.rdma_upsample_repeat_only      = false,
+	.rdma_esl_setting		= true,
+	.rdma_event_num			= 4,
+	.rsz_disable_dcm_small_sample   = false,
+	.rsz_etc_control		= true,
+	.wrot_filter_constraint		= false,
+	.wrot_event_num			= 4,
+	.tdshp_hist_num			= 17,
+	.tdshp_constrain		= true,
+	.tdshp_contour			= true,
+};
+
 static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
 	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
@@ -73,6 +167,52 @@ static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_CCORR0] = MUTEX_MOD_IDX_MDP_CCORR0,
 };
 
+static const u32 mt8195_mutex_idx[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
+	[MDP_COMP_RDMA1] = MUTEX_MOD_IDX_MDP_RDMA1,
+	[MDP_COMP_RDMA2] = MUTEX_MOD_IDX_MDP_RDMA2,
+	[MDP_COMP_RDMA3] = MUTEX_MOD_IDX_MDP_RDMA3,
+	[MDP_COMP_STITCH] = MUTEX_MOD_IDX_MDP_STITCH0,
+	[MDP_COMP_FG0] = MUTEX_MOD_IDX_MDP_FG0,
+	[MDP_COMP_FG1] = MUTEX_MOD_IDX_MDP_FG1,
+	[MDP_COMP_FG2] = MUTEX_MOD_IDX_MDP_FG2,
+	[MDP_COMP_FG3] = MUTEX_MOD_IDX_MDP_FG3,
+	[MDP_COMP_HDR0] = MUTEX_MOD_IDX_MDP_HDR0,
+	[MDP_COMP_HDR1] = MUTEX_MOD_IDX_MDP_HDR1,
+	[MDP_COMP_HDR2] = MUTEX_MOD_IDX_MDP_HDR2,
+	[MDP_COMP_HDR3] = MUTEX_MOD_IDX_MDP_HDR3,
+	[MDP_COMP_AAL0] = MUTEX_MOD_IDX_MDP_AAL0,
+	[MDP_COMP_AAL1] = MUTEX_MOD_IDX_MDP_AAL1,
+	[MDP_COMP_AAL2] = MUTEX_MOD_IDX_MDP_AAL2,
+	[MDP_COMP_AAL3] = MUTEX_MOD_IDX_MDP_AAL3,
+	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
+	[MDP_COMP_RSZ1] = MUTEX_MOD_IDX_MDP_RSZ1,
+	[MDP_COMP_RSZ2] = MUTEX_MOD_IDX_MDP_RSZ2,
+	[MDP_COMP_RSZ3] = MUTEX_MOD_IDX_MDP_RSZ3,
+	[MDP_COMP_MERGE2] = MUTEX_MOD_IDX_MDP_MERGE2,
+	[MDP_COMP_MERGE3] = MUTEX_MOD_IDX_MDP_MERGE3,
+	[MDP_COMP_TDSHP0] = MUTEX_MOD_IDX_MDP_TDSHP0,
+	[MDP_COMP_TDSHP1] = MUTEX_MOD_IDX_MDP_TDSHP1,
+	[MDP_COMP_TDSHP2] = MUTEX_MOD_IDX_MDP_TDSHP2,
+	[MDP_COMP_TDSHP3] = MUTEX_MOD_IDX_MDP_TDSHP3,
+	[MDP_COMP_COLOR0] = MUTEX_MOD_IDX_MDP_COLOR0,
+	[MDP_COMP_COLOR1] = MUTEX_MOD_IDX_MDP_COLOR1,
+	[MDP_COMP_COLOR2] = MUTEX_MOD_IDX_MDP_COLOR2,
+	[MDP_COMP_COLOR3] = MUTEX_MOD_IDX_MDP_COLOR3,
+	[MDP_COMP_OVL0] = MUTEX_MOD_IDX_MDP_OVL0,
+	[MDP_COMP_OVL1] = MUTEX_MOD_IDX_MDP_OVL1,
+	[MDP_COMP_PAD0] = MUTEX_MOD_IDX_MDP_PAD0,
+	[MDP_COMP_PAD1] = MUTEX_MOD_IDX_MDP_PAD1,
+	[MDP_COMP_PAD2] = MUTEX_MOD_IDX_MDP_PAD2,
+	[MDP_COMP_PAD3] = MUTEX_MOD_IDX_MDP_PAD3,
+	[MDP_COMP_TCC0] = MUTEX_MOD_IDX_MDP_TCC0,
+	[MDP_COMP_TCC1] = MUTEX_MOD_IDX_MDP_TCC1,
+	[MDP_COMP_WROT0] = MUTEX_MOD_IDX_MDP_WROT0,
+	[MDP_COMP_WROT1] = MUTEX_MOD_IDX_MDP_WROT1,
+	[MDP_COMP_WROT2] = MUTEX_MOD_IDX_MDP_WROT2,
+	[MDP_COMP_WROT3] = MUTEX_MOD_IDX_MDP_WROT3,
+};
+
 static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_WPEI] = {
 		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI, MDP_MM_SUBSYS_0},
@@ -148,6 +288,263 @@ static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
 	},
 };
 
+static const struct mdp_comp_data mt8195_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_WPEI] = {
+		{MDP_COMP_TYPE_WPEI, 0, MT8195_MDP_COMP_WPEI, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEO] = {
+		{MDP_COMP_TYPE_EXTO, 2, MT8195_MDP_COMP_WPEO, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEI2] = {
+		{MDP_COMP_TYPE_WPEI, 1, MT8195_MDP_COMP_WPEI2, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEO2] = {
+		{MDP_COMP_TYPE_EXTO, 3, MT8195_MDP_COMP_WPEO2, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_CAMIN] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_CAMIN, MDP_MM_SUBSYS_0},
+		{3, 3, 0}
+	},
+	[MDP_COMP_CAMIN2] = {
+		{MDP_COMP_TYPE_DL_PATH, 1, MT8195_MDP_COMP_CAMIN2, MDP_MM_SUBSYS_0},
+		{3, 6, 0}
+	},
+	[MDP_COMP_SPLIT] = {
+		{MDP_COMP_TYPE_SPLIT, 0, MT8195_MDP_COMP_SPLIT, MDP_MM_SUBSYS_1},
+		{7, 0, 0}
+	},
+	[MDP_COMP_SPLIT2] = {
+		{MDP_COMP_TYPE_SPLIT, 1, MT8195_MDP_COMP_SPLIT2, MDP_MM_SUBSYS_1},
+		{7, 0, 0}
+	},
+	[MDP_COMP_RDMA0] = {
+		{MDP_COMP_TYPE_RDMA, 0, MT8195_MDP_COMP_RDMA0, MDP_MM_SUBSYS_0},
+		{3, 0, 0}
+	},
+	[MDP_COMP_RDMA1] = {
+		{MDP_COMP_TYPE_RDMA, 1, MT8195_MDP_COMP_RDMA1, MDP_MM_SUBSYS_1},
+		{3, 0, 0}
+	},
+	[MDP_COMP_RDMA2] = {
+		{MDP_COMP_TYPE_RDMA, 2, MT8195_MDP_COMP_RDMA2, MDP_MM_SUBSYS_1},
+		{3, 0, 0}
+	},
+	[MDP_COMP_RDMA3] = {
+		{MDP_COMP_TYPE_RDMA, 3, MT8195_MDP_COMP_RDMA3, MDP_MM_SUBSYS_1},
+		{3, 0, 0}
+	},
+	[MDP_COMP_STITCH] = {
+		{MDP_COMP_TYPE_STITCH, 0, MT8195_MDP_COMP_STITCH, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG0] = {
+		{MDP_COMP_TYPE_FG, 0, MT8195_MDP_COMP_FG0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG1] = {
+		{MDP_COMP_TYPE_FG, 1, MT8195_MDP_COMP_FG1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG2] = {
+		{MDP_COMP_TYPE_FG, 2, MT8195_MDP_COMP_FG2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG3] = {
+		{MDP_COMP_TYPE_FG, 3, MT8195_MDP_COMP_FG3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR0] = {
+		{MDP_COMP_TYPE_HDR, 0, MT8195_MDP_COMP_HDR0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR1] = {
+		{MDP_COMP_TYPE_HDR, 1, MT8195_MDP_COMP_HDR1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR2] = {
+		{MDP_COMP_TYPE_HDR, 2, MT8195_MDP_COMP_HDR2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR3] = {
+		{MDP_COMP_TYPE_HDR, 3, MT8195_MDP_COMP_HDR3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL0] = {
+		{MDP_COMP_TYPE_AAL, 0, MT8195_MDP_COMP_AAL0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL1] = {
+		{MDP_COMP_TYPE_AAL, 1, MT8195_MDP_COMP_AAL1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL2] = {
+		{MDP_COMP_TYPE_AAL, 2, MT8195_MDP_COMP_AAL2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL3] = {
+		{MDP_COMP_TYPE_AAL, 3, MT8195_MDP_COMP_AAL3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_RSZ0] = {
+		{MDP_COMP_TYPE_RSZ, 0, MT8195_MDP_COMP_RSZ0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_RSZ1] = {
+		{MDP_COMP_TYPE_RSZ, 1, MT8195_MDP_COMP_RSZ1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_RSZ2] = {
+		{MDP_COMP_TYPE_RSZ, 2, MT8195_MDP_COMP_RSZ2, MDP_MM_SUBSYS_1},
+		{2, 0, 0},
+		{MDP_COMP_MERGE2, true, true}
+	},
+	[MDP_COMP_RSZ3] = {
+		{MDP_COMP_TYPE_RSZ, 3, MT8195_MDP_COMP_RSZ3, MDP_MM_SUBSYS_1},
+		{2, 0, 0},
+		{MDP_COMP_MERGE3, true, true}
+	},
+	[MDP_COMP_TDSHP0] = {
+		{MDP_COMP_TYPE_TDSHP, 0, MT8195_MDP_COMP_TDSHP0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TDSHP1] = {
+		{MDP_COMP_TYPE_TDSHP, 1, MT8195_MDP_COMP_TDSHP1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TDSHP2] = {
+		{MDP_COMP_TYPE_TDSHP, 2, MT8195_MDP_COMP_TDSHP2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TDSHP3] = {
+		{MDP_COMP_TYPE_TDSHP, 3, MT8195_MDP_COMP_TDSHP3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR0] = {
+		{MDP_COMP_TYPE_COLOR, 0, MT8195_MDP_COMP_COLOR0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR1] = {
+		{MDP_COMP_TYPE_COLOR, 1, MT8195_MDP_COMP_COLOR1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR2] = {
+		{MDP_COMP_TYPE_COLOR, 2, MT8195_MDP_COMP_COLOR2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR3] = {
+		{MDP_COMP_TYPE_COLOR, 3, MT8195_MDP_COMP_COLOR3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_OVL0] = {
+		{MDP_COMP_TYPE_OVL, 0, MT8195_MDP_COMP_OVL0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_OVL1] = {
+		{MDP_COMP_TYPE_OVL, 1, MT8195_MDP_COMP_OVL1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD0] = {
+		{MDP_COMP_TYPE_PAD, 0, MT8195_MDP_COMP_PAD0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD1] = {
+		{MDP_COMP_TYPE_PAD, 1, MT8195_MDP_COMP_PAD1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD2] = {
+		{MDP_COMP_TYPE_PAD, 2, MT8195_MDP_COMP_PAD2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD3] = {
+		{MDP_COMP_TYPE_PAD, 3, MT8195_MDP_COMP_PAD3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TCC0] = {
+		{MDP_COMP_TYPE_TCC, 0, MT8195_MDP_COMP_TCC0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TCC1] = {
+		{MDP_COMP_TYPE_TCC, 1, MT8195_MDP_COMP_TCC1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT0] = {
+		{MDP_COMP_TYPE_WROT, 0, MT8195_MDP_COMP_WROT0, MDP_MM_SUBSYS_0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT1] = {
+		{MDP_COMP_TYPE_WROT, 1, MT8195_MDP_COMP_WROT1, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT2] = {
+		{MDP_COMP_TYPE_WROT, 2, MT8195_MDP_COMP_WROT2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT3] = {
+		{MDP_COMP_TYPE_WROT, 3, MT8195_MDP_COMP_WROT3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_MERGE2] = {
+		{MDP_COMP_TYPE_MERGE, 0, MT8195_MDP_COMP_MERGE2, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_MERGE3] = {
+		{MDP_COMP_TYPE_MERGE, 1, MT8195_MDP_COMP_MERGE3, MDP_MM_SUBSYS_1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PQ0_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 0, MT8195_MDP_COMP_PQ0_SOUT, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_PQ1_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 1, MT8195_MDP_COMP_PQ1_SOUT, MDP_MM_SUBSYS_1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_WARP0MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 2, MT8195_MDP_COMP_TO_WARP0MOUT, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_WARP1MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 3, MT8195_MDP_COMP_TO_WARP1MOUT, MDP_MM_SUBSYS_0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_SVPP2MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 4, MT8195_MDP_COMP_TO_SVPP2MOUT, MDP_MM_SUBSYS_1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_SVPP3MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 5, MT8195_MDP_COMP_TO_SVPP3MOUT, MDP_MM_SUBSYS_1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_VPP0_SOUT] = {
+		{MDP_COMP_TYPE_PATH, 0, MT8195_MDP_COMP_VPP0_SOUT, MDP_MM_SUBSYS_1},
+		{4, 9, 0}
+	},
+	[MDP_COMP_VPP1_SOUT] = {
+		{MDP_COMP_TYPE_PATH, 1, MT8195_MDP_COMP_VPP1_SOUT, MDP_MM_SUBSYS_0},
+		{2, 13, 0}
+	},
+	[MDP_COMP_VDO0DL0] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO0DL0, MDP_MM_SUBSYS_1},
+		{1, 15, 0}
+	},
+	[MDP_COMP_VDO1DL0] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO1DL0, MDP_MM_SUBSYS_1},
+		{1, 17, 0}
+	},
+	[MDP_COMP_VDO0DL1] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO0DL1, MDP_MM_SUBSYS_1},
+		{1, 18, 0}
+	},
+	[MDP_COMP_VDO1DL1] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO1DL1, MDP_MM_SUBSYS_1},
+		{1, 16, 0}
+	},
+};
+
 static const struct of_device_id mt8183_sub_comp_dt_ids[] = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-wdma",
@@ -159,6 +556,10 @@ static const struct of_device_id mt8183_sub_comp_dt_ids[] = {
 	{}
 };
 
+static const struct of_device_id mt8195_sub_comp_dt_ids[] = {
+	{}
+};
+
 /*
  * All 10-bit related formats are not added in the basic format list,
  * please add the corresponding format settings before use.
@@ -384,6 +785,222 @@ static const struct mdp_format mt8183_formats[] = {
 	}
 };
 
+static const struct mdp_format mt8195_formats[] = {
+	{
+		.pixelformat	= V4L2_PIX_FMT_GREY,
+		.mdp_color	= MDP_COLOR_GREY,
+		.depth		= { 8 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565X,
+		.mdp_color	= MDP_COLOR_BGR565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.mdp_color	= MDP_COLOR_RGB565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB24,
+		.mdp_color	= MDP_COLOR_RGB888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_BGR24,
+		.mdp_color	= MDP_COLOR_BGR888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ABGR32,
+		.mdp_color	= MDP_COLOR_BGRA8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ARGB32,
+		.mdp_color	= MDP_COLOR_ARGB8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mdp_color	= MDP_COLOR_UYVY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mdp_color	= MDP_COLOR_VYUY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mdp_color	= MDP_COLOR_YUYV,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mdp_color	= MDP_COLOR_YVYU,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MM21,
+		.mdp_color	= MDP_COLOR_420_BLK,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 6,
+		.halign		= 6,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21M,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16M,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61M,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV422M,
+		.mdp_color	= MDP_COLOR_I422,
+		.depth		= { 8, 4, 4 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU422M,
+		.mdp_color	= MDP_COLOR_YV16,
+		.depth		= { 8, 4, 4 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}
+};
+
 static const struct mdp_limit mt8183_mdp_def_limit = {
 	.out_limit = {
 		.wmin	= 16,
@@ -403,6 +1020,25 @@ static const struct mdp_limit mt8183_mdp_def_limit = {
 	.v_scale_down_max = 128,
 };
 
+static const struct mdp_limit mt8195_mdp_def_limit = {
+	.out_limit = {
+		.wmin	= 64,
+		.hmin	= 64,
+		.wmax	= 8192,
+		.hmax	= 8192,
+	},
+	.cap_limit = {
+		.wmin	= 64,
+		.hmin	= 64,
+		.wmax	= 8192,
+		.hmax	= 8192,
+	},
+	.h_scale_up_max = 64,
+	.v_scale_up_max = 64,
+	.h_scale_down_max = 128,
+	.v_scale_down_max = 128,
+};
+
 static const struct mdp_pipe_info mt8183_pipe_info[] = {
 	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, MDP_MM_SUBSYS_0, 0},
 	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, MDP_MM_SUBSYS_0, 1},
@@ -410,6 +1046,20 @@ static const struct mdp_pipe_info mt8183_pipe_info[] = {
 	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, MDP_MM_SUBSYS_0, 3}
 };
 
+static const struct mdp_pipe_info mt8195_pipe_info[] = {
+	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, MDP_MM_SUBSYS_0, 0},
+	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, MDP_MM_SUBSYS_0, 1},
+	[MDP_PIPE_IMGI] = {MDP_PIPE_IMGI, MDP_MM_SUBSYS_0, 2},
+	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, MDP_MM_SUBSYS_0, 3},
+	[MDP_PIPE_RDMA1] = {MDP_PIPE_RDMA1, MDP_MM_SUBSYS_1, 0},
+	[MDP_PIPE_RDMA2] = {MDP_PIPE_RDMA2, MDP_MM_SUBSYS_1, 1},
+	[MDP_PIPE_RDMA3] = {MDP_PIPE_RDMA3, MDP_MM_SUBSYS_1, 2},
+	[MDP_PIPE_SPLIT] = {MDP_PIPE_SPLIT, MDP_MM_SUBSYS_1, 3},
+	[MDP_PIPE_SPLIT2] = {MDP_PIPE_SPLIT2, MDP_MM_SUBSYS_1, 4},
+	[MDP_PIPE_VPP1_SOUT] = {MDP_PIPE_VPP1_SOUT, MDP_MM_SUBSYS_0, 4},
+	[MDP_PIPE_VPP0_SOUT] = {MDP_PIPE_VPP0_SOUT, MDP_MM_SUBSYS_1, 5},
+};
+
 const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_plat_id = MT8183,
 	.mdp_con_res = 0x14001000,
@@ -426,6 +1076,22 @@ const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.pipe_info_len = ARRAY_SIZE(mt8183_pipe_info),
 };
 
+const struct mtk_mdp_driver_data mt8195_mdp_driver_data = {
+	.mdp_plat_id = MT8195,
+	.mdp_con_res = 0x14001000,
+	.mdp_probe_infra = mt8195_mdp_probe_infra,
+	.mdp_sub_comp_dt_ids = mt8195_sub_comp_dt_ids,
+	.mdp_cfg = &mt8195_plat_cfg,
+	.mdp_mutex_table_idx = mt8195_mutex_idx,
+	.comp_data = mt8195_mdp_comp_data,
+	.comp_data_len = ARRAY_SIZE(mt8195_mdp_comp_data),
+	.format = mt8195_formats,
+	.format_len = ARRAY_SIZE(mt8195_formats),
+	.def_limit = &mt8195_mdp_def_limit,
+	.pipe_info = mt8195_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8195_pipe_info),
+};
+
 s32 mdp_cfg_get_id_inner(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id)
 {
 	if (!mdp_dev)
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
index 22b8b9a10ef7..08fb0853bcd5 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
@@ -115,6 +115,7 @@ struct img_frameparam {
 
 /* Platform config indicator */
 #define MT8183 8183
+#define MT8195 8195
 
 #define CFG_CHECK(plat, p_id) ((plat) == (p_id))
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
index dfffc72868e4..49cdf45f6e59 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 
 extern const struct mtk_mdp_driver_data mt8183_mdp_driver_data;
+extern const struct mtk_mdp_driver_data mt8195_mdp_driver_data;
 
 struct mdp_dev;
 enum mtk_mdp_comp_id;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index b942cc3a1865..81be7a5c5483 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -773,6 +773,42 @@ static const struct of_device_id mdp_comp_dt_ids[] __maybe_unused = {
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-wdma",
 		.data = (void *)MDP_COMP_TYPE_WDMA,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rdma",
+		.data = (void *)MDP_COMP_TYPE_RDMA,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-split",
+		.data = (void *)MDP_COMP_TYPE_SPLIT,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-stitch",
+		.data = (void *)MDP_COMP_TYPE_STITCH,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg",
+		.data = (void *)MDP_COMP_TYPE_FG,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr",
+		.data = (void *)MDP_COMP_TYPE_HDR,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal",
+		.data = (void *)MDP_COMP_TYPE_AAL,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-merge",
+		.data = (void *)MDP_COMP_TYPE_MERGE,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp",
+		.data = (void *)MDP_COMP_TYPE_TDSHP,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color",
+		.data = (void *)MDP_COMP_TYPE_COLOR,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-ovl",
+		.data = (void *)MDP_COMP_TYPE_OVL,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad",
+		.data = (void *)MDP_COMP_TYPE_PAD,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tcc",
+		.data = (void *)MDP_COMP_TYPE_TCC,
 	},
 	{}
 };
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index b214510ac42d..2b4aacbf9241 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -21,6 +21,9 @@ static const struct of_device_id mdp_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mdp3-rdma",
 	  .data = &mt8183_mdp_driver_data,
 	},
+	{ .compatible = "mediatek,mt8195-mdp3-rdma",
+	  .data = &mt8195_mdp_driver_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mdp_of_ids);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index e57c415a1c78..d6484d17b09f 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -49,10 +49,16 @@ struct mdp_platform_config {
 	bool	rdma_support_10bit;
 	bool	rdma_rsz1_sram_sharing;
 	bool	rdma_upsample_repeat_only;
+	bool	rdma_esl_setting;
 	u32	rdma_event_num;
 	bool	rsz_disable_dcm_small_sample;
+	bool	rsz_etc_control;
 	bool	wrot_filter_constraint;
+	bool	wrot_support_10bit;
 	u32	wrot_event_num;
+	u32	tdshp_hist_num;
+	bool	tdshp_constrain;
+	bool	tdshp_contour;
 };
 
 /* indicate which mutex is used by each pipepline */
-- 
2.18.0

