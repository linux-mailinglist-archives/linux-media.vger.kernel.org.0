Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5BAE923D2
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfHSMuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:50:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47456 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727529AbfHSMuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:50:19 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 03BB0634C8A;
        Mon, 19 Aug 2019 15:49:45 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 3/6] smiapp: Error handling cleanups and fixes
Date:   Mon, 19 Aug 2019 15:47:25 +0300
Message-Id: <20190819124728.10511-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Probe error handling cleanups and fixes:

- Move mutex initialisation at a later time for easier error handling.

- Issue destroy_mutex on the sensor mutex on probe failure and driver
  remove,

- Remove smiapp_cleanup and add its contents in probe / remove on right
  locations.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 48 ++++++++++++++------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 9adf8e034e7d..c9d0416f9b03 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2579,16 +2579,6 @@ static int smiapp_registered(struct v4l2_subdev *subdev)
 	return rval;
 }
 
-static void smiapp_cleanup(struct smiapp_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-
-	device_remove_file(&client->dev, &dev_attr_nvm);
-	device_remove_file(&client->dev, &dev_attr_ident);
-
-	smiapp_free_controls(sensor);
-}
-
 static void smiapp_create_subdev(struct smiapp_sensor *sensor,
 				 struct smiapp_subdev *ssd, const char *name,
 				 unsigned short num_pads)
@@ -2862,7 +2852,6 @@ static int smiapp_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	sensor->hwcfg = hwcfg;
-	mutex_init(&sensor->mutex);
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
 	v4l2_i2c_subdev_init(&sensor->src->sd, client, &smiapp_ops);
@@ -2922,9 +2911,11 @@ static int smiapp_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->xshutdown))
 		return PTR_ERR(sensor->xshutdown);
 
+	mutex_init(&sensor->mutex);
+
 	rval = smiapp_power_on(&client->dev);
 	if (rval < 0)
-		return rval;
+		goto out_mutex_destroy;
 
 	rval = smiapp_identify_module(sensor);
 	if (rval) {
@@ -3011,13 +3002,13 @@ static int smiapp_probe(struct i2c_client *client)
 				sensor->hwcfg->nvm_size, GFP_KERNEL);
 		if (sensor->nvm == NULL) {
 			rval = -ENOMEM;
-			goto out_cleanup;
+			goto out_remove_ident_attr;
 		}
 
 		if (device_create_file(&client->dev, &dev_attr_nvm) != 0) {
 			dev_err(&client->dev, "sysfs nvm entry failed\n");
 			rval = -EBUSY;
-			goto out_cleanup;
+			goto out_remove_ident_attr;
 		}
 	}
 
@@ -3067,22 +3058,22 @@ static int smiapp_probe(struct i2c_client *client)
 
 	rval = smiapp_init_controls(sensor);
 	if (rval < 0)
-		goto out_cleanup;
+		goto out_free_controls;
 
 	rval = smiapp_call_quirk(sensor, init);
 	if (rval)
-		goto out_cleanup;
+		goto out_free_controls;
 
 	rval = smiapp_get_mbus_formats(sensor);
 	if (rval) {
 		rval = -ENODEV;
-		goto out_cleanup;
+		goto out_free_controls;
 	}
 
 	rval = smiapp_init_late_controls(sensor);
 	if (rval) {
 		rval = -ENODEV;
-		goto out_cleanup;
+		goto out_free_controls;
 	}
 
 	mutex_lock(&sensor->mutex);
@@ -3090,7 +3081,7 @@ static int smiapp_probe(struct i2c_client *client)
 	mutex_unlock(&sensor->mutex);
 	if (rval) {
 		dev_err(&client->dev, "update mode failed\n");
-		goto out_cleanup;
+		goto out_free_controls;
 	}
 
 	sensor->streaming = false;
@@ -3117,12 +3108,19 @@ static int smiapp_probe(struct i2c_client *client)
 out_media_entity_cleanup:
 	media_entity_cleanup(&sensor->src->sd.entity);
 
-out_cleanup:
-	smiapp_cleanup(sensor);
+out_remove_ident_attr:
+	device_remove_file(&client->dev, &dev_attr_ident);
+
+out_free_controls:
+	device_remove_file(&client->dev, &dev_attr_nvm);
+	smiapp_free_controls(sensor);
 
 out_power_off:
 	smiapp_power_off(&client->dev);
 
+out_mutex_destroy:
+	mutex_destroy(&sensor->mutex);
+
 	return rval;
 }
 
@@ -3143,7 +3141,13 @@ static int smiapp_remove(struct i2c_client *client)
 		v4l2_device_unregister_subdev(&sensor->ssds[i].sd);
 		media_entity_cleanup(&sensor->ssds[i].sd.entity);
 	}
-	smiapp_cleanup(sensor);
+
+	device_remove_file(&client->dev, &dev_attr_ident);
+	device_remove_file(&client->dev, &dev_attr_nvm);
+
+	smiapp_free_controls(sensor);
+
+	mutex_destroy(&sensor->mutex);
 
 	return 0;
 }
-- 
2.20.1

