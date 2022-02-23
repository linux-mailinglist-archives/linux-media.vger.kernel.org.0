Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7914C11F6
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237142AbiBWLyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbiBWLyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:54:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B25C97BB0
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:54:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13141DD;
        Wed, 23 Feb 2022 12:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645617242;
        bh=zHHy26saBPxnNtXEdUVsZ/hAXQ5fmmgUAXWMqKnahBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e+teb3nm91K9pkqgzXr5x74ihNE74pF77e2Alz6WZUanD3bcmCHwRDEbS2aRvIRjT
         W2o3jeZbi9ZtWitEL+bCNLlXUpln670DdCw5ElUGfhNF3kCurMJLSzVXO1hzE7xYXc
         9Bf3lX8zXFR+6ODaEYJYdwDeMuzoEv/dF0y5l2Zg=
Date:   Wed, 23 Feb 2022 13:53:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 11/27] media: ov5640: Provide timings accessor
Message-ID: <YhYgTwKiG5cgJq3g@pendragon.ideasonboard.com>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-12-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223104034.91550-12-jacopo@jmondi.org>
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

On Wed, Feb 23, 2022 at 11:40:18AM +0100, Jacopo Mondi wrote:
> Provide a function to shortcut access to the correct timings definition
> to avoid repeating the same pattern when accessing the sensor timings.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 4040ace2fd55..ace956b7cdfc 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1123,6 +1123,16 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  	},
>  };
>  
> +static inline const
> +struct ov5640_timings *ov5640_timings(const struct ov5640_dev *sensor,
> +				      const struct ov5640_mode_info *mode)

The usual line split would be

static inline const struct ov5640_timings *
ov5640_timings(const struct ov5640_dev *sensor,
	       const struct ov5640_mode_info *mode)

I'd also drop the inline, the compiler will figure out what is best by
itself.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +{
> +	if (ov5640_is_csi2(sensor))
> +		return &mode->csi2_timings;
> +
> +	return &mode->dvp_timings;
> +}
> +
>  static int ov5640_init_slave_id(struct ov5640_dev *sensor)
>  {
>  	struct i2c_client *client = sensor->i2c_client;
> @@ -1630,11 +1640,7 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  			return ret;
>  	}
>  
> -	if (ov5640_is_csi2(sensor))
> -		timings = &mode->csi2_timings;
> -	else
> -		timings = &mode->dvp_timings;
> -
> +	timings = ov5640_timings(sensor, mode);
>  	analog_crop = &timings->analog_crop;
>  	crop = &timings->crop;
>  

-- 
Regards,

Laurent Pinchart
