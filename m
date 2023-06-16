Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE8773375C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241507AbjFPRWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjFPRWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1AB1FEC
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AIp6fOanI5PTGoVFIMq8DHV2iHwJWOmIxJo5OyBEUpw=;
        b=a/3fsRMYFuL1KfiE5leGfSUU7Gc87wHCxLN72aVe7b0NJvpT/1238ArN+j/qvjkhjVJbQQ
        6bqnHtCLR4XzDGIkeTokjud6rdNI2ELHuZ+uL4jObGwFGYSBTC68Ap9LN/BZeMxbZw1GUZ
        +axdxgQkBP0gy3YN157Z9tyZw+zECV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-dHFZWSvTMUKJITy6dZ5BtA-1; Fri, 16 Jun 2023 13:21:35 -0400
X-MC-Unique: dHFZWSvTMUKJITy6dZ5BtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19E3385A58C;
        Fri, 16 Jun 2023 17:21:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 01C8A40C95E1;
        Fri, 16 Jun 2023 17:21:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Hao Yao <hao.yao@intel.com>
Subject: [PATCH v2 1/6] platform/x86: int3472: discrete: Drop GPIO remapping support
Date:   Fri, 16 Jun 2023 19:21:27 +0200
Message-ID: <20230616172132.37859-2-hdegoede@redhat.com>
In-Reply-To: <20230616172132.37859-1-hdegoede@redhat.com>
References: <20230616172132.37859-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only sensor driver which needs GPIO remapping support is the ov2680
driver and ACPI enumeration support + other necessary changes to
the ov2680 driver were never upstreamed.

A new series updating the ov2680 driver is pending upstream now and
in this series the ov2680 driver is patched to look for "powerdown"
as con-id, instead of relying on GPIO remapping in the int3472 code,
so the GPIO remapping is no longer necessary.

Tested-by: Hao Yao <hao.yao@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/common.h   |  6 ---
 drivers/platform/x86/intel/int3472/discrete.c | 37 ++-----------------
 2 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 0c9c899e017b..735567f374a6 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -69,15 +69,9 @@ struct int3472_cldb {
 	u8 reserved2[17];
 };
 
-struct int3472_gpio_function_remap {
-	const char *documented;
-	const char *actual;
-};
-
 struct int3472_sensor_config {
 	const char *sensor_module_name;
 	struct regulator_consumer_supply supply_map;
-	const struct int3472_gpio_function_remap *function_maps;
 };
 
 struct int3472_discrete_device {
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 8111579a59d4..2ab3c7466986 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -39,27 +39,13 @@ static const guid_t cio2_sensor_module_guid =
  * the functions mapping resources to the sensors. Where the sensors have
  * a power enable pin defined in DSDT we need to provide a supply name so
  * the sensor drivers can find the regulator. The device name will be derived
- * from the sensor's ACPI device within the code. Optionally, we can provide a
- * NULL terminated array of function name mappings to deal with any platform
- * specific deviations from the documented behaviour of GPIOs.
- *
- * Map a GPIO function name to NULL to prevent the driver from mapping that
- * GPIO at all.
+ * from the sensor's ACPI device within the code.
  */
-
-static const struct int3472_gpio_function_remap ov2680_gpio_function_remaps[] = {
-	{ "reset", NULL },
-	{ "powerdown", "reset" },
-	{ }
-};
-
 static const struct int3472_sensor_config int3472_sensor_configs[] = {
-	/* Lenovo Miix 510-12ISK - OV2680, Front */
-	{ "GNDF140809R", { 0 }, ov2680_gpio_function_remaps },
 	/* Lenovo Miix 510-12ISK - OV5648, Rear */
-	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
+	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL) },
 	/* Surface Go 1&2 - OV5693, Front */
-	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
+	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL) },
 };
 
 static const struct int3472_sensor_config *
@@ -96,7 +82,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 					  struct acpi_resource_gpio *agpio,
 					  const char *func, u32 polarity)
 {
-	const struct int3472_sensor_config *sensor_config;
 	char *path = agpio->resource_source.string_ptr;
 	struct gpiod_lookup *table_entry;
 	struct acpi_device *adev;
@@ -108,22 +93,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 		return -EINVAL;
 	}
 
-	sensor_config = int3472->sensor_config;
-	if (!IS_ERR(sensor_config) && sensor_config->function_maps) {
-		const struct int3472_gpio_function_remap *remap;
-
-		for (remap = sensor_config->function_maps; remap->documented; remap++) {
-			if (!strcmp(func, remap->documented)) {
-				func = remap->actual;
-				break;
-			}
-		}
-	}
-
-	/* Functions mapped to NULL should not be mapped to the sensor */
-	if (!func)
-		return 0;
-
 	status = acpi_get_handle(NULL, path, &handle);
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
-- 
2.41.0

