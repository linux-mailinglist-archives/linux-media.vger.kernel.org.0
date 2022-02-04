Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665374A9275
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 03:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356704AbiBDCwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 21:52:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiBDCwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 21:52:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B084C061714;
        Thu,  3 Feb 2022 18:52:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95123472;
        Fri,  4 Feb 2022 03:51:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643943118;
        bh=89lQC66uqInrcRlTJuSyiqnPE8b3jRGmpdyJc0F86t4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mtWgknQSGQ5wKHQtdq7SXDdEfNQkFbP19rWtDc2bhWdHt31ZA+gY+bh6qHIrWcc2i
         9KvUjXL/qHgQX+tdboIVGsY8wEo3Y1F4vLaOX0E9aD1VjF/rxkfUDH6VIG9NAlVHPp
         gglskBKNs26U4CWe/aaUglTVtQFcztDdDOabbARY=
Date:   Fri, 4 Feb 2022 04:51:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        mchehab@kernel.org, naush@raspberrypi.com, robh@kernel.org,
        tomi.valkeinen@ideasonboard.com, nsaenz@kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [RFC PATCH v4 07/12] media: imx219: Rename mbus codes array
Message-ID: <YfyUtu2e6HHMGfvd@pendragon.ideasonboard.com>
References: <20220203175009.558868-1-jeanmichel.hautbois@ideasonboard.com>
 <20220203175009.558868-8-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220203175009.558868-8-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Thu, Feb 03, 2022 at 06:50:04PM +0100, Jean-Michel Hautbois wrote:
> The imx219 is using the name codes[] for the mbus format which is not
> easy to read and know what it means. Change it to imx219_mbus_formats.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e10af3f74b38..74dba5e61201 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -429,7 +429,7 @@ static const char * const imx219_supply_name[] = {
>   * - v flip
>   * - h&v flips
>   */
> -static const u32 codes[] = {
> +static const u32 imx219_mbus_formats[] = {
>  	MEDIA_BUS_FMT_SRGGB10_1X10,
>  	MEDIA_BUS_FMT_SGRBG10_1X10,
>  	MEDIA_BUS_FMT_SGBRG10_1X10,
> @@ -655,17 +655,17 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
>  
>  	lockdep_assert_held(&imx219->mutex);
>  
> -	for (i = 0; i < ARRAY_SIZE(codes); i++)
> -		if (codes[i] == code)
> +	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
> +		if (imx219_mbus_formats[i] == code)
>  			break;
>  
> -	if (i >= ARRAY_SIZE(codes))
> +	if (i >= ARRAY_SIZE(imx219_mbus_formats))
>  		i = 0;
>  
>  	i = (i & ~3) | (imx219->vflip->val ? 2 : 0) |
>  	    (imx219->hflip->val ? 1 : 0);
>  
> -	return codes[i];
> +	return imx219_mbus_formats[i];
>  }
>  
>  static void imx219_set_default_format(struct imx219 *imx219)
> @@ -808,11 +808,11 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
>  
> -	if (code->index >= (ARRAY_SIZE(codes) / 4))
> +	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
>  		return -EINVAL;
>  
>  	mutex_lock(&imx219->mutex);
> -	code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
> +	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
>  	mutex_unlock(&imx219->mutex);
>  
>  	return 0;
> @@ -908,14 +908,14 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&imx219->mutex);
>  
> -	for (i = 0; i < ARRAY_SIZE(codes); i++)
> -		if (codes[i] == fmt->format.code)
> +	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
> +		if (imx219_mbus_formats[i] == fmt->format.code)
>  			break;
> -	if (i >= ARRAY_SIZE(codes))
> +	if (i >= ARRAY_SIZE(imx219_mbus_formats))
>  		i = 0;
>  
>  	/* Bayer order varies with flips */
> -	fmt->format.code = imx219_get_format_code(imx219, codes[i]);
> +	fmt->format.code = imx219_get_format_code(imx219, imx219_mbus_formats[i]);
>  
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),

-- 
Regards,

Laurent Pinchart
