Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3976036E58B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhD2HHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhD2HHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:07:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6212C06138B;
        Thu, 29 Apr 2021 00:06:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id d14so13436182edc.12;
        Thu, 29 Apr 2021 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2/EHbQwcBS9P0W2EI98h0uZhRTPpXomxsVfaTj58/fg=;
        b=Yl2MPvzBo98jsZnBxyjC82PzkyODnMgoKli9q6kdtW2DkfSEQgQWNI1339/gZowz7z
         dWFARwF1RuakZYok7yJklLKSLElkvUmHx7D+iGu05tKPbPFXB1Yw4gRmfx1y8AEqqxv6
         TpBgKeB/PO3INk7VkIKUIxVPhBEwKAPylhNUqfaj5NJF8gB2Nb0ls66OQrOax+R4agdy
         DZh5hYiw+TwTkHpnDylY0PMAhdPeJ8+1bnt1GXf24lTaojR6zZvdheU5wrR9a0bLm4eN
         XBqqmAqhN/RM6sFrtjSS9PzQzMA0bQn6nBOZjTkOtv8wIP5G0HZIa0Cp5JmskSKapWlq
         GvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2/EHbQwcBS9P0W2EI98h0uZhRTPpXomxsVfaTj58/fg=;
        b=Iynp/QQqKevlmHF3enVfRBU2X0EowlVqMbDNIPAXoiUMvDa4eU5VwWzNZ9kMScVb/t
         nuTKFmZPFTayxrUXQ6KGfNGwHUbtE+tPnwQQ0lBH137ykUTuC74kfBtxy6iLb3t2V7Bh
         G4XHuTSvwLTPpWmA5m71Yf1abVPVzxwIHCfvJzD8F0jalInif7nNsyObP49Zmar3au6X
         M46xyNlbk/vSFa6Sh1tEkEAOO8tQ2QJN7mv8dBqq2tiKVETHg7sedSYAWAT7+UirsKE4
         ZREBXNCplvWXpWlKSJCz66ZFCv2eRqxAmK1PUT0W/UmYFTz3dYvnIgvkjT8vgeP91qxB
         3RTA==
X-Gm-Message-State: AOAM530bvXTxyAQQ+dmXGtriocfYho/dsXJD5NvZk+EXJOtHs/JleHAF
        NzAJmPRzgnwzqSwr/praCiokl/o5jcDGHQ==
X-Google-Smtp-Source: ABdhPJwoWlD16bzODlbIxiF3g0+/kSBbWky2sQRBI5IvptgXS1OPC5jgeqDSNlZXV8nFN6aWcYAVXA==
X-Received: by 2002:a50:eb0d:: with SMTP id y13mr15991518edp.326.1619679975917;
        Thu, 29 Apr 2021 00:06:15 -0700 (PDT)
Received: from agape.jhs ([5.171.81.14])
        by smtp.gmail.com with ESMTPSA id mp36sm1244477ejc.48.2021.04.29.00.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 00:06:15 -0700 (PDT)
Date:   Thu, 29 Apr 2021 09:06:12 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210429070611.GA1409@agape.jhs>
References: <cover.1619630709.git.drv@mailo.com>
 <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

