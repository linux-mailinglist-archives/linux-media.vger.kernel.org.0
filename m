Return-Path: <linux-media+bounces-32659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64592ABA9C6
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58EE33A6A56
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06D71F8725;
	Sat, 17 May 2025 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVKG8JGL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5041F6694
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482086; cv=none; b=ryLCBk2CgYWji0q01UHrBRLYnb382IHIhLQC0NUb3ZMhphUe4kJIKhAT2l9wLHoYdEGVDmyVdQSrN6dGYRLGKEJ38cI0MJCsyMh8pxwXci+aYSvquGvuSJU7VyrRCJcQ4nCSuLym3xy+Q4q1rq5NlQBB8MyXkGrFHcBg3Mf8oCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482086; c=relaxed/simple;
	bh=ICuTjN1gntUWa0Hip6tE3aC4409Uv9tglpRi3vSWNLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWfqFNRV0/o90/e1FXgw8EumtZykDtG75KsSRkazRxFdAEo8D5PcZgCijR9KYelh5H4EBT+xRcdBmHP6KlaaFT6uiHgMGThQUzWYpEpq/jPc993k0Gdr/IQuih0M0FHxLSsyBNCFqqayffglMHYLxvKLmbhTNPg+lEQLlT0Fx04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVKG8JGL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNk20NmAxabtqMy79RJrDePgZjTQbcEyCRyDOMXssaA=;
	b=SVKG8JGLqZlkw4JYltNL3qShCvOEBDS+50PsZWXiPzLTN6cSdyrQEH3DZc7Dpo9jJkXN7Z
	RRBw0Y1Zt9/u7MnphZePY68BQZizoEbITS+nXm/xx4uihGWvu1Ikq4kd3KMp+rpKpIIjdI
	DV5MCb2EgsuziEhwfs3DYJy11LX/e+w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-ORfgP36QPM2XZTb23qrfNg-1; Sat,
 17 May 2025 07:41:20 -0400
X-MC-Unique: ORfgP36QPM2XZTb23qrfNg-1
X-Mimecast-MFC-AGG-ID: ORfgP36QPM2XZTb23qrfNg_1747482079
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDAF218004AD;
	Sat, 17 May 2025 11:41:18 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A613180045B;
	Sat, 17 May 2025 11:41:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/23] media: atomisp: gc0310: Rename "dev" function variable to "sensor"
Date: Sat, 17 May 2025 13:40:44 +0200
Message-ID: <20250517114106.43494-2-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Many functions on the gc0310 driver use a function local variable called
"dev" but these variable's type is not "struct device *" type as one would
expect based on the name. Instead they point to the gc0310 driver data
struct.

Rename these variables to sensor to make their purpose more clear.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 112 +++++++++---------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index d35394f1ddbb..cc74e90a1457 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -282,16 +282,16 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
-static int gc0310_exposure_set(struct gc0310_device *dev, u32 exp)
+static int gc0310_exposure_set(struct gc0310_device *sensor, u32 exp)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&dev->sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 
 	return i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H, exp);
 }
 
-static int gc0310_gain_set(struct gc0310_device *dev, u32 gain)
+static int gc0310_gain_set(struct gc0310_device *sensor, u32 gain)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&dev->sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	u8 again, dgain;
 	int ret;
 
@@ -317,27 +317,27 @@ static int gc0310_gain_set(struct gc0310_device *dev, u32 gain)
 
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct gc0310_device *dev =
+	struct gc0310_device *sensor =
 		container_of(ctrl->handler, struct gc0310_device, ctrls.handler);
 	int ret;
 
 	/* Only apply changes to the controls if the device is powered up */
-	if (!pm_runtime_get_if_in_use(dev->sd.dev))
+	if (!pm_runtime_get_if_in_use(sensor->sd.dev))
 		return 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
-		ret = gc0310_exposure_set(dev, ctrl->val);
+		ret = gc0310_exposure_set(sensor, ctrl->val);
 		break;
 	case V4L2_CID_GAIN:
-		ret = gc0310_gain_set(dev, ctrl->val);
+		ret = gc0310_gain_set(sensor, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
 		break;
 	}
 
-	pm_runtime_put(dev->sd.dev);
+	pm_runtime_put(sensor->sd.dev);
 	return ret;
 }
 
@@ -346,14 +346,14 @@ static const struct v4l2_ctrl_ops ctrl_ops = {
 };
 
 static struct v4l2_mbus_framefmt *
-gc0310_get_pad_format(struct gc0310_device *dev,
+gc0310_get_pad_format(struct gc0310_device *sensor,
 		      struct v4l2_subdev_state *state,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_state_get_format(state, pad);
 
-	return &dev->mode.fmt;
+	return &sensor->mode.fmt;
 }
 
 /* The GC0310 currently only supports 1 fixed fmt */
@@ -370,10 +370,10 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = gc0310_get_pad_format(dev, sd_state, format->pad, format->which);
+	fmt = gc0310_get_pad_format(sensor, sd_state, format->pad, format->which);
 	gc0310_fill_format(fmt);
 
 	format->format = *fmt;
@@ -384,10 +384,10 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = gc0310_get_pad_format(dev, sd_state, format->pad, format->which);
+	fmt = gc0310_get_pad_format(sensor, sd_state, format->pad, format->which);
 	format->format = *fmt;
 	return 0;
 }
