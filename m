Return-Path: <linux-media+bounces-15177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C99937F98
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2873C281EB4
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 07:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66F514387C;
	Sat, 20 Jul 2024 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UhjL6umq"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD732B9C5;
	Sat, 20 Jul 2024 07:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721459802; cv=none; b=iC+mRDGlhHySbnmcnpumFdLiBM6rhbx2FHrBFOMaOXUSm2aYxDB1kzxsRrOGbmoUUg7/HoNd6Q8kCaW8cWBo90jCv6zv1ITXPdZwP8Xt+16Hztnf7pXhZP6BdTP2pLjlzNbKHtUCFa8wKsrtoO+qrqxqczmJJsUV80WPbzJX+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721459802; c=relaxed/simple;
	bh=kpBEweNTv5UBElFnDtoNa+oLvAXHeHSZ14BHOoLNonU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gro02sTpGraUZIcaNulDuRXZAHediZdItfFLkRJsj9gkLGbhbFk5pP/YOkh1zgPtjj2xHVsw1URNsbymSeKivyqFlImkr7DVrEYP3fvuNlFiQp+6gZgB2EnK/Tbi21pKVk//ID5drORZCdhiz1QhuMpSrHzq99bLuVsHJPAZx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UhjL6umq; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ff468c3e466711efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TarmkAlYvvm8rcU+766mo6fKv+ctjpOeRN79edqsW9c=;
	b=UhjL6umqCx2zD50ks46roCe8mqQO7wlrZ7JLi+ip7Njih44+VVbjuLFXYr/+ZO6NZATZxsZRv40/yVcMfXkUvJzAlVowoMWSbM+LygJR8GhyhbzH/F8MEMeNBfd9zNaIH7yQxjoclOBgpYOkI4DWrJhMV2FZ/oBfBqegAjOlGEg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:8a0a3d5f-645c-45a7-991e-5ec3ffda2d95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:293c8545-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ff468c3e466711efb5b96b43b535fdb4-20240720
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 720563737; Sat, 20 Jul 2024 15:16:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:32 +0800
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
Subject: [PATCH v7 17/28] media: mediatek: vcodec: re-construct h264 driver to support svp mode
Date: Sat, 20 Jul 2024 15:15:55 +0800
Message-ID: <20240720071606.27930-18-yunfei.dong@mediatek.com>
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

Need secure buffer size to convert secure handle to secure
pa in optee-os, re-construct the vsi struct to store each
secure buffer size.

Separate svp and normal wait interrupt condition for svp mode
waiting hardware interrupt in optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 261 +++++++++++-------
 .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
 2 files changed, 168 insertions(+), 102 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index dc7b69b22e89..68120dcfc494 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -60,14 +60,36 @@ struct vdec_h264_slice_lat_dec_param {
  * @crc:		Used to check whether hardware's status is right
  */
 struct vdec_h264_slice_info {
+	u64 wdma_end_addr_offset;
 	u16 nal_info;
 	u16 timeout;
-	u32 bs_buf_size;
-	u64 bs_buf_addr;
-	u64 y_fb_dma;
-	u64 c_fb_dma;
 	u64 vdec_fb_va;
 	u32 crc[8];
+	u32 reserved;
+};
+
+/*
+ * struct vdec_h264_slice_mem - memory address and size
+ */
+struct vdec_h264_slice_mem {
+	union {
+		u64 buf;
+		u64 dma_addr;
+	};
+	union {
+		size_t size;
+		u64 dma_addr_end;
+	};
+};
+
+/**
+ * struct vdec_h264_slice_fb - frame buffer for decoding
+ * @y:  current y buffer address info
+ * @c:  current c buffer address info
+ */
+struct vdec_h264_slice_fb {
+	struct vdec_h264_slice_mem y;
+	struct vdec_h264_slice_mem c;
 };
 
 /**
@@ -92,18 +114,16 @@ struct vdec_h264_slice_info {
  */
 struct vdec_h264_slice_vsi {
 	/* LAT dec addr */
-	u64 wdma_err_addr;
-	u64 wdma_start_addr;
-	u64 wdma_end_addr;
-	u64 slice_bc_start_addr;
-	u64 slice_bc_end_addr;
-	u64 row_info_start_addr;
-	u64 row_info_end_addr;
-	u64 trans_start;
-	u64 trans_end;
-	u64 wdma_end_addr_offset;
+	struct vdec_h264_slice_mem bs;
+	struct vdec_h264_slice_fb fb;
 
-	u64 mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_slice_mem ube;
+	struct vdec_h264_slice_mem trans;
+	struct vdec_h264_slice_mem row_info;
+	struct vdec_h264_slice_mem err_map;
+	struct vdec_h264_slice_mem slice_bc;
+
+	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
 	struct vdec_h264_slice_info dec;
 	struct vdec_h264_slice_lat_dec_param h264_slice_params;
 };
@@ -392,6 +412,100 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
 		       cr->left, cr->top, cr->width, cr->height);
 }
 
