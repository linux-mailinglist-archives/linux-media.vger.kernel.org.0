Return-Path: <linux-media+bounces-25142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A3A1932F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 15:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22703188B8D2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DAE2147F0;
	Wed, 22 Jan 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zxvh5qLo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0558D214219
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554363; cv=none; b=s5iRw6neN4ROgfgkWPL+rWXvgkQ77rv5U5mGtG+HjuL6uP3Kn0ePHXQ/hPt/XoGFweKnSaSln2lXXjF2l9BaAKc0ar89tK16S5ZqCmHnvXLw/xs0gKw/Pr+jjZmtD8Aw013tqHjKe5vomIlS2qNP0OHSiPeds1P6VOWNhWsF4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554363; c=relaxed/simple;
	bh=D7MUgZgJ/rhJSMOQiH251iHjTGoNHLHiVTUX401jrso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTFd6srqIZB7noQN+6GbnRHbYFGDyV43E3NeZ7jRQdz1BOTgn1ghj0x5gLhuDH5//nlvcKAQaoSsZzfMw5syu6oiQNF6DZe7E03s4vGGzH8iwGjcsB0waNY7T9ROCskFl+Oe8pxvljcDx9D2FYvjWs1QBBtlzkkQGvjkwAKUYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zxvh5qLo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso48705525e9.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554357; x=1738159157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T44veNog9J2nEpVU3c24VQ0/YXwQsPL29/fKx8aF67s=;
        b=Zxvh5qLoigesygreOP/dGdkDT40LSQoNowwSMY6KjSPKzxYLRDNsTkp8fX7zjg5tlq
         1R3hzjRzcCiuxJZCKjOKC0qbaWpX7nWvOw5eAYcmWrASikAVNbYiIXqi1mYLYTMFihsY
         P/h6l6Li4fBdR5ZpJwEPXQj694/6c/7W1YQaeBMQTYKO5LFNGb++SUqn5AY7Ys7wekmz
         /0ZAIFcGipsErJyBtuqS/rFqEfz2THl8d0Huna0gc3WBuNB/L7+k3A3xKqhPnw2WjFW3
         pz1culAjH5GPKSYBiyxl+uhumTAJI3F658nPPc5+7gKzzkftuHuTIBl4lyGLQCDs4D9o
         X8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554357; x=1738159157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T44veNog9J2nEpVU3c24VQ0/YXwQsPL29/fKx8aF67s=;
        b=wCpC+8lScCEGpzabkXcwHm891RKumRkmPQaKz7hTY3EOiBGRULbuQaHNeEPqHBgmyU
         M50hjOI+i8Yjyi9DlWdayo5s0qreylxKDSaKGrNfKmvDnoEw2uTRoMOnreCAoUenNYDL
         0e8mMNkssRFCEq/lmPPvfTL/rJPmgvIXCd42d3JH4LW08KMU26GSTG39leCRiD7Y3CW+
         RdoI4Woa+Qu9TAaWkgvQQb6UZM2e/vSb38dEFcl07hvEOyfFuQbeeRFMoRRMNvaioE5g
         h80tZ4OWj70iY94qKeemvDS2z3YbGaH8PmIasEdBgvVURCVx3pIeJARxRA9rl5CYM0I0
         mpRA==
X-Gm-Message-State: AOJu0YzTCwD2BnYV4GpDMiGpjnkUHE2L/gujkmP29XyWIWrqGWEsOcMJ
	GpWbKEQieulgZxt+tFv4VR7eZKVfMcylh5e0SZOGAlHgwRITkEM44+4a5SMGoSc=
X-Gm-Gg: ASbGncvU6fqn0ZrU3Kp38HWIzIokyAbmWylYXj2ElT6j1WzqzbT3NWH3rP1GO6QRoZ3
	2/pUTScUTCSyd0twQnsK8tGQwFeWJ3CA7VilfNquZiaFnmeuWVTAAdBeEz8EhPD0cPDX5Uf7ji+
	hKUdfk3PR39n+Q154zJcVkvA2DbeN8Rq/UGBZnh2Z3KIVJfEy+8sCyUwahaHKByY6F86X6LDAJd
	bBWCgWlC3lJN/y8cl+O7jFyoZh5oPByBzhN8VmJpTRi9t3ic/yp4kLlfAAfPHfav6ssGfX2zZOX
	b40FLGRFlujpiMfBPEU7FlIDd7k55k+ZyoB4FU4hNjj/S9lYuHG50RHmIfUlFv48
X-Google-Smtp-Source: AGHT+IEB4eHy8jzMDiTqf7izcgwbzRNMCEeoT2G4WRz4M73a6JeIwcKGouX/EP1R6M61I/I13+pmjQ==
X-Received: by 2002:a5d:584b:0:b0:38a:87cc:fbee with SMTP id ffacd0b85a97d-38bf568414bmr20458654f8f.14.1737554357006;
        Wed, 22 Jan 2025 05:59:17 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:16 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 14:59:13 +0100
Subject: [PATCH v8 4/5] media: platform: mediatek: isp: add mediatek ISP3.0
 camsv
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-4-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Phi-bang Nguyen <pnguyen@baylibre.com>, 
 Florian Sylvestre <fsylvestre@baylibre.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This driver provides a path to bypass the SoC ISP so that image data
coming from the SENINF can go directly into memory without any image
processing. This allows the use of an external ISP.

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
[Paul Elder fix irq locking]
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/media/platform/mediatek/isp/Kconfig        |   19 +
 drivers/media/platform/mediatek/isp/Makefile       |    4 +
 drivers/media/platform/mediatek/isp/mtk_camsv.h    |  152 +++
 drivers/media/platform/mediatek/isp/mtk_camsv_hw.c |  440 +++++++++
 drivers/media/platform/mediatek/isp/mtk_camsv_hw.h |   19 +
 .../media/platform/mediatek/isp/mtk_camsv_reg.h    |   90 ++
 .../media/platform/mediatek/isp/mtk_camsv_video.c  | 1017 ++++++++++++++++++++
 7 files changed, 1741 insertions(+)

diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/media/platform/mediatek/isp/Kconfig
index 2a3cef81d15aa12633ade2f3be0bba36b9af62e1..cbb3054736026c009b78db8e25bcccd2842dba90 100644
--- a/drivers/media/platform/mediatek/isp/Kconfig
+++ b/drivers/media/platform/mediatek/isp/Kconfig
@@ -1,4 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+config MTK_CAMSV
+	tristate "MediaTek ISP3.0 CAMSV driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	depends on PM
+	select MEDIA_CONTROLLER
+	select MTK_SENINF30
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	default n
+	help
+	  This driver provides a path to bypass the SoC ISP so that
+	  image data come from the SENINF can go directly into memory
+	  without any image processing.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mtk-camsv.
+
 config MTK_SENINF30
 	tristate "MediaTek ISP3.0 SENINF driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/media/platform/mediatek/isp/Makefile b/drivers/media/platform/mediatek/isp/Makefile
