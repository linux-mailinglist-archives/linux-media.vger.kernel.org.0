Return-Path: <linux-media+bounces-21715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2AA9D46BC
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 05:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F37E9B2479F
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CB51CD1EF;
	Thu, 21 Nov 2024 04:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p/Qgp7uA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3772B1CB30C;
	Thu, 21 Nov 2024 04:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732163177; cv=none; b=VWph2ZhzTOe+rDaLs/rUF52Jo8fcDYYW0Ekp30Fnk01zNXJ3IRYysX6WyORWAN5P59cbGMct7FlI9rY/mcK/+1AVJSrY6CDiyAkcDu+c0u0EBJDSLpgOGlO609sPWoeR1PzcwsUQNpRVy/yXbeQN/h+7wjzayChg8W1+0vZnZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732163177; c=relaxed/simple;
	bh=9fpFuSjiZC4dJLDxS0beg5UST/eKv9MvTfzXFg4YPso=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zn8sK2bW3w1m0lkE48AKMi9Of3DPJ4kabL7vZmtTQkq9n0tsBh0PPIBh+U2fzPpI1h+gnX2XGce/lbVhbPV5Y33jS3AaXSb12GOelq52wAW0rH/Ba8hULv8Ir6jG7eUBlzRQv8TGJHj1nv3Z5+HTjONwuAT99UAgvbOT+/WawiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=p/Qgp7uA; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ba09844aa7c011efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pJCFc1OQsen4rsXnmsJum2puZtEe0fBX/9xhASMal3M=;
	b=p/Qgp7uAl+6AnJ37E2di2Kj9WIgli9KIxUwQg8skZKDjWSncc79Qq048HXMAqNzcYu5MOqTnKOuwyPz4b/Y8CeA5WaeVdTLGslYKMpeYjC4MpQbmW25ymYcDuUj8+mJAFzh9qVgbDBWQY1shknaNI0SDklHm15AO7m9w72m0p54=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:160580c9-e1ab-4534-9208-b34dec144efe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:ce35d6fe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ba09844aa7c011efbd192953cf12861f-20241121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1143150836; Thu, 21 Nov 2024 12:26:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Moudy
 Ho" <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 6/8] soc: mediatek: Add pa_base due to CMDQ API change
Date: Thu, 21 Nov 2024 12:26:00 +0800
Message-ID: <20241121042602.32730-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.420500-8.000000
X-TMASE-MatchedRID: a5Zc1W+6pasb+BGg6rnrdlPjo7D4SFg4IaLR+2xKRDI1LB46LFAAklO4
	BD7nLMxnThbvLLI8RvNxTDN5srStblaPccVLXikr3fn7n/ZHGqY7r2Gtb9iBYVXdM0K2S6BLo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtriF8GJbJ7jv0js1w2OBfhLxKAgnaA3iZzTfVF1lm48rTfa
	w/tOCbS5e4OF8mjA0lChPZULW94+/Ur16VAwTuWzCcCv3MmaOcwZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5QBJtcKcOYfpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.420500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 30F0D8B66EC909941A41B3B45EF3B0870FA9D95285365047AEC6AF992A86191E2000:8
X-MTK: N

To support non-subsys ID hardware on new SoCs, the CMDQ API has been
changed to include the pa_base parameter. This change accommodates
the new interface requirements.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 1 +
 drivers/soc/mediatek/mtk-mutex.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..e485d76ec283 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -168,6 +168,7 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 
 	if (mmsys->cmdq_base.size && cmdq_pkt) {
 		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+					  mmsys->cmdq_base.pa_base,
 					  mmsys->cmdq_base.offset + offset, val,
 					  mask);
 		if (ret)
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb..ad7bd27a6007 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -971,7 +971,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 		return -ENODEV;
 	}
 
-	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
+	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, mtx->cmdq_reg.pa_base,
 		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
 	return 0;
 }
-- 
2.43.0


