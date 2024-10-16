Return-Path: <linux-media+bounces-19717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C099FFB4
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429BC2867F6
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234A118A93F;
	Wed, 16 Oct 2024 03:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kPBuUeRF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC017C234;
	Wed, 16 Oct 2024 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050582; cv=none; b=XqhFWhCLvb0ZB3gIN9Zbaiq34yI8pMHo0PodVNFV5czCNqUih63/afjZS2BqnILYddoI8eoHioVKTDsUwJfSQfhwmYF7YKiSO/MpdLq2ApCQsZZsxEdNs0EGReEA72hzp2h59HpDMFu2KrCzR26ZEfoSlIKWiXmZLfb0mdMWk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050582; c=relaxed/simple;
	bh=RceBR8t5MaGwRAUKEytGmQZSaWu6QwNv/3vtbGUMh6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJGMDCEiVj3tgh3pV7Mb0CzddHzIKmnPhFhH6zLvVIvf272iQAy1ZxDYxld1IcOnP5ZmAMUjH5qLkTq+Zy2lGfz8gm7WWj6gKODfIc33RF4gX+RHvbu+6XV2JEzxhTdlG3FPumSqh1lJ4wQyhqKSvyKDEVUfwjvjRBrfnpQpgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kPBuUeRF; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a698df2a8b7111ef8b96093e013ec31c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dJLompwcSJ06QRQmNB1wdfL/0lBxNIIFIDF7mTAXKq4=;
	b=kPBuUeRFHwie4cZ7+Ankl5LUOMqKYiSUQvxLxLx6Cd2rxKm9YQBzzQ7n5+8B4Ml4AtfP+twgXz8fQPeNw8TIocA4FSXdgsJCxWnPYNSoUnwYQj3awp35jIWGb6zZRTNCqlW7LoxToFql05x8SdYR4/jq7sjA6iacIdlmLnpdv9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4a6b8a3f-1003-4380-8fc2-44f92fefac52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:ac615341-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a698df2a8b7111ef8b96093e013ec31c-20241016
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1625969558; Wed, 16 Oct 2024 11:49:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 15 Oct 2024 20:49:30 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:29 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 3/4] media: mediatek: vcodec: support extend h264 driver
Date: Wed, 16 Oct 2024 11:49:22 +0800
Message-ID: <20241016034927.8181-4-yunfei.dong@mediatek.com>
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
X-MTK: N

Adding capability to separate extend and non extend driver to support
different architecture.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 377 +++++++++++++++++-
 2 files changed, 367 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 886fa385e2e6..1e697bc810b0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -17,6 +17,7 @@
 
 #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
+#define IS_VDEC_SUPPORT_EX(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EX)
 
 enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_INVAL = 0,
@@ -42,6 +43,7 @@ enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_HEVC_FRAME = 0x1000,
 	MTK_VCODEC_INNER_RACING = 0x20000,
 	MTK_VDEC_IS_SUPPORT_10BIT = 0x40000,
+	MTK_VDEC_IS_SUPPORT_EX = 0x80000,
 };
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index e02ed8dfe0ce..69ca775bb3f1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -571,6 +571,7 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_h264_slice_inst *inst;
 	int err, vsi_size;
+	unsigned char *temp;
 
 	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (!inst)
@@ -590,10 +591,21 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_free_inst;
 	}
 
-	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi_ex), VCODEC_DEC_ALIGNED_64);
-	inst->vsi_ex = inst->vpu.vsi;
-	inst->vsi_core_ex =
-		(struct vdec_h264_slice_vsi_ex *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (IS_VDEC_SUPPORT_EX(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_h264_slice_vsi_ex);
+
+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
+		inst->vsi_ex = inst->vpu.vsi;
+		temp = (unsigned char *)inst->vsi_ex;
+		inst->vsi_core_ex = (struct vdec_h264_slice_vsi_ex *)(temp + vsi_size);
+	} else {
+		vsi_size = sizeof(struct vdec_h264_slice_vsi);
+
+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
+		inst->vsi = inst->vpu.vsi;
+		temp = (unsigned char *)inst->vsi;
+		inst->vsi_core = (struct vdec_h264_slice_vsi *)(temp + vsi_size);
+	}
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
@@ -625,7 +637,7 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 	kfree(inst);
 }
 
-static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
+static int vdec_h264_slice_core_decode_ex(struct vdec_lat_buf *lat_buf)
 {
 	int err, timeout;
 	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
@@ -672,6 +684,95 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	return 0;
 }
 
