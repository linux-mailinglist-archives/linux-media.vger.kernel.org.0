Return-Path: <linux-media+bounces-38154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48AB0C1DD
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 12:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB59E18C31B8
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 10:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611E5292B49;
	Mon, 21 Jul 2025 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="edaoSMM6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795E28F93E;
	Mon, 21 Jul 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095336; cv=none; b=uTOh1lR21F1OE1f8VNzexDfLroHmbH7UUDQvnX+5svIzMTSW0IRFVbt0dC26EnQUqfq+XkRcdITf+y76GltXck63YK6lKXbY2kWExZ76FWQGn7jajI7zGP8UmHaHL0JsyLSsSTamPDNInBBMWyLS9+rP7ZZbvjpS6swxpXrbDmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095336; c=relaxed/simple;
	bh=ClWI3vduF97vbo+0YqWTsGVXV6tVwrgtcH6qpx9Prmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+MijGa0pgGU+uekUcwoePITkei15Xoi+ZunBY9339HnD+7HwVugKXQQ0UuztJbcJEXy+ivJbd+zSVTn2eHlxZEIZ3Rbhrsk4ZNsy+ah0Lmy4ava6ZfrbkxAZjjGjGzLN2ChknhKI+Zqa1WZvUqSOI3AC7nXg3NCPa1Z+C3mwEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=edaoSMM6; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3843554c662111f0b33aeb1e7f16c2b6-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kKNOsloWiR1iqpJAuyiWPjs31TR04/PF1Rc3QH4Cc8Y=;
	b=edaoSMM6ifzPChMv7YRG4iE8AhksrMY/UCX8HMAtsp4dUWFRiucatxfVb/+NfnhMHP06hOri/KwdVjT7UPTvt3H+yZW++KyS37UF9jw2HuLEYTEhqT6SeeDd4B0Ziq4N39DdYlcGCc39Sc9ibWwSH604EBWjd/xr5jep7uIZ/qQ=;
X-CID-CACHE: Type:Local,Time:202507211839+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:cff62fd4-fabe-4aa0-8566-355093d4b3a7,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-50
X-CID-META: VersionHash:9eb4ff7,CLOUDID:6586ab84-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3843554c662111f0b33aeb1e7f16c2b6-20250721
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1679634361; Mon, 21 Jul 2025 18:55:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 18:55:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 18:55:28 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v1 4/8] media: mediatek: vcodec: Add core-only VP9 decoding support for MT8189
Date: Mon, 21 Jul 2025 18:55:16 +0800
Message-ID: <20250721105520.5625-5-kyrie.wu@mediatek.com>
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

Implemented core-only VP9 decoding functions for MT8189.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index fa0f406f7726..04197164fb82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -23,6 +23,7 @@
 
 #define VP9_TILE_BUF_SIZE 4096
 #define VP9_PROB_BUF_SIZE 2560
+#define VP9_PROB_BUF_4K_SIZE 3840
 #define VP9_COUNTS_BUF_SIZE 16384
 
 #define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
@@ -616,7 +617,10 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	}
 
 	if (!instance->prob.va) {
-		instance->prob.size = VP9_PROB_BUF_SIZE;
+		instance->prob.size = ((ctx->dev->chip_name == MTK_VDEC_MT8196) ||
+				       (ctx->dev->chip_name == MTK_VDEC_MT8189)) ?
+					VP9_PROB_BUF_4K_SIZE : VP9_PROB_BUF_SIZE;
+
 		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
 			goto err;
 	}
@@ -696,21 +700,22 @@ static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
 	return min(offset, mi_num);
 }
 
-static
-int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance)
+static int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance,
+						       struct mtk_vcodec_mem *bs,
+						       struct vdec_fb *fb)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	if (!src_buf_info)
 		return -EINVAL;
 
-	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
-	if (!dst)
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	if (!dst_buf_info)
 		return -EINVAL;
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &dst_buf_info->m2m_buf.vb, true);
 
 	return 0;
 }
@@ -1800,7 +1805,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance);
+	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs, fb);
 	if (ret)
 		goto err;
 
-- 
2.46.0


