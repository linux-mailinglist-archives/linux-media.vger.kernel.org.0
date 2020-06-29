Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07DC20E44B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 00:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbgF2VXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 17:23:23 -0400
Received: from mga03.intel.com ([134.134.136.65]:63958 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729582AbgF2SvY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:51:24 -0400
IronPort-SDR: GyRrN3gR3pZq2LMqvlCJdQuY0ZnO0UECAontTvfT71MUB1TrZ5OlRaC38967e9yR5oguS+ZXY9
 3bRuJUJJnmWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="145996336"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="145996336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:22:05 -0700
IronPort-SDR: Qf835pOA9fA8T0exloaOd6Gs5Z8YpPo3o7teitfkiclGhgq+BBhd82Uak1+lJqTh6CS4Ih9WWS
 MbIGZHxW5AuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="266234946"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jun 2020 09:22:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 565EB1F7; Mon, 29 Jun 2020 13:57:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/5] media: atomisp: Provide Gmin subdev as parameter to gmin_subdev_add()
Date:   Mon, 29 Jun 2020 13:57:37 +0300
Message-Id: <20200629105739.3098-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
References: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
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
 .../media/atomisp/pci/atomisp_gmin_platform.c | 47 +++++++++----------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index aa4424a60e92..8e66fe6f407e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -511,14 +511,13 @@ static int gmin_detect_pmic(struct v4l2_subdev *subdev)
 	return pmic_i2c_addr;
 }
 
-static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
+static int gmin_subdev_add(struct gmin_subdev *gs)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
 	struct device *dev = &client->dev;
 	struct acpi_device *adev;
-	struct gmin_subdev *gs;
 	acpi_handle handle;
-	int i, ret, clock_num = -1;
+	int ret, clock_num = -1;
 
 	handle = ACPI_HANDLE(dev);
 	adev = ACPI_COMPANION(dev);
@@ -526,14 +525,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
 		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
 
-	for (i = 0; i < MAX_SUBDEVS && gmin_subdevs[i].subdev; i++)
-		;
-	if (i >= MAX_SUBDEVS)
-		return NULL;
-
-	gs = &gmin_subdevs[i];
-	gs->subdev = subdev;
-
 	/*
 	 * FIXME:
 	 * 	WA:CHT requires XTAL clock as PLL is not stable.
@@ -609,8 +600,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	    acpi_device_can_poweroff(adev)) {
 		dev_info(dev,
 			 "gmin: power management provided via device PM\n");
-
-		return gs;
+		return 0;
 	}
 
 	/*
@@ -643,7 +633,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 
 	if (clock_num < 0 || clock_num > MAX_CLK_COUNT) {
 		dev_err(dev, "Invalid clock number\n");
-		return NULL;
+		return -EINVAL;
 	}
 
 	snprintf(gmin_pmc_clk_name, sizeof(gmin_pmc_clk_name),
@@ -652,13 +642,8 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	gs->pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
 	if (IS_ERR(gs->pmc_clk)) {
 		ret = PTR_ERR(gs->pmc_clk);
-
-		dev_err(dev,
-			"Failed to get clk from %s : %d\n",
-			gmin_pmc_clk_name,
-			ret);
-
-		return NULL;
+		dev_err(dev, "Failed to get clk from %s: %d\n", gmin_pmc_clk_name, ret);
+		return ret;
 	}
 	dev_info(dev, "Will use CLK%d (%s)\n", clock_num, gmin_pmc_clk_name);
 
@@ -718,7 +703,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 		break;
 	}
 
-	return gs;
+	return 0;
 }
 
 static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
@@ -731,6 +716,16 @@ static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
 	return NULL;
 }
 
+static struct gmin_subdev *find_free_gmin_subdev_slot(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < MAX_SUBDEVS; i++)
+		if (gmin_subdevs[i].subdev == NULL)
+			return &gmin_subdevs[i];
+	return NULL;
+}
+
 static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
 			     int sel_reg, u8 setting,
 			     int ctrl_reg, int shift, bool on)
@@ -1063,14 +1058,16 @@ struct camera_sensor_platform_data *gmin_camera_platform_data(
     enum atomisp_input_format csi_format,
     enum atomisp_bayer_order csi_bayer)
 {
-	struct gmin_subdev *gs;
 	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
+	struct gmin_subdev *gs;
 
-	gs = gmin_subdev_add(subdev);
+	gs = find_free_gmin_subdev_slot();
+	gs->subdev = subdev;
 	gs->csi_fmt = csi_format;
 	gs->csi_bayer = csi_bayer;
 	gs->pwm_i2c_addr = pmic_i2c_addr;
 
+	gmin_subdev_add(gs);
 	if (gs->pmc_clk)
 		return &pmic_gmin_plat;
 	else
-- 
2.27.0

