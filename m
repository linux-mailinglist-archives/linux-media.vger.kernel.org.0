Return-Path: <linux-media+bounces-52645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPh0OYOljWlh5gAAu9opvQ
	(envelope-from <linux-media+bounces-52645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:03:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8312C304
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8012D3068A2F
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 10:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775492F290E;
	Thu, 12 Feb 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IpeCZvYt"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE62EB876;
	Thu, 12 Feb 2026 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890486; cv=none; b=K5BobOCTP2kLMypFFhmrLX1yUJ6ZNjnauzTMwPhw8SbmlwliLPm3nFTEG/0klqzGbGQye4johoekzRgP9bKkBs/02z8nx9DEInrRCOLqovsbj6OR14rgjsS23uuOrVaKEsYiVM3a18l21PmNnB1kXCCKmwnqwI/uPfGnkqwToC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890486; c=relaxed/simple;
	bh=YxBddFIAiOyufs1D8HB83mKX90UW8UgLNgIaptcjE1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdG1dDvD95yRv+wyWJvpedr6Zjz/gJrMYSJtAqSBoCGJOewQ4tNzEXVrDxCf9hzSC5tp/Fv+GoY2WHJZ/xF6WVrdmPWHALdTmOio7VfQ0yo+opIgl5ND5IzpYGWej5ZHjjBkeMd58ovt+kMDU+sEGQzh+imQWtJFa0lw/SwEBvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IpeCZvYt; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c5cf02a607f911f1b7fc4fdb8733b2bc-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=51I3QcKpCcvsa7Shk6exWVHUbaYFbVDIKFZnJTBDzqg=;
	b=IpeCZvYtJtqhzSEHVcU/JyBk87wrkS/2wxPnBc/UR5V9ZPZw+RNhLTH7s+DoHwgICxMfXBGKEv1SPB+d3YExMjFs87/qvA4HVWsdISTLFYJ+2COLUA0fbUtCSmqN39q0byz3ukO7oi3rU/M0cJp9QGZap9JRTHc9dr5x7vsZ3zc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:de592477-7a37-48f8-93d0-7c1804e5ff6b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:608a9ff0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5cf02a607f911f1b7fc4fdb8733b2bc-20260212
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 484320336; Thu, 12 Feb 2026 18:01:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 18:01:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 18:01:14 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <sebastian.fricke@collabora.com>, Tiffany
 Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 3/6] media: mediatek: encoder: Add support for VCP encode process
Date: Thu, 12 Feb 2026 18:01:00 +0800
Message-ID: <20260212100104.11863-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260212100104.11863-1-irui.wang@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
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
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52645-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,mediatek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BE8312C304
X-Rspamd-Action: no action

Adapt the encoder driver to support VCP firmware interface.

Set the encoder driver firmware type to 'VCP'.
Allocate RC buffers using the VCP device.
Send the shared memory address to VCP and map the encoder VSI address
to the CPU address space using the VCP shared memory address.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  6 +++++
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |  1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |  6 +++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  3 +++
 .../vcodec/encoder/venc/venc_common_if.c      | 23 ++++++++++++++-----
 .../mediatek/vcodec/encoder/venc_vpu_if.c     | 14 ++++++++++-
 7 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 0381acceda25..7a504f093bd8 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -105,3 +105,9 @@ int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw)
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
index e7304a7dd3e0..56c26b91651e 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -43,5 +43,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
 int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type);
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
index 6b69ce44d4bb..2859fe78f67d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -500,6 +500,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 
 }
 
+static struct device *mtk_vcodec_vcp_get_fw_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->vcp->vcp_device->dev;
+}
+
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
@@ -508,6 +513,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
 	.release = mtk_vcodec_vcp_release,
+	.get_fw_dev = mtk_vcodec_vcp_get_fw_dev,
 };
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 82b8ff38e8f1..36065c8ad94f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -253,6 +253,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
+					 &rproc_phandle)) {
+		fw_type = VCP;
 	} else {
 		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
index da7cf90bd54b..b28d559285ea 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
@@ -478,8 +478,13 @@ static void venc_free_rc_buf(struct venc_inst *inst,
 {
 	int i;
 	struct device *dev;
+	struct mtk_vcodec_fw *fw = inst->ctx->dev->fw_handler;
+
+	if (mtk_vcodec_fw_get_type(fw) == VCP)
+		dev = mtk_vcodec_fw_get_dev(fw);
+	else
+		dev = &inst->ctx->dev->plat_dev->dev;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
 	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
 
 	for (i = 0; i < core_num; i++)
@@ -528,12 +533,18 @@ static int venc_alloc_rc_buf(struct venc_inst *inst,
 	struct device *dev;
 	void *tmp_va;
 
-	dev = &inst->ctx->dev->plat_dev->dev;
-	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
-		return -ENOMEM;
+	if (mtk_vcodec_fw_get_type(fw) == VCP) {
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
index 7772b8442ebc..0f4693e04a9f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -8,13 +8,23 @@
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
+	if (mtk_vcodec_fw_get_type(fw) == VCP) {
+		pa_start = (u64)fw->vcp->iova_addr;
+		vsi_offset = (msg->vpu_vsi_addr & VSI_OFFSET_MASK) - (pa_start & VSI_OFFSET_MASK);
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, ENCODER_MEM) + vsi_offset;
+	} else {
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(fw, msg->vpu_vsi_addr);
+	}
 
 	/* Firmware version field value is unspecified on MT8173. */
 	if (mtk_vcodec_fw_get_type(fw) == VPU)
@@ -155,6 +165,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	out.base.venc_inst = (unsigned long)vpu;
 	if (MTK_ENC_DRV_IS_COMM(vpu->ctx)) {
 		out.codec_type = vpu->ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP)
+			out.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
 		msg_size = sizeof(struct venc_ap_ipi_msg_init_comm);
 	} else {
 		msg_size = sizeof(struct venc_ap_ipi_msg_init);
-- 
2.45.2


