Return-Path: <linux-media+bounces-3500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE482A7CD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C808D1F22140
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17CF46BA;
	Thu, 11 Jan 2024 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwIUBHsn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C44F46B6
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955587; x=1736491587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VA7YeKHxHOeTkbrdizJtKFoEiNf+4gmFLzicG+X+udM=;
  b=HwIUBHsn44uCuJl7o7U54pwA3o7I7nxoxrVHZnpMjXSrLQF4BPRXfMNa
   zduvwKt68ZZdk/4LlxaQvZ8XPeeIKx1+v4wlJ5orq2H9djq3bze/N8ZRu
   JagOkfd6RlL2B2oa5l6zeEis59w1gbVBi6zvtDqpMiHW3mTQ6+m15i5Vp
   WXXlTv7m9ZT9UIgsBTSD+pwycIBiHd6xMq2Izd4SxM8hC/CMy7oG39GWX
   tur/T8+y4uhurPjK6kyxbWRYZaIMCfmAGYKzsx4fgk0H9oIeKvFWP8PEu
   GfEu7AGh10N4ENDbkqyJ4DPg4gjlLZnACyxTtFN0fAfGBilYo/FNf1lD4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397629096"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397629096"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515509"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515509"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:46:22 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v3 06/17] media: intel/ipu6: add syscom interfaces between firmware and driver
Date: Thu, 11 Jan 2024 14:55:20 +0800
Message-ID: <20240111065531.2418836-7-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Syscom is an inter-process(or) communication mechanism between an IPU
and host. Syscom uses message queues for message exchange between IPU
and host. Each message queue has its consumer and producer, host queue
messages to firmware as the producer and then firmware to dequeue the
messages as consumer and vice versa. IPU and host use shared registers
or memory to reside the read and write indices which are updated by
consumer and producer.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 413 +++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h |  47 +++
 2 files changed, 460 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
