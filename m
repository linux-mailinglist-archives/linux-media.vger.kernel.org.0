Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B84B677BD6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjAWMyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjAWMyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A706596
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k0P3Kayawv++Fu0pzGZ9yPdcPaaS5jkZv8hmu2fmq+s=;
        b=QJM+g92ImxSEJMXX/IrmXjWSxeeOLKZwavjnyzHrBgoh/GoCPIAXnFyy4bivOYE1YhYdpa
        i+hVfAtFZkgtjQuIwyKEtky/bnSJ6eUWxmWAp3gCf63jSMiJOnmNLJdynD71q9szh+OZxm
        hFUKoPj62auzUiQSo1McnOpPeaN5mHc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-mHqpsgC_MU6uUjqhAJNUUg-1; Mon, 23 Jan 2023 07:53:42 -0500
X-MC-Unique: mHqpsgC_MU6uUjqhAJNUUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7458C8030A4;
        Mon, 23 Jan 2023 12:53:41 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5E3E3C15BA0;
        Mon, 23 Jan 2023 12:53:38 +0000 (UTC)
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
Subject: [PATCH 30/57] media: atomisp: ov2680: Rework flip ctrls
Date:   Mon, 23 Jan 2023 13:51:38 +0100
Message-Id: <20230123125205.622152-31-hdegoede@redhat.com>
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

Rework the flip ctrls to be more like those of mainline (non staging)
drivers.

This is modelled after the main ov2680 and ov5693 drivers. This also
introduces __ov2680_get_pad_format() to make the ov2680 code more compliant
with the mainline v4l2-subdev APIs.

Note the OV2680_FLIP_REG and OV2680_MIRROR_REG defines are renamed to
OV2680_REG_FORMAT1 and OV2680_REG_FORMAT2 to match the datasheet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 285 ++++++++----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  29 +-
 2 files changed, 155 insertions(+), 159 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 85b9410f655e..df92b35ce062 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -38,8 +38,6 @@
 
 #include "ov2680.h"
 
-static int h_flag;
-static int v_flag;
 static enum atomisp_bayer_order ov2680_bayer_order_mapping[] = {
 	atomisp_bayer_order_bggr,
 	atomisp_bayer_order_grbg,
@@ -237,82 +235,80 @@ static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
 	return 0;
 }
 
-static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
+static void ov2680_set_bayer_order(struct ov2680_device *sensor, struct v4l2_mbus_framefmt *fmt)
+{
+	static const int ov2680_hv_flip_bayer_order[] = {
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+	};
+	struct camera_mipi_info *ov2680_info;
+	int hv_flip = 0;
+
+	if (sensor->ctrls.vflip->val)
+		hv_flip += 1;
+
+	if (sensor->ctrls.hflip->val)
+		hv_flip += 2;
+
+	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
+
+	/* TODO atomisp specific custom API, should be removed */
+	ov2680_info = v4l2_get_subdev_hostdata(&sensor->sd);
+	if (ov2680_info)
+		ov2680_info->raw_bayer_order = ov2680_bayer_order_mapping[hv_flip];
+}
+
+static int ov2680_set_vflip(struct ov2680_device *sensor, s32 val)
 {
-	struct camera_mipi_info *ov2680_info = NULL;
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
-	u32 val;
-	u8 index;
 
-	dev_dbg(&client->dev, "@%s: value:%d\n", __func__, value);
-	ret = ovxxxx_read_reg8(client, OV2680_FLIP_REG, &val);
-	if (ret)
-		return ret;
-	if (value)
-		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
-	else
-		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
+	if (sensor->is_streaming)
+		return -EBUSY;
 
-	ret = ovxxxx_write_reg8(client, OV2680_FLIP_REG, val);
-	if (ret)
+	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_FORMAT1, BIT(2),
+			     val ? BIT(2) : 0);
+	if (ret < 0)
 		return ret;
