Return-Path: <linux-media+bounces-20776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A18279BAF7A
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A76F1F2141A
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31831AC456;
	Mon,  4 Nov 2024 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gSibGHcX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D026FC5;
	Mon,  4 Nov 2024 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712036; cv=none; b=a4dy5j4749QD2b1uebAZId0DtOtfKcDWjwiMR3hWjH+JdIk6XTcfdYOQ0xX7tWjSqDYFWeJnAIyo+6ekRs6QT6S6X6f8fcvf/JX+xgFuSrJJ1C4LfvVtBRXJXVEhIB58oLuMHLYL2jP6I1mhGkzmx2AFC947n1z1uBLyLYFQ4Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712036; c=relaxed/simple;
	bh=9MoJFLHTsj+z0yLlrwSovtPsMAGDgZCB1w2bSpJSUVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSFGO+OOUhi5yZtNsrLOqcVsjKVu4TOr/UJN8qTFeSOAmpgHCd13QKc0xD8E+twhYS6IkrRQbyfq0HhdQyqt8L12T6v+yx4qJy/b6t37w7MKNTm3aR8feBAuFGKPUORYFTYY+kRhTdK7VsjNC3rMsuNsp/b16W/574nrP/Hk1ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gSibGHcX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-48-188.net.vodafone.it [5.90.48.188])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E9822E;
	Mon,  4 Nov 2024 10:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730712025;
	bh=9MoJFLHTsj+z0yLlrwSovtPsMAGDgZCB1w2bSpJSUVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSibGHcXzairr8MfE2TfeC3Tru75uXM+NYntAPxUKjGvWjw43TxdtzFDVZmrZswnu
	 qPFT9BZ4d+jWlW98o3XA/uPvjAnrilLv3nPF88wP4tU/y6cB7TesSyBQurpJuUxStp
	 qRV2WkY8veRbR3he5KjaM0nirIolnjT04I8A6YN8=
Date: Mon, 4 Nov 2024 10:20:28 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Message-ID: <efhupkcwr5ujwujdxigtltu5lrvdoa4shnquio4hwa2jijkvdu@ofxy5zvslvf7>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>

Hi Jai, Dave

On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
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
>  drivers/media/i2c/imx219.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f98aad74fe584a18e2fe7126f92bf294762a54e3..de9230d4ad81f085640be254db9391ae7ad20773 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -76,8 +76,10 @@
>
>  #define IMX219_VBLANK_MIN		32
>
> -/* HBLANK control - read only */
> -#define IMX219_PPL_DEFAULT		3448
> +/* HBLANK control range */
> +#define IMX219_PPL_MIN			3448
> +#define IMX219_PPL_MAX			0x7ff0

nit: I wold have rather made these two either both hex or both
decimal (my preference is for hex as it matches the registers
0x1144-0x1147 registers)

Also, yes:
min_line_length_pck = 0x0d78 = 3448

but:
min_line_blanking_pck = 0xa8 = 168

But as the max supported output width is 3280 and (3448 - 168 = 3280) I
think it's fine listing PLL_MIN only

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

According to Sakari's comment, should you in the next patch scale
hblank by the rate factor has done for vts and pixel rate ?

> +		break;
>  	case V4L2_CID_TEST_PATTERN_RED:
>  		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
>  			  ctrl->val, &ret);
> @@ -496,12 +502,11 @@ static int imx219_init_controls(struct imx219 *imx219)
>  					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
>  					   IMX219_VTS_MAX - mode->height, 1,
>  					   mode->vts_def - mode->height);
> -	hblank = IMX219_PPL_DEFAULT - mode->width;
> +	hblank = IMX219_PPL_MIN - mode->width;
>  	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> -					   V4L2_CID_HBLANK, hblank, hblank,
> +					   V4L2_CID_HBLANK, hblank,
> +					   IMX219_PPL_MIN - mode->width,

Can't you use 'hblank' again here ?

>  					   1, hblank);
> -	if (imx219->hblank)
> -		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	exposure_max = mode->vts_def - 4;
>  	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  		exposure_max : IMX219_EXPOSURE_DEFAULT;
> @@ -842,6 +847,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		u32 prev_hts = format->width + imx219->hblank->val;
>  		int exposure_max;
>  		int exposure_def;
>  		int hblank;
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

Two years ago I wrote this
https://patchwork.linuxtv.org/project/linux-media/patch/20221121181515.34008-2-jacopo@jmondi.org/

which hasn't progressed since then but I presume was based on some
sort of consensus.

Is it worth a respin ?

>  		 */
> -		hblank = IMX219_PPL_DEFAULT - mode->width;
> -		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> -					 hblank);
> +		hblank = prev_hts - mode->width;

And as far as I can tell mode->width == format->width because of the
above

	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
	format = v4l2_subdev_state_get_format(state, 0);
	*format = fmt->format;

so here you have

		u32 prev_hts = format->width + imx219->hblank->val;
                hblank = (format->widht + imx219->hblank->val)
                       - format->width;

so that:
                hblank == imx219->hblank->val;


> +		__v4l2_ctrl_modify_range(imx219->hblank,
> +					 IMX219_PPL_MIN - mode->width,
> +					 IMX219_PPL_MAX - mode->width,
> +					 1, IMX219_PPL_MIN - mode->width);
> +		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);

So here you're writing hblank to the same value (clamped by the
framework in the new limits). So you're not retaining line lenght but
the blanking value, which seems to contradict the comment. Or am I
missing something here ?

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

