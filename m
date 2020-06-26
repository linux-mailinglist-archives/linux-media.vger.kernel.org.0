Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB1020B144
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgFZMTh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:5321 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728286AbgFZMTf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:35 -0400
IronPort-SDR: luEhe9tSXnl2M9cr15qoNVvjQOxYx8chLtdpz5lpdgRNFYqhxFSGzyUuGbOuQQvz4WFGG844AM
 iuxrWEu6LtPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="142816236"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="142816236"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: mDqiNU+W9JSyolTx0VzKUu5ZVmo43aDx4oD58Mhfyz7PKz2erpcfU5TbwYMp0lyfnfJpMMEw+a
 CKkYqdP0Sv1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="302324056"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8A64F6C3; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 13/15] media: atomisp: Provide Gmin subdev as parameter to gmin_subdev_add()
Date:   Fri, 26 Jun 2020 15:19:23 +0300
Message-Id: <20200626121925.14365-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide Gmin subdev as parameter to gmin_subdev_add()
to avoid direct global variable usage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 104 ++++++++----------
 1 file changed, 46 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 26f200b1ed6d..d0b9d906a563 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -459,13 +459,13 @@ static int gmin_pmic_detect(struct v4l2_subdev *subdev)
 	return pmic_id;
 }
 
-static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
+static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev, struct gmin_subdev *gdev)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct device *dev = &client->dev;
 	struct acpi_device *adev;
 	acpi_handle handle;
-	int i, ret;
+	int ret;
 
 	handle = ACPI_HANDLE(dev);
 
@@ -478,13 +478,8 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
 		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
 
-	for (i = 0; i < MAX_SUBDEVS && gmin_subdevs[i].subdev; i++)
-		;
-	if (i >= MAX_SUBDEVS)
-		return NULL;
-
 	if (power) {
-		gmin_subdevs[i].pwm_i2c_addr = power->addr;
+		gdev->pwm_i2c_addr = power->addr;
 		dev_info(dev,
 			 "gmin: power management provided via %s (i2c addr 0x%02x)\n",
 			 pmic_name[pmic_id], power->addr);
@@ -493,28 +488,21 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 			 pmic_name[pmic_id]);
 	}
 
-	gmin_subdevs[i].subdev = subdev;
-	gmin_subdevs[i].clock_num = gmin_get_var_int(dev, false, "CamClk", 0);
+	gdev->subdev = subdev;
+	gdev->clock_num = gmin_get_var_int(dev, false, "CamClk", 0);
 	/*WA:CHT requires XTAL clock as PLL is not stable.*/
-	gmin_subdevs[i].clock_src = gmin_get_var_int(dev, false, "ClkSrc",
-				    VLV2_CLK_PLL_19P2MHZ);
-	gmin_subdevs[i].csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
-	gmin_subdevs[i].csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
+	gdev->clock_src = gmin_get_var_int(dev, false, "ClkSrc", VLV2_CLK_PLL_19P2MHZ);
+	gdev->csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
+	gdev->csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
 
 	/* get PMC clock with clock framework */
-	snprintf(gmin_pmc_clk_name,
-		 sizeof(gmin_pmc_clk_name),
-		 "%s_%d", "pmc_plt_clk", gmin_subdevs[i].clock_num);
-
-	gmin_subdevs[i].pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
-	if (IS_ERR(gmin_subdevs[i].pmc_clk)) {
-		ret = PTR_ERR(gmin_subdevs[i].pmc_clk);
-
-		dev_err(dev,
-			"Failed to get clk from %s : %d\n",
-			gmin_pmc_clk_name,
-			ret);
+	snprintf(gmin_pmc_clk_name, sizeof(gmin_pmc_clk_name),
+		 "pmc_plt_clk_%d", gdev->clock_num);
 
+	gdev->pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
+	if (IS_ERR(gdev->pmc_clk)) {
+		ret = PTR_ERR(gdev->pmc_clk);
+		dev_err(dev, "Failed to get clk from %s: %d\n", gmin_pmc_clk_name, ret);
 		return NULL;
 	}
 
@@ -528,25 +516,25 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	 * to disable a clock that has not been enabled,
 	 * we need to enable the clock first.
 	 */
-	ret = clk_prepare_enable(gmin_subdevs[i].pmc_clk);
+	ret = clk_prepare_enable(gdev->pmc_clk);
 	if (!ret)
-		clk_disable_unprepare(gmin_subdevs[i].pmc_clk);
+		clk_disable_unprepare(gdev->pmc_clk);
 
-	gmin_subdevs[i].gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
-	if (IS_ERR(gmin_subdevs[i].gpio0))
-		gmin_subdevs[i].gpio0 = NULL;
+	gdev->gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
+	if (IS_ERR(gdev->gpio0))
+		gdev->gpio0 = NULL;
 
-	gmin_subdevs[i].gpio1 = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_LOW);
-	if (IS_ERR(gmin_subdevs[i].gpio1))
-		gmin_subdevs[i].gpio1 = NULL;
+	gdev->gpio1 = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_LOW);
+	if (IS_ERR(gdev->gpio1))
+		gdev->gpio1 = NULL;
 
 	switch (pmic_id) {
 	case PMIC_REGULATOR:
-		gmin_subdevs[i].v1p8_reg = regulator_get(dev, "V1P8SX");
-		gmin_subdevs[i].v2p8_reg = regulator_get(dev, "V2P8SX");
+		gdev->v1p8_reg = regulator_get(dev, "V1P8SX");
+		gdev->v2p8_reg = regulator_get(dev, "V2P8SX");
 
-		gmin_subdevs[i].v1p2_reg = regulator_get(dev, "V1P2A");
-		gmin_subdevs[i].v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
+		gdev->v1p2_reg = regulator_get(dev, "V1P2A");
+		gdev->v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
 
 		/* Note: ideally we would initialize v[12]p8_on to the
 		 * output of regulator_is_enabled(), but sadly that
@@ -558,31 +546,25 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
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
+		gdev->eldo1_1p8v = gmin_get_var_int(dev, false, "eldo1_1p8v",
+						    ELDO1_1P8V);
+		gdev->eldo1_sel_reg = gmin_get_var_int(dev, false, "eldo1_sel_reg",
+						       ELDO1_SEL_REG);
+		gdev->eldo1_ctrl_shift = gmin_get_var_int(dev, false, "eldo1_ctrl_shift",
+							  ELDO1_CTRL_SHIFT);
+		gdev->eldo2_1p8v = gmin_get_var_int(dev, false, "eldo2_1p8v",
+						    ELDO2_1P8V);
+		gdev->eldo2_sel_reg = gmin_get_var_int(dev, false, "eldo2_sel_reg",
+						       ELDO2_SEL_REG);
+		gdev->eldo2_ctrl_shift = gmin_get_var_int(dev, false, "eldo2_ctrl_shift",
+							  ELDO2_CTRL_SHIFT);
 		break;
 
 	default:
 		break;
 	}
 
-	return &gmin_subdevs[i];
+	return gdev;
 }
 
 static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
@@ -593,8 +575,14 @@ static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
 		if (gmin_subdevs[i].subdev == subdev)
 			return &gmin_subdevs[i];
 
+	for (i = 0; i < MAX_SUBDEVS; i++)
+		if (gmin_subdevs[i].subdev == NULL)
+			break;
+	if (i == MAX_SUBDEVS)
+		return NULL;
+
 	gmin_pmic_detect(subdev);
-	return gmin_subdev_add(subdev);
+	return gmin_subdev_add(subdev, &gmin_subdevs[i]);
 }
 
 static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
-- 
2.27.0

