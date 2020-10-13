Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE83E28CE9F
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgJMMoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 08:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgJMMom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 08:44:42 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E14FC0613D7
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:44:42 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id g16so652622pjv.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tI9og2Mp3SvB/KIpM56bpbcWr59ULpoa9Os216f3JV0=;
        b=namv7hM2qX01p7pSVLVigshcmygAVma6KdSlv7b3MnVFtx05UOh3CHmCQeZriDzTnQ
         wVQ9qGrVMf/fkAp/Xcc2ZTEOqitbUztrR++k7ZeqMP1I8ZDedrv2ctaroVotc5zLD9Yj
         o8GiXTWaB6nckvOdz0X/JK5g8ctnfjo6Jba6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tI9og2Mp3SvB/KIpM56bpbcWr59ULpoa9Os216f3JV0=;
        b=Hw8cvnRlklAocLQDZHsePyr6r46xDx/mna9SmU02MizUBAvikKu3vyU0h6YhFduF1O
         hWFVn2A7Hu6GgtYwMheVkhWOcpDnYTXpVJEQFG8pnDT2fJMswrkRTkf/VZBB+ICdRADH
         sXQHFa5u8Lo3kJpZL1nifH/gkFezo8PJVECoa3hRT7kaSWnk/TjXX5HKa9Js5ruCEMJ+
         cm/2gpz8h3x59bbXQ7eD+zEg6kdxQbkPp+9Jn8HU6r1/8k8s7tlDr/8E2p4Tfc8z4i8k
         sVDiFe4Q+nrUS1pq+Acpu+Rpdo9PcBy1nIPNY9M7IHhTPwA6pdiCYA/jNpYZsIdbTnB4
         JVVQ==
X-Gm-Message-State: AOAM530UJ/YwDfPtexP9lczS0hxGD3VWHAIP7nMgMelCu66wDMkJcft3
        Z1QS5g+xHarDuoaPfqVQz2t4Iw==
X-Google-Smtp-Source: ABdhPJyvAFvA4FZovSEnBAa4U4tIeAwOcgqT0/xB3z4J//fyGanoVqHLlyPaPtOUY8w8nLoEbzjGOA==
X-Received: by 2002:a17:902:9a84:b029:d2:9390:5e6 with SMTP id w4-20020a1709029a84b02900d2939005e6mr28510417plp.37.1602593081790;
        Tue, 13 Oct 2020 05:44:41 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id b20sm18914536pjo.37.2020.10.13.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:44:41 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 1/2] media: mtk-vcodec: move firmware implementations into their own files
Date:   Tue, 13 Oct 2020 21:44:27 +0900
Message-Id: <20201013124428.783025-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201013124428.783025-1-acourbot@chromium.org>
References: <20201013124428.783025-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mtk-vcodec supports two kinds of firmware, VPU and SCP. Both were
supported from the same source files, but this is clearly unclean and
makes it more difficult to disable support for one or the other.

Move these implementations into their own file, after adding the
necessary private interfaces.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  34 ++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
 8 files changed, 232 insertions(+), 173 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index f679c6e1a3e9..6e1ea3a9f052 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -24,4 +24,6 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o \
-		mtk_vcodec_fw.o
+		mtk_vcodec_fw.o \
+		mtk_vcodec_fw_vpu.o \
+		mtk_vcodec_fw_scp.o
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index d14bc208ea5e..145686d2c219 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -241,7 +241,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, VPU_RST_DEC);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, DECODER);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index dcfa2c2d4def..3be8a04c4c67 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -293,7 +293,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, VPU_RST_ENC);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, ENCODER);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 6c2a2568d844..94b39ae5c2e1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -1,193 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include "mtk_vcodec_fw.h"
+#include "mtk_vcodec_fw_priv.h"
 #include "mtk_vcodec_util.h"
 #include "mtk_vcodec_drv.h"
 
