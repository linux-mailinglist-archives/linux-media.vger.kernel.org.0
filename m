Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2CAAB798
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390936AbfIFL4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:56:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45937 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404158AbfIFLzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:49 -0400
Received: by mail-pl1-f196.google.com with SMTP id x3so3016238plr.12
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p8R0t7P3TBSd4XtnMK+iFldkaFxG22XRc6ko7i0BC1M=;
        b=NgEdVcp8odU2/m1jmplWlt5PE9M9KTglVd0xNyjF3174vMAAP8AchXOWCJ6qhSV71t
         /NblbJF+OmSgEfbFwXo378KRoKZ4N8VvhSr20agS32yHc+Lys58Gdp3SMFSR7S5XmgQO
         2IALYQqv+kuY2xJrs9iYkggOX15wmxIlR3EcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p8R0t7P3TBSd4XtnMK+iFldkaFxG22XRc6ko7i0BC1M=;
        b=LFHGT+PNn8QGimbkcQvs86yvX1DN0Z/AT2dWnqLJsoUhkhc6IVaF0SfJE+ElGsA+N7
         fveH6tgf1PpCbGwsxJjSBmNazRpKhWSXZmpU/hbgmI2G5BIya1SX9l/Z8VIetxc2VcuK
         CmupPkIIhBBkofY36UF8emVsQyA6WSchtsgUUI44JOtwQleSeGTsp7QtK7JN/grGkg4V
         B2wid8B7gXnY6sHh38hruPIHGit693thlFQ5sGNQHZYEpZ19MuZXFqUv9sGOQMsa4s6b
         EBsf1+3Uh7SSxbn+xazNcy1AB6Gc2jcLlUt54fJ/mhtrOmB9d7pxxOPL3rXjKg/uga+p
         pJPg==
X-Gm-Message-State: APjAAAW8P4jDlCkougxpt7ldzNhYVMT/ZRxo8j0lwB4mRKAyf5TXZl4a
        /mfS8op0I9FAe2RzwayFy7g56g==
X-Google-Smtp-Source: APXvYqwlAfpHbsBlJ+u5EaPjPET/NcNTZ5Dw5/dG6VLngsUJ9Rbvv+F4lFuoDNdUdE5QcJ4jKtRIuA==
X-Received: by 2002:a17:902:b70f:: with SMTP id d15mr8852211pls.285.1567770947074;
        Fri, 06 Sep 2019 04:55:47 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:46 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 06/13] media: mtk-vcodec: abstract firmware interface
Date:   Fri,  6 Sep 2019 20:55:06 +0900
Message-Id: <20190906115513.159705-7-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

MT8183's codec firwmare is run by a different remote processor from
MT8173. While the firmware interface is basically the same, the way to
invoke it differs. Abstract all firmware calls under a layer that will
allow us to handle both firmware types transparently.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  47 ++----
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   5 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  46 ++---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 157 ++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  36 ++++
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
 .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |   2 +
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  10 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  15 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   8 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |   2 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  15 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   5 +-
 23 files changed, 274 insertions(+), 100 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 5dc588897d01..a9e189af5ba4 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -13,7 +13,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_pm.o \
-
+		mtk_vcodec_fw.o
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
@@ -26,5 +26,3 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o\
-
-ccflags-y += -I$(srctree)/drivers/media/platform/mtk-vpu
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index eefc1a5ee64a..f6494f584354 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -20,7 +20,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 
 #define VDEC_HW_ACTIVE	0x10
 #define VDEC_IRQ_CFG	0x11
