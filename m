Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5EC76E4A1
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbjHCJhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbjHCJgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61074213F
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055283;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UeJfKrSWTX8+/jDmovl06WfeG5HYQ4aXeIF1EDNjzoQ=;
        b=JJH2N0ITOHIDQ7heuXB2iHoM6RAkk5Sr6tMB1oRnoYOMcHxLuceIVkt7FgsTaLz8habZp7
        rdOCkg3DmzcLnL9yXmeg4iyDPFCE3VCktQMrmnkqhyWp20+MraFjlFoQ0o64TcHsqy9ZY6
        ZLju/zgo8hYlVR73DgM1RNFF+CFL/A8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-zyx67YwBPbulzoV0Yi_KJw-1; Thu, 03 Aug 2023 05:34:39 -0400
X-MC-Unique: zyx67YwBPbulzoV0Yi_KJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C64D93C01BAD;
        Thu,  3 Aug 2023 09:34:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 622AC2166B25;
        Thu,  3 Aug 2023 09:34:37 +0000 (UTC)
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
Subject: [PATCH v5 29/32] media: ov2680: Add bus-cfg / endpoint property verification
Date:   Thu,  3 Aug 2023 11:33:44 +0200
Message-ID: <20230803093348.15679-30-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
index 83ec034b5307..72bab0ff8a36 100644
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