+static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
+{
+	struct vdec_fb *fb;
+	u64 vdec_fb_va;
+	u64 y_fb_dma, c_fb_dma;
+	int err, timeout, i;
+	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
+	struct vdec_h264_slice_inst *inst = ctx->drv_handle;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vdec_h264_slice_share_info *share_info = lat_buf->private_data;
+	struct mtk_vcodec_mem *mem;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+
+	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
+	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
+	       sizeof(share_info->h264_slice_params));
+
+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	if (!fb) {
+		err = -EBUSY;
+		mtk_vdec_err(ctx, "fb buffer is NULL");
+		goto vdec_dec_end;
+	}
+
+	vdec_fb_va = (unsigned long)fb;
+	y_fb_dma = (u64)fb->base_y.dma_addr;
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+		c_fb_dma =
+			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+	else
+		c_fb_dma = (u64)fb->base_c.dma_addr;
+
+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
+
+	inst->vsi_core->dec.y_fb_dma = y_fb_dma;
+	inst->vsi_core->dec.c_fb_dma = c_fb_dma;
+	inst->vsi_core->dec.vdec_fb_va = vdec_fb_va;
+	inst->vsi_core->dec.nal_info = share_info->nal_info;
+	inst->vsi_core->wdma_start_addr =
+		lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core->wdma_end_addr =
+		lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
+		lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi_core->wdma_err_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core->slice_bc_start_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core->slice_bc_end_addr = lat_buf->slice_bc_addr.dma_addr +
+		lat_buf->slice_bc_addr.size;
+	inst->vsi_core->trans_start = share_info->trans_start;
+	inst->vsi_core->trans_end = share_info->trans_end;
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_core->mv_buf_dma[i] = mem->dma_addr;
+	}
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
+
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
+					    share_info);
+
+	err = vpu_dec_core(vpu);
+	if (err) {
+		mtk_vdec_err(ctx, "core decode err=%d", err);
+		goto vdec_dec_end;
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	if (timeout)
+		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
+	inst->vsi_core->dec.timeout = !!timeout;
+
+	vpu_dec_core_end(vpu);
+	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt,
+		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
+		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
+		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
+		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
+
+vdec_dec_end:
+	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_src);
+	mtk_vdec_debug(ctx, "core decode done err=%d", err);
+	ctx->decoded_frame_cnt++;
+	return 0;
+}
+
 static void vdec_h264_insert_startcode(struct mtk_vcodec_dec_dev *vcodec_dev, unsigned char *buf,
 				       size_t *bs_size, struct mtk_h264_pps_param *pps)
 {
@@ -695,8 +796,8 @@ static void vdec_h264_insert_startcode(struct mtk_vcodec_dec_dev *vcodec_dev, un
 	(*bs_size) += 4;
 }
 
-static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-				      struct vdec_fb *fb, bool *res_chg)
+static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs,
+					 struct vdec_fb *fb, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
@@ -708,7 +809,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	unsigned char *buf;
 
 	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
-				vdec_h264_slice_core_decode,
+				vdec_h264_slice_core_decode_ex,
 				sizeof(*share_info)))
 		return -ENOMEM;
 
@@ -825,8 +926,153 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return err;
 }
 
