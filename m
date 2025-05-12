Return-Path: <linux-media+bounces-32284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE78AB3355
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14643189DD4E
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E55265602;
	Mon, 12 May 2025 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SgtLeOtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA725DD1C;
	Mon, 12 May 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041787; cv=none; b=stY0xj6cANEb9rc/wJLK6SbdQl7f78SLf4NKTjBaxW6y2mawVf6gwHm6BLeW5iAYDosNBLHUBESNdn2hJg2yilA6DBwi1vj29fbCCiuFhD7gkIld6Zx39+xtTaL5bMORa6AjiatO7mFeN7PmeP+jseHNS0+FV8fmWKPTMdMo3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041787; c=relaxed/simple;
	bh=+JNLVk8Dk234DB1LQg144wzUoIAn1k8v3NxsNaz1PT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvpbPdWM7D5/CPsXXfOz0ehWaF1adPArXrux9BuJJfk9xOaki32cqApYHYzovO/X4OCOg4J8+zdBeUSjBeODGjVCpRwXsiuROdlWezJVvi+IOHsErRRhpb26GEq+/ARDirJbpggcdlTqQJ7EOYBbPeGOqEduaUZEuSrIxxoayz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SgtLeOtD; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b01762522f1211f082f7f7ac98dee637-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s/Emsgo1Fv+5++N/J+XZ4Z2j98D9hVpjfPoLn+OvEnk=;
	b=SgtLeOtDyQkuHdzkFYTZnT8pthCVsoWNyCab/0G+o1ZL9PZOYHSAPX5c0u4daz3Qj1hbwgm7Uc4tVsGNRVLTs//qGh8rCI90L+ESDmvBkoHeKviVhDffaFMp9es07mEpMilVUWFdP2P3pnnxMNoXDB/c2K3ZWUubSsceBQ/8VuI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1047b9e3-6c63-4ffa-a859-9cb2cc140326,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:52736d51-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b01762522f1211f082f7f7ac98dee637-20250512
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1543023735; Mon, 12 May 2025 17:22:55 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 12 May 2025 17:22:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 12 May 2025 17:22:52 +0800
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
Subject: [PATCH RESEND v5 05/20] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa
Date: Mon, 12 May 2025 17:19:27 +0800
Message-ID: <20250512092252.905629-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
References: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Since shift_pa will be stored into the cmdq_mobx_priv of cmdq_pkt, all
the shif_pa parameters in CMDQ helper APIs can be removed.

Add cmdq_pkt_jump_rel_temp() for the current users of cmdq_jump_rel(),
and then remove shift_pa after all users have migrated to the new APIs.

Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 include/linux/soc/mediatek/mtk-cmdq.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 0c3906e8ad19..67fd0924747b 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -377,6 +377,12 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
  */
 int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
 
+/* This wrapper has to be removed after all users migrated to jump_rel */
+static int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	return cmdq_pkt_jump_rel(pkt, addr, shift_pa);
+}
+
 /**
  * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
  * @pkt:	The CMDQ packet
-- 
2.43.0


