Return-Path: <linux-media+bounces-21439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD4E9C9614
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35966283488
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 23:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695DF1B21A2;
	Thu, 14 Nov 2024 23:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SVY+Kd8Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB61B0F05
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 23:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731626821; cv=none; b=AqqBCEtBcb7LkkIDw1RuxpP0LUPBfQqff/GBVdl93m0eNhHXRmgfa2D6JYnCqIAwC1Y1DMWXniAMnhnR6IsITws7eGRDOZqNOMNNGFuSjaPO+U5UOeRIZlO3XqzpW0fWQWxvK915OAtmX8OGv9WVNvdg9G+sO99zucOGnAmYyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731626821; c=relaxed/simple;
	bh=7MkV2ujBWAzxd67AshPRQzCOnekGbcZoQghSLXiXtbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKxJqoCbQXTfjT/VA/xD4F5Z8mPoTH9d0pPXsIXdnymrtjWz5zPCamAVpL33h9Vt9Dp5Uq9mFB0fRCKNegTgMYnJh/L+QC2ib4N8umw8OnQQeX+LNYIt1M+RvhIyFq2eAa/Csky39GElpeq6g/OYpU28dIlGh1LJWdueVWpus+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SVY+Kd8Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 043A022F;
	Fri, 15 Nov 2024 00:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731626804;
	bh=7MkV2ujBWAzxd67AshPRQzCOnekGbcZoQghSLXiXtbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVY+Kd8ZhKXlhoq7l1vIlUNS5Wh2vKMAcGthRTZi8Fgbr27ujW7zfag1zmr6SPev9
	 nQy+9919Z1mF7EskgVZIAKtI2qyRVnONVCYDfsnQiOr0wn7G0s8s0CrM0cxN9VLwLf
	 WR/VcsC6+YjsRjygMO/UOYpgTLhgd56lJa+4m3DM=
Date: Fri, 15 Nov 2024 01:26:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v7 2/2] media: uvcvideo: Add new quirk definition for the
 Sonix Technology Co. 292a camera
Message-ID: <20241114232649.GF31681@pendragon.ideasonboard.com>
References: <20241112112926.17848-1-isaac.scott@ideasonboard.com>
 <20241112112926.17848-3-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112112926.17848-3-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Tue, Nov 12, 2024 at 11:29:26AM +0000, Isaac Scott wrote:
> Add the definition of a new quirk that supports the Sonix Technology
> Co. 292A camera, which uses the AR0330 sensor. The camera supports the
> output of two simultaneous streams, which need to be handled
> appropriately by the driver.

The fact that the camera can output two streams isn't an issue, the
problem is that it suffers from the packet drop issue. I would write
something along the lines of

The Sonix Technology Co. 292A camera (which uses an AR0330 sensor), can
produce MJPEG and H.264 streams concurrently. When doing so, it drops
the last packets of MJPEG frames every time the H.264 stream generates a
key frame. Set the UVC_QUIRK_MJPEG_NO_EOF quick to work around the
issue.


If you're fine with that, you can just let me know and I'll make the
change when applying the patch. There's no need to resubmit the series
just for this. 

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 0fac689c6350..15aee3f2b5f9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2752,6 +2752,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +	/* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x0c45,
> +	  .idProduct		= 0x6366,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
>  	/* MT6227 */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart

