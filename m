Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736FC20B328
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgFZOFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729035AbgFZOFE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:04 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28B1F20FC3;
        Fri, 26 Jun 2020 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=Nta2BxP6aG9z1osM6RBO32EL32u6t4phuluIvxKvVpo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FTF6iT6Vr/90E4f7jqYFu0x+qdo3ORNF0K1pcoADWKWAetju2Lod+n6gv1Zbr7dQX
         MaPc2CJ/mkdyNpqddgYqAmuvh9uwCIXGasT9oHcV3dmSm1zyaeFCZqKCG0ZJCIwNQW
         yTQxZ3MulpvCkwPRx4fM9ak9fLo67DkhznAn+tTA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyS-00HKwU-7X; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] media: atomisp: place all gpio parsing together
Date:   Fri, 26 Jun 2020 16:04:59 +0200
Message-Id: <37dd6017652bc201e8e8789d20e9052862a1e4d1.1593180146.git.mchehab+huawei@kernel.org>
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

Instead of parsing GPIO for two exceptions inside the logic
which would be trying to use the GPIO, move the init code
to the routine which adds a new gmin device.

Move the notes to it too, as this helps to identify where
those two GPIO settings are used, explaining why they're
defaulting to -1 when not found.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 86 +++++++++----------
 1 file changed, 40 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 3136759bf96f..1a1a6a9ee8a3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -83,6 +83,9 @@ struct gmin_subdev {
 	bool v1p2_on;
 	bool v2p8_vcm_on;
 
+	int v1p8_gpio;
+	int v2p8_gpio;
+
 	u8 pwm_i2c_addr;
 
 	/* For PMIC AXP */
@@ -122,24 +125,6 @@ static const struct atomisp_platform_data pdata = {
 	.subdevs = pdata_subdevs,
 };
 
-/*
- * Something of a hack.  The ECS E7 board drives camera 2.8v from an
- * external regulator instead of the PMIC.  There's a gmin_CamV2P8
- * config variable that specifies the GPIO to handle this particular
- * case, but this needs a broader architecture for handling camera
- * power.
- */
-enum { V2P8_GPIO_UNSET = -2, V2P8_GPIO_NONE = -1 };
-static int v2p8_gpio = V2P8_GPIO_UNSET;
-
-/*
- * Something of a hack. The CHT RVP board drives camera 1.8v from an
- * external regulator instead of the PMIC just like ECS E7 board, see the
- * comments above.
- */
-enum { V1P8_GPIO_UNSET = -2, V1P8_GPIO_NONE = -1 };
-static int v1p8_gpio = V1P8_GPIO_UNSET;
-
 static LIST_HEAD(vcm_devices);
 static DEFINE_MUTEX(vcm_lock);
 
@@ -561,6 +546,23 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	else
 		dev_info(dev, "will handle gpio1 via ACPI\n");
 
+	/*
+	 * Those are used only when there is an external regulator apart
+	 * from the PMIC that would be providing power supply, like on the
+	 * two cases below:
+	 *
+	 * The ECS E7 board drives camera 2.8v from an external regulator
+	 * instead of the PMIC.  There's a gmin_CamV2P8 config variable
+	 * that specifies the GPIO to handle this particular case,
+	 * but this needs a broader architecture for handling camera power.
+	 *
+	 * The CHT RVP board drives camera 1.8v from an* external regulator
+	 * instead of the PMIC just like ECS E7 board.
+	 */
+
+	gs->v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
+	gs->v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
+
 	/*
 	 * FIXME:
 	 *
@@ -843,26 +845,22 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 
 	dev = &client->dev;
 
-	if (v1p8_gpio == V1P8_GPIO_UNSET) {
-		v1p8_gpio = gmin_get_var_int(dev, true,
-					     "V1P8GPIO", V1P8_GPIO_NONE);
-		if (v1p8_gpio != V1P8_GPIO_NONE) {
-			pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
-				v1p8_gpio);
-			ret = gpio_request(v1p8_gpio, "camera_v1p8_en");
-			if (!ret)
-				ret = gpio_direction_output(v1p8_gpio, 0);
-			if (ret)
-				pr_err("V1P8 GPIO initialization failed\n");
-		}
+	if (gs->v1p8_gpio >= 0) {
+		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
+			gs->v1p8_gpio);
+		ret = gpio_request(gs->v1p8_gpio, "camera_v1p8_en");
+		if (!ret)
+			ret = gpio_direction_output(gs->v1p8_gpio, 0);
+		if (ret)
+			pr_err("V1P8 GPIO initialization failed\n");
 	}
 
 	if (!gs || gs->v1p8_on == on)
 		return 0;
 	gs->v1p8_on = on;
 
-	if (v1p8_gpio >= 0)
-		gpio_set_value(v1p8_gpio, on);
+	if (gs->v1p8_gpio >= 0)
+		gpio_set_value(gs->v1p8_gpio, on);
 
 	if (gs->v1p8_reg) {
 		regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
@@ -905,26 +903,22 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 
 	dev = &client->dev;
 
-	if (v2p8_gpio == V2P8_GPIO_UNSET) {
-		v2p8_gpio = gmin_get_var_int(dev, true,
-					     "V2P8GPIO", V2P8_GPIO_NONE);
-		if (v2p8_gpio != V2P8_GPIO_NONE) {
-			pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
-				v2p8_gpio);
-			ret = gpio_request(v2p8_gpio, "camera_v2p8");
-			if (!ret)
-				ret = gpio_direction_output(v2p8_gpio, 0);
-			if (ret)
-				pr_err("V2P8 GPIO initialization failed\n");
-		}
+	if (gs->v2p8_gpio >= 0) {
+		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
+			gs->v2p8_gpio);
+		ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
+		if (!ret)
+			ret = gpio_direction_output(gs->v2p8_gpio, 0);
+		if (ret)
+			pr_err("V2P8 GPIO initialization failed\n");
 	}
 
 	if (!gs || gs->v2p8_on == on)
 		return 0;
 	gs->v2p8_on = on;
 
-	if (v2p8_gpio >= 0)
-		gpio_set_value(v2p8_gpio, on);
+	if (gs->v2p8_gpio >= 0)
+		gpio_set_value(gs->v2p8_gpio, on);
 
 	if (gs->v2p8_reg) {
 		regulator_set_voltage(gs->v2p8_reg, 2900000, 2900000);
-- 
2.26.2

