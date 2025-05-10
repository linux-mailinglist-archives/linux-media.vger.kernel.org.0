Return-Path: <linux-media+bounces-32208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBECAB21EB
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 09:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BE99E55BC
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B3D1E8358;
	Sat, 10 May 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mqo5mC7G"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D441F1501;
	Sat, 10 May 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863913; cv=none; b=asgUCNLyEaGwftMen1YF5l1oeefGknmMAMV+HQK6FpFK0aRigTUH14Ob8HSQKdRUCQAY7mVCmYrxb5fkUda6VR19tBkeog145GdoKijQZrXevsH3E8TkU3kRSiefpvnjzFku/MTh870CK40BXKaJ7dW/yhD/spAu2j+K/SmTazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863913; c=relaxed/simple;
	bh=Zuy3tZwFRvth0LZf8fgMLJ+/bApOUkBP1viM5lIaebU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MI77jzdBqb7rtMhCQBY1bAjgs1t5VUJ3Ulocjo8EJ203o4KrTc/x2D8vOEs4D634hEk42zj7wxsPZhQO7OhuneJAvhetX7HT9UcPqGHTxXqKAlVS7BBV/F7A2Lss3fnuq1Y2uDAIvMhJp/Wf5kiVWdCLfuJCV+YCwFwKuQYptzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Mqo5mC7G; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8c4139ec2d7411f082f7f7ac98dee637-20250510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ElGHwRwMsrSvbUBHdXrKzCttntWm4O5xq/Wttbo5r3I=;
	b=Mqo5mC7G40A2L+AC5hENI7XSRFqTHu7PanRMS7UXyaigtlCJj9cIJ593S4SxI+9wLhJAxLrVu5hL6gQDEY9uaWX33/wibdqvmLKf6UF2wXiW+F2Xo+KhRnsIJ/jYfOoKFUb9PIWIv2XY7YUp1kPLNv1jPLk0dLxWT8MDL0uTXSM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3f7365ac-6386-4a29-9672-426afc082834,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:9a0dcee0-512b-41ef-ab70-9303a9a81417,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8c4139ec2d7411f082f7f7ac98dee637-20250510
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1004812001; Sat, 10 May 2025 15:58:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 10 May 2025 15:58:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 10 May 2025 15:58:20 +0800
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
Subject: [PATCH 06/14] media: mediatek: vcodec: get share memory address
Date: Sat, 10 May 2025 15:53:36 +0800
Message-ID: <20250510075357.11761-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250510075357.11761-1-yunfei.dong@mediatek.com>
References: <20250510075357.11761-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

There is only one share memory for vcp architecture, need to
divide it into many different functions.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 20 +++++++++++++++++-
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 13 ++++++++++++
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 21 ++++++++++++++-----
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  6 +++++-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  7 +++++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 16 ++++++++++----
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  7 +++++--
 7 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index c9e5cde40aef..f6b93e1bcbf3 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -366,8 +366,26 @@ static unsigned int mtk_vcodec_vcp_get_venc_capa(struct mtk_vcodec_fw *fw)
 	return MTK_VENC_4K_CAPABILITY_ENABLE;
 }
 
