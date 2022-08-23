Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E1059E7D9
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 18:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244441AbiHWQuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 12:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343634AbiHWQtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 12:49:52 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 95AC21296CF
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 06:17:40 -0700 (PDT)
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 346DB309C8;
        Tue, 23 Aug 2022 15:17:38 +0200 (CEST)
From:   martin.tuma@digiteqautomotive.com
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Date:   Tue, 23 Aug 2022 17:18:04 +0200
Message-Id: <20220823151805.1313-3-martin.tuma@digiteqautomotive.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823151805.1313-1-martin.tuma@digiteqautomotive.com>
References: <20220823151805.1313-1-martin.tuma@digiteqautomotive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

The driver is based on the code provided by Xilinx at
https://github.com/Xilinx/dma_ip_drivers

There are no significant functional changes in the code except
of separating the core DMA driver functionality in a way that the code
can be used by device drivers in the kernel.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/dma/Kconfig               |    7 +
 drivers/dma/xilinx/Makefile       |    2 +
 drivers/dma/xilinx/xdma_core.c    | 3840 +++++++++++++++++++++++++++++
 drivers/dma/xilinx/xdma_core.h    |  588 +++++
 drivers/dma/xilinx/xdma_thread.c  |  309 +++
 drivers/dma/xilinx/xdma_thread.h  |  134 +
 drivers/dma/xilinx/xdma_version.h |   23 +
 include/linux/dma/xilinx_xdma.h   |   91 +
 8 files changed, 4994 insertions(+)
 create mode 100644 drivers/dma/xilinx/xdma_core.c
 create mode 100644 drivers/dma/xilinx/xdma_core.h
 create mode 100644 drivers/dma/xilinx/xdma_thread.c
 create mode 100644 drivers/dma/xilinx/xdma_thread.h
 create mode 100644 drivers/dma/xilinx/xdma_version.h
 create mode 100644 include/linux/dma/xilinx_xdma.h

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index a06d2a7627aa..88c8b0131878 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -801,6 +801,13 @@ config DMATEST
 	  Simple DMA test client. Say N unless you're debugging a
 	  DMA Device driver.
 
+config XILINX_XDMA
+	tristate "Xilinx XDMA Engine"
+	depends on PCI
+	select DMA_ENGINE
+	help
+	  Enable support for Xilinx XDMA IP controller.
+
 config DMA_ENGINE_RAID
 	bool
 
diff --git a/drivers/dma/xilinx/Makefile b/drivers/dma/xilinx/Makefile
index 767bb45f641f..890c9c04e3c7 100644
--- a/drivers/dma/xilinx/Makefile
+++ b/drivers/dma/xilinx/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_XILINX_DMA) += xilinx_dma.o
 obj-$(CONFIG_XILINX_ZYNQMP_DMA) += zynqmp_dma.o
 obj-$(CONFIG_XILINX_ZYNQMP_DPDMA) += xilinx_dpdma.o
