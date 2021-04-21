Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164113670B5
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 18:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244429AbhDUQ5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 12:57:05 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:55248 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244466AbhDUQ5B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 12:57:01 -0400
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Apr 2021 12:56:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619024174; bh=YtetIt89bMCwEpcMWwCQXjKo4GvGKm7xUuJcwpbES5k=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=M/fESto5OP1RiQ4bKc9xU11IgO2u4S208FDjQSowzlofFZ1J4F9nszYNuC39wCDbZ
         j09iydqSIECvJsdjr41Oj4aEpVKUl4AErUGx0DKAvnC6tgzd6RBUVwlGbPHwgIgFtP
         abffySiU0LjLHhtFXAioW3c0Hds9MChKgEa0WoY4=
Received: by 192.168.90.14 [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 18:56:14 +0200 (CEST)
X-EA-Auth: ItxAaoHD8A/gZo95ABEI5NtQiNtPRagRGj18W9RVxzZf+9c1hDH41hanHIHU0OnNyJL5KqYPEGUwVvbGqtrt3+tsy93WdvoW
Date:   Wed, 21 Apr 2021 22:26:09 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v1 4/6] staging: media: atomisp: reformat code comment blocks
Message-ID: <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
References: <cover.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619022192.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reformat code comment blocks according to the coding style guidelines.
This resolves different checkpatch script WARNINGs around block comments.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v1:
   - implement following changes suggested by Fabio Aiuto                              
       a. Corrected commenting style                                                               
       b. Similar style implemented for other comment blocks in                                    
          the same files.                                       

 .../media/atomisp/i2c/atomisp-gc2235.c        | 19 ++++----
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  6 ++-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 46 +++++++++++--------
 .../media/atomisp/i2c/atomisp-ov2680.c        | 20 +++++---
 4 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 548c572d3b57..6ee6e8414f0e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -228,7 +228,7 @@ static int gc2235_g_focal(struct v4l2_subdev *sd, s32 *val)
 
 static int gc2235_g_fnumber(struct v4l2_subdev *sd, s32 *val)
 {
-	/*const f number for imx*/
+	/* const f number for imx */
 	*val = (GC2235_F_NUMBER_DEFAULT_NUM << 16) | GC2235_F_NUMBER_DEM;
 	return 0;
 }
@@ -427,7 +427,8 @@ static long gc2235_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 	return 0;
 }
 
-/* This returns the exposure time being used. This should only be used
+/*
+ * This returns the exposure time being used. This should only be used
  * for filling in EXIF data, not for actual image processing.
  */
 static int gc2235_q_exposure(struct v4l2_subdev *sd, s32 *value)
@@ -746,11 +747,12 @@ static int startup(struct v4l2_subdev *sd)
 	int ret = 0;
 
 	if (is_init == 0) {
-		/* force gc2235 to do a reset in res change, otherwise it
-		* can not output normal after switching res. and it is not
-		* necessary for first time run up after power on, for the sack
-		* of performance
-		*/
+		/*
+		 * force gc2235 to do a reset in res change, otherwise it
+		 * can not output normal after switching res. and it is not
+		 * necessary for first time run up after power on, for the sack
+		 * of performance
+		 */
 		power_down(sd);
 		power_up(sd);
 		gc2235_write_reg_array(client, gc2235_init_settings);
@@ -904,7 +906,8 @@ static int gc2235_s_config(struct v4l2_subdev *sd,
 	    (struct camera_sensor_platform_data *)platform_data;
 
 	mutex_lock(&dev->input_lock);
-	/* power off the module, then power on it in future
+	/*
+	 * power off the module, then power on it in future
 	 * as first power on by board may not fulfill the
 	 * power on sequqence needed by the module
 	 */
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
index b93c80471f22..7a20d918a9d5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
@@ -50,14 +50,16 @@ struct tbd_data_record_header {
 static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
 				 unsigned int size)
 {
-	/* The configuration data contains any number of sequences where
+	/*
+	 * The configuration data contains any number of sequences where
 	 * the first byte (that is, uint8_t) that marks the number of bytes
 	 * in the sequence to follow, is indeed followed by the indicated
 	 * number of bytes of actual data to be written to sensor.
 	 * By convention, the first two bytes of actual data should be
 	 * understood as an address in the sensor address space (hibyte
 	 * followed by lobyte) where the remaining data in the sequence
-	 * will be written. */
+	 * will be written.
+	 */
 
 	u8 *ptr = bufptr;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 465fc4468442..f314e5fed9cb 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -475,10 +475,12 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 	if (!dev || !dev->platform_data)
 		return -ENODEV;
 
-	/* Note: current modules wire only one GPIO signal (RESET#),
+	/*
+	 * Note: current modules wire only one GPIO signal (RESET#),
 	 * but the schematic wires up two to the connector.  BIOS
 	 * versions have been unfortunately inconsistent with which
-	 * ACPI index RESET# is on, so hit both */
+	 * ACPI index RESET# is on, so hit both
+	 */
 
 	if (flag) {
 		ret = dev->platform_data->gpio0_ctrl(sd, 0);
@@ -560,7 +562,7 @@ static int power_down(struct v4l2_subdev *sd)
 	if (ret)
 		dev_err(&client->dev, "vprog failed.\n");
 
-	/*according to DS, 20ms is needed after power down*/
+	/* according to DS, 20ms is needed after power down */
 	msleep(20);
 
 	return ret;
@@ -947,7 +949,7 @@ static int mt9m114_g_focal(struct v4l2_subdev *sd, s32 *val)
 
 static int mt9m114_g_fnumber(struct v4l2_subdev *sd, s32 *val)
 {
-	/*const f number for mt9m114*/
+	/* const f number for mt9m114 */
 	*val = (MT9M114_F_NUMBER_DEFAULT_NUM << 16) | MT9M114_F_NUMBER_DEM;
 	return 0;
 }
@@ -1014,13 +1016,13 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	AnalogGain = exposure->gain[0];
 	DigitalGain = exposure->gain[1];
 	if (!dev->streamon) {
-		/*Save the first exposure values while stream is off*/
+		/* Save the first exposure values while stream is off */
 		dev->first_exp = coarse_integration;
 		dev->first_gain = AnalogGain;
 		dev->first_diggain = DigitalGain;
 	}
-	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +
-	((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8); */
+	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
+	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
 
 	/* set frame length */
 	if (FLines < coarse_integration + 6)
@@ -1034,8 +1036,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	}
 
 	/* set coarse integration */
-	/* 3A provide real exposure time.
-		should not translate to any value here. */
+	/*
+	 * 3A provide real exposure time.
+	 * should not translate to any value here.
+	 */
 	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
 				REG_EXPO_COARSE, (u16)(coarse_integration));
 	if (ret) {
@@ -1044,7 +1048,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	}
 
 	/*
-	// set analog/digital gain
+	 * set analog/digital gain
 	switch(AnalogGain)
 	{
 	case 0:
@@ -1069,8 +1073,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	*/
 	if (DigitalGain >= 16 || DigitalGain <= 1)
 		DigitalGain = 1;
-	/* AnalogGainToWrite =
-		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
+
+	/*
+	 * AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
+	 */
 	AnalogGainToWrite = (u16)((DigitalGain << 12) | (u16)AnalogGain);
 	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
 				REG_GAIN, AnalogGainToWrite);
@@ -1095,8 +1101,10 @@ static long mt9m114_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 	return 0;
 }
 
-/* This returns the exposure time being used. This should only be used
-   for filling in EXIF data, not for actual image processing. */
+/*
+ * This returns the exposure time being used. This should only be used
+ * for filling in EXIF data, not for actual image processing.
+ */
 static int mt9m114_g_exposure(struct v4l2_subdev *sd, s32 *value)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1247,7 +1255,8 @@ static int mt9m114_s_ev(struct v4l2_subdev *sd, s32 val)
 	s32 luma = 0x37;
 	int err;
 
-	/* EV value only support -2 to 2
+	/*
+	 * EV value only support -2 to 2
 	 * 0: 0x37, 1:0x47, 2:0x57, -1:0x27, -2:0x17
 	 */
 	if (val < -2 || val > 2)
@@ -1295,9 +1304,10 @@ static int mt9m114_g_ev(struct v4l2_subdev *sd, s32 *val)
 	return 0;
 }
 
