Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84133743A68
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbjF3LIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjF3LIy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F963A8F
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uBIo7d9P1njIbz4EMxBV8T+jr+Ihzq6cl5EOJBHAZlI=;
        b=Qh+3XWkAdimpZV8prqTNrDTbWSPZtp8M/FQF8W0E478hplkIUDuNdrOiV1cAOKjjNp0RBO
        aKrxQZNABhgaWgrZYR+dKkdX5thaIDjdLfKYiFAflGYJg9J3DYIP10JMNqRuR017vhMPsx
        IzfzX4aluLzLMn04PEKwt5l15fhSBgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-5ecS9kMnNlGkhHDdWcfQ4A-1; Fri, 30 Jun 2023 07:07:53 -0400
X-MC-Unique: 5ecS9kMnNlGkhHDdWcfQ4A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC376805951;
        Fri, 30 Jun 2023 11:07:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 75B4C492B02;
        Fri, 30 Jun 2023 11:07:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 15/15] [RFC] media: dw9719: Drop hack to enable "vsio" regulator
Date:   Fri, 30 Jun 2023 13:06:43 +0200
Message-ID: <20230630110643.209761-16-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-1-hdegoede@redhat.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the hack where the driver is getting + enabling a "vsio" regulator
even though the dw9719 does not have a vsio pin / power-plane at all.

Now that drivers/media/pci/intel/ipu-bridge.c adds a device-link
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

