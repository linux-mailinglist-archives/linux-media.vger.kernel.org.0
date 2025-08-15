Return-Path: <linux-media+bounces-39967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A898FB27BD6
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40EDD5804A3
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8AB2E1C5B;
	Fri, 15 Aug 2025 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WLCXQlo4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAB2D0C6E;
	Fri, 15 Aug 2025 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247986; cv=none; b=Ty0aQS0iiFt/yIKIeK08RvvA5JhLUZ9MXDP69RgsfKQsmIqvRUAYcds2SXkV70xh/7jAaMqxMyUGmSokwh6ErPbYPWgQkmtSIxncIzRfI1Z5CFzZ+mnmzTC4DYGqGhhTvHZsFDkVup2P11TG3Ogth2xv/zjWl4oFo2GiAB2xh74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247986; c=relaxed/simple;
	bh=e9AgcHmpIbFbC6uEz5cv86556IOpprdeFqBrgKtm/AI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GleFepJa3Skl1w39l8dIn260dnX1IL8EaktnHIX65QXCtHTHfHIgYE3fPgpLgEuvKEvfUBpHTDqoGDHn5lvtIEIJ9vrvkeyokZMeLIoU5A03y6s2OUy/obZdrHBQVCH3840gO7kMHSCXF9T3ox6fw+d+aR2Pf8WnuY34ioQiyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WLCXQlo4; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 396dca8679b511f08729452bf625a8b4-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XbHFOaykYRrWKKMdbdl5WsIn9i3ybCE7G5u/b8ie4Xs=;
	b=WLCXQlo4R1yHW8P7JeBltlIjMJEGKc9RKEw4I/kr5T30FffBsqXrDCjCawwSuvLZ3XrwoP74mFNt5HzE/vwtOpglnUCh9uxgs3lRvx63EBDKcfbCqCX5nXYBbcL3eV2buSXjdECkplL7bUqQ3pM9hiiA8YucKX3c1XMVnx69qrU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:396e7c80-e7b6-4704-9d26-c0a1d3807d8b,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:2584416d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 396dca8679b511f08729452bf625a8b4-20250815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743969021; Fri, 15 Aug 2025 16:52:50 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:52:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:52:47 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 03/14] media: mediatek: vcodec: add driver to support vcp
Date: Fri, 15 Aug 2025 16:52:16 +0800
Message-ID: <20250815085232.30240-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250815085232.30240-1-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The processor is changed from scp to vcp in mt8196 platform.
Adding new firmware interface to communicate kernel with vcp
for the communication method is changed.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |   3 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 449 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 137 ++++++
 include/linux/remoteproc/mtk_vcp_public.h     |   2 +-
 8 files changed, 611 insertions(+), 1 deletion(-)
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
index 08949b08fbc6..fc547afa4ebf 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -3,6 +3,7 @@
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
 #include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_fw_vcp.h"
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
 					   enum mtk_vcodec_fw_use fw_use)
@@ -19,6 +20,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type t
 		return mtk_vcodec_fw_vpu_init(priv, fw_use);
 	case SCP:
 		return mtk_vcodec_fw_scp_init(priv, fw_use);
