Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC9A733762
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345595AbjFPRXM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344676AbjFPRXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDC02685
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsfzHnZ5dKPPd9rn5+1LrpSFUe4tK0LZD1i5b1xpeUU=;
        b=SyZmDWE7UNHM/2iQnSCMUEbroXmGDltQdbCQE8bVGVKiUsqIdDzfSp0blwlS3HNQHJAcOu
        AbrHUM2oQzHIyBLpeu2wCMD48gz0ll7uC6/AX4XgcnJE3HSNFbFxIWqx0b1cy11zZuuqZg
        uryCPgccDqamgT1D90JknJmfuVsnl3w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-rlb9esibP7eoDbYr5OUUSg-1; Fri, 16 Jun 2023 13:21:38 -0400
X-MC-Unique: rlb9esibP7eoDbYr5OUUSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98DF61C08962;
        Fri, 16 Jun 2023 17:21:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 987FA40C95E1;
        Fri, 16 Jun 2023 17:21:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Hao Yao <hao.yao@intel.com>
Subject: [PATCH v2 3/6] platform/x86: int3472: discrete: Add support for 1 GPIO regulator shared between 2 sensors
Date:   Fri, 16 Jun 2023 19:21:29 +0200
Message-ID: <20230616172132.37859-4-hdegoede@redhat.com>
In-Reply-To: <20230616172132.37859-1-hdegoede@redhat.com>
References: <20230616172132.37859-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Tested-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 43 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/common.h   |  3 +-
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 5487f3ab66ad..a5c60b86f5de 100644
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
@@ -252,22 +253,54 @@ static const char * const skl_int3472_regulator_map_supplies[] = {
 static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
 	      GPIO_REGULATOR_SUPPLY_MAP_COUNT);
 
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
 
-	for (i = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
-		int3472->regulator.supply_map[i].supply = skl_int3472_regulator_map_supplies[i];
-		int3472->regulator.supply_map[i].dev_name = int3472->sensor_name;
+	id = dmi_first_match(skl_int3472_regulator_second_sensor);
+	if (id)
+		second_sensor = id->driver_data;
+
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
2.41.0

