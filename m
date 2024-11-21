Return-Path: <linux-media+bounces-21714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 388099D46BB
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 05:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A313BB240A9
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C231CCEF7;
	Thu, 21 Nov 2024 04:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f0fPbLT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B61C9EB4;
	Thu, 21 Nov 2024 04:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732163177; cv=none; b=GhiL5vOaAagprJeY+BGwHx4Wpp9/9qOiTap6BXOgzXnUvFzO391Z4fq7PQTnPZw3PRlKW31YOLS8FvgOzsmKOiS/SBRYI3CA4a4Rq8kKqSrbt4Uw7X4yQC6ynVJMoGRVM44O3QI3hhBV7uka3VfTBcL7S/VtLO9RFQGNepxJ9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732163177; c=relaxed/simple;
	bh=C9OCyW7cdrZXOJpf5xc4ODfCrJ+i2VFQ4GnalLiPl4I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3aiXb2ApErpUuQrcmkZVqoJUcUdPzr/9u7QCeMe73MODtL70FAxB1fjs/160M4Y4Iu2had5hcJJTJA/dSW6nmAsbXUHxl9AUK+uFPx7dr8zZh2NLSTf0udbX1Jab2KF1P3KV469fzj4m+vG6gE0L5tSZmx+72MPeVuimhZg3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=f0fPbLT1; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b944a170a7c011efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y/HYZkCjMi/ix73of1+xF02BKJkJHJdcSOfEK1SDWV4=;
	b=f0fPbLT1s9gY3xhUQ7t2E7p8nEVbdkmCjD3sWwt26sl+duv3T9nrgPCqPx+F6YmZhApFRJewIYyC+nI2xEpxEDeOq2thQkRk3d7IpBIhkRLu+zU2bwe8GEX0RmyWCy9xp1f6lnPsBbKydAOjSQOMye7ognDncql470mp8TQl85A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:e1e2530d-a765-43be-8dde-fc6b95361400,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:e41a8fa0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b944a170a7c011efbd192953cf12861f-20241121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2056932415; Thu, 21 Nov 2024 12:26:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
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
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID programing flow
Date: Thu, 21 Nov 2024 12:25:58 +0800
Message-ID: <20241121042602.32730-5-jason-jh.lin@mediatek.com>
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
X-MTK: N

When GCE executes instructions, the corresponding hardware register
can be found through the subsys ID.
For unsupported subsys ID hardware, the physical address need to be used
to generate GCE instructions.

Add the pa_base interface to the instruction programming flow for these
unsupported subsys ID hardware.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 90 ++++++++++++++++++++++----
 include/linux/soc/mediatek/mtk-cmdq.h  | 22 ++++---
 2 files changed, 92 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0a05ee87a0fc..ffdf3cecf6fe 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
@@ -60,11 +61,18 @@ int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx)
 {
 	struct of_phandle_args spec;
+	struct resource res;
 	int err;
 
 	if (!client_reg)
 		return -ENOENT;
 
+	if (of_address_to_resource(dev->of_node, 0, &res) != 0) {
+		dev_err(dev, "Missing reg in %s node\n", dev->of_node->full_name);
+		return -EINVAL;
+	}
+	client_reg->pa_base = res.start;
+
 	err = of_parse_phandle_with_fixed_args(dev->of_node,
 					       "mediatek,gce-client-reg",
 					       3, idx, &spec);
@@ -73,7 +81,10 @@ int cmdq_dev_get_client_reg(struct device *dev,
 			"error %d can't parse gce-client-reg property (%d)",
 			err, idx);
 
-		return err;
+		/* make subsys invalid */
+		client_reg->subsys = U8_MAX;
+
+		return 0;
 	}
 
 	client_reg->subsys = (u8)spec.args[0];
@@ -130,6 +141,9 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
 
 	pkt->buf_size = size;
 
+	/* need to use pkt->cl->chan later to call mbox APIs when generating instruction */
+	pkt->cl = (void *)client;
+
 	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
 				  DMA_TO_DEVICE);