-static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr)
+static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_type)
 {
+	unsigned char *vsi_core = fw->vcp->vsi_core_addr;
+
+	switch (mem_type) {
+	case ENCODER_MEM:
+	case VCODEC_LAT_MEM:
+		return fw->vcp->vsi_addr;
+	case VCODEC_CORE_MEM:
+		return vsi_core;
+	case VP9_FRAME_MEM:
+		return vsi_core + VCODEC_VSI_LEN;
+	case AV1_CDF_MEM:
+		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE;
+	case AV1_IQ_MEM:
+		return vsi_core + VCODEC_VSI_LEN + VP9_FRAME_SIZE + AV1_CDF_SIZE;
+	default:
+		break;
+	}
+
 	return NULL;
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index 53080ed12c69..54df468f301b 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -13,6 +13,19 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 #define VCP_SHARE_BUF_SIZE 64
 
 #define VCODEC_VSI_LEN (0x2000)
+#define VP9_FRAME_SIZE (0x1000)
+#define AV1_CDF_SIZE (0xFE80)
+#define AV1_IQ_TABLE_SIZE (0x12200)
+
+/* enum mtk_vcp_mem_type - memory type for different hardware */
+enum mtk_vcp_mem_type {
+	ENCODER_MEM,
+	VCODEC_LAT_MEM,
+	VCODEC_CORE_MEM,
+	VP9_FRAME_MEM,
+	AV1_CDF_MEM,
+	AV1_IQ_MEM,
+};
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 618064001883..2b2173062cb0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -774,8 +774,11 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 
 	ctx = instance->ctx;
 	vsi = instance->vpu.vsi;
-	remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						     (u32)vsi->cdf_table_addr);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, AV1_CDF_MEM);
+	else
+		remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+							     (u32)vsi->cdf_table_addr);
 	if (IS_ERR(remote_cdf_table)) {
 		mtk_vdec_err(ctx, "failed to map cdf table\n");
 		return PTR_ERR(remote_cdf_table);
@@ -805,8 +808,11 @@ static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance
 
 	ctx = instance->ctx;
 	vsi = instance->vpu.vsi;
-	remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						    (u32)vsi->iq_table_addr);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, AV1_IQ_MEM);
+	else
+		remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+							    (u32)vsi->iq_table_addr);
 	if (IS_ERR(remote_iq_table)) {
 		mtk_vdec_err(ctx, "failed to map iq table\n");
 		return PTR_ERR(remote_iq_table);
@@ -1905,7 +1911,12 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 	instance->init_vsi = vsi;
-	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		instance->core_vsi =
+			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+	else
+		instance->core_vsi =
+			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
 
 	if (!instance->core_vsi) {
 		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 50f81f1cb616..6b354d30910c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -1230,7 +1230,11 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
 		inst->vsi_ext = inst->vpu.vsi;
 		temp = (unsigned char *)inst->vsi_ext;
-		inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
+		if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+			inst->vsi_core_ext =
+				mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+		else
+			inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
 
 		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
 			inst->decode = vdec_h264_slice_single_decode_ext;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 80fbd0309b9e..ac0deea0df4c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -877,8 +877,11 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	vsi_size = round_up(sizeof(struct vdec_hevc_slice_vsi), VCODEC_DEC_ALIGNED_64);
 	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		inst->vsi_core = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+	else
+		inst->vsi_core =
+			(struct vdec_hevc_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
 
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 0279f66efdf9..fa0f406f7726 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -513,8 +513,12 @@ static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance
 	if (!ctx || !vsi)
 		return -EINVAL;
 
-	remote_frame_ctx = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						     (u32)vsi->default_frame_ctx);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		remote_frame_ctx =
+			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VP9_FRAME_MEM);
+	else
+		remote_frame_ctx = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+							     (u32)vsi->default_frame_ctx);
 	if (!remote_frame_ctx) {
 		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
 		return -EINVAL;
@@ -1875,8 +1879,12 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 	instance->init_vsi = vsi;
-	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
-						       (u32)vsi->core_vsi);
+	if (mtk_vcodec_fw_get_type(ctx->dev->fw_handler) == VCP)
+		instance->core_vsi =
+			mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, VCODEC_CORE_MEM);
+	else
+		instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
+							       (u32)vsi->core_vsi);
 	if (!instance->core_vsi) {
 		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
 		ret = -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 145958206e38..ac10e0dfefb2 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -18,8 +18,11 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
-					     msg->vpu_inst_addr);
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler, VCODEC_LAT_MEM);
+	else
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
+						     msg->vpu_inst_addr);
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vdec_debug(vpu->ctx, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
-- 
2.46.0


