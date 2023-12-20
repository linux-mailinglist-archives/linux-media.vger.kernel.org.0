Return-Path: <linux-media+bounces-2759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C087C819CA2
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE331F2A428
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867A436B1B;
	Wed, 20 Dec 2023 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CguI752+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481D21112;
	Wed, 20 Dec 2023 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 261f0a969f2111eea5db2bebc7c28f94-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rPFEO/WlRGzELyTsSk6oD99wbTsVRM2WAYhz//jCLu4=;
	b=CguI752+ry3Qiv94tcajU2bhGa6qV61bpLMcgcGMxUgjIDOFuUFqf1h3ZzTF4M6xYNW0VEy9nvmjWHxW+wD1jMi6yZ2VfFsfYVnEWCKvOm1dt0pyU6PvxrpI81WqXRi+2fY2/B1CajIWxlHfWpaYB215R086jMfpJAIN9FqgoWc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:96ae89a2-e3b3-43c0-8e6b-a19144c9a895,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:35da4b2e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 261f0a969f2111eea5db2bebc7c28f94-20231220
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2128967094; Wed, 20 Dec 2023 18:18:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:18:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:18:40 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v9 11/12] media: platform: mtk-mdp3: add mt8195 MDP3 component settings
Date: Wed, 20 Dec 2023 18:18:37 +0800
Message-ID: <20231220101838.21510-12-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220101838.21510-1-moudy.ho@mediatek.com>
References: <20231220101838.21510-1-moudy.ho@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Extend the component settings used in MT8195 MDP3.
Additionally, it is crucial to read all component settings in
a specific manner to ensure that shared memory data structure lengths
are aligned across different platforms.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  57 ++
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 798 +++++++++++++++++-
 2 files changed, 851 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index f0c5f5abeb23..8114c288da9c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -40,6 +40,10 @@ static bool is_output_disabled(int p_id, const struct img_compparam *param, u32
 		num = CFG_COMP(MT8183, param, num_subfrms);
 		dis_output = CFG_COMP(MT8183, param, frame.output_disable);
 		dis_tile = CFG_COMP(MT8183, param, frame.output_disable);
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		num = CFG_COMP(MT8195, param, num_subfrms);
+		dis_output = CFG_COMP(MT8195, param, frame.output_disable);
+		dis_tile = CFG_COMP(MT8195, param, frame.output_disable);
 	}
 
 	return (count < num) ? (dis_output || dis_tile) : true;
@@ -101,6 +105,8 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
+	else if (CFG_CHECK(MT8195, p_id))
+		num_comp = CFG_GET(MT8195, path->config, num_components);
 
 	/* Decide which mutex to use based on the current pipeline */
 	index = __get_pipe(path->mdp_dev, path->comps[0].comp->public_id);
@@ -115,6 +121,9 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 
@@ -156,12 +165,17 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
+	else if (CFG_CHECK(MT8195, p_id))
+		num_comp = CFG_GET(MT8195, path->config, num_components);
 
 	/* Wait WROT SRAM shared to DISP RDMA */
 	/* Clear SOF event for each engine */
 	for (index = 0; index < num_comp; index++) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -180,6 +194,9 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 	for (index = 0; index < num_comp; index++) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -202,6 +219,8 @@ static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
+	else if (CFG_CHECK(MT8195, p_id))
+		num_comp = CFG_GET(MT8195, path->config, num_components);
 
 	if (num_comp < 1)
 		return -EINVAL;
@@ -211,10 +230,15 @@ static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
 
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		if (CFG_CHECK(MT8183, p_id))
 			param = (void *)CFG_ADDR(MT8183, path->config, components[index]);
+		else if (CFG_CHECK(MT8195, p_id))
+			param = (void *)CFG_ADDR(MT8195, path->config, components[index]);
 		ret = mdp_comp_ctx_config(mdp, &path->comps[index],
 					  param, path->param);
 		if (ret)
@@ -238,9 +262,13 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
+	else if (CFG_CHECK(MT8195, p_id))
+		num_comp = CFG_GET(MT8195, path->config, num_components);
 
 	if (CFG_CHECK(MT8183, p_id))
 		ctrl = CFG_ADDR(MT8183, path->config, ctrls[count]);
+	else if (CFG_CHECK(MT8195, p_id))
+		ctrl = CFG_ADDR(MT8195, path->config, ctrls[count]);
 
 	/* Acquire components */
 	ret = mdp_path_subfrm_require(path, cmd, &pipe, count);
