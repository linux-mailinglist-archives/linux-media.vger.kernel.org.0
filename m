Return-Path: <linux-media+bounces-63536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F05VLpnpH2o0sQAAu9opvQ
	(envelope-from <linux-media+bounces-63536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:45:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE1635D30
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=bwtR636M;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63536-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63536-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A90E7307F175
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA5E43E9FE;
	Wed,  3 Jun 2026 08:41:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC042E00B;
	Wed,  3 Jun 2026 08:41:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476088; cv=none; b=dbUYVfGYbGM3nxeKBMhRajoWpBa9bTX4EueP4ECqV4Hs62Ogjp9WsbYmVem9rETTtp+6fuMALqXjdDY/9tfvpirC32LgtCKGgOXdQnaNUga2U2Dam/kH6wRAX3O9YStJt3snL06K61/9k9Jamomcbu3oz4MvywGxIr5/9wnXygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476088; c=relaxed/simple;
	bh=kIjUJqC8FrjKT3wvBwif52KEmvzM9Q//Xl2xvRA+zvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkhHHmMSEDp4wpbLR9kTrRWA98y1D7YpmwqwGfoCR77WfwHcp88OeUSdhlOXoPyEHdJWo7ElNQGpYPCBE1+JMBpA3TZylFskpZLcTqwx3617AmnG07Knru1Kpo77jmbTBSVlgfnoCNWk2ctOSKqUppgmO5CL80im3EyiU0bax24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bwtR636M; arc=none smtp.client-ip=60.244.123.138
X-UUID: fe1471485f2711f1b1788b6acf885367-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lzmgDv9sE6PSViPwSemiCEZvqH9OBLYu3f0c1nD8mzs=;
	b=bwtR636Maqha73r7QRxpWtQ1s+vL1fR+h8TswiQQLWMN3G5kx1fhDHkVRcP3EwfvSa/IjSWvXAf2QxD+gIt2Dm/Ptt9LGNKuk/5FikHKfDFYqtfkGfrv1hdWfoUGqT1xVCDDxxKD3C6GYWtCl2uxeBxWuPnhwfUt4y4cWykBJoU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:b8516718-0127-49c1-b6c0-1253be3d429d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:79634f20-87a8-421b-982c-f5939dba7cba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe1471485f2711f1b1788b6acf885367-20260603
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 441847901; Wed, 03 Jun 2026 16:41:19 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:16 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 08/14] media: mediatek: vcodec: clean xpc status
Date: Wed, 3 Jun 2026 16:40:38 +0800
Message-ID: <20260603084045.17488-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63536-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,163.com,ideasonboard.com,pengutronix.de,vivo.com,zju.edu.cn,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:kees@kernel.org,m:hverkuil+cisco@kernel.org,m:haoxiang_li2024@163.com,m:fshao@chromium.org,m:wenst@chromium.org,m:laurent.pinchart+renesas@ideasonboard.com,m:sebastian.fricke@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:rongqianfeng@vivo.com,m:jacopo.mondi@ideasonboard.com,m:irui.wang@mediatek.com,m:fanwu01@zju.edu.cn,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:kyrie.wu@mediatek.com,m:sakari.ailus@linux.intel.com,m:tzungbi@kernel.org,m:tfiga@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:hverku
 il@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54BE1635D30

From: Yunfei Dong <yunfei.dong@mediatek.com>

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        | 28 +++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        | 13 +++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index 881d5de41e05..e4e527fe54dc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -61,6 +61,31 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec_dev *vdec_dev)
 	return 0;
 }
 
+static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_offset, u32 val, u32 mask)
+{
+	void __iomem *reg_addr = reg_base + reg_offset;
+	u32 reg_val;
+
+	reg_val =  readl(reg_addr);
+	reg_val &= ~mask;
+	reg_val |= (val & mask);
+	writel(reg_val, reg_addr);
+}
+
+static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
+{
+	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
+
+	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+		return;
+
+	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
+	mask = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_MASK : VDEC_XPC_CORE_MASK;
+
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, val, mask);
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, 0, mask);
+}
+
 static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 {
 	struct mtk_vdec_hw_dev *dev = priv;
@@ -88,6 +113,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
+	mtk_vdec_hw_clean_xpc(dev);
+
 	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
 	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
@@ -166,6 +193,7 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->hw_idx = hw_idx;
 	subdev_dev->main_dev = main_dev;
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
+	subdev_dev->reg_base[VDEC_HW_XPC] = main_dev->reg_base[VDEC_HW_MISC];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
 	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
index 83fe8b9428e6..5c906143c9af 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
@@ -18,17 +18,26 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define VDEC_XPC_CLEAN_ADDR 0xc
+#define VDEC_XPC_LAT_VAL BIT(0)
+#define VDEC_XPC_LAT_MASK BIT(0)
+
+#define VDEC_XPC_CORE_VAL BIT(4)
+#define VDEC_XPC_CORE_MASK BIT(4)
+
 #define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) ((hw_idx) != MTK_VDEC_LAT_SOC)
 
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
- * @VDEC_HW_SYS : vdec soc register index
+ * @VDEC_HW_SYS:  vdec soc register index
  * @VDEC_HW_MISC: vdec misc register index
- * @VDEC_HW_MAX : vdec supported max register index
+ * @VDEC_HW_XPC:  vdec xpc register index
+ * @VDEC_HW_MAX:  vdec supported max register index
  */
 enum mtk_vdec_hw_reg_idx {
 	VDEC_HW_SYS,
 	VDEC_HW_MISC,
+	VDEC_HW_XPC,
 	VDEC_HW_MAX
 };
 
-- 
2.45.2


