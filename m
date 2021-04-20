Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743DC36546D
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhDTIpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 04:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhDTIpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 04:45:24 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB15C06174A;
        Tue, 20 Apr 2021 01:44:53 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r12so57066895ejr.5;
        Tue, 20 Apr 2021 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wvaxkpeSGZzWlZGg7ax8Z6wOqFvxPkE1sOA1pAgV7dg=;
        b=E7O7p29eOelCDzJhhlQ3n/LvzhWb8tSdn0chkFsLvC8EjTfobeMJmKYtmLI5pOGfli
         f1Pm/u06zMx0CJmq59GV8+oqPw814WILdnzMBeP8LhvdebVKDhPUsOytJp8kOdeuYFN1
         YiWMc9cxcgsMC7XwMjV1X5Q0kYE0AE/kwxw204DQdBH7SgLxMK7q8Gk6T3rJCDhLjbT9
         2SSPGcOff0f6BJ/wySijsiCdlrdqcxtQ2hi7SCI7bl9uYsLwTuRXaZXaEr6T/sAEd6pR
         293LKwDMs4qoph0yJTFUnEpe+3LsXgqCeaOUEpa/F7oD6v9uV+WgTW9V3MwCenCHLAUj
         KgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wvaxkpeSGZzWlZGg7ax8Z6wOqFvxPkE1sOA1pAgV7dg=;
        b=D0mKfPxgeFRq0aIObuuPJRpQQ7OkNHgxGcZVPc7u2WdVfN95AFjCSSYWQWy0kvS4xd
         mNjm3okaOS7KRqJCNjBLPb7LxAoNzT7Ws+JDKk8D27+6chxWySg6LZtDM++Xc9xeBLho
         WDz1kW/iFk/uK0QlRxhXiBKgz3OnPFV9ZFZom0kCMsv9guRn9Yboex9o9TipzDk0vW2g
         W5oqA0KdUcfZGVgpOXidWfMXT7+8YX4UH9d5q/3WRF+eKHF5ABv2Au1GeblUfyDmjnru
         GbiwJBTY6g/dazlpl12iKI5VI/gVELFHpfuF0x3oD5fQKHjBGkHGMv/4uLqXgHvvVDoq
         hCxg==
X-Gm-Message-State: AOAM531eLYXD4gR28JM/BxF63R/h+bHLBCniJUWB9gq354mcCHgEJk+U
        ftzyM/YXUTXcSbuPA1hCtIQ=
X-Google-Smtp-Source: ABdhPJwoWqZ2ieZIutUTyBW85vvyDH5D+Tok3hiR2DzIx24ZkPw3Ele00WzvVcOwf0LhTZC3FxEB1w==
X-Received: by 2002:a17:906:1e49:: with SMTP id i9mr20104612ejj.536.1618908291807;
        Tue, 20 Apr 2021 01:44:51 -0700 (PDT)
Received: from agape.jhs ([5.171.72.235])
        by smtp.gmail.com with ESMTPSA id q10sm11484065eds.26.2021.04.20.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 01:44:51 -0700 (PDT)
Date:   Tue, 20 Apr 2021 10:44:48 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <mh12gx2825@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: media: atomisp: reformat code comment blocks
Message-ID: <20210420084448.GC1411@agape.jhs>
References: <cover.1618859059.git.drv@mailo.com>
 <7cf7b8253550460e7273c94bae005939000679fd.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cf7b8253550460e7273c94bae005939000679fd.1618859059.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 20, 2021 at 12:45:04AM +0530, Deepak R Varma wrote:
> Reformat code comment blocks according to the coding style guidelines.
> This resolves different checkpatch script WARNINGs around block comments.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  .../media/atomisp/i2c/atomisp-gc2235.c        |  8 +++----
>  .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  3 ++-
>  .../media/atomisp/i2c/atomisp-mt9m114.c       | 22 +++++++++++--------
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  3 ++-
>  4 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 548c572d3b57..a585d73665a6 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -747,10 +747,10 @@ static int startup(struct v4l2_subdev *sd)
>  
>  	if (is_init == 0) {
>  		/* force gc2235 to do a reset in res change, otherwise it
> -		* can not output normal after switching res. and it is not
> -		* necessary for first time run up after power on, for the sack
> -		* of performance
> -		*/
> +		 * can not output normal after switching res. and it is not
> +		 * necessary for first time run up after power on, for the sack
> +		 * of performance
> +		 */
>  		power_down(sd);
>  		power_up(sd);
>  		gc2235_write_reg_array(client, gc2235_init_settings);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> index b93c80471f22..750b3484eb19 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> @@ -57,7 +57,8 @@ static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
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
> index 465fc4468442..160bb58ce708 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -478,7 +478,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
>  	/* Note: current modules wire only one GPIO signal (RESET#),
>  	 * but the schematic wires up two to the connector.  BIOS
>  	 * versions have been unfortunately inconsistent with which
> -	 * ACPI index RESET# is on, so hit both */
> +	 * ACPI index RESET# is on, so hit both
> +	 */
>  
>  	if (flag) {
>  		ret = dev->platform_data->gpio0_ctrl(sd, 0);
> @@ -1019,8 +1020,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
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
> @@ -1035,7 +1036,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  
>  	/* set coarse integration */
>  	/* 3A provide real exposure time.
> -		should not translate to any value here. */
> +	 * should not translate to any value here.
> +	 */
>  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
>  				REG_EXPO_COARSE, (u16)(coarse_integration));
>  	if (ret) {
> @@ -1044,7 +1046,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	}
>  
>  	/*
> -	// set analog/digital gain
> +	 * set analog/digital gain
>  	switch(AnalogGain)
>  	{
>  	case 0:
> @@ -1069,8 +1071,9 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	*/
>  	if (DigitalGain >= 16 || DigitalGain <= 1)
>  		DigitalGain = 1;
> -	/* AnalogGainToWrite =
> -		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
> +
> +	/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
> +	 */

this is best recommended for one line comment:

/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite); */



>  	AnalogGainToWrite = (u16)((DigitalGain << 12) | (u16)AnalogGain);
>  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
>  				REG_GAIN, AnalogGainToWrite);
> @@ -1096,7 +1099,8 @@ static long mt9m114_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
>  }
>  
>  /* This returns the exposure time being used. This should only be used
> -   for filling in EXIF data, not for actual image processing. */
> + * for filling in EXIF data, not for actual image processing.
> + */
>  static int mt9m114_g_exposure(struct v4l2_subdev *sd, s32 *value)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> @@ -1297,7 +1301,7 @@ static int mt9m114_g_ev(struct v4l2_subdev *sd, s32 *val)
>  
>  /* Fake interface
>   * mt9m114 now can not support 3a_lock
> -*/
> + */
>  static int mt9m114_s_3a_lock(struct v4l2_subdev *sd, s32 val)
>  {
>  	aaalock = val;
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index c17615149f46..91dca275a08e 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -732,7 +732,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
>  	 * existing integrations often wire two (reset/power_down)
>  	 * because that is the way other sensors work.  There is no
>  	 * way to tell how it is wired internally, so existing
> -	 * firmwares expose both and we drive them symmetrically. */
> +	 * firmwares expose both and we drive them symmetrically.
> +	 */
>  	if (flag) {
>  		ret = dev->platform_data->gpio0_ctrl(sd, 1);
>  		usleep_range(10000, 15000);
> -- 
> 2.25.1
> 
> 

multiline comment format should appear this way:

	/*
	 * This is a comment, a
	 * multiline one.
	 */

with the first line of the comment empty.

thank you,

fabio
