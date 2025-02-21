Return-Path: <linux-media+bounces-26533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332EA3EB18
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 04:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB393B0A6B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 03:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2231C174A;
	Fri, 21 Feb 2025 03:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EuMUJu88"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F8423A6;
	Fri, 21 Feb 2025 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107431; cv=none; b=FMsfPXRb33SbSdvtj85xRV11PIqfmuC3RrT1SXnvp8FTF2hCX/dk5iPU7RmplHqv3Ck/Urx2ds98lqLCy4S04jRCCBYOWAc4GvIR5xb6xliS3wExrTNjXZ7P6z18ff/7dFGWcBSLOU6zTywWAUbgzX16Cj+TyN46oqJvJ5XwyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107431; c=relaxed/simple;
	bh=SJS7wAQSuNIoeZBnMgNIrS+blk6yQtEX9he7YeM8om0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fu/BOx801LAbrPt3w5uA1V686idzGadoW02GB4YQTLqJysV/rNN3Aewkt7Tv42j1sZz41/fUqsOI9szK23otGGjnLfqreSj9oeN0rX7X9sU9dCmJVNwFgsUD5O3PA5gJ3QS9yKKjRk5efjVcp2ngHiNYKHWCKykduQgHLQQqIIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EuMUJu88; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 64a84ec6f00111ef8eb9c36241bbb6fb-20250221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4oXke/zgIEKNvBa0yjhhdFZGei+gmsGnkj4nzwpXAfg=;
	b=EuMUJu88zVbSkt22cLpGVoIdTyOU9KZ9n09WBuN+uSb2ww2ls6Rbxc54lrUqKhoU5542XBG2SMOrDSmHl7Scjt0JTDVnGFSbbNoMTDhPRvPCdDeBr5hcFnAAtH0+4ozBXo0g4UrT0Vn5iDlcoHFYRHqHUW17qldnJ+/rCxubthg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:8720ed96-252d-4c6c-bf2d-3da90929112e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:039e1229-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 64a84ec6f00111ef8eb9c36241bbb6fb-20250221
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1447793105; Fri, 21 Feb 2025 11:10:24 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 21 Feb 2025 11:10:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 21 Feb 2025 11:10:22 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH 2/2] media: mediatek: encoder: Add support for common driver encode process
Date: Fri, 21 Feb 2025 11:10:04 +0800
Message-ID: <20250221031004.9050-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250221031004.9050-1-irui.wang@mediatek.com>
References: <20250221031004.9050-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Define a boolean variable in the encoder compatible data structure, when
it is set to true, initialize the new encoder dirver interface.
Ensure backward compatibility, define new 'venc_ipi_msg' structure for
communication between the encoder kernel driver and firmware.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  3 ++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |  3 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    | 26 +++++++++++++
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 37 ++++++++++++-------
 4 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0bd85d0fb379..a005ebd48db5 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -16,6 +16,7 @@
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
 #define MTK_ENC_IOVA_IS_34BIT(ctx) ((ctx)->dev->venc_pdata->uses_34bit)
+#define MTK_ENC_DRV_IS_COMM(ctx) (((ctx)->dev->venc_pdata->uses_comm))
 
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
@@ -29,6 +30,7 @@
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
+ * @uses_comm: whether the encoder uses common driver interface
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
@@ -40,6 +42,7 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_output_formats;
 	u8 core_id;
 	bool uses_34bit;
