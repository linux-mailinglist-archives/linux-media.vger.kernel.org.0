Return-Path: <linux-media+bounces-41170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6801B38190
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 13:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29497C38CF
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C4835A2A4;
	Wed, 27 Aug 2025 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ipY/VwOx"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4624352099;
	Wed, 27 Aug 2025 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294827; cv=none; b=I1NkIJCHK5XNrF1L51Kgp2spneuNnpWbrIhounURdkhGBcE7sTATgBYBKXXfVH/54n+eUxTIFbuIPikqwVNfzLQk3rGKFMPiCfTGkBRRIL54uBRpNQqxGl1ggoUoQht8UQHhABmboLEsiSLCSYCNJW5SF/gcP8PLFQz50wLnHQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294827; c=relaxed/simple;
	bh=Tnb0v9DAsbD78BYKAlc1+fKMwW4a9pk2M4KH4C16yt0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vCVOcNQjoDGw8TDzaQ6MFc+mXjtP4/UYufno2l70CeaZbkElmNliAZW6uyOnbEIlRdx9X8nK5YWOUG1mCGkzYkM0ucWihBR2H6O63gKDwQimxwuOXTF5a2+hSp/AqrGLMDg1TZbNW+qaKksKVzHjposo98uvaBXs0LaxKUlP8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ipY/VwOx; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 97244b26833a11f0bd5779446731db89-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R+Mk750hzu8WqkwCFlMfZnGEd3cRmEz0FnIHubJzlQg=;
	b=ipY/VwOx1Uuz+Q5oE8otk2PMuaNPlIYI0Xhkc40OjSygehkcrII7okzT93XwQJKqSzFpei244o51sYkG7K7pimICLBJvyey4ItnyYxAUOyKqdzrGX4Wybdj6qVj/QvVt3vQRKpLLXZXzeZ6nTP2FuupmHwxl5Ncp8Q25+ctF848=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:dd50cb72-5bba-4a76-86b0-f9731bdcc911,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:dba59020-786d-4870-a017-e7b4f3839b3f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97244b26833a11f0bd5779446731db89-20250827
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 944528733; Wed, 27 Aug 2025 19:40:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:09 +0800
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
Subject: [PATCH v7 12/20] soc: mediatek: Add programming flow for unsupported subsys ID hardware
Date: Wed, 27 Aug 2025 19:37:44 +0800
Message-ID: <20250827114006.3310175-13-jason-jh.lin@mediatek.com>
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
index 38179e8cd98f..9b22d7e09d99 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -990,6 +990,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
+	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -998,8 +999,11 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
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