@@ -77,22 +77,6 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static void mtk_vcodec_dec_reset_handler(void *priv)
-{
-	struct mtk_vcodec_dev *dev = priv;
-	struct mtk_vcodec_ctx *ctx;
-
-	mtk_v4l2_err("Watchdog timeout!!");
-
-	mutex_lock(&dev->dev_mutex);
-	list_for_each_entry(ctx, &dev->ctx_list, list) {
-		ctx->state = MTK_STATE_ABORT;
-		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ERROR",
-				ctx->id);
-	}
-	mutex_unlock(&dev->dev_mutex);
-}
-
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -144,21 +128,20 @@ static int fops_vcodec_open(struct file *file)
 	if (v4l2_fh_is_singular(&ctx->fh)) {
 		mtk_vcodec_dec_pw_on(&dev->pm);
 		/*
-		 * vpu_load_firmware checks if it was loaded already and
-		 * does nothing in that case
+		 * Does nothing if firmware was already loaded.
 		 */
-		ret = vpu_load_firmware(dev->vpu_plat_dev);
+		ret = mtk_vcodec_fw_load_firmware(dev->fw_handler);
 		if (ret < 0) {
 			/*
 			 * Return 0 if downloading firmware successfully,
 			 * otherwise it is failed
 			 */
-			mtk_v4l2_err("vpu_load_firmware failed!");
+			mtk_v4l2_err("failed to load firmware!");
 			goto err_load_fw;
 		}
 
 		dev->dec_capability =
-			vpu_get_vdec_hw_capa(dev->vpu_plat_dev);
+			mtk_vcodec_fw_get_vdec_capa(dev->fw_handler);
 		mtk_v4l2_debug(0, "decoder capability %x", dev->dec_capability);
 	}
 
@@ -228,6 +211,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_dec;
 	struct resource *res;
+	phandle rproc_phandle;
+	enum mtk_vcodec_fw_type fw_type;
 	int i, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -237,14 +222,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
-	dev->vpu_plat_dev = vpu_get_plat_device(dev->plat_dev);
-	if (dev->vpu_plat_dev == NULL) {
-		mtk_v4l2_err("[VPU] vpu device in not ready");
-		return -EPROBE_DEFER;
+	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
+	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
+				  &rproc_phandle)) {
+		fw_type = VPU;
+	} else {
+		mtk_v4l2_err("Could not get vdec IPI device");
+		return -ENODEV;
 	}
