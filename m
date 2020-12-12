Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9832D8630
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 12:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437419AbgLLLMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Dec 2020 06:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407370AbgLLLMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Dec 2020 06:12:17 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20BCC0617A6
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 03:10:55 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m19so18047628lfb.1
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 03:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CkAhUxCVlsofddgP+dGSFJ9UYAN6HvzInucoCMbkuDo=;
        b=kp6YdHpPNPVOZOSxYb3yFXe6OpIkTdfpJWZIqmR5kaOALsWOGmDu3Aa/oqJejBO27B
         S4mU1sUlO3KY4Fdj3YxFjfSX6T9Q4/WsFpOZTx8XKAuzDSdZXsG0QDcjNaH2HPKCdp4k
         l33j7OVeqi1w4RBN8wlALg2Sa8NUCT6KX4O4Dgo+QKED2yVIrKhez8LouxcACRS21S7F
         lLbboXaKW/s2FkYjTllZdjsSoeqeJm1kpIz6KkD9XiIxuWUe9gX/M3z0frwW+ZjhCiEm
         7YsYqesNuwIwX+sDbOeG2Q4aqoGfYCmQf9gVxeYvnkEjFxkSWOvso9e5T4dN7N0H9J71
         03tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CkAhUxCVlsofddgP+dGSFJ9UYAN6HvzInucoCMbkuDo=;
        b=gLx/H0ssV45wPSEL0AR0HIqJaiSO0qHFj5jhjSwGQojUwwtSV/2jcY3xaXBiuj1sBC
         9qfA2ov5xs9/W1gi3uXyct/4u+Fe6ylny+iWI934AL2Ot7s+T4Lyr3fqxG49pr+6MJA1
         RKf0d11ZBbF844o7PSh2CceSfGQ4YiSgl9ujgCLWAk/UQ6GGRpdiC6W3TPlT23XdJKQx
         THQUBcDti4DYly234SdIfs25oGLskDx0IeEboDbnQa1hYtA3rcjce4zpAKQWAO66iQZK
         ZSFvi/D4SkbZPonFQQ/ouyE9R1nQDWatkPJYOXi6ZTF/XIUpLAewi8dG0wDnf2CByu8L
         oTkA==
X-Gm-Message-State: AOAM532Sm3p43KwVjhPMkdHbDkG6kPO/7dgyou+Xqv+AK61y65JuNUAq
        dsinDRAVdNbsqsE2ERoCli0Nrg==
X-Google-Smtp-Source: ABdhPJwThXtX3lS0OKymSMlDlFDXq9lbK6ykUgbtkcIycp54cbltYtftdkEg/Ni/9xs8bza3NhJl1g==
X-Received: by 2002:a19:7b16:: with SMTP id w22mr6021600lfc.657.1607771453309;
        Sat, 12 Dec 2020 03:10:53 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id u30sm1187835lfc.238.2020.12.12.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 03:10:52 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/2 v8] leds: rt8515: Add Richtek RT8515 LED driver
Date:   Sat, 12 Dec 2020 12:10:46 +0100
Message-Id: <20201212111046.2735002-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201212111046.2735002-1-linus.walleij@linaro.org>
References: <20201212111046.2735002-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a driver for the Richtek RT8515 dual channel
torch/flash white LED driver.

This LED driver is found in some mobile phones from
Samsung such as the GT-S7710 and GT-I8190.

A V4L interface is added.

We do not have a proper datasheet for the RT8515 but
it turns out that RT9387A has a public datasheet and
is essentially the same chip. We designed the driver
in accordance with this datasheet. The day someone
needs to drive a RT9387A this driver can probably
easily be augmented to handle that chip too.

Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: linux-media@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v7->v8:
- Add comments in the top of the driver and a link to
  the RT9387A datasheet.
ChangeLog v6->v7:
- Account for the binding change to use led-max-current
  rather than torch-specific current.
- Collect Sakari's review tag.
ChangeLog v5->v6:
- Use the configured max flash brightness instead of
  hardcoded "4".
