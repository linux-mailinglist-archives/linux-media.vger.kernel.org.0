Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997EA7BB4D7
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjJFKI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjJFKI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:08:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAF3ED
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:08:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AC5C433CA;
        Fri,  6 Oct 2023 10:08:54 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/9] media: i2c: adp1653: don't reuse the same node pointer
Date:   Fri,  6 Oct 2023 12:08:43 +0200
Message-Id: <d256fa0415e10deb0f07a77d73475e063552bd17.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adp1653.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index 98ca417b8004..5ace7b5804d4 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -411,43 +411,44 @@ static int adp1653_of_init(struct i2c_client *client,
 			   struct device_node *node)
 {
 	struct adp1653_platform_data *pd;
-	struct device_node *child;
+	struct device_node *node_indicator = NULL;
+	struct device_node *node_flash;
 
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
 		goto err;
 
-	if (of_property_read_u32(child, "flash-max-microamp",
+	if (of_property_read_u32(node_flash, "flash-max-microamp",
 				 &pd->max_flash_intensity))
 		goto err;
 
 	pd->max_flash_intensity /= 1000;
 
-	if (of_property_read_u32(child, "led-max-microamp",
+	if (of_property_read_u32(node_flash, "led-max-microamp",
 				 &pd->max_torch_intensity))
 		goto err;
 
 	pd->max_torch_intensity /= 1000;
-	of_node_put(child);
 
-	child = of_get_child_by_name(node, "indicator");
-	if (!child)
-		return -EINVAL;
+	node_indicator = of_get_child_by_name(node, "indicator");
+	if (!node_indicator)
+		goto err;
 
-	if (of_property_read_u32(child, "led-max-microamp",
+	if (of_property_read_u32(node_indicator, "led-max-microamp",
 				 &pd->max_indicator_intensity))
 		goto err;
 
-	of_node_put(child);
+	of_node_put(node_flash);
+	of_node_put(node_indicator);
 
 	pd->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pd->enable_gpio)) {
@@ -458,7 +459,8 @@ static int adp1653_of_init(struct i2c_client *client,
 	return 0;
 err:
 	dev_err(&client->dev, "Required property not found\n");
-	of_node_put(child);
+	of_node_put(node_flash);
+	of_node_put(node_indicator);
 	return -EINVAL;
 }
 
-- 
2.40.1