-
-	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_dec_reset_handler,
-			dev, VPU_RST_DEC);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, rproc_phandle,
+					       VPU_RST_DEC);
+	if (IS_ERR(dev->fw_handler))
+		return PTR_ERR(dev->fw_handler);
 
 	ret = mtk_vcodec_init_dec_pm(dev);
 	if (ret < 0) {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 5a6ec8fb52da..36dfe3fc056a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -12,7 +12,6 @@
 
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
 
 int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index fc99f686faa9..ae7e13b3431f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -356,7 +356,6 @@ struct mtk_vcodec_dec_pdata {
  * @m2m_dev_dec: m2m device for decoder
  * @m2m_dev_enc: m2m device for encoder.
  * @plat_dev: platform device
- * @vpu_plat_dev: mtk vpu platform device
  * @ctx_list: list of struct mtk_vcodec_ctx
  * @irqlock: protect data access by irq handler and work thread
  * @curr_ctx: The context that is waiting for codec hardware
@@ -364,6 +363,7 @@ struct mtk_vcodec_dec_pdata {
  * @reg_base: Mapped address of MTK Vcodec registers.
  * @vdec_pdata: Current arch private data.
  *
+ * @fw_handler: used to communicate with the firmware.
  * @id_counter: used to identify current opened instance
  *
  * @encode_workqueue: encode work queue
@@ -392,13 +392,14 @@ struct mtk_vcodec_dev {
 	struct v4l2_m2m_dev *m2m_dev_dec;
 	struct v4l2_m2m_dev *m2m_dev_enc;
 	struct platform_device *plat_dev;
-	struct platform_device *vpu_plat_dev;
 	struct list_head ctx_list;
 	spinlock_t irqlock;
 	struct mtk_vcodec_ctx *curr_ctx;
 	void __iomem *reg_base[NUM_MAX_VCODEC_REG_BASE];
 	const struct mtk_vcodec_dec_pdata *vdec_pdata;
 
+	struct mtk_vcodec_fw *fw_handler;
+
 	unsigned long id_counter;
 
 	struct workqueue_struct *decode_workqueue;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 1d82aa2b6017..6a2ae909d36b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -21,7 +21,7 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 
 module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
 module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
@@ -101,22 +101,6 @@ static irqreturn_t mtk_vcodec_enc_lt_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static void mtk_vcodec_enc_reset_handler(void *priv)
-{
-	struct mtk_vcodec_dev *dev = priv;
-	struct mtk_vcodec_ctx *ctx;
-
-	mtk_v4l2_debug(0, "Watchdog timeout!!");
-
-	mutex_lock(&dev->dev_mutex);
-	list_for_each_entry(ctx, &dev->ctx_list, list) {
-		ctx->state = MTK_STATE_ABORT;
-		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
-				ctx->id);
-	}
-	mutex_unlock(&dev->dev_mutex);
-}
-
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -159,10 +143,10 @@ static int fops_vcodec_open(struct file *file)
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
 		/*
-		 * vpu_load_firmware checks if it was loaded already and
+		 * load fireware to checks if it was loaded already and
 		 * does nothing in that case
 		 */
-		ret = vpu_load_firmware(dev->vpu_plat_dev);
+		ret = mtk_vcodec_fw_load_firmware(dev->fw_handler);
 		if (ret < 0) {
 			/*
 			 * Return 0 if downloading firmware successfully,
@@ -172,8 +156,8 @@ static int fops_vcodec_open(struct file *file)
 			goto err_load_fw;
 		}
 
-		dev->enc_capability =
-			vpu_get_venc_hw_capa(dev->vpu_plat_dev);
+		dev->dec_capability =
+			mtk_vcodec_fw_get_venc_capa(dev->fw_handler);
 		mtk_v4l2_debug(0, "encoder capability %x", dev->enc_capability);
 	}
 
@@ -235,6 +219,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_enc;
 	struct resource *res;
+	phandle rproc_phandle;
+	enum mtk_vcodec_fw_type fw_type;
 	int i, j, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -244,14 +230,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
-	dev->vpu_plat_dev = vpu_get_plat_device(dev->plat_dev);
-	if (dev->vpu_plat_dev == NULL) {
-		mtk_v4l2_err("[VPU] vpu device in not ready");
-		return -EPROBE_DEFER;
+	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
+	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
+				  &rproc_phandle)) {
+		fw_type = VPU;
+	} else {
+		mtk_v4l2_err("Could not get vdec IPI device");
+		return -ENODEV;
 	}
-
-	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset_handler,
-				dev, VPU_RST_ENC);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, rproc_phandle,
+					       VPU_RST_ENC);
+	if (dev->fw_handler == NULL)
+		return -EINVAL;
 
 	ret = mtk_vcodec_init_enc_pm(dev);
 	if (ret < 0) {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 3e2bfded79a6..ee22902aaa71 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -12,8 +12,6 @@
 
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
-
 
 int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
new file mode 100644
index 000000000000..a4361f57aedc
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "mtk_vcodec_fw.h"
+#include "mtk_vcodec_util.h"
+#include "mtk_vcodec_drv.h"
+
+struct mtk_vcodec_fw_ops {
+	int (*load_firmware)(struct mtk_vcodec_fw *fw);
+	unsigned int (*get_vdec_capa)(struct mtk_vcodec_fw *fw);
+	unsigned int (*get_venc_capa)(struct mtk_vcodec_fw *fw);
+	void * (*map_dm_addr)(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr);
+	int (*ipi_register)(struct mtk_vcodec_fw *fw, int id,
+		mtk_vcodec_ipi_handler handler, const char *name, void *priv);
+	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
+		unsigned int len, unsigned int wait);
+};
+
+struct mtk_vcodec_fw {
+	const struct mtk_vcodec_fw_ops *ops;
+	struct platform_device *pdev;
+	struct rproc *rproc;
+};
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
+		mtk_vcodec_ipi_handler handler, const char *name, void *priv)
+{
+	return vpu_ipi_register(fw->pdev, id, handler, name, priv);
+}
+
+static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+		unsigned int len, unsigned int wait)
+{
+	return vpu_ipi_send(fw->pdev, id, buf, len);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
+	.load_firmware = mtk_vcodec_vpu_load_firmware,
+	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_vpu_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
+	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
+	.ipi_send = mtk_vcodec_vpu_ipi_send,
+};
+
+static void mtk_vcodec_reset_handler(void *priv)
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
+				ctx->id);
+	}
+	mutex_unlock(&dev->dev_mutex);
+}
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
+					   enum mtk_vcodec_fw_type type,
+					   phandle rproc_phandle,
+					   enum rst_id rst_id)
+{
+	const struct mtk_vcodec_fw_ops *ops;
+	struct mtk_vcodec_fw *fw;
+	struct platform_device *fw_pdev;
+	struct rproc *rproc = NULL;
+
+	switch (type) {
+	case VPU:
+		ops = &mtk_vcodec_vpu_msg;
+		fw_pdev = vpu_get_plat_device(dev->plat_dev);
+		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
+				    dev, rst_id);
+		break;
+	default:
+		mtk_v4l2_err("invalid vcodec fw type");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!fw_pdev) {
+		mtk_v4l2_err("firmware device is not ready");
+		return ERR_PTR(-EINVAL);
+	}
+
+	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-EINVAL);
+
+	fw->ops = ops;
+	fw->pdev = fw_pdev;
+	fw->rproc = rproc;
+
+	return fw;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
+
+int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->load_firmware(fw);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_load_firmware);
+
+unsigned int mtk_vcodec_fw_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_vdec_capa(fw);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_vdec_capa);
+
+unsigned int mtk_vcodec_fw_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_venc_capa(fw);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_venc_capa);
+
+void *mtk_vcodec_fw_map_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_addr)
+{
+	return fw->ops->map_dm_addr(fw, mem_addr);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_map_dm_addr);
+
+int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
+	mtk_vcodec_ipi_handler handler, const char *name, void *priv)
+{
+	return fw->ops->ipi_register(fw, id, handler, name, priv);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_ipi_register);
+
+int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw,
+	int id, void *buf, unsigned int len, unsigned int wait)
+{
+	return fw->ops->ipi_send(fw, id, buf, len, wait);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_ipi_send);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
new file mode 100644
index 000000000000..a6edb3858e6e
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MTK_VCODEC_FW_H_
+#define _MTK_VCODEC_FW_H_
+
+#include <linux/remoteproc.h>
+
+#include "../mtk-vpu/mtk_vpu.h"
+
+struct mtk_vcodec_dev;
+
+enum mtk_vcodec_fw_type {
+	VPU,
+};
+
+struct mtk_vcodec_fw;
+
+typedef void (*mtk_vcodec_ipi_handler) (void *data,
+	unsigned int len, void *priv);
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
+					   enum mtk_vcodec_fw_type type,
+					   phandle rproc_phandle,
+					   enum rst_id rst_id);
+
+int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw);
+unsigned int mtk_vcodec_fw_get_vdec_capa(struct mtk_vcodec_fw *fw);
+unsigned int mtk_vcodec_fw_get_venc_capa(struct mtk_vcodec_fw *fw);
+void *mtk_vcodec_fw_map_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_addr);
+int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
+	mtk_vcodec_ipi_handler handler, const char *name, void *priv);
+int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw,
+	int id, void *buf, unsigned int len, unsigned int wait);
+
+#endif /* _MTK_VCODEC_FW_H_ */
+
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
index d48f542db1a9..ac5973b6735f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -9,7 +9,6 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
 
 /* For encoder, this will enable logs in venc/*/
 bool mtk_vcodec_dbg;
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 50048c170b99..40d6e6c5ac7a 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -281,7 +281,6 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 
 	inst->vpu.id = IPI_VDEC_H264;
-	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
 
 	err = vpu_dec_init(&inst->vpu);
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index 6011fdd60a22..e5393f841080 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -400,7 +400,6 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 
 	inst->vpu.id = IPI_VDEC_VP8;
-	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
 
 	err = vpu_dec_init(&inst->vpu);
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 24c1f0bf2147..3cab4dacf8ab 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -791,7 +791,6 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 
 	inst->vpu.id = IPI_VDEC_VP9;
-	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
 
 	if (vpu_dec_init(&inst->vpu)) {
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
index ceb4db4cb3be..e913f963b7db 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
@@ -7,8 +7,6 @@
 #ifndef _VDEC_DRV_BASE_
 #define _VDEC_DRV_BASE_
 
-#include "mtk_vcodec_drv.h"
-
 #include "vdec_drv_if.h"
 
 struct vdec_common_if {
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 2e43dd4486e0..b18743b906ea 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -13,7 +13,6 @@
 #include "mtk_vcodec_dec.h"
 #include "vdec_drv_base.h"
 #include "mtk_vcodec_dec_pm.h"
-#include "mtk_vpu.h"
 
 int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index eb66729fda63..96cf22a89d72 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -7,6 +7,8 @@
 #ifndef _VDEC_IPI_MSG_H_
 #define _VDEC_IPI_MSG_H_
 
+#include "linux/types.h"
+
 /**
  * enum vdec_ipi_msgid - message id between AP and VPU
  * @AP_IPIMSG_XXX	: AP to VPU cmd message id
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index cc963c813654..23b119f5b14b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -8,6 +8,7 @@
 #include "mtk_vcodec_util.h"
 #include "vdec_ipi_msg.h"
 #include "vdec_vpu_if.h"
+#include "mtk_vcodec_fw.h"
 
 static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
 {
@@ -18,7 +19,8 @@ static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
 
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
-	vpu->vsi = vpu_mapping_dm_addr(vpu->dev, msg->vpu_inst_addr);
+	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
+					     msg->vpu_inst_addr);
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
@@ -91,7 +93,8 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 	vpu->failure = 0;
 	vpu->signaled = 0;
 
-	err = vpu_ipi_send(vpu->dev, vpu->id, msg, len);
+	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
+				     len, 2000);
 	if (err) {
 		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
 			       vpu->id, *(uint32_t *)msg, err);
@@ -127,7 +130,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	init_waitqueue_head(&vpu->wq);
 	vpu->handler = vpu_dec_ipi_handler;
 
-	err = vpu_ipi_register(vpu->dev, vpu->id, vpu->handler, "vdec", NULL);
+	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
+					 vpu->handler, "vdec", NULL);
 	if (err != 0) {
 		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
 		return err;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index f779b0676fbd..a5c65abb3936 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -7,11 +7,13 @@
 #ifndef _VDEC_VPU_IF_H_
 #define _VDEC_VPU_IF_H_
 
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
+
+struct mtk_vcodec_ctx;
 
 /**
  * struct vdec_vpu_inst - VPU instance for video codec
- * @ipi_id      : ipi id for each decoder
+ * @id      : ipi msg id for each decoder
  * @vsi         : driver structure allocated by VPU side and shared to AP side
  *                for control and info share
  * @failure     : VPU execution result status, 0: success, others: fail
@@ -23,15 +25,14 @@
  * @handler     : ipi handler for each decoder
  */
 struct vdec_vpu_inst {
-	enum ipi_id id;
+	int id;
 	void *vsi;
 	int32_t failure;
 	uint32_t inst_addr;
 	unsigned int signaled;
 	struct mtk_vcodec_ctx *ctx;
-	struct platform_device *dev;
 	wait_queue_head_t wq;
-	ipi_handler_t handler;
+	mtk_vcodec_ipi_handler handler;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b9624f8df0e9..7a00f050ec36 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -18,7 +18,6 @@
 #include "../venc_drv_base.h"
 #include "../venc_ipi_msg.h"
 #include "../venc_vpu_if.h"
-#include "mtk_vpu.h"
 
 static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
 
@@ -257,8 +256,11 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst)
 		 */
 		inst->work_bufs[i].size = wb[i].size;
 		if (i == VENC_H264_VPU_WORK_BUF_SKIP_FRAME) {
-			inst->work_bufs[i].va = vpu_mapping_dm_addr(
-				inst->vpu_inst.dev, wb[i].vpua);
+			struct mtk_vcodec_fw *handler;
+
+			handler = inst->vpu_inst.ctx->dev->fw_handler;
+			inst->work_bufs[i].va =
+				mtk_vcodec_fw_map_dm_addr(handler, wb[i].vpua);
 			inst->work_bufs[i].dma_addr = 0;
 		} else {
 			ret = mtk_vcodec_mem_alloc(inst->ctx,
@@ -275,10 +277,12 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst)
 			 * setting in VPU side.
 			 */
 			if (i == VENC_H264_VPU_WORK_BUF_RC_CODE) {
+				struct mtk_vcodec_fw *handler;
 				void *tmp_va;
 
-				tmp_va = vpu_mapping_dm_addr(inst->vpu_inst.dev,
-							     wb[i].vpua);
+				handler = inst->vpu_inst.ctx->dev->fw_handler;
+				tmp_va = mtk_vcodec_fw_map_dm_addr(handler,
+								   wb[i].vpua);
 				memcpy(inst->work_bufs[i].va, tmp_va,
 				       wb[i].size);
 			}
@@ -469,7 +473,6 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu_inst.id = IPI_VENC_H264;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8d36f0362efe..6426af514526 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -17,7 +17,6 @@
 #include "../venc_drv_base.h"
 #include "../venc_ipi_msg.h"
 #include "../venc_vpu_if.h"
-#include "mtk_vpu.h"
 
 #define VENC_BITSTREAM_FRAME_SIZE 0x0098
 #define VENC_BITSTREAM_HEADER_LEN 0x00e8
@@ -190,10 +189,12 @@ static int vp8_enc_alloc_work_buf(struct venc_vp8_inst *inst)
 		if (i == VENC_VP8_VPU_WORK_BUF_RC_CODE ||
 		    i == VENC_VP8_VPU_WORK_BUF_RC_CODE2 ||
 		    i == VENC_VP8_VPU_WORK_BUF_RC_CODE3) {
+			struct mtk_vcodec_fw *handler;
 			void *tmp_va;
 
-			tmp_va = vpu_mapping_dm_addr(inst->vpu_inst.dev,
-						     wb[i].vpua);
+			handler = inst->vpu_inst.ctx->dev->fw_handler;
+			tmp_va = mtk_vcodec_fw_map_dm_addr(handler,
+							   wb[i].vpua);
 			memcpy(inst->work_bufs[i].va, tmp_va, wb[i].size);
 		}
 		wb[i].iova = inst->work_bufs[i].dma_addr;
@@ -334,7 +335,6 @@ static int vp8_enc_init(struct mtk_vcodec_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu_inst.id = IPI_VENC_VP8;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_LT_SYS);
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index c6bb82ac2dcd..ce0bce811615 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -15,7 +15,6 @@
 
 #include "mtk_vcodec_enc.h"
 #include "mtk_vcodec_enc_pm.h"
-#include "mtk_vpu.h"
 
 int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
index 28ee04ca6241..6ce9d25ac239 100644
--- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
@@ -9,6 +9,8 @@
 #ifndef _VENC_IPI_MSG_H_
 #define _VENC_IPI_MSG_H_
 
+#include "linux/types.h"
+
 #define AP_IPIMSG_VENC_BASE 0xC000
 #define VPU_IPIMSG_VENC_BASE 0xD000
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 3e931b0ed096..2013ea53bb06 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -4,7 +4,7 @@
  * Author: PoChun Lin <pochun.lin@mediatek.com>
  */
 
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
@@ -13,7 +13,8 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, void *data)
 	struct venc_vpu_ipi_msg_init *msg = data;
 
 	vpu->inst_addr = msg->vpu_inst_addr;
-	vpu->vsi = vpu_mapping_dm_addr(vpu->dev, msg->vpu_inst_addr);
+	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
+					     msg->vpu_inst_addr);
 }
 
 static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, void *data)
@@ -63,12 +64,13 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 
 	mtk_vcodec_debug_enter(vpu);
 
-	if (!vpu->dev) {
+	if (!vpu->ctx->dev->fw_handler) {
 		mtk_vcodec_err(vpu, "inst dev is NULL");
 		return -EINVAL;
 	}
 
-	status = vpu_ipi_send(vpu->dev, vpu->id, msg, len);
+	status = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
+					len, 2000);
 	if (status) {
 		mtk_vcodec_err(vpu, "vpu_ipi_send msg_id %x len %d fail %d",
 			       *(uint32_t *)msg, len, status);
@@ -93,8 +95,9 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	vpu->signaled = 0;
 	vpu->failure = 0;
 
-	status = vpu_ipi_register(vpu->dev, vpu->id, vpu_enc_ipi_handler,
-				  NULL, NULL);
+	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
+		vpu_enc_ipi_handler, "venc", NULL);
+
 	if (status) {
 		mtk_vcodec_err(vpu, "vpu_ipi_register fail %d", status);
 		return -EINVAL;
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
index ba301a138a5a..edd411621b68 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
@@ -7,7 +7,7 @@
 #ifndef _VENC_VPU_IF_H_
 #define _VENC_VPU_IF_H_
 
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 #include "venc_drv_if.h"
 
 /*
@@ -34,9 +34,8 @@ struct venc_vpu_inst {
 	int is_key_frm;
 	unsigned int inst_addr;
 	void *vsi;
-	enum ipi_id id;
+	int id;
 	struct mtk_vcodec_ctx *ctx;
-	struct platform_device *dev;
 };
 
 int vpu_enc_init(struct venc_vpu_inst *vpu);
-- 
2.23.0.187.g17f5b7556c-goog