- Implement the new "-ohms" suffixes on the resistors.
ChangeLog v4->v5:
- Fix a missing static keyword, complaint from the kernel
  autobuilder robot.
ChangeLog v3->v4:
- Create a new subdirectory for flash LEDs under
  drivers/leds/flash as requested by Pavel, move the
  driver there and set up a kbuild structure for pure
  flash LEDs.
  (Others can follow the established pattern.)
- Handle the new richtek,rfs and richtek,rts resistor
  values that make it possible to determine the current
  range configured in the hardware.
- Handle the new flash-max-microamp and torch-max-microamp
  if present and optionally further restrict the current
  range using these. Otherwise fall back on the hardware
  defaults as specified by the RFS and RTS resistors.
- Cc phone-devel@vger.kernel.org
- License as GPL-2.0-or-later
- Renable ent and enf gpio descriptors to enable_torch
  and enable_flash
Changelog v2->v3:
- Expand commit message.
- Add Sakari to Cc.
- Resend.
ChangeLog v1->v2:
- Break out routine to bitbang the brightness on a
  GPIO pin.
- Do not hardcode the LED name so that the framework
  can name it from DT properties.
---
 drivers/leds/Kconfig             |   3 +
 drivers/leds/Makefile            |   3 +
 drivers/leds/flash/Kconfig       |  15 ++
 drivers/leds/flash/Makefile      |   3 +
 drivers/leds/flash/leds-rt8515.c | 393 +++++++++++++++++++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 drivers/leds/flash/Kconfig
 create mode 100644 drivers/leds/flash/Makefile
 create mode 100644 drivers/leds/flash/leds-rt8515.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 849d3c5f908e..6c1d8b69a465 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -928,6 +928,9 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
+comment "Flash and Torch LED drivers"
+source "drivers/leds/flash/Kconfig"
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 73e603e1727e..156c0b4e60d9 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -103,5 +103,8 @@ obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
 
+# Flash and Torch LED Drivers
+obj-$(CONFIG_LEDS_CLASS_FLASH)		+= flash/
+
 # LED Triggers
 obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
