Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1C324D2D6
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgHUKjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728599AbgHUKgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:36:43 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DDDC061386
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:43 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u20so881476pfn.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+6RXV8GSzLCbtPxzWI/1s+cpbWPbdB3r+ZLimwxvGCY=;
        b=nTtTsRjVId3wT5/BFgjOJca9ZVHUc8x0gTJVcOda6fyr8RhGlMSUtqv+yei/hFqPJu
         zwUguM1G4jYANWhAffjDLIfix1dloWFDmwtBwKo1l9fVv1KHimAVwNXgmYlhXVAwtDi/
         0OwyHanry+x8hWldAZdZU26EVKVJag0y0Ab/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+6RXV8GSzLCbtPxzWI/1s+cpbWPbdB3r+ZLimwxvGCY=;
        b=IFtkc6oixTh2y8cwFKlMWibUGAasA3GwzSHrHzr2Cta+21wlHJ1fIVvSgZqorlR7Jz
         yoPjEa+q1UydLaSN08ztYQu1yTCkTvRpewuam2WVFimc7gMXhzQGkrb3gJjXEO+oVzu0
         t7Qmnv9+U7bZu22oe9mf62D9qFodxi8DtIaesxt1y0ZvunOjOWAiQu7drz2cCgIVzBEr
         CymG3Mv2BfMDw3g6nl5M/2FSiDedTDL/Nyz2Pz8k4MlnagrEsY3jx0iLRQKUamDrYUEp
         iySrT61xJGB9MuB4VXHp0o4YuOuR74Qq6AY8RtLKIgcTEHsYv5Vg3gunDWiwQeNQ8w85
         269w==
X-Gm-Message-State: AOAM531brQBVRlsFWFwfP1vGWxW6mTb1W5stcBk5anS2O+tGbwhFU0yj
        O8+7zCpWE0Sl5/gHuuJhbOjv1gjG7/+DSHSi
X-Google-Smtp-Source: ABdhPJy+KdVvXS1pnDGdYuDGQXTaJU/HOLitR9GaNE5+QLuCGIgDpBmwUT8x0N1NOngTz1X97f6WRw==
X-Received: by 2002:aa7:99cc:: with SMTP id v12mr1946473pfi.255.1598006202848;
        Fri, 21 Aug 2020 03:36:42 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:36:42 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 03/17] media: mtk-vcodec: add SCP firmware ops
Date:   Fri, 21 Aug 2020 19:35:54 +0900
Message-Id: <20200821103608.2310097-4-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
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
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/Kconfig                |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
 5 files changed, 65 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..f0dbe048efea 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -256,6 +256,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VPU
+	select MTK_SCP
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
2.28.0.297.g1956fa8f8d-goog