-static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-					 struct vdec_fb *unused, bool *res_chg)
+static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				      struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	int nal_start_idx, err, timeout = 0, i;
+	unsigned int data[2];
+	struct vdec_lat_buf *lat_buf;
+	struct vdec_h264_slice_share_info *share_info;
+	unsigned char *buf;
+	struct mtk_vcodec_mem *mem;
+
+	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
+				vdec_h264_slice_core_decode,
+				sizeof(*share_info)))
+		return -ENOMEM;
+
+	/* bs NULL means flush decoder */
+	if (!bs) {
+		vdec_msg_queue_wait_lat_buf_full(&inst->ctx->msg_queue);
+		return vpu_dec_reset(vpu);
+	}
+
+	if (inst->is_field_bitstream)
+		return -EINVAL;
+
+	lat_buf = vdec_msg_queue_dqbuf(&inst->ctx->msg_queue.lat_ctx);
+	if (!lat_buf) {
+		mtk_vdec_debug(inst->ctx, "failed to get lat buffer");
+		return -EAGAIN;
+	}
+	share_info = lat_buf->private_data;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+
+	buf = (unsigned char *)bs->va;
+	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
+	if (nal_start_idx < 0) {
+		err = -EINVAL;
+		goto err_free_fb_out;
+	}
+
+	inst->vsi->dec.nal_info = buf[nal_start_idx];
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
+
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
+						     &inst->vsi->h264_slice_params);
+	if (err)
+		goto err_free_fb_out;
+
+	vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
+				   &share_info->h264_slice_params.pps);
+
+	inst->vsi->dec.bs_buf_addr = (uint64_t)bs->dma_addr;
+	inst->vsi->dec.bs_buf_size = bs->size;
+
+	*res_chg = inst->resolution_changed;
+	if (inst->resolution_changed) {
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
+		if (inst->realloc_mv_buf) {
+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
+			inst->realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		inst->resolution_changed = false;
+	}
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi->mv_buf_dma[i] = mem->dma_addr;
+	}
+	inst->vsi->wdma_start_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi->wdma_end_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
+		lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi->wdma_err_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi->slice_bc_start_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi->slice_bc_end_addr = lat_buf->slice_bc_addr.dma_addr +
+		lat_buf->slice_bc_addr.size;
+
+	inst->vsi->trans_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%llx) err:0x%llx",
+		       inst->vsi->wdma_start_addr,
+		       inst->vsi->wdma_end_addr,
+		       inst->vsi->wdma_err_addr);
+
+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
+		       inst->vsi->slice_bc_start_addr,
+		       inst->vsi->slice_bc_end_addr,
+		       inst->vsi->trans_start,
+		       inst->vsi->trans_end);
+	err = vpu_dec_start(vpu, data, 2);
+	if (err) {
+		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
+		goto err_free_fb_out;
+	}
+
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi->wdma_end_addr_offset;
+	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	share_info->nal_info = inst->vsi->dec.nal_info;
+
+	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+	if (timeout)
+		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+	inst->vsi->dec.timeout = !!timeout;
+
+	err = vpu_dec_end(vpu);
+	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
+		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
+			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
+		inst->slice_dec_num++;
+		mtk_vdec_err(inst->ctx, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
+		return -EINVAL;
+	}
+
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi->wdma_end_addr_offset;
+	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
+
+	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
+	}
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
+		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+
+	inst->slice_dec_num++;
+	return 0;
+err_free_fb_out:
+	vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
+	mtk_vdec_err(inst->ctx, "slice dec number: %d err: %d", inst->slice_dec_num, err);
+	return err;
+}
+
+static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs,
+					    struct vdec_fb *unused, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
@@ -928,6 +1174,104 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	return err;
 }
 
+static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+					 struct vdec_fb *unused, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
+	struct vdec_fb *fb;
+	unsigned char *buf;
+	unsigned int data[2], i;
+	u64 y_fb_dma, c_fb_dma;
+	struct mtk_vcodec_mem *mem;
+	int err, nal_start_idx;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vpu_dec_reset(vpu);
+
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
+		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
+
+	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx.dec.bs_buf_size = bs->size;
+	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
+	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
+	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
+	err = get_vdec_sig_decode_parameters(inst);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx.h264_slice_params));
+
+	buf = (unsigned char *)bs->va;
+	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
+	if (nal_start_idx < 0) {
+		err = -EINVAL;
+		goto err_free_fb_out;
+	}
+	inst->vsi_ctx.dec.nal_info = buf[nal_start_idx];
+
+	*res_chg = inst->resolution_changed;
+	if (inst->resolution_changed) {
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
+		if (inst->realloc_mv_buf) {
+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
+			inst->realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		inst->resolution_changed = false;
+
+		for (i = 0; i < H264_MAX_MV_NUM; i++) {
+			mem = &inst->mv_buf[i];
+			inst->vsi_ctx.mv_buf_dma[i] = mem->dma_addr;
+		}
+	}
+
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
+	err = vpu_dec_start(vpu, data, 2);
+	if (err)
+		goto err_free_fb_out;
+
+	/* wait decoder done interrupt */
+	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	if (err)
+		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
+
+	inst->vsi->dec.timeout = !!err;
+	err = vpu_dec_end(vpu);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
+	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       inst->ctx->decoded_frame_cnt,
+		       inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
+		       inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
+		       inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
+		       inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
+
+	inst->ctx->decoded_frame_cnt++;
+	return 0;
+
+err_free_fb_out:
+	mtk_vdec_err(inst->ctx, "dec frame number: %d err: %d", inst->ctx->decoded_frame_cnt, err);
+	return err;
+}
+
 static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 				  struct vdec_fb *unused, bool *res_chg)
 {
@@ -937,8 +1281,17 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (!h_vdec)
 		return -EINVAL;
 
-	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
-		ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
+	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
+		if (IS_VDEC_SUPPORT_EX(inst->ctx->dev->dec_capability))
+			ret = vdec_h264_slice_single_decode_ex(h_vdec, bs, unused, res_chg);
+		else
+			ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
+
+		return ret;
+	}
+
+	if (IS_VDEC_SUPPORT_EX(inst->ctx->dev->dec_capability))
+		ret = vdec_h264_slice_lat_decode_ex(h_vdec, bs, unused, res_chg);
 	else
 		ret = vdec_h264_slice_lat_decode(h_vdec, bs, unused, res_chg);
 
-- 
2.46.0


