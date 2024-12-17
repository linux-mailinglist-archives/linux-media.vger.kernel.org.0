Return-Path: <linux-media+bounces-23575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CB9F4A54
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9B1188F831
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EB41F03C7;
	Tue, 17 Dec 2024 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n06mRt0x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA91EE002
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436471; cv=none; b=tzeuwIsLJn7KHdBBN47EfXF6EOpjDBgaamB4hUqWq1BvHgYAK5/Qr5iaKIwUJCinH7No34bDpb8XVEKl1LkErnvvXd+8AeuuViypxAMnvAuc7gQSsJawnRPDbC7yDesZCRlunuE09yGTymKI3qs9iaTDpIpAcCIyn9VSv2fuZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436471; c=relaxed/simple;
	bh=jnZ9jc0Lx15jobN1gcJVrOuFhyOXx6OGQEHnWf/Fcv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tep+NeIZwBDS6/V2G3bmtKf4sdQnmgDNYZ0NzqjDUG49rDdNRjEdevEdWTYlh0J0SaarTYWovW/AXTRaujSxBj4oWnCPP7EWhyO4yjoSyL1Xvyb2CWhw7vuBoJCpnQNV15vO58Hk6ytyf97Qb7NDNspbSNhiXfEQhAOPCAhvr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n06mRt0x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5FC4C7;
	Tue, 17 Dec 2024 12:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734436431;
	bh=jnZ9jc0Lx15jobN1gcJVrOuFhyOXx6OGQEHnWf/Fcv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n06mRt0xQ1q/3Kd5ZvHULQW1RIOJ3JtD+Drha07YJUQOzer4loqSA6/eRdDWtLIsZ
	 pTcVUDpKxra/CW9Dlq8PGzNuC4naiZGBXIf4NFBhMGyxLh42EftL5SQwKS70lst8Ea
	 H9Gca0uIzaXDFBr9T8uHGzV1dNahrBJAWixNVNls=
Date: Tue, 17 Dec 2024 13:54:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/2] media: uvcvideo: Add Kurokesu C1 PRO camera
Message-ID: <20241217115426.GA2025@pendragon.ideasonboard.com>
References: <20241128145144.61475-1-isaac.scott@ideasonboard.com>
 <20241217111351.1890805-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217111351.1890805-1-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Tue, Dec 17, 2024 at 11:13:51AM +0000, Isaac Scott wrote:
> Add support for the Kurokesu C1 PRO camera. This camera
> experiences the same issues faced by the Sonix Technology Co. 292A IPC
> AR0330. As such, enable the UVC_QUIRK_MJPEG_NO_EOF quirk for this device
> to prevent frames from being erroneously dropped.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
> This camera experiences the same issues as the other camera in this
> series. As it is dependent on the series that is not yet merged, I am
> appending it here so they can be merged together.
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1d029ef654bd..45028b45906a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2768,6 +2768,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
> +	/* Kurokesu C1 PRO */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x16d0,
> +	  .idProduct		= 0x0ed1,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },

Please keep entries sorted by VID:PID. I'll fix this locally, there's no
need to send a new version, but please remember this for the future.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* MT6227 */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart

