Return-Path: <linux-media+bounces-19715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519199FFAE
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63B94B2468F
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B575187344;
	Wed, 16 Oct 2024 03:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qecjsMPl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5AF157494;
	Wed, 16 Oct 2024 03:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050579; cv=none; b=phWy7t27mToarff5pGB0b6orMJvmRXnTXcYVSpiCun7JHy72yEMiH52+Sf5neDXr2EaAkZSU49qwQxokRAyJBVccbfSrJBdOaIjwUDip+ZW3diUVq9wKRgOwZVWo/OVhgEg2c9yQPpGJvtgVWTNiYIiQLnfvsaOkYSxlilT6H6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050579; c=relaxed/simple;
	bh=STMvqS/MeSC9xxAhB2Br/74qkNW1s0bGlme0hYce57k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plJPOPuKlku9KE7A5FL8gLEezuK8YpOym3LXlnRaNDP8iUQFCcSic0QPU5Z+XYXEk/7V6dI/dYVE6Bx+gU/BytCjD/vECEUR8YmdAJZpxsT+xNyE5+1JbHiyuh+89IjNdwL2N3IXBo69UmBftzofMdfqHoam/K+NXIWV1WKEAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qecjsMPl; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a5e81f788b7111ef88ecadb115cee93b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rzb5PFEZBtDM+VsRRlLP2wLW3k5S3DXtSJqTJRCxAEM=;
	b=qecjsMPlc7JY6T+hAcJLalSkI36VPLraruPT0VMZUro6Fl0+3E7qUg3wrDp8CtFG6X6U1RQnubiwoTSrQYvqpYc5QiFNFV3rTUC7ioL9g0fsdB3nDxdX/VxOLmz/lN9VE3jt94KGLhhu6g1KgiGw9bHqRcsDdA74EwCIPSApkw0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:39c63be1-37e5-45ac-a0b1-4d150c8525a6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c730db06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a5e81f788b7111ef88ecadb115cee93b-20241016
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1798167992; Wed, 16 Oct 2024 11:49:30 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 15 Oct 2024 20:49:28 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:28 +0800
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
Subject: [PATCH v2 2/4] media: mediatek: vcodec: support extend h264 video shared information
Date: Wed, 16 Oct 2024 11:49:21 +0800
Message-ID: <20241016034927.8181-3-yunfei.dong@mediatek.com>
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