+obj-$(CONFIG_XILINX_XDMA) += xilinx_xdma.o
+xilinx_xdma-objs := xdma_core.o xdma_thread.o
diff --git a/drivers/dma/xilinx/xdma_core.c b/drivers/dma/xilinx/xdma_core.c
new file mode 100644
index 000000000000..fd25512f5d65
--- /dev/null
+++ b/drivers/dma/xilinx/xdma_core.c
@@ -0,0 +1,3840 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2016-present,  Xilinx, Inc.
+ * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/mm.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/vmalloc.h>
+#include <linux/dma/xilinx_xdma.h>
+#include "xdma_core.h"
+#include "xdma_thread.h"
+#include "xdma_version.h"
+
+#define DRV_MODULE_NAME "xdma"
+#define DRV_MODULE_DESC "Xilinx XDMA Base Driver"
+#define DRV_MODULE_RELDATE "04/2021"
+
+static char version[] =
+	DRV_MODULE_DESC " " DRV_MODULE_NAME " v" DRV_MODULE_VERSION "\n";
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_DESCRIPTION(DRV_MODULE_DESC);
+MODULE_VERSION(DRV_MODULE_VERSION);
+MODULE_LICENSE("Dual BSD/GPL");
+
+/* Module Parameters */
+static unsigned int poll_mode;
+module_param(poll_mode, uint, 0644);
+MODULE_PARM_DESC(poll_mode, "Set 1 for hw polling, default is 0 (interrupts)");
+
+static unsigned int interrupt_mode;
+module_param(interrupt_mode, uint, 0644);
+MODULE_PARM_DESC(interrupt_mode, "0 - Auto, 1 - MSI, 2 - MSI-x");
+
+static unsigned int enable_credit_mp = 1;
+module_param(enable_credit_mp, uint, 0644);
+MODULE_PARM_DESC(enable_credit_mp,
+		 "Set 0 to disable credit feature, default is 1 (credit control enabled)");
+
+static unsigned int desc_blen_max = XDMA_DESC_BLEN_MAX;
+module_param(desc_blen_max, uint, 0644);
+MODULE_PARM_DESC(desc_blen_max,
+		 "per descriptor max. buffer length, default is (1 << 28) - 1");
+
+/*
+ * xdma device management
+ * maintains a list of the xdma devices
+ */
+static LIST_HEAD(xdev_list);
+static DEFINE_MUTEX(xdev_mutex);
+
+static LIST_HEAD(xdev_rcu_list);
+static DEFINE_SPINLOCK(xdev_rcu_lock);
+
+static inline int xdev_list_add(struct xdma_dev *xdev)
+{
+	mutex_lock(&xdev_mutex);
+	if (list_empty(&xdev_list)) {
+		xdev->idx = 0;
+		if (poll_mode) {
+			int rv = xdma_threads_create(xdev->h2c_channel_max +
+					xdev->c2h_channel_max);
+			if (rv < 0) {
+				mutex_unlock(&xdev_mutex);
+				return rv;
+			}
+		}
+	} else {
+		struct xdma_dev *last;
+
+		last = list_last_entry(&xdev_list, struct xdma_dev, list_head);
+		xdev->idx = last->idx + 1;
+	}
+	list_add_tail(&xdev->list_head, &xdev_list);
+	mutex_unlock(&xdev_mutex);
+
+	dbg_init("dev %s, xdev 0x%p, xdma idx %d.\n",
+		 dev_name(&xdev->pdev->dev), xdev, xdev->idx);
+
+	spin_lock(&xdev_rcu_lock);
+	list_add_tail_rcu(&xdev->rcu_node, &xdev_rcu_list);
+	spin_unlock(&xdev_rcu_lock);
+
+	return 0;
+}
+
+static inline void xdev_list_remove(struct xdma_dev *xdev)
+{
+	mutex_lock(&xdev_mutex);
+	list_del(&xdev->list_head);
+	if (poll_mode && list_empty(&xdev_list))
+		xdma_threads_destroy();
+	mutex_unlock(&xdev_mutex);
+
+	spin_lock(&xdev_rcu_lock);
+	list_del_rcu(&xdev->rcu_node);
+	spin_unlock(&xdev_rcu_lock);
+	synchronize_rcu();
+}
+
+static struct xdma_dev *xdev_find_by_pdev(struct pci_dev *pdev)
+{
+	struct xdma_dev *xdev, *tmp;
+
+	mutex_lock(&xdev_mutex);
+	list_for_each_entry_safe(xdev, tmp, &xdev_list, list_head) {
+		if (xdev->pdev == pdev) {
+			mutex_unlock(&xdev_mutex);
+			return xdev;
+		}
+	}
+	mutex_unlock(&xdev_mutex);
+	return NULL;
+}
+
+static inline int debug_check_dev_hndl(const char *fname, struct pci_dev *pdev,
+				       void *hndl)
+{
+	struct xdma_dev *xdev;
+
+	if (!pdev)
+		return -EINVAL;
+
+	xdev = xdev_find_by_pdev(pdev);
+	if (!xdev) {
+		pr_info("%s pdev 0x%p, hndl 0x%p, NO match found!\n", fname,
+			pdev, hndl);
+		return -EINVAL;
+	}
+	if (xdev != hndl) {
+		pr_err("%s pdev 0x%p, hndl 0x%p != 0x%p!\n", fname, pdev, hndl,
+		       xdev);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#ifdef __LIBXDMA_DEBUG__
+/* SECTION: Function definitions */
+inline void __write_register(const char *fn, u32 value, void *iomem,
+			     unsigned long off)
+{
+	pr_err("%s: w reg 0x%lx(0x%p), 0x%x.\n", fn, off, iomem, value);
+	iowrite32(value, iomem);
+}
+#define write_register(v, mem, off) __write_register(__func__, v, mem, off)
+#else
+#define write_register(v, mem, off) iowrite32(v, mem)
+#endif
+
+inline u32 read_register(void *iomem)
+{
+	return ioread32(iomem);
+}
+
+static inline u32 build_u32(u32 hi, u32 lo)
+{
+	return ((hi & 0xFFFFUL) << 16) | (lo & 0xFFFFUL);
+}
+
+static inline u64 build_u64(u64 hi, u64 lo)
+{
+	return ((hi & 0xFFFFFFFULL) << 32) | (lo & 0xFFFFFFFFULL);
+}
+
+static void check_nonzero_interrupt_status(struct xdma_dev *xdev)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+	u32 w;
+
+	w = read_register(&reg->user_int_enable);
+	if (w)
+		pr_info("%s xdma%d user_int_enable = 0x%08x\n",
+			dev_name(&xdev->pdev->dev), xdev->idx, w);
+
+	w = read_register(&reg->channel_int_enable);
+	if (w)
+		pr_info("%s xdma%d channel_int_enable = 0x%08x\n",
+			dev_name(&xdev->pdev->dev), xdev->idx, w);
+
+	w = read_register(&reg->user_int_request);
+	if (w)
+		pr_info("%s xdma%d user_int_request = 0x%08x\n",
+			dev_name(&xdev->pdev->dev), xdev->idx, w);
+	w = read_register(&reg->channel_int_request);
+	if (w)
+		pr_info("%s xdma%d channel_int_request = 0x%08x\n",
+			dev_name(&xdev->pdev->dev), xdev->idx, w);
+
+	w = read_register(&reg->user_int_pending);
+	if (w)
+		pr_info("%s xdma%d user_int_pending = 0x%08x\n",
+			dev_name(&xdev->pdev->dev), xdev->idx, w);
+	w = read_register(&reg->channel_int_pending);
+	if (w)
+		pr_info("%s xdma%d channel_int_pending = 0x%08x\n",
+			dev_name(&xdev->pdev->dev), xdev->idx, w);
+}
+
+/* channel_interrupts_enable -- Enable interrupts we are interested in */
+static void channel_interrupts_enable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+
+	write_register(mask, &reg->channel_int_enable_w1s, XDMA_OFS_INT_CTRL);
+}
+
+/* channel_interrupts_disable -- Disable interrupts we not interested in */
+static void channel_interrupts_disable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+
+	write_register(mask, &reg->channel_int_enable_w1c, XDMA_OFS_INT_CTRL);
+}
+
+/* user_interrupts_enable -- Enable interrupts we are interested in */
+static void user_interrupts_enable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+
+	write_register(mask, &reg->user_int_enable_w1s, XDMA_OFS_INT_CTRL);
+}
+
+/* user_interrupts_disable -- Disable interrupts we not interested in */
+static void user_interrupts_disable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+
+	write_register(mask, &reg->user_int_enable_w1c, XDMA_OFS_INT_CTRL);
+}
+
+/* read_interrupts -- Print the interrupt controller status */
+static u32 read_interrupts(struct xdma_dev *xdev)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+	u32 lo;
+	u32 hi;
+
+	/* extra debugging; inspect complete engine set of registers */
+	hi = read_register(&reg->user_int_request);
+	dbg_io("ioread32(0x%p) returned 0x%08x (user_int_request).\n",
+	       &reg->user_int_request, hi);
+	lo = read_register(&reg->channel_int_request);
+	dbg_io("ioread32(0x%p) returned 0x%08x (channel_int_request)\n",
+	       &reg->channel_int_request, lo);
+
+	/* return interrupts: user in upper 16-bits, channel in lower 16-bits */
+	return build_u32(hi, lo);
+}
+
+static int engine_reg_dump(struct xdma_engine *engine)
+{
+	u32 w;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	w = read_register(&engine->regs->identifier);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (id).\n", engine->name,
+		&engine->regs->identifier, w);
+	w &= BLOCK_ID_MASK;
+	if (w != BLOCK_ID_HEAD) {
+		pr_err("%s: engine id missing, 0x%08x exp. & 0x%x = 0x%x\n",
+		       engine->name, w, BLOCK_ID_MASK, BLOCK_ID_HEAD);
+		return -EINVAL;
+	}
+	/* extra debugging; inspect complete engine set of registers */
+	w = read_register(&engine->regs->status);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (status).\n", engine->name,
+		&engine->regs->status, w);
+	w = read_register(&engine->regs->control);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (control)\n", engine->name,
+		&engine->regs->control, w);
+	w = read_register(&engine->sgdma_regs->first_desc_lo);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (first_desc_lo)\n", engine->name,
+		&engine->sgdma_regs->first_desc_lo, w);
+	w = read_register(&engine->sgdma_regs->first_desc_hi);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (first_desc_hi)\n", engine->name,
+		&engine->sgdma_regs->first_desc_hi, w);
+	w = read_register(&engine->sgdma_regs->first_desc_adjacent);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (first_desc_adjacent).\n",
+		engine->name, &engine->sgdma_regs->first_desc_adjacent, w);
+	w = read_register(&engine->regs->completed_desc_count);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (completed_desc_count).\n",
+		engine->name, &engine->regs->completed_desc_count, w);
+	w = read_register(&engine->regs->interrupt_enable_mask);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (interrupt_enable_mask)\n",
+		engine->name, &engine->regs->interrupt_enable_mask, w);
+
+	return 0;
+}
+
+static void engine_status_dump(struct xdma_engine *engine)
+{
+	u32 v = engine->status;
+	char buffer[256];
+	char *buf = buffer;
+	int len = 0;
+
+	len = sprintf(buf, "SG engine %s status: 0x%08x: ", engine->name, v);
+
+	if ((v & XDMA_STAT_BUSY))
+		len += sprintf(buf + len, "BUSY,");
+	if ((v & XDMA_STAT_DESC_STOPPED))
+		len += sprintf(buf + len, "DESC_STOPPED,");
+	if ((v & XDMA_STAT_DESC_COMPLETED))
+		len += sprintf(buf + len, "DESC_COMPL,");
+
+	/* common H2C & C2H */
+	if ((v & XDMA_STAT_COMMON_ERR_MASK)) {
+		if ((v & XDMA_STAT_ALIGN_MISMATCH))
+			len += sprintf(buf + len, "ALIGN_MISMATCH ");
+		if ((v & XDMA_STAT_MAGIC_STOPPED))
+			len += sprintf(buf + len, "MAGIC_STOPPED ");
+		if ((v & XDMA_STAT_INVALID_LEN))
+			len += sprintf(buf + len, "INVLIAD_LEN ");
+		if ((v & XDMA_STAT_IDLE_STOPPED))
+			len += sprintf(buf + len, "IDLE_STOPPED ");
+		buf[len - 1] = ',';
+	}
+
+	if (engine->dir == DMA_TO_DEVICE) {
+		/* H2C only */
+		if ((v & XDMA_STAT_H2C_R_ERR_MASK)) {
+			len += sprintf(buf + len, "R:");
+			if ((v & XDMA_STAT_H2C_R_UNSUPP_REQ))
+				len += sprintf(buf + len, "UNSUPP_REQ ");
+			if ((v & XDMA_STAT_H2C_R_COMPL_ABORT))
+				len += sprintf(buf + len, "COMPL_ABORT ");
+			if ((v & XDMA_STAT_H2C_R_PARITY_ERR))
+				len += sprintf(buf + len, "PARITY ");
+			if ((v & XDMA_STAT_H2C_R_HEADER_EP))
+				len += sprintf(buf + len, "HEADER_EP ");
+			if ((v & XDMA_STAT_H2C_R_UNEXP_COMPL))
+				len += sprintf(buf + len, "UNEXP_COMPL ");
+			buf[len - 1] = ',';
+		}
+
+		if ((v & XDMA_STAT_H2C_W_ERR_MASK)) {
+			len += sprintf(buf + len, "W:");
+			if ((v & XDMA_STAT_H2C_W_DECODE_ERR))
+				len += sprintf(buf + len, "DECODE_ERR ");
+			if ((v & XDMA_STAT_H2C_W_SLAVE_ERR))
+				len += sprintf(buf + len, "SLAVE_ERR ");
+			buf[len - 1] = ',';
+		}
+
+	} else {
+		/* C2H only */
+		if ((v & XDMA_STAT_C2H_R_ERR_MASK)) {
+			len += sprintf(buf + len, "R:");
+			if ((v & XDMA_STAT_C2H_R_DECODE_ERR))
+				len += sprintf(buf + len, "DECODE_ERR ");
+			if ((v & XDMA_STAT_C2H_R_SLAVE_ERR))
+				len += sprintf(buf + len, "SLAVE_ERR ");
+			buf[len - 1] = ',';
+		}
+	}
+
+	/* common H2C & C2H */
+	if ((v & XDMA_STAT_DESC_ERR_MASK)) {
+		len += sprintf(buf + len, "DESC_ERR:");
+		if ((v & XDMA_STAT_DESC_UNSUPP_REQ))
+			len += sprintf(buf + len, "UNSUPP_REQ ");
+		if ((v & XDMA_STAT_DESC_COMPL_ABORT))
+			len += sprintf(buf + len, "COMPL_ABORT ");
+		if ((v & XDMA_STAT_DESC_PARITY_ERR))
+			len += sprintf(buf + len, "PARITY ");
+		if ((v & XDMA_STAT_DESC_HEADER_EP))
+			len += sprintf(buf + len, "HEADER_EP ");
+		if ((v & XDMA_STAT_DESC_UNEXP_COMPL))
+			len += sprintf(buf + len, "UNEXP_COMPL ");
+		buf[len - 1] = ',';
+	}
+
+	buf[len - 1] = '\0';
+	pr_info("%s\n", buffer);
+}
+
+/**
+ * engine_status_read() - read status of SG DMA engine (optionally reset)
+ *
+ * Stores status in engine->status.
+ *
+ * @return error value on failure, 0 otherwise
+ */
+static int engine_status_read(struct xdma_engine *engine, bool clear, bool dump)
+{
+	int rv = 0;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (dump) {
+		rv = engine_reg_dump(engine);
+		if (rv < 0) {
+			pr_err("Failed to dump register\n");
+			return rv;
+		}
+	}
+
+	/* read status register */
+	if (clear)
+		engine->status = read_register(&engine->regs->status_rc);
+	else
+		engine->status = read_register(&engine->regs->status);
+
+	if (dump)
+		engine_status_dump(engine);
+
+	return rv;
+}
+
+/**
+ * xdma_engine_stop() - stop an SG DMA engine
+ *
+ */
+static int xdma_engine_stop(struct xdma_engine *engine)
+{
+	u32 w;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+	dbg_tfr("%s(engine=%p)\n", __func__, engine);
+
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE)
+		write_register(0, &engine->sgdma_regs->credits, 0);
+
+	w = 0;
+	w |= (u32)XDMA_CTRL_IE_DESC_ALIGN_MISMATCH;
+	w |= (u32)XDMA_CTRL_IE_MAGIC_STOPPED;
+	w |= (u32)XDMA_CTRL_IE_READ_ERROR;
+	w |= (u32)XDMA_CTRL_IE_DESC_ERROR;
+
+	if (poll_mode) {
+		w |= (u32)XDMA_CTRL_POLL_MODE_WB;
+	} else {
+		w |= (u32)XDMA_CTRL_IE_DESC_STOPPED;
+		w |= (u32)XDMA_CTRL_IE_DESC_COMPLETED;
+	}
+
+	dbg_tfr("Stopping SG DMA %s engine; writing 0x%08x to 0x%p.\n",
+		engine->name, w, (u32 *)&engine->regs->control);
+	write_register(w, &engine->regs->control,
+			(unsigned long)(&engine->regs->control) -
+				(unsigned long)(&engine->regs));
+	/* dummy read of status register to flush all previous writes */
+	dbg_tfr("%s(%s) done\n", __func__, engine->name);
+	engine->running = 0;
+	return 0;
+}
+
+static int engine_start_mode_config(struct xdma_engine *engine)
+{
+	u32 w;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	/* write control register of SG DMA engine */
+	w = (u32)XDMA_CTRL_RUN_STOP;
+	w |= (u32)XDMA_CTRL_IE_READ_ERROR;
+	w |= (u32)XDMA_CTRL_IE_DESC_ERROR;
+	w |= (u32)XDMA_CTRL_IE_DESC_ALIGN_MISMATCH;
+	w |= (u32)XDMA_CTRL_IE_MAGIC_STOPPED;
+
+	if (poll_mode) {
+		w |= (u32)XDMA_CTRL_POLL_MODE_WB;
+	} else {
+		w |= (u32)XDMA_CTRL_IE_DESC_STOPPED;
+		w |= (u32)XDMA_CTRL_IE_DESC_COMPLETED;
+	}
+
+	/* set non-incremental addressing mode */
+	if (engine->non_incr_addr)
+		w |= (u32)XDMA_CTRL_NON_INCR_ADDR;
+
+	dbg_tfr("iowrite32(0x%08x to 0x%p) (control)\n", w,
+		(void *)&engine->regs->control);
+
+	/* start the engine */
+	write_register(w, &engine->regs->control,
+		       (unsigned long)(&engine->regs->control) -
+			       (unsigned long)(&engine->regs));
+
+	/* dummy read of status register to flush all previous writes */
+	w = read_register(&engine->regs->status);
+	dbg_tfr("ioread32(0x%p) = 0x%08x (dummy read flushes writes).\n",
+		&engine->regs->status, w);
+	return 0;
+}
+
+/**
+ * xdma_get_next_adj()
+ *
+ * Get the number for adjacent descriptors to set in a descriptor, based on the
+ * remaining number of descriptors and the lower bits of the address of the
+ * next descriptor.
+ * Since the number of descriptors in a page (XDMA_PAGE_SIZE) is 128 and the
+ * maximum size of a block of adjacent descriptors is 64 (63 max adjacent
+ * descriptors for any descriptor), align the blocks of adjacent descriptors
+ * to the block size.
+ */
+static u32 xdma_get_next_adj(unsigned int remaining, u32 next_lo)
+{
+	unsigned int next_index;
+
+	dbg_desc("%s: remaining_desc %u, next_lo 0x%x\n", __func__, remaining,
+			next_lo);
+
+	if (remaining <= 1)
+		return 0;
+
+	/* shift right 5 times corresponds to a division by
+	 * sizeof(xdma_desc) = 32
+	 */
+	next_index = ((next_lo & (XDMA_PAGE_SIZE - 1)) >> 5) %
+		XDMA_MAX_ADJ_BLOCK_SIZE;
+	return min(XDMA_MAX_ADJ_BLOCK_SIZE - next_index - 1, remaining - 1);
+}
+
+/**
+ * engine_start() - start an idle engine with its first transfer on queue
+ *
+ * The engine will run and process all transfers that are queued using
+ * transfer_queue() and thus have their descriptor lists chained.
+ *
+ * During the run, new transfers will be processed if transfer_queue() has
+ * chained the descriptors before the hardware fetches the last descriptor.
+ * A transfer that was chained too late will invoke a new run of the engine
+ * initiated from the engine_service() routine.
+ *
+ * The engine must be idle and at least one transfer must be queued.
+ * This function does not take locks; the engine spinlock must already be
+ * taken.
+ *
+ */
+static struct xdma_transfer *engine_start(struct xdma_engine *engine)
+{
+	struct xdma_transfer *transfer;
+	u32 w, next_adj;
+	int rv;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return NULL;
+	}
+
+	/* engine must be idle */
+	if (engine->running) {
+		pr_info("%s engine is not in idle state to start\n",
+			engine->name);
+		return NULL;
+	}
+
+	/* engine transfer queue must not be empty */
+	if (list_empty(&engine->transfer_list)) {
+		pr_debug("%s engine transfer queue must not be empty\n",
+			 engine->name);
+		return NULL;
+	}
+	/* inspect first transfer queued on the engine */
+	transfer = list_entry(engine->transfer_list.next, struct xdma_transfer,
+			      entry);
+	if (!transfer) {
+		pr_debug("%s queued transfer must not be empty\n",
+			 engine->name);
+		return NULL;
+	}
+
+	/* engine is no longer shutdown */
+	engine->shutdown = ENGINE_SHUTDOWN_NONE;
+
+	dbg_tfr("%s(%s): transfer=0x%p.\n", __func__, engine->name, transfer);
+
+	/* Add credits for Streaming mode C2H */
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE)
+		write_register(engine->desc_used,
+					&engine->sgdma_regs->credits, 0);
+
+	/* initialize number of descriptors of dequeued transfers */
+	engine->desc_dequeued = 0;
+
+	/* write lower 32-bit of bus address of transfer first descriptor */
+	w = cpu_to_le32(PCI_DMA_L(transfer->desc_bus));
+	dbg_tfr("iowrite32(0x%08x to 0x%p) (first_desc_lo)\n", w,
+		(void *)&engine->sgdma_regs->first_desc_lo);
+	write_register(w, &engine->sgdma_regs->first_desc_lo,
+		       (unsigned long)(&engine->sgdma_regs->first_desc_lo) -
+			       (unsigned long)(&engine->sgdma_regs));
+	/* write upper 32-bit of bus address of transfer first descriptor */
+	w = cpu_to_le32(PCI_DMA_H(transfer->desc_bus));
+	dbg_tfr("iowrite32(0x%08x to 0x%p) (first_desc_hi)\n", w,
+		(void *)&engine->sgdma_regs->first_desc_hi);
+	write_register(w, &engine->sgdma_regs->first_desc_hi,
+		       (unsigned long)(&engine->sgdma_regs->first_desc_hi) -
+			       (unsigned long)(&engine->sgdma_regs));
+
+	next_adj = xdma_get_next_adj(transfer->desc_adjacent,
+				     cpu_to_le32(PCI_DMA_L(transfer->desc_bus)));
+
+	dbg_tfr("iowrite32(0x%08x to 0x%p) (first_desc_adjacent)\n", next_adj,
+		(void *)&engine->sgdma_regs->first_desc_adjacent);
+
+	write_register(
+		next_adj, &engine->sgdma_regs->first_desc_adjacent,
+		(unsigned long)(&engine->sgdma_regs->first_desc_adjacent) -
+			(unsigned long)(&engine->sgdma_regs));
+
+	dbg_tfr("ioread32(0x%p) (dummy read flushes writes).\n",
+		&engine->regs->status);
+
+	rv = engine_start_mode_config(engine);
+	if (rv < 0) {
+		pr_err("Failed to start engine mode config\n");
+		return NULL;
+	}
+
+	rv = engine_status_read(engine, 0, 0);
+	if (rv < 0) {
+		pr_err("Failed to read engine status\n");
+		return NULL;
+	}
+	dbg_tfr("%s engine 0x%p now running\n", engine->name, engine);
+	/* remember the engine is running */
+	engine->running = 1;
+	return transfer;
+}
+
+/**
+ * engine_service() - service an SG DMA engine
+ *
+ * must be called with engine->lock already acquired
+ *
+ * @engine pointer to struct xdma_engine
+ *
+ */
+static int engine_service_shutdown(struct xdma_engine *engine)
+{
+	int rv;
+	/* if the engine stopped with RUN still asserted, de-assert RUN now */
+	dbg_tfr("engine just went idle, resetting RUN_STOP.\n");
+	rv = xdma_engine_stop(engine);
+	if (rv < 0) {
+		pr_err("Failed to stop engine\n");
+		return rv;
+	}
+
+	/* awake task on engine's shutdown wait queue */
+	swake_up_one(&engine->shutdown_wq);
+	return 0;
+}
+
+static struct xdma_transfer *engine_transfer_completion(
+		struct xdma_engine *engine,
+		struct xdma_transfer *transfer)
+{
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return NULL;
+	}
+
+	if (unlikely(!transfer)) {
+		pr_info("%s: xfer empty.\n", engine->name);
+		return NULL;
+	}
+
+	/* synchronous I/O? */
+	/* awake task on transfer's wait queue */
+	swake_up_one(&transfer->wq);
+
+	/* Send completion notification for Last transfer */
+	if (transfer->cb && transfer->last_in_request)
+		transfer->cb->io_done((unsigned long)transfer->cb, 0);
+
+	return transfer;
+}
+
+static struct xdma_transfer *
+engine_service_transfer_list(struct xdma_engine *engine,
+			     struct xdma_transfer *transfer,
+			     u32 *pdesc_completed)
+{
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return NULL;
+	}
+
+	if (!pdesc_completed) {
+		pr_err("%s completed descriptors are null.\n", engine->name);
+		return NULL;
+	}
+
+	if (unlikely(!transfer)) {
+		pr_info("%s xfer empty, pdesc completed %u.\n", engine->name,
+			*pdesc_completed);
+		return NULL;
+	}
+
+	/*
+	 * iterate over all the transfers completed by the engine,
+	 * except for the last (i.e. use > instead of >=).
+	 */
+	while (transfer && (!transfer->cyclic) &&
+	       (*pdesc_completed > transfer->desc_num)) {
+		/* remove this transfer from pdesc_completed */
+		*pdesc_completed -= transfer->desc_num;
+		dbg_tfr("%s engine completed non-cyclic xfer 0x%p (%d desc)\n",
+			engine->name, transfer, transfer->desc_num);
+
+		/* remove completed transfer from list */
+		list_del(engine->transfer_list.next);
+		/* add to dequeued number of descriptors during this run */
+		engine->desc_dequeued += transfer->desc_num;
+		/* mark transfer as successfully completed */
+		transfer->state = TRANSFER_STATE_COMPLETED;
+
+		/*
+		 * Complete transfer - sets transfer to NULL if an async
+		 * transfer has completed
+		 */
+		transfer = engine_transfer_completion(engine, transfer);
+
+		/* if exists, get the next transfer on the list */
+		if (!list_empty(&engine->transfer_list)) {
+			transfer = list_entry(engine->transfer_list.next,
+					      struct xdma_transfer, entry);
+			dbg_tfr("Non-completed transfer %p\n", transfer);
+		} else {
+			/* no further transfers? */
+			transfer = NULL;
+		}
+	}
+
+	return transfer;
+}
+
+static int engine_err_handle(struct xdma_engine *engine,
+			     struct xdma_transfer *transfer, u32 desc_completed)
+{
+	u32 value;
+	int rv = 0;
+	/*
+	 * The BUSY bit is expected to be clear now but older HW has a race
+	 * condition which could cause it to be still set.  If it's set, re-read
+	 * and check again.  If it's still set, log the issue.
+	 */
+	if (engine->status & XDMA_STAT_BUSY) {
+		value = read_register(&engine->regs->status);
+		if ((value & XDMA_STAT_BUSY))
+			printk_ratelimited(KERN_INFO "%s has errors but is still BUSY\n",
+				engine->name);
+	}
+
+	printk_ratelimited(KERN_INFO "%s, s 0x%x, aborted xfer 0x%p, cmpl %d/%d\n",
+			engine->name, engine->status, transfer, desc_completed,
+			transfer->desc_num);
+
+	/* mark transfer as failed */
+	transfer->state = TRANSFER_STATE_FAILED;
+	rv = xdma_engine_stop(engine);
+	if (rv < 0)
+		pr_err("Failed to stop engine\n");
+	return rv;
+}
+
+static struct xdma_transfer *
+engine_service_final_transfer(struct xdma_engine *engine,
+			      struct xdma_transfer *transfer,
+			      u32 *pdesc_completed)
+{
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return NULL;
+	}
+
+	if (!pdesc_completed) {
+		pr_err("%s completed descriptors are null.\n", engine->name);
+		return NULL;
+	}
+
+	/* inspect the current transfer */
+	if (unlikely(!transfer)) {
+		pr_info("%s xfer empty, pdesc completed %u.\n", engine->name,
+			*pdesc_completed);
+		return NULL;
+	}
+
+	if (((engine->dir == DMA_FROM_DEVICE) &&
+	     (engine->status & XDMA_STAT_C2H_ERR_MASK)) ||
+	    ((engine->dir == DMA_TO_DEVICE) &&
+	     (engine->status & XDMA_STAT_H2C_ERR_MASK))) {
+		pr_info("engine %s, status error 0x%x.\n", engine->name,
+			engine->status);
+		engine_status_dump(engine);
+		engine_err_handle(engine, transfer, *pdesc_completed);
+		goto transfer_del;
+	}
+
+	if (engine->status & XDMA_STAT_BUSY)
+		pr_debug("engine %s is unexpectedly busy - ignoring\n",
+			 engine->name);
+
+	/* the engine stopped on current transfer? */
+	if (*pdesc_completed < transfer->desc_num) {
+		if (engine->eop_flush) {
+			/* check if eop received */
+			struct xdma_result *result = transfer->res_virt;
+			int i;
+			int max = *pdesc_completed;
+
+			for (i = 0; i < max; i++) {
+				if ((result[i].status & RX_STATUS_EOP) != 0) {
+					transfer->flags |=
+						XFER_FLAG_ST_C2H_EOP_RCVED;
+					break;
+				}
+			}
+
+			transfer->desc_cmpl += *pdesc_completed;
+			if (!(transfer->flags & XFER_FLAG_ST_C2H_EOP_RCVED))
+				return NULL;
+
+			/* mark transfer as successfully completed */
+			engine_service_shutdown(engine);
+
+			transfer->state = TRANSFER_STATE_COMPLETED;
+
+			engine->desc_dequeued += transfer->desc_cmpl;
+
+		} else {
+			transfer->state = TRANSFER_STATE_FAILED;
+			pr_info("%s, xfer 0x%p, stopped half-way, %d/%d.\n",
+				engine->name, transfer, *pdesc_completed,
+				transfer->desc_num);
+
+			/* add dequeued number of descriptors during this run */
+			engine->desc_dequeued += transfer->desc_num;
+			transfer->desc_cmpl = *pdesc_completed;
+		}
+	} else {
+		dbg_tfr("engine %s completed transfer\n", engine->name);
+		dbg_tfr("Completed transfer ID = 0x%p\n", transfer);
+		dbg_tfr("*pdesc_completed=%d, transfer->desc_num=%d",
+			*pdesc_completed, transfer->desc_num);
+
+		if (!transfer->cyclic) {
+			/*
+			 * if the engine stopped on this transfer,
+			 * it should be the last
+			 */
+			WARN_ON(*pdesc_completed > transfer->desc_num);
+		}
+		/* mark transfer as successfully completed */
+		transfer->state = TRANSFER_STATE_COMPLETED;
+		transfer->desc_cmpl = transfer->desc_num;
+		/* add dequeued number of descriptors during this run */
+		engine->desc_dequeued += transfer->desc_num;
+	}
+
+transfer_del:
+	/* remove completed transfer from list */
+	list_del(engine->transfer_list.next);
+
+	/*
+	 * Complete transfer - sets transfer to NULL if an asynchronous
+	 * transfer has completed
+	 */
+	transfer = engine_transfer_completion(engine, transfer);
+
+	return transfer;
+}
+
+static int engine_service_resume(struct xdma_engine *engine)
+{
+	struct xdma_transfer *transfer_started;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	/* engine stopped? */
+	if (!engine->running) {
+		/* in the case of shutdown, let it finish what's in the Q */
+		if (!list_empty(&engine->transfer_list)) {
+			/* (re)start engine */
+			transfer_started = engine_start(engine);
+			if (!transfer_started) {
+				pr_err("Failed to start dma engine\n");
+				return -EINVAL;
+			}
+			dbg_tfr("re-started %s engine with pending xfer 0x%p\n",
+				engine->name, transfer_started);
+			/* engine was requested to be shutdown? */
+		} else if (engine->shutdown & ENGINE_SHUTDOWN_REQUEST) {
+			engine->shutdown |= ENGINE_SHUTDOWN_IDLE;
+			/* awake task on engine's shutdown wait queue */
+			swake_up_one(&engine->shutdown_wq);
+		} else {
+			dbg_tfr("no pending transfers, %s engine stays idle.\n",
+				engine->name);
+		}
+	} else if (list_empty(&engine->transfer_list)) {
+		engine_service_shutdown(engine);
+	}
+	return 0;
+}
+
+/**
+ * engine_service() - service an SG DMA engine
+ *
+ * must be called with engine->lock already acquired
+ *
+ * @engine pointer to struct xdma_engine
+ *
+ */
+static int engine_service(struct xdma_engine *engine, int desc_writeback)
+{
+	struct xdma_transfer *transfer = NULL;
+	u32 desc_count = desc_writeback & WB_COUNT_MASK;
+	u32 err_flag = desc_writeback & WB_ERR_MASK;
+	int rv = 0;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	/* Service the engine */
+	if (!engine->running) {
+		dbg_tfr("Engine was not running!!! Clearing status\n");
+		rv = engine_status_read(engine, 1, 0);
+		if (rv < 0) {
+			pr_err("%s failed to read status\n", engine->name);
+			return rv;
+		}
+		return 0;
+	}
+
+	/*
+	 * If called by the ISR or polling detected an error, read and clear
+	 * engine status. For polled mode descriptor completion, this read is
+	 * unnecessary and is skipped to reduce latency
+	 */
+	if ((desc_count == 0) || (err_flag != 0)) {
+		rv = engine_status_read(engine, 1, 0);
+		if (rv < 0) {
+			pr_err("Failed to read engine status\n");
+			return rv;
+		}
+	}
+
+	/*
+	 * engine was running but is no longer busy, or writeback occurred,
+	 * shut down
+	 */
+	if ((engine->running && !(engine->status & XDMA_STAT_BUSY)) ||
+	    (!engine->eop_flush && desc_count != 0)) {
+		rv = engine_service_shutdown(engine);
+		if (rv < 0) {
+			pr_err("Failed to shutdown engine\n");
+			return rv;
+		}
+	}
+
+	/*
+	 * If called from the ISR, or if an error occurred, the descriptor
+	 * count will be zero.  In this scenario, read the descriptor count
+	 * from HW.  In polled mode descriptor completion, this read is
+	 * unnecessary and is skipped to reduce latency
+	 */
+	if (!desc_count)
+		desc_count = read_register(&engine->regs->completed_desc_count);
+	dbg_tfr("%s wb 0x%x, desc_count %u, err %u, dequeued %u.\n",
+		engine->name, desc_writeback, desc_count, err_flag,
+		engine->desc_dequeued);
+
+	if (!desc_count)
+		goto done;
+
+	/* transfers on queue? */
+	if (!list_empty(&engine->transfer_list)) {
+		/* pick first transfer on queue (was submitted to the engine) */
+		transfer = list_entry(engine->transfer_list.next,
+				      struct xdma_transfer, entry);
+
+		dbg_tfr("head of queue transfer 0x%p has %d descriptors\n",
+			transfer, (int)transfer->desc_num);
+
+		dbg_tfr("Engine completed %d desc, %d not yet dequeued\n",
+			(int)desc_count,
+			(int)desc_count - engine->desc_dequeued);
+	}
+
+	/* account for already dequeued transfers during this engine run */
+	desc_count -= engine->desc_dequeued;
+
+	/* Process all but the last transfer */
+	transfer = engine_service_transfer_list(engine, transfer, &desc_count);
+
+	/*
+	 * Process final transfer - includes checks of number of descriptors to
+	 * detect faulty completion
+	 */
+	transfer = engine_service_final_transfer(engine, transfer, &desc_count);
+
+	/* Restart the engine following the servicing */
+	if (!engine->eop_flush) {
+		rv = engine_service_resume(engine);
+		if (rv < 0)
+			pr_err("Failed to resume engine\n");
+	}
+
+done:
+	/* If polling detected an error, signal to the caller */
+	return err_flag ? -1 : 0;
+}
+
+/* engine_service_work */
+static void engine_service_work(struct work_struct *work)
+{
+	struct xdma_engine *engine;
+	unsigned long flags;
+	int rv;
+
+	engine = container_of(work, struct xdma_engine, work);
+	if (engine->magic != MAGIC_ENGINE) {
+		pr_err("%s has invalid magic number %lx\n", engine->name,
+		       engine->magic);
+		return;
+	}
+
+	/* lock the engine */
+	spin_lock_irqsave(&engine->lock, flags);
+
+	dbg_tfr("engine_service() for %s engine %p\n", engine->name, engine);
+	rv = engine_service(engine, 0);
+	if (rv < 0) {
+		pr_err("Failed to service engine\n");
+		goto unlock;
+	}
+	/* re-enable interrupts for this engine */
+	if (engine->xdev->msix_enabled) {
+		write_register(
+			engine->interrupt_enable_mask_value,
+			&engine->regs->interrupt_enable_mask_w1s,
+			(unsigned long)(&engine->regs
+						 ->interrupt_enable_mask_w1s) -
+				(unsigned long)(&engine->regs));
+	} else
+		channel_interrupts_enable(engine->xdev, engine->irq_bitmask);
+
+	/* unlock the engine */
+unlock:
+	spin_unlock_irqrestore(&engine->lock, flags);
+}
+
+static u32 engine_service_wb_monitor(struct xdma_engine *engine,
+				     u32 expected_wb)
+{
+	struct xdma_poll_wb *wb_data;
+	u32 desc_wb = 0;
+	u32 sched_limit = 0;
+	unsigned long timeout;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+	wb_data = (struct xdma_poll_wb *)engine->poll_mode_addr_virt;
+
+	/*
+	 * Poll the writeback location for the expected number of
+	 * descriptors / error events This loop is skipped for cyclic mode,
+	 * where the expected_desc_count passed in is zero, since it cannot be
+	 * determined before the function is called
+	 */
+
+	timeout = jiffies + (POLL_TIMEOUT_SECONDS * HZ);
+	while (expected_wb != 0) {
+		desc_wb = wb_data->completed_desc_count;
+
+		if (desc_wb)
+			wb_data->completed_desc_count = 0;
+
+		if (desc_wb & WB_ERR_MASK)
+			break;
+		else if (desc_wb >= expected_wb)
+			break;
+
+		/* prevent system from hanging in polled mode */
+		if (time_after(jiffies, timeout)) {
+			dbg_tfr("Polling timeout occurred");
+			dbg_tfr("desc_wb = 0x%08x, expected 0x%08x\n", desc_wb,
+				expected_wb);
+			if ((desc_wb & WB_COUNT_MASK) > expected_wb)
+				desc_wb = expected_wb | WB_ERR_MASK;
+
+			break;
+		}
+
+		/*
+		 * Define NUM_POLLS_PER_SCHED to limit how much time is spent
+		 * in the scheduler
+		 */
+
+		if (sched_limit != 0) {
+			if ((sched_limit % NUM_POLLS_PER_SCHED) == 0)
+				schedule();
+		}
+		sched_limit++;
+	}
+
+	return desc_wb;
+}
+
+int xdma_engine_service_poll(struct xdma_engine *engine,
+			       u32 expected_desc_count)
+{
+	u32 desc_wb = 0;
+	unsigned long flags;
+	int rv = 0;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (engine->magic != MAGIC_ENGINE) {
+		pr_err("%s has invalid magic number %lx\n", engine->name,
+		       engine->magic);
+		return -EINVAL;
+	}
+
+	/*
+	 * Poll the writeback location for the expected number of
+	 * descriptors / error events This loop is skipped for cyclic mode,
+	 * where the expected_desc_count passed in is zero, since it cannot be
+	 * determined before the function is called
+	 */
+
+	desc_wb = engine_service_wb_monitor(engine, expected_desc_count);
+	if (!desc_wb)
+		return 0;
+
+	spin_lock_irqsave(&engine->lock, flags);
+	dbg_tfr("%s service.\n", engine->name);
+	rv = engine_service(engine, desc_wb);
+	spin_unlock_irqrestore(&engine->lock, flags);
+
+	return rv;
+}
+
+/*
+ * xdma_isr() - Interrupt handler
+ *
+ * @dev_id pointer to xdma_dev
+ */
+static irqreturn_t xdma_isr(int irq, void *dev_id)
+{
+	u32 ch_irq;
+	u32 mask;
+	struct xdma_dev *xdev;
+	struct interrupt_regs *irq_regs;
+
+	dbg_irq("(irq=%d, dev 0x%p) <<<< ISR.\n", irq, dev_id);
+	if (!dev_id) {
+		pr_err("Invalid dev_id on irq line %d\n", irq);
+		return -IRQ_NONE;
+	}
+	xdev = (struct xdma_dev *)dev_id;
+
+	if (!xdev) {
+		WARN_ON(!xdev);
+		dbg_irq("%s(irq=%d) xdev=%p ??\n", __func__, irq, xdev);
+		return IRQ_NONE;
+	}
+
+	irq_regs = (struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					     XDMA_OFS_INT_CTRL);
+
+	/* read channel interrupt requests */
+	ch_irq = read_register(&irq_regs->channel_int_request);
+	dbg_irq("ch_irq = 0x%08x\n", ch_irq);
+
+	/*
+	 * disable all interrupts that fired; these are re-enabled individually
+	 * after the causing module has been fully serviced.
+	 */
+	if (ch_irq)
+		channel_interrupts_disable(xdev, ch_irq);
+	// flushes the above write
+	read_register(&irq_regs->channel_int_request);
+
+	mask = ch_irq & xdev->mask_irq_h2c;
+	if (mask) {
+		int channel = 0;
+		int max = xdev->h2c_channel_max;
+
+		/* iterate over H2C (PCIe read) */
+		for (channel = 0; channel < max && mask; channel++) {
+			struct xdma_engine *engine = &xdev->engine_h2c[channel];
+
+			/* engine present and its interrupt fired? */
+			if ((engine->irq_bitmask & mask) &&
+			    (engine->magic == MAGIC_ENGINE)) {
+				mask &= ~engine->irq_bitmask;
+				dbg_tfr("schedule_work, %s.\n", engine->name);
+				schedule_work(&engine->work);
+			}
+		}
+	}
+
+	mask = ch_irq & xdev->mask_irq_c2h;
+	if (mask) {
+		int channel = 0;
+		int max = xdev->c2h_channel_max;
+
+		/* iterate over C2H (PCIe write) */
+		for (channel = 0; channel < max && mask; channel++) {
+			struct xdma_engine *engine = &xdev->engine_c2h[channel];
+
+			/* engine present and its interrupt fired? */
+			if ((engine->irq_bitmask & mask) &&
+			    (engine->magic == MAGIC_ENGINE)) {
+				mask &= ~engine->irq_bitmask;
+				dbg_tfr("schedule_work, %s.\n", engine->name);
+				schedule_work(&engine->work);
+			}
+		}
+	}
+
+	xdev->irq_count++;
+	return IRQ_HANDLED;
+}
+
+/*
+ * xdma_channel_irq() - Interrupt handler for channel interrupts in MSI-X mode
+ *
+ * @dev_id pointer to xdma_dev
+ */
+static irqreturn_t xdma_channel_irq(int irq, void *dev_id)
+{
+	struct xdma_dev *xdev;
+	struct xdma_engine *engine;
+	struct interrupt_regs *irq_regs;
+
+	dbg_irq("(irq=%d) <<<< INTERRUPT service ROUTINE\n", irq);
+	if (!dev_id) {
+		pr_err("Invalid dev_id on irq line %d\n", irq);
+		return IRQ_NONE;
+	}
+
+	engine = (struct xdma_engine *)dev_id;
+	xdev = engine->xdev;
+
+	if (!xdev) {
+		WARN_ON(!xdev);
+		dbg_irq("%s(irq=%d) xdev=%p ??\n", __func__, irq, xdev);
+		return IRQ_NONE;
+	}
+
+	irq_regs = (struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					     XDMA_OFS_INT_CTRL);
+
+	/* Disable the interrupt for this engine */
+	write_register(
+		engine->interrupt_enable_mask_value,
+		&engine->regs->interrupt_enable_mask_w1c,
+		(unsigned long)(&engine->regs->interrupt_enable_mask_w1c) -
+			(unsigned long)(&engine->regs));
+	/* Dummy read to flush the above write */
+	read_register(&irq_regs->channel_int_pending);
+	/* Schedule the bottom half */
+	schedule_work(&engine->work);
+
+	/*
+	 * RTO - need to protect access here if multiple MSI-X are used for
+	 * user interrupts
+	 */
+	xdev->irq_count++;
+	return IRQ_HANDLED;
+}
+
+/*
+ * Unmap the BAR regions that had been mapped earlier using map_bars()
+ */
+static void unmap_bars(struct xdma_dev *xdev, struct pci_dev *dev)
+{
+	int i;
+
+	for (i = 0; i < XDMA_BAR_NUM; i++) {
+		/* is this BAR mapped? */
+		if (xdev->bar[i]) {
+			/* unmap BAR */
+			pci_iounmap(dev, xdev->bar[i]);
+			/* mark as unmapped */
+			xdev->bar[i] = NULL;
+		}
+	}
+}
+
+static int map_single_bar(struct xdma_dev *xdev, struct pci_dev *dev, int idx)
+{
+	resource_size_t bar_start;
+	resource_size_t bar_len;
+	resource_size_t map_len;
+
+	bar_start = pci_resource_start(dev, idx);
+	bar_len = pci_resource_len(dev, idx);
+	map_len = bar_len;
+
+	xdev->bar[idx] = NULL;
+
+	/* do not map BARs with length 0. Note that start MAY be 0! */
+	if (!bar_len) {
+		//pr_info("BAR #%d is not present - skipping\n", idx);
+		return 0;
+	}
+
+	/* BAR size exceeds maximum desired mapping? */
+	if (bar_len > INT_MAX) {
+		pr_info("Limit BAR %d mapping from %llu to %d bytes\n", idx,
+			(u64)bar_len, INT_MAX);
+		map_len = (resource_size_t)INT_MAX;
+	}
+	/*
+	 * map the full device memory or IO region into kernel virtual
+	 * address space
+	 */
+	dbg_init("BAR%d: %llu bytes to be mapped.\n", idx, (u64)map_len);
+	xdev->bar[idx] = pci_iomap(dev, idx, map_len);
+
+	if (!xdev->bar[idx]) {
+		pr_info("Could not map BAR %d.\n", idx);
+		return -1;
+	}
+
+	pr_info("BAR%d at 0x%llx mapped at 0x%p, length=%llu(/%llu)\n", idx,
+		(u64)bar_start, xdev->bar[idx], (u64)map_len, (u64)bar_len);
+
+	return (int)map_len;
+}
+
+static int is_config_bar(struct xdma_dev *xdev, int idx)
+{
+	u32 irq_id = 0;
+	u32 cfg_id = 0;
+	int flag = 0;
+	u32 mask = 0xffff0000; /* Compare only XDMA ID's not Version number */
+	struct interrupt_regs *irq_regs =
+		(struct interrupt_regs *)(xdev->bar[idx] + XDMA_OFS_INT_CTRL);
+	struct config_regs *cfg_regs =
+		(struct config_regs *)(xdev->bar[idx] + XDMA_OFS_CONFIG);
+
+	irq_id = read_register(&irq_regs->identifier);
+	cfg_id = read_register(&cfg_regs->identifier);
+
+	if (((irq_id & mask) == IRQ_BLOCK_ID) &&
+	    ((cfg_id & mask) == CONFIG_BLOCK_ID)) {
+		dbg_init("BAR %d is the XDMA config BAR\n", idx);
+		flag = 1;
+	} else {
+		dbg_init("BAR %d is NOT the XDMA config BAR: 0x%x, 0x%x.\n",
+			 idx, irq_id, cfg_id);
+		flag = 0;
+	}
+
+	return flag;
+}
+
+#ifndef XDMA_CONFIG_BAR_NUM
+static int identify_bars(struct xdma_dev *xdev, int *bar_id_list, int num_bars,
+			 int config_bar_pos)
+{
+	/*
+	 * The following logic identifies which BARs contain what functionality
+	 * based on the position of the XDMA config BAR and the number of BARs
+	 * detected. The rules are that the user logic and bypass logic BARs
+	 * are optional.  When both are present, the XDMA config BAR will be the
+	 * 2nd BAR detected (config_bar_pos = 1), with the user logic being
+	 * detected first and the bypass being detected last. When one is
+	 * omitted, the type of BAR present can be identified by whether the
+	 * XDMA config BAR is detected first or last.  When both are omitted,
+	 * only the XDMA config BAR is present.  This somewhat convoluted
+	 * approach is used instead of relying on BAR numbers in order to work
+	 * correctly with both 32-bit and 64-bit BARs.
+	 */
+
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	if (!bar_id_list) {
+		pr_err("Invalid bar id list.\n");
+		return -EINVAL;
+	}
+
+	dbg_init("xdev 0x%p, bars %d, config at %d.\n", xdev, num_bars,
+		 config_bar_pos);
+
+	switch (num_bars) {
+	case 1:
+		/* Only one BAR present - no extra work necessary */
+		break;
+
+	case 2:
+		if (config_bar_pos == 0) {
+			xdev->bypass_bar_idx = bar_id_list[1];
+		} else if (config_bar_pos == 1) {
+			xdev->user_bar_idx = bar_id_list[0];
+		} else {
+			pr_info("2, XDMA config BAR unexpected %d.\n",
+				config_bar_pos);
+		}
+		break;
+
+	case 3:
+	case 4:
+		if ((config_bar_pos == 1) || (config_bar_pos == 2)) {
+			/* user bar at bar #0 */
+			xdev->user_bar_idx = bar_id_list[0];
+			/* bypass bar at the last bar */
+			xdev->bypass_bar_idx = bar_id_list[num_bars - 1];
+		} else {
+			pr_info("3/4, XDMA config BAR unexpected %d.\n",
+				config_bar_pos);
+		}
+		break;
+
+	default:
+		/* Should not occur - warn user but safe to continue */
+		pr_info("Unexpected # BARs (%d), XDMA config BAR only.\n",
+			num_bars);
+		break;
+	}
+	pr_info("%d BARs: config %d, user %d, bypass %d.\n", num_bars,
+		config_bar_pos, xdev->user_bar_idx, xdev->bypass_bar_idx);
+	return 0;
+}
+#endif
+
+/* map_bars() -- map device regions into kernel virtual address space
+ *
+ * Map the device memory regions into kernel virtual address space after
+ * verifying their sizes respect the minimum sizes needed
+ */
+static int map_bars(struct xdma_dev *xdev, struct pci_dev *dev)
+{
+	int rv;
+
+#ifdef XDMA_CONFIG_BAR_NUM
+	rv = map_single_bar(xdev, dev, XDMA_CONFIG_BAR_NUM);
+	if (rv <= 0) {
+		pr_info("%s, map config bar %d failed, %d.\n",
+			dev_name(&dev->dev), XDMA_CONFIG_BAR_NUM, rv);
+		return -EINVAL;
+	}
+
+	if (is_config_bar(xdev, XDMA_CONFIG_BAR_NUM) == 0) {
+		pr_info("%s, unable to identify config bar %d.\n",
+			dev_name(&dev->dev), XDMA_CONFIG_BAR_NUM);
+		return -EINVAL;
+	}
+	xdev->config_bar_idx = XDMA_CONFIG_BAR_NUM;
+
+	return 0;
+#else
+	int i;
+	int bar_id_list[XDMA_BAR_NUM];
+	int bar_id_idx = 0;
+	int config_bar_pos = 0;
+
+	/* iterate through all the BARs */
+	for (i = 0; i < XDMA_BAR_NUM; i++) {
+		int bar_len;
+
+		bar_len = map_single_bar(xdev, dev, i);
+		if (bar_len == 0) {
+			continue;
+		} else if (bar_len < 0) {
+			rv = -EINVAL;
+			goto fail;
+		}
+
+		/* Try to identify BAR as XDMA control BAR */
+		if ((bar_len >= XDMA_BAR_SIZE) && (xdev->config_bar_idx < 0)) {
+			if (is_config_bar(xdev, i)) {
+				xdev->config_bar_idx = i;
+				config_bar_pos = bar_id_idx;
+				pr_info("config bar %d, pos %d.\n",
+					xdev->config_bar_idx, config_bar_pos);
+			}
+		}
+
+		bar_id_list[bar_id_idx] = i;
+		bar_id_idx++;
+	}
+
+	/* The XDMA config BAR must always be present */
+	if (xdev->config_bar_idx < 0) {
+		pr_info("Failed to detect XDMA config BAR\n");
+		rv = -EINVAL;
+		goto fail;
+	}
+
+	rv = identify_bars(xdev, bar_id_list, bar_id_idx, config_bar_pos);
+	if (rv < 0) {
+		pr_err("Failed to identify bars\n");
+		return rv;
+	}
+
+	/* successfully mapped all required BAR regions */
+	return 0;
+
+fail:
+	/* unwind; unmap any BARs that we did map */
+	unmap_bars(xdev, dev);
+	return rv;
+#endif
+}
+
+/*
+ * MSI-X interrupt:
+ *	<h2c+c2h channel_max> vectors, followed by <user_max> vectors
+ */
+
+/*
+ * code to detect if MSI/MSI-X capability exists is derived
+ * from linux/pci/msi.c - pci_msi_check_device
+ */
+
+#ifndef arch_msi_check_device
+static int arch_msi_check_device(struct pci_dev *dev, int nvec, int type)
+{
+	return 0;
+}
+#endif
+
+/* type = PCI_CAP_ID_MSI or PCI_CAP_ID_MSIX */
+static int msi_msix_capable(struct pci_dev *dev, int type)
+{
+	struct pci_bus *bus;
+	int ret;
+
+	if (!dev || dev->no_msi)
+		return 0;
+
+	for (bus = dev->bus; bus; bus = bus->parent)
+		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
+			return 0;
+
+	ret = arch_msi_check_device(dev, 1, type);
+	if (ret)
+		return 0;
+
+	if (!pci_find_capability(dev, type))
+		return 0;
+
+	return 1;
+}
+
+static void disable_msi_msix(struct xdma_dev *xdev, struct pci_dev *pdev)
+{
+	if (xdev->msix_enabled) {
+		pci_disable_msix(pdev);
+		xdev->msix_enabled = 0;
+	} else if (xdev->msi_enabled) {
+		pci_disable_msi(pdev);
+		xdev->msi_enabled = 0;
+	}
+}
+
+static int enable_msi_msix(struct xdma_dev *xdev, struct pci_dev *pdev)
+{
+	int rv;
+
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	if (!pdev) {
+		pr_err("Invalid pdev\n");
+		return -EINVAL;
+	}
+
+	if ((interrupt_mode == 2 || !interrupt_mode)
+	    && msi_msix_capable(pdev, PCI_CAP_ID_MSIX)) {
+		int req_nvec = xdev->c2h_channel_max + xdev->h2c_channel_max +
+			       xdev->user_max;
+
+		dbg_init("Enabling MSI-X\n");
+		rv = pci_alloc_irq_vectors(pdev, req_nvec, req_nvec, PCI_IRQ_MSIX);
+		if (rv < 0) {
+			pr_err("Couldn't enable MSI-X mode: %d\n", rv);
+			return rv;
+		}
+		xdev->msix_enabled = 1;
+
+	} else if ((interrupt_mode == 1 || !interrupt_mode)
+		    && msi_msix_capable(pdev, PCI_CAP_ID_MSI)) {
+		int req_nvec = xdev->user_max + 1;
+
+		dbg_init("Enabling MSI\n");
+		rv = pci_alloc_irq_vectors(pdev, req_nvec, req_nvec, PCI_IRQ_MSI);
+		if (rv < 0) {
+			pr_err("Couldn't enable MSI mode: %d\n", rv);
+			return rv;
+		}
+		xdev->msi_enabled = 1;
+
+	} else {
+		pr_err("MSI/MSI-X not detected\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void pci_check_intr_pend(struct pci_dev *pdev)
+{
+	u16 v;
+
+	pci_read_config_word(pdev, PCI_STATUS, &v);
+	if (v & PCI_STATUS_INTERRUPT) {
+		pr_info("%s PCI STATUS Interrupt pending 0x%x.\n",
+			dev_name(&pdev->dev), v);
+		pci_write_config_word(pdev, PCI_STATUS, PCI_STATUS_INTERRUPT);
+	}
+}
+
+static void pci_keep_intx_enabled(struct pci_dev *pdev)
+{
+	/* workaround to a h/w bug:
+	 * when msix/msi become unavaile, default to legacy.
+	 * However the legacy enable was not checked.
+	 * If the legacy was disabled, no ack then everything stuck
+	 */
+	u16 pcmd, pcmd_new;
+
+	pci_read_config_word(pdev, PCI_COMMAND, &pcmd);
+	pcmd_new = pcmd & ~PCI_COMMAND_INTX_DISABLE;
+	if (pcmd_new != pcmd) {
+		pr_info("%s: clear INTX_DISABLE, 0x%x -> 0x%x.\n",
+			dev_name(&pdev->dev), pcmd, pcmd_new);
+		pci_write_config_word(pdev, PCI_COMMAND, pcmd_new);
+	}
+}
+
+static void prog_irq_user(struct xdma_dev *xdev, bool clear)
+{
+	/* user */
+	struct interrupt_regs *int_regs =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+	u32 i = xdev->msix_enabled
+	  ? xdev->c2h_channel_max + xdev->h2c_channel_max : 1;
+	u32 max = i + xdev->user_max;
+	int j;
+
+	for (j = 0; i < max; j++) {
+		u32 val = 0;
+		int k;
+		int shift = 0;
+
+		if (clear)
+			i += 4;
+		else
+			for (k = 0; k < 4 && i < max; i++, k++, shift += 8)
+				val |= (i & 0x1f) << shift;
+
+		write_register(
+			val, &int_regs->user_msi_vector[j],
+			XDMA_OFS_INT_CTRL +
+				((unsigned long)&int_regs->user_msi_vector[j] -
+				 (unsigned long)int_regs));
+
+		dbg_init("vector %d, 0x%x.\n", j, val);
+	}
+}
+
+static void prog_irq_msix_channel(struct xdma_dev *xdev, bool clear)
+{
+	struct interrupt_regs *int_regs =
+		(struct interrupt_regs *)(xdev->bar[xdev->config_bar_idx] +
+					  XDMA_OFS_INT_CTRL);
+	u32 max = xdev->c2h_channel_max + xdev->h2c_channel_max;
+	u32 i;
+	int j;
+
+	/* engine */
+	for (i = 0, j = 0; i < max; j++) {
+		u32 val = 0;
+		int k;
+		int shift = 0;
+
+		if (clear)
+			i += 4;
+		else
+			for (k = 0; k < 4 && i < max; i++, k++, shift += 8)
+				val |= (i & 0x1f) << shift;
+
+		write_register(val, &int_regs->channel_msi_vector[j],
+			       XDMA_OFS_INT_CTRL +
+				       ((unsigned long)&int_regs
+						->channel_msi_vector[j] -
+					(unsigned long)int_regs));
+		dbg_init("vector %d, 0x%x.\n", j, val);
+	}
+}
+
+static void irq_msix_channel_teardown(struct xdma_dev *xdev)
+{
+	struct xdma_engine *engine;
+	int j = 0;
+	int i = 0;
+
+	if (!xdev->msix_enabled)
+		return;
+
+	prog_irq_msix_channel(xdev, 1);
+
+	engine = xdev->engine_h2c;
+	for (i = 0; i < xdev->h2c_channel_max; i++, j++, engine++) {
+		if (!engine->msix_irq_line)
+			break;
+		dbg_sg("Release IRQ#%d for engine %p\n", engine->msix_irq_line,
+		       engine);
+		free_irq(engine->msix_irq_line, engine);
+	}
+
+	engine = xdev->engine_c2h;
+	for (i = 0; i < xdev->c2h_channel_max; i++, j++, engine++) {
+		if (!engine->msix_irq_line)
+			break;
+		dbg_sg("Release IRQ#%d for engine %p\n", engine->msix_irq_line,
+		       engine);
+		free_irq(engine->msix_irq_line, engine);
+	}
+}
+
+static int irq_msix_channel_setup(struct xdma_dev *xdev)
+{
+	int i;
+	int j;
+	int rv = 0;
+	u32 vector;
+	struct xdma_engine *engine;
+
+	if (!xdev) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (!xdev->msix_enabled)
+		return 0;
+
+	j = xdev->h2c_channel_max;
+	engine = xdev->engine_h2c;
+	for (i = 0; i < xdev->h2c_channel_max; i++, engine++) {
+		vector = pci_irq_vector(xdev->pdev, i);
+		rv = request_irq(vector, xdma_channel_irq, 0, xdev->mod_name,
+				 engine);
+		if (rv) {
+			pr_info("requesti irq#%d failed %d, engine %s.\n",
+				vector, rv, engine->name);
+			return rv;
+		}
+		pr_info("engine %s, irq#%d.\n", engine->name, vector);
+		engine->msix_irq_line = vector;
+	}
+
+	engine = xdev->engine_c2h;
+	for (i = 0; i < xdev->c2h_channel_max; i++, j++, engine++) {
+		vector = pci_irq_vector(xdev->pdev, j);
+		rv = request_irq(vector, xdma_channel_irq, 0, xdev->mod_name,
+				 engine);
+		if (rv) {
+			pr_info("requesti irq#%d failed %d, engine %s.\n",
+				vector, rv, engine->name);
+			return rv;
+		}
+		pr_info("engine %s, irq#%d.\n", engine->name, vector);
+		engine->msix_irq_line = vector;
+	}
+
+	return 0;
+}
+
+static int irq_msi_channel_setup(struct xdma_dev *xdev)
+{
+	int rv;
+
+	xdev->irq_line = (int)xdev->pdev->irq;
+	rv = request_irq(xdev->pdev->irq, xdma_isr, 0, xdev->mod_name, xdev);
+	if (rv) {
+		pr_err("engine couldn't use IRQ#%d, %d\n", xdev->pdev->irq, rv);
+		return rv;
+	}
+
+	dbg_init("engine using IRQ#%d with 0x%p\n", xdev->pdev->irq, xdev);
+
+	return 0;
+}
+
+static void irq_teardown(struct xdma_dev *xdev)
+{
+	if (xdev->msix_enabled) {
+		irq_msix_channel_teardown(xdev);
+	} else if (xdev->irq_line != -1) {
+		dbg_init("Releasing IRQ#%d\n", xdev->irq_line);
+		free_irq(xdev->irq_line, xdev);
+	}
+
+	if (xdev->msi_enabled || xdev->msix_enabled)
+		prog_irq_user(xdev, 1);
+}
+
+static int irq_setup(struct xdma_dev *xdev, struct pci_dev *pdev)
+{
+	int rv;
+
+	pci_keep_intx_enabled(pdev);
+
+	if (xdev->msix_enabled) {
+		rv = irq_msix_channel_setup(xdev);
+		if (rv)
+			return rv;
+		prog_irq_msix_channel(xdev, 0);
+	} else if (xdev->msi_enabled) {
+		rv = irq_msi_channel_setup(xdev);
+		if (rv)
+			return rv;
+	} else
+		return -EINVAL;
+
+	prog_irq_user(xdev, 0);
+
+	return 0;
+}
+
+#ifdef __LIBXDMA_DEBUG__
+static void dump_desc(struct xdma_desc *desc_virt)
+{
+	int j;
+	u32 *p = (u32 *)desc_virt;
+	static char *const field_name[] = { "magic|extra_adjacent|control",
+					    "bytes",
+					    "src_addr_lo",
+					    "src_addr_hi",
+					    "dst_addr_lo",
+					    "dst_addr_hi",
+					    "next_addr",
+					    "next_addr_pad" };
+	char *dummy;
+
+	/* remove warning about unused variable when debug printing is off */
+	dummy = field_name[0];
+
+	for (j = 0; j < 8; j += 1) {
+		pr_info("0x%08lx/0x%02lx: 0x%08x 0x%08x %s\n", (uintptr_t)p,
+			(uintptr_t)p & 15, (int)*p, le32_to_cpu(*p),
+			field_name[j]);
+		p++;
+	}
+	pr_info("\n");
+}
+
+static void transfer_dump(struct xdma_transfer *transfer)
+{
+	int i;
+	struct xdma_desc *desc_virt = transfer->desc_virt;
+
+	pr_info("xfer 0x%p, state 0x%x, f 0x%x, dir %d, len %u, last %d.\n",
+		transfer, transfer->state, transfer->flags, transfer->dir,
+		transfer->len, transfer->last_in_request);
+
+	pr_info("transfer 0x%p, desc %d, bus 0x%llx, adj %d.\n", transfer,
+		transfer->desc_num, (u64)transfer->desc_bus,
+		transfer->desc_adjacent);
+	for (i = 0; i < transfer->desc_num; i += 1)
+		dump_desc(desc_virt + i);
+}
+#endif /* __LIBXDMA_DEBUG__ */
+
+/* transfer_desc_init() - Chains the descriptors as a singly-linked list
+ *
+ * Each descriptor's next * pointer specifies the bus address
+ * of the next descriptor.
+ * Terminates the last descriptor to form a singly-linked list
+ *
+ * @transfer Pointer to SG DMA transfers
+ * @count Number of descriptors allocated in continuous PCI bus addressable
+ * memory
+ *
+ * @return 0 on success, EINVAL on failure
+ */
+static int transfer_desc_init(struct xdma_transfer *transfer, int count)
+{
+	struct xdma_desc *desc_virt = transfer->desc_virt;
+	dma_addr_t desc_bus = transfer->desc_bus;
+	int i;
+
+	if (count > XDMA_TRANSFER_MAX_DESC) {
+		pr_err("Engine cannot transfer more than %d descriptors\n",
+		       XDMA_TRANSFER_MAX_DESC);
+		return -EINVAL;
+	}
+
+	/* create singly-linked list for SG DMA controller */
+	for (i = 0; i < count - 1; i++) {
+		/* increment bus address to next in array */
+		desc_bus += sizeof(struct xdma_desc);
+
+		/* singly-linked list uses bus addresses */
+		desc_virt[i].next_lo = cpu_to_le32(PCI_DMA_L(desc_bus));
+		desc_virt[i].next_hi = cpu_to_le32(PCI_DMA_H(desc_bus));
+		desc_virt[i].bytes = cpu_to_le32(0);
+
+		desc_virt[i].control = cpu_to_le32(DESC_MAGIC);
+	}
+	/* { i = number - 1 } */
+	/* zero the last descriptor next pointer */
+	desc_virt[i].next_lo = cpu_to_le32(0);
+	desc_virt[i].next_hi = cpu_to_le32(0);
+	desc_virt[i].bytes = cpu_to_le32(0);
+	desc_virt[i].control = cpu_to_le32(DESC_MAGIC);
+
+	return 0;
+}
+
+/* xdma_desc_adjacent -- Set how many descriptors are adjacent to this one */
+static void xdma_desc_adjacent(struct xdma_desc *desc, u32 next_adjacent)
+{
+	/* remember reserved and control bits */
+	u32 control = le32_to_cpu(desc->control) & 0x0000f0ffUL;
+	/* merge adjacent and control field */
+	control |= 0xAD4B0000UL | (next_adjacent << 8);
+	/* write control and next_adjacent */
+	desc->control = cpu_to_le32(control);
+}
+
+/* xdma_desc_control -- Set complete control field of a descriptor. */
+static int xdma_desc_control_set(struct xdma_desc *first, u32 control_field)
+{
+	/* remember magic and adjacent number */
+	u32 control = le32_to_cpu(first->control) & ~(LS_BYTE_MASK);
+
+	if (control_field & ~(LS_BYTE_MASK)) {
+		pr_err("Invalid control field\n");
+		return -EINVAL;
+	}
+	/* merge adjacent and control field */
+	control |= control_field;
+	/* write control and next_adjacent */
+	first->control = cpu_to_le32(control);
+	return 0;
+}
+
+/* xdma_desc_done - recycle cache-coherent linked list of descriptors.
+ *
+ * @dev Pointer to pci_dev
+ * @number Number of descriptors to be allocated
+ * @desc_virt Pointer to (i.e. virtual address of) first descriptor in list
+ * @desc_bus Bus address of first descriptor in list
+ */
+static inline void xdma_desc_done(struct xdma_desc *desc_virt, int count)
+{
+	memset(desc_virt, 0, count * sizeof(struct xdma_desc));
+}
+
+/* xdma_desc() - Fill a descriptor with the transfer details
+ *
+ * @desc pointer to descriptor to be filled
+ * @addr root complex address
+ * @ep_addr end point address
+ * @len number of bytes, must be a (non-negative) multiple of 4.
+ * @dir, dma direction
+ * is the end point address. If zero, vice versa.
+ *
+ * Does not modify the next pointer
+ */
+static void xdma_desc_set(struct xdma_desc *desc, dma_addr_t rc_bus_addr,
+			  u64 ep_addr, int len, int dir)
+{
+	/* transfer length */
+	desc->bytes = cpu_to_le32(len);
+	if (dir == DMA_TO_DEVICE) {
+		/* read from root complex memory (source address) */
+		desc->src_addr_lo = cpu_to_le32(PCI_DMA_L(rc_bus_addr));
+		desc->src_addr_hi = cpu_to_le32(PCI_DMA_H(rc_bus_addr));
+		/* write to end point address (destination address) */
+		desc->dst_addr_lo = cpu_to_le32(PCI_DMA_L(ep_addr));
+		desc->dst_addr_hi = cpu_to_le32(PCI_DMA_H(ep_addr));
+	} else {
+		/* read from end point address (source address) */
+		desc->src_addr_lo = cpu_to_le32(PCI_DMA_L(ep_addr));
+		desc->src_addr_hi = cpu_to_le32(PCI_DMA_H(ep_addr));
+		/* write to root complex memory (destination address) */
+		desc->dst_addr_lo = cpu_to_le32(PCI_DMA_L(rc_bus_addr));
+		desc->dst_addr_hi = cpu_to_le32(PCI_DMA_H(rc_bus_addr));
+	}
+}
+
+/*
+ * should hold the engine->lock;
+ */
+static int transfer_abort(struct xdma_engine *engine,
+			  struct xdma_transfer *transfer)
+{
+	struct xdma_transfer *head;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (!transfer) {
+		pr_err("Invalid DMA transfer\n");
+		return -EINVAL;
+	}
+
+	if (transfer->desc_num == 0) {
+		pr_err("%s void descriptors in the transfer list\n",
+		       engine->name);
+		return -EINVAL;
+	}
+
+	pr_info("abort transfer 0x%p, desc %d, engine desc queued %d.\n",
+		transfer, transfer->desc_num, engine->desc_dequeued);
+
+	head = list_entry(engine->transfer_list.next, struct xdma_transfer,
+			  entry);
+	if (head == transfer)
+		list_del(engine->transfer_list.next);
+	else
+		pr_info("engine %s, transfer 0x%p NOT found, 0x%p.\n",
+			engine->name, transfer, head);
+
+	if (transfer->state == TRANSFER_STATE_SUBMITTED)
+		transfer->state = TRANSFER_STATE_ABORTED;
+	return 0;
+}
+
+/* transfer_queue() - Queue a DMA transfer on the engine
+ *
+ * @engine DMA engine doing the transfer
+ * @transfer DMA transfer submitted to the engine
+ *
+ * Takes and releases the engine spinlock
+ */
+static int transfer_queue(struct xdma_engine *engine,
+			  struct xdma_transfer *transfer)
+{
+	int rv = 0;
+	struct xdma_transfer *transfer_started;
+	struct xdma_dev *xdev;
+	unsigned long flags;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (!engine->xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	if (!transfer) {
+		pr_err("%s Invalid DMA transfer\n", engine->name);
+		return -EINVAL;
+	}
+
+	if (transfer->desc_num == 0) {
+		pr_err("%s void descriptors in the transfer list\n",
+		       engine->name);
+		return -EINVAL;
+	}
+	dbg_tfr("%s (transfer=0x%p).\n", __func__, transfer);
+
+	xdev = engine->xdev;
+	if (xdma_device_flag_check(xdev, XDEV_FLAG_OFFLINE)) {
+		pr_info("dev 0x%p offline, transfer 0x%p not queued.\n", xdev,
+			transfer);
+		return -EBUSY;
+	}
+
+	/* lock the engine state */
+	spin_lock_irqsave(&engine->lock, flags);
+
+	engine->prev_cpu = get_cpu();
+	put_cpu();
+
+	/* engine is being shutdown; do not accept new transfers */
+	if (engine->shutdown & ENGINE_SHUTDOWN_REQUEST) {
+		pr_info("engine %s offline, transfer 0x%p not queued.\n",
+			engine->name, transfer);
+		rv = -EBUSY;
+		goto shutdown;
+	}
+
+	/* mark the transfer as submitted */
+	transfer->state = TRANSFER_STATE_SUBMITTED;
+	/* add transfer to the tail of the engine transfer queue */
+	list_add_tail(&transfer->entry, &engine->transfer_list);
+
+	/* engine is idle? */
+	if (!engine->running) {
+		/* start engine */
+		dbg_tfr("%s(): starting %s engine.\n", __func__, engine->name);
+		transfer_started = engine_start(engine);
+		if (!transfer_started) {
+			pr_err("Failed to start dma engine\n");
+			goto shutdown;
+		}
+		dbg_tfr("transfer=0x%p started %s engine with transfer 0x%p.\n",
+			transfer, engine->name, transfer_started);
+	} else {
+		dbg_tfr("transfer=0x%p queued, with %s engine running.\n",
+			transfer, engine->name);
+	}
+
+shutdown:
+	/* unlock the engine state */
+	dbg_tfr("engine->running = %d\n", engine->running);
+	spin_unlock_irqrestore(&engine->lock, flags);
+	return rv;
+}
+
+static void engine_alignments(struct xdma_engine *engine)
+{
+	u32 w;
+	u32 align_bytes;
+	u32 granularity_bytes;
+	u32 address_bits;
+
+	w = read_register(&engine->regs->alignments);
+	dbg_init("engine %p name %s alignments=0x%08x\n", engine, engine->name,
+		 (int)w);
+
+	align_bytes = (w & 0x00ff0000U) >> 16;
+	granularity_bytes = (w & 0x0000ff00U) >> 8;
+	address_bits = (w & 0x000000ffU);
+
+	dbg_init("align_bytes = %d\n", align_bytes);
+	dbg_init("granularity_bytes = %d\n", granularity_bytes);
+	dbg_init("address_bits = %d\n", address_bits);
+
+	if (w) {
+		engine->addr_align = align_bytes;
+		engine->len_granularity = granularity_bytes;
+		engine->addr_bits = address_bits;
+	} else {
+		/* Some default values if alignments are unspecified */
+		engine->addr_align = 1;
+		engine->len_granularity = 1;
+		engine->addr_bits = 64;
+	}
+}
+
+static void engine_free_resource(struct xdma_engine *engine)
+{
+	struct xdma_dev *xdev = engine->xdev;
+
+	/* Release memory use for descriptor writebacks */
+	if (engine->poll_mode_addr_virt) {
+		dbg_sg("Releasing memory for descriptor writeback\n");
+		dma_free_coherent(&xdev->pdev->dev, sizeof(struct xdma_poll_wb),
+				  engine->poll_mode_addr_virt,
+				  engine->poll_mode_bus);
+		dbg_sg("Released memory for descriptor writeback\n");
+		engine->poll_mode_addr_virt = NULL;
+	}
+
+	if (engine->desc) {
+		dbg_init("device %s, engine %s pre-alloc desc 0x%p,0x%llx.\n",
+			 dev_name(&xdev->pdev->dev), engine->name, engine->desc,
+			 engine->desc_bus);
+		dma_free_coherent(&xdev->pdev->dev,
+				  XDMA_TRANSFER_MAX_DESC *
+					  sizeof(struct xdma_desc),
+				  engine->desc, engine->desc_bus);
+		engine->desc = NULL;
+	}
+
+	if (engine->cyclic_result) {
+		dma_free_coherent(
+			&xdev->pdev->dev,
+			XDMA_TRANSFER_MAX_DESC * sizeof(struct xdma_result),
+			engine->cyclic_result, engine->cyclic_result_bus);
+		engine->cyclic_result = NULL;
+	}
+}
+
+static int engine_destroy(struct xdma_dev *xdev, struct xdma_engine *engine)
+{
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	dbg_sg("Shutting down engine %s%d", engine->name, engine->channel);
+
+	/* Disable interrupts to stop processing new events during shutdown */
+	write_register(0x0, &engine->regs->interrupt_enable_mask,
+		       (unsigned long)(&engine->regs->interrupt_enable_mask) -
+			       (unsigned long)(&engine->regs));
+
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE) {
+		u32 reg_value = (0x1 << engine->channel) << 16;
+		struct sgdma_common_regs *reg =
+			(struct sgdma_common_regs
+				 *)(xdev->bar[xdev->config_bar_idx] +
+				    (0x6 * TARGET_SPACING));
+		write_register(reg_value, &reg->credit_mode_enable_w1c, 0);
+	}
+
+	if (poll_mode)
+		xdma_thread_remove_work(engine);
+
+	/* Release memory use for descriptor writebacks */
+	engine_free_resource(engine);
+
+	memset(engine, 0, sizeof(struct xdma_engine));
+	/* Decrement the number of engines available */
+	xdev->engines_num--;
+	return 0;
+}
+
+static int engine_writeback_setup(struct xdma_engine *engine)
+{
+	u32 w;
+	struct xdma_dev *xdev;
+	struct xdma_poll_wb *writeback;
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	xdev = engine->xdev;
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * RTO - doing the allocation per engine is wasteful since a full page
+	 * is allocated each time - better to allocate one page for the whole
+	 * device during probe() and set per-engine offsets here
+	 */
+	writeback = (struct xdma_poll_wb *)engine->poll_mode_addr_virt;
+	writeback->completed_desc_count = 0;
+
+	dbg_init("Setting writeback location to 0x%llx for engine %p",
+		 engine->poll_mode_bus, engine);
+	w = cpu_to_le32(PCI_DMA_L(engine->poll_mode_bus));
+	write_register(w, &engine->regs->poll_mode_wb_lo,
+		       (unsigned long)(&engine->regs->poll_mode_wb_lo) -
+			       (unsigned long)(&engine->regs));
+	w = cpu_to_le32(PCI_DMA_H(engine->poll_mode_bus));
+	write_register(w, &engine->regs->poll_mode_wb_hi,
+		       (unsigned long)(&engine->regs->poll_mode_wb_hi) -
+			       (unsigned long)(&engine->regs));
+
+	return 0;
+}
+
+/* engine_create() - Create an SG DMA engine bookkeeping data structure
+ *
+ * An SG DMA engine consists of the resources for a single-direction transfer
+ * queue; the SG DMA hardware, the software queue and interrupt handling.
+ *
+ * @dev Pointer to pci_dev
+ * @offset byte address offset in BAR[xdev->config_bar_idx] resource for the
+ * SG DMA * controller registers.
+ * @dir: DMA_TO/FROM_DEVICE
+ * @streaming Whether the engine is attached to AXI ST (rather than MM)
+ */
+static int engine_init_regs(struct xdma_engine *engine)
+{
+	u32 reg_value;
+	int rv = 0;
+
+	write_register(XDMA_CTRL_NON_INCR_ADDR, &engine->regs->control_w1c,
+		       (unsigned long)(&engine->regs->control_w1c) -
+			       (unsigned long)(&engine->regs));
+
+	engine_alignments(engine);
+
+	/* Configure error interrupts by default */
+	reg_value = XDMA_CTRL_IE_DESC_ALIGN_MISMATCH;
+	reg_value |= XDMA_CTRL_IE_MAGIC_STOPPED;
+	reg_value |= XDMA_CTRL_IE_MAGIC_STOPPED;
+	reg_value |= XDMA_CTRL_IE_READ_ERROR;
+	reg_value |= XDMA_CTRL_IE_DESC_ERROR;
+
+	/* if using polled mode, configure writeback address */
+	if (poll_mode) {
+		rv = engine_writeback_setup(engine);
+		if (rv) {
+			dbg_init("%s descr writeback setup failed.\n",
+				 engine->name);
+			goto fail_wb;
+		}
+	} else {
+		/* enable the relevant completion interrupts */
+		reg_value |= XDMA_CTRL_IE_DESC_STOPPED;
+		reg_value |= XDMA_CTRL_IE_DESC_COMPLETED;
+	}
+
+	/* Apply engine configurations */
+	write_register(reg_value, &engine->regs->interrupt_enable_mask,
+		       (unsigned long)(&engine->regs->interrupt_enable_mask) -
+			       (unsigned long)(&engine->regs));
+
+	engine->interrupt_enable_mask_value = reg_value;
+
+	/* only enable credit mode for AXI-ST C2H */
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE) {
+		struct xdma_dev *xdev = engine->xdev;
+		u32 reg_value = (0x1 << engine->channel) << 16;
+		struct sgdma_common_regs *reg =
+			(struct sgdma_common_regs
+				 *)(xdev->bar[xdev->config_bar_idx] +
+				    (0x6 * TARGET_SPACING));
+
+		write_register(reg_value, &reg->credit_mode_enable_w1s, 0);
+	}
+
+	return 0;
+
+fail_wb:
+	return rv;
+}
+
+static int engine_alloc_resource(struct xdma_engine *engine)
+{
+	struct xdma_dev *xdev = engine->xdev;
+
+	engine->desc = dma_alloc_coherent(&xdev->pdev->dev,
+					  XDMA_TRANSFER_MAX_DESC *
+						  sizeof(struct xdma_desc),
+					  &engine->desc_bus, GFP_KERNEL);
+	if (!engine->desc) {
+		pr_warn("dev %s, %s pre-alloc desc OOM.\n",
+			dev_name(&xdev->pdev->dev), engine->name);
+		goto err_out;
+	}
+
+	if (poll_mode) {
+		engine->poll_mode_addr_virt =
+			dma_alloc_coherent(&xdev->pdev->dev,
+					   sizeof(struct xdma_poll_wb),
+					   &engine->poll_mode_bus, GFP_KERNEL);
+		if (!engine->poll_mode_addr_virt) {
+			pr_warn("%s, %s poll pre-alloc writeback OOM.\n",
+				dev_name(&xdev->pdev->dev), engine->name);
+			goto err_out;
+		}
+	}
+
+	if (engine->streaming && engine->dir == DMA_FROM_DEVICE) {
+		engine->cyclic_result = dma_alloc_coherent(
+			&xdev->pdev->dev,
+			XDMA_TRANSFER_MAX_DESC * sizeof(struct xdma_result),
+			&engine->cyclic_result_bus, GFP_KERNEL);
+
+		if (!engine->cyclic_result) {
+			pr_warn("%s, %s pre-alloc result OOM.\n",
+				dev_name(&xdev->pdev->dev), engine->name);
+			goto err_out;
+		}
+	}
+
+	return 0;
+
+err_out:
+	engine_free_resource(engine);
+	return -ENOMEM;
+}
+
+static int engine_init(struct xdma_engine *engine, struct xdma_dev *xdev,
+		       int offset, enum dma_data_direction dir, int channel)
+{
+	int rv;
+	u32 val;
+
+	dbg_init("channel %d, offset 0x%x, dir %d.\n", channel, offset, dir);
+
+	/* set magic */
+	engine->magic = MAGIC_ENGINE;
+
+	engine->channel = channel;
+
+	/* engine interrupt request bit */
+	engine->irq_bitmask = (1 << XDMA_ENG_IRQ_NUM) - 1;
+	engine->irq_bitmask <<= (xdev->engines_num * XDMA_ENG_IRQ_NUM);
+	engine->bypass_offset = xdev->engines_num * BYPASS_MODE_SPACING;
+
+	/* parent */
+	engine->xdev = xdev;
+	/* register address */
+	engine->regs = (xdev->bar[xdev->config_bar_idx] + offset);
+	engine->sgdma_regs = xdev->bar[xdev->config_bar_idx] + offset +
+			     SGDMA_OFFSET_FROM_CHANNEL;
+	val = read_register(&engine->regs->identifier);
+	if (val & 0x8000U)
+		engine->streaming = 1;
+
+	/* remember SG DMA direction */
+	engine->dir = dir;
+	sprintf(engine->name, "%d-%s%d-%s", xdev->idx,
+		(dir == DMA_TO_DEVICE) ? "H2C" : "C2H", channel,
+		engine->streaming ? "ST" : "MM");
+
+	dbg_init("engine %p name %s irq_bitmask=0x%08x\n", engine, engine->name,
+		 (int)engine->irq_bitmask);
+
+	/* initialize the deferred work for transfer completion */
+	INIT_WORK(&engine->work, engine_service_work);
+
+	if (dir == DMA_TO_DEVICE)
+		xdev->mask_irq_h2c |= engine->irq_bitmask;
+	else
+		xdev->mask_irq_c2h |= engine->irq_bitmask;
+	xdev->engines_num++;
+
+	rv = engine_alloc_resource(engine);
+	if (rv)
+		return rv;
+
+	rv = engine_init_regs(engine);
+	if (rv)
+		return rv;
+
+	if (poll_mode)
+		xdma_thread_add_work(engine);
+
+	return 0;
+}
+
+/* transfer_destroy() - free transfer */
+static void transfer_destroy(struct xdma_dev *xdev, struct xdma_transfer *xfer)
+{
+    /* free descriptors */
+	xdma_desc_done(xfer->desc_virt, xfer->desc_num);
+
+	if (xfer->last_in_request && (xfer->flags & XFER_FLAG_NEED_UNMAP)) {
+		struct sg_table *sgt = xfer->sgt;
+
+		if (sgt->nents) {
+			dma_unmap_sg(&xdev->pdev->dev, sgt->sgl, sgt->nents,
+				     xfer->dir);
+			sgt->nents = 0;
+		}
+	}
+}
+
+static int transfer_build(struct xdma_engine *engine,
+			struct xdma_request_cb *req, struct xdma_transfer *xfer,
+			unsigned int desc_max)
+{
+	struct sw_desc *sdesc = &(req->sdesc[req->sw_desc_idx]);
+	int i = 0;
+	int j = 0;
+	dma_addr_t bus = xfer->res_bus;
+
+	for (; i < desc_max; i++, j++, sdesc++) {
+		dbg_desc("sw desc %d/%u: 0x%llx, 0x%x, ep 0x%llx.\n",
+			 i + req->sw_desc_idx, req->sw_desc_cnt, sdesc->addr,
+			 sdesc->len, req->ep_addr);
+
+		/* fill in descriptor entry j with transfer details */
+		xdma_desc_set(xfer->desc_virt + j, sdesc->addr, req->ep_addr,
+			      sdesc->len, xfer->dir);
+		xfer->len += sdesc->len;
+
+		/* for non-inc-add mode don't increment ep_addr */
+		if (!engine->non_incr_addr)
+			req->ep_addr += sdesc->len;
+
+		if (engine->streaming && engine->dir == DMA_FROM_DEVICE) {
+			memset(xfer->res_virt + j, 0,
+				sizeof(struct xdma_result));
+			xfer->desc_virt[j].src_addr_lo =
+						cpu_to_le32(PCI_DMA_L(bus));
+			xfer->desc_virt[j].src_addr_hi =
+						cpu_to_le32(PCI_DMA_H(bus));
+			bus += sizeof(struct xdma_result);
+		}
+
+	}
+	req->sw_desc_idx += desc_max;
+	return 0;
+}
+
+static int transfer_init(struct xdma_engine *engine,
+			struct xdma_request_cb *req, struct xdma_transfer *xfer)
+{
+	unsigned int desc_max = min_t(unsigned int,
+				req->sw_desc_cnt - req->sw_desc_idx,
+				XDMA_TRANSFER_MAX_DESC);
+	int i = 0;
+	int last = 0;
+	u32 control;
+	unsigned long flags;
+
+	memset(xfer, 0, sizeof(*xfer));
+
+	/* lock the engine state */
+	spin_lock_irqsave(&engine->lock, flags);
+	/* initialize wait queue */
+	init_swait_queue_head(&xfer->wq);
+
+	/* remember direction of transfer */
+	xfer->dir = engine->dir;
+	xfer->desc_virt = engine->desc + engine->desc_idx;
+	xfer->res_virt = engine->cyclic_result + engine->desc_idx;
+	xfer->desc_bus = engine->desc_bus +
+			(sizeof(struct xdma_desc) * engine->desc_idx);
+	xfer->res_bus = engine->cyclic_result_bus +
+			(sizeof(struct xdma_result) * engine->desc_idx);
+	xfer->desc_index = engine->desc_idx;
+
+	/* Need to handle desc_used >= XDMA_TRANSFER_MAX_DESC */
+
+	if ((engine->desc_idx + desc_max) >= XDMA_TRANSFER_MAX_DESC)
+		desc_max = XDMA_TRANSFER_MAX_DESC - engine->desc_idx;
+
+	transfer_desc_init(xfer, desc_max);
+
+	dbg_sg("xfer= %p transfer->desc_bus = 0x%llx.\n",
+		xfer, (u64)xfer->desc_bus);
+	transfer_build(engine, req, xfer, desc_max);
+
+	xfer->desc_adjacent = desc_max;
+
+	/* terminate last descriptor */
+	last = desc_max - 1;
+	/* stop engine, EOP for AXI ST, req IRQ on last descriptor */
+	control = XDMA_DESC_STOPPED;
+	control |= XDMA_DESC_EOP;
+	control |= XDMA_DESC_COMPLETED;
+	xdma_desc_control_set(xfer->desc_virt + last, control);
+
+	if (engine->eop_flush) {
+		for (i = 0; i < last; i++)
+			xdma_desc_control_set(xfer->desc_virt + i,
+					XDMA_DESC_COMPLETED);
+		xfer->desc_cmpl_th = 1;
+	} else
+		xfer->desc_cmpl_th = desc_max;
+
+	xfer->desc_num = desc_max;
+	engine->desc_idx = (engine->desc_idx + desc_max) %
+					XDMA_TRANSFER_MAX_DESC;
+	engine->desc_used += desc_max;
+
+	/* fill in adjacent numbers */
+	for (i = 0; i < xfer->desc_num; i++) {
+		u32 next_adj = xdma_get_next_adj(xfer->desc_num - i - 1,
+						(xfer->desc_virt + i)->next_lo);
+
+		dbg_desc("set next adj at index %d to %u\n", i, next_adj);
+		xdma_desc_adjacent(xfer->desc_virt + i, next_adj);
+	}
+
+	spin_unlock_irqrestore(&engine->lock, flags);
+	return 0;
+}
+
+#ifdef __LIBXDMA_DEBUG__
+static void sgt_dump(struct sg_table *sgt)
+{
+	int i;
+	struct scatterlist *sg = sgt->sgl;
+
+	pr_info("sgt 0x%p, sgl 0x%p, nents %u/%u.\n", sgt, sgt->sgl, sgt->nents,
+		sgt->orig_nents);
+
+	for (i = 0; i < sgt->orig_nents; i++, sg = sg_next(sg))
+		pr_info("%d, 0x%p, pg 0x%p,%u+%u, dma 0x%llx,%u.\n", i, sg,
+			sg_page(sg), sg->offset, sg->length, sg_dma_address(sg),
+			sg_dma_len(sg));
+}
+
+static void xdma_request_cb_dump(struct xdma_request_cb *req)
+{
+	int i;
+
+	pr_info("request 0x%p, total %u, ep 0x%llx, sw_desc %u, sgt 0x%p.\n",
+		req, req->total_len, req->ep_addr, req->sw_desc_cnt, req->sgt);
+	sgt_dump(req->sgt);
+	for (i = 0; i < req->sw_desc_cnt; i++)
+		pr_info("%d/%u, 0x%llx, %u.\n", i, req->sw_desc_cnt,
+			req->sdesc[i].addr, req->sdesc[i].len);
+}
+#endif
+
+static void xdma_request_free(struct xdma_request_cb *req)
+{
+	if (((unsigned long)req) >= VMALLOC_START &&
+	    ((unsigned long)req) < VMALLOC_END)
+		vfree(req);
+	else
+		kfree(req);
+}
+
+static struct xdma_request_cb *xdma_request_alloc(unsigned int sdesc_nr)
+{
+	struct xdma_request_cb *req;
+	unsigned int size = sizeof(struct xdma_request_cb) +
+			    sdesc_nr * sizeof(struct sw_desc);
+
+	req = kzalloc(size, GFP_KERNEL);
+	if (!req) {
+		req = vmalloc(size);
+		if (req)
+			memset(req, 0, size);
+	}
+	if (!req) {
+		pr_info("OOM, %u sw_desc, %u.\n", sdesc_nr, size);
+		return NULL;
+	}
+
+	return req;
+}
+
+static struct xdma_request_cb *xdma_init_request(struct sg_table *sgt,
+						 u64 ep_addr)
+{
+	struct xdma_request_cb *req;
+	struct scatterlist *sg = sgt->sgl;
+	int max = sgt->nents;
+	int extra = 0;
+	int i, j = 0;
+
+	for (i = 0; i < max; i++, sg = sg_next(sg)) {
+		unsigned int len = sg_dma_len(sg);
+
+		if (unlikely(len > desc_blen_max))
+			extra += (len + desc_blen_max - 1) / desc_blen_max;
+	}
+
+	dbg_tfr("ep 0x%llx, desc %u+%u.\n", ep_addr, max, extra);
+
+	max += extra;
+	req = xdma_request_alloc(max);
+	if (!req)
+		return NULL;
+
+	req->sgt = sgt;
+	req->ep_addr = ep_addr;
+
+	for (i = 0, sg = sgt->sgl; i < sgt->nents; i++, sg = sg_next(sg)) {
+		unsigned int tlen = sg_dma_len(sg);
+		dma_addr_t addr = sg_dma_address(sg);
+
+		req->total_len += tlen;
+		while (tlen) {
+			req->sdesc[j].addr = addr;
+			if (tlen > desc_blen_max) {
+				req->sdesc[j].len = desc_blen_max;
+				addr += desc_blen_max;
+				tlen -= desc_blen_max;
+			} else {
+				req->sdesc[j].len = tlen;
+				tlen = 0;
+			}
+			j++;
+		}
+	}
+
+	if (j > max) {
+		pr_err("Cannot transfer more than supported length %d\n",
+		       desc_blen_max);
+		xdma_request_free(req);
+		return NULL;
+	}
+	req->sw_desc_cnt = j;
+#ifdef __LIBXDMA_DEBUG__
+	xdma_request_cb_dump(req);
+#endif
+	return req;
+}
+
+ssize_t xdma_xfer_submit(void *dev_hndl, int channel, bool write, u64 ep_addr,
+			 struct sg_table *sgt, bool dma_mapped, int timeout_ms)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+	struct xdma_engine *engine;
+	int rv = 0, tfer_idx = 0, i;
+	ssize_t done = 0;
+	struct scatterlist *sg = sgt->sgl;
+	int nents;
+	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	struct xdma_request_cb *req = NULL;
+
+	if (!dev_hndl)
+		return -EINVAL;
+
+	if (debug_check_dev_hndl(__func__, xdev->pdev, dev_hndl) < 0)
+		return -EINVAL;
+
+	if (write == 1) {
+		if (channel >= xdev->h2c_channel_max) {
+			pr_err("H2C channel %d >= %d.\n", channel,
+				xdev->h2c_channel_max);
+			return -EINVAL;
+		}
+		engine = &xdev->engine_h2c[channel];
+	} else if (write == 0) {
+		if (channel >= xdev->c2h_channel_max) {
+			pr_err("C2H channel %d >= %d.\n", channel,
+				xdev->c2h_channel_max);
+			return -EINVAL;
+		}
+		engine = &xdev->engine_c2h[channel];
+	}
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (engine->magic != MAGIC_ENGINE) {
+		pr_err("%s has invalid magic number %lx\n", engine->name,
+		       engine->magic);
+		return -EINVAL;
+	}
+
+	xdev = engine->xdev;
+	if (xdma_device_flag_check(xdev, XDEV_FLAG_OFFLINE)) {
+		pr_info("xdev 0x%p, offline.\n", xdev);
+		return -EBUSY;
+	}
+
+	/* check the direction */
+	if (engine->dir != dir) {
+		pr_info("0x%p, %s, %d, W %d, 0x%x/0x%x mismatch.\n", engine,
+			engine->name, channel, write, engine->dir, dir);
+		return -EINVAL;
+	}
+
+	if (!dma_mapped) {
+		nents = dma_map_sg(&xdev->pdev->dev, sg, sgt->orig_nents, dir);
+		if (!nents) {
+			pr_info("map sgl failed, sgt 0x%p.\n", sgt);
+			return -EIO;
+		}
+		sgt->nents = nents;
+	} else {
+		if (!sgt->nents) {
+			pr_err("sg table has invalid number of entries 0x%p.\n",
+			       sgt);
+			return -EIO;
+		}
+	}
+
+	req = xdma_init_request(sgt, ep_addr);
+	if (!req) {
+		rv = -ENOMEM;
+		goto unmap_sgl;
+	}
+
+	dbg_tfr("%s, len %u sg cnt %u.\n", engine->name, req->total_len,
+		req->sw_desc_cnt);
+
+	sg = sgt->sgl;
+	nents = req->sw_desc_cnt;
+	mutex_lock(&engine->desc_lock);
+
+	while (nents) {
+		unsigned long flags;
+		struct xdma_transfer *xfer;
+
+		/* build transfer */
+		rv = transfer_init(engine, req, &req->tfer[0]);
+		if (rv < 0) {
+			mutex_unlock(&engine->desc_lock);
+			goto unmap_sgl;
+		}
+		xfer = &req->tfer[0];
+
+		if (!dma_mapped)
+			xfer->flags = XFER_FLAG_NEED_UNMAP;
+
+		/* last transfer for the given request? */
+		nents -= xfer->desc_num;
+		if (!nents) {
+			xfer->last_in_request = 1;
+			xfer->sgt = sgt;
+		}
+
+		dbg_tfr("xfer, %u, ep 0x%llx, done %lu, sg %u/%u.\n", xfer->len,
+			req->ep_addr, done, req->sw_desc_idx, req->sw_desc_cnt);
+
+#ifdef __LIBXDMA_DEBUG__
+		transfer_dump(xfer);
+#endif
+
+		rv = transfer_queue(engine, xfer);
+		if (rv < 0) {
+			mutex_unlock(&engine->desc_lock);
+			pr_info("unable to submit %s, %d.\n", engine->name, rv);
+			goto unmap_sgl;
+		}
+
+		if (engine->cmplthp)
+			xdma_kthread_wakeup(engine->cmplthp);
+
+		if (timeout_ms > 0)
+			swait_event_interruptible_timeout_exclusive(xfer->wq,
+				(xfer->state != TRANSFER_STATE_SUBMITTED),
+				msecs_to_jiffies(timeout_ms));
+		else
+			swait_event_interruptible_exclusive(xfer->wq,
+				(xfer->state != TRANSFER_STATE_SUBMITTED));
+
+		spin_lock_irqsave(&engine->lock, flags);
+
+		switch (xfer->state) {
+		case TRANSFER_STATE_COMPLETED:
+			spin_unlock_irqrestore(&engine->lock, flags);
+
+			rv = 0;
+			dbg_tfr("transfer %p, %u, ep 0x%llx compl, +%lu.\n",
+				xfer, xfer->len, req->ep_addr - xfer->len,
+				done);
+
+			/* For C2H streaming use writeback results */
+			if (engine->streaming &&
+			    engine->dir == DMA_FROM_DEVICE) {
+				struct xdma_result *result = xfer->res_virt;
+
+				for (i = 0; i < xfer->desc_cmpl; i++)
+					done += result[i].length;
+
+				/* finish the whole request */
+				if (engine->eop_flush)
+					nents = 0;
+			} else
+				done += xfer->len;
+
+			break;
+		case TRANSFER_STATE_FAILED:
+			pr_info("xfer 0x%p,%u, failed, ep 0x%llx.\n", xfer,
+				xfer->len, req->ep_addr - xfer->len);
+			spin_unlock_irqrestore(&engine->lock, flags);
+
+#ifdef __LIBXDMA_DEBUG__
+			transfer_dump(xfer);
+			sgt_dump(sgt);
+#endif
+			rv = -EIO;
+			break;
+		default:
+			/* transfer can still be in-flight */
+			pr_info("xfer 0x%p,%u, s 0x%x timed out, ep 0x%llx.\n",
+				xfer, xfer->len, xfer->state, req->ep_addr);
+			rv = engine_status_read(engine, 0, 1);
+			if (rv < 0) {
+				pr_err("Failed to read engine status\n");
+			} else if (rv == 0) {
+				//engine_status_dump(engine);
+				rv = transfer_abort(engine, xfer);
+				if (rv < 0) {
+					pr_err("Failed to stop engine\n");
+				} else if (rv == 0) {
+					rv = xdma_engine_stop(engine);
+					if (rv < 0)
+						pr_err("Failed to stop engine\n");
+				}
+			}
+			spin_unlock_irqrestore(&engine->lock, flags);
+
+#ifdef __LIBXDMA_DEBUG__
+			transfer_dump(xfer);
+			sgt_dump(sgt);
+#endif
+			rv = -ERESTARTSYS;
+			break;
+		}
+
+		engine->desc_used -= xfer->desc_num;
+		transfer_destroy(xdev, xfer);
+
+		/* use multiple transfers per request if we could not fit
+		 * all data within single descriptor chain.
+		 */
+		tfer_idx++;
+
+		if (rv < 0) {
+			mutex_unlock(&engine->desc_lock);
+			goto unmap_sgl;
+		}
+	} /* while (sg) */
+	mutex_unlock(&engine->desc_lock);
+
+unmap_sgl:
+	if (!dma_mapped && sgt->nents) {
+		dma_unmap_sg(&xdev->pdev->dev, sgt->sgl, sgt->orig_nents, dir);
+		sgt->nents = 0;
+	}
+
+	if (req)
+		xdma_request_free(req);
+
+	/* as long as some data is processed, return the count */
+	return done ? done : rv;
+}
+EXPORT_SYMBOL_GPL(xdma_xfer_submit);
+
+ssize_t xdma_xfer_completion(void *cb_hndl, void *dev_hndl, int channel,
+			     bool write, u64 ep_addr, struct sg_table *sgt,
+			     bool dma_mapped, int timeout_ms)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+	struct xdma_io_cb *cb = (struct xdma_io_cb *)cb_hndl;
+	struct xdma_engine *engine;
+	int rv = 0, tfer_idx = 0;
+	ssize_t done = 0;
+	int nents;
+	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	struct xdma_request_cb *req = NULL;
+	struct xdma_transfer *xfer;
+	int i;
+	struct xdma_result *result;
+
+	if (write == 1) {
+		if (channel >= xdev->h2c_channel_max) {
+			pr_warn("H2C channel %d >= %d.\n",
+				channel, xdev->h2c_channel_max);
+			return -EINVAL;
+		}
+		engine = &xdev->engine_h2c[channel];
+	} else if (write == 0) {
+		if (channel >= xdev->c2h_channel_max) {
+			pr_warn("C2H channel %d >= %d.\n",
+				channel, xdev->c2h_channel_max);
+			return -EINVAL;
+		}
+		engine = &xdev->engine_c2h[channel];
+	} else {
+		pr_warn("write %d, exp. 0|1.\n", write);
+		return -EINVAL;
+	}
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (engine->magic != MAGIC_ENGINE) {
+		pr_err("%s has invalid magic number %lx\n", engine->name,
+		       engine->magic);
+		return -EINVAL;
+	}
+
+	xdev = engine->xdev;
+	req = cb->req;
+
+	nents = req->sw_desc_cnt;
+	while (nents) {
+		xfer = &req->tfer[tfer_idx];
+		nents -= xfer->desc_num;
+		switch (xfer->state) {
+		case TRANSFER_STATE_COMPLETED:
+
+			dbg_tfr("transfer %p, %u, ep 0x%llx compl, +%lu.\n",
+				xfer, xfer->len, req->ep_addr - xfer->len, done);
+
+			result = xfer->res_virt;
+			dbg_tfr("transfer %p, %u, ep 0x%llx compl, +%lu.\n",
+				xfer, xfer->len, req->ep_addr - xfer->len, done);
+			/* For C2H streaming use writeback results */
+			if (engine->streaming && engine->dir == DMA_FROM_DEVICE) {
+				for (i = 0; i < xfer->desc_num; i++)
+					done += result[i].length;
+			} else
+				done += xfer->len;
+
+			rv = 0;
+			break;
+		case TRANSFER_STATE_FAILED:
+			pr_info("xfer 0x%p,%u, failed, ep 0x%llx.\n",
+				xfer, xfer->len, req->ep_addr - xfer->len);
+#ifdef __LIBXDMA_DEBUG__
+			transfer_dump(xfer);
+			sgt_dump(sgt);
+#endif
+			rv = -EIO;
+			break;
+		default:
+			/* transfer can still be in-flight */
+			pr_info("xfer 0x%p,%u, s 0x%x timed out, ep 0x%llx.\n",
+				xfer, xfer->len, xfer->state, req->ep_addr);
+			engine_status_read(engine, 0, 1);
+			engine_status_dump(engine);
+			transfer_abort(engine, xfer);
+
+			xdma_engine_stop(engine);
+#ifdef __LIBXDMA_DEBUG__
+			transfer_dump(xfer);
+			sgt_dump(sgt);
+#endif
+			rv = -ERESTARTSYS;
+			break;
+		}
+
+		transfer_destroy(xdev, xfer);
+		engine->desc_used -= xfer->desc_num;
+
+		tfer_idx++;
+
+		if (rv < 0)
+			goto unmap_sgl;
+	} /* while (sg) */
+
+unmap_sgl:
+	if (!dma_mapped && sgt->nents) {
+		dma_unmap_sg(&xdev->pdev->dev, sgt->sgl, sgt->orig_nents, dir);
+		sgt->nents = 0;
+	}
+
+	if (req)
+		xdma_request_free(req);
+
+	return done;
+
+}
+EXPORT_SYMBOL_GPL(xdma_xfer_completion);
+
+
+ssize_t xdma_xfer_submit_nowait(void *cb_hndl, void *dev_hndl, int channel,
+				bool write, u64 ep_addr, struct sg_table *sgt,
+				bool dma_mapped, int timeout_ms)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+	struct xdma_engine *engine;
+	struct xdma_io_cb *cb = (struct xdma_io_cb *)cb_hndl;
+	int rv = 0, tfer_idx = 0;
+	struct scatterlist *sg = sgt->sgl;
+	int nents;
+	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	struct xdma_request_cb *req = NULL;
+
+	if (!dev_hndl)
+		return -EINVAL;
+
+	if (debug_check_dev_hndl(__func__, xdev->pdev, dev_hndl) < 0)
+		return -EINVAL;
+
+	if (write == 1) {
+		if (channel >= xdev->h2c_channel_max) {
+			pr_warn("H2C channel %d >= %d.\n",
+				channel, xdev->h2c_channel_max);
+			return -EINVAL;
+		}
+		engine = &xdev->engine_h2c[channel];
+	} else if (write == 0) {
+		if (channel >= xdev->c2h_channel_max) {
+			pr_warn("C2H channel %d >= %d.\n",
+				channel, xdev->c2h_channel_max);
+			return -EINVAL;
+		}
+		engine = &xdev->engine_c2h[channel];
+	} else {
+		pr_warn("write %d, exp. 0|1.\n", write);
+		return -EINVAL;
+	}
+
+	if (!engine) {
+		pr_err("dma engine NULL\n");
+		return -EINVAL;
+	}
+
+	if (engine->magic != MAGIC_ENGINE) {
+		pr_err("%s has invalid magic number %lx\n", engine->name,
+		       engine->magic);
+		return -EINVAL;
+	}
+
+	xdev = engine->xdev;
+	if (xdma_device_flag_check(xdev, XDEV_FLAG_OFFLINE)) {
+		pr_info("xdev 0x%p, offline.\n", xdev);
+		return -EBUSY;
+	}
+
+	/* check the direction */
+	if (engine->dir != dir) {
+		pr_info("0x%p, %s, %d, W %d, 0x%x/0x%x mismatch.\n",
+			engine, engine->name, channel, write, engine->dir, dir);
+		return -EINVAL;
+	}
+
+	if (!dma_mapped) {
+		nents = dma_map_sg(&xdev->pdev->dev, sg, sgt->orig_nents, dir);
+		if (!nents) {
+			pr_info("map sgl failed, sgt 0x%p.\n", sgt);
+			return -EIO;
+		}
+		sgt->nents = nents;
+	} else {
+		if (!sgt->nents) {
+			pr_err("sg table has invalid number of entries 0x%p.\n",
+			       sgt);
+			return -EIO;
+		}
+	}
+
+	req = xdma_init_request(sgt, ep_addr);
+	if (!req) {
+		rv = -ENOMEM;
+		goto unmap_sgl;
+	}
+
+	//used when doing completion.
+	req->cb = cb;
+	cb->req = req;
+	dbg_tfr("%s, len %u sg cnt %u.\n",
+		engine->name, req->total_len, req->sw_desc_cnt);
+
+	sg = sgt->sgl;
+	nents = req->sw_desc_cnt;
+	while (nents) {
+		struct xdma_transfer *xfer;
+
+		/* one transfer at a time */
+		xfer = &req->tfer[tfer_idx];
+		/* build transfer */
+		rv = transfer_init(engine, req, xfer);
+		if (rv < 0) {
+			pr_info("transfer_init failed\n");
+
+			if (!dma_mapped && sgt->nents) {
+				dma_unmap_sg(&xdev->pdev->dev, sgt->sgl,
+					     sgt->orig_nents, dir);
+				sgt->nents = 0;
+			}
+
+			/* Transfer failed return BUSY */
+			if (cb->io_done)
+				cb->io_done((unsigned long)cb, -EBUSY);
+
+			goto rel_req;
+		}
+
+		xfer->cb = cb;
+
+		if (!dma_mapped)
+			xfer->flags = XFER_FLAG_NEED_UNMAP;
+
+		/* last transfer for the given request? */
+		nents -= xfer->desc_num;
+		if (!nents) {
+			xfer->last_in_request = 1;
+			xfer->sgt = sgt;
+		}
+
+		dbg_tfr("xfer %p, len %u, ep 0x%llx, sg %u/%u. nents = %d\n",
+			xfer, xfer->len, req->ep_addr, req->sw_desc_idx,
+			req->sw_desc_cnt, nents);
+
+#ifdef __LIBXDMA_DEBUG__
+		transfer_dump(xfer);
+#endif
+
+		rv = transfer_queue(engine, xfer);
+		if (rv < 0) {
+			pr_info("unable to submit %s, %d.\n", engine->name, rv);
+			goto unmap_sgl;
+		}
+
+		/*
+		 * use multiple transfers per request if we could not fit all
+		 * data within single descriptor chain.
+		 */
+		tfer_idx++;
+	}
+
+	return -EIOCBQUEUED;
+
+unmap_sgl:
+	if (!dma_mapped && sgt->nents) {
+		dma_unmap_sg(&xdev->pdev->dev, sgt->sgl, sgt->orig_nents, dir);
+		sgt->nents = 0;
+	}
+
+rel_req:
+	if (req)
+		xdma_request_free(req);
+
+	return rv;
+}
+EXPORT_SYMBOL_GPL(xdma_xfer_submit_nowait);
+
+
+static struct xdma_dev *alloc_dev_instance(struct pci_dev *pdev)
+{
+	int i;
+	struct xdma_dev *xdev;
+	struct xdma_engine *engine;
+
+	if (!pdev) {
+		pr_err("Invalid pdev\n");
+		return NULL;
+	}
+
+	/* allocate zeroed device book keeping structure */
+	xdev = kzalloc(sizeof(struct xdma_dev), GFP_KERNEL);
+	if (!xdev)
+		return NULL;
+
+	spin_lock_init(&xdev->lock);
+
+	xdev->magic = MAGIC_DEVICE;
+	xdev->config_bar_idx = -1;
+	xdev->user_bar_idx = -1;
+	xdev->bypass_bar_idx = -1;
+	xdev->irq_line = -1;
+
+	/* create a driver to device reference */
+	xdev->pdev = pdev;
+	dbg_init("xdev = 0x%p\n", xdev);
+
+	engine = xdev->engine_h2c;
+	for (i = 0; i < XDMA_CHANNEL_NUM_MAX; i++, engine++) {
+		spin_lock_init(&engine->lock);
+		mutex_init(&engine->desc_lock);
+		INIT_LIST_HEAD(&engine->transfer_list);
+		init_swait_queue_head(&engine->shutdown_wq);
+	}
+
+	engine = xdev->engine_c2h;
+	for (i = 0; i < XDMA_CHANNEL_NUM_MAX; i++, engine++) {
+		spin_lock_init(&engine->lock);
+		mutex_init(&engine->desc_lock);
+		INIT_LIST_HEAD(&engine->transfer_list);
+		init_swait_queue_head(&engine->shutdown_wq);
+	}
+
+	return xdev;
+}
+
+static int request_regions(struct xdma_dev *xdev, struct pci_dev *pdev)
+{
+	int rv;
+
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	if (!pdev) {
+		pr_err("Invalid pdev\n");
+		return -EINVAL;
+	}
+
+	rv = pci_request_selected_regions(pdev, XDMA_CONFIG_BAR_MASK, xdev->mod_name);
+	/* could not request config BAR regions? */
+	if (rv) {
+		dbg_init("pci_request_selected_regions() = %d, device in use?\n", rv);
+		/* assume device is in use so do not disable it later */
+		xdev->regions_in_use = 1;
+	} else {
+		xdev->got_regions = 1;
+	}
+
+	return rv;
+}
+
+static int set_dma_mask(struct pci_dev *pdev)
+{
+	if (!pdev) {
+		pr_err("Invalid pdev\n");
+		return -EINVAL;
+	}
+
+	dbg_init("sizeof(dma_addr_t) == %ld\n", sizeof(dma_addr_t));
+	/* 64-bit addressing capability for XDMA? */
+	if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
+		/* query for DMA transfer */
+		/* @see Documentation/DMA-mapping.txt */
+		dbg_init("pci_set_dma_mask()\n");
+		/* use 64-bit DMA */
+		dbg_init("Using a 64-bit DMA mask.\n");
+		/* use 32-bit DMA for descriptors */
+		dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+		/* use 64-bit DMA, 32-bit for consistent */
+	} else if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+		dbg_init("Could not set 64-bit DMA mask.\n");
+		dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+		/* use 32-bit DMA */
+		dbg_init("Using a 32-bit DMA mask.\n");
+	} else {
+		dbg_init("No suitable DMA possible.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int get_engine_channel_id(struct engine_regs *regs)
+{
+	int value;
+
+	if (!regs) {
+		pr_err("Invalid engine registers\n");
+		return -EINVAL;
+	}
+
+	value = read_register(&regs->identifier);
+
+	return (value & 0x00000f00U) >> 8;
+}
+
+static int get_engine_id(struct engine_regs *regs)
+{
+	int value;
+
+	if (!regs) {
+		pr_err("Invalid engine registers\n");
+		return -EINVAL;
+	}
+
+	value = read_register(&regs->identifier);
+	return (value & 0xffff0000U) >> 16;
+}
+
+static void remove_engines(struct xdma_dev *xdev)
+{
+	struct xdma_engine *engine;
+	int i;
+	int rv;
+
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return;
+	}
+
+	/* iterate over channels */
+	for (i = 0; i < xdev->h2c_channel_max; i++) {
+		engine = &xdev->engine_h2c[i];
+		if (engine->magic == MAGIC_ENGINE) {
+			dbg_sg("Remove %s, %d", engine->name, i);
+			rv = engine_destroy(xdev, engine);
+			if (rv < 0)
+				pr_err("Failed to destroy H2C engine %d\n", i);
+			dbg_sg("%s, %d removed", engine->name, i);
+		}
+	}
+
+	for (i = 0; i < xdev->c2h_channel_max; i++) {
+		engine = &xdev->engine_c2h[i];
+		if (engine->magic == MAGIC_ENGINE) {
+			dbg_sg("Remove %s, %d", engine->name, i);
+			rv = engine_destroy(xdev, engine);
+			if (rv < 0)
+				pr_err("Failed to destroy C2H engine %d\n", i);
+			dbg_sg("%s, %d removed", engine->name, i);
+		}
+	}
+}
+
+static int probe_for_engine(struct xdma_dev *xdev, enum dma_data_direction dir,
+			    int channel)
+{
+	struct engine_regs *regs;
+	int offset = channel * CHANNEL_SPACING;
+	u32 engine_id;
+	u32 engine_id_expected;
+	u32 channel_id;
+	struct xdma_engine *engine;
+	int rv;
+
+	/* register offset for the engine */
+	/* read channels at 0x0000, write channels at 0x1000,
+	 * channels at 0x100 interval
+	 */
+	if (dir == DMA_TO_DEVICE) {
+		engine_id_expected = XDMA_ID_H2C;
+		engine = &xdev->engine_h2c[channel];
+	} else {
+		offset += H2C_CHANNEL_OFFSET;
+		engine_id_expected = XDMA_ID_C2H;
+		engine = &xdev->engine_c2h[channel];
+	}
+
+	regs = xdev->bar[xdev->config_bar_idx] + offset;
+	engine_id = get_engine_id(regs);
+	channel_id = get_engine_channel_id(regs);
+
+	if ((engine_id != engine_id_expected) || (channel_id != channel)) {
+		dbg_init(
+			"%s %d engine, reg off 0x%x, id mismatch 0x%x,0x%x,exp 0x%x,0x%x, SKIP.\n",
+			dir == DMA_TO_DEVICE ? "H2C" : "C2H", channel, offset,
+			engine_id, channel_id, engine_id_expected,
+			channel_id != channel);
+		return -EINVAL;
+	}
+
+	dbg_init("found AXI %s %d engine, reg. off 0x%x, id 0x%x,0x%x.\n",
+		 dir == DMA_TO_DEVICE ? "H2C" : "C2H", channel, offset,
+		 engine_id, channel_id);
+
+	/* allocate and initialize engine */
+	rv = engine_init(engine, xdev, offset, dir, channel);
+	if (rv != 0) {
+		pr_info("failed to create AXI %s %d engine.\n",
+			dir == DMA_TO_DEVICE ? "H2C" : "C2H", channel);
+		return rv;
+	}
+
+	return 0;
+}
+
+static int probe_engines(struct xdma_dev *xdev)
+{
+	int i;
+	int rv = 0;
+
+	if (!xdev) {
+		pr_err("Invalid xdev\n");
+		return -EINVAL;
+	}
+
+	/* iterate over channels */
+	for (i = 0; i < xdev->h2c_channel_max; i++) {
+		rv = probe_for_engine(xdev, DMA_TO_DEVICE, i);
+		if (rv)
+			break;
+	}
+	xdev->h2c_channel_max = i;
+
+	for (i = 0; i < xdev->c2h_channel_max; i++) {
+		rv = probe_for_engine(xdev, DMA_FROM_DEVICE, i);
+		if (rv)
+			break;
+	}
+	xdev->c2h_channel_max = i;
+
+	return 0;
+}
+
+static void pci_enable_capability(struct pci_dev *pdev, int cap)
+{
+	pcie_capability_set_word(pdev, PCI_EXP_DEVCTL, cap);
+}
+
+void *xdma_device_open(const char *mname, struct pci_dev *pdev, int *user_max,
+		       int *h2c_channel_max, int *c2h_channel_max)
+{
+	struct xdma_dev *xdev = NULL;
+	int rv = 0;
+
+	pr_info("%s device %s, 0x%p.\n", mname, dev_name(&pdev->dev), pdev);
+
+	/* allocate zeroed device book keeping structure */
+	xdev = alloc_dev_instance(pdev);
+	if (!xdev)
+		return NULL;
+	xdev->mod_name = mname;
+	xdev->user_max = *user_max;
+	xdev->h2c_channel_max = *h2c_channel_max;
+	xdev->c2h_channel_max = *c2h_channel_max;
+
+	xdma_device_flag_set(xdev, XDEV_FLAG_OFFLINE);
+	xdev_list_add(xdev);
+
+	if (xdev->user_max == 0 || xdev->user_max > MAX_USER_IRQ)
+		xdev->user_max = MAX_USER_IRQ;
+	if (xdev->h2c_channel_max == 0 ||
+	    xdev->h2c_channel_max > XDMA_CHANNEL_NUM_MAX)
+		xdev->h2c_channel_max = XDMA_CHANNEL_NUM_MAX;
+	if (xdev->c2h_channel_max == 0 ||
+	    xdev->c2h_channel_max > XDMA_CHANNEL_NUM_MAX)
+		xdev->c2h_channel_max = XDMA_CHANNEL_NUM_MAX;
+
+	rv = pci_enable_device(pdev);
+	if (rv) {
+		dbg_init("pci_enable_device() failed, %d.\n", rv);
+		goto err_enable;
+	}
+
+	/* keep INTx enabled */
+	pci_check_intr_pend(pdev);
+
+	/* enable relaxed ordering */
+	pci_enable_capability(pdev, PCI_EXP_DEVCTL_RELAX_EN);
+
+	/* enable extended tag */
+	pci_enable_capability(pdev, PCI_EXP_DEVCTL_EXT_TAG);
+
+	/* force MRRS to be 512 */
+	rv = pcie_set_readrq(pdev, 512);
+	if (rv)
+		pr_info("device %s, error set PCI_EXP_DEVCTL_READRQ: %d.\n",
+			dev_name(&pdev->dev), rv);
+
+	/* enable bus master capability */
+	pci_set_master(pdev);
+
+	rv = request_regions(xdev, pdev);
+	if (rv)
+		goto err_regions;
+
+	rv = map_bars(xdev, pdev);
+	if (rv)
+		goto err_map;
+
+	rv = set_dma_mask(pdev);
+	if (rv)
+		goto err_mask;
+
+	check_nonzero_interrupt_status(xdev);
+	/* explicitly zero all interrupt enable masks */
+	channel_interrupts_disable(xdev, ~0);
+	user_interrupts_disable(xdev, ~0);
+	read_interrupts(xdev);
+
+	rv = probe_engines(xdev);
+	if (rv)
+		goto err_engines;
+
+	rv = enable_msi_msix(xdev, pdev);
+	if (rv < 0)
+		goto err_enable_msix;
+
+	rv = irq_setup(xdev, pdev);
+	if (rv < 0)
+		goto err_interrupts;
+
+	if (!poll_mode)
+		channel_interrupts_enable(xdev, ~0);
+
+	/* Flush writes */
+	read_interrupts(xdev);
+
+	*user_max = xdev->user_max;
+	*h2c_channel_max = xdev->h2c_channel_max;
+	*c2h_channel_max = xdev->c2h_channel_max;
+
+	xdma_device_flag_clear(xdev, XDEV_FLAG_OFFLINE);
+	return (void *)xdev;
+
+err_interrupts:
+	irq_teardown(xdev);
+err_enable_msix:
+	disable_msi_msix(xdev, pdev);
+err_engines:
+	remove_engines(xdev);
+err_mask:
+	unmap_bars(xdev, pdev);
+err_map:
+	if (xdev->got_regions)
+		pci_release_selected_regions(pdev, XDMA_CONFIG_BAR_MASK);
+err_regions:
+	if (!xdev->regions_in_use)
+		pci_disable_device(pdev);
+err_enable:
+	xdev_list_remove(xdev);
+	kfree(xdev);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(xdma_device_open);
+
+void xdma_device_close(struct pci_dev *pdev, void *dev_hndl)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+
+	dbg_init("pdev 0x%p, xdev 0x%p.\n", pdev, dev_hndl);
+
+	if (!dev_hndl)
+		return;
+
+	if (debug_check_dev_hndl(__func__, pdev, dev_hndl) < 0)
+		return;
+
+	dbg_sg("remove(dev = 0x%p) where pdev->dev.driver_data = 0x%p\n", pdev,
+	       xdev);
+	if (xdev->pdev != pdev) {
+		dbg_sg("pci_dev(0x%lx) != pdev(0x%lx)\n",
+		       (unsigned long)xdev->pdev, (unsigned long)pdev);
+	}
+
+	channel_interrupts_disable(xdev, ~0);
+	user_interrupts_disable(xdev, ~0);
+	read_interrupts(xdev);
+
+	irq_teardown(xdev);
+	disable_msi_msix(xdev, pdev);
+
+	remove_engines(xdev);
+	unmap_bars(xdev, pdev);
+
+	if (xdev->got_regions) {
+		dbg_init("pci_release_selected_regions 0x%p.\n", pdev);
+		pci_release_selected_regions(pdev, XDMA_CONFIG_BAR_MASK);
+	}
+
+	if (!xdev->regions_in_use) {
+		dbg_init("pci_disable_device 0x%p.\n", pdev);
+		pci_disable_device(pdev);
+	}
+
+	xdev_list_remove(xdev);
+
+	kfree(xdev);
+}
+EXPORT_SYMBOL_GPL(xdma_device_close);
+
+void xdma_device_offline(struct pci_dev *pdev, void *dev_hndl)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+	struct xdma_engine *engine;
+	int i;
+	int rv;
+
+	if (!dev_hndl)
+		return;
+
+	if (debug_check_dev_hndl(__func__, pdev, dev_hndl) < 0)
+		return;
+
+	pr_info("pdev 0x%p, xdev 0x%p.\n", pdev, xdev);
+	xdma_device_flag_set(xdev, XDEV_FLAG_OFFLINE);
+
+	/* wait for all engines to be idle */
+	for (i = 0; i < xdev->h2c_channel_max; i++) {
+		unsigned long flags;
+
+		engine = &xdev->engine_h2c[i];
+
+		if (engine->magic == MAGIC_ENGINE) {
+			spin_lock_irqsave(&engine->lock, flags);
+			engine->shutdown |= ENGINE_SHUTDOWN_REQUEST;
+
+			rv = xdma_engine_stop(engine);
+			if (rv < 0)
+				pr_err("Failed to stop engine\n");
+			spin_unlock_irqrestore(&engine->lock, flags);
+		}
+	}
+
+	for (i = 0; i < xdev->c2h_channel_max; i++) {
+		unsigned long flags;
+
+		engine = &xdev->engine_c2h[i];
+		if (engine->magic == MAGIC_ENGINE) {
+			spin_lock_irqsave(&engine->lock, flags);
+			engine->shutdown |= ENGINE_SHUTDOWN_REQUEST;
+
+			rv = xdma_engine_stop(engine);
+			if (rv < 0)
+				pr_err("Failed to stop engine\n");
+			spin_unlock_irqrestore(&engine->lock, flags);
+		}
+	}
+
+	/* turn off interrupts */
+	channel_interrupts_disable(xdev, ~0);
+	user_interrupts_disable(xdev, ~0);
+	read_interrupts(xdev);
+	irq_teardown(xdev);
+
+	pr_info("xdev 0x%p, done.\n", xdev);
+}
+EXPORT_SYMBOL_GPL(xdma_device_offline);
+
+void xdma_device_online(struct pci_dev *pdev, void *dev_hndl)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+	struct xdma_engine *engine;
+	unsigned long flags;
+	int i;
+
+	if (!dev_hndl)
+		return;
+
+	if (debug_check_dev_hndl(__func__, pdev, dev_hndl) < 0)
+		return;
+
+	pr_info("pdev 0x%p, xdev 0x%p.\n", pdev, xdev);
+
+	for (i = 0; i < xdev->h2c_channel_max; i++) {
+		engine = &xdev->engine_h2c[i];
+		if (engine->magic == MAGIC_ENGINE) {
+			engine_init_regs(engine);
+			spin_lock_irqsave(&engine->lock, flags);
+			engine->shutdown &= ~ENGINE_SHUTDOWN_REQUEST;
+			spin_unlock_irqrestore(&engine->lock, flags);
+		}
+	}
+
+	for (i = 0; i < xdev->c2h_channel_max; i++) {
+		engine = &xdev->engine_c2h[i];
+		if (engine->magic == MAGIC_ENGINE) {
+			engine_init_regs(engine);
+			spin_lock_irqsave(&engine->lock, flags);
+			engine->shutdown &= ~ENGINE_SHUTDOWN_REQUEST;
+			spin_unlock_irqrestore(&engine->lock, flags);
+		}
+	}
+
+	/* re-write the interrupt table */
+	if (!poll_mode) {
+		irq_setup(xdev, pdev);
+
+		channel_interrupts_enable(xdev, ~0);
+		user_interrupts_enable(xdev, xdev->mask_irq_user);
+		read_interrupts(xdev);
+	}
+
+	xdma_device_flag_clear(xdev, XDEV_FLAG_OFFLINE);
+	pr_info("xdev 0x%p, done.\n", xdev);
+}
+EXPORT_SYMBOL_GPL(xdma_device_online);
+
+int xdma_device_restart(struct pci_dev *pdev, void *dev_hndl)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+
+	if (!dev_hndl)
+		return -EINVAL;
+
+	if (debug_check_dev_hndl(__func__, pdev, dev_hndl) < 0)
+		return -EINVAL;
+
+	pr_info("NOT implemented, 0x%p.\n", xdev);
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(xdma_device_restart);
+
+int xdma_user_irq_base(void *dev_hndl)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+
+	if (xdev->msix_enabled)
+		return pci_irq_vector(xdev->pdev, 0) + xdev->c2h_channel_max
+		  + xdev->h2c_channel_max;
+	else if (xdev->msi_enabled)
+		return pci_irq_vector(xdev->pdev, 0) + 1;
+	else
+		return -1;
+}
+EXPORT_SYMBOL_GPL(xdma_user_irq_base);
+
+int xdma_user_isr_enable(void *dev_hndl, unsigned int mask)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+
+	if (!dev_hndl)
+		return -EINVAL;
+
+	if (debug_check_dev_hndl(__func__, xdev->pdev, dev_hndl) < 0)
+		return -EINVAL;
+
+	xdev->mask_irq_user |= mask;
+	/* enable user interrupts */
+	user_interrupts_enable(xdev, mask);
+	read_interrupts(xdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xdma_user_isr_enable);
+
+int xdma_user_isr_disable(void *dev_hndl, unsigned int mask)
+{
+	struct xdma_dev *xdev = (struct xdma_dev *)dev_hndl;
+
+	if (!dev_hndl)
+		return -EINVAL;
+
+	if (debug_check_dev_hndl(__func__, xdev->pdev, dev_hndl) < 0)
+		return -EINVAL;
+
+	xdev->mask_irq_user &= ~mask;
+	user_interrupts_disable(xdev, mask);
+	read_interrupts(xdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xdma_user_isr_disable);
+
+static int __init xdma_base_init(void)
+{
+	pr_info("%s", version);
+	return 0;
+}
+
+static void __exit xdma_base_exit(void)
+{
+	pr_info("%s", __func__);
+}
+
+module_init(xdma_base_init);
+module_exit(xdma_base_exit);
diff --git a/drivers/dma/xilinx/xdma_core.h b/drivers/dma/xilinx/xdma_core.h
new file mode 100644
index 000000000000..7c09a5d3885c
--- /dev/null
+++ b/drivers/dma/xilinx/xdma_core.h
@@ -0,0 +1,588 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2016-present,  Xilinx, Inc.
+ * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
+ */
+
+#ifndef XDMA_CORE_H
+#define XDMA_CORE_H
+
+#include <linux/version.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/module.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/pci.h>
+#include <linux/workqueue.h>
+#include <linux/swait.h>
+
+/*
+ *  if the config bar is fixed, the driver does not neeed to search through
+ *  all of the bars
+ */
+#define XDMA_CONFIG_BAR_NUM	1
+#define XDMA_CONFIG_BAR_MASK (1U<<XDMA_CONFIG_BAR_NUM)
+
+/* Switch debug printing on/off */
+#define XDMA_DEBUG 0
+
+/* SECTION: Preprocessor macros/constants */
+#define XDMA_BAR_NUM (6)
+
+/* maximum amount of register space to map */
+#define XDMA_BAR_SIZE (0x8000UL)
+
+/* Use this definition to poll several times between calls to schedule */
+#define NUM_POLLS_PER_SCHED 100
+
+#define XDMA_CHANNEL_NUM_MAX (4)
+/*
+ * interrupts per engine, rad2_vul.sv:237
+ * .REG_IRQ_OUT	(reg_irq_from_ch[(channel*2) +: 2]),
+ */
+#define XDMA_ENG_IRQ_NUM (1)
+#define XDMA_MAX_ADJ_BLOCK_SIZE	0x40
+#define XDMA_PAGE_SIZE		0x1000
+#define RX_STATUS_EOP (1)
+
+/* Target internal components on XDMA control BAR */
+#define XDMA_OFS_INT_CTRL	(0x2000UL)
+#define XDMA_OFS_CONFIG		(0x3000UL)
+
+/* maximum number of desc per transfer request */
+#define XDMA_TRANSFER_MAX_DESC (2048)
+
+/* maximum size of a single DMA transfer descriptor */
+#define XDMA_DESC_BLEN_BITS	28
+#define XDMA_DESC_BLEN_MAX	((1 << (XDMA_DESC_BLEN_BITS)) - 1)
+
+/* bits of the SG DMA control register */
+#define XDMA_CTRL_RUN_STOP			(1UL << 0)
+#define XDMA_CTRL_IE_DESC_STOPPED		(1UL << 1)
+#define XDMA_CTRL_IE_DESC_COMPLETED		(1UL << 2)
+#define XDMA_CTRL_IE_DESC_ALIGN_MISMATCH	(1UL << 3)
+#define XDMA_CTRL_IE_MAGIC_STOPPED		(1UL << 4)
+#define XDMA_CTRL_IE_IDLE_STOPPED		(1UL << 6)
+#define XDMA_CTRL_IE_READ_ERROR			(0x1FUL << 9)
+#define XDMA_CTRL_IE_DESC_ERROR			(0x1FUL << 19)
+#define XDMA_CTRL_NON_INCR_ADDR			(1UL << 25)
+#define XDMA_CTRL_POLL_MODE_WB			(1UL << 26)
+#define XDMA_CTRL_STM_MODE_WB			(1UL << 27)
+
+/* bits of the SG DMA status register */
+#define XDMA_STAT_BUSY			(1UL << 0)
+#define XDMA_STAT_DESC_STOPPED		(1UL << 1)
+#define XDMA_STAT_DESC_COMPLETED	(1UL << 2)
+#define XDMA_STAT_ALIGN_MISMATCH	(1UL << 3)
+#define XDMA_STAT_MAGIC_STOPPED		(1UL << 4)
+#define XDMA_STAT_INVALID_LEN		(1UL << 5)
+#define XDMA_STAT_IDLE_STOPPED		(1UL << 6)
+
+#define XDMA_STAT_COMMON_ERR_MASK \
+	(XDMA_STAT_ALIGN_MISMATCH | XDMA_STAT_MAGIC_STOPPED | \
+	 XDMA_STAT_INVALID_LEN)
+
+/* desc_error, C2H & H2C */
+#define XDMA_STAT_DESC_UNSUPP_REQ	(1UL << 19)
+#define XDMA_STAT_DESC_COMPL_ABORT	(1UL << 20)
+#define XDMA_STAT_DESC_PARITY_ERR	(1UL << 21)
+#define XDMA_STAT_DESC_HEADER_EP	(1UL << 22)
+#define XDMA_STAT_DESC_UNEXP_COMPL	(1UL << 23)
+
+#define XDMA_STAT_DESC_ERR_MASK	\
+	(XDMA_STAT_DESC_UNSUPP_REQ | XDMA_STAT_DESC_COMPL_ABORT | \
+	 XDMA_STAT_DESC_PARITY_ERR | XDMA_STAT_DESC_HEADER_EP | \
+	 XDMA_STAT_DESC_UNEXP_COMPL)
+
+/* read error: H2C */
+#define XDMA_STAT_H2C_R_UNSUPP_REQ	(1UL << 9)
+#define XDMA_STAT_H2C_R_COMPL_ABORT	(1UL << 10)
+#define XDMA_STAT_H2C_R_PARITY_ERR	(1UL << 11)
+#define XDMA_STAT_H2C_R_HEADER_EP	(1UL << 12)
+#define XDMA_STAT_H2C_R_UNEXP_COMPL	(1UL << 13)
+
+#define XDMA_STAT_H2C_R_ERR_MASK	\
+	(XDMA_STAT_H2C_R_UNSUPP_REQ | XDMA_STAT_H2C_R_COMPL_ABORT | \
+	 XDMA_STAT_H2C_R_PARITY_ERR | XDMA_STAT_H2C_R_HEADER_EP | \
+	 XDMA_STAT_H2C_R_UNEXP_COMPL)
+
+/* write error, H2C only */
+#define XDMA_STAT_H2C_W_DECODE_ERR	(1UL << 14)
+#define XDMA_STAT_H2C_W_SLAVE_ERR	(1UL << 15)
+
+#define XDMA_STAT_H2C_W_ERR_MASK	\
+	(XDMA_STAT_H2C_W_DECODE_ERR | XDMA_STAT_H2C_W_SLAVE_ERR)
+
+/* read error: C2H */
+#define XDMA_STAT_C2H_R_DECODE_ERR	(1UL << 9)
+#define XDMA_STAT_C2H_R_SLAVE_ERR	(1UL << 10)
+
+#define XDMA_STAT_C2H_R_ERR_MASK	\
+	(XDMA_STAT_C2H_R_DECODE_ERR | XDMA_STAT_C2H_R_SLAVE_ERR)
+
+/* all combined */
+#define XDMA_STAT_H2C_ERR_MASK	\
+	(XDMA_STAT_COMMON_ERR_MASK | XDMA_STAT_DESC_ERR_MASK | \
+	 XDMA_STAT_H2C_R_ERR_MASK | XDMA_STAT_H2C_W_ERR_MASK)
+
+#define XDMA_STAT_C2H_ERR_MASK	\
+	(XDMA_STAT_COMMON_ERR_MASK | XDMA_STAT_DESC_ERR_MASK | \
+	 XDMA_STAT_C2H_R_ERR_MASK)
+
+/* bits of the SGDMA descriptor control field */
+#define XDMA_DESC_STOPPED	(1UL << 0)
+#define XDMA_DESC_COMPLETED	(1UL << 1)
+#define XDMA_DESC_EOP		(1UL << 4)
+
+#define XDMA_PERF_RUN	(1UL << 0)
+#define XDMA_PERF_CLEAR	(1UL << 1)
+#define XDMA_PERF_AUTO	(1UL << 2)
+
+#define MAGIC_ENGINE	0xEEEEEEEEUL
+#define MAGIC_DEVICE	0xDDDDDDDDUL
+
+/* upper 16-bits of engine identifier register */
+#define XDMA_ID_H2C 0x1fc0U
+#define XDMA_ID_C2H 0x1fc1U
+
+/* for C2H AXI-ST mode */
+#define CYCLIC_RX_PAGES_MAX	256
+
+#define LS_BYTE_MASK 0x000000FFUL
+
+#define BLOCK_ID_MASK 0xFFF00000
+#define BLOCK_ID_HEAD 0x1FC00000
+
+#define IRQ_BLOCK_ID 0x1fc20000UL
+#define CONFIG_BLOCK_ID 0x1fc30000UL
+
+#define WB_COUNT_MASK 0x00ffffffUL
+#define WB_ERR_MASK (1UL << 31)
+#define POLL_TIMEOUT_SECONDS 10
+
+#define MAX_USER_IRQ 16
+
+#define MAX_DESC_BUS_ADDR (0xffffffffULL)
+
+#define DESC_MAGIC 0xAD4B0000UL
+
+#define C2H_WB 0x52B4UL
+
+#define MAX_NUM_ENGINES (XDMA_CHANNEL_NUM_MAX * 2)
+#define H2C_CHANNEL_OFFSET 0x1000
+#define SGDMA_OFFSET_FROM_CHANNEL 0x4000
+#define CHANNEL_SPACING 0x100
+#define TARGET_SPACING 0x1000
+
+#define BYPASS_MODE_SPACING 0x0100
+
+/* obtain the 32 most significant (high) bits of a 32-bit or 64-bit address */
+#define PCI_DMA_H(addr) ((addr >> 16) >> 16)
+/* obtain the 32 least significant (low) bits of a 32-bit or 64-bit address */
+#define PCI_DMA_L(addr) (addr & 0xffffffffUL)
+
+#ifndef VM_RESERVED
+	#define VMEM_FLAGS (VM_IO | VM_DONTEXPAND | VM_DONTDUMP)
+#else
+	#define VMEM_FLAGS (VM_IO | VM_RESERVED)
+#endif
+
+#ifdef __LIBXDMA_DEBUG__
+#define dbg_io		pr_err
+#define dbg_fops	pr_err
+#define dbg_perf	pr_err
+#define dbg_sg		pr_err
+#define dbg_tfr		pr_err
+#define dbg_irq		pr_err
+#define dbg_init	pr_err
+#define dbg_desc	pr_err
+#else
+/* disable debugging */
+#define dbg_io(...)
+#define dbg_fops(...)
+#define dbg_perf(...)
+#define dbg_sg(...)
+#define dbg_tfr(...)
+#define dbg_irq(...)
+#define dbg_init(...)
+#define dbg_desc(...)
+#endif
+
+/* SECTION: Enum definitions */
+enum transfer_state {
+	TRANSFER_STATE_NEW = 0,
+	TRANSFER_STATE_SUBMITTED,
+	TRANSFER_STATE_COMPLETED,
+	TRANSFER_STATE_FAILED,
+	TRANSFER_STATE_ABORTED
+};
+
+enum shutdown_state {
+	ENGINE_SHUTDOWN_NONE = 0,	/* No shutdown in progress */
+	ENGINE_SHUTDOWN_REQUEST = 1,	/* engine requested to shutdown */
+	ENGINE_SHUTDOWN_IDLE = 2	/* engine has shutdown and is idle */
+};
+
+enum dev_capabilities {
+	CAP_64BIT_DMA = 2,
+	CAP_64BIT_DESC = 4,
+	CAP_ENGINE_WRITE = 8,
+	CAP_ENGINE_READ = 16
+};
+
+/* SECTION: Structure definitions */
+
+struct xdma_io_cb {
+	void __user *buf;
+	size_t len;
+	void *private;
+	unsigned int pages_nr;
+	struct sg_table sgt;
+	struct page **pages;
+	/** total data size */
+	unsigned int count;
+	/** MM only, DDR/BRAM memory addr */
+	u64 ep_addr;
+	/** write: if write to the device */
+	struct xdma_request_cb *req;
+	u8 write:1;
+	void (*io_done)(unsigned long cb_hndl, int err);
+};
+
+struct config_regs {
+	u32 identifier;
+	u32 reserved_1[4];
+	u32 msi_enable;
+};
+
+/**
+ * SG DMA Controller status and control registers
+ *
+ * These registers make the control interface for DMA transfers.
+ *
+ * It sits in End Point (FPGA) memory BAR[0] for 32-bit or BAR[0:1] for 64-bit.
+ * It references the first descriptor which exists in Root Complex (PC) memory.
+ *
+ * @note The registers must be accessed using 32-bit (PCI DWORD) read/writes,
+ * and their values are in little-endian byte ordering.
+ */
+struct engine_regs {
+	u32 identifier;
+	u32 control;
+	u32 control_w1s;
+	u32 control_w1c;
+	u32 reserved_1[12];	/* padding */
+
+	u32 status;
+	u32 status_rc;
+	u32 completed_desc_count;
+	u32 alignments;
+	u32 reserved_2[14];	/* padding */
+
+	u32 poll_mode_wb_lo;
+	u32 poll_mode_wb_hi;
+	u32 interrupt_enable_mask;
+	u32 interrupt_enable_mask_w1s;
+	u32 interrupt_enable_mask_w1c;
+	u32 reserved_3[9];	/* padding */
+
+	u32 perf_ctrl;
+	u32 perf_cyc_lo;
+	u32 perf_cyc_hi;
+	u32 perf_dat_lo;
+	u32 perf_dat_hi;
+	u32 perf_pnd_lo;
+	u32 perf_pnd_hi;
+} __packed;
+
+struct engine_sgdma_regs {
+	u32 identifier;
+	u32 reserved_1[31];	/* padding */
+
+	/* bus address to first descriptor in Root Complex Memory */
+	u32 first_desc_lo;
+	u32 first_desc_hi;
+	/* number of adjacent descriptors at first_desc */
+	u32 first_desc_adjacent;
+	u32 credits;
+} __packed;
+
+struct interrupt_regs {
+	u32 identifier;
+	u32 user_int_enable;
+	u32 user_int_enable_w1s;
+	u32 user_int_enable_w1c;
+	u32 channel_int_enable;
+	u32 channel_int_enable_w1s;
+	u32 channel_int_enable_w1c;
+	u32 reserved_1[9];	/* padding */
+
+	u32 user_int_request;
+	u32 channel_int_request;
+	u32 user_int_pending;
+	u32 channel_int_pending;
+	u32 reserved_2[12];	/* padding */
+
+	u32 user_msi_vector[8];
+	u32 channel_msi_vector[8];
+} __packed;
+
+struct sgdma_common_regs {
+	u32 padding[8];
+	u32 credit_mode_enable;
+	u32 credit_mode_enable_w1s;
+	u32 credit_mode_enable_w1c;
+} __packed;
+
+
+/* Structure for polled mode descriptor writeback */
+struct xdma_poll_wb {
+	u32 completed_desc_count;
+	u32 reserved_1[7];
+} __packed;
+
+
+/**
+ * Descriptor for a single contiguous memory block transfer.
+ *
+ * Multiple descriptors are linked by means of the next pointer. An additional
+ * extra adjacent number gives the amount of extra contiguous descriptors.
+ *
+ * The descriptors are in root complex memory, and the bytes in the 32-bit
+ * words must be in little-endian byte ordering.
+ */
+struct xdma_desc {
+	u32 control;
+	u32 bytes;		/* transfer length in bytes */
+	u32 src_addr_lo;	/* source address (low 32-bit) */
+	u32 src_addr_hi;	/* source address (high 32-bit) */
+	u32 dst_addr_lo;	/* destination address (low 32-bit) */
+	u32 dst_addr_hi;	/* destination address (high 32-bit) */
+	/*
+	 * next descriptor in the single-linked list of descriptors;
+	 * this is the PCIe (bus) address of the next descriptor in the
+	 * root complex memory
+	 */
+	u32 next_lo;		/* next desc address (low 32-bit) */
+	u32 next_hi;		/* next desc address (high 32-bit) */
+} __packed;
+
+/* 32 bytes (four 32-bit words) or 64 bytes (eight 32-bit words) */
+struct xdma_result {
+	u32 status;
+	u32 length;
+	u32 reserved_1[6];	/* padding */
+} __packed;
+
+struct sw_desc {
+	dma_addr_t addr;
+	unsigned int len;
+};
+
+/* Describes a (SG DMA) single transfer for the engine */
+#define XFER_FLAG_NEED_UNMAP		0x1
+#define XFER_FLAG_ST_C2H_EOP_RCVED	0x2	/* ST c2h only */
+struct xdma_transfer {
+	struct list_head entry;		/* queue of non-completed transfers */
+	struct xdma_desc *desc_virt;	/* virt addr of the 1st descriptor */
+	struct xdma_result *res_virt;   /* virt addr of result, c2h streaming */
+	dma_addr_t res_bus;		/* bus addr for result descriptors */
+	dma_addr_t desc_bus;		/* bus addr of the first descriptor */
+	int desc_adjacent;		/* adjacent descriptors at desc_bus */
+	int desc_num;			/* number of descriptors in transfer */
+	int desc_index;			/* index for 1st desc. in transfer */
+	int desc_cmpl;			/* completed descriptors */
+	int desc_cmpl_th;		/* completed descriptor threshold */
+	enum dma_data_direction dir;
+	struct swait_queue_head wq;	/* wait queue for transfer completion */
+
+	enum transfer_state state;	/* state of the transfer */
+	unsigned int flags;
+	int cyclic;			/* flag if transfer is cyclic */
+	int last_in_request;		/* flag if last within request */
+	unsigned int len;
+	struct sg_table *sgt;
+	struct xdma_io_cb *cb;
+};
+
+struct xdma_request_cb {
+	struct sg_table *sgt;
+	unsigned int total_len;
+	u64 ep_addr;
+
+	struct xdma_transfer tfer[2]; /* Use two transfers in case single request needs to be split */
+	struct xdma_io_cb *cb;
+
+	unsigned int sw_desc_idx;
+	unsigned int sw_desc_cnt;
+	struct sw_desc sdesc[0];
+};
+
+struct xdma_engine {
+	unsigned long magic;	/* structure ID for sanity checks */
+	struct xdma_dev *xdev;	/* parent device */
+	char name[16];		/* name of this engine */
+	int version;		/* version of this engine */
+
+	/* HW register address offsets */
+	struct engine_regs *regs;		/* Control reg BAR offset */
+	struct engine_sgdma_regs *sgdma_regs;	/* SGDAM reg BAR offset */
+	u32 bypass_offset;			/* Bypass mode BAR offset */
+
+	/* Engine state, configuration and flags */
+	enum shutdown_state shutdown;	/* engine shutdown mode */
+	enum dma_data_direction dir;
+	u8 addr_align;		/* source/dest alignment in bytes */
+	u8 len_granularity;	/* transfer length multiple */
+	u8 addr_bits;		/* HW datapath address width */
+	u8 channel:2;		/* engine indices */
+	u8 streaming:1;
+	u8 device_open:1;	/* flag if engine node open, ST mode only */
+	u8 running:1;		/* flag if the driver started engine */
+	u8 non_incr_addr:1;	/* flag if non-incremental addressing used */
+	u8 eop_flush:1;		/* st c2h only, flush up the data with eop */
+	u8 filler:1;
+
+	int max_extra_adj;	/* descriptor prefetch capability */
+	int desc_dequeued;	/* num descriptors of completed transfers */
+	u32 status;		/* last known status of device */
+	/* only used for MSIX mode to store per-engine interrupt mask value */
+	u32 interrupt_enable_mask_value;
+
+	/* Transfer list management */
+	struct list_head transfer_list;	/* queue of transfers */
+
+	/* Members applicable to AXI-ST C2H (cyclic) transfers */
+	struct xdma_result *cyclic_result;
+	dma_addr_t cyclic_result_bus;	/* bus addr for transfer */
+	u8 *perf_buf_virt;
+	dma_addr_t perf_buf_bus; /* bus address */
+
+	/* Members associated with polled mode support */
+	u8 *poll_mode_addr_virt;	/* virt addr for descriptor writeback */
+	dma_addr_t poll_mode_bus;	/* bus addr for descriptor writeback */
+
+	/* Members associated with interrupt mode support */
+	struct swait_queue_head shutdown_wq;
+	spinlock_t lock;		/* protects concurrent access */
+	int prev_cpu;			/* remember CPU# of (last) locker */
+	int msix_irq_line;		/* MSI-X vector for this engine */
+	u32 irq_bitmask;		/* IRQ bit mask for this engine */
+	struct work_struct work;	/* Work queue for interrupt handling */
+
+	struct mutex desc_lock;		/* protects concurrent access */
+	dma_addr_t desc_bus;
+	struct xdma_desc *desc;
+	int desc_idx;			/* current descriptor index */
+	int desc_used;			/* total descriptors used */
+
+	struct xdma_kthread *cmplthp;
+	/* completion status thread list for the queue */
+	struct list_head cmplthp_list;
+	/* pending work thread list */
+	/* cpu attached to intr_work */
+	unsigned int intr_work_cpu;
+};
+
+/* XDMA PCIe device specific book-keeping */
+#define XDEV_FLAG_OFFLINE	0x1
+struct xdma_dev {
+	struct list_head list_head;
+	struct list_head rcu_node;
+
+	unsigned long magic;		/* structure ID for sanity checks */
+	struct pci_dev *pdev;	/* pci device struct from probe() */
+	int idx;		/* dev index */
+
+	const char *mod_name;		/* name of module owning the dev */
+
+	spinlock_t lock;		/* protects concurrent access */
+	unsigned int flags;
+
+	/* PCIe BAR management */
+	void __iomem *bar[XDMA_BAR_NUM];	/* addresses for mapped BARs */
+	int user_bar_idx;	/* BAR index of user logic */
+	int config_bar_idx;	/* BAR index of XDMA config logic */
+	int bypass_bar_idx;	/* BAR index of XDMA bypass logic */
+	int regions_in_use;	/* flag if dev was in use during probe() */
+	int got_regions;	/* flag if probe() obtained the regions */
+
+	int user_max;
+	int c2h_channel_max;
+	int h2c_channel_max;
+
+	/* Interrupt management */
+	int irq_count;		/* interrupt counter */
+	int irq_line;		/* flag if irq allocated successfully */
+	int msi_enabled;	/* flag if msi was enabled for the device */
+	int msix_enabled;	/* flag if msi-x was enabled for the device */
+	unsigned int mask_irq_user;
+
+	/* XDMA engine management */
+	int engines_num;	/* Total engine count */
+	u32 mask_irq_h2c;
+	u32 mask_irq_c2h;
+	struct xdma_engine engine_h2c[XDMA_CHANNEL_NUM_MAX];
+	struct xdma_engine engine_c2h[XDMA_CHANNEL_NUM_MAX];
+
+	/* SD_Accel specific */
+	enum dev_capabilities capabilities;
+	u64 feature_id;
+};
+
+static inline int xdma_device_flag_check(struct xdma_dev *xdev, unsigned int f)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&xdev->lock, flags);
+	if (xdev->flags & f) {
+		spin_unlock_irqrestore(&xdev->lock, flags);
+		return 1;
+	}
+	spin_unlock_irqrestore(&xdev->lock, flags);
+	return 0;
+}
+
+static inline int xdma_device_flag_test_n_set(struct xdma_dev *xdev,
+					 unsigned int f)
+{
+	unsigned long flags;
+	int rv = 0;
+
+	spin_lock_irqsave(&xdev->lock, flags);
+	if (xdev->flags & f) {
+		spin_unlock_irqrestore(&xdev->lock, flags);
+		rv = 1;
+	} else
+		xdev->flags |= f;
+	spin_unlock_irqrestore(&xdev->lock, flags);
+	return rv;
+}
+
+static inline void xdma_device_flag_set(struct xdma_dev *xdev, unsigned int f)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&xdev->lock, flags);
+	xdev->flags |= f;
+	spin_unlock_irqrestore(&xdev->lock, flags);
+}
+
+static inline void xdma_device_flag_clear(struct xdma_dev *xdev, unsigned int f)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&xdev->lock, flags);
+	xdev->flags &= ~f;
+	spin_unlock_irqrestore(&xdev->lock, flags);
+}
+
+int xdma_engine_service_poll(struct xdma_engine *engine, u32 expected_desc_count);
+
+#endif /* XDMA_CORE_H */
diff --git a/drivers/dma/xilinx/xdma_thread.c b/drivers/dma/xilinx/xdma_thread.c
new file mode 100644
index 000000000000..a71fc4b1c004
--- /dev/null
+++ b/drivers/dma/xilinx/xdma_thread.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2017-present,  Xilinx, Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include "xdma_thread.h"
+
+/* ********************* global variables *********************************** */
+static struct xdma_kthread *cs_threads;
+static unsigned int thread_cnt;
+
+
+/* ********************* static function definitions ************************ */
+static int xdma_thread_cmpl_status_pend(struct list_head *work_item)
+{
+	struct xdma_engine *engine = list_entry(work_item, struct xdma_engine,
+						cmplthp_list);
+	int pend = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&engine->lock, flags);
+	pend = !list_empty(&engine->transfer_list);
+	spin_unlock_irqrestore(&engine->lock, flags);
+
+	return pend;
+}
+
+static int xdma_thread_cmpl_status_proc(struct list_head *work_item)
+{
+	struct xdma_engine *engine;
+	struct xdma_transfer *transfer;
+
+	engine = list_entry(work_item, struct xdma_engine, cmplthp_list);
+	transfer = list_entry(engine->transfer_list.next, struct xdma_transfer,
+			entry);
+	if (transfer)
+		xdma_engine_service_poll(engine, transfer->desc_cmpl_th);
+	return 0;
+}
+
+static inline int xthread_work_pending(struct xdma_kthread *thp)
+{
+	struct list_head *work_item, *next;
+
+	/* any work items assigned to this thread? */
+	if (list_empty(&thp->work_list))
+		return 0;
+
+	/* any work item has pending work to do? */
+	list_for_each_safe(work_item, next, &thp->work_list) {
+		if (thp->fpending && thp->fpending(work_item))
+			return 1;
+
+	}
+	return 0;
+}
+
+static inline void xthread_reschedule(struct xdma_kthread *thp)
+{
+	if (thp->timeout) {
+		pr_debug_thread("%s rescheduling for %u seconds",
+				thp->name, thp->timeout);
+		wait_event_interruptible_timeout(thp->waitq, thp->schedule,
+					      msecs_to_jiffies(thp->timeout));
+	} else {
+		pr_debug_thread("%s rescheduling", thp->name);
+		wait_event_interruptible(thp->waitq, thp->schedule);
+	}
+}
+
+static int xthread_main(void *data)
+{
+	struct xdma_kthread *thp = (struct xdma_kthread *)data;
+
+	pr_debug_thread("%s UP.\n", thp->name);
+
+	disallow_signal(SIGPIPE);
+
+	if (thp->finit)
+		thp->finit(thp);
+
+	while (!kthread_should_stop()) {
+
+		struct list_head *work_item, *next;
+
+		pr_debug_thread("%s interruptible\n", thp->name);
+
+		/* any work to do? */
+		lock_thread(thp);
+		if (!xthread_work_pending(thp)) {
+			unlock_thread(thp);
+			xthread_reschedule(thp);
+			lock_thread(thp);
+		}
+		thp->schedule = 0;
+
+		if (thp->work_cnt) {
+			pr_debug_thread("%s processing %u work items\n",
+					thp->name, thp->work_cnt);
+			/* do work */
+			list_for_each_safe(work_item, next, &thp->work_list) {
+				thp->fproc(work_item);
+			}
+		}
+		unlock_thread(thp);
+		schedule();
+	}
+
+	pr_debug_thread("%s, work done.\n", thp->name);
+
+	if (thp->fdone)
+		thp->fdone(thp);
+
+	pr_debug_thread("%s, exit.\n", thp->name);
+	return 0;
+}
+
+
+static int xdma_kthread_start(struct xdma_kthread *thp, char *name, int id)
+{
+	int len;
+	int node;
+
+	if (thp->task) {
+		pr_warn("kthread %s task already running?\n", thp->name);
+		return -EINVAL;
+	}
+
+	len = snprintf(thp->name, sizeof(thp->name), "%s%d", name, id);
+	if (len < 0) {
+		pr_err("thread %d, error in snprintf name %s.\n", id, name);
+		return -EINVAL;
+	}
+
+	thp->id = id;
+
+	spin_lock_init(&thp->lock);
+	INIT_LIST_HEAD(&thp->work_list);
+	init_waitqueue_head(&thp->waitq);
+
+	node = cpu_to_node(thp->cpu);
+	pr_debug("node : %d\n", node);
+
+	thp->task = kthread_create_on_node(xthread_main, (void *)thp,
+					node, "%s", thp->name);
+	if (IS_ERR(thp->task)) {
+		pr_err("kthread %s, create task failed: 0x%lx\n",
+			thp->name, (unsigned long)IS_ERR(thp->task));
+		thp->task = NULL;
+		return -EFAULT;
+	}
+
+	kthread_bind(thp->task, thp->cpu);
+
+	pr_debug_thread("kthread 0x%p, %s, cpu %u, task 0x%p.\n",
+		thp, thp->name, thp->cpu, thp->task);
+
+	wake_up_process(thp->task);
+	return 0;
+}
+
+static int xdma_kthread_stop(struct xdma_kthread *thp)
+{
+	int rv;
+
+	if (!thp->task) {
+		pr_debug_thread("kthread %s, already stopped.\n", thp->name);
+		return 0;
+	}
+
+	thp->schedule = 1;
+	rv = kthread_stop(thp->task);
+	if (rv < 0) {
+		pr_warn("kthread %s, stop err %d.\n", thp->name, rv);
+		return rv;
+	}
+
+	pr_debug_thread("kthread %s, 0x%p, stopped.\n", thp->name, thp->task);
+	thp->task = NULL;
+
+	return 0;
+}
+
+
+
+void xdma_thread_remove_work(struct xdma_engine *engine)
+{
+	struct xdma_kthread *cmpl_thread;
+	unsigned long flags;
+
+	spin_lock_irqsave(&engine->lock, flags);
+	cmpl_thread = engine->cmplthp;
+	engine->cmplthp = NULL;
+
+	spin_unlock_irqrestore(&engine->lock, flags);
+
+	if (cmpl_thread) {
+		lock_thread(cmpl_thread);
+		list_del(&engine->cmplthp_list);
+		cmpl_thread->work_cnt--;
+		unlock_thread(cmpl_thread);
+	}
+}
+
+void xdma_thread_add_work(struct xdma_engine *engine)
+{
+	struct xdma_kthread *thp = cs_threads;
+	unsigned int v = 0;
+	int i, idx = thread_cnt;
+	unsigned long flags;
+
+
+	/* Polled mode only */
+	for (i = 0; i < thread_cnt; i++, thp++) {
+		lock_thread(thp);
+		if (idx == thread_cnt) {
+			v = thp->work_cnt;
+			idx = i;
+		} else if (!thp->work_cnt) {
+			idx = i;
+			unlock_thread(thp);
+			break;
+		} else if (thp->work_cnt < v)
+			idx = i;
+		unlock_thread(thp);
+	}
+
+	thp = cs_threads + idx;
+	lock_thread(thp);
+	list_add_tail(&engine->cmplthp_list, &thp->work_list);
+	engine->intr_work_cpu = idx;
+	thp->work_cnt++;
+	unlock_thread(thp);
+
+	pr_info("%s 0x%p assigned to cmpl status thread %s,%u.\n",
+		engine->name, engine, thp->name, thp->work_cnt);
+
+
+	spin_lock_irqsave(&engine->lock, flags);
+	engine->cmplthp = thp;
+	spin_unlock_irqrestore(&engine->lock, flags);
+}
+
+int xdma_threads_create(unsigned int num_threads)
+{
+	struct xdma_kthread *thp;
+	int rv;
+	int cpu;
+
+	if (thread_cnt) {
+		pr_warn("threads already created!");
+		return 0;
+	}
+
+	cs_threads = kzalloc(num_threads * sizeof(struct xdma_kthread),
+					GFP_KERNEL);
+	if (!cs_threads)
+		return -ENOMEM;
+
+	/* N dma writeback monitoring threads */
+	thp = cs_threads;
+	for_each_online_cpu(cpu) {
+		pr_debug("index %d cpu %d online\n", thread_cnt, cpu);
+		thp->cpu = cpu;
+		thp->timeout = 0;
+		thp->fproc = xdma_thread_cmpl_status_proc;
+		thp->fpending = xdma_thread_cmpl_status_pend;
+		rv = xdma_kthread_start(thp, "cmpl_status_th", thread_cnt);
+		if (rv < 0)
+			goto cleanup_threads;
+
+		thread_cnt++;
+		if (thread_cnt == num_threads)
+			break;
+		thp++;
+	}
+
+	return 0;
+
+cleanup_threads:
+	kfree(cs_threads);
+	cs_threads = NULL;
+	thread_cnt = 0;
+
+	return rv;
+}
+
+void xdma_threads_destroy(void)
+{
+	int i;
+	struct xdma_kthread *thp;
+
+	if (!thread_cnt)
+		return;
+
+	/* N dma writeback monitoring threads */
+	thp = cs_threads;
+	for (i = 0; i < thread_cnt; i++, thp++)
+		if (thp->fproc)
+			xdma_kthread_stop(thp);
+
+	kfree(cs_threads);
+	cs_threads = NULL;
+	thread_cnt = 0;
+}
diff --git a/drivers/dma/xilinx/xdma_thread.h b/drivers/dma/xilinx/xdma_thread.h
new file mode 100644
index 000000000000..508dd4c4c890
--- /dev/null
+++ b/drivers/dma/xilinx/xdma_thread.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2017-present,  Xilinx, Inc.
+ */
+
+#ifndef XDMA_THREAD_H
+#define XDMA_THREAD_H
+/**
+ * @file
+ * @brief This file contains the declarations for xdma kernel threads
+ *
+ */
+#include <linux/version.h>
+#include <linux/spinlock.h>
+#include <linux/kthread.h>
+#include <linux/cpuset.h>
+#include <linux/signal.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/errno.h>
+#include "xdma_core.h"
+
+#ifdef DEBUG_THREADS
+#define lock_thread(thp)	\
+	do { \
+		pr_debug("locking thp %s ...\n", (thp)->name); \
+		spin_lock(&(thp)->lock); \
+	} while (0)
+
+#define unlock_thread(thp)	\
+	do { \
+		pr_debug("unlock thp %s ...\n", (thp)->name); \
+		spin_unlock(&(thp)->lock); \
+	} while (0)
+
+#define xdma_kthread_wakeup(thp)	\
+	do { \
+		pr_info("signaling thp %s ...\n", (thp)->name); \
+		wake_up_process((thp)->task); \
+	} while (0)
+
+#define pr_debug_thread(fmt, ...) pr_info(fmt, __VA_ARGS__)
+
+#else
+/** lock thread macro */
+#define lock_thread(thp)		spin_lock(&(thp)->lock)
+/** un lock thread macro */
+#define unlock_thread(thp)		spin_unlock(&(thp)->lock)
+#define xdma_kthread_wakeup(thp) \
+	do { \
+		thp->schedule = 1; \
+		wake_up_interruptible(&thp->waitq); \
+	} while (0)
+/** pr_debug_thread */
+#define pr_debug_thread(fmt, ...)
+#endif
+
+/**
+ * @struct - xdma_kthread
+ * @brief	xdma thread book keeping parameters
+ */
+struct xdma_kthread {
+	/**  thread lock*/
+	spinlock_t lock;
+	/**  name of the thread */
+	char name[16];
+	/**  cpu number for which the thread associated with */
+	unsigned short cpu;
+	/**  thread id */
+	unsigned short id;
+	/**  thread sleep timeout value */
+	unsigned int timeout;
+	/**  flags for thread */
+	unsigned long flag;
+	/**  thread wait queue */
+	wait_queue_head_t waitq;
+	/* flag to indicate scheduling of thread */
+	unsigned int schedule;
+	/**  kernel task structure associated with thread*/
+	struct task_struct *task;
+	/**  thread work list count */
+	unsigned int work_cnt;
+	/**  thread work list count */
+	struct list_head work_list;
+	/**  thread initialization handler */
+	int (*finit)(struct xdma_kthread *thread);
+	/**  thread pending handler */
+	int (*fpending)(struct list_head *list);
+	/**  thread peocessing handler */
+	int (*fproc)(struct list_head *list);
+	/**  thread done handler */
+	int (*fdone)(struct xdma_kthread *thread);
+};
+
+
+/*****************************************************************************/
+/**
+ * xdma_threads_create() - create xdma threads
+ *****************************************************************************/
+int xdma_threads_create(unsigned int num_threads);
+
+/*****************************************************************************/
+/**
+ * xdma_threads_destroy() - destroy all the xdma threads created
+ *                          during system initialization
+ *
+ * @return	none
+ *****************************************************************************/
+void xdma_threads_destroy(void);
+
+/*****************************************************************************/
+/**
+ * xdma_thread_remove_work() - handler to remove the attached work thread
+ *
+ * @param[in]	engine:	pointer to xdma_engine
+ *
+ * @return	none
+ *****************************************************************************/
+void xdma_thread_remove_work(struct xdma_engine *engine);
+
+/*****************************************************************************/
+/**
+ * xdma_thread_add_work() - handler to add a work thread
+ *
+ * @param[in]	engine:	pointer to xdma_engine
+ *
+ * @return	none
+ *****************************************************************************/
+void xdma_thread_add_work(struct xdma_engine *engine);
+
+#endif /* XDMA_THREAD_H */
diff --git a/drivers/dma/xilinx/xdma_version.h b/drivers/dma/xilinx/xdma_version.h
new file mode 100644
index 000000000000..bd061b6bc513
--- /dev/null
+++ b/drivers/dma/xilinx/xdma_version.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2016-present,  Xilinx, Inc.
+ */
+
+#ifndef XDMA_VERSION_H
+#define XDMA_VERSION_H
+
+#define DRV_MOD_MAJOR		2021
+#define DRV_MOD_MINOR		4
+#define DRV_MOD_PATCHLEVEL	1
+
+#define DRV_MODULE_VERSION      \
+	__stringify(DRV_MOD_MAJOR) "." \
+	__stringify(DRV_MOD_MINOR) "." \
+	__stringify(DRV_MOD_PATCHLEVEL)
+
+#define DRV_MOD_VERSION_NUMBER  \
+	((DRV_MOD_MAJOR)*1000 + (DRV_MOD_MINOR)*100 + DRV_MOD_PATCHLEVEL)
+
+#endif /* XDMA_VERSION_H */
diff --git a/include/linux/dma/xilinx_xdma.h b/include/linux/dma/xilinx_xdma.h
new file mode 100644
index 000000000000..4a0c3e02ec6f
--- /dev/null
+++ b/include/linux/dma/xilinx_xdma.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2016-present,  Xilinx, Inc.
+ * Copyright (c) 2020-present,  Digiteq Automotive s.r.o.
+ */
+
+#ifndef XILINX_XDMA_H
+#define XILINX_XDMA_H
+
+#include <linux/types.h>
+#include <linux/scatterlist.h>
+#include <linux/interrupt.h>
+
+/*
+ * xdma_device_open - read the pci bars and configure the fpga
+ *	should be called from probe()
+ *	NOTE: user interrupt will not enabled until xdma_user_isr_enable() is called
+ *
+ * @pdev: ptr to pci_dev
+ * @mod_name: the module name to be used for request_irq
+ * @user_max: max # of user/event (interrupts) to be configured
+ * @channel_max: max # of c2h and h2c channels to be configured
+ *	NOTE: if the user/channel provisioned is less than the max specified,
+ *	libxdma will update the user_max/channel_max
+ *
+ * returns a opaque handle (for libxdma to identify the device) NULL, in case of
+ * error
+ */
+void *xdma_device_open(const char *mod_name, struct pci_dev *pdev,
+		 int *user_max, int *h2c_channel_max, int *c2h_channel_max);
+
+/*
+ * xdma_device_close - prepare fpga for removal: disable all interrupts (users
+ *	and xdma) and release all resources. should called from remove()
+ *
+ * @pdev: ptr to struct pci_dev
+ * @tuples: from xdma_device_open()
+ */
+void xdma_device_close(struct pci_dev *pdev, void *dev_handle);
+
+/*
+ * xdma_device_restart - restart the fpga
+ * @pdev: ptr to struct pci_dev
+ * return < 0 in case of error
+ */
+int xdma_device_restart(struct pci_dev *pdev, void *dev_handle);
+
+/*
+ * xdma_user_irq_base - return the base irq number of the user interrupts
+ */
+int xdma_user_irq_base(void *dev_hndl);
+
+/*
+ * xdma_user_isr_enable/disable - enable or disable user interrupt
+ * @pdev: ptr to the pci_dev struct
+ * @mask: bitmask of user interrupts (0 ~ 15)to be registered
+ * return < 0 in case of error
+ */
+int xdma_user_isr_enable(void *dev_hndl, unsigned int mask);
+int xdma_user_isr_disable(void *dev_hndl, unsigned int mask);
+
+/*
+ * xdma_xfer_submit - submit data for dma operation (for both read and write)
+ *	This is a blocking call
+ * @channel: channel number (< channel_max)
+ *	== channel_max means libxdma can pick any channel available:q
+
+ * @dir: DMA_FROM/TO_DEVICE
+ * @offset: offset into the DDR/BRAM memory to read from or write to
+ * @sg_tbl: the scatter-gather list of data buffers
+ * @timeout: timeout in mili-seconds, *currently ignored
+ * return # of bytes transferred or < 0 in case of error
+ */
+ssize_t xdma_xfer_submit(void *dev_hndl, int channel, bool write, u64 ep_addr,
+			 struct sg_table *sgt, bool dma_mapped, int timeout_ms);
+
+ssize_t xdma_xfer_submit_nowait(void *cb_hndl, void *dev_hndl, int channel,
+				bool write, u64 ep_addr, struct sg_table *sgt,
+				bool dma_mapped, int timeout_ms);
+
+
+ssize_t xdma_xfer_completion(void *cb_hndl, void *dev_hndl, int channel,
+			     bool write, u64 ep_addr, struct sg_table *sgt,
+			     bool dma_mapped, int timeout_ms);
+
+void xdma_device_online(struct pci_dev *pdev, void *dev_hndl);
+void xdma_device_offline(struct pci_dev *pdev, void *dev_hndl);
+
+#endif /* XILINX_XDMA_H */
-- 
2.37.2

