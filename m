Return-Path: <linux-media+bounces-63530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O9VyMDHpH2oZsQAAu9opvQ
	(envelope-from <linux-media+bounces-63530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:43:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F99635CEE
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=MId+0SqE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63530-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63530-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 336F030CBEAC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE374219EB;
	Wed,  3 Jun 2026 08:41:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50B3FF1C1;
	Wed,  3 Jun 2026 08:41:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476077; cv=none; b=DKJDupcUU68BYC2QxLk70JT+rBU+wyrecykPGPrdrrEeqC63N0t5v++QguxtaHLeuMtEGD+aY2SXBdpSOt9oNpgzLV8YjgL/U4GypyaAjyMEflNhiOVHHVP/bknHXd0Hqg3kbjujdg3o+blRHZNrgK95eWF9OE/7u/+lXxEMFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476077; c=relaxed/simple;
	bh=iBkMDbp9x5MlJF6tJuIvcQaSuB3W9WMm2VxYGUAhnRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SYxlDVTR+faHYhNu7yasvWdYU5PJHVIIPwqfFMnSBuOk5/RI42TQj8Cz9ZyijhIQP6SoUeOThBoj9Dy+aLaC/ao+SHnvgo28fUAs1iCiZaWBGaeMBQcr11pI5YTWTBCzDhmzJmwHgp1fvl8xjPJC8jckpnJymaa9P8mBi+/3XrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MId+0SqE; arc=none smtp.client-ip=210.61.82.184
X-UUID: f89062ae5f2711f18dc8c9802ae25ab1-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mYWp/taIIWLlTLiDi0UdP1i4nJMhM660bDQtgNioPAQ=;
	b=MId+0SqERWsGgTWBoJlrQQPEjrzx4of5rCOm2+5vF78b87BIgvH3C7+nqT8oLqZwZkqVgGEQyQBYdZJzOCSQz/BRIhJtI3iSrPrkZe7XlnkeKj6yZnb643RYDcIWVj5e9qcg2O1pTWwN8Vk9ZZF/serc5kr5L6pr2yhWtmRA1Kc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:e277ae1e-5905-4d62-96c1-0c77e69276cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:12b62e8f-2d9b-4560-8147-1122f58e041c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f89062ae5f2711f18dc8c9802ae25ab1-20260603
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 943897548; Wed, 03 Jun 2026 16:41:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:07 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 03/14] media: mediatek: vcodec: add driver to support vcp encoder
Date: Wed, 3 Jun 2026 16:40:33 +0800
Message-ID: <20260603084045.17488-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63530-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,163.com,ideasonboard.com,pengutronix.de,vivo.com,zju.edu.cn,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:kees@kernel.org,m:hverkuil+cisco@kernel.org,m:haoxiang_li2024@163.com,m:fshao@chromium.org,m:wenst@chromium.org,m:laurent.pinchart+renesas@ideasonboard.com,m:sebastian.fricke@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:rongqianfeng@vivo.com,m:jacopo.mondi@ideasonboard.com,m:irui.wang@mediatek.com,m:fanwu01@zju.edu.cn,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:kyrie.wu@mediatek.com,m:sakari.ailus@linux.intel.com,m:tzungbi@kernel.org,m:tfiga@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:hverku
 il@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54F99635CEE

From: Yunfei Dong <yunfei.dong@mediatek.com>

Encoder also need to call vcp interface to communicate with vcp,
add driver to support encoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 50 +++++++++++++++----
 .../vcodec/common/mtk_vcodec_fw_vcp.h         |  1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |  2 +
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
index 2f3bfcd97958..ee3838daf5a7 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -13,6 +13,8 @@
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../decoder/vdec_ipi_msg.h"
+#include "../encoder/mtk_vcodec_enc.h"
+#include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
 
 #define IPI_SEND_TIMEOUT_MS  100U
@@ -226,8 +228,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *b
 	}
 
 	mutex_lock(&vcp->ipi_mutex);
-	feature_id = VDEC_FEATURE_ID;
-	mailbox_id = IPI_OUT_VDEC_1;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VENC_0;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mailbox_id = IPI_OUT_VDEC_1;
+	}
 
 	timeout_jiffies = jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
 	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
@@ -351,10 +358,17 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 
 	vcp_device = fw->vcp->vcp_device;
 
-	feature_id = VDEC_FEATURE_ID;
-	mem_id = VDEC_MEM_ID;
-	mailbox_id = IPI_IN_VDEC_1;
-	ipi_id = VCP_IPI_LAT_DECODER;
+	if (fw->fw_use == ENCODER) {
+		feature_id = VENC_FEATURE_ID;
+		mem_id = VENC_MEM_ID;
+		mailbox_id = IPI_IN_VENC_0;
+		ipi_id = VCP_IPI_ENCODER;
+	} else {
+		feature_id = VDEC_FEATURE_ID;
+		mem_id = VDEC_MEM_ID;
+		mailbox_id = IPI_IN_VDEC_1;
+		ipi_id = VCP_IPI_LAT_DECODER;
+	}
 
 	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
 					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
@@ -383,6 +397,20 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
 	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
 	mutex_init(&fw->vcp->ipi_mutex);
 
+	if (fw->fw_use == ENCODER) {
+		kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread");
+
+		fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
+		fw->vcp->vsi_size = vcp_device->ops->vcp_get_mem_size(mem_id);
+		fw->vcp->iova_addr = vcp_device->ops->vcp_get_mem_iova(mem_id);
+
+		dev_dbg(&fw->pdev->dev, "enc vcp init done => va: %p size:0x%x iova:%pad.\n",
+			fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+		init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_ENCODER]);
+		return 0;
+	}
+
 	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread");
 
 	fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
@@ -438,8 +466,8 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
 	if (!fw->vcp->is_register_done)
 		return;
 
-	feature_id = VDEC_FEATURE_ID;
-	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATURE_ID);
+	feature_id = fw->fw_use == ENCODER ? VENC_FEATURE_ID : VDEC_FEATURE_ID;
+	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, feature_id);
 	if (ret < 0) {
 		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
 		return;
@@ -464,7 +492,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use
 	struct mtk_vcodec_fw *fw;
 	int i;
 
-	if (fw_use == DECODER) {
+	if (fw_use == ENCODER) {
+		struct mtk_vcodec_enc_dev *enc_dev = priv;
+
+		plat_dev = enc_dev->plat_dev;
+	} else if (fw_use == DECODER) {
 		struct mtk_vcodec_dec_dev *dec_dev = priv;
 
 		plat_dev = dec_dev->plat_dev;
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
index 1072c37078f4..acf8f3e87bd0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -16,6 +16,7 @@ typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
 
 /* enum mtk_vcp_ipi_index - index used to separate different hardware */
 enum mtk_vcp_ipi_index {
+	VCP_IPI_ENCODER,
 	VCP_IPI_LAT_DECODER,
 	VCP_IPI_CORE_DECODER,
 	VCP_IPI_MAX,
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 0d4e94463685..48cb5dded70a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -26,7 +26,6 @@
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
-#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
index 908d8179b2d2..84156c102d8d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
@@ -23,6 +23,8 @@
 #define MTK_VENC_IRQ_STATUS_OFFSET	0x05C
 #define MTK_VENC_IRQ_ACK_OFFSET	0x060
 
+#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
+
 /**
  * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
-- 
2.45.2


