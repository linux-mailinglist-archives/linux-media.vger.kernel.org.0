Return-Path: <linux-media+bounces-26251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0ACA392E2
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 06:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4093B26B0
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 05:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493E91C1F10;
	Tue, 18 Feb 2025 05:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YtfdL0w4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234C1B0F1B;
	Tue, 18 Feb 2025 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857458; cv=none; b=Ezqzga30t5/ixj3AS0rSxSYWNqZgmq1iBn8x2ZHgSp+jYK07HxNzTOf7gZFOO72ejSeRpzpHMpmd8RpB2z8DrP+CFWUqbgyhAClbvSfJGmhEcHvx+8pvKgkVAZz0tpnbIkW/G/fTy4WUR4HLsDlxP9rgGTYfvfIZgWRRNR/8dM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857458; c=relaxed/simple;
	bh=JZxP9q21JndKJiPcg66gq2C2nKdB7Nfg60fx22aMlnI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emiO5JaCPR4gVrR3k/FTJOn3t7nrHrlojohZ43p2cNvOn9fortJKKYZ8bEbdm5Z1XFbaxfHxMfxrzuO7rmQBQfMDt8ChSi0S/trx5r7NcAVmzcWd3e9hySIvdmZHY4fJsyIQ+u5Y9AXP5Hoxe5VcS1dTbtjNM3hYdV/NxsS7F9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YtfdL0w4; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5f577cb4edbb11efaae1fd9735fae912-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sRFPdOj8cHZYdN5t950ZAhhc2lYyTgP014Ju7dShJeQ=;
	b=YtfdL0w4mjNYdugga1SAgqxj+VTY/c32AKtiLCBXawVh+v+fjMFqq4+awTwqSUPGUU9KrUzNVn8cnxRWITM2DNcUkly1Y2F2jVWPXSa+g8uyQBAjfpPrr0z/UFrHoPyy9bK1p7wpB3eF0BAI5b8tTxPdSEdhdo9WpSBLFpkRc9s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:dfd7da7c-e087-4371-ab3f-31c568b8f9aa,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:21f5a5c6-e2f2-45f6-b8aa-31e67885facd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f577cb4edbb11efaae1fd9735fae912-20250218
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 746339403; Tue, 18 Feb 2025 13:44:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 13:44:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 13:44:07 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang
	<xavier.chang@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 8/8] media: mediatek: mdp3: Add programming flow for unsupported subsys ID hardware
Date: Tue, 18 Feb 2025 13:41:53 +0800
Message-ID: <20250218054405.2017918-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

To support hardware without subsys IDs on new SoCs, add a programming
flow that checks whether the subsys ID is valid. If the subsys ID is
invalid, the flow will call 2 alternative CMDQ APIs:
cmdq_pkt_assign() and cmdq_pkt_write_s_mask_value() to achieve the
same functionality.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 18 ++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    | 79 ++++++++++++++-----
 2 files changed, 77 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index e5ccf673e152..0ee3354963db 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -321,7 +321,14 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
