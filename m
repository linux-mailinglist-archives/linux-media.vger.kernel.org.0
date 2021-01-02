Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322212E894E
	for <lists+linux-media@lfdr.de>; Sun,  3 Jan 2021 00:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbhABXQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 18:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbhABXQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jan 2021 18:16:03 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B922C0613ED
        for <linux-media@vger.kernel.org>; Sat,  2 Jan 2021 15:15:22 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 23so55992892lfg.10
        for <linux-media@vger.kernel.org>; Sat, 02 Jan 2021 15:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Am6+OHRd6rxjb9mVKry5O0Y9GfKGxpu1ngFcE6yWJU=;
        b=MroFWtz6mzVO962UEwoFrKM+XMOMztcOZ0wLZopM7UJAwZBH2Dsg9k7vsAt+vnsuZv
         jdFbwUFG2ojf8am9h3YGhPhA9GCPIMu3HXl4OF5/G2fPr/9SBgfLUPKutCVb8Sai2/9+
         cBUWLJVDJivcJH2LdO3PlWBi57AAGT1vlUrmf0ZatBevtmWlDMU+gAQ7QapDdMG/ccZ7
         hF28qZwKJoarDp7mtgA4Djg+W3N32Xp7bcgdU/KSuJlUNbGkNXCqzqSLaIYjfq0gdQgS
         qwoZgbAoSsh+pw7/jN66Boq5H1vLwnUWI/YCjHZQeHHlVGjEz5rZ04ZQySCw+/Pro4DF
         a5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Am6+OHRd6rxjb9mVKry5O0Y9GfKGxpu1ngFcE6yWJU=;
        b=aEUYTA6ecHKhJKEgPqF3tRrBXa+rYa69ABsXp4pvrEGoggEJWkZY1TjgfIiANYnBzl
         7+SQWBXAhWq9QVVAtYnYP4NBEUo5h8DW7r5twPxU8jm4Qhqjz5XJWRww2+qJIRoQndQc
         727UkcQb6yNbdR/oy+AmQM+OPa5LDiyF3PnqnSxjMgyPQKG7sxYZ3G5BRx9zOh8Nzub7
         MXNLvrIDyypTy07RzMBlMYtEIbNYcZg/y0YZ/ohzaHF4U0ZPYTl4gZMgnh/r4oysKgMt
         7qS8eXiR1vRAervUyCHdSMLTBqicKGQtk50SjtdnSTy0nsHnF8Ul3PNhj6lcHSLAO+sQ
         8f8w==
X-Gm-Message-State: AOAM532a/5kZ2uvi1R4wg0wdG226PqjIueA5L7fVKrM/qS5ZHpGnoiu2
        g9gx42pBfM9MT9R0GBssjsParg==
X-Google-Smtp-Source: ABdhPJwHEIEfUNSGltwNZaWKDxdocTfC6dl1BC21Mn+NFdyvypmOizUnU+JFV6TBxPCy2HnCXWALYw==
X-Received: by 2002:a2e:b522:: with SMTP id z2mr31182228ljm.500.1609629320821;
        Sat, 02 Jan 2021 15:15:20 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 204sm6833732lfj.269.2021.01.02.15.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 15:15:20 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/2 v9] leds: rt8515: Add Richtek RT8515 LED driver
Date:   Sun,  3 Jan 2021 00:15:10 +0100
Message-Id: <20210102231510.2068851-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210102231510.2068851-1-linus.walleij@linaro.org>
References: <20210102231510.2068851-1-linus.walleij@linaro.org>
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

Sakari Ailus, Pavel Machek and Andy Shevchenko helped
significantly in getting this driver right.

Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: linux-media@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v8->v9:
- Fix a bug in V4L2 flash removal code: this needs to be
  defined out when not using V4L2.
- Include <linux/property.h> instead of <linux/of.h> since we
  use device properties. Include <linux/mod_devicetable.h>
  for the OF compatibles table.
- Rename timeout defines with _US suffix to make evident.
- Break out a rt8515_gpio_led_off() function from the three
  sites setting both GPIOs to 0.
- Simplify obtaining the max values from device tree
  by exploiting that resistance 0 is an illegal value.
- Use dev_err_probe() when obtaining GPIO handles to we
  do not get probe deferral spam. Also makes the code
  simpler.
- License is GPL-2.0-or-later which corresponds to
  MODULE_LICENSE("GPL") so use this module license.
- Syntax, speling.
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
 drivers/leds/flash/leds-rt8515.c | 397 +++++++++++++++++++++++++++++++
 5 files changed, 421 insertions(+)
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
index 000000000000..590bfa180d10
--- /dev/null
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -0,0 +1,397 @@
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
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
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
+#define RT8515_TIMEOUT_US	250000U
+#define RT8515_MAX_TIMEOUT_US	300000U
+
+struct rt8515 {
+	struct led_classdev_flash fled;
+	struct device *dev;
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
+static void rt8515_gpio_led_off(struct rt8515 *rt)
+{
+	gpiod_set_value(rt->enable_flash, 0);
+	gpiod_set_value(rt->enable_torch, 0);
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
+		rt8515_gpio_led_off(rt);
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
+		rt8515_gpio_led_off(rt);
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
+	rt8515_gpio_led_off(rt);
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
+	 * Set default timeout to RT8515_TIMEOUT_US except if
+	 * max_timeout from DT is lower.
+	 */
+	s->val = min(rt->max_timeout, RT8515_TIMEOUT_US);
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
+static void rt8515_v4l2_flash_release(struct rt8515 *rt)
+{
+	v4l2_flash_release(rt->v4l2_flash);
+}
+
+#else
+static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
+					  struct v4l2_flash_config *v4l2_sd_cfg)
+{
+}
+
+static void rt8515_v4l2_flash_release(struct rt8515 *rt)
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
+	u32 res = 0; /* Can't be 0 so 0 is undefined */
+	u32 ua;
+	u32 max_ma;
+	int max_intensity;
+	int ret;
+
+	fwnode_property_read_u32(rt->dev->fwnode, resistance, &res);
+	ret = fwnode_property_read_u32(led, max_ua_prop, &ua);
+
+	/* Missing info in DT, OK go with hardware maxima */
+	if (ret || res == 0) {
+		dev_err(rt->dev,
+			"either %s or %s missing from DT, using HW max\n",
+			resistance, max_ua_prop);
+		max_ma = RT8515_MAX_IOUT_MA;
+		max_intensity = hw_max;
+		goto out_assign_max;
+	}
+
+	/*
+	 * Formula from the datasheet, this is the maximum current
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
+	if (IS_ERR(rt->enable_flash))
+		return dev_err_probe(dev, PTR_ERR(rt->enable_flash),
+				     "cannot get ENF (enable flash) GPIO\n");
+
+	/* ENT - Enable Torch line */
+	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	if (IS_ERR(rt->enable_torch))
+		return dev_err_probe(dev, PTR_ERR(rt->enable_torch),
+				     "cannot get ENT (enable torch) GPIO\n");
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
+		rt->max_timeout = RT8515_MAX_TIMEOUT_US;
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
+	rt8515_v4l2_flash_release(rt);
+	del_timer_sync(&rt->powerdown_timer);
+	mutex_destroy(&rt->lock);
+
+	return 0;
+}
+
+static const struct of_device_id rt8515_match[] = {
+	{ .compatible = "richtek,rt8515", },
+	{ /* sentinel */ }
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
+MODULE_LICENSE("GPL");
-- 
2.29.2