-/* Fake interface
+/*
+ * Fake interface
  * mt9m114 now can not support 3a_lock
-*/
+ */
 static int mt9m114_s_3a_lock(struct v4l2_subdev *sd, s32 val)
 {
 	aaalock = val;
@@ -1843,7 +1853,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/*TODO add format code here*/
+	/* TODO add format code here */
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
 	dev->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index c17615149f46..4571f4328b80 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -127,7 +127,7 @@ static int ov2680_g_focal(struct v4l2_subdev *sd, s32 *val)
 
 static int ov2680_g_fnumber(struct v4l2_subdev *sd, s32 *val)
 {
-	/*const f number for ov2680*/
+	/* const f number for ov2680 */
 
 	*val = (OV2680_F_NUMBER_DEFAULT_NUM << 16) | OV2680_F_NUMBER_DEM;
 	return 0;
@@ -399,7 +399,8 @@ static long ov2680_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 	return 0;
 }
 
-/* This returns the exposure time being used. This should only be used
+/*
+ * This returns the exposure time being used. This should only be used
  * for filling in EXIF data, not for actual image processing.
  */
 static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
@@ -728,11 +729,13 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 	if (!dev || !dev->platform_data)
 		return -ENODEV;
 
-	/* The OV2680 documents only one GPIO input (#XSHUTDN), but
+	/*
+	 * The OV2680 documents only one GPIO input (#XSHUTDN), but
 	 * existing integrations often wire two (reset/power_down)
 	 * because that is the way other sensors work.  There is no
 	 * way to tell how it is wired internally, so existing
-	 * firmwares expose both and we drive them symmetrically. */
+	 * firmwares expose both and we drive them symmetrically.
+	 */
 	if (flag) {
 		ret = dev->platform_data->gpio0_ctrl(sd, 1);
 		usleep_range(10000, 15000);
@@ -978,7 +981,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto err;
 	}
 
-	/*recall flip functions to avoid flip registers
+	/*
+	 * recall flip functions to avoid flip registers
 	 * were overridden by default setting
 	 */
 	if (h_flag)
@@ -988,7 +992,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 
 	v4l2_info(client, "\n%s idx %d\n", __func__, dev->fmt_idx);
 
-	/*ret = startup(sd);
+	/*
+	 * ret = startup(sd);
 	 * if (ret)
 	 * dev_err(&client->dev, "ov2680 startup err\n");
 	 */
@@ -1097,7 +1102,8 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 	    (struct camera_sensor_platform_data *)platform_data;
 
 	mutex_lock(&dev->input_lock);
-	/* power off the module, then power on it in future
+	/*
+	 * power off the module, then power on it in future
 	 * as first power on by board may not fulfill the
 	 * power on sequqence needed by the module
 	 */
-- 
2.25.1



