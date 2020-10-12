Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EE528C387
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731883AbgJLU7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731697AbgJLU67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A84C0613D5;
        Mon, 12 Oct 2020 13:58:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 921D81F44C3F
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] media: hantro: add initial MMIO regmap infrastructure
Date:   Mon, 12 Oct 2020 23:59:47 +0300
Message-Id: <20201012205957.889185-9-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This creates regmaps on top of the memory mapped regions for encoders
and decoders and converts the helpers in hantro.h to do their R/W via
these regmaps.

In itself this indirection layer is quite useless, but the key is the
field API also initialized using the regmaps which is currently empty.

Further changes can define any necessary regmap field APIs for various
HW revisions like G1, G2 or configure the fields for different HW reg
layouts to support newer HW revisions like VC8000D.

No regmap is defined for the ctrl registers of imx8m because their
usage is very simple and there is no known register layout divergence.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/Makefile        |   1 +
 drivers/staging/media/hantro/hantro.h        |  35 +++--
 drivers/staging/media/hantro/hantro_drv.c    |  15 +-
 drivers/staging/media/hantro/hantro_regmap.c | 144 +++++++++++++++++++
 drivers/staging/media/hantro/hantro_regmap.h |  23 +++
 5 files changed, 206 insertions(+), 12 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_regmap.c
 create mode 100644 drivers/staging/media/hantro/hantro_regmap.h

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 743ce08eb184..52bc0ee73569 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -9,6 +9,7 @@ hantro-vpu-y += \
 		hantro_h1_jpeg_enc.o \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
+		hantro_regmap.o \
 		hantro_g1_vp8_dec.o \
 		rk3399_vpu_hw_jpeg_enc.o \
 		rk3399_vpu_hw_mpeg2_dec.o \
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 2dd4362d4080..c5425cd5ac84 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -28,6 +29,8 @@
 
 struct hantro_ctx;
 struct hantro_codec_ops;
+struct hantro_regmap_dec_fields;
+struct hantro_regmap_enc_fields;
 
 #define HANTRO_JPEG_ENCODER	BIT(0)
 #define HANTRO_ENCODERS		0x0000ffff
@@ -165,8 +168,12 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			dev_ macros.
  * @clocks:		Array of clock handles.
  * @reg_bases:		Mapped addresses of VPU registers.
- * @enc_base:		Mapped address of VPU encoder register for convenience.
- * @dec_base:		Mapped address of VPU decoder register for convenience.
+ * @regs_enc:		MMIO regmap of VPU encoder block for convenience.
+ * @regs_dec:		MMIO regmap of VPU decoder block for convenience.
+ * @reg_fields_dec:	Decoder regfields inside above regamp region.
+ * @reg_fields_enc:	Encoder regfields inside above regamp region.
+ * @core_hw_dec_rev	Runtime detected HW decoder core revision.
+ * @core_hw_enc_rev	Runtime detected HW encoder core revision.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -184,8 +191,12 @@ struct hantro_dev {
 	struct clk_bulk_data *clocks;
 	struct reset_control *reset;
 	void __iomem **reg_bases;
-	void __iomem *enc_base;
-	void __iomem *dec_base;
+	struct regmap *regs_dec;
+	struct regmap *regs_enc;
+	struct hantro_regmap_fields_dec *reg_fields_dec;
+	struct hantro_regmap_fields_enc *reg_fields_enc;
+	u32 core_hw_dec_rev;
+	u32 core_hw_enc_rev;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
@@ -329,20 +340,22 @@ static inline void vepu_write_relaxed(struct hantro_dev *vpu,
 				      u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
-	writel_relaxed(val, vpu->enc_base + reg);
+	regmap_write(vpu->regs_enc, reg, val);
 }
 
 static inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
-	writel(val, vpu->enc_base + reg);
+	regmap_write(vpu->regs_enc, reg, val);
 }
 
 static inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
 {
-	u32 val = readl(vpu->enc_base + reg);
+	u32 val;
 
+	regmap_read(vpu->regs_enc, reg, &val);
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+
 	return val;
 }
 
@@ -350,20 +363,22 @@ static inline void vdpu_write_relaxed(struct hantro_dev *vpu,
 				      u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
-	writel_relaxed(val, vpu->dec_base + reg);
+	regmap_write(vpu->regs_dec, reg, val);
 }
 
 static inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
-	writel(val, vpu->dec_base + reg);
+	regmap_write(vpu->regs_dec, reg, val);
 }
 
 static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 {
-	u32 val = readl(vpu->dec_base + reg);
+	u32 val;
 
+	regmap_read(vpu->regs_dec, reg, &val);
 	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+
 	return val;
 }
 
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 3734efa80a7e..e225515d6985 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -28,6 +28,7 @@
 #include "hantro_v4l2.h"
 #include "hantro.h"
 #include "hantro_hw.h"
+#include "hantro_regmap.h"
 
 #define DRIVER_NAME "hantro-vpu"
 
@@ -782,8 +783,6 @@ static int hantro_probe(struct platform_device *pdev)
 		if (IS_ERR(vpu->reg_bases[i]))
 			return PTR_ERR(vpu->reg_bases[i]);
 	}
