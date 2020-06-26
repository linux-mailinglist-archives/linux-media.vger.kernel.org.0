Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BB720B32A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbgFZOFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728847AbgFZOFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E96CD208C9;
        Fri, 26 Jun 2020 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=DulXIO7OVijQT9iXYkLptfwGhAen/VGK7uaBhVTomuU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AjGvi2oXfV55cyazhVkwPU1UBg9evShT8u24o43XL4eoMpDWZOqCUmEfIttABsGNP
         u82gukeor7BIMhb1uYAEAzug3CcMPRUgNCUU8O3K9nIrx+FjmQO4kEZ+f9U3EEs3GX
         YdklDm9LyRryDlSPK2bmMOFddiTDBbhpKKG625EE=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyS-00HKw5-1I; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: atomisp: reorganize the code under gmin_subdev_add()
Date:   Fri, 26 Jun 2020 16:04:53 +0200
Message-Id: <f6f8cfa8d2c942c51cda5d3c1d0b97c2692a6392.1593180146.git.mchehab+huawei@kernel.org>
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

The gmin_subdev_add() currently doesn't use ACPI device
power management. In order to prepare for adding support
for it, let's shift some things, placing the PM-related
stuff at the end of the probing logic.

Let's also store the current gs on a temporary var, in
order to simplify the source code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 146 +++++++++---------
 1 file changed, 73 insertions(+), 73 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4aebc7cd22d9..74331c4467bd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -447,6 +447,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
 	struct i2c_client *power = NULL, *client = v4l2_get_subdevdata(subdev);
 	struct acpi_device *adev;
+	struct gmin_subdev *gs;
 	acpi_handle handle;
 	struct device *dev;
 	int i, ret, clock_num;
@@ -457,16 +458,52 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	dev = &client->dev;
 
 	handle = ACPI_HANDLE(dev);
-
-	// FIXME: may need to release resources allocated by acpi_bus_get_device()
-	if (!handle || acpi_bus_get_device(handle, &adev)) {
-		dev_err(dev, "Error could not get ACPI device\n");
-		return NULL;
-	}
+	adev = ACPI_COMPANION(&client->dev);
 
 	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
 		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
 
+	for (i = 0; i < MAX_SUBDEVS && gmin_subdevs[i].subdev; i++)
+		;
+	if (i >= MAX_SUBDEVS)
+		return NULL;
+
+	gs = &gmin_subdevs[i];
+	gs->subdev = subdev;
+
+	/*
+	 * FIXME:
+	 * 	WA:CHT requires XTAL clock as PLL is not stable.
+	 *
+	 * However, such data doesn't seem to be present at the _DSM
+	 * table under the GUID dc2f6c4f-045b-4f1d-97b9-882a6860a4be.
+	 * So, let's change the default according with the ISP version,
+	 * but allowing it to be overridden by BIOS or by DMI match tables.
+	 */
+	if (IS_ISP2401)
+		gs->clock_src = VLV2_CLK_XTAL_25_0MHz;
+	else
+		gs->clock_src = VLV2_CLK_PLL_19P2MHZ;
+
+	gs->clock_src = gmin_get_var_int(dev, false, "ClkSrc",
+					 gs->clock_src);
+
+	gs->csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
+	gs->csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
+
+	gs->gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
+	if (IS_ERR(gs->gpio0))
+		gs->gpio0 = NULL;
+
+	gs->gpio1 = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_LOW);
+	if (IS_ERR(gs->gpio1))
+		gs->gpio1 = NULL;
+
+	/*
+	 * FIXME: the code below doesn't rely on ACPI device_pm.c code to
+	 * set clocks and do power management.
+	 */
+
 	if (!pmic_id) {
 		if (gmin_i2c_dev_exists(dev, PMIC_ACPI_TI, &power))
 			pmic_id = PMIC_TI;
@@ -478,13 +515,8 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 			pmic_id = PMIC_REGULATOR;
 	}
 
-	for (i = 0; i < MAX_SUBDEVS && gmin_subdevs[i].subdev; i++)
-		;
-	if (i >= MAX_SUBDEVS)
-		return NULL;
-
 	if (power) {
-		gmin_subdevs[i].pwm_i2c_addr = power->addr;
+		gs->pwm_i2c_addr = power->addr;
 		dev_info(dev,
 			 "gmin: power management provided via %s (i2c addr 0x%02x)\n",
 			 pmic_name[pmic_id], power->addr);
@@ -493,31 +525,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 			 pmic_name[pmic_id]);
 	}
 
