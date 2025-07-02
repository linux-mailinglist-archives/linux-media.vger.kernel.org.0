Return-Path: <linux-media+bounces-36489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00CAF075B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 02:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A9F421F6F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100E620311;
	Wed,  2 Jul 2025 00:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MoGmjebm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDAB640
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 00:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751416954; cv=none; b=Ki0lYqRyearRpr75D8SFTjD4EFxNguXfb/cRn/EzaE+Q67KK24a3kfgUIcrw+62/X5ulsGq4iA25HIPZOP11R/lWxb87IJ8oKcQPsnHmebl68dJjIR6RoWOdDxD/3s1rJeB4xHaKKPmRxPJMz6TcrHyZsEZJQTKP574ywwZ71u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751416954; c=relaxed/simple;
	bh=WTf39wYTLoEye2E0yr0ghCq2m/8LbKIlGtFRVBHWl8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xt/VnKlOKoPT7JsaGQb2EjR3dkK01nGpWkGfv/S6iOmKVt8Ausg9XoYa7fWAqJOMPHayqRj6bStxNeAUESSYpLy78KIEKMgx3CuZO8Hr7S2aSlJTZRHxmD7/Ri4ULaTn9SL2h9yGFvZQYFvBjMWnPzAa4c26jNyuj8NmbhPwd2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MoGmjebm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9C387111D;
	Wed,  2 Jul 2025 02:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751416928;
	bh=WTf39wYTLoEye2E0yr0ghCq2m/8LbKIlGtFRVBHWl8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoGmjebmZEx2kxFQO7CHm4mFzEVjgS0rPvEo10mjOX60RskwF3WKaZxUTOG6gyNnf
	 JTUhXOVQZk3Zf+7YEeKLAUSXrY9hDRZQWUtCPxjzFEl/mqV3/GJtpa2pc+rxDpgOLm
	 FWioGV1Fk2gti9rYWpLTJ0SLokzoWIvZvl2udL1o=
Date: Wed, 2 Jul 2025 03:42:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 12/15] media: mt9m114: Don't allow changing the IFP
 crop/compose selections when bypassing the scaler
Message-ID: <20250702004204.GG17819@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-13-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-13-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sun, Jun 29, 2025 at 10:56:22PM +0200, Hans de Goede wrote:
> The scaler is bypassed when the ISP source/output pad's pixel-format is
> set to MEDIA_BUS_FMT_SGRBG10_1X10. Don't allow changing the IFP crop and/or
> compose selections when in this mode.
> 
> Instead of returning -EINVAL simply return the current (noop) crop and
> compose rectangles.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Changes in v3:
> - This is a new patch in v3 of this patch-set, which comes from splitting
>   up "media: mt9m114: Fix scaler bypass mode" into multiple patches
> - Add src_format local variable
> ---
>  drivers/media/i2c/mt9m114.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 1f305bba180e..1280d90cd411 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1963,7 +1963,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  				     struct v4l2_subdev_state *state,
>  				     struct v4l2_subdev_selection *sel)
>  {
> -	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_mbus_framefmt *format, *src_format;
>  	struct v4l2_rect *crop;
>  	struct v4l2_rect *compose;
>  	unsigned int border;
> @@ -1976,6 +1976,13 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  	if (sel->pad != 0)
>  		return -EINVAL;
>  
> +	/* Crop and compose cannot be changed when bypassing the scaler. */
> +	src_format = v4l2_subdev_state_get_format(state, 1);
> +	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);

You can move the 

 	crop = v4l2_subdev_state_get_crop(state, 0);

line from below above the if statement, and use

		sel->r = *crop;

here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return 0;
> +	}
> +
>  	format = v4l2_subdev_state_get_format(state, 0);
>  	crop = v4l2_subdev_state_get_crop(state, 0);
>  	compose = v4l2_subdev_state_get_compose(state, 0);
> @@ -2022,9 +2029,8 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  	}
>  
>  	/* Propagate the compose rectangle to the source format. */
> -	format = v4l2_subdev_state_get_format(state, 1);
> -	format->width = compose->width;
> -	format->height = compose->height;
> +	src_format->width = compose->width;
> +	src_format->height = compose->height;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

