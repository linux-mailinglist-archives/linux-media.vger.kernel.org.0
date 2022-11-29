Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E8263CBA3
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 00:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236708AbiK2XN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 18:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236522AbiK2XNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 18:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE676DFF9
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 15:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669763529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Clc8LYZelr4tvx1I55ieEVDFh3W6JJY5JsQGwSGuYmA=;
        b=fZc23TBNOAd0XRHaLHjxk+gzVtlp1568IqFAU6ChN2HypdDcVPDEJ02pbD7a95AgOAOxMU
        dH0qQXwaXDjKBJLMYS1AXqjsmQFu780yeJNubmRjO27UKeToHQ1v2ctEnsBTp8vH3SZNy2
        mIOeJkeTs8tvQYhM7eAGINOplpJ3kDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-RlRF2JZ1PuyhvqDnU18dCg-1; Tue, 29 Nov 2022 18:12:03 -0500
X-MC-Unique: RlRF2JZ1PuyhvqDnU18dCg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D46811E7A;
        Tue, 29 Nov 2022 23:12:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A80FA49BB69;
        Tue, 29 Nov 2022 23:12:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/6] platform/x86: int3472/discrete: Treat privacy LED as regular GPIO
Date:   Wed, 30 Nov 2022 00:11:46 +0100
Message-Id: <20221129231149.697154-4-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
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

Fix this by treating the privacy LED as a regular GPIO rather then
integrating it with the registered clock.

Note this relies on the ov5693 driver change to support an (optional)
privacy-led GPIO to avoid the front cam privacy LED regressing on some
models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     |  3 --
 drivers/platform/x86/intel/int3472/common.h   |  1 -
 drivers/platform/x86/intel/int3472/discrete.c | 46 ++++---------------
 3 files changed, 8 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 1cf958983e86..e61119b17677 100644
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
index 53270d19c73a..c31321a586d4 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -96,7 +96,6 @@ struct int3472_discrete_device {
 		struct clk_hw clk_hw;
 		struct clk_lookup *cl;
 		struct gpio_desc *ena_gpio;
-		struct gpio_desc *led_gpio;
 		u32 frequency;
 	} clock;
 
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1eb053d13353..7887c6a4035e 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -155,33 +155,19 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
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
-		break;
-	case INT3472_GPIO_TYPE_PRIVACY_LED:
-		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
-		if (IS_ERR(gpio))
-			return (PTR_ERR(gpio));
+	gpio = acpi_get_and_request_gpiod(path, pin, "int3472,clk-enable");
+	if (IS_ERR(gpio))
+		return (PTR_ERR(gpio));
 
-		int3472->clock.led_gpio = gpio;
-		break;
-	default:
-		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);
-		break;
-	}
+	int3472->clock.ena_gpio = gpio;
 
-	return 0;
+	return skl_int3472_register_clock(int3472);
 }
 
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
@@ -282,14 +268,14 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-	case INT3472_GPIO_TYPE_PRIVACY_LED:
-		ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
+		ret = skl_int3472_map_gpio_to_clk(int3472, agpio);
 		if (ret)
 			err_msg = "Failed to map GPIO to clock\n";
 
@@ -336,21 +322,6 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 
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
 
@@ -367,7 +338,6 @@ static int skl_int3472_discrete_remove(struct platform_device *pdev)
 		skl_int3472_unregister_clock(int3472);
 
 	gpiod_put(int3472->clock.ena_gpio);
-	gpiod_put(int3472->clock.led_gpio);
 
 	skl_int3472_unregister_regulator(int3472);
 
-- 
2.38.1

