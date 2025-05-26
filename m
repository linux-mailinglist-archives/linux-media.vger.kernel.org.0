Return-Path: <linux-media+bounces-33394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71AAC407E
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178DA1899298
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787D920B813;
	Mon, 26 May 2025 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KHrUpMK9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62683146D6A;
	Mon, 26 May 2025 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266388; cv=none; b=Lg27ACeAmlqn0wmQ9BZZBwP0Edm/64aTL8tmqnVe1tePizB1SBcxDLg629iWHRT95B7dR7xzcyfldyMZkb/S7TYfhnQq4YM4SwqGvy1y4mi+AWTa/P3Ns7ddWhKXAFePd9uouNRJTKo0/2Xmt8YeFe8W0BWORxS03yIrRx7d0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266388; c=relaxed/simple;
	bh=OzdKCVK89HUK0Sh1jTsYoiLsuu8JychHcxoYN4r1Evs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pcug3kKYglvks51OYVGeqDZCd4+VBPY6eLBeLIyvDGy+7lP829poJ1IsVXDh3BL6XrhzOHLRrG108nYQ5xEBqYazlAhngF9TGmDkSyKWWW3OD90ov4UyFjGaO18XWySmcHdvxv1Rz8ahVWG1Q9FVVwOsDjU0dBh4OGovZwNi7Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KHrUpMK9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD2DC982;
	Mon, 26 May 2025 15:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748266361;
	bh=OzdKCVK89HUK0Sh1jTsYoiLsuu8JychHcxoYN4r1Evs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHrUpMK961c2HiUyjfc1B7d9nwhRHwSmyy0E38QfFNEx2/zw31/+veWZwVMULTpzz
	 LhlCJj+o1rUUnbY5lwGmxgZKtj7asz1iwScUDnDXSmuTgV6MmDCkPRjJTWg0rs436F
	 4MSz3tVqTEM4J/lwYeQxBGs/DZVwxz1gCl40rYfs=
Date: Mon, 26 May 2025 15:32:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Populate all errors in uvc_probe()
Message-ID: <20250526133259.GL17743@pendragon.ideasonboard.com>
References: <20250523-uvc-followup-v2-1-487541656e83@chromium.org>
 <8fe337d5-c399-4546-b784-33e651ab608d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8fe337d5-c399-4546-b784-33e651ab608d@redhat.com>

On Mon, May 26, 2025 at 03:21:37PM +0200, Hans de Goede wrote:
> On 23-May-25 16:28, Ricardo Ribalda wrote:
> > Now we are replacing most of the error codes with -ENODEV.
> > Instead, Populate the error code from the functions called by
> > uvc_probe().
> > 
> > Take this opportunity to replace a generic error code from
> > uvc_scan_device() into something more meaningful.
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> I have merged this into:
> 
> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/
> 
> now.

I was working on this :-/ As it stems from my review comments on v1, I'd
like an opportunity to check before you push.

> > ---
> > CodeStyle and refactor patches after the last uvc Pull Request.
> > ---
> > Changes in v2:
> > - Patches 1-3 will be handled by Laurent: https://lore.kernel.org/linux-media/20250523125840.GG12514@pendragon.ideasonboard.com/
> > - Properly propagate ret value. Sorry about that :)
> > - Link to v1: https://lore.kernel.org/r/20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index da24a655ab68cc0957762f2b67387677c22224d1..04552da114354128b0cc8fb25e1cc645498ac323 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
> >  
> >  	if (list_empty(&dev->chains)) {
> >  		dev_info(&dev->udev->dev, "No valid video chain found.\n");
> > -		return -1;
> > +		return -ENODEV;
> >  	}
> >  
> >  	/* Add GPIO entity to the first chain. */
> > @@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
> >  	/* Parse the Video Class control descriptor. */
> >  	ret = uvc_parse_control(dev);
> >  	if (ret < 0) {
> > -		ret = -ENODEV;
> >  		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> >  		goto error;
> >  	}
> > @@ -2275,22 +2274,19 @@ static int uvc_probe(struct usb_interface *intf,
> >  		goto error;
> >  
> >  	/* Scan the device for video chains. */
> > -	if (uvc_scan_device(dev) < 0) {
> > -		ret = -ENODEV;
> > +	ret = uvc_scan_device(dev);
> > +	if (ret < 0)
> >  		goto error;
> > -	}
> >  
> >  	/* Initialize controls. */
> > -	if (uvc_ctrl_init_device(dev) < 0) {
> > -		ret = -ENODEV;
> > +	ret = uvc_ctrl_init_device(dev);
> > +	if (ret < 0)
> >  		goto error;
> > -	}
> >  
> >  	/* Register video device nodes. */
> > -	if (uvc_register_chains(dev) < 0) {
> > -		ret = -ENODEV;
> > +	ret = uvc_register_chains(dev);
> > +	if (ret < 0)
> >  		goto error;
> > -	}
> >  
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >  	/* Register the media device node */
> > 
> > ---
> > base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
> > change-id: 20250509-uvc-followup-d97ff563df95

-- 
Regards,

Laurent Pinchart

