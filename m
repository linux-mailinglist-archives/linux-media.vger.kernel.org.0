Return-Path: <linux-media+bounces-7565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B42428864BD
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 02:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1398CB22784
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 01:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A609AF9D9;
	Fri, 22 Mar 2024 01:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RYqwjLzK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89C1396;
	Fri, 22 Mar 2024 01:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711070908; cv=none; b=Z0bZ88Mw5QfgcocmXboEnelGrjx+Xv9SiD83Id3+Pw8MhbYSLoV5i7uagjYsRpnaUtAH2fY1LwgZeg+JC6tfbikQuGA5/d9tSzPygnSgI0ulzOHRgoYwcjI5nFC+QbVIBILjSDnPIETXKtD15GpCCusREguuHOReSqz6vcerSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711070908; c=relaxed/simple;
	bh=NKoxrW0NsLfAz+NEqzb5Kb2qHbq8zc6N199ryPRlf5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+s3usWlOudIc5TLaWqwThdPJcDwtMGsdvanyYZd9dHNMNMSVkpieo5ofoWWyGaidseH/9jB9AmpQ92H892/qy+f85ZRCK9+bbxisqksM4kSSsFoLzsQ0QcyXcr4axVMIUsFiCHe6PiKRcyDf82ziBc8/JQPb/6PMHI0ShmT5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=RYqwjLzK; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 71ee0e3ce7eb11ee935d6952f98a51a9-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i6qlv/T9mCY/kRP7L6PBaKUMXvMuRth9oyIwujiopfI=;
	b=RYqwjLzKVhRTzfuBjx1iF4zRgd12NboLKtkmFLUCd/6robS5TmNkR+eY3GJUlLaiajlMA0ZEXu+RykUdDuzhfsEqhBz0ib6cyWKHC4UttvTwcY8X5vs2M1dJxxHGa8dLjxJDX6Zzm4rFRkiwjjvWE43BELbbkt+lVcvVCONcWvA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9f0da8bc-2242-4921-8c48-28ba1310fdf2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:12184a85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 71ee0e3ce7eb11ee935d6952f98a51a9-20240322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1243593196; Fri, 22 Mar 2024 09:28:10 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 09:28:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 09:28:09 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v4 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
Date: Fri, 22 Mar 2024 09:27:56 +0800
Message-ID: <20240322012808.26234-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322012808.26234-1-shawn.sung@mediatek.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename all "mtk_drm_ddp_comp" to "mtk_ddp_comp":
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 16 +++++++---------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  6 +++---
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 71e20e8fc4ab8..0f2e1be4ee1cb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -278,9 +278,9 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_crtc *mtk_crtc)
 }
 
 static
-struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
-						struct drm_plane *plane,
-						unsigned int *local_layer)
+struct mtk_ddp_comp *mtk_ddp_comp_for_plane(struct drm_crtc *crtc,
+					    struct drm_plane *plane,
+					    unsigned int *local_layer)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp;
@@ -430,7 +430,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 
 		/* should not enable layer before crtc enabled */
 		plane_state->pending.enable = false;
-		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+		comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
 						  plane_state, NULL);
@@ -521,8 +521,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 			if (!plane_state->pending.config)
 				continue;
 
-			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
-							  &local_layer);
+			comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
@@ -546,8 +545,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 			if (!plane_state->pending.async_config)
 				continue;
 
-			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
-							  &local_layer);
+			comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
@@ -711,7 +709,7 @@ int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 	unsigned int local_layer;
 	struct mtk_ddp_comp *comp;
 
-	comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+	comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 	if (comp)
 		return mtk_ddp_comp_layer_check(comp, local_layer, state);
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 93d79a1366e91..ba985206fdd24 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#ifndef MTK_DRM_DDP_COMP_H
-#define MTK_DRM_DDP_COMP_H
+#ifndef MTK_DDP_COMP_H
+#define MTK_DDP_COMP_H
 
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
@@ -340,4 +340,4 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
-#endif /* MTK_DRM_DDP_COMP_H */
+#endif /* MTK_DDP_COMP_H */
-- 
2.18.0


