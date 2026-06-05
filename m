Return-Path: <linux-media+bounces-63892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KnH3OrKZImr8agEAu9opvQ
	(envelope-from <linux-media+bounces-63892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:41:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CD646F22
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=OTqc2ZtO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63892-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63892-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C449D30640B2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81053E2AD7;
	Fri,  5 Jun 2026 09:35:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAB3D3D18;
	Fri,  5 Jun 2026 09:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652148; cv=none; b=M8HuWBTNmPdAIOryHtA/RPD8kyJreMJtWpUtEL0uziloj+LiCWZALzLfDykPFmjIVQ1kB03SoDLoJGx38wKMaT/CibR5ZvNHNL2sYI4RFsB3w5iYZDNcXYpdq8Nl4/Zi2VZC/tjG1OBuf5qePemjj2XtO2K+RYXZoyquAmqw+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652148; c=relaxed/simple;
	bh=Pqx5eO8rF58Heohy3z4MhpDjYOArsG6mtH9O2jWCEv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFrD/36twdLH41unvIylswxTvGUaBEntdVF8qTvDgeKPe+LF+igtaIevSRf+pG10qqY2lqWvx2cZv7JWYFYnKu2Z2w3z31OV9UycKGYTTT45MZ5syA7WysXZqKID/+DjETkxImVvZPlNFOFI7p79/HzBSBX69X3yzZByTAu2D6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OTqc2ZtO; arc=none smtp.client-ip=60.244.123.138
X-UUID: ea3bb3a260c111f1b1788b6acf885367-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gMBcEN30ojGzUtdlCizm9plqzS0kBuJ8iFs/YALmZwE=;
	b=OTqc2ZtOfPpeFnTPfbBwi+AbLxnR/fjEJK3XeS9hTB+5Pgbuf5R9j4xyoOz//UYvXFfJcJ28XpdgQwht3AAfEFC0QacMoePU/2Y3woJnGtG2dVTLEPgiFOs8io/f5AenWAkAsnXHUwAKvHuMgOLE3ZdaeyUe3ZAZVfYCxOq17q8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:e0200b16-74a8-4933-8054-e44eaacfa7d9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:c9aa8503-5b7c-4de7-bc39-cc187eea3c57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ea3bb3a260c111f1b1788b6acf885367-20260605
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1195449030; Fri, 05 Jun 2026 17:35:39 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 17:35:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 17:35:37 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v7 5/6] media: mediatek: encoder: Add support for VCP encode process
Date: Fri, 5 Jun 2026 17:35:17 +0800
Message-ID: <20260605093519.13695-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260605093519.13695-1-irui.wang@mediatek.com>
References: <20260605093519.13695-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63892-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh+dt@kernel.org,m:matthias.bgg@gmail.com,m:krzk+dt@kernel.org,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:tiffany.lin@mediatek.com,m:kyrie.wu@mediatek.com,m:yunfei.dong@mediatek.com,m:maoguang.meng@mediatek.com,m:longfei.wang@mediatek.com,m:irui.wang@mediatek.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:robh@kernel.org,m:matthiasbgg@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0CD646F22

Adapt the encoder driver to support VCP firmware interface.

Use platform data fw_type to identify VCP firmware and perform
VCP-specific operations:
- Allocate RC buffers using the VCP device
- Send shared memory address to VCP firmware
- Map the encoder VSI address to the CPU address space using the
VCP shared memory address.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  6 +++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |  1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |  6 +++++
 .../vcodec/encoder/venc/venc_common_if.c      | 22 ++++++++++++++-----
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 16 ++++++++++++--
 6 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 9df64200d933..7619ccd1f538 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -90,3 +90,9 @@ int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
 	return fw->type;
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_type);
+
+struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_fw_dev(fw);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_dev);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 142e2e87905c..8ff6fcc114e3 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -42,5 +42,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
+struct device *mtk_vcodec_fw_get_dev(struct mtk_vcodec_fw *fw);
 
 #endif /* _MTK_VCODEC_FW_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
index 0a2a9b010244..710c83c871f4 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
@@ -29,6 +29,7 @@ struct mtk_vcodec_fw_ops {
 	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
 			unsigned int len, unsigned int wait);
 	void (*release)(struct mtk_vcodec_fw *fw);
+	struct device *(*get_fw_dev)(struct mtk_vcodec_fw *fw);
 };
 
 #if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 061a61bda33f..72627fef0ac5 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -494,6 +494,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 	fw->vcp->is_register_done = false;
 }
 
+static struct device *mtk_vcodec_vcp_get_fw_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->vcp->vcp_device->dev;
+}
+
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
@@ -501,6 +506,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
 	.release = mtk_vcodec_vcp_release,
+	.get_fw_dev = mtk_vcodec_vcp_get_fw_dev,
 };
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
index 0efb13aef8d6..5ee138f0b2e7 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
@@ -481,7 +481,11 @@ static void venc_free_rc_buf(struct venc_inst *inst,
 	int i;
 	struct device *dev;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
+	if (inst->ctx->dev->venc_pdata->fw_type == VCP)
+		dev = mtk_vcodec_fw_get_dev(inst->ctx->dev->fw_handler);
+	else
+		dev = &inst->ctx->dev->plat_dev->dev;
+
 	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
 
 	for (i = 0; i < core_num; i++)
@@ -530,12 +534,18 @@ static int venc_alloc_rc_buf(struct venc_inst *inst,
 	struct device *dev;
 	void *tmp_va;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
-	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
-		return -ENOMEM;
+	if (inst->ctx->dev->venc_pdata->fw_type == VCP) {
+		dev = mtk_vcodec_fw_get_dev(fw);
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
+	} else {
+		dev = &inst->ctx->dev->plat_dev->dev;
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
 
-	tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
-	memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+		tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
+		memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+	}
 
 	for (i = 0; i < core_num; i++) {
 		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 7772b8442ebc..1da9043fd4f6 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -8,16 +8,26 @@
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
+#define VSI_OFFSET_MASK 0x0FFFFFFF
+
 static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_init_comm *msg = data;
 	struct mtk_vcodec_fw *fw = vpu->ctx->dev->fw_handler;
+	u64 pa_start, vsi_offset;
 
 	vpu->inst_addr = msg->init_ack.vpu_inst_addr;
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, vpu->inst_addr);
+
+	if (vpu->ctx->dev->venc_pdata->fw_type == VCP) {
+		pa_start = (u64)fw->vcp->iova_addr;
+		vsi_offset = (msg->vpu_vsi_addr & VSI_OFFSET_MASK) - (pa_start & VSI_OFFSET_MASK);
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, ENCODER_MEM) + vsi_offset;
+	} else {
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, msg->vpu_vsi_addr);
+	}
 
 	/* Firmware version field value is unspecified on MT8173. */
-	if (mtk_vcodec_fw_get_type(fw) == VPU)
+	if (vpu->ctx->dev->venc_pdata->fw_type == VPU)
 		return;
 
 	/* Check firmware version. */
@@ -155,6 +165,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	out.base.venc_inst = (unsigned long)vpu;
 	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
 		out.codec_type = vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		if (vpu->ctx->dev->venc_pdata->fw_type == VCP)
+			out.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
 		msg_size = sizeof(struct venc_ap_ipi_msg_init_comm);
 	} else {
 		msg_size = sizeof(struct venc_ap_ipi_msg_init);
-- 
2.45.2