@@ -256,6 +284,9 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = (num_comp - 1); index >= 0; index--) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -273,6 +304,9 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < num_comp; index++) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -286,6 +320,9 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < num_comp; index++) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -315,15 +352,22 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
+	else if (CFG_CHECK(MT8195, p_id))
+		num_comp = CFG_GET(MT8195, path->config, num_components);
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_sub = CFG_GET(MT8183, path->config, num_subfrms);
+	else if (CFG_CHECK(MT8195, p_id))
+		num_sub = CFG_GET(MT8195, path->config, num_subfrms);
 
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < num_comp; index++) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -339,11 +383,16 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 		ctx = &path->comps[index];
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 
 		if (CFG_CHECK(MT8183, p_id))
 			out = CFG_COMP(MT8183, ctx->param, outputs[0]);
+		else if (CFG_CHECK(MT8195, p_id))
+			out = CFG_COMP(MT8195, ctx->param, outputs[0]);
 
 		compose = path->composes[out];
 		ret = call_op(ctx, config_frame, cmd, compose);
@@ -361,6 +410,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < num_comp; index++) {
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[index].type);
+
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
 		ctx = &path->comps[index];
@@ -515,6 +567,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 
 	if (CFG_CHECK(MT8183, p_id)) {
 		num_comp = CFG_GET(MT8183, param->config, num_components);
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		num_comp = CFG_GET(MT8195, param->config, num_components);
 	} else {
 		ret = -EINVAL;
 		goto err_destroy_pkt;
@@ -570,6 +624,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[i].type);
+		else if (CFG_CHECK(MT8195, p_id))
+			inner_id = CFG_GET(MT8195, path->config, components[i].type);
+
 		if (mdp_cfg_comp_is_dummy(mdp, inner_id))
 			continue;
 		memcpy(&comps[i], path->comps[i].comp,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 600fec7d2f7f..8f62fb167156 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -13,11 +13,19 @@
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-regs.h"
 
-#include "mdp_reg_rdma.h"
+#include "mdp_reg_aal.h"
 #include "mdp_reg_ccorr.h"
+#include "mdp_reg_color.h"
+#include "mdp_reg_fg.h"
+#include "mdp_reg_hdr.h"
+#include "mdp_reg_merge.h"
+#include "mdp_reg_ovl.h"
+#include "mdp_reg_pad.h"
+#include "mdp_reg_rdma.h"
 #include "mdp_reg_rsz.h"
-#include "mdp_reg_wrot.h"
+#include "mdp_reg_tdshp.h"
 #include "mdp_reg_wdma.h"
+#include "mdp_reg_wrot.h"
 
 static u32 mdp_comp_alias_id[MDP_COMP_TYPE_COUNT];
 static int p_id;
@@ -85,6 +93,7 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 	bool en_ufo = MDP_COLOR_IS_UFP(colorformat);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	u32 rdma_con_mask = 0;
 	u32 reg = 0;
 
 	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
@@ -105,6 +114,8 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 	/* Setup source frame info */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.src_ctrl);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.src_ctrl);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, reg,
 		     0x03C8FE0F);
 
@@ -113,69 +124,163 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 			/* Setup source buffer base */
 			if (CFG_CHECK(MT8183, p_id))
 				reg = CFG_COMP(MT8183, ctx->param, rdma.ufo_dec_y);
+			else if (CFG_CHECK(MT8195, p_id))
+				reg = CFG_COMP(MT8195, ctx->param, rdma.ufo_dec_y);
 			MM_REG_WRITE(cmd, subsys_id,
 				     base, MDP_RDMA_UFO_DEC_LENGTH_BASE_Y,
 				     reg, 0xFFFFFFFF);
+
 			if (CFG_CHECK(MT8183, p_id))
 				reg = CFG_COMP(MT8183, ctx->param, rdma.ufo_dec_c);
+			else if (CFG_CHECK(MT8195, p_id))
+				reg = CFG_COMP(MT8195, ctx->param, rdma.ufo_dec_c);
 			MM_REG_WRITE(cmd, subsys_id,
 				     base, MDP_RDMA_UFO_DEC_LENGTH_BASE_C,
 				     reg, 0xFFFFFFFF);
