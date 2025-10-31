Return-Path: <linux-media+bounces-46099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CFEC26189
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 17:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6250A463CF5
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6520C2FD1B1;
	Fri, 31 Oct 2025 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kTCXevOI"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319F27781D;
	Fri, 31 Oct 2025 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926845; cv=none; b=diZqIkuHNKdyYBFowSB+GvPmgRpbv2KisuPES0RWo5o1+LfJ889rqq92mVQ6JqIFxW+q0BTXJToVZ3UzSYdW2rwpp7qzJQG5pOX7/XqEjs3JVMA2vgL29bfk4T6G2nn1oBBQo6LEPIh5khp77aSQ3cSmCgpRvkDFEHGjjC3ULyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926845; c=relaxed/simple;
	bh=4kprG1xZFyNqWCz9VSxftbB2Ao9/CeVGi4QBbjTJrzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nu8Up31F9xrzkhc4wa8mFe6oLoRzQqz8nFbMgPoBdRFQLCNT6cqbnCB+FOzxyZTuA4UA1BDbLCQiLWhQTC37WqBglTRlnqkq0zAMRzfVvoPVe/IYMYcdnRWYdm2j6mi89NCwAMxQY02OsDZ5+SrxXZ1bPgA9y4Wucifi1VxQv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kTCXevOI; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: aab74564b67311f0b33aeb1e7f16c2b6-20251101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yBGogwJ3gJvMByILwNYsTeGqpn8gtm0aMI/9PjvDSJQ=;
	b=kTCXevOIc2Y0dMOAxizu2QyeOQrTxQGXsw7kNukBYZxPgIeEuOGSdD7A9d60T/SZOJOJL2j/PWSlmWvCBSPs70uq+hVRZ+GOclNkRCeRGKPTfgD0oCvd0UU6PwafRMypRPP51Xj7+Ib8EBVU9t6r8Lrzclza4BwnuZBuvy+HFWE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6aec3d5e-7bc3-4d59-b6a6-88f5e888909a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1b22e76a-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aab74564b67311f0b33aeb1e7f16c2b6-20251101
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1762788598; Sat, 01 Nov 2025 00:07:15 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:07:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:07:13 +0800
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
Subject: [PATCH 1/2] soc: mediatek: mtk-cmdq: Remove shift_pa parameter from cmdq_pkt_jump()
Date: Sat, 1 Nov 2025 00:06:49 +0800
Message-ID: <20251031160712.1657810-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031160712.1657810-1-jason-jh.lin@mediatek.com>
References: <20251031160712.1657810-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Since shift_pa will be stored in the cmdq_mbox_priv structure within
cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.

Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
and cmdq_pkt_jump_rel().

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  6 +++---
 include/linux/soc/mediatek/mtk-cmdq.h  | 20 ++++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 67e5879374ac..a266cd9efcdb 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -562,7 +562,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
@@ -573,11 +573,11 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
 
-int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
-		.value = (u32)offset >> shift_pa
+		.value = (u32)offset >> pkt->priv.shift_pa
 	};
 	return cmdq_pkt_append_command(pkt, inst);
 }
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a7ea1a957a9e..056f726d118b 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -418,17 +418,15 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
  *			 contains more instruction.
  * @pkt:        the CMDQ packet
  * @addr:       absolute physical address of target instruction buffer
- * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
- *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr);
 
 /* This wrapper has to be removed after all users migrated to jump_abs */
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
-	return cmdq_pkt_jump_abs(pkt, addr, shift_pa);
+	return cmdq_pkt_jump_abs(pkt, addr);
 }
 
 /**
@@ -438,12 +436,10 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
  *			 target address should contains more instruction.
  * @pkt:	the CMDQ packet
  * @offset:	relative offset of target instruction buffer from current PC.
- * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
- *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset);
 
 /**
  * cmdq_pkt_jump_rel_temp() - Temporary wrapper for new CMDQ helper API
@@ -460,7 +456,7 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
  */
 static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
 {
-	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
+	return cmdq_pkt_jump_rel(pkt, offset);
 }
 
 /**
@@ -602,17 +598,17 @@ static inline int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 {
 	return -EINVAL;
 }
-- 
2.43.0


