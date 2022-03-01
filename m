Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A764C88B7
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 11:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbiCAKDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 05:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiCAKDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 05:03:41 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C3F5F95;
        Tue,  1 Mar 2022 02:02:55 -0800 (PST)
X-UUID: ff08d5d62b6448d2ab7c7c788c3aad67-20220301
X-UUID: ff08d5d62b6448d2ab7c7c788c3aad67-20220301
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1234248613; Tue, 01 Mar 2022 18:02:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 1 Mar 2022 18:02:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 18:02:49 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <pihsun@chromium.org>, <hsinyi@google.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
        <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
        <moudy.ho@mediatek.com>, <jason-jh.lin@mediatek.com>,
        <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 3/4] soc: mediatek: mutex: add support for MDP
Date:   Tue, 1 Mar 2022 18:02:45 +0800
Message-ID: <20220301100246.2153-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220301100246.2153-1-moudy.ho@mediatek.com>
References: <20220301100246.2153-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the purpose of module independence, related settings should be moved
from MDP to the corresponding driver.
This patch adds more 8183 MDP settings and interface.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 68 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  3 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaf8fc1abb43..a6268ecde240 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -136,6 +136,18 @@
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
 
+#define MT8183_MUTEX_MDP_START			5
+#define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
+#define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
+#define MT8183_MUTEX_MOD_MDP_RDMA0		BIT(2)
+#define MT8183_MUTEX_MOD_MDP_RSZ0		BIT(4)
+#define MT8183_MUTEX_MOD_MDP_RSZ1		BIT(5)
+#define MT8183_MUTEX_MOD_MDP_TDSHP0		BIT(6)
+#define MT8183_MUTEX_MOD_MDP_WROT0		BIT(7)
+#define MT8183_MUTEX_MOD_MDP_WDMA		BIT(8)
+#define MT8183_MUTEX_MOD_MDP_AAL0		BIT(23)
+#define MT8183_MUTEX_MOD_MDP_CCORR0		BIT(24)
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -156,6 +168,10 @@ struct mtk_mutex_data {
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
+	const unsigned int *mutex_mdp_offset;
+	const unsigned int *mutex_mdp_mod;
+	const unsigned int mutex_mdp_mod_mask;
+	const unsigned int mutex_mdp_sof_mask;
 	const bool no_clk;
 };
 
@@ -243,6 +259,17 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
+static const unsigned int mt8183_mutex_mdp_mod[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_RDMA0] = MT8183_MUTEX_MOD_MDP_RDMA0,
+	[MDP_COMP_RSZ0] = MT8183_MUTEX_MOD_MDP_RSZ0,
+	[MDP_COMP_RSZ1] = MT8183_MUTEX_MOD_MDP_RSZ1,
+	[MDP_COMP_TDSHP0] = MT8183_MUTEX_MOD_MDP_TDSHP0,
+	[MDP_COMP_WROT0] = MT8183_MUTEX_MOD_MDP_WROT0,
+	[MDP_COMP_WDMA] = MT8183_MUTEX_MOD_MDP_WDMA,
+	[MDP_COMP_AAL0] = MT8183_MUTEX_MOD_MDP_AAL0,
+	[MDP_COMP_CCORR0] = MT8183_MUTEX_MOD_MDP_CCORR0,
+};
+
 static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
@@ -300,6 +327,14 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI0,
 };
 
+/* indicate which mutex is used by each pipepline */
+static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
+	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
+	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
+	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
+	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -334,6 +369,10 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.mutex_mdp_offset = mt8183_mutex_mdp_offset,
+	.mutex_mdp_mod = mt8183_mutex_mdp_mod,
+	.mutex_mdp_mod_mask = MT8183_MUTEX_MDP_MOD_MASK,
+	.mutex_mdp_sof_mask = MT8183_MUTEX_MDP_SOF_MASK,
 	.no_clk = true,
 };
 
@@ -366,6 +405,21 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_get);
 
+struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
+				    enum mtk_mdp_pipe_id id)
+{
+	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
+	int i = mtx->data->mutex_mdp_offset[id];
+
+	if (!mtx->mutex[i].claimed) {
+		mtx->mutex[i].claimed = true;
+		return &mtx->mutex[i];
+	}
+
+	return ERR_PTR(-EBUSY);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_mdp_get);
+
 void mtk_mutex_put(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
@@ -485,6 +539,20 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
+u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum mtk_mdp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (mtx->data->mutex_mdp_mod)
+		return mtx->data->mutex_mdp_mod[id];
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_get_mdp_mod);
+
 void mtk_mutex_enable(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 6fe4ffbde290..b2608f4220ee 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -11,9 +11,12 @@ struct device;
 struct mtk_mutex;
 
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
+struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
+				    enum mtk_mdp_pipe_id id);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
+u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum mtk_mdp_comp_id id);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
 void mtk_mutex_disable(struct mtk_mutex *mutex);
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
-- 
2.18.0

