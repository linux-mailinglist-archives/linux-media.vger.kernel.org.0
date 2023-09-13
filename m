Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C603B79EBB3
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 16:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241581AbjIMOzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 10:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjIMOzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 10:55:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770D4AC
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 07:55:01 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6D63741;
        Wed, 13 Sep 2023 16:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694616808;
        bh=5Hp4ldjiwbIGzXJGYscnOWyI3DEDuQGinp12/Uglmm0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BxmptFMMxGOUJmbCXuKtCsQVKgd2+LljTTLTQdonIYG6AiaH3lQeuoE8wDNz9cgC8
         ArE4c0xHHV4qLsQaEMRO8eQkHL3BllqLiyN2MjJnXD0VwtGysDRhAuTTcdCPdJHN8a
         AP4hzXGYgTa04D8tzSaiZZ/3rftODv8KykcYAt8k=
Date:   Wed, 13 Sep 2023 16:54:56 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 17/20] media: i2c: imx219: Separate horizontal and
 vertical binning
Message-ID: <dptztdhugb45attj7jfpfg4yn3zh7lh3qpwywrfnoneozyhrde@ussyblvnfnge>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
 <20230913135638.26277-18-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913135638.26277-18-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, Sep 13, 2023 at 04:56:35PM +0300, Laurent Pinchart wrote:
> The IMX219 has distinct binning registers for the horizontal and
> vertical directions. Calculate their value and write them separately.
>

Do you expect different binning factors in horizontal and vertical
directions ?

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 39 ++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6bfdceaf5044..bf1c2a1dad95 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -90,10 +90,11 @@
>  #define IMX219_REG_ORIENTATION		CCI_REG8(0x0172)
>
>  /* Binning  Mode */
> -#define IMX219_REG_BINNING_MODE		CCI_REG16(0x0174)
> -#define IMX219_BINNING_NONE		0x0000
> -#define IMX219_BINNING_2X2		0x0101
> -#define IMX219_BINNING_2X2_ANALOG	0x0303
> +#define IMX219_REG_BINNING_MODE_H	CCI_REG8(0x0174)
> +#define IMX219_REG_BINNING_MODE_V	CCI_REG8(0x0175)
> +#define IMX219_BINNING_NONE		0x00
> +#define IMX219_BINNING_X2		0x01
> +#define IMX219_BINNING_X2_ANALOG	0x03
>
>  #define IMX219_REG_CSI_DATA_FORMAT_A	CCI_REG16(0x018c)
>
> @@ -615,7 +616,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	const struct v4l2_mbus_framefmt *format;
>  	const struct v4l2_rect *crop;
>  	unsigned int bpp;
> -	u64 bin_mode;
> +	u64 bin_h, bin_v;
>  	int ret = 0;
>
>  	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
> @@ -647,14 +648,28 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>
> -	if (format->width == crop->width && format->height == crop->height)
> -		bin_mode = IMX219_BINNING_NONE;
> -	else if (bpp == 8)
> -		bin_mode = IMX219_BINNING_2X2_ANALOG;
> -	else
> -		bin_mode = IMX219_BINNING_2X2;
> +	switch (crop->width / format->width) {
> +	case 1:
> +	default:

With the currently supported modes nothing but 1 or 2 can be obtained.
I would have kept default: out, or used it to WARN developers adding
new modes they have to support other binning factors (4x is the only
not supported one). A minor though.

> +		bin_h = IMX219_BINNING_NONE;
> +		break;
> +	case 2:
> +		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> +		break;
> +	}
>
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
> +	switch (crop->height / format->height) {
> +	case 1:
> +	default:
> +		bin_v = IMX219_BINNING_NONE;
> +		break;
> +	case 2:
> +		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> +		break;
> +	}
> +
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);

With the currently supported mode, this could have been a single
switch(). Doesn't hurt though

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
>  		  format->width, &ret);
> --
> Regards,
>
> Laurent Pinchart
>
