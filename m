Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EE2282AA2
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 14:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgJDMWs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJDMWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 08:22:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132BFC0613CE
        for <linux-media@vger.kernel.org>; Sun,  4 Oct 2020 05:22:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so3957170pgl.2
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2020 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5gymd6r8hsrMatHTAzhpGhhZ4TD6zwxmssiSWg43/Q8=;
        b=HJosmGjmPBZAxvFL/+CzRji2GzFTF2UOtRQ6gqCLDG9LOHdKG3a8KFY4sBOMD/+0e8
         DgPVRXUkXnG7d4bC+G1rhyq99M5b6h/aqZRhQHUk+T/xct8DTWV3ZAgkomGG+kiqNKS0
         1OVrOdP8483D1gfZ9RuquW3h5kki1LhIblJj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5gymd6r8hsrMatHTAzhpGhhZ4TD6zwxmssiSWg43/Q8=;
        b=nbMf3f3yCKNHEt3RawbIKJ7Ut4Ke/tvW7anYNvyW9ezXhD38/0hcgRiPYSfxrbmJ4p
         2lv3ZkOp3RjPu7ycfee88emTwwTMhL17qWl3R/MyENJ5oiG8RmL1HC08Hv3TNJcxmCFc
         dXKdQgs24Bt5d4BjpSzXg97WGp4quEVyxxsyUQXW7wUf3mZydXG0KLiIAuTzWK91JXWI
         mrsqXwpTrIaiVp4tdsTZZbRI7SGv9mfDtNQQo7iZs/j6K1qHBTvhd2idKVIcuMPGhCZr
         dw9I9JP9BbqQFc3TIEn+7H+GIM4gsKlJdDUtfYUZ5MjCaWauMyIcUsVd/FWIfwKAkWh3
         TV1w==
X-Gm-Message-State: AOAM532OfcMzzxDUqzxTvKRP7yUc9iIfE/co76ocNZGAZCCYwZvHh1a9
        p9uhoZh4MnG5VY8D36Sp9QU//w==
X-Google-Smtp-Source: ABdhPJw/7gJP0++Js5Qep6o8IC1HGhh7lU0vKxuEC3chBIku3CwDJoK61UKSe4nm+uKtaQzVONe3hQ==
X-Received: by 2002:a63:f90a:: with SMTP id h10mr9625519pgi.361.1601814163463;
        Sun, 04 Oct 2020 05:22:43 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id z190sm7464448pfc.89.2020.10.04.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 05:22:42 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is disabled
Date:   Sun,  4 Oct 2020 21:22:34 +0900
Message-Id: <20201004122234.802044-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The addition of MT8183 support added a dependency on the SCP remoteproc
module. However the initial patch used the "select" Kconfig directive,
which may result in the SCP module to not be compiled if remoteproc was
disabled. In such a case, mtk-vcodec would try to link against
non-existent SCP symbols. "select" was clearly misused here as explained
in kconfig-language.txt.

Replace this by a "depends" directive on at least one of the VPU and
SCP modules, to allow the driver to be compiled as long as one of these
is enabled, and adapt the code to support this new scenario.

Also adapt the Kconfig text to explain the extra requirements for MT8173
and MT8183.

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
---
 drivers/media/platform/Kconfig                | 10 +--
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
 2 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a3cb104956d5..98eb62e49ec2 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-	select VIDEO_MEDIATEK_VPU
-	select MTK_SCP
 	help
 	    Mediatek video codec driver provides HW capability to
-	    encode and decode in a range of video formats
-	    This driver rely on VPU driver to communicate with VPU.
+	    encode and decode in a range of video formats on MT8173
+	    and MT8183.
+
+	    Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
+	    also be selected. Support for MT8183 depends on MTK_SCP.
 
 	    To compile this driver as modules, choose M here: the
 	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 6c2a2568d844..23a80027a8fb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -13,6 +13,7 @@ struct mtk_vcodec_fw_ops {
 			    mtk_vcodec_ipi_handler handler, const char *name, void *priv);
 	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
 			unsigned int len, unsigned int wait);
+	void (*release)(struct mtk_vcodec_fw *fw);
 };
 
 struct mtk_vcodec_fw {
@@ -22,6 +23,8 @@ struct mtk_vcodec_fw {
 	struct mtk_scp *scp;
 };
 
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
+
 static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
 {
 	return vpu_load_firmware(fw->pdev);
@@ -64,6 +67,27 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 	return vpu_ipi_send(fw->pdev, id, buf, len);
 }
 
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
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.load_firmware = mtk_vcodec_vpu_load_firmware,
 	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
@@ -71,8 +95,13 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
 	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
 	.ipi_send = mtk_vcodec_vpu_ipi_send,
+	.release = mtk_vcodec_vpu_release,
 };
 
+#endif  /* IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU) */
+
+#if IS_ENABLED(CONFIG_MTK_SCP)
+
 static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
 {
 	return rproc_boot(scp_get_rproc(fw->scp));
@@ -107,6 +136,11 @@ static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 	return scp_ipi_send(fw->scp, id, buf, len, wait);
 }
 
+static void mtk_vcodec_scp_release(struct mtk_vcodec_fw *fw)
+{
+	scp_put(fw->scp);
+}
+
 static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
 	.load_firmware = mtk_vcodec_scp_load_firmware,
 	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
@@ -114,23 +148,10 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
 	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
 	.ipi_register = mtk_vcodec_scp_set_ipi_register,
 	.ipi_send = mtk_vcodec_scp_ipi_send,
+	.release = mtk_vcodec_scp_release,
 };
 
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
+#endif  /* IS_ENABLED(CONFIG_MTK_SCP) */
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 					   enum mtk_vcodec_fw_type type,
@@ -143,16 +164,22 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 
 	switch (type) {
 	case VPU:
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
 		ops = &mtk_vcodec_vpu_msg;
 		fw_pdev = vpu_get_plat_device(dev->plat_dev);
 		if (!fw_pdev) {
 			mtk_v4l2_err("firmware device is not ready");
 			return ERR_PTR(-EINVAL);
 		}
-		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
+		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler,
 				    dev, rst_id);
 		break;
+#else
+		mtk_v4l2_err("no VPU support in this kernel");
+		return ERR_PTR(-ENODEV);
+#endif
 	case SCP:
+#if IS_ENABLED(CONFIG_MTK_SCP)
 		ops = &mtk_vcodec_rproc_msg;
 		scp = scp_get(dev->plat_dev);
 		if (!scp) {
@@ -160,6 +187,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 		break;
+#else
+		mtk_v4l2_err("no SCP support in this kernel");
+		return ERR_PTR(-ENODEV);
+#endif
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
@@ -180,14 +211,7 @@ EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
 
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
 
-- 
2.28.0.806.g8561365e88-goog

