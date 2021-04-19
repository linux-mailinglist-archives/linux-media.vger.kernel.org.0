Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5895364A51
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbhDSTQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241391AbhDSTQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:16:34 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F6AC06174A;
        Mon, 19 Apr 2021 12:16:03 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id p67so18910025pfp.10;
        Mon, 19 Apr 2021 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZFA6wRqeAt0LxdRockkfF0e4wQMEeO2UUm6nT8P02lg=;
        b=BzJtCumoVK6sgOXKGfrnGaKFpEO8Oqc8Q1I22P3ZpZSX/WZQT+UlieNBX50vvKy4J0
         0zGtPcczF7oV2YdsWM6JqAiws2r47LD+9CiNgu0SB4IKqJ82VldDbBJiqNjs6hkbxu09
         zF00m9HdczmIsK5Kz+Y4j2IyuISAxD6dH1gXCZL2l59nBd70d/PXlgO4xvEUcw8cgRxp
         PIKjXTAdh8WuhHDsHGDeeoKKzejFDd8QH3ds1sgIoxcvzKgBbvlP/yAH/JrRspLlhEEv
         JZTxFgtC/ZIh9P45npMGqMyFQDx9p7vrTPsK9tZHPkY1wTYzwWNFZz9os47VbSKtP/OK
         ZjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZFA6wRqeAt0LxdRockkfF0e4wQMEeO2UUm6nT8P02lg=;
        b=C22YyfxHP/J+aScCrO2EGVEBEB9PY4avRGyFwxwojelMyvKuebBty8lZbQ9uRRoxia
         E7RdPGnJS8fYJHQj1ITh0LDaJu+NmINvb1/BA74WKD8FmASZLQy5VNymW35ScGqIvVtt
         Q/ESQXAVRpCywWUufWlRAj+hKOm3PGnj7VUYf/uKfpH7QwcjlHiV/bCTR2fuXfdEorS/
         08N0EDA6S1eo8VnHMv6ZN8jMYF2I4kXE0gyVYuoVQsNVUi6YJjyNHzNXYf7JajBqICnG
         0KsxLWNE/k+cfVUTJj8f441bpRKxg1e+XN0veIsOAZamAR7TOu/eOT5ZYcXwgijB7PsB
         htAg==
X-Gm-Message-State: AOAM533fN/Zivra809rxEtuugZ5FZOOBwTHFKbLMiuGpNaV19vHfDREB
        Xsg9HDmdnOKI86Nl9Vsb/jw=
X-Google-Smtp-Source: ABdhPJw/CU+IGRICQKIl+lGIHHQObm1bLGs8UxWK9ZM7Sbqy0dZWf9b+snVupf6Cd+1VaeKbIVQgfg==
X-Received: by 2002:a63:4652:: with SMTP id v18mr13437333pgk.386.1618859763464;
        Mon, 19 Apr 2021 12:16:03 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id b6sm12697700pfa.185.2021.04.19.12.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:16:03 -0700 (PDT)
From:   Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date:   Tue, 20 Apr 2021 00:45:57 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 5/6] staging: media: atomisp: fix CamelCase variable naming
Message-ID: <17478627f128cdafed389b64ecf389d319295dd4.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mixed case variable names are discouraged and they result in checkpatch
script "Avoid CamelCase" warnings. Replace such CamelCase variable names
by lower case strings according to the coding style guidelines.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 160bb58ce708..e63906a69e30 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -999,10 +999,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
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
@@ -1010,27 +1010,27 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 
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
 
@@ -1047,38 +1047,38 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 
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
 
-	/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
+	/* analog_gain_to_write = (u16)((digital_gain << 12) | analog_gain_to_write);
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

