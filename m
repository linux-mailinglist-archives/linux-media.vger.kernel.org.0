Return-Path: <linux-media+bounces-41173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC9B38197
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 13:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50FA8461EF5
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C205B35AABD;
	Wed, 27 Aug 2025 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GLK2sAf0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ADE352FE2;
	Wed, 27 Aug 2025 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294828; cv=none; b=RKqzhZRO4G89hJ7lFoD/MLJEB8cvCbg/gj9v7f/eUBok3pYuvtZ7aJfy+jBzBVSVe4S5yHU/c7MkPpSdw9UzUrYP/G18yxHq60UAp5OKlrCEAq42S4YYbq4JIGOH5w5/EScp0pQYW4JcA0u/tnUJq11R5yzTp6Pj3axjLWOVB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294828; c=relaxed/simple;
	bh=nXL1Hhps/HoGf1DcoX+zTx4kkYUV5mAaHo0RGuucK0U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MoN/TgjOnEwVToeGbrJ89ELb4mrcepoY4C3yUfqrWgKWYBjWDnsZRBfE82+VFUk9+73WppDYgNAsPPwZnKlTGYaIV1V00EkNDuMuxzyF42eaEsaBNfb34hNau4wNZ31ZPbVeizhraqdwuxsiCdDXtzds0/IF6i+wycv5/JIoibU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GLK2sAf0; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 975ce8f0833a11f0bd5779446731db89-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AWWkhwhIbAHYidTICoAJeAaq8joJr3ABiw1oyJaxOo4=;
	b=GLK2sAf0Rgdx+H4LrixaOvo513FdKYkwSK7F9nm+YwJGqlFxkDJwd1q2Vn8qfbGYhpYpg3CRReBhwqLfnrzbF3sJzAsHiAxdQfiQBkxgWaIlwBd8RWTL/HZb5w9h0i9/NbYt5qPmmn+lOw75MASDXeu/mh38Eq3KMPUe0rEvds8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:198d20e8-1a27-46c8-af52-3dde852d9663,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:0c2fab6d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 975ce8f0833a11f0bd5779446731db89-20250827
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1587904058; Wed, 27 Aug 2025 19:40:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:09 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v7 14/20] media: platform: mtk-mdp3: Add programming flow for unsupported subsys ID hardware
Date: Wed, 27 Aug 2025 19:37:46 +0800
Message-ID: <20250827114006.3310175-15-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
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
flow that checks whether the subsys ID is valid.

If the subsys ID is valid, the flow will call cmdq_pkt_write_subsys()
and cmdq_pkt_write_mask_subsys() instead of the original
cmdq_pkt_write() and cmdq_pkt_write_mask().

If the subsys ID is invalid, the flow will call cmdq_pkt_write_pa() and
cmdq_pkt_write_mask_pa() to achieve the same functionality.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 14 +++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    | 70 ++++++++++++++-----
 2 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index e5ccf673e152..555d35ad553e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -321,7 +321,12 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
+		if (set->subsys_id != CMDQ_SUBSYS_INVALID)
+			cmdq_pkt_write_subsys(&cmd->pkt, set->subsys_id, set->reg,
+					      set->reg, set->value);
+		else /* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_write_pa(&cmd->pkt, set->subsys_id, set->reg,
+					  set->reg, set->value);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,7 +381,12 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
+		if (set->subsys_id != CMDQ_SUBSYS_INVALID)
+			cmdq_pkt_write_subsys(&cmd->pkt, set->subsys_id, set->reg,
+					      set->reg, 0);
+		else /* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_write_pa(&cmd->pkt, set->subsys_id, set->reg,
+					  set->reg, 0);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 681906c16419..ea65a988a26b 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,17 +9,35 @@
 
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
+	if (_i != CMDQ_SUBSYS_INVALID)					\
+		cmdq_pkt_write_mask_subsys(&_c->pkt, _i, _b, _b + _o,	\
+					   _v, _m);			\
+	else /* only MMIO access, no need to check mminfro_offset */	\
+		cmdq_pkt_write_mask_pa(&_c->pkt, _i, _b, _b + _o,	\
+				       _v, _m);				\
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
+	if (_i != CMDQ_SUBSYS_INVALID)					\
+		cmdq_pkt_write_subsys(&_c->pkt, _i, _b, _b + _o, _v);	\
+	else /* only MMIO access, no need to check mminfro_offset */	\
+		cmdq_pkt_write_pa(&_c->pkt, _i, _b, _b + _o, _v);	\
+} while (0)
 
 #define MM_REG_WAIT(cmd, evt)					\
 do {								\
@@ -49,17 +67,33 @@ do {								\
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


