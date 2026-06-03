Return-Path: <linux-media+bounces-63531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZYFPOj/pH2ocsQAAu9opvQ
	(envelope-from <linux-media+bounces-63531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:43:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529F635CF9
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:43:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=hCjBC2nz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63531-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63531-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D22A630D95F2
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A704403EA0;
	Wed,  3 Jun 2026 08:41:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5A42EED9;
	Wed,  3 Jun 2026 08:41:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476078; cv=none; b=a4re0OMGX4x0kIHwlPP2S4qrfaWdNzAE6tgNuzmGSRg+oRWEN5ia5enF62BP5U8+fiCigbf0uadyIMVHu1V6QOdCx8nv91B3b0688MDBokKNcqiRfA2t9poz0fr0RtRRBSfXzZWgV7UpxE8WXt2lCkZgj8tTXxr+Ik4cBBnRh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476078; c=relaxed/simple;
	bh=/pyT38IRfMNZLse5aWqgdpuptNwLmVqTIVUNE78mdlY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H1KSiqzEjOsW0UjrgIUyGNr9ycrm0ZX8APvDHUE4mKsdbxeRyC/llDXyzi9u+O3YgogqQt6ELP2SRJkS497SwE28MOtfprjqryVEZxfrLiem0y1AcKBI+DYuwENWR9B2VoS7m0XyQuEW0fYf8F9TGbyFZssPgqo6oOjLxCJgimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hCjBC2nz; arc=none smtp.client-ip=60.244.123.138
X-UUID: f778fa665f2711f1b1788b6acf885367-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WAQOCwKDtConqlF28eO19THqzpOzyQBZKFXRM+Jc604=;
	b=hCjBC2nzqZBaQnbNUk1VKsC84dY0UuscpPQHEOnBpBinmNWFs28rB1j5nGSFxzrothO/qFHpFaeMaJmn6NGcW9w0BBjePwInRxLKysjFip7WKraN+zDUNY/JC2F74Qj40U9PfA9TCXAf6jnvZuvUeEdrAUEJn+3p/iJCwty1iQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:fad2d11c-0265-42d5-bb22-b9fe2e94704b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:35180a50-23b6-41e0-a310-51c498ab6908,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f778fa665f2711f1b1788b6acf885367-20260603
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1538194143; Wed, 03 Jun 2026 16:41:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:05 +0800
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
Subject: [PATCH v5 02/14] media: mediatek: vcodec: add driver to support vcp
Date: Wed, 3 Jun 2026 16:40:32 +0800
Message-ID: <20260603084045.17488-3-kyrie.wu@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63531-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7529F635CF9

From: Yunfei Dong <yunfei.dong@mediatek.com>

The processor is changed from scp to vcp in mt8196 platform.
Adding new firmware interface to communicate kernel with vcp
for the communication method is changed.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  26 +-
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_scp.c         |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 505 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 142 +++++
 .../vcodec/common/mtk_vcodec_fw_vpu.c         |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   3 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   2 +
 12 files changed, 691 insertions(+), 13 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index bc8292232530..d23dad5c78ce 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MEDIATEK_VCODEC_VCP
+	bool
+
 config VIDEO_MEDIATEK_VCODEC_SCP
 	bool
 
@@ -21,6 +24,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
 	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
+	select VIDEO_MEDIATEK_VCODEC_VCP if MTK_VCP_RPROC
 	select V4L2_H264
 	select V4L2_VP9
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/platform/mediatek/vcodec/common/Makefile b/drivers/media/platform/mediatek/vcodec/common/Makefile
index d0479914dfb3..2f68692e8c98 100644
--- a/drivers/media/platform/mediatek/vcodec/common/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/common/Makefile
@@ -14,6 +14,10 @@ ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
 mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
 endif
 
+ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP),)
+mtk-vcodec-common-y += mtk_vcodec_fw_vcp.o
+endif
+
 ifneq ($(CONFIG_DEBUG_FS),)
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dbgfs.o
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 08949b08fbc6..64977bcd6abd 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -3,26 +3,26 @@
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_fw_vcp.h"
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
 					   enum mtk_vcodec_fw_use fw_use)
 {
-	struct platform_device *plat_dev;
+	if (fw_use == ENCODER) {
+		struct mtk_vcodec_enc_dev *enc_dev = priv;
 
-	if (fw_use == ENCODER)
-		plat_dev = ((struct mtk_vcodec_enc_dev *)priv)->plat_dev;
-	else
-		plat_dev = ((struct mtk_vcodec_dec_dev *)priv)->plat_dev;
+		return enc_dev->fw_init(priv, fw_use);
+	}
+
+	if (fw_use == DECODER) {
+		struct mtk_vcodec_dec_dev *dec_dev = priv;
 
-	switch (type) {
-	case VPU:
-		return mtk_vcodec_fw_vpu_init(priv, fw_use);
-	case SCP:
-		return mtk_vcodec_fw_scp_init(priv, fw_use);
-	default:
-		dev_err(&plat_dev->dev, "Invalid vcodec fw type");
-		return ERR_PTR(-EINVAL);
+		return dec_dev->fw_init(priv, fw_use);
 	}
+
+	pr_err("Error in selecting firmware, fw_use is not set");
+
+	return ERR_PTR(-EINVAL);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
index 99603accd82e..0a2a9b010244 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_priv.h
@@ -4,6 +4,7 @@
 #define _MTK_VCODEC_FW_PRIV_H_
 
 #include "mtk_vcodec_fw.h"
+#include "mtk_vcodec_fw_vcp.h"
 
 struct mtk_vcodec_dec_dev;
 struct mtk_vcodec_enc_dev;
@@ -13,6 +14,7 @@ struct mtk_vcodec_fw {
 	const struct mtk_vcodec_fw_ops *ops;
 	struct platform_device *pdev;
 	struct mtk_scp *scp;
+	struct mtk_vcp *vcp;
 	enum mtk_vcodec_fw_use fw_use;
 };
 
@@ -49,4 +51,14 @@ mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 }
 #endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
 
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VCP)
+struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use);
+#else
+static inline struct mtk_vcodec_fw *
+mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VCP */
+
 #endif /* _MTK_VCODEC_FW_PRIV_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index 1b0bc47355c0..1aad5c3ef990 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -90,3 +90,4 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 
 	return fw;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_scp_init);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
