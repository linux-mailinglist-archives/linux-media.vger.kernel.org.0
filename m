Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4665A78AFF7
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 14:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjH1MUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbjH1MUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 08:20:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD817136
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 05:19:58 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-240.net.vodafone.it [5.91.19.240])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 721DA814;
        Mon, 28 Aug 2023 14:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693225116;
        bh=RhxnUfmTq46VKvQZjON3PzfEBlMGBkyfXHq4dS8T3ds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h3msXyO7UOxRHb7ZhZqwvX0Lk8ertD/TfHsByczO22sW0tPFcYHH7uKWQwmjQc5Et
         H5t51k0SRWO+LgZsFPAkc/NLjiuCaqQOXF+ofPs5YmcYjaySZmXmdmd6gPmm49G90c
         c8CxRBDwfL++LITSv6MQn8adbf7hD7jkNdUTwTPI=
Date:   Mon, 28 Aug 2023 14:19:54 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v1 2/2] media: i2c: imx219: Fix crop rectangle setting
 when changing format
Message-ID: <ujpugw52leros2siag4wtvxhwkmnsazwdiofvpvtugjrvc5zvv@v4u26p6a7dnj>
References: <20230814193435.24158-1-laurent.pinchart@ideasonboard.com>
 <20230814193435.24158-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230814193435.24158-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, Aug 14, 2023 at 10:34:35PM +0300, Laurent Pinchart wrote:
> When moving the imx219 driver to the subdev active state, commit
> e8a5b1df000e ("media: i2c: imx219: Use subdev active state") used the
> pad crop rectangle stored in the subdev state to report the crop
> rectangle of the active mode. That crop rectangle was however not set in
> the state when setting the format, which resulted in reporting an
> incorrect crop rectangle to userspace. Fix it.
>
> Fixes: e8a5b1df000e ("media: i2c: imx219: Use subdev active state")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6f88e002c8d8..ec53abe2e84e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -750,6 +750,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx219_mode *mode;
>  	int exposure_max, exposure_def, hblank;
>  	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *crop;
>
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
> @@ -757,10 +758,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  				      fmt->format.width, fmt->format.height);
>
>  	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> -	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
>
> -	if (imx219->mode == mode && format->code == fmt->format.code)
> -		return 0;

Has this check been lost ?

> +	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> +
> +	*format = fmt->format;
> +	*crop = mode->crop;
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx219->mode = mode;
> @@ -788,8 +791,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					 hblank);
>  	}
>
> -	*format = fmt->format;
> -
>  	return 0;
>  }
>
> --
> Regards,
>
> Laurent Pinchart
>
