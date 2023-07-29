Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933CA7680AB
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 19:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjG2RCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 13:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG2RCt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 13:02:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA228129
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 10:02:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DF86B1;
        Sat, 29 Jul 2023 19:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690650104;
        bh=MDz4+2NcAvO6ctAtCzOsxI/XFgJj+hgvshpNPiYPQfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C8TdizIrLztaahkgIcJaM8PLDhjS2z46d3OcyJMapDORE4pCi3pkyMY/emkj8xNa5
         3lGwtC6aka6on9eUMERDLdcwDHK1IwamFlry50VA86BbSHNpqghlKDk7rn6KMV/WcD
         GXjafv67smyaPQbu/1EN+RXM+297JQ3XrHo2yX9Q=
Date:   Sat, 29 Jul 2023 20:02:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH v2 3/7] media: i2c: imx219: Complete default format
 initialization
Message-ID: <20230729170249.GB5094@pendragon.ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
 <20230710155203.92366-4-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710155203.92366-4-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jul 10, 2023 at 05:51:59PM +0200, Jacopo Mondi wrote:
> Complete the default format initialization in init_cfg() filling in
> the fields for the colorspace configuration copied from
> imx219_set_default_format().
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 45b219321d98..cd43a897391c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -714,6 +714,12 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
>  	format->code = imx219_get_format_code(imx219,
>  					      MEDIA_BUS_FMT_SRGGB10_1X10);
>  	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_SRGB;
> +	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
> +	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +							     format->colorspace,
> +							     format->ycbcr_enc);
> +	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);

There are multiple ways to initialize color space, and for raw sensors I
think I'd have a preference for being explicit:

        format->colorspace = V4L2_COLORSPACE_SRGB;
        format->ycbcr_enc = V4L2_YCBCR_ENC_601;
        format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
        format->xfer_func = V4L2_XFER_FUNC_NONE;

Furthermore, I think V4L2_COLORSPACE_RAW would be better.

Granted, this doesn't match imx219_set_default_format(), but you remove
that function later in the series.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* Initialize crop rectangle. */
>  	crop = v4l2_subdev_get_pad_crop(sd, state, 0);

-- 
Regards,

Laurent Pinchart
