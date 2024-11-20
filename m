Return-Path: <linux-media+bounces-21641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B259D3D02
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7090B233DE
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD631ADFE8;
	Wed, 20 Nov 2024 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q17L4aZU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C681AAE3B;
	Wed, 20 Nov 2024 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111539; cv=none; b=lTq6LlZt4343bKmjs3TFWZHFwW/ng/CgiFadEvhppX2+K4nSHEfzzWPe2VbTIZkUBh9TVoaT1oZcYLLsELBYoaneoyouARBlX/GDYyH3Hzh/nni0mAgP8HHYQBaQWv8OkY+WeDbgh7sen5abC3et4XS72+lYmAKgtfwcKm18il8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111539; c=relaxed/simple;
	bh=vd3kzFSdbl2IkePtTWEbaOck39V/PY35YREvWDd9Dbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paEWBwG4kQ9mfzmwON7HXZw9lxfpRiWvI+MOBZ1qZKJAvDJ1cLYDSqNhOytgtkabkiShC/xqcJPZ9dph8Og1NvxmFnWJtJheTxP8kVf+/i/Ac1WYGpptaD+qL3fwf1s68qjQs2hwRIYHjz5fgYbO/KWuDqo7l0q4pdH6RlYLw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q17L4aZU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B22CE55A;
	Wed, 20 Nov 2024 15:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732111517;
	bh=vd3kzFSdbl2IkePtTWEbaOck39V/PY35YREvWDd9Dbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q17L4aZUuwLbMZwOFHxsV+SrY4/4w67FbIHv7GA3buMDLNqj/058HkfG7pJtmIJtM
	 sGKsAVb4tQVdl/YF0Nyzj8jiBbEC+KsPK6VFhqdwE7yh065GSUZKNIbo36SOVBP5Yz
	 1V2crDAgfRWYU7/8Ycdv1TtoKJMrK2E3CqV7Gzq0=
Date: Wed, 20 Nov 2024 16:05:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Support partial control reads
Message-ID: <20241120140526.GW12409@pendragon.ideasonboard.com>
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
 <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Nov 18, 2024 at 05:16:51PM +0000, Ricardo Ribalda wrote:
> Some cameras, like the ELMO MX-P3, do not return all the bytes
> requested from a control if it can fit in less bytes.
> Eg: Returning 0xab instead of 0x00ab.
> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> 
> Extend the returned value from the camera and return it.
> 
> Cc: stable@vger.kernel.org
> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cd9c29532fb0..e165850397a0 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -76,8 +76,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  
>  	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
>  				UVC_CTRL_CONTROL_TIMEOUT);
> -	if (likely(ret == size))
> +	if (ret > 0) {
> +		if (size == ret)
> +			return 0;

Why is this within the ret > 0 block ? I would write

	if (likely(ret == size))
		return 0;

	if (ret > 0) {

> +
> +		/*
> +		 * In UVC the data is represented in little-endian by default.

By default, or always ?

> +		 * Some devices return shorter control packages that expected

What's a "control package" ?

I think you meants "than expected", not "that expected".

> +		 * if the return value can fit in less bytes.
> +		 * Zero all the bytes that the device have not written.
> +		 */

Do we want to apply this workaround to GET_INFO and GET_LEN, or can we
restrict it to GET_CUR, GET_MIN, GET_MAX and GET_RES ?

> +		memset(data + ret, 0, size - ret);
> +		dev_warn_once(&dev->udev->dev,
> +			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> +			      uvc_query_name(query), cs, unit, ret, size);
>  		return 0;
> +	}
>  
>  	if (ret != -EPIPE) {
>  		dev_err(&dev->udev->dev,
> 

-- 
Regards,

Laurent Pinchart

