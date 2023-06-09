Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029D17295DC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241353AbjFIJu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241344AbjFIJuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D04728C
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:43:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6431C60E94
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 09:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63817C433EF;
        Fri,  9 Jun 2023 09:43:16 +0000 (UTC)
Message-ID: <da55b552-08ce-6bbe-c70b-eda6f53727f0@xs4all.nl>
Date:   Fri, 9 Jun 2023 11:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: i2c: adp1653: don't reuse the same node pointer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The child device_node pointer was used for two different childs.
This confused smatch, causing this warning:

drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?

Use two different pointers, one for each child node, and add separate
goto labels for each node as well. This also improves error logging
since it will now state for which node the property was missing.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index 98ca417b8004..04ec465aaa94 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -411,43 +411,43 @@ static int adp1653_of_init(struct i2c_client *client,
 			   struct device_node *node)
 {
 	struct adp1653_platform_data *pd;
-	struct device_node *child;
+	struct device_node *node_flash, *node_indicator;

 	pd = devm_kzalloc(&client->dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
 		return -ENOMEM;
 	flash->platform_data = pd;

-	child = of_get_child_by_name(node, "flash");
-	if (!child)
+	node_flash = of_get_child_by_name(node, "flash");
+	if (!node_flash)
 		return -EINVAL;

-	if (of_property_read_u32(child, "flash-timeout-us",
+	if (of_property_read_u32(node_flash, "flash-timeout-us",
 				 &pd->max_flash_timeout))
-		goto err;
+		goto err_flash;

-	if (of_property_read_u32(child, "flash-max-microamp",
+	if (of_property_read_u32(node_flash, "flash-max-microamp",
 				 &pd->max_flash_intensity))
-		goto err;
+		goto err_flash;

 	pd->max_flash_intensity /= 1000;

-	if (of_property_read_u32(child, "led-max-microamp",
+	if (of_property_read_u32(node_flash, "led-max-microamp",
 				 &pd->max_torch_intensity))
-		goto err;
+		goto err_flash;

 	pd->max_torch_intensity /= 1000;
-	of_node_put(child);
+	of_node_put(node_flash);

-	child = of_get_child_by_name(node, "indicator");
-	if (!child)
+	node_indicator = of_get_child_by_name(node, "indicator");
+	if (!node_indicator)
 		return -EINVAL;

-	if (of_property_read_u32(child, "led-max-microamp",
+	if (of_property_read_u32(node_indicator, "led-max-microamp",
 				 &pd->max_indicator_intensity))
-		goto err;
+		goto err_indicator;

-	of_node_put(child);
+	of_node_put(node_indicator);

 	pd->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pd->enable_gpio)) {
@@ -456,9 +456,13 @@ static int adp1653_of_init(struct i2c_client *client,
 	}

 	return 0;
-err:
-	dev_err(&client->dev, "Required property not found\n");
-	of_node_put(child);
+err_flash:
+	dev_err(&client->dev, "Required flash property not found\n");
+	of_node_put(node_flash);
+	return -EINVAL;
+err_indicator:
+	dev_err(&client->dev, "Required indicator property not found\n");
+	of_node_put(node_indicator);
 	return -EINVAL;
 }

