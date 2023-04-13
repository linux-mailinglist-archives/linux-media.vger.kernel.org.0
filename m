Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515826E0AB6
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjDMJyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjDMJyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:54:53 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3A69753
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379680; x=1712915680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yu92RQSSPHii1q+dHuPxneIwLZYJBv9iOjuJVcii30I=;
  b=GYMM5r1o/IkIw5/EI+KnpRYwzhhQQsMV1WftRY3kJgAYDlJnV/lfCroq
   l21Adt9jiDhtTATJoR39haMIuGfDcI5nxeKwo9Iu5hMDPjLHeXfneCKET
   +5fbUN0thsbQK97MzUy25S3R2StXO+q0d5UHH/u1fLj+mO7fz5S+xJJNS
   tQ7po2UI0Np5CcKGptM42RmAyobB6usUzf58PWQUhx5GT+BhEoaP3ghh4
   JZJh3o19zW0P5Ombh551lNHbNBOsnOmBC9R8cRqufMj8xGAvVTyujUEfv
   EdjewmYBQWpG/yiNLLKpcE999KfnfjTs2qnXzodXkJfitjSRK4vP/Ykth
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371992924"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371992924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639600018"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639600018"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:54:35 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 03/14] media: intel/ipu6: add IPU6 buttress interface driver
Date:   Thu, 13 Apr 2023 18:04:18 +0800
Message-Id: <20230413100429.919622-4-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

The IPU6 buttress is the interface between IPU device (input system
and processing system) with rest of the SoC. It contains overall IPU
hardware control registers, these control registers are used as the
interfaces with the Intel Converged Security Engine and Punit to do
firmware authentication and power management.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 916 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  | 109 +++
 .../intel/ipu6/ipu6-platform-buttress-regs.h  | 231 +++++
 3 files changed, 1256 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
