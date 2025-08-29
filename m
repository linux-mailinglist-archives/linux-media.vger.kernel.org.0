Return-Path: <linux-media+bounces-41324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02969B3B6EF
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45CB71C254A1
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6F0304975;
	Fri, 29 Aug 2025 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C9EZxGZT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F812F0680;
	Fri, 29 Aug 2025 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459060; cv=none; b=DlfdjZ8p9wWdsNZ3xNcJXdjaUNwW2GaC62amVFS083JxkGhVA/gwrO5rmbCf1RroJgWIjYE0C6rAWllyBeHheZrt36p83Aof8g+XXwHPBHdgtUQF4EGEe1a921s75RqVKs+x6cjhBn5+9fJ2nhT3XqKbe2YclQGs0sQzaW5S3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459060; c=relaxed/simple;
	bh=QwLc9VF5JieXCNfOisZ3GBSrXR0Pw0Pg+/cLb+FUYzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l3kE8qQzjnUneuWDh8JMOnlrU+5QnAFAXo5uv2WoCcfRd/p/apYI4OfZZl+tEtb+kwokxkYl0iWFeU7/Yq/h4C7u04DT8k4yCq0kdcpWiC9uxEXbiuMqi6eIAbSGrHC5QVCCBiM8hVIW7Q8Cg9K6EGVjOumZURHafoLzIF5KY3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=C9EZxGZT; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fc9c060e84b811f0bd5779446731db89-20250829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gR2Eo+J2cJi0h9wrzKWKG6q+OkJdztAxAqpHMtTyJqw=;
	b=C9EZxGZT9Rngx+WYblmG7jHb43MuksXtzPMurGT6EmQg3MmbG1ybl40ik/2VTyaDbAdEcxk6Yeg61hjolmyqH95ifdFZVFYrD0mjc9WjQ62sb+x8xPoof9rbESvsKNDeA1F74u7qlwMqPg6li88RRGMTV96prshASj5Hb2ji/P0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:584547db-8b40-43ee-aad0-dc1464491cee,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:743f3a84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fc9c060e84b811f0bd5779446731db89-20250829
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 614642119; Fri, 29 Aug 2025 17:17:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 29 Aug 2025 17:17:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 29 Aug 2025 17:17:28 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jassi Brar
	<jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Jarried
 Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 2/3] drm/mediatek: Add pm_runtime support for GCE power control
Date: Fri, 29 Aug 2025 17:15:59 +0800
Message-ID: <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Call pm_runtime_resume_and_get() before accessing GCE hardware in
mbox_send_message(), and invoke pm_runtime_put_autosuspend() in the
cmdq callback to release the PM reference and start autosuspend for
GCE. This ensures correct power management for the GCE device.

Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index bc7527542fdc..c4c6d0249df5 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -283,6 +283,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	unsigned int i;
 	unsigned long flags;
 
+	/* release GCE HW usage and start autosuspend */
+	pm_runtime_mark_last_busy(cmdq_cl->chan->mbox->dev);
+	pm_runtime_put_autosuspend(cmdq_cl->chan->mbox->dev);
+
 	if (data->sta < 0)
 		return;
 
@@ -618,6 +622,9 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		mtk_crtc->config_updating = false;
 		spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 
+		if (pm_runtime_resume_and_get(mtk_crtc->cmdq_client.chan->mbox->dev) < 0)
+			goto update_config_out;
+
 		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 		goto update_config_out;
-- 
2.43.0


