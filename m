Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB1F6E0AC6
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjDMJz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjDMJzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:55:22 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7CE5FE4
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379708; x=1712915708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pshsbQp8n4e2kgfiifJrTN3lVRCL+hvE1bCTJt+yl7M=;
  b=gE5qiWnkRrQzV8qVRMrmf4uE3xT4WopfYLkaMnR85tWrHc+lzAhCFwZS
   x7pZogAkFWsQN3eQpS/k8bbbGJQ6TQLaVmtIfgb31UkzMKZQ4R9Xh36uo
   98BjFwkQKOCfI/UBHO6Lxi0J7xY+wZMrsQvY2oPulAAyGsLp1nO8rrWPb
   JEhfh02MHuIb+BJHz7OmUkBbmXh/pLhYX8Xyyi3XQoeyqtBigC7ajPmVd
   8DGuKrrJ/dgK4ELftW1HmvDIxl3L/e/Mdr7AadJO58edyHBqVld42A4ic
   gjqjPx+7T8PqCt5ID7KqYlAY0G+fa9QeSgRgcisoPCombaTavLr5jLZtA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371993017"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371993017"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639600053"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639600053"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:54:56 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 08/14] media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
Date:   Thu, 13 Apr 2023 18:04:23 +0800
Message-Id: <20230413100429.919622-9-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Input system CSI2 receiver is exposed as a v4l2 sub-device.
Each CSI2 sub-device represent one single CSI2 hardware port
which be linked with external sub-device such camera sensor
by linked with ISYS CSI2's sink pad. CSI2 source pad is linked
to the sink pad of video capture device.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 579 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  75 +++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 309 ++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  70 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  | 187 ++++++
 5 files changed, 1220 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
