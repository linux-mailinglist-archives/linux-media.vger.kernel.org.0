Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D81860DC07
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 09:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbiJZHWt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 03:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiJZHWr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 03:22:47 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FBA76541
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 00:22:46 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 718E62018F;
        Wed, 26 Oct 2022 10:22:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1666768963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Xykj1LMwsyZvHAz2xeG7Ix80ST1XRQOPWyuA6giI6r0=;
        b=CtYoJF03TaLZgyRUYZCAPhsMRKtYMp+TBSzYv+3V4fhzKlVaP9gBnhIYxz8cNU/uw3Wwc8
        KDoweElV5JSjtZDv4H2BerLHTOAt/R02lYwu5JcEDhFGFcQ8JPTUjqoN7K2YhpAttem6SN
        xdlQkyZEGaeeiX2J6c0+sv7zJ9GxBGY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1666768963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Xykj1LMwsyZvHAz2xeG7Ix80ST1XRQOPWyuA6giI6r0=;
        b=wOpxfvUafJQpyi9Unnu6s1b2ai+5t7m2QrKnwuoZ8nF2nOCd0q6e4DXjBHuMEL/+Rcq4Hb
        48J2lIIPohae0she2MLedNJmFILuwdmrF61zFvIdLa4UxG3rirHrzRJRHWdl/sh5eTTWoc
        n7jRFGatv+orNMKh7itxqEzeRY/xKnw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1666768963; a=rsa-sha256; cv=none;
        b=e37jN0UeJ//377fZ/rtO/tiNe6u0sRGy6dc6HVu11ZGYHv+UOOxHSVKHShRmERH4cbCX+A
        nHk0fKTMNftsAYiVwG6qvPBKvarV2Vrpm443qEyLED5oFgamgscICMVxq4Ctaul0MX8fvG
        ZpOfYyLp9n2uggkbvV4WkNmEV1xknY0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 089B0634DB0;
        Wed, 26 Oct 2022 10:22:43 +0300 (EEST)
Date:   Wed, 26 Oct 2022 10:22:42 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 05/16] media: i2c: ov9281: Support more than 1 mode.
Message-ID: <Y1jgQufUcERIKyJP@valkosipuli.retiisi.eu>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-6-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:27:58PM +0100, Dave Stevenson wrote:
> The driver currently has multiple assumptions that there is
> only one supported mode.
> 
> Convert supported_mode to an array, and fix up all references
> to correctly look at that array.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 44 ++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 798ff8ba50bd..f7823d584522 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -262,20 +262,24 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  };
>  
>  /* Supported sensor mode configurations */
> -static const struct ov9282_mode supported_mode = {
> -	.width = 1280,
> -	.height = 720,
> -	.hblank = 250,
> -	.vblank = 1022,
> -	.vblank_min = 151,
> -	.vblank_max = 51540,
> -	.link_freq_idx = 0,
> -	.reg_list = {
> -		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> -		.regs = mode_1280x720_regs,
> +static const struct ov9282_mode supported_modes[] = {
> +	{
> +		.width = 1280,
> +		.height = 720,
> +		.hblank = 250,
> +		.vblank = 1022,
> +		.vblank_min = 151,
> +		.vblank_max = 51540,
> +		.link_freq_idx = 0,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> +			.regs = mode_1280x720_regs,
> +		},
>  	},
>  };
>  
> +#define OV9282_NUM_MODES ARRAY_SIZE(supported_modes)

I think the code would be cleaner without the additional macro, i.e. always
using ARRAY_SIZE(supported_modes).

> +
>  /**
>   * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
>   * @subdev: pointer to ov9282 V4L2 sub-device
> @@ -536,15 +540,15 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fsize)
>  {
> -	if (fsize->index > 0)
> +	if (fsize->index >= OV9282_NUM_MODES)
>  		return -EINVAL;
>  
>  	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
>  		return -EINVAL;
>  
> -	fsize->min_width = supported_mode.width;
> +	fsize->min_width = supported_modes[fsize->index].width;
>  	fsize->max_width = fsize->min_width;
> -	fsize->min_height = supported_mode.height;
> +	fsize->min_height = supported_modes[fsize->index].height;
>  	fsize->max_height = fsize->min_height;
>  
>  	return 0;
> @@ -619,7 +623,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&ov9282->mutex);
>  
> -	mode = &supported_mode;
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      OV9282_NUM_MODES,
> +				      width, height,
> +				      fmt->format.width,
> +				      fmt->format.height);
>  	ov9282_fill_pad_format(ov9282, mode, fmt);
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> @@ -652,7 +660,7 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_subdev_format fmt = { 0 };
>  
>  	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> -	ov9282_fill_pad_format(ov9282, &supported_mode, &fmt);
> +	ov9282_fill_pad_format(ov9282, &supported_modes[0], &fmt);
>  
>  	return ov9282_set_pad_format(sd, sd_state, &fmt);
>  }
> @@ -1081,8 +1089,8 @@ static int ov9282_probe(struct i2c_client *client)
>  		goto error_power_off;
>  	}
>  
> -	/* Set default mode to max resolution */
> -	ov9282->cur_mode = &supported_mode;
> +	/* Set default mode to first mode */
> +	ov9282->cur_mode = &supported_modes[0];
>  	ov9282->vblank = ov9282->cur_mode->vblank;
>  
>  	ret = ov9282_init_controls(ov9282);

-- 
Kind regards,

Sakari Ailus