+	bool uses_comm;
 };
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
index e83747b8d69a..05db69306c5b 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
@@ -19,13 +19,14 @@
 int venc_if_init(struct mtk_vcodec_enc_ctx *ctx, unsigned int fourcc)
 {
 	int ret = 0;
+	const bool is_comm = MTK_ENC_DRV_IS_COMM(ctx);
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_VP8:
 		ctx->enc_if = &venc_vp8_if;
 		break;
 	case V4L2_PIX_FMT_H264:
-		ctx->enc_if = &venc_h264_if;
+		ctx->enc_if = is_comm ? &venc_if : &venc_h264_if;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
index bb16d96a7f57..ce3c2c8059fb 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_ipi_msg.h
@@ -45,6 +45,20 @@ struct venc_ap_ipi_msg_init {
 	uint64_t venc_inst;
 };
 
+/**
+ * struct venc_ap_ipi_msg_init_comm - AP to VPU init cmd structure
+ * @base: AP to VPU init cmd structure
+ * @codec_type: encoder type
+ * @reserved: reserved field
+ * @shared_iova: shared iova
+ */
+struct venc_ap_ipi_msg_init_comm {
+	struct venc_ap_ipi_msg_init base;
+	u32 codec_type;
+	u32 reserved;
+	u64 shared_iova;
+};
+
 /**
  * struct venc_ap_ipi_msg_set_param - AP to VPU set_param cmd structure
  * @msg_id:	message id (AP_IPIMSG_XXX_ENC_SET_PARAM)
@@ -175,6 +189,18 @@ struct venc_vpu_ipi_msg_init {
 	uint32_t venc_abi_version;
 };
 
+/**
+ * struct venc_vpu_ipi_msg_init_comm - VPU ack AP init cmd structure
+ * @init_ack: AP init cmd structure
+ * @vpu_vsi_addr: VSI address from VPU
+ * @reserved: reserved field
+ */
+struct venc_vpu_ipi_msg_init_comm {
+	struct venc_vpu_ipi_msg_init init_ack;
+	u32 vpu_vsi_addr;
+	u32 reserved;
+};
+
 /**
  * struct venc_vpu_ipi_msg_set_param - VPU ack AP set_param cmd structure
  * @msg_id:	message id (VPU_IPIMSG_XXX_ENC_SET_PARAM_DONE)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 51bb7ee141b9..537b9955932e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -10,24 +10,25 @@
 
 static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
-	const struct venc_vpu_ipi_msg_init *msg = data;
+	const struct venc_vpu_ipi_msg_init_comm *msg = data;
+	struct mtk_vcodec_fw *fw = vpu->ctx->dev->fw_handler;
 
-	vpu->inst_addr = msg->vpu_inst_addr;
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
-					     msg->vpu_inst_addr);
+	vpu->inst_addr = msg->init_ack.vpu_inst_addr;
+	vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
 
 	/* Firmware version field value is unspecified on MT8173. */
-	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VPU)
+	if (mtk_vcodec_fw_get_type(fw) == VPU)
 		return;
 
 	/* Check firmware version. */
-	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n", msg->venc_abi_version);
-	switch (msg->venc_abi_version) {
+	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n",
+		       msg->init_ack.venc_abi_version);
+	switch (msg->init_ack.venc_abi_version) {
 	case 1:
 		break;
 	default:
 		mtk_venc_err(vpu->ctx, "unhandled firmware version 0x%x\n",
-			     msg->venc_abi_version);
+			     msg->init_ack.venc_abi_version);
 		vpu->failure = 1;
 		break;
 	}
@@ -132,7 +133,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 int vpu_enc_init(struct venc_vpu_inst *vpu)
 {
 	int status;
-	struct venc_ap_ipi_msg_init out;
+	size_t msg_size;
+	struct venc_ap_ipi_msg_init_comm out;
 
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
@@ -149,9 +151,16 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	}
 
 	memset(&out, 0, sizeof(out));
-	out.msg_id = AP_IPIMSG_ENC_INIT;
-	out.venc_inst = (unsigned long)vpu;
-	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
+	out.base.msg_id = AP_IPIMSG_ENC_INIT;
+	out.base.venc_inst = (unsigned long)vpu;
+	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
+		out.codec_type = vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		msg_size = sizeof(struct venc_ap_ipi_msg_init_comm);
+	} else {
+		msg_size = sizeof(struct venc_ap_ipi_msg_init);
+	}
+
+	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
 		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_INIT fail");
 		return -EINVAL;
 	}
@@ -260,7 +269,7 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 		sizeof(struct venc_ap_ipi_msg_enc);
 	struct venc_ap_ipi_msg_enc_ext out;
 
-	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
+	mtk_venc_debug(vpu->ctx, "%s, bs_mode %d ->", __func__, bs_mode);
 
 	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
@@ -305,7 +314,7 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 	struct venc_ap_ipi_msg_enc_ext_34 out;
 	size_t msg_size = sizeof(struct venc_ap_ipi_msg_enc_ext_34);
 
-	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
+	mtk_venc_debug(vpu->ctx, "%s, bs_mode %d ->", __func__, bs_mode);
 
 	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_ENCODE;
-- 
2.46.0


