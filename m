Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9225676D5AF
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 19:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbjHBRkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 13:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbjHBRko (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 13:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2AB30EB
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690997942;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cObHkZ504KWlHQpDz8Tf2YqZrc4/61AxKkqb5T0wBaI=;
        b=ZoJQm0BT9pmP0N+VHjaLKLjrYX7SyFgWiOC+1KzZqY1GM2ojwvYCXEdAdiGOOPJf1ebp28
        PDpG4P+BJFDrfrZGBDhmUH4GDB/5f1aCQPwRG4YwNjHAUK+se6YA/hVpxvxoqlJqkMPbO4
        ZyAWtBALesYrA7v3YJOfAfboN4+3xdU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-KugDqjfbOoKqw6uI0M8_eQ-1; Wed, 02 Aug 2023 13:31:08 -0400
X-MC-Unique: KugDqjfbOoKqw6uI0M8_eQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746701C05158;
        Wed,  2 Aug 2023 17:31:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.110])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 17C661454143;
        Wed,  2 Aug 2023 17:31:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 12/32] media: ov2680: Check for "powerdown" GPIO con-id before checking for "reset" GPIO con-id
Date:   Wed,  2 Aug 2023 19:30:26 +0200
Message-ID: <20230802173046.368434-13-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-1-hdegoede@redhat.com>
References: <20230802173046.368434-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The datasheet of the OV2680 labels the single GPIO to put the sensor in
powersaving mode as XSHUTDN aka shutdown, _not_ reset.

This is important because some boards have standardized sensor connectors
which allow connecting various sensor modules. These connectors have both
reset and powerdown signals and the powerdown signal is routed to
the OV2680's XSHUTDN pin.

On x86/ACPI multiple Bay Trail, Cherry Trail, Sky Lake and Kaby Lake models
have an OV2680 connected to the ISP2 / IPU3. On these devices the GPIOS are
not described in DT instead the GPIOs are described with an Intel specific
DSM which labels them as either powerdown or reset. Often this DSM returns
both reset and powerdown pins even though the OV2680 has only 1 such pin.

For the ov2680 driver to work on these devices it must use the GPIO with
"powerdown" as con-id, matching the XSHUTDN name from the datasheet.

As for why "powerdown" vs say "shutdown" the ACPI DSM -> con-id mapping
code is shared, so we must use standardized names and currently all of
the following sensor drivers already use "powerdown":
adv7180, gc0310, isl7998x, ov02a10, ov2659, ov5640, ov5648, ov5670,
ov5693, ov7670, ov772x, ov7740, ov8858, ov8865 and ov9650 .

Where as the hi846 driver is the lonely standout using "shutdown".

Try the "powerdown" con-id first to make things work, falling back to
"reset" to keep existing DT setups working.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index bc0ca2927370..b912ae7a63da 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -97,7 +97,7 @@ struct ov2680_dev {
 	u32				xvclk_freq;
 	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
 
-	struct gpio_desc		*reset_gpio;
+	struct gpio_desc		*pwdn_gpio;
 	struct mutex			lock; /* protect members */
 
 	bool				is_enabled;
@@ -180,19 +180,19 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 
 static void ov2680_power_up(struct ov2680_dev *sensor)
 {
-	if (!sensor->reset_gpio)
+	if (!sensor->pwdn_gpio)
 		return;
 
-	gpiod_set_value(sensor->reset_gpio, 0);
+	gpiod_set_value(sensor->pwdn_gpio, 0);
 	usleep_range(5000, 10000);
 }
 
 static void ov2680_power_down(struct ov2680_dev *sensor)
 {
-	if (!sensor->reset_gpio)
+	if (!sensor->pwdn_gpio)
 		return;
 
-	gpiod_set_value(sensor->reset_gpio, 1);
+	gpiod_set_value(sensor->pwdn_gpio, 1);
 	usleep_range(5000, 10000);
 }
 
@@ -336,7 +336,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 		return ret;
 	}
 
-	if (!sensor->reset_gpio) {
+	if (!sensor->pwdn_gpio) {
 		ret = cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01,
 				NULL);
 		if (ret != 0) {
@@ -697,16 +697,27 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
 	struct device *dev = sensor->dev;
+	struct gpio_desc *gpio;
 	int ret;
 
-	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						     GPIOD_OUT_HIGH);
-	ret = PTR_ERR_OR_ZERO(sensor->reset_gpio);
+	/*
+	 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
+	 * drivers have standardized on using "powerdown" as con-id name
+	 * for powerdown or shutdown pins. Older DTB files use "reset",
+	 * so fallback to that if there is no "powerdown" pin.
+	 */
+	gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
+	if (!gpio)
+		gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+
+	ret = PTR_ERR_OR_ZERO(gpio);
 	if (ret < 0) {
 		dev_dbg(dev, "error while getting reset gpio: %d\n", ret);
 		return ret;
 	}
 
+	sensor->pwdn_gpio = gpio;
+
 	sensor->xvclk = devm_clk_get(dev, "xvclk");
 	if (IS_ERR(sensor->xvclk)) {
 		dev_err(dev, "xvclk clock missing or invalid\n");
-- 
2.41.0

