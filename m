Return-Path: <linux-media+bounces-26250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F3A392E3
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 06:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD73716E499
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 05:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC1D1BCA07;
	Tue, 18 Feb 2025 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sUqToYsG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E71B0421;
	Tue, 18 Feb 2025 05:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857458; cv=none; b=uzEviWC/uLClwH49aIVXkc+x2P+C76hYSMvHEHi60ig4jBnitfI0ZYX1sxMY/hKsof6wru38XLj0s8QSqWv+BXKAKyT/na6AUmELwLQtLmzUqyx8UI3MzJoAzN+ychzMH+U+BS8xqY9YimoLQbJ5/aRGoatbxuFDCzag7XjhdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857458; c=relaxed/simple;
	bh=U2jctCuaPm5+zRPhbdQS3H9HIdt2oCbr+1Rfdu5GtYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pjgzqexj+omAuBEok53+XTURH6JiAKx6mypM72ImuzWJyKErIG/CgEp9As+MeDf5SFsayIt6G3Kn4lL+ItT4px3VG1LdFPK14kwPAScGU4yJzxd8iw7jGyju7PIlVBFUQZayYB+7DnXHiAt3QteeZyFCgJnrCzac0e2gEKRLoIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sUqToYsG; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5f548338edbb11efaae1fd9735fae912-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/tKxS03PG0Vffgu5/sgRrkk00CkhFa/vPJwapkUlzZ0=;
	b=sUqToYsGIH6spNdSCZipZT1n57tg2VGXezDxkeXJx8mMeNeqOTlfDwTwnASbIZIrwdNuJNNHJTq5ewVvNztU+OVwhLsb36fL0zrDmWsXWyxLIITG3d4jnztBBHNZbLVFJEbanQ421vjCrKBbtHIY1yaamwQgdkon32eGUYxSOF0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5f2a1c0c-099d-403e-948e-0477178d7eb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:20f5a5c6-e2f2-45f6-b8aa-31e67885facd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f548338edbb11efaae1fd9735fae912-20250218
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 405618976; Tue, 18 Feb 2025 13:44:08 +0800
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
Subject: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM address
Date: Tue, 18 Feb 2025 13:41:50 +0800
Message-ID: <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
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

Since GCE has been moved to mminfra in MT8196, all transactions from
mminfra to DRAM will have their addresses adjusted by subtracting a
mminfra offset.
This information should be handled inside the CMDQ driver, allowing
CMDQ users to call CMDQ APIs as usual.

Therefore, CMDQ driver needs to use the mbox API to get the
mminfra_offset value of the SoC, and then add it to the DRAM address
when generating instructions to ensure GCE accesses the correct DRAM
address.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 35 ++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index aa9853100d78..f2853a74af01 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -314,10 +314,22 @@ EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
 int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	const u16 high_addr_reg_idx  = CMDQ_THR_SPR_IDX0;
 	const u16 value_reg_idx = CMDQ_THR_SPR_IDX1;
 	int ret;
 
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, src_addr))
+		src_addr += cmdq_get_offset_pa(cl->chan);
+
+	if (cmdq_addr_need_offset(cl->chan, dst_addr))
+		dst_addr += cmdq_get_offset_pa(cl->chan);
+
 	/* read the value of src_addr into high_addr_reg_idx */
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(src_addr));
 	if (ret < 0)
@@ -428,10 +440,19 @@ EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
 int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = { {0} };
 	u8 use_mask = 0;
 	int ret;
 
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, addr))
+		addr += cmdq_get_offset_pa(cl->chan);
+
 	/*
 	 * Append an MASK instruction to set the mask for following POLL instruction
 	 * which enables use_mask bit.
@@ -509,11 +530,21 @@ EXPORT_SYMBOL(cmdq_pkt_assign);
 
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
-		.offset = CMDQ_JUMP_ABSOLUTE,
-		.value = addr >> shift_pa
+		.offset = CMDQ_JUMP_ABSOLUTE
 	};
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, addr))
+		addr += cmdq_get_offset_pa(cl->chan);
+
+	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
-- 
2.43.0


