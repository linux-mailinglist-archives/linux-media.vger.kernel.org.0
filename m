Return-Path: <linux-media+bounces-17131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926296446B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CB641C222F4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD690195FE8;
	Thu, 29 Aug 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YN8/oQtI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6BC1922FA
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934541; cv=none; b=otMs+MyumvwQY4RsgYdXmgq6k/fpkmJSrHK66Eqb6GOaLmZa7vJ35rgLMlt1ojPNNknicCOLZfb6KbXp13w7hJqNc5rZkFnVC/q6vcnfXI6IOVSp3A5q5J7Tg3uYBrrvZh7nd6PVygvPXDFmupjGAFlWOy5wzFTi57o9xV3C3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934541; c=relaxed/simple;
	bh=jcU/9On/080VAEzqmHfiCC6LrStXdNi43hCSeDPrb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7+HysK81LMJe9Z9mw7EfXbbZoyDupzLACFYykGbBRn4LQif8x76tsijlpezRV5Hz7u439OKu8WYb1c++l0DgUZKttCrxeVgoNQ98FRzhMW7mdyXzCbSnsQi1yySH8PGS1pVcPq+b3x/gm4fpYMZm3uNrq70mU7tbZh+xKU28DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YN8/oQtI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BC266AF;
	Thu, 29 Aug 2024 14:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724934469;
	bh=jcU/9On/080VAEzqmHfiCC6LrStXdNi43hCSeDPrb20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YN8/oQtIjo/gNDHM36nryoPHC9dbFHPEVMKT/rKE7HtEd2MxED1WH4khBKBhFQay6
	 deSWIiQJQTuaTcFXBUpgSGyJtf4NV5AnYq5/UvmoyD7Qg9SPcgRgFOW3MnbO58dWo7
	 dkTOHZc+0G4HisxsWjcJLhAbs9OM9VvzTAweo8hc=
Date: Thu, 29 Aug 2024 15:28:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Amil Sanan <amilsananak@gmail.com>
Cc: linux-media@vger.kernel.org, dan.scally@ideasonboard.com
Subject: Re: added a new device in uvc_video.c
Message-ID: <20240829122827.GB12951@pendragon.ideasonboard.com>
References: <CABprV6SKOJCZBG795YBj1M5UAZP1_nR1aC+-ctxALv4nv-ST6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABprV6SKOJCZBG795YBj1M5UAZP1_nR1aC+-ctxALv4nv-ST6A@mail.gmail.com>

Hello Amil,

Thank you for the patch.

HTML e-mails are filtered by kernel mailing lists. Could you please
resent this as plain-text e-mail ? I recommend using git-send-email to
do so. If you have trouble setting it up for your e-mail provider,
https://git-send-email.io/ can help.

On Thu, Aug 29, 2024 at 05:47:53PM +0530, Amil Sanan wrote:
> it is a webcam on new 'acer aspire 7' laptop

> From d18ad3bf9bbc93da3eeb0ca4ea6598955ac05a99 Mon Sep 17 00:00:00 2001
> From: amilsanan <amilsananak@gmail.com>
> Date: Thu, 29 Aug 2024 17:38:25 +0530
> Subject: [PATCH] add a device in uvc_driver
> 
> Signed-off-by: amilsanan <amilsananak@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08..1a3229ab6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2441,6 +2441,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
>  		.uvc_version = 0x010a,
>  	  } },

Please add a comment with the device name here, to match the other
entroes.

> +	  { .match_flags 	= USB_DEVICE_ID_MATCH_DEVICE
> +			| USB_DEVICE_ID_MATCH_INT_INFO,

Wrong indentation.

> +	  .idVendor = 0x0408,
> +	  .idProduct = 0x4033,

Entries need to be sorted by VID:PID.

> +	  .bInterfaceClass = USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass = 1,
> +	  .bInterfaceProtocol =	UVC_PC_PROTOCOL_15,

There's a stray tab after '=', it should be a space.

> +	  .driver_info = (kernel_ulong_t) &(const struct uvc_device_info ) 
> +		{.uvc_version = 0x010a, } },

Did you try to use the driver without adding this entry ? Did if fail ?
If so, how ? All that should be explained in the commit message.

Please also provide the output of 'lsusb -v -d 0408:4033' (if possible
running as root).

>  	/* LogiLink Wireless Webcam */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart

