Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5366A63CB9F
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 00:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbiK2XNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 18:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbiK2XNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 18:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B31A6DFFC
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669763528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WrNeW7BVUetUYY+qoFlE8/GHNa0ZQ+HvhrMKFufEYYw=;
        b=NlWMUsc9b7HzlEcmbn/7JbghxSiETeksOFNrsRyEYruC8JiUrb41JHlp5Fl47SxOqYYiiX
        t0Tw4L8IDOLScNaphi5Aqe1eVKjlOpyh+bkWyYhl3A93sohSZ30LcE4gcV8X16GBaqyBMa
        ti9ZIdHPwBjehjXre9i6LqTZA16ChJ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-ubf96md-NeOldeUe_EdIOw-1; Tue, 29 Nov 2022 18:12:05 -0500
X-MC-Unique: ubf96md-NeOldeUe_EdIOw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9222C1C05AB8;
        Tue, 29 Nov 2022 23:12:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3E430483EFB;
        Tue, 29 Nov 2022 23:12:03 +0000 (UTC)
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
Subject: [PATCH 4/6] platform/x86: int3472/discrete: Move GPIO request to skl_int3472_register_clock()
Date:   Wed, 30 Nov 2022 00:11:47 +0100
Message-Id: <20221129231149.697154-5-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the requesting of the clk-enable GPIO to skl_int3472_register_clock()
(and move the gpiod_put to unregister).

This mirrors the GPIO handling in skl_int3472_register_regulator() and
allows removing  skl_int3472_map_gpio_to_clk() from discrete.c .

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 23 +++++++++++++--
 drivers/platform/x86/intel/int3472/common.h   |  3 +-
 drivers/platform/x86/intel/int3472/discrete.c | 28 ++-----------------
 3 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index e61119b17677..89894ec873f2 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -86,18 +86,29 @@ static const struct clk_ops skl_int3472_clock_ops = {
 	.recalc_rate = skl_int3472_clk_recalc_rate,
 };
 
-int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
+int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
+			       struct acpi_resource_gpio *agpio)
 {
+	char *path = agpio->resource_source.string_ptr;
 	struct clk_init_data init = {
 		.ops = &skl_int3472_clock_ops,
 		.flags = CLK_GET_RATE_NOCACHE,
 	};
 	int ret;
 
+	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
+							     "int3472,clk-enable");
+	if (IS_ERR(int3472->clock.ena_gpio)) {
+		ret = PTR_ERR(int3472->clock.ena_gpio);
+		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
+	}
+
 	init.name = kasprintf(GFP_KERNEL, "%s-clk",
 			      acpi_dev_name(int3472->adev));
-	if (!init.name)
-		return -ENOMEM;
+	if (!init.name) {
+		ret = -ENOMEM;
+		goto out_put_gpio;
+	}
 
 	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
 
@@ -123,14 +134,20 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
 	clk_unregister(int3472->clock.clk);
 out_free_init_name:
 	kfree(init.name);
+out_put_gpio:
+	gpiod_put(int3472->clock.ena_gpio);
 
 	return ret;
 }
 
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 {
+	if (!int3472->clock.cl)
+		return;
+
 	clkdev_drop(int3472->clock.cl);
 	clk_unregister(int3472->clock.clk);
+	gpiod_put(int3472->clock.ena_gpio);
 }
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index c31321a586d4..434591313762 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -111,7 +111,8 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 					 struct acpi_device **sensor_adev_ret,
 					 const char **name_ret);
 
-int skl_int3472_register_clock(struct int3472_discrete_device *int3472);
+int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
+			       struct acpi_resource_gpio *agpio);
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 7887c6a4035e..6f5fef11cfb7 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -2,8 +2,6 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
-#include <linux/clkdev.h>
-#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
@@ -154,22 +152,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 	return 0;
 }
 
-static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
-				       struct acpi_resource_gpio *agpio)
-{
-	char *path = agpio->resource_source.string_ptr;
-	u16 pin = agpio->pin_table[0];
-	struct gpio_desc *gpio;
-
-	gpio = acpi_get_and_request_gpiod(path, pin, "int3472,clk-enable");
-	if (IS_ERR(gpio))
-		return (PTR_ERR(gpio));
-
-	int3472->clock.ena_gpio = gpio;
-
-	return skl_int3472_register_clock(int3472);
-}
-
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
 {
 	switch (type) {
@@ -275,9 +257,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		ret = skl_int3472_map_gpio_to_clk(int3472, agpio);
+		ret = skl_int3472_register_clock(int3472, agpio);
 		if (ret)
-			err_msg = "Failed to map GPIO to clock\n";
+			err_msg = "Failed to register clock\n";
 
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
@@ -334,11 +316,7 @@ static int skl_int3472_discrete_remove(struct platform_device *pdev)
 
 	gpiod_remove_lookup_table(&int3472->gpios);
 
-	if (int3472->clock.cl)
-		skl_int3472_unregister_clock(int3472);
-
-	gpiod_put(int3472->clock.ena_gpio);
-
+	skl_int3472_unregister_clock(int3472);
 	skl_int3472_unregister_regulator(int3472);
 
 	return 0;
-- 
2.38.1