+
 			/* Set 10bit source frame pitch */
 			if (block10bit) {
 				if (CFG_CHECK(MT8183, p_id))
 					reg = CFG_COMP(MT8183, ctx->param, rdma.mf_bkgd_in_pxl);
+				else if (CFG_CHECK(MT8195, p_id))
+					reg = CFG_COMP(MT8195, ctx->param, rdma.mf_bkgd_in_pxl);
 				MM_REG_WRITE(cmd, subsys_id,
 					     base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
 					     reg, 0x001FFFFF);
 			}
 		}
 
-	if (CFG_CHECK(MT8183, p_id))
+	if (CFG_CHECK(MT8183, p_id)) {
 		reg = CFG_COMP(MT8183, ctx->param, rdma.control);
+		rdma_con_mask = 0x1110;
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		reg = CFG_COMP(MT8195, ctx->param, rdma.control);
+		rdma_con_mask = 0x1130;
+	}
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, reg,
-		     0x1110);
+		     rdma_con_mask);
+
 	/* Setup source buffer base */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova[0]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.iova[0]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, reg,
 		     0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova[1]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.iova[1]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, reg,
 		     0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova[2]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.iova[2]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, reg,
 		     0xFFFFFFFF);
+
 	/* Setup source buffer end */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova_end[0]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.iova_end[0]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0,
 		     reg, 0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova_end[1]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.iova_end[1]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_1,
 		     reg, 0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.iova_end[2]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.iova_end[2]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_2,
 		     reg, 0xFFFFFFFF);
+
 	/* Setup source frame pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.mf_bkgd);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.mf_bkgd);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
 		     reg, 0x001FFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.sf_bkgd);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.sf_bkgd);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
 		     reg, 0x001FFFFF);
+
 	/* Setup color transform */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.transform);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.transform);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
 		     reg, 0x0F110000);
 
+	if (!mdp_cfg || !mdp_cfg->rdma_esl_setting)
+		goto rdma_config_done;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_0,
+		     reg, 0x0FFF00FF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_high_con0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_0,
+		     reg, 0x3FFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_low_con0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_0,
+		     reg, 0x3FFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_1,
+		     reg, 0x0F7F007F);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_high_con1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_1,
+		     reg, 0x3FFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_low_con1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_1,
+		     reg, 0x3FFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con2);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_2,
+		     reg, 0x0F3F003F);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_high_con2);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_2,
+		     reg, 0x3FFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.ultra_th_low_con2);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_2,
+		     reg, 0x3FFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.dmabuf_con3);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_3,
+		     reg, 0x0F3F003F);
+
+rdma_config_done:
 	return 0;
 }
 
@@ -197,6 +302,8 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	/* Set Y pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset[0]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset[0]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0,
 		     reg, 0xFFFFFFFF);
 
@@ -205,6 +312,8 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 		if (mdp_cfg->rdma_support_10bit && block10bit && en_ufo) {
 			if (CFG_CHECK(MT8183, p_id))
 				reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset_0_p);
+			else if (CFG_CHECK(MT8195, p_id))
+				reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset_0_p);
 			MM_REG_WRITE(cmd, subsys_id, base,
 				     MDP_RDMA_SRC_OFFSET_0_P,
 				     reg, 0xFFFFFFFF);
@@ -214,32 +323,49 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	/* Set U pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset[1]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset[1]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_1,
 		     reg, 0xFFFFFFFF);
+
 	/* Set V pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].offset[2]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].offset[2]);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_2,
 		     reg, 0xFFFFFFFF);
+
 	/* Set source size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].src);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].src);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_SRC_SIZE, reg,
 		     0x1FFF1FFF);
+
 	/* Set target size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].clip);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].clip);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_CLIP_SIZE,
 		     reg, 0x1FFF1FFF);
+
 	/* Set crop offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rdma.subfrms[index].clip_ofst);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rdma.subfrms[index].clip_ofst);
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_OFFSET_1,
 		     reg, 0x003F001F);
 
 	if (CFG_CHECK(MT8183, p_id)) {
 		csf_l = CFG_COMP(MT8183, ctx->param, subfrms[index].in.left);
 		csf_r = CFG_COMP(MT8183, ctx->param, subfrms[index].in.right);
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		csf_l = CFG_COMP(MT8195, ctx->param, subfrms[index].in.left);
+		csf_r = CFG_COMP(MT8195, ctx->param, subfrms[index].in.right);
 	}
 	if (mdp_cfg && mdp_cfg->rdma_upsample_repeat_only)
 		if ((csf_r - csf_l + 1) > 320)
@@ -289,6 +415,14 @@ static int init_rsz(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(16));
 	/* Enable RSZ */
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, BIT(0), BIT(0));
+
+	if (CFG_CHECK(MT8195, p_id)) {
+		struct device *dev;
+
+		dev = ctx->comp->mdp_dev->mm_subsys[MDP_MM_SUBSYS_1].mmsys;
+		mtk_mmsys_vpp_rsz_dcm_config(dev, true, NULL);
+	}
+
 	return 0;
 }
 
