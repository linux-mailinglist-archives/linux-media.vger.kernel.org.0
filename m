Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836D56D31C6
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjDAPBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjDAPBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFAC1EA19
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EWbPv+gRI/bXJ+PXZMYDiUh13YuVVwH3uscxjgyXbFY=;
        b=fTy64mwgCbdnspCQepYDHZ5jjj349KRGVAXZr0FnhPJxGDT+4HhdKw5QvBo7Uwpex/hPXK
        4y1rMTY48hq7x77MOux78jzzt7VPrm/nudBEnFAlUFVj5TuESXqq3OSWn/egrfkRMX92Di
        w5lDJmRdlCY4Ifb6jAQi/dR7fmIrtuk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-dT3750KEM5y4Zt1YxzGKBA-1; Sat, 01 Apr 2023 11:00:03 -0400
X-MC-Unique: dT3750KEM5y4Zt1YxzGKBA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D59893C0253E;
        Sat,  1 Apr 2023 15:00:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 54BE9400F59;
        Sat,  1 Apr 2023 15:00:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 15/28] media: atomisp: gc0310: Delay power-on till streaming is started
Date:   Sat,  1 Apr 2023 16:59:13 +0200
Message-Id: <20230401145926.596216-16-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
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
 .../media/atomisp/i2c/atomisp-gc0310.c        | 87 +++++++------------
 1 file changed, 29 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 015795f32c3a..305d43b9815b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -122,28 +122,6 @@ static const struct v4l2_ctrl_ops ctrl_ops = {
 	.s_ctrl = gc0310_s_ctrl,
 };
 
-static int gc0310_init(struct v4l2_subdev *sd)
-{
-	int ret;
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
-	mutex_lock(&dev->input_lock);
-
-	/* set initial registers */
-	ret = gc0310_write_reg_array(client, gc0310_reset_register,
-				     ARRAY_SIZE(gc0310_reset_register));
-	if (ret)
-		goto out_unlock;
-
-	/* restore value of all ctrls */
-	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
-
-out_unlock:
-	mutex_unlock(&dev->input_lock);
-	return ret;
-}
-
 static int power_ctrl(struct v4l2_subdev *sd, bool flag)
 {
 	int ret = 0;
@@ -282,20 +260,6 @@ static int power_down(struct v4l2_subdev *sd)
 	return ret;
 }
 
-static int gc0310_s_power(struct v4l2_subdev *sd, int on)
-{
-	int ret;
-
-	if (on == 0)
-		return power_down(sd);
-
-	ret = power_up(sd);
-	if (ret)
-		return ret;
-
-	return gc0310_init(sd);
-}
-
 static struct v4l2_mbus_framefmt *
 gc0310_get_pad_format(struct gc0310_device *dev,
 		      struct v4l2_subdev_state *state,
@@ -321,26 +285,14 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
-	int ret;
 
 	fmt = gc0310_get_pad_format(dev, sd_state, format->pad, format->which);
 	gc0310_fill_format(fmt);
 
 	format->format = *fmt;
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		return 0;
-
-	mutex_lock(&dev->input_lock);
-	/* s_power has not been called yet for std v4l2 clients (camorama) */
-	power_up(sd);
-	ret = gc0310_write_reg_array(client, gc0310_VGA_30fps, ARRAY_SIZE(gc0310_VGA_30fps));
-	mutex_unlock(&dev->input_lock);
-
-	return ret;
+	return 0;
 }
 
 static int gc0310_get_fmt(struct v4l2_subdev *sd,
@@ -392,28 +344,52 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&dev->input_lock);
 
 	if (enable) {
+		ret = power_up(sd);
+		if (ret)
+			goto error_unlock;
+
+		ret = gc0310_write_reg_array(client, gc0310_reset_register,
+					     ARRAY_SIZE(gc0310_reset_register));
+		if (ret)
+			goto error_power_down;
+
+		ret = gc0310_write_reg_array(client, gc0310_VGA_30fps,
+					     ARRAY_SIZE(gc0310_VGA_30fps));
+		if (ret)
+			goto error_power_down;
+
+		/* restore value of all ctrls */
+		ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
+		if (ret)
+			goto error_power_down;
+
 		/* enable per frame MIPI and sensor ctrl reset  */
 		ret = i2c_smbus_write_byte_data(client, 0xFE, 0x30);
 		if (ret)
-			goto error_unlock;
+			goto error_power_down;
 	}
 
 	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_3);
 	if (ret)
-		goto error_unlock;
+		goto error_power_down;
 
 	ret = i2c_smbus_write_byte_data(client, GC0310_SW_STREAM,
 					enable ? GC0310_START_STREAMING : GC0310_STOP_STREAMING);
 	if (ret)
-		goto error_unlock;
+		goto error_power_down;
 
 	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_0);
 	if (ret)
-		goto error_unlock;
+		goto error_power_down;
+
+	if (!enable)
+		power_down(sd);
 
 	mutex_unlock(&dev->input_lock);
 	return 0;
 
+error_power_down:
+	power_down(sd);
 error_unlock:
 	mutex_unlock(&dev->input_lock);
 	return ret;
@@ -533,10 +509,6 @@ static const struct v4l2_subdev_video_ops gc0310_video_ops = {
 	.g_frame_interval = gc0310_g_frame_interval,
 };
 
-static const struct v4l2_subdev_core_ops gc0310_core_ops = {
-	.s_power = gc0310_s_power,
-};
-
 static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_mbus_code = gc0310_enum_mbus_code,
 	.enum_frame_size = gc0310_enum_frame_size,
@@ -545,7 +517,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops gc0310_ops = {
-	.core = &gc0310_core_ops,
 	.video = &gc0310_video_ops,
 	.pad = &gc0310_pad_ops,
 	.sensor = &gc0310_sensor_ops,
-- 
2.39.1

