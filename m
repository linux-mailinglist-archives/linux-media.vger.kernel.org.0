Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE84FB49F
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 09:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245340AbiDKH0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 03:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245329AbiDKH0e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 03:26:34 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0748115FE9;
        Mon, 11 Apr 2022 00:24:18 -0700 (PDT)
X-UUID: 9a19b8be10b243c18293008907b1b950-20220411
X-UUID: 9a19b8be10b243c18293008907b1b950-20220411
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1764143010; Mon, 11 Apr 2022 15:24:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 15:24:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 15:24:06 +0800
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
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        <allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
        <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
        <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
        <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14 1/6] soc: mediatek: mutex: add common interface to accommodate multiple modules operationg MUTEX
Date:   Mon, 11 Apr 2022 15:23:58 +0800
Message-ID: <20220411072403.24016-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220411072403.24016-1-moudy.ho@mediatek.com>
References: <20220411072403.24016-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to allow multiple modules to operate MUTEX hardware through
a common interfrace, a flexible index "mtk_mutex_table_index" needs to
be added to replace original component ID so that like DDP and MDP
can add their own MUTEX table settings independently.

In addition, 4 generic interface "mtk_mutex_set_mod", "mtk_mutex_set_sof",
"mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added, which is
expected to replace the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp"
pair originally dedicated to DDP in the future.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Change-Id: I6a2ab74fccf36248165ce4a6b268d82a1177afc9
---
 drivers/soc/mediatek/mtk-mutex.c       | 89 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h | 21 ++++++
 2 files changed, 110 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaf8fc1abb43..48a04dce50d5 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -156,6 +156,8 @@ struct mtk_mutex_data {
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
+	const unsigned int *mutex_table_mod;
+	const unsigned int *mutex_table_sof;
 	const bool no_clk;
 };
 
@@ -445,6 +447,54 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
+void mtk_mutex_set_mod(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int offset;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
+	    idx >= MUTEX_TABLE_IDX_MAX) {
+		dev_err(mtx->dev, "Not supported MOD table index : %d", idx);
+		return;
+	}
+
+	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+				    mutex->id);
+
+	reg = readl_relaxed(mtx->regs + offset);
+	reg |= 1 << mtx->data->mutex_table_mod[idx];
+	writel_relaxed(reg, mtx->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_set_mod);
+
+void mtk_mutex_set_sof(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int sof_id;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
+	    idx >= MUTEX_TABLE_IDX_MAX) {
+		dev_err(mtx->dev, "Not supported SOF table index : %d", idx);
+		return;
+	}
+
+	sof_id = mtx->data->mutex_table_sof[idx];
+
+	writel_relaxed(mtx->data->mutex_sof[sof_id],
+		       mtx->regs +
+		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_set_sof);
+
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id)
 {
@@ -485,6 +535,45 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
+void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
+			 enum mtk_mutex_table_index idx)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int offset;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
+	    idx >= MUTEX_TABLE_IDX_MAX) {
+		dev_err(mtx->dev, "Not supported MOD table index : %d", idx);
+		return;
+	}
+
+	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+				    mutex->id);
+
+	reg = readl_relaxed(mtx->regs + offset);
+	reg &= ~(1 << mtx->data->mutex_table_mod[idx]);
+	writel_relaxed(reg, mtx->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_clear_mod);
+
+void mtk_mutex_clear_sof(struct mtk_mutex *mutex)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
+		       mtx->regs +
+		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
+					  mutex->id));
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_clear_sof);
+
 void mtk_mutex_enable(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 6fe4ffbde290..200f4365c950 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -10,14 +10,35 @@ struct regmap;
 struct device;
 struct mtk_mutex;
 
+enum mtk_mutex_table_index {
+	/* MDP table index */
+	MUTEX_TABLE_IDX_MDP_RDMA0,
+	MUTEX_TABLE_IDX_MDP_RSZ0,
+	MUTEX_TABLE_IDX_MDP_RSZ1,
+	MUTEX_TABLE_IDX_MDP_TDSHP0,
+	MUTEX_TABLE_IDX_MDP_WROT0,
+	MUTEX_TABLE_IDX_MDP_WDMA,
+	MUTEX_TABLE_IDX_MDP_AAL0,
+	MUTEX_TABLE_IDX_MDP_CCORR0,
+
+	MUTEX_TABLE_IDX_MAX		/* ALWAYS keep at the end */
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
+void mtk_mutex_set_mod(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx);
+void mtk_mutex_set_sof(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
 void mtk_mutex_disable(struct mtk_mutex *mutex);
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id);
+void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
+			 enum mtk_mutex_table_index idx);
+void mtk_mutex_clear_sof(struct mtk_mutex *mutex);
 void mtk_mutex_unprepare(struct mtk_mutex *mutex);
 void mtk_mutex_put(struct mtk_mutex *mutex);
 void mtk_mutex_acquire(struct mtk_mutex *mutex);
-- 
2.18.0

