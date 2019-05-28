Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9FA2BEE6
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfE1F6B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:58:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42491 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727679AbfE1F5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:34 -0400
Received: by mail-pg1-f196.google.com with SMTP id 33so7318733pgv.9
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lti+2/h5oQs9wmieCmorz3lj6t+nun9ZQW66/w6iOxE=;
        b=Dmsl4bz4A30Jz25Wmi/t/uxhrl6anfzRz5BBkZKO7xxoxGUJO7lZbVCfos99SHvK7Y
         1uwDrUuq71TijYz8TBiE1qAGXw2m0u1/K4a/qUI5qHyAK3DWQxIRM3iwY/2LcK/F/Xr7
         tOQ35FQ3o/hAJnX8Pl6iS2P5KblnbKoIOtbps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lti+2/h5oQs9wmieCmorz3lj6t+nun9ZQW66/w6iOxE=;
        b=IMKXVTneCW69LDkPLBgS8l1n8rDvXEYHrRHnPXCx0Lpq/BcZm9un01r4fMNVJz6gx6
         nD/0/AcQQi76KoGFubjhMU9jFadKww5iduMhii0bEvJ/5umVdlbFJJtf458/PDUU1tWD
         lMC020HRujFcysPuHziakUYuxvomoJjrJDEpXiS6XX4vBtqX/lWTMvBbqduLyecnHSYp
         mfCdeFTwfD5zC4htufLEPlxopwUZW2wSYUn3FDbXZBnWYH/dQ53GoGEiRi++IRCOzKNZ
         1fJDWQALM0ByOoYPgvOlH1iwrAfa5VzXNWG9LYVxHPRe72tCtFVOikZkodqupzXVgPNc
         0BPA==
X-Gm-Message-State: APjAAAWfBuoVYCjtZcs2ltagGrKxRbMzrfxR5QvZ7CNwRQZoTbm0XMk2
        kF4XSj3MpSAh4P8BgQglX3PM9Q==
X-Google-Smtp-Source: APXvYqwZrPlFjUqoNa15pMVg7ZfHRg64XPEc4z/LnHORJF6GzR+04+efSzer4BcC8YQ3P1aLRGU5Kw==
X-Received: by 2002:a62:1885:: with SMTP id 127mr82943648pfy.48.1559023053399;
        Mon, 27 May 2019 22:57:33 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:32 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 08/12] media: mtk-vcodec: add SCP firmware ops
Date:   Tue, 28 May 2019 14:56:31 +0900
Message-Id: <20190528055635.12109-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
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
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 ++
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 ++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 51 +++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
 4 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 2328bb9580be..ffa6f3d0869d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -234,6 +234,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
index 598d4bb86e35..da680087b655 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -242,6 +242,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
 		fw_type = VPU;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
+					 &rproc_phandle)) {
+		fw_type = SCP;
 	} else {
 		mtk_v4l2_err("Could not get vdec IPI device");
 		return -ENODEV;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 49dbd623b448..97282b35bcc2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -63,6 +63,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.ipi_send = mtk_vcodec_vpu_ipi_send,
 };
 
+static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return rproc_boot(fw->rproc);
+}
+
+static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_vdec_hw_capa(fw->pdev);
+}
+
+static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_venc_hw_capa(fw->pdev);
+}
+
+static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
+					u32 dtcm_dmem_addr)
+{
+	return scp_mapping_dm_addr(fw->pdev, dtcm_dmem_addr);
+}
+
+static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+		mtk_vcodec_ipi_handler handler, const char *name, void *priv)
+{
+	return scp_ipi_register(fw->pdev, id, handler, priv);
+}
+
+static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+		unsigned int len, unsigned int wait)
+{
+	return scp_ipi_send(fw->pdev, id, buf, len, wait);
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
@@ -96,6 +138,15 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
 				    dev, rst_id);
 		break;
+	case SCP:
+		ops = &mtk_vcodec_rproc_msg;
+		fw_pdev = scp_get_pdev(dev->plat_dev);
+		rproc = rproc_get_by_phandle(rproc_phandle);
+		if (!rproc) {
+			mtk_v4l2_err("could not get vdec rproc handle");
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+		break;
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index a6edb3858e6e..c2c22c7ce05f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -6,11 +6,13 @@
 #include <linux/remoteproc.h>
 
 #include "../mtk-vpu/mtk_vpu.h"
+#include <linux/platform_data/mtk_scp.h>
 
 struct mtk_vcodec_dev;
 
 enum mtk_vcodec_fw_type {
 	VPU,
+	SCP,
 };
 
 struct mtk_vcodec_fw;
-- 
2.22.0.rc1.257.g3120a18244-goog