@@ -296,13 +430,19 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
 			    struct mdp_cmdq_cmd *cmd,
 			    const struct v4l2_rect *compose)
 {
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 	bool bypass = FALSE;
 	u32 reg = 0;
 
+	if (mdp_cfg && mdp_cfg->rsz_etc_control)
+		MM_REG_WRITE(cmd, subsys_id, base, RSZ_ETC_CONTROL, 0x0, 0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		bypass = CFG_COMP(MT8183, ctx->param, frame.bypass);
+	else if (CFG_CHECK(MT8195, p_id))
+		bypass = CFG_COMP(MT8195, ctx->param, frame.bypass);
 
 	if (bypass) {
 		/* Disable RSZ */
@@ -312,20 +452,32 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.control1);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.control1);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1, reg,
 		     0x03FFFDF3);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.control2);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.control2);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_2, reg,
 		     0x0FFFC290);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.coeff_step_x);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.coeff_step_x);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_HORIZONTAL_COEFF_STEP,
 		     reg, 0x007FFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.coeff_step_y);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.coeff_step_y);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_VERTICAL_COEFF_STEP,
 		     reg, 0x007FFFFF);
+
 	return 0;
 }
 
@@ -337,19 +489,28 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 	u8 subsys_id = ctx->comp->subsys_id;
 	u32 csf_l = 0, csf_r = 0;
 	u32 reg = 0;
+	u32 id;
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.subfrms[index].control2);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].control2);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_2, reg,
 		     0x00003800);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.subfrms[index].src);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].src);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_INPUT_IMAGE, reg,
 		     0xFFFFFFFF);
 
 	if (CFG_CHECK(MT8183, p_id)) {
 		csf_l = CFG_COMP(MT8183, ctx->param, subfrms[index].in.left);
 		csf_r = CFG_COMP(MT8183, ctx->param, subfrms[index].in.right);
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		csf_l = CFG_COMP(MT8195, ctx->param, subfrms[index].in.left);
+		csf_r = CFG_COMP(MT8195, ctx->param, subfrms[index].in.right);
 	}
 	if (mdp_cfg && mdp_cfg->rsz_disable_dcm_small_sample)
 		if ((csf_r - csf_l + 1) <= 16)
@@ -358,37 +519,99 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.left);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.left);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET,
 		     reg, 0xFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.left_subpix);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.left_subpix);
 	MM_REG_WRITE(cmd, subsys_id,
 		     base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
 		     reg, 0x1FFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.top);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.top);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_INTEGER_OFFSET,
 		     reg, 0xFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].luma.top_subpix);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].luma.top_subpix);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET,
 		     reg, 0x1FFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].chroma.left);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].chroma.left);
 	MM_REG_WRITE(cmd, subsys_id,
 		     base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
 		     reg, 0xFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, subfrms[index].chroma.left_subpix);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, subfrms[index].chroma.left_subpix);
 	MM_REG_WRITE(cmd, subsys_id,
 		     base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
 		     reg, 0x1FFFFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, rsz.subfrms[index].clip);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].clip);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, reg,
 		     0xFFFFFFFF);
 
