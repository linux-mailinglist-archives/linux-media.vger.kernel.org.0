Return-Path: <linux-media+bounces-41163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07597B38179
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 13:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 506AA7C188F
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE0534F465;
	Wed, 27 Aug 2025 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KweMr8TN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382143009F2;
	Wed, 27 Aug 2025 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294822; cv=none; b=eFY7WIE+AoGWZFFlJlBesitzkxdXwTLn89xblPh4MMHkASpLfFa3ywverjVLCti8yXWKES4AnMngNUPH+9d0q5u3sPvva9DNrg9mzCUgZNGInWb0OjSsu3ewg63d6zYR3SPF5/DVKLKmOr2Jf6RjLHTIQFRQ4nxClkq6ou8yXIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294822; c=relaxed/simple;
	bh=SFAcojSL2jDAukmkUyRfmrdsfZ0VELxienvz9o8PpJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzlpNb4W/w3SODKhQkJb+UqgLTcoQ2Rw6FeW0iS05hq6tXhOUCSXbepOSGEQPwn9oqz0E3PvWIw5G/LTtegNwGFHhzVcykcW5q6Vw4bIS1SR/7i3UK19x0rRp0sbh01QczZCNJhUJKX2yOVgogs0sgHxjS4frQcmk484JftDCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KweMr8TN; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 97d2d98e833a11f0b33aeb1e7f16c2b6-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iQxCoOCqsZHU8A1prUiG+GmIjC8ilUubmuUCjBqPW74=;
	b=KweMr8TNOU9o8+QoEkm71T78xV9Jeu0eY3P+N14NHJ9Ac/bx6DRIpNHZI5UQRmCjdQpHiR9gV4WVq0h+esMFqC8PVKwejFKJb+6oBBjZ8padPGfis1nDR0kxGngydVzEEtC6W/qo0EfVcT7oylHW67kXL65RWKbnjHnAmLcB0ls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:d32da5a6-edac-44c1-9a63-b104d971d780,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:152fab6d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97d2d98e833a11f0b33aeb1e7f16c2b6-20250827
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 816942646; Wed, 27 Aug 2025 19:40:12 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:10 +0800
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
Subject: [PATCH v7 18/20] soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and cmdq_pkt_jump_rel_temp()
Date: Wed, 27 Aug 2025 19:37:50 +0800
Message-ID: <20250827114006.3310175-19-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Since all users have migrated to the new cmdq_pkt_jump* APIs without
shift_pa, the wrapper APIs cmdq_pkt_jump() and cmdq_pkt_jump_rel_temp()
can be removed.

Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  6 ------
 include/linux/soc/mediatek/mtk-cmdq.h  | 15 ---------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 749c40a1bac8..0a718ffa5f3b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -569,12 +569,6 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_rel);
 
-int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
-{
-	return cmdq_pkt_jump_rel(pkt, offset);
-}
-EXPORT_SYMBOL(cmdq_pkt_jump_rel_temp);
-
 int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index bcbb99999c3e..4a2acceb8581 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -412,12 +412,6 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
  */
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr);
 
-/* This wrapper has to be removed after all users migrated to jump_abs */
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
-{
-	return cmdq_pkt_jump_abs(pkt, addr);
-}
-
 /**
  * cmdq_pkt_jump_rel() - Append jump command to the CMDQ packet, ask GCE
  *			 to execute an instruction that change current thread
@@ -430,9 +424,6 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
  */
 int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset);
 
-/* This wrapper has to be removed after all users migrated to jump_rel */
-int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
-
 /**
  * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
  * @pkt:	The CMDQ packet
@@ -587,12 +578,6 @@ static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 	return -EINVAL;
 }
 
-/* This wrapper has to be removed after all users migrated to jump_rel */
-static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
-{
-	return -EIMVAL;
-}
-
 static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 {
 	return -EINVAL;
-- 
2.43.0


