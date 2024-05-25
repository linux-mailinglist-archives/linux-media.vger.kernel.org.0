Return-Path: <linux-media+bounces-11879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE18CF231
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 01:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8283E281150
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 23:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C12912B16E;
	Sat, 25 May 2024 23:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M99oINRF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2783127E34;
	Sat, 25 May 2024 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716679781; cv=none; b=RxrH6gF+ThdWSB6I0EUOEuS5ELVpgjAX+jc3hrE9PnUQAf5Sg6iySY7LYbIFRD4l191aZUT7umn24IiqRVUNsoehKZSqukbQUmHWx+gKKi06o5UYEC80FkIfTa9JX7TOQuLqkzbRGE3OlxT16h8MSOJnKIOufC41FR79IQvME3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716679781; c=relaxed/simple;
	bh=PBNn0jdNfUp4z8i6OCekSOpLNXWwmbOY9aEsHfW/x5E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xd0fq7UR+eDDP+nboAoE8+dgJVWtmEZxPd4olw6dRxUdzpXGReLEKJth4N7An8f1x+u5chqin1lfP92L6cm4mCDrtnNIaueqhOlglLhSKq3ejisIiYIOCTEZKjo8HKzeEPhu+iekEzWI1VQdLsSlv8bxZeUCx+Pbh2F2H615HY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=M99oINRF; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a452f6a41aee11ef8c37dd7afa272265-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Tl2QN13jl/RXNBMTp3Wzf+yLZtDlERtwTZOrjciV6eA=;
	b=M99oINRFyM9yICI92W0c3g6n6V1A4krihoJGlUgqEXeDep49dmgcE9n1oZdSF7slV+67OTq1Hzo5SoG2w3Y8tFGb+61GrInuRwDdVXQOg9FuaBddUB9hAd57M9EmgnceCRUxyVaPA20y/cAiL3zBCES2kUbGvg8pyLPIdOl9oNg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:7915aedf-e663-40c8-a289-c5881c836dad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:e060cd43-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a452f6a41aee11ef8c37dd7afa272265-20240526
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1552233013; Sun, 26 May 2024 07:29:33 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:29:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:29:31 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason-ch
 Chen" <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>
Subject: [PATCH v6 7/7] drm/mediatek: Add cmdq_insert_backup_cookie before secure pkt finalize
Date: Sun, 26 May 2024 07:29:28 +0800
Message-ID: <20240525232928.5524-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.595200-8.000000
X-TMASE-MatchedRID: XAa2d/45j8Tob/hVdrvnXjPDkSOzeDWW+eBf9ovw8I27eXIF2U7rKy+8
	OxujShyxE/UmhJjBrzZC3mgca9yt8kttpN+KVVd9syNb+yeIRArvJY9pBzgg1P+RKQghHjkeBgH
	mCxujQvyjmrD+IUq29hI7tf+6KnxtiBoFctaOhN8jRwcsjqWGAgrefVId6fzVCqIJhrrDy2/jZY
	67L74Lw7o3/co+ykK6UFTYnego7LJccQ8eam5EfRRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7gRuY
	qpRzYwt5tYzjYMxVNFdPwsV1FdNCbaRD1c+EJMdvuvB6gAgryg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.595200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	9AEA3DB8CB88483491FE005922C30F1CE0AE72AEC367029CE1464088C652F4422000:8
X-MTK: N

Add cmdq_insert_backup_cookie to append some commands before EOC:
1. Get GCE HW thread execute count from the GCE HW register.
2. Add 1 to the execute count and then store into a shared memory.
3. Set a software event siganl as secure irq to GCE HW.

Since the value of execute count + 1 is stored in a shared memory,
CMDQ driver in the normal world can use it to handle task done in irq
handler and CMDQ driver in the secure world will use it to schedule
the task slot for each secure thread.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 59f6263ae806..0df9bf695f65 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -178,6 +178,7 @@ void mtk_crtc_disable_secure_state(struct drm_crtc *crtc)
 
 	cmdq_sec_pkt_set_data(&mtk_crtc->sec_cmdq_handle, sec_scn);
 
+	cmdq_sec_insert_backup_cookie(&mtk_crtc->sec_cmdq_handle);
 	cmdq_pkt_finalize(&mtk_crtc->sec_cmdq_handle);
 	dma_sync_single_for_device(mtk_crtc->sec_cmdq_client.chan->mbox->dev,
 				   mtk_crtc->sec_cmdq_handle.pa_base,
@@ -795,6 +796,8 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
+		if (cmdq_handle->sec_data)
+			cmdq_sec_insert_backup_cookie(cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
 		dma_sync_single_for_device(cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
-- 
2.18.0


