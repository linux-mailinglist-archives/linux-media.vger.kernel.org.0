Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32214DBF95
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 07:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiCQGkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 02:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiCQGky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 02:40:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC1299EF3;
        Wed, 16 Mar 2022 23:39:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DFBDEE;
        Thu, 17 Mar 2022 07:39:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647499175;
        bh=FZZm2E9w3yXh5tiZNFMjIqDjJr2hyII9MTJZ5IlH2JI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z4DNBa04+tQfqe6oUE2Zj+ukf2+Ktfo2Tqpmg399r2zx+X6hsTRB4ou5DBgpvwCwu
         JKSSxXpZF5l9zjoH+r7bEdbJwhHIYxosWA1oWMhpbuuuiJXJNF54NRmNgGJptkSw4T
         /gD0GbBxHeft0eAaROyAGXIY1H7ou0HKtHcUBGz4=
Date:   Thu, 17 Mar 2022 08:39:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: rdacm20: Fix format definition
Message-ID: <YjLXlrDOk3AYJtD/@pendragon.ideasonboard.com>
References: <20220316210916.606929-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316210916.606929-1-jacopo+renesas@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Mar 16, 2022 at 10:09:16PM +0100, Jacopo Mondi wrote:
> The RDACM20 camera supports a single image format which is currently
> listed as MEDIA_BUS_FMT_UYVY8_2X8. As the video stream is transmitted on
> the GMSL serial bus, the 2X8 variant does not apply.
> 
> Fix the format byusing MEDIA_BUS_FMT_UYVY8_1X16.

s/by/by /

> This fixes a runtime error which is now triggered as the MAX9286
> deserializer implements .link_validate().
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm20.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index ba956733aa89..6f23776ad214 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -47,11 +47,11 @@
>  #define OV10635_VTS			933
> 
>  /*
> - * As the drivers supports a single MEDIA_BUS_FMT_UYVY8_2X8 format we
> + * As the drivers supports a single MEDIA_BUS_FMT_UYVY8_1X16 format we
>   * can harcode the pixel rate.
>   *
>   * PCLK is fed through the system clock, programmed @88MHz.
> - * MEDIA_BUS_FMT_UYVY8_2X8 format = 2 samples per pixel.
> + * MEDIA_BUS_FMT_UYVY8_1X16 format = 2 samples per pixel.
>   *
>   * Pixelrate = PCLK / 2
>   * FPS = (OV10635_VTS * OV10635_HTS) / PixelRate
> @@ -409,7 +409,7 @@ static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->pad || code->index > 0)
>  		return -EINVAL;
> 
> -	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
> 
>  	return 0;
>  }
> @@ -425,7 +425,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
> 
>  	mf->width		= OV10635_WIDTH;
>  	mf->height		= OV10635_HEIGHT;
> -	mf->code		= MEDIA_BUS_FMT_UYVY8_2X8;
> +	mf->code		= MEDIA_BUS_FMT_UYVY8_1X16;
>  	mf->colorspace		= V4L2_COLORSPACE_RAW;
>  	mf->field		= V4L2_FIELD_NONE;
>  	mf->ycbcr_enc		= V4L2_YCBCR_ENC_601;

-- 
Regards,

Laurent Pinchart
