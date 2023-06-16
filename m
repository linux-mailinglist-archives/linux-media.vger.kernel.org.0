Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E952733764
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344676AbjFPRXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344566AbjFPRXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:23:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934112686
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tylDLnsgnIllfn1P3gt6cbiBWIW5F1gJ+ztvuDw93Hk=;
        b=dgQTouZgQagHDmTFG4sPBrAvG0GT62yTemh0UTcw6yERTyeHM4H2RTbclgqcPqibOxyR2f
        wcbhnOdXuXuhtDlBf0UXugBOfhpphN5kbgsj/0DMLiUSizjl/otVbogKrZRtF8ss5aW+u+
        BgaCRZfEmmf4f0LaSbF0ygyYfhq8cfA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-KhFffUzyPm2r_Dk3kJap2Q-1; Fri, 16 Jun 2023 13:21:40 -0400
X-MC-Unique: KhFffUzyPm2r_Dk3kJap2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF215185A78B;
        Fri, 16 Jun 2023 17:21:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 08AC540C95E1;
        Fri, 16 Jun 2023 17:21:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 5/6] platform/x86: int3472: discrete: Use FIELD_GET() on the GPIO _DSM return value
Date:   Fri, 16 Jun 2023 19:21:31 +0200
Message-ID: <20230616172132.37859-6-hdegoede@redhat.com>
In-Reply-To: <20230616172132.37859-1-hdegoede@redhat.com>
References: <20230616172132.37859-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add defines for the various fields encoded in the GPIO _DSM integer
return value and then use FIELD_GET() to get field values.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 3b410428cec2..557517f43ede 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -2,6 +2,7 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
@@ -25,6 +26,10 @@ static const guid_t int3472_gpio_guid =
 	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
 		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
 
+#define INT3472_GPIO_DSM_TYPE				GENMASK(7, 0)
+#define INT3472_GPIO_DSM_PIN				GENMASK(15, 8)
+#define INT3472_GPIO_DSM_SENSOR_ON_VAL			GENMASK(31, 24)
+
 /*
  * 822ace8f-2814-4174-a56b-5f029fe079ee
  * This _DSM GUID returns a string from the sensor device, which acts as a
@@ -174,12 +179,11 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 		return 1;
 	}
 
-	type = obj->integer.value & 0xff;
+	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
-	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
-	active_value = obj->integer.value >> 24;
+	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
 		polarity ^= GPIO_ACTIVE_LOW;
 
-- 
2.41.0