new file mode 100644
index 000000000000..2f3bfcd97958
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/remoteproc/mtk_vcp_public.h>
+#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
+
+#include "../decoder/mtk_vcodec_dec_drv.h"
+#include "../decoder/vdec_ipi_msg.h"
+#include "mtk_vcodec_fw_priv.h"
+
+#define IPI_SEND_TIMEOUT_MS  100U
+#define IPI_TIMEOUT_MS       100U
+
+#define VCP_IPI_HEADER_SIZE (sizeof(u32) * 2)
+#define VCP_IPI_ALIGN (4)
+
+static struct mutex *mtk_vcodec_vcp_get_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	return &vcp->ipi_desc[ipi_id].lock;
+}
+
+static void mtk_vcodec_vcp_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	struct mutex *lock = mtk_vcodec_vcp_get_ipi_lock(vcp, ipi_id);
+
+	if (!lock)
+		return;
+
+	mutex_lock(lock);
+}
+
+static void mtk_vcodec_vcp_ipi_unlock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	struct mutex *lock = mtk_vcodec_vcp_get_ipi_lock(vcp, ipi_id);
+
+	if (!lock)
+		return;
+
+	lockdep_assert_held(lock);
+	mutex_unlock(lock);
+}
+
+static spinlock_t *mtk_vcodec_vcp_get_msg_queue_lock(struct mtk_vcodec_fw *fw)
+{
+	return &fw->vcp->msg_queue.lock;
+}
+
+static void mtk_vcodec_vcp_msq_queue_lock(struct mtk_vcodec_fw *fw, unsigned long *flags)
+{
+	spinlock_t *lock = mtk_vcodec_vcp_get_msg_queue_lock(fw);
+
+	if (!lock)
+		return;
+
+	spin_lock_irqsave(lock, *flags);
+}
+
+static void mtk_vcodec_vcp_msq_queue_unlock(struct mtk_vcodec_fw *fw, unsigned long *flags)
+{
+	spinlock_t *lock = mtk_vcodec_vcp_get_msg_queue_lock(fw);
+
+	if (!lock)
+		return;
+
+	spin_unlock_irqrestore(lock, *flags);
+}
+
+static int mtk_vcodec_vcp_notifier(struct notifier_block *nb, unsigned long event, void *ptr)
+{
+	struct mtk_vcp *vcp = container_of(nb, struct mtk_vcp, vcp_notify);
+
+	switch (event) {
+	case VCP_EVENT_SUSPEND:
+	case VCP_EVENT_STOP:
+		dev_dbg(&vcp->pdev->dev, "vcp notifier suspend");
+		break;
+	case VCP_EVENT_READY:
+	case VCP_EVENT_RESUME:
+		dev_dbg(&vcp->pdev->dev, "vcp notifier ready");
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static void mtk_vcodec_vcp_free_msg_node(struct mtk_vcodec_fw *fw,
+					 struct mtk_vcp_msg_node *msg_node)
+{
+	unsigned long flags;
+
+	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
+	list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
+	mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+}
+
+static int mtk_vcodec_vcp_ipi_register(struct mtk_vcp *vcp, u32 ipi_id, vcp_ipi_handler_t handler,
+				       void *priv)
+{
+	if (!vcp)
+		return -EPROBE_DEFER;
+
+	if (WARN_ON(ipi_id >= VCP_IPI_MAX) || WARN_ON(!handler))
+		return -EINVAL;
+
+	mtk_vcodec_vcp_ipi_lock(vcp, ipi_id);
+	vcp->ipi_desc[ipi_id].handler = handler;
+	vcp->ipi_desc[ipi_id].priv = priv;
+	mtk_vcodec_vcp_ipi_unlock(vcp, ipi_id);
+
+	return 0;
+}
+
+static int mtk_vcodec_vcp_msg_process_thread(void *arg)
+{
+	struct mtk_vcodec_fw *fw = arg;
+	struct vdec_vpu_ipi_ack *msg = NULL;
+	struct mtk_vcp_share_obj *obj;
+	struct mtk_vcp_msg_node *msg_node;
+	vcp_ipi_handler_t handler;
+	unsigned long flags;
+	int ret = 0;
+
+	do {
+		ret = wait_event_interruptible(fw->vcp->msg_queue.wq,
+					       atomic_read(&fw->vcp->msg_queue.cnt) > 0);
+		if (ret < 0) {
+			dev_err(&fw->pdev->dev, "wait msg queue ack timeout %d %d\n",
+				ret, atomic_read(&fw->vcp->msg_queue.cnt));
+			continue;
+		}
+
+		mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
+		msg_node = list_entry(fw->vcp->msg_queue.msg_list.next,
+				      struct mtk_vcp_msg_node, list);
+		list_del(&msg_node->list);
+		atomic_dec(&fw->vcp->msg_queue.cnt);
+		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+
+		obj = &msg_node->ipi_data;
+		msg = (struct vdec_vpu_ipi_ack *)obj->share_buf;
+
+		if (!msg->ap_inst_addr) {
+			dev_err(&fw->pdev->dev, "invalid message address\n");
+			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+			continue;
+		}
+
+		dev_dbg(&fw->pdev->dev, "msg ack id %d len %d msg_id 0x%x\n", obj->id, obj->len,
+			msg->msg_id);
+
+		mtk_vcodec_vcp_ipi_lock(fw->vcp, obj->id);
+		handler = fw->vcp->ipi_desc[obj->id].handler;
+		if (!handler) {
+			dev_err(&fw->pdev->dev, "invalid ack ipi handler id = %d\n", obj->id);
+			mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
+			mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+			return -EINVAL;
+		}
+
+		handler(msg, obj->len, fw->vcp->ipi_desc[obj->id].priv);
+		mtk_vcodec_vcp_ipi_unlock(fw->vcp, obj->id);
+
+		fw->vcp->msg_signaled[obj->id] = true;
+		wake_up(&fw->vcp->msg_wq[obj->id]);
+
+		mtk_vcodec_vcp_free_msg_node(fw, msg_node);
+	} while (!kthread_should_stop());
+
+	return ret;
+}
+
+static int mtk_vcodec_vcp_msg_ack_isr(unsigned int id, void *prdata, void *data, unsigned int len)
+{
+	struct mtk_vcodec_fw *fw = prdata;
+	struct mtk_vcp_msg_queue *msg_queue = &fw->vcp->msg_queue;
+	struct mtk_vcp_msg_node *msg_node;
+	struct vdec_vpu_ipi_ack *msg = NULL;
+	struct mtk_vcp_share_obj *obj = data;
+	unsigned long flags;
+
+	msg = (struct vdec_vpu_ipi_ack *)obj->share_buf;
+
+	mtk_vcodec_vcp_msq_queue_lock(fw, &flags);
+	if (!list_empty(&msg_queue->node_list)) {
+		msg_node = list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_node, list);
+
+		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));
+		list_move_tail(&msg_node->list, &msg_queue->msg_list);
+		atomic_inc(&msg_queue->cnt);
+		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+
+		dev_dbg(&fw->pdev->dev, "push ipi_id %x msg_id %x, msg cnt %d\n",
+			obj->id, msg->msg_id, atomic_read(&msg_queue->cnt));
+
+		wake_up(&msg_queue->wq);
+	} else {
+		mtk_vcodec_vcp_msq_queue_unlock(fw, &flags);
+		dev_err(&fw->pdev->dev, "no free nodes in msg queue\n");
+	}
+
+	return 0;
+}
+
+static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				       unsigned int len, unsigned int wait)
+{
+	struct mtk_vcp *vcp = fw->vcp;
+	struct mtk_vcp_device *vcp_device = vcp->vcp_device;
+	bool *msg_signaled = &vcp->msg_signaled[id];
+	wait_queue_head_t *msg_wq = &vcp->msg_wq[id];
+	int ret, ipi_size, feature_id, mailbox_id, retry_cnt = 0;
+	unsigned long timeout_jiffies = 0;
+	struct mtk_vcp_share_obj obj = {0};
+	unsigned int *data;
+
+	if (!vcp_device) {
+		dev_dbg(&fw->pdev->dev, "vcp device is null\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&vcp->ipi_mutex);
+	feature_id = VDEC_FEATURE_ID;
+	mailbox_id = IPI_OUT_VDEC_1;
+
+	timeout_jiffies = jiffies + msecs_to_jiffies(VCP_SYNC_TIMEOUT_MS);
+	while (!vcp_device->ops->vcp_is_ready(feature_id)) {
+		if (time_after(jiffies, timeout_jiffies)) {
+			vcp->ipi_id_ack[id] = -EINVAL;
+			ret = -EINVAL;
+			goto error;
+		}
+		mdelay(1);
+	}
+
+	if (len > VCP_SHARE_BUF_SIZE) {
+		vcp->ipi_id_ack[id] = -EINVAL;
+		ret = -EINVAL;
+		goto error;
+	}
+
+	obj.id = id;
+	obj.len = len;
+	memcpy(obj.share_buf, buf, len);
+
+	ipi_size = round_up(VCP_IPI_HEADER_SIZE + len, VCP_IPI_ALIGN);
+	data = (unsigned int *)obj.share_buf;
+	dev_dbg(&fw->pdev->dev, "vcp send message: id %d len %d data 0x%x\n",
+		obj.id, obj.len, data[0]);
+
+	ret = mtk_vcp_ipc_send(vcp_get_ipidev(vcp_device), mailbox_id, &obj, ipi_size);
+	if (ret != IPI_ACTION_DONE) {
+		vcp->ipi_id_ack[id] = -EIO;
+		ret = -EIO;
+		goto error;
+	}
+
+wait_ack:
+	/* wait for VCP's ACK */
+	ret = wait_event_timeout(*msg_wq, *msg_signaled, msecs_to_jiffies(IPI_TIMEOUT_MS));
+	if (!ret || retry_cnt > 5) {
+		vcp->ipi_id_ack[id] = VCODEC_IPI_MSG_STATUS_FAIL;
+		dev_err(&fw->pdev->dev, "wait ipi ack timeout! %d %d\n", ret, vcp->ipi_id_ack[id]);
+	} else if (ret == -ERESTARTSYS) {
+		dev_err(&fw->pdev->dev, "wait ipi ack err (%d)\n", vcp->ipi_id_ack[id]);
+		retry_cnt++;
+		goto wait_ack;
+	} else if (ret < 0) {
+		dev_err(&fw->pdev->dev, "wait ipi ack fail ret %d %d\n", ret, vcp->ipi_id_ack[id]);
+		vcp->ipi_id_ack[id] = VCODEC_IPI_MSG_STATUS_FAIL;
+	}
+
+	dev_dbg(&fw->pdev->dev, "receive message: id %d len %d data 0x%x\n",
+		obj.id, obj.len, data[0]);
+
+	*msg_signaled = false;
+	mutex_unlock(&vcp->ipi_mutex);
+
+	return vcp->ipi_id_ack[id];
+
+error:
+	mutex_unlock(&vcp->ipi_mutex);
+	dev_err(&fw->pdev->dev, "send msg error type:%d msg:%d > %d ret:%d\n", fw->type, len,
+		VCP_SHARE_BUF_SIZE, ret);
+
+	return ret;
+}
+
+static int check_vcp_loaded(struct mtk_vcodec_fw *fw)
+{
+	struct device *dev = &fw->pdev->dev;
+	struct device_driver *drv;
+
+	drv = driver_find("mtk-vcp", &platform_bus_type);
+	if (!drv) {
+		dev_err(dev, "find mtk-vcp driver failed, need to reload.");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
+{
+	struct device *dev = &fw->pdev->dev;
+	int retry = 0, retry_cnt = 10000;
+	phandle vcp_phandle;
+
+	while (try_then_request_module(check_vcp_loaded(fw), "mtk-vcp")) {
+		if (++retry > retry_cnt) {
+			dev_err(dev, "failed to load mtk-vcp module");
+			return -EPROBE_DEFER;
+		}
+		usleep_range(1000, 2000);
+	}
+
+	if (of_property_read_u32(dev->of_node, "mediatek,vcp", &vcp_phandle)) {
+		dev_err(dev, "can't get vcp handle.\n");
+		return -ENODEV;
+	}
+
+	fw->vcp->vcp_device = mtk_vcp_get_by_phandle(vcp_phandle);
+	if (!fw->vcp->vcp_device) {
+		dev_err(dev, "get vcp device failed\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int mtk_vcodec_vcp_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	struct mtk_vcp_device *vcp_device;
+	int ret, feature_id, mem_id, mailbox_id, ipi_id;
+
+	if (fw->vcp->is_init_done) {
+		dev_dbg(&fw->pdev->dev, "vcp has already been initialized done.\n");
+		return 0;
+	}
+
+	if (mtk_vcodec_vcp_get_vcp_device(fw) < 0) {
+		dev_err(&fw->pdev->dev, "vcp device is null.\n");
+		return -EINVAL;
+	}
+
+	vcp_device = fw->vcp->vcp_device;
+
+	feature_id = VDEC_FEATURE_ID;
+	mem_id = VDEC_MEM_ID;
+	mailbox_id = IPI_IN_VDEC_1;
+	ipi_id = VCP_IPI_LAT_DECODER;
+
+	ret = mtk_vcp_mbox_ipc_register(vcp_get_ipidev(vcp_device), mailbox_id,
+					mtk_vcodec_vcp_msg_ack_isr, fw, &fw->vcp->share_data);
+	if (ret) {
+		dev_dbg(&fw->pdev->dev, "ipi register fail %d %d %d %d\n", ret, feature_id,
+			mem_id, mailbox_id);
+		return -EINVAL;
+	}
+
+	fw->vcp->vcp_notify.notifier_call = mtk_vcodec_vcp_notifier;
+	fw->vcp->vcp_notify.priority = 1;
+	vcp_device->ops->vcp_register_notify(feature_id, &fw->vcp->vcp_notify);
+
+	if (!fw->vcp->is_register_done) {
+		ret = vcp_device->ops->vcp_register_feature(vcp_device, feature_id);
+		if (ret < 0) {
+			dev_err(&fw->pdev->dev, "%d register to vcp fail(%d)\n", feature_id, ret);
+			return -EINVAL;
+		}
+
+		fw->vcp->is_register_done = true;
+	}
+
+	fw->vcp->is_init_done = true;
+
+	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
+	mutex_init(&fw->vcp->ipi_mutex);
+
+	kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_vdec_msq_thread");
+
+	fw->vcp->vsi_addr = vcp_device->ops->vcp_get_mem_virt(mem_id);
+	fw->vcp->vsi_core_addr = fw->vcp->vsi_addr + VCODEC_VSI_LEN;
+	fw->vcp->vsi_size = vcp_device->ops->vcp_get_mem_size(mem_id);
+	fw->vcp->iova_addr = vcp_device->ops->vcp_get_mem_iova(mem_id);
+
+	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_LAT_DECODER]);
+	init_waitqueue_head(&fw->vcp->msg_wq[VCP_IPI_CORE_DECODER]);
+
+	dev_dbg(&fw->pdev->dev, "vdec vcp init done => va: %p size:0x%x iova:%p.\n",
+		fw->vcp->vsi_addr, fw->vcp->vsi_size, &fw->vcp->iova_addr);
+
+	return 0;
+}
+
+static unsigned int mtk_vcodec_vcp_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return MTK_VDEC_FORMAT_MM21 | MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FORMAT_VP9_FRAME |
+	       MTK_VDEC_FORMAT_AV1_FRAME | MTK_VDEC_FORMAT_HEVC_FRAME |
+	       MTK_VDEC_IS_SUPPORT_10BIT | MTK_VDEC_IS_SUPPORT_EXT;
+}
+
+static void *mtk_vcodec_vcp_dm_addr(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr)
+{
+	return NULL;
+}
+
+static int mtk_vcodec_vcp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+					   mtk_vcodec_ipi_handler handler,
+					   const char *name, void *priv)
+{
+	return mtk_vcodec_vcp_ipi_register(fw->vcp, id, handler, priv);
+}
+
+static int mtk_vcodec_vcp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				   unsigned int len, unsigned int wait)
+{
+	return mtk_vcodec_vcp_msg_ipi_send(fw, id, buf, len, wait);
+}
+
+static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
+{
+	struct mtk_vcp_device *vcp_device = fw->vcp->vcp_device;
+	struct device *dev = &fw->pdev->dev;
+	int ret, feature_id;
+
+	if (!fw->vcp->vcp_device) {
+		dev_err(dev, "vcp device is null\n");
+		return;
+	}
+
+	if (!fw->vcp->is_register_done)
+		return;
+
+	feature_id = VDEC_FEATURE_ID;
+	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATURE_ID);
+	if (ret < 0) {
+		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
+		return;
+	}
+
+	fw->vcp->is_register_done = false;
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_vcp_msg = {
+	.load_firmware = mtk_vcodec_vcp_load_firmware,
+	.get_vdec_capa = mtk_vcodec_vcp_get_vdec_capa,
+	.map_dm_addr = mtk_vcodec_vcp_dm_addr,
+	.ipi_register = mtk_vcodec_vcp_set_ipi_register,
+	.ipi_send = mtk_vcodec_vcp_ipi_send,
+	.release = mtk_vcodec_vcp_release,
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_vcp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
+{
+	struct mtk_vcp_msg_node *msg_node;
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_fw *fw;
+	int i;
+
+	if (fw_use == DECODER) {
+		struct mtk_vcodec_dec_dev *dec_dev = priv;
+
+		plat_dev = dec_dev->plat_dev;
+	} else {
+		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
+		return ERR_PTR(-EINVAL);
+	}
+
+	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
+
+	fw->type = VCP;
+	fw->pdev = plat_dev;
+	fw->fw_use = fw_use;
+	fw->ops = &mtk_vcodec_vcp_msg;
+	fw->vcp = devm_kzalloc(&plat_dev->dev, sizeof(*fw->vcp), GFP_KERNEL);
+	if (!fw->vcp)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&fw->vcp->msg_queue.msg_list);
+	INIT_LIST_HEAD(&fw->vcp->msg_queue.node_list);
+	spin_lock_init(&fw->vcp->msg_queue.lock);
+	init_waitqueue_head(&fw->vcp->msg_queue.wq);
+	atomic_set(&fw->vcp->msg_queue.cnt, 0);
+	fw->vcp->pdev = plat_dev;
+
+	for (i = 0; i < VCP_MAX_MQ_NODE_CNT; i++) {
+		msg_node = devm_kzalloc(&plat_dev->dev, sizeof(*msg_node), GFP_KERNEL);
+		if (!msg_node)
+			return ERR_PTR(-ENOMEM);
+
+		list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
+	}
+
+	return fw;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_vcp_init);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
new file mode 100644
index 000000000000..1072c37078f4
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _MTK_VCODEC_FW_VCP_H_
+#define _MTK_VCODEC_FW_VCP_H_
+
+typedef void (*vcp_ipi_handler_t) (void *data, unsigned int len, void *priv);
+
+#define VCP_MAX_MQ_NODE_CNT  6
+#define VCP_SHARE_BUF_SIZE 64
+
+#define VCODEC_VSI_LEN (0x2000)
+
+/* enum mtk_vcp_ipi_index - index used to separate different hardware */
+enum mtk_vcp_ipi_index {
+	VCP_IPI_LAT_DECODER,
+	VCP_IPI_CORE_DECODER,
+	VCP_IPI_MAX,
+};
+
+/**
+ * struct mtk_vcp_msg_queue - process the vcp message between kernel with vcp
+ *
+ * @msg_list:  store share buffer list which from vcp to kernel
+ * @wq:        waitqueue that can be used to wait for vcp message
+ * @lock:      protect msg list
+ * @cnt:       the count of share obj in msg list
+ * @node_list: share obj list
+ */
+struct mtk_vcp_msg_queue {
+	struct list_head msg_list;
+	wait_queue_head_t wq;
+	/* protect msg_list and node_list */
+	spinlock_t lock;
+	atomic_t cnt;
+	struct list_head node_list;
+};
+
+/**
+ * struct mtk_vcp_ipi_desc - store the ack handler
+ *
+ * @lock:    protect ack handler data
+ * @handler: calling this handler when kernel receive ack
+ * @priv:    private data when calling handler to process
+ */
+struct mtk_vcp_ipi_desc {
+	/* protect handler and priv */
+	struct mutex lock;
+	vcp_ipi_handler_t handler;
+	void *priv;
+};
+
+/**
+ * struct mtk_vcp_share_obj - share buffer used to send data to vcp
+ *
+ * @id:        message index
+ * @len:       message size
+ * @share_buf: message data
+ */
+struct mtk_vcp_share_obj {
+	unsigned int id;
+	unsigned int len;
+	unsigned char share_buf[VCP_SHARE_BUF_SIZE];
+};
+
+/* enum mtk_vcp_ipi_msg_status - the status when send message to vcp */
+enum mtk_vcp_ipi_msg_status {
+	VCODEC_IPI_MSG_STATUS_OK         = 0,
+	VCODEC_IPI_MSG_STATUS_FAIL       = -1,
+	VCODEC_IPI_MSG_STATUS_MAX_INST   = -2,
+	VCODEC_IPI_MSG_STATUS_ILSEQ      = -3,
+	VCODEC_IPI_MSG_STATUS_INVALID_ID = -4,
+	VCODEC_IPI_MSG_STATUS_DMA_FAIL   = -5,
+};
+
+/**
+ * struct mtk_vcp_msg_node - share buffer used to send data to vcp
+ *
+ * @ipi_data: share obj data
+ * @list:     list to store msg node
+ */
+struct mtk_vcp_msg_node {
+	struct mtk_vcp_share_obj ipi_data;
+	struct list_head list;
+};
+
+/**
+ * struct mtk_vcp - vcp firmware private data
+ *
+ * @is_init_done:  vcp is ready to use
+ *
+ * @ipi_mutex:     used to protect ipi data
+ * @msg_signaled:  whether receive ack from vcp
+ * @msg_wq:        wake message queue
+ *
+ * @ipi_desc:      store ack handler
+ * @ipi_id_ack:    the ack handler status
+ *
+ * @msg_queue:     process vcp message
+ * @share_data:    temp share obj data
+ *
+ * @vcp_notify:    register notifier to vcp
+ *
+ * @vsi_addr:      vsi virtual data address
+ * @vsi_core_addr: vsi core virtual data address
+ * @iova_addr:     vsi iova address
+ * @vsi_size:      vsi size
+ *
+ * @pdev:          platform device
+ * @vcp_device:    vcp private data
+ * @is_register_done: register vcodec to vcp
+ */
+struct mtk_vcp {
+	bool is_init_done;
+
+	/* serialize ipi message send/receive */
+	struct mutex ipi_mutex;
+	bool msg_signaled[VCP_IPI_MAX];
+	wait_queue_head_t msg_wq[VCP_IPI_MAX];
+
+	struct mtk_vcp_ipi_desc ipi_desc[VCP_IPI_MAX];
+	bool ipi_id_ack[VCP_IPI_MAX];
+
+	struct mtk_vcp_msg_queue msg_queue;
+	struct mtk_vcp_share_obj share_data;
+
+	struct notifier_block vcp_notify;
+
+	void *vsi_addr;
+	void *vsi_core_addr;
+	dma_addr_t iova_addr;
+	int vsi_size;
+
+	struct platform_device *pdev;
+	struct mtk_vcp_device *vcp_device;
+	bool is_register_done;
+};
+
+#endif
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f78f5..41643db9f4eb 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -130,3 +130,4 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	return fw;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_vpu_init);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index d220b645e455..ce17b649022f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -376,12 +376,15 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+		dev->fw_init = mtk_vcodec_fw_vpu_init;
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+		dev->fw_init = mtk_vcodec_fw_scp_init;
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
 					 &rproc_phandle)) {
 		fw_type = VCP;
+		dev->fw_init = mtk_vcodec_fw_vcp_init;
 	} else {
 		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index c9d27534c63e..15e437323af5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -251,6 +251,7 @@ struct mtk_vcodec_dec_ctx {
  * @vdecsys_regmap: VDEC_SYS register space passed through syscon
  *
  * @fw_handler: used to communicate with the firmware.
+ * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @dec_mutex: decoder hardware lock
@@ -292,6 +293,7 @@ struct mtk_vcodec_dec_dev {
 	struct regmap *vdecsys_regmap;
 
 	struct mtk_vcodec_fw *fw_handler;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* decoder hardware mutex lock */
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 4e4541b2fc8e..dc54d445d98d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -259,9 +259,11 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+		dev->fw_init = mtk_vcodec_fw_vpu_init;
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+		dev->fw_init = mtk_vcodec_fw_scp_init;
 	} else {
 		dev_err(&pdev->dev, "[MTK VCODEC] Could not get venc IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0cddfa13594f..934ff648125d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -174,6 +174,7 @@ struct mtk_vcodec_enc_ctx {
  * @venc_pdata: encoder IC-specific data
  *
  * @fw_handler: used to communicate with the firmware.
+ * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @enc_mutex: encoder hardware lock.
@@ -201,6 +202,7 @@ struct mtk_vcodec_enc_dev {
 	const struct mtk_vcodec_enc_pdata *venc_pdata;
 
 	struct mtk_vcodec_fw *fw_handler;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* encoder hardware mutex lock */
-- 
2.45.2


