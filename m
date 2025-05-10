Return-Path: <linux-media+bounces-32209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72010AB21F4
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 10:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5045A1BA4A37
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A56A216E23;
	Sat, 10 May 2025 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Nm4pP7FU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E620E037;
	Sat, 10 May 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863915; cv=none; b=SGq2CKTdOw9pJHX0hL5TMwgesBEmh2CsHvFgak/j/9jLolrbFjc537+jbbJkys4+oeT1kFrG2SAgg5nU8ZDOsfJKLwwYnFlxZRvIP+ZQUeITzjGKWPEZyzHZT0sBjFzuTZ2YMxnNh1XrApdo7U3TQGAZb9T74Uzc/bk0apC/jBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863915; c=relaxed/simple;
	bh=wZVTHELJFA9mmm0+pn6MhxF0Ymq6OWdRExdEDaC0T8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jyu6mQkO11ufDvd/szHoe20Iwil+ty/cfpGx9tp99hy5xyFWjmSe71FgCqWULFdDe4R8rql/2g7IZpxl49n9zoP26S7zAc5H/e0AGavYwkpXFwNvpZOMBaysMXYGq53MqS5hE1+v6kybTW2E9pAqLuGf2pmFLcWJqreB1ym9jd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Nm4pP7FU; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8ec5d3762d7411f082f7f7ac98dee637-20250510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1DaH92ZrdWo9roRC40NzfJDmEBQDhmyRGkeKzqXzwHw=;
	b=Nm4pP7FUFxOta1oC0qcL3KMDxlWPBTk/mJtuH6SnfeaEvLM7QYBSqWWDeytzF2S8V0Yi91FeoH1R/xfwfe2xipfU2KghingpijEYzzNhx1Bhe7LVGexvbQQXtGBInq+E61VREY4JV5asFXj3FOavBkExdvxZ4YKiBkoOEvXBhGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:920eebe9-2524-4b44-b21d-4c73fdc21397,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5dcedcf9-d2be-4f65-b354-0f04e3343627,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8ec5d3762d7411f082f7f7ac98dee637-20250510
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2038221257; Sat, 10 May 2025 15:58:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 10 May 2025 15:58:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 10 May 2025 15:58:24 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 10/14] media: mediatek: vcodec: clean xpc status
Date: Sat, 10 May 2025 15:53:40 +0800
Message-ID: <20250510075357.11761-11-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250510075357.11761-1-yunfei.dong@mediatek.com>
References: <20250510075357.11761-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
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
index 83fe8b9428e6..50ce6c1d25a2 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
@@ -18,17 +18,26 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define VDEC_XPC_CLEAN_ADDR 0xC
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
2.46.0


