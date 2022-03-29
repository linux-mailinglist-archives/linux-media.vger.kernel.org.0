Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA674EAA02
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbiC2JEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:38 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DF11F0815
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:02:55 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 420F1100015;
        Tue, 29 Mar 2022 09:02:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 3/8] media: i2c: ov5670: Probe clocks with OF
Date:   Tue, 29 Mar 2022 11:01:28 +0200
Message-Id: <20220329090133.338073-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329090133.338073-1-jacopo@jmondi.org>
References: <20220329090133.338073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for probing the main system clock using the common clock
framework and its OF bindings.

Maintain ACPI compatibility by falling back to parse 'clock-frequency'.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 721441024598..1cc312981c82 100644
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
@@ -2489,6 +2487,22 @@ static int ov5670_probe(struct i2c_client *client)
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
+	if (input_clk != 19200000)
+		return -EINVAL;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
 
-- 
2.35.1

