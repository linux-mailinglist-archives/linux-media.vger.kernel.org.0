Return-Path: <linux-media+bounces-26252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2047A392E8
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 06:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AFD3B19F0
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 05:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AAD1C8624;
	Tue, 18 Feb 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N+vRRnFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD971B4138;
	Tue, 18 Feb 2025 05:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857459; cv=none; b=pypEHaBYCRYW6KMepJjbroyFQOX0zDDdc1CpGuFeKsKC12lbAgMvJNi20Yj+QZvHMO2OM5OGxp+imwPyN6KRn090RRPfQ2w88D1WaCJqITS8KIMZmrD62vi2/y0RJrw8GCcDqJCVw6qtZSCbK15yis6ujeBLO0w5PoZWMt36IPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857459; c=relaxed/simple;
	bh=nnE1ut1jSD3vt7RLndwwhz7JLeRaGP0CmHjFJlnsbxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rvjbFJ6XqlySS6BmKmcqFfQOMk/IuqlRn0wPF4I1SocjDbO6tyBg7/RxQsDyOpi7MsAh30rYPmAGnas8drtDwR2wirMfiMeVpLQ3n7IQo3YWXHnHw/FOVmkDBwmwa2hCOPLvPspHNctg5eSxSlEpopaEf+uFFNc/WLVRum1M7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N+vRRnFr; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5f629856edbb11ef8eb9c36241bbb6fb-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z1Wjvednu/rjhZIrwrlv9mqV5VR7DobcRMfllqmXVVs=;
	b=N+vRRnFrVxcCIsqfHyfsbfQS9W3u5t2E1JPl56DkvBx3JBpP7wIP2VPR1p9TbjKyqUyDg92SCb/TsBXF1xaKK86g+k9RIS6KBz6AwBMT4KPCFriN5h88QiF2G/TfzFBFWRXkD+DKuyL451kT9eIsLGI8cqdm5qzzMp0fOXlSCrw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:45843685-03fc-435d-a98a-926d1324565c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:464e7ba3-3e52-4e5b-a515-5e42bbdb1515,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f629856edbb11ef8eb9c36241bbb6fb-20250218
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 348458646; Tue, 18 Feb 2025 13:44:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
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
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 6/8] soc: mediatek: Add programming flow for unsupported subsys ID hardware
Date: Tue, 18 Feb 2025 13:41:51 +0800
Message-ID: <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
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
---
 drivers/soc/mediatek/mtk-mmsys.c | 14 +++++++++++---
 drivers/soc/mediatek/mtk-mutex.c | 11 +++++++++--
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..ce949b863b05 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -167,9 +167,17 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	u32 tmp;
 
 	if (mmsys->cmdq_base.size && cmdq_pkt) {
-		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
-					  mmsys->cmdq_base.offset + offset, val,
-					  mask);
+		offset += mmsys->cmdq_base.offset;
+		if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID) {
+			ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+						  offset, val, mask);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			ret = cmdq_pkt_assign(cmdq_pkt, CMDQ_THR_SPR_IDX0,
+					      CMDQ_ADDR_HIGH(mmsys->cmdq_base.pa_base));
+			ret |= cmdq_pkt_write_s_mask_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
+							   CMDQ_ADDR_LOW(offset), val, mask);
+		}
 		if (ret)
 			pr_debug("CMDQ unavailable: using CPU write\n");
 		else
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb..3788b16efbf4 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -963,6 +963,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
+	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -971,8 +972,14 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 		return -ENODEV;
 	}
 
-	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
-		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
+	if (mtx->cmdq_reg.subsys != CMDQ_SUBSYS_INVALID) {
+		cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, 1);
+	} else {
+		/* only MMIO access, no need to check mminfro_offset */
+		cmdq_pkt_assign(cmdq_pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(en_addr));
+		cmdq_pkt_write_s_value(cmdq_pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_LOW(en_addr), 1);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
-- 
2.43.0


