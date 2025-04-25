Return-Path: <linux-media+bounces-31032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4747BA9C3B7
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B733F9A3943
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493B2242D65;
	Fri, 25 Apr 2025 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iwQ1gv79"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB03238C2A;
	Fri, 25 Apr 2025 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573569; cv=none; b=RDKk892NSaw+tJEJN0GVf4qD9pfD8uIcnbySDR5mIWOhs9/Oy6b1souAbRVjQ/uJC01odRWp0YBfJsCFyhY66XqTJJBoS3rGja25TvlQuoIrtlgVKiH+9//Wnhn/b28W5JFzVEbMqlBgz+XjqTZ/KkN2Vc9fWeMmDgyeBsogEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573569; c=relaxed/simple;
	bh=0960oDuYNjeXRIIsq4ROzOv/KhtZzZt8LGjIN7M+AAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7atGoNmM6kmjWFp6QUP6yqgUtwALJ50pEN/mxkW50eaybPCDtaiF6Ux96/t6AkhxLfNggA/amCagMfFz/JO5b1yXVYiwrxdb1MrKJP1irQH7DN/WQoLSSnnfePjZVaXtJfIfGIZeWn2IvieM8VNNGxgzrATdBco8XfcZBWi2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iwQ1gv79; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3c49e27621b811f09b6713c7f6bde12e-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LsUsN4EE5EwB/+2KLgvOGcHLR+PqfABnnnddFvs+ZRY=;
	b=iwQ1gv79ZDb/4o5+E0rgw5ar372d15L8cTR2476OcC6DZ7ctfCPtEEX+59BbEetdJ/OaX/QXv7+UTA/L6Kv2mB2QgnUDMoElY4YvmVzO2kFAtRSKnegUQPczvvSbbWs2wlPNwKMap0Ic1doA/JOc1ToLAhAThAqK70TXxINzoKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:60ac1bcc-7d61-4028-8baa-e47c2ca1820d,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:921d9df0-ff26-40e8-a637-f0e9524b171a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3c49e27621b811f09b6713c7f6bde12e-20250425
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1580111913; Fri, 25 Apr 2025 17:32:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 17:32:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 17:32:40 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <pual-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v5 16/19] soc: mediatek: Add programming flow for unsupported subsys ID hardware
Date: Fri, 25 Apr 2025 17:28:48 +0800
Message-ID: <20250425093237.1543918-17-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
References: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
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
 drivers/soc/mediatek/mtk-mmsys.c | 12 +++++++++---
 drivers/soc/mediatek/mtk-mutex.c |  8 ++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..0c324846e334 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -167,9 +167,15 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	u32 tmp;
 
 	if (mmsys->cmdq_base.size && cmdq_pkt) {
-		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
-					  mmsys->cmdq_base.offset + offset, val,
-					  mask);
+		offset += mmsys->cmdq_base.offset;
+		if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID)
+			ret = cmdq_pkt_write_mask_subsys(cmdq_pkt, mmsys->cmdq_base.subsys,
+							 mmsys->cmdq_base.pa_base, offset,
+							 val, mask);
+		else /* only MMIO access, no need to check mminfro_offset */
+			ret = cmdq_pkt_write_mask_pa(cmdq_pkt, mmsys->cmdq_base.subsys,
+						     mmsys->cmdq_base.pa_base, offset, val, mask);
+
 		if (ret)
 			pr_debug("CMDQ unavailable: using CPU write\n");
 		else
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaa965d4b050..ce444c1998f0 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -969,6 +969,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
+	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -977,8 +978,11 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 		return -ENODEV;
 	}
 
-	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
-		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
+	if (mtx->cmdq_reg.subsys != CMDQ_SUBSYS_INVALID)
+		cmdq_pkt_write_subsys(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
+	else /* only MMIO access, no need to check mminfro_offset */
+		cmdq_pkt_write_pa(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
-- 
2.43.0


