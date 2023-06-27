Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B5773FCA8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjF0NUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjF0NUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C722728
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=494+hYCkSRWouwu3cdry5hPSn6fPQTx2zVU0xTwSDZg=;
        b=fe5grEeeRmxeCq8Bnh6kP1lDuHml98AdURK208xB7gmJfGjGtGXd4EoAHFhRf4hb7yoUKL
        Lfr31UO91BBjwfvJyH92sKF0uiJGeAQqX0Sx+9DT81tuhllI107ZshnI0W+SsxjPk1vBfI
        dljfifO14WRLGxZxZvxAsuNRKz01hm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-MdP8EmkdNmG7-JqFIhqKXg-1; Tue, 27 Jun 2023 09:18:52 -0400
X-MC-Unique: MdP8EmkdNmG7-JqFIhqKXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 826458C8118;
        Tue, 27 Jun 2023 13:18:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 364AB401061;
        Tue, 27 Jun 2023 13:18:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 10/29] media: ov2680: Store dev instead of i2c_client in ov2680_dev
Date:   Tue, 27 Jun 2023 15:18:11 +0200
Message-ID: <20230627131830.54601-11-hdegoede@redhat.com>
In-Reply-To: <20230627131830.54601-1-hdegoede@redhat.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the cci_* register access helpers are used access to
the i2c_client after probe() is no longer necessary.

Directly store a struct device *dev pointing to &client->dev inside
ov2680_dev to make the code simpler.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use to_i2c_client(sensor->dev) in ov2680_v4l2_register()
---
 drivers/media/i2c/ov2680.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index fb25ba446d52..824e2962e7d5 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -87,7 +87,7 @@ struct ov2680_ctrls {
 };
 
 struct ov2680_dev {
-	struct i2c_client		*i2c_client;
+	struct device			*dev;
 	struct regmap			*regmap;
 	struct v4l2_subdev		sd;
 
@@ -172,11 +172,6 @@ static struct ov2680_dev *to_ov2680_dev(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov2680_dev, sd);
 }
 
-static struct device *ov2680_to_dev(struct ov2680_dev *sensor)
-{
-	return &sensor->i2c_client->dev;
-}
-
 static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 {
 	return &container_of(ctrl->handler, struct ov2680_dev,
@@ -344,7 +339,6 @@ static int ov2680_power_off(struct ov2680_dev *sensor)
 
 static int ov2680_power_on(struct ov2680_dev *sensor)
 {
-	struct device *dev = ov2680_to_dev(sensor);
 	int ret;
 
 	if (sensor->is_enabled)
@@ -352,7 +346,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 
 	ret = regulator_bulk_enable(OV2680_NUM_SUPPLIES, sensor->supplies);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		dev_err(sensor->dev, "failed to enable regulators: %d\n", ret);
 		return ret;
 	}
 
@@ -360,7 +354,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 		ret = cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01,
 				NULL);
 		if (ret != 0) {
-			dev_err(dev, "sensor soft reset failed\n");
+			dev_err(sensor->dev, "sensor soft reset failed\n");
 			goto err_disable_regulators;
 		}
 		usleep_range(1000, 2000);
@@ -656,13 +650,13 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
 
 static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 {
+	struct i2c_client *client = to_i2c_client(sensor->dev);
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
 	int ret = 0;
 
-	v4l2_i2c_subdev_init(&sensor->sd, sensor->i2c_client,
-			     &ov2680_subdev_ops);
+	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
 
 	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -719,14 +713,12 @@ static int ov2680_get_regulators(struct ov2680_dev *sensor)
 	for (i = 0; i < OV2680_NUM_SUPPLIES; i++)
 		sensor->supplies[i].supply = ov2680_supply_name[i];
 
-	return devm_regulator_bulk_get(&sensor->i2c_client->dev,
-				       OV2680_NUM_SUPPLIES,
-				       sensor->supplies);
+	return devm_regulator_bulk_get(sensor->dev,
+				       OV2680_NUM_SUPPLIES, sensor->supplies);
 }
 
 static int ov2680_check_id(struct ov2680_dev *sensor)
 {
-	struct device *dev = ov2680_to_dev(sensor);
 	u64 chip_id;
 	int ret;
 
@@ -734,12 +726,12 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 
 	ret = cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, NULL);
 	if (ret < 0) {
-		dev_err(dev, "failed to read chip id\n");
+		dev_err(sensor->dev, "failed to read chip id\n");
 		return -ENODEV;
 	}
 
 	if (chip_id != OV2680_CHIP_ID) {
-		dev_err(dev, "chip id: 0x%04llx does not match expected 0x%04x\n",
+		dev_err(sensor->dev, "chip id: 0x%04llx does not match expected 0x%04x\n",
 			chip_id, OV2680_CHIP_ID);
 		return -ENODEV;
 	}
@@ -749,7 +741,7 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 
 static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
-	struct device *dev = ov2680_to_dev(sensor);
+	struct device *dev = sensor->dev;
 	int ret;
 
 	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
@@ -786,7 +778,7 @@ static int ov2680_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
-	sensor->i2c_client = client;
+	sensor->dev = &client->dev;
 
 	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(sensor->regmap))
-- 
2.41.0