new file mode 100644
index 000000000000..d21d273ef3da
--- /dev/null
+++ b/drivers/leds/flash/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+if LEDS_CLASS_FLASH
+
+config LEDS_RT8515
+	tristate "LED support for Richtek RT8515 flash/torch LED"
+	depends on GPIOLIB
+	help
+	  This option enables support for the Richtek RT8515 flash
+	  and torch LEDs found on some mobile phones.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-rt8515.
+
+endif # LEDS_CLASS_FLASH
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
new file mode 100644
index 000000000000..e990e257f4d7
--- /dev/null
+++ b/drivers/leds/flash/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
new file mode 100644
index 000000000000..571aec521619
--- /dev/null
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * LED driver for Richtek RT8515 flash/torch white LEDs
+ * found on some Samsung mobile phones.
+ *
+ * This is a 1.5A Boost dual channel driver produced around 2011.
+ *
+ * The component lacks a datasheet, but in the schematic picture
+ * from the LG P970 service manual you can see the connections
+ * from the RT8515 to the LED, with two resistors connected
+ * from the pins "RFS" and "RTS" to ground.
+ *
+ * On the LG P970:
+ * RFS (resistance flash setting?) is 20 kOhm
+ * RTS (resistance torch setting?) is 39 kOhm
+ *
+ * Some sleuthing finds us the RT9387A which we have a datasheet for:
+ * https://static5.arrow.com/pdfs/2014/7/27/8/21/12/794/rtt_/manual/94download_ds.jspprt9387a.jspprt9387a.pdf
+ * This apparently works the same way so in theory this driver
+ * should cover RT9387A as well. This has not been tested, please
+ * update the compatibles if you add RT9387A support.
+ *
+ * Linus Walleij <linus.walleij@linaro.org>
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/v4l2-flash-led-class.h>
+
+/* We can provide 15-700 mA out to the LED */
+#define RT8515_MIN_IOUT_MA	15
+#define RT8515_MAX_IOUT_MA	700
+/* The maximum intensity is 1-16 for flash and 1-100 for torch */
+#define RT8515_FLASH_MAX	16
+#define RT8515_TORCH_MAX	100
+
+#define RT8515_TIMEOUT_DEFAULT		250000U /* 250ms */
+#define RT8515_MAX_TIMEOUT_DEFAULT	300000U /* 300ms */
+
+struct rt8515 {
+	struct device *dev;
+	struct led_classdev_flash fled;
+	struct v4l2_flash *v4l2_flash;
+	struct mutex lock;
+	struct regulator *reg;
+	struct gpio_desc *enable_torch;
+	struct gpio_desc *enable_flash;
+	struct timer_list powerdown_timer;
+	u32 max_timeout; /* Flash max timeout */
+	int flash_max_intensity;
+	int torch_max_intensity;
+};
+
+static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
+{
+	return container_of(fled, struct rt8515, fled);
+}
+
+static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
+					  int brightness)
+{
+	int i;
+
+	/*
+	 * Toggling a GPIO line with a small delay increases the
+	 * brightness one step at a time.
+	 */
+	for (i = 0; i < brightness; i++) {
+		gpiod_set_value(gpiod, 0);
+		udelay(1);
+		gpiod_set_value(gpiod, 1);
+		udelay(1);
+	}
+}
+
+/* This is setting the torch light level */
+static int rt8515_led_brightness_set(struct led_classdev *led,
+				     enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
+	struct rt8515 *rt = to_rt8515(fled);
+
+	mutex_lock(&rt->lock);
+
+	if (brightness == LED_OFF) {
+		/* Off */
+		gpiod_set_value(rt->enable_flash, 0);
+		gpiod_set_value(rt->enable_torch, 0);
+	} else if (brightness < RT8515_TORCH_MAX) {
+		/* Step it up to movie mode brightness using the flash pin */
+		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
+	} else {
+		/* Max torch brightness requested */
+		gpiod_set_value(rt->enable_torch, 1);
+	}
+
+	mutex_unlock(&rt->lock);
+
+	return 0;
+}
+
+static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
+				       bool state)
+{
+	struct rt8515 *rt = to_rt8515(fled);
+	struct led_flash_setting *timeout = &fled->timeout;
+	int brightness = rt->flash_max_intensity;
+
+	mutex_lock(&rt->lock);
+
+	if (state) {
+		/* Enable LED flash mode and set brightness */
+		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
+		/* Set timeout */
+		mod_timer(&rt->powerdown_timer,
+			  jiffies + usecs_to_jiffies(timeout->val));
+	} else {
+		del_timer_sync(&rt->powerdown_timer);
+		/* Turn the LED off */
+		gpiod_set_value(rt->enable_flash, 0);
+		gpiod_set_value(rt->enable_torch, 0);
+	}
+
+	fled->led_cdev.brightness = LED_OFF;
+	/* After this the torch LED will be disabled */
+
+	mutex_unlock(&rt->lock);
+
+	return 0;
+}
+
+static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
+				       bool *state)
+{
+	struct rt8515 *rt = to_rt8515(fled);
+
+	*state = timer_pending(&rt->powerdown_timer);
+
+	return 0;
+}
+
+static int rt8515_led_flash_timeout_set(struct led_classdev_flash *fled,
+					u32 timeout)
+{
+	/* The timeout is stored in the led-class-flash core */
+	return 0;
+}
+
+static const struct led_flash_ops rt8515_flash_ops = {
+	.strobe_set = rt8515_led_flash_strobe_set,
+	.strobe_get = rt8515_led_flash_strobe_get,
+	.timeout_set = rt8515_led_flash_timeout_set,
+};
+
+static void rt8515_powerdown_timer(struct timer_list *t)
+{
+	struct rt8515 *rt = from_timer(rt, t, powerdown_timer);
+
+	/* Turn the LED off */
+	gpiod_set_value(rt->enable_flash, 0);
+	gpiod_set_value(rt->enable_torch, 0);
+}
+
+static void rt8515_init_flash_timeout(struct rt8515 *rt)
+{
+	struct led_classdev_flash *fled = &rt->fled;
+	struct led_flash_setting *s;
+
+	/* Init flash timeout setting */
+	s = &fled->timeout;
+	s->min = 1;
+	s->max = rt->max_timeout;
+	s->step = 1;
+	/*
+	 * Set default timeout to RT8515_DEFAULT_TIMEOUT except if
+	 * max_timeout from DT is lower.
+	 */
+	s->val = min(rt->max_timeout, RT8515_TIMEOUT_DEFAULT);
+}
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+/* Configure the V2L2 flash subdevice */
+static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
+					  struct v4l2_flash_config *v4l2_sd_cfg)
+{
+	struct led_classdev *led = &rt->fled.led_cdev;
+	struct led_flash_setting *s;
+
+	strscpy(v4l2_sd_cfg->dev_name, led->dev->kobj.name,
+		sizeof(v4l2_sd_cfg->dev_name));
+
+	/*
+	 * Init flash intensity setting: this is a linear scale
+	 * capped from the device tree max intensity setting
+	 * 1..flash_max_intensity
+	 */
+	s = &v4l2_sd_cfg->intensity;
+	s->min = 1;
+	s->max = rt->flash_max_intensity;
+	s->step = 1;
+	s->val = s->max;
+}
+
+#else
+static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
+					  struct v4l2_flash_config *v4l2_sd_cfg)
+{
+}
+#endif
+
+static void rt8515_determine_max_intensity(struct rt8515 *rt,
+					   struct fwnode_handle *led,
+					   const char *resistance,
+					   const char *max_ua_prop, int hw_max,
+					   int *max_intensity_setting)
+{
+	u32 res;
+	u32 ua;
+	u32 max_ma;
+	int max_intensity;
+	int ret1, ret2;
+
+
+	ret1 = fwnode_property_read_u32(rt->dev->fwnode, resistance, &res);
+	ret2 = fwnode_property_read_u32(led, max_ua_prop, &ua);
+
+	/* No info in DT, OK go with hardware maxima */
+	if (ret1 && ret2) {
+		max_ma = RT8515_MAX_IOUT_MA;
+		max_intensity = hw_max;
+		goto out_assign_max;
+	}
+
+	if (ret1 || ret2) {
+		dev_err(rt->dev,
+			"either %s or %s missing from DT, using HW max\n",
+			resistance, max_ua_prop);
+		max_ma = RT8515_MAX_IOUT_MA;
+		max_intensity = hw_max;
+		goto out_assign_max;
+	}
+
+	/*
+	 * Formula from datasheet, this is the maximum current
+	 * defined by the hardware.
+	 */
+	max_ma = (5500 * 1000) / res;
+	/*
+	 * Calculate max intensity (linear scaling)
+	 * Formula is ((ua / 1000) / max_ma) * 100, then simplified
+	 */
+	max_intensity = (ua / 10) / max_ma;
+
+	dev_info(rt->dev,
+		 "current restricted from %u to %u mA, max intensity %d/100\n",
+		 max_ma, (ua / 1000), max_intensity);
+
+out_assign_max:
+	dev_info(rt->dev, "max intensity %d/%d = %d mA\n",
+		 max_intensity, hw_max, max_ma);
+	*max_intensity_setting = max_intensity;
+}
+
+static int rt8515_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *child;
+	struct rt8515 *rt;
+	struct led_classdev *led;
+	struct led_classdev_flash *fled;
+	struct led_init_data init_data = {};
+	struct v4l2_flash_config v4l2_sd_cfg = {};
+	int ret;
+
+	rt = devm_kzalloc(dev, sizeof(*rt), GFP_KERNEL);
+	if (!rt)
+		return -ENOMEM;
+
+	rt->dev = dev;
+	fled = &rt->fled;
+	led = &fled->led_cdev;
+
+	/* ENF - Enable Flash line */
+	rt->enable_flash = devm_gpiod_get(dev, "enf", GPIOD_OUT_LOW);
+	if (IS_ERR(rt->enable_flash)) {
+		dev_err(dev, "cannot get ENF (enable flash) GPIO\n");
+		return PTR_ERR(rt->enable_flash);
+	}
+
+	/* ENT - Enable Torch line */
+	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	if (IS_ERR(rt->enable_torch)) {
+		dev_err(dev, "cannot get ENT (enable torch) GPIO\n");
+		return PTR_ERR(rt->enable_torch);
+	}
+
+	child = fwnode_get_next_available_child_node(dev->fwnode, NULL);
+	if (!child) {
+		dev_err(dev,
+			"No fwnode child node found for connected LED.\n");
+		return -EINVAL;
+	}
+	init_data.fwnode = child;
+
+	rt8515_determine_max_intensity(rt, child, "richtek,rfs-ohms",
+				       "flash-max-microamp",
+				       RT8515_FLASH_MAX,
+				       &rt->flash_max_intensity);
+	rt8515_determine_max_intensity(rt, child, "richtek,rts-ohms",
+				       "led-max-microamp",
+				       RT8515_TORCH_MAX,
+				       &rt->torch_max_intensity);
+
+	ret = fwnode_property_read_u32(child, "flash-max-timeout-us",
+				       &rt->max_timeout);
+	if (ret) {
+		rt->max_timeout = RT8515_MAX_TIMEOUT_DEFAULT;
+		dev_warn(dev,
+			 "flash-max-timeout-us property missing\n");
+	}
+	timer_setup(&rt->powerdown_timer, rt8515_powerdown_timer, 0);
+	rt8515_init_flash_timeout(rt);
+
+	fled->ops = &rt8515_flash_ops;
+
+	led->max_brightness = rt->torch_max_intensity;
+	led->brightness_set_blocking = rt8515_led_brightness_set;
+	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
+
+	mutex_init(&rt->lock);
+
+	platform_set_drvdata(pdev, rt);
+
+	ret = devm_led_classdev_flash_register_ext(dev, fled, &init_data);
+	if (ret) {
+		dev_err(dev, "can't register LED %s\n", led->name);
+		mutex_destroy(&rt->lock);
+		return ret;
+	}
+
+	rt8515_init_v4l2_flash_config(rt, &v4l2_sd_cfg);
+
+	/* Create a V4L2 Flash device if V4L2 flash is enabled */
+	rt->v4l2_flash = v4l2_flash_init(dev, child, fled, NULL, &v4l2_sd_cfg);
+	if (IS_ERR(rt->v4l2_flash)) {
+		ret = PTR_ERR(rt->v4l2_flash);
+		dev_err(dev, "failed to register V4L2 flash device (%d)\n",
+			ret);
+		/*
+		 * Continue without the V4L2 flash
+		 * (we still have the classdev)
+		 */
+	}
+
+	return 0;
+}
+
+static int rt8515_remove(struct platform_device *pdev)
+{
+	struct rt8515 *rt = platform_get_drvdata(pdev);
+
+	v4l2_flash_release(rt->v4l2_flash);
+	del_timer_sync(&rt->powerdown_timer);
+	mutex_destroy(&rt->lock);
+
+	return 0;
+}
+
+static const struct of_device_id rt8515_match[] = {
+	{ .compatible = "richtek,rt8515", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, rt8515_match);
+
+static struct platform_driver rt8515_driver = {
+	.driver = {
+		.name  = "rt8515",
+		.of_match_table = rt8515_match,
+	},
+	.probe  = rt8515_probe,
+	.remove = rt8515_remove,
+};
+module_platform_driver(rt8515_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Richtek RT8515 LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

