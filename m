Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A8D7402C5
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbjF0R6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjF0R6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEFA358A
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=itt6oqukh1+EnQXouEStoimfB0wBOa+JiwN4KAGdN5M=;
        b=SfLVe75Hfuc2ZTuqujE1DUn029YD3C+6Ia7YxZ4O2afmMoaJhWX8iW+eGFgHhH8laVFdCU
        cZE6EGwUCSekaZrk4DmPX7W+3rSX3LZgT2Rt+ow9t7IwT4Kn8Hb5vrRdnBByQrXUmT+b+q
        n7UDJfRxy+SpfGkaU6p2MhPw7Hkcj2c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-eUrcKxeOMDyI3gYM2Qdk0g-1; Tue, 27 Jun 2023 13:57:06 -0400
X-MC-Unique: eUrcKxeOMDyI3gYM2Qdk0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673F33C0FC9E;
        Tue, 27 Jun 2023 17:57:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C1C91200B677;
        Tue, 27 Jun 2023 17:57:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 12/12] [RFC] media: dw9719: Drop hack to enable "vsio" regulator
Date:   Tue, 27 Jun 2023 19:56:42 +0200
Message-ID: <20230627175643.114778-13-hdegoede@redhat.com>
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the hack where the driver is getting + enabling a "vsio" regulator
even though the dw9719 does not have a vsio pin / power-plane at all.

Now that drivers/media/common/intel-cio2-bridge.c adds device-link
making the VCM a consumer of the sensor this hack is no longer necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note to reviewers, the dw9719 driver is not upstream yet (I plan to
resubmit it soon with this squashed in). This patch is only included
in this patch-set to illustrate how the VCM -> sensor device-link
avoids the need for hacks like this.
---
 drivers/media/i2c/dw9719.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 94b76b4b2463..5fe01a125c1a 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -35,14 +35,12 @@
 #define DW9719_DEFAULT_VCM_FREQ		0x60
 #define DW9719_ENABLE_RINGING		0x02
 
-#define NUM_REGULATORS			2
-
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
 struct dw9719_device {
 	struct device *dev;
 	struct i2c_client *client;
-	struct regulator_bulk_data regulators[NUM_REGULATORS];
+	struct regulator *regulator;
 	struct v4l2_subdev sd;
 
 	struct dw9719_v4l2_ctrls {
@@ -131,14 +129,14 @@ static int dw9719_detect(struct dw9719_device *dw9719)
 
 static int dw9719_power_down(struct dw9719_device *dw9719)
 {
-	return regulator_bulk_disable(NUM_REGULATORS, dw9719->regulators);
+	return regulator_disable(dw9719->regulator);
 }
 
 static int dw9719_power_up(struct dw9719_device *dw9719)
 {
 	int ret;
 
-	ret = regulator_bulk_enable(NUM_REGULATORS, dw9719->regulators);
+	ret = regulator_enable(dw9719->regulator);
 	if (ret)
 		return ret;
 
@@ -315,21 +313,10 @@ static int dw9719_probe(struct i2c_client *client)
 	dw9719->client = client;
 	dw9719->dev = &client->dev;
 
-	dw9719->regulators[0].supply = "vdd";
-	/*
-	 * The DW9719 has only the 1 VDD voltage input, but some PMICs such as
-	 * the TPS68470 PMIC have I2C passthrough capability, to disconnect the
-	 * sensor's I2C pins from the I2C bus when the sensors VSIO (Sensor-IO)
-	 * is off, because some sensors then short these pins to ground;
-	 * and the DW9719 might sit behind this passthrough, this it needs to
-	 * enable VSIO as that will also enable the I2C passthrough.
-	 */
-	dw9719->regulators[1].supply = "vsio";
-
-	ret = devm_regulator_bulk_get(&client->dev, NUM_REGULATORS,
-				      dw9719->regulators);
-	if (ret)
-		return dev_err_probe(&client->dev, ret, "getting regulators\n");
+	dw9719->regulator = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(dw9719->regulator))
+		return dev_err_probe(&client->dev, PTR_ERR(dw9719->regulator),
+				     "getting regulator\n");
 
 	v4l2_i2c_subdev_init(&dw9719->sd, client, &dw9719_ops);
 	dw9719->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-- 
2.41.0

