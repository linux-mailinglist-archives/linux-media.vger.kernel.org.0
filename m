Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34E2731B09
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344998AbjFOOPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344982AbjFOOPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB8C2954
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UfdIhF3156hebSukc1HASdlOhHkU2+SJTzRsjJ9qBmE=;
        b=RLjqkolwS6K4zgaXiD3JVW1yBNmvU1d/5AGEoZz6OyOudjlgy8kaE+RaQp7JzSDupuZDBt
        GMI2W1GgcN2IiiFqRV8K1iQgK/Q5y1XT7RQpSIFHpXAcn0CSgszG2qjH2gtqMmIi27PcDL
        diEjsNUi2uBUN8MBeNRVUbBrjCaH4zs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-xeL4dxdkNcKSZfVGwFnhbg-1; Thu, 15 Jun 2023 10:14:34 -0400
X-MC-Unique: xeL4dxdkNcKSZfVGwFnhbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C03E5832CA3;
        Thu, 15 Jun 2023 14:14:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AD0D9400F0B;
        Thu, 15 Jun 2023 14:14:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 14/28] media: ov2680: Add support for more clk setups
Date:   Thu, 15 Jun 2023 16:13:35 +0200
Message-Id: <20230615141349.172363-15-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On ACPI systems the following 2 scenarios are possible:

1. The xvclk is fully controlled by ACPI powermanagement, so there
   is no "xvclk" for the driver to get (since it is abstracted away).
   In this case there will be a "clock-frequency" device property
   to tell the driver the xvclk rate.

2. There is a xvclk modelled in the clk framework for the driver,
   but the clk-generator may not be set to the right frequency
   yet. In this case there will also be a "clock-frequency" device
   property and the driver is expected to set the rate of the xvclk
   through this frequency through the clk framework.

Handle both these scenarios by switching to devm_clk_get_optional()
and checking for a "clock-frequency" device property.

This is modelled after how the same issue was fixed for the ov8865 in
commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b7c23286700e..a6a83f0e53f3 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
 	struct device *dev = sensor->dev;
 	struct gpio_desc *gpio;
+	unsigned int rate = 0;
 	int ret;
 
 	/*
@@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 
 	sensor->pwdn_gpio = gpio;
 
-	sensor->xvclk = devm_clk_get(dev, "xvclk");
+	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
 	if (IS_ERR(sensor->xvclk)) {
 		dev_err(dev, "xvclk clock missing or invalid\n");
 		return PTR_ERR(sensor->xvclk);
 	}
 
-	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
+	/*
+	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
+	 * ACPI... but we also need to support the weird IPU3 case which will
+	 * have an external clock AND a clock-frequency property. Check for the
+	 * clock-frequency property and if found, set that rate if we managed
+	 * to acquire a clock. This should cover the ACPI case. If the system
+	 * uses devicetree then the configured rate should already be set, so
+	 * we can just read it.
+	 */
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &rate);
+	if (ret && !sensor->xvclk)
+		return dev_err_probe(dev, ret, "invalid clock config\n");
+
+	if (!ret && sensor->xvclk) {
+		ret = clk_set_rate(sensor->xvclk, rate);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to set clock rate\n");
+	}
+
+	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
 	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
 		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
 			sensor->xvclk_freq, OV2680_XVCLK_VALUE);
-- 
2.40.1

