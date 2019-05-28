Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914BB2BEE7
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbfE1F6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:58:06 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42132 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727641AbfE1F5c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:32 -0400
Received: by mail-pl1-f194.google.com with SMTP id go2so7848790plb.9
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wvm5TZVF6H4ZmP2o4n7m3gtlQQfxmtysiZqDlPf5770=;
        b=lEVJzzWgCx/rPOFNRj5Jse7lGqlKoULKoWt/Evci3o1Vfvhk4BN1gEwr9C49vaJf4M
         DMh+SZC5sTKdOUJjkTGyTB3SQyaZAh7Mj8wApsxwUowgalxIuWH3JaJqMiennQpmFNSH
         Vc0tCX9LZ5K6Y34vW5yVZpYFHRfGirGpD3fG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wvm5TZVF6H4ZmP2o4n7m3gtlQQfxmtysiZqDlPf5770=;
        b=YW67rvUCRyF07FxR7ZwoWEunDI7ERWL2GKQIb8vOCbb/qwdL2IJNQAid7oiDUp9r9o
         CiP+x9ZkXg/Tcq/j8OLe38XTwin44xyg9i/21GGD0WssN1yp42h3Hb55c5Tn91EG2Jxb
         vh6YSRfEwffujbaJ5L4SSP1Bv0WM9WK4ZxYzq5kIW/pnZqBwn/S9+8sLZu0da32FL20N
         mO/fOVk/1Y+tqTBPZcu5FaK88iD15hLB+AMemdX/0y1ncwCbwyquxQUNkK7KbviaK4SG
         /QlMA4kcvtHnIDzhhaMl1jAO14Fz/eL1E9qjn5uPImg8eN/8TQKkR9GGMs9LVQwooAma
         V1rw==
X-Gm-Message-State: APjAAAVbGjpzN5i5b4x5V7q0SmPGX4ZaGEJlckJmGTNQhyjIlSYV4mRz
        nYgt026ACTGtzvAThmmxJn5yDQ==
X-Google-Smtp-Source: APXvYqyUvJdntjyw/nBE1azi8843akLWyFFlkS37aCbxO23WRwZx8/1ln4LZgq4S1eJpcGJVqnvcjw==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr134046105pla.235.1559023050623;
        Mon, 27 May 2019 22:57:30 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:29 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 07/12] media: mtk-vcodec: abstract firmware interface
Date:   Tue, 28 May 2019 14:56:30 +0900
Message-Id: <20190528055635.12109-8-acourbot@chromium.org>
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

MT8183's codec firwmare is run by a different remote processor from
MT8173. While the firmware interface is basically the same, the way to
invoke it differs. Abstract all firmware calls under a layer that will
allow us to handle both firmware types transparently.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]
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
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  10 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  15 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   8 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  15 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   5 +-
 21 files changed, 270 insertions(+), 100 deletions(-)
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
index 5a31917da18c..2328bb9580be 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -28,7 +28,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 
 #define VDEC_HW_ACTIVE	0x10
 #define VDEC_IRQ_CFG	0x11
@@ -85,22 +85,6 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
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
@@ -152,21 +136,20 @@ static int fops_vcodec_open(struct file *file)
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
 
@@ -236,6 +219,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_dec;
 	struct resource *res;
+	phandle rproc_phandle;
+	enum mtk_vcodec_fw_type fw_type;
 	int i, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -245,14 +230,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
