Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DBE3C77CF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 22:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbhGMUYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 16:24:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:12038 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235135AbhGMUYD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="274067564"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="274067564"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="427396588"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2021 13:21:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 05ECFFF; Tue, 13 Jul 2021 23:21:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/6] media: ipu3-cio2: Replace open-coded for_each_set_bit()
Date:   Tue, 13 Jul 2021 23:21:26 +0300
Message-Id: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use for_each_set_bit() instead of open-coding it to simplify the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 75 +++++++++----------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 9f75c9303416..5fb379e91071 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -11,6 +11,7 @@
  * et al.
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
@@ -612,6 +613,20 @@ static const char *const cio2_irq_errs[] = {
 	"non-matching Long Packet stalled",
 };
 
+static void cio2_irq_log_irq_errs(struct device *dev, u8 port, u32 status)
+{
+	unsigned long csi2_status = status;
+	unsigned int i;
+
+	for_each_set_bit(i, &csi2_status, ARRAY_SIZE(cio2_irq_errs))
+		dev_err(dev, "CSI-2 receiver port %i: %s\n",
+			port, cio2_irq_errs[i]);
+
+	if (fls_long(csi2_status) >= ARRAY_SIZE(cio2_irq_errs))
+		dev_warn(dev, "unknown CSI2 error 0x%lx on port %i\n",
+			 csi2_status, port);
+}
+
 static const char *const cio2_port_errs[] = {
 	"ECC recoverable",
 	"DPHY not recoverable",
@@ -622,6 +637,15 @@ static const char *const cio2_port_errs[] = {
 	"PKT2LONG",
 };
 
+static void cio2_irq_log_port_errs(struct device *dev, u8 port, u32 status)
+{
+	unsigned long port_status = status;
+	unsigned int i;
+
+	for_each_set_bit(i, &port_status, ARRAY_SIZE(cio2_port_errs))
+		dev_err(dev, "port %i error %s\n", port, cio2_port_errs[i]);
+}
+
 static void cio2_irq_handle_once(struct cio2_device *cio2, u32 int_status)
 {
 	void __iomem *const base = cio2->base;
@@ -687,59 +711,32 @@ static void cio2_irq_handle_once(struct cio2_device *cio2, u32 int_status)
 
 	if (int_status & (CIO2_INT_IOIE | CIO2_INT_IOIRQ)) {
 		/* CSI2 receiver (error) interrupt */
-		u32 ie_status, ie_clear;
 		unsigned int port;
+		u32 ie_status;
 
-		ie_clear = readl(base + CIO2_REG_INT_STS_EXT_IE);
-		ie_status = ie_clear;
+		ie_status = readl(base + CIO2_REG_INT_STS_EXT_IE);
 
 		for (port = 0; port < CIO2_NUM_PORTS; port++) {
 			u32 port_status = (ie_status >> (port * 8)) & 0xff;
-			u32 err_mask = BIT_MASK(ARRAY_SIZE(cio2_port_errs)) - 1;
-			void __iomem *const csi_rx_base =
-						base + CIO2_REG_PIPE_BASE(port);
-			unsigned int i;
-
-			while (port_status & err_mask) {
-				i = ffs(port_status) - 1;
-				dev_err(dev, "port %i error %s\n",
-					port, cio2_port_errs[i]);
-				ie_status &= ~BIT(port * 8 + i);
-				port_status &= ~BIT(i);
-			}
+
+			cio2_irq_log_port_errs(dev, port, port_status);
 
 			if (ie_status & CIO2_INT_EXT_IE_IRQ(port)) {
-				u32 csi2_status, csi2_clear;
+				void __iomem *csi_rx_base =
+						base + CIO2_REG_PIPE_BASE(port);
+				u32 csi2_status;
 
 				csi2_status = readl(csi_rx_base +
 						CIO2_REG_IRQCTRL_STATUS);
-				csi2_clear = csi2_status;
-				err_mask =
-					BIT_MASK(ARRAY_SIZE(cio2_irq_errs)) - 1;
-
-				while (csi2_status & err_mask) {
-					i = ffs(csi2_status) - 1;
-					dev_err(dev,
-						"CSI-2 receiver port %i: %s\n",
-							port, cio2_irq_errs[i]);
-					csi2_status &= ~BIT(i);
-				}
-
-				writel(csi2_clear,
-				       csi_rx_base + CIO2_REG_IRQCTRL_CLEAR);
-				if (csi2_status)
-					dev_warn(dev,
-						 "unknown CSI2 error 0x%x on port %i\n",
-						 csi2_status, port);
 
-				ie_status &= ~CIO2_INT_EXT_IE_IRQ(port);
+				cio2_irq_log_irq_errs(dev, port, csi2_status);
+
+				writel(csi2_status,
+				       csi_rx_base + CIO2_REG_IRQCTRL_CLEAR);
 			}
 		}
 
-		writel(ie_clear, base + CIO2_REG_INT_STS_EXT_IE);
-		if (ie_status)
-			dev_warn(dev, "unknown interrupt 0x%x on IE\n",
-				 ie_status);
+		writel(ie_status, base + CIO2_REG_INT_STS_EXT_IE);
 
 		int_status &= ~(CIO2_INT_IOIE | CIO2_INT_IOIRQ);
 	}
-- 
2.30.2

