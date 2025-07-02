Return-Path: <linux-media+bounces-36486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A22AF0733
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 02:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6BF1C07214
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A0E17F7;
	Wed,  2 Jul 2025 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SJmKRD5B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F3139B
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751415495; cv=none; b=aLtt0pyPdOxkCu2IhEBmL7NEd0nXopZcmPz0UI1i7YS6748S0KetjV8LyD6rmgq9NybORSO6m/orUpYNBFBwVISOPdPHjTk3SKuhKhmSO+JaaQcnXEo4OcV1aRXzt1rNWe6Fmg+RbFk4XTbS3awefNane9XTiPNluGGbhHjdDGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751415495; c=relaxed/simple;
	bh=8PlsIZ6g3scn8WFouS5+jWRUGiSA87a5hnWO8Ziuv7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8BO3XpRL8Xzv1zU4KEGzCsqro8QgN3bG7Ol1fy8eVGP9FbfEC34UpdLR3slun1K0Vt3czMGtFT3uF5KWiSlkDNBVc8o/1idPyjRzTspW3o09TRAm/x8eGXnvsTcjsl/RwKT3Fo3N27uZ+HM2H8vxJNu3RW2YWGn3mDuGFle9wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SJmKRD5B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 754A5111D;
	Wed,  2 Jul 2025 02:17:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751415469;
	bh=8PlsIZ6g3scn8WFouS5+jWRUGiSA87a5hnWO8Ziuv7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJmKRD5BG78FOcDM1Bknwa8cL45C3Uke37s2l4JTj1BRv2V2LWZeYq41OCvdtG06l
	 E5+8T9aMBhU+jLtGrDdMhDBcI/EC/dtZPeEpjaImXz5ZH0r5gnRQGqYNpAPyLn2STA
	 UEtrVL+gkZlxzOrug6Ntq9vhF9x6qa/V9LllQhtI=
Date: Wed, 2 Jul 2025 03:17:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 09/15] media: mt9m114: Add and use
 mt9m114_ifp_get_border() helper function
Message-ID: <20250702001745.GD17819@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-10-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-10-hansg@kernel.org>

Hi Hans,

On Sun, Jun 29, 2025 at 10:56:19PM +0200, Hans de Goede wrote:
> Normally the IFP removes a 4 pixel border all around its sink format
> size for demosaicing. But in RAW10 mode it does not do this.
> 
> Add a new mt9m114_ifp_get_border() helper function to get the border size
> (4 or 0) and use this where applicable instead of hardcoding a border
> of 4 pixels everywhere.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Changes in v3:
> - New patch in v3 of this patch-set
> ---
>  drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index d4aad77b095b..020caae95a3d 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -843,6 +843,18 @@ static int mt9m114_configure_pa(struct mt9m114 *sensor,
>  	return ret;
>  }
>  
> +/*
> + * For src pad fmts other then RAW10 the IFP removes a 4 pixel border from its

"source pad formats"

> + * sink pad format size for demosaicing.
> + */
> +static int mt9m114_ifp_get_border(struct v4l2_subdev_state *state)
> +{
> +	const struct v4l2_mbus_framefmt *format =
> +		v4l2_subdev_state_get_format(state, 1);
> +
> +	return format->code == MEDIA_BUS_FMT_SGRBG10_1X10 ? 0 : 4;
> +}
> +
>  static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>  				 struct v4l2_subdev_state *state)
>  {
> @@ -850,6 +862,7 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>  	const struct v4l2_mbus_framefmt *format;
>  	const struct v4l2_rect *crop;
>  	const struct v4l2_rect *compose;
> +	unsigned int border;
>  	u64 output_format;
>  	int ret = 0;
>  
> @@ -864,15 +877,18 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>  		return ret;
>  
>  	/*
> +	 * For src pad fmts other then RAW10 adjust cropping coordinates for

Ditto.

>  	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
>  	 * and top coordinates to compensate for the lines and columns removed
>  	 * by demosaicing that are taken into account in the crop rectangle but
>  	 * not in the hardware.

But while at it this can be improved, as it took me a moment to remember
what was going on.

	/*
	 * Color pipeline (IFP) cropping and scaling. The crop window registers
	 * apply cropping after demosaicing, which itself consumes 4 pixels on
	 * each side of the image. The crop rectangle exposed to userspace
	 * includes that demosaicing border, subtract it from the left and top
	 * coordinates to configure the crop window.
	 */

>  	 */
> +	border = mt9m114_ifp_get_border(state);
> +
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
> -		  crop->left - 4, &ret);
> +		  crop->left - border, &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
> -		  crop->top - 4, &ret);
> +		  crop->top - border, &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
>  		  crop->width, &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
> @@ -1845,6 +1861,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
>  {
>  	const struct v4l2_mbus_framefmt *format;
>  	const struct v4l2_rect *crop;
> +	unsigned int border;
>  	int ret = 0;
>  
>  	/* Crop and compose are only supported on the sink pad. */
> @@ -1859,15 +1876,17 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  		/*
> -		 * The crop default and bounds are equal to the sink
> -		 * format size minus 4 pixels on each side for demosaicing.
> +		 * Crop defaults and bounds are equal to the sink format size.
> +		 * For src pad fmts other then RAW10 this gets reduced by 4

"For source pad formats".

> +		 * pixels on each side for demosaicing.
>  		 */
>  		format = v4l2_subdev_state_get_format(state, 0);
> +		border = mt9m114_ifp_get_border(state);
>  
> -		sel->r.left = 4;
> -		sel->r.top = 4;
> -		sel->r.width = format->width - 8;
> -		sel->r.height = format->height - 8;
> +		sel->r.left = border;
> +		sel->r.top = border;
> +		sel->r.width = format->width - 2 * border;
> +		sel->r.height = format->height - 2 * border;
>  		break;
>  
>  	case V4L2_SEL_TGT_COMPOSE:
> @@ -1902,6 +1921,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
>  	struct v4l2_rect *compose;
> +	unsigned int border;
>  
>  	if (sel->target != V4L2_SEL_TGT_CROP &&
>  	    sel->target != V4L2_SEL_TGT_COMPOSE)
> @@ -1917,21 +1937,23 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  
>  	if (sel->target == V4L2_SEL_TGT_CROP) {
>  		/*
> -		 * Clamp the crop rectangle. Demosaicing removes 4 pixels on
> -		 * each side of the image.
> +		 * Clamp the crop rectangle. For src pad fmts other then RAW10

Same here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		 * demosaicing removes 4 pixels on each side of the image.
>  		 */
> -		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), 4,
> -				     format->width - 4 -
> +		border = mt9m114_ifp_get_border(state);
> +
> +		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), border,
> +				     format->width - border -
>  				     MT9M114_SCALER_CROPPED_INPUT_WIDTH);
> -		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), 4,
> -				    format->height - 4 -
> +		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), border,
> +				    format->height - border -
>  				    MT9M114_SCALER_CROPPED_INPUT_HEIGHT);
>  		crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
>  				      MT9M114_SCALER_CROPPED_INPUT_WIDTH,
> -				      format->width - 4 - crop->left);
> +				      format->width - border - crop->left);
>  		crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
>  				       MT9M114_SCALER_CROPPED_INPUT_HEIGHT,
> -				       format->height - 4 - crop->top);
> +				       format->height - border - crop->top);
>  
>  		sel->r = *crop;
>  

-- 
Regards,

Laurent Pinchart

