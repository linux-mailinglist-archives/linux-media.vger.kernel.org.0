Return-Path: <linux-media+bounces-23150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23C9EC33D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 04:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49C6016721C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 03:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C12B2397B4;
	Wed, 11 Dec 2024 03:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MK2FNaR6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B6214228;
	Wed, 11 Dec 2024 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733887390; cv=none; b=Ss1EARYhEeVnAyuvZMvI1Zbxvaw0TKon8i9H2zgEEfp/fQ048Mv32x/gRPzn6WDhfcQpwIoeHO95Qcuk7J3mXld2tNjCcMUvDlvKtSgM5P0YCWCrenbYKhfmnZ9r5ZYdIJmOxaYR+PO7G6adPdWaUx8xNC3vmuffKxnaYpfcP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733887390; c=relaxed/simple;
	bh=IIjyV2JskEjfgq5nQqJYUv2JNRs2MOYUMeNB4e4IIU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbIhumcVpyLqgVjIxv/QKiZB7EZ/ru+wFqY/TmrBp7A5Yhy4jwAtYLVfs5hSc9v+vv017/v2BhLnQZW1WT5zdxSEz39h2RhyKeiLXC4JteSulrMlIgc3LAj3y9NyvEB874eGAHANDWmrfdEhLFG6Tja5wJNm6MoSsZFWnaQsR0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MK2FNaR6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 39cfd13ab76f11ef99858b75a2457dd9-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XXYbZaarLcOFWSwit2AJs5GzodrHS17+95EDCQbDaJk=;
	b=MK2FNaR6gOUNiXx7D2effV2Vmhn5YBYgTNBuUuu38g0UMx6RA535eGAcXyBa5pGZEJjtzqhNCqYm3o8e2qA8vrLIsO2iQowMWwLdMBJzdWgYPGgmUk0CYW3V4/2LC2XfPKJRcpj1BLSvj25/11GN/an7vlGP5HGqFxrdypyLymQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9f4a2da2-409b-4980-afa9-4f39ed5cf47f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:60532dc1-1c82-4420-82d9-d6eb228f5c4a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 39cfd13ab76f11ef99858b75a2457dd9-20241211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1853415402; Wed, 11 Dec 2024 11:23:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 8/8] media: mediatek: mdp3: Add programming flow for unsupported subsys ID hardware
Date: Wed, 11 Dec 2024 11:22:56 +0800
Message-ID: <20241211032256.28494-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

To support hardware without subsys IDs on new SoCs, add a programming
flow that checks whether the subsys ID is valid. If the subsys ID is
invalid, the flow will call 2 alternative CMDQ APIs:
cmdq_pkt_assign() and cmdq_pkt_write_s_mask_value() to achieve the
same functionality.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 26 ++++++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    | 41 +++++++++++++++----
 2 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index df0ab338ef41..58beeffd3fdf 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -320,9 +320,18 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 		return ret;
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
+		struct cmdq_client *cl = (struct cmdq_client *)cmd->pkt.cl;
+
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+		if (cmdq_subsys_is_valid(cl->chan, set->subsys_id)) {
+			cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
+					    set->value, 0xFFFFFFFF);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, 0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_mask_value(&cmd->pkt, 0, CMDQ_ADDR_LOW(set->reg),
+						    set->value, 0xFFFFFFFF);
+		}
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,9 +385,18 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
+		struct cmdq_client *cl = (struct cmdq_client *)cmd->pkt.cl;
+
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+		if (cmdq_subsys_is_valid(cl->chan, set->subsys_id)) {
+			cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
+					    0, 0xFFFFFFFF);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, 0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_mask_value(&cmd->pkt, 0, CMDQ_ADDR_LOW(set->reg),
+						    0, 0xFFFFFFFF);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..f6c041934779 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,9 +9,25 @@
 
 #include "mtk-mdp3-cmdq.h"
 
-#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
+#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)				\
+do {											\
+	typeof(cmd) (_cmd) = (cmd);							\
+	typeof(id) (_id) = (id);							\
+	typeof(base) (_base) = (base);							\
+	typeof(ofst) (_ofst) = (ofst);							\
+	typeof(val) (_val) = (val);							\
+	typeof(mask) (_mask) = (mask);							\
+	if (cmdq_subsys_is_valid(((struct cmdq_client *)_cmd->pkt.cl)->chan, _id)) {	\
+		cmdq_pkt_write_mask(&_cmd->pkt, _id, _base + _ofst, _val,		\
+				    _mask, ##__VA_ARGS__);				\
+	} else {									\
+		/* only MMIO access, no need to check mminfro_offset */			\
+		cmdq_pkt_assign(&_cmd->pkt, 0, CMDQ_ADDR_HIGH(_base));			\
+		cmdq_pkt_write_s_mask_value(&_cmd->pkt, 0,				\
+					    CMDQ_ADDR_LOW(_base + _ofst), _val,		\
+					    _mask, ##__VA_ARGS__);			\
+	}										\
+} while (0)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
 do {								\
@@ -49,11 +65,20 @@ do {								\
 	cmdq_pkt_set_event(&((c)->pkt), (e));			\
 } while (0)
 
-#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
-do {								\
-	typeof(_mask) (_m) = (_mask);				\
-	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
+#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)				\
+do {											\
+	typeof(cmd) (_cmd) = (cmd);							\
+	typeof(id) (_id) = (id);							\
+	typeof(base) (_base) = (base);							\
+	typeof(ofst) (_ofst) = (ofst);							\
+	typeof(val) (_val) = (val);							\
+	typeof(_mask) (_m) = (_mask);							\
+	if (cmdq_subsys_is_valid(((struct cmdq_client *)_cmd->pkt.cl)->chan, _id))	\
+		cmdq_pkt_poll_mask(&_cmd->pkt, _id, _base + _ofst, _val,		\
+				   _m, ##__VA_ARGS__);					\
+	else										\
+		cmdq_pkt_poll_addr(&_cmd->pkt, _base + _ofst, _val,			\
+				   _m, ##__VA_ARGS__);					\
 } while (0)
 
 #define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...)	\
-- 
2.43.0