index 375d720f9ed75e2197bb723bdce9bc0472e62842..6d6280d18fed3c341197a62fc20abb6e438ff43c 100644
--- a/drivers/media/platform/mediatek/isp/Makefile
+++ b/drivers/media/platform/mediatek/isp/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+mtk-camsv-objs += mtk_camsv_hw.o
+mtk-camsv-objs += mtk_camsv_video.o
+obj-$(CONFIG_MTK_CAMSV) += mtk-camsv.o
+
 mtk-seninf-objs += mtk_seninf.o
 obj-$(CONFIG_MTK_SENINF30) += mtk-seninf.o
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv.h b/drivers/media/platform/mediatek/isp/mtk_camsv.h
new file mode 100644
index 0000000000000000000000000000000000000000..f8e3245bf10fe2062cc7b5eb18382b654a1e02d1
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAMSV_H__
+#define __MTK_CAMSV_H__
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+#include <soc/mediatek/smi.h>
+
+#define IMG_MAX_WIDTH			5376U
+#define IMG_MAX_HEIGHT			4032U
+#define IMG_MIN_WIDTH			80U
+#define IMG_MIN_HEIGHT			60U
+#define MAX_SUPPORTED_NUM_PLANES	1U
+
+#define MTK_CAM_CIO_PAD_SENINF		0U
+#define MTK_CAM_CIO_PAD_VIDEO		1U
+#define MTK_CAM_CIO_NUM_PADS		2U
+
+struct mtk_cam_format_info {
+	u32 code;
+	u32 fourcc;
+	u8 bpp;
+	u32 w_factor;
+	u32 module_en_pak;
+	u32 fmt_sel;
+	u32 pak;
+	u32 imgo_stride;
+};
+
+const struct mtk_cam_format_info *mtk_cam_format_info_by_code(u32 code);
+
+
+struct mtk_cam_dev_buffer {
+	struct vb2_v4l2_buffer v4l2_buf;
+	struct list_head list;
+	dma_addr_t daddr;
+};
+
+/**
+ * struct mtk_cam_vdev_desc - MTK camera device descriptor
+ * @num_fmts: the number of supported node formats
+ * @fmts: supported format
+ * @frmsizes: supported V4L2 frame size number
+ */
+struct mtk_cam_vdev_desc {
+	u8 num_fmts;
+	const u32 *fmts;
+	const struct v4l2_frmsizeenum *frmsizes;
+};
+
+/**
+ * struct mtk_cam_video_device - MediaTek video device structure
+ * @desc: The node description of video device
+ * @vdev_pad: The media pad graph object of video device
+ * @vdev: The video device instance
+ * @vbq: A videobuf queue of video device
+ * @vdev_lock: Serializes vb2 queue and video device operations
+ * @format: The V4L2 format of video device
+ * @fmtinfo: Information about the current format
+ */
+struct mtk_cam_video_device {
+	const struct mtk_cam_vdev_desc *desc;
+
+	struct media_pad vdev_pad;
+	struct video_device vdev;
+	struct vb2_queue vbq;
+
+	/* Serializes vb2 queue and video device operations */
+	struct mutex vdev_lock;
+
+	struct v4l2_pix_format_mplane format;
+	const struct mtk_cam_format_info *fmtinfo;
+};
+
+/**
+ * struct mtk_cam_dev - MediaTek camera device structure.
+ * @dev: Pointer to device.
+ * @regs: Base address of CAMSV.
+ * @regs_img0: Base address of CAMSV IMG0.
+ * @regs_tg: Base address of CAMSV TG.
+ * @num_clks: Number of clocks.
+ * @clks: The clocks.
+ * @irq: Irq fired when buffer is ready.
+ * @conf: soc specific driver data.
+ * @pipeline: Media pipeline information.
+ * @subdev: The V4L2 sub-device instance.
+ * @subdev_pads: Media pads of this sub-device.
+ * @vdev: The video device node.
+ * @seninf: Pointer to the seninf pad.
+ * @sequence: Buffer sequence number.
+ * @buf_list_lock: Protects the buffer list.
+ * @buf_list: List head for the buffer list.
+ */
+struct mtk_cam_dev {
+	struct device *dev;
+	void __iomem *regs;
+	void __iomem *regs_img0;
+	void __iomem *regs_tg;
+
+	unsigned int num_clks;
+	struct clk_bulk_data *clks;
+	unsigned int irq;
+	const struct mtk_cam_conf *conf;
+
+	struct media_pipeline pipeline;
+	struct v4l2_subdev subdev;
+	struct media_pad subdev_pads[MTK_CAM_CIO_NUM_PADS];
+	struct mtk_cam_video_device vdev;
+	struct media_pad *seninf;
+	unsigned int sequence;
+
+	spinlock_t buf_list_lock;
+	struct list_head buf_list;
+};
+
+/**
+ * struct mtk_cam_conf - MediaTek camera configuration structure
+ * @tg_sen_mode: TG sensor mode
+ * @module_en: module enable
+ * @imgo_con: dma control register
+ * @imgo_con2: dma control register 2
+ */
+struct mtk_cam_conf {
+	u32 tg_sen_mode;
+	u32 module_en;
+	u32 imgo_con;
+	u32 imgo_con2;
+};
+
+int mtk_cam_dev_init(struct mtk_cam_dev *cam_dev);
+void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam_dev);
+int mtk_cam_video_register(struct mtk_cam_dev *cam_dev);
+void mtk_cam_video_unregister(struct mtk_cam_video_device *vdev);
+void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam,
+				    enum vb2_buffer_state state);
+
+
+#endif /* __MTK_CAMSV_H__ */
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv_hw.c b/drivers/media/platform/mediatek/isp/mtk_camsv_hw.c
new file mode 100644
index 0000000000000000000000000000000000000000..57915e3cdc4c6d0757f263ed1c2b95067067f976
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv_hw.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "mtk_camsv.h"
+#include "mtk_camsv_hw.h"
+#include "mtk_camsv_reg.h"
+
+
+#define INT_ST_MASK_CAMSV (CAMSV_IRQ_PASS1_DON)
+
+#define INT_ST_MASK_CAMSV_ERR \
+	(CAMSV_IRQ_TG_ERR | CAMSV_IRQ_TG_GBERR | CAMSV_IRQ_IMGO_ERR)
+
+#define MTK_CAMSV_AUTOSUSPEND_DELAY_MS 100
+
+static const struct mtk_cam_conf camsv_conf = {
+	.tg_sen_mode = CAMSV_TG_SEN_MODE_DBL_DATA_BUS_EN,
+	.module_en = CAMSV_MODULE_EN_DB_EN | CAMSV_MODULE_EN_TG_EN,
+	.imgo_con = ((0x8  << CAMSV_IMGO_SV_CON_MAX_BURST_LEN_SHIFT) &
+		CAMSV_IMGO_SV_CON_MAX_BURST_LEN_MASK) |
+		((0x80 << CAMSV_IMGO_SV_CON_FIFO_SIZE_SHIFT) &
+		CAMSV_IMGO_SV_CON_FIFO_SIZE_MASK),
+	.imgo_con2 = ((0x2 << CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRL_SHIFT) &
+		CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRL_MASK) |
+		((0x2 << CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRH_SHIFT) |
+		CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRH_MASK),
+};
+
+static u32 mtk_camsv_read(struct mtk_cam_dev *priv, u32 reg)
+{
+	return readl(priv->regs + reg);
+}
+
+static void mtk_camsv_write(struct mtk_cam_dev *priv, u32 reg, u32 value)
+{
+	writel(value, priv->regs + reg);
+}
+
+static void mtk_camsv_img0_write(struct mtk_cam_dev *priv, u32 reg, u32 value)
+{
+	writel(value, priv->regs_img0 + reg);
+}
+
+static u32 mtk_camsv_tg_read(struct mtk_cam_dev *priv, u32 reg)
+{
+	return readl(priv->regs_tg + reg);
+}
+
+static void mtk_camsv_tg_write(struct mtk_cam_dev *priv, u32 reg, u32 value)
+{
+	writel(value, priv->regs_tg + reg);
+}
+
+void mtk_camsv_update_buffers_add(struct mtk_cam_dev *cam_dev,
+					   struct mtk_cam_dev_buffer *buf)
+{
+	mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_BASE_ADDR, buf->daddr);
+}
+
+void mtk_camsv_cmos_vf_hw_enable(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int fbc_val;
+	u32 clk_en = CAMSV_TG_DP_CLK_EN | CAMSV_DMA_DP_CLK_EN |
+		     CAMSV_PAK_DP_CLK_EN;
+
+	fbc_val = mtk_camsv_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val |= CAMSV_IMGO_FBC_EN;
+	mtk_camsv_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+
+	mtk_camsv_write(cam_dev,  CAMSV_CLK_EN, clk_en);
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
+			     mtk_camsv_tg_read(cam_dev, CAMSV_TG_SEN_MODE) |
+			     CAMSV_TG_SEN_MODE_CMOS_EN);
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_VF_CON,
+			     mtk_camsv_tg_read(cam_dev, CAMSV_TG_VF_CON) |
+			     CAMSV_TG_VF_CON_VFDATA_EN);
+}
+
+void mtk_camsv_cmos_vf_hw_disable(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int fbc_val;
+
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
+			     mtk_camsv_tg_read(cam_dev, CAMSV_TG_SEN_MODE) &
+			     ~CAMSV_TG_SEN_MODE_CMOS_EN);
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_VF_CON,
+			     mtk_camsv_tg_read(cam_dev, CAMSV_TG_VF_CON) &
+			     ~CAMSV_TG_VF_CON_VFDATA_EN);
+	fbc_val = mtk_camsv_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val &= ~CAMSV_IMGO_FBC_EN;
+	mtk_camsv_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+}
+
+/*
+ * Camsv module is able to handle underrruns using the FBC
+ *
+ *     - FBC_FB_NUM: the number of userspace buffers available (fifo depth)
+ *     - RCNT_INC: user writes 1 when buffer is queued/unqueued
+ *     - FBC_CNT: decreased at SOF indicating that the number of buffers filled
+ *       by write-DMA decreases. Increased when write-dma done indicating that
+ *       the number of buffers filled by write-DMA increases
+ *     - RCNT: increased at the end of enqueue indicating that the software
+ *       moves to the next buffer for reading
+ *     - WCNT: increased to indicate that write-dma writes to the next buffer
+ *     Drop condition: FBC_CNT == FBC_NUM
+ */
+
+void mtk_camsv_fbc_init(struct mtk_cam_dev *cam_dev,
+				 unsigned int num_buffers)
+{
+	unsigned int fbc_val;
+
+	if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
+		dev_err(cam_dev->dev, "failed to get pm_runtime\n");
+		return;
+	}
+
+	fbc_val = mtk_camsv_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val &= ~CAMSV_IMGO_FBC_FB_NUM;
+	fbc_val |= CAMSV_IMGO_FBC_EN;
+	fbc_val |= FIELD_PREP(CAMSV_IMGO_FBC_FB_NUM, num_buffers);
+	mtk_camsv_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+
+	pm_runtime_mark_last_busy(cam_dev->dev);
+	pm_runtime_put_autosuspend(cam_dev->dev);
+}
+
+void mtk_camsv_fbc_inc(struct mtk_cam_dev *cam_dev)
+{
+	unsigned int fbc_val;
+
+	fbc_val = mtk_camsv_read(cam_dev, CAMSV_IMGO_FBC);
+	fbc_val |= CAMSV_IMGO_FBC_RCNT_INC;
+	mtk_camsv_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+	fbc_val &= ~CAMSV_IMGO_FBC_RCNT_INC;
+	mtk_camsv_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
+}
+
+void mtk_camsv_setup(struct mtk_cam_dev *cam_dev, unsigned int count,
+		     u32 w, u32 h, u32 bpl, u32 mbus_fmt)
+{
+	const struct mtk_cam_conf *conf = cam_dev->conf;
+	const struct mtk_cam_format_info *fmtinfo;
+	struct mtk_cam_dev_buffer *buf;
+	unsigned long flags;
+	unsigned int i;
+	u32 tmp;
+
+	for (i = 0; i < count; i++)
+		mtk_camsv_fbc_inc(cam_dev);
+
+	fmtinfo = mtk_cam_format_info_by_code(mbus_fmt);
+
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_MODE, conf->tg_sen_mode);
+
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_GRAB_PXL,
+			     (w * fmtinfo->w_factor) << 16U);
+
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_GRAB_LIN, h << 16U);
+
+	/* YUV_U2S_DIS: disable YUV sensor unsigned to signed */
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_PATH_CFG, 0x1000U);
+
+	/* Reset cam */
+	mtk_camsv_write(cam_dev, CAMSV_SW_CTL, CAMSV_SW_RST);
+	mtk_camsv_write(cam_dev, CAMSV_SW_CTL, 0x0U);
+	mtk_camsv_write(cam_dev, CAMSV_SW_CTL, CAMSV_IMGO_RST_TRIG);
+
+	readl_poll_timeout_atomic(cam_dev->regs + CAMSV_SW_CTL, tmp,
+				  (tmp == (CAMSV_IMGO_RST_TRIG |
+					   CAMSV_IMGO_RST_ST)), 10, 200);
+
+	mtk_camsv_write(cam_dev, CAMSV_SW_CTL, 0x0U);
+
+	mtk_camsv_write(cam_dev, CAMSV_INT_EN, INT_ST_MASK_CAMSV);
+
+	mtk_camsv_write(cam_dev, CAMSV_MODULE_EN,
+			  conf->module_en | fmtinfo->module_en_pak);
+	mtk_camsv_write(cam_dev, CAMSV_FMT_SEL, fmtinfo->fmt_sel);
+	mtk_camsv_write(cam_dev, CAMSV_PAK, fmtinfo->pak);
+
+	mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_XSIZE, bpl - 1U);
+	mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_YSIZE, h - 1U);
+
+	mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_STRIDE,
+			       fmtinfo->imgo_stride | bpl);
+
+	mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_CON, conf->imgo_con);
+	mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_CON2, conf->imgo_con2);
+
+	/* Set buf addr */
+	spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
+	buf = list_first_entry_or_null(&cam_dev->buf_list,
+				       struct mtk_cam_dev_buffer,
+				       list);
+	if (buf)
+		mtk_camsv_update_buffers_add(cam_dev, buf);
+	spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
+
+	/* CMOS_EN first */
+	mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
+			     mtk_camsv_tg_read(cam_dev, CAMSV_TG_SEN_MODE) |
+			     CAMSV_TG_SEN_MODE_CMOS_EN);
+
+	/* finally, CAMSV_MODULE_EN : IMGO_EN */
+	mtk_camsv_write(cam_dev, CAMSV_MODULE_EN,
+			  mtk_camsv_read(cam_dev, CAMSV_MODULE_EN) |
+			  CAMSV_MODULE_EN_IMGO_EN);
+}
+
+static irqreturn_t isp_irq_camsv(int irq, void *data)
+{
+	struct mtk_cam_dev *cam_dev = (struct mtk_cam_dev *)data;
+	struct mtk_cam_dev_buffer *processed_buf, *buf;
+	unsigned int irq_status;
+
+	irq_status = mtk_camsv_read(cam_dev, CAMSV_INT_STATUS);
+
+	if (irq_status & INT_ST_MASK_CAMSV_ERR)
+		dev_err(cam_dev->dev, "irq error 0x%lx\n",
+			irq_status & INT_ST_MASK_CAMSV_ERR);
+
+	/* De-queue frame */
+	if (irq_status & CAMSV_IRQ_PASS1_DON) {
+		spin_lock(&cam_dev->buf_list_lock);
+		cam_dev->sequence++;
+
+		processed_buf = list_first_entry_or_null(&cam_dev->buf_list,
+							 struct mtk_cam_dev_buffer,
+							 list);
+		if (processed_buf)
+			list_del(&processed_buf->list);
+
+		buf = list_first_entry_or_null(&cam_dev->buf_list,
+					       struct mtk_cam_dev_buffer,
+					       list);
+
+		spin_unlock(&cam_dev->buf_list_lock);
+
+		if (processed_buf) {
+			processed_buf->v4l2_buf.sequence = cam_dev->sequence;
+			processed_buf->v4l2_buf.vb2_buf.timestamp =
+			ktime_get_ns();
+			vb2_buffer_done(&processed_buf->v4l2_buf.vb2_buf,
+					VB2_BUF_STATE_DONE);
+			mtk_camsv_fbc_inc(cam_dev);
+		}
+		/*
+		 * If there is no user buffer available, hardware will drop
+		 * automatically frames until buf_queue is called.
+		 */
+		if (buf)
+			mtk_camsv_update_buffers_add(cam_dev, buf);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_camsv_probe(struct platform_device *pdev)
+{
+	static const char * const clk_names[] = { "cam", "camtg", "camsv"};
+
+	struct mtk_cam_dev *cam_dev;
+	struct device *dev = &pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!device_iommu_mapped(dev))
+		return -EPROBE_DEFER;
+
+	cam_dev = devm_kzalloc(dev, sizeof(*cam_dev), GFP_KERNEL);
+	if (!cam_dev)
+		return -ENOMEM;
+
+	cam_dev->conf = device_get_match_data(dev);
+	if (!cam_dev->conf)
+		return -ENODEV;
+
+	cam_dev->dev = dev;
+	dev_set_drvdata(dev, cam_dev);
+
+	cam_dev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(cam_dev->regs))
+		return dev_err_probe(dev, PTR_ERR(cam_dev->regs),
+				     "failed to map register base\n");
+
+	cam_dev->regs_img0 = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(cam_dev->regs_img0))
+		return dev_err_probe(dev, PTR_ERR(cam_dev->regs_img0),
+				     "failed to map img0 register base\n");
+
+	cam_dev->regs_tg = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(cam_dev->regs_tg))
+		return dev_err_probe(dev, PTR_ERR(cam_dev->regs_tg),
+				     "failed to map TG register base\n");
+
+	cam_dev->num_clks = ARRAY_SIZE(clk_names);
+	cam_dev->clks = devm_kcalloc(dev, cam_dev->num_clks,
+				     sizeof(*cam_dev->clks), GFP_KERNEL);
+	if (!cam_dev->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < cam_dev->num_clks; ++i)
+		cam_dev->clks[i].id = clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, cam_dev->num_clks, cam_dev->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get clocks: %i\n",
+				     ret);
+
+	cam_dev->irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(dev, cam_dev->irq, isp_irq_camsv, 0,
+			       dev_name(dev), cam_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq=%d\n",
+				     cam_dev->irq);
+
+	spin_lock_init(&cam_dev->buf_list_lock);
+
+	/* initialise runtime power management */
+	pm_runtime_set_autosuspend_delay(dev, MTK_CAMSV_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_suspended(dev);
+	devm_pm_runtime_enable(dev);
+
+	/* Initialize the v4l2 common part */
+	return mtk_cam_dev_init(cam_dev);
+}
+
+static void mtk_camsv_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
+
+	mtk_cam_dev_cleanup(cam_dev);
+	pm_runtime_dont_use_autosuspend(cam_dev->dev);
+	pm_runtime_disable(cam_dev->dev);
+
+}
+
+#ifdef CONFIG_PM
+static int mtk_camsv_runtime_suspend(struct device *dev)
+{
+	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
+	struct vb2_queue *vbq = &cam_dev->vdev.vbq;
+
+	if (vb2_is_streaming(vbq)) {
+		v4l2_subdev_disable_streams(&cam_dev->subdev,
+					    cam_dev->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+					    BIT(0));
+	}
+
+	clk_bulk_disable_unprepare(cam_dev->num_clks, cam_dev->clks);
+
+	return 0;
+}
+
+static int mtk_camsv_runtime_resume(struct device *dev)
+{
+	struct mtk_cam_dev *cam_dev = dev_get_drvdata(dev);
+	struct vb2_queue *vbq = &cam_dev->vdev.vbq;
+	struct mtk_cam_dev_buffer *buf;
+	unsigned long flags = 0;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(cam_dev->num_clks, cam_dev->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clock:%d\n", ret);
+		return ret;
+	}
+
+	if (vb2_is_streaming(vbq)) {
+
+		spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
+		buf = list_first_entry_or_null(&cam_dev->buf_list,
+					       struct mtk_cam_dev_buffer,
+					       list);
+		if (buf)
+			mtk_camsv_update_buffers_add(cam_dev, buf);
+
+		spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
+
+		/* Stream on the sub-device */
+		ret = v4l2_subdev_enable_streams(&cam_dev->subdev,
+						 cam_dev->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+						 BIT(0));
+
+		if (ret)
+			goto fail_no_stream;
+	}
+
+	return 0;
+
+fail_no_stream:
+	mtk_cam_vb2_return_all_buffers(cam_dev, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_camsv_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(mtk_camsv_runtime_suspend,
+			   mtk_camsv_runtime_resume, NULL)
+};
+#endif
+
+static const struct of_device_id mtk_camsv_of_ids[] = {
+	{ .compatible = "mediatek,mt8365-camsv", .data = &camsv_conf },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_camsv_of_ids);
+
+static struct platform_driver mtk_camsv_driver = {
+	.probe = mtk_camsv_probe,
+	.remove = mtk_camsv_remove,
+	.driver = {
+		.name = "mtk-camsv-isp",
+		.of_match_table = mtk_camsv_of_ids,
+		.pm = &mtk_camsv_pm_ops,
+	}
+};
+
+module_platform_driver(mtk_camsv_driver);
+
+MODULE_DESCRIPTION("MediaTek CAMSV ISP3.0 driver");
+MODULE_AUTHOR("Florian Sylvestre <fsylvestre@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv_hw.h b/drivers/media/platform/mediatek/isp/mtk_camsv_hw.h
new file mode 100644
index 0000000000000000000000000000000000000000..6b585a7c8cf70ced4bd84247bcc7372ae57b846d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv_hw.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAMSV_HW_H__
+#define __MTK_CAMSV_HW_H__
+
+void mtk_camsv_setup(struct mtk_cam_dev *cam_dev, unsigned int cont,
+		     u32 width, u32 height, u32 bpl, u32 mbus_fmt);
+void mtk_camsv_update_buffers_add(struct mtk_cam_dev *cam_dev,
+				  struct mtk_cam_dev_buffer *buf);
+void mtk_camsv_cmos_vf_hw_enable(struct mtk_cam_dev *cam_dev);
+void mtk_camsv_cmos_vf_hw_disable(struct mtk_cam_dev *cam_dev);
+void mtk_camsv_fbc_init(struct mtk_cam_dev *cam_dev, unsigned int num_buffers);
+void mtk_camsv_fbc_inc(struct mtk_cam_dev *cam_dev);
+
+#endif /* __MTK_CAMSV_HW_H__ */
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv_reg.h b/drivers/media/platform/mediatek/isp/mtk_camsv_reg.h
new file mode 100644
index 0000000000000000000000000000000000000000..53377767ad1e8f7252c807fe26a7330ef19180b6
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv_reg.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Copyright (c) 2025 BayLibre
+ */
+
+#include <linux/bits.h>
+
+#ifndef __CAMSV_REG_H__
+#define __CAMSV_REG_H__
+
+
+/* CAMSV */
+#define CAMSV_MODULE_EN					0x0000
+#define CAMSV_MODULE_EN_TG_EN				BIT(0)
+#define CAMSV_MODULE_EN_PAK_EN				BIT(2)
+#define CAMSV_MODULE_EN_PAK_SEL				BIT(3)
+#define CAMSV_MODULE_EN_IMGO_EN				BIT(4)
+#define CAMSV_MODULE_EN_DB_EN				BIT(30)
+#define CAMSV_FMT_SEL					0x0004
+#define CAMSV_FMT_SEL_TG1_FMT_RAW_8			0x0
+#define CAMSV_FMT_SEL_TG1_FMT_RAW_10			0x1
+#define CAMSV_FMT_SEL_TG1_FMT_RAW_12			0x2
+#define CAMSV_FMT_SEL_TG1_FMT_YUV422			0x3
+#define CAMSV_FMT_SEL_IMGO_BUS_SIZE_16			BIT(24)
+#define CAMSV_INT_EN					0x0008
+#define CAMSV_INT_STATUS				0x000c
+#define CAMSV_SW_CTL					0x0010
+#define CAMSV_IMGO_FBC					0x001C
+#define CAMSV_CLK_EN					0x0020
+#define CAMSV_PAK					0x003c
+#define CAMSV_PAK_PAK_MODE_RAW_14			0x0
+#define CAMSV_PAK_PAK_MODE_RAW_12			0x1
+#define CAMSV_PAK_PAK_MODE_RAW_10			0x2
+#define CAMSV_PAK_PAK_MODE_RAW_8			0x3
+#define CAMSV_PAK_PAK_DBL_MODE_2_PIXELS			BIT(2)
+
+/* CAMSV_TG */
+#define CAMSV_TG_SEN_MODE				0x0010
+#define CAMSV_TG_SEN_MODE_DBL_DATA_BUS_EN		BIT(1)
+#define CAMSV_TG_VF_CON					0x0014
+#define CAMSV_TG_SEN_GRAB_PXL				0x0018
+#define CAMSV_TG_SEN_GRAB_LIN				0x001c
+#define CAMSV_TG_PATH_CFG				0x0020
+
+/* CAMSV_IMG0 */
+#define CAMSV_IMGO_SV_BASE_ADDR				0x0000
+#define CAMSV_IMGO_SV_XSIZE				0x0008
+#define CAMSV_IMGO_SV_YSIZE				0x000c
+#define CAMSV_IMGO_SV_STRIDE				0x0010
+#define CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16		BIT(16)
+#define CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32		GENMASK(17, 16)
+#define CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN		BIT(19)
+#define CAMSV_IMGO_SV_CON				0x0014
+#define CAMSV_IMGO_SV_CON_FIFO_SIZE_MASK		GENMASK(7, 0)
+#define CAMSV_IMGO_SV_CON_FIFO_SIZE_SHIFT		0
+#define CAMSV_IMGO_SV_CON_MAX_BURST_LEN_MASK		GENMASK(31, 28)
+#define CAMSV_IMGO_SV_CON_MAX_BURST_LEN_SHIFT		28
+#define CAMSV_IMGO_SV_CON2				0x0018
+#define CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRL_MASK	GENMASK(15, 8)
+#define CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRL_SHIFT	8
+#define CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRH_MASK	GENMASK(23, 16)
+#define CAMSV_IMGO_SV_CON2_FIFO_PREP_PRI_THRH_SHIFT	16
+
+#define CAMSV_TG_SEN_MODE_CMOS_EN			BIT(0)
+#define CAMSV_TG_VF_CON_VFDATA_EN			BIT(0)
+
+/* CAMSV_CLK_EN bits */
+#define CAMSV_TG_DP_CLK_EN				BIT(0)
+#define CAMSV_PAK_DP_CLK_EN				BIT(2)
+#define CAMSV_DMA_DP_CLK_EN				BIT(15)
+
+/* CAMSV_SW_CTL bits */
+#define CAMSV_IMGO_RST_TRIG				BIT(0)
+#define CAMSV_IMGO_RST_ST				BIT(1)
+#define CAMSV_SW_RST					BIT(2)
+
+/* IRQ BITS */
+#define CAMSV_IRQ_TG_ERR				BIT(4)
+#define CAMSV_IRQ_TG_GBERR				BIT(5)
+#define CAMSV_IRQ_PASS1_DON				BIT(10)
+#define CAMSV_IRQ_IMGO_ERR				BIT(16)
+
+/* FBC bits */
+#define CAMSV_IMGO_FBC_RCNT_INC				BIT(11)
+#define CAMSV_IMGO_FBC_EN				BIT(14)
+#define CAMSV_IMGO_FBC_LOCK_EN				BIT(15)
+#define CAMSV_IMGO_FBC_FB_NUM				GENMASK(19, 16)
+
+#endif /* __CAMSV_REG_H__ */
diff --git a/drivers/media/platform/mediatek/isp/mtk_camsv_video.c b/drivers/media/platform/mediatek/isp/mtk_camsv_video.c
new file mode 100644
index 0000000000000000000000000000000000000000..c0fa0abf468b70259365ca5bfa933cc5e84f435d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/mtk_camsv_video.c
@@ -0,0 +1,1017 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mtk_camsv_video.c - V4L2 video node support
+ *
+ * Copyright (c) 2020 BayLibre
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/version.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mediabus.h>
+
+#include "mtk_camsv.h"
+#include "mtk_camsv_hw.h"
+#include "mtk_camsv_reg.h"
+
+static inline struct mtk_cam_video_device *
+file_to_mtk_cam_video_device(struct file *__file)
+{
+	return container_of(video_devdata(__file),
+			    struct mtk_cam_video_device, vdev);
+}
+
+static inline struct mtk_cam_video_device *
+vb2_queue_to_mtk_cam_video_device(struct vb2_queue *vq)
+{
+	return container_of(vq, struct mtk_cam_video_device, vbq);
+}
+
+static inline struct mtk_cam_dev_buffer *
+to_mtk_cam_dev_buffer(struct vb2_buffer *buf)
+{
+	return container_of(buf, struct mtk_cam_dev_buffer, v4l2_buf.vb2_buf);
+}
+
+/* -----------------------------------------------------------------------------
+ * Format Information
+ */
+
+static const struct mtk_cam_format_info mtk_cam_format_info[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.bpp = 8,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_8
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_8,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.bpp = 8,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_8
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_8,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.bpp = 8,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_8
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_8,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.bpp = 8,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_8
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_8,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp = 10,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_10
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_10,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bpp = 10,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_10
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_10,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp = 10,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_10
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_10,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp = 10,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_10
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_10,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp = 12,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_12
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_12,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bpp = 12,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_12
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_12,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bpp = 12,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_12
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_12,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp = 12,
+		.w_factor = 1,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_EN,
+		.pak = CAMSV_PAK_PAK_MODE_RAW_12
+			| CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
+		.fmt_sel = CAMSV_FMT_SEL_TG1_FMT_RAW_12,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.bpp = 16,
+		.w_factor = 2,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_SEL,
+		.pak = 0, /* ignored */
+		.fmt_sel = CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
+			| CAMSV_FMT_SEL_TG1_FMT_YUV422,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.bpp = 16,
+		.w_factor = 2,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_SEL,
+		.pak = 0, /* ignored */
+		.fmt_sel = CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
+			| CAMSV_FMT_SEL_TG1_FMT_YUV422,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.bpp = 16,
+		.w_factor = 2,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_SEL,
+		.pak = 0, /* ignored */
+		.fmt_sel = CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
+			| CAMSV_FMT_SEL_TG1_FMT_YUV422,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.bpp = 16,
+		.w_factor = 2,
+		.module_en_pak = CAMSV_MODULE_EN_PAK_SEL,
+		.pak = 0, /* ignored */
+		.fmt_sel = CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
+			| CAMSV_FMT_SEL_TG1_FMT_YUV422,
+		.imgo_stride = CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
+			| CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
+	},
+};
+
+static const struct mtk_cam_format_info *
+mtk_cam_format_info_by_fourcc(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_format_info); ++i) {
+		const struct mtk_cam_format_info *info =
+			&mtk_cam_format_info[i];
+
+		if (info->fourcc == fourcc)
+			return info;
+	}
+
+	return NULL;
+}
+
+const struct mtk_cam_format_info *
+mtk_cam_format_info_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_format_info); ++i) {
+		const struct mtk_cam_format_info *info =
+			&mtk_cam_format_info[i];
+
+		if (info->code == code)
+			return info;
+	}
+
+	return NULL;
+}
+
+static bool mtk_cam_dev_find_fmt(const struct mtk_cam_vdev_desc *desc,
+				 u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < desc->num_fmts; i++) {
+		if (desc->fmts[i] == format)
+			return true;
+	}
+
+	return false;
+}
+
+static void calc_bpl_size_pix_mp(const struct mtk_cam_format_info *fmtinfo,
+				 struct v4l2_pix_format_mplane *pix_mp)
+{
+	unsigned int bpl;
+	unsigned int i;
+
+	bpl = ALIGN(DIV_ROUND_UP(pix_mp->width * fmtinfo->bpp, 8), 2);
+
+	for (i = 0; i < pix_mp->num_planes; ++i) {
+		pix_mp->plane_fmt[i].bytesperline = bpl;
+		pix_mp->plane_fmt[i].sizeimage = bpl * pix_mp->height;
+	}
+}
+
+static void mtk_cam_dev_load_default_fmt(struct mtk_cam_dev *cam)
+{
+	struct mtk_cam_video_device *vdev = &cam->vdev;
+	struct v4l2_pix_format_mplane *fmt = &vdev->format;
+
+	fmt->num_planes = MAX_SUPPORTED_NUM_PLANES;
+	fmt->pixelformat = vdev->desc->fmts[0];
+	fmt->width = IMG_MAX_WIDTH;
+	fmt->height = IMG_MAX_HEIGHT;
+
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	vdev->fmtinfo = mtk_cam_format_info_by_fourcc(fmt->pixelformat);
+
+	calc_bpl_size_pix_mp(vdev->fmtinfo, fmt);
+}
+
+/* -----------------------------------------------------------------------------
+ * VB2 Queue Operations
+ */
+
+static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vq);
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	unsigned int size;
+
+	size = fmt->plane_fmt[0].sizeimage;
+
+	if (*num_planes == 0) {
+		*num_planes = MAX_SUPPORTED_NUM_PLANES;
+		sizes[0] = size;
+	} else if (*num_planes != MAX_SUPPORTED_NUM_PLANES || sizes[0] < size) {
+		return -EINVAL;
+	}
+
+	mtk_camsv_fbc_init(cam, *num_buffers);
+
+	return 0;
+}
+
+static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vb->vb2_queue);
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_dev_buffer *buf = to_mtk_cam_dev_buffer(vb);
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	u32 size;
+	unsigned int i;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		size = fmt->plane_fmt[i].sizeimage;
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(cam->dev, "plane size is too small:%lu<%u\n",
+				vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+	}
+
+	buf->v4l2_buf.field = V4L2_FIELD_NONE;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		size = fmt->plane_fmt[i].sizeimage;
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	if (!buf->daddr)
+		buf->daddr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	return 0;
+}
+
+static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_cam_dev_buffer *buf = to_mtk_cam_dev_buffer(vb);
+	unsigned long flags;
+
+	/* Add the buffer into the tracking list */
+	spin_lock_irqsave(&cam->buf_list_lock, flags);
+	if (vb2_start_streaming_called(vb->vb2_queue) && list_empty(&cam->buf_list))
+		mtk_camsv_update_buffers_add(cam, buf);
+
+	list_add_tail(&buf->list, &cam->buf_list);
+	spin_unlock_irqrestore(&cam->buf_list_lock, flags);
+	if (vb2_start_streaming_called(vb->vb2_queue))
+		mtk_camsv_fbc_inc(cam);
+}
+
+void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam,
+				    enum vb2_buffer_state state)
+{
+	struct mtk_cam_dev_buffer *buf, *buf_prev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cam->buf_list_lock, flags);
+	list_for_each_entry_safe(buf, buf_prev, &cam->buf_list, list) {
+		buf->daddr = 0ULL;
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->v4l2_buf.vb2_buf, state);
+	}
+	spin_unlock_irqrestore(&cam->buf_list_lock, flags);
+}
+
+static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
+				       unsigned int count)
+{
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vq);
+	struct device *dev = cam->dev;
+	const struct v4l2_pix_format_mplane *fmt = &vdev->format;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "failed to get pm_runtime\n");
+		return ret;
+	}
+
+	mtk_camsv_setup(cam, count, fmt->width, fmt->height,
+			fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
+
+	/* Enable CMOS and VF */
+	mtk_camsv_cmos_vf_hw_enable(cam);
+
+	/* Start streaming of the whole pipeline now. */
+	ret = video_device_pipeline_start(&vdev->vdev, &cam->pipeline);
+	if (ret)
+		goto fail_pm_put;
+
+	cam->sequence = (unsigned int)-1;
+
+	/* Stream on the sub-device */
+	ret = v4l2_subdev_enable_streams(&cam->subdev,
+					 cam->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+					 BIT(0));
+	if (ret)
+		goto fail_no_stream;
+
+	return 0;
+
+fail_no_stream:
+	video_device_pipeline_stop(&vdev->vdev);
+	mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_QUEUED);
+fail_pm_put:
+	pm_runtime_mark_last_busy(cam->dev);
+	pm_runtime_put_autosuspend(cam->dev);
+
+	return ret;
+}
+
+static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
+	struct mtk_cam_video_device *vdev =
+		vb2_queue_to_mtk_cam_video_device(vq);
+
+	/* Disable CMOS and VF */
+	mtk_camsv_cmos_vf_hw_disable(cam);
+
+	v4l2_subdev_disable_streams(&cam->subdev,
+				    cam->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].index,
+				    BIT(0));
+
+	mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_ERROR);
+
+	video_device_pipeline_stop(&vdev->vdev);
+
+	pm_runtime_mark_last_busy(cam->dev);
+	pm_runtime_put_autosuspend(cam->dev);
+}
+
+static const struct vb2_ops mtk_cam_vb2_ops = {
+	.queue_setup = mtk_cam_vb2_queue_setup,
+	.buf_prepare = mtk_cam_vb2_buf_prepare,
+	.buf_queue = mtk_cam_vb2_buf_queue,
+	.start_streaming = mtk_cam_vb2_start_streaming,
+	.stop_streaming = mtk_cam_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev Operations
+ */
+
+static inline struct mtk_cam_dev *to_mtk_cam_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mtk_cam_dev, subdev);
+}
+
+
+static int mtk_cam_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	static const struct v4l2_mbus_framefmt def_format = {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.width = IMG_MAX_WIDTH,
+		.height = IMG_MAX_HEIGHT,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+		.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+		.quantization = V4L2_QUANTIZATION_DEFAULT,
+	};
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		format = v4l2_subdev_state_get_format(sd_state, i);
+		*format = def_format;
+	}
+
+	return 0;
+}
+
+static int mtk_cam_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(mtk_cam_format_info))
+		return -EINVAL;
+
+	code->code = mtk_cam_format_info[code->index].code;
+
+	return 0;
+}
+
+static int mtk_cam_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	/*
+	 * We only support pass-through mode, the format on source pads can't
+	 * be modified.
+	 */
+	if (fmt->pad != MTK_CAM_CIO_PAD_SENINF)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_format_info); ++i) {
+		if (mtk_cam_format_info[i].code == fmt->format.code)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(mtk_cam_format_info))
+		fmt->format.code = mtk_cam_format_info[0].code;
+
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	format->width = clamp_t(u32, fmt->format.width,
+				IMG_MIN_WIDTH, IMG_MAX_WIDTH);
+	format->height = clamp_t(u32, fmt->format.height,
+				 IMG_MIN_HEIGHT, IMG_MAX_HEIGHT);
+	format->code = fmt->format.code;
+
+	fmt->format = *format;
+
+	/* Propagate the format to the source pad. */
+	format = v4l2_subdev_state_get_format(sd_state, MTK_CAM_CIO_PAD_VIDEO);
+	format->width = fmt->format.width;
+	format->height = fmt->format.height;
+	format->code = fmt->format.code;
+
+	return 0;
+}
+
+static int mtk_cam_subdev_registered(struct v4l2_subdev *sd)
+{
+	struct mtk_cam_dev *cam = to_mtk_cam_dev(sd);
+
+	/* Create the video device and link. */
+	return mtk_cam_video_register(cam);
+}
+
+static int camsv_enable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 pad,
+				u64 streams_mask)
+{
+	struct mtk_cam_dev *cam = to_mtk_cam_dev(sd);
+	struct v4l2_subdev *seninf;
+	int ret;
+
+	if (!cam->seninf) {
+		cam->seninf = media_pad_remote_pad_first(&cam->subdev_pads[MTK_CAM_CIO_PAD_SENINF]);
+		if (!cam->seninf) {
+			dev_err(cam->dev, "No SENINF connected\n");
+			return -ENOLINK;
+		}
+	}
+
+	seninf = media_entity_to_v4l2_subdev(cam->seninf->entity);
+
+	/* Seninf must stream on first */
+	ret = v4l2_subdev_enable_streams(seninf, cam->seninf->index, BIT(0));
+	if (ret) {
+		dev_err(cam->dev, "failed to stream on %s:%d\n",
+			seninf->entity.name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int camsv_disable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct mtk_cam_dev *cam = to_mtk_cam_dev(sd);
+	struct v4l2_subdev *seninf;
+	int ret;
+
+	if (cam->seninf) {
+		seninf = media_entity_to_v4l2_subdev(cam->seninf->entity);
+		ret = v4l2_subdev_disable_streams(seninf, cam->seninf->index,
+						  BIT(0));
+		if (ret) {
+			dev_err(cam->dev, "failed to stream off %s:%d\n",
+				sd->entity.name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mtk_cam_subdev_pad_ops = {
+	.enum_mbus_code = mtk_cam_enum_mbus_code,
+	.set_fmt = mtk_cam_set_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+	.enable_streams = camsv_enable_streams,
+	.disable_streams = camsv_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
+	.pad = &mtk_cam_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops mtk_cam_internal_ops = {
+	.init_state = mtk_cam_init_state,
+	.registered = mtk_cam_subdev_registered,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media Entity Operations
+ */
+
+static const struct media_entity_operations mtk_cam_media_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+/* -----------------------------------------------------------------------------
+ * Init & Cleanup
+ */
+
+static int mtk_cam_v4l2_register(struct mtk_cam_dev *cam)
+{
+	struct device *dev = cam->dev;
+	int ret;
+
+	cam->subdev_pads[MTK_CAM_CIO_PAD_SENINF].flags = MEDIA_PAD_FL_SINK;
+	cam->subdev_pads[MTK_CAM_CIO_PAD_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize subdev pads */
+	ret = media_entity_pads_init(&cam->subdev.entity,
+				     ARRAY_SIZE(cam->subdev_pads),
+				     cam->subdev_pads);
+	if (ret) {
+		dev_err(dev, "failed to initialize media pads:%d\n", ret);
+		return ret;
+	}
+
+	/* Initialize subdev */
+	v4l2_subdev_init(&cam->subdev, &mtk_cam_subdev_ops);
+
+	cam->subdev.dev = dev;
+	cam->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	cam->subdev.entity.ops = &mtk_cam_media_entity_ops;
+	cam->subdev.internal_ops = &mtk_cam_internal_ops;
+	cam->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	strscpy(cam->subdev.name, dev_name(dev), sizeof(cam->subdev.name));
+	v4l2_set_subdevdata(&cam->subdev, cam);
+
+	v4l2_subdev_init_finalize(&cam->subdev);
+
+	ret = v4l2_async_register_subdev(&cam->subdev);
+	if (ret) {
+		dev_err(dev, "failed to initialize subdev:%d\n", ret);
+		media_entity_cleanup(&cam->subdev.entity);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam)
+{
+	mtk_cam_video_unregister(&cam->vdev);
+
+	media_entity_cleanup(&cam->subdev.entity);
+	v4l2_async_unregister_subdev(&cam->subdev);
+	v4l2_subdev_cleanup(&cam->subdev);
+}
+
+int mtk_cam_dev_init(struct mtk_cam_dev *cam_dev)
+{
+	/* v4l2 sub-device registration */
+	return mtk_cam_v4l2_register(cam_dev);
+}
+
+void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam)
+{
+	mtk_cam_v4l2_unregister(cam);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Video IOCTLs
+ */
+
+static int mtk_cam_vidioc_querycap(struct file *file, void *fh,
+				   struct v4l2_capability *cap)
+{
+	struct mtk_cam_dev *cam = video_drvdata(file);
+
+	strscpy(cap->driver, dev_driver_string(cam->dev), sizeof(cap->driver));
+	strscpy(cap->card, dev_driver_string(cam->dev), sizeof(cap->card));
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
+				   struct v4l2_fmtdesc *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+	const struct mtk_cam_format_info *fmtinfo;
+	unsigned int i;
+
+	/* If mbus_code is not set enumerate all supported formats. */
+	if (!f->mbus_code) {
+		if (f->index >= vdev->desc->num_fmts)
+			return -EINVAL;
+
+		/* f->description is filled in v4l_fill_fmtdesc function */
+		f->pixelformat = vdev->desc->fmts[f->index];
+		f->flags = 0;
+
+		return 0;
+	}
+
+	/*
+	 * Otherwise only enumerate supported pixel formats corresponding to
+	 * that bus code.
+	 */
+	if (f->index)
+		return -EINVAL;
+
+	fmtinfo = mtk_cam_format_info_by_code(f->mbus_code);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	for (i = 0; i < vdev->desc->num_fmts; ++i) {
+		if (vdev->desc->fmts[i] == fmtinfo->fourcc) {
+			f->pixelformat = fmtinfo->fourcc;
+			f->flags = 0;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+
+	f->fmt.pix_mp = vdev->format;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct mtk_cam_format_info *fmtinfo;
+
+	/* Validate pixelformat */
+	if (!mtk_cam_dev_find_fmt(vdev->desc, pix_mp->pixelformat))
+		pix_mp->pixelformat = vdev->desc->fmts[0];
+
+	pix_mp->width = clamp_val(pix_mp->width, IMG_MIN_WIDTH, IMG_MAX_WIDTH);
+	pix_mp->height = clamp_val(pix_mp->height, IMG_MIN_HEIGHT,
+				   IMG_MAX_HEIGHT);
+
+	pix_mp->num_planes = 1;
+
+	fmtinfo = mtk_cam_format_info_by_fourcc(pix_mp->pixelformat);
+	calc_bpl_size_pix_mp(fmtinfo, pix_mp);
+
+	/* Constant format fields */
+	pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
+	pix_mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+	int ret;
+
+	if (vb2_is_busy(vdev->vdev.queue))
+		return -EBUSY;
+
+	ret = mtk_cam_vidioc_try_fmt(file, fh, f);
+	if (ret)
+		return ret;
+
+	/* Configure to video device */
+	vdev->format = f->fmt.pix_mp;
+	vdev->fmtinfo =
+		mtk_cam_format_info_by_fourcc(f->fmt.pix_mp.pixelformat);
+
+	return 0;
+}
+
+static int mtk_cam_vidioc_enum_framesizes(struct file *file, void *priv,
+					  struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_cam_video_device *vdev = file_to_mtk_cam_video_device(file);
+
+	if (sizes->index)
+		return -EINVAL;
+
+	if (!mtk_cam_dev_find_fmt(vdev->desc, sizes->pixel_format))
+		return -EINVAL;
+
+	sizes->type = vdev->desc->frmsizes->type;
+	memcpy(&sizes->stepwise, &vdev->desc->frmsizes->stepwise,
+	       sizeof(sizes->stepwise));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
+	.vidioc_querycap = mtk_cam_vidioc_querycap,
+	.vidioc_enum_framesizes = mtk_cam_vidioc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap = mtk_cam_vidioc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_cam_vidioc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_cam_vidioc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_cam_vidioc_try_fmt,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+/* -----------------------------------------------------------------------------
+ * Init & Cleanup
+ */
+
+static const u32 stream_out_fmts[] = {
+	/* The 1st entry is the default image format */
+	V4L2_PIX_FMT_SBGGR8,
+	V4L2_PIX_FMT_SGBRG8,
+	V4L2_PIX_FMT_SGRBG8,
+	V4L2_PIX_FMT_SRGGB8,
+	V4L2_PIX_FMT_UYVY,
+	V4L2_PIX_FMT_VYUY,
+	V4L2_PIX_FMT_YUYV,
+	V4L2_PIX_FMT_YVYU,
+};
+
+static const struct mtk_cam_vdev_desc video_stream = {
+	.fmts = stream_out_fmts,
+	.num_fmts = ARRAY_SIZE(stream_out_fmts),
+	.frmsizes =
+		&(struct v4l2_frmsizeenum){
+			.index = 0,
+			.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+			.stepwise = {
+				.max_width = IMG_MAX_WIDTH,
+				.min_width = IMG_MIN_WIDTH,
+				.max_height = IMG_MAX_HEIGHT,
+				.min_height = IMG_MIN_HEIGHT,
+				.step_height = 1,
+				.step_width = 1,
+			},
+		},
+};
+
+int mtk_cam_video_register(struct mtk_cam_dev *cam)
+{
+	struct device *dev = cam->dev;
+	struct mtk_cam_video_device *cam_vdev = &cam->vdev;
+	struct video_device *vdev = &cam_vdev->vdev;
+	struct vb2_queue *vbq = &cam_vdev->vbq;
+	int ret;
+
+	vb2_dma_contig_set_max_seg_size(cam->dev, DMA_BIT_MASK(32));
+
+	cam_vdev->desc = &video_stream;
+
+	/* Initialize mtk_cam_video_device */
+	mtk_cam_dev_load_default_fmt(cam);
+
+	cam_vdev->vdev_pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	/* Initialize media entities */
+	ret = media_entity_pads_init(&vdev->entity, 1, &cam_vdev->vdev_pad);
+	if (ret) {
+		dev_err(dev, "failed to initialize media pad:%d\n", ret);
+		return ret;
+	}
+	cam_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+
+	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vbq->dev = dev;
+	vbq->ops = &mtk_cam_vb2_ops;
+	vbq->mem_ops = &vb2_dma_contig_memops;
+	vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
+	/*
+	 * TODO: The hardware supports SOF interrupts, switch to a SOF
+	 * timestamp source would give better accuracy, but first requires
+	 * extending the V4L2 API to support it.
+	 */
+	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
+			     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+
+	/* No minimum buffers limitation */
+	vbq->min_queued_buffers = 0;
+	vbq->drv_priv = cam;
+
+	vbq->lock = &cam_vdev->vdev_lock;
+	ret = vb2_queue_init(vbq);
+	if (ret) {
+		dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
+		goto fail_media_clean;
+	}
+
+	/* Initialize vdev */
+	snprintf(vdev->name, sizeof(vdev->name), "%s video stream",
+		 dev_name(dev));
+
+	/* Set cap/type/ioctl_ops of the video device */
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
+			  | V4L2_CAP_IO_MC;
+	vdev->ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops;
+	vdev->fops = &mtk_cam_v4l2_fops;
+	vdev->release = video_device_release_empty;
+	vdev->lock = &cam_vdev->vdev_lock;
+	vdev->v4l2_dev = cam->subdev.v4l2_dev;
+	vdev->queue = &cam_vdev->vbq;
+	vdev->vfl_dir = VFL_DIR_RX;
+	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
+	video_set_drvdata(vdev, cam);
+
+	/* Initialize miscellaneous variables */
+	mutex_init(&cam_vdev->vdev_lock);
+	INIT_LIST_HEAD(&cam->buf_list);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(dev, "failed to register vde:%d\n", ret);
+		goto fail_vb2_rel;
+	}
+
+	/* Create link between the video pad and the subdev pad. */
+	ret = media_create_pad_link(&cam->subdev.entity,
+				    MTK_CAM_CIO_PAD_VIDEO,
+				    &vdev->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE
+				    | MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto fail_vdev_ureg;
+
+	return 0;
+
+fail_vdev_ureg:
+	video_unregister_device(vdev);
+fail_vb2_rel:
+	mutex_destroy(&cam_vdev->vdev_lock);
+	vb2_queue_release(vbq);
+fail_media_clean:
+	media_entity_cleanup(&vdev->entity);
+
+	return ret;
+}
+
+void mtk_cam_video_unregister(struct mtk_cam_video_device *vdev)
+{
+	video_unregister_device(&vdev->vdev);
+	vb2_queue_release(&vdev->vbq);
+	media_entity_cleanup(&vdev->vdev.entity);
+	mutex_destroy(&vdev->vdev_lock);
+	vb2_dma_contig_clear_max_seg_size(&vdev->vdev.dev);
+}

-- 
2.47.1


