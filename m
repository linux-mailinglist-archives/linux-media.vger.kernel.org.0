Return-Path: <linux-media+bounces-49877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98920CF1448
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECA3D300441B
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0370B2D3ECF;
	Sun,  4 Jan 2026 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ghsLiKF+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2781C84A0;
	Sun,  4 Jan 2026 19:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767556243; cv=none; b=dK39MQunaVf8Io5HI4RTOjlscmkt9/N6yEETUbYTRjviSE4crjkSA+TPTzWIxMOUVc1PYV93cR3BjEoewre67Wa6PTQdAL+9/fbdAok29Sp2xF6T5p0OyCYrkbX26/XFLsi8XNRslPHsVfg3jHf3QkULutOS3Sg4v0mv1GZCGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767556243; c=relaxed/simple;
	bh=6ukWqjRpQdjYYJyk9p/qs+RmptkqD1TpF6rvsMVlAJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foKZML9ufAO2A3BJ5rVKhC1KUDr0szOWH/xJpTrF/lgiX6QtkudsC8b0kcSFnHPax8yD7kTGHEnQbnSApMAUPCxOsX3Ni2ZeK6epm1jFF0+d1djgiGEYV1AHtshfAyfEEMIAORCjK++F/J0Xk91fFfV/X9Gmf7g7XfHUurC4elY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ghsLiKF+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0D9DA502;
	Sun,  4 Jan 2026 20:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767556212;
	bh=6ukWqjRpQdjYYJyk9p/qs+RmptkqD1TpF6rvsMVlAJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghsLiKF+jc4sHc1O//wSYBtqnsy8WJ9XMq9c5C7ig9/GBEQH89aTDc+yc1lk/DkuV
	 cD8IsWJm8kg1DofjqOyCU/htr8Ui7yWaW7uRUSRIr/mu9Pb/a05Yz1Gxwb3AwP8xNq
	 mCkNSCpCahY/blIpcvcC5yQJtADJLedaFMCF1Qb4=
Date: Sun, 4 Jan 2026 21:50:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Use scope-based cleanup helper
Message-ID: <20260104195013.GA4898@pendragon.ideasonboard.com>
References: <20260104064520.115462-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260104064520.115462-1-chenchangcheng@kylinos.cn>

On Sun, Jan 04, 2026 at 02:45:20PM +0800, Chen Changcheng wrote:
> Replace the manual kfree() with __free(kfree) annotation for data
> references. This aligns the code with the latest kernel style.

There are more occurrences through the driver, please address them all.

> No functional change intended.
> 
> Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 2094e059d7d3..1ee06d597431 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -291,7 +291,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  	struct uvc_streaming_control *ctrl, int probe, u8 query)
>  {
>  	u16 size = uvc_video_ctrl_size(stream);
> -	u8 *data;
> +	u8 *data __free(kfree) = NULL;
>  	int ret;
>  
>  	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) &&
> @@ -317,8 +317,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  			"supported. Enabling workaround.\n");
>  		memset(ctrl, 0, sizeof(*ctrl));
>  		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
> -		ret = 0;
> -		goto out;
> +		return 0
>  	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
>  		/*
>  		 * Many cameras don't support the GET_DEF request on their
> @@ -328,15 +327,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  		uvc_warn_once(stream->dev, UVC_WARN_PROBE_DEF, "UVC non "
>  			"compliance - GET_DEF(PROBE) not supported. "
>  			"Enabling workaround.\n");
> -		ret = -EIO;
> -		goto out;
> +		return -EIO;
>  	} else if (ret != size) {
>  		dev_err(&stream->intf->dev,
>  			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
>  			uvc_query_name(query), probe ? "probe" : "commit",
>  			ret, size);
> -		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
> -		goto out;
> +		return (ret == -EPROTO) ? -EPROTO : -EIO;
>  	}
>  
>  	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
> @@ -371,18 +368,15 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  	 * format and frame descriptors.
>  	 */
>  	uvc_fixup_video_ctrl(stream, ctrl);
> -	ret = 0;
>  
> -out:
> -	kfree(data);
> -	return ret;
> +	return 0;
>  }
>  
>  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>  	struct uvc_streaming_control *ctrl, int probe)
>  {
>  	u16 size = uvc_video_ctrl_size(stream);
> -	u8 *data;
> +	u8 *data __free(kfree) = NULL;
>  	int ret;
>  
>  	data = kzalloc(size, GFP_KERNEL);
> @@ -419,7 +413,6 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>  		ret = -EIO;

You can return -EIO here...

>  	}
>  
> -	kfree(data);
>  	return ret;

... and replace this with return 0. That's a change in behaviour, but as
far as I can tell, none of the callers use the positive return values, so
returning 0 on success should be fine.

>  }
>  
> 
> base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845

-- 
Regards,

Laurent Pinchart

