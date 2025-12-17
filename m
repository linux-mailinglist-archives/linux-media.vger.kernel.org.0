Return-Path: <linux-media+bounces-49013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D9CC9202
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 18:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 555A6309585B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 17:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3907934D4C6;
	Wed, 17 Dec 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YGfP9OJO"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22434346A18;
	Wed, 17 Dec 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765993340; cv=none; b=ou1hyIYGHuqT7p93EL0bUHMrYdMuV/36PUgk3NFMbLi+Dt8eJyVk3RF9WGyPc9FV54fSgTM8szy3ezNGZlSY8mYZ7TN5awrmi5f5oEGjw6WP9bD5hKWzfWf7HtCXsnJpTW6at9+L538EYZOkdOlac2CtAJqBTWqRiuuD0xU4VNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765993340; c=relaxed/simple;
	bh=dAhuFQVynzN1qhzst3A2f4cRz55DoWjVGRn/HpKPdmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhY1zaeOPGUbLzuyPnbussYr5988gOMxvmxAlhDv/VADvv/B5lV56julLz8HmXM/jnRcGOaqC3nkMVhZZihAevo3SnbWUBcQVkRIpYGT+IaRo7ue5ju5K9jGFv3PSUhm/GtIXvhzGab0Pw/S2VCPmXTdpl4mCb+Bvy+OWurF29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YGfP9OJO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993333;
	bh=dAhuFQVynzN1qhzst3A2f4cRz55DoWjVGRn/HpKPdmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGfP9OJOLKxGkJqUFZiEJ8aMZ/a8LguSQkz03zYiv47y7xgJsNPR+8N+8ld3IAAM9
	 9W+1Q7scxj62GqOWzTJJlAf1nAHbvo+qIdeh4yTaT0Vk0Cbr8KK4vO6ZwP2Lt1gU8o
	 pPFKqD24LuDBqP92VzRJhUt8LXL934TMKlpKckYL9yQjAV08lPENj/+cXO0W9PPOJL
	 vD6YkY0mh5LLVjn3IvYF0ETgvSWyT2aKpcMN9Wch3yMPn9a/SLVBxDNteGfNzGj90K
	 sXgBbTN1dvls36ltMapiYsZFRaBTpvXLptVT+Zy3T8WeAZckqb7Nu4CJdGxXY8YJPp
	 D0/KsRWd/S4vQ==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A58D17E151E;
	Wed, 17 Dec 2025 18:42:11 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v6 10/17] media: rkvdec: Add RCB and SRAM support
Date: Wed, 17 Dec 2025 12:40:47 -0500
Message-ID: <20251217174059.1341784-11-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217174059.1341784-1-detlev.casanova@collabora.com>
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RCB (Rows and Cols Buffers) are a set of buffers used by other
variations of the decoder to store temporary data.

Those variation come with a dedicated SRAM area used to store those
buffers for better performances.

The buffer sizes are either the width or height of the frame being
decoded multiplied by a documented factor and can be stored either
in SRAM or RAM.
A fallback to RAM is provided if the SRAM is full (e.g.: multiple
streams are being decoded at the same time).

To manage the different kind of allocation, an enum is added to the
rkvdec_aux_buf struct to specify how the buffer was allocated, and
so, how to free it.

This commit is in preparation of other variants support.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/Makefile   |   1 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 178 ++++++++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |  29 +++
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  27 ++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  13 ++
 5 files changed, 246 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index 1b4bc44be23e..3d75103e536d 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -7,4 +7,5 @@ rockchip-vdec-y += \
 		   rkvdec-h264-common.o \
 		   rkvdec-hevc.o \
 		   rkvdec-hevc-common.o \
