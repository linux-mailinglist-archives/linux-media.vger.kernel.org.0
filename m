Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBFE36DB89
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240033AbhD1P0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:26:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56620 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239842AbhD1P0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:26:04 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1988A40556;
        Wed, 28 Apr 2021 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619623518; bh=RY+Uk1q9vM75nnKs82rLqCw2L+ql5Oy1OTv5L4lrZFM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=YkB/CQhBsLHn2k9g+2GCLk0PTihKPNSk3Z9PNLzNkJlFwnV4HJ7FxXht7QejKWEyY
         dI2xWr+T6jTNzXPLALkJwShKrrhIaHkHEaHnQI7S+8wruldzpAwFcjqZiO2D5jZfwv
         0FVu2K4/jatC2l7dNrbB1jn3koZpFZ5HUeuSbnzaNGgp96G5B/eCXfLwGtWt5HaMDP
         Yte040IBjQnVy/QOiiaM9h315EGwPyPN18KCUbQ2Jhhbk6bFs8jOGNrhuXJ7pzUQha
         b0kgUZmsnUknebWb/U02x5hb2oJEF3YQQN+QcDSanuAJ3znK26d9z0udYf94RJ9Y2/
         Dm0wrL2vmBKww==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 79E41A0071;
        Wed, 28 Apr 2021 15:25:16 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [RFC 4/8] phy: dwc: Add Synopsys DesignWare HDMI RX PHYs e405 and e406 Driver
Date:   Wed, 28 Apr 2021 17:25:07 +0200
Message-Id: <9cbe84140e8977ee43e43acd74ebd2cc622f09e8.1618937288.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for the Synopsys DesignWare HDMI RX PHYs e405 and e406.
The PHY receives and decodes HDMI video that is delivered to a controller.

Main features included in this driver are:
 - Equalizer algorithm that chooses the PHY best settings
 according to the detected HDMI cable characteristics.
 - Support for scrambling
 - Support for color depth up to 48bpp
 - Support for HDMI 2.0 modes up to 6G (HDMI 4k@60Hz).

The driver was implemented using the standard PHY API in order to
provide a standard access to the required callbacks to be handled
by the controller through the phy_ops.

There is a bidirectional communication between controller and PHY:
 - controller -> PHY : communication is done using the PHY API
 - controller <- PHY : communication is done using the callbacks,
 provided by the controller, which are required to handle the PHY
 such as: read/write, pddq, reset, etc.
 This callback functions are specified in struct dw_phy_pdata from
 'include/linux/phy/dwc/dw-hdmi-phy-pdata.h'.

Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 drivers/phy/Kconfig                       |   1 +
 drivers/phy/Makefile                      |   1 +
 drivers/phy/dwc/Kconfig                   |  20 ++
 drivers/phy/dwc/Makefile                  |   9 +
 drivers/phy/dwc/phy-dw-hdmi-e405.c        | 497 +++++++++++++++++++++++++++++
 drivers/phy/dwc/phy-dw-hdmi-e406.c        | 475 +++++++++++++++++++++++++++
 drivers/phy/dwc/phy-dw-hdmi-e40x-core.c   | 514 ++++++++++++++++++++++++++++++
 drivers/phy/dwc/phy-dw-hdmi-e40x.h        | 219 +++++++++++++
 include/linux/phy/dwc/dw-hdmi-phy-pdata.h |  73 +++++
 9 files changed, 1809 insertions(+)
 create mode 100644 drivers/phy/dwc/Kconfig
 create mode 100644 drivers/phy/dwc/Makefile
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e405.c
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e406.c
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e40x-core.c
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e40x.h
 create mode 100644 include/linux/phy/dwc/dw-hdmi-phy-pdata.h

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 68d9c2f..db7c4b1 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -65,6 +65,7 @@ source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
+source "drivers/phy/dwc/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/ingenic/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 32261e1..ac63979 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -13,6 +13,7 @@ obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
 					   cadence/	\
+					   dwc/		\
 					   freescale/	\
 					   hisilicon/	\
 					   ingenic/	\
