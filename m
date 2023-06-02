Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D0A7203A4
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbjFBNoW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjFBNoV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:44:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC166136;
        Fri,  2 Jun 2023 06:44:20 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7E4827C;
        Fri,  2 Jun 2023 15:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685713436;
        bh=ruEcGzXv9dYZc5NDo2r7wvKXpIcPGf8erV/ki34Bb0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSYVSgllDMwWIFOkfM3Xy2ajgoKjWMSnMh5RVbtwYinYEqOGVOM7pqyHFtJG5EHRx
         AglC0IAcFOBSy95tjjvYgN307/P9kOzVnYBmz7wybvCML054igQkATbSORf73xzIwQ
         LeH3AnWaJQ4jD3JHbWgu556soU7bhgGp/phDBHV8=
Date:   Fri, 2 Jun 2023 15:44:16 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 16/21] media: i2c: imx258: Set pixel_rate range to the
 same as the value
Message-ID: <hoi3snm2uzxsneoar7vtbz3zblnekjhdd3qe6re33ieijavc4d@juinudhpv3oe>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-17-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-17-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 30, 2023 at 06:29:55PM +0100, Dave Stevenson wrote:
> With a read only control there is limited point in advertising
> a minimum and maximum for the control, so change to set the
> value, min, and max all to the selected pixel rate.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 7d6528f9ca4d..b9b650d40365 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -1002,7 +1002,8 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>
>  		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
>  		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
> -		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
> +		__v4l2_ctrl_modify_range(imx258->pixel_rate, pixel_rate,
> +					 pixel_rate, 1, pixel_rate);
>  		/* Update limits and set FPS to default */
>  		vblank_def = imx258->cur_mode->vts_def -
>  			     imx258->cur_mode->height;
> @@ -1328,8 +1329,7 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	struct v4l2_ctrl *vflip, *hflip;
>  	s64 vblank_def;
>  	s64 vblank_min;
> -	s64 pixel_rate_min;
> -	s64 pixel_rate_max;
> +	s64 pixel_rate;
>  	int ret;
>
>  	ctrl_hdlr = &imx258->ctrl_handler;
> @@ -1360,17 +1360,13 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	if (vflip)
>  		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -	pixel_rate_max =
> -		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
> -					imx258->nlanes);
> -	pixel_rate_min =
> -		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
> -					imx258->nlanes);
> +	pixel_rate = link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
> +					     imx258->nlanes);
>  	/* By default, PIXEL_RATE is read only */
>  	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
>  				V4L2_CID_PIXEL_RATE,
> -				pixel_rate_min, pixel_rate_max,
> -				1, pixel_rate_max);
> +				pixel_rate, pixel_rate,
> +				1, pixel_rate);

seems legit!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>

Is there a double blank line here ? Could you take the occasion and
drop it ?

>  	vblank_def = imx258->cur_mode->vts_def - imx258->cur_mode->height;
> --
> 2.25.1
>
