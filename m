Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E0472E062
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 13:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242091AbjFMLJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 07:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239887AbjFMLJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 07:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBE210D8
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686654498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=BK5Kh9/SO1dyWkPt83ch6PopmgUN5GMSo8JOxrSlmHI=;
        b=PvsO4LqaBOD2mkZKzRYYKEYzkVkgoFVJsi85e4DwoyqTe10E7xvHRv12Vyt/uVZKsnX75B
        p/dZrKf97yipMc0rV1vZFzaHAJuIQtglb+fVtnnpeAdk+UNGLCW9w7lbDiaqzBO9D94cld
        g+svQKWk+bfcYPFaxUFJZBXK8BQZWig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-WC5-V6gzPVWzo3QFbTaplg-1; Tue, 13 Jun 2023 07:08:13 -0400
X-MC-Unique: WC5-V6gzPVWzo3QFbTaplg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D7AF101A55C;
        Tue, 13 Jun 2023 11:08:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 88256492CA6;
        Tue, 13 Jun 2023 11:08:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: int3472: discrete: Use FIELD_GET() on the GPIO _DSM return value
Date:   Tue, 13 Jun 2023 13:08:09 +0200
Message-Id: <20230613110810.240193-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Add defines for the various fields encoded in the GPIO _DSM integer
return value and then use FIELD_GET() to get field values.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index fc839a73e411..a31964076883 100644
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
2.40.1

