Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2187183D5
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237238AbjEaNwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 09:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbjEaNvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 09:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35451359C
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685540686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3ZJECgwYNAy7JW66AlS/QzwXqqJ/tqXCsLPsfJYHaLs=;
        b=gAKURmeXRvVHJWxwdrWGKgT0g+6CDsMr03R+WfcJxPncHhvLGK/UBOvDf0CDFr6tChONBc
        BwdUgVSiT8qdK6vhAzLjoQ3CyOK6tbLeczTlmP74BD8mGc/KorEQ1gk06zuSkGk6+h9Vfu
        c3N6xDoRdh/GGj3EXYAC/NHf3Pw8UeA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-sqIP0IXcN2e8dp9hf19Vlw-1; Wed, 31 May 2023 09:44:40 -0400
X-MC-Unique: sqIP0IXcN2e8dp9hf19Vlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C957529DD999;
        Wed, 31 May 2023 13:44:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1051D170ED;
        Wed, 31 May 2023 13:44:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, bingbu.cao@linux.intel.com,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
Subject: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method to control imaging clock
Date:   Wed, 31 May 2023 15:44:29 +0200
Message-Id: <20230531134429.171337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

On some platforms, the imaging clock should be controlled by evaluating
specific clock device's _DSM method instead of setting gpio, so this
change register clock if no gpio based clock and then use the _DSM method
to enable and disable clock.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
Link: https://lore.kernel.org/r/20230524035135.90315-2-bingbu.cao@intel.com
---
Changes in v2 (Hans de Goede):
- Minor comment / code changes (address Andy's review remarks)
- Add a acpi_check_dsm() call
- Return 0 instead of error if we already have a GPIO clk or if
  acpi_check_dsm() fails
- Rename skl_int3472_register_clock() -> skl_int3472_register_gpio_clock()
  and name the new function: skl_int3472_register_dsm_clock()
- Move the skl_int3472_register_dsm_clock() call to after
  acpi_dev_free_resource_list() and add error checking for it
---
 .../x86/intel/int3472/clk_and_regulator.c     | 89 ++++++++++++++++++-
 drivers/platform/x86/intel/int3472/common.h   | 10 ++-
 drivers/platform/x86/intel/int3472/discrete.c |  8 +-
 3 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 1086c3d83494..9bcf8c64b8e7 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -11,6 +11,37 @@
 
 #include "common.h"
 
+/*
+ * 82c0d13a-78c5-4244-9bb1-eb8b539a8d11
+ * This _DSM GUID allows controlling the sensor clk when it is not controlled
+ * through a GPIO.
+ */
+static const guid_t img_clk_guid =
+	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
+		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
+
+static void skl_int3472_enable_clk_acpi_method(struct int3472_gpio_clock *clk,
+					       bool enable)
+{
+	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
+	union acpi_object args[3];
+	union acpi_object argv4;
+
+	args[0].integer.type = ACPI_TYPE_INTEGER;
+	args[0].integer.value = clk->imgclk_index;
+	args[1].integer.type = ACPI_TYPE_INTEGER;
+	args[1].integer.value = enable ? 1 : 0;
+	args[2].integer.type = ACPI_TYPE_INTEGER;
+	args[2].integer.value = 1;
+
+	argv4.type = ACPI_TYPE_PACKAGE;
+	argv4.package.count = 3;
+	argv4.package.elements = args;
+
+	acpi_evaluate_dsm(acpi_device_handle(int3472->adev), &img_clk_guid,
+			  0, 1, &argv4);
+}
+
 /*
  * The regulators have to have .ops to be valid, but the only ops we actually
  * support are .enable and .disable which are handled via .ena_gpiod. Pass an
@@ -22,7 +53,11 @@ static int skl_int3472_clk_prepare(struct clk_hw *hw)
 {
 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
 
-	gpiod_set_value_cansleep(clk->ena_gpio, 1);
+	if (clk->ena_gpio)
+		gpiod_set_value_cansleep(clk->ena_gpio, 1);
+	else
+		skl_int3472_enable_clk_acpi_method(clk, 1);
+
 	return 0;
 }
 
@@ -30,7 +65,10 @@ static void skl_int3472_clk_unprepare(struct clk_hw *hw)
 {
 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
 
-	gpiod_set_value_cansleep(clk->ena_gpio, 0);
+	if (clk->ena_gpio)
+		gpiod_set_value_cansleep(clk->ena_gpio, 0);
+	else
+		skl_int3472_enable_clk_acpi_method(clk, 0);
 }
 
 static int skl_int3472_clk_enable(struct clk_hw *hw)
@@ -86,8 +124,51 @@ static const struct clk_ops skl_int3472_clock_ops = {
 	.recalc_rate = skl_int3472_clk_recalc_rate,
 };
 
-int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
-			       struct acpi_resource_gpio *agpio, u32 polarity)
+int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
+{
+	struct acpi_device *adev = int3472->adev;
+	struct clk_init_data init = {
+		.ops = &skl_int3472_clock_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	};
+	int ret;
+
+	if (int3472->clock.cl)
+		return 0; /* A GPIO controlled clk has already been registered */
+
+	if (!acpi_check_dsm(adev->handle, &img_clk_guid, 0, BIT(1)))
+		return 0; /* DSM clock control is not available */
+
+	init.name = kasprintf(GFP_KERNEL, "%s-clk", acpi_dev_name(adev));
+	if (!init.name)
+		return -ENOMEM;
+
+	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
+	int3472->clock.clk_hw.init = &init;
+	int3472->clock.clk = clk_register(&adev->dev, &int3472->clock.clk_hw);
+	if (IS_ERR(int3472->clock.clk)) {
+		ret = PTR_ERR(int3472->clock.clk);
+		goto out_free_init_name;
+	}
+
+	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL, int3472->sensor_name);
+	if (!int3472->clock.cl) {
+		ret = -ENOMEM;
+		goto err_unregister_clk;
+	}
+
+	kfree(init.name);
+	return 0;
+
+err_unregister_clk:
+	clk_unregister(int3472->clock.clk);
+out_free_init_name:
+	kfree(init.name);
+	return ret;
+}
+
+int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
+				    struct acpi_resource_gpio *agpio, u32 polarity)
 {
 	char *path = agpio->resource_source.string_ptr;
 	struct clk_init_data init = {
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 61688e450ce5..10a72f42a998 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -64,7 +64,9 @@ struct int3472_cldb {
 	u8 control_logic_type;
 	u8 control_logic_id;
 	u8 sensor_card_sku;
-	u8 reserved[28];
+	u8 reserved[10];
+	u8 clock_source;
+	u8 reserved2[17];
 };
 
 struct int3472_gpio_function_remap {
@@ -100,6 +102,7 @@ struct int3472_discrete_device {
 		struct clk_lookup *cl;
 		struct gpio_desc *ena_gpio;
 		u32 frequency;
+		u8 imgclk_index;
 	} clock;
 
 	struct int3472_pled {
@@ -121,8 +124,9 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 					 struct acpi_device **sensor_adev_ret,
 					 const char **name_ret);
 
-int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
-			       struct acpi_resource_gpio *agpio, u32 polarity);
+int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
+				    struct acpi_resource_gpio *agpio, u32 polarity);
+int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472);
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index ef020e23e596..8111579a59d4 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -258,7 +258,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		ret = skl_int3472_register_clock(int3472, agpio, polarity);
+		ret = skl_int3472_register_gpio_clock(int3472, agpio, polarity);
 		if (ret)
 			err_msg = "Failed to register clock\n";
 
@@ -311,6 +311,11 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 
 	acpi_dev_free_resource_list(&resource_list);
 
+	/* Register _DSM based clock (no-op if a GPIO clock was already registered) */
+	ret = skl_int3472_register_dsm_clock(int3472);
+	if (ret < 0)
+		return ret;
+
 	int3472->gpios.dev_id = int3472->sensor_name;
 	gpiod_add_lookup_table(&int3472->gpios);
 
@@ -356,6 +361,7 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
 	int3472->adev = adev;
 	int3472->dev = &pdev->dev;
 	platform_set_drvdata(pdev, int3472);
+	int3472->clock.imgclk_index = cldb.clock_source;
 
 	ret = skl_int3472_get_sensor_adev_and_name(&pdev->dev, &int3472->sensor,
 						   &int3472->sensor_name);
-- 
2.40.1

