Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2201DAD68
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgETI1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgETI1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:27:50 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E93EC061A0F
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:27:50 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id c75so1103498pga.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UvKiXyFjGQL6mEGXl9GNs9QeAqkLMuJ/VOPN9uDsdJo=;
        b=iixtKacqsnQStdJUEOJFhNx/FPZOdSj6V/szkRCGgRK7ASPIyBINBzNWt7jTeLSso8
         SGedK+SpYlg+FfLCbDix4ZHrPemu8g9LVQngvIWbwk8xuts2Q3BpEqFRFVPIzWINuuuU
         CjUXkLY8LclUNIryhznaMPozlcgTrW0TNlfR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UvKiXyFjGQL6mEGXl9GNs9QeAqkLMuJ/VOPN9uDsdJo=;
        b=nRonTxVxYrzPnbg+GoPrDpNcqBYt43Qik62UMRnYkHHiDHDkykl126D9vVEi4oWz7g
         IEN3sMWzb9ceftU6jeJpcJs/7T3eoByZ9jNyNDyxUUGi6uMhSEqFC3i3xb4rOFzCAeae
         ss0BBRhK5hu6TVzRxsKEnlW9c9jU0nQ0Hg6zoV/8XI0HIKI/yi9XxfzsTQdo3ZTxoyzi
         pQwae4rbnThExBGNdVGyF4aWuhGee+LwLd55s+UyGCHOdz/LcLSJqoW91bqFaucQxvAJ
         7sOVrXqbpxnIx3mr0seuHDSFWw5b9cYo3Ym+j4UAYetHqFm3AYg48z5ofrMtm6Wx0jHM
         fhHA==
X-Gm-Message-State: AOAM533/RVsz+9vE7zpEQfuh7hVebZ2PLFOLc1AvUAv9ML+6EFnbaXTd
        2HSUpotEUWQsB9W5IB4GjgGb9g==
X-Google-Smtp-Source: ABdhPJyrtKtrZGLTf2NgWTg5QvHLzXCA5ZS/vuHMMBoJybDb4z/UsgxvAILhqOr+sGnEgH0crYUt4A==
X-Received: by 2002:a62:3785:: with SMTP id e127mr3251167pfa.210.1589963269462;
        Wed, 20 May 2020 01:27:49 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:27:48 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 02/10] media: mtk-vcodec: add SCP firmware ops
Date:   Wed, 20 May 2020 17:27:15 +0900
Message-Id: <20200520082723.96136-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Add support for communicating with the SCP firmware, which will be used
by MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/Kconfig                |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
 5 files changed, 66 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..9b11dd6b1ef3 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -256,6 +256,8 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VPU
+	select MTK_SCP
+	default n
 	help
 	    Mediatek video codec driver provides HW capability to
 	    encode and decode in a range of video formats
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 4f07a5fcce7f..5b5765b98e57 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -225,6 +225,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
+					 &rproc_phandle)) {
+		fw_type = SCP;
 	} else {
 		mtk_v4l2_err("Could not get vdec IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 4340ea10afd0..42530cd01a30 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -233,6 +233,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
+					 &rproc_phandle)) {
+		fw_type = SCP;
 	} else {
 		mtk_v4l2_err("Could not get venc IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 967bb100a990..f2a62ea62fc6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -19,6 +19,7 @@ struct mtk_vcodec_fw {
 	enum mtk_vcodec_fw_type type;
 	const struct mtk_vcodec_fw_ops *ops;
 	struct platform_device *pdev;
+	struct mtk_scp *scp;
 };
 
 static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
@@ -71,6 +72,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.ipi_send = mtk_vcodec_vpu_ipi_send,
 };
 
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
+		mtk_vcodec_ipi_handler handler, const char *name, void *priv)
+{
+	return scp_ipi_register(fw->scp, id, handler, priv);
+}
+
+static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+		unsigned int len, unsigned int wait)
+{
+	return scp_ipi_send(fw->scp, id, buf, len, wait);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
+	.load_firmware = mtk_vcodec_scp_load_firmware,
+	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
+	.ipi_register = mtk_vcodec_scp_set_ipi_register,
+	.ipi_send = mtk_vcodec_scp_ipi_send,
+};
+
 static void mtk_vcodec_reset_handler(void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -94,6 +137,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 	const struct mtk_vcodec_fw_ops *ops;
 	struct mtk_vcodec_fw *fw;
 	struct platform_device *fw_pdev = NULL;
+	struct mtk_scp *scp = NULL;
 
 	switch (type) {
 	case VPU:
@@ -106,6 +150,14 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
 				    dev, rst_id);
 		break;
+	case SCP:
+		ops = &mtk_vcodec_rproc_msg;
+		scp = scp_get(dev->plat_dev);
+		if (!scp) {
+			mtk_v4l2_err("could not get vdec scp handle");
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+		break;
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
@@ -118,6 +170,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 	fw->type = type;
 	fw->ops = ops;
 	fw->pdev = fw_pdev;
+	fw->scp = scp;
 
 	return fw;
 }
@@ -129,6 +182,9 @@ void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
 	case VPU:
 		put_device(&fw->pdev->dev);
 		break;
+	case SCP:
+		scp_put(fw->scp);
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index ff25b0c19f74..ced1b6a10e07 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -4,6 +4,7 @@
 #define _MTK_VCODEC_FW_H_
 
 #include <linux/remoteproc.h>
+#include <linux/remoteproc/mtk_scp.h>
 
 #include "../mtk-vpu/mtk_vpu.h"
 
@@ -11,6 +12,7 @@ struct mtk_vcodec_dev;
 
 enum mtk_vcodec_fw_type {
 	VPU,
+	SCP,
 };
 
 struct mtk_vcodec_fw;
-- 
2.26.2.761.g0e0b3e54be-goog