index 7884465afcd2..341706f49f7b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -20,7 +20,6 @@
 
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
 
 int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 03ce5d05f58c..015a86796110 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -355,7 +355,6 @@ struct mtk_vcodec_dec_pdata {
  * @m2m_dev_dec: m2m device for decoder
  * @m2m_dev_enc: m2m device for encoder.
  * @plat_dev: platform device
- * @vpu_plat_dev: mtk vpu platform device
  * @ctx_list: list of struct mtk_vcodec_ctx
  * @irqlock: protect data access by irq handler and work thread
  * @curr_ctx: The context that is waiting for codec hardware
@@ -363,6 +362,7 @@ struct mtk_vcodec_dec_pdata {
  * @reg_base: Mapped address of MTK Vcodec registers.
  * @vdec_pdata: Current arch private data.
  *
+ * @fw_handler: used to communicate with the firmware.
  * @id_counter: used to identify current opened instance
  *
  * @encode_workqueue: encode work queue
@@ -391,13 +391,14 @@ struct mtk_vcodec_dev {
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
index 83f859e8509c..598d4bb86e35 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -29,7 +29,7 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 
 module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
 module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
@@ -109,22 +109,6 @@ static irqreturn_t mtk_vcodec_enc_lt_irq_handler(int irq, void *priv)
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
@@ -167,10 +151,10 @@ static int fops_vcodec_open(struct file *file)
 
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
@@ -180,8 +164,8 @@ static int fops_vcodec_open(struct file *file)
 			goto err_load_fw;
 		}
 
-		dev->enc_capability =
-			vpu_get_venc_hw_capa(dev->vpu_plat_dev);
+		dev->dec_capability =
+			mtk_vcodec_fw_get_venc_capa(dev->fw_handler);
 		mtk_v4l2_debug(0, "encoder capability %x", dev->enc_capability);
 	}
 
@@ -243,6 +227,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_enc;
 	struct resource *res;
+	phandle rproc_phandle;
+	enum mtk_vcodec_fw_type fw_type;
 	int i, j, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -252,14 +238,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
index 2fdae50173be..2b7d650fc048 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -20,8 +20,6 @@
 
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
-
 
 int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
new file mode 100644
index 000000000000..49dbd623b448
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
+EXPORT_SYMBOL(mtk_vcodec_fw_select);
+
+int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->load_firmware(fw);
+}
+EXPORT_SYMBOL(mtk_vcodec_fw_load_firmware);
+
+unsigned int mtk_vcodec_fw_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_vdec_capa(fw);
+}
+EXPORT_SYMBOL(mtk_vcodec_fw_get_vdec_capa);
+
+unsigned int mtk_vcodec_fw_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return fw->ops->get_venc_capa(fw);
+}
+EXPORT_SYMBOL(mtk_vcodec_fw_get_venc_capa);
+
+void *mtk_vcodec_fw_map_dm_addr(struct mtk_vcodec_fw *fw, u32 mem_addr)
+{
+	return fw->ops->map_dm_addr(fw, mem_addr);
+}
+EXPORT_SYMBOL(mtk_vcodec_fw_map_dm_addr);
+
+int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw, int id,
+	mtk_vcodec_ipi_handler handler, const char *name, void *priv)
+{
+	return fw->ops->ipi_register(fw, id, handler, name, priv);
+}
+EXPORT_SYMBOL(mtk_vcodec_fw_ipi_register);
+
+int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw,
+	int id, void *buf, unsigned int len, unsigned int wait)
+{
+	return fw->ops->ipi_send(fw, id, buf, len, wait);
+}
+EXPORT_SYMBOL(mtk_vcodec_fw_ipi_send);
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
index 060c0ad6243a..2cc37b2f8674 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -17,7 +17,6 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
-#include "mtk_vpu.h"
 
 /* For encoder, this will enable logs in venc/*/
 bool mtk_vcodec_dbg;
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 185d8e7bdc87..e96576280996 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -286,7 +286,6 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 
 	inst->vpu.id = IPI_VDEC_H264;
-	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
 	inst->vpu.handler = vpu_dec_ipi_handler;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index 28475b8d27fe..241756382891 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -408,7 +408,6 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 
 	inst->vpu.id = IPI_VDEC_VP8;
-	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
 	inst->vpu.handler = vpu_dec_ipi_handler;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index f4af69c543ba..78f5d8ebc1bb 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -799,7 +799,6 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
 	inst->ctx = ctx;
 
 	inst->vpu.id = IPI_VDEC_VP9;
-	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
 	inst->vpu.handler = vpu_dec_ipi_handler;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
index bf4c214506fe..e47766d187dc 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
@@ -15,8 +15,6 @@
 #ifndef _VDEC_DRV_BASE_
 #define _VDEC_DRV_BASE_
 
