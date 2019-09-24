Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68397BC69C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504646AbfIXLXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:23:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:10389 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440813AbfIXLXI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:23:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:07 -0700
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="363959057"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:06 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E924120E30;
        Tue, 24 Sep 2019 14:23:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iCiuw-00075G-8r; Tue, 24 Sep 2019 14:23:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 1/7] smiapp: Use the BIT macro where appropriate, remove useless definition
Date:   Tue, 24 Sep 2019 14:23:32 +0300
Message-Id: <20190924112338.27180-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
References: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BIT macro is a better way to define register bits, for 1 << bit is
risky for 32-bit registers.

Also remove the definition of SMIAPP_DATA_TRANSFER_IF_1_CTRL_RD_EN which
has a value of zero.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c |  3 +--
 drivers/media/i2c/smiapp/smiapp-reg.h  | 33 +++++++++++++-------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 9adf8e034e7d6..8fa0290ad15c1 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -986,8 +986,7 @@ static int smiapp_read_nvm(struct smiapp_sensor *sensor,
 
 		rval = smiapp_write(sensor,
 				    SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL,
-				    SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN |
-				    SMIAPP_DATA_TRANSFER_IF_1_CTRL_RD_EN);
+				    SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN);
 		if (rval)
 			goto out;
 
diff --git a/drivers/media/i2c/smiapp/smiapp-reg.h b/drivers/media/i2c/smiapp/smiapp-reg.h
index 2804a4d9a4e19..02b0abef6a223 100644
--- a/drivers/media/i2c/smiapp/smiapp-reg.h
+++ b/drivers/media/i2c/smiapp/smiapp-reg.h
@@ -11,25 +11,26 @@
 #ifndef __SMIAPP_REG_H_
 #define __SMIAPP_REG_H_
 
+#include <linux/bits.h>
+
 #include "smiapp-reg-defs.h"
 
 /* Bits for above register */
-#define SMIAPP_IMAGE_ORIENTATION_HFLIP		(1 << 0)
-#define SMIAPP_IMAGE_ORIENTATION_VFLIP		(1 << 1)
-
-#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN		(1 << 0)
-#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_RD_EN		(0 << 1)
-#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_WR_EN		(1 << 1)
-#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_ERR_CLEAR	(1 << 2)
-#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY	(1 << 0)
-#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_WR_READY	(1 << 1)
-#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_EDATA		(1 << 2)
-#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE		(1 << 3)
-
-#define SMIAPP_SOFTWARE_RESET				(1 << 0)
-
-#define SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE	(1 << 0)
-#define SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE	(1 << 1)
+#define SMIAPP_IMAGE_ORIENTATION_HFLIP			BIT(0)
+#define SMIAPP_IMAGE_ORIENTATION_VFLIP			BIT(1)
+
+#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_EN		BIT(0)
+#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_WR_EN		BIT(1)
+#define SMIAPP_DATA_TRANSFER_IF_1_CTRL_ERR_CLEAR	BIT(2)
+#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY	BIT(0)
+#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_WR_READY	BIT(1)
+#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_EDATA		BIT(2)
+#define SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE		BIT(3)
+
+#define SMIAPP_SOFTWARE_RESET				BIT(0)
+
+#define SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE	BIT(0)
+#define SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE	BIT(1)
 
 #define SMIAPP_DPHY_CTRL_AUTOMATIC			0
 /* DPHY control based on REQUESTED_LINK_BIT_RATE_MBPS */
-- 
2.20.1

