Return-Path: <linux-media+bounces-7268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE987F817
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 08:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB06D1F2234E
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 07:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427A97D3E8;
	Tue, 19 Mar 2024 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O3vRcqqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F635465D;
	Tue, 19 Mar 2024 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710831796; cv=none; b=sdWQTsT9auPrlUmlh+nsv4u0Y6k6rQpYgKEBRnLE0oJBHkICpvSJoXBIcELQW0eal+Kf6pNSulO98NbnS9uMYOC95SQ1w9qlAUeo5NK0p31tZD+gp+2Sn+EQaGrOip6f/PUMHRk3Y9+hD3yAF+egVuBVuxrNgp405/eRTgDO+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710831796; c=relaxed/simple;
	bh=J8PAlSvS6S+W1VRK68CambaGaXTQwsBaBwUnbIpWu58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTvb96tsYZMUrYqKWJizI2MF80DBck14Nd74lH3WMcUqWnXpz/npeXi7ezsxF/WI7ANBX4Uxx71duHReP3KSi09FhZwnaaEMXZ3i74a1zVouLe/IAnpe+4smpbt3M4OpYXtcv4S4oT1gkqGoWSYrgtnS1B9RrhJ0VrvIAKCyRDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=O3vRcqqK; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b9efb8a4e5be11ee935d6952f98a51a9-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o1k/aUAzB2fs9zIPVErc6M8VvXwK6zQtTbz3WRA0EkE=;
	b=O3vRcqqKw5azpNflvfhNTexNdDpsHy/rVoUSL7UrYucjhdGhGqb313uf92igao359eO/qq4eek7cKxvi5Z47DPTE6qsTHA3qQI53U/XKw5Hcc9qpBtm+dPgssgaYL5LWKm0u2LsqBPq2klesI09DSbk4cIvML+hfYPzRuRTqnXk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:f2fd29c6-6267-46b4-812e-709bc9e8cb8d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:62f02a85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b9efb8a4e5be11ee935d6952f98a51a9-20240319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1905259890; Tue, 19 Mar 2024 15:03:02 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:03:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:03:00 +0800
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
Subject: [PATCH v2 14/14] drm/mediatek: Rename mtk_ddp_comp functions
Date: Tue, 19 Mar 2024 15:02:57 +0800
Message-ID: <20240319070257.6443-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240319070257.6443-1-shawn.sung@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename functions of mtk_ddp_comp:
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 45 ++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  3 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c      |  2 +-
 4 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index c3441508f452f..17b0364112922 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -497,10 +497,10 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
 };
 
-static bool mtk_drm_find_comp_in_ddp(struct device *dev,
-				     const unsigned int *path,
-				     unsigned int path_len,
-				     struct mtk_ddp_comp *ddp_comp)
+static bool mtk_ddp_comp_find(struct device *dev,
+			      const unsigned int *path,
+			      unsigned int path_len,
+			      struct mtk_ddp_comp *ddp_comp)
 {
 	unsigned int i;
 
@@ -514,10 +514,10 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
-static unsigned int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
-						       const struct mtk_drm_route *routes,
-						       unsigned int num_routes,
-						       struct mtk_ddp_comp *ddp_comp)
+static unsigned int mtk_ddp_comp_find_in_route(struct device *dev,
+					       const struct mtk_drm_route *routes,
+					       unsigned int num_routes,
+					       struct mtk_ddp_comp *ddp_comp)
 {
 	int ret;
 	unsigned int i;
@@ -554,26 +554,31 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
-unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct device *dev)
+unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	unsigned int ret = 0;
 
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
-				     private->ddp_comp))
+	if (mtk_ddp_comp_find(dev,
+			      private->data->main_path,
+			      private->data->main_len,
+			      private->ddp_comp))
 		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
+	else if (mtk_ddp_comp_find(dev,
+				   private->data->ext_path,
+				   private->data->ext_len,
+				   private->ddp_comp))
 		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
+	else if (mtk_ddp_comp_find(dev,
+				   private->data->third_path,
+				   private->data->third_len,
+				   private->ddp_comp))
 		ret = BIT(2);
 	else
-		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
-							 private->data->conn_routes,
-							 private->data->num_conn_routes,
-							 private->ddp_comp);
+		ret = mtk_ddp_comp_find_in_route(dev,
+						 private->data->conn_routes,
+						 private->data->num_conn_routes,
+						 private->ddp_comp);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index ba985206fdd24..26236691ce4c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -326,8 +326,7 @@ static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
 
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
-unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct device *dev);
+unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fbf63e0441337..bfe8653005dbf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -805,7 +805,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
+	dpi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm_dev, dpi->dev);
 
 	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e29c37fb5be09..67239606adbfc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -836,7 +836,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		return ret;
 	}
 
-	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
+	dsi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm, dsi->host.dev);
 
 	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-- 
2.18.0