-	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
-	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
 
 	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
 	if (ret) {
@@ -829,6 +828,18 @@ static int hantro_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(vpu->dev);
 	pm_runtime_enable(vpu->dev);
 
+	ret = hantro_regmap_init_dec(vpu);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init decoder regmap\n");
+		goto err_clk_unprepare;
+	}
+
+	ret = hantro_regmap_init_enc(vpu);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init encoder regmap\n");
+		goto err_clk_unprepare;
+	}
+
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
diff --git a/drivers/staging/media/hantro/hantro_regmap.c b/drivers/staging/media/hantro/hantro_regmap.c
new file mode 100644
index 000000000000..890e443688e2
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_regmap.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2020 Collabora, Ltd.
+ *
+ */
+
+#include "hantro.h"
+#include "hantro_regmap.h"
+
+/**
+ * struct regmap_config - hantro regmap configuration, for now just a single cfg
+ * is used for all registers and fields, in the future this can be granularised
+ * to have different configs for eg enc, dec, pp, each with its own checks and
+ * valiations (bounds, read/write enforcement and so on)
+ */
+struct regmap_config hantro_regmap_dec = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	/* all hantro accesses are sequential, even with respect to irq ctx */
+	.disable_locking = true,
+	.name = "hantro_regmap_dec",
+};
+
+struct regmap_config hantro_regmap_enc = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.disable_locking = true,
+	.name = "hantro_regmap_enc",
+};
+
+struct hantro_field_enc {
+	/* TODO: populate encoder fields */
+};
+
+struct hantro_field_dec {
+	/* TODO: populate decoder fields */
+};
+
+#define INIT_FIELD_CFG(f, codec, conf) ({					\
+		vpu->reg_fields_##codec->(f) = devm_regmap_field_alloc(vpu->dev,\
+						     vpu->regs_##codec,		\
+						     field->(conf)); \
+	if (IS_ERR(vpu->reg_fields_##codec->f)) {				\
+		dev_warn(vpu->dev, "Couldn't create regmap field " #f "\n");	\
+		return PTR_ERR(vpu->reg_fields_##codec->f);			\
+	}})
+
+#define INIT_DEC_FIELD(f) INIT_FIELD_CFG(f, dec, cfg_##f)
+#define INIT_ENC_FIELD(f) INIT_FIELD_CFG(f, enc, cfg_##f)
+
+static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
+					 const struct hantro_field_dec *field)
+{
+	vpu->reg_fields_dec = devm_kzalloc(vpu->dev, sizeof(*vpu->reg_fields_dec),
+					   GFP_KERNEL);
+	if (!vpu->reg_fields_dec)
+		return -ENOMEM;
+
+	/* TODO: add decoder fields */
+
+	return 0;
+}
+
+static int hantro_regmap_fields_init_enc(struct hantro_dev *vpu,
+					 const struct hantro_field_enc *field)
+{
+	vpu->reg_fields_enc = devm_kzalloc(vpu->dev, sizeof(*vpu->reg_fields_enc),
+					   GFP_KERNEL);
+	if (!vpu->reg_fields_enc)
+		return -ENOMEM;
+
+	/* TODO: add encoder fields */
+
+	return 0;
+}
+
+int hantro_regmap_init_enc(struct hantro_dev *vpu)
+{
+	const struct hantro_field_enc *field = NULL;
+	void __iomem *enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
+	int ret;
+
+	if (!vpu->variant->enc_fmts)
+		return 0;
+
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret) {
+		dev_err(vpu->dev, "Failed to enable clocks\n");
+		return ret;
+	}
+
+	vpu->core_hw_enc_rev = (readl(enc_base) >> 16) & 0xffff;
+	vpu_debug(0, "Detected hantro encoder revision %x\n",
+		  vpu->core_hw_enc_rev);
+
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+
+	vpu->regs_enc = devm_regmap_init_mmio(vpu->dev, enc_base,
+					      &hantro_regmap_enc);
+	if (IS_ERR(vpu->regs_enc)) {
+		ret = PTR_ERR(vpu->regs_enc);
+		dev_err(vpu->dev, "Failed to create encoder regmap: %d\n", ret);
+		return ret;
+	}
+
+	return hantro_regmap_fields_init_enc(vpu, field);
+}
+
+int hantro_regmap_init_dec(struct hantro_dev *vpu)
+{
+	const struct hantro_field_dec *field = NULL;
+	void __iomem *dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
+	int ret;
+
+	if (!vpu->variant->dec_fmts)
+		return 0;
+
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret) {
+		dev_err(vpu->dev, "Failed to enable clocks\n");
+		return ret;
+	}
+
+	vpu->core_hw_dec_rev = (readl(dec_base) >> 16) & 0xffff;
+
+	vpu_debug(0, "Detected hantro decoder revision %x\n",
+		  vpu->core_hw_dec_rev);
+
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+
+	vpu->regs_dec = devm_regmap_init_mmio(vpu->dev, dec_base,
+					      &hantro_regmap_dec);
+	if (IS_ERR(vpu->regs_dec)) {
+		ret = PTR_ERR(vpu->regs_dec);
+		dev_err(vpu->dev, "Failed to create decoder regmap: %d\n", ret);
+		return ret;
+	}
+
+	return hantro_regmap_fields_init_dec(vpu, field);
+}
diff --git a/drivers/staging/media/hantro/hantro_regmap.h b/drivers/staging/media/hantro/hantro_regmap.h
new file mode 100644
index 000000000000..52668a8bafb9
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_regmap.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2020 Collabora, Ltd.
+ *
+ */
+
+#ifndef HANTRO_REGMAP_H_
+#define HANTRO_REGMAP_H_
+
+struct hantro_regmap_fields_dec {
+	/* TODO: populate decoder fields */
+};
+
+struct hantro_regmap_fields_enc {
+	/* TODO: populate encoder fields */
+};
+
+int hantro_regmap_init_dec(struct hantro_dev *vpu);
+int hantro_regmap_init_enc(struct hantro_dev *vpu);
+
+#endif /* HANTRO_REGMAP_H_ */
-- 
2.28.0

