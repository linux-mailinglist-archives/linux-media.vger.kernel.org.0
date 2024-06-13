Return-Path: <linux-media+bounces-13162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44F9065EA
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442E41F22E39
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 07:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D04E13D639;
	Thu, 13 Jun 2024 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mR+oh5sp"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95013D2AF;
	Thu, 13 Jun 2024 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265401; cv=none; b=PzqBQWA1lAEzgNSmQwIH8LNpDJiHaTL7yzMLlyK4N5YK/KgrHATKRSuuis8ZqnRe4BOYtnTm5CYUqrYd9FIaqNmyh8zGNjmv7X/LP7mZIkXXRDzn3fzmXwlLfG0Uig5PaMGQtb6WG8szvfaT3xz2JYN/k9pfMaIMg5Loei6zH54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265401; c=relaxed/simple;
	bh=FO0HjmjmO1UkrRvFmf0wuuJ5aoMWdHBpVJ/cI6qe0Pk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ds2YO/AHxYSdiwh8CWP11FsZDHUxP+HJ8NEjplZ3tqRbVFVCc6X4/pi1RPEpsPBmEnNOhxCZVLtMU1fyuP49fWrpRbbehxSMTBCqx2pJVXuHuxa0TvypIcSxpmuJcVOPe2sisBFAYD6lWiPFITsXMa5yh3FU894bhBgsoI5ZVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mR+oh5sp; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 72345d0a295a11efa54bbfbb386b949c-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=efUV+7fXfF9YZ3eGwR2krXhtXA8ycq50CEI1d9RZjro=;
	b=mR+oh5spuXr+O8T5AImZalggqIl4wlgVhkekdQy7iFwsGS2i5iYdxvo+FULiQHinl+EPSiU5Sh86ULTdmw9AtqXdKDZREighSrgpL29ztuvRHSw+AkvCIbK63p6QL27mShqmEiAEU6OgFj1wX9WZji9if/ZIUm83CB65grgsp7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:3d8177c2-5689-4d03-84e7-70497fe48a10,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:57088744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 72345d0a295a11efa54bbfbb386b949c-20240613
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1469798300; Thu, 13 Jun 2024 15:56:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 00:56:29 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 15:56:28 +0800
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
Subject: [PATCH v3 4/7] media: mediatek: vcodec: using input information to get vb2 buffer
Date: Thu, 13 Jun 2024 15:55:29 +0800
Message-ID: <20240613075532.32128-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613075532.32128-1-yunfei.dong@mediatek.com>
References: <20240613075532.32128-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

vb2 buffer may be removed from ready list when lat try to get
next src buffer, leading to vb2 buffer not the current one.
Need to get vb2 buffer according to current input memory information.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c     | 13 +++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 15 +++++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 90217cc8e242..a744740ba5f1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1062,19 +1062,20 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
 
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
 
-	lat_buf->vb2_v4l2_src = src;
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
 	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
 
 	return 0;
@@ -1724,7 +1725,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
+	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 3dceb668ba1c..c50a454ab4f7 100644
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
 
-	lat_buf->vb2_v4l2_src = src;
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
-	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_info, true);
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
2.18.0