+	if (CFG_CHECK(MT8195, p_id)) {
+		struct device *dev;
+		struct mdp_comp *merge;
+		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
+		enum mtk_mdp_comp_id public_id = ctx->comp->public_id;
+
+		switch (public_id) {
+		case MDP_COMP_RSZ2:
+			merge = ctx->comp->mdp_dev->comp[MDP_COMP_MERGE2];
+			break;
+		case MDP_COMP_RSZ3:
+			merge = ctx->comp->mdp_dev->comp[MDP_COMP_MERGE3];
+			break;
+		default:
+			goto rsz_subfrm_done;
+		}
+
+		if (CFG_CHECK(MT8195, p_id))
+			reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].rsz_switch);
+
+		id = data->comp_data[public_id].match.alias_id;
+		dev = ctx->comp->mdp_dev->mm_subsys[MDP_MM_SUBSYS_1].mmsys;
+		mtk_mmsys_vpp_rsz_merge_config(dev, id, reg, NULL);
+
+		if (CFG_CHECK(MT8195, p_id))
+			reg = CFG_COMP(MT8195, ctx->param, rsz.subfrms[index].merge_cfg);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     MDP_MERGE_CFG_0, reg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     MDP_MERGE_CFG_4, reg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     MDP_MERGE_CFG_24, reg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     MDP_MERGE_CFG_25, reg, 0xFFFFFFFF);
+
+		/* Bypass mode */
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     MDP_MERGE_CFG_12, BIT(0), 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     MDP_MERGE_ENABLE, BIT(0), 0xFFFFFFFF);
+	}
+
+rsz_subfrm_done:
 	return 0;
 }
 
@@ -405,6 +628,9 @@ static int advance_rsz_subfrm(struct mdp_comp_ctx *ctx,
 		if (CFG_CHECK(MT8183, p_id)) {
 			csf_l = CFG_COMP(MT8183, ctx->param, subfrms[index].in.left);
 			csf_r = CFG_COMP(MT8183, ctx->param, subfrms[index].in.right);
+		} else if (CFG_CHECK(MT8195, p_id)) {
+			csf_l = CFG_COMP(MT8195, ctx->param, subfrms[index].in.left);
+			csf_r = CFG_COMP(MT8195, ctx->param, subfrms[index].in.right);
 		}
 
 		if ((csf_r - csf_l + 1) <= 16)
@@ -431,6 +657,11 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	/* Reset WROT */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, BIT(0), BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
+
+	/* Reset setting */
+	if (CFG_CHECK(MT8195, p_id))
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0, 0xFFFFFFFF);
+
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x0, BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
 	return 0;
@@ -448,57 +679,118 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 	/* Write frame base address */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.iova[0]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.iova[0]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, reg,
 		     0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.iova[1]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.iova[1]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_C, reg,
 		     0xFFFFFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.iova[2]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.iova[2]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, reg,
 		     0xFFFFFFFF);
+
+	if (mdp_cfg && mdp_cfg->wrot_support_10bit) {
+		if (CFG_CHECK(MT8195, p_id))
+			reg = CFG_COMP(MT8195, ctx->param, wrot.scan_10bit);
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
+			     reg, 0x0000000F);
+
+		if (CFG_CHECK(MT8195, p_id))
+			reg = CFG_COMP(MT8195, ctx->param, wrot.pending_zero);
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
+			     reg, 0x04000000);
+	}
+
+	if (CFG_CHECK(MT8195, p_id)) {
+		reg = CFG_COMP(MT8195, ctx->param, wrot.bit_number);
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2,
+			     reg, 0x00000007);
+	}
+
 	/* Write frame related registers */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.control);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.control);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, reg,
 		     0xF131510F);
+
+	/* Write pre-ultra threshold */
+	if (CFG_CHECK(MT8195, p_id)) {
+		reg = CFG_COMP(MT8195, ctx->param, wrot.pre_ultra);
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_DMA_PREULTRA, reg,
+			     0x00FFFFFF);
+	}
+
 	/* Write frame Y pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.stride[0]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.stride[0]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE, reg,
 		     0x0000FFFF);
+
 	/* Write frame UV pitch */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.stride[1]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.stride[1]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_C, reg,
 		     0xFFFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.stride[2]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.stride[2]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_V, reg,
 		     0xFFFF);
+
 	/* Write matrix control */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.mat_ctrl);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.mat_ctrl);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAT_CTRL, reg, 0xF3);
 
 	/* Set the fixed ALPHA as 0xFF */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DITHER, 0xFF000000,
 		     0xFF000000);
+
 	/* Set VIDO_EOL_SEL */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_RSV_1, BIT(31), BIT(31));
+
 	/* Set VIDO_FIFO_TEST */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.fifo_test);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.fifo_test);
+
 	if (reg != 0)
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_FIFO_TEST,
 			     reg, 0xFFF);
+
 	/* Filter enable */
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint) {
 		if (CFG_CHECK(MT8183, p_id))
 			reg = CFG_COMP(MT8183, ctx->param, wrot.filter);
+		else if (CFG_CHECK(MT8195, p_id))
+			reg = CFG_COMP(MT8195, ctx->param, wrot.filter);
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
 			     reg, 0x77);
