Return-Path: <linux-media+bounces-19541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00B99C171
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8D4280A0F
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85663155342;
	Mon, 14 Oct 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HEhrk6hS"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3933314F11E;
	Mon, 14 Oct 2024 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891206; cv=none; b=lgAoCmmIWKeIRpjjUnScRMErL9M1dMWbU/n9bZlH1c76U8ASHyIKmm0iGBigj+kl0XOC5rej1W8wi9YIDttFR+c1kSDMDPWLe5Wm25XtFzDJZMoTTR2eg2/pnMsFADd1Ux8GRVdBhl4AIGsglu6Bh1M88/va92xRrdF53XNRNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891206; c=relaxed/simple;
	bh=dLyhUxpjXQHvfBYJo+iN4N0NwQL4k1Lo4l3XtlcfyTs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHdMrTkNQVqmDjl7O/k0uXYHpJAoLAGOoFhE8XZaESZadZUEsqgnoSyE1iaLRouVHwYcvPvftdtdE68VwPIX0nPrlhYTCiK71gzHEbyRshuDz39k7iMWm86lo+A07sV9m89x1d6bcF8tieCfsZW6B/hj2WAo2WzVOUhe/reOoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HEhrk6hS; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 94a3ae3689fe11ef88ecadb115cee93b-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JQFF5lwEKMXWavizCwOCi6GLo/NXGgvmJOoS6LS9+kA=;
	b=HEhrk6hSlzKgdynpQCtQy5DiZkUlUH+NzIjiVkp+eObqv+vZcQuqdITbxWQxm5VqG8ryeFdYQa2NI+JJN+sEPAf6aVro6CU2fBymxBdabaf0YwfzhKqTi0CpqkrTGX8meKB1PHerlmogSIi7IF33+LA6y974ZDTnmVhwXAdH91A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:dc10a653-a5d4-469b-a5d1-42f057d820d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:58923641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 94a3ae3689fe11ef88ecadb115cee93b-20241014
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 404583205; Mon, 14 Oct 2024 15:33:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 15:33:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 15:33:16 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 6/6] media: mediatek: vcodec: support extend h264 driver
Date: Mon, 14 Oct 2024 15:33:10 +0800
Message-ID: <20241014073314.18409-7-yunfei.dong@mediatek.com>
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
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.369500-8.000000
X-TMASE-MatchedRID: M+1zxOMnjnnpuI4DF8FKRo+YSzwl92XTuLwbhNl9B5VEv26FkhjLXSDY
	qYUJWlkTlTJXKqh1ne0Gts3gBnpCcwfOWObyORhFoprTEHvewADt/okBLaEo+BS11FlOYRohWIN
	4hZGO5GxtiFlpOAkr544K+5U79wEWMWZZmYy5XmYCg1rav4R3DeWNJG9Iamrc82HMiBe0UlWlHj
	sjMHC3hr6Fb9LVNYcnWG1zHa+3pOvMXKkorvNQjqSkqjfmd3aeYQXxsZnRwoKJoFTGeLN6N5wNy
	2jM59Dx3wRvo7D+BFnIhb5ceJvuqZO1eXsst5WcSDkh6bW+bcd9LQinZ4QefJOK2Na/r7MIF70J
	Bot7Y8/3FLeZXNZS4KBkcgGnJ4WmATHAvd0eAnynaqUE0suhlXL8Wfj+XNvZMvy24V4e+tV+3Bn
	dfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.369500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7320157F2FC85AE2507886B08ABE501F44C6E8FA13BBF7A05CDCD5AFA3A17A2D2000:8
X-MTK: N

Rename the extend interface with _ex and sync the non extend driver.
Adding capability to separate extend and non extend driver.

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
index d6dc1cc5a712..94be1ad394c9 100644
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
@@ -707,7 +808,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	struct vdec_h264_slice_share_info *share_info;
 
 	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
-				vdec_h264_slice_core_decode,
+				vdec_h264_slice_core_decode_ex,
 				sizeof(*share_info)))
 		return -ENOMEM;
 
@@ -816,8 +917,153 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
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
@@ -919,6 +1165,104 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
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
@@ -928,8 +1272,17 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
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


