Return-Path: <linux-media+bounces-19537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FB99C166
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3212B1F23733
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C27C14E2DA;
	Mon, 14 Oct 2024 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vf57hruw"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218D1231CA6;
	Mon, 14 Oct 2024 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891203; cv=none; b=KCwYiTHiMrwHJcnPhw1tPFwTih1Gl4z3zBH4TOzBW9/8vnZ/q919V1+4NSMkKy75BFIQsMTXyHSJ33Y4FsOYbR1WPTNsGtI7h3TEHkR3KK6jaycG2SvUfLV21Rh6JVXBmhwaNdUvF6u/uHnl/dcUY+dMzG6YtQAO/zpkUmxh668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891203; c=relaxed/simple;
	bh=Bg6y3QiHr3lu/LmTuzp8iUyuVv7qJCdjuf4FPfyOLbk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUWTmCCxxvazNAaLldJeeRtzuPrZtc/OlcBNO6tOTfPb3dnAeiHXONmYZW/vkrgufX/+Dt6LNquym1sb6wnlHsq/P7g7l639vEREvnZm9s1ovXx0AWK47NPIi+nJPo8ptZXzV3/4T5cV8r5pmRTAReqbl1X/qXpjFxAVLtGque0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Vf57hruw; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 93c0a92489fe11ef88ecadb115cee93b-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ov16ZM53mRuDaJHl1pyn/DVxtQkrwl3v1MRkNhTGYmk=;
	b=Vf57hruwCC1TPcU48rhWuYQkdhxqtKTgFCaVOML0UsU422VNCdN0FL5v0PWxKngYKZKj8cq0OyKhTM0iQbW7XFaf3pvdIURtB6hPR3AA1CVaD66cYHNvT8408bk+HbDxgd3Bs8Q0KRQxaEXarrTBBylJ4+BEWSOnXid0mpYjInA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:461323d3-d330-4470-8901-839b5ca23033,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e4913641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 93c0a92489fe11ef88ecadb115cee93b-20241014
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1112539264; Mon, 14 Oct 2024 15:33:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 00:33:15 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 15:33:14 +0800
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
Subject: [PATCH 4/6] media: mediatek: vcodec: rename vsi to extend vsi
Date: Mon, 14 Oct 2024 15:33:08 +0800
Message-ID: <20241014073314.18409-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014073314.18409-1-yunfei.dong@mediatek.com>
References: <20241014073314.18409-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Rename vsi struct to extend vsi to support extend architecture.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 167 +++++++++---------
 1 file changed, 85 insertions(+), 82 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 02ad579bfe8e..ba7fd3200d98 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -48,7 +48,7 @@ struct vdec_h264_slice_lat_dec_param {
 };
 
 /**
- * struct vdec_h264_slice_info - decode information
+ * struct vdec_h264_slice_info_ex - extend decode information
  *
  * @wdma_end_addr_offset:	offset from buffer start
  * @nal_info:		nal info of current picture
@@ -57,7 +57,7 @@ struct vdec_h264_slice_lat_dec_param {
  * @crc:		Used to check whether hardware's status is right
  * @reserved:		reserved
  */
