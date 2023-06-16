Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 967E9733761
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244736AbjFPRXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344566AbjFPRXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA5D26B3
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hbhbe4lOgz4k5EXeSjp8uAwD2Dwf4BE4cmVFkBHorgg=;
        b=jOdwWTzagJiNsefr54D3lfJqN2MwcWSqpfWJlIPOwp+UQjsA0Acn8Zg6uvLNkmJNeyGjND
        RovF23fP15xCpyZDXekxjC91d6wlXArr4We9qHPOgPp/dwCkyZOgc0JfnHjXIyLjpCRxji
        loPut4RQ9DOh8/HHCD9/bZvChaV901I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-MA4qkkl7PTixBxlh6DZPSA-1; Fri, 16 Jun 2023 13:21:41 -0400
X-MC-Unique: MA4qkkl7PTixBxlh6DZPSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00B63800A15;
        Fri, 16 Jun 2023 17:21:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E54A40C95E2;
        Fri, 16 Jun 2023 17:21:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 6/6] platform/x86: int3472: discrete: Log a warning if the pin-numbers don't match
Date:   Fri, 16 Jun 2023 19:21:32 +0200
Message-ID: <20230616172132.37859-7-hdegoede@redhat.com>
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

The INT3472 discrete code assumes that the ACPI GPIO resources are
in the same order as the pin-info _DSM entries.

The returned pin-info includes the pin-number in bits 15-8. Add a check
that this matches with the ACPI GPIO resource pin-number in case
the assumption is not true with some ACPI tables.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 557517f43ede..e33c2d75975c 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -154,8 +154,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 {
 	struct int3472_discrete_device *int3472 = data;
 	struct acpi_resource_gpio *agpio;
+	u8 active_value, pin, type;
 	union acpi_object *obj;
-	u8 active_value, type;
 	const char *err_msg;
 	const char *func;
 	u32 polarity;
@@ -183,6 +183,12 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
+	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
+	if (pin != agpio->pin_table[0])
+		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
+			 func, agpio->resource_source.string_ptr, pin,
+			 agpio->pin_table[0]);
+
 	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
 		polarity ^= GPIO_ACTIVE_LOW;
-- 
2.41.0

