Return-Path: <linux-media+bounces-21096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951309C14B0
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 04:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521F5285303
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 03:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B181865EB;
	Fri,  8 Nov 2024 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hb8+I+Be"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251962629F;
	Fri,  8 Nov 2024 03:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036754; cv=none; b=ABRzkVcg/wJz8K1WJjraZ6MZhkjFdLbJIYNAaEpwnJ33JQI38xk2MUcsqnSbM4IshmbsrTAASeSvC0iOvL5YxxlMnia4pr4XLfdUPWx9GDuzPbGI2p/pYMlzxpnv1OoWED0lgLZN0K3074I9Eq8jupu4u5ZY99vBGi+3W0rDA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036754; c=relaxed/simple;
	bh=taqTNDeLobIBKBWTzqIqiO5NbQKIAO/Shcfoj2D5jrA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxUf1sYRDbD2IGG4qwUq4z/PosvBsCCDG2DW+IwTfOPgy10i+FIqZhDYJd8l2fAWM71VkIWR6Mj9CTM2JkDTmSrqQc+3SCLx/qaoPbGcP8c1Oy/M29oxDjIlKgX0X7JM8Ede/bA+gHpNfORDpDBVDYLHCV99vH31c2cmpjd1bXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Hb8+I+Be; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1213cdd89d8211efb88477ffae1fc7a5-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FQ5zwEcgw6qdiVEtIoT8wTzF/dTbwsX8dOlMsiNZqo4=;
	b=Hb8+I+Be+uucOb2bUPrAwWv4soPDFd1tMBBwEoWiTSRLeprLW9dPSFUdWl9g/pvyKSTRJa2PkvmdOdtDfOmGhXmbzlyZbghCMUxvV25iilRe/AtT+frDvo8o6P1NiKe4fAsdC5PnBGugwHULkBoXnEgdORg9WzfVE2X6qLnpFBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:818ea871-da09-46e5-92b9-b60acadb22cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:bcbbd01b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1213cdd89d8211efb88477ffae1fc7a5-20241108
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 960131803; Fri, 08 Nov 2024 11:32:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 19:32:24 -0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 3/5] media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
Date: Fri, 8 Nov 2024 11:32:12 +0800
Message-ID: <20241108033219.19804-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108033219.19804-1-yunfei.dong@mediatek.com>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
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
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 25 +++++++------------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 24 ++++++------------
 2 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 90217cc8e242..0e1469effeb5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1060,24 +1060,20 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
 	memcpy(remote_vsi, vsi, sizeof(*vsi));
 }
 
-static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
-						 struct vdec_av1_slice_vsi *vsi,
-						 struct vdec_lat_buf *lat_buf)
+static void vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
+						  struct vdec_av1_slice_vsi *vsi,
+						  struct mtk_vcodec_mem *bs,
+						  struct vdec_lat_buf *lat_buf)
 {
-	struct vb2_v4l2_buffer *src;
+	struct mtk_video_dec_buf *src_buf_info;
 	struct vb2_v4l2_buffer *dst;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
-
-	lat_buf->vb2_v4l2_src = src;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
 	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
-
-	return 0;
 }
 
 static short vdec_av1_slice_resolve_divisor_32(u32 D, short *shift)
@@ -1724,10 +1720,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
-	if (ret)
-		return ret;
-
+	vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf);
 	ret = vdec_av1_slice_setup_pfc(instance, pfc);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 3dceb668ba1c..a56f6bb879a6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -711,21 +711,16 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *
 	return 0;
 }
 
-static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
-						 struct vdec_lat_buf *lat_buf)
+static void vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
+						  struct mtk_vcodec_mem *bs,
+						  struct vdec_lat_buf *lat_buf)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
-
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
+	struct mtk_video_dec_buf *src_buf_info;
 
-	lat_buf->vb2_v4l2_src = src;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
-	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
-	return 0;
+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_info, true);
 }
 
 static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *instance,
@@ -1154,10 +1149,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
-	if (ret)
-		goto err;
-
+	vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
 	ret = vdec_vp9_slice_setup_pfc(instance, pfc);
 	if (ret)
 		goto err;
-- 
2.46.0


