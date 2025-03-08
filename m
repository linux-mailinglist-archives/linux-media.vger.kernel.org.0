Return-Path: <linux-media+bounces-27855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC64A578EE
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 08:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D6318959AC
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 07:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572FC1A2541;
	Sat,  8 Mar 2025 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F0t7dYEl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B94170A0B;
	Sat,  8 Mar 2025 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741420096; cv=none; b=FaI7XZ5/byogI5vnfnSLotjZmTQMEfCoNvXvHfUlZCubinxNGeqYYGwMh7/noToMqtKiceUjUYesIkeWA1rZKjV2GoEdsQTGiXXyjeUjfJswIaGumSUN0qKTdsGwbbrXgUiPW8DYZFNe+8Nt5xS3RFPT4AoCn8+LU9Y5qc0NlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741420096; c=relaxed/simple;
	bh=JCuVIdBkbL91ahwTCnLcsSpeQfwQZETjti3XZnxU6ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrTeovWaJH8yvFuIWS3xpnncaKurKMjc4RB+8OuU6VKIePS2fmGC9iJVqk2ocyyI+GvfHwaWqo/jIz/x1IPnI4u8fmSUWiQOQxchybFxf4VV8xvdygiYBrxkIEZ/9e6y+7OJ8XbDh18UXx2lU5wNQVb9gEBc5jmzjBk5CXTcJsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=F0t7dYEl; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: abcdc938fbf111ef8eb9c36241bbb6fb-20250308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Yrs6Kl3s6CsDWXhNqJl2Oe/kmJUZdpz3oXbEeCXJujo=;
	b=F0t7dYElJyrQtg9qfGf2jBHoZz/2YpR2RzI4uJr2mCxQhI6ZAVlZfdvj5bhfisaPCcNjqTaZmoGO4I8R39ye2CwhlB5/7lXyk+msJ5JuO8MdGtQY7zUVuuOMdKSb1pCSkxq7+JmqYrO3WHlwWtxKBh9fo47r1qHmZPp8gP4C7ys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:fdb86802-6d97-4432-a2fb-5c50540e37de,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:72301c8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: abcdc938fbf111ef8eb9c36241bbb6fb-20250308
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2042403554; Sat, 08 Mar 2025 15:48:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Mar 2025 15:48:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Mar 2025 15:48:03 +0800
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
Subject: [PATCH v8 1/3] media: mediatek: vcodec: remove vsi operation in common interface
Date: Sat, 8 Mar 2025 15:47:55 +0800
Message-ID: <20250308074802.18929-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250308074802.18929-1-yunfei.dong@mediatek.com>
References: <20250308074802.18929-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Extend the VSI (video shared information) struct to allow sending slice
parameters to SCP, as the parameters have changed on MT8188 architecture.
Remove VSI related information from the common interface to ensure, that
the interface is usable by architectures with and without the extended
parameters. The new VSI extensions will be introduced in later patches.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 1ed0ccec5665..ab192ce0b851 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -171,9 +171,9 @@ struct vdec_h264_slice_inst {
 };
 
 static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
-						  struct vdec_h264_slice_share_info *share_info)
+						  struct vdec_h264_slice_share_info *share_info,
+						  struct vdec_h264_slice_lat_dec_param *slice_param)
 {
-	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->vsi->h264_slice_params;
 	const struct v4l2_ctrl_h264_decode_params *dec_params;
 	const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
 	const struct v4l2_ctrl_h264_sps *sps;
@@ -266,9 +266,6 @@ static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
 	mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_builder.num_valid);
 	mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_builder.num_valid);
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
-
 	return 0;
 }
 
@@ -608,7 +605,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
-	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
+						     &inst->vsi->h264_slice_params);
 	if (err)
 		goto err_free_fb_out;
 
@@ -749,6 +747,9 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
+	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx.h264_slice_params));
+
 	buf = (unsigned char *)bs->va;
 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
 	if (nal_start_idx < 0) {
-- 
2.46.0


