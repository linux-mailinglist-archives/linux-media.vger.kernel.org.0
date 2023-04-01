Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E0F6D31B4
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjDAPAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjDAPAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4921D2DC
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361184;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PCnCunX8zPLtEMo/fn00t95JhskXvfVoqtR5aYXZvnU=;
        b=Y+hBUWC5tuKm6bf1x3TrEQlS9rzp91g0hGT8US3dAyKI0Rs8Sg6Y5+lvJCHyiTLTZ+r/M4
        o+Jf6ewGuWAHkAGY1qQZA14/TnywJUp9jLVMPOrNYB1uLHjxH2Bx6208mgTq8WLC+cmGGH
        Rk05Mp/ZRZqaPlGE1GH2uVxg14u+adE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-I2IOVZdDN1mR37GiUn2E5w-1; Sat, 01 Apr 2023 10:59:40 -0400
X-MC-Unique: I2IOVZdDN1mR37GiUn2E5w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121ED1C04181;
        Sat,  1 Apr 2023 14:59:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8581C400F59;
        Sat,  1 Apr 2023 14:59:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/28] media: atomisp: ov2680: Use v4l2_get_acpi_sensor_info() for the GPIO lookups
Date:   Sat,  1 Apr 2023 16:59:00 +0200
Message-Id: <20230401145926.596216-3-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new v4l2_get_acpi_sensor_info() for the GPIO lookups,
this uses the special Intel _DSM method to get more info about
the GPIOs like their function and their polarity.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 26 +++----------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  1 -
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index aeb38599fe13..3181276ed027 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -3,6 +3,7 @@
  * Support for OmniVision OV2680 1080p HD camera sensor.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
+ * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License version
@@ -614,21 +615,6 @@ static void ov2680_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-/*
- * Unlike other sensors which have both a rest and powerdown input pins,
- * the OV2680 only has a powerdown input. But some ACPI tables still list
- * 2 GPIOs for the OV2680 and it is unclear which to use. So try to get
- * up to 2 GPIOs (1 mandatory, 1 optional) and control them in sync.
- */
-static const struct acpi_gpio_params ov2680_first_gpio = { 0, 0, true };
-static const struct acpi_gpio_params ov2680_second_gpio = { 1, 0, true };
-
-static const struct acpi_gpio_mapping ov2680_gpio_mapping[] = {
-	{ "powerdown-gpios", &ov2680_first_gpio, 1 },
-	{ "powerdown-alt-gpios", &ov2680_second_gpio, 1 },
-	{ },
-};
-
 static int ov2680_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -644,18 +630,14 @@ static int ov2680_probe(struct i2c_client *client)
 	sensor->client = client;
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
 
-	ret = devm_acpi_dev_add_driver_gpios(&client->dev, ov2680_gpio_mapping);
+	ret = v4l2_get_acpi_sensor_info(dev, NULL);
 	if (ret)
 		return ret;
 
-	sensor->powerdown = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
+	sensor->powerdown = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->powerdown))
 		return dev_err_probe(dev, PTR_ERR(sensor->powerdown), "getting powerdown GPIO\n");
 
-	sensor->powerdown_alt = devm_gpiod_get_optional(dev, "powerdown-alt", GPIOD_OUT_HIGH);
-	if (IS_ERR(sensor->powerdown_alt))
-		return dev_err_probe(dev, PTR_ERR(sensor->powerdown_alt), "getting powerdown-alt GPIO\n");
-
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
@@ -699,7 +681,6 @@ static int ov2680_suspend(struct device *dev)
 	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 
 	gpiod_set_value_cansleep(sensor->powerdown, 1);
-	gpiod_set_value_cansleep(sensor->powerdown_alt, 1);
 	return 0;
 }
 
@@ -712,7 +693,6 @@ static int ov2680_resume(struct device *dev)
 	usleep_range(5000, 6000);
 
 	gpiod_set_value_cansleep(sensor->powerdown, 0);
-	gpiod_set_value_cansleep(sensor->powerdown_alt, 0);
 
 	/* according to DS, 20ms is needed between PWDN and i2c access */
 	msleep(20);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index a37af0a74a53..baf49eb0659e 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -114,7 +114,6 @@ struct ov2680_device {
 	struct mutex input_lock;
 	struct i2c_client *client;
 	struct gpio_desc *powerdown;
-	struct gpio_desc *powerdown_alt;
 	bool is_streaming;
 
 	struct ov2680_mode {
-- 
2.39.1

