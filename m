Return-Path: <linux-media+bounces-19716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C299FFB2
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7345B256A9
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF55188708;
	Wed, 16 Oct 2024 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pzCA/yRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2DD157A41;
	Wed, 16 Oct 2024 03:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050580; cv=none; b=roP3pwAM2xmVo1rkU0msgFGTzzDaf6lWOiyrJ3UXQW5U5U77KDo9P+GS8gmUPlJB86wRWrwc3nI8pfG6YqIFaDETFRfL+6DRqMKDlxeb8CzOIrKW2GVi0DZXtpIt1KDT9atDPF05UI+ydbDkubY9aWIOJYfBcbTY+gjlKoywO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050580; c=relaxed/simple;
	bh=DraH58NyTBrVqIe4EiATzQIrGCxcDTlP0mgUistXDng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVmwFzirKt2NFxWC39z2NLJ7XI+xy1zUkIFR/4T5T5BTBAK8RQsImqVMJyZ/0qm5oDrMEEi3Wiea9f8Elw0U5WkskWxONBgk4M3It2HCXYIEKx3kFbTWtKRsiOKiKjrwOhpc0cfhcY2+QzYVk02Bl7rQFfK/S5cTN8zcerUkRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pzCA/yRo; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a64d5c308b7111ef8b96093e013ec31c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hFSBMqUHiy3cp5idN0cvvYcdQwduY6ojvxNXbzOU0jo=;
	b=pzCA/yRoHRbdrVgCsG92TvVxB+KbJDUbTi2bRB7+0+gjYZkYYJrpwDuZjXu6XkQEdGUtlx6o5XPNxTD2WwUc87V/vahoU2T1DrVpxiugFjHXWCIAy135NkBsP/W+lSkpds829ryfbr7LRNYbVeMZjj0kHownzyWtYzrMFrvcY/s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6071cda6-0192-48c8-a2cd-398e8d51216f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1b0d5165-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a64d5c308b7111ef8b96093e013ec31c-20241016
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 663578862; Wed, 16 Oct 2024 11:49:30 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:49:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:26 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/4] media: mediatek: vcodec: remove vsi operation in common interface
Date: Wed, 16 Oct 2024 11:49:20 +0800
Message-ID: <20241016034927.8181-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016034927.8181-1-yunfei.dong@mediatek.com>
References: <20241016034927.8181-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.532300-8.000000
X-TMASE-MatchedRID: fmS20tPE9kuwQEC6hpSor+KXavbHY/C12qBSQHAh8pgS+jFO7d+PW5wN
	y2jM59DxpP6Y2nEtRqbN43z0KjSN1NTgPtgJJv6UDB+ErBr0bAN9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO34ZhR52Rc1aqilyMlnnZSYUocogaRBpVJeCi61EjduuczZa+FJhfyXUxhM/Rn9sQEP+E
	S6ezy2qii0s9zAn8dIZn5SvWG15TCOJQ/97yCQHfI2nuDg9d7QFezHPq6MHFSrV/xdKQcFSY0le
	YQxW8u2ZyMWcibO/JI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.532300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	5C8732424D8DE30AEEDF57DC1DB080171E91719610DDE678033D9A3E56E832572000:8
X-MTK: N

Remove vsi related operation in common interface to make sure the
interface can be called by different architecture at the same time.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 732d78f63e5a..57c85af5ffb4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -171,9 +171,9 @@ struct vdec_h264_slice_inst {
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
@@ -203,9 +203,9 @@ static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *i
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
@@ -266,9 +266,6 @@ static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
 	mtk_vdec_h264_get_ref_list(b0_reflist, v4l2_b0_reflist, reflist_builder.num_valid);
 	mtk_vdec_h264_get_ref_list(b1_reflist, v4l2_b1_reflist, reflist_builder.num_valid);
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
-
 	return 0;
 }
 
@@ -608,7 +605,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
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


