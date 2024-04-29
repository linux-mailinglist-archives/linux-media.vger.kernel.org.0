Return-Path: <linux-media+bounces-10300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66408B5137
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86CAB280C8C
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 06:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F025011C85;
	Mon, 29 Apr 2024 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAaNqnCR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4DC101DA
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371565; cv=none; b=j0FINWyEoqq3vQIsESKlNs7qZyM/80257emDdwiLZDjMRlI3RLpwfPCjgMlCpRDMn9c9A/isBjnEuQ88DO35zdaZLv2lMdA+cnSQ8jh+MRO9aGCYySZHiNMjqWYZ90PTViFOM3Ut13dhsGkygPK8p/SzVKvtYQd6gmPJOKzifdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371565; c=relaxed/simple;
	bh=dJ9Nc9xeIo1sJe9w9xMinCh0UZR1+NS9Jvn7/vlpSYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VpqOPBGl/A0+A9lwZPqQvLAyuyWK9jsYTQ66h5/WjP4dE8TmdXGmRGFQHXMWoNH+8+0uKcadkDe1bhysjij9jUWllbnceKuXtZVAIXkhmE+PX7qzd+v1PWeg/4tqnUV5z5EQuQ8NDjysURpRpiAjpduiSgSPWEvb2BsT5zOwXHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAaNqnCR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371563; x=1745907563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dJ9Nc9xeIo1sJe9w9xMinCh0UZR1+NS9Jvn7/vlpSYE=;
  b=bAaNqnCRzPgBh09nhLZ0Mqdj0IaWnhgrhNjpfGFRxuA5exsT4zzumoCp
   HprAbAOYFkCxd2hCM17jVegQqaccCm2vkCHjxpW6C45xwNO2nbxfQO3am
   pRH6J7t9zn0JxKCYL79JkrZcW3A/6iXGPY4hluCKXGNNNCQ673NcWG5Ya
   s85NcpikxCAfoXHNtsk3X/F/a3WPqyTpN/ExUIRvTeQ/L5Ubi77pPYBgj
   ELFX6oktI6LXOW9tK1aZt8CL/cLlr8KCIW8ycn/itNwS8bAzycSOUi7Kx
   iX+iq5z74psvymVWtSU4a17h2DkLnxCk9TstMSj+ypQB8eYvWvvIrulzB
   Q==;
X-CSE-ConnectionGUID: OLroBZsaS7W48Nx29PaXWw==
X-CSE-MsgGUID: KIRmoXHmQna8ToLVtjadUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9851185"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="9851185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:23 -0700
X-CSE-ConnectionGUID: m1S4JhVXTrqxcn0URSGh3g==
X-CSE-MsgGUID: Xgv/kVElRCOXk7OY0obBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30811522"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:18 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 609FF120234;
	Mon, 29 Apr 2024 09:19:14 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v7 10/18] media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
Date: Mon, 29 Apr 2024 09:18:45 +0300
Message-Id: <20240429061853.983538-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
References: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Input system CSI2 receiver is exposed as a v4l2 sub-device. Each CSI2
sub-device represent one single CSI2 hardware port which be linked with
external sub-device such camera sensor by linked with ISYS CSI2's sink
pad. The CSI2 source pad is linked to the sink pad of video capture device.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 658 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  82 +++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 398 +++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  59 ++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  | 172 +++++
 5 files changed, 1369 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