+static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_inst *inst,
+					     struct mtk_vcodec_mem *bs,
+					     struct vdec_lat_buf *lat_buf)
+{
+	struct mtk_vcodec_mem *mem;
+	int i;
+
+	inst->vsi->bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi->bs.size = bs->size;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi->mv_buf_dma[i].size = mem->size;
+	}
+	inst->vsi->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi->row_info.dma_addr = 0;
+	inst->vsi->row_info.size = 0;
+
+	inst->vsi->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
+}
+
+static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst *inst,
+					     struct vdec_h264_slice_share_info *share_info,
+					     struct vdec_lat_buf *lat_buf)
+{
+	struct mtk_vcodec_mem *mem;
+	struct mtk_vcodec_dec_ctx *ctx = inst->ctx;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vdec_fb *fb;
+	u64 y_fb_dma, c_fb_dma = 0;
+	int i;
+
+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	if (!fb) {
+		mtk_vdec_err(ctx, "fb buffer is NULL");
+		return -EBUSY;
+	}
+
+	y_fb_dma = (u64)fb->base_y.dma_addr;
+	if (!ctx->is_secure_playback) {
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+			c_fb_dma =
+				y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+		else
+			c_fb_dma = (u64)fb->base_c.dma_addr;
+	}
+
+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
+
+	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
+	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
+	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
+	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
+
+	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
+	inst->vsi_core->dec.nal_info = share_info->nal_info;
+
+	inst->vsi_core->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi_core->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_core->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_core->row_info.dma_addr = 0;
+	inst->vsi_core->row_info.size = 0;
+
+	inst->vsi_core->trans.dma_addr = share_info->trans_start;
+	inst->vsi_core->trans.dma_addr_end = share_info->trans_end;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_core->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_core->mv_buf_dma[i].size = mem->size;
+	}
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
+
+	return 0;
+}
+
 static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_h264_slice_inst *inst;
@@ -456,64 +570,22 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 
 static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 {
-	struct vdec_fb *fb;
-	u64 vdec_fb_va;
-	u64 y_fb_dma, c_fb_dma;
-	int err, timeout, i;
+	int err, timeout;
 	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
 	struct vdec_h264_slice_inst *inst = ctx->drv_handle;
-	struct vb2_v4l2_buffer *vb2_v4l2;
 	struct vdec_h264_slice_share_info *share_info = lat_buf->private_data;
-	struct mtk_vcodec_mem *mem;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 
 	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
 	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
 	       sizeof(share_info->h264_slice_params));
 
-	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
-	if (!fb) {
-		err = -EBUSY;
-		mtk_vdec_err(ctx, "fb buffer is NULL");
+	err = vdec_h264_slice_setup_core_buffer(inst, share_info, lat_buf);
+	if (err)
 		goto vdec_dec_end;
-	}
-
-	vdec_fb_va = (unsigned long)fb;
-	y_fb_dma = (u64)fb->base_y.dma_addr;
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
-		c_fb_dma =
-			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
-	else
-		c_fb_dma = (u64)fb->base_c.dma_addr;
-
-	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
-
-	inst->vsi_core->dec.y_fb_dma = y_fb_dma;
-	inst->vsi_core->dec.c_fb_dma = c_fb_dma;
-	inst->vsi_core->dec.vdec_fb_va = vdec_fb_va;
-	inst->vsi_core->dec.nal_info = share_info->nal_info;
-	inst->vsi_core->wdma_start_addr =
-		lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
-	inst->vsi_core->wdma_end_addr =
-		lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
-		lat_buf->ctx->msg_queue.wdma_addr.size;
-	inst->vsi_core->wdma_err_addr = lat_buf->wdma_err_addr.dma_addr;
-	inst->vsi_core->slice_bc_start_addr = lat_buf->slice_bc_addr.dma_addr;
-	inst->vsi_core->slice_bc_end_addr = lat_buf->slice_bc_addr.dma_addr +
-		lat_buf->slice_bc_addr.size;
-	inst->vsi_core->trans_start = share_info->trans_start;
-	inst->vsi_core->trans_end = share_info->trans_end;
-	for (i = 0; i < H264_MAX_MV_NUM; i++) {
-		mem = &inst->mv_buf[i];
-		inst->vsi_core->mv_buf_dma[i] = mem->dma_addr;
-	}
-
-	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
-	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
 
 	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
 					    share_info);
