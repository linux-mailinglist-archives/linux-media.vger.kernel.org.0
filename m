Return-Path: <linux-media+bounces-26249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B9A392E1
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 06:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15A616E11F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 05:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8787C1BAEDC;
	Tue, 18 Feb 2025 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Sf5yPC0L"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11D01B0F19;
	Tue, 18 Feb 2025 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857457; cv=none; b=aBfB/OrmZOzpmX+ztAQDnZ8LRJDbJ6JnwAWh6uhRfuBFBESfCMW2j+NuQuoQDp5j/nLduMTIUkZC6IUl9kLsCWSb782EUhYRwrjE2prQx6bipay1+ow0k3jnX/7/FnDKg85NpXGYPs1KWx5WRBMxQj1tRolz5V0SqQE8Ai2b7Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857457; c=relaxed/simple;
	bh=pPTpwcLzq6r+8IBBzy+pR4nLocSEQcUt5mLXaAaIXNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgLWcGInDZke3ujQDRHxxoqdmqoDBGqwrdArrIVcB5p7gGftB2ht3c+2F9/xiYemXI0xpTAbFbtPgMf5RZ+Fa0QufvloQgBbr3AB7IT/syIeJwWITmX3oWHApXghCDAXnDip3Mxff2l3o2X/ew9dKNW0dvjS3T88X8QsGkhltvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Sf5yPC0L; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5f0ca32eedbb11ef8eb9c36241bbb6fb-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=16qVnWJETzYCBI/G7qk2QXntrX6kWjk4/6o0632dmJg=;
	b=Sf5yPC0LwUBL2Zjm10X5FkP+YC4ciFNzBAmZr5qD8plm5LKr/v9n47Q2gNU8LFSRQnXKxAvcKUUk08HY+sVpzR1iFGGIU9eAiWK0bnIpU7Ina5hZ2IRbmm0CuoXgbtyyszDT+gPXRu9zJGmCGvoigkkTig4trdfkFOAxJOuVV90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:81a90111-68f7-4477-960b-a23278f6dea0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:7c82770b-46a1-4805-887b-d6afca075802,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f0ca32eedbb11ef8eb9c36241bbb6fb-20250218
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 381055688; Tue, 18 Feb 2025 13:44:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>, CK Hu
	<ck.hu@mediatek.com>
Subject: [PATCH v4 7/8] drm/mediatek: Add programming flow for unsupported subsys ID hardware
Date: Tue, 18 Feb 2025 13:41:52 +0800
Message-ID: <20250218054405.2017918-8-jason-jh.lin@mediatek.com>
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
cmdq_pkt_assign() and cmdq_pkt_write_s_value() to achieve the same
functionality.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 33 ++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e6..219d67735a54 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -66,14 +66,37 @@ struct mtk_ddp_comp_dev {
 	struct cmdq_client_reg cmdq_reg;
 };
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static void mtk_ddp_write_cmdq_pkt(struct cmdq_pkt *cmdq_pkt, struct cmdq_client_reg *cmdq_reg,
+				   unsigned int offset, unsigned int value, unsigned int mask)
+{
+	offset += cmdq_reg->offset;
+
+	if (cmdq_reg->subsys != CMDQ_SUBSYS_INVALID) {
+		if (mask == GENMASK(31, 0))
+			cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys, offset, value);
+		else
+			cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys, offset, value, mask);
+	} else {
+		/* only MMIO access, no need to check mminfro_offset */
+		cmdq_pkt_assign(cmdq_pkt, 0, CMDQ_ADDR_HIGH(cmdq_reg->pa_base));
+		if (mask == GENMASK(31, 0))
+			cmdq_pkt_write_s_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
+					       CMDQ_ADDR_LOW(offset), value);
+		else
+			cmdq_pkt_write_s_mask_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
+						    CMDQ_ADDR_LOW(offset), value, mask);
+	}
+}
+#endif
+
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
 	else
 #endif
 		writel(value, regs + offset);
@@ -85,8 +108,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
 	else
 #endif
 		writel_relaxed(value, regs + offset);
@@ -98,8 +120,7 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
-				    cmdq_reg->offset + offset, value, mask);
+		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
-- 
2.43.0


