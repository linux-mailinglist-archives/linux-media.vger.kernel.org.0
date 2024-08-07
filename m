Return-Path: <linux-media+bounces-15903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410F94A2C4
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B742B2BB64
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7EB1CCB5B;
	Wed,  7 Aug 2024 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qc6caHQr"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901641CCB35;
	Wed,  7 Aug 2024 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019106; cv=none; b=lrnuPnkB+eMFa79jPRJATL1S7cqXEyl9KHmLDj67HqKHL/Skg8WEPyvkVTgomJl/ug6Q+md0lHWXqRSJ52OAsuJz063km9CE0n4jXVrzGr3pLLTzXHsUNLJ/De71AL5GvZWkMexQRhx3sf+pfz8ejYVB/0twwWLq256i+tcAXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019106; c=relaxed/simple;
	bh=vD2LHcOv45rpS4gMIje1j6aYemwwgPrthMvQmcdjBuo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMubaHTYyFPNHZJ+HKASs04tLk88BSdpcj8T7nVmzGQanhXiGucyN4f1y6JTrSQxWJjcrFm0exKyZnoeslhv4fQHl6MCZLUIenzInudKgp7OLChR/Y5bTA6cuuV0gFuZ+8JTXG8R4S7tX3eOGxL81vOt9mfaLGhfPo6WxYZX7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qc6caHQr; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 82f2f112549611ef9a4e6796c666300c-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7TtGjOX4j7tWn1EQf/8/66F+asTUPIYKU/w8QQlh6Hk=;
	b=qc6caHQrMpZ/aNzypjf1oUPzIKRJjd6UwFY9+rWJaNVzPqRC81wLLZ1Oq8tRFgIMOrMIgrOUVm41F9C2s5qF4MIyxzAOSuqdyjfz0gQ9DX/iwjr1oNobeok2d4CKfHzxL1JbGe4nf2UXidoV9HCPzGswhvPMj1va6iVCRnbEwE0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:aa24f683-75a4-44c0-919f-9677aab7df45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:52937e0e-581f-42a8-8c8e-0df96f3eec79,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82f2f112549611ef9a4e6796c666300c-20240807
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 964031028; Wed, 07 Aug 2024 16:24:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 16:24:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 16:24:50 +0800
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
Subject: [PATCH v4 4/7] media: mediatek: vcodec: using input information to get vb2 buffer
Date: Wed, 7 Aug 2024 16:24:34 +0800
Message-ID: <20240807082444.21280-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

vb2 buffer may be removed from ready list when lat try to get next
src buffer, leading to vb2 buffer not the current one. Need to get
vb2 buffer according to current input memory information.

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
2.46.0


