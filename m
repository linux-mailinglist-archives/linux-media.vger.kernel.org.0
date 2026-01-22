Return-Path: <linux-media+bounces-51310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNTpFiSFcWk1IAAAu9opvQ
	(envelope-from <linux-media+bounces-51310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 03:02:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DDB60A9D
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 03:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C4D8445B39
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 01:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B317034DCFC;
	Thu, 22 Jan 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RyWG3jDl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39C2E764C;
	Thu, 22 Jan 2026 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047090; cv=none; b=nUqb1vT3gjIG2+A9FCXjs1Ts5/WAQYChhm9UPdXAgntYMvMqB3BmiutlkC968vlOL7xSA86+a9jz/r1g+VzQZO9i2ZxlkKaFmYOvFMhQbjL9QZA/n4BruIXfWQjdCjhwfZR7sEYyMmx2mAvMdrYzNe3C9Y1tCY8QR7ndxOLo6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047090; c=relaxed/simple;
	bh=2hEzQvkfXRd2dgXFNapWgfSJabTaxDQt/CraxNkPkOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVjPeKuM28uEn0gCFeC2Qh8jVgDVOJhyKrEcybImdjU465wM23lDvMx/CmkdczI8XXYSjmrj95AJ1YRieenUHWqogDJGqyOY80ohY71MiNCPGK1bvUn23ws8a4HrjbKSWr6cmAbcUxze776cGSEG8nGvYz+0OhGXr5bf4g79CNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RyWG3jDl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3C8D02DD;
	Thu, 22 Jan 2026 02:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769047053;
	bh=2hEzQvkfXRd2dgXFNapWgfSJabTaxDQt/CraxNkPkOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RyWG3jDldkR+PSwxPHUbdiQzJ/kONadW5StHwNtFbFEAaChlo2/1WZdHbBwUQi46G
	 BvRwdAa8FGcYBAvFv8UxykYWAMhk4BK1ngxcXHZcBl2wBqj249jNWYA6PclYG51zyx
	 bU5szkmECO5m10uriYcy1t6/Pbn2vc3m11CLSHr4=
Date: Thu, 22 Jan 2026 03:58:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: yogev.modlin@realsenseai.com
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: uvcvideo: change comment to 'Intel
 RealSense'
Message-ID: <20260122015804.GD183118@killaraus>
References: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com>
 <20251026-fix-uvc-v4-1-610eb1329600@realsenseai.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251026-fix-uvc-v4-1-610eb1329600@realsenseai.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51310-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 20DDB60A9D
X-Rspamd-Action: no action

Hi Yogev,

On Sun, Oct 26, 2025 at 06:43:02PM +0200, ymodlin via B4 Relay wrote:
> From: ymodlin <yogev.modlin@realsenseai.com>
> 
> RealSense branding is now independent of Intel. Update all driver
> comments referencing "Intel" to "Intel RealSense" to reflect
> current ownership. No code logic changes.
> 
> Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>

I just noticed that the SoB line (as well as the From line) uses
"ymodlin" as a name, while the kernel policy is to use the author's real
name. I assume this was caused by an oversight in the configuration of
git or b4. Can I replace "ymodlin" with "Yogev Modlin" in patches 1/2
and 2/2 ?

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index fb6afb8e84f0..dbdacc64ea6b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> -	/* Intel D410/ASR depth camera */
> +	/* Intel Realsense D410/ASR depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D415/ASRC depth camera */
> +	/* Intel Realsense D415/ASRC depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D430/AWG depth camera */
> +	/* Intel Realsense D430/AWG depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel RealSense D4M */
> +	/* Intel Realsense RealSense D4M */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D435/AWGC depth camera */
> +	/* Intel Realsense D435/AWGC depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D435i depth camera */
> +	/* Intel Realsense D435i depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D405 Depth Camera */
> +	/* Intel Realsense D405 Depth Camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D455 Depth Camera */
> +	/* Intel Realsense D455 Depth Camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,
> @@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -	/* Intel D421 Depth Module */
> +	/* Intel Realsense D421 Depth Module */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x8086,

-- 
Regards,

Laurent Pinchart

