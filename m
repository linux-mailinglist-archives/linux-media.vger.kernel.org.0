Return-Path: <linux-media+bounces-39791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B734B2467F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0453B1F19
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807472F744D;
	Wed, 13 Aug 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A80pRl1J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE72F5482;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078916; cv=none; b=iUuiURSyMguw44bE6Sh6THLYAXX4v+U4YWFJbKXn1lep2F65xI2I3bypEoq596UUicGp/Q1kC2YMfyU0P0du6RMjeIyEIVItu83CSCBHffIFYelQB+uxnKWZlOL+myCfPv0ZE6NAnhhQmx5icMojT0Wkb3kvjYKphmiuCSaJ7zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078916; c=relaxed/simple;
	bh=2zzxLM8I4VoAz1Zn9MosDXXDN79gxvjjWvXqtxvblcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wb2rgzJ5q6K0GKIsGKiX5mT/BOZeQBsI/O5vOgIE6DqWSQSMg7iGKWt8z0WcpYz9O88+figxHoA5Hog6jzy1s8ihABbzsiZZI7YNcnimtLIzlevfxoQPr5VCpeTLLxQ+Vp8H4LaVrKAaS0VXT3UIQOfv2MuEeCPzU9Hn82AZlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A80pRl1J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31D3FC116B1;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078916;
	bh=2zzxLM8I4VoAz1Zn9MosDXXDN79gxvjjWvXqtxvblcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A80pRl1JQMh7GhgD8tCSAFMAF1PDAOASGZnEj0f9Yav7bP1tAaZdmq5y6KSyYcOXI
	 b6hA9XjBUmRUZxXIrqPYR1fUqDGgIoErNBnQbL5ORnHY1FDxS0LunJfsLvyR+lnEWc
	 F+mg2ktPoXrHOKZxao/be7eHGqe4f4EXeQgTib+gzW1LAELO9Gs33PMxtUp7JuHer2
	 xXIi0mqPH5ahRL2Qbp8OA0RRc8VFrHhaz9+sOAj+zDEYorXWcyfo8GE0JTBLLpAdEF
	 NWJ1HvXcSc7eyesolGneBPpJYKSGqejvfe8+kBEjCuQPFavd6bopZJ7Fl9qnqAWGr3
	 CMmqZWc5aVS0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298DECA0EE4;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 13 Aug 2025 09:54:56 +0000
