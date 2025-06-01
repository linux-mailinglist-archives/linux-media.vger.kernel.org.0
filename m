Return-Path: <linux-media+bounces-33754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3071AC9FE0
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 19:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E59F3B65FE
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 17:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1956B214A7C;
	Sun,  1 Jun 2025 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U1h6dKnt"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE8E1EDA39;
	Sun,  1 Jun 2025 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748799263; cv=none; b=IJazNasb5Ai7diwMt6TjVFabPUzoS/AMIt1yuc22HuwIPnjI55K06swV8Rf+U13Mk7osIX0xoT0nGejrBwAP51b98LpYLcH07wi+zpM0W1piixArw6vglzKECn7y3m/1eWaF5/ZOuChiRjCaw6oMWeFOH88Z9QHQ8N+K7bPXz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748799263; c=relaxed/simple;
	bh=juIRRbg03ZDhYFdIqRBn6AoZpvhaCgPRD9X0KX/G3yI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YByZYO2IvVwQa6lR+HjVVWkZps0+2MigNyhtVMNQQR4WgQu0Xe+vGhlI9jhXb7TjDc9LnszdeHnumdfhirhA2qx9ahHONAXcrgyhdcieD4Vr+e3e0Tk0GecdczQ6a/jJxOJaihB4k1lFL2p1jsJhTlE6hapx9kb3Z8c/aV0oY2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=U1h6dKnt; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9e4cb11a3f0e11f0813e4fe1310efc19-20250602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QRm2ZBj01ExcdoMgmYichtr29lp5+djxG/jIXWfxSLI=;
	b=U1h6dKntqFekBIqqX/lOVJJGzv89Cx6bryJ/a6NQ/AxtBH6FMSpYDqn0hS/Y9M+2gfyq/L3BOMuVbhhHLu1iIYBNHPHFRLvtGsrNZ/4sPe0FLSEjZ1HD5U4zseuP4qBpWzfl9nOEj7MXXBmcGQrQqQZraeYVJKUyW/WMGP8MfGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d2dff3a6-7b5f-4c33-b7e5-255fb4376bc6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e5315659-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9e4cb11a3f0e11f0813e4fe1310efc19-20250602
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1644523; Mon, 02 Jun 2025 01:34:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 2 Jun 2025 01:34:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 2 Jun 2025 01:34:04 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v6 07/20] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
Date: Mon, 2 Jun 2025 01:31:39 +0800
Message-ID: <20250601173355.1731140-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
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
always add 2G to ensure proper access.
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
index e2ea12e9aecb..6f4b9879069e 100644
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
@@ -102,12 +103,12 @@ struct gce_plat {
 
 static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
 {
-	return (addr >> pdata->shift);
+	return ((addr + pdata->mminfra_offset) >> pdata->shift);
 }
 
 static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
 {
-	return ((dma_addr_t)addr << pdata->shift);
+	return (((dma_addr_t)addr << pdata->shift) - pdata->mminfra_offset);
 }
 
 void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
@@ -115,6 +116,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
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


