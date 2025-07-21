Return-Path: <linux-media+bounces-38155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 152AFB0C1D9
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 12:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C2A47AF6D3
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 10:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCA4293C56;
	Mon, 21 Jul 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bhgqtZWk"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54836290D8C;
	Mon, 21 Jul 2025 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095337; cv=none; b=IFZMKS/C5CRAkvWG7Ht8qlwSKH8Vrael8lG4GXLdpBoFGuZrcQBOZEp+oCh1C4RYZo9V7puVsq7yJCInz1RZ8AiWtJshSianfjxBKf/ws4T3FOUX8nv+R7nzcw1Bfz+3R+78Lv72A2B5PWZ+04g6LuyDPbM4eEAKqULRBSv4nzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095337; c=relaxed/simple;
	bh=pK2ks1hK8M8X85NH5G2hAwzrVRwYcsTt9WfT/99n9KM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9xSbI14NBTHWGnwmRfC61ZXD/uDPAbmc3Z8OZ0FP4PqrMZX39/Q92DQ2wrdnb4oAmpgooNpWsV1WSCvFovHiEx+G7eXr14dVUF/Pi7RFfUPvZ6z/a7G+1mi+4fevTHLwtEL83PQLvxjj8gmVQxE492oNxbBykzXS/r/YJySSB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bhgqtZWk; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 36a38162662111f08b7dc59d57013e23-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PENGVBez1iKQo8DG6bSJoSPkqHuz4q03TiXxtDwZ8BQ=;
	b=bhgqtZWkeTRfpWFKFlhmEMq00LUjBGmO+8Oapi9m6ct70QMHeLXTP6G6Wlb8sRD6R+lBmqKs/4JpExclu5e5xGZcEP1BJOSjjmPOErmvr6qzJ1hO6ZanBOwJQZk3xsG/9Da0WYAvGGWuetlBnXVQ4FA4b52xCeSmuBT0KVLs40M=;
X-CID-CACHE: Type:Local,Time:202507211839+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:7deed097-0160-4ebd-9236-50a9008fc28b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:5a86ab84-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 36a38162662111f08b7dc59d57013e23-20250721
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1471492699; Mon, 21 Jul 2025 18:55:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 18:55:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 18:55:25 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v1 2/8] media: mediatek: vcodec: add decoder compatible to support MT8189
Date: Mon, 21 Jul 2025 18:55:14 +0800
Message-ID: <20250721105520.5625-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250721105520.5625-1-kyrie.wu@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

MT8189 is pure single core architecture. Support its compatible and
use `mtk_vdec_single_core_pdata` to initialize platform data.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index fabf969bc8a9..e7b6b108f4fb 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -348,6 +348,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
 		vdec_dev->chip_name = MTK_VDEC_MT8188;
 	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
 		vdec_dev->chip_name = MTK_VDEC_MT8196;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8189-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8189;
 	else
 		vdec_dev->chip_name = MTK_VDEC_INVAL;
 }
@@ -575,6 +577,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8196-vcodec-dec",
 		.data = &mtk_lat_sig_core_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8189-vcodec-dec",
+		.data = &mtk_vdec_single_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 6bdde600a167..856d12aa84d8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -25,6 +25,7 @@ enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_MT8183 = 8183,
 	MTK_VDEC_MT8186 = 8186,
 	MTK_VDEC_MT8188 = 8188,
+	MTK_VDEC_MT8189 = 8189,
 	MTK_VDEC_MT8192 = 8192,
 	MTK_VDEC_MT8195 = 8195,
 	MTK_VDEC_MT8196 = 8196,
-- 
2.46.0


