Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F25A677BEA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjAWMz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbjAWMzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEFF4231
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JbiIhWxIW4mUntgHqV9h8OhgT4CjJNdXrrGbXQ5di8Y=;
        b=KnCntWWSsCNhARIhGXow1JiCh+R9rWuyL/HoeQj6GiReIMHz7pdDsWmH1NJ6iY3LI3DdRh
        32wCmqyccmGGIwYmSl6w55Leotbq6UOObsDEI0GLpBrgsSK8DWBUxBeNyXTOSqoXjG+7O1
        hd8AeJbXzCJdX51IurKfeo4gJDrR3NU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-FVJSWa-vPUuRM0WgV7k8vw-1; Mon, 23 Jan 2023 07:54:33 -0500
X-MC-Unique: FVJSWa-vPUuRM0WgV7k8vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDFAD811E6E;
        Mon, 23 Jan 2023 12:54:32 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0064CC15BA0;
        Mon, 23 Jan 2023 12:54:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 48/57] media: atomisp: ov2680: s/dev/sensor/
Date:   Mon, 23 Jan 2023 13:51:56 +0100
Message-Id: <20230123125205.622152-49-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using dev as name for variables pointing to struct ov2680_device is a bit
unfortunate choice.

All the recently added / rewritten code is already using sensor for this,
replace the remaining usages of "struct ov2680_device *dev" with
"struct ov2680_device *sensor".

Note the power_up()/power_down() related functions are not changed as
these will be removed in one of the next patches.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 74 +++++++++----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 881340d7466f..5f26508a1e5a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -472,7 +472,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int width, height;
@@ -485,17 +485,17 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	width = min_t(unsigned int, ALIGN(format->format.width, 2), OV2680_NATIVE_WIDTH);
 	height = min_t(unsigned int, ALIGN(format->format.height, 2), OV2680_NATIVE_HEIGHT);
 
-	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
-	ov2680_fill_format(dev, fmt, width, height);
+	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
+	ov2680_fill_format(sensor, fmt, width, height);
 
 	format->format = *fmt;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	mutex_lock(&dev->input_lock);
-	ov2680_calc_mode(dev, fmt->width, fmt->height);
-	mutex_unlock(&dev->input_lock);
+	mutex_lock(&sensor->input_lock);
+	ov2680_calc_mode(sensor, fmt->width, fmt->height);
+	mutex_unlock(&sensor->input_lock);
 	return 0;
 }
 
@@ -503,10 +503,10 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
+	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
 	format->format = *fmt;
 	return 0;
 }
@@ -596,17 +596,17 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 static int ov2680_s_config(struct v4l2_subdev *sd,
 			   int irq, void *platform_data)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	if (!platform_data)
 		return -ENODEV;
 
-	dev->platform_data =
+	sensor->platform_data =
 	    (struct camera_sensor_platform_data *)platform_data;
 
-	mutex_lock(&dev->input_lock);
+	mutex_lock(&sensor->input_lock);
 
 	ret = pm_runtime_get_sync(&client->dev);
 	if (ret < 0) {
@@ -614,7 +614,7 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 		goto fail_power_on;
 	}
 
-	ret = dev->platform_data->csi_cfg(sd, 1);
+	ret = sensor->platform_data->csi_cfg(sd, 1);
 	if (ret)
 		goto fail_csi_cfg;
 
@@ -627,16 +627,16 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 
 	/* turn off sensor, after probed */
 	pm_runtime_put(&client->dev);
-	mutex_unlock(&dev->input_lock);
+	mutex_unlock(&sensor->input_lock);
 
 	return 0;
 
 fail_csi_cfg:
-	dev->platform_data->csi_cfg(sd, 0);
+	sensor->platform_data->csi_cfg(sd, 0);
 fail_power_on:
 	pm_runtime_put(&client->dev);
 	dev_err(&client->dev, "sensor power-gating failed\n");
-	mutex_unlock(&dev->input_lock);
+	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
 
@@ -770,35 +770,35 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
 static void ov2680_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 
 	dev_dbg(&client->dev, "ov2680_remove...\n");
 
-	dev->platform_data->csi_cfg(sd, 0);
+	sensor->platform_data->csi_cfg(sd, 0);
 
 	v4l2_device_unregister_subdev(sd);
-	media_entity_cleanup(&dev->sd.entity);
-	v4l2_ctrl_handler_free(&dev->ctrls.handler);
+	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	pm_runtime_disable(&client->dev);
-	kfree(dev);
+	kfree(sensor);
 }
 
 static int ov2680_probe(struct i2c_client *client)
 {
-	struct ov2680_device *dev;
+	struct ov2680_device *sensor;
 	int ret;
 	void *pdata;
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev)
+	sensor = kzalloc(sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
 		return -ENOMEM;
 
-	mutex_init(&dev->input_lock);
+	mutex_init(&sensor->input_lock);
 
-	dev->client = client;
-	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
+	sensor->client = client;
+	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
 
-	pdata = gmin_camera_platform_data(&dev->sd,
+	pdata = gmin_camera_platform_data(&sensor->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_10,
 					  atomisp_bayer_order_bggr);
 	if (!pdata) {
@@ -811,29 +811,29 @@ static int ov2680_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	ret = ov2680_s_config(&dev->sd, client->irq, pdata);
+	ret = ov2680_s_config(&sensor->sd, client->irq, pdata);
 	if (ret)
 		goto out_free;
 
-	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
-	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	ret = ov2680_init_controls(dev);
+	ret = ov2680_init_controls(sensor);
 	if (ret) {
 		ov2680_remove(client);
 		return ret;
 	}
 
-	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
+	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
 	if (ret) {
 		ov2680_remove(client);
 		return ret;
 	}
 
-	ov2680_fill_format(dev, &dev->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
+	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
 
-	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
+	ret = atomisp_register_i2c_module(&sensor->sd, pdata, RAW_CAMERA);
 	if (ret) {
 		ov2680_remove(client);
 		return ret;
@@ -842,8 +842,8 @@ static int ov2680_probe(struct i2c_client *client)
 	return 0;
 out_free:
 	dev_dbg(&client->dev, "+++ out free\n");
-	v4l2_device_unregister_subdev(&dev->sd);
-	kfree(dev);
+	v4l2_device_unregister_subdev(&sensor->sd);
+	kfree(sensor);
 	return ret;
 }
 
-- 
2.39.0

