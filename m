Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA52273FDDE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjF0OdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjF0Ocy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:32:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81BC2D69
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:32:52 -0700 (PDT)
Received: from [192.168.144.60] (90-182-211-1.rcp.o2.cz [90.182.211.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A419510A;
        Tue, 27 Jun 2023 16:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687876331;
        bh=aG6d6cGBQBb0+El4Ox6cx16dpizDfUtQjbpiO3evZYE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HlKmXLf2CRithNLT5i+rcji2WHbfdZBzEkSC1cYixoML7/INbhqLHYr6/VpFL1VuM
         OVVxJj4CVRhS/0CewaRov8O4PJ5hxrtfQGTD2RxcMzReuxHRRmHtTnybBSyLqguHgl
         /SfpgOmE3SgfzYSEfw96ebb7UcKKJ5F4KsQFtxbE=
Message-ID: <675a3add-6c74-6206-8ede-2573d7c07df3@ideasonboard.com>
Date:   Tue, 27 Jun 2023 16:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 07/29] media: ov2680: Fix ov2680_set_fmt() which ==
 V4L2_SUBDEV_FORMAT_TRY not working
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-8-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230627131830.54601-8-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 27/06/2023 15:18, Hans de Goede wrote:
> ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY was getting
> the try_fmt v4l2_mbus_framefmt struct from the passed in sd_state
> and then storing the contents of that into the return by reference
> format->format struct.
>
> While the right thing to do would be filling format->format based on
> the just looked up mode and then store the results of that in
> sd_state->pads[0].try_fmt .
>
> Before the previous change introducing ov2680_fill_format() this
> resulted in ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY always
> returning the zero-ed out sd_state->pads[0].try_fmt in format->format
> breaking callers using this.
>
> After the introduction of ov2680_fill_format() which at least
> initializes sd_state->pads[0].try_fmt properly, format->format
> is now always being filled with the default 800x600 mode set by
> ov2680_init_cfg() independent of the actual requested mode.
>
> Move the filling of format->format with ov2680_fill_format() to
> before the if (which == V4L2_SUBDEV_FORMAT_TRY) and then store
> the filled in format->format in sd_state->pads[0].try_fmt to
> fix this.
>
> Note this removes the fmt local variable because IMHO having a local
> variable which points to a sub-struct of one of the function arguments
> just leads to confusion when reading the code.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


For #5, #6 and this one:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>


>   drivers/media/i2c/ov2680.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index c4a46c734d82..7fc4b39ebb37 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -603,7 +603,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>   			  struct v4l2_subdev_format *format)
>   {
>   	struct ov2680_dev *sensor = to_ov2680_dev(sd);
> -	struct v4l2_mbus_framefmt *fmt = &format->format;
>   	struct v4l2_mbus_framefmt *try_fmt;
>   	const struct ov2680_mode_info *mode;
>   	int ret = 0;
> @@ -612,14 +611,18 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>   		return -EINVAL;
>   
>   	mode = v4l2_find_nearest_size(ov2680_mode_data,
> -				      ARRAY_SIZE(ov2680_mode_data), width,
> -				      height, fmt->width, fmt->height);
> +				      ARRAY_SIZE(ov2680_mode_data),
> +				      width, height,
> +				      format->format.width,
> +				      format->format.height);
>   	if (!mode)
>   		return -EINVAL;
>   
> +	ov2680_fill_format(sensor, &format->format, mode->width, mode->height);
> +
>   	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>   		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> -		format->format = *try_fmt;
> +		*try_fmt = format->format;
>   		return 0;
>   	}
>   
> @@ -630,8 +633,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>   		goto unlock;
>   	}
>   
> -	ov2680_fill_format(sensor, fmt, mode->width, mode->height);
> -
>   	sensor->current_mode = mode;
>   	sensor->fmt = format->format;
>   	sensor->mode_pending_changes = true;