+
+		/* Turn off WROT DMA DCM */
+		if (CFG_CHECK(MT8195, p_id))
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN,
+				     (0x1 << 23) + (0x1 << 20), 0x900000);
 	}
 
 	return 0;
@@ -514,35 +806,54 @@ static int config_wrot_subfrm(struct mdp_comp_ctx *ctx,
 	/* Write Y pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].offset[0]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].offset[0]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR,
 		     reg, 0x0FFFFFFF);
+
 	/* Write U pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].offset[1]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].offset[1]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_C,
 		     reg, 0x0FFFFFFF);
+
 	/* Write V pixel offset */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].offset[2]);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].offset[2]);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_V,
 		     reg, 0x0FFFFFFF);
+
 	/* Write source size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].src);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].src);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_IN_SIZE, reg,
 		     0x1FFF1FFF);
+
 	/* Write target size */
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].clip);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].clip);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_TAR_SIZE, reg,
 		     0x1FFF1FFF);
+
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].clip_ofst);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].clip_ofst);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, reg,
 		     0x1FFF1FFF);
 
 	if (CFG_CHECK(MT8183, p_id))
 		reg = CFG_COMP(MT8183, ctx->param, wrot.subfrms[index].main_buf);
+	else if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, wrot.subfrms[index].main_buf);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
 		     reg, 0x1FFF7F00);
 
@@ -708,6 +1019,171 @@ static const struct mdp_comp_ops wdma_ops = {
 	.wait_comp_event = wait_wdma_event,
 };
 