-
 	err = vpu_dec_core(vpu);
 	if (err) {
 		mtk_vdec_err(ctx, "core decode err=%d", err);
@@ -572,12 +644,11 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info;
-	int nal_start_idx, err, timeout = 0, i;
+	int nal_start_idx, err, timeout = 0;
 	unsigned int data[2];
 	struct vdec_lat_buf *lat_buf;
 	struct vdec_h264_slice_share_info *share_info;
 	unsigned char *buf;
-	struct mtk_vcodec_mem *mem;
 
 	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
 				vdec_h264_slice_core_decode,
@@ -616,11 +687,9 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (err)
 		goto err_free_fb_out;
 
-	vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
-				   &share_info->h264_slice_params.pps);
-
-	inst->vsi->dec.bs_buf_addr = (uint64_t)bs->dma_addr;
-	inst->vsi->dec.bs_buf_size = bs->size;
+	if (!inst->ctx->is_secure_playback)
+		vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
+					   &share_info->h264_slice_params.pps);
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
@@ -633,38 +702,27 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		}
 		inst->resolution_changed = false;
 	}
-	for (i = 0; i < H264_MAX_MV_NUM; i++) {
-		mem = &inst->mv_buf[i];
-		inst->vsi->mv_buf_dma[i] = mem->dma_addr;
-	}
-	inst->vsi->wdma_start_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
-	inst->vsi->wdma_end_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
-		lat_buf->ctx->msg_queue.wdma_addr.size;
-	inst->vsi->wdma_err_addr = lat_buf->wdma_err_addr.dma_addr;
-	inst->vsi->slice_bc_start_addr = lat_buf->slice_bc_addr.dma_addr;
-	inst->vsi->slice_bc_end_addr = lat_buf->slice_bc_addr.dma_addr +
-		lat_buf->slice_bc_addr.size;
-
-	inst->vsi->trans_end = inst->ctx->msg_queue.wdma_rptr_addr;
-	inst->vsi->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
-	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%llx) err:0x%llx",
-		       inst->vsi->wdma_start_addr,
-		       inst->vsi->wdma_end_addr,
-		       inst->vsi->wdma_err_addr);
-
-	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
-		       inst->vsi->slice_bc_start_addr,
-		       inst->vsi->slice_bc_end_addr,
-		       inst->vsi->trans_start,
-		       inst->vsi->trans_end);
+
+	vdec_h264_slice_setup_lat_buffer(inst, bs, lat_buf);
+	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
+		       inst->vsi->ube.dma_addr, (unsigned long)inst->vsi->ube.size,
+		       inst->vsi->err_map.dma_addr);
+
+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
+		       inst->vsi->slice_bc.dma_addr, (unsigned long)inst->vsi->slice_bc.size,
+		       inst->vsi->trans.dma_addr, inst->vsi->trans.dma_addr_end);
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
 		goto err_free_fb_out;
 	}
 
-	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->wdma_end_addr_offset;
+	if (inst->ctx->is_secure_playback)
+		share_info->trans_end = inst->vsi->dec.wdma_end_addr_offset;
+	else
+		share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+			inst->vsi->dec.wdma_end_addr_offset;
+
 	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
 	share_info->nal_info = inst->vsi->dec.nal_info;
 
@@ -690,8 +748,11 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		return -EINVAL;
 	}
 
-	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->wdma_end_addr_offset;
+	if (inst->ctx->is_secure_playback)
+		share_info->trans_end = inst->vsi->dec.wdma_end_addr_offset;
+	else
+		share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+			inst->vsi->dec.wdma_end_addr_offset;
 	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
 
 	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
@@ -736,10 +797,10 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
 		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
 
-	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
-	inst->vsi_ctx.dec.bs_buf_size = bs->size;
-	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
-	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
+	inst->vsi_ctx.bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx.bs.size = bs->size;
+	inst->vsi_ctx.fb.y.dma_addr = y_fb_dma;
+	inst->vsi_ctx.fb.c.dma_addr = c_fb_dma;
 	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
@@ -769,7 +830,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 		for (i = 0; i < H264_MAX_MV_NUM; i++) {
 			mem = &inst->mv_buf[i];
-			inst->vsi_ctx.mv_buf_dma[i] = mem->dma_addr;
+			inst->vsi_ctx.mv_buf_dma[i].dma_addr = mem->dma_addr;
 		}
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
index f283c4703dc6..c1310176ae05 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
@@ -308,8 +308,13 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 		msg_queue->wdma_addr.size = 0;
 		return -ENOMEM;
 	}
-	msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
-	msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
+	if (ctx->is_secure_playback) {
+		msg_queue->wdma_rptr_addr = 0;
+		msg_queue->wdma_wptr_addr = 0;
+	} else {
+		msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
+		msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
+	}
 
 	msg_queue->empty_lat_buf.ctx = ctx;
 	msg_queue->empty_lat_buf.core_decode = NULL;
-- 
2.18.0


