Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7D2726657
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjFGQsd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjFGQsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BE71FF0
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oVrKQp7K908viwJh/i951uvnlDnBWEgQhPgx8oOx0+8=;
        b=UBKJhOqOqLhdkYWm3F8cB6nHJOm3BW8AsjtiZIE/NejO44/n7SRtnrFimoWnJegwPxP5Ww
        Cy5KThEeReV5aZvJlKCfkOmfBtJ61Vj0lPjHTfXsL7q2Ty7s2eCIhXefDCP+jcP7o0xkc8
        akht7TyYyUxQWcs/Ir36YnI+pWJ4ea4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-AZYUeqtAPJC3PqAHtxobvA-1; Wed, 07 Jun 2023 12:47:40 -0400
X-MC-Unique: AZYUeqtAPJC3PqAHtxobvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB5A1C08DA8;
        Wed,  7 Jun 2023 16:47:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45FC5C1603B;
        Wed,  7 Jun 2023 16:47:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 15/28] media: ov2680: Add support for 19.2 MHz clock
Date:   Wed,  7 Jun 2023 18:46:59 +0200
Message-Id: <20230607164712.63579-16-hdegoede@redhat.com>
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

Most x86/ACPI boards use the ov2680 with a 19.2 MHz xvclk,
rather then the expected 24MHz, add support for this.

Compensate for the lower clk by setting a higher PLL multiplier
of 69 when using 19.2 MHz vs the default multiplier of 55 for
a 24MHz xvclk.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 81d59206f901..b3a792b28467 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -26,14 +26,13 @@
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
@@ -68,6 +67,21 @@ static const char * const ov2680_supply_name[] = {
 
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
@@ -94,6 +108,7 @@ struct ov2680_dev {
 	struct media_pad		pad;
 	struct clk			*xvclk;
 	u32				xvclk_freq;
+	u8				pll_mult;
 	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
 
 	struct gpio_desc		*pwdn_gpio;
@@ -278,6 +293,7 @@ static int ov2680_stream_enable(struct ov2680_dev *sensor)
 {
 	int ret = 0;
 
+	cci_write(sensor->regmap, OV2680_REG_PLL_MULTIPLIER, sensor->pll_mult, &ret);
 	cci_multi_reg_write(sensor->regmap, ov2680_mode_init_data.reg_data,
 			    ov2680_mode_init_data.reg_data_size, &ret);
 	cci_multi_reg_write(sensor->regmap, sensor->current_mode->reg_data,
@@ -677,7 +693,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
 	struct device *dev = sensor->dev;
 	unsigned int rate = 0;
-	int ret;
+	int i, ret;
 
 	/*
 	 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
@@ -720,12 +736,19 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	}
 
 	sensor->xvclk_freq = rate ? rate : clk_get_rate(sensor->xvclk);
-	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
-		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
-			sensor->xvclk_freq, OV2680_XVCLK_VALUE);
+
+	for (i = 0; i < ARRAY_SIZE(ov2680_xvclk_freqs); i++) {
+		if (sensor->xvclk_freq == ov2680_xvclk_freqs[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ov2680_xvclk_freqs)) {
+		dev_err(dev, "unsupported xvclk frequency %d Hz\n", sensor->xvclk_freq);
 		return -EINVAL;
 	}
 
+	sensor->pll_mult = ov2680_pll_multipliers[i];
+
 	return 0;
 }
 
-- 
2.40.1

