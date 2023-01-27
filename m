Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0762767EFB2
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 21:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbjA0UjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 15:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjA0UjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 15:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7916D19F01
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 12:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674851870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sBhZJ+gAC5hcgjOEWudF45g+6kTD1fmj6RHyy4kmIDk=;
        b=buOH5f2893rlVldwGG5/Wxyg9f5RxeFHDtSqjDjmVY/T/Fp5uSxPeaD9Hzq10hB6tCEXQA
        JE+ceFBusAtC76n+ntDOnTG9QXCx98PCzbPXgHBVMa6jq1HiT7jwHvrHqboDzSJYixPkmS
        2dGYGSZNZJfeAeJwA0Xxu+rMFrPhH18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-fXFCVH-TOuaRQEN9-Vt0Vg-1; Fri, 27 Jan 2023 15:37:47 -0500
X-MC-Unique: fXFCVH-TOuaRQEN9-Vt0Vg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CE8B2801E47;
        Fri, 27 Jan 2023 20:37:46 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AAC02492C18;
        Fri, 27 Jan 2023 20:37:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
Date:   Fri, 27 Jan 2023 21:37:27 +0100
Message-Id: <20230127203729.10205-4-hdegoede@redhat.com>
In-Reply-To: <20230127203729.10205-1-hdegoede@redhat.com>
References: <20230127203729.10205-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
X1 Nano gen 2 there is no clock-enable pin, triggering the:
"No clk GPIO. The privacy LED won't work" warning and causing the privacy
LED to not work.

Fix this by modeling the privacy LED as a LED class device rather then
integrating it with the registered clock.

Note this relies on media subsys changes to actually turn the LED on/off
when the sensor's v4l2_subdev's s_stream() operand gets called.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Make struct led_classdev the first member of the pled struct
- Use strchr to replace the : with _ in the acpi_dev_name()
---
 drivers/platform/x86/intel/int3472/Makefile   |  2 +-
 .../x86/intel/int3472/clk_and_regulator.c     |  3 -
 drivers/platform/x86/intel/int3472/common.h   | 15 +++-
 drivers/platform/x86/intel/int3472/discrete.c | 58 ++++-----------
 drivers/platform/x86/intel/int3472/led.c      | 74 +++++++++++++++++++
 5 files changed, 105 insertions(+), 47 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/led.c

diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
index cfec7784c5c9..9f16cb514397 100644
--- a/drivers/platform/x86/intel/int3472/Makefile
+++ b/drivers/platform/x86/intel/int3472/Makefile
@@ -1,4 +1,4 @@
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472_discrete.o \
 					   intel_skl_int3472_tps68470.o
-intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o common.o
+intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o led.o common.o
 intel_skl_int3472_tps68470-y		:= tps68470.o tps68470_board_data.o common.o
diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 74dc2cff799e..e3b597d93388 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -23,8 +23,6 @@ static int skl_int3472_clk_prepare(struct clk_hw *hw)
 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
 
 	gpiod_set_value_cansleep(clk->ena_gpio, 1);
-	gpiod_set_value_cansleep(clk->led_gpio, 1);
-
 	return 0;
 }
 
@@ -33,7 +31,6 @@ static void skl_int3472_clk_unprepare(struct clk_hw *hw)
 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
 
 	gpiod_set_value_cansleep(clk->ena_gpio, 0);
-	gpiod_set_value_cansleep(clk->led_gpio, 0);
 }
 
 static int skl_int3472_clk_enable(struct clk_hw *hw)
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 53270d19c73a..82dc37e08882 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/gpio/machine.h>
+#include <linux/leds.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/types.h>
@@ -28,6 +29,8 @@
 #define GPIO_REGULATOR_NAME_LENGTH				21
 #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
 
+#define INT3472_LED_MAX_NAME_LEN				32
+
 #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
 
 #define INT3472_REGULATOR(_name, _supply, _ops)			\
@@ -96,10 +99,16 @@ struct int3472_discrete_device {
 		struct clk_hw clk_hw;
 		struct clk_lookup *cl;
 		struct gpio_desc *ena_gpio;
-		struct gpio_desc *led_gpio;
 		u32 frequency;
 	} clock;
 
+	struct int3472_pled {
+		struct led_classdev classdev;
+		struct led_lookup_data lookup;
+		char name[INT3472_LED_MAX_NAME_LEN];
+		struct gpio_desc *gpio;
+	} pled;
+
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
 	struct gpiod_lookup_table gpios;
@@ -119,4 +128,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct acpi_resource_gpio *agpio);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
+int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
+			      struct acpi_resource_gpio *agpio, u32 polarity);
+void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472);
+
 #endif
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 708d51f9b41d..38b1372e0745 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -155,37 +155,21 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 }
 
 static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