@@ -189,32 +203,65 @@ static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
 	return cmdq_pkt_append_command(pkt, inst);
 }
 
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
+int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base, u16 offset, u32 value)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_WRITE,
 		.value = value,
 		.offset = offset,
 		.subsys = subsys
 	};
-	return cmdq_pkt_append_command(pkt, inst);
+	int err;
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_subsys_is_valid(cl->chan, subsys)) {
+		err = cmdq_pkt_append_command(pkt, inst);
+	} else {
+		err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
+		if (err < 0)
+			return err;
+
+		err = cmdq_pkt_write_s_value(pkt, 0, CMDQ_ADDR_LOW(offset), value);
+	}
+
+	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_write);
 
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 			u16 offset, u32 value, u32 mask)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	u16 offset_mask = offset;
 	int err;
 
-	if (mask != GENMASK(31, 0)) {
-		err = cmdq_pkt_mask(pkt, mask);
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_subsys_is_valid(cl->chan, subsys)) {
+		if (mask != GENMASK(31, 0)) {
+			err = cmdq_pkt_mask(pkt, mask);
+			if (err < 0)
+				return err;
+
+			offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+		}
+		err = cmdq_pkt_write(pkt, subsys, pa_base, offset_mask, value);
+	} else {
+		err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
 		if (err < 0)
 			return err;
 
-		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+		err = cmdq_pkt_write_s_mask_value(pkt, 0, CMDQ_ADDR_LOW(offset), value, mask);
 	}
-	return cmdq_pkt_write(pkt, subsys, offset_mask, value);
+	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
@@ -385,20 +432,39 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
 }
 EXPORT_SYMBOL(cmdq_pkt_set_event);
 
-int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		  u16 offset, u32 value)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_POLL,
 		.value = value,
 		.offset = offset,
 		.subsys = subsys
 	};
-	return cmdq_pkt_append_command(pkt, inst);
+	int err;
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (!cmdq_subsys_is_valid(cl->chan, subsys)) {
+		err = cmdq_pkt_assign(pkt, CMDQ_POLL_ADDR_GPR, pa_base);
+		if (err < 0)
+			return err;
+
+		inst.offset = CMDQ_ADDR_LOW(offset);
+		inst.subsys = CMDQ_POLL_ADDR_GPR;
+	}
+
+	err = cmdq_pkt_append_command(pkt, inst);
+
+	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_poll);
 
-int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		       u16 offset, u32 value, u32 mask)
 {
 	int err;
@@ -408,7 +474,7 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		return err;
 
 	offset = offset | CMDQ_POLL_ENABLE_MASK;
-	return cmdq_pkt_poll(pkt, subsys, offset, value);
+	return cmdq_pkt_poll(pkt, subsys, pa_base, offset, value);
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..0edc51ff4296 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -52,6 +52,7 @@ struct cmdq_operand {
 
 struct cmdq_client_reg {
 	u8 subsys;
+	u32 pa_base;
 	u16 offset;
 	u16 size;
 };
@@ -114,24 +115,26 @@ void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
  * cmdq_pkt_write() - append write command to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
+int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base, u16 offset, u32 value);
 
 /**
  * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  * @mask:	the specified target register mask
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 			u16 offset, u32 value, u32 mask);
 
 /*
@@ -272,12 +275,13 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event);
  *		     instruction.
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		  u16 offset, u32 value);
 
 /**
@@ -288,13 +292,14 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
  *		          instruction.
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  * @mask:	the specified target register mask
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		       u16 offset, u32 value, u32 mask);
 
 /**
@@ -421,12 +426,13 @@ static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *p
 
 static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
-static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
+static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
+				 u16 offset, u32 value)
 {
 	return -ENOENT;
 }
 
-static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 				      u16 offset, u32 value, u32 mask)
 {
 	return -ENOENT;
@@ -477,13 +483,13 @@ static inline int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+static inline int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 				u16 offset, u32 value)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+static inline int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 				     u16 offset, u32 value, u32 mask)
 {
 	return -EINVAL;
-- 
2.43.0