+		if (set->subsys_id != CMDQ_SUBSYS_INVALID) {
+			cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_value(&cmd->pkt, CMDQ_THR_SPR_IDX0,
+					       CMDQ_ADDR_LOW(set->reg), set->value);
+		}
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,7 +383,14 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
+		if (set->subsys_id != CMDQ_SUBSYS_INVALID) {
+			cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_value(&cmd->pkt, CMDQ_THR_SPR_IDX0,
+					       CMDQ_ADDR_LOW(set->reg), 0);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 681906c16419..e20f9d080db9 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,17 +9,44 @@
 
 #include "mtk-mdp3-cmdq.h"
 
-#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)	\
-do {								\
-	typeof(mask) (m) = (mask);				\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id, (base) + (ofst),	\
-			    (val),				\
-		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m));			\
+#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)		\
+do {									\
+	typeof(cmd) (_c) = (cmd);					\
+	typeof(id) (_i) = (id);						\
+	typeof(base) (_b) = (base);					\
+	typeof(ofst) (_o) = (ofst);					\
+	typeof(val) (_v) = (val);					\
+	typeof(mask) (_m) = (mask);					\
+	_m = ((_m & (ofst##_MASK)) == (ofst##_MASK)) ? 0xffffffff : _m;	\
+	if (_i != CMDQ_SUBSYS_INVALID) {				\
+		cmdq_pkt_write_mask(&_c->pkt, _i, _b + _o, _v, _m);	\
+	} else {							\
+		/* only MMIO access, no need to check mminfro_offset */	\
+		cmdq_pkt_assign(&_c->pkt, CMDQ_THR_SPR_IDX0,		\
+				CMDQ_ADDR_HIGH(_b));			\
+		cmdq_pkt_write_s_mask_value(&_c->pkt, CMDQ_THR_SPR_IDX0,\
+					    CMDQ_ADDR_LOW(_b + _o),	\
+					    _v, _m);			\
+	}								\
 } while (0)
 
-#define MM_REG_WRITE(cmd, id, base, ofst, val)			\
-	cmdq_pkt_write(&((cmd)->pkt), id, (base) + (ofst), (val))
+#define MM_REG_WRITE(cmd, id, base, ofst, val)				\
+do {									\
+	typeof(cmd) (_c) = (cmd);					\
+	typeof(id) (_i) = (id);						\
+	typeof(base) (_b) = (base);					\
+	typeof(ofst) (_o) = (ofst);					\
+	typeof(val) (_v) = (val);					\
+	if (_i != CMDQ_SUBSYS_INVALID) {				\
+		cmdq_pkt_write(&_c->pkt, _i, _b + _o, _v);		\
+	} else {							\
+		/* only MMIO access, no need to check mminfro_offset */	\
+		cmdq_pkt_assign(&_c->pkt, CMDQ_THR_SPR_IDX0,		\
+				CMDQ_ADDR_HIGH(_b));			\
+		cmdq_pkt_write_s_value(&_c->pkt, CMDQ_THR_SPR_IDX0,	\
+				       CMDQ_ADDR_LOW(_b + _o), _v);	\
+	}								\
+} while (0)
 
 #define MM_REG_WAIT(cmd, evt)					\
 do {								\
@@ -49,17 +76,33 @@ do {								\
 	cmdq_pkt_set_event(&((c)->pkt), (e));			\
 } while (0)
 
-#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask)	\
-do {								\
-	typeof(_mask) (_m) = (_mask);				\
-	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val),				\
-		(((_m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (_m));			\
+#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, mask)		\
+do {									\
+	typeof(cmd) (_c) = (cmd);					\
+	typeof(id) (_i) = (id);						\
+	typeof(base) (_b) = (base);					\
+	typeof(ofst) (_o) = (ofst);					\
+	typeof(val) (_v) = (val);					\
+	typeof(mask) (_m) = (mask);					\
+	_m = ((_m & (ofst##_MASK)) == (ofst##_MASK)) ? 0xffffffff : _m;	\
+	if (_i != CMDQ_SUBSYS_INVALID)					\
+		cmdq_pkt_poll_mask(&_c->pkt, _i, _b + _o, _v, _m);	\
+	else /* POLL not support SPR, so use cmdq_pkt_poll_addr() */	\
+		cmdq_pkt_poll_addr(&_c->pkt, _b + _o, _v, _m);		\
 } while (0)
 
-#define MM_REG_POLL(cmd, id, base, ofst, val)			\
-	cmdq_pkt_poll(&((cmd)->pkt), id, (base) + (ofst), (val))
+#define MM_REG_POLL(cmd, id, base, ofst, val)				\
+do {									\
+	typeof(cmd) (_c) = (cmd);					\
+	typeof(id) (_i) = (id);						\
+	typeof(base) (_b) = (base);					\
+	typeof(ofst) (_o) = (ofst);					\
+	typeof(val) (_v) = (val);					\
+	if (_i != CMDQ_SUBSYS_INVALID)					\
+		cmdq_pkt_poll(&_c->pkt, _i, _b + _o, _v);		\
+	else /* POLL not support SPR, so use cmdq_pkt_poll_addr() */	\
+		cmdq_pkt_poll_addr(&_c->pkt, _b + _o, _v, 0xffffffff);	\
+} while (0)
 
 enum mtk_mdp_comp_id {
 	MDP_COMP_NONE = -1,	/* Invalid engine */
-- 
2.43.0


