Return-Path: <linux-media+bounces-54035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMU6AgYKpWky0AUAu9opvQ
	(envelope-from <linux-media+bounces-54035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 04:54:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB21D2CB9
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 04:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD4A73033D09
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 03:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3742F531F;
	Mon,  2 Mar 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rlg8YfLi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55722E62C0;
	Mon,  2 Mar 2026 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772423587; cv=none; b=U1hkKsEy7xlYZDtJLj2dQp2ltbbXwMQeNoWT2FO+f0FvlfFuLY/QiYtAr52GOmyshNdEiulIvBWxXV4UMDKUIdvrON9qQkarOBZPfx1fYzTUGwBd6MM1FmCUKFhXkeqWbqg5mJttmKBCF7tMfTyzKzIzqTfflcl0wzbtHGes5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772423587; c=relaxed/simple;
	bh=JHHQs9FdqIH+WyrNP+5N5vmgttDv7zRBaShxi7JzvbY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOlYX8iy19+uxkQ11EHVxILk+gg00GSDg4Yv0AtAcKfvwZlX4nioIrUz5nJnPeA69WvFRx5XjNvD6FSbKgAQBQfpgorzpvsN3oarnQ624SIH4w0IV/pH6hg4Rz1WDCrc5GS/ogNOO3oXHp8lRH1yJa0wHDruN2QZnaNJMeRhxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Rlg8YfLi; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 48b46ab815eb11f1b7fc4fdb8733b2bc-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ETVfqfmP4dLo67UFVgL8iHJ8qPdamPbjvNHPQneCnRM=;
	b=Rlg8YfLieBEwDh8JZEuaXa7rPGdentIY/ma+jYq0J9rqRaC7XMFDzWiSH3NHxyvEoTnXwAvNO+tXg3K7OTVCrIDXGXcryhKOzyJwyIqhCD50TLnJT6HCOTdxn1e9D0GOcaKwIudX+CqJWkEW3dDePlb5iv5Ez2/TtnJgQJh5q38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:54391d42-26e4-4918-b27d-17bc22e2f06c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:c22825f1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48b46ab815eb11f1b7fc4fdb8733b2bc-20260302
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 974359813; Mon, 02 Mar 2026 11:52:50 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Mar 2026 11:52:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Mar 2026 11:52:48 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 2/6] media: mediatek: encoder: Add support for common firmware interface
Date: Mon, 2 Mar 2026 11:52:39 +0800
Message-ID: <20260302035244.8994-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260302035244.8994-1-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54035-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 7BEB21D2CB9
X-Rspamd-Action: no action

The existing encoder firmware interface implied just one type of codec:
H.264. Future encoders may support additional codecs; however adding
entire sets of interfaces for them is not scalable.

Instead, a new "common" firmware interface is defined for non codec
specific messages. The new messages encapsulate the old ones for
backward compatibility.

This patch adds support for these new messages.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  3 ++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |  3 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    | 26 +++++++++++++++
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 33 ++++++++++++-------
 4 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 53369adc083b..0529564027c4 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -16,6 +16,7 @@
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
 #define MTK_ENC_IOVA_IS_34BIT(ctx) ((ctx)->dev->venc_pdata->uses_34bit)
+#define MTK_ENC_DRV_IS_COMM(ctx) (((ctx)->dev->venc_pdata->uses_common_fw_iface))
 
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
@@ -29,6 +30,7 @@
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
  * @uses_34bit: whether the encoder uses 34-bit iova
+ * @uses_common_fw_iface: whether the encoder uses common driver interface
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
@@ -40,6 +42,7 @@ struct mtk_vcodec_enc_pdata {
 	size_t num_output_formats;
 	u8 core_id;
 	bool uses_34bit;
+	bool uses_common_fw_iface;
 };
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
index e83747b8d69a..f8c9349c18c0 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
@@ -19,13 +19,14 @@
 int venc_if_init(struct mtk_vcodec_enc_ctx *ctx, unsigned int fourcc)
 {
 	int ret = 0;
+	const bool uses_common_fw_iface = MTK_ENC_DRV_IS_COMM(ctx);
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_VP8:
 		ctx->enc_if = &venc_vp8_if;
 		break;
 	case V4L2_PIX_FMT_H264:
-		ctx->enc_if = &venc_h264_if;
+		ctx->enc_if = uses_common_fw_iface ? &venc_if : &venc_h264_if;
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
index 0c825aa7224d..7772b8442ebc 100644
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
@@ -133,7 +134,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 int vpu_enc_init(struct venc_vpu_inst *vpu)
 {
 	int status;
-	struct venc_ap_ipi_msg_init out = { };
+	size_t msg_size;
+	struct venc_ap_ipi_msg_init_comm out = { };
 
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
@@ -149,9 +151,16 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 		return -EINVAL;
 	}
 
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
-- 
2.45.2


