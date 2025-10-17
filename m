Return-Path: <linux-media+bounces-44824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F23EBE6CFB
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 598EF5048A2
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A25C3128C8;
	Fri, 17 Oct 2025 06:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B5atQyOX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CE30FF01;
	Fri, 17 Oct 2025 06:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683847; cv=none; b=YLjw+/XPMANBKrTAnN4OG+xF150xmn0cCWdchlMWCN3RhSm5jz1lA3n1E+/xjUKAD4LSxXXg1nJF9TJ3655pR/WanIMXn3x9ugNhZMvIxVvkY09mxs9h+3/kClnIbgU7G64FoDltO+DJ68xPum8XgjukvRs65h/yyncsEZteADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683847; c=relaxed/simple;
	bh=Y0v7MGdp4ZGLe7RTa8zI+FECX5/Wqg9KWjXaQG5KED8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqbUiyoqJwIw6Wg5FOXInBLOMMuAOXFbto9r/xkwwgwARs9tfKXbLziMLVGLHWyQ/2WAN8xfdc7kRYD6i1VujGq7ubZ05ab1uZRRsv4uwJr48UeVx74qcJJC43lAiT4C9FsVtWuSieBVyrgMsnp7n8hfvaHswPvis0zX4sdO95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=B5atQyOX; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9342c02eab2511f0b33aeb1e7f16c2b6-20251017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9MwtMN0iR0jMC6Ckm/qIjGNHW/ZledAi7Jai3jpKVN4=;
	b=B5atQyOX+ZVs7QDSkw0dtm8le3yO8mQMPzuVNxRYyjWoWgQuaTUTLFLsi6xOzP+HZFkM/NJFWS+ZGdUJxSdlCbjDhsnlWpx06OUFAzs2KRNOHOKdzFcgQJrcdBpzv3ZgKkQyz/aIqYFCzeZOJIGxFr6ceVZn656bBrQgMlNhwFs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2828086f-40f7-4e39-95ad-0ec2ededee69,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f6c07d02-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9342c02eab2511f0b33aeb1e7f16c2b6-20251017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1210927998; Fri, 17 Oct 2025 14:50:32 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:30 +0800
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
Subject: [PATCH v8 07/20] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
Date: Fri, 17 Oct 2025 14:44:32 +0800
Message-ID: <20251017065028.1676930-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The GCE in MT8196 is placed in MMINFRA and requires all addresses
in GCE instructions for DRAM transactions to be IOVA.

Due to MMIO, if the GCE needs to access a hardware register at
0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
the MMINFRA will not know whether to write to the hardware register or
the DRAM.
To solve this, MMINFRA treats addresses greater than 2G as data paths
and those less than 2G as config paths because the DRAM start address
is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
less than 2G.
For example, if the DRAM start address 0x8000_0000 is mapped to
IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
the address in the GCE instruction. MMINFRA will then see it as a
data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.

Since the MMINFRA remap subtracting 2G is done in hardware and cannot
be configured by software, the address of DRAM in GCE instruction must
always add 2G to ensure proper access. After that, the shift functions
do more than just shift addresses, so the APIs were renamed to
cmdq_convert_gce_addr() and cmdq_revert_gce_addr().

This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
instructions.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 6 ++++--
 include/linux/mailbox/mtk-cmdq-mailbox.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a544108ddae7..a9c06e4bbad4 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -94,6 +94,7 @@ struct cmdq {
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	dma_addr_t mminfra_offset;
 	bool control_by_sw;
 	bool sw_ddr_en;
 	bool gce_vm;
@@ -103,13 +104,13 @@ struct gce_plat {
 static inline u32 cmdq_convert_gce_addr(dma_addr_t addr, const struct gce_plat *pdata)
 {
 	/* Convert DMA addr (PA or IOVA) to GCE readable addr */
-	return addr >> pdata->shift;
+	return (addr + pdata->mminfra_offset) >> pdata->shift;
 }
 
 static inline dma_addr_t cmdq_revert_gce_addr(u32 addr, const struct gce_plat *pdata)
 {
 	/* Revert GCE readable addr to DMA addr (PA or IOVA) */
-	return (dma_addr_t)addr << pdata->shift;
+	return ((dma_addr_t)addr << pdata->shift) - pdata->mminfra_offset;
 }
 
 void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
@@ -117,6 +118,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
 	priv->shift_pa = cmdq->pdata->shift;
+	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
 
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 73b70be4a8a7..07c1bfbdb8c4 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -72,6 +72,7 @@ struct cmdq_cb_data {
 
 struct cmdq_mbox_priv {
 	u8 shift_pa;
+	dma_addr_t mminfra_offset;
 };
 
 struct cmdq_pkt {
-- 
2.43.0