new file mode 100644
index 000000000000..c42d26522858
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -0,0 +1,916 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/firmware.h>
+#include <linux/iopoll.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-cpd.h"
+#include "ipu6-platform-buttress-regs.h"
+
+#define BOOTLOADER_STATUS_OFFSET       0x15c
+
+#define BOOTLOADER_MAGIC_KEY		0xb00710ad
+
+#define ENTRY	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1
+#define EXIT	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2
+#define QUERY	BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE
+
+#define BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX	10
+
+#define BUTTRESS_POWER_TIMEOUT_US		(200 * USEC_PER_MSEC)
+
+#define BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US	(5 * USEC_PER_SEC)
+#define BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US	(10 * USEC_PER_SEC)
+#define BUTTRESS_CSE_FWRESET_TIMEOUT_US		(100 * USEC_PER_MSEC)
+
+#define BUTTRESS_IPC_TX_TIMEOUT_MS		MSEC_PER_SEC
+#define BUTTRESS_IPC_RX_TIMEOUT_MS		MSEC_PER_SEC
+#define BUTTRESS_IPC_VALIDITY_TIMEOUT_US	(1 * USEC_PER_SEC)
+#define BUTTRESS_TSC_SYNC_TIMEOUT_US		(5 * USEC_PER_MSEC)
+
+#define BUTTRESS_IPC_RESET_RETRY		2000
+#define BUTTRESS_CSE_IPC_RESET_RETRY	4
+#define BUTTRESS_IPC_CMD_SEND_RETRY	1
+
+#define BUTTRESS_MAX_CONSECUTIVE_IRQS	100
+
+static const u32 ipu6_adev_irq_mask[] = {
+	BUTTRESS_ISR_IS_IRQ, BUTTRESS_ISR_PS_IRQ
+};
+
+int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
+			    struct ipu6_buttress_ipc *ipc)
+{
+	unsigned int retries = BUTTRESS_IPC_RESET_RETRY;
+	struct ipu6_buttress *b = &isp->buttress;
+	u32 val = 0, csr_in_clr;
+
+	if (!isp->secure_mode) {
+		dev_info(&isp->pdev->dev, "Skip IPC reset for non-secure mode");
+		return 0;
+	}
+
+	mutex_lock(&b->ipc_mutex);
+
+	/* Clear-by-1 CSR (all bits), corresponding internal states. */
+	val = readl(isp->base + ipc->csr_in);
+	writel(val, isp->base + ipc->csr_in);
+
+	/* Set peer CSR bit IPC_PEER_COMP_ACTIONS_RST_PHASE1 */
+	writel(ENTRY, isp->base + ipc->csr_out);
+	/*
+	 * Clear-by-1 all CSR bits EXCEPT following
+	 * bits:
+	 * A. IPC_PEER_COMP_ACTIONS_RST_PHASE1.
+	 * B. IPC_PEER_COMP_ACTIONS_RST_PHASE2.
+	 * C. Possibly custom bits, depending on
+	 * their role.
+	 */
+	csr_in_clr = BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ |
+		BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID |
+		BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ | QUERY;
+
+	do {
+		usleep_range(400, 500);
+		val = readl(isp->base + ipc->csr_in);
+		switch (val) {
+		case ENTRY | EXIT:
+		case ENTRY | EXIT | QUERY:
+			/*
+			 * 1) Clear-by-1 CSR bits
+			 * (IPC_PEER_COMP_ACTIONS_RST_PHASE1,
+			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2).
+			 * 2) Set peer CSR bit
+			 * IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE.
+			 */
+			writel(ENTRY | EXIT, isp->base + ipc->csr_in);
+			writel(QUERY, isp->base + ipc->csr_out);
+			break;
+		case ENTRY:
+		case ENTRY | QUERY:
+			/*
+			 * 1) Clear-by-1 CSR bits
+			 * (IPC_PEER_COMP_ACTIONS_RST_PHASE1,
+			 * IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE).
+			 * 2) Set peer CSR bit
+			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1.
+			 */
+			writel(ENTRY | QUERY, isp->base + ipc->csr_in);
+			writel(ENTRY, isp->base + ipc->csr_out);
+			break;
+		case EXIT:
+		case EXIT | QUERY:
+			/*
+			 * Clear-by-1 CSR bit
+			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2.
+			 * 1) Clear incoming doorbell.
+			 * 2) Clear-by-1 all CSR bits EXCEPT following
+			 * bits:
+			 * A. IPC_PEER_COMP_ACTIONS_RST_PHASE1.
+			 * B. IPC_PEER_COMP_ACTIONS_RST_PHASE2.
+			 * C. Possibly custom bits, depending on
+			 * their role.
+			 * 3) Set peer CSR bit
+			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2.
+			 */
+			writel(EXIT, isp->base + ipc->csr_in);
+			writel(0, isp->base + ipc->db0_in);
+			writel(csr_in_clr, isp->base + ipc->csr_in);
+			writel(EXIT, isp->base + ipc->csr_out);
+
+			/*
+			 * Read csr_in again to make sure if RST_PHASE2 is done.
+			 * If csr_in is QUERY, it should be handled again.
+			 */
+			usleep_range(200, 300);
+			val = readl(isp->base + ipc->csr_in);
+			if (val & QUERY) {
+				dev_dbg(&isp->pdev->dev,
+					"RST_PHASE2 retry csr_in = %x\n", val);
+				break;
+			}
+			mutex_unlock(&b->ipc_mutex);
+			return 0;
+		case QUERY:
+			/*
+			 * 1) Clear-by-1 CSR bit
+			 * IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE.
+			 * 2) Set peer CSR bit
+			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1
+			 */
+			writel(QUERY, isp->base + ipc->csr_in);
+			writel(ENTRY, isp->base + ipc->csr_out);
+			break;
+		default:
+			dev_warn_ratelimited(&isp->pdev->dev,
+					     "Unexpected CSR 0x%x\n", val);
+			break;
+		}
+	} while (retries--);
+
+	mutex_unlock(&b->ipc_mutex);
+	dev_err(&isp->pdev->dev, "Timed out while waiting for CSE\n");
+
+	return -ETIMEDOUT;
+}
+
+static void
+ipu6_buttress_ipc_validity_close(struct ipu6_device *isp,
+				 struct ipu6_buttress_ipc *ipc)
+{
+	writel(BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ,
+	       isp->base + ipc->csr_out);
+}
+
+static int
+ipu6_buttress_ipc_validity_open(struct ipu6_device *isp,
+				struct ipu6_buttress_ipc *ipc)
+{
+	unsigned int mask = BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID;
+	void __iomem *addr;
+	int ret;
+	u32 val;
+
+	writel(BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ,
+	       isp->base + ipc->csr_out);
+
+	addr = isp->base + ipc->csr_in;
+	ret = readl_poll_timeout(addr, val, val & mask, 200,
+				 BUTTRESS_IPC_VALIDITY_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "CSE validity timeout 0x%x\n", val);
+		ipu6_buttress_ipc_validity_close(isp, ipc);
+	}
+
+	return ret;
+}
+
+static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
+				   struct ipu6_buttress_ipc *ipc, u32 *ipc_msg)
+{
+	if (ipc_msg)
+		*ipc_msg = readl(isp->base + ipc->data0_in);
+	writel(0, isp->base + ipc->db0_in);
+}
+
+static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
+				       enum ipu6_buttress_ipc_domain ipc_domain,
+				       struct ipu6_ipc_buttress_bulk_msg *msgs,
+				       u32 size)
+{
+	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
+	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
+	struct ipu6_buttress *b = &isp->buttress;
+	struct ipu6_buttress_ipc *ipc;
+	u32 val;
+	int ret;
+	int tout;
+
+	ipc = ipc_domain == IPU6_BUTTRESS_IPC_CSE ? &b->cse : &b->ish;
+
+	mutex_lock(&b->ipc_mutex);
+
+	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "IPC validity open failed\n");
+		goto out;
+	}
+
+	tx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_TX_TIMEOUT_MS);
+	rx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_RX_TIMEOUT_MS);
+
+	for (i = 0; i < size; i++) {
+		reinit_completion(&ipc->send_complete);
+		if (msgs[i].require_resp)
+			reinit_completion(&ipc->recv_complete);
+
+		dev_dbg(&isp->pdev->dev, "bulk IPC command: 0x%x\n",
+			msgs[i].cmd);
+		writel(msgs[i].cmd, isp->base + ipc->data0_out);
+
+		val = BUTTRESS_IU2CSEDB0_BUSY | msgs[i].cmd_size;
+
+		writel(val, isp->base + ipc->db0_out);
+
+		tout = wait_for_completion_timeout(&ipc->send_complete,
+						   tx_timeout_jiffies);
+		if (!tout) {
+			dev_err(&isp->pdev->dev, "send IPC response timeout\n");
+			if (!retry--) {
+				ret = -ETIMEDOUT;
+				goto out;
+			}
+
+			/* Try again if CSE is not responding on first try */
+			writel(0, isp->base + ipc->db0_out);
+			i--;
+			continue;
+		}
+
+		retry = BUTTRESS_IPC_CMD_SEND_RETRY;
+
+		if (!msgs[i].require_resp)
+			continue;
+
+		tout = wait_for_completion_timeout(&ipc->recv_complete,
+						   rx_timeout_jiffies);
+		if (!tout) {
+			dev_err(&isp->pdev->dev, "recv IPC response timeout\n");
+			ret = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (ipc->nack_mask &&
+		    (ipc->recv_data & ipc->nack_mask) == ipc->nack) {
+			dev_err(&isp->pdev->dev,
+				"IPC NACK for cmd 0x%x\n", msgs[i].cmd);
+			ret = -EIO;
+			goto out;
+		}
+
+		if (ipc->recv_data != msgs[i].expected_resp) {
+			dev_err(&isp->pdev->dev,
+				"expected resp: 0x%x, IPC response: 0x%x ",
+				msgs[i].expected_resp, ipc->recv_data);
+			ret = -EIO;
+			goto out;
+		}
+	}
+
+	dev_dbg(&isp->pdev->dev, "bulk IPC commands done\n");
+
+out:
+	ipu6_buttress_ipc_validity_close(isp, ipc);
+	mutex_unlock(&b->ipc_mutex);
+	return ret;
+}
+
+static int
+ipu6_buttress_ipc_send(struct ipu6_device *isp,
+		       enum ipu6_buttress_ipc_domain ipc_domain,
+		       u32 ipc_msg, u32 size, bool require_resp,
+		       u32 expected_resp)
+{
+	struct ipu6_ipc_buttress_bulk_msg msg = {
+		.cmd = ipc_msg,
+		.cmd_size = size,
+		.require_resp = require_resp,
+		.expected_resp = expected_resp,
+	};
+
+	return ipu6_buttress_ipc_send_bulk(isp, ipc_domain, &msg, 1);
+}
+
+static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
+{
+	irqreturn_t ret = IRQ_WAKE_THREAD;
+
+	if (!adev || !adev->adrv)
+		return IRQ_NONE;
+
+	if (adev->adrv->isr)
+		ret = adev->adrv->isr(adev);
+
+	if (ret == IRQ_WAKE_THREAD && !adev->adrv->isr_threaded)
+		ret = IRQ_NONE;
+
+	adev->adrv->wake_isr_thread = (ret == IRQ_WAKE_THREAD);
+
+	return ret;
+}
+
+irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
+{
+	struct ipu6_device *isp = isp_ptr;
+	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
+	struct ipu6_buttress *b = &isp->buttress;
+	u32 reg_irq_sts = BUTTRESS_REG_ISR_STATUS;
+	irqreturn_t ret = IRQ_NONE;
+	u32 disable_irqs = 0;
+	u32 irq_status;
+	u32 i, count = 0;
+
+	pm_runtime_get_noresume(&isp->pdev->dev);
+
+	irq_status = readl(isp->base + reg_irq_sts);
+	if (!irq_status) {
+		pm_runtime_put_noidle(&isp->pdev->dev);
+		return IRQ_NONE;
+	}
+
+	do {
+		writel(irq_status, isp->base + BUTTRESS_REG_ISR_CLEAR);
+
+		for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
+			irqreturn_t r = ipu6_buttress_call_isr(adev[i]);
+
+			if (!(irq_status & ipu6_adev_irq_mask[i]))
+				continue;
+
+			if (r == IRQ_WAKE_THREAD) {
+				ret = IRQ_WAKE_THREAD;
+				disable_irqs |= ipu6_adev_irq_mask[i];
+			} else if (ret == IRQ_NONE && r == IRQ_HANDLED) {
+				ret = IRQ_HANDLED;
+			}
+		}
+
+		if ((irq_status & BUTTRESS_EVENT) && ret == IRQ_NONE)
+			ret = IRQ_HANDLED;
+
+		if (irq_status & BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING) {
+			dev_dbg(&isp->pdev->dev,
+				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
+			ipu6_buttress_ipc_recv(isp, &b->cse, &b->cse.recv_data);
+			complete(&b->cse.recv_complete);
+		}
+
+		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
+			dev_dbg(&isp->pdev->dev,
+				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
+			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
+			complete(&b->ish.recv_complete);
+		}
+
+		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
+			dev_dbg(&isp->pdev->dev,
+				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
+			complete(&b->cse.send_complete);
+		}
+
+		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
+			dev_dbg(&isp->pdev->dev,
+				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
+			complete(&b->ish.send_complete);
+		}
+
+		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
+		    ipu6_buttress_get_secure_mode(isp))
+			dev_err(&isp->pdev->dev,
+				"BUTTRESS_ISR_SAI_VIOLATION\n");
+
+		if (irq_status & (BUTTRESS_ISR_IS_FATAL_MEM_ERR |
+				  BUTTRESS_ISR_PS_FATAL_MEM_ERR))
+			dev_err(&isp->pdev->dev,
+				"BUTTRESS_ISR_FATAL_MEM_ERR\n");
+
+		if (irq_status & BUTTRESS_ISR_UFI_ERROR)
+			dev_err(&isp->pdev->dev, "BUTTRESS_ISR_UFI_ERROR\n");
+
+		if (++count == BUTTRESS_MAX_CONSECUTIVE_IRQS) {
+			dev_err(&isp->pdev->dev, "too many consecutive IRQs\n");
+			ret = IRQ_NONE;
+			break;
+		}
+
+		irq_status = readl(isp->base + reg_irq_sts);
+	} while (irq_status && !isp->flr_done);
+
+	if (disable_irqs)
+		writel(BUTTRESS_IRQS & ~disable_irqs,
+		       isp->base + BUTTRESS_REG_ISR_ENABLE);
+
+	pm_runtime_put(&isp->pdev->dev);
+
+	return ret;
+}
+
+irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
+{
+	struct ipu6_device *isp = isp_ptr;
+	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
+	irqreturn_t ret = IRQ_NONE;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
+		if (adev[i] && adev[i]->adrv &&
+		    adev[i]->adrv->wake_isr_thread &&
+		    adev[i]->adrv->isr_threaded(adev[i]) == IRQ_HANDLED)
+			ret = IRQ_HANDLED;
+	}
+
+	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+
+	return ret;
+}
+
+int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
+			bool on)
+{
+	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
+	u32 pwr_sts, val;
+	int ret = 0;
+
+	if (!ctrl)
+		return 0;
+
+	/* Until FLR completion nothing is expected to work */
+	if (isp->flr_done)
+		return 0;
+
+	mutex_lock(&isp->buttress.power_mutex);
+
+	if (!on) {
+		val = 0;
+		pwr_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
+	} else {
+		val = BUTTRESS_FREQ_CTL_START |
+			FIELD_PREP(BUTTRESS_FREQ_CTL_RATIO_MASK,
+				   ctrl->ratio) |
+			FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK,
+				   ctrl->qos_floor) |
+			BUTTRESS_FREQ_CTL_ICCMAX_LEVEL;
+
+		pwr_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
+	}
+
+	writel(val, isp->base + ctrl->freq_ctl);
+
+	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATE,
+				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
+				 100, BUTTRESS_POWER_TIMEOUT_US);
+	if (ret)
+		dev_err(&isp->pdev->dev,
+			"Change power status timeout with 0x%x\n", val);
+
+	ctrl->started = !ret && on;
+
+	mutex_unlock(&isp->buttress.power_mutex);
+
+	return ret;
+}
+
+bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp)
+{
+	u32 val;
+
+	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
+
+	return val & BUTTRESS_SECURITY_CTL_FW_SECURE_MODE;
+}
+
+bool ipu6_buttress_auth_done(struct ipu6_device *isp)
+{
+	u32 val;
+
+	if (!isp->secure_mode)
+		return true;
+
+	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
+
+	return (val & BUTTRESS_SECURITY_CTL_FW_SETUP_MASK) ==
+		BUTTRESS_SECURITY_CTL_AUTH_DONE;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_auth_done, INTEL_IPU6);
+
+int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
+{
+	int ret;
+	u32 val;
+
+	if (!isp->secure_mode) {
+		dev_dbg(&isp->pdev->dev, "Skip auth for non-secure mode\n");
+		return 0;
+	}
+
+	writel(BUTTRESS_FW_RESET_CTL_START, isp->base +
+	       BUTTRESS_REG_FW_RESET_CTL);
+
+	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_FW_RESET_CTL, val,
+				 val & BUTTRESS_FW_RESET_CTL_DONE, 500,
+				 BUTTRESS_CSE_FWRESET_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev,
+			"Time out while resetting authentication state\n");
+	} else {
+		dev_info(&isp->pdev->dev, "FW reset for authentication done\n");
+		writel(0, isp->base + BUTTRESS_REG_FW_RESET_CTL);
+		/* leave some time for HW restore */
+		usleep_range(800, 1000);
+	}
+
+	return ret;
+}
+
+int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
+			       const struct firmware *fw, struct sg_table *sgt)
+{
+	struct page **pages;
+	const void *addr;
+	unsigned long n_pages;
+	unsigned int i;
+	int ret;
+
+	n_pages = PAGE_ALIGN(fw->size) >> PAGE_SHIFT;
+
+	pages = kmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	addr = fw->data;
+	for (i = 0; i < n_pages; i++) {
+		struct page *p = vmalloc_to_page(addr);
+
+		if (!p) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		pages[i] = p;
+		addr += PAGE_SIZE;
+	}
+
+	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0, fw->size,
+					GFP_KERNEL);
+	if (ret) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = dma_map_sgtable(&sys->dev, sgt, DMA_TO_DEVICE, 0);
+	if (ret < 0) {
+		ret = -ENOMEM;
+		sg_free_table(sgt);
+		goto out;
+	}
+
+	dma_sync_sgtable_for_device(&sys->dev, sgt, DMA_TO_DEVICE);
+
+out:
+	kfree(pages);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, INTEL_IPU6);
+
+int ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
+				 struct sg_table *sgt)
+{
+	dma_unmap_sgtable(&sys->dev, sgt, DMA_TO_DEVICE, 0);
+	sg_free_table(sgt);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_unmap_fw_image, INTEL_IPU6);
+
+int ipu6_buttress_authenticate(struct ipu6_device *isp)
+{
+	struct ipu6_buttress *b = &isp->buttress;
+	struct ipu6_psys_pdata *psys_pdata;
+	u32 data, mask, done, fail;
+	int ret;
+
+	if (!isp->secure_mode) {
+		dev_dbg(&isp->pdev->dev, "Skip auth for non-secure mode\n");
+		return 0;
+	}
+
+	psys_pdata = isp->psys->pdata;
+
+	mutex_lock(&b->auth_mutex);
+
+	if (ipu6_buttress_auth_done(isp)) {
+		ret = 0;
+		goto out_unlock;
+	}
+
+	/*
+	 * Write address of FIT table to FW_SOURCE register
+	 * Let's use fw address. I.e. not using FIT table yet
+	 */
+	data = lower_32_bits(isp->psys->pkg_dir_dma_addr);
+	writel(data, isp->base + BUTTRESS_REG_FW_SOURCE_BASE_LO);
+
+	data = upper_32_bits(isp->psys->pkg_dir_dma_addr);
+	writel(data, isp->base + BUTTRESS_REG_FW_SOURCE_BASE_HI);
+
+	/*
+	 * Write boot_load into IU2CSEDATA0
+	 * Write sizeof(boot_load) | 0x2 << CLIENT_ID to
+	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
+	 */
+	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
+
+	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
+				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
+				     1, true,
+				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "CSE boot_load failed\n");
+		goto out_unlock;
+	}
+
+	mask = BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
+	done = BUTTRESS_SECURITY_CTL_FW_SETUP_DONE;
+	fail = BUTTRESS_SECURITY_CTL_AUTH_FAILED;
+	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
+				 ((data & mask) == done ||
+				  (data & mask) == fail), 500,
+				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "CSE boot_load timeout\n");
+		goto out_unlock;
+	}
+
+	if ((data & mask) == fail) {
+		dev_err(&isp->pdev->dev, "CSE auth failed\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = readl_poll_timeout(psys_pdata->base + BOOTLOADER_STATUS_OFFSET,
+				 data, data == BOOTLOADER_MAGIC_KEY, 500,
+				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "Unexpected magic number 0x%x\n",
+			data);
+		goto out_unlock;
+	}
+
+	/*
+	 * Write authenticate_run into IU2CSEDATA0
+	 * Write sizeof(boot_load) | 0x2 << CLIENT_ID to
+	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
+	 */
+	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
+	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
+				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
+				     1, true,
+				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "CSE authenticate_run failed\n");
+		goto out_unlock;
+	}
+
+	done = BUTTRESS_SECURITY_CTL_AUTH_DONE;
+	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
+				 ((data & mask) == done ||
+				  (data & mask) == fail), 500,
+				 BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev, "CSE authenticate timeout\n");
+		goto out_unlock;
+	}
+
+	if ((data & mask) == fail) {
+		dev_err(&isp->pdev->dev, "CSE boot_load failed\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	dev_info(&isp->pdev->dev, "CSE authenticate_run done\n");
+
+out_unlock:
+	mutex_unlock(&b->auth_mutex);
+
+	return ret;
+}
+
+static int ipu6_buttress_send_tsc_request(struct ipu6_device *isp)
+{
+	u32 val, mask, done;
+	int ret;
+
+	mask = BUTTRESS_PWR_STATE_HH_STATUS_MASK;
+
+	writel(BUTTRESS_FABRIC_CMD_START_TSC_SYNC,
+	       isp->base + BUTTRESS_REG_FABRIC_CMD);
+
+	val = readl(isp->base + BUTTRESS_REG_PWR_STATE);
+	val = FIELD_GET(mask, val);
+	if (val == BUTTRESS_PWR_STATE_HH_STATE_ERR) {
+		dev_err(&isp->pdev->dev, "Start tsc sync failed\n");
+		return -EINVAL;
+	}
+
+	done = BUTTRESS_PWR_STATE_HH_STATE_DONE;
+	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATE, val,
+				 FIELD_GET(mask, val) == done, 500,
+				 BUTTRESS_TSC_SYNC_TIMEOUT_US);
+	if (ret)
+		dev_err(&isp->pdev->dev, "Start tsc sync timeout\n");
+
+	return ret;
+}
+
+int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
+{
+	unsigned int i;
+
+	for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+		u32 val;
+		int ret;
+
+		ret = ipu6_buttress_send_tsc_request(isp);
+		if (ret != -ETIMEDOUT)
+			return ret;
+
+		val = readl(isp->base + BUTTRESS_REG_TSW_CTL);
+		val = val | BUTTRESS_TSW_CTL_SOFT_RESET;
+		writel(val, isp->base + BUTTRESS_REG_TSW_CTL);
+		val = val & ~BUTTRESS_TSW_CTL_SOFT_RESET;
+		writel(val, isp->base + BUTTRESS_REG_TSW_CTL);
+	}
+
+	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
+
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_start_tsc_sync, INTEL_IPU6);
+
+int ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val)
+{
+	u32 tsc_hi_1, tsc_hi_2, tsc_lo;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	tsc_hi_1 = readl(isp->base + BUTTRESS_REG_TSC_HI);
+	tsc_lo = readl(isp->base + BUTTRESS_REG_TSC_LO);
+	tsc_hi_2 = readl(isp->base + BUTTRESS_REG_TSC_HI);
+	if (tsc_hi_1 == tsc_hi_2) {
+		*val = (u64)tsc_hi_1 << 32 | tsc_lo;
+	} else {
+		/* Check if TSC has rolled over */
+		if (tsc_lo & BIT(31))
+			*val = (u64)tsc_hi_1 << 32 | tsc_lo;
+		else
+			*val = (u64)tsc_hi_2 << 32 | tsc_lo;
+	}
+	local_irq_restore(flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_read, INTEL_IPU6);
+
+u64 ipu6_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu6_device *isp)
+{
+	u64 ns = ticks * 10000;
+
+	/*
+	 * converting TSC tick count to ns is calculated by:
+	 * Example (TSC clock frequency is 19.2MHz):
+	 * ns = ticks * 1000 000 000 / 19.2Mhz
+	 *    = ticks * 1000 000 000 / 19200000Hz
+	 *    = ticks * 10000 / 192 ns
+	 */
+	return div_u64(ns, isp->buttress.ref_clk);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_ticks_to_ns, INTEL_IPU6);
+
+int ipu6_buttress_restore(struct ipu6_device *isp)
+{
+	struct ipu6_buttress *b = &isp->buttress;
+
+	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
+	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	writel(b->wdt_cached_value, isp->base + BUTTRESS_REG_WDT);
+
+	return 0;
+}
+
+int ipu6_buttress_init(struct ipu6_device *isp)
+{
+	int ret, ipc_reset_retry = BUTTRESS_CSE_IPC_RESET_RETRY;
+	struct ipu6_buttress *b = &isp->buttress;
+	u32 val;
+
+	mutex_init(&b->power_mutex);
+	mutex_init(&b->auth_mutex);
+	mutex_init(&b->cons_mutex);
+	mutex_init(&b->ipc_mutex);
+	init_completion(&b->ish.send_complete);
+	init_completion(&b->cse.send_complete);
+	init_completion(&b->ish.recv_complete);
+	init_completion(&b->cse.recv_complete);
+
+	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
+	b->cse.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
+	b->cse.csr_in = BUTTRESS_REG_CSE2IUCSR;
+	b->cse.csr_out = BUTTRESS_REG_IU2CSECSR;
+	b->cse.db0_in = BUTTRESS_REG_CSE2IUDB0;
+	b->cse.db0_out = BUTTRESS_REG_IU2CSEDB0;
+	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
+	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
+
+	/* no ISH on IPU6 */
+	memset(&b->ish, 0, sizeof(b->ish));
+	INIT_LIST_HEAD(&b->constraints);
+
+	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
+	dev_info(&isp->pdev->dev, "IPU6 in %s mode\n",
+		 isp->secure_mode ? "secure" : "non-secure");
+
+	dev_info(&isp->pdev->dev, "IPU6 secure touch = 0x%x\n",
+		 readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH));
+
+	dev_info(&isp->pdev->dev, "IPU6 camera mask = 0x%x\n",
+		 readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
+
+	b->wdt_cached_value = readl(isp->base + BUTTRESS_REG_WDT);
+	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
+	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+
+	/* get ref_clk frequency by reading the indication in btrs control */
+	val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
+	val = FIELD_GET(BUTTRESS_REG_BTRS_CTRL_REF_CLK_IND, val);
+
+	switch (val) {
+	case 0x0:
+		b->ref_clk = 240;
+		break;
+	case 0x1:
+		b->ref_clk = 192;
+		break;
+	case 0x2:
+		b->ref_clk = 384;
+		break;
+	default:
+		dev_warn(&isp->pdev->dev,
+			 "Unsupported ref clock, use 19.2Mhz by default.\n");
+		b->ref_clk = 192;
+		break;
+	}
+
+	/* Retry couple of times in case of CSE initialization is delayed */
+	do {
+		ret = ipu6_buttress_ipc_reset(isp, &b->cse);
+		if (ret) {
+			dev_warn(&isp->pdev->dev,
+				 "IPC reset protocol failed, retrying\n");
+		} else {
+			dev_info(&isp->pdev->dev, "IPC reset done\n");
+			return 0;
+		}
+	} while (ipc_reset_retry--);
+
+	dev_err(&isp->pdev->dev, "IPC reset protocol failed\n");
+
+	mutex_destroy(&b->power_mutex);
+	mutex_destroy(&b->auth_mutex);
+	mutex_destroy(&b->cons_mutex);
+	mutex_destroy(&b->ipc_mutex);
+
+	return ret;
+}
+
+void ipu6_buttress_exit(struct ipu6_device *isp)
+{
+	struct ipu6_buttress *b = &isp->buttress;
+
+	writel(0, isp->base + BUTTRESS_REG_ISR_ENABLE);
+
+	mutex_destroy(&b->power_mutex);
+	mutex_destroy(&b->auth_mutex);
+	mutex_destroy(&b->cons_mutex);
+	mutex_destroy(&b->ipc_mutex);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
new file mode 100644
index 000000000000..c5a0b1d0c851
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_BUTTRESS_H
+#define IPU6_BUTTRESS_H
+
+#include <linux/interrupt.h>
+#include <linux/spinlock.h>
+
+struct firmware;
+struct ipu6_device;
+struct ipu6_bus_device;
+
+#define IPU6_BUTTRESS_NUM_OF_SENS_CKS	3
+#define IPU6_BUTTRESS_NUM_OF_PLL_CKS	3
+
+#define BUTTRESS_PS_FREQ_STEP		25U
+#define BUTTRESS_MIN_FORCE_PS_FREQ	(BUTTRESS_PS_FREQ_STEP * 8)
+#define BUTTRESS_MAX_FORCE_PS_FREQ	(BUTTRESS_PS_FREQ_STEP * 32)
+
+#define BUTTRESS_IS_FREQ_STEP		25U
+#define BUTTRESS_MIN_FORCE_IS_FREQ	(BUTTRESS_IS_FREQ_STEP * 8)
+#define BUTTRESS_MAX_FORCE_IS_FREQ	(BUTTRESS_IS_FREQ_STEP * 16)
+
+struct ipu6_buttress_ctrl {
+	u32 freq_ctl, pwr_sts_shift, pwr_sts_mask, pwr_sts_on, pwr_sts_off;
+	unsigned int ratio;
+	unsigned int qos_floor;
+	bool started;
+};
+
+struct ipu6_buttress_fused_freqs {
+	unsigned int min_freq;
+	unsigned int max_freq;
+	unsigned int efficient_freq;
+};
+
+struct ipu6_buttress_ipc {
+	struct completion send_complete;
+	struct completion recv_complete;
+	u32 nack;
+	u32 nack_mask;
+	u32 recv_data;
+	u32 csr_out;
+	u32 csr_in;
+	u32 db0_in;
+	u32 db0_out;
+	u32 data0_out;
+	u32 data0_in;
+};
+
+struct ipu6_buttress {
+	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
+	struct ipu6_buttress_ipc cse;
+	struct ipu6_buttress_ipc ish;
+	struct list_head constraints;
+	u32 wdt_cached_value;
+	bool force_suspend;
+	u32 ref_clk;
+};
+
+struct ipu6_buttress_sensor_clk_freq {
+	unsigned int rate;
+	unsigned int val;
+};
+
+enum ipu6_buttress_ipc_domain {
+	IPU6_BUTTRESS_IPC_CSE,
+	IPU6_BUTTRESS_IPC_ISH,
+};
+
+struct ipu6_buttress_constraint {
+	struct list_head list;
+	unsigned int min_freq;
+};
+
+struct ipu6_ipc_buttress_bulk_msg {
+	u32 cmd;
+	u32 expected_resp;
+	bool require_resp;
+	u8 cmd_size;
+};
+
+int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
+			    struct ipu6_buttress_ipc *ipc);
+int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
+			       const struct firmware *fw,
+			       struct sg_table *sgt);
+int ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
+				 struct sg_table *sgt);
+int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
+			bool on);
+bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp);
+int ipu6_buttress_authenticate(struct ipu6_device *isp);
+int ipu6_buttress_reset_authentication(struct ipu6_device *isp);
+bool ipu6_buttress_auth_done(struct ipu6_device *isp);
+int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp);
+int ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val);
+u64 ipu6_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu6_device *isp);
+
+irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr);
+irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr);
+int ipu6_buttress_debugfs_init(struct ipu6_device *isp);
+int ipu6_buttress_init(struct ipu6_device *isp);
+void ipu6_buttress_exit(struct ipu6_device *isp);
+void ipu6_buttress_csi_port_config(struct ipu6_device *isp,
+				   u32 legacy, u32 combo);
+int ipu6_buttress_restore(struct ipu6_device *isp);
+#endif /* IPU6_BUTTRESS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
new file mode 100644
index 000000000000..b460a750d293
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -0,0 +1,231 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2023 Intel Corporation */
+
+#ifndef IPU6_PLATFORM_BUTTRESS_REGS_H
+#define IPU6_PLATFORM_BUTTRESS_REGS_H
+
+/* IS_WORKPOINT_REQ */
+#define IPU6_BUTTRESS_REG_IS_FREQ_CTL		0x34
+/* PS_WORKPOINT_REQ */
+#define IPU6_BUTTRESS_REG_PS_FREQ_CTL		0x38
+
+#define IPU6_IS_FREQ_MAX		533
+#define IPU6_IS_FREQ_MIN		200
+#define IPU6_PS_FREQ_MAX		450
+#define IPU6_IS_FREQ_RATIO_BASE		25
+#define IPU6_PS_FREQ_RATIO_BASE		25
+
+/* should be tuned for real silicon */
+#define IPU6_IS_FREQ_CTL_DEFAULT_RATIO		0x08
+#define IPU6SE_IS_FREQ_CTL_DEFAULT_RATIO	0x0a
+#define IPU6_PS_FREQ_CTL_DEFAULT_RATIO		0x0d
+
+#define IPU6_IS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO	0x10
+#define IPU6_PS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO	0x0708
+
+#define IPU6_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	3
+#define IPU6_BUTTRESS_PWR_STATE_IS_PWR_MASK	GENMASK(4, 3)
+
+#define IPU6_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	6
+#define IPU6_BUTTRESS_PWR_STATE_PS_PWR_MASK	GENMASK(7, 6)
+
+#define IPU6_BUTTRESS_PWR_STATE_DN_DONE		0x0
+#define IPU6_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
+#define IPU6_BUTTRESS_PWR_STATE_DN_PROCESS	0x2
+#define IPU6_BUTTRESS_PWR_STATE_UP_DONE		0x3
+
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_0	0x270
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_1	0x274
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_2	0x278
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_3	0x27c
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_4	0x280
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_5	0x284
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_6	0x288
+#define IPU6_BUTTRESS_REG_FPGA_SUPPORT_7	0x28c
+
+#define BUTTRESS_REG_WDT			0x8
+#define BUTTRESS_REG_BTRS_CTRL			0xc
+#define BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC0	BIT(0)
+#define BUTTRESS_REG_BTRS_CTRL_STALL_MODE_VC1	BIT(1)
+#define BUTTRESS_REG_BTRS_CTRL_REF_CLK_IND	GENMASK(9, 8)
+
+#define BUTTRESS_REG_FW_RESET_CTL	0x30
+#define BUTTRESS_FW_RESET_CTL_START	BIT(0)
+#define BUTTRESS_FW_RESET_CTL_DONE	BIT(1)
+
+#define BUTTRESS_REG_IS_FREQ_CTL	0x34
+#define BUTTRESS_REG_PS_FREQ_CTL	0x38
+
+#define BUTTRESS_FREQ_CTL_START		BIT(31)
+#define BUTTRESS_FREQ_CTL_ICCMAX_LEVEL		GENMASK(19, 16)
+#define BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK	GENMASK(15, 8)
+#define BUTTRESS_FREQ_CTL_RATIO_MASK	GENMASK(7, 0)
+
+#define BUTTRESS_REG_PWR_STATE	0x5c
+
+#define BUTTRESS_PWR_STATE_RESET		0x0
+#define BUTTRESS_PWR_STATE_PWR_ON_DONE		0x1
+#define BUTTRESS_PWR_STATE_PWR_RDY		0x3
+#define BUTTRESS_PWR_STATE_PWR_IDLE		0x4
+
+#define BUTTRESS_PWR_STATE_HH_STATUS_MASK	GENMASK(12, 11)
+
+enum {
+	BUTTRESS_PWR_STATE_HH_STATE_IDLE,
+	BUTTRESS_PWR_STATE_HH_STATE_IN_PRGS,
+	BUTTRESS_PWR_STATE_HH_STATE_DONE,
+	BUTTRESS_PWR_STATE_HH_STATE_ERR,
+};
+
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_MASK	GENMASK(23, 19)
+
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_IDLE			0x0
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_WAIT_4_PLL_CMP		0x1
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_WAIT_4_CLKACK		0x2
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_WAIT_4_PG_ACK		0x3
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_RST_ASSRT_CYCLES		0x4
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_STOP_CLK_CYCLES1		0x5
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_STOP_CLK_CYCLES2		0x6
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_RST_DEASSRT_CYCLES	0x7
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_WAIT_4_FUSE_WR_CMP	0x8
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_BRK_POINT			0x9
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_IS_RDY			0xa
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_HALT_HALTED		0xb
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_RST_DURATION_CNT3		0xc
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_WAIT_4_CLKACK_PD		0xd
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_PD_BRK_POINT		0xe
+#define BUTTRESS_PWR_STATE_IS_PWR_FSM_WAIT_4_PD_PG_ACK0		0xf
+
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_MASK	GENMASK(28, 24)
+
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_IDLE			0x0
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_PU_PLL_IP_RDY	0x1
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_RO_PRE_CNT_EXH	0x2
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_PU_VGI_PWRGOOD	0x3
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_RO_POST_CNT_EXH	0x4
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WR_PLL_RATIO		0x5
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_PU_PLL_CMP		0x6
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_PU_CLKACK		0x7
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_RST_ASSRT_CYCLES		0x8
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_STOP_CLK_CYCLES1		0x9
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_STOP_CLK_CYCLES2		0xa
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_RST_DEASSRT_CYCLES	0xb
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_PU_BRK_PNT		0xc
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_FUSE_ACCPT		0xd
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_PS_PWR_UP			0xf
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_4_HALTED		0x10
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_RESET_CNT3		0x11
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_PD_CLKACK		0x12
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_PD_OFF_IND		0x13
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_DVFS_PH4		0x14
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_DVFS_PLL_CMP		0x15
+#define BUTTRESS_PWR_STATE_PS_PWR_FSM_WAIT_DVFS_CLKACK		0x16
+
+#define BUTTRESS_REG_SECURITY_CTL	0x300
+#define BUTTRESS_REG_SKU		0x314
+#define BUTTRESS_REG_SECURITY_TOUCH	0x318
+#define BUTTRESS_REG_CAMERA_MASK	0x84
+
+#define BUTTRESS_SECURITY_CTL_FW_SECURE_MODE	BIT(16)
+#define BUTTRESS_SECURITY_CTL_FW_SETUP_MASK	GENMASK(4, 0)
+
+#define BUTTRESS_SECURITY_CTL_FW_SETUP_DONE		BIT(0)
+#define BUTTRESS_SECURITY_CTL_AUTH_DONE			BIT(1)
+#define BUTTRESS_SECURITY_CTL_AUTH_FAILED		BIT(3)
+
+#define BUTTRESS_REG_FW_SOURCE_BASE_LO	0x78
+#define BUTTRESS_REG_FW_SOURCE_BASE_HI	0x7C
+#define BUTTRESS_REG_FW_SOURCE_SIZE	0x80
+
+#define BUTTRESS_REG_ISR_STATUS		0x90
+#define BUTTRESS_REG_ISR_ENABLED_STATUS	0x94
+#define BUTTRESS_REG_ISR_ENABLE		0x98
+#define BUTTRESS_REG_ISR_CLEAR		0x9C
+
+#define BUTTRESS_ISR_IS_IRQ			BIT(0)
+#define BUTTRESS_ISR_PS_IRQ			BIT(1)
+#define BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE	BIT(2)
+#define BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH	BIT(3)
+#define BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING	BIT(4)
+#define BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING	BIT(5)
+#define BUTTRESS_ISR_CSE_CSR_SET		BIT(6)
+#define BUTTRESS_ISR_ISH_CSR_SET		BIT(7)
+#define BUTTRESS_ISR_SPURIOUS_CMP		BIT(8)
+#define BUTTRESS_ISR_WATCHDOG_EXPIRED		BIT(9)
+#define BUTTRESS_ISR_PUNIT_2_IUNIT_IRQ		BIT(10)
+#define BUTTRESS_ISR_SAI_VIOLATION		BIT(11)
+#define BUTTRESS_ISR_HW_ASSERTION		BIT(12)
+#define BUTTRESS_ISR_IS_CORRECTABLE_MEM_ERR	BIT(13)
+#define BUTTRESS_ISR_IS_FATAL_MEM_ERR		BIT(14)
+#define BUTTRESS_ISR_IS_NON_FATAL_MEM_ERR	BIT(15)
+#define BUTTRESS_ISR_PS_CORRECTABLE_MEM_ERR	BIT(16)
+#define BUTTRESS_ISR_PS_FATAL_MEM_ERR		BIT(17)
+#define BUTTRESS_ISR_PS_NON_FATAL_MEM_ERR	BIT(18)
+#define BUTTRESS_ISR_PS_FAST_THROTTLE		BIT(19)
+#define BUTTRESS_ISR_UFI_ERROR			BIT(20)
+
+#define BUTTRESS_REG_IU2CSEDB0	0x100
+
+#define BUTTRESS_IU2CSEDB0_BUSY		BIT(31)
+#define BUTTRESS_IU2CSEDB0_IPC_CLIENT_ID_VAL	2
+
+#define BUTTRESS_REG_IU2CSEDATA0	0x104
+
+#define BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD		1
+#define BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN		2
+#define BUTTRESS_IU2CSEDATA0_IPC_AUTH_REPLACE		3
+#define BUTTRESS_IU2CSEDATA0_IPC_UPDATE_SECURE_TOUCH	16
+
+#define BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE			BIT(0)
+#define BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE			BIT(1)
+#define BUTTRESS_CSE2IUDATA0_IPC_AUTH_REPLACE_DONE		BIT(2)
+#define BUTTRESS_CSE2IUDATA0_IPC_UPDATE_SECURE_TOUCH_DONE	BIT(4)
+
+#define BUTTRESS_REG_IU2CSECSR		0x108
+
+#define BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1		BIT(0)
+#define BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2		BIT(1)
+#define BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE	BIT(2)
+#define BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ		BIT(3)
+#define BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID			BIT(4)
+#define BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ		BIT(5)
+
+#define BUTTRESS_REG_CSE2IUDB0		0x304
+#define BUTTRESS_REG_CSE2IUCSR		0x30C
+#define BUTTRESS_REG_CSE2IUDATA0	0x308
+
+/* 0x20 == NACK, 0xf == unknown command */
+#define BUTTRESS_CSE2IUDATA0_IPC_NACK      0xf20
+#define BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK GENMASK(15, 0)
+
+#define BUTTRESS_REG_ISH2IUCSR		0x50
+#define BUTTRESS_REG_ISH2IUDB0		0x54
+#define BUTTRESS_REG_ISH2IUDATA0	0x58
+
+#define BUTTRESS_REG_IU2ISHDB0		0x10C
+#define BUTTRESS_REG_IU2ISHDATA0	0x110
+#define BUTTRESS_REG_IU2ISHDATA1	0x114
+#define BUTTRESS_REG_IU2ISHCSR		0x118
+
+#define BUTTRESS_REG_FABRIC_CMD		0x88
+
+#define BUTTRESS_FABRIC_CMD_START_TSC_SYNC	BIT(0)
+#define BUTTRESS_FABRIC_CMD_IS_DRAIN		BIT(4)
+
+#define BUTTRESS_REG_TSW_CTL		0x120
+#define BUTTRESS_TSW_CTL_SOFT_RESET	BIT(8)
+
+#define BUTTRESS_REG_TSC_LO	0x164
+#define BUTTRESS_REG_TSC_HI	0x168
+
+#define BUTTRESS_IRQS		(BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING |	\
+				 BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE |	\
+				 BUTTRESS_ISR_IS_IRQ |			\
+				 BUTTRESS_ISR_PS_IRQ)
+
+#define BUTTRESS_EVENT		 (BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING | \
+				  BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING | \
+				  BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE |	\
+				  BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH |	\
+				  BUTTRESS_ISR_SAI_VIOLATION)
+#endif /* IPU6_PLATFORM_BUTTRESS_REGS_H */
-- 
2.39.1

