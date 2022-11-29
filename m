Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF8163CB99
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 00:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbiK2XND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 18:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbiK2XNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 18:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DFF6DFEF
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 15:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669763524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C939oRAvxHAy3INMCz18zu/7PTNLXzdIbHg2+/St1x8=;
        b=Uxe30H53msRTelMrt1yB+LFQxNrPAyKddFsDzt7rM+okZSkT4iUnLW/QL47miONPtWzPVj
        1/yylsQaSPpz0Rirl8GPUZT3O1jDbjRZXcmWI5XObizXi334VXGlFqRTT9qXhKfH8hPcB0
        G3NqciYIW0Cp6Pt5VK4Lh3mj8uOZt9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-MbhRlaBqPXG4PTqqP6HY9A-1; Tue, 29 Nov 2022 18:12:01 -0500
X-MC-Unique: MbhRlaBqPXG4PTqqP6HY9A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF3D3101A528;
        Tue, 29 Nov 2022 23:11:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A5654A9254;
        Tue, 29 Nov 2022 23:11:58 +0000 (UTC)
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
Subject: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Date:   Wed, 30 Nov 2022 00:11:44 +0100
Message-Id: <20221129231149.697154-2-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for a privacy-led GPIO.

Making the privacy LED to controlable from userspace, as using the LED
class subsystem would do, would make it too easy for spy-ware to disable
the LED.

To avoid this have the sensor driver directly control the LED.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note an additional advantage of directly controlling the GPIO is that
GPIOs are tied directly to consumer devices. Where as with a LED class
device, there would need to be some mechanism to tie the right LED
(e.g front or back) to the right sensor.
---
 drivers/media/i2c/ov5693.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index a97ec132ba3a..e3c3bed69ad6 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -156,6 +156,7 @@ struct ov5693_device {
 
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
+	struct gpio_desc *privacy_led;
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
 	struct clk *xvclk;
 
@@ -789,6 +790,7 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 
 static void ov5693_sensor_powerdown(struct ov5693_device *ov5693)
 {
+	gpiod_set_value_cansleep(ov5693->privacy_led, 0);
 	gpiod_set_value_cansleep(ov5693->reset, 1);
 	gpiod_set_value_cansleep(ov5693->powerdown, 1);
 
@@ -818,6 +820,7 @@ static int ov5693_sensor_powerup(struct ov5693_device *ov5693)
 
 	gpiod_set_value_cansleep(ov5693->powerdown, 0);
 	gpiod_set_value_cansleep(ov5693->reset, 0);
+	gpiod_set_value_cansleep(ov5693->privacy_led, 1);
 
 	usleep_range(5000, 7500);
 
@@ -1325,6 +1328,13 @@ static int ov5693_configure_gpios(struct ov5693_device *ov5693)
 		return PTR_ERR(ov5693->powerdown);
 	}
 
+	ov5693->privacy_led = devm_gpiod_get_optional(ov5693->dev, "privacy-led",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(ov5693->privacy_led)) {
+		dev_err(ov5693->dev, "Error fetching privacy-led GPIO\n");
+		return PTR_ERR(ov5693->privacy_led);
+	}
+
 	return 0;
 }
 
-- 
2.38.1