-struct vdec_h264_slice_info {
+struct vdec_h264_slice_info_ex {
 	u64 wdma_end_addr_offset;
 	u16 nal_info;
 	u16 timeout;
@@ -92,7 +92,7 @@ struct vdec_h264_slice_fb {
 };
 
 /**
- * struct vdec_h264_slice_vsi - shared memory for decode information exchange
+ * struct vdec_h264_slice_vsi_ex - extend shared memory for decode information exchange
  *        between SCP and Host.
  *
  * @bs:		input buffer info
@@ -108,7 +108,7 @@ struct vdec_h264_slice_fb {
  * @dec:		decode information (AP-R, VPU-W)
  * @h264_slice_params:	decode parameters for hw used
  */
-struct vdec_h264_slice_vsi {
+struct vdec_h264_slice_vsi_ex {
 	/* LAT dec addr */
 	struct vdec_h264_slice_mem bs;
 	struct vdec_h264_slice_fb fb;
@@ -120,7 +120,7 @@ struct vdec_h264_slice_vsi {
 	struct vdec_h264_slice_mem slice_bc;
 
 	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
-	struct vdec_h264_slice_info dec;
+	struct vdec_h264_slice_info_ex dec;
 	struct vdec_h264_slice_lat_dec_param h264_slice_params;
 };
 
@@ -152,10 +152,10 @@ struct vdec_h264_slice_share_info {
  * @pred_buf:		HW working prediction buffer
  * @mv_buf:		HW working motion vector buffer
  * @vpu:		VPU instance
- * @vsi:		vsi used for lat
- * @vsi_core:		vsi used for core
+ * @vsi_ex:		extend vsi used for lat
+ * @vsi_core_ex:	extend vsi used for core
  *
- * @vsi_ctx:		Local VSI data for this decoding context
+ * @vsi_ctx_ex:	Local extend vsi data for this decoding context
  * @h264_slice_param:	the parameters that hardware use to decode
  *
  * @resolution_changed:resolution changed
@@ -172,10 +172,10 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi *vsi;
-	struct vdec_h264_slice_vsi *vsi_core;
+	struct vdec_h264_slice_vsi_ex *vsi_ex;
+	struct vdec_h264_slice_vsi_ex *vsi_core_ex;
 
-	struct vdec_h264_slice_vsi vsi_ctx;
+	struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
@@ -412,28 +412,28 @@ static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_inst *inst,
 	struct mtk_vcodec_mem *mem;
 	int i;
 
-	inst->vsi->bs.dma_addr = (u64)bs->dma_addr;
-	inst->vsi->bs.size = bs->size;
+	inst->vsi_ex->bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ex->bs.size = bs->size;
 
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		inst->vsi->mv_buf_dma[i].dma_addr = mem->dma_addr;
-		inst->vsi->mv_buf_dma[i].size = mem->size;
+		inst->vsi_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_ex->mv_buf_dma[i].size = mem->size;
 	}
-	inst->vsi->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
-	inst->vsi->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
 
-	inst->vsi->row_info.dma_addr = 0;
-	inst->vsi->row_info.size = 0;
+	inst->vsi_ex->row_info.dma_addr = 0;
+	inst->vsi_ex->row_info.size = 0;
 
-	inst->vsi->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
-	inst->vsi->err_map.size = lat_buf->wdma_err_addr.size;
+	inst->vsi_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_ex->err_map.size = lat_buf->wdma_err_addr.size;
 
-	inst->vsi->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
-	inst->vsi->slice_bc.size = lat_buf->slice_bc_addr.size;
+	inst->vsi_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
 
-	inst->vsi->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
-	inst->vsi->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
+	inst->vsi_ex->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi_ex->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
 }
 
 static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst *inst,
@@ -462,33 +462,33 @@ static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst *inst,
 
 	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
-	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
-	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
-	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
-	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
+	inst->vsi_core_ex->fb.y.dma_addr = y_fb_dma;
+	inst->vsi_core_ex->fb.y.size = ctx->picinfo.fb_sz[0];
+	inst->vsi_core_ex->fb.c.dma_addr = c_fb_dma;
+	inst->vsi_core_ex->fb.c.size = ctx->picinfo.fb_sz[1];
 
-	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
-	inst->vsi_core->dec.nal_info = share_info->nal_info;
+	inst->vsi_core_ex->dec.vdec_fb_va = (unsigned long)fb;
+	inst->vsi_core_ex->dec.nal_info = share_info->nal_info;
 
-	inst->vsi_core->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
-	inst->vsi_core->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi_core_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
 
-	inst->vsi_core->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
-	inst->vsi_core->err_map.size = lat_buf->wdma_err_addr.size;
+	inst->vsi_core_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core_ex->err_map.size = lat_buf->wdma_err_addr.size;
 
-	inst->vsi_core->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
-	inst->vsi_core->slice_bc.size = lat_buf->slice_bc_addr.size;
+	inst->vsi_core_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
 
-	inst->vsi_core->row_info.dma_addr = 0;
-	inst->vsi_core->row_info.size = 0;
+	inst->vsi_core_ex->row_info.dma_addr = 0;
+	inst->vsi_core_ex->row_info.size = 0;
 
-	inst->vsi_core->trans.dma_addr = share_info->trans_start;
-	inst->vsi_core->trans.dma_addr_end = share_info->trans_end;
+	inst->vsi_core_ex->trans.dma_addr = share_info->trans_start;
+	inst->vsi_core_ex->trans.dma_addr_end = share_info->trans_end;
 
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		inst->vsi_core->mv_buf_dma[i].dma_addr = mem->dma_addr;
-		inst->vsi_core->mv_buf_dma[i].size = mem->size;
+		inst->vsi_core_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_core_ex->mv_buf_dma[i].size = mem->size;
 	}
 
 	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
@@ -520,10 +520,10 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_free_inst;
 	}
 
-	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_DEC_ALIGNED_64);
-	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi_ex), VCODEC_DEC_ALIGNED_64);
+	inst->vsi_ex = inst->vpu.vsi;
+	inst->vsi_core_ex =
+		(struct vdec_h264_slice_vsi_ex *)(((char *)inst->vpu.vsi) + vsi_size);
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
@@ -564,14 +564,14 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 
 	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