new file mode 100644
index 000000000000..0cc41af0b552
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/spinlock.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-buttress.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-csi2.h"
+#include "ipu6-isys-phy.h"
+#include "ipu6-isys-subdev.h"
+#include "ipu6-isys-video.h"
+#include "ipu6-platform-buttress-regs.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+#include "ipu6-platform-regs.h"
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
+	0,
+};
+
+/*
+ * Strings corresponding to CSI-2 receiver errors are here.
+ * Corresponding macros are defined in the header file.
+ */
+static struct ipu6_csi2_error dphy_rx_errors[] = {
+	{"Single packet header error corrected", true},
+	{"Multiple packet header errors detected", true},
+	{"Payload checksum (CRC) error", true},
+	{"Transfer FIFO overflow", false},
+	{"Reserved short packet data type detected", true},
+	{"Reserved long packet data type detected", true},
+	{"Incomplete long packet detected", false},
+	{"Frame sync error", false},
+	{"Line sync error", false},
+	{"DPHY recoverable synchronization error", true},
+	{"DPHY fatal error", false},
+	{"DPHY elastic FIFO overflow", false},
+	{"Inter-frame short packet discarded", true},
+	{"Inter-frame long packet discarded", true},
+	{"MIPI pktgen overflow", false},
+	{"MIPI pktgen data loss", false},
+	{"FIFO overflow", false},
+	{"Lane deskew", false},
+	{"SOT sync error", false},
+	{"HSIDLE detected", false}
+};
+
+int ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2, s64 *link_freq)
+{
+	struct media_pad *src_pad;
+	struct v4l2_subdev *ext_sd;
+	unsigned int bpp, lanes;
+	struct device *dev;
+	s64 ret;
+
+	if (!csi2 || !link_freq)
+		return -EINVAL;
+
+	dev = &csi2->isys->adev->dev;
+	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	if (IS_ERR_OR_NULL(src_pad)) {
+		dev_err(dev, "can't get source pad of %s\n", csi2->asd.sd.name);
+		return -ENOLINK;
+	}
+
+	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
+		return -ENODEV;
+
+	bpp = ipu6_isys_mbus_code_to_bpp(csi2->asd.ffmt->code);
+	lanes = csi2->nlanes;
+
+	ret = v4l2_get_link_freq(ext_sd->ctrl_handler, bpp, lanes * 2);
+	if (ret < 0) {
+		dev_err(dev, "can't get link frequency (%lld)\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "link freq of %s is %lld\n", ext_sd->name, ret);
+	*link_freq = ret;
+
+	return 0;
+}
+
+static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				struct v4l2_event_subscription *sub)
+{
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(sd);
+
+	dev_dbg(&csi2->isys->adev->dev, "csi2 subscribe event(type %u id %u)\n",
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
+static u32 calc_timing(s32 a, s32 b, s64 link_freq, u32 accinv)
+{
+	return accinv * a + (accinv * b * (500000000 >> DIV_SHIFT)
+			     / (int32_t)(link_freq >> DIV_SHIFT));
+}
+
+static int
+ipu6_isys_csi2_calc_timing(struct ipu6_isys_csi2 *csi2,
+			   struct ipu6_isys_csi2_timing *timing, u32 accinv)
+{
+	s64 link_freq;
+	int ret;
+
+	ret = ipu6_isys_csi2_get_link_freq(csi2, &link_freq);
+	if (ret)
+		return ret;
+
+	timing->ctermen = calc_timing(CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_B,
+				      link_freq, accinv);
+	timing->csettle = calc_timing(CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_B,
+				      link_freq, accinv);
+	dev_dbg(&csi2->isys->adev->dev, "ctermen %u\n", timing->ctermen);
+	dev_dbg(&csi2->isys->adev->dev, "csettle %u\n", timing->csettle);
+
+	timing->dtermen = calc_timing(CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_B,
+				      link_freq, accinv);
+	timing->dsettle = calc_timing(CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_A,
+				      CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B,
+				      link_freq, accinv);
+	dev_dbg(&csi2->isys->adev->dev, "dtermen %u\n", timing->dtermen);
+	dev_dbg(&csi2->isys->adev->dev, "dsettle %u\n", timing->dsettle);
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
+	struct ipu6_csi2_error *errors;
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
+			dev_err_ratelimited(&csi2->isys->adev->dev,
+					    "csi2-%i error: %s\n",
+					    csi2->port,
+					    errors[i].error_string);
+	}
+}
+
+static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
+				     const struct ipu6_isys_csi2_timing *timing,
+				     unsigned int nlanes, int enable)
+{
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(sd);
+	struct ipu6_isys *isys = csi2->isys;
+	struct ipu6_isys_stream *stream;
+	struct ipu6_isys_csi2_config cfg;
+	unsigned int port, nports;
+	int ret = 0;
+	u32 mask = 0;
+	u32 i;
+
+	stream = ipu6_isys_query_stream_by_source(isys, csi2->asd.source);
+	if (!stream) {
+		dev_err(&isys->adev->dev, "no available stream\n");
+		return -EINVAL;
+	}
+
+	ipu6_isys_put_stream(stream);
+
+	port = csi2->port;
+	dev_dbg(&isys->adev->dev, "for port %u with %u lanes\n", port, nlanes);
+
+	cfg.port = port;
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
+		       (isys->pdata->ipdata->csi2.fw_access_port_ofs, port));
+		writel(0, isys->pdata->base +
+		       CSI_REG_HUB_DRV_ACCESS_PORT(port));
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
+	if (ret) {
+		dev_err(&isys->adev->dev, "csi-%d phy power up failed %d\n",
+			port, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(sd);
+	struct ipu6_isys_csi2_timing timing = {0};
+	struct ipu6_isys_stream *stream;
+	unsigned int nlanes;
+	int ret;
+
+	dev_dbg(&csi2->isys->adev->dev, "csi2 s_stream %d\n", enable);
+
+	stream = ipu6_isys_query_stream_by_source(csi2->isys, csi2->asd.source);
+	if (!stream) {
+		dev_err(&csi2->isys->adev->dev, "no available stream\n");
+		return -ENODEV;
+	}
+
+	if (!stream->source_entity) {
+		dev_err(&csi2->isys->adev->dev, "source_entity is NULL\n");
+		return -ENODEV;
+	}
+
+	ipu6_isys_put_stream(stream);
+
+	if (!enable) {
+		ipu6_isys_csi2_set_stream(sd, &timing, 0, enable);
+		return 0;
+	}
+
+	nlanes = csi2->nlanes;
+	dev_dbg(&csi2->isys->adev->dev, "lane nr %d.\n", nlanes);
+
+	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
+	if (ret)
+		return ret;
+
+	return ipu6_isys_csi2_set_stream(sd, &timing, nlanes, enable);
+}
+
+static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct v4l2_mbus_framefmt *sink_ffmt =
+		ipu6_isys_get_ffmt(sd, state, CSI2_PAD_SINK, sel->which);
+	struct v4l2_mbus_framefmt *src_ffmt =
+		ipu6_isys_get_ffmt(sd, state, sel->pad, sel->which);
+
+	if (sel->pad == CSI2_PAD_SINK || sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	mutex_lock(&asd->mutex);
+	/* Only vertical cropping is supported */
+	sel->r.left = 0;
+	sel->r.width = sink_ffmt->width;
+	/* Non-bayer formats can't be single line cropped */
+	if (!ipu6_isys_is_bayer_format(sink_ffmt->code))
+		sel->r.top &= ~1;
+	sel->r.height = clamp(sel->r.height & ~1, IPU6_ISYS_MIN_HEIGHT,
+			      sink_ffmt->height - sel->r.top);
+	*ipu6_isys_get_crop(sd, state, sel->pad, sel->which) = sel->r;
+
+	/* update source pad format */
+	src_ffmt->width = sel->r.width;
+	src_ffmt->height = sel->r.height;
+	if (ipu6_isys_is_bayer_format(sink_ffmt->code))
+		src_ffmt->code = ipu6_isys_convert_bayer_order(sink_ffmt->code,
+							       sel->r.left,
+							       sel->r.top);
+	dev_dbg(&asd->isys->adev->dev,
+		"set crop for %s, sel: %d,%d,%d,%d code: 0x%x\n", sd->name,
+		sel->r.left, sel->r.top, sel->r.width, sel->r.height,
+		src_ffmt->code);
+	mutex_unlock(&asd->mutex);
+
+	return 0;
+}
+
+static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct v4l2_mbus_framefmt *sink_ffmt =
+		ipu6_isys_get_ffmt(sd, state, CSI2_PAD_SINK, sel->which);
+	struct v4l2_rect *crop =
+		ipu6_isys_get_crop(sd, state, sel->pad, sel->which);
+	int ret = 0;
+
+	if (sd->entity.pads[sel->pad].flags & MEDIA_PAD_FL_SINK)
+		return -EINVAL;
+
+	mutex_lock(&asd->mutex);
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
+	mutex_unlock(&asd->mutex);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops csi2_sd_video_ops = {
+	.s_stream = set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
+	.init_cfg = ipu6_isys_subdev_init_cfg,
+	.link_validate = v4l2_subdev_link_validate_default,
+	.get_fmt = ipu6_isys_subdev_get_fmt,
+	.set_fmt = ipu6_isys_subdev_set_fmt,
+	.get_selection = ipu6_isys_csi2_get_sel,
+	.set_selection = ipu6_isys_csi2_set_sel,
+	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
+};
+
+static const struct v4l2_subdev_ops csi2_sd_ops = {
+	.core = &csi2_sd_core_ops,
+	.video = &csi2_sd_video_ops,
+	.pad = &csi2_sd_pad_ops,
+};
+
+static struct media_entity_operations csi2_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2)
+{
+	if (!csi2->isys)
+		return;
+
+	v4l2_device_unregister_subdev(&csi2->asd.sd);
+	ipu6_isys_subdev_cleanup(&csi2->asd);
+	csi2->isys = NULL;
+}
+
+int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
+			struct ipu6_isys *isys,
+			void __iomem *base, unsigned int index)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = CSI2_PAD_SINK,
+		.format = {
+			.width = 4096,
+			.height = 3072,
+			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		},
+	};
+	int ret;
+
+	csi2->isys = isys;
+	csi2->base = base;
+	csi2->port = index;
+
+	csi2->asd.sd.entity.ops = &csi2_entity_ops;
+	csi2->asd.isys = isys;
+	ret = ipu6_isys_subdev_init(&csi2->asd, &csi2_sd_ops, 0,
+				    NR_OF_CSI2_PADS);
+	if (ret)
+		goto fail;
+
+	csi2->asd.pad[CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK
+		| MEDIA_PAD_FL_MUST_CONNECT;
+	csi2->asd.pad[CSI2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
+	csi2->asd.supported_codes = csi2_supported_codes;
+	ipu6_isys_subdev_set_fmt(&csi2->asd.sd, NULL, &fmt);
+	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
+		 IPU6_ISYS_ENTITY_PREFIX " CSI2 %u", index);
+	v4l2_set_subdevdata(&csi2->asd.sd, &csi2->asd);
+
+	ret = v4l2_device_register_subdev(&isys->v4l2_dev, &csi2->asd.sd);
+	if (ret) {
+		dev_info(&isys->adev->dev, "can't register v4l2 subdev\n");
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
+	struct video_device *vdev = stream->csi2->asd.sd.devnode;
+	struct v4l2_event ev = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	ev.u.frame_sync.frame_sequence = atomic_inc_return(&stream->sequence);
+
+	v4l2_event_queue(vdev, &ev);
+	dev_dbg(&stream->isys->adev->dev,
+		"sof_event::csi2-%i sequence: %i\n",
+		stream->csi2->port, ev.u.frame_sync.frame_sequence);
+}
+
+void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
+{
+	u32 frame_sequence = atomic_read(&stream->sequence);
+
+	dev_dbg(&stream->isys->adev->dev, "eof_event::csi2-%i sequence: %i\n",
+		stream->csi2->port, frame_sequence);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
new file mode 100644
index 000000000000..db932e9e8b0e
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_ISYS_CSI2_H
+#define IPU6_ISYS_CSI2_H
+
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+
+#include "ipu6-isys-subdev.h"
+
+struct ipu6_isys;
+struct ipu6_isys_csi2_pdata;
+struct ipu6_isys_csi2_timing;
+struct ipu6_isys_stream;
+
+#define NR_OF_CSI2_SINK_PADS		1
+#define CSI2_PAD_SINK			0
+#define NR_OF_CSI2_SOURCE_PADS		1
+#define CSI2_PAD_SOURCE			1
+#define NR_OF_CSI2_PADS	(NR_OF_CSI2_SINK_PADS + NR_OF_CSI2_SOURCE_PADS)
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
+#define IPU6_EOF_TIMEOUT 300
+#define IPU6_EOF_TIMEOUT_JIFFIES msecs_to_jiffies(IPU6_EOF_TIMEOUT)
+
+#define CSI2_CROP_HOR		BIT(0)
+#define CSI2_CROP_VER		BIT(1)
+#define CSI2_CROP_MASK	(CSI2_CROP_VER | CSI2_CROP_HOR)
+
+struct ipu6_isys_csi2 {
+	struct ipu6_isys_csi2_pdata *pdata;
+	struct ipu6_isys *isys;
+	struct ipu6_isys_subdev asd;
+
+	void __iomem *base;
+	u32 receiver_errors;
+	unsigned int nlanes;
+	unsigned int port;
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
+#define to_ipu6_isys_csi2(sd) container_of(to_ipu6_isys_subdev(sd), \
+					struct ipu6_isys_csi2, asd)
+
+int ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2, s64 *link_freq);
+int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2, struct ipu6_isys *isys,
+			void __iomem *base, unsigned int index);
+void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2);
+void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream);
+void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
+void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
+void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
+
+#endif /* IPU6_ISYS_CSI2_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
new file mode 100644
index 000000000000..35e0f38a4157
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2013 - 2023 Intel Corporation
+
+#include <linux/media-bus-format.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include <media/media-entity.h>
+
+#include "ipu6.h"
+#include "ipu6-bus.h"
+#include "ipu6-isys.h"
+#include "ipu6-isys-subdev.h"
+#include "ipu6-isys-video.h"
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
+		return true;
+	}
+	return false;
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
+	};
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(code_map); i++)
+		if (code_map[i] == code)
+			break;
+
+	if (i == ARRAY_SIZE(code_map)) {
+		WARN_ON(1);
+		return code;
+	}
+
+	return code_map[i ^ (((y & 1) << 1) | (x & 1))];
+}
+
+struct v4l2_mbus_framefmt *ipu6_isys_get_ffmt(struct v4l2_subdev *sd,
+					      struct v4l2_subdev_state *state,
+					      unsigned int pad,
+					      unsigned int which)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return &asd->ffmt[pad];
+	else
+		return v4l2_subdev_get_try_format(sd, state, pad);
+}
+
+struct v4l2_rect *ipu6_isys_get_crop(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     unsigned int pad,
+				     unsigned int which)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return &asd->crop;
+	else
+		return v4l2_subdev_get_try_crop(sd, state, pad);
+}
+
+int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct v4l2_mbus_framefmt *ffmt =
+		ipu6_isys_get_ffmt(sd, state, fmt->pad, fmt->which);
+	u32 code = asd->supported_codes[0];
+	unsigned int i;
+
+	mutex_lock(&asd->mutex);
+	if ((sd->entity.pads[fmt->pad].flags & MEDIA_PAD_FL_SOURCE) &&
+	    sd->entity.num_pads > 1) {
+		fmt->format = *ffmt;
+		mutex_unlock(&asd->mutex);
+		return 0;
+	}
+	fmt->format.width = clamp(fmt->format.width, IPU6_ISYS_MIN_WIDTH,
+				  IPU6_ISYS_MAX_WIDTH);
+	fmt->format.height = clamp(fmt->format.height,
+				   IPU6_ISYS_MIN_HEIGHT, IPU6_ISYS_MAX_HEIGHT);
+	for (i = 0; asd->supported_codes[i]; i++) {
+		if (asd->supported_codes[i] == fmt->format.code) {
+			code = asd->supported_codes[i];
+			break;
+		}
+	}
+	fmt->format.code = code;
+	fmt->format.field = V4L2_FIELD_NONE;
+	*ffmt = fmt->format;
+	if (sd->entity.pads[fmt->pad].flags & MEDIA_PAD_FL_SINK) {
+		/* propagate format to following source pad */
+		struct v4l2_rect *crop =
+			ipu6_isys_get_crop(sd, state, fmt->pad + 1, fmt->which);
+
+		*ipu6_isys_get_ffmt(sd, state, fmt->pad + 1, fmt->which) =
+			fmt->format;
+		/* reset crop */
+		crop->left = 0;
+		crop->top = 0;
+		crop->width = ffmt->width;
+		crop->height = ffmt->height;
+	}
+	mutex_unlock(&asd->mutex);
+
+	return 0;
+}
+
+int ipu6_isys_subdev_get_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+
+	mutex_lock(&asd->mutex);
+	fmt->format = *ipu6_isys_get_ffmt(sd, state, fmt->pad, fmt->which);
+	mutex_unlock(&asd->mutex);
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
+int ipu6_isys_subdev_init_cfg(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	unsigned int i;
+
+	mutex_lock(&asd->mutex);
+
+	for (i = 0; i < asd->sd.entity.num_pads; i++) {
+		struct v4l2_mbus_framefmt *try_fmt =
+			v4l2_subdev_get_try_format(sd, state, i);
+		struct v4l2_rect *try_crop =
+			v4l2_subdev_get_try_crop(sd, state, i);
+
+		*try_fmt = asd->ffmt[i];
+		*try_crop = asd->crop;
+	}
+
+	mutex_unlock(&asd->mutex);
+
+	return 0;
+}
+
+int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
+			  const struct v4l2_subdev_ops *ops,
+			  unsigned int nr_ctrls,
+			  unsigned int num_pads)
+{
+	int ret;
+
+	v4l2_subdev_init(&asd->sd, ops);
+
+	asd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	asd->sd.owner = THIS_MODULE;
+	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	asd->pad = devm_kcalloc(&asd->isys->adev->dev, num_pads,
+				sizeof(*asd->pad), GFP_KERNEL);
+
+	asd->ffmt = devm_kcalloc(&asd->isys->adev->dev, num_pads,
+				 sizeof(*asd->ffmt), GFP_KERNEL);
+
+	if (!asd->pad || !asd->ffmt)
+		return -ENOMEM;
+
+	mutex_init(&asd->mutex);
+
+	ret = media_entity_pads_init(&asd->sd.entity, num_pads, asd->pad);
+	if (ret)
+		goto out_mutex_destroy;
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
+out_mutex_destroy:
+	mutex_destroy(&asd->mutex);
+
+	return ret;
+}
+
+void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd)
+{
+	media_entity_cleanup(&asd->sd.entity);
+	v4l2_ctrl_handler_free(&asd->ctrl_handler);
+	mutex_destroy(&asd->mutex);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
new file mode 100644
index 000000000000..c6197425d52f
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013 - 2023 Intel Corporation */
+
+#ifndef IPU6_ISYS_SUBDEV_H
+#define IPU6_ISYS_SUBDEV_H
+
+#include <linux/mutex.h>
+
+#include <media/media-entity.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ctrls.h>
+
+#define FMT_ENTRY (struct ipu6_isys_fmt_entry [])
+
+struct ipu6_isys;
+
+struct ipu6_isys_subdev {
+	/* Serialise access to any other field in the struct */
+	struct mutex mutex;
+	struct v4l2_subdev sd;
+	struct ipu6_isys *isys;
+	u32 const *supported_codes;
+	struct media_pad *pad;
+	struct v4l2_mbus_framefmt *ffmt;
+	struct v4l2_rect crop;
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
+int ipu6_isys_subdev_get_fmt(struct v4l2_subdev *sd,
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
+struct v4l2_mbus_framefmt *ipu6_isys_get_ffmt(struct v4l2_subdev *sd,
+					      struct v4l2_subdev_state *state,
+					      unsigned int pad,
+					      unsigned int which);
+struct v4l2_rect *ipu6_isys_get_crop(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     unsigned int pad,
+				     unsigned int which);
+
+int ipu6_isys_subdev_init_cfg(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state);
+int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
+			  const struct v4l2_subdev_ops *ops,
+			  unsigned int nr_ctrls,
+			  unsigned int num_pads);
+void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd);
+#endif /* IPU6_ISYS_SUBDEV_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h b/drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
new file mode 100644
index 000000000000..60bc9147e25b
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2023 Intel Corporation */
+
+#ifndef IPU6_PLATFORM_ISYS_CSI2_REG_H
+#define IPU6_PLATFORM_ISYS_CSI2_REG_H
+
+#define CSI_REG_BASE			0x220000
+#define CSI_REG_BASE_PORT(id)		((id) * 0x1000)
+
+#define IPU6_CSI_PORT_A_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(0))
+#define IPU6_CSI_PORT_B_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(1))
+#define IPU6_CSI_PORT_C_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(2))
+#define IPU6_CSI_PORT_D_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(3))
+#define IPU6_CSI_PORT_E_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(4))
+#define IPU6_CSI_PORT_F_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(5))
+#define IPU6_CSI_PORT_G_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(6))
+#define IPU6_CSI_PORT_H_ADDR_OFFSET	\
+		(CSI_REG_BASE + CSI_REG_BASE_PORT(7))
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
+#define IPU6_CSI_RX_IRQ_FS_VC		1
+#define IPU6_CSI_RX_IRQ_FE_VC		2
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
+#define CSI_REG_HUB_FW_ACCESS_PORT(ofs, id)	(CSI_REG_BASE + (ofs) + \
+						 (id) * 4)
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
+#define CSI2_HUB_GPREG_DPHY_TIMER_INCR			(0x238040)
+#define CSI2_HUB_GPREG_HPLL_FREQ			(0x238044)
+#define CSI2_HUB_GPREG_IS_CLK_RATIO			(0x238048)
+#define CSI2_HUB_GPREG_HPLL_FREQ_ISCLK_RATE_OVERRIDE	(0x23804c)
+#define CSI2_HUB_GPREG_PORT_CLKGATING_DISABLE		(0x238058)
+#define CSI2_HUB_GPREG_SIP0_CSI_RX_A_CONTROL		(0x23805c)
+#define CSI2_HUB_GPREG_SIP0_CSI_RX_B_CONTROL		(0x238088)
+#define CSI2_HUB_GPREG_SIP1_CSI_RX_A_CONTROL		(0x2380a4)
+#define CSI2_HUB_GPREG_SIP1_CSI_RX_B_CONTROL		(0x2380d0)
+
+#define CSI2_SIP_TOP_CSI_RX_BASE(sip)		(0x23805c + (sip) * 0x48)
+#define CSI2_SIP_TOP_CSI_RX_PORT_BASE_0(port)	(0x23805c + ((port) / 2) * 0x48)
+#define CSI2_SIP_TOP_CSI_RX_PORT_BASE_1(port)	(0x238088 + ((port) / 2) * 0x48)
+
+/* offset from port base */
+#define CSI2_SIP_TOP_CSI_RX_PORT_CONTROL		(0x0)
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_TERMEN_CLANE	(0x4)
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_SETTLE_CLANE	(0x8)
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_TERMEN_DLANE(lane)	(0xc + (lane) * 8)
+#define CSI2_SIP_TOP_CSI_RX_DLY_CNT_SETTLE_DLANE(lane)	(0x10 + (lane) * 8)
+
+#endif /* IPU6_ISYS_CSI2_REG_H */
-- 
2.39.1