The address end of working buffer can't be calculated directly
with buffer size in kernel for some special architecture. Adding
new extend vsi to calculate the address end in other os.
Refactoring the driver flow to make the driver looks more reasonable.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 355 ++++++++++++------
 1 file changed, 238 insertions(+), 117 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 57c85af5ffb4..e02ed8dfe0ce 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -48,10 +48,29 @@ struct vdec_h264_slice_lat_dec_param {
 };
 
 /**
- * struct vdec_h264_slice_info - decode information
+ * struct vdec_h264_slice_info_ex - extend decode information
  *
+ * @wdma_end_addr_offset:	offset from buffer start
  * @nal_info:		nal info of current picture
  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
+ * @vdec_fb_va:	VDEC frame buffer struct virtual address
+ * @crc:		Used to check whether hardware's status is right
+ * @reserved:		reserved
+ */
+struct vdec_h264_slice_info_ex {
+	u64 wdma_end_addr_offset;
+	u16 nal_info;
+	u16 timeout;
+	u64 vdec_fb_va;
+	u32 crc[8];
+	u32 reserved;
+};
+
+/**
+ * struct vdec_h264_slice_info - decode information
+ *
+ * @nal_info:		nal info of current picture
+ * @timeout:		Decode timeout: 1 timeout, 0 no timeount
  * @bs_buf_size:	bitstream size
  * @bs_buf_addr:	bitstream buffer dma address
  * @y_fb_dma:		Y frame buffer dma address
@@ -70,6 +89,64 @@ struct vdec_h264_slice_info {
 	u32 crc[8];
 };
 
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
+ *
+ * @y:  current y buffer address info
+ * @c:  current c buffer address info
+ */
+struct vdec_h264_slice_fb {
+	struct vdec_h264_slice_mem y;
+	struct vdec_h264_slice_mem c;
+};
+
+/**
+ * struct vdec_h264_slice_vsi_ex - extend shared memory for decode information exchange
+ *        between SCP and Host.
+ *
+ * @bs:		input buffer info
+ * @fb:		current y/c buffer
+ *
+ * @ube:		ube buffer
+ * @trans:		transcoded buffer
+ * @row_info:		row info buffer
+ * @err_map:		err map buffer
+ * @slice_bc:		slice buffer
+ *
+ * @mv_buf_dma:		HW working motion vector buffer
+ * @dec:		decode information (AP-R, VPU-W)
+ * @h264_slice_params:	decode parameters for hw used
+ */
+struct vdec_h264_slice_vsi_ex {
+	/* LAT dec addr */
+	struct vdec_h264_slice_mem bs;
+	struct vdec_h264_slice_fb fb;
+
+	struct vdec_h264_slice_mem ube;
+	struct vdec_h264_slice_mem trans;
+	struct vdec_h264_slice_mem row_info;
+	struct vdec_h264_slice_mem err_map;
+	struct vdec_h264_slice_mem slice_bc;
+
+	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_slice_info_ex dec;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+};
+
 /**
  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
  *        between SCP and Host.
@@ -136,10 +213,10 @@ struct vdec_h264_slice_share_info {
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
@@ -156,10 +233,19 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi *vsi;
-	struct vdec_h264_slice_vsi *vsi_core;
-
-	struct vdec_h264_slice_vsi vsi_ctx;
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_ex;
+		struct vdec_h264_slice_vsi *vsi;
+	};
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_core_ex;
+		struct vdec_h264_slice_vsi *vsi_core;
+	};
+
+	union {
+		struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
+		struct vdec_h264_slice_vsi vsi_ctx;
+	};
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
@@ -389,6 +475,98 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
 		       cr->left, cr->top, cr->width, cr->height);
 }
 
+static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_inst *inst,
+					     struct mtk_vcodec_mem *bs,
+					     struct vdec_lat_buf *lat_buf)
+{
+	struct mtk_vcodec_mem *mem;
+	int i;
+
+	inst->vsi_ex->bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ex->bs.size = bs->size;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_ex->mv_buf_dma[i].size = mem->size;
+	}
+	inst->vsi_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi_ex->row_info.dma_addr = 0;
+	inst->vsi_ex->row_info.size = 0;
+
+	inst->vsi_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_ex->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_ex->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi_ex->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
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
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+		c_fb_dma =
+			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+	else
+		c_fb_dma = (u64)fb->base_c.dma_addr;
+
+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
+
+	inst->vsi_core_ex->fb.y.dma_addr = y_fb_dma;
+	inst->vsi_core_ex->fb.y.size = ctx->picinfo.fb_sz[0];
+	inst->vsi_core_ex->fb.c.dma_addr = c_fb_dma;
+	inst->vsi_core_ex->fb.c.size = ctx->picinfo.fb_sz[1];
+
+	inst->vsi_core_ex->dec.vdec_fb_va = (unsigned long)fb;
+	inst->vsi_core_ex->dec.nal_info = share_info->nal_info;
+
+	inst->vsi_core_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi_core_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core_ex->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_core_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_core_ex->row_info.dma_addr = 0;
+	inst->vsi_core_ex->row_info.size = 0;
+
+	inst->vsi_core_ex->trans.dma_addr = share_info->trans_start;
+	inst->vsi_core_ex->trans.dma_addr_end = share_info->trans_end;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_core_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_core_ex->mv_buf_dma[i].size = mem->size;
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
@@ -412,10 +590,10 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
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
 
@@ -449,64 +627,22 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 
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
-	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
+	memcpy(&inst->vsi_core_ex->h264_slice_params, &share_info->h264_slice_params,
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
-
-	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core_ex->h264_slice_params,
 					    share_info);
-
 	err = vpu_dec_core(vpu);
 	if (err) {
 		mtk_vdec_err(ctx, "core decode err=%d", err);
@@ -518,15 +654,15 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
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
@@ -565,12 +701,11 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
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
@@ -606,16 +741,13 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
 	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
-						     &inst->vsi->h264_slice_params);
+						     &inst->vsi_ex->h264_slice_params);
 	if (err)
 		goto err_free_fb_out;
 
 	vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
 				   &share_info->h264_slice_params.pps);
 
-	inst->vsi->dec.bs_buf_addr = (uint64_t)bs->dma_addr;
-	inst->vsi->dec.bs_buf_size = bs->size;
-
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
 		mtk_vdec_debug(inst->ctx, "- resolution changed -");
@@ -627,30 +759,16 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
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
+		       inst->vsi_ex->ube.dma_addr, (unsigned long)inst->vsi_ex->ube.size,
+		       inst->vsi_ex->err_map.dma_addr);
+
+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
+		       inst->vsi_ex->slice_bc.dma_addr, (unsigned long)inst->vsi_ex->slice_bc.size,
+		       inst->vsi_ex->trans.dma_addr, inst->vsi_ex->trans.dma_addr_end);
+
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
@@ -658,12 +776,13 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->wdma_end_addr_offset;
+		inst->vsi_ex->dec.wdma_end_addr_offset;
+
 	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
-	share_info->nal_info = inst->vsi->dec.nal_info;
+	share_info->nal_info = inst->vsi_ex->dec.nal_info;
 
 	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
-		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
@@ -673,7 +792,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
 	if (timeout)
 		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-	inst->vsi->dec.timeout = !!timeout;
+	inst->vsi_ex->dec.timeout = !!timeout;
 
 	err = vpu_dec_end(vpu);
 	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
@@ -685,16 +804,18 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
-		inst->vsi->wdma_end_addr_offset;
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
@@ -735,11 +856,11 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
 		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
 
-	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
-	inst->vsi_ctx.dec.bs_buf_size = bs->size;
-	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
-	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
-	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+	inst->vsi_ctx_ex.bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx_ex.bs.size = bs->size;
+	inst->vsi_ctx_ex.fb.y.dma_addr = y_fb_dma;
+	inst->vsi_ctx_ex.fb.c.dma_addr = c_fb_dma;
+	inst->vsi_ctx_ex.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
 				   &dst_buf_info->m2m_buf.vb, true);
@@ -747,8 +868,8 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	memcpy(&inst->vsi_ctx.h264_slice_params, &inst->h264_slice_param,
-	       sizeof(inst->vsi_ctx.h264_slice_params));
+	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
 
 	buf = (unsigned char *)bs->va;
 	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
@@ -756,7 +877,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 		err = -EINVAL;
 		goto err_free_fb_out;
 	}
-	inst->vsi_ctx.dec.nal_info = buf[nal_start_idx];
+	inst->vsi_ctx_ex.dec.nal_info = buf[nal_start_idx];
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
@@ -771,11 +892,11 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 		for (i = 0; i < H264_MAX_MV_NUM; i++) {
 			mem = &inst->mv_buf[i];
-			inst->vsi_ctx.mv_buf_dma[i] = mem->dma_addr;
+			inst->vsi_ctx_ex.mv_buf_dma[i].dma_addr = mem->dma_addr;
 		}
 	}
 
-	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx_ex, sizeof(inst->vsi_ctx_ex));
 	err = vpu_dec_start(vpu, data, 2);
 	if (err)
 		goto err_free_fb_out;
@@ -786,18 +907,18 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
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


