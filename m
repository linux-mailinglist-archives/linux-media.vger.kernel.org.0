Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCAF2DC8A0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410615AbfJRPcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47682 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633375AbfJRPcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWBQ7013383;
        Fri, 18 Oct 2019 10:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412731;
        bh=ZJfZ53pYIRfGAB29qt+twF5p9lOD9hiLOcYLhuZ1TDo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=filJIWvVsvAVztE+/jMTuGWerVMYrSC2tkbDeJHz536mHKR3RV0fA+ivMWlIBddu8
         Y8e6C2dqVQ0vvD1LY5U8/XwXmg0A8ZBFpIOuhzpgaaryLmFfwU8l2EN4nkONpNtuDS
         Fc0Zn5I2OoSMVtVinwSX3lHyuvYNuNCMaC3LIkb0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFWB19080525
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:11 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:02 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15L080266;
        Fri, 18 Oct 2019 10:32:10 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch 07/19] media: ti-vpe: cal: add CSI2 PHY LDO errata support
Date:   Fri, 18 Oct 2019 10:34:25 -0500
Message-ID: <20191018153437.20614-8-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Apply Errata i913 every time the functional clock is enabled.
This should take care of suspend/resume case as well.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 56 +++++++++++++++++++++++-
 drivers/media/platform/ti-vpe/cal_regs.h | 27 ++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 62aeedb705e9..3cbc4dca6de8 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -284,6 +284,13 @@ static struct cal_data dra72x_cal_data = {
 	.flags = 0,
 };
 
+static struct cal_data dra72x_es1_cal_data = {
+	.csi2_phy_core = dra72x_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_csi_phy),
+
+	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
+};
+
 /*
  * there is one cal_dev structure in the driver, it is shared by
  * all instances.
@@ -569,9 +576,52 @@ static void cal_get_hwinfo(struct cal_dev *dev)
 		hwinfo);
 }
 
+/*
+ *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
+ *
+ *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
+ *   LDOs on the device are disabled if CSI-2 module is powered on
+ *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
+ *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
+ *   current draw on the module supply in active mode.
+ *
+ *   Errata does not apply when CSI-2 module is powered off
+ *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
+ *
+ * SW Workaround:
+ *	Set the following register bits to disable the LDO,
+ *	which is essentially CSI2 REG10 bit 6:
+ *
+ *		Core 0:  0x4845 B828 = 0x0000 0040
+ *		Core 1:  0x4845 B928 = 0x0000 0040
+ */
+static void i913_errata(struct cal_dev *dev, unsigned int port)
+{
+	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
+
+	set_field(&reg10, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
+		  CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
+
+	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
+	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
+}
+
 static inline int cal_runtime_get(struct cal_dev *dev)
 {
-	return pm_runtime_get_sync(&dev->pdev->dev);
+	int r;
+
+	r = pm_runtime_get_sync(&dev->pdev->dev);
+
+	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
+		/*
+		 * Apply errata on both port eveytime we (re-)enable
+		 * the clock
+		 */
+		i913_errata(dev, 0);
+		i913_errata(dev, 1);
+	}
+
+	return r;
 }
 
 static inline void cal_runtime_put(struct cal_dev *dev)
@@ -2071,6 +2121,10 @@ static const struct of_device_id cal_of_match[] = {
 		.compatible = "ti,dra72-cal",
 		.data = (void *)&dra72x_cal_data,
 	},
+	{
+		.compatible = "ti,dra72-pre-es2-cal",
+		.data = (void *)&dra72x_es1_cal_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, cal_of_match);
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 68cfc922b422..78d6f015c9ea 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -10,6 +10,30 @@
 #ifndef __TI_CAL_REGS_H
 #define __TI_CAL_REGS_H
 
+/*
+ * struct cal_dev.flags possibilities
+ *
+ * DRA72_CAL_PRE_ES2_LDO_DISABLE:
+ *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
+ *
+ *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
+ *   LDOs on the device are disabled if CSI-2 module is powered on
+ *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
+ *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
+ *   current draw on the module supply in active mode.
+ *
+ *   Errata does not apply when CSI-2 module is powered off
+ *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
+ *
+ * SW Workaround:
+ *	Set the following register bits to disable the LDO,
+ *	which is essentially CSI2 REG10 bit 6:
+ *
+ *		Core 0:  0x4845 B828 = 0x0000 0040
+ *		Core 1:  0x4845 B928 = 0x0000 0040
+ */
+#define DRA72_CAL_PRE_ES2_LDO_DISABLE BIT(0)
+
 #define CAL_NUM_CSI2_PORTS		2
 
 /* CAL register offsets */
@@ -71,6 +95,7 @@
 #define CAL_CSI2_PHY_REG0		0x000
 #define CAL_CSI2_PHY_REG1		0x004
 #define CAL_CSI2_PHY_REG2		0x008
+#define CAL_CSI2_PHY_REG10		0x028
 
 /* CAL Control Module Core Camerrx Control register offsets */
 #define CM_CTRL_CORE_CAMERRX_CONTROL	0x000
@@ -458,6 +483,8 @@
 #define CAL_CSI2_PHY_REG1_CLOCK_MISS_DETECTOR_STATUS_SUCCESS		0
 #define CAL_CSI2_PHY_REG1_RESET_DONE_STATUS_MASK		GENMASK(29, 28)
 
+#define CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK		BIT_MASK(6)
+
 #define CAL_CSI2_PHY_REG2_CCP2_SYNC_PATTERN_MASK		GENMASK(23, 0)
 #define CAL_CSI2_PHY_REG2_TRIGGER_CMD_RXTRIGESC3_MASK		GENMASK(25, 24)
 #define CAL_CSI2_PHY_REG2_TRIGGER_CMD_RXTRIGESC2_MASK		GENMASK(27, 26)
-- 
2.17.1

