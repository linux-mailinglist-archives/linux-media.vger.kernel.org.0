Return-Path: <linux-media+bounces-56945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDxAAaNhw2m1qQQAu9opvQ
	(envelope-from <linux-media+bounces-56945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:16:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 780AA31F935
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D397C3060BC0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B592EBB86;
	Wed, 25 Mar 2026 04:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cur7N8ZL"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495EB2DC79F;
	Wed, 25 Mar 2026 04:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411509; cv=none; b=m47NF1fLAFsBqq6INXxuhR+A53yfUlIWrLirNzfIjYNk4+OBLKCNgIVk9pv+6njCeqRJTyp/sOjay8GLh+jo6lvYJiZw++VUbFNdemWofa1YJyJHQI2bxQSbCUm6KVAkSOU5DXWsrTYsi1vfj5Ak4irYZNfS0KoLFWqsOkHrxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411509; c=relaxed/simple;
	bh=htkOtGvaV4AcgMcPGKDQonuDRdeUFq+5Th+tYc++qA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ole6pMTgB/R187gkHNC71pY6pB+/W1dUjINiX0PhOLV/ctUamVbgobr3LQp+Aafyn4eb09aYz27A5oEZUuwAPjYAU5BLN3i0wp2humSQIPMfmbMnUmgyvodEAXfk5nslb+RWnKYhRiYQSPXW4lhRXMg9hrzKLEI8jf889YawDJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Cur7N8ZL; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: caaa9b5227ff11f1a39cd589f645bc18-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5EmVMlVF6F/sW77krrXtoXn+FTQFaHjK8lLFyo5xvjw=;
	b=Cur7N8ZL7Cmfiy+JHzPi68NZUtxIA0IxQZbXMlB0iOayEULa0wxIKEJihU2zls+z25E+4bTH5yg/najCX36DaccM1rBLL1eJIS+KlDtey0e/6GAGYMOhUcPM8Gc10AKwFatFTMCUZSlgkKXFCYO5Cjj0w21W1f/AJf2PT018+Ck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4c4494ea-2e38-4a75-9ee2-795bd476cf1f,IP:0,U
	RL:0,TC:0,Content:39,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:39
X-CID-META: VersionHash:e7bac3a,CLOUDID:afb92d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: caaa9b5227ff11f1a39cd589f645bc18-20260325
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1543015400; Wed, 25 Mar 2026 12:04:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:04:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:04:58 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 2/3] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Wed, 25 Mar 2026 12:04:21 +0800
Message-ID: <20260325040457.2113120-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,ndufresne.ca];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56945-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason-jh.lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid]
X-Rspamd-Queue-Id: 780AA31F935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original cmdq_pkt_write() and cmdq_pkt_write_mask() only supported
generating GCE instructions with subsys ID. They have been replaced by
cmdq_pkt_write_pa(), cmdq_pkt_write_subsys(), cmdq_pkt_write_mask_pa()
and cmdq_pkt_write_mask_subsys().

These 2 functions can now be removed as they are no longer in use.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 49 ++++++++++----------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 35 ------------------
 2 files changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 9cec6a096d8b..be5e6d80f4c0 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -215,18 +215,6 @@ static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
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
@@ -243,27 +231,16 @@ EXPORT_SYMBOL(cmdq_pkt_write_pa);
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
@@ -281,7 +258,17 @@ EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
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
index be67bee043ce..0e8fb4743d18 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -124,17 +124,6 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
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
@@ -161,19 +150,6 @@ int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
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
@@ -471,11 +447,6 @@ static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *p
 
 static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
-static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
-{
-	return -ENOENT;
-}
-
 static inline int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
 				    u32 pa_base, u16 offset, u32 value)
 {
@@ -488,12 +459,6 @@ static inline int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
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


