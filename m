Return-Path: <linux-media+bounces-21474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638F9CFC8D
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5981F24340
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CB9194C92;
	Sat, 16 Nov 2024 03:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WcgG5qzN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA758191F9C;
	Sat, 16 Nov 2024 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731727058; cv=none; b=X84lDvXuxOh5hgpIX3k8DGbO8kYl+xsMPOnFuOWZ5uujMLMmCBVFh5/bXVgJMki4ybCj5RQlbOcVu3sN8Czd8lUIbQr5nLZTFgUb2DmnMr9rCpHNGpO9/FJ0vHhi++lUGjFb8BsWhNoqpJQs+Uc5fmJxpuwAaeeX2IRgl2ct9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731727058; c=relaxed/simple;
	bh=5fpVViNa/+vGm+EwOY3vt+ygAxAAjXEyhkbgUeghZQM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0jGuOnuBV78wUuT7VrjTbxfbtzCcabLIZCUDRKugjsV+KuAihhjYB2oUfMD805vJTQqSeZ7iP+Hi1xrczIsKWvBLSp8LB6sqoO1Gm352ZFQlzt9FGx1Vz6qKZH54Os99+RiZ21OXiuN1o3LMtuM2+YFAUKNdh5vY7PZLsYcLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WcgG5qzN; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 50a702aca3c911ef99858b75a2457dd9-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5hR1U01URkfIV8OzJInJq3u81PchDdE/y97YVoT6EL4=;
	b=WcgG5qzN1lxjnl7/YDT3tttvbvvkWqqFBNp+tgvdLbkHPBcpG2VF0scoEilusrlyVbgM0QjLn4tHod9f7If7jQ0nf03aVMwOTb4WDVor2q3rVO2wa77vWNvZ4anYaGRAXtVChCxstqRvgOFcDCtSuwVfUvZjDwNRL0coySfu6os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:53ff252f-b261-4f54-90db-0974aeabef13,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:ce19b8a,CLOUDID:69edb85c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 50a702aca3c911ef99858b75a2457dd9-20241116
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1809272927; Sat, 16 Nov 2024 11:17:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Nov 2024 19:17:29 -0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:28 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 4/5] media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
Date: Sat, 16 Nov 2024 11:17:18 +0800
Message-ID: <20241116031724.15694-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241116031724.15694-1-yunfei.dong@mediatek.com>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Getting the SRC buffer from M2M will pick a different than the one
used for current decode operation when the SRC buffer is removed
from ready list.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c     | 14 ++++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 15 +++++++--------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index bf21f2467a0f..68e02c18a0af 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1062,18 +1062,20 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
 
 static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
 						 struct vdec_av1_slice_vsi *vsi,
+						 struct mtk_vcodec_mem *bs,
 						 struct vdec_lat_buf *lat_buf)
 {
-	struct vb2_v4l2_buffer *src;
+	struct mtk_video_dec_buf *src_buf_info;
 	struct vb2_v4l2_buffer *dst;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	if (!src_buf_info)
 		return -EINVAL;
 
-	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
+	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+
 	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, dst, true);
 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
 
 	return 0;
@@ -1723,7 +1725,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
+	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index eea709d93820..54a9c1d2695f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -712,19 +712,18 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *
 }
 
 static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
+						 struct mtk_vcodec_mem *bs,
 						 struct vdec_lat_buf *lat_buf)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
+	struct mtk_video_dec_buf *src_buf_info;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	if (!src_buf_info)
 		return -EINVAL;
 
-	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
+	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
-	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
 	return 0;
 }
 
@@ -1154,7 +1153,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
+	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
 	if (ret)
 		goto err;
 
-- 
2.46.0


