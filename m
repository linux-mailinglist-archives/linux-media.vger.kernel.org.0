Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E32A56137F
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 09:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbiF3Hpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 03:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbiF3Hph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 03:45:37 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9403B2B8
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:45:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ej4so25403590edb.7
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMgTO+0GXKbF2GDHku+aibaoRp7NUzUN5XoO55rghiY=;
        b=j4norZtA85g2BOXLRNrwavWs1/mJePBfPBNyDy9UFriTTcOYUrQma2J0aN1MnbBA71
         hkEOx/EZ0K0fri78rRfWG70dS5DGbV1Q5fvkdJFTxSI9tXDhndkO+3xuQ6MEGnQoazEy
         viKZ6bRQboidvZgQrLt/L3ABOOhbY3SdLwgkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMgTO+0GXKbF2GDHku+aibaoRp7NUzUN5XoO55rghiY=;
        b=6twkMH/iugMk5h7Ogsfz+BqZFGvZkZ75uKWgkBYxdnFNKH5YPMl/NN31g6nsZyBU75
         0mARqhxUFFWBXH2DTPTMlkzDHaw9pQR75m5JkQX9aD/Ehj3sxiRXqwkYxF3xgkb+x8YD
         83YBHHKFJ2WWLUBobB99CvoIRGZwq1WyO9cyrAL0yIow5RLH7EkTaX8j1sS4qascONk+
         GhBCwK0gHDKqZFmi3HLgNPjDGadF/fOBTHuoRukBz8dNJtxsvV8svFVJCUAc625qJ96G
         g3m9lwOK137i8JhUNRX1GEFP42RBHcUCWQN1eqFTo9FnRZbmyO32sFQPzHfZ90eiBGHz
         42IA==
X-Gm-Message-State: AJIora9pvkarF04tKDh0uUt9++CqeutjdbIWNJ/htoUqg/7uzU+5UsUV
        k7qb6MaZ6SCq75SA6w7KOPAKJw==
X-Google-Smtp-Source: AGRyM1vhhj9Qoso+xYV2Bazg/Et/lwaVLyV/sYrTBQSibERjoPA+gE5dkWLrEYd+RJniTFkWQXuClw==
X-Received: by 2002:a05:6402:3490:b0:435:9802:96ac with SMTP id v16-20020a056402349000b00435980296acmr9772735edc.40.1656575134769;
        Thu, 30 Jun 2022 00:45:34 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7c90d000000b0043564320274sm12594731edt.19.2022.06.30.00.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 00:45:34 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] media: ov5693: move hw cfg functions into ov5693_hwcfg
Date:   Thu, 30 Jun 2022 09:45:23 +0200
Message-Id: <20220630074525.481790-5-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
References: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move hw configuration functions into ov5693_hwcfg. This is done to
separate the code that handle the hw cfg from probe in a clean way.
Add support for ACPI-based platforms that specify the clock frequency by
using the "clock-frequency" property instead of specifying a clock
provider reference

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Sakari Ailus <sakari.ailus@iki.fi>
---
Changes since v2:
 - Fix commit body as suggested by Sakari, Jacopo
 - Add details to commit body as suggested by Jacopo
 - Move ov5693_check_hwcfg into ov5693_hwcfg
 - Fix xvclk_rate position as suggested by Jacopo
 - Use devm_clk_get_optional instead of devm_clk_get as suggested Jacopo

Changes since v3:
 - Fix commit body as suggested by Jacopo
 - Add reviewed-by tags, suggested by Jacopo, Krzysztof

 drivers/media/i2c/ov5693.c | 57 +++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d2adc5513a21..3c805a5a5181 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1339,16 +1339,48 @@ static int ov5693_get_regulators(struct ov5693_device *ov5693)
 				       ov5693->supplies);
 }
 
-static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
+static int ov5693_hwcfg(struct ov5693_device *ov5693)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(ov5693->dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct fwnode_handle *endpoint;
+	u32 xvclk_rate;
 	unsigned int i;
 	int ret;
 
+	ov5693->xvclk = devm_clk_get_optional(ov5693->dev, "xvclk");
+	if (IS_ERR(ov5693->xvclk))
+		return dev_err_probe(ov5693->dev, PTR_ERR(ov5693->xvclk),
+				     "failed to get xvclk: %ld\n",
+				     PTR_ERR(ov5693->xvclk));
+
+	if (ov5693->xvclk) {
+		xvclk_rate = clk_get_rate(ov5693->xvclk);
+	} else {
+		ret = fwnode_property_read_u32(fwnode, "clock-frequency",
+					       &xvclk_rate);
+
+		if (ret) {
+			dev_err(ov5693->dev, "can't get clock frequency");
+			return ret;
+		}
+	}
+
+	if (xvclk_rate != OV5693_XVCLK_FREQ)
+		dev_warn(ov5693->dev, "Found clk freq %u, expected %u\n",
+			 xvclk_rate, OV5693_XVCLK_FREQ);
+
+	ret = ov5693_configure_gpios(ov5693);
+	if (ret)
+		return ret;
+
+	ret = ov5693_get_regulators(ov5693);
+	if (ret)
+		return dev_err_probe(ov5693->dev, ret,
+				     "Error fetching regulators\n");
+
 	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!endpoint)
 		return -EPROBE_DEFER; /* Could be provided by cio2-bridge */
@@ -1390,7 +1422,6 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 static int ov5693_probe(struct i2c_client *client)
 {
 	struct ov5693_device *ov5693;
-	u32 xvclk_rate;
 	int ret = 0;
 
 	ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
@@ -1400,7 +1431,7 @@ static int ov5693_probe(struct i2c_client *client)
 	ov5693->client = client;
 	ov5693->dev = &client->dev;
 
-	ret = ov5693_check_hwcfg(ov5693);
+	ret = ov5693_hwcfg(ov5693);
 	if (ret)
 		return ret;
 
@@ -1408,26 +1439,6 @@ static int ov5693_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
 
-	ov5693->xvclk = devm_clk_get(&client->dev, "xvclk");
-	if (IS_ERR(ov5693->xvclk)) {
-		dev_err(&client->dev, "Error getting clock\n");
-		return PTR_ERR(ov5693->xvclk);
-	}
-
-	xvclk_rate = clk_get_rate(ov5693->xvclk);
-	if (xvclk_rate != OV5693_XVCLK_FREQ)
-		dev_warn(&client->dev, "Found clk freq %u, expected %u\n",
-			 xvclk_rate, OV5693_XVCLK_FREQ);
-
-	ret = ov5693_configure_gpios(ov5693);
-	if (ret)
-		return ret;
-
-	ret = ov5693_get_regulators(ov5693);
-	if (ret)
-		return dev_err_probe(&client->dev, ret,
-				     "Error fetching regulators\n");
-
 	ov5693->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov5693->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov5693->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.25.1

