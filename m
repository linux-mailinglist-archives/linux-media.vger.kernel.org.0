Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70499338DF2
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhCLM5K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:57:10 -0500
Received: from retiisi.eu ([95.216.213.190]:48368 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231560AbhCLM5A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:57:00 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 229DA634C8B;
        Fri, 12 Mar 2021 14:54:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel.garcia@collabora.com
Subject: [PATCH v2 2/4] v4l: fwnode: Rename v4l2_async_register_subdev_sensor_common
Date:   Fri, 12 Mar 2021 14:56:55 +0200
Message-Id: <20210312125657.25442-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename v4l2_async_register_subdev_sensor_common as
v4l2_async_register_subdev_sensor. This is a part of the effort to make
the long names present in V4L2 fwnode and async frameworks shorter.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst |  2 +-
 drivers/media/i2c/ccs/ccs-core.c               |  2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c       |  2 +-
 drivers/media/i2c/hi556.c                      |  2 +-
 drivers/media/i2c/imx214.c                     |  2 +-
 drivers/media/i2c/imx219.c                     |  2 +-
 drivers/media/i2c/imx258.c                     |  2 +-
 drivers/media/i2c/imx319.c                     |  2 +-
 drivers/media/i2c/imx334.c                     |  2 +-
 drivers/media/i2c/imx355.c                     |  2 +-
 drivers/media/i2c/ov13858.c                    |  2 +-
 drivers/media/i2c/ov2740.c                     |  2 +-
 drivers/media/i2c/ov5640.c                     |  2 +-
 drivers/media/i2c/ov5648.c                     |  2 +-
 drivers/media/i2c/ov5670.c                     |  2 +-
 drivers/media/i2c/ov5675.c                     |  2 +-
 drivers/media/i2c/ov5695.c                     |  2 +-
 drivers/media/i2c/ov8856.c                     |  2 +-
 drivers/media/i2c/ov8865.c                     |  2 +-
 drivers/media/i2c/ov9734.c                     |  2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c          |  4 ++--
 include/media/v4l2-async.h                     | 10 +++++-----
 22 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index e1f05cd38897..7736da077fb8 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -208,7 +208,7 @@ the needs of the driver.
 :c:func:`v4l2_async_notifier_add_i2c_subdev` are for bridge and ISP drivers for
 registering their async sub-devices with the notifier.
 
-:c:func:`v4l2_async_register_subdev_sensor_common` is a helper function for
+:c:func:`v4l2_async_register_subdev_sensor` is a helper function for
 sensor drivers registering their own async sub-device, but it also registers a
 notifier and further registers async sub-devices for lens and flash devices
 found in firmware. The notifier for the sub-device is unregistered with the
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4505594996bd..9dc3f45da3dc 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3572,7 +3572,7 @@ static int ccs_probe(struct i2c_client *client)
 	pm_runtime_get_noresume(&client->dev);
 	pm_runtime_enable(&client->dev);
 
-	rval = v4l2_async_register_subdev_sensor_common(&sensor->src->sd);
+	rval = v4l2_async_register_subdev_sensor(&sensor->src->sd);
 	if (rval < 0)
 		goto out_disable_runtime_pm;
 
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 122af761c8e3..bb3eac5e005e 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1443,7 +1443,7 @@ static int et8ek8_probe(struct i2c_client *client)
 		goto err_mutex;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&sensor->subdev);
