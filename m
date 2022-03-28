Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E454EA2DC
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 00:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiC1WR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 18:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiC1WRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 18:17:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F98C43EF8
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 15:14:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76F592F7;
        Mon, 28 Mar 2022 23:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648503424;
        bh=IAuMjXOHXVK+RxkE7MtSr3slGgOg2jWEUvd68Ty3THQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QbBWhRuk3d+joB8k7zaluOqdlQWV7kJxvS1C9lTeHpKPPKx/xQ71pngvLWrgAvGCv
         NmGJbJZC4zXEoT46RiZY3ywcdxLSHXHu5NAWP3k3M6gSTgUNQf8K+xDNx5y+APXkGL
         32lZBKTC77KOV2ZWLC95APuKvH+/3CAuFDhHK7kQ=
Date:   Tue, 29 Mar 2022 00:37:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     sakari.ailus@iki.fi, tomi.valkeinen@ideasonboard.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: Fix media bus format
Message-ID: <YkIqfhJwG9RBbsdY@pendragon.ideasonboard.com>
References: <20220328163220.250203-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328163220.250203-1-jacopo@jmondi.org>
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

On Mon, Mar 28, 2022 at 06:32:20PM +0200, Jacopo Mondi wrote:
> The ov5645 driver reports as its unique supported format
> MEDIA_BUS_FMT_UYVY8_2X8, which is not correct as the sensor
> uses the MIPI CSI-2 serial bus.
> 
> Fix that by using MEDIA_BUS_FMT_UYVY8_1X16 instead.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 368fa21e675e..5720e74e843b 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -843,7 +843,7 @@ static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
> 
> -	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
> 
>  	return 0;
>  }
> @@ -852,7 +852,7 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->code != MEDIA_BUS_FMT_UYVY8_2X8)
> +	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
>  		return -EINVAL;
> 
>  	if (fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
> @@ -948,7 +948,7 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
>  					   format->which);
>  	__format->width = __crop->width;
>  	__format->height = __crop->height;
> -	__format->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	__format->code = MEDIA_BUS_FMT_UYVY8_1X16;
>  	__format->field = V4L2_FIELD_NONE;
>  	__format->colorspace = V4L2_COLORSPACE_SRGB;
> 

-- 
Regards,

Laurent Pinchart
