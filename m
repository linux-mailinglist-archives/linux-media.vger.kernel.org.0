Return-Path: <linux-media+bounces-33746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F36AC9FCF
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 19:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6FDC173812
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 17:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99816202988;
	Sun,  1 Jun 2025 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ttV3W8/p"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF614F9EB;
	Sun,  1 Jun 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748799260; cv=none; b=DB38iypWG2xnZixE5zuEojc8/U90hebflIrTzq82ocsUUaPHb0oXVxrbPoHfGmGbJKkBXMYXy14nLo/3VEYp4BZig9ToMh8A4DZogz/+FJrXf3HLhPtbZDw+PEfQquMKvY81Q3IcQ4FTlGW8JnVHiZAyNQfMjGhlN6g20CRJ0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748799260; c=relaxed/simple;
	bh=kxJA4QtE0SMkVrLWcVtYSJI2SFRWOBP/2jJcvTH5IBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKRJA4fvOkc9ghGssnqggIn10hysy4tjrHElY7Z8Zrt7LuazByKcdLYsUz8cUItEHxc1D/tdpgzUr6n7tnaXjN7K095p6ACdq3BY8azXW5UmejHJ3b41IzmPSmBU8K7wSAcdZ5fELmq8fHNTz4AdL5cd/STl4KgKTCEJ855mHpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ttV3W8/p; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9dc4856a3f0e11f082f7f7ac98dee637-20250602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MEk5apbmHUi91LZTe+6N734/DDRjLS3LhKnILFnqk3k=;
	b=ttV3W8/ps/+XSHAg15FmhqOeUecVgQLlSBhNM/nl6wdfwi0BOJxoESDVoVpaVuHLCONySgwU+6BBmzfJXmxb7BQJBxboO60Y5G4SCoHo2SVEpohq7+TErbJ5n54eSH+80nSqsdDbPKMAje/TTxJqvvcq5uvXvAY6NYTCxVQQfMs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c3eecfec-abe4-428b-a615-9297409fa98b,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:0ef645f,CLOUDID:32143358-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:nil,Content:3|50,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9dc4856a3f0e11f082f7f7ac98dee637-20250602
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1834305113; Mon, 02 Jun 2025 01:34:05 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 2 Jun 2025 01:33:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 2 Jun 2025 01:34:03 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, "Moudy
 Ho" <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v6 03/20] mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
Date: Mon, 2 Jun 2025 01:31:35 +0800
Message-ID: <20250601173355.1731140-4-jason-jh.lin@mediatek.com>
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

Add the cmdq_mbox_priv structure to store the private data of GCE,
such as the shift bits of the physical address. Then, include the
cmdq_mbox_priv structure within the cmdq_pkt structure.

This allows CMDQ users to utilize the private data in cmdq_pkt to
generate GCE instructions when needed. Additionally, having
cmdq_mbox_priv makes it easier to expand and reference other GCE
private data in the future.

Add cmdq_get_mbox_priv() for CMDQ users to get all the private data
into the cmdq_mbox_priv of the cmdq_pkt.

Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 ++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a3d94f1eb1a3..db72dcd9b8b6 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -102,6 +102,14 @@ static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *p
 	return ((dma_addr_t)addr << pdata->shift);
 }
 
+void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	priv->shift_pa = cmdq->pdata->shift;
+}
+EXPORT_SYMBOL(cmdq_get_mbox_priv);
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index e1555e06e7e5..73b70be4a8a7 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -70,13 +70,31 @@ struct cmdq_cb_data {
 	struct cmdq_pkt		*pkt;
 };
 
+struct cmdq_mbox_priv {
+	u8 shift_pa;
+};
+
 struct cmdq_pkt {
 	void			*va_base;
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
+	struct cmdq_mbox_priv	priv; /* for generating instruction */
 };
 
+/**
+ * cmdq_get_mbox_priv() - get the private data of mailbox channel
+ * @chan: mailbox channel
+ * @priv: pointer to store the private data of mailbox channel
+ *
+ * While generating the GCE instruction to command buffer, the private data
+ * of GCE hardware may need to be referenced, such as the shift bits of
+ * physical address.
+ *
+ * This function should be called before generating the GCE instruction.
+ */
+void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv);
+
 /**
  * cmdq_get_shift_pa() - get the shift bits of physical address
  * @chan: mailbox channel
-- 
2.43.0


