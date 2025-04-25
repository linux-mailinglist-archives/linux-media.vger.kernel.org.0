Return-Path: <linux-media+bounces-31042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B87C2A9C3D7
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCB827B5C62
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BF0248894;
	Fri, 25 Apr 2025 09:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ip9IG0TV"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E8241662;
	Fri, 25 Apr 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573572; cv=none; b=dS/jc6LSNUExTzpTFNr2Tjq++hsj7gs+7DlPPUJCGKgb5v2Sr+JUITJQQm6RaQJrgAkY2qnTsM+cW/YZcE6Qi3Rb0I35Zja06G4EOI0c8w2EC8Maxh6gELnr2Lyre1vpJHdd4ARfK/HThsojr2T1hLyHJDRNlDsaEDTiplhmhu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573572; c=relaxed/simple;
	bh=cXmqpQ2zVMpAk5TOXk5ulNe5nKFWFV8jUE90oXY/TUk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QK7C+ZY2XzjgoCVYJwuFnbBX7aNJqWBGTPZUMsdqhzZi+ZFKCi4u3gPGxqplxCKk8VAc4pLeLzodKXNr1IFZftZHixC+sZyK9T+7PmpxvP04+P/sUg6wj4uANDFqrQu5VSlXkje0l0swgoSim/RH6lxss+q/hySZ5SU3h/sDx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ip9IG0TV; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3c3766e621b811f09b6713c7f6bde12e-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6VbUAEeV39eL80nnS9lHM6fAPeFr3119Wt/l0LVAUKA=;
	b=ip9IG0TViOh0WjDhtbzkZLxk/JSINYrYhZ+t1Xt9ET1+M9TSNvxdVNxAeAyu6J4LMf1srQZzGapZhD+m7I9wDFSq9a2CKIbBTtbmpCAbbfyWKana62Vo+OB/0f/UxnvjX1Q7XHncPQWUYWe0CLm9Shw1GmkIlp1FOConQGBdoZQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5ee56e8e-0236-450f-a189-9e952c3cb18d,IP:0,UR
	L:0,TC:0,Content:41,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:41
X-CID-META: VersionHash:0ef645f,CLOUDID:9b39cb76-5fec-4b3e-b8cb-933843551e81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3c3766e621b811f09b6713c7f6bde12e-20250425
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 737590061; Fri, 25 Apr 2025 17:32:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
	<singo.chang@mediatek.com>, Paul-PL Chen <pual-pl.chen@mediatek.com>, "Moudy
 Ho" <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v5 19/19] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Fri, 25 Apr 2025 17:28:51 +0800
Message-ID: <20250425093237.1543918-20-jason-jh.lin@mediatek.com>
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

The original cmdq_pkt_write() and cmdq_pkt_write_mask() only supported
generating GCE instructions with subsys ID. They have been replaced by
cmdq_pkt_write_pa(), cmdq_pkt_write_subsys(), cmdq_pkt_write_mask_pa()
and cmdq_pkt_write_mask_subsys().

These 2 functions can now be removed as they are no longer in use.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 49 ++++++++++----------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 35 ------------------
 2 files changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0a718ffa5f3b..5822a3d13bda 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -201,18 +201,6 @@ static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
 	return cmdq_pkt_append_command(pkt, inst);
 }
 
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	struct cmdq_instruction inst = {
-		.op = CMDQ_CODE_WRITE,
-		.value = value,
-		.offset = offset,
-		.subsys = subsys
-	};
-	return cmdq_pkt_append_command(pkt, inst);
-}
-EXPORT_SYMBOL(cmdq_pkt_write);
-
 int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
 		      u16 offset, u32 value)
 {
@@ -229,27 +217,16 @@ EXPORT_SYMBOL(cmdq_pkt_write_pa);
 int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
 			  u16 offset, u32 value)
 {
-	return cmdq_pkt_write(pkt, subsys, offset, value);
+	struct cmdq_instruction inst = {
+		.op = CMDQ_CODE_WRITE,
+		.value = value,
+		.offset = offset,
+		.subsys = subsys
+	};
+	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_write_subsys);
 
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-			u16 offset, u32 value, u32 mask)
-{
-	u16 offset_mask = offset;
-	int err;
-
-	if (mask != GENMASK(31, 0)) {
-		err = cmdq_pkt_mask(pkt, mask);
-		if (err < 0)
-			return err;
-
-		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
-	}
-	return cmdq_pkt_write(pkt, subsys, offset_mask, value);
-}
-EXPORT_SYMBOL(cmdq_pkt_write_mask);
-
 int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
 			   u16 offset, u32 value, u32 mask)
 {
@@ -267,7 +244,17 @@ EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
 int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
 			       u16 offset, u32 value, u32 mask)
 {
-	return cmdq_pkt_write_mask(pkt, subsys, offset, value, mask);
+	u16 offset_mask = offset;
+	int err;
+
+	if (mask != GENMASK(31, 0)) {
+		err = cmdq_pkt_mask(pkt, mask);
+		if (err < 0)
+			return err;
+
+		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+	}
+	return cmdq_pkt_write_subsys(pkt, subsys, pa_base, offset_mask, value);
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 4a2acceb8581..f4663fbfb5a0 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -113,17 +113,6 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
  */
 void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_write() - append write command to the CMDQ packet
- * @pkt:	the CMDQ packet
- * @subsys:	the CMDQ sub system code
- * @offset:	register offset from CMDQ sub system
- * @value:	the specified target register value
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
-
 /**
  * cmdq_pkt_write_pa() - append write command to the CMDQ packet with pa_base
  * @pkt:	the CMDQ packet
@@ -150,19 +139,6 @@ int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
 			  u32 pa_base /*unused*/, u16 offset, u32 value);
 
-/**
- * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
- * @pkt:	the CMDQ packet
- * @subsys:	the CMDQ sub system code
- * @offset:	register offset from CMDQ sub system
- * @value:	the specified target register value
- * @mask:	the specified target register mask
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-			u16 offset, u32 value, u32 mask);
-
 /**
  * cmdq_pkt_write_mask_pa() - append write command with mask to the CMDQ packet with pa
  * @pkt:	the CMDQ packet
@@ -460,11 +436,6 @@ static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *p
 
 static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
-static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 				    u32 pa_base, u16 offset, u32 value)
 {
@@ -477,12 +448,6 @@ static inline int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
 	return -ENOENT;
 }
 
-static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
-				      u16 offset, u32 value, u32 mask)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 					 u32 pa_base, u16 offset, u32 value, u32 mask)
 {
-- 
2.43.0


