Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D79B72BA2D
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 10:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjFLIVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 04:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbjFLIUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 04:20:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43D7E71
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:20:47 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC639891;
        Mon, 12 Jun 2023 10:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686558017;
        bh=wOD1XCdavTYgPlExeqqfli7j9F12Be33/Um9dpJfG/Y=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=OQrfeJjdrLnelvFxE0QInwsVtNqBKLMSIRKdeg2elqhuHfCzLtm8cBFgupndEnpob
         7wk+hp973zLbL390ICgg73pmjkR6QAtXp9gcgZv9GQdDCf9VAuqBURvxYTeXoO1hVr
         uOi10OIpY3boKTdqY2ggpZ7rreUHYPSxXASsxohU=
Message-ID: <4f5bf176-da5f-ac67-b750-7e08bfdf3b50@ideasonboard.com>
Date:   Mon, 12 Jun 2023 09:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-5-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 04/28] media: ov2680: Use select VIDEO_V4L2_SUBDEV_API
In-Reply-To: <20230607164712.63579-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 07/06/2023 17:46, Hans de Goede wrote:
> Select VIDEO_V4L2_SUBDEV_API in Kconfig and drop the
> ifdef CONFIG_VIDEO_V4L2_SUBDEV_API checks, like other callers
> of v4l2_subdev_get_try_format() do.
>
> This is a preparation patch for fixing ov2680_set_fmt()
> which == V4L2_SUBDEV_FORMAT_TRY calls not properly filling in
> the passed in v4l2_mbus_framefmt struct.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
Not sure about Fixes on this one as I don't think it was necessarily broken before, but either way 
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/Kconfig  |  1 +
>   drivers/media/i2c/ov2680.c | 16 ++--------------
>   2 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8f55155afe67..791473fcbad3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -433,6 +433,7 @@ config VIDEO_OV2680
>   	tristate "OmniVision OV2680 sensor support"
>   	depends on VIDEO_DEV && I2C
>   	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
>   	select V4L2_FWNODE
>   	help
>   	  This is a Video4Linux2 sensor driver for the OmniVision
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index c1b23c5b7818..d90bbca6e913 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -559,7 +559,6 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>   {
>   	struct ov2680_dev *sensor = to_ov2680_dev(sd);
>   	struct v4l2_mbus_framefmt *fmt = NULL;
> -	int ret = 0;
>   
>   	if (format->pad != 0)
>   		return -EINVAL;
> @@ -567,22 +566,17 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>   	mutex_lock(&sensor->lock);
>   
>   	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>   		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
>   						 format->pad);
> -#else
> -		ret = -EINVAL;
> -#endif
>   	} else {
>   		fmt = &sensor->fmt;
>   	}
>   
> -	if (fmt)
> -		format->format = *fmt;
> +	format->format = *fmt;
>   
>   	mutex_unlock(&sensor->lock);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int ov2680_set_fmt(struct v4l2_subdev *sd,
> @@ -591,9 +585,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>   {
>   	struct ov2680_dev *sensor = to_ov2680_dev(sd);
>   	struct v4l2_mbus_framefmt *fmt = &format->format;
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>   	struct v4l2_mbus_framefmt *try_fmt;
> -#endif
>   	const struct ov2680_mode_info *mode;
>   	int ret = 0;
>   
> @@ -616,10 +608,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>   	}
>   
>   	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>   		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>   		format->format = *try_fmt;
> -#endif
>   		goto unlock;
>   	}
>   
> @@ -777,9 +767,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>   	v4l2_i2c_subdev_init(&sensor->sd, sensor->i2c_client,
>   			     &ov2680_subdev_ops);
>   
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>   	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> -#endif
>   	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>   	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>   