new file mode 100644
index 000000000000..0f893f44e04c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2023 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/math.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-fw-com.h"
+
+/*
+ * FWCOM layer is a shared resource between FW and driver. It consist
+ * of token queues to both send and receive directions. Queue is simply
+ * an array of structures with read and write indexes to the queue.
+ * There are 1...n queues to both directions. Queues locates in
+ * system RAM and are mapped to ISP MMU so that both CPU and ISP can
+ * see the same buffer. Indexes are located in ISP DMEM so that FW code
+ * can poll those with very low latency and cost. CPU access to indexes is
+ * more costly but that happens only at message sending time and
+ * interrupt triggered message handling. CPU doesn't need to poll indexes.
+ * wr_reg / rd_reg are offsets to those dmem location. They are not
+ * the indexes itself.
+ */
+
+/* Shared structure between driver and FW - do not modify */
+struct ipu6_fw_sys_queue {
+	u64 host_address;
+	u32 vied_address;
+	u32 size;
+	u32 token_size;
+	u32 wr_reg;	/* reg number in subsystem's regmem */
+	u32 rd_reg;
+	u32 _align;
+} __packed;
+
+struct ipu6_fw_sys_queue_res {
+	u64 host_address;
+	u32 vied_address;
+	u32 reg;
+} __packed;
+
+enum syscom_state {
+	/* Program load or explicit host setting should init to this */
+	SYSCOM_STATE_UNINIT = 0x57a7e000,
+	/* SP Syscom sets this when it is ready for use */
+	SYSCOM_STATE_READY = 0x57a7e001,
+	/* SP Syscom sets this when no more syscom accesses will happen */
+	SYSCOM_STATE_INACTIVE = 0x57a7e002,
+};
+
+enum syscom_cmd {
+	/* Program load or explicit host setting should init to this */
+	SYSCOM_COMMAND_UNINIT = 0x57a7f000,
+	/* Host Syscom requests syscom to become inactive */
+	SYSCOM_COMMAND_INACTIVE = 0x57a7f001,
+};
+
+/* firmware config: data that sent from the host to SP via DDR */
+/* Cell copies data into a context */
+
+struct ipu6_fw_syscom_config {
+	u32 firmware_address;
+
+	u32 num_input_queues;
+	u32 num_output_queues;
+
+	/* ISP pointers to an array of ipu6_fw_sys_queue structures */
+	u32 input_queue;
+	u32 output_queue;
+
+	/* ISYS / PSYS private data */
+	u32 specific_addr;
+	u32 specific_size;
+};
+
+struct ipu6_fw_com_context {
+	struct ipu6_bus_device *adev;
+	void __iomem *dmem_addr;
+	int (*cell_ready)(struct ipu6_bus_device *adev);
+	void (*cell_start)(struct ipu6_bus_device *adev);
+
+	void *dma_buffer;
+	dma_addr_t dma_addr;
+	unsigned int dma_size;
+	unsigned long attrs;
+
+	struct ipu6_fw_sys_queue *input_queue;	/* array of host to SP queues */
+	struct ipu6_fw_sys_queue *output_queue;	/* array of SP to host */
+
+	u32 config_vied_addr;
+
+	unsigned int buttress_boot_offset;
+	void __iomem *base_addr;
+};
+
+#define FW_COM_WR_REG 0
+#define FW_COM_RD_REG 4
+
+#define REGMEM_OFFSET 0
+#define TUNIT_MAGIC_PATTERN 0x5a5a5a5a
+
+enum regmem_id {
+	/* pass pkg_dir address to SPC in non-secure mode */
+	PKG_DIR_ADDR_REG = 0,
+	/* Tunit CFG blob for secure - provided by host.*/
+	TUNIT_CFG_DWR_REG = 1,
+	/* syscom commands - modified by the host */
+	SYSCOM_COMMAND_REG = 2,
+	/* Store interrupt status - updated by SP */
+	SYSCOM_IRQ_REG = 3,
+	/* first syscom queue pointer register */
+	SYSCOM_QPR_BASE_REG = 4
+};
+
+#define BUTTRESS_FW_BOOT_PARAMS_0 0x4000
+#define BUTTRESS_FW_BOOT_PARAM_REG(base, offset, id)			\
+	((base) + BUTTRESS_FW_BOOT_PARAMS_0 + ((offset) + (id)) * 4)
+
+enum buttress_syscom_id {
+	/* pass syscom configuration to SPC */
+	SYSCOM_CONFIG_ID		= 0,
+	/* syscom state - modified by SP */
+	SYSCOM_STATE_ID			= 1,
+	/* syscom vtl0 addr mask */
+	SYSCOM_VTL0_ADDR_MASK_ID	= 2,
+	SYSCOM_ID_MAX
+};
+
+static void ipu6_sys_queue_init(struct ipu6_fw_sys_queue *q, unsigned int size,
+				unsigned int token_size,
+				struct ipu6_fw_sys_queue_res *res)
+{
+	unsigned int buf_size = (size + 1) * token_size;
+
+	q->size = size + 1;
+	q->token_size = token_size;
+
+	/* acquire the shared buffer space */
+	q->host_address = res->host_address;
+	res->host_address += buf_size;
+	q->vied_address = res->vied_address;
+	res->vied_address += buf_size;
+
+	/* acquire the shared read and writer pointers */
+	q->wr_reg = res->reg;
+	res->reg++;
+	q->rd_reg = res->reg;
+	res->reg++;
+}
+
+void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
+			  struct ipu6_bus_device *adev, void __iomem *base)
+{
+	size_t conf_size, inq_size, outq_size, specific_size;
+	struct ipu6_fw_syscom_config *config_host_addr;
+	unsigned int sizeinput = 0, sizeoutput = 0;
+	struct ipu6_fw_sys_queue_res res;
+	struct ipu6_fw_com_context *ctx;
+	struct device *dev = &adev->auxdev.dev;
+	size_t sizeall, offset;
+	unsigned long attrs = 0;
+	void *specific_host_addr;
+	unsigned int i;
+
+	if (!cfg || !cfg->cell_start || !cfg->cell_ready)
+		return NULL;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+	ctx->dmem_addr = base + cfg->dmem_addr + REGMEM_OFFSET;
+	ctx->adev = adev;
+	ctx->cell_start = cfg->cell_start;
+	ctx->cell_ready = cfg->cell_ready;
+	ctx->buttress_boot_offset = cfg->buttress_boot_offset;
+	ctx->base_addr  = base;
+
+	/*
+	 * Allocate DMA mapped memory. Allocate one big chunk.
+	 */
+	/* Base cfg for FW */
+	conf_size = roundup(sizeof(struct ipu6_fw_syscom_config), 8);
+	/* Descriptions of the queues */
+	inq_size = size_mul(cfg->num_input_queues,
+			    sizeof(struct ipu6_fw_sys_queue));
+	outq_size = size_mul(cfg->num_output_queues,
+			     sizeof(struct ipu6_fw_sys_queue));
+	/* FW specific information structure */
+	specific_size = roundup(cfg->specific_size, 8);
+
+	sizeall = conf_size + inq_size + outq_size + specific_size;
+
+	for (i = 0; i < cfg->num_input_queues; i++)
+		sizeinput += size_mul(cfg->input[i].queue_size + 1,
+				      cfg->input[i].token_size);
+
+	for (i = 0; i < cfg->num_output_queues; i++)
+		sizeoutput += size_mul(cfg->output[i].queue_size + 1,
+				       cfg->output[i].token_size);
+
+	sizeall += sizeinput + sizeoutput;
+
+	ctx->dma_buffer = dma_alloc_attrs(dev, sizeall, &ctx->dma_addr,
+					  GFP_KERNEL, attrs);
+	ctx->attrs = attrs;
+	if (!ctx->dma_buffer) {
+		dev_err(dev, "failed to allocate dma memory\n");
+		kfree(ctx);
+		return NULL;
+	}
+
+	ctx->dma_size = sizeall;
+
+	config_host_addr = ctx->dma_buffer;
+	ctx->config_vied_addr = ctx->dma_addr;
+
+	offset = conf_size;
+	ctx->input_queue = ctx->dma_buffer + offset;
+	config_host_addr->input_queue = ctx->dma_addr + offset;
+	config_host_addr->num_input_queues = cfg->num_input_queues;
+
+	offset += inq_size;
+	ctx->output_queue = ctx->dma_buffer + offset;
+	config_host_addr->output_queue = ctx->dma_addr + offset;
+	config_host_addr->num_output_queues = cfg->num_output_queues;
+
+	/* copy firmware specific data */
+	offset += outq_size;
+	specific_host_addr = ctx->dma_buffer + offset;
+	config_host_addr->specific_addr = ctx->dma_addr + offset;
+	config_host_addr->specific_size = cfg->specific_size;
+	if (cfg->specific_addr && cfg->specific_size)
+		memcpy(specific_host_addr, cfg->specific_addr,
+		       cfg->specific_size);
+
+	/* initialize input queues */
+	offset += specific_size;
+	res.reg = SYSCOM_QPR_BASE_REG;
+	res.host_address = (u64)(ctx->dma_buffer + offset);
+	res.vied_address = ctx->dma_addr + offset;
+	for (i = 0; i < cfg->num_input_queues; i++)
+		ipu6_sys_queue_init(ctx->input_queue + i,
+				    cfg->input[i].queue_size,
+				    cfg->input[i].token_size, &res);
+
+	/* initialize output queues */
+	offset += sizeinput;
+	res.host_address = (u64)(ctx->dma_buffer + offset);
+	res.vied_address = ctx->dma_addr + offset;
+	for (i = 0; i < cfg->num_output_queues; i++) {
+		ipu6_sys_queue_init(ctx->output_queue + i,
+				    cfg->output[i].queue_size,
+				    cfg->output[i].token_size, &res);
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_prepare, INTEL_IPU6);
+
+int ipu6_fw_com_open(struct ipu6_fw_com_context *ctx)
+{
+	/* write magic pattern to disable the tunit trace */
+	writel(TUNIT_MAGIC_PATTERN, ctx->dmem_addr + TUNIT_CFG_DWR_REG * 4);
+	/* Check if SP is in valid state */
+	if (!ctx->cell_ready(ctx->adev))
+		return -EIO;
+
+	/* store syscom uninitialized command */
+	writel(SYSCOM_COMMAND_UNINIT, ctx->dmem_addr + SYSCOM_COMMAND_REG * 4);
+
+	/* store syscom uninitialized state */
+	writel(SYSCOM_STATE_UNINIT,
+	       BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
+					  ctx->buttress_boot_offset,
+					  SYSCOM_STATE_ID));
+
+	/* store firmware configuration address */
+	writel(ctx->config_vied_addr,
+	       BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
+					  ctx->buttress_boot_offset,
+					  SYSCOM_CONFIG_ID));
+	ctx->cell_start(ctx->adev);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_open, INTEL_IPU6);
+
+int ipu6_fw_com_close(struct ipu6_fw_com_context *ctx)
+{
+	int state;
+
+	state = readl(BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
+						 ctx->buttress_boot_offset,
+						 SYSCOM_STATE_ID));
+	if (state != SYSCOM_STATE_READY)
+		return -EBUSY;
+
+	/* set close request flag */
+	writel(SYSCOM_COMMAND_INACTIVE, ctx->dmem_addr +
+	       SYSCOM_COMMAND_REG * 4);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_close, INTEL_IPU6);
+
+int ipu6_fw_com_release(struct ipu6_fw_com_context *ctx, unsigned int force)
+{
+	/* check if release is forced, an verify cell state if it is not */
+	if (!force && !ctx->cell_ready(ctx->adev))
+		return -EBUSY;
+
+	dma_free_attrs(&ctx->adev->auxdev.dev, ctx->dma_size,
+		       ctx->dma_buffer, ctx->dma_addr, ctx->attrs);
+	kfree(ctx);
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_release, INTEL_IPU6);
+
+bool ipu6_fw_com_ready(struct ipu6_fw_com_context *ctx)
+{
+	int state;
+
+	state = readl(BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
+						 ctx->buttress_boot_offset,
+						 SYSCOM_STATE_ID));
+
+	return state == SYSCOM_STATE_READY;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_ready, INTEL_IPU6);
+
+void *ipu6_send_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
+{
+	struct ipu6_fw_sys_queue *q = &ctx->input_queue[q_nbr];
+	void __iomem *q_dmem = ctx->dmem_addr + q->wr_reg * 4;
+	unsigned int wr, rd;
+	unsigned int packets;
+	unsigned int index;
+
+	wr = readl(q_dmem + FW_COM_WR_REG);
+	rd = readl(q_dmem + FW_COM_RD_REG);
+
+	if (WARN_ON_ONCE(wr >= q->size || rd >= q->size))
+		return NULL;
+
+	if (wr < rd)
+		packets = rd - wr - 1;
+	else
+		packets = q->size - (wr - rd + 1);
+
+	if (!packets)
+		return NULL;
+
+	index = readl(q_dmem + FW_COM_WR_REG);
+
+	return (void *)(q->host_address + index * q->token_size);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_send_get_token, INTEL_IPU6);
+
+void ipu6_send_put_token(struct ipu6_fw_com_context *ctx, int q_nbr)
+{
+	struct ipu6_fw_sys_queue *q = &ctx->input_queue[q_nbr];
+	void __iomem *q_dmem = ctx->dmem_addr + q->wr_reg * 4;
+	unsigned int wr = readl(q_dmem + FW_COM_WR_REG) + 1;
+
+	if (wr >= q->size)
+		wr = 0;
+
+	writel(wr, q_dmem + FW_COM_WR_REG);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_send_put_token, INTEL_IPU6);
+
+void *ipu6_recv_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
+{
+	struct ipu6_fw_sys_queue *q = &ctx->output_queue[q_nbr];
+	void __iomem *q_dmem = ctx->dmem_addr + q->wr_reg * 4;
+	unsigned int wr, rd;
+	unsigned int packets;
+
+	wr = readl(q_dmem + FW_COM_WR_REG);
+	rd = readl(q_dmem + FW_COM_RD_REG);
+
+	if (WARN_ON_ONCE(wr >= q->size || rd >= q->size))
+		return NULL;
+
+	if (wr < rd)
+		wr += q->size;
+
+	packets = wr - rd;
+	if (!packets)
+		return NULL;
+
+	return (void *)(q->host_address + rd * q->token_size);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_recv_get_token, INTEL_IPU6);
+
+void ipu6_recv_put_token(struct ipu6_fw_com_context *ctx, int q_nbr)
+{
+	struct ipu6_fw_sys_queue *q = &ctx->output_queue[q_nbr];
+	void __iomem *q_dmem = ctx->dmem_addr + q->wr_reg * 4;
+	unsigned int rd = readl(q_dmem + FW_COM_RD_REG) + 1;
+
+	if (rd >= q->size)
+		rd = 0;
+
+	writel(rd, q_dmem + FW_COM_RD_REG);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_recv_put_token, INTEL_IPU6);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.h b/drivers/media/pci/intel/ipu6/ipu6-fw-com.h
new file mode 100644
index 000000000000..660c406b3ac9
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_FW_COM_H
+#define IPU6_FW_COM_H
+
+struct ipu6_fw_com_context;
+struct ipu6_bus_device;
+
+struct ipu6_fw_syscom_queue_config {
+	unsigned int queue_size;	/* tokens per queue */
+	unsigned int token_size;	/* bytes per token */
+};
+
+#define SYSCOM_BUTTRESS_FW_PARAMS_ISYS_OFFSET	0
+
+struct ipu6_fw_com_cfg {
+	unsigned int num_input_queues;
+	unsigned int num_output_queues;
+	struct ipu6_fw_syscom_queue_config *input;
+	struct ipu6_fw_syscom_queue_config *output;
+
+	unsigned int dmem_addr;
+
+	/* firmware-specific configuration data */
+	void *specific_addr;
+	unsigned int specific_size;
+	int (*cell_ready)(struct ipu6_bus_device *adev);
+	void (*cell_start)(struct ipu6_bus_device *adev);
+
+	unsigned int buttress_boot_offset;
+};
+
+void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
+			  struct ipu6_bus_device *adev, void __iomem *base);
+
+int ipu6_fw_com_open(struct ipu6_fw_com_context *ctx);
+bool ipu6_fw_com_ready(struct ipu6_fw_com_context *ctx);
+int ipu6_fw_com_close(struct ipu6_fw_com_context *ctx);
+int ipu6_fw_com_release(struct ipu6_fw_com_context *ctx, unsigned int force);
+
+void *ipu6_recv_get_token(struct ipu6_fw_com_context *ctx, int q_nbr);
+void ipu6_recv_put_token(struct ipu6_fw_com_context *ctx, int q_nbr);
+void *ipu6_send_get_token(struct ipu6_fw_com_context *ctx, int q_nbr);
+void ipu6_send_put_token(struct ipu6_fw_com_context *ctx, int q_nbr);
+
+#endif
-- 
2.42.0


