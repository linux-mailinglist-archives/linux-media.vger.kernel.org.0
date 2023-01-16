Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60BDE66B602
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 04:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbjAPDWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 22:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjAPDWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 22:22:04 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D8F7A94;
        Sun, 15 Jan 2023 19:21:57 -0800 (PST)
X-UUID: ea914612954c11eda06fc9ecc4dadd91-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KGwSf8Y5cDES9BrgXFmERM3o/zIVW/5u3di1ykeQWy0=;
        b=t5h/4LlmK2YdzaKe3va+BcaIfv/r+3skoWz5Y+fW2ZJUuGStZFJjArljdwva9tyucYti2wf9essZa5V9Fl4MiegPvNaS1y+mprgRUdZVLqyQXhGrEL0mfHhosjTmzg6IXLqzIAXJ87srZjfW7pTb3pQz3Ox2cmg4KTS7gaumG/4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:b77662b7-7cb2-45e4-9d7b-310f1fe188ff,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:b77662b7-7cb2-45e4-9d7b-310f1fe188ff,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
        :quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:38f8ba54-dd49-462e-a4be-2143a3ddc739,B
        ulkID:230113170324IKXA80QF,BulkQuantity:6,Recheck:0,SF:38|28|17|19|48,TC:n
        il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0,OSI
        :0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: ea914612954c11eda06fc9ecc4dadd91-20230116
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1896808963; Mon, 16 Jan 2023 11:21:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:21:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:21:48 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Moudy Ho <moudy.ho@mediatek.com>
Subject: [RESEND v3 06/13] media: platform: mtk-mdp3: add checks for dummy components
Date:   Mon, 16 Jan 2023 11:21:40 +0800
Message-ID: <20230116032147.23607-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116032147.23607-1-moudy.ho@mediatek.com>
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some components are only used as bridges and do not require configuration.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 64 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 2936701a9cc9..72b5dc4cb3b1 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -43,6 +43,13 @@ static bool is_output_disabled(int p_id, const struct img_compparam *param, u32
 	return (count < num) ? (dis_output || dis_tile) : true;
 }
 
+static bool is_dummy_engine(struct mdp_dev *mdp_dev, s32 inner_id)
+{
+	enum mtk_mdp_comp_id public_id = get_comp_public_id(mdp_dev, inner_id);
+
+	return (mdp_dev->mdp_data->comp_data[public_id].match.type == MDP_COMP_TYPE_DUMMY);
+}
+
 static struct mtk_mutex *__get_mutex(const struct mdp_dev *mdp_dev,
 				     const struct mdp_pipe_info *p)
 {
@@ -114,6 +121,12 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 
 	/* Set mutex mod */
 	for (index = 0; index < num_comp; index++) {
+		s32 inner_id = MDP_COMP_NONE;
+
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -138,6 +151,7 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 	int index;
 	u32 num_comp = 0;
 	s32 event;
+	s32 inner_id = MDP_COMP_NONE;
 
 	if (-1 == p->mutex_id) {
 		dev_err(dev, "Incorrect mutex id");
@@ -150,6 +164,10 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 	/* Wait WROT SRAM shared to DISP RDMA */
 	/* Clear SOF event for each engine */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -164,6 +182,10 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 
 	/* Wait SOF events and clear mutex modules (optional) */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -189,6 +211,12 @@ static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
 		return -EINVAL;
 
 	for (index = 0; index < num_comp; index++) {
+		s32 inner_id = MDP_COMP_NONE;
+
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		if (CFG_CHECK(MT8183, p_id))
 			param = (void *)CFG_ADDR(MT8183, path->config, components[index]);
 		ret = mdp_comp_ctx_config(mdp, &path->comps[index],
@@ -210,6 +238,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	struct mdp_pipe_info pipe;
 	int index, ret;
 	u32 num_comp = 0;
+	s32 inner_id = MDP_COMP_NONE;
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
@@ -229,6 +258,10 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -242,6 +275,10 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 		return ret;
 	/* Wait components done */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -251,6 +288,10 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Advance to the next sub-frame */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		ret = call_op(ctx, advance_subfrm, cmd, count);
 		if (ret)
@@ -274,6 +315,7 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	int index, count, ret;
 	u32 num_comp = 0;
 	u32 num_sub = 0;
+	s32 inner_id = MDP_COMP_NONE;
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
@@ -284,6 +326,10 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		ret = call_op(ctx, init_comp, cmd);
 		if (ret)
@@ -294,6 +340,11 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 		const struct v4l2_rect *compose;
 		u32 out = 0;
 
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
+
 		if (CFG_CHECK(MT8183, p_id))
 			out = CFG_COMP(MT8183, ctx->param, outputs[0]);
 
@@ -312,6 +363,10 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	}
 	/* Post processing information */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (is_dummy_engine(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		ret = call_op(ctx, post_process, cmd);
 		if (ret)
@@ -512,9 +567,16 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	}
 	cmdq_pkt_finalize(&cmd->pkt);
 
-	for (i = 0; i < num_comp; i++)
+	for (i = 0; i < num_comp; i++) {
+		s32 inner_id = MDP_COMP_NONE;
+
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[i].type);
+		if (is_dummy_engine(mdp, inner_id))
+			continue;
 		memcpy(&comps[i], path->comps[i].comp,
 		       sizeof(struct mdp_comp));
+	}
 
 	mdp->cmdq_clt->client.rx_callback = mdp_handle_cmdq_callback;
 	cmd->mdp = mdp;
-- 
2.18.0

