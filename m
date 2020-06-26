Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C5420B14A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgFZMTv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:51 -0400
Received: from mga11.intel.com ([192.55.52.93]:29753 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728353AbgFZMTt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:49 -0400
IronPort-SDR: UVkFqtVOSusx1ikKTHAdEtOCYZVp61e8qmLLoVkLZJqLhcZzY8jdsY6yhNI143n+Zc5JwR74ZZ
 LuwK1F/vwy+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143544881"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="143544881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:33 -0700
IronPort-SDR: YUBmXrTewMBQv5SY1Lq/Mpk0dD76KLFEEihbmVlgx9+wqNP0KLMKrocTq1A5U1meSVaKAIgN93
 LRTWiXYZvcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="424058158"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 75FEE3D3; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 12/15] media: atomisp: Refactor PMIC detection to a separate function.
Date:   Fri, 26 Jun 2020 15:19:22 +0300
Message-Id: <20200626121925.14365-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor PMIC detection to a separate function. In the future
we may move this code somewhere else where it's more suitable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 40 +++++++++++--------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 84e9bf1825fa..26f200b1ed6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -439,19 +439,34 @@ static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
 
 static struct i2c_client *power;
 
+static int gmin_pmic_detect(struct v4l2_subdev *subdev)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct device *dev = &client->dev;
+
+	if (pmic_id)
+		return pmic_id;
+
+	if (gmin_i2c_dev_exists(dev, PMIC_ACPI_TI, &power))
+		pmic_id = PMIC_TI;
+	else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_AXP, &power))
+		pmic_id = PMIC_AXP;
+	else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_CRYSTALCOVE, &power))
+		pmic_id = PMIC_CRYSTALCOVE;
+	else
+		pmic_id = PMIC_REGULATOR;
+
+	return pmic_id;
+}
+
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct device *dev = &client->dev;
 	struct acpi_device *adev;
 	acpi_handle handle;
-	struct device *dev;
 	int i, ret;
 
-	if (!client)
-		return NULL;
-
-	dev = &client->dev;
-
 	handle = ACPI_HANDLE(dev);
 
 	// FIXME: may need to release resources allocated by acpi_bus_get_device()
@@ -463,17 +478,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
 		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
 
-	if (!pmic_id) {
-		if (gmin_i2c_dev_exists(dev, PMIC_ACPI_TI, &power))
-			pmic_id = PMIC_TI;
-		else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_AXP, &power))
-			pmic_id = PMIC_AXP;
-		else if (gmin_i2c_dev_exists(dev, PMIC_ACPI_CRYSTALCOVE, &power))
-			pmic_id = PMIC_CRYSTALCOVE;
-		else
-			pmic_id = PMIC_REGULATOR;
-	}
-
 	for (i = 0; i < MAX_SUBDEVS && gmin_subdevs[i].subdev; i++)
 		;
 	if (i >= MAX_SUBDEVS)
@@ -588,6 +592,8 @@ static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
 	for (i = 0; i < MAX_SUBDEVS; i++)
 		if (gmin_subdevs[i].subdev == subdev)
 			return &gmin_subdevs[i];
+
+	gmin_pmic_detect(subdev);
 	return gmin_subdev_add(subdev);
 }
 
-- 
2.27.0