-struct mtk_vcodec_fw_ops {
-	int (*load_firmware)(struct mtk_vcodec_fw *fw);
-	unsigned int (*get_vdec_capa)(struct mtk_vcodec_fw *fw);
-	unsigned int (*get_venc_capa)(struct mtk_vcodec_fw *fw);
-	void * (*map_dm_addr)(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr);
-	int (*ipi_register)(struct mtk_vcodec_fw *fw, int id,
-			    mtk_vcodec_ipi_handler handler, const char *name, void *priv);
-	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
-			unsigned int len, unsigned int wait);
-};
-
-struct mtk_vcodec_fw {
-	enum mtk_vcodec_fw_type type;
-	const struct mtk_vcodec_fw_ops *ops;
-	struct platform_device *pdev;
-	struct mtk_scp *scp;
-};
-
-static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
-{
-	return vpu_load_firmware(fw->pdev);
-}
-
-static unsigned int mtk_vcodec_vpu_get_vdec_capa(struct mtk_vcodec_fw *fw)
-{
-	return vpu_get_vdec_hw_capa(fw->pdev);
-}
-
-static unsigned int mtk_vcodec_vpu_get_venc_capa(struct mtk_vcodec_fw *fw)
-{
-	return vpu_get_venc_hw_capa(fw->pdev);
-}
-
-static void *mtk_vcodec_vpu_map_dm_addr(struct mtk_vcodec_fw *fw,
-					u32 dtcm_dmem_addr)
-{
-	return vpu_mapping_dm_addr(fw->pdev, dtcm_dmem_addr);
-}
-
-static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
-					   mtk_vcodec_ipi_handler handler,
-					   const char *name, void *priv)
-{
-	/*
-	 * The handler we receive takes a void * as its first argument. We
-	 * cannot change this because it needs to be passed down to the rproc
-	 * subsystem when SCP is used. VPU takes a const argument, which is
-	 * more constrained, so the conversion below is safe.
-	 */
-	ipi_handler_t handler_const = (ipi_handler_t)handler;
-
-	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
-}
-
-static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
-				   unsigned int len, unsigned int wait)
-{
-	return vpu_ipi_send(fw->pdev, id, buf, len);
-}
-
-static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
-	.load_firmware = mtk_vcodec_vpu_load_firmware,
-	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
-	.get_venc_capa = mtk_vcodec_vpu_get_venc_capa,
-	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
-	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
-	.ipi_send = mtk_vcodec_vpu_ipi_send,
-};
-
-static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
-{
-	return rproc_boot(scp_get_rproc(fw->scp));
-}
-
-static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
-{
-	return scp_get_vdec_hw_capa(fw->scp);
-}
-
-static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
-{
-	return scp_get_venc_hw_capa(fw->scp);
-}
-
-static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
-					u32 dtcm_dmem_addr)
-{
-	return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
-}
-
-static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
-					   mtk_vcodec_ipi_handler handler,
-					   const char *name, void *priv)
-{
-	return scp_ipi_register(fw->scp, id, handler, priv);
-}
-
-static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
-				   unsigned int len, unsigned int wait)
-{
-	return scp_ipi_send(fw->scp, id, buf, len, wait);
-}
-
-static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
-	.load_firmware = mtk_vcodec_scp_load_firmware,
-	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
-	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
-	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
-	.ipi_register = mtk_vcodec_scp_set_ipi_register,
-	.ipi_send = mtk_vcodec_scp_ipi_send,
-};
-
-static void mtk_vcodec_reset_handler(void *priv)
-{
-	struct mtk_vcodec_dev *dev = priv;
-	struct mtk_vcodec_ctx *ctx;
-
-	mtk_v4l2_err("Watchdog timeout!!");
-
-	mutex_lock(&dev->dev_mutex);
-	list_for_each_entry(ctx, &dev->ctx_list, list) {
-		ctx->state = MTK_STATE_ABORT;
-		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
-			       ctx->id);
-	}
-	mutex_unlock(&dev->dev_mutex);
-}
-
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 					   enum mtk_vcodec_fw_type type,
-					   enum rst_id rst_id)
+					   enum mtk_vcodec_fw_use fw_use)
 {
-	const struct mtk_vcodec_fw_ops *ops;
-	struct mtk_vcodec_fw *fw;
-	struct platform_device *fw_pdev = NULL;
-	struct mtk_scp *scp = NULL;
-
 	switch (type) {
 	case VPU:
-		ops = &mtk_vcodec_vpu_msg;
-		fw_pdev = vpu_get_plat_device(dev->plat_dev);
-		if (!fw_pdev) {
-			mtk_v4l2_err("firmware device is not ready");
-			return ERR_PTR(-EINVAL);
-		}
-		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
-				    dev, rst_id);
-		break;
+		return mtk_vcodec_fw_vpu_init(dev, fw_use);
 	case SCP:
-		ops = &mtk_vcodec_rproc_msg;
-		scp = scp_get(dev->plat_dev);
-		if (!scp) {
-			mtk_v4l2_err("could not get vdec scp handle");
-			return ERR_PTR(-EPROBE_DEFER);
-		}
-		break;
+		return mtk_vcodec_fw_scp_init(dev);
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
 	}
