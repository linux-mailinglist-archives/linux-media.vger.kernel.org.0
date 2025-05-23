Return-Path: <linux-media+bounces-33258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E8AC2345
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41120179088
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB23136349;
	Fri, 23 May 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XKN2k4dD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2D62576;
	Fri, 23 May 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005130; cv=none; b=DYgNZ9ml2JQhySRSaxe0DhxXyOR4z36DRa/Xv7j7xt2aZqAoIHgbkyqlMCZ2Nb8/gPE0Xsf0V2LMI0Z3fLqvyyxLpKRWtwr956A1buMDkhFSerpeKc9MsJdSOEJ2PKNDi1htUNq4iRqzU1+1oLQ6B73uUzdD+pPgf10FLNJdGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005130; c=relaxed/simple;
	bh=v6fVcPOFf8PxxeZFiJiWyocihRKFpRw9bNvbC4cGqWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvn5Qr8IiWrg/cU4yrchj+1tEfO4MzHXXR4hsXVmCLTqnVR2SQTlNVtvxZZ8h1MXd04zaS9FmWtVejTd6stMwdd5JWv5X1/baRnLAIR6YkAPH7ga3SuaICvneKSL9/HI0HYSL+Rtv9M5lfaaByNTTVJlMfzNAwxqFDJ/SUpbIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XKN2k4dD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82E144A4;
	Fri, 23 May 2025 14:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748005104;
	bh=v6fVcPOFf8PxxeZFiJiWyocihRKFpRw9bNvbC4cGqWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKN2k4dDA33bVB+T6vYYkVB89rFIdAM/Thi2seajjCJ9R8LfFa3WMcAV6Qcb/MJ2v
	 meEFhyDHbkXYpUhPyn54JBgkyR8/rDtxyLoEWsJnzdKIdo5VXLZSnhZBvWiJJu5+kN
	 jR3dXfckOYmAdrURrYa6UrUZ/fWOP2wvxHpF/4Jc=
Date: Fri, 23 May 2025 14:58:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: uvcvideo: Populate all errors in uvc_probe()
Message-ID: <20250523125840.GG12514@pendragon.ideasonboard.com>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-4-73bcde30d2b5@chromium.org>
 <20250523115759.GE12514@pendragon.ideasonboard.com>
 <CANiDSCsmhQFYwsPy8QNnrgrwKj3E9PHJbo+hKv_i-_70b-Wktw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsmhQFYwsPy8QNnrgrwKj3E9PHJbo+hKv_i-_70b-Wktw@mail.gmail.com>

On Fri, May 23, 2025 at 02:24:00PM +0200, Ricardo Ribalda wrote:
> On Fri, 23 May 2025 at 13:58, Laurent Pinchart wrote:
> > On Fri, May 09, 2025 at 06:24:16PM +0000, Ricardo Ribalda wrote:
> > > Now we are replacing most of the error codes with -ENODEV.
> > > Instead, Populate the error code from the functions called by
> > > uvc_probe().
> > >
> > > Take this opportunity to replace a generic error code from
> > > uvc_scan_device() into something more meaningful.
> > >
> > > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 15 ++++-----------
> > >  1 file changed, 4 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index da24a655ab68cc0957762f2b67387677c22224d1..cdf4bbe582272277a6a95267e9752010adc51b6b 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
> > >
> > >       if (list_empty(&dev->chains)) {
> > >               dev_info(&dev->udev->dev, "No valid video chain found.\n");
> > > -             return -1;
> > > +             return -ENODEV;
> > >       }
> > >
> > >       /* Add GPIO entity to the first chain. */
> > > @@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
> > >       /* Parse the Video Class control descriptor. */
> > >       ret = uvc_parse_control(dev);
> > >       if (ret < 0) {
> > > -             ret = -ENODEV;
> > >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> > >               goto error;
> > >       }
> > > @@ -2275,22 +2274,16 @@ static int uvc_probe(struct usb_interface *intf,
> > >               goto error;
> > >
> > >       /* Scan the device for video chains. */
> > > -     if (uvc_scan_device(dev) < 0) {
> > > -             ret = -ENODEV;
> > > +     if (uvc_scan_device(dev) < 0)
> >
> > That's not going to work. You probably meant
> >
> >         ret = uvc_scan_device(dev);
> >         if (ret < 0)
> 
> Ups, seems like I sent a partial path :S
> 
> Sorry about that. Shall I resend 4/4 or you want to take it as well?

Could you resend just 4/4 ? I'll handle the rest.

> > Same elsewhere where applicable.
> >
> > >               goto error;
> > > -     }
> > >
> > >       /* Initialize controls. */
> > > -     if (uvc_ctrl_init_device(dev) < 0) {
> > > -             ret = -ENODEV;
> > > +     if (uvc_ctrl_init_device(dev) < 0)
> > >               goto error;
> > > -     }
> > >
> > >       /* Register video device nodes. */
> > > -     if (uvc_register_chains(dev) < 0) {
> > > -             ret = -ENODEV;
> > > +     if (uvc_register_chains(dev) < 0)
> > >               goto error;
> > > -     }
> > >
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > >       /* Register the media device node */

-- 
Regards,

Laurent Pinchart