+	case VCP:
+		return mtk_vcodec_fw_vcp_init(priv, fw_use);
 	default:
 		dev_err(&plat_dev->dev, "Invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 300363a40158..c1642fb09b42 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -14,6 +14,7 @@ struct mtk_vcodec_enc_dev;
 enum mtk_vcodec_fw_type {
 	VPU,
 	SCP,
+	VCP,
 };
 
 enum mtk_vcodec_fw_use {
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
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
new file mode 100644
index 000000000000..227310c116c6
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
@@ -0,0 +1,449 @@
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
+static void mtk_vcodec_vcp_ipi_lock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	if (WARN_ON(ipi_id >= VCP_IPI_MAX))
+		return;
+
+	mutex_lock(&vcp->ipi_desc[ipi_id].lock);
+}
+
+static void mtk_vcodec_vcp_ipi_unlock(struct mtk_vcp *vcp, u32 ipi_id)
+{
+	if (WARN_ON(ipi_id >= VCP_IPI_MAX))
+		return;
+
+	mutex_unlock(&vcp->ipi_desc[ipi_id].lock);
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
+	spin_lock_irqsave(&fw->vcp->msg_queue.lock, flags);
+	list_add(&msg_node->list, &fw->vcp->msg_queue.node_list);
+	spin_unlock_irqrestore(&fw->vcp->msg_queue.lock, flags);
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
+	unsigned long flags;
+	vcp_ipi_handler_t handler;
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
+		spin_lock_irqsave(&fw->vcp->msg_queue.lock, flags);
+		msg_node = list_entry(fw->vcp->msg_queue.msg_list.next,
+				      struct mtk_vcp_msg_node, list);
+		list_del(&msg_node->list);
+		atomic_dec(&fw->vcp->msg_queue.cnt);
+		spin_unlock_irqrestore(&fw->vcp->msg_queue.lock, flags);
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
+	spin_lock_irqsave(&msg_queue->lock, flags);
+	if (!list_empty(&msg_queue->node_list)) {
+		msg_node = list_entry(msg_queue->node_list.next, struct mtk_vcp_msg_node, list);
+
+		memcpy(&msg_node->ipi_data, obj, sizeof(*obj));
+		list_move_tail(&msg_node->list, &msg_queue->msg_list);
+		atomic_inc(&msg_queue->cnt);
+		spin_unlock_irqrestore(&msg_queue->lock, flags);
+
+		dev_dbg(&fw->pdev->dev, "push ipi_id %x msg_id %x, msg cnt %d\n",
+			obj->id, msg->msg_id, atomic_read(&msg_queue->cnt));
+
+		wake_up(&msg_queue->wq);
+	} else {
+		spin_unlock_irqrestore(&msg_queue->lock, flags);
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
+	struct mutex *msg_mutex = &vcp->ipi_mutex;
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
+	mutex_lock(msg_mutex);
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
+	ipi_size = ((sizeof(u32) * 2) + len + 3) / 4;
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
+	mutex_unlock(msg_mutex);
+
+	return vcp->ipi_id_ack[id];
+
+error:
+	mutex_unlock(msg_mutex);
+	dev_err(&fw->pdev->dev, "send msg error type:%d msg:%d > %d ret:%d\n", fw->type, len,
+		VCP_SHARE_BUF_SIZE, ret);
+
+	return ret;
+}
+
+static int mtk_vcodec_vcp_get_vcp_device(struct mtk_vcodec_fw *fw)
+{
+	struct device *dev = &fw->pdev->dev;
+	int retry = 0, retry_cnt = 10000;
+	phandle vcp_phandle;
+
+	while (request_module("mtk-vcp")) {
+		if (++retry > retry_cnt) {
+			dev_err(dev, "failed to load mtk-vcp module");
+			return -ENODEV;
+		}
+		msleep(1);
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
+	struct mtk_vcp_device *vcp_device = fw->vcp->vcp_device;
+	struct device *dev = &fw->pdev->dev;
+	int ret;
+
+	if (!fw->vcp->vcp_device) {
+		dev_err(dev, "vcp device is null\n");
+		return -ENODEV;
+	}
+
+	ret = vcp_device->ops->vcp_register_feature(vcp_device, VDEC_FEATURE_ID);
+	if (ret < 0)
+		goto error;
+
+	ret = mtk_vcodec_vcp_msg_ipi_send(fw, id, buf, len, wait);
+	if (ret < 0)
+		goto error;
+
+	ret = vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATURE_ID);
+	if (ret < 0)
+		goto error;
+
+	return ret;
+
+error:
+	dev_err(dev, "vcp ipi send fail ret:%d\n", ret);
+
+	return ret;
+}
+
+static void mtk_vcodec_vcp_release(struct mtk_vcodec_fw *fw)
+{
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
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
new file mode 100644
index 000000000000..40f5481d1889
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h
@@ -0,0 +1,137 @@
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
+ */
+struct mtk_vcp {
+	bool is_init_done;
+
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
+};
+
+#endif
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
index 07b0b30ea964..0b7d1c3c28ca 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -10,7 +10,7 @@
 #include <linux/firmware/mediatek/mtk-vcp-ipc.h>
 #include <linux/remoteproc.h>
 
-#define VCP_SYNC_TIMEOUT_MS             (999)
+#define VCP_SYNC_TIMEOUT_MS             (50)
 
 /* vcp notify event */
 enum VCP_NOTIFY_EVENT {
-- 
2.45.2