-
-	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
-		return ERR_PTR(-EINVAL);
-
-	fw->type = type;
-	fw->ops = ops;
-	fw->pdev = fw_pdev;
-	fw->scp = scp;
-
-	return fw;
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
 
 void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
 {
-	switch (fw->type) {
-	case VPU:
-		put_device(&fw->pdev->dev);
-		break;
-	case SCP:
-		scp_put(fw->scp);
-		break;
-	}
+	fw->ops->release(fw);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index fadbbe6ba6cd..539bb626772c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -15,6 +15,11 @@ enum mtk_vcodec_fw_type {
 	SCP,
 };
 
+enum mtk_vcodec_fw_use {
+	DECODER,
+	ENCODER,
+};
+
 struct mtk_vcodec_fw;
 
 typedef void (*mtk_vcodec_ipi_handler) (void *data,
@@ -22,7 +27,7 @@ typedef void (*mtk_vcodec_ipi_handler) (void *data,
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 					   enum mtk_vcodec_fw_type type,
-					   enum rst_id rst_id);
+					   enum mtk_vcodec_fw_use fw_use);
 void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw);
 
 int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
new file mode 100644
index 000000000000..51f1694a7c7d
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MTK_VCODEC_FW_PRIV_H_
+#define _MTK_VCODEC_FW_PRIV_H_
+
+#include "mtk_vcodec_fw.h"
+
+struct mtk_vcodec_dev;
+
+struct mtk_vcodec_fw {
+	enum mtk_vcodec_fw_type type;
+	const struct mtk_vcodec_fw_ops *ops;
+	struct platform_device *pdev;
+	struct mtk_scp *scp;
+};
+
+struct mtk_vcodec_fw_ops {
+	int (*load_firmware)(struct mtk_vcodec_fw *fw);
+	unsigned int (*get_vdec_capa)(struct mtk_vcodec_fw *fw);
+	unsigned int (*get_venc_capa)(struct mtk_vcodec_fw *fw);
+	void *(*map_dm_addr)(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr);
+	int (*ipi_register)(struct mtk_vcodec_fw *fw, int id,
+			    mtk_vcodec_ipi_handler handler, const char *name,
+			    void *priv);
+	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
+			unsigned int len, unsigned int wait);
+	void (*release)(struct mtk_vcodec_fw *fw);
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
+					     enum mtk_vcodec_fw_use fw_use);
+struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
+
+#endif /* _MTK_VCODEC_FW_PRIV_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
new file mode 100644
index 000000000000..d8e66b645bd8
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_util.h"
+#include "mtk_vcodec_drv.h"
+
+static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return rproc_boot(scp_get_rproc(fw->scp));
+}
+
+static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_vdec_hw_capa(fw->scp);
+}
+
+static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_venc_hw_capa(fw->scp);
+}
+
+static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
+					u32 dtcm_dmem_addr)
+{
+	return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
+}
+
+static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+					   mtk_vcodec_ipi_handler handler,
+					   const char *name, void *priv)
+{
+	return scp_ipi_register(fw->scp, id, handler, priv);
+}
+
+static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				   unsigned int len, unsigned int wait)
+{
+	return scp_ipi_send(fw->scp, id, buf, len, wait);
+}
+
+static void mtk_vcodec_scp_release(struct mtk_vcodec_fw *fw)
+{
+	scp_put(fw->scp);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
+	.load_firmware = mtk_vcodec_scp_load_firmware,
+	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
+	.ipi_register = mtk_vcodec_scp_set_ipi_register,
+	.ipi_send = mtk_vcodec_scp_ipi_send,
+	.release = mtk_vcodec_scp_release,
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
+{
+	struct mtk_vcodec_fw *fw;
+	struct mtk_scp *scp;
+
+	scp = scp_get(dev->plat_dev);
+	if (!scp) {
+		mtk_v4l2_err("could not get vdec scp handle");
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	fw->type = SCP;
+	fw->ops = &mtk_vcodec_rproc_msg;
+	fw->scp = scp;
+
+	return fw;
+}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
new file mode 100644
index 000000000000..4cd512101542
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_util.h"
+#include "mtk_vcodec_drv.h"
+
+static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return vpu_load_firmware(fw->pdev);
+}
+
+static unsigned int mtk_vcodec_vpu_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return vpu_get_vdec_hw_capa(fw->pdev);
+}
+
+static unsigned int mtk_vcodec_vpu_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return vpu_get_venc_hw_capa(fw->pdev);
+}
+
+static void *mtk_vcodec_vpu_map_dm_addr(struct mtk_vcodec_fw *fw,
+					u32 dtcm_dmem_addr)
+{
+	return vpu_mapping_dm_addr(fw->pdev, dtcm_dmem_addr);
+}
+
+static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+					   mtk_vcodec_ipi_handler handler,
+					   const char *name, void *priv)
+{
+	/*
+	 * The handler we receive takes a void * as its first argument. We
+	 * cannot change this because it needs to be passed down to the rproc
+	 * subsystem when SCP is used. VPU takes a const argument, which is
+	 * more constrained, so the conversion below is safe.
+	 */
+	ipi_handler_t handler_const = (ipi_handler_t)handler;
+
+	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
+}
+
+static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				   unsigned int len, unsigned int wait)
+{
+	return vpu_ipi_send(fw->pdev, id, buf, len);
+}
+
+static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
+{
+	put_device(&fw->pdev->dev);
+}
+
+static void mtk_vcodec_vpu_reset_handler(void *priv)
+{
+	struct mtk_vcodec_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+
+	mtk_v4l2_err("Watchdog timeout!!");
+
+	mutex_lock(&dev->dev_mutex);
+	list_for_each_entry(ctx, &dev->ctx_list, list) {
+		ctx->state = MTK_STATE_ABORT;
+		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
+			       ctx->id);
+	}
+	mutex_unlock(&dev->dev_mutex);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
+	.load_firmware = mtk_vcodec_vpu_load_firmware,
+	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_vpu_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
+	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
+	.ipi_send = mtk_vcodec_vpu_ipi_send,
+	.release = mtk_vcodec_vpu_release,
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
+					     enum mtk_vcodec_fw_use fw_use)
+{
+	struct platform_device *fw_pdev;
+	struct mtk_vcodec_fw *fw;
+	enum rst_id rst_id;
+
+	switch (fw_use) {
+	case ENCODER:
+		rst_id = VPU_RST_ENC;
+		break;
+	case DECODER:
+		rst_id = VPU_RST_DEC;
+		break;
+	}
+
+	fw_pdev = vpu_get_plat_device(dev->plat_dev);
+	if (!fw_pdev) {
+		mtk_v4l2_err("firmware device is not ready");
+		return ERR_PTR(-EINVAL);
+	}
+	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
+
+	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	fw->type = VPU;
+	fw->ops = &mtk_vcodec_vpu_msg;
+	fw->pdev = fw_pdev;
+
+	return fw;
+}
-- 
2.29.0.rc1.297.gfa9743e501-goog

