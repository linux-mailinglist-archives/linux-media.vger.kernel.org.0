Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EC54D890E
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242998AbiCNQ2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243005AbiCNQ2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:28:45 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C16AB7DF
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 09:27:33 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6F8D0240007;
        Mon, 14 Mar 2022 16:27:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v2 3/8] media: i2c: ov5670: Probe clocks with OF
Date:   Mon, 14 Mar 2022 17:27:09 +0100
Message-Id: <20220314162714.153970-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314162714.153970-1-jacopo@jmondi.org>
References: <20220314162714.153970-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for probing the main system clock using the common clock
framework and its OF bindings.

Maintain ACPI compatibility by falling back to parse 'clock-frequency'
if the no clock device reference is available.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 721441024598..25d792794fc7 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -1819,6 +1820,8 @@ struct ov5670 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
+	struct clk *clk;
+
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
@@ -2478,10 +2481,6 @@ static int ov5670_probe(struct i2c_client *client)
 	bool full_power;
 	int ret;
 
-	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
-	if (input_clk != 19200000)
-		return -EINVAL;
-
 	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
 	if (!ov5670) {
 		ret = -ENOMEM;
@@ -2489,6 +2488,20 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_print;
 	}
 
+	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
+	ov5670->clk = devm_clk_get_optional(&client->dev, NULL);
+	if (IS_ERR(ov5670->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(ov5670->clk),
+				     "error getting clock\n");
+
+	if (ov5670->clk)
+		input_clk = clk_get_rate(ov5670->clk);
+	else
+		device_property_read_u32(&client->dev, "clock-frequency",
+					 &input_clk);
+	if (input_clk != 19200000)
+		return -EINVAL;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-- 
2.35.1

