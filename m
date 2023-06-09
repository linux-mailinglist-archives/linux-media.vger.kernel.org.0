Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D6072A4D7
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 22:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjFIUnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 16:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFIUnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 16:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE232D74
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686343358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AARJiCS1kYD33TwlHQ+hK9jOTS5NoxoTeA+qcuH1xCk=;
        b=RfHRe7NjBCpiTg0MU0bnz0g52ZlEkAPMbeyIaz/+q4JpKChN3ASU778j4k9EKepa5WRqmM
        vK7qe1xXg/lzLFQJmXEr4iaq3HZI4EBiuOt9/lR6E4Fbyoe8Zl5IQyujoaARlCsxI7Q1Zy
        Yb9ADZIemkR07Qyy78Zp3QIJilTWBfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-y68jy-CyPSq973ZJOc4SoA-1; Fri, 09 Jun 2023 16:42:34 -0400
X-MC-Unique: y68jy-CyPSq973ZJOc4SoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6285D185A78F;
        Fri,  9 Jun 2023 20:42:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3F96B40CFD00;
        Fri,  9 Jun 2023 20:42:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/4] platform/x86: int3472: discrete: Add support for 1 GPIO regulator shared between 2 sensors
Date:   Fri,  9 Jun 2023 22:42:27 +0200
Message-Id: <20230609204228.74967-4-hdegoede@redhat.com>
In-Reply-To: <20230609204228.74967-1-hdegoede@redhat.com>
References: <20230609204228.74967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On the Lenovo Miix 510-12IKB there is 1 GPIO regulator, with its GPIO
listed in the INT3472 device belonging to the OV5648 back sensor.
But this regulator also needs to be enabled for the OV2680 front sensor
to work.

Add support to skl_int3472_register_regulator() to add supply map entries
pointing to both sensors based on a DMI quirk table which gives the
dev_name part of the supply map for the second sensor (the sensor without
the GPIO listed in its matching INT3472 ACPI device).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 43 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/common.h   |  3 +-
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 30686091300d..9166f6afcdf9 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -5,6 +5,7 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/driver.h>
 #include <linux/slab.h>
@@ -247,27 +248,59 @@ static const char * const skl_int3472_regulator_map_supplies[] = {
 	"avdd",
 };
 
+/*
+ * On some models there is a single GPIO regulator which is shared between
+ * sensors and only listed in the ACPI resources of one sensor.
+ * This DMI table contains the name of the second sensor. This is used to add
+ * entries for the second sensor to the supply_map.
+ */
+const struct dmi_system_id skl_int3472_regulator_second_sensor[] = {
+	{
+		/* Lenovo Miix 510-12IKB */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 510-12IKB"),
+		},
+		.driver_data = "i2c-OVTI2680:00",
+	},
+	{ }
+};
+
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct acpi_resource_gpio *agpio)
 {
 	char *path = agpio->resource_source.string_ptr;
 	struct regulator_init_data init_data = { };
 	struct regulator_config cfg = { };
-	int i, ret;
+	const char *second_sensor = NULL;
+	const struct dmi_system_id *id;
+	int i, j, ret;
+
+	id = dmi_first_match(skl_int3472_regulator_second_sensor);
+	if (id)
+		second_sensor = id->driver_data;
 
 	if (ARRAY_SIZE(skl_int3472_regulator_map_supplies) != GPIO_REGULATOR_SUPPLY_MAP_COUNT) {
 		dev_err(int3472->dev, "Internal error ARRAY_SIZE(skl_int3472_regulator_map_supplies) != GPIO_REGULATOR_SUPPLY_MAP_COUNT\n");
 		return -EINVAL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
-		int3472->regulator.supply_map[i].supply = skl_int3472_regulator_map_supplies[i];
-		int3472->regulator.supply_map[i].dev_name = int3472->sensor_name;
+	for (i = 0, j = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
+		int3472->regulator.supply_map[j].supply = skl_int3472_regulator_map_supplies[i];
+		int3472->regulator.supply_map[j].dev_name = int3472->sensor_name;
+		j++;
+
+		if (second_sensor) {
+			int3472->regulator.supply_map[j].supply =
+				skl_int3472_regulator_map_supplies[i];
+			int3472->regulator.supply_map[j].dev_name = second_sensor;
+			j++;
+		}
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
 	init_data.consumer_supplies = int3472->regulator.supply_map;
-	init_data.num_consumer_supplies = GPIO_REGULATOR_SUPPLY_MAP_COUNT;
+	init_data.num_consumer_supplies = j;
 
 	snprintf(int3472->regulator.regulator_name,
 		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 225b067c854d..fd2a3d3884fa 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -79,7 +79,8 @@ struct int3472_discrete_device {
 	const struct int3472_sensor_config *sensor_config;
 
 	struct int3472_gpio_regulator {
-		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT];
+		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
+		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
 		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
 		struct gpio_desc *gpio;
-- 
2.40.1

