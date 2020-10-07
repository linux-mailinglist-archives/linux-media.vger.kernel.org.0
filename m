Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561AF285ADC
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgJGIqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:09 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57056 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgJGIqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:07 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 109AB634CD2
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:19 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 045/106] ccs: Change my e-mail address
Date:   Wed,  7 Oct 2020 11:44:58 +0300
Message-Id: <20201007084557.25843-38-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use my @linux.intel.com e-mail address in the CCS driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c            | 4 ++--
 drivers/media/i2c/ccs-pll.h            | 2 +-
 drivers/media/i2c/ccs/ccs-core.c       | 6 +++---
 drivers/media/i2c/ccs/ccs-quirk.c      | 2 +-
 drivers/media/i2c/ccs/ccs-quirk.h      | 2 +-
 drivers/media/i2c/ccs/ccs-reg-access.c | 2 +-
 drivers/media/i2c/ccs/ccs-reg-access.h | 2 +-
 drivers/media/i2c/ccs/ccs.h            | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 58f5fe7062ae..0d57bac1599a 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #include <linux/device.h>
@@ -475,6 +475,6 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 }
 EXPORT_SYMBOL_GPL(ccs_pll_calculate);
 
-MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ PLL calculator");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 88d641ee3fa1..07f7f9e8a1cc 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #ifndef CCS_PLL_H
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4e49195efb5f..5d7c5ece578d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2010--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  *
  * Based on smiapp driver by Vimarsh Zutshi
  * Based on jt8ev1.c by Vimarsh Zutshi
@@ -1162,7 +1162,7 @@ static int ccs_setup_flash_strobe(struct ccs_sensor *sensor)
 	 * do not change, or if you do at least know what you're
 	 * doing. :-)
 	 *
-	 * Sakari Ailus <sakari.ailus@iki.fi> 2010-10-25
+	 * Sakari Ailus <sakari.ailus@linux.intel.com> 2010-10-25
 	 *
 	 * flash_strobe_length [us] / 10^6 = (tFlash_strobe_width_ctrl
 	 *	/ EXTCLK freq [Hz]) * flash_strobe_adjustment
@@ -3323,7 +3323,7 @@ static void ccs_module_cleanup(void)
 module_init(ccs_module_init);
 module_exit(ccs_module_cleanup);
 
-MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ camera sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("smiapp");
diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
index 8b4fa60044b2..4fe8c6f70579 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #include <linux/delay.h>
diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 3e7779e2fc4b..6b4ec4beaba0 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #ifndef __CCS_QUIRK__
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 91ccbca11577..aad2727570ec 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #include <asm/unaligned.h>
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.h b/drivers/media/i2c/ccs/ccs-reg-access.h
index 5f6ff9c57698..cfad2e520fe2 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.h
+++ b/drivers/media/i2c/ccs/ccs-reg-access.h
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #ifndef SMIAPP_REGS_H
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index c8a9f4ee093e..6b07e4143ff0 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2010--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
+ * Contact: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
 #ifndef __CCS_H__
-- 
2.27.0

