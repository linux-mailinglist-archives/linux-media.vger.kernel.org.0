Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829857911EA
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 09:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjIDHQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 03:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbjIDHQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 03:16:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A32211A
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 00:16:17 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-56-168.net.vodafone.it [5.90.56.168])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FF3F124F;
        Mon,  4 Sep 2023 09:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693811688;
        bh=vVUa9nZb1vB1oPjYSRaDkqEK0TnLOZHFhcolKnkbLZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aLBkZmg3ksLBnWsCaV7zlTPeZn5uWwcxw7NgEIP+xSxgOYrZSG8QcvSrxiAZy7VNX
         a6RgjgKHnvP47VqpvqE9yN0RmIyC0dWd/fvJEDGmAfBbY35+NzRY/+AhpZfeyTIS/8
         900QdZWv1nslBX2j7Ap/mJybZPf5NpJAy4aWJJ1c=
Date:   Mon, 4 Sep 2023 09:15:38 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 2/3] media: i2c: imx219: Fix crop rectangle setting
 when changing format
Message-ID: <coxooexjhksrawftyl3kyrh6ixrn4eroixy35mqk622b2vho53@exgwgzz2tjpu>
References: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
 <20230831135747.23148-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230831135747.23148-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Aug 31, 2023 at 04:57:46PM +0300, Laurent Pinchart wrote:
> When moving the imx219 driver to the subdev active state, commit
> e8a5b1df000e ("media: i2c: imx219: Use subdev active state") used the
> pad crop rectangle stored in the subdev state to report the crop
> rectangle of the active mode. That crop rectangle was however not set in
> the state when setting the format, which resulted in reporting an
> incorrect crop rectangle to userspace. Fix it.
>
> Fixes: e8a5b1df000e ("media: i2c: imx219: Use subdev active state")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LIkewise, let's make sure this lands in v6.6
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/imx219.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6f88e002c8d8..f19c828b6943 100644
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
> @@ -757,11 +758,16 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  				      fmt->format.width, fmt->format.height);
>
>  	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> +
>  	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
>
>  	if (imx219->mode == mode && format->code == fmt->format.code)
>  		return 0;
>
> +	*format = fmt->format;
> +	*crop = mode->crop;
> +
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx219->mode = mode;
>  		/* Update limits and set FPS to default */
> @@ -788,8 +794,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
