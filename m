Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9134A677BD9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbjAWMyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:54:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjAWMyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FD31027C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Uksp8uuKKj5GN/AV2WxMjiLFXt11UuHF8vZdGI4dI3w=;
        b=D0yZPXKeI9RnUoShxm3eEU4v/z6leCwXcNa716onzPLJ+J3brGApWTQFah/Gi/qdfm9fyv
        IMzN4nlCMwVqvAdG3E47RRV6gUFfl7hInO6KdSdvTsOtPqDGMpUoNigYLkAXhkI9TlcYWb
        f1o0aRbAg1soEex/W3Cq9D7lFGHch7o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-F29gk82lPqGaVHKNxnaYog-1; Mon, 23 Jan 2023 07:53:45 -0500
X-MC-Unique: F29gk82lPqGaVHKNxnaYog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6CEF3C0F221;
        Mon, 23 Jan 2023 12:53:44 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D3F8BC15BA0;
        Mon, 23 Jan 2023 12:53:41 +0000 (UTC)
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
Subject: [PATCH 31/57] media: atomisp: ov2680: Drop custom ATOMISP_IOC_S_EXPOSURE support
Date:   Mon, 23 Jan 2023 13:51:39 +0100
Message-Id: <20230123125205.622152-32-hdegoede@redhat.com>
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

Exposure and gain control should use standard v4l2 controls,
not a custom ioctl.

The next patch in this series will re-add support as standard controls,
this is split into 2 patches for easier reviewing.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 209 +-----------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |   3 -
 2 files changed, 2 insertions(+), 210 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index df92b35ce062..d508c02444eb 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -60,181 +60,6 @@ static int ov2680_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