-	gmin_subdevs[i].subdev = subdev;
-
 	/*
-	 * FIXME:
-	 * 	WA:CHT requires XTAL clock as PLL is not stable.
-	 *
-	 * However, such data doesn't seem to be present at the _DSM
-	 * table under the GUID dc2f6c4f-045b-4f1d-97b9-882a6860a4be.
-	 * So, let's change the default according with the ISP version,
-	 * but allowing it to be overridden by BIOS or by DMI match tables.
-	 */
-	if (IS_ISP2401)
-		gmin_subdevs[i].clock_src = VLV2_CLK_XTAL_25_0MHz;
-	else
-		gmin_subdevs[i].clock_src = VLV2_CLK_PLL_19P2MHZ;
-
-	gmin_subdevs[i].clock_src = gmin_get_var_int(dev, false, "ClkSrc",
-						     gmin_subdevs[i].clock_src);
-
-	gmin_subdevs[i].csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
-	gmin_subdevs[i].csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
-
-	/*
-	 * FIXME:
-	 *
 	 * According with :
 	 *   https://github.com/projectceladon/hardware-intel-kernelflinger/blob/master/doc/fastboot.md
 	 *
@@ -540,9 +548,9 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	snprintf(gmin_pmc_clk_name, sizeof(gmin_pmc_clk_name),
 		 "%s_%d", "pmc_plt_clk", clock_num);
 
-	gmin_subdevs[i].pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
-	if (IS_ERR(gmin_subdevs[i].pmc_clk)) {
-		ret = PTR_ERR(gmin_subdevs[i].pmc_clk);
+	gs->pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
+	if (IS_ERR(gs->pmc_clk)) {
+		ret = PTR_ERR(gs->pmc_clk);
 
 		dev_err(dev,
 			"Failed to get clk from %s : %d\n",
@@ -563,25 +571,17 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	 * to disable a clock that has not been enabled,
 	 * we need to enable the clock first.
 	 */
-	ret = clk_prepare_enable(gmin_subdevs[i].pmc_clk);
+	ret = clk_prepare_enable(gs->pmc_clk);
 	if (!ret)
-		clk_disable_unprepare(gmin_subdevs[i].pmc_clk);
-
-	gmin_subdevs[i].gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
-	if (IS_ERR(gmin_subdevs[i].gpio0))
-		gmin_subdevs[i].gpio0 = NULL;
-
-	gmin_subdevs[i].gpio1 = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_LOW);
-	if (IS_ERR(gmin_subdevs[i].gpio1))
-		gmin_subdevs[i].gpio1 = NULL;
+		clk_disable_unprepare(gs->pmc_clk);
 
 	switch (pmic_id) {
 	case PMIC_REGULATOR:
-		gmin_subdevs[i].v1p8_reg = regulator_get(dev, "V1P8SX");
-		gmin_subdevs[i].v2p8_reg = regulator_get(dev, "V2P8SX");
+		gs->v1p8_reg = regulator_get(dev, "V1P8SX");
+		gs->v2p8_reg = regulator_get(dev, "V2P8SX");
 
-		gmin_subdevs[i].v1p2_reg = regulator_get(dev, "V1P2A");
-		gmin_subdevs[i].v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
+		gs->v1p2_reg = regulator_get(dev, "V1P2A");
+		gs->v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
 
 		/* Note: ideally we would initialize v[12]p8_on to the
 		 * output of regulator_is_enabled(), but sadly that
@@ -593,32 +593,32 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 		break;
 
 	case PMIC_AXP:
-		gmin_subdevs[i].eldo1_1p8v = gmin_get_var_int(dev, false,
-							      "eldo1_1p8v",
-							      ELDO1_1P8V);
-		gmin_subdevs[i].eldo1_sel_reg = gmin_get_var_int(dev, false,
-								 "eldo1_sel_reg",
-								 ELDO1_SEL_REG);
-		gmin_subdevs[i].eldo1_ctrl_shift = gmin_get_var_int(dev, false,
-								    "eldo1_ctrl_shift",
-								    ELDO1_CTRL_SHIFT);
-		gmin_subdevs[i].eldo2_1p8v = gmin_get_var_int(dev, false,
-							      "eldo2_1p8v",
-							      ELDO2_1P8V);
-		gmin_subdevs[i].eldo2_sel_reg = gmin_get_var_int(dev, false,
-								 "eldo2_sel_reg",
-								 ELDO2_SEL_REG);
-		gmin_subdevs[i].eldo2_ctrl_shift = gmin_get_var_int(dev, false,
-								    "eldo2_ctrl_shift",
-								    ELDO2_CTRL_SHIFT);
-		gmin_subdevs[i].pwm_i2c_addr = power->addr;
+		gs->eldo1_1p8v = gmin_get_var_int(dev, false,
+						  "eldo1_1p8v",
+						  ELDO1_1P8V);
+		gs->eldo1_sel_reg = gmin_get_var_int(dev, false,
+						     "eldo1_sel_reg",
+						     ELDO1_SEL_REG);
+		gs->eldo1_ctrl_shift = gmin_get_var_int(dev, false,
+							"eldo1_ctrl_shift",
+							ELDO1_CTRL_SHIFT);
+		gs->eldo2_1p8v = gmin_get_var_int(dev, false,
+						  "eldo2_1p8v",
+						  ELDO2_1P8V);
+		gs->eldo2_sel_reg = gmin_get_var_int(dev, false,
+						     "eldo2_sel_reg",
+						     ELDO2_SEL_REG);
+		gs->eldo2_ctrl_shift = gmin_get_var_int(dev, false,
+							"eldo2_ctrl_shift",
+							ELDO2_CTRL_SHIFT);
+		gs->pwm_i2c_addr = power->addr;
 		break;
 
 	default:
 		break;
 	}
 
-	return &gmin_subdevs[i];
+	return gs;
 }
 
 static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
-- 
2.26.2