On Wed, Apr 28, 2021 at 11:38:45PM +0530, Deepak R Varma wrote:
> Reformat code comment blocks according to the coding style guidelines.
> This resolves different checkpatch script WARNINGs around block comments.
> 
> Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes since v3:
>    - Include additional header files in the clean up
> Changes since v2:
>    - Tag Fabio Auito for the patch suggestion
> 
> Changes in v1:
>    - implement following changes suggested by Fabio Aiuto
>        a. Corrected commenting style
>        b. Similar style implemented for other comment blocks in
>           the same files.
> 
>  .../media/atomisp/i2c/atomisp-gc2235.c        | 19 ++++---
>  .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  6 ++-
>  .../media/atomisp/i2c/atomisp-mt9m114.c       | 49 ++++++++++++-------
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 20 +++++---
>  drivers/staging/media/atomisp/i2c/mt9m114.h   |  3 +-
>  drivers/staging/media/atomisp/i2c/ov2680.h    | 10 ++--
>  6 files changed, 65 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 548c572d3b57..6ee6e8414f0e 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -228,7 +228,7 @@ static int gc2235_g_focal(struct v4l2_subdev *sd, s32 *val)
>  
>  static int gc2235_g_fnumber(struct v4l2_subdev *sd, s32 *val)
>  {
> -	/*const f number for imx*/
> +	/* const f number for imx */
>  	*val = (GC2235_F_NUMBER_DEFAULT_NUM << 16) | GC2235_F_NUMBER_DEM;
>  	return 0;
>  }
> @@ -427,7 +427,8 @@ static long gc2235_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
>  	return 0;
>  }
>  
> -/* This returns the exposure time being used. This should only be used
> +/*
> + * This returns the exposure time being used. This should only be used
>   * for filling in EXIF data, not for actual image processing.
>   */
>  static int gc2235_q_exposure(struct v4l2_subdev *sd, s32 *value)
> @@ -746,11 +747,12 @@ static int startup(struct v4l2_subdev *sd)
>  	int ret = 0;
>  
>  	if (is_init == 0) {
> -		/* force gc2235 to do a reset in res change, otherwise it
> -		* can not output normal after switching res. and it is not
> -		* necessary for first time run up after power on, for the sack
> -		* of performance
> -		*/
> +		/*
> +		 * force gc2235 to do a reset in res change, otherwise it
> +		 * can not output normal after switching res. and it is not
> +		 * necessary for first time run up after power on, for the sack
> +		 * of performance
> +		 */
>  		power_down(sd);
>  		power_up(sd);
>  		gc2235_write_reg_array(client, gc2235_init_settings);
> @@ -904,7 +906,8 @@ static int gc2235_s_config(struct v4l2_subdev *sd,
>  	    (struct camera_sensor_platform_data *)platform_data;
>  
>  	mutex_lock(&dev->input_lock);
> -	/* power off the module, then power on it in future
> +	/*
> +	 * power off the module, then power on it in future
>  	 * as first power on by board may not fulfill the
>  	 * power on sequqence needed by the module
>  	 */
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> index b93c80471f22..7a20d918a9d5 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> @@ -50,14 +50,16 @@ struct tbd_data_record_header {
>  static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
>  				 unsigned int size)
>  {
> -	/* The configuration data contains any number of sequences where
> +	/*
> +	 * The configuration data contains any number of sequences where
>  	 * the first byte (that is, uint8_t) that marks the number of bytes
>  	 * in the sequence to follow, is indeed followed by the indicated
>  	 * number of bytes of actual data to be written to sensor.
>  	 * By convention, the first two bytes of actual data should be
>  	 * understood as an address in the sensor address space (hibyte
>  	 * followed by lobyte) where the remaining data in the sequence
> -	 * will be written. */
> +	 * will be written.
> +	 */
>  
>  	u8 *ptr = bufptr;
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 465fc4468442..a5f0b4848ddf 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -475,10 +475,12 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
>  	if (!dev || !dev->platform_data)
>  		return -ENODEV;
>  
> -	/* Note: current modules wire only one GPIO signal (RESET#),
> +	/*
> +	 * Note: current modules wire only one GPIO signal (RESET#),
>  	 * but the schematic wires up two to the connector.  BIOS
>  	 * versions have been unfortunately inconsistent with which
> -	 * ACPI index RESET# is on, so hit both */
> +	 * ACPI index RESET# is on, so hit both
> +	 */
>  
>  	if (flag) {
>  		ret = dev->platform_data->gpio0_ctrl(sd, 0);
> @@ -560,7 +562,7 @@ static int power_down(struct v4l2_subdev *sd)
>  	if (ret)
>  		dev_err(&client->dev, "vprog failed.\n");
>  
> -	/*according to DS, 20ms is needed after power down*/
> +	/* according to DS, 20ms is needed after power down */
>  	msleep(20);
>  
>  	return ret;
> @@ -947,7 +949,7 @@ static int mt9m114_g_focal(struct v4l2_subdev *sd, s32 *val)
>  
>  static int mt9m114_g_fnumber(struct v4l2_subdev *sd, s32 *val)
>  {
> -	/*const f number for mt9m114*/
> +	/* const f number for mt9m114 */
>  	*val = (MT9M114_F_NUMBER_DEFAULT_NUM << 16) | MT9M114_F_NUMBER_DEM;
>  	return 0;
>  }
> @@ -1008,8 +1010,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  		exposure->gain[1]);
>  
>  	coarse_integration = exposure->integration_time[0];
> -	/* fine_integration = ExposureTime.FineIntegrationTime; */
> -	/* FrameLengthLines = ExposureTime.FrameLengthLines; */
> +	/*
> +	 * fine_integration = ExposureTime.FineIntegrationTime;
> +	 * FrameLengthLines = ExposureTime.FrameLengthLines;
> +	 */
>  	FLines = mt9m114_res[dev->res].lines_per_frame;
>  	AnalogGain = exposure->gain[0];
>  	DigitalGain = exposure->gain[1];
> @@ -1019,8 +1023,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  		dev->first_gain = AnalogGain;
>  		dev->first_diggain = DigitalGain;
>  	}
> -	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +
> -	((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8); */
> +	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
> +	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
>  
>  	/* set frame length */
>  	if (FLines < coarse_integration + 6)
> @@ -1034,8 +1038,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	}
>  
>  	/* set coarse integration */
> -	/* 3A provide real exposure time.
> -		should not translate to any value here. */
> +	/*
> +	 * 3A provide real exposure time.
> +	 * should not translate to any value here.
> +	 */
>  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
>  				REG_EXPO_COARSE, (u16)(coarse_integration));
>  	if (ret) {
> @@ -1044,7 +1050,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	}
>  
>  	/*
> -	// set analog/digital gain
> +	 * set analog/digital gain
>  	switch(AnalogGain)
>  	{
>  	case 0:
> @@ -1069,8 +1075,9 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	*/
>  	if (DigitalGain >= 16 || DigitalGain <= 1)
>  		DigitalGain = 1;
> -	/* AnalogGainToWrite =
> -		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
> +	/*
> +	 * AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
> +	 */
>  	AnalogGainToWrite = (u16)((DigitalGain << 12) | (u16)AnalogGain);
>  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
>  				REG_GAIN, AnalogGainToWrite);
> @@ -1095,8 +1102,10 @@ static long mt9m114_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
>  	return 0;
>  }
>  
> -/* This returns the exposure time being used. This should only be used
> -   for filling in EXIF data, not for actual image processing. */
> +/*
> + * This returns the exposure time being used. This should only be used
> + * for filling in EXIF data, not for actual image processing.
> + */
>  static int mt9m114_g_exposure(struct v4l2_subdev *sd, s32 *value)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> @@ -1247,7 +1256,8 @@ static int mt9m114_s_ev(struct v4l2_subdev *sd, s32 val)
>  	s32 luma = 0x37;
>  	int err;
>  
> -	/* EV value only support -2 to 2
> +	/*
> +	 * EV value only support -2 to 2
>  	 * 0: 0x37, 1:0x47, 2:0x57, -1:0x27, -2:0x17
>  	 */
>  	if (val < -2 || val > 2)
> @@ -1295,9 +1305,10 @@ static int mt9m114_g_ev(struct v4l2_subdev *sd, s32 *val)
>  	return 0;
>  }
>  
> -/* Fake interface
> +/*
> + * Fake interface
>   * mt9m114 now can not support 3a_lock
> -*/
> + */
>  static int mt9m114_s_3a_lock(struct v4l2_subdev *sd, s32 val)
>  {
>  	aaalock = val;
> @@ -1843,7 +1854,7 @@ static int mt9m114_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> -	/*TODO add format code here*/
> +	/* TODO add format code here */
>  	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	dev->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index a51ad9843d39..d5fa3ea624ef 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -127,7 +127,7 @@ static int ov2680_g_focal(struct v4l2_subdev *sd, s32 *val)
>  
>  static int ov2680_g_fnumber(struct v4l2_subdev *sd, s32 *val)
>  {
> -	/*const f number for ov2680*/
> +	/* const f number for ov2680 */
>  
>  	*val = (OV2680_F_NUMBER_DEFAULT_NUM << 16) | OV2680_F_NUMBER_DEM;
>  	return 0;
> @@ -399,7 +399,8 @@ static long ov2680_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
>  	return 0;
>  }
>  
> -/* This returns the exposure time being used. This should only be used
> +/*
> + * This returns the exposure time being used. This should only be used
>   * for filling in EXIF data, not for actual image processing.
>   */
>  static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
> @@ -727,11 +728,13 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
>  	if (!dev || !dev->platform_data)
>  		return -ENODEV;
>  
> -	/* The OV2680 documents only one GPIO input (#XSHUTDN), but
> +	/*
> +	 * The OV2680 documents only one GPIO input (#XSHUTDN), but
>  	 * existing integrations often wire two (reset/power_down)
>  	 * because that is the way other sensors work.  There is no
>  	 * way to tell how it is wired internally, so existing
> -	 * firmwares expose both and we drive them symmetrically. */
> +	 * firmwares expose both and we drive them symmetrically.
> +	 */
>  	if (flag) {
>  		ret = dev->platform_data->gpio0_ctrl(sd, 1);
>  		usleep_range(10000, 15000);
> @@ -977,7 +980,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  		goto err;
>  	}
>  
> -	/*recall flip functions to avoid flip registers
> +	/*
> +	 * recall flip functions to avoid flip registers
>  	 * were overridden by default setting
>  	 */
>  	if (h_flag)
> @@ -987,7 +991,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  
>  	v4l2_info(client, "\n%s idx %d\n", __func__, dev->fmt_idx);
>  
> -	/*ret = startup(sd);
> +	/*
> +	 * ret = startup(sd);
>  	 * if (ret)
>  	 * dev_err(&client->dev, "ov2680 startup err\n");
>  	 */
> @@ -1096,7 +1101,8 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  	    (struct camera_sensor_platform_data *)platform_data;
>  
>  	mutex_lock(&dev->input_lock);
> -	/* power off the module, then power on it in future
> +	/*
> +	 * power off the module, then power on it in future
>  	 * as first power on by board may not fulfill the
>  	 * power on sequqence needed by the module
>  	 */
> diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
> index 787bbf59e895..aad98f37aaa6 100644
> --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
> +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
> @@ -765,7 +765,8 @@ static struct misensor_reg const mt9m114_common[] = {
>  	{MISENSOR_16BIT, 0xC868, 0x0280}, /* cam_output_width = 952 */
>  	{MISENSOR_16BIT, 0xC86A, 0x01E0}, /* cam_output_height = 538 */
>  	/* LOAD = Step3-Recommended
> -	 * Patch,Errata and Sensor optimization Setting */
> +	 * Patch,Errata and Sensor optimization Setting
> +	 */

	/*
	 * LOAD = Step3-Recommended

:(


>  	{MISENSOR_16BIT, 0x316A, 0x8270}, /* DAC_TXLO_ROW */
>  	{MISENSOR_16BIT, 0x316C, 0x8270}, /* DAC_TXLO */
>  	{MISENSOR_16BIT, 0x3ED0, 0x2305}, /* DAC_LD_4_5 */
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 49920245e064..4d43b45915e5 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -459,8 +459,8 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
>  };
>  
>  /*
> -* 800x600 30fps  VBlanking 1lane 10Bit (binning)
> -*/
> + * 800x600 30fps  VBlanking 1lane 10Bit (binning)
> + */
>  static struct ov2680_reg const ov2680_720x592_30fps[] = {
>  	{0x3086, 0x01},
>  	{0x3501, 0x26},
> @@ -504,8 +504,8 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
>  };
>  
>  /*
> -* 800x600 30fps  VBlanking 1lane 10Bit (binning)
> -*/
> + * 800x600 30fps  VBlanking 1lane 10Bit (binning)
> + */
>  static struct ov2680_reg const ov2680_800x600_30fps[] = {
>  	{0x3086, 0x01},
>  	{0x3501, 0x26},
> @@ -634,7 +634,7 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
>  
>  /*
>   *   1456*1096 30fps  VBlanking 1lane 10bit(no-scaling)
> -*/
> + */
>  static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
>  	{0x3086, 0x00},
>  	{0x3501, 0x48},
> -- 
> 2.31.1
> 
> 
> 
> 

thank you,

fabio