@@ -424,12 +424,12 @@ static int gc0310_detect(struct i2c_client *client)
 
 static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	dev_dbg(&client->dev, "%s S enable=%d\n", __func__, enable);
-	mutex_lock(&dev->input_lock);
+	mutex_lock(&sensor->input_lock);
 
 	if (enable) {
 		ret = pm_runtime_get_sync(&client->dev);
@@ -449,7 +449,7 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 			goto error_power_down;
 
 		/* restore value of all ctrls */
-		ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
+		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
 		if (ret)
 			goto error_power_down;
 
@@ -475,14 +475,14 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	if (!enable)
 		pm_runtime_put(&client->dev);
 
-	dev->is_streaming = enable;
-	mutex_unlock(&dev->input_lock);
+	sensor->is_streaming = enable;
+	mutex_unlock(&sensor->input_lock);
 	return 0;
 
 error_power_down:
 	pm_runtime_put(&client->dev);
-	dev->is_streaming = false;
-	mutex_unlock(&dev->input_lock);
+	sensor->is_streaming = false;
+	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
 
@@ -559,21 +559,21 @@ static const struct v4l2_subdev_ops gc0310_ops = {
 	.sensor = &gc0310_sensor_ops,
 };
 
-static int gc0310_init_controls(struct gc0310_device *dev)
+static int gc0310_init_controls(struct gc0310_device *sensor)
 {
-	struct v4l2_ctrl_handler *hdl = &dev->ctrls.handler;
+	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
 
 	v4l2_ctrl_handler_init(hdl, 2);
 
 	/* Use the same lock for controls as for everything else */
-	hdl->lock = &dev->input_lock;
-	dev->sd.ctrl_handler = hdl;
+	hdl->lock = &sensor->input_lock;
+	sensor->sd.ctrl_handler = hdl;
 
-	dev->ctrls.exposure =
+	sensor->ctrls.exposure =
 		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_EXPOSURE, 0, 4095, 1, 1023);
 
 	/* 32 steps at base gain 1 + 64 half steps at base gain 2 */
-	dev->ctrls.gain =
+	sensor->ctrls.gain =
 		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1, 31);
 
 	return hdl->error;
@@ -582,21 +582,21 @@ static int gc0310_init_controls(struct gc0310_device *dev)
 static void gc0310_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 
 	dev_dbg(&client->dev, "gc0310_remove...\n");
 
 	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&dev->sd.entity);
-	v4l2_ctrl_handler_free(&dev->ctrls.handler);
-	mutex_destroy(&dev->input_lock);
+	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+	mutex_destroy(&sensor->input_lock);
 	pm_runtime_disable(&client->dev);
 }
 
 static int gc0310_probe(struct i2c_client *client)
 {
 	struct fwnode_handle *ep_fwnode;
-	struct gc0310_device *dev;
+	struct gc0310_device *sensor;
 	int ret;
 
 	/*
@@ -609,25 +609,25 @@ static int gc0310_probe(struct i2c_client *client)
 
 	fwnode_handle_put(ep_fwnode);
 
-	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev)
+	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
 		return -ENOMEM;
 
-	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(dev->reset)) {
-		return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
+	sensor->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset)) {
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset),
 				     "getting reset GPIO\n");
 	}
 
-	dev->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(dev->powerdown)) {
-		return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown),
+	sensor->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->powerdown)) {
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown),
 				     "getting powerdown GPIO\n");
 	}
 
-	mutex_init(&dev->input_lock);
-	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
-	gc0310_fill_format(&dev->mode.fmt);
+	mutex_init(&sensor->input_lock);
+	v4l2_i2c_subdev_init(&sensor->sd, client, &gc0310_ops);
+	gc0310_fill_format(&sensor->mode.fmt);
 
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
@@ -640,23 +640,23 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
-	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	ret = gc0310_init_controls(dev);
+	ret = gc0310_init_controls(sensor);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
 	}
 
-	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
+	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&dev->sd);
+	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
@@ -668,22 +668,22 @@ static int gc0310_probe(struct i2c_client *client)
 static int gc0310_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct gc0310_device *gc0310_dev = to_gc0310_sensor(sd);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 
-	gpiod_set_value_cansleep(gc0310_dev->powerdown, 1);
-	gpiod_set_value_cansleep(gc0310_dev->reset, 1);
+	gpiod_set_value_cansleep(sensor->powerdown, 1);
+	gpiod_set_value_cansleep(sensor->reset, 1);
 	return 0;
 }
 
 static int gc0310_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct gc0310_device *gc0310_dev = to_gc0310_sensor(sd);
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 
 	usleep_range(10000, 15000);
-	gpiod_set_value_cansleep(gc0310_dev->reset, 0);
+	gpiod_set_value_cansleep(sensor->reset, 0);
 	usleep_range(10000, 15000);
-	gpiod_set_value_cansleep(gc0310_dev->powerdown, 0);
+	gpiod_set_value_cansleep(sensor->powerdown, 0);
 
 	return 0;
 }
-- 
2.49.0


