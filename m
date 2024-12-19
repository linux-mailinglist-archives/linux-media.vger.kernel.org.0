Return-Path: <linux-media+bounces-23812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D479F8171
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CF218857D1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894B31A4F2D;
	Thu, 19 Dec 2024 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h/lDEVB2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867C19CD1E;
	Thu, 19 Dec 2024 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628100; cv=none; b=eKZgZ/ZIPIdMiuhEiCmHBixDOI1y6tNknZtYdItb7Cp2ha7TPSOIEchy2EZPZl3gBhhxajcpIiMFBH9KABvaGJihhihBwCWAPZ1pyNFHU8RSTmXv5IdWz4l0JjG4tJ4DG6lSVyppbxHZD7WkeOaCExyebjAoYyP5ZTg7yEYHflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628100; c=relaxed/simple;
	bh=ZKX8+aJhUeaRUn+D5/ZmmgVY8BHaaPZW3gCeCC+W9B4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4NQDY7GbaKXunOb+9iH7UFPOPvJh3txT397eKKyU8oBO3ykTPIa9PoaBAKpLwf4Arf1btqBJnfOHLeTBjkki1F/J1TlCy1X6o23g/bQBgASiaJZoeWoy1fHhCzfH0W4Ow+/EvB4c5YyTaRtcIwxc8JqavJBp/m0l9zDlF0aSW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=h/lDEVB2; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cf805b10be2b11efbd192953cf12861f-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IqoUewImG+TdN/K76GDrUghHXx1ox1BaE+aqhvOf1wk=;
	b=h/lDEVB29sTwq0zM1uq7ENuC76m+OmaW0lks2YKpMlJ5VNSq61PyEFPQYbx6U1nnAiobnGpT1aVY2eGOBX1g3NXI5Nqc7pZ+0NbdrSTVhdkL/GkD44IC11yTZSGxaXzAItx+rLz5n/NTYCwWQSMhl6YOYSMHAv2icuHYN3vgViw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e6f906b4-58e3-4039-bcf7-d4e0b0206760,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:1f666813-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cf805b10be2b11efbd192953cf12861f-20241220
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 576663365; Fri, 20 Dec 2024 01:08:04 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 01:08:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 01:08:03 +0800
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
Subject: [PATCH v3 7/7] media: mediatek: mdp3: Add programming flow for unsupported subsys ID hardware
Date: Fri, 20 Dec 2024 01:08:00 +0800
Message-ID: <20241219170800.2957-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
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