-#include "mtk_vcodec_drv.h"
-
 #include "vdec_drv_if.h"
 
 struct vdec_common_if {
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index dfe63bb39dbb..7e3c536909a2 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -21,7 +21,6 @@
 #include "mtk_vcodec_dec.h"
 #include "vdec_drv_base.h"
 #include "mtk_vcodec_dec_pm.h"
-#include "mtk_vpu.h"
 
 extern const struct vdec_common_if vdec_h264_if;
 extern const struct vdec_common_if vdec_vp8_if;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 1abd14e79565..56947de97ac7 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -16,6 +16,7 @@
 #include "mtk_vcodec_util.h"
 #include "vdec_ipi_msg.h"
 #include "vdec_vpu_if.h"
+#include "mtk_vcodec_fw.h"
 
 static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
 {
@@ -26,7 +27,8 @@ static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
 
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
-	vpu->vsi = vpu_mapping_dm_addr(vpu->dev, msg->vpu_inst_addr);
+	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
+					     msg->vpu_inst_addr);
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
@@ -76,7 +78,8 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 	vpu->failure = 0;
 	vpu->signaled = 0;
 
-	err = vpu_ipi_send(vpu->dev, vpu->id, msg, len);
+	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
+				     len, 2000);
 	if (err) {
 		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
 			       vpu->id, *(uint32_t *)msg, err);
@@ -111,7 +114,8 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 	init_waitqueue_head(&vpu->wq);
 
-	err = vpu_ipi_register(vpu->dev, vpu->id, vpu->handler, "vdec", NULL);
+	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
+					 vpu->handler, "vdec", NULL);
 	if (err != 0) {
 		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
 		return err;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index 79d8eac7f5e2..0c48003718a4 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -15,11 +15,13 @@
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
@@ -31,15 +33,14 @@
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
index eb015ce0fd3e..84e0e5a6e150 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -27,7 +27,6 @@
 #include "../venc_drv_base.h"
 #include "../venc_ipi_msg.h"
 #include "../venc_vpu_if.h"
-#include "mtk_vpu.h"
 
 static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
 
@@ -266,8 +265,11 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst)
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
@@ -284,10 +286,12 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst)
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
@@ -478,7 +482,6 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu_inst.id = IPI_VENC_H264;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index ad8008c865db..935ae7d68909 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -26,7 +26,6 @@
 #include "../venc_drv_base.h"
 #include "../venc_ipi_msg.h"
 #include "../venc_vpu_if.h"
-#include "mtk_vpu.h"
 
 #define VENC_BITSTREAM_FRAME_SIZE 0x0098
 #define VENC_BITSTREAM_HEADER_LEN 0x00e8
@@ -199,10 +198,12 @@ static int vp8_enc_alloc_work_buf(struct venc_vp8_inst *inst)
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
@@ -343,7 +344,6 @@ static int vp8_enc_init(struct mtk_vcodec_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu_inst.id = IPI_VENC_VP8;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_LT_SYS);
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index 94bb530f7d2d..fd9bdd6a35e8 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -24,7 +24,6 @@
 
 #include "mtk_vcodec_enc.h"
 #include "mtk_vcodec_enc_pm.h"
-#include "mtk_vpu.h"
 
 extern const struct venc_common_if venc_h264_if;
 extern const struct venc_common_if venc_vp8_if;
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 0d882acf8830..3d963afffd77 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  */
 
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
@@ -22,7 +22,8 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, void *data)
 	struct venc_vpu_ipi_msg_init *msg = data;
 
 	vpu->inst_addr = msg->vpu_inst_addr;
-	vpu->vsi = vpu_mapping_dm_addr(vpu->dev, msg->vpu_inst_addr);
+	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
+					     msg->vpu_inst_addr);
 }
 
 static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, void *data)
@@ -72,12 +73,13 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 
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
@@ -102,8 +104,9 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
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
index 215d1e01362e..dca2e7271a01 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
@@ -16,7 +16,7 @@
 #ifndef _VENC_VPU_IF_H_
 #define _VENC_VPU_IF_H_
 
-#include "mtk_vpu.h"
+#include "mtk_vcodec_fw.h"
 #include "venc_drv_if.h"
 
 /*
@@ -43,9 +43,8 @@ struct venc_vpu_inst {
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
2.22.0.rc1.257.g3120a18244-goog

