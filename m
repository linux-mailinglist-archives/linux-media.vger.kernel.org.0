Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFF3711700
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 21:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243090AbjEYTMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 15:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243052AbjEYTMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 15:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B9A1FC3
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 12:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685041275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gTSFtC+RK1pm61jSolafB1MZjphTteYP6DW7AFBoYHw=;
        b=X1evm4yNdK1CUir3hjpzxeRjeErn6gI+jyv+JiFK2FjlL3K59TtiloPdCMttKAvigeISY1
        99jIQKAUmXvCKCRJp2anBvapEihPS3ADazknIKmWnLqlKUK4OWyMvPQ4WXjhzErzSyv91E
        pJRh9cHCQ3qlUUA8npy4M2TqtxIeeKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-YXGW7paOOoqjCdiZUTh8Nw-1; Thu, 25 May 2023 15:01:11 -0400
X-MC-Unique: YXGW7paOOoqjCdiZUTh8Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9A31C08DB1;
        Thu, 25 May 2023 19:01:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 83DD140C1258;
        Thu, 25 May 2023 19:01:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 3/5] media: atomisp: gc0310: Turn into standard v4l2 sensor driver
Date:   Thu, 25 May 2023 21:00:58 +0200
Message-Id: <20230525190100.130010-4-hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
References: <20230525190100.130010-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch the atomisp-gc0310 driver to v4l2 async device registration.

After this change this driver no longer depends on
atomisp_gmin_platform and all atomisp-isms are gone.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop v4l2_get_acpi_sensor_info() call in this patch
- Wait for fwnode graph endpoint so that the bridge's ACPI
  parsing gets a chance to register the GPIO mappings
  before probing the sensor
- Switch to endpoint matching
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 29 ++++++++++++-------
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  2 ++
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 1829ba419e3e..9a11793f34f7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -29,8 +29,6 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 
-#include "../include/linux/atomisp_gmin_platform.h"
-
 #define GC0310_NATIVE_WIDTH			656
 #define GC0310_NATIVE_HEIGHT			496
 
@@ -85,6 +83,7 @@ struct gc0310_device {
 	struct mutex input_lock;
 	bool is_streaming;
 
+	struct fwnode_handle *ep_fwnode;
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
 
@@ -596,11 +595,11 @@ static void gc0310_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "gc0310_remove...\n");
 
-	atomisp_unregister_subdev(sd);
-	v4l2_device_unregister_subdev(sd);
+	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
 	mutex_destroy(&dev->input_lock);
+	fwnode_handle_put(dev->ep_fwnode);
 	pm_runtime_disable(&client->dev);
 }
 
@@ -613,19 +612,27 @@ static int gc0310_probe(struct i2c_client *client)
 	if (!dev)
 		return -ENOMEM;
 
-	ret = v4l2_get_acpi_sensor_info(&client->dev, NULL);
-	if (ret)
-		return ret;
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
+	dev->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	if (!dev->ep_fwnode)
+		return dev_err_probe(&client->dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
 
 	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(dev->reset))
+	if (IS_ERR(dev->reset)) {
+		fwnode_handle_put(dev->ep_fwnode);
 		return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
 				     "getting reset GPIO\n");
+	}
 
 	dev->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(dev->powerdown))
+	if (IS_ERR(dev->powerdown)) {
+		fwnode_handle_put(dev->ep_fwnode);
 		return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown),
 				     "getting powerdown GPIO\n");
+	}
 
 	mutex_init(&dev->input_lock);
 	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
@@ -645,6 +652,7 @@ static int gc0310_probe(struct i2c_client *client)
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	dev->sd.fwnode = dev->ep_fwnode;
 
 	ret = gc0310_init_controls(dev);
 	if (ret) {
@@ -658,8 +666,7 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = atomisp_register_sensor_no_gmin(&dev->sd, 1, ATOMISP_INPUT_FORMAT_RAW_8,
-					      atomisp_bayer_order_grbg);
+	ret = v4l2_async_register_subdev_sensor(&dev->sd);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index d7d9cac2c3b8..5268a0d25051 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -89,6 +89,8 @@ static const guid_t atomisp_dsm_guid =
  * power-management and with v4l2-async probing.
  */
 static const struct atomisp_csi2_sensor_config supported_sensors[] = {
+	/* GalaxyCore GC0310 */
+	{ "INT0310", 1 },
 	/* Omnivision OV2680 */
 	{ "OVTI2680", 1 },
 };
-- 
2.40.1

