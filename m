Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDAB320B31B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgFZOFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:50098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728973AbgFZOFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C2D02088E;
        Fri, 26 Jun 2020 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=Mrq6ZNq6JHxpqf7M70F+n6CjUaMw/lET6Y4DJqIq1MI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L5gEZ88vPUw7Uzq/6+3pirup9yJh1YG+YUY08UYFAY/gweAMRK/M6HctbPizVfTTB
         wqMQlxM5LkNRG9hrMRjRjdvHHjRoiSBHIYkzfmZOSEDxY2KkBLRmvV5JsxqU8BuDuq
         en3pYsk/3oNxxsgXWAtSq1LXtA9ICGCHAwxTawzg=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyS-00HKw9-2X; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] media: atomisp: Prepare sensor support for ACPI PM
Date:   Fri, 26 Jun 2020 16:04:54 +0200
Message-Id: <2fac02015a0d83e59e59e88c28cfd91521483bed.1593180146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593180146.git.mchehab+huawei@kernel.org>
References: <cover.1593180146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support code for this driver to use ACPI power management.

Yet, at least with known devices, this won't work without
further changes.

The rationale is that the ACPI handling code checks for the _PR? tables
in order to know what is required to switch the device from power state
D0 (_PR0) up to D3COLD (_PR3).

The adev->flags.power_manageable is set to true if the device has a _PR0
table, which can be checked by calling acpi_device_power_manageable(adev).

However, this only says that the device can be set to power off mode.

At least on the DSDT tables we've seen so far, there's no _PR3 nor _PS3
(which would have a somewhat similar effect).

So, using ACPI for power management won't work, except if adding
an ACPI override logic somewhere.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 89 +++++++++++++++++--
 1 file changed, 83 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 74331c4467bd..2903aa52115b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -65,7 +65,6 @@ enum clock_rate {
 struct gmin_subdev {
 	struct v4l2_subdev *subdev;
 	enum clock_rate clock_src;
-	bool clock_on;
 	struct clk *pmc_clk;
 	struct gpio_desc *gpio0;
 	struct gpio_desc *gpio1;
@@ -77,6 +76,8 @@ struct gmin_subdev {
 	unsigned int csi_lanes;
 	enum atomisp_input_format csi_fmt;
 	enum atomisp_bayer_order csi_bayer;
+
+	bool clock_on;
 	bool v1p8_on;
 	bool v2p8_on;
 	bool v1p2_on;
@@ -107,7 +108,7 @@ static enum {
 } pmic_id;
 
 static const char *pmic_name[] = {
-	[PMIC_UNSET]		= "unset",
+	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
 	[PMIC_TI]		= "Dollar Cove TI PMIC",
@@ -500,8 +501,39 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 		gs->gpio1 = NULL;
 
 	/*
-	 * FIXME: the code below doesn't rely on ACPI device_pm.c code to
-	 * set clocks and do power management.
+	 * FIXME:
+	 *
+	 * The ACPI handling code checks for the _PR? tables in order to
+	 * know what is required to switch the device from power state
+	 * D0 (_PR0) up to D3COLD (_PR3).
+	 *
+	 * The adev->flags.power_manageable is set to true if the device
+	 * has a _PR0 table, which can be checked by calling
+	 * acpi_device_power_manageable(adev).
+	 *
+	 * However, this only says that the device can be set to power off
+	 * mode.
+	 *
+	 * At least on the DSDT tables we've seen so far, there's no _PR3,
+	 * nor _PS3 (which would have a somewhat similar effect).
+	 * So, using ACPI for power management won't work, except if adding
+	 * an ACPI override logic somewhere.
+	 *
+	 * So, at least for the existing devices we know, the check below
+	 * will always be false.
+	 */
+	if (acpi_device_can_wakeup(adev) &&
+	    acpi_device_can_poweroff(adev)) {
+		dev_info(dev,
+			 "gmin: power management provided via device PM\n");
+
+		return gs;
+	}
+
+	/*
+	 * The code below is here due to backward compatibility with devices
+	 * whose ACPI BIOS may not contain everything that would be needed
+	 * in order to set clocks and do power management.
 	 */
 
 	if (!pmic_id) {
@@ -856,6 +888,37 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 	return -EINVAL;
 }
 
+static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
+{
+	int ret = 0;
+	struct gmin_subdev *gs = find_gmin_subdev(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+
+	/* Use the ACPI power management to control it */
+	on = !!on;
+	if (gs->clock_on == on)
+		return 0;
+
+	dev_dbg(subdev->dev, "Setting power state to %s\n",
+		on ? "on" : "off");
+
+	if (on)
+		ret = acpi_device_set_power(adev,
+					    ACPI_STATE_D0);
+	else
+		ret = acpi_device_set_power(adev,
+					    ACPI_STATE_D3_COLD);
+
+	if (!ret)
+		gs->clock_on = on;
+	else
+		dev_err(subdev->dev, "Couldn't set power state to %s\n",
+		        on ? "on" : "off");
+
+	return ret;
+}
+
 static int gmin_flisclk_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	int ret = 0;
@@ -921,7 +984,7 @@ static struct camera_vcm_control *gmin_get_vcm_ctrl(struct v4l2_subdev *subdev,
 	return NULL;
 }
 
-static struct camera_sensor_platform_data gmin_plat = {
+static struct camera_sensor_platform_data pmic_gmin_plat = {
 	.gpio0_ctrl = gmin_gpio0_ctrl,
 	.gpio1_ctrl = gmin_gpio1_ctrl,
 	.v1p8_ctrl = gmin_v1p8_ctrl,
@@ -932,6 +995,17 @@ static struct camera_sensor_platform_data gmin_plat = {
 	.get_vcm_ctrl = gmin_get_vcm_ctrl,
 };
 
+static struct camera_sensor_platform_data acpi_gmin_plat = {
+	.gpio0_ctrl = gmin_gpio0_ctrl,
+	.gpio1_ctrl = gmin_gpio1_ctrl,
+	.v1p8_ctrl = gmin_acpi_pm_ctrl,
+	.v2p8_ctrl = gmin_acpi_pm_ctrl,
+	.v1p2_ctrl = gmin_acpi_pm_ctrl,
+	.flisclk_ctrl = gmin_acpi_pm_ctrl,
+	.csi_cfg = gmin_csi_cfg,
+	.get_vcm_ctrl = gmin_get_vcm_ctrl,
+};
+
 struct camera_sensor_platform_data *gmin_camera_platform_data(
     struct v4l2_subdev *subdev,
     enum atomisp_input_format csi_format,
@@ -942,7 +1016,10 @@ struct camera_sensor_platform_data *gmin_camera_platform_data(
 	gs->csi_fmt = csi_format;
 	gs->csi_bayer = csi_bayer;
 
-	return &gmin_plat;
+	if (gs->pmc_clk)
+		return &pmic_gmin_plat;
+	else
+		return &acpi_gmin_plat;
 }
 EXPORT_SYMBOL_GPL(gmin_camera_platform_data);
 
-- 
2.26.2