+		   rkvdec-rcb.o \
 		   rkvdec-vp9.o
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
new file mode 100644
index 000000000000..320998ed2c74
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip video decoder Rows and Cols Buffers manager
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *  Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include "rkvdec.h"
+#include "rkvdec-rcb.h"
+
+#include <linux/types.h>
+#include <linux/iommu.h>
+#include <linux/genalloc.h>
+
+struct rkvdec_rcb_config {
+	struct rkvdec_aux_buf *rcb_bufs;
+	size_t rcb_count;
+};
+
+static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
+			      unsigned int width, unsigned int height)
+{
+	return size_info->multiplier * (size_info->axis == PIC_HEIGHT ? height : width);
+}
+
+dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id)
+{
+	return ctx->rcb_config->rcb_bufs[id].dma;
+}
+
+size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id)
+{
+	return ctx->rcb_config->rcb_bufs[id].size;
+}
+
+int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
+{
+	return ctx->rcb_config->rcb_count;
+}
+
+void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *dev = ctx->dev;
+	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
+	unsigned long virt_addr;
+	int i;
+
+	if (!cfg)
+		return;
+
+	for (i = 0; i < cfg->rcb_count; i++) {
+		size_t rcb_size = cfg->rcb_bufs[i].size;
+
+		if (!cfg->rcb_bufs[i].cpu)
+			continue;
+
+		switch (cfg->rcb_bufs[i].type) {
+		case RKVDEC_ALLOC_SRAM:
+			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
+
+			if (dev->iommu_domain)
+				iommu_unmap(dev->iommu_domain, virt_addr, rcb_size);
+			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
+			break;
+		case RKVDEC_ALLOC_DMA:
+			dma_free_coherent(dev->dev,
+					  rcb_size,
+					  cfg->rcb_bufs[i].cpu,
+					  cfg->rcb_bufs[i].dma);
+			break;
+		}
+	}
+
+	if (cfg->rcb_bufs)
+		devm_kfree(dev->dev, cfg->rcb_bufs);
+
+	devm_kfree(dev->dev, cfg);
+}
+
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+			const struct rcb_size_info *size_info,
+			size_t rcb_count)
+{
+	int ret, i;
+	u32 width, height;
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_rcb_config *cfg;
+
+	if (!size_info || !rcb_count) {
+		ctx->rcb_config = NULL;
+		return 0;
+	}
+
+	ctx->rcb_config = devm_kzalloc(rkvdec->dev, sizeof(*ctx->rcb_config), GFP_KERNEL);
+	if (!ctx->rcb_config)
+		return -ENOMEM;
+
+	cfg = ctx->rcb_config;
+
+	cfg->rcb_bufs = devm_kzalloc(rkvdec->dev, sizeof(*cfg->rcb_bufs) * rcb_count, GFP_KERNEL);
+	if (!cfg->rcb_bufs) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	width = ctx->decoded_fmt.fmt.pix_mp.width;
+	height = ctx->decoded_fmt.fmt.pix_mp.height;
+
+	for (i = 0; i < rcb_count; i++) {
+		void *cpu = NULL;
+		dma_addr_t dma;
+		size_t rcb_size = rkvdec_rcb_size(&size_info[i], width, height);
+		enum rkvdec_alloc_type alloc_type = RKVDEC_ALLOC_SRAM;
+
+		/* Try allocating an SRAM buffer */
+		if (ctx->dev->sram_pool) {
+			if (rkvdec->iommu_domain)
+				rcb_size = ALIGN(rcb_size, 0x1000);
+
+			cpu = gen_pool_dma_zalloc_align(ctx->dev->sram_pool,
+							rcb_size,
+							&dma,
+							0x1000);
+		}
+
+		/* If an IOMMU is used, map the SRAM address through it */
+		if (cpu && rkvdec->iommu_domain) {
+			unsigned long virt_addr = (unsigned long)cpu;
+			phys_addr_t phys_addr = dma;
+
+			ret = iommu_map(rkvdec->iommu_domain, virt_addr, phys_addr,
+					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
+			if (ret) {
+				gen_pool_free(ctx->dev->sram_pool,
+					      (unsigned long)cpu,
+					      rcb_size);
+				cpu = NULL;
+				goto ram_fallback;
+			}
+
+			/*
+			 * The registers will be configured with the virtual
+			 * address so that it goes through the IOMMU
+			 */
+			dma = virt_addr;
+		}
+
+ram_fallback:
+		/* Fallback to RAM */
+		if (!cpu) {
+			cpu = dma_alloc_coherent(ctx->dev->dev,
+						 rcb_size,
+						 &dma,
+						 GFP_KERNEL);
+			alloc_type = RKVDEC_ALLOC_DMA;
+		}
+
+		if (!cpu) {
+			ret = -ENOMEM;
+			goto err_alloc;
+		}
+
+		cfg->rcb_bufs[i].cpu = cpu;
+		cfg->rcb_bufs[i].dma = dma;
+		cfg->rcb_bufs[i].size = rcb_size;
+		cfg->rcb_bufs[i].type = alloc_type;
+
+		cfg->rcb_count += 1;
+	}
+
+	return 0;
+
+err_alloc:
+	rkvdec_free_rcb(ctx);
+
+	return ret;
+}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
new file mode 100644
index 000000000000..30e8002555c8
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip video decoder Rows and Cols Buffers manager
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *  Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <linux/types.h>
+
+struct rkvdec_ctx;
+
+enum rcb_axis {
+	PIC_WIDTH = 0,
+	PIC_HEIGHT = 1
+};
+
+struct rcb_size_info {
+	u8 multiplier;
+	enum rcb_axis axis;
+};
+
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+			const struct rcb_size_info *size_info,
+			size_t rcb_count);
+dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
+size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
+int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
+void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 968982f6e62c..028ce8e1c4ca 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/genalloc.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -28,6 +29,7 @@
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
+#include "rkvdec-rcb.h"
 
 static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
 				   enum rkvdec_image_fmt fmt2)
