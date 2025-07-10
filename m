Return-Path: <linux-media+bounces-37433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30767B00EC9
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 00:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 586CC3AB786
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80F22BE7A6;
	Thu, 10 Jul 2025 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HXstDAwS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E629AB0F;
	Thu, 10 Jul 2025 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752187172; cv=none; b=L/O+oCVoCqC+8vd4C4kT2Nay55UiF4Uke32OzBWPgeYEmh8dETaaa8Rx3BNRGeCBmAR5zb0DLzwC5CQbapq417lWEEW7HI0u01Tttg0YB5WbWQTYGGXoxZyuD/jPVK4Xe9mhXw27gDp7W4qUXMt8p/h+LHoY95NdRvndRJ26qDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752187172; c=relaxed/simple;
	bh=d1KMgSh13M1PiKkI9COA8dfnIkgdhWXR0M2Youowik4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvPSwg2B71Z8YyD6z2g3CeJlOBAiO3aavGYH5lUS4ARGxZ59MZqRXW+lEWeKuBlYD7/UjGTSM7WwHaJnHDfgjc7OzyBWksGQGZiE0mGLHtgVBSh69+GiDYrT/rFVxUo3eDLs9cIZHZJ7TDgA30kqUZXZCYNoEIWulew9Ozd2cis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HXstDAwS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 60A57A57;
	Fri, 11 Jul 2025 00:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752187139;
	bh=d1KMgSh13M1PiKkI9COA8dfnIkgdhWXR0M2Youowik4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXstDAwS8lbwoZh0RoUmmeg/wACyCDiQEK7qd2J/HS/rVVaID2RdWdhp94LKrsKF4
	 R00IAEGSlkCf9JYkBLnwNqqgkt0r5eqPHRY27xVD/3og8uems5Y6e8BeU2ZLu7n6A3
	 FxGpPbekT7bCzOWo+YandnCGw/mtsrM7xzLcITkU=
Date: Fri, 11 Jul 2025 01:38:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v7 1/2] media: mt9m114: Allow set_selection while
 streaming
Message-ID: <20250710223858.GB16271@pendragon.ideasonboard.com>
References: <20250710151340.496218-1-mathis.foerst@mt.com>
 <20250710151340.496218-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710151340.496218-2-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Thu, Jul 10, 2025 at 05:13:39PM +0200, Mathis Foerst wrote:
> The current implementation does not apply changes to the crop-
> configuration of the sensor immediately if the sensor is in
> streaming state. The user has to stop and restart the stream for
> the changes to be applied.

Nitpicking, you need a blank line between two different paragraphs.

> This can be undesirable e.g. in a calibration usecase where the user
> wants to see the impact of his changes in a live video stream.
> Under the condition that the width & height of the cropped image area
> does not change, the changed cropping configuration can be applied to
> the pixel-array immediately without disturbing the IFP.
> 
> Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
> in streaming state and the size of the cropping rectangle didn't change,
> issue a CONFIG_CHANGE to apply the changes immediately.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 42 +++++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 3f540ca40f3c..5f4474d36653 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1287,6 +1287,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	struct mt9m114 *sensor = pa_to_mt9m114(sd);
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> +	int ret = 0;
>  
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
> @@ -1302,25 +1303,40 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	 * binning, but binning is configured after setting the selection, so
>  	 * we can't know tell here if it will be used.
>  	 */
> -	crop->left = ALIGN(sel->r.left, 4);
> -	crop->top = ALIGN(sel->r.top, 2);
> -	crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
> -			      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
> -			      MT9M114_PIXEL_ARRAY_WIDTH - crop->left);
> -	crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> -			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
> -			       MT9M114_PIXEL_ARRAY_HEIGHT - crop->top);
> -
> -	sel->r = *crop;
> +	sel->r.left = ALIGN(sel->r.left, 4);
> +	sel->r.top = ALIGN(sel->r.top, 2);
> +	sel->r.width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
> +			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
> +			       MT9M114_PIXEL_ARRAY_WIDTH - sel->r.left);
> +	sel->r.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> +				MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
> +				MT9M114_PIXEL_ARRAY_HEIGHT - sel->r.top);
> +
> +	/* Changing the selection size is not allowed in streaming state */
> +	if (sensor->streaming &&
> +	    (sel->r.height != crop->height || sel->r.width != crop->width))
> +		return -EBUSY;
> +
> +	*crop = sel->r;
>  
>  	/* Reset the format. */
>  	format->width = crop->width;
>  	format->height = crop->height;
>  
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		mt9m114_pa_ctrl_update_blanking(sensor, format);
> +	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return ret;
>  
> -	return 0;
> +	mt9m114_pa_ctrl_update_blanking(sensor, format);
> +
> +	/* Apply values immediately if streaming */

s/streaming/streaming./

> +	if (sensor->streaming)
> +		ret = mt9m114_configure_pa(sensor, state);
> +		if (ret)
> +			return ret;
> +		/* Changing the cropping config requires a CONFIG_CHANGE */

s/CONFIG_CHANGE/CONFIG_CHANGE./

> +		ret = mt9m114_set_state(sensor,
> +					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);

Misleading indentation, this call is done unconditionally, even when not
streaming. You're forgotten the curly braces.

If any of those calls fail, the rectangle in the "crop" variable will
have been updated but not applied to the hardware. We could restore the
value, or delay storing it in "crop" until the end of the function. It's
probably not really worth it though, so with the above issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {

-- 
Regards,

Laurent Pinchart

