Return-Path: <linux-media+bounces-21028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E69BFF4A
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43CA0282EDB
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 07:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B9B199924;
	Thu,  7 Nov 2024 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZfDqI3W9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA810F9;
	Thu,  7 Nov 2024 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965575; cv=none; b=lLD6qPMibiCC7EEBgvnHzwJhv5iR26D6shkcHrJ+HVo5ByjV2Hv5E24VHP2uh1LsaCK3BvOZxlcNMmqpLBmWTHy9rOvqvFIygaHIv3ioDDoJgvFR+6jbLE1fE6gL9nBbhiTo3eOcIWNhZGJyH4jUc4PxlyVbnOB7nftQdgmR5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965575; c=relaxed/simple;
	bh=c4OHLQSfZ+/YVuVUzD3mrA+OXTnFEw4UvaDgxOBCClk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfeFZACD/FrLWbOzrG2gn2tXhL7MB+kUmzRF0oJOCuW+h2toRnc2unKCmZx4ite/Ova0hug6fxhYy/Mi2A4xccClGZzqJkSekiG3r8AxWNOyAoi7MjAOwRPZCarob/ZDPSSI2rQgkBm4Yh/IFl02oAvSpwGDZ+kCfT/3sZ5a43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZfDqI3W9; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 595f2a589cdc11efbd192953cf12861f-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=P6nhnWHkTe0aK3cteSOkx0hGeeXinyaWKFsIxztRYHY=;
	b=ZfDqI3W9FdnNdHdgnjFQmzG8L4IhwXuukOI7+cMaJX2zGD0ULcmxL/Hkz9m5FS0IFKRAEL9tfmlsS42MbU/OYCnpjQGp6l+ZMl4wtDbu8n7LATynjAWMbbVqLrStQ/YQiNrn28PVkZ9P4G808d6jQT92C7L8T/lNQXqCvy5xWVg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:8977aba5-f25a-4d5c-8bfc-90ec5b2c7c0b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:43aac41b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 595f2a589cdc11efbd192953cf12861f-20241107
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 265345865; Thu, 07 Nov 2024 15:46:07 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 15:46:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Nov 2024 15:46:04 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/3] media: mediatek: vcodec: remove vsi operation in common interface
Date: Thu, 7 Nov 2024 15:45:55 +0800
Message-ID: <20241107074603.31998-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107074603.31998-1-yunfei.dong@mediatek.com>
References: <20241107074603.31998-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.150100-8.000000
X-TMASE-MatchedRID: UFXUgs0G7u/htVvI3rIgyY+YSzwl92XTwx0jRRxcQfMnzvR+mP3cvgk2
	ecCxHxhdshXHqIHwr0wGsCk+mmsGRJCoy9iDotiwFp8tduyF+iBYN1akkye0qPNhzIgXtFJVX5k
	t8ijSRLIUy0YoPaAASl11dHY6nDsGXHEPHmpuRH0URSScn+QSXt0H8LFZNFG71sULACB0qRK8FE
	DfecR4i3YpmCAV0AYyzd3HN2Iv2RTt1G06NHcbvB96cH1vMelJlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.150100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	B9AE9D02DF058FC51028548F9F793B23C6FA6C42CAD5B603040DDE67E9C449AB2000:8
X-MTK: N

Extend struct video shared information (vsi) to send different
parameters to scp for mt8188 architecture is changed.
Remove vsi related operation in common interface to make sure the
interface can be called by extended and non extended architecture
at the same time. The new extended interfaces with new vsi will
be introduced in later patches.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 732d78f63e5a..851a8490b828 100644
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