new file mode 100644
index 000000000000..e8d93aa7fc6d
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -0,0 +1,658 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/minmax.h>
+#include <linux/sprintf.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-isys-subdev.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+
+static const u32 csi2_supported_codes[] = {
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	0
+};
+
+/*
+ * Strings corresponding to CSI-2 receiver errors are here.
+ * Corresponding macros are defined in the header file.
+ */
+static const struct ipu6_csi2_error dphy_rx_errors[] = {
+	{ "Single packet header error corrected", true },
+	{ "Multiple packet header errors detected", true },
+	{ "Payload checksum (CRC) error", true },
+	{ "Transfer FIFO overflow", false },
+	{ "Reserved short packet data type detected", true },
+	{ "Reserved long packet data type detected", true },
+	{ "Incomplete long packet detected", false },
+	{ "Frame sync error", false },
+	{ "Line sync error", false },
+	{ "DPHY recoverable synchronization error", true },
+	{ "DPHY fatal error", false },
+	{ "DPHY elastic FIFO overflow", false },
+	{ "Inter-frame short packet discarded", true },
+	{ "Inter-frame long packet discarded", true },
+	{ "MIPI pktgen overflow", false },
+	{ "MIPI pktgen data loss", false },
+	{ "FIFO overflow", false },
+	{ "Lane deskew", false },
+	{ "SOT sync error", false },
+	{ "HSIDLE detected", false }
+};
+
+s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
+{
+	struct media_pad *src_pad;
+	struct v4l2_subdev *ext_sd;
+	struct device *dev;
+
+	if (!csi2)
+		return -EINVAL;
+
+	dev = &csi2->isys->adev->auxdev.dev;
+	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	if (IS_ERR(src_pad)) {
+		dev_err(dev, "can't get source pad of %s (%ld)\n",
+			csi2->asd.sd.name, PTR_ERR(src_pad));
+		return PTR_ERR(src_pad);
+	}
+
+	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
+		return -ENODEV;
+
+	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
+}
+
+static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				struct v4l2_event_subscription *sub)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+
+	dev_dbg(dev, "csi2 subscribe event(type %u id %u)\n",
+		sub->type, sub->id);
+
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 10, NULL);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_core_ops csi2_sd_core_ops = {
+	.subscribe_event = csi2_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+/*
+ * The input system CSI2+ receiver has several
+ * parameters affecting the receiver timings. These depend
+ * on the MIPI bus frequency F in Hz (sensor transmitter rate)
+ * as follows:
+ *	register value = (A/1e9 + B * UI) / COUNT_ACC
+ * where
+ *	UI = 1 / (2 * F) in seconds
+ *	COUNT_ACC = counter accuracy in seconds
+ *	COUNT_ACC = 0.125 ns = 1 / 8 ns, ACCINV = 8.
+ *
+ * A and B are coefficients from the table below,
+ * depending whether the register minimum or maximum value is
+ * calculated.
+ *				       Minimum     Maximum
+ * Clock lane			       A     B     A     B
+ * reg_rx_csi_dly_cnt_termen_clane     0     0    38     0
+ * reg_rx_csi_dly_cnt_settle_clane    95    -8   300   -16
+ * Data lanes
+ * reg_rx_csi_dly_cnt_termen_dlane0    0     0    35     4
+ * reg_rx_csi_dly_cnt_settle_dlane0   85    -2   145    -6
+ * reg_rx_csi_dly_cnt_termen_dlane1    0     0    35     4
+ * reg_rx_csi_dly_cnt_settle_dlane1   85    -2   145    -6
+ * reg_rx_csi_dly_cnt_termen_dlane2    0     0    35     4
+ * reg_rx_csi_dly_cnt_settle_dlane2   85    -2   145    -6
+ * reg_rx_csi_dly_cnt_termen_dlane3    0     0    35     4
+ * reg_rx_csi_dly_cnt_settle_dlane3   85    -2   145    -6
+ *
+ * We use the minimum values of both A and B.
+ */
+
+#define DIV_SHIFT	8
+#define CSI2_ACCINV	8
+
+static u32 calc_timing(s32 a, s32 b, s64 link_freq, s32 accinv)
+{
+	return accinv * a + (accinv * b * (500000000 >> DIV_SHIFT)
+			     / (s32)(link_freq >> DIV_SHIFT));
+}
+
+static int
+ipu6_isys_csi2_calc_timing(struct ipu6_isys_csi2 *csi2,
+			   struct ipu6_isys_csi2_timing *timing, s32 accinv)
+{
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	s64 link_freq;
+
+	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
+	if (link_freq < 0)
+		return link_freq;
+
+	timing->ctermen = calc_timing(CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_B,
+				      link_freq, accinv);
+	timing->csettle = calc_timing(CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_B,
+				      link_freq, accinv);
+	timing->dtermen = calc_timing(CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_B,
+				      link_freq, accinv);
+	timing->dsettle = calc_timing(CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B,
+				      link_freq, accinv);
+
+	dev_dbg(dev, "ctermen %u csettle %u dtermen %u dsettle %u\n",
+		timing->ctermen, timing->csettle,
+		timing->dtermen, timing->dsettle);
+
+	return 0;
+}
+
+void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2)
+{
+	u32 irq = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+			CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
+	struct ipu6_isys *isys = csi2->isys;
+	u32 mask;
+
+	mask = isys->pdata->ipdata->csi2.irq_mask;
+	writel(irq & mask, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+	csi2->receiver_errors |= irq & mask;
+}
+
+void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
+{
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	const struct ipu6_csi2_error *errors;
+	u32 status;
+	u32 i;
+
+	/* register errors once more in case of interrupts are disabled */
+	ipu6_isys_register_errors(csi2);
+	status = csi2->receiver_errors;
+	csi2->receiver_errors = 0;
+	errors = dphy_rx_errors;
+
+	for (i = 0; i < CSI_RX_NUM_ERRORS_IN_IRQ; i++) {
+		if (status & BIT(i))
+			dev_err_ratelimited(dev, "csi2-%i error: %s\n",
+					    csi2->port, errors[i].error_string);
+	}
+}
+
+static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
+				     const struct ipu6_isys_csi2_timing *timing,
+				     unsigned int nlanes, int enable)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
+	struct ipu6_isys *isys = csi2->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu6_isys_csi2_config cfg;
+	unsigned int nports;
+	int ret = 0;
+	u32 mask = 0;
+	u32 i;
+
+	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
+		csi2->port, nlanes);
+
+	cfg.port = csi2->port;
+	cfg.nlanes = nlanes;
+
+	mask = isys->pdata->ipdata->csi2.irq_mask;
+	nports = isys->pdata->ipdata->csi2.nports;
+
+	if (!enable) {
+		writel(0, csi2->base + CSI_REG_CSI_FE_ENABLE);
+		writel(0, csi2->base + CSI_REG_PPI2CSI_ENABLE);
+
+		writel(0,
+		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+		       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
+		writel(mask,
+		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+		       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+		writel(0,
+		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+		       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
+		writel(0xffffffff,
+		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+		       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+
+		isys->phy_set_power(isys, &cfg, timing, false);
+
+		writel(0, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
+		       (isys->pdata->ipdata->csi2.fw_access_port_ofs,
+			csi2->port));
+		writel(0, isys->pdata->base +
+		       CSI_REG_HUB_DRV_ACCESS_PORT(csi2->port));
+
+		return ret;
+	}
+
+	/* reset port reset */
+	writel(0x1, csi2->base + CSI_REG_PORT_GPREG_SRST);
+	usleep_range(100, 200);
+	writel(0x0, csi2->base + CSI_REG_PORT_GPREG_SRST);
+
+	/* enable port clock */
+	for (i = 0; i < nports; i++) {
+		writel(1, isys->pdata->base + CSI_REG_HUB_DRV_ACCESS_PORT(i));
+		writel(1, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
+		       (isys->pdata->ipdata->csi2.fw_access_port_ofs, i));
+	}
+
+	/* enable all error related irq */
+	writel(mask,
+	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
+	writel(mask,
+	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_MASK_OFFSET);
+	writel(mask,
+	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+	writel(mask,
+	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_LEVEL_NOT_PULSE_OFFSET);
+	writel(mask,
+	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
+
+	/*
+	 * Using event from firmware instead of irq to handle CSI2 sync event
+	 * which can reduce system wakeups. If CSI2 sync irq enabled, we need
+	 * disable the firmware CSI2 sync event to avoid duplicate handling.
+	 */
+	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
+	writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_MASK_OFFSET);
+	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+	writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_LEVEL_NOT_PULSE_OFFSET);
+	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
+
+	/* configure to enable FE and PPI2CSI */
+	writel(0, csi2->base + CSI_REG_CSI_FE_MODE);
+	writel(CSI_SENSOR_INPUT, csi2->base + CSI_REG_CSI_FE_MUX_CTRL);
+	writel(CSI_CNTR_SENSOR_LINE_ID | CSI_CNTR_SENSOR_FRAME_ID,
+	       csi2->base + CSI_REG_CSI_FE_SYNC_CNTR_SEL);
+	writel(FIELD_PREP(PPI_INTF_CONFIG_NOF_ENABLED_DLANES_MASK, nlanes - 1),
+	       csi2->base + CSI_REG_PPI2CSI_CONFIG_PPI_INTF);
+
+	writel(1, csi2->base + CSI_REG_PPI2CSI_ENABLE);
+	writel(1, csi2->base + CSI_REG_CSI_FE_ENABLE);
+
+	ret = isys->phy_set_power(isys, &cfg, timing, true);
+	if (ret)
+		dev_err(dev, "csi-%d phy power up failed %d\n", csi2->port,
+			ret);
+
+	return ret;
+}
+
+static int set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct ipu6_isys_csi2_timing timing = { };
+	unsigned int nlanes;
+	int ret;
+
+	dev_dbg(dev, "csi2 stream %s callback\n", enable ? "on" : "off");
+
+	if (!enable) {
+		csi2->stream_count--;
+		if (csi2->stream_count)
+			return 0;
+
+		ipu6_isys_csi2_set_stream(sd, &timing, 0, enable);
+		return 0;
+	}
+
+	if (csi2->stream_count) {
+		csi2->stream_count++;
+		return 0;
+	}
+
+	nlanes = csi2->nlanes;
+
+	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
+	if (ret)
+		return ret;
+
+	ret = ipu6_isys_csi2_set_stream(sd, &timing, nlanes, enable);
+	if (ret)
+		return ret;
+
+	csi2->stream_count++;
+
+	return 0;
+}
+
+static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct device *dev = &asd->isys->adev->auxdev.dev;
+	struct v4l2_mbus_framefmt *sink_ffmt;
+	struct v4l2_mbus_framefmt *src_ffmt;
+	struct v4l2_rect *crop;
+
+	if (sel->pad == CSI2_PAD_SINK || sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								 sel->pad,
+								 sel->stream);
+	if (!sink_ffmt)
+		return -EINVAL;
+
+	src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
+	if (!src_ffmt)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
+	if (!crop)
+		return -EINVAL;
+
+	/* Only vertical cropping is supported */
+	sel->r.left = 0;
+	sel->r.width = sink_ffmt->width;
+	/* Non-bayer formats can't be single line cropped */
+	if (!ipu6_isys_is_bayer_format(sink_ffmt->code))
+		sel->r.top &= ~1;
+	sel->r.height = clamp(sel->r.height & ~1, IPU6_ISYS_MIN_HEIGHT,
+			      sink_ffmt->height - sel->r.top);
+	*crop = sel->r;
+
+	/* update source pad format */
+	src_ffmt->width = sel->r.width;
+	src_ffmt->height = sel->r.height;
+	if (ipu6_isys_is_bayer_format(sink_ffmt->code))
+		src_ffmt->code = ipu6_isys_convert_bayer_order(sink_ffmt->code,
+							       sel->r.left,
+							       sel->r.top);
+	dev_dbg(dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
+		sd->name, sel->r.left, sel->r.top, sel->r.width, sel->r.height,
+		src_ffmt->code);
+
+	return 0;
+}
+
+static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *sink_ffmt;
+	struct v4l2_rect *crop;
+	int ret = 0;
+
+	if (sd->entity.pads[sel->pad].flags & MEDIA_PAD_FL_SINK)
+		return -EINVAL;
+
+	sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								 sel->pad,
+								 sel->stream);
+	if (!sink_ffmt)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
+	if (!crop)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = sink_ffmt->width;
+		sel->r.height = sink_ffmt->height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *crop;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops csi2_sd_video_ops = {
+	.s_stream = set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ipu6_isys_subdev_set_fmt,
+	.get_selection = ipu6_isys_csi2_get_sel,
+	.set_selection = ipu6_isys_csi2_set_sel,
+	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
+	.set_routing = ipu6_isys_subdev_set_routing,
+};
+
+static const struct v4l2_subdev_ops csi2_sd_ops = {
+	.core = &csi2_sd_core_ops,
+	.video = &csi2_sd_video_ops,
+	.pad = &csi2_sd_pad_ops,
+};
+
+static const struct media_entity_operations csi2_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
+};
+
+void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2)
+{
+	if (!csi2->isys)
+		return;
+
+	v4l2_device_unregister_subdev(&csi2->asd.sd);
+	v4l2_subdev_cleanup(&csi2->asd.sd);
+	ipu6_isys_subdev_cleanup(&csi2->asd);
+	csi2->isys = NULL;
+}
+
+int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
+			struct ipu6_isys *isys,
+			void __iomem *base, unsigned int index)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	int ret;
+
+	csi2->isys = isys;
+	csi2->base = base;
+	csi2->port = index;
+
+	csi2->asd.sd.entity.ops = &csi2_entity_ops;
+	csi2->asd.isys = isys;
+	ret = ipu6_isys_subdev_init(&csi2->asd, &csi2_sd_ops, 0,
+				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
+	if (ret)
+		goto fail;
+
+	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
+	csi2->asd.supported_codes = csi2_supported_codes;
+	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
+		 IPU6_ISYS_ENTITY_PREFIX " CSI2 %u", index);
+	v4l2_set_subdevdata(&csi2->asd.sd, &csi2->asd);
+	ret = v4l2_subdev_init_finalize(&csi2->asd.sd);
+	if (ret) {
+		dev_err(dev, "failed to init v4l2 subdev\n");
+		goto fail;
+	}
+
+	ret = v4l2_device_register_subdev(&isys->v4l2_dev, &csi2->asd.sd);
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 subdev\n");
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	ipu6_isys_csi2_cleanup(csi2);
+
+	return ret;
+}
+
+void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
+{
+	struct video_device *vdev = stream->asd->sd.devnode;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	struct v4l2_event ev = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
+	v4l2_event_queue(vdev, &ev);
+
+	dev_dbg(dev, "sof_event::csi2-%i sequence: %i, vc: %d\n",
+		csi2->port, ev.u.frame_sync.frame_sequence, stream->vc);
+}
+
+void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
+{
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	u32 frame_sequence = atomic_read(&stream->sequence);
+
+	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
+		csi2->port, frame_sequence);
+}
+
+int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
+				   struct ipu6_isys_csi2 *csi2,
+				   struct media_entity *source_entity,
+				   struct v4l2_mbus_frame_desc_entry *entry)
+{
+	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_subdev *source;
+	struct media_pad *pad;
+	unsigned int i;
+	int ret;
+
+	source = media_entity_to_v4l2_subdev(source_entity);
+	if (!source)
+		return -EPIPE;
+
+	pad = media_pad_remote_pad_first(&csi2->asd.pad[CSI2_PAD_SINK]);
+	if (!pad)
+		return -EPIPE;
+
+	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
+	if (ret)
+		return ret;
+
+	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(dev, "Unsupported frame descriptor type\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < desc.num_entries; i++) {
+		if (source_stream == desc.entry[i].stream) {
+			desc_entry = &desc.entry[i];
+			break;
+		}
+	}
+
+	if (!desc_entry) {
+		dev_err(dev, "Failed to find stream %u from remote subdev\n",
+			source_stream);
+		return -EINVAL;
+	}
+
+	if (desc_entry->bus.csi2.vc >= NR_OF_CSI2_VC) {
+		dev_err(dev, "invalid vc %d\n", desc_entry->bus.csi2.vc);
+		return -EINVAL;
+	}
+
+	*entry = *desc_entry;
+
+	return 0;
+}
+
+void ipu6_isys_set_csi2_streams_status(struct ipu6_isys_video *av, bool status)
+{
+	struct ipu6_isys_stream *stream = av->stream;
+	struct v4l2_subdev *sd = &stream->asd->sd;
+	struct v4l2_subdev_state *state;
+	struct media_pad *r_pad;
+	unsigned int i;
+	u32 r_stream;
+
+	r_pad = media_pad_remote_pad_first(&av->pad);
+	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for (i = 0; i < state->stream_configs.num_configs; i++) {
+		struct v4l2_subdev_stream_config *cfg =
+			&state->stream_configs.configs[i];
+
+		if (cfg->pad == r_pad->index && r_stream == cfg->stream) {
+			dev_dbg(&av->isys->adev->auxdev.dev,
+				"%s: pad:%u, stream:%u, status:%u\n",
+				sd->entity.name, r_pad->index, r_stream,
+				status);
+			cfg->enabled = status;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
new file mode 100644
index 000000000000..eba6b29386ea
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013--2024 Intel Corporation */
+
+#ifndef IPU6_ISYS_CSI2_H
+#define IPU6_ISYS_CSI2_H
+
+#include <linux/container_of.h>
+
+#include "ipu6-isys-subdev.h"
+#include "ipu6-isys-video.h"
+
+struct media_entity;
+struct v4l2_mbus_frame_desc_entry;
+
+struct ipu6_isys_video;
+struct ipu6_isys;
+struct ipu6_isys_csi2_pdata;
+struct ipu6_isys_stream;
+
+#define NR_OF_CSI2_VC		16
+#define INVALID_VC_ID		-1
+#define NR_OF_CSI2_SINK_PADS	1
+#define CSI2_PAD_SINK		0
+#define NR_OF_CSI2_SRC_PADS	8
+#define CSI2_PAD_SRC		1
+#define NR_OF_CSI2_PADS		(NR_OF_CSI2_SINK_PADS + NR_OF_CSI2_SRC_PADS)
+
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_A		0
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_B		0
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_A		95
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_B		-8
+
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_A		0
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_B		0
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_A		85
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B		-2
+
+struct ipu6_isys_csi2 {
+	struct ipu6_isys_subdev asd;
+	struct ipu6_isys_csi2_pdata *pdata;
+	struct ipu6_isys *isys;
+	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
+
+	void __iomem *base;
+	u32 receiver_errors;
+	unsigned int nlanes;
+	unsigned int port;
+	unsigned int stream_count;
+};
+
+struct ipu6_isys_csi2_timing {
+	u32 ctermen;
+	u32 csettle;
+	u32 dtermen;
+	u32 dsettle;
+};
+
+struct ipu6_csi2_error {
+	const char *error_string;
+	bool is_info_only;
+};
+
+#define ipu6_isys_subdev_to_csi2(__sd) \
+	container_of(__sd, struct ipu6_isys_csi2, asd)
+
+#define to_ipu6_isys_csi2(__asd) container_of(__asd, struct ipu6_isys_csi2, asd)
+
+s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2);
+int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2, struct ipu6_isys *isys,
+			void __iomem *base, unsigned int index);
+void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2);
+void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream);
+void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
+void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
+void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
+int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
+				   struct ipu6_isys_csi2 *csi2,
+				   struct media_entity *source_entity,
+				   struct v4l2_mbus_frame_desc_entry *entry);
+void ipu6_isys_set_csi2_streams_status(struct ipu6_isys_video *av, bool status);
+
+#endif /* IPU6_ISYS_CSI2_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
new file mode 100644
index 000000000000..cb2ef1572562
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+
+#include <linux/bug.h>
+#include <linux/device.h>
+#include <linux/minmax.h>
+
+#include <media/media-entity.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-subdev.h"
+
+unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return 24;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return 16;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return 12;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return 10;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return 8;
+	default:
+		WARN_ON(1);
+		return 8;
+	}
+}
+
+unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		return MIPI_CSI2_DT_RGB565;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return MIPI_CSI2_DT_RGB888;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MIPI_CSI2_DT_YUV422_8B;
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+		return MIPI_CSI2_DT_RAW16;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return MIPI_CSI2_DT_RAW12;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return MIPI_CSI2_DT_RAW8;
+	default:
+		/* return unavailable MIPI data type - 0x3f */
+		WARN_ON(1);
+		return 0x3f;
+	}
+}
+
+bool ipu6_isys_is_bayer_format(u32 code)
+{
+	switch (ipu6_isys_mbus_code_to_mipi(code)) {
+	case MIPI_CSI2_DT_RAW8:
+	case MIPI_CSI2_DT_RAW10:
+	case MIPI_CSI2_DT_RAW12:
+	case MIPI_CSI2_DT_RAW14:
+	case MIPI_CSI2_DT_RAW16:
+	case MIPI_CSI2_DT_RAW20:
+	case MIPI_CSI2_DT_RAW24:
+	case MIPI_CSI2_DT_RAW28:
+		return true;
+	default:
+		return false;
+	}
+}
+
+u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y)
+{
+	static const u32 code_map[] = {
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		MEDIA_BUS_FMT_SRGGB16_1X16,
+		MEDIA_BUS_FMT_SGRBG16_1X16,
+		MEDIA_BUS_FMT_SGBRG16_1X16,
+		MEDIA_BUS_FMT_SBGGR16_1X16,
+	};
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(code_map); i++)
+		if (code_map[i] == code)
+			break;
+
+	if (WARN_ON(i == ARRAY_SIZE(code_map)))
+		return code;
+
+	return code_map[i ^ (((y & 1) << 1) | (x & 1))];
+}
+
+int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *format)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+	u32 code = asd->supported_codes[0];
+	u32 other_pad, other_stream;
+	unsigned int i;
+	int ret;
+
+	/* No transcoding, source and sink formats must match. */
+	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
+	    sd->entity.num_pads > 1)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	format->format.width = clamp(format->format.width, IPU6_ISYS_MIN_WIDTH,
+				     IPU6_ISYS_MAX_WIDTH);
+	format->format.height = clamp(format->format.height,
+				      IPU6_ISYS_MIN_HEIGHT,
+				      IPU6_ISYS_MAX_HEIGHT);
+
+	for (i = 0; asd->supported_codes[i]; i++) {
+		if (asd->supported_codes[i] == format->format.code) {
+			code = asd->supported_codes[i];
+			break;
+		}
+	}
+	format->format.code = code;
+	format->format.field = V4L2_FIELD_NONE;
+
+	/* Store the format and propagate it to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	if (!(sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
+	/* propagate format to following source pad */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    format->pad,
+						    format->stream,
+						    &other_pad,
+						    &other_stream);
+	if (ret)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
+	/* reset crop */
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = fmt->width;
+	crop->height = fmt->height;
+
+	return 0;
+}
+
+int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	const u32 *supported_codes = asd->supported_codes;
+	u32 index;
+
+	for (index = 0; supported_codes[index]; index++) {
+		if (index == code->index) {
+			code->code = supported_codes[index];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int subdev_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 4096,
+		.height = 3072,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.field = V4L2_FIELD_NONE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+}
+
+int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				 struct v4l2_mbus_framefmt *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (!sd || !format)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, pad, stream);
+	if (fmt)
+		*format = *fmt;
+	v4l2_subdev_unlock_state(state);
+
+	return fmt ? 0 : -EINVAL;
+}
+
+int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				  struct v4l2_rect *crop)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_rect *rect;
+
+	if (!sd || !crop)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	rect = v4l2_subdev_state_get_crop(state, pad, stream);
+	if (rect)
+		*crop = *rect;
+	v4l2_subdev_unlock_state(state);
+
+	return rect ? 0 : -EINVAL;
+}
+
+u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *routes;
+	unsigned int i;
+	u32 source_stream = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	routes = state->routing.routes;
+	for (i = 0; i < state->routing.num_routes; i++) {
+		if (routes[i].source_pad == pad) {
+			source_stream = routes[i].source_stream;
+			break;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return source_stream;
+}
+
+static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route route = {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = &route,
+	};
+
+	return subdev_set_routing(sd, state, &routing);
+}
+
+int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing)
+{
+	return subdev_set_routing(sd, state, routing);
+}
+
+static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
+	.init_state = ipu6_isys_subdev_init_state,
+};
+
+int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
+			  const struct v4l2_subdev_ops *ops,
+			  unsigned int nr_ctrls,
+			  unsigned int num_sink_pads,
+			  unsigned int num_source_pads)
+{
+	unsigned int num_pads = num_sink_pads + num_source_pads;
+	unsigned int i;
+	int ret;
+
+	v4l2_subdev_init(&asd->sd, ops);
+
+	asd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			 V4L2_SUBDEV_FL_HAS_EVENTS |
+			 V4L2_SUBDEV_FL_STREAMS;
+	asd->sd.owner = THIS_MODULE;
+	asd->sd.dev = &asd->isys->adev->auxdev.dev;
+	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
+
+	asd->pad = devm_kcalloc(&asd->isys->adev->auxdev.dev, num_pads,
+				sizeof(*asd->pad), GFP_KERNEL);
+	if (!asd->pad)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sink_pads; i++)
+		asd->pad[i].flags = MEDIA_PAD_FL_SINK |
+				    MEDIA_PAD_FL_MUST_CONNECT;
+
+	for (i = num_sink_pads; i < num_pads; i++)
+		asd->pad[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&asd->sd.entity, num_pads, asd->pad);
+	if (ret)
+		return ret;
+
+	if (asd->ctrl_init) {
+		ret = v4l2_ctrl_handler_init(&asd->ctrl_handler, nr_ctrls);
+		if (ret)
+			goto out_media_entity_cleanup;
+
+		asd->ctrl_init(&asd->sd);
+		if (asd->ctrl_handler.error) {
+			ret = asd->ctrl_handler.error;
+			goto out_v4l2_ctrl_handler_free;
+		}
+
+		asd->sd.ctrl_handler = &asd->ctrl_handler;
+	}
+
+	asd->source = -1;
+
+	return 0;
+
+out_v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&asd->ctrl_handler);
+
+out_media_entity_cleanup:
+	media_entity_cleanup(&asd->sd.entity);
+
+	return ret;
+}
+
+void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd)
+{
+	media_entity_cleanup(&asd->sd.entity);
+	v4l2_ctrl_handler_free(&asd->ctrl_handler);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
new file mode 100644
index 000000000000..9ef8d95464f5
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013--2024 Intel Corporation */
+
+#ifndef IPU6_ISYS_SUBDEV_H
+#define IPU6_ISYS_SUBDEV_H
+
+#include <linux/container_of.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+struct ipu6_isys;
+
+struct ipu6_isys_subdev {
+	struct v4l2_subdev sd;
+	struct ipu6_isys *isys;
+	u32 const *supported_codes;
+	struct media_pad *pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	void (*ctrl_init)(struct v4l2_subdev *sd);
+	int source;	/* SSI stream source; -1 if unset */
+};
+
+#define to_ipu6_isys_subdev(__sd) \
+	container_of(__sd, struct ipu6_isys_subdev, sd)
+
+unsigned int ipu6_isys_mbus_code_to_bpp(u32 code);
+unsigned int ipu6_isys_mbus_code_to_mipi(u32 code);
+bool ipu6_isys_is_bayer_format(u32 code);
+u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y);
+
+int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *fmt);
+int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum
+				    *code);
+int ipu6_isys_subdev_link_validate(struct v4l2_subdev *sd,
+				   struct media_link *link,
+				   struct v4l2_subdev_format *source_fmt,
+				   struct v4l2_subdev_format *sink_fmt);
+u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
+int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				 struct v4l2_mbus_framefmt *format);
+int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				  struct v4l2_rect *crop);
+int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing);
+int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
+			  const struct v4l2_subdev_ops *ops,
+			  unsigned int nr_ctrls,
+			  unsigned int num_sink_pads,
+			  unsigned int num_source_pads);
+void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd);
+#endif /* IPU6_ISYS_SUBDEV_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h b/drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
new file mode 100644
index 000000000000..cc58377534dc
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2023--2024 Intel Corporation */
+
+#ifndef IPU6_PLATFORM_ISYS_CSI2_REG_H
+#define IPU6_PLATFORM_ISYS_CSI2_REG_H
+
+#include <linux/bits.h>
+
+#define CSI_REG_BASE			0x220000
+#define CSI_REG_PORT_BASE(id)		(CSI_REG_BASE + (id) * 0x1000)
+
+/* CSI Port Genral Purpose Registers */
+#define CSI_REG_PORT_GPREG_SRST                 0x0
+#define CSI_REG_PORT_GPREG_CSI2_SLV_REG_SRST    0x4
+#define CSI_REG_PORT_GPREG_CSI2_PORT_CONTROL    0x8
+
+/*
+ * Port IRQs mapping events:
+ * IRQ0 - CSI_FE event
+ * IRQ1 - CSI_SYNC
+ * IRQ2 - S2M_SIDS0TO7
+ * IRQ3 - S2M_SIDS8TO15
+ */
+#define CSI_PORT_REG_BASE_IRQ_CSI               0x80
+#define CSI_PORT_REG_BASE_IRQ_CSI_SYNC          0xA0
+#define CSI_PORT_REG_BASE_IRQ_S2M_SIDS0TOS7     0xC0
+#define CSI_PORT_REG_BASE_IRQ_S2M_SIDS8TOS15    0xE0
+
+#define CSI_PORT_REG_BASE_IRQ_EDGE_OFFSET	0x0
+#define CSI_PORT_REG_BASE_IRQ_MASK_OFFSET	0x4
+#define CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET	0x8
+#define CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET	0xc
+#define CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET	0x10
+#define CSI_PORT_REG_BASE_IRQ_LEVEL_NOT_PULSE_OFFSET	0x14
+
+#define IPU6SE_CSI_RX_ERROR_IRQ_MASK		GENMASK(18, 0)
+#define IPU6_CSI_RX_ERROR_IRQ_MASK		GENMASK(19, 0)
+
+#define CSI_RX_NUM_ERRORS_IN_IRQ		20
+#define CSI_RX_NUM_IRQ				32
+
+#define IPU_CSI_RX_IRQ_FS_VC(chn)	(1 << ((chn) * 2))
+#define IPU_CSI_RX_IRQ_FE_VC(chn)	(2 << ((chn) * 2))
+
+/* PPI2CSI */
+#define CSI_REG_PPI2CSI_ENABLE				0x200
+#define CSI_REG_PPI2CSI_CONFIG_PPI_INTF			0x204
+#define PPI_INTF_CONFIG_NOF_ENABLED_DLANES_MASK		GENMASK(4, 3)
+#define CSI_REG_PPI2CSI_CONFIG_CSI_FEATURE		0x208
+
+enum CSI_PPI2CSI_CTRL {
+	CSI_PPI2CSI_DISABLE = 0,
+	CSI_PPI2CSI_ENABLE = 1,
+};
+
+/* CSI_FE */
+#define CSI_REG_CSI_FE_ENABLE                   0x280
+#define CSI_REG_CSI_FE_MODE                     0x284
+#define CSI_REG_CSI_FE_MUX_CTRL                 0x288
+#define CSI_REG_CSI_FE_SYNC_CNTR_SEL            0x290
+
+enum CSI_FE_ENABLE_TYPE {
+	CSI_FE_DISABLE = 0,
+	CSI_FE_ENABLE = 1,
+};
+
+enum CSI_FE_MODE_TYPE {
+	CSI_FE_DPHY_MODE = 0,
+	CSI_FE_CPHY_MODE = 1,
+};
+
+enum CSI_FE_INPUT_SELECTOR {
+	CSI_SENSOR_INPUT = 0,
+	CSI_MIPIGEN_INPUT = 1,
+};
+
+enum CSI_FE_SYNC_CNTR_SEL_TYPE {
+	CSI_CNTR_SENSOR_LINE_ID = BIT(0),
+	CSI_CNTR_INT_LINE_PKT_ID = ~CSI_CNTR_SENSOR_LINE_ID,
+	CSI_CNTR_SENSOR_FRAME_ID = BIT(1),
+	CSI_CNTR_INT_FRAME_PKT_ID = ~CSI_CNTR_SENSOR_FRAME_ID,
+};
+
+/* CSI HUB General Purpose Registers */
+#define CSI_REG_HUB_GPREG_SRST			(CSI_REG_BASE + 0x18000)
+#define CSI_REG_HUB_GPREG_SLV_REG_SRST		(CSI_REG_BASE + 0x18004)
+
+#define CSI_REG_HUB_DRV_ACCESS_PORT(id)	(CSI_REG_BASE + 0x18018 + (id) * 4)
+#define CSI_REG_HUB_FW_ACCESS_PORT_OFS		0x17000
+#define CSI_REG_HUB_FW_ACCESS_PORT_V6OFS	0x16000
+#define CSI_REG_HUB_FW_ACCESS_PORT(ofs, id)	\
+					(CSI_REG_BASE + (ofs) + (id) * 4)
+
+enum CSI_PORT_CLK_GATING_SWITCH {
+	CSI_PORT_CLK_GATING_OFF = 0,
+	CSI_PORT_CLK_GATING_ON = 1,
+};
+
+#define CSI_REG_BASE_HUB_IRQ                        0x18200
+
+#define IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_EDGE			0x238200
+#define IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_MASK			0x238204
+#define IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_STATUS			0x238208
+#define IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_CLEAR			0x23820c
+#define IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_ENABLE			0x238210
+#define IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_LEVEL_NOT_PULSE		0x238214
+
+#define IPU6_REG_ISYS_CSI_TOP_CTRL1_IRQ_EDGE			0x238220
+#define IPU6_REG_ISYS_CSI_TOP_CTRL1_IRQ_MASK			0x238224
+#define IPU6_REG_ISYS_CSI_TOP_CTRL1_IRQ_STATUS			0x238228
+#define IPU6_REG_ISYS_CSI_TOP_CTRL1_IRQ_CLEAR			0x23822c
+#define IPU6_REG_ISYS_CSI_TOP_CTRL1_IRQ_ENABLE			0x238230
+#define IPU6_REG_ISYS_CSI_TOP_CTRL1_IRQ_LEVEL_NOT_PULSE		0x238234
+
+/* MTL IPU6V6 irq ctrl0 & ctrl1 */
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_EDGE			0x238700
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_MASK			0x238704
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_STATUS		0x238708
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_CLEAR			0x23870c
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_ENABLE		0x238710
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL0_IRQ_LEVEL_NOT_PULSE	0x238714
+
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL1_IRQ_EDGE			0x238720
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL1_IRQ_MASK			0x238724
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL1_IRQ_STATUS		0x238728
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL1_IRQ_CLEAR			0x23872c
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL1_IRQ_ENABLE		0x238730
+#define IPU6V6_REG_ISYS_CSI_TOP_CTRL1_IRQ_LEVEL_NOT_PULSE	0x238734
+
+/*
+ * 3:0 CSI_PORT.irq_out[3:0] CSI_PORT_CTRL0 IRQ outputs (4bits)
+ * [0] CSI_PORT.IRQ_CTRL0_csi
+ * [1] CSI_PORT.IRQ_CTRL1_csi_sync
+ * [2] CSI_PORT.IRQ_CTRL2_s2m_sids0to7
+ * [3] CSI_PORT.IRQ_CTRL3_s2m_sids8to15
+ */
+#define IPU6_ISYS_UNISPART_IRQ_CSI2(port)		\
+				   (0x3 << ((port) * IPU6_CSI_IRQ_NUM_PER_PIPE))
+
+/*
+ * ipu6se support 2 front ends, 2 port per front end, 4 ports 0..3
+ * sip0 - 0, 1
+ * sip1 - 2, 3
+ * 0 and 2 support 4 data lanes, 1 and 3 support 2 data lanes
+ * all offset are base from isys base address
+ */
+
+#define CSI2_HUB_GPREG_SIP_SRST(sip)			(0x238038 + (sip) * 4)
+#define CSI2_HUB_GPREG_SIP_FB_PORT_CFG(sip)		(0x238050 + (sip) * 4)
+
+#define CSI2_HUB_GPREG_DPHY_TIMER_INCR			0x238040
+#define CSI2_HUB_GPREG_HPLL_FREQ			0x238044
+#define CSI2_HUB_GPREG_IS_CLK_RATIO			0x238048
+#define CSI2_HUB_GPREG_HPLL_FREQ_ISCLK_RATE_OVERRIDE	0x23804c
+#define CSI2_HUB_GPREG_PORT_CLKGATING_DISABLE		0x238058
+#define CSI2_HUB_GPREG_SIP0_CSI_RX_A_CONTROL		0x23805c
+#define CSI2_HUB_GPREG_SIP0_CSI_RX_B_CONTROL		0x238088
+#define CSI2_HUB_GPREG_SIP1_CSI_RX_A_CONTROL		0x2380a4
+#define CSI2_HUB_GPREG_SIP1_CSI_RX_B_CONTROL		0x2380d0
+
+#define CSI2_SIP_TOP_CSI_RX_BASE(sip)		(0x23805c + (sip) * 0x48)
+#define CSI2_SIP_TOP_CSI_RX_PORT_BASE_0(port)	(0x23805c + ((port) / 2) * 0x48)
+#define CSI2_SIP_TOP_CSI_RX_PORT_BASE_1(port)	(0x238088 + ((port) / 2) * 0x48)
+
+/* offset from port base */
+#define CSI2_SIP_TOP_CSI_RX_PORT_CONTROL		0x0
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_TERMEN_CLANE	0x4
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_SETTLE_CLANE	0x8
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_TERMEN_DLANE(lane)	(0xc + (lane) * 8)
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_SETTLE_DLANE(lane)	(0x10 + (lane) * 8)
+
+#endif /* IPU6_ISYS_CSI2_REG_H */
-- 
2.39.2


