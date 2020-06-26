Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B435C20B13E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgFZMTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:32 -0400
Received: from mga17.intel.com ([192.55.52.151]:33134 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728195AbgFZMTb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:31 -0400
IronPort-SDR: FvZ7r2PqOD0e0SuggJep8gr844q7fF16igwFYlruySyK8V+xmFZHLE+7OjB+ACXEcBG3C9QVp7
 TprN5lLhEpOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="125507081"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="125507081"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:30 -0700
IronPort-SDR: YRRJM5yVIDMWVz2g8oYWCSxkG9fgmfKVhX3zierwE1O0X8dsPso+4aMNo6Q2Uh8b/m8T5qAqyo
 apT41o3JYPnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="453346278"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 Jun 2020 05:19:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 354A8377; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 03/15] =?UTF-8?q?media:=20atomisp:=20Use=20proper=20API?= =?UTF-8?q?s=20to=20find=20I=C2=B2C=20client=20device=20by=20ACPI=20HID?=
Date:   Fri, 26 Jun 2020 15:19:13 +0300
Message-Id: <20200626121925.14365-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are specific ACPI and I²C APIs to match device by different parameters,
such as ACPI HID, and retrieve an I²C client. Use them instead of home grown
approach. Note, it fixes a resource leak as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 43 ++++++++-----------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1af9da8acf4c..8acceae189a2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -90,9 +90,9 @@ struct gmin_subdev {
 static struct gmin_subdev gmin_subdevs[MAX_SUBDEVS];
 
 /* ACPI HIDs for the PMICs that could be used by this driver */
-#define PMIC_ACPI_AXP		"INT33F4:00"	/* XPower AXP288 PMIC */
-#define PMIC_ACPI_TI		"INT33F5:00"	/* Dollar Cove TI PMIC */
-#define PMIC_ACPI_CRYSTALCOVE	"INT33FD:00"	/* Crystal Cove PMIC */
+#define PMIC_ACPI_AXP		"INT33F4"	/* XPower AXP288 PMIC */
+#define PMIC_ACPI_TI		"INT33F5"	/* Dollar Cove TI PMIC */
+#define PMIC_ACPI_CRYSTALCOVE	"INT33FD"	/* Crystal Cove PMIC */
 
 #define PMIC_PLATFORM_TI	"intel_soc_pmic_chtdc_ti"
 
@@ -381,34 +381,27 @@ static const guid_t atomisp_dsm_guid = GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
 #define GMIN_PMC_CLK_NAME 14 /* "pmc_plt_clk_[0..5]" */
 static char gmin_pmc_clk_name[GMIN_PMC_CLK_NAME];
 
-static int gmin_i2c_match_one(struct device *dev, const void *data)
-{
-	const char *name = data;
-	struct i2c_client *client;
-
-	if (dev->type != &i2c_client_type)
-		return 0;
-
-	client = to_i2c_client(dev);
-
-	return (!strcmp(name, client->name));
-}
-
 static struct i2c_client *gmin_i2c_dev_exists(struct device *dev, char *name,
 					      struct i2c_client **client)
 {
+	struct acpi_device *adev;
 	struct device *d;
 
-	while ((d = bus_find_device(&i2c_bus_type, NULL, name,
-				    gmin_i2c_match_one))) {
-		*client = to_i2c_client(d);
-		dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
-			(*client)->name, (*client)->addr,
-			(*client)->adapter->nr);
-		return *client;
-	}
+	adev = acpi_dev_get_first_match_dev(name, NULL, -1);
+	if (!adev)
+		return NULL;
 
-	return NULL;
+	d = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
+	acpi_dev_put(adev);
+	if (!d)
+		return NULL;
+
+	*client = i2c_verify_client(d);
+	put_device(d);
+
+	dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
+		(*client)->name, (*client)->addr, (*client)->adapter->nr);
+	return *client;
 }
 
 static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
-- 
2.27.0

