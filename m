Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA542F110
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 14:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbhJOMlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 08:41:14 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50544 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235967AbhJOMk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 08:40:59 -0400
X-UUID: c900bb6a7b89405eb36bd83d3c47f59f-20211015
X-UUID: c900bb6a7b89405eb36bd83d3c47f59f-20211015
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 921389298; Fri, 15 Oct 2021 20:38:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 15 Oct 2021 20:38:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Oct 2021 20:38:47 +0800
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
        <sj.huang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Subject: [PATCH v8 2/7] soc: mediatek: mmsys: add support for ISP control
Date:   Fri, 15 Oct 2021 20:38:27 +0800
Message-ID: <20211015123832.17914-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211015123832.17914-1-moudy.ho@mediatek.com>
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds 8183 ISP settings in MMSYS domain and interface.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/soc/mediatek/mt8183-mmsys.h    |  16 ++++
 drivers/soc/mediatek/mtk-mmsys.c       | 108 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h       |   1 +
 include/linux/soc/mediatek/mtk-mmsys.h |  25 ++++++
 4 files changed, 150 insertions(+)

diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
index 663f196fc4e7..c490cc1b1072 100644
--- a/drivers/soc/mediatek/mt8183-mmsys.h
+++ b/drivers/soc/mediatek/mt8183-mmsys.h
@@ -32,6 +32,13 @@
 #define MT8183_MDP_CCORR_SEL_IN			0xff0
 #define MT8183_MDP_CCORR_SOUT_SEL		0xff4
 
+#define MT8183_ISP_CTRL_MMSYS_SW0_RST_B		0x140
+#define MT8183_ISP_CTRL_MMSYS_SW1_RST_B		0x144
+#define MT8183_ISP_CTRL_MDP_ASYNC_CFG_WD	0x934
+#define MT8183_ISP_CTRL_MDP_ASYNC_IPU_CFG_WD	0x93C
+#define MT8183_ISP_CTRL_ISP_RELAY_CFG_WD	0x994
+#define MT8183_ISP_CTRL_IPU_RELAY_CFG_WD	0x9a0
+
 #define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
 #define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
 #define MT8183_OVL1_2L_MOUT_EN_RDMA1		BIT(4)
@@ -276,5 +283,14 @@ static const struct mtk_mmsys_routes mmsys_mt8183_mdp_routing_table[] = {
 	}
 };
 
+static const unsigned int mmsys_mt8183_mdp_isp_ctrl_table[ISP_CTRL_MAX] = {
+	[ISP_CTRL_MMSYS_SW0_RST_B] = MT8183_ISP_CTRL_MMSYS_SW0_RST_B,
+	[ISP_CTRL_MMSYS_SW1_RST_B] = MT8183_ISP_CTRL_MMSYS_SW1_RST_B,
+	[ISP_CTRL_MDP_ASYNC_CFG_WD] = MT8183_ISP_CTRL_MDP_ASYNC_CFG_WD,
+	[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD] = MT8183_ISP_CTRL_MDP_ASYNC_IPU_CFG_WD,
+	[ISP_CTRL_ISP_RELAY_CFG_WD] = MT8183_ISP_CTRL_ISP_RELAY_CFG_WD,
+	[ISP_CTRL_IPU_RELAY_CFG_WD] = MT8183_ISP_CTRL_IPU_RELAY_CFG_WD,
+};
+
 #endif /* __SOC_MEDIATEK_MT8183_MMSYS_H */
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 31fec490617e..f4b1d2fa41b4 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -55,6 +55,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 	.mdp_routes = mmsys_mt8183_mdp_routing_table,
 	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8183_mdp_routing_table),
+	.mdp_isp_ctrl = mmsys_mt8183_mdp_isp_ctrl_table,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
@@ -142,6 +143,113 @@ void mtk_mmsys_mdp_disconnect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_disconnect);
 