-	index = (v_flag > 0 ? OV2680_FLIP_BIT : 0) | (h_flag > 0 ? OV2680_MIRROR_BIT :
-		0);
-	ov2680_info = v4l2_get_subdev_hostdata(sd);
-	if (ov2680_info) {
-		ov2680_info->raw_bayer_order = ov2680_bayer_order_mapping[index];
-	}
-	return ret;
+
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
+	return 0;
 }
 
-static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
+static int ov2680_set_hflip(struct ov2680_device *sensor, s32 val)
 {
-	struct camera_mipi_info *ov2680_info = NULL;
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
-	u32 val;
-	u8 index;
 
-	dev_dbg(&client->dev, "@%s: value:%d\n", __func__, value);
+	if (sensor->is_streaming)
+		return -EBUSY;
 
-	ret = ovxxxx_read_reg8(client, OV2680_MIRROR_REG, &val);
-	if (ret)
+	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_FORMAT2, BIT(2),
+			     val ? BIT(2) : 0);
+	if (ret < 0)
 		return ret;
-	if (value)
-		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
-	else
-		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
 
-	ret = ovxxxx_write_reg8(client, OV2680_MIRROR_REG, val);
-	if (ret)
-		return ret;
-	index = (v_flag > 0 ? OV2680_FLIP_BIT : 0) | (h_flag > 0 ? OV2680_MIRROR_BIT :
-		0);
-	ov2680_info = v4l2_get_subdev_hostdata(sd);
-	if (ov2680_info) {
-		ov2680_info->raw_bayer_order = ov2680_bayer_order_mapping[index];
-	}
-	return ret;
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
+	return 0;
 }
 
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct ov2680_device *dev =
-	    container_of(ctrl->handler, struct ov2680_device, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&dev->sd);
-	int ret = 0;
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	int ret;
+
+	if (!sensor->power_on) {
+		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
+		return 0;
+	}
 
 	switch (ctrl->id) {
 	case V4L2_CID_VFLIP:
-		dev_dbg(&client->dev, "%s: CID_VFLIP:%d.\n",
-			__func__, ctrl->val);
-		ret = ov2680_v_flip(&dev->sd, ctrl->val);
+		ret = ov2680_set_vflip(sensor, ctrl->val);
 		break;
 	case V4L2_CID_HFLIP:
-		dev_dbg(&client->dev, "%s: CID_HFLIP:%d.\n",
-			__func__, ctrl->val);
-		ret = ov2680_h_flip(&dev->sd, ctrl->val);
+		ret = ov2680_set_hflip(sensor, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -322,13 +318,12 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 
 static int ov2680_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct ov2680_device *dev =
-	    container_of(ctrl->handler, struct ov2680_device, ctrl_handler);
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
 	int ret = 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
-		ret = ov2680_q_exposure(&dev->sd, &ctrl->val);
+		ret = ov2680_q_exposure(sd, &ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -337,45 +332,11 @@ static int ov2680_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static const struct v4l2_ctrl_ops ctrl_ops = {
+static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
 	.s_ctrl = ov2680_s_ctrl,
 	.g_volatile_ctrl = ov2680_g_volatile_ctrl
 };
 
-static const struct v4l2_ctrl_config ov2680_controls[] = {
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_EXPOSURE_ABSOLUTE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "exposure",
-		.min = 0x0,
-		.max = 0xffff,
-		.step = 0x01,
-		.def = 0x00,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_VFLIP,
-		.type = V4L2_CTRL_TYPE_BOOLEAN,
-		.name = "Flip",
-		.min = 0,
-		.max = 1,
-		.step = 1,
-		.def = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_HFLIP,
-		.type = V4L2_CTRL_TYPE_BOOLEAN,
-		.name = "Mirror",
-		.min = 0,
-		.max = 1,
-		.step = 1,
-		.def = 0,
-	},
-};
-
 static int ov2680_init_registers(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -506,8 +467,6 @@ static int power_down(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	h_flag = 0;
-	v_flag = 0;
 	if (!dev->platform_data) {
 		dev_err(&client->dev,
 			"no camera_sensor_platform_data");
@@ -558,14 +517,35 @@ static int ov2680_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
+static struct v4l2_mbus_framefmt *
+__ov2680_get_pad_format(struct ov2680_device *sensor,
+			struct v4l2_subdev_state *state,
+			unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&sensor->sd, state, pad);
+
+	return &sensor->mode.fmt;
+}
+
+static void ov2680_fill_format(struct ov2680_device *sensor,
+			       struct v4l2_mbus_framefmt *fmt,
+			       unsigned int width, unsigned int height)
+{
+	memset(fmt, 0, sizeof(*fmt));
+	fmt->width = width;
+	fmt->height = height;
+	fmt->field = V4L2_FIELD_NONE;
+	ov2680_set_bayer_order(sensor, fmt);
+}
+
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct camera_mipi_info *ov2680_info = NULL;
+	struct v4l2_mbus_framefmt *fmt;
 	struct ov2680_resolution *res;
 	int vts, ret = 0;
 
@@ -574,30 +554,19 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		(format->which == V4L2_SUBDEV_FORMAT_TRY) ? "try" : "set",
 		format->pad, fmt);
 
-	if (format->pad)
-		return -EINVAL;
-
-	if (!fmt)
-		return -EINVAL;
-
-	ov2680_info = v4l2_get_subdev_hostdata(sd);
-	if (!ov2680_info)
-		return -EINVAL;
-
-	res = v4l2_find_nearest_size(ov2680_res_preview,
-				     ARRAY_SIZE(ov2680_res_preview), width,
-				     height, fmt->width, fmt->height);
+	res = v4l2_find_nearest_size(ov2680_res_preview, ARRAY_SIZE(ov2680_res_preview),
+				     width, height,
+				     format->format.width, format->format.height);
 	if (!res)
 		res = &ov2680_res_preview[N_RES_PREVIEW - 1];
 
-	fmt->width = res->width;
-	fmt->height = res->height;
+	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
+	ov2680_fill_format(dev, fmt, res->width, res->height);
+
+	format->format = *fmt;
 
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *fmt;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
-	}
 
 	dev_dbg(&client->dev, "%s: %dx%d\n",
 		__func__, fmt->width, fmt->height);
@@ -629,10 +598,9 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	 * recall flip functions to avoid flip registers
 	 * were overridden by default setting
 	 */
-	if (h_flag)
-		ov2680_h_flip(sd, h_flag);
-	if (v_flag)
-		ov2680_v_flip(sd, v_flag);
+	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
+	if (ret < 0)
+		goto err;
 
 	dev->res = res;
 err:
@@ -644,19 +612,11 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
+	struct v4l2_mbus_framefmt *fmt;
 
-	if (format->pad)
-		return -EINVAL;
-
-	if (!fmt)
-		return -EINVAL;
-
-	fmt->width = dev->res->width;
-	fmt->height = dev->res->height;
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
-
+	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
+	format->format = *fmt;
 	return 0;
 }
 
@@ -707,6 +667,11 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 
 	ret = ovxxxx_write_reg8(client, OV2680_SW_STREAM,
 				enable ? OV2680_START_STREAMING : OV2680_STOP_STREAMING);
+	if (ret == 0) {
+		dev->is_streaming = enable;
+		v4l2_ctrl_activate(dev->ctrls.vflip, !enable);
+		v4l2_ctrl_activate(dev->ctrls.hflip, !enable);
+	}
 
 	//otp valid at stream on state
 	//if(!dev->otp_data)
@@ -867,6 +832,29 @@ static const struct v4l2_subdev_ops ov2680_ops = {
 	.sensor = &ov2680_sensor_ops,
 };
 
+static int ov2680_init_controls(struct ov2680_device *sensor)
+{
+	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
+	struct ov2680_ctrls *ctrls = &sensor->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+
+	v4l2_ctrl_handler_init(hdl, 2);
+
+	hdl->lock = &sensor->input_lock;
+
+	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
+	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	if (hdl->error)
+		return hdl->error;
+
+	sensor->sd.ctrl_handler = hdl;
+	return 0;
+}
+
 static void ov2680_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -878,7 +866,7 @@ static void ov2680_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
-	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	v4l2_ctrl_handler_free(&dev->ctrls.handler);
 	kfree(dev);
 }
 