Subject: [PATCH v5 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-allegro_dvt_al300_dec_driver-v5-4-a312ddebc4d8@allegrodvt.com>
References: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
In-Reply-To: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=97130;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=t1te1Q/abaeuwgOQx0o+GAML0kGpbgF8qMI9Ci7Ocls=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWTMSWRa3WUX9klrzcSpwuXTXRbLWYuF1kdYXBe+ITbtd
 pz0/5UdHaUsDGJcDLJiiiwfDJY++8JW4zOjhW0+zBxWJpAhDFycAjARmVxGhoPM6ya/8mI5uMMq
 4LvModJ/FksM1WserskRW/N5R8IrGVVGhrMbdjfd67+1403+4ZgFnuKteaal00W5SpflCC9jdqh
 +wgAA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

This commit introduces a new allegro-dvt V4L2 stateful decoder driverfor
the Gen 3 IP with support for:
- AVC (H.264), HEVC (H.265), and JPEG decoding
- Output formats: NV12, NV16, I420, and P010 for capture

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 drivers/media/platform/allegro-dvt/Kconfig         |    1 +
 drivers/media/platform/allegro-dvt/Makefile        |    1 +
 drivers/media/platform/allegro-dvt/al300/Kconfig   |   23 +
 drivers/media/platform/allegro-dvt/al300/Makefile  |    9 +
 .../platform/allegro-dvt/al300/al_codec_common.c   |  764 ++++++++++
 .../platform/allegro-dvt/al300/al_codec_common.h   |  252 ++++
 .../platform/allegro-dvt/al300/al_codec_dbgfs.c    |  229 +++
 .../platform/allegro-dvt/al300/al_codec_dbgfs.h    |   71 +
 .../platform/allegro-dvt/al300/al_codec_util.c     |  180 +++
 .../platform/allegro-dvt/al300/al_codec_util.h     |  196 +++
 .../media/platform/allegro-dvt/al300/al_vdec_drv.c | 1514 ++++++++++++++++++++
 .../media/platform/allegro-dvt/al300/al_vdec_drv.h |   98 ++
 12 files changed, 3338 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index e9008614c27b9490d1cd29fab887977a1918ede4..0d01ed0ad08ab3bf63fc6bc60ac6c8ad9b31c9ab 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,4 +2,5 @@
 
 comment "Allegro DVT media platform drivers"
 
+source "drivers/media/platform/allegro-dvt/al300/Kconfig"
 source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index d2aa6875edcf7760901996aac4d5ac98282cce20..c70ca19a47fb7a50a568b37ce519bbedbefe670d 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-y += al300/
 obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/al300/Kconfig b/drivers/media/platform/allegro-dvt/al300/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..0bc3d7a79f14038a4f497f736b14a7fc7cca0aeb
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ALLEGRO_DVT_D300
+	tristate "Allegro DVT Video IP Decode Gen 3"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF && HAS_DMA
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  This is a video4linux2 driver for the Allegro DVT IP Decode Gen 3,
+	  that support codecs : AVC (H.264), HEVC (H.265), and JPEG.
+
+	  The driver provides hardware acceleration for video decoding operations,
+	  enabling efficient processing of compressed video streams on platforms
+	  featuring this IP block. It handles memory management, buffer allocation,
+	  and decoder command sequencing to deliver optimized performance.
+
+	  The driver integrates with the V4L2 framework and videobuf2 subsystem
+	  to provide a standard interface for applications requiring video
+	  decoding capabilities.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called al300-vdec.
diff --git a/drivers/media/platform/allegro-dvt/al300/Makefile b/drivers/media/platform/allegro-dvt/al300/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..e5bc317ee2a76963ff8bfe4a584ce5bde1a98fb7
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+al300-vdec-objs := al_codec_common.o al_codec_util.o al_vdec_drv.o
+
+ifneq ($(CONFIG_DEBUG_FS),)
+al300-vdec-objs += al_codec_dbgfs.o
+endif
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT_D300) += al300-vdec.o
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
new file mode 100644
index 0000000000000000000000000000000000000000..6c950a4022fbdab3cc1d4268c04434b4253e4f1d
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
@@ -0,0 +1,764 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Core MCU functionality including firmware loading,
+ * memory allocation, and general MCU interaction interfaces
+ *
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "al_codec_common.h"
+
+#define AL_CODEC_UID 0x0000
+#define AL_CODEC_RESET 0x0010
+#define AL_CODEC_IRQ_MASK 0x0014
+#define AL_CODEC_IRQ_STATUS_CLEAR 0x0018
+#define AL_CODEC_MCU_CLK 0x0400
+#define AL_CODEC_MCU_RST 0x0404
+#define AL_CODEC_MCU_IRQ 0x040C
+#define AL_CODEC_MCU_BOOT_ADDR_HI 0x0410
+#define AL_CODEC_MCU_BOOT_ADDR_LO 0x0414
+#define AL_CODEC_MCU_IP_START_ADDR_HI 0x0418
+#define AL_CODEC_MCU_IP_START_ADDR_LO 0x041C
+#define AL_CODEC_MCU_IP_END_ADDR_HI 0x0420
+#define AL_CODEC_MCU_IP_END_ADDR_LO 0x0424
+#define AL_CODEC_MCU_PERIPH_ADDR_HI 0x0428
+#define AL_CODEC_MCU_PERIPH_ADDR_LO 0x042C
+#define AL_CODEC_MCU_IRQ_MASK 0x0440
+#define AL_CODEC_INST_OFFSET_HI 0x0450
+#define AL_CODEC_INST_OFFSET_LO 0x0454
+#define AL_CODEC_DATA_OFFSET_HI 0x0458
+#define AL_CODEC_DATA_OFFSET_LO 0x045C
+
+#define AL_CODEC_UID_ID 0x30AB6E51
+#define AL_CODEC_IRQ_MCU_2_CPU BIT(30)
+#define AL_CODEC_IP_OFFSET GENMASK(26, 25)
+#define AL_CODEC_APB_MASK GENMASK(26, 0)
+#define MCU_FLAT_MEMORY_SIZE (256ULL * 1024 * 1024 * 1024) /* 256GB */
+
+#define AL_CODEC_MCU_BOOT_RESET_WAIT 2 /* in ms */
+#define AL_CODEC_REG_ENABLE BIT(0)
+#define AL_CODEC_REG_DISABLE 0
+
+/*
+ * struct codec_dma_buf - Allocated dma buffer
+ *
+ * @list: list head for buffer queue
+ * @paddr: physical address of the allcated DMA buffer
+ * @vaddr: virtual address of the allocated DMA buffer
+ * @size: Size of allocated dma memory
+ */
+struct codec_dma_buf {
+	void *vaddr;
+	dma_addr_t paddr;
+	u32 size;
+	struct list_head list;
+};
+
+struct mb_header {
+	u64 start;
+	u64 end;
+} __packed;
+
+struct boot_header {
+	u32 bh_version;
+	u32 fw_version;
+	char model[16];
+	u64 vaddr_start;
+	u64 vaddr_end;
+	u64 vaddr_boot;
+	struct mb_header h2m;
+	struct mb_header m2h;
+	u64 machine_id;
+	/* fill by driver before fw boot */
+	u64 ip_start;
+	u64 ip_end;
+	u64 mcu_clk_rate;
+} __packed;
+
+static u32 al_common_read(struct al_codec_dev *codec, u32 offset)
+{
+	return readl(codec->regs + offset);
+}
+
+static void al_common_write(struct al_codec_dev *codec, u32 offset, u32 val)
+{
+	writel(val, codec->regs + offset);
+}
+
+static void al_common_trigger_mcu_irq(void *arg)
+{
+	struct al_codec_dev *codec = arg;
+
+	al_common_write(codec, AL_CODEC_MCU_IRQ, BIT(0));
+}
+
+static inline void al_common_reset(struct al_codec_dev *codec)
+{
+	/* reset ip */
+	al_common_write(codec, AL_CODEC_RESET, AL_CODEC_REG_ENABLE);
+
+	/* reset and stop mcu */
+	al_common_write(codec, AL_CODEC_MCU_CLK, AL_CODEC_REG_ENABLE);
+	al_common_write(codec, AL_CODEC_MCU_RST, AL_CODEC_REG_ENABLE);
+	/* time to reset the mct */
+	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT);
+	al_common_write(codec, AL_CODEC_MCU_CLK, AL_CODEC_REG_DISABLE);
+
+	al_common_write(codec, AL_CODEC_MCU_IRQ, AL_CODEC_REG_DISABLE);
+	al_common_write(codec, AL_CODEC_MCU_IRQ_MASK, AL_CODEC_REG_DISABLE);
+
+	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT * 5);
+	al_common_write(codec, AL_CODEC_MCU_RST, AL_CODEC_REG_DISABLE);
+}
+
+static int al_common_setup_hw_regs(struct al_codec_dev *codec)
+{
+	u64 reg_start, reg_end;
+	dma_addr_t boot_addr;
+	unsigned int id;
+
+	id = al_common_read(codec, AL_CODEC_UID);
+
+	if (id != AL_CODEC_UID_ID) {
+		al_codec_err(codec,
+			     "bad device id, expected 0x%08x, got 0x%08x",
+			     AL_CODEC_UID_ID, id);
+		return -ENODEV;
+	}
+
+	boot_addr = codec->firmware.phys + codec->firmware.bin_data.offset -
+		    codec->offset;
+
+	/* Reset MCU step */
+	al_common_reset(codec);
+
+	/* Configure the MCU*/
+	al_common_write(codec, AL_CODEC_IRQ_MASK, AL_CODEC_IRQ_MCU_2_CPU);
+	/* Set Instruction and data offset */
+	al_common_write(codec, AL_CODEC_INST_OFFSET_HI,
+			upper_32_bits(codec->offset));
+	al_common_write(codec, AL_CODEC_INST_OFFSET_LO,
+			lower_32_bits(codec->offset));
+	al_common_write(codec, AL_CODEC_DATA_OFFSET_HI,
+			upper_32_bits(codec->offset));
+	al_common_write(codec, AL_CODEC_DATA_OFFSET_LO,
+			lower_32_bits(codec->offset));
+
+	reg_start = codec->regs_info->start;
+	reg_end = reg_start + resource_size(codec->regs_info);
+	al_common_write(codec, AL_CODEC_MCU_IP_START_ADDR_HI,
+			upper_32_bits(reg_start));
+	al_common_write(codec, AL_CODEC_MCU_IP_START_ADDR_LO,
+			lower_32_bits(reg_start));
+	al_common_write(codec, AL_CODEC_MCU_IP_END_ADDR_HI,
+			upper_32_bits(reg_end));
+	al_common_write(codec, AL_CODEC_MCU_IP_END_ADDR_HI,
+			lower_32_bits(reg_end));
+
+	al_common_write(codec, AL_CODEC_MCU_PERIPH_ADDR_HI,
+			upper_32_bits(codec->apb));
+	al_common_write(codec, AL_CODEC_MCU_PERIPH_ADDR_LO,
+			lower_32_bits(codec->apb));
+
+	al_common_write(codec, AL_CODEC_MCU_BOOT_ADDR_HI,
+			upper_32_bits(boot_addr));
+	al_common_write(codec, AL_CODEC_MCU_BOOT_ADDR_LO,
+			lower_32_bits(boot_addr));
+
+	return 0;
+}
+
+static void al_common_dma_buf_insert(struct al_codec_dev *codec,
+				     struct codec_dma_buf *buf)
+{
+	guard(mutex)(&codec->buf_lock);
+	list_add(&buf->list, &codec->alloc_buffers);
+}
+
+static void al_common_dma_buf_remove(struct al_codec_dev *codec,
+				     struct codec_dma_buf *buf)
+{
+	struct device *dev = &codec->pdev->dev;
+
+	guard(mutex)(&codec->buf_lock);
+	dma_free_coherent(dev, buf->size, buf->vaddr, buf->paddr);
+	list_del(&buf->list);
+	kfree(buf);
+}
+
+static struct codec_dma_buf *
+al_common_dma_buf_lookup(struct al_codec_dev *codec, dma_addr_t buf_paddr)
+{
+	struct codec_dma_buf *buf = NULL;
+
+	guard(mutex)(&codec->buf_lock);
+	list_for_each_entry(buf, &codec->alloc_buffers, list)
+		if (likely(buf->paddr == buf_paddr))
+			break;
+
+	return list_entry_is_head(buf, &codec->alloc_buffers, list) ? NULL :
+								      buf;
+}
+
+static void al_common_dma_buf_cleanup(struct al_codec_dev *codec)
+{
+	struct device *dev = &codec->pdev->dev;
+	struct codec_dma_buf *buf, *tmp;
+
+	guard(mutex)(&codec->buf_lock);
+	list_for_each_entry_safe(buf, tmp, &codec->alloc_buffers, list) {
+		dma_free_coherent(dev, buf->size, buf->vaddr, buf->paddr);
+		list_del(&buf->list);
+		kfree(buf);
+	}
+}
+
+static inline uint64_t get_mcu_offset(uint64_t paddr)
+{
+	if (paddr < MCU_FLAT_MEMORY_SIZE)
+		return 0;
+
+	return paddr - MCU_FLAT_MEMORY_SIZE;
+}
+
+static int al_common_setup_dma(struct al_codec_dev *codec)
+{
+	struct device *dev = &codec->pdev->dev;
+	struct device_node *node;
+	struct resource r;
+	int ret;
+
+	/* setup dma memory mask */
+	if (!dev->coherent_dma_mask) {
+		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
+		if (ret) {
+			al_codec_err(codec, "Failed to set dma mask %d\n", ret);
+			return ret;
+		}
+	}
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_warn(dev, "No reserved memory, use cma instead\n");
+		return 0;
+	}
+
+	/* Try to use reserved memory if we got one */
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		al_codec_err(codec, "Couldn't get reserved memory (errno: %d)",
+			     ret);
+		return ret;
+	}
+
+	ret = of_address_to_resource(node, 0, &r);
+	of_node_put(node);
+	if (ret) {
+		al_codec_err(codec,
+			     "Failed to parse the memory-region resources");
+		return ret;
+	}
+
+	codec->offset = get_mcu_offset(r.start);
+
+	return 0;
+}
+
+void al_common_remove(struct al_codec_dev *codec)
+{
+	/* Cleanup allocated internal buffers used by the mcu*/
+	al_common_dma_buf_cleanup(codec);
+
+	/* reset codecice */
+	al_common_reset(codec);
+	clk_disable_unprepare(codec->clk);
+	/* Free the allocated memory for the firmware */
+	dma_free_coherent(&codec->pdev->dev, codec->firmware.size,
+			  codec->firmware.virt, codec->firmware.phys);
+
+	if (codec->firmware.firmware)
+		release_firmware(codec->firmware.firmware);
+}
+
+static void handle_alloc_memory_req(struct al_codec_dev *codec,
+				    struct msg_itf_header *hdr)
+{
+	struct device *dev = &codec->pdev->dev;
+	struct msg_itf_alloc_mem_req req;
+	struct msg_itf_alloc_mem_reply_full reply = {
+		.reply.phyAddr = 0,
+		.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY,
+		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
+		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
+		.hdr.payload_len = sizeof(struct msg_itf_alloc_mem_reply),
+	};
+	struct codec_dma_buf *buf;
+	int ret;
+
+	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
+	if (ret) {
+		al_codec_err(codec, "Unable to get cma req %d", ret);
+		return;
+	}
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		goto send_reply;
+
+	buf->size = req.uSize;
+	buf->vaddr =
+		dma_alloc_coherent(dev, buf->size, &buf->paddr, GFP_KERNEL);
+	if (!buf->vaddr) {
+		dev_warn(dev, "Failed to allocate DMA buffer\n");
+		goto send_reply;
+	}
+
+	reply.reply.phyAddr = (u64)buf->paddr;
+	al_common_dma_buf_insert(codec, buf);
+
+send_reply:
+	ret = al_common_send(codec, &reply.hdr);
+	if (ret) {
+		al_codec_err(codec, "Unable to reply to cma alloc");
+		al_common_dma_buf_remove(codec, buf);
+	}
+}
+
+static void handle_free_memory_req(struct al_codec_dev *codec,
+				   struct msg_itf_header *hdr)
+{
+	struct msg_itf_free_mem_req req;
+	struct msg_itf_free_mem_reply_full reply = {
+		.hdr.type = MSG_ITF_TYPE_FREE_MEM_REPLY,
+		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
+		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
+		.hdr.payload_len = sizeof(struct msg_itf_free_mem_reply),
+		.reply.ret = -1,
+	};
+	struct codec_dma_buf *buf;
+	int ret;
+
+	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
+	if (ret) {
+		al_codec_err(codec, "Unable to put cma req");
+		return;
+	}
+
+	buf = al_common_dma_buf_lookup(codec, req.phyAddr);
+	if (!buf) {
+		al_codec_err(codec, "Unable to get dma handle for %p",
+			     (void *)(long)req.phyAddr);
+		reply.reply.ret = -EINVAL;
+		goto send_reply;
+	}
+
+	al_codec_dbg(codec, "Free memory %p, size %d",
+		     (void *)(long)req.phyAddr, buf->size);
+
+	al_common_dma_buf_remove(codec, buf);
+	reply.reply.ret = 0;
+
+send_reply:
+	ret = al_common_send(codec, &reply.hdr);
+	if (ret)
+		al_codec_err(codec, "Unable to reply to cma free");
+}
+
+static void handle_mcu_console_print(struct al_codec_dev *codec,
+				     struct msg_itf_header *hdr)
+{
+	struct msg_itf_write_req *req;
+	int ret;
+
+	/* one more byte to be sure to have a zero terminated string */
+	req = kzalloc(hdr->payload_len + 1, GFP_KERNEL);
+	if (!req) {
+		al_common_skip_data(codec, hdr->payload_len);
+		al_codec_err(codec, "Unable to alloc memory");
+		return;
+	}
+
+	ret = al_codec_msg_get_data(&codec->mb_m2h, (char *)req,
+				    hdr->payload_len);
+	if (ret) {
+		al_codec_err(codec, "Unable to get request");
+		kfree(req);
+		return;
+	}
+
+	/* Print the mcu logs */
+	al_mcu_dbg(codec, "%s", (char *)(req + 1));
+	kfree(req);
+}
+
+static void process_one_message(struct al_codec_dev *codec,
+				struct msg_itf_header *hdr)
+{
+	switch (hdr->type) {
+	case MSG_ITF_TYPE_ALLOC_MEM_REQ:
+		handle_alloc_memory_req(codec, hdr);
+		break;
+	case MSG_ITF_TYPE_FREE_MEM_REQ:
+		handle_free_memory_req(codec, hdr);
+		break;
+	case MSG_ITF_TYPE_WRITE_REQ:
+		handle_mcu_console_print(codec, hdr);
+		break;
+	case MSG_ITF_TYPE_MCU_ALIVE:
+		complete(&codec->completion);
+		break;
+	default:
+		codec->process_msg_cb(codec->cb_arg, hdr);
+		break;
+	}
+}
+
+static irqreturn_t al_common_irq_handler(int irq, void *data)
+{
+	struct al_codec_dev *codec = data;
+	struct msg_itf_header hdr;
+
+	/* poll all messages */
+	while (al_codec_msg_get_header(&codec->mb_m2h, &hdr) == 0)
+		process_one_message(codec, &hdr);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t al_common_hardirq_handler(int irq, void *data)
+{
+	struct al_codec_dev *codec = data;
+
+	if (al_common_read(codec, AL_CODEC_IRQ_STATUS_CLEAR) == 0)
+		return IRQ_NONE;
+
+	al_common_write(codec, AL_CODEC_IRQ_STATUS_CLEAR,
+			AL_CODEC_IRQ_MCU_2_CPU);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int al_common_start_fw(struct al_codec_dev *codec)
+{
+	/* Enable the MCU clock */
+	al_common_write(codec, AL_CODEC_MCU_CLK, AL_CODEC_REG_ENABLE);
+
+	return !wait_for_completion_timeout(&codec->completion, 2 * HZ);
+}
+
+static void al_common_copy_firmware_image(struct al_codec_dev *codec)
+{
+	const struct firmware *firmware = codec->firmware.firmware;
+	u32 *virt = codec->firmware.virt;
+
+	/* copy the whole thing taking into account endianness */
+	for (size_t i = 0; i < firmware->size / sizeof(u32); i++)
+		virt[i] = le32_to_cpu(((__le32 *)firmware->data)[i]);
+}
+
+static int al_common_read_firmware(struct al_codec_dev *codec, const char *name)
+{
+	struct device *dev = &codec->pdev->dev;
+	const struct boot_header *bh;
+	int err;
+
+	/* request_firmware prints error if it fails */
+	err = request_firmware(&codec->firmware.firmware, name, dev);
+	if (err < 0)
+		return err;
+
+	bh = (struct boot_header *)codec->firmware.firmware->data;
+	codec->firmware.size = bh->vaddr_end - bh->vaddr_start;
+
+	return 0;
+}
+
+static int al_common_parse_firmware_image(struct al_codec_dev *codec)
+{
+	struct boot_header *bh = (void *)codec->firmware.virt;
+
+	if (bh->bh_version < AL_BOOT_VERSION(2, 0, 0) ||
+	    bh->bh_version >= AL_BOOT_VERSION(3, 0, 0)) {
+		al_codec_err(codec, "Unsupported firmware version");
+		return -EINVAL;
+	}
+
+	codec->firmware.bin_data.offset = bh->vaddr_boot - bh->vaddr_start;
+	codec->firmware.bin_data.size = bh->vaddr_end - bh->vaddr_start;
+
+	codec->firmware.mb_h2m.offset = bh->h2m.start - bh->vaddr_start;
+	codec->firmware.mb_h2m.size = bh->h2m.end - bh->h2m.start;
+	codec->firmware.mb_m2h.offset = bh->m2h.start - bh->vaddr_start;
+	codec->firmware.mb_m2h.size = bh->m2h.end - bh->m2h.start;
+
+	/* Override some data */
+	bh->ip_start = codec->apb + AL_CODEC_IP_OFFSET;
+	bh->ip_end = bh->ip_start + resource_size(codec->regs_info);
+	bh->mcu_clk_rate = clk_get_rate(codec->clk);
+
+	al_codec_dbg(codec, "bh version     = 0x%08x", bh->bh_version);
+	al_codec_dbg(codec, "fw version     = 0x%08x", bh->fw_version);
+	al_codec_dbg(codec, "fw model       = %s", bh->model);
+	al_codec_dbg(codec, "vaddress start = 0x%016llx", bh->vaddr_start);
+	al_codec_dbg(codec, "vaddress end   = 0x%016llx", bh->vaddr_end);
+	al_codec_dbg(codec, "boot address   = 0x%016llx", bh->vaddr_boot);
+	al_codec_dbg(codec, "machineid      = %lld", bh->machine_id);
+	al_codec_dbg(codec, "periph address = 0x%llx", (u64)codec->apb);
+	al_codec_dbg(codec, "ip start       = 0x%016llx", bh->ip_start);
+	al_codec_dbg(codec, "ip end         = 0x%016llx", bh->ip_end);
+	al_codec_dbg(codec, "mcu clk	      = %llu", bh->mcu_clk_rate);
+
+	return 0;
+}
+
+static int al_common_load_firmware_start(struct al_codec_dev *codec,
+					 const char *name)
+{
+	struct device *dev = &codec->pdev->dev;
+	dma_addr_t phys;
+	size_t size;
+	void *virt;
+	int err;
+
+	if (codec->firmware.virt)
+		return 0;
+
+	err = al_common_read_firmware(codec, name);
+	if (err)
+		return err;
+
+	size = codec->firmware.size;
+
+	virt = dma_alloc_coherent(dev, size, &phys, GFP_KERNEL);
+	err = dma_mapping_error(dev, phys);
+	if (err < 0)
+		return err;
+
+	codec->firmware.virt = virt;
+	codec->firmware.phys = phys;
+
+	al_common_copy_firmware_image(codec);
+	err = al_common_parse_firmware_image(codec);
+	if (err) {
+		al_codec_err(codec, "failed to parse firmware image");
+		goto cleanup;
+	}
+
+	err = al_common_setup_hw_regs(codec);
+	if (err) {
+		al_codec_err(codec, "Unable to setup hw registers");
+		goto cleanup;
+	}
+
+	al_codec_mb_init(&codec->mb_h2m, virt + codec->firmware.mb_h2m.offset,
+			 codec->firmware.mb_h2m.size, MB_IFT_MAGIC_H2M);
+
+	al_codec_mb_init(&codec->mb_m2h, virt + codec->firmware.mb_m2h.offset,
+			 codec->firmware.mb_m2h.size, MB_IFT_MAGIC_M2H);
+
+	err = al_common_start_fw(codec);
+	if (err) {
+		al_codec_err(codec, "fw start has failed");
+		goto cleanup;
+	}
+
+	al_codec_dbg(codec, "mcu has boot successfully !");
+	codec->fw_ready_cb(codec->cb_arg);
+
+	release_firmware(codec->firmware.firmware);
+	codec->firmware.firmware = NULL;
+
+	return 0;
+
+cleanup:
+	dma_free_coherent(dev, size, virt, phys);
+
+	return err;
+}
+
+static u64 al_common_get_periph_addr(struct al_codec_dev *codec)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(codec->pdev, IORESOURCE_MEM, "apb");
+	if (!res) {
+		al_codec_err(codec, "Unable to find APB start address");
+		return 0;
+	}
+
+	if (res->start & AL_CODEC_APB_MASK) {
+		al_codec_err(codec, "APB start address is invalid");
+		return 0;
+	}
+
+	return res->start;
+}
+
+int al_common_probe(struct al_codec_dev *codec, const char *name)
+{
+	struct platform_device *pdev = codec->pdev;
+	int irq;
+	int ret;
+
+	mutex_init(&codec->buf_lock);
+	INIT_LIST_HEAD(&codec->alloc_buffers);
+	init_completion(&codec->completion);
+	codec->offset = 0;
+
+	/* setup dma memory */
+	ret = al_common_setup_dma(codec);
+	if (ret)
+		return ret;
+
+	/* Hw registers */
+	codec->regs_info =
+		platform_get_resource_byname(pdev, IORESOURCE_MEM, "top");
+	if (!codec->regs_info) {
+		al_codec_err(codec, "regs resource missing from device tree");
+		return -EINVAL;
+	}
+
+	codec->regs = devm_ioremap_resource(&pdev->dev, codec->regs_info);
+	if (!codec->regs) {
+		al_codec_err(codec, "failed to map registers");
+		return -ENOMEM;
+	}
+
+	codec->apb = al_common_get_periph_addr(codec);
+	if (!codec->apb)
+		return -EINVAL;
+
+	/* The MCU has already default clock value */
+	codec->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(codec->clk)) {
+		al_codec_err(codec, "failed to get MCU core clock");
+		return PTR_ERR(codec->clk);
+	}
+
+	ret = clk_prepare_enable(codec->clk);
+	if (ret) {
+		al_codec_err(codec, "Cannot enable MCU clock: %d\n", ret);
+		return ret;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		al_codec_err(codec, "Failed to get IRQ");
+		ret = -EINVAL;
+		goto disable_clk;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					al_common_hardirq_handler,
+					al_common_irq_handler, IRQF_SHARED,
+					dev_name(&pdev->dev), codec);
+	if (ret) {
+		al_codec_err(codec, "Unable to register irq handler");
+		goto disable_clk;
+	}
+
+	/* ok so request the fw */
+	ret = al_common_load_firmware_start(codec, name);
+	if (ret) {
+		al_codec_err(codec, "failed to load firmware : %s", name);
+		goto disable_clk;
+	}
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(codec->clk);
+
+	return ret;
+}
+
+int al_common_send(struct al_codec_dev *codec, struct msg_itf_header *hdr)
+{
+	return al_codec_msg_send(&codec->mb_h2m, hdr, al_common_trigger_mcu_irq,
+				 codec);
+}
+
+int al_common_send_req_reply(struct al_codec_dev *codec,
+			     struct list_head *cmd_list,
+			     struct msg_itf_header *hdr,
+			     struct al_common_mcu_req *req)
+{
+	struct al_codec_cmd *cmd = NULL;
+	int ret;
+
+	hdr->drv_cmd_hdl = 0;
+
+	if (req->reply_size && req->reply) {
+		cmd = al_codec_cmd_create(req->reply_size);
+		if (!cmd)
+			return -ENOMEM;
+
+		hdr->drv_cmd_hdl = al_virt_to_phys(cmd);
+	}
+
+	hdr->drv_ctx_hdl = req->pCtx;
+	hdr->type = req->req_type;
+	hdr->payload_len = req->req_size;
+
+	/* Add the list to the cmd list */
+	if (cmd)
+		list_add(&cmd->list, cmd_list);
+
+	ret = al_common_send(codec, hdr);
+	if (ret)
+		goto remove_cmd;
+
+	al_codec_dbg(codec, "Send req to mcu %d : %zu", req->req_type,
+		     req->req_size);
+
+	if (!cmd)
+		return 0;
+
+	ret = wait_for_completion_timeout(&cmd->done, 5 * HZ);
+	if (ret <= 0) {
+		al_codec_err(codec, "cmd %p has %d (%s)", cmd, ret,
+			     (ret == 0) ? "failed" : "timedout");
+		ret = -ETIMEDOUT;
+		goto remove_cmd;
+	}
+
+	ret = 0;
+	memcpy(req->reply, cmd->reply, req->reply_size);
+
+remove_cmd:
+
+	if (cmd) {
+		list_del(&cmd->list);
+		al_codec_cmd_put(cmd);
+	}
+	return ret;
+}
+
+bool al_common_mcu_is_alive(struct al_codec_dev *codec)
+{
+	static const struct msg_itf_header hdr = {
+		.type = MSG_ITF_TYPE_MCU_ALIVE,
+		.payload_len = 0,
+	};
+	int ret;
+
+	ret = al_common_send(codec, (struct msg_itf_header *)&hdr);
+	if (ret)
+		return false;
+
+	ret = wait_for_completion_timeout(&codec->completion, 5 * HZ);
+	if (ret <= 0)
+		return false;
+
+	return true;
+}
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.h b/drivers/media/platform/allegro-dvt/al300/al_codec_common.h
new file mode 100644
index 0000000000000000000000000000000000000000..0d2f8d788a73e477d04093c931e7316f79adf76f
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.h
@@ -0,0 +1,252 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_CODEC_COMMON__
+#define __AL_CODEC_COMMON__
+
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <media/v4l2-device.h>
+
+#include "al_codec_dbgfs.h"
+#include "al_codec_util.h"
+
+#define fh_to_ctx(ptr, type) container_of(ptr, type, fh)
+
+enum {
+	MSG_ITF_TYPE_CREATE_INST_REQ = MSG_ITF_TYPE_NEXT_REQ,
+	MSG_ITF_TYPE_DESTROY_INST_REQ,
+	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ,
+	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ,
+	MSG_ITF_TYPE_FLUSH_REQ,
+	MSG_ITF_TYPE_INFO_REQ,
+	MSG_ITF_TYPE_CREATE_INST_REPLY = MSG_ITF_TYPE_NEXT_REPLY,
+	MSG_ITF_TYPE_DESTROY_INST_REPLY,
+	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REPLY,
+	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REPLY,
+	MSG_ITF_TYPE_FLUSH_REPLY,
+	MSG_ITF_TYPE_INFO_REPLY,
+	MSG_ITF_TYPE_EVT_ERROR = MSG_ITF_TYPE_NEXT_EVT,
+};
+
+struct msg_itf_write_req {
+	u32 fd;
+	u32 len;
+	/* payload follow */
+} __packed;
+DECLARE_FULL_REQ(msg_itf_write_req);
+
+struct msg_itf_free_mem_req {
+	phys_addr_t phyAddr;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_free_mem_req);
+
+struct msg_itf_alloc_mem_req {
+	u64 uSize;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_alloc_mem_req);
+
+struct msg_itf_alloc_mem_reply {
+	phys_addr_t phyAddr;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_alloc_mem_reply);
+
+struct msg_itf_free_mem_reply {
+	s64 ret;
+};
+DECLARE_FULL_REPLY(msg_itf_free_mem_reply);
+
+struct msg_itf_create_codec_reply {
+	phys_addr_t hCodec;
+	s32 ret;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_create_codec_reply);
+
+struct msg_itf_destroy_codec_req {
+	phys_addr_t hCodec;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_destroy_codec_req);
+
+/*
+ * Note : no need to know the status of this request
+ * The codec should be destroyed, in case of the mcu
+ * hasn't received any request with the codec handler
+ */
+struct msg_itf_destroy_codec_reply {
+	u32 unused;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_destroy_codec_reply);
+
+struct al_buffer_meta {
+	u64 timestamp;
+	struct v4l2_timecode timecode;
+	bool last;
+};
+
+struct msg_itf_push_src_buf_req {
+	phys_addr_t hCodec;
+	phys_addr_t bufferHandle;
+	phys_addr_t phyAddr;
+	u64 size;
+	struct al_buffer_meta meta;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_push_src_buf_req);
+
+struct msg_itf_push_dst_buf_req {
+	phys_addr_t hCodec;
+	phys_addr_t bufferHandle;
+	phys_addr_t phyAddr;
+	u64 size;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_push_dst_buf_req);
+
+struct msg_itf_push_buffer_req {
+	phys_addr_t hCodec;
+	phys_addr_t bufferHandle;
+	phys_addr_t phyAddr;
+	u64 size;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_push_buffer_req);
+
+struct msg_itf_push_buffer_reply {
+	s32 res;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_push_buffer_reply);
+
+struct msg_itf_info_req {
+	u64 unused;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_info_req);
+
+struct msg_itf_flush_req {
+	phys_addr_t hCodec;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_flush_req);
+
+struct msg_itf_flush_reply {
+	int32_t unused;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_flush_reply);
+
+struct msg_itf_evt_error {
+	uint32_t errno;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_error);
+
+struct al_match_data {
+	const char *fw_name;
+};
+
+struct al_common_mcu_req {
+	phys_addr_t pCtx;
+	int req_type;
+	size_t req_size;
+	size_t reply_size;
+	void *reply;
+} __packed;
+
+struct al_firmware_section {
+	u64 offset;
+	size_t size;
+};
+
+struct al_firmware {
+	/* Firmware after it is read but not loaded */
+	const struct firmware *firmware;
+
+	/* Raw firmware data */
+	dma_addr_t phys;
+	void *virt;
+	size_t size;
+
+	/* Parsed firmware information */
+	struct al_firmware_section bin_data;
+	struct al_firmware_section mb_m2h;
+	struct al_firmware_section mb_h2m;
+};
+
+struct al_codec_dev {
+	struct platform_device *pdev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct video_device video_dev;
+
+	/* Firmware */
+	struct al_firmware firmware;
+	dma_addr_t apb;
+
+	struct clk *clk;
+	void __iomem *regs;
+	struct resource *regs_info;
+	u64 offset;
+
+	/* Mailbox structs */
+	struct al_codec_mb mb_h2m;
+	struct al_codec_mb mb_m2h;
+
+	/* list of buffers used by the MCU */
+	struct list_head alloc_buffers;
+	struct mutex buf_lock;
+
+	/* mutex protecting vb2_queue structure */
+	struct mutex lock;
+
+	/* list of ctx (aka decoder) */
+	struct mutex ctx_mlock;
+	struct list_head ctx_q_list;
+	struct al_codec_dbgfs dbgfs;
+	u64 ctx_counter;
+	bool init_done;
+
+	/* list of cap/out supported formats */
+	struct list_head codec_q_list;
+	struct al_codec_cmd *codec_info_cmd;
+
+	/* Command completion */
+	struct completion completion;
+	/* Resolution found completion */
+	struct completion res_done;
+
+	/* callbacks set by client before common_probe */
+	void *cb_arg;
+	void (*process_msg_cb)(void *cb_arg, struct msg_itf_header *hdr);
+	void (*fw_ready_cb)(void *cb_arg);
+};
+
+static inline int al_common_get_header(struct al_codec_dev *codec,
+				       struct msg_itf_header *hdr)
+{
+	return al_codec_msg_get_header(&codec->mb_m2h, hdr);
+}
+
+static inline int al_common_get_data(struct al_codec_dev *codec, char *data,
+				     int len)
+{
+	return al_codec_msg_get_data(&codec->mb_m2h, data, len);
+}
+
+static inline int al_common_skip_data(struct al_codec_dev *codec, int len)
+{
+	return al_common_get_data(codec, NULL, len);
+}
+
+int al_common_send(struct al_codec_dev *codec, struct msg_itf_header *hdr);
+int al_common_send_req_reply(struct al_codec_dev *codec,
+			     struct list_head *cmd_list,
+			     struct msg_itf_header *hdr,
+			     struct al_common_mcu_req *req);
+bool al_common_mcu_is_alive(struct al_codec_dev *codec);
+
+int al_common_probe(struct al_codec_dev *codec, const char *name);
+void al_common_remove(struct al_codec_dev *codec);
+
+#endif /*__AL_CODEC_COMMON__*/
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_dbgfs.c b/drivers/media/platform/allegro-dvt/al300/al_codec_dbgfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..9a9264d2aa22ebdc21945e4290c744491974b692
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_dbgfs.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#include <linux/debugfs.h>
+
+#include "al_codec_dbgfs.h"
+#include "al_vdec_drv.h"
+#include "al_codec_util.h"
+
+static void al_vdec_dbgfs_get_format_type(struct al_dec_ctx *ctx, char *buf,
+					  int *used, int total)
+{
+	struct al_frame *frame = &ctx->src;
+	int curr_len;
+
+	switch (frame->fmt->pixelformat) {
+	case V4L2_PIX_FMT_H264:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: h264\n");
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: hevc\n");
+		break;
+	case V4L2_PIX_FMT_JPEG:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: jpeg\n");
+		break;
+	default:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tunsupported output format: 0x%x\n",
+				    frame->fmt->pixelformat);
+	}
+	*used += curr_len;
+	frame = &ctx->dst;
+
+	switch (frame->fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: NV12\n");
+		break;
+	case V4L2_PIX_FMT_NV16:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: NV16\n");
+		break;
+	case V4L2_PIX_FMT_P010:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: P010\n");
+		break;
+	case V4L2_PIX_FMT_YUV420:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: YUV420\n");
+		break;
+	case V4L2_PIX_FMT_YVU420:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: YVU420\n");
+		break;
+	default:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tunsupported capture format: 0x%x\n",
+				    frame->fmt->pixelformat);
+	}
+	*used += curr_len;
+}
+
+static void al_vdec_dbgfs_get_help(char *buf, int *used, int total)
+{
+	int curr_len;
+
+	curr_len = snprintf(buf + *used, total - *used,
+			    "help: (1: echo -'info' > dec 2: cat dec)\n");
+	*used += curr_len;
+
+	curr_len = snprintf(buf + *used, total - *used,
+			    "\t-picinfo: get resolution\n");
+	*used += curr_len;
+
+	curr_len = snprintf(buf + *used, total - *used,
+			    "\t-format: get output & capture queue format\n");
+	*used += curr_len;
+}
+
+static ssize_t al_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
+				   size_t count, loff_t *ppos)
+{
+	struct al_codec_dev *codec = filp->private_data;
+	struct al_codec_dbgfs *dbgfs = &codec->dbgfs;
+
+	mutex_lock(&dbgfs->lock);
+	dbgfs->size = simple_write_to_buffer(dbgfs->buf, sizeof(dbgfs->buf),
+					     ppos, ubuf, count);
+	mutex_unlock(&dbgfs->lock);
+	if (dbgfs->size > 0)
+		return count;
+
+	return dbgfs->size;
+}
+
+static ssize_t al_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
+				  size_t count, loff_t *ppos)
+{
+	struct al_codec_dev *codec = filp->private_data;
+	struct al_codec_dbgfs *dbgfs = &codec->dbgfs;
+	struct al_codec_dbgfs_ctx *dbgfs_ctx;
+	struct al_dec_ctx *ctx;
+	struct al_frame *frame;
+	int total_len = 200 * (dbgfs->ctx_count == 0 ? 1 : dbgfs->ctx_count);
+	int used_len = 0, curr_len, ret;
+	bool dbgfs_index[AL_VDEC_DBGFS_MAX] = { 0 };
+	char *buf = kmalloc(total_len, GFP_KERNEL);
+
+	if (!buf)
+		return -ENOMEM;
+
+	if (strstr(dbgfs->buf, "-help") || dbgfs->size == 1) {
+		al_vdec_dbgfs_get_help(buf, &used_len, total_len);
+		goto read_buffer;
+	}
+
+	if (strstr(dbgfs->buf, "-picinfo"))
+		dbgfs_index[AL_VDEC_DBGFS_PICINFO] = true;
+
+	if (strstr(dbgfs->buf, "-format"))
+		dbgfs_index[AL_VDEC_DBGFS_FORMAT] = true;
+
+	mutex_lock(&dbgfs->lock);
+	list_for_each_entry(dbgfs_ctx, &dbgfs->dbgfs_head, node) {
+		ctx = dbgfs_ctx->dec_ctx;
+		frame = &ctx->src;
+
+		curr_len = snprintf(buf + used_len, total_len - used_len,
+				    "inst[%lld]:\n ", ctx->id);
+		used_len += curr_len;
+
+		if (dbgfs_index[AL_VDEC_DBGFS_PICINFO]) {
+			curr_len = snprintf(buf + used_len,
+					    total_len - used_len,
+					    "\tOUTPUT: %dx%d\n", frame->width,
+					    frame->height);
+			used_len += curr_len;
+			frame = &ctx->dst;
+
+			curr_len = snprintf(buf + used_len,
+					    total_len - used_len,
+					    "\tCAPTURE: %dx%d\n", frame->width,
+					    frame->height);
+			used_len += curr_len;
+		}
+
+		if (dbgfs_index[AL_VDEC_DBGFS_FORMAT])
+			al_vdec_dbgfs_get_format_type(ctx, buf, &used_len,
+						      total_len);
+	}
+	mutex_unlock(&dbgfs->lock);
+read_buffer:
+	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations vdec_fops = {
+	.open = simple_open,
+	.write = al_vdec_dbgfs_write,
+	.read = al_vdec_dbgfs_read,
+};
+
+void al_codec_dbgfs_create(struct al_dec_ctx *ctx)
+{
+	struct al_codec_dbgfs_ctx *dbgfs_ctx;
+	struct al_codec_dev *codec = ctx->codec;
+
+	dbgfs_ctx = kzalloc(sizeof(*dbgfs_ctx), GFP_KERNEL);
+	if (!dbgfs_ctx)
+		return;
+
+	list_add_tail(&dbgfs_ctx->node, &codec->dbgfs.dbgfs_head);
+
+	codec->dbgfs.ctx_count++;
+
+	dbgfs_ctx->ctx_id = ctx->id;
+	dbgfs_ctx->dec_ctx = ctx;
+}
+
+void al_codec_dbgfs_remove(struct al_codec_dev *codec, int ctx_id)
+{
+	struct al_codec_dbgfs_ctx *dbgfs_ctx;
+
+	list_for_each_entry(dbgfs_ctx, &codec->dbgfs.dbgfs_head, node) {
+		if (dbgfs_ctx->ctx_id == ctx_id) {
+			codec->dbgfs.ctx_count--;
+			list_del(&dbgfs_ctx->node);
+			kfree(dbgfs_ctx);
+			return;
+		}
+	}
+}
+
+static void al_codec_dbgfs_vdec_init(struct al_codec_dev *codec)
+{
+	struct dentry *vcodec_root;
+
+	codec->dbgfs.vcodec_root = debugfs_create_dir("al-vdec", NULL);
+	if (IS_ERR(codec->dbgfs.vcodec_root))
+		dev_err(&codec->pdev->dev, "create al-vdec dir err:%ld\n",
+			PTR_ERR(codec->dbgfs.vcodec_root));
+
+	vcodec_root = codec->dbgfs.vcodec_root;
+	debugfs_create_x32("al_v4l2_dbg_level", 0644, vcodec_root,
+			   &al_v4l2_dbg_level);
+	debugfs_create_x32("al_codec_dbg", 0644, vcodec_root, &al_codec_dbg);
+
+	codec->dbgfs.ctx_count = 0;
+	INIT_LIST_HEAD(&codec->dbgfs.dbgfs_head);
+	debugfs_create_file("vdec", 0200, vcodec_root, codec, &vdec_fops);
+	mutex_init(&codec->dbgfs.lock);
+}
+
+void al_codec_dbgfs_init(void *codec)
+{
+	al_codec_dbgfs_vdec_init(codec);
+}
+
+void al_codec_dbgfs_deinit(struct al_codec_dbgfs *dbgfs)
+{
+	debugfs_remove_recursive(dbgfs->vcodec_root);
+}
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_dbgfs.h b/drivers/media/platform/allegro-dvt/al300/al_codec_dbgfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..0f205e50530822371203126d1d3632f8429a6de9
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_dbgfs.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_CODEC_DBGFS_H__
+#define __AL_CODEC_DBGFS_H__
+
+struct al_codec_dev;
+struct al_dec_ctx;
+
+/*
+ * enum al_vdec_dbgfs_log_index  - used to get different debug information
+ */
+enum al_vdec_dbgfs_log_index {
+	AL_VDEC_DBGFS_PICINFO,
+	AL_VDEC_DBGFS_FORMAT,
+	AL_VDEC_DBGFS_MAX,
+};
+
+/**
+ * struct al_codec_dbgfs_ctx  - debugfs information for each context
+ * @node:       list node for each inst
+ * @dec_ctx:	struct al_dec_ctx
+ * @ctx_id:     index of the context that the same with ctx->id
+ */
+struct al_codec_dbgfs_ctx {
+	struct list_head node;
+	struct al_dec_ctx *dec_ctx;
+	int ctx_id;
+};
+
+/**
+ * struct al_codec_dbgfs  - dbgfs information
+ * @dbgfs_head:  list head used to link each context
+ * @vcodec_root: codec dbgfs entry
+ * @lock:	 lock used to protect dbgfs_buf
+ * @buf:	 dbgfs buf used to store dbgfs cmd
+ * @size:	 dbgfs buffer size
+ * @ctx_count:   the count of total context
+ */
+struct al_codec_dbgfs {
+	struct list_head dbgfs_head;
+	struct dentry *vcodec_root;
+	struct mutex lock;
+	char buf[1024];
+	int size;
+	int ctx_count;
+};
+
+#if defined(CONFIG_DEBUG_FS)
+void al_codec_dbgfs_create(struct al_dec_ctx *ctx);
+void al_codec_dbgfs_remove(struct al_codec_dev *codec, int ctx_id);
+void al_codec_dbgfs_init(void *codec);
+void al_codec_dbgfs_deinit(struct al_codec_dbgfs *dbgfs);
+#else
+static inline void al_codec_dbgfs_create(struct al_dec_ctx *ctx)
+{
+}
+static inline void al_codec_dbgfs_remove(struct al_codec_dev *codec, int ctx_id)
+{
+}
+static inline void al_codec_dbgfs_init(void *codec)
+{
+}
+static inline void al_codec_dbgfs_deinit(struct al_codec_dbgfs *dbgfs)
+{
+}
+#endif /* CONFIG_DEBUG_FS */
+#endif /* __AL_CODEC_DBGFS_H__ */
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.c b/drivers/media/platform/allegro-dvt/al300/al_codec_util.c
new file mode 100644
index 0000000000000000000000000000000000000000..f59fedae0491f9384052b80f9bc19a22a3efe2a3
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Mailbox communication utilities for command creation
+ * and message exchange with the MCU
+ *
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#include <asm-generic/errno.h>
+#include <linux/errno.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+#include "al_codec_util.h"
+
+#if defined(CONFIG_DEBUG_FS)
+/* Log level */
+int al_v4l2_dbg_level;
+int al_codec_dbg;
+#endif
+
+static int al_get_used_space(struct al_codec_mb *mb)
+{
+	u32 head = mb->hdr->head;
+	u32 tail = mb->hdr->tail;
+
+	return head >= tail ? head - tail : mb->size - (tail - head);
+}
+
+static int al_get_free_space(struct al_codec_mb *mb)
+{
+	return mb->size - al_get_used_space(mb) - 1;
+}
+
+static int al_has_enough_space(struct al_codec_mb *mb, int len)
+{
+	return al_get_free_space(mb) >= len;
+}
+
+static inline void al_copy_to_mb(struct al_codec_mb *mb, char *data, int len)
+{
+	u32 head = mb->hdr->head;
+	int copy_len = min(mb->size - head, (unsigned int)len);
+	int copied_len = len;
+
+	memcpy(&mb->data[head], data, copy_len);
+	len -= copy_len;
+	if (len)
+		memcpy(&mb->data[0], &data[copy_len], len);
+
+	/* Make sure that all messages are written before updating the head */
+	dma_wmb();
+	mb->hdr->head = (head + copied_len) % mb->size;
+	/* Make sure that the head is updated in DDR instead of cache */
+	dma_wmb();
+}
+
+static inline void al_copy_from_mb(struct al_codec_mb *mb, char *data, int len)
+{
+	u32 tail = mb->hdr->tail;
+	int copy_len = min(mb->size - tail, (unsigned int)len);
+	int copied_len = len;
+
+	if (!data)
+		goto update_tail;
+
+	memcpy(data, &mb->data[tail], copy_len);
+	len -= copy_len;
+	if (len)
+		memcpy(&data[copy_len], &mb->data[0], len);
+
+update_tail:
+	mb->hdr->tail = (tail + copied_len) % mb->size;
+	/* Make sure that the head is updated in DDR instead of cache */
+	dma_wmb();
+}
+
+static int al_codec_mb_send(struct al_codec_mb *mb, char *data, int len)
+{
+	if (!al_has_enough_space(mb, len))
+		return -ENOMEM;
+
+	al_copy_to_mb(mb, data, len);
+
+	return 0;
+}
+
+static int al_codec_mb_receive(struct al_codec_mb *mb, char *data, int len)
+{
+	if (al_get_used_space(mb) < len)
+		return -ENOMEM;
+
+	al_copy_from_mb(mb, data, len);
+
+	return 0;
+}
+
+void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic)
+{
+	mb->hdr = (struct al_mb_itf *)addr;
+	mb->hdr->magic = magic;
+	mb->hdr->version = MB_IFT_VERSION;
+	mb->hdr->head = 0;
+	mb->hdr->tail = 0;
+	mb->data = addr + sizeof(struct al_mb_itf);
+	mb->size = size - sizeof(struct al_mb_itf);
+	mutex_init(&mb->lock);
+}
+
+int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr)
+{
+	return al_codec_mb_receive(mb, (char *)hdr, sizeof(*hdr));
+}
+
+int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len)
+{
+	return al_codec_mb_receive(mb, data, len);
+}
+
+int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
+		      void (*trigger)(void *), void *trigger_arg)
+{
+	const unsigned long timeout = jiffies + HZ;
+	int ret;
+
+	guard(mutex)(&mb->lock);
+	do {
+		if (time_after(jiffies, timeout))
+			return -ETIMEDOUT;
+
+		ret = al_codec_mb_send(mb, (char *)hdr,
+				       hdr->payload_len +
+					       sizeof(struct msg_itf_header));
+
+	} while (ret);
+
+	trigger(trigger_arg);
+
+	return 0;
+}
+
+static void al_codec_cmd_cleanup(struct kref *ref)
+{
+	struct al_codec_cmd *cmd = container_of(ref, typeof(*cmd), refcount);
+
+	kfree(cmd->reply);
+	kfree(cmd);
+}
+
+void al_codec_cmd_put(struct al_codec_cmd *cmd)
+{
+	if (WARN_ON(!cmd))
+		return;
+
+	kref_put(&cmd->refcount, al_codec_cmd_cleanup);
+}
+
+struct al_codec_cmd *al_codec_cmd_create(int reply_size)
+{
+	struct al_codec_cmd *cmd;
+
+	cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd)
+		return NULL;
+
+	cmd->reply = kmalloc(reply_size, GFP_KERNEL);
+	if (!cmd->reply) {
+		kfree(cmd);
+		return NULL;
+	}
+
+	kref_init(&cmd->refcount);
+	cmd->reply_size = reply_size;
+	init_completion(&cmd->done);
+
+	return cmd;
+}
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
new file mode 100644
index 0000000000000000000000000000000000000000..a4d50792dbd6fab377a23dd272f1e4038e73f187
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_CODEC_UTIL__
+#define __AL_CODEC_UTIL__
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/v4l2-common.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-v4l2.h>
+
+#define MB_IFT_MAGIC_H2M 0xabcd1230
+#define MB_IFT_MAGIC_M2H 0xabcd1231
+#define MB_IFT_VERSION 0x00010000
+
+#define MAJOR_SHIFT 20
+#define MAJOR_MASK 0xfff
+#define MINOR_SHIFT 8
+#define MINOR_MASK 0xfff
+#define PATCH_SHIFT 0
+#define PATCH_MASK 0xff
+
+/*
+ * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
+ * the same for minor, 8bits for the patch
+ */
+#define AL_BOOT_VERSION(major, minor, patch)       \
+	((((major) & MAJOR_MASK) << MAJOR_SHIFT) | \
+	 (((minor) & MINOR_MASK) << MINOR_SHIFT) | \
+	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
+
+#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
+#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
+
+#define DECLARE_FULL_REQ(s)                \
+	struct s##_full {                  \
+		struct msg_itf_header hdr; \
+		struct s req;              \
+	} __packed
+
+#define DECLARE_FULL_REPLY(s)              \
+	struct s##_full {                  \
+		struct msg_itf_header hdr; \
+		struct s reply;            \
+	} __packed
+
+#define DECLARE_FULL_EVENT(s)              \
+	struct s##_full {                  \
+		struct msg_itf_header hdr; \
+		struct s event;            \
+	} __packed
+
+struct al_mb_itf {
+	u32 magic;
+	u32 version;
+	u32 head;
+	u32 tail;
+} __packed;
+
+struct al_codec_mb {
+	struct al_mb_itf *hdr;
+	struct mutex lock;
+	char *data;
+	int size;
+};
+
+struct al_codec_cmd {
+	struct kref refcount;
+	struct list_head list;
+	struct completion done;
+	int reply_size;
+	void *reply;
+};
+
+#define al_codec_err(codec, fmt, args...)                                     \
+	dev_err(&(codec)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n", \
+		__func__, __LINE__, ##args)
+
+#define al_v4l2_err(codec, fmt, args...)                                     \
+	dev_err(&(codec)->pdev->dev, "[ALG_V4L2][ERROR] %s():%d: " fmt "\n", \
+		__func__, __LINE__, ##args)
+
+#if defined(CONFIG_DEBUG_FS)
+/* Log level */
+extern int al_v4l2_dbg_level;
+extern int al_codec_dbg;
+
+/* V4L2 logs */
+#define al_v4l2_dbg(codec, level, fmt, args...)                           \
+	do {                                                              \
+		if (al_v4l2_dbg_level >= level)                           \
+			dev_dbg(&(codec)->pdev->dev,                      \
+				"[ALG_V4L2] level=%d %s(),%d: " fmt "\n", \
+				level, __func__, __LINE__, ##args);       \
+	} while (0)
+
+/* Codec logs */
+#define al_codec_dbg(codec, fmt, args...)                                   \
+	do {                                                                \
+		if (al_codec_dbg)                                           \
+			dev_dbg(&(codec)->pdev->dev,                        \
+				"[ALG_CODEC] %s(),%d: " fmt "\n", __func__, \
+				__LINE__, ##args);                          \
+	} while (0)
+
+#define al_mcu_dbg(codec, fmt, args...)                                   \
+	do {                                                              \
+		if (al_codec_dbg)                                         \
+			dev_dbg(&(codec)->pdev->dev,                      \
+				"[ALG_MCU] %s(),%d: " fmt "\n", __func__, \
+				__LINE__, ##args);                        \
+	} while (0)
+
+#else
+
+#define al_v4l2_dbg(codec, level, fmt, args...)                                \
+	do {                                                                   \
+		(void)level;                                                   \
+		dev_dbg(&(codec)->pdev->dev, "[ALG_V4L2]: " fmt "\n", ##args); \
+	} while (0)
+
+#define al_codec_dbg(codec, fmt, args...) \
+	dev_dbg(&(codec)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
+
+#define al_mcu_dbg(codec, fmt, args...) \
+	dev_dbg(&(codec)->pdev->dev, "[ALG_MCU]: " fmt "\n", ##args)
+
+#endif
+
+#define MSG_ITF_TYPE_LIMIT BIT(10)
+
+/* Message types host <-> mcu */
+enum {
+	MSG_ITF_TYPE_MCU_ALIVE = 0,
+	MSG_ITF_TYPE_WRITE_REQ = 2,
+	MSG_ITF_TYPE_FIRST_REQ = 1024,
+	MSG_ITF_TYPE_NEXT_REQ,
+	MSG_ITF_TYPE_FIRST_REPLY = 2048,
+	MSG_ITF_TYPE_NEXT_REPLY,
+	MSG_ITF_TYPE_ALLOC_MEM_REQ = 3072,
+	MSG_ITF_TYPE_FREE_MEM_REQ,
+	MSG_ITF_TYPE_ALLOC_MEM_REPLY = 4096,
+	MSG_ITF_TYPE_FREE_MEM_REPLY,
+	MSG_ITF_TYPE_FIRST_EVT = 5120,
+	MSG_ITF_TYPE_NEXT_EVT = MSG_ITF_TYPE_FIRST_EVT
+};
+
+struct msg_itf_header {
+	u64 drv_ctx_hdl;
+	u64 drv_cmd_hdl;
+	u16 type;
+	u16 payload_len;
+	u16 padding[2];
+} __packed;
+
+void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic);
+int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr);
+int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
+int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
+		      void (*trigger)(void *), void *trigger_arg);
+
+static inline bool is_type_reply(uint16_t type)
+{
+	return type >= MSG_ITF_TYPE_FIRST_REPLY &&
+	       type < MSG_ITF_TYPE_FIRST_REPLY + MSG_ITF_TYPE_LIMIT;
+}
+
+static inline bool is_type_event(uint16_t type)
+{
+	return type >= MSG_ITF_TYPE_FIRST_EVT &&
+	       type < MSG_ITF_TYPE_FIRST_EVT + MSG_ITF_TYPE_LIMIT;
+}
+
+void al_codec_cmd_put(struct al_codec_cmd *cmd);
+
+struct al_codec_cmd *al_codec_cmd_create(int reply_size);
+
+static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cmd_list,
+						    uint64_t hdl)
+{
+	struct al_codec_cmd *cmd = NULL;
+
+	list_for_each_entry(cmd, cmd_list, list) {
+		if (likely(cmd == al_phys_to_virt(hdl))) {
+			kref_get(&cmd->refcount);
+			break;
+		}
+	}
+	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
+}
+
+#endif /* __AL_CODEC_UTIL__ */
diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
new file mode 100644
index 0000000000000000000000000000000000000000..889746d462963a5144e92c3c10ab72638b400ac1
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
@@ -0,0 +1,1514 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ *
+ * Allegro DVT stateful video decoder driver for the IP Gen 3
+ */
+
+#include <asm-generic/errno-base.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+#include <linux/v4l2-controls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "al_vdec_drv.h"
+
+/* default decoder params */
+#define DECODER_WIDTH_DEFAULT 640
+#define DECODER_HEIGHT_DEFAULT 480
+#define DECODER_WIDTH_MAX 3840
+#define DECODER_HEIGHT_MAX 2160
+#define DECODER_WIDTH_MIN 16
+#define DECODER_HEIGHT_MIN 16
+#define DEC_REQ_TIMEOUT msecs_to_jiffies(1000)
+#define DEC_RES_EVT_TIMEOUT DEC_REQ_TIMEOUT
+
+/* Supported formats */
+static const struct al_fmt al_src_formats[] = {
+	{
+		.pixelformat = V4L2_PIX_FMT_H264,
+		.bpp = 20,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_HEVC,
+		.bpp = 20,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_JPEG,
+		.bpp = 8,
+	}
+};
+
+static const struct al_fmt al_dst_formats[] = {
+	{
+		.pixelformat = V4L2_PIX_FMT_NV12,
+		.bpp = 12,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_P010,
+		.bpp = 12,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_NV16,
+		.bpp = 16,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_YUV420, /* YUV 4:2:0 */
+		.bpp = 12,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_YVU420, /* YVU 4:2:0 */
+		.bpp = 12,
+	},
+};
+
+/* Default format */
+static const struct al_frame al_default_fmt = {
+
+	.width = DECODER_WIDTH_DEFAULT,
+	.height = DECODER_HEIGHT_DEFAULT,
+	.bytesperline = DECODER_WIDTH_MAX * 4,
+	.sizeimage = DECODER_WIDTH_DEFAULT * DECODER_HEIGHT_DEFAULT * 4,
+	.nbuffers = 1,
+	.fmt = &al_dst_formats[0],
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_REC709,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT
+};
+
+static struct al_frame *al_get_frame(struct al_dec_ctx *ctx,
+				     enum v4l2_buf_type type)
+{
+	if (WARN_ON(!ctx))
+		return ERR_PTR(-EINVAL);
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return &ctx->src;
+	else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return &ctx->dst;
+
+	al_v4l2_err(ctx->codec, "Unsupported type (%d)", type);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static const struct al_fmt *al_find_fmt(u32 pixelformat)
+{
+	const struct al_fmt *fmt;
+	unsigned int i;
+
+	/* check if the pixelformat exist in the src formats list */
+	for (i = 0; i < ARRAY_SIZE(al_src_formats); i++) {
+		fmt = &al_src_formats[i];
+		if (fmt->pixelformat == pixelformat)
+			return fmt;
+	}
+
+	/* check if the pixelformat exist in the dst formats list */
+	for (i = 0; i < ARRAY_SIZE(al_dst_formats); i++) {
+		fmt = &al_dst_formats[i];
+		if (fmt->pixelformat == pixelformat)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static int dec_fw_create_decoder(struct al_dec_ctx *ctx)
+{
+	struct msg_itf_create_decoder_req_full req;
+	struct msg_itf_create_codec_reply reply;
+	const struct al_frame *frame = &ctx->src;
+	struct al_common_mcu_req mreq = {
+		.pCtx = al_virt_to_phys(ctx),
+		.req_type = MSG_ITF_TYPE_CREATE_INST_REQ,
+		.req_size = sizeof(req.req),
+		.reply_size = sizeof(reply),
+		.reply = &reply,
+	};
+	int ret;
+
+	if (ctx->hDec) {
+		al_v4l2_dbg(ctx->codec, 3, "fw decoder already exist\n");
+		return 0;
+	}
+
+	req.req.codec = frame->fmt->pixelformat;
+
+	ret = al_common_send_req_reply(ctx->codec, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+
+	if (!ret && !reply.ret)
+		ctx->hDec = reply.hCodec;
+	else if (reply.ret)
+		ret = -ENODEV;
+
+	return ret;
+}
+
+static void dec_fw_destroy_decoder(struct al_dec_ctx *ctx)
+{
+	struct msg_itf_destroy_codec_req_full req;
+	struct msg_itf_destroy_codec_reply reply;
+	struct al_common_mcu_req mreq = {
+		.req_type = MSG_ITF_TYPE_DESTROY_INST_REQ,
+		.pCtx = al_virt_to_phys(ctx),
+		.req_size = sizeof(req.req),
+		.reply_size = sizeof(reply),
+		.reply = &reply,
+	};
+	int ret;
+
+	if (WARN(!ctx->hDec, "NULL Decoder to destroy !"))
+		return;
+
+	al_v4l2_dbg(ctx->codec, 3, "Destroy decoder %lld ", ctx->hDec);
+
+	req.req.hCodec = ctx->hDec;
+
+	ret = al_common_send_req_reply(ctx->codec, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+
+	if (!ret)
+		ctx->hDec = 0;
+}
+
+static int al_dec_fw_push_frame_buf(struct al_dec_ctx *ctx,
+				    struct vb2_v4l2_buffer *vbuf)
+{
+	struct msg_itf_push_dst_buf_req_full req;
+	struct v4l2_m2m_buffer *m2m_buf;
+	struct al_common_mcu_req mreq = {
+		.req_type = MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ,
+		.pCtx = al_virt_to_phys(ctx),
+		.req_size = sizeof(req.req),
+	};
+	int ret;
+
+	if (WARN(!vbuf, "NULL frame Buffer to push!!"))
+		return -EINVAL;
+
+	m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
+	req.req.hCodec = ctx->hDec;
+	req.req.bufferHandle = al_virt_to_phys(m2m_buf);
+	req.req.phyAddr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+	req.req.size = vb2_plane_size(&vbuf->vb2_buf, 0);
+
+	ret = al_common_send_req_reply(ctx->codec, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+	if (ret)
+		al_v4l2_err(ctx->codec, "Failed to push frame buffer %p %d",
+			    m2m_buf, ret);
+
+	return ret;
+}
+
+static int al_dec_fw_push_bitstream_buf(struct al_dec_ctx *ctx,
+					struct vb2_v4l2_buffer *vbuf)
+{
+	struct msg_itf_push_src_buf_req_full req;
+	struct v4l2_m2m_buffer *m2m_buf;
+	struct al_common_mcu_req mreq = {
+		.req_type = MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ,
+		.pCtx = al_virt_to_phys(ctx),
+		.req_size = sizeof(req.req),
+	};
+	int ret;
+
+	if (WARN(!vbuf, "NULL Buffer to push!!"))
+		return -EINVAL;
+
+	m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
+	req.req.hCodec = ctx->hDec;
+	req.req.bufferHandle = al_virt_to_phys(m2m_buf);
+	req.req.phyAddr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+	req.req.size = vb2_plane_size(&vbuf->vb2_buf, 0);
+
+	/* Fill the v4l2 metadata*/
+	req.req.meta.timestamp = vbuf->vb2_buf.timestamp;
+	req.req.meta.timecode = vbuf->timecode;
+	req.req.meta.last = vbuf->flags & V4L2_BUF_FLAG_LAST;
+
+	ret = al_common_send_req_reply(ctx->codec, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+	if (ret)
+		al_v4l2_err(ctx->codec, "Failed to push bitstream buffer %p %d",
+			    m2m_buf, ret);
+
+	return ret;
+}
+
+static int dec_fw_flush_req(struct al_dec_ctx *ctx)
+{
+	struct msg_itf_flush_req_full req;
+	struct msg_itf_flush_reply reply;
+	struct al_common_mcu_req mreq = {
+		.req_type = MSG_ITF_TYPE_FLUSH_REQ,
+		.pCtx = al_virt_to_phys(ctx),
+		.req_size = sizeof(req.req),
+		.reply_size = sizeof(reply),
+		.reply = &reply,
+	};
+	int ret;
+
+	req.req.hCodec = ctx->hDec;
+
+	ret = al_common_send_req_reply(ctx->codec, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+
+	if (ret)
+		al_v4l2_err(ctx->codec, "Failed to flush the decoder %d", ret);
+
+	return ret;
+}
+
+static struct vb2_v4l2_buffer *al_dec_dequeue_buf(struct al_dec_ctx *ctx,
+						  uint64_t hdl,
+						  struct list_head *buffer_list)
+{
+	struct v4l2_m2m_buffer *buf, *tmp;
+	struct vb2_v4l2_buffer *ret = NULL;
+
+	guard(mutex)(&ctx->buf_q_mlock);
+	list_for_each_entry_safe(buf, tmp, buffer_list, list) {
+		if (buf == al_phys_to_virt(hdl)) {
+			list_del(&buf->list);
+			ret = &buf->vb;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static struct vb2_v4l2_buffer *al_dec_dequeue_src_buf(struct al_dec_ctx *ctx,
+						      uint64_t hdl)
+{
+	return al_dec_dequeue_buf(ctx, hdl, &ctx->stream_q_list);
+}
+
+static struct vb2_v4l2_buffer *al_dec_dequeue_dst_buf(struct al_dec_ctx *ctx,
+						      uint64_t hdl)
+{
+	return al_dec_dequeue_buf(ctx, hdl, &ctx->frame_q_list);
+}
+
+static void al_ctx_cleanup(struct kref *ref)
+{
+	struct al_dec_ctx *ctx = container_of(ref, struct al_dec_ctx, refcount);
+
+	kfree(ctx);
+}
+
+static struct al_dec_ctx *al_ctx_get(struct al_codec_dev *codec, uint64_t hdl)
+{
+	struct al_dec_ctx *ctx;
+	struct al_dec_ctx *ret = NULL;
+
+	guard(mutex)(&codec->ctx_mlock);
+	list_for_each_entry(ctx, &codec->ctx_q_list, list) {
+		if (ctx == al_phys_to_virt(hdl)) {
+			kref_get(&ctx->refcount);
+			ret = ctx;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static void al_ctx_put(struct al_dec_ctx *ctx)
+{
+	kref_put(&ctx->refcount, al_ctx_cleanup);
+}
+
+static int al_dec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(q);
+	struct al_codec_dev *codec = ctx->codec;
+
+	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		struct v4l2_m2m_buffer *buf;
+		int ret;
+
+		if (list_empty(&ctx->stream_q_list)) {
+			al_v4l2_err(codec, "Empty stream list.");
+			return -EINVAL;
+		}
+
+		if (!al_common_mcu_is_alive(codec)) {
+			al_v4l2_err(codec, "Unable to ping the mcu");
+			return -ENODEV;
+		}
+
+		ret = dec_fw_create_decoder(ctx);
+		if (ret) {
+			al_v4l2_err(codec, "Unable to create the fw decoder %d",
+				    ret);
+			return ret;
+		}
+
+		/* Get the first vid-out queued buffer */
+		buf = list_first_entry(&ctx->stream_q_list,
+				       struct v4l2_m2m_buffer, list);
+
+		if (al_dec_fw_push_bitstream_buf(ctx, &buf->vb)) {
+			al_v4l2_err(codec,
+				    "Unable to push the bitstream buffer");
+			return -EINVAL;
+		}
+
+		/* Wait until the mcu detect the resolution of the stream */
+		ret = wait_for_completion_timeout(&ctx->res_done,
+						  DEC_RES_EVT_TIMEOUT);
+		if (!ret) {
+			al_v4l2_err(codec, "unsupported stream");
+			ctx->aborting = true;
+		}
+	}
+
+	return 0;
+}
+
+static void al_dec_stop_streaming_cap(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct v4l2_m2m_buffer *entry, *tmp;
+
+	mutex_lock(&ctx->buf_q_mlock);
+	if (!list_empty(&ctx->frame_q_list))
+		list_for_each_entry_safe(entry, tmp, &ctx->frame_q_list, list) {
+			list_del(&entry->list);
+			vbuf = &entry->vb;
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		}
+	mutex_unlock(&ctx->buf_q_mlock);
+
+	while (v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx)) {
+		vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (vbuf) {
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		}
+	}
+
+	v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+}
+
+static void al_dec_stop_streaming_out(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct v4l2_m2m_buffer *entry, *tmp;
+
+	mutex_lock(&ctx->buf_q_mlock);
+	if (!list_empty(&ctx->stream_q_list))
+		list_for_each_entry_safe(entry, tmp, &ctx->stream_q_list,
+					 list) {
+			list_del(&entry->list);
+			v4l2_m2m_buf_done(&entry->vb, VB2_BUF_STATE_ERROR);
+		}
+	mutex_unlock(&ctx->buf_q_mlock);
+
+	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx)) {
+		while ((vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+			if (vbuf->vb2_buf.state == VB2_BUF_STATE_ACTIVE)
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
+
+	dec_fw_destroy_decoder(ctx);
+}
+
+static void al_dec_stop_streaming(struct vb2_queue *q)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(q);
+
+	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
+
+	/* Releasing the dst and src buffers */
+	ctx->stopped = true;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		al_dec_stop_streaming_out(ctx);
+	else
+		al_dec_stop_streaming_cap(ctx);
+}
+
+static int al_dec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(vq);
+	struct al_frame *format = al_get_frame(ctx, vq->type);
+
+	if (IS_ERR(format)) {
+		al_v4l2_err(ctx->codec, "Invalid format %p", format);
+		return PTR_ERR(format);
+	}
+
+	if (*nplanes)
+		return ((sizes[0] < format->sizeimage) ? -EINVAL : 0);
+
+	/* update queue num buffers */
+	format->nbuffers = max(*nbuffers, format->nbuffers);
+
+	*nplanes = 1;
+	sizes[0] = format->sizeimage;
+	*nbuffers = format->nbuffers;
+
+	al_v4l2_dbg(ctx->codec, 2, "%s: Get %d buffers of size %d each ",
+		    (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ? "OUT" : "CAP",
+		    *nbuffers, sizes[0]);
+
+	return 0;
+}
+
+static int al_dec_buf_prepare(struct vb2_buffer *vb)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (ctx->aborting)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+		if (vbuf->field != V4L2_FIELD_NONE)
+			return -EINVAL;
+	}
+
+	al_v4l2_dbg(ctx->codec, 3, "%s : Buffer (%p) prepared ",
+		    (V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP"), vbuf);
+
+	return 0;
+}
+
+static inline void al_dec_fill_bitstream(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct v4l2_m2m_buffer *m2m_buf;
+	struct vb2_queue *src_vq;
+
+	lockdep_assert_held(&ctx->buf_q_mlock);
+
+	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) > 0) {
+		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+		if (!src_buf)
+			return;
+
+		/* Dump empty buffers */
+		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
+			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+			return;
+		}
+
+		src_vq = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
+		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+
+		if (src_buf) {
+			src_buf->sequence = ctx->osequence++;
+
+			if (vb2_is_streaming(src_vq) &&
+			    al_dec_fw_push_bitstream_buf(ctx, src_buf)) {
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+				return;
+			}
+
+			m2m_buf = container_of(src_buf, struct v4l2_m2m_buffer,
+					       vb);
+			list_add_tail(&m2m_buf->list, &ctx->stream_q_list);
+		}
+	}
+}
+
+static void al_dec_buf_queue(struct vb2_buffer *vb)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		mutex_lock(&ctx->buf_q_mlock);
+		al_dec_fill_bitstream(ctx);
+		mutex_unlock(&ctx->buf_q_mlock);
+	}
+
+	al_v4l2_dbg(ctx->codec, 3, "%s queued (%p) - (%d)",
+		    V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP", vbuf,
+		    vb->num_planes);
+}
+
+static const struct vb2_ops dec_queue_ops = {
+	.queue_setup = al_dec_queue_setup,
+	.buf_prepare = al_dec_buf_prepare,
+	.buf_queue = al_dec_buf_queue,
+	.start_streaming = al_dec_start_streaming,
+	.stop_streaming = al_dec_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int al_dec_queue_init(void *priv, struct vb2_queue *src_vq,
+			     struct vb2_queue *dst_vq)
+{
+	struct al_dec_ctx *ctx = priv;
+	struct al_codec_dev *codec = ctx->codec;
+	int ret;
+
+	src_vq->dev = &codec->pdev->dev;
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->non_coherent_mem = false;
+	src_vq->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->drv_priv = ctx;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->ops = &dec_queue_ops;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->lock = &ctx->codec->lock;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->dev = &codec->pdev->dev;
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->non_coherent_mem = false;
+	dst_vq->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->drv_priv = ctx;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->ops = &dec_queue_ops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->lock = &ctx->codec->lock;
+	ret = vb2_queue_init(dst_vq);
+	if (ret) {
+		vb2_queue_release(src_vq);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int al_dec_querycap(struct file *file, void *fh,
+			   struct v4l2_capability *cap)
+{
+	struct al_codec_dev *codec = video_drvdata(file);
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	strscpy(cap->card, "Allegro DVT Video Decoder", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(&codec->pdev->dev));
+
+	return 0;
+}
+
+static int al_dec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	const struct al_fmt *fmt;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		if (f->index >= ARRAY_SIZE(al_src_formats))
+			return -EINVAL;
+
+		fmt = &al_src_formats[f->index];
+	} else {
+		if (f->index >= ARRAY_SIZE(al_dst_formats))
+			return -EINVAL;
+
+		fmt = &al_dst_formats[f->index];
+	}
+
+	f->pixelformat = fmt->pixelformat;
+	return 0;
+}
+
+static int al_dec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	struct al_frame *pix_fmt;
+
+	pix_fmt = al_get_frame(ctx, f->type);
+	if (IS_ERR(pix_fmt)) {
+		al_v4l2_err(ctx->codec, "Invalid frame (%p)", pix_fmt);
+		return PTR_ERR(pix_fmt);
+	}
+
+	pix_fmt->fmt = al_find_fmt(pix->pixelformat);
+	if (!pix_fmt->fmt) {
+		al_v4l2_err(ctx->codec, "Unknown format 0x%x",
+			    pix->pixelformat);
+		return -EINVAL;
+	}
+	pix->field = V4L2_FIELD_NONE;
+	pix->width = clamp_t(__u32, pix->width, DECODER_WIDTH_MIN,
+			     DECODER_WIDTH_MAX);
+	pix->height = clamp_t(__u32, pix->height, DECODER_HEIGHT_MIN,
+			      DECODER_HEIGHT_MAX);
+
+	pix->bytesperline = pix->width;
+	pix->sizeimage = (pix->width * pix->height * pix_fmt->fmt->bpp) / 8;
+
+	if (V4L2_TYPE_IS_CAPTURE(f->type))
+		if (pix->sizeimage < pix_fmt->sizeimage)
+			pix->sizeimage = pix_fmt->sizeimage;
+
+	al_v4l2_dbg(
+		ctx->codec, 3,
+		"%s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d) ",
+		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+
+	return 0;
+}
+
+static int al_dec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct al_frame *pix_fmt = al_get_frame(ctx, f->type);
+	struct v4l2_pix_format *pix;
+
+	if (IS_ERR(pix_fmt)) {
+		al_v4l2_err(ctx->codec, "Invalid pixel format %p", pix_fmt);
+		return PTR_ERR(pix_fmt);
+	}
+
+	if (!pix_fmt->fmt) {
+		al_v4l2_err(ctx->codec, "Unknown format for %d", f->type);
+		return -EINVAL;
+	}
+
+	pix = &f->fmt.pix;
+	pix->width = pix_fmt->width;
+	pix->height = pix_fmt->height;
+	pix->bytesperline = pix_fmt->bytesperline;
+	pix->sizeimage = pix_fmt->sizeimage;
+	pix->pixelformat = pix_fmt->fmt->pixelformat;
+	pix->field = V4L2_FIELD_NONE;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		pix->bytesperline = 0;
+
+	pix->ycbcr_enc = pix_fmt->ycbcr_enc;
+	pix->quantization = pix_fmt->quantization;
+	pix->xfer_func = pix_fmt->xfer_func;
+	pix->colorspace = pix_fmt->colorspace;
+
+	al_v4l2_dbg(
+		ctx->codec, 3,
+		"%s : width (%d) , height (%d), bytesperline (%d) , sizeimage (%d)",
+		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+
+	return 0;
+}
+
+static int al_dec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct v4l2_pix_format *pix;
+	struct al_frame *frame;
+	struct vb2_queue *vq;
+	int ret;
+
+	ret = al_dec_try_fmt(file, fh, f);
+	if (ret) {
+		al_v4l2_err(ctx->codec, "Cannot set format (%d)", f->type);
+		return ret;
+	}
+
+	frame = (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ? &ctx->src : &ctx->dst;
+
+	pix = &f->fmt.pix;
+	frame->fmt = al_find_fmt(pix->pixelformat);
+	if (!frame->fmt) {
+		al_v4l2_err(ctx->codec, "Unknown format for %d",
+			    pix->pixelformat);
+		return -EINVAL;
+	}
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_streaming(vq)) {
+		al_v4l2_err(ctx->codec, "queue %d busy", f->type);
+		return -EBUSY;
+	}
+
+	frame->width = pix->width;
+	frame->height = pix->height;
+	frame->bytesperline = pix->bytesperline;
+	frame->sizeimage = pix->sizeimage;
+	frame->field = pix->field;
+
+	frame->ycbcr_enc = pix->ycbcr_enc;
+	frame->quantization = pix->quantization;
+	frame->xfer_func = pix->xfer_func;
+	frame->colorspace = pix->colorspace;
+
+	al_v4l2_dbg(
+		ctx->codec, 3,
+		" %s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d)",
+		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+
+	return 0;
+}
+
+static void al_queue_eos_event(struct al_dec_ctx *ctx)
+{
+	const struct v4l2_event eos_event = {
+		.id = 0,
+		.type = V4L2_EVENT_EOS,
+	};
+
+	v4l2_event_queue_fh(&ctx->fh, &eos_event);
+}
+
+static void al_queue_res_chg_event(struct al_dec_ctx *ctx)
+{
+	static const struct v4l2_event ev_src_ch = {
+		.id = 0,
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
+}
+
+static int al_dec_decoder_cmd(struct file *file, void *fh,
+			      struct v4l2_decoder_cmd *dcmd)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_v4l2_buffer *vbuf;
+	struct vb2_queue *dst_vq;
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dcmd);
+	if (ret)
+		return ret;
+
+	/* Get the vb2 queue for the Capture */
+	dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
+
+	switch (dcmd->cmd) {
+	case V4L2_DEC_CMD_START:
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		break;
+	case V4L2_DEC_CMD_STOP:
+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
+		if (vbuf) {
+			al_v4l2_dbg(ctx->codec, 1,
+				    "marking last pending buffer");
+
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			if (v4l2_m2m_num_src_bufs_ready(m2m_ctx) == 0) {
+				al_v4l2_dbg(ctx->codec, 1,
+					    "all remaining buffers queued");
+				v4l2_m2m_try_schedule(m2m_ctx);
+			}
+		}
+		dec_fw_flush_req(ctx);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int al_dec_enum_framesizes(struct file *file, void *fh,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	if (!al_find_fmt(fsize->pixel_format))
+		return -EINVAL;
+
+	/* FIXME : check step size */
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = DECODER_WIDTH_MIN;
+	fsize->stepwise.max_width = DECODER_WIDTH_MAX;
+	fsize->stepwise.step_width = 8;
+	fsize->stepwise.min_height = DECODER_HEIGHT_MIN;
+	fsize->stepwise.max_height = DECODER_HEIGHT_MAX;
+	fsize->stepwise.step_height = 8;
+
+	return 0;
+}
+
+static int al_dec_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int al_dec_log_status(struct file *file, void *fh)
+{
+	struct al_codec_dev *codec = video_drvdata(file);
+
+	v4l2_device_call_all(&codec->v4l2_dev, 0, core, log_status);
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops al_dec_ioctl_ops = {
+	.vidioc_querycap = al_dec_querycap,
+	.vidioc_enum_fmt_vid_cap = al_dec_enum_fmt,
+	.vidioc_enum_fmt_vid_out = al_dec_enum_fmt,
+	.vidioc_g_fmt_vid_cap = al_dec_g_fmt,
+	.vidioc_g_fmt_vid_out = al_dec_g_fmt,
+	.vidioc_try_fmt_vid_cap = al_dec_try_fmt,
+	.vidioc_try_fmt_vid_out = al_dec_try_fmt,
+	.vidioc_s_fmt_vid_cap = al_dec_s_fmt,
+	.vidioc_s_fmt_vid_out = al_dec_s_fmt,
+
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+	.vidioc_log_status = al_dec_log_status,
+
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd = al_dec_decoder_cmd,
+	.vidioc_enum_framesizes = al_dec_enum_framesizes,
+
+	.vidioc_subscribe_event = al_dec_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static void al_device_run(void *priv)
+{
+	struct al_dec_ctx *ctx = priv;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct v4l2_m2m_buffer *m2m_buf;
+
+	if (unlikely(!ctx))
+		return;
+
+	if (ctx->aborting) {
+		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
+		return;
+	}
+
+	if (!v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx))
+		goto job_finish;
+
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	if (!dst_buf)
+		goto job_finish;
+
+	if (!al_common_mcu_is_alive(ctx->codec) ||
+	    al_dec_fw_push_frame_buf(ctx, dst_buf)) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+		goto job_finish;
+	}
+
+	mutex_lock(&ctx->buf_q_mlock);
+	m2m_buf = container_of(dst_buf, struct v4l2_m2m_buffer, vb);
+	list_add_tail(&m2m_buf->list, &ctx->frame_q_list);
+	mutex_unlock(&ctx->buf_q_mlock);
+
+job_finish:
+	v4l2_m2m_job_finish(ctx->codec->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops al_dec_m2m_ops = {
+	.device_run = al_device_run,
+};
+
+static int al_dec_open(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct al_codec_dev *codec = video_get_drvdata(vdev);
+	struct al_dec_ctx *ctx = NULL;
+	int ret;
+
+	if (mutex_lock_interruptible(&codec->ctx_mlock))
+		return -ERESTARTSYS;
+
+	/* Aloocate memory for the dec ctx */
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ctx->codec = codec;
+	/* Init ctx mutex */
+	mutex_init(&ctx->buf_q_mlock);
+	/* Init ctx LISTHEADs*/
+	INIT_LIST_HEAD(&ctx->cmd_q_list);
+	INIT_LIST_HEAD(&ctx->frame_q_list);
+	INIT_LIST_HEAD(&ctx->stream_q_list);
+
+	/* Init the irq queue */
+	init_completion(&ctx->res_done);
+
+	v4l2_fh_init(&ctx->fh, vdev);
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 0);
+	if (ctx->ctrl_handler.error) {
+		ret = ctx->ctrl_handler.error;
+		al_v4l2_err(codec, "Failed to create control %d", ret);
+		goto handler_error;
+	}
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
+	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
+
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh);
+
+	/* Set default formats */
+	ctx->src = ctx->dst = al_default_fmt;
+	ctx->csequence = ctx->osequence = 0;
+
+	ctx->stopped = false;
+	ctx->aborting = false;
+	ctx->id = codec->ctx_counter++;
+
+	/* Setup the ctx for m2m mode */
+	ctx->fh.m2m_ctx =
+		v4l2_m2m_ctx_init(codec->m2m_dev, ctx, al_dec_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		al_v4l2_err(codec, "Failed to initialize m2m mode %d", ret);
+		goto error_ctrls;
+	}
+
+	v4l2_m2m_set_src_buffered(ctx->fh.m2m_ctx, true);
+
+	/* Add ctx to the LIST */
+	kref_init(&ctx->refcount);
+	list_add(&ctx->list, &codec->ctx_q_list);
+	al_codec_dbgfs_create(ctx);
+
+	mutex_unlock(&codec->ctx_mlock);
+
+	return 0;
+
+error_ctrls:
+	v4l2_fh_del(&ctx->fh);
+handler_error:
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+unlock:
+	mutex_unlock(&codec->ctx_mlock);
+	return ret;
+}
+
+static int al_dec_release(struct file *file)
+{
+	struct al_dec_ctx *ctx =
+		fh_to_ctx(file->private_data, struct al_dec_ctx);
+	struct al_codec_dev *codec = ctx->codec;
+
+	guard(mutex)(&codec->ctx_mlock);
+
+	/* It is important to do this before removing ctx from dev list.
+	 * Those commands will trigger some traffic towards fw and so we
+	 * need completion to avoid deadlock if cmds can't find ctx.
+	 */
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+
+	list_del(&ctx->list);
+	al_codec_dbgfs_remove(codec, ctx->id);
+	al_ctx_put(ctx);
+
+	return 0;
+}
+
+static inline bool al_mark_last_dst_buf(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *buf;
+	struct vb2_buffer *dst_vb;
+	struct vb2_queue *dst_vq;
+	unsigned long flags;
+
+	al_v4l2_dbg(ctx->codec, 1, "marking last capture buffer");
+
+	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	spin_lock_irqsave(&dst_vq->done_lock, flags);
+	if (list_empty(&dst_vq->done_list)) {
+		spin_unlock_irqrestore(&dst_vq->done_lock, flags);
+		return false;
+	}
+
+	dst_vb = list_last_entry(&dst_vq->done_list, struct vb2_buffer,
+				 done_entry);
+	buf = to_vb2_v4l2_buffer(dst_vb);
+	buf->flags |= V4L2_BUF_FLAG_LAST;
+
+	spin_unlock_irqrestore(&dst_vq->done_lock, flags);
+	return true;
+}
+
+static const struct v4l2_file_operations al_dec_file_ops = {
+	.owner = THIS_MODULE,
+	.open = al_dec_open,
+	.release = al_dec_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static void handle_error_evt(struct al_dec_ctx *ctx, struct msg_itf_header *hdr)
+{
+	struct al_codec_dev *codec = ctx->codec;
+	struct msg_itf_evt_error evt;
+	struct v4l2_m2m_buffer *vbuf;
+
+	if (al_common_get_data(codec, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(codec, "Unable to get resolution found event");
+		return;
+	}
+
+	al_v4l2_err(codec, "Decoding error  %d", evt.errno);
+
+	guard(mutex)(&ctx->buf_q_mlock);
+	if (!list_empty(&ctx->stream_q_list)) {
+		vbuf = list_last_entry(&ctx->frame_q_list,
+				       struct v4l2_m2m_buffer, list);
+		list_del(&vbuf->list);
+		v4l2_m2m_buf_done(&vbuf->vb, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static void handle_resolution_found_evt(struct al_dec_ctx *ctx,
+					struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_resolution_found evt;
+	struct al_codec_dev *codec = ctx->codec;
+	struct al_frame *frame;
+	struct vb2_queue *dst_vq;
+
+	if (al_common_get_data(codec, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(codec, "Unable to get resolution found event");
+		return;
+	}
+
+	frame = &ctx->dst;
+
+	if (frame->width != evt.width || frame->height != evt.height ||
+	    frame->nbuffers < evt.buffer_nb) {
+		/* Update frame properties */
+		frame->width = evt.width;
+		frame->height = evt.height;
+		frame->bytesperline = evt.bytesperline;
+		frame->sizeimage = evt.sizeimage;
+		frame->nbuffers = evt.buffer_nb;
+		frame->fmt = al_find_fmt(evt.pixelformat);
+
+		/* This has to be changed */
+		if (!frame->fmt)
+			return;
+
+		al_queue_res_chg_event(ctx);
+	}
+
+	dst_vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+	if (!vb2_is_streaming(dst_vq))
+		complete(&ctx->res_done);
+
+	al_v4l2_dbg(
+		codec, 3,
+		"width(%d) , height(%d), bytesperline(%d), sizeimage(%d), n_bufs(%d)",
+		frame->width, frame->height, frame->bytesperline,
+		frame->sizeimage, frame->nbuffers);
+}
+
+static void handle_bitstream_buffer_release_evt(struct al_dec_ctx *ctx,
+						struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_bitstream_buffer_release evt;
+	struct al_codec_dev *codec = ctx->codec;
+	struct vb2_v4l2_buffer *vbuf;
+
+	if (al_common_get_data(codec, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(codec, "Unable to get buffer release event");
+		return;
+	}
+
+	if (ctx->stopped)
+		return;
+
+	vbuf = al_dec_dequeue_src_buf(ctx, evt.bufferHandle);
+	if (!vbuf) {
+		al_v4l2_err(codec, "Unable to find bitsream buffer 0x%llx",
+			    evt.bufferHandle);
+		return;
+	}
+
+	al_v4l2_dbg(codec, 3, "Release bitstream buffer %p", vbuf);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+}
+
+static void handle_eos_evt(struct al_dec_ctx *ctx, struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_frame_buffer_decode evt;
+	struct al_codec_dev *codec = ctx->codec;
+
+	if (al_common_get_data(codec, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(codec, "Unable to get frame buffer event");
+		return;
+	}
+
+	/* set LAST_FLAG to the last done CAPTURE buffer*/
+	al_mark_last_dst_buf(ctx);
+	/* Set eos event */
+	al_queue_eos_event(ctx);
+}
+
+static void handle_frame_buffer_decode_evt(struct al_dec_ctx *ctx,
+					   struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_frame_buffer_decode evt;
+	struct al_codec_dev *codec = ctx->codec;
+	struct vb2_v4l2_buffer *vbuf;
+	struct al_buffer_meta *meta;
+
+	if (al_common_get_data(codec, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(codec, "Unable to get frame buffer event");
+		return;
+	}
+
+	vbuf = al_dec_dequeue_dst_buf(ctx, evt.bufferHandle);
+	if (!vbuf) {
+		al_v4l2_err(codec, "Unable to find frame buffer 0x%llx",
+			    evt.bufferHandle);
+		return;
+	}
+
+	meta = &evt.meta;
+	al_v4l2_dbg(codec, 3, "Decoded frame done for buffer %p (%d) (%lld)",
+		    vbuf, meta->last, evt.size);
+
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, evt.size);
+	vbuf->field = V4L2_FIELD_NONE;
+	vbuf->sequence = ctx->csequence++;
+	vbuf->timecode = meta->timecode;
+	vbuf->vb2_buf.timestamp = meta->timestamp;
+
+	if (meta->last || (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
+		vbuf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+	}
+
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+}
+
+static int al_handle_cmd_reply(struct al_codec_dev *codec,
+			       struct msg_itf_header *hdr)
+{
+	struct al_dec_ctx *ctx;
+	struct al_codec_cmd *cmd = NULL;
+	int ret = 0;
+
+	ctx = al_ctx_get(codec, hdr->drv_ctx_hdl);
+	if (IS_ERR_OR_NULL(ctx)) {
+		al_v4l2_err(codec, "Unable to find ctx %p for reply %d",
+			    al_phys_to_virt(hdr->drv_ctx_hdl), hdr->type);
+		return -EINVAL;
+	}
+
+	cmd = al_codec_cmd_get(&ctx->cmd_q_list, hdr->drv_cmd_hdl);
+	if (!cmd) {
+		al_v4l2_err(codec, "Unable to find command %p for reply %d",
+			    al_phys_to_virt(hdr->drv_cmd_hdl), hdr->type);
+		ret = -EINVAL;
+		goto ctx_put;
+	}
+
+	if (cmd->reply_size != hdr->payload_len) {
+		al_v4l2_err(codec, "mismatch size %d %d", cmd->reply_size,
+			    hdr->payload_len);
+		ret = -EINVAL;
+		goto cmd_put;
+	}
+
+	ret = al_common_get_data(codec, cmd->reply, hdr->payload_len);
+	if (ret)
+		al_v4l2_err(codec, "Unable to copy reply");
+
+	complete(&cmd->done);
+	ret = 0;
+
+cmd_put:
+	al_codec_cmd_put(cmd);
+ctx_put:
+	al_ctx_put(ctx);
+
+	return ret;
+}
+
+static int al_handle_cmd_evt(struct al_codec_dev *dev,
+			     struct msg_itf_header *hdr, int type)
+{
+	static u32 evt_sizes[] = {
+		sizeof(struct msg_itf_evt_error),
+		sizeof(struct msg_itf_evt_resolution_found),
+		sizeof(struct msg_itf_evt_bitstream_buffer_release),
+		sizeof(struct msg_itf_evt_frame_buffer_decode),
+		sizeof(struct msg_itf_evt_eos),
+	};
+
+	u32 evt_size;
+	struct al_dec_ctx *ctx = NULL;
+	int ret = 0;
+
+	if (type < MSG_ITF_TYPE_NEXT_EVT || type > MSG_ITF_TYPE_END_EVT) {
+		al_v4l2_err(dev, "Unsupporting event type %d", type);
+		return -EINVAL;
+	}
+
+	ctx = al_ctx_get(dev, hdr->drv_ctx_hdl);
+	if (!ctx) {
+		al_v4l2_err(dev, "Unable to find ctx %p for evt %d",
+			    al_phys_to_virt(hdr->drv_ctx_hdl), type);
+		return -EINVAL;
+	}
+
+	// Check the received event size and the expected one
+	evt_size = evt_sizes[type - MSG_ITF_TYPE_NEXT_EVT];
+	if (hdr->payload_len != evt_size) {
+		al_v4l2_err(
+			dev,
+			"Invalid event size for client (%p) for evt (%d) : Got (%d), expected (%d)",
+			al_phys_to_virt(hdr->drv_ctx_hdl), type,
+			hdr->payload_len, evt_size);
+		ret = -EINVAL;
+		goto clean_ctx;
+	}
+
+	al_v4l2_dbg(dev, 3, "Event received from MCU (%d)", type);
+
+	switch (type) {
+	case MSG_ITF_TYPE_EVT_ERROR:
+		handle_error_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_RESOLUTION_FOUND:
+		handle_resolution_found_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE:
+		handle_bitstream_buffer_release_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE:
+		handle_frame_buffer_decode_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_EOS:
+		handle_eos_evt(ctx, hdr);
+		break;
+	default:
+		break;
+	}
+
+clean_ctx:
+	al_ctx_put(ctx);
+	return ret;
+}
+
+static void al_dec_process_msg(void *cb_arg, struct msg_itf_header *hdr)
+{
+	struct al_codec_dev *dev = cb_arg;
+	int ret;
+
+	if (is_type_reply(hdr->type))
+		ret = al_handle_cmd_reply(dev, hdr);
+	else if (is_type_event(hdr->type))
+		ret = al_handle_cmd_evt(dev, hdr, hdr->type);
+	else {
+		al_v4l2_err(dev, "Unsupported message type %d", hdr->type);
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		al_v4l2_err(dev, "Skip received data");
+		al_common_skip_data(dev, hdr->payload_len);
+	}
+}
+
+static const struct video_device al_videodev = {
+	.name = "allegro-decoder",
+	.fops = &al_dec_file_ops,
+	.ioctl_ops = &al_dec_ioctl_ops,
+	.minor = -1,
+	.release = video_device_release_empty,
+	.vfl_dir = VFL_DIR_M2M,
+	.device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
+};
+
+static void al_dec_register_v4l2(void *cb_arg)
+{
+	struct al_codec_dev *dev = cb_arg;
+	struct video_device *video_dev = NULL;
+	int ret;
+
+	ret = v4l2_device_register(&dev->pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		al_v4l2_err(dev, "Unable to register v4l2 device %d", ret);
+		return;
+	}
+
+	dev->m2m_dev = v4l2_m2m_init(&al_dec_m2m_ops);
+	if (IS_ERR(dev->m2m_dev)) {
+		ret = PTR_ERR(dev->m2m_dev);
+		al_v4l2_err(dev, "failed to init mem2mem device %d", ret);
+		goto v4l2_m2m_init_error;
+	}
+
+	video_dev = &dev->video_dev;
+	*video_dev = al_videodev;
+
+	video_dev->lock = &dev->lock;
+	video_dev->v4l2_dev = &dev->v4l2_dev;
+
+	video_set_drvdata(video_dev, dev);
+	ret = video_register_device(video_dev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		al_v4l2_err(dev, "failed to register video device %d", ret);
+		goto video_register_device_error;
+	}
+
+	v4l2_info(&dev->v4l2_dev, "registered as /dev/video%d\n",
+		  dev->video_dev.num);
+
+	dev->init_done = true;
+
+	return;
+
+video_register_device_error:
+	v4l2_m2m_release(dev->m2m_dev);
+v4l2_m2m_init_error:
+	v4l2_device_unregister(&dev->v4l2_dev);
+}
+
+static int al_dec_probe(struct platform_device *pdev)
+{
+	struct al_codec_dev *codec;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct al_match_data *match_data;
+	const char *firmware;
+	int ret;
+
+	dev_info(dev, "Probing ...\n");
+
+	match_data = device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Missing device match data\n");
+		return -EINVAL;
+	}
+
+	codec = devm_kzalloc(dev, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	codec->pdev = pdev;
+	codec->init_done = false;
+	codec->ctx_counter = 0;
+	mutex_init(&codec->lock);
+	mutex_init(&codec->ctx_mlock);
+	INIT_LIST_HEAD(&codec->ctx_q_list);
+
+	codec->cb_arg = codec;
+	codec->process_msg_cb = al_dec_process_msg;
+	codec->fw_ready_cb = al_dec_register_v4l2;
+
+	/* firmware-name is optional in DT */
+	of_property_read_string(np, "firmware-name", &firmware);
+	if (!firmware)
+		firmware = match_data->fw_name;
+
+	ret = al_common_probe(codec, firmware);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, codec);
+	al_codec_dbgfs_init(codec);
+	dev_info(dev, "Probing done successfully %p\n", codec);
+
+	return 0;
+}
+
+static void al_dec_remove(struct platform_device *pdev)
+{
+	struct al_codec_dev *dev = platform_get_drvdata(pdev);
+
+	dev_info(&pdev->dev, "remove %p\n", dev);
+
+	if (dev->init_done) {
+		video_unregister_device(&dev->video_dev);
+		if (dev->m2m_dev)
+			v4l2_m2m_release(dev->m2m_dev);
+		v4l2_device_unregister(&dev->v4l2_dev);
+	}
+	al_codec_dbgfs_deinit(&dev->dbgfs);
+	al_common_remove(dev);
+}
+
+static const struct al_match_data ald300_data = {
+	.fw_name = "al300-vdec.fw",
+};
+
+static const struct of_device_id __maybe_unused v4l2_al_dec_dt_match[] = {
+	{ .compatible = "allegro,al300-vdec", .data = &ald300_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, v4l2_al_dec_dt_match);
+
+static struct platform_driver al300_vdec_drv = {
+	.probe = al_dec_probe,
+	.remove = al_dec_remove,
+	.driver = {
+		.name = "al300_vdec",
+		.of_match_table = of_match_ptr(v4l2_al_dec_dt_match),
+	},
+};
+
+module_platform_driver(al300_vdec_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:al300-vdec");
+MODULE_AUTHOR("Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>");
+MODULE_DESCRIPTION("Allegro DVT V4l2 decoder driver gen 3");
diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
new file mode 100644
index 0000000000000000000000000000000000000000..a9f4818bcc94114c02614328c6c6edec33702556
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_VDEC_DRV__
+#define __AL_VDEC_DRV__
+
+#include <media/v4l2-ctrls.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "al_codec_common.h"
+
+enum {
+	MSG_ITF_TYPE_EVT_RESOLUTION_FOUND = MSG_ITF_TYPE_NEXT_EVT + 1,
+	MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE,
+	MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE,
+	MSG_ITF_TYPE_EVT_EOS,
+	/* Mark the end of the events list.*/
+	MSG_ITF_TYPE_END_EVT,
+};
+
+struct msg_itf_create_decoder_req {
+	unsigned int codec;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_create_decoder_req);
+
+struct msg_itf_evt_resolution_found {
+	u16 buffer_nb;
+	u16 width;
+	u16 height;
+	u32 pixelformat;
+	u32 sizeimage;
+	u32 bytesperline;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_resolution_found);
+
+struct msg_itf_evt_bitstream_buffer_release {
+	u64 bufferHandle;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_bitstream_buffer_release);
+
+struct msg_itf_evt_frame_buffer_decode {
+	u64 bufferHandle;
+	u64 size;
+	struct al_buffer_meta meta;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_frame_buffer_decode);
+
+struct msg_itf_evt_eos {
+	u32 unused;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_eos);
+
+struct al_fmt {
+	u32 pixelformat;
+	u8 bpp;
+};
+
+struct al_frame {
+	u32 width;
+	u32 height;
+	u32 bytesperline;
+	u32 sizeimage;
+	u32 nbuffers;
+	const struct al_fmt *fmt;
+	enum v4l2_field field;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
+	enum v4l2_xfer_func xfer_func;
+};
+
+struct al_dec_ctx {
+	struct al_codec_dev *codec;
+	struct v4l2_fh fh;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct kref refcount;
+	struct list_head list;
+	/* CAP and OUT frames */
+	struct al_frame src;
+	struct al_frame dst;
+	struct completion res_done; /* Resolution found event */
+	struct list_head cmd_q_list; /* Store active commands */
+	struct mutex buf_q_mlock;
+	struct list_head frame_q_list;
+	struct list_head stream_q_list;
+	u64 hDec;
+	u32 csequence;
+	u32 osequence;
+	u64 id;
+	bool stopped;
+	bool aborting;
+};
+
+#endif /*__AL_VDEC_DRV__*/

-- 
2.30.2