+void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
+			    enum mtk_mdp_comp_id id)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
+	u32 reg;
+
+	WARN_ON(mmsys->subsys_id == 0);
+	/* Direct link */
+	if (id == MDP_COMP_CAMIN) {
+		/* Reset MDP_DL_ASYNC_TX */
+		/* Bit  3: MDP_DL_ASYNC_TX / MDP_RELAY */
+		if (isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    0x0, 0x00000008);
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    1 << 3, 0x00000008);
+		}
+
+		/* Reset MDP_DL_ASYNC_RX */
+		/* Bit  10: MDP_DL_ASYNC_RX */
+		if (isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    0x0, 0x00000400);
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    1 << 10, 0x00000400);
+		}
+
+		/* Enable sof mode */
+		if (isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    0 << 31, 0x80000000);
+		}
+	}
+
+	if (id == MDP_COMP_CAMIN2) {
+		/* Reset MDP_DL_ASYNC2_TX */
+		/* Bit  4: MDP_DL_ASYNC2_TX / MDP_RELAY2 */
+		if (isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    0x0, 0x00000010);
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    1 << 4, 0x00000010);
+		}
+
+		/* Reset MDP_DL_ASYNC2_RX */
+		/* Bit  11: MDP_DL_ASYNC2_RX */
+		if (isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    0x0, 0x00000800);
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    1 << 11, 0x00000800);
+		}
+
+		/* Enable sof mode */
+		if (isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+					    0 << 31, 0x80000000);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_isp_ctrl);
+
+void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
+			      enum mtk_mdp_comp_id id, u32 camin_w, u32 camin_h)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
+	u32 reg;
+
+	WARN_ON(mmsys->subsys_id == 0);
+	/* Config for direct link */
+	if (id == MDP_COMP_CAMIN) {
+		if (isp_ctrl[ISP_CTRL_MDP_ASYNC_CFG_WD]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MDP_ASYNC_CFG_WD];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+				     (camin_h << 16) + camin_w, 0x3FFF3FFF);
+		}
+
+		if (isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+				     (camin_h << 16) + camin_w, 0x3FFF3FFF);
+		}
+	}
+	if (id == MDP_COMP_CAMIN2) {
+		if (isp_ctrl[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD]) {
+			reg = mmsys->addr +
+			      isp_ctrl[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+				     (camin_h << 16) + camin_w, 0x3FFF3FFF);
+		}
+		if (isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD]) {
+			reg = mmsys->addr + isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD];
+			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
+				     (camin_h << 16) + camin_w, 0x3FFF3FFF);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_camin_ctrl);
+
 static int mtk_mmsys_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index a823eb5bf94f..fdfa3f0641ea 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
 	const unsigned int num_routes;
 	const struct mtk_mmsys_routes *mdp_routes;
 	const unsigned int mdp_num_routes;
+	const unsigned int *mdp_isp_ctrl;
 };
 
 /*
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index d1afeabca97d..4eb48d073d2a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -88,6 +88,24 @@ enum mtk_mdp_comp_id {
 	MDP_MAX_COMP_COUNT	/* ALWAYS keep at the end */
 };
 
+enum mtk_mdp_pipe_id {
+	MDP_PIPE_RDMA0,
+	MDP_PIPE_IMGI,
+	MDP_PIPE_WPEI,
+	MDP_PIPE_WPEI2,
+	MDP_PIPE_MAX
+};
+
+enum mtk_isp_ctrl {
+	ISP_CTRL_MMSYS_SW0_RST_B,
+	ISP_CTRL_MMSYS_SW1_RST_B,
+	ISP_CTRL_MDP_ASYNC_CFG_WD,
+	ISP_CTRL_MDP_ASYNC_IPU_CFG_WD,
+	ISP_CTRL_ISP_RELAY_CFG_WD,
+	ISP_CTRL_IPU_RELAY_CFG_WD,
+	ISP_CTRL_MAX
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
@@ -106,4 +124,11 @@ void mtk_mmsys_mdp_disconnect(struct device *dev,
 			      enum mtk_mdp_comp_id cur,
 			      enum mtk_mdp_comp_id next);
 
+void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
+			    enum mtk_mdp_comp_id id);
+
+void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
+			      enum mtk_mdp_comp_id id,
+			      u32 camin_w, u32 camin_h);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0

