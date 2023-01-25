Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBE767B8B8
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 18:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236137AbjAYRhj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 12:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbjAYRhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 12:37:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22C45A360
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 09:37:35 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 346D2188E;
        Wed, 25 Jan 2023 18:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674668251;
        bh=8JU7sJ2ljljJsNbMiSjJN5c8kK/fxi4OzT+BXQnCE0I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ogG6TImT7fNLB1N2GUeXBll96dpa8Ac/TAFPxH5fxITZHfXDC39QWro3+nq5JvZqG
         v8frXZ1tv5T32X4e9I8hvPeYoOz1+HmL6sS8nx43BbvqksXvbImGezoZfkTiE8nWp8
         UWourEJNqLRUilLbLNpbzWIjo7vIybArwMRTvS8k=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v4 3/8] media: i2c: ov5670: Probe clocks with OF
Date:   Wed, 25 Jan 2023 18:37:02 +0100
Message-Id: <20230125173707.127687-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125173707.127687-1-jacopo.mondi@ideasonboard.com>
References: <20230125173707.127687-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for probing the main system clock using the common clock
framework and its OF bindings.

Maintain ACPI compatibility by falling back to parse 'clock-frequency'.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 07a396c8ab68..c8beb2bc3d0f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -2475,13 +2476,10 @@ static int ov5670_probe(struct i2c_client *client)
 	struct ov5670 *ov5670;
 	const char *err_msg;
 	u32 input_clk = 0;
+	struct clk *clk;
 	bool full_power;
 	int ret;
 
-	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
-	if (input_clk != 19200000)
-		return -EINVAL;
-
 	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
 	if (!ov5670) {
 		ret = -ENOMEM;
@@ -2489,6 +2487,25 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_print;
 	}
 
+	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
+	if (is_of_node(dev_fwnode(&client->dev))) {
+		clk = devm_clk_get(&client->dev, NULL);
+		if (IS_ERR(clk))
+			return dev_err_probe(&client->dev, PTR_ERR(clk),
+					     "error getting clock\n");
+
+		input_clk = clk_get_rate(clk);
+	} else {
+		device_property_read_u32(&client->dev, "clock-frequency",
+					 &input_clk);
+	}
+
+	if (input_clk != 19200000) {
+		dev_err(&client->dev,
+			"Unsupported clock frequency %u\n", input_clk);
+		return -EINVAL;
+	}
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-- 
2.39.0

