Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A65E367260
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 20:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245162AbhDUSTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 14:19:34 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:38076 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242578AbhDUSTd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 14:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619029128; bh=QGDE19tRdfFTcPd5Ti2R00qSl1NvpwM0KLH6Vw3T74w=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=DKTy7VMFSKhh2WaYVO1SbvQ4/dJROva9mPY79Ye8t3plpEq6qvp4Gn9RLs9du8WNS
         trgQxADYGoJXN1dak7dChyBB4i8074JmAIXLCI1yaGsgWF3uq+V+Ij0VBZXa/g2CwY
         49NOe17wq9YwXwIEhe4upUmu38A5xB+M4+wDB5oU=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 20:18:47 +0200 (CEST)
X-EA-Auth: XGminHRn1fItr97eJlI2mhMG66Axebd+FL8F7jC5FrZB7Ne524iKzDHNJL42EJSfWhBm+gSjwqSbhA/p9/sIrvv//Mwd9qdg
Date:   Wed, 21 Apr 2021 23:48:41 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v3 5/6] staging: media: atomisp: fix CamelCase variable naming
Message-ID: <adf2e8a7f22a22e3b17f59fb79af4414935189fc.1619022192.git.drv@mailo.com>
References: <cover.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619022192.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mixed case variable names are discouraged and they result in checkpatch
script "Avoid CamelCase" warnings. Replace such CamelCase variable names
by lower case strings according to the coding style guidelines.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v2:
   - None.

Changes since v1:
   - None.

 .../media/atomisp/i2c/atomisp-mt9m114.c       | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f314e5fed9cb..6de2cee4363e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1000,10 +1000,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
 	int ret = 0;
 	unsigned int coarse_integration = 0;
-	unsigned int FLines = 0;
-	unsigned int FrameLengthLines = 0; /* ExposureTime.FrameLengthLines; */
-	unsigned int AnalogGain, DigitalGain;
-	u32 AnalogGainToWrite = 0;
+	unsigned int f_lines = 0;
+	unsigned int frame_len_lines = 0; /* ExposureTime.FrameLengthLines; */
+	unsigned int analog_gain, digital_gain;
+	u32 analog_gain_to_write = 0;
 
 	dev_dbg(&client->dev, "%s(0x%X 0x%X 0x%X)\n", __func__,
 		exposure->integration_time[0], exposure->gain[0],
@@ -1011,27 +1011,27 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 
 	coarse_integration = exposure->integration_time[0];
 	/* fine_integration = ExposureTime.FineIntegrationTime; */
-	/* FrameLengthLines = ExposureTime.FrameLengthLines; */
-	FLines = mt9m114_res[dev->res].lines_per_frame;
-	AnalogGain = exposure->gain[0];
-	DigitalGain = exposure->gain[1];
+	/* frame_len_lines = ExposureTime.FrameLengthLines; */
+	f_lines = mt9m114_res[dev->res].lines_per_frame;
+	analog_gain = exposure->gain[0];
+	digital_gain = exposure->gain[1];
 	if (!dev->streamon) {
 		/* Save the first exposure values while stream is off */
 		dev->first_exp = coarse_integration;
-		dev->first_gain = AnalogGain;
-		dev->first_diggain = DigitalGain;
+		dev->first_gain = analog_gain;
+		dev->first_diggain = digital_gain;
 	}
-	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
-	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
+	/* digital_gain = 0x400 * (((u16) digital_gain) >> 8) +		*/
+	/* ((unsigned int)(0x400 * (((u16) digital_gain) & 0xFF)) >>8);	*/
 
 	/* set frame length */
-	if (FLines < coarse_integration + 6)
-		FLines = coarse_integration + 6;
-	if (FLines < FrameLengthLines)
-		FLines = FrameLengthLines;
-	ret = mt9m114_write_reg(client, MISENSOR_16BIT, 0x300A, FLines);
+	if (f_lines < coarse_integration + 6)
+		f_lines = coarse_integration + 6;
+	if (f_lines < frame_len_lines)
+		f_lines = frame_len_lines;
+	ret = mt9m114_write_reg(client, MISENSOR_16BIT, 0x300A, f_lines);
 	if (ret) {
-		v4l2_err(client, "%s: fail to set FLines\n", __func__);
+		v4l2_err(client, "%s: fail to set f_lines\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1049,39 +1049,39 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 
 	/*
 	 * set analog/digital gain
-	switch(AnalogGain)
+	switch(analog_gain)
 	{
 	case 0:
-	  AnalogGainToWrite = 0x0;
+	  analog_gain_to_write = 0x0;
 	  break;
 	case 1:
-	  AnalogGainToWrite = 0x20;
+	  analog_gain_to_write = 0x20;
 	  break;
 	case 2:
-	  AnalogGainToWrite = 0x60;
+	  analog_gain_to_write = 0x60;
 	  break;
 	case 4:
-	  AnalogGainToWrite = 0xA0;
+	  analog_gain_to_write = 0xA0;
 	  break;
 	case 8:
-	  AnalogGainToWrite = 0xE0;
+	  analog_gain_to_write = 0xE0;
 	  break;
 	default:
-	  AnalogGainToWrite = 0x20;
+	  analog_gain_to_write = 0x20;
 	  break;
 	}
 	*/
-	if (DigitalGain >= 16 || DigitalGain <= 1)
-		DigitalGain = 1;
+	if (digital_gain >= 16 || digital_gain <= 1)
+		digital_gain = 1;
 
 	/*
 	 * AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
 	 */
-	AnalogGainToWrite = (u16)((DigitalGain << 12) | (u16)AnalogGain);
+	analog_gain_to_write = (u16)((digital_gain << 12) | (u16)analog_gain);
 	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
-				REG_GAIN, AnalogGainToWrite);
+				REG_GAIN, analog_gain_to_write);
 	if (ret) {
-		v4l2_err(client, "%s: fail to set AnalogGainToWrite\n",
+		v4l2_err(client, "%s: fail to set analog_gain_to_write\n",
 			 __func__);
 		return -EINVAL;
 	}
-- 
2.25.1



