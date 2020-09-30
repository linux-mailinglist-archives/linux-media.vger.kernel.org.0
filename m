Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B3727E7C5
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 13:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgI3LnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 07:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbgI3LnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 07:43:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FF4C061755;
        Wed, 30 Sep 2020 04:43:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CABF3A61;
        Wed, 30 Sep 2020 13:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601466188;
        bh=qCXhZOr13G8G9oYQF2tgn0I9aUvQ6/ueiYSB0qru238=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pklqDojWkjtFEn6ea4X8bj/Y+rDFxgsCHLGTDfZ69iwABRLZZqc+TsbkqDNxQQaFO
         nF3jErBnzCMj1kzu+KYhRwCvdkR3sjbY/1AunMaJvz3kBM1Qr5XtzJV1EtkZnZhkLP
         buUNszKmhEhy9KN6Q+uZRS3aRBzDu/PtfOQbfnYM=
Date:   Wed, 30 Sep 2020 14:42:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [PATCH v2 1/5] media: mt9p031: Add support for 8 bit and 10 bit
 formats
Message-ID: <20200930114231.GH5689@pendragon.ideasonboard.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930105133.139981-1-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch.

On Wed, Sep 30, 2020 at 12:51:29PM +0200, Stefan Riedmueller wrote:
> From: Christian Hemp <c.hemp@phytec.de>
> 
> Aside from 12 bit monochrome or color format the sensor implicitly
> supports 10 and 8 bit formats as well by simply dropping the
> corresponding LSBs.

That's not how it should work though. If you set the format on
MEDIA_BUS_FMT_SGRBG8_1X8 through the pipeline for instance, you will end
up capturing the 8 LSB, not the 8 MSB.

What's your use case for this ?

> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> [jlu@pengutronix.de: simplified by dropping v4l2_colorspace handling]
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> Changes in v2:
>  - Use unsigned int for num_fmts and loop variable in find_datafmt
>  - Remove superfluous const qualifier from find_datafmt
> ---
>  drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index dc23b9ed510a..2e6671ef877c 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -116,6 +116,18 @@ enum mt9p031_model {
>  	MT9P031_MODEL_MONOCHROME,
>  };
>  
> +static const u32 mt9p031_color_fmts[] = {
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> +};
> +
> +static const u32 mt9p031_monochrome_fmts[] = {
> +	MEDIA_BUS_FMT_Y8_1X8,
> +	MEDIA_BUS_FMT_Y10_1X10,
> +	MEDIA_BUS_FMT_Y12_1X12,
> +};
> +
>  struct mt9p031 {
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
> @@ -138,6 +150,9 @@ struct mt9p031 {
>  	struct v4l2_ctrl *blc_auto;
>  	struct v4l2_ctrl *blc_offset;
>  
> +	const u32 *fmts;
> +	unsigned int num_fmts;
> +
>  	/* Registers cache */
>  	u16 output_control;
>  	u16 mode2;
> @@ -148,6 +163,17 @@ static struct mt9p031 *to_mt9p031(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mt9p031, subdev);
>  }
>  
> +static u32 mt9p031_find_datafmt(struct mt9p031 *mt9p031, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < mt9p031->num_fmts; i++)
> +		if (mt9p031->fmts[i] == code)
> +			return mt9p031->fmts[i];
> +
> +	return mt9p031->fmts[mt9p031->num_fmts-1];
> +}
> +
>  static int mt9p031_read(struct i2c_client *client, u8 reg)
>  {
>  	return i2c_smbus_read_word_swapped(client, reg);
> @@ -476,10 +502,11 @@ static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
>  {
>  	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
>  
> -	if (code->pad || code->index)
> +	if (code->pad || code->index >= mt9p031->num_fmts)
>  		return -EINVAL;
>  
> -	code->code = mt9p031->format.code;
> +	code->code = mt9p031->fmts[code->index];
> +
>  	return 0;
>  }
>  
> @@ -573,6 +600,8 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
>  	__format->width = __crop->width / hratio;
>  	__format->height = __crop->height / vratio;
>  
> +	__format->code = mt9p031_find_datafmt(mt9p031, format->format.code);
> +
>  	format->format = *__format;
>  
>  	return 0;
> @@ -951,10 +980,7 @@ static int mt9p031_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
>  
>  	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
>  
> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> -		format->code = MEDIA_BUS_FMT_Y12_1X12;
> -	else
> -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> +	format->code = mt9p031_find_datafmt(mt9p031, 0);
>  
>  	format->width = MT9P031_WINDOW_WIDTH_DEF;
>  	format->height = MT9P031_WINDOW_HEIGHT_DEF;
> @@ -1121,10 +1147,14 @@ static int mt9p031_probe(struct i2c_client *client,
>  	mt9p031->crop.left = MT9P031_COLUMN_START_DEF;
>  	mt9p031->crop.top = MT9P031_ROW_START_DEF;
>  
> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> -		mt9p031->format.code = MEDIA_BUS_FMT_Y12_1X12;
> -	else
> -		mt9p031->format.code = MEDIA_BUS_FMT_SGRBG12_1X12;
> +	if (mt9p031->model == MT9P031_MODEL_MONOCHROME) {
> +		mt9p031->fmts = mt9p031_monochrome_fmts;
> +		mt9p031->num_fmts = ARRAY_SIZE(mt9p031_monochrome_fmts);
> +	} else {
> +		mt9p031->fmts = mt9p031_color_fmts;
> +		mt9p031->num_fmts = ARRAY_SIZE(mt9p031_color_fmts);
> +	}
> +	mt9p031->format.code = mt9p031_find_datafmt(mt9p031, 0);
>  
>  	mt9p031->format.width = MT9P031_WINDOW_WIDTH_DEF;
>  	mt9p031->format.height = MT9P031_WINDOW_HEIGHT_DEF;

-- 
Regards,

Laurent Pinchart
