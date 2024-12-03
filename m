Return-Path: <linux-media+bounces-22517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A783D9E172D
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F661B3A3E4
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7281D1DED7F;
	Tue,  3 Dec 2024 09:18:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511491DE4CB;
	Tue,  3 Dec 2024 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217531; cv=none; b=WzRkqDMtIEHsVoY5fUkAOPl9vMYS1qUnPMKKqksrg8COgjIgNDhLgiCer5W15SIzuVmzlVDdlEKcP5nrzaTsTjdzUQsCrldqFXfEJCXmgPQIaPEF/DOUGWW2qe/PeNdJSFTQhCzVNOreRUDpxn5qe4TQ06kRM5WJuWMOocQKk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217531; c=relaxed/simple;
	bh=zs1BzBx0FFWchhyw0wpO+X0yZ1KXKXDEChtwQhKQDEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oDTxnU3AXxFNEUaYHWCfaROTbqJaxta8IX51LF9pZKx9l+guq729msMGLklv1YPPubpnfJ46Wnoch5dMaonXhq0QDXahHOs44Kn3v80jp6NDP44Nbzn85fvx6bkeFg27qiiemMcYN5xB+B2fSLqSyD8Ne+3DzEHngPHXFquuYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.18:62357.39060554
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.18])
	by 189.cn (HERMES) with SMTP id 6F41C100226;
	Tue,  3 Dec 2024 17:14:38 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-pd459 with ESMTP id cd71642bd5cb447ab35934049a789864 for andy@kernel.org;
	Tue, 03 Dec 2024 17:14:39 CST
X-Transaction-ID: cd71642bd5cb447ab35934049a789864
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
From: Song Chen <chensong_2000@189.cn>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	bergh.jonathan@gmail.com
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Song Chen <chensong_2000@189.cn>
Subject: [PATCH] drivers/staging/media/atomisp: replace legacy GPIO APIs in atomisp_gmin_platform
Date: Tue,  3 Dec 2024 17:14:36 +0800
Message-Id: <20241203091436.203745-1-chensong_2000@189.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In atomisp_gmin_platform, gpio0 and gpio1 have moved to descriptor-based
GPIO APIs, but v1p8_gpio and v2p8_gpio still remain calling legacy ones,
such as gpio_request.

This patch replaces old with new, also removes including gpio.h.

Signed-off-by: Song Chen <chensong_2000@189.cn>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 63 ++++++++-----------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..7ff548ac3171 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -11,7 +11,6 @@
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
@@ -85,8 +84,8 @@ struct gmin_subdev {
 	bool v2p8_on;
 	bool v1p2_on;
 
-	int v1p8_gpio;
-	int v2p8_gpio;
+	struct gpio_desc *v1p8_gpiod;
+	struct gpio_desc *v2p8_gpiod;
 
 	u8 pwm_i2c_addr;
 
@@ -548,23 +547,6 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 	else
 		dev_info(dev, "will handle gpio1 via ACPI\n");
 
-	/*
-	 * Those are used only when there is an external regulator apart
-	 * from the PMIC that would be providing power supply, like on the
-	 * two cases below:
-	 *
-	 * The ECS E7 board drives camera 2.8v from an external regulator
-	 * instead of the PMIC.  There's a gmin_CamV2P8 config variable
-	 * that specifies the GPIO to handle this particular case,
-	 * but this needs a broader architecture for handling camera power.
-	 *
-	 * The CHT RVP board drives camera 1.8v from an* external regulator
-	 * instead of the PMIC just like ECS E7 board.
-	 */
-
-	gs->v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
-	gs->v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
-
 	/*
 	 * FIXME:
 	 *
@@ -830,21 +812,23 @@ static int gmin_v1p2_ctrl(struct v4l2_subdev *subdev, int on)
 static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
+	struct device *dev = &client->dev;
 	int ret;
 	int value;
 	int reg;
+	int v1p8_gpio;
 
 	if (!gs || gs->v1p8_on == on)
 		return 0;
 
-	if (gs->v1p8_gpio >= 0) {
-		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
-			gs->v1p8_gpio);
-		ret = gpio_request(gs->v1p8_gpio, "camera_v1p8_en");
-		if (!ret)
-			ret = gpio_direction_output(gs->v1p8_gpio, 0);
-		if (ret)
+	v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
+	if (v1p8_gpio >= 0) {
+		gs->v1p8_gpiod = gpiod_get_index(dev, "camera_v1p8", v1p8_gpio, GPIOD_ASIS);
+		if (IS_ERR(gs->v1p8_gpiod))
 			pr_err("V1P8 GPIO initialization failed\n");
+		else
+			gpiod_direction_output(gs->v1p8_gpiod, 0);
 	}
 
 	gs->v1p8_on = on;
@@ -861,8 +845,8 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 			goto out; /* Still needed */
 	}
 
-	if (gs->v1p8_gpio >= 0)
-		gpio_set_value(gs->v1p8_gpio, on);
+	if (v1p8_gpio >= 0)
+		gpiod_set_value(gs->v1p8_gpiod, on);
 
 	if (gs->v1p8_reg) {
 		regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
@@ -911,21 +895,24 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
+	struct device *dev = &client->dev;
 	int ret;
 	int value;
 	int reg;
+	int v2p8_gpio;
 
 	if (WARN_ON(!gs))
 		return -ENODEV;
 
-	if (gs->v2p8_gpio >= 0) {
-		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
-			gs->v2p8_gpio);
-		ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
-		if (!ret)
-			ret = gpio_direction_output(gs->v2p8_gpio, 0);
-		if (ret)
+	v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
+	if (v2p8_gpio >= 0) {
+		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n", v2p8_gpio);
+		gs->v2p8_gpiod = gpiod_get_index(dev, "camera_v2p8", v2p8_gpio, GPIOD_ASIS);
+		if (IS_ERR(gs->v2p8_gpiod))
 			pr_err("V2P8 GPIO initialization failed\n");
+		else
+			gpiod_direction_output(gs->v2p8_gpiod, 0);
 	}
 
 	if (gs->v2p8_on == on)
@@ -944,8 +931,8 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 			goto out; /* Still needed */
 	}
 
-	if (gs->v2p8_gpio >= 0)
-		gpio_set_value(gs->v2p8_gpio, on);
+	if (v2p8_gpio >= 0)
+		gpiod_set_value(gs->v2p8_gpiod, on);
 
 	if (gs->v2p8_reg) {
 		regulator_set_voltage(gs->v2p8_reg, 2900000, 2900000);
-- 
2.25.1