-static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
-				  int gain, int digitgain)
-
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	u16 vts;
-	int ret, exp_val;
-
-	dev_dbg(&client->dev,
-		"+++++++__ov2680_set_exposure coarse_itg %d, gain %d, digitgain %d++\n",
-		coarse_itg, gain, digitgain);
-
-	vts = dev->res->lines_per_frame;
-
-	/* group hold */
-	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x00);
-	if (ret) {
-		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
-			__func__, OV2680_GROUP_ACCESS);
-		return ret;
-	}
-
-	/* Increase the VTS to match exposure + MARGIN */
-	if (coarse_itg > vts - OV2680_INTEGRATION_TIME_MARGIN)
-		vts = (u16)coarse_itg + OV2680_INTEGRATION_TIME_MARGIN;
-
-	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, vts);
-	if (ret) {
-		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
-			__func__, OV2680_TIMING_VTS_H);
-		return ret;
-	}
-
-	/* set exposure */
-
-	/* Lower four bit should be 0*/
-	exp_val = coarse_itg << 4;
-	ret = ovxxxx_write_reg8(client, OV2680_EXPOSURE_L, exp_val & 0xFF);
-	if (ret) {
-		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
-			__func__, OV2680_EXPOSURE_L);
-		return ret;
-	}
-
-	ret = ovxxxx_write_reg8(client, OV2680_EXPOSURE_M, (exp_val >> 8) & 0xFF);
-	if (ret) {
-		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
-			__func__, OV2680_EXPOSURE_M);
-		return ret;
-	}
-
-	ret = ovxxxx_write_reg8(client, OV2680_EXPOSURE_H, (exp_val >> 16) & 0x0F);
-	if (ret) {
-		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
-			__func__, OV2680_EXPOSURE_H);
-		return ret;
-	}
-
-	/* Analog gain */
-	ret = ovxxxx_write_reg16(client, OV2680_AGC_H, gain);
-	if (ret) {
-		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
-			__func__, OV2680_AGC_H);
-		return ret;
-	}
-	/* Digital gain */
-	if (digitgain) {
-		ret = ovxxxx_write_reg16(client, OV2680_MWB_RED_GAIN_H, digitgain);
-		if (ret) {
-			dev_err(&client->dev,
-				"%s: write 0x%02x: error, aborted\n",
-				__func__, OV2680_MWB_RED_GAIN_H);
-			return ret;
-		}
-
-		ret = ovxxxx_write_reg16(client, OV2680_MWB_GREEN_GAIN_H, digitgain);
-		if (ret) {
-			dev_err(&client->dev,
-				"%s: write 0x%02x: error, aborted\n",
-				__func__, OV2680_MWB_RED_GAIN_H);
-			return ret;
-		}
-
-		ret = ovxxxx_write_reg16(client, OV2680_MWB_BLUE_GAIN_H, digitgain);
-		if (ret) {
-			dev_err(&client->dev,
-				"%s: write 0x%02x: error, aborted\n",
-				__func__, OV2680_MWB_RED_GAIN_H);
-			return ret;
-		}
-	}
-
-	/* End group */
-	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x10);
-	if (ret)
-		return ret;
-
-	/* Delay launch group */
-	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0xa0);
-	if (ret)
-		return ret;
-	return ret;
-}
-
-static int ov2680_set_exposure(struct v4l2_subdev *sd, int exposure,
-			       int gain, int digitgain)
-{
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	int ret = 0;
-
-	mutex_lock(&dev->input_lock);
-
-	dev->exposure = exposure;
-	dev->gain = gain;
-	dev->digitgain = digitgain;
-
-	if (dev->power_on)
-		ret = __ov2680_set_exposure(sd, exposure, gain, digitgain);
-
-	mutex_unlock(&dev->input_lock);
-
-	return ret;
-}
-
-static long ov2680_s_exposure(struct v4l2_subdev *sd,
-			      struct atomisp_exposure *exposure)
-{
-	u16 coarse_itg = exposure->integration_time[0];
-	u16 analog_gain = exposure->gain[0];
-	u16 digital_gain = exposure->gain[1];
-
-	/* we should not accept the invalid value below */
-	if (analog_gain == 0) {
-		struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-		v4l2_err(client, "%s: invalid value\n", __func__);
-		return -EINVAL;
-	}
-
-	return ov2680_set_exposure(sd, coarse_itg, analog_gain, digital_gain);
-}
-
-static long ov2680_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
-{
-	switch (cmd) {
-	case ATOMISP_IOC_S_EXPOSURE:
-		return ov2680_s_exposure(sd, arg);
-
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-/*
- * This returns the exposure time being used. This should only be used
- * for filling in EXIF data, not for actual image processing.
- */
-static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u32 reg_val;
-	int ret;
-
-	/* get exposure */
-	ret = ovxxxx_read_reg24(client, OV2680_EXPOSURE_H, &reg_val);
-	if (ret)
-		return ret;
-
-	/* Lower four bits are not part of the exposure val (always 0) */
-	*value = reg_val >> 4;
-	return 0;
-}
-
 static void ov2680_set_bayer_order(struct ov2680_device *sensor, struct v4l2_mbus_framefmt *fmt)
 {
 	static const int ov2680_hv_flip_bayer_order[] = {
@@ -316,25 +141,8 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static int ov2680_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
-	int ret = 0;
-
-	switch (ctrl->id) {
-	case V4L2_CID_EXPOSURE_ABSOLUTE:
-		ret = ov2680_q_exposure(sd, &ctrl->val);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
 static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
 	.s_ctrl = ov2680_s_ctrl,
-	.g_volatile_ctrl = ov2680_g_volatile_ctrl
 };
 
 static int ov2680_init_registers(struct v4l2_subdev *sd)
@@ -443,10 +251,6 @@ static int power_up(struct v4l2_subdev *sd)
 	if (ret)
 		goto fail_init_registers;
 
-	ret = __ov2680_set_exposure(sd, dev->exposure, dev->gain, dev->digitgain);
-	if (ret)
-		goto fail_init_registers;
-
 	dev->power_on = true;
 	return 0;
 
@@ -547,7 +351,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	struct ov2680_resolution *res;
-	int vts, ret = 0;
+	int ret = 0;
 
 	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
 		__func__,
@@ -582,13 +386,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto err;
 	}
 
-	vts = dev->res->lines_per_frame;
-
-	/* If necessary increase the VTS to match exposure + MARGIN */
-	if (dev->exposure > vts - OV2680_INTEGRATION_TIME_MARGIN)
-		vts = dev->exposure + OV2680_INTEGRATION_TIME_MARGIN;
-
-	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, vts);
+	ret = ovxxxx_write_reg16(client, OV2680_TIMING_VTS_H, dev->res->lines_per_frame);
 	if (ret) {
 		dev_err(&client->dev, "ov2680 write vts err: %d\n", ret);
 		goto err;
@@ -814,7 +612,6 @@ static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
 
 static const struct v4l2_subdev_core_ops ov2680_core_ops = {
 	.s_power = ov2680_s_power,
-	.ioctl = ov2680_ioctl,
 };
 
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
@@ -884,8 +681,6 @@ static int ov2680_probe(struct i2c_client *client)
 
 	dev->client = client;
 	dev->res = &ov2680_res_preview[0];
-	dev->exposure = dev->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
-	dev->gain = 250; /* 0-2047 */
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 43bbc9368422..45eb1f93b847 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -163,9 +163,6 @@ struct ov2680_device {
 	struct camera_sensor_platform_data *platform_data;
 	bool power_on;
 	bool is_streaming;
-	u16 exposure;
-	u16 gain;
-	u16 digitgain;
 
 	struct ov2680_mode {
 		struct v4l2_mbus_framefmt fmt;
-- 
2.39.0

