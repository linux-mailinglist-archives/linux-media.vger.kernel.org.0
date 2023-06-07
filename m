Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C18726655
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjFGQsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjFGQsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08941FEB
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Gug4t9HQjuvjyVn+su+hfbxDl6zS9XW+zP9K7/QVUM=;
        b=T/x7p+yY5TAX7dPWZh5Fi7QiUvd8Jn3gB2UXdASOxHGPmG2OoSRconmkaE93ZYqIzo2267
        wi++IZbpp+Xtdbf+gRdXd4oT2UR1m5CRW49ehAzRQ44NnZ8eTS5ChQi4B9anKsFl33gNAW
        78N0Gu+oYIdAe5ItZHpRPdfY0t0T1Bk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-cvXWNJKVOOGjsSjbzIQKAQ-1; Wed, 07 Jun 2023 12:47:35 -0400
X-MC-Unique: cvXWNJKVOOGjsSjbzIQKAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 209DD3806704;
        Wed,  7 Jun 2023 16:47:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 08A76C1603B;
        Wed,  7 Jun 2023 16:47:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 11/28] media: ov2680: Check for "powerdown" GPIO con-id before checking for "reset" GPIO con-id
Date:   Wed,  7 Jun 2023 18:46:55 +0200
Message-Id: <20230607164712.63579-12-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Cc: Dan Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e43028b1e939..bfc65c712b84 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -95,7 +95,7 @@ struct ov2680_dev {
 	u32				xvclk_freq;
 	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
 
-	struct gpio_desc		*reset_gpio;
+	struct gpio_desc		*pwdn_gpio;
 	struct mutex			lock; /* protect members */
 
 	bool				mode_pending_changes;
@@ -179,19 +179,19 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 
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
 
@@ -342,7 +342,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 		return ret;
 	}
 
-	if (!sensor->reset_gpio) {
+	if (!sensor->pwdn_gpio) {
 		ret = cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01, NULL);
 		if (ret != 0) {
 			dev_err(sensor->dev, "sensor soft reset failed\n");
@@ -726,9 +726,17 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	struct device *dev = sensor->dev;
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
+	sensor->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
+	if (!sensor->pwdn_gpio)
+		sensor->pwdn_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+
+	ret = PTR_ERR_OR_ZERO(sensor->pwdn_gpio);
 	if (ret < 0) {
 		dev_dbg(dev, "error while getting reset gpio: %d\n", ret);
 		return ret;
-- 
2.40.1