-	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
+	memcpy(&inst->vsi_core_ex->h264_slice_params, &share_info->h264_slice_params,
 	       sizeof(share_info->h264_slice_params));
 
 	err = vdec_h264_slice_setup_core_buffer(inst, share_info, lat_buf);
 	if (err)
 		goto vdec_dec_end;
 
-	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core_ex->h264_slice_params,
 					    share_info);
 	err = vpu_dec_core(vpu);
 	if (err) {
@@ -584,15 +584,15 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 	if (timeout)
 		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
-	inst->vsi_core->dec.timeout = !!timeout;
+	inst->vsi_core_ex->dec.timeout = !!timeout;
 
 	vpu_dec_core_end(vpu);
 	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       ctx->decoded_frame_cnt,
-		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
-		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
-		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
-		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
+		       inst->vsi_core_ex->dec.crc[0], inst->vsi_core_ex->dec.crc[1],
+		       inst->vsi_core_ex->dec.crc[2], inst->vsi_core_ex->dec.crc[3],
+		       inst->vsi_core_ex->dec.crc[4], inst->vsi_core_ex->dec.crc[5],
+		       inst->vsi_core_ex->dec.crc[6], inst->vsi_core_ex->dec.crc[7]);
 
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
@@ -662,7 +662,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
 	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
-						     &inst->vsi->h264_slice_params);
+						     &inst->vsi_ex->h264_slice_params);
 	if (err)
 		goto err_free_fb_out;
 
@@ -683,12 +683,13 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	vdec_h264_slice_setup_lat_buffer(inst, bs, lat_buf);
 	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
-		       inst->vsi->ube.dma_addr, (unsigned long)inst->vsi->ube.size,
-		       inst->vsi->err_map.dma_addr);
+		       inst->vsi_ex->ube.dma_addr, (unsigned long)inst->vsi_ex->ube.size,
+		       inst->vsi_ex->err_map.dma_addr);
 
 	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
-		       inst->vsi->slice_bc.dma_addr, (unsigned long)inst->vsi->slice_bc.size,
-		       inst->vsi->trans.dma_addr, inst->vsi->trans.dma_addr_end);
+		       inst->vsi_ex->slice_bc.dma_addr, (unsigned long)inst->vsi_ex->slice_bc.size,
+		       inst->vsi_ex->trans.dma_addr, inst->vsi_ex->trans.dma_addr_end);
+
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
@@ -696,13 +697,13 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->dec.wdma_end_addr_offset;
+		inst->vsi_ex->dec.wdma_end_addr_offset;
 
 	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
