Return-Path: <linux-media+bounces-18506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5598470C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 15:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15713B23004
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3851A727F;
	Tue, 24 Sep 2024 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cGplEXP9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594531EEF9;
	Tue, 24 Sep 2024 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727185757; cv=none; b=qwx9gncw5yxn5coGEe3Gsyie0n3yE3dIQSebNTKZettUgNcT+pUJ8j5JaSL+fIZ9NMwl4g1lS2312LgzQA4hU6SpTMNxrK40zBp3kx8zruH3weTACIIb5YoqjbxfQrO9mv3Hd4iXODqjqiLNQEKb6auob0K2mtOo7hvW+rclwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727185757; c=relaxed/simple;
	bh=DbnEbLh4V8zjrQUyQ5qoZyzAd0e5QOfD46THC058YVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/P7QDxYh9BEFUjAVmHKQkR8zibsH8Dlc26BmQ2xwuv4OWLmDuMU9Y5/dMynK2/a5k0aZZ4INmmgE4hZiCp+asPkwLpiOEo4D1WYyacMPdHfTxnR8lH8tJSmwTr2USLJGlfFDxKwuIAlejOMj2GRPtj9P8nmOZ1g8y+Fiq/2ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cGplEXP9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 216C4827;
	Tue, 24 Sep 2024 15:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727185664;
	bh=DbnEbLh4V8zjrQUyQ5qoZyzAd0e5QOfD46THC058YVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGplEXP9Og13s6+kdqUmJ4A2fQd4wutGpSEKFB421sW39io+pDW4rXIEOa/T/rJy/
	 GnOCJ+Ygp3ISgblN8j2/vhibdpvN76W7/ylZYBNoY4uncF4i/7iYd0cqdHopn4GKlb
	 /ZQbUYA1eM1c9BZfoj9EyM0rWWMUD8tS4gQJo2DE=
Date: Tue, 24 Sep 2024 16:48:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giuliano Lotta <giuliano.lotta@gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4033
Message-ID: <20240924134839.GC20255@pendragon.ideasonboard.com>
References: <20240924-uvc-quanta-v1-1-2de023863767@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240924-uvc-quanta-v1-1-2de023863767@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Sep 24, 2024 at 01:33:29PM +0000, Ricardo Ribalda wrote:
> The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> long. Force the UVC version for that device.
> 
> Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> Closes: https://lore.kernel.org/linux-media/fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space/
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08c2d..cc62bdf77c08 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2431,6 +2431,17 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   */
>  static const struct usb_device_id uvc_ids[] = {
>  	/* Quanta ACER HD User Facing */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x0408,
> +	  .idProduct		= 0x4033,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
> +	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
> +		.uvc_version = 0x010a,
> +	  } },
> +	/* Quanta ACER HD User Facing */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x0408,
> 
> ---
> base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
> change-id: 20240924-uvc-quanta-52a120a277fe

-- 
Regards,

Laurent Pinchart

