Return-Path: <linux-media+bounces-39885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92288B25FE0
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37C117B504
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DDB2F0680;
	Thu, 14 Aug 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ih5W1sj2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084462ECD3A;
	Thu, 14 Aug 2025 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161823; cv=none; b=FFXj5DByVvqs6VIWehtI+u81QXAAfapaN3hB1vYctu5qgQcCNv8OzfTJ1c3jlaQ9uWPUHrhD1bPwUyXjJbRh4s8Q0rdC6axFPof5ApluGCnggTK6thCCYd00/F3Oj9eWsk51DqP9Zb336ysmg2B9VSUoT+pzT6oQKVl9SeK7Z4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161823; c=relaxed/simple;
	bh=r/FopW1GY0yNRh81U1LfBz1LGx6/Yj8b/lA2c3p9MPM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=av8p+mPxjWJ3ZUWp2mpSd8R/gS5C5/YIP6qPGx/y3K2Zze9pD4dPVCobuvXxoBUCXvF6Ne1tH6LxYEIYhPEFzieTsWmS35lnSRYKS/PANPpBNDV6dcfTT2pIg3ufPHeAiMftj9rll3XMxgdyPj9iNOcrrGYHhnbGSrraWxtAAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ih5W1sj2; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9f80708678ec11f0b33aeb1e7f16c2b6-20250814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gZyA4IFfYMzM4T1onnKApZsysgOBjZcgXNP2qh0vmJ0=;
	b=ih5W1sj23AoJooMgEXB7nNVoPz5VIW6/lTeaZc0LGoPXzGk+3sHtMe+bFEnYWfJEcFHSexYU4L3nFCVHgyqJGMCVudLIR7Ar9YrqZFi8pkY8kclXiIZ28OLrbpIKAmdRxzE/Q7jYPgdx4rcDStM6Nkxh1WttN9TtHMqgCYrcxQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:1f269768-b0ab-417d-aca1-cafb6f8de446,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:25a3edf3-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f80708678ec11f0b33aeb1e7f16c2b6-20250814
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2134086558; Thu, 14 Aug 2025 16:56:53 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 14 Aug 2025 16:56:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 14 Aug 2025 16:56:50 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v3 3/6] media: mediatek: encoder: Add support for VCP encode process
Date: Thu, 14 Aug 2025 16:56:39 +0800
Message-ID: <20250814085642.17343-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250814085642.17343-1-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Irui Wang <irui.wang@mediatek.com>

When encoding by VCP interface, encoder driver need change to VCP path:
Firstly, set encoder driver fw type to 'VCP'. Then, allocate RC buffers
by the VCP device. Finally, send the shared memory address into VCP and
map the encoder vsi address by the VCP shared memory address.

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
index f6b93e1bcbf3..646e3944dd4f 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -432,6 +432,11 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 {
 }
 
+static struct device *mtk_vcodec_vcp_get_fw_dev(struct mtk_vcodec_fw *fw)
+{
+	return fw->vcp->vcp_device->dev;
+}
+
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.load_firmware = mtk_vcodec_vcp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
@@ -440,6 +445,7 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
 	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
 	.ipi_send = mtk_vcodec_vcp_ipi_send,
 	.release = mtk_vcodec_vcp_release,
+	.get_fw_dev = mtk_vcodec_vcp_get_fw_dev,
 };
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index a1e4483abcdb..bb913dfe5f04 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -252,6 +252,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
index 537b9955932e..9a90c2271297 100644
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
2.46.0


