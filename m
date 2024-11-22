Return-Path: <linux-media+bounces-21822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960389D5D39
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BFCC283071
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE1E1DE4C6;
	Fri, 22 Nov 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VDjqCOuI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B901DDC39;
	Fri, 22 Nov 2024 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270957; cv=none; b=MpRTB0c5FM4h2w2QxD0/f1/+D+sU0+5Y4bz8lpa6sjacQqIizqzuX/d4hucdnur1bC1Gx9i5IEK4slKToKmMFQXrKfK89lWnLrtBsV9rDtaGMKBEL1YxJc0hL80ppYADwnvOnaJZaSbIMmj53Tlv9vnmeE2o3YNZAD75IN5AYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270957; c=relaxed/simple;
	bh=cRe94m9FYYjIppWUlSjL4c/l+04MITohxLzc/eurtUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXo75wyMW3s5JLGRi8gO4fD1rDS9kfbSmdUky6YxYKoP7PpNQ2/Gxvpl8NT17z87A8Ziw6zLwlC/r1znfePRTdbKkFBXDj6+H2D8TmzZbhPdt0z6MoCWLij67QU08njPaInr1lI0aGCsu4+sXJ0+xNO21YbISfBRZFBa72tmv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VDjqCOuI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51BC38BE;
	Fri, 22 Nov 2024 11:22:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732270934;
	bh=cRe94m9FYYjIppWUlSjL4c/l+04MITohxLzc/eurtUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDjqCOuIq7jR2DYTa7+I16iCWhf+kUdD/8IyvT66ob4yeJG0rUhC/yyhJOMCQlF9Z
	 wipevVi3ZLPbJXMma6pXwSk0LbMd0n4RnpkA9LAZWsM+eoHhKwls0W5jfs9b40GnHF
	 aTL8OHnYGgsIU3DXdH9LNYojDsUHhUGtkESApt7o=
Date: Fri, 22 Nov 2024 11:22:30 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: i2c: imx219: make HBLANK r/w to allow
 longer exposures
Message-ID: <emkd4ifsubxe2cmteld2hjkvin7uaspuqvh5ptuzm5o5kgp3py@hujytrhrlc44>
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
 <20241121-imx219_fixes-v2-2-7b068a60ea40@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121-imx219_fixes-v2-2-7b068a60ea40@ideasonboard.com>

Hi Jai

On Thu, Nov 21, 2024 at 05:38:03PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The HBLANK control was read-only, and always configured such
> that the sensor HTS register was 3448. This limited the maximum
> exposure time that could be achieved to around 1.26 secs.
>
> Make HBLANK read/write so that the line time can be extended,
> and thereby allow longer exposures (and slower frame rates).
> Retain the overall HTS setting when changing modes rather than
> resetting it to a default.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f98aad74fe584a18e2fe7126f92bf294762a54e3..970e6362d0ae3a9078daf337155e83d637bc1ca1 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -76,8 +76,10 @@
>
>  #define IMX219_VBLANK_MIN		32
>
> -/* HBLANK control - read only */
> -#define IMX219_PPL_DEFAULT		3448
> +/* HBLANK control range */
> +#define IMX219_PPL_MIN			0x0d78
> +#define IMX219_PPL_MAX			0x7ff0
> +#define IMX219_REG_HTS			CCI_REG16(0x0162)
>
>  #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
>  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
> @@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		cci_write(imx219->regmap, IMX219_REG_VTS,
>  			  format->height + ctrl->val, &ret);
>  		break;
> +	case V4L2_CID_HBLANK:
> +		cci_write(imx219->regmap, IMX219_REG_HTS,
> +			  format->width + ctrl->val, &ret);
> +		break;
>  	case V4L2_CID_TEST_PATTERN_RED:
>  		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
>  			  ctrl->val, &ret);
> @@ -496,12 +502,10 @@ static int imx219_init_controls(struct imx219 *imx219)
>  					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
>  					   IMX219_VTS_MAX - mode->height, 1,
>  					   mode->vts_def - mode->height);
> -	hblank = IMX219_PPL_DEFAULT - mode->width;
> +	hblank = IMX219_PPL_MIN - mode->width;
>  	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>  					   V4L2_CID_HBLANK, hblank, hblank,
>  					   1, hblank);
> -	if (imx219->hblank)
> -		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	exposure_max = mode->vts_def - 4;
>  	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  		exposure_max : IMX219_EXPOSURE_DEFAULT;
> @@ -817,6 +821,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
>  	unsigned int bin_h, bin_v;
> +	u32 prev_hts;
> +
> +	format = v4l2_subdev_state_get_format(state, 0);
> +	prev_hts = format->width + imx219->hblank->val;
>
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
> @@ -824,8 +832,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  				      fmt->format.width, fmt->format.height);
>
>  	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> -
> -	format = v4l2_subdev_state_get_format(state, 0);
>  	*format = fmt->format;
>
>  	/*
> @@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					 exposure_max, imx219->exposure->step,
>  					 exposure_def);
>  		/*
> -		 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> -		 * depends on mode->width only, and is not changeble in any
> -		 * way other than changing the mode.
> +		 * Retain PPL setting from previous mode so that the
> +		 * line time does not change on a mode change.
> +		 * Limits have to be recomputed as the controls define
> +		 * the blanking only, so PPL values need to have the
> +		 * mode width subtracted.
>  		 */
> -		hblank = IMX219_PPL_DEFAULT - mode->width;
> -		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> -					 hblank);
> +		hblank = prev_hts - mode->width;
> +		__v4l2_ctrl_modify_range(imx219->hblank,
> +					 IMX219_PPL_MIN - mode->width,
> +					 IMX219_PPL_MAX - mode->width,
> +					 1, IMX219_PPL_MIN - mode->width);
> +		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);

Thanks, this now looks correct to me

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

>  	}
>
>  	return 0;
>
> --
> 2.47.0
>
>