diff --git a/drivers/phy/dwc/Kconfig b/drivers/phy/dwc/Kconfig
new file mode 100644
index 0000000..ab451d8
--- /dev/null
+++ b/drivers/phy/dwc/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_DWC_HDMI_PHY_E40X
+	tristate "Synopsys DesignWare HDMI RX PHYs e405 and e406 driver"
+	select GENERIC_PHY
+	help
+	  Support for Synopsys DesignWare HDMI RX PHYs versions
+	  e405 and e406.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called phy-dw-hdmi-e40x.
+
+config VIDEO_DWC_HDMI_PHY_E40X_SUPPORT_TESTCHIP
+	bool "Synopsys DesignWare HDMI RX PHYs e405/e406 Test Chip Support"
+	depends on VIDEO_DWC_HDMI_PHY_E40X
+	help
+	  Support for Synopsys DesignWare HDMI RX PHYs e405/e406 with Test Chip.
+
+	  To have support for HDMI RX PHYs e405/e406 Test Chip, choose Y here.
+	  It will enable Test Chip additional requirements, for example enable
+	  the z calibration requirement during the PHY configuration.
diff --git a/drivers/phy/dwc/Makefile b/drivers/phy/dwc/Makefile
new file mode 100644
index 0000000..52a5b6b
--- /dev/null
+++ b/drivers/phy/dwc/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the PHY drivers.
+#
+
+phy-dw-hdmi-e40x-y			:= phy-dw-hdmi-e40x-core.o
+phy-dw-hdmi-e40x-y			+= phy-dw-hdmi-e405.o
+phy-dw-hdmi-e40x-y			+= phy-dw-hdmi-e406.o
+obj-$(CONFIG_VIDEO_DWC_HDMI_PHY_E40X)	+= phy-dw-hdmi-e40x.o
diff --git a/drivers/phy/dwc/phy-dw-hdmi-e405.c b/drivers/phy/dwc/phy-dw-hdmi-e405.c
new file mode 100644
index 0000000..d4687d6
--- /dev/null
+++ b/drivers/phy/dwc/phy-dw-hdmi-e405.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare HDMI PHY e405
+ *
+ * Author: Jose Abreu <jose.abreu@synopsys.com>
+ * Author: Nelson Costa <nelson.costa@synopsys.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/phy/dwc/dw-hdmi-phy-pdata.h>
+
+#include "phy-dw-hdmi-e40x.h"
+
+#define DW_PHY_EQ_WAIT_TIME_START		3
+#define DW_PHY_EQ_SLEEP_TIME_CDR		30
+#define DW_PHY_EQ_SLEEP_TIME_ACQ		1
+#define DW_PHY_EQ_BOUNDSPREAD			20
+#define DW_PHY_EQ_MIN_ACQ_STABLE		3
+#define DW_PHY_EQ_ACC_LIMIT			360
+#define DW_PHY_EQ_ACC_MIN_LIMIT			0
+#define DW_PHY_EQ_MAX_SETTING			13
+#define DW_PHY_EQ_SHORT_CABLE_SETTING		4
+#define DW_PHY_EQ_ERROR_CABLE_SETTING		4
+#define DW_PHY_EQ_MIN_SLOPE			50
+#define DW_PHY_EQ_AVG_ACQ			5
+#define DW_PHY_EQ_MINMAX_NTRIES			3
+#define DW_PHY_EQ_COUNTER_VAL			512
+#define DW_PHY_EQ_COUNTER_VAL_HDMI20		512
+#define DW_PHY_EQ_MINMAX_MAXDIFF		4
+#define DW_PHY_EQ_MINMAX_MAXDIFF_HDMI20		2
+#define DW_PHY_EQ_FATBIT_MASK			0x0000
+#define DW_PHY_EQ_FATBIT_MASK_4K		0x0c03
+#define DW_PHY_EQ_FATBIT_MASK_HDMI20		0x0e03
+
+/* PHY e405 mpll configuration */
+static const struct dw_phy_mpll_config dw_phy_e405_mpll_cfg[] = {
+	{ 0x27, 0x1B94 },
+	{ 0x28, 0x16D2 },
+	{ 0x29, 0x12D9 },
+	{ 0x2A, 0x3249 },
+	{ 0x2B, 0x3653 },
+	{ 0x2C, 0x3436 },
+	{ 0x2D, 0x124D },
+	{ 0x2E, 0x0001 },
+	{ 0xCE, 0x0505 },
+	{ 0xCF, 0x0505 },
+	{ 0xD0, 0x0000 },
+	{ 0x00, 0x0000 },
+};
+
+/* PHY e405 equalization functions */
+static int dw_phy_eq_test(struct dw_phy_dev *dw_dev,
+			  u16 *fat_bit_mask, int *min_max_length)
+{
+	u16 main_fsm_status, val;
+	unsigned int i;
+
+	for (i = 0; i < DW_PHY_EQ_WAIT_TIME_START; i++) {
+		main_fsm_status = dw_phy_read(dw_dev, DW_PHY_MAINFSM_STATUS1);
+		if (main_fsm_status & DW_PHY_CLOCK_STABLE)
+			break;
+		mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
+	}
+
+	if (i == DW_PHY_EQ_WAIT_TIME_START) {
+		dev_dbg(dw_dev->dev, "PHY start conditions not achieved\n");
+		return -ETIMEDOUT;
+	}
+
+	if (main_fsm_status & DW_PHY_PLL_RATE_BIT1) {
+		dev_dbg(dw_dev->dev, "invalid pll rate\n");
+		return -EINVAL;
+	}
+
+	val = dw_phy_read(dw_dev, DW_PHY_CDR_CTRL_CNT) &
+		DW_PHY_HDMI_MHL_MODE_MASK;
+	if (val == DW_PHY_HDMI_MHL_MODE_ABOVE_3_4G_BITPS) {
+		/* HDMI 2.0 */
+		*fat_bit_mask = DW_PHY_EQ_FATBIT_MASK_HDMI20;
+		*min_max_length = DW_PHY_EQ_MINMAX_MAXDIFF_HDMI20;
+		dev_dbg(dw_dev->dev, "[EQUALIZER] using HDMI 2.0 values\n");
+	} else if (!(main_fsm_status & DW_PHY_PLL_RATE_MASK)) {
+		/* HDMI 1.4 (pll rate = 0) */
+		*fat_bit_mask = DW_PHY_EQ_FATBIT_MASK_4K;
+		*min_max_length = DW_PHY_EQ_MINMAX_MAXDIFF;
+		dev_dbg(dw_dev->dev, "[EQUALIZER] using HDMI 1.4@4k values\n");
+	} else {
+		/* HDMI 1.4 */
+		*fat_bit_mask = DW_PHY_EQ_FATBIT_MASK;
+		*min_max_length = DW_PHY_EQ_MINMAX_MAXDIFF;
+		dev_dbg(dw_dev->dev, "[EQUALIZER] using HDMI 1.4 values\n");
+	}
+
+	return 0;
+}
+
+static void dw_phy_eq_default(struct dw_phy_dev *dw_dev)
+{
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_LOOP_CTR_LIMIT(8) |
+		      DW_PHY_CH0_MSTR_CTR_LIMIT(10) |
+		      DW_PHY_CH0_ADAP_COMP_LIMIT(4)), DW_PHY_CH0_EQ_CTRL1);
+	dw_phy_write(dw_dev, DW_PHY_CH0_LB_ACTIVE_OVR, DW_PHY_CH0_EQ_CTRL2);
+
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH1_LOOP_CTR_LIMIT(8) |
+		      DW_PHY_CH1_MSTR_CTR_LIMIT(10) |
+		      DW_PHY_CH1_ADAP_COMP_LIMIT(4)), DW_PHY_CH1_EQ_CTRL1);
+	dw_phy_write(dw_dev, DW_PHY_CH1_LB_ACTIVE_OVR, DW_PHY_CH1_EQ_CTRL2);
+
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH2_LOOP_CTR_LIMIT(8) |
+		      DW_PHY_CH2_MSTR_CTR_LIMIT(10) |
+		      DW_PHY_CH2_ADAP_COMP_LIMIT(4)), DW_PHY_CH2_EQ_CTRL1);
+	dw_phy_write(dw_dev, DW_PHY_CH2_LB_ACTIVE_OVR, DW_PHY_CH2_EQ_CTRL2);
+}
+
+static void dw_phy_eq_single(struct dw_phy_dev *dw_dev)
+{
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_LOOP_CTR_LIMIT(1) |
+		      DW_PHY_CH0_MSTR_CTR_LIMIT(1) |
+		      DW_PHY_CH0_ADAP_COMP_LIMIT(1)), DW_PHY_CH0_EQ_CTRL1);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH1_LOOP_CTR_LIMIT(1) |
+		      DW_PHY_CH1_MSTR_CTR_LIMIT(1) |
+		      DW_PHY_CH1_ADAP_COMP_LIMIT(1)), DW_PHY_CH1_EQ_CTRL1);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH2_LOOP_CTR_LIMIT(1) |
+		      DW_PHY_CH2_MSTR_CTR_LIMIT(1) |
+		      DW_PHY_CH2_ADAP_COMP_LIMIT(1)), DW_PHY_CH2_EQ_CTRL1);
+}
+
+static void dw_phy_eq_equal_setting_ch0(struct dw_phy_dev *dw_dev,
+					u16 lock_vector)
+{
+	dw_phy_write(dw_dev, lock_vector, DW_PHY_CH0_EQ_CTRL4);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH0_LB_ACTIVE_OVR), DW_PHY_CH0_EQ_CTRL2);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_OVRD_LOCK |
+		      DW_PHY_CH0_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH0_LB_ACTIVE_OVR), DW_PHY_CH0_EQ_CTRL2);
+	dw_phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS2);
+}
+
+static void dw_phy_eq_equal_setting_ch1(struct dw_phy_dev *dw_dev,
+					u16 lock_vector)
+{
+	dw_phy_write(dw_dev, lock_vector, DW_PHY_CH1_EQ_CTRL4);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH1_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH1_LB_ACTIVE_OVR), DW_PHY_CH1_EQ_CTRL2);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH1_OVRD_LOCK |
+		      DW_PHY_CH1_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH1_LB_ACTIVE_OVR), DW_PHY_CH1_EQ_CTRL2);
+	dw_phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS2);
+}
+
+static void dw_phy_eq_equal_setting_ch2(struct dw_phy_dev *dw_dev,
+					u16 lock_vector)
+{
+	dw_phy_write(dw_dev, lock_vector, DW_PHY_CH2_EQ_CTRL4);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH2_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH2_LB_ACTIVE_OVR), DW_PHY_CH2_EQ_CTRL2);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH2_OVRD_LOCK |
+		      DW_PHY_CH2_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH2_LB_ACTIVE_OVR), DW_PHY_CH2_EQ_CTRL2);
+	dw_phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS2);
+}
+
+static void dw_phy_eq_equal_setting(struct dw_phy_dev *dw_dev, u16 lock_vector)
+{
+	dw_phy_eq_equal_setting_ch0(dw_dev, lock_vector);
+	dw_phy_eq_equal_setting_ch1(dw_dev, lock_vector);
+	dw_phy_eq_equal_setting_ch2(dw_dev, lock_vector);
+}
+
+static void dw_phy_eq_auto_calib(struct dw_phy_dev *dw_dev)
+{
+	dw_phy_write(dw_dev,
+		     (DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE |
+		      DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE |
+		      DW_PHY_FORCE_STATE_DIS |
+		      DW_PHY_MAIN_FSM_STATE(9)), DW_PHY_MAINFSM_CTRL);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE |
+		      DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE |
+		      DW_PHY_FORCE_STATE_EN |
+		      DW_PHY_MAIN_FSM_STATE(9)), DW_PHY_MAINFSM_CTRL);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE |
+		      DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE |
+		      DW_PHY_FORCE_STATE_DIS |
+		      DW_PHY_MAIN_FSM_STATE(9)), DW_PHY_MAINFSM_CTRL);
+}
+
+static void dw_phy_eq_init_vars(struct dw_phy_eq_ch *ch)
+{
+	ch->acc = 0;
+	ch->acq = 0;
+	ch->last_acq = 0;
+	ch->valid_long_setting = 0;
+	ch->valid_short_setting = 0;
+	ch->best_setting = DW_PHY_EQ_SHORT_CABLE_SETTING;
+}
+
+static bool dw_phy_eq_acquire_early_cnt(struct dw_phy_dev *dw_dev,
+					u16 setting, u16 acq,
+					struct dw_phy_eq_ch *ch0,
+					struct dw_phy_eq_ch *ch1,
+					struct dw_phy_eq_ch *ch2)
+{
+	u16 lock_vector = 0x1 << setting;
+	unsigned int i;
+
+	ch0->out_bound_acq = 0;
+	ch1->out_bound_acq = 0;
+	ch2->out_bound_acq = 0;
+	ch0->acq = 0;
+	ch1->acq = 0;
+	ch2->acq = 0;
+
+	dw_phy_eq_equal_setting(dw_dev, lock_vector);
+	dw_phy_eq_auto_calib(dw_dev);
+
+	mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
+	if (!dw_phy_tmds_valid(dw_dev))
+		dev_dbg(dw_dev->dev, "TMDS is NOT valid\n");
+
+	ch0->read_acq = dw_phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS3);
+	ch1->read_acq = dw_phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS3);
+	ch2->read_acq = dw_phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS3);
+
+	ch0->acq += ch0->read_acq;
+	ch1->acq += ch1->read_acq;
+	ch2->acq += ch2->read_acq;
+
+	ch0->upper_bound_acq = ch0->read_acq + DW_PHY_EQ_BOUNDSPREAD;
+	ch0->lower_bound_acq = ch0->read_acq - DW_PHY_EQ_BOUNDSPREAD;
+	ch1->upper_bound_acq = ch1->read_acq + DW_PHY_EQ_BOUNDSPREAD;
+	ch1->lower_bound_acq = ch1->read_acq - DW_PHY_EQ_BOUNDSPREAD;
+	ch2->upper_bound_acq = ch2->read_acq + DW_PHY_EQ_BOUNDSPREAD;
+	ch2->lower_bound_acq = ch2->read_acq - DW_PHY_EQ_BOUNDSPREAD;
+
+	for (i = 1; i < acq; i++) {
+		dw_phy_eq_auto_calib(dw_dev);
+		mdelay(DW_PHY_EQ_SLEEP_TIME_ACQ);
+
+		if (ch0->read_acq > ch0->upper_bound_acq ||
+		    ch0->read_acq < ch0->lower_bound_acq)
+			ch0->out_bound_acq++;
+		if (ch1->read_acq > ch1->upper_bound_acq ||
+		    ch1->read_acq < ch1->lower_bound_acq)
+			ch1->out_bound_acq++;
+		if (ch2->read_acq > ch2->upper_bound_acq ||
+		    ch2->read_acq < ch2->lower_bound_acq)
+			ch2->out_bound_acq++;
+
+		if (i == DW_PHY_EQ_MIN_ACQ_STABLE) {
+			if (!ch0->out_bound_acq &&
+			    !ch1->out_bound_acq &&
+			    !ch2->out_bound_acq) {
+				acq = 3;
+				break;
+			}
+		}
+
+		ch0->read_acq = dw_phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS3);
+		ch1->read_acq = dw_phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS3);
+		ch2->read_acq = dw_phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS3);
+
+		ch0->acq += ch0->read_acq;
+		ch1->acq += ch1->read_acq;
+		ch2->acq += ch2->read_acq;
+	}
+
+	ch0->acq /= acq;
+	ch1->acq /= acq;
+	ch2->acq /= acq;
+
+	return true;
+}
+
+static int dw_phy_eq_test_type(u16 setting, bool tmds_valid,
+			       struct dw_phy_eq_ch *ch)
+{
+	u16 step_slope = 0;
+
+	if (ch->acq < ch->last_acq && tmds_valid) {
+		/* Long cable equalization */
+		ch->acc += ch->last_acq - ch->acq;
+		if (!ch->valid_long_setting && ch->acq < 512 && ch->acc) {
+			ch->best_long_setting = setting;
+			ch->valid_long_setting = 1;
+		}
+		step_slope = ch->last_acq - ch->acq;
+	}
+
+	if (tmds_valid && !ch->valid_short_setting) {
+		/* Short cable equalization */
+		if (setting < DW_PHY_EQ_SHORT_CABLE_SETTING &&
+		    ch->acq < DW_PHY_EQ_COUNTER_VAL) {
+			ch->best_short_setting = setting;
+			ch->valid_short_setting = 1;
+		}
+
+		if (setting == DW_PHY_EQ_SHORT_CABLE_SETTING) {
+			ch->best_short_setting = DW_PHY_EQ_SHORT_CABLE_SETTING;
+			ch->valid_short_setting = 1;
+		}
+	}
+
+	if (ch->valid_long_setting && ch->acc > DW_PHY_EQ_ACC_LIMIT) {
+		ch->best_setting = ch->best_long_setting;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_LONG;
+	}
+
+	if (setting == DW_PHY_EQ_MAX_SETTING && ch->acc < DW_PHY_EQ_ACC_LIMIT &&
+	    ch->valid_short_setting) {
+		ch->best_setting = ch->best_short_setting;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_SHORT;
+	}
+
+	if (setting == DW_PHY_EQ_MAX_SETTING && tmds_valid &&
+	    ch->acc > DW_PHY_EQ_ACC_LIMIT &&
+	    step_slope > DW_PHY_EQ_MIN_SLOPE) {
+		ch->best_setting = DW_PHY_EQ_MAX_SETTING;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_MAX;
+	}
+
+	if (setting == DW_PHY_EQ_MAX_SETTING) {
+		ch->best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR;
+	}
+
+	return 0;
+}
+
+static bool dw_phy_eq_setting_finder(struct dw_phy_dev *dw_dev, u16 acq,
+				     struct dw_phy_eq_ch *ch0,
+				     struct dw_phy_eq_ch *ch1,
+				     struct dw_phy_eq_ch *ch2)
+{
+	int ret_ch0 = 0, ret_ch1 = 0, ret_ch2 = 0;
+	bool tmds_valid = false;
+	u16 act = 0;
+
+	dw_phy_eq_init_vars(ch0);
+	dw_phy_eq_init_vars(ch1);
+	dw_phy_eq_init_vars(ch2);
+
+	tmds_valid = dw_phy_eq_acquire_early_cnt(dw_dev, act, acq,
+						 ch0, ch1, ch2);
+
+	while (!ret_ch0 || !ret_ch1 || !ret_ch2) {
+		act++;
+
+		ch0->last_acq = ch0->acq;
+		ch1->last_acq = ch1->acq;
+		ch2->last_acq = ch2->acq;
+
+		tmds_valid = dw_phy_eq_acquire_early_cnt(dw_dev, act, acq,
+							 ch0, ch1, ch2);
+
+		if (!ret_ch0)
+			ret_ch0 = dw_phy_eq_test_type(act, tmds_valid, ch0);
+		if (!ret_ch1)
+			ret_ch1 = dw_phy_eq_test_type(act, tmds_valid, ch1);
+		if (!ret_ch2)
+			ret_ch2 = dw_phy_eq_test_type(act, tmds_valid, ch2);
+	}
+
+	if (ret_ch0 == DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR ||
+	    ret_ch1 == DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR ||
+	    ret_ch2 == DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR)
+		return false;
+	return true;
+}
+
+static bool dw_phy_eq_maxvsmin(u16 ch0_setting, u16 ch1_setting,
+			       u16 ch2_setting, u16 min_max_length)
+{
+	u16 min = ch0_setting, max = ch0_setting;
+
+	if (ch1_setting > max)
+		max = ch1_setting;
+	if (ch2_setting > max)
+		max = ch2_setting;
+	if (ch1_setting < min)
+		min = ch1_setting;
+	if (ch2_setting < min)
+		min = ch2_setting;
+
+	if ((max - min) > min_max_length)
+		return false;
+	return true;
+}
+
+static int dw_phy_eq_init(struct dw_phy_dev *dw_dev, u16 acq, bool force)
+{
+	struct dw_phy_pdata *phy = dw_dev->config;
+	u16 fat_bit_mask, lock_vector = 0x1;
+	struct dw_phy_eq_ch ch0, ch1, ch2;
+	int min_max_length, ret = 0;
+	u16 mpll_status;
+	unsigned int i;
+
+	if (phy->version < 401)
+		return ret;
+
+	if (!dw_dev->phy_enabled)
+		return -EINVAL;
+
+	mpll_status = dw_phy_read(dw_dev, DW_PHY_CLK_MPLL_STATUS);
+	if (mpll_status == dw_dev->mpll_status && !force)
+		return ret;
+
+	dw_dev->mpll_status = mpll_status;
+
+	dw_phy_write(dw_dev, 0x00, DW_PHY_MAINFSM_OVR2);
+	dw_phy_write(dw_dev, 0x00, DW_PHY_CH0_EQ_CTRL3);
+	dw_phy_write(dw_dev, 0x00, DW_PHY_CH1_EQ_CTRL3);
+	dw_phy_write(dw_dev, 0x00, DW_PHY_CH2_EQ_CTRL3);
+
+	ret = dw_phy_eq_test(dw_dev, &fat_bit_mask, &min_max_length);
+	if (ret) {
+		if (ret == -EINVAL) /* Means equalizer is not needed */
+			ret = 0;
+
+		/* Do not change values if we don't have clock */
+		if (ret != -ETIMEDOUT) {
+			dw_phy_eq_default(dw_dev);
+			dw_phy_pddq(dw_dev, 1);
+			dw_phy_pddq(dw_dev, 0);
+		}
+	} else {
+		dw_phy_eq_single(dw_dev);
+		dw_phy_eq_equal_setting(dw_dev, 0x0001);
+		dw_phy_write(dw_dev, fat_bit_mask, DW_PHY_CH0_EQ_CTRL6);
+		dw_phy_write(dw_dev, fat_bit_mask, DW_PHY_CH1_EQ_CTRL6);
+		dw_phy_write(dw_dev, fat_bit_mask, DW_PHY_CH2_EQ_CTRL6);
+
+		for (i = 0; i < DW_PHY_EQ_MINMAX_NTRIES; i++) {
+			if (dw_phy_eq_setting_finder(dw_dev, acq,
+						     &ch0, &ch1, &ch2)) {
+				if (dw_phy_eq_maxvsmin(ch0.best_setting,
+						       ch1.best_setting,
+						       ch2.best_setting,
+						       min_max_length))
+					break;
+			}
+
+			ch0.best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+			ch1.best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+			ch2.best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+		}
+
+		dev_dbg(dw_dev->dev, "equalizer settings: ch0=0x%x, ch1=0x%x, ch1=0x%x\n",
+			ch0.best_setting, ch1.best_setting, ch2.best_setting);
+
+		if (i == DW_PHY_EQ_MINMAX_NTRIES)
+			ret = -EINVAL;
+
+		lock_vector = 0x1 << ch0.best_setting;
+		dw_phy_eq_equal_setting_ch0(dw_dev, lock_vector);
+
+		lock_vector = 0x1 << ch1.best_setting;
+		dw_phy_eq_equal_setting_ch1(dw_dev, lock_vector);
+
+		lock_vector = 0x1 << ch2.best_setting;
+		dw_phy_eq_equal_setting_ch2(dw_dev, lock_vector);
+
+		dw_phy_pddq(dw_dev, 1);
+		dw_phy_pddq(dw_dev, 0);
+	}
+
+	return ret;
+}
+
+/* PHY e405 data */
+const struct dw_hdmi_phy_data dw_phy_e405_data = {
+	.name = "e405",
+	.version = 405,
+	.mpll_cfg = dw_phy_e405_mpll_cfg,
+	.dw_phy_eq_init = dw_phy_eq_init,
+};
diff --git a/drivers/phy/dwc/phy-dw-hdmi-e406.c b/drivers/phy/dwc/phy-dw-hdmi-e406.c
new file mode 100644
index 0000000..9ee2d00
--- /dev/null
+++ b/drivers/phy/dwc/phy-dw-hdmi-e406.c
@@ -0,0 +1,475 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare HDMI PHY e406
+ *
+ * Author: Nelson Costa <nelson.costa@synopsys.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/phy/dwc/dw-hdmi-phy-pdata.h>
+
+#include "phy-dw-hdmi-e40x.h"
+
+/*
+ * Equalization algorithm based on version 01-08-2019
+ * but with the following adjustments related with 1080p and 4k:
+ * - DW_PHY_EQ_MAX_SETTING 14 -> 10
+ * - DW_PHY_EQ_COUNTER_VAL_4K 512 -> 712
+ *
+ */
+#define DW_PHY_EQ_WAIT_TIME_START		3
+#define DW_PHY_EQ_SLEEP_TIME_CDR		17
+#define DW_PHY_EQ_SLEEP_TIME_ACQ		1
+#define DW_PHY_EQ_BOUNDSPREAD			20
+#define DW_PHY_EQ_MIN_ACQ_STABLE		3
+#define DW_PHY_EQ_ACC_LIMIT			360
+#define DW_PHY_EQ_ACC_MIN_LIMIT			0
+#define DW_PHY_EQ_MAX_SETTING			10
+#define DW_PHY_EQ_SHORT_CABLE_SETTING		4
+#define DW_PHY_EQ_ERROR_CABLE_SETTING		4
+#define DW_PHY_EQ_MIN_SLOPE			50
+#define DW_PHY_EQ_AVG_ACQ			3
+#define DW_PHY_EQ_MINMAX_NTRIES			5
+#define DW_PHY_EQ_COUNTER_VAL			712
+#define DW_PHY_EQ_COUNTER_VAL_4K		712
+#define DW_PHY_EQ_COUNTER_VAL_HDMI20		450
+#define DW_PHY_EQ_MINMAX_MAXDIFF		4
+#define DW_PHY_EQ_MINMAX_MAXDIFF_4K		4
+#define DW_PHY_EQ_MINMAX_MAXDIFF_HDMI20		4
+#define DW_PHY_EQ_FATBIT_MASK			0x0c03
+#define DW_PHY_EQ_FATBIT_MASK_4K		0x0c03
+#define DW_PHY_EQ_FATBIT_MASK_HDMI20		0x0e03
+#define DW_PHY_EQ_CDR_PHUG_FRUG			0x251f
+#define DW_PHY_EQ_CDR_PHUG_FRUG_4k		0x001f
+#define DW_PHY_EQ_CDR_PHUG_FRUG_HDMI20		0x001f
+#define DW_PHY_EQ_CDR_PHUG_FRUG_DEF		0x001f
+#define DW_CHX_EQ_CTRL3_MASK			0x0000
+
+/* PHY e406 mpll configuration */
+static const struct dw_phy_mpll_config dw_phy_e406_mpll_cfg[] = {
+	{ 0x27, 0x1C94 },
+	{ 0x28, 0x3713 },
+	{ 0x29, 0x24DA },
+	{ 0x2A, 0x5492 },
+	{ 0x2B, 0x4B0D },
+	{ 0x2C, 0x4760 },
+	{ 0x2D, 0x008C },
+	{ 0x2E, 0x0010 },
+	{ 0x00, 0x0000 },
+};
+
+/* PHY e406 equalization functions */
+static int dw_phy_eq_test(struct dw_phy_dev *dw_dev,
+			  u16 *fat_bit_mask, int *min_max_length,
+			  u16 *eq_cnt_threshold, u16 *cdr_phug_frug)
+{
+	u16 main_fsm_status, val;
+	unsigned int i;
+
+	for (i = 0; i < DW_PHY_EQ_WAIT_TIME_START; i++) {
+		main_fsm_status = dw_phy_read(dw_dev, DW_PHY_MAINFSM_STATUS1);
+		if (main_fsm_status & DW_PHY_CLOCK_STABLE)
+			break;
+		mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
+	}
+
+	if (i == DW_PHY_EQ_WAIT_TIME_START) {
+		dev_dbg(dw_dev->dev, "PHY start conditions not achieved\n");
+		return -ETIMEDOUT;
+	}
+
+	if (main_fsm_status & DW_PHY_PLL_RATE_BIT1) {
+		dev_dbg(dw_dev->dev, "invalid pll rate\n");
+		return -EINVAL;
+	}
+
+	val = dw_phy_read(dw_dev, DW_PHY_CDR_CTRL_CNT) &
+		DW_PHY_HDMI_MHL_MODE_MASK;
+	if (val == DW_PHY_HDMI_MHL_MODE_ABOVE_3_4G_BITPS) {
+		/* HDMI 2.0 */
+		*fat_bit_mask = DW_PHY_EQ_FATBIT_MASK_HDMI20;
+		*min_max_length = DW_PHY_EQ_MINMAX_MAXDIFF_HDMI20;
+		*eq_cnt_threshold = DW_PHY_EQ_COUNTER_VAL_HDMI20;
+		*cdr_phug_frug = DW_PHY_EQ_CDR_PHUG_FRUG_HDMI20;
+		dev_dbg(dw_dev->dev, "[EQUALIZER] using HDMI 2.0 values\n");
+	} else if (!(main_fsm_status & DW_PHY_PLL_RATE_MASK)) {
+		/* HDMI 1.4 (pll rate = 0) */
+		*fat_bit_mask = DW_PHY_EQ_FATBIT_MASK_4K;
+		*min_max_length = DW_PHY_EQ_MINMAX_MAXDIFF_4K;
+		*eq_cnt_threshold = DW_PHY_EQ_COUNTER_VAL_4K;
+		*cdr_phug_frug = DW_PHY_EQ_CDR_PHUG_FRUG_4k;
+		dev_dbg(dw_dev->dev, "[EQUALIZER] using HDMI 1.4@4k values\n");
+	} else {
+		/* HDMI 1.4 */
+		*fat_bit_mask = DW_PHY_EQ_FATBIT_MASK;
+		*min_max_length = DW_PHY_EQ_MINMAX_MAXDIFF;
+		*eq_cnt_threshold = DW_PHY_EQ_COUNTER_VAL;
+		*cdr_phug_frug = DW_PHY_EQ_CDR_PHUG_FRUG;
+		dev_dbg(dw_dev->dev, "[EQUALIZER] using HDMI 1.4 values\n");
+	}
+
+	return 0;
+}
+
+static void dw_phy_eq_auto_calib(struct dw_phy_dev *dw_dev)
+{
+	dw_phy_write(dw_dev,
+		     (DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE |
+		      DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE |
+		      DW_PHY_FORCE_STATE_DIS |
+		      DW_PHY_MAIN_FSM_STATE(9)), DW_PHY_MAINFSM_CTRL);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE |
+		      DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE |
+		      DW_PHY_FORCE_STATE_EN |
+		      DW_PHY_MAIN_FSM_STATE(9)), DW_PHY_MAINFSM_CTRL);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE |
+		      DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE |
+		      DW_PHY_FORCE_STATE_DIS |
+		      DW_PHY_MAIN_FSM_STATE(9)), DW_PHY_MAINFSM_CTRL);
+}
+
+void dw_phy_eq_settings(struct dw_phy_dev *dw_dev, u16 ch0_setting,
+			u16 ch1_setting, u16 ch2_setting)
+{
+	dw_phy_write(dw_dev,
+		     (DW_CHX_EQ_CTRL3_MASK |
+		      (ch0_setting & DW_PHY_CH0_EXT_EQ_SET_MASK)),
+		     DW_PHY_CH0_EQ_CTRL3);
+	dw_phy_write(dw_dev,
+		     (DW_CHX_EQ_CTRL3_MASK |
+		      (ch1_setting & DW_PHY_CH1_EXT_EQ_SET_MASK)),
+		     DW_PHY_CH1_EQ_CTRL3);
+	dw_phy_write(dw_dev,
+		     (DW_CHX_EQ_CTRL3_MASK |
+		      (ch2_setting & DW_PHY_CH2_EXT_EQ_SET_MASK)),
+		     DW_PHY_CH2_EQ_CTRL3);
+	dw_phy_write(dw_dev, DW_PHY_EQ_EN_OVR_EN, DW_PHY_MAINFSM_OVR2);
+
+	dw_phy_eq_auto_calib(dw_dev);
+}
+
+static void dw_phy_eq_default(struct dw_phy_dev *dw_dev)
+{
+	dw_phy_eq_settings(dw_dev, 0, 0, 0);
+}
+
+static void dw_phy_eq_single(struct dw_phy_dev *dw_dev)
+{
+	u16 val;
+
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_LOOP_CTR_LIMIT(1) |
+		      DW_PHY_CH0_MSTR_CTR_LIMIT(1) |
+		      DW_PHY_CH0_ADAP_COMP_LIMIT(1)), DW_PHY_CH0_EQ_CTRL1);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH1_LOOP_CTR_LIMIT(1) |
+		      DW_PHY_CH1_MSTR_CTR_LIMIT(1) |
+		      DW_PHY_CH1_ADAP_COMP_LIMIT(1)), DW_PHY_CH1_EQ_CTRL1);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH2_LOOP_CTR_LIMIT(1) |
+		      DW_PHY_CH2_MSTR_CTR_LIMIT(1) |
+		      DW_PHY_CH2_ADAP_COMP_LIMIT(1)), DW_PHY_CH2_EQ_CTRL1);
+
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH1_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH1_LB_ACTIVE_OVR |
+		      (DW_PHY_CH1_EQUALIZATION_CTR_THR(DW_PHY_EQ_AVG_ACQ) &
+		       DW_PHY_CH1_EQUALIZATION_CTR_THR_MASK)),
+		     DW_PHY_CH1_EQ_CTRL2);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH2_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH2_LB_ACTIVE_OVR |
+		      (DW_PHY_CH2_EQUALIZATION_CTR_THR(DW_PHY_EQ_AVG_ACQ) &
+		       DW_PHY_CH2_EQUALIZATION_CTR_THR_MASK)),
+		     DW_PHY_CH2_EQ_CTRL2);
+
+	val = dw_phy_read(dw_dev, DW_PHY_MAINFSM_OVR2);
+	val &= ~(DW_PHY_EQ_EN_OVR | DW_PHY_EQ_EN_OVR_EN);
+	dw_phy_write(dw_dev, val, DW_PHY_MAINFSM_OVR2);
+}
+
+static void dw_phy_eq_equal_setting(struct dw_phy_dev *dw_dev, u16 lock_vector)
+{
+	dw_phy_write(dw_dev, lock_vector, DW_PHY_CH0_EQ_CTRL4);
+
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH0_LB_ACTIVE_OVR |
+		      (DW_PHY_CH0_EQUALIZATION_CTR_THR(DW_PHY_EQ_AVG_ACQ) &
+		       DW_PHY_CH0_EQUALIZATION_CTR_THR_MASK) |
+		      DW_PHY_CH0_CH_EQ_SAME_OVRD), DW_PHY_CH0_EQ_CTRL2);
+	dw_phy_write(dw_dev,
+		     (DW_PHY_CH0_OVRD_LOCK |
+		      DW_PHY_CH0_OVRD_LOCK_VECTOR_EN |
+		      DW_PHY_CH0_LB_ACTIVE_OVR |
+		      (DW_PHY_CH0_EQUALIZATION_CTR_THR(DW_PHY_EQ_AVG_ACQ) &
+		       DW_PHY_CH0_EQUALIZATION_CTR_THR_MASK) |
+		      DW_PHY_CH0_CH_EQ_SAME_OVRD), DW_PHY_CH0_EQ_CTRL2);
+}
+
+static void dw_phy_eq_init_vars(struct dw_phy_eq_ch *ch)
+{
+	ch->acc = 0;
+	ch->acq = 0;
+	ch->last_acq = 0;
+	ch->valid_long_setting = 0;
+	ch->valid_short_setting = 0;
+	ch->best_setting = DW_PHY_EQ_SHORT_CABLE_SETTING;
+}
+
+static bool dw_phy_eq_acquire_early_cnt(struct dw_phy_dev *dw_dev,
+					u16 setting, u16 acq,
+					struct dw_phy_eq_ch *ch0,
+					struct dw_phy_eq_ch *ch1,
+					struct dw_phy_eq_ch *ch2)
+{
+	u16 lock_vector = 0x1 << setting;
+
+	ch0->acq = 0;
+	ch1->acq = 0;
+	ch2->acq = 0;
+
+	dw_phy_eq_equal_setting(dw_dev, lock_vector);
+	dw_phy_eq_auto_calib(dw_dev);
+
+	mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
+	if (!dw_phy_tmds_valid(dw_dev))
+		dev_dbg(dw_dev->dev, "TMDS is NOT valid\n");
+
+	ch0->acq = dw_phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS3) >>
+		DW_PHY_EQ_AVG_ACQ;
+	ch1->acq = dw_phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS3) >>
+		DW_PHY_EQ_AVG_ACQ;
+	ch2->acq = dw_phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS3) >>
+		DW_PHY_EQ_AVG_ACQ;
+
+	dev_dbg(dw_dev->dev,
+		"%s -> phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS3) [%d] [%u]\n",
+		__func__, setting, ch0->acq);
+	dev_dbg(dw_dev->dev,
+		"%s -> phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS3) [%d] [%u]\n",
+		__func__, setting, ch1->acq);
+	dev_dbg(dw_dev->dev,
+		"%s -> phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS3) [%d] [%u]\n",
+		__func__, setting, ch2->acq);
+
+	return true;
+}
+
+static int dw_phy_eq_test_type(u16 setting, bool tmds_valid,
+			       u16 eq_cnt_threshold, struct dw_phy_eq_ch *ch)
+{
+	u16 step_slope = 0;
+
+	if (ch->acq < ch->last_acq && tmds_valid) {
+		/* Long cable equalization */
+		ch->acc += ch->last_acq - ch->acq;
+		if (!ch->valid_long_setting &&
+		    ch->acq < eq_cnt_threshold &&
+		    ch->acc > DW_PHY_EQ_ACC_MIN_LIMIT) {
+			ch->best_long_setting = setting;
+			ch->valid_long_setting = 1;
+		}
+		step_slope = ch->last_acq - ch->acq;
+	}
+
+	if (tmds_valid && !ch->valid_short_setting) {
+		/* Short cable equalization */
+		if (setting < DW_PHY_EQ_SHORT_CABLE_SETTING &&
+		    ch->acq < eq_cnt_threshold) {
+			ch->best_short_setting = setting;
+			ch->valid_short_setting = 1;
+		}
+
+		if (setting == DW_PHY_EQ_SHORT_CABLE_SETTING) {
+			ch->best_short_setting = DW_PHY_EQ_SHORT_CABLE_SETTING;
+			ch->valid_short_setting = 1;
+		}
+	}
+
+	if (ch->valid_long_setting && ch->acc > DW_PHY_EQ_ACC_LIMIT) {
+		ch->best_setting = ch->best_long_setting;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_LONG;
+	}
+
+	if (setting == DW_PHY_EQ_MAX_SETTING && ch->acc < DW_PHY_EQ_ACC_LIMIT &&
+	    ch->valid_short_setting) {
+		ch->best_setting = ch->best_short_setting;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_SHORT;
+	}
+
+	if (setting == DW_PHY_EQ_MAX_SETTING && tmds_valid &&
+	    ch->acc > DW_PHY_EQ_ACC_LIMIT &&
+	    step_slope > DW_PHY_EQ_MIN_SLOPE) {
+		ch->best_setting = DW_PHY_EQ_MAX_SETTING;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_MAX;
+	}
+
+	if (setting == DW_PHY_EQ_MAX_SETTING) {
+		ch->best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+		return DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR;
+	}
+
+	return 0;
+}
+
+static bool dw_phy_eq_setting_finder(struct dw_phy_dev *dw_dev, u16 acq,
+				     u16 eq_cnt_threshold,
+				     struct dw_phy_eq_ch *ch0,
+				     struct dw_phy_eq_ch *ch1,
+				     struct dw_phy_eq_ch *ch2)
+{
+	int ret_ch0 = 0, ret_ch1 = 0, ret_ch2 = 0;
+	bool tmds_valid = false;
+	u16 act = 0;
+
+	dw_phy_eq_init_vars(ch0);
+	dw_phy_eq_init_vars(ch1);
+	dw_phy_eq_init_vars(ch2);
+
+	tmds_valid = dw_phy_eq_acquire_early_cnt(dw_dev, act, acq,
+						 ch0, ch1, ch2);
+
+	while (!ret_ch0 || !ret_ch1 || !ret_ch2) {
+		act++;
+
+		ch0->last_acq = ch0->acq;
+		ch1->last_acq = ch1->acq;
+		ch2->last_acq = ch2->acq;
+
+		tmds_valid = dw_phy_eq_acquire_early_cnt(dw_dev, act, acq,
+							 ch0, ch1, ch2);
+
+		if (!ret_ch0)
+			ret_ch0 = dw_phy_eq_test_type(act, tmds_valid,
+						      eq_cnt_threshold, ch0);
+		if (!ret_ch1)
+			ret_ch1 = dw_phy_eq_test_type(act, tmds_valid,
+						      eq_cnt_threshold, ch1);
+		if (!ret_ch2)
+			ret_ch2 = dw_phy_eq_test_type(act, tmds_valid,
+						      eq_cnt_threshold, ch2);
+	}
+
+	if (ret_ch0 == DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR ||
+	    ret_ch1 == DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR ||
+	    ret_ch2 == DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR)
+		return false;
+	return true;
+}
+
+static bool dw_phy_eq_maxvsmin(u16 ch0_setting, u16 ch1_setting,
+			       u16 ch2_setting, u16 min_max_length)
+{
+	u16 min = ch0_setting, max = ch0_setting;
+
+	if (ch1_setting > max)
+		max = ch1_setting;
+	if (ch2_setting > max)
+		max = ch2_setting;
+	if (ch1_setting < min)
+		min = ch1_setting;
+	if (ch2_setting < min)
+		min = ch2_setting;
+
+	if ((max - min) > min_max_length)
+		return false;
+	return true;
+}
+
+static int dw_phy_eq_init(struct dw_phy_dev *dw_dev, u16 acq, bool force)
+{
+	u16 fat_bit_mask, eq_cnt_threshold;
+	struct dw_phy_eq_ch ch0, ch1, ch2;
+	int min_max_length, ret = 0;
+	u16 cdr_phug_frug;
+	u16 mpll_status;
+	unsigned int i;
+
+	if (!dw_dev->phy_enabled)
+		return -EINVAL;
+
+	mpll_status = dw_phy_read(dw_dev, DW_PHY_CLK_MPLL_STATUS);
+	if (mpll_status == dw_dev->mpll_status && !force)
+		return ret;
+
+	dw_dev->mpll_status = mpll_status;
+
+	ret = dw_phy_eq_test(dw_dev, &fat_bit_mask, &min_max_length,
+			     &eq_cnt_threshold, &cdr_phug_frug);
+	if (ret) {
+		if (ret == -EINVAL) /* Means equalizer is not needed */
+			ret = 0;
+
+		/* Do not change values if we don't have clock */
+		if (ret != -ETIMEDOUT) {
+			dw_phy_eq_default(dw_dev);
+			dw_phy_pddq(dw_dev, 1);
+			dw_phy_pddq(dw_dev, 0);
+		}
+	} else {
+		dw_phy_eq_single(dw_dev);
+		dw_phy_write(dw_dev, fat_bit_mask, DW_PHY_CH0_EQ_CTRL6);
+		dw_phy_write(dw_dev, fat_bit_mask, DW_PHY_CH1_EQ_CTRL6);
+		dw_phy_write(dw_dev, fat_bit_mask, DW_PHY_CH2_EQ_CTRL6);
+		/* config cdr */
+		dw_phy_write(dw_dev, cdr_phug_frug, DW_PHY_CH0_CDR_CTRL);
+		dw_phy_write(dw_dev, cdr_phug_frug, DW_PHY_CH1_CDR_CTRL);
+		dw_phy_write(dw_dev, cdr_phug_frug, DW_PHY_CH2_CDR_CTRL);
+
+		for (i = 0; i < DW_PHY_EQ_MINMAX_NTRIES; i++) {
+			if (dw_phy_eq_setting_finder(dw_dev, acq,
+						     eq_cnt_threshold,
+						     &ch0, &ch1, &ch2)) {
+				if (dw_phy_eq_maxvsmin(ch0.best_setting,
+						       ch1.best_setting,
+						       ch2.best_setting,
+						       min_max_length))
+					break;
+			}
+
+			ch0.best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+			ch1.best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+			ch2.best_setting = DW_PHY_EQ_ERROR_CABLE_SETTING;
+		}
+
+		dev_dbg(dw_dev->dev, "equalizer settings: ch0=0x%x, ch1=0x%x, ch1=0x%x\n",
+			ch0.best_setting, ch1.best_setting,
+			ch2.best_setting);
+
+		if (i == DW_PHY_EQ_MINMAX_NTRIES)
+			ret = -EINVAL;
+
+		/* restore cdr to default settings */
+		dw_phy_write(dw_dev, DW_PHY_EQ_CDR_PHUG_FRUG_DEF,
+			     DW_PHY_CH0_CDR_CTRL);
+		dw_phy_write(dw_dev, DW_PHY_EQ_CDR_PHUG_FRUG_DEF,
+			     DW_PHY_CH1_CDR_CTRL);
+		dw_phy_write(dw_dev, DW_PHY_EQ_CDR_PHUG_FRUG_DEF,
+			     DW_PHY_CH2_CDR_CTRL);
+
+		dw_phy_eq_settings(dw_dev, ch0.best_setting, ch1.best_setting,
+				   ch2.best_setting);
+
+		dw_phy_pddq(dw_dev, 1);
+		dw_phy_pddq(dw_dev, 0);
+	}
+
+	return ret;
+}
+
+/* PHY e406 data */
+const struct dw_hdmi_phy_data dw_phy_e406_data = {
+	.name = "e406",
+	.version = 406,
+	.mpll_cfg = dw_phy_e406_mpll_cfg,
+	.dw_phy_eq_init = dw_phy_eq_init,
+};
diff --git a/drivers/phy/dwc/phy-dw-hdmi-e40x-core.c b/drivers/phy/dwc/phy-dw-hdmi-e40x-core.c
new file mode 100644
index 0000000..7bac0c6
--- /dev/null
+++ b/drivers/phy/dwc/phy-dw-hdmi-e40x-core.c
@@ -0,0 +1,514 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare HDMI PHYs e405 and e406 driver
+ *
+ * Author: Jose Abreu <jose.abreu@synopsys.com>
+ * Author: Nelson Costa <nelson.costa@synopsys.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/dwc/dw-hdmi-phy-pdata.h>
+
+#include "phy-dw-hdmi-e40x.h"
+
+void dw_phy_write(struct dw_phy_dev *dw_dev, u16 val, u16 addr)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	funcs->write(arg, val, addr);
+}
+
+u16 dw_phy_read(struct dw_phy_dev *dw_dev, u16 addr)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	return funcs->read(arg, addr);
+}
+
+static void dw_phy_reset(struct dw_phy_dev *dw_dev, int enable)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	funcs->reset(arg, enable);
+}
+
+void dw_phy_pddq(struct dw_phy_dev *dw_dev, int enable)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	funcs->pddq(arg, enable);
+}
+
+static void dw_phy_svsmode(struct dw_phy_dev *dw_dev, int enable)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	funcs->svsmode(arg, enable);
+}
+
+static void dw_phy_zcal_reset(struct dw_phy_dev *dw_dev)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	funcs->zcal_reset(arg);
+}
+
+static bool dw_phy_zcal_done(struct dw_phy_dev *dw_dev)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	return funcs->zcal_done(arg);
+}
+
+bool dw_phy_tmds_valid(struct dw_phy_dev *dw_dev)
+{
+	const struct dw_phy_funcs *funcs = dw_dev->config->funcs;
+	void *arg = dw_dev->config->funcs_arg;
+
+	return funcs->tmds_valid(arg);
+}
+
+static int dw_phy_color_depth_to_mode(u8 color_depth)
+{
+	int sc_clrdep = 0;
+
+	switch (color_depth) {
+	case 24:
+		sc_clrdep = DW_PHY_CLRDEP_8BIT_MODE;
+		break;
+	case 30:
+		sc_clrdep = DW_PHY_CLRDEP_10BIT_MODE;
+		break;
+	case 36:
+		sc_clrdep = DW_PHY_CLRDEP_12BIT_MODE;
+		break;
+	case 48:
+		sc_clrdep = DW_PHY_CLRDEP_16BIT_MODE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return sc_clrdep;
+}
+
+static int dw_phy_config(struct dw_phy_dev *dw_dev, u8 color_depth,
+			 bool hdmi2, bool scrambling)
+{
+	const struct dw_phy_mpll_config *mpll_cfg = dw_dev->phy_data->mpll_cfg;
+	struct dw_phy_pdata *phy = dw_dev->config;
+	struct device *dev = dw_dev->dev;
+	u16 val, sc_clrdep;
+	int timeout = 100;
+	bool zcal_done;
+	int ret;
+
+	dev_dbg(dev, "%s: color_depth=%d, hdmi2=%d, scrambling=%d, cfg_clk=%d\n",
+		__func__, color_depth, hdmi2, scrambling, phy->cfg_clk);
+
+	ret = dw_phy_color_depth_to_mode(color_depth);
+	if (ret < 0)
+		return ret;
+
+	sc_clrdep = ret;
+
+	dw_phy_reset(dw_dev, 1);
+	dw_phy_pddq(dw_dev, 1);
+	dw_phy_svsmode(dw_dev, 1);
+
+#if IS_ENABLED(CONFIG_VIDEO_DWC_HDMI_PHY_E40X_SUPPORT_TESTCHIP)
+	dw_phy_zcal_reset(dw_dev);
+	do {
+		usleep_range(1000, 1100);
+		zcal_done = dw_phy_zcal_done(dw_dev);
+	} while (!zcal_done && timeout--);
+
+	if (!zcal_done) {
+		dev_err(dw_dev->dev, "Zcal calibration failed\n");
+		return -ETIMEDOUT;
+	}
+#endif /* CONFIG_VIDEO_DWC_HDMI_PHY_E40X_SUPPORT_TESTCHIP */
+
+	dw_phy_reset(dw_dev, 0);
+
+	/* CMU */
+	val = DW_PHY_LOCK_THRES(0x08) & DW_PHY_LOCK_THRES_MASK;
+	val |= DW_PHY_TIMEBASE_OVR_EN;
+	val |= DW_PHY_TIMEBASE_OVR(phy->cfg_clk * 4) & DW_PHY_TIMEBASE_OVR_MASK;
+	dw_phy_write(dw_dev, val, DW_PHY_CMU_CONFIG);
+
+	/* Color Depth and enable fast switching */
+	val = dw_phy_read(dw_dev, DW_PHY_SYSTEM_CONFIG);
+	val &= ~DW_PHY_CLRDEP_MASK;
+	val |= sc_clrdep | DW_PHY_FAST_SWITCHING;
+	dw_phy_write(dw_dev, val, DW_PHY_SYSTEM_CONFIG);
+
+	/* MPLL */
+	for (; mpll_cfg->addr != 0x0; mpll_cfg++)
+		dw_phy_write(dw_dev, mpll_cfg->val, mpll_cfg->addr);
+
+	/* Operation for data rates between 3.4Gbps and 6Gbps */
+	val = dw_phy_read(dw_dev, DW_PHY_CDR_CTRL_CNT);
+	val &= ~DW_PHY_HDMI_MHL_MODE_MASK;
+	if (hdmi2)
+		val |= DW_PHY_HDMI_MHL_MODE_ABOVE_3_4G_BITPS;
+	else
+		val |= DW_PHY_HDMI_MHL_MODE_BELOW_3_4G_BITPS;
+	dw_phy_write(dw_dev, val, DW_PHY_CDR_CTRL_CNT);
+
+	/* Scrambling */
+	val = dw_phy_read(dw_dev, DW_PHY_OVL_PROT_CTRL);
+	if (scrambling)
+		val |= DW_PHY_SCRAMBLING_EN_OVR |
+			DW_PHY_SCRAMBLING_EN_OVR_EN;
+	else
+		val &= ~(DW_PHY_SCRAMBLING_EN_OVR |
+			DW_PHY_SCRAMBLING_EN_OVR_EN);
+	dw_phy_write(dw_dev, val, DW_PHY_OVL_PROT_CTRL);
+
+	/* Enable PHY */
+	dw_phy_pddq(dw_dev, 0);
+
+	dw_dev->color_depth = color_depth;
+	dw_dev->hdmi2 = hdmi2;
+	dw_dev->scrambling = scrambling;
+	return 0;
+}
+
+static int dw_phy_enable(struct dw_phy_dev *dw_dev, unsigned char color_depth,
+			 bool hdmi2, bool scrambling)
+{
+	int ret;
+
+	ret = dw_phy_config(dw_dev, color_depth, hdmi2, scrambling);
+	if (ret)
+		return ret;
+
+	dw_phy_reset(dw_dev, 0);
+	dw_phy_pddq(dw_dev, 0);
+	dw_dev->phy_enabled = true;
+	return 0;
+}
+
+static void dw_phy_disable(struct dw_phy_dev *dw_dev)
+{
+	if (!dw_dev->phy_enabled)
+		return;
+
+	dw_phy_reset(dw_dev, 1);
+	dw_phy_pddq(dw_dev, 1);
+	dw_phy_svsmode(dw_dev, 0);
+	dw_dev->mpll_status = 0xFFFF;
+	dw_dev->phy_enabled = false;
+}
+
+static int dw_phy_set_color_depth(struct dw_phy_dev *dw_dev,
+				  u8 color_depth)
+{
+	u16 val, sc_clrdep;
+	int ret;
+
+	if (!dw_dev->phy_enabled)
+		return -EINVAL;
+
+	ret = dw_phy_color_depth_to_mode(color_depth);
+	if (ret < 0)
+		return ret;
+
+	sc_clrdep = ret;
+
+	/* Color Depth */
+	val = dw_phy_read(dw_dev, DW_PHY_SYSTEM_CONFIG);
+	val &= ~DW_PHY_CLRDEP_MASK;
+	val |= sc_clrdep;
+	dw_phy_write(dw_dev, val, DW_PHY_SYSTEM_CONFIG);
+
+	dev_dbg(dw_dev->dev, "%s: color_depth=%d\n", __func__, color_depth);
+
+	return 0;
+}
+
+static bool dw_phy_has_dt(struct dw_phy_dev *dw_dev)
+{
+	return (of_device_get_match_data(dw_dev->dev) != NULL);
+}
+
+static int dw_phy_parse_dt(struct dw_phy_dev *dw_dev)
+{
+	const struct dw_hdmi_phy_data *of_data;
+	int ret;
+
+	of_data = of_device_get_match_data(dw_dev->dev);
+	if (!of_data) {
+		dev_err(dw_dev->dev, "no valid PHY configuration available\n");
+		return -EINVAL;
+	}
+
+	/* load PHY version */
+	dw_dev->config->version = of_data->version;
+
+	/* load PHY clock */
+	dw_dev->clk = devm_clk_get(dw_dev->dev, "cfg");
+	if (IS_ERR(dw_dev->clk)) {
+		dev_err(dw_dev->dev, "failed to get cfg clock\n");
+		return PTR_ERR(dw_dev->clk);
+	}
+
+	ret = clk_prepare_enable(dw_dev->clk);
+	if (ret) {
+		dev_err(dw_dev->dev, "failed to enable cfg clock\n");
+		return ret;
+	}
+
+	dw_dev->config->cfg_clk = clk_get_rate(dw_dev->clk) / 1000000U;
+	if (!dw_dev->config->cfg_clk) {
+		dev_err(dw_dev->dev, "invalid cfg clock frequency\n");
+		ret = -EINVAL;
+		goto err_clk;
+	}
+
+	return 0;
+
+err_clk:
+	clk_disable_unprepare(dw_dev->clk);
+	return ret;
+}
+
+static int dw_phy_parse_pd(struct dw_phy_dev *dw_dev)
+{
+	/* validate if the platform data was properly supplied */
+
+	if (!dw_dev->config->version) {
+		dev_err(dw_dev->dev,
+			"invalid version platform data supplied\n");
+		return -EINVAL;
+	}
+
+	if (!dw_dev->config->cfg_clk) {
+		dev_err(dw_dev->dev, "invalid clock platform data supplied\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dw_phy_set_data(struct dw_phy_dev *dw_dev)
+{
+	const struct dw_hdmi_phy_data *of_data;
+
+	of_data = of_device_get_match_data(dw_dev->dev);
+
+	if (of_data) {
+		dw_dev->phy_data = (struct dw_hdmi_phy_data *)of_data;
+	} else if (dw_dev->config->version == dw_phy_e405_data.version) {
+		dw_dev->phy_data = &dw_phy_e405_data;
+	} else if (dw_dev->config->version == dw_phy_e406_data.version) {
+		dw_dev->phy_data = &dw_phy_e406_data;
+	} else {
+		dev_err(dw_dev->dev, "failed setting PHY data\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const char *dw_phy_lookup_dev_id(struct dw_phy_dev *dw_dev)
+{
+	const char *dev_id = "dw-hdmi-rx";
+
+	/* The lookup dev_id name by default is "dw-hdmi-rx",
+	 * however if there is a parent device associated then
+	 * the dev_id will be overridden by that dev_name of parent.
+	 * This allows other drivers to re-use the same API PHY.
+	 */
+	if (dw_dev->dev->parent)
+		dev_id = dev_name(dw_dev->dev->parent);
+
+	return dev_id;
+}
+
+static int dw_hdmi_phy_calibrate(struct phy *phy)
+{
+	struct dw_phy_dev *dw_dev = phy_get_drvdata(phy);
+	const struct phy_configure_opts_hdmi *hdmi_opts = &dw_dev->hdmi_opts;
+
+	/* call the equalization function for calibration */
+	return dw_dev->phy_data->dw_phy_eq_init(dw_dev,
+						hdmi_opts->calibration_acq,
+						hdmi_opts->calibration_force);
+}
+
+static int dw_hdmi_phy_power_on(struct phy *phy)
+{
+	struct dw_phy_dev *dw_dev = phy_get_drvdata(phy);
+
+	return dw_phy_enable(dw_dev, dw_dev->hdmi_opts.color_depth,
+			     dw_dev->hdmi_opts.tmds_bit_clock_ratio,
+			     dw_dev->hdmi_opts.scrambling);
+}
+
+static int dw_hdmi_phy_power_off(struct phy *phy)
+{
+	struct dw_phy_dev *dw_dev = phy_get_drvdata(phy);
+
+	dw_phy_disable(dw_dev);
+
+	return 0;
+}
+
+static int dw_hdmi_phy_configure(struct phy *phy,
+				 union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct dw_phy_dev *dw_dev = phy_get_drvdata(phy);
+	int ret = 0;
+
+	/* save the configuration options */
+	memcpy(&dw_dev->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+	/* check if it is needed to reconfigure deep_color */
+	if (dw_dev->hdmi_opts.set_color_depth) {
+		if (dw_dev->phy_enabled) {
+			ret = dw_phy_set_color_depth(dw_dev,
+						     hdmi_opts->color_depth);
+			if (!ret)
+				dw_dev->hdmi_opts.set_color_depth = 0;
+		}
+	}
+
+	return ret;
+}
+
+static const struct phy_ops dw_hdmi_phy_ops = {
+	.configure	= dw_hdmi_phy_configure,
+	.power_on	= dw_hdmi_phy_power_on,
+	.calibrate	= dw_hdmi_phy_calibrate,
+	.power_off	= dw_hdmi_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int dw_phy_probe(struct platform_device *pdev)
+{
+	struct dw_phy_pdata *pdata = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct dw_phy_dev *dw_dev;
+	int ret;
+
+	dev_dbg(dev, "probe start\n");
+
+	dw_dev = devm_kzalloc(dev, sizeof(*dw_dev), GFP_KERNEL);
+	if (!dw_dev)
+		return -ENOMEM;
+
+	if (!pdata) {
+		dev_err(dev, "no platform data supplied\n");
+		return -EINVAL;
+	}
+
+	dw_dev->dev = dev;
+	dw_dev->config = pdata;
+
+	/* parse configuration */
+	if (dw_phy_has_dt(dw_dev)) {
+		/* configuration based on device tree */
+		ret = dw_phy_parse_dt(dw_dev);
+	} else {
+		/* configuration based on platform device */
+		ret = dw_phy_parse_pd(dw_dev);
+	}
+	if (ret)
+		goto err;
+
+	/* set phy_data depending on the PHY type */
+	ret = dw_phy_set_data(dw_dev);
+	if (ret)
+		goto err;
+
+	/* Force PHY disabling */
+	dw_dev->phy_enabled = true;
+	dw_phy_disable(dw_dev);
+
+	/* creates the PHY reference */
+	dw_dev->phy = devm_phy_create(dw_dev->dev, node, &dw_hdmi_phy_ops);
+	if (IS_ERR(dw_dev->phy)) {
+		dev_err(dw_dev->dev, "Failed to create HDMI PHY reference\n");
+		return PTR_ERR(dw_dev->phy);
+	}
+
+	platform_set_drvdata(pdev, dw_dev);
+	phy_set_drvdata(dw_dev->phy, dw_dev);
+
+	/* create the lookup association for non-dt systems */
+	if (!node) {
+		ret = phy_create_lookup(dw_dev->phy, "hdmi-phy",
+					dw_phy_lookup_dev_id(dw_dev));
+		if (ret) {
+			dev_err(dev, "Failed to create HDMI PHY lookup\n");
+			goto err;
+		}
+		dev_dbg(dev,
+			"phy_create_lookup: con_id='%s' <-> dev_id='%s')\n",
+			"hdmi-phy", dw_phy_lookup_dev_id(dw_dev));
+	}
+
+	dev_dbg(dev, "driver probed (name=e%d, cfg clock=%d, dev_name=%s)\n",
+		dw_dev->config->version, dw_dev->config->cfg_clk,
+		dev_name(dw_dev->dev));
+	return 0;
+
+err:
+	if (dw_dev->clk)
+		clk_disable_unprepare(dw_dev->clk);
+
+	return ret;
+}
+
+static int dw_phy_remove(struct platform_device *pdev)
+{
+	struct dw_phy_dev *dw_dev = platform_get_drvdata(pdev);
+
+	phy_remove_lookup(dw_dev->phy, "hdmi-phy",
+			  dw_phy_lookup_dev_id(dw_dev));
+
+	if (dw_dev->clk)
+		clk_disable_unprepare(dw_dev->clk);
+
+	return 0;
+}
+
+static const struct of_device_id dw_hdmi_phy_e40x_id[] = {
+	{ .compatible = "snps,dw-hdmi-phy-e405", .data = &dw_phy_e405_data, },
+	{ .compatible = "snps,dw-hdmi-phy-e406", .data = &dw_phy_e406_data, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dw_hdmi_phy_e40x_id);
+
+static struct platform_driver dw_phy_e40x_driver = {
+	.probe = dw_phy_probe,
+	.remove = dw_phy_remove,
+	.driver = {
+		.name = DW_PHY_E40X_DRVNAME,
+		.of_match_table = dw_hdmi_phy_e40x_id,
+	}
+};
+module_platform_driver(dw_phy_e40x_driver);
+
+MODULE_AUTHOR("Jose Abreu <jose.abreu@synopsys.com>");
+MODULE_AUTHOR("Nelson Costa <nelson.costa@synopsys.com>");
+MODULE_DESCRIPTION("DesignWare HDMI PHYs e405 and e406 driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/dwc/phy-dw-hdmi-e40x.h b/drivers/phy/dwc/phy-dw-hdmi-e40x.h
new file mode 100644
index 0000000..03b5c60
--- /dev/null
+++ b/drivers/phy/dwc/phy-dw-hdmi-e40x.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare HDMI PHYs e405 and e406 driver
+ *
+ * Author: Jose Abreu <jose.abreu@synopsys.com>
+ * Author: Nelson Costa <nelson.costa@synopsys.com>
+ */
+
+#ifndef __DW_HDMI_PHY_E40X_H__
+#define __DW_HDMI_PHY_E40X_H__
+
+#include <linux/phy/phy.h>
+
+/* PHYs e405 and e406 Registers */
+
+/* Clock Measurement Unit Configuration Register */
+#define DW_PHY_CMU_CONFIG			0x02
+#define DW_PHY_TIMEBASE_OVR(v)			(v)
+#define DW_PHY_TIMEBASE_OVR_MASK		GENMASK(8, 0)
+#define DW_PHY_TIMEBASE_OVR_EN			BIT(9)
+#define DW_PHY_LOCK_THRES(v)			((v) << 10)
+#define DW_PHY_LOCK_THRES_MASK			GENMASK(15, 10)
+
+/* System Configuration Register */
+#define DW_PHY_SYSTEM_CONFIG			0x03
+#define DW_PHY_CLRDEP_8BIT_MODE			(0 << 5)
+#define DW_PHY_CLRDEP_10BIT_MODE		BIT(5)
+#define DW_PHY_CLRDEP_12BIT_MODE		(2 << 5)
+#define DW_PHY_CLRDEP_16BIT_MODE		(3 << 5)
+#define DW_PHY_CLRDEP_MASK			GENMASK(6, 5)
+#define DW_PHY_FAST_SWITCHING			BIT(11)
+
+/* Main FSM Control Register */
+#define DW_PHY_MAINFSM_CTRL			0x05
+#define DW_PHY_MAIN_FSM_STATE(v)		(v)
+#define DW_PHY_MAIN_FSM_STATE_MASK		GENMASK(3, 0)
+#define DW_PHY_FORCE_STATE_EN			BIT(4)
+#define DW_PHY_FORCE_STATE_DIS			(0 << 4)
+#define DW_PHY_FORCE_STATE_MASK			BIT(4)
+#define DW_PHY_EQCAL_DIS_CTRL_QUARTER_RATE	(BIT(2) << 9)
+#define DW_PHY_EQCAL_DIS_CTRL_ONE_EIGHT_RATE	(BIT(3) << 9)
+#define DW_PHY_EQCAL_DIS_CTRL_MASK		GENMASK(12, 9)
+
+/* Main FSM Override 2 Register */
+#define DW_PHY_MAINFSM_OVR2			0x08
+#define DW_PHY_EQ_EN_OVR			BIT(5)
+#define DW_PHY_EQ_EN_OVR_EN			BIT(6)
+
+/* Main FSM Status 1 Register */
+#define DW_PHY_MAINFSM_STATUS1			0x09
+#define DW_PHY_CLOCK_STABLE			BIT(8)
+#define DW_PHY_PLL_RATE_BIT0			BIT(9)
+#define DW_PHY_PLL_RATE_BIT1			(2 << 9)
+#define DW_PHY_PLL_RATE_MASK			GENMASK(10, 9)
+
+/* Overload Protection Control Register */
+#define DW_PHY_OVL_PROT_CTRL			0x0D
+#define DW_PHY_SCRAMBLING_EN_OVR		BIT(6)
+#define DW_PHY_SCRAMBLING_EN_OVR_EN		BIT(7)
+
+/* CDR Control Register */
+#define DW_PHY_CDR_CTRL_CNT			0x0E
+#define DW_PHY_HDMI_MHL_MODE_BELOW_3_4G_BITPS	(0 << 8)
+#define DW_PHY_HDMI_MHL_MODE_ABOVE_3_4G_BITPS	BIT(8)
+#define DW_PHY_HDMI_MHL_MODE_MASK		GENMASK(9, 8)
+
+#define DW_PHY_CLK_MPLL_STATUS			0x2F
+#define DW_PHY_CH0_CDR_CTRL			0x31
+
+/* Channel 0 Equalizer Control 1 Register*/
+#define DW_PHY_CH0_EQ_CTRL1			0x32
+#define DW_PHY_CH0_LOOP_CTR_LIMIT(v)		(v)
+#define DW_PHY_CH0_LOOP_CTR_LIMIT_MASK		GENMASK(3, 0)
+#define DW_PHY_CH0_MSTR_CTR_LIMIT(v)		((v) << 4)
+#define DW_PHY_CH0_MSTR_CTR_LIMIT_MASK		GENMASK(8, 4)
+#define DW_PHY_CH0_ADAP_COMP_LIMIT(v)		((v) << 9)
+#define DW_PHY_CH0_ADAP_COMP_LIMIT_MASK		GENMASK(12, 9)
+
+/* Channel 0 Equalizer Control 2 Register */
+#define DW_PHY_CH0_EQ_CTRL2			0x33
+#define DW_PHY_CH0_OVRD_LOCK			BIT(1)
+#define DW_PHY_CH0_OVRD_LOCK_VECTOR_EN		BIT(2)
+#define DW_PHY_CH0_LB_ACTIVE_OVR		BIT(5)
+#define DW_PHY_CH0_EQUALIZATION_CTR_THR(v)	((v) << 11)
+#define DW_PHY_CH0_EQUALIZATION_CTR_THR_MASK	GENMASK(13, 11)
+#define DW_PHY_CH0_CH_EQ_SAME_OVRD		BIT(14)
+
+#define DW_PHY_CH0_EQ_STATUS			0x34
+
+/* Channel 0 Equalizer Control 3 Register */
+#define DW_PHY_CH0_EQ_CTRL3			0x3E
+#define DW_PHY_CH0_EXT_EQ_SET_MASK		GENMASK(3, 0)
+
+#define DW_PHY_CH0_EQ_CTRL4			0x3F
+#define DW_PHY_CH0_EQ_STATUS2			0x40
+#define DW_PHY_CH0_EQ_STATUS3			0x42
+#define DW_PHY_CH0_EQ_CTRL6			0x43
+#define DW_PHY_CH1_CDR_CTRL			0x51
+
+/* Channel 1 Equalizer Control 1 Register */
+#define DW_PHY_CH1_EQ_CTRL1			0x52
+#define DW_PHY_CH1_LOOP_CTR_LIMIT(v)		(v)
+#define DW_PHY_CH1_LOOP_CTR_LIMIT_MASK		GENMASK(3, 0)
+#define DW_PHY_CH1_MSTR_CTR_LIMIT(v)		((v) << 4)
+#define DW_PHY_CH1_MSTR_CTR_LIMIT_MASK		GENMASK(8, 4)
+#define DW_PHY_CH1_ADAP_COMP_LIMIT(v)		((v) << 9)
+#define DW_PHY_CH1_ADAP_COMP_LIMIT_MASK		GENMASK(12, 9)
+
+/* Channel 1 Equalizer Control 2 Register */
+#define DW_PHY_CH1_EQ_CTRL2			0x53
+#define DW_PHY_CH1_OVRD_LOCK			BIT(1)
+#define DW_PHY_CH1_OVRD_LOCK_VECTOR_EN		BIT(2)
+#define DW_PHY_CH1_LB_ACTIVE_OVR		BIT(5)
+#define DW_PHY_CH1_EQUALIZATION_CTR_THR(v)	((v) << 11)
+#define DW_PHY_CH1_EQUALIZATION_CTR_THR_MASK	GENMASK(13, 11)
+
+#define DW_PHY_CH1_EQ_STATUS			0x54
+
+/* Channel 1 Equalizer Control 3 Register */
+#define DW_PHY_CH1_EQ_CTRL3			0x5E
+#define DW_PHY_CH1_EXT_EQ_SET_MASK		GENMASK(3, 0)
+
+#define DW_PHY_CH1_EQ_CTRL4			0x5F
+#define DW_PHY_CH1_EQ_STATUS2			0x60
+#define DW_PHY_CH1_EQ_STATUS3			0x62
+#define DW_PHY_CH1_EQ_CTRL6			0x63
+#define DW_PHY_CH2_CDR_CTRL			0x71
+
+/* Channel 2 Equalizer Control 1 Register */
+#define DW_PHY_CH2_EQ_CTRL1			0x72
+#define DW_PHY_CH2_LOOP_CTR_LIMIT(v)		(v)
+#define DW_PHY_CH2_LOOP_CTR_LIMIT_MASK		GENMASK(3, 0)
+#define DW_PHY_CH2_MSTR_CTR_LIMIT(v)		((v) << 4)
+#define DW_PHY_CH2_MSTR_CTR_LIMIT_MASK		GENMASK(8, 4)
+#define DW_PHY_CH2_ADAP_COMP_LIMIT(v)		((v) << 9)
+#define DW_PHY_CH2_ADAP_COMP_LIMIT_MASK		GENMASK(12, 9)
+
+/* Channel 2 Equalizer Control 2 Register */
+#define DW_PHY_CH2_EQ_CTRL2			0x73
+#define DW_PHY_CH2_OVRD_LOCK			BIT(1)
+#define DW_PHY_CH2_OVRD_LOCK_VECTOR_EN		BIT(2)
+#define DW_PHY_CH2_LB_ACTIVE_OVR		BIT(5)
+#define DW_PHY_CH2_EQUALIZATION_CTR_THR(v)	((v) << 11)
+#define DW_PHY_CH2_EQUALIZATION_CTR_THR_MASK	GENMASK(13, 11)
+
+#define DW_PHY_CH2_EQ_STATUS			0x74
+
+/* Channel 2 Equalizer Control 3 Register */
+#define DW_PHY_CH2_EQ_CTRL3			0x7E
+#define DW_PHY_CH2_EXT_EQ_SET_MASK		GENMASK(3, 0)
+
+#define DW_PHY_CH2_EQ_CTRL4			0x7F
+#define DW_PHY_CH2_EQ_STATUS2			0x80
+#define DW_PHY_CH2_EQ_STATUS3			0x82
+#define DW_PHY_CH2_EQ_CTRL6			0x83
+
+/* PHY equalization test type return codes */
+#define DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_LONG	1
+#define DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_SHORT	2
+#define DW_PHY_EQ_TEST_TYPE_BEST_SET_IS_MAX	3
+#define DW_PHY_EQ_TEST_TYPE_BEST_SET_ERROR	255
+
+/* PHY equalization channel struct */
+struct dw_phy_eq_ch {
+	u16 best_long_setting;
+	u8 valid_long_setting;
+	u16 best_short_setting;
+	u8 valid_short_setting;
+	u16 best_setting;
+	u16 acc;
+	u16 acq;
+	u16 last_acq;
+	u16 upper_bound_acq;
+	u16 lower_bound_acq;
+	u16 out_bound_acq;
+	u16 read_acq;
+};
+
+/* PHY mpll configuration struct */
+struct dw_phy_mpll_config {
+	u16 addr;
+	u16 val;
+};
+
+struct dw_phy_dev;
+
+/* PHY data struct */
+struct dw_hdmi_phy_data {
+	const char *name;
+	unsigned int version;
+	const struct dw_phy_mpll_config *mpll_cfg;
+	int (*dw_phy_eq_init)(struct dw_phy_dev *dw_dev, u16 acq, bool force);
+};
+
+/* PHY device struct */
+struct dw_phy_dev {
+	struct device *dev;
+	struct dw_phy_pdata *config;
+	const struct dw_hdmi_phy_data *phy_data;
+	struct phy *phy;
+	struct phy_configure_opts_hdmi hdmi_opts;
+	struct clk *clk;
+	u8 phy_enabled;
+	u16 mpll_status;
+	u8 color_depth;
+	u8 hdmi2;
+	u8 scrambling;
+};
+
+void dw_phy_write(struct dw_phy_dev *dw_dev, u16 val, u16 addr);
+u16 dw_phy_read(struct dw_phy_dev *dw_dev, u16 addr);
+void dw_phy_pddq(struct dw_phy_dev *dw_dev, int enable);
+bool dw_phy_tmds_valid(struct dw_phy_dev *dw_dev);
+
+extern const struct dw_hdmi_phy_data dw_phy_e405_data;
+extern const struct dw_hdmi_phy_data dw_phy_e406_data;
+
+#endif /* __DW_HDMI_PHY_E40X_H__ */
diff --git a/include/linux/phy/dwc/dw-hdmi-phy-pdata.h b/include/linux/phy/dwc/dw-hdmi-phy-pdata.h
new file mode 100644
index 0000000..19f3b05
--- /dev/null
+++ b/include/linux/phy/dwc/dw-hdmi-phy-pdata.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
+ * Synopsys DesignWare HDMI PHY platform data
+ *
+ * Author: Jose Abreu <jose.abreu@synopsys.com>
+ * Author: Nelson Costa <nelson.costa@synopsys.com>
+ */
+
+#ifndef __DW_HDMI_PHY_PDATA_H__
+#define __DW_HDMI_PHY_PDATA_H__
+
+#define DW_PHY_E40X_DRVNAME	"phy-dw-hdmi-e40x"
+
+/**
+ * struct dw_phy_funcs - Set of callbacks used to communicate between phy
+ * and hdmi controller. Controller must correctly fill these callbacks
+ * before probbing the phy driver.
+ *
+ * @write: write callback. Write value 'val' into address 'addr' of phy.
+ *
+ * @read: read callback. Read address 'addr' and return the value.
+ *
+ * @reset: reset callback. Activate phy reset. Active high.
+ *
+ * @pddq: pddq callback. Activate phy configuration mode. Active high.
+ *
+ * @svsmode: svsmode callback. Activate phy retention mode. Active low.
+ *
+ * @zcal_reset: zcal reset callback. Restart the impedance calibration
+ * procedure. Active high. This is only used in prototyping and not in real
+ * ASIC. Callback shall be empty (but non NULL) in ASIC cases.
+ *
+ * @zcal_done: zcal done callback. Return the current status of impedance
+ * calibration procedure. This is only used in prototyping and not in real
+ * ASIC. Shall return always true in ASIC cases.
+ *
+ * @tmds_valid: TMDS valid callback. Return the current status of TMDS signal
+ * that comes from phy and feeds controller. This is read from a controller
+ * register.
+ */
+struct dw_phy_funcs {
+	void (*write)(void *arg, u16 val, u16 addr);
+	u16 (*read)(void *arg, u16 addr);
+	void (*reset)(void *arg, int enable);
+	void (*pddq)(void *arg, int enable);
+	void (*svsmode)(void *arg, int enable);
+	void (*zcal_reset)(void *arg);
+	bool (*zcal_done)(void *arg);
+	bool (*tmds_valid)(void *arg);
+};
+
+/**
+ * struct dw_phy_pdata - Platform data definition for Synopsys HDMI PHY.
+ *
+ * @version: The version of the phy.
+ *
+ * @cfg_clk: Configuration clock.
+ *
+ * @funcs: set of callbacks that must be correctly filled and supplied to phy.
+ * See @dw_phy_funcs.
+ *
+ * @funcs_arg: parameter that is supplied to callbacks along with the function
+ * parameters.
+ */
+struct dw_phy_pdata {
+	unsigned int version;
+	unsigned int cfg_clk;
+	const struct dw_phy_funcs *funcs;
+	void *funcs_arg;
+};
+
+#endif /* __DW_HDMI_PHY_PDATA_H__ */
-- 
2.7.4

