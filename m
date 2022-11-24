Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C030638003
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 21:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiKXUBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 15:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiKXUBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 15:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5592A704
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 12:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669320018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s09UeePB6z8paukx/KjyayrP6nJqT11KHIhjeOQWkFA=;
        b=bjj/ebgh31lcuUh/amdsBzgOODNAxSHtI+uXtmnBMb6+icg2dj3bK8tCzaEfMn0p/fy4+J
        vUlDsdMRy5WjYo41DLo3t6z0RyURJF7m3hoqLrt9AKsJsSduDQ2790KU9WDgxjW/1EtPxP
        vZuXdwmGYeGkopFbpPEp9pdkjqIcVhk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-ICzjd7L5N0i6azz14RFOdA-1; Thu, 24 Nov 2022 15:00:14 -0500
X-MC-Unique: ICzjd7L5N0i6azz14RFOdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18620383D0C9;
        Thu, 24 Nov 2022 20:00:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D51FA1415114;
        Thu, 24 Nov 2022 20:00:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
Date:   Thu, 24 Nov 2022 21:00:05 +0100
Message-Id: <20221124200007.390901-2-hdegoede@redhat.com>
In-Reply-To: <20221124200007.390901-1-hdegoede@redhat.com>
References: <20221124200007.390901-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the GPIO to sensor mapping more generic and fold the
INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN cases into
a single generic case.

This is a preparation patch for further GPIO mapping changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 974a132db651..bc6c62f3f3bf 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -184,6 +184,24 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
 	return 0;
 }
 
+static const char *int3472_dsm_type_to_func(u8 type)
+{
+	switch (type) {
+	case INT3472_GPIO_TYPE_RESET:
+		return "reset";
+	case INT3472_GPIO_TYPE_POWERDOWN:
+		return "powerdown";
+	case INT3472_GPIO_TYPE_CLK_ENABLE:
+		return "clken";
+	case INT3472_GPIO_TYPE_PRIVACY_LED:
+		return "pled";
+	case INT3472_GPIO_TYPE_POWER_ENABLE:
+		return "power-enable";
+	}
+
+	return "unknown";
+}
+
 /**
  * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
  * @ares: A pointer to a &struct acpi_resource
@@ -223,6 +241,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	struct acpi_resource_gpio *agpio;
 	union acpi_object *obj;
 	const char *err_msg;
+	const char *func;
 	int ret;
 	u8 type;
 
@@ -246,19 +265,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = obj->integer.value & 0xff;
 
+	func = int3472_dsm_type_to_func(type);
+
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
-		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "reset",
-						     GPIO_ACTIVE_LOW);
-		if (ret)
-			err_msg = "Failed to map reset pin to sensor\n";
-
-		break;
 	case INT3472_GPIO_TYPE_POWERDOWN:
-		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "powerdown",
+		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func,
 						     GPIO_ACTIVE_LOW);
 		if (ret)
-			err_msg = "Failed to map powerdown pin to sensor\n";
+			err_msg = "Failed to map GPIO pin to sensor\n";
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-- 
2.38.1

