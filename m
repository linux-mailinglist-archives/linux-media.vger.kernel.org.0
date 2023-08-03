Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7592876E482
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbjHCJfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbjHCJfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6459C35A1
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G4YTzOo0M3PotVSepMhJjFw+ylIFtmOwiPYC6E5PT1Y=;
        b=eoM35BBtM1PX5IhwCeCIb+flUaqxC0cWGMOHrFb1UbkBGn0gYtubwzUFvbKEpA5JXdXN7X
        GJCo+cW+2IyCae6i15CgLxPQGE2xXH5w0/iJxM4+rl9jixMna2TweQhltVfJASkfRZY/49
        aQF8j1JIgG4UL5CX9rFImVPrtyQew1c=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-UE2ToU79N_-xcQr1_G7iqQ-1; Thu, 03 Aug 2023 05:34:16 -0400
X-MC-Unique: UE2ToU79N_-xcQr1_G7iqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E1B3803508;
        Thu,  3 Aug 2023 09:34:15 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 88C5C2166B25;
        Thu,  3 Aug 2023 09:34:14 +0000 (UTC)
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
Subject: [PATCH v5 15/32] media: ov2680: Add support for 19.2 MHz clock
Date:   Thu,  3 Aug 2023 11:33:30 +0200
Message-ID: <20230803093348.15679-16-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most x86/ACPI boards use the ov2680 with a 19.2 MHz xvclk,
rather then the expected 24MHz, add support for this.

Compensate for the lower clk by setting a higher PLL multiplier
of 69 when using 19.2 MHz vs the default multiplier of 55 for
a 24MHz xvclk.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 41 +++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 42be7b094d5d..a8c257f3bcd6 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -27,14 +27,13 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
-#define OV2680_XVCLK_VALUE			24000000
-
 #define OV2680_CHIP_ID				0x2680
 
 #define OV2680_REG_STREAM_CTRL			CCI_REG8(0x0100)
 #define OV2680_REG_SOFT_RESET			CCI_REG8(0x0103)
 
 #define OV2680_REG_CHIP_ID			CCI_REG16(0x300a)
+#define OV2680_REG_PLL_MULTIPLIER		CCI_REG16(0x3081)
 
 #define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
 #define OV2680_REG_R_MANUAL			CCI_REG8(0x3503)
@@ -69,6 +68,21 @@ static const char * const ov2680_supply_name[] = {
 
 #define OV2680_NUM_SUPPLIES ARRAY_SIZE(ov2680_supply_name)
 
+enum {
+	OV2680_19_2_MHZ,
+	OV2680_24_MHZ,
+};
+
+static const unsigned long ov2680_xvclk_freqs[] = {
+	[OV2680_19_2_MHZ] = 19200000,
+	[OV2680_24_MHZ] = 24000000,
+};
+
+static const u8 ov2680_pll_multipliers[] = {
+	[OV2680_19_2_MHZ] = 69,
+	[OV2680_24_MHZ] = 55,
+};
+
 struct ov2680_mode_info {
 	const char *name;
 	enum ov2680_mode_id id;
@@ -95,6 +109,7 @@ struct ov2680_dev {
 	struct media_pad		pad;
 	struct clk			*xvclk;
 	u32				xvclk_freq;
+	u8				pll_mult;
 	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
 
 	struct gpio_desc		*pwdn_gpio;
@@ -284,6 +299,11 @@ static int ov2680_stream_enable(struct ov2680_dev *sensor)
 {
 	int ret;
 
+	ret = cci_write(sensor->regmap, OV2680_REG_PLL_MULTIPLIER,
+			sensor->pll_mult, NULL);
+	if (ret < 0)
+		return ret;
+
 	ret = regmap_multi_reg_write(sensor->regmap,
 				     ov2680_mode_init_data.reg_data,
 				     ov2680_mode_init_data.reg_data_size);
@@ -699,7 +719,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	struct device *dev = sensor->dev;
 	struct gpio_desc *gpio;
 	unsigned int rate = 0;
-	int ret;
+	int i, ret;
 
 	/*
 	 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
@@ -747,12 +767,19 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	}
 
 	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
-	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
-		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
-			sensor->xvclk_freq, OV2680_XVCLK_VALUE);
-		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(ov2680_xvclk_freqs); i++) {
+		if (sensor->xvclk_freq == ov2680_xvclk_freqs[i])
+			break;
 	}
 
+	if (i == ARRAY_SIZE(ov2680_xvclk_freqs))
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported xvclk frequency %d Hz\n",
+				     sensor->xvclk_freq);
+
+	sensor->pll_mult = ov2680_pll_multipliers[i];
+
 	return 0;
 }
 
-- 
2.41.0

