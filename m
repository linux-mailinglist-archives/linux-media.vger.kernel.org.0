Return-Path: <linux-media+bounces-15188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE6937FD5
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E6F6B210C7
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 07:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A80E26ADE;
	Sat, 20 Jul 2024 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L7eNxoBj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DF2030B;
	Sat, 20 Jul 2024 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721462191; cv=none; b=r9a9hYZIjG/ma2XlZPMsS0iclHL38Cwo7+beLp8nBPauWiisqFdYSRmWqOc4LZesPkpdvSZYwqxJ3Dz57PLlNv+QdqJV6WJCfxIfS/diqQ6uX/dQVXc7w8iyadmpiAlODgeHImNX+3vcdt6CT4OoeFEXJRbaGyZi91IOvKICuEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721462191; c=relaxed/simple;
	bh=YYHGfxiJvrAwDfY/TAn6sIl9oWYtEB9xaPkmwA5uv0M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHTcZ58ck38QUkmd2rJjg01xdT+b8sFdoMdxPH+r3T9Tue3kf+7j/EcqeYgMogRjGdZ9qhx5tRhdEz/qPXmAOs6IbK+km+KxUWRHYyxroDK59xktJk/FAXb1qHXEtObb3wOEgqqBfeNKKWN9O/tzJRYrZEXfXMccIbBSZib752Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=L7eNxoBj; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 05fd99e6466811ef87684b57767b52b1-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pokKjq0tVxevuS/zH2i+3zXDjegwd30AUFfqtEptA0Q=;
	b=L7eNxoBjLPPloqRPoce1SOiJ3/Y5w0f28liHjFlI2bsJen/2iVK8bk7t7TKot22OUsdvXUOKnAKqoqujZfeyrfFRVufIBXVaF2qwF7d4Skvy8/nG5sNxDmwfXLvAkpE7nuomAhbptKai/cpQAVf4QJxQ+qcbU1posw7q8YFwJEk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:93453c59-f205-4181-8d81-622307224eca,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:5a4cb4d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 05fd99e6466811ef87684b57767b52b1-20240720
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 375962715; Sat, 20 Jul 2024 15:16:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:44 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 25/28] media: mediatek: vcodec: remove vsi data from common interface
Date: Sat, 20 Jul 2024 15:16:03 +0800
Message-ID: <20240720071606.27930-26-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Remove vsi related data from common interface to be compatible with
the extend vsi with secure video playback change.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 25e4a5236dcc..f0ad54a87c8b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -191,9 +191,9 @@ struct vdec_h264_slice_inst {
 };
 
 static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
-						  struct vdec_h264_slice_share_info *share_info)
+						  struct vdec_h264_slice_share_info *share_info,
+						  struct vdec_h264_slice_lat_dec_param *slice_data)
 {
-	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->vsi->h264_slice_params;
 	const struct v4l2_ctrl_h264_decode_params *dec_params;
 	const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
 	const struct v4l2_ctrl_h264_sps *sps;
@@ -223,9 +223,9 @@ static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *i
 		return -EINVAL;
 	}
 
-	mtk_vdec_h264_copy_sps_params(&slice_param->sps, sps);
-	mtk_vdec_h264_copy_pps_params(&slice_param->pps, pps);
-	mtk_vdec_h264_copy_scaling_matrix(&slice_param->scaling_matrix, src_matrix);
+	mtk_vdec_h264_copy_sps_params(&slice_data->sps, sps);
+	mtk_vdec_h264_copy_pps_params(&slice_data->pps, pps);
+	mtk_vdec_h264_copy_scaling_matrix(&slice_data->scaling_matrix, src_matrix);
 
 	memcpy(&share_info->sps, sps, sizeof(*sps));
 	memcpy(&share_info->dec_params, dec_params, sizeof(*dec_params));
@@ -286,9 +286,6 @@ static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
 	mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_builder.num_valid);
 	mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_builder.num_valid);
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
-
 	return 0;
 }
 
@@ -676,7 +673,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
-	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
+						     &inst->vsi->h264_slice_params);
 	if (err)
 		goto err_free_fb_out;
 
@@ -804,6 +802,9 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
+	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx.h264_slice_params));
+
 	buf = (unsigned char *)bs->va;
 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
 	if (nal_start_idx < 0) {
-- 
2.18.0