+	ret = v4l2_async_register_subdev_sensor(&sensor->subdev);
 	if (ret < 0)
 		goto err_entity;
 
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index c74736845d7a..6f05c1138e3b 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1145,7 +1145,7 @@ static int hi556_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&hi556->sd);
+	ret = v4l2_async_register_subdev_sensor(&hi556->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index cee1a4817af9..e8b281e432e8 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1061,7 +1061,7 @@ static int imx214_probe(struct i2c_client *client)
 
 	imx214_entity_init_cfg(&imx214->sd, NULL);
 
-	ret = v4l2_async_register_subdev_sensor_common(&imx214->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
 		goto free_entity;
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6e3382b85a90..909e1d418f33 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1528,7 +1528,7 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
 	if (ret < 0) {
 		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
 		goto error_media_entity;
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 61d74b794582..61b2d87a9761 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1289,7 +1289,7 @@ static int imx258_probe(struct i2c_client *client)
 	if (ret)
 		goto error_handler_free;
 
-	ret = v4l2_async_register_subdev_sensor_common(&imx258->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx258->sd);
 	if (ret < 0)
 		goto error_media_entity;
 
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 8473c0bbb35d..38540323a156 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2486,7 +2486,7 @@ static int imx319_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&imx319->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx319->sd);
 	if (ret < 0)
 		goto error_media_entity;
 
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index ad530f0d338a..047aa7658d21 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1057,7 +1057,7 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&imx334->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
 	if (ret < 0) {
 		dev_err(imx334->dev,
 			"failed to register async subdev: %d", ret);
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 700f7467fb31..ccedcd4c520a 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1786,7 +1786,7 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&imx355->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
 		goto error_media_entity;
 
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 2f3be7a80cef..4a2885ff0cbe 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1738,7 +1738,7 @@ static int ov13858_probe(struct i2c_client *client,
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&ov13858->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov13858->sd);
 	if (ret < 0)
 		goto error_media_entity;
 
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b41a90c2aed5..0f3f17f3c426 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1154,7 +1154,7 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&ov2740->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 14f3afa7721a..5b9cc71df473 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3162,7 +3162,7 @@ static int ov5640_probe(struct i2c_client *client)
 	if (ret)
 		goto entity_cleanup;
 
-	ret = v4l2_async_register_subdev_sensor_common(&sensor->sd);
+	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret)
 		goto free_ctrls;
 
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index dfe38ab8224d..3ecb4a3e8773 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2559,7 +2559,7 @@ static int ov5648_probe(struct i2c_client *client)
 
 	/* V4L2 subdev register */
 
-	ret = v4l2_async_register_subdev_sensor_common(subdev);
+	ret = v4l2_async_register_subdev_sensor(subdev);
 	if (ret)
 		goto error_pm;
 
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 866c8c2e8f59..dee7df8dd100 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2503,7 +2503,7 @@ static int ov5670_probe(struct i2c_client *client)
 	}
 
 	/* Async register for subdev */
-	ret = v4l2_async_register_subdev_sensor_common(&ov5670->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov5670->sd);
 	if (ret < 0) {
 		err_msg = "v4l2_async_register_subdev() error";
 		goto error_entity_cleanup;
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index ae00d717e599..dea32859459a 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1193,7 +1193,7 @@ static int ov5675_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&ov5675->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov5675->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index bbccb6f9582f..09bee57a241d 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1336,7 +1336,7 @@ static int ov5695_probe(struct i2c_client *client,
 		goto err_power_off;
 #endif
 
-	ret = v4l2_async_register_subdev_sensor_common(sd);
+	ret = v4l2_async_register_subdev_sensor(sd);
 	if (ret) {
 		dev_err(dev, "v4l2 async register subdev failed\n");
 		goto err_clean_entity;
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index b337f729d5e3..e3af3ea277af 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1795,7 +1795,7 @@ static int ov8856_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&ov8856->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov8856->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 2db052ff9d21..9ecf180635ee 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2904,7 +2904,7 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* V4L2 subdev register */
 
-	ret = v4l2_async_register_subdev_sensor_common(subdev);
+	ret = v4l2_async_register_subdev_sensor(subdev);
 	if (ret)
 		goto error_pm;
 
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index e212465489e8..b7309a551cae 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -964,7 +964,7 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&ov9734->sd);
+	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 9c1b38919491..843259c304bb 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1308,7 +1308,7 @@ v4l2_async_notifier_parse_fwnode_sensor(struct device *dev,
 	return 0;
 }
 
-int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
+int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *notifier;
 	int ret;
@@ -1347,7 +1347,7 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor_common);
+EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index aee28c0e31ac..fa4901162663 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -286,10 +286,10 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier);
 int v4l2_async_register_subdev(struct v4l2_subdev *sd);
 
 /**
- * v4l2_async_register_subdev_sensor_common - registers a sensor sub-device to
- *					      the asynchronous sub-device
- *					      framework and parse set up common
- *					      sensor related devices
+ * v4l2_async_register_subdev_sensor - registers a sensor sub-device to the
+ *				       asynchronous sub-device framework and
+ *				       parse set up common sensor related
+ *				       devices
  *
  * @sd: pointer to struct &v4l2_subdev
  *
@@ -305,7 +305,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd);
  * to register it.
  */
 int __must_check
-v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd);
+v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
 
 /**
  * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
-- 
2.29.2

