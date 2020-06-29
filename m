Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0B920D347
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 21:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgF2S5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 14:57:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:57279 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729915AbgF2S5f (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:57:35 -0400
IronPort-SDR: 5tVecL4Z1QWn1UZVuLnHU61oLFDB612jyCF4Tt/h6Ox0TNVqmk24l5LUhOOAF9xzD/6LWZw2s5
 e3M1Dre0b4ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="230832154"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="230832154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:22:06 -0700
IronPort-SDR: v79V4/a4/CkH6BLY7gFY/8xR+zJAEIqaCGJALbdyv0BqK7P5FEJ422uDCDN8DVKY8AXaJfv+As
 B8kpdSxz3Htg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="386436468"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2020 09:22:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 45BB0198; Mon, 29 Jun 2020 13:57:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/5] media: atomisp: Refactor PMIC detection to a separate function
Date:   Mon, 29 Jun 2020 13:57:35 +0300
Message-Id: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
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
 .../media/atomisp/pci/atomisp_gmin_platform.c | 59 +++++++++++--------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 3856e164e478..7f846a61858d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -478,7 +478,38 @@ static int atomisp_get_acpi_power(struct device *dev, acpi_handle handle)
 	return clock_num;
 }
 
-static struct i2c_client *power;
+static u8 gmin_get_pmic_id_and_addr(struct device *dev)
+{
+	struct i2c_client *power;
+	static u8 pmic_i2c_addr;
+
+	if (pmic_id)
+		return pmic_i2c_addr;
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
+	pmic_i2c_addr = power ? power->addr : 0;
+	return pmic_i2c_addr;
+}
+
+static int gmin_detect_pmic(struct v4l2_subdev *subdev)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct device *dev = &client->dev;
+	u8 pmic_i2c_addr;
+
+	pmic_i2c_addr = gmin_get_pmic_id_and_addr(dev);
+	dev_info(dev, "gmin: power management provided via %s (i2c addr 0x%02x)\n",
+		 pmic_name[pmic_id], pmic_i2c_addr);
+	return pmic_i2c_addr;
+}
 
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
@@ -593,27 +624,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	 * in order to set clocks and do power management.
 	 */
 
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
-	if (power) {
-		gs->pwm_i2c_addr = power->addr;
-		dev_info(dev,
-			 "gmin: power management provided via %s (i2c addr 0x%02x)\n",
-			 pmic_name[pmic_id], power->addr);
-	} else {
-		dev_info(dev, "gmin: power management provided via %s\n",
-			 pmic_name[pmic_id]);
-	}
-
 	/*
 	 * According with :
 	 *   https://github.com/projectceladon/hardware-intel-kernelflinger/blob/master/doc/fastboot.md
@@ -1066,10 +1076,13 @@ struct camera_sensor_platform_data *gmin_camera_platform_data(
     enum atomisp_input_format csi_format,
     enum atomisp_bayer_order csi_bayer)
 {
-	struct gmin_subdev *gs = gmin_subdev_add(subdev);
+	struct gmin_subdev *gs;
+	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
 
+	gs = gmin_subdev_add(subdev);
 	gs->csi_fmt = csi_format;
 	gs->csi_bayer = csi_bayer;
+	gs->pwm_i2c_addr = pmic_i2c_addr;
 
 	if (gs->pmc_clk)
 		return &pmic_gmin_plat;
-- 
2.27.0

