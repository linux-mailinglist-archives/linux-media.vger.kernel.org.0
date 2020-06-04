Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979771EDA61
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 03:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgFDBYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 21:24:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:26928 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgFDBYE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 21:24:04 -0400
IronPort-SDR: oNXz+vuDJmLHJugyGYpAJrtbWldfoErJ3SkeFiRqt9wca3vKX99Exjnyx0EUEaPlQOIuCHQfdA
 awLZCrzMkk/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 18:24:04 -0700
IronPort-SDR: mKhh7KZMGcpIEb0MGAtYZxRHRMbSU61+MqqWNKvBDQNUVfVWGmBd/Ek8A2MnYBE7oZHcwQ31tX
 ILsbSVwVMVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,470,1583222400"; 
   d="scan'208";a="304771094"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2020 18:24:02 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: ov2740: make ov2740 driver only work with ACPI
Date:   Thu,  4 Jun 2020 09:25:19 +0800
Message-Id: <1591233919-6569-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the ACPI id of ov2740 camera sensor was registered as "INT3474",
current ov2740 driver is supposed to be working with ACPI only.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/Kconfig  | 1 +
 drivers/media/i2c/ov2740.c | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index da11036ad804..6804ad57ee71 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -860,6 +860,7 @@ config VIDEO_OV2685
 config VIDEO_OV2740
 	tristate "OmniVision OV2740 sensor support"
 	depends on VIDEO_V4L2 && I2C
+	depends on ACPI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 2dd2609db873..33025c6d23ac 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -988,20 +988,18 @@ static const struct dev_pm_ops ov2740_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov2740_suspend, ov2740_resume)
 };
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{"INT3474"},
 	{}
 };
 
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-#endif
 
 static struct i2c_driver ov2740_i2c_driver = {
 	.driver = {
 		.name = "ov2740",
 		.pm = &ov2740_pm_ops,
-		.acpi_match_table = ACPI_PTR(ov2740_acpi_ids),
+		.acpi_match_table = ov2740_acpi_ids,
 	},
 	.probe_new = ov2740_probe,
 	.remove = ov2740_remove,
-- 
2.7.4