@@ -771,6 +773,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
 	const struct rkvdec_coded_fmt_desc *desc;
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	int ret;
 
 	if (V4L2_TYPE_IS_CAPTURE(q->type))
@@ -780,13 +783,22 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (WARN_ON(!desc))
 		return -EINVAL;
 
+	ret = rkvdec_allocate_rcb(ctx, variant->rcb_sizes, variant->num_rcb_sizes);
+	if (ret)
+		return ret;
+
 	if (desc->ops->start) {
 		ret = desc->ops->start(ctx);
 		if (ret)
-			return ret;
+			goto err_ops_start;
 	}
 
 	return 0;
+
+err_ops_start:
+	rkvdec_free_rcb(ctx);
+
+	return ret;
 }
 
 static void rkvdec_queue_cleanup(struct vb2_queue *vq, u32 state)
@@ -822,6 +834,8 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
 
 		if (desc->ops->stop)
 			desc->ops->stop(ctx);
+
+		rkvdec_free_rcb(ctx);
 	}
 
 	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
@@ -1348,6 +1362,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)
+		dev_info(&pdev->dev, "No sram node, RCB will be stored in RAM\n");
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -1356,7 +1374,8 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_runtime_pm;
 
-	if (iommu_get_domain_for_dev(&pdev->dev)) {
+	rkvdec->iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
+	if (rkvdec->iommu_domain) {
 		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
 
 		if (IS_ERR(rkvdec->empty_domain)) {
@@ -1370,6 +1389,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 err_disable_runtime_pm:
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+
+	if (rkvdec->sram_pool)
+		gen_pool_destroy(rkvdec->sram_pool);
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index aac6cba4c623..77c0950a465d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -19,6 +19,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -29,6 +30,7 @@
 #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
 
 struct rkvdec_ctx;
+struct rkvdec_rcb_config;
 
 struct rkvdec_ctrl_desc {
 	struct v4l2_ctrl_config cfg;
@@ -73,6 +75,8 @@ struct rkvdec_variant {
 	unsigned int num_regs;
 	const struct rkvdec_coded_fmt_desc *coded_fmts;
 	size_t num_coded_fmts;
+	const struct rcb_size_info *rcb_sizes;
+	size_t num_rcb_sizes;
 	unsigned int capabilities;
 	unsigned int quirks;
 };
@@ -125,6 +129,8 @@ struct rkvdec_dev {
 	void __iomem *regs;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
+	struct gen_pool *sram_pool;
+	struct iommu_domain *iommu_domain;
 	struct iommu_domain *empty_domain;
 	const struct rkvdec_variant *variant;
 };
@@ -137,6 +143,7 @@ struct rkvdec_ctx {
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct rkvdec_dev *dev;
 	enum rkvdec_image_fmt image_fmt;
+	struct rkvdec_rcb_config *rcb_config;
 	void *priv;
 };
 
@@ -145,10 +152,16 @@ static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
 	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);
 }
 
+enum rkvdec_alloc_type {
+	RKVDEC_ALLOC_DMA  = 0,
+	RKVDEC_ALLOC_SRAM = 1,
+};
+
 struct rkvdec_aux_buf {
 	void *cpu;
 	dma_addr_t dma;
 	size_t size;
+	enum rkvdec_alloc_type type;
 };
 
 void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
-- 
2.52.0


