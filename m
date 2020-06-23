Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0BA205A1D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733188AbgFWSFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:05:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:20884 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733184AbgFWSFh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:05:37 -0400
IronPort-SDR: sUu6U21ozEbhfEB0wP5VAtyT3bsf5rgxjPGajgI+aCvOOUGza9mQAXecfE6U3pBW6xao+O0rbf
 4Iu+sGEfvOpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="144196303"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="144196303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:36 -0700
IronPort-SDR: Z23JY/MhpI0s/bpMyYdLjLvUSXvwBByeV5TLDO24/jJlM/3/P3qfonDX5NJzIa17+oWXkBvJQc
 5EPxpXwITuFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="478828062"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2020 11:05:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 10B0815C; Tue, 23 Jun 2020 21:05:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/9] =?UTF-8?q?media:=20atomisp:=20Use=20proper=20APIs?= =?UTF-8?q?=20to=20find=20I=C2=B2C=20client=20device=20by=20ACPI=20HID?=
Date:   Tue, 23 Jun 2020 21:05:27 +0300
Message-Id: <20200623180533.65970-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
References: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
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