@@ -887,7 +875,6 @@ static int ov2680_probe(struct i2c_client *client)
 	struct ov2680_device *dev;
 	int ret;
 	void *pdata;
-	unsigned int i;
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -895,6 +882,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	mutex_init(&dev->input_lock);
 
+	dev->client = client;
 	dev->res = &ov2680_res_preview[0];
 	dev->exposure = dev->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
 	dev->gain = 250; /* 0-2047 */
@@ -912,40 +900,31 @@ static int ov2680_probe(struct i2c_client *client)
 	if (ret)
 		goto out_free;
 
-	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
-	if (ret)
-		goto out_free;
-
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	ret =
-	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
-				   ARRAY_SIZE(ov2680_controls));
+
+	ret = ov2680_init_controls(dev);
 	if (ret) {
 		ov2680_remove(client);
 		return ret;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(ov2680_controls); i++)
-		v4l2_ctrl_new_custom(&dev->ctrl_handler, &ov2680_controls[i],
-				     NULL);
-
-	if (dev->ctrl_handler.error) {
+	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
+	if (ret) {
 		ov2680_remove(client);
-		return dev->ctrl_handler.error;
+		return ret;
 	}
 
-	/* Use same lock for controls as for everything else. */
-	dev->ctrl_handler.lock = &dev->input_lock;
-	dev->sd.ctrl_handler = &dev->ctrl_handler;
+	ov2680_fill_format(dev, &dev->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
 
-	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
+	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
 	if (ret) {
 		ov2680_remove(client);
-		dev_dbg(&client->dev, "+++ remove ov2680\n");
+		return ret;
 	}
-	return ret;
+
+	return 0;
 out_free:
 	dev_dbg(&client->dev, "+++ out free\n");
 	v4l2_device_unregister_subdev(&dev->sd);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index f4760a70055d..43bbc9368422 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -32,6 +32,9 @@
 
 #include "../include/linux/atomisp_platform.h"
 
+#define OV2680_NATIVE_WIDTH			1616
+#define OV2680_NATIVE_HEIGHT			1216
+
 #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
 
 #define OV2680_BIN_FACTOR_MAX 4
@@ -112,11 +115,8 @@
 #define OV2680_FRAME_OFF_NUM						0x4202
 
 /*Flip/Mirror*/
-#define OV2680_FLIP_REG				0x3820
-#define OV2680_MIRROR_REG			0x3821
-#define OV2680_FLIP_BIT				1
-#define OV2680_MIRROR_BIT			2
-#define OV2680_FLIP_MIRROR_BIT_ENABLE		4
+#define OV2680_REG_FORMAT1			0x3820
+#define OV2680_REG_FORMAT2			0x3821
 
 #define OV2680_MWB_RED_GAIN_H			0x5004/*0x3400*/
 #define OV2680_MWB_GREEN_GAIN_H			0x5006/*0x3402*/
@@ -158,13 +158,24 @@ struct ov2680_device {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct mutex input_lock;
-	struct v4l2_ctrl_handler ctrl_handler;
+	struct i2c_client *client;
 	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
 	bool power_on;
+	bool is_streaming;
 	u16 exposure;
 	u16 gain;
 	u16 digitgain;
+
+	struct ov2680_mode {
+		struct v4l2_mbus_framefmt fmt;
+	} mode;
+
+	struct ov2680_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	} ctrls;
 };
 
 /**
@@ -182,6 +193,12 @@ struct ov2680_reg {
 
 #define to_ov2680_sensor(x) container_of(x, struct ov2680_device, sd)
 
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of(ctrl->handler, struct ov2680_device,
+			     ctrls.handler)->sd;
+}
+
 #define OV2680_MAX_WRITE_BUF_SIZE	30
 
 struct ov2680_write_buffer {
-- 
2.39.0

