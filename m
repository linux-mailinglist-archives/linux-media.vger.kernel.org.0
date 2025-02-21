Return-Path: <linux-media+bounces-26564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B0A3F2DD
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A13747A8ADD
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B9620767F;
	Fri, 21 Feb 2025 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MVX1YyLm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05082AE89;
	Fri, 21 Feb 2025 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137011; cv=none; b=rjJyEinwhahh/shm/UxEdG/68ZLj9RvOwfy5YJnE72kN/mYSLBFMNWc83F/55nXPvgS/3U0ZpIB9x2Kg2N+cvHtNs7VWmj0IsXf1nmnWe8ljjvEyM3lN+Bc1ANto+n5Eisl6EjS7l8uceywU2hj2agUhEVuavtYwKYjae4zcJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137011; c=relaxed/simple;
	bh=qeqsnB+DmIfUYYElzF1tx523ynMLLg1GYO2OThDko4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hmq5b9lprI2Vp6Wh1iSD3Y2Az455nOnD9pnXK8fL3bAMre9W99nXzQBAWEkSrOb59G7oXewrQgCPDPbvm3BTpGQSy1MQW0DF+J+YbKpEoAx9LQL9xlQTyI88Xo18aeqPC6jNk3asuoh+s8nAREZLEOjP3DcZ/9fdTcUl70ZcPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MVX1YyLm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E805089A;
	Fri, 21 Feb 2025 12:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740136924;
	bh=qeqsnB+DmIfUYYElzF1tx523ynMLLg1GYO2OThDko4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVX1YyLmp5OGCAN2EuM1XVVdMTjy1mtl7M6ls3d9h0AsMvCJ50cCvE444ij52nA1G
	 pbavn0K9MRsuLViL74ffBBGz9njDNY/Ylw/7LrcJ7YnORZt/XJyeYn8mUFno2ODgUi
	 NQTpB5ES5GPbcs0n2W85UkUoI/brf/deXb++PGk8=
Date: Fri, 21 Feb 2025 12:23:25 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Only use higher LLP_MIN for
 binned resolutions
Message-ID: <l5dlju2c7erjjt7xntmxdxr66yh66aozueohpmam3q2iijpnsl@mj3kb5tszhf7>
References: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
 <20250221-imx219_fixes_v2-v2-3-a72154c7c267@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221-imx219_fixes_v2-v2-3-a72154c7c267@ideasonboard.com>

Hi Jai

On Fri, Feb 21, 2025 at 04:22:15PM +0530, Jai Luthra wrote:
> The LLP_MIN of 3560 is only needed to fix artefacts seen with binned
> resolutions. As increasing the LLP reduces the highest possible
> framerate by ~3%, use the old default minimum of 3448 if we are not
> doing 2x2 analog binning.
>
> Also restore the fll_def value for non-binned modes in the modes
> definition to restore the default mode framerate to 30fps.
>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Link: https://lore.kernel.org/linux-media/CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v2:
>     - Fix the binning check, and only update the LLP minimum if we are
>       doing analog binning
>     - Add a note in the commit message for the fll_def value reverts
> ---
>  drivers/media/i2c/imx219.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2081822533f9dff0a1ca93a09dd8333ec4043645..ec8d32b0f9e75b4b14d905b1e6b85180e5697ce1 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,8 @@
>  #define IMX219_FLL_MAX			0xffff
>  #define IMX219_VBLANK_MIN		32
>  #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
> -#define IMX219_LLP_MIN			0x0de8
> +#define IMX219_LLP_MIN			0x0d78
> +#define IMX219_BINNED_LLP_MIN		0x0de8
>  #define IMX219_LLP_MAX			0x7ff0
>
>  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
> @@ -311,13 +312,13 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 8MPix 15fps mode */
>  		.width = 3280,
>  		.height = 2464,
> -		.fll_def = 3415,
> +		.fll_def = 3526,
>  	},
>  	{
>  		/* 1080P 30fps cropped */
>  		.width = 1920,
>  		.height = 1080,
> -		.fll_def = 1707,
> +		.fll_def = 1763,
>  	},
>  	{
>  		/* 2x2 binned 60fps mode */
> @@ -865,7 +866,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx219_mode *mode;
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> -	unsigned int bin_h, bin_v;
> +	u8 bin_h, bin_v;
>  	u32 prev_line_len;
>
>  	format = v4l2_subdev_state_get_format(state, 0);
> @@ -895,7 +896,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		int exposure_max;
>  		int exposure_def;
> -		int hblank;
> +		int hblank, llp_min;

very minor nit: all other variables are declared one per line.

The rest looks good
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  		int pixel_rate;
>
>  		/* Update limits and set FPS to default */
> @@ -912,6 +913,19 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					 imx219->exposure->minimum,
>  					 exposure_max, imx219->exposure->step,
>  					 exposure_def);
> +
> +		/*
> +		 * With analog binning the default minimum line length of 3448
> +		 * can cause artefacts with RAW10 formats, because the ADC
> +		 * operates on two lines together. So we switch to a higher
> +		 * minimum of 3560.
> +		 */
> +		imx219_get_binning(state, &bin_h, &bin_v);
> +		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
> +				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
> +		__v4l2_ctrl_modify_range(imx219->hblank, llp_min - mode->width,
> +					 IMX219_LLP_MAX - mode->width, 1,
> +					 llp_min - mode->width);
>  		/*
>  		 * Retain PPL setting from previous mode so that the
>  		 * line time does not change on a mode change.
> @@ -920,10 +934,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  		 * mode width subtracted.
>  		 */
>  		hblank = prev_line_len - mode->width;
> -		__v4l2_ctrl_modify_range(imx219->hblank,
> -					 IMX219_LLP_MIN - mode->width,
> -					 IMX219_LLP_MAX - mode->width, 1,
> -					 IMX219_LLP_MIN - mode->width);
>  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
>
>  		/* Scale the pixel rate based on the mode specific factor */
>
> --
> 2.48.1
>

