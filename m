Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F7867D246
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjAZQ7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjAZQ7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:59:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724C32B637
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:59:32 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAEC1120B;
        Thu, 26 Jan 2023 17:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674752369;
        bh=KpRYswKOd08bJR44Bo1zeCMJk2TICa0x5D4UyQ0R2eA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fJYH4/xWWz7XIZoK3krasFbg9fV4z0+qQYbaacvNMHwH9kPrWf8jtP1hFm9Cwnq+s
         eivEXcEYZaZhTEqhtxSAT7F+HtbzYYqjbUhQ6/Fp74wAP6TE7o+iWfkIHfBnIPFb0A
         61PcSokqim48tUR7CUYdxSGmMTUlFjjbjC+cEgS0=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 3/9] media: i2c: ov5670: Use common clock framework
Date:   Thu, 26 Jan 2023 17:59:03 +0100
Message-Id: <20230126165909.121302-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
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
 drivers/media/i2c/ov5670.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 07a396c8ab68..52b799a7491c 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -12,6 +13,8 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
+#define OV5670_XVCLK_FREQ		19200000
+
 #define OV5670_REG_CHIP_ID		0x300a
 #define OV5670_CHIP_ID			0x005670
 
@@ -1830,6 +1833,9 @@ struct ov5670 {
 	/* Current mode */
 	const struct ov5670_mode *cur_mode;
 
+	/* xvclk input clock */
+	struct clk *xvclk;
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -2478,10 +2484,6 @@ static int ov5670_probe(struct i2c_client *client)
 	bool full_power;
 	int ret;
 
-	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
-	if (input_clk != 19200000)
-		return -EINVAL;
-
 	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
 	if (!ov5670) {
 		ret = -ENOMEM;
@@ -2489,6 +2491,22 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_print;
 	}
 
+	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
+	if (!IS_ERR_OR_NULL(ov5670->xvclk))
+		input_clk = clk_get_rate(ov5670->xvclk);
+	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
+		device_property_read_u32(&client->dev, "clock-frequency",
+					 &input_clk);
+	else
+		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
+				     "error getting clock\n");
+
+	if (input_clk != OV5670_XVCLK_FREQ) {
+		dev_err(&client->dev,
+			"Unsupported clock frequency %u\n", input_clk);
+		return -EINVAL;
+	}
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-- 
2.39.0

