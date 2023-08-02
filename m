Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98FF776D5A8
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 19:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbjHBRkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 13:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjHBRjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 13:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8A42D62
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690997887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rqg+paSg6vc/6eKQqTMcweQ/l4rzYZjtdRlUpMJPC64=;
        b=PKEzVBohNwG8OfAXbo7BS628244frIvDr3YVur+9OUS9qczEa9bXD9+2GaMhoYc90tDUF8
        g+EPv1WRS+eMhMN0w6SwWhUoVvxXykFpEBoDzGk9gG+A9GoRkVG5XfwvvPd4DB27eRbDx1
        U71rBJc2zvwxgltO14QoSb+hFjtR2Hg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-41IgfPwrMO26PpJWzeVj9Q-1; Wed, 02 Aug 2023 13:31:58 -0400
X-MC-Unique: 41IgfPwrMO26PpJWzeVj9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB1138294A8;
        Wed,  2 Aug 2023 17:31:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.110])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 10664140E949;
        Wed,  2 Aug 2023 17:31:55 +0000 (UTC)
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
Subject: [PATCH v4 29/32] media: ov2680: Add bus-cfg / endpoint property verification
Date:   Wed,  2 Aug 2023 19:30:43 +0200
Message-ID: <20230802173046.368434-30-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-1-hdegoede@redhat.com>
References: <20230802173046.368434-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Verify that the number of CSI lanes and link-frequency specified
in the endpoint fwnode are correct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- New patch in v4 of this patch-set
---
 drivers/media/i2c/ov2680.c | 60 +++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 7453ea6d990e..a6adda830c2c 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -25,6 +25,7 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 #define OV2680_CHIP_ID				0x2680
@@ -1008,6 +1009,9 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 
 static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
 	struct device *dev = sensor->dev;
 	struct fwnode_handle *ep_fwnode;
 	struct gpio_desc *gpio;
@@ -1023,7 +1027,10 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
 
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &bus_cfg);
 	fwnode_handle_put(ep_fwnode);
+	if (ret)
+		return ret;
 
 	/*
 	 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
@@ -1038,15 +1045,16 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	ret = PTR_ERR_OR_ZERO(gpio);
 	if (ret < 0) {
 		dev_dbg(dev, "error while getting reset gpio: %d\n", ret);
-		return ret;
+		goto out_free_bus_cfg;
 	}
 
 	sensor->pwdn_gpio = gpio;
 
 	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
 	if (IS_ERR(sensor->xvclk)) {
-		dev_err(dev, "xvclk clock missing or invalid\n");
-		return PTR_ERR(sensor->xvclk);
+		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
+				    "xvclk clock missing or invalid\n");
+		goto out_free_bus_cfg;
 	}
 
 	/*
@@ -1060,14 +1068,17 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	 */
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 				       &rate);
-	if (ret && !sensor->xvclk)
-		return dev_err_probe(dev, ret, "invalid clock config\n");
+	if (ret && !sensor->xvclk) {
+		dev_err_probe(dev, ret, "invalid clock config\n");
+		goto out_free_bus_cfg;
+	}
 
 	if (!ret && sensor->xvclk) {
 		ret = clk_set_rate(sensor->xvclk, rate);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "failed to set clock rate\n");
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to set clock rate\n");
+			goto out_free_bus_cfg;
+		}
 	}
 
 	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
@@ -1077,10 +1088,12 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 			break;
 	}
 
-	if (i == ARRAY_SIZE(ov2680_xvclk_freqs))
-		return dev_err_probe(dev, -EINVAL,
-				     "unsupported xvclk frequency %d Hz\n",
-				     sensor->xvclk_freq);
+	if (i == ARRAY_SIZE(ov2680_xvclk_freqs)) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "unsupported xvclk frequency %d Hz\n",
+				    sensor->xvclk_freq);
+		goto out_free_bus_cfg;
+	}
 
 	sensor->pll_mult = ov2680_pll_multipliers[i];
 
@@ -1091,7 +1104,28 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 	sensor->pixel_rate = sensor->link_freq[0] * 2;
 	do_div(sensor->pixel_rate, 10);
 
-	return 0;
+	/* Verify bus cfg */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "only a 1-lane CSI2 config is supported");
+		goto out_free_bus_cfg;
+	}
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
+		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
+			break;
+
+	if (bus_cfg.nr_of_link_frequencies == 0 ||
+	    bus_cfg.nr_of_link_frequencies == i) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "supported link freq %lld not found\n",
+				    sensor->link_freq[0]);
+		goto out_free_bus_cfg;
+	}
+
+out_free_bus_cfg:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
 }
 
 static int ov2680_probe(struct i2c_client *client)
-- 
2.41.0

