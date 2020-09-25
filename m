Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7B427945F
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 00:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgIYWxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 18:53:02 -0400
Received: from mga14.intel.com ([192.55.52.115]:7170 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726064AbgIYWxB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 18:53:01 -0400
IronPort-SDR: QbGlwhVlm//DpH00aQrUDeNtU6+8NNhbwA2N8lxeh+ed2+yYT3Ccvq/sV9tCOSTES0O33YvMnT
 MCFWft7SXgtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="160884395"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="160884395"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 13:11:29 -0700
IronPort-SDR: Wv4YOe2jObohQKrRd0YLw2kCB5bLvsVjsTvYWcwb5StO+wGhW9tGM5jEpC3GzIFhEboM66rP8L
 m+rP7HMdGnMw==
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="349890400"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 13:11:27 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2BFC820728; Fri, 25 Sep 2020 23:11:25 +0300 (EEST)
Date:   Fri, 25 Sep 2020 23:11:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [PATCH 1/5] media: mt9p031: Add support for 8 bit and 10 bit
 formats
Message-ID: <20200925201125.GX26842@paasikivi.fi.intel.com>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925075029.32181-1-s.riedmueller@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Fri, Sep 25, 2020 at 09:50:25AM +0200, Stefan Riedmueller wrote:
> From: Christian Hemp <c.hemp@phytec.de>
> 
> Aside from 12 bit monochrome or color format the sensor implicitly
> supports 10 and 8 bit formats as well by simply dropping the
> corresponding LSBs.
> 
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> [jlu@pengutronix.de: simplified by dropping v4l2_colorspace handling]
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index dc23b9ed510a..0002dd299ffa 100644
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
> +	int num_fmts;

Unsigned int, please.

> +
>  	/* Registers cache */
>  	u16 output_control;
>  	u16 mode2;
> @@ -148,6 +163,17 @@ static struct mt9p031 *to_mt9p031(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mt9p031, subdev);
>  }
>  
> +static const u32 mt9p031_find_datafmt(struct mt9p031 *mt9p031, u32 code)
> +{
> +	int i;

Same here.

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
Kind regards,

Sakari Ailus