+static int reset_luma_hist(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 hist_num, i;
+
+	if (!mdp_cfg)
+		return -EINVAL;
+
+	hist_num = mdp_cfg->tdshp_hist_num;
+
+	/* Reset histogram */
+	for (i = 0; i <= hist_num; i++)
+		MM_REG_WRITE_MASK(cmd, subsys_id, base,
+				  (MDP_LUMA_HIST_INIT + (i << 2)),
+				  0, 0xFFFFFFFF);
+
+	if (mdp_cfg->tdshp_constrain)
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_DC_TWO_D_W1_RESULT_INIT, 0, 0xFFFFFFFF);
+
+	if (mdp_cfg->tdshp_contour)
+		for (i = 0; i < hist_num; i++)
+			MM_REG_WRITE_MASK(cmd, subsys_id, base,
+					  (MDP_CONTOUR_HIST_INIT + (i << 2)),
+					  0, 0xFFFFFFFF);
+
+	return 0;
+}
+
+static int init_tdshp(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CTRL, BIT(0), BIT(0));
+	/* Enable FIFO */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, BIT(1), BIT(1));
+
+	return reset_luma_hist(ctx, cmd);
+}
+
+static int config_tdshp_frame(struct mdp_comp_ctx *ctx,
+			      struct mdp_cmdq_cmd *cmd,
+			      const struct v4l2_rect *compose)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, tdshp.cfg);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, reg, BIT(0));
+
+	return 0;
+}
+
+static int config_tdshp_subfrm(struct mdp_comp_ctx *ctx,
+			       struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].src);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_INPUT_SIZE,
+		     reg, MDP_TDSHP_INPUT_SIZE_MASK);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].clip_ofst);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_OFFSET,
+		     reg, 0x00FF00FF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].clip);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_SIZE,
+		     reg, MDP_TDSHP_OUTPUT_SIZE_MASK);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].hist_cfg_0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_00, reg, 0xFFFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, tdshp.subfrms[index].hist_cfg_1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_01, reg, 0xFFFFFFFF);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops tdshp_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_tdshp,
+	.config_frame = config_tdshp_frame,
+	.config_subfrm = config_tdshp_subfrm,
+};
+
+static int init_color(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_COLOR_START, 0x1, BIT(1) | BIT(0));
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_COLOR_WIN_X_MAIN, 0xFFFF0000, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_COLOR_WIN_Y_MAIN, 0xFFFF0000, 0xFFFFFFFF);
+
+	/* Reset color matrix */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_CM1_EN, 0x0, BIT(0));
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_CM2_EN, 0x0, BIT(0));
+
+	/* Enable interrupt */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_INTEN, 0x7, 0x7);
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_OUT_SEL, 0x333, 0x333);
+
+	return 0;
+}
+
+static int config_color_frame(struct mdp_comp_ctx *ctx,
+			      struct mdp_cmdq_cmd *cmd,
+			      const struct v4l2_rect *compose)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, color.start);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_START,
+		     reg, MDP_COLOR_START_MASK);
+
+	return 0;
+}
+
+static int config_color_subfrm(struct mdp_comp_ctx *ctx,
+			       struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, color.subfrms[index].in_hsize);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_INTERNAL_IP_WIDTH,
+		     reg, 0x00003FFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, color.subfrms[index].in_vsize);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_COLOR_INTERNAL_IP_HEIGHT,
+		     reg, 0x00003FFF);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops color_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_color,
+	.config_frame = config_color_frame,
+	.config_subfrm = config_color_subfrm,
+};
+
 static int init_ccorr(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
@@ -749,12 +1225,318 @@ static const struct mdp_comp_ops ccorr_ops = {
 	.config_subfrm = config_ccorr_subfrm,
 };
 
+static int init_aal(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	/* Always set MDP_AAL enable to 1 */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_EN, BIT(0), BIT(0));
+
+	return 0;
+}
+
+static int config_aal_frame(struct mdp_comp_ctx *ctx,
+			    struct mdp_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, aal.cfg_main);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG_MAIN, reg, BIT(7));
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, aal.cfg);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG, reg, BIT(0));
+
+	return 0;
+}
+
+static int config_aal_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, aal.subfrms[index].src);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_SIZE,
+		     reg, MDP_AAL_SIZE_MASK);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, aal.subfrms[index].clip_ofst);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_OFFSET,
+		     reg, 0x00FF00FF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, aal.subfrms[index].clip);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_SIZE,
+		     reg, MDP_AAL_OUTPUT_SIZE_MASK);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops aal_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_aal,
+	.config_frame = config_aal_frame,
+	.config_subfrm = config_aal_subfrm,
+};
+
+static int init_hdr(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	/* Always set MDP_HDR enable to 1 */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, BIT(0), BIT(0));
+
+	return 0;
+}
+
+static int config_hdr_frame(struct mdp_comp_ctx *ctx,
+			    struct mdp_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.top);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, reg, BIT(29) | BIT(28));
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.relay);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_RELAY, reg, BIT(0));
+
+	return 0;
+}
+
+static int config_hdr_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].win_size);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TILE_POS,
+		     reg, MDP_HDR_TILE_POS_MASK);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].src);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_0, reg, 0x1FFF1FFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].clip_ofst0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_1, reg, 0x1FFF1FFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].clip_ofst1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_2, reg, 0x1FFF1FFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hist_ctrl_0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_0, reg, 0x00003FFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hist_ctrl_1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_1, reg, 0x00003FFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hdr_top);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, reg, BIT(6) | BIT(5));
+
+	/* Enable histogram */
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, hdr.subfrms[index].hist_addr);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_ADDR, reg, BIT(9));
+
+	return 0;
+}
+
+static const struct mdp_comp_ops hdr_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_hdr,
+	.config_frame = config_hdr_frame,
+	.config_subfrm = config_hdr_subfrm,
+};
+
+static int init_fg(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER, BIT(2), BIT(2));
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER, 0x0, BIT(2));
+
+	return 0;
+}
+
+static int config_fg_frame(struct mdp_comp_ctx *ctx,
+			   struct mdp_cmdq_cmd *cmd,
+			   const struct v4l2_rect *compose)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, fg.ctrl_0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CTRL_0, reg, BIT(0));
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, fg.ck_en);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CK_EN, reg, 0x7);
+
+	return 0;
+}
+
+static int config_fg_subfrm(struct mdp_comp_ctx *ctx,
+			    struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, fg.subfrms[index].info_0);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_0, reg, 0xFFFFFFFF);
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, fg.subfrms[index].info_1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_1, reg, 0xFFFFFFFF);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops fg_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_fg,
+	.config_frame = config_fg_frame,
+	.config_subfrm = config_fg_subfrm,
+};
+
+static int init_ovl(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_EN,
+		     BIT(0), MDP_OVL_EN_MASK);
+
+	/* Set to relay mode */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_SRC_CON,
+		     BIT(9), MDP_OVL_SRC_CON_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_DP_CON,
+		     BIT(0), MDP_OVL_DP_CON_MASK);
+
+	return 0;
+}
+
+static int config_ovl_frame(struct mdp_comp_ctx *ctx,
+			    struct mdp_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, ovl.L0_con);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_L0_CON, reg, BIT(29) | BIT(28));
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, ovl.src_con);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_SRC_CON, reg, BIT(0));
+
+	return 0;
+}
+
+static int config_ovl_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, ovl.subfrms[index].L0_src_size);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_L0_SRC_SIZE,
+		     reg, MDP_OVL_L0_SRC_SIZE_MASK);
+
+	/* Setup output size */
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, ovl.subfrms[index].roi_size);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_OVL_ROI_SIZE,
+		     reg, MDP_OVL_ROI_SIZE_MASK);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops ovl_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_ovl,
+	.config_frame = config_ovl_frame,
+	.config_subfrm = config_ovl_subfrm,
+};
+
+static int init_pad(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_CON,
+		     BIT(1), MDP_PAD_CON_MASK);
+	/* Reset */
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_W_SIZE,
+		     0, MDP_PAD_W_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_H_SIZE,
+		     0, MDP_PAD_H_SIZE_MASK);
+
+	return 0;
+}
+
+static int config_pad_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mdp_cmdq_cmd *cmd, u32 index)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+	u32 reg = 0;
+
+	if (CFG_CHECK(MT8195, p_id))
+		reg = CFG_COMP(MT8195, ctx->param, pad.subfrms[index].pic_size);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_PAD_PIC_SIZE,
+		     reg, MDP_PAD_PIC_SIZE_MASK);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops pad_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_pad,
+	.config_subfrm = config_pad_subfrm,
+};
+
 static const struct mdp_comp_ops *mdp_comp_ops[MDP_COMP_TYPE_COUNT] = {
 	[MDP_COMP_TYPE_RDMA] =		&rdma_ops,
 	[MDP_COMP_TYPE_RSZ] =		&rsz_ops,
 	[MDP_COMP_TYPE_WROT] =		&wrot_ops,
 	[MDP_COMP_TYPE_WDMA] =		&wdma_ops,
+	[MDP_COMP_TYPE_TDSHP] =		&tdshp_ops,
+	[MDP_COMP_TYPE_COLOR] =		&color_ops,
 	[MDP_COMP_TYPE_CCORR] =		&ccorr_ops,
+	[MDP_COMP_TYPE_AAL] =		&aal_ops,
+	[MDP_COMP_TYPE_HDR] =		&hdr_ops,
+	[MDP_COMP_TYPE_FG] =		&fg_ops,
+	[MDP_COMP_TYPE_OVL] =		&ovl_ops,
+	[MDP_COMP_TYPE_PAD] =		&pad_ops,
 };
 
 static const struct of_device_id mdp_comp_dt_ids[] __maybe_unused = {
@@ -1253,6 +2035,8 @@ int mdp_comp_ctx_config(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 
 	if (CFG_CHECK(MT8183, p_id))
 		arg = CFG_COMP(MT8183, param, type);
+	else if (CFG_CHECK(MT8195, p_id))
+		arg = CFG_COMP(MT8195, param, type);
 	else
 		return -EINVAL;
 	public_id = mdp_cfg_get_id_public(mdp, arg);
@@ -1270,16 +2054,22 @@ int mdp_comp_ctx_config(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 	ctx->param = param;
 	if (CFG_CHECK(MT8183, p_id))
 		arg = CFG_COMP(MT8183, param, input);
+	else if (CFG_CHECK(MT8195, p_id))
+		arg = CFG_COMP(MT8195, param, input);
 	else
 		return -EINVAL;
 	ctx->input = &frame->inputs[arg];
 	if (CFG_CHECK(MT8183, p_id))
 		idx = CFG_COMP(MT8183, param, num_outputs);
+	else if (CFG_CHECK(MT8195, p_id))
+		idx = CFG_COMP(MT8195, param, num_outputs);
 	else
 		return -EINVAL;
 	for (i = 0; i < idx; i++) {
 		if (CFG_CHECK(MT8183, p_id))
 			arg = CFG_COMP(MT8183, param, outputs[i]);
+		else if (CFG_CHECK(MT8195, p_id))
+			arg = CFG_COMP(MT8195, param, outputs[i]);
 		else
 			return -EINVAL;
 		ctx->outputs[i] = &frame->outputs[arg];
-- 
2.18.0


