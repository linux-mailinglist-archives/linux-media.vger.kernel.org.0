Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E88677BEC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbjAWMz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjAWMz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79D06EA0
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QczDx8BMPnO2R3dk1q1pcZisRWYroZoRH4shtifgoJs=;
        b=TuNncumpXy4XrIlmHvjvPilRMXhAPyrfU2SY3MZqM96DRWH2Ub5jf2bNCMIAjC5XQFQRM8
        s4/Ge9WmxKfaIo1GRoa6k6QKlKCW+FPe+KmipajwtF4LXhtCU2XBlQDou0xdIigP17Ccu2
        7SUuRxykEILfgy60Akbp3OVFFINVqeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-3rOPxKlaMxm15h3sxagNOw-1; Mon, 23 Jan 2023 07:54:28 -0500
X-MC-Unique: 3rOPxKlaMxm15h3sxagNOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D24BE101A52E;
        Mon, 23 Jan 2023 12:54:27 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 47DC7C15BA0;
        Mon, 23 Jan 2023 12:54:25 +0000 (UTC)
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
Subject: [PATCH 46/57] media: atomisp: ov2680: Delay power-on till streaming is started
Date:   Mon, 23 Jan 2023 13:51:54 +0100
Message-Id: <20230123125205.622152-47-hdegoede@redhat.com>
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

Move the setting of the mode to stream on, this also allows
delaying power-on till streaming is started.

And drop the deprecated s_power callback since this now no long
is necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 101 +++++++-----------
 1 file changed, 41 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 1dc821ca4e68..2a8c4508cc66 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -327,24 +327,6 @@ static int power_down(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int ov2680_s_power(struct v4l2_subdev *sd, int on)
-{
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	int ret;
-
-	mutex_lock(&dev->input_lock);
-
-	if (on == 0) {
-		ret = power_down(sd);
-	} else {
-		ret = power_up(sd);
-	}
-
-	mutex_unlock(&dev->input_lock);
-
-	return ret;
-}
-
 static struct v4l2_mbus_framefmt *
 __ov2680_get_pad_format(struct ov2680_device *sensor,
 			struct v4l2_subdev_state *state,
@@ -393,14 +375,12 @@ static void ov2680_calc_mode(struct ov2680_device *sensor, int width, int height
 	sensor->mode.vts = OV2680_LINES_PER_FRAME;
 }
 
-static int ov2680_set_mode(struct ov2680_device *sensor, int width, int height)
+static int ov2680_set_mode(struct ov2680_device *sensor)
 {
 	struct i2c_client *client = sensor->client;
 	u8 pll_div, unknown, inc, fmt1, fmt2;
 	int ret;
 
-	ov2680_calc_mode(sensor, width, height);
-
 	if (sensor->mode.binning) {
 		pll_div = 1;
 		unknown = 0x23;
@@ -500,7 +480,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int width, height;
-	int ret = 0;
 
 	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
 		__func__,
@@ -518,23 +497,10 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	dev_dbg(&client->dev, "%s: %dx%d\n",
-		__func__, fmt->width, fmt->height);
-
 	mutex_lock(&dev->input_lock);
-
-	/* s_power has not been called yet for std v4l2 clients (camorama) */
-	power_up(sd);
-
-	ret = ov2680_set_mode(dev, fmt->width, fmt->height);
-	if (ret < 0)
-		goto err;
-
-	/* Restore value of all ctrls */
-	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
-err:
+	ov2680_calc_mode(dev, fmt->width, fmt->height);
 	mutex_unlock(&dev->input_lock);
-	return ret;
+	return 0;
 }
 
 static int ov2680_get_fmt(struct v4l2_subdev *sd,
@@ -584,30 +550,50 @@ static int ov2680_detect(struct i2c_client *client)
 
 static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
+	int ret = 0;
 
-	mutex_lock(&dev->input_lock);
-	if (enable)
-		dev_dbg(&client->dev, "ov2680_s_stream one\n");
-	else
-		dev_dbg(&client->dev, "ov2680_s_stream off\n");
-
-	ret = ovxxxx_write_reg8(client, OV2680_SW_STREAM,
-				enable ? OV2680_START_STREAMING : OV2680_STOP_STREAMING);
-	if (ret == 0) {
-		dev->is_streaming = enable;
-		v4l2_ctrl_activate(dev->ctrls.vflip, !enable);
-		v4l2_ctrl_activate(dev->ctrls.hflip, !enable);
+	mutex_lock(&sensor->input_lock);
+
+	if (sensor->is_streaming == enable) {
+		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");
+		goto error_unlock;
 	}
 
-	//otp valid at stream on state
-	//if(!dev->otp_data)
-	//	dev->otp_data = ov2680_otp_read(sd);
+	if (enable) {
+		ret = power_up(sd);
+		if (ret)
+			goto error_unlock;
 
-	mutex_unlock(&dev->input_lock);
+		ret = ov2680_set_mode(sensor);
+		if (ret)
+			goto error_power_down;
 
+		/* Restore value of all ctrls */
+		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+		if (ret)
+			goto error_power_down;
+
+		ret = ovxxxx_write_reg8(client, OV2680_SW_STREAM, OV2680_START_STREAMING);
+		if (ret)
+			goto error_power_down;
+	} else {
+		ovxxxx_write_reg8(client, OV2680_SW_STREAM, OV2680_STOP_STREAMING);
+		power_down(sd);
+	}
+
+	sensor->is_streaming = enable;
+	v4l2_ctrl_activate(sensor->ctrls.vflip, !enable);
+	v4l2_ctrl_activate(sensor->ctrls.hflip, !enable);
+
+	mutex_unlock(&sensor->input_lock);
+	return 0;
+
+error_power_down:
+	power_down(sd);
+error_unlock:
+	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
 
@@ -736,10 +722,6 @@ static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
 	.g_skip_frames	= ov2680_g_skip_frames,
 };
 
-static const struct v4l2_subdev_core_ops ov2680_core_ops = {
-	.s_power = ov2680_s_power,
-};
-
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 	.enum_mbus_code = ov2680_enum_mbus_code,
 	.enum_frame_size = ov2680_enum_frame_size,
@@ -749,7 +731,6 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov2680_ops = {
-	.core = &ov2680_core_ops,
 	.video = &ov2680_video_ops,
 	.pad = &ov2680_pad_ops,
 	.sensor = &ov2680_sensor_ops,
-- 
2.39.0

