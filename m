Return-Path: <linux-media+bounces-19718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2306799FFB8
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4F9EB25AA0
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3F618BBA6;
	Wed, 16 Oct 2024 03:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VOFEMlXr"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132618A6DC;
	Wed, 16 Oct 2024 03:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050585; cv=none; b=Dqnt5DC8a6w60y12J2c3MjZhjXW+56dzOsW8h1qVJt2Tj9ciGnbu0LZntzyc/nSW8r7pvtqSHUjcUlC2b1Sz4h3ELzTWjBrpfhe3J8t00KBstslD58U6UojHWTM4O2GeR1u+LQ4EQ48SORx8maoFBYMJETX8oLiXTJ9dwfOtyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050585; c=relaxed/simple;
	bh=QFwu6SHlfOYxQVNojaYJtPycFXytExydj3TtHuvUyDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEDbLz3uaDlOMMMWeC6A+qxcMRBfHTpe8iDCSUSY7nwpiJGGCQX08He1ROyF6BGfnsVBIcvZ9TgPLKnBKKFYqtwYsOA+Hjfwb5h6K6kwWLG1j4pYwGriTzyoVCrFN/xgeRv42OcMPgHpwiO38/EwBWAmAle5lIEbvhXV6rE66/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VOFEMlXr; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a8a365568b7111ef88ecadb115cee93b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YU+SSnfV5dVJ6uVsk3EVppgf5w+lsXXrvc/G9j3QhJA=;
	b=VOFEMlXrRLOq5n0WNoIdsk0c1gNkOGPcrnYr6YS4QGY5j9SDWN8zncrIXjDcgCfNRUSz8Hx2s0gxWkARfpyYlxUNVVZ4GQsuFyez0CqC7gYn2SYYVZZ2EgEbJdMsHYZ4KF4jOPG1+OUrg1lkTWNSPUFmMDWX1OJgT/oVopXaFjw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:cb1a285d-c746-41c9-a292-d1248db5f002,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:0d31db06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8a365568b7111ef88ecadb115cee93b-20241016
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 697567101; Wed, 16 Oct 2024 11:49:34 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:49:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:30 +0800
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
Subject: [PATCH v2 4/4] media: mediatek: vcodec: remove parse nal info in kernel
Date: Wed, 16 Oct 2024 11:49:23 +0800
Message-ID: <20241016034927.8181-5-yunfei.dong@mediatek.com>
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
X-TM-AS-Result: No-10--5.212500-8.000000
X-TMASE-MatchedRID: MFGjWhwUm9sS5iXdhf8hbuKXavbHY/C1xKAxBgoYewkS+jFO7d+PW3VX
	4shSYpPIKuucQMr5Le3XJhQ9fMGhecusSZtP31YsntCoZKs0mGWWHGENdT+VPwjGzxulqlQso8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgRktVxdpRt2L6uhz2mk+iQ0FGMo0B+b/BqbA6Blak4rF50r
	hAIR6PdJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.212500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E8DADA46021DFC2E8C7393D37B35AA3742B47599BEDC26FD6778400713A5933D2000:8
X-MTK: N

Hardware can parse the slice syntax to get nal information in
scp for extend architecture, needn't to parse it again in
kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 69ca775bb3f1..c99a64384edf 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -802,11 +802,10 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info;
-	int nal_start_idx, err, timeout = 0;
+	int err, timeout = 0;
 	unsigned int data[2];
 	struct vdec_lat_buf *lat_buf;
 	struct vdec_h264_slice_share_info *share_info;
-	unsigned char *buf;
 
 	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
 				vdec_h264_slice_core_decode_ex,
@@ -830,14 +829,6 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs
 	share_info = lat_buf->private_data;
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 
-	buf = (unsigned char *)bs->va;
-	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
-	if (nal_start_idx < 0) {
-		err = -EINVAL;
-		goto err_free_fb_out;
-	}
-
-	inst->vsi->dec.nal_info = buf[nal_start_idx];
 	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
@@ -846,7 +837,7 @@ static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
+	vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
 				   &share_info->h264_slice_params.pps);
 
 	*res_chg = inst->resolution_changed;
@@ -1078,11 +1069,10 @@ static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
 	struct vdec_fb *fb;
-	unsigned char *buf;
 	unsigned int data[2], i;
 	u64 y_fb_dma, c_fb_dma;
 	struct mtk_vcodec_mem *mem;
-	int err, nal_start_idx;
+	int err;
 
 	/* bs NULL means flush decoder */
 	if (!bs)
@@ -1117,14 +1107,6 @@ static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem
 	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
 	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
 
-	buf = (unsigned char *)bs->va;
-	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
-	if (nal_start_idx < 0) {
-		err = -EINVAL;
-		goto err_free_fb_out;
-	}
-	inst->vsi_ctx_ex.dec.nal_info = buf[nal_start_idx];
-
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
 		mtk_vdec_debug(inst->ctx, "- resolution changed -");
-- 
2.46.0


