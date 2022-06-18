Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9184555076B
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiFRXNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiFRXNK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:13:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C186C6168
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:13:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16943993;
        Sun, 19 Jun 2022 01:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655593988;
        bh=hUHhWFd2FT+sneytksX5GPKHYFapOeMND6kjEnLE2Io=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kFWYa7riTd9tZbVS2Gv2spPkCggfN8LUhiao5t1u6mM/Z1xjnkfx37A1QOGxM/cx4
         G+KcJWHhfVdoIs/a/9tEtbWVztUSNg+PDXFzvIecNzXp0wItaMpDitE4Ig/tUtI1Is
         Pp9sRbkOPUcsOGn+4X68eJQ9/aexeymeJBMdFDps=
Date:   Sun, 19 Jun 2022 02:12:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH] media: mt9p031: Move open subdev op init code into
 init_cfg
Message-ID: <Yq5b9kcq3HtsIGZE@pendragon.ideasonboard.com>
References: <20220618222151.478111-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222151.478111-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:21:51AM +0200, Marek Vasut wrote:
> The .open subdev op is not always called soon enough to initialize
> the default crop settings. Move all this initialization into .init_cfg
> op instead.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 51 +++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index e73e814c60207..e0f0d87d4cfe9 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -505,6 +505,34 @@ static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
>  	return mt9p031_pll_enable(mt9p031);
>  }
>  
> +static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
> +			    struct v4l2_subdev_state *sd_state)
> +{
> +	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *crop;
> +
> +	crop = v4l2_subdev_get_try_crop(subdev, sd_state, 0);
> +	crop->left = MT9P031_COLUMN_START_DEF;
> +	crop->top = MT9P031_ROW_START_DEF;
> +	crop->width = MT9P031_WINDOW_WIDTH_DEF;
> +	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
> +
> +	format = v4l2_subdev_get_try_format(subdev, sd_state, 0);
> +
> +	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> +		format->code = MEDIA_BUS_FMT_Y12_1X12;
> +	else
> +		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> +
> +	format->width = MT9P031_WINDOW_WIDTH_DEF;
> +	format->height = MT9P031_WINDOW_HEIGHT_DEF;
> +	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	return 0;
> +}

This looks good, but could I ask you to take it a small step further to
also replace the active format and crop rectangle initialization in the
probe function with a call to mt9p031_init_cfg() ? The probe function
will call mt9p031_init_cfg() with NULL for the second argument, and this
function would then call __mt9p031_get_pad_format() and
__mt9p031_get_pad_crop() instead of v4l2_subdev_get_try_format() and
v4l2_subdev_get_try_crop(), with the which argument set to ACTIVE or TRY
based on whether the sd_state is NULL or not.

> +
>  static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
> @@ -988,28 +1016,6 @@ static int mt9p031_registered(struct v4l2_subdev *subdev)
>  
>  static int mt9p031_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
>  {
> -	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
> -	struct v4l2_mbus_framefmt *format;
> -	struct v4l2_rect *crop;
> -
> -	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
> -	crop->left = MT9P031_COLUMN_START_DEF;
> -	crop->top = MT9P031_ROW_START_DEF;
> -	crop->width = MT9P031_WINDOW_WIDTH_DEF;
> -	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
> -
> -	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
> -
> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> -		format->code = MEDIA_BUS_FMT_Y12_1X12;
> -	else
> -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> -
> -	format->width = MT9P031_WINDOW_WIDTH_DEF;
> -	format->height = MT9P031_WINDOW_HEIGHT_DEF;
> -	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> -
>  	return mt9p031_set_power(subdev, 1);
>  }
>  
> @@ -1027,6 +1033,7 @@ static const struct v4l2_subdev_video_ops mt9p031_subdev_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops mt9p031_subdev_pad_ops = {
> +	.init_cfg = mt9p031_init_cfg,
>  	.enum_mbus_code = mt9p031_enum_mbus_code,
>  	.enum_frame_size = mt9p031_enum_frame_size,
>  	.get_fmt = mt9p031_get_format,

-- 
Regards,

Laurent Pinchart
