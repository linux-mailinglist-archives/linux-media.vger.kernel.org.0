Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9AC36DECB
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243476AbhD1SKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:10:21 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:55656 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231966AbhD1SKU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633366; bh=NiHwN0Ne4hoFiKByNpMVtvVKTgRdrwrvSWAj5Od4W1k=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=lMcElL4CyWK5M9P+s6icIu13usVV2FFXN7ppuc3luuH0/uvGJXoSR9BmEWxWWWig8
         G1w5vzPQ5RdplxE5K/QvGKXdiqOp25gFXBgWICcxLbrBhARtJOJtrIJtSqx7t5dX5Q
         FxyXcWbfVXjOgd9sD8teahboyLmRE9FMUe0BlGj8=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:09:26 +0200 (CEST)
X-EA-Auth: sJSefPjrBvDYmxaeFfvAItCNJ6lhQ1yqNJ6PfUF+vmxvThF3wkkIcGZ3t2qp4MLa6OhlSHfVV3MlbeYVbA4rT/7UYS4fKzjY
Date:   Wed, 28 Apr 2021 23:39:20 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 6/9] staging: media: atomisp: fix CamelCase variable naming
Message-ID: <5c652f9facb5e2e52c8936aa7f6f7c646df60ab2.1619630709.git.drv@mailo.com>
References: <cover.1619630709.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619630709.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mixed case variable names are discouraged and they result in checkpatch
script "Avoid CamelCase" warnings. Replace such CamelCase variable names
by lower case strings according to the coding style guidelines.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v3:
   - None.
Changes since v2:
   - None.
Changes since v1:
   - None.


 .../media/atomisp/i2c/atomisp-mt9m114.c       | 63 ++++++++++---------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index a5f0b4848ddf..0a6f8f68b215 100644
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
@@ -1012,28 +1012,28 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	coarse_integration = exposure->integration_time[0];
 	/*
 	 * fine_integration = ExposureTime.FineIntegrationTime;
-	 * FrameLengthLines = ExposureTime.FrameLengthLines;
+	 * frame_len_lines = ExposureTime.FrameLengthLines;
 	 */
-	FLines = mt9m114_res[dev->res].lines_per_frame;
-	AnalogGain = exposure->gain[0];
-	DigitalGain = exposure->gain[1];
+	f_lines = mt9m114_res[dev->res].lines_per_frame;
+	analog_gain = exposure->gain[0];
+	digital_gain = exposure->gain[1];
 	if (!dev->streamon) {
 		/*Save the first exposure values while stream is off*/
 		dev->first_exp = coarse_integration;
-		dev->first_gain = AnalogGain;
-		dev->first_diggain = DigitalGain;
+		dev->first_gain = analog_gain;
+		dev->first_diggain = digital_gain;
 	}
-	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
-	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
+	/* digital_gain = 0x400 * (((u16) digital_gain) >> 8) +		*/
+	/* ((unsigned int)(0x400 * (((u16) digital_gain) & 0xFF)) >>8); */
 
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
 
@@ -1051,38 +1051,39 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 
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
-	 * AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
+	 * analog_gain_to_write = (u16)((digital_gain << 12)
+	 *				| analog_gain_to_write);
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
2.31.1