-				       struct acpi_resource_gpio *agpio, u8 type)
+				       struct acpi_resource_gpio *agpio)
 {
 	char *path = agpio->resource_source.string_ptr;
 	u16 pin = agpio->pin_table[0];
 	struct gpio_desc *gpio;
 
-	switch (type) {
-	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,clk-enable");
-		if (IS_ERR(gpio))
-			return (PTR_ERR(gpio));
-
-		int3472->clock.ena_gpio = gpio;
-		/* Ensure the pin is in output mode and non-active state */
-		gpiod_direction_output(int3472->clock.ena_gpio, 0);
-		break;
-	case INT3472_GPIO_TYPE_PRIVACY_LED:
-		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
-		if (IS_ERR(gpio))
-			return (PTR_ERR(gpio));
+	gpio = acpi_get_and_request_gpiod(path, pin, "int3472,clk-enable");
+	if (IS_ERR(gpio))
+		return (PTR_ERR(gpio));
 
-		int3472->clock.led_gpio = gpio;
-		/* Ensure the pin is in output mode and non-active state */
-		gpiod_direction_output(int3472->clock.led_gpio, 0);
-		break;
-	default:
-		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);
-		break;
-	}
+	int3472->clock.ena_gpio = gpio;
+	/* Ensure the pin is in output mode and non-active state */
+	gpiod_direction_output(int3472->clock.ena_gpio, 0);
 
-	return 0;
+	return skl_int3472_register_clock(int3472);
 }
 
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
@@ -293,11 +277,16 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-	case INT3472_GPIO_TYPE_PRIVACY_LED:
-		ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
+		ret = skl_int3472_map_gpio_to_clk(int3472, agpio);
 		if (ret)
 			err_msg = "Failed to map GPIO to clock\n";
 
+		break;
+	case INT3472_GPIO_TYPE_PRIVACY_LED:
+		ret = skl_int3472_register_pled(int3472, agpio, polarity);
+		if (ret)
+			err_msg = "Failed to register LED\n";
+
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 		ret = skl_int3472_register_regulator(int3472, agpio);
@@ -341,21 +330,6 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 
 	acpi_dev_free_resource_list(&resource_list);
 
-	/*
-	 * If we find no clock enable GPIO pin then the privacy LED won't work.
-	 * We've never seen that situation, but it's possible. Warn the user so
-	 * it's clear what's happened.
-	 */
-	if (int3472->clock.ena_gpio) {
-		ret = skl_int3472_register_clock(int3472);
-		if (ret)
-			return ret;
-	} else {
-		if (int3472->clock.led_gpio)
-			dev_warn(int3472->dev,
-				 "No clk GPIO. The privacy LED won't work\n");
-	}
-
 	int3472->gpios.dev_id = int3472->sensor_name;
 	gpiod_add_lookup_table(&int3472->gpios);
 
@@ -372,8 +346,8 @@ static int skl_int3472_discrete_remove(struct platform_device *pdev)
 		skl_int3472_unregister_clock(int3472);
 
 	gpiod_put(int3472->clock.ena_gpio);
-	gpiod_put(int3472->clock.led_gpio);
 
+	skl_int3472_unregister_pled(int3472);
 	skl_int3472_unregister_regulator(int3472);
 
 	return 0;
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
new file mode 100644
index 000000000000..251c6524458e
--- /dev/null
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Author: Hans de Goede <hdegoede@redhat.com> */
+
+#include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds.h>
+#include "common.h"
+
+static int int3472_pled_set(struct led_classdev *led_cdev,
+				     enum led_brightness brightness)
+{
+	struct int3472_discrete_device *int3472 =
+		container_of(led_cdev, struct int3472_discrete_device, pled.classdev);
+
+	gpiod_set_value_cansleep(int3472->pled.gpio, brightness);
+	return 0;
+}
+
+int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
+			      struct acpi_resource_gpio *agpio, u32 polarity)
+{
+	char *p, *path = agpio->resource_source.string_ptr;
+	int ret;
+
+	if (int3472->pled.classdev.dev)
+		return -EBUSY;
+
+	int3472->pled.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
+							     "int3472,privacy-led");
+	if (IS_ERR(int3472->pled.gpio))
+		return dev_err_probe(int3472->dev, PTR_ERR(int3472->pled.gpio),
+				     "getting privacy LED GPIO\n");
+
+	if (polarity == GPIO_ACTIVE_LOW)
+		gpiod_toggle_active_low(int3472->pled.gpio);
+
+	/* Ensure the pin is in output mode and non-active state */
+	gpiod_direction_output(int3472->pled.gpio, 0);
+
+	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
+	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
+		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
+	p = strchr(int3472->pled.name, ':');
+	*p = '_';
+
+	int3472->pled.classdev.name = int3472->pled.name;
+	int3472->pled.classdev.max_brightness = 1;
+	int3472->pled.classdev.brightness_set_blocking = int3472_pled_set;
+
+	ret = led_classdev_register(int3472->dev, &int3472->pled.classdev);
+	if (ret)
+		goto err_free_gpio;
+
+	int3472->pled.lookup.provider = int3472->pled.name;
+	int3472->pled.lookup.dev_id = int3472->sensor_name;
+	int3472->pled.lookup.con_id = "privacy-led";
+	led_add_lookup(&int3472->pled.lookup);
+
+	return 0;
+
+err_free_gpio:
+	gpiod_put(int3472->pled.gpio);
+	return ret;
+}
+
+void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
+{
+	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
+		return;
+
+	led_remove_lookup(&int3472->pled.lookup);
+	led_classdev_unregister(&int3472->pled.classdev);
+	gpiod_put(int3472->pled.gpio);
+}
-- 
2.39.1