-	share_info->nal_info = inst->vsi->dec.nal_info;
+	share_info->nal_info = inst->vsi_ex->dec.nal_info;
 
 	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
-		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
@@ -712,7 +713,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
 	if (timeout)
 		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-	inst->vsi->dec.timeout = !!timeout;
+	inst->vsi_ex->dec.timeout = !!timeout;
 
 	err = vpu_dec_end(vpu);
 	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
@@ -724,16 +725,18 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->dec.wdma_end_addr_offset;
+		inst->vsi_ex->dec.wdma_end_addr_offset;
+
 	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
 
 	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
-		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
-		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+		       inst->vsi_ex->dec.crc[0], inst->vsi_ex->dec.crc[1],
+		       inst->vsi_ex->dec.crc[2]);
 
 	inst->slice_dec_num++;
 	return 0;
@@ -774,11 +777,11 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
 		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
 
-	inst->vsi_ctx.bs.dma_addr = (u64)bs->dma_addr;
-	inst->vsi_ctx.bs.size = bs->size;
-	inst->vsi_ctx.fb.y.dma_addr = y_fb_dma;
-	inst->vsi_ctx.fb.c.dma_addr = c_fb_dma;
-	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+	inst->vsi_ctx_ex.bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx_ex.bs.size = bs->size;
+	inst->vsi_ctx_ex.fb.y.dma_addr = y_fb_dma;
+	inst->vsi_ctx_ex.fb.c.dma_addr = c_fb_dma;
+	inst->vsi_ctx_ex.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
 				   &dst_buf_info->m2m_buf.vb, true);
@@ -786,8 +789,8 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
+	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
 
 	buf = (unsigned char *)bs->va;
 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
@@ -795,7 +798,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 		err = -EINVAL;
 		goto err_free_fb_out;
 	}
-	inst->vsi_ctx.dec.nal_info = buf[nal_start_idx];
+	inst->vsi_ctx_ex.dec.nal_info = buf[nal_start_idx];
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
@@ -810,11 +813,11 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 		for (i = 0; i < H264_MAX_MV_NUM; i++) {
 			mem = &inst->mv_buf[i];
-			inst->vsi_ctx.mv_buf_dma[i].dma_addr = mem->dma_addr;
+			inst->vsi_ctx_ex.mv_buf_dma[i].dma_addr = mem->dma_addr;
 		}
 	}
 
-	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx_ex, sizeof(inst->vsi_ctx_ex));
 	err = vpu_dec_start(vpu, data, 2);
 	if (err)
 		goto err_free_fb_out;
@@ -825,18 +828,18 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
 
-	inst->vsi->dec.timeout = !!err;
+	inst->vsi_ex->dec.timeout = !!err;
 	err = vpu_dec_end(vpu);
 	if (err)
 		goto err_free_fb_out;
 
-	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
+	memcpy(&inst->vsi_ctx_ex, inst->vpu.vsi, sizeof(inst->vsi_ctx_ex));
 	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       inst->ctx->decoded_frame_cnt,
-		       inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
-		       inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
-		       inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
-		       inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
+		       inst->vsi_ctx_ex.dec.crc[0], inst->vsi_ctx_ex.dec.crc[1],
+		       inst->vsi_ctx_ex.dec.crc[2], inst->vsi_ctx_ex.dec.crc[3],
+		       inst->vsi_ctx_ex.dec.crc[4], inst->vsi_ctx_ex.dec.crc[5],
+		       inst->vsi_ctx_ex.dec.crc[6], inst->vsi_ctx_ex.dec.crc[7]);
 
 	inst->ctx->decoded_frame_cnt++;
 	return 0;
-- 
2.46.0


