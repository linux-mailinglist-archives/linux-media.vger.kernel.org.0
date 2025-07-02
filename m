Return-Path: <linux-media+bounces-36487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7DAF074A
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 02:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0394D1643F8
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C36ED299;
	Wed,  2 Jul 2025 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BYHK8Uqq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA005BE4E
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751416381; cv=none; b=VlUQMMx7eLiqDIQRd97oTB+7Y8UwZ01jGpndyqmnk6VbdjBIJoM3eu4/5kH66qmdEOvPaodJkH5ZfyFdHnq3q19TamIqhH7LkQBi4Pk4FPiZ5eZEdBQECJxAkTpXIxzuhKE8xrGrZESYke07TAsjLjFOZ1+4sIj5xhsS6ZsWEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751416381; c=relaxed/simple;
	bh=7j/oki1ZOz6b4wCytwGc44O4A7EvEOTKHXwoWDyMxME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiQXTjW5kkCN8nrf1nbs/dOGnYU7qii0aI9RqR7+HEYW8JpS0Pg6qKce9ZVFxLH785Gu+j8hMTPXZVdTalOEAal+SZf6T+O25OcKV4KjdfI8hVaP6T5xPmGcs5eOL8kiLAd26ITBbOVrXnKuLxOhVrxjt3+1dENWrrmW5qx6/3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BYHK8Uqq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 36D3819E3;
	Wed,  2 Jul 2025 02:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751416355;
	bh=7j/oki1ZOz6b4wCytwGc44O4A7EvEOTKHXwoWDyMxME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYHK8UqqASvxWicL22lkayeW8ipn41VP8fnDe+4/MrXR/lkBPmb/gW57MetDCAdjc
	 79sOll03SfcZCRir/XcH9ValMwe6758LXdoOqkYBmE/GjlkTH5Sif0sP/4AQCJhNYd
	 c2LAIRjXwjEACB9ouxJySo/UmMbs0L20/HI2Ywik=
Date: Wed, 2 Jul 2025 03:32:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 10/15] media: mt9m114: Adjust IFP selections and src
 format when src pixelfmt changes to/from RAW10
Message-ID: <20250702003231.GE17819@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-11-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-11-hansg@kernel.org>

On Sun, Jun 29, 2025 at 10:56:20PM +0200, Hans de Goede wrote:
> Changing the IFP src pad pixelfmt to RAW10 means disabling the scaler,

s/src/source/
s/pixelfmt/format/ or "media bus code", as this isn't a pixel format

Same below.

> which means that the crop and compose rectangles must be reset to
> match the sink format size with no border.
> 
> And when changing the src pad pixelfmt back from RAW10 to another pixelfmt
> which require demosaicing the crop and compose rectangles must be reset
> to the sink format size minus a 4 pixels border all around it.
> 
> Also when changing the src pad pixelfmt back from RAW10 to another pixelfmt
> the colorspace, ycbcr_enc and quantization need to be updated too.
> 
> Add a new mt9m114_ifp_update_sel_and_src_fmt() helper which resets all
> these taking the bordersize for the new src pixelfmt into account and
> call this helper whenever the src pad pixelfmt changes to/from RAW10.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Changes in v3:
> - This is a new patch in v3 of this patch-set, which comes from splitting
>   up "media: mt9m114: Fix scaler bypass mode" into multiple patches
> ---
>  drivers/media/i2c/mt9m114.c | 53 +++++++++++++++++++++++++++++++++----
>  1 file changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 020caae95a3d..ef27780384f2 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1820,6 +1820,40 @@ static int mt9m114_ifp_enum_frameintervals(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +/*
> + * Helper function to update IFP crop, compose rects and src format when

s/rects/rectangles/

> + * the pixel border size changes, which requires resetting these.
> + */
> +static void mt9m114_ifp_update_sel_and_src_fmt(struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *src_format, *sink_format;
> +	struct v4l2_rect *crop;
> +	unsigned int border;
> +
> +	sink_format = v4l2_subdev_state_get_format(state, 0);
> +	src_format = v4l2_subdev_state_get_format(state, 1);
> +	crop = v4l2_subdev_state_get_crop(state, 0);
> +	border = mt9m114_ifp_get_border(state);
> +
> +	crop->left = border;
> +	crop->top = border;
> +	crop->width = sink_format->width - 2 * border;
> +	crop->height = sink_format->height - 2 * border;
> +	*v4l2_subdev_state_get_compose(state, 0) = *crop;
> +
> +	src_format->width = crop->width;
> +	src_format->height = crop->height;

Please add a blank line here.

> +	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
> +		src_format->colorspace = V4L2_COLORSPACE_RAW;
> +		src_format->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +		src_format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	} else {
> +		src_format->colorspace = V4L2_COLORSPACE_SRGB;
> +		src_format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +		src_format->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	}
> +}
> +
>  static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *fmt)
> @@ -1843,11 +1877,20 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>  		/* Only the media bus code can be changed on the source pad. */
>  		info = mt9m114_format_info(sensor, 1, fmt->format.code);
>  
> -		format->code = info->code;
> -
> -		/* If the output format is RAW10, bypass the scaler. */
> -		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
> -			*format = *v4l2_subdev_state_get_format(state, 0);
> +		/*
> +		 * If the output format changes from/to RAW10 then the crop
> +		 * rectangle needs to be adjusted to add / remove the 4 pixel
> +		 * border used for demosaicing. And these changes then need to
> +		 * be propagated to the compose rectangle and src format size.
> +		 */
> +		if (format->code != info->code &&
> +		    (format->code == MEDIA_BUS_FMT_SGRBG10_1X10 ||
> +		     info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {

This would be shorter:

		if ((format->code == MEDIA_BUS_FMT_SGRBG10_1X10) !=
		    (info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {

Whether or not it's more readable may be a matter of personal preference
though.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			format->code = info->code;
> +			mt9m114_ifp_update_sel_and_src_fmt(state);
> +		} else {
> +			format->code = info->code;
> +		}
>  	}
>  
>  	fmt->format = *format;

-- 
Regards,

Laurent Pinchart

