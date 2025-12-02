Return-Path: <linux-media+bounces-48022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F4C9A813
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AFF73A66B1
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48976302CB0;
	Tue,  2 Dec 2025 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fDPglg2c"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B096301033;
	Tue,  2 Dec 2025 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661257; cv=none; b=X6BLcTY1pHtgoj3dKQFsiYU/Z8fSoATG/M+ikOvdiSk7UCdsGdQWN8bxqTX/1ULDAQoD100MqmaRcD+5ScFtW3jThCXnbj1bLZJHPIBvxiN8V9sfkXvywShwoyKSa7TjnA2eu9pIlJdOdGUcmpSqbvs4hgJhHvoOZZrthFIM5H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661257; c=relaxed/simple;
	bh=8ZTbVXI//al7zw563cqORTnJIkXPHAiC6KbAydNRy8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bFxZAoIZWhJM6qDVjpudvScG832vwypX1EOomuxKQQS6YnNVgxt2HNmZ8vFe7di0hTQEDRkzxBfHp++5UyAGLJJLJEoNR6Zlm7CVRwdOJyFkr9UxJe86MIuJXn8Gm/Sami0pDEUst9gby4Pey335wSM/ZbDH0fn4G/5dW0rID6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fDPglg2c; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 39bd9262cf5211f0b2bf0b349165d6e0-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B9A2GpXlu5lragsbnfBAliXnVx1xxbwN8tJa0BL/buo=;
	b=fDPglg2ci8AU6kEs/ybidwkrjjS+7EDAQq1annNF9nQCjNMfrT1VFuR7OZRG/QUwNGjLwJuaLA+iWFrcF4iQhumetgzPOTEmfDhBqPScGY3DR9x2tJXCiK576TxB3Sl7boRY936jlLsmiIwRcg0F45foQliNMDRGeTmw7Hz78ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d06d4dbe-2b60-4b3d-8a3d-2951ae0570bb,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:37c3efa7-1697-4a34-a2ba-2404d254a770,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39bd9262cf5211f0b2bf0b349165d6e0-20251202
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1858953246; Tue, 02 Dec 2025 15:40:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 15:40:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 15:40:48 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>, Kyrie Wu
	<kyrie.wu@mediatek.corp-partner.google.com>
Subject: [PATCH v6 06/10] media: mediatek: vcodec: Add 4K prob size supporting for VP9 decoder
Date: Tue, 2 Dec 2025 15:40:33 +0800
Message-ID: <20251202074038.3173-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251202074038.3173-1-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>

add config to support prob size both 3840 and 2560.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h  | 2 ++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c      | 1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c     | 7 +++++++
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 4 ++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index a8baeab98477..ecf0d7ad0d54 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -80,10 +80,12 @@ struct vdec_pic_info {
  * struct mtk_vcodec_dec_params - decoder supported parameters
  * @level: decoder supported vcodec level
  * @profile: decoder supported vcodec profile
+ * @prob_size: vp9 decoder prob size
  */
 struct mtk_vcodec_dec_params {
 	s64 level;
 	s64 profile;
+	size_t prob_size;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index a47906b9d717..99c252e0a2e1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -630,5 +630,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index dc3e9a2ccc2c..f18aafd08c76 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -841,6 +841,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
 
@@ -889,6 +890,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = 2560,
 	},
 };
 
@@ -919,6 +921,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
 
@@ -949,6 +952,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = 2560,
 	},
 };
 
@@ -979,6 +983,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = 3840,
 	},
 };
 
@@ -1026,6 +1031,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+		.prob_size = 2560,
 	},
 };
 
@@ -1056,5 +1062,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
 	.vp9_params = {
 		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
 		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+		.prob_size = 3840,
 	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 9513ddde7c7c..36a87b455d11 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -22,7 +22,6 @@
 #define VP9_RESET_FRAME_CONTEXT_ALL 3
 
 #define VP9_TILE_BUF_SIZE 4096
-#define VP9_PROB_BUF_SIZE 2560
 #define VP9_COUNTS_BUF_SIZE 16384
 
 #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
@@ -546,6 +545,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 					       struct vdec_vp9_slice_vsi *vsi)
 {
 	struct mtk_vcodec_dec_ctx *ctx = instance->ctx;
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
 	enum vdec_vp9_slice_resolution_level level;
 	/* super blocks */
 	unsigned int max_sb_w;
@@ -616,7 +616,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	}
 
 	if (!instance->prob.va) {
-		instance->prob.size = VP9_PROB_BUF_SIZE;
+		instance->prob.size = pdev->vdec_pdata->vp9_params.prob_size;
 		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
 			goto err;
 	}
-- 
2.45.2


