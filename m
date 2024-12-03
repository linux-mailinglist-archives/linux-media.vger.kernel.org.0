Return-Path: <linux-media+bounces-22549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48A9E29BC
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 18:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56B93BC1552
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 15:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CA81F76C2;
	Tue,  3 Dec 2024 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tp6R/WZg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE111F7561;
	Tue,  3 Dec 2024 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733241341; cv=none; b=dbzLAR4j+EJGhso34AMWHWx38aB/aaB1qO6JBqgkfAXqflDuYIxLuYhtTEPRs7W1HW+midJh3P4c3mM+TsHFgBnQVXPibEFzy0AzMkHLi9sgVpiox8vrIiP5dy+n2o7A3FbgJwiBOCkaHeD30zOKpRsTNIMyvGivIKIshiJv+3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733241341; c=relaxed/simple;
	bh=hqpkMBm3NuV63rfCkCEywvqgAAX+X8aBzBPdBfquESU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVCYvA75MJgIEpcc/iWkS5eGLiAVRj06AZN+CUo7SDp+o8Fawdr7b5IHb6hwBvSBYO/071v/OyoSuv7pbL1tDRJxL8SPw4W5lTF3q2lNSZekpd8DVzRD1287YiU6i0ROejB2xUQecXuqGBJdIDJ9PKh9vWcZjWV0OhABitpY0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tp6R/WZg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9E0B8DB;
	Tue,  3 Dec 2024 16:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733241309;
	bh=hqpkMBm3NuV63rfCkCEywvqgAAX+X8aBzBPdBfquESU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tp6R/WZgqynPpzj2ON6vEPkWvH55Bd14Q4ZGXw7/KJYXi1Z5E37wFoVE+mFoRAmjS
	 O1SItt9niyqYmQq8/d+4EBleloV5t1J/OeSwTT4QcqjoUtFz0TkXP+UJNe8dwmQIky
	 o43vRIFBSVGI3YutoI78qiZsDJVuqmva4rp7ACoU=
Date: Tue, 3 Dec 2024 17:55:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/2] media: uvcvideo: Support partial control reads
Message-ID: <20241203155525.GB26936@pendragon.ideasonboard.com>
References: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
 <20241128-uvc-readless-v5-1-cf16ed282af8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128-uvc-readless-v5-1-cf16ed282af8@chromium.org>

On Thu, Nov 28, 2024 at 08:53:41PM +0000, Ricardo Ribalda wrote:
> Some cameras, like the ELMO MX-P3, do not return all the bytes
> requested from a control if it can fit in less bytes.
> Eg: Returning 0xab instead of 0x00ab.
> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> 
> Extend the returned value from the camera and return it.
> 
> Cc: stable@vger.kernel.org
> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cd9c29532fb0..67f714bca417 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -79,6 +79,27 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> +	/*
> +	 * Some devices return shorter USB control packets than expected if the
> +	 * returned value can fit in less bytes. Zero all the bytes that the
> +	 * device has not written.
> +	 *
> +	 * This quirk is applied to all controls, regardless of their data type.
> +	 * Most controls are little-endian integers, in which case the missing
> +	 * bytes become 0 MSBs. For other data types, a different heuristic
> +	 * could be implemented if a device is found needing it.
> +	 *
> +	 * We exclude UVC_GET_INFO from the quirk. UVC_GET_LEN does not need
> +	 * to be excluded because its size is always 1.
> +	 */
> +	if (ret > 0 && query != UVC_GET_INFO) {
> +		memset(data + ret, 0, size - ret);
> +		dev_warn_once(&dev->udev->dev,
> +			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> +			      uvc_query_name(query), cs, unit, ret, size);
> +		return 0;
> +	}
> +
>  	if (ret != -EPIPE) {
>  		dev_err(&dev->udev->dev,
>  			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",

-- 
Regards,

Laurent Pinchart

